     1                                  
     2                                  ; A.COM V0.9.3, Source: A.C, Output asm: A.S
     3                                  org  256 
     4 00000000 E9133E                  jmp main
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
  1950                                  ;-335 int getdigit(char c) { int i;
  1951                                  
  1952 000007ED C9                       .retnnext: LEAVE
  1953 000007EE C3                       ret
  1954                                  ENDP
  1955                                  
  1956                                  getdigit: PROC
  1957                                  
  1958                                  ;-336     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char
  1959                                  ;
  1960 000007EF C8020000                 ENTER  2,0
  1961 000007F3 B80000                   mov ax, 0
  1962 000007F6 A3[2B00]                 mov word [lexval], ax
  1963 000007F9 8A4604                   mov al, [bp+4]
  1964 000007FC 2C30                     sub al, 48
  1965 000007FE A3[2B00]                 mov word [lexval], ax
  1966                                  
  1967                                  ;-337     if (thechar=='x') thechar='X'; if (thechar=='X') { next();
  1968                                  
  1969 00000801 A0[2200]                 mov al, [thechar]
  1970 00000804 3C78                     cmp al, 120
  1971 00000806 0F850600                 jne .getdigit63
  1972 0000080A B85800                   mov ax, 88
  1973 0000080D A2[2200]                 mov byte [thechar], al
  1974                                  .getdigit63:
  1975 00000810 A0[2200]                 mov al, [thechar]
  1976 00000813 3C58                     cmp al, 88
  1977 00000815 0F856800                 jne .getdigit64
  1978 00000819 E8BBFF                   call next
  1979                                  
  1980                                  ;-338       while(alnum(thechar)) { c=next(); if(c>96) c=c-39;
  1981                                  
  1982                                  .getdigit65:
  1983 0000081C A0[2200]                 mov al, byte [thechar]
  1984 0000081F B400                     mov ah, 0
  1985 00000821 50                       push ax
  1986 00000822 E8A0F9                   call alnum
  1987 00000825 83C402                   add  sp, 2
  1988 00000828 08C0                     or  al, al
  1989 0000082A 0F845000                 je .getdigit66
  1990 0000082E E8A6FF                   call next
  1991 00000831 884604                   mov [bp+4], al
  1992 00000834 8A4604                   mov al, [bp+4]
  1993 00000837 3C60                     cmp al, 96
  1994 00000839 0F8E0800                 jle .getdigit67
  1995 0000083D 8A4604                   mov al, [bp+4]
  1996 00000840 2C27                     sub al, 39
  1997 00000842 884604                   mov [bp+4], al
  1998                                  
  1999                                  ;-339 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16
  2000                                  
  2001                                  .getdigit67:
  2002 00000845 8A4604                   mov al, [bp+4]
  2003 00000848 3C40                     cmp al, 64
  2004 0000084A 0F8E0800                 jle .getdigit68
  2005 0000084E 8A4604                   mov al, [bp+4]
  2006 00000851 2C07                     sub al, 7
  2007 00000853 884604                   mov [bp+4], al
  2008                                  .getdigit68:
  2009 00000856 8A4604                   mov al, [bp+4]
  2010 00000859 2C30                     sub al, 48
  2011 0000085B 884604                   mov [bp+4], al
  2012 0000085E A1[2B00]                 mov ax, [lexval]
  2013 00000861 C1E004                   shl ax, 4
  2014 00000864 A3[2B00]                 mov word [lexval], ax
  2015                                  
  2016                                  ;-340      i=0; i=c; lexval=lexval+i;}
  2017                                  
  2018 00000867 B80000                   mov ax, 0
  2019 0000086A 8946FE                   mov [bp-2], ax
  2020 0000086D 8A4604                   mov al, [bp+4]
  2021 00000870 8946FE                   mov [bp-2], ax
  2022 00000873 A1[2B00]                 mov ax, [lexval]
  2023 00000876 0346FE                   add ax, [bp-2]
  2024 00000879 A3[2B00]                 mov word [lexval], ax
  2025                                  
  2026                                  ;-341     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10;
  2027                                  
  2028 0000087C EB9E                     jmp .getdigit65
  2029                                  .getdigit66:
  2030 0000087E E94200                   jmp .getdigit69
  2031                                  .getdigit64:
  2032                                  .getdigit70:
  2033 00000881 A0[2200]                 mov al, byte [thechar]
  2034 00000884 B400                     mov ah, 0
  2035 00000886 50                       push ax
  2036 00000887 E811F9                   call digit
  2037 0000088A 83C402                   add  sp, 2
  2038 0000088D 08C0                     or  al, al
  2039 0000088F 0F843000                 je .getdigit71
  2040 00000893 E841FF                   call next
  2041 00000896 884604                   mov [bp+4], al
  2042 00000899 8A4604                   mov al, [bp+4]
  2043 0000089C 2C30                     sub al, 48
  2044 0000089E 884604                   mov [bp+4], al
  2045 000008A1 A1[2B00]                 mov ax, [lexval]
  2046 000008A4 BB0A00                   mov bx, 10
  2047 000008A7 F7E3                     mul bx
  2048 000008A9 A3[2B00]                 mov word [lexval], ax
  2049                                  
  2050                                  ;-342      i=0; i=c; lexval=lexval+i; } }
  2051                                  
  2052 000008AC B80000                   mov ax, 0
  2053 000008AF 8946FE                   mov [bp-2], ax
  2054 000008B2 8A4604                   mov al, [bp+4]
  2055 000008B5 8946FE                   mov [bp-2], ax
  2056 000008B8 A1[2B00]                 mov ax, [lexval]
  2057 000008BB 0346FE                   add ax, [bp-2]
  2058 000008BE A3[2B00]                 mov word [lexval], ax
  2059 000008C1 EBBE                     jmp .getdigit70
  2060                                  .getdigit71:
  2061                                  
  2062                                  ;-343 }
  2063                                  
  2064                                  .getdigit69:
  2065                                  
  2066                                  ;-344 int getstring(int delim) {
  2067 000008C3 C9                       LEAVE
  2068 000008C4 C3                       ret
  2069                                  ENDP
  2070                                  
  2071                                  getstring: PROC
  2072                                  
  2073                                  ;-345     int c; char *p;
  2074                                  
  2075                                  
  2076                                  ;-346     p=&symbol;
  2077                                  ;
  2078 000008C5 C8040000                 ENTER  4,0
  2079 000008C9 B8A36D                   mov ax, symbol
  2080 000008CC 8946FC                   mov [bp-4], ax
  2081                                  
  2082                                  ;-347     c=next();
  2083                                  
  2084 000008CF E805FF                   call next
  2085 000008D2 8946FE                   mov [bp-2], ax
  2086                                  
  2087                                  ;-348     while (c != delim) {
  2088                                  
  2089                                  .getstring72:
  2090 000008D5 8B46FE                   mov ax, [bp-2]
  2091 000008D8 3B4604                   cmp ax, [bp+4]
  2092 000008DB 0F841300                 je  .getstring73
  2093                                  
  2094                                  ;-349         *p=c;
  2095                                  
  2096 000008DF 8B46FE                   mov ax, [bp-2]
  2097 000008E2 8B5EFC                   mov  bx, [bp-4]
  2098 000008E5 8807                     mov  [bx], al
  2099                                  
  2100                                  ;-350         p++;
  2101                                  
  2102 000008E7 FF46FC                   inc  word[bp-4]
  2103                                  
  2104                                  ;-351         c=next();
  2105                                  
  2106 000008EA E8EAFE                   call next
  2107 000008ED 8946FE                   mov [bp-2], ax
  2108                                  
  2109                                  ;-352     }
  2110                                  
  2111                                  
  2112                                  ;-353     *p=0;
  2113                                  
  2114 000008F0 EBE3                     jmp .getstring72
  2115                                  .getstring73:
  2116 000008F2 B80000                   mov ax, 0
  2117 000008F5 8B5EFC                   mov  bx, [bp-4]
  2118 000008F8 8807                     mov  [bx], al
  2119                                  
  2120                                  ;-354 }
  2121                                  
  2122                                  
  2123                                  ;-355 
  2124                                  
  2125                                  
  2126                                  ;-356 int adrF(char *s, unsigned int i) {
  2127 000008FA C9                       LEAVE
  2128 000008FB C3                       ret
  2129                                  ENDP
  2130                                  
  2131                                  adrF: PROC
  2132                                  
  2133                                  ;-357     i << 4;//*16; IDLENMAX=15!
  2134                                  ;
  2135 000008FC C8000000                 ENTER  0,0
  2136 00000900 8B4606                   mov ax, [bp+6]
  2137 00000903 C1E004                   shl ax, 4
  2138                                  
  2139                                  ;-358     __asm{ add ax, [bp+4]  ; offset s }
  2140                                  
  2141 00000906 034604                   add ax, [bp+4]  ; offset s 
  2142                                  
  2143                                  ;-359 }
  2144                                  
  2145                                  
  2146                                  ;-360 
  2147                                  
  2148                                  
  2149                                  ;-361 int printName(unsigned int i) {
  2150 00000909 C9                       LEAVE
  2151 0000090A C3                       ret
  2152                                  ENDP
  2153                                  
  2154                                  printName: PROC
  2155                                  
  2156                                  ;-362     int j;
  2157                                  
  2158                                  
  2159                                  ;-363     if (i < LSTART) {
  2160                                  ;
  2161 0000090B C8020000                 ENTER  2,0
  2162 0000090F 8B4604                   mov ax, [bp+4]
  2163 00000912 3DC800                   cmp ax, 200
  2164 00000915 0F8D1D00                 jge .printName74
  2165                                  
  2166                                  ;-364         i=adrF(GNameField, i);
  2167                                  
  2168 00000919 FF7604                   push word [bp+4]
  2169 0000091C 8D067879                 lea  ax, [GNameField]
  2170 00000920 50                       push ax
  2171 00000921 E8D8FF                   call adrF
  2172 00000924 83C404                   add  sp, 4
  2173 00000927 894604                   mov [bp+4], ax
  2174                                  
  2175                                  ;-365         prs(i);
  2176                                  
  2177 0000092A FF7604                   push word [bp+4]
  2178 0000092D E8AFFA                   call prs
  2179 00000930 83C402                   add  sp, 2
  2180                                  
  2181                                  ;-366     }
  2182                                  
  2183                                  
  2184                                  ;-367     else {
  2185                                  
  2186 00000933 E93800                   jmp .printName75
  2187                                  .printName74:
  2188                                  
  2189                                  ;-368         prs("[bp");
  2190                                  
  2191 00000936 68[7009]                 push printName_0
  2192 00000939 E8A3FA                   call prs
  2193 0000093C 83C402                   add  sp, 2
  2194                                  
  2195                                  ;-369         j = GData[i];
  2196                                  
  2197 0000093F 8B5E04                   mov bx, [bp+4]
  2198 00000942 D1E3                     shl bx, 1
  2199 00000944 8B872077                 mov ax, [GData + bx]
  2200 00000948 8946FE                   mov [bp-2], ax
  2201                                  
  2202                                  ;-370         if (j>0) prc('+');
  2203                                  
  2204 0000094B 8B46FE                   mov ax, [bp-2]
  2205 0000094E 83F800                   cmp ax, 0
  2206 00000951 0F8E0800                 jle .printName76
  2207 00000955 6A2B                     push 43
  2208 00000957 E82CFA                   call prc
  2209 0000095A 83C402                   add  sp, 2
  2210                                  
  2211                                  ;-371         pint1(j);
  2212                                  
  2213                                  .printName76:
  2214 0000095D FF76FE                   push word [bp-2]
  2215 00000960 E881FB                   call pint1
  2216 00000963 83C402                   add  sp, 2
  2217                                  
  2218                                  ;-372         prc(']');
  2219                                  
  2220 00000966 6A5D                     push 93
  2221 00000968 E81BFA                   call prc
  2222 0000096B 83C402                   add  sp, 2
  2223                                  
  2224                                  ;-373     }
  2225                                  
  2226                                  
  2227                                  ;-374 }
  2228                                  
  2229                                  .printName75:
  2230                                  
  2231                                  ;-375 int convertdefine() { int i; int j;   i=0;
  2232 0000096E C9                       LEAVE
  2233 0000096F C3                       ret
  2234 00000970 5B627000                printName_0 db "[bp",0
  2235                                  ENDP
  2236                                  
  2237                                  convertdefine: PROC;
  2238 00000974 C8040000                 ENTER  4,0
  2239 00000978 B80000                   mov ax, 0
  2240 0000097B 8946FE                   mov [bp-2], ax
  2241                                  
  2242                                  ;-376   while (i < GTop) {
  2243                                  
  2244                                  .convertdefine77:
  2245 0000097E 8B46FE                   mov ax, [bp-2]
  2246 00000981 3B06[3800]               cmp ax, [GTop]
  2247 00000985 0F8D4900                 jge .convertdefine78
  2248                                  
  2249                                  ;-377    j=adrF(GNameField, i);
  2250                                  
  2251 00000989 FF76FE                   push word [bp-2]
  2252 0000098C 8D067879                 lea  ax, [GNameField]
  2253 00000990 50                       push ax
  2254 00000991 E868FF                   call adrF
  2255 00000994 83C404                   add  sp, 4
  2256 00000997 8946FC                   mov [bp-4], ax
  2257                                  
  2258                                  ;-378    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];
  2259                                  
  2260 0000099A FF76FC                   push word [bp-4]
  2261 0000099D 8D06A36D                 lea  ax, [symbol]
  2262 000009A1 50                       push ax
  2263 000009A2 E8BAF8                   call eqstr
  2264 000009A5 83C404                   add  sp, 4
  2265 000009A8 08C0                     or  al, al
  2266 000009AA 0F841F00                 je .convertdefine79
  2267 000009AE 8B5EFE                   mov bx, [bp-2]
  2268 000009B1 8A87EC6E                 mov al, [GType + bx]
  2269 000009B5 3C23                     cmp al, 35
  2270 000009B7 0F851200                 jne .convertdefine80
  2271 000009BB 8B5EFE                   mov bx, [bp-2]
  2272 000009BE D1E3                     shl bx, 1
  2273 000009C0 8B872077                 mov ax, [GData + bx]
  2274 000009C4 A3[2B00]                 mov word [lexval], ax
  2275                                  
  2276                                  ;-379    return T_CONST; } }
  2277                                  
  2278 000009C7 B80101                   mov ax, 257
  2279 000009CA E90B00                   jmp .retnconvertdefine
  2280                                  .convertdefine80:
  2281                                  
  2282                                  ;-380    i++; }
  2283                                  
  2284                                  .convertdefine79:
  2285 000009CD FF46FE                   inc  word[bp-2]
  2286                                  
  2287                                  ;-381    return 0; }
  2288                                  
  2289 000009D0 EBAC                     jmp .convertdefine77
  2290                                  .convertdefine78:
  2291 000009D2 B80000                   mov ax, 0
  2292 000009D5 E90000                   jmp .retnconvertdefine
  2293                                  
  2294                                  ;-382 
  2295                                  
  2296                                  
  2297                                  ;-383 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR
  2298                                  
  2299 000009D8 C9                       .retnconvertdefine: LEAVE
  2300 000009D9 C3                       ret
  2301                                  ENDP
  2302                                  
  2303                                  ifEOL: PROC
  2304                                  
  2305                                  ;-384     if (c == 10) return 1;//LF
  2306                                  ;
  2307 000009DA C8000000                 ENTER  0,0
  2308 000009DE 8A4604                   mov al, [bp+4]
  2309 000009E1 3C0A                     cmp al, 10
  2310 000009E3 0F850600                 jne .ifEOL81
  2311 000009E7 B80100                   mov ax, 1
  2312 000009EA E92400                   jmp .retnifEOL
  2313                                  
  2314                                  ;-385     if (c == 13) {//CR
  2315                                  
  2316                                  .ifEOL81:
  2317 000009ED 8A4604                   mov al, [bp+4]
  2318 000009F0 3C0D                     cmp al, 13
  2319 000009F2 0F851500                 jne .ifEOL82
  2320                                  
  2321                                  ;-386         if (thechar == 10) c=next();
  2322                                  
  2323 000009F6 A0[2200]                 mov al, [thechar]
  2324 000009F9 3C0A                     cmp al, 10
  2325 000009FB 0F850600                 jne .ifEOL83
  2326 000009FF E8D5FD                   call next
  2327 00000A02 884604                   mov [bp+4], al
  2328                                  
  2329                                  ;-387         return 1;
  2330                                  
  2331                                  .ifEOL83:
  2332 00000A05 B80100                   mov ax, 1
  2333 00000A08 E90600                   jmp .retnifEOL
  2334                                  
  2335                                  ;-388     }
  2336                                  
  2337                                  
  2338                                  ;-389     return 0;
  2339                                  
  2340                                  .ifEOL82:
  2341 00000A0B B80000                   mov ax, 0
  2342 00000A0E E90000                   jmp .retnifEOL
  2343                                  
  2344                                  ;-390 }
  2345                                  
  2346                                  
  2347                                  ;-391 
  2348                                  
  2349                                  
  2350                                  ;-392 char symboltemp[80];
  2351                                  
  2352 00000A11 C9                       .retnifEOL: LEAVE
  2353 00000A12 C3                       ret
  2354                                  ENDP
  2355                                  section .bss
  2356                                  absolute 42324
  2357 0000A554 <res 00000050>          symboltemp resb 80
  2358                                  section .text
  2359                                  
  2360                                  ;-393 int getlex() { char c; char *p;
  2361                                  
  2362                                  
  2363                                  getlex: PROC
  2364                                  
  2365                                  ;-394 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;
  2366                                  ;
  2367 00000A13 C8040000                 ENTER  4,0
  2368                                  .g1:
  2369 00000A17 E8BDFD                   call next
  2370 00000A1A 8846FE                   mov [bp-2], al
  2371 00000A1D 8A46FE                   mov al, [bp-2]
  2372 00000A20 3C00                     cmp al, 0
  2373 00000A22 0F850600                 jne .getlex84
  2374 00000A26 B80000                   mov ax, 0
  2375 00000A29 E9DA04                   jmp .retngetlex
  2376                                  .getlex84:
  2377 00000A2C 8A46FE                   mov al, [bp-2]
  2378 00000A2F 3C20                     cmp al, 32
  2379 00000A31 0F8F0200                 jg  .getlex85
  2380 00000A35 EBE0                     jmp .g1
  2381                                  
  2382                                  ;-395   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}
  2383                                  
  2384                                  .getlex85:
  2385 00000A37 8A46FE                   mov al, [bp-2]
  2386 00000A3A 3C3D                     cmp al, 61
  2387 00000A3C 0F851200                 jne .getlex86
  2388 00000A40 A0[2200]                 mov al, [thechar]
  2389 00000A43 3C3D                     cmp al, 61
  2390 00000A45 0F850900                 jne .getlex87
  2391 00000A49 E88BFD                   call next
  2392 00000A4C B82603                   mov ax, 806
  2393 00000A4F E9B404                   jmp .retngetlex
  2394                                  .getlex87:
  2395                                  
  2396                                  ;-396   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}
  2397                                  
  2398                                  .getlex86:
  2399 00000A52 8A46FE                   mov al, [bp-2]
  2400 00000A55 3C21                     cmp al, 33
  2401 00000A57 0F851200                 jne .getlex88
  2402 00000A5B A0[2200]                 mov al, [thechar]
  2403 00000A5E 3C3D                     cmp al, 61
  2404 00000A60 0F850900                 jne .getlex89
  2405 00000A64 E870FD                   call next
  2406 00000A67 B82703                   mov ax, 807
  2407 00000A6A E99904                   jmp .retngetlex
  2408                                  .getlex89:
  2409                                  
  2410                                  ;-397   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}
  2411                                  
  2412                                  .getlex88:
  2413 00000A6D 8A46FE                   mov al, [bp-2]
  2414 00000A70 3C3C                     cmp al, 60
  2415 00000A72 0F851200                 jne .getlex90
  2416 00000A76 A0[2200]                 mov al, [thechar]
  2417 00000A79 3C3D                     cmp al, 61
  2418 00000A7B 0F850900                 jne .getlex91
  2419 00000A7F E855FD                   call next
  2420 00000A82 B83803                   mov ax, 824
  2421 00000A85 E97E04                   jmp .retngetlex
  2422                                  .getlex91:
  2423                                  
  2424                                  ;-398   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}
  2425                                  
  2426                                  .getlex90:
  2427 00000A88 8A46FE                   mov al, [bp-2]
  2428 00000A8B 3C3E                     cmp al, 62
  2429 00000A8D 0F851200                 jne .getlex92
  2430 00000A91 A0[2200]                 mov al, [thechar]
  2431 00000A94 3C3D                     cmp al, 61
  2432 00000A96 0F850900                 jne .getlex93
  2433 00000A9A E83AFD                   call next
  2434 00000A9D B82B03                   mov ax, 811
  2435 00000AA0 E96304                   jmp .retngetlex
  2436                                  .getlex93:
  2437                                  
  2438                                  ;-399   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}
  2439                                  
  2440                                  .getlex92:
  2441 00000AA3 8A46FE                   mov al, [bp-2]
  2442 00000AA6 3C3C                     cmp al, 60
  2443 00000AA8 0F851200                 jne .getlex94
  2444 00000AAC A0[2200]                 mov al, [thechar]
  2445 00000AAF 3C3C                     cmp al, 60
  2446 00000AB1 0F850900                 jne .getlex95
  2447 00000AB5 E81FFD                   call next
  2448 00000AB8 B8D804                   mov ax, 1240
  2449 00000ABB E94804                   jmp .retngetlex
  2450                                  .getlex95:
  2451                                  
  2452                                  ;-400   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}
  2453                                  
  2454                                  .getlex94:
  2455 00000ABE 8A46FE                   mov al, [bp-2]
  2456 00000AC1 3C3E                     cmp al, 62
  2457 00000AC3 0F851200                 jne .getlex96
  2458 00000AC7 A0[2200]                 mov al, [thechar]
  2459 00000ACA 3C3E                     cmp al, 62
  2460 00000ACC 0F850900                 jne .getlex97
  2461 00000AD0 E804FD                   call next
  2462 00000AD3 B8D904                   mov ax, 1241
  2463 00000AD6 E92D04                   jmp .retngetlex
  2464                                  .getlex97:
  2465                                  
  2466                                  ;-401   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}
  2467                                  
  2468                                  .getlex96:
  2469 00000AD9 8A46FE                   mov al, [bp-2]
  2470 00000ADC 3C2B                     cmp al, 43
  2471 00000ADE 0F851200                 jne .getlex98
  2472 00000AE2 A0[2200]                 mov al, [thechar]
  2473 00000AE5 3C2B                     cmp al, 43
  2474 00000AE7 0F850900                 jne .getlex99
  2475 00000AEB E8E9FC                   call next
  2476 00000AEE B8C304                   mov ax, 1219
  2477 00000AF1 E91204                   jmp .retngetlex
  2478                                  .getlex99:
  2479                                  
  2480                                  ;-402   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}
  2481                                  
  2482                                  .getlex98:
  2483 00000AF4 8A46FE                   mov al, [bp-2]
  2484 00000AF7 3C2D                     cmp al, 45
  2485 00000AF9 0F851200                 jne .getlex100
  2486 00000AFD A0[2200]                 mov al, [thechar]
  2487 00000B00 3C2D                     cmp al, 45
  2488 00000B02 0F850900                 jne .getlex101
  2489 00000B06 E8CEFC                   call next
  2490 00000B09 B8C904                   mov ax, 1225
  2491 00000B0C E9F703                   jmp .retngetlex
  2492                                  .getlex101:
  2493                                  
  2494                                  ;-403   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}
  2495                                  
  2496                                  .getlex100:
  2497 00000B0F 8A46FE                   mov al, [bp-2]
  2498 00000B12 3C2B                     cmp al, 43
  2499 00000B14 0F851200                 jne .getlex102
  2500 00000B18 A0[2200]                 mov al, [thechar]
  2501 00000B1B 3C3D                     cmp al, 61
  2502 00000B1D 0F850900                 jne .getlex103
  2503 00000B21 E8B3FC                   call next
  2504 00000B24 B8CE04                   mov ax, 1230
  2505 00000B27 E9DC03                   jmp .retngetlex
  2506                                  .getlex103:
  2507                                  
  2508                                  ;-404   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}
  2509                                  
  2510                                  .getlex102:
  2511 00000B2A 8A46FE                   mov al, [bp-2]
  2512 00000B2D 3C2D                     cmp al, 45
  2513 00000B2F 0F851200                 jne .getlex104
  2514 00000B33 A0[2200]                 mov al, [thechar]
  2515 00000B36 3C3D                     cmp al, 61
  2516 00000B38 0F850900                 jne .getlex105
  2517 00000B3C E898FC                   call next
  2518 00000B3F B8CF04                   mov ax, 1231
  2519 00000B42 E9C103                   jmp .retngetlex
  2520                                  .getlex105:
  2521                                  
  2522                                  ;-405   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}
  2523                                  
  2524                                  .getlex104:
  2525 00000B45 8A46FE                   mov al, [bp-2]
  2526 00000B48 3C26                     cmp al, 38
  2527 00000B4A 0F851200                 jne .getlex106
  2528 00000B4E A0[2200]                 mov al, [thechar]
  2529 00000B51 3C3D                     cmp al, 61
  2530 00000B53 0F850900                 jne .getlex107
  2531 00000B57 E87DFC                   call next
  2532 00000B5A B8D204                   mov ax, 1234
  2533 00000B5D E9A603                   jmp .retngetlex
  2534                                  .getlex107:
  2535                                  
  2536                                  ;-406   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}
  2537                                  
  2538                                  .getlex106:
  2539 00000B60 8A46FE                   mov al, [bp-2]
  2540 00000B63 3C7C                     cmp al, 124
  2541 00000B65 0F851200                 jne .getlex108
  2542 00000B69 A0[2200]                 mov al, [thechar]
  2543 00000B6C 3C3D                     cmp al, 61
  2544 00000B6E 0F850900                 jne .getlex109
  2545 00000B72 E862FC                   call next
  2546 00000B75 B8D304                   mov ax, 1235
  2547 00000B78 E98B03                   jmp .retngetlex
  2548                                  .getlex109:
  2549                                  
  2550                                  ;-407   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}
  2551                                  
  2552                                  .getlex108:
  2553 00000B7B 8A46FE                   mov al, [bp-2]
  2554 00000B7E 3C2A                     cmp al, 42
  2555 00000B80 0F851200                 jne .getlex110
  2556 00000B84 A0[2200]                 mov al, [thechar]
  2557 00000B87 3C3D                     cmp al, 61
  2558 00000B89 0F850900                 jne .getlex111
  2559 00000B8D E847FC                   call next
  2560 00000B90 B8D004                   mov ax, 1232
  2561 00000B93 E97003                   jmp .retngetlex
  2562                                  .getlex111:
  2563                                  
  2564                                  ;-408   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}
  2565                                  
  2566                                  .getlex110:
  2567 00000B96 8A46FE                   mov al, [bp-2]
  2568 00000B99 3C2F                     cmp al, 47
  2569 00000B9B 0F851200                 jne .getlex112
  2570 00000B9F A0[2200]                 mov al, [thechar]
  2571 00000BA2 3C3D                     cmp al, 61
  2572 00000BA4 0F850900                 jne .getlex113
  2573 00000BA8 E82CFC                   call next
  2574 00000BAB B8D104                   mov ax, 1233
  2575 00000BAE E95503                   jmp .retngetlex
  2576                                  .getlex113:
  2577                                  
  2578                                  ;-409   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;
  2579                                  
  2580                                  .getlex112:
  2581 00000BB1 8A46FE                   mov al, byte [bp-2]
  2582 00000BB4 B400                     mov ah, 0
  2583 00000BB6 50                       push ax
  2584 00000BB7 68[080F]                 push getlex_0
  2585 00000BBA E856F7                   call instr1
  2586 00000BBD 83C404                   add  sp, 4
  2587 00000BC0 08C0                     or  al, al
  2588 00000BC2 0F840600                 je .getlex114
  2589 00000BC6 8A46FE                   mov al, [bp-2]
  2590 00000BC9 E93A03                   jmp .retngetlex
  2591                                  
  2592                                  ;-410   if (c == '/') { if (thechar == '/') {
  2593                                  
  2594                                  .getlex114:
  2595 00000BCC 8A46FE                   mov al, [bp-2]
  2596 00000BCF 3C2F                     cmp al, 47
  2597 00000BD1 0F852900                 jne .getlex115
  2598 00000BD5 A0[2200]                 mov al, [thechar]
  2599 00000BD8 3C2F                     cmp al, 47
  2600 00000BDA 0F852000                 jne .getlex116
  2601                                  
  2602                                  ;-411       do c=next(); while(ifEOL(c)==0) return getlex(); } }
  2603                                  
  2604                                  .getlex117:
  2605 00000BDE E8F6FB                   call next
  2606 00000BE1 8846FE                   mov [bp-2], al
  2607 00000BE4 8A46FE                   mov al, byte [bp-2]
  2608 00000BE7 B400                     mov ah, 0
  2609 00000BE9 50                       push ax
  2610 00000BEA E8EDFD                   call ifEOL
  2611 00000BED 83C402                   add  sp, 2
  2612 00000BF0 3C00                     cmp al, 0
  2613 00000BF2 0F850200                 jne .getlex118
  2614 00000BF6 EBE6                     jmp .getlex117
  2615                                  .getlex118:
  2616 00000BF8 E818FE                   call getlex
  2617 00000BFB E90803                   jmp .retngetlex
  2618                                  .getlex116:
  2619                                  
  2620                                  ;-412   if (c == '/') { if (thechar == '*') {
  2621                                  
  2622                                  .getlex115:
  2623 00000BFE 8A46FE                   mov al, [bp-2]
  2624 00000C01 3C2F                     cmp al, 47
  2625 00000C03 0F853A00                 jne .getlex119
  2626 00000C07 A0[2200]                 mov al, [thechar]
  2627 00000C0A 3C2A                     cmp al, 42
  2628 00000C0C 0F852B00                 jne .getlex120
  2629                                  
  2630                                  ;-413       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;
  2631                                  
  2632                                  .g2:
  2633 00000C10 E8C4FB                   call next
  2634 00000C13 8846FE                   mov [bp-2], al
  2635 00000C16 8A46FE                   mov al, [bp-2]
  2636 00000C19 3C2A                     cmp al, 42
  2637 00000C1B 0F840200                 je  .getlex121
  2638 00000C1F EBEF                     jmp .g2
  2639                                  .getlex121:
  2640 00000C21 A0[2200]                 mov al, [thechar]
  2641 00000C24 3C2F                     cmp al, 47
  2642 00000C26 0F840200                 je  .getlex122
  2643 00000C2A EBE4                     jmp .g2
  2644                                  
  2645                                  ;-414       c=next(); return getlex(); } else  return '/'; }
  2646                                  
  2647                                  .getlex122:
  2648 00000C2C E8A8FB                   call next
  2649 00000C2F 8846FE                   mov [bp-2], al
  2650 00000C32 E8DEFD                   call getlex
  2651 00000C35 E9CE02                   jmp .retngetlex
  2652 00000C38 E90600                   jmp .getlex123
  2653                                  .getlex120:
  2654 00000C3B B82F00                   mov ax, 47
  2655 00000C3E E9C502                   jmp .retngetlex
  2656                                  .getlex123:
  2657                                  
  2658                                  ;-415   if (c == '"') {getstring(c); return T_STRING;}
  2659                                  
  2660                                  .getlex119:
  2661 00000C41 8A46FE                   mov al, [bp-2]
  2662 00000C44 3C22                     cmp al, 34
  2663 00000C46 0F851200                 jne .getlex124
  2664 00000C4A 8A46FE                   mov al, byte [bp-2]
  2665 00000C4D B400                     mov ah, 0
  2666 00000C4F 50                       push ax
  2667 00000C50 E872FC                   call getstring
  2668 00000C53 83C402                   add  sp, 2
  2669 00000C56 B80201                   mov ax, 258
  2670 00000C59 E9AA02                   jmp .retngetlex
  2671                                  
  2672                                  ;-416   if (digit(c)) { getdigit(c); return T_CONST; }
  2673                                  
  2674                                  .getlex124:
  2675 00000C5C 8A46FE                   mov al, byte [bp-2]
  2676 00000C5F B400                     mov ah, 0
  2677 00000C61 50                       push ax
  2678 00000C62 E836F5                   call digit
  2679 00000C65 83C402                   add  sp, 2
  2680 00000C68 08C0                     or  al, al
  2681 00000C6A 0F841200                 je .getlex125
  2682 00000C6E 8A46FE                   mov al, byte [bp-2]
  2683 00000C71 B400                     mov ah, 0
  2684 00000C73 50                       push ax
  2685 00000C74 E878FB                   call getdigit
  2686 00000C77 83C402                   add  sp, 2
  2687 00000C7A B80101                   mov ax, 257
  2688 00000C7D E98602                   jmp .retngetlex
  2689                                  
  2690                                  ;-417   if (c==39) { lexval=next();
  2691                                  
  2692                                  .getlex125:
  2693 00000C80 8A46FE                   mov al, [bp-2]
  2694 00000C83 3C27                     cmp al, 39
  2695 00000C85 0F854F00                 jne .getlex126
  2696 00000C89 E84BFB                   call next
  2697 00000C8C A3[2B00]                 mov word [lexval], ax
  2698                                  
  2699                                  ;-418     if (lexval==92) {lexval=next();
  2700                                  
  2701 00000C8F A1[2B00]                 mov ax, [lexval]
  2702 00000C92 83F85C                   cmp ax, 92
  2703 00000C95 0F853600                 jne .getlex127
  2704 00000C99 E83BFB                   call next
  2705 00000C9C A3[2B00]                 mov word [lexval], ax
  2706                                  
  2707                                  ;-419       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;
  2708                                  
  2709 00000C9F A1[2B00]                 mov ax, [lexval]
  2710 00000CA2 83F86E                   cmp ax, 110
  2711 00000CA5 0F850600                 jne .getlex128
  2712 00000CA9 B80A00                   mov ax, 10
  2713 00000CAC A3[2B00]                 mov word [lexval], ax
  2714                                  .getlex128:
  2715 00000CAF A1[2B00]                 mov ax, [lexval]
  2716 00000CB2 83F874                   cmp ax, 116
  2717 00000CB5 0F850600                 jne .getlex129
  2718 00000CB9 B80900                   mov ax, 9
  2719 00000CBC A3[2B00]                 mov word [lexval], ax
  2720                                  
  2721                                  ;-420       if (lexval=='0') lexval= 0; } next(); return T_CONST; }
  2722                                  
  2723                                  .getlex129:
  2724 00000CBF A1[2B00]                 mov ax, [lexval]
  2725 00000CC2 83F830                   cmp ax, 48
  2726 00000CC5 0F850600                 jne .getlex130
  2727 00000CC9 B80000                   mov ax, 0
  2728 00000CCC A3[2B00]                 mov word [lexval], ax
  2729                                  .getlex130:
  2730                                  .getlex127:
  2731 00000CCF E805FB                   call next
  2732 00000CD2 B80101                   mov ax, 257
  2733 00000CD5 E92E02                   jmp .retngetlex
  2734                                  
  2735                                  ;-421   if (alnum(c)) {
  2736                                  
  2737                                  .getlex126:
  2738 00000CD8 8A46FE                   mov al, byte [bp-2]
  2739 00000CDB B400                     mov ah, 0
  2740 00000CDD 50                       push ax
  2741 00000CDE E8E4F4                   call alnum
  2742 00000CE1 83C402                   add  sp, 2
  2743 00000CE4 08C0                     or  al, al
  2744 00000CE6 0F841302                 je .getlex131
  2745                                  
  2746                                  ;-422     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;
  2747                                  
  2748 00000CEA 8D06A36D                 lea  ax, [symbol]
  2749 00000CEE 50                       push ax
  2750 00000CEF 8D0654A5                 lea  ax, [symboltemp]
  2751 00000CF3 50                       push ax
  2752 00000CF4 E832F5                   call strcpy
  2753 00000CF7 83C404                   add  sp, 4
  2754 00000CFA B8A36D                   mov ax, symbol
  2755 00000CFD 8946FC                   mov [bp-4], ax
  2756 00000D00 8A46FE                   mov al, [bp-2]
  2757 00000D03 8B5EFC                   mov  bx, [bp-4]
  2758 00000D06 8807                     mov  [bx], al
  2759 00000D08 FF46FC                   inc  word[bp-4]
  2760                                  
  2761                                  ;-423     while(alnum(thechar)) {c=next(); *p=c;  p++; }
  2762                                  
  2763                                  .getlex132:
  2764 00000D0B A0[2200]                 mov al, byte [thechar]
  2765 00000D0E B400                     mov ah, 0
  2766 00000D10 50                       push ax
  2767 00000D11 E8B1F4                   call alnum
  2768 00000D14 83C402                   add  sp, 2
  2769 00000D17 08C0                     or  al, al
  2770 00000D19 0F841300                 je .getlex133
  2771 00000D1D E8B7FA                   call next
  2772 00000D20 8846FE                   mov [bp-2], al
  2773 00000D23 8A46FE                   mov al, [bp-2]
  2774 00000D26 8B5EFC                   mov  bx, [bp-4]
  2775 00000D29 8807                     mov  [bx], al
  2776 00000D2B FF46FC                   inc  word[bp-4]
  2777                                  
  2778                                  ;-424       *p=0;
  2779                                  
  2780 00000D2E EBDB                     jmp .getlex132
  2781                                  .getlex133:
  2782 00000D30 B80000                   mov ax, 0
  2783 00000D33 8B5EFC                   mov  bx, [bp-4]
  2784 00000D36 8807                     mov  [bx], al
  2785                                  
  2786                                  ;-425     if (eqstr(symbol,"signed"  )) return T_SIGNED;
  2787                                  
  2788 00000D38 68[1E0F]                 push getlex_1
  2789 00000D3B 8D06A36D                 lea  ax, [symbol]
  2790 00000D3F 50                       push ax
  2791 00000D40 E81CF5                   call eqstr
  2792 00000D43 83C404                   add  sp, 4
  2793 00000D46 08C0                     or  al, al
  2794 00000D48 0F840600                 je .getlex134
  2795 00000D4C B81302                   mov ax, 531
  2796 00000D4F E9B401                   jmp .retngetlex
  2797                                  
  2798                                  ;-426     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;
  2799                                  
  2800                                  .getlex134:
  2801 00000D52 68[250F]                 push getlex_2
  2802 00000D55 8D06A36D                 lea  ax, [symbol]
  2803 00000D59 50                       push ax
  2804 00000D5A E802F5                   call eqstr
  2805 00000D5D 83C404                   add  sp, 4
  2806 00000D60 08C0                     or  al, al
  2807 00000D62 0F840600                 je .getlex135
  2808 00000D66 B81402                   mov ax, 532
  2809 00000D69 E99A01                   jmp .retngetlex
  2810                                  
  2811                                  ;-427     if (eqstr(symbol,"void"    )) return T_VOID;
  2812                                  
  2813                                  .getlex135:
  2814 00000D6C 68[2E0F]                 push getlex_3
  2815 00000D6F 8D06A36D                 lea  ax, [symbol]
  2816 00000D73 50                       push ax
  2817 00000D74 E8E8F4                   call eqstr
  2818 00000D77 83C404                   add  sp, 4
  2819 00000D7A 08C0                     or  al, al
  2820 00000D7C 0F840600                 je .getlex136
  2821 00000D80 B81102                   mov ax, 529
  2822 00000D83 E98001                   jmp .retngetlex
  2823                                  
  2824                                  ;-428     if (eqstr(symbol,"int"     )) return T_INT;
  2825                                  
  2826                                  .getlex136:
  2827 00000D86 68[330F]                 push getlex_4
  2828 00000D89 8D06A36D                 lea  ax, [symbol]
  2829 00000D8D 50                       push ax
  2830 00000D8E E8CEF4                   call eqstr
  2831 00000D91 83C404                   add  sp, 4
  2832 00000D94 08C0                     or  al, al
  2833 00000D96 0F840600                 je .getlex137
  2834 00000D9A B80502                   mov ax, 517
  2835 00000D9D E96601                   jmp .retngetlex
  2836                                  
  2837                                  ;-429     if (eqstr(symbol,"long"    )) return T_LONG;
  2838                                  
  2839                                  .getlex137:
  2840 00000DA0 68[370F]                 push getlex_5
  2841 00000DA3 8D06A36D                 lea  ax, [symbol]
  2842 00000DA7 50                       push ax
  2843 00000DA8 E8B4F4                   call eqstr
  2844 00000DAB 83C404                   add  sp, 4
  2845 00000DAE 08C0                     or  al, al
  2846 00000DB0 0F840600                 je .getlex138
  2847 00000DB4 B81502                   mov ax, 533
  2848 00000DB7 E94C01                   jmp .retngetlex
  2849                                  
  2850                                  ;-430     if (eqstr(symbol,"char"    )) return T_CHAR;
  2851                                  
  2852                                  .getlex138:
  2853 00000DBA 68[3C0F]                 push getlex_6
  2854 00000DBD 8D06A36D                 lea  ax, [symbol]
  2855 00000DC1 50                       push ax
  2856 00000DC2 E89AF4                   call eqstr
  2857 00000DC5 83C404                   add  sp, 4
  2858 00000DC8 08C0                     or  al, al
  2859 00000DCA 0F840600                 je .getlex139
  2860 00000DCE B81202                   mov ax, 530
  2861 00000DD1 E93201                   jmp .retngetlex
  2862                                  
  2863                                  ;-431     if (eqstr(symbol,"asm"     )) return T_ASM;
  2864                                  
  2865                                  .getlex139:
  2866 00000DD4 68[410F]                 push getlex_7
  2867 00000DD7 8D06A36D                 lea  ax, [symbol]
  2868 00000DDB 50                       push ax
  2869 00000DDC E880F4                   call eqstr
  2870 00000DDF 83C404                   add  sp, 4
  2871 00000DE2 08C0                     or  al, al
  2872 00000DE4 0F840600                 je .getlex140
  2873 00000DE8 B80602                   mov ax, 518
  2874 00000DEB E91801                   jmp .retngetlex
  2875                                  
  2876                                  ;-432     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;
  2877                                  
  2878                                  .getlex140:
  2879 00000DEE 68[450F]                 push getlex_8
  2880 00000DF1 8D06A36D                 lea  ax, [symbol]
  2881 00000DF5 50                       push ax
  2882 00000DF6 E866F4                   call eqstr
  2883 00000DF9 83C404                   add  sp, 4
  2884 00000DFC 08C0                     or  al, al
  2885 00000DFE 0F840600                 je .getlex141
  2886 00000E02 B80702                   mov ax, 519
  2887 00000E05 E9FE00                   jmp .retngetlex
  2888                                  
  2889                                  ;-433     if (eqstr(symbol,"__emit__")) return T_EMIT;
  2890                                  
  2891                                  .getlex141:
  2892 00000E08 68[4B0F]                 push getlex_9
  2893 00000E0B 8D06A36D                 lea  ax, [symbol]
  2894 00000E0F 50                       push ax
  2895 00000E10 E84CF4                   call eqstr
  2896 00000E13 83C404                   add  sp, 4
  2897 00000E16 08C0                     or  al, al
  2898 00000E18 0F840600                 je .getlex142
  2899 00000E1C B80802                   mov ax, 520
  2900 00000E1F E9E400                   jmp .retngetlex
  2901                                  
  2902                                  ;-434     if (eqstr(symbol,"return"  )) return T_RETURN;
  2903                                  
  2904                                  .getlex142:
  2905 00000E22 68[540F]                 push getlex_10
  2906 00000E25 8D06A36D                 lea  ax, [symbol]
  2907 00000E29 50                       push ax
  2908 00000E2A E832F4                   call eqstr
  2909 00000E2D 83C404                   add  sp, 4
  2910 00000E30 08C0                     or  al, al
  2911 00000E32 0F840600                 je .getlex143
  2912 00000E36 B80002                   mov ax, 512
  2913 00000E39 E9CA00                   jmp .retngetlex
  2914                                  
  2915                                  ;-435     if (eqstr(symbol,"if"      )) return T_IF;
  2916                                  
  2917                                  .getlex143:
  2918 00000E3C 68[5B0F]                 push getlex_11
  2919 00000E3F 8D06A36D                 lea  ax, [symbol]
  2920 00000E43 50                       push ax
  2921 00000E44 E818F4                   call eqstr
  2922 00000E47 83C404                   add  sp, 4
  2923 00000E4A 08C0                     or  al, al
  2924 00000E4C 0F840600                 je .getlex144
  2925 00000E50 B80102                   mov ax, 513
  2926 00000E53 E9B000                   jmp .retngetlex
  2927                                  
  2928                                  ;-436     if (eqstr(symbol,"else"    )) return T_ELSE;
  2929                                  
  2930                                  .getlex144:
  2931 00000E56 68[5E0F]                 push getlex_12
  2932 00000E59 8D06A36D                 lea  ax, [symbol]
  2933 00000E5D 50                       push ax
  2934 00000E5E E8FEF3                   call eqstr
  2935 00000E61 83C404                   add  sp, 4
  2936 00000E64 08C0                     or  al, al
  2937 00000E66 0F840600                 je .getlex145
  2938 00000E6A B80202                   mov ax, 514
  2939 00000E6D E99600                   jmp .retngetlex
  2940                                  
  2941                                  ;-437     if (eqstr(symbol,"while"   )) return T_WHILE;
  2942                                  
  2943                                  .getlex145:
  2944 00000E70 68[630F]                 push getlex_13
  2945 00000E73 8D06A36D                 lea  ax, [symbol]
  2946 00000E77 50                       push ax
  2947 00000E78 E8E4F3                   call eqstr
  2948 00000E7B 83C404                   add  sp, 4
  2949 00000E7E 08C0                     or  al, al
  2950 00000E80 0F840600                 je .getlex146
  2951 00000E84 B80302                   mov ax, 515
  2952 00000E87 E97C00                   jmp .retngetlex
  2953                                  
  2954                                  ;-438     if (eqstr(symbol,"do"      )) return T_DO;
  2955                                  
  2956                                  .getlex146:
  2957 00000E8A 68[690F]                 push getlex_14
  2958 00000E8D 8D06A36D                 lea  ax, [symbol]
  2959 00000E91 50                       push ax
  2960 00000E92 E8CAF3                   call eqstr
  2961 00000E95 83C404                   add  sp, 4
  2962 00000E98 08C0                     or  al, al
  2963 00000E9A 0F840600                 je .getlex147
  2964 00000E9E B80402                   mov ax, 516
  2965 00000EA1 E96200                   jmp .retngetlex
  2966                                  
  2967                                  ;-439     if (eqstr(symbol,"goto"    )) return T_GOTO;
  2968                                  
  2969                                  .getlex147:
  2970 00000EA4 68[6C0F]                 push getlex_15
  2971 00000EA7 8D06A36D                 lea  ax, [symbol]
  2972 00000EAB 50                       push ax
  2973 00000EAC E8B0F3                   call eqstr
  2974 00000EAF 83C404                   add  sp, 4
  2975 00000EB2 08C0                     or  al, al
  2976 00000EB4 0F840600                 je .getlex148
  2977 00000EB8 B80902                   mov ax, 521
  2978 00000EBB E94800                   jmp .retngetlex
  2979                                  
  2980                                  ;-440     if (eqstr(symbol,"define"  )) return T_DEFINE;
  2981                                  
  2982                                  .getlex148:
  2983 00000EBE 68[710F]                 push getlex_16
  2984 00000EC1 8D06A36D                 lea  ax, [symbol]
  2985 00000EC5 50                       push ax
  2986 00000EC6 E896F3                   call eqstr
  2987 00000EC9 83C404                   add  sp, 4
  2988 00000ECC 08C0                     or  al, al
  2989 00000ECE 0F840600                 je .getlex149
  2990 00000ED2 B8FF01                   mov ax, 511
  2991 00000ED5 E92E00                   jmp .retngetlex
  2992                                  
  2993                                  ;-441     if (convertdefine() ) {
  2994                                  
  2995                                  .getlex149:
  2996 00000ED8 E899FA                   call convertdefine
  2997 00000EDB 08C0                     or  al, al
  2998 00000EDD 0F841600                 je .getlex150
  2999                                  
  3000                                  ;-442         strcpy(symbol, symboltemp); return T_CONST;
  3001                                  
  3002 00000EE1 8D0654A5                 lea  ax, [symboltemp]
  3003 00000EE5 50                       push ax
  3004 00000EE6 8D06A36D                 lea  ax, [symbol]
  3005 00000EEA 50                       push ax
  3006 00000EEB E83BF3                   call strcpy
  3007 00000EEE 83C404                   add  sp, 4
  3008 00000EF1 B80101                   mov ax, 257
  3009 00000EF4 E90F00                   jmp .retngetlex
  3010                                  
  3011                                  ;-443     }
  3012                                  
  3013                                  
  3014                                  ;-444     return T_NAME; } error1("Input item not recognized");
  3015                                  
  3016                                  .getlex150:
  3017 00000EF7 B80001                   mov ax, 256
  3018 00000EFA E90900                   jmp .retngetlex
  3019                                  .getlex131:
  3020 00000EFD 68[780F]                 push getlex_17
  3021 00000F00 E8FDF6                   call error1
  3022 00000F03 83C402                   add  sp, 2
  3023                                  
  3024                                  ;-445 }
  3025                                  
  3026                                  
  3027                                  ;-446 
  3028                                  
  3029                                  
  3030                                  ;-447 int istoken(int t) {
  3031                                  
  3032 00000F06 C9                       .retngetlex: LEAVE
  3033 00000F07 C3                       ret
  3034 00000F08 28295B5D7B7D2C3B2A-     getlex_0 db "()[]{},;*:%-><=+!&|#?",0
  3035 00000F11 3A252D3E3C3D2B2126-
  3036 00000F1A 7C233F00           
  3037 00000F1E 7369676E656400          getlex_1 db "signed",0
  3038 00000F25 756E7369676E656400      getlex_2 db "unsigned",0
  3039 00000F2E 766F696400              getlex_3 db "void",0
  3040 00000F33 696E7400                getlex_4 db "int",0
  3041 00000F37 6C6F6E6700              getlex_5 db "long",0
  3042 00000F3C 6368617200              getlex_6 db "char",0
  3043 00000F41 61736D00                getlex_7 db "asm",0
  3044 00000F45 5F5F61736D00            getlex_8 db "__asm",0
  3045 00000F4B 5F5F656D69745F5F00      getlex_9 db "__emit__",0
  3046 00000F54 72657475726E00          getlex_10 db "return",0
  3047 00000F5B 696600                  getlex_11 db "if",0
  3048 00000F5E 656C736500              getlex_12 db "else",0
  3049 00000F63 7768696C6500            getlex_13 db "while",0
  3050 00000F69 646F00                  getlex_14 db "do",0
  3051 00000F6C 676F746F00              getlex_15 db "goto",0
  3052 00000F71 646566696E6500          getlex_16 db "define",0
  3053 00000F78 496E70757420697465-     getlex_17 db "Input item not recognized",0
  3054 00000F81 6D206E6F7420726563-
  3055 00000F8A 6F676E697A656400   
  3056                                  ENDP
  3057                                  
  3058                                  istoken: PROC
  3059                                  
  3060                                  ;-448     if (token == t) {
  3061                                  ;
  3062 00000F92 C8000000                 ENTER  0,0
  3063 00000F96 A1[1E00]                 mov ax, [token]
  3064 00000F99 3B4604                   cmp ax, [bp+4]
  3065 00000F9C 0F850C00                 jne .istoken151
  3066                                  
  3067                                  ;-449         token=getlex();
  3068                                  
  3069 00000FA0 E870FA                   call getlex
  3070 00000FA3 A3[1E00]                 mov word [token], ax
  3071                                  
  3072                                  ;-450         return 1;
  3073                                  
  3074 00000FA6 B80100                   mov ax, 1
  3075 00000FA9 E90600                   jmp .retnistoken
  3076                                  
  3077                                  ;-451     }
  3078                                  
  3079                                  
  3080                                  ;-452     return 0;
  3081                                  
  3082                                  .istoken151:
  3083 00000FAC B80000                   mov ax, 0
  3084 00000FAF E90000                   jmp .retnistoken
  3085                                  
  3086                                  ;-453 }
  3087                                  
  3088                                  
  3089                                  ;-454 int expect(int t) {
  3090                                  
  3091 00000FB2 C9                       .retnistoken: LEAVE
  3092 00000FB3 C3                       ret
  3093                                  ENDP
  3094                                  
  3095                                  expect: PROC
  3096                                  
  3097                                  ;-455     if (istoken(t)==0) {
  3098                                  ;
  3099 00000FB4 C8000000                 ENTER  0,0
  3100 00000FB8 FF7604                   push word [bp+4]
  3101 00000FBB E8D4FF                   call istoken
  3102 00000FBE 83C402                   add  sp, 2
  3103 00000FC1 83F800                   cmp ax, 0
  3104 00000FC4 0F852F00                 jne .expect152
  3105                                  
  3106                                  ;-456         *cloc=0;
  3107                                  
  3108 00000FC8 B80000                   mov ax, 0
  3109 00000FCB 8B1E[1800]               mov  bx, [cloc]
  3110 00000FCF 8807                     mov  [bx], al
  3111                                  
  3112                                  ;-457         prs(co);
  3113                                  
  3114 00000FD1 8D06A861                 lea  ax, [co]
  3115 00000FD5 50                       push ax
  3116 00000FD6 E806F4                   call prs
  3117 00000FD9 83C402                   add  sp, 2
  3118                                  
  3119                                  ;-458         prs("\nExpected ASCII(dez): ");
  3120                                  
  3121 00000FDC 68[F90F]                 push expect_0
  3122 00000FDF E8FDF3                   call prs
  3123 00000FE2 83C402                   add  sp, 2
  3124                                  
  3125                                  ;-459         pint1(t);
  3126                                  
  3127 00000FE5 FF7604                   push word [bp+4]
  3128 00000FE8 E8F9F4                   call pint1
  3129 00000FEB 83C402                   add  sp, 2
  3130                                  
  3131                                  ;-460         error1(" not found");
  3132                                  
  3133 00000FEE 68[1110]                 push expect_1
  3134 00000FF1 E80CF6                   call error1
  3135 00000FF4 83C402                   add  sp, 2
  3136                                  
  3137                                  ;-461     }
  3138                                  
  3139                                  
  3140                                  ;-462 }
  3141                                  
  3142                                  .expect152:
  3143                                  
  3144                                  ;-463 
  3145                                  
  3146                                  
  3147                                  ;-464 int v(unsigned int i) {//value
  3148 00000FF7 C9                       LEAVE
  3149 00000FF8 C3                       ret
  3150 00000FF9 5C6E45787065637465-     expect_0 db "\nExpected ASCII(dez): ",0
  3151 00001002 642041534349492864-
  3152 0000100B 657A293A2000       
  3153 00001011 206E6F7420666F756E-     expect_1 db " not found",0
  3154 0000101A 6400               
  3155                                  ENDP
  3156                                  
  3157                                  v: PROC
  3158                                  
  3159                                  ;-465     if (i < LSTART) prc('[');
  3160                                  ;
  3161 0000101C C8000000                 ENTER  0,0
  3162 00001020 8B4604                   mov ax, [bp+4]
  3163 00001023 3DC800                   cmp ax, 200
  3164 00001026 0F8D0800                 jge .v153
  3165 0000102A 6A5B                     push 91
  3166 0000102C E857F3                   call prc
  3167 0000102F 83C402                   add  sp, 2
  3168                                  
  3169                                  ;-466     printName(i);
  3170                                  
  3171                                  .v153:
  3172 00001032 FF7604                   push word [bp+4]
  3173 00001035 E8D3F8                   call printName
  3174 00001038 83C402                   add  sp, 2
  3175                                  
  3176                                  ;-467     if (i < LSTART) prc(']');
  3177                                  
  3178 0000103B 8B4604                   mov ax, [bp+4]
  3179 0000103E 3DC800                   cmp ax, 200
  3180 00001041 0F8D0800                 jge .v154
  3181 00001045 6A5D                     push 93
  3182 00001047 E83CF3                   call prc
  3183 0000104A 83C402                   add  sp, 2
  3184                                  
  3185                                  ;-468 }
  3186                                  
  3187                                  .v154:
  3188                                  
  3189                                  ;-469 int checknamelen() {
  3190 0000104D C9                       LEAVE
  3191 0000104E C3                       ret
  3192                                  ENDP
  3193                                  
  3194                                  checknamelen: PROC
  3195                                  
  3196                                  ;-470     int i;
  3197                                  
  3198                                  
  3199                                  ;-471     i=strlen(symbol);
  3200                                  ;
  3201 0000104F C8020000                 ENTER  2,0
  3202 00001053 8D06A36D                 lea  ax, [symbol]
  3203 00001057 50                       push ax
  3204 00001058 E8A6F1                   call strlen
  3205 0000105B 83C402                   add  sp, 2
  3206 0000105E 8946FE                   mov [bp-2], ax
  3207                                  
  3208                                  ;-472     if (i > IDLENMAX) error1("Item name is too long in characters)");
  3209                                  
  3210 00001061 8B46FE                   mov ax, [bp-2]
  3211 00001064 83F80F                   cmp ax, 15
  3212 00001067 0F8E0900                 jle .checknamelen155
  3213 0000106B 68[7610]                 push checknamelen_0
  3214 0000106E E88FF5                   call error1
  3215 00001071 83C402                   add  sp, 2
  3216                                  
  3217                                  ;-473 }
  3218                                  
  3219                                  .checknamelen155:
  3220                                  
  3221                                  ;-474 
  3222                                  
  3223                                  
  3224                                  ;-475 int checkName() { unsigned int i; unsigned int j;
  3225 00001074 C9                       LEAVE
  3226 00001075 C3                       ret
  3227 00001076 4974656D206E616D65-     checknamelen_0 db "Item name is too long in characters)",0
  3228 0000107F 20697320746F6F206C-
  3229 00001088 6F6E6720696E206368-
  3230 00001091 617261637465727329-
  3231 0000109A 00                 
  3232                                  ENDP
  3233                                  
  3234                                  checkName: PROC
  3235                                  
  3236                                  ;-476     i=LSTART;
  3237                                  ;
  3238 0000109B C8040000                 ENTER  4,0
  3239 0000109F B8C800                   mov ax, 200
  3240 000010A2 8946FE                   mov [bp-2], ax
  3241                                  
  3242                                  ;-477     while(i<LTop) {
  3243                                  
  3244                                  .checkName156:
  3245 000010A5 8B46FE                   mov ax, [bp-2]
  3246 000010A8 3B06[3A00]               cmp ax, [LTop]
  3247 000010AC 0F8D3000                 jge .checkName157
  3248                                  
  3249                                  ;-478         j=adrF(GNameField, i);
  3250                                  
  3251 000010B0 FF76FE                   push word [bp-2]
  3252 000010B3 8D067879                 lea  ax, [GNameField]
  3253 000010B7 50                       push ax
  3254 000010B8 E841F8                   call adrF
  3255 000010BB 83C404                   add  sp, 4
  3256 000010BE 8946FC                   mov [bp-4], ax
  3257                                  
  3258                                  ;-479         if(eqstr(symbol,j))return i;
  3259                                  
  3260 000010C1 FF76FC                   push word [bp-4]
  3261 000010C4 8D06A36D                 lea  ax, [symbol]
  3262 000010C8 50                       push ax
  3263 000010C9 E893F1                   call eqstr
  3264 000010CC 83C404                   add  sp, 4
  3265 000010CF 08C0                     or  al, al
  3266 000010D1 0F840600                 je .checkName158
  3267 000010D5 8B46FE                   mov ax, [bp-2]
  3268 000010D8 E94C00                   jmp .retncheckName
  3269                                  
  3270                                  ;-480         i++;
  3271                                  
  3272                                  .checkName158:
  3273 000010DB FF46FE                   inc  word[bp-2]
  3274                                  
  3275                                  ;-481     }
  3276                                  
  3277                                  
  3278                                  ;-482     i=1;
  3279                                  
  3280 000010DE EBC5                     jmp .checkName156
  3281                                  .checkName157:
  3282 000010E0 B80100                   mov ax, 1
  3283 000010E3 8946FE                   mov [bp-2], ax
  3284                                  
  3285                                  ;-483     while(i<GTop) {
  3286                                  
  3287                                  .checkName159:
  3288 000010E6 8B46FE                   mov ax, [bp-2]
  3289 000010E9 3B06[3800]               cmp ax, [GTop]
  3290 000010ED 0F8D3000                 jge .checkName160
  3291                                  
  3292                                  ;-484         j=adrF(GNameField, i);
  3293                                  
  3294 000010F1 FF76FE                   push word [bp-2]
  3295 000010F4 8D067879                 lea  ax, [GNameField]
  3296 000010F8 50                       push ax
  3297 000010F9 E800F8                   call adrF
  3298 000010FC 83C404                   add  sp, 4
  3299 000010FF 8946FC                   mov [bp-4], ax
  3300                                  
  3301                                  ;-485         if(eqstr(symbol,j))return i;
  3302                                  
  3303 00001102 FF76FC                   push word [bp-4]
  3304 00001105 8D06A36D                 lea  ax, [symbol]
  3305 00001109 50                       push ax
  3306 0000110A E852F1                   call eqstr
  3307 0000110D 83C404                   add  sp, 4
  3308 00001110 08C0                     or  al, al
  3309 00001112 0F840600                 je .checkName161
  3310 00001116 8B46FE                   mov ax, [bp-2]
  3311 00001119 E90B00                   jmp .retncheckName
  3312                                  
  3313                                  ;-486         i++;
  3314                                  
  3315                                  .checkName161:
  3316 0000111C FF46FE                   inc  word[bp-2]
  3317                                  
  3318                                  ;-487     }
  3319                                  
  3320                                  
  3321                                  ;-488     return 0;
  3322                                  
  3323 0000111F EBC5                     jmp .checkName159
  3324                                  .checkName160:
  3325 00001121 B80000                   mov ax, 0
  3326 00001124 E90000                   jmp .retncheckName
  3327                                  
  3328                                  ;-489 }
  3329                                  
  3330                                  
  3331                                  ;-490 int searchname() { unsigned int i;
  3332                                  
  3333 00001127 C9                       .retncheckName: LEAVE
  3334 00001128 C3                       ret
  3335                                  ENDP
  3336                                  
  3337                                  searchname: PROC
  3338                                  
  3339                                  ;-491   i=checkName(); if (i == 0) error1("Variable unknown");
  3340                                  ;
  3341 00001129 C8020000                 ENTER  2,0
  3342 0000112D E86BFF                   call checkName
  3343 00001130 8946FE                   mov [bp-2], ax
  3344 00001133 8B46FE                   mov ax, [bp-2]
  3345 00001136 83F800                   cmp ax, 0
  3346 00001139 0F850900                 jne .searchname162
  3347 0000113D 68[6311]                 push searchname_0
  3348 00001140 E8BDF4                   call error1
  3349 00001143 83C402                   add  sp, 2
  3350                                  
  3351                                  ;-492   GUsed[i]=GUsed[i] + 1; return i;
  3352                                  
  3353                                  .searchname162:
  3354 00001146 8B5EFE                   mov bx, [bp-2]
  3355 00001149 D1E3                     shl bx, 1
  3356 0000114B 8B87C874                 mov ax, [GUsed + bx]
  3357 0000114F 83C001                   add ax, 1
  3358 00001152 8B5EFE                   mov bx, [bp-2]
  3359 00001155 D1E3                     shl bx, 1
  3360 00001157 8987C874                 mov [GUsed+bx], ax
  3361 0000115B 8B46FE                   mov ax, [bp-2]
  3362 0000115E E90000                   jmp .retnsearchname
  3363                                  
  3364                                  ;-493 }
  3365                                  
  3366                                  
  3367                                  ;-494 int name1() {
  3368                                  
  3369 00001161 C9                       .retnsearchname: LEAVE
  3370 00001162 C3                       ret
  3371 00001163 5661726961626C6520-     searchname_0 db "Variable unknown",0
  3372 0000116C 756E6B6E6F776E00   
  3373                                  ENDP
  3374                                  
  3375                                  name1: PROC
  3376                                  
  3377                                  ;-495     if (token!=T_NAME) error1("Name expected");
  3378                                  
  3379 00001174 A1[1E00]                 mov ax, [token]
  3380 00001177 3D0001                   cmp ax, 256
  3381 0000117A 0F840900                 je  .name1163
  3382 0000117E 68[8E11]                 push name1_0
  3383 00001181 E87CF4                   call error1
  3384 00001184 83C402                   add  sp, 2
  3385                                  
  3386                                  ;-496     token=getlex();
  3387                                  
  3388                                  .name1163:
  3389 00001187 E889F8                   call getlex
  3390 0000118A A3[1E00]                 mov word [token], ax
  3391                                  
  3392                                  ;-497 }
  3393                                  
  3394                                  
  3395                                  ;-498 int typeName() { int m; //0=V,1=*,2=&
  3396                                  
  3397 0000118D C3                       ret
  3398 0000118E 4E616D652065787065-     name1_0 db "Name expected",0
  3399 00001197 6374656400         
  3400                                  ENDP
  3401                                  
  3402                                  typeName: PROC
  3403                                  
  3404                                  ;-499     issign='S';
  3405                                  ;
  3406 0000119C C8020000                 ENTER  2,0
  3407 000011A0 B85300                   mov ax, 83
  3408 000011A3 A2[3200]                 mov byte [issign], al
  3409                                  
  3410                                  ;-500     if(istoken(T_SIGNED))   issign='S';
  3411                                  
  3412 000011A6 681302                   push 531
  3413 000011A9 E8E6FD                   call istoken
  3414 000011AC 83C402                   add  sp, 2
  3415 000011AF 08C0                     or  al, al
  3416 000011B1 0F840600                 je .typeName164
  3417 000011B5 B85300                   mov ax, 83
  3418 000011B8 A2[3200]                 mov byte [issign], al
  3419                                  
  3420                                  ;-501     if(istoken(T_UNSIGNED)) issign='U';
  3421                                  
  3422                                  .typeName164:
  3423 000011BB 681402                   push 532
  3424 000011BE E8D1FD                   call istoken
  3425 000011C1 83C402                   add  sp, 2
  3426 000011C4 08C0                     or  al, al
  3427 000011C6 0F840600                 je .typeName165
  3428 000011CA B85500                   mov ax, 85
  3429 000011CD A2[3200]                 mov byte [issign], al
  3430                                  
  3431                                  ;-502     iswidth=2;
  3432                                  
  3433                                  .typeName165:
  3434 000011D0 B80200                   mov ax, 2
  3435 000011D3 A2[3500]                 mov byte [iswidth], al
  3436                                  
  3437                                  ;-503     if(istoken(T_VOID))     iswidth=0;
  3438                                  
  3439 000011D6 681102                   push 529
  3440 000011D9 E8B6FD                   call istoken
  3441 000011DC 83C402                   add  sp, 2
  3442 000011DF 08C0                     or  al, al
  3443 000011E1 0F840600                 je .typeName166
  3444 000011E5 B80000                   mov ax, 0
  3445 000011E8 A2[3500]                 mov byte [iswidth], al
  3446                                  
  3447                                  ;-504     if(istoken(T_CHAR))     iswidth=1;
  3448                                  
  3449                                  .typeName166:
  3450 000011EB 681202                   push 530
  3451 000011EE E8A1FD                   call istoken
  3452 000011F1 83C402                   add  sp, 2
  3453 000011F4 08C0                     or  al, al
  3454 000011F6 0F840600                 je .typeName167
  3455 000011FA B80100                   mov ax, 1
  3456 000011FD A2[3500]                 mov byte [iswidth], al
  3457                                  
  3458                                  ;-505     if(istoken(T_INT))      iswidth=2;
  3459                                  
  3460                                  .typeName167:
  3461 00001200 680502                   push 517
  3462 00001203 E88CFD                   call istoken
  3463 00001206 83C402                   add  sp, 2
  3464 00001209 08C0                     or  al, al
  3465 0000120B 0F840600                 je .typeName168
  3466 0000120F B80200                   mov ax, 2
  3467 00001212 A2[3500]                 mov byte [iswidth], al
  3468                                  
  3469                                  ;-506     if(istoken(T_LONG))     iswidth=4;
  3470                                  
  3471                                  .typeName168:
  3472 00001215 681502                   push 533
  3473 00001218 E877FD                   call istoken
  3474 0000121B 83C402                   add  sp, 2
  3475 0000121E 08C0                     or  al, al
  3476 00001220 0F840600                 je .typeName169
  3477 00001224 B80400                   mov ax, 4
  3478 00001227 A2[3500]                 mov byte [iswidth], al
  3479                                  
  3480                                  ;-507     istype='V';
  3481                                  
  3482                                  .typeName169:
  3483 0000122A B85600                   mov ax, 86
  3484 0000122D A2[2F00]                 mov byte [istype], al
  3485                                  
  3486                                  ;-508     m=0;
  3487                                  
  3488 00001230 B80000                   mov ax, 0
  3489 00001233 8946FE                   mov [bp-2], ax
  3490                                  
  3491                                  ;-509     if(istoken('*'))  {istype='*'; m=1;}
  3492                                  
  3493 00001236 6A2A                     push 42
  3494 00001238 E857FD                   call istoken
  3495 0000123B 83C402                   add  sp, 2
  3496 0000123E 08C0                     or  al, al
  3497 00001240 0F840C00                 je .typeName170
  3498 00001244 B82A00                   mov ax, 42
  3499 00001247 A2[2F00]                 mov byte [istype], al
  3500 0000124A B80100                   mov ax, 1
  3501 0000124D 8946FE                   mov [bp-2], ax
  3502                                  
  3503                                  ;-510     if(istoken('&'))  {istype='&'; m=2;}
  3504                                  
  3505                                  .typeName170:
  3506 00001250 6A26                     push 38
  3507 00001252 E83DFD                   call istoken
  3508 00001255 83C402                   add  sp, 2
  3509 00001258 08C0                     or  al, al
  3510 0000125A 0F840C00                 je .typeName171
  3511 0000125E B82600                   mov ax, 38
  3512 00001261 A2[2F00]                 mov byte [istype], al
  3513 00001264 B80200                   mov ax, 2
  3514 00001267 8946FE                   mov [bp-2], ax
  3515                                  
  3516                                  ;-511     name1();
  3517                                  
  3518                                  .typeName171:
  3519 0000126A E807FF                   call name1
  3520                                  
  3521                                  ;-512     return m;
  3522                                  
  3523 0000126D 8B46FE                   mov ax, [bp-2]
  3524 00001270 E90000                   jmp .retntypeName
  3525                                  
  3526                                  ;-513 }
  3527                                  
  3528                                  
  3529                                  ;-514 int gettypes(int i) {int j; char c;
  3530                                  
  3531 00001273 C9                       .retntypeName: LEAVE
  3532 00001274 C3                       ret
  3533                                  ENDP
  3534                                  
  3535                                  gettypes: PROC
  3536                                  
  3537                                  ;-515   c=GSign [i]; if (c=='S') signi =1;    else signi =0;
  3538                                  ;
  3539 00001275 C8040000                 ENTER  4,0
  3540 00001279 8B5E04                   mov bx, [bp+4]
  3541 0000127C 8A871870                 mov al, [GSign + bx]
  3542 00001280 8846FC                   mov [bp-4], al
  3543 00001283 8A46FC                   mov al, [bp-4]
  3544 00001286 3C53                     cmp al, 83
  3545 00001288 0F850900                 jne .gettypes172
  3546 0000128C B80100                   mov ax, 1
  3547 0000128F A3[3000]                 mov word [signi], ax
  3548 00001292 E90600                   jmp .gettypes173
  3549                                  .gettypes172:
  3550 00001295 B80000                   mov ax, 0
  3551 00001298 A3[3000]                 mov word [signi], ax
  3552                                  
  3553                                  ;-516   c=GWidth[i]; widthi=0;wi=0;
  3554                                  
  3555                                  .gettypes173:
  3556 0000129B 8B5E04                   mov bx, [bp+4]
  3557 0000129E 8A874471                 mov al, [GWidth + bx]
  3558 000012A2 8846FC                   mov [bp-4], al
  3559 000012A5 B80000                   mov ax, 0
  3560 000012A8 A3[3300]                 mov word [widthi], ax
  3561 000012AB B80000                   mov ax, 0
  3562 000012AE A3[3600]                 mov word [wi], ax
  3563                                  
  3564                                  ;-517   if (c==1) {widthi=1;wi=1;}
  3565                                  
  3566 000012B1 8A46FC                   mov al, [bp-4]
  3567 000012B4 3C01                     cmp al, 1
  3568 000012B6 0F850C00                 jne .gettypes174
  3569 000012BA B80100                   mov ax, 1
  3570 000012BD A3[3300]                 mov word [widthi], ax
  3571 000012C0 B80100                   mov ax, 1
  3572 000012C3 A3[3600]                 mov word [wi], ax
  3573                                  
  3574                                  ;-518   if (c==2) {widthi=2;wi=2;}
  3575                                  
  3576                                  .gettypes174:
  3577 000012C6 8A46FC                   mov al, [bp-4]
  3578 000012C9 3C02                     cmp al, 2
  3579 000012CB 0F850C00                 jne .gettypes175
  3580 000012CF B80200                   mov ax, 2
  3581 000012D2 A3[3300]                 mov word [widthi], ax
  3582 000012D5 B80200                   mov ax, 2
  3583 000012D8 A3[3600]                 mov word [wi], ax
  3584                                  
  3585                                  ;-519   if (c==4) {widthi=4;wi=4;}
  3586                                  
  3587                                  .gettypes175:
  3588 000012DB 8A46FC                   mov al, [bp-4]
  3589 000012DE 3C04                     cmp al, 4
  3590 000012E0 0F850C00                 jne .gettypes176
  3591 000012E4 B80400                   mov ax, 4
  3592 000012E7 A3[3300]                 mov word [widthi], ax
  3593 000012EA B80400                   mov ax, 4
  3594 000012ED A3[3600]                 mov word [wi], ax
  3595                                  
  3596                                  ;-520   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}
  3597                                  
  3598                                  .gettypes176:
  3599 000012F0 8B5E04                   mov bx, [bp+4]
  3600 000012F3 8A87EC6E                 mov al, [GType + bx]
  3601 000012F7 8846FC                   mov [bp-4], al
  3602 000012FA B80000                   mov ax, 0
  3603 000012FD A3[2D00]                 mov word [typei], ax
  3604 00001300 8A46FC                   mov al, [bp-4]
  3605 00001303 3C2A                     cmp al, 42
  3606 00001305 0F850C00                 jne .gettypes177
  3607 00001309 B80100                   mov ax, 1
  3608 0000130C A3[2D00]                 mov word [typei], ax
  3609 0000130F B80200                   mov ax, 2
  3610 00001312 A3[3600]                 mov word [wi], ax
  3611                                  
  3612                                  ;-521   if (c=='&')  typei=2;
  3613                                  
  3614                                  .gettypes177:
  3615 00001315 8A46FC                   mov al, [bp-4]
  3616 00001318 3C26                     cmp al, 38
  3617 0000131A 0F850600                 jne .gettypes178
  3618 0000131E B80200                   mov ax, 2
  3619 00001321 A3[2D00]                 mov word [typei], ax
  3620                                  
  3621                                  ;-522   return i; }
  3622                                  
  3623                                  .gettypes178:
  3624 00001324 8B4604                   mov ax, [bp+4]
  3625 00001327 E90000                   jmp .retngettypes
  3626                                  
  3627                                  ;-523 
  3628                                  
  3629                                  
  3630                                  ;-524 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
  3631                                  
  3632 0000132A C9                       .retngettypes: LEAVE
  3633 0000132B C3                       ret
  3634                                  ENDP
  3635                                  
  3636                                  storefunc: PROC
  3637 0000132C A1[3C00]                 mov ax, [FTop]
  3638 0000132F 3D2C01                   cmp ax, 300 ;unsigned : 1
  3639 00001332 0F8C0900                 jl  .storefunc179
  3640 00001336 68[8D13]                 push storefunc_0
  3641 00001339 E8C4F2                   call error1
  3642 0000133C 83C402                   add  sp, 2
  3643                                  
  3644                                  ;-525     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;
  3645                                  
  3646                                  .storefunc179:
  3647 0000133F A1[4000]                 mov ax, [lineno]
  3648 00001342 83E801                   sub ax, 1
  3649 00001345 8B1E[3C00]               mov bx, [FTop]
  3650 00001349 D1E3                     shl bx, 1
  3651 0000134B 8987648D                 mov [FAdr+bx], ax
  3652 0000134F B80000                   mov ax, 0
  3653 00001352 8B1E[3C00]               mov bx, [FTop]
  3654 00001356 D1E3                     shl bx, 1
  3655 00001358 8987BC8F                 mov [FCalls+bx], ax
  3656 0000135C A0[3500]                 mov al, [iswidth]
  3657 0000135F 8B1E[3C00]               mov bx, [FTop]
  3658 00001363 8887388C                 mov [FType+bx], al
  3659                                  
  3660                                  ;-526     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;
  3661                                  
  3662 00001367 FF36[3C00]               push word [FTop]
  3663 0000136B 8D061492                 lea  ax, [FNameField]
  3664 0000136F 50                       push ax
  3665 00001370 E889F5                   call adrF
  3666 00001373 83C404                   add  sp, 4
  3667 00001376 A3[4200]                 mov word [pt], ax
  3668 00001379 8D06A36D                 lea  ax, [symbol]
  3669 0000137D 50                       push ax
  3670 0000137E FF36[4200]               push word [pt]
  3671 00001382 E8A4EE                   call strcpy
  3672 00001385 83C404                   add  sp, 4
  3673 00001388 FF06[3C00]               inc  word[FTop]
  3674                                  
  3675                                  ;-527 }
  3676                                  
  3677                                  
  3678                                  ;-528 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");
  3679                                  
  3680 0000138C C3                       ret
  3681 0000138D 46756E6374696F6E20-     storefunc_0 db "Function table full",0
  3682 00001396 7461626C652066756C-
  3683 0000139F 6C00               
  3684                                  ENDP
  3685                                  
  3686                                  addlocal: PROC
  3687 000013A1 A1[3A00]                 mov ax, [LTop]
  3688 000013A4 3D2C01                   cmp ax, 300 ;unsigned : 1
  3689 000013A7 0F8C0900                 jl  .addlocal180
  3690 000013AB 68[2714]                 push addlocal_0
  3691 000013AE E84FF2                   call error1
  3692 000013B1 83C402                   add  sp, 2
  3693                                  
  3694                                  ;-529   if (checkName() != 0) error1("Variable already defined");
  3695                                  
  3696                                  .addlocal180:
  3697 000013B4 E8E4FC                   call checkName
  3698 000013B7 83F800                   cmp ax, 0
  3699 000013BA 0F840900                 je  .addlocal181
  3700 000013BE 68[4114]                 push addlocal_1
  3701 000013C1 E83CF2                   call error1
  3702 000013C4 83C402                   add  sp, 2
  3703                                  
  3704                                  ;-530   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;
  3705                                  
  3706                                  .addlocal181:
  3707 000013C7 A0[3200]                 mov al, [issign]
  3708 000013CA 8B1E[3A00]               mov bx, [LTop]
  3709 000013CE 88871870                 mov [GSign+bx], al
  3710 000013D2 A0[3500]                 mov al, [iswidth]
  3711 000013D5 8B1E[3A00]               mov bx, [LTop]
  3712 000013D9 88874471                 mov [GWidth+bx], al
  3713 000013DD A0[2F00]                 mov al, [istype]
  3714 000013E0 8B1E[3A00]               mov bx, [LTop]
  3715 000013E4 8887EC6E                 mov [GType+bx], al
  3716                                  
  3717                                  ;-531   GAdr [LTop]=lineno-1; GUsed[LTop]=0;
  3718                                  
  3719 000013E8 A1[4000]                 mov ax, [lineno]
  3720 000013EB 83E801                   sub ax, 1
  3721 000013EE 8B1E[3A00]               mov bx, [LTop]
  3722 000013F2 D1E3                     shl bx, 1
  3723 000013F4 89877072                 mov [GAdr+bx], ax
  3724 000013F8 B80000                   mov ax, 0
  3725 000013FB 8B1E[3A00]               mov bx, [LTop]
  3726 000013FF D1E3                     shl bx, 1
  3727 00001401 8987C874                 mov [GUsed+bx], ax
  3728                                  
  3729                                  ;-532   pt=adrF(GNameField, LTop); strcpy(pt, symbol);
  3730                                  
  3731 00001405 FF36[3A00]               push word [LTop]
  3732 00001409 8D067879                 lea  ax, [GNameField]
  3733 0000140D 50                       push ax
  3734 0000140E E8EBF4                   call adrF
  3735 00001411 83C404                   add  sp, 4
  3736 00001414 A3[4200]                 mov word [pt], ax
  3737 00001417 8D06A36D                 lea  ax, [symbol]
  3738 0000141B 50                       push ax
  3739 0000141C FF36[4200]               push word [pt]
  3740 00001420 E806EE                   call strcpy
  3741 00001423 83C404                   add  sp, 4
  3742                                  
  3743                                  ;-533 }
  3744                                  
  3745                                  
  3746                                  ;-534 int checkFunction() { unsigned int i; unsigned int j; i=0;
  3747                                  
  3748 00001426 C3                       ret
  3749 00001427 4C6F63616C20766172-     addlocal_0 db "Local variable table full",0
  3750 00001430 6961626C6520746162-
  3751 00001439 6C652066756C6C00   
  3752 00001441 5661726961626C6520-     addlocal_1 db "Variable already defined",0
  3753 0000144A 616C72656164792064-
  3754 00001453 6566696E656400     
  3755                                  ENDP
  3756                                  
  3757                                  checkFunction: PROC;
  3758 0000145A C8040000                 ENTER  4,0
  3759 0000145E B80000                   mov ax, 0
  3760 00001461 8946FE                   mov [bp-2], ax
  3761                                  
  3762                                  ;-535   while (i < FTop) {
  3763                                  
  3764                                  .checkFunction182:
  3765 00001464 8B46FE                   mov ax, [bp-2]
  3766 00001467 3B06[3C00]               cmp ax, [FTop]
  3767 0000146B 0F8D3000                 jge .checkFunction183
  3768                                  
  3769                                  ;-536     j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}
  3770                                  
  3771 0000146F FF76FE                   push word [bp-2]
  3772 00001472 8D061492                 lea  ax, [FNameField]
  3773 00001476 50                       push ax
  3774 00001477 E882F4                   call adrF
  3775 0000147A 83C404                   add  sp, 4
  3776 0000147D 8946FC                   mov [bp-4], ax
  3777 00001480 FF76FC                   push word [bp-4]
  3778 00001483 8D06A36D                 lea  ax, [symbol]
  3779 00001487 50                       push ax
  3780 00001488 E8D4ED                   call eqstr
  3781 0000148B 83C404                   add  sp, 4
  3782 0000148E 08C0                     or  al, al
  3783 00001490 0F840600                 je .checkFunction184
  3784 00001494 8B46FE                   mov ax, [bp-2]
  3785 00001497 E90B00                   jmp .retncheckFunction
  3786                                  .checkFunction184:
  3787 0000149A FF46FE                   inc  word[bp-2]
  3788                                  
  3789                                  ;-537   return 0; }
  3790                                  
  3791 0000149D EBC5                     jmp .checkFunction182
  3792                                  .checkFunction183:
  3793 0000149F B80000                   mov ax, 0
  3794 000014A2 E90000                   jmp .retncheckFunction
  3795                                  
  3796                                  ;-538 
  3797                                  
  3798                                  
  3799                                  ;-539 int isvariable() {
  3800                                  
  3801 000014A5 C9                       .retncheckFunction: LEAVE
  3802 000014A6 C3                       ret
  3803                                  ENDP
  3804                                  
  3805                                  isvariable: PROC
  3806                                  
  3807                                  ;-540     if(token==T_SIGNED)   goto v1;
  3808                                  
  3809 000014A7 A1[1E00]                 mov ax, [token]
  3810 000014AA 3D1302                   cmp ax, 531
  3811 000014AD 0F850300                 jne .isvariable185
  3812 000014B1 E93A00                   jmp .v1
  3813                                  
  3814                                  ;-541     if(token==T_UNSIGNED) goto v1;
  3815                                  
  3816                                  .isvariable185:
  3817 000014B4 A1[1E00]                 mov ax, [token]
  3818 000014B7 3D1402                   cmp ax, 532
  3819 000014BA 0F850300                 jne .isvariable186
  3820 000014BE E92D00                   jmp .v1
  3821                                  
  3822                                  ;-542     if(token==T_CHAR)     goto v1;
  3823                                  
  3824                                  .isvariable186:
  3825 000014C1 A1[1E00]                 mov ax, [token]
  3826 000014C4 3D1202                   cmp ax, 530
  3827 000014C7 0F850300                 jne .isvariable187
  3828 000014CB E92000                   jmp .v1
  3829                                  
  3830                                  ;-543     if(token==T_INT)      goto v1;
  3831                                  
  3832                                  .isvariable187:
  3833 000014CE A1[1E00]                 mov ax, [token]
  3834 000014D1 3D0502                   cmp ax, 517
  3835 000014D4 0F850300                 jne .isvariable188
  3836 000014D8 E91300                   jmp .v1
  3837                                  
  3838                                  ;-544     if(token==T_LONG)     goto v1;
  3839                                  
  3840                                  .isvariable188:
  3841 000014DB A1[1E00]                 mov ax, [token]
  3842 000014DE 3D1502                   cmp ax, 533
  3843 000014E1 0F850300                 jne .isvariable189
  3844 000014E5 E90600                   jmp .v1
  3845                                  
  3846                                  ;-545     return 0;
  3847                                  
  3848                                  .isvariable189:
  3849 000014E8 B80000                   mov ax, 0
  3850 000014EB E90600                   jmp .retnisvariable
  3851                                  
  3852                                  ;-546 v1: return 1;
  3853                                  
  3854                                  .v1:
  3855 000014EE B80100                   mov ax, 1
  3856 000014F1 E90000                   jmp .retnisvariable
  3857                                  
  3858                                  ;-547 }
  3859                                  
  3860                                  
  3861                                  ;-548 
  3862                                  
  3863                                  
  3864                                  ;-549 int cmpneg(int ids) {
  3865                                  
  3866                                   .retnisvariable:
  3867 000014F4 C3                       ret
  3868                                  ENDP
  3869                                  
  3870                                  cmpneg: PROC
  3871                                  
  3872                                  ;-550        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
  3873                                  ;
  3874 000014F5 C8000000                 ENTER  0,0
  3875 000014F9 A1[2300]                 mov ax, [iscmp]
  3876 000014FC 3D2603                   cmp ax, 806
  3877 000014FF 0F850C00                 jne .cmpneg190
  3878 00001503 68[D615]                 push cmpneg_0
  3879 00001506 E8D6EE                   call prs
  3880 00001509 83C402                   add  sp, 2
  3881                                  
  3882                                  ;-551   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1
  3883                                  
  3884 0000150C E9C500                   jmp .cmpneg191
  3885                                  .cmpneg190:
  3886 0000150F A1[2300]                 mov ax, [iscmp]
  3887 00001512 3D2703                   cmp ax, 807
  3888 00001515 0F850C00                 jne .cmpneg192
  3889 00001519 68[DF15]                 push cmpneg_1
  3890 0000151C E8C0EE                   call prs
  3891 0000151F 83C402                   add  sp, 2
  3892                                  
  3893                                  ;-552   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF
  3894                                  
  3895 00001522 E9AF00                   jmp .cmpneg193
  3896                                  .cmpneg192:
  3897 00001525 A1[2300]                 mov ax, [iscmp]
  3898 00001528 3D3803                   cmp ax, 824
  3899 0000152B 0F852100                 jne .cmpneg194
  3900 0000152F 8B4604                   mov ax, [bp+4]
  3901 00001532 08C0                     or  al, al
  3902 00001534 0F840C00                 je .cmpneg195
  3903 00001538 68[E815]                 push cmpneg_2
  3904 0000153B E8A1EE                   call prs
  3905 0000153E 83C402                   add  sp, 2
  3906                                  
  3907                                  ;-553                            else prs("\n ja  .");//ZF=0 CF=0
  3908                                  
  3909 00001541 E90900                   jmp .cmpneg196
  3910                                  .cmpneg195:
  3911 00001544 68[F115]                 push cmpneg_3
  3912 00001547 E895EE                   call prs
  3913 0000154A 83C402                   add  sp, 2
  3914                                  
  3915                                  ;-554   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);
  3916                                  
  3917                                  .cmpneg196:
  3918 0000154D E98400                   jmp .cmpneg197
  3919                                  .cmpneg194:
  3920 00001550 A1[2300]                 mov ax, [iscmp]
  3921 00001553 3D2B03                   cmp ax, 811
  3922 00001556 0F854500                 jne .cmpneg198
  3923 0000155A 8B4604                   mov ax, [bp+4]
  3924 0000155D 08C0                     or  al, al
  3925 0000155F 0F841E00                 je .cmpneg199
  3926 00001563 68[FA15]                 push cmpneg_4
  3927 00001566 E876EE                   call prs
  3928 00001569 83C402                   add  sp, 2
  3929 0000156C FF7604                   push word [bp+4]
  3930 0000156F E8D0EF                   call prunsign1
  3931 00001572 83C402                   add  sp, 2
  3932                                  
  3933                                  ;-555                                prs("\n jl  .");}//          SF!=OF
  3934                                  
  3935 00001575 68[0816]                 push cmpneg_5
  3936 00001578 E864EE                   call prs
  3937 0000157B 83C402                   add  sp, 2
  3938                                  
  3939                                  ;-556                            else{prs(" ;unsigned : "); prunsign1(ids);
  3940                                  
  3941 0000157E E91B00                   jmp .cmpneg200
  3942                                  .cmpneg199:
  3943 00001581 68[1116]                 push cmpneg_6
  3944 00001584 E858EE                   call prs
  3945 00001587 83C402                   add  sp, 2
  3946 0000158A FF7604                   push word [bp+4]
  3947 0000158D E8B2EF                   call prunsign1
  3948 00001590 83C402                   add  sp, 2
  3949                                  
  3950                                  ;-557                                prs("\n jb  .");}//jb=jc=CF=1
  3951                                  
  3952 00001593 68[1F16]                 push cmpneg_7
  3953 00001596 E846EE                   call prs
  3954 00001599 83C402                   add  sp, 2
  3955                                  
  3956                                  ;-558   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF
  3957                                  
  3958                                  .cmpneg200:
  3959 0000159C E93500                   jmp .cmpneg201
  3960                                  .cmpneg198:
  3961 0000159F A1[2300]                 mov ax, [iscmp]
  3962 000015A2 83F83C                   cmp ax, 60
  3963 000015A5 0F850C00                 jne .cmpneg202
  3964 000015A9 68[2816]                 push cmpneg_8
  3965 000015AC E830EE                   call prs
  3966 000015AF 83C402                   add  sp, 2
  3967                                  
  3968                                  ;-559   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF
  3969                                  
  3970 000015B2 E91F00                   jmp .cmpneg203
  3971                                  .cmpneg202:
  3972 000015B5 A1[2300]                 mov ax, [iscmp]
  3973 000015B8 83F83E                   cmp ax, 62
  3974 000015BB 0F850C00                 jne .cmpneg204
  3975 000015BF 68[3116]                 push cmpneg_9
  3976 000015C2 E81AEE                   call prs
  3977 000015C5 83C402                   add  sp, 2
  3978                                  
  3979                                  ;-560   else error1("internal error compare unknown in CMPNEG()");  }
  3980                                  
  3981 000015C8 E90900                   jmp .cmpneg205
  3982                                  .cmpneg204:
  3983 000015CB 68[3A16]                 push cmpneg_10
  3984 000015CE E82FF0                   call error1
  3985 000015D1 83C402                   add  sp, 2
  3986                                  .cmpneg205:
  3987                                  .cmpneg203:
  3988                                  .cmpneg201:
  3989                                  .cmpneg197:
  3990                                  .cmpneg193:
  3991                                  .cmpneg191:
  3992                                  
  3993                                  ;-561 
  3994                                  
  3995                                  
  3996                                  ;-562   int isrelational() {
  3997 000015D4 C9                       LEAVE
  3998 000015D5 C3                       ret
  3999 000015D6 5C6E206A6E65202E00      cmpneg_0 db "\n jne .",0
  4000 000015DF 5C6E206A6520202E00      cmpneg_1 db "\n je  .",0
  4001 000015E8 5C6E206A6720202E00      cmpneg_2 db "\n jg  .",0
  4002 000015F1 5C6E206A6120202E00      cmpneg_3 db "\n ja  .",0
  4003 000015FA 203B756E7369676E65-     cmpneg_4 db " ;unsigned : ",0
  4004 00001603 64203A2000         
  4005 00001608 5C6E206A6C20202E00      cmpneg_5 db "\n jl  .",0
  4006 00001611 203B756E7369676E65-     cmpneg_6 db " ;unsigned : ",0
  4007 0000161A 64203A2000         
  4008 0000161F 5C6E206A6220202E00      cmpneg_7 db "\n jb  .",0
  4009 00001628 5C6E206A6765202E00      cmpneg_8 db "\n jge .",0
  4010 00001631 5C6E206A6C65202E00      cmpneg_9 db "\n jle .",0
  4011 0000163A 696E7465726E616C20-     cmpneg_10 db "internal error compare unknown in CMPNEG()",0
  4012 00001643 6572726F7220636F6D-
  4013 0000164C 7061726520756E6B6E-
  4014 00001655 6F776E20696E20434D-
  4015 0000165E 504E4547282900     
  4016                                  ENDP
  4017                                  
  4018                                  isrelational: PROC
  4019                                  
  4020                                  ;-563     if (token==T_EQ) goto w; if (token==T_NE) goto w;
  4021                                  
  4022 00001665 A1[1E00]                 mov ax, [token]
  4023 00001668 3D2603                   cmp ax, 806
  4024 0000166B 0F850300                 jne .isrelational206
  4025 0000166F E94700                   jmp .w
  4026                                  .isrelational206:
  4027 00001672 A1[1E00]                 mov ax, [token]
  4028 00001675 3D2703                   cmp ax, 807
  4029 00001678 0F850300                 jne .isrelational207
  4030 0000167C E93A00                   jmp .w
  4031                                  
  4032                                  ;-564     if (token==T_LE) goto w; if (token==T_GE) goto w;
  4033                                  
  4034                                  .isrelational207:
  4035 0000167F A1[1E00]                 mov ax, [token]
  4036 00001682 3D3803                   cmp ax, 824
  4037 00001685 0F850300                 jne .isrelational208
  4038 00001689 E92D00                   jmp .w
  4039                                  .isrelational208:
  4040 0000168C A1[1E00]                 mov ax, [token]
  4041 0000168F 3D2B03                   cmp ax, 811
  4042 00001692 0F850300                 jne .isrelational209
  4043 00001696 E92000                   jmp .w
  4044                                  
  4045                                  ;-565     if (token=='<' ) goto w; if (token=='>' ) goto w;
  4046                                  
  4047                                  .isrelational209:
  4048 00001699 A1[1E00]                 mov ax, [token]
  4049 0000169C 83F83C                   cmp ax, 60
  4050 0000169F 0F850300                 jne .isrelational210
  4051 000016A3 E91300                   jmp .w
  4052                                  .isrelational210:
  4053 000016A6 A1[1E00]                 mov ax, [token]
  4054 000016A9 83F83E                   cmp ax, 62
  4055 000016AC 0F850300                 jne .isrelational211
  4056 000016B0 E90600                   jmp .w
  4057                                  
  4058                                  ;-566     return 0;  w: iscmp=token; token=getlex(); return 1;}
  4059                                  
  4060                                  .isrelational211:
  4061 000016B3 B80000                   mov ax, 0
  4062 000016B6 E91200                   jmp .retnisrelational
  4063                                  .w:
  4064 000016B9 A1[1E00]                 mov ax, [token]
  4065 000016BC A3[2300]                 mov word [iscmp], ax
  4066 000016BF E851F3                   call getlex
  4067 000016C2 A3[1E00]                 mov word [token], ax
  4068 000016C5 B80100                   mov ax, 1
  4069 000016C8 E90000                   jmp .retnisrelational
  4070                                  
  4071                                  ;-567 
  4072                                  
  4073                                  
  4074                                  ;-568 int checkreg() { // >=17 = 16bit, >=47 = 32bit
  4075                                  
  4076                                   .retnisrelational:
  4077 000016CB C3                       ret
  4078                                  ENDP
  4079                                  
  4080                                  checkreg: PROC
  4081                                  
  4082                                  ;-569   if (strlen(symbol) <  2) return 0;
  4083                                  
  4084 000016CC 8D06A36D                 lea  ax, [symbol]
  4085 000016D0 50                       push ax
  4086 000016D1 E82DEB                   call strlen
  4087 000016D4 83C402                   add  sp, 2
  4088 000016D7 83F802                   cmp ax, 2
  4089 000016DA 0F8D0600                 jge .checkreg212
  4090 000016DE B80000                   mov ax, 0
  4091 000016E1 E94403                   jmp .retncheckreg
  4092                                  
  4093                                  ;-570   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;
  4094                                  
  4095                                  .checkreg212:
  4096 000016E4 68[291A]                 push checkreg_0
  4097 000016E7 8D06A36D                 lea  ax, [symbol]
  4098 000016EB 50                       push ax
  4099 000016EC E870EB                   call eqstr
  4100 000016EF 83C404                   add  sp, 4
  4101 000016F2 08C0                     or  al, al
  4102 000016F4 0F840600                 je .checkreg213
  4103 000016F8 B80100                   mov ax, 1
  4104 000016FB E92A03                   jmp .retncheckreg
  4105                                  .checkreg213:
  4106 000016FE 68[2C1A]                 push checkreg_1
  4107 00001701 8D06A36D                 lea  ax, [symbol]
  4108 00001705 50                       push ax
  4109 00001706 E856EB                   call eqstr
  4110 00001709 83C404                   add  sp, 4
  4111 0000170C 08C0                     or  al, al
  4112 0000170E 0F840600                 je .checkreg214
  4113 00001712 B80300                   mov ax, 3
  4114 00001715 E91003                   jmp .retncheckreg
  4115                                  
  4116                                  ;-571   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;
  4117                                  
  4118                                  .checkreg214:
  4119 00001718 68[2F1A]                 push checkreg_2
  4120 0000171B 8D06A36D                 lea  ax, [symbol]
  4121 0000171F 50                       push ax
  4122 00001720 E83CEB                   call eqstr
  4123 00001723 83C404                   add  sp, 4
  4124 00001726 08C0                     or  al, al
  4125 00001728 0F840600                 je .checkreg215
  4126 0000172C B80500                   mov ax, 5
  4127 0000172F E9F602                   jmp .retncheckreg
  4128                                  .checkreg215:
  4129 00001732 68[321A]                 push checkreg_3
  4130 00001735 8D06A36D                 lea  ax, [symbol]
  4131 00001739 50                       push ax
  4132 0000173A E822EB                   call eqstr
  4133 0000173D 83C404                   add  sp, 4
  4134 00001740 08C0                     or  al, al
  4135 00001742 0F840600                 je .checkreg216
  4136 00001746 B80700                   mov ax, 7
  4137 00001749 E9DC02                   jmp .retncheckreg
  4138                                  
  4139                                  ;-572   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;
  4140                                  
  4141                                  .checkreg216:
  4142 0000174C 68[351A]                 push checkreg_4
  4143 0000174F 8D06A36D                 lea  ax, [symbol]
  4144 00001753 50                       push ax
  4145 00001754 E808EB                   call eqstr
  4146 00001757 83C404                   add  sp, 4
  4147 0000175A 08C0                     or  al, al
  4148 0000175C 0F840600                 je .checkreg217
  4149 00001760 B80900                   mov ax, 9
  4150 00001763 E9C202                   jmp .retncheckreg
  4151                                  .checkreg217:
  4152 00001766 68[381A]                 push checkreg_5
  4153 00001769 8D06A36D                 lea  ax, [symbol]
  4154 0000176D 50                       push ax
  4155 0000176E E8EEEA                   call eqstr
  4156 00001771 83C404                   add  sp, 4
  4157 00001774 08C0                     or  al, al
  4158 00001776 0F840600                 je .checkreg218
  4159 0000177A B80B00                   mov ax, 11
  4160 0000177D E9A802                   jmp .retncheckreg
  4161                                  
  4162                                  ;-573   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;
  4163                                  
  4164                                  .checkreg218:
  4165 00001780 68[3B1A]                 push checkreg_6
  4166 00001783 8D06A36D                 lea  ax, [symbol]
  4167 00001787 50                       push ax
  4168 00001788 E8D4EA                   call eqstr
  4169 0000178B 83C404                   add  sp, 4
  4170 0000178E 08C0                     or  al, al
  4171 00001790 0F840600                 je .checkreg219
  4172 00001794 B80D00                   mov ax, 13
  4173 00001797 E98E02                   jmp .retncheckreg
  4174                                  .checkreg219:
  4175 0000179A 68[3E1A]                 push checkreg_7
  4176 0000179D 8D06A36D                 lea  ax, [symbol]
  4177 000017A1 50                       push ax
  4178 000017A2 E8BAEA                   call eqstr
  4179 000017A5 83C404                   add  sp, 4
  4180 000017A8 08C0                     or  al, al
  4181 000017AA 0F840600                 je .checkreg220
  4182 000017AE B80F00                   mov ax, 15
  4183 000017B1 E97402                   jmp .retncheckreg
  4184                                  
  4185                                  ;-574   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;
  4186                                  
  4187                                  .checkreg220:
  4188 000017B4 68[411A]                 push checkreg_8
  4189 000017B7 8D06A36D                 lea  ax, [symbol]
  4190 000017BB 50                       push ax
  4191 000017BC E8A0EA                   call eqstr
  4192 000017BF 83C404                   add  sp, 4
  4193 000017C2 08C0                     or  al, al
  4194 000017C4 0F840600                 je .checkreg221
  4195 000017C8 B81100                   mov ax, 17
  4196 000017CB E95A02                   jmp .retncheckreg
  4197                                  .checkreg221:
  4198 000017CE 68[441A]                 push checkreg_9
  4199 000017D1 8D06A36D                 lea  ax, [symbol]
  4200 000017D5 50                       push ax
  4201 000017D6 E886EA                   call eqstr
  4202 000017D9 83C404                   add  sp, 4
  4203 000017DC 08C0                     or  al, al
  4204 000017DE 0F840600                 je .checkreg222
  4205 000017E2 B81300                   mov ax, 19
  4206 000017E5 E94002                   jmp .retncheckreg
  4207                                  
  4208                                  ;-575   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;
  4209                                  
  4210                                  .checkreg222:
  4211 000017E8 68[471A]                 push checkreg_10
  4212 000017EB 8D06A36D                 lea  ax, [symbol]
  4213 000017EF 50                       push ax
  4214 000017F0 E86CEA                   call eqstr
  4215 000017F3 83C404                   add  sp, 4
  4216 000017F6 08C0                     or  al, al
  4217 000017F8 0F840600                 je .checkreg223
  4218 000017FC B81500                   mov ax, 21
  4219 000017FF E92602                   jmp .retncheckreg
  4220                                  .checkreg223:
  4221 00001802 68[4A1A]                 push checkreg_11
  4222 00001805 8D06A36D                 lea  ax, [symbol]
  4223 00001809 50                       push ax
  4224 0000180A E852EA                   call eqstr
  4225 0000180D 83C404                   add  sp, 4
  4226 00001810 08C0                     or  al, al
  4227 00001812 0F840600                 je .checkreg224
  4228 00001816 B81700                   mov ax, 23
  4229 00001819 E90C02                   jmp .retncheckreg
  4230                                  
  4231                                  ;-576   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;
  4232                                  
  4233                                  .checkreg224:
  4234 0000181C 68[4D1A]                 push checkreg_12
  4235 0000181F 8D06A36D                 lea  ax, [symbol]
  4236 00001823 50                       push ax
  4237 00001824 E838EA                   call eqstr
  4238 00001827 83C404                   add  sp, 4
  4239 0000182A 08C0                     or  al, al
  4240 0000182C 0F840600                 je .checkreg225
  4241 00001830 B81900                   mov ax, 25
  4242 00001833 E9F201                   jmp .retncheckreg
  4243                                  .checkreg225:
  4244 00001836 68[501A]                 push checkreg_13
  4245 00001839 8D06A36D                 lea  ax, [symbol]
  4246 0000183D 50                       push ax
  4247 0000183E E81EEA                   call eqstr
  4248 00001841 83C404                   add  sp, 4
  4249 00001844 08C0                     or  al, al
  4250 00001846 0F840600                 je .checkreg226
  4251 0000184A B81B00                   mov ax, 27
  4252 0000184D E9D801                   jmp .retncheckreg
  4253                                  
  4254                                  ;-577   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;
  4255                                  
  4256                                  .checkreg226:
  4257 00001850 68[531A]                 push checkreg_14
  4258 00001853 8D06A36D                 lea  ax, [symbol]
  4259 00001857 50                       push ax
  4260 00001858 E804EA                   call eqstr
  4261 0000185B 83C404                   add  sp, 4
  4262 0000185E 08C0                     or  al, al
  4263 00001860 0F840600                 je .checkreg227
  4264 00001864 B81D00                   mov ax, 29
  4265 00001867 E9BE01                   jmp .retncheckreg
  4266                                  .checkreg227:
  4267 0000186A 68[561A]                 push checkreg_15
  4268 0000186D 8D06A36D                 lea  ax, [symbol]
  4269 00001871 50                       push ax
  4270 00001872 E8EAE9                   call eqstr
  4271 00001875 83C404                   add  sp, 4
  4272 00001878 08C0                     or  al, al
  4273 0000187A 0F840600                 je .checkreg228
  4274 0000187E B81F00                   mov ax, 31
  4275 00001881 E9A401                   jmp .retncheckreg
  4276                                  
  4277                                  ;-578   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;
  4278                                  
  4279                                  .checkreg228:
  4280 00001884 68[591A]                 push checkreg_16
  4281 00001887 8D06A36D                 lea  ax, [symbol]
  4282 0000188B 50                       push ax
  4283 0000188C E8D0E9                   call eqstr
  4284 0000188F 83C404                   add  sp, 4
  4285 00001892 08C0                     or  al, al
  4286 00001894 0F840600                 je .checkreg229
  4287 00001898 B82100                   mov ax, 33
  4288 0000189B E98A01                   jmp .retncheckreg
  4289                                  .checkreg229:
  4290 0000189E 68[5C1A]                 push checkreg_17
  4291 000018A1 8D06A36D                 lea  ax, [symbol]
  4292 000018A5 50                       push ax
  4293 000018A6 E8B6E9                   call eqstr
  4294 000018A9 83C404                   add  sp, 4
  4295 000018AC 08C0                     or  al, al
  4296 000018AE 0F840600                 je .checkreg230
  4297 000018B2 B82300                   mov ax, 35
  4298 000018B5 E97001                   jmp .retncheckreg
  4299                                  
  4300                                  ;-579   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;
  4301                                  
  4302                                  .checkreg230:
  4303 000018B8 68[5F1A]                 push checkreg_18
  4304 000018BB 8D06A36D                 lea  ax, [symbol]
  4305 000018BF 50                       push ax
  4306 000018C0 E89CE9                   call eqstr
  4307 000018C3 83C404                   add  sp, 4
  4308 000018C6 08C0                     or  al, al
  4309 000018C8 0F840600                 je .checkreg231
  4310 000018CC B82500                   mov ax, 37
  4311 000018CF E95601                   jmp .retncheckreg
  4312                                  .checkreg231:
  4313 000018D2 68[621A]                 push checkreg_19
  4314 000018D5 8D06A36D                 lea  ax, [symbol]
  4315 000018D9 50                       push ax
  4316 000018DA E882E9                   call eqstr
  4317 000018DD 83C404                   add  sp, 4
  4318 000018E0 08C0                     or  al, al
  4319 000018E2 0F840600                 je .checkreg232
  4320 000018E6 B82700                   mov ax, 39
  4321 000018E9 E93C01                   jmp .retncheckreg
  4322                                  
  4323                                  ;-580   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;
  4324                                  
  4325                                  .checkreg232:
  4326 000018EC 68[651A]                 push checkreg_20
  4327 000018EF 8D06A36D                 lea  ax, [symbol]
  4328 000018F3 50                       push ax
  4329 000018F4 E868E9                   call eqstr
  4330 000018F7 83C404                   add  sp, 4
  4331 000018FA 08C0                     or  al, al
  4332 000018FC 0F840600                 je .checkreg233
  4333 00001900 B82900                   mov ax, 41
  4334 00001903 E92201                   jmp .retncheckreg
  4335                                  .checkreg233:
  4336 00001906 68[681A]                 push checkreg_21
  4337 00001909 8D06A36D                 lea  ax, [symbol]
  4338 0000190D 50                       push ax
  4339 0000190E E84EE9                   call eqstr
  4340 00001911 83C404                   add  sp, 4
  4341 00001914 08C0                     or  al, al
  4342 00001916 0F840600                 je .checkreg234
  4343 0000191A B82B00                   mov ax, 43
  4344 0000191D E90801                   jmp .retncheckreg
  4345                                  
  4346                                  ;-581   // (eqstr(symbol,"ip")) return 45;
  4347                                  
  4348                                  
  4349                                  ;-582   if (strlen(symbol) >   3) return 0;
  4350                                  
  4351                                  .checkreg234:
  4352 00001920 8D06A36D                 lea  ax, [symbol]
  4353 00001924 50                       push ax
  4354 00001925 E8D9E8                   call strlen
  4355 00001928 83C402                   add  sp, 2
  4356 0000192B 83F803                   cmp ax, 3
  4357 0000192E 0F8E0600                 jle .checkreg235
  4358 00001932 B80000                   mov ax, 0
  4359 00001935 E9F000                   jmp .retncheckreg
  4360                                  
  4361                                  ;-583   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;
  4362                                  
  4363                                  .checkreg235:
  4364 00001938 68[6B1A]                 push checkreg_22
  4365 0000193B 8D06A36D                 lea  ax, [symbol]
  4366 0000193F 50                       push ax
  4367 00001940 E81CE9                   call eqstr
  4368 00001943 83C404                   add  sp, 4
  4369 00001946 08C0                     or  al, al
  4370 00001948 0F840600                 je .checkreg236
  4371 0000194C B82F00                   mov ax, 47
  4372 0000194F E9D600                   jmp .retncheckreg
  4373                                  .checkreg236:
  4374 00001952 68[6F1A]                 push checkreg_23
  4375 00001955 8D06A36D                 lea  ax, [symbol]
  4376 00001959 50                       push ax
  4377 0000195A E802E9                   call eqstr
  4378 0000195D 83C404                   add  sp, 4
  4379 00001960 08C0                     or  al, al
  4380 00001962 0F840600                 je .checkreg237
  4381 00001966 B83200                   mov ax, 50
  4382 00001969 E9BC00                   jmp .retncheckreg
  4383                                  
  4384                                  ;-584   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;
  4385                                  
  4386                                  .checkreg237:
  4387 0000196C 68[731A]                 push checkreg_24
  4388 0000196F 8D06A36D                 lea  ax, [symbol]
  4389 00001973 50                       push ax
  4390 00001974 E8E8E8                   call eqstr
  4391 00001977 83C404                   add  sp, 4
  4392 0000197A 08C0                     or  al, al
  4393 0000197C 0F840600                 je .checkreg238
  4394 00001980 B83500                   mov ax, 53
  4395 00001983 E9A200                   jmp .retncheckreg
  4396                                  .checkreg238:
  4397 00001986 68[771A]                 push checkreg_25
  4398 00001989 8D06A36D                 lea  ax, [symbol]
  4399 0000198D 50                       push ax
  4400 0000198E E8CEE8                   call eqstr
  4401 00001991 83C404                   add  sp, 4
  4402 00001994 08C0                     or  al, al
  4403 00001996 0F840600                 je .checkreg239
  4404 0000199A B83800                   mov ax, 56
  4405 0000199D E98800                   jmp .retncheckreg
  4406                                  
  4407                                  ;-585   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;
  4408                                  
  4409                                  .checkreg239:
  4410 000019A0 68[7B1A]                 push checkreg_26
  4411 000019A3 8D06A36D                 lea  ax, [symbol]
  4412 000019A7 50                       push ax
  4413 000019A8 E8B4E8                   call eqstr
  4414 000019AB 83C404                   add  sp, 4
  4415 000019AE 08C0                     or  al, al
  4416 000019B0 0F840600                 je .checkreg240
  4417 000019B4 B83B00                   mov ax, 59
  4418 000019B7 E96E00                   jmp .retncheckreg
  4419                                  .checkreg240:
  4420 000019BA 68[7F1A]                 push checkreg_27
  4421 000019BD 8D06A36D                 lea  ax, [symbol]
  4422 000019C1 50                       push ax
  4423 000019C2 E89AE8                   call eqstr
  4424 000019C5 83C404                   add  sp, 4
  4425 000019C8 08C0                     or  al, al
  4426 000019CA 0F840600                 je .checkreg241
  4427 000019CE B83E00                   mov ax, 62
  4428 000019D1 E95400                   jmp .retncheckreg
  4429                                  
  4430                                  ;-586   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;
  4431                                  
  4432                                  .checkreg241:
  4433 000019D4 68[831A]                 push checkreg_28
  4434 000019D7 8D06A36D                 lea  ax, [symbol]
  4435 000019DB 50                       push ax
  4436 000019DC E880E8                   call eqstr
  4437 000019DF 83C404                   add  sp, 4
  4438 000019E2 08C0                     or  al, al
  4439 000019E4 0F840600                 je .checkreg242
  4440 000019E8 B84100                   mov ax, 65
  4441 000019EB E93A00                   jmp .retncheckreg
  4442                                  .checkreg242:
  4443 000019EE 68[871A]                 push checkreg_29
  4444 000019F1 8D06A36D                 lea  ax, [symbol]
  4445 000019F5 50                       push ax
  4446 000019F6 E866E8                   call eqstr
  4447 000019F9 83C404                   add  sp, 4
  4448 000019FC 08C0                     or  al, al
  4449 000019FE 0F840600                 je .checkreg243
  4450 00001A02 B84400                   mov ax, 68
  4451 00001A05 E92000                   jmp .retncheckreg
  4452                                  
  4453                                  ;-587   if (eqstr(symbol,"cr0")) return 71;
  4454                                  
  4455                                  .checkreg243:
  4456 00001A08 68[8B1A]                 push checkreg_30
  4457 00001A0B 8D06A36D                 lea  ax, [symbol]
  4458 00001A0F 50                       push ax
  4459 00001A10 E84CE8                   call eqstr
  4460 00001A13 83C404                   add  sp, 4
  4461 00001A16 08C0                     or  al, al
  4462 00001A18 0F840600                 je .checkreg244
  4463 00001A1C B84700                   mov ax, 71
  4464 00001A1F E90600                   jmp .retncheckreg
  4465                                  
  4466                                  ;-588   return 0;   }
  4467                                  
  4468                                  .checkreg244:
  4469 00001A22 B80000                   mov ax, 0
  4470 00001A25 E90000                   jmp .retncheckreg
  4471                                  
  4472                                  ;-589 
  4473                                  
  4474                                  
  4475                                  ;-590 char printregstr[]
  4476                                  
  4477                                   .retncheckreg:
  4478 00001A28 C3                       ret
  4479 00001A29 616C00                  checkreg_0 db "al",0
  4480 00001A2C 636C00                  checkreg_1 db "cl",0
  4481 00001A2F 646C00                  checkreg_2 db "dl",0
  4482 00001A32 626C00                  checkreg_3 db "bl",0
  4483 00001A35 616800                  checkreg_4 db "ah",0
  4484 00001A38 636800                  checkreg_5 db "ch",0
  4485 00001A3B 646800                  checkreg_6 db "dh",0
  4486 00001A3E 626800                  checkreg_7 db "bh",0
  4487 00001A41 617800                  checkreg_8 db "ax",0
  4488 00001A44 637800                  checkreg_9 db "cx",0
  4489 00001A47 647800                  checkreg_10 db "dx",0
  4490 00001A4A 627800                  checkreg_11 db "bx",0
  4491 00001A4D 737000                  checkreg_12 db "sp",0
  4492 00001A50 627000                  checkreg_13 db "bp",0
  4493 00001A53 736900                  checkreg_14 db "si",0
  4494 00001A56 646900                  checkreg_15 db "di",0
  4495 00001A59 657300                  checkreg_16 db "es",0
  4496 00001A5C 637300                  checkreg_17 db "cs",0
  4497 00001A5F 737300                  checkreg_18 db "ss",0
  4498 00001A62 647300                  checkreg_19 db "ds",0
  4499 00001A65 667300                  checkreg_20 db "fs",0
  4500 00001A68 677300                  checkreg_21 db "gs",0
  4501 00001A6B 65617800                checkreg_22 db "eax",0
  4502 00001A6F 65637800                checkreg_23 db "ecx",0
  4503 00001A73 65647800                checkreg_24 db "edx",0
  4504 00001A77 65627800                checkreg_25 db "ebx",0
  4505 00001A7B 65737000                checkreg_26 db "esp",0
  4506 00001A7F 65627000                checkreg_27 db "ebp",0
  4507 00001A83 65736900                checkreg_28 db "esi",0
  4508 00001A87 65646900                checkreg_29 db "edi",0
  4509 00001A8B 63723000                checkreg_30 db "cr0",0
  4510                                  ENDP
  4511                                  
  4512                                  ;-591 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";
  4513                                  
  4514 00001A8F 2A616C636C646C626C-     printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0
  4515 00001A98 616863686468626861-
  4516 00001AA1 786378647862787370-
  4517 00001AAA 627073696469657363-
  4518 00001AB3 737373647366736773-
  4519 00001ABC 697065617865637865-
  4520 00001AC5 647865627865737065-
  4521 00001ACE 627065736965646963-
  4522 00001AD7 723000             
  4523                                  
  4524                                  ;-592 
  4525                                  
  4526                                  
  4527                                  ;-593 int printreg(int i) {  unsigned int k; unsigned char c;
  4528                                  
  4529                                  
  4530                                  printreg: PROC
  4531                                  
  4532                                  ;-594   k = &printregstr + i; c=*k; prc(c); i++;
  4533                                  ;
  4534 00001ADA C8040000                 ENTER  4,0
  4535 00001ADE B8[8F1A]                 mov ax, printregstr
  4536 00001AE1 034604                   add ax, [bp+4]
  4537 00001AE4 8946FE                   mov [bp-2], ax
  4538 00001AE7 8B5EFE                   mov bx, [bp-2]
  4539 00001AEA 8B07                     mov ax, [bx]
  4540 00001AEC 8846FC                   mov [bp-4], al
  4541 00001AEF 8A46FC                   mov al, byte [bp-4]
  4542 00001AF2 B400                     mov ah, 0
  4543 00001AF4 50                       push ax
  4544 00001AF5 E88EE8                   call prc
  4545 00001AF8 83C402                   add  sp, 2
  4546 00001AFB FF4604                   inc  word[bp+4]
  4547                                  
  4548                                  ;-595   k = &printregstr + i; c=*k; prc(c);
  4549                                  
  4550 00001AFE B8[8F1A]                 mov ax, printregstr
  4551 00001B01 034604                   add ax, [bp+4]
  4552 00001B04 8946FE                   mov [bp-2], ax
  4553 00001B07 8B5EFE                   mov bx, [bp-2]
  4554 00001B0A 8B07                     mov ax, [bx]
  4555 00001B0C 8846FC                   mov [bp-4], al
  4556 00001B0F 8A46FC                   mov al, byte [bp-4]
  4557 00001B12 B400                     mov ah, 0
  4558 00001B14 50                       push ax
  4559 00001B15 E86EE8                   call prc
  4560 00001B18 83C402                   add  sp, 2
  4561                                  
  4562                                  ;-596   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }
  4563                                  
  4564 00001B1B 8B4604                   mov ax, [bp+4]
  4565 00001B1E 83F82F                   cmp ax, 47
  4566 00001B21 0F8E2000                 jle .printreg245
  4567 00001B25 FF4604                   inc  word[bp+4]
  4568 00001B28 B8[8F1A]                 mov ax, printregstr
  4569 00001B2B 034604                   add ax, [bp+4]
  4570 00001B2E 8946FE                   mov [bp-2], ax
  4571 00001B31 8B5EFE                   mov bx, [bp-2]
  4572 00001B34 8B07                     mov ax, [bx]
  4573 00001B36 8846FC                   mov [bp-4], al
  4574 00001B39 8A46FC                   mov al, byte [bp-4]
  4575 00001B3C B400                     mov ah, 0
  4576 00001B3E 50                       push ax
  4577 00001B3F E844E8                   call prc
  4578 00001B42 83C402                   add  sp, 2
  4579                                  
  4580                                  ;-597 }
  4581                                  
  4582                                  .printreg245:
  4583                                  
  4584                                  ;-598 
  4585                                  
  4586                                  
  4587                                  ;-599 int constantexpr() { int mode; int id1;int ids;
  4588 00001B45 C9                       LEAVE
  4589 00001B46 C3                       ret
  4590                                  ENDP
  4591                                  
  4592                                  constantexpr: PROC
  4593                                  
  4594                                  ;-600   token=getlex();   mode=typeName();
  4595                                  ;
  4596 00001B47 C8060000                 ENTER  6,0
  4597 00001B4B E8C5EE                   call getlex
  4598 00001B4E A3[1E00]                 mov word [token], ax
  4599 00001B51 E848F6                   call typeName
  4600 00001B54 8946FE                   mov [bp-2], ax
  4601                                  
  4602                                  ;-601   id1=searchname(); gettypes(id1); ids=signi;
  4603                                  
  4604 00001B57 E8CFF5                   call searchname
  4605 00001B5A 8946FC                   mov [bp-4], ax
  4606 00001B5D FF76FC                   push word [bp-4]
  4607 00001B60 E812F7                   call gettypes
  4608 00001B63 83C402                   add  sp, 2
  4609 00001B66 A1[3000]                 mov ax, [signi]
  4610 00001B69 8946FA                   mov [bp-6], ax
  4611                                  
  4612                                  ;-602   if (isrelational() ==0) error1("Relational expression expected");
  4613                                  
  4614 00001B6C E8F6FA                   call isrelational
  4615 00001B6F 83F800                   cmp ax, 0
  4616 00001B72 0F850900                 jne .constantexpr246
  4617 00001B76 68[FC1B]                 push constantexpr_0
  4618 00001B79 E884EA                   call error1
  4619 00001B7C 83C402                   add  sp, 2
  4620                                  
  4621                                  ;-603   expect(T_CONST);  prs(" ; constant expression");
  4622                                  
  4623                                  .constantexpr246:
  4624 00001B7F 680101                   push 257
  4625 00001B82 E82FF4                   call expect
  4626 00001B85 83C402                   add  sp, 2
  4627 00001B88 68[1B1C]                 push constantexpr_1
  4628 00001B8B E851E8                   call prs
  4629 00001B8E 83C402                   add  sp, 2
  4630                                  
  4631                                  ;-604   prs("\ncmp ");
  4632                                  
  4633 00001B91 68[321C]                 push constantexpr_2
  4634 00001B94 E848E8                   call prs
  4635 00001B97 83C402                   add  sp, 2
  4636                                  
  4637                                  ;-605   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  4638                                  
  4639 00001B9A FF76FC                   push word [bp-4]
  4640 00001B9D E8D5F6                   call gettypes
  4641 00001BA0 83C402                   add  sp, 2
  4642 00001BA3 A1[3600]                 mov ax, [wi]
  4643 00001BA6 83F802                   cmp ax, 2
  4644 00001BA9 0F850C00                 jne .constantexpr247
  4645 00001BAD 68[391C]                 push constantexpr_3
  4646 00001BB0 E82CE8                   call prs
  4647 00001BB3 83C402                   add  sp, 2
  4648 00001BB6 E90900                   jmp .constantexpr248
  4649                                  .constantexpr247:
  4650 00001BB9 68[3E1C]                 push constantexpr_4
  4651 00001BBC E820E8                   call prs
  4652 00001BBF 83C402                   add  sp, 2
  4653                                  
  4654                                  ;-606   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);
  4655                                  
  4656                                  .constantexpr248:
  4657 00001BC2 FF76FC                   push word [bp-4]
  4658 00001BC5 E854F4                   call v
  4659 00001BC8 83C402                   add  sp, 2
  4660 00001BCB 68[431C]                 push constantexpr_5
  4661 00001BCE E80EE8                   call prs
  4662 00001BD1 83C402                   add  sp, 2
  4663 00001BD4 FF36[2B00]               push word [lexval]
  4664 00001BD8 E867E9                   call prunsign1
  4665 00001BDB 83C402                   add  sp, 2
  4666 00001BDE FF76FA                   push word [bp-6]
  4667 00001BE1 E811F9                   call cmpneg
  4668 00001BE4 83C402                   add  sp, 2
  4669 00001BE7 8D06236E                 lea  ax, [fname]
  4670 00001BEB 50                       push ax
  4671 00001BEC E8F0E7                   call prs
  4672 00001BEF 83C402                   add  sp, 2
  4673                                  
  4674                                  ;-607   expect(')');
  4675                                  
  4676 00001BF2 6A29                     push 41
  4677 00001BF4 E8BDF3                   call expect
  4678 00001BF7 83C402                   add  sp, 2
  4679                                  
  4680                                  ;-608 }
  4681                                  
  4682                                  
  4683                                  ;-609 
  4684                                  
  4685                                  
  4686                                  ;-610 char ops[5];
  4687 00001BFA C9                       LEAVE
  4688 00001BFB C3                       ret
  4689 00001BFC 52656C6174696F6E61-     constantexpr_0 db "Relational expression expected",0
  4690 00001C05 6C2065787072657373-
  4691 00001C0E 696F6E206578706563-
  4692 00001C17 74656400           
  4693 00001C1B 203B20636F6E737461-     constantexpr_1 db " ; constant expression",0
  4694 00001C24 6E7420657870726573-
  4695 00001C2D 73696F6E00         
  4696 00001C32 5C6E636D702000          constantexpr_2 db "\ncmp ",0
  4697 00001C39 776F726400              constantexpr_3 db "word",0
  4698 00001C3E 6279746500              constantexpr_4 db "byte",0
  4699 00001C43 2C2000                  constantexpr_5 db ", ",0
  4700                                  ENDP
  4701                                  section .bss
  4702                                  absolute 42404
  4703 0000A5A4 <res 00000005>          ops resb 5
  4704                                  section .text
  4705                                  
  4706                                  ;-611 int doreg1(int iscmp1) { int i;
  4707                                  
  4708                                  
  4709                                  doreg1: PROC
  4710                                  
  4711                                  ;-612   if (istoken('='))          strcpy(ops, "mov");
  4712                                  ;
  4713 00001C46 C8020000                 ENTER  2,0
  4714 00001C4A 6A3D                     push 61
  4715 00001C4C E843F3                   call istoken
  4716 00001C4F 83C402                   add  sp, 2
  4717 00001C52 08C0                     or  al, al
  4718 00001C54 0F840E00                 je .doreg1249
  4719 00001C58 68[F91D]                 push doreg1_0
  4720 00001C5B 8D06A4A5                 lea  ax, [ops]
  4721 00001C5F 50                       push ax
  4722 00001C60 E8C6E5                   call strcpy
  4723 00001C63 83C404                   add  sp, 4
  4724                                  
  4725                                  ;-613   if (istoken(T_PLUSASS))    strcpy(ops, "add");
  4726                                  
  4727                                  .doreg1249:
  4728 00001C66 68CE04                   push 1230
  4729 00001C69 E826F3                   call istoken
  4730 00001C6C 83C402                   add  sp, 2
  4731 00001C6F 08C0                     or  al, al
  4732 00001C71 0F840E00                 je .doreg1250
  4733 00001C75 68[FD1D]                 push doreg1_1
  4734 00001C78 8D06A4A5                 lea  ax, [ops]
  4735 00001C7C 50                       push ax
  4736 00001C7D E8A9E5                   call strcpy
  4737 00001C80 83C404                   add  sp, 4
  4738                                  
  4739                                  ;-614   if (istoken(T_MINUSASS))   strcpy(ops, "sub");
  4740                                  
  4741                                  .doreg1250:
  4742 00001C83 68CF04                   push 1231
  4743 00001C86 E809F3                   call istoken
  4744 00001C89 83C402                   add  sp, 2
  4745 00001C8C 08C0                     or  al, al
  4746 00001C8E 0F840E00                 je .doreg1251
  4747 00001C92 68[011E]                 push doreg1_2
  4748 00001C95 8D06A4A5                 lea  ax, [ops]
  4749 00001C99 50                       push ax
  4750 00001C9A E88CE5                   call strcpy
  4751 00001C9D 83C404                   add  sp, 4
  4752                                  
  4753                                  ;-615   if (istoken(T_ANDASS))     strcpy(ops, "and");
  4754                                  
  4755                                  .doreg1251:
  4756 00001CA0 68D204                   push 1234
  4757 00001CA3 E8ECF2                   call istoken
  4758 00001CA6 83C402                   add  sp, 2
  4759 00001CA9 08C0                     or  al, al
  4760 00001CAB 0F840E00                 je .doreg1252
  4761 00001CAF 68[051E]                 push doreg1_3
  4762 00001CB2 8D06A4A5                 lea  ax, [ops]
  4763 00001CB6 50                       push ax
  4764 00001CB7 E86FE5                   call strcpy
  4765 00001CBA 83C404                   add  sp, 4
  4766                                  
  4767                                  ;-616   if (istoken(T_ORASS))      strcpy(ops, "or" );
  4768                                  
  4769                                  .doreg1252:
  4770 00001CBD 68D304                   push 1235
  4771 00001CC0 E8CFF2                   call istoken
  4772 00001CC3 83C402                   add  sp, 2
  4773 00001CC6 08C0                     or  al, al
  4774 00001CC8 0F840E00                 je .doreg1253
  4775 00001CCC 68[091E]                 push doreg1_4
  4776 00001CCF 8D06A4A5                 lea  ax, [ops]
  4777 00001CD3 50                       push ax
  4778 00001CD4 E852E5                   call strcpy
  4779 00001CD7 83C404                   add  sp, 4
  4780                                  
  4781                                  ;-617   if (istoken(T_LESSLESS))   strcpy(ops, "shl");
  4782                                  
  4783                                  .doreg1253:
  4784 00001CDA 68D804                   push 1240
  4785 00001CDD E8B2F2                   call istoken
  4786 00001CE0 83C402                   add  sp, 2
  4787 00001CE3 08C0                     or  al, al
  4788 00001CE5 0F840E00                 je .doreg1254
  4789 00001CE9 68[0C1E]                 push doreg1_5
  4790 00001CEC 8D06A4A5                 lea  ax, [ops]
  4791 00001CF0 50                       push ax
  4792 00001CF1 E835E5                   call strcpy
  4793 00001CF4 83C404                   add  sp, 4
  4794                                  
  4795                                  ;-618   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");
  4796                                  
  4797                                  .doreg1254:
  4798 00001CF7 68D904                   push 1241
  4799 00001CFA E895F2                   call istoken
  4800 00001CFD 83C402                   add  sp, 2
  4801 00001D00 08C0                     or  al, al
  4802 00001D02 0F840E00                 je .doreg1255
  4803 00001D06 68[101E]                 push doreg1_6
  4804 00001D09 8D06A4A5                 lea  ax, [ops]
  4805 00001D0D 50                       push ax
  4806 00001D0E E818E5                   call strcpy
  4807 00001D11 83C404                   add  sp, 4
  4808                                  
  4809                                  ;-619   if (iscmp1 == 1) { token=getlex();
  4810                                  
  4811                                  .doreg1255:
  4812 00001D14 8B4604                   mov ax, [bp+4]
  4813 00001D17 83F801                   cmp ax, 1
  4814 00001D1A 0F852700                 jne .doreg1256
  4815 00001D1E E8F2EC                   call getlex
  4816 00001D21 A3[1E00]                 mov word [token], ax
  4817                                  
  4818                                  ;-620       if (isrelational() ==0) error1("Relational expected");
  4819                                  
  4820 00001D24 E83EF9                   call isrelational
  4821 00001D27 83F800                   cmp ax, 0
  4822 00001D2A 0F850900                 jne .doreg1257
  4823 00001D2E 68[141E]                 push doreg1_7
  4824 00001D31 E8CCE8                   call error1
  4825 00001D34 83C402                   add  sp, 2
  4826                                  
  4827                                  ;-621       strcpy(ops, "cmp"); }
  4828                                  
  4829                                  .doreg1257:
  4830 00001D37 68[281E]                 push doreg1_8
  4831 00001D3A 8D06A4A5                 lea  ax, [ops]
  4832 00001D3E 50                       push ax
  4833 00001D3F E8E7E4                   call strcpy
  4834 00001D42 83C404                   add  sp, 4
  4835                                  
  4836                                  ;-622   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");
  4837                                  
  4838                                  .doreg1256:
  4839 00001D45 E82BE7                   call prnl
  4840 00001D48 8D06A4A5                 lea  ax, [ops]
  4841 00001D4C 50                       push ax
  4842 00001D4D E88FE6                   call prs
  4843 00001D50 83C402                   add  sp, 2
  4844 00001D53 68[2C1E]                 push doreg1_9
  4845 00001D56 E886E6                   call prs
  4846 00001D59 83C402                   add  sp, 2
  4847 00001D5C FF36[4B00]               push word [ireg1]
  4848 00001D60 E877FD                   call printreg
  4849 00001D63 83C402                   add  sp, 2
  4850 00001D66 68[2F1E]                 push doreg1_10
  4851 00001D69 E873E6                   call prs
  4852 00001D6C 83C402                   add  sp, 2
  4853                                  
  4854                                  ;-623 
  4855                                  
  4856                                  
  4857                                  ;-624   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}
  4858                                  
  4859 00001D6F 680101                   push 257
  4860 00001D72 E81DF2                   call istoken
  4861 00001D75 83C402                   add  sp, 2
  4862 00001D78 08C0                     or  al, al
  4863 00001D7A 0F840D00                 je .doreg1258
  4864 00001D7E FF36[2B00]               push word [lexval]
  4865 00001D82 E8BDE7                   call prunsign1
  4866 00001D85 83C402                   add  sp, 2
  4867 00001D88 E94700                   jmp .reg1
  4868                                  
  4869                                  ;-625   mod2=typeName(); ireg2=checkreg();
  4870                                  
  4871                                  .doreg1258:
  4872 00001D8B E80EF4                   call typeName
  4873 00001D8E A3[4D00]                 mov word [mod2], ax
  4874 00001D91 E838F9                   call checkreg
  4875 00001D94 A3[4F00]                 mov word [ireg2], ax
  4876                                  
  4877                                  ;-626   if (ireg2) {printreg(ireg2); goto reg1;}
  4878                                  
  4879 00001D97 A1[4F00]                 mov ax, [ireg2]
  4880 00001D9A 08C0                     or  al, al
  4881 00001D9C 0F840D00                 je .doreg1259
  4882 00001DA0 FF36[4F00]               push word [ireg2]
  4883 00001DA4 E833FD                   call printreg
  4884 00001DA7 83C402                   add  sp, 2
  4885 00001DAA E92500                   jmp .reg1
  4886                                  
  4887                                  ;-627   i=searchname();  if (mod2 == 2) printName(i); else v(i);
  4888                                  
  4889                                  .doreg1259:
  4890 00001DAD E879F3                   call searchname
  4891 00001DB0 8946FE                   mov [bp-2], ax
  4892 00001DB3 A1[4D00]                 mov ax, [mod2]
  4893 00001DB6 83F802                   cmp ax, 2
  4894 00001DB9 0F850C00                 jne .doreg1260
  4895 00001DBD FF76FE                   push word [bp-2]
  4896 00001DC0 E848EB                   call printName
  4897 00001DC3 83C402                   add  sp, 2
  4898 00001DC6 E90900                   jmp .doreg1261
  4899                                  .doreg1260:
  4900 00001DC9 FF76FE                   push word [bp-2]
  4901 00001DCC E84DF2                   call v
  4902 00001DCF 83C402                   add  sp, 2
  4903                                  
  4904                                  ;-628   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }
  4905                                  
  4906                                  .doreg1261:
  4907                                  .reg1:
  4908 00001DD2 8B4604                   mov ax, [bp+4]
  4909 00001DD5 83F801                   cmp ax, 1
  4910 00001DD8 0F851B00                 jne .doreg1262
  4911 00001DDC 6A00                     push 0
  4912 00001DDE E814F7                   call cmpneg
  4913 00001DE1 83C402                   add  sp, 2
  4914 00001DE4 8D06236E                 lea  ax, [fname]
  4915 00001DE8 50                       push ax
  4916 00001DE9 E8F3E5                   call prs
  4917 00001DEC 83C402                   add  sp, 2
  4918 00001DEF 6A29                     push 41
  4919 00001DF1 E8C0F1                   call expect
  4920 00001DF4 83C402                   add  sp, 2
  4921                                  
  4922                                  ;-629 }
  4923                                  
  4924                                  .doreg1262:
  4925                                  
  4926                                  ;-630 
  4927                                  
  4928                                  
  4929                                  ;-631 int compoundass(char *op, int mode, int id1) {
  4930 00001DF7 C9                       LEAVE
  4931 00001DF8 C3                       ret
  4932 00001DF9 6D6F7600                doreg1_0 db "mov",0
  4933 00001DFD 61646400                doreg1_1 db "add",0
  4934 00001E01 73756200                doreg1_2 db "sub",0
  4935 00001E05 616E6400                doreg1_3 db "and",0
  4936 00001E09 6F7200                  doreg1_4 db "or",0
  4937 00001E0C 73686C00                doreg1_5 db "shl",0
  4938 00001E10 73687200                doreg1_6 db "shr",0
  4939 00001E14 52656C6174696F6E61-     doreg1_7 db "Relational expected",0
  4940 00001E1D 6C2065787065637465-
  4941 00001E26 6400               
  4942 00001E28 636D7000                doreg1_8 db "cmp",0
  4943 00001E2C 202000                  doreg1_9 db "  ",0
  4944 00001E2F 2C2000                  doreg1_10 db ", ",0
  4945                                  ENDP
  4946                                  
  4947                                  compoundass: PROC
  4948                                  
  4949                                  ;-632   if(mode) error1("only scalar Var allowed");
  4950                                  ;
  4951 00001E32 C8000000                 ENTER  0,0
  4952 00001E36 8B4606                   mov ax, [bp+6]
  4953 00001E39 08C0                     or  al, al
  4954 00001E3B 0F840900                 je .compoundass263
  4955 00001E3F 68[AC1E]                 push compoundass_0
  4956 00001E42 E8BBE7                   call error1
  4957 00001E45 83C402                   add  sp, 2
  4958                                  
  4959                                  ;-633   prnl(); prs(op); prs("  ");
  4960                                  
  4961                                  .compoundass263:
  4962 00001E48 E828E6                   call prnl
  4963 00001E4B FF7604                   push word [bp+4]
  4964 00001E4E E88EE5                   call prs
  4965 00001E51 83C402                   add  sp, 2
  4966 00001E54 68[C41E]                 push compoundass_1
  4967 00001E57 E885E5                   call prs
  4968 00001E5A 83C402                   add  sp, 2
  4969                                  
  4970                                  ;-634   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  4971                                  
  4972 00001E5D FF7608                   push word [bp+8]
  4973 00001E60 E812F4                   call gettypes
  4974 00001E63 83C402                   add  sp, 2
  4975 00001E66 A1[3600]                 mov ax, [wi]
  4976 00001E69 83F802                   cmp ax, 2
  4977 00001E6C 0F850C00                 jne .compoundass264
  4978 00001E70 68[C71E]                 push compoundass_2
  4979 00001E73 E869E5                   call prs
  4980 00001E76 83C402                   add  sp, 2
  4981 00001E79 E90900                   jmp .compoundass265
  4982                                  .compoundass264:
  4983 00001E7C 68[CC1E]                 push compoundass_3
  4984 00001E7F E85DE5                   call prs
  4985 00001E82 83C402                   add  sp, 2
  4986                                  
  4987                                  ;-635   v(id1); prs(", ");
  4988                                  
  4989                                  .compoundass265:
  4990 00001E85 FF7608                   push word [bp+8]
  4991 00001E88 E891F1                   call v
  4992 00001E8B 83C402                   add  sp, 2
  4993 00001E8E 68[D11E]                 push compoundass_4
  4994 00001E91 E84BE5                   call prs
  4995 00001E94 83C402                   add  sp, 2
  4996                                  
  4997                                  ;-636   expect(T_CONST); prunsign1(lexval);
  4998                                  
  4999 00001E97 680101                   push 257
  5000 00001E9A E817F1                   call expect
  5001 00001E9D 83C402                   add  sp, 2
  5002 00001EA0 FF36[2B00]               push word [lexval]
  5003 00001EA4 E89BE6                   call prunsign1
  5004 00001EA7 83C402                   add  sp, 2
  5005                                  
  5006                                  ;-637 }
  5007                                  
  5008                                  
  5009                                  ;-638 int dovar1(int mode, int op, int ixarr, int id1) {
  5010 00001EAA C9                       LEAVE
  5011 00001EAB C3                       ret
  5012 00001EAC 6F6E6C79207363616C-     compoundass_0 db "only scalar Var allowed",0
  5013 00001EB5 61722056617220616C-
  5014 00001EBE 6C6F77656400       
  5015 00001EC4 202000                  compoundass_1 db "  ",0
  5016 00001EC7 776F726400              compoundass_2 db "word",0
  5017 00001ECC 6279746500              compoundass_3 db "byte",0
  5018 00001ED1 2C2000                  compoundass_4 db ", ",0
  5019                                  ENDP
  5020                                  
  5021                                  dovar1: PROC
  5022                                  
  5023                                  ;-639   gettypes(id1);
  5024                                  ;
  5025 00001ED4 C8000000                 ENTER  0,0
  5026 00001ED8 FF760A                   push word [bp+10]
  5027 00001EDB E897F3                   call gettypes
  5028 00001EDE 83C402                   add  sp, 2
  5029                                  
  5030                                  ;-640   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);
  5031                                  
  5032 00001EE1 8B4604                   mov ax, [bp+4]
  5033 00001EE4 83F801                   cmp ax, 1
  5034 00001EE7 0F854700                 jne .dovar1266
  5035 00001EEB 68[2920]                 push dovar1_0
  5036 00001EEE E8EEE4                   call prs
  5037 00001EF1 83C402                   add  sp, 2
  5038 00001EF4 FF760A                   push word [bp+10]
  5039 00001EF7 E822F1                   call v
  5040 00001EFA 83C402                   add  sp, 2
  5041 00001EFD E873E5                   call prnl
  5042 00001F00 FF7606                   push word [bp+6]
  5043 00001F03 E8D9E4                   call prs
  5044 00001F06 83C402                   add  sp, 2
  5045                                  
  5046                                  ;-641     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");
  5047                                  
  5048 00001F09 A1[3300]                 mov ax, [widthi]
  5049 00001F0C 83F801                   cmp ax, 1
  5050 00001F0F 0F850900                 jne .dovar1267
  5051 00001F13 68[3520]                 push dovar1_1
  5052 00001F16 E8C6E4                   call prs
  5053 00001F19 83C402                   add  sp, 2
  5054                                  
  5055                                  ;-642     if(widthi == 2) prs(" ax, [bx]");
  5056                                  
  5057                                  .dovar1267:
  5058 00001F1C A1[3300]                 mov ax, [widthi]
  5059 00001F1F 83F802                   cmp ax, 2
  5060 00001F22 0F850900                 jne .dovar1268
  5061 00001F26 68[4B20]                 push dovar1_2
  5062 00001F29 E8B3E4                   call prs
  5063 00001F2C 83C402                   add  sp, 2
  5064                                  
  5065                                  ;-643     return; }
  5066                                  
  5067                                  .dovar1268:
  5068 00001F2F E9F500                   jmp .retndovar1
  5069                                  
  5070                                  ;-644   if (mode==2){prnl();prs(op);prs(" ax, "); printName(id1); return; }
  5071                                  
  5072                                  .dovar1266:
  5073 00001F32 8B4604                   mov ax, [bp+4]
  5074 00001F35 83F802                   cmp ax, 2
  5075 00001F38 0F852100                 jne .dovar1269
  5076 00001F3C E834E5                   call prnl
  5077 00001F3F FF7606                   push word [bp+6]
  5078 00001F42 E89AE4                   call prs
  5079 00001F45 83C402                   add  sp, 2
  5080 00001F48 68[5520]                 push dovar1_3
  5081 00001F4B E891E4                   call prs
  5082 00001F4E 83C402                   add  sp, 2
  5083 00001F51 FF760A                   push word [bp+10]
  5084 00001F54 E8B4E9                   call printName
  5085 00001F57 83C402                   add  sp, 2
  5086 00001F5A E9CA00                   jmp .retndovar1
  5087                                  
  5088                                  ;-645   if (ixarr) {
  5089                                  
  5090                                  .dovar1269:
  5091 00001F5D 8B4608                   mov ax, [bp+8]
  5092 00001F60 08C0                     or  al, al
  5093 00001F62 0F847300                 je .dovar1270
  5094                                  
  5095                                  ;-646     prs("\n mov bx, "); v(ixarr);
  5096                                  
  5097 00001F66 68[5B20]                 push dovar1_4
  5098 00001F69 E873E4                   call prs
  5099 00001F6C 83C402                   add  sp, 2
  5100 00001F6F FF7608                   push word [bp+8]
  5101 00001F72 E8A7F0                   call v
  5102 00001F75 83C402                   add  sp, 2
  5103                                  
  5104                                  ;-647     if (wi==2) prs("\n shl bx, 1");
  5105                                  
  5106 00001F78 A1[3600]                 mov ax, [wi]
  5107 00001F7B 83F802                   cmp ax, 2
  5108 00001F7E 0F850900                 jne .dovar1271
  5109 00001F82 68[6720]                 push dovar1_5
  5110 00001F85 E857E4                   call prs
  5111 00001F88 83C402                   add  sp, 2
  5112                                  
  5113                                  ;-648     prs("\n "); prs(op);
  5114                                  
  5115                                  .dovar1271:
  5116 00001F8B 68[7420]                 push dovar1_6
  5117 00001F8E E84EE4                   call prs
  5118 00001F91 83C402                   add  sp, 2
  5119 00001F94 FF7606                   push word [bp+6]
  5120 00001F97 E845E4                   call prs
  5121 00001F9A 83C402                   add  sp, 2
  5122                                  
  5123                                  ;-649     if (wi==2) prs(" ax, "); else prs(" al, ");
  5124                                  
  5125 00001F9D A1[3600]                 mov ax, [wi]
  5126 00001FA0 83F802                   cmp ax, 2
  5127 00001FA3 0F850C00                 jne .dovar1272
  5128 00001FA7 68[7820]                 push dovar1_7
  5129 00001FAA E832E4                   call prs
  5130 00001FAD 83C402                   add  sp, 2
  5131 00001FB0 E90900                   jmp .dovar1273
  5132                                  .dovar1272:
  5133 00001FB3 68[7E20]                 push dovar1_8
  5134 00001FB6 E826E4                   call prs
  5135 00001FB9 83C402                   add  sp, 2
  5136                                  
  5137                                  ;-650 // v(id1); prs(" [bx]");
  5138                                  
  5139                                  
  5140                                  ;-651     prc('['); printName(id1); prs(" + bx]");
  5141                                  
  5142                                  .dovar1273:
  5143 00001FBC 6A5B                     push 91
  5144 00001FBE E8C5E3                   call prc
  5145 00001FC1 83C402                   add  sp, 2
  5146 00001FC4 FF760A                   push word [bp+10]
  5147 00001FC7 E841E9                   call printName
  5148 00001FCA 83C402                   add  sp, 2
  5149 00001FCD 68[8420]                 push dovar1_9
  5150 00001FD0 E80CE4                   call prs
  5151 00001FD3 83C402                   add  sp, 2
  5152                                  
  5153                                  ;-652     return; }
  5154                                  
  5155 00001FD6 E94E00                   jmp .retndovar1
  5156                                  
  5157                                  ;-653   prnl();prs(op);
  5158                                  
  5159                                  .dovar1270:
  5160 00001FD9 E897E4                   call prnl
  5161 00001FDC FF7606                   push word [bp+6]
  5162 00001FDF E8FDE3                   call prs
  5163 00001FE2 83C402                   add  sp, 2
  5164                                  
  5165                                  ;-654   if(wi==1) prs(" al, ");
  5166                                  
  5167 00001FE5 A1[3600]                 mov ax, [wi]
  5168 00001FE8 83F801                   cmp ax, 1
  5169 00001FEB 0F850900                 jne .dovar1274
  5170 00001FEF 68[8B20]                 push dovar1_10
  5171 00001FF2 E8EAE3                   call prs
  5172 00001FF5 83C402                   add  sp, 2
  5173                                  
  5174                                  ;-655   if(wi==2) prs(" ax, ");
  5175                                  
  5176                                  .dovar1274:
  5177 00001FF8 A1[3600]                 mov ax, [wi]
  5178 00001FFB 83F802                   cmp ax, 2
  5179 00001FFE 0F850900                 jne .dovar1275
  5180 00002002 68[9120]                 push dovar1_11
  5181 00002005 E8D7E3                   call prs
  5182 00002008 83C402                   add  sp, 2
  5183                                  
  5184                                  ;-656   if(wi==4) prs(" eax, ");
  5185                                  
  5186                                  .dovar1275:
  5187 0000200B A1[3600]                 mov ax, [wi]
  5188 0000200E 83F804                   cmp ax, 4
  5189 00002011 0F850900                 jne .dovar1276
  5190 00002015 68[9720]                 push dovar1_12
  5191 00002018 E8C4E3                   call prs
  5192 0000201B 83C402                   add  sp, 2
  5193                                  
  5194                                  ;-657   v(id1);
  5195                                  
  5196                                  .dovar1276:
  5197 0000201E FF760A                   push word [bp+10]
  5198 00002021 E8F8EF                   call v
  5199 00002024 83C402                   add  sp, 2
  5200                                  
  5201                                  ;-658 }
  5202                                  
  5203                                  
  5204                                  ;-659 int rterm(char *op) {int mode; int opint; int ixarr; int id1;
  5205                                  
  5206 00002027 C9                       .retndovar1: LEAVE
  5207 00002028 C3                       ret
  5208 00002029 5C6E206D6F76206278-     dovar1_0 db "\n mov bx, ",0
  5209 00002032 2C2000             
  5210 00002035 20616C2C205B62785D-     dovar1_1 db " al, [bx]\n mov ah, 0",0
  5211 0000203E 5C6E206D6F76206168-
  5212 00002047 2C203000           
  5213 0000204B 2061782C205B62785D-     dovar1_2 db " ax, [bx]",0
  5214 00002054 00                 
  5215 00002055 2061782C2000            dovar1_3 db " ax, ",0
  5216 0000205B 5C6E206D6F76206278-     dovar1_4 db "\n mov bx, ",0
  5217 00002064 2C2000             
  5218 00002067 5C6E2073686C206278-     dovar1_5 db "\n shl bx, 1",0
  5219 00002070 2C203100           
  5220 00002074 5C6E2000                dovar1_6 db "\n ",0
  5221 00002078 2061782C2000            dovar1_7 db " ax, ",0
  5222 0000207E 20616C2C2000            dovar1_8 db " al, ",0
  5223 00002084 202B2062785D00          dovar1_9 db " + bx]",0
  5224 0000208B 20616C2C2000            dovar1_10 db " al, ",0
  5225 00002091 2061782C2000            dovar1_11 db " ax, ",0
  5226 00002097 206561782C2000          dovar1_12 db " eax, ",0
  5227                                  ENDP
  5228                                  
  5229                                  rterm: PROC
  5230                                  
  5231                                  ;-660   if (istoken(T_CONST)) { prnl(); prs(op);
  5232                                  ;
  5233 0000209E C8080000                 ENTER  8,0
  5234 000020A2 680101                   push 257
  5235 000020A5 E8EAEE                   call istoken
  5236 000020A8 83C402                   add  sp, 2
  5237 000020AB 08C0                     or  al, al
  5238 000020AD 0F845200                 je .rterm277
  5239 000020B1 E8BFE3                   call prnl
  5240 000020B4 FF7604                   push word [bp+4]
  5241 000020B7 E825E3                   call prs
  5242 000020BA 83C402                   add  sp, 2
  5243                                  
  5244                                  ;-661     if (wi==1) prs(" al, ");
  5245                                  
  5246 000020BD A1[3600]                 mov ax, [wi]
  5247 000020C0 83F801                   cmp ax, 1
  5248 000020C3 0F850900                 jne .rterm278
  5249 000020C7 68[8721]                 push rterm_0
  5250 000020CA E812E3                   call prs
  5251 000020CD 83C402                   add  sp, 2
  5252                                  
  5253                                  ;-662     if (wi==2) prs(" ax, ");
  5254                                  
  5255                                  .rterm278:
  5256 000020D0 A1[3600]                 mov ax, [wi]
  5257 000020D3 83F802                   cmp ax, 2
  5258 000020D6 0F850900                 jne .rterm279
  5259 000020DA 68[8D21]                 push rterm_1
  5260 000020DD E8FFE2                   call prs
  5261 000020E0 83C402                   add  sp, 2
  5262                                  
  5263                                  ;-663     if (wi==4) prs(" eax, ");
  5264                                  
  5265                                  .rterm279:
  5266 000020E3 A1[3600]                 mov ax, [wi]
  5267 000020E6 83F804                   cmp ax, 4
  5268 000020E9 0F850900                 jne .rterm280
  5269 000020ED 68[9321]                 push rterm_2
  5270 000020F0 E8ECE2                   call prs
  5271 000020F3 83C402                   add  sp, 2
  5272                                  
  5273                                  ;-664     prunsign1(lexval); return;}
  5274                                  
  5275                                  .rterm280:
  5276 000020F6 FF36[2B00]               push word [lexval]
  5277 000020FA E845E4                   call prunsign1
  5278 000020FD 83C402                   add  sp, 2
  5279 00002100 E98200                   jmp .retnrterm
  5280                                  
  5281                                  ;-665   mode=typeName(); id1=searchname(); ixarr=0;
  5282                                  
  5283                                  .rterm277:
  5284 00002103 E896F0                   call typeName
  5285 00002106 8946FE                   mov [bp-2], ax
  5286 00002109 E81DF0                   call searchname
  5287 0000210C 8946F8                   mov [bp-8], ax
  5288 0000210F B80000                   mov ax, 0
  5289 00002112 8946FA                   mov [bp-6], ax
  5290                                  
  5291                                  ;-666   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');
  5292                                  
  5293 00002115 6A5B                     push 91
  5294 00002117 E878EE                   call istoken
  5295 0000211A 83C402                   add  sp, 2
  5296 0000211D 08C0                     or  al, al
  5297 0000211F 0F843300                 je .rterm281
  5298 00002123 E803F0                   call searchname
  5299 00002126 8946FA                   mov [bp-6], ax
  5300 00002129 680001                   push 256
  5301 0000212C E885EE                   call expect
  5302 0000212F 83C402                   add  sp, 2
  5303 00002132 6A5D                     push 93
  5304 00002134 E87DEE                   call expect
  5305 00002137 83C402                   add  sp, 2
  5306                                  
  5307                                  ;-667     gettypes(ixarr);
  5308                                  
  5309 0000213A FF76FA                   push word [bp-6]
  5310 0000213D E835F1                   call gettypes
  5311 00002140 83C402                   add  sp, 2
  5312                                  
  5313                                  ;-668     if (widthi != 2) error1("Arrayindex muss int sein"); }
  5314                                  
  5315 00002143 A1[3300]                 mov ax, [widthi]
  5316 00002146 83F802                   cmp ax, 2
  5317 00002149 0F840900                 je  .rterm282
  5318 0000214D 68[9A21]                 push rterm_3
  5319 00002150 E8ADE4                   call error1
  5320 00002153 83C402                   add  sp, 2
  5321                                  .rterm282:
  5322                                  
  5323                                  ;-669   if (eqstr(symbol,"_AX")) return;
  5324                                  
  5325                                  .rterm281:
  5326 00002156 68[B321]                 push rterm_4
  5327 00002159 8D06A36D                 lea  ax, [symbol]
  5328 0000215D 50                       push ax
  5329 0000215E E8FEE0                   call eqstr
  5330 00002161 83C404                   add  sp, 4
  5331 00002164 08C0                     or  al, al
  5332 00002166 0F840300                 je .rterm283
  5333 0000216A E91800                   jmp .retnrterm
  5334                                  
  5335                                  ;-670   opint=op; dovar1(mode, opint, ixarr, id1);
  5336                                  
  5337                                  .rterm283:
  5338 0000216D 8B4604                   mov ax, [bp+4]
  5339 00002170 8946FC                   mov [bp-4], ax
  5340 00002173 FF76F8                   push word [bp-8]
  5341 00002176 FF76FA                   push word [bp-6]
  5342 00002179 FF76FC                   push word [bp-4]
  5343 0000217C FF76FE                   push word [bp-2]
  5344 0000217F E852FD                   call dovar1
  5345 00002182 83C408                   add  sp, 8
  5346                                  
  5347                                  ;-671 }
  5348                                  
  5349                                  
  5350                                  ;-672 
  5351                                  
  5352                                  
  5353                                  ;-673 int doreg(char *dr) { int i; expect('=');
  5354                                  
  5355 00002185 C9                       .retnrterm: LEAVE
  5356 00002186 C3                       ret
  5357 00002187 20616C2C2000            rterm_0 db " al, ",0
  5358 0000218D 2061782C2000            rterm_1 db " ax, ",0
  5359 00002193 206561782C2000          rterm_2 db " eax, ",0
  5360 0000219A 4172726179696E6465-     rterm_3 db "Arrayindex muss int sein",0
  5361 000021A3 78206D75737320696E-
  5362 000021AC 74207365696E00     
  5363 000021B3 5F415800                rterm_4 db "_AX",0
  5364                                  ENDP
  5365                                  
  5366                                  doreg: PROC;
  5367 000021B7 C8020000                 ENTER  2,0
  5368 000021BB 6A3D                     push 61
  5369 000021BD E8F4ED                   call expect
  5370 000021C0 83C402                   add  sp, 2
  5371                                  
  5372                                  ;-674   prs("\n mov  "); prs(dr); prs(", ");
  5373                                  
  5374 000021C3 68[2622]                 push doreg_0
  5375 000021C6 E816E2                   call prs
  5376 000021C9 83C402                   add  sp, 2
  5377 000021CC FF7604                   push word [bp+4]
  5378 000021CF E80DE2                   call prs
  5379 000021D2 83C402                   add  sp, 2
  5380 000021D5 68[2F22]                 push doreg_1
  5381 000021D8 E804E2                   call prs
  5382 000021DB 83C402                   add  sp, 2
  5383                                  
  5384                                  ;-675        if (istoken(T_CONST)) prunsign1(lexval);
  5385                                  
  5386 000021DE 680101                   push 257
  5387 000021E1 E8AEED                   call istoken
  5388 000021E4 83C402                   add  sp, 2
  5389 000021E7 08C0                     or  al, al
  5390 000021E9 0F840D00                 je .doreg284
  5391 000021ED FF36[2B00]               push word [lexval]
  5392 000021F1 E84EE3                   call prunsign1
  5393 000021F4 83C402                   add  sp, 2
  5394                                  
  5395                                  ;-676   else if (istoken(T_NAME )) { i=searchname(); v(i); }
  5396                                  
  5397 000021F7 E92A00                   jmp .doreg285
  5398                                  .doreg284:
  5399 000021FA 680001                   push 256
  5400 000021FD E892ED                   call istoken
  5401 00002200 83C402                   add  sp, 2
  5402 00002203 08C0                     or  al, al
  5403 00002205 0F841200                 je .doreg286
  5404 00002209 E81DEF                   call searchname
  5405 0000220C 8946FE                   mov [bp-2], ax
  5406 0000220F FF76FE                   push word [bp-2]
  5407 00002212 E807EE                   call v
  5408 00002215 83C402                   add  sp, 2
  5409                                  
  5410                                  ;-677   else error1("only number or var allowed");
  5411                                  
  5412 00002218 E90900                   jmp .doreg287
  5413                                  .doreg286:
  5414 0000221B 68[3222]                 push doreg_2
  5415 0000221E E8DFE3                   call error1
  5416 00002221 83C402                   add  sp, 2
  5417                                  
  5418                                  ;-678 }
  5419                                  
  5420                                  .doreg287:
  5421                                  .doreg285:
  5422                                  
  5423                                  ;-679 int isreg() {
  5424 00002224 C9                       LEAVE
  5425 00002225 C3                       ret
  5426 00002226 5C6E206D6F76202000      doreg_0 db "\n mov  ",0
  5427 0000222F 2C2000                  doreg_1 db ", ",0
  5428 00002232 6F6E6C79206E756D62-     doreg_2 db "only number or var allowed",0
  5429 0000223B 6572206F7220766172-
  5430 00002244 20616C6C6F77656400 
  5431                                  ENDP
  5432                                  
  5433                                  isreg: PROC
  5434                                  
  5435                                  ;-680   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}
  5436                                  
  5437 0000224D 68[3A24]                 push isreg_0
  5438 00002250 8D06A36D                 lea  ax, [symbol]
  5439 00002254 50                       push ax
  5440 00002255 E807E0                   call eqstr
  5441 00002258 83C404                   add  sp, 4
  5442 0000225B 08C0                     or  al, al
  5443 0000225D 0F840C00                 je .isreg288
  5444 00002261 68[3E24]                 push isreg_1
  5445 00002264 E850FF                   call doreg
  5446 00002267 83C402                   add  sp, 2
  5447 0000226A E9C601                   jmp .r1
  5448                                  
  5449                                  ;-681   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}
  5450                                  
  5451                                  .isreg288:
  5452 0000226D 68[4124]                 push isreg_2
  5453 00002270 8D06A36D                 lea  ax, [symbol]
  5454 00002274 50                       push ax
  5455 00002275 E8E7DF                   call eqstr
  5456 00002278 83C404                   add  sp, 4
  5457 0000227B 08C0                     or  al, al
  5458 0000227D 0F840C00                 je .isreg289
  5459 00002281 68[4524]                 push isreg_3
  5460 00002284 E830FF                   call doreg
  5461 00002287 83C402                   add  sp, 2
  5462 0000228A E9A601                   jmp .r1
  5463                                  
  5464                                  ;-682   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}
  5465                                  
  5466                                  .isreg289:
  5467 0000228D 68[4824]                 push isreg_4
  5468 00002290 8D06A36D                 lea  ax, [symbol]
  5469 00002294 50                       push ax
  5470 00002295 E8C7DF                   call eqstr
  5471 00002298 83C404                   add  sp, 4
  5472 0000229B 08C0                     or  al, al
  5473 0000229D 0F840C00                 je .isreg290
  5474 000022A1 68[4C24]                 push isreg_5
  5475 000022A4 E810FF                   call doreg
  5476 000022A7 83C402                   add  sp, 2
  5477 000022AA E98601                   jmp .r1
  5478                                  
  5479                                  ;-683   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}
  5480                                  
  5481                                  .isreg290:
  5482 000022AD 68[4F24]                 push isreg_6
  5483 000022B0 8D06A36D                 lea  ax, [symbol]
  5484 000022B4 50                       push ax
  5485 000022B5 E8A7DF                   call eqstr
  5486 000022B8 83C404                   add  sp, 4
  5487 000022BB 08C0                     or  al, al
  5488 000022BD 0F840C00                 je .isreg291
  5489 000022C1 68[5324]                 push isreg_7
  5490 000022C4 E8F0FE                   call doreg
  5491 000022C7 83C402                   add  sp, 2
  5492 000022CA E96601                   jmp .r1
  5493                                  
  5494                                  ;-684   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}
  5495                                  
  5496                                  .isreg291:
  5497 000022CD 68[5624]                 push isreg_8
  5498 000022D0 8D06A36D                 lea  ax, [symbol]
  5499 000022D4 50                       push ax
  5500 000022D5 E887DF                   call eqstr
  5501 000022D8 83C404                   add  sp, 4
  5502 000022DB 08C0                     or  al, al
  5503 000022DD 0F840C00                 je .isreg292
  5504 000022E1 68[5A24]                 push isreg_9
  5505 000022E4 E8D0FE                   call doreg
  5506 000022E7 83C402                   add  sp, 2
  5507 000022EA E94601                   jmp .r1
  5508                                  
  5509                                  ;-685   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}
  5510                                  
  5511                                  .isreg292:
  5512 000022ED 68[5D24]                 push isreg_10
  5513 000022F0 8D06A36D                 lea  ax, [symbol]
  5514 000022F4 50                       push ax
  5515 000022F5 E867DF                   call eqstr
  5516 000022F8 83C404                   add  sp, 4
  5517 000022FB 08C0                     or  al, al
  5518 000022FD 0F840C00                 je .isreg293
  5519 00002301 68[6124]                 push isreg_11
  5520 00002304 E8B0FE                   call doreg
  5521 00002307 83C402                   add  sp, 2
  5522 0000230A E92601                   jmp .r1
  5523                                  
  5524                                  ;-686   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}
  5525                                  
  5526                                  .isreg293:
  5527 0000230D 68[6424]                 push isreg_12
  5528 00002310 8D06A36D                 lea  ax, [symbol]
  5529 00002314 50                       push ax
  5530 00002315 E847DF                   call eqstr
  5531 00002318 83C404                   add  sp, 4
  5532 0000231B 08C0                     or  al, al
  5533 0000231D 0F840C00                 je .isreg294
  5534 00002321 68[6824]                 push isreg_13
  5535 00002324 E890FE                   call doreg
  5536 00002327 83C402                   add  sp, 2
  5537 0000232A E90601                   jmp .r1
  5538                                  
  5539                                  ;-687   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}
  5540                                  
  5541                                  .isreg294:
  5542 0000232D 68[6B24]                 push isreg_14
  5543 00002330 8D06A36D                 lea  ax, [symbol]
  5544 00002334 50                       push ax
  5545 00002335 E827DF                   call eqstr
  5546 00002338 83C404                   add  sp, 4
  5547 0000233B 08C0                     or  al, al
  5548 0000233D 0F840C00                 je .isreg295
  5549 00002341 68[6F24]                 push isreg_15
  5550 00002344 E870FE                   call doreg
  5551 00002347 83C402                   add  sp, 2
  5552 0000234A E9E600                   jmp .r1
  5553                                  
  5554                                  ;-688   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}
  5555                                  
  5556                                  .isreg295:
  5557 0000234D 68[7224]                 push isreg_16
  5558 00002350 8D06A36D                 lea  ax, [symbol]
  5559 00002354 50                       push ax
  5560 00002355 E807DF                   call eqstr
  5561 00002358 83C404                   add  sp, 4
  5562 0000235B 08C0                     or  al, al
  5563 0000235D 0F840C00                 je .isreg296
  5564 00002361 68[7624]                 push isreg_17
  5565 00002364 E850FE                   call doreg
  5566 00002367 83C402                   add  sp, 2
  5567 0000236A E9C600                   jmp .r1
  5568                                  
  5569                                  ;-689   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}
  5570                                  
  5571                                  .isreg296:
  5572 0000236D 68[7924]                 push isreg_18
  5573 00002370 8D06A36D                 lea  ax, [symbol]
  5574 00002374 50                       push ax
  5575 00002375 E8E7DE                   call eqstr
  5576 00002378 83C404                   add  sp, 4
  5577 0000237B 08C0                     or  al, al
  5578 0000237D 0F840C00                 je .isreg297
  5579 00002381 68[7D24]                 push isreg_19
  5580 00002384 E830FE                   call doreg
  5581 00002387 83C402                   add  sp, 2
  5582 0000238A E9A600                   jmp .r1
  5583                                  
  5584                                  ;-690   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}
  5585                                  
  5586                                  .isreg297:
  5587 0000238D 68[8024]                 push isreg_20
  5588 00002390 8D06A36D                 lea  ax, [symbol]
  5589 00002394 50                       push ax
  5590 00002395 E8C7DE                   call eqstr
  5591 00002398 83C404                   add  sp, 4
  5592 0000239B 08C0                     or  al, al
  5593 0000239D 0F840C00                 je .isreg298
  5594 000023A1 68[8424]                 push isreg_21
  5595 000023A4 E810FE                   call doreg
  5596 000023A7 83C402                   add  sp, 2
  5597 000023AA E98600                   jmp .r1
  5598                                  
  5599                                  ;-691   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}
  5600                                  
  5601                                  .isreg298:
  5602 000023AD 68[8724]                 push isreg_22
  5603 000023B0 8D06A36D                 lea  ax, [symbol]
  5604 000023B4 50                       push ax
  5605 000023B5 E8A7DE                   call eqstr
  5606 000023B8 83C404                   add  sp, 4
  5607 000023BB 08C0                     or  al, al
  5608 000023BD 0F840C00                 je .isreg299
  5609 000023C1 68[8B24]                 push isreg_23
  5610 000023C4 E8F0FD                   call doreg
  5611 000023C7 83C402                   add  sp, 2
  5612 000023CA E96600                   jmp .r1
  5613                                  
  5614                                  ;-692   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}
  5615                                  
  5616                                  .isreg299:
  5617 000023CD 68[8E24]                 push isreg_24
  5618 000023D0 8D06A36D                 lea  ax, [symbol]
  5619 000023D4 50                       push ax
  5620 000023D5 E887DE                   call eqstr
  5621 000023D8 83C404                   add  sp, 4
  5622 000023DB 08C0                     or  al, al
  5623 000023DD 0F840C00                 je .isreg300
  5624 000023E1 68[9224]                 push isreg_25
  5625 000023E4 E8D0FD                   call doreg
  5626 000023E7 83C402                   add  sp, 2
  5627 000023EA E94600                   jmp .r1
  5628                                  
  5629                                  ;-693   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}
  5630                                  
  5631                                  .isreg300:
  5632 000023ED 68[9524]                 push isreg_26
  5633 000023F0 8D06A36D                 lea  ax, [symbol]
  5634 000023F4 50                       push ax
  5635 000023F5 E867DE                   call eqstr
  5636 000023F8 83C404                   add  sp, 4
  5637 000023FB 08C0                     or  al, al
  5638 000023FD 0F840C00                 je .isreg301
  5639 00002401 68[9924]                 push isreg_27
  5640 00002404 E8B0FD                   call doreg
  5641 00002407 83C402                   add  sp, 2
  5642 0000240A E92600                   jmp .r1
  5643                                  
  5644                                  ;-694   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}
  5645                                  
  5646                                  .isreg301:
  5647 0000240D 68[9C24]                 push isreg_28
  5648 00002410 8D06A36D                 lea  ax, [symbol]
  5649 00002414 50                       push ax
  5650 00002415 E847DE                   call eqstr
  5651 00002418 83C404                   add  sp, 4
  5652 0000241B 08C0                     or  al, al
  5653 0000241D 0F840C00                 je .isreg302
  5654 00002421 68[A324]                 push isreg_29
  5655 00002424 E890FD                   call doreg
  5656 00002427 83C402                   add  sp, 2
  5657 0000242A E90600                   jmp .r1
  5658                                  
  5659                                  ;-695   return 0;   r1: return 1;
  5660                                  
  5661                                  .isreg302:
  5662 0000242D B80000                   mov ax, 0
  5663 00002430 E90600                   jmp .retnisreg
  5664                                  .r1:
  5665 00002433 B80100                   mov ax, 1
  5666 00002436 E90000                   jmp .retnisreg
  5667                                  
  5668                                  ;-696 }
  5669                                  
  5670                                  
  5671                                  ;-697 
  5672                                  
  5673                                  
  5674                                  ;-698 int doassign(int mode, int i, int ixarr, int ixconst) {
  5675                                  
  5676                                   .retnisreg:
  5677 00002439 C3                       ret
  5678 0000243A 5F414800                isreg_0 db "_AH",0
  5679 0000243E 616800                  isreg_1 db "ah",0
  5680 00002441 5F414C00                isreg_2 db "_AL",0
  5681 00002445 616C00                  isreg_3 db "al",0
  5682 00002448 5F415800                isreg_4 db "_AX",0
  5683 0000244C 617800                  isreg_5 db "ax",0
  5684 0000244F 5F424800                isreg_6 db "_BH",0
  5685 00002453 626800                  isreg_7 db "bh",0
  5686 00002456 5F424C00                isreg_8 db "_BL",0
  5687 0000245A 626C00                  isreg_9 db "bl",0
  5688 0000245D 5F425800                isreg_10 db "_BX",0
  5689 00002461 627800                  isreg_11 db "bx",0
  5690 00002464 5F434800                isreg_12 db "_CH",0
  5691 00002468 636800                  isreg_13 db "ch",0
  5692 0000246B 5F434C00                isreg_14 db "_CL",0
  5693 0000246F 636C00                  isreg_15 db "cl",0
  5694 00002472 5F435800                isreg_16 db "_CX",0
  5695 00002476 637800                  isreg_17 db "cx",0
  5696 00002479 5F444800                isreg_18 db "_DH",0
  5697 0000247D 646800                  isreg_19 db "dh",0
  5698 00002480 5F444C00                isreg_20 db "_DL",0
  5699 00002484 646C00                  isreg_21 db "dl",0
  5700 00002487 5F445800                isreg_22 db "_DX",0
  5701 0000248B 647800                  isreg_23 db "dx",0
  5702 0000248E 5F534900                isreg_24 db "_SI",0
  5703 00002492 736900                  isreg_25 db "si",0
  5704 00002495 5F444900                isreg_26 db "_DI",0
  5705 00002499 646900                  isreg_27 db "di",0
  5706 0000249C 5F464C41475300          isreg_28 db "_FLAGS",0
  5707 000024A3 666C61677300            isreg_29 db "flags",0
  5708                                  ENDP
  5709                                  
  5710                                  doassign: PROC
  5711                                  
  5712                                  ;-699   gettypes(i);
  5713                                  ;
  5714 000024A9 C8000000                 ENTER  0,0
  5715 000024AD FF7606                   push word [bp+6]
  5716 000024B0 E8C2ED                   call gettypes
  5717 000024B3 83C402                   add  sp, 2
  5718                                  
  5719                                  ;-700   if (mode==1) {prs("\n mov  bx, ");v(i);
  5720                                  
  5721 000024B6 8B4604                   mov ax, [bp+4]
  5722 000024B9 83F801                   cmp ax, 1
  5723 000024BC 0F853400                 jne .doassign303
  5724 000024C0 68[4626]                 push doassign_0
  5725 000024C3 E819DF                   call prs
  5726 000024C6 83C402                   add  sp, 2
  5727 000024C9 FF7606                   push word [bp+6]
  5728 000024CC E84DEB                   call v
  5729 000024CF 83C402                   add  sp, 2
  5730                                  
  5731                                  ;-701     if (widthi == 2) prs("\n mov  [bx], ax");
  5732                                  
  5733 000024D2 A1[3300]                 mov ax, [widthi]
  5734 000024D5 83F802                   cmp ax, 2
  5735 000024D8 0F850C00                 jne .doassign304
  5736 000024DC 68[5326]                 push doassign_1
  5737 000024DF E8FDDE                   call prs
  5738 000024E2 83C402                   add  sp, 2
  5739                                  
  5740                                  ;-702     else  prs("\n mov  [bx], al"); return;}
  5741                                  
  5742 000024E5 E90900                   jmp .doassign305
  5743                                  .doassign304:
  5744 000024E8 68[6426]                 push doassign_2
  5745 000024EB E8F1DE                   call prs
  5746 000024EE 83C402                   add  sp, 2
  5747                                  .doassign305:
  5748 000024F1 E95001                   jmp .retndoassign
  5749                                  
  5750                                  ;-703   if (mode==2) {prs("\n mov  ");printName(i); prs(", ax"); return;}
  5751                                  
  5752                                  .doassign303:
  5753 000024F4 8B4604                   mov ax, [bp+4]
  5754 000024F7 83F802                   cmp ax, 2
  5755 000024FA 0F851E00                 jne .doassign306
  5756 000024FE 68[7526]                 push doassign_3
  5757 00002501 E8DBDE                   call prs
  5758 00002504 83C402                   add  sp, 2
  5759 00002507 FF7606                   push word [bp+6]
  5760 0000250A E8FEE3                   call printName
  5761 0000250D 83C402                   add  sp, 2
  5762 00002510 68[7E26]                 push doassign_4
  5763 00002513 E8C9DE                   call prs
  5764 00002516 83C402                   add  sp, 2
  5765 00002519 E92801                   jmp .retndoassign
  5766                                  
  5767                                  ;-704   if (ixarr) {  prs("\n mov bx, ");
  5768                                  
  5769                                  .doassign306:
  5770 0000251C 8B4608                   mov ax, [bp+8]
  5771 0000251F 08C0                     or  al, al
  5772 00002521 0F846E00                 je .doassign307
  5773 00002525 68[8326]                 push doassign_5
  5774 00002528 E8B4DE                   call prs
  5775 0000252B 83C402                   add  sp, 2
  5776                                  
  5777                                  ;-705     if(ixconst) prunsign1(ixarr); else v(ixarr);
  5778                                  
  5779 0000252E 8B460A                   mov ax, [bp+10]
  5780 00002531 08C0                     or  al, al
  5781 00002533 0F840C00                 je .doassign308
  5782 00002537 FF7608                   push word [bp+8]
  5783 0000253A E805E0                   call prunsign1
  5784 0000253D 83C402                   add  sp, 2
  5785 00002540 E90900                   jmp .doassign309
  5786                                  .doassign308:
  5787 00002543 FF7608                   push word [bp+8]
  5788 00002546 E8D3EA                   call v
  5789 00002549 83C402                   add  sp, 2
  5790                                  
  5791                                  ;-706     if (wi==2) prs("\n shl bx, 1");
  5792                                  
  5793                                  .doassign309:
  5794 0000254C A1[3600]                 mov ax, [wi]
  5795 0000254F 83F802                   cmp ax, 2
  5796 00002552 0F850900                 jne .doassign310
  5797 00002556 68[8F26]                 push doassign_6
  5798 00002559 E883DE                   call prs
  5799 0000255C 83C402                   add  sp, 2
  5800                                  
  5801                                  ;-707     prs("\n mov ["); printName(i);
  5802                                  
  5803                                  .doassign310:
  5804 0000255F 68[9C26]                 push doassign_7
  5805 00002562 E87ADE                   call prs
  5806 00002565 83C402                   add  sp, 2
  5807 00002568 FF7606                   push word [bp+6]
  5808 0000256B E89DE3                   call printName
  5809 0000256E 83C402                   add  sp, 2
  5810                                  
  5811                                  ;-708     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }
  5812                                  
  5813 00002571 A1[3600]                 mov ax, [wi]
  5814 00002574 83F802                   cmp ax, 2
  5815 00002577 0F850C00                 jne .doassign311
  5816 0000257B 68[A526]                 push doassign_8
  5817 0000257E E85EDE                   call prs
  5818 00002581 83C402                   add  sp, 2
  5819 00002584 E90900                   jmp .doassign312
  5820                                  .doassign311:
  5821 00002587 68[AE26]                 push doassign_9
  5822 0000258A E852DE                   call prs
  5823 0000258D 83C402                   add  sp, 2
  5824                                  .doassign312:
  5825 00002590 E9B100                   jmp .retndoassign
  5826                                  
  5827                                  ;-709   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");
  5828                                  
  5829                                  .doassign307:
  5830 00002593 A1[3600]                 mov ax, [wi]
  5831 00002596 83F801                   cmp ax, 1
  5832 00002599 0F853100                 jne .doassign313
  5833 0000259D 68[B726]                 push doassign_10
  5834 000025A0 E83CDE                   call prs
  5835 000025A3 83C402                   add  sp, 2
  5836 000025A6 8B4606                   mov ax, [bp+6]
  5837 000025A9 3DC800                   cmp ax, 200
  5838 000025AC 0F8D0900                 jge .doassign314
  5839 000025B0 68[BF26]                 push doassign_11
  5840 000025B3 E829DE                   call prs
  5841 000025B6 83C402                   add  sp, 2
  5842                                  
  5843                                  ;-710     } v(i); prs(", al"); return; }
  5844                                  
  5845                                  .doassign314:
  5846 000025B9 FF7606                   push word [bp+6]
  5847 000025BC E85DEA                   call v
  5848 000025BF 83C402                   add  sp, 2
  5849 000025C2 68[C526]                 push doassign_12
  5850 000025C5 E817DE                   call prs
  5851 000025C8 83C402                   add  sp, 2
  5852 000025CB E97600                   jmp .retndoassign
  5853                                  
  5854                                  ;-711   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");
  5855                                  
  5856                                  .doassign313:
  5857 000025CE A1[3600]                 mov ax, [wi]
  5858 000025D1 83F802                   cmp ax, 2
  5859 000025D4 0F853100                 jne .doassign315
  5860 000025D8 68[CA26]                 push doassign_13
  5861 000025DB E801DE                   call prs
  5862 000025DE 83C402                   add  sp, 2
  5863 000025E1 8B4606                   mov ax, [bp+6]
  5864 000025E4 3DC800                   cmp ax, 200
  5865 000025E7 0F8D0900                 jge .doassign316
  5866 000025EB 68[D226]                 push doassign_14
  5867 000025EE E8EEDD                   call prs
  5868 000025F1 83C402                   add  sp, 2
  5869                                  
  5870                                  ;-712     } v(i); prs(", ax"); return; }
  5871                                  
  5872                                  .doassign316:
  5873 000025F4 FF7606                   push word [bp+6]
  5874 000025F7 E822EA                   call v
  5875 000025FA 83C402                   add  sp, 2
  5876 000025FD 68[D826]                 push doassign_15
  5877 00002600 E8DCDD                   call prs
  5878 00002603 83C402                   add  sp, 2
  5879 00002606 E93B00                   jmp .retndoassign
  5880                                  
  5881                                  ;-713   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");
  5882                                  
  5883                                  .doassign315:
  5884 00002609 A1[3600]                 mov ax, [wi]
  5885 0000260C 83F804                   cmp ax, 4
  5886 0000260F 0F853100                 jne .doassign317
  5887 00002613 68[DD26]                 push doassign_16
  5888 00002616 E8C6DD                   call prs
  5889 00002619 83C402                   add  sp, 2
  5890 0000261C 8B4606                   mov ax, [bp+6]
  5891 0000261F 3DC800                   cmp ax, 200
  5892 00002622 0F8D0900                 jge .doassign318
  5893 00002626 68[E526]                 push doassign_17
  5894 00002629 E8B3DD                   call prs
  5895 0000262C 83C402                   add  sp, 2
  5896                                  
  5897                                  ;-714     } v(i); prs(", eax"); return; }
  5898                                  
  5899                                  .doassign318:
  5900 0000262F FF7606                   push word [bp+6]
  5901 00002632 E8E7E9                   call v
  5902 00002635 83C402                   add  sp, 2
  5903 00002638 68[EC26]                 push doassign_18
  5904 0000263B E8A1DD                   call prs
  5905 0000263E 83C402                   add  sp, 2
  5906 00002641 E90000                   jmp .retndoassign
  5907                                  
  5908                                  ;-715 }
  5909                                  
  5910                                  .doassign317:
  5911                                  
  5912                                  ;-716 int domul(int ids) {
  5913                                  
  5914 00002644 C9                       .retndoassign: LEAVE
  5915 00002645 C3                       ret
  5916 00002646 5C6E206D6F76202062-     doassign_0 db "\n mov  bx, ",0
  5917 0000264F 782C2000           
  5918 00002653 5C6E206D6F7620205B-     doassign_1 db "\n mov  [bx], ax",0
  5919 0000265C 62785D2C20617800   
  5920 00002664 5C6E206D6F7620205B-     doassign_2 db "\n mov  [bx], al",0
  5921 0000266D 62785D2C20616C00   
  5922 00002675 5C6E206D6F76202000      doassign_3 db "\n mov  ",0
  5923 0000267E 2C20617800              doassign_4 db ", ax",0
  5924 00002683 5C6E206D6F76206278-     doassign_5 db "\n mov bx, ",0
  5925 0000268C 2C2000             
  5926 0000268F 5C6E2073686C206278-     doassign_6 db "\n shl bx, 1",0
  5927 00002698 2C203100           
  5928 0000269C 5C6E206D6F76205B00      doassign_7 db "\n mov [",0
  5929 000026A5 2B62785D2C20617800      doassign_8 db "+bx], ax",0
  5930 000026AE 2B62785D2C20616C00      doassign_9 db "+bx], al",0
  5931 000026B7 5C6E206D6F762000        doassign_10 db "\n mov ",0
  5932 000026BF 627974652000            doassign_11 db "byte ",0
  5933 000026C5 2C20616C00              doassign_12 db ", al",0
  5934 000026CA 5C6E206D6F762000        doassign_13 db "\n mov ",0
  5935 000026D2 776F72642000            doassign_14 db "word ",0
  5936 000026D8 2C20617800              doassign_15 db ", ax",0
  5937 000026DD 5C6E206D6F762000        doassign_16 db "\n mov ",0
  5938 000026E5 64776F72642000          doassign_17 db "dword ",0
  5939 000026EC 2C2065617800            doassign_18 db ", eax",0
  5940                                  ENDP
  5941                                  
  5942                                  domul: PROC
  5943                                  
  5944                                  ;-717   if (ids) rterm("imul"); else {
  5945                                  ;
  5946 000026F2 C8000000                 ENTER  0,0
  5947 000026F6 8B4604                   mov ax, [bp+4]
  5948 000026F9 08C0                     or  al, al
  5949 000026FB 0F840C00                 je .domul319
  5950 000026FF 68[4427]                 push domul_0
  5951 00002702 E899F9                   call rterm
  5952 00002705 83C402                   add  sp, 2
  5953 00002708 E93700                   jmp .domul320
  5954                                  .domul319:
  5955                                  
  5956                                  ;-718   if (istoken(T_CONST)) {
  5957                                  
  5958 0000270B 680101                   push 257
  5959 0000270E E881E8                   call istoken
  5960 00002711 83C402                   add  sp, 2
  5961 00002714 08C0                     or  al, al
  5962 00002716 0F841F00                 je .domul321
  5963                                  
  5964                                  ;-719     prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx");
  5965                                  
  5966 0000271A 68[4927]                 push domul_1
  5967 0000271D E8BFDC                   call prs
  5968 00002720 83C402                   add  sp, 2
  5969 00002723 FF36[2B00]               push word [lexval]
  5970 00002727 E818DE                   call prunsign1
  5971 0000272A 83C402                   add  sp, 2
  5972 0000272D 68[5527]                 push domul_2
  5973 00002730 E8ACDC                   call prs
  5974 00002733 83C402                   add  sp, 2
  5975                                  
  5976                                  ;-720     }
  5977                                  
  5978                                  
  5979                                  ;-721   else error1("with MUL only const number as multiplicator allowed"); } }
  5980                                  
  5981 00002736 E90900                   jmp .domul322
  5982                                  .domul321:
  5983 00002739 68[5F27]                 push domul_3
  5984 0000273C E8C1DE                   call error1
  5985 0000273F 83C402                   add  sp, 2
  5986                                  .domul322:
  5987                                  .domul320:
  5988                                  
  5989                                  ;-722 int doidiv(int ids) { int mode; int id1;
  5990 00002742 C9                       LEAVE
  5991 00002743 C3                       ret
  5992 00002744 696D756C00              domul_0 db "imul",0
  5993 00002749 5C6E206D6F76206278-     domul_1 db "\n mov bx, ",0
  5994 00002752 2C2000             
  5995 00002755 5C6E206D756C206278-     domul_2 db "\n mul bx",0
  5996 0000275E 00                 
  5997 0000275F 77697468204D554C20-     domul_3 db "with MUL only const number as multiplicator allowed",0
  5998 00002768 6F6E6C7920636F6E73-
  5999 00002771 74206E756D62657220-
  6000 0000277A 6173206D756C746970-
  6001 00002783 6C696361746F722061-
  6002 0000278C 6C6C6F77656400     
  6003                                  ENDP
  6004                                  
  6005                                  doidiv: PROC
  6006                                  
  6007                                  ;-723   if (istoken(T_CONST)) {
  6008                                  ;
  6009 00002793 C8040000                 ENTER  4,0
  6010 00002797 680101                   push 257
  6011 0000279A E8F5E7                   call istoken
  6012 0000279D 83C402                   add  sp, 2
  6013 000027A0 08C0                     or  al, al
  6014 000027A2 0F843400                 je .doidiv323
  6015                                  
  6016                                  ;-724     prs("\n mov bx, "); prunsign1(lexval);
  6017                                  
  6018 000027A6 68[5828]                 push doidiv_0
  6019 000027A9 E833DC                   call prs
  6020 000027AC 83C402                   add  sp, 2
  6021 000027AF FF36[2B00]               push word [lexval]
  6022 000027B3 E88CDD                   call prunsign1
  6023 000027B6 83C402                   add  sp, 2
  6024                                  
  6025                                  ;-725     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  6026                                  
  6027 000027B9 8B4604                   mov ax, [bp+4]
  6028 000027BC 08C0                     or  al, al
  6029 000027BE 0F840C00                 je .doidiv324
  6030 000027C2 68[6428]                 push doidiv_1
  6031 000027C5 E817DC                   call prs
  6032 000027C8 83C402                   add  sp, 2
  6033 000027CB E90900                   jmp .doidiv325
  6034                                  .doidiv324:
  6035 000027CE 68[7528]                 push doidiv_2
  6036 000027D1 E80BDC                   call prs
  6037 000027D4 83C402                   add  sp, 2
  6038                                  .doidiv325:
  6039                                  
  6040                                  ;-726   else {
  6041                                  
  6042 000027D7 E97C00                   jmp .doidiv326
  6043                                  .doidiv323:
  6044                                  
  6045                                  ;-727     mode=typeName(); id1=searchname();
  6046                                  
  6047 000027DA E8BFE9                   call typeName
  6048 000027DD 8946FE                   mov [bp-2], ax
  6049 000027E0 E846E9                   call searchname
  6050 000027E3 8946FC                   mov [bp-4], ax
  6051                                  
  6052                                  ;-728     if (mode) error1("only const number or int as divisor allowed");
  6053                                  
  6054 000027E6 8B46FE                   mov ax, [bp-2]
  6055 000027E9 08C0                     or  al, al
  6056 000027EB 0F840900                 je .doidiv327
  6057 000027EF 68[8B28]                 push doidiv_3
  6058 000027F2 E80BDE                   call error1
  6059 000027F5 83C402                   add  sp, 2
  6060                                  
  6061                                  ;-729     gettypes(id1);
  6062                                  
  6063                                  .doidiv327:
  6064 000027F8 FF76FC                   push word [bp-4]
  6065 000027FB E877EA                   call gettypes
  6066 000027FE 83C402                   add  sp, 2
  6067                                  
  6068                                  ;-730     if (typei) error1("only int as simple var divisor allowed");
  6069                                  
  6070 00002801 A1[2D00]                 mov ax, [typei]
  6071 00002804 08C0                     or  al, al
  6072 00002806 0F840900                 je .doidiv328
  6073 0000280A 68[B728]                 push doidiv_4
  6074 0000280D E8F0DD                   call error1
  6075 00002810 83C402                   add  sp, 2
  6076                                  
  6077                                  ;-731     if (wi!=2) error1("only int, no byte as divisor allowed");
  6078                                  
  6079                                  .doidiv328:
  6080 00002813 A1[3600]                 mov ax, [wi]
  6081 00002816 83F802                   cmp ax, 2
  6082 00002819 0F840900                 je  .doidiv329
  6083 0000281D 68[DE28]                 push doidiv_5
  6084 00002820 E8DDDD                   call error1
  6085 00002823 83C402                   add  sp, 2
  6086                                  
  6087                                  ;-732     prs("\n mov bx, "); v(id1);
  6088                                  
  6089                                  .doidiv329:
  6090 00002826 68[0329]                 push doidiv_6
  6091 00002829 E8B3DB                   call prs
  6092 0000282C 83C402                   add  sp, 2
  6093 0000282F FF76FC                   push word [bp-4]
  6094 00002832 E8E7E7                   call v
  6095 00002835 83C402                   add  sp, 2
  6096                                  
  6097                                  ;-733     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  6098                                  
  6099 00002838 8B4604                   mov ax, [bp+4]
  6100 0000283B 08C0                     or  al, al
  6101 0000283D 0F840C00                 je .doidiv330
  6102 00002841 68[0F29]                 push doidiv_7
  6103 00002844 E898DB                   call prs
  6104 00002847 83C402                   add  sp, 2
  6105 0000284A E90900                   jmp .doidiv331
  6106                                  .doidiv330:
  6107 0000284D 68[2029]                 push doidiv_8
  6108 00002850 E88CDB                   call prs
  6109 00002853 83C402                   add  sp, 2
  6110                                  .doidiv331:
  6111                                  
  6112                                  ;-734 }
  6113                                  
  6114                                  .doidiv326:
  6115                                  
  6116                                  ;-735 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
  6117 00002856 C9                       LEAVE
  6118 00002857 C3                       ret
  6119 00002858 5C6E206D6F76206278-     doidiv_0 db "\n mov bx, ",0
  6120 00002861 2C2000             
  6121 00002864 5C6E206377645C6E20-     doidiv_1 db "\n cwd\n idiv bx",0
  6122 0000286D 6964697620627800   
  6123 00002875 5C6E206D6F76206478-     doidiv_2 db "\n mov dx, 0\n div bx",0
  6124 0000287E 2C20305C6E20646976-
  6125 00002887 20627800           
  6126 0000288B 6F6E6C7920636F6E73-     doidiv_3 db "only const number or int as divisor allowed",0
  6127 00002894 74206E756D62657220-
  6128 0000289D 6F7220696E74206173-
  6129 000028A6 2064697669736F7220-
  6130 000028AF 616C6C6F77656400   
  6131 000028B7 6F6E6C7920696E7420-     doidiv_4 db "only int as simple var divisor allowed",0
  6132 000028C0 61732073696D706C65-
  6133 000028C9 207661722064697669-
  6134 000028D2 736F7220616C6C6F77-
  6135 000028DB 656400             
  6136 000028DE 6F6E6C7920696E742C-     doidiv_5 db "only int, no byte as divisor allowed",0
  6137 000028E7 206E6F206279746520-
  6138 000028F0 61732064697669736F-
  6139 000028F9 7220616C6C6F776564-
  6140 00002902 00                 
  6141 00002903 5C6E206D6F76206278-     doidiv_6 db "\n mov bx, ",0
  6142 0000290C 2C2000             
  6143 0000290F 5C6E206377645C6E20-     doidiv_7 db "\n cwd\n idiv bx",0
  6144 00002918 6964697620627800   
  6145 00002920 5C6E206D6F76206478-     doidiv_8 db "\n mov dx, 0\n div bx",0
  6146 00002929 2C20305C6E20646976-
  6147 00002932 20627800           
  6148                                  ENDP
  6149                                  
  6150                                  domod: PROC;
  6151 00002936 C8000000                 ENTER  0,0
  6152 0000293A FF7604                   push word [bp+4]
  6153 0000293D E853FE                   call doidiv
  6154 00002940 83C402                   add  sp, 2
  6155 00002943 68[4E29]                 push domod_0
  6156 00002946 E896DA                   call prs
  6157 00002949 83C402                   add  sp, 2
  6158                                  
  6159                                  ;-736 
  6160                                  
  6161                                  
  6162                                  ;-737 
  6163                                  
  6164                                  
  6165                                  ;-738 int docalltype[10]; int docallvalue[10];
  6166 0000294C C9                       LEAVE
  6167 0000294D C3                       ret
  6168 0000294E 5C6E206D6F76206178-     domod_0 db "\n mov ax, dx",0
  6169 00002957 2C20647800         
  6170                                  ENDP
  6171                                  section .bss
  6172                                  absolute 42409
  6173 0000A5A9 <res 00000014>          docalltype resw 10
  6174                                  section .text
  6175                                  section .bss
  6176                                  absolute 42429
  6177 0000A5BD <res 00000014>          docallvalue resw 10
  6178                                  section .text
  6179                                  
  6180                                  ;-739 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register
  6181                                  
  6182                                  section .bss
  6183                                  absolute 42449
  6184 0000A5D1 <res 00000011>          procname resb 17
  6185                                  section .text
  6186                                  
  6187                                  ;-740 int docall1() {int i; int narg; int t0; int n0;  int sz32;
  6188                                  
  6189                                  
  6190                                  docall1: PROC
  6191                                  
  6192                                  ;-741   narg=0;  sz32=0;
  6193                                  ;
  6194 0000295C C80A0000                 ENTER  10,0
  6195 00002960 B80000                   mov ax, 0
  6196 00002963 8946FC                   mov [bp-4], ax
  6197 00002966 B80000                   mov ax, 0
  6198 00002969 8946F6                   mov [bp-10], ax
  6199                                  
  6200                                  ;-742   checknamelen();
  6201                                  
  6202 0000296C E8E0E6                   call checknamelen
  6203                                  
  6204                                  ;-743   strcpy(&procname, symbol);
  6205                                  
  6206 0000296F 8D06A36D                 lea  ax, [symbol]
  6207 00002973 50                       push ax
  6208 00002974 8D06D1A5                 lea  ax, [procname]
  6209 00002978 50                       push ax
  6210 00002979 E8ADD8                   call strcpy
  6211 0000297C 83C404                   add  sp, 4
  6212                                  
  6213                                  ;-744 //  storeCall1();
  6214                                  
  6215                                  
  6216                                  ;-745   expect('(');
  6217                                  
  6218 0000297F 6A28                     push 40
  6219 00002981 E830E6                   call expect
  6220 00002984 83C402                   add  sp, 2
  6221                                  
  6222                                  ;-746 	if (istoken(')') ==0 ) {
  6223                                  
  6224 00002987 6A29                     push 41
  6225 00002989 E806E6                   call istoken
  6226 0000298C 83C402                   add  sp, 2
  6227 0000298F 83F800                   cmp ax, 0
  6228 00002992 0F857802                 jne .docall1332
  6229                                  
  6230                                  ;-747 	  do { narg++;
  6231                                  
  6232                                  .docall1333:
  6233 00002996 FF46FC                   inc  word[bp-4]
  6234                                  
  6235                                  ;-748 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;
  6236                                  
  6237 00002999 8B46FC                   mov ax, [bp-4]
  6238 0000299C 83F809                   cmp ax, 9
  6239 0000299F 0F8E0900                 jle .docall1334
  6240 000029A3 68[522C]                 push docall1_0
  6241 000029A6 E857DC                   call error1
  6242 000029A9 83C402                   add  sp, 2
  6243                                  .docall1334:
  6244 000029AC B80000                   mov ax, 0
  6245 000029AF 8946FA                   mov [bp-6], ax
  6246                                  
  6247                                  ;-749       if(istoken(T_CONST)) {t0=1; n0=lexval; }
  6248                                  
  6249 000029B2 680101                   push 257
  6250 000029B5 E8DAE5                   call istoken
  6251 000029B8 83C402                   add  sp, 2
  6252 000029BB 08C0                     or  al, al
  6253 000029BD 0F840C00                 je .docall1335
  6254 000029C1 B80100                   mov ax, 1
  6255 000029C4 8946FA                   mov [bp-6], ax
  6256 000029C7 A1[2B00]                 mov ax, [lexval]
  6257 000029CA 8946F8                   mov [bp-8], ax
  6258                                  
  6259                                  ;-750       if(istoken(T_STRING)){t0=2; n0=nconst;
  6260                                  
  6261                                  .docall1335:
  6262 000029CD 680201                   push 258
  6263 000029D0 E8BFE5                   call istoken
  6264 000029D3 83C402                   add  sp, 2
  6265 000029D6 08C0                     or  al, al
  6266 000029D8 0F846300                 je .docall1336
  6267 000029DC B80200                   mov ax, 2
  6268 000029DF 8946FA                   mov [bp-6], ax
  6269 000029E2 A1[2500]                 mov ax, [nconst]
  6270 000029E5 8946F8                   mov [bp-8], ax
  6271                                  
  6272                                  ;-751         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");
  6273                                  
  6274 000029E8 68[642C]                 push docall1_1
  6275 000029EB E86AD9                   call eprs
  6276 000029EE 83C402                   add  sp, 2
  6277 000029F1 8D06236E                 lea  ax, [fname]
  6278 000029F5 50                       push ax
  6279 000029F6 E85FD9                   call eprs
  6280 000029F9 83C402                   add  sp, 2
  6281 000029FC 6A5F                     push 95
  6282 000029FE E844D9                   call eprc
  6283 00002A01 83C402                   add  sp, 2
  6284 00002A04 FF36[2500]               push word [nconst]
  6285 00002A08 E876DA                   call eprnum
  6286 00002A0B 83C402                   add  sp, 2
  6287 00002A0E 68[672C]                 push docall1_2
  6288 00002A11 E844D9                   call eprs
  6289 00002A14 83C402                   add  sp, 2
  6290                                  
  6291                                  ;-752         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }
  6292                                  
  6293 00002A17 6A22                     push 34
  6294 00002A19 E829D9                   call eprc
  6295 00002A1C 83C402                   add  sp, 2
  6296 00002A1F 8D06A36D                 lea  ax, [symbol]
  6297 00002A23 50                       push ax
  6298 00002A24 E831D9                   call eprs
  6299 00002A27 83C402                   add  sp, 2
  6300 00002A2A 6A22                     push 34
  6301 00002A2C E816D9                   call eprc
  6302 00002A2F 83C402                   add  sp, 2
  6303 00002A32 68[6C2C]                 push docall1_3
  6304 00002A35 E820D9                   call eprs
  6305 00002A38 83C402                   add  sp, 2
  6306 00002A3B FF06[2500]               inc  word[nconst]
  6307                                  
  6308                                  ;-753       if(istoken('&'))     {t0=3; name1(); n0=searchname();}
  6309                                  
  6310                                  .docall1336:
  6311 00002A3F 6A26                     push 38
  6312 00002A41 E84EE5                   call istoken
  6313 00002A44 83C402                   add  sp, 2
  6314 00002A47 08C0                     or  al, al
  6315 00002A49 0F840F00                 je .docall1337
  6316 00002A4D B80300                   mov ax, 3
  6317 00002A50 8946FA                   mov [bp-6], ax
  6318 00002A53 E81EE7                   call name1
  6319 00002A56 E8D0E6                   call searchname
  6320 00002A59 8946F8                   mov [bp-8], ax
  6321                                  
  6322                                  ;-754       if(istoken(T_NAME))  { n0=checkreg();
  6323                                  
  6324                                  .docall1337:
  6325 00002A5C 680001                   push 256
  6326 00002A5F E830E5                   call istoken
  6327 00002A62 83C402                   add  sp, 2
  6328 00002A65 08C0                     or  al, al
  6329 00002A67 0F844800                 je .docall1338
  6330 00002A6B E85EEC                   call checkreg
  6331 00002A6E 8946F8                   mov [bp-8], ax
  6332                                  
  6333                                  ;-755         if (n0) t0=5;
  6334                                  
  6335 00002A71 8B46F8                   mov ax, [bp-8]
  6336 00002A74 08C0                     or  al, al
  6337 00002A76 0F840900                 je .docall1339
  6338 00002A7A B80500                   mov ax, 5
  6339 00002A7D 8946FA                   mov [bp-6], ax
  6340                                  
  6341                                  ;-756         else {t0=4; n0=searchname();
  6342                                  
  6343 00002A80 E93000                   jmp .docall1340
  6344                                  .docall1339:
  6345 00002A83 B80400                   mov ax, 4
  6346 00002A86 8946FA                   mov [bp-6], ax
  6347 00002A89 E89DE6                   call searchname
  6348 00002A8C 8946F8                   mov [bp-8], ax
  6349                                  
  6350                                  ;-757           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }
  6351                                  
  6352 00002A8F B8EC6E                   mov ax, GType
  6353 00002A92 A3[4400]                 mov word [p1], ax
  6354 00002A95 A1[4400]                 mov ax, [p1]
  6355 00002A98 0346F8                   add ax, [bp-8]
  6356 00002A9B A3[4400]                 mov word [p1], ax
  6357 00002A9E 8B1E[4400]               mov bx, [p1]
  6358 00002AA2 8A07                     mov al, [bx]
  6359 00002AA4 B400                     mov ah, 0
  6360 00002AA6 83F826                   cmp ax, 38
  6361 00002AA9 0F850600                 jne .docall1341
  6362 00002AAD B80300                   mov ax, 3
  6363 00002AB0 8946FA                   mov [bp-6], ax
  6364                                  .docall1341:
  6365                                  .docall1340:
  6366                                  
  6367                                  ;-758       if (t0==0) error1("parameter not recognized (no * allowed)");
  6368                                  
  6369                                  .docall1338:
  6370 00002AB3 8B46FA                   mov ax, [bp-6]
  6371 00002AB6 83F800                   cmp ax, 0
  6372 00002AB9 0F850900                 jne .docall1342
  6373 00002ABD 68[6F2C]                 push docall1_4
  6374 00002AC0 E83DDB                   call error1
  6375 00002AC3 83C402                   add  sp, 2
  6376                                  
  6377                                  ;-759       docalltype [narg] = t0;
  6378                                  
  6379                                  .docall1342:
  6380 00002AC6 8B46FA                   mov ax, [bp-6]
  6381 00002AC9 8B5EFC                   mov bx, [bp-4]
  6382 00002ACC D1E3                     shl bx, 1
  6383 00002ACE 8987A9A5                 mov [docalltype+bx], ax
  6384                                  
  6385                                  ;-760       docallvalue[narg] = n0;
  6386                                  
  6387 00002AD2 8B46F8                   mov ax, [bp-8]
  6388 00002AD5 8B5EFC                   mov bx, [bp-4]
  6389 00002AD8 D1E3                     shl bx, 1
  6390 00002ADA 8987BDA5                 mov [docallvalue+bx], ax
  6391                                  
  6392                                  ;-761     } while (istoken(','));
  6393                                  
  6394 00002ADE 6A2C                     push 44
  6395 00002AE0 E8AFE4                   call istoken
  6396 00002AE3 83C402                   add  sp, 2
  6397 00002AE6 08C0                     or  al, al
  6398 00002AE8 0F840300                 je .docall1343
  6399 00002AEC E9A7FE                   jmp .docall1333
  6400                                  .docall1343:
  6401                                  
  6402                                  ;-762 
  6403                                  
  6404                                  
  6405                                  ;-763   	expect(')');  i=narg;
  6406                                  
  6407 00002AEF 6A29                     push 41
  6408 00002AF1 E8C0E4                   call expect
  6409 00002AF4 83C402                   add  sp, 2
  6410 00002AF7 8B46FC                   mov ax, [bp-4]
  6411 00002AFA 8946FE                   mov [bp-2], ax
  6412                                  
  6413                                  ;-764     do {
  6414                                  
  6415                                  .docall1344:
  6416                                  
  6417                                  ;-765       t0 = docalltype [i];
  6418                                  
  6419 00002AFD 8B5EFE                   mov bx, [bp-2]
  6420 00002B00 D1E3                     shl bx, 1
  6421 00002B02 8B87A9A5                 mov ax, [docalltype + bx]
  6422 00002B06 8946FA                   mov [bp-6], ax
  6423                                  
  6424                                  ;-766       n0 = docallvalue[i];
  6425                                  
  6426 00002B09 8B5EFE                   mov bx, [bp-2]
  6427 00002B0C D1E3                     shl bx, 1
  6428 00002B0E 8B87BDA5                 mov ax, [docallvalue + bx]
  6429 00002B12 8946F8                   mov [bp-8], ax
  6430                                  
  6431                                  ;-767       if(t0==1){ prs("\n push "); prunsign1(n0);}
  6432                                  
  6433 00002B15 8B46FA                   mov ax, [bp-6]
  6434 00002B18 83F801                   cmp ax, 1
  6435 00002B1B 0F851200                 jne .docall1345
  6436 00002B1F 68[972C]                 push docall1_5
  6437 00002B22 E8BAD8                   call prs
  6438 00002B25 83C402                   add  sp, 2
  6439 00002B28 FF76F8                   push word [bp-8]
  6440 00002B2B E814DA                   call prunsign1
  6441 00002B2E 83C402                   add  sp, 2
  6442                                  
  6443                                  ;-768       if(t0==2){ prs("\n push ");
  6444                                  
  6445                                  .docall1345:
  6446 00002B31 8B46FA                   mov ax, [bp-6]
  6447 00002B34 83F802                   cmp ax, 2
  6448 00002B37 0F852500                 jne .docall1346
  6449 00002B3B 68[A02C]                 push docall1_6
  6450 00002B3E E89ED8                   call prs
  6451 00002B41 83C402                   add  sp, 2
  6452                                  
  6453                                  ;-769         prs(fname);prc(95);prunsign1(n0);}
  6454                                  
  6455 00002B44 8D06236E                 lea  ax, [fname]
  6456 00002B48 50                       push ax
  6457 00002B49 E893D8                   call prs
  6458 00002B4C 83C402                   add  sp, 2
  6459 00002B4F 6A5F                     push 95
  6460 00002B51 E832D8                   call prc
  6461 00002B54 83C402                   add  sp, 2
  6462 00002B57 FF76F8                   push word [bp-8]
  6463 00002B5A E8E5D9                   call prunsign1
  6464 00002B5D 83C402                   add  sp, 2
  6465                                  
  6466                                  ;-770       if(t0==3){ prs("\n lea  ax, ");   v(n0);
  6467                                  
  6468                                  .docall1346:
  6469 00002B60 8B46FA                   mov ax, [bp-6]
  6470 00002B63 83F803                   cmp ax, 3
  6471 00002B66 0F851B00                 jne .docall1347
  6472 00002B6A 68[A92C]                 push docall1_7
  6473 00002B6D E86FD8                   call prs
  6474 00002B70 83C402                   add  sp, 2
  6475 00002B73 FF76F8                   push word [bp-8]
  6476 00002B76 E8A3E4                   call v
  6477 00002B79 83C402                   add  sp, 2
  6478                                  
  6479                                  ;-771         prs("\n push ax");}
  6480                                  
  6481 00002B7C 68[B62C]                 push docall1_8
  6482 00002B7F E85DD8                   call prs
  6483 00002B82 83C402                   add  sp, 2
  6484                                  
  6485                                  ;-772       if(t0==4){ gettypes(n0);
  6486                                  
  6487                                  .docall1347:
  6488 00002B85 8B46FA                   mov ax, [bp-6]
  6489 00002B88 83F804                   cmp ax, 4
  6490 00002B8B 0F854300                 jne .docall1348
  6491 00002B8F FF76F8                   push word [bp-8]
  6492 00002B92 E8E0E6                   call gettypes
  6493 00002B95 83C402                   add  sp, 2
  6494                                  
  6495                                  ;-773         if(wi==2) { prs("\n push word "); v(n0);}
  6496                                  
  6497 00002B98 A1[3600]                 mov ax, [wi]
  6498 00002B9B 83F802                   cmp ax, 2
  6499 00002B9E 0F851500                 jne .docall1349
  6500 00002BA2 68[C12C]                 push docall1_9
  6501 00002BA5 E837D8                   call prs
  6502 00002BA8 83C402                   add  sp, 2
  6503 00002BAB FF76F8                   push word [bp-8]
  6504 00002BAE E86BE4                   call v
  6505 00002BB1 83C402                   add  sp, 2
  6506                                  
  6507                                  ;-774         else { prs("\n mov al, byte ");   v(n0);
  6508                                  
  6509 00002BB4 E91B00                   jmp .docall1350
  6510                                  .docall1349:
  6511 00002BB7 68[CF2C]                 push docall1_10
  6512 00002BBA E822D8                   call prs
  6513 00002BBD 83C402                   add  sp, 2
  6514 00002BC0 FF76F8                   push word [bp-8]
  6515 00002BC3 E856E4                   call v
  6516 00002BC6 83C402                   add  sp, 2
  6517                                  
  6518                                  ;-775         prs("\n mov ah, 0\n push ax"); } }
  6519                                  
  6520 00002BC9 68[E02C]                 push docall1_11
  6521 00002BCC E810D8                   call prs
  6522 00002BCF 83C402                   add  sp, 2
  6523                                  .docall1350:
  6524                                  
  6525                                  ;-776       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }
  6526                                  
  6527                                  .docall1348:
  6528 00002BD2 8B46FA                   mov ax, [bp-6]
  6529 00002BD5 83F805                   cmp ax, 5
  6530 00002BD8 0F852200                 jne .docall1351
  6531 00002BDC 68[F72C]                 push docall1_12
  6532 00002BDF E8FDD7                   call prs
  6533 00002BE2 83C402                   add  sp, 2
  6534 00002BE5 FF76F8                   push word [bp-8]
  6535 00002BE8 E8EFEE                   call printreg
  6536 00002BEB 83C402                   add  sp, 2
  6537 00002BEE 8B46F8                   mov ax, [bp-8]
  6538 00002BF1 83F82F                   cmp ax, 47 ;unsigned : 1
  6539 00002BF4 0F8C0600                 jl  .docall1352
  6540 00002BF8 8B46F6                   mov ax, [bp-10]
  6541 00002BFB 83C002                   add ax, 2
  6542                                  .docall1352:
  6543                                  
  6544                                  ;-777    i--; } while (i > 0);  }
  6545                                  
  6546                                  .docall1351:
  6547 00002BFE FF4EFE                   dec  word[bp-2]
  6548 00002C01 8B46FE                   mov ax, [bp-2]
  6549 00002C04 83F800                   cmp ax, 0
  6550 00002C07 0F8E0300                 jle .docall1353
  6551 00002C0B E9EFFE                   jmp .docall1344
  6552                                  .docall1353:
  6553                                  
  6554                                  ;-778 	 prs("\n call "); prs(&procname);
  6555                                  
  6556                                  .docall1332:
  6557 00002C0E 68[002D]                 push docall1_13
  6558 00002C11 E8CBD7                   call prs
  6559 00002C14 83C402                   add  sp, 2
  6560 00002C17 8D06D1A5                 lea  ax, [procname]
  6561 00002C1B 50                       push ax
  6562 00002C1C E8C0D7                   call prs
  6563 00002C1F 83C402                   add  sp, 2
  6564                                  
  6565                                  ;-779 	 if (narg>0) {prs("\n add  sp, ");
  6566                                  
  6567 00002C22 8B46FC                   mov ax, [bp-4]
  6568 00002C25 83F800                   cmp ax, 0
  6569 00002C28 0F8E2400                 jle .docall1354
  6570 00002C2C 68[092D]                 push docall1_14
  6571 00002C2F E8ADD7                   call prs
  6572 00002C32 83C402                   add  sp, 2
  6573                                  
  6574                                  ;-780      narg=narg+narg; narg=narg+sz32; prunsign1(narg); }
  6575                                  
  6576 00002C35 8B46FC                   mov ax, [bp-4]
  6577 00002C38 0346FC                   add ax, [bp-4]
  6578 00002C3B 8946FC                   mov [bp-4], ax
  6579 00002C3E 8B46FC                   mov ax, [bp-4]
  6580 00002C41 0346F6                   add ax, [bp-10]
  6581 00002C44 8946FC                   mov [bp-4], ax
  6582 00002C47 FF76FC                   push word [bp-4]
  6583 00002C4A E8F5D8                   call prunsign1
  6584 00002C4D 83C402                   add  sp, 2
  6585                                  
  6586                                  ;-781  }
  6587                                  
  6588                                  .docall1354:
  6589                                  
  6590                                  ;-782 
  6591                                  
  6592                                  
  6593                                  ;-783  int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
  6594 00002C50 C9                       LEAVE
  6595 00002C51 C3                       ret
  6596 00002C52 4D61782E2039207061-     docall1_0 db "Max. 9 parameters",0
  6597 00002C5B 72616D657465727300 
  6598 00002C64 5C6E00                  docall1_1 db "\n",0
  6599 00002C67 2064622000              docall1_2 db " db ",0
  6600 00002C6C 2C3000                  docall1_3 db ",0",0
  6601 00002C6F 706172616D65746572-     docall1_4 db "parameter not recognized (no * allowed)",0
  6602 00002C78 206E6F74207265636F-
  6603 00002C81 676E697A656420286E-
  6604 00002C8A 6F202A20616C6C6F77-
  6605 00002C93 65642900           
  6606 00002C97 5C6E20707573682000      docall1_5 db "\n push ",0
  6607 00002CA0 5C6E20707573682000      docall1_6 db "\n push ",0
  6608 00002CA9 5C6E206C6561202061-     docall1_7 db "\n lea  ax, ",0
  6609 00002CB2 782C2000           
  6610 00002CB6 5C6E20707573682061-     docall1_8 db "\n push ax",0
  6611 00002CBF 7800               
  6612 00002CC1 5C6E20707573682077-     docall1_9 db "\n push word ",0
  6613 00002CCA 6F72642000         
  6614 00002CCF 5C6E206D6F7620616C-     docall1_10 db "\n mov al, byte ",0
  6615 00002CD8 2C20627974652000   
  6616 00002CE0 5C6E206D6F76206168-     docall1_11 db "\n mov ah, 0\n push ax",0
  6617 00002CE9 2C20305C6E20707573-
  6618 00002CF2 6820617800         
  6619 00002CF7 5C6E20707573682000      docall1_12 db "\n push ",0
  6620 00002D00 5C6E2063616C6C2000      docall1_13 db "\n call ",0
  6621 00002D09 5C6E20616464202073-     docall1_14 db "\n add  sp, ",0
  6622 00002D12 702C2000           
  6623                                  ENDP
  6624 00002D16 0000                    evalue dw 0
  6625 00002D18 0A00                    exprtype dw 10
  6626                                  
  6627                                  ;-784  int expr(int isRight)
  6628                                  
  6629                                  
  6630                                  expr: PROC
  6631                                  
  6632                                  ;-785  { int mode; int id1;     int ixarr; int ixconst;
  6633                                  
  6634                                  
  6635                                  ;-786    int ids;  int isCONST; int i;     unsigned char *p;
  6636                                  
  6637                                  
  6638                                  ;-787    if (istoken(T_CONST)) { evalue=lexval;
  6639                                  ;
  6640 00002D1A C8100000                 ENTER  16,0
  6641 00002D1E 680101                   push 257
  6642 00002D21 E86EE2                   call istoken
  6643 00002D24 83C402                   add  sp, 2
  6644 00002D27 08C0                     or  al, al
  6645 00002D29 0F841F00                 je .expr355
  6646 00002D2D A1[2B00]                 mov ax, [lexval]
  6647 00002D30 A3[162D]                 mov word [evalue], ax
  6648                                  
  6649                                  ;-788      prs("\n mov ax, "); prunsign1(lexval); return 4; }
  6650                                  
  6651 00002D33 68[BA30]                 push expr_0
  6652 00002D36 E8A6D6                   call prs
  6653 00002D39 83C402                   add  sp, 2
  6654 00002D3C FF36[2B00]               push word [lexval]
  6655 00002D40 E8FFD7                   call prunsign1
  6656 00002D43 83C402                   add  sp, 2
  6657 00002D46 B80400                   mov ax, 4
  6658 00002D49 E96C03                   jmp .retnexpr
  6659                                  
  6660                                  ;-789    mode=typeName(); /*0=V,1=*,2=&*/
  6661                                  
  6662                                  .expr355:
  6663 00002D4C E84DE4                   call typeName
  6664 00002D4F 8946FE                   mov [bp-2], ax
  6665                                  
  6666                                  ;-790    ireg1=checkreg();
  6667                                  
  6668 00002D52 E877E9                   call checkreg
  6669 00002D55 A3[4B00]                 mov word [ireg1], ax
  6670                                  
  6671                                  ;-791    if (ireg1) { doreg1(0); return; }
  6672                                  
  6673 00002D58 A1[4B00]                 mov ax, [ireg1]
  6674 00002D5B 08C0                     or  al, al
  6675 00002D5D 0F840B00                 je .expr356
  6676 00002D61 6A00                     push 0
  6677 00002D63 E8E0EE                   call doreg1
  6678 00002D66 83C402                   add  sp, 2
  6679 00002D69 E94C03                   jmp .retnexpr
  6680                                  
  6681                                  ;-792    if (token=='(')  {docall1(); goto e1; }
  6682                                  
  6683                                  .expr356:
  6684 00002D6C A1[1E00]                 mov ax, [token]
  6685 00002D6F 83F828                   cmp ax, 40
  6686 00002D72 0F850600                 jne .expr357
  6687 00002D76 E8E3FB                   call docall1
  6688 00002D79 E93202                   jmp .e1
  6689                                  
  6690                                  ;-793    if (isreg()) goto e1;
  6691                                  
  6692                                  .expr357:
  6693 00002D7C E8CEF4                   call isreg
  6694 00002D7F 08C0                     or  al, al
  6695 00002D81 0F840300                 je .expr358
  6696 00002D85 E92602                   jmp .e1
  6697                                  
  6698                                  ;-794 
  6699                                  
  6700                                  
  6701                                  ;-795    id1=searchname(); gettypes(id1); ids=signi;
  6702                                  
  6703                                  .expr358:
  6704 00002D88 E89EE3                   call searchname
  6705 00002D8B 8946FC                   mov [bp-4], ax
  6706 00002D8E FF76FC                   push word [bp-4]
  6707 00002D91 E8E1E4                   call gettypes
  6708 00002D94 83C402                   add  sp, 2
  6709 00002D97 A1[3000]                 mov ax, [signi]
  6710 00002D9A 8946F6                   mov [bp-10], ax
  6711                                  
  6712                                  ;-796    ixarr=0;  ixconst=0;
  6713                                  
  6714 00002D9D B80000                   mov ax, 0
  6715 00002DA0 8946FA                   mov [bp-6], ax
  6716 00002DA3 B80000                   mov ax, 0
  6717 00002DA6 8946F8                   mov [bp-8], ax
  6718                                  
  6719                                  ;-797      if (istoken('[')) { if (istoken(T_CONST)) {
  6720                                  
  6721 00002DA9 6A5B                     push 91
  6722 00002DAB E8E4E1                   call istoken
  6723 00002DAE 83C402                   add  sp, 2
  6724 00002DB1 08C0                     or  al, al
  6725 00002DB3 0F845900                 je .expr359
  6726 00002DB7 680101                   push 257
  6727 00002DBA E8D5E1                   call istoken
  6728 00002DBD 83C402                   add  sp, 2
  6729 00002DC0 08C0                     or  al, al
  6730 00002DC2 0F841700                 je .expr360
  6731                                  
  6732                                  ;-798        ixconst=1; ixarr=lexval; expect(']');  }
  6733                                  
  6734 00002DC6 B80100                   mov ax, 1
  6735 00002DC9 8946F8                   mov [bp-8], ax
  6736 00002DCC A1[2B00]                 mov ax, [lexval]
  6737 00002DCF 8946FA                   mov [bp-6], ax
  6738 00002DD2 6A5D                     push 93
  6739 00002DD4 E8DDE1                   call expect
  6740 00002DD7 83C402                   add  sp, 2
  6741                                  
  6742                                  ;-799      else {ixarr=searchname(); expect(T_NAME); expect(']');
  6743                                  
  6744 00002DDA E93300                   jmp .expr361
  6745                                  .expr360:
  6746 00002DDD E849E3                   call searchname
  6747 00002DE0 8946FA                   mov [bp-6], ax
  6748 00002DE3 680001                   push 256
  6749 00002DE6 E8CBE1                   call expect
  6750 00002DE9 83C402                   add  sp, 2
  6751 00002DEC 6A5D                     push 93
  6752 00002DEE E8C3E1                   call expect
  6753 00002DF1 83C402                   add  sp, 2
  6754                                  
  6755                                  ;-800      gettypes(ixarr);
  6756                                  
  6757 00002DF4 FF76FA                   push word [bp-6]
  6758 00002DF7 E87BE4                   call gettypes
  6759 00002DFA 83C402                   add  sp, 2
  6760                                  
  6761                                  ;-801      if (widthi != 2) error1("Array index must be number or int"); } }
  6762                                  
  6763 00002DFD A1[3300]                 mov ax, [widthi]
  6764 00002E00 83F802                   cmp ax, 2
  6765 00002E03 0F840900                 je  .expr362
  6766 00002E07 68[C630]                 push expr_1
  6767 00002E0A E8F3D7                   call error1
  6768 00002E0D 83C402                   add  sp, 2
  6769                                  .expr362:
  6770                                  .expr361:
  6771                                  
  6772                                  ;-802    if (istoken(T_PLUSPLUS  )) {if(mode)error1("Only var allowed");
  6773                                  
  6774                                  .expr359:
  6775 00002E10 68C304                   push 1219
  6776 00002E13 E87CE1                   call istoken
  6777 00002E16 83C402                   add  sp, 2
  6778 00002E19 08C0                     or  al, al
  6779 00002E1B 0F844600                 je .expr363
  6780 00002E1F 8B46FE                   mov ax, [bp-2]
  6781 00002E22 08C0                     or  al, al
  6782 00002E24 0F840900                 je .expr364
  6783 00002E28 68[E830]                 push expr_2
  6784 00002E2B E8D2D7                   call error1
  6785 00002E2E 83C402                   add  sp, 2
  6786                                  
  6787                                  ;-803       prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");
  6788                                  
  6789                                  .expr364:
  6790 00002E31 68[F930]                 push expr_3
  6791 00002E34 E8A8D5                   call prs
  6792 00002E37 83C402                   add  sp, 2
  6793 00002E3A A1[3600]                 mov ax, [wi]
  6794 00002E3D 83F802                   cmp ax, 2
  6795 00002E40 0F850C00                 jne .expr365
  6796 00002E44 68[0231]                 push expr_4
  6797 00002E47 E895D5                   call prs
  6798 00002E4A 83C402                   add  sp, 2
  6799 00002E4D E90900                   jmp .expr366
  6800                                  .expr365:
  6801 00002E50 68[0731]                 push expr_5
  6802 00002E53 E889D5                   call prs
  6803 00002E56 83C402                   add  sp, 2
  6804                                  
  6805                                  ;-804       v(id1); goto e1;}
  6806                                  
  6807                                  .expr366:
  6808 00002E59 FF76FC                   push word [bp-4]
  6809 00002E5C E8BDE1                   call v
  6810 00002E5F 83C402                   add  sp, 2
  6811 00002E62 E94901                   jmp .e1
  6812                                  
  6813                                  ;-805    if (istoken(T_MINUSMINUS)) {if(mode)error1("Only var allowed");
  6814                                  
  6815                                  .expr363:
  6816 00002E65 68C904                   push 1225
  6817 00002E68 E827E1                   call istoken
  6818 00002E6B 83C402                   add  sp, 2
  6819 00002E6E 08C0                     or  al, al
  6820 00002E70 0F844600                 je .expr367
  6821 00002E74 8B46FE                   mov ax, [bp-2]
  6822 00002E77 08C0                     or  al, al
  6823 00002E79 0F840900                 je .expr368
  6824 00002E7D 68[0C31]                 push expr_6
  6825 00002E80 E87DD7                   call error1
  6826 00002E83 83C402                   add  sp, 2
  6827                                  
  6828                                  ;-806       prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");
  6829                                  
  6830                                  .expr368:
  6831 00002E86 68[1D31]                 push expr_7
  6832 00002E89 E853D5                   call prs
  6833 00002E8C 83C402                   add  sp, 2
  6834 00002E8F A1[3600]                 mov ax, [wi]
  6835 00002E92 83F802                   cmp ax, 2
  6836 00002E95 0F850C00                 jne .expr369
  6837 00002E99 68[2631]                 push expr_8
  6838 00002E9C E840D5                   call prs
  6839 00002E9F 83C402                   add  sp, 2
  6840 00002EA2 E90900                   jmp .expr370
  6841                                  .expr369:
  6842 00002EA5 68[2B31]                 push expr_9
  6843 00002EA8 E834D5                   call prs
  6844 00002EAB 83C402                   add  sp, 2
  6845                                  
  6846                                  ;-807       v(id1); goto e1;}
  6847                                  
  6848                                  .expr370:
  6849 00002EAE FF76FC                   push word [bp-4]
  6850 00002EB1 E868E1                   call v
  6851 00002EB4 83C402                   add  sp, 2
  6852 00002EB7 E9F400                   jmp .e1
  6853                                  
  6854                                  ;-808 
  6855                                  
  6856                                  
  6857                                  ;-809    if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}
  6858                                  
  6859                                  .expr367:
  6860 00002EBA 68CE04                   push 1230
  6861 00002EBD E8D2E0                   call istoken
  6862 00002EC0 83C402                   add  sp, 2
  6863 00002EC3 08C0                     or  al, al
  6864 00002EC5 0F841200                 je .expr371
  6865 00002EC9 FF76FC                   push word [bp-4]
  6866 00002ECC FF76FE                   push word [bp-2]
  6867 00002ECF 68[3031]                 push expr_10
  6868 00002ED2 E85DEF                   call compoundass
  6869 00002ED5 83C406                   add  sp, 6
  6870 00002ED8 E9D300                   jmp .e1
  6871                                  
  6872                                  ;-810    if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}
  6873                                  
  6874                                  .expr371:
  6875 00002EDB 68CF04                   push 1231
  6876 00002EDE E8B1E0                   call istoken
  6877 00002EE1 83C402                   add  sp, 2
  6878 00002EE4 08C0                     or  al, al
  6879 00002EE6 0F841200                 je .expr372
  6880 00002EEA FF76FC                   push word [bp-4]
  6881 00002EED FF76FE                   push word [bp-2]
  6882 00002EF0 68[3431]                 push expr_11
  6883 00002EF3 E83CEF                   call compoundass
  6884 00002EF6 83C406                   add  sp, 6
  6885 00002EF9 E9B200                   jmp .e1
  6886                                  
  6887                                  ;-811    if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}
  6888                                  
  6889                                  .expr372:
  6890 00002EFC 68D204                   push 1234
  6891 00002EFF E890E0                   call istoken
  6892 00002F02 83C402                   add  sp, 2
  6893 00002F05 08C0                     or  al, al
  6894 00002F07 0F841200                 je .expr373
  6895 00002F0B FF76FC                   push word [bp-4]
  6896 00002F0E FF76FE                   push word [bp-2]
  6897 00002F11 68[3831]                 push expr_12
  6898 00002F14 E81BEF                   call compoundass
  6899 00002F17 83C406                   add  sp, 6
  6900 00002F1A E99100                   jmp .e1
  6901                                  
  6902                                  ;-812    if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}
  6903                                  
  6904                                  .expr373:
  6905 00002F1D 68D304                   push 1235
  6906 00002F20 E86FE0                   call istoken
  6907 00002F23 83C402                   add  sp, 2
  6908 00002F26 08C0                     or  al, al
  6909 00002F28 0F841200                 je .expr374
  6910 00002F2C FF76FC                   push word [bp-4]
  6911 00002F2F FF76FE                   push word [bp-2]
  6912 00002F32 68[3C31]                 push expr_13
  6913 00002F35 E8FAEE                   call compoundass
  6914 00002F38 83C406                   add  sp, 6
  6915 00002F3B E97000                   jmp .e1
  6916                                  
  6917                                  ;-813    if (istoken(T_MULASS    )) {error1("not implemented");}
  6918                                  
  6919                                  .expr374:
  6920 00002F3E 68D004                   push 1232
  6921 00002F41 E84EE0                   call istoken
  6922 00002F44 83C402                   add  sp, 2
  6923 00002F47 08C0                     or  al, al
  6924 00002F49 0F840900                 je .expr375
  6925 00002F4D 68[3F31]                 push expr_14
  6926 00002F50 E8ADD6                   call error1
  6927 00002F53 83C402                   add  sp, 2
  6928                                  
  6929                                  ;-814    if (istoken(T_DIVASS    )) {error1("not implemented");}
  6930                                  
  6931                                  .expr375:
  6932 00002F56 68D104                   push 1233
  6933 00002F59 E836E0                   call istoken
  6934 00002F5C 83C402                   add  sp, 2
  6935 00002F5F 08C0                     or  al, al
  6936 00002F61 0F840900                 je .expr376
  6937 00002F65 68[4F31]                 push expr_15
  6938 00002F68 E895D6                   call error1
  6939 00002F6B 83C402                   add  sp, 2
  6940                                  
  6941                                  ;-815 
  6942                                  
  6943                                  
  6944                                  ;-816    if (istoken('=')) { exprtype= expr(1);
  6945                                  
  6946                                  .expr376:
  6947 00002F6E 6A3D                     push 61
  6948 00002F70 E81FE0                   call istoken
  6949 00002F73 83C402                   add  sp, 2
  6950 00002F76 08C0                     or  al, al
  6951 00002F78 0F842000                 je .expr377
  6952 00002F7C 6A01                     push 1
  6953 00002F7E E899FD                   call expr
  6954 00002F81 83C402                   add  sp, 2
  6955 00002F84 A3[182D]                 mov word [exprtype], ax
  6956                                  
  6957                                  ;-817    doassign(mode, id1, ixarr, ixconst); goto e1;  }
  6958                                  
  6959 00002F87 FF76F8                   push word [bp-8]
  6960 00002F8A FF76FA                   push word [bp-6]
  6961 00002F8D FF76FC                   push word [bp-4]
  6962 00002F90 FF76FE                   push word [bp-2]
  6963 00002F93 E813F5                   call doassign
  6964 00002F96 83C408                   add  sp, 8
  6965 00002F99 E91200                   jmp .e1
  6966                                  
  6967                                  ;-818    dovar1(mode, "mov", ixarr, id1);
  6968                                  
  6969                                  .expr377:
  6970 00002F9C FF76FC                   push word [bp-4]
  6971 00002F9F FF76FA                   push word [bp-6]
  6972 00002FA2 68[5F31]                 push expr_16
  6973 00002FA5 FF76FE                   push word [bp-2]
  6974 00002FA8 E829EF                   call dovar1
  6975 00002FAB 83C408                   add  sp, 8
  6976                                  
  6977                                  ;-819 
  6978                                  
  6979                                  
  6980                                  ;-820  e1:    if (istoken('+')) rterm("add");
  6981                                  
  6982                                  .e1:
  6983 00002FAE 6A2B                     push 43
  6984 00002FB0 E8DFDF                   call istoken
  6985 00002FB3 83C402                   add  sp, 2
  6986 00002FB6 08C0                     or  al, al
  6987 00002FB8 0F840C00                 je .expr378
  6988 00002FBC 68[6331]                 push expr_17
  6989 00002FBF E8DCF0                   call rterm
  6990 00002FC2 83C402                   add  sp, 2
  6991                                  
  6992                                  ;-821    else if (istoken('-')) rterm("sub" );
  6993                                  
  6994 00002FC5 E9CF00                   jmp .expr379
  6995                                  .expr378:
  6996 00002FC8 6A2D                     push 45
  6997 00002FCA E8C5DF                   call istoken
  6998 00002FCD 83C402                   add  sp, 2
  6999 00002FD0 08C0                     or  al, al
  7000 00002FD2 0F840C00                 je .expr380
  7001 00002FD6 68[6731]                 push expr_18
  7002 00002FD9 E8C2F0                   call rterm
  7003 00002FDC 83C402                   add  sp, 2
  7004                                  
  7005                                  ;-822    else if (istoken('&')) rterm("and" );
  7006                                  
  7007 00002FDF E9B500                   jmp .expr381
  7008                                  .expr380:
  7009 00002FE2 6A26                     push 38
  7010 00002FE4 E8ABDF                   call istoken
  7011 00002FE7 83C402                   add  sp, 2
  7012 00002FEA 08C0                     or  al, al
  7013 00002FEC 0F840C00                 je .expr382
  7014 00002FF0 68[6B31]                 push expr_19
  7015 00002FF3 E8A8F0                   call rterm
  7016 00002FF6 83C402                   add  sp, 2
  7017                                  
  7018                                  ;-823    else if (istoken('|')) rterm("or" );
  7019                                  
  7020 00002FF9 E99B00                   jmp .expr383
  7021                                  .expr382:
  7022 00002FFC 6A7C                     push 124
  7023 00002FFE E891DF                   call istoken
  7024 00003001 83C402                   add  sp, 2
  7025 00003004 08C0                     or  al, al
  7026 00003006 0F840C00                 je .expr384
  7027 0000300A 68[6F31]                 push expr_20
  7028 0000300D E88EF0                   call rterm
  7029 00003010 83C402                   add  sp, 2
  7030                                  
  7031                                  ;-824    else if (istoken(T_LESSLESS)) rterm("shl");
  7032                                  
  7033 00003013 E98100                   jmp .expr385
  7034                                  .expr384:
  7035 00003016 68D804                   push 1240
  7036 00003019 E876DF                   call istoken
  7037 0000301C 83C402                   add  sp, 2
  7038 0000301F 08C0                     or  al, al
  7039 00003021 0F840C00                 je .expr386
  7040 00003025 68[7231]                 push expr_21
  7041 00003028 E873F0                   call rterm
  7042 0000302B 83C402                   add  sp, 2
  7043                                  
  7044                                  ;-825    else if (istoken(T_GREATGREAT)) rterm("shr");
  7045                                  
  7046 0000302E E96600                   jmp .expr387
  7047                                  .expr386:
  7048 00003031 68D904                   push 1241
  7049 00003034 E85BDF                   call istoken
  7050 00003037 83C402                   add  sp, 2
  7051 0000303A 08C0                     or  al, al
  7052 0000303C 0F840C00                 je .expr388
  7053 00003040 68[7631]                 push expr_22
  7054 00003043 E858F0                   call rterm
  7055 00003046 83C402                   add  sp, 2
  7056                                  
  7057                                  ;-826    else if (istoken('*')) domul (ids);
  7058                                  
  7059 00003049 E94B00                   jmp .expr389
  7060                                  .expr388:
  7061 0000304C 6A2A                     push 42
  7062 0000304E E841DF                   call istoken
  7063 00003051 83C402                   add  sp, 2
  7064 00003054 08C0                     or  al, al
  7065 00003056 0F840C00                 je .expr390
  7066 0000305A FF76F6                   push word [bp-10]
  7067 0000305D E892F6                   call domul
  7068 00003060 83C402                   add  sp, 2
  7069                                  
  7070                                  ;-827    else if (istoken('/')) doidiv(ids);
  7071                                  
  7072 00003063 E93100                   jmp .expr391
  7073                                  .expr390:
  7074 00003066 6A2F                     push 47
  7075 00003068 E827DF                   call istoken
  7076 0000306B 83C402                   add  sp, 2
  7077 0000306E 08C0                     or  al, al
  7078 00003070 0F840C00                 je .expr392
  7079 00003074 FF76F6                   push word [bp-10]
  7080 00003077 E819F7                   call doidiv
  7081 0000307A 83C402                   add  sp, 2
  7082                                  
  7083                                  ;-828    else if (istoken('%')) domod (ids);
  7084                                  
  7085 0000307D E91700                   jmp .expr393
  7086                                  .expr392:
  7087 00003080 6A25                     push 37
  7088 00003082 E80DDF                   call istoken
  7089 00003085 83C402                   add  sp, 2
  7090 00003088 08C0                     or  al, al
  7091 0000308A 0F840900                 je .expr394
  7092 0000308E FF76F6                   push word [bp-10]
  7093 00003091 E8A2F8                   call domod
  7094 00003094 83C402                   add  sp, 2
  7095                                  
  7096                                  ;-829    if (isrelational()) { rterm("cmp"); cmpneg(ids);}
  7097                                  
  7098                                  .expr394:
  7099                                  .expr393:
  7100                                  .expr391:
  7101                                  .expr389:
  7102                                  .expr387:
  7103                                  .expr385:
  7104                                  .expr383:
  7105                                  .expr381:
  7106                                  .expr379:
  7107 00003097 E8CBE5                   call isrelational
  7108 0000309A 08C0                     or  al, al
  7109 0000309C 0F841200                 je .expr395
  7110 000030A0 68[7A31]                 push expr_23
  7111 000030A3 E8F8EF                   call rterm
  7112 000030A6 83C402                   add  sp, 2
  7113 000030A9 FF76F6                   push word [bp-10]
  7114 000030AC E846E4                   call cmpneg
  7115 000030AF 83C402                   add  sp, 2
  7116                                  
  7117                                  ;-830    return 0;
  7118                                  
  7119                                  .expr395:
  7120 000030B2 B80000                   mov ax, 0
  7121 000030B5 E90000                   jmp .retnexpr
  7122                                  
  7123                                  ;-831  }
  7124                                  
  7125                                  
  7126                                  ;-832 
  7127                                  
  7128                                  
  7129                                  ;-833  int pexpr() {expect('('); iscmp=0;
  7130                                  
  7131 000030B8 C9                       .retnexpr: LEAVE
  7132 000030B9 C3                       ret
  7133 000030BA 5C6E206D6F76206178-     expr_0 db "\n mov ax, ",0
  7134 000030C3 2C2000             
  7135 000030C6 417272617920696E64-     expr_1 db "Array index must be number or int",0
  7136 000030CF 6578206D7573742062-
  7137 000030D8 65206E756D62657220-
  7138 000030E1 6F7220696E7400     
  7139 000030E8 4F6E6C792076617220-     expr_2 db "Only var allowed",0
  7140 000030F1 616C6C6F77656400   
  7141 000030F9 5C6E20696E63202000      expr_3 db "\n inc  ",0
  7142 00003102 776F726400              expr_4 db "word",0
  7143 00003107 6279746500              expr_5 db "byte",0
  7144 0000310C 4F6E6C792076617220-     expr_6 db "Only var allowed",0
  7145 00003115 616C6C6F77656400   
  7146 0000311D 5C6E20646563202000      expr_7 db "\n dec  ",0
  7147 00003126 776F726400              expr_8 db "word",0
  7148 0000312B 6279746500              expr_9 db "byte",0
  7149 00003130 61646400                expr_10 db "add",0
  7150 00003134 73756200                expr_11 db "sub",0
  7151 00003138 616E6400                expr_12 db "and",0
  7152 0000313C 6F7200                  expr_13 db "or",0
  7153 0000313F 6E6F7420696D706C65-     expr_14 db "not implemented",0
  7154 00003148 6D656E74656400     
  7155 0000314F 6E6F7420696D706C65-     expr_15 db "not implemented",0
  7156 00003158 6D656E74656400     
  7157 0000315F 6D6F7600                expr_16 db "mov",0
  7158 00003163 61646400                expr_17 db "add",0
  7159 00003167 73756200                expr_18 db "sub",0
  7160 0000316B 616E6400                expr_19 db "and",0
  7161 0000316F 6F7200                  expr_20 db "or",0
  7162 00003172 73686C00                expr_21 db "shl",0
  7163 00003176 73687200                expr_22 db "shr",0
  7164 0000317A 636D7000                expr_23 db "cmp",0
  7165                                  ENDP
  7166                                  
  7167                                  pexpr: PROC
  7168 0000317E 6A28                     push 40
  7169 00003180 E831DE                   call expect
  7170 00003183 83C402                   add  sp, 2
  7171 00003186 B80000                   mov ax, 0
  7172 00003189 A3[2300]                 mov word [iscmp], ax
  7173                                  
  7174                                  ;-834    if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}
  7175                                  
  7176 0000318C A1[1E00]                 mov ax, [token]
  7177 0000318F 3D0001                   cmp ax, 256
  7178 00003192 0F853400                 jne .pexpr396
  7179 00003196 68[F931]                 push pexpr_0
  7180 00003199 8D06A36D                 lea  ax, [symbol]
  7181 0000319D 50                       push ax
  7182 0000319E E8BED0                   call eqstr
  7183 000031A1 83C404                   add  sp, 4
  7184 000031A4 08C0                     or  al, al
  7185 000031A6 0F840600                 je .pexpr397
  7186 000031AA E89AE9                   call constantexpr
  7187 000031AD E94800                   jmp .retnpexpr
  7188                                  
  7189                                  ;-835      ireg1=checkreg();
  7190                                  
  7191                                  .pexpr397:
  7192 000031B0 E819E5                   call checkreg
  7193 000031B3 A3[4B00]                 mov word [ireg1], ax
  7194                                  
  7195                                  ;-836      if (ireg1) { doreg1(1); return; }  }
  7196                                  
  7197 000031B6 A1[4B00]                 mov ax, [ireg1]
  7198 000031B9 08C0                     or  al, al
  7199 000031BB 0F840B00                 je .pexpr398
  7200 000031BF 6A01                     push 1
  7201 000031C1 E882EA                   call doreg1
  7202 000031C4 83C402                   add  sp, 2
  7203 000031C7 E92E00                   jmp .retnpexpr
  7204                                  .pexpr398:
  7205                                  
  7206                                  ;-837    expr(0);
  7207                                  
  7208                                  .pexpr396:
  7209 000031CA 6A00                     push 0
  7210 000031CC E84BFB                   call expr
  7211 000031CF 83C402                   add  sp, 2
  7212                                  
  7213                                  ;-838    if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);
  7214                                  
  7215 000031D2 A1[2300]                 mov ax, [iscmp]
  7216 000031D5 83F800                   cmp ax, 0
  7217 000031D8 0F850900                 jne .pexpr399
  7218 000031DC 68[FB31]                 push pexpr_1
  7219 000031DF E8FDD1                   call prs
  7220 000031E2 83C402                   add  sp, 2
  7221                                  .pexpr399:
  7222 000031E5 8D06236E                 lea  ax, [fname]
  7223 000031E9 50                       push ax
  7224 000031EA E8F2D1                   call prs
  7225 000031ED 83C402                   add  sp, 2
  7226                                  
  7227                                  ;-839    expect(')');
  7228                                  
  7229 000031F0 6A29                     push 41
  7230 000031F2 E8BFDD                   call expect
  7231 000031F5 83C402                   add  sp, 2
  7232                                  
  7233                                  ;-840  }
  7234                                  
  7235                                  
  7236                                  ;-841 
  7237                                  
  7238                                  
  7239                                  ;-842 /***************************************************************/
  7240                                  
  7241                                  
  7242                                  ;-843 
  7243                                  
  7244                                  
  7245                                  ;-844 int prlabel(int n) {
  7246                                  
  7247                                   .retnpexpr:
  7248 000031F8 C3                       ret
  7249 000031F9 5F00                    pexpr_0 db "_",0
  7250 000031FB 5C6E206F722020616C-     pexpr_1 db "\n or  al, al\n je .",0
  7251 00003204 2C20616C5C6E206A65-
  7252 0000320D 202E00             
  7253                                  ENDP
  7254                                  
  7255                                  prlabel: PROC
  7256                                  
  7257                                  ;-845     prs("\n.");
  7258                                  ;
  7259 00003210 C8000000                 ENTER  0,0
  7260 00003214 68[3B32]                 push prlabel_0
  7261 00003217 E8C5D1                   call prs
  7262 0000321A 83C402                   add  sp, 2
  7263                                  
  7264                                  ;-846     prs(fname);
  7265                                  
  7266 0000321D 8D06236E                 lea  ax, [fname]
  7267 00003221 50                       push ax
  7268 00003222 E8BAD1                   call prs
  7269 00003225 83C402                   add  sp, 2
  7270                                  
  7271                                  ;-847     prunsign1(n);
  7272                                  
  7273 00003228 FF7604                   push word [bp+4]
  7274 0000322B E814D3                   call prunsign1
  7275 0000322E 83C402                   add  sp, 2
  7276                                  
  7277                                  ;-848     prc(':');
  7278                                  
  7279 00003231 6A3A                     push 58
  7280 00003233 E850D1                   call prc
  7281 00003236 83C402                   add  sp, 2
  7282                                  
  7283                                  ;-849 }
  7284                                  
  7285                                  
  7286                                  ;-850 int prjump (int n) {
  7287 00003239 C9                       LEAVE
  7288 0000323A C3                       ret
  7289 0000323B 5C6E2E00                prlabel_0 db "\n.",0
  7290                                  ENDP
  7291                                  
  7292                                  prjump: PROC
  7293                                  
  7294                                  ;-851     prs("\n jmp .");
  7295                                  ;
  7296 0000323F C8000000                 ENTER  0,0
  7297 00003243 68[6232]                 push prjump_0
  7298 00003246 E896D1                   call prs
  7299 00003249 83C402                   add  sp, 2
  7300                                  
  7301                                  ;-852     prs(fname);
  7302                                  
  7303 0000324C 8D06236E                 lea  ax, [fname]
  7304 00003250 50                       push ax
  7305 00003251 E88BD1                   call prs
  7306 00003254 83C402                   add  sp, 2
  7307                                  
  7308                                  ;-853     prunsign1(n);
  7309                                  
  7310 00003257 FF7604                   push word [bp+4]
  7311 0000325A E8E5D2                   call prunsign1
  7312 0000325D 83C402                   add  sp, 2
  7313                                  
  7314                                  ;-854 }
  7315                                  
  7316                                  
  7317                                  ;-855 
  7318                                  
  7319                                  
  7320                                  ;-856 int stmt() {
  7321 00003260 C9                       LEAVE
  7322 00003261 C3                       ret
  7323 00003262 5C6E206A6D70202E00      prjump_0 db "\n jmp .",0
  7324                                  ENDP
  7325                                  
  7326                                  stmt: PROC
  7327                                  
  7328                                  ;-857     int c; char cha;
  7329                                  
  7330                                  
  7331                                  ;-858     int jdest; int tst; int jtemp;
  7332                                  
  7333                                  
  7334                                  ;-859        if(istoken('{'))     {while(istoken('}')==0) stmt();}
  7335                                  ;
  7336 0000326B C80A0000                 ENTER  10,0
  7337 0000326F 6A7B                     push 123
  7338 00003271 E81EDD                   call istoken
  7339 00003274 83C402                   add  sp, 2
  7340 00003277 08C0                     or  al, al
  7341 00003279 0F841700                 je .stmt400
  7342                                  .stmt401:
  7343 0000327D 6A7D                     push 125
  7344 0000327F E810DD                   call istoken
  7345 00003282 83C402                   add  sp, 2
  7346 00003285 83F800                   cmp ax, 0
  7347 00003288 0F850500                 jne .stmt402
  7348 0000328C E8DCFF                   call stmt
  7349 0000328F EBEC                     jmp .stmt401
  7350                                  .stmt402:
  7351                                  
  7352                                  ;-860   else if(istoken(T_IF)) {
  7353                                  
  7354 00003291 E9D002                   jmp .stmt403
  7355                                  .stmt400:
  7356 00003294 680102                   push 513
  7357 00003297 E8F8DC                   call istoken
  7358 0000329A 83C402                   add  sp, 2
  7359 0000329D 08C0                     or  al, al
  7360 0000329F 0F846500                 je .stmt404
  7361                                  
  7362                                  ;-861       int jdest; int tst;
  7363                                  
  7364 000032A3 8B46FA                   mov ax, [bp-6]
  7365 000032A6 8B46F8                   mov ax, [bp-8]
  7366                                  
  7367                                  ;-862       pexpr(); nlabel++; jdest=nlabel;
  7368                                  
  7369 000032A9 E8D2FE                   call pexpr
  7370 000032AC FF06[2900]               inc  word[nlabel]
  7371 000032B0 A1[2900]                 mov ax, [nlabel]
  7372 000032B3 8946FA                   mov [bp-6], ax
  7373                                  
  7374                                  ;-863       pint1(jdest); stmt();
  7375                                  
  7376 000032B6 FF76FA                   push word [bp-6]
  7377 000032B9 E828D2                   call pint1
  7378 000032BC 83C402                   add  sp, 2
  7379 000032BF E8A9FF                   call stmt
  7380                                  
  7381                                  ;-864       if (istoken(T_ELSE)) { nlabel++; tst=nlabel;
  7382                                  
  7383 000032C2 680202                   push 514
  7384 000032C5 E8CADC                   call istoken
  7385 000032C8 83C402                   add  sp, 2
  7386 000032CB 08C0                     or  al, al
  7387 000032CD 0F842B00                 je .stmt405
  7388 000032D1 FF06[2900]               inc  word[nlabel]
  7389 000032D5 A1[2900]                 mov ax, [nlabel]
  7390 000032D8 8946F8                   mov [bp-8], ax
  7391                                  
  7392                                  ;-865           prjump(tst); prlabel(jdest); stmt(); prlabel(tst);
  7393                                  
  7394 000032DB FF76F8                   push word [bp-8]
  7395 000032DE E85EFF                   call prjump
  7396 000032E1 83C402                   add  sp, 2
  7397 000032E4 FF76FA                   push word [bp-6]
  7398 000032E7 E826FF                   call prlabel
  7399 000032EA 83C402                   add  sp, 2
  7400 000032ED E87BFF                   call stmt
  7401 000032F0 FF76F8                   push word [bp-8]
  7402 000032F3 E81AFF                   call prlabel
  7403 000032F6 83C402                   add  sp, 2
  7404                                  
  7405                                  ;-866       }
  7406                                  
  7407                                  
  7408                                  ;-867       else prlabel(jdest);
  7409                                  
  7410 000032F9 E90900                   jmp .stmt406
  7411                                  .stmt405:
  7412 000032FC FF76FA                   push word [bp-6]
  7413 000032FF E80EFF                   call prlabel
  7414 00003302 83C402                   add  sp, 2
  7415                                  
  7416                                  ;-868   }
  7417                                  
  7418                                  .stmt406:
  7419                                  
  7420                                  ;-869   else if(istoken(T_DO)) {
  7421                                  
  7422 00003305 E95C02                   jmp .stmt407
  7423                                  .stmt404:
  7424 00003308 680402                   push 516
  7425 0000330B E884DC                   call istoken
  7426 0000330E 83C402                   add  sp, 2
  7427 00003311 08C0                     or  al, al
  7428 00003313 0F844A00                 je .stmt408
  7429                                  
  7430                                  ;-870       nlabel++; jdest=nlabel; prlabel(jdest); stmt();
  7431                                  
  7432 00003317 FF06[2900]               inc  word[nlabel]
  7433 0000331B A1[2900]                 mov ax, [nlabel]
  7434 0000331E 8946FA                   mov [bp-6], ax
  7435 00003321 FF76FA                   push word [bp-6]
  7436 00003324 E8E9FE                   call prlabel
  7437 00003327 83C402                   add  sp, 2
  7438 0000332A E83EFF                   call stmt
  7439                                  
  7440                                  ;-871       expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);
  7441                                  
  7442 0000332D 680302                   push 515
  7443 00003330 E881DC                   call expect
  7444 00003333 83C402                   add  sp, 2
  7445 00003336 E845FE                   call pexpr
  7446 00003339 FF06[2900]               inc  word[nlabel]
  7447 0000333D A1[2900]                 mov ax, [nlabel]
  7448 00003340 8946F6                   mov [bp-10], ax
  7449 00003343 FF76F6                   push word [bp-10]
  7450 00003346 E89BD1                   call pint1
  7451 00003349 83C402                   add  sp, 2
  7452                                  
  7453                                  ;-872       prjump(jdest); prlabel(jtemp);
  7454                                  
  7455 0000334C FF76FA                   push word [bp-6]
  7456 0000334F E8EDFE                   call prjump
  7457 00003352 83C402                   add  sp, 2
  7458 00003355 FF76F6                   push word [bp-10]
  7459 00003358 E8B5FE                   call prlabel
  7460 0000335B 83C402                   add  sp, 2
  7461                                  
  7462                                  ;-873   }
  7463                                  
  7464                                  
  7465                                  ;-874   else if(istoken(T_WHILE)) {
  7466                                  
  7467 0000335E E90302                   jmp .stmt409
  7468                                  .stmt408:
  7469 00003361 680302                   push 515
  7470 00003364 E82BDC                   call istoken
  7471 00003367 83C402                   add  sp, 2
  7472 0000336A 08C0                     or  al, al
  7473 0000336C 0F844100                 je .stmt410
  7474                                  
  7475                                  ;-875       nlabel++; jdest=nlabel;
  7476                                  
  7477 00003370 FF06[2900]               inc  word[nlabel]
  7478 00003374 A1[2900]                 mov ax, [nlabel]
  7479 00003377 8946FA                   mov [bp-6], ax
  7480                                  
  7481                                  ;-876       prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);
  7482                                  
  7483 0000337A FF76FA                   push word [bp-6]
  7484 0000337D E890FE                   call prlabel
  7485 00003380 83C402                   add  sp, 2
  7486 00003383 E8F8FD                   call pexpr
  7487 00003386 FF06[2900]               inc  word[nlabel]
  7488 0000338A A1[2900]                 mov ax, [nlabel]
  7489 0000338D 8946F8                   mov [bp-8], ax
  7490 00003390 FF76F8                   push word [bp-8]
  7491 00003393 E84ED1                   call pint1
  7492 00003396 83C402                   add  sp, 2
  7493                                  
  7494                                  ;-877       stmt(); prjump(jdest); prlabel(tst);
  7495                                  
  7496 00003399 E8CFFE                   call stmt
  7497 0000339C FF76FA                   push word [bp-6]
  7498 0000339F E89DFE                   call prjump
  7499 000033A2 83C402                   add  sp, 2
  7500 000033A5 FF76F8                   push word [bp-8]
  7501 000033A8 E865FE                   call prlabel
  7502 000033AB 83C402                   add  sp, 2
  7503                                  
  7504                                  ;-878   }
  7505                                  
  7506                                  
  7507                                  ;-879   else if(istoken(T_GOTO))  {
  7508                                  
  7509 000033AE E9B301                   jmp .stmt411
  7510                                  .stmt410:
  7511 000033B1 680902                   push 521
  7512 000033B4 E8DBDB                   call istoken
  7513 000033B7 83C402                   add  sp, 2
  7514 000033BA 08C0                     or  al, al
  7515 000033BC 0F842200                 je .stmt412
  7516                                  
  7517                                  ;-880       prs("\n jmp .");name1();prs(symbol);expect(';');
  7518                                  
  7519 000033C0 68[6635]                 push stmt_0
  7520 000033C3 E819D0                   call prs
  7521 000033C6 83C402                   add  sp, 2
  7522 000033C9 E8A8DD                   call name1
  7523 000033CC 8D06A36D                 lea  ax, [symbol]
  7524 000033D0 50                       push ax
  7525 000033D1 E80BD0                   call prs
  7526 000033D4 83C402                   add  sp, 2
  7527 000033D7 6A3B                     push 59
  7528 000033D9 E8D8DB                   call expect
  7529 000033DC 83C402                   add  sp, 2
  7530                                  
  7531                                  ;-881   }
  7532                                  
  7533                                  
  7534                                  ;-882   else if(token==T_ASM)     {
  7535                                  
  7536 000033DF E98201                   jmp .stmt413
  7537                                  .stmt412:
  7538 000033E2 A1[1E00]                 mov ax, [token]
  7539 000033E5 3D0602                   cmp ax, 518
  7540 000033E8 0F853300                 jne .stmt414
  7541                                  
  7542                                  ;-883       prs("\n"); c=next();
  7543                                  
  7544 000033EC 68[6F35]                 push stmt_1
  7545 000033EF E8EDCF                   call prs
  7546 000033F2 83C402                   add  sp, 2
  7547 000033F5 E8DFD3                   call next
  7548 000033F8 8946FE                   mov [bp-2], ax
  7549                                  
  7550                                  ;-884       while(c != '\n') { prc(c);	c=next(); };
  7551                                  
  7552                                  .stmt415:
  7553 000033FB 8B46FE                   mov ax, [bp-2]
  7554 000033FE 83F80A                   cmp ax, 10
  7555 00003401 0F841100                 je  .stmt416
  7556 00003405 FF76FE                   push word [bp-2]
  7557 00003408 E87BCF                   call prc
  7558 0000340B 83C402                   add  sp, 2
  7559 0000340E E8C6D3                   call next
  7560 00003411 8946FE                   mov [bp-2], ax
  7561 00003414 EBE5                     jmp .stmt415
  7562                                  .stmt416:
  7563                                  
  7564                                  ;-885       token=getlex();
  7565                                  
  7566 00003416 E8FAD5                   call getlex
  7567 00003419 A3[1E00]                 mov word [token], ax
  7568                                  
  7569                                  ;-886   }
  7570                                  
  7571                                  
  7572                                  ;-887   else if(istoken(T_ASMBLOCK)) {
  7573                                  
  7574 0000341C E94501                   jmp .stmt417
  7575                                  .stmt414:
  7576 0000341F 680702                   push 519
  7577 00003422 E86DDB                   call istoken
  7578 00003425 83C402                   add  sp, 2
  7579 00003428 08C0                     or  al, al
  7580 0000342A 0F844B00                 je .stmt418
  7581                                  
  7582                                  ;-888       if (token== '{' )  {
  7583                                  
  7584 0000342E A1[1E00]                 mov ax, [token]
  7585 00003431 83F87B                   cmp ax, 123
  7586 00003434 0F853500                 jne .stmt419
  7587                                  
  7588                                  ;-889           prs("\n"); cha=next();
  7589                                  
  7590 00003438 68[7235]                 push stmt_2
  7591 0000343B E8A1CF                   call prs
  7592 0000343E 83C402                   add  sp, 2
  7593 00003441 E893D3                   call next
  7594 00003444 8846FC                   mov [bp-4], al
  7595                                  
  7596                                  ;-890           while(cha!= '}') {
  7597                                  
  7598                                  .stmt420:
  7599 00003447 8A46FC                   mov al, [bp-4]
  7600 0000344A 3C7D                     cmp al, 125
  7601 0000344C 0F841400                 je  .stmt421
  7602                                  
  7603                                  ;-891               prc(cha);
  7604                                  
  7605 00003450 8A46FC                   mov al, byte [bp-4]
  7606 00003453 B400                     mov ah, 0
  7607 00003455 50                       push ax
  7608 00003456 E82DCF                   call prc
  7609 00003459 83C402                   add  sp, 2
  7610                                  
  7611                                  ;-892               cha=next();
  7612                                  
  7613 0000345C E878D3                   call next
  7614 0000345F 8846FC                   mov [bp-4], al
  7615                                  
  7616                                  ;-893           }
  7617                                  
  7618                                  
  7619                                  ;-894           token=getlex();
  7620                                  
  7621 00003462 EBE3                     jmp .stmt420
  7622                                  .stmt421:
  7623 00003464 E8ACD5                   call getlex
  7624 00003467 A3[1E00]                 mov word [token], ax
  7625                                  
  7626                                  ;-895       } else error1("Curly open expected");
  7627                                  
  7628 0000346A E90900                   jmp .stmt422
  7629                                  .stmt419:
  7630 0000346D 68[7535]                 push stmt_3
  7631 00003470 E88DD1                   call error1
  7632 00003473 83C402                   add  sp, 2
  7633                                  
  7634                                  ;-896         }
  7635                                  
  7636                                  .stmt422:
  7637                                  
  7638                                  ;-897   else if(istoken(T_EMIT)) {
  7639                                  
  7640 00003476 E9EB00                   jmp .stmt423
  7641                                  .stmt418:
  7642 00003479 680802                   push 520
  7643 0000347C E813DB                   call istoken
  7644 0000347F 83C402                   add  sp, 2
  7645 00003482 08C0                     or  al, al
  7646 00003484 0F843E00                 je .stmt424
  7647                                  
  7648                                  ;-898       prs("\n db ");
  7649                                  
  7650 00003488 68[8935]                 push stmt_4
  7651 0000348B E851CF                   call prs
  7652 0000348E 83C402                   add  sp, 2
  7653                                  
  7654                                  ;-899     L1: token=getlex();
  7655                                  
  7656                                  .L1:
  7657 00003491 E87FD5                   call getlex
  7658 00003494 A3[1E00]                 mov word [token], ax
  7659                                  
  7660                                  ;-900       prunsign1(lexval);
  7661                                  
  7662 00003497 FF36[2B00]               push word [lexval]
  7663 0000349B E8A4D0                   call prunsign1
  7664 0000349E 83C402                   add  sp, 2
  7665                                  
  7666                                  ;-901       token=getlex();
  7667                                  
  7668 000034A1 E86FD5                   call getlex
  7669 000034A4 A3[1E00]                 mov word [token], ax
  7670                                  
  7671                                  ;-902       if (token== ',') {
  7672                                  
  7673 000034A7 A1[1E00]                 mov ax, [token]
  7674 000034AA 83F82C                   cmp ax, 44
  7675 000034AD 0F850A00                 jne .stmt425
  7676                                  
  7677                                  ;-903           prc(',');
  7678                                  
  7679 000034B1 6A2C                     push 44
  7680 000034B3 E8D0CE                   call prc
  7681 000034B6 83C402                   add  sp, 2
  7682                                  
  7683                                  ;-904           goto L1;
  7684                                  
  7685 000034B9 EBD6                     jmp .L1
  7686                                  
  7687                                  ;-905       }
  7688                                  
  7689                                  
  7690                                  ;-906       expect(')');
  7691                                  
  7692                                  .stmt425:
  7693 000034BB 6A29                     push 41
  7694 000034BD E8F4DA                   call expect
  7695 000034C0 83C402                   add  sp, 2
  7696                                  
  7697                                  ;-907   }
  7698                                  
  7699                                  
  7700                                  ;-908   else if(istoken(';'))      { }
  7701                                  
  7702 000034C3 E99E00                   jmp .stmt426
  7703                                  .stmt424:
  7704 000034C6 6A3B                     push 59
  7705 000034C8 E8C7DA                   call istoken
  7706 000034CB 83C402                   add  sp, 2
  7707 000034CE 08C0                     or  al, al
  7708 000034D0 0F840300                 je .stmt427
  7709                                  
  7710                                  ;-909   else if(istoken(T_RETURN)) {
  7711                                  
  7712 000034D4 E98D00                   jmp .stmt428
  7713                                  .stmt427:
  7714 000034D7 680002                   push 512
  7715 000034DA E8B5DA                   call istoken
  7716 000034DD 83C402                   add  sp, 2
  7717 000034E0 08C0                     or  al, al
  7718 000034E2 0F843500                 je .stmt429
  7719                                  
  7720                                  ;-910         if (token!=';') expr(0);
  7721                                  
  7722 000034E6 A1[1E00]                 mov ax, [token]
  7723 000034E9 83F83B                   cmp ax, 59
  7724 000034EC 0F840800                 je  .stmt430
  7725 000034F0 6A00                     push 0
  7726 000034F2 E825F8                   call expr
  7727 000034F5 83C402                   add  sp, 2
  7728                                  
  7729                                  ;-911         prs("\n jmp .retn");
  7730                                  
  7731                                  .stmt430:
  7732 000034F8 68[9035]                 push stmt_5
  7733 000034FB E8E1CE                   call prs
  7734 000034FE 83C402                   add  sp, 2
  7735                                  
  7736                                  ;-912         prs(fname);
  7737                                  
  7738 00003501 8D06236E                 lea  ax, [fname]
  7739 00003505 50                       push ax
  7740 00003506 E8D6CE                   call prs
  7741 00003509 83C402                   add  sp, 2
  7742                                  
  7743                                  ;-913         nreturn++;
  7744                                  
  7745 0000350C FF06[2700]               inc  word[nreturn]
  7746                                  
  7747                                  ;-914         expect(';');
  7748                                  
  7749 00003510 6A3B                     push 59
  7750 00003512 E89FDA                   call expect
  7751 00003515 83C402                   add  sp, 2
  7752                                  
  7753                                  ;-915         }
  7754                                  
  7755                                  
  7756                                  ;-916   else if(thechar==':')      {
  7757                                  
  7758 00003518 E94900                   jmp .stmt431
  7759                                  .stmt429:
  7760 0000351B A0[2200]                 mov al, [thechar]
  7761 0000351E 3C3A                     cmp al, 58
  7762 00003520 0F853000                 jne .stmt432
  7763                                  
  7764                                  ;-917         prs("\n."); // Label
  7765                                  
  7766 00003524 68[9D35]                 push stmt_6
  7767 00003527 E8B5CE                   call prs
  7768 0000352A 83C402                   add  sp, 2
  7769                                  
  7770                                  ;-918         prs(symbol); prc(':');
  7771                                  
  7772 0000352D 8D06A36D                 lea  ax, [symbol]
  7773 00003531 50                       push ax
  7774 00003532 E8AACE                   call prs
  7775 00003535 83C402                   add  sp, 2
  7776 00003538 6A3A                     push 58
  7777 0000353A E849CE                   call prc
  7778 0000353D 83C402                   add  sp, 2
  7779                                  
  7780                                  ;-919         expect(T_NAME);
  7781                                  
  7782 00003540 680001                   push 256
  7783 00003543 E86EDA                   call expect
  7784 00003546 83C402                   add  sp, 2
  7785                                  
  7786                                  ;-920         expect(':');
  7787                                  
  7788 00003549 6A3A                     push 58
  7789 0000354B E866DA                   call expect
  7790 0000354E 83C402                   add  sp, 2
  7791                                  
  7792                                  ;-921         }
  7793                                  
  7794                                  
  7795                                  ;-922   else  {expr(0);; expect(';'); }
  7796                                  
  7797 00003551 E91000                   jmp .stmt433
  7798                                  .stmt432:
  7799 00003554 6A00                     push 0
  7800 00003556 E8C1F7                   call expr
  7801 00003559 83C402                   add  sp, 2
  7802 0000355C 6A3B                     push 59
  7803 0000355E E853DA                   call expect
  7804 00003561 83C402                   add  sp, 2
  7805                                  
  7806                                  ;-923 }
  7807                                  
  7808                                  .stmt433:
  7809                                  .stmt431:
  7810                                  .stmt428:
  7811                                  .stmt426:
  7812                                  .stmt423:
  7813                                  .stmt417:
  7814                                  .stmt413:
  7815                                  .stmt411:
  7816                                  .stmt409:
  7817                                  .stmt407:
  7818                                  .stmt403:
  7819                                  
  7820                                  ;-924 
  7821                                  
  7822                                  
  7823                                  ;-925 
  7824                                  
  7825                                  
  7826                                  ;-926 int dofunc() { int nloc; int i; int narg;
  7827 00003564 C9                       LEAVE
  7828 00003565 C3                       ret
  7829 00003566 5C6E206A6D70202E00      stmt_0 db "\n jmp .",0
  7830 0000356F 5C6E00                  stmt_1 db "\n",0
  7831 00003572 5C6E00                  stmt_2 db "\n",0
  7832 00003575 4375726C79206F7065-     stmt_3 db "Curly open expected",0
  7833 0000357E 6E2065787065637465-
  7834 00003587 6400               
  7835 00003589 5C6E2064622000          stmt_4 db "\n db ",0
  7836 00003590 5C6E206A6D70202E72-     stmt_5 db "\n jmp .retn",0
  7837 00003599 65746E00           
  7838 0000359D 5C6E2E00                stmt_6 db "\n.",0
  7839                                  ENDP
  7840                                  
  7841                                  dofunc: PROC
  7842                                  
  7843                                  ;-927   cloc=&co;
  7844                                  ;
  7845 000035A1 C8060000                 ENTER  6,0
  7846 000035A5 B8A861                   mov ax, co
  7847 000035A8 A3[1800]                 mov word [cloc], ax
  7848                                  
  7849                                  ;-928   checknamelen();
  7850                                  
  7851 000035AB E8A1DA                   call checknamelen
  7852                                  
  7853                                  ;-929   strcpy(fname, symbol);
  7854                                  
  7855 000035AE 8D06A36D                 lea  ax, [symbol]
  7856 000035B2 50                       push ax
  7857 000035B3 8D06236E                 lea  ax, [fname]
  7858 000035B7 50                       push ax
  7859 000035B8 E86ECC                   call strcpy
  7860 000035BB 83C404                   add  sp, 4
  7861                                  
  7862                                  ;-930   if (checkFunction() ) error1("Function already defined");
  7863                                  
  7864 000035BE E899DE                   call checkFunction
  7865 000035C1 08C0                     or  al, al
  7866 000035C3 0F840900                 je .dofunc434
  7867 000035C7 68[E837]                 push dofunc_0
  7868 000035CA E833D0                   call error1
  7869 000035CD 83C402                   add  sp, 2
  7870                                  
  7871                                  ;-931   storefunc();
  7872                                  
  7873                                  .dofunc434:
  7874 000035D0 E859DD                   call storefunc
  7875                                  
  7876                                  ;-932   prs("\n\n"); prs(symbol); prs(": PROC");
  7877                                  
  7878 000035D3 68[0138]                 push dofunc_1
  7879 000035D6 E806CE                   call prs
  7880 000035D9 83C402                   add  sp, 2
  7881 000035DC 8D06A36D                 lea  ax, [symbol]
  7882 000035E0 50                       push ax
  7883 000035E1 E8FBCD                   call prs
  7884 000035E4 83C402                   add  sp, 2
  7885 000035E7 68[0638]                 push dofunc_2
  7886 000035EA E8F2CD                   call prs
  7887 000035ED 83C402                   add  sp, 2
  7888                                  
  7889                                  ;-933   expect('('); LTop=LSTART;  i=0;
  7890                                  
  7891 000035F0 6A28                     push 40
  7892 000035F2 E8BFD9                   call expect
  7893 000035F5 83C402                   add  sp, 2
  7894 000035F8 B8C800                   mov ax, 200
  7895 000035FB A3[3A00]                 mov word [LTop], ax
  7896 000035FE B80000                   mov ax, 0
  7897 00003601 8946FC                   mov [bp-4], ax
  7898                                  
  7899                                  ;-934   if (istoken(')')==0) { narg=2;
  7900                                  
  7901 00003604 6A29                     push 41
  7902 00003606 E889D9                   call istoken
  7903 00003609 83C402                   add  sp, 2
  7904 0000360C 83F800                   cmp ax, 0
  7905 0000360F 0F854600                 jne .dofunc435
  7906 00003613 B80200                   mov ax, 2
  7907 00003616 8946FA                   mov [bp-6], ax
  7908                                  
  7909                                  ;-935     do { typeName();  addlocal(); narg+=2;
  7910                                  
  7911                                  .dofunc436:
  7912 00003619 E880DB                   call typeName
  7913 0000361C E882DD                   call addlocal
  7914 0000361F 8346FA02                 add  word[bp-6], 2
  7915                                  
  7916                                  ;-936          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }
  7917                                  
  7918 00003623 8B46FA                   mov ax, [bp-6]
  7919 00003626 8B1E[3A00]               mov bx, [LTop]
  7920 0000362A D1E3                     shl bx, 1
  7921 0000362C 89872077                 mov [GData+bx], ax
  7922 00003630 A0[3500]                 mov al, [iswidth]
  7923 00003633 3C04                     cmp al, 4
  7924 00003635 0F850400                 jne .dofunc437
  7925 00003639 8346FA02                 add  word[bp-6], 2
  7926                                  .dofunc437:
  7927 0000363D FF06[3A00]               inc  word[LTop]
  7928                                  
  7929                                  ;-937     while (istoken(','));  expect(')'); }
  7930                                  
  7931 00003641 6A2C                     push 44
  7932 00003643 E84CD9                   call istoken
  7933 00003646 83C402                   add  sp, 2
  7934 00003649 08C0                     or  al, al
  7935 0000364B 0F840200                 je .dofunc438
  7936 0000364F EBC8                     jmp .dofunc436
  7937                                  .dofunc438:
  7938 00003651 6A29                     push 41
  7939 00003653 E85ED9                   call expect
  7940 00003656 83C402                   add  sp, 2
  7941                                  
  7942                                  ;-938 
  7943                                  
  7944                                  
  7945                                  ;-939   expect('{'); /*body*/
  7946                                  
  7947                                  .dofunc435:
  7948 00003659 6A7B                     push 123
  7949 0000365B E856D9                   call expect
  7950 0000365E 83C402                   add  sp, 2
  7951                                  
  7952                                  ;-940   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */
  7953                                  
  7954 00003661 B80000                   mov ax, 0
  7955 00003664 8946FE                   mov [bp-2], ax
  7956 00003667 B80000                   mov ax, 0
  7957 0000366A A3[2700]                 mov word [nreturn], ax
  7958 0000366D B80000                   mov ax, 0
  7959 00003670 A3[2500]                 mov word [nconst], ax
  7960 00003673 B80000                   mov ax, 0
  7961 00003676 8946FC                   mov [bp-4], ax
  7962                                  
  7963                                  ;-941   while(isvariable()) {
  7964                                  
  7965                                  .dofunc439:
  7966 00003679 E82BDE                   call isvariable
  7967 0000367C 08C0                     or  al, al
  7968 0000367E 0F849200                 je .dofunc440
  7969                                  
  7970                                  ;-942     do {typeName();
  7971                                  
  7972                                  .dofunc441:
  7973 00003682 E817DB                   call typeName
  7974                                  
  7975                                  ;-943         checknamelen();
  7976                                  
  7977 00003685 E8C7D9                   call checknamelen
  7978                                  
  7979                                  ;-944         addlocal(); nloc-=2;
  7980                                  
  7981 00003688 E816DD                   call addlocal
  7982 0000368B 836EFE02                 sub  word[bp-2], 2
  7983                                  
  7984                                  ;-945         if (iswidth == 4) nloc-=2;
  7985                                  
  7986 0000368F A0[3500]                 mov al, [iswidth]
  7987 00003692 3C04                     cmp al, 4
  7988 00003694 0F850400                 jne .dofunc442
  7989 00003698 836EFE02                 sub  word[bp-2], 2
  7990                                  
  7991                                  ;-946         GData[LTop]=nloc;
  7992                                  
  7993                                  .dofunc442:
  7994 0000369C 8B46FE                   mov ax, [bp-2]
  7995 0000369F 8B1E[3A00]               mov bx, [LTop]
  7996 000036A3 D1E3                     shl bx, 1
  7997 000036A5 89872077                 mov [GData+bx], ax
  7998                                  
  7999                                  ;-947         if (istoken('[')){
  8000                                  
  8001 000036A9 6A5B                     push 91
  8002 000036AB E8E4D8                   call istoken
  8003 000036AE 83C402                   add  sp, 2
  8004 000036B1 08C0                     or  al, al
  8005 000036B3 0F843D00                 je .dofunc443
  8006                                  
  8007                                  ;-948             istype='&';GType[LTop]='&';expect(T_CONST);expect(']');
  8008                                  
  8009 000036B7 B82600                   mov ax, 38
  8010 000036BA A2[2F00]                 mov byte [istype], al
  8011 000036BD B82600                   mov ax, 38
  8012 000036C0 8B1E[3A00]               mov bx, [LTop]
  8013 000036C4 8887EC6E                 mov [GType+bx], al
  8014 000036C8 680101                   push 257
  8015 000036CB E8E6D8                   call expect
  8016 000036CE 83C402                   add  sp, 2
  8017 000036D1 6A5D                     push 93
  8018 000036D3 E8DED8                   call expect
  8019 000036D6 83C402                   add  sp, 2
  8020                                  
  8021                                  ;-949             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc;
  8022                                  
  8023 000036D9 8B46FE                   mov ax, [bp-2]
  8024 000036DC 2B06[2B00]               sub ax, [lexval]
  8025 000036E0 8946FE                   mov [bp-2], ax
  8026 000036E3 8346FE02                 add  word[bp-2], 2
  8027 000036E7 8B46FE                   mov ax, [bp-2]
  8028 000036EA 8B1E[3A00]               mov bx, [LTop]
  8029 000036EE D1E3                     shl bx, 1
  8030 000036F0 89872077                 mov [GData+bx], ax
  8031                                  
  8032                                  ;-950             }
  8033                                  
  8034                                  
  8035                                  ;-951         LTop++;
  8036                                  
  8037                                  .dofunc443:
  8038 000036F4 FF06[3A00]               inc  word[LTop]
  8039                                  
  8040                                  ;-952       } while (istoken(',')); expect(';'); }
  8041                                  
  8042 000036F8 6A2C                     push 44
  8043 000036FA E895D8                   call istoken
  8044 000036FD 83C402                   add  sp, 2
  8045 00003700 08C0                     or  al, al
  8046 00003702 0F840300                 je .dofunc444
  8047 00003706 E979FF                   jmp .dofunc441
  8048                                  .dofunc444:
  8049 00003709 6A3B                     push 59
  8050 0000370B E8A6D8                   call expect
  8051 0000370E 83C402                   add  sp, 2
  8052                                  
  8053                                  ;-953   if (LTop>LSTART){prs(";\n ENTER  ");
  8054                                  
  8055 00003711 E965FF                   jmp .dofunc439
  8056                                  .dofunc440:
  8057 00003714 A1[3A00]                 mov ax, [LTop]
  8058 00003717 3DC800                   cmp ax, 200
  8059 0000371A 0F8E2700                 jle .dofunc445
  8060 0000371E 68[0D38]                 push dofunc_3
  8061 00003721 E8BBCC                   call prs
  8062 00003724 83C402                   add  sp, 2
  8063                                  
  8064                                  ;-954     nloc=mkneg(nloc); prunsign1 (nloc); prs(",0"); }
  8065                                  
  8066 00003727 FF76FE                   push word [bp-2]
  8067 0000372A E874C9                   call mkneg
  8068 0000372D 83C402                   add  sp, 2
  8069 00003730 8946FE                   mov [bp-2], ax
  8070 00003733 FF76FE                   push word [bp-2]
  8071 00003736 E809CE                   call prunsign1
  8072 00003739 83C402                   add  sp, 2
  8073 0000373C 68[1938]                 push dofunc_4
  8074 0000373F E89DCC                   call prs
  8075 00003742 83C402                   add  sp, 2
  8076                                  
  8077                                  ;-955   while(istoken('}')==0)   stmt();
  8078                                  
  8079                                  .dofunc445:
  8080                                  .dofunc446:
  8081 00003745 6A7D                     push 125
  8082 00003747 E848D8                   call istoken
  8083 0000374A 83C402                   add  sp, 2
  8084 0000374D 83F800                   cmp ax, 0
  8085 00003750 0F850500                 jne .dofunc447
  8086 00003754 E814FB                   call stmt
  8087                                  
  8088                                  ;-956   if (nreturn) {
  8089                                  
  8090 00003757 EBEC                     jmp .dofunc446
  8091                                  .dofunc447:
  8092 00003759 A1[2700]                 mov ax, [nreturn]
  8093 0000375C 08C0                     or  al, al
  8094 0000375E 0F841C00                 je .dofunc448
  8095                                  
  8096                                  ;-957         prs("\n .retn");
  8097                                  
  8098 00003762 68[1C38]                 push dofunc_5
  8099 00003765 E877CC                   call prs
  8100 00003768 83C402                   add  sp, 2
  8101                                  
  8102                                  ;-958         prs(fname);
  8103                                  
  8104 0000376B 8D06236E                 lea  ax, [fname]
  8105 0000376F 50                       push ax
  8106 00003770 E86CCC                   call prs
  8107 00003773 83C402                   add  sp, 2
  8108                                  
  8109                                  ;-959         prc(':');
  8110                                  
  8111 00003776 6A3A                     push 58
  8112 00003778 E80BCC                   call prc
  8113 0000377B 83C402                   add  sp, 2
  8114                                  
  8115                                  ;-960         }
  8116                                  
  8117                                  
  8118                                  ;-961   if (LTop > LSTART) prs(" LEAVE");
  8119                                  
  8120                                  .dofunc448:
  8121 0000377E A1[3A00]                 mov ax, [LTop]
  8122 00003781 3DC800                   cmp ax, 200
  8123 00003784 0F8E0900                 jle .dofunc449
  8124 00003788 68[2538]                 push dofunc_6
  8125 0000378B E851CC                   call prs
  8126 0000378E 83C402                   add  sp, 2
  8127                                  
  8128                                  ;-962   prs("\n ret");
  8129                                  
  8130                                  .dofunc449:
  8131 00003791 68[2C38]                 push dofunc_7
  8132 00003794 E848CC                   call prs
  8133 00003797 83C402                   add  sp, 2
  8134                                  
  8135                                  ;-963   *cloc=0; prs(co);
  8136                                  
  8137 0000379A B80000                   mov ax, 0
  8138 0000379D 8B1E[1800]               mov  bx, [cloc]
  8139 000037A1 8807                     mov  [bx], al
  8140 000037A3 8D06A861                 lea  ax, [co]
  8141 000037A7 50                       push ax
  8142 000037A8 E834CC                   call prs
  8143 000037AB 83C402                   add  sp, 2
  8144                                  
  8145                                  ;-964   maxco1=strlen(co);
  8146                                  
  8147 000037AE 8D06A861                 lea  ax, [co]
  8148 000037B2 50                       push ax
  8149 000037B3 E84BCA                   call strlen
  8150 000037B6 83C402                   add  sp, 2
  8151 000037B9 A3[1600]                 mov word [maxco1], ax
  8152                                  
  8153                                  ;-965   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }
  8154                                  
  8155 000037BC A1[1600]                 mov ax, [maxco1]
  8156 000037BF 3B06[1400]               cmp ax, [maxco]
  8157 000037C3 0F8E1600                 jle .dofunc450
  8158 000037C7 A1[1600]                 mov ax, [maxco1]
  8159 000037CA A3[1400]                 mov word [maxco], ax
  8160 000037CD 8D06236E                 lea  ax, [fname]
  8161 000037D1 50                       push ax
  8162 000037D2 8D06606D                 lea  ax, [coname]
  8163 000037D6 50                       push ax
  8164 000037D7 E84FCA                   call strcpy
  8165 000037DA 83C404                   add  sp, 4
  8166                                  
  8167                                  ;-966   prs("\nENDP");
  8168                                  
  8169                                  .dofunc450:
  8170 000037DD 68[3338]                 push dofunc_8
  8171 000037E0 E8FCCB                   call prs
  8172 000037E3 83C402                   add  sp, 2
  8173                                  
  8174                                  ;-967 }
  8175                                  
  8176                                  
  8177                                  ;-968 
  8178                                  
  8179                                  
  8180                                  ;-969 char doglobName[IDLENMAX];
  8181 000037E6 C9                       LEAVE
  8182 000037E7 C3                       ret
  8183 000037E8 46756E6374696F6E20-     dofunc_0 db "Function already defined",0
  8184 000037F1 616C72656164792064-
  8185 000037FA 6566696E656400     
  8186 00003801 5C6E5C6E00              dofunc_1 db "\n\n",0
  8187 00003806 3A2050524F4300          dofunc_2 db ": PROC",0
  8188 0000380D 3B5C6E20454E544552-     dofunc_3 db ";\n ENTER  ",0
  8189 00003816 202000             
  8190 00003819 2C3000                  dofunc_4 db ",0",0
  8191 0000381C 5C6E202E7265746E00      dofunc_5 db "\n .retn",0
  8192 00003825 204C4541564500          dofunc_6 db " LEAVE",0
  8193 0000382C 5C6E2072657400          dofunc_7 db "\n ret",0
  8194 00003833 5C6E454E445000          dofunc_8 db "\nENDP",0
  8195                                  ENDP
  8196                                  section .bss
  8197                                  absolute 42466
  8198 0000A5E2 <res 0000000F>          doglobName resb 15
  8199                                  section .text
  8200                                  
  8201                                  ;-970 int doglob() {
  8202                                  
  8203                                  
  8204                                  doglob: PROC
  8205                                  
  8206                                  ;-971     int i; int j; int isstrarr; isstrarr=0;
  8207                                  ;
  8208 0000383A C8060000                 ENTER  6,0
  8209 0000383E B80000                   mov ax, 0
  8210 00003841 8946FA                   mov [bp-6], ax
  8211                                  
  8212                                  ;-972   if (GTop >= LSTART) error1("Global table full");
  8213                                  
  8214 00003844 A1[3800]                 mov ax, [GTop]
  8215 00003847 3DC800                   cmp ax, 200 ;unsigned : 1
  8216 0000384A 0F8C0900                 jl  .doglob451
  8217 0000384E 68[943B]                 push doglob_0
  8218 00003851 E8ACCD                   call error1
  8219 00003854 83C402                   add  sp, 2
  8220                                  
  8221                                  ;-973   if (iswidth == 0) error1("no VOID as var type");
  8222                                  
  8223                                  .doglob451:
  8224 00003857 A0[3500]                 mov al, [iswidth]
  8225 0000385A 3C00                     cmp al, 0
  8226 0000385C 0F850900                 jne .doglob452
  8227 00003860 68[A63B]                 push doglob_1
  8228 00003863 E89ACD                   call error1
  8229 00003866 83C402                   add  sp, 2
  8230                                  
  8231                                  ;-974   checknamelen();
  8232                                  
  8233                                  .doglob452:
  8234 00003869 E8E3D7                   call checknamelen
  8235                                  
  8236                                  ;-975   if (checkName() != 0) error1("Variable already defined");
  8237                                  
  8238 0000386C E82CD8                   call checkName
  8239 0000386F 3C00                     cmp al, 0
  8240 00003871 0F840900                 je  .doglob453
  8241 00003875 68[BA3B]                 push doglob_2
  8242 00003878 E885CD                   call error1
  8243 0000387B 83C402                   add  sp, 2
  8244                                  
  8245                                  ;-976   if (istoken('[')) { istype='&';
  8246                                  
  8247                                  .doglob453:
  8248 0000387E 6A5B                     push 91
  8249 00003880 E80FD7                   call istoken
  8250 00003883 83C402                   add  sp, 2
  8251 00003886 08C0                     or  al, al
  8252 00003888 0F84E201                 je .doglob454
  8253 0000388C B82600                   mov ax, 38
  8254 0000388F A2[2F00]                 mov byte [istype], al
  8255                                  
  8256                                  ;-977     if (istoken(T_CONST)) {
  8257                                  
  8258 00003892 680101                   push 257
  8259 00003895 E8FAD6                   call istoken
  8260 00003898 83C402                   add  sp, 2
  8261 0000389B 08C0                     or  al, al
  8262 0000389D 0F84C200                 je .doglob455
  8263                                  
  8264                                  ;-978       prs("\nsection .bss\nabsolute ");
  8265                                  
  8266 000038A1 68[D33B]                 push doglob_3
  8267 000038A4 E838CB                   call prs
  8268 000038A7 83C402                   add  sp, 2
  8269                                  
  8270                                  ;-979       prunsign1(orgData);
  8271                                  
  8272 000038AA FF36[1200]               push word [orgData]
  8273 000038AE E891CC                   call prunsign1
  8274 000038B1 83C402                   add  sp, 2
  8275                                  
  8276                                  ;-980       prs("\n"); prs(symbol);
  8277                                  
  8278 000038B4 68[ED3B]                 push doglob_4
  8279 000038B7 E825CB                   call prs
  8280 000038BA 83C402                   add  sp, 2
  8281 000038BD 8D06A36D                 lea  ax, [symbol]
  8282 000038C1 50                       push ax
  8283 000038C2 E81ACB                   call prs
  8284 000038C5 83C402                   add  sp, 2
  8285                                  
  8286                                  ;-981       if (iswidth==1) prs(" resb ");
  8287                                  
  8288 000038C8 A0[3500]                 mov al, [iswidth]
  8289 000038CB 3C01                     cmp al, 1
  8290 000038CD 0F850900                 jne .doglob456
  8291 000038D1 68[F03B]                 push doglob_5
  8292 000038D4 E808CB                   call prs
  8293 000038D7 83C402                   add  sp, 2
  8294                                  
  8295                                  ;-982       if (iswidth==2) prs(" resw ");
  8296                                  
  8297                                  .doglob456:
  8298 000038DA A0[3500]                 mov al, [iswidth]
  8299 000038DD 3C02                     cmp al, 2
  8300 000038DF 0F850900                 jne .doglob457
  8301 000038E3 68[F73B]                 push doglob_6
  8302 000038E6 E8F6CA                   call prs
  8303 000038E9 83C402                   add  sp, 2
  8304                                  
  8305                                  ;-983       if (iswidth==4) prs(" resd ");
  8306                                  
  8307                                  .doglob457:
  8308 000038EC A0[3500]                 mov al, [iswidth]
  8309 000038EF 3C04                     cmp al, 4
  8310 000038F1 0F850900                 jne .doglob458
  8311 000038F5 68[FE3B]                 push doglob_7
  8312 000038F8 E8E4CA                   call prs
  8313 000038FB 83C402                   add  sp, 2
  8314                                  
  8315                                  ;-984       prunsign1(lexval);
  8316                                  
  8317                                  .doglob458:
  8318 000038FE FF36[2B00]               push word [lexval]
  8319 00003902 E83DCC                   call prunsign1
  8320 00003905 83C402                   add  sp, 2
  8321                                  
  8322                                  ;-985       prs("\nsection .text");
  8323                                  
  8324 00003908 68[053C]                 push doglob_8
  8325 0000390B E8D1CA                   call prs
  8326 0000390E 83C402                   add  sp, 2
  8327                                  
  8328                                  ;-986       orgData=orgData+lexval;
  8329                                  
  8330 00003911 A1[1200]                 mov ax, [orgData]
  8331 00003914 0306[2B00]               add ax, [lexval]
  8332 00003918 A3[1200]                 mov word [orgData], ax
  8333                                  
  8334                                  ;-987       if (iswidth==2) orgData=orgData+lexval;
  8335                                  
  8336 0000391B A0[3500]                 mov al, [iswidth]
  8337 0000391E 3C02                     cmp al, 2
  8338 00003920 0F850A00                 jne .doglob459
  8339 00003924 A1[1200]                 mov ax, [orgData]
  8340 00003927 0306[2B00]               add ax, [lexval]
  8341 0000392B A3[1200]                 mov word [orgData], ax
  8342                                  
  8343                                  ;-988       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}
  8344                                  
  8345                                  .doglob459:
  8346 0000392E A0[3500]                 mov al, [iswidth]
  8347 00003931 3C04                     cmp al, 4
  8348 00003933 0F851400                 jne .doglob460
  8349 00003937 A1[2B00]                 mov ax, [lexval]
  8350 0000393A BB0300                   mov bx, 3
  8351 0000393D F7E3                     mul bx
  8352 0000393F 8946FE                   mov [bp-2], ax
  8353 00003942 A1[1200]                 mov ax, [orgData]
  8354 00003945 0346FE                   add ax, [bp-2]
  8355 00003948 A3[1200]                 mov word [orgData], ax
  8356                                  
  8357                                  ;-989       GData[GTop]=lexval; expect(']');
  8358                                  
  8359                                  .doglob460:
  8360 0000394B A1[2B00]                 mov ax, [lexval]
  8361 0000394E 8B1E[3800]               mov bx, [GTop]
  8362 00003952 D1E3                     shl bx, 1
  8363 00003954 89872077                 mov [GData+bx], ax
  8364 00003958 6A5D                     push 93
  8365 0000395A E857D6                   call expect
  8366 0000395D 83C402                   add  sp, 2
  8367                                  
  8368                                  ;-990     }else { expect(']');
  8369                                  
  8370 00003960 E90801                   jmp .doglob461
  8371                                  .doglob455:
  8372 00003963 6A5D                     push 93
  8373 00003965 E84CD6                   call expect
  8374 00003968 83C402                   add  sp, 2
  8375                                  
  8376                                  ;-991       if (iswidth != 1) error1("Only ByteArray allowed");
  8377                                  
  8378 0000396B A0[3500]                 mov al, [iswidth]
  8379 0000396E 3C01                     cmp al, 1
  8380 00003970 0F840900                 je  .doglob462
  8381 00003974 68[153C]                 push doglob_9
  8382 00003977 E886CC                   call error1
  8383 0000397A 83C402                   add  sp, 2
  8384                                  
  8385                                  ;-992       prs("\n"); prs(symbol); prs(" db ");
  8386                                  
  8387                                  .doglob462:
  8388 0000397D 68[2C3C]                 push doglob_10
  8389 00003980 E85CCA                   call prs
  8390 00003983 83C402                   add  sp, 2
  8391 00003986 8D06A36D                 lea  ax, [symbol]
  8392 0000398A 50                       push ax
  8393 0000398B E851CA                   call prs
  8394 0000398E 83C402                   add  sp, 2
  8395 00003991 68[2F3C]                 push doglob_11
  8396 00003994 E848CA                   call prs
  8397 00003997 83C402                   add  sp, 2
  8398                                  
  8399                                  ;-993       isstrarr=1; strcpy(doglobName, symbol);
  8400                                  
  8401 0000399A B80100                   mov ax, 1
  8402 0000399D 8946FA                   mov [bp-6], ax
  8403 000039A0 8D06A36D                 lea  ax, [symbol]
  8404 000039A4 50                       push ax
  8405 000039A5 8D06E2A5                 lea  ax, [doglobName]
  8406 000039A9 50                       push ax
  8407 000039AA E87CC8                   call strcpy
  8408 000039AD 83C404                   add  sp, 4
  8409                                  
  8410                                  ;-994       expect('=');
  8411                                  
  8412 000039B0 6A3D                     push 61
  8413 000039B2 E8FFD5                   call expect
  8414 000039B5 83C402                   add  sp, 2
  8415                                  
  8416                                  ;-995       if (istoken(T_STRING)) {
  8417                                  
  8418 000039B8 680201                   push 258
  8419 000039BB E8D4D5                   call istoken
  8420 000039BE 83C402                   add  sp, 2
  8421 000039C1 08C0                     or  al, al
  8422 000039C3 0F844200                 je .doglob463
  8423                                  
  8424                                  ;-996         prc(34); prscomment(symbol); prc(34); prs(",0");
  8425                                  
  8426 000039C7 6A22                     push 34
  8427 000039C9 E8BAC9                   call prc
  8428 000039CC 83C402                   add  sp, 2
  8429 000039CF 8D06A36D                 lea  ax, [symbol]
  8430 000039D3 50                       push ax
  8431 000039D4 E8DAC9                   call prscomment
  8432 000039D7 83C402                   add  sp, 2
  8433 000039DA 6A22                     push 34
  8434 000039DC E8A7C9                   call prc
  8435 000039DF 83C402                   add  sp, 2
  8436 000039E2 68[343C]                 push doglob_12
  8437 000039E5 E8F7C9                   call prs
  8438 000039E8 83C402                   add  sp, 2
  8439                                  
  8440                                  ;-997         i=strlen(symbol); GData[GTop]=i; }
  8441                                  
  8442 000039EB 8D06A36D                 lea  ax, [symbol]
  8443 000039EF 50                       push ax
  8444 000039F0 E80EC8                   call strlen
  8445 000039F3 83C402                   add  sp, 2
  8446 000039F6 8946FE                   mov [bp-2], ax
  8447 000039F9 8B46FE                   mov ax, [bp-2]
  8448 000039FC 8B1E[3800]               mov bx, [GTop]
  8449 00003A00 D1E3                     shl bx, 1
  8450 00003A02 89872077                 mov [GData+bx], ax
  8451                                  
  8452                                  ;-998       else if (istoken('{' )) { i=0;
  8453                                  
  8454 00003A06 E96200                   jmp .doglob464
  8455                                  .doglob463:
  8456 00003A09 6A7B                     push 123
  8457 00003A0B E884D5                   call istoken
  8458 00003A0E 83C402                   add  sp, 2
  8459 00003A11 08C0                     or  al, al
  8460 00003A13 0F844B00                 je .doglob465
  8461 00003A17 B80000                   mov ax, 0
  8462 00003A1A 8946FE                   mov [bp-2], ax
  8463                                  
  8464                                  ;-999         do { if(i) prc(',');
  8465                                  
  8466                                  .doglob466:
  8467 00003A1D 8B46FE                   mov ax, [bp-2]
  8468 00003A20 08C0                     or  al, al
  8469 00003A22 0F840800                 je .doglob467
  8470 00003A26 6A2C                     push 44
  8471 00003A28 E85BC9                   call prc
  8472 00003A2B 83C402                   add  sp, 2
  8473                                  
  8474                                  ;-1000           expect(T_CONST); prunsign1(lexval); i=1; }
  8475                                  
  8476                                  .doglob467:
  8477 00003A2E 680101                   push 257
  8478 00003A31 E880D5                   call expect
  8479 00003A34 83C402                   add  sp, 2
  8480 00003A37 FF36[2B00]               push word [lexval]
  8481 00003A3B E804CB                   call prunsign1
  8482 00003A3E 83C402                   add  sp, 2
  8483 00003A41 B80100                   mov ax, 1
  8484 00003A44 8946FE                   mov [bp-2], ax
  8485                                  
  8486                                  ;-1001         while (istoken(',')); expect('}'); }
  8487                                  
  8488 00003A47 6A2C                     push 44
  8489 00003A49 E846D5                   call istoken
  8490 00003A4C 83C402                   add  sp, 2
  8491 00003A4F 08C0                     or  al, al
  8492 00003A51 0F840200                 je .doglob468
  8493 00003A55 EBC6                     jmp .doglob466
  8494                                  .doglob468:
  8495 00003A57 6A7D                     push 125
  8496 00003A59 E858D5                   call expect
  8497 00003A5C 83C402                   add  sp, 2
  8498                                  
  8499                                  ;-1002       else error1("String or number array expected");
  8500                                  
  8501 00003A5F E90900                   jmp .doglob469
  8502                                  .doglob465:
  8503 00003A62 68[373C]                 push doglob_13
  8504 00003A65 E898CB                   call error1
  8505 00003A68 83C402                   add  sp, 2
  8506                                  
  8507                                  ;-1003       };
  8508                                  
  8509                                  .doglob469:
  8510                                  .doglob464:
  8511                                  .doglob461:
  8512                                  
  8513                                  ;-1004   }else { //expect('=');
  8514                                  
  8515 00003A6B E99E00                   jmp .doglob470
  8516                                  .doglob454:
  8517                                  
  8518                                  ;-1005     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");
  8519                                  
  8520 00003A6E 68[573C]                 push doglob_14
  8521 00003A71 E86BC9                   call prs
  8522 00003A74 83C402                   add  sp, 2
  8523 00003A77 8D06A36D                 lea  ax, [symbol]
  8524 00003A7B 50                       push ax
  8525 00003A7C E860C9                   call prs
  8526 00003A7F 83C402                   add  sp, 2
  8527 00003A82 A0[2F00]                 mov al, [istype]
  8528 00003A85 3C2A                     cmp al, 42
  8529 00003A87 0F850C00                 jne .doglob471
  8530 00003A8B 68[5A3C]                 push doglob_15
  8531 00003A8E E84EC9                   call prs
  8532 00003A91 83C402                   add  sp, 2
  8533                                  
  8534                                  ;-1006     else {
  8535                                  
  8536 00003A94 E93300                   jmp .doglob472
  8537                                  .doglob471:
  8538                                  
  8539                                  ;-1007       if      (iswidth==1) prs(" db ");
  8540                                  
  8541 00003A97 A0[3500]                 mov al, [iswidth]
  8542 00003A9A 3C01                     cmp al, 1
  8543 00003A9C 0F850C00                 jne .doglob473
  8544 00003AA0 68[5F3C]                 push doglob_16
  8545 00003AA3 E839C9                   call prs
  8546 00003AA6 83C402                   add  sp, 2
  8547                                  
  8548                                  ;-1008       else if (iswidth==2) prs(" dw ");
  8549                                  
  8550 00003AA9 E91E00                   jmp .doglob474
  8551                                  .doglob473:
  8552 00003AAC A0[3500]                 mov al, [iswidth]
  8553 00003AAF 3C02                     cmp al, 2
  8554 00003AB1 0F850C00                 jne .doglob475
  8555 00003AB5 68[643C]                 push doglob_17
  8556 00003AB8 E824C9                   call prs
  8557 00003ABB 83C402                   add  sp, 2
  8558                                  
  8559                                  ;-1009       else                 prs(" dd ");
  8560                                  
  8561 00003ABE E90900                   jmp .doglob476
  8562                                  .doglob475:
  8563 00003AC1 68[693C]                 push doglob_18
  8564 00003AC4 E818C9                   call prs
  8565 00003AC7 83C402                   add  sp, 2
  8566                                  
  8567                                  ;-1010     }
  8568                                  
  8569                                  .doglob476:
  8570                                  .doglob474:
  8571                                  
  8572                                  ;-1011     if(istoken('-')) prc('-');
  8573                                  
  8574                                  .doglob472:
  8575 00003ACA 6A2D                     push 45
  8576 00003ACC E8C3D4                   call istoken
  8577 00003ACF 83C402                   add  sp, 2
  8578 00003AD2 08C0                     or  al, al
  8579 00003AD4 0F840800                 je .doglob477
  8580 00003AD8 6A2D                     push 45
  8581 00003ADA E8A9C8                   call prc
  8582 00003ADD 83C402                   add  sp, 2
  8583                                  
  8584                                  ;-1012     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }
  8585                                  
  8586                                  .doglob477:
  8587 00003AE0 6A3D                     push 61
  8588 00003AE2 E8ADD4                   call istoken
  8589 00003AE5 83C402                   add  sp, 2
  8590 00003AE8 08C0                     or  al, al
  8591 00003AEA 0F841600                 je .doglob478
  8592 00003AEE 680101                   push 257
  8593 00003AF1 E8C0D4                   call expect
  8594 00003AF4 83C402                   add  sp, 2
  8595 00003AF7 FF36[2B00]               push word [lexval]
  8596 00003AFB E844CA                   call prunsign1
  8597 00003AFE 83C402                   add  sp, 2
  8598                                  
  8599                                  ;-1013     else prunsign1(0); }
  8600                                  
  8601 00003B01 E90800                   jmp .doglob479
  8602                                  .doglob478:
  8603 00003B04 6A00                     push 0
  8604 00003B06 E839CA                   call prunsign1
  8605 00003B09 83C402                   add  sp, 2
  8606                                  .doglob479:
  8607                                  
  8608                                  ;-1014   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;
  8609                                  
  8610                                  .doglob470:
  8611 00003B0C A0[3200]                 mov al, [issign]
  8612 00003B0F 8B1E[3800]               mov bx, [GTop]
  8613 00003B13 88871870                 mov [GSign+bx], al
  8614 00003B17 A0[3500]                 mov al, [iswidth]
  8615 00003B1A 8B1E[3800]               mov bx, [GTop]
  8616 00003B1E 88874471                 mov [GWidth+bx], al
  8617 00003B22 A0[2F00]                 mov al, [istype]
  8618 00003B25 8B1E[3800]               mov bx, [GTop]
  8619 00003B29 8887EC6E                 mov [GType+bx], al
  8620                                  
  8621                                  ;-1015   GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  8622                                  
  8623 00003B2D A1[4000]                 mov ax, [lineno]
  8624 00003B30 83E801                   sub ax, 1
  8625 00003B33 8B1E[3800]               mov bx, [GTop]
  8626 00003B37 D1E3                     shl bx, 1
  8627 00003B39 89877072                 mov [GAdr+bx], ax
  8628 00003B3D B80000                   mov ax, 0
  8629 00003B40 8B1E[3800]               mov bx, [GTop]
  8630 00003B44 D1E3                     shl bx, 1
  8631 00003B46 8987C874                 mov [GUsed+bx], ax
  8632                                  
  8633                                  ;-1016   pt=adrF(GNameField, GTop);
  8634                                  
  8635 00003B4A FF36[3800]               push word [GTop]
  8636 00003B4E 8D067879                 lea  ax, [GNameField]
  8637 00003B52 50                       push ax
  8638 00003B53 E8A6CD                   call adrF
  8639 00003B56 83C404                   add  sp, 4
  8640 00003B59 A3[4200]                 mov word [pt], ax
  8641                                  
  8642                                  ;-1017   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);
  8643                                  
  8644 00003B5C 8B46FA                   mov ax, [bp-6]
  8645 00003B5F 08C0                     or  al, al
  8646 00003B61 0F841200                 je .doglob480
  8647 00003B65 8D06E2A5                 lea  ax, [doglobName]
  8648 00003B69 50                       push ax
  8649 00003B6A FF36[4200]               push word [pt]
  8650 00003B6E E8B8C6                   call strcpy
  8651 00003B71 83C404                   add  sp, 4
  8652 00003B74 E90F00                   jmp .doglob481
  8653                                  .doglob480:
  8654 00003B77 8D06A36D                 lea  ax, [symbol]
  8655 00003B7B 50                       push ax
  8656 00003B7C FF36[4200]               push word [pt]
  8657 00003B80 E8A6C6                   call strcpy
  8658 00003B83 83C404                   add  sp, 4
  8659                                  
  8660                                  ;-1018   GTop++; expect(';'); }
  8661                                  
  8662                                  .doglob481:
  8663 00003B86 FF06[3800]               inc  word[GTop]
  8664 00003B8A 6A3B                     push 59
  8665 00003B8C E825D4                   call expect
  8666 00003B8F 83C402                   add  sp, 2
  8667                                  
  8668                                  ;-1019 
  8669                                  
  8670                                  
  8671                                  ;-1020 
  8672                                  
  8673                                  
  8674                                  ;-1021 int dodefine() {
  8675 00003B92 C9                       LEAVE
  8676 00003B93 C3                       ret
  8677 00003B94 476C6F62616C207461-     doglob_0 db "Global table full",0
  8678 00003B9D 626C652066756C6C00 
  8679 00003BA6 6E6F20564F49442061-     doglob_1 db "no VOID as var type",0
  8680 00003BAF 732076617220747970-
  8681 00003BB8 6500               
  8682 00003BBA 5661726961626C6520-     doglob_2 db "Variable already defined",0
  8683 00003BC3 616C72656164792064-
  8684 00003BCC 6566696E656400     
  8685 00003BD3 5C6E73656374696F6E-     doglob_3 db "\nsection .bss\nabsolute ",0
  8686 00003BDC 202E6273735C6E6162-
  8687 00003BE5 736F6C7574652000   
  8688 00003BED 5C6E00                  doglob_4 db "\n",0
  8689 00003BF0 20726573622000          doglob_5 db " resb ",0
  8690 00003BF7 20726573772000          doglob_6 db " resw ",0
  8691 00003BFE 20726573642000          doglob_7 db " resd ",0
  8692 00003C05 5C6E73656374696F6E-     doglob_8 db "\nsection .text",0
  8693 00003C0E 202E7465787400     
  8694 00003C15 4F6E6C792042797465-     doglob_9 db "Only ByteArray allowed",0
  8695 00003C1E 417272617920616C6C-
  8696 00003C27 6F77656400         
  8697 00003C2C 5C6E00                  doglob_10 db "\n",0
  8698 00003C2F 2064622000              doglob_11 db " db ",0
  8699 00003C34 2C3000                  doglob_12 db ",0",0
  8700 00003C37 537472696E67206F72-     doglob_13 db "String or number array expected",0
  8701 00003C40 206E756D6265722061-
  8702 00003C49 727261792065787065-
  8703 00003C52 6374656400         
  8704 00003C57 5C6E00                  doglob_14 db "\n",0
  8705 00003C5A 2064772000              doglob_15 db " dw ",0
  8706 00003C5F 2064622000              doglob_16 db " db ",0
  8707 00003C64 2064772000              doglob_17 db " dw ",0
  8708 00003C69 2064642000              doglob_18 db " dd ",0
  8709                                  ENDP
  8710                                  
  8711                                  dodefine: PROC
  8712                                  
  8713                                  ;-1022     int i; int j; int fdtemp;
  8714                                  
  8715                                  
  8716                                  ;-1023     if (eqstr(symbol, "ORGDATA")) {
  8717                                  ;
  8718 00003C6E C8060000                 ENTER  6,0
  8719 00003C72 68[5D3D]                 push dodefine_0
  8720 00003C75 8D06A36D                 lea  ax, [symbol]
  8721 00003C79 50                       push ax
  8722 00003C7A E8E2C5                   call eqstr
  8723 00003C7D 83C404                   add  sp, 4
  8724 00003C80 08C0                     or  al, al
  8725 00003C82 0F841500                 je .dodefine482
  8726                                  
  8727                                  ;-1024         token=getlex();
  8728                                  
  8729 00003C86 E88ACD                   call getlex
  8730 00003C89 A3[1E00]                 mov word [token], ax
  8731                                  
  8732                                  ;-1025         ORGDATAORIG=lexval;
  8733                                  
  8734 00003C8C A1[2B00]                 mov ax, [lexval]
  8735 00003C8F A3[1000]                 mov word [ORGDATAORIG], ax
  8736                                  
  8737                                  ;-1026         orgData=lexval;
  8738                                  
  8739 00003C92 A1[2B00]                 mov ax, [lexval]
  8740 00003C95 A3[1200]                 mov word [orgData], ax
  8741                                  
  8742                                  ;-1027         return;
  8743                                  
  8744 00003C98 E9C000                   jmp .retndodefine
  8745                                  
  8746                                  ;-1028     }
  8747                                  
  8748                                  
  8749                                  ;-1029     expect(T_NAME);
  8750                                  
  8751                                  .dodefine482:
  8752 00003C9B 680001                   push 256
  8753 00003C9E E813D3                   call expect
  8754 00003CA1 83C402                   add  sp, 2
  8755                                  
  8756                                  ;-1030     if (token==T_CONST) {
  8757                                  
  8758 00003CA4 A1[1E00]                 mov ax, [token]
  8759 00003CA7 3D0101                   cmp ax, 257
  8760 00003CAA 0F85AD00                 jne .dodefine483
  8761                                  
  8762                                  ;-1031         if (GTop >= LSTART) error1("global table (define) full");
  8763                                  
  8764 00003CAE A1[3800]                 mov ax, [GTop]
  8765 00003CB1 3DC800                   cmp ax, 200 ;unsigned : 1
  8766 00003CB4 0F8C0900                 jl  .dodefine484
  8767 00003CB8 68[653D]                 push dodefine_1
  8768 00003CBB E842C9                   call error1
  8769 00003CBE 83C402                   add  sp, 2
  8770                                  
  8771                                  ;-1032         i=strlen(symbol);
  8772                                  
  8773                                  .dodefine484:
  8774 00003CC1 8D06A36D                 lea  ax, [symbol]
  8775 00003CC5 50                       push ax
  8776 00003CC6 E838C5                   call strlen
  8777 00003CC9 83C402                   add  sp, 2
  8778 00003CCC 8946FE                   mov [bp-2], ax
  8779                                  
  8780                                  ;-1033         if (i>15) error1("Define name longer 15 char");
  8781                                  
  8782 00003CCF 8B46FE                   mov ax, [bp-2]
  8783 00003CD2 83F80F                   cmp ax, 15
  8784 00003CD5 0F8E0900                 jle .dodefine485
  8785 00003CD9 68[803D]                 push dodefine_2
  8786 00003CDC E821C9                   call error1
  8787 00003CDF 83C402                   add  sp, 2
  8788                                  
  8789                                  ;-1034         GSign [GTop]='U';
  8790                                  
  8791                                  .dodefine485:
  8792 00003CE2 B85500                   mov ax, 85
  8793 00003CE5 8B1E[3800]               mov bx, [GTop]
  8794 00003CE9 88871870                 mov [GSign+bx], al
  8795                                  
  8796                                  ;-1035         GWidth[GTop]=1;
  8797                                  
  8798 00003CED B80100                   mov ax, 1
  8799 00003CF0 8B1E[3800]               mov bx, [GTop]
  8800 00003CF4 88874471                 mov [GWidth+bx], al
  8801                                  
  8802                                  ;-1036         GType [GTop]='#';
  8803                                  
  8804 00003CF8 B82300                   mov ax, 35
  8805 00003CFB 8B1E[3800]               mov bx, [GTop]
  8806 00003CFF 8887EC6E                 mov [GType+bx], al
  8807                                  
  8808                                  ;-1037         GAdr [GTop]=lineno-1;
  8809                                  
  8810 00003D03 A1[4000]                 mov ax, [lineno]
  8811 00003D06 83E801                   sub ax, 1
  8812 00003D09 8B1E[3800]               mov bx, [GTop]
  8813 00003D0D D1E3                     shl bx, 1
  8814 00003D0F 89877072                 mov [GAdr+bx], ax
  8815                                  
  8816                                  ;-1038         GUsed [GTop]=0;
  8817                                  
  8818 00003D13 B80000                   mov ax, 0
  8819 00003D16 8B1E[3800]               mov bx, [GTop]
  8820 00003D1A D1E3                     shl bx, 1
  8821 00003D1C 8987C874                 mov [GUsed+bx], ax
  8822                                  
  8823                                  ;-1039         pt=adrF(GNameField, GTop);
  8824                                  
  8825 00003D20 FF36[3800]               push word [GTop]
  8826 00003D24 8D067879                 lea  ax, [GNameField]
  8827 00003D28 50                       push ax
  8828 00003D29 E8D0CB                   call adrF
  8829 00003D2C 83C404                   add  sp, 4
  8830 00003D2F A3[4200]                 mov word [pt], ax
  8831                                  
  8832                                  ;-1040         strcpy(pt, symbol);
  8833                                  
  8834 00003D32 8D06A36D                 lea  ax, [symbol]
  8835 00003D36 50                       push ax
  8836 00003D37 FF36[4200]               push word [pt]
  8837 00003D3B E8EBC4                   call strcpy
  8838 00003D3E 83C404                   add  sp, 4
  8839                                  
  8840                                  ;-1041         GData[GTop]=lexval;
  8841                                  
  8842 00003D41 A1[2B00]                 mov ax, [lexval]
  8843 00003D44 8B1E[3800]               mov bx, [GTop]
  8844 00003D48 D1E3                     shl bx, 1
  8845 00003D4A 89872077                 mov [GData+bx], ax
  8846                                  
  8847                                  ;-1042         expect(T_CONST);
  8848                                  
  8849 00003D4E 680101                   push 257
  8850 00003D51 E860D2                   call expect
  8851 00003D54 83C402                   add  sp, 2
  8852                                  
  8853                                  ;-1043         GTop++;
  8854                                  
  8855 00003D57 FF06[3800]               inc  word[GTop]
  8856                                  
  8857                                  ;-1044     }
  8858                                  
  8859                                  
  8860                                  ;-1045 }
  8861                                  
  8862                                  .dodefine483:
  8863                                  
  8864                                  ;-1046 
  8865                                  
  8866                                  
  8867                                  ;-1047 int parse() {
  8868                                  
  8869 00003D5B C9                       .retndodefine: LEAVE
  8870 00003D5C C3                       ret
  8871 00003D5D 4F52474441544100        dodefine_0 db "ORGDATA",0
  8872 00003D65 676C6F62616C207461-     dodefine_1 db "global table (define) full",0
  8873 00003D6E 626C65202864656669-
  8874 00003D77 6E65292066756C6C00 
  8875 00003D80 446566696E65206E61-     dodefine_2 db "Define name longer 15 char",0
  8876 00003D89 6D65206C6F6E676572-
  8877 00003D92 203135206368617200 
  8878                                  ENDP
  8879                                  
  8880                                  parse: PROC
  8881                                  
  8882                                  ;-1048     token=getlex();
  8883                                  
  8884 00003D9B E875CC                   call getlex
  8885 00003D9E A3[1E00]                 mov word [token], ax
  8886                                  
  8887                                  ;-1049     do {
  8888                                  
  8889                                  .parse486:
  8890                                  
  8891                                  ;-1050         if (token <= 0) return 1;
  8892                                  
  8893 00003DA1 A1[1E00]                 mov ax, [token]
  8894 00003DA4 83F800                   cmp ax, 0
  8895 00003DA7 0F8F0600                 jg  .parse487
  8896 00003DAB B80100                   mov ax, 1
  8897 00003DAE E95000                   jmp .retnparse
  8898                                  
  8899                                  ;-1051         if (istoken('#')) {
  8900                                  
  8901                                  .parse487:
  8902 00003DB1 6A23                     push 35
  8903 00003DB3 E8DCD1                   call istoken
  8904 00003DB6 83C402                   add  sp, 2
  8905 00003DB9 08C0                     or  al, al
  8906 00003DBB 0F842100                 je .parse488
  8907                                  
  8908                                  ;-1052              if (istoken(T_DEFINE))  dodefine();
  8909                                  
  8910 00003DBF 68FF01                   push 511
  8911 00003DC2 E8CDD1                   call istoken
  8912 00003DC5 83C402                   add  sp, 2
  8913 00003DC8 08C0                     or  al, al
  8914 00003DCA 0F840600                 je .parse489
  8915 00003DCE E89DFE                   call dodefine
  8916                                  
  8917                                  ;-1053              else error1("define expected");
  8918                                  
  8919 00003DD1 E90900                   jmp .parse490
  8920                                  .parse489:
  8921 00003DD4 68[023E]                 push parse_0
  8922 00003DD7 E826C8                   call error1
  8923 00003DDA 83C402                   add  sp, 2
  8924                                  
  8925                                  ;-1054         }
  8926                                  
  8927                                  .parse490:
  8928                                  
  8929                                  ;-1055     else{
  8930                                  
  8931 00003DDD E91600                   jmp .parse491
  8932                                  .parse488:
  8933                                  
  8934                                  ;-1056         typeName();
  8935                                  
  8936 00003DE0 E8B9D3                   call typeName
  8937                                  
  8938                                  ;-1057         if (token=='(') dofunc();
  8939                                  
  8940 00003DE3 A1[1E00]                 mov ax, [token]
  8941 00003DE6 83F828                   cmp ax, 40
  8942 00003DE9 0F850600                 jne .parse492
  8943 00003DED E8B1F7                   call dofunc
  8944                                  
  8945                                  ;-1058         else doglob(); }
  8946                                  
  8947 00003DF0 E90300                   jmp .parse493
  8948                                  .parse492:
  8949 00003DF3 E844FA                   call doglob
  8950                                  .parse493:
  8951                                  
  8952                                  ;-1059     } while(1);
  8953                                  
  8954                                  .parse491:
  8955 00003DF6 B80100                   mov ax, 1
  8956 00003DF9 08C0                     or  al, al
  8957 00003DFB 0F840200                 je .parse494
  8958 00003DFF EBA0                     jmp .parse486
  8959                                  .parse494:
  8960                                  
  8961                                  ;-1060 }
  8962                                  
  8963                                  
  8964                                  ;-1061 
  8965                                  
  8966                                  
  8967                                  ;-1062 char *arglen=0x80; char *argv=0x82;
  8968                                  
  8969                                   .retnparse:
  8970 00003E01 C3                       ret
  8971 00003E02 646566696E65206578-     parse_0 db "define expected",0
  8972 00003E0B 70656374656400     
  8973                                  ENDP
  8974 00003E12 8000                    arglen dw 128
  8975 00003E14 8200                    argv dw 130
  8976                                  
  8977                                  ;-1063 int main() {
  8978                                  
  8979                                  
  8980                                  main: PROC
  8981                                  
  8982                                  ;-1064     int arglen1; unsigned int i; char *c;
  8983                                  
  8984                                  
  8985                                  ;-1065     arglen1=*arglen;
  8986                                  ;
  8987 00003E16 C8060000                 ENTER  6,0
  8988 00003E1A 8B1E[123E]               mov bx, [arglen]
  8989 00003E1E 8A07                     mov al, [bx]
  8990 00003E20 B400                     mov ah, 0
  8991 00003E22 8946FE                   mov [bp-2], ax
  8992                                  
  8993                                  ;-1066     if (arglen1 == 0) {
  8994                                  
  8995 00003E25 8B46FE                   mov ax, [bp-2]
  8996 00003E28 83F800                   cmp ax, 0
  8997 00003E2B 0F851C00                 jne .main495
  8998                                  
  8999                                  ;-1067         cputs(Version1);
  9000                                  
  9001 00003E2F 8D06[0300]               lea  ax, [Version1]
  9002 00003E33 50                       push ax
  9003 00003E34 E83CC2                   call cputs
  9004 00003E37 83C402                   add  sp, 2
  9005                                  
  9006                                  ;-1068         cputs(" Usage: A.COM in_file[.C]: ");
  9007                                  
  9008 00003E3A 68[C840]                 push main_0
  9009 00003E3D E833C2                   call cputs
  9010 00003E40 83C402                   add  sp, 2
  9011                                  
  9012                                  ;-1069         exitR(3);
  9013                                  
  9014 00003E43 6A03                     push 3
  9015 00003E45 E89DC2                   call exitR
  9016 00003E48 83C402                   add  sp, 2
  9017                                  
  9018                                  ;-1070         }
  9019                                  
  9020                                  
  9021                                  ;-1071     i=arglen1+129;
  9022                                  
  9023                                  .main495:
  9024 00003E4B 8B46FE                   mov ax, [bp-2]
  9025 00003E4E 058100                   add ax, 129
  9026 00003E51 8946FC                   mov [bp-4], ax
  9027                                  
  9028                                  ;-1072     *i=0;
  9029                                  
  9030 00003E54 B80000                   mov ax, 0
  9031 00003E57 8B5EFC                   mov  bx, [bp-4]
  9032 00003E5A 8907                     mov  [bx], ax
  9033                                  
  9034                                  ;-1073     arglen1--;
  9035                                  
  9036 00003E5C FF4EFE                   dec  word[bp-2]
  9037                                  
  9038                                  ;-1074     toupper(argv);
  9039                                  
  9040 00003E5F FF36[143E]               push word [argv]
  9041 00003E63 E86AC4                   call toupper
  9042 00003E66 83C402                   add  sp, 2
  9043                                  
  9044                                  ;-1075     strcpy(namein, argv);
  9045                                  
  9046 00003E69 FF36[143E]               push word [argv]
  9047 00003E6D 8D06666E                 lea  ax, [namein]
  9048 00003E71 50                       push ax
  9049 00003E72 E8B4C3                   call strcpy
  9050 00003E75 83C404                   add  sp, 4
  9051                                  
  9052                                  ;-1076     if (instr1(namein, '.') == 0) strcat1(namein, ".C");
  9053                                  
  9054 00003E78 6A2E                     push 46
  9055 00003E7A 8D06666E                 lea  ax, [namein]
  9056 00003E7E 50                       push ax
  9057 00003E7F E891C4                   call instr1
  9058 00003E82 83C404                   add  sp, 4
  9059 00003E85 83F800                   cmp ax, 0
  9060 00003E88 0F850E00                 jne .main496
  9061 00003E8C 68[E440]                 push main_1
  9062 00003E8F 8D06666E                 lea  ax, [namein]
  9063 00003E93 50                       push ax
  9064 00003E94 E814C4                   call strcat1
  9065 00003E97 83C404                   add  sp, 4
  9066                                  
  9067                                  ;-1077     strcpy(namelst, namein);
  9068                                  
  9069                                  .main496:
  9070 00003E9A 8D06666E                 lea  ax, [namein]
  9071 00003E9E 50                       push ax
  9072 00003E9F 8D06A96E                 lea  ax, [namelst]
  9073 00003EA3 50                       push ax
  9074 00003EA4 E882C3                   call strcpy
  9075 00003EA7 83C404                   add  sp, 4
  9076                                  
  9077                                  ;-1078     i=strlen(namelst);
  9078                                  
  9079 00003EAA 8D06A96E                 lea  ax, [namelst]
  9080 00003EAE 50                       push ax
  9081 00003EAF E84FC3                   call strlen
  9082 00003EB2 83C402                   add  sp, 2
  9083 00003EB5 8946FC                   mov [bp-4], ax
  9084                                  
  9085                                  ;-1079     i--;
  9086                                  
  9087 00003EB8 FF4EFC                   dec  word[bp-4]
  9088                                  
  9089                                  ;-1080     c=&namelst+i;
  9090                                  
  9091 00003EBB B8A96E                   mov ax, namelst
  9092 00003EBE 0346FC                   add ax, [bp-4]
  9093 00003EC1 8946FA                   mov [bp-6], ax
  9094                                  
  9095                                  ;-1081     *c='S';
  9096                                  
  9097 00003EC4 B85300                   mov ax, 83
  9098 00003EC7 8B5EFA                   mov  bx, [bp-6]
  9099 00003ECA 8807                     mov  [bx], al
  9100                                  
  9101                                  ;-1082 
  9102                                  
  9103                                  
  9104                                  ;-1083     fdin=openR (namein);
  9105                                  
  9106 00003ECC 8D06666E                 lea  ax, [namein]
  9107 00003ED0 50                       push ax
  9108 00003ED1 E8E1C1                   call openR
  9109 00003ED4 83C402                   add  sp, 2
  9110 00003ED7 A3[1A00]                 mov word [fdin], ax
  9111                                  
  9112                                  ;-1084     if(DOS_ERR){
  9113                                  
  9114 00003EDA A1[4600]                 mov ax, [DOS_ERR]
  9115 00003EDD 08C0                     or  al, al
  9116 00003EDF 0F841C00                 je .main497
  9117                                  
  9118                                  ;-1085         cputs("Source file missing (.C): ");
  9119                                  
  9120 00003EE3 68[E740]                 push main_2
  9121 00003EE6 E88AC1                   call cputs
  9122 00003EE9 83C402                   add  sp, 2
  9123                                  
  9124                                  ;-1086         cputs(namein);
  9125                                  
  9126 00003EEC 8D06666E                 lea  ax, [namein]
  9127 00003EF0 50                       push ax
  9128 00003EF1 E87FC1                   call cputs
  9129 00003EF4 83C402                   add  sp, 2
  9130                                  
  9131                                  ;-1087         exitR(1);
  9132                                  
  9133 00003EF7 6A01                     push 1
  9134 00003EF9 E8E9C1                   call exitR
  9135 00003EFC 83C402                   add  sp, 2
  9136                                  
  9137                                  ;-1088         }
  9138                                  
  9139                                  
  9140                                  ;-1089     fdout=creatR(namelst);
  9141                                  
  9142                                  .main497:
  9143 00003EFF 8D06A96E                 lea  ax, [namelst]
  9144 00003F03 50                       push ax
  9145 00003F04 E8BDC1                   call creatR
  9146 00003F07 83C402                   add  sp, 2
  9147 00003F0A A3[1C00]                 mov word [fdout], ax
  9148                                  
  9149                                  ;-1090     if(DOS_ERR){
  9150                                  
  9151 00003F0D A1[4600]                 mov ax, [DOS_ERR]
  9152 00003F10 08C0                     or  al, al
  9153 00003F12 0F841C00                 je .main498
  9154                                  
  9155                                  ;-1091         cputs("list file not creatable: ");
  9156                                  
  9157 00003F16 68[0241]                 push main_3
  9158 00003F19 E857C1                   call cputs
  9159 00003F1C 83C402                   add  sp, 2
  9160                                  
  9161                                  ;-1092         cputs(namelst);
  9162                                  
  9163 00003F1F 8D06A96E                 lea  ax, [namelst]
  9164 00003F23 50                       push ax
  9165 00003F24 E84CC1                   call cputs
  9166 00003F27 83C402                   add  sp, 2
  9167                                  
  9168                                  ;-1093         exitR(2);
  9169                                  
  9170 00003F2A 6A02                     push 2
  9171 00003F2C E8B6C1                   call exitR
  9172 00003F2F 83C402                   add  sp, 2
  9173                                  
  9174                                  ;-1094         }
  9175                                  
  9176                                  
  9177                                  ;-1095     prs("\n; ");
  9178                                  
  9179                                  .main498:
  9180 00003F32 68[1C41]                 push main_4
  9181 00003F35 E8A7C4                   call prs
  9182 00003F38 83C402                   add  sp, 2
  9183                                  
  9184                                  ;-1096     prs(Version1);
  9185                                  
  9186 00003F3B 8D06[0300]               lea  ax, [Version1]
  9187 00003F3F 50                       push ax
  9188 00003F40 E89CC4                   call prs
  9189 00003F43 83C402                   add  sp, 2
  9190                                  
  9191                                  ;-1097     prs(", Source: "); prs(namein);
  9192                                  
  9193 00003F46 68[2141]                 push main_5
  9194 00003F49 E893C4                   call prs
  9195 00003F4C 83C402                   add  sp, 2
  9196 00003F4F 8D06666E                 lea  ax, [namein]
  9197 00003F53 50                       push ax
  9198 00003F54 E888C4                   call prs
  9199 00003F57 83C402                   add  sp, 2
  9200                                  
  9201                                  ;-1098     prs(", Output asm: "); prs(namelst);
  9202                                  
  9203 00003F5A 68[2C41]                 push main_6
  9204 00003F5D E87FC4                   call prs
  9205 00003F60 83C402                   add  sp, 2
  9206 00003F63 8D06A96E                 lea  ax, [namelst]
  9207 00003F67 50                       push ax
  9208 00003F68 E874C4                   call prs
  9209 00003F6B 83C402                   add  sp, 2
  9210                                  
  9211                                  ;-1099     prs("\norg  256 \njmp main");
  9212                                  
  9213 00003F6E 68[3B41]                 push main_7
  9214 00003F71 E86BC4                   call prs
  9215 00003F74 83C402                   add  sp, 2
  9216                                  
  9217                                  ;-1100     coname=0;
  9218                                  
  9219 00003F77 B80000                   mov ax, 0
  9220 00003F7A A2606D                   mov byte [coname], al
  9221                                  
  9222                                  ;-1101     orgData=ORGDATAORIG;
  9223                                  
  9224 00003F7D A1[1000]                 mov ax, [ORGDATAORIG]
  9225 00003F80 A3[1200]                 mov word [orgData], ax
  9226                                  
  9227                                  ;-1102     fgetsp=&fgetsdest;
  9228                                  
  9229 00003F83 B8D4A4                   mov ax, fgetsdest
  9230 00003F86 A3[3E00]                 mov word [fgetsp], ax
  9231                                  
  9232                                  ;-1103     *fgetsp=0;
  9233                                  
  9234 00003F89 B80000                   mov ax, 0
  9235 00003F8C 8B1E[3E00]               mov  bx, [fgetsp]
  9236 00003F90 8807                     mov  [bx], al
  9237                                  
  9238                                  ;-1104     thechar=fgets1();
  9239                                  
  9240 00003F92 E8F0C7                   call fgets1
  9241 00003F95 A2[2200]                 mov byte [thechar], al
  9242                                  
  9243                                  ;-1105     parse();
  9244                                  
  9245 00003F98 E800FE                   call parse
  9246                                  
  9247                                  ;-1106     prs("\n;Input: "); prs(namein);
  9248                                  
  9249 00003F9B 68[5141]                 push main_8
  9250 00003F9E E83EC4                   call prs
  9251 00003FA1 83C402                   add  sp, 2
  9252 00003FA4 8D06666E                 lea  ax, [namein]
  9253 00003FA8 50                       push ax
  9254 00003FA9 E833C4                   call prs
  9255 00003FAC 83C402                   add  sp, 2
  9256                                  
  9257                                  ;-1107     prs(", List: ");   prs(namelst);
  9258                                  
  9259 00003FAF 68[5C41]                 push main_9
  9260 00003FB2 E82AC4                   call prs
  9261 00003FB5 83C402                   add  sp, 2
  9262 00003FB8 8D06A96E                 lea  ax, [namelst]
  9263 00003FBC 50                       push ax
  9264 00003FBD E81FC4                   call prs
  9265 00003FC0 83C402                   add  sp, 2
  9266                                  
  9267                                  ;-1108     prs(", Lines: "); prunsign1(lineno);
  9268                                  
  9269 00003FC3 68[6541]                 push main_10
  9270 00003FC6 E816C4                   call prs
  9271 00003FC9 83C402                   add  sp, 2
  9272 00003FCC FF36[4000]               push word [lineno]
  9273 00003FD0 E86FC5                   call prunsign1
  9274 00003FD3 83C402                   add  sp, 2
  9275                                  
  9276                                  ;-1109     prs("\n;Glob. variables: "); GTop--; prunsign1(GTop);
  9277                                  
  9278 00003FD6 68[6F41]                 push main_11
  9279 00003FD9 E803C4                   call prs
  9280 00003FDC 83C402                   add  sp, 2
  9281 00003FDF FF0E[3800]               dec  word[GTop]
  9282 00003FE3 FF36[3800]               push word [GTop]
  9283 00003FE7 E858C5                   call prunsign1
  9284 00003FEA 83C402                   add  sp, 2
  9285                                  
  9286                                  ;-1110     prs(" ("); prunsign1(LSTART);
  9287                                  
  9288 00003FED 68[8441]                 push main_12
  9289 00003FF0 E8ECC3                   call prs
  9290 00003FF3 83C402                   add  sp, 2
  9291 00003FF6 68C800                   push 200
  9292 00003FF9 E846C5                   call prunsign1
  9293 00003FFC 83C402                   add  sp, 2
  9294                                  
  9295                                  ;-1111     prs("), Functions: "); prunsign1(FTop);
  9296                                  
  9297 00003FFF 68[8741]                 push main_13
  9298 00004002 E8DAC3                   call prs
  9299 00004005 83C402                   add  sp, 2
  9300 00004008 FF36[3C00]               push word [FTop]
  9301 0000400C E833C5                   call prunsign1
  9302 0000400F 83C402                   add  sp, 2
  9303                                  
  9304                                  ;-1112     prs(" ("); prunsign1(FUNCMAX);
  9305                                  
  9306 00004012 68[9641]                 push main_14
  9307 00004015 E8C7C3                   call prs
  9308 00004018 83C402                   add  sp, 2
  9309 0000401B 682C01                   push 300
  9310 0000401E E821C5                   call prunsign1
  9311 00004021 83C402                   add  sp, 2
  9312                                  
  9313                                  ;-1113     prs(")\n;Const in '"); prs(coname); prs("': "); prunsign1(maxco);
  9314                                  
  9315 00004024 68[9941]                 push main_15
  9316 00004027 E8B5C3                   call prs
  9317 0000402A 83C402                   add  sp, 2
  9318 0000402D 8D06606D                 lea  ax, [coname]
  9319 00004031 50                       push ax
  9320 00004032 E8AAC3                   call prs
  9321 00004035 83C402                   add  sp, 2
  9322 00004038 68[A841]                 push main_16
  9323 0000403B E8A1C3                   call prs
  9324 0000403E 83C402                   add  sp, 2
  9325 00004041 FF36[1400]               push word [maxco]
  9326 00004045 E8FAC4                   call prunsign1
  9327 00004048 83C402                   add  sp, 2
  9328                                  
  9329                                  ;-1114     prs(" ("); prunsign1(COMAX);
  9330                                  
  9331 0000404B 68[AC41]                 push main_17
  9332 0000404E E88EC3                   call prs
  9333 00004051 83C402                   add  sp, 2
  9334 00004054 68B80B                   push 3000
  9335 00004057 E8E8C4                   call prunsign1
  9336 0000405A 83C402                   add  sp, 2
  9337                                  
  9338                                  ;-1115     i=COMAX; i=i-maxco;
  9339                                  
  9340 0000405D B8B80B                   mov ax, 3000
  9341 00004060 8946FC                   mov [bp-4], ax
  9342 00004063 8B46FC                   mov ax, [bp-4]
  9343 00004066 2B06[1400]               sub ax, [maxco]
  9344 0000406A 8946FC                   mov [bp-4], ax
  9345                                  
  9346                                  ;-1116     if (i <= 1000)prs("\n *** Warning *** constant area too small");
  9347                                  
  9348 0000406D 8B46FC                   mov ax, [bp-4]
  9349 00004070 3DE803                   cmp ax, 1000
  9350 00004073 0F870900                 ja  .main499
  9351 00004077 68[AF41]                 push main_18
  9352 0000407A E862C3                   call prs
  9353 0000407D 83C402                   add  sp, 2
  9354                                  
  9355                                  ;-1117     prs("), stacksize: ");
  9356                                  
  9357                                  .main499:
  9358 00004080 68[DA41]                 push main_19
  9359 00004083 E859C3                   call prs
  9360 00004086 83C402                   add  sp, 2
  9361                                  
  9362                                  ;-1118     i=65636; i=i-orgData;
  9363                                  
  9364 00004089 B86400                   mov ax, 100
  9365 0000408C 8946FC                   mov [bp-4], ax
  9366 0000408F 8B46FC                   mov ax, [bp-4]
  9367 00004092 2B06[1200]               sub ax, [orgData]
  9368 00004096 8946FC                   mov [bp-4], ax
  9369                                  
  9370                                  ;-1119     prunsign1(i);
  9371                                  
  9372 00004099 FF76FC                   push word [bp-4]
  9373 0000409C E8A3C4                   call prunsign1
  9374 0000409F 83C402                   add  sp, 2
  9375                                  
  9376                                  ;-1120     if (i <= 1000) prs("\n *** Warning *** Stack too small");
  9377                                  
  9378 000040A2 8B46FC                   mov ax, [bp-4]
  9379 000040A5 3DE803                   cmp ax, 1000
  9380 000040A8 0F870900                 ja  .main500
  9381 000040AC 68[E941]                 push main_20
  9382 000040AF E82DC3                   call prs
  9383 000040B2 83C402                   add  sp, 2
  9384                                  
  9385                                  ;-1121     prs("          ");
  9386                                  
  9387                                  .main500:
  9388 000040B5 68[0C42]                 push main_21
  9389 000040B8 E824C3                   call prs
  9390 000040BB 83C402                   add  sp, 2
  9391                                  
  9392                                  ;-1122     end1(0);
  9393                                  
  9394 000040BE 6A00                     push 0
  9395 000040C0 E81AC5                   call end1
  9396 000040C3 83C402                   add  sp, 2
  9397                                  
  9398                                  ;-1123 }
  9399 000040C6 C9                       LEAVE
  9400 000040C7 C3                       ret
  9401 000040C8 2055736167653A2041-     main_0 db " Usage: A.COM in_file[.C]: ",0
  9402 000040D1 2E434F4D20696E5F66-
  9403 000040DA 696C655B2E435D3A20-
  9404 000040E3 00                 
  9405 000040E4 2E4300                  main_1 db ".C",0
  9406 000040E7 536F75726365206669-     main_2 db "Source file missing (.C): ",0
  9407 000040F0 6C65206D697373696E-
  9408 000040F9 6720282E43293A2000 
  9409 00004102 6C6973742066696C65-     main_3 db "list file not creatable: ",0
  9410 0000410B 206E6F742063726561-
  9411 00004114 7461626C653A2000   
  9412 0000411C 5C6E3B2000              main_4 db "\n; ",0
  9413 00004121 2C20536F757263653A-     main_5 db ", Source: ",0
  9414 0000412A 2000               
  9415 0000412C 2C204F757470757420-     main_6 db ", Output asm: ",0
  9416 00004135 61736D3A2000       
  9417 0000413B 5C6E6F726720203235-     main_7 db "\norg  256 \njmp main",0
  9418 00004144 36205C6E6A6D70206D-
  9419 0000414D 61696E00           
  9420 00004151 5C6E3B496E7075743A-     main_8 db "\n;Input: ",0
  9421 0000415A 2000               
  9422 0000415C 2C204C6973743A2000      main_9 db ", List: ",0
  9423 00004165 2C204C696E65733A20-     main_10 db ", Lines: ",0
  9424 0000416E 00                 
  9425 0000416F 5C6E3B476C6F622E20-     main_11 db "\n;Glob. variables: ",0
  9426 00004178 7661726961626C6573-
  9427 00004181 3A2000             
  9428 00004184 202800                  main_12 db " (",0
  9429 00004187 292C2046756E637469-     main_13 db "), Functions: ",0
  9430 00004190 6F6E733A2000       
  9431 00004196 202800                  main_14 db " (",0
  9432 00004199 295C6E3B436F6E7374-     main_15 db ")\n;Const in '",0
  9433 000041A2 20696E202700       
  9434 000041A8 273A2000                main_16 db "': ",0
  9435 000041AC 202800                  main_17 db " (",0
  9436 000041AF 5C6E202A2A2A205761-     main_18 db "\n *** Warning *** constant area too small",0
  9437 000041B8 726E696E67202A2A2A-
  9438 000041C1 20636F6E7374616E74-
  9439 000041CA 206172656120746F6F-
  9440 000041D3 20736D616C6C00     
  9441 000041DA 292C20737461636B73-     main_19 db "), stacksize: ",0
  9442 000041E3 697A653A2000       
  9443 000041E9 5C6E202A2A2A205761-     main_20 db "\n *** Warning *** Stack too small",0
  9444 000041F2 726E696E67202A2A2A-
  9445 000041FB 20537461636B20746F-
  9446 00004204 6F20736D616C6C00   
  9447 0000420C 202020202020202020-     main_21 db "          ",0
  9448 00004215 2000               
  9449                                  ENDP
  9450                                  ;Input: A.C, List: A.S, Lines: 1124
  9451                                  ;Glob. variables: 107 (200), Functions: 81 (300)
  9452                                  ;Const in 'checkreg': 712 (3000), stacksize: 23155          
