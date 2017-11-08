     1                                  
     2                                  ; A.COM V0.9.3, Source: A.C, Output asm: A.S
     3                                  org  256 
     4 00000000 E9263D                  jmp main
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
   119                                  ;-38 unsigned int ORGDATAORIG=25000;//start of arrays, end of text
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
   148                                  ;-45 char symbol[COLUMNMAX];
   149                                  
   150                                  section .bss
   151                                  absolute 28000
   152 00006D60 <res 00000080>          symbol resb 128
   153                                  section .text
   154                                  
   155                                  ;-46 char fname[CMDLENMAX];
   156                                  
   157                                  section .bss
   158                                  absolute 28128
   159 00006DE0 <res 00000043>          fname resb 67
   160                                  section .text
   161                                  
   162                                  ;-47 char namein[CMDLENMAX];
   163                                  
   164                                  section .bss
   165                                  absolute 28195
   166 00006E23 <res 00000043>          namein resb 67
   167                                  section .text
   168                                  
   169                                  ;-48 char namelst[CMDLENMAX];
   170                                  
   171                                  section .bss
   172                                  absolute 28262
   173 00006E66 <res 00000043>          namelst resb 67
   174                                  section .text
   175                                  
   176                                  ;-49 char *cloc=0;
   177                                  
   178 00000018 0000                    cloc dw 0
   179                                  
   180                                  ;-50 int fdin=0;
   181                                  
   182 0000001A 0000                    fdin dw 0
   183                                  
   184                                  ;-51 int fdout=0;
   185                                  
   186 0000001C 0000                    fdout dw 0
   187                                  
   188                                  ;-52 int token=0;
   189                                  
   190 0000001E 0000                    token dw 0
   191                                  
   192                                  ;-53 int column=0;
   193                                  
   194 00000020 0000                    column dw 0
   195                                  
   196                                  ;-54 char thechar=0;   //reads one char forward
   197                                  
   198 00000022 00                      thechar db 0
   199                                  
   200                                  ;-55 int iscmp=0;
   201                                  
   202 00000023 0000                    iscmp dw 0
   203                                  
   204                                  ;-56 int nconst=0;
   205                                  
   206 00000025 0000                    nconst dw 0
   207                                  
   208                                  ;-57 int nreturn=0;
   209                                  
   210 00000027 0000                    nreturn dw 0
   211                                  
   212                                  ;-58 int nlabel=0;
   213                                  
   214 00000029 0000                    nlabel dw 0
   215                                  
   216                                  ;-59 unsigned int lexval=0;
   217                                  
   218 0000002B 0000                    lexval dw 0
   219                                  
   220                                  ;-60 int typei;       char istype;
   221                                  
   222 0000002D 0000                    typei dw 0
   223 0000002F 00                      istype db 0
   224                                  
   225                                  ;-61 int signi;       char issign;
   226                                  
   227 00000030 0000                    signi dw 0
   228 00000032 00                      issign db 0
   229                                  
   230                                  ;-62 int widthi;      char iswidth;
   231                                  
   232 00000033 0000                    widthi dw 0
   233 00000035 00                      iswidth db 0
   234                                  
   235                                  ;-63 int wi=0;
   236                                  
   237 00000036 0000                    wi dw 0
   238                                  
   239                                  ;-64 #define VARMAX        400//max global and local var
   240                                  
   241                                  
   242                                  ;-65 #define LSTART        200//max global var
   243                                  
   244                                  
   245                                  ;-66 #define GNAMEMAX     6400// 16*VARMAX
   246                                  
   247                                  
   248                                  ;-67 char GType [VARMAX]; // 0=V, 1=*, 2=&,#
   249                                  
   250                                  section .bss
   251                                  absolute 28329
   252 00006EA9 <res 00000190>          GType resb 400
   253                                  section .text
   254                                  
   255                                  ;-68 char GSign [VARMAX]; // 0=U, 1=S
   256                                  
   257                                  section .bss
   258                                  absolute 28729
   259 00007039 <res 00000190>          GSign resb 400
   260                                  section .text
   261                                  
   262                                  ;-69 char GWidth[VARMAX]; // 0, 1, 2, 4
   263                                  
   264                                  section .bss
   265                                  absolute 29129
   266 000071C9 <res 00000190>          GWidth resb 400
   267                                  section .text
   268                                  
   269                                  ;-70 int GData [VARMAX];
   270                                  
   271                                  section .bss
   272                                  absolute 29529
   273 00007359 <res 00000320>          GData resw 400
   274                                  section .text
   275                                  
   276                                  ;-71 char GNameField[GNAMEMAX];
   277                                  
   278                                  section .bss
   279                                  absolute 30329
   280 00007679 <res 00001900>          GNameField resb 6400
   281                                  section .text
   282                                  
   283                                  ;-72 int GTop=1;
   284                                  
   285 00000038 0100                    GTop dw 1
   286                                  
   287                                  ;-73 int LTop=LSTART;
   288                                  
   289 0000003A C800                    LTop dw 200
   290                                  
   291                                  ;-74 #define FUNCMAX       300//max functions
   292                                  
   293                                  
   294                                  ;-75 #define FNAMEMAX     4800// 16*FUNCMAX
   295                                  
   296                                  
   297                                  ;-76 char FNameField[FNAMEMAX];
   298                                  
   299                                  section .bss
   300                                  absolute 36729
   301 00008F79 <res 000012C0>          FNameField resb 4800
   302                                  section .text
   303                                  
   304                                  ;-77 int  FTop=0;
   305                                  
   306 0000003C 0000                    FTop dw 0
   307                                  
   308                                  ;-78 char fgetsdest[COLUMNMAX];
   309                                  
   310                                  section .bss
   311                                  absolute 41529
   312 0000A239 <res 00000080>          fgetsdest resb 128
   313                                  section .text
   314                                  
   315                                  ;-79 unsigned char *fgetsp=0;
   316                                  
   317 0000003E 0000                    fgetsp dw 0
   318                                  
   319                                  ;-80 unsigned int lineno=1;
   320                                  
   321 00000040 0100                    lineno dw 1
   322                                  
   323                                  ;-81 unsigned char *pt=0;
   324                                  
   325 00000042 0000                    pt dw 0
   326                                  
   327                                  ;-82 unsigned char *p1=0;
   328                                  
   329 00000044 0000                    p1 dw 0
   330                                  
   331                                  ;-83 int DOS_ERR=0;
   332                                  
   333 00000046 0000                    DOS_ERR dw 0
   334                                  
   335                                  ;-84 int DOS_NoBytes=0;
   336                                  
   337 00000048 0000                    DOS_NoBytes dw 0
   338                                  
   339                                  ;-85 char DOS_ByteRead=0;
   340                                  
   341 0000004A 00                      DOS_ByteRead db 0
   342                                  
   343                                  ;-86 int ireg1;
   344                                  
   345 0000004B 0000                    ireg1 dw 0
   346                                  
   347                                  ;-87 int mod2;
   348                                  
   349 0000004D 0000                    mod2 dw 0
   350                                  
   351                                  ;-88 int ireg2;
   352                                  
   353 0000004F 0000                    ireg2 dw 0
   354                                  
   355                                  ;-89 
   356                                  
   357                                  
   358                                  ;-90 int writetty()     { ah=0x0E; bx=0; __emit__(0xCD,0x10); }
   359                                  
   360                                  
   361                                  writetty: PROC
   362 00000051 B40E                     mov  ah, 14
   363 00000053 BB0000                   mov  bx, 0
   364 00000056 CD10                     db 205,16
   365                                  
   366                                  ;-91 int putch(char c)  {if (c==10) {al=13; writetty();} al=c; writetty(); }
   367                                  
   368 00000058 C3                       ret
   369                                  ENDP
   370                                  
   371                                  putch: PROC;
   372 00000059 C8000000                 ENTER  0,0
   373 0000005D 8A4604                   mov al, [bp+4]
   374 00000060 3C0A                     cmp al, 10
   375 00000062 0F850500                 jne .putch1
   376 00000066 B00D                     mov  al, 13
   377 00000068 E8E6FF                   call writetty
   378                                  .putch1:
   379 0000006B 8A4604                   mov  al, [bp+4]
   380 0000006E E8E0FF                   call writetty
   381                                  
   382                                  ;-92 int cputs(char *s) {char c;  while(*s) { c=*s; putch(c); s++; } }
   383 00000071 C9                       LEAVE
   384 00000072 C3                       ret
   385                                  ENDP
   386                                  
   387                                  cputs: PROC;
   388 00000073 C8020000                 ENTER  2,0
   389                                  .cputs2:
   390 00000077 8B5E04                   mov bx, [bp+4]
   391 0000007A 8A07                     mov al, [bx]
   392 0000007C B400                     mov ah, 0
   393 0000007E 08C0                     or  al, al
   394 00000080 0F841B00                 je .cputs3
   395 00000084 8B5E04                   mov bx, [bp+4]
   396 00000087 8A07                     mov al, [bx]
   397 00000089 B400                     mov ah, 0
   398 0000008B 8846FE                   mov [bp-2], al
   399 0000008E 8A46FE                   mov al, byte [bp-2]
   400 00000091 B400                     mov ah, 0
   401 00000093 50                       push ax
   402 00000094 E8C2FF                   call putch
   403 00000097 83C402                   add  sp, 2
   404 0000009A FF4604                   inc  word[bp+4]
   405 0000009D EBD8                     jmp .cputs2
   406                                  .cputs3:
   407                                  
   408                                  ;-93 int mkneg(int n)   { n; __asm {neg ax} }
   409 0000009F C9                       LEAVE
   410 000000A0 C3                       ret
   411                                  ENDP
   412                                  
   413                                  mkneg: PROC;
   414 000000A1 C8000000                 ENTER  0,0
   415 000000A5 8B4604                   mov ax, [bp+4]
   416 000000A8 F7D8                    neg ax
   417                                  
   418                                  ;-94 
   419                                  
   420                                  
   421                                  ;-95 int DosInt() {
   422 000000AA C9                       LEAVE
   423 000000AB C3                       ret
   424                                  ENDP
   425                                  
   426                                  DosInt: PROC
   427                                  
   428                                  ;-96     __emit__(0xCD,0x21);//inth 0x21;
   429                                  
   430 000000AC CD21                     db 205,33
   431                                  
   432                                  ;-97     __emit__(0x73, 04); //ifcarry DOS_ERR++;
   433                                  
   434 000000AE 7304                     db 115,4
   435                                  
   436                                  ;-98     DOS_ERR++;
   437                                  
   438 000000B0 FF06[4600]               inc  word[DOS_ERR]
   439                                  
   440                                  ;-99 }
   441                                  
   442                                  
   443                                  ;-100 int openR (char *s) { dx=s;       ax=0x3D02; DosInt(); }
   444                                  
   445 000000B4 C3                       ret
   446                                  ENDP
   447                                  
   448                                  openR: PROC;
   449 000000B5 C8000000                 ENTER  0,0
   450 000000B9 8B5604                   mov  dx, [bp+4]
   451 000000BC B8023D                   mov  ax, 15618
   452 000000BF E8EAFF                   call DosInt
   453                                  
   454                                  ;-101 int creatR(char *s) { dx=s; cx=0; ax=0x3C00; DosInt(); }
   455 000000C2 C9                       LEAVE
   456 000000C3 C3                       ret
   457                                  ENDP
   458                                  
   459                                  creatR: PROC;
   460 000000C4 C8000000                 ENTER  0,0
   461 000000C8 8B5604                   mov  dx, [bp+4]
   462 000000CB B90000                   mov  cx, 0
   463 000000CE B8003C                   mov  ax, 15360
   464 000000D1 E8D8FF                   call DosInt
   465                                  
   466                                  ;-102 int fcloseR(int fd) {bx=fd;       ax=0x3E00; DosInt(); }
   467 000000D4 C9                       LEAVE
   468 000000D5 C3                       ret
   469                                  ENDP
   470                                  
   471                                  fcloseR: PROC;
   472 000000D6 C8000000                 ENTER  0,0
   473 000000DA 8B5E04                   mov  bx, [bp+4]
   474 000000DD B8003E                   mov  ax, 15872
   475 000000E0 E8C9FF                   call DosInt
   476                                  
   477                                  ;-103 int exitR  (char c) {ah=0x4C; al=c;          DosInt(); }
   478 000000E3 C9                       LEAVE
   479 000000E4 C3                       ret
   480                                  ENDP
   481                                  
   482                                  exitR: PROC;
   483 000000E5 C8000000                 ENTER  0,0
   484 000000E9 B44C                     mov  ah, 76
   485 000000EB 8A4604                   mov  al, [bp+4]
   486 000000EE E8BBFF                   call DosInt
   487                                  
   488                                  ;-104 int readRL(char *s, int fd, int len){
   489 000000F1 C9                       LEAVE
   490 000000F2 C3                       ret
   491                                  ENDP
   492                                  
   493                                  readRL: PROC
   494                                  
   495                                  ;-105     dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}
   496                                  ;
   497 000000F3 C8000000                 ENTER  0,0
   498 000000F7 8B5604                   mov  dx, [bp+4]
   499 000000FA 8B4E08                   mov  cx, [bp+8]
   500 000000FD 8B5E06                   mov  bx, [bp+6]
   501 00000100 B8003F                   mov  ax, 16128
   502 00000103 E8A6FF                   call DosInt
   503                                  
   504                                  ;-106 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
   505 00000106 C9                       LEAVE
   506 00000107 C3                       ret
   507                                  ENDP
   508                                  
   509                                  fputcR: PROC;
   510 00000108 C8000000                 ENTER  0,0
   511 0000010C 8D5604                  lea dx, [bp+4]
   512                                  
   513                                  ;-107   cx=1; bx=fd; ax=0x4000; DosInt(); }
   514                                  
   515 0000010F B90100                   mov  cx, 1
   516 00000112 8B5E06                   mov  bx, [bp+6]
   517 00000115 B80040                   mov  ax, 16384
   518 00000118 E891FF                   call DosInt
   519                                  
   520                                  ;-108 
   521                                  
   522                                  
   523                                  ;-109   int letter(char c) {
   524 0000011B C9                       LEAVE
   525 0000011C C3                       ret
   526                                  ENDP
   527                                  
   528                                  letter: PROC
   529                                  
   530                                  ;-110       if (c=='_') return 1;
   531                                  ;
   532 0000011D C8000000                 ENTER  0,0
   533 00000121 8A4604                   mov al, [bp+4]
   534 00000124 3C5F                     cmp al, 95
   535 00000126 0F850600                 jne .letter4
   536 0000012A B80100                   mov ax, 1
   537 0000012D E96900                   jmp .retnletter
   538                                  
   539                                  ;-111       if (c=='.') return 1;
   540                                  
   541                                  .letter4:
   542 00000130 8A4604                   mov al, [bp+4]
   543 00000133 3C2E                     cmp al, 46
   544 00000135 0F850600                 jne .letter5
   545 00000139 B80100                   mov ax, 1
   546 0000013C E95A00                   jmp .retnletter
   547                                  
   548                                  ;-112       if (c=='?') return 1;
   549                                  
   550                                  .letter5:
   551 0000013F 8A4604                   mov al, [bp+4]
   552 00000142 3C3F                     cmp al, 63
   553 00000144 0F850600                 jne .letter6
   554 00000148 B80100                   mov ax, 1
   555 0000014B E94B00                   jmp .retnletter
   556                                  
   557                                  ;-113       if (c=='$') return 1;
   558                                  
   559                                  .letter6:
   560 0000014E 8A4604                   mov al, [bp+4]
   561 00000151 3C24                     cmp al, 36
   562 00000153 0F850600                 jne .letter7
   563 00000157 B80100                   mov ax, 1
   564 0000015A E93C00                   jmp .retnletter
   565                                  
   566                                  ;-114       if (c> 'z') return 0;
   567                                  
   568                                  .letter7:
   569 0000015D 8A4604                   mov al, [bp+4]
   570 00000160 3C7A                     cmp al, 122
   571 00000162 0F8E0600                 jle .letter8
   572 00000166 B80000                   mov ax, 0
   573 00000169 E92D00                   jmp .retnletter
   574                                  
   575                                  ;-115       if (c< '@') return 0;// at included
   576                                  
   577                                  .letter8:
   578 0000016C 8A4604                   mov al, [bp+4]
   579 0000016F 3C40                     cmp al, 64
   580 00000171 0F8D0600                 jge .letter9
   581 00000175 B80000                   mov ax, 0
   582 00000178 E91E00                   jmp .retnletter
   583                                  
   584                                  ;-116       if (c> 'Z') { if (c< 'a') return 0; }
   585                                  
   586                                  .letter9:
   587 0000017B 8A4604                   mov al, [bp+4]
   588 0000017E 3C5A                     cmp al, 90
   589 00000180 0F8E0F00                 jle .letter10
   590 00000184 8A4604                   mov al, [bp+4]
   591 00000187 3C61                     cmp al, 97
   592 00000189 0F8D0600                 jge .letter11
   593 0000018D B80000                   mov ax, 0
   594 00000190 E90600                   jmp .retnletter
   595                                  .letter11:
   596                                  
   597                                  ;-117       return 1;
   598                                  
   599                                  .letter10:
   600 00000193 B80100                   mov ax, 1
   601 00000196 E90000                   jmp .retnletter
   602                                  
   603                                  ;-118   }
   604                                  
   605                                  
   606                                  ;-119   int digit(char c){
   607                                  
   608 00000199 C9                       .retnletter: LEAVE
   609 0000019A C3                       ret
   610                                  ENDP
   611                                  
   612                                  digit: PROC
   613                                  
   614                                  ;-120       if(c<'0') return 0;
   615                                  ;
   616 0000019B C8000000                 ENTER  0,0
   617 0000019F 8A4604                   mov al, [bp+4]
   618 000001A2 3C30                     cmp al, 48
   619 000001A4 0F8D0600                 jge .digit12
   620 000001A8 B80000                   mov ax, 0
   621 000001AB E91500                   jmp .retndigit
   622                                  
   623                                  ;-121       if(c>'9') return 0;
   624                                  
   625                                  .digit12:
   626 000001AE 8A4604                   mov al, [bp+4]
   627 000001B1 3C39                     cmp al, 57
   628 000001B3 0F8E0600                 jle .digit13
   629 000001B7 B80000                   mov ax, 0
   630 000001BA E90600                   jmp .retndigit
   631                                  
   632                                  ;-122       return 1;
   633                                  
   634                                  .digit13:
   635 000001BD B80100                   mov ax, 1
   636 000001C0 E90000                   jmp .retndigit
   637                                  
   638                                  ;-123   }
   639                                  
   640                                  
   641                                  ;-124   int alnum(char c) {
   642                                  
   643 000001C3 C9                       .retndigit: LEAVE
   644 000001C4 C3                       ret
   645                                  ENDP
   646                                  
   647                                  alnum: PROC
   648                                  
   649                                  ;-125     if (digit (c)) return 1;
   650                                  ;
   651 000001C5 C8000000                 ENTER  0,0
   652 000001C9 8A4604                   mov al, byte [bp+4]
   653 000001CC B400                     mov ah, 0
   654 000001CE 50                       push ax
   655 000001CF E8C9FF                   call digit
   656 000001D2 83C402                   add  sp, 2
   657 000001D5 08C0                     or  al, al
   658 000001D7 0F840600                 je .alnum14
   659 000001DB B80100                   mov ax, 1
   660 000001DE E91E00                   jmp .retnalnum
   661                                  
   662                                  ;-126     if (letter(c)) return 1;
   663                                  
   664                                  .alnum14:
   665 000001E1 8A4604                   mov al, byte [bp+4]
   666 000001E4 B400                     mov ah, 0
   667 000001E6 50                       push ax
   668 000001E7 E833FF                   call letter
   669 000001EA 83C402                   add  sp, 2
   670 000001ED 08C0                     or  al, al
   671 000001EF 0F840600                 je .alnum15
   672 000001F3 B80100                   mov ax, 1
   673 000001F6 E90600                   jmp .retnalnum
   674                                  
   675                                  ;-127     return 0;
   676                                  
   677                                  .alnum15:
   678 000001F9 B80000                   mov ax, 0
   679 000001FC E90000                   jmp .retnalnum
   680                                  
   681                                  ;-128   }
   682                                  
   683                                  
   684                                  ;-129 
   685                                  
   686                                  
   687                                  ;-130 int strlen(char *s) { int c;
   688                                  
   689 000001FF C9                       .retnalnum: LEAVE
   690 00000200 C3                       ret
   691                                  ENDP
   692                                  
   693                                  strlen: PROC
   694                                  
   695                                  ;-131     c=0;
   696                                  ;
   697 00000201 C8020000                 ENTER  2,0
   698 00000205 B80000                   mov ax, 0
   699 00000208 8946FE                   mov [bp-2], ax
   700                                  
   701                                  ;-132     while (*s!=0) {s++; c++;}
   702                                  
   703                                  .strlen16:
   704 0000020B 8B5E04                   mov bx, [bp+4]
   705 0000020E 8A07                     mov al, [bx]
   706 00000210 B400                     mov ah, 0
   707 00000212 83F800                   cmp ax, 0
   708 00000215 0F840800                 je  .strlen17
   709 00000219 FF4604                   inc  word[bp+4]
   710 0000021C FF46FE                   inc  word[bp-2]
   711                                  
   712                                  ;-133     return c;
   713                                  
   714 0000021F EBEA                     jmp .strlen16
   715                                  .strlen17:
   716 00000221 8B46FE                   mov ax, [bp-2]
   717 00000224 E90000                   jmp .retnstrlen
   718                                  
   719                                  ;-134 }
   720                                  
   721                                  
   722                                  ;-135 int strcpy(char *s, char *t) {
   723                                  
   724 00000227 C9                       .retnstrlen: LEAVE
   725 00000228 C3                       ret
   726                                  ENDP
   727                                  
   728                                  strcpy: PROC
   729                                  
   730                                  ;-136     do { *s=*t; s++; t++; }
   731                                  ;
   732 00000229 C8000000                 ENTER  0,0
   733                                  .strcpy18:
   734 0000022D 8B5E06                   mov bx, [bp+6]
   735 00000230 8A07                     mov al, [bx]
   736 00000232 B400                     mov ah, 0
   737 00000234 8B5E04                   mov  bx, [bp+4]
   738 00000237 8807                     mov  [bx], al
   739 00000239 FF4604                   inc  word[bp+4]
   740 0000023C FF4606                   inc  word[bp+6]
   741                                  
   742                                  ;-137     while (*t!=0);
   743                                  
   744 0000023F 8B5E06                   mov bx, [bp+6]
   745 00000242 8A07                     mov al, [bx]
   746 00000244 B400                     mov ah, 0
   747 00000246 83F800                   cmp ax, 0
   748 00000249 0F840200                 je  .strcpy19
   749 0000024D EBDE                     jmp .strcpy18
   750                                  .strcpy19:
   751                                  
   752                                  ;-138     *s=0;
   753                                  
   754 0000024F B80000                   mov ax, 0
   755 00000252 8B5E04                   mov  bx, [bp+4]
   756 00000255 8807                     mov  [bx], al
   757                                  
   758                                  ;-139     return s;
   759                                  
   760 00000257 8B4604                   mov ax, [bp+4]
   761 0000025A E90000                   jmp .retnstrcpy
   762                                  
   763                                  ;-140 }
   764                                  
   765                                  
   766                                  ;-141 int eqstr(char *p, char *q) {
   767                                  
   768 0000025D C9                       .retnstrcpy: LEAVE
   769 0000025E C3                       ret
   770                                  ENDP
   771                                  
   772                                  eqstr: PROC
   773                                  
   774                                  ;-142     while(*p) {
   775                                  ;
   776 0000025F C8000000                 ENTER  0,0
   777                                  .eqstr20:
   778 00000263 8B5E04                   mov bx, [bp+4]
   779 00000266 8A07                     mov al, [bx]
   780 00000268 B400                     mov ah, 0
   781 0000026A 08C0                     or  al, al
   782 0000026C 0F842000                 je .eqstr21
   783                                  
   784                                  ;-143         if (*p != *q) return 0;
   785                                  
   786 00000270 8B5E04                   mov bx, [bp+4]
   787 00000273 8A07                     mov al, [bx]
   788 00000275 B400                     mov ah, 0
   789 00000277 8B5E06                   mov bx, [bp+6]
   790 0000027A 3A07                     cmp al, [bx]
   791 0000027C B400                     mov ah, 0
   792 0000027E 0F840600                 je  .eqstr22
   793 00000282 B80000                   mov ax, 0
   794 00000285 E92100                   jmp .retneqstr
   795                                  
   796                                  ;-144         p++;
   797                                  
   798                                  .eqstr22:
   799 00000288 FF4604                   inc  word[bp+4]
   800                                  
   801                                  ;-145         q++;
   802                                  
   803 0000028B FF4606                   inc  word[bp+6]
   804                                  
   805                                  ;-146     }
   806                                  
   807                                  
   808                                  ;-147     if(*q) return 0;
   809                                  
   810 0000028E EBD3                     jmp .eqstr20
   811                                  .eqstr21:
   812 00000290 8B5E06                   mov bx, [bp+6]
   813 00000293 8A07                     mov al, [bx]
   814 00000295 B400                     mov ah, 0
   815 00000297 08C0                     or  al, al
   816 00000299 0F840600                 je .eqstr23
   817 0000029D B80000                   mov ax, 0
   818 000002A0 E90600                   jmp .retneqstr
   819                                  
   820                                  ;-148     return 1; }
   821                                  
   822                                  .eqstr23:
   823 000002A3 B80100                   mov ax, 1
   824 000002A6 E90000                   jmp .retneqstr
   825                                  
   826                                  ;-149 int strcat1(char *s, char *t) {
   827                                  
   828 000002A9 C9                       .retneqstr: LEAVE
   829 000002AA C3                       ret
   830                                  ENDP
   831                                  
   832                                  strcat1: PROC
   833                                  
   834                                  ;-150     while (*s != 0) s++;
   835                                  ;
   836 000002AB C8000000                 ENTER  0,0
   837                                  .strcat124:
   838 000002AF 8B5E04                   mov bx, [bp+4]
   839 000002B2 8A07                     mov al, [bx]
   840 000002B4 B400                     mov ah, 0
   841 000002B6 83F800                   cmp ax, 0
   842 000002B9 0F840500                 je  .strcat125
   843 000002BD FF4604                   inc  word[bp+4]
   844                                  
   845                                  ;-151     strcpy(s, t);
   846                                  
   847 000002C0 EBED                     jmp .strcat124
   848                                  .strcat125:
   849 000002C2 FF7606                   push word [bp+6]
   850 000002C5 FF7604                   push word [bp+4]
   851 000002C8 E85EFF                   call strcpy
   852 000002CB 83C404                   add  sp, 4
   853                                  
   854                                  ;-152 }
   855                                  
   856                                  
   857                                  ;-153 int toupper(char *s) {
   858 000002CE C9                       LEAVE
   859 000002CF C3                       ret
   860                                  ENDP
   861                                  
   862                                  toupper: PROC
   863                                  
   864                                  ;-154     while(*s) {
   865                                  ;
   866 000002D0 C8000000                 ENTER  0,0
   867                                  .toupper26:
   868 000002D4 8B5E04                   mov bx, [bp+4]
   869 000002D7 8A07                     mov al, [bx]
   870 000002D9 B400                     mov ah, 0
   871 000002DB 08C0                     or  al, al
   872 000002DD 0F843000                 je .toupper27
   873                                  
   874                                  ;-155         if (*s >= 'a') if (*s <= 'z') *s=*s-32;
   875                                  
   876 000002E1 8B5E04                   mov bx, [bp+4]
   877 000002E4 8A07                     mov al, [bx]
   878 000002E6 B400                     mov ah, 0
   879 000002E8 83F861                   cmp ax, 97 ;unsigned : 1
   880 000002EB 0F8C1D00                 jl  .toupper28
   881 000002EF 8B5E04                   mov bx, [bp+4]
   882 000002F2 8A07                     mov al, [bx]
   883 000002F4 B400                     mov ah, 0
   884 000002F6 83F87A                   cmp ax, 122
   885 000002F9 0F8F0F00                 jg  .toupper29
   886 000002FD 8B5E04                   mov bx, [bp+4]
   887 00000300 8A07                     mov al, [bx]
   888 00000302 B400                     mov ah, 0
   889 00000304 83E820                   sub ax, 32
   890 00000307 8B5E04                   mov  bx, [bp+4]
   891 0000030A 8807                     mov  [bx], al
   892                                  
   893                                  ;-156         s++;
   894                                  
   895                                  .toupper29:
   896                                  .toupper28:
   897 0000030C FF4604                   inc  word[bp+4]
   898                                  
   899                                  ;-157     }
   900                                  
   901                                  
   902                                  ;-158 }
   903                                  
   904 0000030F EBC3                     jmp .toupper26
   905                                  .toupper27:
   906                                  
   907                                  ;-159 int instr1(char *s, char c) {
   908 00000311 C9                       LEAVE
   909 00000312 C3                       ret
   910                                  ENDP
   911                                  
   912                                  instr1: PROC
   913                                  
   914                                  ;-160     while(*s) {
   915                                  ;
   916 00000313 C8000000                 ENTER  0,0
   917                                  .instr130:
   918 00000317 8B5E04                   mov bx, [bp+4]
   919 0000031A 8A07                     mov al, [bx]
   920 0000031C B400                     mov ah, 0
   921 0000031E 08C0                     or  al, al
   922 00000320 0F841900                 je .instr131
   923                                  
   924                                  ;-161         if (*s==c) return 1;
   925                                  
   926 00000324 8B5E04                   mov bx, [bp+4]
   927 00000327 8A07                     mov al, [bx]
   928 00000329 B400                     mov ah, 0
   929 0000032B 3A4606                   cmp al, [bp+6]
   930 0000032E 0F850600                 jne .instr132
   931 00000332 B80100                   mov ax, 1
   932 00000335 E90B00                   jmp .retninstr1
   933                                  
   934                                  ;-162         s++;
   935                                  
   936                                  .instr132:
   937 00000338 FF4604                   inc  word[bp+4]
   938                                  
   939                                  ;-163     }
   940                                  
   941                                  
   942                                  ;-164     return 0;
   943                                  
   944 0000033B EBDA                     jmp .instr130
   945                                  .instr131:
   946 0000033D B80000                   mov ax, 0
   947 00000340 E90000                   jmp .retninstr1
   948                                  
   949                                  ;-165 }
   950                                  
   951                                  
   952                                  ;-166 
   953                                  
   954                                  
   955                                  ;-167 int eprc(char c)  {
   956                                  
   957 00000343 C9                       .retninstr1: LEAVE
   958 00000344 C3                       ret
   959                                  ENDP
   960                                  
   961                                  eprc: PROC
   962                                  
   963                                  ;-168     *cloc=c;
   964                                  ;
   965 00000345 C8000000                 ENTER  0,0
   966 00000349 8A4604                   mov al, [bp+4]
   967 0000034C 8B1E[1800]               mov  bx, [cloc]
   968 00000350 8807                     mov  [bx], al
   969                                  
   970                                  ;-169     cloc++;
   971                                  
   972 00000352 FF06[1800]               inc  word[cloc]
   973                                  
   974                                  ;-170 }
   975                                  
   976                                  
   977                                  ;-171 int eprs(char *s) {
   978 00000356 C9                       LEAVE
   979 00000357 C3                       ret
   980                                  ENDP
   981                                  
   982                                  eprs: PROC
   983                                  
   984                                  ;-172     char c;
   985                                  
   986                                  
   987                                  ;-173     while(*s) {
   988                                  ;
   989 00000358 C8020000                 ENTER  2,0
   990                                  .eprs33:
   991 0000035C 8B5E04                   mov bx, [bp+4]
   992 0000035F 8A07                     mov al, [bx]
   993 00000361 B400                     mov ah, 0
   994 00000363 08C0                     or  al, al
   995 00000365 0F841B00                 je .eprs34
   996                                  
   997                                  ;-174         c=*s;
   998                                  
   999 00000369 8B5E04                   mov bx, [bp+4]
  1000 0000036C 8A07                     mov al, [bx]
  1001 0000036E B400                     mov ah, 0
  1002 00000370 8846FE                   mov [bp-2], al
  1003                                  
  1004                                  ;-175         eprc(c);
  1005                                  
  1006 00000373 8A46FE                   mov al, byte [bp-2]
  1007 00000376 B400                     mov ah, 0
  1008 00000378 50                       push ax
  1009 00000379 E8C9FF                   call eprc
  1010 0000037C 83C402                   add  sp, 2
  1011                                  
  1012                                  ;-176         s++;
  1013                                  
  1014 0000037F FF4604                   inc  word[bp+4]
  1015                                  
  1016                                  ;-177     }
  1017                                  
  1018                                  
  1019                                  ;-178 }
  1020                                  
  1021 00000382 EBD8                     jmp .eprs33
  1022                                  .eprs34:
  1023                                  
  1024                                  ;-179 int prc(unsigned char c) {
  1025 00000384 C9                       LEAVE
  1026 00000385 C3                       ret
  1027                                  ENDP
  1028                                  
  1029                                  prc: PROC
  1030                                  
  1031                                  ;-180     if (c==10) {
  1032                                  ;
  1033 00000386 C8000000                 ENTER  0,0
  1034 0000038A 8A4604                   mov al, [bp+4]
  1035 0000038D 3C0A                     cmp al, 10
  1036 0000038F 0F850600                 jne .prc35
  1037                                  
  1038                                  ;-181         _AX=13;
  1039                                  
  1040 00000393 B80D00                   mov  ax, 13
  1041                                  
  1042                                  ;-182         writetty();
  1043                                  
  1044 00000396 E8B8FC                   call writetty
  1045                                  
  1046                                  ;-183     }
  1047                                  
  1048                                  
  1049                                  ;-184     _AL=c;
  1050                                  
  1051                                  .prc35:
  1052 00000399 8A4604                   mov  al, [bp+4]
  1053                                  
  1054                                  ;-185     writetty();
  1055                                  
  1056 0000039C E8B2FC                   call writetty
  1057                                  
  1058                                  ;-186     fputcR(c, fdout);
  1059                                  
  1060 0000039F FF36[1C00]               push word [fdout]
  1061 000003A3 8A4604                   mov al, byte [bp+4]
  1062 000003A6 B400                     mov ah, 0
  1063 000003A8 50                       push ax
  1064 000003A9 E85CFD                   call fputcR
  1065 000003AC 83C404                   add  sp, 4
  1066                                  
  1067                                  ;-187 }
  1068                                  
  1069                                  
  1070                                  ;-188 int prscomment(unsigned char *s) {
  1071 000003AF C9                       LEAVE
  1072 000003B0 C3                       ret
  1073                                  ENDP
  1074                                  
  1075                                  prscomment: PROC
  1076                                  
  1077                                  ;-189     unsigned char c;
  1078                                  
  1079                                  
  1080                                  ;-190     while(*s){
  1081                                  ;
  1082 000003B1 C8020000                 ENTER  2,0
  1083                                  .prscomment36:
  1084 000003B5 8B5E04                   mov bx, [bp+4]
  1085 000003B8 8A07                     mov al, [bx]
  1086 000003BA B400                     mov ah, 0
  1087 000003BC 08C0                     or  al, al
  1088 000003BE 0F841B00                 je .prscomment37
  1089                                  
  1090                                  ;-191         c=*s;
  1091                                  
  1092 000003C2 8B5E04                   mov bx, [bp+4]
  1093 000003C5 8A07                     mov al, [bx]
  1094 000003C7 B400                     mov ah, 0
  1095 000003C9 8846FE                   mov [bp-2], al
  1096                                  
  1097                                  ;-192         prc(c);
  1098                                  
  1099 000003CC 8A46FE                   mov al, byte [bp-2]
  1100 000003CF B400                     mov ah, 0
  1101 000003D1 50                       push ax
  1102 000003D2 E8B1FF                   call prc
  1103 000003D5 83C402                   add  sp, 2
  1104                                  
  1105                                  ;-193         s++;
  1106                                  
  1107 000003D8 FF4604                   inc  word[bp+4]
  1108                                  
  1109                                  ;-194     }
  1110                                  
  1111                                  
  1112                                  ;-195 }
  1113                                  
  1114 000003DB EBD8                     jmp .prscomment36
  1115                                  .prscomment37:
  1116                                  
  1117                                  ;-196 int prs(unsigned char *s) {
  1118 000003DD C9                       LEAVE
  1119 000003DE C3                       ret
  1120                                  ENDP
  1121                                  
  1122                                  prs: PROC
  1123                                  
  1124                                  ;-197     unsigned char c; int com;
  1125                                  
  1126                                  
  1127                                  ;-198     com=0;
  1128                                  ;
  1129 000003DF C8040000                 ENTER  4,0
  1130 000003E3 B80000                   mov ax, 0
  1131 000003E6 8946FC                   mov [bp-4], ax
  1132                                  
  1133                                  ;-199     while(*s) {
  1134                                  
  1135                                  .prs38:
  1136 000003E9 8B5E04                   mov bx, [bp+4]
  1137 000003EC 8A07                     mov al, [bx]
  1138 000003EE B400                     mov ah, 0
  1139 000003F0 08C0                     or  al, al
  1140 000003F2 0F847B00                 je .prs39
  1141                                  
  1142                                  ;-200         c=*s;
  1143                                  
  1144 000003F6 8B5E04                   mov bx, [bp+4]
  1145 000003F9 8A07                     mov al, [bx]
  1146 000003FB B400                     mov ah, 0
  1147 000003FD 8846FE                   mov [bp-2], al
  1148                                  
  1149                                  ;-201         if (c==34) if (com) com=0;
  1150                                  
  1151 00000400 8A46FE                   mov al, [bp-2]
  1152 00000403 3C22                     cmp al, 34
  1153 00000405 0F851800                 jne .prs40
  1154 00000409 8B46FC                   mov ax, [bp-4]
  1155 0000040C 08C0                     or  al, al
  1156 0000040E 0F840900                 je .prs41
  1157 00000412 B80000                   mov ax, 0
  1158 00000415 8946FC                   mov [bp-4], ax
  1159                                  
  1160                                  ;-202                    else com=1;
  1161                                  
  1162 00000418 E90600                   jmp .prs42
  1163                                  .prs41:
  1164 0000041B B80100                   mov ax, 1
  1165 0000041E 8946FC                   mov [bp-4], ax
  1166                                  
  1167                                  ;-203         if (c==92) {
  1168                                  
  1169                                  .prs42:
  1170                                  .prs40:
  1171 00000421 8A46FE                   mov al, [bp-2]
  1172 00000424 3C5C                     cmp al, 92
  1173 00000426 0F853500                 jne .prs43
  1174                                  
  1175                                  ;-204             if (com==0) {
  1176                                  
  1177 0000042A 8B46FC                   mov ax, [bp-4]
  1178 0000042D 83F800                   cmp ax, 0
  1179 00000430 0F852B00                 jne .prs44
  1180                                  
  1181                                  ;-205                 s++;
  1182                                  
  1183 00000434 FF4604                   inc  word[bp+4]
  1184                                  
  1185                                  ;-206                 c=*s;
  1186                                  
  1187 00000437 8B5E04                   mov bx, [bp+4]
  1188 0000043A 8A07                     mov al, [bx]
  1189 0000043C B400                     mov ah, 0
  1190 0000043E 8846FE                   mov [bp-2], al
  1191                                  
  1192                                  ;-207                 if (c=='n') c=10;
  1193                                  
  1194 00000441 8A46FE                   mov al, [bp-2]
  1195 00000444 3C6E                     cmp al, 110
  1196 00000446 0F850600                 jne .prs45
  1197 0000044A B80A00                   mov ax, 10
  1198 0000044D 8846FE                   mov [bp-2], al
  1199                                  
  1200                                  ;-208                 if (c=='t') c= 9;
  1201                                  
  1202                                  .prs45:
  1203 00000450 8A46FE                   mov al, [bp-2]
  1204 00000453 3C74                     cmp al, 116
  1205 00000455 0F850600                 jne .prs46
  1206 00000459 B80900                   mov ax, 9
  1207 0000045C 8846FE                   mov [bp-2], al
  1208                                  
  1209                                  ;-209             }
  1210                                  
  1211                                  .prs46:
  1212                                  
  1213                                  ;-210         }
  1214                                  
  1215                                  .prs44:
  1216                                  
  1217                                  ;-211         prc(c);
  1218                                  
  1219                                  .prs43:
  1220 0000045F 8A46FE                   mov al, byte [bp-2]
  1221 00000462 B400                     mov ah, 0
  1222 00000464 50                       push ax
  1223 00000465 E81EFF                   call prc
  1224 00000468 83C402                   add  sp, 2
  1225                                  
  1226                                  ;-212         s++;
  1227                                  
  1228 0000046B FF4604                   inc  word[bp+4]
  1229                                  
  1230                                  ;-213     }
  1231                                  
  1232                                  
  1233                                  ;-214 }
  1234                                  
  1235 0000046E E978FF                   jmp .prs38
  1236                                  .prs39:
  1237                                  
  1238                                  ;-215 int prnl() {
  1239 00000471 C9                       LEAVE
  1240 00000472 C3                       ret
  1241                                  ENDP
  1242                                  
  1243                                  prnl: PROC
  1244                                  
  1245                                  ;-216     prs("\n ");
  1246                                  
  1247 00000473 68[7D04]                 push prnl_0
  1248 00000476 E866FF                   call prs
  1249 00000479 83C402                   add  sp, 2
  1250                                  
  1251                                  ;-217 }
  1252                                  
  1253                                  
  1254                                  ;-218 
  1255                                  
  1256                                  
  1257                                  ;-219 
  1258                                  
  1259                                  
  1260                                  ;-220 int eprnum(int n){//for docall1 procedure
  1261                                  
  1262 0000047C C3                       ret
  1263 0000047D 5C6E2000                prnl_0 db "\n ",0
  1264                                  ENDP
  1265                                  
  1266                                  eprnum: PROC
  1267                                  
  1268                                  ;-221     int e;
  1269                                  
  1270                                  
  1271                                  ;-222     if(n<0) {
  1272                                  ;
  1273 00000481 C8020000                 ENTER  2,0
  1274 00000485 8B4604                   mov ax, [bp+4]
  1275 00000488 83F800                   cmp ax, 0
  1276 0000048B 0F8D1400                 jge .eprnum47
  1277                                  
  1278                                  ;-223         eprc('-');
  1279                                  
  1280 0000048F 6A2D                     push 45
  1281 00000491 E8B1FE                   call eprc
  1282 00000494 83C402                   add  sp, 2
  1283                                  
  1284                                  ;-224         n=mkneg(n);
  1285                                  
  1286 00000497 FF7604                   push word [bp+4]
  1287 0000049A E804FC                   call mkneg
  1288 0000049D 83C402                   add  sp, 2
  1289 000004A0 894604                   mov [bp+4], ax
  1290                                  
  1291                                  ;-225     }
  1292                                  
  1293                                  
  1294                                  ;-226     if (n >= 10) {
  1295                                  
  1296                                  .eprnum47:
  1297 000004A3 8B4604                   mov ax, [bp+4]
  1298 000004A6 83F80A                   cmp ax, 10 ;unsigned : 1
  1299 000004A9 0F8C1500                 jl  .eprnum48
  1300                                  
  1301                                  ;-227         e=n/10;
  1302                                  
  1303 000004AD 8B4604                   mov ax, [bp+4]
  1304 000004B0 BB0A00                   mov bx, 10
  1305 000004B3 99                       cwd
  1306 000004B4 F7FB                     idiv bx
  1307 000004B6 8946FE                   mov [bp-2], ax
  1308                                  
  1309                                  ;-228         eprnum(e);
  1310                                  
  1311 000004B9 FF76FE                   push word [bp-2]
  1312 000004BC E8C2FF                   call eprnum
  1313 000004BF 83C402                   add  sp, 2
  1314                                  
  1315                                  ;-229     }
  1316                                  
  1317                                  
  1318                                  ;-230     n=n%10;
  1319                                  
  1320                                  .eprnum48:
  1321 000004C2 8B4604                   mov ax, [bp+4]
  1322 000004C5 BB0A00                   mov bx, 10
  1323 000004C8 99                       cwd
  1324 000004C9 F7FB                     idiv bx
  1325 000004CB 89D0                     mov ax, dx
  1326 000004CD 894604                   mov [bp+4], ax
  1327                                  
  1328                                  ;-231     n=n+'0';
  1329                                  
  1330 000004D0 8B4604                   mov ax, [bp+4]
  1331 000004D3 83C030                   add ax, 48
  1332 000004D6 894604                   mov [bp+4], ax
  1333                                  
  1334                                  ;-232     eprc(n);
  1335                                  
  1336 000004D9 FF7604                   push word [bp+4]
  1337 000004DC E866FE                   call eprc
  1338 000004DF 83C402                   add  sp, 2
  1339                                  
  1340                                  ;-233 }
  1341                                  
  1342                                  
  1343                                  ;-234 int pint1 (int n){
  1344 000004E2 C9                       LEAVE
  1345 000004E3 C3                       ret
  1346                                  ENDP
  1347                                  
  1348                                  pint1: PROC
  1349                                  
  1350                                  ;-235     int e;
  1351                                  
  1352                                  
  1353                                  ;-236     if(n<0) {  prc('-');  n=mkneg(n); }
  1354                                  ;
  1355 000004E4 C8020000                 ENTER  2,0
  1356 000004E8 8B4604                   mov ax, [bp+4]
  1357 000004EB 83F800                   cmp ax, 0
  1358 000004EE 0F8D1400                 jge .pint149
  1359 000004F2 6A2D                     push 45
  1360 000004F4 E88FFE                   call prc
  1361 000004F7 83C402                   add  sp, 2
  1362 000004FA FF7604                   push word [bp+4]
  1363 000004FD E8A1FB                   call mkneg
  1364 00000500 83C402                   add  sp, 2
  1365 00000503 894604                   mov [bp+4], ax
  1366                                  
  1367                                  ;-237     if (n >= 10) {
  1368                                  
  1369                                  .pint149:
  1370 00000506 8B4604                   mov ax, [bp+4]
  1371 00000509 83F80A                   cmp ax, 10 ;unsigned : 1
  1372 0000050C 0F8C1500                 jl  .pint150
  1373                                  
  1374                                  ;-238         e=n/10;
  1375                                  
  1376 00000510 8B4604                   mov ax, [bp+4]
  1377 00000513 BB0A00                   mov bx, 10
  1378 00000516 99                       cwd
  1379 00000517 F7FB                     idiv bx
  1380 00000519 8946FE                   mov [bp-2], ax
  1381                                  
  1382                                  ;-239         pint1(e);
  1383                                  
  1384 0000051C FF76FE                   push word [bp-2]
  1385 0000051F E8C2FF                   call pint1
  1386 00000522 83C402                   add  sp, 2
  1387                                  
  1388                                  ;-240     }
  1389                                  
  1390                                  
  1391                                  ;-241     n=n%10;
  1392                                  
  1393                                  .pint150:
  1394 00000525 8B4604                   mov ax, [bp+4]
  1395 00000528 BB0A00                   mov bx, 10
  1396 0000052B 99                       cwd
  1397 0000052C F7FB                     idiv bx
  1398 0000052E 89D0                     mov ax, dx
  1399 00000530 894604                   mov [bp+4], ax
  1400                                  
  1401                                  ;-242     n += '0';
  1402                                  
  1403 00000533 83460430                 add  word[bp+4], 48
  1404                                  
  1405                                  ;-243     prc(n);
  1406                                  
  1407 00000537 FF7604                   push word [bp+4]
  1408 0000053A E849FE                   call prc
  1409 0000053D 83C402                   add  sp, 2
  1410                                  
  1411                                  ;-244 }
  1412                                  
  1413                                  
  1414                                  ;-245 int prunsign1(unsigned int n) {
  1415 00000540 C9                       LEAVE
  1416 00000541 C3                       ret
  1417                                  ENDP
  1418                                  
  1419                                  prunsign1: PROC
  1420                                  
  1421                                  ;-246     unsigned int e;
  1422                                  
  1423                                  
  1424                                  ;-247     if (n >= 10) {
  1425                                  ;
  1426 00000542 C8020000                 ENTER  2,0
  1427 00000546 8B4604                   mov ax, [bp+4]
  1428 00000549 83F80A                   cmp ax, 10 ;unsigned : 0
  1429 0000054C 0F821700                 jb  .prunsign151
  1430                                  
  1431                                  ;-248         e=n/10;
  1432                                  
  1433 00000550 8B4604                   mov ax, [bp+4]
  1434 00000553 BB0A00                   mov bx, 10
  1435 00000556 BA0000                   mov dx, 0
  1436 00000559 F7F3                     div bx
  1437 0000055B 8946FE                   mov [bp-2], ax
  1438                                  
  1439                                  ;-249         prunsign1(e);
  1440                                  
  1441 0000055E FF76FE                   push word [bp-2]
  1442 00000561 E8DEFF                   call prunsign1
  1443 00000564 83C402                   add  sp, 2
  1444                                  
  1445                                  ;-250     }
  1446                                  
  1447                                  
  1448                                  ;-251     n = n % 10; /*unsigned mod*/
  1449                                  
  1450                                  .prunsign151:
  1451 00000567 8B4604                   mov ax, [bp+4]
  1452 0000056A BB0A00                   mov bx, 10
  1453 0000056D BA0000                   mov dx, 0
  1454 00000570 F7F3                     div bx
  1455 00000572 89D0                     mov ax, dx
  1456 00000574 894604                   mov [bp+4], ax
  1457                                  
  1458                                  ;-252     n += '0';
  1459                                  
  1460 00000577 83460430                 add  word[bp+4], 48
  1461                                  
  1462                                  ;-253     prc(n);
  1463                                  
  1464 0000057B FF7604                   push word [bp+4]
  1465 0000057E E805FE                   call prc
  1466 00000581 83C402                   add  sp, 2
  1467                                  
  1468                                  ;-254 }
  1469                                  
  1470                                  
  1471                                  ;-255 int printint51(unsigned int j)  {
  1472 00000584 C9                       LEAVE
  1473 00000585 C3                       ret
  1474                                  ENDP
  1475                                  
  1476                                  printint51: PROC
  1477                                  
  1478                                  ;-256     if (j<10000) prc(32);
  1479                                  ;
  1480 00000586 C8000000                 ENTER  0,0
  1481 0000058A 8B4604                   mov ax, [bp+4]
  1482 0000058D 3D1027                   cmp ax, 10000
  1483 00000590 0F8D0800                 jge .printint5152
  1484 00000594 6A20                     push 32
  1485 00000596 E8EDFD                   call prc
  1486 00000599 83C402                   add  sp, 2
  1487                                  
  1488                                  ;-257     if (j<1000) prc(32);
  1489                                  
  1490                                  .printint5152:
  1491 0000059C 8B4604                   mov ax, [bp+4]
  1492 0000059F 3DE803                   cmp ax, 1000
  1493 000005A2 0F8D0800                 jge .printint5153
  1494 000005A6 6A20                     push 32
  1495 000005A8 E8DBFD                   call prc
  1496 000005AB 83C402                   add  sp, 2
  1497                                  
  1498                                  ;-258     if (j<100) prc(32);
  1499                                  
  1500                                  .printint5153:
  1501 000005AE 8B4604                   mov ax, [bp+4]
  1502 000005B1 83F864                   cmp ax, 100
  1503 000005B4 0F8D0800                 jge .printint5154
  1504 000005B8 6A20                     push 32
  1505 000005BA E8C9FD                   call prc
  1506 000005BD 83C402                   add  sp, 2
  1507                                  
  1508                                  ;-259     if (j<10) prc(32);
  1509                                  
  1510                                  .printint5154:
  1511 000005C0 8B4604                   mov ax, [bp+4]
  1512 000005C3 83F80A                   cmp ax, 10
  1513 000005C6 0F8D0800                 jge .printint5155
  1514 000005CA 6A20                     push 32
  1515 000005CC E8B7FD                   call prc
  1516 000005CF 83C402                   add  sp, 2
  1517                                  
  1518                                  ;-260     prunsign1(j);
  1519                                  
  1520                                  .printint5155:
  1521 000005D2 FF7604                   push word [bp+4]
  1522 000005D5 E86AFF                   call prunsign1
  1523 000005D8 83C402                   add  sp, 2
  1524                                  
  1525                                  ;-261 }
  1526                                  
  1527                                  
  1528                                  ;-262 
  1529                                  
  1530                                  
  1531                                  ;-263 int end1(int n) {
  1532 000005DB C9                       LEAVE
  1533 000005DC C3                       ret
  1534                                  ENDP
  1535                                  
  1536                                  end1: PROC
  1537                                  
  1538                                  ;-264     fcloseR(fdin);
  1539                                  ;
  1540 000005DD C8000000                 ENTER  0,0
  1541 000005E1 FF36[1A00]               push word [fdin]
  1542 000005E5 E8EEFA                   call fcloseR
  1543 000005E8 83C402                   add  sp, 2
  1544                                  
  1545                                  ;-265     fcloseR(fdout);
  1546                                  
  1547 000005EB FF36[1C00]               push word [fdout]
  1548 000005EF E8E4FA                   call fcloseR
  1549 000005F2 83C402                   add  sp, 2
  1550                                  
  1551                                  ;-266     exitR(n);
  1552                                  
  1553 000005F5 FF7604                   push word [bp+4]
  1554 000005F8 E8EAFA                   call exitR
  1555 000005FB 83C402                   add  sp, 2
  1556                                  
  1557                                  ;-267 }
  1558                                  
  1559                                  
  1560                                  ;-268 
  1561                                  
  1562                                  
  1563                                  ;-269 int error1(char *s) {
  1564 000005FE C9                       LEAVE
  1565 000005FF C3                       ret
  1566                                  ENDP
  1567                                  
  1568                                  error1: PROC
  1569                                  
  1570                                  ;-270     lineno--;
  1571                                  ;
  1572 00000600 C8000000                 ENTER  0,0
  1573 00000604 FF0E[4000]               dec  word[lineno]
  1574                                  
  1575                                  ;-271     prnl();
  1576                                  
  1577 00000608 E868FE                   call prnl
  1578                                  
  1579                                  ;-272     prscomment(&fgetsdest);
  1580                                  
  1581 0000060B 8D0639A2                 lea  ax, [fgetsdest]
  1582 0000060F 50                       push ax
  1583 00000610 E89EFD                   call prscomment
  1584 00000613 83C402                   add  sp, 2
  1585                                  
  1586                                  ;-273     prs(";Line: ");
  1587                                  
  1588 00000616 68[7F06]                 push error1_0
  1589 00000619 E8C3FD                   call prs
  1590 0000061C 83C402                   add  sp, 2
  1591                                  
  1592                                  ;-274     prunsign1(lineno);
  1593                                  
  1594 0000061F FF36[4000]               push word [lineno]
  1595 00000623 E81CFF                   call prunsign1
  1596 00000626 83C402                   add  sp, 2
  1597                                  
  1598                                  ;-275     prs(" ************** ERROR: ");
  1599                                  
  1600 00000629 68[8706]                 push error1_1
  1601 0000062C E8B0FD                   call prs
  1602 0000062F 83C402                   add  sp, 2
  1603                                  
  1604                                  ;-276     prs(s);
  1605                                  
  1606 00000632 FF7604                   push word [bp+4]
  1607 00000635 E8A7FD                   call prs
  1608 00000638 83C402                   add  sp, 2
  1609                                  
  1610                                  ;-277     prs("  in column: ");
  1611                                  
  1612 0000063B 68[9F06]                 push error1_2
  1613 0000063E E89EFD                   call prs
  1614 00000641 83C402                   add  sp, 2
  1615                                  
  1616                                  ;-278     prunsign1(column);
  1617                                  
  1618 00000644 FF36[2000]               push word [column]
  1619 00000648 E8F7FE                   call prunsign1
  1620 0000064B 83C402                   add  sp, 2
  1621                                  
  1622                                  ;-279     prs("\nToken: ");
  1623                                  
  1624 0000064E 68[AD06]                 push error1_3
  1625 00000651 E88BFD                   call prs
  1626 00000654 83C402                   add  sp, 2
  1627                                  
  1628                                  ;-280     prunsign1(token);
  1629                                  
  1630 00000657 FF36[1E00]               push word [token]
  1631 0000065B E8E4FE                   call prunsign1
  1632 0000065E 83C402                   add  sp, 2
  1633                                  
  1634                                  ;-281     prs(", symbol: ");
  1635                                  
  1636 00000661 68[B706]                 push error1_4
  1637 00000664 E878FD                   call prs
  1638 00000667 83C402                   add  sp, 2
  1639                                  
  1640                                  ;-282     prs(symbol);
  1641                                  
  1642 0000066A 8D06606D                 lea  ax, [symbol]
  1643 0000066E 50                       push ax
  1644 0000066F E86DFD                   call prs
  1645 00000672 83C402                   add  sp, 2
  1646                                  
  1647                                  ;-283     end1(1);
  1648                                  
  1649 00000675 6A01                     push 1
  1650 00000677 E863FF                   call end1
  1651 0000067A 83C402                   add  sp, 2
  1652                                  
  1653                                  ;-284 }
  1654                                  
  1655                                  
  1656                                  ;-285 
  1657                                  
  1658                                  
  1659                                  ;-286 int printinputline() {
  1660 0000067D C9                       LEAVE
  1661 0000067E C3                       ret
  1662 0000067F 3B4C696E653A2000        error1_0 db ";Line: ",0
  1663 00000687 202A2A2A2A2A2A2A2A-     error1_1 db " ************** ERROR: ",0
  1664 00000690 2A2A2A2A2A2A204552-
  1665 00000699 524F523A2000       
  1666 0000069F 2020696E20636F6C75-     error1_2 db "  in column: ",0
  1667 000006A8 6D6E3A2000         
  1668 000006AD 5C6E546F6B656E3A20-     error1_3 db "\nToken: ",0
  1669 000006B6 00                 
  1670 000006B7 2C2073796D626F6C3A-     error1_4 db ", symbol: ",0
  1671 000006C0 2000               
  1672                                  ENDP
  1673                                  
  1674                                  printinputline: PROC
  1675                                  
  1676                                  ;-287     int col;
  1677                                  
  1678                                  
  1679                                  ;-288     col=0;
  1680                                  ;
  1681 000006C2 C8020000                 ENTER  2,0
  1682 000006C6 B80000                   mov ax, 0
  1683 000006C9 8946FE                   mov [bp-2], ax
  1684                                  
  1685                                  ;-289     fgetsp=&fgetsdest;
  1686                                  
  1687 000006CC B839A2                   mov ax, fgetsdest
  1688 000006CF A3[3E00]                 mov word [fgetsp], ax
  1689                                  
  1690                                  ;-290     do {
  1691                                  
  1692                                  .printinputline56:
  1693                                  
  1694                                  ;-291         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);
  1695                                  
  1696 000006D2 6A01                     push 1
  1697 000006D4 FF36[1A00]               push word [fdin]
  1698 000006D8 8D06[4A00]               lea  ax, [DOS_ByteRead]
  1699 000006DC 50                       push ax
  1700 000006DD E813FA                   call readRL
  1701 000006E0 83C406                   add  sp, 6
  1702 000006E3 A3[4800]                 mov word [DOS_NoBytes], ax
  1703                                  
  1704                                  ;-292         if (DOS_NoBytes == 0) return;
  1705                                  
  1706 000006E6 A1[4800]                 mov ax, [DOS_NoBytes]
  1707 000006E9 83F800                   cmp ax, 0
  1708 000006EC 0F850300                 jne .printinputline57
  1709 000006F0 E96A00                   jmp .retnprintinputline
  1710                                  
  1711                                  ;-293         *fgetsp=DOS_ByteRead;
  1712                                  
  1713                                  .printinputline57:
  1714 000006F3 A0[4A00]                 mov al, [DOS_ByteRead]
  1715 000006F6 8B1E[3E00]               mov  bx, [fgetsp]
  1716 000006FA 8807                     mov  [bx], al
  1717                                  
  1718                                  ;-294         fgetsp++;
  1719                                  
  1720 000006FC FF06[3E00]               inc  word[fgetsp]
  1721                                  
  1722                                  ;-295         col++;
  1723                                  
  1724 00000700 FF46FE                   inc  word[bp-2]
  1725                                  
  1726                                  ;-296         if (col >80) error1("input line longer than 80 char");
  1727                                  
  1728 00000703 8B46FE                   mov ax, [bp-2]
  1729 00000706 83F850                   cmp ax, 80
  1730 00000709 0F8E0900                 jle .printinputline58
  1731 0000070D 68[5F07]                 push printinputline_0
  1732 00000710 E8EDFE                   call error1
  1733 00000713 83C402                   add  sp, 2
  1734                                  
  1735                                  ;-297         }
  1736                                  
  1737                                  .printinputline58:
  1738                                  
  1739                                  ;-298         while (DOS_ByteRead != 10);
  1740                                  
  1741 00000716 A0[4A00]                 mov al, [DOS_ByteRead]
  1742 00000719 3C0A                     cmp al, 10
  1743 0000071B 0F840200                 je  .printinputline59
  1744 0000071F EBB1                     jmp .printinputline56
  1745                                  .printinputline59:
  1746                                  
  1747                                  ;-299     *fgetsp=0;
  1748                                  
  1749 00000721 B80000                   mov ax, 0
  1750 00000724 8B1E[3E00]               mov  bx, [fgetsp]
  1751 00000728 8807                     mov  [bx], al
  1752                                  
  1753                                  ;-300     if (fdout) {
  1754                                  
  1755 0000072A A1[1C00]                 mov ax, [fdout]
  1756 0000072D 08C0                     or  al, al
  1757 0000072F 0F842A00                 je .printinputline60
  1758                                  
  1759                                  ;-301         prs("\n\n;-");
  1760                                  
  1761 00000733 68[7E07]                 push printinputline_1
  1762 00000736 E8A6FC                   call prs
  1763 00000739 83C402                   add  sp, 2
  1764                                  
  1765                                  ;-302         prunsign1(lineno);
  1766                                  
  1767 0000073C FF36[4000]               push word [lineno]
  1768 00000740 E8FFFD                   call prunsign1
  1769 00000743 83C402                   add  sp, 2
  1770                                  
  1771                                  ;-303         prc(' ');
  1772                                  
  1773 00000746 6A20                     push 32
  1774 00000748 E83BFC                   call prc
  1775 0000074B 83C402                   add  sp, 2
  1776                                  
  1777                                  ;-304         lineno++;
  1778                                  
  1779 0000074E FF06[4000]               inc  word[lineno]
  1780                                  
  1781                                  ;-305         prscomment(&fgetsdest);
  1782                                  
  1783 00000752 8D0639A2                 lea  ax, [fgetsdest]
  1784 00000756 50                       push ax
  1785 00000757 E857FC                   call prscomment
  1786 0000075A 83C402                   add  sp, 2
  1787                                  
  1788                                  ;-306         }
  1789                                  
  1790                                  
  1791                                  ;-307 }
  1792                                  
  1793                                  .printinputline60:
  1794                                  
  1795                                  ;-308 int fgets1() {
  1796                                  
  1797 0000075D C9                       .retnprintinputline: LEAVE
  1798 0000075E C3                       ret
  1799 0000075F 696E707574206C696E-     printinputline_0 db "input line longer than 80 char",0
  1800 00000768 65206C6F6E67657220-
  1801 00000771 7468616E2038302063-
  1802 0000077A 68617200           
  1803 0000077E 5C6E5C6E3B2D00          printinputline_1 db "\n\n;-",0
  1804                                  ENDP
  1805                                  
  1806                                  fgets1: PROC
  1807                                  
  1808                                  ;-309     char c;
  1809                                  
  1810                                  
  1811                                  ;-310     c=*fgetsp;
  1812                                  ;
  1813 00000785 C8020000                 ENTER  2,0
  1814 00000789 8B1E[3E00]               mov bx, [fgetsp]
  1815 0000078D 8A07                     mov al, [bx]
  1816 0000078F B400                     mov ah, 0
  1817 00000791 8846FE                   mov [bp-2], al
  1818                                  
  1819                                  ;-311     if (c==0) {
  1820                                  
  1821 00000794 8A46FE                   mov al, [bp-2]
  1822 00000797 3C00                     cmp al, 0
  1823 00000799 0F852A00                 jne .fgets161
  1824                                  
  1825                                  ;-312         printinputline();
  1826                                  
  1827 0000079D E822FF                   call printinputline
  1828                                  
  1829                                  ;-313         if (DOS_NoBytes == 0) return 0;
  1830                                  
  1831 000007A0 A1[4800]                 mov ax, [DOS_NoBytes]
  1832 000007A3 83F800                   cmp ax, 0
  1833 000007A6 0F850600                 jne .fgets162
  1834 000007AA B80000                   mov ax, 0
  1835 000007AD E92500                   jmp .retnfgets1
  1836                                  
  1837                                  ;-314         fgetsp=&fgetsdest;
  1838                                  
  1839                                  .fgets162:
  1840 000007B0 B839A2                   mov ax, fgetsdest
  1841 000007B3 A3[3E00]                 mov word [fgetsp], ax
  1842                                  
  1843                                  ;-315         c=*fgetsp;
  1844                                  
  1845 000007B6 8B1E[3E00]               mov bx, [fgetsp]
  1846 000007BA 8A07                     mov al, [bx]
  1847 000007BC B400                     mov ah, 0
  1848 000007BE 8846FE                   mov [bp-2], al
  1849                                  
  1850                                  ;-316         column=0;
  1851                                  
  1852 000007C1 B80000                   mov ax, 0
  1853 000007C4 A3[2000]                 mov word [column], ax
  1854                                  
  1855                                  ;-317     }
  1856                                  
  1857                                  
  1858                                  ;-318     fgetsp++;
  1859                                  
  1860                                  .fgets161:
  1861 000007C7 FF06[3E00]               inc  word[fgetsp]
  1862                                  
  1863                                  ;-319     column++;
  1864                                  
  1865 000007CB FF06[2000]               inc  word[column]
  1866                                  
  1867                                  ;-320     return c;
  1868                                  
  1869 000007CF 8A46FE                   mov al, [bp-2]
  1870 000007D2 E90000                   jmp .retnfgets1
  1871                                  
  1872                                  ;-321 }
  1873                                  
  1874                                  
  1875                                  ;-322 int next() {
  1876                                  
  1877 000007D5 C9                       .retnfgets1: LEAVE
  1878 000007D6 C3                       ret
  1879                                  ENDP
  1880                                  
  1881                                  next: PROC
  1882                                  
  1883                                  ;-323     char r;
  1884                                  
  1885                                  
  1886                                  ;-324     r = thechar;
  1887                                  ;
  1888 000007D7 C8020000                 ENTER  2,0
  1889 000007DB A0[2200]                 mov al, [thechar]
  1890 000007DE 8846FE                   mov [bp-2], al
  1891                                  
  1892                                  ;-325     thechar = fgets1();
  1893                                  
  1894 000007E1 E8A1FF                   call fgets1
  1895 000007E4 A2[2200]                 mov byte [thechar], al
  1896                                  
  1897                                  ;-326     return r;
  1898                                  
  1899 000007E7 8A46FE                   mov al, [bp-2]
  1900 000007EA E90000                   jmp .retnnext
  1901                                  
  1902                                  ;-327 }
  1903                                  
  1904                                  
  1905                                  ;-328 
  1906                                  
  1907                                  
  1908                                  ;-329 int adrF(char *s, unsigned int i) {
  1909                                  
  1910 000007ED C9                       .retnnext: LEAVE
  1911 000007EE C3                       ret
  1912                                  ENDP
  1913                                  
  1914                                  adrF: PROC
  1915                                  
  1916                                  ;-330     i << 4;//*16; IDLENMAX=15!
  1917                                  ;
  1918 000007EF C8000000                 ENTER  0,0
  1919 000007F3 8B4606                   mov ax, [bp+6]
  1920 000007F6 C1E004                   shl ax, 4
  1921                                  
  1922                                  ;-331     __asm{ add ax, [bp+4]  ; offset s }
  1923                                  
  1924 000007F9 034604                   add ax, [bp+4]  ; offset s 
  1925                                  
  1926                                  ;-332 }
  1927                                  
  1928                                  
  1929                                  ;-333 
  1930                                  
  1931                                  
  1932                                  ;-334 int printName(unsigned int i) {
  1933 000007FC C9                       LEAVE
  1934 000007FD C3                       ret
  1935                                  ENDP
  1936                                  
  1937                                  printName: PROC
  1938                                  
  1939                                  ;-335     int j;
  1940                                  
  1941                                  
  1942                                  ;-336     if (i < LSTART) {
  1943                                  ;
  1944 000007FE C8020000                 ENTER  2,0
  1945 00000802 8B4604                   mov ax, [bp+4]
  1946 00000805 3DC800                   cmp ax, 200
  1947 00000808 0F8D1D00                 jge .printName63
  1948                                  
  1949                                  ;-337         i=adrF(GNameField, i);
  1950                                  
  1951 0000080C FF7604                   push word [bp+4]
  1952 0000080F 8D067976                 lea  ax, [GNameField]
  1953 00000813 50                       push ax
  1954 00000814 E8D8FF                   call adrF
  1955 00000817 83C404                   add  sp, 4
  1956 0000081A 894604                   mov [bp+4], ax
  1957                                  
  1958                                  ;-338         prs(i);
  1959                                  
  1960 0000081D FF7604                   push word [bp+4]
  1961 00000820 E8BCFB                   call prs
  1962 00000823 83C402                   add  sp, 2
  1963                                  
  1964                                  ;-339     }
  1965                                  
  1966                                  
  1967                                  ;-340     else {
  1968                                  
  1969 00000826 E93800                   jmp .printName64
  1970                                  .printName63:
  1971                                  
  1972                                  ;-341         prs("[bp");
  1973                                  
  1974 00000829 68[6308]                 push printName_0
  1975 0000082C E8B0FB                   call prs
  1976 0000082F 83C402                   add  sp, 2
  1977                                  
  1978                                  ;-342         j = GData[i];
  1979                                  
  1980 00000832 8B5E04                   mov bx, [bp+4]
  1981 00000835 D1E3                     shl bx, 1
  1982 00000837 8B875973                 mov ax, [GData + bx]
  1983 0000083B 8946FE                   mov [bp-2], ax
  1984                                  
  1985                                  ;-343         if (j>0) prc('+');
  1986                                  
  1987 0000083E 8B46FE                   mov ax, [bp-2]
  1988 00000841 83F800                   cmp ax, 0
  1989 00000844 0F8E0800                 jle .printName65
  1990 00000848 6A2B                     push 43
  1991 0000084A E839FB                   call prc
  1992 0000084D 83C402                   add  sp, 2
  1993                                  
  1994                                  ;-344         pint1(j);
  1995                                  
  1996                                  .printName65:
  1997 00000850 FF76FE                   push word [bp-2]
  1998 00000853 E88EFC                   call pint1
  1999 00000856 83C402                   add  sp, 2
  2000                                  
  2001                                  ;-345         prc(']');
  2002                                  
  2003 00000859 6A5D                     push 93
  2004 0000085B E828FB                   call prc
  2005 0000085E 83C402                   add  sp, 2
  2006                                  
  2007                                  ;-346     }
  2008                                  
  2009                                  
  2010                                  ;-347 }
  2011                                  
  2012                                  .printName64:
  2013                                  
  2014                                  ;-348 
  2015                                  
  2016                                  
  2017                                  ;-349 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR
  2018 00000861 C9                       LEAVE
  2019 00000862 C3                       ret
  2020 00000863 5B627000                printName_0 db "[bp",0
  2021                                  ENDP
  2022                                  
  2023                                  ifEOL: PROC
  2024                                  
  2025                                  ;-350     if (c == 10) return 1;//LF
  2026                                  ;
  2027 00000867 C8000000                 ENTER  0,0
  2028 0000086B 8A4604                   mov al, [bp+4]
  2029 0000086E 3C0A                     cmp al, 10
  2030 00000870 0F850600                 jne .ifEOL66
  2031 00000874 B80100                   mov ax, 1
  2032 00000877 E92400                   jmp .retnifEOL
  2033                                  
  2034                                  ;-351     if (c == 13) {//CR
  2035                                  
  2036                                  .ifEOL66:
  2037 0000087A 8A4604                   mov al, [bp+4]
  2038 0000087D 3C0D                     cmp al, 13
  2039 0000087F 0F851500                 jne .ifEOL67
  2040                                  
  2041                                  ;-352         if (thechar == 10) c=next();
  2042                                  
  2043 00000883 A0[2200]                 mov al, [thechar]
  2044 00000886 3C0A                     cmp al, 10
  2045 00000888 0F850600                 jne .ifEOL68
  2046 0000088C E848FF                   call next
  2047 0000088F 884604                   mov [bp+4], al
  2048                                  
  2049                                  ;-353         return 1;
  2050                                  
  2051                                  .ifEOL68:
  2052 00000892 B80100                   mov ax, 1
  2053 00000895 E90600                   jmp .retnifEOL
  2054                                  
  2055                                  ;-354     }
  2056                                  
  2057                                  
  2058                                  ;-355     return 0;
  2059                                  
  2060                                  .ifEOL67:
  2061 00000898 B80000                   mov ax, 0
  2062 0000089B E90000                   jmp .retnifEOL
  2063                                  
  2064                                  ;-356 }
  2065                                  
  2066                                  
  2067                                  ;-357 
  2068                                  
  2069                                  
  2070                                  ;-358 char symboltemp[80];
  2071                                  
  2072 0000089E C9                       .retnifEOL: LEAVE
  2073 0000089F C3                       ret
  2074                                  ENDP
  2075                                  section .bss
  2076                                  absolute 41657
  2077 0000A2B9 <res 00000050>          symboltemp resb 80
  2078                                  section .text
  2079                                  
  2080                                  ;-359 int getlex() {
  2081                                  
  2082                                  
  2083                                  getlex: PROC
  2084                                  
  2085                                  ;-360     char c; char *p;
  2086                                  
  2087                                  
  2088                                  ;-361     int i; int j;
  2089                                  
  2090                                  
  2091                                  ;-362 g1: c=next();
  2092                                  ;
  2093 000008A0 C8080000                 ENTER  8,0
  2094                                  .g1:
  2095 000008A4 E830FF                   call next
  2096 000008A7 8846FE                   mov [bp-2], al
  2097                                  
  2098                                  ;-363     if (c == 0) return 0;
  2099                                  
  2100 000008AA 8A46FE                   mov al, [bp-2]
  2101 000008AD 3C00                     cmp al, 0
  2102 000008AF 0F850600                 jne .getlex69
  2103 000008B3 B80000                   mov ax, 0
  2104 000008B6 E90D06                   jmp .retngetlex
  2105                                  
  2106                                  ;-364     if (c <= ' ') goto g1;
  2107                                  
  2108                                  .getlex69:
  2109 000008B9 8A46FE                   mov al, [bp-2]
  2110 000008BC 3C20                     cmp al, 32
  2111 000008BE 0F8F0200                 jg  .getlex70
  2112 000008C2 EBE0                     jmp .g1
  2113                                  
  2114                                  ;-365   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}
  2115                                  
  2116                                  .getlex70:
  2117 000008C4 8A46FE                   mov al, [bp-2]
  2118 000008C7 3C3D                     cmp al, 61
  2119 000008C9 0F851200                 jne .getlex71
  2120 000008CD A0[2200]                 mov al, [thechar]
  2121 000008D0 3C3D                     cmp al, 61
  2122 000008D2 0F850900                 jne .getlex72
  2123 000008D6 E8FEFE                   call next
  2124 000008D9 B82603                   mov ax, 806
  2125 000008DC E9E705                   jmp .retngetlex
  2126                                  .getlex72:
  2127                                  
  2128                                  ;-366   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}
  2129                                  
  2130                                  .getlex71:
  2131 000008DF 8A46FE                   mov al, [bp-2]
  2132 000008E2 3C21                     cmp al, 33
  2133 000008E4 0F851200                 jne .getlex73
  2134 000008E8 A0[2200]                 mov al, [thechar]
  2135 000008EB 3C3D                     cmp al, 61
  2136 000008ED 0F850900                 jne .getlex74
  2137 000008F1 E8E3FE                   call next
  2138 000008F4 B82703                   mov ax, 807
  2139 000008F7 E9CC05                   jmp .retngetlex
  2140                                  .getlex74:
  2141                                  
  2142                                  ;-367   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}
  2143                                  
  2144                                  .getlex73:
  2145 000008FA 8A46FE                   mov al, [bp-2]
  2146 000008FD 3C3C                     cmp al, 60
  2147 000008FF 0F851200                 jne .getlex75
  2148 00000903 A0[2200]                 mov al, [thechar]
  2149 00000906 3C3D                     cmp al, 61
  2150 00000908 0F850900                 jne .getlex76
  2151 0000090C E8C8FE                   call next
  2152 0000090F B83803                   mov ax, 824
  2153 00000912 E9B105                   jmp .retngetlex
  2154                                  .getlex76:
  2155                                  
  2156                                  ;-368   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}
  2157                                  
  2158                                  .getlex75:
  2159 00000915 8A46FE                   mov al, [bp-2]
  2160 00000918 3C3E                     cmp al, 62
  2161 0000091A 0F851200                 jne .getlex77
  2162 0000091E A0[2200]                 mov al, [thechar]
  2163 00000921 3C3D                     cmp al, 61
  2164 00000923 0F850900                 jne .getlex78
  2165 00000927 E8ADFE                   call next
  2166 0000092A B82B03                   mov ax, 811
  2167 0000092D E99605                   jmp .retngetlex
  2168                                  .getlex78:
  2169                                  
  2170                                  ;-369   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}
  2171                                  
  2172                                  .getlex77:
  2173 00000930 8A46FE                   mov al, [bp-2]
  2174 00000933 3C3C                     cmp al, 60
  2175 00000935 0F851200                 jne .getlex79
  2176 00000939 A0[2200]                 mov al, [thechar]
  2177 0000093C 3C3C                     cmp al, 60
  2178 0000093E 0F850900                 jne .getlex80
  2179 00000942 E892FE                   call next
  2180 00000945 B8D804                   mov ax, 1240
  2181 00000948 E97B05                   jmp .retngetlex
  2182                                  .getlex80:
  2183                                  
  2184                                  ;-370   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}
  2185                                  
  2186                                  .getlex79:
  2187 0000094B 8A46FE                   mov al, [bp-2]
  2188 0000094E 3C3E                     cmp al, 62
  2189 00000950 0F851200                 jne .getlex81
  2190 00000954 A0[2200]                 mov al, [thechar]
  2191 00000957 3C3E                     cmp al, 62
  2192 00000959 0F850900                 jne .getlex82
  2193 0000095D E877FE                   call next
  2194 00000960 B8D904                   mov ax, 1241
  2195 00000963 E96005                   jmp .retngetlex
  2196                                  .getlex82:
  2197                                  
  2198                                  ;-371   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}
  2199                                  
  2200                                  .getlex81:
  2201 00000966 8A46FE                   mov al, [bp-2]
  2202 00000969 3C2B                     cmp al, 43
  2203 0000096B 0F851200                 jne .getlex83
  2204 0000096F A0[2200]                 mov al, [thechar]
  2205 00000972 3C2B                     cmp al, 43
  2206 00000974 0F850900                 jne .getlex84
  2207 00000978 E85CFE                   call next
  2208 0000097B B8C304                   mov ax, 1219
  2209 0000097E E94505                   jmp .retngetlex
  2210                                  .getlex84:
  2211                                  
  2212                                  ;-372   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}
  2213                                  
  2214                                  .getlex83:
  2215 00000981 8A46FE                   mov al, [bp-2]
  2216 00000984 3C2D                     cmp al, 45
  2217 00000986 0F851200                 jne .getlex85
  2218 0000098A A0[2200]                 mov al, [thechar]
  2219 0000098D 3C2D                     cmp al, 45
  2220 0000098F 0F850900                 jne .getlex86
  2221 00000993 E841FE                   call next
  2222 00000996 B8C904                   mov ax, 1225
  2223 00000999 E92A05                   jmp .retngetlex
  2224                                  .getlex86:
  2225                                  
  2226                                  ;-373   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}
  2227                                  
  2228                                  .getlex85:
  2229 0000099C 8A46FE                   mov al, [bp-2]
  2230 0000099F 3C2B                     cmp al, 43
  2231 000009A1 0F851200                 jne .getlex87
  2232 000009A5 A0[2200]                 mov al, [thechar]
  2233 000009A8 3C3D                     cmp al, 61
  2234 000009AA 0F850900                 jne .getlex88
  2235 000009AE E826FE                   call next
  2236 000009B1 B8CE04                   mov ax, 1230
  2237 000009B4 E90F05                   jmp .retngetlex
  2238                                  .getlex88:
  2239                                  
  2240                                  ;-374   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}
  2241                                  
  2242                                  .getlex87:
  2243 000009B7 8A46FE                   mov al, [bp-2]
  2244 000009BA 3C2D                     cmp al, 45
  2245 000009BC 0F851200                 jne .getlex89
  2246 000009C0 A0[2200]                 mov al, [thechar]
  2247 000009C3 3C3D                     cmp al, 61
  2248 000009C5 0F850900                 jne .getlex90
  2249 000009C9 E80BFE                   call next
  2250 000009CC B8CF04                   mov ax, 1231
  2251 000009CF E9F404                   jmp .retngetlex
  2252                                  .getlex90:
  2253                                  
  2254                                  ;-375   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}
  2255                                  
  2256                                  .getlex89:
  2257 000009D2 8A46FE                   mov al, [bp-2]
  2258 000009D5 3C26                     cmp al, 38
  2259 000009D7 0F851200                 jne .getlex91
  2260 000009DB A0[2200]                 mov al, [thechar]
  2261 000009DE 3C3D                     cmp al, 61
  2262 000009E0 0F850900                 jne .getlex92
  2263 000009E4 E8F0FD                   call next
  2264 000009E7 B8D204                   mov ax, 1234
  2265 000009EA E9D904                   jmp .retngetlex
  2266                                  .getlex92:
  2267                                  
  2268                                  ;-376   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}
  2269                                  
  2270                                  .getlex91:
  2271 000009ED 8A46FE                   mov al, [bp-2]
  2272 000009F0 3C7C                     cmp al, 124
  2273 000009F2 0F851200                 jne .getlex93
  2274 000009F6 A0[2200]                 mov al, [thechar]
  2275 000009F9 3C3D                     cmp al, 61
  2276 000009FB 0F850900                 jne .getlex94
  2277 000009FF E8D5FD                   call next
  2278 00000A02 B8D304                   mov ax, 1235
  2279 00000A05 E9BE04                   jmp .retngetlex
  2280                                  .getlex94:
  2281                                  
  2282                                  ;-377   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}
  2283                                  
  2284                                  .getlex93:
  2285 00000A08 8A46FE                   mov al, [bp-2]
  2286 00000A0B 3C2A                     cmp al, 42
  2287 00000A0D 0F851200                 jne .getlex95
  2288 00000A11 A0[2200]                 mov al, [thechar]
  2289 00000A14 3C3D                     cmp al, 61
  2290 00000A16 0F850900                 jne .getlex96
  2291 00000A1A E8BAFD                   call next
  2292 00000A1D B8D004                   mov ax, 1232
  2293 00000A20 E9A304                   jmp .retngetlex
  2294                                  .getlex96:
  2295                                  
  2296                                  ;-378   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}
  2297                                  
  2298                                  .getlex95:
  2299 00000A23 8A46FE                   mov al, [bp-2]
  2300 00000A26 3C2F                     cmp al, 47
  2301 00000A28 0F851200                 jne .getlex97
  2302 00000A2C A0[2200]                 mov al, [thechar]
  2303 00000A2F 3C3D                     cmp al, 61
  2304 00000A31 0F850900                 jne .getlex98
  2305 00000A35 E89FFD                   call next
  2306 00000A38 B8D104                   mov ax, 1233
  2307 00000A3B E98804                   jmp .retngetlex
  2308                                  .getlex98:
  2309                                  
  2310                                  ;-379   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;
  2311                                  
  2312                                  .getlex97:
  2313 00000A3E 8A46FE                   mov al, byte [bp-2]
  2314 00000A41 B400                     mov ah, 0
  2315 00000A43 50                       push ax
  2316 00000A44 68[C80E]                 push getlex_0
  2317 00000A47 E8C9F8                   call instr1
  2318 00000A4A 83C404                   add  sp, 4
  2319 00000A4D 08C0                     or  al, al
  2320 00000A4F 0F840600                 je .getlex99
  2321 00000A53 8A46FE                   mov al, [bp-2]
  2322 00000A56 E96D04                   jmp .retngetlex
  2323                                  
  2324                                  ;-380   if (c == '/') {
  2325                                  
  2326                                  .getlex99:
  2327 00000A59 8A46FE                   mov al, [bp-2]
  2328 00000A5C 3C2F                     cmp al, 47
  2329 00000A5E 0F852900                 jne .getlex100
  2330                                  
  2331                                  ;-381       if (thechar == '/') {
  2332                                  
  2333 00000A62 A0[2200]                 mov al, [thechar]
  2334 00000A65 3C2F                     cmp al, 47
  2335 00000A67 0F852000                 jne .getlex101
  2336                                  
  2337                                  ;-382           do c=next();
  2338                                  
  2339                                  .getlex102:
  2340 00000A6B E869FD                   call next
  2341 00000A6E 8846FE                   mov [bp-2], al
  2342                                  
  2343                                  ;-383           while(ifEOL(c)==0) return getlex();
  2344                                  
  2345 00000A71 8A46FE                   mov al, byte [bp-2]
  2346 00000A74 B400                     mov ah, 0
  2347 00000A76 50                       push ax
  2348 00000A77 E8EDFD                   call ifEOL
  2349 00000A7A 83C402                   add  sp, 2
  2350 00000A7D 3C00                     cmp al, 0
  2351 00000A7F 0F850200                 jne .getlex103
  2352 00000A83 EBE6                     jmp .getlex102
  2353                                  .getlex103:
  2354 00000A85 E818FE                   call getlex
  2355 00000A88 E93B04                   jmp .retngetlex
  2356                                  
  2357                                  ;-384       }
  2358                                  
  2359                                  
  2360                                  ;-385   }
  2361                                  
  2362                                  .getlex101:
  2363                                  
  2364                                  ;-386   if (c == '/') {
  2365                                  
  2366                                  .getlex100:
  2367 00000A8B 8A46FE                   mov al, [bp-2]
  2368 00000A8E 3C2F                     cmp al, 47
  2369 00000A90 0F853A00                 jne .getlex104
  2370                                  
  2371                                  ;-387       if (thechar == '*') {
  2372                                  
  2373 00000A94 A0[2200]                 mov al, [thechar]
  2374 00000A97 3C2A                     cmp al, 42
  2375 00000A99 0F852B00                 jne .getlex105
  2376                                  
  2377                                  ;-388           g2: c=next();
  2378                                  
  2379                                  .g2:
  2380 00000A9D E837FD                   call next
  2381 00000AA0 8846FE                   mov [bp-2], al
  2382                                  
  2383                                  ;-389           if (c != '*') goto g2;
  2384                                  
  2385 00000AA3 8A46FE                   mov al, [bp-2]
  2386 00000AA6 3C2A                     cmp al, 42
  2387 00000AA8 0F840200                 je  .getlex106
  2388 00000AAC EBEF                     jmp .g2
  2389                                  
  2390                                  ;-390           if (thechar != '/') goto g2;
  2391                                  
  2392                                  .getlex106:
  2393 00000AAE A0[2200]                 mov al, [thechar]
  2394 00000AB1 3C2F                     cmp al, 47
  2395 00000AB3 0F840200                 je  .getlex107
  2396 00000AB7 EBE4                     jmp .g2
  2397                                  
  2398                                  ;-391           c=next();
  2399                                  
  2400                                  .getlex107:
  2401 00000AB9 E81BFD                   call next
  2402 00000ABC 8846FE                   mov [bp-2], al
  2403                                  
  2404                                  ;-392           return getlex();
  2405                                  
  2406 00000ABF E8DEFD                   call getlex
  2407 00000AC2 E90104                   jmp .retngetlex
  2408                                  
  2409                                  ;-393       } else  return '/';
  2410                                  
  2411 00000AC5 E90600                   jmp .getlex108
  2412                                  .getlex105:
  2413 00000AC8 B82F00                   mov ax, 47
  2414 00000ACB E9F803                   jmp .retngetlex
  2415                                  
  2416                                  ;-394   }
  2417                                  
  2418                                  .getlex108:
  2419                                  
  2420                                  ;-395   if (c == '"') {
  2421                                  
  2422                                  .getlex104:
  2423 00000ACE 8A46FE                   mov al, [bp-2]
  2424 00000AD1 3C22                     cmp al, 34
  2425 00000AD3 0F853600                 jne .getlex109
  2426                                  
  2427                                  ;-396       p=&symbol;
  2428                                  
  2429 00000AD7 B8606D                   mov ax, symbol
  2430 00000ADA 8946FC                   mov [bp-4], ax
  2431                                  
  2432                                  ;-397       c=next();
  2433                                  
  2434 00000ADD E8F7FC                   call next
  2435 00000AE0 8846FE                   mov [bp-2], al
  2436                                  
  2437                                  ;-398       while (c != '"') {
  2438                                  
  2439                                  .getlex110:
  2440 00000AE3 8A46FE                   mov al, [bp-2]
  2441 00000AE6 3C22                     cmp al, 34
  2442 00000AE8 0F841300                 je  .getlex111
  2443                                  
  2444                                  ;-399           *p=c;
  2445                                  
  2446 00000AEC 8A46FE                   mov al, [bp-2]
  2447 00000AEF 8B5EFC                   mov  bx, [bp-4]
  2448 00000AF2 8807                     mov  [bx], al
  2449                                  
  2450                                  ;-400           p++;
  2451                                  
  2452 00000AF4 FF46FC                   inc  word[bp-4]
  2453                                  
  2454                                  ;-401           c=next();
  2455                                  
  2456 00000AF7 E8DDFC                   call next
  2457 00000AFA 8846FE                   mov [bp-2], al
  2458                                  
  2459                                  ;-402           }
  2460                                  
  2461                                  
  2462                                  ;-403           *p=0;
  2463                                  
  2464 00000AFD EBE4                     jmp .getlex110
  2465                                  .getlex111:
  2466 00000AFF B80000                   mov ax, 0
  2467 00000B02 8B5EFC                   mov  bx, [bp-4]
  2468 00000B05 8807                     mov  [bx], al
  2469                                  
  2470                                  ;-404       return T_STRING;
  2471                                  
  2472 00000B07 B80201                   mov ax, 258
  2473 00000B0A E9B903                   jmp .retngetlex
  2474                                  
  2475                                  ;-405   }
  2476                                  
  2477                                  
  2478                                  ;-406   if (digit(c)) {
  2479                                  
  2480                                  .getlex109:
  2481 00000B0D 8A46FE                   mov al, byte [bp-2]
  2482 00000B10 B400                     mov ah, 0
  2483 00000B12 50                       push ax
  2484 00000B13 E885F6                   call digit
  2485 00000B16 83C402                   add  sp, 2
  2486 00000B19 08C0                     or  al, al
  2487 00000B1B 0F84D600                 je .getlex112
  2488                                  
  2489                                  ;-407       lexval=0;
  2490                                  
  2491 00000B1F B80000                   mov ax, 0
  2492 00000B22 A3[2B00]                 mov word [lexval], ax
  2493                                  
  2494                                  ;-408       lexval=c-'0'; // lexval=int hi=0, c=char
  2495                                  
  2496 00000B25 8A46FE                   mov al, [bp-2]
  2497 00000B28 2C30                     sub al, 48
  2498 00000B2A A3[2B00]                 mov word [lexval], ax
  2499                                  
  2500                                  ;-409       if (thechar=='x') thechar='X';
  2501                                  
  2502 00000B2D A0[2200]                 mov al, [thechar]
  2503 00000B30 3C78                     cmp al, 120
  2504 00000B32 0F850600                 jne .getlex113
  2505 00000B36 B85800                   mov ax, 88
  2506 00000B39 A2[2200]                 mov byte [thechar], al
  2507                                  
  2508                                  ;-410       if (thechar=='X') {
  2509                                  
  2510                                  .getlex113:
  2511 00000B3C A0[2200]                 mov al, [thechar]
  2512 00000B3F 3C58                     cmp al, 88
  2513 00000B41 0F856800                 jne .getlex114
  2514                                  
  2515                                  ;-411           next();
  2516                                  
  2517 00000B45 E88FFC                   call next
  2518                                  
  2519                                  ;-412           while(alnum(thechar)) {
  2520                                  
  2521                                  .getlex115:
  2522 00000B48 A0[2200]                 mov al, byte [thechar]
  2523 00000B4B B400                     mov ah, 0
  2524 00000B4D 50                       push ax
  2525 00000B4E E874F6                   call alnum
  2526 00000B51 83C402                   add  sp, 2
  2527 00000B54 08C0                     or  al, al
  2528 00000B56 0F845000                 je .getlex116
  2529                                  
  2530                                  ;-413               c=next();
  2531                                  
  2532 00000B5A E87AFC                   call next
  2533 00000B5D 8846FE                   mov [bp-2], al
  2534                                  
  2535                                  ;-414               if(c>96) c=c-39;
  2536                                  
  2537 00000B60 8A46FE                   mov al, [bp-2]
  2538 00000B63 3C60                     cmp al, 96
  2539 00000B65 0F8E0800                 jle .getlex117
  2540 00000B69 8A46FE                   mov al, [bp-2]
  2541 00000B6C 2C27                     sub al, 39
  2542 00000B6E 8846FE                   mov [bp-2], al
  2543                                  
  2544                                  ;-415       	       if (c>64) c=c-7;
  2545                                  
  2546                                  .getlex117:
  2547 00000B71 8A46FE                   mov al, [bp-2]
  2548 00000B74 3C40                     cmp al, 64
  2549 00000B76 0F8E0800                 jle .getlex118
  2550 00000B7A 8A46FE                   mov al, [bp-2]
  2551 00000B7D 2C07                     sub al, 7
  2552 00000B7F 8846FE                   mov [bp-2], al
  2553                                  
  2554                                  ;-416                c=c-48;
  2555                                  
  2556                                  .getlex118:
  2557 00000B82 8A46FE                   mov al, [bp-2]
  2558 00000B85 2C30                     sub al, 48
  2559 00000B87 8846FE                   mov [bp-2], al
  2560                                  
  2561                                  ;-417                lexval=lexval << 4; // * 16
  2562                                  
  2563 00000B8A A1[2B00]                 mov ax, [lexval]
  2564 00000B8D C1E004                   shl ax, 4
  2565 00000B90 A3[2B00]                 mov word [lexval], ax
  2566                                  
  2567                                  ;-418                i=0;
  2568                                  
  2569 00000B93 B80000                   mov ax, 0
  2570 00000B96 8946FA                   mov [bp-6], ax
  2571                                  
  2572                                  ;-419                i=c;
  2573                                  
  2574 00000B99 8A46FE                   mov al, [bp-2]
  2575 00000B9C 8946FA                   mov [bp-6], ax
  2576                                  
  2577                                  ;-420                lexval=lexval+i;
  2578                                  
  2579 00000B9F A1[2B00]                 mov ax, [lexval]
  2580 00000BA2 0346FA                   add ax, [bp-6]
  2581 00000BA5 A3[2B00]                 mov word [lexval], ax
  2582                                  
  2583                                  ;-421            }
  2584                                  
  2585                                  
  2586                                  ;-422        }else {
  2587                                  
  2588 00000BA8 EB9E                     jmp .getlex115
  2589                                  .getlex116:
  2590 00000BAA E94200                   jmp .getlex119
  2591                                  .getlex114:
  2592                                  
  2593                                  ;-423            while(digit(thechar)) {
  2594                                  
  2595                                  .getlex120:
  2596 00000BAD A0[2200]                 mov al, byte [thechar]
  2597 00000BB0 B400                     mov ah, 0
  2598 00000BB2 50                       push ax
  2599 00000BB3 E8E5F5                   call digit
  2600 00000BB6 83C402                   add  sp, 2
  2601 00000BB9 08C0                     or  al, al
  2602 00000BBB 0F843000                 je .getlex121
  2603                                  
  2604                                  ;-424                c=next();
  2605                                  
  2606 00000BBF E815FC                   call next
  2607 00000BC2 8846FE                   mov [bp-2], al
  2608                                  
  2609                                  ;-425                c=c-48;
  2610                                  
  2611 00000BC5 8A46FE                   mov al, [bp-2]
  2612 00000BC8 2C30                     sub al, 48
  2613 00000BCA 8846FE                   mov [bp-2], al
  2614                                  
  2615                                  ;-426                lexval=lexval*10;
  2616                                  
  2617 00000BCD A1[2B00]                 mov ax, [lexval]
  2618 00000BD0 BB0A00                   mov bx, 10
  2619 00000BD3 F7E3                     mul bx
  2620 00000BD5 A3[2B00]                 mov word [lexval], ax
  2621                                  
  2622                                  ;-427                i=0;
  2623                                  
  2624 00000BD8 B80000                   mov ax, 0
  2625 00000BDB 8946FA                   mov [bp-6], ax
  2626                                  
  2627                                  ;-428                i=c;
  2628                                  
  2629 00000BDE 8A46FE                   mov al, [bp-2]
  2630 00000BE1 8946FA                   mov [bp-6], ax
  2631                                  
  2632                                  ;-429                lexval=lexval+i;
  2633                                  
  2634 00000BE4 A1[2B00]                 mov ax, [lexval]
  2635 00000BE7 0346FA                   add ax, [bp-6]
  2636 00000BEA A3[2B00]                 mov word [lexval], ax
  2637                                  
  2638                                  ;-430            }
  2639                                  
  2640                                  
  2641                                  ;-431        }
  2642                                  
  2643 00000BED EBBE                     jmp .getlex120
  2644                                  .getlex121:
  2645                                  
  2646                                  ;-432       return T_CONST;
  2647                                  
  2648                                  .getlex119:
  2649 00000BEF B80101                   mov ax, 257
  2650 00000BF2 E9D102                   jmp .retngetlex
  2651                                  
  2652                                  ;-433   }
  2653                                  
  2654                                  
  2655                                  ;-434   if (c==39) {
  2656                                  
  2657                                  .getlex112:
  2658 00000BF5 8A46FE                   mov al, [bp-2]
  2659 00000BF8 3C27                     cmp al, 39
  2660 00000BFA 0F854F00                 jne .getlex122
  2661                                  
  2662                                  ;-435       lexval=next();
  2663                                  
  2664 00000BFE E8D6FB                   call next
  2665 00000C01 A3[2B00]                 mov word [lexval], ax
  2666                                  
  2667                                  ;-436       if (lexval==92) {
  2668                                  
  2669 00000C04 A1[2B00]                 mov ax, [lexval]
  2670 00000C07 83F85C                   cmp ax, 92
  2671 00000C0A 0F853600                 jne .getlex123
  2672                                  
  2673                                  ;-437           lexval=next();
  2674                                  
  2675 00000C0E E8C6FB                   call next
  2676 00000C11 A3[2B00]                 mov word [lexval], ax
  2677                                  
  2678                                  ;-438           if (lexval=='n') lexval=10;
  2679                                  
  2680 00000C14 A1[2B00]                 mov ax, [lexval]
  2681 00000C17 83F86E                   cmp ax, 110
  2682 00000C1A 0F850600                 jne .getlex124
  2683 00000C1E B80A00                   mov ax, 10
  2684 00000C21 A3[2B00]                 mov word [lexval], ax
  2685                                  
  2686                                  ;-439           if (lexval=='t') lexval= 9;
  2687                                  
  2688                                  .getlex124:
  2689 00000C24 A1[2B00]                 mov ax, [lexval]
  2690 00000C27 83F874                   cmp ax, 116
  2691 00000C2A 0F850600                 jne .getlex125
  2692 00000C2E B80900                   mov ax, 9
  2693 00000C31 A3[2B00]                 mov word [lexval], ax
  2694                                  
  2695                                  ;-440           if (lexval=='0') lexval= 0;
  2696                                  
  2697                                  .getlex125:
  2698 00000C34 A1[2B00]                 mov ax, [lexval]
  2699 00000C37 83F830                   cmp ax, 48
  2700 00000C3A 0F850600                 jne .getlex126
  2701 00000C3E B80000                   mov ax, 0
  2702 00000C41 A3[2B00]                 mov word [lexval], ax
  2703                                  
  2704                                  ;-441       }
  2705                                  
  2706                                  .getlex126:
  2707                                  
  2708                                  ;-442       next();
  2709                                  
  2710                                  .getlex123:
  2711 00000C44 E890FB                   call next
  2712                                  
  2713                                  ;-443       return T_CONST;
  2714                                  
  2715 00000C47 B80101                   mov ax, 257
  2716 00000C4A E97902                   jmp .retngetlex
  2717                                  
  2718                                  ;-444   }
  2719                                  
  2720                                  
  2721                                  ;-445   if (alnum(c)) {
  2722                                  
  2723                                  .getlex122:
  2724 00000C4D 8A46FE                   mov al, byte [bp-2]
  2725 00000C50 B400                     mov ah, 0
  2726 00000C52 50                       push ax
  2727 00000C53 E86FF5                   call alnum
  2728 00000C56 83C402                   add  sp, 2
  2729 00000C59 08C0                     or  al, al
  2730 00000C5B 0F845E02                 je .getlex127
  2731                                  
  2732                                  ;-446     strcpy(symboltemp, symbol);
  2733                                  
  2734 00000C5F 8D06606D                 lea  ax, [symbol]
  2735 00000C63 50                       push ax
  2736 00000C64 8D06B9A2                 lea  ax, [symboltemp]
  2737 00000C68 50                       push ax
  2738 00000C69 E8BDF5                   call strcpy
  2739 00000C6C 83C404                   add  sp, 4
  2740                                  
  2741                                  ;-447     p=&symbol;
  2742                                  
  2743 00000C6F B8606D                   mov ax, symbol
  2744 00000C72 8946FC                   mov [bp-4], ax
  2745                                  
  2746                                  ;-448     *p=c;
  2747                                  
  2748 00000C75 8A46FE                   mov al, [bp-2]
  2749 00000C78 8B5EFC                   mov  bx, [bp-4]
  2750 00000C7B 8807                     mov  [bx], al
  2751                                  
  2752                                  ;-449     p++;
  2753                                  
  2754 00000C7D FF46FC                   inc  word[bp-4]
  2755                                  
  2756                                  ;-450     while(alnum(thechar)) {
  2757                                  
  2758                                  .getlex128:
  2759 00000C80 A0[2200]                 mov al, byte [thechar]
  2760 00000C83 B400                     mov ah, 0
  2761 00000C85 50                       push ax
  2762 00000C86 E83CF5                   call alnum
  2763 00000C89 83C402                   add  sp, 2
  2764 00000C8C 08C0                     or  al, al
  2765 00000C8E 0F841300                 je .getlex129
  2766                                  
  2767                                  ;-451         c=next();
  2768                                  
  2769 00000C92 E842FB                   call next
  2770 00000C95 8846FE                   mov [bp-2], al
  2771                                  
  2772                                  ;-452         *p=c;
  2773                                  
  2774 00000C98 8A46FE                   mov al, [bp-2]
  2775 00000C9B 8B5EFC                   mov  bx, [bp-4]
  2776 00000C9E 8807                     mov  [bx], al
  2777                                  
  2778                                  ;-453         p++;
  2779                                  
  2780 00000CA0 FF46FC                   inc  word[bp-4]
  2781                                  
  2782                                  ;-454     }
  2783                                  
  2784                                  
  2785                                  ;-455     *p=0;
  2786                                  
  2787 00000CA3 EBDB                     jmp .getlex128
  2788                                  .getlex129:
  2789 00000CA5 B80000                   mov ax, 0
  2790 00000CA8 8B5EFC                   mov  bx, [bp-4]
  2791 00000CAB 8807                     mov  [bx], al
  2792                                  
  2793                                  ;-456     if (eqstr(symbol,"signed"  )) return T_SIGNED;
  2794                                  
  2795 00000CAD 68[DE0E]                 push getlex_1
  2796 00000CB0 8D06606D                 lea  ax, [symbol]
  2797 00000CB4 50                       push ax
  2798 00000CB5 E8A7F5                   call eqstr
  2799 00000CB8 83C404                   add  sp, 4
  2800 00000CBB 08C0                     or  al, al
  2801 00000CBD 0F840600                 je .getlex130
  2802 00000CC1 B81302                   mov ax, 531
  2803 00000CC4 E9FF01                   jmp .retngetlex
  2804                                  
  2805                                  ;-457     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;
  2806                                  
  2807                                  .getlex130:
  2808 00000CC7 68[E50E]                 push getlex_2
  2809 00000CCA 8D06606D                 lea  ax, [symbol]
  2810 00000CCE 50                       push ax
  2811 00000CCF E88DF5                   call eqstr
  2812 00000CD2 83C404                   add  sp, 4
  2813 00000CD5 08C0                     or  al, al
  2814 00000CD7 0F840600                 je .getlex131
  2815 00000CDB B81402                   mov ax, 532
  2816 00000CDE E9E501                   jmp .retngetlex
  2817                                  
  2818                                  ;-458     if (eqstr(symbol,"void"    )) return T_VOID;
  2819                                  
  2820                                  .getlex131:
  2821 00000CE1 68[EE0E]                 push getlex_3
  2822 00000CE4 8D06606D                 lea  ax, [symbol]
  2823 00000CE8 50                       push ax
  2824 00000CE9 E873F5                   call eqstr
  2825 00000CEC 83C404                   add  sp, 4
  2826 00000CEF 08C0                     or  al, al
  2827 00000CF1 0F840600                 je .getlex132
  2828 00000CF5 B81102                   mov ax, 529
  2829 00000CF8 E9CB01                   jmp .retngetlex
  2830                                  
  2831                                  ;-459     if (eqstr(symbol,"int"     )) return T_INT;
  2832                                  
  2833                                  .getlex132:
  2834 00000CFB 68[F30E]                 push getlex_4
  2835 00000CFE 8D06606D                 lea  ax, [symbol]
  2836 00000D02 50                       push ax
  2837 00000D03 E859F5                   call eqstr
  2838 00000D06 83C404                   add  sp, 4
  2839 00000D09 08C0                     or  al, al
  2840 00000D0B 0F840600                 je .getlex133
  2841 00000D0F B80502                   mov ax, 517
  2842 00000D12 E9B101                   jmp .retngetlex
  2843                                  
  2844                                  ;-460     if (eqstr(symbol,"long"    )) return T_LONG;
  2845                                  
  2846                                  .getlex133:
  2847 00000D15 68[F70E]                 push getlex_5
  2848 00000D18 8D06606D                 lea  ax, [symbol]
  2849 00000D1C 50                       push ax
  2850 00000D1D E83FF5                   call eqstr
  2851 00000D20 83C404                   add  sp, 4
  2852 00000D23 08C0                     or  al, al
  2853 00000D25 0F840600                 je .getlex134
  2854 00000D29 B81502                   mov ax, 533
  2855 00000D2C E99701                   jmp .retngetlex
  2856                                  
  2857                                  ;-461     if (eqstr(symbol,"char"    )) return T_CHAR;
  2858                                  
  2859                                  .getlex134:
  2860 00000D2F 68[FC0E]                 push getlex_6
  2861 00000D32 8D06606D                 lea  ax, [symbol]
  2862 00000D36 50                       push ax
  2863 00000D37 E825F5                   call eqstr
  2864 00000D3A 83C404                   add  sp, 4
  2865 00000D3D 08C0                     or  al, al
  2866 00000D3F 0F840600                 je .getlex135
  2867 00000D43 B81202                   mov ax, 530
  2868 00000D46 E97D01                   jmp .retngetlex
  2869                                  
  2870                                  ;-462     if (eqstr(symbol,"asm"     )) return T_ASM;
  2871                                  
  2872                                  .getlex135:
  2873 00000D49 68[010F]                 push getlex_7
  2874 00000D4C 8D06606D                 lea  ax, [symbol]
  2875 00000D50 50                       push ax
  2876 00000D51 E80BF5                   call eqstr
  2877 00000D54 83C404                   add  sp, 4
  2878 00000D57 08C0                     or  al, al
  2879 00000D59 0F840600                 je .getlex136
  2880 00000D5D B80602                   mov ax, 518
  2881 00000D60 E96301                   jmp .retngetlex
  2882                                  
  2883                                  ;-463     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;
  2884                                  
  2885                                  .getlex136:
  2886 00000D63 68[050F]                 push getlex_8
  2887 00000D66 8D06606D                 lea  ax, [symbol]
  2888 00000D6A 50                       push ax
  2889 00000D6B E8F1F4                   call eqstr
  2890 00000D6E 83C404                   add  sp, 4
  2891 00000D71 08C0                     or  al, al
  2892 00000D73 0F840600                 je .getlex137
  2893 00000D77 B80702                   mov ax, 519
  2894 00000D7A E94901                   jmp .retngetlex
  2895                                  
  2896                                  ;-464     if (eqstr(symbol,"__emit__")) return T_EMIT;
  2897                                  
  2898                                  .getlex137:
  2899 00000D7D 68[0B0F]                 push getlex_9
  2900 00000D80 8D06606D                 lea  ax, [symbol]
  2901 00000D84 50                       push ax
  2902 00000D85 E8D7F4                   call eqstr
  2903 00000D88 83C404                   add  sp, 4
  2904 00000D8B 08C0                     or  al, al
  2905 00000D8D 0F840600                 je .getlex138
  2906 00000D91 B80802                   mov ax, 520
  2907 00000D94 E92F01                   jmp .retngetlex
  2908                                  
  2909                                  ;-465     if (eqstr(symbol,"return"  )) return T_RETURN;
  2910                                  
  2911                                  .getlex138:
  2912 00000D97 68[140F]                 push getlex_10
  2913 00000D9A 8D06606D                 lea  ax, [symbol]
  2914 00000D9E 50                       push ax
  2915 00000D9F E8BDF4                   call eqstr
  2916 00000DA2 83C404                   add  sp, 4
  2917 00000DA5 08C0                     or  al, al
  2918 00000DA7 0F840600                 je .getlex139
  2919 00000DAB B80002                   mov ax, 512
  2920 00000DAE E91501                   jmp .retngetlex
  2921                                  
  2922                                  ;-466     if (eqstr(symbol,"if"      )) return T_IF;
  2923                                  
  2924                                  .getlex139:
  2925 00000DB1 68[1B0F]                 push getlex_11
  2926 00000DB4 8D06606D                 lea  ax, [symbol]
  2927 00000DB8 50                       push ax
  2928 00000DB9 E8A3F4                   call eqstr
  2929 00000DBC 83C404                   add  sp, 4
  2930 00000DBF 08C0                     or  al, al
  2931 00000DC1 0F840600                 je .getlex140
  2932 00000DC5 B80102                   mov ax, 513
  2933 00000DC8 E9FB00                   jmp .retngetlex
  2934                                  
  2935                                  ;-467     if (eqstr(symbol,"else"    )) return T_ELSE;
  2936                                  
  2937                                  .getlex140:
  2938 00000DCB 68[1E0F]                 push getlex_12
  2939 00000DCE 8D06606D                 lea  ax, [symbol]
  2940 00000DD2 50                       push ax
  2941 00000DD3 E889F4                   call eqstr
  2942 00000DD6 83C404                   add  sp, 4
  2943 00000DD9 08C0                     or  al, al
  2944 00000DDB 0F840600                 je .getlex141
  2945 00000DDF B80202                   mov ax, 514
  2946 00000DE2 E9E100                   jmp .retngetlex
  2947                                  
  2948                                  ;-468     if (eqstr(symbol,"while"   )) return T_WHILE;
  2949                                  
  2950                                  .getlex141:
  2951 00000DE5 68[230F]                 push getlex_13
  2952 00000DE8 8D06606D                 lea  ax, [symbol]
  2953 00000DEC 50                       push ax
  2954 00000DED E86FF4                   call eqstr
  2955 00000DF0 83C404                   add  sp, 4
  2956 00000DF3 08C0                     or  al, al
  2957 00000DF5 0F840600                 je .getlex142
  2958 00000DF9 B80302                   mov ax, 515
  2959 00000DFC E9C700                   jmp .retngetlex
  2960                                  
  2961                                  ;-469     if (eqstr(symbol,"do"      )) return T_DO;
  2962                                  
  2963                                  .getlex142:
  2964 00000DFF 68[290F]                 push getlex_14
  2965 00000E02 8D06606D                 lea  ax, [symbol]
  2966 00000E06 50                       push ax
  2967 00000E07 E855F4                   call eqstr
  2968 00000E0A 83C404                   add  sp, 4
  2969 00000E0D 08C0                     or  al, al
  2970 00000E0F 0F840600                 je .getlex143
  2971 00000E13 B80402                   mov ax, 516
  2972 00000E16 E9AD00                   jmp .retngetlex
  2973                                  
  2974                                  ;-470     if (eqstr(symbol,"goto"    )) return T_GOTO;
  2975                                  
  2976                                  .getlex143:
  2977 00000E19 68[2C0F]                 push getlex_15
  2978 00000E1C 8D06606D                 lea  ax, [symbol]
  2979 00000E20 50                       push ax
  2980 00000E21 E83BF4                   call eqstr
  2981 00000E24 83C404                   add  sp, 4
  2982 00000E27 08C0                     or  al, al
  2983 00000E29 0F840600                 je .getlex144
  2984 00000E2D B80902                   mov ax, 521
  2985 00000E30 E99300                   jmp .retngetlex
  2986                                  
  2987                                  ;-471     if (eqstr(symbol,"define"  )) return T_DEFINE;
  2988                                  
  2989                                  .getlex144:
  2990 00000E33 68[310F]                 push getlex_16
  2991 00000E36 8D06606D                 lea  ax, [symbol]
  2992 00000E3A 50                       push ax
  2993 00000E3B E821F4                   call eqstr
  2994 00000E3E 83C404                   add  sp, 4
  2995 00000E41 08C0                     or  al, al
  2996 00000E43 0F840600                 je .getlex145
  2997 00000E47 B8FF01                   mov ax, 511
  2998 00000E4A E97900                   jmp .retngetlex
  2999                                  
  3000                                  ;-472 
  3001                                  
  3002                                  
  3003                                  ;-473     i=0;//convert define to value
  3004                                  
  3005                                  .getlex145:
  3006 00000E4D B80000                   mov ax, 0
  3007 00000E50 8946FA                   mov [bp-6], ax
  3008                                  
  3009                                  ;-474     while (i < GTop) {
  3010                                  
  3011                                  .getlex146:
  3012 00000E53 8B46FA                   mov ax, [bp-6]
  3013 00000E56 3B06[3800]               cmp ax, [GTop]
  3014 00000E5A 0F8D5900                 jge .getlex147
  3015                                  
  3016                                  ;-475         j=adrF(GNameField, i);
  3017                                  
  3018 00000E5E FF76FA                   push word [bp-6]
  3019 00000E61 8D067976                 lea  ax, [GNameField]
  3020 00000E65 50                       push ax
  3021 00000E66 E886F9                   call adrF
  3022 00000E69 83C404                   add  sp, 4
  3023 00000E6C 8946F8                   mov [bp-8], ax
  3024                                  
  3025                                  ;-476         if (eqstr(symbol,j)) {
  3026                                  
  3027 00000E6F FF76F8                   push word [bp-8]
  3028 00000E72 8D06606D                 lea  ax, [symbol]
  3029 00000E76 50                       push ax
  3030 00000E77 E8E5F3                   call eqstr
  3031 00000E7A 83C404                   add  sp, 4
  3032 00000E7D 08C0                     or  al, al
  3033 00000E7F 0F842F00                 je .getlex148
  3034                                  
  3035                                  ;-477             if (GType[i]=='#') {
  3036                                  
  3037 00000E83 8B5EFA                   mov bx, [bp-6]
  3038 00000E86 8A87A96E                 mov al, [GType + bx]
  3039 00000E8A 3C23                     cmp al, 35
  3040 00000E8C 0F852200                 jne .getlex149
  3041                                  
  3042                                  ;-478                 lexval=GData[i];
  3043                                  
  3044 00000E90 8B5EFA                   mov bx, [bp-6]
  3045 00000E93 D1E3                     shl bx, 1
  3046 00000E95 8B875973                 mov ax, [GData + bx]
  3047 00000E99 A3[2B00]                 mov word [lexval], ax
  3048                                  
  3049                                  ;-479                 strcpy(symbol, symboltemp);
  3050                                  
  3051 00000E9C 8D06B9A2                 lea  ax, [symboltemp]
  3052 00000EA0 50                       push ax
  3053 00000EA1 8D06606D                 lea  ax, [symbol]
  3054 00000EA5 50                       push ax
  3055 00000EA6 E880F3                   call strcpy
  3056 00000EA9 83C404                   add  sp, 4
  3057                                  
  3058                                  ;-480                 return T_CONST;
  3059                                  
  3060 00000EAC B80101                   mov ax, 257
  3061 00000EAF E91400                   jmp .retngetlex
  3062                                  
  3063                                  ;-481             }
  3064                                  
  3065                                  
  3066                                  ;-482         }
  3067                                  
  3068                                  .getlex149:
  3069                                  
  3070                                  ;-483         i++;
  3071                                  
  3072                                  .getlex148:
  3073 00000EB2 FF46FA                   inc  word[bp-6]
  3074                                  
  3075                                  ;-484     }
  3076                                  
  3077                                  
  3078                                  ;-485     return T_NAME; } error1("Input item not recognized");
  3079                                  
  3080 00000EB5 EB9C                     jmp .getlex146
  3081                                  .getlex147:
  3082 00000EB7 B80001                   mov ax, 256
  3083 00000EBA E90900                   jmp .retngetlex
  3084                                  .getlex127:
  3085 00000EBD 68[380F]                 push getlex_17
  3086 00000EC0 E83DF7                   call error1
  3087 00000EC3 83C402                   add  sp, 2
  3088                                  
  3089                                  ;-486 }
  3090                                  
  3091                                  
  3092                                  ;-487 
  3093                                  
  3094                                  
  3095                                  ;-488 int istoken(int t) {
  3096                                  
  3097 00000EC6 C9                       .retngetlex: LEAVE
  3098 00000EC7 C3                       ret
  3099 00000EC8 28295B5D7B7D2C3B2A-     getlex_0 db "()[]{},;*:%-><=+!&|#?",0
  3100 00000ED1 3A252D3E3C3D2B2126-
  3101 00000EDA 7C233F00           
  3102 00000EDE 7369676E656400          getlex_1 db "signed",0
  3103 00000EE5 756E7369676E656400      getlex_2 db "unsigned",0
  3104 00000EEE 766F696400              getlex_3 db "void",0
  3105 00000EF3 696E7400                getlex_4 db "int",0
  3106 00000EF7 6C6F6E6700              getlex_5 db "long",0
  3107 00000EFC 6368617200              getlex_6 db "char",0
  3108 00000F01 61736D00                getlex_7 db "asm",0
  3109 00000F05 5F5F61736D00            getlex_8 db "__asm",0
  3110 00000F0B 5F5F656D69745F5F00      getlex_9 db "__emit__",0
  3111 00000F14 72657475726E00          getlex_10 db "return",0
  3112 00000F1B 696600                  getlex_11 db "if",0
  3113 00000F1E 656C736500              getlex_12 db "else",0
  3114 00000F23 7768696C6500            getlex_13 db "while",0
  3115 00000F29 646F00                  getlex_14 db "do",0
  3116 00000F2C 676F746F00              getlex_15 db "goto",0
  3117 00000F31 646566696E6500          getlex_16 db "define",0
  3118 00000F38 496E70757420697465-     getlex_17 db "Input item not recognized",0
  3119 00000F41 6D206E6F7420726563-
  3120 00000F4A 6F676E697A656400   
  3121                                  ENDP
  3122                                  
  3123                                  istoken: PROC
  3124                                  
  3125                                  ;-489     if (token == t) {
  3126                                  ;
  3127 00000F52 C8000000                 ENTER  0,0
  3128 00000F56 A1[1E00]                 mov ax, [token]
  3129 00000F59 3B4604                   cmp ax, [bp+4]
  3130 00000F5C 0F850C00                 jne .istoken150
  3131                                  
  3132                                  ;-490         token=getlex();
  3133                                  
  3134 00000F60 E83DF9                   call getlex
  3135 00000F63 A3[1E00]                 mov word [token], ax
  3136                                  
  3137                                  ;-491         return 1;
  3138                                  
  3139 00000F66 B80100                   mov ax, 1
  3140 00000F69 E90600                   jmp .retnistoken
  3141                                  
  3142                                  ;-492     }
  3143                                  
  3144                                  
  3145                                  ;-493     return 0;
  3146                                  
  3147                                  .istoken150:
  3148 00000F6C B80000                   mov ax, 0
  3149 00000F6F E90000                   jmp .retnistoken
  3150                                  
  3151                                  ;-494 }
  3152                                  
  3153                                  
  3154                                  ;-495 int expect(int t) {
  3155                                  
  3156 00000F72 C9                       .retnistoken: LEAVE
  3157 00000F73 C3                       ret
  3158                                  ENDP
  3159                                  
  3160                                  expect: PROC
  3161                                  
  3162                                  ;-496     if (istoken(t)==0) {
  3163                                  ;
  3164 00000F74 C8000000                 ENTER  0,0
  3165 00000F78 FF7604                   push word [bp+4]
  3166 00000F7B E8D4FF                   call istoken
  3167 00000F7E 83C402                   add  sp, 2
  3168 00000F81 83F800                   cmp ax, 0
  3169 00000F84 0F852F00                 jne .expect151
  3170                                  
  3171                                  ;-497         *cloc=0;
  3172                                  
  3173 00000F88 B80000                   mov ax, 0
  3174 00000F8B 8B1E[1800]               mov  bx, [cloc]
  3175 00000F8F 8807                     mov  [bx], al
  3176                                  
  3177                                  ;-498         prs(co);
  3178                                  
  3179 00000F91 8D06A861                 lea  ax, [co]
  3180 00000F95 50                       push ax
  3181 00000F96 E846F4                   call prs
  3182 00000F99 83C402                   add  sp, 2
  3183                                  
  3184                                  ;-499         prs("\nExpected ASCII(dez): ");
  3185                                  
  3186 00000F9C 68[B90F]                 push expect_0
  3187 00000F9F E83DF4                   call prs
  3188 00000FA2 83C402                   add  sp, 2
  3189                                  
  3190                                  ;-500         pint1(t);
  3191                                  
  3192 00000FA5 FF7604                   push word [bp+4]
  3193 00000FA8 E839F5                   call pint1
  3194 00000FAB 83C402                   add  sp, 2
  3195                                  
  3196                                  ;-501         error1(" not found");
  3197                                  
  3198 00000FAE 68[D10F]                 push expect_1
  3199 00000FB1 E84CF6                   call error1
  3200 00000FB4 83C402                   add  sp, 2
  3201                                  
  3202                                  ;-502     }
  3203                                  
  3204                                  
  3205                                  ;-503 }
  3206                                  
  3207                                  .expect151:
  3208                                  
  3209                                  ;-504 
  3210                                  
  3211                                  
  3212                                  ;-505 int v(unsigned int i) {//value
  3213 00000FB7 C9                       LEAVE
  3214 00000FB8 C3                       ret
  3215 00000FB9 5C6E45787065637465-     expect_0 db "\nExpected ASCII(dez): ",0
  3216 00000FC2 642041534349492864-
  3217 00000FCB 657A293A2000       
  3218 00000FD1 206E6F7420666F756E-     expect_1 db " not found",0
  3219 00000FDA 6400               
  3220                                  ENDP
  3221                                  
  3222                                  v: PROC
  3223                                  
  3224                                  ;-506     if (i < LSTART) prc('[');
  3225                                  ;
  3226 00000FDC C8000000                 ENTER  0,0
  3227 00000FE0 8B4604                   mov ax, [bp+4]
  3228 00000FE3 3DC800                   cmp ax, 200
  3229 00000FE6 0F8D0800                 jge .v152
  3230 00000FEA 6A5B                     push 91
  3231 00000FEC E897F3                   call prc
  3232 00000FEF 83C402                   add  sp, 2
  3233                                  
  3234                                  ;-507     printName(i);
  3235                                  
  3236                                  .v152:
  3237 00000FF2 FF7604                   push word [bp+4]
  3238 00000FF5 E806F8                   call printName
  3239 00000FF8 83C402                   add  sp, 2
  3240                                  
  3241                                  ;-508     if (i < LSTART) prc(']');
  3242                                  
  3243 00000FFB 8B4604                   mov ax, [bp+4]
  3244 00000FFE 3DC800                   cmp ax, 200
  3245 00001001 0F8D0800                 jge .v153
  3246 00001005 6A5D                     push 93
  3247 00001007 E87CF3                   call prc
  3248 0000100A 83C402                   add  sp, 2
  3249                                  
  3250                                  ;-509 }
  3251                                  
  3252                                  .v153:
  3253                                  
  3254                                  ;-510 int checknamelen() {
  3255 0000100D C9                       LEAVE
  3256 0000100E C3                       ret
  3257                                  ENDP
  3258                                  
  3259                                  checknamelen: PROC
  3260                                  
  3261                                  ;-511     int i;
  3262                                  
  3263                                  
  3264                                  ;-512     i=strlen(symbol);
  3265                                  ;
  3266 0000100F C8020000                 ENTER  2,0
  3267 00001013 8D06606D                 lea  ax, [symbol]
  3268 00001017 50                       push ax
  3269 00001018 E8E6F1                   call strlen
  3270 0000101B 83C402                   add  sp, 2
  3271 0000101E 8946FE                   mov [bp-2], ax
  3272                                  
  3273                                  ;-513     if (i > IDLENMAX) error1("Item name is too long in characters)");
  3274                                  
  3275 00001021 8B46FE                   mov ax, [bp-2]
  3276 00001024 83F80F                   cmp ax, 15
  3277 00001027 0F8E0900                 jle .checknamelen154
  3278 0000102B 68[3610]                 push checknamelen_0
  3279 0000102E E8CFF5                   call error1
  3280 00001031 83C402                   add  sp, 2
  3281                                  
  3282                                  ;-514 }
  3283                                  
  3284                                  .checknamelen154:
  3285                                  
  3286                                  ;-515 
  3287                                  
  3288                                  
  3289                                  ;-516 int checkName() { unsigned int i; unsigned int j;
  3290 00001034 C9                       LEAVE
  3291 00001035 C3                       ret
  3292 00001036 4974656D206E616D65-     checknamelen_0 db "Item name is too long in characters)",0
  3293 0000103F 20697320746F6F206C-
  3294 00001048 6F6E6720696E206368-
  3295 00001051 617261637465727329-
  3296 0000105A 00                 
  3297                                  ENDP
  3298                                  
  3299                                  checkName: PROC
  3300                                  
  3301                                  ;-517     i=LSTART;
  3302                                  ;
  3303 0000105B C8040000                 ENTER  4,0
  3304 0000105F B8C800                   mov ax, 200
  3305 00001062 8946FE                   mov [bp-2], ax
  3306                                  
  3307                                  ;-518     while(i<LTop) {
  3308                                  
  3309                                  .checkName155:
  3310 00001065 8B46FE                   mov ax, [bp-2]
  3311 00001068 3B06[3A00]               cmp ax, [LTop]
  3312 0000106C 0F8D3000                 jge .checkName156
  3313                                  
  3314                                  ;-519         j=adrF(GNameField, i);
  3315                                  
  3316 00001070 FF76FE                   push word [bp-2]
  3317 00001073 8D067976                 lea  ax, [GNameField]
  3318 00001077 50                       push ax
  3319 00001078 E874F7                   call adrF
  3320 0000107B 83C404                   add  sp, 4
  3321 0000107E 8946FC                   mov [bp-4], ax
  3322                                  
  3323                                  ;-520         if(eqstr(symbol,j))return i;
  3324                                  
  3325 00001081 FF76FC                   push word [bp-4]
  3326 00001084 8D06606D                 lea  ax, [symbol]
  3327 00001088 50                       push ax
  3328 00001089 E8D3F1                   call eqstr
  3329 0000108C 83C404                   add  sp, 4
  3330 0000108F 08C0                     or  al, al
  3331 00001091 0F840600                 je .checkName157
  3332 00001095 8B46FE                   mov ax, [bp-2]
  3333 00001098 E94C00                   jmp .retncheckName
  3334                                  
  3335                                  ;-521         i++;
  3336                                  
  3337                                  .checkName157:
  3338 0000109B FF46FE                   inc  word[bp-2]
  3339                                  
  3340                                  ;-522     }
  3341                                  
  3342                                  
  3343                                  ;-523     i=1;
  3344                                  
  3345 0000109E EBC5                     jmp .checkName155
  3346                                  .checkName156:
  3347 000010A0 B80100                   mov ax, 1
  3348 000010A3 8946FE                   mov [bp-2], ax
  3349                                  
  3350                                  ;-524     while(i<GTop) {
  3351                                  
  3352                                  .checkName158:
  3353 000010A6 8B46FE                   mov ax, [bp-2]
  3354 000010A9 3B06[3800]               cmp ax, [GTop]
  3355 000010AD 0F8D3000                 jge .checkName159
  3356                                  
  3357                                  ;-525         j=adrF(GNameField, i);
  3358                                  
  3359 000010B1 FF76FE                   push word [bp-2]
  3360 000010B4 8D067976                 lea  ax, [GNameField]
  3361 000010B8 50                       push ax
  3362 000010B9 E833F7                   call adrF
  3363 000010BC 83C404                   add  sp, 4
  3364 000010BF 8946FC                   mov [bp-4], ax
  3365                                  
  3366                                  ;-526         if(eqstr(symbol,j))return i;
  3367                                  
  3368 000010C2 FF76FC                   push word [bp-4]
  3369 000010C5 8D06606D                 lea  ax, [symbol]
  3370 000010C9 50                       push ax
  3371 000010CA E892F1                   call eqstr
  3372 000010CD 83C404                   add  sp, 4
  3373 000010D0 08C0                     or  al, al
  3374 000010D2 0F840600                 je .checkName160
  3375 000010D6 8B46FE                   mov ax, [bp-2]
  3376 000010D9 E90B00                   jmp .retncheckName
  3377                                  
  3378                                  ;-527         i++;
  3379                                  
  3380                                  .checkName160:
  3381 000010DC FF46FE                   inc  word[bp-2]
  3382                                  
  3383                                  ;-528     }
  3384                                  
  3385                                  
  3386                                  ;-529     return 0;
  3387                                  
  3388 000010DF EBC5                     jmp .checkName158
  3389                                  .checkName159:
  3390 000010E1 B80000                   mov ax, 0
  3391 000010E4 E90000                   jmp .retncheckName
  3392                                  
  3393                                  ;-530 }
  3394                                  
  3395                                  
  3396                                  ;-531 int searchname() { unsigned int i;
  3397                                  
  3398 000010E7 C9                       .retncheckName: LEAVE
  3399 000010E8 C3                       ret
  3400                                  ENDP
  3401                                  
  3402                                  searchname: PROC
  3403                                  
  3404                                  ;-532   i=checkName(); if (i == 0) error1("Variable unknown");
  3405                                  ;
  3406 000010E9 C8020000                 ENTER  2,0
  3407 000010ED E86BFF                   call checkName
  3408 000010F0 8946FE                   mov [bp-2], ax
  3409 000010F3 8B46FE                   mov ax, [bp-2]
  3410 000010F6 83F800                   cmp ax, 0
  3411 000010F9 0F850900                 jne .searchname161
  3412 000010FD 68[0E11]                 push searchname_0
  3413 00001100 E8FDF4                   call error1
  3414 00001103 83C402                   add  sp, 2
  3415                                  
  3416                                  ;-533   return i;
  3417                                  
  3418                                  .searchname161:
  3419 00001106 8B46FE                   mov ax, [bp-2]
  3420 00001109 E90000                   jmp .retnsearchname
  3421                                  
  3422                                  ;-534 }
  3423                                  
  3424                                  
  3425                                  ;-535 int name1() {
  3426                                  
  3427 0000110C C9                       .retnsearchname: LEAVE
  3428 0000110D C3                       ret
  3429 0000110E 5661726961626C6520-     searchname_0 db "Variable unknown",0
  3430 00001117 756E6B6E6F776E00   
  3431                                  ENDP
  3432                                  
  3433                                  name1: PROC
  3434                                  
  3435                                  ;-536     if (token!=T_NAME) error1("Name expected");
  3436                                  
  3437 0000111F A1[1E00]                 mov ax, [token]
  3438 00001122 3D0001                   cmp ax, 256
  3439 00001125 0F840900                 je  .name1162
  3440 00001129 68[3911]                 push name1_0
  3441 0000112C E8D1F4                   call error1
  3442 0000112F 83C402                   add  sp, 2
  3443                                  
  3444                                  ;-537     token=getlex();
  3445                                  
  3446                                  .name1162:
  3447 00001132 E86BF7                   call getlex
  3448 00001135 A3[1E00]                 mov word [token], ax
  3449                                  
  3450                                  ;-538 }
  3451                                  
  3452                                  
  3453                                  ;-539 int typeName() { int m; //0=V,1=*,2=&
  3454                                  
  3455 00001138 C3                       ret
  3456 00001139 4E616D652065787065-     name1_0 db "Name expected",0
  3457 00001142 6374656400         
  3458                                  ENDP
  3459                                  
  3460                                  typeName: PROC
  3461                                  
  3462                                  ;-540     issign='S';
  3463                                  ;
  3464 00001147 C8020000                 ENTER  2,0
  3465 0000114B B85300                   mov ax, 83
  3466 0000114E A2[3200]                 mov byte [issign], al
  3467                                  
  3468                                  ;-541     if(istoken(T_SIGNED))   issign='S';
  3469                                  
  3470 00001151 681302                   push 531
  3471 00001154 E8FBFD                   call istoken
  3472 00001157 83C402                   add  sp, 2
  3473 0000115A 08C0                     or  al, al
  3474 0000115C 0F840600                 je .typeName163
  3475 00001160 B85300                   mov ax, 83
  3476 00001163 A2[3200]                 mov byte [issign], al
  3477                                  
  3478                                  ;-542     if(istoken(T_UNSIGNED)) issign='U';
  3479                                  
  3480                                  .typeName163:
  3481 00001166 681402                   push 532
  3482 00001169 E8E6FD                   call istoken
  3483 0000116C 83C402                   add  sp, 2
  3484 0000116F 08C0                     or  al, al
  3485 00001171 0F840600                 je .typeName164
  3486 00001175 B85500                   mov ax, 85
  3487 00001178 A2[3200]                 mov byte [issign], al
  3488                                  
  3489                                  ;-543     iswidth=2;
  3490                                  
  3491                                  .typeName164:
  3492 0000117B B80200                   mov ax, 2
  3493 0000117E A2[3500]                 mov byte [iswidth], al
  3494                                  
  3495                                  ;-544     if(istoken(T_VOID))     iswidth=0;
  3496                                  
  3497 00001181 681102                   push 529
  3498 00001184 E8CBFD                   call istoken
  3499 00001187 83C402                   add  sp, 2
  3500 0000118A 08C0                     or  al, al
  3501 0000118C 0F840600                 je .typeName165
  3502 00001190 B80000                   mov ax, 0
  3503 00001193 A2[3500]                 mov byte [iswidth], al
  3504                                  
  3505                                  ;-545     if(istoken(T_CHAR))     iswidth=1;
  3506                                  
  3507                                  .typeName165:
  3508 00001196 681202                   push 530
  3509 00001199 E8B6FD                   call istoken
  3510 0000119C 83C402                   add  sp, 2
  3511 0000119F 08C0                     or  al, al
  3512 000011A1 0F840600                 je .typeName166
  3513 000011A5 B80100                   mov ax, 1
  3514 000011A8 A2[3500]                 mov byte [iswidth], al
  3515                                  
  3516                                  ;-546     if(istoken(T_INT))      iswidth=2;
  3517                                  
  3518                                  .typeName166:
  3519 000011AB 680502                   push 517
  3520 000011AE E8A1FD                   call istoken
  3521 000011B1 83C402                   add  sp, 2
  3522 000011B4 08C0                     or  al, al
  3523 000011B6 0F840600                 je .typeName167
  3524 000011BA B80200                   mov ax, 2
  3525 000011BD A2[3500]                 mov byte [iswidth], al
  3526                                  
  3527                                  ;-547     if(istoken(T_LONG))     iswidth=4;
  3528                                  
  3529                                  .typeName167:
  3530 000011C0 681502                   push 533
  3531 000011C3 E88CFD                   call istoken
  3532 000011C6 83C402                   add  sp, 2
  3533 000011C9 08C0                     or  al, al
  3534 000011CB 0F840600                 je .typeName168
  3535 000011CF B80400                   mov ax, 4
  3536 000011D2 A2[3500]                 mov byte [iswidth], al
  3537                                  
  3538                                  ;-548     istype='V';
  3539                                  
  3540                                  .typeName168:
  3541 000011D5 B85600                   mov ax, 86
  3542 000011D8 A2[2F00]                 mov byte [istype], al
  3543                                  
  3544                                  ;-549     m=0;
  3545                                  
  3546 000011DB B80000                   mov ax, 0
  3547 000011DE 8946FE                   mov [bp-2], ax
  3548                                  
  3549                                  ;-550     if(istoken('*'))  {istype='*'; m=1;}
  3550                                  
  3551 000011E1 6A2A                     push 42
  3552 000011E3 E86CFD                   call istoken
  3553 000011E6 83C402                   add  sp, 2
  3554 000011E9 08C0                     or  al, al
  3555 000011EB 0F840C00                 je .typeName169
  3556 000011EF B82A00                   mov ax, 42
  3557 000011F2 A2[2F00]                 mov byte [istype], al
  3558 000011F5 B80100                   mov ax, 1
  3559 000011F8 8946FE                   mov [bp-2], ax
  3560                                  
  3561                                  ;-551     if(istoken('&'))  {istype='&'; m=2;}
  3562                                  
  3563                                  .typeName169:
  3564 000011FB 6A26                     push 38
  3565 000011FD E852FD                   call istoken
  3566 00001200 83C402                   add  sp, 2
  3567 00001203 08C0                     or  al, al
  3568 00001205 0F840C00                 je .typeName170
  3569 00001209 B82600                   mov ax, 38
  3570 0000120C A2[2F00]                 mov byte [istype], al
  3571 0000120F B80200                   mov ax, 2
  3572 00001212 8946FE                   mov [bp-2], ax
  3573                                  
  3574                                  ;-552     name1();
  3575                                  
  3576                                  .typeName170:
  3577 00001215 E807FF                   call name1
  3578                                  
  3579                                  ;-553     return m;
  3580                                  
  3581 00001218 8B46FE                   mov ax, [bp-2]
  3582 0000121B E90000                   jmp .retntypeName
  3583                                  
  3584                                  ;-554 }
  3585                                  
  3586                                  
  3587                                  ;-555 int gettypes(int i) {int j; char c;
  3588                                  
  3589 0000121E C9                       .retntypeName: LEAVE
  3590 0000121F C3                       ret
  3591                                  ENDP
  3592                                  
  3593                                  gettypes: PROC
  3594                                  
  3595                                  ;-556   c=GSign [i]; if (c=='S') signi =1;    else signi =0;
  3596                                  ;
  3597 00001220 C8040000                 ENTER  4,0
  3598 00001224 8B5E04                   mov bx, [bp+4]
  3599 00001227 8A873970                 mov al, [GSign + bx]
  3600 0000122B 8846FC                   mov [bp-4], al
  3601 0000122E 8A46FC                   mov al, [bp-4]
  3602 00001231 3C53                     cmp al, 83
  3603 00001233 0F850900                 jne .gettypes171
  3604 00001237 B80100                   mov ax, 1
  3605 0000123A A3[3000]                 mov word [signi], ax
  3606 0000123D E90600                   jmp .gettypes172
  3607                                  .gettypes171:
  3608 00001240 B80000                   mov ax, 0
  3609 00001243 A3[3000]                 mov word [signi], ax
  3610                                  
  3611                                  ;-557   c=GWidth[i]; widthi=0;wi=0;
  3612                                  
  3613                                  .gettypes172:
  3614 00001246 8B5E04                   mov bx, [bp+4]
  3615 00001249 8A87C971                 mov al, [GWidth + bx]
  3616 0000124D 8846FC                   mov [bp-4], al
  3617 00001250 B80000                   mov ax, 0
  3618 00001253 A3[3300]                 mov word [widthi], ax
  3619 00001256 B80000                   mov ax, 0
  3620 00001259 A3[3600]                 mov word [wi], ax
  3621                                  
  3622                                  ;-558   if (c==1) {widthi=1;wi=1;}
  3623                                  
  3624 0000125C 8A46FC                   mov al, [bp-4]
  3625 0000125F 3C01                     cmp al, 1
  3626 00001261 0F850C00                 jne .gettypes173
  3627 00001265 B80100                   mov ax, 1
  3628 00001268 A3[3300]                 mov word [widthi], ax
  3629 0000126B B80100                   mov ax, 1
  3630 0000126E A3[3600]                 mov word [wi], ax
  3631                                  
  3632                                  ;-559   if (c==2) {widthi=2;wi=2;}
  3633                                  
  3634                                  .gettypes173:
  3635 00001271 8A46FC                   mov al, [bp-4]
  3636 00001274 3C02                     cmp al, 2
  3637 00001276 0F850C00                 jne .gettypes174
  3638 0000127A B80200                   mov ax, 2
  3639 0000127D A3[3300]                 mov word [widthi], ax
  3640 00001280 B80200                   mov ax, 2
  3641 00001283 A3[3600]                 mov word [wi], ax
  3642                                  
  3643                                  ;-560   if (c==4) {widthi=4;wi=4;}
  3644                                  
  3645                                  .gettypes174:
  3646 00001286 8A46FC                   mov al, [bp-4]
  3647 00001289 3C04                     cmp al, 4
  3648 0000128B 0F850C00                 jne .gettypes175
  3649 0000128F B80400                   mov ax, 4
  3650 00001292 A3[3300]                 mov word [widthi], ax
  3651 00001295 B80400                   mov ax, 4
  3652 00001298 A3[3600]                 mov word [wi], ax
  3653                                  
  3654                                  ;-561   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}
  3655                                  
  3656                                  .gettypes175:
  3657 0000129B 8B5E04                   mov bx, [bp+4]
  3658 0000129E 8A87A96E                 mov al, [GType + bx]
  3659 000012A2 8846FC                   mov [bp-4], al
  3660 000012A5 B80000                   mov ax, 0
  3661 000012A8 A3[2D00]                 mov word [typei], ax
  3662 000012AB 8A46FC                   mov al, [bp-4]
  3663 000012AE 3C2A                     cmp al, 42
  3664 000012B0 0F850C00                 jne .gettypes176
  3665 000012B4 B80100                   mov ax, 1
  3666 000012B7 A3[2D00]                 mov word [typei], ax
  3667 000012BA B80200                   mov ax, 2
  3668 000012BD A3[3600]                 mov word [wi], ax
  3669                                  
  3670                                  ;-562   if (c=='&')  typei=2;
  3671                                  
  3672                                  .gettypes176:
  3673 000012C0 8A46FC                   mov al, [bp-4]
  3674 000012C3 3C26                     cmp al, 38
  3675 000012C5 0F850600                 jne .gettypes177
  3676 000012C9 B80200                   mov ax, 2
  3677 000012CC A3[2D00]                 mov word [typei], ax
  3678                                  
  3679                                  ;-563   return i; }
  3680                                  
  3681                                  .gettypes177:
  3682 000012CF 8B4604                   mov ax, [bp+4]
  3683 000012D2 E90000                   jmp .retngettypes
  3684                                  
  3685                                  ;-564 
  3686                                  
  3687                                  
  3688                                  ;-565 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");
  3689                                  
  3690 000012D5 C9                       .retngettypes: LEAVE
  3691 000012D6 C3                       ret
  3692                                  ENDP
  3693                                  
  3694                                  addlocal: PROC
  3695 000012D7 A1[3A00]                 mov ax, [LTop]
  3696 000012DA 3D9001                   cmp ax, 400 ;unsigned : 1
  3697 000012DD 0F8C0900                 jl  .addlocal178
  3698 000012E1 68[4013]                 push addlocal_0
  3699 000012E4 E819F3                   call error1
  3700 000012E7 83C402                   add  sp, 2
  3701                                  
  3702                                  ;-566   if (checkName() != 0) error1("Variable already defined");
  3703                                  
  3704                                  .addlocal178:
  3705 000012EA E86EFD                   call checkName
  3706 000012ED 83F800                   cmp ax, 0
  3707 000012F0 0F840900                 je  .addlocal179
  3708 000012F4 68[5A13]                 push addlocal_1
  3709 000012F7 E806F3                   call error1
  3710 000012FA 83C402                   add  sp, 2
  3711                                  
  3712                                  ;-567   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;
  3713                                  
  3714                                  .addlocal179:
  3715 000012FD A0[3200]                 mov al, [issign]
  3716 00001300 8B1E[3A00]               mov bx, [LTop]
  3717 00001304 88873970                 mov [GSign+bx], al
  3718 00001308 A0[3500]                 mov al, [iswidth]
  3719 0000130B 8B1E[3A00]               mov bx, [LTop]
  3720 0000130F 8887C971                 mov [GWidth+bx], al
  3721 00001313 A0[2F00]                 mov al, [istype]
  3722 00001316 8B1E[3A00]               mov bx, [LTop]
  3723 0000131A 8887A96E                 mov [GType+bx], al
  3724                                  
  3725                                  ;-568   pt=adrF(GNameField, LTop); strcpy(pt, symbol);
  3726                                  
  3727 0000131E FF36[3A00]               push word [LTop]
  3728 00001322 8D067976                 lea  ax, [GNameField]
  3729 00001326 50                       push ax
  3730 00001327 E8C5F4                   call adrF
  3731 0000132A 83C404                   add  sp, 4
  3732 0000132D A3[4200]                 mov word [pt], ax
  3733 00001330 8D06606D                 lea  ax, [symbol]
  3734 00001334 50                       push ax
  3735 00001335 FF36[4200]               push word [pt]
  3736 00001339 E8EDEE                   call strcpy
  3737 0000133C 83C404                   add  sp, 4
  3738                                  
  3739                                  ;-569 }
  3740                                  
  3741                                  
  3742                                  ;-570 int checkFunction() { unsigned int i; unsigned int j; i=0;
  3743                                  
  3744 0000133F C3                       ret
  3745 00001340 4C6F63616C20766172-     addlocal_0 db "Local variable table full",0
  3746 00001349 6961626C6520746162-
  3747 00001352 6C652066756C6C00   
  3748 0000135A 5661726961626C6520-     addlocal_1 db "Variable already defined",0
  3749 00001363 616C72656164792064-
  3750 0000136C 6566696E656400     
  3751                                  ENDP
  3752                                  
  3753                                  checkFunction: PROC;
  3754 00001373 C8040000                 ENTER  4,0
  3755 00001377 B80000                   mov ax, 0
  3756 0000137A 8946FE                   mov [bp-2], ax
  3757                                  
  3758                                  ;-571   while (i < FTop) {
  3759                                  
  3760                                  .checkFunction180:
  3761 0000137D 8B46FE                   mov ax, [bp-2]
  3762 00001380 3B06[3C00]               cmp ax, [FTop]
  3763 00001384 0F8D3000                 jge .checkFunction181
  3764                                  
  3765                                  ;-572     j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}
  3766                                  
  3767 00001388 FF76FE                   push word [bp-2]
  3768 0000138B 8D06798F                 lea  ax, [FNameField]
  3769 0000138F 50                       push ax
  3770 00001390 E85CF4                   call adrF
  3771 00001393 83C404                   add  sp, 4
  3772 00001396 8946FC                   mov [bp-4], ax
  3773 00001399 FF76FC                   push word [bp-4]
  3774 0000139C 8D06606D                 lea  ax, [symbol]
  3775 000013A0 50                       push ax
  3776 000013A1 E8BBEE                   call eqstr
  3777 000013A4 83C404                   add  sp, 4
  3778 000013A7 08C0                     or  al, al
  3779 000013A9 0F840600                 je .checkFunction182
  3780 000013AD 8B46FE                   mov ax, [bp-2]
  3781 000013B0 E90B00                   jmp .retncheckFunction
  3782                                  .checkFunction182:
  3783 000013B3 FF46FE                   inc  word[bp-2]
  3784                                  
  3785                                  ;-573   return 0; }
  3786                                  
  3787 000013B6 EBC5                     jmp .checkFunction180
  3788                                  .checkFunction181:
  3789 000013B8 B80000                   mov ax, 0
  3790 000013BB E90000                   jmp .retncheckFunction
  3791                                  
  3792                                  ;-574 
  3793                                  
  3794                                  
  3795                                  ;-575 int isvariable() {
  3796                                  
  3797 000013BE C9                       .retncheckFunction: LEAVE
  3798 000013BF C3                       ret
  3799                                  ENDP
  3800                                  
  3801                                  isvariable: PROC
  3802                                  
  3803                                  ;-576     if(token==T_SIGNED)   goto v1;
  3804                                  
  3805 000013C0 A1[1E00]                 mov ax, [token]
  3806 000013C3 3D1302                   cmp ax, 531
  3807 000013C6 0F850300                 jne .isvariable183
  3808 000013CA E93A00                   jmp .v1
  3809                                  
  3810                                  ;-577     if(token==T_UNSIGNED) goto v1;
  3811                                  
  3812                                  .isvariable183:
  3813 000013CD A1[1E00]                 mov ax, [token]
  3814 000013D0 3D1402                   cmp ax, 532
  3815 000013D3 0F850300                 jne .isvariable184
  3816 000013D7 E92D00                   jmp .v1
  3817                                  
  3818                                  ;-578     if(token==T_CHAR)     goto v1;
  3819                                  
  3820                                  .isvariable184:
  3821 000013DA A1[1E00]                 mov ax, [token]
  3822 000013DD 3D1202                   cmp ax, 530
  3823 000013E0 0F850300                 jne .isvariable185
  3824 000013E4 E92000                   jmp .v1
  3825                                  
  3826                                  ;-579     if(token==T_INT)      goto v1;
  3827                                  
  3828                                  .isvariable185:
  3829 000013E7 A1[1E00]                 mov ax, [token]
  3830 000013EA 3D0502                   cmp ax, 517
  3831 000013ED 0F850300                 jne .isvariable186
  3832 000013F1 E91300                   jmp .v1
  3833                                  
  3834                                  ;-580     if(token==T_LONG)     goto v1;
  3835                                  
  3836                                  .isvariable186:
  3837 000013F4 A1[1E00]                 mov ax, [token]
  3838 000013F7 3D1502                   cmp ax, 533
  3839 000013FA 0F850300                 jne .isvariable187
  3840 000013FE E90600                   jmp .v1
  3841                                  
  3842                                  ;-581     return 0;
  3843                                  
  3844                                  .isvariable187:
  3845 00001401 B80000                   mov ax, 0
  3846 00001404 E90600                   jmp .retnisvariable
  3847                                  
  3848                                  ;-582 v1: return 1;
  3849                                  
  3850                                  .v1:
  3851 00001407 B80100                   mov ax, 1
  3852 0000140A E90000                   jmp .retnisvariable
  3853                                  
  3854                                  ;-583 }
  3855                                  
  3856                                  
  3857                                  ;-584 
  3858                                  
  3859                                  
  3860                                  ;-585 int cmpneg(int ids) {
  3861                                  
  3862                                   .retnisvariable:
  3863 0000140D C3                       ret
  3864                                  ENDP
  3865                                  
  3866                                  cmpneg: PROC
  3867                                  
  3868                                  ;-586        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
  3869                                  ;
  3870 0000140E C8000000                 ENTER  0,0
  3871 00001412 A1[2300]                 mov ax, [iscmp]
  3872 00001415 3D2603                   cmp ax, 806
  3873 00001418 0F850C00                 jne .cmpneg188
  3874 0000141C 68[EF14]                 push cmpneg_0
  3875 0000141F E8BDEF                   call prs
  3876 00001422 83C402                   add  sp, 2
  3877                                  
  3878                                  ;-587   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1
  3879                                  
  3880 00001425 E9C500                   jmp .cmpneg189
  3881                                  .cmpneg188:
  3882 00001428 A1[2300]                 mov ax, [iscmp]
  3883 0000142B 3D2703                   cmp ax, 807
  3884 0000142E 0F850C00                 jne .cmpneg190
  3885 00001432 68[F814]                 push cmpneg_1
  3886 00001435 E8A7EF                   call prs
  3887 00001438 83C402                   add  sp, 2
  3888                                  
  3889                                  ;-588   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF
  3890                                  
  3891 0000143B E9AF00                   jmp .cmpneg191
  3892                                  .cmpneg190:
  3893 0000143E A1[2300]                 mov ax, [iscmp]
  3894 00001441 3D3803                   cmp ax, 824
  3895 00001444 0F852100                 jne .cmpneg192
  3896 00001448 8B4604                   mov ax, [bp+4]
  3897 0000144B 08C0                     or  al, al
  3898 0000144D 0F840C00                 je .cmpneg193
  3899 00001451 68[0115]                 push cmpneg_2
  3900 00001454 E888EF                   call prs
  3901 00001457 83C402                   add  sp, 2
  3902                                  
  3903                                  ;-589                            else prs("\n ja  .");//ZF=0 CF=0
  3904                                  
  3905 0000145A E90900                   jmp .cmpneg194
  3906                                  .cmpneg193:
  3907 0000145D 68[0A15]                 push cmpneg_3
  3908 00001460 E87CEF                   call prs
  3909 00001463 83C402                   add  sp, 2
  3910                                  
  3911                                  ;-590   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);
  3912                                  
  3913                                  .cmpneg194:
  3914 00001466 E98400                   jmp .cmpneg195
  3915                                  .cmpneg192:
  3916 00001469 A1[2300]                 mov ax, [iscmp]
  3917 0000146C 3D2B03                   cmp ax, 811
  3918 0000146F 0F854500                 jne .cmpneg196
  3919 00001473 8B4604                   mov ax, [bp+4]
  3920 00001476 08C0                     or  al, al
  3921 00001478 0F841E00                 je .cmpneg197
  3922 0000147C 68[1315]                 push cmpneg_4
  3923 0000147F E85DEF                   call prs
  3924 00001482 83C402                   add  sp, 2
  3925 00001485 FF7604                   push word [bp+4]
  3926 00001488 E8B7F0                   call prunsign1
  3927 0000148B 83C402                   add  sp, 2
  3928                                  
  3929                                  ;-591                                prs("\n jl  .");}//          SF!=OF
  3930                                  
  3931 0000148E 68[2115]                 push cmpneg_5
  3932 00001491 E84BEF                   call prs
  3933 00001494 83C402                   add  sp, 2
  3934                                  
  3935                                  ;-592                            else{prs(" ;unsigned : "); prunsign1(ids);
  3936                                  
  3937 00001497 E91B00                   jmp .cmpneg198
  3938                                  .cmpneg197:
  3939 0000149A 68[2A15]                 push cmpneg_6
  3940 0000149D E83FEF                   call prs
  3941 000014A0 83C402                   add  sp, 2
  3942 000014A3 FF7604                   push word [bp+4]
  3943 000014A6 E899F0                   call prunsign1
  3944 000014A9 83C402                   add  sp, 2
  3945                                  
  3946                                  ;-593                                prs("\n jb  .");}//jb=jc=CF=1
  3947                                  
  3948 000014AC 68[3815]                 push cmpneg_7
  3949 000014AF E82DEF                   call prs
  3950 000014B2 83C402                   add  sp, 2
  3951                                  
  3952                                  ;-594   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF
  3953                                  
  3954                                  .cmpneg198:
  3955 000014B5 E93500                   jmp .cmpneg199
  3956                                  .cmpneg196:
  3957 000014B8 A1[2300]                 mov ax, [iscmp]
  3958 000014BB 83F83C                   cmp ax, 60
  3959 000014BE 0F850C00                 jne .cmpneg200
  3960 000014C2 68[4115]                 push cmpneg_8
  3961 000014C5 E817EF                   call prs
  3962 000014C8 83C402                   add  sp, 2
  3963                                  
  3964                                  ;-595   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF
  3965                                  
  3966 000014CB E91F00                   jmp .cmpneg201
  3967                                  .cmpneg200:
  3968 000014CE A1[2300]                 mov ax, [iscmp]
  3969 000014D1 83F83E                   cmp ax, 62
  3970 000014D4 0F850C00                 jne .cmpneg202
  3971 000014D8 68[4A15]                 push cmpneg_9
  3972 000014DB E801EF                   call prs
  3973 000014DE 83C402                   add  sp, 2
  3974                                  
  3975                                  ;-596   else error1("internal error compare unknown in CMPNEG()");  }
  3976                                  
  3977 000014E1 E90900                   jmp .cmpneg203
  3978                                  .cmpneg202:
  3979 000014E4 68[5315]                 push cmpneg_10
  3980 000014E7 E816F1                   call error1
  3981 000014EA 83C402                   add  sp, 2
  3982                                  .cmpneg203:
  3983                                  .cmpneg201:
  3984                                  .cmpneg199:
  3985                                  .cmpneg195:
  3986                                  .cmpneg191:
  3987                                  .cmpneg189:
  3988                                  
  3989                                  ;-597 
  3990                                  
  3991                                  
  3992                                  ;-598   int isrelational() {
  3993 000014ED C9                       LEAVE
  3994 000014EE C3                       ret
  3995 000014EF 5C6E206A6E65202E00      cmpneg_0 db "\n jne .",0
  3996 000014F8 5C6E206A6520202E00      cmpneg_1 db "\n je  .",0
  3997 00001501 5C6E206A6720202E00      cmpneg_2 db "\n jg  .",0
  3998 0000150A 5C6E206A6120202E00      cmpneg_3 db "\n ja  .",0
  3999 00001513 203B756E7369676E65-     cmpneg_4 db " ;unsigned : ",0
  4000 0000151C 64203A2000         
  4001 00001521 5C6E206A6C20202E00      cmpneg_5 db "\n jl  .",0
  4002 0000152A 203B756E7369676E65-     cmpneg_6 db " ;unsigned : ",0
  4003 00001533 64203A2000         
  4004 00001538 5C6E206A6220202E00      cmpneg_7 db "\n jb  .",0
  4005 00001541 5C6E206A6765202E00      cmpneg_8 db "\n jge .",0
  4006 0000154A 5C6E206A6C65202E00      cmpneg_9 db "\n jle .",0
  4007 00001553 696E7465726E616C20-     cmpneg_10 db "internal error compare unknown in CMPNEG()",0
  4008 0000155C 6572726F7220636F6D-
  4009 00001565 7061726520756E6B6E-
  4010 0000156E 6F776E20696E20434D-
  4011 00001577 504E4547282900     
  4012                                  ENDP
  4013                                  
  4014                                  isrelational: PROC
  4015                                  
  4016                                  ;-599     if (token==T_EQ) goto w; if (token==T_NE) goto w;
  4017                                  
  4018 0000157E A1[1E00]                 mov ax, [token]
  4019 00001581 3D2603                   cmp ax, 806
  4020 00001584 0F850300                 jne .isrelational204
  4021 00001588 E94700                   jmp .w
  4022                                  .isrelational204:
  4023 0000158B A1[1E00]                 mov ax, [token]
  4024 0000158E 3D2703                   cmp ax, 807
  4025 00001591 0F850300                 jne .isrelational205
  4026 00001595 E93A00                   jmp .w
  4027                                  
  4028                                  ;-600     if (token==T_LE) goto w; if (token==T_GE) goto w;
  4029                                  
  4030                                  .isrelational205:
  4031 00001598 A1[1E00]                 mov ax, [token]
  4032 0000159B 3D3803                   cmp ax, 824
  4033 0000159E 0F850300                 jne .isrelational206
  4034 000015A2 E92D00                   jmp .w
  4035                                  .isrelational206:
  4036 000015A5 A1[1E00]                 mov ax, [token]
  4037 000015A8 3D2B03                   cmp ax, 811
  4038 000015AB 0F850300                 jne .isrelational207
  4039 000015AF E92000                   jmp .w
  4040                                  
  4041                                  ;-601     if (token=='<' ) goto w; if (token=='>' ) goto w;
  4042                                  
  4043                                  .isrelational207:
  4044 000015B2 A1[1E00]                 mov ax, [token]
  4045 000015B5 83F83C                   cmp ax, 60
  4046 000015B8 0F850300                 jne .isrelational208
  4047 000015BC E91300                   jmp .w
  4048                                  .isrelational208:
  4049 000015BF A1[1E00]                 mov ax, [token]
  4050 000015C2 83F83E                   cmp ax, 62
  4051 000015C5 0F850300                 jne .isrelational209
  4052 000015C9 E90600                   jmp .w
  4053                                  
  4054                                  ;-602     return 0;  w: iscmp=token; token=getlex(); return 1;}
  4055                                  
  4056                                  .isrelational209:
  4057 000015CC B80000                   mov ax, 0
  4058 000015CF E91200                   jmp .retnisrelational
  4059                                  .w:
  4060 000015D2 A1[1E00]                 mov ax, [token]
  4061 000015D5 A3[2300]                 mov word [iscmp], ax
  4062 000015D8 E8C5F2                   call getlex
  4063 000015DB A3[1E00]                 mov word [token], ax
  4064 000015DE B80100                   mov ax, 1
  4065 000015E1 E90000                   jmp .retnisrelational
  4066                                  
  4067                                  ;-603 
  4068                                  
  4069                                  
  4070                                  ;-604 int checkreg() { // >=17 = 16bit, >=47 = 32bit
  4071                                  
  4072                                   .retnisrelational:
  4073 000015E4 C3                       ret
  4074                                  ENDP
  4075                                  
  4076                                  checkreg: PROC
  4077                                  
  4078                                  ;-605   if (strlen(symbol) <  2) return 0;
  4079                                  
  4080 000015E5 8D06606D                 lea  ax, [symbol]
  4081 000015E9 50                       push ax
  4082 000015EA E814EC                   call strlen
  4083 000015ED 83C402                   add  sp, 2
  4084 000015F0 83F802                   cmp ax, 2
  4085 000015F3 0F8D0600                 jge .checkreg210
  4086 000015F7 B80000                   mov ax, 0
  4087 000015FA E94403                   jmp .retncheckreg
  4088                                  
  4089                                  ;-606   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;
  4090                                  
  4091                                  .checkreg210:
  4092 000015FD 68[4219]                 push checkreg_0
  4093 00001600 8D06606D                 lea  ax, [symbol]
  4094 00001604 50                       push ax
  4095 00001605 E857EC                   call eqstr
  4096 00001608 83C404                   add  sp, 4
  4097 0000160B 08C0                     or  al, al
  4098 0000160D 0F840600                 je .checkreg211
  4099 00001611 B80100                   mov ax, 1
  4100 00001614 E92A03                   jmp .retncheckreg
  4101                                  .checkreg211:
  4102 00001617 68[4519]                 push checkreg_1
  4103 0000161A 8D06606D                 lea  ax, [symbol]
  4104 0000161E 50                       push ax
  4105 0000161F E83DEC                   call eqstr
  4106 00001622 83C404                   add  sp, 4
  4107 00001625 08C0                     or  al, al
  4108 00001627 0F840600                 je .checkreg212
  4109 0000162B B80300                   mov ax, 3
  4110 0000162E E91003                   jmp .retncheckreg
  4111                                  
  4112                                  ;-607   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;
  4113                                  
  4114                                  .checkreg212:
  4115 00001631 68[4819]                 push checkreg_2
  4116 00001634 8D06606D                 lea  ax, [symbol]
  4117 00001638 50                       push ax
  4118 00001639 E823EC                   call eqstr
  4119 0000163C 83C404                   add  sp, 4
  4120 0000163F 08C0                     or  al, al
  4121 00001641 0F840600                 je .checkreg213
  4122 00001645 B80500                   mov ax, 5
  4123 00001648 E9F602                   jmp .retncheckreg
  4124                                  .checkreg213:
  4125 0000164B 68[4B19]                 push checkreg_3
  4126 0000164E 8D06606D                 lea  ax, [symbol]
  4127 00001652 50                       push ax
  4128 00001653 E809EC                   call eqstr
  4129 00001656 83C404                   add  sp, 4
  4130 00001659 08C0                     or  al, al
  4131 0000165B 0F840600                 je .checkreg214
  4132 0000165F B80700                   mov ax, 7
  4133 00001662 E9DC02                   jmp .retncheckreg
  4134                                  
  4135                                  ;-608   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;
  4136                                  
  4137                                  .checkreg214:
  4138 00001665 68[4E19]                 push checkreg_4
  4139 00001668 8D06606D                 lea  ax, [symbol]
  4140 0000166C 50                       push ax
  4141 0000166D E8EFEB                   call eqstr
  4142 00001670 83C404                   add  sp, 4
  4143 00001673 08C0                     or  al, al
  4144 00001675 0F840600                 je .checkreg215
  4145 00001679 B80900                   mov ax, 9
  4146 0000167C E9C202                   jmp .retncheckreg
  4147                                  .checkreg215:
  4148 0000167F 68[5119]                 push checkreg_5
  4149 00001682 8D06606D                 lea  ax, [symbol]
  4150 00001686 50                       push ax
  4151 00001687 E8D5EB                   call eqstr
  4152 0000168A 83C404                   add  sp, 4
  4153 0000168D 08C0                     or  al, al
  4154 0000168F 0F840600                 je .checkreg216
  4155 00001693 B80B00                   mov ax, 11
  4156 00001696 E9A802                   jmp .retncheckreg
  4157                                  
  4158                                  ;-609   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;
  4159                                  
  4160                                  .checkreg216:
  4161 00001699 68[5419]                 push checkreg_6
  4162 0000169C 8D06606D                 lea  ax, [symbol]
  4163 000016A0 50                       push ax
  4164 000016A1 E8BBEB                   call eqstr
  4165 000016A4 83C404                   add  sp, 4
  4166 000016A7 08C0                     or  al, al
  4167 000016A9 0F840600                 je .checkreg217
  4168 000016AD B80D00                   mov ax, 13
  4169 000016B0 E98E02                   jmp .retncheckreg
  4170                                  .checkreg217:
  4171 000016B3 68[5719]                 push checkreg_7
  4172 000016B6 8D06606D                 lea  ax, [symbol]
  4173 000016BA 50                       push ax
  4174 000016BB E8A1EB                   call eqstr
  4175 000016BE 83C404                   add  sp, 4
  4176 000016C1 08C0                     or  al, al
  4177 000016C3 0F840600                 je .checkreg218
  4178 000016C7 B80F00                   mov ax, 15
  4179 000016CA E97402                   jmp .retncheckreg
  4180                                  
  4181                                  ;-610   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;
  4182                                  
  4183                                  .checkreg218:
  4184 000016CD 68[5A19]                 push checkreg_8
  4185 000016D0 8D06606D                 lea  ax, [symbol]
  4186 000016D4 50                       push ax
  4187 000016D5 E887EB                   call eqstr
  4188 000016D8 83C404                   add  sp, 4
  4189 000016DB 08C0                     or  al, al
  4190 000016DD 0F840600                 je .checkreg219
  4191 000016E1 B81100                   mov ax, 17
  4192 000016E4 E95A02                   jmp .retncheckreg
  4193                                  .checkreg219:
  4194 000016E7 68[5D19]                 push checkreg_9
  4195 000016EA 8D06606D                 lea  ax, [symbol]
  4196 000016EE 50                       push ax
  4197 000016EF E86DEB                   call eqstr
  4198 000016F2 83C404                   add  sp, 4
  4199 000016F5 08C0                     or  al, al
  4200 000016F7 0F840600                 je .checkreg220
  4201 000016FB B81300                   mov ax, 19
  4202 000016FE E94002                   jmp .retncheckreg
  4203                                  
  4204                                  ;-611   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;
  4205                                  
  4206                                  .checkreg220:
  4207 00001701 68[6019]                 push checkreg_10
  4208 00001704 8D06606D                 lea  ax, [symbol]
  4209 00001708 50                       push ax
  4210 00001709 E853EB                   call eqstr
  4211 0000170C 83C404                   add  sp, 4
  4212 0000170F 08C0                     or  al, al
  4213 00001711 0F840600                 je .checkreg221
  4214 00001715 B81500                   mov ax, 21
  4215 00001718 E92602                   jmp .retncheckreg
  4216                                  .checkreg221:
  4217 0000171B 68[6319]                 push checkreg_11
  4218 0000171E 8D06606D                 lea  ax, [symbol]
  4219 00001722 50                       push ax
  4220 00001723 E839EB                   call eqstr
  4221 00001726 83C404                   add  sp, 4
  4222 00001729 08C0                     or  al, al
  4223 0000172B 0F840600                 je .checkreg222
  4224 0000172F B81700                   mov ax, 23
  4225 00001732 E90C02                   jmp .retncheckreg
  4226                                  
  4227                                  ;-612   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;
  4228                                  
  4229                                  .checkreg222:
  4230 00001735 68[6619]                 push checkreg_12
  4231 00001738 8D06606D                 lea  ax, [symbol]
  4232 0000173C 50                       push ax
  4233 0000173D E81FEB                   call eqstr
  4234 00001740 83C404                   add  sp, 4
  4235 00001743 08C0                     or  al, al
  4236 00001745 0F840600                 je .checkreg223
  4237 00001749 B81900                   mov ax, 25
  4238 0000174C E9F201                   jmp .retncheckreg
  4239                                  .checkreg223:
  4240 0000174F 68[6919]                 push checkreg_13
  4241 00001752 8D06606D                 lea  ax, [symbol]
  4242 00001756 50                       push ax
  4243 00001757 E805EB                   call eqstr
  4244 0000175A 83C404                   add  sp, 4
  4245 0000175D 08C0                     or  al, al
  4246 0000175F 0F840600                 je .checkreg224
  4247 00001763 B81B00                   mov ax, 27
  4248 00001766 E9D801                   jmp .retncheckreg
  4249                                  
  4250                                  ;-613   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;
  4251                                  
  4252                                  .checkreg224:
  4253 00001769 68[6C19]                 push checkreg_14
  4254 0000176C 8D06606D                 lea  ax, [symbol]
  4255 00001770 50                       push ax
  4256 00001771 E8EBEA                   call eqstr
  4257 00001774 83C404                   add  sp, 4
  4258 00001777 08C0                     or  al, al
  4259 00001779 0F840600                 je .checkreg225
  4260 0000177D B81D00                   mov ax, 29
  4261 00001780 E9BE01                   jmp .retncheckreg
  4262                                  .checkreg225:
  4263 00001783 68[6F19]                 push checkreg_15
  4264 00001786 8D06606D                 lea  ax, [symbol]
  4265 0000178A 50                       push ax
  4266 0000178B E8D1EA                   call eqstr
  4267 0000178E 83C404                   add  sp, 4
  4268 00001791 08C0                     or  al, al
  4269 00001793 0F840600                 je .checkreg226
  4270 00001797 B81F00                   mov ax, 31
  4271 0000179A E9A401                   jmp .retncheckreg
  4272                                  
  4273                                  ;-614   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;
  4274                                  
  4275                                  .checkreg226:
  4276 0000179D 68[7219]                 push checkreg_16
  4277 000017A0 8D06606D                 lea  ax, [symbol]
  4278 000017A4 50                       push ax
  4279 000017A5 E8B7EA                   call eqstr
  4280 000017A8 83C404                   add  sp, 4
  4281 000017AB 08C0                     or  al, al
  4282 000017AD 0F840600                 je .checkreg227
  4283 000017B1 B82100                   mov ax, 33
  4284 000017B4 E98A01                   jmp .retncheckreg
  4285                                  .checkreg227:
  4286 000017B7 68[7519]                 push checkreg_17
  4287 000017BA 8D06606D                 lea  ax, [symbol]
  4288 000017BE 50                       push ax
  4289 000017BF E89DEA                   call eqstr
  4290 000017C2 83C404                   add  sp, 4
  4291 000017C5 08C0                     or  al, al
  4292 000017C7 0F840600                 je .checkreg228
  4293 000017CB B82300                   mov ax, 35
  4294 000017CE E97001                   jmp .retncheckreg
  4295                                  
  4296                                  ;-615   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;
  4297                                  
  4298                                  .checkreg228:
  4299 000017D1 68[7819]                 push checkreg_18
  4300 000017D4 8D06606D                 lea  ax, [symbol]
  4301 000017D8 50                       push ax
  4302 000017D9 E883EA                   call eqstr
  4303 000017DC 83C404                   add  sp, 4
  4304 000017DF 08C0                     or  al, al
  4305 000017E1 0F840600                 je .checkreg229
  4306 000017E5 B82500                   mov ax, 37
  4307 000017E8 E95601                   jmp .retncheckreg
  4308                                  .checkreg229:
  4309 000017EB 68[7B19]                 push checkreg_19
  4310 000017EE 8D06606D                 lea  ax, [symbol]
  4311 000017F2 50                       push ax
  4312 000017F3 E869EA                   call eqstr
  4313 000017F6 83C404                   add  sp, 4
  4314 000017F9 08C0                     or  al, al
  4315 000017FB 0F840600                 je .checkreg230
  4316 000017FF B82700                   mov ax, 39
  4317 00001802 E93C01                   jmp .retncheckreg
  4318                                  
  4319                                  ;-616   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;
  4320                                  
  4321                                  .checkreg230:
  4322 00001805 68[7E19]                 push checkreg_20
  4323 00001808 8D06606D                 lea  ax, [symbol]
  4324 0000180C 50                       push ax
  4325 0000180D E84FEA                   call eqstr
  4326 00001810 83C404                   add  sp, 4
  4327 00001813 08C0                     or  al, al
  4328 00001815 0F840600                 je .checkreg231
  4329 00001819 B82900                   mov ax, 41
  4330 0000181C E92201                   jmp .retncheckreg
  4331                                  .checkreg231:
  4332 0000181F 68[8119]                 push checkreg_21
  4333 00001822 8D06606D                 lea  ax, [symbol]
  4334 00001826 50                       push ax
  4335 00001827 E835EA                   call eqstr
  4336 0000182A 83C404                   add  sp, 4
  4337 0000182D 08C0                     or  al, al
  4338 0000182F 0F840600                 je .checkreg232
  4339 00001833 B82B00                   mov ax, 43
  4340 00001836 E90801                   jmp .retncheckreg
  4341                                  
  4342                                  ;-617   // (eqstr(symbol,"ip")) return 45;
  4343                                  
  4344                                  
  4345                                  ;-618   if (strlen(symbol) >   3) return 0;
  4346                                  
  4347                                  .checkreg232:
  4348 00001839 8D06606D                 lea  ax, [symbol]
  4349 0000183D 50                       push ax
  4350 0000183E E8C0E9                   call strlen
  4351 00001841 83C402                   add  sp, 2
  4352 00001844 83F803                   cmp ax, 3
  4353 00001847 0F8E0600                 jle .checkreg233
  4354 0000184B B80000                   mov ax, 0
  4355 0000184E E9F000                   jmp .retncheckreg
  4356                                  
  4357                                  ;-619   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;
  4358                                  
  4359                                  .checkreg233:
  4360 00001851 68[8419]                 push checkreg_22
  4361 00001854 8D06606D                 lea  ax, [symbol]
  4362 00001858 50                       push ax
  4363 00001859 E803EA                   call eqstr
  4364 0000185C 83C404                   add  sp, 4
  4365 0000185F 08C0                     or  al, al
  4366 00001861 0F840600                 je .checkreg234
  4367 00001865 B82F00                   mov ax, 47
  4368 00001868 E9D600                   jmp .retncheckreg
  4369                                  .checkreg234:
  4370 0000186B 68[8819]                 push checkreg_23
  4371 0000186E 8D06606D                 lea  ax, [symbol]
  4372 00001872 50                       push ax
  4373 00001873 E8E9E9                   call eqstr
  4374 00001876 83C404                   add  sp, 4
  4375 00001879 08C0                     or  al, al
  4376 0000187B 0F840600                 je .checkreg235
  4377 0000187F B83200                   mov ax, 50
  4378 00001882 E9BC00                   jmp .retncheckreg
  4379                                  
  4380                                  ;-620   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;
  4381                                  
  4382                                  .checkreg235:
  4383 00001885 68[8C19]                 push checkreg_24
  4384 00001888 8D06606D                 lea  ax, [symbol]
  4385 0000188C 50                       push ax
  4386 0000188D E8CFE9                   call eqstr
  4387 00001890 83C404                   add  sp, 4
  4388 00001893 08C0                     or  al, al
  4389 00001895 0F840600                 je .checkreg236
  4390 00001899 B83500                   mov ax, 53
  4391 0000189C E9A200                   jmp .retncheckreg
  4392                                  .checkreg236:
  4393 0000189F 68[9019]                 push checkreg_25
  4394 000018A2 8D06606D                 lea  ax, [symbol]
  4395 000018A6 50                       push ax
  4396 000018A7 E8B5E9                   call eqstr
  4397 000018AA 83C404                   add  sp, 4
  4398 000018AD 08C0                     or  al, al
  4399 000018AF 0F840600                 je .checkreg237
  4400 000018B3 B83800                   mov ax, 56
  4401 000018B6 E98800                   jmp .retncheckreg
  4402                                  
  4403                                  ;-621   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;
  4404                                  
  4405                                  .checkreg237:
  4406 000018B9 68[9419]                 push checkreg_26
  4407 000018BC 8D06606D                 lea  ax, [symbol]
  4408 000018C0 50                       push ax
  4409 000018C1 E89BE9                   call eqstr
  4410 000018C4 83C404                   add  sp, 4
  4411 000018C7 08C0                     or  al, al
  4412 000018C9 0F840600                 je .checkreg238
  4413 000018CD B83B00                   mov ax, 59
  4414 000018D0 E96E00                   jmp .retncheckreg
  4415                                  .checkreg238:
  4416 000018D3 68[9819]                 push checkreg_27
  4417 000018D6 8D06606D                 lea  ax, [symbol]
  4418 000018DA 50                       push ax
  4419 000018DB E881E9                   call eqstr
  4420 000018DE 83C404                   add  sp, 4
  4421 000018E1 08C0                     or  al, al
  4422 000018E3 0F840600                 je .checkreg239
  4423 000018E7 B83E00                   mov ax, 62
  4424 000018EA E95400                   jmp .retncheckreg
  4425                                  
  4426                                  ;-622   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;
  4427                                  
  4428                                  .checkreg239:
  4429 000018ED 68[9C19]                 push checkreg_28
  4430 000018F0 8D06606D                 lea  ax, [symbol]
  4431 000018F4 50                       push ax
  4432 000018F5 E867E9                   call eqstr
  4433 000018F8 83C404                   add  sp, 4
  4434 000018FB 08C0                     or  al, al
  4435 000018FD 0F840600                 je .checkreg240
  4436 00001901 B84100                   mov ax, 65
  4437 00001904 E93A00                   jmp .retncheckreg
  4438                                  .checkreg240:
  4439 00001907 68[A019]                 push checkreg_29
  4440 0000190A 8D06606D                 lea  ax, [symbol]
  4441 0000190E 50                       push ax
  4442 0000190F E84DE9                   call eqstr
  4443 00001912 83C404                   add  sp, 4
  4444 00001915 08C0                     or  al, al
  4445 00001917 0F840600                 je .checkreg241
  4446 0000191B B84400                   mov ax, 68
  4447 0000191E E92000                   jmp .retncheckreg
  4448                                  
  4449                                  ;-623   if (eqstr(symbol,"cr0")) return 71;
  4450                                  
  4451                                  .checkreg241:
  4452 00001921 68[A419]                 push checkreg_30
  4453 00001924 8D06606D                 lea  ax, [symbol]
  4454 00001928 50                       push ax
  4455 00001929 E833E9                   call eqstr
  4456 0000192C 83C404                   add  sp, 4
  4457 0000192F 08C0                     or  al, al
  4458 00001931 0F840600                 je .checkreg242
  4459 00001935 B84700                   mov ax, 71
  4460 00001938 E90600                   jmp .retncheckreg
  4461                                  
  4462                                  ;-624   return 0;   }
  4463                                  
  4464                                  .checkreg242:
  4465 0000193B B80000                   mov ax, 0
  4466 0000193E E90000                   jmp .retncheckreg
  4467                                  
  4468                                  ;-625 
  4469                                  
  4470                                  
  4471                                  ;-626 char printregstr[]
  4472                                  
  4473                                   .retncheckreg:
  4474 00001941 C3                       ret
  4475 00001942 616C00                  checkreg_0 db "al",0
  4476 00001945 636C00                  checkreg_1 db "cl",0
  4477 00001948 646C00                  checkreg_2 db "dl",0
  4478 0000194B 626C00                  checkreg_3 db "bl",0
  4479 0000194E 616800                  checkreg_4 db "ah",0
  4480 00001951 636800                  checkreg_5 db "ch",0
  4481 00001954 646800                  checkreg_6 db "dh",0
  4482 00001957 626800                  checkreg_7 db "bh",0
  4483 0000195A 617800                  checkreg_8 db "ax",0
  4484 0000195D 637800                  checkreg_9 db "cx",0
  4485 00001960 647800                  checkreg_10 db "dx",0
  4486 00001963 627800                  checkreg_11 db "bx",0
  4487 00001966 737000                  checkreg_12 db "sp",0
  4488 00001969 627000                  checkreg_13 db "bp",0
  4489 0000196C 736900                  checkreg_14 db "si",0
  4490 0000196F 646900                  checkreg_15 db "di",0
  4491 00001972 657300                  checkreg_16 db "es",0
  4492 00001975 637300                  checkreg_17 db "cs",0
  4493 00001978 737300                  checkreg_18 db "ss",0
  4494 0000197B 647300                  checkreg_19 db "ds",0
  4495 0000197E 667300                  checkreg_20 db "fs",0
  4496 00001981 677300                  checkreg_21 db "gs",0
  4497 00001984 65617800                checkreg_22 db "eax",0
  4498 00001988 65637800                checkreg_23 db "ecx",0
  4499 0000198C 65647800                checkreg_24 db "edx",0
  4500 00001990 65627800                checkreg_25 db "ebx",0
  4501 00001994 65737000                checkreg_26 db "esp",0
  4502 00001998 65627000                checkreg_27 db "ebp",0
  4503 0000199C 65736900                checkreg_28 db "esi",0
  4504 000019A0 65646900                checkreg_29 db "edi",0
  4505 000019A4 63723000                checkreg_30 db "cr0",0
  4506                                  ENDP
  4507                                  
  4508                                  ;-627 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";
  4509                                  
  4510 000019A8 2A616C636C646C626C-     printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0
  4511 000019B1 616863686468626861-
  4512 000019BA 786378647862787370-
  4513 000019C3 627073696469657363-
  4514 000019CC 737373647366736773-
  4515 000019D5 697065617865637865-
  4516 000019DE 647865627865737065-
  4517 000019E7 627065736965646963-
  4518 000019F0 723000             
  4519                                  
  4520                                  ;-628 
  4521                                  
  4522                                  
  4523                                  ;-629 int printreg(int i) {  unsigned int k; unsigned char c;
  4524                                  
  4525                                  
  4526                                  printreg: PROC
  4527                                  
  4528                                  ;-630   k = &printregstr + i; c=*k; prc(c); i++;
  4529                                  ;
  4530 000019F3 C8040000                 ENTER  4,0
  4531 000019F7 B8[A819]                 mov ax, printregstr
  4532 000019FA 034604                   add ax, [bp+4]
  4533 000019FD 8946FE                   mov [bp-2], ax
  4534 00001A00 8B5EFE                   mov bx, [bp-2]
  4535 00001A03 8B07                     mov ax, [bx]
  4536 00001A05 8846FC                   mov [bp-4], al
  4537 00001A08 8A46FC                   mov al, byte [bp-4]
  4538 00001A0B B400                     mov ah, 0
  4539 00001A0D 50                       push ax
  4540 00001A0E E875E9                   call prc
  4541 00001A11 83C402                   add  sp, 2
  4542 00001A14 FF4604                   inc  word[bp+4]
  4543                                  
  4544                                  ;-631   k = &printregstr + i; c=*k; prc(c);
  4545                                  
  4546 00001A17 B8[A819]                 mov ax, printregstr
  4547 00001A1A 034604                   add ax, [bp+4]
  4548 00001A1D 8946FE                   mov [bp-2], ax
  4549 00001A20 8B5EFE                   mov bx, [bp-2]
  4550 00001A23 8B07                     mov ax, [bx]
  4551 00001A25 8846FC                   mov [bp-4], al
  4552 00001A28 8A46FC                   mov al, byte [bp-4]
  4553 00001A2B B400                     mov ah, 0
  4554 00001A2D 50                       push ax
  4555 00001A2E E855E9                   call prc
  4556 00001A31 83C402                   add  sp, 2
  4557                                  
  4558                                  ;-632   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }
  4559                                  
  4560 00001A34 8B4604                   mov ax, [bp+4]
  4561 00001A37 83F82F                   cmp ax, 47
  4562 00001A3A 0F8E2000                 jle .printreg243
  4563 00001A3E FF4604                   inc  word[bp+4]
  4564 00001A41 B8[A819]                 mov ax, printregstr
  4565 00001A44 034604                   add ax, [bp+4]
  4566 00001A47 8946FE                   mov [bp-2], ax
  4567 00001A4A 8B5EFE                   mov bx, [bp-2]
  4568 00001A4D 8B07                     mov ax, [bx]
  4569 00001A4F 8846FC                   mov [bp-4], al
  4570 00001A52 8A46FC                   mov al, byte [bp-4]
  4571 00001A55 B400                     mov ah, 0
  4572 00001A57 50                       push ax
  4573 00001A58 E82BE9                   call prc
  4574 00001A5B 83C402                   add  sp, 2
  4575                                  
  4576                                  ;-633 }
  4577                                  
  4578                                  .printreg243:
  4579                                  
  4580                                  ;-634 
  4581                                  
  4582                                  
  4583                                  ;-635 int constantexpr() { int mode; int id1;int ids;
  4584 00001A5E C9                       LEAVE
  4585 00001A5F C3                       ret
  4586                                  ENDP
  4587                                  
  4588                                  constantexpr: PROC
  4589                                  
  4590                                  ;-636   token=getlex();   mode=typeName();
  4591                                  ;
  4592 00001A60 C8060000                 ENTER  6,0
  4593 00001A64 E839EE                   call getlex
  4594 00001A67 A3[1E00]                 mov word [token], ax
  4595 00001A6A E8DAF6                   call typeName
  4596 00001A6D 8946FE                   mov [bp-2], ax
  4597                                  
  4598                                  ;-637   id1=searchname(); gettypes(id1); ids=signi;
  4599                                  
  4600 00001A70 E876F6                   call searchname
  4601 00001A73 8946FC                   mov [bp-4], ax
  4602 00001A76 FF76FC                   push word [bp-4]
  4603 00001A79 E8A4F7                   call gettypes
  4604 00001A7C 83C402                   add  sp, 2
  4605 00001A7F A1[3000]                 mov ax, [signi]
  4606 00001A82 8946FA                   mov [bp-6], ax
  4607                                  
  4608                                  ;-638   if (isrelational() ==0) error1("Relational expression expected");
  4609                                  
  4610 00001A85 E8F6FA                   call isrelational
  4611 00001A88 83F800                   cmp ax, 0
  4612 00001A8B 0F850900                 jne .constantexpr244
  4613 00001A8F 68[151B]                 push constantexpr_0
  4614 00001A92 E86BEB                   call error1
  4615 00001A95 83C402                   add  sp, 2
  4616                                  
  4617                                  ;-639   expect(T_CONST);  prs(" ; constant expression");
  4618                                  
  4619                                  .constantexpr244:
  4620 00001A98 680101                   push 257
  4621 00001A9B E8D6F4                   call expect
  4622 00001A9E 83C402                   add  sp, 2
  4623 00001AA1 68[341B]                 push constantexpr_1
  4624 00001AA4 E838E9                   call prs
  4625 00001AA7 83C402                   add  sp, 2
  4626                                  
  4627                                  ;-640   prs("\ncmp ");
  4628                                  
  4629 00001AAA 68[4B1B]                 push constantexpr_2
  4630 00001AAD E82FE9                   call prs
  4631 00001AB0 83C402                   add  sp, 2
  4632                                  
  4633                                  ;-641   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  4634                                  
  4635 00001AB3 FF76FC                   push word [bp-4]
  4636 00001AB6 E867F7                   call gettypes
  4637 00001AB9 83C402                   add  sp, 2
  4638 00001ABC A1[3600]                 mov ax, [wi]
  4639 00001ABF 83F802                   cmp ax, 2
  4640 00001AC2 0F850C00                 jne .constantexpr245
  4641 00001AC6 68[521B]                 push constantexpr_3
  4642 00001AC9 E813E9                   call prs
  4643 00001ACC 83C402                   add  sp, 2
  4644 00001ACF E90900                   jmp .constantexpr246
  4645                                  .constantexpr245:
  4646 00001AD2 68[571B]                 push constantexpr_4
  4647 00001AD5 E807E9                   call prs
  4648 00001AD8 83C402                   add  sp, 2
  4649                                  
  4650                                  ;-642   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);
  4651                                  
  4652                                  .constantexpr246:
  4653 00001ADB FF76FC                   push word [bp-4]
  4654 00001ADE E8FBF4                   call v
  4655 00001AE1 83C402                   add  sp, 2
  4656 00001AE4 68[5C1B]                 push constantexpr_5
  4657 00001AE7 E8F5E8                   call prs
  4658 00001AEA 83C402                   add  sp, 2
  4659 00001AED FF36[2B00]               push word [lexval]
  4660 00001AF1 E84EEA                   call prunsign1
  4661 00001AF4 83C402                   add  sp, 2
  4662 00001AF7 FF76FA                   push word [bp-6]
  4663 00001AFA E811F9                   call cmpneg
  4664 00001AFD 83C402                   add  sp, 2
  4665 00001B00 8D06E06D                 lea  ax, [fname]
  4666 00001B04 50                       push ax
  4667 00001B05 E8D7E8                   call prs
  4668 00001B08 83C402                   add  sp, 2
  4669                                  
  4670                                  ;-643   expect(')');
  4671                                  
  4672 00001B0B 6A29                     push 41
  4673 00001B0D E864F4                   call expect
  4674 00001B10 83C402                   add  sp, 2
  4675                                  
  4676                                  ;-644 }
  4677                                  
  4678                                  
  4679                                  ;-645 
  4680                                  
  4681                                  
  4682                                  ;-646 char ops[5];
  4683 00001B13 C9                       LEAVE
  4684 00001B14 C3                       ret
  4685 00001B15 52656C6174696F6E61-     constantexpr_0 db "Relational expression expected",0
  4686 00001B1E 6C2065787072657373-
  4687 00001B27 696F6E206578706563-
  4688 00001B30 74656400           
  4689 00001B34 203B20636F6E737461-     constantexpr_1 db " ; constant expression",0
  4690 00001B3D 6E7420657870726573-
  4691 00001B46 73696F6E00         
  4692 00001B4B 5C6E636D702000          constantexpr_2 db "\ncmp ",0
  4693 00001B52 776F726400              constantexpr_3 db "word",0
  4694 00001B57 6279746500              constantexpr_4 db "byte",0
  4695 00001B5C 2C2000                  constantexpr_5 db ", ",0
  4696                                  ENDP
  4697                                  section .bss
  4698                                  absolute 41737
  4699 0000A309 <res 00000005>          ops resb 5
  4700                                  section .text
  4701                                  
  4702                                  ;-647 int doreg1(int iscmp1) { int i;
  4703                                  
  4704                                  
  4705                                  doreg1: PROC
  4706                                  
  4707                                  ;-648   if (istoken('='))          strcpy(ops, "mov");
  4708                                  ;
  4709 00001B5F C8020000                 ENTER  2,0
  4710 00001B63 6A3D                     push 61
  4711 00001B65 E8EAF3                   call istoken
  4712 00001B68 83C402                   add  sp, 2
  4713 00001B6B 08C0                     or  al, al
  4714 00001B6D 0F840E00                 je .doreg1247
  4715 00001B71 68[121D]                 push doreg1_0
  4716 00001B74 8D0609A3                 lea  ax, [ops]
  4717 00001B78 50                       push ax
  4718 00001B79 E8ADE6                   call strcpy
  4719 00001B7C 83C404                   add  sp, 4
  4720                                  
  4721                                  ;-649   if (istoken(T_PLUSASS))    strcpy(ops, "add");
  4722                                  
  4723                                  .doreg1247:
  4724 00001B7F 68CE04                   push 1230
  4725 00001B82 E8CDF3                   call istoken
  4726 00001B85 83C402                   add  sp, 2
  4727 00001B88 08C0                     or  al, al
  4728 00001B8A 0F840E00                 je .doreg1248
  4729 00001B8E 68[161D]                 push doreg1_1
  4730 00001B91 8D0609A3                 lea  ax, [ops]
  4731 00001B95 50                       push ax
  4732 00001B96 E890E6                   call strcpy
  4733 00001B99 83C404                   add  sp, 4
  4734                                  
  4735                                  ;-650   if (istoken(T_MINUSASS))   strcpy(ops, "sub");
  4736                                  
  4737                                  .doreg1248:
  4738 00001B9C 68CF04                   push 1231
  4739 00001B9F E8B0F3                   call istoken
  4740 00001BA2 83C402                   add  sp, 2
  4741 00001BA5 08C0                     or  al, al
  4742 00001BA7 0F840E00                 je .doreg1249
  4743 00001BAB 68[1A1D]                 push doreg1_2
  4744 00001BAE 8D0609A3                 lea  ax, [ops]
  4745 00001BB2 50                       push ax
  4746 00001BB3 E873E6                   call strcpy
  4747 00001BB6 83C404                   add  sp, 4
  4748                                  
  4749                                  ;-651   if (istoken(T_ANDASS))     strcpy(ops, "and");
  4750                                  
  4751                                  .doreg1249:
  4752 00001BB9 68D204                   push 1234
  4753 00001BBC E893F3                   call istoken
  4754 00001BBF 83C402                   add  sp, 2
  4755 00001BC2 08C0                     or  al, al
  4756 00001BC4 0F840E00                 je .doreg1250
  4757 00001BC8 68[1E1D]                 push doreg1_3
  4758 00001BCB 8D0609A3                 lea  ax, [ops]
  4759 00001BCF 50                       push ax
  4760 00001BD0 E856E6                   call strcpy
  4761 00001BD3 83C404                   add  sp, 4
  4762                                  
  4763                                  ;-652   if (istoken(T_ORASS))      strcpy(ops, "or" );
  4764                                  
  4765                                  .doreg1250:
  4766 00001BD6 68D304                   push 1235
  4767 00001BD9 E876F3                   call istoken
  4768 00001BDC 83C402                   add  sp, 2
  4769 00001BDF 08C0                     or  al, al
  4770 00001BE1 0F840E00                 je .doreg1251
  4771 00001BE5 68[221D]                 push doreg1_4
  4772 00001BE8 8D0609A3                 lea  ax, [ops]
  4773 00001BEC 50                       push ax
  4774 00001BED E839E6                   call strcpy
  4775 00001BF0 83C404                   add  sp, 4
  4776                                  
  4777                                  ;-653   if (istoken(T_LESSLESS))   strcpy(ops, "shl");
  4778                                  
  4779                                  .doreg1251:
  4780 00001BF3 68D804                   push 1240
  4781 00001BF6 E859F3                   call istoken
  4782 00001BF9 83C402                   add  sp, 2
  4783 00001BFC 08C0                     or  al, al
  4784 00001BFE 0F840E00                 je .doreg1252
  4785 00001C02 68[251D]                 push doreg1_5
  4786 00001C05 8D0609A3                 lea  ax, [ops]
  4787 00001C09 50                       push ax
  4788 00001C0A E81CE6                   call strcpy
  4789 00001C0D 83C404                   add  sp, 4
  4790                                  
  4791                                  ;-654   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");
  4792                                  
  4793                                  .doreg1252:
  4794 00001C10 68D904                   push 1241
  4795 00001C13 E83CF3                   call istoken
  4796 00001C16 83C402                   add  sp, 2
  4797 00001C19 08C0                     or  al, al
  4798 00001C1B 0F840E00                 je .doreg1253
  4799 00001C1F 68[291D]                 push doreg1_6
  4800 00001C22 8D0609A3                 lea  ax, [ops]
  4801 00001C26 50                       push ax
  4802 00001C27 E8FFE5                   call strcpy
  4803 00001C2A 83C404                   add  sp, 4
  4804                                  
  4805                                  ;-655   if (iscmp1 == 1) { token=getlex();
  4806                                  
  4807                                  .doreg1253:
  4808 00001C2D 8B4604                   mov ax, [bp+4]
  4809 00001C30 83F801                   cmp ax, 1
  4810 00001C33 0F852700                 jne .doreg1254
  4811 00001C37 E866EC                   call getlex
  4812 00001C3A A3[1E00]                 mov word [token], ax
  4813                                  
  4814                                  ;-656       if (isrelational() ==0) error1("Relational expected");
  4815                                  
  4816 00001C3D E83EF9                   call isrelational
  4817 00001C40 83F800                   cmp ax, 0
  4818 00001C43 0F850900                 jne .doreg1255
  4819 00001C47 68[2D1D]                 push doreg1_7
  4820 00001C4A E8B3E9                   call error1
  4821 00001C4D 83C402                   add  sp, 2
  4822                                  
  4823                                  ;-657       strcpy(ops, "cmp"); }
  4824                                  
  4825                                  .doreg1255:
  4826 00001C50 68[411D]                 push doreg1_8
  4827 00001C53 8D0609A3                 lea  ax, [ops]
  4828 00001C57 50                       push ax
  4829 00001C58 E8CEE5                   call strcpy
  4830 00001C5B 83C404                   add  sp, 4
  4831                                  
  4832                                  ;-658   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");
  4833                                  
  4834                                  .doreg1254:
  4835 00001C5E E812E8                   call prnl
  4836 00001C61 8D0609A3                 lea  ax, [ops]
  4837 00001C65 50                       push ax
  4838 00001C66 E876E7                   call prs
  4839 00001C69 83C402                   add  sp, 2
  4840 00001C6C 68[451D]                 push doreg1_9
  4841 00001C6F E86DE7                   call prs
  4842 00001C72 83C402                   add  sp, 2
  4843 00001C75 FF36[4B00]               push word [ireg1]
  4844 00001C79 E877FD                   call printreg
  4845 00001C7C 83C402                   add  sp, 2
  4846 00001C7F 68[481D]                 push doreg1_10
  4847 00001C82 E85AE7                   call prs
  4848 00001C85 83C402                   add  sp, 2
  4849                                  
  4850                                  ;-659 
  4851                                  
  4852                                  
  4853                                  ;-660   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}
  4854                                  
  4855 00001C88 680101                   push 257
  4856 00001C8B E8C4F2                   call istoken
  4857 00001C8E 83C402                   add  sp, 2
  4858 00001C91 08C0                     or  al, al
  4859 00001C93 0F840D00                 je .doreg1256
  4860 00001C97 FF36[2B00]               push word [lexval]
  4861 00001C9B E8A4E8                   call prunsign1
  4862 00001C9E 83C402                   add  sp, 2
  4863 00001CA1 E94700                   jmp .reg1
  4864                                  
  4865                                  ;-661   mod2=typeName(); ireg2=checkreg();
  4866                                  
  4867                                  .doreg1256:
  4868 00001CA4 E8A0F4                   call typeName
  4869 00001CA7 A3[4D00]                 mov word [mod2], ax
  4870 00001CAA E838F9                   call checkreg
  4871 00001CAD A3[4F00]                 mov word [ireg2], ax
  4872                                  
  4873                                  ;-662   if (ireg2) {printreg(ireg2); goto reg1;}
  4874                                  
  4875 00001CB0 A1[4F00]                 mov ax, [ireg2]
  4876 00001CB3 08C0                     or  al, al
  4877 00001CB5 0F840D00                 je .doreg1257
  4878 00001CB9 FF36[4F00]               push word [ireg2]
  4879 00001CBD E833FD                   call printreg
  4880 00001CC0 83C402                   add  sp, 2
  4881 00001CC3 E92500                   jmp .reg1
  4882                                  
  4883                                  ;-663   i=searchname();  if (mod2 == 2) printName(i); else v(i);
  4884                                  
  4885                                  .doreg1257:
  4886 00001CC6 E820F4                   call searchname
  4887 00001CC9 8946FE                   mov [bp-2], ax
  4888 00001CCC A1[4D00]                 mov ax, [mod2]
  4889 00001CCF 83F802                   cmp ax, 2
  4890 00001CD2 0F850C00                 jne .doreg1258
  4891 00001CD6 FF76FE                   push word [bp-2]
  4892 00001CD9 E822EB                   call printName
  4893 00001CDC 83C402                   add  sp, 2
  4894 00001CDF E90900                   jmp .doreg1259
  4895                                  .doreg1258:
  4896 00001CE2 FF76FE                   push word [bp-2]
  4897 00001CE5 E8F4F2                   call v
  4898 00001CE8 83C402                   add  sp, 2
  4899                                  
  4900                                  ;-664   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }
  4901                                  
  4902                                  .doreg1259:
  4903                                  .reg1:
  4904 00001CEB 8B4604                   mov ax, [bp+4]
  4905 00001CEE 83F801                   cmp ax, 1
  4906 00001CF1 0F851B00                 jne .doreg1260
  4907 00001CF5 6A00                     push 0
  4908 00001CF7 E814F7                   call cmpneg
  4909 00001CFA 83C402                   add  sp, 2
  4910 00001CFD 8D06E06D                 lea  ax, [fname]
  4911 00001D01 50                       push ax
  4912 00001D02 E8DAE6                   call prs
  4913 00001D05 83C402                   add  sp, 2
  4914 00001D08 6A29                     push 41
  4915 00001D0A E867F2                   call expect
  4916 00001D0D 83C402                   add  sp, 2
  4917                                  
  4918                                  ;-665 }
  4919                                  
  4920                                  .doreg1260:
  4921                                  
  4922                                  ;-666 
  4923                                  
  4924                                  
  4925                                  ;-667 int compoundass(char *op, int mode, int id1) {
  4926 00001D10 C9                       LEAVE
  4927 00001D11 C3                       ret
  4928 00001D12 6D6F7600                doreg1_0 db "mov",0
  4929 00001D16 61646400                doreg1_1 db "add",0
  4930 00001D1A 73756200                doreg1_2 db "sub",0
  4931 00001D1E 616E6400                doreg1_3 db "and",0
  4932 00001D22 6F7200                  doreg1_4 db "or",0
  4933 00001D25 73686C00                doreg1_5 db "shl",0
  4934 00001D29 73687200                doreg1_6 db "shr",0
  4935 00001D2D 52656C6174696F6E61-     doreg1_7 db "Relational expected",0
  4936 00001D36 6C2065787065637465-
  4937 00001D3F 6400               
  4938 00001D41 636D7000                doreg1_8 db "cmp",0
  4939 00001D45 202000                  doreg1_9 db "  ",0
  4940 00001D48 2C2000                  doreg1_10 db ", ",0
  4941                                  ENDP
  4942                                  
  4943                                  compoundass: PROC
  4944                                  
  4945                                  ;-668   if(mode) error1("only scalar Var allowed");
  4946                                  ;
  4947 00001D4B C8000000                 ENTER  0,0
  4948 00001D4F 8B4606                   mov ax, [bp+6]
  4949 00001D52 08C0                     or  al, al
  4950 00001D54 0F840900                 je .compoundass261
  4951 00001D58 68[C51D]                 push compoundass_0
  4952 00001D5B E8A2E8                   call error1
  4953 00001D5E 83C402                   add  sp, 2
  4954                                  
  4955                                  ;-669   prnl(); prs(op); prs("  ");
  4956                                  
  4957                                  .compoundass261:
  4958 00001D61 E80FE7                   call prnl
  4959 00001D64 FF7604                   push word [bp+4]
  4960 00001D67 E875E6                   call prs
  4961 00001D6A 83C402                   add  sp, 2
  4962 00001D6D 68[DD1D]                 push compoundass_1
  4963 00001D70 E86CE6                   call prs
  4964 00001D73 83C402                   add  sp, 2
  4965                                  
  4966                                  ;-670   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  4967                                  
  4968 00001D76 FF7608                   push word [bp+8]
  4969 00001D79 E8A4F4                   call gettypes
  4970 00001D7C 83C402                   add  sp, 2
  4971 00001D7F A1[3600]                 mov ax, [wi]
  4972 00001D82 83F802                   cmp ax, 2
  4973 00001D85 0F850C00                 jne .compoundass262
  4974 00001D89 68[E01D]                 push compoundass_2
  4975 00001D8C E850E6                   call prs
  4976 00001D8F 83C402                   add  sp, 2
  4977 00001D92 E90900                   jmp .compoundass263
  4978                                  .compoundass262:
  4979 00001D95 68[E51D]                 push compoundass_3
  4980 00001D98 E844E6                   call prs
  4981 00001D9B 83C402                   add  sp, 2
  4982                                  
  4983                                  ;-671   v(id1); prs(", ");
  4984                                  
  4985                                  .compoundass263:
  4986 00001D9E FF7608                   push word [bp+8]
  4987 00001DA1 E838F2                   call v
  4988 00001DA4 83C402                   add  sp, 2
  4989 00001DA7 68[EA1D]                 push compoundass_4
  4990 00001DAA E832E6                   call prs
  4991 00001DAD 83C402                   add  sp, 2
  4992                                  
  4993                                  ;-672   expect(T_CONST); prunsign1(lexval);
  4994                                  
  4995 00001DB0 680101                   push 257
  4996 00001DB3 E8BEF1                   call expect
  4997 00001DB6 83C402                   add  sp, 2
  4998 00001DB9 FF36[2B00]               push word [lexval]
  4999 00001DBD E882E7                   call prunsign1
  5000 00001DC0 83C402                   add  sp, 2
  5001                                  
  5002                                  ;-673 }
  5003                                  
  5004                                  
  5005                                  ;-674 int dovar1(int mode, int op, int ixarr, int id1) {
  5006 00001DC3 C9                       LEAVE
  5007 00001DC4 C3                       ret
  5008 00001DC5 6F6E6C79207363616C-     compoundass_0 db "only scalar Var allowed",0
  5009 00001DCE 61722056617220616C-
  5010 00001DD7 6C6F77656400       
  5011 00001DDD 202000                  compoundass_1 db "  ",0
  5012 00001DE0 776F726400              compoundass_2 db "word",0
  5013 00001DE5 6279746500              compoundass_3 db "byte",0
  5014 00001DEA 2C2000                  compoundass_4 db ", ",0
  5015                                  ENDP
  5016                                  
  5017                                  dovar1: PROC
  5018                                  
  5019                                  ;-675   gettypes(id1);
  5020                                  ;
  5021 00001DED C8000000                 ENTER  0,0
  5022 00001DF1 FF760A                   push word [bp+10]
  5023 00001DF4 E829F4                   call gettypes
  5024 00001DF7 83C402                   add  sp, 2
  5025                                  
  5026                                  ;-676   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);
  5027                                  
  5028 00001DFA 8B4604                   mov ax, [bp+4]
  5029 00001DFD 83F801                   cmp ax, 1
  5030 00001E00 0F854700                 jne .dovar1264
  5031 00001E04 68[421F]                 push dovar1_0
  5032 00001E07 E8D5E5                   call prs
  5033 00001E0A 83C402                   add  sp, 2
  5034 00001E0D FF760A                   push word [bp+10]
  5035 00001E10 E8C9F1                   call v
  5036 00001E13 83C402                   add  sp, 2
  5037 00001E16 E85AE6                   call prnl
  5038 00001E19 FF7606                   push word [bp+6]
  5039 00001E1C E8C0E5                   call prs
  5040 00001E1F 83C402                   add  sp, 2
  5041                                  
  5042                                  ;-677     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");
  5043                                  
  5044 00001E22 A1[3300]                 mov ax, [widthi]
  5045 00001E25 83F801                   cmp ax, 1
  5046 00001E28 0F850900                 jne .dovar1265
  5047 00001E2C 68[4E1F]                 push dovar1_1
  5048 00001E2F E8ADE5                   call prs
  5049 00001E32 83C402                   add  sp, 2
  5050                                  
  5051                                  ;-678     if(widthi == 2) prs(" ax, [bx]");
  5052                                  
  5053                                  .dovar1265:
  5054 00001E35 A1[3300]                 mov ax, [widthi]
  5055 00001E38 83F802                   cmp ax, 2
  5056 00001E3B 0F850900                 jne .dovar1266
  5057 00001E3F 68[641F]                 push dovar1_2
  5058 00001E42 E89AE5                   call prs
  5059 00001E45 83C402                   add  sp, 2
  5060                                  
  5061                                  ;-679     return; }
  5062                                  
  5063                                  .dovar1266:
  5064 00001E48 E9F500                   jmp .retndovar1
  5065                                  
  5066                                  ;-680   if (mode==2){prnl();prs(op);prs(" ax, "); printName(id1); return; }
  5067                                  
  5068                                  .dovar1264:
  5069 00001E4B 8B4604                   mov ax, [bp+4]
  5070 00001E4E 83F802                   cmp ax, 2
  5071 00001E51 0F852100                 jne .dovar1267
  5072 00001E55 E81BE6                   call prnl
  5073 00001E58 FF7606                   push word [bp+6]
  5074 00001E5B E881E5                   call prs
  5075 00001E5E 83C402                   add  sp, 2
  5076 00001E61 68[6E1F]                 push dovar1_3
  5077 00001E64 E878E5                   call prs
  5078 00001E67 83C402                   add  sp, 2
  5079 00001E6A FF760A                   push word [bp+10]
  5080 00001E6D E88EE9                   call printName
  5081 00001E70 83C402                   add  sp, 2
  5082 00001E73 E9CA00                   jmp .retndovar1
  5083                                  
  5084                                  ;-681   if (ixarr) {
  5085                                  
  5086                                  .dovar1267:
  5087 00001E76 8B4608                   mov ax, [bp+8]
  5088 00001E79 08C0                     or  al, al
  5089 00001E7B 0F847300                 je .dovar1268
  5090                                  
  5091                                  ;-682     prs("\n mov bx, "); v(ixarr);
  5092                                  
  5093 00001E7F 68[741F]                 push dovar1_4
  5094 00001E82 E85AE5                   call prs
  5095 00001E85 83C402                   add  sp, 2
  5096 00001E88 FF7608                   push word [bp+8]
  5097 00001E8B E84EF1                   call v
  5098 00001E8E 83C402                   add  sp, 2
  5099                                  
  5100                                  ;-683     if (wi==2) prs("\n shl bx, 1");
  5101                                  
  5102 00001E91 A1[3600]                 mov ax, [wi]
  5103 00001E94 83F802                   cmp ax, 2
  5104 00001E97 0F850900                 jne .dovar1269
  5105 00001E9B 68[801F]                 push dovar1_5
  5106 00001E9E E83EE5                   call prs
  5107 00001EA1 83C402                   add  sp, 2
  5108                                  
  5109                                  ;-684     prs("\n "); prs(op);
  5110                                  
  5111                                  .dovar1269:
  5112 00001EA4 68[8D1F]                 push dovar1_6
  5113 00001EA7 E835E5                   call prs
  5114 00001EAA 83C402                   add  sp, 2
  5115 00001EAD FF7606                   push word [bp+6]
  5116 00001EB0 E82CE5                   call prs
  5117 00001EB3 83C402                   add  sp, 2
  5118                                  
  5119                                  ;-685     if (wi==2) prs(" ax, "); else prs(" al, ");
  5120                                  
  5121 00001EB6 A1[3600]                 mov ax, [wi]
  5122 00001EB9 83F802                   cmp ax, 2
  5123 00001EBC 0F850C00                 jne .dovar1270
  5124 00001EC0 68[911F]                 push dovar1_7
  5125 00001EC3 E819E5                   call prs
  5126 00001EC6 83C402                   add  sp, 2
  5127 00001EC9 E90900                   jmp .dovar1271
  5128                                  .dovar1270:
  5129 00001ECC 68[971F]                 push dovar1_8
  5130 00001ECF E80DE5                   call prs
  5131 00001ED2 83C402                   add  sp, 2
  5132                                  
  5133                                  ;-686 // v(id1); prs(" [bx]");
  5134                                  
  5135                                  
  5136                                  ;-687     prc('['); printName(id1); prs(" + bx]");
  5137                                  
  5138                                  .dovar1271:
  5139 00001ED5 6A5B                     push 91
  5140 00001ED7 E8ACE4                   call prc
  5141 00001EDA 83C402                   add  sp, 2
  5142 00001EDD FF760A                   push word [bp+10]
  5143 00001EE0 E81BE9                   call printName
  5144 00001EE3 83C402                   add  sp, 2
  5145 00001EE6 68[9D1F]                 push dovar1_9
  5146 00001EE9 E8F3E4                   call prs
  5147 00001EEC 83C402                   add  sp, 2
  5148                                  
  5149                                  ;-688     return; }
  5150                                  
  5151 00001EEF E94E00                   jmp .retndovar1
  5152                                  
  5153                                  ;-689   prnl();prs(op);
  5154                                  
  5155                                  .dovar1268:
  5156 00001EF2 E87EE5                   call prnl
  5157 00001EF5 FF7606                   push word [bp+6]
  5158 00001EF8 E8E4E4                   call prs
  5159 00001EFB 83C402                   add  sp, 2
  5160                                  
  5161                                  ;-690   if(wi==1) prs(" al, ");
  5162                                  
  5163 00001EFE A1[3600]                 mov ax, [wi]
  5164 00001F01 83F801                   cmp ax, 1
  5165 00001F04 0F850900                 jne .dovar1272
  5166 00001F08 68[A41F]                 push dovar1_10
  5167 00001F0B E8D1E4                   call prs
  5168 00001F0E 83C402                   add  sp, 2
  5169                                  
  5170                                  ;-691   if(wi==2) prs(" ax, ");
  5171                                  
  5172                                  .dovar1272:
  5173 00001F11 A1[3600]                 mov ax, [wi]
  5174 00001F14 83F802                   cmp ax, 2
  5175 00001F17 0F850900                 jne .dovar1273
  5176 00001F1B 68[AA1F]                 push dovar1_11
  5177 00001F1E E8BEE4                   call prs
  5178 00001F21 83C402                   add  sp, 2
  5179                                  
  5180                                  ;-692   if(wi==4) prs(" eax, ");
  5181                                  
  5182                                  .dovar1273:
  5183 00001F24 A1[3600]                 mov ax, [wi]
  5184 00001F27 83F804                   cmp ax, 4
  5185 00001F2A 0F850900                 jne .dovar1274
  5186 00001F2E 68[B01F]                 push dovar1_12
  5187 00001F31 E8ABE4                   call prs
  5188 00001F34 83C402                   add  sp, 2
  5189                                  
  5190                                  ;-693   v(id1);
  5191                                  
  5192                                  .dovar1274:
  5193 00001F37 FF760A                   push word [bp+10]
  5194 00001F3A E89FF0                   call v
  5195 00001F3D 83C402                   add  sp, 2
  5196                                  
  5197                                  ;-694 }
  5198                                  
  5199                                  
  5200                                  ;-695 int rterm(char *op) {int mode; int opint; int ixarr; int id1;
  5201                                  
  5202 00001F40 C9                       .retndovar1: LEAVE
  5203 00001F41 C3                       ret
  5204 00001F42 5C6E206D6F76206278-     dovar1_0 db "\n mov bx, ",0
  5205 00001F4B 2C2000             
  5206 00001F4E 20616C2C205B62785D-     dovar1_1 db " al, [bx]\n mov ah, 0",0
  5207 00001F57 5C6E206D6F76206168-
  5208 00001F60 2C203000           
  5209 00001F64 2061782C205B62785D-     dovar1_2 db " ax, [bx]",0
  5210 00001F6D 00                 
  5211 00001F6E 2061782C2000            dovar1_3 db " ax, ",0
  5212 00001F74 5C6E206D6F76206278-     dovar1_4 db "\n mov bx, ",0
  5213 00001F7D 2C2000             
  5214 00001F80 5C6E2073686C206278-     dovar1_5 db "\n shl bx, 1",0
  5215 00001F89 2C203100           
  5216 00001F8D 5C6E2000                dovar1_6 db "\n ",0
  5217 00001F91 2061782C2000            dovar1_7 db " ax, ",0
  5218 00001F97 20616C2C2000            dovar1_8 db " al, ",0
  5219 00001F9D 202B2062785D00          dovar1_9 db " + bx]",0
  5220 00001FA4 20616C2C2000            dovar1_10 db " al, ",0
  5221 00001FAA 2061782C2000            dovar1_11 db " ax, ",0
  5222 00001FB0 206561782C2000          dovar1_12 db " eax, ",0
  5223                                  ENDP
  5224                                  
  5225                                  rterm: PROC
  5226                                  
  5227                                  ;-696   if (istoken(T_CONST)) { prnl(); prs(op);
  5228                                  ;
  5229 00001FB7 C8080000                 ENTER  8,0
  5230 00001FBB 680101                   push 257
  5231 00001FBE E891EF                   call istoken
  5232 00001FC1 83C402                   add  sp, 2
  5233 00001FC4 08C0                     or  al, al
  5234 00001FC6 0F845200                 je .rterm275
  5235 00001FCA E8A6E4                   call prnl
  5236 00001FCD FF7604                   push word [bp+4]
  5237 00001FD0 E80CE4                   call prs
  5238 00001FD3 83C402                   add  sp, 2
  5239                                  
  5240                                  ;-697     if (wi==1) prs(" al, ");
  5241                                  
  5242 00001FD6 A1[3600]                 mov ax, [wi]
  5243 00001FD9 83F801                   cmp ax, 1
  5244 00001FDC 0F850900                 jne .rterm276
  5245 00001FE0 68[A020]                 push rterm_0
  5246 00001FE3 E8F9E3                   call prs
  5247 00001FE6 83C402                   add  sp, 2
  5248                                  
  5249                                  ;-698     if (wi==2) prs(" ax, ");
  5250                                  
  5251                                  .rterm276:
  5252 00001FE9 A1[3600]                 mov ax, [wi]
  5253 00001FEC 83F802                   cmp ax, 2
  5254 00001FEF 0F850900                 jne .rterm277
  5255 00001FF3 68[A620]                 push rterm_1
  5256 00001FF6 E8E6E3                   call prs
  5257 00001FF9 83C402                   add  sp, 2
  5258                                  
  5259                                  ;-699     if (wi==4) prs(" eax, ");
  5260                                  
  5261                                  .rterm277:
  5262 00001FFC A1[3600]                 mov ax, [wi]
  5263 00001FFF 83F804                   cmp ax, 4
  5264 00002002 0F850900                 jne .rterm278
  5265 00002006 68[AC20]                 push rterm_2
  5266 00002009 E8D3E3                   call prs
  5267 0000200C 83C402                   add  sp, 2
  5268                                  
  5269                                  ;-700     prunsign1(lexval); return;}
  5270                                  
  5271                                  .rterm278:
  5272 0000200F FF36[2B00]               push word [lexval]
  5273 00002013 E82CE5                   call prunsign1
  5274 00002016 83C402                   add  sp, 2
  5275 00002019 E98200                   jmp .retnrterm
  5276                                  
  5277                                  ;-701   mode=typeName(); id1=searchname(); ixarr=0;
  5278                                  
  5279                                  .rterm275:
  5280 0000201C E828F1                   call typeName
  5281 0000201F 8946FE                   mov [bp-2], ax
  5282 00002022 E8C4F0                   call searchname
  5283 00002025 8946F8                   mov [bp-8], ax
  5284 00002028 B80000                   mov ax, 0
  5285 0000202B 8946FA                   mov [bp-6], ax
  5286                                  
  5287                                  ;-702   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');
  5288                                  
  5289 0000202E 6A5B                     push 91
  5290 00002030 E81FEF                   call istoken
  5291 00002033 83C402                   add  sp, 2
  5292 00002036 08C0                     or  al, al
  5293 00002038 0F843300                 je .rterm279
  5294 0000203C E8AAF0                   call searchname
  5295 0000203F 8946FA                   mov [bp-6], ax
  5296 00002042 680001                   push 256
  5297 00002045 E82CEF                   call expect
  5298 00002048 83C402                   add  sp, 2
  5299 0000204B 6A5D                     push 93
  5300 0000204D E824EF                   call expect
  5301 00002050 83C402                   add  sp, 2
  5302                                  
  5303                                  ;-703     gettypes(ixarr);
  5304                                  
  5305 00002053 FF76FA                   push word [bp-6]
  5306 00002056 E8C7F1                   call gettypes
  5307 00002059 83C402                   add  sp, 2
  5308                                  
  5309                                  ;-704     if (widthi != 2) error1("Arrayindex muss int sein"); }
  5310                                  
  5311 0000205C A1[3300]                 mov ax, [widthi]
  5312 0000205F 83F802                   cmp ax, 2
  5313 00002062 0F840900                 je  .rterm280
  5314 00002066 68[B320]                 push rterm_3
  5315 00002069 E894E5                   call error1
  5316 0000206C 83C402                   add  sp, 2
  5317                                  .rterm280:
  5318                                  
  5319                                  ;-705   if (eqstr(symbol,"_AX")) return;
  5320                                  
  5321                                  .rterm279:
  5322 0000206F 68[CC20]                 push rterm_4
  5323 00002072 8D06606D                 lea  ax, [symbol]
  5324 00002076 50                       push ax
  5325 00002077 E8E5E1                   call eqstr
  5326 0000207A 83C404                   add  sp, 4
  5327 0000207D 08C0                     or  al, al
  5328 0000207F 0F840300                 je .rterm281
  5329 00002083 E91800                   jmp .retnrterm
  5330                                  
  5331                                  ;-706   opint=op; dovar1(mode, opint, ixarr, id1);
  5332                                  
  5333                                  .rterm281:
  5334 00002086 8B4604                   mov ax, [bp+4]
  5335 00002089 8946FC                   mov [bp-4], ax
  5336 0000208C FF76F8                   push word [bp-8]
  5337 0000208F FF76FA                   push word [bp-6]
  5338 00002092 FF76FC                   push word [bp-4]
  5339 00002095 FF76FE                   push word [bp-2]
  5340 00002098 E852FD                   call dovar1
  5341 0000209B 83C408                   add  sp, 8
  5342                                  
  5343                                  ;-707 }
  5344                                  
  5345                                  
  5346                                  ;-708 
  5347                                  
  5348                                  
  5349                                  ;-709 int doreg(char *dr) { int i; expect('=');
  5350                                  
  5351 0000209E C9                       .retnrterm: LEAVE
  5352 0000209F C3                       ret
  5353 000020A0 20616C2C2000            rterm_0 db " al, ",0
  5354 000020A6 2061782C2000            rterm_1 db " ax, ",0
  5355 000020AC 206561782C2000          rterm_2 db " eax, ",0
  5356 000020B3 4172726179696E6465-     rterm_3 db "Arrayindex muss int sein",0
  5357 000020BC 78206D75737320696E-
  5358 000020C5 74207365696E00     
  5359 000020CC 5F415800                rterm_4 db "_AX",0
  5360                                  ENDP
  5361                                  
  5362                                  doreg: PROC;
  5363 000020D0 C8020000                 ENTER  2,0
  5364 000020D4 6A3D                     push 61
  5365 000020D6 E89BEE                   call expect
  5366 000020D9 83C402                   add  sp, 2
  5367                                  
  5368                                  ;-710   prs("\n mov  "); prs(dr); prs(", ");
  5369                                  
  5370 000020DC 68[3F21]                 push doreg_0
  5371 000020DF E8FDE2                   call prs
  5372 000020E2 83C402                   add  sp, 2
  5373 000020E5 FF7604                   push word [bp+4]
  5374 000020E8 E8F4E2                   call prs
  5375 000020EB 83C402                   add  sp, 2
  5376 000020EE 68[4821]                 push doreg_1
  5377 000020F1 E8EBE2                   call prs
  5378 000020F4 83C402                   add  sp, 2
  5379                                  
  5380                                  ;-711        if (istoken(T_CONST)) prunsign1(lexval);
  5381                                  
  5382 000020F7 680101                   push 257
  5383 000020FA E855EE                   call istoken
  5384 000020FD 83C402                   add  sp, 2
  5385 00002100 08C0                     or  al, al
  5386 00002102 0F840D00                 je .doreg282
  5387 00002106 FF36[2B00]               push word [lexval]
  5388 0000210A E835E4                   call prunsign1
  5389 0000210D 83C402                   add  sp, 2
  5390                                  
  5391                                  ;-712   else if (istoken(T_NAME )) { i=searchname(); v(i); }
  5392                                  
  5393 00002110 E92A00                   jmp .doreg283
  5394                                  .doreg282:
  5395 00002113 680001                   push 256
  5396 00002116 E839EE                   call istoken
  5397 00002119 83C402                   add  sp, 2
  5398 0000211C 08C0                     or  al, al
  5399 0000211E 0F841200                 je .doreg284
  5400 00002122 E8C4EF                   call searchname
  5401 00002125 8946FE                   mov [bp-2], ax
  5402 00002128 FF76FE                   push word [bp-2]
  5403 0000212B E8AEEE                   call v
  5404 0000212E 83C402                   add  sp, 2
  5405                                  
  5406                                  ;-713   else error1("only number or var allowed");
  5407                                  
  5408 00002131 E90900                   jmp .doreg285
  5409                                  .doreg284:
  5410 00002134 68[4B21]                 push doreg_2
  5411 00002137 E8C6E4                   call error1
  5412 0000213A 83C402                   add  sp, 2
  5413                                  
  5414                                  ;-714 }
  5415                                  
  5416                                  .doreg285:
  5417                                  .doreg283:
  5418                                  
  5419                                  ;-715 int isreg() {
  5420 0000213D C9                       LEAVE
  5421 0000213E C3                       ret
  5422 0000213F 5C6E206D6F76202000      doreg_0 db "\n mov  ",0
  5423 00002148 2C2000                  doreg_1 db ", ",0
  5424 0000214B 6F6E6C79206E756D62-     doreg_2 db "only number or var allowed",0
  5425 00002154 6572206F7220766172-
  5426 0000215D 20616C6C6F77656400 
  5427                                  ENDP
  5428                                  
  5429                                  isreg: PROC
  5430                                  
  5431                                  ;-716   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}
  5432                                  
  5433 00002166 68[5323]                 push isreg_0
  5434 00002169 8D06606D                 lea  ax, [symbol]
  5435 0000216D 50                       push ax
  5436 0000216E E8EEE0                   call eqstr
  5437 00002171 83C404                   add  sp, 4
  5438 00002174 08C0                     or  al, al
  5439 00002176 0F840C00                 je .isreg286
  5440 0000217A 68[5723]                 push isreg_1
  5441 0000217D E850FF                   call doreg
  5442 00002180 83C402                   add  sp, 2
  5443 00002183 E9C601                   jmp .r1
  5444                                  
  5445                                  ;-717   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}
  5446                                  
  5447                                  .isreg286:
  5448 00002186 68[5A23]                 push isreg_2
  5449 00002189 8D06606D                 lea  ax, [symbol]
  5450 0000218D 50                       push ax
  5451 0000218E E8CEE0                   call eqstr
  5452 00002191 83C404                   add  sp, 4
  5453 00002194 08C0                     or  al, al
  5454 00002196 0F840C00                 je .isreg287
  5455 0000219A 68[5E23]                 push isreg_3
  5456 0000219D E830FF                   call doreg
  5457 000021A0 83C402                   add  sp, 2
  5458 000021A3 E9A601                   jmp .r1
  5459                                  
  5460                                  ;-718   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}
  5461                                  
  5462                                  .isreg287:
  5463 000021A6 68[6123]                 push isreg_4
  5464 000021A9 8D06606D                 lea  ax, [symbol]
  5465 000021AD 50                       push ax
  5466 000021AE E8AEE0                   call eqstr
  5467 000021B1 83C404                   add  sp, 4
  5468 000021B4 08C0                     or  al, al
  5469 000021B6 0F840C00                 je .isreg288
  5470 000021BA 68[6523]                 push isreg_5
  5471 000021BD E810FF                   call doreg
  5472 000021C0 83C402                   add  sp, 2
  5473 000021C3 E98601                   jmp .r1
  5474                                  
  5475                                  ;-719   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}
  5476                                  
  5477                                  .isreg288:
  5478 000021C6 68[6823]                 push isreg_6
  5479 000021C9 8D06606D                 lea  ax, [symbol]
  5480 000021CD 50                       push ax
  5481 000021CE E88EE0                   call eqstr
  5482 000021D1 83C404                   add  sp, 4
  5483 000021D4 08C0                     or  al, al
  5484 000021D6 0F840C00                 je .isreg289
  5485 000021DA 68[6C23]                 push isreg_7
  5486 000021DD E8F0FE                   call doreg
  5487 000021E0 83C402                   add  sp, 2
  5488 000021E3 E96601                   jmp .r1
  5489                                  
  5490                                  ;-720   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}
  5491                                  
  5492                                  .isreg289:
  5493 000021E6 68[6F23]                 push isreg_8
  5494 000021E9 8D06606D                 lea  ax, [symbol]
  5495 000021ED 50                       push ax
  5496 000021EE E86EE0                   call eqstr
  5497 000021F1 83C404                   add  sp, 4
  5498 000021F4 08C0                     or  al, al
  5499 000021F6 0F840C00                 je .isreg290
  5500 000021FA 68[7323]                 push isreg_9
  5501 000021FD E8D0FE                   call doreg
  5502 00002200 83C402                   add  sp, 2
  5503 00002203 E94601                   jmp .r1
  5504                                  
  5505                                  ;-721   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}
  5506                                  
  5507                                  .isreg290:
  5508 00002206 68[7623]                 push isreg_10
  5509 00002209 8D06606D                 lea  ax, [symbol]
  5510 0000220D 50                       push ax
  5511 0000220E E84EE0                   call eqstr
  5512 00002211 83C404                   add  sp, 4
  5513 00002214 08C0                     or  al, al
  5514 00002216 0F840C00                 je .isreg291
  5515 0000221A 68[7A23]                 push isreg_11
  5516 0000221D E8B0FE                   call doreg
  5517 00002220 83C402                   add  sp, 2
  5518 00002223 E92601                   jmp .r1
  5519                                  
  5520                                  ;-722   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}
  5521                                  
  5522                                  .isreg291:
  5523 00002226 68[7D23]                 push isreg_12
  5524 00002229 8D06606D                 lea  ax, [symbol]
  5525 0000222D 50                       push ax
  5526 0000222E E82EE0                   call eqstr
  5527 00002231 83C404                   add  sp, 4
  5528 00002234 08C0                     or  al, al
  5529 00002236 0F840C00                 je .isreg292
  5530 0000223A 68[8123]                 push isreg_13
  5531 0000223D E890FE                   call doreg
  5532 00002240 83C402                   add  sp, 2
  5533 00002243 E90601                   jmp .r1
  5534                                  
  5535                                  ;-723   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}
  5536                                  
  5537                                  .isreg292:
  5538 00002246 68[8423]                 push isreg_14
  5539 00002249 8D06606D                 lea  ax, [symbol]
  5540 0000224D 50                       push ax
  5541 0000224E E80EE0                   call eqstr
  5542 00002251 83C404                   add  sp, 4
  5543 00002254 08C0                     or  al, al
  5544 00002256 0F840C00                 je .isreg293
  5545 0000225A 68[8823]                 push isreg_15
  5546 0000225D E870FE                   call doreg
  5547 00002260 83C402                   add  sp, 2
  5548 00002263 E9E600                   jmp .r1
  5549                                  
  5550                                  ;-724   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}
  5551                                  
  5552                                  .isreg293:
  5553 00002266 68[8B23]                 push isreg_16
  5554 00002269 8D06606D                 lea  ax, [symbol]
  5555 0000226D 50                       push ax
  5556 0000226E E8EEDF                   call eqstr
  5557 00002271 83C404                   add  sp, 4
  5558 00002274 08C0                     or  al, al
  5559 00002276 0F840C00                 je .isreg294
  5560 0000227A 68[8F23]                 push isreg_17
  5561 0000227D E850FE                   call doreg
  5562 00002280 83C402                   add  sp, 2
  5563 00002283 E9C600                   jmp .r1
  5564                                  
  5565                                  ;-725   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}
  5566                                  
  5567                                  .isreg294:
  5568 00002286 68[9223]                 push isreg_18
  5569 00002289 8D06606D                 lea  ax, [symbol]
  5570 0000228D 50                       push ax
  5571 0000228E E8CEDF                   call eqstr
  5572 00002291 83C404                   add  sp, 4
  5573 00002294 08C0                     or  al, al
  5574 00002296 0F840C00                 je .isreg295
  5575 0000229A 68[9623]                 push isreg_19
  5576 0000229D E830FE                   call doreg
  5577 000022A0 83C402                   add  sp, 2
  5578 000022A3 E9A600                   jmp .r1
  5579                                  
  5580                                  ;-726   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}
  5581                                  
  5582                                  .isreg295:
  5583 000022A6 68[9923]                 push isreg_20
  5584 000022A9 8D06606D                 lea  ax, [symbol]
  5585 000022AD 50                       push ax
  5586 000022AE E8AEDF                   call eqstr
  5587 000022B1 83C404                   add  sp, 4
  5588 000022B4 08C0                     or  al, al
  5589 000022B6 0F840C00                 je .isreg296
  5590 000022BA 68[9D23]                 push isreg_21
  5591 000022BD E810FE                   call doreg
  5592 000022C0 83C402                   add  sp, 2
  5593 000022C3 E98600                   jmp .r1
  5594                                  
  5595                                  ;-727   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}
  5596                                  
  5597                                  .isreg296:
  5598 000022C6 68[A023]                 push isreg_22
  5599 000022C9 8D06606D                 lea  ax, [symbol]
  5600 000022CD 50                       push ax
  5601 000022CE E88EDF                   call eqstr
  5602 000022D1 83C404                   add  sp, 4
  5603 000022D4 08C0                     or  al, al
  5604 000022D6 0F840C00                 je .isreg297
  5605 000022DA 68[A423]                 push isreg_23
  5606 000022DD E8F0FD                   call doreg
  5607 000022E0 83C402                   add  sp, 2
  5608 000022E3 E96600                   jmp .r1
  5609                                  
  5610                                  ;-728   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}
  5611                                  
  5612                                  .isreg297:
  5613 000022E6 68[A723]                 push isreg_24
  5614 000022E9 8D06606D                 lea  ax, [symbol]
  5615 000022ED 50                       push ax
  5616 000022EE E86EDF                   call eqstr
  5617 000022F1 83C404                   add  sp, 4
  5618 000022F4 08C0                     or  al, al
  5619 000022F6 0F840C00                 je .isreg298
  5620 000022FA 68[AB23]                 push isreg_25
  5621 000022FD E8D0FD                   call doreg
  5622 00002300 83C402                   add  sp, 2
  5623 00002303 E94600                   jmp .r1
  5624                                  
  5625                                  ;-729   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}
  5626                                  
  5627                                  .isreg298:
  5628 00002306 68[AE23]                 push isreg_26
  5629 00002309 8D06606D                 lea  ax, [symbol]
  5630 0000230D 50                       push ax
  5631 0000230E E84EDF                   call eqstr
  5632 00002311 83C404                   add  sp, 4
  5633 00002314 08C0                     or  al, al
  5634 00002316 0F840C00                 je .isreg299
  5635 0000231A 68[B223]                 push isreg_27
  5636 0000231D E8B0FD                   call doreg
  5637 00002320 83C402                   add  sp, 2
  5638 00002323 E92600                   jmp .r1
  5639                                  
  5640                                  ;-730   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}
  5641                                  
  5642                                  .isreg299:
  5643 00002326 68[B523]                 push isreg_28
  5644 00002329 8D06606D                 lea  ax, [symbol]
  5645 0000232D 50                       push ax
  5646 0000232E E82EDF                   call eqstr
  5647 00002331 83C404                   add  sp, 4
  5648 00002334 08C0                     or  al, al
  5649 00002336 0F840C00                 je .isreg300
  5650 0000233A 68[BC23]                 push isreg_29
  5651 0000233D E890FD                   call doreg
  5652 00002340 83C402                   add  sp, 2
  5653 00002343 E90600                   jmp .r1
  5654                                  
  5655                                  ;-731   return 0;   r1: return 1;
  5656                                  
  5657                                  .isreg300:
  5658 00002346 B80000                   mov ax, 0
  5659 00002349 E90600                   jmp .retnisreg
  5660                                  .r1:
  5661 0000234C B80100                   mov ax, 1
  5662 0000234F E90000                   jmp .retnisreg
  5663                                  
  5664                                  ;-732 }
  5665                                  
  5666                                  
  5667                                  ;-733 
  5668                                  
  5669                                  
  5670                                  ;-734 int doassign(int mode, int i, int ixarr, int ixconst) {
  5671                                  
  5672                                   .retnisreg:
  5673 00002352 C3                       ret
  5674 00002353 5F414800                isreg_0 db "_AH",0
  5675 00002357 616800                  isreg_1 db "ah",0
  5676 0000235A 5F414C00                isreg_2 db "_AL",0
  5677 0000235E 616C00                  isreg_3 db "al",0
  5678 00002361 5F415800                isreg_4 db "_AX",0
  5679 00002365 617800                  isreg_5 db "ax",0
  5680 00002368 5F424800                isreg_6 db "_BH",0
  5681 0000236C 626800                  isreg_7 db "bh",0
  5682 0000236F 5F424C00                isreg_8 db "_BL",0
  5683 00002373 626C00                  isreg_9 db "bl",0
  5684 00002376 5F425800                isreg_10 db "_BX",0
  5685 0000237A 627800                  isreg_11 db "bx",0
  5686 0000237D 5F434800                isreg_12 db "_CH",0
  5687 00002381 636800                  isreg_13 db "ch",0
  5688 00002384 5F434C00                isreg_14 db "_CL",0
  5689 00002388 636C00                  isreg_15 db "cl",0
  5690 0000238B 5F435800                isreg_16 db "_CX",0
  5691 0000238F 637800                  isreg_17 db "cx",0
  5692 00002392 5F444800                isreg_18 db "_DH",0
  5693 00002396 646800                  isreg_19 db "dh",0
  5694 00002399 5F444C00                isreg_20 db "_DL",0
  5695 0000239D 646C00                  isreg_21 db "dl",0
  5696 000023A0 5F445800                isreg_22 db "_DX",0
  5697 000023A4 647800                  isreg_23 db "dx",0
  5698 000023A7 5F534900                isreg_24 db "_SI",0
  5699 000023AB 736900                  isreg_25 db "si",0
  5700 000023AE 5F444900                isreg_26 db "_DI",0
  5701 000023B2 646900                  isreg_27 db "di",0
  5702 000023B5 5F464C41475300          isreg_28 db "_FLAGS",0
  5703 000023BC 666C61677300            isreg_29 db "flags",0
  5704                                  ENDP
  5705                                  
  5706                                  doassign: PROC
  5707                                  
  5708                                  ;-735   gettypes(i);
  5709                                  ;
  5710 000023C2 C8000000                 ENTER  0,0
  5711 000023C6 FF7606                   push word [bp+6]
  5712 000023C9 E854EE                   call gettypes
  5713 000023CC 83C402                   add  sp, 2
  5714                                  
  5715                                  ;-736   if (mode==1) {prs("\n mov  bx, ");v(i);
  5716                                  
  5717 000023CF 8B4604                   mov ax, [bp+4]
  5718 000023D2 83F801                   cmp ax, 1
  5719 000023D5 0F853400                 jne .doassign301
  5720 000023D9 68[5F25]                 push doassign_0
  5721 000023DC E800E0                   call prs
  5722 000023DF 83C402                   add  sp, 2
  5723 000023E2 FF7606                   push word [bp+6]
  5724 000023E5 E8F4EB                   call v
  5725 000023E8 83C402                   add  sp, 2
  5726                                  
  5727                                  ;-737     if (widthi == 2) prs("\n mov  [bx], ax");
  5728                                  
  5729 000023EB A1[3300]                 mov ax, [widthi]
  5730 000023EE 83F802                   cmp ax, 2
  5731 000023F1 0F850C00                 jne .doassign302
  5732 000023F5 68[6C25]                 push doassign_1
  5733 000023F8 E8E4DF                   call prs
  5734 000023FB 83C402                   add  sp, 2
  5735                                  
  5736                                  ;-738     else  prs("\n mov  [bx], al"); return;}
  5737                                  
  5738 000023FE E90900                   jmp .doassign303
  5739                                  .doassign302:
  5740 00002401 68[7D25]                 push doassign_2
  5741 00002404 E8D8DF                   call prs
  5742 00002407 83C402                   add  sp, 2
  5743                                  .doassign303:
  5744 0000240A E95001                   jmp .retndoassign
  5745                                  
  5746                                  ;-739   if (mode==2) {prs("\n mov  ");printName(i); prs(", ax"); return;}
  5747                                  
  5748                                  .doassign301:
  5749 0000240D 8B4604                   mov ax, [bp+4]
  5750 00002410 83F802                   cmp ax, 2
  5751 00002413 0F851E00                 jne .doassign304
  5752 00002417 68[8E25]                 push doassign_3
  5753 0000241A E8C2DF                   call prs
  5754 0000241D 83C402                   add  sp, 2
  5755 00002420 FF7606                   push word [bp+6]
  5756 00002423 E8D8E3                   call printName
  5757 00002426 83C402                   add  sp, 2
  5758 00002429 68[9725]                 push doassign_4
  5759 0000242C E8B0DF                   call prs
  5760 0000242F 83C402                   add  sp, 2
  5761 00002432 E92801                   jmp .retndoassign
  5762                                  
  5763                                  ;-740   if (ixarr) {  prs("\n mov bx, ");
  5764                                  
  5765                                  .doassign304:
  5766 00002435 8B4608                   mov ax, [bp+8]
  5767 00002438 08C0                     or  al, al
  5768 0000243A 0F846E00                 je .doassign305
  5769 0000243E 68[9C25]                 push doassign_5
  5770 00002441 E89BDF                   call prs
  5771 00002444 83C402                   add  sp, 2
  5772                                  
  5773                                  ;-741     if(ixconst) prunsign1(ixarr); else v(ixarr);
  5774                                  
  5775 00002447 8B460A                   mov ax, [bp+10]
  5776 0000244A 08C0                     or  al, al
  5777 0000244C 0F840C00                 je .doassign306
  5778 00002450 FF7608                   push word [bp+8]
  5779 00002453 E8ECE0                   call prunsign1
  5780 00002456 83C402                   add  sp, 2
  5781 00002459 E90900                   jmp .doassign307
  5782                                  .doassign306:
  5783 0000245C FF7608                   push word [bp+8]
  5784 0000245F E87AEB                   call v
  5785 00002462 83C402                   add  sp, 2
  5786                                  
  5787                                  ;-742     if (wi==2) prs("\n shl bx, 1");
  5788                                  
  5789                                  .doassign307:
  5790 00002465 A1[3600]                 mov ax, [wi]
  5791 00002468 83F802                   cmp ax, 2
  5792 0000246B 0F850900                 jne .doassign308
  5793 0000246F 68[A825]                 push doassign_6
  5794 00002472 E86ADF                   call prs
  5795 00002475 83C402                   add  sp, 2
  5796                                  
  5797                                  ;-743     prs("\n mov ["); printName(i);
  5798                                  
  5799                                  .doassign308:
  5800 00002478 68[B525]                 push doassign_7
  5801 0000247B E861DF                   call prs
  5802 0000247E 83C402                   add  sp, 2
  5803 00002481 FF7606                   push word [bp+6]
  5804 00002484 E877E3                   call printName
  5805 00002487 83C402                   add  sp, 2
  5806                                  
  5807                                  ;-744     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }
  5808                                  
  5809 0000248A A1[3600]                 mov ax, [wi]
  5810 0000248D 83F802                   cmp ax, 2
  5811 00002490 0F850C00                 jne .doassign309
  5812 00002494 68[BE25]                 push doassign_8
  5813 00002497 E845DF                   call prs
  5814 0000249A 83C402                   add  sp, 2
  5815 0000249D E90900                   jmp .doassign310
  5816                                  .doassign309:
  5817 000024A0 68[C725]                 push doassign_9
  5818 000024A3 E839DF                   call prs
  5819 000024A6 83C402                   add  sp, 2
  5820                                  .doassign310:
  5821 000024A9 E9B100                   jmp .retndoassign
  5822                                  
  5823                                  ;-745   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");
  5824                                  
  5825                                  .doassign305:
  5826 000024AC A1[3600]                 mov ax, [wi]
  5827 000024AF 83F801                   cmp ax, 1
  5828 000024B2 0F853100                 jne .doassign311
  5829 000024B6 68[D025]                 push doassign_10
  5830 000024B9 E823DF                   call prs
  5831 000024BC 83C402                   add  sp, 2
  5832 000024BF 8B4606                   mov ax, [bp+6]
  5833 000024C2 3DC800                   cmp ax, 200
  5834 000024C5 0F8D0900                 jge .doassign312
  5835 000024C9 68[D825]                 push doassign_11
  5836 000024CC E810DF                   call prs
  5837 000024CF 83C402                   add  sp, 2
  5838                                  
  5839                                  ;-746     } v(i); prs(", al"); return; }
  5840                                  
  5841                                  .doassign312:
  5842 000024D2 FF7606                   push word [bp+6]
  5843 000024D5 E804EB                   call v
  5844 000024D8 83C402                   add  sp, 2
  5845 000024DB 68[DE25]                 push doassign_12
  5846 000024DE E8FEDE                   call prs
  5847 000024E1 83C402                   add  sp, 2
  5848 000024E4 E97600                   jmp .retndoassign
  5849                                  
  5850                                  ;-747   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");
  5851                                  
  5852                                  .doassign311:
  5853 000024E7 A1[3600]                 mov ax, [wi]
  5854 000024EA 83F802                   cmp ax, 2
  5855 000024ED 0F853100                 jne .doassign313
  5856 000024F1 68[E325]                 push doassign_13
  5857 000024F4 E8E8DE                   call prs
  5858 000024F7 83C402                   add  sp, 2
  5859 000024FA 8B4606                   mov ax, [bp+6]
  5860 000024FD 3DC800                   cmp ax, 200
  5861 00002500 0F8D0900                 jge .doassign314
  5862 00002504 68[EB25]                 push doassign_14
  5863 00002507 E8D5DE                   call prs
  5864 0000250A 83C402                   add  sp, 2
  5865                                  
  5866                                  ;-748     } v(i); prs(", ax"); return; }
  5867                                  
  5868                                  .doassign314:
  5869 0000250D FF7606                   push word [bp+6]
  5870 00002510 E8C9EA                   call v
  5871 00002513 83C402                   add  sp, 2
  5872 00002516 68[F125]                 push doassign_15
  5873 00002519 E8C3DE                   call prs
  5874 0000251C 83C402                   add  sp, 2
  5875 0000251F E93B00                   jmp .retndoassign
  5876                                  
  5877                                  ;-749   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");
  5878                                  
  5879                                  .doassign313:
  5880 00002522 A1[3600]                 mov ax, [wi]
  5881 00002525 83F804                   cmp ax, 4
  5882 00002528 0F853100                 jne .doassign315
  5883 0000252C 68[F625]                 push doassign_16
  5884 0000252F E8ADDE                   call prs
  5885 00002532 83C402                   add  sp, 2
  5886 00002535 8B4606                   mov ax, [bp+6]
  5887 00002538 3DC800                   cmp ax, 200
  5888 0000253B 0F8D0900                 jge .doassign316
  5889 0000253F 68[FE25]                 push doassign_17
  5890 00002542 E89ADE                   call prs
  5891 00002545 83C402                   add  sp, 2
  5892                                  
  5893                                  ;-750     } v(i); prs(", eax"); return; }
  5894                                  
  5895                                  .doassign316:
  5896 00002548 FF7606                   push word [bp+6]
  5897 0000254B E88EEA                   call v
  5898 0000254E 83C402                   add  sp, 2
  5899 00002551 68[0526]                 push doassign_18
  5900 00002554 E888DE                   call prs
  5901 00002557 83C402                   add  sp, 2
  5902 0000255A E90000                   jmp .retndoassign
  5903                                  
  5904                                  ;-751 }
  5905                                  
  5906                                  .doassign315:
  5907                                  
  5908                                  ;-752 int domul(int ids) {
  5909                                  
  5910 0000255D C9                       .retndoassign: LEAVE
  5911 0000255E C3                       ret
  5912 0000255F 5C6E206D6F76202062-     doassign_0 db "\n mov  bx, ",0
  5913 00002568 782C2000           
  5914 0000256C 5C6E206D6F7620205B-     doassign_1 db "\n mov  [bx], ax",0
  5915 00002575 62785D2C20617800   
  5916 0000257D 5C6E206D6F7620205B-     doassign_2 db "\n mov  [bx], al",0
  5917 00002586 62785D2C20616C00   
  5918 0000258E 5C6E206D6F76202000      doassign_3 db "\n mov  ",0
  5919 00002597 2C20617800              doassign_4 db ", ax",0
  5920 0000259C 5C6E206D6F76206278-     doassign_5 db "\n mov bx, ",0
  5921 000025A5 2C2000             
  5922 000025A8 5C6E2073686C206278-     doassign_6 db "\n shl bx, 1",0
  5923 000025B1 2C203100           
  5924 000025B5 5C6E206D6F76205B00      doassign_7 db "\n mov [",0
  5925 000025BE 2B62785D2C20617800      doassign_8 db "+bx], ax",0
  5926 000025C7 2B62785D2C20616C00      doassign_9 db "+bx], al",0
  5927 000025D0 5C6E206D6F762000        doassign_10 db "\n mov ",0
  5928 000025D8 627974652000            doassign_11 db "byte ",0
  5929 000025DE 2C20616C00              doassign_12 db ", al",0
  5930 000025E3 5C6E206D6F762000        doassign_13 db "\n mov ",0
  5931 000025EB 776F72642000            doassign_14 db "word ",0
  5932 000025F1 2C20617800              doassign_15 db ", ax",0
  5933 000025F6 5C6E206D6F762000        doassign_16 db "\n mov ",0
  5934 000025FE 64776F72642000          doassign_17 db "dword ",0
  5935 00002605 2C2065617800            doassign_18 db ", eax",0
  5936                                  ENDP
  5937                                  
  5938                                  domul: PROC
  5939                                  
  5940                                  ;-753   if (ids) rterm("imul"); else {
  5941                                  ;
  5942 0000260B C8000000                 ENTER  0,0
  5943 0000260F 8B4604                   mov ax, [bp+4]
  5944 00002612 08C0                     or  al, al
  5945 00002614 0F840C00                 je .domul317
  5946 00002618 68[5D26]                 push domul_0
  5947 0000261B E899F9                   call rterm
  5948 0000261E 83C402                   add  sp, 2
  5949 00002621 E93700                   jmp .domul318
  5950                                  .domul317:
  5951                                  
  5952                                  ;-754   if (istoken(T_CONST)) {
  5953                                  
  5954 00002624 680101                   push 257
  5955 00002627 E828E9                   call istoken
  5956 0000262A 83C402                   add  sp, 2
  5957 0000262D 08C0                     or  al, al
  5958 0000262F 0F841F00                 je .domul319
  5959                                  
  5960                                  ;-755     prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx");
  5961                                  
  5962 00002633 68[6226]                 push domul_1
  5963 00002636 E8A6DD                   call prs
  5964 00002639 83C402                   add  sp, 2
  5965 0000263C FF36[2B00]               push word [lexval]
  5966 00002640 E8FFDE                   call prunsign1
  5967 00002643 83C402                   add  sp, 2
  5968 00002646 68[6E26]                 push domul_2
  5969 00002649 E893DD                   call prs
  5970 0000264C 83C402                   add  sp, 2
  5971                                  
  5972                                  ;-756     }
  5973                                  
  5974                                  
  5975                                  ;-757   else error1("with MUL only const number as multiplicator allowed"); } }
  5976                                  
  5977 0000264F E90900                   jmp .domul320
  5978                                  .domul319:
  5979 00002652 68[7826]                 push domul_3
  5980 00002655 E8A8DF                   call error1
  5981 00002658 83C402                   add  sp, 2
  5982                                  .domul320:
  5983                                  .domul318:
  5984                                  
  5985                                  ;-758 int doidiv(int ids) { int mode; int id1;
  5986 0000265B C9                       LEAVE
  5987 0000265C C3                       ret
  5988 0000265D 696D756C00              domul_0 db "imul",0
  5989 00002662 5C6E206D6F76206278-     domul_1 db "\n mov bx, ",0
  5990 0000266B 2C2000             
  5991 0000266E 5C6E206D756C206278-     domul_2 db "\n mul bx",0
  5992 00002677 00                 
  5993 00002678 77697468204D554C20-     domul_3 db "with MUL only const number as multiplicator allowed",0
  5994 00002681 6F6E6C7920636F6E73-
  5995 0000268A 74206E756D62657220-
  5996 00002693 6173206D756C746970-
  5997 0000269C 6C696361746F722061-
  5998 000026A5 6C6C6F77656400     
  5999                                  ENDP
  6000                                  
  6001                                  doidiv: PROC
  6002                                  
  6003                                  ;-759   if (istoken(T_CONST)) {
  6004                                  ;
  6005 000026AC C8040000                 ENTER  4,0
  6006 000026B0 680101                   push 257
  6007 000026B3 E89CE8                   call istoken
  6008 000026B6 83C402                   add  sp, 2
  6009 000026B9 08C0                     or  al, al
  6010 000026BB 0F843400                 je .doidiv321
  6011                                  
  6012                                  ;-760     prs("\n mov bx, "); prunsign1(lexval);
  6013                                  
  6014 000026BF 68[7127]                 push doidiv_0
  6015 000026C2 E81ADD                   call prs
  6016 000026C5 83C402                   add  sp, 2
  6017 000026C8 FF36[2B00]               push word [lexval]
  6018 000026CC E873DE                   call prunsign1
  6019 000026CF 83C402                   add  sp, 2
  6020                                  
  6021                                  ;-761     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  6022                                  
  6023 000026D2 8B4604                   mov ax, [bp+4]
  6024 000026D5 08C0                     or  al, al
  6025 000026D7 0F840C00                 je .doidiv322
  6026 000026DB 68[7D27]                 push doidiv_1
  6027 000026DE E8FEDC                   call prs
  6028 000026E1 83C402                   add  sp, 2
  6029 000026E4 E90900                   jmp .doidiv323
  6030                                  .doidiv322:
  6031 000026E7 68[8E27]                 push doidiv_2
  6032 000026EA E8F2DC                   call prs
  6033 000026ED 83C402                   add  sp, 2
  6034                                  .doidiv323:
  6035                                  
  6036                                  ;-762   else {
  6037                                  
  6038 000026F0 E97C00                   jmp .doidiv324
  6039                                  .doidiv321:
  6040                                  
  6041                                  ;-763     mode=typeName(); id1=searchname();
  6042                                  
  6043 000026F3 E851EA                   call typeName
  6044 000026F6 8946FE                   mov [bp-2], ax
  6045 000026F9 E8EDE9                   call searchname
  6046 000026FC 8946FC                   mov [bp-4], ax
  6047                                  
  6048                                  ;-764     if (mode) error1("only const number or int as divisor allowed");
  6049                                  
  6050 000026FF 8B46FE                   mov ax, [bp-2]
  6051 00002702 08C0                     or  al, al
  6052 00002704 0F840900                 je .doidiv325
  6053 00002708 68[A427]                 push doidiv_3
  6054 0000270B E8F2DE                   call error1
  6055 0000270E 83C402                   add  sp, 2
  6056                                  
  6057                                  ;-765     gettypes(id1);
  6058                                  
  6059                                  .doidiv325:
  6060 00002711 FF76FC                   push word [bp-4]
  6061 00002714 E809EB                   call gettypes
  6062 00002717 83C402                   add  sp, 2
  6063                                  
  6064                                  ;-766     if (typei) error1("only int as simple var divisor allowed");
  6065                                  
  6066 0000271A A1[2D00]                 mov ax, [typei]
  6067 0000271D 08C0                     or  al, al
  6068 0000271F 0F840900                 je .doidiv326
  6069 00002723 68[D027]                 push doidiv_4
  6070 00002726 E8D7DE                   call error1
  6071 00002729 83C402                   add  sp, 2
  6072                                  
  6073                                  ;-767     if (wi!=2) error1("only int, no byte as divisor allowed");
  6074                                  
  6075                                  .doidiv326:
  6076 0000272C A1[3600]                 mov ax, [wi]
  6077 0000272F 83F802                   cmp ax, 2
  6078 00002732 0F840900                 je  .doidiv327
  6079 00002736 68[F727]                 push doidiv_5
  6080 00002739 E8C4DE                   call error1
  6081 0000273C 83C402                   add  sp, 2
  6082                                  
  6083                                  ;-768     prs("\n mov bx, "); v(id1);
  6084                                  
  6085                                  .doidiv327:
  6086 0000273F 68[1C28]                 push doidiv_6
  6087 00002742 E89ADC                   call prs
  6088 00002745 83C402                   add  sp, 2
  6089 00002748 FF76FC                   push word [bp-4]
  6090 0000274B E88EE8                   call v
  6091 0000274E 83C402                   add  sp, 2
  6092                                  
  6093                                  ;-769     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  6094                                  
  6095 00002751 8B4604                   mov ax, [bp+4]
  6096 00002754 08C0                     or  al, al
  6097 00002756 0F840C00                 je .doidiv328
  6098 0000275A 68[2828]                 push doidiv_7
  6099 0000275D E87FDC                   call prs
  6100 00002760 83C402                   add  sp, 2
  6101 00002763 E90900                   jmp .doidiv329
  6102                                  .doidiv328:
  6103 00002766 68[3928]                 push doidiv_8
  6104 00002769 E873DC                   call prs
  6105 0000276C 83C402                   add  sp, 2
  6106                                  .doidiv329:
  6107                                  
  6108                                  ;-770 }
  6109                                  
  6110                                  .doidiv324:
  6111                                  
  6112                                  ;-771 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
  6113 0000276F C9                       LEAVE
  6114 00002770 C3                       ret
  6115 00002771 5C6E206D6F76206278-     doidiv_0 db "\n mov bx, ",0
  6116 0000277A 2C2000             
  6117 0000277D 5C6E206377645C6E20-     doidiv_1 db "\n cwd\n idiv bx",0
  6118 00002786 6964697620627800   
  6119 0000278E 5C6E206D6F76206478-     doidiv_2 db "\n mov dx, 0\n div bx",0
  6120 00002797 2C20305C6E20646976-
  6121 000027A0 20627800           
  6122 000027A4 6F6E6C7920636F6E73-     doidiv_3 db "only const number or int as divisor allowed",0
  6123 000027AD 74206E756D62657220-
  6124 000027B6 6F7220696E74206173-
  6125 000027BF 2064697669736F7220-
  6126 000027C8 616C6C6F77656400   
  6127 000027D0 6F6E6C7920696E7420-     doidiv_4 db "only int as simple var divisor allowed",0
  6128 000027D9 61732073696D706C65-
  6129 000027E2 207661722064697669-
  6130 000027EB 736F7220616C6C6F77-
  6131 000027F4 656400             
  6132 000027F7 6F6E6C7920696E742C-     doidiv_5 db "only int, no byte as divisor allowed",0
  6133 00002800 206E6F206279746520-
  6134 00002809 61732064697669736F-
  6135 00002812 7220616C6C6F776564-
  6136 0000281B 00                 
  6137 0000281C 5C6E206D6F76206278-     doidiv_6 db "\n mov bx, ",0
  6138 00002825 2C2000             
  6139 00002828 5C6E206377645C6E20-     doidiv_7 db "\n cwd\n idiv bx",0
  6140 00002831 6964697620627800   
  6141 00002839 5C6E206D6F76206478-     doidiv_8 db "\n mov dx, 0\n div bx",0
  6142 00002842 2C20305C6E20646976-
  6143 0000284B 20627800           
  6144                                  ENDP
  6145                                  
  6146                                  domod: PROC;
  6147 0000284F C8000000                 ENTER  0,0
  6148 00002853 FF7604                   push word [bp+4]
  6149 00002856 E853FE                   call doidiv
  6150 00002859 83C402                   add  sp, 2
  6151 0000285C 68[6728]                 push domod_0
  6152 0000285F E87DDB                   call prs
  6153 00002862 83C402                   add  sp, 2
  6154                                  
  6155                                  ;-772 
  6156                                  
  6157                                  
  6158                                  ;-773 
  6159                                  
  6160                                  
  6161                                  ;-774 int docalltype[10]; int docallvalue[10];
  6162 00002865 C9                       LEAVE
  6163 00002866 C3                       ret
  6164 00002867 5C6E206D6F76206178-     domod_0 db "\n mov ax, dx",0
  6165 00002870 2C20647800         
  6166                                  ENDP
  6167                                  section .bss
  6168                                  absolute 41742
  6169 0000A30E <res 00000014>          docalltype resw 10
  6170                                  section .text
  6171                                  section .bss
  6172                                  absolute 41762
  6173 0000A322 <res 00000014>          docallvalue resw 10
  6174                                  section .text
  6175                                  
  6176                                  ;-775 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register
  6177                                  
  6178                                  section .bss
  6179                                  absolute 41782
  6180 0000A336 <res 00000011>          procname resb 17
  6181                                  section .text
  6182                                  
  6183                                  ;-776 int docall1() {int i; int narg; int t0; int n0;  int sz32;
  6184                                  
  6185                                  
  6186                                  docall1: PROC
  6187                                  
  6188                                  ;-777   narg=0;  sz32=0;
  6189                                  ;
  6190 00002875 C80A0000                 ENTER  10,0
  6191 00002879 B80000                   mov ax, 0
  6192 0000287C 8946FC                   mov [bp-4], ax
  6193 0000287F B80000                   mov ax, 0
  6194 00002882 8946F6                   mov [bp-10], ax
  6195                                  
  6196                                  ;-778   checknamelen();
  6197                                  
  6198 00002885 E887E7                   call checknamelen
  6199                                  
  6200                                  ;-779   strcpy(&procname, symbol);
  6201                                  
  6202 00002888 8D06606D                 lea  ax, [symbol]
  6203 0000288C 50                       push ax
  6204 0000288D 8D0636A3                 lea  ax, [procname]
  6205 00002891 50                       push ax
  6206 00002892 E894D9                   call strcpy
  6207 00002895 83C404                   add  sp, 4
  6208                                  
  6209                                  ;-780   expect('(');
  6210                                  
  6211 00002898 6A28                     push 40
  6212 0000289A E8D7E6                   call expect
  6213 0000289D 83C402                   add  sp, 2
  6214                                  
  6215                                  ;-781 	if (istoken(')') ==0 ) {
  6216                                  
  6217 000028A0 6A29                     push 41
  6218 000028A2 E8ADE6                   call istoken
  6219 000028A5 83C402                   add  sp, 2
  6220 000028A8 83F800                   cmp ax, 0
  6221 000028AB 0F857802                 jne .docall1330
  6222                                  
  6223                                  ;-782 	  do { narg++;
  6224                                  
  6225                                  .docall1331:
  6226 000028AF FF46FC                   inc  word[bp-4]
  6227                                  
  6228                                  ;-783 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;
  6229                                  
  6230 000028B2 8B46FC                   mov ax, [bp-4]
  6231 000028B5 83F809                   cmp ax, 9
  6232 000028B8 0F8E0900                 jle .docall1332
  6233 000028BC 68[6B2B]                 push docall1_0
  6234 000028BF E83EDD                   call error1
  6235 000028C2 83C402                   add  sp, 2
  6236                                  .docall1332:
  6237 000028C5 B80000                   mov ax, 0
  6238 000028C8 8946FA                   mov [bp-6], ax
  6239                                  
  6240                                  ;-784       if(istoken(T_CONST)) {t0=1; n0=lexval; }
  6241                                  
  6242 000028CB 680101                   push 257
  6243 000028CE E881E6                   call istoken
  6244 000028D1 83C402                   add  sp, 2
  6245 000028D4 08C0                     or  al, al
  6246 000028D6 0F840C00                 je .docall1333
  6247 000028DA B80100                   mov ax, 1
  6248 000028DD 8946FA                   mov [bp-6], ax
  6249 000028E0 A1[2B00]                 mov ax, [lexval]
  6250 000028E3 8946F8                   mov [bp-8], ax
  6251                                  
  6252                                  ;-785       if(istoken(T_STRING)){t0=2; n0=nconst;
  6253                                  
  6254                                  .docall1333:
  6255 000028E6 680201                   push 258
  6256 000028E9 E866E6                   call istoken
  6257 000028EC 83C402                   add  sp, 2
  6258 000028EF 08C0                     or  al, al
  6259 000028F1 0F846300                 je .docall1334
  6260 000028F5 B80200                   mov ax, 2
  6261 000028F8 8946FA                   mov [bp-6], ax
  6262 000028FB A1[2500]                 mov ax, [nconst]
  6263 000028FE 8946F8                   mov [bp-8], ax
  6264                                  
  6265                                  ;-786         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");
  6266                                  
  6267 00002901 68[7D2B]                 push docall1_1
  6268 00002904 E851DA                   call eprs
  6269 00002907 83C402                   add  sp, 2
  6270 0000290A 8D06E06D                 lea  ax, [fname]
  6271 0000290E 50                       push ax
  6272 0000290F E846DA                   call eprs
  6273 00002912 83C402                   add  sp, 2
  6274 00002915 6A5F                     push 95
  6275 00002917 E82BDA                   call eprc
  6276 0000291A 83C402                   add  sp, 2
  6277 0000291D FF36[2500]               push word [nconst]
  6278 00002921 E85DDB                   call eprnum
  6279 00002924 83C402                   add  sp, 2
  6280 00002927 68[802B]                 push docall1_2
  6281 0000292A E82BDA                   call eprs
  6282 0000292D 83C402                   add  sp, 2
  6283                                  
  6284                                  ;-787         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }
  6285                                  
  6286 00002930 6A22                     push 34
  6287 00002932 E810DA                   call eprc
  6288 00002935 83C402                   add  sp, 2
  6289 00002938 8D06606D                 lea  ax, [symbol]
  6290 0000293C 50                       push ax
  6291 0000293D E818DA                   call eprs
  6292 00002940 83C402                   add  sp, 2
  6293 00002943 6A22                     push 34
  6294 00002945 E8FDD9                   call eprc
  6295 00002948 83C402                   add  sp, 2
  6296 0000294B 68[852B]                 push docall1_3
  6297 0000294E E807DA                   call eprs
  6298 00002951 83C402                   add  sp, 2
  6299 00002954 FF06[2500]               inc  word[nconst]
  6300                                  
  6301                                  ;-788       if(istoken('&'))     {t0=3; name1(); n0=searchname();}
  6302                                  
  6303                                  .docall1334:
  6304 00002958 6A26                     push 38
  6305 0000295A E8F5E5                   call istoken
  6306 0000295D 83C402                   add  sp, 2
  6307 00002960 08C0                     or  al, al
  6308 00002962 0F840F00                 je .docall1335
  6309 00002966 B80300                   mov ax, 3
  6310 00002969 8946FA                   mov [bp-6], ax
  6311 0000296C E8B0E7                   call name1
  6312 0000296F E877E7                   call searchname
  6313 00002972 8946F8                   mov [bp-8], ax
  6314                                  
  6315                                  ;-789       if(istoken(T_NAME))  { n0=checkreg();
  6316                                  
  6317                                  .docall1335:
  6318 00002975 680001                   push 256
  6319 00002978 E8D7E5                   call istoken
  6320 0000297B 83C402                   add  sp, 2
  6321 0000297E 08C0                     or  al, al
  6322 00002980 0F844800                 je .docall1336
  6323 00002984 E85EEC                   call checkreg
  6324 00002987 8946F8                   mov [bp-8], ax
  6325                                  
  6326                                  ;-790         if (n0) t0=5;
  6327                                  
  6328 0000298A 8B46F8                   mov ax, [bp-8]
  6329 0000298D 08C0                     or  al, al
  6330 0000298F 0F840900                 je .docall1337
  6331 00002993 B80500                   mov ax, 5
  6332 00002996 8946FA                   mov [bp-6], ax
  6333                                  
  6334                                  ;-791         else {t0=4; n0=searchname();
  6335                                  
  6336 00002999 E93000                   jmp .docall1338
  6337                                  .docall1337:
  6338 0000299C B80400                   mov ax, 4
  6339 0000299F 8946FA                   mov [bp-6], ax
  6340 000029A2 E844E7                   call searchname
  6341 000029A5 8946F8                   mov [bp-8], ax
  6342                                  
  6343                                  ;-792           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }
  6344                                  
  6345 000029A8 B8A96E                   mov ax, GType
  6346 000029AB A3[4400]                 mov word [p1], ax
  6347 000029AE A1[4400]                 mov ax, [p1]
  6348 000029B1 0346F8                   add ax, [bp-8]
  6349 000029B4 A3[4400]                 mov word [p1], ax
  6350 000029B7 8B1E[4400]               mov bx, [p1]
  6351 000029BB 8A07                     mov al, [bx]
  6352 000029BD B400                     mov ah, 0
  6353 000029BF 83F826                   cmp ax, 38
  6354 000029C2 0F850600                 jne .docall1339
  6355 000029C6 B80300                   mov ax, 3
  6356 000029C9 8946FA                   mov [bp-6], ax
  6357                                  .docall1339:
  6358                                  .docall1338:
  6359                                  
  6360                                  ;-793       if (t0==0) error1("parameter not recognized (no * allowed)");
  6361                                  
  6362                                  .docall1336:
  6363 000029CC 8B46FA                   mov ax, [bp-6]
  6364 000029CF 83F800                   cmp ax, 0
  6365 000029D2 0F850900                 jne .docall1340
  6366 000029D6 68[882B]                 push docall1_4
  6367 000029D9 E824DC                   call error1
  6368 000029DC 83C402                   add  sp, 2
  6369                                  
  6370                                  ;-794       docalltype [narg] = t0;
  6371                                  
  6372                                  .docall1340:
  6373 000029DF 8B46FA                   mov ax, [bp-6]
  6374 000029E2 8B5EFC                   mov bx, [bp-4]
  6375 000029E5 D1E3                     shl bx, 1
  6376 000029E7 89870EA3                 mov [docalltype+bx], ax
  6377                                  
  6378                                  ;-795       docallvalue[narg] = n0;
  6379                                  
  6380 000029EB 8B46F8                   mov ax, [bp-8]
  6381 000029EE 8B5EFC                   mov bx, [bp-4]
  6382 000029F1 D1E3                     shl bx, 1
  6383 000029F3 898722A3                 mov [docallvalue+bx], ax
  6384                                  
  6385                                  ;-796     } while (istoken(','));
  6386                                  
  6387 000029F7 6A2C                     push 44
  6388 000029F9 E856E5                   call istoken
  6389 000029FC 83C402                   add  sp, 2
  6390 000029FF 08C0                     or  al, al
  6391 00002A01 0F840300                 je .docall1341
  6392 00002A05 E9A7FE                   jmp .docall1331
  6393                                  .docall1341:
  6394                                  
  6395                                  ;-797 
  6396                                  
  6397                                  
  6398                                  ;-798   	expect(')');  i=narg;
  6399                                  
  6400 00002A08 6A29                     push 41
  6401 00002A0A E867E5                   call expect
  6402 00002A0D 83C402                   add  sp, 2
  6403 00002A10 8B46FC                   mov ax, [bp-4]
  6404 00002A13 8946FE                   mov [bp-2], ax
  6405                                  
  6406                                  ;-799     do {
  6407                                  
  6408                                  .docall1342:
  6409                                  
  6410                                  ;-800       t0 = docalltype [i];
  6411                                  
  6412 00002A16 8B5EFE                   mov bx, [bp-2]
  6413 00002A19 D1E3                     shl bx, 1
  6414 00002A1B 8B870EA3                 mov ax, [docalltype + bx]
  6415 00002A1F 8946FA                   mov [bp-6], ax
  6416                                  
  6417                                  ;-801       n0 = docallvalue[i];
  6418                                  
  6419 00002A22 8B5EFE                   mov bx, [bp-2]
  6420 00002A25 D1E3                     shl bx, 1
  6421 00002A27 8B8722A3                 mov ax, [docallvalue + bx]
  6422 00002A2B 8946F8                   mov [bp-8], ax
  6423                                  
  6424                                  ;-802       if(t0==1){ prs("\n push "); prunsign1(n0);}
  6425                                  
  6426 00002A2E 8B46FA                   mov ax, [bp-6]
  6427 00002A31 83F801                   cmp ax, 1
  6428 00002A34 0F851200                 jne .docall1343
  6429 00002A38 68[B02B]                 push docall1_5
  6430 00002A3B E8A1D9                   call prs
  6431 00002A3E 83C402                   add  sp, 2
  6432 00002A41 FF76F8                   push word [bp-8]
  6433 00002A44 E8FBDA                   call prunsign1
  6434 00002A47 83C402                   add  sp, 2
  6435                                  
  6436                                  ;-803       if(t0==2){ prs("\n push ");
  6437                                  
  6438                                  .docall1343:
  6439 00002A4A 8B46FA                   mov ax, [bp-6]
  6440 00002A4D 83F802                   cmp ax, 2
  6441 00002A50 0F852500                 jne .docall1344
  6442 00002A54 68[B92B]                 push docall1_6
  6443 00002A57 E885D9                   call prs
  6444 00002A5A 83C402                   add  sp, 2
  6445                                  
  6446                                  ;-804         prs(fname);prc(95);prunsign1(n0);}
  6447                                  
  6448 00002A5D 8D06E06D                 lea  ax, [fname]
  6449 00002A61 50                       push ax
  6450 00002A62 E87AD9                   call prs
  6451 00002A65 83C402                   add  sp, 2
  6452 00002A68 6A5F                     push 95
  6453 00002A6A E819D9                   call prc
  6454 00002A6D 83C402                   add  sp, 2
  6455 00002A70 FF76F8                   push word [bp-8]
  6456 00002A73 E8CCDA                   call prunsign1
  6457 00002A76 83C402                   add  sp, 2
  6458                                  
  6459                                  ;-805       if(t0==3){ prs("\n lea  ax, ");   v(n0);
  6460                                  
  6461                                  .docall1344:
  6462 00002A79 8B46FA                   mov ax, [bp-6]
  6463 00002A7C 83F803                   cmp ax, 3
  6464 00002A7F 0F851B00                 jne .docall1345
  6465 00002A83 68[C22B]                 push docall1_7
  6466 00002A86 E856D9                   call prs
  6467 00002A89 83C402                   add  sp, 2
  6468 00002A8C FF76F8                   push word [bp-8]
  6469 00002A8F E84AE5                   call v
  6470 00002A92 83C402                   add  sp, 2
  6471                                  
  6472                                  ;-806         prs("\n push ax");}
  6473                                  
  6474 00002A95 68[CF2B]                 push docall1_8
  6475 00002A98 E844D9                   call prs
  6476 00002A9B 83C402                   add  sp, 2
  6477                                  
  6478                                  ;-807       if(t0==4){ gettypes(n0);
  6479                                  
  6480                                  .docall1345:
  6481 00002A9E 8B46FA                   mov ax, [bp-6]
  6482 00002AA1 83F804                   cmp ax, 4
  6483 00002AA4 0F854300                 jne .docall1346
  6484 00002AA8 FF76F8                   push word [bp-8]
  6485 00002AAB E872E7                   call gettypes
  6486 00002AAE 83C402                   add  sp, 2
  6487                                  
  6488                                  ;-808         if(wi==2) { prs("\n push word "); v(n0);}
  6489                                  
  6490 00002AB1 A1[3600]                 mov ax, [wi]
  6491 00002AB4 83F802                   cmp ax, 2
  6492 00002AB7 0F851500                 jne .docall1347
  6493 00002ABB 68[DA2B]                 push docall1_9
  6494 00002ABE E81ED9                   call prs
  6495 00002AC1 83C402                   add  sp, 2
  6496 00002AC4 FF76F8                   push word [bp-8]
  6497 00002AC7 E812E5                   call v
  6498 00002ACA 83C402                   add  sp, 2
  6499                                  
  6500                                  ;-809         else { prs("\n mov al, byte ");   v(n0);
  6501                                  
  6502 00002ACD E91B00                   jmp .docall1348
  6503                                  .docall1347:
  6504 00002AD0 68[E82B]                 push docall1_10
  6505 00002AD3 E809D9                   call prs
  6506 00002AD6 83C402                   add  sp, 2
  6507 00002AD9 FF76F8                   push word [bp-8]
  6508 00002ADC E8FDE4                   call v
  6509 00002ADF 83C402                   add  sp, 2
  6510                                  
  6511                                  ;-810         prs("\n mov ah, 0\n push ax"); } }
  6512                                  
  6513 00002AE2 68[F92B]                 push docall1_11
  6514 00002AE5 E8F7D8                   call prs
  6515 00002AE8 83C402                   add  sp, 2
  6516                                  .docall1348:
  6517                                  
  6518                                  ;-811       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }
  6519                                  
  6520                                  .docall1346:
  6521 00002AEB 8B46FA                   mov ax, [bp-6]
  6522 00002AEE 83F805                   cmp ax, 5
  6523 00002AF1 0F852200                 jne .docall1349
  6524 00002AF5 68[102C]                 push docall1_12
  6525 00002AF8 E8E4D8                   call prs
  6526 00002AFB 83C402                   add  sp, 2
  6527 00002AFE FF76F8                   push word [bp-8]
  6528 00002B01 E8EFEE                   call printreg
  6529 00002B04 83C402                   add  sp, 2
  6530 00002B07 8B46F8                   mov ax, [bp-8]
  6531 00002B0A 83F82F                   cmp ax, 47 ;unsigned : 1
  6532 00002B0D 0F8C0600                 jl  .docall1350
  6533 00002B11 8B46F6                   mov ax, [bp-10]
  6534 00002B14 83C002                   add ax, 2
  6535                                  .docall1350:
  6536                                  
  6537                                  ;-812    i--; } while (i > 0);  }
  6538                                  
  6539                                  .docall1349:
  6540 00002B17 FF4EFE                   dec  word[bp-2]
  6541 00002B1A 8B46FE                   mov ax, [bp-2]
  6542 00002B1D 83F800                   cmp ax, 0
  6543 00002B20 0F8E0300                 jle .docall1351
  6544 00002B24 E9EFFE                   jmp .docall1342
  6545                                  .docall1351:
  6546                                  
  6547                                  ;-813 	 prs("\n call "); prs(&procname);
  6548                                  
  6549                                  .docall1330:
  6550 00002B27 68[192C]                 push docall1_13
  6551 00002B2A E8B2D8                   call prs
  6552 00002B2D 83C402                   add  sp, 2
  6553 00002B30 8D0636A3                 lea  ax, [procname]
  6554 00002B34 50                       push ax
  6555 00002B35 E8A7D8                   call prs
  6556 00002B38 83C402                   add  sp, 2
  6557                                  
  6558                                  ;-814 	 if (narg>0) {prs("\n add  sp, ");
  6559                                  
  6560 00002B3B 8B46FC                   mov ax, [bp-4]
  6561 00002B3E 83F800                   cmp ax, 0
  6562 00002B41 0F8E2400                 jle .docall1352
  6563 00002B45 68[222C]                 push docall1_14
  6564 00002B48 E894D8                   call prs
  6565 00002B4B 83C402                   add  sp, 2
  6566                                  
  6567                                  ;-815      narg=narg+narg; narg=narg+sz32; prunsign1(narg); }
  6568                                  
  6569 00002B4E 8B46FC                   mov ax, [bp-4]
  6570 00002B51 0346FC                   add ax, [bp-4]
  6571 00002B54 8946FC                   mov [bp-4], ax
  6572 00002B57 8B46FC                   mov ax, [bp-4]
  6573 00002B5A 0346F6                   add ax, [bp-10]
  6574 00002B5D 8946FC                   mov [bp-4], ax
  6575 00002B60 FF76FC                   push word [bp-4]
  6576 00002B63 E8DCD9                   call prunsign1
  6577 00002B66 83C402                   add  sp, 2
  6578                                  
  6579                                  ;-816  }
  6580                                  
  6581                                  .docall1352:
  6582                                  
  6583                                  ;-817 
  6584                                  
  6585                                  
  6586                                  ;-818  int evalue=0;
  6587 00002B69 C9                       LEAVE
  6588 00002B6A C3                       ret
  6589 00002B6B 4D61782E2039207061-     docall1_0 db "Max. 9 parameters",0
  6590 00002B74 72616D657465727300 
  6591 00002B7D 5C6E00                  docall1_1 db "\n",0
  6592 00002B80 2064622000              docall1_2 db " db ",0
  6593 00002B85 2C3000                  docall1_3 db ",0",0
  6594 00002B88 706172616D65746572-     docall1_4 db "parameter not recognized (no * allowed)",0
  6595 00002B91 206E6F74207265636F-
  6596 00002B9A 676E697A656420286E-
  6597 00002BA3 6F202A20616C6C6F77-
  6598 00002BAC 65642900           
  6599 00002BB0 5C6E20707573682000      docall1_5 db "\n push ",0
  6600 00002BB9 5C6E20707573682000      docall1_6 db "\n push ",0
  6601 00002BC2 5C6E206C6561202061-     docall1_7 db "\n lea  ax, ",0
  6602 00002BCB 782C2000           
  6603 00002BCF 5C6E20707573682061-     docall1_8 db "\n push ax",0
  6604 00002BD8 7800               
  6605 00002BDA 5C6E20707573682077-     docall1_9 db "\n push word ",0
  6606 00002BE3 6F72642000         
  6607 00002BE8 5C6E206D6F7620616C-     docall1_10 db "\n mov al, byte ",0
  6608 00002BF1 2C20627974652000   
  6609 00002BF9 5C6E206D6F76206168-     docall1_11 db "\n mov ah, 0\n push ax",0
  6610 00002C02 2C20305C6E20707573-
  6611 00002C0B 6820617800         
  6612 00002C10 5C6E20707573682000      docall1_12 db "\n push ",0
  6613 00002C19 5C6E2063616C6C2000      docall1_13 db "\n call ",0
  6614 00002C22 5C6E20616464202073-     docall1_14 db "\n add  sp, ",0
  6615 00002C2B 702C2000           
  6616                                  ENDP
  6617 00002C2F 0000                    evalue dw 0
  6618                                  
  6619                                  ;-819  int expr(int isRight)
  6620                                  
  6621                                  
  6622                                  expr: PROC
  6623                                  
  6624                                  ;-820  { int mode; int id1;     int ixarr; int ixconst;
  6625                                  
  6626                                  
  6627                                  ;-821    int ids;  int isCONST; int i;     unsigned char *p;
  6628                                  
  6629                                  
  6630                                  ;-822    if (istoken(T_CONST)) { evalue=lexval;
  6631                                  ;
  6632 00002C31 C8100000                 ENTER  16,0
  6633 00002C35 680101                   push 257
  6634 00002C38 E817E3                   call istoken
  6635 00002C3B 83C402                   add  sp, 2
  6636 00002C3E 08C0                     or  al, al
  6637 00002C40 0F841F00                 je .expr353
  6638 00002C44 A1[2B00]                 mov ax, [lexval]
  6639 00002C47 A3[2F2C]                 mov word [evalue], ax
  6640                                  
  6641                                  ;-823      prs("\n mov ax, "); prunsign1(lexval); return 4; }
  6642                                  
  6643 00002C4A 68[CE2F]                 push expr_0
  6644 00002C4D E88FD7                   call prs
  6645 00002C50 83C402                   add  sp, 2
  6646 00002C53 FF36[2B00]               push word [lexval]
  6647 00002C57 E8E8D8                   call prunsign1
  6648 00002C5A 83C402                   add  sp, 2
  6649 00002C5D B80400                   mov ax, 4
  6650 00002C60 E96903                   jmp .retnexpr
  6651                                  
  6652                                  ;-824    mode=typeName(); /*0=V,1=*,2=&*/
  6653                                  
  6654                                  .expr353:
  6655 00002C63 E8E1E4                   call typeName
  6656 00002C66 8946FE                   mov [bp-2], ax
  6657                                  
  6658                                  ;-825    ireg1=checkreg();
  6659                                  
  6660 00002C69 E879E9                   call checkreg
  6661 00002C6C A3[4B00]                 mov word [ireg1], ax
  6662                                  
  6663                                  ;-826    if (ireg1) { doreg1(0); return; }
  6664                                  
  6665 00002C6F A1[4B00]                 mov ax, [ireg1]
  6666 00002C72 08C0                     or  al, al
  6667 00002C74 0F840B00                 je .expr354
  6668 00002C78 6A00                     push 0
  6669 00002C7A E8E2EE                   call doreg1
  6670 00002C7D 83C402                   add  sp, 2
  6671 00002C80 E94903                   jmp .retnexpr
  6672                                  
  6673                                  ;-827    if (token=='(')  {docall1(); goto e1; }
  6674                                  
  6675                                  .expr354:
  6676 00002C83 A1[1E00]                 mov ax, [token]
  6677 00002C86 83F828                   cmp ax, 40
  6678 00002C89 0F850600                 jne .expr355
  6679 00002C8D E8E5FB                   call docall1
  6680 00002C90 E92F02                   jmp .e1
  6681                                  
  6682                                  ;-828    if (isreg()) goto e1;
  6683                                  
  6684                                  .expr355:
  6685 00002C93 E8D0F4                   call isreg
  6686 00002C96 08C0                     or  al, al
  6687 00002C98 0F840300                 je .expr356
  6688 00002C9C E92302                   jmp .e1
  6689                                  
  6690                                  ;-829 
  6691                                  
  6692                                  
  6693                                  ;-830    id1=searchname(); gettypes(id1); ids=signi;
  6694                                  
  6695                                  .expr356:
  6696 00002C9F E847E4                   call searchname
  6697 00002CA2 8946FC                   mov [bp-4], ax
  6698 00002CA5 FF76FC                   push word [bp-4]
  6699 00002CA8 E875E5                   call gettypes
  6700 00002CAB 83C402                   add  sp, 2
  6701 00002CAE A1[3000]                 mov ax, [signi]
  6702 00002CB1 8946F6                   mov [bp-10], ax
  6703                                  
  6704                                  ;-831    ixarr=0;  ixconst=0;
  6705                                  
  6706 00002CB4 B80000                   mov ax, 0
  6707 00002CB7 8946FA                   mov [bp-6], ax
  6708 00002CBA B80000                   mov ax, 0
  6709 00002CBD 8946F8                   mov [bp-8], ax
  6710                                  
  6711                                  ;-832      if (istoken('[')) { if (istoken(T_CONST)) {
  6712                                  
  6713 00002CC0 6A5B                     push 91
  6714 00002CC2 E88DE2                   call istoken
  6715 00002CC5 83C402                   add  sp, 2
  6716 00002CC8 08C0                     or  al, al
  6717 00002CCA 0F845900                 je .expr357
  6718 00002CCE 680101                   push 257
  6719 00002CD1 E87EE2                   call istoken
  6720 00002CD4 83C402                   add  sp, 2
  6721 00002CD7 08C0                     or  al, al
  6722 00002CD9 0F841700                 je .expr358
  6723                                  
  6724                                  ;-833        ixconst=1; ixarr=lexval; expect(']');  }
  6725                                  
  6726 00002CDD B80100                   mov ax, 1
  6727 00002CE0 8946F8                   mov [bp-8], ax
  6728 00002CE3 A1[2B00]                 mov ax, [lexval]
  6729 00002CE6 8946FA                   mov [bp-6], ax
  6730 00002CE9 6A5D                     push 93
  6731 00002CEB E886E2                   call expect
  6732 00002CEE 83C402                   add  sp, 2
  6733                                  
  6734                                  ;-834      else {ixarr=searchname(); expect(T_NAME); expect(']');
  6735                                  
  6736 00002CF1 E93300                   jmp .expr359
  6737                                  .expr358:
  6738 00002CF4 E8F2E3                   call searchname
  6739 00002CF7 8946FA                   mov [bp-6], ax
  6740 00002CFA 680001                   push 256
  6741 00002CFD E874E2                   call expect
  6742 00002D00 83C402                   add  sp, 2
  6743 00002D03 6A5D                     push 93
  6744 00002D05 E86CE2                   call expect
  6745 00002D08 83C402                   add  sp, 2
  6746                                  
  6747                                  ;-835      gettypes(ixarr);
  6748                                  
  6749 00002D0B FF76FA                   push word [bp-6]
  6750 00002D0E E80FE5                   call gettypes
  6751 00002D11 83C402                   add  sp, 2
  6752                                  
  6753                                  ;-836      if (widthi != 2) error1("Array index must be number or int"); } }
  6754                                  
  6755 00002D14 A1[3300]                 mov ax, [widthi]
  6756 00002D17 83F802                   cmp ax, 2
  6757 00002D1A 0F840900                 je  .expr360
  6758 00002D1E 68[DA2F]                 push expr_1
  6759 00002D21 E8DCD8                   call error1
  6760 00002D24 83C402                   add  sp, 2
  6761                                  .expr360:
  6762                                  .expr359:
  6763                                  
  6764                                  ;-837    if (istoken(T_PLUSPLUS  )) {if(mode)error1("Only var allowed");
  6765                                  
  6766                                  .expr357:
  6767 00002D27 68C304                   push 1219
  6768 00002D2A E825E2                   call istoken
  6769 00002D2D 83C402                   add  sp, 2
  6770 00002D30 08C0                     or  al, al
  6771 00002D32 0F844600                 je .expr361
  6772 00002D36 8B46FE                   mov ax, [bp-2]
  6773 00002D39 08C0                     or  al, al
  6774 00002D3B 0F840900                 je .expr362
  6775 00002D3F 68[FC2F]                 push expr_2
  6776 00002D42 E8BBD8                   call error1
  6777 00002D45 83C402                   add  sp, 2
  6778                                  
  6779                                  ;-838       prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");
  6780                                  
  6781                                  .expr362:
  6782 00002D48 68[0D30]                 push expr_3
  6783 00002D4B E891D6                   call prs
  6784 00002D4E 83C402                   add  sp, 2
  6785 00002D51 A1[3600]                 mov ax, [wi]
  6786 00002D54 83F802                   cmp ax, 2
  6787 00002D57 0F850C00                 jne .expr363
  6788 00002D5B 68[1630]                 push expr_4
  6789 00002D5E E87ED6                   call prs
  6790 00002D61 83C402                   add  sp, 2
  6791 00002D64 E90900                   jmp .expr364
  6792                                  .expr363:
  6793 00002D67 68[1B30]                 push expr_5
  6794 00002D6A E872D6                   call prs
  6795 00002D6D 83C402                   add  sp, 2
  6796                                  
  6797                                  ;-839       v(id1); goto e1;}
  6798                                  
  6799                                  .expr364:
  6800 00002D70 FF76FC                   push word [bp-4]
  6801 00002D73 E866E2                   call v
  6802 00002D76 83C402                   add  sp, 2
  6803 00002D79 E94601                   jmp .e1
  6804                                  
  6805                                  ;-840    if (istoken(T_MINUSMINUS)) {if(mode)error1("Only var allowed");
  6806                                  
  6807                                  .expr361:
  6808 00002D7C 68C904                   push 1225
  6809 00002D7F E8D0E1                   call istoken
  6810 00002D82 83C402                   add  sp, 2
  6811 00002D85 08C0                     or  al, al
  6812 00002D87 0F844600                 je .expr365
  6813 00002D8B 8B46FE                   mov ax, [bp-2]
  6814 00002D8E 08C0                     or  al, al
  6815 00002D90 0F840900                 je .expr366
  6816 00002D94 68[2030]                 push expr_6
  6817 00002D97 E866D8                   call error1
  6818 00002D9A 83C402                   add  sp, 2
  6819                                  
  6820                                  ;-841       prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");
  6821                                  
  6822                                  .expr366:
  6823 00002D9D 68[3130]                 push expr_7
  6824 00002DA0 E83CD6                   call prs
  6825 00002DA3 83C402                   add  sp, 2
  6826 00002DA6 A1[3600]                 mov ax, [wi]
  6827 00002DA9 83F802                   cmp ax, 2
  6828 00002DAC 0F850C00                 jne .expr367
  6829 00002DB0 68[3A30]                 push expr_8
  6830 00002DB3 E829D6                   call prs
  6831 00002DB6 83C402                   add  sp, 2
  6832 00002DB9 E90900                   jmp .expr368
  6833                                  .expr367:
  6834 00002DBC 68[3F30]                 push expr_9
  6835 00002DBF E81DD6                   call prs
  6836 00002DC2 83C402                   add  sp, 2
  6837                                  
  6838                                  ;-842       v(id1); goto e1;}
  6839                                  
  6840                                  .expr368:
  6841 00002DC5 FF76FC                   push word [bp-4]
  6842 00002DC8 E811E2                   call v
  6843 00002DCB 83C402                   add  sp, 2
  6844 00002DCE E9F100                   jmp .e1
  6845                                  
  6846                                  ;-843 
  6847                                  
  6848                                  
  6849                                  ;-844    if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}
  6850                                  
  6851                                  .expr365:
  6852 00002DD1 68CE04                   push 1230
  6853 00002DD4 E87BE1                   call istoken
  6854 00002DD7 83C402                   add  sp, 2
  6855 00002DDA 08C0                     or  al, al
  6856 00002DDC 0F841200                 je .expr369
  6857 00002DE0 FF76FC                   push word [bp-4]
  6858 00002DE3 FF76FE                   push word [bp-2]
  6859 00002DE6 68[4430]                 push expr_10
  6860 00002DE9 E85FEF                   call compoundass
  6861 00002DEC 83C406                   add  sp, 6
  6862 00002DEF E9D000                   jmp .e1
  6863                                  
  6864                                  ;-845    if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}
  6865                                  
  6866                                  .expr369:
  6867 00002DF2 68CF04                   push 1231
  6868 00002DF5 E85AE1                   call istoken
  6869 00002DF8 83C402                   add  sp, 2
  6870 00002DFB 08C0                     or  al, al
  6871 00002DFD 0F841200                 je .expr370
  6872 00002E01 FF76FC                   push word [bp-4]
  6873 00002E04 FF76FE                   push word [bp-2]
  6874 00002E07 68[4830]                 push expr_11
  6875 00002E0A E83EEF                   call compoundass
  6876 00002E0D 83C406                   add  sp, 6
  6877 00002E10 E9AF00                   jmp .e1
  6878                                  
  6879                                  ;-846    if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}
  6880                                  
  6881                                  .expr370:
  6882 00002E13 68D204                   push 1234
  6883 00002E16 E839E1                   call istoken
  6884 00002E19 83C402                   add  sp, 2
  6885 00002E1C 08C0                     or  al, al
  6886 00002E1E 0F841200                 je .expr371
  6887 00002E22 FF76FC                   push word [bp-4]
  6888 00002E25 FF76FE                   push word [bp-2]
  6889 00002E28 68[4C30]                 push expr_12
  6890 00002E2B E81DEF                   call compoundass
  6891 00002E2E 83C406                   add  sp, 6
  6892 00002E31 E98E00                   jmp .e1
  6893                                  
  6894                                  ;-847    if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}
  6895                                  
  6896                                  .expr371:
  6897 00002E34 68D304                   push 1235
  6898 00002E37 E818E1                   call istoken
  6899 00002E3A 83C402                   add  sp, 2
  6900 00002E3D 08C0                     or  al, al
  6901 00002E3F 0F841200                 je .expr372
  6902 00002E43 FF76FC                   push word [bp-4]
  6903 00002E46 FF76FE                   push word [bp-2]
  6904 00002E49 68[5030]                 push expr_13
  6905 00002E4C E8FCEE                   call compoundass
  6906 00002E4F 83C406                   add  sp, 6
  6907 00002E52 E96D00                   jmp .e1
  6908                                  
  6909                                  ;-848    if (istoken(T_MULASS    )) {error1("not implemented");}
  6910                                  
  6911                                  .expr372:
  6912 00002E55 68D004                   push 1232
  6913 00002E58 E8F7E0                   call istoken
  6914 00002E5B 83C402                   add  sp, 2
  6915 00002E5E 08C0                     or  al, al
  6916 00002E60 0F840900                 je .expr373
  6917 00002E64 68[5330]                 push expr_14
  6918 00002E67 E896D7                   call error1
  6919 00002E6A 83C402                   add  sp, 2
  6920                                  
  6921                                  ;-849    if (istoken(T_DIVASS    )) {error1("not implemented");}
  6922                                  
  6923                                  .expr373:
  6924 00002E6D 68D104                   push 1233
  6925 00002E70 E8DFE0                   call istoken
  6926 00002E73 83C402                   add  sp, 2
  6927 00002E76 08C0                     or  al, al
  6928 00002E78 0F840900                 je .expr374
  6929 00002E7C 68[6330]                 push expr_15
  6930 00002E7F E87ED7                   call error1
  6931 00002E82 83C402                   add  sp, 2
  6932                                  
  6933                                  ;-850 
  6934                                  
  6935                                  
  6936                                  ;-851    if (istoken('=')) {
  6937                                  
  6938                                  .expr374:
  6939 00002E85 6A3D                     push 61
  6940 00002E87 E8C8E0                   call istoken
  6941 00002E8A 83C402                   add  sp, 2
  6942 00002E8D 08C0                     or  al, al
  6943 00002E8F 0F841D00                 je .expr375
  6944                                  
  6945                                  ;-852        expr(1);
  6946                                  
  6947 00002E93 6A01                     push 1
  6948 00002E95 E899FD                   call expr
  6949 00002E98 83C402                   add  sp, 2
  6950                                  
  6951                                  ;-853        doassign(mode, id1, ixarr, ixconst);
  6952                                  
  6953 00002E9B FF76F8                   push word [bp-8]
  6954 00002E9E FF76FA                   push word [bp-6]
  6955 00002EA1 FF76FC                   push word [bp-4]
  6956 00002EA4 FF76FE                   push word [bp-2]
  6957 00002EA7 E818F5                   call doassign
  6958 00002EAA 83C408                   add  sp, 8
  6959                                  
  6960                                  ;-854        goto e1;
  6961                                  
  6962 00002EAD E91200                   jmp .e1
  6963                                  
  6964                                  ;-855    }
  6965                                  
  6966                                  
  6967                                  ;-856    dovar1(mode, "mov", ixarr, id1);
  6968                                  
  6969                                  .expr375:
  6970 00002EB0 FF76FC                   push word [bp-4]
  6971 00002EB3 FF76FA                   push word [bp-6]
  6972 00002EB6 68[7330]                 push expr_16
  6973 00002EB9 FF76FE                   push word [bp-2]
  6974 00002EBC E82EEF                   call dovar1
  6975 00002EBF 83C408                   add  sp, 8
  6976                                  
  6977                                  ;-857 
  6978                                  
  6979                                  
  6980                                  ;-858  e1:    if (istoken('+')) rterm("add");
  6981                                  
  6982                                  .e1:
  6983 00002EC2 6A2B                     push 43
  6984 00002EC4 E88BE0                   call istoken
  6985 00002EC7 83C402                   add  sp, 2
  6986 00002ECA 08C0                     or  al, al
  6987 00002ECC 0F840C00                 je .expr376
  6988 00002ED0 68[7730]                 push expr_17
  6989 00002ED3 E8E1F0                   call rterm
  6990 00002ED6 83C402                   add  sp, 2
  6991                                  
  6992                                  ;-859    else if (istoken('-')) rterm("sub" );
  6993                                  
  6994 00002ED9 E9CF00                   jmp .expr377
  6995                                  .expr376:
  6996 00002EDC 6A2D                     push 45
  6997 00002EDE E871E0                   call istoken
  6998 00002EE1 83C402                   add  sp, 2
  6999 00002EE4 08C0                     or  al, al
  7000 00002EE6 0F840C00                 je .expr378
  7001 00002EEA 68[7B30]                 push expr_18
  7002 00002EED E8C7F0                   call rterm
  7003 00002EF0 83C402                   add  sp, 2
  7004                                  
  7005                                  ;-860    else if (istoken('&')) rterm("and" );
  7006                                  
  7007 00002EF3 E9B500                   jmp .expr379
  7008                                  .expr378:
  7009 00002EF6 6A26                     push 38
  7010 00002EF8 E857E0                   call istoken
  7011 00002EFB 83C402                   add  sp, 2
  7012 00002EFE 08C0                     or  al, al
  7013 00002F00 0F840C00                 je .expr380
  7014 00002F04 68[7F30]                 push expr_19
  7015 00002F07 E8ADF0                   call rterm
  7016 00002F0A 83C402                   add  sp, 2
  7017                                  
  7018                                  ;-861    else if (istoken('|')) rterm("or" );
  7019                                  
  7020 00002F0D E99B00                   jmp .expr381
  7021                                  .expr380:
  7022 00002F10 6A7C                     push 124
  7023 00002F12 E83DE0                   call istoken
  7024 00002F15 83C402                   add  sp, 2
  7025 00002F18 08C0                     or  al, al
  7026 00002F1A 0F840C00                 je .expr382
  7027 00002F1E 68[8330]                 push expr_20
  7028 00002F21 E893F0                   call rterm
  7029 00002F24 83C402                   add  sp, 2
  7030                                  
  7031                                  ;-862    else if (istoken(T_LESSLESS)) rterm("shl");
  7032                                  
  7033 00002F27 E98100                   jmp .expr383
  7034                                  .expr382:
  7035 00002F2A 68D804                   push 1240
  7036 00002F2D E822E0                   call istoken
  7037 00002F30 83C402                   add  sp, 2
  7038 00002F33 08C0                     or  al, al
  7039 00002F35 0F840C00                 je .expr384
  7040 00002F39 68[8630]                 push expr_21
  7041 00002F3C E878F0                   call rterm
  7042 00002F3F 83C402                   add  sp, 2
  7043                                  
  7044                                  ;-863    else if (istoken(T_GREATGREAT)) rterm("shr");
  7045                                  
  7046 00002F42 E96600                   jmp .expr385
  7047                                  .expr384:
  7048 00002F45 68D904                   push 1241
  7049 00002F48 E807E0                   call istoken
  7050 00002F4B 83C402                   add  sp, 2
  7051 00002F4E 08C0                     or  al, al
  7052 00002F50 0F840C00                 je .expr386
  7053 00002F54 68[8A30]                 push expr_22
  7054 00002F57 E85DF0                   call rterm
  7055 00002F5A 83C402                   add  sp, 2
  7056                                  
  7057                                  ;-864    else if (istoken('*')) domul (ids);
  7058                                  
  7059 00002F5D E94B00                   jmp .expr387
  7060                                  .expr386:
  7061 00002F60 6A2A                     push 42
  7062 00002F62 E8EDDF                   call istoken
  7063 00002F65 83C402                   add  sp, 2
  7064 00002F68 08C0                     or  al, al
  7065 00002F6A 0F840C00                 je .expr388
  7066 00002F6E FF76F6                   push word [bp-10]
  7067 00002F71 E897F6                   call domul
  7068 00002F74 83C402                   add  sp, 2
  7069                                  
  7070                                  ;-865    else if (istoken('/')) doidiv(ids);
  7071                                  
  7072 00002F77 E93100                   jmp .expr389
  7073                                  .expr388:
  7074 00002F7A 6A2F                     push 47
  7075 00002F7C E8D3DF                   call istoken
  7076 00002F7F 83C402                   add  sp, 2
  7077 00002F82 08C0                     or  al, al
  7078 00002F84 0F840C00                 je .expr390
  7079 00002F88 FF76F6                   push word [bp-10]
  7080 00002F8B E81EF7                   call doidiv
  7081 00002F8E 83C402                   add  sp, 2
  7082                                  
  7083                                  ;-866    else if (istoken('%')) domod (ids);
  7084                                  
  7085 00002F91 E91700                   jmp .expr391
  7086                                  .expr390:
  7087 00002F94 6A25                     push 37
  7088 00002F96 E8B9DF                   call istoken
  7089 00002F99 83C402                   add  sp, 2
  7090 00002F9C 08C0                     or  al, al
  7091 00002F9E 0F840900                 je .expr392
  7092 00002FA2 FF76F6                   push word [bp-10]
  7093 00002FA5 E8A7F8                   call domod
  7094 00002FA8 83C402                   add  sp, 2
  7095                                  
  7096                                  ;-867    if (isrelational()) { rterm("cmp"); cmpneg(ids);}
  7097                                  
  7098                                  .expr392:
  7099                                  .expr391:
  7100                                  .expr389:
  7101                                  .expr387:
  7102                                  .expr385:
  7103                                  .expr383:
  7104                                  .expr381:
  7105                                  .expr379:
  7106                                  .expr377:
  7107 00002FAB E8D0E5                   call isrelational
  7108 00002FAE 08C0                     or  al, al
  7109 00002FB0 0F841200                 je .expr393
  7110 00002FB4 68[8E30]                 push expr_23
  7111 00002FB7 E8FDEF                   call rterm
  7112 00002FBA 83C402                   add  sp, 2
  7113 00002FBD FF76F6                   push word [bp-10]
  7114 00002FC0 E84BE4                   call cmpneg
  7115 00002FC3 83C402                   add  sp, 2
  7116                                  
  7117                                  ;-868    return 0;
  7118                                  
  7119                                  .expr393:
  7120 00002FC6 B80000                   mov ax, 0
  7121 00002FC9 E90000                   jmp .retnexpr
  7122                                  
  7123                                  ;-869  }
  7124                                  
  7125                                  
  7126                                  ;-870 
  7127                                  
  7128                                  
  7129                                  ;-871  int pexpr() {expect('('); iscmp=0;
  7130                                  
  7131 00002FCC C9                       .retnexpr: LEAVE
  7132 00002FCD C3                       ret
  7133 00002FCE 5C6E206D6F76206178-     expr_0 db "\n mov ax, ",0
  7134 00002FD7 2C2000             
  7135 00002FDA 417272617920696E64-     expr_1 db "Array index must be number or int",0
  7136 00002FE3 6578206D7573742062-
  7137 00002FEC 65206E756D62657220-
  7138 00002FF5 6F7220696E7400     
  7139 00002FFC 4F6E6C792076617220-     expr_2 db "Only var allowed",0
  7140 00003005 616C6C6F77656400   
  7141 0000300D 5C6E20696E63202000      expr_3 db "\n inc  ",0
  7142 00003016 776F726400              expr_4 db "word",0
  7143 0000301B 6279746500              expr_5 db "byte",0
  7144 00003020 4F6E6C792076617220-     expr_6 db "Only var allowed",0
  7145 00003029 616C6C6F77656400   
  7146 00003031 5C6E20646563202000      expr_7 db "\n dec  ",0
  7147 0000303A 776F726400              expr_8 db "word",0
  7148 0000303F 6279746500              expr_9 db "byte",0
  7149 00003044 61646400                expr_10 db "add",0
  7150 00003048 73756200                expr_11 db "sub",0
  7151 0000304C 616E6400                expr_12 db "and",0
  7152 00003050 6F7200                  expr_13 db "or",0
  7153 00003053 6E6F7420696D706C65-     expr_14 db "not implemented",0
  7154 0000305C 6D656E74656400     
  7155 00003063 6E6F7420696D706C65-     expr_15 db "not implemented",0
  7156 0000306C 6D656E74656400     
  7157 00003073 6D6F7600                expr_16 db "mov",0
  7158 00003077 61646400                expr_17 db "add",0
  7159 0000307B 73756200                expr_18 db "sub",0
  7160 0000307F 616E6400                expr_19 db "and",0
  7161 00003083 6F7200                  expr_20 db "or",0
  7162 00003086 73686C00                expr_21 db "shl",0
  7163 0000308A 73687200                expr_22 db "shr",0
  7164 0000308E 636D7000                expr_23 db "cmp",0
  7165                                  ENDP
  7166                                  
  7167                                  pexpr: PROC
  7168 00003092 6A28                     push 40
  7169 00003094 E8DDDE                   call expect
  7170 00003097 83C402                   add  sp, 2
  7171 0000309A B80000                   mov ax, 0
  7172 0000309D A3[2300]                 mov word [iscmp], ax
  7173                                  
  7174                                  ;-872    if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}
  7175                                  
  7176 000030A0 A1[1E00]                 mov ax, [token]
  7177 000030A3 3D0001                   cmp ax, 256
  7178 000030A6 0F853400                 jne .pexpr394
  7179 000030AA 68[0D31]                 push pexpr_0
  7180 000030AD 8D06606D                 lea  ax, [symbol]
  7181 000030B1 50                       push ax
  7182 000030B2 E8AAD1                   call eqstr
  7183 000030B5 83C404                   add  sp, 4
  7184 000030B8 08C0                     or  al, al
  7185 000030BA 0F840600                 je .pexpr395
  7186 000030BE E89FE9                   call constantexpr
  7187 000030C1 E94800                   jmp .retnpexpr
  7188                                  
  7189                                  ;-873      ireg1=checkreg();
  7190                                  
  7191                                  .pexpr395:
  7192 000030C4 E81EE5                   call checkreg
  7193 000030C7 A3[4B00]                 mov word [ireg1], ax
  7194                                  
  7195                                  ;-874      if (ireg1) { doreg1(1); return; }  }
  7196                                  
  7197 000030CA A1[4B00]                 mov ax, [ireg1]
  7198 000030CD 08C0                     or  al, al
  7199 000030CF 0F840B00                 je .pexpr396
  7200 000030D3 6A01                     push 1
  7201 000030D5 E887EA                   call doreg1
  7202 000030D8 83C402                   add  sp, 2
  7203 000030DB E92E00                   jmp .retnpexpr
  7204                                  .pexpr396:
  7205                                  
  7206                                  ;-875    expr(0);
  7207                                  
  7208                                  .pexpr394:
  7209 000030DE 6A00                     push 0
  7210 000030E0 E84EFB                   call expr
  7211 000030E3 83C402                   add  sp, 2
  7212                                  
  7213                                  ;-876    if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);
  7214                                  
  7215 000030E6 A1[2300]                 mov ax, [iscmp]
  7216 000030E9 83F800                   cmp ax, 0
  7217 000030EC 0F850900                 jne .pexpr397
  7218 000030F0 68[0F31]                 push pexpr_1
  7219 000030F3 E8E9D2                   call prs
  7220 000030F6 83C402                   add  sp, 2
  7221                                  .pexpr397:
  7222 000030F9 8D06E06D                 lea  ax, [fname]
  7223 000030FD 50                       push ax
  7224 000030FE E8DED2                   call prs
  7225 00003101 83C402                   add  sp, 2
  7226                                  
  7227                                  ;-877    expect(')');
  7228                                  
  7229 00003104 6A29                     push 41
  7230 00003106 E86BDE                   call expect
  7231 00003109 83C402                   add  sp, 2
  7232                                  
  7233                                  ;-878  }
  7234                                  
  7235                                  
  7236                                  ;-879 
  7237                                  
  7238                                  
  7239                                  ;-880 /***************************************************************/
  7240                                  
  7241                                  
  7242                                  ;-881 
  7243                                  
  7244                                  
  7245                                  ;-882 int prlabel(int n) {
  7246                                  
  7247                                   .retnpexpr:
  7248 0000310C C3                       ret
  7249 0000310D 5F00                    pexpr_0 db "_",0
  7250 0000310F 5C6E206F722020616C-     pexpr_1 db "\n or  al, al\n je .",0
  7251 00003118 2C20616C5C6E206A65-
  7252 00003121 202E00             
  7253                                  ENDP
  7254                                  
  7255                                  prlabel: PROC
  7256                                  
  7257                                  ;-883     prs("\n.");
  7258                                  ;
  7259 00003124 C8000000                 ENTER  0,0
  7260 00003128 68[4F31]                 push prlabel_0
  7261 0000312B E8B1D2                   call prs
  7262 0000312E 83C402                   add  sp, 2
  7263                                  
  7264                                  ;-884     prs(fname);
  7265                                  
  7266 00003131 8D06E06D                 lea  ax, [fname]
  7267 00003135 50                       push ax
  7268 00003136 E8A6D2                   call prs
  7269 00003139 83C402                   add  sp, 2
  7270                                  
  7271                                  ;-885     prunsign1(n);
  7272                                  
  7273 0000313C FF7604                   push word [bp+4]
  7274 0000313F E800D4                   call prunsign1
  7275 00003142 83C402                   add  sp, 2
  7276                                  
  7277                                  ;-886     prc(':');
  7278                                  
  7279 00003145 6A3A                     push 58
  7280 00003147 E83CD2                   call prc
  7281 0000314A 83C402                   add  sp, 2
  7282                                  
  7283                                  ;-887 }
  7284                                  
  7285                                  
  7286                                  ;-888 int prjump (int n) {
  7287 0000314D C9                       LEAVE
  7288 0000314E C3                       ret
  7289 0000314F 5C6E2E00                prlabel_0 db "\n.",0
  7290                                  ENDP
  7291                                  
  7292                                  prjump: PROC
  7293                                  
  7294                                  ;-889     prs("\n jmp .");
  7295                                  ;
  7296 00003153 C8000000                 ENTER  0,0
  7297 00003157 68[7631]                 push prjump_0
  7298 0000315A E882D2                   call prs
  7299 0000315D 83C402                   add  sp, 2
  7300                                  
  7301                                  ;-890     prs(fname);
  7302                                  
  7303 00003160 8D06E06D                 lea  ax, [fname]
  7304 00003164 50                       push ax
  7305 00003165 E877D2                   call prs
  7306 00003168 83C402                   add  sp, 2
  7307                                  
  7308                                  ;-891     prunsign1(n);
  7309                                  
  7310 0000316B FF7604                   push word [bp+4]
  7311 0000316E E8D1D3                   call prunsign1
  7312 00003171 83C402                   add  sp, 2
  7313                                  
  7314                                  ;-892 }
  7315                                  
  7316                                  
  7317                                  ;-893 
  7318                                  
  7319                                  
  7320                                  ;-894 int stmt() {
  7321 00003174 C9                       LEAVE
  7322 00003175 C3                       ret
  7323 00003176 5C6E206A6D70202E00      prjump_0 db "\n jmp .",0
  7324                                  ENDP
  7325                                  
  7326                                  stmt: PROC
  7327                                  
  7328                                  ;-895     int c; char cha;
  7329                                  
  7330                                  
  7331                                  ;-896     int jdest; int tst; int jtemp;
  7332                                  
  7333                                  
  7334                                  ;-897        if(istoken('{'))     {while(istoken('}')==0) stmt();}
  7335                                  ;
  7336 0000317F C80A0000                 ENTER  10,0
  7337 00003183 6A7B                     push 123
  7338 00003185 E8CADD                   call istoken
  7339 00003188 83C402                   add  sp, 2
  7340 0000318B 08C0                     or  al, al
  7341 0000318D 0F841700                 je .stmt398
  7342                                  .stmt399:
  7343 00003191 6A7D                     push 125
  7344 00003193 E8BCDD                   call istoken
  7345 00003196 83C402                   add  sp, 2
  7346 00003199 83F800                   cmp ax, 0
  7347 0000319C 0F850500                 jne .stmt400
  7348 000031A0 E8DCFF                   call stmt
  7349 000031A3 EBEC                     jmp .stmt399
  7350                                  .stmt400:
  7351                                  
  7352                                  ;-898   else if(istoken(T_IF)) {
  7353                                  
  7354 000031A5 E9D002                   jmp .stmt401
  7355                                  .stmt398:
  7356 000031A8 680102                   push 513
  7357 000031AB E8A4DD                   call istoken
  7358 000031AE 83C402                   add  sp, 2
  7359 000031B1 08C0                     or  al, al
  7360 000031B3 0F846500                 je .stmt402
  7361                                  
  7362                                  ;-899       int jdest; int tst;
  7363                                  
  7364 000031B7 8B46FA                   mov ax, [bp-6]
  7365 000031BA 8B46F8                   mov ax, [bp-8]
  7366                                  
  7367                                  ;-900       pexpr(); nlabel++; jdest=nlabel;
  7368                                  
  7369 000031BD E8D2FE                   call pexpr
  7370 000031C0 FF06[2900]               inc  word[nlabel]
  7371 000031C4 A1[2900]                 mov ax, [nlabel]
  7372 000031C7 8946FA                   mov [bp-6], ax
  7373                                  
  7374                                  ;-901       pint1(jdest); stmt();
  7375                                  
  7376 000031CA FF76FA                   push word [bp-6]
  7377 000031CD E814D3                   call pint1
  7378 000031D0 83C402                   add  sp, 2
  7379 000031D3 E8A9FF                   call stmt
  7380                                  
  7381                                  ;-902       if (istoken(T_ELSE)) { nlabel++; tst=nlabel;
  7382                                  
  7383 000031D6 680202                   push 514
  7384 000031D9 E876DD                   call istoken
  7385 000031DC 83C402                   add  sp, 2
  7386 000031DF 08C0                     or  al, al
  7387 000031E1 0F842B00                 je .stmt403
  7388 000031E5 FF06[2900]               inc  word[nlabel]
  7389 000031E9 A1[2900]                 mov ax, [nlabel]
  7390 000031EC 8946F8                   mov [bp-8], ax
  7391                                  
  7392                                  ;-903           prjump(tst); prlabel(jdest); stmt(); prlabel(tst);
  7393                                  
  7394 000031EF FF76F8                   push word [bp-8]
  7395 000031F2 E85EFF                   call prjump
  7396 000031F5 83C402                   add  sp, 2
  7397 000031F8 FF76FA                   push word [bp-6]
  7398 000031FB E826FF                   call prlabel
  7399 000031FE 83C402                   add  sp, 2
  7400 00003201 E87BFF                   call stmt
  7401 00003204 FF76F8                   push word [bp-8]
  7402 00003207 E81AFF                   call prlabel
  7403 0000320A 83C402                   add  sp, 2
  7404                                  
  7405                                  ;-904       }
  7406                                  
  7407                                  
  7408                                  ;-905       else prlabel(jdest);
  7409                                  
  7410 0000320D E90900                   jmp .stmt404
  7411                                  .stmt403:
  7412 00003210 FF76FA                   push word [bp-6]
  7413 00003213 E80EFF                   call prlabel
  7414 00003216 83C402                   add  sp, 2
  7415                                  
  7416                                  ;-906   }
  7417                                  
  7418                                  .stmt404:
  7419                                  
  7420                                  ;-907   else if(istoken(T_DO)) {
  7421                                  
  7422 00003219 E95C02                   jmp .stmt405
  7423                                  .stmt402:
  7424 0000321C 680402                   push 516
  7425 0000321F E830DD                   call istoken
  7426 00003222 83C402                   add  sp, 2
  7427 00003225 08C0                     or  al, al
  7428 00003227 0F844A00                 je .stmt406
  7429                                  
  7430                                  ;-908       nlabel++; jdest=nlabel; prlabel(jdest); stmt();
  7431                                  
  7432 0000322B FF06[2900]               inc  word[nlabel]
  7433 0000322F A1[2900]                 mov ax, [nlabel]
  7434 00003232 8946FA                   mov [bp-6], ax
  7435 00003235 FF76FA                   push word [bp-6]
  7436 00003238 E8E9FE                   call prlabel
  7437 0000323B 83C402                   add  sp, 2
  7438 0000323E E83EFF                   call stmt
  7439                                  
  7440                                  ;-909       expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);
  7441                                  
  7442 00003241 680302                   push 515
  7443 00003244 E82DDD                   call expect
  7444 00003247 83C402                   add  sp, 2
  7445 0000324A E845FE                   call pexpr
  7446 0000324D FF06[2900]               inc  word[nlabel]
  7447 00003251 A1[2900]                 mov ax, [nlabel]
  7448 00003254 8946F6                   mov [bp-10], ax
  7449 00003257 FF76F6                   push word [bp-10]
  7450 0000325A E887D2                   call pint1
  7451 0000325D 83C402                   add  sp, 2
  7452                                  
  7453                                  ;-910       prjump(jdest); prlabel(jtemp);
  7454                                  
  7455 00003260 FF76FA                   push word [bp-6]
  7456 00003263 E8EDFE                   call prjump
  7457 00003266 83C402                   add  sp, 2
  7458 00003269 FF76F6                   push word [bp-10]
  7459 0000326C E8B5FE                   call prlabel
  7460 0000326F 83C402                   add  sp, 2
  7461                                  
  7462                                  ;-911   }
  7463                                  
  7464                                  
  7465                                  ;-912   else if(istoken(T_WHILE)) {
  7466                                  
  7467 00003272 E90302                   jmp .stmt407
  7468                                  .stmt406:
  7469 00003275 680302                   push 515
  7470 00003278 E8D7DC                   call istoken
  7471 0000327B 83C402                   add  sp, 2
  7472 0000327E 08C0                     or  al, al
  7473 00003280 0F844100                 je .stmt408
  7474                                  
  7475                                  ;-913       nlabel++; jdest=nlabel;
  7476                                  
  7477 00003284 FF06[2900]               inc  word[nlabel]
  7478 00003288 A1[2900]                 mov ax, [nlabel]
  7479 0000328B 8946FA                   mov [bp-6], ax
  7480                                  
  7481                                  ;-914       prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);
  7482                                  
  7483 0000328E FF76FA                   push word [bp-6]
  7484 00003291 E890FE                   call prlabel
  7485 00003294 83C402                   add  sp, 2
  7486 00003297 E8F8FD                   call pexpr
  7487 0000329A FF06[2900]               inc  word[nlabel]
  7488 0000329E A1[2900]                 mov ax, [nlabel]
  7489 000032A1 8946F8                   mov [bp-8], ax
  7490 000032A4 FF76F8                   push word [bp-8]
  7491 000032A7 E83AD2                   call pint1
  7492 000032AA 83C402                   add  sp, 2
  7493                                  
  7494                                  ;-915       stmt(); prjump(jdest); prlabel(tst);
  7495                                  
  7496 000032AD E8CFFE                   call stmt
  7497 000032B0 FF76FA                   push word [bp-6]
  7498 000032B3 E89DFE                   call prjump
  7499 000032B6 83C402                   add  sp, 2
  7500 000032B9 FF76F8                   push word [bp-8]
  7501 000032BC E865FE                   call prlabel
  7502 000032BF 83C402                   add  sp, 2
  7503                                  
  7504                                  ;-916   }
  7505                                  
  7506                                  
  7507                                  ;-917   else if(istoken(T_GOTO))  {
  7508                                  
  7509 000032C2 E9B301                   jmp .stmt409
  7510                                  .stmt408:
  7511 000032C5 680902                   push 521
  7512 000032C8 E887DC                   call istoken
  7513 000032CB 83C402                   add  sp, 2
  7514 000032CE 08C0                     or  al, al
  7515 000032D0 0F842200                 je .stmt410
  7516                                  
  7517                                  ;-918       prs("\n jmp .");name1();prs(symbol);expect(';');
  7518                                  
  7519 000032D4 68[7A34]                 push stmt_0
  7520 000032D7 E805D1                   call prs
  7521 000032DA 83C402                   add  sp, 2
  7522 000032DD E83FDE                   call name1
  7523 000032E0 8D06606D                 lea  ax, [symbol]
  7524 000032E4 50                       push ax
  7525 000032E5 E8F7D0                   call prs
  7526 000032E8 83C402                   add  sp, 2
  7527 000032EB 6A3B                     push 59
  7528 000032ED E884DC                   call expect
  7529 000032F0 83C402                   add  sp, 2
  7530                                  
  7531                                  ;-919   }
  7532                                  
  7533                                  
  7534                                  ;-920   else if(token==T_ASM)     {
  7535                                  
  7536 000032F3 E98201                   jmp .stmt411
  7537                                  .stmt410:
  7538 000032F6 A1[1E00]                 mov ax, [token]
  7539 000032F9 3D0602                   cmp ax, 518
  7540 000032FC 0F853300                 jne .stmt412
  7541                                  
  7542                                  ;-921       prs("\n"); c=next();
  7543                                  
  7544 00003300 68[8334]                 push stmt_1
  7545 00003303 E8D9D0                   call prs
  7546 00003306 83C402                   add  sp, 2
  7547 00003309 E8CBD4                   call next
  7548 0000330C 8946FE                   mov [bp-2], ax
  7549                                  
  7550                                  ;-922       while(c != '\n') { prc(c);	c=next(); };
  7551                                  
  7552                                  .stmt413:
  7553 0000330F 8B46FE                   mov ax, [bp-2]
  7554 00003312 83F80A                   cmp ax, 10
  7555 00003315 0F841100                 je  .stmt414
  7556 00003319 FF76FE                   push word [bp-2]
  7557 0000331C E867D0                   call prc
  7558 0000331F 83C402                   add  sp, 2
  7559 00003322 E8B2D4                   call next
  7560 00003325 8946FE                   mov [bp-2], ax
  7561 00003328 EBE5                     jmp .stmt413
  7562                                  .stmt414:
  7563                                  
  7564                                  ;-923       token=getlex();
  7565                                  
  7566 0000332A E873D5                   call getlex
  7567 0000332D A3[1E00]                 mov word [token], ax
  7568                                  
  7569                                  ;-924   }
  7570                                  
  7571                                  
  7572                                  ;-925   else if(istoken(T_ASMBLOCK)) {
  7573                                  
  7574 00003330 E94501                   jmp .stmt415
  7575                                  .stmt412:
  7576 00003333 680702                   push 519
  7577 00003336 E819DC                   call istoken
  7578 00003339 83C402                   add  sp, 2
  7579 0000333C 08C0                     or  al, al
  7580 0000333E 0F844B00                 je .stmt416
  7581                                  
  7582                                  ;-926       if (token== '{' )  {
  7583                                  
  7584 00003342 A1[1E00]                 mov ax, [token]
  7585 00003345 83F87B                   cmp ax, 123
  7586 00003348 0F853500                 jne .stmt417
  7587                                  
  7588                                  ;-927           prs("\n"); cha=next();
  7589                                  
  7590 0000334C 68[8634]                 push stmt_2
  7591 0000334F E88DD0                   call prs
  7592 00003352 83C402                   add  sp, 2
  7593 00003355 E87FD4                   call next
  7594 00003358 8846FC                   mov [bp-4], al
  7595                                  
  7596                                  ;-928           while(cha!= '}') {
  7597                                  
  7598                                  .stmt418:
  7599 0000335B 8A46FC                   mov al, [bp-4]
  7600 0000335E 3C7D                     cmp al, 125
  7601 00003360 0F841400                 je  .stmt419
  7602                                  
  7603                                  ;-929               prc(cha);
  7604                                  
  7605 00003364 8A46FC                   mov al, byte [bp-4]
  7606 00003367 B400                     mov ah, 0
  7607 00003369 50                       push ax
  7608 0000336A E819D0                   call prc
  7609 0000336D 83C402                   add  sp, 2
  7610                                  
  7611                                  ;-930               cha=next();
  7612                                  
  7613 00003370 E864D4                   call next
  7614 00003373 8846FC                   mov [bp-4], al
  7615                                  
  7616                                  ;-931           }
  7617                                  
  7618                                  
  7619                                  ;-932           token=getlex();
  7620                                  
  7621 00003376 EBE3                     jmp .stmt418
  7622                                  .stmt419:
  7623 00003378 E825D5                   call getlex
  7624 0000337B A3[1E00]                 mov word [token], ax
  7625                                  
  7626                                  ;-933       } else error1("Curly open expected");
  7627                                  
  7628 0000337E E90900                   jmp .stmt420
  7629                                  .stmt417:
  7630 00003381 68[8934]                 push stmt_3
  7631 00003384 E879D2                   call error1
  7632 00003387 83C402                   add  sp, 2
  7633                                  
  7634                                  ;-934         }
  7635                                  
  7636                                  .stmt420:
  7637                                  
  7638                                  ;-935   else if(istoken(T_EMIT)) {
  7639                                  
  7640 0000338A E9EB00                   jmp .stmt421
  7641                                  .stmt416:
  7642 0000338D 680802                   push 520
  7643 00003390 E8BFDB                   call istoken
  7644 00003393 83C402                   add  sp, 2
  7645 00003396 08C0                     or  al, al
  7646 00003398 0F843E00                 je .stmt422
  7647                                  
  7648                                  ;-936       prs("\n db ");
  7649                                  
  7650 0000339C 68[9D34]                 push stmt_4
  7651 0000339F E83DD0                   call prs
  7652 000033A2 83C402                   add  sp, 2
  7653                                  
  7654                                  ;-937     L1: token=getlex();
  7655                                  
  7656                                  .L1:
  7657 000033A5 E8F8D4                   call getlex
  7658 000033A8 A3[1E00]                 mov word [token], ax
  7659                                  
  7660                                  ;-938       prunsign1(lexval);
  7661                                  
  7662 000033AB FF36[2B00]               push word [lexval]
  7663 000033AF E890D1                   call prunsign1
  7664 000033B2 83C402                   add  sp, 2
  7665                                  
  7666                                  ;-939       token=getlex();
  7667                                  
  7668 000033B5 E8E8D4                   call getlex
  7669 000033B8 A3[1E00]                 mov word [token], ax
  7670                                  
  7671                                  ;-940       if (token== ',') {
  7672                                  
  7673 000033BB A1[1E00]                 mov ax, [token]
  7674 000033BE 83F82C                   cmp ax, 44
  7675 000033C1 0F850A00                 jne .stmt423
  7676                                  
  7677                                  ;-941           prc(',');
  7678                                  
  7679 000033C5 6A2C                     push 44
  7680 000033C7 E8BCCF                   call prc
  7681 000033CA 83C402                   add  sp, 2
  7682                                  
  7683                                  ;-942           goto L1;
  7684                                  
  7685 000033CD EBD6                     jmp .L1
  7686                                  
  7687                                  ;-943       }
  7688                                  
  7689                                  
  7690                                  ;-944       expect(')');
  7691                                  
  7692                                  .stmt423:
  7693 000033CF 6A29                     push 41
  7694 000033D1 E8A0DB                   call expect
  7695 000033D4 83C402                   add  sp, 2
  7696                                  
  7697                                  ;-945   }
  7698                                  
  7699                                  
  7700                                  ;-946   else if(istoken(';'))      { }
  7701                                  
  7702 000033D7 E99E00                   jmp .stmt424
  7703                                  .stmt422:
  7704 000033DA 6A3B                     push 59
  7705 000033DC E873DB                   call istoken
  7706 000033DF 83C402                   add  sp, 2
  7707 000033E2 08C0                     or  al, al
  7708 000033E4 0F840300                 je .stmt425
  7709                                  
  7710                                  ;-947   else if(istoken(T_RETURN)) {
  7711                                  
  7712 000033E8 E98D00                   jmp .stmt426
  7713                                  .stmt425:
  7714 000033EB 680002                   push 512
  7715 000033EE E861DB                   call istoken
  7716 000033F1 83C402                   add  sp, 2
  7717 000033F4 08C0                     or  al, al
  7718 000033F6 0F843500                 je .stmt427
  7719                                  
  7720                                  ;-948         if (token!=';') expr(0);
  7721                                  
  7722 000033FA A1[1E00]                 mov ax, [token]
  7723 000033FD 83F83B                   cmp ax, 59
  7724 00003400 0F840800                 je  .stmt428
  7725 00003404 6A00                     push 0
  7726 00003406 E828F8                   call expr
  7727 00003409 83C402                   add  sp, 2
  7728                                  
  7729                                  ;-949         prs("\n jmp .retn");
  7730                                  
  7731                                  .stmt428:
  7732 0000340C 68[A434]                 push stmt_5
  7733 0000340F E8CDCF                   call prs
  7734 00003412 83C402                   add  sp, 2
  7735                                  
  7736                                  ;-950         prs(fname);
  7737                                  
  7738 00003415 8D06E06D                 lea  ax, [fname]
  7739 00003419 50                       push ax
  7740 0000341A E8C2CF                   call prs
  7741 0000341D 83C402                   add  sp, 2
  7742                                  
  7743                                  ;-951         nreturn++;
  7744                                  
  7745 00003420 FF06[2700]               inc  word[nreturn]
  7746                                  
  7747                                  ;-952         expect(';');
  7748                                  
  7749 00003424 6A3B                     push 59
  7750 00003426 E84BDB                   call expect
  7751 00003429 83C402                   add  sp, 2
  7752                                  
  7753                                  ;-953         }
  7754                                  
  7755                                  
  7756                                  ;-954   else if(thechar==':')      {
  7757                                  
  7758 0000342C E94900                   jmp .stmt429
  7759                                  .stmt427:
  7760 0000342F A0[2200]                 mov al, [thechar]
  7761 00003432 3C3A                     cmp al, 58
  7762 00003434 0F853000                 jne .stmt430
  7763                                  
  7764                                  ;-955         prs("\n."); // Label
  7765                                  
  7766 00003438 68[B134]                 push stmt_6
  7767 0000343B E8A1CF                   call prs
  7768 0000343E 83C402                   add  sp, 2
  7769                                  
  7770                                  ;-956         prs(symbol); prc(':');
  7771                                  
  7772 00003441 8D06606D                 lea  ax, [symbol]
  7773 00003445 50                       push ax
  7774 00003446 E896CF                   call prs
  7775 00003449 83C402                   add  sp, 2
  7776 0000344C 6A3A                     push 58
  7777 0000344E E835CF                   call prc
  7778 00003451 83C402                   add  sp, 2
  7779                                  
  7780                                  ;-957         expect(T_NAME);
  7781                                  
  7782 00003454 680001                   push 256
  7783 00003457 E81ADB                   call expect
  7784 0000345A 83C402                   add  sp, 2
  7785                                  
  7786                                  ;-958         expect(':');
  7787                                  
  7788 0000345D 6A3A                     push 58
  7789 0000345F E812DB                   call expect
  7790 00003462 83C402                   add  sp, 2
  7791                                  
  7792                                  ;-959         }
  7793                                  
  7794                                  
  7795                                  ;-960   else  {expr(0);; expect(';'); }
  7796                                  
  7797 00003465 E91000                   jmp .stmt431
  7798                                  .stmt430:
  7799 00003468 6A00                     push 0
  7800 0000346A E8C4F7                   call expr
  7801 0000346D 83C402                   add  sp, 2
  7802 00003470 6A3B                     push 59
  7803 00003472 E8FFDA                   call expect
  7804 00003475 83C402                   add  sp, 2
  7805                                  
  7806                                  ;-961 }
  7807                                  
  7808                                  .stmt431:
  7809                                  .stmt429:
  7810                                  .stmt426:
  7811                                  .stmt424:
  7812                                  .stmt421:
  7813                                  .stmt415:
  7814                                  .stmt411:
  7815                                  .stmt409:
  7816                                  .stmt407:
  7817                                  .stmt405:
  7818                                  .stmt401:
  7819                                  
  7820                                  ;-962 
  7821                                  
  7822                                  
  7823                                  ;-963 
  7824                                  
  7825                                  
  7826                                  ;-964 int dofunc() { int nloc; int i; int narg;
  7827 00003478 C9                       LEAVE
  7828 00003479 C3                       ret
  7829 0000347A 5C6E206A6D70202E00      stmt_0 db "\n jmp .",0
  7830 00003483 5C6E00                  stmt_1 db "\n",0
  7831 00003486 5C6E00                  stmt_2 db "\n",0
  7832 00003489 4375726C79206F7065-     stmt_3 db "Curly open expected",0
  7833 00003492 6E2065787065637465-
  7834 0000349B 6400               
  7835 0000349D 5C6E2064622000          stmt_4 db "\n db ",0
  7836 000034A4 5C6E206A6D70202E72-     stmt_5 db "\n jmp .retn",0
  7837 000034AD 65746E00           
  7838 000034B1 5C6E2E00                stmt_6 db "\n.",0
  7839                                  ENDP
  7840                                  
  7841                                  dofunc: PROC
  7842                                  
  7843                                  ;-965     cloc=&co;
  7844                                  ;
  7845 000034B5 C8060000                 ENTER  6,0
  7846 000034B9 B8A861                   mov ax, co
  7847 000034BC A3[1800]                 mov word [cloc], ax
  7848                                  
  7849                                  ;-966     checknamelen();
  7850                                  
  7851 000034BF E84DDB                   call checknamelen
  7852                                  
  7853                                  ;-967     strcpy(fname, symbol);
  7854                                  
  7855 000034C2 8D06606D                 lea  ax, [symbol]
  7856 000034C6 50                       push ax
  7857 000034C7 8D06E06D                 lea  ax, [fname]
  7858 000034CB 50                       push ax
  7859 000034CC E85ACD                   call strcpy
  7860 000034CF 83C404                   add  sp, 4
  7861                                  
  7862                                  ;-968     if (checkFunction() ) error1("Function already defined");
  7863                                  
  7864 000034D2 E89EDE                   call checkFunction
  7865 000034D5 08C0                     or  al, al
  7866 000034D7 0F840900                 je .dofunc432
  7867 000034DB 68[2137]                 push dofunc_0
  7868 000034DE E81FD1                   call error1
  7869 000034E1 83C402                   add  sp, 2
  7870                                  
  7871                                  ;-969     if (FTop >= FUNCMAX) error1("Function table full");
  7872                                  
  7873                                  .dofunc432:
  7874 000034E4 A1[3C00]                 mov ax, [FTop]
  7875 000034E7 3D2C01                   cmp ax, 300 ;unsigned : 1
  7876 000034EA 0F8C0900                 jl  .dofunc433
  7877 000034EE 68[3A37]                 push dofunc_1
  7878 000034F1 E80CD1                   call error1
  7879 000034F4 83C402                   add  sp, 2
  7880                                  
  7881                                  ;-970     pt=adrF(FNameField, FTop);
  7882                                  
  7883                                  .dofunc433:
  7884 000034F7 FF36[3C00]               push word [FTop]
  7885 000034FB 8D06798F                 lea  ax, [FNameField]
  7886 000034FF 50                       push ax
  7887 00003500 E8ECD2                   call adrF
  7888 00003503 83C404                   add  sp, 4
  7889 00003506 A3[4200]                 mov word [pt], ax
  7890                                  
  7891                                  ;-971     strcpy(pt, symbol);
  7892                                  
  7893 00003509 8D06606D                 lea  ax, [symbol]
  7894 0000350D 50                       push ax
  7895 0000350E FF36[4200]               push word [pt]
  7896 00003512 E814CD                   call strcpy
  7897 00003515 83C404                   add  sp, 4
  7898                                  
  7899                                  ;-972     FTop++;
  7900                                  
  7901 00003518 FF06[3C00]               inc  word[FTop]
  7902                                  
  7903                                  ;-973 
  7904                                  
  7905                                  
  7906                                  ;-974   prs("\n\n"); prs(symbol); prs(": PROC");
  7907                                  
  7908 0000351C 68[4E37]                 push dofunc_2
  7909 0000351F E8BDCE                   call prs
  7910 00003522 83C402                   add  sp, 2
  7911 00003525 8D06606D                 lea  ax, [symbol]
  7912 00003529 50                       push ax
  7913 0000352A E8B2CE                   call prs
  7914 0000352D 83C402                   add  sp, 2
  7915 00003530 68[5337]                 push dofunc_3
  7916 00003533 E8A9CE                   call prs
  7917 00003536 83C402                   add  sp, 2
  7918                                  
  7919                                  ;-975   expect('('); LTop=LSTART;  i=0;
  7920                                  
  7921 00003539 6A28                     push 40
  7922 0000353B E836DA                   call expect
  7923 0000353E 83C402                   add  sp, 2
  7924 00003541 B8C800                   mov ax, 200
  7925 00003544 A3[3A00]                 mov word [LTop], ax
  7926 00003547 B80000                   mov ax, 0
  7927 0000354A 8946FC                   mov [bp-4], ax
  7928                                  
  7929                                  ;-976   if (istoken(')')==0) { narg=2;
  7930                                  
  7931 0000354D 6A29                     push 41
  7932 0000354F E800DA                   call istoken
  7933 00003552 83C402                   add  sp, 2
  7934 00003555 83F800                   cmp ax, 0
  7935 00003558 0F854600                 jne .dofunc434
  7936 0000355C B80200                   mov ax, 2
  7937 0000355F 8946FA                   mov [bp-6], ax
  7938                                  
  7939                                  ;-977     do { typeName();  addlocal(); narg+=2;
  7940                                  
  7941                                  .dofunc435:
  7942 00003562 E8E2DB                   call typeName
  7943 00003565 E86FDD                   call addlocal
  7944 00003568 8346FA02                 add  word[bp-6], 2
  7945                                  
  7946                                  ;-978          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }
  7947                                  
  7948 0000356C 8B46FA                   mov ax, [bp-6]
  7949 0000356F 8B1E[3A00]               mov bx, [LTop]
  7950 00003573 D1E3                     shl bx, 1
  7951 00003575 89875973                 mov [GData+bx], ax
  7952 00003579 A0[3500]                 mov al, [iswidth]
  7953 0000357C 3C04                     cmp al, 4
  7954 0000357E 0F850400                 jne .dofunc436
  7955 00003582 8346FA02                 add  word[bp-6], 2
  7956                                  .dofunc436:
  7957 00003586 FF06[3A00]               inc  word[LTop]
  7958                                  
  7959                                  ;-979     while (istoken(','));  expect(')'); }
  7960                                  
  7961 0000358A 6A2C                     push 44
  7962 0000358C E8C3D9                   call istoken
  7963 0000358F 83C402                   add  sp, 2
  7964 00003592 08C0                     or  al, al
  7965 00003594 0F840200                 je .dofunc437
  7966 00003598 EBC8                     jmp .dofunc435
  7967                                  .dofunc437:
  7968 0000359A 6A29                     push 41
  7969 0000359C E8D5D9                   call expect
  7970 0000359F 83C402                   add  sp, 2
  7971                                  
  7972                                  ;-980 
  7973                                  
  7974                                  
  7975                                  ;-981   expect('{'); /*body*/
  7976                                  
  7977                                  .dofunc434:
  7978 000035A2 6A7B                     push 123
  7979 000035A4 E8CDD9                   call expect
  7980 000035A7 83C402                   add  sp, 2
  7981                                  
  7982                                  ;-982   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */
  7983                                  
  7984 000035AA B80000                   mov ax, 0
  7985 000035AD 8946FE                   mov [bp-2], ax
  7986 000035B0 B80000                   mov ax, 0
  7987 000035B3 A3[2700]                 mov word [nreturn], ax
  7988 000035B6 B80000                   mov ax, 0
  7989 000035B9 A3[2500]                 mov word [nconst], ax
  7990 000035BC B80000                   mov ax, 0
  7991 000035BF 8946FC                   mov [bp-4], ax
  7992                                  
  7993                                  ;-983   while(isvariable()) {
  7994                                  
  7995                                  .dofunc438:
  7996 000035C2 E8FBDD                   call isvariable
  7997 000035C5 08C0                     or  al, al
  7998 000035C7 0F849200                 je .dofunc439
  7999                                  
  8000                                  ;-984     do {typeName();
  8001                                  
  8002                                  .dofunc440:
  8003 000035CB E879DB                   call typeName
  8004                                  
  8005                                  ;-985         checknamelen();
  8006                                  
  8007 000035CE E83EDA                   call checknamelen
  8008                                  
  8009                                  ;-986         addlocal(); nloc-=2;
  8010                                  
  8011 000035D1 E803DD                   call addlocal
  8012 000035D4 836EFE02                 sub  word[bp-2], 2
  8013                                  
  8014                                  ;-987         if (iswidth == 4) nloc-=2;
  8015                                  
  8016 000035D8 A0[3500]                 mov al, [iswidth]
  8017 000035DB 3C04                     cmp al, 4
  8018 000035DD 0F850400                 jne .dofunc441
  8019 000035E1 836EFE02                 sub  word[bp-2], 2
  8020                                  
  8021                                  ;-988         GData[LTop]=nloc;
  8022                                  
  8023                                  .dofunc441:
  8024 000035E5 8B46FE                   mov ax, [bp-2]
  8025 000035E8 8B1E[3A00]               mov bx, [LTop]
  8026 000035EC D1E3                     shl bx, 1
  8027 000035EE 89875973                 mov [GData+bx], ax
  8028                                  
  8029                                  ;-989         if (istoken('[')){
  8030                                  
  8031 000035F2 6A5B                     push 91
  8032 000035F4 E85BD9                   call istoken
  8033 000035F7 83C402                   add  sp, 2
  8034 000035FA 08C0                     or  al, al
  8035 000035FC 0F843D00                 je .dofunc442
  8036                                  
  8037                                  ;-990             istype='&';GType[LTop]='&';expect(T_CONST);expect(']');
  8038                                  
  8039 00003600 B82600                   mov ax, 38
  8040 00003603 A2[2F00]                 mov byte [istype], al
  8041 00003606 B82600                   mov ax, 38
  8042 00003609 8B1E[3A00]               mov bx, [LTop]
  8043 0000360D 8887A96E                 mov [GType+bx], al
  8044 00003611 680101                   push 257
  8045 00003614 E85DD9                   call expect
  8046 00003617 83C402                   add  sp, 2
  8047 0000361A 6A5D                     push 93
  8048 0000361C E855D9                   call expect
  8049 0000361F 83C402                   add  sp, 2
  8050                                  
  8051                                  ;-991             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc;
  8052                                  
  8053 00003622 8B46FE                   mov ax, [bp-2]
  8054 00003625 2B06[2B00]               sub ax, [lexval]
  8055 00003629 8946FE                   mov [bp-2], ax
  8056 0000362C 8346FE02                 add  word[bp-2], 2
  8057 00003630 8B46FE                   mov ax, [bp-2]
  8058 00003633 8B1E[3A00]               mov bx, [LTop]
  8059 00003637 D1E3                     shl bx, 1
  8060 00003639 89875973                 mov [GData+bx], ax
  8061                                  
  8062                                  ;-992             }
  8063                                  
  8064                                  
  8065                                  ;-993         LTop++;
  8066                                  
  8067                                  .dofunc442:
  8068 0000363D FF06[3A00]               inc  word[LTop]
  8069                                  
  8070                                  ;-994       } while (istoken(',')); expect(';'); }
  8071                                  
  8072 00003641 6A2C                     push 44
  8073 00003643 E80CD9                   call istoken
  8074 00003646 83C402                   add  sp, 2
  8075 00003649 08C0                     or  al, al
  8076 0000364B 0F840300                 je .dofunc443
  8077 0000364F E979FF                   jmp .dofunc440
  8078                                  .dofunc443:
  8079 00003652 6A3B                     push 59
  8080 00003654 E81DD9                   call expect
  8081 00003657 83C402                   add  sp, 2
  8082                                  
  8083                                  ;-995   if (LTop>LSTART){prs(";\n ENTER  ");
  8084                                  
  8085 0000365A E965FF                   jmp .dofunc438
  8086                                  .dofunc439:
  8087 0000365D A1[3A00]                 mov ax, [LTop]
  8088 00003660 3DC800                   cmp ax, 200
  8089 00003663 0F8E2700                 jle .dofunc444
  8090 00003667 68[5A37]                 push dofunc_4
  8091 0000366A E872CD                   call prs
  8092 0000366D 83C402                   add  sp, 2
  8093                                  
  8094                                  ;-996     nloc=mkneg(nloc); prunsign1 (nloc); prs(",0"); }
  8095                                  
  8096 00003670 FF76FE                   push word [bp-2]
  8097 00003673 E82BCA                   call mkneg
  8098 00003676 83C402                   add  sp, 2
  8099 00003679 8946FE                   mov [bp-2], ax
  8100 0000367C FF76FE                   push word [bp-2]
  8101 0000367F E8C0CE                   call prunsign1
  8102 00003682 83C402                   add  sp, 2
  8103 00003685 68[6637]                 push dofunc_5
  8104 00003688 E854CD                   call prs
  8105 0000368B 83C402                   add  sp, 2
  8106                                  
  8107                                  ;-997   while(istoken('}')==0)   stmt();
  8108                                  
  8109                                  .dofunc444:
  8110                                  .dofunc445:
  8111 0000368E 6A7D                     push 125
  8112 00003690 E8BFD8                   call istoken
  8113 00003693 83C402                   add  sp, 2
  8114 00003696 83F800                   cmp ax, 0
  8115 00003699 0F850500                 jne .dofunc446
  8116 0000369D E8DFFA                   call stmt
  8117                                  
  8118                                  ;-998   if (nreturn) {
  8119                                  
  8120 000036A0 EBEC                     jmp .dofunc445
  8121                                  .dofunc446:
  8122 000036A2 A1[2700]                 mov ax, [nreturn]
  8123 000036A5 08C0                     or  al, al
  8124 000036A7 0F841C00                 je .dofunc447
  8125                                  
  8126                                  ;-999         prs("\n .retn");
  8127                                  
  8128 000036AB 68[6937]                 push dofunc_6
  8129 000036AE E82ECD                   call prs
  8130 000036B1 83C402                   add  sp, 2
  8131                                  
  8132                                  ;-1000         prs(fname);
  8133                                  
  8134 000036B4 8D06E06D                 lea  ax, [fname]
  8135 000036B8 50                       push ax
  8136 000036B9 E823CD                   call prs
  8137 000036BC 83C402                   add  sp, 2
  8138                                  
  8139                                  ;-1001         prc(':');
  8140                                  
  8141 000036BF 6A3A                     push 58
  8142 000036C1 E8C2CC                   call prc
  8143 000036C4 83C402                   add  sp, 2
  8144                                  
  8145                                  ;-1002         }
  8146                                  
  8147                                  
  8148                                  ;-1003   if (LTop > LSTART) prs(" LEAVE");
  8149                                  
  8150                                  .dofunc447:
  8151 000036C7 A1[3A00]                 mov ax, [LTop]
  8152 000036CA 3DC800                   cmp ax, 200
  8153 000036CD 0F8E0900                 jle .dofunc448
  8154 000036D1 68[7237]                 push dofunc_7
  8155 000036D4 E808CD                   call prs
  8156 000036D7 83C402                   add  sp, 2
  8157                                  
  8158                                  ;-1004   prs("\n ret");
  8159                                  
  8160                                  .dofunc448:
  8161 000036DA 68[7937]                 push dofunc_8
  8162 000036DD E8FFCC                   call prs
  8163 000036E0 83C402                   add  sp, 2
  8164                                  
  8165                                  ;-1005   *cloc=0; prs(co);
  8166                                  
  8167 000036E3 B80000                   mov ax, 0
  8168 000036E6 8B1E[1800]               mov  bx, [cloc]
  8169 000036EA 8807                     mov  [bx], al
  8170 000036EC 8D06A861                 lea  ax, [co]
  8171 000036F0 50                       push ax
  8172 000036F1 E8EBCC                   call prs
  8173 000036F4 83C402                   add  sp, 2
  8174                                  
  8175                                  ;-1006   maxco1=strlen(co);
  8176                                  
  8177 000036F7 8D06A861                 lea  ax, [co]
  8178 000036FB 50                       push ax
  8179 000036FC E802CB                   call strlen
  8180 000036FF 83C402                   add  sp, 2
  8181 00003702 A3[1600]                 mov word [maxco1], ax
  8182                                  
  8183                                  ;-1007   if (maxco1 > maxco) maxco=maxco1;
  8184                                  
  8185 00003705 A1[1600]                 mov ax, [maxco1]
  8186 00003708 3B06[1400]               cmp ax, [maxco]
  8187 0000370C 0F8E0600                 jle .dofunc449
  8188 00003710 A1[1600]                 mov ax, [maxco1]
  8189 00003713 A3[1400]                 mov word [maxco], ax
  8190                                  
  8191                                  ;-1008   prs("\nENDP");
  8192                                  
  8193                                  .dofunc449:
  8194 00003716 68[8037]                 push dofunc_9
  8195 00003719 E8C3CC                   call prs
  8196 0000371C 83C402                   add  sp, 2
  8197                                  
  8198                                  ;-1009 }
  8199                                  
  8200                                  
  8201                                  ;-1010 
  8202                                  
  8203                                  
  8204                                  ;-1011 char doglobName[IDLENMAX];
  8205 0000371F C9                       LEAVE
  8206 00003720 C3                       ret
  8207 00003721 46756E6374696F6E20-     dofunc_0 db "Function already defined",0
  8208 0000372A 616C72656164792064-
  8209 00003733 6566696E656400     
  8210 0000373A 46756E6374696F6E20-     dofunc_1 db "Function table full",0
  8211 00003743 7461626C652066756C-
  8212 0000374C 6C00               
  8213 0000374E 5C6E5C6E00              dofunc_2 db "\n\n",0
  8214 00003753 3A2050524F4300          dofunc_3 db ": PROC",0
  8215 0000375A 3B5C6E20454E544552-     dofunc_4 db ";\n ENTER  ",0
  8216 00003763 202000             
  8217 00003766 2C3000                  dofunc_5 db ",0",0
  8218 00003769 5C6E202E7265746E00      dofunc_6 db "\n .retn",0
  8219 00003772 204C4541564500          dofunc_7 db " LEAVE",0
  8220 00003779 5C6E2072657400          dofunc_8 db "\n ret",0
  8221 00003780 5C6E454E445000          dofunc_9 db "\nENDP",0
  8222                                  ENDP
  8223                                  section .bss
  8224                                  absolute 41799
  8225 0000A347 <res 0000000F>          doglobName resb 15
  8226                                  section .text
  8227                                  
  8228                                  ;-1012 int doglob() {
  8229                                  
  8230                                  
  8231                                  doglob: PROC
  8232                                  
  8233                                  ;-1013     int i; int j; int isstrarr; isstrarr=0;
  8234                                  ;
  8235 00003787 C8060000                 ENTER  6,0
  8236 0000378B B80000                   mov ax, 0
  8237 0000378E 8946FA                   mov [bp-6], ax
  8238                                  
  8239                                  ;-1014   if (GTop >= LSTART) error1("Global table full");
  8240                                  
  8241 00003791 A1[3800]                 mov ax, [GTop]
  8242 00003794 3DC800                   cmp ax, 200 ;unsigned : 1
  8243 00003797 0F8C0900                 jl  .doglob450
  8244 0000379B 68[C43A]                 push doglob_0
  8245 0000379E E85FCE                   call error1
  8246 000037A1 83C402                   add  sp, 2
  8247                                  
  8248                                  ;-1015   if (iswidth == 0) error1("no VOID as var type");
  8249                                  
  8250                                  .doglob450:
  8251 000037A4 A0[3500]                 mov al, [iswidth]
  8252 000037A7 3C00                     cmp al, 0
  8253 000037A9 0F850900                 jne .doglob451
  8254 000037AD 68[D63A]                 push doglob_1
  8255 000037B0 E84DCE                   call error1
  8256 000037B3 83C402                   add  sp, 2
  8257                                  
  8258                                  ;-1016   checknamelen();
  8259                                  
  8260                                  .doglob451:
  8261 000037B6 E856D8                   call checknamelen
  8262                                  
  8263                                  ;-1017   if (checkName() != 0) error1("Variable already defined");
  8264                                  
  8265 000037B9 E89FD8                   call checkName
  8266 000037BC 3C00                     cmp al, 0
  8267 000037BE 0F840900                 je  .doglob452
  8268 000037C2 68[EA3A]                 push doglob_2
  8269 000037C5 E838CE                   call error1
  8270 000037C8 83C402                   add  sp, 2
  8271                                  
  8272                                  ;-1018   if (istoken('[')) { istype='&';
  8273                                  
  8274                                  .doglob452:
  8275 000037CB 6A5B                     push 91
  8276 000037CD E882D7                   call istoken
  8277 000037D0 83C402                   add  sp, 2
  8278 000037D3 08C0                     or  al, al
  8279 000037D5 0F84E201                 je .doglob453
  8280 000037D9 B82600                   mov ax, 38
  8281 000037DC A2[2F00]                 mov byte [istype], al
  8282                                  
  8283                                  ;-1019     if (istoken(T_CONST)) {
  8284                                  
  8285 000037DF 680101                   push 257
  8286 000037E2 E86DD7                   call istoken
  8287 000037E5 83C402                   add  sp, 2
  8288 000037E8 08C0                     or  al, al
  8289 000037EA 0F84C200                 je .doglob454
  8290                                  
  8291                                  ;-1020       prs("\nsection .bss\nabsolute ");
  8292                                  
  8293 000037EE 68[033B]                 push doglob_3
  8294 000037F1 E8EBCB                   call prs
  8295 000037F4 83C402                   add  sp, 2
  8296                                  
  8297                                  ;-1021       prunsign1(orgData);
  8298                                  
  8299 000037F7 FF36[1200]               push word [orgData]
  8300 000037FB E844CD                   call prunsign1
  8301 000037FE 83C402                   add  sp, 2
  8302                                  
  8303                                  ;-1022       prs("\n"); prs(symbol);
  8304                                  
  8305 00003801 68[1D3B]                 push doglob_4
  8306 00003804 E8D8CB                   call prs
  8307 00003807 83C402                   add  sp, 2
  8308 0000380A 8D06606D                 lea  ax, [symbol]
  8309 0000380E 50                       push ax
  8310 0000380F E8CDCB                   call prs
  8311 00003812 83C402                   add  sp, 2
  8312                                  
  8313                                  ;-1023       if (iswidth==1) prs(" resb ");
  8314                                  
  8315 00003815 A0[3500]                 mov al, [iswidth]
  8316 00003818 3C01                     cmp al, 1
  8317 0000381A 0F850900                 jne .doglob455
  8318 0000381E 68[203B]                 push doglob_5
  8319 00003821 E8BBCB                   call prs
  8320 00003824 83C402                   add  sp, 2
  8321                                  
  8322                                  ;-1024       if (iswidth==2) prs(" resw ");
  8323                                  
  8324                                  .doglob455:
  8325 00003827 A0[3500]                 mov al, [iswidth]
  8326 0000382A 3C02                     cmp al, 2
  8327 0000382C 0F850900                 jne .doglob456
  8328 00003830 68[273B]                 push doglob_6
  8329 00003833 E8A9CB                   call prs
  8330 00003836 83C402                   add  sp, 2
  8331                                  
  8332                                  ;-1025       if (iswidth==4) prs(" resd ");
  8333                                  
  8334                                  .doglob456:
  8335 00003839 A0[3500]                 mov al, [iswidth]
  8336 0000383C 3C04                     cmp al, 4
  8337 0000383E 0F850900                 jne .doglob457
  8338 00003842 68[2E3B]                 push doglob_7
  8339 00003845 E897CB                   call prs
  8340 00003848 83C402                   add  sp, 2
  8341                                  
  8342                                  ;-1026       prunsign1(lexval);
  8343                                  
  8344                                  .doglob457:
  8345 0000384B FF36[2B00]               push word [lexval]
  8346 0000384F E8F0CC                   call prunsign1
  8347 00003852 83C402                   add  sp, 2
  8348                                  
  8349                                  ;-1027       prs("\nsection .text");
  8350                                  
  8351 00003855 68[353B]                 push doglob_8
  8352 00003858 E884CB                   call prs
  8353 0000385B 83C402                   add  sp, 2
  8354                                  
  8355                                  ;-1028       orgData=orgData+lexval;
  8356                                  
  8357 0000385E A1[1200]                 mov ax, [orgData]
  8358 00003861 0306[2B00]               add ax, [lexval]
  8359 00003865 A3[1200]                 mov word [orgData], ax
  8360                                  
  8361                                  ;-1029       if (iswidth==2) orgData=orgData+lexval;
  8362                                  
  8363 00003868 A0[3500]                 mov al, [iswidth]
  8364 0000386B 3C02                     cmp al, 2
  8365 0000386D 0F850A00                 jne .doglob458
  8366 00003871 A1[1200]                 mov ax, [orgData]
  8367 00003874 0306[2B00]               add ax, [lexval]
  8368 00003878 A3[1200]                 mov word [orgData], ax
  8369                                  
  8370                                  ;-1030       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}
  8371                                  
  8372                                  .doglob458:
  8373 0000387B A0[3500]                 mov al, [iswidth]
  8374 0000387E 3C04                     cmp al, 4
  8375 00003880 0F851400                 jne .doglob459
  8376 00003884 A1[2B00]                 mov ax, [lexval]
  8377 00003887 BB0300                   mov bx, 3
  8378 0000388A F7E3                     mul bx
  8379 0000388C 8946FE                   mov [bp-2], ax
  8380 0000388F A1[1200]                 mov ax, [orgData]
  8381 00003892 0346FE                   add ax, [bp-2]
  8382 00003895 A3[1200]                 mov word [orgData], ax
  8383                                  
  8384                                  ;-1031       GData[GTop]=lexval; expect(']');
  8385                                  
  8386                                  .doglob459:
  8387 00003898 A1[2B00]                 mov ax, [lexval]
  8388 0000389B 8B1E[3800]               mov bx, [GTop]
  8389 0000389F D1E3                     shl bx, 1
  8390 000038A1 89875973                 mov [GData+bx], ax
  8391 000038A5 6A5D                     push 93
  8392 000038A7 E8CAD6                   call expect
  8393 000038AA 83C402                   add  sp, 2
  8394                                  
  8395                                  ;-1032     }else { expect(']');
  8396                                  
  8397 000038AD E90801                   jmp .doglob460
  8398                                  .doglob454:
  8399 000038B0 6A5D                     push 93
  8400 000038B2 E8BFD6                   call expect
  8401 000038B5 83C402                   add  sp, 2
  8402                                  
  8403                                  ;-1033       if (iswidth != 1) error1("Only ByteArray allowed");
  8404                                  
  8405 000038B8 A0[3500]                 mov al, [iswidth]
  8406 000038BB 3C01                     cmp al, 1
  8407 000038BD 0F840900                 je  .doglob461
  8408 000038C1 68[453B]                 push doglob_9
  8409 000038C4 E839CD                   call error1
  8410 000038C7 83C402                   add  sp, 2
  8411                                  
  8412                                  ;-1034       prs("\n"); prs(symbol); prs(" db ");
  8413                                  
  8414                                  .doglob461:
  8415 000038CA 68[5C3B]                 push doglob_10
  8416 000038CD E80FCB                   call prs
  8417 000038D0 83C402                   add  sp, 2
  8418 000038D3 8D06606D                 lea  ax, [symbol]
  8419 000038D7 50                       push ax
  8420 000038D8 E804CB                   call prs
  8421 000038DB 83C402                   add  sp, 2
  8422 000038DE 68[5F3B]                 push doglob_11
  8423 000038E1 E8FBCA                   call prs
  8424 000038E4 83C402                   add  sp, 2
  8425                                  
  8426                                  ;-1035       isstrarr=1; strcpy(doglobName, symbol);
  8427                                  
  8428 000038E7 B80100                   mov ax, 1
  8429 000038EA 8946FA                   mov [bp-6], ax
  8430 000038ED 8D06606D                 lea  ax, [symbol]
  8431 000038F1 50                       push ax
  8432 000038F2 8D0647A3                 lea  ax, [doglobName]
  8433 000038F6 50                       push ax
  8434 000038F7 E82FC9                   call strcpy
  8435 000038FA 83C404                   add  sp, 4
  8436                                  
  8437                                  ;-1036       expect('=');
  8438                                  
  8439 000038FD 6A3D                     push 61
  8440 000038FF E872D6                   call expect
  8441 00003902 83C402                   add  sp, 2
  8442                                  
  8443                                  ;-1037       if (istoken(T_STRING)) {
  8444                                  
  8445 00003905 680201                   push 258
  8446 00003908 E847D6                   call istoken
  8447 0000390B 83C402                   add  sp, 2
  8448 0000390E 08C0                     or  al, al
  8449 00003910 0F844200                 je .doglob462
  8450                                  
  8451                                  ;-1038         prc(34); prscomment(symbol); prc(34); prs(",0");
  8452                                  
  8453 00003914 6A22                     push 34
  8454 00003916 E86DCA                   call prc
  8455 00003919 83C402                   add  sp, 2
  8456 0000391C 8D06606D                 lea  ax, [symbol]
  8457 00003920 50                       push ax
  8458 00003921 E88DCA                   call prscomment
  8459 00003924 83C402                   add  sp, 2
  8460 00003927 6A22                     push 34
  8461 00003929 E85ACA                   call prc
  8462 0000392C 83C402                   add  sp, 2
  8463 0000392F 68[643B]                 push doglob_12
  8464 00003932 E8AACA                   call prs
  8465 00003935 83C402                   add  sp, 2
  8466                                  
  8467                                  ;-1039         i=strlen(symbol); GData[GTop]=i; }
  8468                                  
  8469 00003938 8D06606D                 lea  ax, [symbol]
  8470 0000393C 50                       push ax
  8471 0000393D E8C1C8                   call strlen
  8472 00003940 83C402                   add  sp, 2
  8473 00003943 8946FE                   mov [bp-2], ax
  8474 00003946 8B46FE                   mov ax, [bp-2]
  8475 00003949 8B1E[3800]               mov bx, [GTop]
  8476 0000394D D1E3                     shl bx, 1
  8477 0000394F 89875973                 mov [GData+bx], ax
  8478                                  
  8479                                  ;-1040       else if (istoken('{' )) { i=0;
  8480                                  
  8481 00003953 E96200                   jmp .doglob463
  8482                                  .doglob462:
  8483 00003956 6A7B                     push 123
  8484 00003958 E8F7D5                   call istoken
  8485 0000395B 83C402                   add  sp, 2
  8486 0000395E 08C0                     or  al, al
  8487 00003960 0F844B00                 je .doglob464
  8488 00003964 B80000                   mov ax, 0
  8489 00003967 8946FE                   mov [bp-2], ax
  8490                                  
  8491                                  ;-1041         do { if(i) prc(',');
  8492                                  
  8493                                  .doglob465:
  8494 0000396A 8B46FE                   mov ax, [bp-2]
  8495 0000396D 08C0                     or  al, al
  8496 0000396F 0F840800                 je .doglob466
  8497 00003973 6A2C                     push 44
  8498 00003975 E80ECA                   call prc
  8499 00003978 83C402                   add  sp, 2
  8500                                  
  8501                                  ;-1042           expect(T_CONST); prunsign1(lexval); i=1; }
  8502                                  
  8503                                  .doglob466:
  8504 0000397B 680101                   push 257
  8505 0000397E E8F3D5                   call expect
  8506 00003981 83C402                   add  sp, 2
  8507 00003984 FF36[2B00]               push word [lexval]
  8508 00003988 E8B7CB                   call prunsign1
  8509 0000398B 83C402                   add  sp, 2
  8510 0000398E B80100                   mov ax, 1
  8511 00003991 8946FE                   mov [bp-2], ax
  8512                                  
  8513                                  ;-1043         while (istoken(',')); expect('}'); }
  8514                                  
  8515 00003994 6A2C                     push 44
  8516 00003996 E8B9D5                   call istoken
  8517 00003999 83C402                   add  sp, 2
  8518 0000399C 08C0                     or  al, al
  8519 0000399E 0F840200                 je .doglob467
  8520 000039A2 EBC6                     jmp .doglob465
  8521                                  .doglob467:
  8522 000039A4 6A7D                     push 125
  8523 000039A6 E8CBD5                   call expect
  8524 000039A9 83C402                   add  sp, 2
  8525                                  
  8526                                  ;-1044       else error1("String or number array expected");
  8527                                  
  8528 000039AC E90900                   jmp .doglob468
  8529                                  .doglob464:
  8530 000039AF 68[673B]                 push doglob_13
  8531 000039B2 E84BCC                   call error1
  8532 000039B5 83C402                   add  sp, 2
  8533                                  
  8534                                  ;-1045       };
  8535                                  
  8536                                  .doglob468:
  8537                                  .doglob463:
  8538                                  .doglob460:
  8539                                  
  8540                                  ;-1046   }else { //expect('=');
  8541                                  
  8542 000039B8 E99E00                   jmp .doglob469
  8543                                  .doglob453:
  8544                                  
  8545                                  ;-1047     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");
  8546                                  
  8547 000039BB 68[873B]                 push doglob_14
  8548 000039BE E81ECA                   call prs
  8549 000039C1 83C402                   add  sp, 2
  8550 000039C4 8D06606D                 lea  ax, [symbol]
  8551 000039C8 50                       push ax
  8552 000039C9 E813CA                   call prs
  8553 000039CC 83C402                   add  sp, 2
  8554 000039CF A0[2F00]                 mov al, [istype]
  8555 000039D2 3C2A                     cmp al, 42
  8556 000039D4 0F850C00                 jne .doglob470
  8557 000039D8 68[8A3B]                 push doglob_15
  8558 000039DB E801CA                   call prs
  8559 000039DE 83C402                   add  sp, 2
  8560                                  
  8561                                  ;-1048     else {
  8562                                  
  8563 000039E1 E93300                   jmp .doglob471
  8564                                  .doglob470:
  8565                                  
  8566                                  ;-1049       if      (iswidth==1) prs(" db ");
  8567                                  
  8568 000039E4 A0[3500]                 mov al, [iswidth]
  8569 000039E7 3C01                     cmp al, 1
  8570 000039E9 0F850C00                 jne .doglob472
  8571 000039ED 68[8F3B]                 push doglob_16
  8572 000039F0 E8ECC9                   call prs
  8573 000039F3 83C402                   add  sp, 2
  8574                                  
  8575                                  ;-1050       else if (iswidth==2) prs(" dw ");
  8576                                  
  8577 000039F6 E91E00                   jmp .doglob473
  8578                                  .doglob472:
  8579 000039F9 A0[3500]                 mov al, [iswidth]
  8580 000039FC 3C02                     cmp al, 2
  8581 000039FE 0F850C00                 jne .doglob474
  8582 00003A02 68[943B]                 push doglob_17
  8583 00003A05 E8D7C9                   call prs
  8584 00003A08 83C402                   add  sp, 2
  8585                                  
  8586                                  ;-1051       else                 prs(" dd ");
  8587                                  
  8588 00003A0B E90900                   jmp .doglob475
  8589                                  .doglob474:
  8590 00003A0E 68[993B]                 push doglob_18
  8591 00003A11 E8CBC9                   call prs
  8592 00003A14 83C402                   add  sp, 2
  8593                                  
  8594                                  ;-1052     }
  8595                                  
  8596                                  .doglob475:
  8597                                  .doglob473:
  8598                                  
  8599                                  ;-1053     if(istoken('-')) prc('-');
  8600                                  
  8601                                  .doglob471:
  8602 00003A17 6A2D                     push 45
  8603 00003A19 E836D5                   call istoken
  8604 00003A1C 83C402                   add  sp, 2
  8605 00003A1F 08C0                     or  al, al
  8606 00003A21 0F840800                 je .doglob476
  8607 00003A25 6A2D                     push 45
  8608 00003A27 E85CC9                   call prc
  8609 00003A2A 83C402                   add  sp, 2
  8610                                  
  8611                                  ;-1054     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }
  8612                                  
  8613                                  .doglob476:
  8614 00003A2D 6A3D                     push 61
  8615 00003A2F E820D5                   call istoken
  8616 00003A32 83C402                   add  sp, 2
  8617 00003A35 08C0                     or  al, al
  8618 00003A37 0F841600                 je .doglob477
  8619 00003A3B 680101                   push 257
  8620 00003A3E E833D5                   call expect
  8621 00003A41 83C402                   add  sp, 2
  8622 00003A44 FF36[2B00]               push word [lexval]
  8623 00003A48 E8F7CA                   call prunsign1
  8624 00003A4B 83C402                   add  sp, 2
  8625                                  
  8626                                  ;-1055     else prunsign1(0); }
  8627                                  
  8628 00003A4E E90800                   jmp .doglob478
  8629                                  .doglob477:
  8630 00003A51 6A00                     push 0
  8631 00003A53 E8ECCA                   call prunsign1
  8632 00003A56 83C402                   add  sp, 2
  8633                                  .doglob478:
  8634                                  
  8635                                  ;-1056   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;
  8636                                  
  8637                                  .doglob469:
  8638 00003A59 A0[3200]                 mov al, [issign]
  8639 00003A5C 8B1E[3800]               mov bx, [GTop]
  8640 00003A60 88873970                 mov [GSign+bx], al
  8641 00003A64 A0[3500]                 mov al, [iswidth]
  8642 00003A67 8B1E[3800]               mov bx, [GTop]
  8643 00003A6B 8887C971                 mov [GWidth+bx], al
  8644 00003A6F A0[2F00]                 mov al, [istype]
  8645 00003A72 8B1E[3800]               mov bx, [GTop]
  8646 00003A76 8887A96E                 mov [GType+bx], al
  8647                                  
  8648                                  ;-1057   pt=adrF(GNameField, GTop);
  8649                                  
  8650 00003A7A FF36[3800]               push word [GTop]
  8651 00003A7E 8D067976                 lea  ax, [GNameField]
  8652 00003A82 50                       push ax
  8653 00003A83 E869CD                   call adrF
  8654 00003A86 83C404                   add  sp, 4
  8655 00003A89 A3[4200]                 mov word [pt], ax
  8656                                  
  8657                                  ;-1058   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);
  8658                                  
  8659 00003A8C 8B46FA                   mov ax, [bp-6]
  8660 00003A8F 08C0                     or  al, al
  8661 00003A91 0F841200                 je .doglob479
  8662 00003A95 8D0647A3                 lea  ax, [doglobName]
  8663 00003A99 50                       push ax
  8664 00003A9A FF36[4200]               push word [pt]
  8665 00003A9E E888C7                   call strcpy
  8666 00003AA1 83C404                   add  sp, 4
  8667 00003AA4 E90F00                   jmp .doglob480
  8668                                  .doglob479:
  8669 00003AA7 8D06606D                 lea  ax, [symbol]
  8670 00003AAB 50                       push ax
  8671 00003AAC FF36[4200]               push word [pt]
  8672 00003AB0 E876C7                   call strcpy
  8673 00003AB3 83C404                   add  sp, 4
  8674                                  
  8675                                  ;-1059   GTop++; expect(';'); }
  8676                                  
  8677                                  .doglob480:
  8678 00003AB6 FF06[3800]               inc  word[GTop]
  8679 00003ABA 6A3B                     push 59
  8680 00003ABC E8B5D4                   call expect
  8681 00003ABF 83C402                   add  sp, 2
  8682                                  
  8683                                  ;-1060 
  8684                                  
  8685                                  
  8686                                  ;-1061 
  8687                                  
  8688                                  
  8689                                  ;-1062 int dodefine() {
  8690 00003AC2 C9                       LEAVE
  8691 00003AC3 C3                       ret
  8692 00003AC4 476C6F62616C207461-     doglob_0 db "Global table full",0
  8693 00003ACD 626C652066756C6C00 
  8694 00003AD6 6E6F20564F49442061-     doglob_1 db "no VOID as var type",0
  8695 00003ADF 732076617220747970-
  8696 00003AE8 6500               
  8697 00003AEA 5661726961626C6520-     doglob_2 db "Variable already defined",0
  8698 00003AF3 616C72656164792064-
  8699 00003AFC 6566696E656400     
  8700 00003B03 5C6E73656374696F6E-     doglob_3 db "\nsection .bss\nabsolute ",0
  8701 00003B0C 202E6273735C6E6162-
  8702 00003B15 736F6C7574652000   
  8703 00003B1D 5C6E00                  doglob_4 db "\n",0
  8704 00003B20 20726573622000          doglob_5 db " resb ",0
  8705 00003B27 20726573772000          doglob_6 db " resw ",0
  8706 00003B2E 20726573642000          doglob_7 db " resd ",0
  8707 00003B35 5C6E73656374696F6E-     doglob_8 db "\nsection .text",0
  8708 00003B3E 202E7465787400     
  8709 00003B45 4F6E6C792042797465-     doglob_9 db "Only ByteArray allowed",0
  8710 00003B4E 417272617920616C6C-
  8711 00003B57 6F77656400         
  8712 00003B5C 5C6E00                  doglob_10 db "\n",0
  8713 00003B5F 2064622000              doglob_11 db " db ",0
  8714 00003B64 2C3000                  doglob_12 db ",0",0
  8715 00003B67 537472696E67206F72-     doglob_13 db "String or number array expected",0
  8716 00003B70 206E756D6265722061-
  8717 00003B79 727261792065787065-
  8718 00003B82 6374656400         
  8719 00003B87 5C6E00                  doglob_14 db "\n",0
  8720 00003B8A 2064772000              doglob_15 db " dw ",0
  8721 00003B8F 2064622000              doglob_16 db " db ",0
  8722 00003B94 2064772000              doglob_17 db " dw ",0
  8723 00003B99 2064642000              doglob_18 db " dd ",0
  8724                                  ENDP
  8725                                  
  8726                                  dodefine: PROC
  8727                                  
  8728                                  ;-1063     int i; int j; int fdtemp;
  8729                                  
  8730                                  
  8731                                  ;-1064     if (eqstr(symbol, "ORGDATA")) {
  8732                                  ;
  8733 00003B9E C8060000                 ENTER  6,0
  8734 00003BA2 68[703C]                 push dodefine_0
  8735 00003BA5 8D06606D                 lea  ax, [symbol]
  8736 00003BA9 50                       push ax
  8737 00003BAA E8B2C6                   call eqstr
  8738 00003BAD 83C404                   add  sp, 4
  8739 00003BB0 08C0                     or  al, al
  8740 00003BB2 0F841500                 je .dodefine481
  8741                                  
  8742                                  ;-1065         token=getlex();
  8743                                  
  8744 00003BB6 E8E7CC                   call getlex
  8745 00003BB9 A3[1E00]                 mov word [token], ax
  8746                                  
  8747                                  ;-1066         ORGDATAORIG=lexval;
  8748                                  
  8749 00003BBC A1[2B00]                 mov ax, [lexval]
  8750 00003BBF A3[1000]                 mov word [ORGDATAORIG], ax
  8751                                  
  8752                                  ;-1067         orgData=lexval;
  8753                                  
  8754 00003BC2 A1[2B00]                 mov ax, [lexval]
  8755 00003BC5 A3[1200]                 mov word [orgData], ax
  8756                                  
  8757                                  ;-1068         return;
  8758                                  
  8759 00003BC8 E9A300                   jmp .retndodefine
  8760                                  
  8761                                  ;-1069     }
  8762                                  
  8763                                  
  8764                                  ;-1070     expect(T_NAME);
  8765                                  
  8766                                  .dodefine481:
  8767 00003BCB 680001                   push 256
  8768 00003BCE E8A3D3                   call expect
  8769 00003BD1 83C402                   add  sp, 2
  8770                                  
  8771                                  ;-1071     if (token==T_CONST) {
  8772                                  
  8773 00003BD4 A1[1E00]                 mov ax, [token]
  8774 00003BD7 3D0101                   cmp ax, 257
  8775 00003BDA 0F859000                 jne .dodefine482
  8776                                  
  8777                                  ;-1072         if (GTop >= LSTART) error1("global table (define) full");
  8778                                  
  8779 00003BDE A1[3800]                 mov ax, [GTop]
  8780 00003BE1 3DC800                   cmp ax, 200 ;unsigned : 1
  8781 00003BE4 0F8C0900                 jl  .dodefine483
  8782 00003BE8 68[783C]                 push dodefine_1
  8783 00003BEB E812CA                   call error1
  8784 00003BEE 83C402                   add  sp, 2
  8785                                  
  8786                                  ;-1073         i=strlen(symbol);
  8787                                  
  8788                                  .dodefine483:
  8789 00003BF1 8D06606D                 lea  ax, [symbol]
  8790 00003BF5 50                       push ax
  8791 00003BF6 E808C6                   call strlen
  8792 00003BF9 83C402                   add  sp, 2
  8793 00003BFC 8946FE                   mov [bp-2], ax
  8794                                  
  8795                                  ;-1074         if (i>15) error1("Define name longer 15 char");
  8796                                  
  8797 00003BFF 8B46FE                   mov ax, [bp-2]
  8798 00003C02 83F80F                   cmp ax, 15
  8799 00003C05 0F8E0900                 jle .dodefine484
  8800 00003C09 68[933C]                 push dodefine_2
  8801 00003C0C E8F1C9                   call error1
  8802 00003C0F 83C402                   add  sp, 2
  8803                                  
  8804                                  ;-1075         GSign [GTop]='U';
  8805                                  
  8806                                  .dodefine484:
  8807 00003C12 B85500                   mov ax, 85
  8808 00003C15 8B1E[3800]               mov bx, [GTop]
  8809 00003C19 88873970                 mov [GSign+bx], al
  8810                                  
  8811                                  ;-1076         GWidth[GTop]=1;
  8812                                  
  8813 00003C1D B80100                   mov ax, 1
  8814 00003C20 8B1E[3800]               mov bx, [GTop]
  8815 00003C24 8887C971                 mov [GWidth+bx], al
  8816                                  
  8817                                  ;-1077         GType [GTop]='#';
  8818                                  
  8819 00003C28 B82300                   mov ax, 35
  8820 00003C2B 8B1E[3800]               mov bx, [GTop]
  8821 00003C2F 8887A96E                 mov [GType+bx], al
  8822                                  
  8823                                  ;-1078         pt=adrF(GNameField, GTop);
  8824                                  
  8825 00003C33 FF36[3800]               push word [GTop]
  8826 00003C37 8D067976                 lea  ax, [GNameField]
  8827 00003C3B 50                       push ax
  8828 00003C3C E8B0CB                   call adrF
  8829 00003C3F 83C404                   add  sp, 4
  8830 00003C42 A3[4200]                 mov word [pt], ax
  8831                                  
  8832                                  ;-1079         strcpy(pt, symbol);
  8833                                  
  8834 00003C45 8D06606D                 lea  ax, [symbol]
  8835 00003C49 50                       push ax
  8836 00003C4A FF36[4200]               push word [pt]
  8837 00003C4E E8D8C5                   call strcpy
  8838 00003C51 83C404                   add  sp, 4
  8839                                  
  8840                                  ;-1080         GData[GTop]=lexval;
  8841                                  
  8842 00003C54 A1[2B00]                 mov ax, [lexval]
  8843 00003C57 8B1E[3800]               mov bx, [GTop]
  8844 00003C5B D1E3                     shl bx, 1
  8845 00003C5D 89875973                 mov [GData+bx], ax
  8846                                  
  8847                                  ;-1081         expect(T_CONST);
  8848                                  
  8849 00003C61 680101                   push 257
  8850 00003C64 E80DD3                   call expect
  8851 00003C67 83C402                   add  sp, 2
  8852                                  
  8853                                  ;-1082         GTop++;
  8854                                  
  8855 00003C6A FF06[3800]               inc  word[GTop]
  8856                                  
  8857                                  ;-1083     }
  8858                                  
  8859                                  
  8860                                  ;-1084 }
  8861                                  
  8862                                  .dodefine482:
  8863                                  
  8864                                  ;-1085 
  8865                                  
  8866                                  
  8867                                  ;-1086 int parse() {
  8868                                  
  8869 00003C6E C9                       .retndodefine: LEAVE
  8870 00003C6F C3                       ret
  8871 00003C70 4F52474441544100        dodefine_0 db "ORGDATA",0
  8872 00003C78 676C6F62616C207461-     dodefine_1 db "global table (define) full",0
  8873 00003C81 626C65202864656669-
  8874 00003C8A 6E65292066756C6C00 
  8875 00003C93 446566696E65206E61-     dodefine_2 db "Define name longer 15 char",0
  8876 00003C9C 6D65206C6F6E676572-
  8877 00003CA5 203135206368617200 
  8878                                  ENDP
  8879                                  
  8880                                  parse: PROC
  8881                                  
  8882                                  ;-1087     token=getlex();
  8883                                  
  8884 00003CAE E8EFCB                   call getlex
  8885 00003CB1 A3[1E00]                 mov word [token], ax
  8886                                  
  8887                                  ;-1088     do {
  8888                                  
  8889                                  .parse485:
  8890                                  
  8891                                  ;-1089         if (token <= 0) return 1;
  8892                                  
  8893 00003CB4 A1[1E00]                 mov ax, [token]
  8894 00003CB7 83F800                   cmp ax, 0
  8895 00003CBA 0F8F0600                 jg  .parse486
  8896 00003CBE B80100                   mov ax, 1
  8897 00003CC1 E95000                   jmp .retnparse
  8898                                  
  8899                                  ;-1090         if (istoken('#')) {
  8900                                  
  8901                                  .parse486:
  8902 00003CC4 6A23                     push 35
  8903 00003CC6 E889D2                   call istoken
  8904 00003CC9 83C402                   add  sp, 2
  8905 00003CCC 08C0                     or  al, al
  8906 00003CCE 0F842100                 je .parse487
  8907                                  
  8908                                  ;-1091              if (istoken(T_DEFINE))  dodefine();
  8909                                  
  8910 00003CD2 68FF01                   push 511
  8911 00003CD5 E87AD2                   call istoken
  8912 00003CD8 83C402                   add  sp, 2
  8913 00003CDB 08C0                     or  al, al
  8914 00003CDD 0F840600                 je .parse488
  8915 00003CE1 E8BAFE                   call dodefine
  8916                                  
  8917                                  ;-1092              else error1("define expected");
  8918                                  
  8919 00003CE4 E90900                   jmp .parse489
  8920                                  .parse488:
  8921 00003CE7 68[153D]                 push parse_0
  8922 00003CEA E813C9                   call error1
  8923 00003CED 83C402                   add  sp, 2
  8924                                  
  8925                                  ;-1093         }
  8926                                  
  8927                                  .parse489:
  8928                                  
  8929                                  ;-1094     else{
  8930                                  
  8931 00003CF0 E91600                   jmp .parse490
  8932                                  .parse487:
  8933                                  
  8934                                  ;-1095         typeName();
  8935                                  
  8936 00003CF3 E851D4                   call typeName
  8937                                  
  8938                                  ;-1096         if (token=='(') dofunc();
  8939                                  
  8940 00003CF6 A1[1E00]                 mov ax, [token]
  8941 00003CF9 83F828                   cmp ax, 40
  8942 00003CFC 0F850600                 jne .parse491
  8943 00003D00 E8B2F7                   call dofunc
  8944                                  
  8945                                  ;-1097         else doglob(); }
  8946                                  
  8947 00003D03 E90300                   jmp .parse492
  8948                                  .parse491:
  8949 00003D06 E87EFA                   call doglob
  8950                                  .parse492:
  8951                                  
  8952                                  ;-1098     } while(1);
  8953                                  
  8954                                  .parse490:
  8955 00003D09 B80100                   mov ax, 1
  8956 00003D0C 08C0                     or  al, al
  8957 00003D0E 0F840200                 je .parse493
  8958 00003D12 EBA0                     jmp .parse485
  8959                                  .parse493:
  8960                                  
  8961                                  ;-1099 }
  8962                                  
  8963                                  
  8964                                  ;-1100 
  8965                                  
  8966                                  
  8967                                  ;-1101 char *arglen=0x80; char *argv=0x82;
  8968                                  
  8969                                   .retnparse:
  8970 00003D14 C3                       ret
  8971 00003D15 646566696E65206578-     parse_0 db "define expected",0
  8972 00003D1E 70656374656400     
  8973                                  ENDP
  8974 00003D25 8000                    arglen dw 128
  8975 00003D27 8200                    argv dw 130
  8976                                  
  8977                                  ;-1102 int main() {
  8978                                  
  8979                                  
  8980                                  main: PROC
  8981                                  
  8982                                  ;-1103     int arglen1; unsigned int i; char *c;
  8983                                  
  8984                                  
  8985                                  ;-1104     arglen1=*arglen;
  8986                                  ;
  8987 00003D29 C8060000                 ENTER  6,0
  8988 00003D2D 8B1E[253D]               mov bx, [arglen]
  8989 00003D31 8A07                     mov al, [bx]
  8990 00003D33 B400                     mov ah, 0
  8991 00003D35 8946FE                   mov [bp-2], ax
  8992                                  
  8993                                  ;-1105     if (arglen1 == 0) {
  8994                                  
  8995 00003D38 8B46FE                   mov ax, [bp-2]
  8996 00003D3B 83F800                   cmp ax, 0
  8997 00003D3E 0F851C00                 jne .main494
  8998                                  
  8999                                  ;-1106         cputs(Version1);
  9000                                  
  9001 00003D42 8D06[0300]               lea  ax, [Version1]
  9002 00003D46 50                       push ax
  9003 00003D47 E829C3                   call cputs
  9004 00003D4A 83C402                   add  sp, 2
  9005                                  
  9006                                  ;-1107         cputs(" Usage: A.COM in_file[.C]: ");
  9007                                  
  9008 00003D4D 68[C13F]                 push main_0
  9009 00003D50 E820C3                   call cputs
  9010 00003D53 83C402                   add  sp, 2
  9011                                  
  9012                                  ;-1108         exitR(3);
  9013                                  
  9014 00003D56 6A03                     push 3
  9015 00003D58 E88AC3                   call exitR
  9016 00003D5B 83C402                   add  sp, 2
  9017                                  
  9018                                  ;-1109         }
  9019                                  
  9020                                  
  9021                                  ;-1110     i=arglen1+129;
  9022                                  
  9023                                  .main494:
  9024 00003D5E 8B46FE                   mov ax, [bp-2]
  9025 00003D61 058100                   add ax, 129
  9026 00003D64 8946FC                   mov [bp-4], ax
  9027                                  
  9028                                  ;-1111     *i=0;
  9029                                  
  9030 00003D67 B80000                   mov ax, 0
  9031 00003D6A 8B5EFC                   mov  bx, [bp-4]
  9032 00003D6D 8907                     mov  [bx], ax
  9033                                  
  9034                                  ;-1112     arglen1--;
  9035                                  
  9036 00003D6F FF4EFE                   dec  word[bp-2]
  9037                                  
  9038                                  ;-1113     toupper(argv);
  9039                                  
  9040 00003D72 FF36[273D]               push word [argv]
  9041 00003D76 E857C5                   call toupper
  9042 00003D79 83C402                   add  sp, 2
  9043                                  
  9044                                  ;-1114     strcpy(namein, argv);
  9045                                  
  9046 00003D7C FF36[273D]               push word [argv]
  9047 00003D80 8D06236E                 lea  ax, [namein]
  9048 00003D84 50                       push ax
  9049 00003D85 E8A1C4                   call strcpy
  9050 00003D88 83C404                   add  sp, 4
  9051                                  
  9052                                  ;-1115     if (instr1(namein, '.') == 0) strcat1(namein, ".C");
  9053                                  
  9054 00003D8B 6A2E                     push 46
  9055 00003D8D 8D06236E                 lea  ax, [namein]
  9056 00003D91 50                       push ax
  9057 00003D92 E87EC5                   call instr1
  9058 00003D95 83C404                   add  sp, 4
  9059 00003D98 83F800                   cmp ax, 0
  9060 00003D9B 0F850E00                 jne .main495
  9061 00003D9F 68[DD3F]                 push main_1
  9062 00003DA2 8D06236E                 lea  ax, [namein]
  9063 00003DA6 50                       push ax
  9064 00003DA7 E801C5                   call strcat1
  9065 00003DAA 83C404                   add  sp, 4
  9066                                  
  9067                                  ;-1116     strcpy(namelst, namein);
  9068                                  
  9069                                  .main495:
  9070 00003DAD 8D06236E                 lea  ax, [namein]
  9071 00003DB1 50                       push ax
  9072 00003DB2 8D06666E                 lea  ax, [namelst]
  9073 00003DB6 50                       push ax
  9074 00003DB7 E86FC4                   call strcpy
  9075 00003DBA 83C404                   add  sp, 4
  9076                                  
  9077                                  ;-1117     i=strlen(namelst);
  9078                                  
  9079 00003DBD 8D06666E                 lea  ax, [namelst]
  9080 00003DC1 50                       push ax
  9081 00003DC2 E83CC4                   call strlen
  9082 00003DC5 83C402                   add  sp, 2
  9083 00003DC8 8946FC                   mov [bp-4], ax
  9084                                  
  9085                                  ;-1118     i--;
  9086                                  
  9087 00003DCB FF4EFC                   dec  word[bp-4]
  9088                                  
  9089                                  ;-1119     c=&namelst+i;
  9090                                  
  9091 00003DCE B8666E                   mov ax, namelst
  9092 00003DD1 0346FC                   add ax, [bp-4]
  9093 00003DD4 8946FA                   mov [bp-6], ax
  9094                                  
  9095                                  ;-1120     *c='S';
  9096                                  
  9097 00003DD7 B85300                   mov ax, 83
  9098 00003DDA 8B5EFA                   mov  bx, [bp-6]
  9099 00003DDD 8807                     mov  [bx], al
  9100                                  
  9101                                  ;-1121 
  9102                                  
  9103                                  
  9104                                  ;-1122     fdin=openR (namein);
  9105                                  
  9106 00003DDF 8D06236E                 lea  ax, [namein]
  9107 00003DE3 50                       push ax
  9108 00003DE4 E8CEC2                   call openR
  9109 00003DE7 83C402                   add  sp, 2
  9110 00003DEA A3[1A00]                 mov word [fdin], ax
  9111                                  
  9112                                  ;-1123     if(DOS_ERR){
  9113                                  
  9114 00003DED A1[4600]                 mov ax, [DOS_ERR]
  9115 00003DF0 08C0                     or  al, al
  9116 00003DF2 0F841C00                 je .main496
  9117                                  
  9118                                  ;-1124         cputs("Source file missing (.C): ");
  9119                                  
  9120 00003DF6 68[E03F]                 push main_2
  9121 00003DF9 E877C2                   call cputs
  9122 00003DFC 83C402                   add  sp, 2
  9123                                  
  9124                                  ;-1125         cputs(namein);
  9125                                  
  9126 00003DFF 8D06236E                 lea  ax, [namein]
  9127 00003E03 50                       push ax
  9128 00003E04 E86CC2                   call cputs
  9129 00003E07 83C402                   add  sp, 2
  9130                                  
  9131                                  ;-1126         exitR(1);
  9132                                  
  9133 00003E0A 6A01                     push 1
  9134 00003E0C E8D6C2                   call exitR
  9135 00003E0F 83C402                   add  sp, 2
  9136                                  
  9137                                  ;-1127         }
  9138                                  
  9139                                  
  9140                                  ;-1128     fdout=creatR(namelst);
  9141                                  
  9142                                  .main496:
  9143 00003E12 8D06666E                 lea  ax, [namelst]
  9144 00003E16 50                       push ax
  9145 00003E17 E8AAC2                   call creatR
  9146 00003E1A 83C402                   add  sp, 2
  9147 00003E1D A3[1C00]                 mov word [fdout], ax
  9148                                  
  9149                                  ;-1129     if(DOS_ERR){
  9150                                  
  9151 00003E20 A1[4600]                 mov ax, [DOS_ERR]
  9152 00003E23 08C0                     or  al, al
  9153 00003E25 0F841C00                 je .main497
  9154                                  
  9155                                  ;-1130         cputs("list file not creatable: ");
  9156                                  
  9157 00003E29 68[FB3F]                 push main_3
  9158 00003E2C E844C2                   call cputs
  9159 00003E2F 83C402                   add  sp, 2
  9160                                  
  9161                                  ;-1131         cputs(namelst);
  9162                                  
  9163 00003E32 8D06666E                 lea  ax, [namelst]
  9164 00003E36 50                       push ax
  9165 00003E37 E839C2                   call cputs
  9166 00003E3A 83C402                   add  sp, 2
  9167                                  
  9168                                  ;-1132         exitR(2);
  9169                                  
  9170 00003E3D 6A02                     push 2
  9171 00003E3F E8A3C2                   call exitR
  9172 00003E42 83C402                   add  sp, 2
  9173                                  
  9174                                  ;-1133         }
  9175                                  
  9176                                  
  9177                                  ;-1134     prs("\n; ");
  9178                                  
  9179                                  .main497:
  9180 00003E45 68[1540]                 push main_4
  9181 00003E48 E894C5                   call prs
  9182 00003E4B 83C402                   add  sp, 2
  9183                                  
  9184                                  ;-1135     prs(Version1);
  9185                                  
  9186 00003E4E 8D06[0300]               lea  ax, [Version1]
  9187 00003E52 50                       push ax
  9188 00003E53 E889C5                   call prs
  9189 00003E56 83C402                   add  sp, 2
  9190                                  
  9191                                  ;-1136     prs(", Source: "); prs(namein);
  9192                                  
  9193 00003E59 68[1A40]                 push main_5
  9194 00003E5C E880C5                   call prs
  9195 00003E5F 83C402                   add  sp, 2
  9196 00003E62 8D06236E                 lea  ax, [namein]
  9197 00003E66 50                       push ax
  9198 00003E67 E875C5                   call prs
  9199 00003E6A 83C402                   add  sp, 2
  9200                                  
  9201                                  ;-1137     prs(", Output asm: "); prs(namelst);
  9202                                  
  9203 00003E6D 68[2540]                 push main_6
  9204 00003E70 E86CC5                   call prs
  9205 00003E73 83C402                   add  sp, 2
  9206 00003E76 8D06666E                 lea  ax, [namelst]
  9207 00003E7A 50                       push ax
  9208 00003E7B E861C5                   call prs
  9209 00003E7E 83C402                   add  sp, 2
  9210                                  
  9211                                  ;-1138     prs("\norg  256 \njmp main");
  9212                                  
  9213 00003E81 68[3440]                 push main_7
  9214 00003E84 E858C5                   call prs
  9215 00003E87 83C402                   add  sp, 2
  9216                                  
  9217                                  ;-1139     orgData=ORGDATAORIG;
  9218                                  
  9219 00003E8A A1[1000]                 mov ax, [ORGDATAORIG]
  9220 00003E8D A3[1200]                 mov word [orgData], ax
  9221                                  
  9222                                  ;-1140     fgetsp=&fgetsdest;
  9223                                  
  9224 00003E90 B839A2                   mov ax, fgetsdest
  9225 00003E93 A3[3E00]                 mov word [fgetsp], ax
  9226                                  
  9227                                  ;-1141     *fgetsp=0;
  9228                                  
  9229 00003E96 B80000                   mov ax, 0
  9230 00003E99 8B1E[3E00]               mov  bx, [fgetsp]
  9231 00003E9D 8807                     mov  [bx], al
  9232                                  
  9233                                  ;-1142     thechar=fgets1();
  9234                                  
  9235 00003E9F E8E3C8                   call fgets1
  9236 00003EA2 A2[2200]                 mov byte [thechar], al
  9237                                  
  9238                                  ;-1143     parse();
  9239                                  
  9240 00003EA5 E806FE                   call parse
  9241                                  
  9242                                  ;-1144     prs("\n;Input: "); prs(namein);
  9243                                  
  9244 00003EA8 68[4A40]                 push main_8
  9245 00003EAB E831C5                   call prs
  9246 00003EAE 83C402                   add  sp, 2
  9247 00003EB1 8D06236E                 lea  ax, [namein]
  9248 00003EB5 50                       push ax
  9249 00003EB6 E826C5                   call prs
  9250 00003EB9 83C402                   add  sp, 2
  9251                                  
  9252                                  ;-1145     prs(", List: ");   prs(namelst);
  9253                                  
  9254 00003EBC 68[5540]                 push main_9
  9255 00003EBF E81DC5                   call prs
  9256 00003EC2 83C402                   add  sp, 2
  9257 00003EC5 8D06666E                 lea  ax, [namelst]
  9258 00003EC9 50                       push ax
  9259 00003ECA E812C5                   call prs
  9260 00003ECD 83C402                   add  sp, 2
  9261                                  
  9262                                  ;-1146     prs(", Lines: "); prunsign1(lineno);
  9263                                  
  9264 00003ED0 68[5E40]                 push main_10
  9265 00003ED3 E809C5                   call prs
  9266 00003ED6 83C402                   add  sp, 2
  9267 00003ED9 FF36[4000]               push word [lineno]
  9268 00003EDD E862C6                   call prunsign1
  9269 00003EE0 83C402                   add  sp, 2
  9270                                  
  9271                                  ;-1147     prs("\n;Glob. variables: "); GTop--; prunsign1(GTop);
  9272                                  
  9273 00003EE3 68[6840]                 push main_11
  9274 00003EE6 E8F6C4                   call prs
  9275 00003EE9 83C402                   add  sp, 2
  9276 00003EEC FF0E[3800]               dec  word[GTop]
  9277 00003EF0 FF36[3800]               push word [GTop]
  9278 00003EF4 E84BC6                   call prunsign1
  9279 00003EF7 83C402                   add  sp, 2
  9280                                  
  9281                                  ;-1148     prs(" ("); prunsign1(LSTART);
  9282                                  
  9283 00003EFA 68[7D40]                 push main_12
  9284 00003EFD E8DFC4                   call prs
  9285 00003F00 83C402                   add  sp, 2
  9286 00003F03 68C800                   push 200
  9287 00003F06 E839C6                   call prunsign1
  9288 00003F09 83C402                   add  sp, 2
  9289                                  
  9290                                  ;-1149     prs("), Functions: "); prunsign1(FTop);
  9291                                  
  9292 00003F0C 68[8040]                 push main_13
  9293 00003F0F E8CDC4                   call prs
  9294 00003F12 83C402                   add  sp, 2
  9295 00003F15 FF36[3C00]               push word [FTop]
  9296 00003F19 E826C6                   call prunsign1
  9297 00003F1C 83C402                   add  sp, 2
  9298                                  
  9299                                  ;-1150     prs(" ("); prunsign1(FUNCMAX);
  9300                                  
  9301 00003F1F 68[8F40]                 push main_14
  9302 00003F22 E8BAC4                   call prs
  9303 00003F25 83C402                   add  sp, 2
  9304 00003F28 682C01                   push 300
  9305 00003F2B E814C6                   call prunsign1
  9306 00003F2E 83C402                   add  sp, 2
  9307                                  
  9308                                  ;-1151     prs(")\n;Constant: ");   prunsign1(maxco);
  9309                                  
  9310 00003F31 68[9240]                 push main_15
  9311 00003F34 E8A8C4                   call prs
  9312 00003F37 83C402                   add  sp, 2
  9313 00003F3A FF36[1400]               push word [maxco]
  9314 00003F3E E801C6                   call prunsign1
  9315 00003F41 83C402                   add  sp, 2
  9316                                  
  9317                                  ;-1152     prs(" ("); prunsign1(COMAX);
  9318                                  
  9319 00003F44 68[A140]                 push main_16
  9320 00003F47 E895C4                   call prs
  9321 00003F4A 83C402                   add  sp, 2
  9322 00003F4D 68B80B                   push 3000
  9323 00003F50 E8EFC5                   call prunsign1
  9324 00003F53 83C402                   add  sp, 2
  9325                                  
  9326                                  ;-1153     i=COMAX; i=i-maxco;
  9327                                  
  9328 00003F56 B8B80B                   mov ax, 3000
  9329 00003F59 8946FC                   mov [bp-4], ax
  9330 00003F5C 8B46FC                   mov ax, [bp-4]
  9331 00003F5F 2B06[1400]               sub ax, [maxco]
  9332 00003F63 8946FC                   mov [bp-4], ax
  9333                                  
  9334                                  ;-1154     if (i <= 1000)prs("\n *** Warning *** constant area too small");
  9335                                  
  9336 00003F66 8B46FC                   mov ax, [bp-4]
  9337 00003F69 3DE803                   cmp ax, 1000
  9338 00003F6C 0F870900                 ja  .main498
  9339 00003F70 68[A440]                 push main_17
  9340 00003F73 E869C4                   call prs
  9341 00003F76 83C402                   add  sp, 2
  9342                                  
  9343                                  ;-1155     prs("), stacksize: ");
  9344                                  
  9345                                  .main498:
  9346 00003F79 68[CF40]                 push main_18
  9347 00003F7C E860C4                   call prs
  9348 00003F7F 83C402                   add  sp, 2
  9349                                  
  9350                                  ;-1156     i=65636; i=i-orgData;
  9351                                  
  9352 00003F82 B86400                   mov ax, 100
  9353 00003F85 8946FC                   mov [bp-4], ax
  9354 00003F88 8B46FC                   mov ax, [bp-4]
  9355 00003F8B 2B06[1200]               sub ax, [orgData]
  9356 00003F8F 8946FC                   mov [bp-4], ax
  9357                                  
  9358                                  ;-1157     prunsign1(i);
  9359                                  
  9360 00003F92 FF76FC                   push word [bp-4]
  9361 00003F95 E8AAC5                   call prunsign1
  9362 00003F98 83C402                   add  sp, 2
  9363                                  
  9364                                  ;-1158     if (i <= 1000) prs("\n *** Warning *** Stack too small");
  9365                                  
  9366 00003F9B 8B46FC                   mov ax, [bp-4]
  9367 00003F9E 3DE803                   cmp ax, 1000
  9368 00003FA1 0F870900                 ja  .main499
  9369 00003FA5 68[DE40]                 push main_19
  9370 00003FA8 E834C4                   call prs
  9371 00003FAB 83C402                   add  sp, 2
  9372                                  
  9373                                  ;-1159     prs("          ");
  9374                                  
  9375                                  .main499:
  9376 00003FAE 68[0141]                 push main_20
  9377 00003FB1 E82BC4                   call prs
  9378 00003FB4 83C402                   add  sp, 2
  9379                                  
  9380                                  ;-1160     end1(0);
  9381                                  
  9382 00003FB7 6A00                     push 0
  9383 00003FB9 E821C6                   call end1
  9384 00003FBC 83C402                   add  sp, 2
  9385                                  
  9386                                  ;-1161 }
  9387 00003FBF C9                       LEAVE
  9388 00003FC0 C3                       ret
  9389 00003FC1 2055736167653A2041-     main_0 db " Usage: A.COM in_file[.C]: ",0
  9390 00003FCA 2E434F4D20696E5F66-
  9391 00003FD3 696C655B2E435D3A20-
  9392 00003FDC 00                 
  9393 00003FDD 2E4300                  main_1 db ".C",0
  9394 00003FE0 536F75726365206669-     main_2 db "Source file missing (.C): ",0
  9395 00003FE9 6C65206D697373696E-
  9396 00003FF2 6720282E43293A2000 
  9397 00003FFB 6C6973742066696C65-     main_3 db "list file not creatable: ",0
  9398 00004004 206E6F742063726561-
  9399 0000400D 7461626C653A2000   
  9400 00004015 5C6E3B2000              main_4 db "\n; ",0
  9401 0000401A 2C20536F757263653A-     main_5 db ", Source: ",0
  9402 00004023 2000               
  9403 00004025 2C204F757470757420-     main_6 db ", Output asm: ",0
  9404 0000402E 61736D3A2000       
  9405 00004034 5C6E6F726720203235-     main_7 db "\norg  256 \njmp main",0
  9406 0000403D 36205C6E6A6D70206D-
  9407 00004046 61696E00           
  9408 0000404A 5C6E3B496E7075743A-     main_8 db "\n;Input: ",0
  9409 00004053 2000               
  9410 00004055 2C204C6973743A2000      main_9 db ", List: ",0
  9411 0000405E 2C204C696E65733A20-     main_10 db ", Lines: ",0
  9412 00004067 00                 
  9413 00004068 5C6E3B476C6F622E20-     main_11 db "\n;Glob. variables: ",0
  9414 00004071 7661726961626C6573-
  9415 0000407A 3A2000             
  9416 0000407D 202800                  main_12 db " (",0
  9417 00004080 292C2046756E637469-     main_13 db "), Functions: ",0
  9418 00004089 6F6E733A2000       
  9419 0000408F 202800                  main_14 db " (",0
  9420 00004092 295C6E3B436F6E7374-     main_15 db ")\n;Constant: ",0
  9421 0000409B 616E743A2000       
  9422 000040A1 202800                  main_16 db " (",0
  9423 000040A4 5C6E202A2A2A205761-     main_17 db "\n *** Warning *** constant area too small",0
  9424 000040AD 726E696E67202A2A2A-
  9425 000040B6 20636F6E7374616E74-
  9426 000040BF 206172656120746F6F-
  9427 000040C8 20736D616C6C00     
  9428 000040CF 292C20737461636B73-     main_18 db "), stacksize: ",0
  9429 000040D8 697A653A2000       
  9430 000040DE 5C6E202A2A2A205761-     main_19 db "\n *** Warning *** Stack too small",0
  9431 000040E7 726E696E67202A2A2A-
  9432 000040F0 20537461636B20746F-
  9433 000040F9 6F20736D616C6C00   
  9434 00004101 202020202020202020-     main_20 db "          ",0
  9435 0000410A 2000               
  9436                                  ENDP
  9437                                  ;Input: A.C, List: A.S, Lines: 1162
  9438                                  ;Glob. variables: 100 (200), Functions: 77 (300)
  9439                                  ;Constant: 712 (3000), stacksize: 23822          
