     1                                  
     2                                  ; A.COM V0.9.2, Source: A.C, Output asm: A.S
     3                                  org  256 
     4 00000000 E92B43                  jmp main
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
   127                                  ;-40 #define COMAX        3000
   128                                  
   129                                  
   130                                  ;-41 char co[COMAX];//constant storage
   131                                  
   132                                  section .bss
   133                                  absolute 25000
   134 000061A8 <res 00000BB8>          co resb 3000
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
   151                                  absolute 28000
   152 00006D60 <res 00000043>          coname resb 67
   153                                  section .text
   154                                  
   155                                  ;-46 char symbol[COLUMNMAX];
   156                                  
   157                                  section .bss
   158                                  absolute 28067
   159 00006DA3 <res 00000080>          symbol resb 128
   160                                  section .text
   161                                  
   162                                  ;-47 char fname[CMDLENMAX];
   163                                  
   164                                  section .bss
   165                                  absolute 28195
   166 00006E23 <res 00000043>          fname resb 67
   167                                  section .text
   168                                  
   169                                  ;-48 char namein[CMDLENMAX];
   170                                  
   171                                  section .bss
   172                                  absolute 28262
   173 00006E66 <res 00000043>          namein resb 67
   174                                  section .text
   175                                  
   176                                  ;-49 char namelst[CMDLENMAX];
   177                                  
   178                                  section .bss
   179                                  absolute 28329
   180 00006EA9 <res 00000043>          namelst resb 67
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
   262                                  absolute 28396
   263 00006EEC <res 0000012C>          GType resb 300
   264                                  section .text
   265                                  
   266                                  ;-70 char GSign [VARMAX]; // 0=U, 1=S
   267                                  
   268                                  section .bss
   269                                  absolute 28696
   270 00007018 <res 0000012C>          GSign resb 300
   271                                  section .text
   272                                  
   273                                  ;-71 char GWidth[VARMAX]; // 0, 1, 2, 4
   274                                  
   275                                  section .bss
   276                                  absolute 28996
   277 00007144 <res 0000012C>          GWidth resb 300
   278                                  section .text
   279                                  
   280                                  ;-72 int GAdr  [VARMAX];
   281                                  
   282                                  section .bss
   283                                  absolute 29296
   284 00007270 <res 00000258>          GAdr resw 300
   285                                  section .text
   286                                  
   287                                  ;-73 int GUsed [VARMAX];
   288                                  
   289                                  section .bss
   290                                  absolute 29896
   291 000074C8 <res 00000258>          GUsed resw 300
   292                                  section .text
   293                                  
   294                                  ;-74 int GData [VARMAX];
   295                                  
   296                                  section .bss
   297                                  absolute 30496
   298 00007720 <res 00000258>          GData resw 300
   299                                  section .text
   300                                  
   301                                  ;-75 char GNameField[GNAMEMAX];
   302                                  
   303                                  section .bss
   304                                  absolute 31096
   305 00007978 <res 000012C0>          GNameField resb 4800
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
   325                                  absolute 35896
   326 00008C38 <res 0000012C>          FType resb 300
   327                                  section .text
   328                                  
   329                                  ;-81 int  FAdr  [FUNCMAX];
   330                                  
   331                                  section .bss
   332                                  absolute 36196
   333 00008D64 <res 00000258>          FAdr resw 300
   334                                  section .text
   335                                  
   336                                  ;-82 int  FCalls[FUNCMAX];
   337                                  
   338                                  section .bss
   339                                  absolute 36796
   340 00008FBC <res 00000258>          FCalls resw 300
   341                                  section .text
   342                                  
   343                                  ;-83 char FNameField[FNAMEMAX];
   344                                  
   345                                  section .bss
   346                                  absolute 37396
   347 00009214 <res 000012C0>          FNameField resb 4800
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
   360                                  absolute 42196
   361 0000A4D4 <res 000005DC>          CType resb 1500
   362                                  section .text
   363                                  
   364                                  ;-87 int  CAdr [CALLMAX]; //start of nameof address in CNameField
   365                                  
   366                                  section .bss
   367                                  absolute 43696
   368 0000AAB0 <res 00000BB8>          CAdr resw 1500
   369                                  section .text
   370                                  
   371                                  ;-88 #define CNAMEMAX    10000//space for call names
   372                                  
   373                                  
   374                                  ;-89 char CNameField[10016];//CNAMEMAX+IDLENMAX+1
   375                                  
   376                                  section .bss
   377                                  absolute 46696
   378 0000B668 <res 00002720>          CNameField resb 10016
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
   399                                  absolute 56712
   400 0000DD88 <res 00000080>          fgetsdest resb 128
   401                                  section .text
   402                                  
   403                                  ;-95 unsigned char *fgetsp=0;
   404                                  
   405 00000045 0000                    fgetsp dw 0
   406                                  
   407                                  ;-96 unsigned int lineno=1;
   408                                  
   409 00000047 0100                    lineno dw 1
   410                                  
   411                                  ;-97 unsigned char *pt=0;
   412                                  
   413 00000049 0000                    pt dw 0
   414                                  
   415                                  ;-98 unsigned char *p1=0;
   416                                  
   417 0000004B 0000                    p1 dw 0
   418                                  
   419                                  ;-99 int DOS_ERR=0;
   420                                  
   421 0000004D 0000                    DOS_ERR dw 0
   422                                  
   423                                  ;-100 int DOS_NoBytes=0;
   424                                  
   425 0000004F 0000                    DOS_NoBytes dw 0
   426                                  
   427                                  ;-101 char DOS_ByteRead=0;
   428                                  
   429 00000051 00                      DOS_ByteRead db 0
   430                                  
   431                                  ;-102 int ireg1;
   432                                  
   433 00000052 0000                    ireg1 dw 0
   434                                  
   435                                  ;-103 int mod2;
   436                                  
   437 00000054 0000                    mod2 dw 0
   438                                  
   439                                  ;-104 int ireg2;
   440                                  
   441 00000056 0000                    ireg2 dw 0
   442                                  
   443                                  ;-105 
   444                                  
   445                                  
   446                                  ;-106 int writetty()     { ah=0x0E; bx=0; __emit__(0xCD,0x10); }
   447                                  
   448                                  
   449                                  writetty: PROC
   450 00000058 B40E                     mov  ah, 14
   451 0000005A BB0000                   mov  bx, 0
   452 0000005D CD10                     db 205,16
   453                                  
   454                                  ;-107 int putch(char c)  {if (c==10) {al=13; writetty();} al=c; writetty(); }
   455                                  
   456 0000005F C3                       ret
   457                                  ENDP
   458                                  
   459                                  putch: PROC;
   460 00000060 C8000000                 ENTER  0,0
   461 00000064 8A4604                   mov al, [bp+4]
   462 00000067 3C0A                     cmp al, 10
   463 00000069 0F850500                 jne .putch1
   464 0000006D B00D                     mov  al, 13
   465 0000006F E8E6FF                   call writetty
   466                                  .putch1:
   467 00000072 8A4604                   mov  al, [bp+4]
   468 00000075 E8E0FF                   call writetty
   469                                  
   470                                  ;-108 int cputs(char *s) {char c;  while(*s) { c=*s; putch(c); s++; } }
   471 00000078 C9                       LEAVE
   472 00000079 C3                       ret
   473                                  ENDP
   474                                  
   475                                  cputs: PROC;
   476 0000007A C8020000                 ENTER  2,0
   477                                  .cputs2:
   478 0000007E 8B5E04                   mov bx, [bp+4]
   479 00000081 8A07                     mov al, [bx]
   480 00000083 B400                     mov ah, 0
   481 00000085 08C0                     or  al, al
   482 00000087 0F841B00                 je .cputs3
   483 0000008B 8B5E04                   mov bx, [bp+4]
   484 0000008E 8A07                     mov al, [bx]
   485 00000090 B400                     mov ah, 0
   486 00000092 8846FE                   mov [bp-2], al
   487 00000095 8A46FE                   mov al, byte [bp-2]
   488 00000098 B400                     mov ah, 0
   489 0000009A 50                       push ax
   490 0000009B E8C2FF                   call putch
   491 0000009E 83C402                   add  sp, 2
   492 000000A1 FF4604                   inc  word[bp+4]
   493 000000A4 EBD8                     jmp .cputs2
   494                                  .cputs3:
   495                                  
   496                                  ;-109 int mkneg(int n)   { n; __asm {neg ax} }
   497 000000A6 C9                       LEAVE
   498 000000A7 C3                       ret
   499                                  ENDP
   500                                  
   501                                  mkneg: PROC;
   502 000000A8 C8000000                 ENTER  0,0
   503 000000AC 8B4604                   mov ax, [bp+4]
   504 000000AF F7D8                    neg ax
   505                                  
   506                                  ;-110 
   507                                  
   508                                  
   509                                  ;-111 int DosInt() {
   510 000000B1 C9                       LEAVE
   511 000000B2 C3                       ret
   512                                  ENDP
   513                                  
   514                                  DosInt: PROC
   515                                  
   516                                  ;-112     __emit__(0xCD,0x21);//inth 0x21;
   517                                  
   518 000000B3 CD21                     db 205,33
   519                                  
   520                                  ;-113     __emit__(0x73, 04); //ifcarry DOS_ERR++;
   521                                  
   522 000000B5 7304                     db 115,4
   523                                  
   524                                  ;-114     DOS_ERR++;
   525                                  
   526 000000B7 FF06[4D00]               inc  word[DOS_ERR]
   527                                  
   528                                  ;-115 }
   529                                  
   530                                  
   531                                  ;-116 int openR (char *s) { dx=s;       ax=0x3D02; DosInt(); }
   532                                  
   533 000000BB C3                       ret
   534                                  ENDP
   535                                  
   536                                  openR: PROC;
   537 000000BC C8000000                 ENTER  0,0
   538 000000C0 8B5604                   mov  dx, [bp+4]
   539 000000C3 B8023D                   mov  ax, 15618
   540 000000C6 E8EAFF                   call DosInt
   541                                  
   542                                  ;-117 int creatR(char *s) { dx=s; cx=0; ax=0x3C00; DosInt(); }
   543 000000C9 C9                       LEAVE
   544 000000CA C3                       ret
   545                                  ENDP
   546                                  
   547                                  creatR: PROC;
   548 000000CB C8000000                 ENTER  0,0
   549 000000CF 8B5604                   mov  dx, [bp+4]
   550 000000D2 B90000                   mov  cx, 0
   551 000000D5 B8003C                   mov  ax, 15360
   552 000000D8 E8D8FF                   call DosInt
   553                                  
   554                                  ;-118 int fcloseR(int fd) {bx=fd;       ax=0x3E00; DosInt(); }
   555 000000DB C9                       LEAVE
   556 000000DC C3                       ret
   557                                  ENDP
   558                                  
   559                                  fcloseR: PROC;
   560 000000DD C8000000                 ENTER  0,0
   561 000000E1 8B5E04                   mov  bx, [bp+4]
   562 000000E4 B8003E                   mov  ax, 15872
   563 000000E7 E8C9FF                   call DosInt
   564                                  
   565                                  ;-119 int exitR  (char c) {ah=0x4C; al=c;          DosInt(); }
   566 000000EA C9                       LEAVE
   567 000000EB C3                       ret
   568                                  ENDP
   569                                  
   570                                  exitR: PROC;
   571 000000EC C8000000                 ENTER  0,0
   572 000000F0 B44C                     mov  ah, 76
   573 000000F2 8A4604                   mov  al, [bp+4]
   574 000000F5 E8BBFF                   call DosInt
   575                                  
   576                                  ;-120 int readRL(char *s, int fd, int len){
   577 000000F8 C9                       LEAVE
   578 000000F9 C3                       ret
   579                                  ENDP
   580                                  
   581                                  readRL: PROC
   582                                  
   583                                  ;-121     dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}
   584                                  ;
   585 000000FA C8000000                 ENTER  0,0
   586 000000FE 8B5604                   mov  dx, [bp+4]
   587 00000101 8B4E08                   mov  cx, [bp+8]
   588 00000104 8B5E06                   mov  bx, [bp+6]
   589 00000107 B8003F                   mov  ax, 16128
   590 0000010A E8A6FF                   call DosInt
   591                                  
   592                                  ;-122 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
   593 0000010D C9                       LEAVE
   594 0000010E C3                       ret
   595                                  ENDP
   596                                  
   597                                  fputcR: PROC;
   598 0000010F C8000000                 ENTER  0,0
   599 00000113 8D5604                  lea dx, [bp+4]
   600                                  
   601                                  ;-123   cx=1; bx=fd; ax=0x4000; DosInt(); }
   602                                  
   603 00000116 B90100                   mov  cx, 1
   604 00000119 8B5E06                   mov  bx, [bp+6]
   605 0000011C B80040                   mov  ax, 16384
   606 0000011F E891FF                   call DosInt
   607                                  
   608                                  ;-124 
   609                                  
   610                                  
   611                                  ;-125   int letter(char c) {
   612 00000122 C9                       LEAVE
   613 00000123 C3                       ret
   614                                  ENDP
   615                                  
   616                                  letter: PROC
   617                                  
   618                                  ;-126       if (c=='_') return 1;
   619                                  ;
   620 00000124 C8000000                 ENTER  0,0
   621 00000128 8A4604                   mov al, [bp+4]
   622 0000012B 3C5F                     cmp al, 95
   623 0000012D 0F850600                 jne .letter4
   624 00000131 B80100                   mov ax, 1
   625 00000134 E96900                   jmp .retnletter
   626                                  
   627                                  ;-127       if (c=='.') return 1;
   628                                  
   629                                  .letter4:
   630 00000137 8A4604                   mov al, [bp+4]
   631 0000013A 3C2E                     cmp al, 46
   632 0000013C 0F850600                 jne .letter5
   633 00000140 B80100                   mov ax, 1
   634 00000143 E95A00                   jmp .retnletter
   635                                  
   636                                  ;-128       if (c=='?') return 1;
   637                                  
   638                                  .letter5:
   639 00000146 8A4604                   mov al, [bp+4]
   640 00000149 3C3F                     cmp al, 63
   641 0000014B 0F850600                 jne .letter6
   642 0000014F B80100                   mov ax, 1
   643 00000152 E94B00                   jmp .retnletter
   644                                  
   645                                  ;-129       if (c=='$') return 1;
   646                                  
   647                                  .letter6:
   648 00000155 8A4604                   mov al, [bp+4]
   649 00000158 3C24                     cmp al, 36
   650 0000015A 0F850600                 jne .letter7
   651 0000015E B80100                   mov ax, 1
   652 00000161 E93C00                   jmp .retnletter
   653                                  
   654                                  ;-130       if (c> 'z') return 0;
   655                                  
   656                                  .letter7:
   657 00000164 8A4604                   mov al, [bp+4]
   658 00000167 3C7A                     cmp al, 122
   659 00000169 0F8E0600                 jle .letter8
   660 0000016D B80000                   mov ax, 0
   661 00000170 E92D00                   jmp .retnletter
   662                                  
   663                                  ;-131       if (c< '@') return 0;// at included
   664                                  
   665                                  .letter8:
   666 00000173 8A4604                   mov al, [bp+4]
   667 00000176 3C40                     cmp al, 64
   668 00000178 0F8D0600                 jge .letter9
   669 0000017C B80000                   mov ax, 0
   670 0000017F E91E00                   jmp .retnletter
   671                                  
   672                                  ;-132       if (c> 'Z') { if (c< 'a') return 0; }
   673                                  
   674                                  .letter9:
   675 00000182 8A4604                   mov al, [bp+4]
   676 00000185 3C5A                     cmp al, 90
   677 00000187 0F8E0F00                 jle .letter10
   678 0000018B 8A4604                   mov al, [bp+4]
   679 0000018E 3C61                     cmp al, 97
   680 00000190 0F8D0600                 jge .letter11
   681 00000194 B80000                   mov ax, 0
   682 00000197 E90600                   jmp .retnletter
   683                                  .letter11:
   684                                  
   685                                  ;-133       return 1;
   686                                  
   687                                  .letter10:
   688 0000019A B80100                   mov ax, 1
   689 0000019D E90000                   jmp .retnletter
   690                                  
   691                                  ;-134   }
   692                                  
   693                                  
   694                                  ;-135   int digit(char c){
   695                                  
   696 000001A0 C9                       .retnletter: LEAVE
   697 000001A1 C3                       ret
   698                                  ENDP
   699                                  
   700                                  digit: PROC
   701                                  
   702                                  ;-136       if(c<'0') return 0;
   703                                  ;
   704 000001A2 C8000000                 ENTER  0,0
   705 000001A6 8A4604                   mov al, [bp+4]
   706 000001A9 3C30                     cmp al, 48
   707 000001AB 0F8D0600                 jge .digit12
   708 000001AF B80000                   mov ax, 0
   709 000001B2 E91500                   jmp .retndigit
   710                                  
   711                                  ;-137       if(c>'9') return 0;
   712                                  
   713                                  .digit12:
   714 000001B5 8A4604                   mov al, [bp+4]
   715 000001B8 3C39                     cmp al, 57
   716 000001BA 0F8E0600                 jle .digit13
   717 000001BE B80000                   mov ax, 0
   718 000001C1 E90600                   jmp .retndigit
   719                                  
   720                                  ;-138       return 1;
   721                                  
   722                                  .digit13:
   723 000001C4 B80100                   mov ax, 1
   724 000001C7 E90000                   jmp .retndigit
   725                                  
   726                                  ;-139   }
   727                                  
   728                                  
   729                                  ;-140   int alnum(char c) {
   730                                  
   731 000001CA C9                       .retndigit: LEAVE
   732 000001CB C3                       ret
   733                                  ENDP
   734                                  
   735                                  alnum: PROC
   736                                  
   737                                  ;-141     if (digit (c)) return 1;
   738                                  ;
   739 000001CC C8000000                 ENTER  0,0
   740 000001D0 8A4604                   mov al, byte [bp+4]
   741 000001D3 B400                     mov ah, 0
   742 000001D5 50                       push ax
   743 000001D6 E8C9FF                   call digit
   744 000001D9 83C402                   add  sp, 2
   745 000001DC 08C0                     or  al, al
   746 000001DE 0F840600                 je .alnum14
   747 000001E2 B80100                   mov ax, 1
   748 000001E5 E91E00                   jmp .retnalnum
   749                                  
   750                                  ;-142     if (letter(c)) return 1;
   751                                  
   752                                  .alnum14:
   753 000001E8 8A4604                   mov al, byte [bp+4]
   754 000001EB B400                     mov ah, 0
   755 000001ED 50                       push ax
   756 000001EE E833FF                   call letter
   757 000001F1 83C402                   add  sp, 2
   758 000001F4 08C0                     or  al, al
   759 000001F6 0F840600                 je .alnum15
   760 000001FA B80100                   mov ax, 1
   761 000001FD E90600                   jmp .retnalnum
   762                                  
   763                                  ;-143     return 0;
   764                                  
   765                                  .alnum15:
   766 00000200 B80000                   mov ax, 0
   767 00000203 E90000                   jmp .retnalnum
   768                                  
   769                                  ;-144   }
   770                                  
   771                                  
   772                                  ;-145 
   773                                  
   774                                  
   775                                  ;-146 int strlen(char *s) { int c;
   776                                  
   777 00000206 C9                       .retnalnum: LEAVE
   778 00000207 C3                       ret
   779                                  ENDP
   780                                  
   781                                  strlen: PROC
   782                                  
   783                                  ;-147     c=0;
   784                                  ;
   785 00000208 C8020000                 ENTER  2,0
   786 0000020C B80000                   mov ax, 0
   787 0000020F 8946FE                   mov [bp-2], ax
   788                                  
   789                                  ;-148     while (*s!=0) {s++; c++;}
   790                                  
   791                                  .strlen16:
   792 00000212 8B5E04                   mov bx, [bp+4]
   793 00000215 8A07                     mov al, [bx]
   794 00000217 B400                     mov ah, 0
   795 00000219 83F800                   cmp ax, 0
   796 0000021C 0F840800                 je  .strlen17
   797 00000220 FF4604                   inc  word[bp+4]
   798 00000223 FF46FE                   inc  word[bp-2]
   799                                  
   800                                  ;-149     return c;
   801                                  
   802 00000226 EBEA                     jmp .strlen16
   803                                  .strlen17:
   804 00000228 8B46FE                   mov ax, [bp-2]
   805 0000022B E90000                   jmp .retnstrlen
   806                                  
   807                                  ;-150 }
   808                                  
   809                                  
   810                                  ;-151 int strcpy(char *s, char *t) {
   811                                  
   812 0000022E C9                       .retnstrlen: LEAVE
   813 0000022F C3                       ret
   814                                  ENDP
   815                                  
   816                                  strcpy: PROC
   817                                  
   818                                  ;-152     do { *s=*t; s++; t++; }
   819                                  ;
   820 00000230 C8000000                 ENTER  0,0
   821                                  .strcpy18:
   822 00000234 8B5E06                   mov bx, [bp+6]
   823 00000237 8A07                     mov al, [bx]
   824 00000239 B400                     mov ah, 0
   825 0000023B 8B5E04                   mov  bx, [bp+4]
   826 0000023E 8807                     mov  [bx], al
   827 00000240 FF4604                   inc  word[bp+4]
   828 00000243 FF4606                   inc  word[bp+6]
   829                                  
   830                                  ;-153     while (*t!=0);
   831                                  
   832 00000246 8B5E06                   mov bx, [bp+6]
   833 00000249 8A07                     mov al, [bx]
   834 0000024B B400                     mov ah, 0
   835 0000024D 83F800                   cmp ax, 0
   836 00000250 0F840200                 je  .strcpy19
   837 00000254 EBDE                     jmp .strcpy18
   838                                  .strcpy19:
   839                                  
   840                                  ;-154     *s=0;
   841                                  
   842 00000256 B80000                   mov ax, 0
   843 00000259 8B5E04                   mov  bx, [bp+4]
   844 0000025C 8807                     mov  [bx], al
   845                                  
   846                                  ;-155     return s;
   847                                  
   848 0000025E 8B4604                   mov ax, [bp+4]
   849 00000261 E90000                   jmp .retnstrcpy
   850                                  
   851                                  ;-156 }
   852                                  
   853                                  
   854                                  ;-157 int eqstr(char *p, char *q) {
   855                                  
   856 00000264 C9                       .retnstrcpy: LEAVE
   857 00000265 C3                       ret
   858                                  ENDP
   859                                  
   860                                  eqstr: PROC
   861                                  
   862                                  ;-158     while(*p) {
   863                                  ;
   864 00000266 C8000000                 ENTER  0,0
   865                                  .eqstr20:
   866 0000026A 8B5E04                   mov bx, [bp+4]
   867 0000026D 8A07                     mov al, [bx]
   868 0000026F B400                     mov ah, 0
   869 00000271 08C0                     or  al, al
   870 00000273 0F842000                 je .eqstr21
   871                                  
   872                                  ;-159         if (*p != *q) return 0;
   873                                  
   874 00000277 8B5E04                   mov bx, [bp+4]
   875 0000027A 8A07                     mov al, [bx]
   876 0000027C B400                     mov ah, 0
   877 0000027E 8B5E06                   mov bx, [bp+6]
   878 00000281 3A07                     cmp al, [bx]
   879 00000283 B400                     mov ah, 0
   880 00000285 0F840600                 je  .eqstr22
   881 00000289 B80000                   mov ax, 0
   882 0000028C E92100                   jmp .retneqstr
   883                                  
   884                                  ;-160         p++;
   885                                  
   886                                  .eqstr22:
   887 0000028F FF4604                   inc  word[bp+4]
   888                                  
   889                                  ;-161         q++;
   890                                  
   891 00000292 FF4606                   inc  word[bp+6]
   892                                  
   893                                  ;-162     }
   894                                  
   895                                  
   896                                  ;-163     if(*q) return 0;
   897                                  
   898 00000295 EBD3                     jmp .eqstr20
   899                                  .eqstr21:
   900 00000297 8B5E06                   mov bx, [bp+6]
   901 0000029A 8A07                     mov al, [bx]
   902 0000029C B400                     mov ah, 0
   903 0000029E 08C0                     or  al, al
   904 000002A0 0F840600                 je .eqstr23
   905 000002A4 B80000                   mov ax, 0
   906 000002A7 E90600                   jmp .retneqstr
   907                                  
   908                                  ;-164     return 1; }
   909                                  
   910                                  .eqstr23:
   911 000002AA B80100                   mov ax, 1
   912 000002AD E90000                   jmp .retneqstr
   913                                  
   914                                  ;-165 int strcat1(char *s, char *t) {
   915                                  
   916 000002B0 C9                       .retneqstr: LEAVE
   917 000002B1 C3                       ret
   918                                  ENDP
   919                                  
   920                                  strcat1: PROC
   921                                  
   922                                  ;-166     while (*s != 0) s++;
   923                                  ;
   924 000002B2 C8000000                 ENTER  0,0
   925                                  .strcat124:
   926 000002B6 8B5E04                   mov bx, [bp+4]
   927 000002B9 8A07                     mov al, [bx]
   928 000002BB B400                     mov ah, 0
   929 000002BD 83F800                   cmp ax, 0
   930 000002C0 0F840500                 je  .strcat125
   931 000002C4 FF4604                   inc  word[bp+4]
   932                                  
   933                                  ;-167     strcpy(s, t);
   934                                  
   935 000002C7 EBED                     jmp .strcat124
   936                                  .strcat125:
   937 000002C9 FF7606                   push word [bp+6]
   938 000002CC FF7604                   push word [bp+4]
   939 000002CF E85EFF                   call strcpy
   940 000002D2 83C404                   add  sp, 4
   941                                  
   942                                  ;-168 }
   943                                  
   944                                  
   945                                  ;-169 int toupper(char *s) {
   946 000002D5 C9                       LEAVE
   947 000002D6 C3                       ret
   948                                  ENDP
   949                                  
   950                                  toupper: PROC
   951                                  
   952                                  ;-170     while(*s) {
   953                                  ;
   954 000002D7 C8000000                 ENTER  0,0
   955                                  .toupper26:
   956 000002DB 8B5E04                   mov bx, [bp+4]
   957 000002DE 8A07                     mov al, [bx]
   958 000002E0 B400                     mov ah, 0
   959 000002E2 08C0                     or  al, al
   960 000002E4 0F843000                 je .toupper27
   961                                  
   962                                  ;-171         if (*s >= 'a') if (*s <= 'z') *s=*s-32;
   963                                  
   964 000002E8 8B5E04                   mov bx, [bp+4]
   965 000002EB 8A07                     mov al, [bx]
   966 000002ED B400                     mov ah, 0
   967 000002EF 83F861                   cmp ax, 97 ;unsigned : 1
   968 000002F2 0F8C1D00                 jl  .toupper28
   969 000002F6 8B5E04                   mov bx, [bp+4]
   970 000002F9 8A07                     mov al, [bx]
   971 000002FB B400                     mov ah, 0
   972 000002FD 83F87A                   cmp ax, 122
   973 00000300 0F8F0F00                 jg  .toupper29
   974 00000304 8B5E04                   mov bx, [bp+4]
   975 00000307 8A07                     mov al, [bx]
   976 00000309 B400                     mov ah, 0
   977 0000030B 83E820                   sub ax, 32
   978 0000030E 8B5E04                   mov  bx, [bp+4]
   979 00000311 8807                     mov  [bx], al
   980                                  
   981                                  ;-172         s++;
   982                                  
   983                                  .toupper29:
   984                                  .toupper28:
   985 00000313 FF4604                   inc  word[bp+4]
   986                                  
   987                                  ;-173     }
   988                                  
   989                                  
   990                                  ;-174 }
   991                                  
   992 00000316 EBC3                     jmp .toupper26
   993                                  .toupper27:
   994                                  
   995                                  ;-175 int instr1(char *s, char c) {
   996 00000318 C9                       LEAVE
   997 00000319 C3                       ret
   998                                  ENDP
   999                                  
  1000                                  instr1: PROC
  1001                                  
  1002                                  ;-176     while(*s) {
  1003                                  ;
  1004 0000031A C8000000                 ENTER  0,0
  1005                                  .instr130:
  1006 0000031E 8B5E04                   mov bx, [bp+4]
  1007 00000321 8A07                     mov al, [bx]
  1008 00000323 B400                     mov ah, 0
  1009 00000325 08C0                     or  al, al
  1010 00000327 0F841900                 je .instr131
  1011                                  
  1012                                  ;-177         if (*s==c) return 1;
  1013                                  
  1014 0000032B 8B5E04                   mov bx, [bp+4]
  1015 0000032E 8A07                     mov al, [bx]
  1016 00000330 B400                     mov ah, 0
  1017 00000332 3A4606                   cmp al, [bp+6]
  1018 00000335 0F850600                 jne .instr132
  1019 00000339 B80100                   mov ax, 1
  1020 0000033C E90B00                   jmp .retninstr1
  1021                                  
  1022                                  ;-178         s++;
  1023                                  
  1024                                  .instr132:
  1025 0000033F FF4604                   inc  word[bp+4]
  1026                                  
  1027                                  ;-179     }
  1028                                  
  1029                                  
  1030                                  ;-180     return 0;
  1031                                  
  1032 00000342 EBDA                     jmp .instr130
  1033                                  .instr131:
  1034 00000344 B80000                   mov ax, 0
  1035 00000347 E90000                   jmp .retninstr1
  1036                                  
  1037                                  ;-181 }
  1038                                  
  1039                                  
  1040                                  ;-182 
  1041                                  
  1042                                  
  1043                                  ;-183 int eprc(char c)  {
  1044                                  
  1045 0000034A C9                       .retninstr1: LEAVE
  1046 0000034B C3                       ret
  1047                                  ENDP
  1048                                  
  1049                                  eprc: PROC
  1050                                  
  1051                                  ;-184     *cloc=c;
  1052                                  ;
  1053 0000034C C8000000                 ENTER  0,0
  1054 00000350 8A4604                   mov al, [bp+4]
  1055 00000353 8B1E[1800]               mov  bx, [cloc]
  1056 00000357 8807                     mov  [bx], al
  1057                                  
  1058                                  ;-185     cloc++;
  1059                                  
  1060 00000359 FF06[1800]               inc  word[cloc]
  1061                                  
  1062                                  ;-186 }
  1063                                  
  1064                                  
  1065                                  ;-187 int eprs(char *s) {
  1066 0000035D C9                       LEAVE
  1067 0000035E C3                       ret
  1068                                  ENDP
  1069                                  
  1070                                  eprs: PROC
  1071                                  
  1072                                  ;-188     char c;
  1073                                  
  1074                                  
  1075                                  ;-189     while(*s) {
  1076                                  ;
  1077 0000035F C8020000                 ENTER  2,0
  1078                                  .eprs33:
  1079 00000363 8B5E04                   mov bx, [bp+4]
  1080 00000366 8A07                     mov al, [bx]
  1081 00000368 B400                     mov ah, 0
  1082 0000036A 08C0                     or  al, al
  1083 0000036C 0F841B00                 je .eprs34
  1084                                  
  1085                                  ;-190         c=*s;
  1086                                  
  1087 00000370 8B5E04                   mov bx, [bp+4]
  1088 00000373 8A07                     mov al, [bx]
  1089 00000375 B400                     mov ah, 0
  1090 00000377 8846FE                   mov [bp-2], al
  1091                                  
  1092                                  ;-191         eprc(c);
  1093                                  
  1094 0000037A 8A46FE                   mov al, byte [bp-2]
  1095 0000037D B400                     mov ah, 0
  1096 0000037F 50                       push ax
  1097 00000380 E8C9FF                   call eprc
  1098 00000383 83C402                   add  sp, 2
  1099                                  
  1100                                  ;-192         s++;
  1101                                  
  1102 00000386 FF4604                   inc  word[bp+4]
  1103                                  
  1104                                  ;-193     }
  1105                                  
  1106                                  
  1107                                  ;-194 }
  1108                                  
  1109 00000389 EBD8                     jmp .eprs33
  1110                                  .eprs34:
  1111                                  
  1112                                  ;-195 int prc(unsigned char c) {
  1113 0000038B C9                       LEAVE
  1114 0000038C C3                       ret
  1115                                  ENDP
  1116                                  
  1117                                  prc: PROC
  1118                                  
  1119                                  ;-196     if (c==10) {
  1120                                  ;
  1121 0000038D C8000000                 ENTER  0,0
  1122 00000391 8A4604                   mov al, [bp+4]
  1123 00000394 3C0A                     cmp al, 10
  1124 00000396 0F850600                 jne .prc35
  1125                                  
  1126                                  ;-197         _AX=13;
  1127                                  
  1128 0000039A B80D00                   mov  ax, 13
  1129                                  
  1130                                  ;-198         writetty();
  1131                                  
  1132 0000039D E8B8FC                   call writetty
  1133                                  
  1134                                  ;-199     }
  1135                                  
  1136                                  
  1137                                  ;-200     _AL=c;
  1138                                  
  1139                                  .prc35:
  1140 000003A0 8A4604                   mov  al, [bp+4]
  1141                                  
  1142                                  ;-201     writetty();
  1143                                  
  1144 000003A3 E8B2FC                   call writetty
  1145                                  
  1146                                  ;-202     fputcR(c, fdout);
  1147                                  
  1148 000003A6 FF36[1C00]               push word [fdout]
  1149 000003AA 8A4604                   mov al, byte [bp+4]
  1150 000003AD B400                     mov ah, 0
  1151 000003AF 50                       push ax
  1152 000003B0 E85CFD                   call fputcR
  1153 000003B3 83C404                   add  sp, 4
  1154                                  
  1155                                  ;-203 }
  1156                                  
  1157                                  
  1158                                  ;-204 int prscomment(unsigned char *s) {
  1159 000003B6 C9                       LEAVE
  1160 000003B7 C3                       ret
  1161                                  ENDP
  1162                                  
  1163                                  prscomment: PROC
  1164                                  
  1165                                  ;-205     unsigned char c;
  1166                                  
  1167                                  
  1168                                  ;-206     while(*s){
  1169                                  ;
  1170 000003B8 C8020000                 ENTER  2,0
  1171                                  .prscomment36:
  1172 000003BC 8B5E04                   mov bx, [bp+4]
  1173 000003BF 8A07                     mov al, [bx]
  1174 000003C1 B400                     mov ah, 0
  1175 000003C3 08C0                     or  al, al
  1176 000003C5 0F841B00                 je .prscomment37
  1177                                  
  1178                                  ;-207         c=*s;
  1179                                  
  1180 000003C9 8B5E04                   mov bx, [bp+4]
  1181 000003CC 8A07                     mov al, [bx]
  1182 000003CE B400                     mov ah, 0
  1183 000003D0 8846FE                   mov [bp-2], al
  1184                                  
  1185                                  ;-208         prc(c);
  1186                                  
  1187 000003D3 8A46FE                   mov al, byte [bp-2]
  1188 000003D6 B400                     mov ah, 0
  1189 000003D8 50                       push ax
  1190 000003D9 E8B1FF                   call prc
  1191 000003DC 83C402                   add  sp, 2
  1192                                  
  1193                                  ;-209         s++;
  1194                                  
  1195 000003DF FF4604                   inc  word[bp+4]
  1196                                  
  1197                                  ;-210     }
  1198                                  
  1199                                  
  1200                                  ;-211 }
  1201                                  
  1202 000003E2 EBD8                     jmp .prscomment36
  1203                                  .prscomment37:
  1204                                  
  1205                                  ;-212 int prs(unsigned char *s) {
  1206 000003E4 C9                       LEAVE
  1207 000003E5 C3                       ret
  1208                                  ENDP
  1209                                  
  1210                                  prs: PROC
  1211                                  
  1212                                  ;-213     unsigned char c; int com;
  1213                                  
  1214                                  
  1215                                  ;-214     com=0;
  1216                                  ;
  1217 000003E6 C8040000                 ENTER  4,0
  1218 000003EA B80000                   mov ax, 0
  1219 000003ED 8946FC                   mov [bp-4], ax
  1220                                  
  1221                                  ;-215     while(*s) {
  1222                                  
  1223                                  .prs38:
  1224 000003F0 8B5E04                   mov bx, [bp+4]
  1225 000003F3 8A07                     mov al, [bx]
  1226 000003F5 B400                     mov ah, 0
  1227 000003F7 08C0                     or  al, al
  1228 000003F9 0F847B00                 je .prs39
  1229                                  
  1230                                  ;-216         c=*s;
  1231                                  
  1232 000003FD 8B5E04                   mov bx, [bp+4]
  1233 00000400 8A07                     mov al, [bx]
  1234 00000402 B400                     mov ah, 0
  1235 00000404 8846FE                   mov [bp-2], al
  1236                                  
  1237                                  ;-217         if (c==34) if (com) com=0;
  1238                                  
  1239 00000407 8A46FE                   mov al, [bp-2]
  1240 0000040A 3C22                     cmp al, 34
  1241 0000040C 0F851800                 jne .prs40
  1242 00000410 8B46FC                   mov ax, [bp-4]
  1243 00000413 08C0                     or  al, al
  1244 00000415 0F840900                 je .prs41
  1245 00000419 B80000                   mov ax, 0
  1246 0000041C 8946FC                   mov [bp-4], ax
  1247                                  
  1248                                  ;-218                    else com=1;
  1249                                  
  1250 0000041F E90600                   jmp .prs42
  1251                                  .prs41:
  1252 00000422 B80100                   mov ax, 1
  1253 00000425 8946FC                   mov [bp-4], ax
  1254                                  
  1255                                  ;-219         if (c==92) {
  1256                                  
  1257                                  .prs42:
  1258                                  .prs40:
  1259 00000428 8A46FE                   mov al, [bp-2]
  1260 0000042B 3C5C                     cmp al, 92
  1261 0000042D 0F853500                 jne .prs43
  1262                                  
  1263                                  ;-220             if (com==0) {
  1264                                  
  1265 00000431 8B46FC                   mov ax, [bp-4]
  1266 00000434 83F800                   cmp ax, 0
  1267 00000437 0F852B00                 jne .prs44
  1268                                  
  1269                                  ;-221                 s++;
  1270                                  
  1271 0000043B FF4604                   inc  word[bp+4]
  1272                                  
  1273                                  ;-222                 c=*s;
  1274                                  
  1275 0000043E 8B5E04                   mov bx, [bp+4]
  1276 00000441 8A07                     mov al, [bx]
  1277 00000443 B400                     mov ah, 0
  1278 00000445 8846FE                   mov [bp-2], al
  1279                                  
  1280                                  ;-223                 if (c=='n') c=10;
  1281                                  
  1282 00000448 8A46FE                   mov al, [bp-2]
  1283 0000044B 3C6E                     cmp al, 110
  1284 0000044D 0F850600                 jne .prs45
  1285 00000451 B80A00                   mov ax, 10
  1286 00000454 8846FE                   mov [bp-2], al
  1287                                  
  1288                                  ;-224                 if (c=='t') c= 9;
  1289                                  
  1290                                  .prs45:
  1291 00000457 8A46FE                   mov al, [bp-2]
  1292 0000045A 3C74                     cmp al, 116
  1293 0000045C 0F850600                 jne .prs46
  1294 00000460 B80900                   mov ax, 9
  1295 00000463 8846FE                   mov [bp-2], al
  1296                                  
  1297                                  ;-225             }
  1298                                  
  1299                                  .prs46:
  1300                                  
  1301                                  ;-226         }
  1302                                  
  1303                                  .prs44:
  1304                                  
  1305                                  ;-227         prc(c);
  1306                                  
  1307                                  .prs43:
  1308 00000466 8A46FE                   mov al, byte [bp-2]
  1309 00000469 B400                     mov ah, 0
  1310 0000046B 50                       push ax
  1311 0000046C E81EFF                   call prc
  1312 0000046F 83C402                   add  sp, 2
  1313                                  
  1314                                  ;-228         s++;
  1315                                  
  1316 00000472 FF4604                   inc  word[bp+4]
  1317                                  
  1318                                  ;-229     }
  1319                                  
  1320                                  
  1321                                  ;-230 }
  1322                                  
  1323 00000475 E978FF                   jmp .prs38
  1324                                  .prs39:
  1325                                  
  1326                                  ;-231 int prnl() {
  1327 00000478 C9                       LEAVE
  1328 00000479 C3                       ret
  1329                                  ENDP
  1330                                  
  1331                                  prnl: PROC
  1332                                  
  1333                                  ;-232     prs("\n ");
  1334                                  
  1335 0000047A 68[8404]                 push prnl_0
  1336 0000047D E866FF                   call prs
  1337 00000480 83C402                   add  sp, 2
  1338                                  
  1339                                  ;-233 }
  1340                                  
  1341                                  
  1342                                  ;-234 
  1343                                  
  1344                                  
  1345                                  ;-235 
  1346                                  
  1347                                  
  1348                                  ;-236 int eprnum(int n){//for docall1 procedure
  1349                                  
  1350 00000483 C3                       ret
  1351 00000484 5C6E2000                prnl_0 db "\n ",0
  1352                                  ENDP
  1353                                  
  1354                                  eprnum: PROC
  1355                                  
  1356                                  ;-237     int e;
  1357                                  
  1358                                  
  1359                                  ;-238     if(n<0) {
  1360                                  ;
  1361 00000488 C8020000                 ENTER  2,0
  1362 0000048C 8B4604                   mov ax, [bp+4]
  1363 0000048F 83F800                   cmp ax, 0
  1364 00000492 0F8D1400                 jge .eprnum47
  1365                                  
  1366                                  ;-239         eprc('-');
  1367                                  
  1368 00000496 6A2D                     push 45
  1369 00000498 E8B1FE                   call eprc
  1370 0000049B 83C402                   add  sp, 2
  1371                                  
  1372                                  ;-240         n=mkneg(n);
  1373                                  
  1374 0000049E FF7604                   push word [bp+4]
  1375 000004A1 E804FC                   call mkneg
  1376 000004A4 83C402                   add  sp, 2
  1377 000004A7 894604                   mov [bp+4], ax
  1378                                  
  1379                                  ;-241     }
  1380                                  
  1381                                  
  1382                                  ;-242     if (n >= 10) {
  1383                                  
  1384                                  .eprnum47:
  1385 000004AA 8B4604                   mov ax, [bp+4]
  1386 000004AD 83F80A                   cmp ax, 10 ;unsigned : 1
  1387 000004B0 0F8C1500                 jl  .eprnum48
  1388                                  
  1389                                  ;-243         e=n/10;
  1390                                  
  1391 000004B4 8B4604                   mov ax, [bp+4]
  1392 000004B7 BB0A00                   mov bx, 10
  1393 000004BA 99                       cwd
  1394 000004BB F7FB                     idiv bx
  1395 000004BD 8946FE                   mov [bp-2], ax
  1396                                  
  1397                                  ;-244         eprnum(e);
  1398                                  
  1399 000004C0 FF76FE                   push word [bp-2]
  1400 000004C3 E8C2FF                   call eprnum
  1401 000004C6 83C402                   add  sp, 2
  1402                                  
  1403                                  ;-245     }
  1404                                  
  1405                                  
  1406                                  ;-246     n=n%10;
  1407                                  
  1408                                  .eprnum48:
  1409 000004C9 8B4604                   mov ax, [bp+4]
  1410 000004CC BB0A00                   mov bx, 10
  1411 000004CF 99                       cwd
  1412 000004D0 F7FB                     idiv bx
  1413 000004D2 89D0                     mov ax, dx
  1414 000004D4 894604                   mov [bp+4], ax
  1415                                  
  1416                                  ;-247     n=n+'0';
  1417                                  
  1418 000004D7 8B4604                   mov ax, [bp+4]
  1419 000004DA 83C030                   add ax, 48
  1420 000004DD 894604                   mov [bp+4], ax
  1421                                  
  1422                                  ;-248     eprc(n);
  1423                                  
  1424 000004E0 FF7604                   push word [bp+4]
  1425 000004E3 E866FE                   call eprc
  1426 000004E6 83C402                   add  sp, 2
  1427                                  
  1428                                  ;-249 }
  1429                                  
  1430                                  
  1431                                  ;-250 int pint1 (int n){
  1432 000004E9 C9                       LEAVE
  1433 000004EA C3                       ret
  1434                                  ENDP
  1435                                  
  1436                                  pint1: PROC
  1437                                  
  1438                                  ;-251     int e;
  1439                                  
  1440                                  
  1441                                  ;-252     if(n<0) {  prc('-');  n=mkneg(n); }
  1442                                  ;
  1443 000004EB C8020000                 ENTER  2,0
  1444 000004EF 8B4604                   mov ax, [bp+4]
  1445 000004F2 83F800                   cmp ax, 0
  1446 000004F5 0F8D1400                 jge .pint149
  1447 000004F9 6A2D                     push 45
  1448 000004FB E88FFE                   call prc
  1449 000004FE 83C402                   add  sp, 2
  1450 00000501 FF7604                   push word [bp+4]
  1451 00000504 E8A1FB                   call mkneg
  1452 00000507 83C402                   add  sp, 2
  1453 0000050A 894604                   mov [bp+4], ax
  1454                                  
  1455                                  ;-253     if (n >= 10) {
  1456                                  
  1457                                  .pint149:
  1458 0000050D 8B4604                   mov ax, [bp+4]
  1459 00000510 83F80A                   cmp ax, 10 ;unsigned : 1
  1460 00000513 0F8C1500                 jl  .pint150
  1461                                  
  1462                                  ;-254         e=n/10;
  1463                                  
  1464 00000517 8B4604                   mov ax, [bp+4]
  1465 0000051A BB0A00                   mov bx, 10
  1466 0000051D 99                       cwd
  1467 0000051E F7FB                     idiv bx
  1468 00000520 8946FE                   mov [bp-2], ax
  1469                                  
  1470                                  ;-255         pint1(e);
  1471                                  
  1472 00000523 FF76FE                   push word [bp-2]
  1473 00000526 E8C2FF                   call pint1
  1474 00000529 83C402                   add  sp, 2
  1475                                  
  1476                                  ;-256     }
  1477                                  
  1478                                  
  1479                                  ;-257     n=n%10;
  1480                                  
  1481                                  .pint150:
  1482 0000052C 8B4604                   mov ax, [bp+4]
  1483 0000052F BB0A00                   mov bx, 10
  1484 00000532 99                       cwd
  1485 00000533 F7FB                     idiv bx
  1486 00000535 89D0                     mov ax, dx
  1487 00000537 894604                   mov [bp+4], ax
  1488                                  
  1489                                  ;-258     n += '0';
  1490                                  
  1491 0000053A 83460430                 add  word[bp+4], 48
  1492                                  
  1493                                  ;-259     prc(n);
  1494                                  
  1495 0000053E FF7604                   push word [bp+4]
  1496 00000541 E849FE                   call prc
  1497 00000544 83C402                   add  sp, 2
  1498                                  
  1499                                  ;-260 }
  1500                                  
  1501                                  
  1502                                  ;-261 int prunsign1(unsigned int n) {
  1503 00000547 C9                       LEAVE
  1504 00000548 C3                       ret
  1505                                  ENDP
  1506                                  
  1507                                  prunsign1: PROC
  1508                                  
  1509                                  ;-262     unsigned int e;
  1510                                  
  1511                                  
  1512                                  ;-263     if (n >= 10) {
  1513                                  ;
  1514 00000549 C8020000                 ENTER  2,0
  1515 0000054D 8B4604                   mov ax, [bp+4]
  1516 00000550 83F80A                   cmp ax, 10 ;unsigned : 0
  1517 00000553 0F821700                 jb  .prunsign151
  1518                                  
  1519                                  ;-264         e=n/10;
  1520                                  
  1521 00000557 8B4604                   mov ax, [bp+4]
  1522 0000055A BB0A00                   mov bx, 10
  1523 0000055D BA0000                   mov dx, 0
  1524 00000560 F7F3                     div bx
  1525 00000562 8946FE                   mov [bp-2], ax
  1526                                  
  1527                                  ;-265         prunsign1(e);
  1528                                  
  1529 00000565 FF76FE                   push word [bp-2]
  1530 00000568 E8DEFF                   call prunsign1
  1531 0000056B 83C402                   add  sp, 2
  1532                                  
  1533                                  ;-266     }
  1534                                  
  1535                                  
  1536                                  ;-267     n = n % 10; /*unsigned mod*/
  1537                                  
  1538                                  .prunsign151:
  1539 0000056E 8B4604                   mov ax, [bp+4]
  1540 00000571 BB0A00                   mov bx, 10
  1541 00000574 BA0000                   mov dx, 0
  1542 00000577 F7F3                     div bx
  1543 00000579 89D0                     mov ax, dx
  1544 0000057B 894604                   mov [bp+4], ax
  1545                                  
  1546                                  ;-268     n += '0';
  1547                                  
  1548 0000057E 83460430                 add  word[bp+4], 48
  1549                                  
  1550                                  ;-269     prc(n);
  1551                                  
  1552 00000582 FF7604                   push word [bp+4]
  1553 00000585 E805FE                   call prc
  1554 00000588 83C402                   add  sp, 2
  1555                                  
  1556                                  ;-270 }
  1557                                  
  1558                                  
  1559                                  ;-271 int printint51(unsigned int j)  {
  1560 0000058B C9                       LEAVE
  1561 0000058C C3                       ret
  1562                                  ENDP
  1563                                  
  1564                                  printint51: PROC
  1565                                  
  1566                                  ;-272     if (j<10000) prc(32);
  1567                                  ;
  1568 0000058D C8000000                 ENTER  0,0
  1569 00000591 8B4604                   mov ax, [bp+4]
  1570 00000594 3D1027                   cmp ax, 10000
  1571 00000597 0F8D0800                 jge .printint5152
  1572 0000059B 6A20                     push 32
  1573 0000059D E8EDFD                   call prc
  1574 000005A0 83C402                   add  sp, 2
  1575                                  
  1576                                  ;-273     if (j<1000) prc(32);
  1577                                  
  1578                                  .printint5152:
  1579 000005A3 8B4604                   mov ax, [bp+4]
  1580 000005A6 3DE803                   cmp ax, 1000
  1581 000005A9 0F8D0800                 jge .printint5153
  1582 000005AD 6A20                     push 32
  1583 000005AF E8DBFD                   call prc
  1584 000005B2 83C402                   add  sp, 2
  1585                                  
  1586                                  ;-274     if (j<100) prc(32);
  1587                                  
  1588                                  .printint5153:
  1589 000005B5 8B4604                   mov ax, [bp+4]
  1590 000005B8 83F864                   cmp ax, 100
  1591 000005BB 0F8D0800                 jge .printint5154
  1592 000005BF 6A20                     push 32
  1593 000005C1 E8C9FD                   call prc
  1594 000005C4 83C402                   add  sp, 2
  1595                                  
  1596                                  ;-275     if (j<10) prc(32);
  1597                                  
  1598                                  .printint5154:
  1599 000005C7 8B4604                   mov ax, [bp+4]
  1600 000005CA 83F80A                   cmp ax, 10
  1601 000005CD 0F8D0800                 jge .printint5155
  1602 000005D1 6A20                     push 32
  1603 000005D3 E8B7FD                   call prc
  1604 000005D6 83C402                   add  sp, 2
  1605                                  
  1606                                  ;-276     prunsign1(j);
  1607                                  
  1608                                  .printint5155:
  1609 000005D9 FF7604                   push word [bp+4]
  1610 000005DC E86AFF                   call prunsign1
  1611 000005DF 83C402                   add  sp, 2
  1612                                  
  1613                                  ;-277 }
  1614                                  
  1615                                  
  1616                                  ;-278 
  1617                                  
  1618                                  
  1619                                  ;-279 int end1(int n) {
  1620 000005E2 C9                       LEAVE
  1621 000005E3 C3                       ret
  1622                                  ENDP
  1623                                  
  1624                                  end1: PROC
  1625                                  
  1626                                  ;-280     fcloseR(fdin);
  1627                                  ;
  1628 000005E4 C8000000                 ENTER  0,0
  1629 000005E8 FF36[1A00]               push word [fdin]
  1630 000005EC E8EEFA                   call fcloseR
  1631 000005EF 83C402                   add  sp, 2
  1632                                  
  1633                                  ;-281     fcloseR(fdout);
  1634                                  
  1635 000005F2 FF36[1C00]               push word [fdout]
  1636 000005F6 E8E4FA                   call fcloseR
  1637 000005F9 83C402                   add  sp, 2
  1638                                  
  1639                                  ;-282     exitR(n);
  1640                                  
  1641 000005FC FF7604                   push word [bp+4]
  1642 000005FF E8EAFA                   call exitR
  1643 00000602 83C402                   add  sp, 2
  1644                                  
  1645                                  ;-283 }
  1646                                  
  1647                                  
  1648                                  ;-284 
  1649                                  
  1650                                  
  1651                                  ;-285 int error1(char *s) {
  1652 00000605 C9                       LEAVE
  1653 00000606 C3                       ret
  1654                                  ENDP
  1655                                  
  1656                                  error1: PROC
  1657                                  
  1658                                  ;-286     lineno--;
  1659                                  ;
  1660 00000607 C8000000                 ENTER  0,0
  1661 0000060B FF0E[4700]               dec  word[lineno]
  1662                                  
  1663                                  ;-287     prnl();
  1664                                  
  1665 0000060F E868FE                   call prnl
  1666                                  
  1667                                  ;-288     prscomment(&fgetsdest);
  1668                                  
  1669 00000612 8D0688DD                 lea  ax, [fgetsdest]
  1670 00000616 50                       push ax
  1671 00000617 E89EFD                   call prscomment
  1672 0000061A 83C402                   add  sp, 2
  1673                                  
  1674                                  ;-289     prs(";Line: ");
  1675                                  
  1676 0000061D 68[8606]                 push error1_0
  1677 00000620 E8C3FD                   call prs
  1678 00000623 83C402                   add  sp, 2
  1679                                  
  1680                                  ;-290     prunsign1(lineno);
  1681                                  
  1682 00000626 FF36[4700]               push word [lineno]
  1683 0000062A E81CFF                   call prunsign1
  1684 0000062D 83C402                   add  sp, 2
  1685                                  
  1686                                  ;-291     prs(" ************** ERROR: ");
  1687                                  
  1688 00000630 68[8E06]                 push error1_1
  1689 00000633 E8B0FD                   call prs
  1690 00000636 83C402                   add  sp, 2
  1691                                  
  1692                                  ;-292     prs(s);
  1693                                  
  1694 00000639 FF7604                   push word [bp+4]
  1695 0000063C E8A7FD                   call prs
  1696 0000063F 83C402                   add  sp, 2
  1697                                  
  1698                                  ;-293     prs("  in column: ");
  1699                                  
  1700 00000642 68[A606]                 push error1_2
  1701 00000645 E89EFD                   call prs
  1702 00000648 83C402                   add  sp, 2
  1703                                  
  1704                                  ;-294     prunsign1(column);
  1705                                  
  1706 0000064B FF36[2100]               push word [column]
  1707 0000064F E8F7FE                   call prunsign1
  1708 00000652 83C402                   add  sp, 2
  1709                                  
  1710                                  ;-295     prs("\nToken: ");
  1711                                  
  1712 00000655 68[B406]                 push error1_3
  1713 00000658 E88BFD                   call prs
  1714 0000065B 83C402                   add  sp, 2
  1715                                  
  1716                                  ;-296     prunsign1(token);
  1717                                  
  1718 0000065E FF36[1E00]               push word [token]
  1719 00000662 E8E4FE                   call prunsign1
  1720 00000665 83C402                   add  sp, 2
  1721                                  
  1722                                  ;-297     prs(", symbol: ");
  1723                                  
  1724 00000668 68[BE06]                 push error1_4
  1725 0000066B E878FD                   call prs
  1726 0000066E 83C402                   add  sp, 2
  1727                                  
  1728                                  ;-298     prs(symbol);
  1729                                  
  1730 00000671 8D06A36D                 lea  ax, [symbol]
  1731 00000675 50                       push ax
  1732 00000676 E86DFD                   call prs
  1733 00000679 83C402                   add  sp, 2
  1734                                  
  1735                                  ;-299     end1(1);
  1736                                  
  1737 0000067C 6A01                     push 1
  1738 0000067E E863FF                   call end1
  1739 00000681 83C402                   add  sp, 2
  1740                                  
  1741                                  ;-300 }
  1742                                  
  1743                                  
  1744                                  ;-301 
  1745                                  
  1746                                  
  1747                                  ;-302 int printinputline() {
  1748 00000684 C9                       LEAVE
  1749 00000685 C3                       ret
  1750 00000686 3B4C696E653A2000        error1_0 db ";Line: ",0
  1751 0000068E 202A2A2A2A2A2A2A2A-     error1_1 db " ************** ERROR: ",0
  1752 00000697 2A2A2A2A2A2A204552-
  1753 000006A0 524F523A2000       
  1754 000006A6 2020696E20636F6C75-     error1_2 db "  in column: ",0
  1755 000006AF 6D6E3A2000         
  1756 000006B4 5C6E546F6B656E3A20-     error1_3 db "\nToken: ",0
  1757 000006BD 00                 
  1758 000006BE 2C2073796D626F6C3A-     error1_4 db ", symbol: ",0
  1759 000006C7 2000               
  1760                                  ENDP
  1761                                  
  1762                                  printinputline: PROC
  1763                                  
  1764                                  ;-303     int col;
  1765                                  
  1766                                  
  1767                                  ;-304     col=0;
  1768                                  ;
  1769 000006C9 C8020000                 ENTER  2,0
  1770 000006CD B80000                   mov ax, 0
  1771 000006D0 8946FE                   mov [bp-2], ax
  1772                                  
  1773                                  ;-305     fgetsp=&fgetsdest;
  1774                                  
  1775 000006D3 B888DD                   mov ax, fgetsdest
  1776 000006D6 A3[4500]                 mov word [fgetsp], ax
  1777                                  
  1778                                  ;-306     do {
  1779                                  
  1780                                  .printinputline56:
  1781                                  
  1782                                  ;-307         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);
  1783                                  
  1784 000006D9 6A01                     push 1
  1785 000006DB FF36[1A00]               push word [fdin]
  1786 000006DF 8D06[5100]               lea  ax, [DOS_ByteRead]
  1787 000006E3 50                       push ax
  1788 000006E4 E813FA                   call readRL
  1789 000006E7 83C406                   add  sp, 6
  1790 000006EA A3[4F00]                 mov word [DOS_NoBytes], ax
  1791                                  
  1792                                  ;-308         if (DOS_NoBytes == 0) return;
  1793                                  
  1794 000006ED A1[4F00]                 mov ax, [DOS_NoBytes]
  1795 000006F0 83F800                   cmp ax, 0
  1796 000006F3 0F850300                 jne .printinputline57
  1797 000006F7 E96A00                   jmp .retnprintinputline
  1798                                  
  1799                                  ;-309         *fgetsp=DOS_ByteRead;
  1800                                  
  1801                                  .printinputline57:
  1802 000006FA A0[5100]                 mov al, [DOS_ByteRead]
  1803 000006FD 8B1E[4500]               mov  bx, [fgetsp]
  1804 00000701 8807                     mov  [bx], al
  1805                                  
  1806                                  ;-310         fgetsp++;
  1807                                  
  1808 00000703 FF06[4500]               inc  word[fgetsp]
  1809                                  
  1810                                  ;-311         col++;
  1811                                  
  1812 00000707 FF46FE                   inc  word[bp-2]
  1813                                  
  1814                                  ;-312         if (col >80) error1("input line longer than 80 char");
  1815                                  
  1816 0000070A 8B46FE                   mov ax, [bp-2]
  1817 0000070D 83F850                   cmp ax, 80
  1818 00000710 0F8E0900                 jle .printinputline58
  1819 00000714 68[6607]                 push printinputline_0
  1820 00000717 E8EDFE                   call error1
  1821 0000071A 83C402                   add  sp, 2
  1822                                  
  1823                                  ;-313         }
  1824                                  
  1825                                  .printinputline58:
  1826                                  
  1827                                  ;-314         while (DOS_ByteRead != 10);
  1828                                  
  1829 0000071D A0[5100]                 mov al, [DOS_ByteRead]
  1830 00000720 3C0A                     cmp al, 10
  1831 00000722 0F840200                 je  .printinputline59
  1832 00000726 EBB1                     jmp .printinputline56
  1833                                  .printinputline59:
  1834                                  
  1835                                  ;-315     *fgetsp=0;
  1836                                  
  1837 00000728 B80000                   mov ax, 0
  1838 0000072B 8B1E[4500]               mov  bx, [fgetsp]
  1839 0000072F 8807                     mov  [bx], al
  1840                                  
  1841                                  ;-316     if (fdout) {
  1842                                  
  1843 00000731 A1[1C00]                 mov ax, [fdout]
  1844 00000734 08C0                     or  al, al
  1845 00000736 0F842A00                 je .printinputline60
  1846                                  
  1847                                  ;-317         prs("\n\n;-");
  1848                                  
  1849 0000073A 68[8507]                 push printinputline_1
  1850 0000073D E8A6FC                   call prs
  1851 00000740 83C402                   add  sp, 2
  1852                                  
  1853                                  ;-318         prunsign1(lineno);
  1854                                  
  1855 00000743 FF36[4700]               push word [lineno]
  1856 00000747 E8FFFD                   call prunsign1
  1857 0000074A 83C402                   add  sp, 2
  1858                                  
  1859                                  ;-319         prc(' ');
  1860                                  
  1861 0000074D 6A20                     push 32
  1862 0000074F E83BFC                   call prc
  1863 00000752 83C402                   add  sp, 2
  1864                                  
  1865                                  ;-320         lineno++;
  1866                                  
  1867 00000755 FF06[4700]               inc  word[lineno]
  1868                                  
  1869                                  ;-321         prscomment(&fgetsdest);
  1870                                  
  1871 00000759 8D0688DD                 lea  ax, [fgetsdest]
  1872 0000075D 50                       push ax
  1873 0000075E E857FC                   call prscomment
  1874 00000761 83C402                   add  sp, 2
  1875                                  
  1876                                  ;-322         }
  1877                                  
  1878                                  
  1879                                  ;-323 }
  1880                                  
  1881                                  .printinputline60:
  1882                                  
  1883                                  ;-324 int fgets1() {
  1884                                  
  1885 00000764 C9                       .retnprintinputline: LEAVE
  1886 00000765 C3                       ret
  1887 00000766 696E707574206C696E-     printinputline_0 db "input line longer than 80 char",0
  1888 0000076F 65206C6F6E67657220-
  1889 00000778 7468616E2038302063-
  1890 00000781 68617200           
  1891 00000785 5C6E5C6E3B2D00          printinputline_1 db "\n\n;-",0
  1892                                  ENDP
  1893                                  
  1894                                  fgets1: PROC
  1895                                  
  1896                                  ;-325     char c;
  1897                                  
  1898                                  
  1899                                  ;-326     c=*fgetsp;
  1900                                  ;
  1901 0000078C C8020000                 ENTER  2,0
  1902 00000790 8B1E[4500]               mov bx, [fgetsp]
  1903 00000794 8A07                     mov al, [bx]
  1904 00000796 B400                     mov ah, 0
  1905 00000798 8846FE                   mov [bp-2], al
  1906                                  
  1907                                  ;-327     if (c==0) {
  1908                                  
  1909 0000079B 8A46FE                   mov al, [bp-2]
  1910 0000079E 3C00                     cmp al, 0
  1911 000007A0 0F852A00                 jne .fgets161
  1912                                  
  1913                                  ;-328         printinputline();
  1914                                  
  1915 000007A4 E822FF                   call printinputline
  1916                                  
  1917                                  ;-329         if (DOS_NoBytes == 0) return 0;
  1918                                  
  1919 000007A7 A1[4F00]                 mov ax, [DOS_NoBytes]
  1920 000007AA 83F800                   cmp ax, 0
  1921 000007AD 0F850600                 jne .fgets162
  1922 000007B1 B80000                   mov ax, 0
  1923 000007B4 E92500                   jmp .retnfgets1
  1924                                  
  1925                                  ;-330         fgetsp=&fgetsdest;
  1926                                  
  1927                                  .fgets162:
  1928 000007B7 B888DD                   mov ax, fgetsdest
  1929 000007BA A3[4500]                 mov word [fgetsp], ax
  1930                                  
  1931                                  ;-331         c=*fgetsp;
  1932                                  
  1933 000007BD 8B1E[4500]               mov bx, [fgetsp]
  1934 000007C1 8A07                     mov al, [bx]
  1935 000007C3 B400                     mov ah, 0
  1936 000007C5 8846FE                   mov [bp-2], al
  1937                                  
  1938                                  ;-332         column=0;
  1939                                  
  1940 000007C8 B80000                   mov ax, 0
  1941 000007CB A3[2100]                 mov word [column], ax
  1942                                  
  1943                                  ;-333     }
  1944                                  
  1945                                  
  1946                                  ;-334     fgetsp++;
  1947                                  
  1948                                  .fgets161:
  1949 000007CE FF06[4500]               inc  word[fgetsp]
  1950                                  
  1951                                  ;-335     column++;
  1952                                  
  1953 000007D2 FF06[2100]               inc  word[column]
  1954                                  
  1955                                  ;-336     return c;
  1956                                  
  1957 000007D6 8A46FE                   mov al, [bp-2]
  1958 000007D9 E90000                   jmp .retnfgets1
  1959                                  
  1960                                  ;-337 }
  1961                                  
  1962                                  
  1963                                  ;-338 int next() {
  1964                                  
  1965 000007DC C9                       .retnfgets1: LEAVE
  1966 000007DD C3                       ret
  1967                                  ENDP
  1968                                  
  1969                                  next: PROC
  1970                                  
  1971                                  ;-339     char r;
  1972                                  
  1973                                  
  1974                                  ;-340     r = thechar;
  1975                                  ;
  1976 000007DE C8020000                 ENTER  2,0
  1977 000007E2 A0[2300]                 mov al, [thechar]
  1978 000007E5 8846FE                   mov [bp-2], al
  1979                                  
  1980                                  ;-341     globC=r;
  1981                                  
  1982 000007E8 8A46FE                   mov al, [bp-2]
  1983 000007EB A2[2000]                 mov byte [globC], al
  1984                                  
  1985                                  ;-342     thechar = fgets1();
  1986                                  
  1987 000007EE E89BFF                   call fgets1
  1988 000007F1 A2[2300]                 mov byte [thechar], al
  1989                                  
  1990                                  ;-343     return r;
  1991                                  
  1992 000007F4 8A46FE                   mov al, [bp-2]
  1993 000007F7 E90000                   jmp .retnnext
  1994                                  
  1995                                  ;-344 }
  1996                                  
  1997                                  
  1998                                  ;-345 
  1999                                  
  2000                                  
  2001                                  ;-346 int getdigit(char c) { int i;
  2002                                  
  2003 000007FA C9                       .retnnext: LEAVE
  2004 000007FB C3                       ret
  2005                                  ENDP
  2006                                  
  2007                                  getdigit: PROC
  2008                                  
  2009                                  ;-347     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char
  2010                                  ;
  2011 000007FC C8020000                 ENTER  2,0
  2012 00000800 B80000                   mov ax, 0
  2013 00000803 A3[2C00]                 mov word [lexval], ax
  2014 00000806 8A4604                   mov al, [bp+4]
  2015 00000809 2C30                     sub al, 48
  2016 0000080B A3[2C00]                 mov word [lexval], ax
  2017                                  
  2018                                  ;-348     if (thechar=='x') thechar='X'; if (thechar=='X') { next();
  2019                                  
  2020 0000080E A0[2300]                 mov al, [thechar]
  2021 00000811 3C78                     cmp al, 120
  2022 00000813 0F850600                 jne .getdigit63
  2023 00000817 B85800                   mov ax, 88
  2024 0000081A A2[2300]                 mov byte [thechar], al
  2025                                  .getdigit63:
  2026 0000081D A0[2300]                 mov al, [thechar]
  2027 00000820 3C58                     cmp al, 88
  2028 00000822 0F856800                 jne .getdigit64
  2029 00000826 E8B5FF                   call next
  2030                                  
  2031                                  ;-349       while(alnum(thechar)) { c=next(); if(c>96) c=c-39;
  2032                                  
  2033                                  .getdigit65:
  2034 00000829 A0[2300]                 mov al, byte [thechar]
  2035 0000082C B400                     mov ah, 0
  2036 0000082E 50                       push ax
  2037 0000082F E89AF9                   call alnum
  2038 00000832 83C402                   add  sp, 2
  2039 00000835 08C0                     or  al, al
  2040 00000837 0F845000                 je .getdigit66
  2041 0000083B E8A0FF                   call next
  2042 0000083E 884604                   mov [bp+4], al
  2043 00000841 8A4604                   mov al, [bp+4]
  2044 00000844 3C60                     cmp al, 96
  2045 00000846 0F8E0800                 jle .getdigit67
  2046 0000084A 8A4604                   mov al, [bp+4]
  2047 0000084D 2C27                     sub al, 39
  2048 0000084F 884604                   mov [bp+4], al
  2049                                  
  2050                                  ;-350 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16
  2051                                  
  2052                                  .getdigit67:
  2053 00000852 8A4604                   mov al, [bp+4]
  2054 00000855 3C40                     cmp al, 64
  2055 00000857 0F8E0800                 jle .getdigit68
  2056 0000085B 8A4604                   mov al, [bp+4]
  2057 0000085E 2C07                     sub al, 7
  2058 00000860 884604                   mov [bp+4], al
  2059                                  .getdigit68:
  2060 00000863 8A4604                   mov al, [bp+4]
  2061 00000866 2C30                     sub al, 48
  2062 00000868 884604                   mov [bp+4], al
  2063 0000086B A1[2C00]                 mov ax, [lexval]
  2064 0000086E C1E004                   shl ax, 4
  2065 00000871 A3[2C00]                 mov word [lexval], ax
  2066                                  
  2067                                  ;-351      i=0; i=c; lexval=lexval+i;}
  2068                                  
  2069 00000874 B80000                   mov ax, 0
  2070 00000877 8946FE                   mov [bp-2], ax
  2071 0000087A 8A4604                   mov al, [bp+4]
  2072 0000087D 8946FE                   mov [bp-2], ax
  2073 00000880 A1[2C00]                 mov ax, [lexval]
  2074 00000883 0346FE                   add ax, [bp-2]
  2075 00000886 A3[2C00]                 mov word [lexval], ax
  2076                                  
  2077                                  ;-352     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10;
  2078                                  
  2079 00000889 EB9E                     jmp .getdigit65
  2080                                  .getdigit66:
  2081 0000088B E94200                   jmp .getdigit69
  2082                                  .getdigit64:
  2083                                  .getdigit70:
  2084 0000088E A0[2300]                 mov al, byte [thechar]
  2085 00000891 B400                     mov ah, 0
  2086 00000893 50                       push ax
  2087 00000894 E80BF9                   call digit
  2088 00000897 83C402                   add  sp, 2
  2089 0000089A 08C0                     or  al, al
  2090 0000089C 0F843000                 je .getdigit71
  2091 000008A0 E83BFF                   call next
  2092 000008A3 884604                   mov [bp+4], al
  2093 000008A6 8A4604                   mov al, [bp+4]
  2094 000008A9 2C30                     sub al, 48
  2095 000008AB 884604                   mov [bp+4], al
  2096 000008AE A1[2C00]                 mov ax, [lexval]
  2097 000008B1 BB0A00                   mov bx, 10
  2098 000008B4 F7E3                     mul bx
  2099 000008B6 A3[2C00]                 mov word [lexval], ax
  2100                                  
  2101                                  ;-353      i=0; i=c; lexval=lexval+i; } }
  2102                                  
  2103 000008B9 B80000                   mov ax, 0
  2104 000008BC 8946FE                   mov [bp-2], ax
  2105 000008BF 8A4604                   mov al, [bp+4]
  2106 000008C2 8946FE                   mov [bp-2], ax
  2107 000008C5 A1[2C00]                 mov ax, [lexval]
  2108 000008C8 0346FE                   add ax, [bp-2]
  2109 000008CB A3[2C00]                 mov word [lexval], ax
  2110 000008CE EBBE                     jmp .getdigit70
  2111                                  .getdigit71:
  2112                                  
  2113                                  ;-354 }
  2114                                  
  2115                                  .getdigit69:
  2116                                  
  2117                                  ;-355 int getstring(int delim) {
  2118 000008D0 C9                       LEAVE
  2119 000008D1 C3                       ret
  2120                                  ENDP
  2121                                  
  2122                                  getstring: PROC
  2123                                  
  2124                                  ;-356     int c; char *p;
  2125                                  
  2126                                  
  2127                                  ;-357     p=&symbol;
  2128                                  ;
  2129 000008D2 C8040000                 ENTER  4,0
  2130 000008D6 B8A36D                   mov ax, symbol
  2131 000008D9 8946FC                   mov [bp-4], ax
  2132                                  
  2133                                  ;-358     c=next();
  2134                                  
  2135 000008DC E8FFFE                   call next
  2136 000008DF 8946FE                   mov [bp-2], ax
  2137                                  
  2138                                  ;-359     while (c != delim) {
  2139                                  
  2140                                  .getstring72:
  2141 000008E2 8B46FE                   mov ax, [bp-2]
  2142 000008E5 3B4604                   cmp ax, [bp+4]
  2143 000008E8 0F841300                 je  .getstring73
  2144                                  
  2145                                  ;-360         *p=c;
  2146                                  
  2147 000008EC 8B46FE                   mov ax, [bp-2]
  2148 000008EF 8B5EFC                   mov  bx, [bp-4]
  2149 000008F2 8807                     mov  [bx], al
  2150                                  
  2151                                  ;-361         p++;
  2152                                  
  2153 000008F4 FF46FC                   inc  word[bp-4]
  2154                                  
  2155                                  ;-362         c=next();
  2156                                  
  2157 000008F7 E8E4FE                   call next
  2158 000008FA 8946FE                   mov [bp-2], ax
  2159                                  
  2160                                  ;-363     }
  2161                                  
  2162                                  
  2163                                  ;-364     *p=0;
  2164                                  
  2165 000008FD EBE3                     jmp .getstring72
  2166                                  .getstring73:
  2167 000008FF B80000                   mov ax, 0
  2168 00000902 8B5EFC                   mov  bx, [bp-4]
  2169 00000905 8807                     mov  [bx], al
  2170                                  
  2171                                  ;-365 }
  2172                                  
  2173                                  
  2174                                  ;-366 
  2175                                  
  2176                                  
  2177                                  ;-367 int adrF(char *s, unsigned int i) { i << 4;//*16; IDLENMAX=15!
  2178 00000907 C9                       LEAVE
  2179 00000908 C3                       ret
  2180                                  ENDP
  2181                                  
  2182                                  adrF: PROC;
  2183 00000909 C8000000                 ENTER  0,0
  2184 0000090D 8B4606                   mov ax, [bp+6]
  2185 00000910 C1E004                   shl ax, 4
  2186                                  
  2187                                  ;-368   __asm{ add ax, [bp+4]  ; offset s } }
  2188                                  
  2189 00000913 034604                   add ax, [bp+4]  ; offset s 
  2190                                  
  2191                                  ;-369 
  2192                                  
  2193                                  
  2194                                  ;-370 int adrofname(unsigned int i) { adrF(GNameField, i); }
  2195 00000916 C9                       LEAVE
  2196 00000917 C3                       ret
  2197                                  ENDP
  2198                                  
  2199                                  adrofname: PROC;
  2200 00000918 C8000000                 ENTER  0,0
  2201 0000091C FF7604                   push word [bp+4]
  2202 0000091F 8D067879                 lea  ax, [GNameField]
  2203 00000923 50                       push ax
  2204 00000924 E8E2FF                   call adrF
  2205 00000927 83C404                   add  sp, 4
  2206                                  
  2207                                  ;-371 
  2208                                  
  2209                                  
  2210                                  ;-372 int printName(unsigned int i) {int j;
  2211 0000092A C9                       LEAVE
  2212 0000092B C3                       ret
  2213                                  ENDP
  2214                                  
  2215                                  printName: PROC
  2216                                  
  2217                                  ;-373   if (i < LSTART) { i=adrofname(i); prs(i); }
  2218                                  ;
  2219 0000092C C8020000                 ENTER  2,0
  2220 00000930 8B4604                   mov ax, [bp+4]
  2221 00000933 3DC800                   cmp ax, 200
  2222 00000936 0F8D1800                 jge .printName74
  2223 0000093A FF7604                   push word [bp+4]
  2224 0000093D E8D8FF                   call adrofname
  2225 00000940 83C402                   add  sp, 2
  2226 00000943 894604                   mov [bp+4], ax
  2227 00000946 FF7604                   push word [bp+4]
  2228 00000949 E89AFA                   call prs
  2229 0000094C 83C402                   add  sp, 2
  2230                                  
  2231                                  ;-374   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }
  2232                                  
  2233 0000094F E93800                   jmp .printName75
  2234                                  .printName74:
  2235 00000952 68[8C09]                 push printName_0
  2236 00000955 E88EFA                   call prs
  2237 00000958 83C402                   add  sp, 2
  2238 0000095B 8B5E04                   mov bx, [bp+4]
  2239 0000095E D1E3                     shl bx, 1
  2240 00000960 8B872077                 mov ax, [GData + bx]
  2241 00000964 8946FE                   mov [bp-2], ax
  2242 00000967 8B46FE                   mov ax, [bp-2]
  2243 0000096A 83F800                   cmp ax, 0
  2244 0000096D 0F8E0800                 jle .printName76
  2245 00000971 6A2B                     push 43
  2246 00000973 E817FA                   call prc
  2247 00000976 83C402                   add  sp, 2
  2248                                  .printName76:
  2249 00000979 FF76FE                   push word [bp-2]
  2250 0000097C E86CFB                   call pint1
  2251 0000097F 83C402                   add  sp, 2
  2252 00000982 6A5D                     push 93
  2253 00000984 E806FA                   call prc
  2254 00000987 83C402                   add  sp, 2
  2255                                  
  2256                                  ;-375 }
  2257                                  
  2258                                  .printName75:
  2259                                  
  2260                                  ;-376 int convertdefine() { int i; int j;   i=0;
  2261 0000098A C9                       LEAVE
  2262 0000098B C3                       ret
  2263 0000098C 5B627000                printName_0 db "[bp",0
  2264                                  ENDP
  2265                                  
  2266                                  convertdefine: PROC;
  2267 00000990 C8040000                 ENTER  4,0
  2268 00000994 B80000                   mov ax, 0
  2269 00000997 8946FE                   mov [bp-2], ax
  2270                                  
  2271                                  ;-377   while (i < GTop) {
  2272                                  
  2273                                  .convertdefine77:
  2274 0000099A 8B46FE                   mov ax, [bp-2]
  2275 0000099D 3B06[3900]               cmp ax, [GTop]
  2276 000009A1 0F8D4400                 jge .convertdefine78
  2277                                  
  2278                                  ;-378    j=adrofname(i);
  2279                                  
  2280 000009A5 FF76FE                   push word [bp-2]
  2281 000009A8 E86DFF                   call adrofname
  2282 000009AB 83C402                   add  sp, 2
  2283 000009AE 8946FC                   mov [bp-4], ax
  2284                                  
  2285                                  ;-379    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];
  2286                                  
  2287 000009B1 FF76FC                   push word [bp-4]
  2288 000009B4 8D06A36D                 lea  ax, [symbol]
  2289 000009B8 50                       push ax
  2290 000009B9 E8AAF8                   call eqstr
  2291 000009BC 83C404                   add  sp, 4
  2292 000009BF 08C0                     or  al, al
  2293 000009C1 0F841F00                 je .convertdefine79
  2294 000009C5 8B5EFE                   mov bx, [bp-2]
  2295 000009C8 8A87EC6E                 mov al, [GType + bx]
  2296 000009CC 3C23                     cmp al, 35
  2297 000009CE 0F851200                 jne .convertdefine80
  2298 000009D2 8B5EFE                   mov bx, [bp-2]
  2299 000009D5 D1E3                     shl bx, 1
  2300 000009D7 8B872077                 mov ax, [GData + bx]
  2301 000009DB A3[2C00]                 mov word [lexval], ax
  2302                                  
  2303                                  ;-380    return T_CONST; } }
  2304                                  
  2305 000009DE B80101                   mov ax, 257
  2306 000009E1 E90B00                   jmp .retnconvertdefine
  2307                                  .convertdefine80:
  2308                                  
  2309                                  ;-381    i++; }
  2310                                  
  2311                                  .convertdefine79:
  2312 000009E4 FF46FE                   inc  word[bp-2]
  2313                                  
  2314                                  ;-382    return 0; }
  2315                                  
  2316 000009E7 EBB1                     jmp .convertdefine77
  2317                                  .convertdefine78:
  2318 000009E9 B80000                   mov ax, 0
  2319 000009EC E90000                   jmp .retnconvertdefine
  2320                                  
  2321                                  ;-383 
  2322                                  
  2323                                  
  2324                                  ;-384 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR
  2325                                  
  2326 000009EF C9                       .retnconvertdefine: LEAVE
  2327 000009F0 C3                       ret
  2328                                  ENDP
  2329                                  
  2330                                  ifEOL: PROC
  2331                                  
  2332                                  ;-385     if (c == 10) return 1;//LF
  2333                                  ;
  2334 000009F1 C8000000                 ENTER  0,0
  2335 000009F5 8A4604                   mov al, [bp+4]
  2336 000009F8 3C0A                     cmp al, 10
  2337 000009FA 0F850600                 jne .ifEOL81
  2338 000009FE B80100                   mov ax, 1
  2339 00000A01 E92400                   jmp .retnifEOL
  2340                                  
  2341                                  ;-386     if (c == 13) {//CR
  2342                                  
  2343                                  .ifEOL81:
  2344 00000A04 8A4604                   mov al, [bp+4]
  2345 00000A07 3C0D                     cmp al, 13
  2346 00000A09 0F851500                 jne .ifEOL82
  2347                                  
  2348                                  ;-387         if (thechar == 10) c=next();
  2349                                  
  2350 00000A0D A0[2300]                 mov al, [thechar]
  2351 00000A10 3C0A                     cmp al, 10
  2352 00000A12 0F850600                 jne .ifEOL83
  2353 00000A16 E8C5FD                   call next
  2354 00000A19 884604                   mov [bp+4], al
  2355                                  
  2356                                  ;-388         return 1;
  2357                                  
  2358                                  .ifEOL83:
  2359 00000A1C B80100                   mov ax, 1
  2360 00000A1F E90600                   jmp .retnifEOL
  2361                                  
  2362                                  ;-389     }
  2363                                  
  2364                                  
  2365                                  ;-390     return 0;
  2366                                  
  2367                                  .ifEOL82:
  2368 00000A22 B80000                   mov ax, 0
  2369 00000A25 E90000                   jmp .retnifEOL
  2370                                  
  2371                                  ;-391 }
  2372                                  
  2373                                  
  2374                                  ;-392 
  2375                                  
  2376                                  
  2377                                  ;-393 char symboltemp[80];
  2378                                  
  2379 00000A28 C9                       .retnifEOL: LEAVE
  2380 00000A29 C3                       ret
  2381                                  ENDP
  2382                                  section .bss
  2383                                  absolute 56840
  2384 0000DE08 <res 00000050>          symboltemp resb 80
  2385                                  section .text
  2386                                  
  2387                                  ;-394 int getlex() { char c; char *p;
  2388                                  
  2389                                  
  2390                                  getlex: PROC
  2391                                  
  2392                                  ;-395 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;
  2393                                  ;
  2394 00000A2A C8040000                 ENTER  4,0
  2395                                  .g1:
  2396 00000A2E E8ADFD                   call next
  2397 00000A31 8846FE                   mov [bp-2], al
  2398 00000A34 8A46FE                   mov al, [bp-2]
  2399 00000A37 3C00                     cmp al, 0
  2400 00000A39 0F850600                 jne .getlex84
  2401 00000A3D B80000                   mov ax, 0
  2402 00000A40 E9DA04                   jmp .retngetlex
  2403                                  .getlex84:
  2404 00000A43 8A46FE                   mov al, [bp-2]
  2405 00000A46 3C20                     cmp al, 32
  2406 00000A48 0F8F0200                 jg  .getlex85
  2407 00000A4C EBE0                     jmp .g1
  2408                                  
  2409                                  ;-396   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}
  2410                                  
  2411                                  .getlex85:
  2412 00000A4E 8A46FE                   mov al, [bp-2]
  2413 00000A51 3C3D                     cmp al, 61
  2414 00000A53 0F851200                 jne .getlex86
  2415 00000A57 A0[2300]                 mov al, [thechar]
  2416 00000A5A 3C3D                     cmp al, 61
  2417 00000A5C 0F850900                 jne .getlex87
  2418 00000A60 E87BFD                   call next
  2419 00000A63 B82603                   mov ax, 806
  2420 00000A66 E9B404                   jmp .retngetlex
  2421                                  .getlex87:
  2422                                  
  2423                                  ;-397   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}
  2424                                  
  2425                                  .getlex86:
  2426 00000A69 8A46FE                   mov al, [bp-2]
  2427 00000A6C 3C21                     cmp al, 33
  2428 00000A6E 0F851200                 jne .getlex88
  2429 00000A72 A0[2300]                 mov al, [thechar]
  2430 00000A75 3C3D                     cmp al, 61
  2431 00000A77 0F850900                 jne .getlex89
  2432 00000A7B E860FD                   call next
  2433 00000A7E B82703                   mov ax, 807
  2434 00000A81 E99904                   jmp .retngetlex
  2435                                  .getlex89:
  2436                                  
  2437                                  ;-398   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}
  2438                                  
  2439                                  .getlex88:
  2440 00000A84 8A46FE                   mov al, [bp-2]
  2441 00000A87 3C3C                     cmp al, 60
  2442 00000A89 0F851200                 jne .getlex90
  2443 00000A8D A0[2300]                 mov al, [thechar]
  2444 00000A90 3C3D                     cmp al, 61
  2445 00000A92 0F850900                 jne .getlex91
  2446 00000A96 E845FD                   call next
  2447 00000A99 B83803                   mov ax, 824
  2448 00000A9C E97E04                   jmp .retngetlex
  2449                                  .getlex91:
  2450                                  
  2451                                  ;-399   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}
  2452                                  
  2453                                  .getlex90:
  2454 00000A9F 8A46FE                   mov al, [bp-2]
  2455 00000AA2 3C3E                     cmp al, 62
  2456 00000AA4 0F851200                 jne .getlex92
  2457 00000AA8 A0[2300]                 mov al, [thechar]
  2458 00000AAB 3C3D                     cmp al, 61
  2459 00000AAD 0F850900                 jne .getlex93
  2460 00000AB1 E82AFD                   call next
  2461 00000AB4 B82B03                   mov ax, 811
  2462 00000AB7 E96304                   jmp .retngetlex
  2463                                  .getlex93:
  2464                                  
  2465                                  ;-400   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}
  2466                                  
  2467                                  .getlex92:
  2468 00000ABA 8A46FE                   mov al, [bp-2]
  2469 00000ABD 3C3C                     cmp al, 60
  2470 00000ABF 0F851200                 jne .getlex94
  2471 00000AC3 A0[2300]                 mov al, [thechar]
  2472 00000AC6 3C3C                     cmp al, 60
  2473 00000AC8 0F850900                 jne .getlex95
  2474 00000ACC E80FFD                   call next
  2475 00000ACF B8D804                   mov ax, 1240
  2476 00000AD2 E94804                   jmp .retngetlex
  2477                                  .getlex95:
  2478                                  
  2479                                  ;-401   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}
  2480                                  
  2481                                  .getlex94:
  2482 00000AD5 8A46FE                   mov al, [bp-2]
  2483 00000AD8 3C3E                     cmp al, 62
  2484 00000ADA 0F851200                 jne .getlex96
  2485 00000ADE A0[2300]                 mov al, [thechar]
  2486 00000AE1 3C3E                     cmp al, 62
  2487 00000AE3 0F850900                 jne .getlex97
  2488 00000AE7 E8F4FC                   call next
  2489 00000AEA B8D904                   mov ax, 1241
  2490 00000AED E92D04                   jmp .retngetlex
  2491                                  .getlex97:
  2492                                  
  2493                                  ;-402   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}
  2494                                  
  2495                                  .getlex96:
  2496 00000AF0 8A46FE                   mov al, [bp-2]
  2497 00000AF3 3C2B                     cmp al, 43
  2498 00000AF5 0F851200                 jne .getlex98
  2499 00000AF9 A0[2300]                 mov al, [thechar]
  2500 00000AFC 3C2B                     cmp al, 43
  2501 00000AFE 0F850900                 jne .getlex99
  2502 00000B02 E8D9FC                   call next
  2503 00000B05 B8C304                   mov ax, 1219
  2504 00000B08 E91204                   jmp .retngetlex
  2505                                  .getlex99:
  2506                                  
  2507                                  ;-403   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}
  2508                                  
  2509                                  .getlex98:
  2510 00000B0B 8A46FE                   mov al, [bp-2]
  2511 00000B0E 3C2D                     cmp al, 45
  2512 00000B10 0F851200                 jne .getlex100
  2513 00000B14 A0[2300]                 mov al, [thechar]
  2514 00000B17 3C2D                     cmp al, 45
  2515 00000B19 0F850900                 jne .getlex101
  2516 00000B1D E8BEFC                   call next
  2517 00000B20 B8C904                   mov ax, 1225
  2518 00000B23 E9F703                   jmp .retngetlex
  2519                                  .getlex101:
  2520                                  
  2521                                  ;-404   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}
  2522                                  
  2523                                  .getlex100:
  2524 00000B26 8A46FE                   mov al, [bp-2]
  2525 00000B29 3C2B                     cmp al, 43
  2526 00000B2B 0F851200                 jne .getlex102
  2527 00000B2F A0[2300]                 mov al, [thechar]
  2528 00000B32 3C3D                     cmp al, 61
  2529 00000B34 0F850900                 jne .getlex103
  2530 00000B38 E8A3FC                   call next
  2531 00000B3B B8CE04                   mov ax, 1230
  2532 00000B3E E9DC03                   jmp .retngetlex
  2533                                  .getlex103:
  2534                                  
  2535                                  ;-405   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}
  2536                                  
  2537                                  .getlex102:
  2538 00000B41 8A46FE                   mov al, [bp-2]
  2539 00000B44 3C2D                     cmp al, 45
  2540 00000B46 0F851200                 jne .getlex104
  2541 00000B4A A0[2300]                 mov al, [thechar]
  2542 00000B4D 3C3D                     cmp al, 61
  2543 00000B4F 0F850900                 jne .getlex105
  2544 00000B53 E888FC                   call next
  2545 00000B56 B8CF04                   mov ax, 1231
  2546 00000B59 E9C103                   jmp .retngetlex
  2547                                  .getlex105:
  2548                                  
  2549                                  ;-406   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}
  2550                                  
  2551                                  .getlex104:
  2552 00000B5C 8A46FE                   mov al, [bp-2]
  2553 00000B5F 3C26                     cmp al, 38
  2554 00000B61 0F851200                 jne .getlex106
  2555 00000B65 A0[2300]                 mov al, [thechar]
  2556 00000B68 3C3D                     cmp al, 61
  2557 00000B6A 0F850900                 jne .getlex107
  2558 00000B6E E86DFC                   call next
  2559 00000B71 B8D204                   mov ax, 1234
  2560 00000B74 E9A603                   jmp .retngetlex
  2561                                  .getlex107:
  2562                                  
  2563                                  ;-407   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}
  2564                                  
  2565                                  .getlex106:
  2566 00000B77 8A46FE                   mov al, [bp-2]
  2567 00000B7A 3C7C                     cmp al, 124
  2568 00000B7C 0F851200                 jne .getlex108
  2569 00000B80 A0[2300]                 mov al, [thechar]
  2570 00000B83 3C3D                     cmp al, 61
  2571 00000B85 0F850900                 jne .getlex109
  2572 00000B89 E852FC                   call next
  2573 00000B8C B8D304                   mov ax, 1235
  2574 00000B8F E98B03                   jmp .retngetlex
  2575                                  .getlex109:
  2576                                  
  2577                                  ;-408   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}
  2578                                  
  2579                                  .getlex108:
  2580 00000B92 8A46FE                   mov al, [bp-2]
  2581 00000B95 3C2A                     cmp al, 42
  2582 00000B97 0F851200                 jne .getlex110
  2583 00000B9B A0[2300]                 mov al, [thechar]
  2584 00000B9E 3C3D                     cmp al, 61
  2585 00000BA0 0F850900                 jne .getlex111
  2586 00000BA4 E837FC                   call next
  2587 00000BA7 B8D004                   mov ax, 1232
  2588 00000BAA E97003                   jmp .retngetlex
  2589                                  .getlex111:
  2590                                  
  2591                                  ;-409   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}
  2592                                  
  2593                                  .getlex110:
  2594 00000BAD 8A46FE                   mov al, [bp-2]
  2595 00000BB0 3C2F                     cmp al, 47
  2596 00000BB2 0F851200                 jne .getlex112
  2597 00000BB6 A0[2300]                 mov al, [thechar]
  2598 00000BB9 3C3D                     cmp al, 61
  2599 00000BBB 0F850900                 jne .getlex113
  2600 00000BBF E81CFC                   call next
  2601 00000BC2 B8D104                   mov ax, 1233
  2602 00000BC5 E95503                   jmp .retngetlex
  2603                                  .getlex113:
  2604                                  
  2605                                  ;-410   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;
  2606                                  
  2607                                  .getlex112:
  2608 00000BC8 8A46FE                   mov al, byte [bp-2]
  2609 00000BCB B400                     mov ah, 0
  2610 00000BCD 50                       push ax
  2611 00000BCE 68[1F0F]                 push getlex_0
  2612 00000BD1 E846F7                   call instr1
  2613 00000BD4 83C404                   add  sp, 4
  2614 00000BD7 08C0                     or  al, al
  2615 00000BD9 0F840600                 je .getlex114
  2616 00000BDD 8A46FE                   mov al, [bp-2]
  2617 00000BE0 E93A03                   jmp .retngetlex
  2618                                  
  2619                                  ;-411   if (c == '/') { if (thechar == '/') {
  2620                                  
  2621                                  .getlex114:
  2622 00000BE3 8A46FE                   mov al, [bp-2]
  2623 00000BE6 3C2F                     cmp al, 47
  2624 00000BE8 0F852900                 jne .getlex115
  2625 00000BEC A0[2300]                 mov al, [thechar]
  2626 00000BEF 3C2F                     cmp al, 47
  2627 00000BF1 0F852000                 jne .getlex116
  2628                                  
  2629                                  ;-412       do c=next(); while(ifEOL(c)==0) return getlex(); } }
  2630                                  
  2631                                  .getlex117:
  2632 00000BF5 E8E6FB                   call next
  2633 00000BF8 8846FE                   mov [bp-2], al
  2634 00000BFB 8A46FE                   mov al, byte [bp-2]
  2635 00000BFE B400                     mov ah, 0
  2636 00000C00 50                       push ax
  2637 00000C01 E8EDFD                   call ifEOL
  2638 00000C04 83C402                   add  sp, 2
  2639 00000C07 3C00                     cmp al, 0
  2640 00000C09 0F850200                 jne .getlex118
  2641 00000C0D EBE6                     jmp .getlex117
  2642                                  .getlex118:
  2643 00000C0F E818FE                   call getlex
  2644 00000C12 E90803                   jmp .retngetlex
  2645                                  .getlex116:
  2646                                  
  2647                                  ;-413   if (c == '/') { if (thechar == '*') {
  2648                                  
  2649                                  .getlex115:
  2650 00000C15 8A46FE                   mov al, [bp-2]
  2651 00000C18 3C2F                     cmp al, 47
  2652 00000C1A 0F853A00                 jne .getlex119
  2653 00000C1E A0[2300]                 mov al, [thechar]
  2654 00000C21 3C2A                     cmp al, 42
  2655 00000C23 0F852B00                 jne .getlex120
  2656                                  
  2657                                  ;-414       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;
  2658                                  
  2659                                  .g2:
  2660 00000C27 E8B4FB                   call next
  2661 00000C2A 8846FE                   mov [bp-2], al
  2662 00000C2D 8A46FE                   mov al, [bp-2]
  2663 00000C30 3C2A                     cmp al, 42
  2664 00000C32 0F840200                 je  .getlex121
  2665 00000C36 EBEF                     jmp .g2
  2666                                  .getlex121:
  2667 00000C38 A0[2300]                 mov al, [thechar]
  2668 00000C3B 3C2F                     cmp al, 47
  2669 00000C3D 0F840200                 je  .getlex122
  2670 00000C41 EBE4                     jmp .g2
  2671                                  
  2672                                  ;-415       c=next(); return getlex(); } else  return '/'; }
  2673                                  
  2674                                  .getlex122:
  2675 00000C43 E898FB                   call next
  2676 00000C46 8846FE                   mov [bp-2], al
  2677 00000C49 E8DEFD                   call getlex
  2678 00000C4C E9CE02                   jmp .retngetlex
  2679 00000C4F E90600                   jmp .getlex123
  2680                                  .getlex120:
  2681 00000C52 B82F00                   mov ax, 47
  2682 00000C55 E9C502                   jmp .retngetlex
  2683                                  .getlex123:
  2684                                  
  2685                                  ;-416   if (c == '"') {getstring(c); return T_STRING;}
  2686                                  
  2687                                  .getlex119:
  2688 00000C58 8A46FE                   mov al, [bp-2]
  2689 00000C5B 3C22                     cmp al, 34
  2690 00000C5D 0F851200                 jne .getlex124
  2691 00000C61 8A46FE                   mov al, byte [bp-2]
  2692 00000C64 B400                     mov ah, 0
  2693 00000C66 50                       push ax
  2694 00000C67 E868FC                   call getstring
  2695 00000C6A 83C402                   add  sp, 2
  2696 00000C6D B80201                   mov ax, 258
  2697 00000C70 E9AA02                   jmp .retngetlex
  2698                                  
  2699                                  ;-417   if (digit(c)) { getdigit(c); return T_CONST; }
  2700                                  
  2701                                  .getlex124:
  2702 00000C73 8A46FE                   mov al, byte [bp-2]
  2703 00000C76 B400                     mov ah, 0
  2704 00000C78 50                       push ax
  2705 00000C79 E826F5                   call digit
  2706 00000C7C 83C402                   add  sp, 2
  2707 00000C7F 08C0                     or  al, al
  2708 00000C81 0F841200                 je .getlex125
  2709 00000C85 8A46FE                   mov al, byte [bp-2]
  2710 00000C88 B400                     mov ah, 0
  2711 00000C8A 50                       push ax
  2712 00000C8B E86EFB                   call getdigit
  2713 00000C8E 83C402                   add  sp, 2
  2714 00000C91 B80101                   mov ax, 257
  2715 00000C94 E98602                   jmp .retngetlex
  2716                                  
  2717                                  ;-418   if (c==39) { lexval=next();
  2718                                  
  2719                                  .getlex125:
  2720 00000C97 8A46FE                   mov al, [bp-2]
  2721 00000C9A 3C27                     cmp al, 39
  2722 00000C9C 0F854F00                 jne .getlex126
  2723 00000CA0 E83BFB                   call next
  2724 00000CA3 A3[2C00]                 mov word [lexval], ax
  2725                                  
  2726                                  ;-419     if (lexval==92) {lexval=next();
  2727                                  
  2728 00000CA6 A1[2C00]                 mov ax, [lexval]
  2729 00000CA9 83F85C                   cmp ax, 92
  2730 00000CAC 0F853600                 jne .getlex127
  2731 00000CB0 E82BFB                   call next
  2732 00000CB3 A3[2C00]                 mov word [lexval], ax
  2733                                  
  2734                                  ;-420       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;
  2735                                  
  2736 00000CB6 A1[2C00]                 mov ax, [lexval]
  2737 00000CB9 83F86E                   cmp ax, 110
  2738 00000CBC 0F850600                 jne .getlex128
  2739 00000CC0 B80A00                   mov ax, 10
  2740 00000CC3 A3[2C00]                 mov word [lexval], ax
  2741                                  .getlex128:
  2742 00000CC6 A1[2C00]                 mov ax, [lexval]
  2743 00000CC9 83F874                   cmp ax, 116
  2744 00000CCC 0F850600                 jne .getlex129
  2745 00000CD0 B80900                   mov ax, 9
  2746 00000CD3 A3[2C00]                 mov word [lexval], ax
  2747                                  
  2748                                  ;-421       if (lexval=='0') lexval= 0; } next(); return T_CONST; }
  2749                                  
  2750                                  .getlex129:
  2751 00000CD6 A1[2C00]                 mov ax, [lexval]
  2752 00000CD9 83F830                   cmp ax, 48
  2753 00000CDC 0F850600                 jne .getlex130
  2754 00000CE0 B80000                   mov ax, 0
  2755 00000CE3 A3[2C00]                 mov word [lexval], ax
  2756                                  .getlex130:
  2757                                  .getlex127:
  2758 00000CE6 E8F5FA                   call next
  2759 00000CE9 B80101                   mov ax, 257
  2760 00000CEC E92E02                   jmp .retngetlex
  2761                                  
  2762                                  ;-422   if (alnum(c)) {
  2763                                  
  2764                                  .getlex126:
  2765 00000CEF 8A46FE                   mov al, byte [bp-2]
  2766 00000CF2 B400                     mov ah, 0
  2767 00000CF4 50                       push ax
  2768 00000CF5 E8D4F4                   call alnum
  2769 00000CF8 83C402                   add  sp, 2
  2770 00000CFB 08C0                     or  al, al
  2771 00000CFD 0F841302                 je .getlex131
  2772                                  
  2773                                  ;-423     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;
  2774                                  
  2775 00000D01 8D06A36D                 lea  ax, [symbol]
  2776 00000D05 50                       push ax
  2777 00000D06 8D0608DE                 lea  ax, [symboltemp]
  2778 00000D0A 50                       push ax
  2779 00000D0B E822F5                   call strcpy
  2780 00000D0E 83C404                   add  sp, 4
  2781 00000D11 B8A36D                   mov ax, symbol
  2782 00000D14 8946FC                   mov [bp-4], ax
  2783 00000D17 8A46FE                   mov al, [bp-2]
  2784 00000D1A 8B5EFC                   mov  bx, [bp-4]
  2785 00000D1D 8807                     mov  [bx], al
  2786 00000D1F FF46FC                   inc  word[bp-4]
  2787                                  
  2788                                  ;-424     while(alnum(thechar)) {c=next(); *p=c;  p++; }
  2789                                  
  2790                                  .getlex132:
  2791 00000D22 A0[2300]                 mov al, byte [thechar]
  2792 00000D25 B400                     mov ah, 0
  2793 00000D27 50                       push ax
  2794 00000D28 E8A1F4                   call alnum
  2795 00000D2B 83C402                   add  sp, 2
  2796 00000D2E 08C0                     or  al, al
  2797 00000D30 0F841300                 je .getlex133
  2798 00000D34 E8A7FA                   call next
  2799 00000D37 8846FE                   mov [bp-2], al
  2800 00000D3A 8A46FE                   mov al, [bp-2]
  2801 00000D3D 8B5EFC                   mov  bx, [bp-4]
  2802 00000D40 8807                     mov  [bx], al
  2803 00000D42 FF46FC                   inc  word[bp-4]
  2804                                  
  2805                                  ;-425       *p=0;
  2806                                  
  2807 00000D45 EBDB                     jmp .getlex132
  2808                                  .getlex133:
  2809 00000D47 B80000                   mov ax, 0
  2810 00000D4A 8B5EFC                   mov  bx, [bp-4]
  2811 00000D4D 8807                     mov  [bx], al
  2812                                  
  2813                                  ;-426     if (eqstr(symbol,"signed"  )) return T_SIGNED;
  2814                                  
  2815 00000D4F 68[350F]                 push getlex_1
  2816 00000D52 8D06A36D                 lea  ax, [symbol]
  2817 00000D56 50                       push ax
  2818 00000D57 E80CF5                   call eqstr
  2819 00000D5A 83C404                   add  sp, 4
  2820 00000D5D 08C0                     or  al, al
  2821 00000D5F 0F840600                 je .getlex134
  2822 00000D63 B81302                   mov ax, 531
  2823 00000D66 E9B401                   jmp .retngetlex
  2824                                  
  2825                                  ;-427     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;
  2826                                  
  2827                                  .getlex134:
  2828 00000D69 68[3C0F]                 push getlex_2
  2829 00000D6C 8D06A36D                 lea  ax, [symbol]
  2830 00000D70 50                       push ax
  2831 00000D71 E8F2F4                   call eqstr
  2832 00000D74 83C404                   add  sp, 4
  2833 00000D77 08C0                     or  al, al
  2834 00000D79 0F840600                 je .getlex135
  2835 00000D7D B81402                   mov ax, 532
  2836 00000D80 E99A01                   jmp .retngetlex
  2837                                  
  2838                                  ;-428     if (eqstr(symbol,"void"    )) return T_VOID;
  2839                                  
  2840                                  .getlex135:
  2841 00000D83 68[450F]                 push getlex_3
  2842 00000D86 8D06A36D                 lea  ax, [symbol]
  2843 00000D8A 50                       push ax
  2844 00000D8B E8D8F4                   call eqstr
  2845 00000D8E 83C404                   add  sp, 4
  2846 00000D91 08C0                     or  al, al
  2847 00000D93 0F840600                 je .getlex136
  2848 00000D97 B81102                   mov ax, 529
  2849 00000D9A E98001                   jmp .retngetlex
  2850                                  
  2851                                  ;-429     if (eqstr(symbol,"int"     )) return T_INT;
  2852                                  
  2853                                  .getlex136:
  2854 00000D9D 68[4A0F]                 push getlex_4
  2855 00000DA0 8D06A36D                 lea  ax, [symbol]
  2856 00000DA4 50                       push ax
  2857 00000DA5 E8BEF4                   call eqstr
  2858 00000DA8 83C404                   add  sp, 4
  2859 00000DAB 08C0                     or  al, al
  2860 00000DAD 0F840600                 je .getlex137
  2861 00000DB1 B80502                   mov ax, 517
  2862 00000DB4 E96601                   jmp .retngetlex
  2863                                  
  2864                                  ;-430     if (eqstr(symbol,"long"    )) return T_LONG;
  2865                                  
  2866                                  .getlex137:
  2867 00000DB7 68[4E0F]                 push getlex_5
  2868 00000DBA 8D06A36D                 lea  ax, [symbol]
  2869 00000DBE 50                       push ax
  2870 00000DBF E8A4F4                   call eqstr
  2871 00000DC2 83C404                   add  sp, 4
  2872 00000DC5 08C0                     or  al, al
  2873 00000DC7 0F840600                 je .getlex138
  2874 00000DCB B81502                   mov ax, 533
  2875 00000DCE E94C01                   jmp .retngetlex
  2876                                  
  2877                                  ;-431     if (eqstr(symbol,"char"    )) return T_CHAR;
  2878                                  
  2879                                  .getlex138:
  2880 00000DD1 68[530F]                 push getlex_6
  2881 00000DD4 8D06A36D                 lea  ax, [symbol]
  2882 00000DD8 50                       push ax
  2883 00000DD9 E88AF4                   call eqstr
  2884 00000DDC 83C404                   add  sp, 4
  2885 00000DDF 08C0                     or  al, al
  2886 00000DE1 0F840600                 je .getlex139
  2887 00000DE5 B81202                   mov ax, 530
  2888 00000DE8 E93201                   jmp .retngetlex
  2889                                  
  2890                                  ;-432     if (eqstr(symbol,"asm"     )) return T_ASM;
  2891                                  
  2892                                  .getlex139:
  2893 00000DEB 68[580F]                 push getlex_7
  2894 00000DEE 8D06A36D                 lea  ax, [symbol]
  2895 00000DF2 50                       push ax
  2896 00000DF3 E870F4                   call eqstr
  2897 00000DF6 83C404                   add  sp, 4
  2898 00000DF9 08C0                     or  al, al
  2899 00000DFB 0F840600                 je .getlex140
  2900 00000DFF B80602                   mov ax, 518
  2901 00000E02 E91801                   jmp .retngetlex
  2902                                  
  2903                                  ;-433     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;
  2904                                  
  2905                                  .getlex140:
  2906 00000E05 68[5C0F]                 push getlex_8
  2907 00000E08 8D06A36D                 lea  ax, [symbol]
  2908 00000E0C 50                       push ax
  2909 00000E0D E856F4                   call eqstr
  2910 00000E10 83C404                   add  sp, 4
  2911 00000E13 08C0                     or  al, al
  2912 00000E15 0F840600                 je .getlex141
  2913 00000E19 B80702                   mov ax, 519
  2914 00000E1C E9FE00                   jmp .retngetlex
  2915                                  
  2916                                  ;-434     if (eqstr(symbol,"__emit__")) return T_EMIT;
  2917                                  
  2918                                  .getlex141:
  2919 00000E1F 68[620F]                 push getlex_9
  2920 00000E22 8D06A36D                 lea  ax, [symbol]
  2921 00000E26 50                       push ax
  2922 00000E27 E83CF4                   call eqstr
  2923 00000E2A 83C404                   add  sp, 4
  2924 00000E2D 08C0                     or  al, al
  2925 00000E2F 0F840600                 je .getlex142
  2926 00000E33 B80802                   mov ax, 520
  2927 00000E36 E9E400                   jmp .retngetlex
  2928                                  
  2929                                  ;-435     if (eqstr(symbol,"return"  )) return T_RETURN;
  2930                                  
  2931                                  .getlex142:
  2932 00000E39 68[6B0F]                 push getlex_10
  2933 00000E3C 8D06A36D                 lea  ax, [symbol]
  2934 00000E40 50                       push ax
  2935 00000E41 E822F4                   call eqstr
  2936 00000E44 83C404                   add  sp, 4
  2937 00000E47 08C0                     or  al, al
  2938 00000E49 0F840600                 je .getlex143
  2939 00000E4D B80002                   mov ax, 512
  2940 00000E50 E9CA00                   jmp .retngetlex
  2941                                  
  2942                                  ;-436     if (eqstr(symbol,"if"      )) return T_IF;
  2943                                  
  2944                                  .getlex143:
  2945 00000E53 68[720F]                 push getlex_11
  2946 00000E56 8D06A36D                 lea  ax, [symbol]
  2947 00000E5A 50                       push ax
  2948 00000E5B E808F4                   call eqstr
  2949 00000E5E 83C404                   add  sp, 4
  2950 00000E61 08C0                     or  al, al
  2951 00000E63 0F840600                 je .getlex144
  2952 00000E67 B80102                   mov ax, 513
  2953 00000E6A E9B000                   jmp .retngetlex
  2954                                  
  2955                                  ;-437     if (eqstr(symbol,"else"    )) return T_ELSE;
  2956                                  
  2957                                  .getlex144:
  2958 00000E6D 68[750F]                 push getlex_12
  2959 00000E70 8D06A36D                 lea  ax, [symbol]
  2960 00000E74 50                       push ax
  2961 00000E75 E8EEF3                   call eqstr
  2962 00000E78 83C404                   add  sp, 4
  2963 00000E7B 08C0                     or  al, al
  2964 00000E7D 0F840600                 je .getlex145
  2965 00000E81 B80202                   mov ax, 514
  2966 00000E84 E99600                   jmp .retngetlex
  2967                                  
  2968                                  ;-438     if (eqstr(symbol,"while"   )) return T_WHILE;
  2969                                  
  2970                                  .getlex145:
  2971 00000E87 68[7A0F]                 push getlex_13
  2972 00000E8A 8D06A36D                 lea  ax, [symbol]
  2973 00000E8E 50                       push ax
  2974 00000E8F E8D4F3                   call eqstr
  2975 00000E92 83C404                   add  sp, 4
  2976 00000E95 08C0                     or  al, al
  2977 00000E97 0F840600                 je .getlex146
  2978 00000E9B B80302                   mov ax, 515
  2979 00000E9E E97C00                   jmp .retngetlex
  2980                                  
  2981                                  ;-439     if (eqstr(symbol,"do"      )) return T_DO;
  2982                                  
  2983                                  .getlex146:
  2984 00000EA1 68[800F]                 push getlex_14
  2985 00000EA4 8D06A36D                 lea  ax, [symbol]
  2986 00000EA8 50                       push ax
  2987 00000EA9 E8BAF3                   call eqstr
  2988 00000EAC 83C404                   add  sp, 4
  2989 00000EAF 08C0                     or  al, al
  2990 00000EB1 0F840600                 je .getlex147
  2991 00000EB5 B80402                   mov ax, 516
  2992 00000EB8 E96200                   jmp .retngetlex
  2993                                  
  2994                                  ;-440     if (eqstr(symbol,"goto"    )) return T_GOTO;
  2995                                  
  2996                                  .getlex147:
  2997 00000EBB 68[830F]                 push getlex_15
  2998 00000EBE 8D06A36D                 lea  ax, [symbol]
  2999 00000EC2 50                       push ax
  3000 00000EC3 E8A0F3                   call eqstr
  3001 00000EC6 83C404                   add  sp, 4
  3002 00000EC9 08C0                     or  al, al
  3003 00000ECB 0F840600                 je .getlex148
  3004 00000ECF B80902                   mov ax, 521
  3005 00000ED2 E94800                   jmp .retngetlex
  3006                                  
  3007                                  ;-441     if (eqstr(symbol,"define"  )) return T_DEFINE;
  3008                                  
  3009                                  .getlex148:
  3010 00000ED5 68[880F]                 push getlex_16
  3011 00000ED8 8D06A36D                 lea  ax, [symbol]
  3012 00000EDC 50                       push ax
  3013 00000EDD E886F3                   call eqstr
  3014 00000EE0 83C404                   add  sp, 4
  3015 00000EE3 08C0                     or  al, al
  3016 00000EE5 0F840600                 je .getlex149
  3017 00000EE9 B8FF01                   mov ax, 511
  3018 00000EEC E92E00                   jmp .retngetlex
  3019                                  
  3020                                  ;-442     if (convertdefine() ) {
  3021                                  
  3022                                  .getlex149:
  3023 00000EEF E89EFA                   call convertdefine
  3024 00000EF2 08C0                     or  al, al
  3025 00000EF4 0F841600                 je .getlex150
  3026                                  
  3027                                  ;-443         strcpy(symbol, symboltemp); return T_CONST;
  3028                                  
  3029 00000EF8 8D0608DE                 lea  ax, [symboltemp]
  3030 00000EFC 50                       push ax
  3031 00000EFD 8D06A36D                 lea  ax, [symbol]
  3032 00000F01 50                       push ax
  3033 00000F02 E82BF3                   call strcpy
  3034 00000F05 83C404                   add  sp, 4
  3035 00000F08 B80101                   mov ax, 257
  3036 00000F0B E90F00                   jmp .retngetlex
  3037                                  
  3038                                  ;-444     }
  3039                                  
  3040                                  
  3041                                  ;-445     return T_NAME; } error1("Input item not recognized");
  3042                                  
  3043                                  .getlex150:
  3044 00000F0E B80001                   mov ax, 256
  3045 00000F11 E90900                   jmp .retngetlex
  3046                                  .getlex131:
  3047 00000F14 68[8F0F]                 push getlex_17
  3048 00000F17 E8EDF6                   call error1
  3049 00000F1A 83C402                   add  sp, 2
  3050                                  
  3051                                  ;-446 }
  3052                                  
  3053                                  
  3054                                  ;-447 
  3055                                  
  3056                                  
  3057                                  ;-448 int istoken(int t) {
  3058                                  
  3059 00000F1D C9                       .retngetlex: LEAVE
  3060 00000F1E C3                       ret
  3061 00000F1F 28295B5D7B7D2C3B2A-     getlex_0 db "()[]{},;*:%-><=+!&|#?",0
  3062 00000F28 3A252D3E3C3D2B2126-
  3063 00000F31 7C233F00           
  3064 00000F35 7369676E656400          getlex_1 db "signed",0
  3065 00000F3C 756E7369676E656400      getlex_2 db "unsigned",0
  3066 00000F45 766F696400              getlex_3 db "void",0
  3067 00000F4A 696E7400                getlex_4 db "int",0
  3068 00000F4E 6C6F6E6700              getlex_5 db "long",0
  3069 00000F53 6368617200              getlex_6 db "char",0
  3070 00000F58 61736D00                getlex_7 db "asm",0
  3071 00000F5C 5F5F61736D00            getlex_8 db "__asm",0
  3072 00000F62 5F5F656D69745F5F00      getlex_9 db "__emit__",0
  3073 00000F6B 72657475726E00          getlex_10 db "return",0
  3074 00000F72 696600                  getlex_11 db "if",0
  3075 00000F75 656C736500              getlex_12 db "else",0
  3076 00000F7A 7768696C6500            getlex_13 db "while",0
  3077 00000F80 646F00                  getlex_14 db "do",0
  3078 00000F83 676F746F00              getlex_15 db "goto",0
  3079 00000F88 646566696E6500          getlex_16 db "define",0
  3080 00000F8F 496E70757420697465-     getlex_17 db "Input item not recognized",0
  3081 00000F98 6D206E6F7420726563-
  3082 00000FA1 6F676E697A656400   
  3083                                  ENDP
  3084                                  
  3085                                  istoken: PROC
  3086                                  
  3087                                  ;-449     if (token == t) {
  3088                                  ;
  3089 00000FA9 C8000000                 ENTER  0,0
  3090 00000FAD A1[1E00]                 mov ax, [token]
  3091 00000FB0 3B4604                   cmp ax, [bp+4]
  3092 00000FB3 0F850C00                 jne .istoken151
  3093                                  
  3094                                  ;-450         token=getlex();
  3095                                  
  3096 00000FB7 E870FA                   call getlex
  3097 00000FBA A3[1E00]                 mov word [token], ax
  3098                                  
  3099                                  ;-451         return 1;
  3100                                  
  3101 00000FBD B80100                   mov ax, 1
  3102 00000FC0 E90600                   jmp .retnistoken
  3103                                  
  3104                                  ;-452     }
  3105                                  
  3106                                  
  3107                                  ;-453     return 0;
  3108                                  
  3109                                  .istoken151:
  3110 00000FC3 B80000                   mov ax, 0
  3111 00000FC6 E90000                   jmp .retnistoken
  3112                                  
  3113                                  ;-454 }
  3114                                  
  3115                                  
  3116                                  ;-455 int expect(int t) {
  3117                                  
  3118 00000FC9 C9                       .retnistoken: LEAVE
  3119 00000FCA C3                       ret
  3120                                  ENDP
  3121                                  
  3122                                  expect: PROC
  3123                                  
  3124                                  ;-456     if (istoken(t)==0) {
  3125                                  ;
  3126 00000FCB C8000000                 ENTER  0,0
  3127 00000FCF FF7604                   push word [bp+4]
  3128 00000FD2 E8D4FF                   call istoken
  3129 00000FD5 83C402                   add  sp, 2
  3130 00000FD8 83F800                   cmp ax, 0
  3131 00000FDB 0F852F00                 jne .expect152
  3132                                  
  3133                                  ;-457         *cloc=0;
  3134                                  
  3135 00000FDF B80000                   mov ax, 0
  3136 00000FE2 8B1E[1800]               mov  bx, [cloc]
  3137 00000FE6 8807                     mov  [bx], al
  3138                                  
  3139                                  ;-458         prs(co);
  3140                                  
  3141 00000FE8 8D06A861                 lea  ax, [co]
  3142 00000FEC 50                       push ax
  3143 00000FED E8F6F3                   call prs
  3144 00000FF0 83C402                   add  sp, 2
  3145                                  
  3146                                  ;-459         prs("\nExpected ASCII(dez): ");
  3147                                  
  3148 00000FF3 68[1010]                 push expect_0
  3149 00000FF6 E8EDF3                   call prs
  3150 00000FF9 83C402                   add  sp, 2
  3151                                  
  3152                                  ;-460         pint1(t);
  3153                                  
  3154 00000FFC FF7604                   push word [bp+4]
  3155 00000FFF E8E9F4                   call pint1
  3156 00001002 83C402                   add  sp, 2
  3157                                  
  3158                                  ;-461         error1(" not found");
  3159                                  
  3160 00001005 68[2810]                 push expect_1
  3161 00001008 E8FCF5                   call error1
  3162 0000100B 83C402                   add  sp, 2
  3163                                  
  3164                                  ;-462     }
  3165                                  
  3166                                  
  3167                                  ;-463 }
  3168                                  
  3169                                  .expect152:
  3170                                  
  3171                                  ;-464 
  3172                                  
  3173                                  
  3174                                  ;-465 
  3175                                  
  3176                                  
  3177                                  ;-466 int a(unsigned int i) { printName(i);//address
  3178 0000100E C9                       LEAVE
  3179 0000100F C3                       ret
  3180 00001010 5C6E45787065637465-     expect_0 db "\nExpected ASCII(dez): ",0
  3181 00001019 642041534349492864-
  3182 00001022 657A293A2000       
  3183 00001028 206E6F7420666F756E-     expect_1 db " not found",0
  3184 00001031 6400               
  3185                                  ENDP
  3186                                  
  3187                                  a: PROC;
  3188 00001033 C8000000                 ENTER  0,0
  3189 00001037 FF7604                   push word [bp+4]
  3190 0000103A E8EFF8                   call printName
  3191 0000103D 83C402                   add  sp, 2
  3192                                  
  3193                                  ;-467 }
  3194                                  
  3195                                  
  3196                                  ;-468 int v(unsigned int i) {//value
  3197 00001040 C9                       LEAVE
  3198 00001041 C3                       ret
  3199                                  ENDP
  3200                                  
  3201                                  v: PROC
  3202                                  
  3203                                  ;-469     if (i < LSTART) prc('[');
  3204                                  ;
  3205 00001042 C8000000                 ENTER  0,0
  3206 00001046 8B4604                   mov ax, [bp+4]
  3207 00001049 3DC800                   cmp ax, 200
  3208 0000104C 0F8D0800                 jge .v153
  3209 00001050 6A5B                     push 91
  3210 00001052 E838F3                   call prc
  3211 00001055 83C402                   add  sp, 2
  3212                                  
  3213                                  ;-470     printName(i);
  3214                                  
  3215                                  .v153:
  3216 00001058 FF7604                   push word [bp+4]
  3217 0000105B E8CEF8                   call printName
  3218 0000105E 83C402                   add  sp, 2
  3219                                  
  3220                                  ;-471     if (i < LSTART) prc(']');
  3221                                  
  3222 00001061 8B4604                   mov ax, [bp+4]
  3223 00001064 3DC800                   cmp ax, 200
  3224 00001067 0F8D0800                 jge .v154
  3225 0000106B 6A5D                     push 93
  3226 0000106D E81DF3                   call prc
  3227 00001070 83C402                   add  sp, 2
  3228                                  
  3229                                  ;-472 }
  3230                                  
  3231                                  .v154:
  3232                                  
  3233                                  ;-473 int checknamelen() {
  3234 00001073 C9                       LEAVE
  3235 00001074 C3                       ret
  3236                                  ENDP
  3237                                  
  3238                                  checknamelen: PROC
  3239                                  
  3240                                  ;-474     int i;
  3241                                  
  3242                                  
  3243                                  ;-475     i=strlen(symbol);
  3244                                  ;
  3245 00001075 C8020000                 ENTER  2,0
  3246 00001079 8D06A36D                 lea  ax, [symbol]
  3247 0000107D 50                       push ax
  3248 0000107E E887F1                   call strlen
  3249 00001081 83C402                   add  sp, 2
  3250 00001084 8946FE                   mov [bp-2], ax
  3251                                  
  3252                                  ;-476     if (i > IDLENMAX) error1("Item name is too long in characters)");
  3253                                  
  3254 00001087 8B46FE                   mov ax, [bp-2]
  3255 0000108A 83F80F                   cmp ax, 15
  3256 0000108D 0F8E0900                 jle .checknamelen155
  3257 00001091 68[9C10]                 push checknamelen_0
  3258 00001094 E870F5                   call error1
  3259 00001097 83C402                   add  sp, 2
  3260                                  
  3261                                  ;-477 }
  3262                                  
  3263                                  .checknamelen155:
  3264                                  
  3265                                  ;-478 
  3266                                  
  3267                                  
  3268                                  ;-479 int checkName() { unsigned int i; unsigned int j;
  3269 0000109A C9                       LEAVE
  3270 0000109B C3                       ret
  3271 0000109C 4974656D206E616D65-     checknamelen_0 db "Item name is too long in characters)",0
  3272 000010A5 20697320746F6F206C-
  3273 000010AE 6F6E6720696E206368-
  3274 000010B7 617261637465727329-
  3275 000010C0 00                 
  3276                                  ENDP
  3277                                  
  3278                                  checkName: PROC
  3279                                  
  3280                                  ;-480   i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  3281                                  ;
  3282 000010C1 C8040000                 ENTER  4,0
  3283 000010C5 B8C800                   mov ax, 200
  3284 000010C8 8946FE                   mov [bp-2], ax
  3285                                  .checkName156:
  3286 000010CB 8B46FE                   mov ax, [bp-2]
  3287 000010CE 3B06[3B00]               cmp ax, [LTop]
  3288 000010D2 0F8D2B00                 jge .checkName157
  3289 000010D6 FF76FE                   push word [bp-2]
  3290 000010D9 E83CF8                   call adrofname
  3291 000010DC 83C402                   add  sp, 2
  3292 000010DF 8946FC                   mov [bp-4], ax
  3293 000010E2 FF76FC                   push word [bp-4]
  3294 000010E5 8D06A36D                 lea  ax, [symbol]
  3295 000010E9 50                       push ax
  3296 000010EA E879F1                   call eqstr
  3297 000010ED 83C404                   add  sp, 4
  3298 000010F0 08C0                     or  al, al
  3299 000010F2 0F840600                 je .checkName158
  3300 000010F6 8B46FE                   mov ax, [bp-2]
  3301 000010F9 E94700                   jmp .retncheckName
  3302                                  .checkName158:
  3303 000010FC FF46FE                   inc  word[bp-2]
  3304                                  
  3305                                  ;-481   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  3306                                  
  3307 000010FF EBCA                     jmp .checkName156
  3308                                  .checkName157:
  3309 00001101 B80100                   mov ax, 1
  3310 00001104 8946FE                   mov [bp-2], ax
  3311                                  .checkName159:
  3312 00001107 8B46FE                   mov ax, [bp-2]
  3313 0000110A 3B06[3900]               cmp ax, [GTop]
  3314 0000110E 0F8D2B00                 jge .checkName160
  3315 00001112 FF76FE                   push word [bp-2]
  3316 00001115 E800F8                   call adrofname
  3317 00001118 83C402                   add  sp, 2
  3318 0000111B 8946FC                   mov [bp-4], ax
  3319 0000111E FF76FC                   push word [bp-4]
  3320 00001121 8D06A36D                 lea  ax, [symbol]
  3321 00001125 50                       push ax
  3322 00001126 E83DF1                   call eqstr
  3323 00001129 83C404                   add  sp, 4
  3324 0000112C 08C0                     or  al, al
  3325 0000112E 0F840600                 je .checkName161
  3326 00001132 8B46FE                   mov ax, [bp-2]
  3327 00001135 E90B00                   jmp .retncheckName
  3328                                  .checkName161:
  3329 00001138 FF46FE                   inc  word[bp-2]
  3330                                  
  3331                                  ;-482   return 0;
  3332                                  
  3333 0000113B EBCA                     jmp .checkName159
  3334                                  .checkName160:
  3335 0000113D B80000                   mov ax, 0
  3336 00001140 E90000                   jmp .retncheckName
  3337                                  
  3338                                  ;-483 }
  3339                                  
  3340                                  
  3341                                  ;-484 int searchname() { unsigned int i;
  3342                                  
  3343 00001143 C9                       .retncheckName: LEAVE
  3344 00001144 C3                       ret
  3345                                  ENDP
  3346                                  
  3347                                  searchname: PROC
  3348                                  
  3349                                  ;-485   i=checkName(); if (i == 0) error1("Variable unknown");
  3350                                  ;
  3351 00001145 C8020000                 ENTER  2,0
  3352 00001149 E875FF                   call checkName
  3353 0000114C 8946FE                   mov [bp-2], ax
  3354 0000114F 8B46FE                   mov ax, [bp-2]
  3355 00001152 83F800                   cmp ax, 0
  3356 00001155 0F850900                 jne .searchname162
  3357 00001159 68[7F11]                 push searchname_0
  3358 0000115C E8A8F4                   call error1
  3359 0000115F 83C402                   add  sp, 2
  3360                                  
  3361                                  ;-486   GUsed[i]=GUsed[i] + 1; return i;
  3362                                  
  3363                                  .searchname162:
  3364 00001162 8B5EFE                   mov bx, [bp-2]
  3365 00001165 D1E3                     shl bx, 1
  3366 00001167 8B87C874                 mov ax, [GUsed + bx]
  3367 0000116B 83C001                   add ax, 1
  3368 0000116E 8B5EFE                   mov bx, [bp-2]
  3369 00001171 D1E3                     shl bx, 1
  3370 00001173 8987C874                 mov [GUsed+bx], ax
  3371 00001177 8B46FE                   mov ax, [bp-2]
  3372 0000117A E90000                   jmp .retnsearchname
  3373                                  
  3374                                  ;-487 }
  3375                                  
  3376                                  
  3377                                  ;-488 int name1() {
  3378                                  
  3379 0000117D C9                       .retnsearchname: LEAVE
  3380 0000117E C3                       ret
  3381 0000117F 5661726961626C6520-     searchname_0 db "Variable unknown",0
  3382 00001188 756E6B6E6F776E00   
  3383                                  ENDP
  3384                                  
  3385                                  name1: PROC
  3386                                  
  3387                                  ;-489     if (token!=T_NAME) error1("Name expected");
  3388                                  
  3389 00001190 A1[1E00]                 mov ax, [token]
  3390 00001193 3D0001                   cmp ax, 256
  3391 00001196 0F840900                 je  .name1163
  3392 0000119A 68[AA11]                 push name1_0
  3393 0000119D E867F4                   call error1
  3394 000011A0 83C402                   add  sp, 2
  3395                                  
  3396                                  ;-490     token=getlex();
  3397                                  
  3398                                  .name1163:
  3399 000011A3 E884F8                   call getlex
  3400 000011A6 A3[1E00]                 mov word [token], ax
  3401                                  
  3402                                  ;-491 }
  3403                                  
  3404                                  
  3405                                  ;-492 int typeName() { int m; //0=V,1=*,2=&
  3406                                  
  3407 000011A9 C3                       ret
  3408 000011AA 4E616D652065787065-     name1_0 db "Name expected",0
  3409 000011B3 6374656400         
  3410                                  ENDP
  3411                                  
  3412                                  typeName: PROC
  3413                                  
  3414                                  ;-493     issign='S';
  3415                                  ;
  3416 000011B8 C8020000                 ENTER  2,0
  3417 000011BC B85300                   mov ax, 83
  3418 000011BF A2[3300]                 mov byte [issign], al
  3419                                  
  3420                                  ;-494     if(istoken(T_SIGNED))   issign='S';
  3421                                  
  3422 000011C2 681302                   push 531
  3423 000011C5 E8E1FD                   call istoken
  3424 000011C8 83C402                   add  sp, 2
  3425 000011CB 08C0                     or  al, al
  3426 000011CD 0F840600                 je .typeName164
  3427 000011D1 B85300                   mov ax, 83
  3428 000011D4 A2[3300]                 mov byte [issign], al
  3429                                  
  3430                                  ;-495     if(istoken(T_UNSIGNED)) issign='U';
  3431                                  
  3432                                  .typeName164:
  3433 000011D7 681402                   push 532
  3434 000011DA E8CCFD                   call istoken
  3435 000011DD 83C402                   add  sp, 2
  3436 000011E0 08C0                     or  al, al
  3437 000011E2 0F840600                 je .typeName165
  3438 000011E6 B85500                   mov ax, 85
  3439 000011E9 A2[3300]                 mov byte [issign], al
  3440                                  
  3441                                  ;-496     iswidth=2;
  3442                                  
  3443                                  .typeName165:
  3444 000011EC B80200                   mov ax, 2
  3445 000011EF A2[3600]                 mov byte [iswidth], al
  3446                                  
  3447                                  ;-497     if(istoken(T_VOID))     iswidth=0;
  3448                                  
  3449 000011F2 681102                   push 529
  3450 000011F5 E8B1FD                   call istoken
  3451 000011F8 83C402                   add  sp, 2
  3452 000011FB 08C0                     or  al, al
  3453 000011FD 0F840600                 je .typeName166
  3454 00001201 B80000                   mov ax, 0
  3455 00001204 A2[3600]                 mov byte [iswidth], al
  3456                                  
  3457                                  ;-498     if(istoken(T_CHAR))     iswidth=1;
  3458                                  
  3459                                  .typeName166:
  3460 00001207 681202                   push 530
  3461 0000120A E89CFD                   call istoken
  3462 0000120D 83C402                   add  sp, 2
  3463 00001210 08C0                     or  al, al
  3464 00001212 0F840600                 je .typeName167
  3465 00001216 B80100                   mov ax, 1
  3466 00001219 A2[3600]                 mov byte [iswidth], al
  3467                                  
  3468                                  ;-499     if(istoken(T_INT))      iswidth=2;
  3469                                  
  3470                                  .typeName167:
  3471 0000121C 680502                   push 517
  3472 0000121F E887FD                   call istoken
  3473 00001222 83C402                   add  sp, 2
  3474 00001225 08C0                     or  al, al
  3475 00001227 0F840600                 je .typeName168
  3476 0000122B B80200                   mov ax, 2
  3477 0000122E A2[3600]                 mov byte [iswidth], al
  3478                                  
  3479                                  ;-500     if(istoken(T_LONG))     iswidth=4;
  3480                                  
  3481                                  .typeName168:
  3482 00001231 681502                   push 533
  3483 00001234 E872FD                   call istoken
  3484 00001237 83C402                   add  sp, 2
  3485 0000123A 08C0                     or  al, al
  3486 0000123C 0F840600                 je .typeName169
  3487 00001240 B80400                   mov ax, 4
  3488 00001243 A2[3600]                 mov byte [iswidth], al
  3489                                  
  3490                                  ;-501     istype='V';
  3491                                  
  3492                                  .typeName169:
  3493 00001246 B85600                   mov ax, 86
  3494 00001249 A2[3000]                 mov byte [istype], al
  3495                                  
  3496                                  ;-502     m=0;
  3497                                  
  3498 0000124C B80000                   mov ax, 0
  3499 0000124F 8946FE                   mov [bp-2], ax
  3500                                  
  3501                                  ;-503     if(istoken('*'))  {istype='*'; m=1;}
  3502                                  
  3503 00001252 6A2A                     push 42
  3504 00001254 E852FD                   call istoken
  3505 00001257 83C402                   add  sp, 2
  3506 0000125A 08C0                     or  al, al
  3507 0000125C 0F840C00                 je .typeName170
  3508 00001260 B82A00                   mov ax, 42
  3509 00001263 A2[3000]                 mov byte [istype], al
  3510 00001266 B80100                   mov ax, 1
  3511 00001269 8946FE                   mov [bp-2], ax
  3512                                  
  3513                                  ;-504     if(istoken('&'))  {istype='&'; m=2;}
  3514                                  
  3515                                  .typeName170:
  3516 0000126C 6A26                     push 38
  3517 0000126E E838FD                   call istoken
  3518 00001271 83C402                   add  sp, 2
  3519 00001274 08C0                     or  al, al
  3520 00001276 0F840C00                 je .typeName171
  3521 0000127A B82600                   mov ax, 38
  3522 0000127D A2[3000]                 mov byte [istype], al
  3523 00001280 B80200                   mov ax, 2
  3524 00001283 8946FE                   mov [bp-2], ax
  3525                                  
  3526                                  ;-505     name1();
  3527                                  
  3528                                  .typeName171:
  3529 00001286 E807FF                   call name1
  3530                                  
  3531                                  ;-506     return m;
  3532                                  
  3533 00001289 8B46FE                   mov ax, [bp-2]
  3534 0000128C E90000                   jmp .retntypeName
  3535                                  
  3536                                  ;-507 }
  3537                                  
  3538                                  
  3539                                  ;-508 int gettypes(int i) {int j; char c;
  3540                                  
  3541 0000128F C9                       .retntypeName: LEAVE
  3542 00001290 C3                       ret
  3543                                  ENDP
  3544                                  
  3545                                  gettypes: PROC
  3546                                  
  3547                                  ;-509   c=GSign [i]; if (c=='S') signi =1;    else signi =0;
  3548                                  ;
  3549 00001291 C8040000                 ENTER  4,0
  3550 00001295 8B5E04                   mov bx, [bp+4]
  3551 00001298 8A871870                 mov al, [GSign + bx]
  3552 0000129C 8846FC                   mov [bp-4], al
  3553 0000129F 8A46FC                   mov al, [bp-4]
  3554 000012A2 3C53                     cmp al, 83
  3555 000012A4 0F850900                 jne .gettypes172
  3556 000012A8 B80100                   mov ax, 1
  3557 000012AB A3[3100]                 mov word [signi], ax
  3558 000012AE E90600                   jmp .gettypes173
  3559                                  .gettypes172:
  3560 000012B1 B80000                   mov ax, 0
  3561 000012B4 A3[3100]                 mov word [signi], ax
  3562                                  
  3563                                  ;-510   c=GWidth[i]; widthi=0;wi=0;
  3564                                  
  3565                                  .gettypes173:
  3566 000012B7 8B5E04                   mov bx, [bp+4]
  3567 000012BA 8A874471                 mov al, [GWidth + bx]
  3568 000012BE 8846FC                   mov [bp-4], al
  3569 000012C1 B80000                   mov ax, 0
  3570 000012C4 A3[3400]                 mov word [widthi], ax
  3571 000012C7 B80000                   mov ax, 0
  3572 000012CA A3[3700]                 mov word [wi], ax
  3573                                  
  3574                                  ;-511   if (c==1) {widthi=1;wi=1;}
  3575                                  
  3576 000012CD 8A46FC                   mov al, [bp-4]
  3577 000012D0 3C01                     cmp al, 1
  3578 000012D2 0F850C00                 jne .gettypes174
  3579 000012D6 B80100                   mov ax, 1
  3580 000012D9 A3[3400]                 mov word [widthi], ax
  3581 000012DC B80100                   mov ax, 1
  3582 000012DF A3[3700]                 mov word [wi], ax
  3583                                  
  3584                                  ;-512   if (c==2) {widthi=2;wi=2;}
  3585                                  
  3586                                  .gettypes174:
  3587 000012E2 8A46FC                   mov al, [bp-4]
  3588 000012E5 3C02                     cmp al, 2
  3589 000012E7 0F850C00                 jne .gettypes175
  3590 000012EB B80200                   mov ax, 2
  3591 000012EE A3[3400]                 mov word [widthi], ax
  3592 000012F1 B80200                   mov ax, 2
  3593 000012F4 A3[3700]                 mov word [wi], ax
  3594                                  
  3595                                  ;-513   if (c==4) {widthi=4;wi=4;}
  3596                                  
  3597                                  .gettypes175:
  3598 000012F7 8A46FC                   mov al, [bp-4]
  3599 000012FA 3C04                     cmp al, 4
  3600 000012FC 0F850C00                 jne .gettypes176
  3601 00001300 B80400                   mov ax, 4
  3602 00001303 A3[3400]                 mov word [widthi], ax
  3603 00001306 B80400                   mov ax, 4
  3604 00001309 A3[3700]                 mov word [wi], ax
  3605                                  
  3606                                  ;-514   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}
  3607                                  
  3608                                  .gettypes176:
  3609 0000130C 8B5E04                   mov bx, [bp+4]
  3610 0000130F 8A87EC6E                 mov al, [GType + bx]
  3611 00001313 8846FC                   mov [bp-4], al
  3612 00001316 B80000                   mov ax, 0
  3613 00001319 A3[2E00]                 mov word [typei], ax
  3614 0000131C 8A46FC                   mov al, [bp-4]
  3615 0000131F 3C2A                     cmp al, 42
  3616 00001321 0F850C00                 jne .gettypes177
  3617 00001325 B80100                   mov ax, 1
  3618 00001328 A3[2E00]                 mov word [typei], ax
  3619 0000132B B80200                   mov ax, 2
  3620 0000132E A3[3700]                 mov word [wi], ax
  3621                                  
  3622                                  ;-515   if (c=='&')  typei=2;
  3623                                  
  3624                                  .gettypes177:
  3625 00001331 8A46FC                   mov al, [bp-4]
  3626 00001334 3C26                     cmp al, 38
  3627 00001336 0F850600                 jne .gettypes178
  3628 0000133A B80200                   mov ax, 2
  3629 0000133D A3[2E00]                 mov word [typei], ax
  3630                                  
  3631                                  ;-516   return i; }
  3632                                  
  3633                                  .gettypes178:
  3634 00001340 8B4604                   mov ax, [bp+4]
  3635 00001343 E90000                   jmp .retngettypes
  3636                                  
  3637                                  ;-517 
  3638                                  
  3639                                  
  3640                                  ;-518 int storeCall1() {//todo
  3641                                  
  3642 00001346 C9                       .retngettypes: LEAVE
  3643 00001347 C3                       ret
  3644                                  ENDP
  3645                                  
  3646                                  storeCall1: PROC
  3647                                  
  3648                                  ;-519     unsigned int i;
  3649                                  
  3650                                  
  3651                                  ;-520     CTop++;
  3652                                  ;
  3653 00001348 C8020000                 ENTER  2,0
  3654 0000134C FF06[4300]               inc  word[CTop]
  3655                                  
  3656                                  ;-521     if (CTop >= CALLMAX) error1("too many calls");
  3657                                  
  3658 00001350 A1[4300]                 mov ax, [CTop]
  3659 00001353 3DDC05                   cmp ax, 1500 ;unsigned : 1
  3660 00001356 0F8C0900                 jl  .storeCall1179
  3661 0000135A 68[AF13]                 push storeCall1_0
  3662 0000135D E8A7F2                   call error1
  3663 00001360 83C402                   add  sp, 2
  3664                                  
  3665                                  ;-522     i = CNamePtr - &CNameField;
  3666                                  
  3667                                  .storeCall1179:
  3668 00001363 A1[3F00]                 mov ax, [CNamePtr]
  3669 00001366 2D68B6                   sub ax, CNameField
  3670 00001369 8946FE                   mov [bp-2], ax
  3671                                  
  3672                                  ;-523     if (i >= CNAMEMAX) error1("too many call names");
  3673                                  
  3674 0000136C 8B46FE                   mov ax, [bp-2]
  3675 0000136F 3D1027                   cmp ax, 10000 ;unsigned : 0
  3676 00001372 0F820900                 jb  .storeCall1180
  3677 00001376 68[BE13]                 push storeCall1_1
  3678 00001379 E88BF2                   call error1
  3679 0000137C 83C402                   add  sp, 2
  3680                                  
  3681                                  ;-524     CType[CTop]=0;
  3682                                  
  3683                                  .storeCall1180:
  3684 0000137F B80000                   mov ax, 0
  3685 00001382 8B1E[4300]               mov bx, [CTop]
  3686 00001386 8887D4A4                 mov [CType+bx], al
  3687                                  
  3688                                  ;-525     CAdr [CTop]=CNamePtr;
  3689                                  
  3690 0000138A A1[3F00]                 mov ax, [CNamePtr]
  3691 0000138D 8B1E[4300]               mov bx, [CTop]
  3692 00001391 D1E3                     shl bx, 1
  3693 00001393 8987B0AA                 mov [CAdr+bx], ax
  3694                                  
  3695                                  ;-526     CNamePtr=strcpy(CNamePtr, symbol);
  3696                                  
  3697 00001397 8D06A36D                 lea  ax, [symbol]
  3698 0000139B 50                       push ax
  3699 0000139C FF36[3F00]               push word [CNamePtr]
  3700 000013A0 E88DEE                   call strcpy
  3701 000013A3 83C404                   add  sp, 4
  3702 000013A6 A3[3F00]                 mov word [CNamePtr], ax
  3703                                  
  3704                                  ;-527     CNamePtr++;
  3705                                  
  3706 000013A9 FF06[3F00]               inc  word[CNamePtr]
  3707                                  
  3708                                  ;-528 }
  3709                                  
  3710                                  
  3711                                  ;-529 
  3712                                  
  3713                                  
  3714                                  ;-530 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
  3715 000013AD C9                       LEAVE
  3716 000013AE C3                       ret
  3717 000013AF 746F6F206D616E7920-     storeCall1_0 db "too many calls",0
  3718 000013B8 63616C6C7300       
  3719 000013BE 746F6F206D616E7920-     storeCall1_1 db "too many call names",0
  3720 000013C7 63616C6C206E616D65-
  3721 000013D0 7300               
  3722                                  ENDP
  3723                                  
  3724                                  storefunc: PROC
  3725 000013D2 A1[3D00]                 mov ax, [FTop]
  3726 000013D5 3D2C01                   cmp ax, 300 ;unsigned : 1
  3727 000013D8 0F8C0900                 jl  .storefunc181
  3728 000013DC 68[3314]                 push storefunc_0
  3729 000013DF E825F2                   call error1
  3730 000013E2 83C402                   add  sp, 2
  3731                                  
  3732                                  ;-531     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;
  3733                                  
  3734                                  .storefunc181:
  3735 000013E5 A1[4700]                 mov ax, [lineno]
  3736 000013E8 83E801                   sub ax, 1
  3737 000013EB 8B1E[3D00]               mov bx, [FTop]
  3738 000013EF D1E3                     shl bx, 1
  3739 000013F1 8987648D                 mov [FAdr+bx], ax
  3740 000013F5 B80000                   mov ax, 0
  3741 000013F8 8B1E[3D00]               mov bx, [FTop]
  3742 000013FC D1E3                     shl bx, 1
  3743 000013FE 8987BC8F                 mov [FCalls+bx], ax
  3744 00001402 A0[3600]                 mov al, [iswidth]
  3745 00001405 8B1E[3D00]               mov bx, [FTop]
  3746 00001409 8887388C                 mov [FType+bx], al
  3747                                  
  3748                                  ;-532     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;
  3749                                  
  3750 0000140D FF36[3D00]               push word [FTop]
  3751 00001411 8D061492                 lea  ax, [FNameField]
  3752 00001415 50                       push ax
  3753 00001416 E8F0F4                   call adrF
  3754 00001419 83C404                   add  sp, 4
  3755 0000141C A3[4900]                 mov word [pt], ax
  3756 0000141F 8D06A36D                 lea  ax, [symbol]
  3757 00001423 50                       push ax
  3758 00001424 FF36[4900]               push word [pt]
  3759 00001428 E805EE                   call strcpy
  3760 0000142B 83C404                   add  sp, 4
  3761 0000142E FF06[3D00]               inc  word[FTop]
  3762                                  
  3763                                  ;-533 }
  3764                                  
  3765                                  
  3766                                  ;-534 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");
  3767                                  
  3768 00001432 C3                       ret
  3769 00001433 46756E6374696F6E20-     storefunc_0 db "Function table full",0
  3770 0000143C 7461626C652066756C-
  3771 00001445 6C00               
  3772                                  ENDP
  3773                                  
  3774                                  addlocal: PROC
  3775 00001447 A1[3B00]                 mov ax, [LTop]
  3776 0000144A 3D2C01                   cmp ax, 300 ;unsigned : 1
  3777 0000144D 0F8C0900                 jl  .addlocal182
  3778 00001451 68[CD14]                 push addlocal_0
  3779 00001454 E8B0F1                   call error1
  3780 00001457 83C402                   add  sp, 2
  3781                                  
  3782                                  ;-535   if (checkName() != 0) error1("Variable already defined");
  3783                                  
  3784                                  .addlocal182:
  3785 0000145A E864FC                   call checkName
  3786 0000145D 83F800                   cmp ax, 0
  3787 00001460 0F840900                 je  .addlocal183
  3788 00001464 68[E714]                 push addlocal_1
  3789 00001467 E89DF1                   call error1
  3790 0000146A 83C402                   add  sp, 2
  3791                                  
  3792                                  ;-536   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;
  3793                                  
  3794                                  .addlocal183:
  3795 0000146D A0[3300]                 mov al, [issign]
  3796 00001470 8B1E[3B00]               mov bx, [LTop]
  3797 00001474 88871870                 mov [GSign+bx], al
  3798 00001478 A0[3600]                 mov al, [iswidth]
  3799 0000147B 8B1E[3B00]               mov bx, [LTop]
  3800 0000147F 88874471                 mov [GWidth+bx], al
  3801 00001483 A0[3000]                 mov al, [istype]
  3802 00001486 8B1E[3B00]               mov bx, [LTop]
  3803 0000148A 8887EC6E                 mov [GType+bx], al
  3804                                  
  3805                                  ;-537   GAdr [LTop]=lineno-1; GUsed[LTop]=0;
  3806                                  
  3807 0000148E A1[4700]                 mov ax, [lineno]
  3808 00001491 83E801                   sub ax, 1
  3809 00001494 8B1E[3B00]               mov bx, [LTop]
  3810 00001498 D1E3                     shl bx, 1
  3811 0000149A 89877072                 mov [GAdr+bx], ax
  3812 0000149E B80000                   mov ax, 0
  3813 000014A1 8B1E[3B00]               mov bx, [LTop]
  3814 000014A5 D1E3                     shl bx, 1
  3815 000014A7 8987C874                 mov [GUsed+bx], ax
  3816                                  
  3817                                  ;-538   pt=adrF(GNameField, LTop); strcpy(pt, symbol);
  3818                                  
  3819 000014AB FF36[3B00]               push word [LTop]
  3820 000014AF 8D067879                 lea  ax, [GNameField]
  3821 000014B3 50                       push ax
  3822 000014B4 E852F4                   call adrF
  3823 000014B7 83C404                   add  sp, 4
  3824 000014BA A3[4900]                 mov word [pt], ax
  3825 000014BD 8D06A36D                 lea  ax, [symbol]
  3826 000014C1 50                       push ax
  3827 000014C2 FF36[4900]               push word [pt]
  3828 000014C6 E867ED                   call strcpy
  3829 000014C9 83C404                   add  sp, 4
  3830                                  
  3831                                  ;-539 }
  3832                                  
  3833                                  
  3834                                  ;-540 int checkFunction() { unsigned int i; unsigned int j; i=0;
  3835                                  
  3836 000014CC C3                       ret
  3837 000014CD 4C6F63616C20766172-     addlocal_0 db "Local variable table full",0
  3838 000014D6 6961626C6520746162-
  3839 000014DF 6C652066756C6C00   
  3840 000014E7 5661726961626C6520-     addlocal_1 db "Variable already defined",0
  3841 000014F0 616C72656164792064-
  3842 000014F9 6566696E656400     
  3843                                  ENDP
  3844                                  
  3845                                  checkFunction: PROC;
  3846 00001500 C8040000                 ENTER  4,0
  3847 00001504 B80000                   mov ax, 0
  3848 00001507 8946FE                   mov [bp-2], ax
  3849                                  
  3850                                  ;-541   while (i < FTop) {
  3851                                  
  3852                                  .checkFunction184:
  3853 0000150A 8B46FE                   mov ax, [bp-2]
  3854 0000150D 3B06[3D00]               cmp ax, [FTop]
  3855 00001511 0F8D3000                 jge .checkFunction185
  3856                                  
  3857                                  ;-542     j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}
  3858                                  
  3859 00001515 FF76FE                   push word [bp-2]
  3860 00001518 8D061492                 lea  ax, [FNameField]
  3861 0000151C 50                       push ax
  3862 0000151D E8E9F3                   call adrF
  3863 00001520 83C404                   add  sp, 4
  3864 00001523 8946FC                   mov [bp-4], ax
  3865 00001526 FF76FC                   push word [bp-4]
  3866 00001529 8D06A36D                 lea  ax, [symbol]
  3867 0000152D 50                       push ax
  3868 0000152E E835ED                   call eqstr
  3869 00001531 83C404                   add  sp, 4
  3870 00001534 08C0                     or  al, al
  3871 00001536 0F840600                 je .checkFunction186
  3872 0000153A 8B46FE                   mov ax, [bp-2]
  3873 0000153D E90B00                   jmp .retncheckFunction
  3874                                  .checkFunction186:
  3875 00001540 FF46FE                   inc  word[bp-2]
  3876                                  
  3877                                  ;-543   return 0; }
  3878                                  
  3879 00001543 EBC5                     jmp .checkFunction184
  3880                                  .checkFunction185:
  3881 00001545 B80000                   mov ax, 0
  3882 00001548 E90000                   jmp .retncheckFunction
  3883                                  
  3884                                  ;-544 
  3885                                  
  3886                                  
  3887                                  ;-545 int isvariable() {
  3888                                  
  3889 0000154B C9                       .retncheckFunction: LEAVE
  3890 0000154C C3                       ret
  3891                                  ENDP
  3892                                  
  3893                                  isvariable: PROC
  3894                                  
  3895                                  ;-546     if(token==T_SIGNED)   goto v1;
  3896                                  
  3897 0000154D A1[1E00]                 mov ax, [token]
  3898 00001550 3D1302                   cmp ax, 531
  3899 00001553 0F850300                 jne .isvariable187
  3900 00001557 E93A00                   jmp .v1
  3901                                  
  3902                                  ;-547     if(token==T_UNSIGNED) goto v1;
  3903                                  
  3904                                  .isvariable187:
  3905 0000155A A1[1E00]                 mov ax, [token]
  3906 0000155D 3D1402                   cmp ax, 532
  3907 00001560 0F850300                 jne .isvariable188
  3908 00001564 E92D00                   jmp .v1
  3909                                  
  3910                                  ;-548     if(token==T_CHAR)     goto v1;
  3911                                  
  3912                                  .isvariable188:
  3913 00001567 A1[1E00]                 mov ax, [token]
  3914 0000156A 3D1202                   cmp ax, 530
  3915 0000156D 0F850300                 jne .isvariable189
  3916 00001571 E92000                   jmp .v1
  3917                                  
  3918                                  ;-549     if(token==T_INT)      goto v1;
  3919                                  
  3920                                  .isvariable189:
  3921 00001574 A1[1E00]                 mov ax, [token]
  3922 00001577 3D0502                   cmp ax, 517
  3923 0000157A 0F850300                 jne .isvariable190
  3924 0000157E E91300                   jmp .v1
  3925                                  
  3926                                  ;-550     if(token==T_LONG)     goto v1;
  3927                                  
  3928                                  .isvariable190:
  3929 00001581 A1[1E00]                 mov ax, [token]
  3930 00001584 3D1502                   cmp ax, 533
  3931 00001587 0F850300                 jne .isvariable191
  3932 0000158B E90600                   jmp .v1
  3933                                  
  3934                                  ;-551     return 0;
  3935                                  
  3936                                  .isvariable191:
  3937 0000158E B80000                   mov ax, 0
  3938 00001591 E90600                   jmp .retnisvariable
  3939                                  
  3940                                  ;-552 v1: return 1;
  3941                                  
  3942                                  .v1:
  3943 00001594 B80100                   mov ax, 1
  3944 00001597 E90000                   jmp .retnisvariable
  3945                                  
  3946                                  ;-553 }
  3947                                  
  3948                                  
  3949                                  ;-554 
  3950                                  
  3951                                  
  3952                                  ;-555 int cmpneg(int ids) {
  3953                                  
  3954                                   .retnisvariable:
  3955 0000159A C3                       ret
  3956                                  ENDP
  3957                                  
  3958                                  cmpneg: PROC
  3959                                  
  3960                                  ;-556        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
  3961                                  ;
  3962 0000159B C8000000                 ENTER  0,0
  3963 0000159F A1[2400]                 mov ax, [iscmp]
  3964 000015A2 3D2603                   cmp ax, 806
  3965 000015A5 0F850C00                 jne .cmpneg192
  3966 000015A9 68[7C16]                 push cmpneg_0
  3967 000015AC E837EE                   call prs
  3968 000015AF 83C402                   add  sp, 2
  3969                                  
  3970                                  ;-557   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1
  3971                                  
  3972 000015B2 E9C500                   jmp .cmpneg193
  3973                                  .cmpneg192:
  3974 000015B5 A1[2400]                 mov ax, [iscmp]
  3975 000015B8 3D2703                   cmp ax, 807
  3976 000015BB 0F850C00                 jne .cmpneg194
  3977 000015BF 68[8516]                 push cmpneg_1
  3978 000015C2 E821EE                   call prs
  3979 000015C5 83C402                   add  sp, 2
  3980                                  
  3981                                  ;-558   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF
  3982                                  
  3983 000015C8 E9AF00                   jmp .cmpneg195
  3984                                  .cmpneg194:
  3985 000015CB A1[2400]                 mov ax, [iscmp]
  3986 000015CE 3D3803                   cmp ax, 824
  3987 000015D1 0F852100                 jne .cmpneg196
  3988 000015D5 8B4604                   mov ax, [bp+4]
  3989 000015D8 08C0                     or  al, al
  3990 000015DA 0F840C00                 je .cmpneg197
  3991 000015DE 68[8E16]                 push cmpneg_2
  3992 000015E1 E802EE                   call prs
  3993 000015E4 83C402                   add  sp, 2
  3994                                  
  3995                                  ;-559                            else prs("\n ja  .");//ZF=0 CF=0
  3996                                  
  3997 000015E7 E90900                   jmp .cmpneg198
  3998                                  .cmpneg197:
  3999 000015EA 68[9716]                 push cmpneg_3
  4000 000015ED E8F6ED                   call prs
  4001 000015F0 83C402                   add  sp, 2
  4002                                  
  4003                                  ;-560   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);
  4004                                  
  4005                                  .cmpneg198:
  4006 000015F3 E98400                   jmp .cmpneg199
  4007                                  .cmpneg196:
  4008 000015F6 A1[2400]                 mov ax, [iscmp]
  4009 000015F9 3D2B03                   cmp ax, 811
  4010 000015FC 0F854500                 jne .cmpneg200
  4011 00001600 8B4604                   mov ax, [bp+4]
  4012 00001603 08C0                     or  al, al
  4013 00001605 0F841E00                 je .cmpneg201
  4014 00001609 68[A016]                 push cmpneg_4
  4015 0000160C E8D7ED                   call prs
  4016 0000160F 83C402                   add  sp, 2
  4017 00001612 FF7604                   push word [bp+4]
  4018 00001615 E831EF                   call prunsign1
  4019 00001618 83C402                   add  sp, 2
  4020                                  
  4021                                  ;-561                                prs("\n jl  .");}//          SF!=OF
  4022                                  
  4023 0000161B 68[AE16]                 push cmpneg_5
  4024 0000161E E8C5ED                   call prs
  4025 00001621 83C402                   add  sp, 2
  4026                                  
  4027                                  ;-562                            else{prs(" ;unsigned : "); prunsign1(ids);
  4028                                  
  4029 00001624 E91B00                   jmp .cmpneg202
  4030                                  .cmpneg201:
  4031 00001627 68[B716]                 push cmpneg_6
  4032 0000162A E8B9ED                   call prs
  4033 0000162D 83C402                   add  sp, 2
  4034 00001630 FF7604                   push word [bp+4]
  4035 00001633 E813EF                   call prunsign1
  4036 00001636 83C402                   add  sp, 2
  4037                                  
  4038                                  ;-563                                prs("\n jb  .");}//jb=jc=CF=1
  4039                                  
  4040 00001639 68[C516]                 push cmpneg_7
  4041 0000163C E8A7ED                   call prs
  4042 0000163F 83C402                   add  sp, 2
  4043                                  
  4044                                  ;-564   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF
  4045                                  
  4046                                  .cmpneg202:
  4047 00001642 E93500                   jmp .cmpneg203
  4048                                  .cmpneg200:
  4049 00001645 A1[2400]                 mov ax, [iscmp]
  4050 00001648 83F83C                   cmp ax, 60
  4051 0000164B 0F850C00                 jne .cmpneg204
  4052 0000164F 68[CE16]                 push cmpneg_8
  4053 00001652 E891ED                   call prs
  4054 00001655 83C402                   add  sp, 2
  4055                                  
  4056                                  ;-565   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF
  4057                                  
  4058 00001658 E91F00                   jmp .cmpneg205
  4059                                  .cmpneg204:
  4060 0000165B A1[2400]                 mov ax, [iscmp]
  4061 0000165E 83F83E                   cmp ax, 62
  4062 00001661 0F850C00                 jne .cmpneg206
  4063 00001665 68[D716]                 push cmpneg_9
  4064 00001668 E87BED                   call prs
  4065 0000166B 83C402                   add  sp, 2
  4066                                  
  4067                                  ;-566   else error1("internal error compare unknown in CMPNEG()");  }
  4068                                  
  4069 0000166E E90900                   jmp .cmpneg207
  4070                                  .cmpneg206:
  4071 00001671 68[E016]                 push cmpneg_10
  4072 00001674 E890EF                   call error1
  4073 00001677 83C402                   add  sp, 2
  4074                                  .cmpneg207:
  4075                                  .cmpneg205:
  4076                                  .cmpneg203:
  4077                                  .cmpneg199:
  4078                                  .cmpneg195:
  4079                                  .cmpneg193:
  4080                                  
  4081                                  ;-567 
  4082                                  
  4083                                  
  4084                                  ;-568   int isrelational() {
  4085 0000167A C9                       LEAVE
  4086 0000167B C3                       ret
  4087 0000167C 5C6E206A6E65202E00      cmpneg_0 db "\n jne .",0
  4088 00001685 5C6E206A6520202E00      cmpneg_1 db "\n je  .",0
  4089 0000168E 5C6E206A6720202E00      cmpneg_2 db "\n jg  .",0
  4090 00001697 5C6E206A6120202E00      cmpneg_3 db "\n ja  .",0
  4091 000016A0 203B756E7369676E65-     cmpneg_4 db " ;unsigned : ",0
  4092 000016A9 64203A2000         
  4093 000016AE 5C6E206A6C20202E00      cmpneg_5 db "\n jl  .",0
  4094 000016B7 203B756E7369676E65-     cmpneg_6 db " ;unsigned : ",0
  4095 000016C0 64203A2000         
  4096 000016C5 5C6E206A6220202E00      cmpneg_7 db "\n jb  .",0
  4097 000016CE 5C6E206A6765202E00      cmpneg_8 db "\n jge .",0
  4098 000016D7 5C6E206A6C65202E00      cmpneg_9 db "\n jle .",0
  4099 000016E0 696E7465726E616C20-     cmpneg_10 db "internal error compare unknown in CMPNEG()",0
  4100 000016E9 6572726F7220636F6D-
  4101 000016F2 7061726520756E6B6E-
  4102 000016FB 6F776E20696E20434D-
  4103 00001704 504E4547282900     
  4104                                  ENDP
  4105                                  
  4106                                  isrelational: PROC
  4107                                  
  4108                                  ;-569     if (token==T_EQ) goto w; if (token==T_NE) goto w;
  4109                                  
  4110 0000170B A1[1E00]                 mov ax, [token]
  4111 0000170E 3D2603                   cmp ax, 806
  4112 00001711 0F850300                 jne .isrelational208
  4113 00001715 E94700                   jmp .w
  4114                                  .isrelational208:
  4115 00001718 A1[1E00]                 mov ax, [token]
  4116 0000171B 3D2703                   cmp ax, 807
  4117 0000171E 0F850300                 jne .isrelational209
  4118 00001722 E93A00                   jmp .w
  4119                                  
  4120                                  ;-570     if (token==T_LE) goto w; if (token==T_GE) goto w;
  4121                                  
  4122                                  .isrelational209:
  4123 00001725 A1[1E00]                 mov ax, [token]
  4124 00001728 3D3803                   cmp ax, 824
  4125 0000172B 0F850300                 jne .isrelational210
  4126 0000172F E92D00                   jmp .w
  4127                                  .isrelational210:
  4128 00001732 A1[1E00]                 mov ax, [token]
  4129 00001735 3D2B03                   cmp ax, 811
  4130 00001738 0F850300                 jne .isrelational211
  4131 0000173C E92000                   jmp .w
  4132                                  
  4133                                  ;-571     if (token=='<' ) goto w; if (token=='>' ) goto w;
  4134                                  
  4135                                  .isrelational211:
  4136 0000173F A1[1E00]                 mov ax, [token]
  4137 00001742 83F83C                   cmp ax, 60
  4138 00001745 0F850300                 jne .isrelational212
  4139 00001749 E91300                   jmp .w
  4140                                  .isrelational212:
  4141 0000174C A1[1E00]                 mov ax, [token]
  4142 0000174F 83F83E                   cmp ax, 62
  4143 00001752 0F850300                 jne .isrelational213
  4144 00001756 E90600                   jmp .w
  4145                                  
  4146                                  ;-572     return 0;  w: iscmp=token; token=getlex(); return 1;}
  4147                                  
  4148                                  .isrelational213:
  4149 00001759 B80000                   mov ax, 0
  4150 0000175C E91200                   jmp .retnisrelational
  4151                                  .w:
  4152 0000175F A1[1E00]                 mov ax, [token]
  4153 00001762 A3[2400]                 mov word [iscmp], ax
  4154 00001765 E8C2F2                   call getlex
  4155 00001768 A3[1E00]                 mov word [token], ax
  4156 0000176B B80100                   mov ax, 1
  4157 0000176E E90000                   jmp .retnisrelational
  4158                                  
  4159                                  ;-573 
  4160                                  
  4161                                  
  4162                                  ;-574 int checkreg() { // >=17 = 16bit, >=47 = 32bit
  4163                                  
  4164                                   .retnisrelational:
  4165 00001771 C3                       ret
  4166                                  ENDP
  4167                                  
  4168                                  checkreg: PROC
  4169                                  
  4170                                  ;-575   if (strlen(symbol) <  2) return 0;
  4171                                  
  4172 00001772 8D06A36D                 lea  ax, [symbol]
  4173 00001776 50                       push ax
  4174 00001777 E88EEA                   call strlen
  4175 0000177A 83C402                   add  sp, 2
  4176 0000177D 83F802                   cmp ax, 2
  4177 00001780 0F8D0600                 jge .checkreg214
  4178 00001784 B80000                   mov ax, 0
  4179 00001787 E94403                   jmp .retncheckreg
  4180                                  
  4181                                  ;-576   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;
  4182                                  
  4183                                  .checkreg214:
  4184 0000178A 68[CF1A]                 push checkreg_0
  4185 0000178D 8D06A36D                 lea  ax, [symbol]
  4186 00001791 50                       push ax
  4187 00001792 E8D1EA                   call eqstr
  4188 00001795 83C404                   add  sp, 4
  4189 00001798 08C0                     or  al, al
  4190 0000179A 0F840600                 je .checkreg215
  4191 0000179E B80100                   mov ax, 1
  4192 000017A1 E92A03                   jmp .retncheckreg
  4193                                  .checkreg215:
  4194 000017A4 68[D21A]                 push checkreg_1
  4195 000017A7 8D06A36D                 lea  ax, [symbol]
  4196 000017AB 50                       push ax
  4197 000017AC E8B7EA                   call eqstr
  4198 000017AF 83C404                   add  sp, 4
  4199 000017B2 08C0                     or  al, al
  4200 000017B4 0F840600                 je .checkreg216
  4201 000017B8 B80300                   mov ax, 3
  4202 000017BB E91003                   jmp .retncheckreg
  4203                                  
  4204                                  ;-577   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;
  4205                                  
  4206                                  .checkreg216:
  4207 000017BE 68[D51A]                 push checkreg_2
  4208 000017C1 8D06A36D                 lea  ax, [symbol]
  4209 000017C5 50                       push ax
  4210 000017C6 E89DEA                   call eqstr
  4211 000017C9 83C404                   add  sp, 4
  4212 000017CC 08C0                     or  al, al
  4213 000017CE 0F840600                 je .checkreg217
  4214 000017D2 B80500                   mov ax, 5
  4215 000017D5 E9F602                   jmp .retncheckreg
  4216                                  .checkreg217:
  4217 000017D8 68[D81A]                 push checkreg_3
  4218 000017DB 8D06A36D                 lea  ax, [symbol]
  4219 000017DF 50                       push ax
  4220 000017E0 E883EA                   call eqstr
  4221 000017E3 83C404                   add  sp, 4
  4222 000017E6 08C0                     or  al, al
  4223 000017E8 0F840600                 je .checkreg218
  4224 000017EC B80700                   mov ax, 7
  4225 000017EF E9DC02                   jmp .retncheckreg
  4226                                  
  4227                                  ;-578   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;
  4228                                  
  4229                                  .checkreg218:
  4230 000017F2 68[DB1A]                 push checkreg_4
  4231 000017F5 8D06A36D                 lea  ax, [symbol]
  4232 000017F9 50                       push ax
  4233 000017FA E869EA                   call eqstr
  4234 000017FD 83C404                   add  sp, 4
  4235 00001800 08C0                     or  al, al
  4236 00001802 0F840600                 je .checkreg219
  4237 00001806 B80900                   mov ax, 9
  4238 00001809 E9C202                   jmp .retncheckreg
  4239                                  .checkreg219:
  4240 0000180C 68[DE1A]                 push checkreg_5
  4241 0000180F 8D06A36D                 lea  ax, [symbol]
  4242 00001813 50                       push ax
  4243 00001814 E84FEA                   call eqstr
  4244 00001817 83C404                   add  sp, 4
  4245 0000181A 08C0                     or  al, al
  4246 0000181C 0F840600                 je .checkreg220
  4247 00001820 B80B00                   mov ax, 11
  4248 00001823 E9A802                   jmp .retncheckreg
  4249                                  
  4250                                  ;-579   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;
  4251                                  
  4252                                  .checkreg220:
  4253 00001826 68[E11A]                 push checkreg_6
  4254 00001829 8D06A36D                 lea  ax, [symbol]
  4255 0000182D 50                       push ax
  4256 0000182E E835EA                   call eqstr
  4257 00001831 83C404                   add  sp, 4
  4258 00001834 08C0                     or  al, al
  4259 00001836 0F840600                 je .checkreg221
  4260 0000183A B80D00                   mov ax, 13
  4261 0000183D E98E02                   jmp .retncheckreg
  4262                                  .checkreg221:
  4263 00001840 68[E41A]                 push checkreg_7
  4264 00001843 8D06A36D                 lea  ax, [symbol]
  4265 00001847 50                       push ax
  4266 00001848 E81BEA                   call eqstr
  4267 0000184B 83C404                   add  sp, 4
  4268 0000184E 08C0                     or  al, al
  4269 00001850 0F840600                 je .checkreg222
  4270 00001854 B80F00                   mov ax, 15
  4271 00001857 E97402                   jmp .retncheckreg
  4272                                  
  4273                                  ;-580   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;
  4274                                  
  4275                                  .checkreg222:
  4276 0000185A 68[E71A]                 push checkreg_8
  4277 0000185D 8D06A36D                 lea  ax, [symbol]
  4278 00001861 50                       push ax
  4279 00001862 E801EA                   call eqstr
  4280 00001865 83C404                   add  sp, 4
  4281 00001868 08C0                     or  al, al
  4282 0000186A 0F840600                 je .checkreg223
  4283 0000186E B81100                   mov ax, 17
  4284 00001871 E95A02                   jmp .retncheckreg
  4285                                  .checkreg223:
  4286 00001874 68[EA1A]                 push checkreg_9
  4287 00001877 8D06A36D                 lea  ax, [symbol]
  4288 0000187B 50                       push ax
  4289 0000187C E8E7E9                   call eqstr
  4290 0000187F 83C404                   add  sp, 4
  4291 00001882 08C0                     or  al, al
  4292 00001884 0F840600                 je .checkreg224
  4293 00001888 B81300                   mov ax, 19
  4294 0000188B E94002                   jmp .retncheckreg
  4295                                  
  4296                                  ;-581   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;
  4297                                  
  4298                                  .checkreg224:
  4299 0000188E 68[ED1A]                 push checkreg_10
  4300 00001891 8D06A36D                 lea  ax, [symbol]
  4301 00001895 50                       push ax
  4302 00001896 E8CDE9                   call eqstr
  4303 00001899 83C404                   add  sp, 4
  4304 0000189C 08C0                     or  al, al
  4305 0000189E 0F840600                 je .checkreg225
  4306 000018A2 B81500                   mov ax, 21
  4307 000018A5 E92602                   jmp .retncheckreg
  4308                                  .checkreg225:
  4309 000018A8 68[F01A]                 push checkreg_11
  4310 000018AB 8D06A36D                 lea  ax, [symbol]
  4311 000018AF 50                       push ax
  4312 000018B0 E8B3E9                   call eqstr
  4313 000018B3 83C404                   add  sp, 4
  4314 000018B6 08C0                     or  al, al
  4315 000018B8 0F840600                 je .checkreg226
  4316 000018BC B81700                   mov ax, 23
  4317 000018BF E90C02                   jmp .retncheckreg
  4318                                  
  4319                                  ;-582   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;
  4320                                  
  4321                                  .checkreg226:
  4322 000018C2 68[F31A]                 push checkreg_12
  4323 000018C5 8D06A36D                 lea  ax, [symbol]
  4324 000018C9 50                       push ax
  4325 000018CA E899E9                   call eqstr
  4326 000018CD 83C404                   add  sp, 4
  4327 000018D0 08C0                     or  al, al
  4328 000018D2 0F840600                 je .checkreg227
  4329 000018D6 B81900                   mov ax, 25
  4330 000018D9 E9F201                   jmp .retncheckreg
  4331                                  .checkreg227:
  4332 000018DC 68[F61A]                 push checkreg_13
  4333 000018DF 8D06A36D                 lea  ax, [symbol]
  4334 000018E3 50                       push ax
  4335 000018E4 E87FE9                   call eqstr
  4336 000018E7 83C404                   add  sp, 4
  4337 000018EA 08C0                     or  al, al
  4338 000018EC 0F840600                 je .checkreg228
  4339 000018F0 B81B00                   mov ax, 27
  4340 000018F3 E9D801                   jmp .retncheckreg
  4341                                  
  4342                                  ;-583   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;
  4343                                  
  4344                                  .checkreg228:
  4345 000018F6 68[F91A]                 push checkreg_14
  4346 000018F9 8D06A36D                 lea  ax, [symbol]
  4347 000018FD 50                       push ax
  4348 000018FE E865E9                   call eqstr
  4349 00001901 83C404                   add  sp, 4
  4350 00001904 08C0                     or  al, al
  4351 00001906 0F840600                 je .checkreg229
  4352 0000190A B81D00                   mov ax, 29
  4353 0000190D E9BE01                   jmp .retncheckreg
  4354                                  .checkreg229:
  4355 00001910 68[FC1A]                 push checkreg_15
  4356 00001913 8D06A36D                 lea  ax, [symbol]
  4357 00001917 50                       push ax
  4358 00001918 E84BE9                   call eqstr
  4359 0000191B 83C404                   add  sp, 4
  4360 0000191E 08C0                     or  al, al
  4361 00001920 0F840600                 je .checkreg230
  4362 00001924 B81F00                   mov ax, 31
  4363 00001927 E9A401                   jmp .retncheckreg
  4364                                  
  4365                                  ;-584   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;
  4366                                  
  4367                                  .checkreg230:
  4368 0000192A 68[FF1A]                 push checkreg_16
  4369 0000192D 8D06A36D                 lea  ax, [symbol]
  4370 00001931 50                       push ax
  4371 00001932 E831E9                   call eqstr
  4372 00001935 83C404                   add  sp, 4
  4373 00001938 08C0                     or  al, al
  4374 0000193A 0F840600                 je .checkreg231
  4375 0000193E B82100                   mov ax, 33
  4376 00001941 E98A01                   jmp .retncheckreg
  4377                                  .checkreg231:
  4378 00001944 68[021B]                 push checkreg_17
  4379 00001947 8D06A36D                 lea  ax, [symbol]
  4380 0000194B 50                       push ax
  4381 0000194C E817E9                   call eqstr
  4382 0000194F 83C404                   add  sp, 4
  4383 00001952 08C0                     or  al, al
  4384 00001954 0F840600                 je .checkreg232
  4385 00001958 B82300                   mov ax, 35
  4386 0000195B E97001                   jmp .retncheckreg
  4387                                  
  4388                                  ;-585   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;
  4389                                  
  4390                                  .checkreg232:
  4391 0000195E 68[051B]                 push checkreg_18
  4392 00001961 8D06A36D                 lea  ax, [symbol]
  4393 00001965 50                       push ax
  4394 00001966 E8FDE8                   call eqstr
  4395 00001969 83C404                   add  sp, 4
  4396 0000196C 08C0                     or  al, al
  4397 0000196E 0F840600                 je .checkreg233
  4398 00001972 B82500                   mov ax, 37
  4399 00001975 E95601                   jmp .retncheckreg
  4400                                  .checkreg233:
  4401 00001978 68[081B]                 push checkreg_19
  4402 0000197B 8D06A36D                 lea  ax, [symbol]
  4403 0000197F 50                       push ax
  4404 00001980 E8E3E8                   call eqstr
  4405 00001983 83C404                   add  sp, 4
  4406 00001986 08C0                     or  al, al
  4407 00001988 0F840600                 je .checkreg234
  4408 0000198C B82700                   mov ax, 39
  4409 0000198F E93C01                   jmp .retncheckreg
  4410                                  
  4411                                  ;-586   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;
  4412                                  
  4413                                  .checkreg234:
  4414 00001992 68[0B1B]                 push checkreg_20
  4415 00001995 8D06A36D                 lea  ax, [symbol]
  4416 00001999 50                       push ax
  4417 0000199A E8C9E8                   call eqstr
  4418 0000199D 83C404                   add  sp, 4
  4419 000019A0 08C0                     or  al, al
  4420 000019A2 0F840600                 je .checkreg235
  4421 000019A6 B82900                   mov ax, 41
  4422 000019A9 E92201                   jmp .retncheckreg
  4423                                  .checkreg235:
  4424 000019AC 68[0E1B]                 push checkreg_21
  4425 000019AF 8D06A36D                 lea  ax, [symbol]
  4426 000019B3 50                       push ax
  4427 000019B4 E8AFE8                   call eqstr
  4428 000019B7 83C404                   add  sp, 4
  4429 000019BA 08C0                     or  al, al
  4430 000019BC 0F840600                 je .checkreg236
  4431 000019C0 B82B00                   mov ax, 43
  4432 000019C3 E90801                   jmp .retncheckreg
  4433                                  
  4434                                  ;-587   // (eqstr(symbol,"ip")) return 45;
  4435                                  
  4436                                  
  4437                                  ;-588   if (strlen(symbol) >   3) return 0;
  4438                                  
  4439                                  .checkreg236:
  4440 000019C6 8D06A36D                 lea  ax, [symbol]
  4441 000019CA 50                       push ax
  4442 000019CB E83AE8                   call strlen
  4443 000019CE 83C402                   add  sp, 2
  4444 000019D1 83F803                   cmp ax, 3
  4445 000019D4 0F8E0600                 jle .checkreg237
  4446 000019D8 B80000                   mov ax, 0
  4447 000019DB E9F000                   jmp .retncheckreg
  4448                                  
  4449                                  ;-589   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;
  4450                                  
  4451                                  .checkreg237:
  4452 000019DE 68[111B]                 push checkreg_22
  4453 000019E1 8D06A36D                 lea  ax, [symbol]
  4454 000019E5 50                       push ax
  4455 000019E6 E87DE8                   call eqstr
  4456 000019E9 83C404                   add  sp, 4
  4457 000019EC 08C0                     or  al, al
  4458 000019EE 0F840600                 je .checkreg238
  4459 000019F2 B82F00                   mov ax, 47
  4460 000019F5 E9D600                   jmp .retncheckreg
  4461                                  .checkreg238:
  4462 000019F8 68[151B]                 push checkreg_23
  4463 000019FB 8D06A36D                 lea  ax, [symbol]
  4464 000019FF 50                       push ax
  4465 00001A00 E863E8                   call eqstr
  4466 00001A03 83C404                   add  sp, 4
  4467 00001A06 08C0                     or  al, al
  4468 00001A08 0F840600                 je .checkreg239
  4469 00001A0C B83200                   mov ax, 50
  4470 00001A0F E9BC00                   jmp .retncheckreg
  4471                                  
  4472                                  ;-590   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;
  4473                                  
  4474                                  .checkreg239:
  4475 00001A12 68[191B]                 push checkreg_24
  4476 00001A15 8D06A36D                 lea  ax, [symbol]
  4477 00001A19 50                       push ax
  4478 00001A1A E849E8                   call eqstr
  4479 00001A1D 83C404                   add  sp, 4
  4480 00001A20 08C0                     or  al, al
  4481 00001A22 0F840600                 je .checkreg240
  4482 00001A26 B83500                   mov ax, 53
  4483 00001A29 E9A200                   jmp .retncheckreg
  4484                                  .checkreg240:
  4485 00001A2C 68[1D1B]                 push checkreg_25
  4486 00001A2F 8D06A36D                 lea  ax, [symbol]
  4487 00001A33 50                       push ax
  4488 00001A34 E82FE8                   call eqstr
  4489 00001A37 83C404                   add  sp, 4
  4490 00001A3A 08C0                     or  al, al
  4491 00001A3C 0F840600                 je .checkreg241
  4492 00001A40 B83800                   mov ax, 56
  4493 00001A43 E98800                   jmp .retncheckreg
  4494                                  
  4495                                  ;-591   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;
  4496                                  
  4497                                  .checkreg241:
  4498 00001A46 68[211B]                 push checkreg_26
  4499 00001A49 8D06A36D                 lea  ax, [symbol]
  4500 00001A4D 50                       push ax
  4501 00001A4E E815E8                   call eqstr
  4502 00001A51 83C404                   add  sp, 4
  4503 00001A54 08C0                     or  al, al
  4504 00001A56 0F840600                 je .checkreg242
  4505 00001A5A B83B00                   mov ax, 59
  4506 00001A5D E96E00                   jmp .retncheckreg
  4507                                  .checkreg242:
  4508 00001A60 68[251B]                 push checkreg_27
  4509 00001A63 8D06A36D                 lea  ax, [symbol]
  4510 00001A67 50                       push ax
  4511 00001A68 E8FBE7                   call eqstr
  4512 00001A6B 83C404                   add  sp, 4
  4513 00001A6E 08C0                     or  al, al
  4514 00001A70 0F840600                 je .checkreg243
  4515 00001A74 B83E00                   mov ax, 62
  4516 00001A77 E95400                   jmp .retncheckreg
  4517                                  
  4518                                  ;-592   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;
  4519                                  
  4520                                  .checkreg243:
  4521 00001A7A 68[291B]                 push checkreg_28
  4522 00001A7D 8D06A36D                 lea  ax, [symbol]
  4523 00001A81 50                       push ax
  4524 00001A82 E8E1E7                   call eqstr
  4525 00001A85 83C404                   add  sp, 4
  4526 00001A88 08C0                     or  al, al
  4527 00001A8A 0F840600                 je .checkreg244
  4528 00001A8E B84100                   mov ax, 65
  4529 00001A91 E93A00                   jmp .retncheckreg
  4530                                  .checkreg244:
  4531 00001A94 68[2D1B]                 push checkreg_29
  4532 00001A97 8D06A36D                 lea  ax, [symbol]
  4533 00001A9B 50                       push ax
  4534 00001A9C E8C7E7                   call eqstr
  4535 00001A9F 83C404                   add  sp, 4
  4536 00001AA2 08C0                     or  al, al
  4537 00001AA4 0F840600                 je .checkreg245
  4538 00001AA8 B84400                   mov ax, 68
  4539 00001AAB E92000                   jmp .retncheckreg
  4540                                  
  4541                                  ;-593   if (eqstr(symbol,"cr0")) return 71;
  4542                                  
  4543                                  .checkreg245:
  4544 00001AAE 68[311B]                 push checkreg_30
  4545 00001AB1 8D06A36D                 lea  ax, [symbol]
  4546 00001AB5 50                       push ax
  4547 00001AB6 E8ADE7                   call eqstr
  4548 00001AB9 83C404                   add  sp, 4
  4549 00001ABC 08C0                     or  al, al
  4550 00001ABE 0F840600                 je .checkreg246
  4551 00001AC2 B84700                   mov ax, 71
  4552 00001AC5 E90600                   jmp .retncheckreg
  4553                                  
  4554                                  ;-594   return 0;   }
  4555                                  
  4556                                  .checkreg246:
  4557 00001AC8 B80000                   mov ax, 0
  4558 00001ACB E90000                   jmp .retncheckreg
  4559                                  
  4560                                  ;-595 
  4561                                  
  4562                                  
  4563                                  ;-596 char printregstr[]
  4564                                  
  4565                                   .retncheckreg:
  4566 00001ACE C3                       ret
  4567 00001ACF 616C00                  checkreg_0 db "al",0
  4568 00001AD2 636C00                  checkreg_1 db "cl",0
  4569 00001AD5 646C00                  checkreg_2 db "dl",0
  4570 00001AD8 626C00                  checkreg_3 db "bl",0
  4571 00001ADB 616800                  checkreg_4 db "ah",0
  4572 00001ADE 636800                  checkreg_5 db "ch",0
  4573 00001AE1 646800                  checkreg_6 db "dh",0
  4574 00001AE4 626800                  checkreg_7 db "bh",0
  4575 00001AE7 617800                  checkreg_8 db "ax",0
  4576 00001AEA 637800                  checkreg_9 db "cx",0
  4577 00001AED 647800                  checkreg_10 db "dx",0
  4578 00001AF0 627800                  checkreg_11 db "bx",0
  4579 00001AF3 737000                  checkreg_12 db "sp",0
  4580 00001AF6 627000                  checkreg_13 db "bp",0
  4581 00001AF9 736900                  checkreg_14 db "si",0
  4582 00001AFC 646900                  checkreg_15 db "di",0
  4583 00001AFF 657300                  checkreg_16 db "es",0
  4584 00001B02 637300                  checkreg_17 db "cs",0
  4585 00001B05 737300                  checkreg_18 db "ss",0
  4586 00001B08 647300                  checkreg_19 db "ds",0
  4587 00001B0B 667300                  checkreg_20 db "fs",0
  4588 00001B0E 677300                  checkreg_21 db "gs",0
  4589 00001B11 65617800                checkreg_22 db "eax",0
  4590 00001B15 65637800                checkreg_23 db "ecx",0
  4591 00001B19 65647800                checkreg_24 db "edx",0
  4592 00001B1D 65627800                checkreg_25 db "ebx",0
  4593 00001B21 65737000                checkreg_26 db "esp",0
  4594 00001B25 65627000                checkreg_27 db "ebp",0
  4595 00001B29 65736900                checkreg_28 db "esi",0
  4596 00001B2D 65646900                checkreg_29 db "edi",0
  4597 00001B31 63723000                checkreg_30 db "cr0",0
  4598                                  ENDP
  4599                                  
  4600                                  ;-597 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";
  4601                                  
  4602 00001B35 2A616C636C646C626C-     printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0
  4603 00001B3E 616863686468626861-
  4604 00001B47 786378647862787370-
  4605 00001B50 627073696469657363-
  4606 00001B59 737373647366736773-
  4607 00001B62 697065617865637865-
  4608 00001B6B 647865627865737065-
  4609 00001B74 627065736965646963-
  4610 00001B7D 723000             
  4611                                  
  4612                                  ;-598 
  4613                                  
  4614                                  
  4615                                  ;-599 int printreg(int i) {  unsigned int k; unsigned char c;
  4616                                  
  4617                                  
  4618                                  printreg: PROC
  4619                                  
  4620                                  ;-600   k = &printregstr + i; c=*k; prc(c); i++;
  4621                                  ;
  4622 00001B80 C8040000                 ENTER  4,0
  4623 00001B84 B8[351B]                 mov ax, printregstr
  4624 00001B87 034604                   add ax, [bp+4]
  4625 00001B8A 8946FE                   mov [bp-2], ax
  4626 00001B8D 8B5EFE                   mov bx, [bp-2]
  4627 00001B90 8B07                     mov ax, [bx]
  4628 00001B92 8846FC                   mov [bp-4], al
  4629 00001B95 8A46FC                   mov al, byte [bp-4]
  4630 00001B98 B400                     mov ah, 0
  4631 00001B9A 50                       push ax
  4632 00001B9B E8EFE7                   call prc
  4633 00001B9E 83C402                   add  sp, 2
  4634 00001BA1 FF4604                   inc  word[bp+4]
  4635                                  
  4636                                  ;-601   k = &printregstr + i; c=*k; prc(c);
  4637                                  
  4638 00001BA4 B8[351B]                 mov ax, printregstr
  4639 00001BA7 034604                   add ax, [bp+4]
  4640 00001BAA 8946FE                   mov [bp-2], ax
  4641 00001BAD 8B5EFE                   mov bx, [bp-2]
  4642 00001BB0 8B07                     mov ax, [bx]
  4643 00001BB2 8846FC                   mov [bp-4], al
  4644 00001BB5 8A46FC                   mov al, byte [bp-4]
  4645 00001BB8 B400                     mov ah, 0
  4646 00001BBA 50                       push ax
  4647 00001BBB E8CFE7                   call prc
  4648 00001BBE 83C402                   add  sp, 2
  4649                                  
  4650                                  ;-602   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }
  4651                                  
  4652 00001BC1 8B4604                   mov ax, [bp+4]
  4653 00001BC4 83F82F                   cmp ax, 47
  4654 00001BC7 0F8E2000                 jle .printreg247
  4655 00001BCB FF4604                   inc  word[bp+4]
  4656 00001BCE B8[351B]                 mov ax, printregstr
  4657 00001BD1 034604                   add ax, [bp+4]
  4658 00001BD4 8946FE                   mov [bp-2], ax
  4659 00001BD7 8B5EFE                   mov bx, [bp-2]
  4660 00001BDA 8B07                     mov ax, [bx]
  4661 00001BDC 8846FC                   mov [bp-4], al
  4662 00001BDF 8A46FC                   mov al, byte [bp-4]
  4663 00001BE2 B400                     mov ah, 0
  4664 00001BE4 50                       push ax
  4665 00001BE5 E8A5E7                   call prc
  4666 00001BE8 83C402                   add  sp, 2
  4667                                  
  4668                                  ;-603 }
  4669                                  
  4670                                  .printreg247:
  4671                                  
  4672                                  ;-604 
  4673                                  
  4674                                  
  4675                                  ;-605 int constantexpr() { int mode; int id1;int ids;
  4676 00001BEB C9                       LEAVE
  4677 00001BEC C3                       ret
  4678                                  ENDP
  4679                                  
  4680                                  constantexpr: PROC
  4681                                  
  4682                                  ;-606   token=getlex();   mode=typeName();
  4683                                  ;
  4684 00001BED C8060000                 ENTER  6,0
  4685 00001BF1 E836EE                   call getlex
  4686 00001BF4 A3[1E00]                 mov word [token], ax
  4687 00001BF7 E8BEF5                   call typeName
  4688 00001BFA 8946FE                   mov [bp-2], ax
  4689                                  
  4690                                  ;-607   id1=searchname(); gettypes(id1); ids=signi;
  4691                                  
  4692 00001BFD E845F5                   call searchname
  4693 00001C00 8946FC                   mov [bp-4], ax
  4694 00001C03 FF76FC                   push word [bp-4]
  4695 00001C06 E888F6                   call gettypes
  4696 00001C09 83C402                   add  sp, 2
  4697 00001C0C A1[3100]                 mov ax, [signi]
  4698 00001C0F 8946FA                   mov [bp-6], ax
  4699                                  
  4700                                  ;-608   if (isrelational() ==0) error1("Relational expression expected");
  4701                                  
  4702 00001C12 E8F6FA                   call isrelational
  4703 00001C15 83F800                   cmp ax, 0
  4704 00001C18 0F850900                 jne .constantexpr248
  4705 00001C1C 68[A21C]                 push constantexpr_0
  4706 00001C1F E8E5E9                   call error1
  4707 00001C22 83C402                   add  sp, 2
  4708                                  
  4709                                  ;-609   expect(T_CONST);  prs(" ; constant expression");
  4710                                  
  4711                                  .constantexpr248:
  4712 00001C25 680101                   push 257
  4713 00001C28 E8A0F3                   call expect
  4714 00001C2B 83C402                   add  sp, 2
  4715 00001C2E 68[C11C]                 push constantexpr_1
  4716 00001C31 E8B2E7                   call prs
  4717 00001C34 83C402                   add  sp, 2
  4718                                  
  4719                                  ;-610   prs("\ncmp ");
  4720                                  
  4721 00001C37 68[D81C]                 push constantexpr_2
  4722 00001C3A E8A9E7                   call prs
  4723 00001C3D 83C402                   add  sp, 2
  4724                                  
  4725                                  ;-611   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  4726                                  
  4727 00001C40 FF76FC                   push word [bp-4]
  4728 00001C43 E84BF6                   call gettypes
  4729 00001C46 83C402                   add  sp, 2
  4730 00001C49 A1[3700]                 mov ax, [wi]
  4731 00001C4C 83F802                   cmp ax, 2
  4732 00001C4F 0F850C00                 jne .constantexpr249
  4733 00001C53 68[DF1C]                 push constantexpr_3
  4734 00001C56 E88DE7                   call prs
  4735 00001C59 83C402                   add  sp, 2
  4736 00001C5C E90900                   jmp .constantexpr250
  4737                                  .constantexpr249:
  4738 00001C5F 68[E41C]                 push constantexpr_4
  4739 00001C62 E881E7                   call prs
  4740 00001C65 83C402                   add  sp, 2
  4741                                  
  4742                                  ;-612   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);
  4743                                  
  4744                                  .constantexpr250:
  4745 00001C68 FF76FC                   push word [bp-4]
  4746 00001C6B E8D4F3                   call v
  4747 00001C6E 83C402                   add  sp, 2
  4748 00001C71 68[E91C]                 push constantexpr_5
  4749 00001C74 E86FE7                   call prs
  4750 00001C77 83C402                   add  sp, 2
  4751 00001C7A FF36[2C00]               push word [lexval]
  4752 00001C7E E8C8E8                   call prunsign1
  4753 00001C81 83C402                   add  sp, 2
  4754 00001C84 FF76FA                   push word [bp-6]
  4755 00001C87 E811F9                   call cmpneg
  4756 00001C8A 83C402                   add  sp, 2
  4757 00001C8D 8D06236E                 lea  ax, [fname]
  4758 00001C91 50                       push ax
  4759 00001C92 E851E7                   call prs
  4760 00001C95 83C402                   add  sp, 2
  4761                                  
  4762                                  ;-613   expect(')');
  4763                                  
  4764 00001C98 6A29                     push 41
  4765 00001C9A E82EF3                   call expect
  4766 00001C9D 83C402                   add  sp, 2
  4767                                  
  4768                                  ;-614 }
  4769                                  
  4770                                  
  4771                                  ;-615 
  4772                                  
  4773                                  
  4774                                  ;-616 char ops[5];
  4775 00001CA0 C9                       LEAVE
  4776 00001CA1 C3                       ret
  4777 00001CA2 52656C6174696F6E61-     constantexpr_0 db "Relational expression expected",0
  4778 00001CAB 6C2065787072657373-
  4779 00001CB4 696F6E206578706563-
  4780 00001CBD 74656400           
  4781 00001CC1 203B20636F6E737461-     constantexpr_1 db " ; constant expression",0
  4782 00001CCA 6E7420657870726573-
  4783 00001CD3 73696F6E00         
  4784 00001CD8 5C6E636D702000          constantexpr_2 db "\ncmp ",0
  4785 00001CDF 776F726400              constantexpr_3 db "word",0
  4786 00001CE4 6279746500              constantexpr_4 db "byte",0
  4787 00001CE9 2C2000                  constantexpr_5 db ", ",0
  4788                                  ENDP
  4789                                  section .bss
  4790                                  absolute 56920
  4791 0000DE58 <res 00000005>          ops resb 5
  4792                                  section .text
  4793                                  
  4794                                  ;-617 int doreg1(int iscmp1) { int i;
  4795                                  
  4796                                  
  4797                                  doreg1: PROC
  4798                                  
  4799                                  ;-618   if (istoken('='))          strcpy(ops, "mov");
  4800                                  ;
  4801 00001CEC C8020000                 ENTER  2,0
  4802 00001CF0 6A3D                     push 61
  4803 00001CF2 E8B4F2                   call istoken
  4804 00001CF5 83C402                   add  sp, 2
  4805 00001CF8 08C0                     or  al, al
  4806 00001CFA 0F840E00                 je .doreg1251
  4807 00001CFE 68[9F1E]                 push doreg1_0
  4808 00001D01 8D0658DE                 lea  ax, [ops]
  4809 00001D05 50                       push ax
  4810 00001D06 E827E5                   call strcpy
  4811 00001D09 83C404                   add  sp, 4
  4812                                  
  4813                                  ;-619   if (istoken(T_PLUSASS))    strcpy(ops, "add");
  4814                                  
  4815                                  .doreg1251:
  4816 00001D0C 68CE04                   push 1230
  4817 00001D0F E897F2                   call istoken
  4818 00001D12 83C402                   add  sp, 2
  4819 00001D15 08C0                     or  al, al
  4820 00001D17 0F840E00                 je .doreg1252
  4821 00001D1B 68[A31E]                 push doreg1_1
  4822 00001D1E 8D0658DE                 lea  ax, [ops]
  4823 00001D22 50                       push ax
  4824 00001D23 E80AE5                   call strcpy
  4825 00001D26 83C404                   add  sp, 4
  4826                                  
  4827                                  ;-620   if (istoken(T_MINUSASS))   strcpy(ops, "sub");
  4828                                  
  4829                                  .doreg1252:
  4830 00001D29 68CF04                   push 1231
  4831 00001D2C E87AF2                   call istoken
  4832 00001D2F 83C402                   add  sp, 2
  4833 00001D32 08C0                     or  al, al
  4834 00001D34 0F840E00                 je .doreg1253
  4835 00001D38 68[A71E]                 push doreg1_2
  4836 00001D3B 8D0658DE                 lea  ax, [ops]
  4837 00001D3F 50                       push ax
  4838 00001D40 E8EDE4                   call strcpy
  4839 00001D43 83C404                   add  sp, 4
  4840                                  
  4841                                  ;-621   if (istoken(T_ANDASS))     strcpy(ops, "and");
  4842                                  
  4843                                  .doreg1253:
  4844 00001D46 68D204                   push 1234
  4845 00001D49 E85DF2                   call istoken
  4846 00001D4C 83C402                   add  sp, 2
  4847 00001D4F 08C0                     or  al, al
  4848 00001D51 0F840E00                 je .doreg1254
  4849 00001D55 68[AB1E]                 push doreg1_3
  4850 00001D58 8D0658DE                 lea  ax, [ops]
  4851 00001D5C 50                       push ax
  4852 00001D5D E8D0E4                   call strcpy
  4853 00001D60 83C404                   add  sp, 4
  4854                                  
  4855                                  ;-622   if (istoken(T_ORASS))      strcpy(ops, "or" );
  4856                                  
  4857                                  .doreg1254:
  4858 00001D63 68D304                   push 1235
  4859 00001D66 E840F2                   call istoken
  4860 00001D69 83C402                   add  sp, 2
  4861 00001D6C 08C0                     or  al, al
  4862 00001D6E 0F840E00                 je .doreg1255
  4863 00001D72 68[AF1E]                 push doreg1_4
  4864 00001D75 8D0658DE                 lea  ax, [ops]
  4865 00001D79 50                       push ax
  4866 00001D7A E8B3E4                   call strcpy
  4867 00001D7D 83C404                   add  sp, 4
  4868                                  
  4869                                  ;-623   if (istoken(T_LESSLESS))   strcpy(ops, "shl");
  4870                                  
  4871                                  .doreg1255:
  4872 00001D80 68D804                   push 1240
  4873 00001D83 E823F2                   call istoken
  4874 00001D86 83C402                   add  sp, 2
  4875 00001D89 08C0                     or  al, al
  4876 00001D8B 0F840E00                 je .doreg1256
  4877 00001D8F 68[B21E]                 push doreg1_5
  4878 00001D92 8D0658DE                 lea  ax, [ops]
  4879 00001D96 50                       push ax
  4880 00001D97 E896E4                   call strcpy
  4881 00001D9A 83C404                   add  sp, 4
  4882                                  
  4883                                  ;-624   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");
  4884                                  
  4885                                  .doreg1256:
  4886 00001D9D 68D904                   push 1241
  4887 00001DA0 E806F2                   call istoken
  4888 00001DA3 83C402                   add  sp, 2
  4889 00001DA6 08C0                     or  al, al
  4890 00001DA8 0F840E00                 je .doreg1257
  4891 00001DAC 68[B61E]                 push doreg1_6
  4892 00001DAF 8D0658DE                 lea  ax, [ops]
  4893 00001DB3 50                       push ax
  4894 00001DB4 E879E4                   call strcpy
  4895 00001DB7 83C404                   add  sp, 4
  4896                                  
  4897                                  ;-625   if (iscmp1 == 1) { token=getlex();
  4898                                  
  4899                                  .doreg1257:
  4900 00001DBA 8B4604                   mov ax, [bp+4]
  4901 00001DBD 83F801                   cmp ax, 1
  4902 00001DC0 0F852700                 jne .doreg1258
  4903 00001DC4 E863EC                   call getlex
  4904 00001DC7 A3[1E00]                 mov word [token], ax
  4905                                  
  4906                                  ;-626       if (isrelational() ==0) error1("Relational expected");
  4907                                  
  4908 00001DCA E83EF9                   call isrelational
  4909 00001DCD 83F800                   cmp ax, 0
  4910 00001DD0 0F850900                 jne .doreg1259
  4911 00001DD4 68[BA1E]                 push doreg1_7
  4912 00001DD7 E82DE8                   call error1
  4913 00001DDA 83C402                   add  sp, 2
  4914                                  
  4915                                  ;-627       strcpy(ops, "cmp"); }
  4916                                  
  4917                                  .doreg1259:
  4918 00001DDD 68[CE1E]                 push doreg1_8
  4919 00001DE0 8D0658DE                 lea  ax, [ops]
  4920 00001DE4 50                       push ax
  4921 00001DE5 E848E4                   call strcpy
  4922 00001DE8 83C404                   add  sp, 4
  4923                                  
  4924                                  ;-628   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");
  4925                                  
  4926                                  .doreg1258:
  4927 00001DEB E88CE6                   call prnl
  4928 00001DEE 8D0658DE                 lea  ax, [ops]
  4929 00001DF2 50                       push ax
  4930 00001DF3 E8F0E5                   call prs
  4931 00001DF6 83C402                   add  sp, 2
  4932 00001DF9 68[D21E]                 push doreg1_9
  4933 00001DFC E8E7E5                   call prs
  4934 00001DFF 83C402                   add  sp, 2
  4935 00001E02 FF36[5200]               push word [ireg1]
  4936 00001E06 E877FD                   call printreg
  4937 00001E09 83C402                   add  sp, 2
  4938 00001E0C 68[D51E]                 push doreg1_10
  4939 00001E0F E8D4E5                   call prs
  4940 00001E12 83C402                   add  sp, 2
  4941                                  
  4942                                  ;-629 
  4943                                  
  4944                                  
  4945                                  ;-630   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}
  4946                                  
  4947 00001E15 680101                   push 257
  4948 00001E18 E88EF1                   call istoken
  4949 00001E1B 83C402                   add  sp, 2
  4950 00001E1E 08C0                     or  al, al
  4951 00001E20 0F840D00                 je .doreg1260
  4952 00001E24 FF36[2C00]               push word [lexval]
  4953 00001E28 E81EE7                   call prunsign1
  4954 00001E2B 83C402                   add  sp, 2
  4955 00001E2E E94700                   jmp .reg1
  4956                                  
  4957                                  ;-631   mod2=typeName(); ireg2=checkreg();
  4958                                  
  4959                                  .doreg1260:
  4960 00001E31 E884F3                   call typeName
  4961 00001E34 A3[5400]                 mov word [mod2], ax
  4962 00001E37 E838F9                   call checkreg
  4963 00001E3A A3[5600]                 mov word [ireg2], ax
  4964                                  
  4965                                  ;-632   if (ireg2) {printreg(ireg2); goto reg1;}
  4966                                  
  4967 00001E3D A1[5600]                 mov ax, [ireg2]
  4968 00001E40 08C0                     or  al, al
  4969 00001E42 0F840D00                 je .doreg1261
  4970 00001E46 FF36[5600]               push word [ireg2]
  4971 00001E4A E833FD                   call printreg
  4972 00001E4D 83C402                   add  sp, 2
  4973 00001E50 E92500                   jmp .reg1
  4974                                  
  4975                                  ;-633   i=searchname();  if (mod2 == 2) a(i); else v(i);
  4976                                  
  4977                                  .doreg1261:
  4978 00001E53 E8EFF2                   call searchname
  4979 00001E56 8946FE                   mov [bp-2], ax
  4980 00001E59 A1[5400]                 mov ax, [mod2]
  4981 00001E5C 83F802                   cmp ax, 2
  4982 00001E5F 0F850C00                 jne .doreg1262
  4983 00001E63 FF76FE                   push word [bp-2]
  4984 00001E66 E8CAF1                   call a
  4985 00001E69 83C402                   add  sp, 2
  4986 00001E6C E90900                   jmp .doreg1263
  4987                                  .doreg1262:
  4988 00001E6F FF76FE                   push word [bp-2]
  4989 00001E72 E8CDF1                   call v
  4990 00001E75 83C402                   add  sp, 2
  4991                                  
  4992                                  ;-634   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }
  4993                                  
  4994                                  .doreg1263:
  4995                                  .reg1:
  4996 00001E78 8B4604                   mov ax, [bp+4]
  4997 00001E7B 83F801                   cmp ax, 1
  4998 00001E7E 0F851B00                 jne .doreg1264
  4999 00001E82 6A00                     push 0
  5000 00001E84 E814F7                   call cmpneg
  5001 00001E87 83C402                   add  sp, 2
  5002 00001E8A 8D06236E                 lea  ax, [fname]
  5003 00001E8E 50                       push ax
  5004 00001E8F E854E5                   call prs
  5005 00001E92 83C402                   add  sp, 2
  5006 00001E95 6A29                     push 41
  5007 00001E97 E831F1                   call expect
  5008 00001E9A 83C402                   add  sp, 2
  5009                                  
  5010                                  ;-635 }
  5011                                  
  5012                                  .doreg1264:
  5013                                  
  5014                                  ;-636 
  5015                                  
  5016                                  
  5017                                  ;-637 int compoundass(char *op, int mode, int id1) {
  5018 00001E9D C9                       LEAVE
  5019 00001E9E C3                       ret
  5020 00001E9F 6D6F7600                doreg1_0 db "mov",0
  5021 00001EA3 61646400                doreg1_1 db "add",0
  5022 00001EA7 73756200                doreg1_2 db "sub",0
  5023 00001EAB 616E6400                doreg1_3 db "and",0
  5024 00001EAF 6F7200                  doreg1_4 db "or",0
  5025 00001EB2 73686C00                doreg1_5 db "shl",0
  5026 00001EB6 73687200                doreg1_6 db "shr",0
  5027 00001EBA 52656C6174696F6E61-     doreg1_7 db "Relational expected",0
  5028 00001EC3 6C2065787065637465-
  5029 00001ECC 6400               
  5030 00001ECE 636D7000                doreg1_8 db "cmp",0
  5031 00001ED2 202000                  doreg1_9 db "  ",0
  5032 00001ED5 2C2000                  doreg1_10 db ", ",0
  5033                                  ENDP
  5034                                  
  5035                                  compoundass: PROC
  5036                                  
  5037                                  ;-638   if(mode) error1("only scalar Var allowed");
  5038                                  ;
  5039 00001ED8 C8000000                 ENTER  0,0
  5040 00001EDC 8B4606                   mov ax, [bp+6]
  5041 00001EDF 08C0                     or  al, al
  5042 00001EE1 0F840900                 je .compoundass265
  5043 00001EE5 68[521F]                 push compoundass_0
  5044 00001EE8 E81CE7                   call error1
  5045 00001EEB 83C402                   add  sp, 2
  5046                                  
  5047                                  ;-639   prnl(); prs(op); prs("  ");
  5048                                  
  5049                                  .compoundass265:
  5050 00001EEE E889E5                   call prnl
  5051 00001EF1 FF7604                   push word [bp+4]
  5052 00001EF4 E8EFE4                   call prs
  5053 00001EF7 83C402                   add  sp, 2
  5054 00001EFA 68[6A1F]                 push compoundass_1
  5055 00001EFD E8E6E4                   call prs
  5056 00001F00 83C402                   add  sp, 2
  5057                                  
  5058                                  ;-640   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  5059                                  
  5060 00001F03 FF7608                   push word [bp+8]
  5061 00001F06 E888F3                   call gettypes
  5062 00001F09 83C402                   add  sp, 2
  5063 00001F0C A1[3700]                 mov ax, [wi]
  5064 00001F0F 83F802                   cmp ax, 2
  5065 00001F12 0F850C00                 jne .compoundass266
  5066 00001F16 68[6D1F]                 push compoundass_2
  5067 00001F19 E8CAE4                   call prs
  5068 00001F1C 83C402                   add  sp, 2
  5069 00001F1F E90900                   jmp .compoundass267
  5070                                  .compoundass266:
  5071 00001F22 68[721F]                 push compoundass_3
  5072 00001F25 E8BEE4                   call prs
  5073 00001F28 83C402                   add  sp, 2
  5074                                  
  5075                                  ;-641   v(id1); prs(", ");
  5076                                  
  5077                                  .compoundass267:
  5078 00001F2B FF7608                   push word [bp+8]
  5079 00001F2E E811F1                   call v
  5080 00001F31 83C402                   add  sp, 2
  5081 00001F34 68[771F]                 push compoundass_4
  5082 00001F37 E8ACE4                   call prs
  5083 00001F3A 83C402                   add  sp, 2
  5084                                  
  5085                                  ;-642   expect(T_CONST); prunsign1(lexval);
  5086                                  
  5087 00001F3D 680101                   push 257
  5088 00001F40 E888F0                   call expect
  5089 00001F43 83C402                   add  sp, 2
  5090 00001F46 FF36[2C00]               push word [lexval]
  5091 00001F4A E8FCE5                   call prunsign1
  5092 00001F4D 83C402                   add  sp, 2
  5093                                  
  5094                                  ;-643 }
  5095                                  
  5096                                  
  5097                                  ;-644 int dovar1(int mode, int op, int ixarr, int id1) {
  5098 00001F50 C9                       LEAVE
  5099 00001F51 C3                       ret
  5100 00001F52 6F6E6C79207363616C-     compoundass_0 db "only scalar Var allowed",0
  5101 00001F5B 61722056617220616C-
  5102 00001F64 6C6F77656400       
  5103 00001F6A 202000                  compoundass_1 db "  ",0
  5104 00001F6D 776F726400              compoundass_2 db "word",0
  5105 00001F72 6279746500              compoundass_3 db "byte",0
  5106 00001F77 2C2000                  compoundass_4 db ", ",0
  5107                                  ENDP
  5108                                  
  5109                                  dovar1: PROC
  5110                                  
  5111                                  ;-645   gettypes(id1);
  5112                                  ;
  5113 00001F7A C8000000                 ENTER  0,0
  5114 00001F7E FF760A                   push word [bp+10]
  5115 00001F81 E80DF3                   call gettypes
  5116 00001F84 83C402                   add  sp, 2
  5117                                  
  5118                                  ;-646   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);
  5119                                  
  5120 00001F87 8B4604                   mov ax, [bp+4]
  5121 00001F8A 83F801                   cmp ax, 1
  5122 00001F8D 0F854700                 jne .dovar1268
  5123 00001F91 68[CF20]                 push dovar1_0
  5124 00001F94 E84FE4                   call prs
  5125 00001F97 83C402                   add  sp, 2
  5126 00001F9A FF760A                   push word [bp+10]
  5127 00001F9D E8A2F0                   call v
  5128 00001FA0 83C402                   add  sp, 2
  5129 00001FA3 E8D4E4                   call prnl
  5130 00001FA6 FF7606                   push word [bp+6]
  5131 00001FA9 E83AE4                   call prs
  5132 00001FAC 83C402                   add  sp, 2
  5133                                  
  5134                                  ;-647     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");
  5135                                  
  5136 00001FAF A1[3400]                 mov ax, [widthi]
  5137 00001FB2 83F801                   cmp ax, 1
  5138 00001FB5 0F850900                 jne .dovar1269
  5139 00001FB9 68[DB20]                 push dovar1_1
  5140 00001FBC E827E4                   call prs
  5141 00001FBF 83C402                   add  sp, 2
  5142                                  
  5143                                  ;-648     if(widthi == 2) prs(" ax, [bx]");
  5144                                  
  5145                                  .dovar1269:
  5146 00001FC2 A1[3400]                 mov ax, [widthi]
  5147 00001FC5 83F802                   cmp ax, 2
  5148 00001FC8 0F850900                 jne .dovar1270
  5149 00001FCC 68[F120]                 push dovar1_2
  5150 00001FCF E814E4                   call prs
  5151 00001FD2 83C402                   add  sp, 2
  5152                                  
  5153                                  ;-649     return; }
  5154                                  
  5155                                  .dovar1270:
  5156 00001FD5 E9F500                   jmp .retndovar1
  5157                                  
  5158                                  ;-650   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }
  5159                                  
  5160                                  .dovar1268:
  5161 00001FD8 8B4604                   mov ax, [bp+4]
  5162 00001FDB 83F802                   cmp ax, 2
  5163 00001FDE 0F852100                 jne .dovar1271
  5164 00001FE2 E895E4                   call prnl
  5165 00001FE5 FF7606                   push word [bp+6]
  5166 00001FE8 E8FBE3                   call prs
  5167 00001FEB 83C402                   add  sp, 2
  5168 00001FEE 68[FB20]                 push dovar1_3
  5169 00001FF1 E8F2E3                   call prs
  5170 00001FF4 83C402                   add  sp, 2
  5171 00001FF7 FF760A                   push word [bp+10]
  5172 00001FFA E836F0                   call a
  5173 00001FFD 83C402                   add  sp, 2
  5174 00002000 E9CA00                   jmp .retndovar1
  5175                                  
  5176                                  ;-651   if (ixarr) {
  5177                                  
  5178                                  .dovar1271:
  5179 00002003 8B4608                   mov ax, [bp+8]
  5180 00002006 08C0                     or  al, al
  5181 00002008 0F847300                 je .dovar1272
  5182                                  
  5183                                  ;-652     prs("\n mov bx, "); v(ixarr);
  5184                                  
  5185 0000200C 68[0121]                 push dovar1_4
  5186 0000200F E8D4E3                   call prs
  5187 00002012 83C402                   add  sp, 2
  5188 00002015 FF7608                   push word [bp+8]
  5189 00002018 E827F0                   call v
  5190 0000201B 83C402                   add  sp, 2
  5191                                  
  5192                                  ;-653     if (wi==2) prs("\n shl bx, 1");
  5193                                  
  5194 0000201E A1[3700]                 mov ax, [wi]
  5195 00002021 83F802                   cmp ax, 2
  5196 00002024 0F850900                 jne .dovar1273
  5197 00002028 68[0D21]                 push dovar1_5
  5198 0000202B E8B8E3                   call prs
  5199 0000202E 83C402                   add  sp, 2
  5200                                  
  5201                                  ;-654     prs("\n "); prs(op);
  5202                                  
  5203                                  .dovar1273:
  5204 00002031 68[1A21]                 push dovar1_6
  5205 00002034 E8AFE3                   call prs
  5206 00002037 83C402                   add  sp, 2
  5207 0000203A FF7606                   push word [bp+6]
  5208 0000203D E8A6E3                   call prs
  5209 00002040 83C402                   add  sp, 2
  5210                                  
  5211                                  ;-655     if (wi==2) prs(" ax, "); else prs(" al, ");
  5212                                  
  5213 00002043 A1[3700]                 mov ax, [wi]
  5214 00002046 83F802                   cmp ax, 2
  5215 00002049 0F850C00                 jne .dovar1274
  5216 0000204D 68[1E21]                 push dovar1_7
  5217 00002050 E893E3                   call prs
  5218 00002053 83C402                   add  sp, 2
  5219 00002056 E90900                   jmp .dovar1275
  5220                                  .dovar1274:
  5221 00002059 68[2421]                 push dovar1_8
  5222 0000205C E887E3                   call prs
  5223 0000205F 83C402                   add  sp, 2
  5224                                  
  5225                                  ;-656 // v(id1); prs(" [bx]");
  5226                                  
  5227                                  
  5228                                  ;-657     prc('['); printName(id1); prs(" + bx]");
  5229                                  
  5230                                  .dovar1275:
  5231 00002062 6A5B                     push 91
  5232 00002064 E826E3                   call prc
  5233 00002067 83C402                   add  sp, 2
  5234 0000206A FF760A                   push word [bp+10]
  5235 0000206D E8BCE8                   call printName
  5236 00002070 83C402                   add  sp, 2
  5237 00002073 68[2A21]                 push dovar1_9
  5238 00002076 E86DE3                   call prs
  5239 00002079 83C402                   add  sp, 2
  5240                                  
  5241                                  ;-658     return; }
  5242                                  
  5243 0000207C E94E00                   jmp .retndovar1
  5244                                  
  5245                                  ;-659   prnl();prs(op);
  5246                                  
  5247                                  .dovar1272:
  5248 0000207F E8F8E3                   call prnl
  5249 00002082 FF7606                   push word [bp+6]
  5250 00002085 E85EE3                   call prs
  5251 00002088 83C402                   add  sp, 2
  5252                                  
  5253                                  ;-660   if(wi==1) prs(" al, ");
  5254                                  
  5255 0000208B A1[3700]                 mov ax, [wi]
  5256 0000208E 83F801                   cmp ax, 1
  5257 00002091 0F850900                 jne .dovar1276
  5258 00002095 68[3121]                 push dovar1_10
  5259 00002098 E84BE3                   call prs
  5260 0000209B 83C402                   add  sp, 2
  5261                                  
  5262                                  ;-661   if(wi==2) prs(" ax, ");
  5263                                  
  5264                                  .dovar1276:
  5265 0000209E A1[3700]                 mov ax, [wi]
  5266 000020A1 83F802                   cmp ax, 2
  5267 000020A4 0F850900                 jne .dovar1277
  5268 000020A8 68[3721]                 push dovar1_11
  5269 000020AB E838E3                   call prs
  5270 000020AE 83C402                   add  sp, 2
  5271                                  
  5272                                  ;-662   if(wi==4) prs(" eax, ");
  5273                                  
  5274                                  .dovar1277:
  5275 000020B1 A1[3700]                 mov ax, [wi]
  5276 000020B4 83F804                   cmp ax, 4
  5277 000020B7 0F850900                 jne .dovar1278
  5278 000020BB 68[3D21]                 push dovar1_12
  5279 000020BE E825E3                   call prs
  5280 000020C1 83C402                   add  sp, 2
  5281                                  
  5282                                  ;-663   v(id1);
  5283                                  
  5284                                  .dovar1278:
  5285 000020C4 FF760A                   push word [bp+10]
  5286 000020C7 E878EF                   call v
  5287 000020CA 83C402                   add  sp, 2
  5288                                  
  5289                                  ;-664 }
  5290                                  
  5291                                  
  5292                                  ;-665 int rterm(char *op) {int mode; int opint; int ixarr; int id1;
  5293                                  
  5294 000020CD C9                       .retndovar1: LEAVE
  5295 000020CE C3                       ret
  5296 000020CF 5C6E206D6F76206278-     dovar1_0 db "\n mov bx, ",0
  5297 000020D8 2C2000             
  5298 000020DB 20616C2C205B62785D-     dovar1_1 db " al, [bx]\n mov ah, 0",0
  5299 000020E4 5C6E206D6F76206168-
  5300 000020ED 2C203000           
  5301 000020F1 2061782C205B62785D-     dovar1_2 db " ax, [bx]",0
  5302 000020FA 00                 
  5303 000020FB 2061782C2000            dovar1_3 db " ax, ",0
  5304 00002101 5C6E206D6F76206278-     dovar1_4 db "\n mov bx, ",0
  5305 0000210A 2C2000             
  5306 0000210D 5C6E2073686C206278-     dovar1_5 db "\n shl bx, 1",0
  5307 00002116 2C203100           
  5308 0000211A 5C6E2000                dovar1_6 db "\n ",0
  5309 0000211E 2061782C2000            dovar1_7 db " ax, ",0
  5310 00002124 20616C2C2000            dovar1_8 db " al, ",0
  5311 0000212A 202B2062785D00          dovar1_9 db " + bx]",0
  5312 00002131 20616C2C2000            dovar1_10 db " al, ",0
  5313 00002137 2061782C2000            dovar1_11 db " ax, ",0
  5314 0000213D 206561782C2000          dovar1_12 db " eax, ",0
  5315                                  ENDP
  5316                                  
  5317                                  rterm: PROC
  5318                                  
  5319                                  ;-666   if (istoken(T_CONST)) { prnl(); prs(op);
  5320                                  ;
  5321 00002144 C8080000                 ENTER  8,0
  5322 00002148 680101                   push 257
  5323 0000214B E85BEE                   call istoken
  5324 0000214E 83C402                   add  sp, 2
  5325 00002151 08C0                     or  al, al
  5326 00002153 0F845200                 je .rterm279
  5327 00002157 E820E3                   call prnl
  5328 0000215A FF7604                   push word [bp+4]
  5329 0000215D E886E2                   call prs
  5330 00002160 83C402                   add  sp, 2
  5331                                  
  5332                                  ;-667     if (wi==1) prs(" al, ");
  5333                                  
  5334 00002163 A1[3700]                 mov ax, [wi]
  5335 00002166 83F801                   cmp ax, 1
  5336 00002169 0F850900                 jne .rterm280
  5337 0000216D 68[2D22]                 push rterm_0
  5338 00002170 E873E2                   call prs
  5339 00002173 83C402                   add  sp, 2
  5340                                  
  5341                                  ;-668     if (wi==2) prs(" ax, ");
  5342                                  
  5343                                  .rterm280:
  5344 00002176 A1[3700]                 mov ax, [wi]
  5345 00002179 83F802                   cmp ax, 2
  5346 0000217C 0F850900                 jne .rterm281
  5347 00002180 68[3322]                 push rterm_1
  5348 00002183 E860E2                   call prs
  5349 00002186 83C402                   add  sp, 2
  5350                                  
  5351                                  ;-669     if (wi==4) prs(" eax, ");
  5352                                  
  5353                                  .rterm281:
  5354 00002189 A1[3700]                 mov ax, [wi]
  5355 0000218C 83F804                   cmp ax, 4
  5356 0000218F 0F850900                 jne .rterm282
  5357 00002193 68[3922]                 push rterm_2
  5358 00002196 E84DE2                   call prs
  5359 00002199 83C402                   add  sp, 2
  5360                                  
  5361                                  ;-670     prunsign1(lexval); return;}
  5362                                  
  5363                                  .rterm282:
  5364 0000219C FF36[2C00]               push word [lexval]
  5365 000021A0 E8A6E3                   call prunsign1
  5366 000021A3 83C402                   add  sp, 2
  5367 000021A6 E98200                   jmp .retnrterm
  5368                                  
  5369                                  ;-671   mode=typeName(); id1=searchname(); ixarr=0;
  5370                                  
  5371                                  .rterm279:
  5372 000021A9 E80CF0                   call typeName
  5373 000021AC 8946FE                   mov [bp-2], ax
  5374 000021AF E893EF                   call searchname
  5375 000021B2 8946F8                   mov [bp-8], ax
  5376 000021B5 B80000                   mov ax, 0
  5377 000021B8 8946FA                   mov [bp-6], ax
  5378                                  
  5379                                  ;-672   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');
  5380                                  
  5381 000021BB 6A5B                     push 91
  5382 000021BD E8E9ED                   call istoken
  5383 000021C0 83C402                   add  sp, 2
  5384 000021C3 08C0                     or  al, al
  5385 000021C5 0F843300                 je .rterm283
  5386 000021C9 E879EF                   call searchname
  5387 000021CC 8946FA                   mov [bp-6], ax
  5388 000021CF 680001                   push 256
  5389 000021D2 E8F6ED                   call expect
  5390 000021D5 83C402                   add  sp, 2
  5391 000021D8 6A5D                     push 93
  5392 000021DA E8EEED                   call expect
  5393 000021DD 83C402                   add  sp, 2
  5394                                  
  5395                                  ;-673     gettypes(ixarr);
  5396                                  
  5397 000021E0 FF76FA                   push word [bp-6]
  5398 000021E3 E8ABF0                   call gettypes
  5399 000021E6 83C402                   add  sp, 2
  5400                                  
  5401                                  ;-674     if (widthi != 2) error1("Arrayindex muss int sein"); }
  5402                                  
  5403 000021E9 A1[3400]                 mov ax, [widthi]
  5404 000021EC 83F802                   cmp ax, 2
  5405 000021EF 0F840900                 je  .rterm284
  5406 000021F3 68[4022]                 push rterm_3
  5407 000021F6 E80EE4                   call error1
  5408 000021F9 83C402                   add  sp, 2
  5409                                  .rterm284:
  5410                                  
  5411                                  ;-675   if (eqstr(symbol,"_AX")) return;
  5412                                  
  5413                                  .rterm283:
  5414 000021FC 68[5922]                 push rterm_4
  5415 000021FF 8D06A36D                 lea  ax, [symbol]
  5416 00002203 50                       push ax
  5417 00002204 E85FE0                   call eqstr
  5418 00002207 83C404                   add  sp, 4
  5419 0000220A 08C0                     or  al, al
  5420 0000220C 0F840300                 je .rterm285
  5421 00002210 E91800                   jmp .retnrterm
  5422                                  
  5423                                  ;-676   opint=op; dovar1(mode, opint, ixarr, id1);
  5424                                  
  5425                                  .rterm285:
  5426 00002213 8B4604                   mov ax, [bp+4]
  5427 00002216 8946FC                   mov [bp-4], ax
  5428 00002219 FF76F8                   push word [bp-8]
  5429 0000221C FF76FA                   push word [bp-6]
  5430 0000221F FF76FC                   push word [bp-4]
  5431 00002222 FF76FE                   push word [bp-2]
  5432 00002225 E852FD                   call dovar1
  5433 00002228 83C408                   add  sp, 8
  5434                                  
  5435                                  ;-677 }
  5436                                  
  5437                                  
  5438                                  ;-678 
  5439                                  
  5440                                  
  5441                                  ;-679 int doreg(char *dr) { int i; expect('=');
  5442                                  
  5443 0000222B C9                       .retnrterm: LEAVE
  5444 0000222C C3                       ret
  5445 0000222D 20616C2C2000            rterm_0 db " al, ",0
  5446 00002233 2061782C2000            rterm_1 db " ax, ",0
  5447 00002239 206561782C2000          rterm_2 db " eax, ",0
  5448 00002240 4172726179696E6465-     rterm_3 db "Arrayindex muss int sein",0
  5449 00002249 78206D75737320696E-
  5450 00002252 74207365696E00     
  5451 00002259 5F415800                rterm_4 db "_AX",0
  5452                                  ENDP
  5453                                  
  5454                                  doreg: PROC;
  5455 0000225D C8020000                 ENTER  2,0
  5456 00002261 6A3D                     push 61
  5457 00002263 E865ED                   call expect
  5458 00002266 83C402                   add  sp, 2
  5459                                  
  5460                                  ;-680   prs("\n mov  "); prs(dr); prs(", ");
  5461                                  
  5462 00002269 68[CC22]                 push doreg_0
  5463 0000226C E877E1                   call prs
  5464 0000226F 83C402                   add  sp, 2
  5465 00002272 FF7604                   push word [bp+4]
  5466 00002275 E86EE1                   call prs
  5467 00002278 83C402                   add  sp, 2
  5468 0000227B 68[D522]                 push doreg_1
  5469 0000227E E865E1                   call prs
  5470 00002281 83C402                   add  sp, 2
  5471                                  
  5472                                  ;-681        if (istoken(T_CONST)) prunsign1(lexval);
  5473                                  
  5474 00002284 680101                   push 257
  5475 00002287 E81FED                   call istoken
  5476 0000228A 83C402                   add  sp, 2
  5477 0000228D 08C0                     or  al, al
  5478 0000228F 0F840D00                 je .doreg286
  5479 00002293 FF36[2C00]               push word [lexval]
  5480 00002297 E8AFE2                   call prunsign1
  5481 0000229A 83C402                   add  sp, 2
  5482                                  
  5483                                  ;-682   else if (istoken(T_NAME )) { i=searchname(); v(i); }
  5484                                  
  5485 0000229D E92A00                   jmp .doreg287
  5486                                  .doreg286:
  5487 000022A0 680001                   push 256
  5488 000022A3 E803ED                   call istoken
  5489 000022A6 83C402                   add  sp, 2
  5490 000022A9 08C0                     or  al, al
  5491 000022AB 0F841200                 je .doreg288
  5492 000022AF E893EE                   call searchname
  5493 000022B2 8946FE                   mov [bp-2], ax
  5494 000022B5 FF76FE                   push word [bp-2]
  5495 000022B8 E887ED                   call v
  5496 000022BB 83C402                   add  sp, 2
  5497                                  
  5498                                  ;-683   else error1("only number or var allowed");
  5499                                  
  5500 000022BE E90900                   jmp .doreg289
  5501                                  .doreg288:
  5502 000022C1 68[D822]                 push doreg_2
  5503 000022C4 E840E3                   call error1
  5504 000022C7 83C402                   add  sp, 2
  5505                                  
  5506                                  ;-684 }
  5507                                  
  5508                                  .doreg289:
  5509                                  .doreg287:
  5510                                  
  5511                                  ;-685 int isreg() {
  5512 000022CA C9                       LEAVE
  5513 000022CB C3                       ret
  5514 000022CC 5C6E206D6F76202000      doreg_0 db "\n mov  ",0
  5515 000022D5 2C2000                  doreg_1 db ", ",0
  5516 000022D8 6F6E6C79206E756D62-     doreg_2 db "only number or var allowed",0
  5517 000022E1 6572206F7220766172-
  5518 000022EA 20616C6C6F77656400 
  5519                                  ENDP
  5520                                  
  5521                                  isreg: PROC
  5522                                  
  5523                                  ;-686   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}
  5524                                  
  5525 000022F3 68[E024]                 push isreg_0
  5526 000022F6 8D06A36D                 lea  ax, [symbol]
  5527 000022FA 50                       push ax
  5528 000022FB E868DF                   call eqstr
  5529 000022FE 83C404                   add  sp, 4
  5530 00002301 08C0                     or  al, al
  5531 00002303 0F840C00                 je .isreg290
  5532 00002307 68[E424]                 push isreg_1
  5533 0000230A E850FF                   call doreg
  5534 0000230D 83C402                   add  sp, 2
  5535 00002310 E9C601                   jmp .r1
  5536                                  
  5537                                  ;-687   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}
  5538                                  
  5539                                  .isreg290:
  5540 00002313 68[E724]                 push isreg_2
  5541 00002316 8D06A36D                 lea  ax, [symbol]
  5542 0000231A 50                       push ax
  5543 0000231B E848DF                   call eqstr
  5544 0000231E 83C404                   add  sp, 4
  5545 00002321 08C0                     or  al, al
  5546 00002323 0F840C00                 je .isreg291
  5547 00002327 68[EB24]                 push isreg_3
  5548 0000232A E830FF                   call doreg
  5549 0000232D 83C402                   add  sp, 2
  5550 00002330 E9A601                   jmp .r1
  5551                                  
  5552                                  ;-688   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}
  5553                                  
  5554                                  .isreg291:
  5555 00002333 68[EE24]                 push isreg_4
  5556 00002336 8D06A36D                 lea  ax, [symbol]
  5557 0000233A 50                       push ax
  5558 0000233B E828DF                   call eqstr
  5559 0000233E 83C404                   add  sp, 4
  5560 00002341 08C0                     or  al, al
  5561 00002343 0F840C00                 je .isreg292
  5562 00002347 68[F224]                 push isreg_5
  5563 0000234A E810FF                   call doreg
  5564 0000234D 83C402                   add  sp, 2
  5565 00002350 E98601                   jmp .r1
  5566                                  
  5567                                  ;-689   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}
  5568                                  
  5569                                  .isreg292:
  5570 00002353 68[F524]                 push isreg_6
  5571 00002356 8D06A36D                 lea  ax, [symbol]
  5572 0000235A 50                       push ax
  5573 0000235B E808DF                   call eqstr
  5574 0000235E 83C404                   add  sp, 4
  5575 00002361 08C0                     or  al, al
  5576 00002363 0F840C00                 je .isreg293
  5577 00002367 68[F924]                 push isreg_7
  5578 0000236A E8F0FE                   call doreg
  5579 0000236D 83C402                   add  sp, 2
  5580 00002370 E96601                   jmp .r1
  5581                                  
  5582                                  ;-690   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}
  5583                                  
  5584                                  .isreg293:
  5585 00002373 68[FC24]                 push isreg_8
  5586 00002376 8D06A36D                 lea  ax, [symbol]
  5587 0000237A 50                       push ax
  5588 0000237B E8E8DE                   call eqstr
  5589 0000237E 83C404                   add  sp, 4
  5590 00002381 08C0                     or  al, al
  5591 00002383 0F840C00                 je .isreg294
  5592 00002387 68[0025]                 push isreg_9
  5593 0000238A E8D0FE                   call doreg
  5594 0000238D 83C402                   add  sp, 2
  5595 00002390 E94601                   jmp .r1
  5596                                  
  5597                                  ;-691   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}
  5598                                  
  5599                                  .isreg294:
  5600 00002393 68[0325]                 push isreg_10
  5601 00002396 8D06A36D                 lea  ax, [symbol]
  5602 0000239A 50                       push ax
  5603 0000239B E8C8DE                   call eqstr
  5604 0000239E 83C404                   add  sp, 4
  5605 000023A1 08C0                     or  al, al
  5606 000023A3 0F840C00                 je .isreg295
  5607 000023A7 68[0725]                 push isreg_11
  5608 000023AA E8B0FE                   call doreg
  5609 000023AD 83C402                   add  sp, 2
  5610 000023B0 E92601                   jmp .r1
  5611                                  
  5612                                  ;-692   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}
  5613                                  
  5614                                  .isreg295:
  5615 000023B3 68[0A25]                 push isreg_12
  5616 000023B6 8D06A36D                 lea  ax, [symbol]
  5617 000023BA 50                       push ax
  5618 000023BB E8A8DE                   call eqstr
  5619 000023BE 83C404                   add  sp, 4
  5620 000023C1 08C0                     or  al, al
  5621 000023C3 0F840C00                 je .isreg296
  5622 000023C7 68[0E25]                 push isreg_13
  5623 000023CA E890FE                   call doreg
  5624 000023CD 83C402                   add  sp, 2
  5625 000023D0 E90601                   jmp .r1
  5626                                  
  5627                                  ;-693   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}
  5628                                  
  5629                                  .isreg296:
  5630 000023D3 68[1125]                 push isreg_14
  5631 000023D6 8D06A36D                 lea  ax, [symbol]
  5632 000023DA 50                       push ax
  5633 000023DB E888DE                   call eqstr
  5634 000023DE 83C404                   add  sp, 4
  5635 000023E1 08C0                     or  al, al
  5636 000023E3 0F840C00                 je .isreg297
  5637 000023E7 68[1525]                 push isreg_15
  5638 000023EA E870FE                   call doreg
  5639 000023ED 83C402                   add  sp, 2
  5640 000023F0 E9E600                   jmp .r1
  5641                                  
  5642                                  ;-694   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}
  5643                                  
  5644                                  .isreg297:
  5645 000023F3 68[1825]                 push isreg_16
  5646 000023F6 8D06A36D                 lea  ax, [symbol]
  5647 000023FA 50                       push ax
  5648 000023FB E868DE                   call eqstr
  5649 000023FE 83C404                   add  sp, 4
  5650 00002401 08C0                     or  al, al
  5651 00002403 0F840C00                 je .isreg298
  5652 00002407 68[1C25]                 push isreg_17
  5653 0000240A E850FE                   call doreg
  5654 0000240D 83C402                   add  sp, 2
  5655 00002410 E9C600                   jmp .r1
  5656                                  
  5657                                  ;-695   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}
  5658                                  
  5659                                  .isreg298:
  5660 00002413 68[1F25]                 push isreg_18
  5661 00002416 8D06A36D                 lea  ax, [symbol]
  5662 0000241A 50                       push ax
  5663 0000241B E848DE                   call eqstr
  5664 0000241E 83C404                   add  sp, 4
  5665 00002421 08C0                     or  al, al
  5666 00002423 0F840C00                 je .isreg299
  5667 00002427 68[2325]                 push isreg_19
  5668 0000242A E830FE                   call doreg
  5669 0000242D 83C402                   add  sp, 2
  5670 00002430 E9A600                   jmp .r1
  5671                                  
  5672                                  ;-696   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}
  5673                                  
  5674                                  .isreg299:
  5675 00002433 68[2625]                 push isreg_20
  5676 00002436 8D06A36D                 lea  ax, [symbol]
  5677 0000243A 50                       push ax
  5678 0000243B E828DE                   call eqstr
  5679 0000243E 83C404                   add  sp, 4
  5680 00002441 08C0                     or  al, al
  5681 00002443 0F840C00                 je .isreg300
  5682 00002447 68[2A25]                 push isreg_21
  5683 0000244A E810FE                   call doreg
  5684 0000244D 83C402                   add  sp, 2
  5685 00002450 E98600                   jmp .r1
  5686                                  
  5687                                  ;-697   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}
  5688                                  
  5689                                  .isreg300:
  5690 00002453 68[2D25]                 push isreg_22
  5691 00002456 8D06A36D                 lea  ax, [symbol]
  5692 0000245A 50                       push ax
  5693 0000245B E808DE                   call eqstr
  5694 0000245E 83C404                   add  sp, 4
  5695 00002461 08C0                     or  al, al
  5696 00002463 0F840C00                 je .isreg301
  5697 00002467 68[3125]                 push isreg_23
  5698 0000246A E8F0FD                   call doreg
  5699 0000246D 83C402                   add  sp, 2
  5700 00002470 E96600                   jmp .r1
  5701                                  
  5702                                  ;-698   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}
  5703                                  
  5704                                  .isreg301:
  5705 00002473 68[3425]                 push isreg_24
  5706 00002476 8D06A36D                 lea  ax, [symbol]
  5707 0000247A 50                       push ax
  5708 0000247B E8E8DD                   call eqstr
  5709 0000247E 83C404                   add  sp, 4
  5710 00002481 08C0                     or  al, al
  5711 00002483 0F840C00                 je .isreg302
  5712 00002487 68[3825]                 push isreg_25
  5713 0000248A E8D0FD                   call doreg
  5714 0000248D 83C402                   add  sp, 2
  5715 00002490 E94600                   jmp .r1
  5716                                  
  5717                                  ;-699   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}
  5718                                  
  5719                                  .isreg302:
  5720 00002493 68[3B25]                 push isreg_26
  5721 00002496 8D06A36D                 lea  ax, [symbol]
  5722 0000249A 50                       push ax
  5723 0000249B E8C8DD                   call eqstr
  5724 0000249E 83C404                   add  sp, 4
  5725 000024A1 08C0                     or  al, al
  5726 000024A3 0F840C00                 je .isreg303
  5727 000024A7 68[3F25]                 push isreg_27
  5728 000024AA E8B0FD                   call doreg
  5729 000024AD 83C402                   add  sp, 2
  5730 000024B0 E92600                   jmp .r1
  5731                                  
  5732                                  ;-700   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}
  5733                                  
  5734                                  .isreg303:
  5735 000024B3 68[4225]                 push isreg_28
  5736 000024B6 8D06A36D                 lea  ax, [symbol]
  5737 000024BA 50                       push ax
  5738 000024BB E8A8DD                   call eqstr
  5739 000024BE 83C404                   add  sp, 4
  5740 000024C1 08C0                     or  al, al
  5741 000024C3 0F840C00                 je .isreg304
  5742 000024C7 68[4925]                 push isreg_29
  5743 000024CA E890FD                   call doreg
  5744 000024CD 83C402                   add  sp, 2
  5745 000024D0 E90600                   jmp .r1
  5746                                  
  5747                                  ;-701   return 0;   r1: return 1;
  5748                                  
  5749                                  .isreg304:
  5750 000024D3 B80000                   mov ax, 0
  5751 000024D6 E90600                   jmp .retnisreg
  5752                                  .r1:
  5753 000024D9 B80100                   mov ax, 1
  5754 000024DC E90000                   jmp .retnisreg
  5755                                  
  5756                                  ;-702 }
  5757                                  
  5758                                  
  5759                                  ;-703 
  5760                                  
  5761                                  
  5762                                  ;-704 int doassign(int mode, int i, int ixarr, int ixconst) {
  5763                                  
  5764                                   .retnisreg:
  5765 000024DF C3                       ret
  5766 000024E0 5F414800                isreg_0 db "_AH",0
  5767 000024E4 616800                  isreg_1 db "ah",0
  5768 000024E7 5F414C00                isreg_2 db "_AL",0
  5769 000024EB 616C00                  isreg_3 db "al",0
  5770 000024EE 5F415800                isreg_4 db "_AX",0
  5771 000024F2 617800                  isreg_5 db "ax",0
  5772 000024F5 5F424800                isreg_6 db "_BH",0
  5773 000024F9 626800                  isreg_7 db "bh",0
  5774 000024FC 5F424C00                isreg_8 db "_BL",0
  5775 00002500 626C00                  isreg_9 db "bl",0
  5776 00002503 5F425800                isreg_10 db "_BX",0
  5777 00002507 627800                  isreg_11 db "bx",0
  5778 0000250A 5F434800                isreg_12 db "_CH",0
  5779 0000250E 636800                  isreg_13 db "ch",0
  5780 00002511 5F434C00                isreg_14 db "_CL",0
  5781 00002515 636C00                  isreg_15 db "cl",0
  5782 00002518 5F435800                isreg_16 db "_CX",0
  5783 0000251C 637800                  isreg_17 db "cx",0
  5784 0000251F 5F444800                isreg_18 db "_DH",0
  5785 00002523 646800                  isreg_19 db "dh",0
  5786 00002526 5F444C00                isreg_20 db "_DL",0
  5787 0000252A 646C00                  isreg_21 db "dl",0
  5788 0000252D 5F445800                isreg_22 db "_DX",0
  5789 00002531 647800                  isreg_23 db "dx",0
  5790 00002534 5F534900                isreg_24 db "_SI",0
  5791 00002538 736900                  isreg_25 db "si",0
  5792 0000253B 5F444900                isreg_26 db "_DI",0
  5793 0000253F 646900                  isreg_27 db "di",0
  5794 00002542 5F464C41475300          isreg_28 db "_FLAGS",0
  5795 00002549 666C61677300            isreg_29 db "flags",0
  5796                                  ENDP
  5797                                  
  5798                                  doassign: PROC
  5799                                  
  5800                                  ;-705   gettypes(i);
  5801                                  ;
  5802 0000254F C8000000                 ENTER  0,0
  5803 00002553 FF7606                   push word [bp+6]
  5804 00002556 E838ED                   call gettypes
  5805 00002559 83C402                   add  sp, 2
  5806                                  
  5807                                  ;-706   if (mode==1) {prs("\n mov  bx, ");v(i);
  5808                                  
  5809 0000255C 8B4604                   mov ax, [bp+4]
  5810 0000255F 83F801                   cmp ax, 1
  5811 00002562 0F853400                 jne .doassign305
  5812 00002566 68[EC26]                 push doassign_0
  5813 00002569 E87ADE                   call prs
  5814 0000256C 83C402                   add  sp, 2
  5815 0000256F FF7606                   push word [bp+6]
  5816 00002572 E8CDEA                   call v
  5817 00002575 83C402                   add  sp, 2
  5818                                  
  5819                                  ;-707     if (widthi == 2) prs("\n mov  [bx], ax");
  5820                                  
  5821 00002578 A1[3400]                 mov ax, [widthi]
  5822 0000257B 83F802                   cmp ax, 2
  5823 0000257E 0F850C00                 jne .doassign306
  5824 00002582 68[F926]                 push doassign_1
  5825 00002585 E85EDE                   call prs
  5826 00002588 83C402                   add  sp, 2
  5827                                  
  5828                                  ;-708     else  prs("\n mov  [bx], al"); return;}
  5829                                  
  5830 0000258B E90900                   jmp .doassign307
  5831                                  .doassign306:
  5832 0000258E 68[0A27]                 push doassign_2
  5833 00002591 E852DE                   call prs
  5834 00002594 83C402                   add  sp, 2
  5835                                  .doassign307:
  5836 00002597 E95001                   jmp .retndoassign
  5837                                  
  5838                                  ;-709   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}
  5839                                  
  5840                                  .doassign305:
  5841 0000259A 8B4604                   mov ax, [bp+4]
  5842 0000259D 83F802                   cmp ax, 2
  5843 000025A0 0F851E00                 jne .doassign308
  5844 000025A4 68[1B27]                 push doassign_3
  5845 000025A7 E83CDE                   call prs
  5846 000025AA 83C402                   add  sp, 2
  5847 000025AD FF7606                   push word [bp+6]
  5848 000025B0 E880EA                   call a
  5849 000025B3 83C402                   add  sp, 2
  5850 000025B6 68[2427]                 push doassign_4
  5851 000025B9 E82ADE                   call prs
  5852 000025BC 83C402                   add  sp, 2
  5853 000025BF E92801                   jmp .retndoassign
  5854                                  
  5855                                  ;-710   if (ixarr) {  prs("\n mov bx, ");
  5856                                  
  5857                                  .doassign308:
  5858 000025C2 8B4608                   mov ax, [bp+8]
  5859 000025C5 08C0                     or  al, al
  5860 000025C7 0F846E00                 je .doassign309
  5861 000025CB 68[2927]                 push doassign_5
  5862 000025CE E815DE                   call prs
  5863 000025D1 83C402                   add  sp, 2
  5864                                  
  5865                                  ;-711     if(ixconst) prunsign1(ixarr); else v(ixarr);
  5866                                  
  5867 000025D4 8B460A                   mov ax, [bp+10]
  5868 000025D7 08C0                     or  al, al
  5869 000025D9 0F840C00                 je .doassign310
  5870 000025DD FF7608                   push word [bp+8]
  5871 000025E0 E866DF                   call prunsign1
  5872 000025E3 83C402                   add  sp, 2
  5873 000025E6 E90900                   jmp .doassign311
  5874                                  .doassign310:
  5875 000025E9 FF7608                   push word [bp+8]
  5876 000025EC E853EA                   call v
  5877 000025EF 83C402                   add  sp, 2
  5878                                  
  5879                                  ;-712     if (wi==2) prs("\n shl bx, 1");
  5880                                  
  5881                                  .doassign311:
  5882 000025F2 A1[3700]                 mov ax, [wi]
  5883 000025F5 83F802                   cmp ax, 2
  5884 000025F8 0F850900                 jne .doassign312
  5885 000025FC 68[3527]                 push doassign_6
  5886 000025FF E8E4DD                   call prs
  5887 00002602 83C402                   add  sp, 2
  5888                                  
  5889                                  ;-713     prs("\n mov ["); printName(i);
  5890                                  
  5891                                  .doassign312:
  5892 00002605 68[4227]                 push doassign_7
  5893 00002608 E8DBDD                   call prs
  5894 0000260B 83C402                   add  sp, 2
  5895 0000260E FF7606                   push word [bp+6]
  5896 00002611 E818E3                   call printName
  5897 00002614 83C402                   add  sp, 2
  5898                                  
  5899                                  ;-714     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }
  5900                                  
  5901 00002617 A1[3700]                 mov ax, [wi]
  5902 0000261A 83F802                   cmp ax, 2
  5903 0000261D 0F850C00                 jne .doassign313
  5904 00002621 68[4B27]                 push doassign_8
  5905 00002624 E8BFDD                   call prs
  5906 00002627 83C402                   add  sp, 2
  5907 0000262A E90900                   jmp .doassign314
  5908                                  .doassign313:
  5909 0000262D 68[5427]                 push doassign_9
  5910 00002630 E8B3DD                   call prs
  5911 00002633 83C402                   add  sp, 2
  5912                                  .doassign314:
  5913 00002636 E9B100                   jmp .retndoassign
  5914                                  
  5915                                  ;-715   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");
  5916                                  
  5917                                  .doassign309:
  5918 00002639 A1[3700]                 mov ax, [wi]
  5919 0000263C 83F801                   cmp ax, 1
  5920 0000263F 0F853100                 jne .doassign315
  5921 00002643 68[5D27]                 push doassign_10
  5922 00002646 E89DDD                   call prs
  5923 00002649 83C402                   add  sp, 2
  5924 0000264C 8B4606                   mov ax, [bp+6]
  5925 0000264F 3DC800                   cmp ax, 200
  5926 00002652 0F8D0900                 jge .doassign316
  5927 00002656 68[6527]                 push doassign_11
  5928 00002659 E88ADD                   call prs
  5929 0000265C 83C402                   add  sp, 2
  5930                                  
  5931                                  ;-716     } v(i); prs(", al"); return; }
  5932                                  
  5933                                  .doassign316:
  5934 0000265F FF7606                   push word [bp+6]
  5935 00002662 E8DDE9                   call v
  5936 00002665 83C402                   add  sp, 2
  5937 00002668 68[6B27]                 push doassign_12
  5938 0000266B E878DD                   call prs
  5939 0000266E 83C402                   add  sp, 2
  5940 00002671 E97600                   jmp .retndoassign
  5941                                  
  5942                                  ;-717   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");
  5943                                  
  5944                                  .doassign315:
  5945 00002674 A1[3700]                 mov ax, [wi]
  5946 00002677 83F802                   cmp ax, 2
  5947 0000267A 0F853100                 jne .doassign317
  5948 0000267E 68[7027]                 push doassign_13
  5949 00002681 E862DD                   call prs
  5950 00002684 83C402                   add  sp, 2
  5951 00002687 8B4606                   mov ax, [bp+6]
  5952 0000268A 3DC800                   cmp ax, 200
  5953 0000268D 0F8D0900                 jge .doassign318
  5954 00002691 68[7827]                 push doassign_14
  5955 00002694 E84FDD                   call prs
  5956 00002697 83C402                   add  sp, 2
  5957                                  
  5958                                  ;-718     } v(i); prs(", ax"); return; }
  5959                                  
  5960                                  .doassign318:
  5961 0000269A FF7606                   push word [bp+6]
  5962 0000269D E8A2E9                   call v
  5963 000026A0 83C402                   add  sp, 2
  5964 000026A3 68[7E27]                 push doassign_15
  5965 000026A6 E83DDD                   call prs
  5966 000026A9 83C402                   add  sp, 2
  5967 000026AC E93B00                   jmp .retndoassign
  5968                                  
  5969                                  ;-719   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");
  5970                                  
  5971                                  .doassign317:
  5972 000026AF A1[3700]                 mov ax, [wi]
  5973 000026B2 83F804                   cmp ax, 4
  5974 000026B5 0F853100                 jne .doassign319
  5975 000026B9 68[8327]                 push doassign_16
  5976 000026BC E827DD                   call prs
  5977 000026BF 83C402                   add  sp, 2
  5978 000026C2 8B4606                   mov ax, [bp+6]
  5979 000026C5 3DC800                   cmp ax, 200
  5980 000026C8 0F8D0900                 jge .doassign320
  5981 000026CC 68[8B27]                 push doassign_17
  5982 000026CF E814DD                   call prs
  5983 000026D2 83C402                   add  sp, 2
  5984                                  
  5985                                  ;-720     } v(i); prs(", eax"); return; }
  5986                                  
  5987                                  .doassign320:
  5988 000026D5 FF7606                   push word [bp+6]
  5989 000026D8 E867E9                   call v
  5990 000026DB 83C402                   add  sp, 2
  5991 000026DE 68[9227]                 push doassign_18
  5992 000026E1 E802DD                   call prs
  5993 000026E4 83C402                   add  sp, 2
  5994 000026E7 E90000                   jmp .retndoassign
  5995                                  
  5996                                  ;-721 }
  5997                                  
  5998                                  .doassign319:
  5999                                  
  6000                                  ;-722 int domul(int ids) {
  6001                                  
  6002 000026EA C9                       .retndoassign: LEAVE
  6003 000026EB C3                       ret
  6004 000026EC 5C6E206D6F76202062-     doassign_0 db "\n mov  bx, ",0
  6005 000026F5 782C2000           
  6006 000026F9 5C6E206D6F7620205B-     doassign_1 db "\n mov  [bx], ax",0
  6007 00002702 62785D2C20617800   
  6008 0000270A 5C6E206D6F7620205B-     doassign_2 db "\n mov  [bx], al",0
  6009 00002713 62785D2C20616C00   
  6010 0000271B 5C6E206D6F76202000      doassign_3 db "\n mov  ",0
  6011 00002724 2C20617800              doassign_4 db ", ax",0
  6012 00002729 5C6E206D6F76206278-     doassign_5 db "\n mov bx, ",0
  6013 00002732 2C2000             
  6014 00002735 5C6E2073686C206278-     doassign_6 db "\n shl bx, 1",0
  6015 0000273E 2C203100           
  6016 00002742 5C6E206D6F76205B00      doassign_7 db "\n mov [",0
  6017 0000274B 2B62785D2C20617800      doassign_8 db "+bx], ax",0
  6018 00002754 2B62785D2C20616C00      doassign_9 db "+bx], al",0
  6019 0000275D 5C6E206D6F762000        doassign_10 db "\n mov ",0
  6020 00002765 627974652000            doassign_11 db "byte ",0
  6021 0000276B 2C20616C00              doassign_12 db ", al",0
  6022 00002770 5C6E206D6F762000        doassign_13 db "\n mov ",0
  6023 00002778 776F72642000            doassign_14 db "word ",0
  6024 0000277E 2C20617800              doassign_15 db ", ax",0
  6025 00002783 5C6E206D6F762000        doassign_16 db "\n mov ",0
  6026 0000278B 64776F72642000          doassign_17 db "dword ",0
  6027 00002792 2C2065617800            doassign_18 db ", eax",0
  6028                                  ENDP
  6029                                  
  6030                                  domul: PROC
  6031                                  
  6032                                  ;-723   if (ids) rterm("imul"); else {
  6033                                  ;
  6034 00002798 C8000000                 ENTER  0,0
  6035 0000279C 8B4604                   mov ax, [bp+4]
  6036 0000279F 08C0                     or  al, al
  6037 000027A1 0F840C00                 je .domul321
  6038 000027A5 68[EA27]                 push domul_0
  6039 000027A8 E899F9                   call rterm
  6040 000027AB 83C402                   add  sp, 2
  6041 000027AE E93700                   jmp .domul322
  6042                                  .domul321:
  6043                                  
  6044                                  ;-724   if (istoken(T_CONST)) {
  6045                                  
  6046 000027B1 680101                   push 257
  6047 000027B4 E8F2E7                   call istoken
  6048 000027B7 83C402                   add  sp, 2
  6049 000027BA 08C0                     or  al, al
  6050 000027BC 0F841F00                 je .domul323
  6051                                  
  6052                                  ;-725     prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx");
  6053                                  
  6054 000027C0 68[EF27]                 push domul_1
  6055 000027C3 E820DC                   call prs
  6056 000027C6 83C402                   add  sp, 2
  6057 000027C9 FF36[2C00]               push word [lexval]
  6058 000027CD E879DD                   call prunsign1
  6059 000027D0 83C402                   add  sp, 2
  6060 000027D3 68[FB27]                 push domul_2
  6061 000027D6 E80DDC                   call prs
  6062 000027D9 83C402                   add  sp, 2
  6063                                  
  6064                                  ;-726     }
  6065                                  
  6066                                  
  6067                                  ;-727   else error1("with MUL only const number as multiplicator allowed"); } }
  6068                                  
  6069 000027DC E90900                   jmp .domul324
  6070                                  .domul323:
  6071 000027DF 68[0528]                 push domul_3
  6072 000027E2 E822DE                   call error1
  6073 000027E5 83C402                   add  sp, 2
  6074                                  .domul324:
  6075                                  .domul322:
  6076                                  
  6077                                  ;-728 int doidiv(int ids) { int mode; int id1;
  6078 000027E8 C9                       LEAVE
  6079 000027E9 C3                       ret
  6080 000027EA 696D756C00              domul_0 db "imul",0
  6081 000027EF 5C6E206D6F76206278-     domul_1 db "\n mov bx, ",0
  6082 000027F8 2C2000             
  6083 000027FB 5C6E206D756C206278-     domul_2 db "\n mul bx",0
  6084 00002804 00                 
  6085 00002805 77697468204D554C20-     domul_3 db "with MUL only const number as multiplicator allowed",0
  6086 0000280E 6F6E6C7920636F6E73-
  6087 00002817 74206E756D62657220-
  6088 00002820 6173206D756C746970-
  6089 00002829 6C696361746F722061-
  6090 00002832 6C6C6F77656400     
  6091                                  ENDP
  6092                                  
  6093                                  doidiv: PROC
  6094                                  
  6095                                  ;-729   if (istoken(T_CONST)) {
  6096                                  ;
  6097 00002839 C8040000                 ENTER  4,0
  6098 0000283D 680101                   push 257
  6099 00002840 E866E7                   call istoken
  6100 00002843 83C402                   add  sp, 2
  6101 00002846 08C0                     or  al, al
  6102 00002848 0F843400                 je .doidiv325
  6103                                  
  6104                                  ;-730     prs("\n mov bx, "); prunsign1(lexval);
  6105                                  
  6106 0000284C 68[FE28]                 push doidiv_0
  6107 0000284F E894DB                   call prs
  6108 00002852 83C402                   add  sp, 2
  6109 00002855 FF36[2C00]               push word [lexval]
  6110 00002859 E8EDDC                   call prunsign1
  6111 0000285C 83C402                   add  sp, 2
  6112                                  
  6113                                  ;-731     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  6114                                  
  6115 0000285F 8B4604                   mov ax, [bp+4]
  6116 00002862 08C0                     or  al, al
  6117 00002864 0F840C00                 je .doidiv326
  6118 00002868 68[0A29]                 push doidiv_1
  6119 0000286B E878DB                   call prs
  6120 0000286E 83C402                   add  sp, 2
  6121 00002871 E90900                   jmp .doidiv327
  6122                                  .doidiv326:
  6123 00002874 68[1B29]                 push doidiv_2
  6124 00002877 E86CDB                   call prs
  6125 0000287A 83C402                   add  sp, 2
  6126                                  .doidiv327:
  6127                                  
  6128                                  ;-732   else {
  6129                                  
  6130 0000287D E97C00                   jmp .doidiv328
  6131                                  .doidiv325:
  6132                                  
  6133                                  ;-733     mode=typeName(); id1=searchname();
  6134                                  
  6135 00002880 E835E9                   call typeName
  6136 00002883 8946FE                   mov [bp-2], ax
  6137 00002886 E8BCE8                   call searchname
  6138 00002889 8946FC                   mov [bp-4], ax
  6139                                  
  6140                                  ;-734     if (mode) error1("only const number or int as divisor allowed");
  6141                                  
  6142 0000288C 8B46FE                   mov ax, [bp-2]
  6143 0000288F 08C0                     or  al, al
  6144 00002891 0F840900                 je .doidiv329
  6145 00002895 68[3129]                 push doidiv_3
  6146 00002898 E86CDD                   call error1
  6147 0000289B 83C402                   add  sp, 2
  6148                                  
  6149                                  ;-735     gettypes(id1);
  6150                                  
  6151                                  .doidiv329:
  6152 0000289E FF76FC                   push word [bp-4]
  6153 000028A1 E8EDE9                   call gettypes
  6154 000028A4 83C402                   add  sp, 2
  6155                                  
  6156                                  ;-736     if (typei) error1("only int as simple var divisor allowed");
  6157                                  
  6158 000028A7 A1[2E00]                 mov ax, [typei]
  6159 000028AA 08C0                     or  al, al
  6160 000028AC 0F840900                 je .doidiv330
  6161 000028B0 68[5D29]                 push doidiv_4
  6162 000028B3 E851DD                   call error1
  6163 000028B6 83C402                   add  sp, 2
  6164                                  
  6165                                  ;-737     if (wi!=2) error1("only int, no byte as divisor allowed");
  6166                                  
  6167                                  .doidiv330:
  6168 000028B9 A1[3700]                 mov ax, [wi]
  6169 000028BC 83F802                   cmp ax, 2
  6170 000028BF 0F840900                 je  .doidiv331
  6171 000028C3 68[8429]                 push doidiv_5
  6172 000028C6 E83EDD                   call error1
  6173 000028C9 83C402                   add  sp, 2
  6174                                  
  6175                                  ;-738     prs("\n mov bx, "); v(id1);
  6176                                  
  6177                                  .doidiv331:
  6178 000028CC 68[A929]                 push doidiv_6
  6179 000028CF E814DB                   call prs
  6180 000028D2 83C402                   add  sp, 2
  6181 000028D5 FF76FC                   push word [bp-4]
  6182 000028D8 E867E7                   call v
  6183 000028DB 83C402                   add  sp, 2
  6184                                  
  6185                                  ;-739     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  6186                                  
  6187 000028DE 8B4604                   mov ax, [bp+4]
  6188 000028E1 08C0                     or  al, al
  6189 000028E3 0F840C00                 je .doidiv332
  6190 000028E7 68[B529]                 push doidiv_7
  6191 000028EA E8F9DA                   call prs
  6192 000028ED 83C402                   add  sp, 2
  6193 000028F0 E90900                   jmp .doidiv333
  6194                                  .doidiv332:
  6195 000028F3 68[C629]                 push doidiv_8
  6196 000028F6 E8EDDA                   call prs
  6197 000028F9 83C402                   add  sp, 2
  6198                                  .doidiv333:
  6199                                  
  6200                                  ;-740 }
  6201                                  
  6202                                  .doidiv328:
  6203                                  
  6204                                  ;-741 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
  6205 000028FC C9                       LEAVE
  6206 000028FD C3                       ret
  6207 000028FE 5C6E206D6F76206278-     doidiv_0 db "\n mov bx, ",0
  6208 00002907 2C2000             
  6209 0000290A 5C6E206377645C6E20-     doidiv_1 db "\n cwd\n idiv bx",0
  6210 00002913 6964697620627800   
  6211 0000291B 5C6E206D6F76206478-     doidiv_2 db "\n mov dx, 0\n div bx",0
  6212 00002924 2C20305C6E20646976-
  6213 0000292D 20627800           
  6214 00002931 6F6E6C7920636F6E73-     doidiv_3 db "only const number or int as divisor allowed",0
  6215 0000293A 74206E756D62657220-
  6216 00002943 6F7220696E74206173-
  6217 0000294C 2064697669736F7220-
  6218 00002955 616C6C6F77656400   
  6219 0000295D 6F6E6C7920696E7420-     doidiv_4 db "only int as simple var divisor allowed",0
  6220 00002966 61732073696D706C65-
  6221 0000296F 207661722064697669-
  6222 00002978 736F7220616C6C6F77-
  6223 00002981 656400             
  6224 00002984 6F6E6C7920696E742C-     doidiv_5 db "only int, no byte as divisor allowed",0
  6225 0000298D 206E6F206279746520-
  6226 00002996 61732064697669736F-
  6227 0000299F 7220616C6C6F776564-
  6228 000029A8 00                 
  6229 000029A9 5C6E206D6F76206278-     doidiv_6 db "\n mov bx, ",0
  6230 000029B2 2C2000             
  6231 000029B5 5C6E206377645C6E20-     doidiv_7 db "\n cwd\n idiv bx",0
  6232 000029BE 6964697620627800   
  6233 000029C6 5C6E206D6F76206478-     doidiv_8 db "\n mov dx, 0\n div bx",0
  6234 000029CF 2C20305C6E20646976-
  6235 000029D8 20627800           
  6236                                  ENDP
  6237                                  
  6238                                  domod: PROC;
  6239 000029DC C8000000                 ENTER  0,0
  6240 000029E0 FF7604                   push word [bp+4]
  6241 000029E3 E853FE                   call doidiv
  6242 000029E6 83C402                   add  sp, 2
  6243 000029E9 68[F429]                 push domod_0
  6244 000029EC E8F7D9                   call prs
  6245 000029EF 83C402                   add  sp, 2
  6246                                  
  6247                                  ;-742 
  6248                                  
  6249                                  
  6250                                  ;-743 
  6251                                  
  6252                                  
  6253                                  ;-744 int docalltype[10]; int docallvalue[10];
  6254 000029F2 C9                       LEAVE
  6255 000029F3 C3                       ret
  6256 000029F4 5C6E206D6F76206178-     domod_0 db "\n mov ax, dx",0
  6257 000029FD 2C20647800         
  6258                                  ENDP
  6259                                  section .bss
  6260                                  absolute 56925
  6261 0000DE5D <res 00000014>          docalltype resw 10
  6262                                  section .text
  6263                                  section .bss
  6264                                  absolute 56945
  6265 0000DE71 <res 00000014>          docallvalue resw 10
  6266                                  section .text
  6267                                  
  6268                                  ;-745 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register
  6269                                  
  6270                                  section .bss
  6271                                  absolute 56965
  6272 0000DE85 <res 00000011>          procname resb 17
  6273                                  section .text
  6274                                  
  6275                                  ;-746 int docall1() {int i; int narg; int t0; int n0;  int sz32;
  6276                                  
  6277                                  
  6278                                  docall1: PROC
  6279                                  
  6280                                  ;-747   narg=0;  sz32=0;
  6281                                  ;
  6282 00002A02 C80A0000                 ENTER  10,0
  6283 00002A06 B80000                   mov ax, 0
  6284 00002A09 8946FC                   mov [bp-4], ax
  6285 00002A0C B80000                   mov ax, 0
  6286 00002A0F 8946F6                   mov [bp-10], ax
  6287                                  
  6288                                  ;-748   checknamelen();
  6289                                  
  6290 00002A12 E860E6                   call checknamelen
  6291                                  
  6292                                  ;-749   strcpy(&procname, symbol);
  6293                                  
  6294 00002A15 8D06A36D                 lea  ax, [symbol]
  6295 00002A19 50                       push ax
  6296 00002A1A 8D0685DE                 lea  ax, [procname]
  6297 00002A1E 50                       push ax
  6298 00002A1F E80ED8                   call strcpy
  6299 00002A22 83C404                   add  sp, 4
  6300                                  
  6301                                  ;-750   storeCall1();
  6302                                  
  6303 00002A25 E820E9                   call storeCall1
  6304                                  
  6305                                  ;-751   expect('(');
  6306                                  
  6307 00002A28 6A28                     push 40
  6308 00002A2A E89EE5                   call expect
  6309 00002A2D 83C402                   add  sp, 2
  6310                                  
  6311                                  ;-752 	if (istoken(')') ==0 ) {
  6312                                  
  6313 00002A30 6A29                     push 41
  6314 00002A32 E874E5                   call istoken
  6315 00002A35 83C402                   add  sp, 2
  6316 00002A38 83F800                   cmp ax, 0
  6317 00002A3B 0F857802                 jne .docall1334
  6318                                  
  6319                                  ;-753 	  do { narg++;
  6320                                  
  6321                                  .docall1335:
  6322 00002A3F FF46FC                   inc  word[bp-4]
  6323                                  
  6324                                  ;-754 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;
  6325                                  
  6326 00002A42 8B46FC                   mov ax, [bp-4]
  6327 00002A45 83F809                   cmp ax, 9
  6328 00002A48 0F8E0900                 jle .docall1336
  6329 00002A4C 68[FB2C]                 push docall1_0
  6330 00002A4F E8B5DB                   call error1
  6331 00002A52 83C402                   add  sp, 2
  6332                                  .docall1336:
  6333 00002A55 B80000                   mov ax, 0
  6334 00002A58 8946FA                   mov [bp-6], ax
  6335                                  
  6336                                  ;-755       if(istoken(T_CONST)) {t0=1; n0=lexval; }
  6337                                  
  6338 00002A5B 680101                   push 257
  6339 00002A5E E848E5                   call istoken
  6340 00002A61 83C402                   add  sp, 2
  6341 00002A64 08C0                     or  al, al
  6342 00002A66 0F840C00                 je .docall1337
  6343 00002A6A B80100                   mov ax, 1
  6344 00002A6D 8946FA                   mov [bp-6], ax
  6345 00002A70 A1[2C00]                 mov ax, [lexval]
  6346 00002A73 8946F8                   mov [bp-8], ax
  6347                                  
  6348                                  ;-756       if(istoken(T_STRING)){t0=2; n0=nconst;
  6349                                  
  6350                                  .docall1337:
  6351 00002A76 680201                   push 258
  6352 00002A79 E82DE5                   call istoken
  6353 00002A7C 83C402                   add  sp, 2
  6354 00002A7F 08C0                     or  al, al
  6355 00002A81 0F846300                 je .docall1338
  6356 00002A85 B80200                   mov ax, 2
  6357 00002A88 8946FA                   mov [bp-6], ax
  6358 00002A8B A1[2600]                 mov ax, [nconst]
  6359 00002A8E 8946F8                   mov [bp-8], ax
  6360                                  
  6361                                  ;-757         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");
  6362                                  
  6363 00002A91 68[0D2D]                 push docall1_1
  6364 00002A94 E8C8D8                   call eprs
  6365 00002A97 83C402                   add  sp, 2
  6366 00002A9A 8D06236E                 lea  ax, [fname]
  6367 00002A9E 50                       push ax
  6368 00002A9F E8BDD8                   call eprs
  6369 00002AA2 83C402                   add  sp, 2
  6370 00002AA5 6A5F                     push 95
  6371 00002AA7 E8A2D8                   call eprc
  6372 00002AAA 83C402                   add  sp, 2
  6373 00002AAD FF36[2600]               push word [nconst]
  6374 00002AB1 E8D4D9                   call eprnum
  6375 00002AB4 83C402                   add  sp, 2
  6376 00002AB7 68[102D]                 push docall1_2
  6377 00002ABA E8A2D8                   call eprs
  6378 00002ABD 83C402                   add  sp, 2
  6379                                  
  6380                                  ;-758         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }
  6381                                  
  6382 00002AC0 6A22                     push 34
  6383 00002AC2 E887D8                   call eprc
  6384 00002AC5 83C402                   add  sp, 2
  6385 00002AC8 8D06A36D                 lea  ax, [symbol]
  6386 00002ACC 50                       push ax
  6387 00002ACD E88FD8                   call eprs
  6388 00002AD0 83C402                   add  sp, 2
  6389 00002AD3 6A22                     push 34
  6390 00002AD5 E874D8                   call eprc
  6391 00002AD8 83C402                   add  sp, 2
  6392 00002ADB 68[152D]                 push docall1_3
  6393 00002ADE E87ED8                   call eprs
  6394 00002AE1 83C402                   add  sp, 2
  6395 00002AE4 FF06[2600]               inc  word[nconst]
  6396                                  
  6397                                  ;-759       if(istoken('&'))     {t0=3; name1(); n0=searchname();}
  6398                                  
  6399                                  .docall1338:
  6400 00002AE8 6A26                     push 38
  6401 00002AEA E8BCE4                   call istoken
  6402 00002AED 83C402                   add  sp, 2
  6403 00002AF0 08C0                     or  al, al
  6404 00002AF2 0F840F00                 je .docall1339
  6405 00002AF6 B80300                   mov ax, 3
  6406 00002AF9 8946FA                   mov [bp-6], ax
  6407 00002AFC E891E6                   call name1
  6408 00002AFF E843E6                   call searchname
  6409 00002B02 8946F8                   mov [bp-8], ax
  6410                                  
  6411                                  ;-760       if(istoken(T_NAME))  { n0=checkreg();
  6412                                  
  6413                                  .docall1339:
  6414 00002B05 680001                   push 256
  6415 00002B08 E89EE4                   call istoken
  6416 00002B0B 83C402                   add  sp, 2
  6417 00002B0E 08C0                     or  al, al
  6418 00002B10 0F844800                 je .docall1340
  6419 00002B14 E85BEC                   call checkreg
  6420 00002B17 8946F8                   mov [bp-8], ax
  6421                                  
  6422                                  ;-761         if (n0) t0=5;
  6423                                  
  6424 00002B1A 8B46F8                   mov ax, [bp-8]
  6425 00002B1D 08C0                     or  al, al
  6426 00002B1F 0F840900                 je .docall1341
  6427 00002B23 B80500                   mov ax, 5
  6428 00002B26 8946FA                   mov [bp-6], ax
  6429                                  
  6430                                  ;-762         else {t0=4; n0=searchname();
  6431                                  
  6432 00002B29 E93000                   jmp .docall1342
  6433                                  .docall1341:
  6434 00002B2C B80400                   mov ax, 4
  6435 00002B2F 8946FA                   mov [bp-6], ax
  6436 00002B32 E810E6                   call searchname
  6437 00002B35 8946F8                   mov [bp-8], ax
  6438                                  
  6439                                  ;-763           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }
  6440                                  
  6441 00002B38 B8EC6E                   mov ax, GType
  6442 00002B3B A3[4B00]                 mov word [p1], ax
  6443 00002B3E A1[4B00]                 mov ax, [p1]
  6444 00002B41 0346F8                   add ax, [bp-8]
  6445 00002B44 A3[4B00]                 mov word [p1], ax
  6446 00002B47 8B1E[4B00]               mov bx, [p1]
  6447 00002B4B 8A07                     mov al, [bx]
  6448 00002B4D B400                     mov ah, 0
  6449 00002B4F 83F826                   cmp ax, 38
  6450 00002B52 0F850600                 jne .docall1343
  6451 00002B56 B80300                   mov ax, 3
  6452 00002B59 8946FA                   mov [bp-6], ax
  6453                                  .docall1343:
  6454                                  .docall1342:
  6455                                  
  6456                                  ;-764       if (t0==0) error1("parameter not recognized (no * allowed)");
  6457                                  
  6458                                  .docall1340:
  6459 00002B5C 8B46FA                   mov ax, [bp-6]
  6460 00002B5F 83F800                   cmp ax, 0
  6461 00002B62 0F850900                 jne .docall1344
  6462 00002B66 68[182D]                 push docall1_4
  6463 00002B69 E89BDA                   call error1
  6464 00002B6C 83C402                   add  sp, 2
  6465                                  
  6466                                  ;-765       docalltype [narg] = t0;
  6467                                  
  6468                                  .docall1344:
  6469 00002B6F 8B46FA                   mov ax, [bp-6]
  6470 00002B72 8B5EFC                   mov bx, [bp-4]
  6471 00002B75 D1E3                     shl bx, 1
  6472 00002B77 89875DDE                 mov [docalltype+bx], ax
  6473                                  
  6474                                  ;-766       docallvalue[narg] = n0;
  6475                                  
  6476 00002B7B 8B46F8                   mov ax, [bp-8]
  6477 00002B7E 8B5EFC                   mov bx, [bp-4]
  6478 00002B81 D1E3                     shl bx, 1
  6479 00002B83 898771DE                 mov [docallvalue+bx], ax
  6480                                  
  6481                                  ;-767     } while (istoken(','));
  6482                                  
  6483 00002B87 6A2C                     push 44
  6484 00002B89 E81DE4                   call istoken
  6485 00002B8C 83C402                   add  sp, 2
  6486 00002B8F 08C0                     or  al, al
  6487 00002B91 0F840300                 je .docall1345
  6488 00002B95 E9A7FE                   jmp .docall1335
  6489                                  .docall1345:
  6490                                  
  6491                                  ;-768 
  6492                                  
  6493                                  
  6494                                  ;-769   	expect(')');  i=narg;
  6495                                  
  6496 00002B98 6A29                     push 41
  6497 00002B9A E82EE4                   call expect
  6498 00002B9D 83C402                   add  sp, 2
  6499 00002BA0 8B46FC                   mov ax, [bp-4]
  6500 00002BA3 8946FE                   mov [bp-2], ax
  6501                                  
  6502                                  ;-770     do {
  6503                                  
  6504                                  .docall1346:
  6505                                  
  6506                                  ;-771       t0 = docalltype [i];
  6507                                  
  6508 00002BA6 8B5EFE                   mov bx, [bp-2]
  6509 00002BA9 D1E3                     shl bx, 1
  6510 00002BAB 8B875DDE                 mov ax, [docalltype + bx]
  6511 00002BAF 8946FA                   mov [bp-6], ax
  6512                                  
  6513                                  ;-772       n0 = docallvalue[i];
  6514                                  
  6515 00002BB2 8B5EFE                   mov bx, [bp-2]
  6516 00002BB5 D1E3                     shl bx, 1
  6517 00002BB7 8B8771DE                 mov ax, [docallvalue + bx]
  6518 00002BBB 8946F8                   mov [bp-8], ax
  6519                                  
  6520                                  ;-773       if(t0==1){ prs("\n push "); prunsign1(n0);}
  6521                                  
  6522 00002BBE 8B46FA                   mov ax, [bp-6]
  6523 00002BC1 83F801                   cmp ax, 1
  6524 00002BC4 0F851200                 jne .docall1347
  6525 00002BC8 68[402D]                 push docall1_5
  6526 00002BCB E818D8                   call prs
  6527 00002BCE 83C402                   add  sp, 2
  6528 00002BD1 FF76F8                   push word [bp-8]
  6529 00002BD4 E872D9                   call prunsign1
  6530 00002BD7 83C402                   add  sp, 2
  6531                                  
  6532                                  ;-774       if(t0==2){ prs("\n push ");
  6533                                  
  6534                                  .docall1347:
  6535 00002BDA 8B46FA                   mov ax, [bp-6]
  6536 00002BDD 83F802                   cmp ax, 2
  6537 00002BE0 0F852500                 jne .docall1348
  6538 00002BE4 68[492D]                 push docall1_6
  6539 00002BE7 E8FCD7                   call prs
  6540 00002BEA 83C402                   add  sp, 2
  6541                                  
  6542                                  ;-775         prs(fname);prc(95);prunsign1(n0);}
  6543                                  
  6544 00002BED 8D06236E                 lea  ax, [fname]
  6545 00002BF1 50                       push ax
  6546 00002BF2 E8F1D7                   call prs
  6547 00002BF5 83C402                   add  sp, 2
  6548 00002BF8 6A5F                     push 95
  6549 00002BFA E890D7                   call prc
  6550 00002BFD 83C402                   add  sp, 2
  6551 00002C00 FF76F8                   push word [bp-8]
  6552 00002C03 E843D9                   call prunsign1
  6553 00002C06 83C402                   add  sp, 2
  6554                                  
  6555                                  ;-776       if(t0==3){ prs("\n lea  ax, ");   v(n0);
  6556                                  
  6557                                  .docall1348:
  6558 00002C09 8B46FA                   mov ax, [bp-6]
  6559 00002C0C 83F803                   cmp ax, 3
  6560 00002C0F 0F851B00                 jne .docall1349
  6561 00002C13 68[522D]                 push docall1_7
  6562 00002C16 E8CDD7                   call prs
  6563 00002C19 83C402                   add  sp, 2
  6564 00002C1C FF76F8                   push word [bp-8]
  6565 00002C1F E820E4                   call v
  6566 00002C22 83C402                   add  sp, 2
  6567                                  
  6568                                  ;-777         prs("\n push ax");}
  6569                                  
  6570 00002C25 68[5F2D]                 push docall1_8
  6571 00002C28 E8BBD7                   call prs
  6572 00002C2B 83C402                   add  sp, 2
  6573                                  
  6574                                  ;-778       if(t0==4){ gettypes(n0);
  6575                                  
  6576                                  .docall1349:
  6577 00002C2E 8B46FA                   mov ax, [bp-6]
  6578 00002C31 83F804                   cmp ax, 4
  6579 00002C34 0F854300                 jne .docall1350
  6580 00002C38 FF76F8                   push word [bp-8]
  6581 00002C3B E853E6                   call gettypes
  6582 00002C3E 83C402                   add  sp, 2
  6583                                  
  6584                                  ;-779         if(wi==2) { prs("\n push word "); v(n0);}
  6585                                  
  6586 00002C41 A1[3700]                 mov ax, [wi]
  6587 00002C44 83F802                   cmp ax, 2
  6588 00002C47 0F851500                 jne .docall1351
  6589 00002C4B 68[6A2D]                 push docall1_9
  6590 00002C4E E895D7                   call prs
  6591 00002C51 83C402                   add  sp, 2
  6592 00002C54 FF76F8                   push word [bp-8]
  6593 00002C57 E8E8E3                   call v
  6594 00002C5A 83C402                   add  sp, 2
  6595                                  
  6596                                  ;-780         else { prs("\n mov al, byte ");   v(n0);
  6597                                  
  6598 00002C5D E91B00                   jmp .docall1352
  6599                                  .docall1351:
  6600 00002C60 68[782D]                 push docall1_10
  6601 00002C63 E880D7                   call prs
  6602 00002C66 83C402                   add  sp, 2
  6603 00002C69 FF76F8                   push word [bp-8]
  6604 00002C6C E8D3E3                   call v
  6605 00002C6F 83C402                   add  sp, 2
  6606                                  
  6607                                  ;-781         prs("\n mov ah, 0\n push ax"); } }
  6608                                  
  6609 00002C72 68[892D]                 push docall1_11
  6610 00002C75 E86ED7                   call prs
  6611 00002C78 83C402                   add  sp, 2
  6612                                  .docall1352:
  6613                                  
  6614                                  ;-782       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }
  6615                                  
  6616                                  .docall1350:
  6617 00002C7B 8B46FA                   mov ax, [bp-6]
  6618 00002C7E 83F805                   cmp ax, 5
  6619 00002C81 0F852200                 jne .docall1353
  6620 00002C85 68[A02D]                 push docall1_12
  6621 00002C88 E85BD7                   call prs
  6622 00002C8B 83C402                   add  sp, 2
  6623 00002C8E FF76F8                   push word [bp-8]
  6624 00002C91 E8ECEE                   call printreg
  6625 00002C94 83C402                   add  sp, 2
  6626 00002C97 8B46F8                   mov ax, [bp-8]
  6627 00002C9A 83F82F                   cmp ax, 47 ;unsigned : 1
  6628 00002C9D 0F8C0600                 jl  .docall1354
  6629 00002CA1 8B46F6                   mov ax, [bp-10]
  6630 00002CA4 83C002                   add ax, 2
  6631                                  .docall1354:
  6632                                  
  6633                                  ;-783    i--; } while (i > 0);  }
  6634                                  
  6635                                  .docall1353:
  6636 00002CA7 FF4EFE                   dec  word[bp-2]
  6637 00002CAA 8B46FE                   mov ax, [bp-2]
  6638 00002CAD 83F800                   cmp ax, 0
  6639 00002CB0 0F8E0300                 jle .docall1355
  6640 00002CB4 E9EFFE                   jmp .docall1346
  6641                                  .docall1355:
  6642                                  
  6643                                  ;-784 	 prs("\n call "); prs(&procname);
  6644                                  
  6645                                  .docall1334:
  6646 00002CB7 68[A92D]                 push docall1_13
  6647 00002CBA E829D7                   call prs
  6648 00002CBD 83C402                   add  sp, 2
  6649 00002CC0 8D0685DE                 lea  ax, [procname]
  6650 00002CC4 50                       push ax
  6651 00002CC5 E81ED7                   call prs
  6652 00002CC8 83C402                   add  sp, 2
  6653                                  
  6654                                  ;-785 	 if (narg>0) {prs("\n add  sp, ");
  6655                                  
  6656 00002CCB 8B46FC                   mov ax, [bp-4]
  6657 00002CCE 83F800                   cmp ax, 0
  6658 00002CD1 0F8E2400                 jle .docall1356
  6659 00002CD5 68[B22D]                 push docall1_14
  6660 00002CD8 E80BD7                   call prs
  6661 00002CDB 83C402                   add  sp, 2
  6662                                  
  6663                                  ;-786      narg=narg+narg; narg=narg+sz32; prunsign1(narg); }
  6664                                  
  6665 00002CDE 8B46FC                   mov ax, [bp-4]
  6666 00002CE1 0346FC                   add ax, [bp-4]
  6667 00002CE4 8946FC                   mov [bp-4], ax
  6668 00002CE7 8B46FC                   mov ax, [bp-4]
  6669 00002CEA 0346F6                   add ax, [bp-10]
  6670 00002CED 8946FC                   mov [bp-4], ax
  6671 00002CF0 FF76FC                   push word [bp-4]
  6672 00002CF3 E853D8                   call prunsign1
  6673 00002CF6 83C402                   add  sp, 2
  6674                                  
  6675                                  ;-787  }
  6676                                  
  6677                                  .docall1356:
  6678                                  
  6679                                  ;-788 
  6680                                  
  6681                                  
  6682                                  ;-789  int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
  6683 00002CF9 C9                       LEAVE
  6684 00002CFA C3                       ret
  6685 00002CFB 4D61782E2039207061-     docall1_0 db "Max. 9 parameters",0
  6686 00002D04 72616D657465727300 
  6687 00002D0D 5C6E00                  docall1_1 db "\n",0
  6688 00002D10 2064622000              docall1_2 db " db ",0
  6689 00002D15 2C3000                  docall1_3 db ",0",0
  6690 00002D18 706172616D65746572-     docall1_4 db "parameter not recognized (no * allowed)",0
  6691 00002D21 206E6F74207265636F-
  6692 00002D2A 676E697A656420286E-
  6693 00002D33 6F202A20616C6C6F77-
  6694 00002D3C 65642900           
  6695 00002D40 5C6E20707573682000      docall1_5 db "\n push ",0
  6696 00002D49 5C6E20707573682000      docall1_6 db "\n push ",0
  6697 00002D52 5C6E206C6561202061-     docall1_7 db "\n lea  ax, ",0
  6698 00002D5B 782C2000           
  6699 00002D5F 5C6E20707573682061-     docall1_8 db "\n push ax",0
  6700 00002D68 7800               
  6701 00002D6A 5C6E20707573682077-     docall1_9 db "\n push word ",0
  6702 00002D73 6F72642000         
  6703 00002D78 5C6E206D6F7620616C-     docall1_10 db "\n mov al, byte ",0
  6704 00002D81 2C20627974652000   
  6705 00002D89 5C6E206D6F76206168-     docall1_11 db "\n mov ah, 0\n push ax",0
  6706 00002D92 2C20305C6E20707573-
  6707 00002D9B 6820617800         
  6708 00002DA0 5C6E20707573682000      docall1_12 db "\n push ",0
  6709 00002DA9 5C6E2063616C6C2000      docall1_13 db "\n call ",0
  6710 00002DB2 5C6E20616464202073-     docall1_14 db "\n add  sp, ",0
  6711 00002DBB 702C2000           
  6712                                  ENDP
  6713 00002DBF 0000                    evalue dw 0
  6714 00002DC1 0A00                    exprtype dw 10
  6715                                  
  6716                                  ;-790  int expr(int isRight)
  6717                                  
  6718                                  
  6719                                  expr: PROC
  6720                                  
  6721                                  ;-791  { int mode; int id1;     int ixarr; int ixconst;
  6722                                  
  6723                                  
  6724                                  ;-792    int ids;  int isCONST; int i;     unsigned char *p;
  6725                                  
  6726                                  
  6727                                  ;-793    if (istoken(T_CONST)) { evalue=lexval;
  6728                                  ;
  6729 00002DC3 C8100000                 ENTER  16,0
  6730 00002DC7 680101                   push 257
  6731 00002DCA E8DCE1                   call istoken
  6732 00002DCD 83C402                   add  sp, 2
  6733 00002DD0 08C0                     or  al, al
  6734 00002DD2 0F841F00                 je .expr357
  6735 00002DD6 A1[2C00]                 mov ax, [lexval]
  6736 00002DD9 A3[BF2D]                 mov word [evalue], ax
  6737                                  
  6738                                  ;-794      prs("\n mov ax, "); prunsign1(lexval); return 4; }
  6739                                  
  6740 00002DDC 68[6331]                 push expr_0
  6741 00002DDF E804D6                   call prs
  6742 00002DE2 83C402                   add  sp, 2
  6743 00002DE5 FF36[2C00]               push word [lexval]
  6744 00002DE9 E85DD7                   call prunsign1
  6745 00002DEC 83C402                   add  sp, 2
  6746 00002DEF B80400                   mov ax, 4
  6747 00002DF2 E96C03                   jmp .retnexpr
  6748                                  
  6749                                  ;-795    mode=typeName(); /*0=V,1=*,2=&*/
  6750                                  
  6751                                  .expr357:
  6752 00002DF5 E8C0E3                   call typeName
  6753 00002DF8 8946FE                   mov [bp-2], ax
  6754                                  
  6755                                  ;-796    ireg1=checkreg();
  6756                                  
  6757 00002DFB E874E9                   call checkreg
  6758 00002DFE A3[5200]                 mov word [ireg1], ax
  6759                                  
  6760                                  ;-797    if (ireg1) { doreg1(0); return; }
  6761                                  
  6762 00002E01 A1[5200]                 mov ax, [ireg1]
  6763 00002E04 08C0                     or  al, al
  6764 00002E06 0F840B00                 je .expr358
  6765 00002E0A 6A00                     push 0
  6766 00002E0C E8DDEE                   call doreg1
  6767 00002E0F 83C402                   add  sp, 2
  6768 00002E12 E94C03                   jmp .retnexpr
  6769                                  
  6770                                  ;-798    if (token=='(')  {docall1(); goto e1; }
  6771                                  
  6772                                  .expr358:
  6773 00002E15 A1[1E00]                 mov ax, [token]
  6774 00002E18 83F828                   cmp ax, 40
  6775 00002E1B 0F850600                 jne .expr359
  6776 00002E1F E8E0FB                   call docall1
  6777 00002E22 E93202                   jmp .e1
  6778                                  
  6779                                  ;-799    if (isreg()) goto e1;
  6780                                  
  6781                                  .expr359:
  6782 00002E25 E8CBF4                   call isreg
  6783 00002E28 08C0                     or  al, al
  6784 00002E2A 0F840300                 je .expr360
  6785 00002E2E E92602                   jmp .e1
  6786                                  
  6787                                  ;-800 
  6788                                  
  6789                                  
  6790                                  ;-801    id1=searchname(); gettypes(id1); ids=signi;
  6791                                  
  6792                                  .expr360:
  6793 00002E31 E811E3                   call searchname
  6794 00002E34 8946FC                   mov [bp-4], ax
  6795 00002E37 FF76FC                   push word [bp-4]
  6796 00002E3A E854E4                   call gettypes
  6797 00002E3D 83C402                   add  sp, 2
  6798 00002E40 A1[3100]                 mov ax, [signi]
  6799 00002E43 8946F6                   mov [bp-10], ax
  6800                                  
  6801                                  ;-802    ixarr=0;  ixconst=0;
  6802                                  
  6803 00002E46 B80000                   mov ax, 0
  6804 00002E49 8946FA                   mov [bp-6], ax
  6805 00002E4C B80000                   mov ax, 0
  6806 00002E4F 8946F8                   mov [bp-8], ax
  6807                                  
  6808                                  ;-803      if (istoken('[')) { if (istoken(T_CONST)) {
  6809                                  
  6810 00002E52 6A5B                     push 91
  6811 00002E54 E852E1                   call istoken
  6812 00002E57 83C402                   add  sp, 2
  6813 00002E5A 08C0                     or  al, al
  6814 00002E5C 0F845900                 je .expr361
  6815 00002E60 680101                   push 257
  6816 00002E63 E843E1                   call istoken
  6817 00002E66 83C402                   add  sp, 2
  6818 00002E69 08C0                     or  al, al
  6819 00002E6B 0F841700                 je .expr362
  6820                                  
  6821                                  ;-804        ixconst=1; ixarr=lexval; expect(']');  }
  6822                                  
  6823 00002E6F B80100                   mov ax, 1
  6824 00002E72 8946F8                   mov [bp-8], ax
  6825 00002E75 A1[2C00]                 mov ax, [lexval]
  6826 00002E78 8946FA                   mov [bp-6], ax
  6827 00002E7B 6A5D                     push 93
  6828 00002E7D E84BE1                   call expect
  6829 00002E80 83C402                   add  sp, 2
  6830                                  
  6831                                  ;-805      else {ixarr=searchname(); expect(T_NAME); expect(']');
  6832                                  
  6833 00002E83 E93300                   jmp .expr363
  6834                                  .expr362:
  6835 00002E86 E8BCE2                   call searchname
  6836 00002E89 8946FA                   mov [bp-6], ax
  6837 00002E8C 680001                   push 256
  6838 00002E8F E839E1                   call expect
  6839 00002E92 83C402                   add  sp, 2
  6840 00002E95 6A5D                     push 93
  6841 00002E97 E831E1                   call expect
  6842 00002E9A 83C402                   add  sp, 2
  6843                                  
  6844                                  ;-806      gettypes(ixarr);
  6845                                  
  6846 00002E9D FF76FA                   push word [bp-6]
  6847 00002EA0 E8EEE3                   call gettypes
  6848 00002EA3 83C402                   add  sp, 2
  6849                                  
  6850                                  ;-807      if (widthi != 2) error1("Array index must be number or int"); } }
  6851                                  
  6852 00002EA6 A1[3400]                 mov ax, [widthi]
  6853 00002EA9 83F802                   cmp ax, 2
  6854 00002EAC 0F840900                 je  .expr364
  6855 00002EB0 68[6F31]                 push expr_1
  6856 00002EB3 E851D7                   call error1
  6857 00002EB6 83C402                   add  sp, 2
  6858                                  .expr364:
  6859                                  .expr363:
  6860                                  
  6861                                  ;-808    if (istoken(T_PLUSPLUS  )) {if(mode)error1("Only var allowed");
  6862                                  
  6863                                  .expr361:
  6864 00002EB9 68C304                   push 1219
  6865 00002EBC E8EAE0                   call istoken
  6866 00002EBF 83C402                   add  sp, 2
  6867 00002EC2 08C0                     or  al, al
  6868 00002EC4 0F844600                 je .expr365
  6869 00002EC8 8B46FE                   mov ax, [bp-2]
  6870 00002ECB 08C0                     or  al, al
  6871 00002ECD 0F840900                 je .expr366
  6872 00002ED1 68[9131]                 push expr_2
  6873 00002ED4 E830D7                   call error1
  6874 00002ED7 83C402                   add  sp, 2
  6875                                  
  6876                                  ;-809       prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");
  6877                                  
  6878                                  .expr366:
  6879 00002EDA 68[A231]                 push expr_3
  6880 00002EDD E806D5                   call prs
  6881 00002EE0 83C402                   add  sp, 2
  6882 00002EE3 A1[3700]                 mov ax, [wi]
  6883 00002EE6 83F802                   cmp ax, 2
  6884 00002EE9 0F850C00                 jne .expr367
  6885 00002EED 68[AB31]                 push expr_4
  6886 00002EF0 E8F3D4                   call prs
  6887 00002EF3 83C402                   add  sp, 2
  6888 00002EF6 E90900                   jmp .expr368
  6889                                  .expr367:
  6890 00002EF9 68[B031]                 push expr_5
  6891 00002EFC E8E7D4                   call prs
  6892 00002EFF 83C402                   add  sp, 2
  6893                                  
  6894                                  ;-810       v(id1); goto e1;}
  6895                                  
  6896                                  .expr368:
  6897 00002F02 FF76FC                   push word [bp-4]
  6898 00002F05 E83AE1                   call v
  6899 00002F08 83C402                   add  sp, 2
  6900 00002F0B E94901                   jmp .e1
  6901                                  
  6902                                  ;-811    if (istoken(T_MINUSMINUS)) {if(mode)error1("Only var allowed");
  6903                                  
  6904                                  .expr365:
  6905 00002F0E 68C904                   push 1225
  6906 00002F11 E895E0                   call istoken
  6907 00002F14 83C402                   add  sp, 2
  6908 00002F17 08C0                     or  al, al
  6909 00002F19 0F844600                 je .expr369
  6910 00002F1D 8B46FE                   mov ax, [bp-2]
  6911 00002F20 08C0                     or  al, al
  6912 00002F22 0F840900                 je .expr370
  6913 00002F26 68[B531]                 push expr_6
  6914 00002F29 E8DBD6                   call error1
  6915 00002F2C 83C402                   add  sp, 2
  6916                                  
  6917                                  ;-812       prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");
  6918                                  
  6919                                  .expr370:
  6920 00002F2F 68[C631]                 push expr_7
  6921 00002F32 E8B1D4                   call prs
  6922 00002F35 83C402                   add  sp, 2
  6923 00002F38 A1[3700]                 mov ax, [wi]
  6924 00002F3B 83F802                   cmp ax, 2
  6925 00002F3E 0F850C00                 jne .expr371
  6926 00002F42 68[CF31]                 push expr_8
  6927 00002F45 E89ED4                   call prs
  6928 00002F48 83C402                   add  sp, 2
  6929 00002F4B E90900                   jmp .expr372
  6930                                  .expr371:
  6931 00002F4E 68[D431]                 push expr_9
  6932 00002F51 E892D4                   call prs
  6933 00002F54 83C402                   add  sp, 2
  6934                                  
  6935                                  ;-813       v(id1); goto e1;}
  6936                                  
  6937                                  .expr372:
  6938 00002F57 FF76FC                   push word [bp-4]
  6939 00002F5A E8E5E0                   call v
  6940 00002F5D 83C402                   add  sp, 2
  6941 00002F60 E9F400                   jmp .e1
  6942                                  
  6943                                  ;-814 
  6944                                  
  6945                                  
  6946                                  ;-815    if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}
  6947                                  
  6948                                  .expr369:
  6949 00002F63 68CE04                   push 1230
  6950 00002F66 E840E0                   call istoken
  6951 00002F69 83C402                   add  sp, 2
  6952 00002F6C 08C0                     or  al, al
  6953 00002F6E 0F841200                 je .expr373
  6954 00002F72 FF76FC                   push word [bp-4]
  6955 00002F75 FF76FE                   push word [bp-2]
  6956 00002F78 68[D931]                 push expr_10
  6957 00002F7B E85AEF                   call compoundass
  6958 00002F7E 83C406                   add  sp, 6
  6959 00002F81 E9D300                   jmp .e1
  6960                                  
  6961                                  ;-816    if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}
  6962                                  
  6963                                  .expr373:
  6964 00002F84 68CF04                   push 1231
  6965 00002F87 E81FE0                   call istoken
  6966 00002F8A 83C402                   add  sp, 2
  6967 00002F8D 08C0                     or  al, al
  6968 00002F8F 0F841200                 je .expr374
  6969 00002F93 FF76FC                   push word [bp-4]
  6970 00002F96 FF76FE                   push word [bp-2]
  6971 00002F99 68[DD31]                 push expr_11
  6972 00002F9C E839EF                   call compoundass
  6973 00002F9F 83C406                   add  sp, 6
  6974 00002FA2 E9B200                   jmp .e1
  6975                                  
  6976                                  ;-817    if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}
  6977                                  
  6978                                  .expr374:
  6979 00002FA5 68D204                   push 1234
  6980 00002FA8 E8FEDF                   call istoken
  6981 00002FAB 83C402                   add  sp, 2
  6982 00002FAE 08C0                     or  al, al
  6983 00002FB0 0F841200                 je .expr375
  6984 00002FB4 FF76FC                   push word [bp-4]
  6985 00002FB7 FF76FE                   push word [bp-2]
  6986 00002FBA 68[E131]                 push expr_12
  6987 00002FBD E818EF                   call compoundass
  6988 00002FC0 83C406                   add  sp, 6
  6989 00002FC3 E99100                   jmp .e1
  6990                                  
  6991                                  ;-818    if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}
  6992                                  
  6993                                  .expr375:
  6994 00002FC6 68D304                   push 1235
  6995 00002FC9 E8DDDF                   call istoken
  6996 00002FCC 83C402                   add  sp, 2
  6997 00002FCF 08C0                     or  al, al
  6998 00002FD1 0F841200                 je .expr376
  6999 00002FD5 FF76FC                   push word [bp-4]
  7000 00002FD8 FF76FE                   push word [bp-2]
  7001 00002FDB 68[E531]                 push expr_13
  7002 00002FDE E8F7EE                   call compoundass
  7003 00002FE1 83C406                   add  sp, 6
  7004 00002FE4 E97000                   jmp .e1
  7005                                  
  7006                                  ;-819    if (istoken(T_MULASS    )) {error1("not implemented");}
  7007                                  
  7008                                  .expr376:
  7009 00002FE7 68D004                   push 1232
  7010 00002FEA E8BCDF                   call istoken
  7011 00002FED 83C402                   add  sp, 2
  7012 00002FF0 08C0                     or  al, al
  7013 00002FF2 0F840900                 je .expr377
  7014 00002FF6 68[E831]                 push expr_14
  7015 00002FF9 E80BD6                   call error1
  7016 00002FFC 83C402                   add  sp, 2
  7017                                  
  7018                                  ;-820    if (istoken(T_DIVASS    )) {error1("not implemented");}
  7019                                  
  7020                                  .expr377:
  7021 00002FFF 68D104                   push 1233
  7022 00003002 E8A4DF                   call istoken
  7023 00003005 83C402                   add  sp, 2
  7024 00003008 08C0                     or  al, al
  7025 0000300A 0F840900                 je .expr378
  7026 0000300E 68[F831]                 push expr_15
  7027 00003011 E8F3D5                   call error1
  7028 00003014 83C402                   add  sp, 2
  7029                                  
  7030                                  ;-821 
  7031                                  
  7032                                  
  7033                                  ;-822    if (istoken('=')) { exprtype= expr(1);
  7034                                  
  7035                                  .expr378:
  7036 00003017 6A3D                     push 61
  7037 00003019 E88DDF                   call istoken
  7038 0000301C 83C402                   add  sp, 2
  7039 0000301F 08C0                     or  al, al
  7040 00003021 0F842000                 je .expr379
  7041 00003025 6A01                     push 1
  7042 00003027 E899FD                   call expr
  7043 0000302A 83C402                   add  sp, 2
  7044 0000302D A3[C12D]                 mov word [exprtype], ax
  7045                                  
  7046                                  ;-823    doassign(mode, id1, ixarr, ixconst); goto e1;  }
  7047                                  
  7048 00003030 FF76F8                   push word [bp-8]
  7049 00003033 FF76FA                   push word [bp-6]
  7050 00003036 FF76FC                   push word [bp-4]
  7051 00003039 FF76FE                   push word [bp-2]
  7052 0000303C E810F5                   call doassign
  7053 0000303F 83C408                   add  sp, 8
  7054 00003042 E91200                   jmp .e1
  7055                                  
  7056                                  ;-824    dovar1(mode, "mov", ixarr, id1);
  7057                                  
  7058                                  .expr379:
  7059 00003045 FF76FC                   push word [bp-4]
  7060 00003048 FF76FA                   push word [bp-6]
  7061 0000304B 68[0832]                 push expr_16
  7062 0000304E FF76FE                   push word [bp-2]
  7063 00003051 E826EF                   call dovar1
  7064 00003054 83C408                   add  sp, 8
  7065                                  
  7066                                  ;-825 
  7067                                  
  7068                                  
  7069                                  ;-826  e1:    if (istoken('+')) rterm("add");
  7070                                  
  7071                                  .e1:
  7072 00003057 6A2B                     push 43
  7073 00003059 E84DDF                   call istoken
  7074 0000305C 83C402                   add  sp, 2
  7075 0000305F 08C0                     or  al, al
  7076 00003061 0F840C00                 je .expr380
  7077 00003065 68[0C32]                 push expr_17
  7078 00003068 E8D9F0                   call rterm
  7079 0000306B 83C402                   add  sp, 2
  7080                                  
  7081                                  ;-827    else if (istoken('-')) rterm("sub" );
  7082                                  
  7083 0000306E E9CF00                   jmp .expr381
  7084                                  .expr380:
  7085 00003071 6A2D                     push 45
  7086 00003073 E833DF                   call istoken
  7087 00003076 83C402                   add  sp, 2
  7088 00003079 08C0                     or  al, al
  7089 0000307B 0F840C00                 je .expr382
  7090 0000307F 68[1032]                 push expr_18
  7091 00003082 E8BFF0                   call rterm
  7092 00003085 83C402                   add  sp, 2
  7093                                  
  7094                                  ;-828    else if (istoken('&')) rterm("and" );
  7095                                  
  7096 00003088 E9B500                   jmp .expr383
  7097                                  .expr382:
  7098 0000308B 6A26                     push 38
  7099 0000308D E819DF                   call istoken
  7100 00003090 83C402                   add  sp, 2
  7101 00003093 08C0                     or  al, al
  7102 00003095 0F840C00                 je .expr384
  7103 00003099 68[1432]                 push expr_19
  7104 0000309C E8A5F0                   call rterm
  7105 0000309F 83C402                   add  sp, 2
  7106                                  
  7107                                  ;-829    else if (istoken('|')) rterm("or" );
  7108                                  
  7109 000030A2 E99B00                   jmp .expr385
  7110                                  .expr384:
  7111 000030A5 6A7C                     push 124
  7112 000030A7 E8FFDE                   call istoken
  7113 000030AA 83C402                   add  sp, 2
  7114 000030AD 08C0                     or  al, al
  7115 000030AF 0F840C00                 je .expr386
  7116 000030B3 68[1832]                 push expr_20
  7117 000030B6 E88BF0                   call rterm
  7118 000030B9 83C402                   add  sp, 2
  7119                                  
  7120                                  ;-830    else if (istoken(T_LESSLESS)) rterm("shl");
  7121                                  
  7122 000030BC E98100                   jmp .expr387
  7123                                  .expr386:
  7124 000030BF 68D804                   push 1240
  7125 000030C2 E8E4DE                   call istoken
  7126 000030C5 83C402                   add  sp, 2
  7127 000030C8 08C0                     or  al, al
  7128 000030CA 0F840C00                 je .expr388
  7129 000030CE 68[1B32]                 push expr_21
  7130 000030D1 E870F0                   call rterm
  7131 000030D4 83C402                   add  sp, 2
  7132                                  
  7133                                  ;-831    else if (istoken(T_GREATGREAT)) rterm("shr");
  7134                                  
  7135 000030D7 E96600                   jmp .expr389
  7136                                  .expr388:
  7137 000030DA 68D904                   push 1241
  7138 000030DD E8C9DE                   call istoken
  7139 000030E0 83C402                   add  sp, 2
  7140 000030E3 08C0                     or  al, al
  7141 000030E5 0F840C00                 je .expr390
  7142 000030E9 68[1F32]                 push expr_22
  7143 000030EC E855F0                   call rterm
  7144 000030EF 83C402                   add  sp, 2
  7145                                  
  7146                                  ;-832    else if (istoken('*')) domul (ids);
  7147                                  
  7148 000030F2 E94B00                   jmp .expr391
  7149                                  .expr390:
  7150 000030F5 6A2A                     push 42
  7151 000030F7 E8AFDE                   call istoken
  7152 000030FA 83C402                   add  sp, 2
  7153 000030FD 08C0                     or  al, al
  7154 000030FF 0F840C00                 je .expr392
  7155 00003103 FF76F6                   push word [bp-10]
  7156 00003106 E88FF6                   call domul
  7157 00003109 83C402                   add  sp, 2
  7158                                  
  7159                                  ;-833    else if (istoken('/')) doidiv(ids);
  7160                                  
  7161 0000310C E93100                   jmp .expr393
  7162                                  .expr392:
  7163 0000310F 6A2F                     push 47
  7164 00003111 E895DE                   call istoken
  7165 00003114 83C402                   add  sp, 2
  7166 00003117 08C0                     or  al, al
  7167 00003119 0F840C00                 je .expr394
  7168 0000311D FF76F6                   push word [bp-10]
  7169 00003120 E816F7                   call doidiv
  7170 00003123 83C402                   add  sp, 2
  7171                                  
  7172                                  ;-834    else if (istoken('%')) domod (ids);
  7173                                  
  7174 00003126 E91700                   jmp .expr395
  7175                                  .expr394:
  7176 00003129 6A25                     push 37
  7177 0000312B E87BDE                   call istoken
  7178 0000312E 83C402                   add  sp, 2
  7179 00003131 08C0                     or  al, al
  7180 00003133 0F840900                 je .expr396
  7181 00003137 FF76F6                   push word [bp-10]
  7182 0000313A E89FF8                   call domod
  7183 0000313D 83C402                   add  sp, 2
  7184                                  
  7185                                  ;-835    if (isrelational()) { rterm("cmp"); cmpneg(ids);}
  7186                                  
  7187                                  .expr396:
  7188                                  .expr395:
  7189                                  .expr393:
  7190                                  .expr391:
  7191                                  .expr389:
  7192                                  .expr387:
  7193                                  .expr385:
  7194                                  .expr383:
  7195                                  .expr381:
  7196 00003140 E8C8E5                   call isrelational
  7197 00003143 08C0                     or  al, al
  7198 00003145 0F841200                 je .expr397
  7199 00003149 68[2332]                 push expr_23
  7200 0000314C E8F5EF                   call rterm
  7201 0000314F 83C402                   add  sp, 2
  7202 00003152 FF76F6                   push word [bp-10]
  7203 00003155 E843E4                   call cmpneg
  7204 00003158 83C402                   add  sp, 2
  7205                                  
  7206                                  ;-836    return 0;
  7207                                  
  7208                                  .expr397:
  7209 0000315B B80000                   mov ax, 0
  7210 0000315E E90000                   jmp .retnexpr
  7211                                  
  7212                                  ;-837  }
  7213                                  
  7214                                  
  7215                                  ;-838 
  7216                                  
  7217                                  
  7218                                  ;-839  int pexpr() {expect('('); iscmp=0;
  7219                                  
  7220 00003161 C9                       .retnexpr: LEAVE
  7221 00003162 C3                       ret
  7222 00003163 5C6E206D6F76206178-     expr_0 db "\n mov ax, ",0
  7223 0000316C 2C2000             
  7224 0000316F 417272617920696E64-     expr_1 db "Array index must be number or int",0
  7225 00003178 6578206D7573742062-
  7226 00003181 65206E756D62657220-
  7227 0000318A 6F7220696E7400     
  7228 00003191 4F6E6C792076617220-     expr_2 db "Only var allowed",0
  7229 0000319A 616C6C6F77656400   
  7230 000031A2 5C6E20696E63202000      expr_3 db "\n inc  ",0
  7231 000031AB 776F726400              expr_4 db "word",0
  7232 000031B0 6279746500              expr_5 db "byte",0
  7233 000031B5 4F6E6C792076617220-     expr_6 db "Only var allowed",0
  7234 000031BE 616C6C6F77656400   
  7235 000031C6 5C6E20646563202000      expr_7 db "\n dec  ",0
  7236 000031CF 776F726400              expr_8 db "word",0
  7237 000031D4 6279746500              expr_9 db "byte",0
  7238 000031D9 61646400                expr_10 db "add",0
  7239 000031DD 73756200                expr_11 db "sub",0
  7240 000031E1 616E6400                expr_12 db "and",0
  7241 000031E5 6F7200                  expr_13 db "or",0
  7242 000031E8 6E6F7420696D706C65-     expr_14 db "not implemented",0
  7243 000031F1 6D656E74656400     
  7244 000031F8 6E6F7420696D706C65-     expr_15 db "not implemented",0
  7245 00003201 6D656E74656400     
  7246 00003208 6D6F7600                expr_16 db "mov",0
  7247 0000320C 61646400                expr_17 db "add",0
  7248 00003210 73756200                expr_18 db "sub",0
  7249 00003214 616E6400                expr_19 db "and",0
  7250 00003218 6F7200                  expr_20 db "or",0
  7251 0000321B 73686C00                expr_21 db "shl",0
  7252 0000321F 73687200                expr_22 db "shr",0
  7253 00003223 636D7000                expr_23 db "cmp",0
  7254                                  ENDP
  7255                                  
  7256                                  pexpr: PROC
  7257 00003227 6A28                     push 40
  7258 00003229 E89FDD                   call expect
  7259 0000322C 83C402                   add  sp, 2
  7260 0000322F B80000                   mov ax, 0
  7261 00003232 A3[2400]                 mov word [iscmp], ax
  7262                                  
  7263                                  ;-840    if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}
  7264                                  
  7265 00003235 A1[1E00]                 mov ax, [token]
  7266 00003238 3D0001                   cmp ax, 256
  7267 0000323B 0F853400                 jne .pexpr398
  7268 0000323F 68[A232]                 push pexpr_0
  7269 00003242 8D06A36D                 lea  ax, [symbol]
  7270 00003246 50                       push ax
  7271 00003247 E81CD0                   call eqstr
  7272 0000324A 83C404                   add  sp, 4
  7273 0000324D 08C0                     or  al, al
  7274 0000324F 0F840600                 je .pexpr399
  7275 00003253 E897E9                   call constantexpr
  7276 00003256 E94800                   jmp .retnpexpr
  7277                                  
  7278                                  ;-841      ireg1=checkreg();
  7279                                  
  7280                                  .pexpr399:
  7281 00003259 E816E5                   call checkreg
  7282 0000325C A3[5200]                 mov word [ireg1], ax
  7283                                  
  7284                                  ;-842      if (ireg1) { doreg1(1); return; }  }
  7285                                  
  7286 0000325F A1[5200]                 mov ax, [ireg1]
  7287 00003262 08C0                     or  al, al
  7288 00003264 0F840B00                 je .pexpr400
  7289 00003268 6A01                     push 1
  7290 0000326A E87FEA                   call doreg1
  7291 0000326D 83C402                   add  sp, 2
  7292 00003270 E92E00                   jmp .retnpexpr
  7293                                  .pexpr400:
  7294                                  
  7295                                  ;-843    expr(0);
  7296                                  
  7297                                  .pexpr398:
  7298 00003273 6A00                     push 0
  7299 00003275 E84BFB                   call expr
  7300 00003278 83C402                   add  sp, 2
  7301                                  
  7302                                  ;-844    if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);
  7303                                  
  7304 0000327B A1[2400]                 mov ax, [iscmp]
  7305 0000327E 83F800                   cmp ax, 0
  7306 00003281 0F850900                 jne .pexpr401
  7307 00003285 68[A432]                 push pexpr_1
  7308 00003288 E85BD1                   call prs
  7309 0000328B 83C402                   add  sp, 2
  7310                                  .pexpr401:
  7311 0000328E 8D06236E                 lea  ax, [fname]
  7312 00003292 50                       push ax
  7313 00003293 E850D1                   call prs
  7314 00003296 83C402                   add  sp, 2
  7315                                  
  7316                                  ;-845    expect(')');
  7317                                  
  7318 00003299 6A29                     push 41
  7319 0000329B E82DDD                   call expect
  7320 0000329E 83C402                   add  sp, 2
  7321                                  
  7322                                  ;-846  }
  7323                                  
  7324                                  
  7325                                  ;-847 
  7326                                  
  7327                                  
  7328                                  ;-848 /***************************************************************/
  7329                                  
  7330                                  
  7331                                  ;-849 
  7332                                  
  7333                                  
  7334                                  ;-850 int prlabel(int n) {
  7335                                  
  7336                                   .retnpexpr:
  7337 000032A1 C3                       ret
  7338 000032A2 5F00                    pexpr_0 db "_",0
  7339 000032A4 5C6E206F722020616C-     pexpr_1 db "\n or  al, al\n je .",0
  7340 000032AD 2C20616C5C6E206A65-
  7341 000032B6 202E00             
  7342                                  ENDP
  7343                                  
  7344                                  prlabel: PROC
  7345                                  
  7346                                  ;-851     prs("\n.");
  7347                                  ;
  7348 000032B9 C8000000                 ENTER  0,0
  7349 000032BD 68[E432]                 push prlabel_0
  7350 000032C0 E823D1                   call prs
  7351 000032C3 83C402                   add  sp, 2
  7352                                  
  7353                                  ;-852     prs(fname);
  7354                                  
  7355 000032C6 8D06236E                 lea  ax, [fname]
  7356 000032CA 50                       push ax
  7357 000032CB E818D1                   call prs
  7358 000032CE 83C402                   add  sp, 2
  7359                                  
  7360                                  ;-853     prunsign1(n);
  7361                                  
  7362 000032D1 FF7604                   push word [bp+4]
  7363 000032D4 E872D2                   call prunsign1
  7364 000032D7 83C402                   add  sp, 2
  7365                                  
  7366                                  ;-854     prc(':');
  7367                                  
  7368 000032DA 6A3A                     push 58
  7369 000032DC E8AED0                   call prc
  7370 000032DF 83C402                   add  sp, 2
  7371                                  
  7372                                  ;-855 }
  7373                                  
  7374                                  
  7375                                  ;-856 int prjump (int n) {
  7376 000032E2 C9                       LEAVE
  7377 000032E3 C3                       ret
  7378 000032E4 5C6E2E00                prlabel_0 db "\n.",0
  7379                                  ENDP
  7380                                  
  7381                                  prjump: PROC
  7382                                  
  7383                                  ;-857     prs("\n jmp .");
  7384                                  ;
  7385 000032E8 C8000000                 ENTER  0,0
  7386 000032EC 68[0B33]                 push prjump_0
  7387 000032EF E8F4D0                   call prs
  7388 000032F2 83C402                   add  sp, 2
  7389                                  
  7390                                  ;-858     prs(fname);
  7391                                  
  7392 000032F5 8D06236E                 lea  ax, [fname]
  7393 000032F9 50                       push ax
  7394 000032FA E8E9D0                   call prs
  7395 000032FD 83C402                   add  sp, 2
  7396                                  
  7397                                  ;-859     prunsign1(n);
  7398                                  
  7399 00003300 FF7604                   push word [bp+4]
  7400 00003303 E843D2                   call prunsign1
  7401 00003306 83C402                   add  sp, 2
  7402                                  
  7403                                  ;-860 }
  7404                                  
  7405                                  
  7406                                  ;-861 
  7407                                  
  7408                                  
  7409                                  ;-862 int stmt() {
  7410 00003309 C9                       LEAVE
  7411 0000330A C3                       ret
  7412 0000330B 5C6E206A6D70202E00      prjump_0 db "\n jmp .",0
  7413                                  ENDP
  7414                                  
  7415                                  stmt: PROC
  7416                                  
  7417                                  ;-863     int c; char cha;
  7418                                  
  7419                                  
  7420                                  ;-864     int jdest; int tst; int jtemp;
  7421                                  
  7422                                  
  7423                                  ;-865        if(istoken('{'))     {while(istoken('}')==0) stmt();}
  7424                                  ;
  7425 00003314 C80A0000                 ENTER  10,0
  7426 00003318 6A7B                     push 123
  7427 0000331A E88CDC                   call istoken
  7428 0000331D 83C402                   add  sp, 2
  7429 00003320 08C0                     or  al, al
  7430 00003322 0F841700                 je .stmt402
  7431                                  .stmt403:
  7432 00003326 6A7D                     push 125
  7433 00003328 E87EDC                   call istoken
  7434 0000332B 83C402                   add  sp, 2
  7435 0000332E 83F800                   cmp ax, 0
  7436 00003331 0F850500                 jne .stmt404
  7437 00003335 E8DCFF                   call stmt
  7438 00003338 EBEC                     jmp .stmt403
  7439                                  .stmt404:
  7440                                  
  7441                                  ;-866   else if(istoken(T_IF)) {
  7442                                  
  7443 0000333A E9D002                   jmp .stmt405
  7444                                  .stmt402:
  7445 0000333D 680102                   push 513
  7446 00003340 E866DC                   call istoken
  7447 00003343 83C402                   add  sp, 2
  7448 00003346 08C0                     or  al, al
  7449 00003348 0F846500                 je .stmt406
  7450                                  
  7451                                  ;-867       int jdest; int tst;
  7452                                  
  7453 0000334C 8B46FA                   mov ax, [bp-6]
  7454 0000334F 8B46F8                   mov ax, [bp-8]
  7455                                  
  7456                                  ;-868       pexpr(); nlabel++; jdest=nlabel;
  7457                                  
  7458 00003352 E8D2FE                   call pexpr
  7459 00003355 FF06[2A00]               inc  word[nlabel]
  7460 00003359 A1[2A00]                 mov ax, [nlabel]
  7461 0000335C 8946FA                   mov [bp-6], ax
  7462                                  
  7463                                  ;-869       pint1(jdest); stmt();
  7464                                  
  7465 0000335F FF76FA                   push word [bp-6]
  7466 00003362 E886D1                   call pint1
  7467 00003365 83C402                   add  sp, 2
  7468 00003368 E8A9FF                   call stmt
  7469                                  
  7470                                  ;-870       if (istoken(T_ELSE)) { nlabel++; tst=nlabel;
  7471                                  
  7472 0000336B 680202                   push 514
  7473 0000336E E838DC                   call istoken
  7474 00003371 83C402                   add  sp, 2
  7475 00003374 08C0                     or  al, al
  7476 00003376 0F842B00                 je .stmt407
  7477 0000337A FF06[2A00]               inc  word[nlabel]
  7478 0000337E A1[2A00]                 mov ax, [nlabel]
  7479 00003381 8946F8                   mov [bp-8], ax
  7480                                  
  7481                                  ;-871           prjump(tst); prlabel(jdest); stmt(); prlabel(tst);
  7482                                  
  7483 00003384 FF76F8                   push word [bp-8]
  7484 00003387 E85EFF                   call prjump
  7485 0000338A 83C402                   add  sp, 2
  7486 0000338D FF76FA                   push word [bp-6]
  7487 00003390 E826FF                   call prlabel
  7488 00003393 83C402                   add  sp, 2
  7489 00003396 E87BFF                   call stmt
  7490 00003399 FF76F8                   push word [bp-8]
  7491 0000339C E81AFF                   call prlabel
  7492 0000339F 83C402                   add  sp, 2
  7493                                  
  7494                                  ;-872       }
  7495                                  
  7496                                  
  7497                                  ;-873       else prlabel(jdest);
  7498                                  
  7499 000033A2 E90900                   jmp .stmt408
  7500                                  .stmt407:
  7501 000033A5 FF76FA                   push word [bp-6]
  7502 000033A8 E80EFF                   call prlabel
  7503 000033AB 83C402                   add  sp, 2
  7504                                  
  7505                                  ;-874   }
  7506                                  
  7507                                  .stmt408:
  7508                                  
  7509                                  ;-875   else if(istoken(T_DO)) {
  7510                                  
  7511 000033AE E95C02                   jmp .stmt409
  7512                                  .stmt406:
  7513 000033B1 680402                   push 516
  7514 000033B4 E8F2DB                   call istoken
  7515 000033B7 83C402                   add  sp, 2
  7516 000033BA 08C0                     or  al, al
  7517 000033BC 0F844A00                 je .stmt410
  7518                                  
  7519                                  ;-876       nlabel++; jdest=nlabel; prlabel(jdest); stmt();
  7520                                  
  7521 000033C0 FF06[2A00]               inc  word[nlabel]
  7522 000033C4 A1[2A00]                 mov ax, [nlabel]
  7523 000033C7 8946FA                   mov [bp-6], ax
  7524 000033CA FF76FA                   push word [bp-6]
  7525 000033CD E8E9FE                   call prlabel
  7526 000033D0 83C402                   add  sp, 2
  7527 000033D3 E83EFF                   call stmt
  7528                                  
  7529                                  ;-877       expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);
  7530                                  
  7531 000033D6 680302                   push 515
  7532 000033D9 E8EFDB                   call expect
  7533 000033DC 83C402                   add  sp, 2
  7534 000033DF E845FE                   call pexpr
  7535 000033E2 FF06[2A00]               inc  word[nlabel]
  7536 000033E6 A1[2A00]                 mov ax, [nlabel]
  7537 000033E9 8946F6                   mov [bp-10], ax
  7538 000033EC FF76F6                   push word [bp-10]
  7539 000033EF E8F9D0                   call pint1
  7540 000033F2 83C402                   add  sp, 2
  7541                                  
  7542                                  ;-878       prjump(jdest); prlabel(jtemp);
  7543                                  
  7544 000033F5 FF76FA                   push word [bp-6]
  7545 000033F8 E8EDFE                   call prjump
  7546 000033FB 83C402                   add  sp, 2
  7547 000033FE FF76F6                   push word [bp-10]
  7548 00003401 E8B5FE                   call prlabel
  7549 00003404 83C402                   add  sp, 2
  7550                                  
  7551                                  ;-879   }
  7552                                  
  7553                                  
  7554                                  ;-880   else if(istoken(T_WHILE)) {
  7555                                  
  7556 00003407 E90302                   jmp .stmt411
  7557                                  .stmt410:
  7558 0000340A 680302                   push 515
  7559 0000340D E899DB                   call istoken
  7560 00003410 83C402                   add  sp, 2
  7561 00003413 08C0                     or  al, al
  7562 00003415 0F844100                 je .stmt412
  7563                                  
  7564                                  ;-881       nlabel++; jdest=nlabel;
  7565                                  
  7566 00003419 FF06[2A00]               inc  word[nlabel]
  7567 0000341D A1[2A00]                 mov ax, [nlabel]
  7568 00003420 8946FA                   mov [bp-6], ax
  7569                                  
  7570                                  ;-882       prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);
  7571                                  
  7572 00003423 FF76FA                   push word [bp-6]
  7573 00003426 E890FE                   call prlabel
  7574 00003429 83C402                   add  sp, 2
  7575 0000342C E8F8FD                   call pexpr
  7576 0000342F FF06[2A00]               inc  word[nlabel]
  7577 00003433 A1[2A00]                 mov ax, [nlabel]
  7578 00003436 8946F8                   mov [bp-8], ax
  7579 00003439 FF76F8                   push word [bp-8]
  7580 0000343C E8ACD0                   call pint1
  7581 0000343F 83C402                   add  sp, 2
  7582                                  
  7583                                  ;-883       stmt(); prjump(jdest); prlabel(tst);
  7584                                  
  7585 00003442 E8CFFE                   call stmt
  7586 00003445 FF76FA                   push word [bp-6]
  7587 00003448 E89DFE                   call prjump
  7588 0000344B 83C402                   add  sp, 2
  7589 0000344E FF76F8                   push word [bp-8]
  7590 00003451 E865FE                   call prlabel
  7591 00003454 83C402                   add  sp, 2
  7592                                  
  7593                                  ;-884   }
  7594                                  
  7595                                  
  7596                                  ;-885   else if(istoken(T_GOTO))  {
  7597                                  
  7598 00003457 E9B301                   jmp .stmt413
  7599                                  .stmt412:
  7600 0000345A 680902                   push 521
  7601 0000345D E849DB                   call istoken
  7602 00003460 83C402                   add  sp, 2
  7603 00003463 08C0                     or  al, al
  7604 00003465 0F842200                 je .stmt414
  7605                                  
  7606                                  ;-886       prs("\n jmp .");name1();prs(symbol);expect(';');
  7607                                  
  7608 00003469 68[0F36]                 push stmt_0
  7609 0000346C E877CF                   call prs
  7610 0000346F 83C402                   add  sp, 2
  7611 00003472 E81BDD                   call name1
  7612 00003475 8D06A36D                 lea  ax, [symbol]
  7613 00003479 50                       push ax
  7614 0000347A E869CF                   call prs
  7615 0000347D 83C402                   add  sp, 2
  7616 00003480 6A3B                     push 59
  7617 00003482 E846DB                   call expect
  7618 00003485 83C402                   add  sp, 2
  7619                                  
  7620                                  ;-887   }
  7621                                  
  7622                                  
  7623                                  ;-888   else if(token==T_ASM)     {
  7624                                  
  7625 00003488 E98201                   jmp .stmt415
  7626                                  .stmt414:
  7627 0000348B A1[1E00]                 mov ax, [token]
  7628 0000348E 3D0602                   cmp ax, 518
  7629 00003491 0F853300                 jne .stmt416
  7630                                  
  7631                                  ;-889       prs("\n"); c=next();
  7632                                  
  7633 00003495 68[1836]                 push stmt_1
  7634 00003498 E84BCF                   call prs
  7635 0000349B 83C402                   add  sp, 2
  7636 0000349E E83DD3                   call next
  7637 000034A1 8946FE                   mov [bp-2], ax
  7638                                  
  7639                                  ;-890       while(c != '\n') { prc(c);	c=next(); };
  7640                                  
  7641                                  .stmt417:
  7642 000034A4 8B46FE                   mov ax, [bp-2]
  7643 000034A7 83F80A                   cmp ax, 10
  7644 000034AA 0F841100                 je  .stmt418
  7645 000034AE FF76FE                   push word [bp-2]
  7646 000034B1 E8D9CE                   call prc
  7647 000034B4 83C402                   add  sp, 2
  7648 000034B7 E824D3                   call next
  7649 000034BA 8946FE                   mov [bp-2], ax
  7650 000034BD EBE5                     jmp .stmt417
  7651                                  .stmt418:
  7652                                  
  7653                                  ;-891       token=getlex();
  7654                                  
  7655 000034BF E868D5                   call getlex
  7656 000034C2 A3[1E00]                 mov word [token], ax
  7657                                  
  7658                                  ;-892   }
  7659                                  
  7660                                  
  7661                                  ;-893   else if(istoken(T_ASMBLOCK)) {
  7662                                  
  7663 000034C5 E94501                   jmp .stmt419
  7664                                  .stmt416:
  7665 000034C8 680702                   push 519
  7666 000034CB E8DBDA                   call istoken
  7667 000034CE 83C402                   add  sp, 2
  7668 000034D1 08C0                     or  al, al
  7669 000034D3 0F844B00                 je .stmt420
  7670                                  
  7671                                  ;-894       if (token== '{' )  {
  7672                                  
  7673 000034D7 A1[1E00]                 mov ax, [token]
  7674 000034DA 83F87B                   cmp ax, 123
  7675 000034DD 0F853500                 jne .stmt421
  7676                                  
  7677                                  ;-895           prs("\n"); cha=next();
  7678                                  
  7679 000034E1 68[1B36]                 push stmt_2
  7680 000034E4 E8FFCE                   call prs
  7681 000034E7 83C402                   add  sp, 2
  7682 000034EA E8F1D2                   call next
  7683 000034ED 8846FC                   mov [bp-4], al
  7684                                  
  7685                                  ;-896           while(cha!= '}') {
  7686                                  
  7687                                  .stmt422:
  7688 000034F0 8A46FC                   mov al, [bp-4]
  7689 000034F3 3C7D                     cmp al, 125
  7690 000034F5 0F841400                 je  .stmt423
  7691                                  
  7692                                  ;-897               prc(cha);
  7693                                  
  7694 000034F9 8A46FC                   mov al, byte [bp-4]
  7695 000034FC B400                     mov ah, 0
  7696 000034FE 50                       push ax
  7697 000034FF E88BCE                   call prc
  7698 00003502 83C402                   add  sp, 2
  7699                                  
  7700                                  ;-898               cha=next();
  7701                                  
  7702 00003505 E8D6D2                   call next
  7703 00003508 8846FC                   mov [bp-4], al
  7704                                  
  7705                                  ;-899           }
  7706                                  
  7707                                  
  7708                                  ;-900           token=getlex();
  7709                                  
  7710 0000350B EBE3                     jmp .stmt422
  7711                                  .stmt423:
  7712 0000350D E81AD5                   call getlex
  7713 00003510 A3[1E00]                 mov word [token], ax
  7714                                  
  7715                                  ;-901       } else error1("Curly open expected");
  7716                                  
  7717 00003513 E90900                   jmp .stmt424
  7718                                  .stmt421:
  7719 00003516 68[1E36]                 push stmt_3
  7720 00003519 E8EBD0                   call error1
  7721 0000351C 83C402                   add  sp, 2
  7722                                  
  7723                                  ;-902         }
  7724                                  
  7725                                  .stmt424:
  7726                                  
  7727                                  ;-903   else if(istoken(T_EMIT)) {
  7728                                  
  7729 0000351F E9EB00                   jmp .stmt425
  7730                                  .stmt420:
  7731 00003522 680802                   push 520
  7732 00003525 E881DA                   call istoken
  7733 00003528 83C402                   add  sp, 2
  7734 0000352B 08C0                     or  al, al
  7735 0000352D 0F843E00                 je .stmt426
  7736                                  
  7737                                  ;-904       prs("\n db ");
  7738                                  
  7739 00003531 68[3236]                 push stmt_4
  7740 00003534 E8AFCE                   call prs
  7741 00003537 83C402                   add  sp, 2
  7742                                  
  7743                                  ;-905     L1: token=getlex();
  7744                                  
  7745                                  .L1:
  7746 0000353A E8EDD4                   call getlex
  7747 0000353D A3[1E00]                 mov word [token], ax
  7748                                  
  7749                                  ;-906       prunsign1(lexval);
  7750                                  
  7751 00003540 FF36[2C00]               push word [lexval]
  7752 00003544 E802D0                   call prunsign1
  7753 00003547 83C402                   add  sp, 2
  7754                                  
  7755                                  ;-907       token=getlex();
  7756                                  
  7757 0000354A E8DDD4                   call getlex
  7758 0000354D A3[1E00]                 mov word [token], ax
  7759                                  
  7760                                  ;-908       if (token== ',') {
  7761                                  
  7762 00003550 A1[1E00]                 mov ax, [token]
  7763 00003553 83F82C                   cmp ax, 44
  7764 00003556 0F850A00                 jne .stmt427
  7765                                  
  7766                                  ;-909           prc(',');
  7767                                  
  7768 0000355A 6A2C                     push 44
  7769 0000355C E82ECE                   call prc
  7770 0000355F 83C402                   add  sp, 2
  7771                                  
  7772                                  ;-910           goto L1;
  7773                                  
  7774 00003562 EBD6                     jmp .L1
  7775                                  
  7776                                  ;-911       }
  7777                                  
  7778                                  
  7779                                  ;-912       expect(')');
  7780                                  
  7781                                  .stmt427:
  7782 00003564 6A29                     push 41
  7783 00003566 E862DA                   call expect
  7784 00003569 83C402                   add  sp, 2
  7785                                  
  7786                                  ;-913   }
  7787                                  
  7788                                  
  7789                                  ;-914   else if(istoken(';'))      { }
  7790                                  
  7791 0000356C E99E00                   jmp .stmt428
  7792                                  .stmt426:
  7793 0000356F 6A3B                     push 59
  7794 00003571 E835DA                   call istoken
  7795 00003574 83C402                   add  sp, 2
  7796 00003577 08C0                     or  al, al
  7797 00003579 0F840300                 je .stmt429
  7798                                  
  7799                                  ;-915   else if(istoken(T_RETURN)) {
  7800                                  
  7801 0000357D E98D00                   jmp .stmt430
  7802                                  .stmt429:
  7803 00003580 680002                   push 512
  7804 00003583 E823DA                   call istoken
  7805 00003586 83C402                   add  sp, 2
  7806 00003589 08C0                     or  al, al
  7807 0000358B 0F843500                 je .stmt431
  7808                                  
  7809                                  ;-916         if (token!=';') expr(0);
  7810                                  
  7811 0000358F A1[1E00]                 mov ax, [token]
  7812 00003592 83F83B                   cmp ax, 59
  7813 00003595 0F840800                 je  .stmt432
  7814 00003599 6A00                     push 0
  7815 0000359B E825F8                   call expr
  7816 0000359E 83C402                   add  sp, 2
  7817                                  
  7818                                  ;-917         prs("\n jmp .retn");
  7819                                  
  7820                                  .stmt432:
  7821 000035A1 68[3936]                 push stmt_5
  7822 000035A4 E83FCE                   call prs
  7823 000035A7 83C402                   add  sp, 2
  7824                                  
  7825                                  ;-918         prs(fname);
  7826                                  
  7827 000035AA 8D06236E                 lea  ax, [fname]
  7828 000035AE 50                       push ax
  7829 000035AF E834CE                   call prs
  7830 000035B2 83C402                   add  sp, 2
  7831                                  
  7832                                  ;-919         nreturn++;
  7833                                  
  7834 000035B5 FF06[2800]               inc  word[nreturn]
  7835                                  
  7836                                  ;-920         expect(';');
  7837                                  
  7838 000035B9 6A3B                     push 59
  7839 000035BB E80DDA                   call expect
  7840 000035BE 83C402                   add  sp, 2
  7841                                  
  7842                                  ;-921         }
  7843                                  
  7844                                  
  7845                                  ;-922   else if(thechar==':')      {
  7846                                  
  7847 000035C1 E94900                   jmp .stmt433
  7848                                  .stmt431:
  7849 000035C4 A0[2300]                 mov al, [thechar]
  7850 000035C7 3C3A                     cmp al, 58
  7851 000035C9 0F853000                 jne .stmt434
  7852                                  
  7853                                  ;-923         prs("\n."); // Label
  7854                                  
  7855 000035CD 68[4636]                 push stmt_6
  7856 000035D0 E813CE                   call prs
  7857 000035D3 83C402                   add  sp, 2
  7858                                  
  7859                                  ;-924         prs(symbol); prc(':');
  7860                                  
  7861 000035D6 8D06A36D                 lea  ax, [symbol]
  7862 000035DA 50                       push ax
  7863 000035DB E808CE                   call prs
  7864 000035DE 83C402                   add  sp, 2
  7865 000035E1 6A3A                     push 58
  7866 000035E3 E8A7CD                   call prc
  7867 000035E6 83C402                   add  sp, 2
  7868                                  
  7869                                  ;-925         expect(T_NAME);
  7870                                  
  7871 000035E9 680001                   push 256
  7872 000035EC E8DCD9                   call expect
  7873 000035EF 83C402                   add  sp, 2
  7874                                  
  7875                                  ;-926         expect(':');
  7876                                  
  7877 000035F2 6A3A                     push 58
  7878 000035F4 E8D4D9                   call expect
  7879 000035F7 83C402                   add  sp, 2
  7880                                  
  7881                                  ;-927         }
  7882                                  
  7883                                  
  7884                                  ;-928   else  {expr(0);; expect(';'); }
  7885                                  
  7886 000035FA E91000                   jmp .stmt435
  7887                                  .stmt434:
  7888 000035FD 6A00                     push 0
  7889 000035FF E8C1F7                   call expr
  7890 00003602 83C402                   add  sp, 2
  7891 00003605 6A3B                     push 59
  7892 00003607 E8C1D9                   call expect
  7893 0000360A 83C402                   add  sp, 2
  7894                                  
  7895                                  ;-929 }
  7896                                  
  7897                                  .stmt435:
  7898                                  .stmt433:
  7899                                  .stmt430:
  7900                                  .stmt428:
  7901                                  .stmt425:
  7902                                  .stmt419:
  7903                                  .stmt415:
  7904                                  .stmt413:
  7905                                  .stmt411:
  7906                                  .stmt409:
  7907                                  .stmt405:
  7908                                  
  7909                                  ;-930 
  7910                                  
  7911                                  
  7912                                  ;-931 
  7913                                  
  7914                                  
  7915                                  ;-932 int dofunc() { int nloc; int i; int narg;
  7916 0000360D C9                       LEAVE
  7917 0000360E C3                       ret
  7918 0000360F 5C6E206A6D70202E00      stmt_0 db "\n jmp .",0
  7919 00003618 5C6E00                  stmt_1 db "\n",0
  7920 0000361B 5C6E00                  stmt_2 db "\n",0
  7921 0000361E 4375726C79206F7065-     stmt_3 db "Curly open expected",0
  7922 00003627 6E2065787065637465-
  7923 00003630 6400               
  7924 00003632 5C6E2064622000          stmt_4 db "\n db ",0
  7925 00003639 5C6E206A6D70202E72-     stmt_5 db "\n jmp .retn",0
  7926 00003642 65746E00           
  7927 00003646 5C6E2E00                stmt_6 db "\n.",0
  7928                                  ENDP
  7929                                  
  7930                                  dofunc: PROC
  7931                                  
  7932                                  ;-933   cloc=&co;
  7933                                  ;
  7934 0000364A C8060000                 ENTER  6,0
  7935 0000364E B8A861                   mov ax, co
  7936 00003651 A3[1800]                 mov word [cloc], ax
  7937                                  
  7938                                  ;-934   checknamelen();
  7939                                  
  7940 00003654 E81EDA                   call checknamelen
  7941                                  
  7942                                  ;-935   strcpy(fname, symbol);
  7943                                  
  7944 00003657 8D06A36D                 lea  ax, [symbol]
  7945 0000365B 50                       push ax
  7946 0000365C 8D06236E                 lea  ax, [fname]
  7947 00003660 50                       push ax
  7948 00003661 E8CCCB                   call strcpy
  7949 00003664 83C404                   add  sp, 4
  7950                                  
  7951                                  ;-936   if (checkFunction() ) error1("Function already defined");
  7952                                  
  7953 00003667 E896DE                   call checkFunction
  7954 0000366A 08C0                     or  al, al
  7955 0000366C 0F840900                 je .dofunc436
  7956 00003670 68[9138]                 push dofunc_0
  7957 00003673 E891CF                   call error1
  7958 00003676 83C402                   add  sp, 2
  7959                                  
  7960                                  ;-937   storefunc();
  7961                                  
  7962                                  .dofunc436:
  7963 00003679 E856DD                   call storefunc
  7964                                  
  7965                                  ;-938   prs("\n\n"); prs(symbol); prs(": PROC");
  7966                                  
  7967 0000367C 68[AA38]                 push dofunc_1
  7968 0000367F E864CD                   call prs
  7969 00003682 83C402                   add  sp, 2
  7970 00003685 8D06A36D                 lea  ax, [symbol]
  7971 00003689 50                       push ax
  7972 0000368A E859CD                   call prs
  7973 0000368D 83C402                   add  sp, 2
  7974 00003690 68[AF38]                 push dofunc_2
  7975 00003693 E850CD                   call prs
  7976 00003696 83C402                   add  sp, 2
  7977                                  
  7978                                  ;-939   expect('('); LTop=LSTART;  i=0;
  7979                                  
  7980 00003699 6A28                     push 40
  7981 0000369B E82DD9                   call expect
  7982 0000369E 83C402                   add  sp, 2
  7983 000036A1 B8C800                   mov ax, 200
  7984 000036A4 A3[3B00]                 mov word [LTop], ax
  7985 000036A7 B80000                   mov ax, 0
  7986 000036AA 8946FC                   mov [bp-4], ax
  7987                                  
  7988                                  ;-940   if (istoken(')')==0) { narg=2;
  7989                                  
  7990 000036AD 6A29                     push 41
  7991 000036AF E8F7D8                   call istoken
  7992 000036B2 83C402                   add  sp, 2
  7993 000036B5 83F800                   cmp ax, 0
  7994 000036B8 0F854600                 jne .dofunc437
  7995 000036BC B80200                   mov ax, 2
  7996 000036BF 8946FA                   mov [bp-6], ax
  7997                                  
  7998                                  ;-941     do { typeName();  addlocal(); narg+=2;
  7999                                  
  8000                                  .dofunc438:
  8001 000036C2 E8F3DA                   call typeName
  8002 000036C5 E87FDD                   call addlocal
  8003 000036C8 8346FA02                 add  word[bp-6], 2
  8004                                  
  8005                                  ;-942          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }
  8006                                  
  8007 000036CC 8B46FA                   mov ax, [bp-6]
  8008 000036CF 8B1E[3B00]               mov bx, [LTop]
  8009 000036D3 D1E3                     shl bx, 1
  8010 000036D5 89872077                 mov [GData+bx], ax
  8011 000036D9 A0[3600]                 mov al, [iswidth]
  8012 000036DC 3C04                     cmp al, 4
  8013 000036DE 0F850400                 jne .dofunc439
  8014 000036E2 8346FA02                 add  word[bp-6], 2
  8015                                  .dofunc439:
  8016 000036E6 FF06[3B00]               inc  word[LTop]
  8017                                  
  8018                                  ;-943     while (istoken(','));  expect(')'); }
  8019                                  
  8020 000036EA 6A2C                     push 44
  8021 000036EC E8BAD8                   call istoken
  8022 000036EF 83C402                   add  sp, 2
  8023 000036F2 08C0                     or  al, al
  8024 000036F4 0F840200                 je .dofunc440
  8025 000036F8 EBC8                     jmp .dofunc438
  8026                                  .dofunc440:
  8027 000036FA 6A29                     push 41
  8028 000036FC E8CCD8                   call expect
  8029 000036FF 83C402                   add  sp, 2
  8030                                  
  8031                                  ;-944 
  8032                                  
  8033                                  
  8034                                  ;-945   expect('{'); /*body*/
  8035                                  
  8036                                  .dofunc437:
  8037 00003702 6A7B                     push 123
  8038 00003704 E8C4D8                   call expect
  8039 00003707 83C402                   add  sp, 2
  8040                                  
  8041                                  ;-946   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */
  8042                                  
  8043 0000370A B80000                   mov ax, 0
  8044 0000370D 8946FE                   mov [bp-2], ax
  8045 00003710 B80000                   mov ax, 0
  8046 00003713 A3[2800]                 mov word [nreturn], ax
  8047 00003716 B80000                   mov ax, 0
  8048 00003719 A3[2600]                 mov word [nconst], ax
  8049 0000371C B80000                   mov ax, 0
  8050 0000371F 8946FC                   mov [bp-4], ax
  8051                                  
  8052                                  ;-947   while(isvariable()) {
  8053                                  
  8054                                  .dofunc441:
  8055 00003722 E828DE                   call isvariable
  8056 00003725 08C0                     or  al, al
  8057 00003727 0F849200                 je .dofunc442
  8058                                  
  8059                                  ;-948     do {typeName();
  8060                                  
  8061                                  .dofunc443:
  8062 0000372B E88ADA                   call typeName
  8063                                  
  8064                                  ;-949         checknamelen();
  8065                                  
  8066 0000372E E844D9                   call checknamelen
  8067                                  
  8068                                  ;-950         addlocal(); nloc-=2;
  8069                                  
  8070 00003731 E813DD                   call addlocal
  8071 00003734 836EFE02                 sub  word[bp-2], 2
  8072                                  
  8073                                  ;-951         if (iswidth == 4) nloc-=2;
  8074                                  
  8075 00003738 A0[3600]                 mov al, [iswidth]
  8076 0000373B 3C04                     cmp al, 4
  8077 0000373D 0F850400                 jne .dofunc444
  8078 00003741 836EFE02                 sub  word[bp-2], 2
  8079                                  
  8080                                  ;-952         GData[LTop]=nloc;
  8081                                  
  8082                                  .dofunc444:
  8083 00003745 8B46FE                   mov ax, [bp-2]
  8084 00003748 8B1E[3B00]               mov bx, [LTop]
  8085 0000374C D1E3                     shl bx, 1
  8086 0000374E 89872077                 mov [GData+bx], ax
  8087                                  
  8088                                  ;-953         if (istoken('[')){
  8089                                  
  8090 00003752 6A5B                     push 91
  8091 00003754 E852D8                   call istoken
  8092 00003757 83C402                   add  sp, 2
  8093 0000375A 08C0                     or  al, al
  8094 0000375C 0F843D00                 je .dofunc445
  8095                                  
  8096                                  ;-954             istype='&';GType[LTop]='&';expect(T_CONST);expect(']');
  8097                                  
  8098 00003760 B82600                   mov ax, 38
  8099 00003763 A2[3000]                 mov byte [istype], al
  8100 00003766 B82600                   mov ax, 38
  8101 00003769 8B1E[3B00]               mov bx, [LTop]
  8102 0000376D 8887EC6E                 mov [GType+bx], al
  8103 00003771 680101                   push 257
  8104 00003774 E854D8                   call expect
  8105 00003777 83C402                   add  sp, 2
  8106 0000377A 6A5D                     push 93
  8107 0000377C E84CD8                   call expect
  8108 0000377F 83C402                   add  sp, 2
  8109                                  
  8110                                  ;-955             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc;
  8111                                  
  8112 00003782 8B46FE                   mov ax, [bp-2]
  8113 00003785 2B06[2C00]               sub ax, [lexval]
  8114 00003789 8946FE                   mov [bp-2], ax
  8115 0000378C 8346FE02                 add  word[bp-2], 2
  8116 00003790 8B46FE                   mov ax, [bp-2]
  8117 00003793 8B1E[3B00]               mov bx, [LTop]
  8118 00003797 D1E3                     shl bx, 1
  8119 00003799 89872077                 mov [GData+bx], ax
  8120                                  
  8121                                  ;-956             }
  8122                                  
  8123                                  
  8124                                  ;-957         LTop++;
  8125                                  
  8126                                  .dofunc445:
  8127 0000379D FF06[3B00]               inc  word[LTop]
  8128                                  
  8129                                  ;-958       } while (istoken(',')); expect(';'); }
  8130                                  
  8131 000037A1 6A2C                     push 44
  8132 000037A3 E803D8                   call istoken
  8133 000037A6 83C402                   add  sp, 2
  8134 000037A9 08C0                     or  al, al
  8135 000037AB 0F840300                 je .dofunc446
  8136 000037AF E979FF                   jmp .dofunc443
  8137                                  .dofunc446:
  8138 000037B2 6A3B                     push 59
  8139 000037B4 E814D8                   call expect
  8140 000037B7 83C402                   add  sp, 2
  8141                                  
  8142                                  ;-959   if (LTop>LSTART){prs(";\n ENTER  ");
  8143                                  
  8144 000037BA E965FF                   jmp .dofunc441
  8145                                  .dofunc442:
  8146 000037BD A1[3B00]                 mov ax, [LTop]
  8147 000037C0 3DC800                   cmp ax, 200
  8148 000037C3 0F8E2700                 jle .dofunc447
  8149 000037C7 68[B638]                 push dofunc_3
  8150 000037CA E819CC                   call prs
  8151 000037CD 83C402                   add  sp, 2
  8152                                  
  8153                                  ;-960     nloc=mkneg(nloc); prunsign1 (nloc); prs(",0"); }
  8154                                  
  8155 000037D0 FF76FE                   push word [bp-2]
  8156 000037D3 E8D2C8                   call mkneg
  8157 000037D6 83C402                   add  sp, 2
  8158 000037D9 8946FE                   mov [bp-2], ax
  8159 000037DC FF76FE                   push word [bp-2]
  8160 000037DF E867CD                   call prunsign1
  8161 000037E2 83C402                   add  sp, 2
  8162 000037E5 68[C238]                 push dofunc_4
  8163 000037E8 E8FBCB                   call prs
  8164 000037EB 83C402                   add  sp, 2
  8165                                  
  8166                                  ;-961   while(istoken('}')==0)   stmt();
  8167                                  
  8168                                  .dofunc447:
  8169                                  .dofunc448:
  8170 000037EE 6A7D                     push 125
  8171 000037F0 E8B6D7                   call istoken
  8172 000037F3 83C402                   add  sp, 2
  8173 000037F6 83F800                   cmp ax, 0
  8174 000037F9 0F850500                 jne .dofunc449
  8175 000037FD E814FB                   call stmt
  8176                                  
  8177                                  ;-962   if (nreturn) {
  8178                                  
  8179 00003800 EBEC                     jmp .dofunc448
  8180                                  .dofunc449:
  8181 00003802 A1[2800]                 mov ax, [nreturn]
  8182 00003805 08C0                     or  al, al
  8183 00003807 0F841C00                 je .dofunc450
  8184                                  
  8185                                  ;-963         prs("\n .retn");
  8186                                  
  8187 0000380B 68[C538]                 push dofunc_5
  8188 0000380E E8D5CB                   call prs
  8189 00003811 83C402                   add  sp, 2
  8190                                  
  8191                                  ;-964         prs(fname);
  8192                                  
  8193 00003814 8D06236E                 lea  ax, [fname]
  8194 00003818 50                       push ax
  8195 00003819 E8CACB                   call prs
  8196 0000381C 83C402                   add  sp, 2
  8197                                  
  8198                                  ;-965         prc(':');
  8199                                  
  8200 0000381F 6A3A                     push 58
  8201 00003821 E869CB                   call prc
  8202 00003824 83C402                   add  sp, 2
  8203                                  
  8204                                  ;-966         }
  8205                                  
  8206                                  
  8207                                  ;-967   if (LTop > LSTART) prs(" LEAVE");
  8208                                  
  8209                                  .dofunc450:
  8210 00003827 A1[3B00]                 mov ax, [LTop]
  8211 0000382A 3DC800                   cmp ax, 200
  8212 0000382D 0F8E0900                 jle .dofunc451
  8213 00003831 68[CE38]                 push dofunc_6
  8214 00003834 E8AFCB                   call prs
  8215 00003837 83C402                   add  sp, 2
  8216                                  
  8217                                  ;-968   prs("\n ret");
  8218                                  
  8219                                  .dofunc451:
  8220 0000383A 68[D538]                 push dofunc_7
  8221 0000383D E8A6CB                   call prs
  8222 00003840 83C402                   add  sp, 2
  8223                                  
  8224                                  ;-969   *cloc=0; prs(co);
  8225                                  
  8226 00003843 B80000                   mov ax, 0
  8227 00003846 8B1E[1800]               mov  bx, [cloc]
  8228 0000384A 8807                     mov  [bx], al
  8229 0000384C 8D06A861                 lea  ax, [co]
  8230 00003850 50                       push ax
  8231 00003851 E892CB                   call prs
  8232 00003854 83C402                   add  sp, 2
  8233                                  
  8234                                  ;-970   maxco1=strlen(co);
  8235                                  
  8236 00003857 8D06A861                 lea  ax, [co]
  8237 0000385B 50                       push ax
  8238 0000385C E8A9C9                   call strlen
  8239 0000385F 83C402                   add  sp, 2
  8240 00003862 A3[1600]                 mov word [maxco1], ax
  8241                                  
  8242                                  ;-971   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }
  8243                                  
  8244 00003865 A1[1600]                 mov ax, [maxco1]
  8245 00003868 3B06[1400]               cmp ax, [maxco]
  8246 0000386C 0F8E1600                 jle .dofunc452
  8247 00003870 A1[1600]                 mov ax, [maxco1]
  8248 00003873 A3[1400]                 mov word [maxco], ax
  8249 00003876 8D06236E                 lea  ax, [fname]
  8250 0000387A 50                       push ax
  8251 0000387B 8D06606D                 lea  ax, [coname]
  8252 0000387F 50                       push ax
  8253 00003880 E8ADC9                   call strcpy
  8254 00003883 83C404                   add  sp, 4
  8255                                  
  8256                                  ;-972   prs("\nENDP");
  8257                                  
  8258                                  .dofunc452:
  8259 00003886 68[DC38]                 push dofunc_8
  8260 00003889 E85ACB                   call prs
  8261 0000388C 83C402                   add  sp, 2
  8262                                  
  8263                                  ;-973 }
  8264                                  
  8265                                  
  8266                                  ;-974 
  8267                                  
  8268                                  
  8269                                  ;-975 char doglobName[IDLENMAX];
  8270 0000388F C9                       LEAVE
  8271 00003890 C3                       ret
  8272 00003891 46756E6374696F6E20-     dofunc_0 db "Function already defined",0
  8273 0000389A 616C72656164792064-
  8274 000038A3 6566696E656400     
  8275 000038AA 5C6E5C6E00              dofunc_1 db "\n\n",0
  8276 000038AF 3A2050524F4300          dofunc_2 db ": PROC",0
  8277 000038B6 3B5C6E20454E544552-     dofunc_3 db ";\n ENTER  ",0
  8278 000038BF 202000             
  8279 000038C2 2C3000                  dofunc_4 db ",0",0
  8280 000038C5 5C6E202E7265746E00      dofunc_5 db "\n .retn",0
  8281 000038CE 204C4541564500          dofunc_6 db " LEAVE",0
  8282 000038D5 5C6E2072657400          dofunc_7 db "\n ret",0
  8283 000038DC 5C6E454E445000          dofunc_8 db "\nENDP",0
  8284                                  ENDP
  8285                                  section .bss
  8286                                  absolute 56982
  8287 0000DE96 <res 0000000F>          doglobName resb 15
  8288                                  section .text
  8289                                  
  8290                                  ;-976 int doglob() {
  8291                                  
  8292                                  
  8293                                  doglob: PROC
  8294                                  
  8295                                  ;-977     int i; int j; int isstrarr; isstrarr=0;
  8296                                  ;
  8297 000038E3 C8060000                 ENTER  6,0
  8298 000038E7 B80000                   mov ax, 0
  8299 000038EA 8946FA                   mov [bp-6], ax
  8300                                  
  8301                                  ;-978   if (GTop >= LSTART) error1("Global table full");
  8302                                  
  8303 000038ED A1[3900]                 mov ax, [GTop]
  8304 000038F0 3DC800                   cmp ax, 200 ;unsigned : 1
  8305 000038F3 0F8C0900                 jl  .doglob453
  8306 000038F7 68[383C]                 push doglob_0
  8307 000038FA E80ACD                   call error1
  8308 000038FD 83C402                   add  sp, 2
  8309                                  
  8310                                  ;-979   if (iswidth == 0) error1("no VOID as var type");
  8311                                  
  8312                                  .doglob453:
  8313 00003900 A0[3600]                 mov al, [iswidth]
  8314 00003903 3C00                     cmp al, 0
  8315 00003905 0F850900                 jne .doglob454
  8316 00003909 68[4A3C]                 push doglob_1
  8317 0000390C E8F8CC                   call error1
  8318 0000390F 83C402                   add  sp, 2
  8319                                  
  8320                                  ;-980   checknamelen();
  8321                                  
  8322                                  .doglob454:
  8323 00003912 E860D7                   call checknamelen
  8324                                  
  8325                                  ;-981   if (checkName() != 0) error1("Variable already defined");
  8326                                  
  8327 00003915 E8A9D7                   call checkName
  8328 00003918 3C00                     cmp al, 0
  8329 0000391A 0F840900                 je  .doglob455
  8330 0000391E 68[5E3C]                 push doglob_2
  8331 00003921 E8E3CC                   call error1
  8332 00003924 83C402                   add  sp, 2
  8333                                  
  8334                                  ;-982   if (istoken('[')) { istype='&';
  8335                                  
  8336                                  .doglob455:
  8337 00003927 6A5B                     push 91
  8338 00003929 E87DD6                   call istoken
  8339 0000392C 83C402                   add  sp, 2
  8340 0000392F 08C0                     or  al, al
  8341 00003931 0F84E201                 je .doglob456
  8342 00003935 B82600                   mov ax, 38
  8343 00003938 A2[3000]                 mov byte [istype], al
  8344                                  
  8345                                  ;-983     if (istoken(T_CONST)) {
  8346                                  
  8347 0000393B 680101                   push 257
  8348 0000393E E868D6                   call istoken
  8349 00003941 83C402                   add  sp, 2
  8350 00003944 08C0                     or  al, al
  8351 00003946 0F84C200                 je .doglob457
  8352                                  
  8353                                  ;-984       prs("\nsection .bss\nabsolute ");
  8354                                  
  8355 0000394A 68[773C]                 push doglob_3
  8356 0000394D E896CA                   call prs
  8357 00003950 83C402                   add  sp, 2
  8358                                  
  8359                                  ;-985       prunsign1(orgData);
  8360                                  
  8361 00003953 FF36[1200]               push word [orgData]
  8362 00003957 E8EFCB                   call prunsign1
  8363 0000395A 83C402                   add  sp, 2
  8364                                  
  8365                                  ;-986       prs("\n"); prs(symbol);
  8366                                  
  8367 0000395D 68[913C]                 push doglob_4
  8368 00003960 E883CA                   call prs
  8369 00003963 83C402                   add  sp, 2
  8370 00003966 8D06A36D                 lea  ax, [symbol]
  8371 0000396A 50                       push ax
  8372 0000396B E878CA                   call prs
  8373 0000396E 83C402                   add  sp, 2
  8374                                  
  8375                                  ;-987       if (iswidth==1) prs(" resb ");
  8376                                  
  8377 00003971 A0[3600]                 mov al, [iswidth]
  8378 00003974 3C01                     cmp al, 1
  8379 00003976 0F850900                 jne .doglob458
  8380 0000397A 68[943C]                 push doglob_5
  8381 0000397D E866CA                   call prs
  8382 00003980 83C402                   add  sp, 2
  8383                                  
  8384                                  ;-988       if (iswidth==2) prs(" resw ");
  8385                                  
  8386                                  .doglob458:
  8387 00003983 A0[3600]                 mov al, [iswidth]
  8388 00003986 3C02                     cmp al, 2
  8389 00003988 0F850900                 jne .doglob459
  8390 0000398C 68[9B3C]                 push doglob_6
  8391 0000398F E854CA                   call prs
  8392 00003992 83C402                   add  sp, 2
  8393                                  
  8394                                  ;-989       if (iswidth==4) prs(" resd ");
  8395                                  
  8396                                  .doglob459:
  8397 00003995 A0[3600]                 mov al, [iswidth]
  8398 00003998 3C04                     cmp al, 4
  8399 0000399A 0F850900                 jne .doglob460
  8400 0000399E 68[A23C]                 push doglob_7
  8401 000039A1 E842CA                   call prs
  8402 000039A4 83C402                   add  sp, 2
  8403                                  
  8404                                  ;-990       prunsign1(lexval);
  8405                                  
  8406                                  .doglob460:
  8407 000039A7 FF36[2C00]               push word [lexval]
  8408 000039AB E89BCB                   call prunsign1
  8409 000039AE 83C402                   add  sp, 2
  8410                                  
  8411                                  ;-991       prs("\nsection .text");
  8412                                  
  8413 000039B1 68[A93C]                 push doglob_8
  8414 000039B4 E82FCA                   call prs
  8415 000039B7 83C402                   add  sp, 2
  8416                                  
  8417                                  ;-992       orgData=orgData+lexval;
  8418                                  
  8419 000039BA A1[1200]                 mov ax, [orgData]
  8420 000039BD 0306[2C00]               add ax, [lexval]
  8421 000039C1 A3[1200]                 mov word [orgData], ax
  8422                                  
  8423                                  ;-993       if (iswidth==2) orgData=orgData+lexval;
  8424                                  
  8425 000039C4 A0[3600]                 mov al, [iswidth]
  8426 000039C7 3C02                     cmp al, 2
  8427 000039C9 0F850A00                 jne .doglob461
  8428 000039CD A1[1200]                 mov ax, [orgData]
  8429 000039D0 0306[2C00]               add ax, [lexval]
  8430 000039D4 A3[1200]                 mov word [orgData], ax
  8431                                  
  8432                                  ;-994       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}
  8433                                  
  8434                                  .doglob461:
  8435 000039D7 A0[3600]                 mov al, [iswidth]
  8436 000039DA 3C04                     cmp al, 4
  8437 000039DC 0F851400                 jne .doglob462
  8438 000039E0 A1[2C00]                 mov ax, [lexval]
  8439 000039E3 BB0300                   mov bx, 3
  8440 000039E6 F7E3                     mul bx
  8441 000039E8 8946FE                   mov [bp-2], ax
  8442 000039EB A1[1200]                 mov ax, [orgData]
  8443 000039EE 0346FE                   add ax, [bp-2]
  8444 000039F1 A3[1200]                 mov word [orgData], ax
  8445                                  
  8446                                  ;-995       GData[GTop]=lexval; expect(']');
  8447                                  
  8448                                  .doglob462:
  8449 000039F4 A1[2C00]                 mov ax, [lexval]
  8450 000039F7 8B1E[3900]               mov bx, [GTop]
  8451 000039FB D1E3                     shl bx, 1
  8452 000039FD 89872077                 mov [GData+bx], ax
  8453 00003A01 6A5D                     push 93
  8454 00003A03 E8C5D5                   call expect
  8455 00003A06 83C402                   add  sp, 2
  8456                                  
  8457                                  ;-996     }else { expect(']');
  8458                                  
  8459 00003A09 E90801                   jmp .doglob463
  8460                                  .doglob457:
  8461 00003A0C 6A5D                     push 93
  8462 00003A0E E8BAD5                   call expect
  8463 00003A11 83C402                   add  sp, 2
  8464                                  
  8465                                  ;-997       if (iswidth != 1) error1("Only ByteArray allowed");
  8466                                  
  8467 00003A14 A0[3600]                 mov al, [iswidth]
  8468 00003A17 3C01                     cmp al, 1
  8469 00003A19 0F840900                 je  .doglob464
  8470 00003A1D 68[B93C]                 push doglob_9
  8471 00003A20 E8E4CB                   call error1
  8472 00003A23 83C402                   add  sp, 2
  8473                                  
  8474                                  ;-998       prs("\n"); prs(symbol); prs(" db ");
  8475                                  
  8476                                  .doglob464:
  8477 00003A26 68[D03C]                 push doglob_10
  8478 00003A29 E8BAC9                   call prs
  8479 00003A2C 83C402                   add  sp, 2
  8480 00003A2F 8D06A36D                 lea  ax, [symbol]
  8481 00003A33 50                       push ax
  8482 00003A34 E8AFC9                   call prs
  8483 00003A37 83C402                   add  sp, 2
  8484 00003A3A 68[D33C]                 push doglob_11
  8485 00003A3D E8A6C9                   call prs
  8486 00003A40 83C402                   add  sp, 2
  8487                                  
  8488                                  ;-999       isstrarr=1; strcpy(doglobName, symbol);
  8489                                  
  8490 00003A43 B80100                   mov ax, 1
  8491 00003A46 8946FA                   mov [bp-6], ax
  8492 00003A49 8D06A36D                 lea  ax, [symbol]
  8493 00003A4D 50                       push ax
  8494 00003A4E 8D0696DE                 lea  ax, [doglobName]
  8495 00003A52 50                       push ax
  8496 00003A53 E8DAC7                   call strcpy
  8497 00003A56 83C404                   add  sp, 4
  8498                                  
  8499                                  ;-1000       expect('=');
  8500                                  
  8501 00003A59 6A3D                     push 61
  8502 00003A5B E86DD5                   call expect
  8503 00003A5E 83C402                   add  sp, 2
  8504                                  
  8505                                  ;-1001       if (istoken(T_STRING)) {
  8506                                  
  8507 00003A61 680201                   push 258
  8508 00003A64 E842D5                   call istoken
  8509 00003A67 83C402                   add  sp, 2
  8510 00003A6A 08C0                     or  al, al
  8511 00003A6C 0F844200                 je .doglob465
  8512                                  
  8513                                  ;-1002         prc(34); prscomment(symbol); prc(34); prs(",0");
  8514                                  
  8515 00003A70 6A22                     push 34
  8516 00003A72 E818C9                   call prc
  8517 00003A75 83C402                   add  sp, 2
  8518 00003A78 8D06A36D                 lea  ax, [symbol]
  8519 00003A7C 50                       push ax
  8520 00003A7D E838C9                   call prscomment
  8521 00003A80 83C402                   add  sp, 2
  8522 00003A83 6A22                     push 34
  8523 00003A85 E805C9                   call prc
  8524 00003A88 83C402                   add  sp, 2
  8525 00003A8B 68[D83C]                 push doglob_12
  8526 00003A8E E855C9                   call prs
  8527 00003A91 83C402                   add  sp, 2
  8528                                  
  8529                                  ;-1003         i=strlen(symbol); GData[GTop]=i; }
  8530                                  
  8531 00003A94 8D06A36D                 lea  ax, [symbol]
  8532 00003A98 50                       push ax
  8533 00003A99 E86CC7                   call strlen
  8534 00003A9C 83C402                   add  sp, 2
  8535 00003A9F 8946FE                   mov [bp-2], ax
  8536 00003AA2 8B46FE                   mov ax, [bp-2]
  8537 00003AA5 8B1E[3900]               mov bx, [GTop]
  8538 00003AA9 D1E3                     shl bx, 1
  8539 00003AAB 89872077                 mov [GData+bx], ax
  8540                                  
  8541                                  ;-1004       else if (istoken('{' )) { i=0;
  8542                                  
  8543 00003AAF E96200                   jmp .doglob466
  8544                                  .doglob465:
  8545 00003AB2 6A7B                     push 123
  8546 00003AB4 E8F2D4                   call istoken
  8547 00003AB7 83C402                   add  sp, 2
  8548 00003ABA 08C0                     or  al, al
  8549 00003ABC 0F844B00                 je .doglob467
  8550 00003AC0 B80000                   mov ax, 0
  8551 00003AC3 8946FE                   mov [bp-2], ax
  8552                                  
  8553                                  ;-1005         do { if(i) prc(',');
  8554                                  
  8555                                  .doglob468:
  8556 00003AC6 8B46FE                   mov ax, [bp-2]
  8557 00003AC9 08C0                     or  al, al
  8558 00003ACB 0F840800                 je .doglob469
  8559 00003ACF 6A2C                     push 44
  8560 00003AD1 E8B9C8                   call prc
  8561 00003AD4 83C402                   add  sp, 2
  8562                                  
  8563                                  ;-1006           expect(T_CONST); prunsign1(lexval); i=1; }
  8564                                  
  8565                                  .doglob469:
  8566 00003AD7 680101                   push 257
  8567 00003ADA E8EED4                   call expect
  8568 00003ADD 83C402                   add  sp, 2
  8569 00003AE0 FF36[2C00]               push word [lexval]
  8570 00003AE4 E862CA                   call prunsign1
  8571 00003AE7 83C402                   add  sp, 2
  8572 00003AEA B80100                   mov ax, 1
  8573 00003AED 8946FE                   mov [bp-2], ax
  8574                                  
  8575                                  ;-1007         while (istoken(',')); expect('}'); }
  8576                                  
  8577 00003AF0 6A2C                     push 44
  8578 00003AF2 E8B4D4                   call istoken
  8579 00003AF5 83C402                   add  sp, 2
  8580 00003AF8 08C0                     or  al, al
  8581 00003AFA 0F840200                 je .doglob470
  8582 00003AFE EBC6                     jmp .doglob468
  8583                                  .doglob470:
  8584 00003B00 6A7D                     push 125
  8585 00003B02 E8C6D4                   call expect
  8586 00003B05 83C402                   add  sp, 2
  8587                                  
  8588                                  ;-1008       else error1("String or number array expected");
  8589                                  
  8590 00003B08 E90900                   jmp .doglob471
  8591                                  .doglob467:
  8592 00003B0B 68[DB3C]                 push doglob_13
  8593 00003B0E E8F6CA                   call error1
  8594 00003B11 83C402                   add  sp, 2
  8595                                  
  8596                                  ;-1009       };
  8597                                  
  8598                                  .doglob471:
  8599                                  .doglob466:
  8600                                  .doglob463:
  8601                                  
  8602                                  ;-1010   }else { //expect('=');
  8603                                  
  8604 00003B14 E99E00                   jmp .doglob472
  8605                                  .doglob456:
  8606                                  
  8607                                  ;-1011     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");
  8608                                  
  8609 00003B17 68[FB3C]                 push doglob_14
  8610 00003B1A E8C9C8                   call prs
  8611 00003B1D 83C402                   add  sp, 2
  8612 00003B20 8D06A36D                 lea  ax, [symbol]
  8613 00003B24 50                       push ax
  8614 00003B25 E8BEC8                   call prs
  8615 00003B28 83C402                   add  sp, 2
  8616 00003B2B A0[3000]                 mov al, [istype]
  8617 00003B2E 3C2A                     cmp al, 42
  8618 00003B30 0F850C00                 jne .doglob473
  8619 00003B34 68[FE3C]                 push doglob_15
  8620 00003B37 E8ACC8                   call prs
  8621 00003B3A 83C402                   add  sp, 2
  8622                                  
  8623                                  ;-1012     else {
  8624                                  
  8625 00003B3D E93300                   jmp .doglob474
  8626                                  .doglob473:
  8627                                  
  8628                                  ;-1013       if      (iswidth==1) prs(" db ");
  8629                                  
  8630 00003B40 A0[3600]                 mov al, [iswidth]
  8631 00003B43 3C01                     cmp al, 1
  8632 00003B45 0F850C00                 jne .doglob475
  8633 00003B49 68[033D]                 push doglob_16
  8634 00003B4C E897C8                   call prs
  8635 00003B4F 83C402                   add  sp, 2
  8636                                  
  8637                                  ;-1014       else if (iswidth==2) prs(" dw ");
  8638                                  
  8639 00003B52 E91E00                   jmp .doglob476
  8640                                  .doglob475:
  8641 00003B55 A0[3600]                 mov al, [iswidth]
  8642 00003B58 3C02                     cmp al, 2
  8643 00003B5A 0F850C00                 jne .doglob477
  8644 00003B5E 68[083D]                 push doglob_17
  8645 00003B61 E882C8                   call prs
  8646 00003B64 83C402                   add  sp, 2
  8647                                  
  8648                                  ;-1015       else                 prs(" dd ");
  8649                                  
  8650 00003B67 E90900                   jmp .doglob478
  8651                                  .doglob477:
  8652 00003B6A 68[0D3D]                 push doglob_18
  8653 00003B6D E876C8                   call prs
  8654 00003B70 83C402                   add  sp, 2
  8655                                  
  8656                                  ;-1016     }
  8657                                  
  8658                                  .doglob478:
  8659                                  .doglob476:
  8660                                  
  8661                                  ;-1017     if(istoken('-')) prc('-');
  8662                                  
  8663                                  .doglob474:
  8664 00003B73 6A2D                     push 45
  8665 00003B75 E831D4                   call istoken
  8666 00003B78 83C402                   add  sp, 2
  8667 00003B7B 08C0                     or  al, al
  8668 00003B7D 0F840800                 je .doglob479
  8669 00003B81 6A2D                     push 45
  8670 00003B83 E807C8                   call prc
  8671 00003B86 83C402                   add  sp, 2
  8672                                  
  8673                                  ;-1018     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }
  8674                                  
  8675                                  .doglob479:
  8676 00003B89 6A3D                     push 61
  8677 00003B8B E81BD4                   call istoken
  8678 00003B8E 83C402                   add  sp, 2
  8679 00003B91 08C0                     or  al, al
  8680 00003B93 0F841600                 je .doglob480
  8681 00003B97 680101                   push 257
  8682 00003B9A E82ED4                   call expect
  8683 00003B9D 83C402                   add  sp, 2
  8684 00003BA0 FF36[2C00]               push word [lexval]
  8685 00003BA4 E8A2C9                   call prunsign1
  8686 00003BA7 83C402                   add  sp, 2
  8687                                  
  8688                                  ;-1019     else prunsign1(0); }
  8689                                  
  8690 00003BAA E90800                   jmp .doglob481
  8691                                  .doglob480:
  8692 00003BAD 6A00                     push 0
  8693 00003BAF E897C9                   call prunsign1
  8694 00003BB2 83C402                   add  sp, 2
  8695                                  .doglob481:
  8696                                  
  8697                                  ;-1020   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;
  8698                                  
  8699                                  .doglob472:
  8700 00003BB5 A0[3300]                 mov al, [issign]
  8701 00003BB8 8B1E[3900]               mov bx, [GTop]
  8702 00003BBC 88871870                 mov [GSign+bx], al
  8703 00003BC0 A0[3600]                 mov al, [iswidth]
  8704 00003BC3 8B1E[3900]               mov bx, [GTop]
  8705 00003BC7 88874471                 mov [GWidth+bx], al
  8706 00003BCB A0[3000]                 mov al, [istype]
  8707 00003BCE 8B1E[3900]               mov bx, [GTop]
  8708 00003BD2 8887EC6E                 mov [GType+bx], al
  8709                                  
  8710                                  ;-1021   GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  8711                                  
  8712 00003BD6 A1[4700]                 mov ax, [lineno]
  8713 00003BD9 83E801                   sub ax, 1
  8714 00003BDC 8B1E[3900]               mov bx, [GTop]
  8715 00003BE0 D1E3                     shl bx, 1
  8716 00003BE2 89877072                 mov [GAdr+bx], ax
  8717 00003BE6 B80000                   mov ax, 0
  8718 00003BE9 8B1E[3900]               mov bx, [GTop]
  8719 00003BED D1E3                     shl bx, 1
  8720 00003BEF 8987C874                 mov [GUsed+bx], ax
  8721                                  
  8722                                  ;-1022   pt=adrofname(GTop);
  8723                                  
  8724 00003BF3 FF36[3900]               push word [GTop]
  8725 00003BF7 E81ECD                   call adrofname
  8726 00003BFA 83C402                   add  sp, 2
  8727 00003BFD A3[4900]                 mov word [pt], ax
  8728                                  
  8729                                  ;-1023   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);
  8730                                  
  8731 00003C00 8B46FA                   mov ax, [bp-6]
  8732 00003C03 08C0                     or  al, al
  8733 00003C05 0F841200                 je .doglob482
  8734 00003C09 8D0696DE                 lea  ax, [doglobName]
  8735 00003C0D 50                       push ax
  8736 00003C0E FF36[4900]               push word [pt]
  8737 00003C12 E81BC6                   call strcpy
  8738 00003C15 83C404                   add  sp, 4
  8739 00003C18 E90F00                   jmp .doglob483
  8740                                  .doglob482:
  8741 00003C1B 8D06A36D                 lea  ax, [symbol]
  8742 00003C1F 50                       push ax
  8743 00003C20 FF36[4900]               push word [pt]
  8744 00003C24 E809C6                   call strcpy
  8745 00003C27 83C404                   add  sp, 4
  8746                                  
  8747                                  ;-1024   GTop++; expect(';'); }
  8748                                  
  8749                                  .doglob483:
  8750 00003C2A FF06[3900]               inc  word[GTop]
  8751 00003C2E 6A3B                     push 59
  8752 00003C30 E898D3                   call expect
  8753 00003C33 83C402                   add  sp, 2
  8754                                  
  8755                                  ;-1025 
  8756                                  
  8757                                  
  8758                                  ;-1026 unsigned int MAXUI=65535;
  8759 00003C36 C9                       LEAVE
  8760 00003C37 C3                       ret
  8761 00003C38 476C6F62616C207461-     doglob_0 db "Global table full",0
  8762 00003C41 626C652066756C6C00 
  8763 00003C4A 6E6F20564F49442061-     doglob_1 db "no VOID as var type",0
  8764 00003C53 732076617220747970-
  8765 00003C5C 6500               
  8766 00003C5E 5661726961626C6520-     doglob_2 db "Variable already defined",0
  8767 00003C67 616C72656164792064-
  8768 00003C70 6566696E656400     
  8769 00003C77 5C6E73656374696F6E-     doglob_3 db "\nsection .bss\nabsolute ",0
  8770 00003C80 202E6273735C6E6162-
  8771 00003C89 736F6C7574652000   
  8772 00003C91 5C6E00                  doglob_4 db "\n",0
  8773 00003C94 20726573622000          doglob_5 db " resb ",0
  8774 00003C9B 20726573772000          doglob_6 db " resw ",0
  8775 00003CA2 20726573642000          doglob_7 db " resd ",0
  8776 00003CA9 5C6E73656374696F6E-     doglob_8 db "\nsection .text",0
  8777 00003CB2 202E7465787400     
  8778 00003CB9 4F6E6C792042797465-     doglob_9 db "Only ByteArray allowed",0
  8779 00003CC2 417272617920616C6C-
  8780 00003CCB 6F77656400         
  8781 00003CD0 5C6E00                  doglob_10 db "\n",0
  8782 00003CD3 2064622000              doglob_11 db " db ",0
  8783 00003CD8 2C3000                  doglob_12 db ",0",0
  8784 00003CDB 537472696E67206F72-     doglob_13 db "String or number array expected",0
  8785 00003CE4 206E756D6265722061-
  8786 00003CED 727261792065787065-
  8787 00003CF6 6374656400         
  8788 00003CFB 5C6E00                  doglob_14 db "\n",0
  8789 00003CFE 2064772000              doglob_15 db " dw ",0
  8790 00003D03 2064622000              doglob_16 db " db ",0
  8791 00003D08 2064772000              doglob_17 db " dw ",0
  8792 00003D0D 2064642000              doglob_18 db " dd ",0
  8793                                  ENDP
  8794 00003D12 FFFF                    MAXUI dw 65535
  8795                                  
  8796                                  ;-1027 int epilog() {
  8797                                  
  8798                                  
  8799                                  epilog: PROC
  8800                                  
  8801                                  ;-1028     unsigned int i;
  8802                                  
  8803                                  
  8804                                  ;-1029     prs("\n;Input: "); prs(&namein);
  8805                                  ;
  8806 00003D14 C8020000                 ENTER  2,0
  8807 00003D18 68[883E]                 push epilog_0
  8808 00003D1B E8C8C6                   call prs
  8809 00003D1E 83C402                   add  sp, 2
  8810 00003D21 8D06666E                 lea  ax, [namein]
  8811 00003D25 50                       push ax
  8812 00003D26 E8BDC6                   call prs
  8813 00003D29 83C402                   add  sp, 2
  8814                                  
  8815                                  ;-1030     prs(", List: ");   prs(&namelst);
  8816                                  
  8817 00003D2C 68[933E]                 push epilog_1
  8818 00003D2F E8B4C6                   call prs
  8819 00003D32 83C402                   add  sp, 2
  8820 00003D35 8D06A96E                 lea  ax, [namelst]
  8821 00003D39 50                       push ax
  8822 00003D3A E8A9C6                   call prs
  8823 00003D3D 83C402                   add  sp, 2
  8824                                  
  8825                                  ;-1031     prs(",  Lines:"); printint51(lineno);
  8826                                  
  8827 00003D40 68[9C3E]                 push epilog_2
  8828 00003D43 E8A0C6                   call prs
  8829 00003D46 83C402                   add  sp, 2
  8830 00003D49 FF36[4700]               push word [lineno]
  8831 00003D4D E83DC8                   call printint51
  8832 00003D50 83C402                   add  sp, 2
  8833                                  
  8834                                  ;-1032     prs("\n;Glob. variables:"); GTop--; printint51(GTop);
  8835                                  
  8836 00003D53 68[A63E]                 push epilog_3
  8837 00003D56 E88DC6                   call prs
  8838 00003D59 83C402                   add  sp, 2
  8839 00003D5C FF0E[3900]               dec  word[GTop]
  8840 00003D60 FF36[3900]               push word [GTop]
  8841 00003D64 E826C8                   call printint51
  8842 00003D67 83C402                   add  sp, 2
  8843                                  
  8844                                  ;-1033     prs(" max.:"); printint51(LSTART);
  8845                                  
  8846 00003D6A 68[BA3E]                 push epilog_4
  8847 00003D6D E876C6                   call prs
  8848 00003D70 83C402                   add  sp, 2
  8849 00003D73 68C800                   push 200
  8850 00003D76 E814C8                   call printint51
  8851 00003D79 83C402                   add  sp, 2
  8852                                  
  8853                                  ;-1034     prs("\n;Functions      :"); printint51(FTop);
  8854                                  
  8855 00003D7C 68[C13E]                 push epilog_5
  8856 00003D7F E864C6                   call prs
  8857 00003D82 83C402                   add  sp, 2
  8858 00003D85 FF36[3D00]               push word [FTop]
  8859 00003D89 E801C8                   call printint51
  8860 00003D8C 83C402                   add  sp, 2
  8861                                  
  8862                                  ;-1035     prs(" max.:"); printint51(FUNCMAX);
  8863                                  
  8864 00003D8F 68[D53E]                 push epilog_6
  8865 00003D92 E851C6                   call prs
  8866 00003D95 83C402                   add  sp, 2
  8867 00003D98 682C01                   push 300
  8868 00003D9B E8EFC7                   call printint51
  8869 00003D9E 83C402                   add  sp, 2
  8870                                  
  8871                                  ;-1036     prs("\n;Calls          :"); printint51(CTop);
  8872                                  
  8873 00003DA1 68[DC3E]                 push epilog_7
  8874 00003DA4 E83FC6                   call prs
  8875 00003DA7 83C402                   add  sp, 2
  8876 00003DAA FF36[4300]               push word [CTop]
  8877 00003DAE E8DCC7                   call printint51
  8878 00003DB1 83C402                   add  sp, 2
  8879                                  
  8880                                  ;-1037     prs(" max.:"); printint51(CALLMAX);
  8881                                  
  8882 00003DB4 68[F03E]                 push epilog_8
  8883 00003DB7 E82CC6                   call prs
  8884 00003DBA 83C402                   add  sp, 2
  8885 00003DBD 68DC05                   push 1500
  8886 00003DC0 E8CAC7                   call printint51
  8887 00003DC3 83C402                   add  sp, 2
  8888                                  
  8889                                  ;-1038     i = CNamePtr - &CNameField;
  8890                                  
  8891 00003DC6 A1[3F00]                 mov ax, [CNamePtr]
  8892 00003DC9 2D68B6                   sub ax, CNameField
  8893 00003DCC 8946FE                   mov [bp-2], ax
  8894                                  
  8895                                  ;-1039     prs("\n;NameField      :"); printint51(i);
  8896                                  
  8897 00003DCF 68[F73E]                 push epilog_9
  8898 00003DD2 E811C6                   call prs
  8899 00003DD5 83C402                   add  sp, 2
  8900 00003DD8 FF76FE                   push word [bp-2]
  8901 00003DDB E8AFC7                   call printint51
  8902 00003DDE 83C402                   add  sp, 2
  8903                                  
  8904                                  ;-1040     prs(" max.:"); printint51(CNAMEMAX);
  8905                                  
  8906 00003DE1 68[0B3F]                 push epilog_10
  8907 00003DE4 E8FFC5                   call prs
  8908 00003DE7 83C402                   add  sp, 2
  8909 00003DEA 681027                   push 10000
  8910 00003DED E89DC7                   call printint51
  8911 00003DF0 83C402                   add  sp, 2
  8912                                  
  8913                                  ;-1041     prs("\n;Const in '"); prs(coname); prs("' :"); printint51(maxco);
  8914                                  
  8915 00003DF3 68[123F]                 push epilog_11
  8916 00003DF6 E8EDC5                   call prs
  8917 00003DF9 83C402                   add  sp, 2
  8918 00003DFC 8D06606D                 lea  ax, [coname]
  8919 00003E00 50                       push ax
  8920 00003E01 E8E2C5                   call prs
  8921 00003E04 83C402                   add  sp, 2
  8922 00003E07 68[203F]                 push epilog_12
  8923 00003E0A E8D9C5                   call prs
  8924 00003E0D 83C402                   add  sp, 2
  8925 00003E10 FF36[1400]               push word [maxco]
  8926 00003E14 E876C7                   call printint51
  8927 00003E17 83C402                   add  sp, 2
  8928                                  
  8929                                  ;-1042     prs(" max.:"); printint51(COMAX);
  8930                                  
  8931 00003E1A 68[243F]                 push epilog_13
  8932 00003E1D E8C6C5                   call prs
  8933 00003E20 83C402                   add  sp, 2
  8934 00003E23 68B80B                   push 3000
  8935 00003E26 E864C7                   call printint51
  8936 00003E29 83C402                   add  sp, 2
  8937                                  
  8938                                  ;-1043     i=COMAX; i=i-maxco;
  8939                                  
  8940 00003E2C B8B80B                   mov ax, 3000
  8941 00003E2F 8946FE                   mov [bp-2], ax
  8942 00003E32 8B46FE                   mov ax, [bp-2]
  8943 00003E35 2B06[1400]               sub ax, [maxco]
  8944 00003E39 8946FE                   mov [bp-2], ax
  8945                                  
  8946                                  ;-1044     if (i <= 1000)prs(" *** Warning *** constant area too small");
  8947                                  
  8948 00003E3C 8B46FE                   mov ax, [bp-2]
  8949 00003E3F 3DE803                   cmp ax, 1000
  8950 00003E42 0F870900                 ja  .epilog484
  8951 00003E46 68[2B3F]                 push epilog_14
  8952 00003E49 E89AC5                   call prs
  8953 00003E4C 83C402                   add  sp, 2
  8954                                  
  8955                                  ;-1045     prs(", stacksize: ");
  8956                                  
  8957                                  .epilog484:
  8958 00003E4F 68[543F]                 push epilog_15
  8959 00003E52 E891C5                   call prs
  8960 00003E55 83C402                   add  sp, 2
  8961                                  
  8962                                  ;-1046     i=MAXUI-orgData; printint51(i);
  8963                                  
  8964 00003E58 A1[123D]                 mov ax, [MAXUI]
  8965 00003E5B 2B06[1200]               sub ax, [orgData]
  8966 00003E5F 8946FE                   mov [bp-2], ax
  8967 00003E62 FF76FE                   push word [bp-2]
  8968 00003E65 E825C7                   call printint51
  8969 00003E68 83C402                   add  sp, 2
  8970                                  
  8971                                  ;-1047     if (i <= 1000) prs(" *** Warning *** Stack too small");
  8972                                  
  8973 00003E6B 8B46FE                   mov ax, [bp-2]
  8974 00003E6E 3DE803                   cmp ax, 1000
  8975 00003E71 0F870900                 ja  .epilog485
  8976 00003E75 68[623F]                 push epilog_16
  8977 00003E78 E86BC5                   call prs
  8978 00003E7B 83C402                   add  sp, 2
  8979                                  
  8980                                  ;-1048   end1(0);}
  8981                                  
  8982                                  .epilog485:
  8983 00003E7E 6A00                     push 0
  8984 00003E80 E861C7                   call end1
  8985 00003E83 83C402                   add  sp, 2
  8986                                  
  8987                                  ;-1049 
  8988                                  
  8989                                  
  8990                                  ;-1050 int dodefine() {
  8991 00003E86 C9                       LEAVE
  8992 00003E87 C3                       ret
  8993 00003E88 5C6E3B496E7075743A-     epilog_0 db "\n;Input: ",0
  8994 00003E91 2000               
  8995 00003E93 2C204C6973743A2000      epilog_1 db ", List: ",0
  8996 00003E9C 2C20204C696E65733A-     epilog_2 db ",  Lines:",0
  8997 00003EA5 00                 
  8998 00003EA6 5C6E3B476C6F622E20-     epilog_3 db "\n;Glob. variables:",0
  8999 00003EAF 7661726961626C6573-
  9000 00003EB8 3A00               
  9001 00003EBA 206D61782E3A00          epilog_4 db " max.:",0
  9002 00003EC1 5C6E3B46756E637469-     epilog_5 db "\n;Functions      :",0
  9003 00003ECA 6F6E73202020202020-
  9004 00003ED3 3A00               
  9005 00003ED5 206D61782E3A00          epilog_6 db " max.:",0
  9006 00003EDC 5C6E3B43616C6C7320-     epilog_7 db "\n;Calls          :",0
  9007 00003EE5 202020202020202020-
  9008 00003EEE 3A00               
  9009 00003EF0 206D61782E3A00          epilog_8 db " max.:",0
  9010 00003EF7 5C6E3B4E616D654669-     epilog_9 db "\n;NameField      :",0
  9011 00003F00 656C64202020202020-
  9012 00003F09 3A00               
  9013 00003F0B 206D61782E3A00          epilog_10 db " max.:",0
  9014 00003F12 5C6E3B436F6E737420-     epilog_11 db "\n;Const in '",0
  9015 00003F1B 696E202700         
  9016 00003F20 27203A00                epilog_12 db "' :",0
  9017 00003F24 206D61782E3A00          epilog_13 db " max.:",0
  9018 00003F2B 202A2A2A205761726E-     epilog_14 db " *** Warning *** constant area too small",0
  9019 00003F34 696E67202A2A2A2063-
  9020 00003F3D 6F6E7374616E742061-
  9021 00003F46 72656120746F6F2073-
  9022 00003F4F 6D616C6C00         
  9023 00003F54 2C20737461636B7369-     epilog_15 db ", stacksize: ",0
  9024 00003F5D 7A653A2000         
  9025 00003F62 202A2A2A205761726E-     epilog_16 db " *** Warning *** Stack too small",0
  9026 00003F6B 696E67202A2A2A2053-
  9027 00003F74 7461636B20746F6F20-
  9028 00003F7D 736D616C6C00       
  9029                                  ENDP
  9030                                  
  9031                                  dodefine: PROC
  9032                                  
  9033                                  ;-1051     int i; int j; int fdtemp;
  9034                                  
  9035                                  
  9036                                  ;-1052     if (eqstr(symbol, "ORGDATA")) {
  9037                                  ;
  9038 00003F83 C8060000                 ENTER  6,0
  9039 00003F87 68[6D40]                 push dodefine_0
  9040 00003F8A 8D06A36D                 lea  ax, [symbol]
  9041 00003F8E 50                       push ax
  9042 00003F8F E8D4C2                   call eqstr
  9043 00003F92 83C404                   add  sp, 4
  9044 00003F95 08C0                     or  al, al
  9045 00003F97 0F841500                 je .dodefine486
  9046                                  
  9047                                  ;-1053         token=getlex();
  9048                                  
  9049 00003F9B E88CCA                   call getlex
  9050 00003F9E A3[1E00]                 mov word [token], ax
  9051                                  
  9052                                  ;-1054         ORGDATAORIG=lexval;
  9053                                  
  9054 00003FA1 A1[2C00]                 mov ax, [lexval]
  9055 00003FA4 A3[1000]                 mov word [ORGDATAORIG], ax
  9056                                  
  9057                                  ;-1055         orgData=lexval;
  9058                                  
  9059 00003FA7 A1[2C00]                 mov ax, [lexval]
  9060 00003FAA A3[1200]                 mov word [orgData], ax
  9061                                  
  9062                                  ;-1056         return;
  9063                                  
  9064 00003FAD E9BB00                   jmp .retndodefine
  9065                                  
  9066                                  ;-1057     }
  9067                                  
  9068                                  
  9069                                  ;-1058     expect(T_NAME);
  9070                                  
  9071                                  .dodefine486:
  9072 00003FB0 680001                   push 256
  9073 00003FB3 E815D0                   call expect
  9074 00003FB6 83C402                   add  sp, 2
  9075                                  
  9076                                  ;-1059     if (token==T_CONST) {
  9077                                  
  9078 00003FB9 A1[1E00]                 mov ax, [token]
  9079 00003FBC 3D0101                   cmp ax, 257
  9080 00003FBF 0F85A800                 jne .dodefine487
  9081                                  
  9082                                  ;-1060         if (GTop >= LSTART) error1("global table (define) full");
  9083                                  
  9084 00003FC3 A1[3900]                 mov ax, [GTop]
  9085 00003FC6 3DC800                   cmp ax, 200 ;unsigned : 1
  9086 00003FC9 0F8C0900                 jl  .dodefine488
  9087 00003FCD 68[7540]                 push dodefine_1
  9088 00003FD0 E834C6                   call error1
  9089 00003FD3 83C402                   add  sp, 2
  9090                                  
  9091                                  ;-1061         i=strlen(symbol);
  9092                                  
  9093                                  .dodefine488:
  9094 00003FD6 8D06A36D                 lea  ax, [symbol]
  9095 00003FDA 50                       push ax
  9096 00003FDB E82AC2                   call strlen
  9097 00003FDE 83C402                   add  sp, 2
  9098 00003FE1 8946FE                   mov [bp-2], ax
  9099                                  
  9100                                  ;-1062         if (i>15) error1("Define name longer 15 char");
  9101                                  
  9102 00003FE4 8B46FE                   mov ax, [bp-2]
  9103 00003FE7 83F80F                   cmp ax, 15
  9104 00003FEA 0F8E0900                 jle .dodefine489
  9105 00003FEE 68[9040]                 push dodefine_2
  9106 00003FF1 E813C6                   call error1
  9107 00003FF4 83C402                   add  sp, 2
  9108                                  
  9109                                  ;-1063         GSign [GTop]='U';
  9110                                  
  9111                                  .dodefine489:
  9112 00003FF7 B85500                   mov ax, 85
  9113 00003FFA 8B1E[3900]               mov bx, [GTop]
  9114 00003FFE 88871870                 mov [GSign+bx], al
  9115                                  
  9116                                  ;-1064         GWidth[GTop]=1;
  9117                                  
  9118 00004002 B80100                   mov ax, 1
  9119 00004005 8B1E[3900]               mov bx, [GTop]
  9120 00004009 88874471                 mov [GWidth+bx], al
  9121                                  
  9122                                  ;-1065         GType [GTop]='#';
  9123                                  
  9124 0000400D B82300                   mov ax, 35
  9125 00004010 8B1E[3900]               mov bx, [GTop]
  9126 00004014 8887EC6E                 mov [GType+bx], al
  9127                                  
  9128                                  ;-1066         GAdr [GTop]=lineno-1;
  9129                                  
  9130 00004018 A1[4700]                 mov ax, [lineno]
  9131 0000401B 83E801                   sub ax, 1
  9132 0000401E 8B1E[3900]               mov bx, [GTop]
  9133 00004022 D1E3                     shl bx, 1
  9134 00004024 89877072                 mov [GAdr+bx], ax
  9135                                  
  9136                                  ;-1067         GUsed [GTop]=0;
  9137                                  
  9138 00004028 B80000                   mov ax, 0
  9139 0000402B 8B1E[3900]               mov bx, [GTop]
  9140 0000402F D1E3                     shl bx, 1
  9141 00004031 8987C874                 mov [GUsed+bx], ax
  9142                                  
  9143                                  ;-1068         pt=adrofname(GTop);
  9144                                  
  9145 00004035 FF36[3900]               push word [GTop]
  9146 00004039 E8DCC8                   call adrofname
  9147 0000403C 83C402                   add  sp, 2
  9148 0000403F A3[4900]                 mov word [pt], ax
  9149                                  
  9150                                  ;-1069         strcpy(pt, symbol);
  9151                                  
  9152 00004042 8D06A36D                 lea  ax, [symbol]
  9153 00004046 50                       push ax
  9154 00004047 FF36[4900]               push word [pt]
  9155 0000404B E8E2C1                   call strcpy
  9156 0000404E 83C404                   add  sp, 4
  9157                                  
  9158                                  ;-1070         GData[GTop]=lexval;
  9159                                  
  9160 00004051 A1[2C00]                 mov ax, [lexval]
  9161 00004054 8B1E[3900]               mov bx, [GTop]
  9162 00004058 D1E3                     shl bx, 1
  9163 0000405A 89872077                 mov [GData+bx], ax
  9164                                  
  9165                                  ;-1071         expect(T_CONST);
  9166                                  
  9167 0000405E 680101                   push 257
  9168 00004061 E867CF                   call expect
  9169 00004064 83C402                   add  sp, 2
  9170                                  
  9171                                  ;-1072         GTop++;
  9172                                  
  9173 00004067 FF06[3900]               inc  word[GTop]
  9174                                  
  9175                                  ;-1073     }
  9176                                  
  9177                                  
  9178                                  ;-1074 }
  9179                                  
  9180                                  .dodefine487:
  9181                                  
  9182                                  ;-1075 
  9183                                  
  9184                                  
  9185                                  ;-1076 int parse() {
  9186                                  
  9187 0000406B C9                       .retndodefine: LEAVE
  9188 0000406C C3                       ret
  9189 0000406D 4F52474441544100        dodefine_0 db "ORGDATA",0
  9190 00004075 676C6F62616C207461-     dodefine_1 db "global table (define) full",0
  9191 0000407E 626C65202864656669-
  9192 00004087 6E65292066756C6C00 
  9193 00004090 446566696E65206E61-     dodefine_2 db "Define name longer 15 char",0
  9194 00004099 6D65206C6F6E676572-
  9195 000040A2 203135206368617200 
  9196                                  ENDP
  9197                                  
  9198                                  parse: PROC
  9199                                  
  9200                                  ;-1077     CNamePtr = &CNameField;
  9201                                  
  9202 000040AB B868B6                   mov ax, CNameField
  9203 000040AE A3[3F00]                 mov word [CNamePtr], ax
  9204                                  
  9205                                  ;-1078     token=getlex();
  9206                                  
  9207 000040B1 E876C9                   call getlex
  9208 000040B4 A3[1E00]                 mov word [token], ax
  9209                                  
  9210                                  ;-1079     do {
  9211                                  
  9212                                  .parse490:
  9213                                  
  9214                                  ;-1080         if (token <= 0) return 1;
  9215                                  
  9216 000040B7 A1[1E00]                 mov ax, [token]
  9217 000040BA 83F800                   cmp ax, 0
  9218 000040BD 0F8F0600                 jg  .parse491
  9219 000040C1 B80100                   mov ax, 1
  9220 000040C4 E95000                   jmp .retnparse
  9221                                  
  9222                                  ;-1081         if (istoken('#')) {
  9223                                  
  9224                                  .parse491:
  9225 000040C7 6A23                     push 35
  9226 000040C9 E8DDCE                   call istoken
  9227 000040CC 83C402                   add  sp, 2
  9228 000040CF 08C0                     or  al, al
  9229 000040D1 0F842100                 je .parse492
  9230                                  
  9231                                  ;-1082              if (istoken(T_DEFINE))  dodefine();
  9232                                  
  9233 000040D5 68FF01                   push 511
  9234 000040D8 E8CECE                   call istoken
  9235 000040DB 83C402                   add  sp, 2
  9236 000040DE 08C0                     or  al, al
  9237 000040E0 0F840600                 je .parse493
  9238 000040E4 E89CFE                   call dodefine
  9239                                  
  9240                                  ;-1083              else error1("define expected");
  9241                                  
  9242 000040E7 E90900                   jmp .parse494
  9243                                  .parse493:
  9244 000040EA 68[1841]                 push parse_0
  9245 000040ED E817C5                   call error1
  9246 000040F0 83C402                   add  sp, 2
  9247                                  
  9248                                  ;-1084         }
  9249                                  
  9250                                  .parse494:
  9251                                  
  9252                                  ;-1085     else{
  9253                                  
  9254 000040F3 E91600                   jmp .parse495
  9255                                  .parse492:
  9256                                  
  9257                                  ;-1086         typeName();
  9258                                  
  9259 000040F6 E8BFD0                   call typeName
  9260                                  
  9261                                  ;-1087         if (token=='(') dofunc();
  9262                                  
  9263 000040F9 A1[1E00]                 mov ax, [token]
  9264 000040FC 83F828                   cmp ax, 40
  9265 000040FF 0F850600                 jne .parse496
  9266 00004103 E844F5                   call dofunc
  9267                                  
  9268                                  ;-1088         else doglob(); }
  9269                                  
  9270 00004106 E90300                   jmp .parse497
  9271                                  .parse496:
  9272 00004109 E8D7F7                   call doglob
  9273                                  .parse497:
  9274                                  
  9275                                  ;-1089     } while(1);
  9276                                  
  9277                                  .parse495:
  9278 0000410C B80100                   mov ax, 1
  9279 0000410F 08C0                     or  al, al
  9280 00004111 0F840200                 je .parse498
  9281 00004115 EBA0                     jmp .parse490
  9282                                  .parse498:
  9283                                  
  9284                                  ;-1090 }
  9285                                  
  9286                                  
  9287                                  ;-1091 
  9288                                  
  9289                                  
  9290                                  ;-1092 int getfirstchar() {
  9291                                  
  9292                                   .retnparse:
  9293 00004117 C3                       ret
  9294 00004118 646566696E65206578-     parse_0 db "define expected",0
  9295 00004121 70656374656400     
  9296                                  ENDP
  9297                                  
  9298                                  getfirstchar: PROC
  9299                                  
  9300                                  ;-1093     fgetsp=&fgetsdest;
  9301                                  
  9302 00004128 B888DD                   mov ax, fgetsdest
  9303 0000412B A3[4500]                 mov word [fgetsp], ax
  9304                                  
  9305                                  ;-1094     *fgetsp=0;
  9306                                  
  9307 0000412E B80000                   mov ax, 0
  9308 00004131 8B1E[4500]               mov  bx, [fgetsp]
  9309 00004135 8807                     mov  [bx], al
  9310                                  
  9311                                  ;-1095     thechar=fgets1();
  9312                                  
  9313 00004137 E852C6                   call fgets1
  9314 0000413A A2[2300]                 mov byte [thechar], al
  9315                                  
  9316                                  ;-1096     }
  9317                                  
  9318                                  
  9319                                  ;-1097 
  9320                                  
  9321                                  
  9322                                  ;-1098 char *arglen=0x80; char *argv=0x82;
  9323                                  
  9324 0000413D C3                       ret
  9325                                  ENDP
  9326 0000413E 8000                    arglen dw 128
  9327 00004140 8200                    argv dw 130
  9328                                  
  9329                                  ;-1099 int getarg() {
  9330                                  
  9331                                  
  9332                                  getarg: PROC
  9333                                  
  9334                                  ;-1100     int arglen1; int i; char *c;
  9335                                  
  9336                                  
  9337                                  ;-1101     arglen1=*arglen;
  9338                                  ;
  9339 00004142 C8060000                 ENTER  6,0
  9340 00004146 8B1E[3E41]               mov bx, [arglen]
  9341 0000414A 8A07                     mov al, [bx]
  9342 0000414C B400                     mov ah, 0
  9343 0000414E 8946FE                   mov [bp-2], ax
  9344                                  
  9345                                  ;-1102     if (arglen1 == 0) {
  9346                                  
  9347 00004151 8B46FE                   mov ax, [bp-2]
  9348 00004154 83F800                   cmp ax, 0
  9349 00004157 0F851C00                 jne .getarg499
  9350                                  
  9351                                  ;-1103         cputs(Version1);
  9352                                  
  9353 0000415B 8D06[0300]               lea  ax, [Version1]
  9354 0000415F 50                       push ax
  9355 00004160 E817BF                   call cputs
  9356 00004163 83C402                   add  sp, 2
  9357                                  
  9358                                  ;-1104         cputs(" Usage: A.COM in_file[.C]: ");
  9359                                  
  9360 00004166 68[A542]                 push getarg_0
  9361 00004169 E80EBF                   call cputs
  9362 0000416C 83C402                   add  sp, 2
  9363                                  
  9364                                  ;-1105         exitR(3);
  9365                                  
  9366 0000416F 6A03                     push 3
  9367 00004171 E878BF                   call exitR
  9368 00004174 83C402                   add  sp, 2
  9369                                  
  9370                                  ;-1106         }
  9371                                  
  9372                                  
  9373                                  ;-1107     i=arglen1+129;
  9374                                  
  9375                                  .getarg499:
  9376 00004177 8B46FE                   mov ax, [bp-2]
  9377 0000417A 058100                   add ax, 129
  9378 0000417D 8946FC                   mov [bp-4], ax
  9379                                  
  9380                                  ;-1108     *i=0;
  9381                                  
  9382 00004180 B80000                   mov ax, 0
  9383 00004183 8B5EFC                   mov  bx, [bp-4]
  9384 00004186 8907                     mov  [bx], ax
  9385                                  
  9386                                  ;-1109     arglen1--;
  9387                                  
  9388 00004188 FF4EFE                   dec  word[bp-2]
  9389                                  
  9390                                  ;-1110     toupper(argv);
  9391                                  
  9392 0000418B FF36[4041]               push word [argv]
  9393 0000418F E845C1                   call toupper
  9394 00004192 83C402                   add  sp, 2
  9395                                  
  9396                                  ;-1111     strcpy(namein, argv);
  9397                                  
  9398 00004195 FF36[4041]               push word [argv]
  9399 00004199 8D06666E                 lea  ax, [namein]
  9400 0000419D 50                       push ax
  9401 0000419E E88FC0                   call strcpy
  9402 000041A1 83C404                   add  sp, 4
  9403                                  
  9404                                  ;-1112     if (instr1(namein, '.') == 0) strcat1(namein, ".C");
  9405                                  
  9406 000041A4 6A2E                     push 46
  9407 000041A6 8D06666E                 lea  ax, [namein]
  9408 000041AA 50                       push ax
  9409 000041AB E86CC1                   call instr1
  9410 000041AE 83C404                   add  sp, 4
  9411 000041B1 83F800                   cmp ax, 0
  9412 000041B4 0F850E00                 jne .getarg500
  9413 000041B8 68[C142]                 push getarg_1
  9414 000041BB 8D06666E                 lea  ax, [namein]
  9415 000041BF 50                       push ax
  9416 000041C0 E8EFC0                   call strcat1
  9417 000041C3 83C404                   add  sp, 4
  9418                                  
  9419                                  ;-1113     strcpy(namelst, namein);
  9420                                  
  9421                                  .getarg500:
  9422 000041C6 8D06666E                 lea  ax, [namein]
  9423 000041CA 50                       push ax
  9424 000041CB 8D06A96E                 lea  ax, [namelst]
  9425 000041CF 50                       push ax
  9426 000041D0 E85DC0                   call strcpy
  9427 000041D3 83C404                   add  sp, 4
  9428                                  
  9429                                  ;-1114     i=strlen(namelst);
  9430                                  
  9431 000041D6 8D06A96E                 lea  ax, [namelst]
  9432 000041DA 50                       push ax
  9433 000041DB E82AC0                   call strlen
  9434 000041DE 83C402                   add  sp, 2
  9435 000041E1 8946FC                   mov [bp-4], ax
  9436                                  
  9437                                  ;-1115     i--;
  9438                                  
  9439 000041E4 FF4EFC                   dec  word[bp-4]
  9440                                  
  9441                                  ;-1116     c=&namelst+i;
  9442                                  
  9443 000041E7 B8A96E                   mov ax, namelst
  9444 000041EA 0346FC                   add ax, [bp-4]
  9445 000041ED 8946FA                   mov [bp-6], ax
  9446                                  
  9447                                  ;-1117     *c='S';
  9448                                  
  9449 000041F0 B85300                   mov ax, 83
  9450 000041F3 8B5EFA                   mov  bx, [bp-6]
  9451 000041F6 8807                     mov  [bx], al
  9452                                  
  9453                                  ;-1118 
  9454                                  
  9455                                  
  9456                                  ;-1119     fdin=openR (namein);
  9457                                  
  9458 000041F8 8D06666E                 lea  ax, [namein]
  9459 000041FC 50                       push ax
  9460 000041FD E8BCBE                   call openR
  9461 00004200 83C402                   add  sp, 2
  9462 00004203 A3[1A00]                 mov word [fdin], ax
  9463                                  
  9464                                  ;-1120     if(DOS_ERR){
  9465                                  
  9466 00004206 A1[4D00]                 mov ax, [DOS_ERR]
  9467 00004209 08C0                     or  al, al
  9468 0000420B 0F841C00                 je .getarg501
  9469                                  
  9470                                  ;-1121         cputs("Source file missing (.C): ");
  9471                                  
  9472 0000420F 68[C442]                 push getarg_2
  9473 00004212 E865BE                   call cputs
  9474 00004215 83C402                   add  sp, 2
  9475                                  
  9476                                  ;-1122         cputs(namein);
  9477                                  
  9478 00004218 8D06666E                 lea  ax, [namein]
  9479 0000421C 50                       push ax
  9480 0000421D E85ABE                   call cputs
  9481 00004220 83C402                   add  sp, 2
  9482                                  
  9483                                  ;-1123         exitR(1);
  9484                                  
  9485 00004223 6A01                     push 1
  9486 00004225 E8C4BE                   call exitR
  9487 00004228 83C402                   add  sp, 2
  9488                                  
  9489                                  ;-1124         }
  9490                                  
  9491                                  
  9492                                  ;-1125     fdout=creatR(namelst);
  9493                                  
  9494                                  .getarg501:
  9495 0000422B 8D06A96E                 lea  ax, [namelst]
  9496 0000422F 50                       push ax
  9497 00004230 E898BE                   call creatR
  9498 00004233 83C402                   add  sp, 2
  9499 00004236 A3[1C00]                 mov word [fdout], ax
  9500                                  
  9501                                  ;-1126     if(DOS_ERR){
  9502                                  
  9503 00004239 A1[4D00]                 mov ax, [DOS_ERR]
  9504 0000423C 08C0                     or  al, al
  9505 0000423E 0F841C00                 je .getarg502
  9506                                  
  9507                                  ;-1127         cputs("list file not creatable: ");
  9508                                  
  9509 00004242 68[DF42]                 push getarg_3
  9510 00004245 E832BE                   call cputs
  9511 00004248 83C402                   add  sp, 2
  9512                                  
  9513                                  ;-1128         cputs(namelst);
  9514                                  
  9515 0000424B 8D06A96E                 lea  ax, [namelst]
  9516 0000424F 50                       push ax
  9517 00004250 E827BE                   call cputs
  9518 00004253 83C402                   add  sp, 2
  9519                                  
  9520                                  ;-1129         exitR(2);
  9521                                  
  9522 00004256 6A02                     push 2
  9523 00004258 E891BE                   call exitR
  9524 0000425B 83C402                   add  sp, 2
  9525                                  
  9526                                  ;-1130         }
  9527                                  
  9528                                  
  9529                                  ;-1131     prs("\n; ");
  9530                                  
  9531                                  .getarg502:
  9532 0000425E 68[F942]                 push getarg_4
  9533 00004261 E882C1                   call prs
  9534 00004264 83C402                   add  sp, 2
  9535                                  
  9536                                  ;-1132     prs(Version1);
  9537                                  
  9538 00004267 8D06[0300]               lea  ax, [Version1]
  9539 0000426B 50                       push ax
  9540 0000426C E877C1                   call prs
  9541 0000426F 83C402                   add  sp, 2
  9542                                  
  9543                                  ;-1133     prs(", Source: "); prs(namein);
  9544                                  
  9545 00004272 68[FE42]                 push getarg_5
  9546 00004275 E86EC1                   call prs
  9547 00004278 83C402                   add  sp, 2
  9548 0000427B 8D06666E                 lea  ax, [namein]
  9549 0000427F 50                       push ax
  9550 00004280 E863C1                   call prs
  9551 00004283 83C402                   add  sp, 2
  9552                                  
  9553                                  ;-1134     prs(", Output asm: "); prs(namelst);
  9554                                  
  9555 00004286 68[0943]                 push getarg_6
  9556 00004289 E85AC1                   call prs
  9557 0000428C 83C402                   add  sp, 2
  9558 0000428F 8D06A96E                 lea  ax, [namelst]
  9559 00004293 50                       push ax
  9560 00004294 E84FC1                   call prs
  9561 00004297 83C402                   add  sp, 2
  9562                                  
  9563                                  ;-1135     prs("\norg  256 \njmp main");
  9564                                  
  9565 0000429A 68[1843]                 push getarg_7
  9566 0000429D E846C1                   call prs
  9567 000042A0 83C402                   add  sp, 2
  9568                                  
  9569                                  ;-1136 }
  9570                                  
  9571                                  
  9572                                  ;-1137 
  9573                                  
  9574                                  
  9575                                  ;-1138 int main() {
  9576 000042A3 C9                       LEAVE
  9577 000042A4 C3                       ret
  9578 000042A5 2055736167653A2041-     getarg_0 db " Usage: A.COM in_file[.C]: ",0
  9579 000042AE 2E434F4D20696E5F66-
  9580 000042B7 696C655B2E435D3A20-
  9581 000042C0 00                 
  9582 000042C1 2E4300                  getarg_1 db ".C",0
  9583 000042C4 536F75726365206669-     getarg_2 db "Source file missing (.C): ",0
  9584 000042CD 6C65206D697373696E-
  9585 000042D6 6720282E43293A2000 
  9586 000042DF 6C6973742066696C65-     getarg_3 db "list file not creatable: ",0
  9587 000042E8 206E6F742063726561-
  9588 000042F1 7461626C653A2000   
  9589 000042F9 5C6E3B2000              getarg_4 db "\n; ",0
  9590 000042FE 2C20536F757263653A-     getarg_5 db ", Source: ",0
  9591 00004307 2000               
  9592 00004309 2C204F757470757420-     getarg_6 db ", Output asm: ",0
  9593 00004312 61736D3A2000       
  9594 00004318 5C6E6F726720203235-     getarg_7 db "\norg  256 \njmp main",0
  9595 00004321 36205C6E6A6D70206D-
  9596 0000432A 61696E00           
  9597                                  ENDP
  9598                                  
  9599                                  main: PROC
  9600                                  
  9601                                  ;-1139     getarg();
  9602                                  
  9603 0000432E E811FE                   call getarg
  9604                                  
  9605                                  ;-1140     CNameTop=0;
  9606                                  
  9607 00004331 B80000                   mov ax, 0
  9608 00004334 A3[4100]                 mov word [CNameTop], ax
  9609                                  
  9610                                  ;-1141     coname=0;
  9611                                  
  9612 00004337 B80000                   mov ax, 0
  9613 0000433A A2606D                   mov byte [coname], al
  9614                                  
  9615                                  ;-1142     orgData=ORGDATAORIG;
  9616                                  
  9617 0000433D A1[1000]                 mov ax, [ORGDATAORIG]
  9618 00004340 A3[1200]                 mov word [orgData], ax
  9619                                  
  9620                                  ;-1143     getfirstchar();
  9621                                  
  9622 00004343 E8E2FD                   call getfirstchar
  9623                                  
  9624                                  ;-1144     parse();
  9625                                  
  9626 00004346 E862FD                   call parse
  9627                                  
  9628                                  ;-1145   epilog();
  9629                                  
  9630 00004349 E8C8F9                   call epilog
  9631                                  
  9632                                  ;-1146 }
  9633                                  
  9634 0000434C C3                       ret
  9635                                  ENDP
  9636                                  ;Input: A.C, List: A.S,  Lines: 1147
  9637                                  ;Glob. variables:  117 max.:  200
  9638                                  ;Functions      :   87 max.:  300
  9639                                  ;Calls          :  782 max.: 1500
  9640                                  ;NameField      : 4974 max.:10000
  9641                                  ;Const in 'checkreg' :  712 max.: 3000, stacksize:  8538
