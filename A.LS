     1                                  
     2                                  ; A.COM V0.9.3, Source: A.C, Output asm: A.S
     3                                  org  256 
     4 00000000 E9CF3D                  jmp main
     5                                  
     6                                  ;-1 char Version1[]="A.COM V0.9.3";//todo: 2. op=reg not recognized
     7                                  
     8 00000003 412E434F4D2056302E-     Version1 db "A.COM V0.9.3",0
     9 0000000C 392E3300           
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
   199                                  ;-54 int column=0;
   200                                  
   201 00000020 0000                    column dw 0
   202                                  
   203                                  ;-55 char thechar=0;   //reads one char forward
   204                                  
   205 00000022 00                      thechar db 0
   206                                  
   207                                  ;-56 int iscmp=0;
   208                                  
   209 00000023 0000                    iscmp dw 0
   210                                  
   211                                  ;-57 int nconst=0;
   212                                  
   213 00000025 0000                    nconst dw 0
   214                                  
   215                                  ;-58 int nreturn=0;
   216                                  
   217 00000027 0000                    nreturn dw 0
   218                                  
   219                                  ;-59 int nlabel=0;
   220                                  
   221 00000029 0000                    nlabel dw 0
   222                                  
   223                                  ;-60 unsigned int lexval=0;
   224                                  
   225 0000002B 0000                    lexval dw 0
   226                                  
   227                                  ;-61 int typei;       char istype;
   228                                  
   229 0000002D 0000                    typei dw 0
   230 0000002F 00                      istype db 0
   231                                  
   232                                  ;-62 int signi;       char issign;
   233                                  
   234 00000030 0000                    signi dw 0
   235 00000032 00                      issign db 0
   236                                  
   237                                  ;-63 int widthi;      char iswidth;
   238                                  
   239 00000033 0000                    widthi dw 0
   240 00000035 00                      iswidth db 0
   241                                  
   242                                  ;-64 int wi=0;
   243                                  
   244 00000036 0000                    wi dw 0
   245                                  
   246                                  ;-65 #define VARMAX        300//max global and local var
   247                                  
   248                                  
   249                                  ;-66 #define LSTART        200//max global var
   250                                  
   251                                  
   252                                  ;-67 #define GNAMEMAX     4800// 16*VARMAX
   253                                  
   254                                  
   255                                  ;-68 char GType [VARMAX]; // 0=V, 1=*, 2=&,#
   256                                  
   257                                  section .bss
   258                                  absolute 28396
   259 00006EEC <res 0000012C>          GType resb 300
   260                                  section .text
   261                                  
   262                                  ;-69 char GSign [VARMAX]; // 0=U, 1=S
   263                                  
   264                                  section .bss
   265                                  absolute 28696
   266 00007018 <res 0000012C>          GSign resb 300
   267                                  section .text
   268                                  
   269                                  ;-70 char GWidth[VARMAX]; // 0, 1, 2, 4
   270                                  
   271                                  section .bss
   272                                  absolute 28996
   273 00007144 <res 0000012C>          GWidth resb 300
   274                                  section .text
   275                                  
   276                                  ;-71 int GAdr  [VARMAX];
   277                                  
   278                                  section .bss
   279                                  absolute 29296
   280 00007270 <res 00000258>          GAdr resw 300
   281                                  section .text
   282                                  
   283                                  ;-72 int GUsed [VARMAX];
   284                                  
   285                                  section .bss
   286                                  absolute 29896
   287 000074C8 <res 00000258>          GUsed resw 300
   288                                  section .text
   289                                  
   290                                  ;-73 int GData [VARMAX];
   291                                  
   292                                  section .bss
   293                                  absolute 30496
   294 00007720 <res 00000258>          GData resw 300
   295                                  section .text
   296                                  
   297                                  ;-74 char GNameField[GNAMEMAX];
   298                                  
   299                                  section .bss
   300                                  absolute 31096
   301 00007978 <res 000012C0>          GNameField resb 4800
   302                                  section .text
   303                                  
   304                                  ;-75 int GTop=1;
   305                                  
   306 00000038 0100                    GTop dw 1
   307                                  
   308                                  ;-76 int LTop=LSTART;
   309                                  
   310 0000003A C800                    LTop dw 200
   311                                  
   312                                  ;-77 #define FUNCMAX       300//max functions
   313                                  
   314                                  
   315                                  ;-78 #define FNAMEMAX     4800// 16*FUNCMAX
   316                                  
   317                                  
   318                                  ;-79 char FType [FUNCMAX];
   319                                  
   320                                  section .bss
   321                                  absolute 35896
   322 00008C38 <res 0000012C>          FType resb 300
   323                                  section .text
   324                                  
   325                                  ;-80 int  FAdr  [FUNCMAX];
   326                                  
   327                                  section .bss
   328                                  absolute 36196
   329 00008D64 <res 00000258>          FAdr resw 300
   330                                  section .text
   331                                  
   332                                  ;-81 int  FCalls[FUNCMAX];
   333                                  
   334                                  section .bss
   335                                  absolute 36796
   336 00008FBC <res 00000258>          FCalls resw 300
   337                                  section .text
   338                                  
   339                                  ;-82 char FNameField[FNAMEMAX];
   340                                  
   341                                  section .bss
   342                                  absolute 37396
   343 00009214 <res 000012C0>          FNameField resb 4800
   344                                  section .text
   345                                  
   346                                  ;-83 int  FTop=0;
   347                                  
   348 0000003C 0000                    FTop dw 0
   349                                  
   350                                  ;-84 char fgetsdest[COLUMNMAX];
   351                                  
   352                                  section .bss
   353                                  absolute 42196
   354 0000A4D4 <res 00000080>          fgetsdest resb 128
   355                                  section .text
   356                                  
   357                                  ;-85 unsigned char *fgetsp=0;
   358                                  
   359 0000003E 0000                    fgetsp dw 0
   360                                  
   361                                  ;-86 unsigned int lineno=1;
   362                                  
   363 00000040 0100                    lineno dw 1
   364                                  
   365                                  ;-87 unsigned char *pt=0;
   366                                  
   367 00000042 0000                    pt dw 0
   368                                  
   369                                  ;-88 unsigned char *p1=0;
   370                                  
   371 00000044 0000                    p1 dw 0
   372                                  
   373                                  ;-89 int DOS_ERR=0;
   374                                  
   375 00000046 0000                    DOS_ERR dw 0
   376                                  
   377                                  ;-90 int DOS_NoBytes=0;
   378                                  
   379 00000048 0000                    DOS_NoBytes dw 0
   380                                  
   381                                  ;-91 char DOS_ByteRead=0;
   382                                  
   383 0000004A 00                      DOS_ByteRead db 0
   384                                  
   385                                  ;-92 int ireg1;
   386                                  
   387 0000004B 0000                    ireg1 dw 0
   388                                  
   389                                  ;-93 int mod2;
   390                                  
   391 0000004D 0000                    mod2 dw 0
   392                                  
   393                                  ;-94 int ireg2;
   394                                  
   395 0000004F 0000                    ireg2 dw 0
   396                                  
   397                                  ;-95 
   398                                  
   399                                  
   400                                  ;-96 int writetty()     { ah=0x0E; bx=0; __emit__(0xCD,0x10); }
   401                                  
   402                                  
   403                                  writetty: PROC
   404 00000051 B40E                     mov  ah, 14
   405 00000053 BB0000                   mov  bx, 0
   406 00000056 CD10                     db 205,16
   407                                  
   408                                  ;-97 int putch(char c)  {if (c==10) {al=13; writetty();} al=c; writetty(); }
   409                                  
   410 00000058 C3                       ret
   411                                  ENDP
   412                                  
   413                                  putch: PROC;
   414 00000059 C8000000                 ENTER  0,0
   415 0000005D 8A4604                   mov al, [bp+4]
   416 00000060 3C0A                     cmp al, 10
   417 00000062 0F850500                 jne .putch1
   418 00000066 B00D                     mov  al, 13
   419 00000068 E8E6FF                   call writetty
   420                                  .putch1:
   421 0000006B 8A4604                   mov  al, [bp+4]
   422 0000006E E8E0FF                   call writetty
   423                                  
   424                                  ;-98 int cputs(char *s) {char c;  while(*s) { c=*s; putch(c); s++; } }
   425 00000071 C9                       LEAVE
   426 00000072 C3                       ret
   427                                  ENDP
   428                                  
   429                                  cputs: PROC;
   430 00000073 C8020000                 ENTER  2,0
   431                                  .cputs2:
   432 00000077 8B5E04                   mov bx, [bp+4]
   433 0000007A 8A07                     mov al, [bx]
   434 0000007C B400                     mov ah, 0
   435 0000007E 08C0                     or  al, al
   436 00000080 0F841B00                 je .cputs3
   437 00000084 8B5E04                   mov bx, [bp+4]
   438 00000087 8A07                     mov al, [bx]
   439 00000089 B400                     mov ah, 0
   440 0000008B 8846FE                   mov [bp-2], al
   441 0000008E 8A46FE                   mov al, byte [bp-2]
   442 00000091 B400                     mov ah, 0
   443 00000093 50                       push ax
   444 00000094 E8C2FF                   call putch
   445 00000097 83C402                   add  sp, 2
   446 0000009A FF4604                   inc  word[bp+4]
   447 0000009D EBD8                     jmp .cputs2
   448                                  .cputs3:
   449                                  
   450                                  ;-99 int mkneg(int n)   { n; __asm {neg ax} }
   451 0000009F C9                       LEAVE
   452 000000A0 C3                       ret
   453                                  ENDP
   454                                  
   455                                  mkneg: PROC;
   456 000000A1 C8000000                 ENTER  0,0
   457 000000A5 8B4604                   mov ax, [bp+4]
   458 000000A8 F7D8                    neg ax
   459                                  
   460                                  ;-100 
   461                                  
   462                                  
   463                                  ;-101 int DosInt() {
   464 000000AA C9                       LEAVE
   465 000000AB C3                       ret
   466                                  ENDP
   467                                  
   468                                  DosInt: PROC
   469                                  
   470                                  ;-102     __emit__(0xCD,0x21);//inth 0x21;
   471                                  
   472 000000AC CD21                     db 205,33
   473                                  
   474                                  ;-103     __emit__(0x73, 04); //ifcarry DOS_ERR++;
   475                                  
   476 000000AE 7304                     db 115,4
   477                                  
   478                                  ;-104     DOS_ERR++;
   479                                  
   480 000000B0 FF06[4600]               inc  word[DOS_ERR]
   481                                  
   482                                  ;-105 }
   483                                  
   484                                  
   485                                  ;-106 int openR (char *s) { dx=s;       ax=0x3D02; DosInt(); }
   486                                  
   487 000000B4 C3                       ret
   488                                  ENDP
   489                                  
   490                                  openR: PROC;
   491 000000B5 C8000000                 ENTER  0,0
   492 000000B9 8B5604                   mov  dx, [bp+4]
   493 000000BC B8023D                   mov  ax, 15618
   494 000000BF E8EAFF                   call DosInt
   495                                  
   496                                  ;-107 int creatR(char *s) { dx=s; cx=0; ax=0x3C00; DosInt(); }
   497 000000C2 C9                       LEAVE
   498 000000C3 C3                       ret
   499                                  ENDP
   500                                  
   501                                  creatR: PROC;
   502 000000C4 C8000000                 ENTER  0,0
   503 000000C8 8B5604                   mov  dx, [bp+4]
   504 000000CB B90000                   mov  cx, 0
   505 000000CE B8003C                   mov  ax, 15360
   506 000000D1 E8D8FF                   call DosInt
   507                                  
   508                                  ;-108 int fcloseR(int fd) {bx=fd;       ax=0x3E00; DosInt(); }
   509 000000D4 C9                       LEAVE
   510 000000D5 C3                       ret
   511                                  ENDP
   512                                  
   513                                  fcloseR: PROC;
   514 000000D6 C8000000                 ENTER  0,0
   515 000000DA 8B5E04                   mov  bx, [bp+4]
   516 000000DD B8003E                   mov  ax, 15872
   517 000000E0 E8C9FF                   call DosInt
   518                                  
   519                                  ;-109 int exitR  (char c) {ah=0x4C; al=c;          DosInt(); }
   520 000000E3 C9                       LEAVE
   521 000000E4 C3                       ret
   522                                  ENDP
   523                                  
   524                                  exitR: PROC;
   525 000000E5 C8000000                 ENTER  0,0
   526 000000E9 B44C                     mov  ah, 76
   527 000000EB 8A4604                   mov  al, [bp+4]
   528 000000EE E8BBFF                   call DosInt
   529                                  
   530                                  ;-110 int readRL(char *s, int fd, int len){
   531 000000F1 C9                       LEAVE
   532 000000F2 C3                       ret
   533                                  ENDP
   534                                  
   535                                  readRL: PROC
   536                                  
   537                                  ;-111     dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}
   538                                  ;
   539 000000F3 C8000000                 ENTER  0,0
   540 000000F7 8B5604                   mov  dx, [bp+4]
   541 000000FA 8B4E08                   mov  cx, [bp+8]
   542 000000FD 8B5E06                   mov  bx, [bp+6]
   543 00000100 B8003F                   mov  ax, 16128
   544 00000103 E8A6FF                   call DosInt
   545                                  
   546                                  ;-112 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
   547 00000106 C9                       LEAVE
   548 00000107 C3                       ret
   549                                  ENDP
   550                                  
   551                                  fputcR: PROC;
   552 00000108 C8000000                 ENTER  0,0
   553 0000010C 8D5604                  lea dx, [bp+4]
   554                                  
   555                                  ;-113   cx=1; bx=fd; ax=0x4000; DosInt(); }
   556                                  
   557 0000010F B90100                   mov  cx, 1
   558 00000112 8B5E06                   mov  bx, [bp+6]
   559 00000115 B80040                   mov  ax, 16384
   560 00000118 E891FF                   call DosInt
   561                                  
   562                                  ;-114 
   563                                  
   564                                  
   565                                  ;-115   int letter(char c) {
   566 0000011B C9                       LEAVE
   567 0000011C C3                       ret
   568                                  ENDP
   569                                  
   570                                  letter: PROC
   571                                  
   572                                  ;-116       if (c=='_') return 1;
   573                                  ;
   574 0000011D C8000000                 ENTER  0,0
   575 00000121 8A4604                   mov al, [bp+4]
   576 00000124 3C5F                     cmp al, 95
   577 00000126 0F850600                 jne .letter4
   578 0000012A B80100                   mov ax, 1
   579 0000012D E96900                   jmp .retnletter
   580                                  
   581                                  ;-117       if (c=='.') return 1;
   582                                  
   583                                  .letter4:
   584 00000130 8A4604                   mov al, [bp+4]
   585 00000133 3C2E                     cmp al, 46
   586 00000135 0F850600                 jne .letter5
   587 00000139 B80100                   mov ax, 1
   588 0000013C E95A00                   jmp .retnletter
   589                                  
   590                                  ;-118       if (c=='?') return 1;
   591                                  
   592                                  .letter5:
   593 0000013F 8A4604                   mov al, [bp+4]
   594 00000142 3C3F                     cmp al, 63
   595 00000144 0F850600                 jne .letter6
   596 00000148 B80100                   mov ax, 1
   597 0000014B E94B00                   jmp .retnletter
   598                                  
   599                                  ;-119       if (c=='$') return 1;
   600                                  
   601                                  .letter6:
   602 0000014E 8A4604                   mov al, [bp+4]
   603 00000151 3C24                     cmp al, 36
   604 00000153 0F850600                 jne .letter7
   605 00000157 B80100                   mov ax, 1
   606 0000015A E93C00                   jmp .retnletter
   607                                  
   608                                  ;-120       if (c> 'z') return 0;
   609                                  
   610                                  .letter7:
   611 0000015D 8A4604                   mov al, [bp+4]
   612 00000160 3C7A                     cmp al, 122
   613 00000162 0F8E0600                 jle .letter8
   614 00000166 B80000                   mov ax, 0
   615 00000169 E92D00                   jmp .retnletter
   616                                  
   617                                  ;-121       if (c< '@') return 0;// at included
   618                                  
   619                                  .letter8:
   620 0000016C 8A4604                   mov al, [bp+4]
   621 0000016F 3C40                     cmp al, 64
   622 00000171 0F8D0600                 jge .letter9
   623 00000175 B80000                   mov ax, 0
   624 00000178 E91E00                   jmp .retnletter
   625                                  
   626                                  ;-122       if (c> 'Z') { if (c< 'a') return 0; }
   627                                  
   628                                  .letter9:
   629 0000017B 8A4604                   mov al, [bp+4]
   630 0000017E 3C5A                     cmp al, 90
   631 00000180 0F8E0F00                 jle .letter10
   632 00000184 8A4604                   mov al, [bp+4]
   633 00000187 3C61                     cmp al, 97
   634 00000189 0F8D0600                 jge .letter11
   635 0000018D B80000                   mov ax, 0
   636 00000190 E90600                   jmp .retnletter
   637                                  .letter11:
   638                                  
   639                                  ;-123       return 1;
   640                                  
   641                                  .letter10:
   642 00000193 B80100                   mov ax, 1
   643 00000196 E90000                   jmp .retnletter
   644                                  
   645                                  ;-124   }
   646                                  
   647                                  
   648                                  ;-125   int digit(char c){
   649                                  
   650 00000199 C9                       .retnletter: LEAVE
   651 0000019A C3                       ret
   652                                  ENDP
   653                                  
   654                                  digit: PROC
   655                                  
   656                                  ;-126       if(c<'0') return 0;
   657                                  ;
   658 0000019B C8000000                 ENTER  0,0
   659 0000019F 8A4604                   mov al, [bp+4]
   660 000001A2 3C30                     cmp al, 48
   661 000001A4 0F8D0600                 jge .digit12
   662 000001A8 B80000                   mov ax, 0
   663 000001AB E91500                   jmp .retndigit
   664                                  
   665                                  ;-127       if(c>'9') return 0;
   666                                  
   667                                  .digit12:
   668 000001AE 8A4604                   mov al, [bp+4]
   669 000001B1 3C39                     cmp al, 57
   670 000001B3 0F8E0600                 jle .digit13
   671 000001B7 B80000                   mov ax, 0
   672 000001BA E90600                   jmp .retndigit
   673                                  
   674                                  ;-128       return 1;
   675                                  
   676                                  .digit13:
   677 000001BD B80100                   mov ax, 1
   678 000001C0 E90000                   jmp .retndigit
   679                                  
   680                                  ;-129   }
   681                                  
   682                                  
   683                                  ;-130   int alnum(char c) {
   684                                  
   685 000001C3 C9                       .retndigit: LEAVE
   686 000001C4 C3                       ret
   687                                  ENDP
   688                                  
   689                                  alnum: PROC
   690                                  
   691                                  ;-131     if (digit (c)) return 1;
   692                                  ;
   693 000001C5 C8000000                 ENTER  0,0
   694 000001C9 8A4604                   mov al, byte [bp+4]
   695 000001CC B400                     mov ah, 0
   696 000001CE 50                       push ax
   697 000001CF E8C9FF                   call digit
   698 000001D2 83C402                   add  sp, 2
   699 000001D5 08C0                     or  al, al
   700 000001D7 0F840600                 je .alnum14
   701 000001DB B80100                   mov ax, 1
   702 000001DE E91E00                   jmp .retnalnum
   703                                  
   704                                  ;-132     if (letter(c)) return 1;
   705                                  
   706                                  .alnum14:
   707 000001E1 8A4604                   mov al, byte [bp+4]
   708 000001E4 B400                     mov ah, 0
   709 000001E6 50                       push ax
   710 000001E7 E833FF                   call letter
   711 000001EA 83C402                   add  sp, 2
   712 000001ED 08C0                     or  al, al
   713 000001EF 0F840600                 je .alnum15
   714 000001F3 B80100                   mov ax, 1
   715 000001F6 E90600                   jmp .retnalnum
   716                                  
   717                                  ;-133     return 0;
   718                                  
   719                                  .alnum15:
   720 000001F9 B80000                   mov ax, 0
   721 000001FC E90000                   jmp .retnalnum
   722                                  
   723                                  ;-134   }
   724                                  
   725                                  
   726                                  ;-135 
   727                                  
   728                                  
   729                                  ;-136 int strlen(char *s) { int c;
   730                                  
   731 000001FF C9                       .retnalnum: LEAVE
   732 00000200 C3                       ret
   733                                  ENDP
   734                                  
   735                                  strlen: PROC
   736                                  
   737                                  ;-137     c=0;
   738                                  ;
   739 00000201 C8020000                 ENTER  2,0
   740 00000205 B80000                   mov ax, 0
   741 00000208 8946FE                   mov [bp-2], ax
   742                                  
   743                                  ;-138     while (*s!=0) {s++; c++;}
   744                                  
   745                                  .strlen16:
   746 0000020B 8B5E04                   mov bx, [bp+4]
   747 0000020E 8A07                     mov al, [bx]
   748 00000210 B400                     mov ah, 0
   749 00000212 83F800                   cmp ax, 0
   750 00000215 0F840800                 je  .strlen17
   751 00000219 FF4604                   inc  word[bp+4]
   752 0000021C FF46FE                   inc  word[bp-2]
   753                                  
   754                                  ;-139     return c;
   755                                  
   756 0000021F EBEA                     jmp .strlen16
   757                                  .strlen17:
   758 00000221 8B46FE                   mov ax, [bp-2]
   759 00000224 E90000                   jmp .retnstrlen
   760                                  
   761                                  ;-140 }
   762                                  
   763                                  
   764                                  ;-141 int strcpy(char *s, char *t) {
   765                                  
   766 00000227 C9                       .retnstrlen: LEAVE
   767 00000228 C3                       ret
   768                                  ENDP
   769                                  
   770                                  strcpy: PROC
   771                                  
   772                                  ;-142     do { *s=*t; s++; t++; }
   773                                  ;
   774 00000229 C8000000                 ENTER  0,0
   775                                  .strcpy18:
   776 0000022D 8B5E06                   mov bx, [bp+6]
   777 00000230 8A07                     mov al, [bx]
   778 00000232 B400                     mov ah, 0
   779 00000234 8B5E04                   mov  bx, [bp+4]
   780 00000237 8807                     mov  [bx], al
   781 00000239 FF4604                   inc  word[bp+4]
   782 0000023C FF4606                   inc  word[bp+6]
   783                                  
   784                                  ;-143     while (*t!=0);
   785                                  
   786 0000023F 8B5E06                   mov bx, [bp+6]
   787 00000242 8A07                     mov al, [bx]
   788 00000244 B400                     mov ah, 0
   789 00000246 83F800                   cmp ax, 0
   790 00000249 0F840200                 je  .strcpy19
   791 0000024D EBDE                     jmp .strcpy18
   792                                  .strcpy19:
   793                                  
   794                                  ;-144     *s=0;
   795                                  
   796 0000024F B80000                   mov ax, 0
   797 00000252 8B5E04                   mov  bx, [bp+4]
   798 00000255 8807                     mov  [bx], al
   799                                  
   800                                  ;-145     return s;
   801                                  
   802 00000257 8B4604                   mov ax, [bp+4]
   803 0000025A E90000                   jmp .retnstrcpy
   804                                  
   805                                  ;-146 }
   806                                  
   807                                  
   808                                  ;-147 int eqstr(char *p, char *q) {
   809                                  
   810 0000025D C9                       .retnstrcpy: LEAVE
   811 0000025E C3                       ret
   812                                  ENDP
   813                                  
   814                                  eqstr: PROC
   815                                  
   816                                  ;-148     while(*p) {
   817                                  ;
   818 0000025F C8000000                 ENTER  0,0
   819                                  .eqstr20:
   820 00000263 8B5E04                   mov bx, [bp+4]
   821 00000266 8A07                     mov al, [bx]
   822 00000268 B400                     mov ah, 0
   823 0000026A 08C0                     or  al, al
   824 0000026C 0F842000                 je .eqstr21
   825                                  
   826                                  ;-149         if (*p != *q) return 0;
   827                                  
   828 00000270 8B5E04                   mov bx, [bp+4]
   829 00000273 8A07                     mov al, [bx]
   830 00000275 B400                     mov ah, 0
   831 00000277 8B5E06                   mov bx, [bp+6]
   832 0000027A 3A07                     cmp al, [bx]
   833 0000027C B400                     mov ah, 0
   834 0000027E 0F840600                 je  .eqstr22
   835 00000282 B80000                   mov ax, 0
   836 00000285 E92100                   jmp .retneqstr
   837                                  
   838                                  ;-150         p++;
   839                                  
   840                                  .eqstr22:
   841 00000288 FF4604                   inc  word[bp+4]
   842                                  
   843                                  ;-151         q++;
   844                                  
   845 0000028B FF4606                   inc  word[bp+6]
   846                                  
   847                                  ;-152     }
   848                                  
   849                                  
   850                                  ;-153     if(*q) return 0;
   851                                  
   852 0000028E EBD3                     jmp .eqstr20
   853                                  .eqstr21:
   854 00000290 8B5E06                   mov bx, [bp+6]
   855 00000293 8A07                     mov al, [bx]
   856 00000295 B400                     mov ah, 0
   857 00000297 08C0                     or  al, al
   858 00000299 0F840600                 je .eqstr23
   859 0000029D B80000                   mov ax, 0
   860 000002A0 E90600                   jmp .retneqstr
   861                                  
   862                                  ;-154     return 1; }
   863                                  
   864                                  .eqstr23:
   865 000002A3 B80100                   mov ax, 1
   866 000002A6 E90000                   jmp .retneqstr
   867                                  
   868                                  ;-155 int strcat1(char *s, char *t) {
   869                                  
   870 000002A9 C9                       .retneqstr: LEAVE
   871 000002AA C3                       ret
   872                                  ENDP
   873                                  
   874                                  strcat1: PROC
   875                                  
   876                                  ;-156     while (*s != 0) s++;
   877                                  ;
   878 000002AB C8000000                 ENTER  0,0
   879                                  .strcat124:
   880 000002AF 8B5E04                   mov bx, [bp+4]
   881 000002B2 8A07                     mov al, [bx]
   882 000002B4 B400                     mov ah, 0
   883 000002B6 83F800                   cmp ax, 0
   884 000002B9 0F840500                 je  .strcat125
   885 000002BD FF4604                   inc  word[bp+4]
   886                                  
   887                                  ;-157     strcpy(s, t);
   888                                  
   889 000002C0 EBED                     jmp .strcat124
   890                                  .strcat125:
   891 000002C2 FF7606                   push word [bp+6]
   892 000002C5 FF7604                   push word [bp+4]
   893 000002C8 E85EFF                   call strcpy
   894 000002CB 83C404                   add  sp, 4
   895                                  
   896                                  ;-158 }
   897                                  
   898                                  
   899                                  ;-159 int toupper(char *s) {
   900 000002CE C9                       LEAVE
   901 000002CF C3                       ret
   902                                  ENDP
   903                                  
   904                                  toupper: PROC
   905                                  
   906                                  ;-160     while(*s) {
   907                                  ;
   908 000002D0 C8000000                 ENTER  0,0
   909                                  .toupper26:
   910 000002D4 8B5E04                   mov bx, [bp+4]
   911 000002D7 8A07                     mov al, [bx]
   912 000002D9 B400                     mov ah, 0
   913 000002DB 08C0                     or  al, al
   914 000002DD 0F843000                 je .toupper27
   915                                  
   916                                  ;-161         if (*s >= 'a') if (*s <= 'z') *s=*s-32;
   917                                  
   918 000002E1 8B5E04                   mov bx, [bp+4]
   919 000002E4 8A07                     mov al, [bx]
   920 000002E6 B400                     mov ah, 0
   921 000002E8 83F861                   cmp ax, 97 ;unsigned : 1
   922 000002EB 0F8C1D00                 jl  .toupper28
   923 000002EF 8B5E04                   mov bx, [bp+4]
   924 000002F2 8A07                     mov al, [bx]
   925 000002F4 B400                     mov ah, 0
   926 000002F6 83F87A                   cmp ax, 122
   927 000002F9 0F8F0F00                 jg  .toupper29
   928 000002FD 8B5E04                   mov bx, [bp+4]
   929 00000300 8A07                     mov al, [bx]
   930 00000302 B400                     mov ah, 0
   931 00000304 83E820                   sub ax, 32
   932 00000307 8B5E04                   mov  bx, [bp+4]
   933 0000030A 8807                     mov  [bx], al
   934                                  
   935                                  ;-162         s++;
   936                                  
   937                                  .toupper29:
   938                                  .toupper28:
   939 0000030C FF4604                   inc  word[bp+4]
   940                                  
   941                                  ;-163     }
   942                                  
   943                                  
   944                                  ;-164 }
   945                                  
   946 0000030F EBC3                     jmp .toupper26
   947                                  .toupper27:
   948                                  
   949                                  ;-165 int instr1(char *s, char c) {
   950 00000311 C9                       LEAVE
   951 00000312 C3                       ret
   952                                  ENDP
   953                                  
   954                                  instr1: PROC
   955                                  
   956                                  ;-166     while(*s) {
   957                                  ;
   958 00000313 C8000000                 ENTER  0,0
   959                                  .instr130:
   960 00000317 8B5E04                   mov bx, [bp+4]
   961 0000031A 8A07                     mov al, [bx]
   962 0000031C B400                     mov ah, 0
   963 0000031E 08C0                     or  al, al
   964 00000320 0F841900                 je .instr131
   965                                  
   966                                  ;-167         if (*s==c) return 1;
   967                                  
   968 00000324 8B5E04                   mov bx, [bp+4]
   969 00000327 8A07                     mov al, [bx]
   970 00000329 B400                     mov ah, 0
   971 0000032B 3A4606                   cmp al, [bp+6]
   972 0000032E 0F850600                 jne .instr132
   973 00000332 B80100                   mov ax, 1
   974 00000335 E90B00                   jmp .retninstr1
   975                                  
   976                                  ;-168         s++;
   977                                  
   978                                  .instr132:
   979 00000338 FF4604                   inc  word[bp+4]
   980                                  
   981                                  ;-169     }
   982                                  
   983                                  
   984                                  ;-170     return 0;
   985                                  
   986 0000033B EBDA                     jmp .instr130
   987                                  .instr131:
   988 0000033D B80000                   mov ax, 0
   989 00000340 E90000                   jmp .retninstr1
   990                                  
   991                                  ;-171 }
   992                                  
   993                                  
   994                                  ;-172 
   995                                  
   996                                  
   997                                  ;-173 int eprc(char c)  {
   998                                  
   999 00000343 C9                       .retninstr1: LEAVE
  1000 00000344 C3                       ret
  1001                                  ENDP
  1002                                  
  1003                                  eprc: PROC
  1004                                  
  1005                                  ;-174     *cloc=c;
  1006                                  ;
  1007 00000345 C8000000                 ENTER  0,0
  1008 00000349 8A4604                   mov al, [bp+4]
  1009 0000034C 8B1E[1800]               mov  bx, [cloc]
  1010 00000350 8807                     mov  [bx], al
  1011                                  
  1012                                  ;-175     cloc++;
  1013                                  
  1014 00000352 FF06[1800]               inc  word[cloc]
  1015                                  
  1016                                  ;-176 }
  1017                                  
  1018                                  
  1019                                  ;-177 int eprs(char *s) {
  1020 00000356 C9                       LEAVE
  1021 00000357 C3                       ret
  1022                                  ENDP
  1023                                  
  1024                                  eprs: PROC
  1025                                  
  1026                                  ;-178     char c;
  1027                                  
  1028                                  
  1029                                  ;-179     while(*s) {
  1030                                  ;
  1031 00000358 C8020000                 ENTER  2,0
  1032                                  .eprs33:
  1033 0000035C 8B5E04                   mov bx, [bp+4]
  1034 0000035F 8A07                     mov al, [bx]
  1035 00000361 B400                     mov ah, 0
  1036 00000363 08C0                     or  al, al
  1037 00000365 0F841B00                 je .eprs34
  1038                                  
  1039                                  ;-180         c=*s;
  1040                                  
  1041 00000369 8B5E04                   mov bx, [bp+4]
  1042 0000036C 8A07                     mov al, [bx]
  1043 0000036E B400                     mov ah, 0
  1044 00000370 8846FE                   mov [bp-2], al
  1045                                  
  1046                                  ;-181         eprc(c);
  1047                                  
  1048 00000373 8A46FE                   mov al, byte [bp-2]
  1049 00000376 B400                     mov ah, 0
  1050 00000378 50                       push ax
  1051 00000379 E8C9FF                   call eprc
  1052 0000037C 83C402                   add  sp, 2
  1053                                  
  1054                                  ;-182         s++;
  1055                                  
  1056 0000037F FF4604                   inc  word[bp+4]
  1057                                  
  1058                                  ;-183     }
  1059                                  
  1060                                  
  1061                                  ;-184 }
  1062                                  
  1063 00000382 EBD8                     jmp .eprs33
  1064                                  .eprs34:
  1065                                  
  1066                                  ;-185 int prc(unsigned char c) {
  1067 00000384 C9                       LEAVE
  1068 00000385 C3                       ret
  1069                                  ENDP
  1070                                  
  1071                                  prc: PROC
  1072                                  
  1073                                  ;-186     if (c==10) {
  1074                                  ;
  1075 00000386 C8000000                 ENTER  0,0
  1076 0000038A 8A4604                   mov al, [bp+4]
  1077 0000038D 3C0A                     cmp al, 10
  1078 0000038F 0F850600                 jne .prc35
  1079                                  
  1080                                  ;-187         _AX=13;
  1081                                  
  1082 00000393 B80D00                   mov  ax, 13
  1083                                  
  1084                                  ;-188         writetty();
  1085                                  
  1086 00000396 E8B8FC                   call writetty
  1087                                  
  1088                                  ;-189     }
  1089                                  
  1090                                  
  1091                                  ;-190     _AL=c;
  1092                                  
  1093                                  .prc35:
  1094 00000399 8A4604                   mov  al, [bp+4]
  1095                                  
  1096                                  ;-191     writetty();
  1097                                  
  1098 0000039C E8B2FC                   call writetty
  1099                                  
  1100                                  ;-192     fputcR(c, fdout);
  1101                                  
  1102 0000039F FF36[1C00]               push word [fdout]
  1103 000003A3 8A4604                   mov al, byte [bp+4]
  1104 000003A6 B400                     mov ah, 0
  1105 000003A8 50                       push ax
  1106 000003A9 E85CFD                   call fputcR
  1107 000003AC 83C404                   add  sp, 4
  1108                                  
  1109                                  ;-193 }
  1110                                  
  1111                                  
  1112                                  ;-194 int prscomment(unsigned char *s) {
  1113 000003AF C9                       LEAVE
  1114 000003B0 C3                       ret
  1115                                  ENDP
  1116                                  
  1117                                  prscomment: PROC
  1118                                  
  1119                                  ;-195     unsigned char c;
  1120                                  
  1121                                  
  1122                                  ;-196     while(*s){
  1123                                  ;
  1124 000003B1 C8020000                 ENTER  2,0
  1125                                  .prscomment36:
  1126 000003B5 8B5E04                   mov bx, [bp+4]
  1127 000003B8 8A07                     mov al, [bx]
  1128 000003BA B400                     mov ah, 0
  1129 000003BC 08C0                     or  al, al
  1130 000003BE 0F841B00                 je .prscomment37
  1131                                  
  1132                                  ;-197         c=*s;
  1133                                  
  1134 000003C2 8B5E04                   mov bx, [bp+4]
  1135 000003C5 8A07                     mov al, [bx]
  1136 000003C7 B400                     mov ah, 0
  1137 000003C9 8846FE                   mov [bp-2], al
  1138                                  
  1139                                  ;-198         prc(c);
  1140                                  
  1141 000003CC 8A46FE                   mov al, byte [bp-2]
  1142 000003CF B400                     mov ah, 0
  1143 000003D1 50                       push ax
  1144 000003D2 E8B1FF                   call prc
  1145 000003D5 83C402                   add  sp, 2
  1146                                  
  1147                                  ;-199         s++;
  1148                                  
  1149 000003D8 FF4604                   inc  word[bp+4]
  1150                                  
  1151                                  ;-200     }
  1152                                  
  1153                                  
  1154                                  ;-201 }
  1155                                  
  1156 000003DB EBD8                     jmp .prscomment36
  1157                                  .prscomment37:
  1158                                  
  1159                                  ;-202 int prs(unsigned char *s) {
  1160 000003DD C9                       LEAVE
  1161 000003DE C3                       ret
  1162                                  ENDP
  1163                                  
  1164                                  prs: PROC
  1165                                  
  1166                                  ;-203     unsigned char c; int com;
  1167                                  
  1168                                  
  1169                                  ;-204     com=0;
  1170                                  ;
  1171 000003DF C8040000                 ENTER  4,0
  1172 000003E3 B80000                   mov ax, 0
  1173 000003E6 8946FC                   mov [bp-4], ax
  1174                                  
  1175                                  ;-205     while(*s) {
  1176                                  
  1177                                  .prs38:
  1178 000003E9 8B5E04                   mov bx, [bp+4]
  1179 000003EC 8A07                     mov al, [bx]
  1180 000003EE B400                     mov ah, 0
  1181 000003F0 08C0                     or  al, al
  1182 000003F2 0F847B00                 je .prs39
  1183                                  
  1184                                  ;-206         c=*s;
  1185                                  
  1186 000003F6 8B5E04                   mov bx, [bp+4]
  1187 000003F9 8A07                     mov al, [bx]
  1188 000003FB B400                     mov ah, 0
  1189 000003FD 8846FE                   mov [bp-2], al
  1190                                  
  1191                                  ;-207         if (c==34) if (com) com=0;
  1192                                  
  1193 00000400 8A46FE                   mov al, [bp-2]
  1194 00000403 3C22                     cmp al, 34
  1195 00000405 0F851800                 jne .prs40
  1196 00000409 8B46FC                   mov ax, [bp-4]
  1197 0000040C 08C0                     or  al, al
  1198 0000040E 0F840900                 je .prs41
  1199 00000412 B80000                   mov ax, 0
  1200 00000415 8946FC                   mov [bp-4], ax
  1201                                  
  1202                                  ;-208                    else com=1;
  1203                                  
  1204 00000418 E90600                   jmp .prs42
  1205                                  .prs41:
  1206 0000041B B80100                   mov ax, 1
  1207 0000041E 8946FC                   mov [bp-4], ax
  1208                                  
  1209                                  ;-209         if (c==92) {
  1210                                  
  1211                                  .prs42:
  1212                                  .prs40:
  1213 00000421 8A46FE                   mov al, [bp-2]
  1214 00000424 3C5C                     cmp al, 92
  1215 00000426 0F853500                 jne .prs43
  1216                                  
  1217                                  ;-210             if (com==0) {
  1218                                  
  1219 0000042A 8B46FC                   mov ax, [bp-4]
  1220 0000042D 83F800                   cmp ax, 0
  1221 00000430 0F852B00                 jne .prs44
  1222                                  
  1223                                  ;-211                 s++;
  1224                                  
  1225 00000434 FF4604                   inc  word[bp+4]
  1226                                  
  1227                                  ;-212                 c=*s;
  1228                                  
  1229 00000437 8B5E04                   mov bx, [bp+4]
  1230 0000043A 8A07                     mov al, [bx]
  1231 0000043C B400                     mov ah, 0
  1232 0000043E 8846FE                   mov [bp-2], al
  1233                                  
  1234                                  ;-213                 if (c=='n') c=10;
  1235                                  
  1236 00000441 8A46FE                   mov al, [bp-2]
  1237 00000444 3C6E                     cmp al, 110
  1238 00000446 0F850600                 jne .prs45
  1239 0000044A B80A00                   mov ax, 10
  1240 0000044D 8846FE                   mov [bp-2], al
  1241                                  
  1242                                  ;-214                 if (c=='t') c= 9;
  1243                                  
  1244                                  .prs45:
  1245 00000450 8A46FE                   mov al, [bp-2]
  1246 00000453 3C74                     cmp al, 116
  1247 00000455 0F850600                 jne .prs46
  1248 00000459 B80900                   mov ax, 9
  1249 0000045C 8846FE                   mov [bp-2], al
  1250                                  
  1251                                  ;-215             }
  1252                                  
  1253                                  .prs46:
  1254                                  
  1255                                  ;-216         }
  1256                                  
  1257                                  .prs44:
  1258                                  
  1259                                  ;-217         prc(c);
  1260                                  
  1261                                  .prs43:
  1262 0000045F 8A46FE                   mov al, byte [bp-2]
  1263 00000462 B400                     mov ah, 0
  1264 00000464 50                       push ax
  1265 00000465 E81EFF                   call prc
  1266 00000468 83C402                   add  sp, 2
  1267                                  
  1268                                  ;-218         s++;
  1269                                  
  1270 0000046B FF4604                   inc  word[bp+4]
  1271                                  
  1272                                  ;-219     }
  1273                                  
  1274                                  
  1275                                  ;-220 }
  1276                                  
  1277 0000046E E978FF                   jmp .prs38
  1278                                  .prs39:
  1279                                  
  1280                                  ;-221 int prnl() {
  1281 00000471 C9                       LEAVE
  1282 00000472 C3                       ret
  1283                                  ENDP
  1284                                  
  1285                                  prnl: PROC
  1286                                  
  1287                                  ;-222     prs("\n ");
  1288                                  
  1289 00000473 68[7D04]                 push prnl_0
  1290 00000476 E866FF                   call prs
  1291 00000479 83C402                   add  sp, 2
  1292                                  
  1293                                  ;-223 }
  1294                                  
  1295                                  
  1296                                  ;-224 
  1297                                  
  1298                                  
  1299                                  ;-225 
  1300                                  
  1301                                  
  1302                                  ;-226 int eprnum(int n){//for docall1 procedure
  1303                                  
  1304 0000047C C3                       ret
  1305 0000047D 5C6E2000                prnl_0 db "\n ",0
  1306                                  ENDP
  1307                                  
  1308                                  eprnum: PROC
  1309                                  
  1310                                  ;-227     int e;
  1311                                  
  1312                                  
  1313                                  ;-228     if(n<0) {
  1314                                  ;
  1315 00000481 C8020000                 ENTER  2,0
  1316 00000485 8B4604                   mov ax, [bp+4]
  1317 00000488 83F800                   cmp ax, 0
  1318 0000048B 0F8D1400                 jge .eprnum47
  1319                                  
  1320                                  ;-229         eprc('-');
  1321                                  
  1322 0000048F 6A2D                     push 45
  1323 00000491 E8B1FE                   call eprc
  1324 00000494 83C402                   add  sp, 2
  1325                                  
  1326                                  ;-230         n=mkneg(n);
  1327                                  
  1328 00000497 FF7604                   push word [bp+4]
  1329 0000049A E804FC                   call mkneg
  1330 0000049D 83C402                   add  sp, 2
  1331 000004A0 894604                   mov [bp+4], ax
  1332                                  
  1333                                  ;-231     }
  1334                                  
  1335                                  
  1336                                  ;-232     if (n >= 10) {
  1337                                  
  1338                                  .eprnum47:
  1339 000004A3 8B4604                   mov ax, [bp+4]
  1340 000004A6 83F80A                   cmp ax, 10 ;unsigned : 1
  1341 000004A9 0F8C1500                 jl  .eprnum48
  1342                                  
  1343                                  ;-233         e=n/10;
  1344                                  
  1345 000004AD 8B4604                   mov ax, [bp+4]
  1346 000004B0 BB0A00                   mov bx, 10
  1347 000004B3 99                       cwd
  1348 000004B4 F7FB                     idiv bx
  1349 000004B6 8946FE                   mov [bp-2], ax
  1350                                  
  1351                                  ;-234         eprnum(e);
  1352                                  
  1353 000004B9 FF76FE                   push word [bp-2]
  1354 000004BC E8C2FF                   call eprnum
  1355 000004BF 83C402                   add  sp, 2
  1356                                  
  1357                                  ;-235     }
  1358                                  
  1359                                  
  1360                                  ;-236     n=n%10;
  1361                                  
  1362                                  .eprnum48:
  1363 000004C2 8B4604                   mov ax, [bp+4]
  1364 000004C5 BB0A00                   mov bx, 10
  1365 000004C8 99                       cwd
  1366 000004C9 F7FB                     idiv bx
  1367 000004CB 89D0                     mov ax, dx
  1368 000004CD 894604                   mov [bp+4], ax
  1369                                  
  1370                                  ;-237     n=n+'0';
  1371                                  
  1372 000004D0 8B4604                   mov ax, [bp+4]
  1373 000004D3 83C030                   add ax, 48
  1374 000004D6 894604                   mov [bp+4], ax
  1375                                  
  1376                                  ;-238     eprc(n);
  1377                                  
  1378 000004D9 FF7604                   push word [bp+4]
  1379 000004DC E866FE                   call eprc
  1380 000004DF 83C402                   add  sp, 2
  1381                                  
  1382                                  ;-239 }
  1383                                  
  1384                                  
  1385                                  ;-240 int pint1 (int n){
  1386 000004E2 C9                       LEAVE
  1387 000004E3 C3                       ret
  1388                                  ENDP
  1389                                  
  1390                                  pint1: PROC
  1391                                  
  1392                                  ;-241     int e;
  1393                                  
  1394                                  
  1395                                  ;-242     if(n<0) {  prc('-');  n=mkneg(n); }
  1396                                  ;
  1397 000004E4 C8020000                 ENTER  2,0
  1398 000004E8 8B4604                   mov ax, [bp+4]
  1399 000004EB 83F800                   cmp ax, 0
  1400 000004EE 0F8D1400                 jge .pint149
  1401 000004F2 6A2D                     push 45
  1402 000004F4 E88FFE                   call prc
  1403 000004F7 83C402                   add  sp, 2
  1404 000004FA FF7604                   push word [bp+4]
  1405 000004FD E8A1FB                   call mkneg
  1406 00000500 83C402                   add  sp, 2
  1407 00000503 894604                   mov [bp+4], ax
  1408                                  
  1409                                  ;-243     if (n >= 10) {
  1410                                  
  1411                                  .pint149:
  1412 00000506 8B4604                   mov ax, [bp+4]
  1413 00000509 83F80A                   cmp ax, 10 ;unsigned : 1
  1414 0000050C 0F8C1500                 jl  .pint150
  1415                                  
  1416                                  ;-244         e=n/10;
  1417                                  
  1418 00000510 8B4604                   mov ax, [bp+4]
  1419 00000513 BB0A00                   mov bx, 10
  1420 00000516 99                       cwd
  1421 00000517 F7FB                     idiv bx
  1422 00000519 8946FE                   mov [bp-2], ax
  1423                                  
  1424                                  ;-245         pint1(e);
  1425                                  
  1426 0000051C FF76FE                   push word [bp-2]
  1427 0000051F E8C2FF                   call pint1
  1428 00000522 83C402                   add  sp, 2
  1429                                  
  1430                                  ;-246     }
  1431                                  
  1432                                  
  1433                                  ;-247     n=n%10;
  1434                                  
  1435                                  .pint150:
  1436 00000525 8B4604                   mov ax, [bp+4]
  1437 00000528 BB0A00                   mov bx, 10
  1438 0000052B 99                       cwd
  1439 0000052C F7FB                     idiv bx
  1440 0000052E 89D0                     mov ax, dx
  1441 00000530 894604                   mov [bp+4], ax
  1442                                  
  1443                                  ;-248     n += '0';
  1444                                  
  1445 00000533 83460430                 add  word[bp+4], 48
  1446                                  
  1447                                  ;-249     prc(n);
  1448                                  
  1449 00000537 FF7604                   push word [bp+4]
  1450 0000053A E849FE                   call prc
  1451 0000053D 83C402                   add  sp, 2
  1452                                  
  1453                                  ;-250 }
  1454                                  
  1455                                  
  1456                                  ;-251 int prunsign1(unsigned int n) {
  1457 00000540 C9                       LEAVE
  1458 00000541 C3                       ret
  1459                                  ENDP
  1460                                  
  1461                                  prunsign1: PROC
  1462                                  
  1463                                  ;-252     unsigned int e;
  1464                                  
  1465                                  
  1466                                  ;-253     if (n >= 10) {
  1467                                  ;
  1468 00000542 C8020000                 ENTER  2,0
  1469 00000546 8B4604                   mov ax, [bp+4]
  1470 00000549 83F80A                   cmp ax, 10 ;unsigned : 0
  1471 0000054C 0F821700                 jb  .prunsign151
  1472                                  
  1473                                  ;-254         e=n/10;
  1474                                  
  1475 00000550 8B4604                   mov ax, [bp+4]
  1476 00000553 BB0A00                   mov bx, 10
  1477 00000556 BA0000                   mov dx, 0
  1478 00000559 F7F3                     div bx
  1479 0000055B 8946FE                   mov [bp-2], ax
  1480                                  
  1481                                  ;-255         prunsign1(e);
  1482                                  
  1483 0000055E FF76FE                   push word [bp-2]
  1484 00000561 E8DEFF                   call prunsign1
  1485 00000564 83C402                   add  sp, 2
  1486                                  
  1487                                  ;-256     }
  1488                                  
  1489                                  
  1490                                  ;-257     n = n % 10; /*unsigned mod*/
  1491                                  
  1492                                  .prunsign151:
  1493 00000567 8B4604                   mov ax, [bp+4]
  1494 0000056A BB0A00                   mov bx, 10
  1495 0000056D BA0000                   mov dx, 0
  1496 00000570 F7F3                     div bx
  1497 00000572 89D0                     mov ax, dx
  1498 00000574 894604                   mov [bp+4], ax
  1499                                  
  1500                                  ;-258     n += '0';
  1501                                  
  1502 00000577 83460430                 add  word[bp+4], 48
  1503                                  
  1504                                  ;-259     prc(n);
  1505                                  
  1506 0000057B FF7604                   push word [bp+4]
  1507 0000057E E805FE                   call prc
  1508 00000581 83C402                   add  sp, 2
  1509                                  
  1510                                  ;-260 }
  1511                                  
  1512                                  
  1513                                  ;-261 int printint51(unsigned int j)  {
  1514 00000584 C9                       LEAVE
  1515 00000585 C3                       ret
  1516                                  ENDP
  1517                                  
  1518                                  printint51: PROC
  1519                                  
  1520                                  ;-262     if (j<10000) prc(32);
  1521                                  ;
  1522 00000586 C8000000                 ENTER  0,0
  1523 0000058A 8B4604                   mov ax, [bp+4]
  1524 0000058D 3D1027                   cmp ax, 10000
  1525 00000590 0F8D0800                 jge .printint5152
  1526 00000594 6A20                     push 32
  1527 00000596 E8EDFD                   call prc
  1528 00000599 83C402                   add  sp, 2
  1529                                  
  1530                                  ;-263     if (j<1000) prc(32);
  1531                                  
  1532                                  .printint5152:
  1533 0000059C 8B4604                   mov ax, [bp+4]
  1534 0000059F 3DE803                   cmp ax, 1000
  1535 000005A2 0F8D0800                 jge .printint5153
  1536 000005A6 6A20                     push 32
  1537 000005A8 E8DBFD                   call prc
  1538 000005AB 83C402                   add  sp, 2
  1539                                  
  1540                                  ;-264     if (j<100) prc(32);
  1541                                  
  1542                                  .printint5153:
  1543 000005AE 8B4604                   mov ax, [bp+4]
  1544 000005B1 83F864                   cmp ax, 100
  1545 000005B4 0F8D0800                 jge .printint5154
  1546 000005B8 6A20                     push 32
  1547 000005BA E8C9FD                   call prc
  1548 000005BD 83C402                   add  sp, 2
  1549                                  
  1550                                  ;-265     if (j<10) prc(32);
  1551                                  
  1552                                  .printint5154:
  1553 000005C0 8B4604                   mov ax, [bp+4]
  1554 000005C3 83F80A                   cmp ax, 10
  1555 000005C6 0F8D0800                 jge .printint5155
  1556 000005CA 6A20                     push 32
  1557 000005CC E8B7FD                   call prc
  1558 000005CF 83C402                   add  sp, 2
  1559                                  
  1560                                  ;-266     prunsign1(j);
  1561                                  
  1562                                  .printint5155:
  1563 000005D2 FF7604                   push word [bp+4]
  1564 000005D5 E86AFF                   call prunsign1
  1565 000005D8 83C402                   add  sp, 2
  1566                                  
  1567                                  ;-267 }
  1568                                  
  1569                                  
  1570                                  ;-268 
  1571                                  
  1572                                  
  1573                                  ;-269 int end1(int n) {
  1574 000005DB C9                       LEAVE
  1575 000005DC C3                       ret
  1576                                  ENDP
  1577                                  
  1578                                  end1: PROC
  1579                                  
  1580                                  ;-270     fcloseR(fdin);
  1581                                  ;
  1582 000005DD C8000000                 ENTER  0,0
  1583 000005E1 FF36[1A00]               push word [fdin]
  1584 000005E5 E8EEFA                   call fcloseR
  1585 000005E8 83C402                   add  sp, 2
  1586                                  
  1587                                  ;-271     fcloseR(fdout);
  1588                                  
  1589 000005EB FF36[1C00]               push word [fdout]
  1590 000005EF E8E4FA                   call fcloseR
  1591 000005F2 83C402                   add  sp, 2
  1592                                  
  1593                                  ;-272     exitR(n);
  1594                                  
  1595 000005F5 FF7604                   push word [bp+4]
  1596 000005F8 E8EAFA                   call exitR
  1597 000005FB 83C402                   add  sp, 2
  1598                                  
  1599                                  ;-273 }
  1600                                  
  1601                                  
  1602                                  ;-274 
  1603                                  
  1604                                  
  1605                                  ;-275 int error1(char *s) {
  1606 000005FE C9                       LEAVE
  1607 000005FF C3                       ret
  1608                                  ENDP
  1609                                  
  1610                                  error1: PROC
  1611                                  
  1612                                  ;-276     lineno--;
  1613                                  ;
  1614 00000600 C8000000                 ENTER  0,0
  1615 00000604 FF0E[4000]               dec  word[lineno]
  1616                                  
  1617                                  ;-277     prnl();
  1618                                  
  1619 00000608 E868FE                   call prnl
  1620                                  
  1621                                  ;-278     prscomment(&fgetsdest);
  1622                                  
  1623 0000060B 8D06D4A4                 lea  ax, [fgetsdest]
  1624 0000060F 50                       push ax
  1625 00000610 E89EFD                   call prscomment
  1626 00000613 83C402                   add  sp, 2
  1627                                  
  1628                                  ;-279     prs(";Line: ");
  1629                                  
  1630 00000616 68[7F06]                 push error1_0
  1631 00000619 E8C3FD                   call prs
  1632 0000061C 83C402                   add  sp, 2
  1633                                  
  1634                                  ;-280     prunsign1(lineno);
  1635                                  
  1636 0000061F FF36[4000]               push word [lineno]
  1637 00000623 E81CFF                   call prunsign1
  1638 00000626 83C402                   add  sp, 2
  1639                                  
  1640                                  ;-281     prs(" ************** ERROR: ");
  1641                                  
  1642 00000629 68[8706]                 push error1_1
  1643 0000062C E8B0FD                   call prs
  1644 0000062F 83C402                   add  sp, 2
  1645                                  
  1646                                  ;-282     prs(s);
  1647                                  
  1648 00000632 FF7604                   push word [bp+4]
  1649 00000635 E8A7FD                   call prs
  1650 00000638 83C402                   add  sp, 2
  1651                                  
  1652                                  ;-283     prs("  in column: ");
  1653                                  
  1654 0000063B 68[9F06]                 push error1_2
  1655 0000063E E89EFD                   call prs
  1656 00000641 83C402                   add  sp, 2
  1657                                  
  1658                                  ;-284     prunsign1(column);
  1659                                  
  1660 00000644 FF36[2000]               push word [column]
  1661 00000648 E8F7FE                   call prunsign1
  1662 0000064B 83C402                   add  sp, 2
  1663                                  
  1664                                  ;-285     prs("\nToken: ");
  1665                                  
  1666 0000064E 68[AD06]                 push error1_3
  1667 00000651 E88BFD                   call prs
  1668 00000654 83C402                   add  sp, 2
  1669                                  
  1670                                  ;-286     prunsign1(token);
  1671                                  
  1672 00000657 FF36[1E00]               push word [token]
  1673 0000065B E8E4FE                   call prunsign1
  1674 0000065E 83C402                   add  sp, 2
  1675                                  
  1676                                  ;-287     prs(", symbol: ");
  1677                                  
  1678 00000661 68[B706]                 push error1_4
  1679 00000664 E878FD                   call prs
  1680 00000667 83C402                   add  sp, 2
  1681                                  
  1682                                  ;-288     prs(symbol);
  1683                                  
  1684 0000066A 8D06A36D                 lea  ax, [symbol]
  1685 0000066E 50                       push ax
  1686 0000066F E86DFD                   call prs
  1687 00000672 83C402                   add  sp, 2
  1688                                  
  1689                                  ;-289     end1(1);
  1690                                  
  1691 00000675 6A01                     push 1
  1692 00000677 E863FF                   call end1
  1693 0000067A 83C402                   add  sp, 2
  1694                                  
  1695                                  ;-290 }
  1696                                  
  1697                                  
  1698                                  ;-291 
  1699                                  
  1700                                  
  1701                                  ;-292 int printinputline() {
  1702 0000067D C9                       LEAVE
  1703 0000067E C3                       ret
  1704 0000067F 3B4C696E653A2000        error1_0 db ";Line: ",0
  1705 00000687 202A2A2A2A2A2A2A2A-     error1_1 db " ************** ERROR: ",0
  1706 00000690 2A2A2A2A2A2A204552-
  1707 00000699 524F523A2000       
  1708 0000069F 2020696E20636F6C75-     error1_2 db "  in column: ",0
  1709 000006A8 6D6E3A2000         
  1710 000006AD 5C6E546F6B656E3A20-     error1_3 db "\nToken: ",0
  1711 000006B6 00                 
  1712 000006B7 2C2073796D626F6C3A-     error1_4 db ", symbol: ",0
  1713 000006C0 2000               
  1714                                  ENDP
  1715                                  
  1716                                  printinputline: PROC
  1717                                  
  1718                                  ;-293     int col;
  1719                                  
  1720                                  
  1721                                  ;-294     col=0;
  1722                                  ;
  1723 000006C2 C8020000                 ENTER  2,0
  1724 000006C6 B80000                   mov ax, 0
  1725 000006C9 8946FE                   mov [bp-2], ax
  1726                                  
  1727                                  ;-295     fgetsp=&fgetsdest;
  1728                                  
  1729 000006CC B8D4A4                   mov ax, fgetsdest
  1730 000006CF A3[3E00]                 mov word [fgetsp], ax
  1731                                  
  1732                                  ;-296     do {
  1733                                  
  1734                                  .printinputline56:
  1735                                  
  1736                                  ;-297         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);
  1737                                  
  1738 000006D2 6A01                     push 1
  1739 000006D4 FF36[1A00]               push word [fdin]
  1740 000006D8 8D06[4A00]               lea  ax, [DOS_ByteRead]
  1741 000006DC 50                       push ax
  1742 000006DD E813FA                   call readRL
  1743 000006E0 83C406                   add  sp, 6
  1744 000006E3 A3[4800]                 mov word [DOS_NoBytes], ax
  1745                                  
  1746                                  ;-298         if (DOS_NoBytes == 0) return;
  1747                                  
  1748 000006E6 A1[4800]                 mov ax, [DOS_NoBytes]
  1749 000006E9 83F800                   cmp ax, 0
  1750 000006EC 0F850300                 jne .printinputline57
  1751 000006F0 E96A00                   jmp .retnprintinputline
  1752                                  
  1753                                  ;-299         *fgetsp=DOS_ByteRead;
  1754                                  
  1755                                  .printinputline57:
  1756 000006F3 A0[4A00]                 mov al, [DOS_ByteRead]
  1757 000006F6 8B1E[3E00]               mov  bx, [fgetsp]
  1758 000006FA 8807                     mov  [bx], al
  1759                                  
  1760                                  ;-300         fgetsp++;
  1761                                  
  1762 000006FC FF06[3E00]               inc  word[fgetsp]
  1763                                  
  1764                                  ;-301         col++;
  1765                                  
  1766 00000700 FF46FE                   inc  word[bp-2]
  1767                                  
  1768                                  ;-302         if (col >80) error1("input line longer than 80 char");
  1769                                  
  1770 00000703 8B46FE                   mov ax, [bp-2]
  1771 00000706 83F850                   cmp ax, 80
  1772 00000709 0F8E0900                 jle .printinputline58
  1773 0000070D 68[5F07]                 push printinputline_0
  1774 00000710 E8EDFE                   call error1
  1775 00000713 83C402                   add  sp, 2
  1776                                  
  1777                                  ;-303         }
  1778                                  
  1779                                  .printinputline58:
  1780                                  
  1781                                  ;-304         while (DOS_ByteRead != 10);
  1782                                  
  1783 00000716 A0[4A00]                 mov al, [DOS_ByteRead]
  1784 00000719 3C0A                     cmp al, 10
  1785 0000071B 0F840200                 je  .printinputline59
  1786 0000071F EBB1                     jmp .printinputline56
  1787                                  .printinputline59:
  1788                                  
  1789                                  ;-305     *fgetsp=0;
  1790                                  
  1791 00000721 B80000                   mov ax, 0
  1792 00000724 8B1E[3E00]               mov  bx, [fgetsp]
  1793 00000728 8807                     mov  [bx], al
  1794                                  
  1795                                  ;-306     if (fdout) {
  1796                                  
  1797 0000072A A1[1C00]                 mov ax, [fdout]
  1798 0000072D 08C0                     or  al, al
  1799 0000072F 0F842A00                 je .printinputline60
  1800                                  
  1801                                  ;-307         prs("\n\n;-");
  1802                                  
  1803 00000733 68[7E07]                 push printinputline_1
  1804 00000736 E8A6FC                   call prs
  1805 00000739 83C402                   add  sp, 2
  1806                                  
  1807                                  ;-308         prunsign1(lineno);
  1808                                  
  1809 0000073C FF36[4000]               push word [lineno]
  1810 00000740 E8FFFD                   call prunsign1
  1811 00000743 83C402                   add  sp, 2
  1812                                  
  1813                                  ;-309         prc(' ');
  1814                                  
  1815 00000746 6A20                     push 32
  1816 00000748 E83BFC                   call prc
  1817 0000074B 83C402                   add  sp, 2
  1818                                  
  1819                                  ;-310         lineno++;
  1820                                  
  1821 0000074E FF06[4000]               inc  word[lineno]
  1822                                  
  1823                                  ;-311         prscomment(&fgetsdest);
  1824                                  
  1825 00000752 8D06D4A4                 lea  ax, [fgetsdest]
  1826 00000756 50                       push ax
  1827 00000757 E857FC                   call prscomment
  1828 0000075A 83C402                   add  sp, 2
  1829                                  
  1830                                  ;-312         }
  1831                                  
  1832                                  
  1833                                  ;-313 }
  1834                                  
  1835                                  .printinputline60:
  1836                                  
  1837                                  ;-314 int fgets1() {
  1838                                  
  1839 0000075D C9                       .retnprintinputline: LEAVE
  1840 0000075E C3                       ret
  1841 0000075F 696E707574206C696E-     printinputline_0 db "input line longer than 80 char",0
  1842 00000768 65206C6F6E67657220-
  1843 00000771 7468616E2038302063-
  1844 0000077A 68617200           
  1845 0000077E 5C6E5C6E3B2D00          printinputline_1 db "\n\n;-",0
  1846                                  ENDP
  1847                                  
  1848                                  fgets1: PROC
  1849                                  
  1850                                  ;-315     char c;
  1851                                  
  1852                                  
  1853                                  ;-316     c=*fgetsp;
  1854                                  ;
  1855 00000785 C8020000                 ENTER  2,0
  1856 00000789 8B1E[3E00]               mov bx, [fgetsp]
  1857 0000078D 8A07                     mov al, [bx]
  1858 0000078F B400                     mov ah, 0
  1859 00000791 8846FE                   mov [bp-2], al
  1860                                  
  1861                                  ;-317     if (c==0) {
  1862                                  
  1863 00000794 8A46FE                   mov al, [bp-2]
  1864 00000797 3C00                     cmp al, 0
  1865 00000799 0F852A00                 jne .fgets161
  1866                                  
  1867                                  ;-318         printinputline();
  1868                                  
  1869 0000079D E822FF                   call printinputline
  1870                                  
  1871                                  ;-319         if (DOS_NoBytes == 0) return 0;
  1872                                  
  1873 000007A0 A1[4800]                 mov ax, [DOS_NoBytes]
  1874 000007A3 83F800                   cmp ax, 0
  1875 000007A6 0F850600                 jne .fgets162
  1876 000007AA B80000                   mov ax, 0
  1877 000007AD E92500                   jmp .retnfgets1
  1878                                  
  1879                                  ;-320         fgetsp=&fgetsdest;
  1880                                  
  1881                                  .fgets162:
  1882 000007B0 B8D4A4                   mov ax, fgetsdest
  1883 000007B3 A3[3E00]                 mov word [fgetsp], ax
  1884                                  
  1885                                  ;-321         c=*fgetsp;
  1886                                  
  1887 000007B6 8B1E[3E00]               mov bx, [fgetsp]
  1888 000007BA 8A07                     mov al, [bx]
  1889 000007BC B400                     mov ah, 0
  1890 000007BE 8846FE                   mov [bp-2], al
  1891                                  
  1892                                  ;-322         column=0;
  1893                                  
  1894 000007C1 B80000                   mov ax, 0
  1895 000007C4 A3[2000]                 mov word [column], ax
  1896                                  
  1897                                  ;-323     }
  1898                                  
  1899                                  
  1900                                  ;-324     fgetsp++;
  1901                                  
  1902                                  .fgets161:
  1903 000007C7 FF06[3E00]               inc  word[fgetsp]
  1904                                  
  1905                                  ;-325     column++;
  1906                                  
  1907 000007CB FF06[2000]               inc  word[column]
  1908                                  
  1909                                  ;-326     return c;
  1910                                  
  1911 000007CF 8A46FE                   mov al, [bp-2]
  1912 000007D2 E90000                   jmp .retnfgets1
  1913                                  
  1914                                  ;-327 }
  1915                                  
  1916                                  
  1917                                  ;-328 int next() {
  1918                                  
  1919 000007D5 C9                       .retnfgets1: LEAVE
  1920 000007D6 C3                       ret
  1921                                  ENDP
  1922                                  
  1923                                  next: PROC
  1924                                  
  1925                                  ;-329     char r;
  1926                                  
  1927                                  
  1928                                  ;-330     r = thechar;
  1929                                  ;
  1930 000007D7 C8020000                 ENTER  2,0
  1931 000007DB A0[2200]                 mov al, [thechar]
  1932 000007DE 8846FE                   mov [bp-2], al
  1933                                  
  1934                                  ;-331     thechar = fgets1();
  1935                                  
  1936 000007E1 E8A1FF                   call fgets1
  1937 000007E4 A2[2200]                 mov byte [thechar], al
  1938                                  
  1939                                  ;-332     return r;
  1940                                  
  1941 000007E7 8A46FE                   mov al, [bp-2]
  1942 000007EA E90000                   jmp .retnnext
  1943                                  
  1944                                  ;-333 }
  1945                                  
  1946                                  
  1947                                  ;-334 
  1948                                  
  1949                                  
  1950                                  ;-335 int adrF(char *s, unsigned int i) {
  1951                                  
  1952 000007ED C9                       .retnnext: LEAVE
  1953 000007EE C3                       ret
  1954                                  ENDP
  1955                                  
  1956                                  adrF: PROC
  1957                                  
  1958                                  ;-336     i << 4;//*16; IDLENMAX=15!
  1959                                  ;
  1960 000007EF C8000000                 ENTER  0,0
  1961 000007F3 8B4606                   mov ax, [bp+6]
  1962 000007F6 C1E004                   shl ax, 4
  1963                                  
  1964                                  ;-337     __asm{ add ax, [bp+4]  ; offset s }
  1965                                  
  1966 000007F9 034604                   add ax, [bp+4]  ; offset s 
  1967                                  
  1968                                  ;-338 }
  1969                                  
  1970                                  
  1971                                  ;-339 
  1972                                  
  1973                                  
  1974                                  ;-340 int printName(unsigned int i) {
  1975 000007FC C9                       LEAVE
  1976 000007FD C3                       ret
  1977                                  ENDP
  1978                                  
  1979                                  printName: PROC
  1980                                  
  1981                                  ;-341     int j;
  1982                                  
  1983                                  
  1984                                  ;-342     if (i < LSTART) {
  1985                                  ;
  1986 000007FE C8020000                 ENTER  2,0
  1987 00000802 8B4604                   mov ax, [bp+4]
  1988 00000805 3DC800                   cmp ax, 200
  1989 00000808 0F8D1D00                 jge .printName63
  1990                                  
  1991                                  ;-343         i=adrF(GNameField, i);
  1992                                  
  1993 0000080C FF7604                   push word [bp+4]
  1994 0000080F 8D067879                 lea  ax, [GNameField]
  1995 00000813 50                       push ax
  1996 00000814 E8D8FF                   call adrF
  1997 00000817 83C404                   add  sp, 4
  1998 0000081A 894604                   mov [bp+4], ax
  1999                                  
  2000                                  ;-344         prs(i);
  2001                                  
  2002 0000081D FF7604                   push word [bp+4]
  2003 00000820 E8BCFB                   call prs
  2004 00000823 83C402                   add  sp, 2
  2005                                  
  2006                                  ;-345     }
  2007                                  
  2008                                  
  2009                                  ;-346     else {
  2010                                  
  2011 00000826 E93800                   jmp .printName64
  2012                                  .printName63:
  2013                                  
  2014                                  ;-347         prs("[bp");
  2015                                  
  2016 00000829 68[6308]                 push printName_0
  2017 0000082C E8B0FB                   call prs
  2018 0000082F 83C402                   add  sp, 2
  2019                                  
  2020                                  ;-348         j = GData[i];
  2021                                  
  2022 00000832 8B5E04                   mov bx, [bp+4]
  2023 00000835 D1E3                     shl bx, 1
  2024 00000837 8B872077                 mov ax, [GData + bx]
  2025 0000083B 8946FE                   mov [bp-2], ax
  2026                                  
  2027                                  ;-349         if (j>0) prc('+');
  2028                                  
  2029 0000083E 8B46FE                   mov ax, [bp-2]
  2030 00000841 83F800                   cmp ax, 0
  2031 00000844 0F8E0800                 jle .printName65
  2032 00000848 6A2B                     push 43
  2033 0000084A E839FB                   call prc
  2034 0000084D 83C402                   add  sp, 2
  2035                                  
  2036                                  ;-350         pint1(j);
  2037                                  
  2038                                  .printName65:
  2039 00000850 FF76FE                   push word [bp-2]
  2040 00000853 E88EFC                   call pint1
  2041 00000856 83C402                   add  sp, 2
  2042                                  
  2043                                  ;-351         prc(']');
  2044                                  
  2045 00000859 6A5D                     push 93
  2046 0000085B E828FB                   call prc
  2047 0000085E 83C402                   add  sp, 2
  2048                                  
  2049                                  ;-352     }
  2050                                  
  2051                                  
  2052                                  ;-353 }
  2053                                  
  2054                                  .printName64:
  2055                                  
  2056                                  ;-354 
  2057                                  
  2058                                  
  2059                                  ;-355 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR
  2060 00000861 C9                       LEAVE
  2061 00000862 C3                       ret
  2062 00000863 5B627000                printName_0 db "[bp",0
  2063                                  ENDP
  2064                                  
  2065                                  ifEOL: PROC
  2066                                  
  2067                                  ;-356     if (c == 10) return 1;//LF
  2068                                  ;
  2069 00000867 C8000000                 ENTER  0,0
  2070 0000086B 8A4604                   mov al, [bp+4]
  2071 0000086E 3C0A                     cmp al, 10
  2072 00000870 0F850600                 jne .ifEOL66
  2073 00000874 B80100                   mov ax, 1
  2074 00000877 E92400                   jmp .retnifEOL
  2075                                  
  2076                                  ;-357     if (c == 13) {//CR
  2077                                  
  2078                                  .ifEOL66:
  2079 0000087A 8A4604                   mov al, [bp+4]
  2080 0000087D 3C0D                     cmp al, 13
  2081 0000087F 0F851500                 jne .ifEOL67
  2082                                  
  2083                                  ;-358         if (thechar == 10) c=next();
  2084                                  
  2085 00000883 A0[2200]                 mov al, [thechar]
  2086 00000886 3C0A                     cmp al, 10
  2087 00000888 0F850600                 jne .ifEOL68
  2088 0000088C E848FF                   call next
  2089 0000088F 884604                   mov [bp+4], al
  2090                                  
  2091                                  ;-359         return 1;
  2092                                  
  2093                                  .ifEOL68:
  2094 00000892 B80100                   mov ax, 1
  2095 00000895 E90600                   jmp .retnifEOL
  2096                                  
  2097                                  ;-360     }
  2098                                  
  2099                                  
  2100                                  ;-361     return 0;
  2101                                  
  2102                                  .ifEOL67:
  2103 00000898 B80000                   mov ax, 0
  2104 0000089B E90000                   jmp .retnifEOL
  2105                                  
  2106                                  ;-362 }
  2107                                  
  2108                                  
  2109                                  ;-363 
  2110                                  
  2111                                  
  2112                                  ;-364 char symboltemp[80];
  2113                                  
  2114 0000089E C9                       .retnifEOL: LEAVE
  2115 0000089F C3                       ret
  2116                                  ENDP
  2117                                  section .bss
  2118                                  absolute 42324
  2119 0000A554 <res 00000050>          symboltemp resb 80
  2120                                  section .text
  2121                                  
  2122                                  ;-365 int getlex() {
  2123                                  
  2124                                  
  2125                                  getlex: PROC
  2126                                  
  2127                                  ;-366     char c; char *p;
  2128                                  
  2129                                  
  2130                                  ;-367     int i; int j;
  2131                                  
  2132                                  
  2133                                  ;-368 g1: c=next();
  2134                                  ;
  2135 000008A0 C8080000                 ENTER  8,0
  2136                                  .g1:
  2137 000008A4 E830FF                   call next
  2138 000008A7 8846FE                   mov [bp-2], al
  2139                                  
  2140                                  ;-369     if (c == 0) return 0;
  2141                                  
  2142 000008AA 8A46FE                   mov al, [bp-2]
  2143 000008AD 3C00                     cmp al, 0
  2144 000008AF 0F850600                 jne .getlex69
  2145 000008B3 B80000                   mov ax, 0
  2146 000008B6 E90D06                   jmp .retngetlex
  2147                                  
  2148                                  ;-370     if (c <= ' ') goto g1;
  2149                                  
  2150                                  .getlex69:
  2151 000008B9 8A46FE                   mov al, [bp-2]
  2152 000008BC 3C20                     cmp al, 32
  2153 000008BE 0F8F0200                 jg  .getlex70
  2154 000008C2 EBE0                     jmp .g1
  2155                                  
  2156                                  ;-371   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}
  2157                                  
  2158                                  .getlex70:
  2159 000008C4 8A46FE                   mov al, [bp-2]
  2160 000008C7 3C3D                     cmp al, 61
  2161 000008C9 0F851200                 jne .getlex71
  2162 000008CD A0[2200]                 mov al, [thechar]
  2163 000008D0 3C3D                     cmp al, 61
  2164 000008D2 0F850900                 jne .getlex72
  2165 000008D6 E8FEFE                   call next
  2166 000008D9 B82603                   mov ax, 806
  2167 000008DC E9E705                   jmp .retngetlex
  2168                                  .getlex72:
  2169                                  
  2170                                  ;-372   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}
  2171                                  
  2172                                  .getlex71:
  2173 000008DF 8A46FE                   mov al, [bp-2]
  2174 000008E2 3C21                     cmp al, 33
  2175 000008E4 0F851200                 jne .getlex73
  2176 000008E8 A0[2200]                 mov al, [thechar]
  2177 000008EB 3C3D                     cmp al, 61
  2178 000008ED 0F850900                 jne .getlex74
  2179 000008F1 E8E3FE                   call next
  2180 000008F4 B82703                   mov ax, 807
  2181 000008F7 E9CC05                   jmp .retngetlex
  2182                                  .getlex74:
  2183                                  
  2184                                  ;-373   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}
  2185                                  
  2186                                  .getlex73:
  2187 000008FA 8A46FE                   mov al, [bp-2]
  2188 000008FD 3C3C                     cmp al, 60
  2189 000008FF 0F851200                 jne .getlex75
  2190 00000903 A0[2200]                 mov al, [thechar]
  2191 00000906 3C3D                     cmp al, 61
  2192 00000908 0F850900                 jne .getlex76
  2193 0000090C E8C8FE                   call next
  2194 0000090F B83803                   mov ax, 824
  2195 00000912 E9B105                   jmp .retngetlex
  2196                                  .getlex76:
  2197                                  
  2198                                  ;-374   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}
  2199                                  
  2200                                  .getlex75:
  2201 00000915 8A46FE                   mov al, [bp-2]
  2202 00000918 3C3E                     cmp al, 62
  2203 0000091A 0F851200                 jne .getlex77
  2204 0000091E A0[2200]                 mov al, [thechar]
  2205 00000921 3C3D                     cmp al, 61
  2206 00000923 0F850900                 jne .getlex78
  2207 00000927 E8ADFE                   call next
  2208 0000092A B82B03                   mov ax, 811
  2209 0000092D E99605                   jmp .retngetlex
  2210                                  .getlex78:
  2211                                  
  2212                                  ;-375   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}
  2213                                  
  2214                                  .getlex77:
  2215 00000930 8A46FE                   mov al, [bp-2]
  2216 00000933 3C3C                     cmp al, 60
  2217 00000935 0F851200                 jne .getlex79
  2218 00000939 A0[2200]                 mov al, [thechar]
  2219 0000093C 3C3C                     cmp al, 60
  2220 0000093E 0F850900                 jne .getlex80
  2221 00000942 E892FE                   call next
  2222 00000945 B8D804                   mov ax, 1240
  2223 00000948 E97B05                   jmp .retngetlex
  2224                                  .getlex80:
  2225                                  
  2226                                  ;-376   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}
  2227                                  
  2228                                  .getlex79:
  2229 0000094B 8A46FE                   mov al, [bp-2]
  2230 0000094E 3C3E                     cmp al, 62
  2231 00000950 0F851200                 jne .getlex81
  2232 00000954 A0[2200]                 mov al, [thechar]
  2233 00000957 3C3E                     cmp al, 62
  2234 00000959 0F850900                 jne .getlex82
  2235 0000095D E877FE                   call next
  2236 00000960 B8D904                   mov ax, 1241
  2237 00000963 E96005                   jmp .retngetlex
  2238                                  .getlex82:
  2239                                  
  2240                                  ;-377   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}
  2241                                  
  2242                                  .getlex81:
  2243 00000966 8A46FE                   mov al, [bp-2]
  2244 00000969 3C2B                     cmp al, 43
  2245 0000096B 0F851200                 jne .getlex83
  2246 0000096F A0[2200]                 mov al, [thechar]
  2247 00000972 3C2B                     cmp al, 43
  2248 00000974 0F850900                 jne .getlex84
  2249 00000978 E85CFE                   call next
  2250 0000097B B8C304                   mov ax, 1219
  2251 0000097E E94505                   jmp .retngetlex
  2252                                  .getlex84:
  2253                                  
  2254                                  ;-378   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}
  2255                                  
  2256                                  .getlex83:
  2257 00000981 8A46FE                   mov al, [bp-2]
  2258 00000984 3C2D                     cmp al, 45
  2259 00000986 0F851200                 jne .getlex85
  2260 0000098A A0[2200]                 mov al, [thechar]
  2261 0000098D 3C2D                     cmp al, 45
  2262 0000098F 0F850900                 jne .getlex86
  2263 00000993 E841FE                   call next
  2264 00000996 B8C904                   mov ax, 1225
  2265 00000999 E92A05                   jmp .retngetlex
  2266                                  .getlex86:
  2267                                  
  2268                                  ;-379   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}
  2269                                  
  2270                                  .getlex85:
  2271 0000099C 8A46FE                   mov al, [bp-2]
  2272 0000099F 3C2B                     cmp al, 43
  2273 000009A1 0F851200                 jne .getlex87
  2274 000009A5 A0[2200]                 mov al, [thechar]
  2275 000009A8 3C3D                     cmp al, 61
  2276 000009AA 0F850900                 jne .getlex88
  2277 000009AE E826FE                   call next
  2278 000009B1 B8CE04                   mov ax, 1230
  2279 000009B4 E90F05                   jmp .retngetlex
  2280                                  .getlex88:
  2281                                  
  2282                                  ;-380   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}
  2283                                  
  2284                                  .getlex87:
  2285 000009B7 8A46FE                   mov al, [bp-2]
  2286 000009BA 3C2D                     cmp al, 45
  2287 000009BC 0F851200                 jne .getlex89
  2288 000009C0 A0[2200]                 mov al, [thechar]
  2289 000009C3 3C3D                     cmp al, 61
  2290 000009C5 0F850900                 jne .getlex90
  2291 000009C9 E80BFE                   call next
  2292 000009CC B8CF04                   mov ax, 1231
  2293 000009CF E9F404                   jmp .retngetlex
  2294                                  .getlex90:
  2295                                  
  2296                                  ;-381   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}
  2297                                  
  2298                                  .getlex89:
  2299 000009D2 8A46FE                   mov al, [bp-2]
  2300 000009D5 3C26                     cmp al, 38
  2301 000009D7 0F851200                 jne .getlex91
  2302 000009DB A0[2200]                 mov al, [thechar]
  2303 000009DE 3C3D                     cmp al, 61
  2304 000009E0 0F850900                 jne .getlex92
  2305 000009E4 E8F0FD                   call next
  2306 000009E7 B8D204                   mov ax, 1234
  2307 000009EA E9D904                   jmp .retngetlex
  2308                                  .getlex92:
  2309                                  
  2310                                  ;-382   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}
  2311                                  
  2312                                  .getlex91:
  2313 000009ED 8A46FE                   mov al, [bp-2]
  2314 000009F0 3C7C                     cmp al, 124
  2315 000009F2 0F851200                 jne .getlex93
  2316 000009F6 A0[2200]                 mov al, [thechar]
  2317 000009F9 3C3D                     cmp al, 61
  2318 000009FB 0F850900                 jne .getlex94
  2319 000009FF E8D5FD                   call next
  2320 00000A02 B8D304                   mov ax, 1235
  2321 00000A05 E9BE04                   jmp .retngetlex
  2322                                  .getlex94:
  2323                                  
  2324                                  ;-383   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}
  2325                                  
  2326                                  .getlex93:
  2327 00000A08 8A46FE                   mov al, [bp-2]
  2328 00000A0B 3C2A                     cmp al, 42
  2329 00000A0D 0F851200                 jne .getlex95
  2330 00000A11 A0[2200]                 mov al, [thechar]
  2331 00000A14 3C3D                     cmp al, 61
  2332 00000A16 0F850900                 jne .getlex96
  2333 00000A1A E8BAFD                   call next
  2334 00000A1D B8D004                   mov ax, 1232
  2335 00000A20 E9A304                   jmp .retngetlex
  2336                                  .getlex96:
  2337                                  
  2338                                  ;-384   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}
  2339                                  
  2340                                  .getlex95:
  2341 00000A23 8A46FE                   mov al, [bp-2]
  2342 00000A26 3C2F                     cmp al, 47
  2343 00000A28 0F851200                 jne .getlex97
  2344 00000A2C A0[2200]                 mov al, [thechar]
  2345 00000A2F 3C3D                     cmp al, 61
  2346 00000A31 0F850900                 jne .getlex98
  2347 00000A35 E89FFD                   call next
  2348 00000A38 B8D104                   mov ax, 1233
  2349 00000A3B E98804                   jmp .retngetlex
  2350                                  .getlex98:
  2351                                  
  2352                                  ;-385   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;
  2353                                  
  2354                                  .getlex97:
  2355 00000A3E 8A46FE                   mov al, byte [bp-2]
  2356 00000A41 B400                     mov ah, 0
  2357 00000A43 50                       push ax
  2358 00000A44 68[C80E]                 push getlex_0
  2359 00000A47 E8C9F8                   call instr1
  2360 00000A4A 83C404                   add  sp, 4
  2361 00000A4D 08C0                     or  al, al
  2362 00000A4F 0F840600                 je .getlex99
  2363 00000A53 8A46FE                   mov al, [bp-2]
  2364 00000A56 E96D04                   jmp .retngetlex
  2365                                  
  2366                                  ;-386   if (c == '/') {
  2367                                  
  2368                                  .getlex99:
  2369 00000A59 8A46FE                   mov al, [bp-2]
  2370 00000A5C 3C2F                     cmp al, 47
  2371 00000A5E 0F852900                 jne .getlex100
  2372                                  
  2373                                  ;-387       if (thechar == '/') {
  2374                                  
  2375 00000A62 A0[2200]                 mov al, [thechar]
  2376 00000A65 3C2F                     cmp al, 47
  2377 00000A67 0F852000                 jne .getlex101
  2378                                  
  2379                                  ;-388           do c=next();
  2380                                  
  2381                                  .getlex102:
  2382 00000A6B E869FD                   call next
  2383 00000A6E 8846FE                   mov [bp-2], al
  2384                                  
  2385                                  ;-389           while(ifEOL(c)==0) return getlex();
  2386                                  
  2387 00000A71 8A46FE                   mov al, byte [bp-2]
  2388 00000A74 B400                     mov ah, 0
  2389 00000A76 50                       push ax
  2390 00000A77 E8EDFD                   call ifEOL
  2391 00000A7A 83C402                   add  sp, 2
  2392 00000A7D 3C00                     cmp al, 0
  2393 00000A7F 0F850200                 jne .getlex103
  2394 00000A83 EBE6                     jmp .getlex102
  2395                                  .getlex103:
  2396 00000A85 E818FE                   call getlex
  2397 00000A88 E93B04                   jmp .retngetlex
  2398                                  
  2399                                  ;-390       }
  2400                                  
  2401                                  
  2402                                  ;-391   }
  2403                                  
  2404                                  .getlex101:
  2405                                  
  2406                                  ;-392   if (c == '/') {
  2407                                  
  2408                                  .getlex100:
  2409 00000A8B 8A46FE                   mov al, [bp-2]
  2410 00000A8E 3C2F                     cmp al, 47
  2411 00000A90 0F853A00                 jne .getlex104
  2412                                  
  2413                                  ;-393       if (thechar == '*') {
  2414                                  
  2415 00000A94 A0[2200]                 mov al, [thechar]
  2416 00000A97 3C2A                     cmp al, 42
  2417 00000A99 0F852B00                 jne .getlex105
  2418                                  
  2419                                  ;-394           g2: c=next();
  2420                                  
  2421                                  .g2:
  2422 00000A9D E837FD                   call next
  2423 00000AA0 8846FE                   mov [bp-2], al
  2424                                  
  2425                                  ;-395           if (c != '*') goto g2;
  2426                                  
  2427 00000AA3 8A46FE                   mov al, [bp-2]
  2428 00000AA6 3C2A                     cmp al, 42
  2429 00000AA8 0F840200                 je  .getlex106
  2430 00000AAC EBEF                     jmp .g2
  2431                                  
  2432                                  ;-396           if (thechar != '/') goto g2;
  2433                                  
  2434                                  .getlex106:
  2435 00000AAE A0[2200]                 mov al, [thechar]
  2436 00000AB1 3C2F                     cmp al, 47
  2437 00000AB3 0F840200                 je  .getlex107
  2438 00000AB7 EBE4                     jmp .g2
  2439                                  
  2440                                  ;-397           c=next();
  2441                                  
  2442                                  .getlex107:
  2443 00000AB9 E81BFD                   call next
  2444 00000ABC 8846FE                   mov [bp-2], al
  2445                                  
  2446                                  ;-398           return getlex();
  2447                                  
  2448 00000ABF E8DEFD                   call getlex
  2449 00000AC2 E90104                   jmp .retngetlex
  2450                                  
  2451                                  ;-399       } else  return '/';
  2452                                  
  2453 00000AC5 E90600                   jmp .getlex108
  2454                                  .getlex105:
  2455 00000AC8 B82F00                   mov ax, 47
  2456 00000ACB E9F803                   jmp .retngetlex
  2457                                  
  2458                                  ;-400   }
  2459                                  
  2460                                  .getlex108:
  2461                                  
  2462                                  ;-401   if (c == '"') {
  2463                                  
  2464                                  .getlex104:
  2465 00000ACE 8A46FE                   mov al, [bp-2]
  2466 00000AD1 3C22                     cmp al, 34
  2467 00000AD3 0F853600                 jne .getlex109
  2468                                  
  2469                                  ;-402       p=&symbol;
  2470                                  
  2471 00000AD7 B8A36D                   mov ax, symbol
  2472 00000ADA 8946FC                   mov [bp-4], ax
  2473                                  
  2474                                  ;-403       c=next();
  2475                                  
  2476 00000ADD E8F7FC                   call next
  2477 00000AE0 8846FE                   mov [bp-2], al
  2478                                  
  2479                                  ;-404       while (c != '"') {
  2480                                  
  2481                                  .getlex110:
  2482 00000AE3 8A46FE                   mov al, [bp-2]
  2483 00000AE6 3C22                     cmp al, 34
  2484 00000AE8 0F841300                 je  .getlex111
  2485                                  
  2486                                  ;-405           *p=c;
  2487                                  
  2488 00000AEC 8A46FE                   mov al, [bp-2]
  2489 00000AEF 8B5EFC                   mov  bx, [bp-4]
  2490 00000AF2 8807                     mov  [bx], al
  2491                                  
  2492                                  ;-406           p++;
  2493                                  
  2494 00000AF4 FF46FC                   inc  word[bp-4]
  2495                                  
  2496                                  ;-407           c=next();
  2497                                  
  2498 00000AF7 E8DDFC                   call next
  2499 00000AFA 8846FE                   mov [bp-2], al
  2500                                  
  2501                                  ;-408           }
  2502                                  
  2503                                  
  2504                                  ;-409           *p=0;
  2505                                  
  2506 00000AFD EBE4                     jmp .getlex110
  2507                                  .getlex111:
  2508 00000AFF B80000                   mov ax, 0
  2509 00000B02 8B5EFC                   mov  bx, [bp-4]
  2510 00000B05 8807                     mov  [bx], al
  2511                                  
  2512                                  ;-410       return T_STRING;
  2513                                  
  2514 00000B07 B80201                   mov ax, 258
  2515 00000B0A E9B903                   jmp .retngetlex
  2516                                  
  2517                                  ;-411   }
  2518                                  
  2519                                  
  2520                                  ;-412   if (digit(c)) {
  2521                                  
  2522                                  .getlex109:
  2523 00000B0D 8A46FE                   mov al, byte [bp-2]
  2524 00000B10 B400                     mov ah, 0
  2525 00000B12 50                       push ax
  2526 00000B13 E885F6                   call digit
  2527 00000B16 83C402                   add  sp, 2
  2528 00000B19 08C0                     or  al, al
  2529 00000B1B 0F84D600                 je .getlex112
  2530                                  
  2531                                  ;-413       lexval=0;
  2532                                  
  2533 00000B1F B80000                   mov ax, 0
  2534 00000B22 A3[2B00]                 mov word [lexval], ax
  2535                                  
  2536                                  ;-414       lexval=c-'0'; // lexval=int hi=0, c=char
  2537                                  
  2538 00000B25 8A46FE                   mov al, [bp-2]
  2539 00000B28 2C30                     sub al, 48
  2540 00000B2A A3[2B00]                 mov word [lexval], ax
  2541                                  
  2542                                  ;-415       if (thechar=='x') thechar='X';
  2543                                  
  2544 00000B2D A0[2200]                 mov al, [thechar]
  2545 00000B30 3C78                     cmp al, 120
  2546 00000B32 0F850600                 jne .getlex113
  2547 00000B36 B85800                   mov ax, 88
  2548 00000B39 A2[2200]                 mov byte [thechar], al
  2549                                  
  2550                                  ;-416       if (thechar=='X') {
  2551                                  
  2552                                  .getlex113:
  2553 00000B3C A0[2200]                 mov al, [thechar]
  2554 00000B3F 3C58                     cmp al, 88
  2555 00000B41 0F856800                 jne .getlex114
  2556                                  
  2557                                  ;-417           next();
  2558                                  
  2559 00000B45 E88FFC                   call next
  2560                                  
  2561                                  ;-418           while(alnum(thechar)) {
  2562                                  
  2563                                  .getlex115:
  2564 00000B48 A0[2200]                 mov al, byte [thechar]
  2565 00000B4B B400                     mov ah, 0
  2566 00000B4D 50                       push ax
  2567 00000B4E E874F6                   call alnum
  2568 00000B51 83C402                   add  sp, 2
  2569 00000B54 08C0                     or  al, al
  2570 00000B56 0F845000                 je .getlex116
  2571                                  
  2572                                  ;-419               c=next();
  2573                                  
  2574 00000B5A E87AFC                   call next
  2575 00000B5D 8846FE                   mov [bp-2], al
  2576                                  
  2577                                  ;-420               if(c>96) c=c-39;
  2578                                  
  2579 00000B60 8A46FE                   mov al, [bp-2]
  2580 00000B63 3C60                     cmp al, 96
  2581 00000B65 0F8E0800                 jle .getlex117
  2582 00000B69 8A46FE                   mov al, [bp-2]
  2583 00000B6C 2C27                     sub al, 39
  2584 00000B6E 8846FE                   mov [bp-2], al
  2585                                  
  2586                                  ;-421       	       if (c>64) c=c-7;
  2587                                  
  2588                                  .getlex117:
  2589 00000B71 8A46FE                   mov al, [bp-2]
  2590 00000B74 3C40                     cmp al, 64
  2591 00000B76 0F8E0800                 jle .getlex118
  2592 00000B7A 8A46FE                   mov al, [bp-2]
  2593 00000B7D 2C07                     sub al, 7
  2594 00000B7F 8846FE                   mov [bp-2], al
  2595                                  
  2596                                  ;-422                c=c-48;
  2597                                  
  2598                                  .getlex118:
  2599 00000B82 8A46FE                   mov al, [bp-2]
  2600 00000B85 2C30                     sub al, 48
  2601 00000B87 8846FE                   mov [bp-2], al
  2602                                  
  2603                                  ;-423                lexval=lexval << 4; // * 16
  2604                                  
  2605 00000B8A A1[2B00]                 mov ax, [lexval]
  2606 00000B8D C1E004                   shl ax, 4
  2607 00000B90 A3[2B00]                 mov word [lexval], ax
  2608                                  
  2609                                  ;-424                i=0;
  2610                                  
  2611 00000B93 B80000                   mov ax, 0
  2612 00000B96 8946FA                   mov [bp-6], ax
  2613                                  
  2614                                  ;-425                i=c;
  2615                                  
  2616 00000B99 8A46FE                   mov al, [bp-2]
  2617 00000B9C 8946FA                   mov [bp-6], ax
  2618                                  
  2619                                  ;-426                lexval=lexval+i;
  2620                                  
  2621 00000B9F A1[2B00]                 mov ax, [lexval]
  2622 00000BA2 0346FA                   add ax, [bp-6]
  2623 00000BA5 A3[2B00]                 mov word [lexval], ax
  2624                                  
  2625                                  ;-427            }
  2626                                  
  2627                                  
  2628                                  ;-428        }else {
  2629                                  
  2630 00000BA8 EB9E                     jmp .getlex115
  2631                                  .getlex116:
  2632 00000BAA E94200                   jmp .getlex119
  2633                                  .getlex114:
  2634                                  
  2635                                  ;-429            while(digit(thechar)) {
  2636                                  
  2637                                  .getlex120:
  2638 00000BAD A0[2200]                 mov al, byte [thechar]
  2639 00000BB0 B400                     mov ah, 0
  2640 00000BB2 50                       push ax
  2641 00000BB3 E8E5F5                   call digit
  2642 00000BB6 83C402                   add  sp, 2
  2643 00000BB9 08C0                     or  al, al
  2644 00000BBB 0F843000                 je .getlex121
  2645                                  
  2646                                  ;-430                c=next();
  2647                                  
  2648 00000BBF E815FC                   call next
  2649 00000BC2 8846FE                   mov [bp-2], al
  2650                                  
  2651                                  ;-431                c=c-48;
  2652                                  
  2653 00000BC5 8A46FE                   mov al, [bp-2]
  2654 00000BC8 2C30                     sub al, 48
  2655 00000BCA 8846FE                   mov [bp-2], al
  2656                                  
  2657                                  ;-432                lexval=lexval*10;
  2658                                  
  2659 00000BCD A1[2B00]                 mov ax, [lexval]
  2660 00000BD0 BB0A00                   mov bx, 10
  2661 00000BD3 F7E3                     mul bx
  2662 00000BD5 A3[2B00]                 mov word [lexval], ax
  2663                                  
  2664                                  ;-433                i=0;
  2665                                  
  2666 00000BD8 B80000                   mov ax, 0
  2667 00000BDB 8946FA                   mov [bp-6], ax
  2668                                  
  2669                                  ;-434                i=c;
  2670                                  
  2671 00000BDE 8A46FE                   mov al, [bp-2]
  2672 00000BE1 8946FA                   mov [bp-6], ax
  2673                                  
  2674                                  ;-435                lexval=lexval+i;
  2675                                  
  2676 00000BE4 A1[2B00]                 mov ax, [lexval]
  2677 00000BE7 0346FA                   add ax, [bp-6]
  2678 00000BEA A3[2B00]                 mov word [lexval], ax
  2679                                  
  2680                                  ;-436            }
  2681                                  
  2682                                  
  2683                                  ;-437        }
  2684                                  
  2685 00000BED EBBE                     jmp .getlex120
  2686                                  .getlex121:
  2687                                  
  2688                                  ;-438       return T_CONST;
  2689                                  
  2690                                  .getlex119:
  2691 00000BEF B80101                   mov ax, 257
  2692 00000BF2 E9D102                   jmp .retngetlex
  2693                                  
  2694                                  ;-439   }
  2695                                  
  2696                                  
  2697                                  ;-440   if (c==39) {
  2698                                  
  2699                                  .getlex112:
  2700 00000BF5 8A46FE                   mov al, [bp-2]
  2701 00000BF8 3C27                     cmp al, 39
  2702 00000BFA 0F854F00                 jne .getlex122
  2703                                  
  2704                                  ;-441       lexval=next();
  2705                                  
  2706 00000BFE E8D6FB                   call next
  2707 00000C01 A3[2B00]                 mov word [lexval], ax
  2708                                  
  2709                                  ;-442       if (lexval==92) {
  2710                                  
  2711 00000C04 A1[2B00]                 mov ax, [lexval]
  2712 00000C07 83F85C                   cmp ax, 92
  2713 00000C0A 0F853600                 jne .getlex123
  2714                                  
  2715                                  ;-443           lexval=next();
  2716                                  
  2717 00000C0E E8C6FB                   call next
  2718 00000C11 A3[2B00]                 mov word [lexval], ax
  2719                                  
  2720                                  ;-444           if (lexval=='n') lexval=10;
  2721                                  
  2722 00000C14 A1[2B00]                 mov ax, [lexval]
  2723 00000C17 83F86E                   cmp ax, 110
  2724 00000C1A 0F850600                 jne .getlex124
  2725 00000C1E B80A00                   mov ax, 10
  2726 00000C21 A3[2B00]                 mov word [lexval], ax
  2727                                  
  2728                                  ;-445           if (lexval=='t') lexval= 9;
  2729                                  
  2730                                  .getlex124:
  2731 00000C24 A1[2B00]                 mov ax, [lexval]
  2732 00000C27 83F874                   cmp ax, 116
  2733 00000C2A 0F850600                 jne .getlex125
  2734 00000C2E B80900                   mov ax, 9
  2735 00000C31 A3[2B00]                 mov word [lexval], ax
  2736                                  
  2737                                  ;-446           if (lexval=='0') lexval= 0;
  2738                                  
  2739                                  .getlex125:
  2740 00000C34 A1[2B00]                 mov ax, [lexval]
  2741 00000C37 83F830                   cmp ax, 48
  2742 00000C3A 0F850600                 jne .getlex126
  2743 00000C3E B80000                   mov ax, 0
  2744 00000C41 A3[2B00]                 mov word [lexval], ax
  2745                                  
  2746                                  ;-447       }
  2747                                  
  2748                                  .getlex126:
  2749                                  
  2750                                  ;-448       next();
  2751                                  
  2752                                  .getlex123:
  2753 00000C44 E890FB                   call next
  2754                                  
  2755                                  ;-449       return T_CONST;
  2756                                  
  2757 00000C47 B80101                   mov ax, 257
  2758 00000C4A E97902                   jmp .retngetlex
  2759                                  
  2760                                  ;-450   }
  2761                                  
  2762                                  
  2763                                  ;-451   if (alnum(c)) {
  2764                                  
  2765                                  .getlex122:
  2766 00000C4D 8A46FE                   mov al, byte [bp-2]
  2767 00000C50 B400                     mov ah, 0
  2768 00000C52 50                       push ax
  2769 00000C53 E86FF5                   call alnum
  2770 00000C56 83C402                   add  sp, 2
  2771 00000C59 08C0                     or  al, al
  2772 00000C5B 0F845E02                 je .getlex127
  2773                                  
  2774                                  ;-452     strcpy(symboltemp, symbol);
  2775                                  
  2776 00000C5F 8D06A36D                 lea  ax, [symbol]
  2777 00000C63 50                       push ax
  2778 00000C64 8D0654A5                 lea  ax, [symboltemp]
  2779 00000C68 50                       push ax
  2780 00000C69 E8BDF5                   call strcpy
  2781 00000C6C 83C404                   add  sp, 4
  2782                                  
  2783                                  ;-453     p=&symbol;
  2784                                  
  2785 00000C6F B8A36D                   mov ax, symbol
  2786 00000C72 8946FC                   mov [bp-4], ax
  2787                                  
  2788                                  ;-454     *p=c;
  2789                                  
  2790 00000C75 8A46FE                   mov al, [bp-2]
  2791 00000C78 8B5EFC                   mov  bx, [bp-4]
  2792 00000C7B 8807                     mov  [bx], al
  2793                                  
  2794                                  ;-455     p++;
  2795                                  
  2796 00000C7D FF46FC                   inc  word[bp-4]
  2797                                  
  2798                                  ;-456     while(alnum(thechar)) {
  2799                                  
  2800                                  .getlex128:
  2801 00000C80 A0[2200]                 mov al, byte [thechar]
  2802 00000C83 B400                     mov ah, 0
  2803 00000C85 50                       push ax
  2804 00000C86 E83CF5                   call alnum
  2805 00000C89 83C402                   add  sp, 2
  2806 00000C8C 08C0                     or  al, al
  2807 00000C8E 0F841300                 je .getlex129
  2808                                  
  2809                                  ;-457         c=next();
  2810                                  
  2811 00000C92 E842FB                   call next
  2812 00000C95 8846FE                   mov [bp-2], al
  2813                                  
  2814                                  ;-458         *p=c;
  2815                                  
  2816 00000C98 8A46FE                   mov al, [bp-2]
  2817 00000C9B 8B5EFC                   mov  bx, [bp-4]
  2818 00000C9E 8807                     mov  [bx], al
  2819                                  
  2820                                  ;-459         p++;
  2821                                  
  2822 00000CA0 FF46FC                   inc  word[bp-4]
  2823                                  
  2824                                  ;-460     }
  2825                                  
  2826                                  
  2827                                  ;-461     *p=0;
  2828                                  
  2829 00000CA3 EBDB                     jmp .getlex128
  2830                                  .getlex129:
  2831 00000CA5 B80000                   mov ax, 0
  2832 00000CA8 8B5EFC                   mov  bx, [bp-4]
  2833 00000CAB 8807                     mov  [bx], al
  2834                                  
  2835                                  ;-462     if (eqstr(symbol,"signed"  )) return T_SIGNED;
  2836                                  
  2837 00000CAD 68[DE0E]                 push getlex_1
  2838 00000CB0 8D06A36D                 lea  ax, [symbol]
  2839 00000CB4 50                       push ax
  2840 00000CB5 E8A7F5                   call eqstr
  2841 00000CB8 83C404                   add  sp, 4
  2842 00000CBB 08C0                     or  al, al
  2843 00000CBD 0F840600                 je .getlex130
  2844 00000CC1 B81302                   mov ax, 531
  2845 00000CC4 E9FF01                   jmp .retngetlex
  2846                                  
  2847                                  ;-463     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;
  2848                                  
  2849                                  .getlex130:
  2850 00000CC7 68[E50E]                 push getlex_2
  2851 00000CCA 8D06A36D                 lea  ax, [symbol]
  2852 00000CCE 50                       push ax
  2853 00000CCF E88DF5                   call eqstr
  2854 00000CD2 83C404                   add  sp, 4
  2855 00000CD5 08C0                     or  al, al
  2856 00000CD7 0F840600                 je .getlex131
  2857 00000CDB B81402                   mov ax, 532
  2858 00000CDE E9E501                   jmp .retngetlex
  2859                                  
  2860                                  ;-464     if (eqstr(symbol,"void"    )) return T_VOID;
  2861                                  
  2862                                  .getlex131:
  2863 00000CE1 68[EE0E]                 push getlex_3
  2864 00000CE4 8D06A36D                 lea  ax, [symbol]
  2865 00000CE8 50                       push ax
  2866 00000CE9 E873F5                   call eqstr
  2867 00000CEC 83C404                   add  sp, 4
  2868 00000CEF 08C0                     or  al, al
  2869 00000CF1 0F840600                 je .getlex132
  2870 00000CF5 B81102                   mov ax, 529
  2871 00000CF8 E9CB01                   jmp .retngetlex
  2872                                  
  2873                                  ;-465     if (eqstr(symbol,"int"     )) return T_INT;
  2874                                  
  2875                                  .getlex132:
  2876 00000CFB 68[F30E]                 push getlex_4
  2877 00000CFE 8D06A36D                 lea  ax, [symbol]
  2878 00000D02 50                       push ax
  2879 00000D03 E859F5                   call eqstr
  2880 00000D06 83C404                   add  sp, 4
  2881 00000D09 08C0                     or  al, al
  2882 00000D0B 0F840600                 je .getlex133
  2883 00000D0F B80502                   mov ax, 517
  2884 00000D12 E9B101                   jmp .retngetlex
  2885                                  
  2886                                  ;-466     if (eqstr(symbol,"long"    )) return T_LONG;
  2887                                  
  2888                                  .getlex133:
  2889 00000D15 68[F70E]                 push getlex_5
  2890 00000D18 8D06A36D                 lea  ax, [symbol]
  2891 00000D1C 50                       push ax
  2892 00000D1D E83FF5                   call eqstr
  2893 00000D20 83C404                   add  sp, 4
  2894 00000D23 08C0                     or  al, al
  2895 00000D25 0F840600                 je .getlex134
  2896 00000D29 B81502                   mov ax, 533
  2897 00000D2C E99701                   jmp .retngetlex
  2898                                  
  2899                                  ;-467     if (eqstr(symbol,"char"    )) return T_CHAR;
  2900                                  
  2901                                  .getlex134:
  2902 00000D2F 68[FC0E]                 push getlex_6
  2903 00000D32 8D06A36D                 lea  ax, [symbol]
  2904 00000D36 50                       push ax
  2905 00000D37 E825F5                   call eqstr
  2906 00000D3A 83C404                   add  sp, 4
  2907 00000D3D 08C0                     or  al, al
  2908 00000D3F 0F840600                 je .getlex135
  2909 00000D43 B81202                   mov ax, 530
  2910 00000D46 E97D01                   jmp .retngetlex
  2911                                  
  2912                                  ;-468     if (eqstr(symbol,"asm"     )) return T_ASM;
  2913                                  
  2914                                  .getlex135:
  2915 00000D49 68[010F]                 push getlex_7
  2916 00000D4C 8D06A36D                 lea  ax, [symbol]
  2917 00000D50 50                       push ax
  2918 00000D51 E80BF5                   call eqstr
  2919 00000D54 83C404                   add  sp, 4
  2920 00000D57 08C0                     or  al, al
  2921 00000D59 0F840600                 je .getlex136
  2922 00000D5D B80602                   mov ax, 518
  2923 00000D60 E96301                   jmp .retngetlex
  2924                                  
  2925                                  ;-469     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;
  2926                                  
  2927                                  .getlex136:
  2928 00000D63 68[050F]                 push getlex_8
  2929 00000D66 8D06A36D                 lea  ax, [symbol]
  2930 00000D6A 50                       push ax
  2931 00000D6B E8F1F4                   call eqstr
  2932 00000D6E 83C404                   add  sp, 4
  2933 00000D71 08C0                     or  al, al
  2934 00000D73 0F840600                 je .getlex137
  2935 00000D77 B80702                   mov ax, 519
  2936 00000D7A E94901                   jmp .retngetlex
  2937                                  
  2938                                  ;-470     if (eqstr(symbol,"__emit__")) return T_EMIT;
  2939                                  
  2940                                  .getlex137:
  2941 00000D7D 68[0B0F]                 push getlex_9
  2942 00000D80 8D06A36D                 lea  ax, [symbol]
  2943 00000D84 50                       push ax
  2944 00000D85 E8D7F4                   call eqstr
  2945 00000D88 83C404                   add  sp, 4
  2946 00000D8B 08C0                     or  al, al
  2947 00000D8D 0F840600                 je .getlex138
  2948 00000D91 B80802                   mov ax, 520
  2949 00000D94 E92F01                   jmp .retngetlex
  2950                                  
  2951                                  ;-471     if (eqstr(symbol,"return"  )) return T_RETURN;
  2952                                  
  2953                                  .getlex138:
  2954 00000D97 68[140F]                 push getlex_10
  2955 00000D9A 8D06A36D                 lea  ax, [symbol]
  2956 00000D9E 50                       push ax
  2957 00000D9F E8BDF4                   call eqstr
  2958 00000DA2 83C404                   add  sp, 4
  2959 00000DA5 08C0                     or  al, al
  2960 00000DA7 0F840600                 je .getlex139
  2961 00000DAB B80002                   mov ax, 512
  2962 00000DAE E91501                   jmp .retngetlex
  2963                                  
  2964                                  ;-472     if (eqstr(symbol,"if"      )) return T_IF;
  2965                                  
  2966                                  .getlex139:
  2967 00000DB1 68[1B0F]                 push getlex_11
  2968 00000DB4 8D06A36D                 lea  ax, [symbol]
  2969 00000DB8 50                       push ax
  2970 00000DB9 E8A3F4                   call eqstr
  2971 00000DBC 83C404                   add  sp, 4
  2972 00000DBF 08C0                     or  al, al
  2973 00000DC1 0F840600                 je .getlex140
  2974 00000DC5 B80102                   mov ax, 513
  2975 00000DC8 E9FB00                   jmp .retngetlex
  2976                                  
  2977                                  ;-473     if (eqstr(symbol,"else"    )) return T_ELSE;
  2978                                  
  2979                                  .getlex140:
  2980 00000DCB 68[1E0F]                 push getlex_12
  2981 00000DCE 8D06A36D                 lea  ax, [symbol]
  2982 00000DD2 50                       push ax
  2983 00000DD3 E889F4                   call eqstr
  2984 00000DD6 83C404                   add  sp, 4
  2985 00000DD9 08C0                     or  al, al
  2986 00000DDB 0F840600                 je .getlex141
  2987 00000DDF B80202                   mov ax, 514
  2988 00000DE2 E9E100                   jmp .retngetlex
  2989                                  
  2990                                  ;-474     if (eqstr(symbol,"while"   )) return T_WHILE;
  2991                                  
  2992                                  .getlex141:
  2993 00000DE5 68[230F]                 push getlex_13
  2994 00000DE8 8D06A36D                 lea  ax, [symbol]
  2995 00000DEC 50                       push ax
  2996 00000DED E86FF4                   call eqstr
  2997 00000DF0 83C404                   add  sp, 4
  2998 00000DF3 08C0                     or  al, al
  2999 00000DF5 0F840600                 je .getlex142
  3000 00000DF9 B80302                   mov ax, 515
  3001 00000DFC E9C700                   jmp .retngetlex
  3002                                  
  3003                                  ;-475     if (eqstr(symbol,"do"      )) return T_DO;
  3004                                  
  3005                                  .getlex142:
  3006 00000DFF 68[290F]                 push getlex_14
  3007 00000E02 8D06A36D                 lea  ax, [symbol]
  3008 00000E06 50                       push ax
  3009 00000E07 E855F4                   call eqstr
  3010 00000E0A 83C404                   add  sp, 4
  3011 00000E0D 08C0                     or  al, al
  3012 00000E0F 0F840600                 je .getlex143
  3013 00000E13 B80402                   mov ax, 516
  3014 00000E16 E9AD00                   jmp .retngetlex
  3015                                  
  3016                                  ;-476     if (eqstr(symbol,"goto"    )) return T_GOTO;
  3017                                  
  3018                                  .getlex143:
  3019 00000E19 68[2C0F]                 push getlex_15
  3020 00000E1C 8D06A36D                 lea  ax, [symbol]
  3021 00000E20 50                       push ax
  3022 00000E21 E83BF4                   call eqstr
  3023 00000E24 83C404                   add  sp, 4
  3024 00000E27 08C0                     or  al, al
  3025 00000E29 0F840600                 je .getlex144
  3026 00000E2D B80902                   mov ax, 521
  3027 00000E30 E99300                   jmp .retngetlex
  3028                                  
  3029                                  ;-477     if (eqstr(symbol,"define"  )) return T_DEFINE;
  3030                                  
  3031                                  .getlex144:
  3032 00000E33 68[310F]                 push getlex_16
  3033 00000E36 8D06A36D                 lea  ax, [symbol]
  3034 00000E3A 50                       push ax
  3035 00000E3B E821F4                   call eqstr
  3036 00000E3E 83C404                   add  sp, 4
  3037 00000E41 08C0                     or  al, al
  3038 00000E43 0F840600                 je .getlex145
  3039 00000E47 B8FF01                   mov ax, 511
  3040 00000E4A E97900                   jmp .retngetlex
  3041                                  
  3042                                  ;-478 
  3043                                  
  3044                                  
  3045                                  ;-479     i=0;//convert define to value
  3046                                  
  3047                                  .getlex145:
  3048 00000E4D B80000                   mov ax, 0
  3049 00000E50 8946FA                   mov [bp-6], ax
  3050                                  
  3051                                  ;-480     while (i < GTop) {
  3052                                  
  3053                                  .getlex146:
  3054 00000E53 8B46FA                   mov ax, [bp-6]
  3055 00000E56 3B06[3800]               cmp ax, [GTop]
  3056 00000E5A 0F8D5900                 jge .getlex147
  3057                                  
  3058                                  ;-481         j=adrF(GNameField, i);
  3059                                  
  3060 00000E5E FF76FA                   push word [bp-6]
  3061 00000E61 8D067879                 lea  ax, [GNameField]
  3062 00000E65 50                       push ax
  3063 00000E66 E886F9                   call adrF
  3064 00000E69 83C404                   add  sp, 4
  3065 00000E6C 8946F8                   mov [bp-8], ax
  3066                                  
  3067                                  ;-482         if (eqstr(symbol,j)) {
  3068                                  
  3069 00000E6F FF76F8                   push word [bp-8]
  3070 00000E72 8D06A36D                 lea  ax, [symbol]
  3071 00000E76 50                       push ax
  3072 00000E77 E8E5F3                   call eqstr
  3073 00000E7A 83C404                   add  sp, 4
  3074 00000E7D 08C0                     or  al, al
  3075 00000E7F 0F842F00                 je .getlex148
  3076                                  
  3077                                  ;-483             if (GType[i]=='#') {
  3078                                  
  3079 00000E83 8B5EFA                   mov bx, [bp-6]
  3080 00000E86 8A87EC6E                 mov al, [GType + bx]
  3081 00000E8A 3C23                     cmp al, 35
  3082 00000E8C 0F852200                 jne .getlex149
  3083                                  
  3084                                  ;-484                 lexval=GData[i];
  3085                                  
  3086 00000E90 8B5EFA                   mov bx, [bp-6]
  3087 00000E93 D1E3                     shl bx, 1
  3088 00000E95 8B872077                 mov ax, [GData + bx]
  3089 00000E99 A3[2B00]                 mov word [lexval], ax
  3090                                  
  3091                                  ;-485                 strcpy(symbol, symboltemp);
  3092                                  
  3093 00000E9C 8D0654A5                 lea  ax, [symboltemp]
  3094 00000EA0 50                       push ax
  3095 00000EA1 8D06A36D                 lea  ax, [symbol]
  3096 00000EA5 50                       push ax
  3097 00000EA6 E880F3                   call strcpy
  3098 00000EA9 83C404                   add  sp, 4
  3099                                  
  3100                                  ;-486                 return T_CONST;
  3101                                  
  3102 00000EAC B80101                   mov ax, 257
  3103 00000EAF E91400                   jmp .retngetlex
  3104                                  
  3105                                  ;-487             }
  3106                                  
  3107                                  
  3108                                  ;-488         }
  3109                                  
  3110                                  .getlex149:
  3111                                  
  3112                                  ;-489         i++;
  3113                                  
  3114                                  .getlex148:
  3115 00000EB2 FF46FA                   inc  word[bp-6]
  3116                                  
  3117                                  ;-490     }
  3118                                  
  3119                                  
  3120                                  ;-491     return T_NAME; } error1("Input item not recognized");
  3121                                  
  3122 00000EB5 EB9C                     jmp .getlex146
  3123                                  .getlex147:
  3124 00000EB7 B80001                   mov ax, 256
  3125 00000EBA E90900                   jmp .retngetlex
  3126                                  .getlex127:
  3127 00000EBD 68[380F]                 push getlex_17
  3128 00000EC0 E83DF7                   call error1
  3129 00000EC3 83C402                   add  sp, 2
  3130                                  
  3131                                  ;-492 }
  3132                                  
  3133                                  
  3134                                  ;-493 
  3135                                  
  3136                                  
  3137                                  ;-494 int istoken(int t) {
  3138                                  
  3139 00000EC6 C9                       .retngetlex: LEAVE
  3140 00000EC7 C3                       ret
  3141 00000EC8 28295B5D7B7D2C3B2A-     getlex_0 db "()[]{},;*:%-><=+!&|#?",0
  3142 00000ED1 3A252D3E3C3D2B2126-
  3143 00000EDA 7C233F00           
  3144 00000EDE 7369676E656400          getlex_1 db "signed",0
  3145 00000EE5 756E7369676E656400      getlex_2 db "unsigned",0
  3146 00000EEE 766F696400              getlex_3 db "void",0
  3147 00000EF3 696E7400                getlex_4 db "int",0
  3148 00000EF7 6C6F6E6700              getlex_5 db "long",0
  3149 00000EFC 6368617200              getlex_6 db "char",0
  3150 00000F01 61736D00                getlex_7 db "asm",0
  3151 00000F05 5F5F61736D00            getlex_8 db "__asm",0
  3152 00000F0B 5F5F656D69745F5F00      getlex_9 db "__emit__",0
  3153 00000F14 72657475726E00          getlex_10 db "return",0
  3154 00000F1B 696600                  getlex_11 db "if",0
  3155 00000F1E 656C736500              getlex_12 db "else",0
  3156 00000F23 7768696C6500            getlex_13 db "while",0
  3157 00000F29 646F00                  getlex_14 db "do",0
  3158 00000F2C 676F746F00              getlex_15 db "goto",0
  3159 00000F31 646566696E6500          getlex_16 db "define",0
  3160 00000F38 496E70757420697465-     getlex_17 db "Input item not recognized",0
  3161 00000F41 6D206E6F7420726563-
  3162 00000F4A 6F676E697A656400   
  3163                                  ENDP
  3164                                  
  3165                                  istoken: PROC
  3166                                  
  3167                                  ;-495     if (token == t) {
  3168                                  ;
  3169 00000F52 C8000000                 ENTER  0,0
  3170 00000F56 A1[1E00]                 mov ax, [token]
  3171 00000F59 3B4604                   cmp ax, [bp+4]
  3172 00000F5C 0F850C00                 jne .istoken150
  3173                                  
  3174                                  ;-496         token=getlex();
  3175                                  
  3176 00000F60 E83DF9                   call getlex
  3177 00000F63 A3[1E00]                 mov word [token], ax
  3178                                  
  3179                                  ;-497         return 1;
  3180                                  
  3181 00000F66 B80100                   mov ax, 1
  3182 00000F69 E90600                   jmp .retnistoken
  3183                                  
  3184                                  ;-498     }
  3185                                  
  3186                                  
  3187                                  ;-499     return 0;
  3188                                  
  3189                                  .istoken150:
  3190 00000F6C B80000                   mov ax, 0
  3191 00000F6F E90000                   jmp .retnistoken
  3192                                  
  3193                                  ;-500 }
  3194                                  
  3195                                  
  3196                                  ;-501 int expect(int t) {
  3197                                  
  3198 00000F72 C9                       .retnistoken: LEAVE
  3199 00000F73 C3                       ret
  3200                                  ENDP
  3201                                  
  3202                                  expect: PROC
  3203                                  
  3204                                  ;-502     if (istoken(t)==0) {
  3205                                  ;
  3206 00000F74 C8000000                 ENTER  0,0
  3207 00000F78 FF7604                   push word [bp+4]
  3208 00000F7B E8D4FF                   call istoken
  3209 00000F7E 83C402                   add  sp, 2
  3210 00000F81 83F800                   cmp ax, 0
  3211 00000F84 0F852F00                 jne .expect151
  3212                                  
  3213                                  ;-503         *cloc=0;
  3214                                  
  3215 00000F88 B80000                   mov ax, 0
  3216 00000F8B 8B1E[1800]               mov  bx, [cloc]
  3217 00000F8F 8807                     mov  [bx], al
  3218                                  
  3219                                  ;-504         prs(co);
  3220                                  
  3221 00000F91 8D06A861                 lea  ax, [co]
  3222 00000F95 50                       push ax
  3223 00000F96 E846F4                   call prs
  3224 00000F99 83C402                   add  sp, 2
  3225                                  
  3226                                  ;-505         prs("\nExpected ASCII(dez): ");
  3227                                  
  3228 00000F9C 68[B90F]                 push expect_0
  3229 00000F9F E83DF4                   call prs
  3230 00000FA2 83C402                   add  sp, 2
  3231                                  
  3232                                  ;-506         pint1(t);
  3233                                  
  3234 00000FA5 FF7604                   push word [bp+4]
  3235 00000FA8 E839F5                   call pint1
  3236 00000FAB 83C402                   add  sp, 2
  3237                                  
  3238                                  ;-507         error1(" not found");
  3239                                  
  3240 00000FAE 68[D10F]                 push expect_1
  3241 00000FB1 E84CF6                   call error1
  3242 00000FB4 83C402                   add  sp, 2
  3243                                  
  3244                                  ;-508     }
  3245                                  
  3246                                  
  3247                                  ;-509 }
  3248                                  
  3249                                  .expect151:
  3250                                  
  3251                                  ;-510 
  3252                                  
  3253                                  
  3254                                  ;-511 int v(unsigned int i) {//value
  3255 00000FB7 C9                       LEAVE
  3256 00000FB8 C3                       ret
  3257 00000FB9 5C6E45787065637465-     expect_0 db "\nExpected ASCII(dez): ",0
  3258 00000FC2 642041534349492864-
  3259 00000FCB 657A293A2000       
  3260 00000FD1 206E6F7420666F756E-     expect_1 db " not found",0
  3261 00000FDA 6400               
  3262                                  ENDP
  3263                                  
  3264                                  v: PROC
  3265                                  
  3266                                  ;-512     if (i < LSTART) prc('[');
  3267                                  ;
  3268 00000FDC C8000000                 ENTER  0,0
  3269 00000FE0 8B4604                   mov ax, [bp+4]
  3270 00000FE3 3DC800                   cmp ax, 200
  3271 00000FE6 0F8D0800                 jge .v152
  3272 00000FEA 6A5B                     push 91
  3273 00000FEC E897F3                   call prc
  3274 00000FEF 83C402                   add  sp, 2
  3275                                  
  3276                                  ;-513     printName(i);
  3277                                  
  3278                                  .v152:
  3279 00000FF2 FF7604                   push word [bp+4]
  3280 00000FF5 E806F8                   call printName
  3281 00000FF8 83C402                   add  sp, 2
  3282                                  
  3283                                  ;-514     if (i < LSTART) prc(']');
  3284                                  
  3285 00000FFB 8B4604                   mov ax, [bp+4]
  3286 00000FFE 3DC800                   cmp ax, 200
  3287 00001001 0F8D0800                 jge .v153
  3288 00001005 6A5D                     push 93
  3289 00001007 E87CF3                   call prc
  3290 0000100A 83C402                   add  sp, 2
  3291                                  
  3292                                  ;-515 }
  3293                                  
  3294                                  .v153:
  3295                                  
  3296                                  ;-516 int checknamelen() {
  3297 0000100D C9                       LEAVE
  3298 0000100E C3                       ret
  3299                                  ENDP
  3300                                  
  3301                                  checknamelen: PROC
  3302                                  
  3303                                  ;-517     int i;
  3304                                  
  3305                                  
  3306                                  ;-518     i=strlen(symbol);
  3307                                  ;
  3308 0000100F C8020000                 ENTER  2,0
  3309 00001013 8D06A36D                 lea  ax, [symbol]
  3310 00001017 50                       push ax
  3311 00001018 E8E6F1                   call strlen
  3312 0000101B 83C402                   add  sp, 2
  3313 0000101E 8946FE                   mov [bp-2], ax
  3314                                  
  3315                                  ;-519     if (i > IDLENMAX) error1("Item name is too long in characters)");
  3316                                  
  3317 00001021 8B46FE                   mov ax, [bp-2]
  3318 00001024 83F80F                   cmp ax, 15
  3319 00001027 0F8E0900                 jle .checknamelen154
  3320 0000102B 68[3610]                 push checknamelen_0
  3321 0000102E E8CFF5                   call error1
  3322 00001031 83C402                   add  sp, 2
  3323                                  
  3324                                  ;-520 }
  3325                                  
  3326                                  .checknamelen154:
  3327                                  
  3328                                  ;-521 
  3329                                  
  3330                                  
  3331                                  ;-522 int checkName() { unsigned int i; unsigned int j;
  3332 00001034 C9                       LEAVE
  3333 00001035 C3                       ret
  3334 00001036 4974656D206E616D65-     checknamelen_0 db "Item name is too long in characters)",0
  3335 0000103F 20697320746F6F206C-
  3336 00001048 6F6E6720696E206368-
  3337 00001051 617261637465727329-
  3338 0000105A 00                 
  3339                                  ENDP
  3340                                  
  3341                                  checkName: PROC
  3342                                  
  3343                                  ;-523     i=LSTART;
  3344                                  ;
  3345 0000105B C8040000                 ENTER  4,0
  3346 0000105F B8C800                   mov ax, 200
  3347 00001062 8946FE                   mov [bp-2], ax
  3348                                  
  3349                                  ;-524     while(i<LTop) {
  3350                                  
  3351                                  .checkName155:
  3352 00001065 8B46FE                   mov ax, [bp-2]
  3353 00001068 3B06[3A00]               cmp ax, [LTop]
  3354 0000106C 0F8D3000                 jge .checkName156
  3355                                  
  3356                                  ;-525         j=adrF(GNameField, i);
  3357                                  
  3358 00001070 FF76FE                   push word [bp-2]
  3359 00001073 8D067879                 lea  ax, [GNameField]
  3360 00001077 50                       push ax
  3361 00001078 E874F7                   call adrF
  3362 0000107B 83C404                   add  sp, 4
  3363 0000107E 8946FC                   mov [bp-4], ax
  3364                                  
  3365                                  ;-526         if(eqstr(symbol,j))return i;
  3366                                  
  3367 00001081 FF76FC                   push word [bp-4]
  3368 00001084 8D06A36D                 lea  ax, [symbol]
  3369 00001088 50                       push ax
  3370 00001089 E8D3F1                   call eqstr
  3371 0000108C 83C404                   add  sp, 4
  3372 0000108F 08C0                     or  al, al
  3373 00001091 0F840600                 je .checkName157
  3374 00001095 8B46FE                   mov ax, [bp-2]
  3375 00001098 E94C00                   jmp .retncheckName
  3376                                  
  3377                                  ;-527         i++;
  3378                                  
  3379                                  .checkName157:
  3380 0000109B FF46FE                   inc  word[bp-2]
  3381                                  
  3382                                  ;-528     }
  3383                                  
  3384                                  
  3385                                  ;-529     i=1;
  3386                                  
  3387 0000109E EBC5                     jmp .checkName155
  3388                                  .checkName156:
  3389 000010A0 B80100                   mov ax, 1
  3390 000010A3 8946FE                   mov [bp-2], ax
  3391                                  
  3392                                  ;-530     while(i<GTop) {
  3393                                  
  3394                                  .checkName158:
  3395 000010A6 8B46FE                   mov ax, [bp-2]
  3396 000010A9 3B06[3800]               cmp ax, [GTop]
  3397 000010AD 0F8D3000                 jge .checkName159
  3398                                  
  3399                                  ;-531         j=adrF(GNameField, i);
  3400                                  
  3401 000010B1 FF76FE                   push word [bp-2]
  3402 000010B4 8D067879                 lea  ax, [GNameField]
  3403 000010B8 50                       push ax
  3404 000010B9 E833F7                   call adrF
  3405 000010BC 83C404                   add  sp, 4
  3406 000010BF 8946FC                   mov [bp-4], ax
  3407                                  
  3408                                  ;-532         if(eqstr(symbol,j))return i;
  3409                                  
  3410 000010C2 FF76FC                   push word [bp-4]
  3411 000010C5 8D06A36D                 lea  ax, [symbol]
  3412 000010C9 50                       push ax
  3413 000010CA E892F1                   call eqstr
  3414 000010CD 83C404                   add  sp, 4
  3415 000010D0 08C0                     or  al, al
  3416 000010D2 0F840600                 je .checkName160
  3417 000010D6 8B46FE                   mov ax, [bp-2]
  3418 000010D9 E90B00                   jmp .retncheckName
  3419                                  
  3420                                  ;-533         i++;
  3421                                  
  3422                                  .checkName160:
  3423 000010DC FF46FE                   inc  word[bp-2]
  3424                                  
  3425                                  ;-534     }
  3426                                  
  3427                                  
  3428                                  ;-535     return 0;
  3429                                  
  3430 000010DF EBC5                     jmp .checkName158
  3431                                  .checkName159:
  3432 000010E1 B80000                   mov ax, 0
  3433 000010E4 E90000                   jmp .retncheckName
  3434                                  
  3435                                  ;-536 }
  3436                                  
  3437                                  
  3438                                  ;-537 int searchname() { unsigned int i;
  3439                                  
  3440 000010E7 C9                       .retncheckName: LEAVE
  3441 000010E8 C3                       ret
  3442                                  ENDP
  3443                                  
  3444                                  searchname: PROC
  3445                                  
  3446                                  ;-538   i=checkName(); if (i == 0) error1("Variable unknown");
  3447                                  ;
  3448 000010E9 C8020000                 ENTER  2,0
  3449 000010ED E86BFF                   call checkName
  3450 000010F0 8946FE                   mov [bp-2], ax
  3451 000010F3 8B46FE                   mov ax, [bp-2]
  3452 000010F6 83F800                   cmp ax, 0
  3453 000010F9 0F850900                 jne .searchname161
  3454 000010FD 68[2311]                 push searchname_0
  3455 00001100 E8FDF4                   call error1
  3456 00001103 83C402                   add  sp, 2
  3457                                  
  3458                                  ;-539   GUsed[i]=GUsed[i] + 1; return i;
  3459                                  
  3460                                  .searchname161:
  3461 00001106 8B5EFE                   mov bx, [bp-2]
  3462 00001109 D1E3                     shl bx, 1
  3463 0000110B 8B87C874                 mov ax, [GUsed + bx]
  3464 0000110F 83C001                   add ax, 1
  3465 00001112 8B5EFE                   mov bx, [bp-2]
  3466 00001115 D1E3                     shl bx, 1
  3467 00001117 8987C874                 mov [GUsed+bx], ax
  3468 0000111B 8B46FE                   mov ax, [bp-2]
  3469 0000111E E90000                   jmp .retnsearchname
  3470                                  
  3471                                  ;-540 }
  3472                                  
  3473                                  
  3474                                  ;-541 int name1() {
  3475                                  
  3476 00001121 C9                       .retnsearchname: LEAVE
  3477 00001122 C3                       ret
  3478 00001123 5661726961626C6520-     searchname_0 db "Variable unknown",0
  3479 0000112C 756E6B6E6F776E00   
  3480                                  ENDP
  3481                                  
  3482                                  name1: PROC
  3483                                  
  3484                                  ;-542     if (token!=T_NAME) error1("Name expected");
  3485                                  
  3486 00001134 A1[1E00]                 mov ax, [token]
  3487 00001137 3D0001                   cmp ax, 256
  3488 0000113A 0F840900                 je  .name1162
  3489 0000113E 68[4E11]                 push name1_0
  3490 00001141 E8BCF4                   call error1
  3491 00001144 83C402                   add  sp, 2
  3492                                  
  3493                                  ;-543     token=getlex();
  3494                                  
  3495                                  .name1162:
  3496 00001147 E856F7                   call getlex
  3497 0000114A A3[1E00]                 mov word [token], ax
  3498                                  
  3499                                  ;-544 }
  3500                                  
  3501                                  
  3502                                  ;-545 int typeName() { int m; //0=V,1=*,2=&
  3503                                  
  3504 0000114D C3                       ret
  3505 0000114E 4E616D652065787065-     name1_0 db "Name expected",0
  3506 00001157 6374656400         
  3507                                  ENDP
  3508                                  
  3509                                  typeName: PROC
  3510                                  
  3511                                  ;-546     issign='S';
  3512                                  ;
  3513 0000115C C8020000                 ENTER  2,0
  3514 00001160 B85300                   mov ax, 83
  3515 00001163 A2[3200]                 mov byte [issign], al
  3516                                  
  3517                                  ;-547     if(istoken(T_SIGNED))   issign='S';
  3518                                  
  3519 00001166 681302                   push 531
  3520 00001169 E8E6FD                   call istoken
  3521 0000116C 83C402                   add  sp, 2
  3522 0000116F 08C0                     or  al, al
  3523 00001171 0F840600                 je .typeName163
  3524 00001175 B85300                   mov ax, 83
  3525 00001178 A2[3200]                 mov byte [issign], al
  3526                                  
  3527                                  ;-548     if(istoken(T_UNSIGNED)) issign='U';
  3528                                  
  3529                                  .typeName163:
  3530 0000117B 681402                   push 532
  3531 0000117E E8D1FD                   call istoken
  3532 00001181 83C402                   add  sp, 2
  3533 00001184 08C0                     or  al, al
  3534 00001186 0F840600                 je .typeName164
  3535 0000118A B85500                   mov ax, 85
  3536 0000118D A2[3200]                 mov byte [issign], al
  3537                                  
  3538                                  ;-549     iswidth=2;
  3539                                  
  3540                                  .typeName164:
  3541 00001190 B80200                   mov ax, 2
  3542 00001193 A2[3500]                 mov byte [iswidth], al
  3543                                  
  3544                                  ;-550     if(istoken(T_VOID))     iswidth=0;
  3545                                  
  3546 00001196 681102                   push 529
  3547 00001199 E8B6FD                   call istoken
  3548 0000119C 83C402                   add  sp, 2
  3549 0000119F 08C0                     or  al, al
  3550 000011A1 0F840600                 je .typeName165
  3551 000011A5 B80000                   mov ax, 0
  3552 000011A8 A2[3500]                 mov byte [iswidth], al
  3553                                  
  3554                                  ;-551     if(istoken(T_CHAR))     iswidth=1;
  3555                                  
  3556                                  .typeName165:
  3557 000011AB 681202                   push 530
  3558 000011AE E8A1FD                   call istoken
  3559 000011B1 83C402                   add  sp, 2
  3560 000011B4 08C0                     or  al, al
  3561 000011B6 0F840600                 je .typeName166
  3562 000011BA B80100                   mov ax, 1
  3563 000011BD A2[3500]                 mov byte [iswidth], al
  3564                                  
  3565                                  ;-552     if(istoken(T_INT))      iswidth=2;
  3566                                  
  3567                                  .typeName166:
  3568 000011C0 680502                   push 517
  3569 000011C3 E88CFD                   call istoken
  3570 000011C6 83C402                   add  sp, 2
  3571 000011C9 08C0                     or  al, al
  3572 000011CB 0F840600                 je .typeName167
  3573 000011CF B80200                   mov ax, 2
  3574 000011D2 A2[3500]                 mov byte [iswidth], al
  3575                                  
  3576                                  ;-553     if(istoken(T_LONG))     iswidth=4;
  3577                                  
  3578                                  .typeName167:
  3579 000011D5 681502                   push 533
  3580 000011D8 E877FD                   call istoken
  3581 000011DB 83C402                   add  sp, 2
  3582 000011DE 08C0                     or  al, al
  3583 000011E0 0F840600                 je .typeName168
  3584 000011E4 B80400                   mov ax, 4
  3585 000011E7 A2[3500]                 mov byte [iswidth], al
  3586                                  
  3587                                  ;-554     istype='V';
  3588                                  
  3589                                  .typeName168:
  3590 000011EA B85600                   mov ax, 86
  3591 000011ED A2[2F00]                 mov byte [istype], al
  3592                                  
  3593                                  ;-555     m=0;
  3594                                  
  3595 000011F0 B80000                   mov ax, 0
  3596 000011F3 8946FE                   mov [bp-2], ax
  3597                                  
  3598                                  ;-556     if(istoken('*'))  {istype='*'; m=1;}
  3599                                  
  3600 000011F6 6A2A                     push 42
  3601 000011F8 E857FD                   call istoken
  3602 000011FB 83C402                   add  sp, 2
  3603 000011FE 08C0                     or  al, al
  3604 00001200 0F840C00                 je .typeName169
  3605 00001204 B82A00                   mov ax, 42
  3606 00001207 A2[2F00]                 mov byte [istype], al
  3607 0000120A B80100                   mov ax, 1
  3608 0000120D 8946FE                   mov [bp-2], ax
  3609                                  
  3610                                  ;-557     if(istoken('&'))  {istype='&'; m=2;}
  3611                                  
  3612                                  .typeName169:
  3613 00001210 6A26                     push 38
  3614 00001212 E83DFD                   call istoken
  3615 00001215 83C402                   add  sp, 2
  3616 00001218 08C0                     or  al, al
  3617 0000121A 0F840C00                 je .typeName170
  3618 0000121E B82600                   mov ax, 38
  3619 00001221 A2[2F00]                 mov byte [istype], al
  3620 00001224 B80200                   mov ax, 2
  3621 00001227 8946FE                   mov [bp-2], ax
  3622                                  
  3623                                  ;-558     name1();
  3624                                  
  3625                                  .typeName170:
  3626 0000122A E807FF                   call name1
  3627                                  
  3628                                  ;-559     return m;
  3629                                  
  3630 0000122D 8B46FE                   mov ax, [bp-2]
  3631 00001230 E90000                   jmp .retntypeName
  3632                                  
  3633                                  ;-560 }
  3634                                  
  3635                                  
  3636                                  ;-561 int gettypes(int i) {int j; char c;
  3637                                  
  3638 00001233 C9                       .retntypeName: LEAVE
  3639 00001234 C3                       ret
  3640                                  ENDP
  3641                                  
  3642                                  gettypes: PROC
  3643                                  
  3644                                  ;-562   c=GSign [i]; if (c=='S') signi =1;    else signi =0;
  3645                                  ;
  3646 00001235 C8040000                 ENTER  4,0
  3647 00001239 8B5E04                   mov bx, [bp+4]
  3648 0000123C 8A871870                 mov al, [GSign + bx]
  3649 00001240 8846FC                   mov [bp-4], al
  3650 00001243 8A46FC                   mov al, [bp-4]
  3651 00001246 3C53                     cmp al, 83
  3652 00001248 0F850900                 jne .gettypes171
  3653 0000124C B80100                   mov ax, 1
  3654 0000124F A3[3000]                 mov word [signi], ax
  3655 00001252 E90600                   jmp .gettypes172
  3656                                  .gettypes171:
  3657 00001255 B80000                   mov ax, 0
  3658 00001258 A3[3000]                 mov word [signi], ax
  3659                                  
  3660                                  ;-563   c=GWidth[i]; widthi=0;wi=0;
  3661                                  
  3662                                  .gettypes172:
  3663 0000125B 8B5E04                   mov bx, [bp+4]
  3664 0000125E 8A874471                 mov al, [GWidth + bx]
  3665 00001262 8846FC                   mov [bp-4], al
  3666 00001265 B80000                   mov ax, 0
  3667 00001268 A3[3300]                 mov word [widthi], ax
  3668 0000126B B80000                   mov ax, 0
  3669 0000126E A3[3600]                 mov word [wi], ax
  3670                                  
  3671                                  ;-564   if (c==1) {widthi=1;wi=1;}
  3672                                  
  3673 00001271 8A46FC                   mov al, [bp-4]
  3674 00001274 3C01                     cmp al, 1
  3675 00001276 0F850C00                 jne .gettypes173
  3676 0000127A B80100                   mov ax, 1
  3677 0000127D A3[3300]                 mov word [widthi], ax
  3678 00001280 B80100                   mov ax, 1
  3679 00001283 A3[3600]                 mov word [wi], ax
  3680                                  
  3681                                  ;-565   if (c==2) {widthi=2;wi=2;}
  3682                                  
  3683                                  .gettypes173:
  3684 00001286 8A46FC                   mov al, [bp-4]
  3685 00001289 3C02                     cmp al, 2
  3686 0000128B 0F850C00                 jne .gettypes174
  3687 0000128F B80200                   mov ax, 2
  3688 00001292 A3[3300]                 mov word [widthi], ax
  3689 00001295 B80200                   mov ax, 2
  3690 00001298 A3[3600]                 mov word [wi], ax
  3691                                  
  3692                                  ;-566   if (c==4) {widthi=4;wi=4;}
  3693                                  
  3694                                  .gettypes174:
  3695 0000129B 8A46FC                   mov al, [bp-4]
  3696 0000129E 3C04                     cmp al, 4
  3697 000012A0 0F850C00                 jne .gettypes175
  3698 000012A4 B80400                   mov ax, 4
  3699 000012A7 A3[3300]                 mov word [widthi], ax
  3700 000012AA B80400                   mov ax, 4
  3701 000012AD A3[3600]                 mov word [wi], ax
  3702                                  
  3703                                  ;-567   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}
  3704                                  
  3705                                  .gettypes175:
  3706 000012B0 8B5E04                   mov bx, [bp+4]
  3707 000012B3 8A87EC6E                 mov al, [GType + bx]
  3708 000012B7 8846FC                   mov [bp-4], al
  3709 000012BA B80000                   mov ax, 0
  3710 000012BD A3[2D00]                 mov word [typei], ax
  3711 000012C0 8A46FC                   mov al, [bp-4]
  3712 000012C3 3C2A                     cmp al, 42
  3713 000012C5 0F850C00                 jne .gettypes176
  3714 000012C9 B80100                   mov ax, 1
  3715 000012CC A3[2D00]                 mov word [typei], ax
  3716 000012CF B80200                   mov ax, 2
  3717 000012D2 A3[3600]                 mov word [wi], ax
  3718                                  
  3719                                  ;-568   if (c=='&')  typei=2;
  3720                                  
  3721                                  .gettypes176:
  3722 000012D5 8A46FC                   mov al, [bp-4]
  3723 000012D8 3C26                     cmp al, 38
  3724 000012DA 0F850600                 jne .gettypes177
  3725 000012DE B80200                   mov ax, 2
  3726 000012E1 A3[2D00]                 mov word [typei], ax
  3727                                  
  3728                                  ;-569   return i; }
  3729                                  
  3730                                  .gettypes177:
  3731 000012E4 8B4604                   mov ax, [bp+4]
  3732 000012E7 E90000                   jmp .retngettypes
  3733                                  
  3734                                  ;-570 
  3735                                  
  3736                                  
  3737                                  ;-571 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");
  3738                                  
  3739 000012EA C9                       .retngettypes: LEAVE
  3740 000012EB C3                       ret
  3741                                  ENDP
  3742                                  
  3743                                  addlocal: PROC
  3744 000012EC A1[3A00]                 mov ax, [LTop]
  3745 000012EF 3D2C01                   cmp ax, 300 ;unsigned : 1
  3746 000012F2 0F8C0900                 jl  .addlocal178
  3747 000012F6 68[7213]                 push addlocal_0
  3748 000012F9 E804F3                   call error1
  3749 000012FC 83C402                   add  sp, 2
  3750                                  
  3751                                  ;-572   if (checkName() != 0) error1("Variable already defined");
  3752                                  
  3753                                  .addlocal178:
  3754 000012FF E859FD                   call checkName
  3755 00001302 83F800                   cmp ax, 0
  3756 00001305 0F840900                 je  .addlocal179
  3757 00001309 68[8C13]                 push addlocal_1
  3758 0000130C E8F1F2                   call error1
  3759 0000130F 83C402                   add  sp, 2
  3760                                  
  3761                                  ;-573   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;
  3762                                  
  3763                                  .addlocal179:
  3764 00001312 A0[3200]                 mov al, [issign]
  3765 00001315 8B1E[3A00]               mov bx, [LTop]
  3766 00001319 88871870                 mov [GSign+bx], al
  3767 0000131D A0[3500]                 mov al, [iswidth]
  3768 00001320 8B1E[3A00]               mov bx, [LTop]
  3769 00001324 88874471                 mov [GWidth+bx], al
  3770 00001328 A0[2F00]                 mov al, [istype]
  3771 0000132B 8B1E[3A00]               mov bx, [LTop]
  3772 0000132F 8887EC6E                 mov [GType+bx], al
  3773                                  
  3774                                  ;-574   GAdr [LTop]=lineno-1; GUsed[LTop]=0;
  3775                                  
  3776 00001333 A1[4000]                 mov ax, [lineno]
  3777 00001336 83E801                   sub ax, 1
  3778 00001339 8B1E[3A00]               mov bx, [LTop]
  3779 0000133D D1E3                     shl bx, 1
  3780 0000133F 89877072                 mov [GAdr+bx], ax
  3781 00001343 B80000                   mov ax, 0
  3782 00001346 8B1E[3A00]               mov bx, [LTop]
  3783 0000134A D1E3                     shl bx, 1
  3784 0000134C 8987C874                 mov [GUsed+bx], ax
  3785                                  
  3786                                  ;-575   pt=adrF(GNameField, LTop); strcpy(pt, symbol);
  3787                                  
  3788 00001350 FF36[3A00]               push word [LTop]
  3789 00001354 8D067879                 lea  ax, [GNameField]
  3790 00001358 50                       push ax
  3791 00001359 E893F4                   call adrF
  3792 0000135C 83C404                   add  sp, 4
  3793 0000135F A3[4200]                 mov word [pt], ax
  3794 00001362 8D06A36D                 lea  ax, [symbol]
  3795 00001366 50                       push ax
  3796 00001367 FF36[4200]               push word [pt]
  3797 0000136B E8BBEE                   call strcpy
  3798 0000136E 83C404                   add  sp, 4
  3799                                  
  3800                                  ;-576 }
  3801                                  
  3802                                  
  3803                                  ;-577 int checkFunction() { unsigned int i; unsigned int j; i=0;
  3804                                  
  3805 00001371 C3                       ret
  3806 00001372 4C6F63616C20766172-     addlocal_0 db "Local variable table full",0
  3807 0000137B 6961626C6520746162-
  3808 00001384 6C652066756C6C00   
  3809 0000138C 5661726961626C6520-     addlocal_1 db "Variable already defined",0
  3810 00001395 616C72656164792064-
  3811 0000139E 6566696E656400     
  3812                                  ENDP
  3813                                  
  3814                                  checkFunction: PROC;
  3815 000013A5 C8040000                 ENTER  4,0
  3816 000013A9 B80000                   mov ax, 0
  3817 000013AC 8946FE                   mov [bp-2], ax
  3818                                  
  3819                                  ;-578   while (i < FTop) {
  3820                                  
  3821                                  .checkFunction180:
  3822 000013AF 8B46FE                   mov ax, [bp-2]
  3823 000013B2 3B06[3C00]               cmp ax, [FTop]
  3824 000013B6 0F8D3000                 jge .checkFunction181
  3825                                  
  3826                                  ;-579     j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}
  3827                                  
  3828 000013BA FF76FE                   push word [bp-2]
  3829 000013BD 8D061492                 lea  ax, [FNameField]
  3830 000013C1 50                       push ax
  3831 000013C2 E82AF4                   call adrF
  3832 000013C5 83C404                   add  sp, 4
  3833 000013C8 8946FC                   mov [bp-4], ax
  3834 000013CB FF76FC                   push word [bp-4]
  3835 000013CE 8D06A36D                 lea  ax, [symbol]
  3836 000013D2 50                       push ax
  3837 000013D3 E889EE                   call eqstr
  3838 000013D6 83C404                   add  sp, 4
  3839 000013D9 08C0                     or  al, al
  3840 000013DB 0F840600                 je .checkFunction182
  3841 000013DF 8B46FE                   mov ax, [bp-2]
  3842 000013E2 E90B00                   jmp .retncheckFunction
  3843                                  .checkFunction182:
  3844 000013E5 FF46FE                   inc  word[bp-2]
  3845                                  
  3846                                  ;-580   return 0; }
  3847                                  
  3848 000013E8 EBC5                     jmp .checkFunction180
  3849                                  .checkFunction181:
  3850 000013EA B80000                   mov ax, 0
  3851 000013ED E90000                   jmp .retncheckFunction
  3852                                  
  3853                                  ;-581 
  3854                                  
  3855                                  
  3856                                  ;-582 int isvariable() {
  3857                                  
  3858 000013F0 C9                       .retncheckFunction: LEAVE
  3859 000013F1 C3                       ret
  3860                                  ENDP
  3861                                  
  3862                                  isvariable: PROC
  3863                                  
  3864                                  ;-583     if(token==T_SIGNED)   goto v1;
  3865                                  
  3866 000013F2 A1[1E00]                 mov ax, [token]
  3867 000013F5 3D1302                   cmp ax, 531
  3868 000013F8 0F850300                 jne .isvariable183
  3869 000013FC E93A00                   jmp .v1
  3870                                  
  3871                                  ;-584     if(token==T_UNSIGNED) goto v1;
  3872                                  
  3873                                  .isvariable183:
  3874 000013FF A1[1E00]                 mov ax, [token]
  3875 00001402 3D1402                   cmp ax, 532
  3876 00001405 0F850300                 jne .isvariable184
  3877 00001409 E92D00                   jmp .v1
  3878                                  
  3879                                  ;-585     if(token==T_CHAR)     goto v1;
  3880                                  
  3881                                  .isvariable184:
  3882 0000140C A1[1E00]                 mov ax, [token]
  3883 0000140F 3D1202                   cmp ax, 530
  3884 00001412 0F850300                 jne .isvariable185
  3885 00001416 E92000                   jmp .v1
  3886                                  
  3887                                  ;-586     if(token==T_INT)      goto v1;
  3888                                  
  3889                                  .isvariable185:
  3890 00001419 A1[1E00]                 mov ax, [token]
  3891 0000141C 3D0502                   cmp ax, 517
  3892 0000141F 0F850300                 jne .isvariable186
  3893 00001423 E91300                   jmp .v1
  3894                                  
  3895                                  ;-587     if(token==T_LONG)     goto v1;
  3896                                  
  3897                                  .isvariable186:
  3898 00001426 A1[1E00]                 mov ax, [token]
  3899 00001429 3D1502                   cmp ax, 533
  3900 0000142C 0F850300                 jne .isvariable187
  3901 00001430 E90600                   jmp .v1
  3902                                  
  3903                                  ;-588     return 0;
  3904                                  
  3905                                  .isvariable187:
  3906 00001433 B80000                   mov ax, 0
  3907 00001436 E90600                   jmp .retnisvariable
  3908                                  
  3909                                  ;-589 v1: return 1;
  3910                                  
  3911                                  .v1:
  3912 00001439 B80100                   mov ax, 1
  3913 0000143C E90000                   jmp .retnisvariable
  3914                                  
  3915                                  ;-590 }
  3916                                  
  3917                                  
  3918                                  ;-591 
  3919                                  
  3920                                  
  3921                                  ;-592 int cmpneg(int ids) {
  3922                                  
  3923                                   .retnisvariable:
  3924 0000143F C3                       ret
  3925                                  ENDP
  3926                                  
  3927                                  cmpneg: PROC
  3928                                  
  3929                                  ;-593        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
  3930                                  ;
  3931 00001440 C8000000                 ENTER  0,0
  3932 00001444 A1[2300]                 mov ax, [iscmp]
  3933 00001447 3D2603                   cmp ax, 806
  3934 0000144A 0F850C00                 jne .cmpneg188
  3935 0000144E 68[2115]                 push cmpneg_0
  3936 00001451 E88BEF                   call prs
  3937 00001454 83C402                   add  sp, 2
  3938                                  
  3939                                  ;-594   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1
  3940                                  
  3941 00001457 E9C500                   jmp .cmpneg189
  3942                                  .cmpneg188:
  3943 0000145A A1[2300]                 mov ax, [iscmp]
  3944 0000145D 3D2703                   cmp ax, 807
  3945 00001460 0F850C00                 jne .cmpneg190
  3946 00001464 68[2A15]                 push cmpneg_1
  3947 00001467 E875EF                   call prs
  3948 0000146A 83C402                   add  sp, 2
  3949                                  
  3950                                  ;-595   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF
  3951                                  
  3952 0000146D E9AF00                   jmp .cmpneg191
  3953                                  .cmpneg190:
  3954 00001470 A1[2300]                 mov ax, [iscmp]
  3955 00001473 3D3803                   cmp ax, 824
  3956 00001476 0F852100                 jne .cmpneg192
  3957 0000147A 8B4604                   mov ax, [bp+4]
  3958 0000147D 08C0                     or  al, al
  3959 0000147F 0F840C00                 je .cmpneg193
  3960 00001483 68[3315]                 push cmpneg_2
  3961 00001486 E856EF                   call prs
  3962 00001489 83C402                   add  sp, 2
  3963                                  
  3964                                  ;-596                            else prs("\n ja  .");//ZF=0 CF=0
  3965                                  
  3966 0000148C E90900                   jmp .cmpneg194
  3967                                  .cmpneg193:
  3968 0000148F 68[3C15]                 push cmpneg_3
  3969 00001492 E84AEF                   call prs
  3970 00001495 83C402                   add  sp, 2
  3971                                  
  3972                                  ;-597   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);
  3973                                  
  3974                                  .cmpneg194:
  3975 00001498 E98400                   jmp .cmpneg195
  3976                                  .cmpneg192:
  3977 0000149B A1[2300]                 mov ax, [iscmp]
  3978 0000149E 3D2B03                   cmp ax, 811
  3979 000014A1 0F854500                 jne .cmpneg196
  3980 000014A5 8B4604                   mov ax, [bp+4]
  3981 000014A8 08C0                     or  al, al
  3982 000014AA 0F841E00                 je .cmpneg197
  3983 000014AE 68[4515]                 push cmpneg_4
  3984 000014B1 E82BEF                   call prs
  3985 000014B4 83C402                   add  sp, 2
  3986 000014B7 FF7604                   push word [bp+4]
  3987 000014BA E885F0                   call prunsign1
  3988 000014BD 83C402                   add  sp, 2
  3989                                  
  3990                                  ;-598                                prs("\n jl  .");}//          SF!=OF
  3991                                  
  3992 000014C0 68[5315]                 push cmpneg_5
  3993 000014C3 E819EF                   call prs
  3994 000014C6 83C402                   add  sp, 2
  3995                                  
  3996                                  ;-599                            else{prs(" ;unsigned : "); prunsign1(ids);
  3997                                  
  3998 000014C9 E91B00                   jmp .cmpneg198
  3999                                  .cmpneg197:
  4000 000014CC 68[5C15]                 push cmpneg_6
  4001 000014CF E80DEF                   call prs
  4002 000014D2 83C402                   add  sp, 2
  4003 000014D5 FF7604                   push word [bp+4]
  4004 000014D8 E867F0                   call prunsign1
  4005 000014DB 83C402                   add  sp, 2
  4006                                  
  4007                                  ;-600                                prs("\n jb  .");}//jb=jc=CF=1
  4008                                  
  4009 000014DE 68[6A15]                 push cmpneg_7
  4010 000014E1 E8FBEE                   call prs
  4011 000014E4 83C402                   add  sp, 2
  4012                                  
  4013                                  ;-601   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF
  4014                                  
  4015                                  .cmpneg198:
  4016 000014E7 E93500                   jmp .cmpneg199
  4017                                  .cmpneg196:
  4018 000014EA A1[2300]                 mov ax, [iscmp]
  4019 000014ED 83F83C                   cmp ax, 60
  4020 000014F0 0F850C00                 jne .cmpneg200
  4021 000014F4 68[7315]                 push cmpneg_8
  4022 000014F7 E8E5EE                   call prs
  4023 000014FA 83C402                   add  sp, 2
  4024                                  
  4025                                  ;-602   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF
  4026                                  
  4027 000014FD E91F00                   jmp .cmpneg201
  4028                                  .cmpneg200:
  4029 00001500 A1[2300]                 mov ax, [iscmp]
  4030 00001503 83F83E                   cmp ax, 62
  4031 00001506 0F850C00                 jne .cmpneg202
  4032 0000150A 68[7C15]                 push cmpneg_9
  4033 0000150D E8CFEE                   call prs
  4034 00001510 83C402                   add  sp, 2
  4035                                  
  4036                                  ;-603   else error1("internal error compare unknown in CMPNEG()");  }
  4037                                  
  4038 00001513 E90900                   jmp .cmpneg203
  4039                                  .cmpneg202:
  4040 00001516 68[8515]                 push cmpneg_10
  4041 00001519 E8E4F0                   call error1
  4042 0000151C 83C402                   add  sp, 2
  4043                                  .cmpneg203:
  4044                                  .cmpneg201:
  4045                                  .cmpneg199:
  4046                                  .cmpneg195:
  4047                                  .cmpneg191:
  4048                                  .cmpneg189:
  4049                                  
  4050                                  ;-604 
  4051                                  
  4052                                  
  4053                                  ;-605   int isrelational() {
  4054 0000151F C9                       LEAVE
  4055 00001520 C3                       ret
  4056 00001521 5C6E206A6E65202E00      cmpneg_0 db "\n jne .",0
  4057 0000152A 5C6E206A6520202E00      cmpneg_1 db "\n je  .",0
  4058 00001533 5C6E206A6720202E00      cmpneg_2 db "\n jg  .",0
  4059 0000153C 5C6E206A6120202E00      cmpneg_3 db "\n ja  .",0
  4060 00001545 203B756E7369676E65-     cmpneg_4 db " ;unsigned : ",0
  4061 0000154E 64203A2000         
  4062 00001553 5C6E206A6C20202E00      cmpneg_5 db "\n jl  .",0
  4063 0000155C 203B756E7369676E65-     cmpneg_6 db " ;unsigned : ",0
  4064 00001565 64203A2000         
  4065 0000156A 5C6E206A6220202E00      cmpneg_7 db "\n jb  .",0
  4066 00001573 5C6E206A6765202E00      cmpneg_8 db "\n jge .",0
  4067 0000157C 5C6E206A6C65202E00      cmpneg_9 db "\n jle .",0
  4068 00001585 696E7465726E616C20-     cmpneg_10 db "internal error compare unknown in CMPNEG()",0
  4069 0000158E 6572726F7220636F6D-
  4070 00001597 7061726520756E6B6E-
  4071 000015A0 6F776E20696E20434D-
  4072 000015A9 504E4547282900     
  4073                                  ENDP
  4074                                  
  4075                                  isrelational: PROC
  4076                                  
  4077                                  ;-606     if (token==T_EQ) goto w; if (token==T_NE) goto w;
  4078                                  
  4079 000015B0 A1[1E00]                 mov ax, [token]
  4080 000015B3 3D2603                   cmp ax, 806
  4081 000015B6 0F850300                 jne .isrelational204
  4082 000015BA E94700                   jmp .w
  4083                                  .isrelational204:
  4084 000015BD A1[1E00]                 mov ax, [token]
  4085 000015C0 3D2703                   cmp ax, 807
  4086 000015C3 0F850300                 jne .isrelational205
  4087 000015C7 E93A00                   jmp .w
  4088                                  
  4089                                  ;-607     if (token==T_LE) goto w; if (token==T_GE) goto w;
  4090                                  
  4091                                  .isrelational205:
  4092 000015CA A1[1E00]                 mov ax, [token]
  4093 000015CD 3D3803                   cmp ax, 824
  4094 000015D0 0F850300                 jne .isrelational206
  4095 000015D4 E92D00                   jmp .w
  4096                                  .isrelational206:
  4097 000015D7 A1[1E00]                 mov ax, [token]
  4098 000015DA 3D2B03                   cmp ax, 811
  4099 000015DD 0F850300                 jne .isrelational207
  4100 000015E1 E92000                   jmp .w
  4101                                  
  4102                                  ;-608     if (token=='<' ) goto w; if (token=='>' ) goto w;
  4103                                  
  4104                                  .isrelational207:
  4105 000015E4 A1[1E00]                 mov ax, [token]
  4106 000015E7 83F83C                   cmp ax, 60
  4107 000015EA 0F850300                 jne .isrelational208
  4108 000015EE E91300                   jmp .w
  4109                                  .isrelational208:
  4110 000015F1 A1[1E00]                 mov ax, [token]
  4111 000015F4 83F83E                   cmp ax, 62
  4112 000015F7 0F850300                 jne .isrelational209
  4113 000015FB E90600                   jmp .w
  4114                                  
  4115                                  ;-609     return 0;  w: iscmp=token; token=getlex(); return 1;}
  4116                                  
  4117                                  .isrelational209:
  4118 000015FE B80000                   mov ax, 0
  4119 00001601 E91200                   jmp .retnisrelational
  4120                                  .w:
  4121 00001604 A1[1E00]                 mov ax, [token]
  4122 00001607 A3[2300]                 mov word [iscmp], ax
  4123 0000160A E893F2                   call getlex
  4124 0000160D A3[1E00]                 mov word [token], ax
  4125 00001610 B80100                   mov ax, 1
  4126 00001613 E90000                   jmp .retnisrelational
  4127                                  
  4128                                  ;-610 
  4129                                  
  4130                                  
  4131                                  ;-611 int checkreg() { // >=17 = 16bit, >=47 = 32bit
  4132                                  
  4133                                   .retnisrelational:
  4134 00001616 C3                       ret
  4135                                  ENDP
  4136                                  
  4137                                  checkreg: PROC
  4138                                  
  4139                                  ;-612   if (strlen(symbol) <  2) return 0;
  4140                                  
  4141 00001617 8D06A36D                 lea  ax, [symbol]
  4142 0000161B 50                       push ax
  4143 0000161C E8E2EB                   call strlen
  4144 0000161F 83C402                   add  sp, 2
  4145 00001622 83F802                   cmp ax, 2
  4146 00001625 0F8D0600                 jge .checkreg210
  4147 00001629 B80000                   mov ax, 0
  4148 0000162C E94403                   jmp .retncheckreg
  4149                                  
  4150                                  ;-613   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;
  4151                                  
  4152                                  .checkreg210:
  4153 0000162F 68[7419]                 push checkreg_0
  4154 00001632 8D06A36D                 lea  ax, [symbol]
  4155 00001636 50                       push ax
  4156 00001637 E825EC                   call eqstr
  4157 0000163A 83C404                   add  sp, 4
  4158 0000163D 08C0                     or  al, al
  4159 0000163F 0F840600                 je .checkreg211
  4160 00001643 B80100                   mov ax, 1
  4161 00001646 E92A03                   jmp .retncheckreg
  4162                                  .checkreg211:
  4163 00001649 68[7719]                 push checkreg_1
  4164 0000164C 8D06A36D                 lea  ax, [symbol]
  4165 00001650 50                       push ax
  4166 00001651 E80BEC                   call eqstr
  4167 00001654 83C404                   add  sp, 4
  4168 00001657 08C0                     or  al, al
  4169 00001659 0F840600                 je .checkreg212
  4170 0000165D B80300                   mov ax, 3
  4171 00001660 E91003                   jmp .retncheckreg
  4172                                  
  4173                                  ;-614   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;
  4174                                  
  4175                                  .checkreg212:
  4176 00001663 68[7A19]                 push checkreg_2
  4177 00001666 8D06A36D                 lea  ax, [symbol]
  4178 0000166A 50                       push ax
  4179 0000166B E8F1EB                   call eqstr
  4180 0000166E 83C404                   add  sp, 4
  4181 00001671 08C0                     or  al, al
  4182 00001673 0F840600                 je .checkreg213
  4183 00001677 B80500                   mov ax, 5
  4184 0000167A E9F602                   jmp .retncheckreg
  4185                                  .checkreg213:
  4186 0000167D 68[7D19]                 push checkreg_3
  4187 00001680 8D06A36D                 lea  ax, [symbol]
  4188 00001684 50                       push ax
  4189 00001685 E8D7EB                   call eqstr
  4190 00001688 83C404                   add  sp, 4
  4191 0000168B 08C0                     or  al, al
  4192 0000168D 0F840600                 je .checkreg214
  4193 00001691 B80700                   mov ax, 7
  4194 00001694 E9DC02                   jmp .retncheckreg
  4195                                  
  4196                                  ;-615   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;
  4197                                  
  4198                                  .checkreg214:
  4199 00001697 68[8019]                 push checkreg_4
  4200 0000169A 8D06A36D                 lea  ax, [symbol]
  4201 0000169E 50                       push ax
  4202 0000169F E8BDEB                   call eqstr
  4203 000016A2 83C404                   add  sp, 4
  4204 000016A5 08C0                     or  al, al
  4205 000016A7 0F840600                 je .checkreg215
  4206 000016AB B80900                   mov ax, 9
  4207 000016AE E9C202                   jmp .retncheckreg
  4208                                  .checkreg215:
  4209 000016B1 68[8319]                 push checkreg_5
  4210 000016B4 8D06A36D                 lea  ax, [symbol]
  4211 000016B8 50                       push ax
  4212 000016B9 E8A3EB                   call eqstr
  4213 000016BC 83C404                   add  sp, 4
  4214 000016BF 08C0                     or  al, al
  4215 000016C1 0F840600                 je .checkreg216
  4216 000016C5 B80B00                   mov ax, 11
  4217 000016C8 E9A802                   jmp .retncheckreg
  4218                                  
  4219                                  ;-616   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;
  4220                                  
  4221                                  .checkreg216:
  4222 000016CB 68[8619]                 push checkreg_6
  4223 000016CE 8D06A36D                 lea  ax, [symbol]
  4224 000016D2 50                       push ax
  4225 000016D3 E889EB                   call eqstr
  4226 000016D6 83C404                   add  sp, 4
  4227 000016D9 08C0                     or  al, al
  4228 000016DB 0F840600                 je .checkreg217
  4229 000016DF B80D00                   mov ax, 13
  4230 000016E2 E98E02                   jmp .retncheckreg
  4231                                  .checkreg217:
  4232 000016E5 68[8919]                 push checkreg_7
  4233 000016E8 8D06A36D                 lea  ax, [symbol]
  4234 000016EC 50                       push ax
  4235 000016ED E86FEB                   call eqstr
  4236 000016F0 83C404                   add  sp, 4
  4237 000016F3 08C0                     or  al, al
  4238 000016F5 0F840600                 je .checkreg218
  4239 000016F9 B80F00                   mov ax, 15
  4240 000016FC E97402                   jmp .retncheckreg
  4241                                  
  4242                                  ;-617   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;
  4243                                  
  4244                                  .checkreg218:
  4245 000016FF 68[8C19]                 push checkreg_8
  4246 00001702 8D06A36D                 lea  ax, [symbol]
  4247 00001706 50                       push ax
  4248 00001707 E855EB                   call eqstr
  4249 0000170A 83C404                   add  sp, 4
  4250 0000170D 08C0                     or  al, al
  4251 0000170F 0F840600                 je .checkreg219
  4252 00001713 B81100                   mov ax, 17
  4253 00001716 E95A02                   jmp .retncheckreg
  4254                                  .checkreg219:
  4255 00001719 68[8F19]                 push checkreg_9
  4256 0000171C 8D06A36D                 lea  ax, [symbol]
  4257 00001720 50                       push ax
  4258 00001721 E83BEB                   call eqstr
  4259 00001724 83C404                   add  sp, 4
  4260 00001727 08C0                     or  al, al
  4261 00001729 0F840600                 je .checkreg220
  4262 0000172D B81300                   mov ax, 19
  4263 00001730 E94002                   jmp .retncheckreg
  4264                                  
  4265                                  ;-618   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;
  4266                                  
  4267                                  .checkreg220:
  4268 00001733 68[9219]                 push checkreg_10
  4269 00001736 8D06A36D                 lea  ax, [symbol]
  4270 0000173A 50                       push ax
  4271 0000173B E821EB                   call eqstr
  4272 0000173E 83C404                   add  sp, 4
  4273 00001741 08C0                     or  al, al
  4274 00001743 0F840600                 je .checkreg221
  4275 00001747 B81500                   mov ax, 21
  4276 0000174A E92602                   jmp .retncheckreg
  4277                                  .checkreg221:
  4278 0000174D 68[9519]                 push checkreg_11
  4279 00001750 8D06A36D                 lea  ax, [symbol]
  4280 00001754 50                       push ax
  4281 00001755 E807EB                   call eqstr
  4282 00001758 83C404                   add  sp, 4
  4283 0000175B 08C0                     or  al, al
  4284 0000175D 0F840600                 je .checkreg222
  4285 00001761 B81700                   mov ax, 23
  4286 00001764 E90C02                   jmp .retncheckreg
  4287                                  
  4288                                  ;-619   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;
  4289                                  
  4290                                  .checkreg222:
  4291 00001767 68[9819]                 push checkreg_12
  4292 0000176A 8D06A36D                 lea  ax, [symbol]
  4293 0000176E 50                       push ax
  4294 0000176F E8EDEA                   call eqstr
  4295 00001772 83C404                   add  sp, 4
  4296 00001775 08C0                     or  al, al
  4297 00001777 0F840600                 je .checkreg223
  4298 0000177B B81900                   mov ax, 25
  4299 0000177E E9F201                   jmp .retncheckreg
  4300                                  .checkreg223:
  4301 00001781 68[9B19]                 push checkreg_13
  4302 00001784 8D06A36D                 lea  ax, [symbol]
  4303 00001788 50                       push ax
  4304 00001789 E8D3EA                   call eqstr
  4305 0000178C 83C404                   add  sp, 4
  4306 0000178F 08C0                     or  al, al
  4307 00001791 0F840600                 je .checkreg224
  4308 00001795 B81B00                   mov ax, 27
  4309 00001798 E9D801                   jmp .retncheckreg
  4310                                  
  4311                                  ;-620   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;
  4312                                  
  4313                                  .checkreg224:
  4314 0000179B 68[9E19]                 push checkreg_14
  4315 0000179E 8D06A36D                 lea  ax, [symbol]
  4316 000017A2 50                       push ax
  4317 000017A3 E8B9EA                   call eqstr
  4318 000017A6 83C404                   add  sp, 4
  4319 000017A9 08C0                     or  al, al
  4320 000017AB 0F840600                 je .checkreg225
  4321 000017AF B81D00                   mov ax, 29
  4322 000017B2 E9BE01                   jmp .retncheckreg
  4323                                  .checkreg225:
  4324 000017B5 68[A119]                 push checkreg_15
  4325 000017B8 8D06A36D                 lea  ax, [symbol]
  4326 000017BC 50                       push ax
  4327 000017BD E89FEA                   call eqstr
  4328 000017C0 83C404                   add  sp, 4
  4329 000017C3 08C0                     or  al, al
  4330 000017C5 0F840600                 je .checkreg226
  4331 000017C9 B81F00                   mov ax, 31
  4332 000017CC E9A401                   jmp .retncheckreg
  4333                                  
  4334                                  ;-621   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;
  4335                                  
  4336                                  .checkreg226:
  4337 000017CF 68[A419]                 push checkreg_16
  4338 000017D2 8D06A36D                 lea  ax, [symbol]
  4339 000017D6 50                       push ax
  4340 000017D7 E885EA                   call eqstr
  4341 000017DA 83C404                   add  sp, 4
  4342 000017DD 08C0                     or  al, al
  4343 000017DF 0F840600                 je .checkreg227
  4344 000017E3 B82100                   mov ax, 33
  4345 000017E6 E98A01                   jmp .retncheckreg
  4346                                  .checkreg227:
  4347 000017E9 68[A719]                 push checkreg_17
  4348 000017EC 8D06A36D                 lea  ax, [symbol]
  4349 000017F0 50                       push ax
  4350 000017F1 E86BEA                   call eqstr
  4351 000017F4 83C404                   add  sp, 4
  4352 000017F7 08C0                     or  al, al
  4353 000017F9 0F840600                 je .checkreg228
  4354 000017FD B82300                   mov ax, 35
  4355 00001800 E97001                   jmp .retncheckreg
  4356                                  
  4357                                  ;-622   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;
  4358                                  
  4359                                  .checkreg228:
  4360 00001803 68[AA19]                 push checkreg_18
  4361 00001806 8D06A36D                 lea  ax, [symbol]
  4362 0000180A 50                       push ax
  4363 0000180B E851EA                   call eqstr
  4364 0000180E 83C404                   add  sp, 4
  4365 00001811 08C0                     or  al, al
  4366 00001813 0F840600                 je .checkreg229
  4367 00001817 B82500                   mov ax, 37
  4368 0000181A E95601                   jmp .retncheckreg
  4369                                  .checkreg229:
  4370 0000181D 68[AD19]                 push checkreg_19
  4371 00001820 8D06A36D                 lea  ax, [symbol]
  4372 00001824 50                       push ax
  4373 00001825 E837EA                   call eqstr
  4374 00001828 83C404                   add  sp, 4
  4375 0000182B 08C0                     or  al, al
  4376 0000182D 0F840600                 je .checkreg230
  4377 00001831 B82700                   mov ax, 39
  4378 00001834 E93C01                   jmp .retncheckreg
  4379                                  
  4380                                  ;-623   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;
  4381                                  
  4382                                  .checkreg230:
  4383 00001837 68[B019]                 push checkreg_20
  4384 0000183A 8D06A36D                 lea  ax, [symbol]
  4385 0000183E 50                       push ax
  4386 0000183F E81DEA                   call eqstr
  4387 00001842 83C404                   add  sp, 4
  4388 00001845 08C0                     or  al, al
  4389 00001847 0F840600                 je .checkreg231
  4390 0000184B B82900                   mov ax, 41
  4391 0000184E E92201                   jmp .retncheckreg
  4392                                  .checkreg231:
  4393 00001851 68[B319]                 push checkreg_21
  4394 00001854 8D06A36D                 lea  ax, [symbol]
  4395 00001858 50                       push ax
  4396 00001859 E803EA                   call eqstr
  4397 0000185C 83C404                   add  sp, 4
  4398 0000185F 08C0                     or  al, al
  4399 00001861 0F840600                 je .checkreg232
  4400 00001865 B82B00                   mov ax, 43
  4401 00001868 E90801                   jmp .retncheckreg
  4402                                  
  4403                                  ;-624   // (eqstr(symbol,"ip")) return 45;
  4404                                  
  4405                                  
  4406                                  ;-625   if (strlen(symbol) >   3) return 0;
  4407                                  
  4408                                  .checkreg232:
  4409 0000186B 8D06A36D                 lea  ax, [symbol]
  4410 0000186F 50                       push ax
  4411 00001870 E88EE9                   call strlen
  4412 00001873 83C402                   add  sp, 2
  4413 00001876 83F803                   cmp ax, 3
  4414 00001879 0F8E0600                 jle .checkreg233
  4415 0000187D B80000                   mov ax, 0
  4416 00001880 E9F000                   jmp .retncheckreg
  4417                                  
  4418                                  ;-626   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;
  4419                                  
  4420                                  .checkreg233:
  4421 00001883 68[B619]                 push checkreg_22
  4422 00001886 8D06A36D                 lea  ax, [symbol]
  4423 0000188A 50                       push ax
  4424 0000188B E8D1E9                   call eqstr
  4425 0000188E 83C404                   add  sp, 4
  4426 00001891 08C0                     or  al, al
  4427 00001893 0F840600                 je .checkreg234
  4428 00001897 B82F00                   mov ax, 47
  4429 0000189A E9D600                   jmp .retncheckreg
  4430                                  .checkreg234:
  4431 0000189D 68[BA19]                 push checkreg_23
  4432 000018A0 8D06A36D                 lea  ax, [symbol]
  4433 000018A4 50                       push ax
  4434 000018A5 E8B7E9                   call eqstr
  4435 000018A8 83C404                   add  sp, 4
  4436 000018AB 08C0                     or  al, al
  4437 000018AD 0F840600                 je .checkreg235
  4438 000018B1 B83200                   mov ax, 50
  4439 000018B4 E9BC00                   jmp .retncheckreg
  4440                                  
  4441                                  ;-627   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;
  4442                                  
  4443                                  .checkreg235:
  4444 000018B7 68[BE19]                 push checkreg_24
  4445 000018BA 8D06A36D                 lea  ax, [symbol]
  4446 000018BE 50                       push ax
  4447 000018BF E89DE9                   call eqstr
  4448 000018C2 83C404                   add  sp, 4
  4449 000018C5 08C0                     or  al, al
  4450 000018C7 0F840600                 je .checkreg236
  4451 000018CB B83500                   mov ax, 53
  4452 000018CE E9A200                   jmp .retncheckreg
  4453                                  .checkreg236:
  4454 000018D1 68[C219]                 push checkreg_25
  4455 000018D4 8D06A36D                 lea  ax, [symbol]
  4456 000018D8 50                       push ax
  4457 000018D9 E883E9                   call eqstr
  4458 000018DC 83C404                   add  sp, 4
  4459 000018DF 08C0                     or  al, al
  4460 000018E1 0F840600                 je .checkreg237
  4461 000018E5 B83800                   mov ax, 56
  4462 000018E8 E98800                   jmp .retncheckreg
  4463                                  
  4464                                  ;-628   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;
  4465                                  
  4466                                  .checkreg237:
  4467 000018EB 68[C619]                 push checkreg_26
  4468 000018EE 8D06A36D                 lea  ax, [symbol]
  4469 000018F2 50                       push ax
  4470 000018F3 E869E9                   call eqstr
  4471 000018F6 83C404                   add  sp, 4
  4472 000018F9 08C0                     or  al, al
  4473 000018FB 0F840600                 je .checkreg238
  4474 000018FF B83B00                   mov ax, 59
  4475 00001902 E96E00                   jmp .retncheckreg
  4476                                  .checkreg238:
  4477 00001905 68[CA19]                 push checkreg_27
  4478 00001908 8D06A36D                 lea  ax, [symbol]
  4479 0000190C 50                       push ax
  4480 0000190D E84FE9                   call eqstr
  4481 00001910 83C404                   add  sp, 4
  4482 00001913 08C0                     or  al, al
  4483 00001915 0F840600                 je .checkreg239
  4484 00001919 B83E00                   mov ax, 62
  4485 0000191C E95400                   jmp .retncheckreg
  4486                                  
  4487                                  ;-629   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;
  4488                                  
  4489                                  .checkreg239:
  4490 0000191F 68[CE19]                 push checkreg_28
  4491 00001922 8D06A36D                 lea  ax, [symbol]
  4492 00001926 50                       push ax
  4493 00001927 E835E9                   call eqstr
  4494 0000192A 83C404                   add  sp, 4
  4495 0000192D 08C0                     or  al, al
  4496 0000192F 0F840600                 je .checkreg240
  4497 00001933 B84100                   mov ax, 65
  4498 00001936 E93A00                   jmp .retncheckreg
  4499                                  .checkreg240:
  4500 00001939 68[D219]                 push checkreg_29
  4501 0000193C 8D06A36D                 lea  ax, [symbol]
  4502 00001940 50                       push ax
  4503 00001941 E81BE9                   call eqstr
  4504 00001944 83C404                   add  sp, 4
  4505 00001947 08C0                     or  al, al
  4506 00001949 0F840600                 je .checkreg241
  4507 0000194D B84400                   mov ax, 68
  4508 00001950 E92000                   jmp .retncheckreg
  4509                                  
  4510                                  ;-630   if (eqstr(symbol,"cr0")) return 71;
  4511                                  
  4512                                  .checkreg241:
  4513 00001953 68[D619]                 push checkreg_30
  4514 00001956 8D06A36D                 lea  ax, [symbol]
  4515 0000195A 50                       push ax
  4516 0000195B E801E9                   call eqstr
  4517 0000195E 83C404                   add  sp, 4
  4518 00001961 08C0                     or  al, al
  4519 00001963 0F840600                 je .checkreg242
  4520 00001967 B84700                   mov ax, 71
  4521 0000196A E90600                   jmp .retncheckreg
  4522                                  
  4523                                  ;-631   return 0;   }
  4524                                  
  4525                                  .checkreg242:
  4526 0000196D B80000                   mov ax, 0
  4527 00001970 E90000                   jmp .retncheckreg
  4528                                  
  4529                                  ;-632 
  4530                                  
  4531                                  
  4532                                  ;-633 char printregstr[]
  4533                                  
  4534                                   .retncheckreg:
  4535 00001973 C3                       ret
  4536 00001974 616C00                  checkreg_0 db "al",0
  4537 00001977 636C00                  checkreg_1 db "cl",0
  4538 0000197A 646C00                  checkreg_2 db "dl",0
  4539 0000197D 626C00                  checkreg_3 db "bl",0
  4540 00001980 616800                  checkreg_4 db "ah",0
  4541 00001983 636800                  checkreg_5 db "ch",0
  4542 00001986 646800                  checkreg_6 db "dh",0
  4543 00001989 626800                  checkreg_7 db "bh",0
  4544 0000198C 617800                  checkreg_8 db "ax",0
  4545 0000198F 637800                  checkreg_9 db "cx",0
  4546 00001992 647800                  checkreg_10 db "dx",0
  4547 00001995 627800                  checkreg_11 db "bx",0
  4548 00001998 737000                  checkreg_12 db "sp",0
  4549 0000199B 627000                  checkreg_13 db "bp",0
  4550 0000199E 736900                  checkreg_14 db "si",0
  4551 000019A1 646900                  checkreg_15 db "di",0
  4552 000019A4 657300                  checkreg_16 db "es",0
  4553 000019A7 637300                  checkreg_17 db "cs",0
  4554 000019AA 737300                  checkreg_18 db "ss",0
  4555 000019AD 647300                  checkreg_19 db "ds",0
  4556 000019B0 667300                  checkreg_20 db "fs",0
  4557 000019B3 677300                  checkreg_21 db "gs",0
  4558 000019B6 65617800                checkreg_22 db "eax",0
  4559 000019BA 65637800                checkreg_23 db "ecx",0
  4560 000019BE 65647800                checkreg_24 db "edx",0
  4561 000019C2 65627800                checkreg_25 db "ebx",0
  4562 000019C6 65737000                checkreg_26 db "esp",0
  4563 000019CA 65627000                checkreg_27 db "ebp",0
  4564 000019CE 65736900                checkreg_28 db "esi",0
  4565 000019D2 65646900                checkreg_29 db "edi",0
  4566 000019D6 63723000                checkreg_30 db "cr0",0
  4567                                  ENDP
  4568                                  
  4569                                  ;-634 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";
  4570                                  
  4571 000019DA 2A616C636C646C626C-     printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0
  4572 000019E3 616863686468626861-
  4573 000019EC 786378647862787370-
  4574 000019F5 627073696469657363-
  4575 000019FE 737373647366736773-
  4576 00001A07 697065617865637865-
  4577 00001A10 647865627865737065-
  4578 00001A19 627065736965646963-
  4579 00001A22 723000             
  4580                                  
  4581                                  ;-635 
  4582                                  
  4583                                  
  4584                                  ;-636 int printreg(int i) {  unsigned int k; unsigned char c;
  4585                                  
  4586                                  
  4587                                  printreg: PROC
  4588                                  
  4589                                  ;-637   k = &printregstr + i; c=*k; prc(c); i++;
  4590                                  ;
  4591 00001A25 C8040000                 ENTER  4,0
  4592 00001A29 B8[DA19]                 mov ax, printregstr
  4593 00001A2C 034604                   add ax, [bp+4]
  4594 00001A2F 8946FE                   mov [bp-2], ax
  4595 00001A32 8B5EFE                   mov bx, [bp-2]
  4596 00001A35 8B07                     mov ax, [bx]
  4597 00001A37 8846FC                   mov [bp-4], al
  4598 00001A3A 8A46FC                   mov al, byte [bp-4]
  4599 00001A3D B400                     mov ah, 0
  4600 00001A3F 50                       push ax
  4601 00001A40 E843E9                   call prc
  4602 00001A43 83C402                   add  sp, 2
  4603 00001A46 FF4604                   inc  word[bp+4]
  4604                                  
  4605                                  ;-638   k = &printregstr + i; c=*k; prc(c);
  4606                                  
  4607 00001A49 B8[DA19]                 mov ax, printregstr
  4608 00001A4C 034604                   add ax, [bp+4]
  4609 00001A4F 8946FE                   mov [bp-2], ax
  4610 00001A52 8B5EFE                   mov bx, [bp-2]
  4611 00001A55 8B07                     mov ax, [bx]
  4612 00001A57 8846FC                   mov [bp-4], al
  4613 00001A5A 8A46FC                   mov al, byte [bp-4]
  4614 00001A5D B400                     mov ah, 0
  4615 00001A5F 50                       push ax
  4616 00001A60 E823E9                   call prc
  4617 00001A63 83C402                   add  sp, 2
  4618                                  
  4619                                  ;-639   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }
  4620                                  
  4621 00001A66 8B4604                   mov ax, [bp+4]
  4622 00001A69 83F82F                   cmp ax, 47
  4623 00001A6C 0F8E2000                 jle .printreg243
  4624 00001A70 FF4604                   inc  word[bp+4]
  4625 00001A73 B8[DA19]                 mov ax, printregstr
  4626 00001A76 034604                   add ax, [bp+4]
  4627 00001A79 8946FE                   mov [bp-2], ax
  4628 00001A7C 8B5EFE                   mov bx, [bp-2]
  4629 00001A7F 8B07                     mov ax, [bx]
  4630 00001A81 8846FC                   mov [bp-4], al
  4631 00001A84 8A46FC                   mov al, byte [bp-4]
  4632 00001A87 B400                     mov ah, 0
  4633 00001A89 50                       push ax
  4634 00001A8A E8F9E8                   call prc
  4635 00001A8D 83C402                   add  sp, 2
  4636                                  
  4637                                  ;-640 }
  4638                                  
  4639                                  .printreg243:
  4640                                  
  4641                                  ;-641 
  4642                                  
  4643                                  
  4644                                  ;-642 int constantexpr() { int mode; int id1;int ids;
  4645 00001A90 C9                       LEAVE
  4646 00001A91 C3                       ret
  4647                                  ENDP
  4648                                  
  4649                                  constantexpr: PROC
  4650                                  
  4651                                  ;-643   token=getlex();   mode=typeName();
  4652                                  ;
  4653 00001A92 C8060000                 ENTER  6,0
  4654 00001A96 E807EE                   call getlex
  4655 00001A99 A3[1E00]                 mov word [token], ax
  4656 00001A9C E8BDF6                   call typeName
  4657 00001A9F 8946FE                   mov [bp-2], ax
  4658                                  
  4659                                  ;-644   id1=searchname(); gettypes(id1); ids=signi;
  4660                                  
  4661 00001AA2 E844F6                   call searchname
  4662 00001AA5 8946FC                   mov [bp-4], ax
  4663 00001AA8 FF76FC                   push word [bp-4]
  4664 00001AAB E887F7                   call gettypes
  4665 00001AAE 83C402                   add  sp, 2
  4666 00001AB1 A1[3000]                 mov ax, [signi]
  4667 00001AB4 8946FA                   mov [bp-6], ax
  4668                                  
  4669                                  ;-645   if (isrelational() ==0) error1("Relational expression expected");
  4670                                  
  4671 00001AB7 E8F6FA                   call isrelational
  4672 00001ABA 83F800                   cmp ax, 0
  4673 00001ABD 0F850900                 jne .constantexpr244
  4674 00001AC1 68[471B]                 push constantexpr_0
  4675 00001AC4 E839EB                   call error1
  4676 00001AC7 83C402                   add  sp, 2
  4677                                  
  4678                                  ;-646   expect(T_CONST);  prs(" ; constant expression");
  4679                                  
  4680                                  .constantexpr244:
  4681 00001ACA 680101                   push 257
  4682 00001ACD E8A4F4                   call expect
  4683 00001AD0 83C402                   add  sp, 2
  4684 00001AD3 68[661B]                 push constantexpr_1
  4685 00001AD6 E806E9                   call prs
  4686 00001AD9 83C402                   add  sp, 2
  4687                                  
  4688                                  ;-647   prs("\ncmp ");
  4689                                  
  4690 00001ADC 68[7D1B]                 push constantexpr_2
  4691 00001ADF E8FDE8                   call prs
  4692 00001AE2 83C402                   add  sp, 2
  4693                                  
  4694                                  ;-648   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  4695                                  
  4696 00001AE5 FF76FC                   push word [bp-4]
  4697 00001AE8 E84AF7                   call gettypes
  4698 00001AEB 83C402                   add  sp, 2
  4699 00001AEE A1[3600]                 mov ax, [wi]
  4700 00001AF1 83F802                   cmp ax, 2
  4701 00001AF4 0F850C00                 jne .constantexpr245
  4702 00001AF8 68[841B]                 push constantexpr_3
  4703 00001AFB E8E1E8                   call prs
  4704 00001AFE 83C402                   add  sp, 2
  4705 00001B01 E90900                   jmp .constantexpr246
  4706                                  .constantexpr245:
  4707 00001B04 68[891B]                 push constantexpr_4
  4708 00001B07 E8D5E8                   call prs
  4709 00001B0A 83C402                   add  sp, 2
  4710                                  
  4711                                  ;-649   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);
  4712                                  
  4713                                  .constantexpr246:
  4714 00001B0D FF76FC                   push word [bp-4]
  4715 00001B10 E8C9F4                   call v
  4716 00001B13 83C402                   add  sp, 2
  4717 00001B16 68[8E1B]                 push constantexpr_5
  4718 00001B19 E8C3E8                   call prs
  4719 00001B1C 83C402                   add  sp, 2
  4720 00001B1F FF36[2B00]               push word [lexval]
  4721 00001B23 E81CEA                   call prunsign1
  4722 00001B26 83C402                   add  sp, 2
  4723 00001B29 FF76FA                   push word [bp-6]
  4724 00001B2C E811F9                   call cmpneg
  4725 00001B2F 83C402                   add  sp, 2
  4726 00001B32 8D06236E                 lea  ax, [fname]
  4727 00001B36 50                       push ax
  4728 00001B37 E8A5E8                   call prs
  4729 00001B3A 83C402                   add  sp, 2
  4730                                  
  4731                                  ;-650   expect(')');
  4732                                  
  4733 00001B3D 6A29                     push 41
  4734 00001B3F E832F4                   call expect
  4735 00001B42 83C402                   add  sp, 2
  4736                                  
  4737                                  ;-651 }
  4738                                  
  4739                                  
  4740                                  ;-652 
  4741                                  
  4742                                  
  4743                                  ;-653 char ops[5];
  4744 00001B45 C9                       LEAVE
  4745 00001B46 C3                       ret
  4746 00001B47 52656C6174696F6E61-     constantexpr_0 db "Relational expression expected",0
  4747 00001B50 6C2065787072657373-
  4748 00001B59 696F6E206578706563-
  4749 00001B62 74656400           
  4750 00001B66 203B20636F6E737461-     constantexpr_1 db " ; constant expression",0
  4751 00001B6F 6E7420657870726573-
  4752 00001B78 73696F6E00         
  4753 00001B7D 5C6E636D702000          constantexpr_2 db "\ncmp ",0
  4754 00001B84 776F726400              constantexpr_3 db "word",0
  4755 00001B89 6279746500              constantexpr_4 db "byte",0
  4756 00001B8E 2C2000                  constantexpr_5 db ", ",0
  4757                                  ENDP
  4758                                  section .bss
  4759                                  absolute 42404
  4760 0000A5A4 <res 00000005>          ops resb 5
  4761                                  section .text
  4762                                  
  4763                                  ;-654 int doreg1(int iscmp1) { int i;
  4764                                  
  4765                                  
  4766                                  doreg1: PROC
  4767                                  
  4768                                  ;-655   if (istoken('='))          strcpy(ops, "mov");
  4769                                  ;
  4770 00001B91 C8020000                 ENTER  2,0
  4771 00001B95 6A3D                     push 61
  4772 00001B97 E8B8F3                   call istoken
  4773 00001B9A 83C402                   add  sp, 2
  4774 00001B9D 08C0                     or  al, al
  4775 00001B9F 0F840E00                 je .doreg1247
  4776 00001BA3 68[441D]                 push doreg1_0
  4777 00001BA6 8D06A4A5                 lea  ax, [ops]
  4778 00001BAA 50                       push ax
  4779 00001BAB E87BE6                   call strcpy
  4780 00001BAE 83C404                   add  sp, 4
  4781                                  
  4782                                  ;-656   if (istoken(T_PLUSASS))    strcpy(ops, "add");
  4783                                  
  4784                                  .doreg1247:
  4785 00001BB1 68CE04                   push 1230
  4786 00001BB4 E89BF3                   call istoken
  4787 00001BB7 83C402                   add  sp, 2
  4788 00001BBA 08C0                     or  al, al
  4789 00001BBC 0F840E00                 je .doreg1248
  4790 00001BC0 68[481D]                 push doreg1_1
  4791 00001BC3 8D06A4A5                 lea  ax, [ops]
  4792 00001BC7 50                       push ax
  4793 00001BC8 E85EE6                   call strcpy
  4794 00001BCB 83C404                   add  sp, 4
  4795                                  
  4796                                  ;-657   if (istoken(T_MINUSASS))   strcpy(ops, "sub");
  4797                                  
  4798                                  .doreg1248:
  4799 00001BCE 68CF04                   push 1231
  4800 00001BD1 E87EF3                   call istoken
  4801 00001BD4 83C402                   add  sp, 2
  4802 00001BD7 08C0                     or  al, al
  4803 00001BD9 0F840E00                 je .doreg1249
  4804 00001BDD 68[4C1D]                 push doreg1_2
  4805 00001BE0 8D06A4A5                 lea  ax, [ops]
  4806 00001BE4 50                       push ax
  4807 00001BE5 E841E6                   call strcpy
  4808 00001BE8 83C404                   add  sp, 4
  4809                                  
  4810                                  ;-658   if (istoken(T_ANDASS))     strcpy(ops, "and");
  4811                                  
  4812                                  .doreg1249:
  4813 00001BEB 68D204                   push 1234
  4814 00001BEE E861F3                   call istoken
  4815 00001BF1 83C402                   add  sp, 2
  4816 00001BF4 08C0                     or  al, al
  4817 00001BF6 0F840E00                 je .doreg1250
  4818 00001BFA 68[501D]                 push doreg1_3
  4819 00001BFD 8D06A4A5                 lea  ax, [ops]
  4820 00001C01 50                       push ax
  4821 00001C02 E824E6                   call strcpy
  4822 00001C05 83C404                   add  sp, 4
  4823                                  
  4824                                  ;-659   if (istoken(T_ORASS))      strcpy(ops, "or" );
  4825                                  
  4826                                  .doreg1250:
  4827 00001C08 68D304                   push 1235
  4828 00001C0B E844F3                   call istoken
  4829 00001C0E 83C402                   add  sp, 2
  4830 00001C11 08C0                     or  al, al
  4831 00001C13 0F840E00                 je .doreg1251
  4832 00001C17 68[541D]                 push doreg1_4
  4833 00001C1A 8D06A4A5                 lea  ax, [ops]
  4834 00001C1E 50                       push ax
  4835 00001C1F E807E6                   call strcpy
  4836 00001C22 83C404                   add  sp, 4
  4837                                  
  4838                                  ;-660   if (istoken(T_LESSLESS))   strcpy(ops, "shl");
  4839                                  
  4840                                  .doreg1251:
  4841 00001C25 68D804                   push 1240
  4842 00001C28 E827F3                   call istoken
  4843 00001C2B 83C402                   add  sp, 2
  4844 00001C2E 08C0                     or  al, al
  4845 00001C30 0F840E00                 je .doreg1252
  4846 00001C34 68[571D]                 push doreg1_5
  4847 00001C37 8D06A4A5                 lea  ax, [ops]
  4848 00001C3B 50                       push ax
  4849 00001C3C E8EAE5                   call strcpy
  4850 00001C3F 83C404                   add  sp, 4
  4851                                  
  4852                                  ;-661   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");
  4853                                  
  4854                                  .doreg1252:
  4855 00001C42 68D904                   push 1241
  4856 00001C45 E80AF3                   call istoken
  4857 00001C48 83C402                   add  sp, 2
  4858 00001C4B 08C0                     or  al, al
  4859 00001C4D 0F840E00                 je .doreg1253
  4860 00001C51 68[5B1D]                 push doreg1_6
  4861 00001C54 8D06A4A5                 lea  ax, [ops]
  4862 00001C58 50                       push ax
  4863 00001C59 E8CDE5                   call strcpy
  4864 00001C5C 83C404                   add  sp, 4
  4865                                  
  4866                                  ;-662   if (iscmp1 == 1) { token=getlex();
  4867                                  
  4868                                  .doreg1253:
  4869 00001C5F 8B4604                   mov ax, [bp+4]
  4870 00001C62 83F801                   cmp ax, 1
  4871 00001C65 0F852700                 jne .doreg1254
  4872 00001C69 E834EC                   call getlex
  4873 00001C6C A3[1E00]                 mov word [token], ax
  4874                                  
  4875                                  ;-663       if (isrelational() ==0) error1("Relational expected");
  4876                                  
  4877 00001C6F E83EF9                   call isrelational
  4878 00001C72 83F800                   cmp ax, 0
  4879 00001C75 0F850900                 jne .doreg1255
  4880 00001C79 68[5F1D]                 push doreg1_7
  4881 00001C7C E881E9                   call error1
  4882 00001C7F 83C402                   add  sp, 2
  4883                                  
  4884                                  ;-664       strcpy(ops, "cmp"); }
  4885                                  
  4886                                  .doreg1255:
  4887 00001C82 68[731D]                 push doreg1_8
  4888 00001C85 8D06A4A5                 lea  ax, [ops]
  4889 00001C89 50                       push ax
  4890 00001C8A E89CE5                   call strcpy
  4891 00001C8D 83C404                   add  sp, 4
  4892                                  
  4893                                  ;-665   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");
  4894                                  
  4895                                  .doreg1254:
  4896 00001C90 E8E0E7                   call prnl
  4897 00001C93 8D06A4A5                 lea  ax, [ops]
  4898 00001C97 50                       push ax
  4899 00001C98 E844E7                   call prs
  4900 00001C9B 83C402                   add  sp, 2
  4901 00001C9E 68[771D]                 push doreg1_9
  4902 00001CA1 E83BE7                   call prs
  4903 00001CA4 83C402                   add  sp, 2
  4904 00001CA7 FF36[4B00]               push word [ireg1]
  4905 00001CAB E877FD                   call printreg
  4906 00001CAE 83C402                   add  sp, 2
  4907 00001CB1 68[7A1D]                 push doreg1_10
  4908 00001CB4 E828E7                   call prs
  4909 00001CB7 83C402                   add  sp, 2
  4910                                  
  4911                                  ;-666 
  4912                                  
  4913                                  
  4914                                  ;-667   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}
  4915                                  
  4916 00001CBA 680101                   push 257
  4917 00001CBD E892F2                   call istoken
  4918 00001CC0 83C402                   add  sp, 2
  4919 00001CC3 08C0                     or  al, al
  4920 00001CC5 0F840D00                 je .doreg1256
  4921 00001CC9 FF36[2B00]               push word [lexval]
  4922 00001CCD E872E8                   call prunsign1
  4923 00001CD0 83C402                   add  sp, 2
  4924 00001CD3 E94700                   jmp .reg1
  4925                                  
  4926                                  ;-668   mod2=typeName(); ireg2=checkreg();
  4927                                  
  4928                                  .doreg1256:
  4929 00001CD6 E883F4                   call typeName
  4930 00001CD9 A3[4D00]                 mov word [mod2], ax
  4931 00001CDC E838F9                   call checkreg
  4932 00001CDF A3[4F00]                 mov word [ireg2], ax
  4933                                  
  4934                                  ;-669   if (ireg2) {printreg(ireg2); goto reg1;}
  4935                                  
  4936 00001CE2 A1[4F00]                 mov ax, [ireg2]
  4937 00001CE5 08C0                     or  al, al
  4938 00001CE7 0F840D00                 je .doreg1257
  4939 00001CEB FF36[4F00]               push word [ireg2]
  4940 00001CEF E833FD                   call printreg
  4941 00001CF2 83C402                   add  sp, 2
  4942 00001CF5 E92500                   jmp .reg1
  4943                                  
  4944                                  ;-670   i=searchname();  if (mod2 == 2) printName(i); else v(i);
  4945                                  
  4946                                  .doreg1257:
  4947 00001CF8 E8EEF3                   call searchname
  4948 00001CFB 8946FE                   mov [bp-2], ax
  4949 00001CFE A1[4D00]                 mov ax, [mod2]
  4950 00001D01 83F802                   cmp ax, 2
  4951 00001D04 0F850C00                 jne .doreg1258
  4952 00001D08 FF76FE                   push word [bp-2]
  4953 00001D0B E8F0EA                   call printName
  4954 00001D0E 83C402                   add  sp, 2
  4955 00001D11 E90900                   jmp .doreg1259
  4956                                  .doreg1258:
  4957 00001D14 FF76FE                   push word [bp-2]
  4958 00001D17 E8C2F2                   call v
  4959 00001D1A 83C402                   add  sp, 2
  4960                                  
  4961                                  ;-671   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }
  4962                                  
  4963                                  .doreg1259:
  4964                                  .reg1:
  4965 00001D1D 8B4604                   mov ax, [bp+4]
  4966 00001D20 83F801                   cmp ax, 1
  4967 00001D23 0F851B00                 jne .doreg1260
  4968 00001D27 6A00                     push 0
  4969 00001D29 E814F7                   call cmpneg
  4970 00001D2C 83C402                   add  sp, 2
  4971 00001D2F 8D06236E                 lea  ax, [fname]
  4972 00001D33 50                       push ax
  4973 00001D34 E8A8E6                   call prs
  4974 00001D37 83C402                   add  sp, 2
  4975 00001D3A 6A29                     push 41
  4976 00001D3C E835F2                   call expect
  4977 00001D3F 83C402                   add  sp, 2
  4978                                  
  4979                                  ;-672 }
  4980                                  
  4981                                  .doreg1260:
  4982                                  
  4983                                  ;-673 
  4984                                  
  4985                                  
  4986                                  ;-674 int compoundass(char *op, int mode, int id1) {
  4987 00001D42 C9                       LEAVE
  4988 00001D43 C3                       ret
  4989 00001D44 6D6F7600                doreg1_0 db "mov",0
  4990 00001D48 61646400                doreg1_1 db "add",0
  4991 00001D4C 73756200                doreg1_2 db "sub",0
  4992 00001D50 616E6400                doreg1_3 db "and",0
  4993 00001D54 6F7200                  doreg1_4 db "or",0
  4994 00001D57 73686C00                doreg1_5 db "shl",0
  4995 00001D5B 73687200                doreg1_6 db "shr",0
  4996 00001D5F 52656C6174696F6E61-     doreg1_7 db "Relational expected",0
  4997 00001D68 6C2065787065637465-
  4998 00001D71 6400               
  4999 00001D73 636D7000                doreg1_8 db "cmp",0
  5000 00001D77 202000                  doreg1_9 db "  ",0
  5001 00001D7A 2C2000                  doreg1_10 db ", ",0
  5002                                  ENDP
  5003                                  
  5004                                  compoundass: PROC
  5005                                  
  5006                                  ;-675   if(mode) error1("only scalar Var allowed");
  5007                                  ;
  5008 00001D7D C8000000                 ENTER  0,0
  5009 00001D81 8B4606                   mov ax, [bp+6]
  5010 00001D84 08C0                     or  al, al
  5011 00001D86 0F840900                 je .compoundass261
  5012 00001D8A 68[F71D]                 push compoundass_0
  5013 00001D8D E870E8                   call error1
  5014 00001D90 83C402                   add  sp, 2
  5015                                  
  5016                                  ;-676   prnl(); prs(op); prs("  ");
  5017                                  
  5018                                  .compoundass261:
  5019 00001D93 E8DDE6                   call prnl
  5020 00001D96 FF7604                   push word [bp+4]
  5021 00001D99 E843E6                   call prs
  5022 00001D9C 83C402                   add  sp, 2
  5023 00001D9F 68[0F1E]                 push compoundass_1
  5024 00001DA2 E83AE6                   call prs
  5025 00001DA5 83C402                   add  sp, 2
  5026                                  
  5027                                  ;-677   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  5028                                  
  5029 00001DA8 FF7608                   push word [bp+8]
  5030 00001DAB E887F4                   call gettypes
  5031 00001DAE 83C402                   add  sp, 2
  5032 00001DB1 A1[3600]                 mov ax, [wi]
  5033 00001DB4 83F802                   cmp ax, 2
  5034 00001DB7 0F850C00                 jne .compoundass262
  5035 00001DBB 68[121E]                 push compoundass_2
  5036 00001DBE E81EE6                   call prs
  5037 00001DC1 83C402                   add  sp, 2
  5038 00001DC4 E90900                   jmp .compoundass263
  5039                                  .compoundass262:
  5040 00001DC7 68[171E]                 push compoundass_3
  5041 00001DCA E812E6                   call prs
  5042 00001DCD 83C402                   add  sp, 2
  5043                                  
  5044                                  ;-678   v(id1); prs(", ");
  5045                                  
  5046                                  .compoundass263:
  5047 00001DD0 FF7608                   push word [bp+8]
  5048 00001DD3 E806F2                   call v
  5049 00001DD6 83C402                   add  sp, 2
  5050 00001DD9 68[1C1E]                 push compoundass_4
  5051 00001DDC E800E6                   call prs
  5052 00001DDF 83C402                   add  sp, 2
  5053                                  
  5054                                  ;-679   expect(T_CONST); prunsign1(lexval);
  5055                                  
  5056 00001DE2 680101                   push 257
  5057 00001DE5 E88CF1                   call expect
  5058 00001DE8 83C402                   add  sp, 2
  5059 00001DEB FF36[2B00]               push word [lexval]
  5060 00001DEF E850E7                   call prunsign1
  5061 00001DF2 83C402                   add  sp, 2
  5062                                  
  5063                                  ;-680 }
  5064                                  
  5065                                  
  5066                                  ;-681 int dovar1(int mode, int op, int ixarr, int id1) {
  5067 00001DF5 C9                       LEAVE
  5068 00001DF6 C3                       ret
  5069 00001DF7 6F6E6C79207363616C-     compoundass_0 db "only scalar Var allowed",0
  5070 00001E00 61722056617220616C-
  5071 00001E09 6C6F77656400       
  5072 00001E0F 202000                  compoundass_1 db "  ",0
  5073 00001E12 776F726400              compoundass_2 db "word",0
  5074 00001E17 6279746500              compoundass_3 db "byte",0
  5075 00001E1C 2C2000                  compoundass_4 db ", ",0
  5076                                  ENDP
  5077                                  
  5078                                  dovar1: PROC
  5079                                  
  5080                                  ;-682   gettypes(id1);
  5081                                  ;
  5082 00001E1F C8000000                 ENTER  0,0
  5083 00001E23 FF760A                   push word [bp+10]
  5084 00001E26 E80CF4                   call gettypes
  5085 00001E29 83C402                   add  sp, 2
  5086                                  
  5087                                  ;-683   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);
  5088                                  
  5089 00001E2C 8B4604                   mov ax, [bp+4]
  5090 00001E2F 83F801                   cmp ax, 1
  5091 00001E32 0F854700                 jne .dovar1264
  5092 00001E36 68[741F]                 push dovar1_0
  5093 00001E39 E8A3E5                   call prs
  5094 00001E3C 83C402                   add  sp, 2
  5095 00001E3F FF760A                   push word [bp+10]
  5096 00001E42 E897F1                   call v
  5097 00001E45 83C402                   add  sp, 2
  5098 00001E48 E828E6                   call prnl
  5099 00001E4B FF7606                   push word [bp+6]
  5100 00001E4E E88EE5                   call prs
  5101 00001E51 83C402                   add  sp, 2
  5102                                  
  5103                                  ;-684     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");
  5104                                  
  5105 00001E54 A1[3300]                 mov ax, [widthi]
  5106 00001E57 83F801                   cmp ax, 1
  5107 00001E5A 0F850900                 jne .dovar1265
  5108 00001E5E 68[801F]                 push dovar1_1
  5109 00001E61 E87BE5                   call prs
  5110 00001E64 83C402                   add  sp, 2
  5111                                  
  5112                                  ;-685     if(widthi == 2) prs(" ax, [bx]");
  5113                                  
  5114                                  .dovar1265:
  5115 00001E67 A1[3300]                 mov ax, [widthi]
  5116 00001E6A 83F802                   cmp ax, 2
  5117 00001E6D 0F850900                 jne .dovar1266
  5118 00001E71 68[961F]                 push dovar1_2
  5119 00001E74 E868E5                   call prs
  5120 00001E77 83C402                   add  sp, 2
  5121                                  
  5122                                  ;-686     return; }
  5123                                  
  5124                                  .dovar1266:
  5125 00001E7A E9F500                   jmp .retndovar1
  5126                                  
  5127                                  ;-687   if (mode==2){prnl();prs(op);prs(" ax, "); printName(id1); return; }
  5128                                  
  5129                                  .dovar1264:
  5130 00001E7D 8B4604                   mov ax, [bp+4]
  5131 00001E80 83F802                   cmp ax, 2
  5132 00001E83 0F852100                 jne .dovar1267
  5133 00001E87 E8E9E5                   call prnl
  5134 00001E8A FF7606                   push word [bp+6]
  5135 00001E8D E84FE5                   call prs
  5136 00001E90 83C402                   add  sp, 2
  5137 00001E93 68[A01F]                 push dovar1_3
  5138 00001E96 E846E5                   call prs
  5139 00001E99 83C402                   add  sp, 2
  5140 00001E9C FF760A                   push word [bp+10]
  5141 00001E9F E85CE9                   call printName
  5142 00001EA2 83C402                   add  sp, 2
  5143 00001EA5 E9CA00                   jmp .retndovar1
  5144                                  
  5145                                  ;-688   if (ixarr) {
  5146                                  
  5147                                  .dovar1267:
  5148 00001EA8 8B4608                   mov ax, [bp+8]
  5149 00001EAB 08C0                     or  al, al
  5150 00001EAD 0F847300                 je .dovar1268
  5151                                  
  5152                                  ;-689     prs("\n mov bx, "); v(ixarr);
  5153                                  
  5154 00001EB1 68[A61F]                 push dovar1_4
  5155 00001EB4 E828E5                   call prs
  5156 00001EB7 83C402                   add  sp, 2
  5157 00001EBA FF7608                   push word [bp+8]
  5158 00001EBD E81CF1                   call v
  5159 00001EC0 83C402                   add  sp, 2
  5160                                  
  5161                                  ;-690     if (wi==2) prs("\n shl bx, 1");
  5162                                  
  5163 00001EC3 A1[3600]                 mov ax, [wi]
  5164 00001EC6 83F802                   cmp ax, 2
  5165 00001EC9 0F850900                 jne .dovar1269
  5166 00001ECD 68[B21F]                 push dovar1_5
  5167 00001ED0 E80CE5                   call prs
  5168 00001ED3 83C402                   add  sp, 2
  5169                                  
  5170                                  ;-691     prs("\n "); prs(op);
  5171                                  
  5172                                  .dovar1269:
  5173 00001ED6 68[BF1F]                 push dovar1_6
  5174 00001ED9 E803E5                   call prs
  5175 00001EDC 83C402                   add  sp, 2
  5176 00001EDF FF7606                   push word [bp+6]
  5177 00001EE2 E8FAE4                   call prs
  5178 00001EE5 83C402                   add  sp, 2
  5179                                  
  5180                                  ;-692     if (wi==2) prs(" ax, "); else prs(" al, ");
  5181                                  
  5182 00001EE8 A1[3600]                 mov ax, [wi]
  5183 00001EEB 83F802                   cmp ax, 2
  5184 00001EEE 0F850C00                 jne .dovar1270
  5185 00001EF2 68[C31F]                 push dovar1_7
  5186 00001EF5 E8E7E4                   call prs
  5187 00001EF8 83C402                   add  sp, 2
  5188 00001EFB E90900                   jmp .dovar1271
  5189                                  .dovar1270:
  5190 00001EFE 68[C91F]                 push dovar1_8
  5191 00001F01 E8DBE4                   call prs
  5192 00001F04 83C402                   add  sp, 2
  5193                                  
  5194                                  ;-693 // v(id1); prs(" [bx]");
  5195                                  
  5196                                  
  5197                                  ;-694     prc('['); printName(id1); prs(" + bx]");
  5198                                  
  5199                                  .dovar1271:
  5200 00001F07 6A5B                     push 91
  5201 00001F09 E87AE4                   call prc
  5202 00001F0C 83C402                   add  sp, 2
  5203 00001F0F FF760A                   push word [bp+10]
  5204 00001F12 E8E9E8                   call printName
  5205 00001F15 83C402                   add  sp, 2
  5206 00001F18 68[CF1F]                 push dovar1_9
  5207 00001F1B E8C1E4                   call prs
  5208 00001F1E 83C402                   add  sp, 2
  5209                                  
  5210                                  ;-695     return; }
  5211                                  
  5212 00001F21 E94E00                   jmp .retndovar1
  5213                                  
  5214                                  ;-696   prnl();prs(op);
  5215                                  
  5216                                  .dovar1268:
  5217 00001F24 E84CE5                   call prnl
  5218 00001F27 FF7606                   push word [bp+6]
  5219 00001F2A E8B2E4                   call prs
  5220 00001F2D 83C402                   add  sp, 2
  5221                                  
  5222                                  ;-697   if(wi==1) prs(" al, ");
  5223                                  
  5224 00001F30 A1[3600]                 mov ax, [wi]
  5225 00001F33 83F801                   cmp ax, 1
  5226 00001F36 0F850900                 jne .dovar1272
  5227 00001F3A 68[D61F]                 push dovar1_10
  5228 00001F3D E89FE4                   call prs
  5229 00001F40 83C402                   add  sp, 2
  5230                                  
  5231                                  ;-698   if(wi==2) prs(" ax, ");
  5232                                  
  5233                                  .dovar1272:
  5234 00001F43 A1[3600]                 mov ax, [wi]
  5235 00001F46 83F802                   cmp ax, 2
  5236 00001F49 0F850900                 jne .dovar1273
  5237 00001F4D 68[DC1F]                 push dovar1_11
  5238 00001F50 E88CE4                   call prs
  5239 00001F53 83C402                   add  sp, 2
  5240                                  
  5241                                  ;-699   if(wi==4) prs(" eax, ");
  5242                                  
  5243                                  .dovar1273:
  5244 00001F56 A1[3600]                 mov ax, [wi]
  5245 00001F59 83F804                   cmp ax, 4
  5246 00001F5C 0F850900                 jne .dovar1274
  5247 00001F60 68[E21F]                 push dovar1_12
  5248 00001F63 E879E4                   call prs
  5249 00001F66 83C402                   add  sp, 2
  5250                                  
  5251                                  ;-700   v(id1);
  5252                                  
  5253                                  .dovar1274:
  5254 00001F69 FF760A                   push word [bp+10]
  5255 00001F6C E86DF0                   call v
  5256 00001F6F 83C402                   add  sp, 2
  5257                                  
  5258                                  ;-701 }
  5259                                  
  5260                                  
  5261                                  ;-702 int rterm(char *op) {int mode; int opint; int ixarr; int id1;
  5262                                  
  5263 00001F72 C9                       .retndovar1: LEAVE
  5264 00001F73 C3                       ret
  5265 00001F74 5C6E206D6F76206278-     dovar1_0 db "\n mov bx, ",0
  5266 00001F7D 2C2000             
  5267 00001F80 20616C2C205B62785D-     dovar1_1 db " al, [bx]\n mov ah, 0",0
  5268 00001F89 5C6E206D6F76206168-
  5269 00001F92 2C203000           
  5270 00001F96 2061782C205B62785D-     dovar1_2 db " ax, [bx]",0
  5271 00001F9F 00                 
  5272 00001FA0 2061782C2000            dovar1_3 db " ax, ",0
  5273 00001FA6 5C6E206D6F76206278-     dovar1_4 db "\n mov bx, ",0
  5274 00001FAF 2C2000             
  5275 00001FB2 5C6E2073686C206278-     dovar1_5 db "\n shl bx, 1",0
  5276 00001FBB 2C203100           
  5277 00001FBF 5C6E2000                dovar1_6 db "\n ",0
  5278 00001FC3 2061782C2000            dovar1_7 db " ax, ",0
  5279 00001FC9 20616C2C2000            dovar1_8 db " al, ",0
  5280 00001FCF 202B2062785D00          dovar1_9 db " + bx]",0
  5281 00001FD6 20616C2C2000            dovar1_10 db " al, ",0
  5282 00001FDC 2061782C2000            dovar1_11 db " ax, ",0
  5283 00001FE2 206561782C2000          dovar1_12 db " eax, ",0
  5284                                  ENDP
  5285                                  
  5286                                  rterm: PROC
  5287                                  
  5288                                  ;-703   if (istoken(T_CONST)) { prnl(); prs(op);
  5289                                  ;
  5290 00001FE9 C8080000                 ENTER  8,0
  5291 00001FED 680101                   push 257
  5292 00001FF0 E85FEF                   call istoken
  5293 00001FF3 83C402                   add  sp, 2
  5294 00001FF6 08C0                     or  al, al
  5295 00001FF8 0F845200                 je .rterm275
  5296 00001FFC E874E4                   call prnl
  5297 00001FFF FF7604                   push word [bp+4]
  5298 00002002 E8DAE3                   call prs
  5299 00002005 83C402                   add  sp, 2
  5300                                  
  5301                                  ;-704     if (wi==1) prs(" al, ");
  5302                                  
  5303 00002008 A1[3600]                 mov ax, [wi]
  5304 0000200B 83F801                   cmp ax, 1
  5305 0000200E 0F850900                 jne .rterm276
  5306 00002012 68[D220]                 push rterm_0
  5307 00002015 E8C7E3                   call prs
  5308 00002018 83C402                   add  sp, 2
  5309                                  
  5310                                  ;-705     if (wi==2) prs(" ax, ");
  5311                                  
  5312                                  .rterm276:
  5313 0000201B A1[3600]                 mov ax, [wi]
  5314 0000201E 83F802                   cmp ax, 2
  5315 00002021 0F850900                 jne .rterm277
  5316 00002025 68[D820]                 push rterm_1
  5317 00002028 E8B4E3                   call prs
  5318 0000202B 83C402                   add  sp, 2
  5319                                  
  5320                                  ;-706     if (wi==4) prs(" eax, ");
  5321                                  
  5322                                  .rterm277:
  5323 0000202E A1[3600]                 mov ax, [wi]
  5324 00002031 83F804                   cmp ax, 4
  5325 00002034 0F850900                 jne .rterm278
  5326 00002038 68[DE20]                 push rterm_2
  5327 0000203B E8A1E3                   call prs
  5328 0000203E 83C402                   add  sp, 2
  5329                                  
  5330                                  ;-707     prunsign1(lexval); return;}
  5331                                  
  5332                                  .rterm278:
  5333 00002041 FF36[2B00]               push word [lexval]
  5334 00002045 E8FAE4                   call prunsign1
  5335 00002048 83C402                   add  sp, 2
  5336 0000204B E98200                   jmp .retnrterm
  5337                                  
  5338                                  ;-708   mode=typeName(); id1=searchname(); ixarr=0;
  5339                                  
  5340                                  .rterm275:
  5341 0000204E E80BF1                   call typeName
  5342 00002051 8946FE                   mov [bp-2], ax
  5343 00002054 E892F0                   call searchname
  5344 00002057 8946F8                   mov [bp-8], ax
  5345 0000205A B80000                   mov ax, 0
  5346 0000205D 8946FA                   mov [bp-6], ax
  5347                                  
  5348                                  ;-709   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');
  5349                                  
  5350 00002060 6A5B                     push 91
  5351 00002062 E8EDEE                   call istoken
  5352 00002065 83C402                   add  sp, 2
  5353 00002068 08C0                     or  al, al
  5354 0000206A 0F843300                 je .rterm279
  5355 0000206E E878F0                   call searchname
  5356 00002071 8946FA                   mov [bp-6], ax
  5357 00002074 680001                   push 256
  5358 00002077 E8FAEE                   call expect
  5359 0000207A 83C402                   add  sp, 2
  5360 0000207D 6A5D                     push 93
  5361 0000207F E8F2EE                   call expect
  5362 00002082 83C402                   add  sp, 2
  5363                                  
  5364                                  ;-710     gettypes(ixarr);
  5365                                  
  5366 00002085 FF76FA                   push word [bp-6]
  5367 00002088 E8AAF1                   call gettypes
  5368 0000208B 83C402                   add  sp, 2
  5369                                  
  5370                                  ;-711     if (widthi != 2) error1("Arrayindex muss int sein"); }
  5371                                  
  5372 0000208E A1[3300]                 mov ax, [widthi]
  5373 00002091 83F802                   cmp ax, 2
  5374 00002094 0F840900                 je  .rterm280
  5375 00002098 68[E520]                 push rterm_3
  5376 0000209B E862E5                   call error1
  5377 0000209E 83C402                   add  sp, 2
  5378                                  .rterm280:
  5379                                  
  5380                                  ;-712   if (eqstr(symbol,"_AX")) return;
  5381                                  
  5382                                  .rterm279:
  5383 000020A1 68[FE20]                 push rterm_4
  5384 000020A4 8D06A36D                 lea  ax, [symbol]
  5385 000020A8 50                       push ax
  5386 000020A9 E8B3E1                   call eqstr
  5387 000020AC 83C404                   add  sp, 4
  5388 000020AF 08C0                     or  al, al
  5389 000020B1 0F840300                 je .rterm281
  5390 000020B5 E91800                   jmp .retnrterm
  5391                                  
  5392                                  ;-713   opint=op; dovar1(mode, opint, ixarr, id1);
  5393                                  
  5394                                  .rterm281:
  5395 000020B8 8B4604                   mov ax, [bp+4]
  5396 000020BB 8946FC                   mov [bp-4], ax
  5397 000020BE FF76F8                   push word [bp-8]
  5398 000020C1 FF76FA                   push word [bp-6]
  5399 000020C4 FF76FC                   push word [bp-4]
  5400 000020C7 FF76FE                   push word [bp-2]
  5401 000020CA E852FD                   call dovar1
  5402 000020CD 83C408                   add  sp, 8
  5403                                  
  5404                                  ;-714 }
  5405                                  
  5406                                  
  5407                                  ;-715 
  5408                                  
  5409                                  
  5410                                  ;-716 int doreg(char *dr) { int i; expect('=');
  5411                                  
  5412 000020D0 C9                       .retnrterm: LEAVE
  5413 000020D1 C3                       ret
  5414 000020D2 20616C2C2000            rterm_0 db " al, ",0
  5415 000020D8 2061782C2000            rterm_1 db " ax, ",0
  5416 000020DE 206561782C2000          rterm_2 db " eax, ",0
  5417 000020E5 4172726179696E6465-     rterm_3 db "Arrayindex muss int sein",0
  5418 000020EE 78206D75737320696E-
  5419 000020F7 74207365696E00     
  5420 000020FE 5F415800                rterm_4 db "_AX",0
  5421                                  ENDP
  5422                                  
  5423                                  doreg: PROC;
  5424 00002102 C8020000                 ENTER  2,0
  5425 00002106 6A3D                     push 61
  5426 00002108 E869EE                   call expect
  5427 0000210B 83C402                   add  sp, 2
  5428                                  
  5429                                  ;-717   prs("\n mov  "); prs(dr); prs(", ");
  5430                                  
  5431 0000210E 68[7121]                 push doreg_0
  5432 00002111 E8CBE2                   call prs
  5433 00002114 83C402                   add  sp, 2
  5434 00002117 FF7604                   push word [bp+4]
  5435 0000211A E8C2E2                   call prs
  5436 0000211D 83C402                   add  sp, 2
  5437 00002120 68[7A21]                 push doreg_1
  5438 00002123 E8B9E2                   call prs
  5439 00002126 83C402                   add  sp, 2
  5440                                  
  5441                                  ;-718        if (istoken(T_CONST)) prunsign1(lexval);
  5442                                  
  5443 00002129 680101                   push 257
  5444 0000212C E823EE                   call istoken
  5445 0000212F 83C402                   add  sp, 2
  5446 00002132 08C0                     or  al, al
  5447 00002134 0F840D00                 je .doreg282
  5448 00002138 FF36[2B00]               push word [lexval]
  5449 0000213C E803E4                   call prunsign1
  5450 0000213F 83C402                   add  sp, 2
  5451                                  
  5452                                  ;-719   else if (istoken(T_NAME )) { i=searchname(); v(i); }
  5453                                  
  5454 00002142 E92A00                   jmp .doreg283
  5455                                  .doreg282:
  5456 00002145 680001                   push 256
  5457 00002148 E807EE                   call istoken
  5458 0000214B 83C402                   add  sp, 2
  5459 0000214E 08C0                     or  al, al
  5460 00002150 0F841200                 je .doreg284
  5461 00002154 E892EF                   call searchname
  5462 00002157 8946FE                   mov [bp-2], ax
  5463 0000215A FF76FE                   push word [bp-2]
  5464 0000215D E87CEE                   call v
  5465 00002160 83C402                   add  sp, 2
  5466                                  
  5467                                  ;-720   else error1("only number or var allowed");
  5468                                  
  5469 00002163 E90900                   jmp .doreg285
  5470                                  .doreg284:
  5471 00002166 68[7D21]                 push doreg_2
  5472 00002169 E894E4                   call error1
  5473 0000216C 83C402                   add  sp, 2
  5474                                  
  5475                                  ;-721 }
  5476                                  
  5477                                  .doreg285:
  5478                                  .doreg283:
  5479                                  
  5480                                  ;-722 int isreg() {
  5481 0000216F C9                       LEAVE
  5482 00002170 C3                       ret
  5483 00002171 5C6E206D6F76202000      doreg_0 db "\n mov  ",0
  5484 0000217A 2C2000                  doreg_1 db ", ",0
  5485 0000217D 6F6E6C79206E756D62-     doreg_2 db "only number or var allowed",0
  5486 00002186 6572206F7220766172-
  5487 0000218F 20616C6C6F77656400 
  5488                                  ENDP
  5489                                  
  5490                                  isreg: PROC
  5491                                  
  5492                                  ;-723   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}
  5493                                  
  5494 00002198 68[8523]                 push isreg_0
  5495 0000219B 8D06A36D                 lea  ax, [symbol]
  5496 0000219F 50                       push ax
  5497 000021A0 E8BCE0                   call eqstr
  5498 000021A3 83C404                   add  sp, 4
  5499 000021A6 08C0                     or  al, al
  5500 000021A8 0F840C00                 je .isreg286
  5501 000021AC 68[8923]                 push isreg_1
  5502 000021AF E850FF                   call doreg
  5503 000021B2 83C402                   add  sp, 2
  5504 000021B5 E9C601                   jmp .r1
  5505                                  
  5506                                  ;-724   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}
  5507                                  
  5508                                  .isreg286:
  5509 000021B8 68[8C23]                 push isreg_2
  5510 000021BB 8D06A36D                 lea  ax, [symbol]
  5511 000021BF 50                       push ax
  5512 000021C0 E89CE0                   call eqstr
  5513 000021C3 83C404                   add  sp, 4
  5514 000021C6 08C0                     or  al, al
  5515 000021C8 0F840C00                 je .isreg287
  5516 000021CC 68[9023]                 push isreg_3
  5517 000021CF E830FF                   call doreg
  5518 000021D2 83C402                   add  sp, 2
  5519 000021D5 E9A601                   jmp .r1
  5520                                  
  5521                                  ;-725   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}
  5522                                  
  5523                                  .isreg287:
  5524 000021D8 68[9323]                 push isreg_4
  5525 000021DB 8D06A36D                 lea  ax, [symbol]
  5526 000021DF 50                       push ax
  5527 000021E0 E87CE0                   call eqstr
  5528 000021E3 83C404                   add  sp, 4
  5529 000021E6 08C0                     or  al, al
  5530 000021E8 0F840C00                 je .isreg288
  5531 000021EC 68[9723]                 push isreg_5
  5532 000021EF E810FF                   call doreg
  5533 000021F2 83C402                   add  sp, 2
  5534 000021F5 E98601                   jmp .r1
  5535                                  
  5536                                  ;-726   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}
  5537                                  
  5538                                  .isreg288:
  5539 000021F8 68[9A23]                 push isreg_6
  5540 000021FB 8D06A36D                 lea  ax, [symbol]
  5541 000021FF 50                       push ax
  5542 00002200 E85CE0                   call eqstr
  5543 00002203 83C404                   add  sp, 4
  5544 00002206 08C0                     or  al, al
  5545 00002208 0F840C00                 je .isreg289
  5546 0000220C 68[9E23]                 push isreg_7
  5547 0000220F E8F0FE                   call doreg
  5548 00002212 83C402                   add  sp, 2
  5549 00002215 E96601                   jmp .r1
  5550                                  
  5551                                  ;-727   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}
  5552                                  
  5553                                  .isreg289:
  5554 00002218 68[A123]                 push isreg_8
  5555 0000221B 8D06A36D                 lea  ax, [symbol]
  5556 0000221F 50                       push ax
  5557 00002220 E83CE0                   call eqstr
  5558 00002223 83C404                   add  sp, 4
  5559 00002226 08C0                     or  al, al
  5560 00002228 0F840C00                 je .isreg290
  5561 0000222C 68[A523]                 push isreg_9
  5562 0000222F E8D0FE                   call doreg
  5563 00002232 83C402                   add  sp, 2
  5564 00002235 E94601                   jmp .r1
  5565                                  
  5566                                  ;-728   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}
  5567                                  
  5568                                  .isreg290:
  5569 00002238 68[A823]                 push isreg_10
  5570 0000223B 8D06A36D                 lea  ax, [symbol]
  5571 0000223F 50                       push ax
  5572 00002240 E81CE0                   call eqstr
  5573 00002243 83C404                   add  sp, 4
  5574 00002246 08C0                     or  al, al
  5575 00002248 0F840C00                 je .isreg291
  5576 0000224C 68[AC23]                 push isreg_11
  5577 0000224F E8B0FE                   call doreg
  5578 00002252 83C402                   add  sp, 2
  5579 00002255 E92601                   jmp .r1
  5580                                  
  5581                                  ;-729   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}
  5582                                  
  5583                                  .isreg291:
  5584 00002258 68[AF23]                 push isreg_12
  5585 0000225B 8D06A36D                 lea  ax, [symbol]
  5586 0000225F 50                       push ax
  5587 00002260 E8FCDF                   call eqstr
  5588 00002263 83C404                   add  sp, 4
  5589 00002266 08C0                     or  al, al
  5590 00002268 0F840C00                 je .isreg292
  5591 0000226C 68[B323]                 push isreg_13
  5592 0000226F E890FE                   call doreg
  5593 00002272 83C402                   add  sp, 2
  5594 00002275 E90601                   jmp .r1
  5595                                  
  5596                                  ;-730   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}
  5597                                  
  5598                                  .isreg292:
  5599 00002278 68[B623]                 push isreg_14
  5600 0000227B 8D06A36D                 lea  ax, [symbol]
  5601 0000227F 50                       push ax
  5602 00002280 E8DCDF                   call eqstr
  5603 00002283 83C404                   add  sp, 4
  5604 00002286 08C0                     or  al, al
  5605 00002288 0F840C00                 je .isreg293
  5606 0000228C 68[BA23]                 push isreg_15
  5607 0000228F E870FE                   call doreg
  5608 00002292 83C402                   add  sp, 2
  5609 00002295 E9E600                   jmp .r1
  5610                                  
  5611                                  ;-731   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}
  5612                                  
  5613                                  .isreg293:
  5614 00002298 68[BD23]                 push isreg_16
  5615 0000229B 8D06A36D                 lea  ax, [symbol]
  5616 0000229F 50                       push ax
  5617 000022A0 E8BCDF                   call eqstr
  5618 000022A3 83C404                   add  sp, 4
  5619 000022A6 08C0                     or  al, al
  5620 000022A8 0F840C00                 je .isreg294
  5621 000022AC 68[C123]                 push isreg_17
  5622 000022AF E850FE                   call doreg
  5623 000022B2 83C402                   add  sp, 2
  5624 000022B5 E9C600                   jmp .r1
  5625                                  
  5626                                  ;-732   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}
  5627                                  
  5628                                  .isreg294:
  5629 000022B8 68[C423]                 push isreg_18
  5630 000022BB 8D06A36D                 lea  ax, [symbol]
  5631 000022BF 50                       push ax
  5632 000022C0 E89CDF                   call eqstr
  5633 000022C3 83C404                   add  sp, 4
  5634 000022C6 08C0                     or  al, al
  5635 000022C8 0F840C00                 je .isreg295
  5636 000022CC 68[C823]                 push isreg_19
  5637 000022CF E830FE                   call doreg
  5638 000022D2 83C402                   add  sp, 2
  5639 000022D5 E9A600                   jmp .r1
  5640                                  
  5641                                  ;-733   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}
  5642                                  
  5643                                  .isreg295:
  5644 000022D8 68[CB23]                 push isreg_20
  5645 000022DB 8D06A36D                 lea  ax, [symbol]
  5646 000022DF 50                       push ax
  5647 000022E0 E87CDF                   call eqstr
  5648 000022E3 83C404                   add  sp, 4
  5649 000022E6 08C0                     or  al, al
  5650 000022E8 0F840C00                 je .isreg296
  5651 000022EC 68[CF23]                 push isreg_21
  5652 000022EF E810FE                   call doreg
  5653 000022F2 83C402                   add  sp, 2
  5654 000022F5 E98600                   jmp .r1
  5655                                  
  5656                                  ;-734   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}
  5657                                  
  5658                                  .isreg296:
  5659 000022F8 68[D223]                 push isreg_22
  5660 000022FB 8D06A36D                 lea  ax, [symbol]
  5661 000022FF 50                       push ax
  5662 00002300 E85CDF                   call eqstr
  5663 00002303 83C404                   add  sp, 4
  5664 00002306 08C0                     or  al, al
  5665 00002308 0F840C00                 je .isreg297
  5666 0000230C 68[D623]                 push isreg_23
  5667 0000230F E8F0FD                   call doreg
  5668 00002312 83C402                   add  sp, 2
  5669 00002315 E96600                   jmp .r1
  5670                                  
  5671                                  ;-735   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}
  5672                                  
  5673                                  .isreg297:
  5674 00002318 68[D923]                 push isreg_24
  5675 0000231B 8D06A36D                 lea  ax, [symbol]
  5676 0000231F 50                       push ax
  5677 00002320 E83CDF                   call eqstr
  5678 00002323 83C404                   add  sp, 4
  5679 00002326 08C0                     or  al, al
  5680 00002328 0F840C00                 je .isreg298
  5681 0000232C 68[DD23]                 push isreg_25
  5682 0000232F E8D0FD                   call doreg
  5683 00002332 83C402                   add  sp, 2
  5684 00002335 E94600                   jmp .r1
  5685                                  
  5686                                  ;-736   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}
  5687                                  
  5688                                  .isreg298:
  5689 00002338 68[E023]                 push isreg_26
  5690 0000233B 8D06A36D                 lea  ax, [symbol]
  5691 0000233F 50                       push ax
  5692 00002340 E81CDF                   call eqstr
  5693 00002343 83C404                   add  sp, 4
  5694 00002346 08C0                     or  al, al
  5695 00002348 0F840C00                 je .isreg299
  5696 0000234C 68[E423]                 push isreg_27
  5697 0000234F E8B0FD                   call doreg
  5698 00002352 83C402                   add  sp, 2
  5699 00002355 E92600                   jmp .r1
  5700                                  
  5701                                  ;-737   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}
  5702                                  
  5703                                  .isreg299:
  5704 00002358 68[E723]                 push isreg_28
  5705 0000235B 8D06A36D                 lea  ax, [symbol]
  5706 0000235F 50                       push ax
  5707 00002360 E8FCDE                   call eqstr
  5708 00002363 83C404                   add  sp, 4
  5709 00002366 08C0                     or  al, al
  5710 00002368 0F840C00                 je .isreg300
  5711 0000236C 68[EE23]                 push isreg_29
  5712 0000236F E890FD                   call doreg
  5713 00002372 83C402                   add  sp, 2
  5714 00002375 E90600                   jmp .r1
  5715                                  
  5716                                  ;-738   return 0;   r1: return 1;
  5717                                  
  5718                                  .isreg300:
  5719 00002378 B80000                   mov ax, 0
  5720 0000237B E90600                   jmp .retnisreg
  5721                                  .r1:
  5722 0000237E B80100                   mov ax, 1
  5723 00002381 E90000                   jmp .retnisreg
  5724                                  
  5725                                  ;-739 }
  5726                                  
  5727                                  
  5728                                  ;-740 
  5729                                  
  5730                                  
  5731                                  ;-741 int doassign(int mode, int i, int ixarr, int ixconst) {
  5732                                  
  5733                                   .retnisreg:
  5734 00002384 C3                       ret
  5735 00002385 5F414800                isreg_0 db "_AH",0
  5736 00002389 616800                  isreg_1 db "ah",0
  5737 0000238C 5F414C00                isreg_2 db "_AL",0
  5738 00002390 616C00                  isreg_3 db "al",0
  5739 00002393 5F415800                isreg_4 db "_AX",0
  5740 00002397 617800                  isreg_5 db "ax",0
  5741 0000239A 5F424800                isreg_6 db "_BH",0
  5742 0000239E 626800                  isreg_7 db "bh",0
  5743 000023A1 5F424C00                isreg_8 db "_BL",0
  5744 000023A5 626C00                  isreg_9 db "bl",0
  5745 000023A8 5F425800                isreg_10 db "_BX",0
  5746 000023AC 627800                  isreg_11 db "bx",0
  5747 000023AF 5F434800                isreg_12 db "_CH",0
  5748 000023B3 636800                  isreg_13 db "ch",0
  5749 000023B6 5F434C00                isreg_14 db "_CL",0
  5750 000023BA 636C00                  isreg_15 db "cl",0
  5751 000023BD 5F435800                isreg_16 db "_CX",0
  5752 000023C1 637800                  isreg_17 db "cx",0
  5753 000023C4 5F444800                isreg_18 db "_DH",0
  5754 000023C8 646800                  isreg_19 db "dh",0
  5755 000023CB 5F444C00                isreg_20 db "_DL",0
  5756 000023CF 646C00                  isreg_21 db "dl",0
  5757 000023D2 5F445800                isreg_22 db "_DX",0
  5758 000023D6 647800                  isreg_23 db "dx",0
  5759 000023D9 5F534900                isreg_24 db "_SI",0
  5760 000023DD 736900                  isreg_25 db "si",0
  5761 000023E0 5F444900                isreg_26 db "_DI",0
  5762 000023E4 646900                  isreg_27 db "di",0
  5763 000023E7 5F464C41475300          isreg_28 db "_FLAGS",0
  5764 000023EE 666C61677300            isreg_29 db "flags",0
  5765                                  ENDP
  5766                                  
  5767                                  doassign: PROC
  5768                                  
  5769                                  ;-742   gettypes(i);
  5770                                  ;
  5771 000023F4 C8000000                 ENTER  0,0
  5772 000023F8 FF7606                   push word [bp+6]
  5773 000023FB E837EE                   call gettypes
  5774 000023FE 83C402                   add  sp, 2
  5775                                  
  5776                                  ;-743   if (mode==1) {prs("\n mov  bx, ");v(i);
  5777                                  
  5778 00002401 8B4604                   mov ax, [bp+4]
  5779 00002404 83F801                   cmp ax, 1
  5780 00002407 0F853400                 jne .doassign301
  5781 0000240B 68[9125]                 push doassign_0
  5782 0000240E E8CEDF                   call prs
  5783 00002411 83C402                   add  sp, 2
  5784 00002414 FF7606                   push word [bp+6]
  5785 00002417 E8C2EB                   call v
  5786 0000241A 83C402                   add  sp, 2
  5787                                  
  5788                                  ;-744     if (widthi == 2) prs("\n mov  [bx], ax");
  5789                                  
  5790 0000241D A1[3300]                 mov ax, [widthi]
  5791 00002420 83F802                   cmp ax, 2
  5792 00002423 0F850C00                 jne .doassign302
  5793 00002427 68[9E25]                 push doassign_1
  5794 0000242A E8B2DF                   call prs
  5795 0000242D 83C402                   add  sp, 2
  5796                                  
  5797                                  ;-745     else  prs("\n mov  [bx], al"); return;}
  5798                                  
  5799 00002430 E90900                   jmp .doassign303
  5800                                  .doassign302:
  5801 00002433 68[AF25]                 push doassign_2
  5802 00002436 E8A6DF                   call prs
  5803 00002439 83C402                   add  sp, 2
  5804                                  .doassign303:
  5805 0000243C E95001                   jmp .retndoassign
  5806                                  
  5807                                  ;-746   if (mode==2) {prs("\n mov  ");printName(i); prs(", ax"); return;}
  5808                                  
  5809                                  .doassign301:
  5810 0000243F 8B4604                   mov ax, [bp+4]
  5811 00002442 83F802                   cmp ax, 2
  5812 00002445 0F851E00                 jne .doassign304
  5813 00002449 68[C025]                 push doassign_3
  5814 0000244C E890DF                   call prs
  5815 0000244F 83C402                   add  sp, 2
  5816 00002452 FF7606                   push word [bp+6]
  5817 00002455 E8A6E3                   call printName
  5818 00002458 83C402                   add  sp, 2
  5819 0000245B 68[C925]                 push doassign_4
  5820 0000245E E87EDF                   call prs
  5821 00002461 83C402                   add  sp, 2
  5822 00002464 E92801                   jmp .retndoassign
  5823                                  
  5824                                  ;-747   if (ixarr) {  prs("\n mov bx, ");
  5825                                  
  5826                                  .doassign304:
  5827 00002467 8B4608                   mov ax, [bp+8]
  5828 0000246A 08C0                     or  al, al
  5829 0000246C 0F846E00                 je .doassign305
  5830 00002470 68[CE25]                 push doassign_5
  5831 00002473 E869DF                   call prs
  5832 00002476 83C402                   add  sp, 2
  5833                                  
  5834                                  ;-748     if(ixconst) prunsign1(ixarr); else v(ixarr);
  5835                                  
  5836 00002479 8B460A                   mov ax, [bp+10]
  5837 0000247C 08C0                     or  al, al
  5838 0000247E 0F840C00                 je .doassign306
  5839 00002482 FF7608                   push word [bp+8]
  5840 00002485 E8BAE0                   call prunsign1
  5841 00002488 83C402                   add  sp, 2
  5842 0000248B E90900                   jmp .doassign307
  5843                                  .doassign306:
  5844 0000248E FF7608                   push word [bp+8]
  5845 00002491 E848EB                   call v
  5846 00002494 83C402                   add  sp, 2
  5847                                  
  5848                                  ;-749     if (wi==2) prs("\n shl bx, 1");
  5849                                  
  5850                                  .doassign307:
  5851 00002497 A1[3600]                 mov ax, [wi]
  5852 0000249A 83F802                   cmp ax, 2
  5853 0000249D 0F850900                 jne .doassign308
  5854 000024A1 68[DA25]                 push doassign_6
  5855 000024A4 E838DF                   call prs
  5856 000024A7 83C402                   add  sp, 2
  5857                                  
  5858                                  ;-750     prs("\n mov ["); printName(i);
  5859                                  
  5860                                  .doassign308:
  5861 000024AA 68[E725]                 push doassign_7
  5862 000024AD E82FDF                   call prs
  5863 000024B0 83C402                   add  sp, 2
  5864 000024B3 FF7606                   push word [bp+6]
  5865 000024B6 E845E3                   call printName
  5866 000024B9 83C402                   add  sp, 2
  5867                                  
  5868                                  ;-751     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }
  5869                                  
  5870 000024BC A1[3600]                 mov ax, [wi]
  5871 000024BF 83F802                   cmp ax, 2
  5872 000024C2 0F850C00                 jne .doassign309
  5873 000024C6 68[F025]                 push doassign_8
  5874 000024C9 E813DF                   call prs
  5875 000024CC 83C402                   add  sp, 2
  5876 000024CF E90900                   jmp .doassign310
  5877                                  .doassign309:
  5878 000024D2 68[F925]                 push doassign_9
  5879 000024D5 E807DF                   call prs
  5880 000024D8 83C402                   add  sp, 2
  5881                                  .doassign310:
  5882 000024DB E9B100                   jmp .retndoassign
  5883                                  
  5884                                  ;-752   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");
  5885                                  
  5886                                  .doassign305:
  5887 000024DE A1[3600]                 mov ax, [wi]
  5888 000024E1 83F801                   cmp ax, 1
  5889 000024E4 0F853100                 jne .doassign311
  5890 000024E8 68[0226]                 push doassign_10
  5891 000024EB E8F1DE                   call prs
  5892 000024EE 83C402                   add  sp, 2
  5893 000024F1 8B4606                   mov ax, [bp+6]
  5894 000024F4 3DC800                   cmp ax, 200
  5895 000024F7 0F8D0900                 jge .doassign312
  5896 000024FB 68[0A26]                 push doassign_11
  5897 000024FE E8DEDE                   call prs
  5898 00002501 83C402                   add  sp, 2
  5899                                  
  5900                                  ;-753     } v(i); prs(", al"); return; }
  5901                                  
  5902                                  .doassign312:
  5903 00002504 FF7606                   push word [bp+6]
  5904 00002507 E8D2EA                   call v
  5905 0000250A 83C402                   add  sp, 2
  5906 0000250D 68[1026]                 push doassign_12
  5907 00002510 E8CCDE                   call prs
  5908 00002513 83C402                   add  sp, 2
  5909 00002516 E97600                   jmp .retndoassign
  5910                                  
  5911                                  ;-754   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");
  5912                                  
  5913                                  .doassign311:
  5914 00002519 A1[3600]                 mov ax, [wi]
  5915 0000251C 83F802                   cmp ax, 2
  5916 0000251F 0F853100                 jne .doassign313
  5917 00002523 68[1526]                 push doassign_13
  5918 00002526 E8B6DE                   call prs
  5919 00002529 83C402                   add  sp, 2
  5920 0000252C 8B4606                   mov ax, [bp+6]
  5921 0000252F 3DC800                   cmp ax, 200
  5922 00002532 0F8D0900                 jge .doassign314
  5923 00002536 68[1D26]                 push doassign_14
  5924 00002539 E8A3DE                   call prs
  5925 0000253C 83C402                   add  sp, 2
  5926                                  
  5927                                  ;-755     } v(i); prs(", ax"); return; }
  5928                                  
  5929                                  .doassign314:
  5930 0000253F FF7606                   push word [bp+6]
  5931 00002542 E897EA                   call v
  5932 00002545 83C402                   add  sp, 2
  5933 00002548 68[2326]                 push doassign_15
  5934 0000254B E891DE                   call prs
  5935 0000254E 83C402                   add  sp, 2
  5936 00002551 E93B00                   jmp .retndoassign
  5937                                  
  5938                                  ;-756   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");
  5939                                  
  5940                                  .doassign313:
  5941 00002554 A1[3600]                 mov ax, [wi]
  5942 00002557 83F804                   cmp ax, 4
  5943 0000255A 0F853100                 jne .doassign315
  5944 0000255E 68[2826]                 push doassign_16
  5945 00002561 E87BDE                   call prs
  5946 00002564 83C402                   add  sp, 2
  5947 00002567 8B4606                   mov ax, [bp+6]
  5948 0000256A 3DC800                   cmp ax, 200
  5949 0000256D 0F8D0900                 jge .doassign316
  5950 00002571 68[3026]                 push doassign_17
  5951 00002574 E868DE                   call prs
  5952 00002577 83C402                   add  sp, 2
  5953                                  
  5954                                  ;-757     } v(i); prs(", eax"); return; }
  5955                                  
  5956                                  .doassign316:
  5957 0000257A FF7606                   push word [bp+6]
  5958 0000257D E85CEA                   call v
  5959 00002580 83C402                   add  sp, 2
  5960 00002583 68[3726]                 push doassign_18
  5961 00002586 E856DE                   call prs
  5962 00002589 83C402                   add  sp, 2
  5963 0000258C E90000                   jmp .retndoassign
  5964                                  
  5965                                  ;-758 }
  5966                                  
  5967                                  .doassign315:
  5968                                  
  5969                                  ;-759 int domul(int ids) {
  5970                                  
  5971 0000258F C9                       .retndoassign: LEAVE
  5972 00002590 C3                       ret
  5973 00002591 5C6E206D6F76202062-     doassign_0 db "\n mov  bx, ",0
  5974 0000259A 782C2000           
  5975 0000259E 5C6E206D6F7620205B-     doassign_1 db "\n mov  [bx], ax",0
  5976 000025A7 62785D2C20617800   
  5977 000025AF 5C6E206D6F7620205B-     doassign_2 db "\n mov  [bx], al",0
  5978 000025B8 62785D2C20616C00   
  5979 000025C0 5C6E206D6F76202000      doassign_3 db "\n mov  ",0
  5980 000025C9 2C20617800              doassign_4 db ", ax",0
  5981 000025CE 5C6E206D6F76206278-     doassign_5 db "\n mov bx, ",0
  5982 000025D7 2C2000             
  5983 000025DA 5C6E2073686C206278-     doassign_6 db "\n shl bx, 1",0
  5984 000025E3 2C203100           
  5985 000025E7 5C6E206D6F76205B00      doassign_7 db "\n mov [",0
  5986 000025F0 2B62785D2C20617800      doassign_8 db "+bx], ax",0
  5987 000025F9 2B62785D2C20616C00      doassign_9 db "+bx], al",0
  5988 00002602 5C6E206D6F762000        doassign_10 db "\n mov ",0
  5989 0000260A 627974652000            doassign_11 db "byte ",0
  5990 00002610 2C20616C00              doassign_12 db ", al",0
  5991 00002615 5C6E206D6F762000        doassign_13 db "\n mov ",0
  5992 0000261D 776F72642000            doassign_14 db "word ",0
  5993 00002623 2C20617800              doassign_15 db ", ax",0
  5994 00002628 5C6E206D6F762000        doassign_16 db "\n mov ",0
  5995 00002630 64776F72642000          doassign_17 db "dword ",0
  5996 00002637 2C2065617800            doassign_18 db ", eax",0
  5997                                  ENDP
  5998                                  
  5999                                  domul: PROC
  6000                                  
  6001                                  ;-760   if (ids) rterm("imul"); else {
  6002                                  ;
  6003 0000263D C8000000                 ENTER  0,0
  6004 00002641 8B4604                   mov ax, [bp+4]
  6005 00002644 08C0                     or  al, al
  6006 00002646 0F840C00                 je .domul317
  6007 0000264A 68[8F26]                 push domul_0
  6008 0000264D E899F9                   call rterm
  6009 00002650 83C402                   add  sp, 2
  6010 00002653 E93700                   jmp .domul318
  6011                                  .domul317:
  6012                                  
  6013                                  ;-761   if (istoken(T_CONST)) {
  6014                                  
  6015 00002656 680101                   push 257
  6016 00002659 E8F6E8                   call istoken
  6017 0000265C 83C402                   add  sp, 2
  6018 0000265F 08C0                     or  al, al
  6019 00002661 0F841F00                 je .domul319
  6020                                  
  6021                                  ;-762     prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx");
  6022                                  
  6023 00002665 68[9426]                 push domul_1
  6024 00002668 E874DD                   call prs
  6025 0000266B 83C402                   add  sp, 2
  6026 0000266E FF36[2B00]               push word [lexval]
  6027 00002672 E8CDDE                   call prunsign1
  6028 00002675 83C402                   add  sp, 2
  6029 00002678 68[A026]                 push domul_2
  6030 0000267B E861DD                   call prs
  6031 0000267E 83C402                   add  sp, 2
  6032                                  
  6033                                  ;-763     }
  6034                                  
  6035                                  
  6036                                  ;-764   else error1("with MUL only const number as multiplicator allowed"); } }
  6037                                  
  6038 00002681 E90900                   jmp .domul320
  6039                                  .domul319:
  6040 00002684 68[AA26]                 push domul_3
  6041 00002687 E876DF                   call error1
  6042 0000268A 83C402                   add  sp, 2
  6043                                  .domul320:
  6044                                  .domul318:
  6045                                  
  6046                                  ;-765 int doidiv(int ids) { int mode; int id1;
  6047 0000268D C9                       LEAVE
  6048 0000268E C3                       ret
  6049 0000268F 696D756C00              domul_0 db "imul",0
  6050 00002694 5C6E206D6F76206278-     domul_1 db "\n mov bx, ",0
  6051 0000269D 2C2000             
  6052 000026A0 5C6E206D756C206278-     domul_2 db "\n mul bx",0
  6053 000026A9 00                 
  6054 000026AA 77697468204D554C20-     domul_3 db "with MUL only const number as multiplicator allowed",0
  6055 000026B3 6F6E6C7920636F6E73-
  6056 000026BC 74206E756D62657220-
  6057 000026C5 6173206D756C746970-
  6058 000026CE 6C696361746F722061-
  6059 000026D7 6C6C6F77656400     
  6060                                  ENDP
  6061                                  
  6062                                  doidiv: PROC
  6063                                  
  6064                                  ;-766   if (istoken(T_CONST)) {
  6065                                  ;
  6066 000026DE C8040000                 ENTER  4,0
  6067 000026E2 680101                   push 257
  6068 000026E5 E86AE8                   call istoken
  6069 000026E8 83C402                   add  sp, 2
  6070 000026EB 08C0                     or  al, al
  6071 000026ED 0F843400                 je .doidiv321
  6072                                  
  6073                                  ;-767     prs("\n mov bx, "); prunsign1(lexval);
  6074                                  
  6075 000026F1 68[A327]                 push doidiv_0
  6076 000026F4 E8E8DC                   call prs
  6077 000026F7 83C402                   add  sp, 2
  6078 000026FA FF36[2B00]               push word [lexval]
  6079 000026FE E841DE                   call prunsign1
  6080 00002701 83C402                   add  sp, 2
  6081                                  
  6082                                  ;-768     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  6083                                  
  6084 00002704 8B4604                   mov ax, [bp+4]
  6085 00002707 08C0                     or  al, al
  6086 00002709 0F840C00                 je .doidiv322
  6087 0000270D 68[AF27]                 push doidiv_1
  6088 00002710 E8CCDC                   call prs
  6089 00002713 83C402                   add  sp, 2
  6090 00002716 E90900                   jmp .doidiv323
  6091                                  .doidiv322:
  6092 00002719 68[C027]                 push doidiv_2
  6093 0000271C E8C0DC                   call prs
  6094 0000271F 83C402                   add  sp, 2
  6095                                  .doidiv323:
  6096                                  
  6097                                  ;-769   else {
  6098                                  
  6099 00002722 E97C00                   jmp .doidiv324
  6100                                  .doidiv321:
  6101                                  
  6102                                  ;-770     mode=typeName(); id1=searchname();
  6103                                  
  6104 00002725 E834EA                   call typeName
  6105 00002728 8946FE                   mov [bp-2], ax
  6106 0000272B E8BBE9                   call searchname
  6107 0000272E 8946FC                   mov [bp-4], ax
  6108                                  
  6109                                  ;-771     if (mode) error1("only const number or int as divisor allowed");
  6110                                  
  6111 00002731 8B46FE                   mov ax, [bp-2]
  6112 00002734 08C0                     or  al, al
  6113 00002736 0F840900                 je .doidiv325
  6114 0000273A 68[D627]                 push doidiv_3
  6115 0000273D E8C0DE                   call error1
  6116 00002740 83C402                   add  sp, 2
  6117                                  
  6118                                  ;-772     gettypes(id1);
  6119                                  
  6120                                  .doidiv325:
  6121 00002743 FF76FC                   push word [bp-4]
  6122 00002746 E8ECEA                   call gettypes
  6123 00002749 83C402                   add  sp, 2
  6124                                  
  6125                                  ;-773     if (typei) error1("only int as simple var divisor allowed");
  6126                                  
  6127 0000274C A1[2D00]                 mov ax, [typei]
  6128 0000274F 08C0                     or  al, al
  6129 00002751 0F840900                 je .doidiv326
  6130 00002755 68[0228]                 push doidiv_4
  6131 00002758 E8A5DE                   call error1
  6132 0000275B 83C402                   add  sp, 2
  6133                                  
  6134                                  ;-774     if (wi!=2) error1("only int, no byte as divisor allowed");
  6135                                  
  6136                                  .doidiv326:
  6137 0000275E A1[3600]                 mov ax, [wi]
  6138 00002761 83F802                   cmp ax, 2
  6139 00002764 0F840900                 je  .doidiv327
  6140 00002768 68[2928]                 push doidiv_5
  6141 0000276B E892DE                   call error1
  6142 0000276E 83C402                   add  sp, 2
  6143                                  
  6144                                  ;-775     prs("\n mov bx, "); v(id1);
  6145                                  
  6146                                  .doidiv327:
  6147 00002771 68[4E28]                 push doidiv_6
  6148 00002774 E868DC                   call prs
  6149 00002777 83C402                   add  sp, 2
  6150 0000277A FF76FC                   push word [bp-4]
  6151 0000277D E85CE8                   call v
  6152 00002780 83C402                   add  sp, 2
  6153                                  
  6154                                  ;-776     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  6155                                  
  6156 00002783 8B4604                   mov ax, [bp+4]
  6157 00002786 08C0                     or  al, al
  6158 00002788 0F840C00                 je .doidiv328
  6159 0000278C 68[5A28]                 push doidiv_7
  6160 0000278F E84DDC                   call prs
  6161 00002792 83C402                   add  sp, 2
  6162 00002795 E90900                   jmp .doidiv329
  6163                                  .doidiv328:
  6164 00002798 68[6B28]                 push doidiv_8
  6165 0000279B E841DC                   call prs
  6166 0000279E 83C402                   add  sp, 2
  6167                                  .doidiv329:
  6168                                  
  6169                                  ;-777 }
  6170                                  
  6171                                  .doidiv324:
  6172                                  
  6173                                  ;-778 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
  6174 000027A1 C9                       LEAVE
  6175 000027A2 C3                       ret
  6176 000027A3 5C6E206D6F76206278-     doidiv_0 db "\n mov bx, ",0
  6177 000027AC 2C2000             
  6178 000027AF 5C6E206377645C6E20-     doidiv_1 db "\n cwd\n idiv bx",0
  6179 000027B8 6964697620627800   
  6180 000027C0 5C6E206D6F76206478-     doidiv_2 db "\n mov dx, 0\n div bx",0
  6181 000027C9 2C20305C6E20646976-
  6182 000027D2 20627800           
  6183 000027D6 6F6E6C7920636F6E73-     doidiv_3 db "only const number or int as divisor allowed",0
  6184 000027DF 74206E756D62657220-
  6185 000027E8 6F7220696E74206173-
  6186 000027F1 2064697669736F7220-
  6187 000027FA 616C6C6F77656400   
  6188 00002802 6F6E6C7920696E7420-     doidiv_4 db "only int as simple var divisor allowed",0
  6189 0000280B 61732073696D706C65-
  6190 00002814 207661722064697669-
  6191 0000281D 736F7220616C6C6F77-
  6192 00002826 656400             
  6193 00002829 6F6E6C7920696E742C-     doidiv_5 db "only int, no byte as divisor allowed",0
  6194 00002832 206E6F206279746520-
  6195 0000283B 61732064697669736F-
  6196 00002844 7220616C6C6F776564-
  6197 0000284D 00                 
  6198 0000284E 5C6E206D6F76206278-     doidiv_6 db "\n mov bx, ",0
  6199 00002857 2C2000             
  6200 0000285A 5C6E206377645C6E20-     doidiv_7 db "\n cwd\n idiv bx",0
  6201 00002863 6964697620627800   
  6202 0000286B 5C6E206D6F76206478-     doidiv_8 db "\n mov dx, 0\n div bx",0
  6203 00002874 2C20305C6E20646976-
  6204 0000287D 20627800           
  6205                                  ENDP
  6206                                  
  6207                                  domod: PROC;
  6208 00002881 C8000000                 ENTER  0,0
  6209 00002885 FF7604                   push word [bp+4]
  6210 00002888 E853FE                   call doidiv
  6211 0000288B 83C402                   add  sp, 2
  6212 0000288E 68[9928]                 push domod_0
  6213 00002891 E84BDB                   call prs
  6214 00002894 83C402                   add  sp, 2
  6215                                  
  6216                                  ;-779 
  6217                                  
  6218                                  
  6219                                  ;-780 
  6220                                  
  6221                                  
  6222                                  ;-781 int docalltype[10]; int docallvalue[10];
  6223 00002897 C9                       LEAVE
  6224 00002898 C3                       ret
  6225 00002899 5C6E206D6F76206178-     domod_0 db "\n mov ax, dx",0
  6226 000028A2 2C20647800         
  6227                                  ENDP
  6228                                  section .bss
  6229                                  absolute 42409
  6230 0000A5A9 <res 00000014>          docalltype resw 10
  6231                                  section .text
  6232                                  section .bss
  6233                                  absolute 42429
  6234 0000A5BD <res 00000014>          docallvalue resw 10
  6235                                  section .text
  6236                                  
  6237                                  ;-782 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register
  6238                                  
  6239                                  section .bss
  6240                                  absolute 42449
  6241 0000A5D1 <res 00000011>          procname resb 17
  6242                                  section .text
  6243                                  
  6244                                  ;-783 int docall1() {int i; int narg; int t0; int n0;  int sz32;
  6245                                  
  6246                                  
  6247                                  docall1: PROC
  6248                                  
  6249                                  ;-784   narg=0;  sz32=0;
  6250                                  ;
  6251 000028A7 C80A0000                 ENTER  10,0
  6252 000028AB B80000                   mov ax, 0
  6253 000028AE 8946FC                   mov [bp-4], ax
  6254 000028B1 B80000                   mov ax, 0
  6255 000028B4 8946F6                   mov [bp-10], ax
  6256                                  
  6257                                  ;-785   checknamelen();
  6258                                  
  6259 000028B7 E855E7                   call checknamelen
  6260                                  
  6261                                  ;-786   strcpy(&procname, symbol);
  6262                                  
  6263 000028BA 8D06A36D                 lea  ax, [symbol]
  6264 000028BE 50                       push ax
  6265 000028BF 8D06D1A5                 lea  ax, [procname]
  6266 000028C3 50                       push ax
  6267 000028C4 E862D9                   call strcpy
  6268 000028C7 83C404                   add  sp, 4
  6269                                  
  6270                                  ;-787   expect('(');
  6271                                  
  6272 000028CA 6A28                     push 40
  6273 000028CC E8A5E6                   call expect
  6274 000028CF 83C402                   add  sp, 2
  6275                                  
  6276                                  ;-788 	if (istoken(')') ==0 ) {
  6277                                  
  6278 000028D2 6A29                     push 41
  6279 000028D4 E87BE6                   call istoken
  6280 000028D7 83C402                   add  sp, 2
  6281 000028DA 83F800                   cmp ax, 0
  6282 000028DD 0F857802                 jne .docall1330
  6283                                  
  6284                                  ;-789 	  do { narg++;
  6285                                  
  6286                                  .docall1331:
  6287 000028E1 FF46FC                   inc  word[bp-4]
  6288                                  
  6289                                  ;-790 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;
  6290                                  
  6291 000028E4 8B46FC                   mov ax, [bp-4]
  6292 000028E7 83F809                   cmp ax, 9
  6293 000028EA 0F8E0900                 jle .docall1332
  6294 000028EE 68[9D2B]                 push docall1_0
  6295 000028F1 E80CDD                   call error1
  6296 000028F4 83C402                   add  sp, 2
  6297                                  .docall1332:
  6298 000028F7 B80000                   mov ax, 0
  6299 000028FA 8946FA                   mov [bp-6], ax
  6300                                  
  6301                                  ;-791       if(istoken(T_CONST)) {t0=1; n0=lexval; }
  6302                                  
  6303 000028FD 680101                   push 257
  6304 00002900 E84FE6                   call istoken
  6305 00002903 83C402                   add  sp, 2
  6306 00002906 08C0                     or  al, al
  6307 00002908 0F840C00                 je .docall1333
  6308 0000290C B80100                   mov ax, 1
  6309 0000290F 8946FA                   mov [bp-6], ax
  6310 00002912 A1[2B00]                 mov ax, [lexval]
  6311 00002915 8946F8                   mov [bp-8], ax
  6312                                  
  6313                                  ;-792       if(istoken(T_STRING)){t0=2; n0=nconst;
  6314                                  
  6315                                  .docall1333:
  6316 00002918 680201                   push 258
  6317 0000291B E834E6                   call istoken
  6318 0000291E 83C402                   add  sp, 2
  6319 00002921 08C0                     or  al, al
  6320 00002923 0F846300                 je .docall1334
  6321 00002927 B80200                   mov ax, 2
  6322 0000292A 8946FA                   mov [bp-6], ax
  6323 0000292D A1[2500]                 mov ax, [nconst]
  6324 00002930 8946F8                   mov [bp-8], ax
  6325                                  
  6326                                  ;-793         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");
  6327                                  
  6328 00002933 68[AF2B]                 push docall1_1
  6329 00002936 E81FDA                   call eprs
  6330 00002939 83C402                   add  sp, 2
  6331 0000293C 8D06236E                 lea  ax, [fname]
  6332 00002940 50                       push ax
  6333 00002941 E814DA                   call eprs
  6334 00002944 83C402                   add  sp, 2
  6335 00002947 6A5F                     push 95
  6336 00002949 E8F9D9                   call eprc
  6337 0000294C 83C402                   add  sp, 2
  6338 0000294F FF36[2500]               push word [nconst]
  6339 00002953 E82BDB                   call eprnum
  6340 00002956 83C402                   add  sp, 2
  6341 00002959 68[B22B]                 push docall1_2
  6342 0000295C E8F9D9                   call eprs
  6343 0000295F 83C402                   add  sp, 2
  6344                                  
  6345                                  ;-794         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }
  6346                                  
  6347 00002962 6A22                     push 34
  6348 00002964 E8DED9                   call eprc
  6349 00002967 83C402                   add  sp, 2
  6350 0000296A 8D06A36D                 lea  ax, [symbol]
  6351 0000296E 50                       push ax
  6352 0000296F E8E6D9                   call eprs
  6353 00002972 83C402                   add  sp, 2
  6354 00002975 6A22                     push 34
  6355 00002977 E8CBD9                   call eprc
  6356 0000297A 83C402                   add  sp, 2
  6357 0000297D 68[B72B]                 push docall1_3
  6358 00002980 E8D5D9                   call eprs
  6359 00002983 83C402                   add  sp, 2
  6360 00002986 FF06[2500]               inc  word[nconst]
  6361                                  
  6362                                  ;-795       if(istoken('&'))     {t0=3; name1(); n0=searchname();}
  6363                                  
  6364                                  .docall1334:
  6365 0000298A 6A26                     push 38
  6366 0000298C E8C3E5                   call istoken
  6367 0000298F 83C402                   add  sp, 2
  6368 00002992 08C0                     or  al, al
  6369 00002994 0F840F00                 je .docall1335
  6370 00002998 B80300                   mov ax, 3
  6371 0000299B 8946FA                   mov [bp-6], ax
  6372 0000299E E893E7                   call name1
  6373 000029A1 E845E7                   call searchname
  6374 000029A4 8946F8                   mov [bp-8], ax
  6375                                  
  6376                                  ;-796       if(istoken(T_NAME))  { n0=checkreg();
  6377                                  
  6378                                  .docall1335:
  6379 000029A7 680001                   push 256
  6380 000029AA E8A5E5                   call istoken
  6381 000029AD 83C402                   add  sp, 2
  6382 000029B0 08C0                     or  al, al
  6383 000029B2 0F844800                 je .docall1336
  6384 000029B6 E85EEC                   call checkreg
  6385 000029B9 8946F8                   mov [bp-8], ax
  6386                                  
  6387                                  ;-797         if (n0) t0=5;
  6388                                  
  6389 000029BC 8B46F8                   mov ax, [bp-8]
  6390 000029BF 08C0                     or  al, al
  6391 000029C1 0F840900                 je .docall1337
  6392 000029C5 B80500                   mov ax, 5
  6393 000029C8 8946FA                   mov [bp-6], ax
  6394                                  
  6395                                  ;-798         else {t0=4; n0=searchname();
  6396                                  
  6397 000029CB E93000                   jmp .docall1338
  6398                                  .docall1337:
  6399 000029CE B80400                   mov ax, 4
  6400 000029D1 8946FA                   mov [bp-6], ax
  6401 000029D4 E812E7                   call searchname
  6402 000029D7 8946F8                   mov [bp-8], ax
  6403                                  
  6404                                  ;-799           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }
  6405                                  
  6406 000029DA B8EC6E                   mov ax, GType
  6407 000029DD A3[4400]                 mov word [p1], ax
  6408 000029E0 A1[4400]                 mov ax, [p1]
  6409 000029E3 0346F8                   add ax, [bp-8]
  6410 000029E6 A3[4400]                 mov word [p1], ax
  6411 000029E9 8B1E[4400]               mov bx, [p1]
  6412 000029ED 8A07                     mov al, [bx]
  6413 000029EF B400                     mov ah, 0
  6414 000029F1 83F826                   cmp ax, 38
  6415 000029F4 0F850600                 jne .docall1339
  6416 000029F8 B80300                   mov ax, 3
  6417 000029FB 8946FA                   mov [bp-6], ax
  6418                                  .docall1339:
  6419                                  .docall1338:
  6420                                  
  6421                                  ;-800       if (t0==0) error1("parameter not recognized (no * allowed)");
  6422                                  
  6423                                  .docall1336:
  6424 000029FE 8B46FA                   mov ax, [bp-6]
  6425 00002A01 83F800                   cmp ax, 0
  6426 00002A04 0F850900                 jne .docall1340
  6427 00002A08 68[BA2B]                 push docall1_4
  6428 00002A0B E8F2DB                   call error1
  6429 00002A0E 83C402                   add  sp, 2
  6430                                  
  6431                                  ;-801       docalltype [narg] = t0;
  6432                                  
  6433                                  .docall1340:
  6434 00002A11 8B46FA                   mov ax, [bp-6]
  6435 00002A14 8B5EFC                   mov bx, [bp-4]
  6436 00002A17 D1E3                     shl bx, 1
  6437 00002A19 8987A9A5                 mov [docalltype+bx], ax
  6438                                  
  6439                                  ;-802       docallvalue[narg] = n0;
  6440                                  
  6441 00002A1D 8B46F8                   mov ax, [bp-8]
  6442 00002A20 8B5EFC                   mov bx, [bp-4]
  6443 00002A23 D1E3                     shl bx, 1
  6444 00002A25 8987BDA5                 mov [docallvalue+bx], ax
  6445                                  
  6446                                  ;-803     } while (istoken(','));
  6447                                  
  6448 00002A29 6A2C                     push 44
  6449 00002A2B E824E5                   call istoken
  6450 00002A2E 83C402                   add  sp, 2
  6451 00002A31 08C0                     or  al, al
  6452 00002A33 0F840300                 je .docall1341
  6453 00002A37 E9A7FE                   jmp .docall1331
  6454                                  .docall1341:
  6455                                  
  6456                                  ;-804 
  6457                                  
  6458                                  
  6459                                  ;-805   	expect(')');  i=narg;
  6460                                  
  6461 00002A3A 6A29                     push 41
  6462 00002A3C E835E5                   call expect
  6463 00002A3F 83C402                   add  sp, 2
  6464 00002A42 8B46FC                   mov ax, [bp-4]
  6465 00002A45 8946FE                   mov [bp-2], ax
  6466                                  
  6467                                  ;-806     do {
  6468                                  
  6469                                  .docall1342:
  6470                                  
  6471                                  ;-807       t0 = docalltype [i];
  6472                                  
  6473 00002A48 8B5EFE                   mov bx, [bp-2]
  6474 00002A4B D1E3                     shl bx, 1
  6475 00002A4D 8B87A9A5                 mov ax, [docalltype + bx]
  6476 00002A51 8946FA                   mov [bp-6], ax
  6477                                  
  6478                                  ;-808       n0 = docallvalue[i];
  6479                                  
  6480 00002A54 8B5EFE                   mov bx, [bp-2]
  6481 00002A57 D1E3                     shl bx, 1
  6482 00002A59 8B87BDA5                 mov ax, [docallvalue + bx]
  6483 00002A5D 8946F8                   mov [bp-8], ax
  6484                                  
  6485                                  ;-809       if(t0==1){ prs("\n push "); prunsign1(n0);}
  6486                                  
  6487 00002A60 8B46FA                   mov ax, [bp-6]
  6488 00002A63 83F801                   cmp ax, 1
  6489 00002A66 0F851200                 jne .docall1343
  6490 00002A6A 68[E22B]                 push docall1_5
  6491 00002A6D E86FD9                   call prs
  6492 00002A70 83C402                   add  sp, 2
  6493 00002A73 FF76F8                   push word [bp-8]
  6494 00002A76 E8C9DA                   call prunsign1
  6495 00002A79 83C402                   add  sp, 2
  6496                                  
  6497                                  ;-810       if(t0==2){ prs("\n push ");
  6498                                  
  6499                                  .docall1343:
  6500 00002A7C 8B46FA                   mov ax, [bp-6]
  6501 00002A7F 83F802                   cmp ax, 2
  6502 00002A82 0F852500                 jne .docall1344
  6503 00002A86 68[EB2B]                 push docall1_6
  6504 00002A89 E853D9                   call prs
  6505 00002A8C 83C402                   add  sp, 2
  6506                                  
  6507                                  ;-811         prs(fname);prc(95);prunsign1(n0);}
  6508                                  
  6509 00002A8F 8D06236E                 lea  ax, [fname]
  6510 00002A93 50                       push ax
  6511 00002A94 E848D9                   call prs
  6512 00002A97 83C402                   add  sp, 2
  6513 00002A9A 6A5F                     push 95
  6514 00002A9C E8E7D8                   call prc
  6515 00002A9F 83C402                   add  sp, 2
  6516 00002AA2 FF76F8                   push word [bp-8]
  6517 00002AA5 E89ADA                   call prunsign1
  6518 00002AA8 83C402                   add  sp, 2
  6519                                  
  6520                                  ;-812       if(t0==3){ prs("\n lea  ax, ");   v(n0);
  6521                                  
  6522                                  .docall1344:
  6523 00002AAB 8B46FA                   mov ax, [bp-6]
  6524 00002AAE 83F803                   cmp ax, 3
  6525 00002AB1 0F851B00                 jne .docall1345
  6526 00002AB5 68[F42B]                 push docall1_7
  6527 00002AB8 E824D9                   call prs
  6528 00002ABB 83C402                   add  sp, 2
  6529 00002ABE FF76F8                   push word [bp-8]
  6530 00002AC1 E818E5                   call v
  6531 00002AC4 83C402                   add  sp, 2
  6532                                  
  6533                                  ;-813         prs("\n push ax");}
  6534                                  
  6535 00002AC7 68[012C]                 push docall1_8
  6536 00002ACA E812D9                   call prs
  6537 00002ACD 83C402                   add  sp, 2
  6538                                  
  6539                                  ;-814       if(t0==4){ gettypes(n0);
  6540                                  
  6541                                  .docall1345:
  6542 00002AD0 8B46FA                   mov ax, [bp-6]
  6543 00002AD3 83F804                   cmp ax, 4
  6544 00002AD6 0F854300                 jne .docall1346
  6545 00002ADA FF76F8                   push word [bp-8]
  6546 00002ADD E855E7                   call gettypes
  6547 00002AE0 83C402                   add  sp, 2
  6548                                  
  6549                                  ;-815         if(wi==2) { prs("\n push word "); v(n0);}
  6550                                  
  6551 00002AE3 A1[3600]                 mov ax, [wi]
  6552 00002AE6 83F802                   cmp ax, 2
  6553 00002AE9 0F851500                 jne .docall1347
  6554 00002AED 68[0C2C]                 push docall1_9
  6555 00002AF0 E8ECD8                   call prs
  6556 00002AF3 83C402                   add  sp, 2
  6557 00002AF6 FF76F8                   push word [bp-8]
  6558 00002AF9 E8E0E4                   call v
  6559 00002AFC 83C402                   add  sp, 2
  6560                                  
  6561                                  ;-816         else { prs("\n mov al, byte ");   v(n0);
  6562                                  
  6563 00002AFF E91B00                   jmp .docall1348
  6564                                  .docall1347:
  6565 00002B02 68[1A2C]                 push docall1_10
  6566 00002B05 E8D7D8                   call prs
  6567 00002B08 83C402                   add  sp, 2
  6568 00002B0B FF76F8                   push word [bp-8]
  6569 00002B0E E8CBE4                   call v
  6570 00002B11 83C402                   add  sp, 2
  6571                                  
  6572                                  ;-817         prs("\n mov ah, 0\n push ax"); } }
  6573                                  
  6574 00002B14 68[2B2C]                 push docall1_11
  6575 00002B17 E8C5D8                   call prs
  6576 00002B1A 83C402                   add  sp, 2
  6577                                  .docall1348:
  6578                                  
  6579                                  ;-818       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }
  6580                                  
  6581                                  .docall1346:
  6582 00002B1D 8B46FA                   mov ax, [bp-6]
  6583 00002B20 83F805                   cmp ax, 5
  6584 00002B23 0F852200                 jne .docall1349
  6585 00002B27 68[422C]                 push docall1_12
  6586 00002B2A E8B2D8                   call prs
  6587 00002B2D 83C402                   add  sp, 2
  6588 00002B30 FF76F8                   push word [bp-8]
  6589 00002B33 E8EFEE                   call printreg
  6590 00002B36 83C402                   add  sp, 2
  6591 00002B39 8B46F8                   mov ax, [bp-8]
  6592 00002B3C 83F82F                   cmp ax, 47 ;unsigned : 1
  6593 00002B3F 0F8C0600                 jl  .docall1350
  6594 00002B43 8B46F6                   mov ax, [bp-10]
  6595 00002B46 83C002                   add ax, 2
  6596                                  .docall1350:
  6597                                  
  6598                                  ;-819    i--; } while (i > 0);  }
  6599                                  
  6600                                  .docall1349:
  6601 00002B49 FF4EFE                   dec  word[bp-2]
  6602 00002B4C 8B46FE                   mov ax, [bp-2]
  6603 00002B4F 83F800                   cmp ax, 0
  6604 00002B52 0F8E0300                 jle .docall1351
  6605 00002B56 E9EFFE                   jmp .docall1342
  6606                                  .docall1351:
  6607                                  
  6608                                  ;-820 	 prs("\n call "); prs(&procname);
  6609                                  
  6610                                  .docall1330:
  6611 00002B59 68[4B2C]                 push docall1_13
  6612 00002B5C E880D8                   call prs
  6613 00002B5F 83C402                   add  sp, 2
  6614 00002B62 8D06D1A5                 lea  ax, [procname]
  6615 00002B66 50                       push ax
  6616 00002B67 E875D8                   call prs
  6617 00002B6A 83C402                   add  sp, 2
  6618                                  
  6619                                  ;-821 	 if (narg>0) {prs("\n add  sp, ");
  6620                                  
  6621 00002B6D 8B46FC                   mov ax, [bp-4]
  6622 00002B70 83F800                   cmp ax, 0
  6623 00002B73 0F8E2400                 jle .docall1352
  6624 00002B77 68[542C]                 push docall1_14
  6625 00002B7A E862D8                   call prs
  6626 00002B7D 83C402                   add  sp, 2
  6627                                  
  6628                                  ;-822      narg=narg+narg; narg=narg+sz32; prunsign1(narg); }
  6629                                  
  6630 00002B80 8B46FC                   mov ax, [bp-4]
  6631 00002B83 0346FC                   add ax, [bp-4]
  6632 00002B86 8946FC                   mov [bp-4], ax
  6633 00002B89 8B46FC                   mov ax, [bp-4]
  6634 00002B8C 0346F6                   add ax, [bp-10]
  6635 00002B8F 8946FC                   mov [bp-4], ax
  6636 00002B92 FF76FC                   push word [bp-4]
  6637 00002B95 E8AAD9                   call prunsign1
  6638 00002B98 83C402                   add  sp, 2
  6639                                  
  6640                                  ;-823  }
  6641                                  
  6642                                  .docall1352:
  6643                                  
  6644                                  ;-824 
  6645                                  
  6646                                  
  6647                                  ;-825  int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
  6648 00002B9B C9                       LEAVE
  6649 00002B9C C3                       ret
  6650 00002B9D 4D61782E2039207061-     docall1_0 db "Max. 9 parameters",0
  6651 00002BA6 72616D657465727300 
  6652 00002BAF 5C6E00                  docall1_1 db "\n",0
  6653 00002BB2 2064622000              docall1_2 db " db ",0
  6654 00002BB7 2C3000                  docall1_3 db ",0",0
  6655 00002BBA 706172616D65746572-     docall1_4 db "parameter not recognized (no * allowed)",0
  6656 00002BC3 206E6F74207265636F-
  6657 00002BCC 676E697A656420286E-
  6658 00002BD5 6F202A20616C6C6F77-
  6659 00002BDE 65642900           
  6660 00002BE2 5C6E20707573682000      docall1_5 db "\n push ",0
  6661 00002BEB 5C6E20707573682000      docall1_6 db "\n push ",0
  6662 00002BF4 5C6E206C6561202061-     docall1_7 db "\n lea  ax, ",0
  6663 00002BFD 782C2000           
  6664 00002C01 5C6E20707573682061-     docall1_8 db "\n push ax",0
  6665 00002C0A 7800               
  6666 00002C0C 5C6E20707573682077-     docall1_9 db "\n push word ",0
  6667 00002C15 6F72642000         
  6668 00002C1A 5C6E206D6F7620616C-     docall1_10 db "\n mov al, byte ",0
  6669 00002C23 2C20627974652000   
  6670 00002C2B 5C6E206D6F76206168-     docall1_11 db "\n mov ah, 0\n push ax",0
  6671 00002C34 2C20305C6E20707573-
  6672 00002C3D 6820617800         
  6673 00002C42 5C6E20707573682000      docall1_12 db "\n push ",0
  6674 00002C4B 5C6E2063616C6C2000      docall1_13 db "\n call ",0
  6675 00002C54 5C6E20616464202073-     docall1_14 db "\n add  sp, ",0
  6676 00002C5D 702C2000           
  6677                                  ENDP
  6678 00002C61 0000                    evalue dw 0
  6679 00002C63 0A00                    exprtype dw 10
  6680                                  
  6681                                  ;-826  int expr(int isRight)
  6682                                  
  6683                                  
  6684                                  expr: PROC
  6685                                  
  6686                                  ;-827  { int mode; int id1;     int ixarr; int ixconst;
  6687                                  
  6688                                  
  6689                                  ;-828    int ids;  int isCONST; int i;     unsigned char *p;
  6690                                  
  6691                                  
  6692                                  ;-829    if (istoken(T_CONST)) { evalue=lexval;
  6693                                  ;
  6694 00002C65 C8100000                 ENTER  16,0
  6695 00002C69 680101                   push 257
  6696 00002C6C E8E3E2                   call istoken
  6697 00002C6F 83C402                   add  sp, 2
  6698 00002C72 08C0                     or  al, al
  6699 00002C74 0F841F00                 je .expr353
  6700 00002C78 A1[2B00]                 mov ax, [lexval]
  6701 00002C7B A3[612C]                 mov word [evalue], ax
  6702                                  
  6703                                  ;-830      prs("\n mov ax, "); prunsign1(lexval); return 4; }
  6704                                  
  6705 00002C7E 68[0530]                 push expr_0
  6706 00002C81 E85BD7                   call prs
  6707 00002C84 83C402                   add  sp, 2
  6708 00002C87 FF36[2B00]               push word [lexval]
  6709 00002C8B E8B4D8                   call prunsign1
  6710 00002C8E 83C402                   add  sp, 2
  6711 00002C91 B80400                   mov ax, 4
  6712 00002C94 E96C03                   jmp .retnexpr
  6713                                  
  6714                                  ;-831    mode=typeName(); /*0=V,1=*,2=&*/
  6715                                  
  6716                                  .expr353:
  6717 00002C97 E8C2E4                   call typeName
  6718 00002C9A 8946FE                   mov [bp-2], ax
  6719                                  
  6720                                  ;-832    ireg1=checkreg();
  6721                                  
  6722 00002C9D E877E9                   call checkreg
  6723 00002CA0 A3[4B00]                 mov word [ireg1], ax
  6724                                  
  6725                                  ;-833    if (ireg1) { doreg1(0); return; }
  6726                                  
  6727 00002CA3 A1[4B00]                 mov ax, [ireg1]
  6728 00002CA6 08C0                     or  al, al
  6729 00002CA8 0F840B00                 je .expr354
  6730 00002CAC 6A00                     push 0
  6731 00002CAE E8E0EE                   call doreg1
  6732 00002CB1 83C402                   add  sp, 2
  6733 00002CB4 E94C03                   jmp .retnexpr
  6734                                  
  6735                                  ;-834    if (token=='(')  {docall1(); goto e1; }
  6736                                  
  6737                                  .expr354:
  6738 00002CB7 A1[1E00]                 mov ax, [token]
  6739 00002CBA 83F828                   cmp ax, 40
  6740 00002CBD 0F850600                 jne .expr355
  6741 00002CC1 E8E3FB                   call docall1
  6742 00002CC4 E93202                   jmp .e1
  6743                                  
  6744                                  ;-835    if (isreg()) goto e1;
  6745                                  
  6746                                  .expr355:
  6747 00002CC7 E8CEF4                   call isreg
  6748 00002CCA 08C0                     or  al, al
  6749 00002CCC 0F840300                 je .expr356
  6750 00002CD0 E92602                   jmp .e1
  6751                                  
  6752                                  ;-836 
  6753                                  
  6754                                  
  6755                                  ;-837    id1=searchname(); gettypes(id1); ids=signi;
  6756                                  
  6757                                  .expr356:
  6758 00002CD3 E813E4                   call searchname
  6759 00002CD6 8946FC                   mov [bp-4], ax
  6760 00002CD9 FF76FC                   push word [bp-4]
  6761 00002CDC E856E5                   call gettypes
  6762 00002CDF 83C402                   add  sp, 2
  6763 00002CE2 A1[3000]                 mov ax, [signi]
  6764 00002CE5 8946F6                   mov [bp-10], ax
  6765                                  
  6766                                  ;-838    ixarr=0;  ixconst=0;
  6767                                  
  6768 00002CE8 B80000                   mov ax, 0
  6769 00002CEB 8946FA                   mov [bp-6], ax
  6770 00002CEE B80000                   mov ax, 0
  6771 00002CF1 8946F8                   mov [bp-8], ax
  6772                                  
  6773                                  ;-839      if (istoken('[')) { if (istoken(T_CONST)) {
  6774                                  
  6775 00002CF4 6A5B                     push 91
  6776 00002CF6 E859E2                   call istoken
  6777 00002CF9 83C402                   add  sp, 2
  6778 00002CFC 08C0                     or  al, al
  6779 00002CFE 0F845900                 je .expr357
  6780 00002D02 680101                   push 257
  6781 00002D05 E84AE2                   call istoken
  6782 00002D08 83C402                   add  sp, 2
  6783 00002D0B 08C0                     or  al, al
  6784 00002D0D 0F841700                 je .expr358
  6785                                  
  6786                                  ;-840        ixconst=1; ixarr=lexval; expect(']');  }
  6787                                  
  6788 00002D11 B80100                   mov ax, 1
  6789 00002D14 8946F8                   mov [bp-8], ax
  6790 00002D17 A1[2B00]                 mov ax, [lexval]
  6791 00002D1A 8946FA                   mov [bp-6], ax
  6792 00002D1D 6A5D                     push 93
  6793 00002D1F E852E2                   call expect
  6794 00002D22 83C402                   add  sp, 2
  6795                                  
  6796                                  ;-841      else {ixarr=searchname(); expect(T_NAME); expect(']');
  6797                                  
  6798 00002D25 E93300                   jmp .expr359
  6799                                  .expr358:
  6800 00002D28 E8BEE3                   call searchname
  6801 00002D2B 8946FA                   mov [bp-6], ax
  6802 00002D2E 680001                   push 256
  6803 00002D31 E840E2                   call expect
  6804 00002D34 83C402                   add  sp, 2
  6805 00002D37 6A5D                     push 93
  6806 00002D39 E838E2                   call expect
  6807 00002D3C 83C402                   add  sp, 2
  6808                                  
  6809                                  ;-842      gettypes(ixarr);
  6810                                  
  6811 00002D3F FF76FA                   push word [bp-6]
  6812 00002D42 E8F0E4                   call gettypes
  6813 00002D45 83C402                   add  sp, 2
  6814                                  
  6815                                  ;-843      if (widthi != 2) error1("Array index must be number or int"); } }
  6816                                  
  6817 00002D48 A1[3300]                 mov ax, [widthi]
  6818 00002D4B 83F802                   cmp ax, 2
  6819 00002D4E 0F840900                 je  .expr360
  6820 00002D52 68[1130]                 push expr_1
  6821 00002D55 E8A8D8                   call error1
  6822 00002D58 83C402                   add  sp, 2
  6823                                  .expr360:
  6824                                  .expr359:
  6825                                  
  6826                                  ;-844    if (istoken(T_PLUSPLUS  )) {if(mode)error1("Only var allowed");
  6827                                  
  6828                                  .expr357:
  6829 00002D5B 68C304                   push 1219
  6830 00002D5E E8F1E1                   call istoken
  6831 00002D61 83C402                   add  sp, 2
  6832 00002D64 08C0                     or  al, al
  6833 00002D66 0F844600                 je .expr361
  6834 00002D6A 8B46FE                   mov ax, [bp-2]
  6835 00002D6D 08C0                     or  al, al
  6836 00002D6F 0F840900                 je .expr362
  6837 00002D73 68[3330]                 push expr_2
  6838 00002D76 E887D8                   call error1
  6839 00002D79 83C402                   add  sp, 2
  6840                                  
  6841                                  ;-845       prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");
  6842                                  
  6843                                  .expr362:
  6844 00002D7C 68[4430]                 push expr_3
  6845 00002D7F E85DD6                   call prs
  6846 00002D82 83C402                   add  sp, 2
  6847 00002D85 A1[3600]                 mov ax, [wi]
  6848 00002D88 83F802                   cmp ax, 2
  6849 00002D8B 0F850C00                 jne .expr363
  6850 00002D8F 68[4D30]                 push expr_4
  6851 00002D92 E84AD6                   call prs
  6852 00002D95 83C402                   add  sp, 2
  6853 00002D98 E90900                   jmp .expr364
  6854                                  .expr363:
  6855 00002D9B 68[5230]                 push expr_5
  6856 00002D9E E83ED6                   call prs
  6857 00002DA1 83C402                   add  sp, 2
  6858                                  
  6859                                  ;-846       v(id1); goto e1;}
  6860                                  
  6861                                  .expr364:
  6862 00002DA4 FF76FC                   push word [bp-4]
  6863 00002DA7 E832E2                   call v
  6864 00002DAA 83C402                   add  sp, 2
  6865 00002DAD E94901                   jmp .e1
  6866                                  
  6867                                  ;-847    if (istoken(T_MINUSMINUS)) {if(mode)error1("Only var allowed");
  6868                                  
  6869                                  .expr361:
  6870 00002DB0 68C904                   push 1225
  6871 00002DB3 E89CE1                   call istoken
  6872 00002DB6 83C402                   add  sp, 2
  6873 00002DB9 08C0                     or  al, al
  6874 00002DBB 0F844600                 je .expr365
  6875 00002DBF 8B46FE                   mov ax, [bp-2]
  6876 00002DC2 08C0                     or  al, al
  6877 00002DC4 0F840900                 je .expr366
  6878 00002DC8 68[5730]                 push expr_6
  6879 00002DCB E832D8                   call error1
  6880 00002DCE 83C402                   add  sp, 2
  6881                                  
  6882                                  ;-848       prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");
  6883                                  
  6884                                  .expr366:
  6885 00002DD1 68[6830]                 push expr_7
  6886 00002DD4 E808D6                   call prs
  6887 00002DD7 83C402                   add  sp, 2
  6888 00002DDA A1[3600]                 mov ax, [wi]
  6889 00002DDD 83F802                   cmp ax, 2
  6890 00002DE0 0F850C00                 jne .expr367
  6891 00002DE4 68[7130]                 push expr_8
  6892 00002DE7 E8F5D5                   call prs
  6893 00002DEA 83C402                   add  sp, 2
  6894 00002DED E90900                   jmp .expr368
  6895                                  .expr367:
  6896 00002DF0 68[7630]                 push expr_9
  6897 00002DF3 E8E9D5                   call prs
  6898 00002DF6 83C402                   add  sp, 2
  6899                                  
  6900                                  ;-849       v(id1); goto e1;}
  6901                                  
  6902                                  .expr368:
  6903 00002DF9 FF76FC                   push word [bp-4]
  6904 00002DFC E8DDE1                   call v
  6905 00002DFF 83C402                   add  sp, 2
  6906 00002E02 E9F400                   jmp .e1
  6907                                  
  6908                                  ;-850 
  6909                                  
  6910                                  
  6911                                  ;-851    if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}
  6912                                  
  6913                                  .expr365:
  6914 00002E05 68CE04                   push 1230
  6915 00002E08 E847E1                   call istoken
  6916 00002E0B 83C402                   add  sp, 2
  6917 00002E0E 08C0                     or  al, al
  6918 00002E10 0F841200                 je .expr369
  6919 00002E14 FF76FC                   push word [bp-4]
  6920 00002E17 FF76FE                   push word [bp-2]
  6921 00002E1A 68[7B30]                 push expr_10
  6922 00002E1D E85DEF                   call compoundass
  6923 00002E20 83C406                   add  sp, 6
  6924 00002E23 E9D300                   jmp .e1
  6925                                  
  6926                                  ;-852    if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}
  6927                                  
  6928                                  .expr369:
  6929 00002E26 68CF04                   push 1231
  6930 00002E29 E826E1                   call istoken
  6931 00002E2C 83C402                   add  sp, 2
  6932 00002E2F 08C0                     or  al, al
  6933 00002E31 0F841200                 je .expr370
  6934 00002E35 FF76FC                   push word [bp-4]
  6935 00002E38 FF76FE                   push word [bp-2]
  6936 00002E3B 68[7F30]                 push expr_11
  6937 00002E3E E83CEF                   call compoundass
  6938 00002E41 83C406                   add  sp, 6
  6939 00002E44 E9B200                   jmp .e1
  6940                                  
  6941                                  ;-853    if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}
  6942                                  
  6943                                  .expr370:
  6944 00002E47 68D204                   push 1234
  6945 00002E4A E805E1                   call istoken
  6946 00002E4D 83C402                   add  sp, 2
  6947 00002E50 08C0                     or  al, al
  6948 00002E52 0F841200                 je .expr371
  6949 00002E56 FF76FC                   push word [bp-4]
  6950 00002E59 FF76FE                   push word [bp-2]
  6951 00002E5C 68[8330]                 push expr_12
  6952 00002E5F E81BEF                   call compoundass
  6953 00002E62 83C406                   add  sp, 6
  6954 00002E65 E99100                   jmp .e1
  6955                                  
  6956                                  ;-854    if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}
  6957                                  
  6958                                  .expr371:
  6959 00002E68 68D304                   push 1235
  6960 00002E6B E8E4E0                   call istoken
  6961 00002E6E 83C402                   add  sp, 2
  6962 00002E71 08C0                     or  al, al
  6963 00002E73 0F841200                 je .expr372
  6964 00002E77 FF76FC                   push word [bp-4]
  6965 00002E7A FF76FE                   push word [bp-2]
  6966 00002E7D 68[8730]                 push expr_13
  6967 00002E80 E8FAEE                   call compoundass
  6968 00002E83 83C406                   add  sp, 6
  6969 00002E86 E97000                   jmp .e1
  6970                                  
  6971                                  ;-855    if (istoken(T_MULASS    )) {error1("not implemented");}
  6972                                  
  6973                                  .expr372:
  6974 00002E89 68D004                   push 1232
  6975 00002E8C E8C3E0                   call istoken
  6976 00002E8F 83C402                   add  sp, 2
  6977 00002E92 08C0                     or  al, al
  6978 00002E94 0F840900                 je .expr373
  6979 00002E98 68[8A30]                 push expr_14
  6980 00002E9B E862D7                   call error1
  6981 00002E9E 83C402                   add  sp, 2
  6982                                  
  6983                                  ;-856    if (istoken(T_DIVASS    )) {error1("not implemented");}
  6984                                  
  6985                                  .expr373:
  6986 00002EA1 68D104                   push 1233
  6987 00002EA4 E8ABE0                   call istoken
  6988 00002EA7 83C402                   add  sp, 2
  6989 00002EAA 08C0                     or  al, al
  6990 00002EAC 0F840900                 je .expr374
  6991 00002EB0 68[9A30]                 push expr_15
  6992 00002EB3 E84AD7                   call error1
  6993 00002EB6 83C402                   add  sp, 2
  6994                                  
  6995                                  ;-857 
  6996                                  
  6997                                  
  6998                                  ;-858    if (istoken('=')) { exprtype= expr(1);
  6999                                  
  7000                                  .expr374:
  7001 00002EB9 6A3D                     push 61
  7002 00002EBB E894E0                   call istoken
  7003 00002EBE 83C402                   add  sp, 2
  7004 00002EC1 08C0                     or  al, al
  7005 00002EC3 0F842000                 je .expr375
  7006 00002EC7 6A01                     push 1
  7007 00002EC9 E899FD                   call expr
  7008 00002ECC 83C402                   add  sp, 2
  7009 00002ECF A3[632C]                 mov word [exprtype], ax
  7010                                  
  7011                                  ;-859    doassign(mode, id1, ixarr, ixconst); goto e1;  }
  7012                                  
  7013 00002ED2 FF76F8                   push word [bp-8]
  7014 00002ED5 FF76FA                   push word [bp-6]
  7015 00002ED8 FF76FC                   push word [bp-4]
  7016 00002EDB FF76FE                   push word [bp-2]
  7017 00002EDE E813F5                   call doassign
  7018 00002EE1 83C408                   add  sp, 8
  7019 00002EE4 E91200                   jmp .e1
  7020                                  
  7021                                  ;-860    dovar1(mode, "mov", ixarr, id1);
  7022                                  
  7023                                  .expr375:
  7024 00002EE7 FF76FC                   push word [bp-4]
  7025 00002EEA FF76FA                   push word [bp-6]
  7026 00002EED 68[AA30]                 push expr_16
  7027 00002EF0 FF76FE                   push word [bp-2]
  7028 00002EF3 E829EF                   call dovar1
  7029 00002EF6 83C408                   add  sp, 8
  7030                                  
  7031                                  ;-861 
  7032                                  
  7033                                  
  7034                                  ;-862  e1:    if (istoken('+')) rterm("add");
  7035                                  
  7036                                  .e1:
  7037 00002EF9 6A2B                     push 43
  7038 00002EFB E854E0                   call istoken
  7039 00002EFE 83C402                   add  sp, 2
  7040 00002F01 08C0                     or  al, al
  7041 00002F03 0F840C00                 je .expr376
  7042 00002F07 68[AE30]                 push expr_17
  7043 00002F0A E8DCF0                   call rterm
  7044 00002F0D 83C402                   add  sp, 2
  7045                                  
  7046                                  ;-863    else if (istoken('-')) rterm("sub" );
  7047                                  
  7048 00002F10 E9CF00                   jmp .expr377
  7049                                  .expr376:
  7050 00002F13 6A2D                     push 45
  7051 00002F15 E83AE0                   call istoken
  7052 00002F18 83C402                   add  sp, 2
  7053 00002F1B 08C0                     or  al, al
  7054 00002F1D 0F840C00                 je .expr378
  7055 00002F21 68[B230]                 push expr_18
  7056 00002F24 E8C2F0                   call rterm
  7057 00002F27 83C402                   add  sp, 2
  7058                                  
  7059                                  ;-864    else if (istoken('&')) rterm("and" );
  7060                                  
  7061 00002F2A E9B500                   jmp .expr379
  7062                                  .expr378:
  7063 00002F2D 6A26                     push 38
  7064 00002F2F E820E0                   call istoken
  7065 00002F32 83C402                   add  sp, 2
  7066 00002F35 08C0                     or  al, al
  7067 00002F37 0F840C00                 je .expr380
  7068 00002F3B 68[B630]                 push expr_19
  7069 00002F3E E8A8F0                   call rterm
  7070 00002F41 83C402                   add  sp, 2
  7071                                  
  7072                                  ;-865    else if (istoken('|')) rterm("or" );
  7073                                  
  7074 00002F44 E99B00                   jmp .expr381
  7075                                  .expr380:
  7076 00002F47 6A7C                     push 124
  7077 00002F49 E806E0                   call istoken
  7078 00002F4C 83C402                   add  sp, 2
  7079 00002F4F 08C0                     or  al, al
  7080 00002F51 0F840C00                 je .expr382
  7081 00002F55 68[BA30]                 push expr_20
  7082 00002F58 E88EF0                   call rterm
  7083 00002F5B 83C402                   add  sp, 2
  7084                                  
  7085                                  ;-866    else if (istoken(T_LESSLESS)) rterm("shl");
  7086                                  
  7087 00002F5E E98100                   jmp .expr383
  7088                                  .expr382:
  7089 00002F61 68D804                   push 1240
  7090 00002F64 E8EBDF                   call istoken
  7091 00002F67 83C402                   add  sp, 2
  7092 00002F6A 08C0                     or  al, al
  7093 00002F6C 0F840C00                 je .expr384
  7094 00002F70 68[BD30]                 push expr_21
  7095 00002F73 E873F0                   call rterm
  7096 00002F76 83C402                   add  sp, 2
  7097                                  
  7098                                  ;-867    else if (istoken(T_GREATGREAT)) rterm("shr");
  7099                                  
  7100 00002F79 E96600                   jmp .expr385
  7101                                  .expr384:
  7102 00002F7C 68D904                   push 1241
  7103 00002F7F E8D0DF                   call istoken
  7104 00002F82 83C402                   add  sp, 2
  7105 00002F85 08C0                     or  al, al
  7106 00002F87 0F840C00                 je .expr386
  7107 00002F8B 68[C130]                 push expr_22
  7108 00002F8E E858F0                   call rterm
  7109 00002F91 83C402                   add  sp, 2
  7110                                  
  7111                                  ;-868    else if (istoken('*')) domul (ids);
  7112                                  
  7113 00002F94 E94B00                   jmp .expr387
  7114                                  .expr386:
  7115 00002F97 6A2A                     push 42
  7116 00002F99 E8B6DF                   call istoken
  7117 00002F9C 83C402                   add  sp, 2
  7118 00002F9F 08C0                     or  al, al
  7119 00002FA1 0F840C00                 je .expr388
  7120 00002FA5 FF76F6                   push word [bp-10]
  7121 00002FA8 E892F6                   call domul
  7122 00002FAB 83C402                   add  sp, 2
  7123                                  
  7124                                  ;-869    else if (istoken('/')) doidiv(ids);
  7125                                  
  7126 00002FAE E93100                   jmp .expr389
  7127                                  .expr388:
  7128 00002FB1 6A2F                     push 47
  7129 00002FB3 E89CDF                   call istoken
  7130 00002FB6 83C402                   add  sp, 2
  7131 00002FB9 08C0                     or  al, al
  7132 00002FBB 0F840C00                 je .expr390
  7133 00002FBF FF76F6                   push word [bp-10]
  7134 00002FC2 E819F7                   call doidiv
  7135 00002FC5 83C402                   add  sp, 2
  7136                                  
  7137                                  ;-870    else if (istoken('%')) domod (ids);
  7138                                  
  7139 00002FC8 E91700                   jmp .expr391
  7140                                  .expr390:
  7141 00002FCB 6A25                     push 37
  7142 00002FCD E882DF                   call istoken
  7143 00002FD0 83C402                   add  sp, 2
  7144 00002FD3 08C0                     or  al, al
  7145 00002FD5 0F840900                 je .expr392
  7146 00002FD9 FF76F6                   push word [bp-10]
  7147 00002FDC E8A2F8                   call domod
  7148 00002FDF 83C402                   add  sp, 2
  7149                                  
  7150                                  ;-871    if (isrelational()) { rterm("cmp"); cmpneg(ids);}
  7151                                  
  7152                                  .expr392:
  7153                                  .expr391:
  7154                                  .expr389:
  7155                                  .expr387:
  7156                                  .expr385:
  7157                                  .expr383:
  7158                                  .expr381:
  7159                                  .expr379:
  7160                                  .expr377:
  7161 00002FE2 E8CBE5                   call isrelational
  7162 00002FE5 08C0                     or  al, al
  7163 00002FE7 0F841200                 je .expr393
  7164 00002FEB 68[C530]                 push expr_23
  7165 00002FEE E8F8EF                   call rterm
  7166 00002FF1 83C402                   add  sp, 2
  7167 00002FF4 FF76F6                   push word [bp-10]
  7168 00002FF7 E846E4                   call cmpneg
  7169 00002FFA 83C402                   add  sp, 2
  7170                                  
  7171                                  ;-872    return 0;
  7172                                  
  7173                                  .expr393:
  7174 00002FFD B80000                   mov ax, 0
  7175 00003000 E90000                   jmp .retnexpr
  7176                                  
  7177                                  ;-873  }
  7178                                  
  7179                                  
  7180                                  ;-874 
  7181                                  
  7182                                  
  7183                                  ;-875  int pexpr() {expect('('); iscmp=0;
  7184                                  
  7185 00003003 C9                       .retnexpr: LEAVE
  7186 00003004 C3                       ret
  7187 00003005 5C6E206D6F76206178-     expr_0 db "\n mov ax, ",0
  7188 0000300E 2C2000             
  7189 00003011 417272617920696E64-     expr_1 db "Array index must be number or int",0
  7190 0000301A 6578206D7573742062-
  7191 00003023 65206E756D62657220-
  7192 0000302C 6F7220696E7400     
  7193 00003033 4F6E6C792076617220-     expr_2 db "Only var allowed",0
  7194 0000303C 616C6C6F77656400   
  7195 00003044 5C6E20696E63202000      expr_3 db "\n inc  ",0
  7196 0000304D 776F726400              expr_4 db "word",0
  7197 00003052 6279746500              expr_5 db "byte",0
  7198 00003057 4F6E6C792076617220-     expr_6 db "Only var allowed",0
  7199 00003060 616C6C6F77656400   
  7200 00003068 5C6E20646563202000      expr_7 db "\n dec  ",0
  7201 00003071 776F726400              expr_8 db "word",0
  7202 00003076 6279746500              expr_9 db "byte",0
  7203 0000307B 61646400                expr_10 db "add",0
  7204 0000307F 73756200                expr_11 db "sub",0
  7205 00003083 616E6400                expr_12 db "and",0
  7206 00003087 6F7200                  expr_13 db "or",0
  7207 0000308A 6E6F7420696D706C65-     expr_14 db "not implemented",0
  7208 00003093 6D656E74656400     
  7209 0000309A 6E6F7420696D706C65-     expr_15 db "not implemented",0
  7210 000030A3 6D656E74656400     
  7211 000030AA 6D6F7600                expr_16 db "mov",0
  7212 000030AE 61646400                expr_17 db "add",0
  7213 000030B2 73756200                expr_18 db "sub",0
  7214 000030B6 616E6400                expr_19 db "and",0
  7215 000030BA 6F7200                  expr_20 db "or",0
  7216 000030BD 73686C00                expr_21 db "shl",0
  7217 000030C1 73687200                expr_22 db "shr",0
  7218 000030C5 636D7000                expr_23 db "cmp",0
  7219                                  ENDP
  7220                                  
  7221                                  pexpr: PROC
  7222 000030C9 6A28                     push 40
  7223 000030CB E8A6DE                   call expect
  7224 000030CE 83C402                   add  sp, 2
  7225 000030D1 B80000                   mov ax, 0
  7226 000030D4 A3[2300]                 mov word [iscmp], ax
  7227                                  
  7228                                  ;-876    if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}
  7229                                  
  7230 000030D7 A1[1E00]                 mov ax, [token]
  7231 000030DA 3D0001                   cmp ax, 256
  7232 000030DD 0F853400                 jne .pexpr394
  7233 000030E1 68[4431]                 push pexpr_0
  7234 000030E4 8D06A36D                 lea  ax, [symbol]
  7235 000030E8 50                       push ax
  7236 000030E9 E873D1                   call eqstr
  7237 000030EC 83C404                   add  sp, 4
  7238 000030EF 08C0                     or  al, al
  7239 000030F1 0F840600                 je .pexpr395
  7240 000030F5 E89AE9                   call constantexpr
  7241 000030F8 E94800                   jmp .retnpexpr
  7242                                  
  7243                                  ;-877      ireg1=checkreg();
  7244                                  
  7245                                  .pexpr395:
  7246 000030FB E819E5                   call checkreg
  7247 000030FE A3[4B00]                 mov word [ireg1], ax
  7248                                  
  7249                                  ;-878      if (ireg1) { doreg1(1); return; }  }
  7250                                  
  7251 00003101 A1[4B00]                 mov ax, [ireg1]
  7252 00003104 08C0                     or  al, al
  7253 00003106 0F840B00                 je .pexpr396
  7254 0000310A 6A01                     push 1
  7255 0000310C E882EA                   call doreg1
  7256 0000310F 83C402                   add  sp, 2
  7257 00003112 E92E00                   jmp .retnpexpr
  7258                                  .pexpr396:
  7259                                  
  7260                                  ;-879    expr(0);
  7261                                  
  7262                                  .pexpr394:
  7263 00003115 6A00                     push 0
  7264 00003117 E84BFB                   call expr
  7265 0000311A 83C402                   add  sp, 2
  7266                                  
  7267                                  ;-880    if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);
  7268                                  
  7269 0000311D A1[2300]                 mov ax, [iscmp]
  7270 00003120 83F800                   cmp ax, 0
  7271 00003123 0F850900                 jne .pexpr397
  7272 00003127 68[4631]                 push pexpr_1
  7273 0000312A E8B2D2                   call prs
  7274 0000312D 83C402                   add  sp, 2
  7275                                  .pexpr397:
  7276 00003130 8D06236E                 lea  ax, [fname]
  7277 00003134 50                       push ax
  7278 00003135 E8A7D2                   call prs
  7279 00003138 83C402                   add  sp, 2
  7280                                  
  7281                                  ;-881    expect(')');
  7282                                  
  7283 0000313B 6A29                     push 41
  7284 0000313D E834DE                   call expect
  7285 00003140 83C402                   add  sp, 2
  7286                                  
  7287                                  ;-882  }
  7288                                  
  7289                                  
  7290                                  ;-883 
  7291                                  
  7292                                  
  7293                                  ;-884 /***************************************************************/
  7294                                  
  7295                                  
  7296                                  ;-885 
  7297                                  
  7298                                  
  7299                                  ;-886 int prlabel(int n) {
  7300                                  
  7301                                   .retnpexpr:
  7302 00003143 C3                       ret
  7303 00003144 5F00                    pexpr_0 db "_",0
  7304 00003146 5C6E206F722020616C-     pexpr_1 db "\n or  al, al\n je .",0
  7305 0000314F 2C20616C5C6E206A65-
  7306 00003158 202E00             
  7307                                  ENDP
  7308                                  
  7309                                  prlabel: PROC
  7310                                  
  7311                                  ;-887     prs("\n.");
  7312                                  ;
  7313 0000315B C8000000                 ENTER  0,0
  7314 0000315F 68[8631]                 push prlabel_0
  7315 00003162 E87AD2                   call prs
  7316 00003165 83C402                   add  sp, 2
  7317                                  
  7318                                  ;-888     prs(fname);
  7319                                  
  7320 00003168 8D06236E                 lea  ax, [fname]
  7321 0000316C 50                       push ax
  7322 0000316D E86FD2                   call prs
  7323 00003170 83C402                   add  sp, 2
  7324                                  
  7325                                  ;-889     prunsign1(n);
  7326                                  
  7327 00003173 FF7604                   push word [bp+4]
  7328 00003176 E8C9D3                   call prunsign1
  7329 00003179 83C402                   add  sp, 2
  7330                                  
  7331                                  ;-890     prc(':');
  7332                                  
  7333 0000317C 6A3A                     push 58
  7334 0000317E E805D2                   call prc
  7335 00003181 83C402                   add  sp, 2
  7336                                  
  7337                                  ;-891 }
  7338                                  
  7339                                  
  7340                                  ;-892 int prjump (int n) {
  7341 00003184 C9                       LEAVE
  7342 00003185 C3                       ret
  7343 00003186 5C6E2E00                prlabel_0 db "\n.",0
  7344                                  ENDP
  7345                                  
  7346                                  prjump: PROC
  7347                                  
  7348                                  ;-893     prs("\n jmp .");
  7349                                  ;
  7350 0000318A C8000000                 ENTER  0,0
  7351 0000318E 68[AD31]                 push prjump_0
  7352 00003191 E84BD2                   call prs
  7353 00003194 83C402                   add  sp, 2
  7354                                  
  7355                                  ;-894     prs(fname);
  7356                                  
  7357 00003197 8D06236E                 lea  ax, [fname]
  7358 0000319B 50                       push ax
  7359 0000319C E840D2                   call prs
  7360 0000319F 83C402                   add  sp, 2
  7361                                  
  7362                                  ;-895     prunsign1(n);
  7363                                  
  7364 000031A2 FF7604                   push word [bp+4]
  7365 000031A5 E89AD3                   call prunsign1
  7366 000031A8 83C402                   add  sp, 2
  7367                                  
  7368                                  ;-896 }
  7369                                  
  7370                                  
  7371                                  ;-897 
  7372                                  
  7373                                  
  7374                                  ;-898 int stmt() {
  7375 000031AB C9                       LEAVE
  7376 000031AC C3                       ret
  7377 000031AD 5C6E206A6D70202E00      prjump_0 db "\n jmp .",0
  7378                                  ENDP
  7379                                  
  7380                                  stmt: PROC
  7381                                  
  7382                                  ;-899     int c; char cha;
  7383                                  
  7384                                  
  7385                                  ;-900     int jdest; int tst; int jtemp;
  7386                                  
  7387                                  
  7388                                  ;-901        if(istoken('{'))     {while(istoken('}')==0) stmt();}
  7389                                  ;
  7390 000031B6 C80A0000                 ENTER  10,0
  7391 000031BA 6A7B                     push 123
  7392 000031BC E893DD                   call istoken
  7393 000031BF 83C402                   add  sp, 2
  7394 000031C2 08C0                     or  al, al
  7395 000031C4 0F841700                 je .stmt398
  7396                                  .stmt399:
  7397 000031C8 6A7D                     push 125
  7398 000031CA E885DD                   call istoken
  7399 000031CD 83C402                   add  sp, 2
  7400 000031D0 83F800                   cmp ax, 0
  7401 000031D3 0F850500                 jne .stmt400
  7402 000031D7 E8DCFF                   call stmt
  7403 000031DA EBEC                     jmp .stmt399
  7404                                  .stmt400:
  7405                                  
  7406                                  ;-902   else if(istoken(T_IF)) {
  7407                                  
  7408 000031DC E9D002                   jmp .stmt401
  7409                                  .stmt398:
  7410 000031DF 680102                   push 513
  7411 000031E2 E86DDD                   call istoken
  7412 000031E5 83C402                   add  sp, 2
  7413 000031E8 08C0                     or  al, al
  7414 000031EA 0F846500                 je .stmt402
  7415                                  
  7416                                  ;-903       int jdest; int tst;
  7417                                  
  7418 000031EE 8B46FA                   mov ax, [bp-6]
  7419 000031F1 8B46F8                   mov ax, [bp-8]
  7420                                  
  7421                                  ;-904       pexpr(); nlabel++; jdest=nlabel;
  7422                                  
  7423 000031F4 E8D2FE                   call pexpr
  7424 000031F7 FF06[2900]               inc  word[nlabel]
  7425 000031FB A1[2900]                 mov ax, [nlabel]
  7426 000031FE 8946FA                   mov [bp-6], ax
  7427                                  
  7428                                  ;-905       pint1(jdest); stmt();
  7429                                  
  7430 00003201 FF76FA                   push word [bp-6]
  7431 00003204 E8DDD2                   call pint1
  7432 00003207 83C402                   add  sp, 2
  7433 0000320A E8A9FF                   call stmt
  7434                                  
  7435                                  ;-906       if (istoken(T_ELSE)) { nlabel++; tst=nlabel;
  7436                                  
  7437 0000320D 680202                   push 514
  7438 00003210 E83FDD                   call istoken
  7439 00003213 83C402                   add  sp, 2
  7440 00003216 08C0                     or  al, al
  7441 00003218 0F842B00                 je .stmt403
  7442 0000321C FF06[2900]               inc  word[nlabel]
  7443 00003220 A1[2900]                 mov ax, [nlabel]
  7444 00003223 8946F8                   mov [bp-8], ax
  7445                                  
  7446                                  ;-907           prjump(tst); prlabel(jdest); stmt(); prlabel(tst);
  7447                                  
  7448 00003226 FF76F8                   push word [bp-8]
  7449 00003229 E85EFF                   call prjump
  7450 0000322C 83C402                   add  sp, 2
  7451 0000322F FF76FA                   push word [bp-6]
  7452 00003232 E826FF                   call prlabel
  7453 00003235 83C402                   add  sp, 2
  7454 00003238 E87BFF                   call stmt
  7455 0000323B FF76F8                   push word [bp-8]
  7456 0000323E E81AFF                   call prlabel
  7457 00003241 83C402                   add  sp, 2
  7458                                  
  7459                                  ;-908       }
  7460                                  
  7461                                  
  7462                                  ;-909       else prlabel(jdest);
  7463                                  
  7464 00003244 E90900                   jmp .stmt404
  7465                                  .stmt403:
  7466 00003247 FF76FA                   push word [bp-6]
  7467 0000324A E80EFF                   call prlabel
  7468 0000324D 83C402                   add  sp, 2
  7469                                  
  7470                                  ;-910   }
  7471                                  
  7472                                  .stmt404:
  7473                                  
  7474                                  ;-911   else if(istoken(T_DO)) {
  7475                                  
  7476 00003250 E95C02                   jmp .stmt405
  7477                                  .stmt402:
  7478 00003253 680402                   push 516
  7479 00003256 E8F9DC                   call istoken
  7480 00003259 83C402                   add  sp, 2
  7481 0000325C 08C0                     or  al, al
  7482 0000325E 0F844A00                 je .stmt406
  7483                                  
  7484                                  ;-912       nlabel++; jdest=nlabel; prlabel(jdest); stmt();
  7485                                  
  7486 00003262 FF06[2900]               inc  word[nlabel]
  7487 00003266 A1[2900]                 mov ax, [nlabel]
  7488 00003269 8946FA                   mov [bp-6], ax
  7489 0000326C FF76FA                   push word [bp-6]
  7490 0000326F E8E9FE                   call prlabel
  7491 00003272 83C402                   add  sp, 2
  7492 00003275 E83EFF                   call stmt
  7493                                  
  7494                                  ;-913       expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);
  7495                                  
  7496 00003278 680302                   push 515
  7497 0000327B E8F6DC                   call expect
  7498 0000327E 83C402                   add  sp, 2
  7499 00003281 E845FE                   call pexpr
  7500 00003284 FF06[2900]               inc  word[nlabel]
  7501 00003288 A1[2900]                 mov ax, [nlabel]
  7502 0000328B 8946F6                   mov [bp-10], ax
  7503 0000328E FF76F6                   push word [bp-10]
  7504 00003291 E850D2                   call pint1
  7505 00003294 83C402                   add  sp, 2
  7506                                  
  7507                                  ;-914       prjump(jdest); prlabel(jtemp);
  7508                                  
  7509 00003297 FF76FA                   push word [bp-6]
  7510 0000329A E8EDFE                   call prjump
  7511 0000329D 83C402                   add  sp, 2
  7512 000032A0 FF76F6                   push word [bp-10]
  7513 000032A3 E8B5FE                   call prlabel
  7514 000032A6 83C402                   add  sp, 2
  7515                                  
  7516                                  ;-915   }
  7517                                  
  7518                                  
  7519                                  ;-916   else if(istoken(T_WHILE)) {
  7520                                  
  7521 000032A9 E90302                   jmp .stmt407
  7522                                  .stmt406:
  7523 000032AC 680302                   push 515
  7524 000032AF E8A0DC                   call istoken
  7525 000032B2 83C402                   add  sp, 2
  7526 000032B5 08C0                     or  al, al
  7527 000032B7 0F844100                 je .stmt408
  7528                                  
  7529                                  ;-917       nlabel++; jdest=nlabel;
  7530                                  
  7531 000032BB FF06[2900]               inc  word[nlabel]
  7532 000032BF A1[2900]                 mov ax, [nlabel]
  7533 000032C2 8946FA                   mov [bp-6], ax
  7534                                  
  7535                                  ;-918       prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);
  7536                                  
  7537 000032C5 FF76FA                   push word [bp-6]
  7538 000032C8 E890FE                   call prlabel
  7539 000032CB 83C402                   add  sp, 2
  7540 000032CE E8F8FD                   call pexpr
  7541 000032D1 FF06[2900]               inc  word[nlabel]
  7542 000032D5 A1[2900]                 mov ax, [nlabel]
  7543 000032D8 8946F8                   mov [bp-8], ax
  7544 000032DB FF76F8                   push word [bp-8]
  7545 000032DE E803D2                   call pint1
  7546 000032E1 83C402                   add  sp, 2
  7547                                  
  7548                                  ;-919       stmt(); prjump(jdest); prlabel(tst);
  7549                                  
  7550 000032E4 E8CFFE                   call stmt
  7551 000032E7 FF76FA                   push word [bp-6]
  7552 000032EA E89DFE                   call prjump
  7553 000032ED 83C402                   add  sp, 2
  7554 000032F0 FF76F8                   push word [bp-8]
  7555 000032F3 E865FE                   call prlabel
  7556 000032F6 83C402                   add  sp, 2
  7557                                  
  7558                                  ;-920   }
  7559                                  
  7560                                  
  7561                                  ;-921   else if(istoken(T_GOTO))  {
  7562                                  
  7563 000032F9 E9B301                   jmp .stmt409
  7564                                  .stmt408:
  7565 000032FC 680902                   push 521
  7566 000032FF E850DC                   call istoken
  7567 00003302 83C402                   add  sp, 2
  7568 00003305 08C0                     or  al, al
  7569 00003307 0F842200                 je .stmt410
  7570                                  
  7571                                  ;-922       prs("\n jmp .");name1();prs(symbol);expect(';');
  7572                                  
  7573 0000330B 68[B134]                 push stmt_0
  7574 0000330E E8CED0                   call prs
  7575 00003311 83C402                   add  sp, 2
  7576 00003314 E81DDE                   call name1
  7577 00003317 8D06A36D                 lea  ax, [symbol]
  7578 0000331B 50                       push ax
  7579 0000331C E8C0D0                   call prs
  7580 0000331F 83C402                   add  sp, 2
  7581 00003322 6A3B                     push 59
  7582 00003324 E84DDC                   call expect
  7583 00003327 83C402                   add  sp, 2
  7584                                  
  7585                                  ;-923   }
  7586                                  
  7587                                  
  7588                                  ;-924   else if(token==T_ASM)     {
  7589                                  
  7590 0000332A E98201                   jmp .stmt411
  7591                                  .stmt410:
  7592 0000332D A1[1E00]                 mov ax, [token]
  7593 00003330 3D0602                   cmp ax, 518
  7594 00003333 0F853300                 jne .stmt412
  7595                                  
  7596                                  ;-925       prs("\n"); c=next();
  7597                                  
  7598 00003337 68[BA34]                 push stmt_1
  7599 0000333A E8A2D0                   call prs
  7600 0000333D 83C402                   add  sp, 2
  7601 00003340 E894D4                   call next
  7602 00003343 8946FE                   mov [bp-2], ax
  7603                                  
  7604                                  ;-926       while(c != '\n') { prc(c);	c=next(); };
  7605                                  
  7606                                  .stmt413:
  7607 00003346 8B46FE                   mov ax, [bp-2]
  7608 00003349 83F80A                   cmp ax, 10
  7609 0000334C 0F841100                 je  .stmt414
  7610 00003350 FF76FE                   push word [bp-2]
  7611 00003353 E830D0                   call prc
  7612 00003356 83C402                   add  sp, 2
  7613 00003359 E87BD4                   call next
  7614 0000335C 8946FE                   mov [bp-2], ax
  7615 0000335F EBE5                     jmp .stmt413
  7616                                  .stmt414:
  7617                                  
  7618                                  ;-927       token=getlex();
  7619                                  
  7620 00003361 E83CD5                   call getlex
  7621 00003364 A3[1E00]                 mov word [token], ax
  7622                                  
  7623                                  ;-928   }
  7624                                  
  7625                                  
  7626                                  ;-929   else if(istoken(T_ASMBLOCK)) {
  7627                                  
  7628 00003367 E94501                   jmp .stmt415
  7629                                  .stmt412:
  7630 0000336A 680702                   push 519
  7631 0000336D E8E2DB                   call istoken
  7632 00003370 83C402                   add  sp, 2
  7633 00003373 08C0                     or  al, al
  7634 00003375 0F844B00                 je .stmt416
  7635                                  
  7636                                  ;-930       if (token== '{' )  {
  7637                                  
  7638 00003379 A1[1E00]                 mov ax, [token]
  7639 0000337C 83F87B                   cmp ax, 123
  7640 0000337F 0F853500                 jne .stmt417
  7641                                  
  7642                                  ;-931           prs("\n"); cha=next();
  7643                                  
  7644 00003383 68[BD34]                 push stmt_2
  7645 00003386 E856D0                   call prs
  7646 00003389 83C402                   add  sp, 2
  7647 0000338C E848D4                   call next
  7648 0000338F 8846FC                   mov [bp-4], al
  7649                                  
  7650                                  ;-932           while(cha!= '}') {
  7651                                  
  7652                                  .stmt418:
  7653 00003392 8A46FC                   mov al, [bp-4]
  7654 00003395 3C7D                     cmp al, 125
  7655 00003397 0F841400                 je  .stmt419
  7656                                  
  7657                                  ;-933               prc(cha);
  7658                                  
  7659 0000339B 8A46FC                   mov al, byte [bp-4]
  7660 0000339E B400                     mov ah, 0
  7661 000033A0 50                       push ax
  7662 000033A1 E8E2CF                   call prc
  7663 000033A4 83C402                   add  sp, 2
  7664                                  
  7665                                  ;-934               cha=next();
  7666                                  
  7667 000033A7 E82DD4                   call next
  7668 000033AA 8846FC                   mov [bp-4], al
  7669                                  
  7670                                  ;-935           }
  7671                                  
  7672                                  
  7673                                  ;-936           token=getlex();
  7674                                  
  7675 000033AD EBE3                     jmp .stmt418
  7676                                  .stmt419:
  7677 000033AF E8EED4                   call getlex
  7678 000033B2 A3[1E00]                 mov word [token], ax
  7679                                  
  7680                                  ;-937       } else error1("Curly open expected");
  7681                                  
  7682 000033B5 E90900                   jmp .stmt420
  7683                                  .stmt417:
  7684 000033B8 68[C034]                 push stmt_3
  7685 000033BB E842D2                   call error1
  7686 000033BE 83C402                   add  sp, 2
  7687                                  
  7688                                  ;-938         }
  7689                                  
  7690                                  .stmt420:
  7691                                  
  7692                                  ;-939   else if(istoken(T_EMIT)) {
  7693                                  
  7694 000033C1 E9EB00                   jmp .stmt421
  7695                                  .stmt416:
  7696 000033C4 680802                   push 520
  7697 000033C7 E888DB                   call istoken
  7698 000033CA 83C402                   add  sp, 2
  7699 000033CD 08C0                     or  al, al
  7700 000033CF 0F843E00                 je .stmt422
  7701                                  
  7702                                  ;-940       prs("\n db ");
  7703                                  
  7704 000033D3 68[D434]                 push stmt_4
  7705 000033D6 E806D0                   call prs
  7706 000033D9 83C402                   add  sp, 2
  7707                                  
  7708                                  ;-941     L1: token=getlex();
  7709                                  
  7710                                  .L1:
  7711 000033DC E8C1D4                   call getlex
  7712 000033DF A3[1E00]                 mov word [token], ax
  7713                                  
  7714                                  ;-942       prunsign1(lexval);
  7715                                  
  7716 000033E2 FF36[2B00]               push word [lexval]
  7717 000033E6 E859D1                   call prunsign1
  7718 000033E9 83C402                   add  sp, 2
  7719                                  
  7720                                  ;-943       token=getlex();
  7721                                  
  7722 000033EC E8B1D4                   call getlex
  7723 000033EF A3[1E00]                 mov word [token], ax
  7724                                  
  7725                                  ;-944       if (token== ',') {
  7726                                  
  7727 000033F2 A1[1E00]                 mov ax, [token]
  7728 000033F5 83F82C                   cmp ax, 44
  7729 000033F8 0F850A00                 jne .stmt423
  7730                                  
  7731                                  ;-945           prc(',');
  7732                                  
  7733 000033FC 6A2C                     push 44
  7734 000033FE E885CF                   call prc
  7735 00003401 83C402                   add  sp, 2
  7736                                  
  7737                                  ;-946           goto L1;
  7738                                  
  7739 00003404 EBD6                     jmp .L1
  7740                                  
  7741                                  ;-947       }
  7742                                  
  7743                                  
  7744                                  ;-948       expect(')');
  7745                                  
  7746                                  .stmt423:
  7747 00003406 6A29                     push 41
  7748 00003408 E869DB                   call expect
  7749 0000340B 83C402                   add  sp, 2
  7750                                  
  7751                                  ;-949   }
  7752                                  
  7753                                  
  7754                                  ;-950   else if(istoken(';'))      { }
  7755                                  
  7756 0000340E E99E00                   jmp .stmt424
  7757                                  .stmt422:
  7758 00003411 6A3B                     push 59
  7759 00003413 E83CDB                   call istoken
  7760 00003416 83C402                   add  sp, 2
  7761 00003419 08C0                     or  al, al
  7762 0000341B 0F840300                 je .stmt425
  7763                                  
  7764                                  ;-951   else if(istoken(T_RETURN)) {
  7765                                  
  7766 0000341F E98D00                   jmp .stmt426
  7767                                  .stmt425:
  7768 00003422 680002                   push 512
  7769 00003425 E82ADB                   call istoken
  7770 00003428 83C402                   add  sp, 2
  7771 0000342B 08C0                     or  al, al
  7772 0000342D 0F843500                 je .stmt427
  7773                                  
  7774                                  ;-952         if (token!=';') expr(0);
  7775                                  
  7776 00003431 A1[1E00]                 mov ax, [token]
  7777 00003434 83F83B                   cmp ax, 59
  7778 00003437 0F840800                 je  .stmt428
  7779 0000343B 6A00                     push 0
  7780 0000343D E825F8                   call expr
  7781 00003440 83C402                   add  sp, 2
  7782                                  
  7783                                  ;-953         prs("\n jmp .retn");
  7784                                  
  7785                                  .stmt428:
  7786 00003443 68[DB34]                 push stmt_5
  7787 00003446 E896CF                   call prs
  7788 00003449 83C402                   add  sp, 2
  7789                                  
  7790                                  ;-954         prs(fname);
  7791                                  
  7792 0000344C 8D06236E                 lea  ax, [fname]
  7793 00003450 50                       push ax
  7794 00003451 E88BCF                   call prs
  7795 00003454 83C402                   add  sp, 2
  7796                                  
  7797                                  ;-955         nreturn++;
  7798                                  
  7799 00003457 FF06[2700]               inc  word[nreturn]
  7800                                  
  7801                                  ;-956         expect(';');
  7802                                  
  7803 0000345B 6A3B                     push 59
  7804 0000345D E814DB                   call expect
  7805 00003460 83C402                   add  sp, 2
  7806                                  
  7807                                  ;-957         }
  7808                                  
  7809                                  
  7810                                  ;-958   else if(thechar==':')      {
  7811                                  
  7812 00003463 E94900                   jmp .stmt429
  7813                                  .stmt427:
  7814 00003466 A0[2200]                 mov al, [thechar]
  7815 00003469 3C3A                     cmp al, 58
  7816 0000346B 0F853000                 jne .stmt430
  7817                                  
  7818                                  ;-959         prs("\n."); // Label
  7819                                  
  7820 0000346F 68[E834]                 push stmt_6
  7821 00003472 E86ACF                   call prs
  7822 00003475 83C402                   add  sp, 2
  7823                                  
  7824                                  ;-960         prs(symbol); prc(':');
  7825                                  
  7826 00003478 8D06A36D                 lea  ax, [symbol]
  7827 0000347C 50                       push ax
  7828 0000347D E85FCF                   call prs
  7829 00003480 83C402                   add  sp, 2
  7830 00003483 6A3A                     push 58
  7831 00003485 E8FECE                   call prc
  7832 00003488 83C402                   add  sp, 2
  7833                                  
  7834                                  ;-961         expect(T_NAME);
  7835                                  
  7836 0000348B 680001                   push 256
  7837 0000348E E8E3DA                   call expect
  7838 00003491 83C402                   add  sp, 2
  7839                                  
  7840                                  ;-962         expect(':');
  7841                                  
  7842 00003494 6A3A                     push 58
  7843 00003496 E8DBDA                   call expect
  7844 00003499 83C402                   add  sp, 2
  7845                                  
  7846                                  ;-963         }
  7847                                  
  7848                                  
  7849                                  ;-964   else  {expr(0);; expect(';'); }
  7850                                  
  7851 0000349C E91000                   jmp .stmt431
  7852                                  .stmt430:
  7853 0000349F 6A00                     push 0
  7854 000034A1 E8C1F7                   call expr
  7855 000034A4 83C402                   add  sp, 2
  7856 000034A7 6A3B                     push 59
  7857 000034A9 E8C8DA                   call expect
  7858 000034AC 83C402                   add  sp, 2
  7859                                  
  7860                                  ;-965 }
  7861                                  
  7862                                  .stmt431:
  7863                                  .stmt429:
  7864                                  .stmt426:
  7865                                  .stmt424:
  7866                                  .stmt421:
  7867                                  .stmt415:
  7868                                  .stmt411:
  7869                                  .stmt409:
  7870                                  .stmt407:
  7871                                  .stmt405:
  7872                                  .stmt401:
  7873                                  
  7874                                  ;-966 
  7875                                  
  7876                                  
  7877                                  ;-967 
  7878                                  
  7879                                  
  7880                                  ;-968 int dofunc() { int nloc; int i; int narg;
  7881 000034AF C9                       LEAVE
  7882 000034B0 C3                       ret
  7883 000034B1 5C6E206A6D70202E00      stmt_0 db "\n jmp .",0
  7884 000034BA 5C6E00                  stmt_1 db "\n",0
  7885 000034BD 5C6E00                  stmt_2 db "\n",0
  7886 000034C0 4375726C79206F7065-     stmt_3 db "Curly open expected",0
  7887 000034C9 6E2065787065637465-
  7888 000034D2 6400               
  7889 000034D4 5C6E2064622000          stmt_4 db "\n db ",0
  7890 000034DB 5C6E206A6D70202E72-     stmt_5 db "\n jmp .retn",0
  7891 000034E4 65746E00           
  7892 000034E8 5C6E2E00                stmt_6 db "\n.",0
  7893                                  ENDP
  7894                                  
  7895                                  dofunc: PROC
  7896                                  
  7897                                  ;-969     cloc=&co;
  7898                                  ;
  7899 000034EC C8060000                 ENTER  6,0
  7900 000034F0 B8A861                   mov ax, co
  7901 000034F3 A3[1800]                 mov word [cloc], ax
  7902                                  
  7903                                  ;-970     checknamelen();
  7904                                  
  7905 000034F6 E816DB                   call checknamelen
  7906                                  
  7907                                  ;-971     strcpy(fname, symbol);
  7908                                  
  7909 000034F9 8D06A36D                 lea  ax, [symbol]
  7910 000034FD 50                       push ax
  7911 000034FE 8D06236E                 lea  ax, [fname]
  7912 00003502 50                       push ax
  7913 00003503 E823CD                   call strcpy
  7914 00003506 83C404                   add  sp, 4
  7915                                  
  7916                                  ;-972     if (checkFunction() ) error1("Function already defined");
  7917                                  
  7918 00003509 E899DE                   call checkFunction
  7919 0000350C 08C0                     or  al, al
  7920 0000350E 0F840900                 je .dofunc432
  7921 00003512 68[9037]                 push dofunc_0
  7922 00003515 E8E8D0                   call error1
  7923 00003518 83C402                   add  sp, 2
  7924                                  
  7925                                  ;-973     if (FTop >= FUNCMAX) error1("Function table full");
  7926                                  
  7927                                  .dofunc432:
  7928 0000351B A1[3C00]                 mov ax, [FTop]
  7929 0000351E 3D2C01                   cmp ax, 300 ;unsigned : 1
  7930 00003521 0F8C0900                 jl  .dofunc433
  7931 00003525 68[A937]                 push dofunc_1
  7932 00003528 E8D5D0                   call error1
  7933 0000352B 83C402                   add  sp, 2
  7934                                  
  7935                                  ;-974     FAdr[FTop]=lineno - 1;
  7936                                  
  7937                                  .dofunc433:
  7938 0000352E A1[4000]                 mov ax, [lineno]
  7939 00003531 83E801                   sub ax, 1
  7940 00003534 8B1E[3C00]               mov bx, [FTop]
  7941 00003538 D1E3                     shl bx, 1
  7942 0000353A 8987648D                 mov [FAdr+bx], ax
  7943                                  
  7944                                  ;-975     FCalls[FTop]=0;
  7945                                  
  7946 0000353E B80000                   mov ax, 0
  7947 00003541 8B1E[3C00]               mov bx, [FTop]
  7948 00003545 D1E3                     shl bx, 1
  7949 00003547 8987BC8F                 mov [FCalls+bx], ax
  7950                                  
  7951                                  ;-976     FType[FTop]=iswidth;
  7952                                  
  7953 0000354B A0[3500]                 mov al, [iswidth]
  7954 0000354E 8B1E[3C00]               mov bx, [FTop]
  7955 00003552 8887388C                 mov [FType+bx], al
  7956                                  
  7957                                  ;-977     pt=adrF(FNameField, FTop);
  7958                                  
  7959 00003556 FF36[3C00]               push word [FTop]
  7960 0000355A 8D061492                 lea  ax, [FNameField]
  7961 0000355E 50                       push ax
  7962 0000355F E88DD2                   call adrF
  7963 00003562 83C404                   add  sp, 4
  7964 00003565 A3[4200]                 mov word [pt], ax
  7965                                  
  7966                                  ;-978     strcpy(pt, symbol);
  7967                                  
  7968 00003568 8D06A36D                 lea  ax, [symbol]
  7969 0000356C 50                       push ax
  7970 0000356D FF36[4200]               push word [pt]
  7971 00003571 E8B5CC                   call strcpy
  7972 00003574 83C404                   add  sp, 4
  7973                                  
  7974                                  ;-979     FTop++;
  7975                                  
  7976 00003577 FF06[3C00]               inc  word[FTop]
  7977                                  
  7978                                  ;-980 
  7979                                  
  7980                                  
  7981                                  ;-981   prs("\n\n"); prs(symbol); prs(": PROC");
  7982                                  
  7983 0000357B 68[BD37]                 push dofunc_2
  7984 0000357E E85ECE                   call prs
  7985 00003581 83C402                   add  sp, 2
  7986 00003584 8D06A36D                 lea  ax, [symbol]
  7987 00003588 50                       push ax
  7988 00003589 E853CE                   call prs
  7989 0000358C 83C402                   add  sp, 2
  7990 0000358F 68[C237]                 push dofunc_3
  7991 00003592 E84ACE                   call prs
  7992 00003595 83C402                   add  sp, 2
  7993                                  
  7994                                  ;-982   expect('('); LTop=LSTART;  i=0;
  7995                                  
  7996 00003598 6A28                     push 40
  7997 0000359A E8D7D9                   call expect
  7998 0000359D 83C402                   add  sp, 2
  7999 000035A0 B8C800                   mov ax, 200
  8000 000035A3 A3[3A00]                 mov word [LTop], ax
  8001 000035A6 B80000                   mov ax, 0
  8002 000035A9 8946FC                   mov [bp-4], ax
  8003                                  
  8004                                  ;-983   if (istoken(')')==0) { narg=2;
  8005                                  
  8006 000035AC 6A29                     push 41
  8007 000035AE E8A1D9                   call istoken
  8008 000035B1 83C402                   add  sp, 2
  8009 000035B4 83F800                   cmp ax, 0
  8010 000035B7 0F854600                 jne .dofunc434
  8011 000035BB B80200                   mov ax, 2
  8012 000035BE 8946FA                   mov [bp-6], ax
  8013                                  
  8014                                  ;-984     do { typeName();  addlocal(); narg+=2;
  8015                                  
  8016                                  .dofunc435:
  8017 000035C1 E898DB                   call typeName
  8018 000035C4 E825DD                   call addlocal
  8019 000035C7 8346FA02                 add  word[bp-6], 2
  8020                                  
  8021                                  ;-985          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }
  8022                                  
  8023 000035CB 8B46FA                   mov ax, [bp-6]
  8024 000035CE 8B1E[3A00]               mov bx, [LTop]
  8025 000035D2 D1E3                     shl bx, 1
  8026 000035D4 89872077                 mov [GData+bx], ax
  8027 000035D8 A0[3500]                 mov al, [iswidth]
  8028 000035DB 3C04                     cmp al, 4
  8029 000035DD 0F850400                 jne .dofunc436
  8030 000035E1 8346FA02                 add  word[bp-6], 2
  8031                                  .dofunc436:
  8032 000035E5 FF06[3A00]               inc  word[LTop]
  8033                                  
  8034                                  ;-986     while (istoken(','));  expect(')'); }
  8035                                  
  8036 000035E9 6A2C                     push 44
  8037 000035EB E864D9                   call istoken
  8038 000035EE 83C402                   add  sp, 2
  8039 000035F1 08C0                     or  al, al
  8040 000035F3 0F840200                 je .dofunc437
  8041 000035F7 EBC8                     jmp .dofunc435
  8042                                  .dofunc437:
  8043 000035F9 6A29                     push 41
  8044 000035FB E876D9                   call expect
  8045 000035FE 83C402                   add  sp, 2
  8046                                  
  8047                                  ;-987 
  8048                                  
  8049                                  
  8050                                  ;-988   expect('{'); /*body*/
  8051                                  
  8052                                  .dofunc434:
  8053 00003601 6A7B                     push 123
  8054 00003603 E86ED9                   call expect
  8055 00003606 83C402                   add  sp, 2
  8056                                  
  8057                                  ;-989   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */
  8058                                  
  8059 00003609 B80000                   mov ax, 0
  8060 0000360C 8946FE                   mov [bp-2], ax
  8061 0000360F B80000                   mov ax, 0
  8062 00003612 A3[2700]                 mov word [nreturn], ax
  8063 00003615 B80000                   mov ax, 0
  8064 00003618 A3[2500]                 mov word [nconst], ax
  8065 0000361B B80000                   mov ax, 0
  8066 0000361E 8946FC                   mov [bp-4], ax
  8067                                  
  8068                                  ;-990   while(isvariable()) {
  8069                                  
  8070                                  .dofunc438:
  8071 00003621 E8CEDD                   call isvariable
  8072 00003624 08C0                     or  al, al
  8073 00003626 0F849200                 je .dofunc439
  8074                                  
  8075                                  ;-991     do {typeName();
  8076                                  
  8077                                  .dofunc440:
  8078 0000362A E82FDB                   call typeName
  8079                                  
  8080                                  ;-992         checknamelen();
  8081                                  
  8082 0000362D E8DFD9                   call checknamelen
  8083                                  
  8084                                  ;-993         addlocal(); nloc-=2;
  8085                                  
  8086 00003630 E8B9DC                   call addlocal
  8087 00003633 836EFE02                 sub  word[bp-2], 2
  8088                                  
  8089                                  ;-994         if (iswidth == 4) nloc-=2;
  8090                                  
  8091 00003637 A0[3500]                 mov al, [iswidth]
  8092 0000363A 3C04                     cmp al, 4
  8093 0000363C 0F850400                 jne .dofunc441
  8094 00003640 836EFE02                 sub  word[bp-2], 2
  8095                                  
  8096                                  ;-995         GData[LTop]=nloc;
  8097                                  
  8098                                  .dofunc441:
  8099 00003644 8B46FE                   mov ax, [bp-2]
  8100 00003647 8B1E[3A00]               mov bx, [LTop]
  8101 0000364B D1E3                     shl bx, 1
  8102 0000364D 89872077                 mov [GData+bx], ax
  8103                                  
  8104                                  ;-996         if (istoken('[')){
  8105                                  
  8106 00003651 6A5B                     push 91
  8107 00003653 E8FCD8                   call istoken
  8108 00003656 83C402                   add  sp, 2
  8109 00003659 08C0                     or  al, al
  8110 0000365B 0F843D00                 je .dofunc442
  8111                                  
  8112                                  ;-997             istype='&';GType[LTop]='&';expect(T_CONST);expect(']');
  8113                                  
  8114 0000365F B82600                   mov ax, 38
  8115 00003662 A2[2F00]                 mov byte [istype], al
  8116 00003665 B82600                   mov ax, 38
  8117 00003668 8B1E[3A00]               mov bx, [LTop]
  8118 0000366C 8887EC6E                 mov [GType+bx], al
  8119 00003670 680101                   push 257
  8120 00003673 E8FED8                   call expect
  8121 00003676 83C402                   add  sp, 2
  8122 00003679 6A5D                     push 93
  8123 0000367B E8F6D8                   call expect
  8124 0000367E 83C402                   add  sp, 2
  8125                                  
  8126                                  ;-998             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc;
  8127                                  
  8128 00003681 8B46FE                   mov ax, [bp-2]
  8129 00003684 2B06[2B00]               sub ax, [lexval]
  8130 00003688 8946FE                   mov [bp-2], ax
  8131 0000368B 8346FE02                 add  word[bp-2], 2
  8132 0000368F 8B46FE                   mov ax, [bp-2]
  8133 00003692 8B1E[3A00]               mov bx, [LTop]
  8134 00003696 D1E3                     shl bx, 1
  8135 00003698 89872077                 mov [GData+bx], ax
  8136                                  
  8137                                  ;-999             }
  8138                                  
  8139                                  
  8140                                  ;-1000         LTop++;
  8141                                  
  8142                                  .dofunc442:
  8143 0000369C FF06[3A00]               inc  word[LTop]
  8144                                  
  8145                                  ;-1001       } while (istoken(',')); expect(';'); }
  8146                                  
  8147 000036A0 6A2C                     push 44
  8148 000036A2 E8ADD8                   call istoken
  8149 000036A5 83C402                   add  sp, 2
  8150 000036A8 08C0                     or  al, al
  8151 000036AA 0F840300                 je .dofunc443
  8152 000036AE E979FF                   jmp .dofunc440
  8153                                  .dofunc443:
  8154 000036B1 6A3B                     push 59
  8155 000036B3 E8BED8                   call expect
  8156 000036B6 83C402                   add  sp, 2
  8157                                  
  8158                                  ;-1002   if (LTop>LSTART){prs(";\n ENTER  ");
  8159                                  
  8160 000036B9 E965FF                   jmp .dofunc438
  8161                                  .dofunc439:
  8162 000036BC A1[3A00]                 mov ax, [LTop]
  8163 000036BF 3DC800                   cmp ax, 200
  8164 000036C2 0F8E2700                 jle .dofunc444
  8165 000036C6 68[C937]                 push dofunc_4
  8166 000036C9 E813CD                   call prs
  8167 000036CC 83C402                   add  sp, 2
  8168                                  
  8169                                  ;-1003     nloc=mkneg(nloc); prunsign1 (nloc); prs(",0"); }
  8170                                  
  8171 000036CF FF76FE                   push word [bp-2]
  8172 000036D2 E8CCC9                   call mkneg
  8173 000036D5 83C402                   add  sp, 2
  8174 000036D8 8946FE                   mov [bp-2], ax
  8175 000036DB FF76FE                   push word [bp-2]
  8176 000036DE E861CE                   call prunsign1
  8177 000036E1 83C402                   add  sp, 2
  8178 000036E4 68[D537]                 push dofunc_5
  8179 000036E7 E8F5CC                   call prs
  8180 000036EA 83C402                   add  sp, 2
  8181                                  
  8182                                  ;-1004   while(istoken('}')==0)   stmt();
  8183                                  
  8184                                  .dofunc444:
  8185                                  .dofunc445:
  8186 000036ED 6A7D                     push 125
  8187 000036EF E860D8                   call istoken
  8188 000036F2 83C402                   add  sp, 2
  8189 000036F5 83F800                   cmp ax, 0
  8190 000036F8 0F850500                 jne .dofunc446
  8191 000036FC E8B7FA                   call stmt
  8192                                  
  8193                                  ;-1005   if (nreturn) {
  8194                                  
  8195 000036FF EBEC                     jmp .dofunc445
  8196                                  .dofunc446:
  8197 00003701 A1[2700]                 mov ax, [nreturn]
  8198 00003704 08C0                     or  al, al
  8199 00003706 0F841C00                 je .dofunc447
  8200                                  
  8201                                  ;-1006         prs("\n .retn");
  8202                                  
  8203 0000370A 68[D837]                 push dofunc_6
  8204 0000370D E8CFCC                   call prs
  8205 00003710 83C402                   add  sp, 2
  8206                                  
  8207                                  ;-1007         prs(fname);
  8208                                  
  8209 00003713 8D06236E                 lea  ax, [fname]
  8210 00003717 50                       push ax
  8211 00003718 E8C4CC                   call prs
  8212 0000371B 83C402                   add  sp, 2
  8213                                  
  8214                                  ;-1008         prc(':');
  8215                                  
  8216 0000371E 6A3A                     push 58
  8217 00003720 E863CC                   call prc
  8218 00003723 83C402                   add  sp, 2
  8219                                  
  8220                                  ;-1009         }
  8221                                  
  8222                                  
  8223                                  ;-1010   if (LTop > LSTART) prs(" LEAVE");
  8224                                  
  8225                                  .dofunc447:
  8226 00003726 A1[3A00]                 mov ax, [LTop]
  8227 00003729 3DC800                   cmp ax, 200
  8228 0000372C 0F8E0900                 jle .dofunc448
  8229 00003730 68[E137]                 push dofunc_7
  8230 00003733 E8A9CC                   call prs
  8231 00003736 83C402                   add  sp, 2
  8232                                  
  8233                                  ;-1011   prs("\n ret");
  8234                                  
  8235                                  .dofunc448:
  8236 00003739 68[E837]                 push dofunc_8
  8237 0000373C E8A0CC                   call prs
  8238 0000373F 83C402                   add  sp, 2
  8239                                  
  8240                                  ;-1012   *cloc=0; prs(co);
  8241                                  
  8242 00003742 B80000                   mov ax, 0
  8243 00003745 8B1E[1800]               mov  bx, [cloc]
  8244 00003749 8807                     mov  [bx], al
  8245 0000374B 8D06A861                 lea  ax, [co]
  8246 0000374F 50                       push ax
  8247 00003750 E88CCC                   call prs
  8248 00003753 83C402                   add  sp, 2
  8249                                  
  8250                                  ;-1013   maxco1=strlen(co);
  8251                                  
  8252 00003756 8D06A861                 lea  ax, [co]
  8253 0000375A 50                       push ax
  8254 0000375B E8A3CA                   call strlen
  8255 0000375E 83C402                   add  sp, 2
  8256 00003761 A3[1600]                 mov word [maxco1], ax
  8257                                  
  8258                                  ;-1014   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }
  8259                                  
  8260 00003764 A1[1600]                 mov ax, [maxco1]
  8261 00003767 3B06[1400]               cmp ax, [maxco]
  8262 0000376B 0F8E1600                 jle .dofunc449
  8263 0000376F A1[1600]                 mov ax, [maxco1]
  8264 00003772 A3[1400]                 mov word [maxco], ax
  8265 00003775 8D06236E                 lea  ax, [fname]
  8266 00003779 50                       push ax
  8267 0000377A 8D06606D                 lea  ax, [coname]
  8268 0000377E 50                       push ax
  8269 0000377F E8A7CA                   call strcpy
  8270 00003782 83C404                   add  sp, 4
  8271                                  
  8272                                  ;-1015   prs("\nENDP");
  8273                                  
  8274                                  .dofunc449:
  8275 00003785 68[EF37]                 push dofunc_9
  8276 00003788 E854CC                   call prs
  8277 0000378B 83C402                   add  sp, 2
  8278                                  
  8279                                  ;-1016 }
  8280                                  
  8281                                  
  8282                                  ;-1017 
  8283                                  
  8284                                  
  8285                                  ;-1018 char doglobName[IDLENMAX];
  8286 0000378E C9                       LEAVE
  8287 0000378F C3                       ret
  8288 00003790 46756E6374696F6E20-     dofunc_0 db "Function already defined",0
  8289 00003799 616C72656164792064-
  8290 000037A2 6566696E656400     
  8291 000037A9 46756E6374696F6E20-     dofunc_1 db "Function table full",0
  8292 000037B2 7461626C652066756C-
  8293 000037BB 6C00               
  8294 000037BD 5C6E5C6E00              dofunc_2 db "\n\n",0
  8295 000037C2 3A2050524F4300          dofunc_3 db ": PROC",0
  8296 000037C9 3B5C6E20454E544552-     dofunc_4 db ";\n ENTER  ",0
  8297 000037D2 202000             
  8298 000037D5 2C3000                  dofunc_5 db ",0",0
  8299 000037D8 5C6E202E7265746E00      dofunc_6 db "\n .retn",0
  8300 000037E1 204C4541564500          dofunc_7 db " LEAVE",0
  8301 000037E8 5C6E2072657400          dofunc_8 db "\n ret",0
  8302 000037EF 5C6E454E445000          dofunc_9 db "\nENDP",0
  8303                                  ENDP
  8304                                  section .bss
  8305                                  absolute 42466
  8306 0000A5E2 <res 0000000F>          doglobName resb 15
  8307                                  section .text
  8308                                  
  8309                                  ;-1019 int doglob() {
  8310                                  
  8311                                  
  8312                                  doglob: PROC
  8313                                  
  8314                                  ;-1020     int i; int j; int isstrarr; isstrarr=0;
  8315                                  ;
  8316 000037F6 C8060000                 ENTER  6,0
  8317 000037FA B80000                   mov ax, 0
  8318 000037FD 8946FA                   mov [bp-6], ax
  8319                                  
  8320                                  ;-1021   if (GTop >= LSTART) error1("Global table full");
  8321                                  
  8322 00003800 A1[3800]                 mov ax, [GTop]
  8323 00003803 3DC800                   cmp ax, 200 ;unsigned : 1
  8324 00003806 0F8C0900                 jl  .doglob450
  8325 0000380A 68[503B]                 push doglob_0
  8326 0000380D E8F0CD                   call error1
  8327 00003810 83C402                   add  sp, 2
  8328                                  
  8329                                  ;-1022   if (iswidth == 0) error1("no VOID as var type");
  8330                                  
  8331                                  .doglob450:
  8332 00003813 A0[3500]                 mov al, [iswidth]
  8333 00003816 3C00                     cmp al, 0
  8334 00003818 0F850900                 jne .doglob451
  8335 0000381C 68[623B]                 push doglob_1
  8336 0000381F E8DECD                   call error1
  8337 00003822 83C402                   add  sp, 2
  8338                                  
  8339                                  ;-1023   checknamelen();
  8340                                  
  8341                                  .doglob451:
  8342 00003825 E8E7D7                   call checknamelen
  8343                                  
  8344                                  ;-1024   if (checkName() != 0) error1("Variable already defined");
  8345                                  
  8346 00003828 E830D8                   call checkName
  8347 0000382B 3C00                     cmp al, 0
  8348 0000382D 0F840900                 je  .doglob452
  8349 00003831 68[763B]                 push doglob_2
  8350 00003834 E8C9CD                   call error1
  8351 00003837 83C402                   add  sp, 2
  8352                                  
  8353                                  ;-1025   if (istoken('[')) { istype='&';
  8354                                  
  8355                                  .doglob452:
  8356 0000383A 6A5B                     push 91
  8357 0000383C E813D7                   call istoken
  8358 0000383F 83C402                   add  sp, 2
  8359 00003842 08C0                     or  al, al
  8360 00003844 0F84E201                 je .doglob453
  8361 00003848 B82600                   mov ax, 38
  8362 0000384B A2[2F00]                 mov byte [istype], al
  8363                                  
  8364                                  ;-1026     if (istoken(T_CONST)) {
  8365                                  
  8366 0000384E 680101                   push 257
  8367 00003851 E8FED6                   call istoken
  8368 00003854 83C402                   add  sp, 2
  8369 00003857 08C0                     or  al, al
  8370 00003859 0F84C200                 je .doglob454
  8371                                  
  8372                                  ;-1027       prs("\nsection .bss\nabsolute ");
  8373                                  
  8374 0000385D 68[8F3B]                 push doglob_3
  8375 00003860 E87CCB                   call prs
  8376 00003863 83C402                   add  sp, 2
  8377                                  
  8378                                  ;-1028       prunsign1(orgData);
  8379                                  
  8380 00003866 FF36[1200]               push word [orgData]
  8381 0000386A E8D5CC                   call prunsign1
  8382 0000386D 83C402                   add  sp, 2
  8383                                  
  8384                                  ;-1029       prs("\n"); prs(symbol);
  8385                                  
  8386 00003870 68[A93B]                 push doglob_4
  8387 00003873 E869CB                   call prs
  8388 00003876 83C402                   add  sp, 2
  8389 00003879 8D06A36D                 lea  ax, [symbol]
  8390 0000387D 50                       push ax
  8391 0000387E E85ECB                   call prs
  8392 00003881 83C402                   add  sp, 2
  8393                                  
  8394                                  ;-1030       if (iswidth==1) prs(" resb ");
  8395                                  
  8396 00003884 A0[3500]                 mov al, [iswidth]
  8397 00003887 3C01                     cmp al, 1
  8398 00003889 0F850900                 jne .doglob455
  8399 0000388D 68[AC3B]                 push doglob_5
  8400 00003890 E84CCB                   call prs
  8401 00003893 83C402                   add  sp, 2
  8402                                  
  8403                                  ;-1031       if (iswidth==2) prs(" resw ");
  8404                                  
  8405                                  .doglob455:
  8406 00003896 A0[3500]                 mov al, [iswidth]
  8407 00003899 3C02                     cmp al, 2
  8408 0000389B 0F850900                 jne .doglob456
  8409 0000389F 68[B33B]                 push doglob_6
  8410 000038A2 E83ACB                   call prs
  8411 000038A5 83C402                   add  sp, 2
  8412                                  
  8413                                  ;-1032       if (iswidth==4) prs(" resd ");
  8414                                  
  8415                                  .doglob456:
  8416 000038A8 A0[3500]                 mov al, [iswidth]
  8417 000038AB 3C04                     cmp al, 4
  8418 000038AD 0F850900                 jne .doglob457
  8419 000038B1 68[BA3B]                 push doglob_7
  8420 000038B4 E828CB                   call prs
  8421 000038B7 83C402                   add  sp, 2
  8422                                  
  8423                                  ;-1033       prunsign1(lexval);
  8424                                  
  8425                                  .doglob457:
  8426 000038BA FF36[2B00]               push word [lexval]
  8427 000038BE E881CC                   call prunsign1
  8428 000038C1 83C402                   add  sp, 2
  8429                                  
  8430                                  ;-1034       prs("\nsection .text");
  8431                                  
  8432 000038C4 68[C13B]                 push doglob_8
  8433 000038C7 E815CB                   call prs
  8434 000038CA 83C402                   add  sp, 2
  8435                                  
  8436                                  ;-1035       orgData=orgData+lexval;
  8437                                  
  8438 000038CD A1[1200]                 mov ax, [orgData]
  8439 000038D0 0306[2B00]               add ax, [lexval]
  8440 000038D4 A3[1200]                 mov word [orgData], ax
  8441                                  
  8442                                  ;-1036       if (iswidth==2) orgData=orgData+lexval;
  8443                                  
  8444 000038D7 A0[3500]                 mov al, [iswidth]
  8445 000038DA 3C02                     cmp al, 2
  8446 000038DC 0F850A00                 jne .doglob458
  8447 000038E0 A1[1200]                 mov ax, [orgData]
  8448 000038E3 0306[2B00]               add ax, [lexval]
  8449 000038E7 A3[1200]                 mov word [orgData], ax
  8450                                  
  8451                                  ;-1037       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}
  8452                                  
  8453                                  .doglob458:
  8454 000038EA A0[3500]                 mov al, [iswidth]
  8455 000038ED 3C04                     cmp al, 4
  8456 000038EF 0F851400                 jne .doglob459
  8457 000038F3 A1[2B00]                 mov ax, [lexval]
  8458 000038F6 BB0300                   mov bx, 3
  8459 000038F9 F7E3                     mul bx
  8460 000038FB 8946FE                   mov [bp-2], ax
  8461 000038FE A1[1200]                 mov ax, [orgData]
  8462 00003901 0346FE                   add ax, [bp-2]
  8463 00003904 A3[1200]                 mov word [orgData], ax
  8464                                  
  8465                                  ;-1038       GData[GTop]=lexval; expect(']');
  8466                                  
  8467                                  .doglob459:
  8468 00003907 A1[2B00]                 mov ax, [lexval]
  8469 0000390A 8B1E[3800]               mov bx, [GTop]
  8470 0000390E D1E3                     shl bx, 1
  8471 00003910 89872077                 mov [GData+bx], ax
  8472 00003914 6A5D                     push 93
  8473 00003916 E85BD6                   call expect
  8474 00003919 83C402                   add  sp, 2
  8475                                  
  8476                                  ;-1039     }else { expect(']');
  8477                                  
  8478 0000391C E90801                   jmp .doglob460
  8479                                  .doglob454:
  8480 0000391F 6A5D                     push 93
  8481 00003921 E850D6                   call expect
  8482 00003924 83C402                   add  sp, 2
  8483                                  
  8484                                  ;-1040       if (iswidth != 1) error1("Only ByteArray allowed");
  8485                                  
  8486 00003927 A0[3500]                 mov al, [iswidth]
  8487 0000392A 3C01                     cmp al, 1
  8488 0000392C 0F840900                 je  .doglob461
  8489 00003930 68[D13B]                 push doglob_9
  8490 00003933 E8CACC                   call error1
  8491 00003936 83C402                   add  sp, 2
  8492                                  
  8493                                  ;-1041       prs("\n"); prs(symbol); prs(" db ");
  8494                                  
  8495                                  .doglob461:
  8496 00003939 68[E83B]                 push doglob_10
  8497 0000393C E8A0CA                   call prs
  8498 0000393F 83C402                   add  sp, 2
  8499 00003942 8D06A36D                 lea  ax, [symbol]
  8500 00003946 50                       push ax
  8501 00003947 E895CA                   call prs
  8502 0000394A 83C402                   add  sp, 2
  8503 0000394D 68[EB3B]                 push doglob_11
  8504 00003950 E88CCA                   call prs
  8505 00003953 83C402                   add  sp, 2
  8506                                  
  8507                                  ;-1042       isstrarr=1; strcpy(doglobName, symbol);
  8508                                  
  8509 00003956 B80100                   mov ax, 1
  8510 00003959 8946FA                   mov [bp-6], ax
  8511 0000395C 8D06A36D                 lea  ax, [symbol]
  8512 00003960 50                       push ax
  8513 00003961 8D06E2A5                 lea  ax, [doglobName]
  8514 00003965 50                       push ax
  8515 00003966 E8C0C8                   call strcpy
  8516 00003969 83C404                   add  sp, 4
  8517                                  
  8518                                  ;-1043       expect('=');
  8519                                  
  8520 0000396C 6A3D                     push 61
  8521 0000396E E803D6                   call expect
  8522 00003971 83C402                   add  sp, 2
  8523                                  
  8524                                  ;-1044       if (istoken(T_STRING)) {
  8525                                  
  8526 00003974 680201                   push 258
  8527 00003977 E8D8D5                   call istoken
  8528 0000397A 83C402                   add  sp, 2
  8529 0000397D 08C0                     or  al, al
  8530 0000397F 0F844200                 je .doglob462
  8531                                  
  8532                                  ;-1045         prc(34); prscomment(symbol); prc(34); prs(",0");
  8533                                  
  8534 00003983 6A22                     push 34
  8535 00003985 E8FEC9                   call prc
  8536 00003988 83C402                   add  sp, 2
  8537 0000398B 8D06A36D                 lea  ax, [symbol]
  8538 0000398F 50                       push ax
  8539 00003990 E81ECA                   call prscomment
  8540 00003993 83C402                   add  sp, 2
  8541 00003996 6A22                     push 34
  8542 00003998 E8EBC9                   call prc
  8543 0000399B 83C402                   add  sp, 2
  8544 0000399E 68[F03B]                 push doglob_12
  8545 000039A1 E83BCA                   call prs
  8546 000039A4 83C402                   add  sp, 2
  8547                                  
  8548                                  ;-1046         i=strlen(symbol); GData[GTop]=i; }
  8549                                  
  8550 000039A7 8D06A36D                 lea  ax, [symbol]
  8551 000039AB 50                       push ax
  8552 000039AC E852C8                   call strlen
  8553 000039AF 83C402                   add  sp, 2
  8554 000039B2 8946FE                   mov [bp-2], ax
  8555 000039B5 8B46FE                   mov ax, [bp-2]
  8556 000039B8 8B1E[3800]               mov bx, [GTop]
  8557 000039BC D1E3                     shl bx, 1
  8558 000039BE 89872077                 mov [GData+bx], ax
  8559                                  
  8560                                  ;-1047       else if (istoken('{' )) { i=0;
  8561                                  
  8562 000039C2 E96200                   jmp .doglob463
  8563                                  .doglob462:
  8564 000039C5 6A7B                     push 123
  8565 000039C7 E888D5                   call istoken
  8566 000039CA 83C402                   add  sp, 2
  8567 000039CD 08C0                     or  al, al
  8568 000039CF 0F844B00                 je .doglob464
  8569 000039D3 B80000                   mov ax, 0
  8570 000039D6 8946FE                   mov [bp-2], ax
  8571                                  
  8572                                  ;-1048         do { if(i) prc(',');
  8573                                  
  8574                                  .doglob465:
  8575 000039D9 8B46FE                   mov ax, [bp-2]
  8576 000039DC 08C0                     or  al, al
  8577 000039DE 0F840800                 je .doglob466
  8578 000039E2 6A2C                     push 44
  8579 000039E4 E89FC9                   call prc
  8580 000039E7 83C402                   add  sp, 2
  8581                                  
  8582                                  ;-1049           expect(T_CONST); prunsign1(lexval); i=1; }
  8583                                  
  8584                                  .doglob466:
  8585 000039EA 680101                   push 257
  8586 000039ED E884D5                   call expect
  8587 000039F0 83C402                   add  sp, 2
  8588 000039F3 FF36[2B00]               push word [lexval]
  8589 000039F7 E848CB                   call prunsign1
  8590 000039FA 83C402                   add  sp, 2
  8591 000039FD B80100                   mov ax, 1
  8592 00003A00 8946FE                   mov [bp-2], ax
  8593                                  
  8594                                  ;-1050         while (istoken(',')); expect('}'); }
  8595                                  
  8596 00003A03 6A2C                     push 44
  8597 00003A05 E84AD5                   call istoken
  8598 00003A08 83C402                   add  sp, 2
  8599 00003A0B 08C0                     or  al, al
  8600 00003A0D 0F840200                 je .doglob467
  8601 00003A11 EBC6                     jmp .doglob465
  8602                                  .doglob467:
  8603 00003A13 6A7D                     push 125
  8604 00003A15 E85CD5                   call expect
  8605 00003A18 83C402                   add  sp, 2
  8606                                  
  8607                                  ;-1051       else error1("String or number array expected");
  8608                                  
  8609 00003A1B E90900                   jmp .doglob468
  8610                                  .doglob464:
  8611 00003A1E 68[F33B]                 push doglob_13
  8612 00003A21 E8DCCB                   call error1
  8613 00003A24 83C402                   add  sp, 2
  8614                                  
  8615                                  ;-1052       };
  8616                                  
  8617                                  .doglob468:
  8618                                  .doglob463:
  8619                                  .doglob460:
  8620                                  
  8621                                  ;-1053   }else { //expect('=');
  8622                                  
  8623 00003A27 E99E00                   jmp .doglob469
  8624                                  .doglob453:
  8625                                  
  8626                                  ;-1054     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");
  8627                                  
  8628 00003A2A 68[133C]                 push doglob_14
  8629 00003A2D E8AFC9                   call prs
  8630 00003A30 83C402                   add  sp, 2
  8631 00003A33 8D06A36D                 lea  ax, [symbol]
  8632 00003A37 50                       push ax
  8633 00003A38 E8A4C9                   call prs
  8634 00003A3B 83C402                   add  sp, 2
  8635 00003A3E A0[2F00]                 mov al, [istype]
  8636 00003A41 3C2A                     cmp al, 42
  8637 00003A43 0F850C00                 jne .doglob470
  8638 00003A47 68[163C]                 push doglob_15
  8639 00003A4A E892C9                   call prs
  8640 00003A4D 83C402                   add  sp, 2
  8641                                  
  8642                                  ;-1055     else {
  8643                                  
  8644 00003A50 E93300                   jmp .doglob471
  8645                                  .doglob470:
  8646                                  
  8647                                  ;-1056       if      (iswidth==1) prs(" db ");
  8648                                  
  8649 00003A53 A0[3500]                 mov al, [iswidth]
  8650 00003A56 3C01                     cmp al, 1
  8651 00003A58 0F850C00                 jne .doglob472
  8652 00003A5C 68[1B3C]                 push doglob_16
  8653 00003A5F E87DC9                   call prs
  8654 00003A62 83C402                   add  sp, 2
  8655                                  
  8656                                  ;-1057       else if (iswidth==2) prs(" dw ");
  8657                                  
  8658 00003A65 E91E00                   jmp .doglob473
  8659                                  .doglob472:
  8660 00003A68 A0[3500]                 mov al, [iswidth]
  8661 00003A6B 3C02                     cmp al, 2
  8662 00003A6D 0F850C00                 jne .doglob474
  8663 00003A71 68[203C]                 push doglob_17
  8664 00003A74 E868C9                   call prs
  8665 00003A77 83C402                   add  sp, 2
  8666                                  
  8667                                  ;-1058       else                 prs(" dd ");
  8668                                  
  8669 00003A7A E90900                   jmp .doglob475
  8670                                  .doglob474:
  8671 00003A7D 68[253C]                 push doglob_18
  8672 00003A80 E85CC9                   call prs
  8673 00003A83 83C402                   add  sp, 2
  8674                                  
  8675                                  ;-1059     }
  8676                                  
  8677                                  .doglob475:
  8678                                  .doglob473:
  8679                                  
  8680                                  ;-1060     if(istoken('-')) prc('-');
  8681                                  
  8682                                  .doglob471:
  8683 00003A86 6A2D                     push 45
  8684 00003A88 E8C7D4                   call istoken
  8685 00003A8B 83C402                   add  sp, 2
  8686 00003A8E 08C0                     or  al, al
  8687 00003A90 0F840800                 je .doglob476
  8688 00003A94 6A2D                     push 45
  8689 00003A96 E8EDC8                   call prc
  8690 00003A99 83C402                   add  sp, 2
  8691                                  
  8692                                  ;-1061     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }
  8693                                  
  8694                                  .doglob476:
  8695 00003A9C 6A3D                     push 61
  8696 00003A9E E8B1D4                   call istoken
  8697 00003AA1 83C402                   add  sp, 2
  8698 00003AA4 08C0                     or  al, al
  8699 00003AA6 0F841600                 je .doglob477
  8700 00003AAA 680101                   push 257
  8701 00003AAD E8C4D4                   call expect
  8702 00003AB0 83C402                   add  sp, 2
  8703 00003AB3 FF36[2B00]               push word [lexval]
  8704 00003AB7 E888CA                   call prunsign1
  8705 00003ABA 83C402                   add  sp, 2
  8706                                  
  8707                                  ;-1062     else prunsign1(0); }
  8708                                  
  8709 00003ABD E90800                   jmp .doglob478
  8710                                  .doglob477:
  8711 00003AC0 6A00                     push 0
  8712 00003AC2 E87DCA                   call prunsign1
  8713 00003AC5 83C402                   add  sp, 2
  8714                                  .doglob478:
  8715                                  
  8716                                  ;-1063   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;
  8717                                  
  8718                                  .doglob469:
  8719 00003AC8 A0[3200]                 mov al, [issign]
  8720 00003ACB 8B1E[3800]               mov bx, [GTop]
  8721 00003ACF 88871870                 mov [GSign+bx], al
  8722 00003AD3 A0[3500]                 mov al, [iswidth]
  8723 00003AD6 8B1E[3800]               mov bx, [GTop]
  8724 00003ADA 88874471                 mov [GWidth+bx], al
  8725 00003ADE A0[2F00]                 mov al, [istype]
  8726 00003AE1 8B1E[3800]               mov bx, [GTop]
  8727 00003AE5 8887EC6E                 mov [GType+bx], al
  8728                                  
  8729                                  ;-1064   GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  8730                                  
  8731 00003AE9 A1[4000]                 mov ax, [lineno]
  8732 00003AEC 83E801                   sub ax, 1
  8733 00003AEF 8B1E[3800]               mov bx, [GTop]
  8734 00003AF3 D1E3                     shl bx, 1
  8735 00003AF5 89877072                 mov [GAdr+bx], ax
  8736 00003AF9 B80000                   mov ax, 0
  8737 00003AFC 8B1E[3800]               mov bx, [GTop]
  8738 00003B00 D1E3                     shl bx, 1
  8739 00003B02 8987C874                 mov [GUsed+bx], ax
  8740                                  
  8741                                  ;-1065   pt=adrF(GNameField, GTop);
  8742                                  
  8743 00003B06 FF36[3800]               push word [GTop]
  8744 00003B0A 8D067879                 lea  ax, [GNameField]
  8745 00003B0E 50                       push ax
  8746 00003B0F E8DDCC                   call adrF
  8747 00003B12 83C404                   add  sp, 4
  8748 00003B15 A3[4200]                 mov word [pt], ax
  8749                                  
  8750                                  ;-1066   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);
  8751                                  
  8752 00003B18 8B46FA                   mov ax, [bp-6]
  8753 00003B1B 08C0                     or  al, al
  8754 00003B1D 0F841200                 je .doglob479
  8755 00003B21 8D06E2A5                 lea  ax, [doglobName]
  8756 00003B25 50                       push ax
  8757 00003B26 FF36[4200]               push word [pt]
  8758 00003B2A E8FCC6                   call strcpy
  8759 00003B2D 83C404                   add  sp, 4
  8760 00003B30 E90F00                   jmp .doglob480
  8761                                  .doglob479:
  8762 00003B33 8D06A36D                 lea  ax, [symbol]
  8763 00003B37 50                       push ax
  8764 00003B38 FF36[4200]               push word [pt]
  8765 00003B3C E8EAC6                   call strcpy
  8766 00003B3F 83C404                   add  sp, 4
  8767                                  
  8768                                  ;-1067   GTop++; expect(';'); }
  8769                                  
  8770                                  .doglob480:
  8771 00003B42 FF06[3800]               inc  word[GTop]
  8772 00003B46 6A3B                     push 59
  8773 00003B48 E829D4                   call expect
  8774 00003B4B 83C402                   add  sp, 2
  8775                                  
  8776                                  ;-1068 
  8777                                  
  8778                                  
  8779                                  ;-1069 
  8780                                  
  8781                                  
  8782                                  ;-1070 int dodefine() {
  8783 00003B4E C9                       LEAVE
  8784 00003B4F C3                       ret
  8785 00003B50 476C6F62616C207461-     doglob_0 db "Global table full",0
  8786 00003B59 626C652066756C6C00 
  8787 00003B62 6E6F20564F49442061-     doglob_1 db "no VOID as var type",0
  8788 00003B6B 732076617220747970-
  8789 00003B74 6500               
  8790 00003B76 5661726961626C6520-     doglob_2 db "Variable already defined",0
  8791 00003B7F 616C72656164792064-
  8792 00003B88 6566696E656400     
  8793 00003B8F 5C6E73656374696F6E-     doglob_3 db "\nsection .bss\nabsolute ",0
  8794 00003B98 202E6273735C6E6162-
  8795 00003BA1 736F6C7574652000   
  8796 00003BA9 5C6E00                  doglob_4 db "\n",0
  8797 00003BAC 20726573622000          doglob_5 db " resb ",0
  8798 00003BB3 20726573772000          doglob_6 db " resw ",0
  8799 00003BBA 20726573642000          doglob_7 db " resd ",0
  8800 00003BC1 5C6E73656374696F6E-     doglob_8 db "\nsection .text",0
  8801 00003BCA 202E7465787400     
  8802 00003BD1 4F6E6C792042797465-     doglob_9 db "Only ByteArray allowed",0
  8803 00003BDA 417272617920616C6C-
  8804 00003BE3 6F77656400         
  8805 00003BE8 5C6E00                  doglob_10 db "\n",0
  8806 00003BEB 2064622000              doglob_11 db " db ",0
  8807 00003BF0 2C3000                  doglob_12 db ",0",0
  8808 00003BF3 537472696E67206F72-     doglob_13 db "String or number array expected",0
  8809 00003BFC 206E756D6265722061-
  8810 00003C05 727261792065787065-
  8811 00003C0E 6374656400         
  8812 00003C13 5C6E00                  doglob_14 db "\n",0
  8813 00003C16 2064772000              doglob_15 db " dw ",0
  8814 00003C1B 2064622000              doglob_16 db " db ",0
  8815 00003C20 2064772000              doglob_17 db " dw ",0
  8816 00003C25 2064642000              doglob_18 db " dd ",0
  8817                                  ENDP
  8818                                  
  8819                                  dodefine: PROC
  8820                                  
  8821                                  ;-1071     int i; int j; int fdtemp;
  8822                                  
  8823                                  
  8824                                  ;-1072     if (eqstr(symbol, "ORGDATA")) {
  8825                                  ;
  8826 00003C2A C8060000                 ENTER  6,0
  8827 00003C2E 68[193D]                 push dodefine_0
  8828 00003C31 8D06A36D                 lea  ax, [symbol]
  8829 00003C35 50                       push ax
  8830 00003C36 E826C6                   call eqstr
  8831 00003C39 83C404                   add  sp, 4
  8832 00003C3C 08C0                     or  al, al
  8833 00003C3E 0F841500                 je .dodefine481
  8834                                  
  8835                                  ;-1073         token=getlex();
  8836                                  
  8837 00003C42 E85BCC                   call getlex
  8838 00003C45 A3[1E00]                 mov word [token], ax
  8839                                  
  8840                                  ;-1074         ORGDATAORIG=lexval;
  8841                                  
  8842 00003C48 A1[2B00]                 mov ax, [lexval]
  8843 00003C4B A3[1000]                 mov word [ORGDATAORIG], ax
  8844                                  
  8845                                  ;-1075         orgData=lexval;
  8846                                  
  8847 00003C4E A1[2B00]                 mov ax, [lexval]
  8848 00003C51 A3[1200]                 mov word [orgData], ax
  8849                                  
  8850                                  ;-1076         return;
  8851                                  
  8852 00003C54 E9C000                   jmp .retndodefine
  8853                                  
  8854                                  ;-1077     }
  8855                                  
  8856                                  
  8857                                  ;-1078     expect(T_NAME);
  8858                                  
  8859                                  .dodefine481:
  8860 00003C57 680001                   push 256
  8861 00003C5A E817D3                   call expect
  8862 00003C5D 83C402                   add  sp, 2
  8863                                  
  8864                                  ;-1079     if (token==T_CONST) {
  8865                                  
  8866 00003C60 A1[1E00]                 mov ax, [token]
  8867 00003C63 3D0101                   cmp ax, 257
  8868 00003C66 0F85AD00                 jne .dodefine482
  8869                                  
  8870                                  ;-1080         if (GTop >= LSTART) error1("global table (define) full");
  8871                                  
  8872 00003C6A A1[3800]                 mov ax, [GTop]
  8873 00003C6D 3DC800                   cmp ax, 200 ;unsigned : 1
  8874 00003C70 0F8C0900                 jl  .dodefine483
  8875 00003C74 68[213D]                 push dodefine_1
  8876 00003C77 E886C9                   call error1
  8877 00003C7A 83C402                   add  sp, 2
  8878                                  
  8879                                  ;-1081         i=strlen(symbol);
  8880                                  
  8881                                  .dodefine483:
  8882 00003C7D 8D06A36D                 lea  ax, [symbol]
  8883 00003C81 50                       push ax
  8884 00003C82 E87CC5                   call strlen
  8885 00003C85 83C402                   add  sp, 2
  8886 00003C88 8946FE                   mov [bp-2], ax
  8887                                  
  8888                                  ;-1082         if (i>15) error1("Define name longer 15 char");
  8889                                  
  8890 00003C8B 8B46FE                   mov ax, [bp-2]
  8891 00003C8E 83F80F                   cmp ax, 15
  8892 00003C91 0F8E0900                 jle .dodefine484
  8893 00003C95 68[3C3D]                 push dodefine_2
  8894 00003C98 E865C9                   call error1
  8895 00003C9B 83C402                   add  sp, 2
  8896                                  
  8897                                  ;-1083         GSign [GTop]='U';
  8898                                  
  8899                                  .dodefine484:
  8900 00003C9E B85500                   mov ax, 85
  8901 00003CA1 8B1E[3800]               mov bx, [GTop]
  8902 00003CA5 88871870                 mov [GSign+bx], al
  8903                                  
  8904                                  ;-1084         GWidth[GTop]=1;
  8905                                  
  8906 00003CA9 B80100                   mov ax, 1
  8907 00003CAC 8B1E[3800]               mov bx, [GTop]
  8908 00003CB0 88874471                 mov [GWidth+bx], al
  8909                                  
  8910                                  ;-1085         GType [GTop]='#';
  8911                                  
  8912 00003CB4 B82300                   mov ax, 35
  8913 00003CB7 8B1E[3800]               mov bx, [GTop]
  8914 00003CBB 8887EC6E                 mov [GType+bx], al
  8915                                  
  8916                                  ;-1086         GAdr [GTop]=lineno-1;
  8917                                  
  8918 00003CBF A1[4000]                 mov ax, [lineno]
  8919 00003CC2 83E801                   sub ax, 1
  8920 00003CC5 8B1E[3800]               mov bx, [GTop]
  8921 00003CC9 D1E3                     shl bx, 1
  8922 00003CCB 89877072                 mov [GAdr+bx], ax
  8923                                  
  8924                                  ;-1087         GUsed [GTop]=0;
  8925                                  
  8926 00003CCF B80000                   mov ax, 0
  8927 00003CD2 8B1E[3800]               mov bx, [GTop]
  8928 00003CD6 D1E3                     shl bx, 1
  8929 00003CD8 8987C874                 mov [GUsed+bx], ax
  8930                                  
  8931                                  ;-1088         pt=adrF(GNameField, GTop);
  8932                                  
  8933 00003CDC FF36[3800]               push word [GTop]
  8934 00003CE0 8D067879                 lea  ax, [GNameField]
  8935 00003CE4 50                       push ax
  8936 00003CE5 E807CB                   call adrF
  8937 00003CE8 83C404                   add  sp, 4
  8938 00003CEB A3[4200]                 mov word [pt], ax
  8939                                  
  8940                                  ;-1089         strcpy(pt, symbol);
  8941                                  
  8942 00003CEE 8D06A36D                 lea  ax, [symbol]
  8943 00003CF2 50                       push ax
  8944 00003CF3 FF36[4200]               push word [pt]
  8945 00003CF7 E82FC5                   call strcpy
  8946 00003CFA 83C404                   add  sp, 4
  8947                                  
  8948                                  ;-1090         GData[GTop]=lexval;
  8949                                  
  8950 00003CFD A1[2B00]                 mov ax, [lexval]
  8951 00003D00 8B1E[3800]               mov bx, [GTop]
  8952 00003D04 D1E3                     shl bx, 1
  8953 00003D06 89872077                 mov [GData+bx], ax
  8954                                  
  8955                                  ;-1091         expect(T_CONST);
  8956                                  
  8957 00003D0A 680101                   push 257
  8958 00003D0D E864D2                   call expect
  8959 00003D10 83C402                   add  sp, 2
  8960                                  
  8961                                  ;-1092         GTop++;
  8962                                  
  8963 00003D13 FF06[3800]               inc  word[GTop]
  8964                                  
  8965                                  ;-1093     }
  8966                                  
  8967                                  
  8968                                  ;-1094 }
  8969                                  
  8970                                  .dodefine482:
  8971                                  
  8972                                  ;-1095 
  8973                                  
  8974                                  
  8975                                  ;-1096 int parse() {
  8976                                  
  8977 00003D17 C9                       .retndodefine: LEAVE
  8978 00003D18 C3                       ret
  8979 00003D19 4F52474441544100        dodefine_0 db "ORGDATA",0
  8980 00003D21 676C6F62616C207461-     dodefine_1 db "global table (define) full",0
  8981 00003D2A 626C65202864656669-
  8982 00003D33 6E65292066756C6C00 
  8983 00003D3C 446566696E65206E61-     dodefine_2 db "Define name longer 15 char",0
  8984 00003D45 6D65206C6F6E676572-
  8985 00003D4E 203135206368617200 
  8986                                  ENDP
  8987                                  
  8988                                  parse: PROC
  8989                                  
  8990                                  ;-1097     token=getlex();
  8991                                  
  8992 00003D57 E846CB                   call getlex
  8993 00003D5A A3[1E00]                 mov word [token], ax
  8994                                  
  8995                                  ;-1098     do {
  8996                                  
  8997                                  .parse485:
  8998                                  
  8999                                  ;-1099         if (token <= 0) return 1;
  9000                                  
  9001 00003D5D A1[1E00]                 mov ax, [token]
  9002 00003D60 83F800                   cmp ax, 0
  9003 00003D63 0F8F0600                 jg  .parse486
  9004 00003D67 B80100                   mov ax, 1
  9005 00003D6A E95000                   jmp .retnparse
  9006                                  
  9007                                  ;-1100         if (istoken('#')) {
  9008                                  
  9009                                  .parse486:
  9010 00003D6D 6A23                     push 35
  9011 00003D6F E8E0D1                   call istoken
  9012 00003D72 83C402                   add  sp, 2
  9013 00003D75 08C0                     or  al, al
  9014 00003D77 0F842100                 je .parse487
  9015                                  
  9016                                  ;-1101              if (istoken(T_DEFINE))  dodefine();
  9017                                  
  9018 00003D7B 68FF01                   push 511
  9019 00003D7E E8D1D1                   call istoken
  9020 00003D81 83C402                   add  sp, 2
  9021 00003D84 08C0                     or  al, al
  9022 00003D86 0F840600                 je .parse488
  9023 00003D8A E89DFE                   call dodefine
  9024                                  
  9025                                  ;-1102              else error1("define expected");
  9026                                  
  9027 00003D8D E90900                   jmp .parse489
  9028                                  .parse488:
  9029 00003D90 68[BE3D]                 push parse_0
  9030 00003D93 E86AC8                   call error1
  9031 00003D96 83C402                   add  sp, 2
  9032                                  
  9033                                  ;-1103         }
  9034                                  
  9035                                  .parse489:
  9036                                  
  9037                                  ;-1104     else{
  9038                                  
  9039 00003D99 E91600                   jmp .parse490
  9040                                  .parse487:
  9041                                  
  9042                                  ;-1105         typeName();
  9043                                  
  9044 00003D9C E8BDD3                   call typeName
  9045                                  
  9046                                  ;-1106         if (token=='(') dofunc();
  9047                                  
  9048 00003D9F A1[1E00]                 mov ax, [token]
  9049 00003DA2 83F828                   cmp ax, 40
  9050 00003DA5 0F850600                 jne .parse491
  9051 00003DA9 E840F7                   call dofunc
  9052                                  
  9053                                  ;-1107         else doglob(); }
  9054                                  
  9055 00003DAC E90300                   jmp .parse492
  9056                                  .parse491:
  9057 00003DAF E844FA                   call doglob
  9058                                  .parse492:
  9059                                  
  9060                                  ;-1108     } while(1);
  9061                                  
  9062                                  .parse490:
  9063 00003DB2 B80100                   mov ax, 1
  9064 00003DB5 08C0                     or  al, al
  9065 00003DB7 0F840200                 je .parse493
  9066 00003DBB EBA0                     jmp .parse485
  9067                                  .parse493:
  9068                                  
  9069                                  ;-1109 }
  9070                                  
  9071                                  
  9072                                  ;-1110 
  9073                                  
  9074                                  
  9075                                  ;-1111 char *arglen=0x80; char *argv=0x82;
  9076                                  
  9077                                   .retnparse:
  9078 00003DBD C3                       ret
  9079 00003DBE 646566696E65206578-     parse_0 db "define expected",0
  9080 00003DC7 70656374656400     
  9081                                  ENDP
  9082 00003DCE 8000                    arglen dw 128
  9083 00003DD0 8200                    argv dw 130
  9084                                  
  9085                                  ;-1112 int main() {
  9086                                  
  9087                                  
  9088                                  main: PROC
  9089                                  
  9090                                  ;-1113     int arglen1; unsigned int i; char *c;
  9091                                  
  9092                                  
  9093                                  ;-1114     arglen1=*arglen;
  9094                                  ;
  9095 00003DD2 C8060000                 ENTER  6,0
  9096 00003DD6 8B1E[CE3D]               mov bx, [arglen]
  9097 00003DDA 8A07                     mov al, [bx]
  9098 00003DDC B400                     mov ah, 0
  9099 00003DDE 8946FE                   mov [bp-2], ax
  9100                                  
  9101                                  ;-1115     if (arglen1 == 0) {
  9102                                  
  9103 00003DE1 8B46FE                   mov ax, [bp-2]
  9104 00003DE4 83F800                   cmp ax, 0
  9105 00003DE7 0F851C00                 jne .main494
  9106                                  
  9107                                  ;-1116         cputs(Version1);
  9108                                  
  9109 00003DEB 8D06[0300]               lea  ax, [Version1]
  9110 00003DEF 50                       push ax
  9111 00003DF0 E880C2                   call cputs
  9112 00003DF3 83C402                   add  sp, 2
  9113                                  
  9114                                  ;-1117         cputs(" Usage: A.COM in_file[.C]: ");
  9115                                  
  9116 00003DF6 68[8440]                 push main_0
  9117 00003DF9 E877C2                   call cputs
  9118 00003DFC 83C402                   add  sp, 2
  9119                                  
  9120                                  ;-1118         exitR(3);
  9121                                  
  9122 00003DFF 6A03                     push 3
  9123 00003E01 E8E1C2                   call exitR
  9124 00003E04 83C402                   add  sp, 2
  9125                                  
  9126                                  ;-1119         }
  9127                                  
  9128                                  
  9129                                  ;-1120     i=arglen1+129;
  9130                                  
  9131                                  .main494:
  9132 00003E07 8B46FE                   mov ax, [bp-2]
  9133 00003E0A 058100                   add ax, 129
  9134 00003E0D 8946FC                   mov [bp-4], ax
  9135                                  
  9136                                  ;-1121     *i=0;
  9137                                  
  9138 00003E10 B80000                   mov ax, 0
  9139 00003E13 8B5EFC                   mov  bx, [bp-4]
  9140 00003E16 8907                     mov  [bx], ax
  9141                                  
  9142                                  ;-1122     arglen1--;
  9143                                  
  9144 00003E18 FF4EFE                   dec  word[bp-2]
  9145                                  
  9146                                  ;-1123     toupper(argv);
  9147                                  
  9148 00003E1B FF36[D03D]               push word [argv]
  9149 00003E1F E8AEC4                   call toupper
  9150 00003E22 83C402                   add  sp, 2
  9151                                  
  9152                                  ;-1124     strcpy(namein, argv);
  9153                                  
  9154 00003E25 FF36[D03D]               push word [argv]
  9155 00003E29 8D06666E                 lea  ax, [namein]
  9156 00003E2D 50                       push ax
  9157 00003E2E E8F8C3                   call strcpy
  9158 00003E31 83C404                   add  sp, 4
  9159                                  
  9160                                  ;-1125     if (instr1(namein, '.') == 0) strcat1(namein, ".C");
  9161                                  
  9162 00003E34 6A2E                     push 46
  9163 00003E36 8D06666E                 lea  ax, [namein]
  9164 00003E3A 50                       push ax
  9165 00003E3B E8D5C4                   call instr1
  9166 00003E3E 83C404                   add  sp, 4
  9167 00003E41 83F800                   cmp ax, 0
  9168 00003E44 0F850E00                 jne .main495
  9169 00003E48 68[A040]                 push main_1
  9170 00003E4B 8D06666E                 lea  ax, [namein]
  9171 00003E4F 50                       push ax
  9172 00003E50 E858C4                   call strcat1
  9173 00003E53 83C404                   add  sp, 4
  9174                                  
  9175                                  ;-1126     strcpy(namelst, namein);
  9176                                  
  9177                                  .main495:
  9178 00003E56 8D06666E                 lea  ax, [namein]
  9179 00003E5A 50                       push ax
  9180 00003E5B 8D06A96E                 lea  ax, [namelst]
  9181 00003E5F 50                       push ax
  9182 00003E60 E8C6C3                   call strcpy
  9183 00003E63 83C404                   add  sp, 4
  9184                                  
  9185                                  ;-1127     i=strlen(namelst);
  9186                                  
  9187 00003E66 8D06A96E                 lea  ax, [namelst]
  9188 00003E6A 50                       push ax
  9189 00003E6B E893C3                   call strlen
  9190 00003E6E 83C402                   add  sp, 2
  9191 00003E71 8946FC                   mov [bp-4], ax
  9192                                  
  9193                                  ;-1128     i--;
  9194                                  
  9195 00003E74 FF4EFC                   dec  word[bp-4]
  9196                                  
  9197                                  ;-1129     c=&namelst+i;
  9198                                  
  9199 00003E77 B8A96E                   mov ax, namelst
  9200 00003E7A 0346FC                   add ax, [bp-4]
  9201 00003E7D 8946FA                   mov [bp-6], ax
  9202                                  
  9203                                  ;-1130     *c='S';
  9204                                  
  9205 00003E80 B85300                   mov ax, 83
  9206 00003E83 8B5EFA                   mov  bx, [bp-6]
  9207 00003E86 8807                     mov  [bx], al
  9208                                  
  9209                                  ;-1131 
  9210                                  
  9211                                  
  9212                                  ;-1132     fdin=openR (namein);
  9213                                  
  9214 00003E88 8D06666E                 lea  ax, [namein]
  9215 00003E8C 50                       push ax
  9216 00003E8D E825C2                   call openR
  9217 00003E90 83C402                   add  sp, 2
  9218 00003E93 A3[1A00]                 mov word [fdin], ax
  9219                                  
  9220                                  ;-1133     if(DOS_ERR){
  9221                                  
  9222 00003E96 A1[4600]                 mov ax, [DOS_ERR]
  9223 00003E99 08C0                     or  al, al
  9224 00003E9B 0F841C00                 je .main496
  9225                                  
  9226                                  ;-1134         cputs("Source file missing (.C): ");
  9227                                  
  9228 00003E9F 68[A340]                 push main_2
  9229 00003EA2 E8CEC1                   call cputs
  9230 00003EA5 83C402                   add  sp, 2
  9231                                  
  9232                                  ;-1135         cputs(namein);
  9233                                  
  9234 00003EA8 8D06666E                 lea  ax, [namein]
  9235 00003EAC 50                       push ax
  9236 00003EAD E8C3C1                   call cputs
  9237 00003EB0 83C402                   add  sp, 2
  9238                                  
  9239                                  ;-1136         exitR(1);
  9240                                  
  9241 00003EB3 6A01                     push 1
  9242 00003EB5 E82DC2                   call exitR
  9243 00003EB8 83C402                   add  sp, 2
  9244                                  
  9245                                  ;-1137         }
  9246                                  
  9247                                  
  9248                                  ;-1138     fdout=creatR(namelst);
  9249                                  
  9250                                  .main496:
  9251 00003EBB 8D06A96E                 lea  ax, [namelst]
  9252 00003EBF 50                       push ax
  9253 00003EC0 E801C2                   call creatR
  9254 00003EC3 83C402                   add  sp, 2
  9255 00003EC6 A3[1C00]                 mov word [fdout], ax
  9256                                  
  9257                                  ;-1139     if(DOS_ERR){
  9258                                  
  9259 00003EC9 A1[4600]                 mov ax, [DOS_ERR]
  9260 00003ECC 08C0                     or  al, al
  9261 00003ECE 0F841C00                 je .main497
  9262                                  
  9263                                  ;-1140         cputs("list file not creatable: ");
  9264                                  
  9265 00003ED2 68[BE40]                 push main_3
  9266 00003ED5 E89BC1                   call cputs
  9267 00003ED8 83C402                   add  sp, 2
  9268                                  
  9269                                  ;-1141         cputs(namelst);
  9270                                  
  9271 00003EDB 8D06A96E                 lea  ax, [namelst]
  9272 00003EDF 50                       push ax
  9273 00003EE0 E890C1                   call cputs
  9274 00003EE3 83C402                   add  sp, 2
  9275                                  
  9276                                  ;-1142         exitR(2);
  9277                                  
  9278 00003EE6 6A02                     push 2
  9279 00003EE8 E8FAC1                   call exitR
  9280 00003EEB 83C402                   add  sp, 2
  9281                                  
  9282                                  ;-1143         }
  9283                                  
  9284                                  
  9285                                  ;-1144     prs("\n; ");
  9286                                  
  9287                                  .main497:
  9288 00003EEE 68[D840]                 push main_4
  9289 00003EF1 E8EBC4                   call prs
  9290 00003EF4 83C402                   add  sp, 2
  9291                                  
  9292                                  ;-1145     prs(Version1);
  9293                                  
  9294 00003EF7 8D06[0300]               lea  ax, [Version1]
  9295 00003EFB 50                       push ax
  9296 00003EFC E8E0C4                   call prs
  9297 00003EFF 83C402                   add  sp, 2
  9298                                  
  9299                                  ;-1146     prs(", Source: "); prs(namein);
  9300                                  
  9301 00003F02 68[DD40]                 push main_5
  9302 00003F05 E8D7C4                   call prs
  9303 00003F08 83C402                   add  sp, 2
  9304 00003F0B 8D06666E                 lea  ax, [namein]
  9305 00003F0F 50                       push ax
  9306 00003F10 E8CCC4                   call prs
  9307 00003F13 83C402                   add  sp, 2
  9308                                  
  9309                                  ;-1147     prs(", Output asm: "); prs(namelst);
  9310                                  
  9311 00003F16 68[E840]                 push main_6
  9312 00003F19 E8C3C4                   call prs
  9313 00003F1C 83C402                   add  sp, 2
  9314 00003F1F 8D06A96E                 lea  ax, [namelst]
  9315 00003F23 50                       push ax
  9316 00003F24 E8B8C4                   call prs
  9317 00003F27 83C402                   add  sp, 2
  9318                                  
  9319                                  ;-1148     prs("\norg  256 \njmp main");
  9320                                  
  9321 00003F2A 68[F740]                 push main_7
  9322 00003F2D E8AFC4                   call prs
  9323 00003F30 83C402                   add  sp, 2
  9324                                  
  9325                                  ;-1149     coname=0;
  9326                                  
  9327 00003F33 B80000                   mov ax, 0
  9328 00003F36 A2606D                   mov byte [coname], al
  9329                                  
  9330                                  ;-1150     orgData=ORGDATAORIG;
  9331                                  
  9332 00003F39 A1[1000]                 mov ax, [ORGDATAORIG]
  9333 00003F3C A3[1200]                 mov word [orgData], ax
  9334                                  
  9335                                  ;-1151     fgetsp=&fgetsdest;
  9336                                  
  9337 00003F3F B8D4A4                   mov ax, fgetsdest
  9338 00003F42 A3[3E00]                 mov word [fgetsp], ax
  9339                                  
  9340                                  ;-1152     *fgetsp=0;
  9341                                  
  9342 00003F45 B80000                   mov ax, 0
  9343 00003F48 8B1E[3E00]               mov  bx, [fgetsp]
  9344 00003F4C 8807                     mov  [bx], al
  9345                                  
  9346                                  ;-1153     thechar=fgets1();
  9347                                  
  9348 00003F4E E834C8                   call fgets1
  9349 00003F51 A2[2200]                 mov byte [thechar], al
  9350                                  
  9351                                  ;-1154     parse();
  9352                                  
  9353 00003F54 E800FE                   call parse
  9354                                  
  9355                                  ;-1155     prs("\n;Input: "); prs(namein);
  9356                                  
  9357 00003F57 68[0D41]                 push main_8
  9358 00003F5A E882C4                   call prs
  9359 00003F5D 83C402                   add  sp, 2
  9360 00003F60 8D06666E                 lea  ax, [namein]
  9361 00003F64 50                       push ax
  9362 00003F65 E877C4                   call prs
  9363 00003F68 83C402                   add  sp, 2
  9364                                  
  9365                                  ;-1156     prs(", List: ");   prs(namelst);
  9366                                  
  9367 00003F6B 68[1841]                 push main_9
  9368 00003F6E E86EC4                   call prs
  9369 00003F71 83C402                   add  sp, 2
  9370 00003F74 8D06A96E                 lea  ax, [namelst]
  9371 00003F78 50                       push ax
  9372 00003F79 E863C4                   call prs
  9373 00003F7C 83C402                   add  sp, 2
  9374                                  
  9375                                  ;-1157     prs(", Lines: "); prunsign1(lineno);
  9376                                  
  9377 00003F7F 68[2141]                 push main_10
  9378 00003F82 E85AC4                   call prs
  9379 00003F85 83C402                   add  sp, 2
  9380 00003F88 FF36[4000]               push word [lineno]
  9381 00003F8C E8B3C5                   call prunsign1
  9382 00003F8F 83C402                   add  sp, 2
  9383                                  
  9384                                  ;-1158     prs("\n;Glob. variables: "); GTop--; prunsign1(GTop);
  9385                                  
  9386 00003F92 68[2B41]                 push main_11
  9387 00003F95 E847C4                   call prs
  9388 00003F98 83C402                   add  sp, 2
  9389 00003F9B FF0E[3800]               dec  word[GTop]
  9390 00003F9F FF36[3800]               push word [GTop]
  9391 00003FA3 E89CC5                   call prunsign1
  9392 00003FA6 83C402                   add  sp, 2
  9393                                  
  9394                                  ;-1159     prs(" ("); prunsign1(LSTART);
  9395                                  
  9396 00003FA9 68[4041]                 push main_12
  9397 00003FAC E830C4                   call prs
  9398 00003FAF 83C402                   add  sp, 2
  9399 00003FB2 68C800                   push 200
  9400 00003FB5 E88AC5                   call prunsign1
  9401 00003FB8 83C402                   add  sp, 2
  9402                                  
  9403                                  ;-1160     prs("), Functions: "); prunsign1(FTop);
  9404                                  
  9405 00003FBB 68[4341]                 push main_13
  9406 00003FBE E81EC4                   call prs
  9407 00003FC1 83C402                   add  sp, 2
  9408 00003FC4 FF36[3C00]               push word [FTop]
  9409 00003FC8 E877C5                   call prunsign1
  9410 00003FCB 83C402                   add  sp, 2
  9411                                  
  9412                                  ;-1161     prs(" ("); prunsign1(FUNCMAX);
  9413                                  
  9414 00003FCE 68[5241]                 push main_14
  9415 00003FD1 E80BC4                   call prs
  9416 00003FD4 83C402                   add  sp, 2
  9417 00003FD7 682C01                   push 300
  9418 00003FDA E865C5                   call prunsign1
  9419 00003FDD 83C402                   add  sp, 2
  9420                                  
  9421                                  ;-1162     prs(")\n;Const in '"); prs(coname); prs("': "); prunsign1(maxco);
  9422                                  
  9423 00003FE0 68[5541]                 push main_15
  9424 00003FE3 E8F9C3                   call prs
  9425 00003FE6 83C402                   add  sp, 2
  9426 00003FE9 8D06606D                 lea  ax, [coname]
  9427 00003FED 50                       push ax
  9428 00003FEE E8EEC3                   call prs
  9429 00003FF1 83C402                   add  sp, 2
  9430 00003FF4 68[6441]                 push main_16
  9431 00003FF7 E8E5C3                   call prs
  9432 00003FFA 83C402                   add  sp, 2
  9433 00003FFD FF36[1400]               push word [maxco]
  9434 00004001 E83EC5                   call prunsign1
  9435 00004004 83C402                   add  sp, 2
  9436                                  
  9437                                  ;-1163     prs(" ("); prunsign1(COMAX);
  9438                                  
  9439 00004007 68[6841]                 push main_17
  9440 0000400A E8D2C3                   call prs
  9441 0000400D 83C402                   add  sp, 2
  9442 00004010 68B80B                   push 3000
  9443 00004013 E82CC5                   call prunsign1
  9444 00004016 83C402                   add  sp, 2
  9445                                  
  9446                                  ;-1164     i=COMAX; i=i-maxco;
  9447                                  
  9448 00004019 B8B80B                   mov ax, 3000
  9449 0000401C 8946FC                   mov [bp-4], ax
  9450 0000401F 8B46FC                   mov ax, [bp-4]
  9451 00004022 2B06[1400]               sub ax, [maxco]
  9452 00004026 8946FC                   mov [bp-4], ax
  9453                                  
  9454                                  ;-1165     if (i <= 1000)prs("\n *** Warning *** constant area too small");
  9455                                  
  9456 00004029 8B46FC                   mov ax, [bp-4]
  9457 0000402C 3DE803                   cmp ax, 1000
  9458 0000402F 0F870900                 ja  .main498
  9459 00004033 68[6B41]                 push main_18
  9460 00004036 E8A6C3                   call prs
  9461 00004039 83C402                   add  sp, 2
  9462                                  
  9463                                  ;-1166     prs("), stacksize: ");
  9464                                  
  9465                                  .main498:
  9466 0000403C 68[9641]                 push main_19
  9467 0000403F E89DC3                   call prs
  9468 00004042 83C402                   add  sp, 2
  9469                                  
  9470                                  ;-1167     i=65636; i=i-orgData;
  9471                                  
  9472 00004045 B86400                   mov ax, 100
  9473 00004048 8946FC                   mov [bp-4], ax
  9474 0000404B 8B46FC                   mov ax, [bp-4]
  9475 0000404E 2B06[1200]               sub ax, [orgData]
  9476 00004052 8946FC                   mov [bp-4], ax
  9477                                  
  9478                                  ;-1168     prunsign1(i);
  9479                                  
  9480 00004055 FF76FC                   push word [bp-4]
  9481 00004058 E8E7C4                   call prunsign1
  9482 0000405B 83C402                   add  sp, 2
  9483                                  
  9484                                  ;-1169     if (i <= 1000) prs("\n *** Warning *** Stack too small");
  9485                                  
  9486 0000405E 8B46FC                   mov ax, [bp-4]
  9487 00004061 3DE803                   cmp ax, 1000
  9488 00004064 0F870900                 ja  .main499
  9489 00004068 68[A541]                 push main_20
  9490 0000406B E871C3                   call prs
  9491 0000406E 83C402                   add  sp, 2
  9492                                  
  9493                                  ;-1170     prs("          ");
  9494                                  
  9495                                  .main499:
  9496 00004071 68[C841]                 push main_21
  9497 00004074 E868C3                   call prs
  9498 00004077 83C402                   add  sp, 2
  9499                                  
  9500                                  ;-1171     end1(0);
  9501                                  
  9502 0000407A 6A00                     push 0
  9503 0000407C E85EC5                   call end1
  9504 0000407F 83C402                   add  sp, 2
  9505                                  
  9506                                  ;-1172 }
  9507 00004082 C9                       LEAVE
  9508 00004083 C3                       ret
  9509 00004084 2055736167653A2041-     main_0 db " Usage: A.COM in_file[.C]: ",0
  9510 0000408D 2E434F4D20696E5F66-
  9511 00004096 696C655B2E435D3A20-
  9512 0000409F 00                 
  9513 000040A0 2E4300                  main_1 db ".C",0
  9514 000040A3 536F75726365206669-     main_2 db "Source file missing (.C): ",0
  9515 000040AC 6C65206D697373696E-
  9516 000040B5 6720282E43293A2000 
  9517 000040BE 6C6973742066696C65-     main_3 db "list file not creatable: ",0
  9518 000040C7 206E6F742063726561-
  9519 000040D0 7461626C653A2000   
  9520 000040D8 5C6E3B2000              main_4 db "\n; ",0
  9521 000040DD 2C20536F757263653A-     main_5 db ", Source: ",0
  9522 000040E6 2000               
  9523 000040E8 2C204F757470757420-     main_6 db ", Output asm: ",0
  9524 000040F1 61736D3A2000       
  9525 000040F7 5C6E6F726720203235-     main_7 db "\norg  256 \njmp main",0
  9526 00004100 36205C6E6A6D70206D-
  9527 00004109 61696E00           
  9528 0000410D 5C6E3B496E7075743A-     main_8 db "\n;Input: ",0
  9529 00004116 2000               
  9530 00004118 2C204C6973743A2000      main_9 db ", List: ",0
  9531 00004121 2C204C696E65733A20-     main_10 db ", Lines: ",0
  9532 0000412A 00                 
  9533 0000412B 5C6E3B476C6F622E20-     main_11 db "\n;Glob. variables: ",0
  9534 00004134 7661726961626C6573-
  9535 0000413D 3A2000             
  9536 00004140 202800                  main_12 db " (",0
  9537 00004143 292C2046756E637469-     main_13 db "), Functions: ",0
  9538 0000414C 6F6E733A2000       
  9539 00004152 202800                  main_14 db " (",0
  9540 00004155 295C6E3B436F6E7374-     main_15 db ")\n;Const in '",0
  9541 0000415E 20696E202700       
  9542 00004164 273A2000                main_16 db "': ",0
  9543 00004168 202800                  main_17 db " (",0
  9544 0000416B 5C6E202A2A2A205761-     main_18 db "\n *** Warning *** constant area too small",0
  9545 00004174 726E696E67202A2A2A-
  9546 0000417D 20636F6E7374616E74-
  9547 00004186 206172656120746F6F-
  9548 0000418F 20736D616C6C00     
  9549 00004196 292C20737461636B73-     main_19 db "), stacksize: ",0
  9550 0000419F 697A653A2000       
  9551 000041A5 5C6E202A2A2A205761-     main_20 db "\n *** Warning *** Stack too small",0
  9552 000041AE 726E696E67202A2A2A-
  9553 000041B7 20537461636B20746F-
  9554 000041C0 6F20736D616C6C00   
  9555 000041C8 202020202020202020-     main_21 db "          ",0
  9556 000041D1 2000               
  9557                                  ENDP
  9558                                  ;Input: A.C, List: A.S, Lines: 1173
  9559                                  ;Glob. variables: 107 (200), Functions: 77 (300)
  9560                                  ;Const in 'checkreg': 712 (3000), stacksize: 23155          
