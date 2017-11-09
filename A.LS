     1                                  
     2                                  ; A.COM V0.9.3, Source: A.C, Output asm: A.S
     3                                  org  256 
     4 00000000 E9B83C                  jmp main
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
  1238                                  ;-215 
  1239                                  
  1240                                  
  1241                                  ;-216 int eprnum(int n){//for docall1 procedure
  1242 00000471 C9                       LEAVE
  1243 00000472 C3                       ret
  1244                                  ENDP
  1245                                  
  1246                                  eprnum: PROC
  1247                                  
  1248                                  ;-217     int e;
  1249                                  
  1250                                  
  1251                                  ;-218     if(n<0) {
  1252                                  ;
  1253 00000473 C8020000                 ENTER  2,0
  1254 00000477 8B4604                   mov ax, [bp+4]
  1255 0000047A 83F800                   cmp ax, 0
  1256 0000047D 0F8D1400                 jge .eprnum47
  1257                                  
  1258                                  ;-219         eprc('-');
  1259                                  
  1260 00000481 6A2D                     push 45
  1261 00000483 E8BFFE                   call eprc
  1262 00000486 83C402                   add  sp, 2
  1263                                  
  1264                                  ;-220         n=mkneg(n);
  1265                                  
  1266 00000489 FF7604                   push word [bp+4]
  1267 0000048C E812FC                   call mkneg
  1268 0000048F 83C402                   add  sp, 2
  1269 00000492 894604                   mov [bp+4], ax
  1270                                  
  1271                                  ;-221     }
  1272                                  
  1273                                  
  1274                                  ;-222     if (n >= 10) {
  1275                                  
  1276                                  .eprnum47:
  1277 00000495 8B4604                   mov ax, [bp+4]
  1278 00000498 83F80A                   cmp ax, 10 ;unsigned : 1
  1279 0000049B 0F8C1500                 jl  .eprnum48
  1280                                  
  1281                                  ;-223         e=n/10;
  1282                                  
  1283 0000049F 8B4604                   mov ax, [bp+4]
  1284 000004A2 BB0A00                   mov bx, 10
  1285 000004A5 99                       cwd
  1286 000004A6 F7FB                     idiv bx
  1287 000004A8 8946FE                   mov [bp-2], ax
  1288                                  
  1289                                  ;-224         eprnum(e);
  1290                                  
  1291 000004AB FF76FE                   push word [bp-2]
  1292 000004AE E8C2FF                   call eprnum
  1293 000004B1 83C402                   add  sp, 2
  1294                                  
  1295                                  ;-225     }
  1296                                  
  1297                                  
  1298                                  ;-226     n=n%10;
  1299                                  
  1300                                  .eprnum48:
  1301 000004B4 8B4604                   mov ax, [bp+4]
  1302 000004B7 BB0A00                   mov bx, 10
  1303 000004BA 99                       cwd
  1304 000004BB F7FB                     idiv bx
  1305 000004BD 89D0                     mov ax, dx
  1306 000004BF 894604                   mov [bp+4], ax
  1307                                  
  1308                                  ;-227     n=n+'0';
  1309                                  
  1310 000004C2 8B4604                   mov ax, [bp+4]
  1311 000004C5 83C030                   add ax, 48
  1312 000004C8 894604                   mov [bp+4], ax
  1313                                  
  1314                                  ;-228     eprc(n);
  1315                                  
  1316 000004CB FF7604                   push word [bp+4]
  1317 000004CE E874FE                   call eprc
  1318 000004D1 83C402                   add  sp, 2
  1319                                  
  1320                                  ;-229 }
  1321                                  
  1322                                  
  1323                                  ;-230 int pint1 (int n){
  1324 000004D4 C9                       LEAVE
  1325 000004D5 C3                       ret
  1326                                  ENDP
  1327                                  
  1328                                  pint1: PROC
  1329                                  
  1330                                  ;-231     int e;
  1331                                  
  1332                                  
  1333                                  ;-232     if(n<0) {  prc('-');  n=mkneg(n); }
  1334                                  ;
  1335 000004D6 C8020000                 ENTER  2,0
  1336 000004DA 8B4604                   mov ax, [bp+4]
  1337 000004DD 83F800                   cmp ax, 0
  1338 000004E0 0F8D1400                 jge .pint149
  1339 000004E4 6A2D                     push 45
  1340 000004E6 E89DFE                   call prc
  1341 000004E9 83C402                   add  sp, 2
  1342 000004EC FF7604                   push word [bp+4]
  1343 000004EF E8AFFB                   call mkneg
  1344 000004F2 83C402                   add  sp, 2
  1345 000004F5 894604                   mov [bp+4], ax
  1346                                  
  1347                                  ;-233     if (n >= 10) {
  1348                                  
  1349                                  .pint149:
  1350 000004F8 8B4604                   mov ax, [bp+4]
  1351 000004FB 83F80A                   cmp ax, 10 ;unsigned : 1
  1352 000004FE 0F8C1500                 jl  .pint150
  1353                                  
  1354                                  ;-234         e=n/10;
  1355                                  
  1356 00000502 8B4604                   mov ax, [bp+4]
  1357 00000505 BB0A00                   mov bx, 10
  1358 00000508 99                       cwd
  1359 00000509 F7FB                     idiv bx
  1360 0000050B 8946FE                   mov [bp-2], ax
  1361                                  
  1362                                  ;-235         pint1(e);
  1363                                  
  1364 0000050E FF76FE                   push word [bp-2]
  1365 00000511 E8C2FF                   call pint1
  1366 00000514 83C402                   add  sp, 2
  1367                                  
  1368                                  ;-236     }
  1369                                  
  1370                                  
  1371                                  ;-237     n=n%10;
  1372                                  
  1373                                  .pint150:
  1374 00000517 8B4604                   mov ax, [bp+4]
  1375 0000051A BB0A00                   mov bx, 10
  1376 0000051D 99                       cwd
  1377 0000051E F7FB                     idiv bx
  1378 00000520 89D0                     mov ax, dx
  1379 00000522 894604                   mov [bp+4], ax
  1380                                  
  1381                                  ;-238     n += '0';
  1382                                  
  1383 00000525 83460430                 add  word[bp+4], 48
  1384                                  
  1385                                  ;-239     prc(n);
  1386                                  
  1387 00000529 FF7604                   push word [bp+4]
  1388 0000052C E857FE                   call prc
  1389 0000052F 83C402                   add  sp, 2
  1390                                  
  1391                                  ;-240 }
  1392                                  
  1393                                  
  1394                                  ;-241 int prunsign1(unsigned int n) {
  1395 00000532 C9                       LEAVE
  1396 00000533 C3                       ret
  1397                                  ENDP
  1398                                  
  1399                                  prunsign1: PROC
  1400                                  
  1401                                  ;-242     unsigned int e;
  1402                                  
  1403                                  
  1404                                  ;-243     if (n >= 10) {
  1405                                  ;
  1406 00000534 C8020000                 ENTER  2,0
  1407 00000538 8B4604                   mov ax, [bp+4]
  1408 0000053B 83F80A                   cmp ax, 10 ;unsigned : 0
  1409 0000053E 0F821700                 jb  .prunsign151
  1410                                  
  1411                                  ;-244         e=n/10;
  1412                                  
  1413 00000542 8B4604                   mov ax, [bp+4]
  1414 00000545 BB0A00                   mov bx, 10
  1415 00000548 BA0000                   mov dx, 0
  1416 0000054B F7F3                     div bx
  1417 0000054D 8946FE                   mov [bp-2], ax
  1418                                  
  1419                                  ;-245         prunsign1(e);
  1420                                  
  1421 00000550 FF76FE                   push word [bp-2]
  1422 00000553 E8DEFF                   call prunsign1
  1423 00000556 83C402                   add  sp, 2
  1424                                  
  1425                                  ;-246     }
  1426                                  
  1427                                  
  1428                                  ;-247     n = n % 10; /*unsigned mod*/
  1429                                  
  1430                                  .prunsign151:
  1431 00000559 8B4604                   mov ax, [bp+4]
  1432 0000055C BB0A00                   mov bx, 10
  1433 0000055F BA0000                   mov dx, 0
  1434 00000562 F7F3                     div bx
  1435 00000564 89D0                     mov ax, dx
  1436 00000566 894604                   mov [bp+4], ax
  1437                                  
  1438                                  ;-248     n += '0';
  1439                                  
  1440 00000569 83460430                 add  word[bp+4], 48
  1441                                  
  1442                                  ;-249     prc(n);
  1443                                  
  1444 0000056D FF7604                   push word [bp+4]
  1445 00000570 E813FE                   call prc
  1446 00000573 83C402                   add  sp, 2
  1447                                  
  1448                                  ;-250 }
  1449                                  
  1450                                  
  1451                                  ;-251 
  1452                                  
  1453                                  
  1454                                  ;-252 int end1(int n) {
  1455 00000576 C9                       LEAVE
  1456 00000577 C3                       ret
  1457                                  ENDP
  1458                                  
  1459                                  end1: PROC
  1460                                  
  1461                                  ;-253     fcloseR(fdin);
  1462                                  ;
  1463 00000578 C8000000                 ENTER  0,0
  1464 0000057C FF36[1A00]               push word [fdin]
  1465 00000580 E853FB                   call fcloseR
  1466 00000583 83C402                   add  sp, 2
  1467                                  
  1468                                  ;-254     fcloseR(fdout);
  1469                                  
  1470 00000586 FF36[1C00]               push word [fdout]
  1471 0000058A E849FB                   call fcloseR
  1472 0000058D 83C402                   add  sp, 2
  1473                                  
  1474                                  ;-255     exitR(n);
  1475                                  
  1476 00000590 FF7604                   push word [bp+4]
  1477 00000593 E84FFB                   call exitR
  1478 00000596 83C402                   add  sp, 2
  1479                                  
  1480                                  ;-256 }
  1481                                  
  1482                                  
  1483                                  ;-257 
  1484                                  
  1485                                  
  1486                                  ;-258 int error1(char *s) {
  1487 00000599 C9                       LEAVE
  1488 0000059A C3                       ret
  1489                                  ENDP
  1490                                  
  1491                                  error1: PROC
  1492                                  
  1493                                  ;-259     lineno--;
  1494                                  ;
  1495 0000059B C8000000                 ENTER  0,0
  1496 0000059F FF0E[4000]               dec  word[lineno]
  1497                                  
  1498                                  ;-260     prs("\n ");
  1499                                  
  1500 000005A3 68[2006]                 push error1_0
  1501 000005A6 E836FE                   call prs
  1502 000005A9 83C402                   add  sp, 2
  1503                                  
  1504                                  ;-261     prscomment(&fgetsdest);
  1505                                  
  1506 000005AC 8D0639A2                 lea  ax, [fgetsdest]
  1507 000005B0 50                       push ax
  1508 000005B1 E8FDFD                   call prscomment
  1509 000005B4 83C402                   add  sp, 2
  1510                                  
  1511                                  ;-262     prs(";Line: ");
  1512                                  
  1513 000005B7 68[2406]                 push error1_1
  1514 000005BA E822FE                   call prs
  1515 000005BD 83C402                   add  sp, 2
  1516                                  
  1517                                  ;-263     prunsign1(lineno);
  1518                                  
  1519 000005C0 FF36[4000]               push word [lineno]
  1520 000005C4 E86DFF                   call prunsign1
  1521 000005C7 83C402                   add  sp, 2
  1522                                  
  1523                                  ;-264     prs(" ************** ERROR: ");
  1524                                  
  1525 000005CA 68[2C06]                 push error1_2
  1526 000005CD E80FFE                   call prs
  1527 000005D0 83C402                   add  sp, 2
  1528                                  
  1529                                  ;-265     prs(s);
  1530                                  
  1531 000005D3 FF7604                   push word [bp+4]
  1532 000005D6 E806FE                   call prs
  1533 000005D9 83C402                   add  sp, 2
  1534                                  
  1535                                  ;-266     prs("  in column: ");
  1536                                  
  1537 000005DC 68[4406]                 push error1_3
  1538 000005DF E8FDFD                   call prs
  1539 000005E2 83C402                   add  sp, 2
  1540                                  
  1541                                  ;-267     prunsign1(column);
  1542                                  
  1543 000005E5 FF36[2000]               push word [column]
  1544 000005E9 E848FF                   call prunsign1
  1545 000005EC 83C402                   add  sp, 2
  1546                                  
  1547                                  ;-268     prs("\nToken: ");
  1548                                  
  1549 000005EF 68[5206]                 push error1_4
  1550 000005F2 E8EAFD                   call prs
  1551 000005F5 83C402                   add  sp, 2
  1552                                  
  1553                                  ;-269     prunsign1(token);
  1554                                  
  1555 000005F8 FF36[1E00]               push word [token]
  1556 000005FC E835FF                   call prunsign1
  1557 000005FF 83C402                   add  sp, 2
  1558                                  
  1559                                  ;-270     prs(", symbol: ");
  1560                                  
  1561 00000602 68[5C06]                 push error1_5
  1562 00000605 E8D7FD                   call prs
  1563 00000608 83C402                   add  sp, 2
  1564                                  
  1565                                  ;-271     prs(symbol);
  1566                                  
  1567 0000060B 8D06606D                 lea  ax, [symbol]
  1568 0000060F 50                       push ax
  1569 00000610 E8CCFD                   call prs
  1570 00000613 83C402                   add  sp, 2
  1571                                  
  1572                                  ;-272     end1(1);
  1573                                  
  1574 00000616 6A01                     push 1
  1575 00000618 E85DFF                   call end1
  1576 0000061B 83C402                   add  sp, 2
  1577                                  
  1578                                  ;-273 }
  1579                                  
  1580                                  
  1581                                  ;-274 
  1582                                  
  1583                                  
  1584                                  ;-275 int printinputline() {
  1585 0000061E C9                       LEAVE
  1586 0000061F C3                       ret
  1587 00000620 5C6E2000                error1_0 db "\n ",0
  1588 00000624 3B4C696E653A2000        error1_1 db ";Line: ",0
  1589 0000062C 202A2A2A2A2A2A2A2A-     error1_2 db " ************** ERROR: ",0
  1590 00000635 2A2A2A2A2A2A204552-
  1591 0000063E 524F523A2000       
  1592 00000644 2020696E20636F6C75-     error1_3 db "  in column: ",0
  1593 0000064D 6D6E3A2000         
  1594 00000652 5C6E546F6B656E3A20-     error1_4 db "\nToken: ",0
  1595 0000065B 00                 
  1596 0000065C 2C2073796D626F6C3A-     error1_5 db ", symbol: ",0
  1597 00000665 2000               
  1598                                  ENDP
  1599                                  
  1600                                  printinputline: PROC
  1601                                  
  1602                                  ;-276     int col;
  1603                                  
  1604                                  
  1605                                  ;-277     col=0;
  1606                                  ;
  1607 00000667 C8020000                 ENTER  2,0
  1608 0000066B B80000                   mov ax, 0
  1609 0000066E 8946FE                   mov [bp-2], ax
  1610                                  
  1611                                  ;-278     fgetsp=&fgetsdest;
  1612                                  
  1613 00000671 B839A2                   mov ax, fgetsdest
  1614 00000674 A3[3E00]                 mov word [fgetsp], ax
  1615                                  
  1616                                  ;-279     do {
  1617                                  
  1618                                  .printinputline52:
  1619                                  
  1620                                  ;-280         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);
  1621                                  
  1622 00000677 6A01                     push 1
  1623 00000679 FF36[1A00]               push word [fdin]
  1624 0000067D 8D06[4A00]               lea  ax, [DOS_ByteRead]
  1625 00000681 50                       push ax
  1626 00000682 E86EFA                   call readRL
  1627 00000685 83C406                   add  sp, 6
  1628 00000688 A3[4800]                 mov word [DOS_NoBytes], ax
  1629                                  
  1630                                  ;-281         if (DOS_NoBytes == 0) return;
  1631                                  
  1632 0000068B A1[4800]                 mov ax, [DOS_NoBytes]
  1633 0000068E 83F800                   cmp ax, 0
  1634 00000691 0F850300                 jne .printinputline53
  1635 00000695 E96A00                   jmp .retnprintinputline
  1636                                  
  1637                                  ;-282         *fgetsp=DOS_ByteRead;
  1638                                  
  1639                                  .printinputline53:
  1640 00000698 A0[4A00]                 mov al, [DOS_ByteRead]
  1641 0000069B 8B1E[3E00]               mov  bx, [fgetsp]
  1642 0000069F 8807                     mov  [bx], al
  1643                                  
  1644                                  ;-283         fgetsp++;
  1645                                  
  1646 000006A1 FF06[3E00]               inc  word[fgetsp]
  1647                                  
  1648                                  ;-284         col++;
  1649                                  
  1650 000006A5 FF46FE                   inc  word[bp-2]
  1651                                  
  1652                                  ;-285         if (col >100) error1("input line longer than 100 char");
  1653                                  
  1654 000006A8 8B46FE                   mov ax, [bp-2]
  1655 000006AB 83F864                   cmp ax, 100
  1656 000006AE 0F8E0900                 jle .printinputline54
  1657 000006B2 68[0407]                 push printinputline_0
  1658 000006B5 E8E3FE                   call error1
  1659 000006B8 83C402                   add  sp, 2
  1660                                  
  1661                                  ;-286         }
  1662                                  
  1663                                  .printinputline54:
  1664                                  
  1665                                  ;-287         while (DOS_ByteRead != 10);
  1666                                  
  1667 000006BB A0[4A00]                 mov al, [DOS_ByteRead]
  1668 000006BE 3C0A                     cmp al, 10
  1669 000006C0 0F840200                 je  .printinputline55
  1670 000006C4 EBB1                     jmp .printinputline52
  1671                                  .printinputline55:
  1672                                  
  1673                                  ;-288     *fgetsp=0;
  1674                                  
  1675 000006C6 B80000                   mov ax, 0
  1676 000006C9 8B1E[3E00]               mov  bx, [fgetsp]
  1677 000006CD 8807                     mov  [bx], al
  1678                                  
  1679                                  ;-289     if (fdout) {
  1680                                  
  1681 000006CF A1[1C00]                 mov ax, [fdout]
  1682 000006D2 08C0                     or  al, al
  1683 000006D4 0F842A00                 je .printinputline56
  1684                                  
  1685                                  ;-290         prs("\n\n;-");
  1686                                  
  1687 000006D8 68[2407]                 push printinputline_1
  1688 000006DB E801FD                   call prs
  1689 000006DE 83C402                   add  sp, 2
  1690                                  
  1691                                  ;-291         prunsign1(lineno);
  1692                                  
  1693 000006E1 FF36[4000]               push word [lineno]
  1694 000006E5 E84CFE                   call prunsign1
  1695 000006E8 83C402                   add  sp, 2
  1696                                  
  1697                                  ;-292         prc(' ');
  1698                                  
  1699 000006EB 6A20                     push 32
  1700 000006ED E896FC                   call prc
  1701 000006F0 83C402                   add  sp, 2
  1702                                  
  1703                                  ;-293         lineno++;
  1704                                  
  1705 000006F3 FF06[4000]               inc  word[lineno]
  1706                                  
  1707                                  ;-294         prscomment(&fgetsdest);
  1708                                  
  1709 000006F7 8D0639A2                 lea  ax, [fgetsdest]
  1710 000006FB 50                       push ax
  1711 000006FC E8B2FC                   call prscomment
  1712 000006FF 83C402                   add  sp, 2
  1713                                  
  1714                                  ;-295         }
  1715                                  
  1716                                  
  1717                                  ;-296 }
  1718                                  
  1719                                  .printinputline56:
  1720                                  
  1721                                  ;-297 int fgets1() {
  1722                                  
  1723 00000702 C9                       .retnprintinputline: LEAVE
  1724 00000703 C3                       ret
  1725 00000704 696E707574206C696E-     printinputline_0 db "input line longer than 100 char",0
  1726 0000070D 65206C6F6E67657220-
  1727 00000716 7468616E2031303020-
  1728 0000071F 6368617200         
  1729 00000724 5C6E5C6E3B2D00          printinputline_1 db "\n\n;-",0
  1730                                  ENDP
  1731                                  
  1732                                  fgets1: PROC
  1733                                  
  1734                                  ;-298     char c;
  1735                                  
  1736                                  
  1737                                  ;-299     c=*fgetsp;
  1738                                  ;
  1739 0000072B C8020000                 ENTER  2,0
  1740 0000072F 8B1E[3E00]               mov bx, [fgetsp]
  1741 00000733 8A07                     mov al, [bx]
  1742 00000735 B400                     mov ah, 0
  1743 00000737 8846FE                   mov [bp-2], al
  1744                                  
  1745                                  ;-300     if (c==0) {
  1746                                  
  1747 0000073A 8A46FE                   mov al, [bp-2]
  1748 0000073D 3C00                     cmp al, 0
  1749 0000073F 0F852A00                 jne .fgets157
  1750                                  
  1751                                  ;-301         printinputline();
  1752                                  
  1753 00000743 E821FF                   call printinputline
  1754                                  
  1755                                  ;-302         if (DOS_NoBytes == 0) return 0;
  1756                                  
  1757 00000746 A1[4800]                 mov ax, [DOS_NoBytes]
  1758 00000749 83F800                   cmp ax, 0
  1759 0000074C 0F850600                 jne .fgets158
  1760 00000750 B80000                   mov ax, 0
  1761 00000753 E92500                   jmp .retnfgets1
  1762                                  
  1763                                  ;-303         fgetsp=&fgetsdest;
  1764                                  
  1765                                  .fgets158:
  1766 00000756 B839A2                   mov ax, fgetsdest
  1767 00000759 A3[3E00]                 mov word [fgetsp], ax
  1768                                  
  1769                                  ;-304         c=*fgetsp;
  1770                                  
  1771 0000075C 8B1E[3E00]               mov bx, [fgetsp]
  1772 00000760 8A07                     mov al, [bx]
  1773 00000762 B400                     mov ah, 0
  1774 00000764 8846FE                   mov [bp-2], al
  1775                                  
  1776                                  ;-305         column=0;
  1777                                  
  1778 00000767 B80000                   mov ax, 0
  1779 0000076A A3[2000]                 mov word [column], ax
  1780                                  
  1781                                  ;-306     }
  1782                                  
  1783                                  
  1784                                  ;-307     fgetsp++;
  1785                                  
  1786                                  .fgets157:
  1787 0000076D FF06[3E00]               inc  word[fgetsp]
  1788                                  
  1789                                  ;-308     column++;
  1790                                  
  1791 00000771 FF06[2000]               inc  word[column]
  1792                                  
  1793                                  ;-309     return c;
  1794                                  
  1795 00000775 8A46FE                   mov al, [bp-2]
  1796 00000778 E90000                   jmp .retnfgets1
  1797                                  
  1798                                  ;-310 }
  1799                                  
  1800                                  
  1801                                  ;-311 int next() {
  1802                                  
  1803 0000077B C9                       .retnfgets1: LEAVE
  1804 0000077C C3                       ret
  1805                                  ENDP
  1806                                  
  1807                                  next: PROC
  1808                                  
  1809                                  ;-312     char r;
  1810                                  
  1811                                  
  1812                                  ;-313     r = thechar;
  1813                                  ;
  1814 0000077D C8020000                 ENTER  2,0
  1815 00000781 A0[2200]                 mov al, [thechar]
  1816 00000784 8846FE                   mov [bp-2], al
  1817                                  
  1818                                  ;-314     thechar = fgets1();
  1819                                  
  1820 00000787 E8A1FF                   call fgets1
  1821 0000078A A2[2200]                 mov byte [thechar], al
  1822                                  
  1823                                  ;-315     return r;
  1824                                  
  1825 0000078D 8A46FE                   mov al, [bp-2]
  1826 00000790 E90000                   jmp .retnnext
  1827                                  
  1828                                  ;-316 }
  1829                                  
  1830                                  
  1831                                  ;-317 
  1832                                  
  1833                                  
  1834                                  ;-318 int adrF(char *s, unsigned int i) {
  1835                                  
  1836 00000793 C9                       .retnnext: LEAVE
  1837 00000794 C3                       ret
  1838                                  ENDP
  1839                                  
  1840                                  adrF: PROC
  1841                                  
  1842                                  ;-319     i << 4;//*16; IDLENMAX=15!
  1843                                  ;
  1844 00000795 C8000000                 ENTER  0,0
  1845 00000799 8B4606                   mov ax, [bp+6]
  1846 0000079C C1E004                   shl ax, 4
  1847                                  
  1848                                  ;-320     __asm{ add ax, [bp+4]  ; offset s }
  1849                                  
  1850 0000079F 034604                   add ax, [bp+4]  ; offset s 
  1851                                  
  1852                                  ;-321 }
  1853                                  
  1854                                  
  1855                                  ;-322 
  1856                                  
  1857                                  
  1858                                  ;-323 int printName(unsigned int i) {
  1859 000007A2 C9                       LEAVE
  1860 000007A3 C3                       ret
  1861                                  ENDP
  1862                                  
  1863                                  printName: PROC
  1864                                  
  1865                                  ;-324     int j;
  1866                                  
  1867                                  
  1868                                  ;-325     if (i < LSTART) {
  1869                                  ;
  1870 000007A4 C8020000                 ENTER  2,0
  1871 000007A8 8B4604                   mov ax, [bp+4]
  1872 000007AB 3DC800                   cmp ax, 200
  1873 000007AE 0F8D1D00                 jge .printName59
  1874                                  
  1875                                  ;-326         i=adrF(GNameField, i);
  1876                                  
  1877 000007B2 FF7604                   push word [bp+4]
  1878 000007B5 8D067976                 lea  ax, [GNameField]
  1879 000007B9 50                       push ax
  1880 000007BA E8D8FF                   call adrF
  1881 000007BD 83C404                   add  sp, 4
  1882 000007C0 894604                   mov [bp+4], ax
  1883                                  
  1884                                  ;-327         prs(i);
  1885                                  
  1886 000007C3 FF7604                   push word [bp+4]
  1887 000007C6 E816FC                   call prs
  1888 000007C9 83C402                   add  sp, 2
  1889                                  
  1890                                  ;-328     }
  1891                                  
  1892                                  
  1893                                  ;-329     else {
  1894                                  
  1895 000007CC E93800                   jmp .printName60
  1896                                  .printName59:
  1897                                  
  1898                                  ;-330         prs("[bp");
  1899                                  
  1900 000007CF 68[0908]                 push printName_0
  1901 000007D2 E80AFC                   call prs
  1902 000007D5 83C402                   add  sp, 2
  1903                                  
  1904                                  ;-331         j = GData[i];
  1905                                  
  1906 000007D8 8B5E04                   mov bx, [bp+4]
  1907 000007DB D1E3                     shl bx, 1
  1908 000007DD 8B875973                 mov ax, [GData + bx]
  1909 000007E1 8946FE                   mov [bp-2], ax
  1910                                  
  1911                                  ;-332         if (j>0) prc('+');
  1912                                  
  1913 000007E4 8B46FE                   mov ax, [bp-2]
  1914 000007E7 83F800                   cmp ax, 0
  1915 000007EA 0F8E0800                 jle .printName61
  1916 000007EE 6A2B                     push 43
  1917 000007F0 E893FB                   call prc
  1918 000007F3 83C402                   add  sp, 2
  1919                                  
  1920                                  ;-333         pint1(j);
  1921                                  
  1922                                  .printName61:
  1923 000007F6 FF76FE                   push word [bp-2]
  1924 000007F9 E8DAFC                   call pint1
  1925 000007FC 83C402                   add  sp, 2
  1926                                  
  1927                                  ;-334         prc(']');
  1928                                  
  1929 000007FF 6A5D                     push 93
  1930 00000801 E882FB                   call prc
  1931 00000804 83C402                   add  sp, 2
  1932                                  
  1933                                  ;-335     }
  1934                                  
  1935                                  
  1936                                  ;-336 }
  1937                                  
  1938                                  .printName60:
  1939                                  
  1940                                  ;-337 
  1941                                  
  1942                                  
  1943                                  ;-338 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR
  1944 00000807 C9                       LEAVE
  1945 00000808 C3                       ret
  1946 00000809 5B627000                printName_0 db "[bp",0
  1947                                  ENDP
  1948                                  
  1949                                  ifEOL: PROC
  1950                                  
  1951                                  ;-339     if (c == 10) return 1;//LF
  1952                                  ;
  1953 0000080D C8000000                 ENTER  0,0
  1954 00000811 8A4604                   mov al, [bp+4]
  1955 00000814 3C0A                     cmp al, 10
  1956 00000816 0F850600                 jne .ifEOL62
  1957 0000081A B80100                   mov ax, 1
  1958 0000081D E92400                   jmp .retnifEOL
  1959                                  
  1960                                  ;-340     if (c == 13) {//CR
  1961                                  
  1962                                  .ifEOL62:
  1963 00000820 8A4604                   mov al, [bp+4]
  1964 00000823 3C0D                     cmp al, 13
  1965 00000825 0F851500                 jne .ifEOL63
  1966                                  
  1967                                  ;-341         if (thechar == 10) c=next();
  1968                                  
  1969 00000829 A0[2200]                 mov al, [thechar]
  1970 0000082C 3C0A                     cmp al, 10
  1971 0000082E 0F850600                 jne .ifEOL64
  1972 00000832 E848FF                   call next
  1973 00000835 884604                   mov [bp+4], al
  1974                                  
  1975                                  ;-342         return 1;
  1976                                  
  1977                                  .ifEOL64:
  1978 00000838 B80100                   mov ax, 1
  1979 0000083B E90600                   jmp .retnifEOL
  1980                                  
  1981                                  ;-343     }
  1982                                  
  1983                                  
  1984                                  ;-344     return 0;
  1985                                  
  1986                                  .ifEOL63:
  1987 0000083E B80000                   mov ax, 0
  1988 00000841 E90000                   jmp .retnifEOL
  1989                                  
  1990                                  ;-345 }
  1991                                  
  1992                                  
  1993                                  ;-346 
  1994                                  
  1995                                  
  1996                                  ;-347 char symboltemp[80];
  1997                                  
  1998 00000844 C9                       .retnifEOL: LEAVE
  1999 00000845 C3                       ret
  2000                                  ENDP
  2001                                  section .bss
  2002                                  absolute 41657
  2003 0000A2B9 <res 00000050>          symboltemp resb 80
  2004                                  section .text
  2005                                  
  2006                                  ;-348 int getlex() {
  2007                                  
  2008                                  
  2009                                  getlex: PROC
  2010                                  
  2011                                  ;-349     char c; char *p;
  2012                                  
  2013                                  
  2014                                  ;-350     int i; int j;
  2015                                  
  2016                                  
  2017                                  ;-351 g1: c=next();
  2018                                  ;
  2019 00000846 C8080000                 ENTER  8,0
  2020                                  .g1:
  2021 0000084A E830FF                   call next
  2022 0000084D 8846FE                   mov [bp-2], al
  2023                                  
  2024                                  ;-352     if (c == 0) return 0;
  2025                                  
  2026 00000850 8A46FE                   mov al, [bp-2]
  2027 00000853 3C00                     cmp al, 0
  2028 00000855 0F850600                 jne .getlex65
  2029 00000859 B80000                   mov ax, 0
  2030 0000085C E90D06                   jmp .retngetlex
  2031                                  
  2032                                  ;-353     if (c <= ' ') goto g1;
  2033                                  
  2034                                  .getlex65:
  2035 0000085F 8A46FE                   mov al, [bp-2]
  2036 00000862 3C20                     cmp al, 32
  2037 00000864 0F8F0200                 jg  .getlex66
  2038 00000868 EBE0                     jmp .g1
  2039                                  
  2040                                  ;-354   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}
  2041                                  
  2042                                  .getlex66:
  2043 0000086A 8A46FE                   mov al, [bp-2]
  2044 0000086D 3C3D                     cmp al, 61
  2045 0000086F 0F851200                 jne .getlex67
  2046 00000873 A0[2200]                 mov al, [thechar]
  2047 00000876 3C3D                     cmp al, 61
  2048 00000878 0F850900                 jne .getlex68
  2049 0000087C E8FEFE                   call next
  2050 0000087F B82603                   mov ax, 806
  2051 00000882 E9E705                   jmp .retngetlex
  2052                                  .getlex68:
  2053                                  
  2054                                  ;-355   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}
  2055                                  
  2056                                  .getlex67:
  2057 00000885 8A46FE                   mov al, [bp-2]
  2058 00000888 3C21                     cmp al, 33
  2059 0000088A 0F851200                 jne .getlex69
  2060 0000088E A0[2200]                 mov al, [thechar]
  2061 00000891 3C3D                     cmp al, 61
  2062 00000893 0F850900                 jne .getlex70
  2063 00000897 E8E3FE                   call next
  2064 0000089A B82703                   mov ax, 807
  2065 0000089D E9CC05                   jmp .retngetlex
  2066                                  .getlex70:
  2067                                  
  2068                                  ;-356   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}
  2069                                  
  2070                                  .getlex69:
  2071 000008A0 8A46FE                   mov al, [bp-2]
  2072 000008A3 3C3C                     cmp al, 60
  2073 000008A5 0F851200                 jne .getlex71
  2074 000008A9 A0[2200]                 mov al, [thechar]
  2075 000008AC 3C3D                     cmp al, 61
  2076 000008AE 0F850900                 jne .getlex72
  2077 000008B2 E8C8FE                   call next
  2078 000008B5 B83803                   mov ax, 824
  2079 000008B8 E9B105                   jmp .retngetlex
  2080                                  .getlex72:
  2081                                  
  2082                                  ;-357   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}
  2083                                  
  2084                                  .getlex71:
  2085 000008BB 8A46FE                   mov al, [bp-2]
  2086 000008BE 3C3E                     cmp al, 62
  2087 000008C0 0F851200                 jne .getlex73
  2088 000008C4 A0[2200]                 mov al, [thechar]
  2089 000008C7 3C3D                     cmp al, 61
  2090 000008C9 0F850900                 jne .getlex74
  2091 000008CD E8ADFE                   call next
  2092 000008D0 B82B03                   mov ax, 811
  2093 000008D3 E99605                   jmp .retngetlex
  2094                                  .getlex74:
  2095                                  
  2096                                  ;-358   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}
  2097                                  
  2098                                  .getlex73:
  2099 000008D6 8A46FE                   mov al, [bp-2]
  2100 000008D9 3C3C                     cmp al, 60
  2101 000008DB 0F851200                 jne .getlex75
  2102 000008DF A0[2200]                 mov al, [thechar]
  2103 000008E2 3C3C                     cmp al, 60
  2104 000008E4 0F850900                 jne .getlex76
  2105 000008E8 E892FE                   call next
  2106 000008EB B8D804                   mov ax, 1240
  2107 000008EE E97B05                   jmp .retngetlex
  2108                                  .getlex76:
  2109                                  
  2110                                  ;-359   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}
  2111                                  
  2112                                  .getlex75:
  2113 000008F1 8A46FE                   mov al, [bp-2]
  2114 000008F4 3C3E                     cmp al, 62
  2115 000008F6 0F851200                 jne .getlex77
  2116 000008FA A0[2200]                 mov al, [thechar]
  2117 000008FD 3C3E                     cmp al, 62
  2118 000008FF 0F850900                 jne .getlex78
  2119 00000903 E877FE                   call next
  2120 00000906 B8D904                   mov ax, 1241
  2121 00000909 E96005                   jmp .retngetlex
  2122                                  .getlex78:
  2123                                  
  2124                                  ;-360   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}
  2125                                  
  2126                                  .getlex77:
  2127 0000090C 8A46FE                   mov al, [bp-2]
  2128 0000090F 3C2B                     cmp al, 43
  2129 00000911 0F851200                 jne .getlex79
  2130 00000915 A0[2200]                 mov al, [thechar]
  2131 00000918 3C2B                     cmp al, 43
  2132 0000091A 0F850900                 jne .getlex80
  2133 0000091E E85CFE                   call next
  2134 00000921 B8C304                   mov ax, 1219
  2135 00000924 E94505                   jmp .retngetlex
  2136                                  .getlex80:
  2137                                  
  2138                                  ;-361   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}
  2139                                  
  2140                                  .getlex79:
  2141 00000927 8A46FE                   mov al, [bp-2]
  2142 0000092A 3C2D                     cmp al, 45
  2143 0000092C 0F851200                 jne .getlex81
  2144 00000930 A0[2200]                 mov al, [thechar]
  2145 00000933 3C2D                     cmp al, 45
  2146 00000935 0F850900                 jne .getlex82
  2147 00000939 E841FE                   call next
  2148 0000093C B8C904                   mov ax, 1225
  2149 0000093F E92A05                   jmp .retngetlex
  2150                                  .getlex82:
  2151                                  
  2152                                  ;-362   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}
  2153                                  
  2154                                  .getlex81:
  2155 00000942 8A46FE                   mov al, [bp-2]
  2156 00000945 3C2B                     cmp al, 43
  2157 00000947 0F851200                 jne .getlex83
  2158 0000094B A0[2200]                 mov al, [thechar]
  2159 0000094E 3C3D                     cmp al, 61
  2160 00000950 0F850900                 jne .getlex84
  2161 00000954 E826FE                   call next
  2162 00000957 B8CE04                   mov ax, 1230
  2163 0000095A E90F05                   jmp .retngetlex
  2164                                  .getlex84:
  2165                                  
  2166                                  ;-363   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}
  2167                                  
  2168                                  .getlex83:
  2169 0000095D 8A46FE                   mov al, [bp-2]
  2170 00000960 3C2D                     cmp al, 45
  2171 00000962 0F851200                 jne .getlex85
  2172 00000966 A0[2200]                 mov al, [thechar]
  2173 00000969 3C3D                     cmp al, 61
  2174 0000096B 0F850900                 jne .getlex86
  2175 0000096F E80BFE                   call next
  2176 00000972 B8CF04                   mov ax, 1231
  2177 00000975 E9F404                   jmp .retngetlex
  2178                                  .getlex86:
  2179                                  
  2180                                  ;-364   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}
  2181                                  
  2182                                  .getlex85:
  2183 00000978 8A46FE                   mov al, [bp-2]
  2184 0000097B 3C26                     cmp al, 38
  2185 0000097D 0F851200                 jne .getlex87
  2186 00000981 A0[2200]                 mov al, [thechar]
  2187 00000984 3C3D                     cmp al, 61
  2188 00000986 0F850900                 jne .getlex88
  2189 0000098A E8F0FD                   call next
  2190 0000098D B8D204                   mov ax, 1234
  2191 00000990 E9D904                   jmp .retngetlex
  2192                                  .getlex88:
  2193                                  
  2194                                  ;-365   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}
  2195                                  
  2196                                  .getlex87:
  2197 00000993 8A46FE                   mov al, [bp-2]
  2198 00000996 3C7C                     cmp al, 124
  2199 00000998 0F851200                 jne .getlex89
  2200 0000099C A0[2200]                 mov al, [thechar]
  2201 0000099F 3C3D                     cmp al, 61
  2202 000009A1 0F850900                 jne .getlex90
  2203 000009A5 E8D5FD                   call next
  2204 000009A8 B8D304                   mov ax, 1235
  2205 000009AB E9BE04                   jmp .retngetlex
  2206                                  .getlex90:
  2207                                  
  2208                                  ;-366   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}
  2209                                  
  2210                                  .getlex89:
  2211 000009AE 8A46FE                   mov al, [bp-2]
  2212 000009B1 3C2A                     cmp al, 42
  2213 000009B3 0F851200                 jne .getlex91
  2214 000009B7 A0[2200]                 mov al, [thechar]
  2215 000009BA 3C3D                     cmp al, 61
  2216 000009BC 0F850900                 jne .getlex92
  2217 000009C0 E8BAFD                   call next
  2218 000009C3 B8D004                   mov ax, 1232
  2219 000009C6 E9A304                   jmp .retngetlex
  2220                                  .getlex92:
  2221                                  
  2222                                  ;-367   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}
  2223                                  
  2224                                  .getlex91:
  2225 000009C9 8A46FE                   mov al, [bp-2]
  2226 000009CC 3C2F                     cmp al, 47
  2227 000009CE 0F851200                 jne .getlex93
  2228 000009D2 A0[2200]                 mov al, [thechar]
  2229 000009D5 3C3D                     cmp al, 61
  2230 000009D7 0F850900                 jne .getlex94
  2231 000009DB E89FFD                   call next
  2232 000009DE B8D104                   mov ax, 1233
  2233 000009E1 E98804                   jmp .retngetlex
  2234                                  .getlex94:
  2235                                  
  2236                                  ;-368   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;
  2237                                  
  2238                                  .getlex93:
  2239 000009E4 8A46FE                   mov al, byte [bp-2]
  2240 000009E7 B400                     mov ah, 0
  2241 000009E9 50                       push ax
  2242 000009EA 68[6E0E]                 push getlex_0
  2243 000009ED E823F9                   call instr1
  2244 000009F0 83C404                   add  sp, 4
  2245 000009F3 08C0                     or  al, al
  2246 000009F5 0F840600                 je .getlex95
  2247 000009F9 8A46FE                   mov al, [bp-2]
  2248 000009FC E96D04                   jmp .retngetlex
  2249                                  
  2250                                  ;-369   if (c == '/') {
  2251                                  
  2252                                  .getlex95:
  2253 000009FF 8A46FE                   mov al, [bp-2]
  2254 00000A02 3C2F                     cmp al, 47
  2255 00000A04 0F852900                 jne .getlex96
  2256                                  
  2257                                  ;-370       if (thechar == '/') {
  2258                                  
  2259 00000A08 A0[2200]                 mov al, [thechar]
  2260 00000A0B 3C2F                     cmp al, 47
  2261 00000A0D 0F852000                 jne .getlex97
  2262                                  
  2263                                  ;-371           do c=next();
  2264                                  
  2265                                  .getlex98:
  2266 00000A11 E869FD                   call next
  2267 00000A14 8846FE                   mov [bp-2], al
  2268                                  
  2269                                  ;-372           while(ifEOL(c)==0) return getlex();
  2270                                  
  2271 00000A17 8A46FE                   mov al, byte [bp-2]
  2272 00000A1A B400                     mov ah, 0
  2273 00000A1C 50                       push ax
  2274 00000A1D E8EDFD                   call ifEOL
  2275 00000A20 83C402                   add  sp, 2
  2276 00000A23 3C00                     cmp al, 0
  2277 00000A25 0F850200                 jne .getlex99
  2278 00000A29 EBE6                     jmp .getlex98
  2279                                  .getlex99:
  2280 00000A2B E818FE                   call getlex
  2281 00000A2E E93B04                   jmp .retngetlex
  2282                                  
  2283                                  ;-373       }
  2284                                  
  2285                                  
  2286                                  ;-374   }
  2287                                  
  2288                                  .getlex97:
  2289                                  
  2290                                  ;-375   if (c == '/') {
  2291                                  
  2292                                  .getlex96:
  2293 00000A31 8A46FE                   mov al, [bp-2]
  2294 00000A34 3C2F                     cmp al, 47
  2295 00000A36 0F853A00                 jne .getlex100
  2296                                  
  2297                                  ;-376       if (thechar == '*') {
  2298                                  
  2299 00000A3A A0[2200]                 mov al, [thechar]
  2300 00000A3D 3C2A                     cmp al, 42
  2301 00000A3F 0F852B00                 jne .getlex101
  2302                                  
  2303                                  ;-377           g2: c=next();
  2304                                  
  2305                                  .g2:
  2306 00000A43 E837FD                   call next
  2307 00000A46 8846FE                   mov [bp-2], al
  2308                                  
  2309                                  ;-378           if (c != '*') goto g2;
  2310                                  
  2311 00000A49 8A46FE                   mov al, [bp-2]
  2312 00000A4C 3C2A                     cmp al, 42
  2313 00000A4E 0F840200                 je  .getlex102
  2314 00000A52 EBEF                     jmp .g2
  2315                                  
  2316                                  ;-379           if (thechar != '/') goto g2;
  2317                                  
  2318                                  .getlex102:
  2319 00000A54 A0[2200]                 mov al, [thechar]
  2320 00000A57 3C2F                     cmp al, 47
  2321 00000A59 0F840200                 je  .getlex103
  2322 00000A5D EBE4                     jmp .g2
  2323                                  
  2324                                  ;-380           c=next();
  2325                                  
  2326                                  .getlex103:
  2327 00000A5F E81BFD                   call next
  2328 00000A62 8846FE                   mov [bp-2], al
  2329                                  
  2330                                  ;-381           return getlex();
  2331                                  
  2332 00000A65 E8DEFD                   call getlex
  2333 00000A68 E90104                   jmp .retngetlex
  2334                                  
  2335                                  ;-382       } else  return '/';
  2336                                  
  2337 00000A6B E90600                   jmp .getlex104
  2338                                  .getlex101:
  2339 00000A6E B82F00                   mov ax, 47
  2340 00000A71 E9F803                   jmp .retngetlex
  2341                                  
  2342                                  ;-383   }
  2343                                  
  2344                                  .getlex104:
  2345                                  
  2346                                  ;-384   if (c == '"') {
  2347                                  
  2348                                  .getlex100:
  2349 00000A74 8A46FE                   mov al, [bp-2]
  2350 00000A77 3C22                     cmp al, 34
  2351 00000A79 0F853600                 jne .getlex105
  2352                                  
  2353                                  ;-385       p=&symbol;
  2354                                  
  2355 00000A7D B8606D                   mov ax, symbol
  2356 00000A80 8946FC                   mov [bp-4], ax
  2357                                  
  2358                                  ;-386       c=next();
  2359                                  
  2360 00000A83 E8F7FC                   call next
  2361 00000A86 8846FE                   mov [bp-2], al
  2362                                  
  2363                                  ;-387       while (c != '"') {
  2364                                  
  2365                                  .getlex106:
  2366 00000A89 8A46FE                   mov al, [bp-2]
  2367 00000A8C 3C22                     cmp al, 34
  2368 00000A8E 0F841300                 je  .getlex107
  2369                                  
  2370                                  ;-388           *p=c;
  2371                                  
  2372 00000A92 8A46FE                   mov al, [bp-2]
  2373 00000A95 8B5EFC                   mov  bx, [bp-4]
  2374 00000A98 8807                     mov  [bx], al
  2375                                  
  2376                                  ;-389           p++;
  2377                                  
  2378 00000A9A FF46FC                   inc  word[bp-4]
  2379                                  
  2380                                  ;-390           c=next();
  2381                                  
  2382 00000A9D E8DDFC                   call next
  2383 00000AA0 8846FE                   mov [bp-2], al
  2384                                  
  2385                                  ;-391           }
  2386                                  
  2387                                  
  2388                                  ;-392           *p=0;
  2389                                  
  2390 00000AA3 EBE4                     jmp .getlex106
  2391                                  .getlex107:
  2392 00000AA5 B80000                   mov ax, 0
  2393 00000AA8 8B5EFC                   mov  bx, [bp-4]
  2394 00000AAB 8807                     mov  [bx], al
  2395                                  
  2396                                  ;-393       return T_STRING;
  2397                                  
  2398 00000AAD B80201                   mov ax, 258
  2399 00000AB0 E9B903                   jmp .retngetlex
  2400                                  
  2401                                  ;-394   }
  2402                                  
  2403                                  
  2404                                  ;-395   if (digit(c)) {
  2405                                  
  2406                                  .getlex105:
  2407 00000AB3 8A46FE                   mov al, byte [bp-2]
  2408 00000AB6 B400                     mov ah, 0
  2409 00000AB8 50                       push ax
  2410 00000AB9 E8DFF6                   call digit
  2411 00000ABC 83C402                   add  sp, 2
  2412 00000ABF 08C0                     or  al, al
  2413 00000AC1 0F84D600                 je .getlex108
  2414                                  
  2415                                  ;-396       lexval=0;
  2416                                  
  2417 00000AC5 B80000                   mov ax, 0
  2418 00000AC8 A3[2B00]                 mov word [lexval], ax
  2419                                  
  2420                                  ;-397       lexval=c-'0'; // lexval=int hi=0, c=char
  2421                                  
  2422 00000ACB 8A46FE                   mov al, [bp-2]
  2423 00000ACE 2C30                     sub al, 48
  2424 00000AD0 A3[2B00]                 mov word [lexval], ax
  2425                                  
  2426                                  ;-398       if (thechar=='x') thechar='X';
  2427                                  
  2428 00000AD3 A0[2200]                 mov al, [thechar]
  2429 00000AD6 3C78                     cmp al, 120
  2430 00000AD8 0F850600                 jne .getlex109
  2431 00000ADC B85800                   mov ax, 88
  2432 00000ADF A2[2200]                 mov byte [thechar], al
  2433                                  
  2434                                  ;-399       if (thechar=='X') {
  2435                                  
  2436                                  .getlex109:
  2437 00000AE2 A0[2200]                 mov al, [thechar]
  2438 00000AE5 3C58                     cmp al, 88
  2439 00000AE7 0F856800                 jne .getlex110
  2440                                  
  2441                                  ;-400           next();
  2442                                  
  2443 00000AEB E88FFC                   call next
  2444                                  
  2445                                  ;-401           while(alnum(thechar)) {
  2446                                  
  2447                                  .getlex111:
  2448 00000AEE A0[2200]                 mov al, byte [thechar]
  2449 00000AF1 B400                     mov ah, 0
  2450 00000AF3 50                       push ax
  2451 00000AF4 E8CEF6                   call alnum
  2452 00000AF7 83C402                   add  sp, 2
  2453 00000AFA 08C0                     or  al, al
  2454 00000AFC 0F845000                 je .getlex112
  2455                                  
  2456                                  ;-402               c=next();
  2457                                  
  2458 00000B00 E87AFC                   call next
  2459 00000B03 8846FE                   mov [bp-2], al
  2460                                  
  2461                                  ;-403               if(c>96) c=c-39;
  2462                                  
  2463 00000B06 8A46FE                   mov al, [bp-2]
  2464 00000B09 3C60                     cmp al, 96
  2465 00000B0B 0F8E0800                 jle .getlex113
  2466 00000B0F 8A46FE                   mov al, [bp-2]
  2467 00000B12 2C27                     sub al, 39
  2468 00000B14 8846FE                   mov [bp-2], al
  2469                                  
  2470                                  ;-404       	       if (c>64) c=c-7;
  2471                                  
  2472                                  .getlex113:
  2473 00000B17 8A46FE                   mov al, [bp-2]
  2474 00000B1A 3C40                     cmp al, 64
  2475 00000B1C 0F8E0800                 jle .getlex114
  2476 00000B20 8A46FE                   mov al, [bp-2]
  2477 00000B23 2C07                     sub al, 7
  2478 00000B25 8846FE                   mov [bp-2], al
  2479                                  
  2480                                  ;-405                c=c-48;
  2481                                  
  2482                                  .getlex114:
  2483 00000B28 8A46FE                   mov al, [bp-2]
  2484 00000B2B 2C30                     sub al, 48
  2485 00000B2D 8846FE                   mov [bp-2], al
  2486                                  
  2487                                  ;-406                lexval=lexval << 4; // * 16
  2488                                  
  2489 00000B30 A1[2B00]                 mov ax, [lexval]
  2490 00000B33 C1E004                   shl ax, 4
  2491 00000B36 A3[2B00]                 mov word [lexval], ax
  2492                                  
  2493                                  ;-407                i=0;
  2494                                  
  2495 00000B39 B80000                   mov ax, 0
  2496 00000B3C 8946FA                   mov [bp-6], ax
  2497                                  
  2498                                  ;-408                i=c;
  2499                                  
  2500 00000B3F 8A46FE                   mov al, [bp-2]
  2501 00000B42 8946FA                   mov [bp-6], ax
  2502                                  
  2503                                  ;-409                lexval=lexval+i;
  2504                                  
  2505 00000B45 A1[2B00]                 mov ax, [lexval]
  2506 00000B48 0346FA                   add ax, [bp-6]
  2507 00000B4B A3[2B00]                 mov word [lexval], ax
  2508                                  
  2509                                  ;-410            }
  2510                                  
  2511                                  
  2512                                  ;-411        }else {
  2513                                  
  2514 00000B4E EB9E                     jmp .getlex111
  2515                                  .getlex112:
  2516 00000B50 E94200                   jmp .getlex115
  2517                                  .getlex110:
  2518                                  
  2519                                  ;-412            while(digit(thechar)) {
  2520                                  
  2521                                  .getlex116:
  2522 00000B53 A0[2200]                 mov al, byte [thechar]
  2523 00000B56 B400                     mov ah, 0
  2524 00000B58 50                       push ax
  2525 00000B59 E83FF6                   call digit
  2526 00000B5C 83C402                   add  sp, 2
  2527 00000B5F 08C0                     or  al, al
  2528 00000B61 0F843000                 je .getlex117
  2529                                  
  2530                                  ;-413                c=next();
  2531                                  
  2532 00000B65 E815FC                   call next
  2533 00000B68 8846FE                   mov [bp-2], al
  2534                                  
  2535                                  ;-414                c=c-48;
  2536                                  
  2537 00000B6B 8A46FE                   mov al, [bp-2]
  2538 00000B6E 2C30                     sub al, 48
  2539 00000B70 8846FE                   mov [bp-2], al
  2540                                  
  2541                                  ;-415                lexval=lexval*10;
  2542                                  
  2543 00000B73 A1[2B00]                 mov ax, [lexval]
  2544 00000B76 BB0A00                   mov bx, 10
  2545 00000B79 F7E3                     mul bx
  2546 00000B7B A3[2B00]                 mov word [lexval], ax
  2547                                  
  2548                                  ;-416                i=0;
  2549                                  
  2550 00000B7E B80000                   mov ax, 0
  2551 00000B81 8946FA                   mov [bp-6], ax
  2552                                  
  2553                                  ;-417                i=c;
  2554                                  
  2555 00000B84 8A46FE                   mov al, [bp-2]
  2556 00000B87 8946FA                   mov [bp-6], ax
  2557                                  
  2558                                  ;-418                lexval=lexval+i;
  2559                                  
  2560 00000B8A A1[2B00]                 mov ax, [lexval]
  2561 00000B8D 0346FA                   add ax, [bp-6]
  2562 00000B90 A3[2B00]                 mov word [lexval], ax
  2563                                  
  2564                                  ;-419            }
  2565                                  
  2566                                  
  2567                                  ;-420        }
  2568                                  
  2569 00000B93 EBBE                     jmp .getlex116
  2570                                  .getlex117:
  2571                                  
  2572                                  ;-421       return T_CONST;
  2573                                  
  2574                                  .getlex115:
  2575 00000B95 B80101                   mov ax, 257
  2576 00000B98 E9D102                   jmp .retngetlex
  2577                                  
  2578                                  ;-422   }
  2579                                  
  2580                                  
  2581                                  ;-423   if (c==39) {
  2582                                  
  2583                                  .getlex108:
  2584 00000B9B 8A46FE                   mov al, [bp-2]
  2585 00000B9E 3C27                     cmp al, 39
  2586 00000BA0 0F854F00                 jne .getlex118
  2587                                  
  2588                                  ;-424       lexval=next();
  2589                                  
  2590 00000BA4 E8D6FB                   call next
  2591 00000BA7 A3[2B00]                 mov word [lexval], ax
  2592                                  
  2593                                  ;-425       if (lexval==92) {
  2594                                  
  2595 00000BAA A1[2B00]                 mov ax, [lexval]
  2596 00000BAD 83F85C                   cmp ax, 92
  2597 00000BB0 0F853600                 jne .getlex119
  2598                                  
  2599                                  ;-426           lexval=next();
  2600                                  
  2601 00000BB4 E8C6FB                   call next
  2602 00000BB7 A3[2B00]                 mov word [lexval], ax
  2603                                  
  2604                                  ;-427           if (lexval=='n') lexval=10;
  2605                                  
  2606 00000BBA A1[2B00]                 mov ax, [lexval]
  2607 00000BBD 83F86E                   cmp ax, 110
  2608 00000BC0 0F850600                 jne .getlex120
  2609 00000BC4 B80A00                   mov ax, 10
  2610 00000BC7 A3[2B00]                 mov word [lexval], ax
  2611                                  
  2612                                  ;-428           if (lexval=='t') lexval= 9;
  2613                                  
  2614                                  .getlex120:
  2615 00000BCA A1[2B00]                 mov ax, [lexval]
  2616 00000BCD 83F874                   cmp ax, 116
  2617 00000BD0 0F850600                 jne .getlex121
  2618 00000BD4 B80900                   mov ax, 9
  2619 00000BD7 A3[2B00]                 mov word [lexval], ax
  2620                                  
  2621                                  ;-429           if (lexval=='0') lexval= 0;
  2622                                  
  2623                                  .getlex121:
  2624 00000BDA A1[2B00]                 mov ax, [lexval]
  2625 00000BDD 83F830                   cmp ax, 48
  2626 00000BE0 0F850600                 jne .getlex122
  2627 00000BE4 B80000                   mov ax, 0
  2628 00000BE7 A3[2B00]                 mov word [lexval], ax
  2629                                  
  2630                                  ;-430       }
  2631                                  
  2632                                  .getlex122:
  2633                                  
  2634                                  ;-431       next();
  2635                                  
  2636                                  .getlex119:
  2637 00000BEA E890FB                   call next
  2638                                  
  2639                                  ;-432       return T_CONST;
  2640                                  
  2641 00000BED B80101                   mov ax, 257
  2642 00000BF0 E97902                   jmp .retngetlex
  2643                                  
  2644                                  ;-433   }
  2645                                  
  2646                                  
  2647                                  ;-434   if (alnum(c)) {
  2648                                  
  2649                                  .getlex118:
  2650 00000BF3 8A46FE                   mov al, byte [bp-2]
  2651 00000BF6 B400                     mov ah, 0
  2652 00000BF8 50                       push ax
  2653 00000BF9 E8C9F5                   call alnum
  2654 00000BFC 83C402                   add  sp, 2
  2655 00000BFF 08C0                     or  al, al
  2656 00000C01 0F845E02                 je .getlex123
  2657                                  
  2658                                  ;-435     strcpy(symboltemp, symbol);
  2659                                  
  2660 00000C05 8D06606D                 lea  ax, [symbol]
  2661 00000C09 50                       push ax
  2662 00000C0A 8D06B9A2                 lea  ax, [symboltemp]
  2663 00000C0E 50                       push ax
  2664 00000C0F E817F6                   call strcpy
  2665 00000C12 83C404                   add  sp, 4
  2666                                  
  2667                                  ;-436     p=&symbol;
  2668                                  
  2669 00000C15 B8606D                   mov ax, symbol
  2670 00000C18 8946FC                   mov [bp-4], ax
  2671                                  
  2672                                  ;-437     *p=c;
  2673                                  
  2674 00000C1B 8A46FE                   mov al, [bp-2]
  2675 00000C1E 8B5EFC                   mov  bx, [bp-4]
  2676 00000C21 8807                     mov  [bx], al
  2677                                  
  2678                                  ;-438     p++;
  2679                                  
  2680 00000C23 FF46FC                   inc  word[bp-4]
  2681                                  
  2682                                  ;-439     while(alnum(thechar)) {
  2683                                  
  2684                                  .getlex124:
  2685 00000C26 A0[2200]                 mov al, byte [thechar]
  2686 00000C29 B400                     mov ah, 0
  2687 00000C2B 50                       push ax
  2688 00000C2C E896F5                   call alnum
  2689 00000C2F 83C402                   add  sp, 2
  2690 00000C32 08C0                     or  al, al
  2691 00000C34 0F841300                 je .getlex125
  2692                                  
  2693                                  ;-440         c=next();
  2694                                  
  2695 00000C38 E842FB                   call next
  2696 00000C3B 8846FE                   mov [bp-2], al
  2697                                  
  2698                                  ;-441         *p=c;
  2699                                  
  2700 00000C3E 8A46FE                   mov al, [bp-2]
  2701 00000C41 8B5EFC                   mov  bx, [bp-4]
  2702 00000C44 8807                     mov  [bx], al
  2703                                  
  2704                                  ;-442         p++;
  2705                                  
  2706 00000C46 FF46FC                   inc  word[bp-4]
  2707                                  
  2708                                  ;-443     }
  2709                                  
  2710                                  
  2711                                  ;-444     *p=0;
  2712                                  
  2713 00000C49 EBDB                     jmp .getlex124
  2714                                  .getlex125:
  2715 00000C4B B80000                   mov ax, 0
  2716 00000C4E 8B5EFC                   mov  bx, [bp-4]
  2717 00000C51 8807                     mov  [bx], al
  2718                                  
  2719                                  ;-445     if (eqstr(symbol,"signed"  )) return T_SIGNED;
  2720                                  
  2721 00000C53 68[840E]                 push getlex_1
  2722 00000C56 8D06606D                 lea  ax, [symbol]
  2723 00000C5A 50                       push ax
  2724 00000C5B E801F6                   call eqstr
  2725 00000C5E 83C404                   add  sp, 4
  2726 00000C61 08C0                     or  al, al
  2727 00000C63 0F840600                 je .getlex126
  2728 00000C67 B81302                   mov ax, 531
  2729 00000C6A E9FF01                   jmp .retngetlex
  2730                                  
  2731                                  ;-446     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;
  2732                                  
  2733                                  .getlex126:
  2734 00000C6D 68[8B0E]                 push getlex_2
  2735 00000C70 8D06606D                 lea  ax, [symbol]
  2736 00000C74 50                       push ax
  2737 00000C75 E8E7F5                   call eqstr
  2738 00000C78 83C404                   add  sp, 4
  2739 00000C7B 08C0                     or  al, al
  2740 00000C7D 0F840600                 je .getlex127
  2741 00000C81 B81402                   mov ax, 532
  2742 00000C84 E9E501                   jmp .retngetlex
  2743                                  
  2744                                  ;-447     if (eqstr(symbol,"void"    )) return T_VOID;
  2745                                  
  2746                                  .getlex127:
  2747 00000C87 68[940E]                 push getlex_3
  2748 00000C8A 8D06606D                 lea  ax, [symbol]
  2749 00000C8E 50                       push ax
  2750 00000C8F E8CDF5                   call eqstr
  2751 00000C92 83C404                   add  sp, 4
  2752 00000C95 08C0                     or  al, al
  2753 00000C97 0F840600                 je .getlex128
  2754 00000C9B B81102                   mov ax, 529
  2755 00000C9E E9CB01                   jmp .retngetlex
  2756                                  
  2757                                  ;-448     if (eqstr(symbol,"int"     )) return T_INT;
  2758                                  
  2759                                  .getlex128:
  2760 00000CA1 68[990E]                 push getlex_4
  2761 00000CA4 8D06606D                 lea  ax, [symbol]
  2762 00000CA8 50                       push ax
  2763 00000CA9 E8B3F5                   call eqstr
  2764 00000CAC 83C404                   add  sp, 4
  2765 00000CAF 08C0                     or  al, al
  2766 00000CB1 0F840600                 je .getlex129
  2767 00000CB5 B80502                   mov ax, 517
  2768 00000CB8 E9B101                   jmp .retngetlex
  2769                                  
  2770                                  ;-449     if (eqstr(symbol,"long"    )) return T_LONG;
  2771                                  
  2772                                  .getlex129:
  2773 00000CBB 68[9D0E]                 push getlex_5
  2774 00000CBE 8D06606D                 lea  ax, [symbol]
  2775 00000CC2 50                       push ax
  2776 00000CC3 E899F5                   call eqstr
  2777 00000CC6 83C404                   add  sp, 4
  2778 00000CC9 08C0                     or  al, al
  2779 00000CCB 0F840600                 je .getlex130
  2780 00000CCF B81502                   mov ax, 533
  2781 00000CD2 E99701                   jmp .retngetlex
  2782                                  
  2783                                  ;-450     if (eqstr(symbol,"char"    )) return T_CHAR;
  2784                                  
  2785                                  .getlex130:
  2786 00000CD5 68[A20E]                 push getlex_6
  2787 00000CD8 8D06606D                 lea  ax, [symbol]
  2788 00000CDC 50                       push ax
  2789 00000CDD E87FF5                   call eqstr
  2790 00000CE0 83C404                   add  sp, 4
  2791 00000CE3 08C0                     or  al, al
  2792 00000CE5 0F840600                 je .getlex131
  2793 00000CE9 B81202                   mov ax, 530
  2794 00000CEC E97D01                   jmp .retngetlex
  2795                                  
  2796                                  ;-451     if (eqstr(symbol,"asm"     )) return T_ASM;
  2797                                  
  2798                                  .getlex131:
  2799 00000CEF 68[A70E]                 push getlex_7
  2800 00000CF2 8D06606D                 lea  ax, [symbol]
  2801 00000CF6 50                       push ax
  2802 00000CF7 E865F5                   call eqstr
  2803 00000CFA 83C404                   add  sp, 4
  2804 00000CFD 08C0                     or  al, al
  2805 00000CFF 0F840600                 je .getlex132
  2806 00000D03 B80602                   mov ax, 518
  2807 00000D06 E96301                   jmp .retngetlex
  2808                                  
  2809                                  ;-452     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;
  2810                                  
  2811                                  .getlex132:
  2812 00000D09 68[AB0E]                 push getlex_8
  2813 00000D0C 8D06606D                 lea  ax, [symbol]
  2814 00000D10 50                       push ax
  2815 00000D11 E84BF5                   call eqstr
  2816 00000D14 83C404                   add  sp, 4
  2817 00000D17 08C0                     or  al, al
  2818 00000D19 0F840600                 je .getlex133
  2819 00000D1D B80702                   mov ax, 519
  2820 00000D20 E94901                   jmp .retngetlex
  2821                                  
  2822                                  ;-453     if (eqstr(symbol,"__emit__")) return T_EMIT;
  2823                                  
  2824                                  .getlex133:
  2825 00000D23 68[B10E]                 push getlex_9
  2826 00000D26 8D06606D                 lea  ax, [symbol]
  2827 00000D2A 50                       push ax
  2828 00000D2B E831F5                   call eqstr
  2829 00000D2E 83C404                   add  sp, 4
  2830 00000D31 08C0                     or  al, al
  2831 00000D33 0F840600                 je .getlex134
  2832 00000D37 B80802                   mov ax, 520
  2833 00000D3A E92F01                   jmp .retngetlex
  2834                                  
  2835                                  ;-454     if (eqstr(symbol,"return"  )) return T_RETURN;
  2836                                  
  2837                                  .getlex134:
  2838 00000D3D 68[BA0E]                 push getlex_10
  2839 00000D40 8D06606D                 lea  ax, [symbol]
  2840 00000D44 50                       push ax
  2841 00000D45 E817F5                   call eqstr
  2842 00000D48 83C404                   add  sp, 4
  2843 00000D4B 08C0                     or  al, al
  2844 00000D4D 0F840600                 je .getlex135
  2845 00000D51 B80002                   mov ax, 512
  2846 00000D54 E91501                   jmp .retngetlex
  2847                                  
  2848                                  ;-455     if (eqstr(symbol,"if"      )) return T_IF;
  2849                                  
  2850                                  .getlex135:
  2851 00000D57 68[C10E]                 push getlex_11
  2852 00000D5A 8D06606D                 lea  ax, [symbol]
  2853 00000D5E 50                       push ax
  2854 00000D5F E8FDF4                   call eqstr
  2855 00000D62 83C404                   add  sp, 4
  2856 00000D65 08C0                     or  al, al
  2857 00000D67 0F840600                 je .getlex136
  2858 00000D6B B80102                   mov ax, 513
  2859 00000D6E E9FB00                   jmp .retngetlex
  2860                                  
  2861                                  ;-456     if (eqstr(symbol,"else"    )) return T_ELSE;
  2862                                  
  2863                                  .getlex136:
  2864 00000D71 68[C40E]                 push getlex_12
  2865 00000D74 8D06606D                 lea  ax, [symbol]
  2866 00000D78 50                       push ax
  2867 00000D79 E8E3F4                   call eqstr
  2868 00000D7C 83C404                   add  sp, 4
  2869 00000D7F 08C0                     or  al, al
  2870 00000D81 0F840600                 je .getlex137
  2871 00000D85 B80202                   mov ax, 514
  2872 00000D88 E9E100                   jmp .retngetlex
  2873                                  
  2874                                  ;-457     if (eqstr(symbol,"while"   )) return T_WHILE;
  2875                                  
  2876                                  .getlex137:
  2877 00000D8B 68[C90E]                 push getlex_13
  2878 00000D8E 8D06606D                 lea  ax, [symbol]
  2879 00000D92 50                       push ax
  2880 00000D93 E8C9F4                   call eqstr
  2881 00000D96 83C404                   add  sp, 4
  2882 00000D99 08C0                     or  al, al
  2883 00000D9B 0F840600                 je .getlex138
  2884 00000D9F B80302                   mov ax, 515
  2885 00000DA2 E9C700                   jmp .retngetlex
  2886                                  
  2887                                  ;-458     if (eqstr(symbol,"do"      )) return T_DO;
  2888                                  
  2889                                  .getlex138:
  2890 00000DA5 68[CF0E]                 push getlex_14
  2891 00000DA8 8D06606D                 lea  ax, [symbol]
  2892 00000DAC 50                       push ax
  2893 00000DAD E8AFF4                   call eqstr
  2894 00000DB0 83C404                   add  sp, 4
  2895 00000DB3 08C0                     or  al, al
  2896 00000DB5 0F840600                 je .getlex139
  2897 00000DB9 B80402                   mov ax, 516
  2898 00000DBC E9AD00                   jmp .retngetlex
  2899                                  
  2900                                  ;-459     if (eqstr(symbol,"goto"    )) return T_GOTO;
  2901                                  
  2902                                  .getlex139:
  2903 00000DBF 68[D20E]                 push getlex_15
  2904 00000DC2 8D06606D                 lea  ax, [symbol]
  2905 00000DC6 50                       push ax
  2906 00000DC7 E895F4                   call eqstr
  2907 00000DCA 83C404                   add  sp, 4
  2908 00000DCD 08C0                     or  al, al
  2909 00000DCF 0F840600                 je .getlex140
  2910 00000DD3 B80902                   mov ax, 521
  2911 00000DD6 E99300                   jmp .retngetlex
  2912                                  
  2913                                  ;-460     if (eqstr(symbol,"define"  )) return T_DEFINE;
  2914                                  
  2915                                  .getlex140:
  2916 00000DD9 68[D70E]                 push getlex_16
  2917 00000DDC 8D06606D                 lea  ax, [symbol]
  2918 00000DE0 50                       push ax
  2919 00000DE1 E87BF4                   call eqstr
  2920 00000DE4 83C404                   add  sp, 4
  2921 00000DE7 08C0                     or  al, al
  2922 00000DE9 0F840600                 je .getlex141
  2923 00000DED B8FF01                   mov ax, 511
  2924 00000DF0 E97900                   jmp .retngetlex
  2925                                  
  2926                                  ;-461 
  2927                                  
  2928                                  
  2929                                  ;-462     i=0;//convert define to value
  2930                                  
  2931                                  .getlex141:
  2932 00000DF3 B80000                   mov ax, 0
  2933 00000DF6 8946FA                   mov [bp-6], ax
  2934                                  
  2935                                  ;-463     while (i < GTop) {
  2936                                  
  2937                                  .getlex142:
  2938 00000DF9 8B46FA                   mov ax, [bp-6]
  2939 00000DFC 3B06[3800]               cmp ax, [GTop]
  2940 00000E00 0F8D5900                 jge .getlex143
  2941                                  
  2942                                  ;-464         j=adrF(GNameField, i);
  2943                                  
  2944 00000E04 FF76FA                   push word [bp-6]
  2945 00000E07 8D067976                 lea  ax, [GNameField]
  2946 00000E0B 50                       push ax
  2947 00000E0C E886F9                   call adrF
  2948 00000E0F 83C404                   add  sp, 4
  2949 00000E12 8946F8                   mov [bp-8], ax
  2950                                  
  2951                                  ;-465         if (eqstr(symbol,j)) {
  2952                                  
  2953 00000E15 FF76F8                   push word [bp-8]
  2954 00000E18 8D06606D                 lea  ax, [symbol]
  2955 00000E1C 50                       push ax
  2956 00000E1D E83FF4                   call eqstr
  2957 00000E20 83C404                   add  sp, 4
  2958 00000E23 08C0                     or  al, al
  2959 00000E25 0F842F00                 je .getlex144
  2960                                  
  2961                                  ;-466             if (GType[i]=='#') {
  2962                                  
  2963 00000E29 8B5EFA                   mov bx, [bp-6]
  2964 00000E2C 8A87A96E                 mov al, [GType + bx]
  2965 00000E30 3C23                     cmp al, 35
  2966 00000E32 0F852200                 jne .getlex145
  2967                                  
  2968                                  ;-467                 lexval=GData[i];
  2969                                  
  2970 00000E36 8B5EFA                   mov bx, [bp-6]
  2971 00000E39 D1E3                     shl bx, 1
  2972 00000E3B 8B875973                 mov ax, [GData + bx]
  2973 00000E3F A3[2B00]                 mov word [lexval], ax
  2974                                  
  2975                                  ;-468                 strcpy(symbol, symboltemp);
  2976                                  
  2977 00000E42 8D06B9A2                 lea  ax, [symboltemp]
  2978 00000E46 50                       push ax
  2979 00000E47 8D06606D                 lea  ax, [symbol]
  2980 00000E4B 50                       push ax
  2981 00000E4C E8DAF3                   call strcpy
  2982 00000E4F 83C404                   add  sp, 4
  2983                                  
  2984                                  ;-469                 return T_CONST;
  2985                                  
  2986 00000E52 B80101                   mov ax, 257
  2987 00000E55 E91400                   jmp .retngetlex
  2988                                  
  2989                                  ;-470             }
  2990                                  
  2991                                  
  2992                                  ;-471         }
  2993                                  
  2994                                  .getlex145:
  2995                                  
  2996                                  ;-472         i++;
  2997                                  
  2998                                  .getlex144:
  2999 00000E58 FF46FA                   inc  word[bp-6]
  3000                                  
  3001                                  ;-473     }
  3002                                  
  3003                                  
  3004                                  ;-474     return T_NAME; } error1("Input item not recognized");
  3005                                  
  3006 00000E5B EB9C                     jmp .getlex142
  3007                                  .getlex143:
  3008 00000E5D B80001                   mov ax, 256
  3009 00000E60 E90900                   jmp .retngetlex
  3010                                  .getlex123:
  3011 00000E63 68[DE0E]                 push getlex_17
  3012 00000E66 E832F7                   call error1
  3013 00000E69 83C402                   add  sp, 2
  3014                                  
  3015                                  ;-475 }
  3016                                  
  3017                                  
  3018                                  ;-476 
  3019                                  
  3020                                  
  3021                                  ;-477 int istoken(int t) {
  3022                                  
  3023 00000E6C C9                       .retngetlex: LEAVE
  3024 00000E6D C3                       ret
  3025 00000E6E 28295B5D7B7D2C3B2A-     getlex_0 db "()[]{},;*:%-><=+!&|#?",0
  3026 00000E77 3A252D3E3C3D2B2126-
  3027 00000E80 7C233F00           
  3028 00000E84 7369676E656400          getlex_1 db "signed",0
  3029 00000E8B 756E7369676E656400      getlex_2 db "unsigned",0
  3030 00000E94 766F696400              getlex_3 db "void",0
  3031 00000E99 696E7400                getlex_4 db "int",0
  3032 00000E9D 6C6F6E6700              getlex_5 db "long",0
  3033 00000EA2 6368617200              getlex_6 db "char",0
  3034 00000EA7 61736D00                getlex_7 db "asm",0
  3035 00000EAB 5F5F61736D00            getlex_8 db "__asm",0
  3036 00000EB1 5F5F656D69745F5F00      getlex_9 db "__emit__",0
  3037 00000EBA 72657475726E00          getlex_10 db "return",0
  3038 00000EC1 696600                  getlex_11 db "if",0
  3039 00000EC4 656C736500              getlex_12 db "else",0
  3040 00000EC9 7768696C6500            getlex_13 db "while",0
  3041 00000ECF 646F00                  getlex_14 db "do",0
  3042 00000ED2 676F746F00              getlex_15 db "goto",0
  3043 00000ED7 646566696E6500          getlex_16 db "define",0
  3044 00000EDE 496E70757420697465-     getlex_17 db "Input item not recognized",0
  3045 00000EE7 6D206E6F7420726563-
  3046 00000EF0 6F676E697A656400   
  3047                                  ENDP
  3048                                  
  3049                                  istoken: PROC
  3050                                  
  3051                                  ;-478     if (token == t) {
  3052                                  ;
  3053 00000EF8 C8000000                 ENTER  0,0
  3054 00000EFC A1[1E00]                 mov ax, [token]
  3055 00000EFF 3B4604                   cmp ax, [bp+4]
  3056 00000F02 0F850C00                 jne .istoken146
  3057                                  
  3058                                  ;-479         token=getlex();
  3059                                  
  3060 00000F06 E83DF9                   call getlex
  3061 00000F09 A3[1E00]                 mov word [token], ax
  3062                                  
  3063                                  ;-480         return 1;
  3064                                  
  3065 00000F0C B80100                   mov ax, 1
  3066 00000F0F E90600                   jmp .retnistoken
  3067                                  
  3068                                  ;-481     }
  3069                                  
  3070                                  
  3071                                  ;-482     return 0;
  3072                                  
  3073                                  .istoken146:
  3074 00000F12 B80000                   mov ax, 0
  3075 00000F15 E90000                   jmp .retnistoken
  3076                                  
  3077                                  ;-483 }
  3078                                  
  3079                                  
  3080                                  ;-484 int expect(int t) {
  3081                                  
  3082 00000F18 C9                       .retnistoken: LEAVE
  3083 00000F19 C3                       ret
  3084                                  ENDP
  3085                                  
  3086                                  expect: PROC
  3087                                  
  3088                                  ;-485     if (istoken(t)==0) {
  3089                                  ;
  3090 00000F1A C8000000                 ENTER  0,0
  3091 00000F1E FF7604                   push word [bp+4]
  3092 00000F21 E8D4FF                   call istoken
  3093 00000F24 83C402                   add  sp, 2
  3094 00000F27 83F800                   cmp ax, 0
  3095 00000F2A 0F852F00                 jne .expect147
  3096                                  
  3097                                  ;-486         *cloc=0;
  3098                                  
  3099 00000F2E B80000                   mov ax, 0
  3100 00000F31 8B1E[1800]               mov  bx, [cloc]
  3101 00000F35 8807                     mov  [bx], al
  3102                                  
  3103                                  ;-487         prs(co);
  3104                                  
  3105 00000F37 8D06A861                 lea  ax, [co]
  3106 00000F3B 50                       push ax
  3107 00000F3C E8A0F4                   call prs
  3108 00000F3F 83C402                   add  sp, 2
  3109                                  
  3110                                  ;-488         prs("\nExpected ASCII(dez): ");
  3111                                  
  3112 00000F42 68[5F0F]                 push expect_0
  3113 00000F45 E897F4                   call prs
  3114 00000F48 83C402                   add  sp, 2
  3115                                  
  3116                                  ;-489         pint1(t);
  3117                                  
  3118 00000F4B FF7604                   push word [bp+4]
  3119 00000F4E E885F5                   call pint1
  3120 00000F51 83C402                   add  sp, 2
  3121                                  
  3122                                  ;-490         error1(" not found");
  3123                                  
  3124 00000F54 68[770F]                 push expect_1
  3125 00000F57 E841F6                   call error1
  3126 00000F5A 83C402                   add  sp, 2
  3127                                  
  3128                                  ;-491     }
  3129                                  
  3130                                  
  3131                                  ;-492 }
  3132                                  
  3133                                  .expect147:
  3134                                  
  3135                                  ;-493 
  3136                                  
  3137                                  
  3138                                  ;-494 int v(unsigned int i) {//value
  3139 00000F5D C9                       LEAVE
  3140 00000F5E C3                       ret
  3141 00000F5F 5C6E45787065637465-     expect_0 db "\nExpected ASCII(dez): ",0
  3142 00000F68 642041534349492864-
  3143 00000F71 657A293A2000       
  3144 00000F77 206E6F7420666F756E-     expect_1 db " not found",0
  3145 00000F80 6400               
  3146                                  ENDP
  3147                                  
  3148                                  v: PROC
  3149                                  
  3150                                  ;-495     if (i < LSTART) prc('[');
  3151                                  ;
  3152 00000F82 C8000000                 ENTER  0,0
  3153 00000F86 8B4604                   mov ax, [bp+4]
  3154 00000F89 3DC800                   cmp ax, 200
  3155 00000F8C 0F8D0800                 jge .v148
  3156 00000F90 6A5B                     push 91
  3157 00000F92 E8F1F3                   call prc
  3158 00000F95 83C402                   add  sp, 2
  3159                                  
  3160                                  ;-496     printName(i);
  3161                                  
  3162                                  .v148:
  3163 00000F98 FF7604                   push word [bp+4]
  3164 00000F9B E806F8                   call printName
  3165 00000F9E 83C402                   add  sp, 2
  3166                                  
  3167                                  ;-497     if (i < LSTART) prc(']');
  3168                                  
  3169 00000FA1 8B4604                   mov ax, [bp+4]
  3170 00000FA4 3DC800                   cmp ax, 200
  3171 00000FA7 0F8D0800                 jge .v149
  3172 00000FAB 6A5D                     push 93
  3173 00000FAD E8D6F3                   call prc
  3174 00000FB0 83C402                   add  sp, 2
  3175                                  
  3176                                  ;-498 }
  3177                                  
  3178                                  .v149:
  3179                                  
  3180                                  ;-499 int checknamelen() {
  3181 00000FB3 C9                       LEAVE
  3182 00000FB4 C3                       ret
  3183                                  ENDP
  3184                                  
  3185                                  checknamelen: PROC
  3186                                  
  3187                                  ;-500     int i;
  3188                                  
  3189                                  
  3190                                  ;-501     i=strlen(symbol);
  3191                                  ;
  3192 00000FB5 C8020000                 ENTER  2,0
  3193 00000FB9 8D06606D                 lea  ax, [symbol]
  3194 00000FBD 50                       push ax
  3195 00000FBE E840F2                   call strlen
  3196 00000FC1 83C402                   add  sp, 2
  3197 00000FC4 8946FE                   mov [bp-2], ax
  3198                                  
  3199                                  ;-502     if (i > IDLENMAX) error1("Item name is too long in characters)");
  3200                                  
  3201 00000FC7 8B46FE                   mov ax, [bp-2]
  3202 00000FCA 83F80F                   cmp ax, 15
  3203 00000FCD 0F8E0900                 jle .checknamelen150
  3204 00000FD1 68[DC0F]                 push checknamelen_0
  3205 00000FD4 E8C4F5                   call error1
  3206 00000FD7 83C402                   add  sp, 2
  3207                                  
  3208                                  ;-503 }
  3209                                  
  3210                                  .checknamelen150:
  3211                                  
  3212                                  ;-504 
  3213                                  
  3214                                  
  3215                                  ;-505 int checkName() { unsigned int i; unsigned int j;
  3216 00000FDA C9                       LEAVE
  3217 00000FDB C3                       ret
  3218 00000FDC 4974656D206E616D65-     checknamelen_0 db "Item name is too long in characters)",0
  3219 00000FE5 20697320746F6F206C-
  3220 00000FEE 6F6E6720696E206368-
  3221 00000FF7 617261637465727329-
  3222 00001000 00                 
  3223                                  ENDP
  3224                                  
  3225                                  checkName: PROC
  3226                                  
  3227                                  ;-506     i=LSTART;
  3228                                  ;
  3229 00001001 C8040000                 ENTER  4,0
  3230 00001005 B8C800                   mov ax, 200
  3231 00001008 8946FE                   mov [bp-2], ax
  3232                                  
  3233                                  ;-507     while(i<LTop) {
  3234                                  
  3235                                  .checkName151:
  3236 0000100B 8B46FE                   mov ax, [bp-2]
  3237 0000100E 3B06[3A00]               cmp ax, [LTop]
  3238 00001012 0F8D3000                 jge .checkName152
  3239                                  
  3240                                  ;-508         j=adrF(GNameField, i);
  3241                                  
  3242 00001016 FF76FE                   push word [bp-2]
  3243 00001019 8D067976                 lea  ax, [GNameField]
  3244 0000101D 50                       push ax
  3245 0000101E E874F7                   call adrF
  3246 00001021 83C404                   add  sp, 4
  3247 00001024 8946FC                   mov [bp-4], ax
  3248                                  
  3249                                  ;-509         if(eqstr(symbol,j))return i;
  3250                                  
  3251 00001027 FF76FC                   push word [bp-4]
  3252 0000102A 8D06606D                 lea  ax, [symbol]
  3253 0000102E 50                       push ax
  3254 0000102F E82DF2                   call eqstr
  3255 00001032 83C404                   add  sp, 4
  3256 00001035 08C0                     or  al, al
  3257 00001037 0F840600                 je .checkName153
  3258 0000103B 8B46FE                   mov ax, [bp-2]
  3259 0000103E E94C00                   jmp .retncheckName
  3260                                  
  3261                                  ;-510         i++;
  3262                                  
  3263                                  .checkName153:
  3264 00001041 FF46FE                   inc  word[bp-2]
  3265                                  
  3266                                  ;-511     }
  3267                                  
  3268                                  
  3269                                  ;-512     i=1;
  3270                                  
  3271 00001044 EBC5                     jmp .checkName151
  3272                                  .checkName152:
  3273 00001046 B80100                   mov ax, 1
  3274 00001049 8946FE                   mov [bp-2], ax
  3275                                  
  3276                                  ;-513     while(i<GTop) {
  3277                                  
  3278                                  .checkName154:
  3279 0000104C 8B46FE                   mov ax, [bp-2]
  3280 0000104F 3B06[3800]               cmp ax, [GTop]
  3281 00001053 0F8D3000                 jge .checkName155
  3282                                  
  3283                                  ;-514         j=adrF(GNameField, i);
  3284                                  
  3285 00001057 FF76FE                   push word [bp-2]
  3286 0000105A 8D067976                 lea  ax, [GNameField]
  3287 0000105E 50                       push ax
  3288 0000105F E833F7                   call adrF
  3289 00001062 83C404                   add  sp, 4
  3290 00001065 8946FC                   mov [bp-4], ax
  3291                                  
  3292                                  ;-515         if(eqstr(symbol,j))return i;
  3293                                  
  3294 00001068 FF76FC                   push word [bp-4]
  3295 0000106B 8D06606D                 lea  ax, [symbol]
  3296 0000106F 50                       push ax
  3297 00001070 E8ECF1                   call eqstr
  3298 00001073 83C404                   add  sp, 4
  3299 00001076 08C0                     or  al, al
  3300 00001078 0F840600                 je .checkName156
  3301 0000107C 8B46FE                   mov ax, [bp-2]
  3302 0000107F E90B00                   jmp .retncheckName
  3303                                  
  3304                                  ;-516         i++;
  3305                                  
  3306                                  .checkName156:
  3307 00001082 FF46FE                   inc  word[bp-2]
  3308                                  
  3309                                  ;-517     }
  3310                                  
  3311                                  
  3312                                  ;-518     return 0;
  3313                                  
  3314 00001085 EBC5                     jmp .checkName154
  3315                                  .checkName155:
  3316 00001087 B80000                   mov ax, 0
  3317 0000108A E90000                   jmp .retncheckName
  3318                                  
  3319                                  ;-519 }
  3320                                  
  3321                                  
  3322                                  ;-520 int searchname() { unsigned int i;
  3323                                  
  3324 0000108D C9                       .retncheckName: LEAVE
  3325 0000108E C3                       ret
  3326                                  ENDP
  3327                                  
  3328                                  searchname: PROC
  3329                                  
  3330                                  ;-521   i=checkName(); if (i == 0) error1("Variable unknown");
  3331                                  ;
  3332 0000108F C8020000                 ENTER  2,0
  3333 00001093 E86BFF                   call checkName
  3334 00001096 8946FE                   mov [bp-2], ax
  3335 00001099 8B46FE                   mov ax, [bp-2]
  3336 0000109C 83F800                   cmp ax, 0
  3337 0000109F 0F850900                 jne .searchname157
  3338 000010A3 68[B410]                 push searchname_0
  3339 000010A6 E8F2F4                   call error1
  3340 000010A9 83C402                   add  sp, 2
  3341                                  
  3342                                  ;-522   return i;
  3343                                  
  3344                                  .searchname157:
  3345 000010AC 8B46FE                   mov ax, [bp-2]
  3346 000010AF E90000                   jmp .retnsearchname
  3347                                  
  3348                                  ;-523 }
  3349                                  
  3350                                  
  3351                                  ;-524 int name1() {
  3352                                  
  3353 000010B2 C9                       .retnsearchname: LEAVE
  3354 000010B3 C3                       ret
  3355 000010B4 5661726961626C6520-     searchname_0 db "Variable unknown",0
  3356 000010BD 756E6B6E6F776E00   
  3357                                  ENDP
  3358                                  
  3359                                  name1: PROC
  3360                                  
  3361                                  ;-525     if (token!=T_NAME) error1("Name expected");
  3362                                  
  3363 000010C5 A1[1E00]                 mov ax, [token]
  3364 000010C8 3D0001                   cmp ax, 256
  3365 000010CB 0F840900                 je  .name1158
  3366 000010CF 68[DF10]                 push name1_0
  3367 000010D2 E8C6F4                   call error1
  3368 000010D5 83C402                   add  sp, 2
  3369                                  
  3370                                  ;-526     token=getlex();
  3371                                  
  3372                                  .name1158:
  3373 000010D8 E86BF7                   call getlex
  3374 000010DB A3[1E00]                 mov word [token], ax
  3375                                  
  3376                                  ;-527 }
  3377                                  
  3378                                  
  3379                                  ;-528 int typeName() { int m; //0=V,1=*,2=&
  3380                                  
  3381 000010DE C3                       ret
  3382 000010DF 4E616D652065787065-     name1_0 db "Name expected",0
  3383 000010E8 6374656400         
  3384                                  ENDP
  3385                                  
  3386                                  typeName: PROC
  3387                                  
  3388                                  ;-529     issign='S';
  3389                                  ;
  3390 000010ED C8020000                 ENTER  2,0
  3391 000010F1 B85300                   mov ax, 83
  3392 000010F4 A2[3200]                 mov byte [issign], al
  3393                                  
  3394                                  ;-530     if(istoken(T_SIGNED))   issign='S';
  3395                                  
  3396 000010F7 681302                   push 531
  3397 000010FA E8FBFD                   call istoken
  3398 000010FD 83C402                   add  sp, 2
  3399 00001100 08C0                     or  al, al
  3400 00001102 0F840600                 je .typeName159
  3401 00001106 B85300                   mov ax, 83
  3402 00001109 A2[3200]                 mov byte [issign], al
  3403                                  
  3404                                  ;-531     if(istoken(T_UNSIGNED)) issign='U';
  3405                                  
  3406                                  .typeName159:
  3407 0000110C 681402                   push 532
  3408 0000110F E8E6FD                   call istoken
  3409 00001112 83C402                   add  sp, 2
  3410 00001115 08C0                     or  al, al
  3411 00001117 0F840600                 je .typeName160
  3412 0000111B B85500                   mov ax, 85
  3413 0000111E A2[3200]                 mov byte [issign], al
  3414                                  
  3415                                  ;-532     iswidth=2;
  3416                                  
  3417                                  .typeName160:
  3418 00001121 B80200                   mov ax, 2
  3419 00001124 A2[3500]                 mov byte [iswidth], al
  3420                                  
  3421                                  ;-533     if(istoken(T_VOID))     iswidth=0;
  3422                                  
  3423 00001127 681102                   push 529
  3424 0000112A E8CBFD                   call istoken
  3425 0000112D 83C402                   add  sp, 2
  3426 00001130 08C0                     or  al, al
  3427 00001132 0F840600                 je .typeName161
  3428 00001136 B80000                   mov ax, 0
  3429 00001139 A2[3500]                 mov byte [iswidth], al
  3430                                  
  3431                                  ;-534     if(istoken(T_CHAR))     iswidth=1;
  3432                                  
  3433                                  .typeName161:
  3434 0000113C 681202                   push 530
  3435 0000113F E8B6FD                   call istoken
  3436 00001142 83C402                   add  sp, 2
  3437 00001145 08C0                     or  al, al
  3438 00001147 0F840600                 je .typeName162
  3439 0000114B B80100                   mov ax, 1
  3440 0000114E A2[3500]                 mov byte [iswidth], al
  3441                                  
  3442                                  ;-535     if(istoken(T_INT))      iswidth=2;
  3443                                  
  3444                                  .typeName162:
  3445 00001151 680502                   push 517
  3446 00001154 E8A1FD                   call istoken
  3447 00001157 83C402                   add  sp, 2
  3448 0000115A 08C0                     or  al, al
  3449 0000115C 0F840600                 je .typeName163
  3450 00001160 B80200                   mov ax, 2
  3451 00001163 A2[3500]                 mov byte [iswidth], al
  3452                                  
  3453                                  ;-536     if(istoken(T_LONG))     iswidth=4;
  3454                                  
  3455                                  .typeName163:
  3456 00001166 681502                   push 533
  3457 00001169 E88CFD                   call istoken
  3458 0000116C 83C402                   add  sp, 2
  3459 0000116F 08C0                     or  al, al
  3460 00001171 0F840600                 je .typeName164
  3461 00001175 B80400                   mov ax, 4
  3462 00001178 A2[3500]                 mov byte [iswidth], al
  3463                                  
  3464                                  ;-537     istype='V';
  3465                                  
  3466                                  .typeName164:
  3467 0000117B B85600                   mov ax, 86
  3468 0000117E A2[2F00]                 mov byte [istype], al
  3469                                  
  3470                                  ;-538     m=0;
  3471                                  
  3472 00001181 B80000                   mov ax, 0
  3473 00001184 8946FE                   mov [bp-2], ax
  3474                                  
  3475                                  ;-539     if(istoken('*'))  {istype='*'; m=1;}
  3476                                  
  3477 00001187 6A2A                     push 42
  3478 00001189 E86CFD                   call istoken
  3479 0000118C 83C402                   add  sp, 2
  3480 0000118F 08C0                     or  al, al
  3481 00001191 0F840C00                 je .typeName165
  3482 00001195 B82A00                   mov ax, 42
  3483 00001198 A2[2F00]                 mov byte [istype], al
  3484 0000119B B80100                   mov ax, 1
  3485 0000119E 8946FE                   mov [bp-2], ax
  3486                                  
  3487                                  ;-540     if(istoken('&'))  {istype='&'; m=2;}
  3488                                  
  3489                                  .typeName165:
  3490 000011A1 6A26                     push 38
  3491 000011A3 E852FD                   call istoken
  3492 000011A6 83C402                   add  sp, 2
  3493 000011A9 08C0                     or  al, al
  3494 000011AB 0F840C00                 je .typeName166
  3495 000011AF B82600                   mov ax, 38
  3496 000011B2 A2[2F00]                 mov byte [istype], al
  3497 000011B5 B80200                   mov ax, 2
  3498 000011B8 8946FE                   mov [bp-2], ax
  3499                                  
  3500                                  ;-541     name1();
  3501                                  
  3502                                  .typeName166:
  3503 000011BB E807FF                   call name1
  3504                                  
  3505                                  ;-542     return m;
  3506                                  
  3507 000011BE 8B46FE                   mov ax, [bp-2]
  3508 000011C1 E90000                   jmp .retntypeName
  3509                                  
  3510                                  ;-543 }
  3511                                  
  3512                                  
  3513                                  ;-544 int gettypes(int i) {int j; char c;
  3514                                  
  3515 000011C4 C9                       .retntypeName: LEAVE
  3516 000011C5 C3                       ret
  3517                                  ENDP
  3518                                  
  3519                                  gettypes: PROC
  3520                                  
  3521                                  ;-545   c=GSign [i]; if (c=='S') signi =1;    else signi =0;
  3522                                  ;
  3523 000011C6 C8040000                 ENTER  4,0
  3524 000011CA 8B5E04                   mov bx, [bp+4]
  3525 000011CD 8A873970                 mov al, [GSign + bx]
  3526 000011D1 8846FC                   mov [bp-4], al
  3527 000011D4 8A46FC                   mov al, [bp-4]
  3528 000011D7 3C53                     cmp al, 83
  3529 000011D9 0F850900                 jne .gettypes167
  3530 000011DD B80100                   mov ax, 1
  3531 000011E0 A3[3000]                 mov word [signi], ax
  3532 000011E3 E90600                   jmp .gettypes168
  3533                                  .gettypes167:
  3534 000011E6 B80000                   mov ax, 0
  3535 000011E9 A3[3000]                 mov word [signi], ax
  3536                                  
  3537                                  ;-546   c=GWidth[i]; widthi=0;wi=0;
  3538                                  
  3539                                  .gettypes168:
  3540 000011EC 8B5E04                   mov bx, [bp+4]
  3541 000011EF 8A87C971                 mov al, [GWidth + bx]
  3542 000011F3 8846FC                   mov [bp-4], al
  3543 000011F6 B80000                   mov ax, 0
  3544 000011F9 A3[3300]                 mov word [widthi], ax
  3545 000011FC B80000                   mov ax, 0
  3546 000011FF A3[3600]                 mov word [wi], ax
  3547                                  
  3548                                  ;-547   if (c==1) {widthi=1;wi=1;}
  3549                                  
  3550 00001202 8A46FC                   mov al, [bp-4]
  3551 00001205 3C01                     cmp al, 1
  3552 00001207 0F850C00                 jne .gettypes169
  3553 0000120B B80100                   mov ax, 1
  3554 0000120E A3[3300]                 mov word [widthi], ax
  3555 00001211 B80100                   mov ax, 1
  3556 00001214 A3[3600]                 mov word [wi], ax
  3557                                  
  3558                                  ;-548   if (c==2) {widthi=2;wi=2;}
  3559                                  
  3560                                  .gettypes169:
  3561 00001217 8A46FC                   mov al, [bp-4]
  3562 0000121A 3C02                     cmp al, 2
  3563 0000121C 0F850C00                 jne .gettypes170
  3564 00001220 B80200                   mov ax, 2
  3565 00001223 A3[3300]                 mov word [widthi], ax
  3566 00001226 B80200                   mov ax, 2
  3567 00001229 A3[3600]                 mov word [wi], ax
  3568                                  
  3569                                  ;-549   if (c==4) {widthi=4;wi=4;}
  3570                                  
  3571                                  .gettypes170:
  3572 0000122C 8A46FC                   mov al, [bp-4]
  3573 0000122F 3C04                     cmp al, 4
  3574 00001231 0F850C00                 jne .gettypes171
  3575 00001235 B80400                   mov ax, 4
  3576 00001238 A3[3300]                 mov word [widthi], ax
  3577 0000123B B80400                   mov ax, 4
  3578 0000123E A3[3600]                 mov word [wi], ax
  3579                                  
  3580                                  ;-550   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}
  3581                                  
  3582                                  .gettypes171:
  3583 00001241 8B5E04                   mov bx, [bp+4]
  3584 00001244 8A87A96E                 mov al, [GType + bx]
  3585 00001248 8846FC                   mov [bp-4], al
  3586 0000124B B80000                   mov ax, 0
  3587 0000124E A3[2D00]                 mov word [typei], ax
  3588 00001251 8A46FC                   mov al, [bp-4]
  3589 00001254 3C2A                     cmp al, 42
  3590 00001256 0F850C00                 jne .gettypes172
  3591 0000125A B80100                   mov ax, 1
  3592 0000125D A3[2D00]                 mov word [typei], ax
  3593 00001260 B80200                   mov ax, 2
  3594 00001263 A3[3600]                 mov word [wi], ax
  3595                                  
  3596                                  ;-551   if (c=='&')  typei=2;
  3597                                  
  3598                                  .gettypes172:
  3599 00001266 8A46FC                   mov al, [bp-4]
  3600 00001269 3C26                     cmp al, 38
  3601 0000126B 0F850600                 jne .gettypes173
  3602 0000126F B80200                   mov ax, 2
  3603 00001272 A3[2D00]                 mov word [typei], ax
  3604                                  
  3605                                  ;-552   return i; }
  3606                                  
  3607                                  .gettypes173:
  3608 00001275 8B4604                   mov ax, [bp+4]
  3609 00001278 E90000                   jmp .retngettypes
  3610                                  
  3611                                  ;-553 
  3612                                  
  3613                                  
  3614                                  ;-554 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");
  3615                                  
  3616 0000127B C9                       .retngettypes: LEAVE
  3617 0000127C C3                       ret
  3618                                  ENDP
  3619                                  
  3620                                  addlocal: PROC
  3621 0000127D A1[3A00]                 mov ax, [LTop]
  3622 00001280 3D9001                   cmp ax, 400 ;unsigned : 1
  3623 00001283 0F8C0900                 jl  .addlocal174
  3624 00001287 68[E612]                 push addlocal_0
  3625 0000128A E80EF3                   call error1
  3626 0000128D 83C402                   add  sp, 2
  3627                                  
  3628                                  ;-555   if (checkName() != 0) error1("Variable already defined");
  3629                                  
  3630                                  .addlocal174:
  3631 00001290 E86EFD                   call checkName
  3632 00001293 83F800                   cmp ax, 0
  3633 00001296 0F840900                 je  .addlocal175
  3634 0000129A 68[0013]                 push addlocal_1
  3635 0000129D E8FBF2                   call error1
  3636 000012A0 83C402                   add  sp, 2
  3637                                  
  3638                                  ;-556   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;
  3639                                  
  3640                                  .addlocal175:
  3641 000012A3 A0[3200]                 mov al, [issign]
  3642 000012A6 8B1E[3A00]               mov bx, [LTop]
  3643 000012AA 88873970                 mov [GSign+bx], al
  3644 000012AE A0[3500]                 mov al, [iswidth]
  3645 000012B1 8B1E[3A00]               mov bx, [LTop]
  3646 000012B5 8887C971                 mov [GWidth+bx], al
  3647 000012B9 A0[2F00]                 mov al, [istype]
  3648 000012BC 8B1E[3A00]               mov bx, [LTop]
  3649 000012C0 8887A96E                 mov [GType+bx], al
  3650                                  
  3651                                  ;-557   pt=adrF(GNameField, LTop); strcpy(pt, symbol);
  3652                                  
  3653 000012C4 FF36[3A00]               push word [LTop]
  3654 000012C8 8D067976                 lea  ax, [GNameField]
  3655 000012CC 50                       push ax
  3656 000012CD E8C5F4                   call adrF
  3657 000012D0 83C404                   add  sp, 4
  3658 000012D3 A3[4200]                 mov word [pt], ax
  3659 000012D6 8D06606D                 lea  ax, [symbol]
  3660 000012DA 50                       push ax
  3661 000012DB FF36[4200]               push word [pt]
  3662 000012DF E847EF                   call strcpy
  3663 000012E2 83C404                   add  sp, 4
  3664                                  
  3665                                  ;-558 }
  3666                                  
  3667                                  
  3668                                  ;-559 
  3669                                  
  3670                                  
  3671                                  ;-560 int isvariable() {
  3672                                  
  3673 000012E5 C3                       ret
  3674 000012E6 4C6F63616C20766172-     addlocal_0 db "Local variable table full",0
  3675 000012EF 6961626C6520746162-
  3676 000012F8 6C652066756C6C00   
  3677 00001300 5661726961626C6520-     addlocal_1 db "Variable already defined",0
  3678 00001309 616C72656164792064-
  3679 00001312 6566696E656400     
  3680                                  ENDP
  3681                                  
  3682                                  isvariable: PROC
  3683                                  
  3684                                  ;-561     if(token==T_SIGNED)   goto v1;
  3685                                  
  3686 00001319 A1[1E00]                 mov ax, [token]
  3687 0000131C 3D1302                   cmp ax, 531
  3688 0000131F 0F850300                 jne .isvariable176
  3689 00001323 E93A00                   jmp .v1
  3690                                  
  3691                                  ;-562     if(token==T_UNSIGNED) goto v1;
  3692                                  
  3693                                  .isvariable176:
  3694 00001326 A1[1E00]                 mov ax, [token]
  3695 00001329 3D1402                   cmp ax, 532
  3696 0000132C 0F850300                 jne .isvariable177
  3697 00001330 E92D00                   jmp .v1
  3698                                  
  3699                                  ;-563     if(token==T_CHAR)     goto v1;
  3700                                  
  3701                                  .isvariable177:
  3702 00001333 A1[1E00]                 mov ax, [token]
  3703 00001336 3D1202                   cmp ax, 530
  3704 00001339 0F850300                 jne .isvariable178
  3705 0000133D E92000                   jmp .v1
  3706                                  
  3707                                  ;-564     if(token==T_INT)      goto v1;
  3708                                  
  3709                                  .isvariable178:
  3710 00001340 A1[1E00]                 mov ax, [token]
  3711 00001343 3D0502                   cmp ax, 517
  3712 00001346 0F850300                 jne .isvariable179
  3713 0000134A E91300                   jmp .v1
  3714                                  
  3715                                  ;-565     if(token==T_LONG)     goto v1;
  3716                                  
  3717                                  .isvariable179:
  3718 0000134D A1[1E00]                 mov ax, [token]
  3719 00001350 3D1502                   cmp ax, 533
  3720 00001353 0F850300                 jne .isvariable180
  3721 00001357 E90600                   jmp .v1
  3722                                  
  3723                                  ;-566     return 0;
  3724                                  
  3725                                  .isvariable180:
  3726 0000135A B80000                   mov ax, 0
  3727 0000135D E90600                   jmp .retnisvariable
  3728                                  
  3729                                  ;-567 v1: return 1;
  3730                                  
  3731                                  .v1:
  3732 00001360 B80100                   mov ax, 1
  3733 00001363 E90000                   jmp .retnisvariable
  3734                                  
  3735                                  ;-568 }
  3736                                  
  3737                                  
  3738                                  ;-569 
  3739                                  
  3740                                  
  3741                                  ;-570 int cmpneg(int ids) {
  3742                                  
  3743                                   .retnisvariable:
  3744 00001366 C3                       ret
  3745                                  ENDP
  3746                                  
  3747                                  cmpneg: PROC
  3748                                  
  3749                                  ;-571        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
  3750                                  ;
  3751 00001367 C8000000                 ENTER  0,0
  3752 0000136B A1[2300]                 mov ax, [iscmp]
  3753 0000136E 3D2603                   cmp ax, 806
  3754 00001371 0F850C00                 jne .cmpneg181
  3755 00001375 68[4814]                 push cmpneg_0
  3756 00001378 E864F0                   call prs
  3757 0000137B 83C402                   add  sp, 2
  3758                                  
  3759                                  ;-572   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1
  3760                                  
  3761 0000137E E9C500                   jmp .cmpneg182
  3762                                  .cmpneg181:
  3763 00001381 A1[2300]                 mov ax, [iscmp]
  3764 00001384 3D2703                   cmp ax, 807
  3765 00001387 0F850C00                 jne .cmpneg183
  3766 0000138B 68[5114]                 push cmpneg_1
  3767 0000138E E84EF0                   call prs
  3768 00001391 83C402                   add  sp, 2
  3769                                  
  3770                                  ;-573   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF
  3771                                  
  3772 00001394 E9AF00                   jmp .cmpneg184
  3773                                  .cmpneg183:
  3774 00001397 A1[2300]                 mov ax, [iscmp]
  3775 0000139A 3D3803                   cmp ax, 824
  3776 0000139D 0F852100                 jne .cmpneg185
  3777 000013A1 8B4604                   mov ax, [bp+4]
  3778 000013A4 08C0                     or  al, al
  3779 000013A6 0F840C00                 je .cmpneg186
  3780 000013AA 68[5A14]                 push cmpneg_2
  3781 000013AD E82FF0                   call prs
  3782 000013B0 83C402                   add  sp, 2
  3783                                  
  3784                                  ;-574                            else prs("\n ja  .");//ZF=0 CF=0
  3785                                  
  3786 000013B3 E90900                   jmp .cmpneg187
  3787                                  .cmpneg186:
  3788 000013B6 68[6314]                 push cmpneg_3
  3789 000013B9 E823F0                   call prs
  3790 000013BC 83C402                   add  sp, 2
  3791                                  
  3792                                  ;-575   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);
  3793                                  
  3794                                  .cmpneg187:
  3795 000013BF E98400                   jmp .cmpneg188
  3796                                  .cmpneg185:
  3797 000013C2 A1[2300]                 mov ax, [iscmp]
  3798 000013C5 3D2B03                   cmp ax, 811
  3799 000013C8 0F854500                 jne .cmpneg189
  3800 000013CC 8B4604                   mov ax, [bp+4]
  3801 000013CF 08C0                     or  al, al
  3802 000013D1 0F841E00                 je .cmpneg190
  3803 000013D5 68[6C14]                 push cmpneg_4
  3804 000013D8 E804F0                   call prs
  3805 000013DB 83C402                   add  sp, 2
  3806 000013DE FF7604                   push word [bp+4]
  3807 000013E1 E850F1                   call prunsign1
  3808 000013E4 83C402                   add  sp, 2
  3809                                  
  3810                                  ;-576                                prs("\n jl  .");}//          SF!=OF
  3811                                  
  3812 000013E7 68[7A14]                 push cmpneg_5
  3813 000013EA E8F2EF                   call prs
  3814 000013ED 83C402                   add  sp, 2
  3815                                  
  3816                                  ;-577                            else{prs(" ;unsigned : "); prunsign1(ids);
  3817                                  
  3818 000013F0 E91B00                   jmp .cmpneg191
  3819                                  .cmpneg190:
  3820 000013F3 68[8314]                 push cmpneg_6
  3821 000013F6 E8E6EF                   call prs
  3822 000013F9 83C402                   add  sp, 2
  3823 000013FC FF7604                   push word [bp+4]
  3824 000013FF E832F1                   call prunsign1
  3825 00001402 83C402                   add  sp, 2
  3826                                  
  3827                                  ;-578                                prs("\n jb  .");}//jb=jc=CF=1
  3828                                  
  3829 00001405 68[9114]                 push cmpneg_7
  3830 00001408 E8D4EF                   call prs
  3831 0000140B 83C402                   add  sp, 2
  3832                                  
  3833                                  ;-579   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF
  3834                                  
  3835                                  .cmpneg191:
  3836 0000140E E93500                   jmp .cmpneg192
  3837                                  .cmpneg189:
  3838 00001411 A1[2300]                 mov ax, [iscmp]
  3839 00001414 83F83C                   cmp ax, 60
  3840 00001417 0F850C00                 jne .cmpneg193
  3841 0000141B 68[9A14]                 push cmpneg_8
  3842 0000141E E8BEEF                   call prs
  3843 00001421 83C402                   add  sp, 2
  3844                                  
  3845                                  ;-580   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF
  3846                                  
  3847 00001424 E91F00                   jmp .cmpneg194
  3848                                  .cmpneg193:
  3849 00001427 A1[2300]                 mov ax, [iscmp]
  3850 0000142A 83F83E                   cmp ax, 62
  3851 0000142D 0F850C00                 jne .cmpneg195
  3852 00001431 68[A314]                 push cmpneg_9
  3853 00001434 E8A8EF                   call prs
  3854 00001437 83C402                   add  sp, 2
  3855                                  
  3856                                  ;-581   else error1("internal error compare unknown in CMPNEG()");  }
  3857                                  
  3858 0000143A E90900                   jmp .cmpneg196
  3859                                  .cmpneg195:
  3860 0000143D 68[AC14]                 push cmpneg_10
  3861 00001440 E858F1                   call error1
  3862 00001443 83C402                   add  sp, 2
  3863                                  .cmpneg196:
  3864                                  .cmpneg194:
  3865                                  .cmpneg192:
  3866                                  .cmpneg188:
  3867                                  .cmpneg184:
  3868                                  .cmpneg182:
  3869                                  
  3870                                  ;-582 
  3871                                  
  3872                                  
  3873                                  ;-583   int isrelational() {
  3874 00001446 C9                       LEAVE
  3875 00001447 C3                       ret
  3876 00001448 5C6E206A6E65202E00      cmpneg_0 db "\n jne .",0
  3877 00001451 5C6E206A6520202E00      cmpneg_1 db "\n je  .",0
  3878 0000145A 5C6E206A6720202E00      cmpneg_2 db "\n jg  .",0
  3879 00001463 5C6E206A6120202E00      cmpneg_3 db "\n ja  .",0
  3880 0000146C 203B756E7369676E65-     cmpneg_4 db " ;unsigned : ",0
  3881 00001475 64203A2000         
  3882 0000147A 5C6E206A6C20202E00      cmpneg_5 db "\n jl  .",0
  3883 00001483 203B756E7369676E65-     cmpneg_6 db " ;unsigned : ",0
  3884 0000148C 64203A2000         
  3885 00001491 5C6E206A6220202E00      cmpneg_7 db "\n jb  .",0
  3886 0000149A 5C6E206A6765202E00      cmpneg_8 db "\n jge .",0
  3887 000014A3 5C6E206A6C65202E00      cmpneg_9 db "\n jle .",0
  3888 000014AC 696E7465726E616C20-     cmpneg_10 db "internal error compare unknown in CMPNEG()",0
  3889 000014B5 6572726F7220636F6D-
  3890 000014BE 7061726520756E6B6E-
  3891 000014C7 6F776E20696E20434D-
  3892 000014D0 504E4547282900     
  3893                                  ENDP
  3894                                  
  3895                                  isrelational: PROC
  3896                                  
  3897                                  ;-584     if (token==T_EQ) goto w; if (token==T_NE) goto w;
  3898                                  
  3899 000014D7 A1[1E00]                 mov ax, [token]
  3900 000014DA 3D2603                   cmp ax, 806
  3901 000014DD 0F850300                 jne .isrelational197
  3902 000014E1 E94700                   jmp .w
  3903                                  .isrelational197:
  3904 000014E4 A1[1E00]                 mov ax, [token]
  3905 000014E7 3D2703                   cmp ax, 807
  3906 000014EA 0F850300                 jne .isrelational198
  3907 000014EE E93A00                   jmp .w
  3908                                  
  3909                                  ;-585     if (token==T_LE) goto w; if (token==T_GE) goto w;
  3910                                  
  3911                                  .isrelational198:
  3912 000014F1 A1[1E00]                 mov ax, [token]
  3913 000014F4 3D3803                   cmp ax, 824
  3914 000014F7 0F850300                 jne .isrelational199
  3915 000014FB E92D00                   jmp .w
  3916                                  .isrelational199:
  3917 000014FE A1[1E00]                 mov ax, [token]
  3918 00001501 3D2B03                   cmp ax, 811
  3919 00001504 0F850300                 jne .isrelational200
  3920 00001508 E92000                   jmp .w
  3921                                  
  3922                                  ;-586     if (token=='<' ) goto w; if (token=='>' ) goto w;
  3923                                  
  3924                                  .isrelational200:
  3925 0000150B A1[1E00]                 mov ax, [token]
  3926 0000150E 83F83C                   cmp ax, 60
  3927 00001511 0F850300                 jne .isrelational201
  3928 00001515 E91300                   jmp .w
  3929                                  .isrelational201:
  3930 00001518 A1[1E00]                 mov ax, [token]
  3931 0000151B 83F83E                   cmp ax, 62
  3932 0000151E 0F850300                 jne .isrelational202
  3933 00001522 E90600                   jmp .w
  3934                                  
  3935                                  ;-587     return 0;  w: iscmp=token; token=getlex(); return 1;}
  3936                                  
  3937                                  .isrelational202:
  3938 00001525 B80000                   mov ax, 0
  3939 00001528 E91200                   jmp .retnisrelational
  3940                                  .w:
  3941 0000152B A1[1E00]                 mov ax, [token]
  3942 0000152E A3[2300]                 mov word [iscmp], ax
  3943 00001531 E812F3                   call getlex
  3944 00001534 A3[1E00]                 mov word [token], ax
  3945 00001537 B80100                   mov ax, 1
  3946 0000153A E90000                   jmp .retnisrelational
  3947                                  
  3948                                  ;-588 
  3949                                  
  3950                                  
  3951                                  ;-589 int checkreg() { // >=17 = 16bit, >=47 = 32bit
  3952                                  
  3953                                   .retnisrelational:
  3954 0000153D C3                       ret
  3955                                  ENDP
  3956                                  
  3957                                  checkreg: PROC
  3958                                  
  3959                                  ;-590   if (strlen(symbol) <  2) return 0;
  3960                                  
  3961 0000153E 8D06606D                 lea  ax, [symbol]
  3962 00001542 50                       push ax
  3963 00001543 E8BBEC                   call strlen
  3964 00001546 83C402                   add  sp, 2
  3965 00001549 83F802                   cmp ax, 2
  3966 0000154C 0F8D0600                 jge .checkreg203
  3967 00001550 B80000                   mov ax, 0
  3968 00001553 E92A03                   jmp .retncheckreg
  3969                                  
  3970                                  ;-591   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;
  3971                                  
  3972                                  .checkreg203:
  3973 00001556 68[8118]                 push checkreg_0
  3974 00001559 8D06606D                 lea  ax, [symbol]
  3975 0000155D 50                       push ax
  3976 0000155E E8FEEC                   call eqstr
  3977 00001561 83C404                   add  sp, 4
  3978 00001564 08C0                     or  al, al
  3979 00001566 0F840600                 je .checkreg204
  3980 0000156A B80100                   mov ax, 1
  3981 0000156D E91003                   jmp .retncheckreg
  3982                                  .checkreg204:
  3983 00001570 68[8418]                 push checkreg_1
  3984 00001573 8D06606D                 lea  ax, [symbol]
  3985 00001577 50                       push ax
  3986 00001578 E8E4EC                   call eqstr
  3987 0000157B 83C404                   add  sp, 4
  3988 0000157E 08C0                     or  al, al
  3989 00001580 0F840600                 je .checkreg205
  3990 00001584 B80300                   mov ax, 3
  3991 00001587 E9F602                   jmp .retncheckreg
  3992                                  
  3993                                  ;-592   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;
  3994                                  
  3995                                  .checkreg205:
  3996 0000158A 68[8718]                 push checkreg_2
  3997 0000158D 8D06606D                 lea  ax, [symbol]
  3998 00001591 50                       push ax
  3999 00001592 E8CAEC                   call eqstr
  4000 00001595 83C404                   add  sp, 4
  4001 00001598 08C0                     or  al, al
  4002 0000159A 0F840600                 je .checkreg206
  4003 0000159E B80500                   mov ax, 5
  4004 000015A1 E9DC02                   jmp .retncheckreg
  4005                                  .checkreg206:
  4006 000015A4 68[8A18]                 push checkreg_3
  4007 000015A7 8D06606D                 lea  ax, [symbol]
  4008 000015AB 50                       push ax
  4009 000015AC E8B0EC                   call eqstr
  4010 000015AF 83C404                   add  sp, 4
  4011 000015B2 08C0                     or  al, al
  4012 000015B4 0F840600                 je .checkreg207
  4013 000015B8 B80700                   mov ax, 7
  4014 000015BB E9C202                   jmp .retncheckreg
  4015                                  
  4016                                  ;-593   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;
  4017                                  
  4018                                  .checkreg207:
  4019 000015BE 68[8D18]                 push checkreg_4
  4020 000015C1 8D06606D                 lea  ax, [symbol]
  4021 000015C5 50                       push ax
  4022 000015C6 E896EC                   call eqstr
  4023 000015C9 83C404                   add  sp, 4
  4024 000015CC 08C0                     or  al, al
  4025 000015CE 0F840600                 je .checkreg208
  4026 000015D2 B80900                   mov ax, 9
  4027 000015D5 E9A802                   jmp .retncheckreg
  4028                                  .checkreg208:
  4029 000015D8 68[9018]                 push checkreg_5
  4030 000015DB 8D06606D                 lea  ax, [symbol]
  4031 000015DF 50                       push ax
  4032 000015E0 E87CEC                   call eqstr
  4033 000015E3 83C404                   add  sp, 4
  4034 000015E6 08C0                     or  al, al
  4035 000015E8 0F840600                 je .checkreg209
  4036 000015EC B80B00                   mov ax, 11
  4037 000015EF E98E02                   jmp .retncheckreg
  4038                                  
  4039                                  ;-594   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;
  4040                                  
  4041                                  .checkreg209:
  4042 000015F2 68[9318]                 push checkreg_6
  4043 000015F5 8D06606D                 lea  ax, [symbol]
  4044 000015F9 50                       push ax
  4045 000015FA E862EC                   call eqstr
  4046 000015FD 83C404                   add  sp, 4
  4047 00001600 08C0                     or  al, al
  4048 00001602 0F840600                 je .checkreg210
  4049 00001606 B80D00                   mov ax, 13
  4050 00001609 E97402                   jmp .retncheckreg
  4051                                  .checkreg210:
  4052 0000160C 68[9618]                 push checkreg_7
  4053 0000160F 8D06606D                 lea  ax, [symbol]
  4054 00001613 50                       push ax
  4055 00001614 E848EC                   call eqstr
  4056 00001617 83C404                   add  sp, 4
  4057 0000161A 08C0                     or  al, al
  4058 0000161C 0F840600                 je .checkreg211
  4059 00001620 B80F00                   mov ax, 15
  4060 00001623 E95A02                   jmp .retncheckreg
  4061                                  
  4062                                  ;-595   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;
  4063                                  
  4064                                  .checkreg211:
  4065 00001626 68[9918]                 push checkreg_8
  4066 00001629 8D06606D                 lea  ax, [symbol]
  4067 0000162D 50                       push ax
  4068 0000162E E82EEC                   call eqstr
  4069 00001631 83C404                   add  sp, 4
  4070 00001634 08C0                     or  al, al
  4071 00001636 0F840600                 je .checkreg212
  4072 0000163A B81100                   mov ax, 17
  4073 0000163D E94002                   jmp .retncheckreg
  4074                                  .checkreg212:
  4075 00001640 68[9C18]                 push checkreg_9
  4076 00001643 8D06606D                 lea  ax, [symbol]
  4077 00001647 50                       push ax
  4078 00001648 E814EC                   call eqstr
  4079 0000164B 83C404                   add  sp, 4
  4080 0000164E 08C0                     or  al, al
  4081 00001650 0F840600                 je .checkreg213
  4082 00001654 B81300                   mov ax, 19
  4083 00001657 E92602                   jmp .retncheckreg
  4084                                  
  4085                                  ;-596   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;
  4086                                  
  4087                                  .checkreg213:
  4088 0000165A 68[9F18]                 push checkreg_10
  4089 0000165D 8D06606D                 lea  ax, [symbol]
  4090 00001661 50                       push ax
  4091 00001662 E8FAEB                   call eqstr
  4092 00001665 83C404                   add  sp, 4
  4093 00001668 08C0                     or  al, al
  4094 0000166A 0F840600                 je .checkreg214
  4095 0000166E B81500                   mov ax, 21
  4096 00001671 E90C02                   jmp .retncheckreg
  4097                                  .checkreg214:
  4098 00001674 68[A218]                 push checkreg_11
  4099 00001677 8D06606D                 lea  ax, [symbol]
  4100 0000167B 50                       push ax
  4101 0000167C E8E0EB                   call eqstr
  4102 0000167F 83C404                   add  sp, 4
  4103 00001682 08C0                     or  al, al
  4104 00001684 0F840600                 je .checkreg215
  4105 00001688 B81700                   mov ax, 23
  4106 0000168B E9F201                   jmp .retncheckreg
  4107                                  
  4108                                  ;-597   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;
  4109                                  
  4110                                  .checkreg215:
  4111 0000168E 68[A518]                 push checkreg_12
  4112 00001691 8D06606D                 lea  ax, [symbol]
  4113 00001695 50                       push ax
  4114 00001696 E8C6EB                   call eqstr
  4115 00001699 83C404                   add  sp, 4
  4116 0000169C 08C0                     or  al, al
  4117 0000169E 0F840600                 je .checkreg216
  4118 000016A2 B81900                   mov ax, 25
  4119 000016A5 E9D801                   jmp .retncheckreg
  4120                                  .checkreg216:
  4121 000016A8 68[A818]                 push checkreg_13
  4122 000016AB 8D06606D                 lea  ax, [symbol]
  4123 000016AF 50                       push ax
  4124 000016B0 E8ACEB                   call eqstr
  4125 000016B3 83C404                   add  sp, 4
  4126 000016B6 08C0                     or  al, al
  4127 000016B8 0F840600                 je .checkreg217
  4128 000016BC B81B00                   mov ax, 27
  4129 000016BF E9BE01                   jmp .retncheckreg
  4130                                  
  4131                                  ;-598   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;
  4132                                  
  4133                                  .checkreg217:
  4134 000016C2 68[AB18]                 push checkreg_14
  4135 000016C5 8D06606D                 lea  ax, [symbol]
  4136 000016C9 50                       push ax
  4137 000016CA E892EB                   call eqstr
  4138 000016CD 83C404                   add  sp, 4
  4139 000016D0 08C0                     or  al, al
  4140 000016D2 0F840600                 je .checkreg218
  4141 000016D6 B81D00                   mov ax, 29
  4142 000016D9 E9A401                   jmp .retncheckreg
  4143                                  .checkreg218:
  4144 000016DC 68[AE18]                 push checkreg_15
  4145 000016DF 8D06606D                 lea  ax, [symbol]
  4146 000016E3 50                       push ax
  4147 000016E4 E878EB                   call eqstr
  4148 000016E7 83C404                   add  sp, 4
  4149 000016EA 08C0                     or  al, al
  4150 000016EC 0F840600                 je .checkreg219
  4151 000016F0 B81F00                   mov ax, 31
  4152 000016F3 E98A01                   jmp .retncheckreg
  4153                                  
  4154                                  ;-599   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;
  4155                                  
  4156                                  .checkreg219:
  4157 000016F6 68[B118]                 push checkreg_16
  4158 000016F9 8D06606D                 lea  ax, [symbol]
  4159 000016FD 50                       push ax
  4160 000016FE E85EEB                   call eqstr
  4161 00001701 83C404                   add  sp, 4
  4162 00001704 08C0                     or  al, al
  4163 00001706 0F840600                 je .checkreg220
  4164 0000170A B82100                   mov ax, 33
  4165 0000170D E97001                   jmp .retncheckreg
  4166                                  .checkreg220:
  4167 00001710 68[B418]                 push checkreg_17
  4168 00001713 8D06606D                 lea  ax, [symbol]
  4169 00001717 50                       push ax
  4170 00001718 E844EB                   call eqstr
  4171 0000171B 83C404                   add  sp, 4
  4172 0000171E 08C0                     or  al, al
  4173 00001720 0F840600                 je .checkreg221
  4174 00001724 B82300                   mov ax, 35
  4175 00001727 E95601                   jmp .retncheckreg
  4176                                  
  4177                                  ;-600   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;
  4178                                  
  4179                                  .checkreg221:
  4180 0000172A 68[B718]                 push checkreg_18
  4181 0000172D 8D06606D                 lea  ax, [symbol]
  4182 00001731 50                       push ax
  4183 00001732 E82AEB                   call eqstr
  4184 00001735 83C404                   add  sp, 4
  4185 00001738 08C0                     or  al, al
  4186 0000173A 0F840600                 je .checkreg222
  4187 0000173E B82500                   mov ax, 37
  4188 00001741 E93C01                   jmp .retncheckreg
  4189                                  .checkreg222:
  4190 00001744 68[BA18]                 push checkreg_19
  4191 00001747 8D06606D                 lea  ax, [symbol]
  4192 0000174B 50                       push ax
  4193 0000174C E810EB                   call eqstr
  4194 0000174F 83C404                   add  sp, 4
  4195 00001752 08C0                     or  al, al
  4196 00001754 0F840600                 je .checkreg223
  4197 00001758 B82700                   mov ax, 39
  4198 0000175B E92201                   jmp .retncheckreg
  4199                                  
  4200                                  ;-601   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;
  4201                                  
  4202                                  .checkreg223:
  4203 0000175E 68[BD18]                 push checkreg_20
  4204 00001761 8D06606D                 lea  ax, [symbol]
  4205 00001765 50                       push ax
  4206 00001766 E8F6EA                   call eqstr
  4207 00001769 83C404                   add  sp, 4
  4208 0000176C 08C0                     or  al, al
  4209 0000176E 0F840600                 je .checkreg224
  4210 00001772 B82900                   mov ax, 41
  4211 00001775 E90801                   jmp .retncheckreg
  4212                                  .checkreg224:
  4213 00001778 68[C018]                 push checkreg_21
  4214 0000177B 8D06606D                 lea  ax, [symbol]
  4215 0000177F 50                       push ax
  4216 00001780 E8DCEA                   call eqstr
  4217 00001783 83C404                   add  sp, 4
  4218 00001786 08C0                     or  al, al
  4219 00001788 0F840600                 je .checkreg225
  4220 0000178C B82B00                   mov ax, 43
  4221 0000178F E9EE00                   jmp .retncheckreg
  4222                                  
  4223                                  ;-602   // (eqstr(symbol,"ip")) return 45;
  4224                                  
  4225                                  
  4226                                  ;-603   if (strlen(symbol) >   3) return 0;
  4227                                  
  4228                                  .checkreg225:
  4229 00001792 8D06606D                 lea  ax, [symbol]
  4230 00001796 50                       push ax
  4231 00001797 E867EA                   call strlen
  4232 0000179A 83C402                   add  sp, 2
  4233 0000179D 83F803                   cmp ax, 3
  4234 000017A0 0F8E0600                 jle .checkreg226
  4235 000017A4 B80000                   mov ax, 0
  4236 000017A7 E9D600                   jmp .retncheckreg
  4237                                  
  4238                                  ;-604   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;
  4239                                  
  4240                                  .checkreg226:
  4241 000017AA 68[C318]                 push checkreg_22
  4242 000017AD 8D06606D                 lea  ax, [symbol]
  4243 000017B1 50                       push ax
  4244 000017B2 E8AAEA                   call eqstr
  4245 000017B5 83C404                   add  sp, 4
  4246 000017B8 08C0                     or  al, al
  4247 000017BA 0F840600                 je .checkreg227
  4248 000017BE B82F00                   mov ax, 47
  4249 000017C1 E9BC00                   jmp .retncheckreg
  4250                                  .checkreg227:
  4251 000017C4 68[C718]                 push checkreg_23
  4252 000017C7 8D06606D                 lea  ax, [symbol]
  4253 000017CB 50                       push ax
  4254 000017CC E890EA                   call eqstr
  4255 000017CF 83C404                   add  sp, 4
  4256 000017D2 08C0                     or  al, al
  4257 000017D4 0F840600                 je .checkreg228
  4258 000017D8 B83200                   mov ax, 50
  4259 000017DB E9A200                   jmp .retncheckreg
  4260                                  
  4261                                  ;-605   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;
  4262                                  
  4263                                  .checkreg228:
  4264 000017DE 68[CB18]                 push checkreg_24
  4265 000017E1 8D06606D                 lea  ax, [symbol]
  4266 000017E5 50                       push ax
  4267 000017E6 E876EA                   call eqstr
  4268 000017E9 83C404                   add  sp, 4
  4269 000017EC 08C0                     or  al, al
  4270 000017EE 0F840600                 je .checkreg229
  4271 000017F2 B83500                   mov ax, 53
  4272 000017F5 E98800                   jmp .retncheckreg
  4273                                  .checkreg229:
  4274 000017F8 68[CF18]                 push checkreg_25
  4275 000017FB 8D06606D                 lea  ax, [symbol]
  4276 000017FF 50                       push ax
  4277 00001800 E85CEA                   call eqstr
  4278 00001803 83C404                   add  sp, 4
  4279 00001806 08C0                     or  al, al
  4280 00001808 0F840600                 je .checkreg230
  4281 0000180C B83800                   mov ax, 56
  4282 0000180F E96E00                   jmp .retncheckreg
  4283                                  
  4284                                  ;-606   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;
  4285                                  
  4286                                  .checkreg230:
  4287 00001812 68[D318]                 push checkreg_26
  4288 00001815 8D06606D                 lea  ax, [symbol]
  4289 00001819 50                       push ax
  4290 0000181A E842EA                   call eqstr
  4291 0000181D 83C404                   add  sp, 4
  4292 00001820 08C0                     or  al, al
  4293 00001822 0F840600                 je .checkreg231
  4294 00001826 B83B00                   mov ax, 59
  4295 00001829 E95400                   jmp .retncheckreg
  4296                                  .checkreg231:
  4297 0000182C 68[D718]                 push checkreg_27
  4298 0000182F 8D06606D                 lea  ax, [symbol]
  4299 00001833 50                       push ax
  4300 00001834 E828EA                   call eqstr
  4301 00001837 83C404                   add  sp, 4
  4302 0000183A 08C0                     or  al, al
  4303 0000183C 0F840600                 je .checkreg232
  4304 00001840 B83E00                   mov ax, 62
  4305 00001843 E93A00                   jmp .retncheckreg
  4306                                  
  4307                                  ;-607   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;
  4308                                  
  4309                                  .checkreg232:
  4310 00001846 68[DB18]                 push checkreg_28
  4311 00001849 8D06606D                 lea  ax, [symbol]
  4312 0000184D 50                       push ax
  4313 0000184E E80EEA                   call eqstr
  4314 00001851 83C404                   add  sp, 4
  4315 00001854 08C0                     or  al, al
  4316 00001856 0F840600                 je .checkreg233
  4317 0000185A B84100                   mov ax, 65
  4318 0000185D E92000                   jmp .retncheckreg
  4319                                  .checkreg233:
  4320 00001860 68[DF18]                 push checkreg_29
  4321 00001863 8D06606D                 lea  ax, [symbol]
  4322 00001867 50                       push ax
  4323 00001868 E8F4E9                   call eqstr
  4324 0000186B 83C404                   add  sp, 4
  4325 0000186E 08C0                     or  al, al
  4326 00001870 0F840600                 je .checkreg234
  4327 00001874 B84400                   mov ax, 68
  4328 00001877 E90600                   jmp .retncheckreg
  4329                                  
  4330                                  ;-608 //  if (eqstr(symbol,"cr0")) return 71;
  4331                                  
  4332                                  
  4333                                  ;-609   return 0;   }
  4334                                  
  4335                                  .checkreg234:
  4336 0000187A B80000                   mov ax, 0
  4337 0000187D E90000                   jmp .retncheckreg
  4338                                  
  4339                                  ;-610 
  4340                                  
  4341                                  
  4342                                  ;-611 char printregstr[]
  4343                                  
  4344                                   .retncheckreg:
  4345 00001880 C3                       ret
  4346 00001881 616C00                  checkreg_0 db "al",0
  4347 00001884 636C00                  checkreg_1 db "cl",0
  4348 00001887 646C00                  checkreg_2 db "dl",0
  4349 0000188A 626C00                  checkreg_3 db "bl",0
  4350 0000188D 616800                  checkreg_4 db "ah",0
  4351 00001890 636800                  checkreg_5 db "ch",0
  4352 00001893 646800                  checkreg_6 db "dh",0
  4353 00001896 626800                  checkreg_7 db "bh",0
  4354 00001899 617800                  checkreg_8 db "ax",0
  4355 0000189C 637800                  checkreg_9 db "cx",0
  4356 0000189F 647800                  checkreg_10 db "dx",0
  4357 000018A2 627800                  checkreg_11 db "bx",0
  4358 000018A5 737000                  checkreg_12 db "sp",0
  4359 000018A8 627000                  checkreg_13 db "bp",0
  4360 000018AB 736900                  checkreg_14 db "si",0
  4361 000018AE 646900                  checkreg_15 db "di",0
  4362 000018B1 657300                  checkreg_16 db "es",0
  4363 000018B4 637300                  checkreg_17 db "cs",0
  4364 000018B7 737300                  checkreg_18 db "ss",0
  4365 000018BA 647300                  checkreg_19 db "ds",0
  4366 000018BD 667300                  checkreg_20 db "fs",0
  4367 000018C0 677300                  checkreg_21 db "gs",0
  4368 000018C3 65617800                checkreg_22 db "eax",0
  4369 000018C7 65637800                checkreg_23 db "ecx",0
  4370 000018CB 65647800                checkreg_24 db "edx",0
  4371 000018CF 65627800                checkreg_25 db "ebx",0
  4372 000018D3 65737000                checkreg_26 db "esp",0
  4373 000018D7 65627000                checkreg_27 db "ebp",0
  4374 000018DB 65736900                checkreg_28 db "esi",0
  4375 000018DF 65646900                checkreg_29 db "edi",0
  4376                                  ENDP
  4377                                  
  4378                                  ;-612 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi";
  4379                                  
  4380 000018E3 2A616C636C646C626C-     printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi",0
  4381 000018EC 616863686468626861-
  4382 000018F5 786378647862787370-
  4383 000018FE 627073696469657363-
  4384 00001907 737373647366736773-
  4385 00001910 697065617865637865-
  4386 00001919 647865627865737065-
  4387 00001922 627065736965646900 
  4388                                  
  4389                                  ;-613 
  4390                                  
  4391                                  
  4392                                  ;-614 int printreg(int i) {  unsigned int k; unsigned char c;
  4393                                  
  4394                                  
  4395                                  printreg: PROC
  4396                                  
  4397                                  ;-615   k = &printregstr + i; c=*k; prc(c); i++;
  4398                                  ;
  4399 0000192B C8040000                 ENTER  4,0
  4400 0000192F B8[E318]                 mov ax, printregstr
  4401 00001932 034604                   add ax, [bp+4]
  4402 00001935 8946FE                   mov [bp-2], ax
  4403 00001938 8B5EFE                   mov bx, [bp-2]
  4404 0000193B 8B07                     mov ax, [bx]
  4405 0000193D 8846FC                   mov [bp-4], al
  4406 00001940 8A46FC                   mov al, byte [bp-4]
  4407 00001943 B400                     mov ah, 0
  4408 00001945 50                       push ax
  4409 00001946 E83DEA                   call prc
  4410 00001949 83C402                   add  sp, 2
  4411 0000194C FF4604                   inc  word[bp+4]
  4412                                  
  4413                                  ;-616   k = &printregstr + i; c=*k; prc(c);
  4414                                  
  4415 0000194F B8[E318]                 mov ax, printregstr
  4416 00001952 034604                   add ax, [bp+4]
  4417 00001955 8946FE                   mov [bp-2], ax
  4418 00001958 8B5EFE                   mov bx, [bp-2]
  4419 0000195B 8B07                     mov ax, [bx]
  4420 0000195D 8846FC                   mov [bp-4], al
  4421 00001960 8A46FC                   mov al, byte [bp-4]
  4422 00001963 B400                     mov ah, 0
  4423 00001965 50                       push ax
  4424 00001966 E81DEA                   call prc
  4425 00001969 83C402                   add  sp, 2
  4426                                  
  4427                                  ;-617   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }
  4428                                  
  4429 0000196C 8B4604                   mov ax, [bp+4]
  4430 0000196F 83F82F                   cmp ax, 47
  4431 00001972 0F8E2000                 jle .printreg235
  4432 00001976 FF4604                   inc  word[bp+4]
  4433 00001979 B8[E318]                 mov ax, printregstr
  4434 0000197C 034604                   add ax, [bp+4]
  4435 0000197F 8946FE                   mov [bp-2], ax
  4436 00001982 8B5EFE                   mov bx, [bp-2]
  4437 00001985 8B07                     mov ax, [bx]
  4438 00001987 8846FC                   mov [bp-4], al
  4439 0000198A 8A46FC                   mov al, byte [bp-4]
  4440 0000198D B400                     mov ah, 0
  4441 0000198F 50                       push ax
  4442 00001990 E8F3E9                   call prc
  4443 00001993 83C402                   add  sp, 2
  4444                                  
  4445                                  ;-618 }
  4446                                  
  4447                                  .printreg235:
  4448                                  
  4449                                  ;-619 
  4450                                  
  4451                                  
  4452                                  ;-620 int constantexpr() { int mode; int id1;int ids;
  4453 00001996 C9                       LEAVE
  4454 00001997 C3                       ret
  4455                                  ENDP
  4456                                  
  4457                                  constantexpr: PROC
  4458                                  
  4459                                  ;-621   token=getlex();   mode=typeName();
  4460                                  ;
  4461 00001998 C8060000                 ENTER  6,0
  4462 0000199C E8A7EE                   call getlex
  4463 0000199F A3[1E00]                 mov word [token], ax
  4464 000019A2 E848F7                   call typeName
  4465 000019A5 8946FE                   mov [bp-2], ax
  4466                                  
  4467                                  ;-622   id1=searchname(); gettypes(id1); ids=signi;
  4468                                  
  4469 000019A8 E8E4F6                   call searchname
  4470 000019AB 8946FC                   mov [bp-4], ax
  4471 000019AE FF76FC                   push word [bp-4]
  4472 000019B1 E812F8                   call gettypes
  4473 000019B4 83C402                   add  sp, 2
  4474 000019B7 A1[3000]                 mov ax, [signi]
  4475 000019BA 8946FA                   mov [bp-6], ax
  4476                                  
  4477                                  ;-623   if (isrelational() ==0) error1("Relational expression expected");
  4478                                  
  4479 000019BD E817FB                   call isrelational
  4480 000019C0 83F800                   cmp ax, 0
  4481 000019C3 0F850900                 jne .constantexpr236
  4482 000019C7 68[4D1A]                 push constantexpr_0
  4483 000019CA E8CEEB                   call error1
  4484 000019CD 83C402                   add  sp, 2
  4485                                  
  4486                                  ;-624   expect(T_CONST);  prs(" ; constant expression");
  4487                                  
  4488                                  .constantexpr236:
  4489 000019D0 680101                   push 257
  4490 000019D3 E844F5                   call expect
  4491 000019D6 83C402                   add  sp, 2
  4492 000019D9 68[6C1A]                 push constantexpr_1
  4493 000019DC E800EA                   call prs
  4494 000019DF 83C402                   add  sp, 2
  4495                                  
  4496                                  ;-625   prs("\ncmp ");
  4497                                  
  4498 000019E2 68[831A]                 push constantexpr_2
  4499 000019E5 E8F7E9                   call prs
  4500 000019E8 83C402                   add  sp, 2
  4501                                  
  4502                                  ;-626   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  4503                                  
  4504 000019EB FF76FC                   push word [bp-4]
  4505 000019EE E8D5F7                   call gettypes
  4506 000019F1 83C402                   add  sp, 2
  4507 000019F4 A1[3600]                 mov ax, [wi]
  4508 000019F7 83F802                   cmp ax, 2
  4509 000019FA 0F850C00                 jne .constantexpr237
  4510 000019FE 68[8A1A]                 push constantexpr_3
  4511 00001A01 E8DBE9                   call prs
  4512 00001A04 83C402                   add  sp, 2
  4513 00001A07 E90900                   jmp .constantexpr238
  4514                                  .constantexpr237:
  4515 00001A0A 68[8F1A]                 push constantexpr_4
  4516 00001A0D E8CFE9                   call prs
  4517 00001A10 83C402                   add  sp, 2
  4518                                  
  4519                                  ;-627   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);
  4520                                  
  4521                                  .constantexpr238:
  4522 00001A13 FF76FC                   push word [bp-4]
  4523 00001A16 E869F5                   call v
  4524 00001A19 83C402                   add  sp, 2
  4525 00001A1C 68[941A]                 push constantexpr_5
  4526 00001A1F E8BDE9                   call prs
  4527 00001A22 83C402                   add  sp, 2
  4528 00001A25 FF36[2B00]               push word [lexval]
  4529 00001A29 E808EB                   call prunsign1
  4530 00001A2C 83C402                   add  sp, 2
  4531 00001A2F FF76FA                   push word [bp-6]
  4532 00001A32 E832F9                   call cmpneg
  4533 00001A35 83C402                   add  sp, 2
  4534 00001A38 8D06E06D                 lea  ax, [fname]
  4535 00001A3C 50                       push ax
  4536 00001A3D E89FE9                   call prs
  4537 00001A40 83C402                   add  sp, 2
  4538                                  
  4539                                  ;-628   expect(')');
  4540                                  
  4541 00001A43 6A29                     push 41
  4542 00001A45 E8D2F4                   call expect
  4543 00001A48 83C402                   add  sp, 2
  4544                                  
  4545                                  ;-629 }
  4546                                  
  4547                                  
  4548                                  ;-630 
  4549                                  
  4550                                  
  4551                                  ;-631 char ops[5];
  4552 00001A4B C9                       LEAVE
  4553 00001A4C C3                       ret
  4554 00001A4D 52656C6174696F6E61-     constantexpr_0 db "Relational expression expected",0
  4555 00001A56 6C2065787072657373-
  4556 00001A5F 696F6E206578706563-
  4557 00001A68 74656400           
  4558 00001A6C 203B20636F6E737461-     constantexpr_1 db " ; constant expression",0
  4559 00001A75 6E7420657870726573-
  4560 00001A7E 73696F6E00         
  4561 00001A83 5C6E636D702000          constantexpr_2 db "\ncmp ",0
  4562 00001A8A 776F726400              constantexpr_3 db "word",0
  4563 00001A8F 6279746500              constantexpr_4 db "byte",0
  4564 00001A94 2C2000                  constantexpr_5 db ", ",0
  4565                                  ENDP
  4566                                  section .bss
  4567                                  absolute 41737
  4568 0000A309 <res 00000005>          ops resb 5
  4569                                  section .text
  4570                                  
  4571                                  ;-632 int doreg1(int iscmp1) { int i;
  4572                                  
  4573                                  
  4574                                  doreg1: PROC
  4575                                  
  4576                                  ;-633   if (istoken('='))          strcpy(ops, "mov");
  4577                                  ;
  4578 00001A97 C8020000                 ENTER  2,0
  4579 00001A9B 6A3D                     push 61
  4580 00001A9D E858F4                   call istoken
  4581 00001AA0 83C402                   add  sp, 2
  4582 00001AA3 08C0                     or  al, al
  4583 00001AA5 0F840E00                 je .doreg1239
  4584 00001AA9 68[501C]                 push doreg1_0
  4585 00001AAC 8D0609A3                 lea  ax, [ops]
  4586 00001AB0 50                       push ax
  4587 00001AB1 E875E7                   call strcpy
  4588 00001AB4 83C404                   add  sp, 4
  4589                                  
  4590                                  ;-634   if (istoken(T_PLUSASS))    strcpy(ops, "add");
  4591                                  
  4592                                  .doreg1239:
  4593 00001AB7 68CE04                   push 1230
  4594 00001ABA E83BF4                   call istoken
  4595 00001ABD 83C402                   add  sp, 2
  4596 00001AC0 08C0                     or  al, al
  4597 00001AC2 0F840E00                 je .doreg1240
  4598 00001AC6 68[541C]                 push doreg1_1
  4599 00001AC9 8D0609A3                 lea  ax, [ops]
  4600 00001ACD 50                       push ax
  4601 00001ACE E858E7                   call strcpy
  4602 00001AD1 83C404                   add  sp, 4
  4603                                  
  4604                                  ;-635   if (istoken(T_MINUSASS))   strcpy(ops, "sub");
  4605                                  
  4606                                  .doreg1240:
  4607 00001AD4 68CF04                   push 1231
  4608 00001AD7 E81EF4                   call istoken
  4609 00001ADA 83C402                   add  sp, 2
  4610 00001ADD 08C0                     or  al, al
  4611 00001ADF 0F840E00                 je .doreg1241
  4612 00001AE3 68[581C]                 push doreg1_2
  4613 00001AE6 8D0609A3                 lea  ax, [ops]
  4614 00001AEA 50                       push ax
  4615 00001AEB E83BE7                   call strcpy
  4616 00001AEE 83C404                   add  sp, 4
  4617                                  
  4618                                  ;-636   if (istoken(T_ANDASS))     strcpy(ops, "and");
  4619                                  
  4620                                  .doreg1241:
  4621 00001AF1 68D204                   push 1234
  4622 00001AF4 E801F4                   call istoken
  4623 00001AF7 83C402                   add  sp, 2
  4624 00001AFA 08C0                     or  al, al
  4625 00001AFC 0F840E00                 je .doreg1242
  4626 00001B00 68[5C1C]                 push doreg1_3
  4627 00001B03 8D0609A3                 lea  ax, [ops]
  4628 00001B07 50                       push ax
  4629 00001B08 E81EE7                   call strcpy
  4630 00001B0B 83C404                   add  sp, 4
  4631                                  
  4632                                  ;-637   if (istoken(T_ORASS))      strcpy(ops, "or" );
  4633                                  
  4634                                  .doreg1242:
  4635 00001B0E 68D304                   push 1235
  4636 00001B11 E8E4F3                   call istoken
  4637 00001B14 83C402                   add  sp, 2
  4638 00001B17 08C0                     or  al, al
  4639 00001B19 0F840E00                 je .doreg1243
  4640 00001B1D 68[601C]                 push doreg1_4
  4641 00001B20 8D0609A3                 lea  ax, [ops]
  4642 00001B24 50                       push ax
  4643 00001B25 E801E7                   call strcpy
  4644 00001B28 83C404                   add  sp, 4
  4645                                  
  4646                                  ;-638   if (istoken(T_LESSLESS))   strcpy(ops, "shl");
  4647                                  
  4648                                  .doreg1243:
  4649 00001B2B 68D804                   push 1240
  4650 00001B2E E8C7F3                   call istoken
  4651 00001B31 83C402                   add  sp, 2
  4652 00001B34 08C0                     or  al, al
  4653 00001B36 0F840E00                 je .doreg1244
  4654 00001B3A 68[631C]                 push doreg1_5
  4655 00001B3D 8D0609A3                 lea  ax, [ops]
  4656 00001B41 50                       push ax
  4657 00001B42 E8E4E6                   call strcpy
  4658 00001B45 83C404                   add  sp, 4
  4659                                  
  4660                                  ;-639   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");
  4661                                  
  4662                                  .doreg1244:
  4663 00001B48 68D904                   push 1241
  4664 00001B4B E8AAF3                   call istoken
  4665 00001B4E 83C402                   add  sp, 2
  4666 00001B51 08C0                     or  al, al
  4667 00001B53 0F840E00                 je .doreg1245
  4668 00001B57 68[671C]                 push doreg1_6
  4669 00001B5A 8D0609A3                 lea  ax, [ops]
  4670 00001B5E 50                       push ax
  4671 00001B5F E8C7E6                   call strcpy
  4672 00001B62 83C404                   add  sp, 4
  4673                                  
  4674                                  ;-640   if (iscmp1 == 1) { token=getlex();
  4675                                  
  4676                                  .doreg1245:
  4677 00001B65 8B4604                   mov ax, [bp+4]
  4678 00001B68 83F801                   cmp ax, 1
  4679 00001B6B 0F852700                 jne .doreg1246
  4680 00001B6F E8D4EC                   call getlex
  4681 00001B72 A3[1E00]                 mov word [token], ax
  4682                                  
  4683                                  ;-641       if (isrelational() ==0) error1("Relational expected");
  4684                                  
  4685 00001B75 E85FF9                   call isrelational
  4686 00001B78 83F800                   cmp ax, 0
  4687 00001B7B 0F850900                 jne .doreg1247
  4688 00001B7F 68[6B1C]                 push doreg1_7
  4689 00001B82 E816EA                   call error1
  4690 00001B85 83C402                   add  sp, 2
  4691                                  
  4692                                  ;-642       strcpy(ops, "cmp"); }
  4693                                  
  4694                                  .doreg1247:
  4695 00001B88 68[7F1C]                 push doreg1_8
  4696 00001B8B 8D0609A3                 lea  ax, [ops]
  4697 00001B8F 50                       push ax
  4698 00001B90 E896E6                   call strcpy
  4699 00001B93 83C404                   add  sp, 4
  4700                                  
  4701                                  ;-643   prs("\n "); prs(ops); prs("  "); printreg(ireg1); prs(", ");
  4702                                  
  4703                                  .doreg1246:
  4704 00001B96 68[831C]                 push doreg1_9
  4705 00001B99 E843E8                   call prs
  4706 00001B9C 83C402                   add  sp, 2
  4707 00001B9F 8D0609A3                 lea  ax, [ops]
  4708 00001BA3 50                       push ax
  4709 00001BA4 E838E8                   call prs
  4710 00001BA7 83C402                   add  sp, 2
  4711 00001BAA 68[871C]                 push doreg1_10
  4712 00001BAD E82FE8                   call prs
  4713 00001BB0 83C402                   add  sp, 2
  4714 00001BB3 FF36[4B00]               push word [ireg1]
  4715 00001BB7 E871FD                   call printreg
  4716 00001BBA 83C402                   add  sp, 2
  4717 00001BBD 68[8A1C]                 push doreg1_11
  4718 00001BC0 E81CE8                   call prs
  4719 00001BC3 83C402                   add  sp, 2
  4720                                  
  4721                                  ;-644 
  4722                                  
  4723                                  
  4724                                  ;-645   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}
  4725                                  
  4726 00001BC6 680101                   push 257
  4727 00001BC9 E82CF3                   call istoken
  4728 00001BCC 83C402                   add  sp, 2
  4729 00001BCF 08C0                     or  al, al
  4730 00001BD1 0F840D00                 je .doreg1248
  4731 00001BD5 FF36[2B00]               push word [lexval]
  4732 00001BD9 E858E9                   call prunsign1
  4733 00001BDC 83C402                   add  sp, 2
  4734 00001BDF E94700                   jmp .reg1
  4735                                  
  4736                                  ;-646   mod2=typeName(); ireg2=checkreg();
  4737                                  
  4738                                  .doreg1248:
  4739 00001BE2 E808F5                   call typeName
  4740 00001BE5 A3[4D00]                 mov word [mod2], ax
  4741 00001BE8 E853F9                   call checkreg
  4742 00001BEB A3[4F00]                 mov word [ireg2], ax
  4743                                  
  4744                                  ;-647   if (ireg2) {printreg(ireg2); goto reg1;}
  4745                                  
  4746 00001BEE A1[4F00]                 mov ax, [ireg2]
  4747 00001BF1 08C0                     or  al, al
  4748 00001BF3 0F840D00                 je .doreg1249
  4749 00001BF7 FF36[4F00]               push word [ireg2]
  4750 00001BFB E82DFD                   call printreg
  4751 00001BFE 83C402                   add  sp, 2
  4752 00001C01 E92500                   jmp .reg1
  4753                                  
  4754                                  ;-648   i=searchname();  if (mod2 == 2) printName(i); else v(i);
  4755                                  
  4756                                  .doreg1249:
  4757 00001C04 E888F4                   call searchname
  4758 00001C07 8946FE                   mov [bp-2], ax
  4759 00001C0A A1[4D00]                 mov ax, [mod2]
  4760 00001C0D 83F802                   cmp ax, 2
  4761 00001C10 0F850C00                 jne .doreg1250
  4762 00001C14 FF76FE                   push word [bp-2]
  4763 00001C17 E88AEB                   call printName
  4764 00001C1A 83C402                   add  sp, 2
  4765 00001C1D E90900                   jmp .doreg1251
  4766                                  .doreg1250:
  4767 00001C20 FF76FE                   push word [bp-2]
  4768 00001C23 E85CF3                   call v
  4769 00001C26 83C402                   add  sp, 2
  4770                                  
  4771                                  ;-649   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }
  4772                                  
  4773                                  .doreg1251:
  4774                                  .reg1:
  4775 00001C29 8B4604                   mov ax, [bp+4]
  4776 00001C2C 83F801                   cmp ax, 1
  4777 00001C2F 0F851B00                 jne .doreg1252
  4778 00001C33 6A00                     push 0
  4779 00001C35 E82FF7                   call cmpneg
  4780 00001C38 83C402                   add  sp, 2
  4781 00001C3B 8D06E06D                 lea  ax, [fname]
  4782 00001C3F 50                       push ax
  4783 00001C40 E89CE7                   call prs
  4784 00001C43 83C402                   add  sp, 2
  4785 00001C46 6A29                     push 41
  4786 00001C48 E8CFF2                   call expect
  4787 00001C4B 83C402                   add  sp, 2
  4788                                  
  4789                                  ;-650 }
  4790                                  
  4791                                  .doreg1252:
  4792                                  
  4793                                  ;-651 
  4794                                  
  4795                                  
  4796                                  ;-652 int compoundass(char *op, int mode, int id1) {
  4797 00001C4E C9                       LEAVE
  4798 00001C4F C3                       ret
  4799 00001C50 6D6F7600                doreg1_0 db "mov",0
  4800 00001C54 61646400                doreg1_1 db "add",0
  4801 00001C58 73756200                doreg1_2 db "sub",0
  4802 00001C5C 616E6400                doreg1_3 db "and",0
  4803 00001C60 6F7200                  doreg1_4 db "or",0
  4804 00001C63 73686C00                doreg1_5 db "shl",0
  4805 00001C67 73687200                doreg1_6 db "shr",0
  4806 00001C6B 52656C6174696F6E61-     doreg1_7 db "Relational expected",0
  4807 00001C74 6C2065787065637465-
  4808 00001C7D 6400               
  4809 00001C7F 636D7000                doreg1_8 db "cmp",0
  4810 00001C83 5C6E2000                doreg1_9 db "\n ",0
  4811 00001C87 202000                  doreg1_10 db "  ",0
  4812 00001C8A 2C2000                  doreg1_11 db ", ",0
  4813                                  ENDP
  4814                                  
  4815                                  compoundass: PROC
  4816                                  
  4817                                  ;-653   if(mode) error1("only scalar Var allowed");
  4818                                  ;
  4819 00001C8D C8000000                 ENTER  0,0
  4820 00001C91 8B4606                   mov ax, [bp+6]
  4821 00001C94 08C0                     or  al, al
  4822 00001C96 0F840900                 je .compoundass253
  4823 00001C9A 68[0D1D]                 push compoundass_0
  4824 00001C9D E8FBE8                   call error1
  4825 00001CA0 83C402                   add  sp, 2
  4826                                  
  4827                                  ;-654   prs("\n "); prs(op); prs("  ");
  4828                                  
  4829                                  .compoundass253:
  4830 00001CA3 68[251D]                 push compoundass_1
  4831 00001CA6 E836E7                   call prs
  4832 00001CA9 83C402                   add  sp, 2
  4833 00001CAC FF7604                   push word [bp+4]
  4834 00001CAF E82DE7                   call prs
  4835 00001CB2 83C402                   add  sp, 2
  4836 00001CB5 68[291D]                 push compoundass_2
  4837 00001CB8 E824E7                   call prs
  4838 00001CBB 83C402                   add  sp, 2
  4839                                  
  4840                                  ;-655   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  4841                                  
  4842 00001CBE FF7608                   push word [bp+8]
  4843 00001CC1 E802F5                   call gettypes
  4844 00001CC4 83C402                   add  sp, 2
  4845 00001CC7 A1[3600]                 mov ax, [wi]
  4846 00001CCA 83F802                   cmp ax, 2
  4847 00001CCD 0F850C00                 jne .compoundass254
  4848 00001CD1 68[2C1D]                 push compoundass_3
  4849 00001CD4 E808E7                   call prs
  4850 00001CD7 83C402                   add  sp, 2
  4851 00001CDA E90900                   jmp .compoundass255
  4852                                  .compoundass254:
  4853 00001CDD 68[311D]                 push compoundass_4
  4854 00001CE0 E8FCE6                   call prs
  4855 00001CE3 83C402                   add  sp, 2
  4856                                  
  4857                                  ;-656   v(id1); prs(", ");
  4858                                  
  4859                                  .compoundass255:
  4860 00001CE6 FF7608                   push word [bp+8]
  4861 00001CE9 E896F2                   call v
  4862 00001CEC 83C402                   add  sp, 2
  4863 00001CEF 68[361D]                 push compoundass_5
  4864 00001CF2 E8EAE6                   call prs
  4865 00001CF5 83C402                   add  sp, 2
  4866                                  
  4867                                  ;-657   expect(T_CONST); prunsign1(lexval);
  4868                                  
  4869 00001CF8 680101                   push 257
  4870 00001CFB E81CF2                   call expect
  4871 00001CFE 83C402                   add  sp, 2
  4872 00001D01 FF36[2B00]               push word [lexval]
  4873 00001D05 E82CE8                   call prunsign1
  4874 00001D08 83C402                   add  sp, 2
  4875                                  
  4876                                  ;-658 }
  4877                                  
  4878                                  
  4879                                  ;-659 int dovar1(int mode, int op, int ixarr, int id1) {
  4880 00001D0B C9                       LEAVE
  4881 00001D0C C3                       ret
  4882 00001D0D 6F6E6C79207363616C-     compoundass_0 db "only scalar Var allowed",0
  4883 00001D16 61722056617220616C-
  4884 00001D1F 6C6F77656400       
  4885 00001D25 5C6E2000                compoundass_1 db "\n ",0
  4886 00001D29 202000                  compoundass_2 db "  ",0
  4887 00001D2C 776F726400              compoundass_3 db "word",0
  4888 00001D31 6279746500              compoundass_4 db "byte",0
  4889 00001D36 2C2000                  compoundass_5 db ", ",0
  4890                                  ENDP
  4891                                  
  4892                                  dovar1: PROC
  4893                                  
  4894                                  ;-660   gettypes(id1);
  4895                                  ;
  4896 00001D39 C8000000                 ENTER  0,0
  4897 00001D3D FF760A                   push word [bp+10]
  4898 00001D40 E883F4                   call gettypes
  4899 00001D43 83C402                   add  sp, 2
  4900                                  
  4901                                  ;-661   if (mode==1) {prs("\n mov bx, "); v(id1); prs("\n "); prs(op);
  4902                                  
  4903 00001D46 8B4604                   mov ax, [bp+4]
  4904 00001D49 83F801                   cmp ax, 1
  4905 00001D4C 0F854D00                 jne .dovar1256
  4906 00001D50 68[A01E]                 push dovar1_0
  4907 00001D53 E889E6                   call prs
  4908 00001D56 83C402                   add  sp, 2
  4909 00001D59 FF760A                   push word [bp+10]
  4910 00001D5C E823F2                   call v
  4911 00001D5F 83C402                   add  sp, 2
  4912 00001D62 68[AC1E]                 push dovar1_1
  4913 00001D65 E877E6                   call prs
  4914 00001D68 83C402                   add  sp, 2
  4915 00001D6B FF7606                   push word [bp+6]
  4916 00001D6E E86EE6                   call prs
  4917 00001D71 83C402                   add  sp, 2
  4918                                  
  4919                                  ;-662     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");
  4920                                  
  4921 00001D74 A1[3300]                 mov ax, [widthi]
  4922 00001D77 83F801                   cmp ax, 1
  4923 00001D7A 0F850900                 jne .dovar1257
  4924 00001D7E 68[B01E]                 push dovar1_2
  4925 00001D81 E85BE6                   call prs
  4926 00001D84 83C402                   add  sp, 2
  4927                                  
  4928                                  ;-663     if(widthi == 2) prs(" ax, [bx]");
  4929                                  
  4930                                  .dovar1257:
  4931 00001D87 A1[3300]                 mov ax, [widthi]
  4932 00001D8A 83F802                   cmp ax, 2
  4933 00001D8D 0F850900                 jne .dovar1258
  4934 00001D91 68[C61E]                 push dovar1_3
  4935 00001D94 E848E6                   call prs
  4936 00001D97 83C402                   add  sp, 2
  4937                                  
  4938                                  ;-664     return; }
  4939                                  
  4940                                  .dovar1258:
  4941 00001D9A E90101                   jmp .retndovar1
  4942                                  
  4943                                  ;-665   if (mode==2){prs("\n ");prs(op);prs(" ax, "); printName(id1); return; }
  4944                                  
  4945                                  .dovar1256:
  4946 00001D9D 8B4604                   mov ax, [bp+4]
  4947 00001DA0 83F802                   cmp ax, 2
  4948 00001DA3 0F852700                 jne .dovar1259
  4949 00001DA7 68[D01E]                 push dovar1_4
  4950 00001DAA E832E6                   call prs
  4951 00001DAD 83C402                   add  sp, 2
  4952 00001DB0 FF7606                   push word [bp+6]
  4953 00001DB3 E829E6                   call prs
  4954 00001DB6 83C402                   add  sp, 2
  4955 00001DB9 68[D41E]                 push dovar1_5
  4956 00001DBC E820E6                   call prs
  4957 00001DBF 83C402                   add  sp, 2
  4958 00001DC2 FF760A                   push word [bp+10]
  4959 00001DC5 E8DCE9                   call printName
  4960 00001DC8 83C402                   add  sp, 2
  4961 00001DCB E9D000                   jmp .retndovar1
  4962                                  
  4963                                  ;-666   if (ixarr) {
  4964                                  
  4965                                  .dovar1259:
  4966 00001DCE 8B4608                   mov ax, [bp+8]
  4967 00001DD1 08C0                     or  al, al
  4968 00001DD3 0F847300                 je .dovar1260
  4969                                  
  4970                                  ;-667     prs("\n mov bx, "); v(ixarr);
  4971                                  
  4972 00001DD7 68[DA1E]                 push dovar1_6
  4973 00001DDA E802E6                   call prs
  4974 00001DDD 83C402                   add  sp, 2
  4975 00001DE0 FF7608                   push word [bp+8]
  4976 00001DE3 E89CF1                   call v
  4977 00001DE6 83C402                   add  sp, 2
  4978                                  
  4979                                  ;-668     if (wi==2) prs("\n shl bx, 1");
  4980                                  
  4981 00001DE9 A1[3600]                 mov ax, [wi]
  4982 00001DEC 83F802                   cmp ax, 2
  4983 00001DEF 0F850900                 jne .dovar1261
  4984 00001DF3 68[E61E]                 push dovar1_7
  4985 00001DF6 E8E6E5                   call prs
  4986 00001DF9 83C402                   add  sp, 2
  4987                                  
  4988                                  ;-669     prs("\n "); prs(op);
  4989                                  
  4990                                  .dovar1261:
  4991 00001DFC 68[F31E]                 push dovar1_8
  4992 00001DFF E8DDE5                   call prs
  4993 00001E02 83C402                   add  sp, 2
  4994 00001E05 FF7606                   push word [bp+6]
  4995 00001E08 E8D4E5                   call prs
  4996 00001E0B 83C402                   add  sp, 2
  4997                                  
  4998                                  ;-670     if (wi==2) prs(" ax, "); else prs(" al, ");
  4999                                  
  5000 00001E0E A1[3600]                 mov ax, [wi]
  5001 00001E11 83F802                   cmp ax, 2
  5002 00001E14 0F850C00                 jne .dovar1262
  5003 00001E18 68[F71E]                 push dovar1_9
  5004 00001E1B E8C1E5                   call prs
  5005 00001E1E 83C402                   add  sp, 2
  5006 00001E21 E90900                   jmp .dovar1263
  5007                                  .dovar1262:
  5008 00001E24 68[FD1E]                 push dovar1_10
  5009 00001E27 E8B5E5                   call prs
  5010 00001E2A 83C402                   add  sp, 2
  5011                                  
  5012                                  ;-671 // v(id1); prs(" [bx]");
  5013                                  
  5014                                  
  5015                                  ;-672     prc('['); printName(id1); prs(" + bx]");
  5016                                  
  5017                                  .dovar1263:
  5018 00001E2D 6A5B                     push 91
  5019 00001E2F E854E5                   call prc
  5020 00001E32 83C402                   add  sp, 2
  5021 00001E35 FF760A                   push word [bp+10]
  5022 00001E38 E869E9                   call printName
  5023 00001E3B 83C402                   add  sp, 2
  5024 00001E3E 68[031F]                 push dovar1_11
  5025 00001E41 E89BE5                   call prs
  5026 00001E44 83C402                   add  sp, 2
  5027                                  
  5028                                  ;-673     return; }
  5029                                  
  5030 00001E47 E95400                   jmp .retndovar1
  5031                                  
  5032                                  ;-674   prs("\n ");prs(op);
  5033                                  
  5034                                  .dovar1260:
  5035 00001E4A 68[0A1F]                 push dovar1_12
  5036 00001E4D E88FE5                   call prs
  5037 00001E50 83C402                   add  sp, 2
  5038 00001E53 FF7606                   push word [bp+6]
  5039 00001E56 E886E5                   call prs
  5040 00001E59 83C402                   add  sp, 2
  5041                                  
  5042                                  ;-675   if(wi==1) prs(" al, ");
  5043                                  
  5044 00001E5C A1[3600]                 mov ax, [wi]
  5045 00001E5F 83F801                   cmp ax, 1
  5046 00001E62 0F850900                 jne .dovar1264
  5047 00001E66 68[0E1F]                 push dovar1_13
  5048 00001E69 E873E5                   call prs
  5049 00001E6C 83C402                   add  sp, 2
  5050                                  
  5051                                  ;-676   if(wi==2) prs(" ax, ");
  5052                                  
  5053                                  .dovar1264:
  5054 00001E6F A1[3600]                 mov ax, [wi]
  5055 00001E72 83F802                   cmp ax, 2
  5056 00001E75 0F850900                 jne .dovar1265
  5057 00001E79 68[141F]                 push dovar1_14
  5058 00001E7C E860E5                   call prs
  5059 00001E7F 83C402                   add  sp, 2
  5060                                  
  5061                                  ;-677   if(wi==4) prs(" eax, ");
  5062                                  
  5063                                  .dovar1265:
  5064 00001E82 A1[3600]                 mov ax, [wi]
  5065 00001E85 83F804                   cmp ax, 4
  5066 00001E88 0F850900                 jne .dovar1266
  5067 00001E8C 68[1A1F]                 push dovar1_15
  5068 00001E8F E84DE5                   call prs
  5069 00001E92 83C402                   add  sp, 2
  5070                                  
  5071                                  ;-678   v(id1);
  5072                                  
  5073                                  .dovar1266:
  5074 00001E95 FF760A                   push word [bp+10]
  5075 00001E98 E8E7F0                   call v
  5076 00001E9B 83C402                   add  sp, 2
  5077                                  
  5078                                  ;-679 }
  5079                                  
  5080                                  
  5081                                  ;-680 int rterm(char *op) {int mode; int opint; int ixarr; int id1;
  5082                                  
  5083 00001E9E C9                       .retndovar1: LEAVE
  5084 00001E9F C3                       ret
  5085 00001EA0 5C6E206D6F76206278-     dovar1_0 db "\n mov bx, ",0
  5086 00001EA9 2C2000             
  5087 00001EAC 5C6E2000                dovar1_1 db "\n ",0
  5088 00001EB0 20616C2C205B62785D-     dovar1_2 db " al, [bx]\n mov ah, 0",0
  5089 00001EB9 5C6E206D6F76206168-
  5090 00001EC2 2C203000           
  5091 00001EC6 2061782C205B62785D-     dovar1_3 db " ax, [bx]",0
  5092 00001ECF 00                 
  5093 00001ED0 5C6E2000                dovar1_4 db "\n ",0
  5094 00001ED4 2061782C2000            dovar1_5 db " ax, ",0
  5095 00001EDA 5C6E206D6F76206278-     dovar1_6 db "\n mov bx, ",0
  5096 00001EE3 2C2000             
  5097 00001EE6 5C6E2073686C206278-     dovar1_7 db "\n shl bx, 1",0
  5098 00001EEF 2C203100           
  5099 00001EF3 5C6E2000                dovar1_8 db "\n ",0
  5100 00001EF7 2061782C2000            dovar1_9 db " ax, ",0
  5101 00001EFD 20616C2C2000            dovar1_10 db " al, ",0
  5102 00001F03 202B2062785D00          dovar1_11 db " + bx]",0
  5103 00001F0A 5C6E2000                dovar1_12 db "\n ",0
  5104 00001F0E 20616C2C2000            dovar1_13 db " al, ",0
  5105 00001F14 2061782C2000            dovar1_14 db " ax, ",0
  5106 00001F1A 206561782C2000          dovar1_15 db " eax, ",0
  5107                                  ENDP
  5108                                  
  5109                                  rterm: PROC
  5110                                  
  5111                                  ;-681   if (istoken(T_CONST)) { prs("\n "); prs(op);
  5112                                  ;
  5113 00001F21 C8080000                 ENTER  8,0
  5114 00001F25 680101                   push 257
  5115 00001F28 E8CDEF                   call istoken
  5116 00001F2B 83C402                   add  sp, 2
  5117 00001F2E 08C0                     or  al, al
  5118 00001F30 0F845800                 je .rterm267
  5119 00001F34 68[1020]                 push rterm_0
  5120 00001F37 E8A5E4                   call prs
  5121 00001F3A 83C402                   add  sp, 2
  5122 00001F3D FF7604                   push word [bp+4]
  5123 00001F40 E89CE4                   call prs
  5124 00001F43 83C402                   add  sp, 2
  5125                                  
  5126                                  ;-682     if (wi==1) prs(" al, ");
  5127                                  
  5128 00001F46 A1[3600]                 mov ax, [wi]
  5129 00001F49 83F801                   cmp ax, 1
  5130 00001F4C 0F850900                 jne .rterm268
  5131 00001F50 68[1420]                 push rterm_1
  5132 00001F53 E889E4                   call prs
  5133 00001F56 83C402                   add  sp, 2
  5134                                  
  5135                                  ;-683     if (wi==2) prs(" ax, ");
  5136                                  
  5137                                  .rterm268:
  5138 00001F59 A1[3600]                 mov ax, [wi]
  5139 00001F5C 83F802                   cmp ax, 2
  5140 00001F5F 0F850900                 jne .rterm269
  5141 00001F63 68[1A20]                 push rterm_2
  5142 00001F66 E876E4                   call prs
  5143 00001F69 83C402                   add  sp, 2
  5144                                  
  5145                                  ;-684     if (wi==4) prs(" eax, ");
  5146                                  
  5147                                  .rterm269:
  5148 00001F6C A1[3600]                 mov ax, [wi]
  5149 00001F6F 83F804                   cmp ax, 4
  5150 00001F72 0F850900                 jne .rterm270
  5151 00001F76 68[2020]                 push rterm_3
  5152 00001F79 E863E4                   call prs
  5153 00001F7C 83C402                   add  sp, 2
  5154                                  
  5155                                  ;-685     prunsign1(lexval); return;}
  5156                                  
  5157                                  .rterm270:
  5158 00001F7F FF36[2B00]               push word [lexval]
  5159 00001F83 E8AEE5                   call prunsign1
  5160 00001F86 83C402                   add  sp, 2
  5161 00001F89 E98200                   jmp .retnrterm
  5162                                  
  5163                                  ;-686   mode=typeName(); id1=searchname(); ixarr=0;
  5164                                  
  5165                                  .rterm267:
  5166 00001F8C E85EF1                   call typeName
  5167 00001F8F 8946FE                   mov [bp-2], ax
  5168 00001F92 E8FAF0                   call searchname
  5169 00001F95 8946F8                   mov [bp-8], ax
  5170 00001F98 B80000                   mov ax, 0
  5171 00001F9B 8946FA                   mov [bp-6], ax
  5172                                  
  5173                                  ;-687   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');
  5174                                  
  5175 00001F9E 6A5B                     push 91
  5176 00001FA0 E855EF                   call istoken
  5177 00001FA3 83C402                   add  sp, 2
  5178 00001FA6 08C0                     or  al, al
  5179 00001FA8 0F843300                 je .rterm271
  5180 00001FAC E8E0F0                   call searchname
  5181 00001FAF 8946FA                   mov [bp-6], ax
  5182 00001FB2 680001                   push 256
  5183 00001FB5 E862EF                   call expect
  5184 00001FB8 83C402                   add  sp, 2
  5185 00001FBB 6A5D                     push 93
  5186 00001FBD E85AEF                   call expect
  5187 00001FC0 83C402                   add  sp, 2
  5188                                  
  5189                                  ;-688     gettypes(ixarr);
  5190                                  
  5191 00001FC3 FF76FA                   push word [bp-6]
  5192 00001FC6 E8FDF1                   call gettypes
  5193 00001FC9 83C402                   add  sp, 2
  5194                                  
  5195                                  ;-689     if (widthi != 2) error1("Arrayindex muss int sein"); }
  5196                                  
  5197 00001FCC A1[3300]                 mov ax, [widthi]
  5198 00001FCF 83F802                   cmp ax, 2
  5199 00001FD2 0F840900                 je  .rterm272
  5200 00001FD6 68[2720]                 push rterm_4
  5201 00001FD9 E8BFE5                   call error1
  5202 00001FDC 83C402                   add  sp, 2
  5203                                  .rterm272:
  5204                                  
  5205                                  ;-690   if (eqstr(symbol,"_AX")) return;
  5206                                  
  5207                                  .rterm271:
  5208 00001FDF 68[4020]                 push rterm_5
  5209 00001FE2 8D06606D                 lea  ax, [symbol]
  5210 00001FE6 50                       push ax
  5211 00001FE7 E875E2                   call eqstr
  5212 00001FEA 83C404                   add  sp, 4
  5213 00001FED 08C0                     or  al, al
  5214 00001FEF 0F840300                 je .rterm273
  5215 00001FF3 E91800                   jmp .retnrterm
  5216                                  
  5217                                  ;-691   opint=op; dovar1(mode, opint, ixarr, id1);
  5218                                  
  5219                                  .rterm273:
  5220 00001FF6 8B4604                   mov ax, [bp+4]
  5221 00001FF9 8946FC                   mov [bp-4], ax
  5222 00001FFC FF76F8                   push word [bp-8]
  5223 00001FFF FF76FA                   push word [bp-6]
  5224 00002002 FF76FC                   push word [bp-4]
  5225 00002005 FF76FE                   push word [bp-2]
  5226 00002008 E82EFD                   call dovar1
  5227 0000200B 83C408                   add  sp, 8
  5228                                  
  5229                                  ;-692 }
  5230                                  
  5231                                  
  5232                                  ;-693 
  5233                                  
  5234                                  
  5235                                  ;-694 int doreg(char *dr) { int i; expect('=');
  5236                                  
  5237 0000200E C9                       .retnrterm: LEAVE
  5238 0000200F C3                       ret
  5239 00002010 5C6E2000                rterm_0 db "\n ",0
  5240 00002014 20616C2C2000            rterm_1 db " al, ",0
  5241 0000201A 2061782C2000            rterm_2 db " ax, ",0
  5242 00002020 206561782C2000          rterm_3 db " eax, ",0
  5243 00002027 4172726179696E6465-     rterm_4 db "Arrayindex muss int sein",0
  5244 00002030 78206D75737320696E-
  5245 00002039 74207365696E00     
  5246 00002040 5F415800                rterm_5 db "_AX",0
  5247                                  ENDP
  5248                                  
  5249                                  doreg: PROC;
  5250 00002044 C8020000                 ENTER  2,0
  5251 00002048 6A3D                     push 61
  5252 0000204A E8CDEE                   call expect
  5253 0000204D 83C402                   add  sp, 2
  5254                                  
  5255                                  ;-695   prs("\n mov  "); prs(dr); prs(", ");
  5256                                  
  5257 00002050 68[B320]                 push doreg_0
  5258 00002053 E889E3                   call prs
  5259 00002056 83C402                   add  sp, 2
  5260 00002059 FF7604                   push word [bp+4]
  5261 0000205C E880E3                   call prs
  5262 0000205F 83C402                   add  sp, 2
  5263 00002062 68[BC20]                 push doreg_1
  5264 00002065 E877E3                   call prs
  5265 00002068 83C402                   add  sp, 2
  5266                                  
  5267                                  ;-696        if (istoken(T_CONST)) prunsign1(lexval);
  5268                                  
  5269 0000206B 680101                   push 257
  5270 0000206E E887EE                   call istoken
  5271 00002071 83C402                   add  sp, 2
  5272 00002074 08C0                     or  al, al
  5273 00002076 0F840D00                 je .doreg274
  5274 0000207A FF36[2B00]               push word [lexval]
  5275 0000207E E8B3E4                   call prunsign1
  5276 00002081 83C402                   add  sp, 2
  5277                                  
  5278                                  ;-697   else if (istoken(T_NAME )) { i=searchname(); v(i); }
  5279                                  
  5280 00002084 E92A00                   jmp .doreg275
  5281                                  .doreg274:
  5282 00002087 680001                   push 256
  5283 0000208A E86BEE                   call istoken
  5284 0000208D 83C402                   add  sp, 2
  5285 00002090 08C0                     or  al, al
  5286 00002092 0F841200                 je .doreg276
  5287 00002096 E8F6EF                   call searchname
  5288 00002099 8946FE                   mov [bp-2], ax
  5289 0000209C FF76FE                   push word [bp-2]
  5290 0000209F E8E0EE                   call v
  5291 000020A2 83C402                   add  sp, 2
  5292                                  
  5293                                  ;-698   else error1("only number or var allowed");
  5294                                  
  5295 000020A5 E90900                   jmp .doreg277
  5296                                  .doreg276:
  5297 000020A8 68[BF20]                 push doreg_2
  5298 000020AB E8EDE4                   call error1
  5299 000020AE 83C402                   add  sp, 2
  5300                                  
  5301                                  ;-699 }
  5302                                  
  5303                                  .doreg277:
  5304                                  .doreg275:
  5305                                  
  5306                                  ;-700 int isreg() {
  5307 000020B1 C9                       LEAVE
  5308 000020B2 C3                       ret
  5309 000020B3 5C6E206D6F76202000      doreg_0 db "\n mov  ",0
  5310 000020BC 2C2000                  doreg_1 db ", ",0
  5311 000020BF 6F6E6C79206E756D62-     doreg_2 db "only number or var allowed",0
  5312 000020C8 6572206F7220766172-
  5313 000020D1 20616C6C6F77656400 
  5314                                  ENDP
  5315                                  
  5316                                  isreg: PROC
  5317                                  
  5318                                  ;-701   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}
  5319                                  
  5320 000020DA 68[C722]                 push isreg_0
  5321 000020DD 8D06606D                 lea  ax, [symbol]
  5322 000020E1 50                       push ax
  5323 000020E2 E87AE1                   call eqstr
  5324 000020E5 83C404                   add  sp, 4
  5325 000020E8 08C0                     or  al, al
  5326 000020EA 0F840C00                 je .isreg278
  5327 000020EE 68[CB22]                 push isreg_1
  5328 000020F1 E850FF                   call doreg
  5329 000020F4 83C402                   add  sp, 2
  5330 000020F7 E9C601                   jmp .r1
  5331                                  
  5332                                  ;-702   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}
  5333                                  
  5334                                  .isreg278:
  5335 000020FA 68[CE22]                 push isreg_2
  5336 000020FD 8D06606D                 lea  ax, [symbol]
  5337 00002101 50                       push ax
  5338 00002102 E85AE1                   call eqstr
  5339 00002105 83C404                   add  sp, 4
  5340 00002108 08C0                     or  al, al
  5341 0000210A 0F840C00                 je .isreg279
  5342 0000210E 68[D222]                 push isreg_3
  5343 00002111 E830FF                   call doreg
  5344 00002114 83C402                   add  sp, 2
  5345 00002117 E9A601                   jmp .r1
  5346                                  
  5347                                  ;-703   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}
  5348                                  
  5349                                  .isreg279:
  5350 0000211A 68[D522]                 push isreg_4
  5351 0000211D 8D06606D                 lea  ax, [symbol]
  5352 00002121 50                       push ax
  5353 00002122 E83AE1                   call eqstr
  5354 00002125 83C404                   add  sp, 4
  5355 00002128 08C0                     or  al, al
  5356 0000212A 0F840C00                 je .isreg280
  5357 0000212E 68[D922]                 push isreg_5
  5358 00002131 E810FF                   call doreg
  5359 00002134 83C402                   add  sp, 2
  5360 00002137 E98601                   jmp .r1
  5361                                  
  5362                                  ;-704   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}
  5363                                  
  5364                                  .isreg280:
  5365 0000213A 68[DC22]                 push isreg_6
  5366 0000213D 8D06606D                 lea  ax, [symbol]
  5367 00002141 50                       push ax
  5368 00002142 E81AE1                   call eqstr
  5369 00002145 83C404                   add  sp, 4
  5370 00002148 08C0                     or  al, al
  5371 0000214A 0F840C00                 je .isreg281
  5372 0000214E 68[E022]                 push isreg_7
  5373 00002151 E8F0FE                   call doreg
  5374 00002154 83C402                   add  sp, 2
  5375 00002157 E96601                   jmp .r1
  5376                                  
  5377                                  ;-705   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}
  5378                                  
  5379                                  .isreg281:
  5380 0000215A 68[E322]                 push isreg_8
  5381 0000215D 8D06606D                 lea  ax, [symbol]
  5382 00002161 50                       push ax
  5383 00002162 E8FAE0                   call eqstr
  5384 00002165 83C404                   add  sp, 4
  5385 00002168 08C0                     or  al, al
  5386 0000216A 0F840C00                 je .isreg282
  5387 0000216E 68[E722]                 push isreg_9
  5388 00002171 E8D0FE                   call doreg
  5389 00002174 83C402                   add  sp, 2
  5390 00002177 E94601                   jmp .r1
  5391                                  
  5392                                  ;-706   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}
  5393                                  
  5394                                  .isreg282:
  5395 0000217A 68[EA22]                 push isreg_10
  5396 0000217D 8D06606D                 lea  ax, [symbol]
  5397 00002181 50                       push ax
  5398 00002182 E8DAE0                   call eqstr
  5399 00002185 83C404                   add  sp, 4
  5400 00002188 08C0                     or  al, al
  5401 0000218A 0F840C00                 je .isreg283
  5402 0000218E 68[EE22]                 push isreg_11
  5403 00002191 E8B0FE                   call doreg
  5404 00002194 83C402                   add  sp, 2
  5405 00002197 E92601                   jmp .r1
  5406                                  
  5407                                  ;-707   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}
  5408                                  
  5409                                  .isreg283:
  5410 0000219A 68[F122]                 push isreg_12
  5411 0000219D 8D06606D                 lea  ax, [symbol]
  5412 000021A1 50                       push ax
  5413 000021A2 E8BAE0                   call eqstr
  5414 000021A5 83C404                   add  sp, 4
  5415 000021A8 08C0                     or  al, al
  5416 000021AA 0F840C00                 je .isreg284
  5417 000021AE 68[F522]                 push isreg_13
  5418 000021B1 E890FE                   call doreg
  5419 000021B4 83C402                   add  sp, 2
  5420 000021B7 E90601                   jmp .r1
  5421                                  
  5422                                  ;-708   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}
  5423                                  
  5424                                  .isreg284:
  5425 000021BA 68[F822]                 push isreg_14
  5426 000021BD 8D06606D                 lea  ax, [symbol]
  5427 000021C1 50                       push ax
  5428 000021C2 E89AE0                   call eqstr
  5429 000021C5 83C404                   add  sp, 4
  5430 000021C8 08C0                     or  al, al
  5431 000021CA 0F840C00                 je .isreg285
  5432 000021CE 68[FC22]                 push isreg_15
  5433 000021D1 E870FE                   call doreg
  5434 000021D4 83C402                   add  sp, 2
  5435 000021D7 E9E600                   jmp .r1
  5436                                  
  5437                                  ;-709   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}
  5438                                  
  5439                                  .isreg285:
  5440 000021DA 68[FF22]                 push isreg_16
  5441 000021DD 8D06606D                 lea  ax, [symbol]
  5442 000021E1 50                       push ax
  5443 000021E2 E87AE0                   call eqstr
  5444 000021E5 83C404                   add  sp, 4
  5445 000021E8 08C0                     or  al, al
  5446 000021EA 0F840C00                 je .isreg286
  5447 000021EE 68[0323]                 push isreg_17
  5448 000021F1 E850FE                   call doreg
  5449 000021F4 83C402                   add  sp, 2
  5450 000021F7 E9C600                   jmp .r1
  5451                                  
  5452                                  ;-710   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}
  5453                                  
  5454                                  .isreg286:
  5455 000021FA 68[0623]                 push isreg_18
  5456 000021FD 8D06606D                 lea  ax, [symbol]
  5457 00002201 50                       push ax
  5458 00002202 E85AE0                   call eqstr
  5459 00002205 83C404                   add  sp, 4
  5460 00002208 08C0                     or  al, al
  5461 0000220A 0F840C00                 je .isreg287
  5462 0000220E 68[0A23]                 push isreg_19
  5463 00002211 E830FE                   call doreg
  5464 00002214 83C402                   add  sp, 2
  5465 00002217 E9A600                   jmp .r1
  5466                                  
  5467                                  ;-711   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}
  5468                                  
  5469                                  .isreg287:
  5470 0000221A 68[0D23]                 push isreg_20
  5471 0000221D 8D06606D                 lea  ax, [symbol]
  5472 00002221 50                       push ax
  5473 00002222 E83AE0                   call eqstr
  5474 00002225 83C404                   add  sp, 4
  5475 00002228 08C0                     or  al, al
  5476 0000222A 0F840C00                 je .isreg288
  5477 0000222E 68[1123]                 push isreg_21
  5478 00002231 E810FE                   call doreg
  5479 00002234 83C402                   add  sp, 2
  5480 00002237 E98600                   jmp .r1
  5481                                  
  5482                                  ;-712   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}
  5483                                  
  5484                                  .isreg288:
  5485 0000223A 68[1423]                 push isreg_22
  5486 0000223D 8D06606D                 lea  ax, [symbol]
  5487 00002241 50                       push ax
  5488 00002242 E81AE0                   call eqstr
  5489 00002245 83C404                   add  sp, 4
  5490 00002248 08C0                     or  al, al
  5491 0000224A 0F840C00                 je .isreg289
  5492 0000224E 68[1823]                 push isreg_23
  5493 00002251 E8F0FD                   call doreg
  5494 00002254 83C402                   add  sp, 2
  5495 00002257 E96600                   jmp .r1
  5496                                  
  5497                                  ;-713   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}
  5498                                  
  5499                                  .isreg289:
  5500 0000225A 68[1B23]                 push isreg_24
  5501 0000225D 8D06606D                 lea  ax, [symbol]
  5502 00002261 50                       push ax
  5503 00002262 E8FADF                   call eqstr
  5504 00002265 83C404                   add  sp, 4
  5505 00002268 08C0                     or  al, al
  5506 0000226A 0F840C00                 je .isreg290
  5507 0000226E 68[1F23]                 push isreg_25
  5508 00002271 E8D0FD                   call doreg
  5509 00002274 83C402                   add  sp, 2
  5510 00002277 E94600                   jmp .r1
  5511                                  
  5512                                  ;-714   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}
  5513                                  
  5514                                  .isreg290:
  5515 0000227A 68[2223]                 push isreg_26
  5516 0000227D 8D06606D                 lea  ax, [symbol]
  5517 00002281 50                       push ax
  5518 00002282 E8DADF                   call eqstr
  5519 00002285 83C404                   add  sp, 4
  5520 00002288 08C0                     or  al, al
  5521 0000228A 0F840C00                 je .isreg291
  5522 0000228E 68[2623]                 push isreg_27
  5523 00002291 E8B0FD                   call doreg
  5524 00002294 83C402                   add  sp, 2
  5525 00002297 E92600                   jmp .r1
  5526                                  
  5527                                  ;-715   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}
  5528                                  
  5529                                  .isreg291:
  5530 0000229A 68[2923]                 push isreg_28
  5531 0000229D 8D06606D                 lea  ax, [symbol]
  5532 000022A1 50                       push ax
  5533 000022A2 E8BADF                   call eqstr
  5534 000022A5 83C404                   add  sp, 4
  5535 000022A8 08C0                     or  al, al
  5536 000022AA 0F840C00                 je .isreg292
  5537 000022AE 68[3023]                 push isreg_29
  5538 000022B1 E890FD                   call doreg
  5539 000022B4 83C402                   add  sp, 2
  5540 000022B7 E90600                   jmp .r1
  5541                                  
  5542                                  ;-716   return 0;   r1: return 1;
  5543                                  
  5544                                  .isreg292:
  5545 000022BA B80000                   mov ax, 0
  5546 000022BD E90600                   jmp .retnisreg
  5547                                  .r1:
  5548 000022C0 B80100                   mov ax, 1
  5549 000022C3 E90000                   jmp .retnisreg
  5550                                  
  5551                                  ;-717 }
  5552                                  
  5553                                  
  5554                                  ;-718 
  5555                                  
  5556                                  
  5557                                  ;-719 int doassign(int mode, int i, int ixarr, int ixconst) {
  5558                                  
  5559                                   .retnisreg:
  5560 000022C6 C3                       ret
  5561 000022C7 5F414800                isreg_0 db "_AH",0
  5562 000022CB 616800                  isreg_1 db "ah",0
  5563 000022CE 5F414C00                isreg_2 db "_AL",0
  5564 000022D2 616C00                  isreg_3 db "al",0
  5565 000022D5 5F415800                isreg_4 db "_AX",0
  5566 000022D9 617800                  isreg_5 db "ax",0
  5567 000022DC 5F424800                isreg_6 db "_BH",0
  5568 000022E0 626800                  isreg_7 db "bh",0
  5569 000022E3 5F424C00                isreg_8 db "_BL",0
  5570 000022E7 626C00                  isreg_9 db "bl",0
  5571 000022EA 5F425800                isreg_10 db "_BX",0
  5572 000022EE 627800                  isreg_11 db "bx",0
  5573 000022F1 5F434800                isreg_12 db "_CH",0
  5574 000022F5 636800                  isreg_13 db "ch",0
  5575 000022F8 5F434C00                isreg_14 db "_CL",0
  5576 000022FC 636C00                  isreg_15 db "cl",0
  5577 000022FF 5F435800                isreg_16 db "_CX",0
  5578 00002303 637800                  isreg_17 db "cx",0
  5579 00002306 5F444800                isreg_18 db "_DH",0
  5580 0000230A 646800                  isreg_19 db "dh",0
  5581 0000230D 5F444C00                isreg_20 db "_DL",0
  5582 00002311 646C00                  isreg_21 db "dl",0
  5583 00002314 5F445800                isreg_22 db "_DX",0
  5584 00002318 647800                  isreg_23 db "dx",0
  5585 0000231B 5F534900                isreg_24 db "_SI",0
  5586 0000231F 736900                  isreg_25 db "si",0
  5587 00002322 5F444900                isreg_26 db "_DI",0
  5588 00002326 646900                  isreg_27 db "di",0
  5589 00002329 5F464C41475300          isreg_28 db "_FLAGS",0
  5590 00002330 666C61677300            isreg_29 db "flags",0
  5591                                  ENDP
  5592                                  
  5593                                  doassign: PROC
  5594                                  
  5595                                  ;-720   gettypes(i);
  5596                                  ;
  5597 00002336 C8000000                 ENTER  0,0
  5598 0000233A FF7606                   push word [bp+6]
  5599 0000233D E886EE                   call gettypes
  5600 00002340 83C402                   add  sp, 2
  5601                                  
  5602                                  ;-721   if (mode==1) {prs("\n mov  bx, ");v(i);
  5603                                  
  5604 00002343 8B4604                   mov ax, [bp+4]
  5605 00002346 83F801                   cmp ax, 1
  5606 00002349 0F853400                 jne .doassign293
  5607 0000234D 68[D324]                 push doassign_0
  5608 00002350 E88CE0                   call prs
  5609 00002353 83C402                   add  sp, 2
  5610 00002356 FF7606                   push word [bp+6]
  5611 00002359 E826EC                   call v
  5612 0000235C 83C402                   add  sp, 2
  5613                                  
  5614                                  ;-722     if (widthi == 2) prs("\n mov  [bx], ax");
  5615                                  
  5616 0000235F A1[3300]                 mov ax, [widthi]
  5617 00002362 83F802                   cmp ax, 2
  5618 00002365 0F850C00                 jne .doassign294
  5619 00002369 68[E024]                 push doassign_1
  5620 0000236C E870E0                   call prs
  5621 0000236F 83C402                   add  sp, 2
  5622                                  
  5623                                  ;-723     else  prs("\n mov  [bx], al"); return;}
  5624                                  
  5625 00002372 E90900                   jmp .doassign295
  5626                                  .doassign294:
  5627 00002375 68[F124]                 push doassign_2
  5628 00002378 E864E0                   call prs
  5629 0000237B 83C402                   add  sp, 2
  5630                                  .doassign295:
  5631 0000237E E95001                   jmp .retndoassign
  5632                                  
  5633                                  ;-724   if (mode==2) {prs("\n mov  ");printName(i); prs(", ax"); return;}
  5634                                  
  5635                                  .doassign293:
  5636 00002381 8B4604                   mov ax, [bp+4]
  5637 00002384 83F802                   cmp ax, 2
  5638 00002387 0F851E00                 jne .doassign296
  5639 0000238B 68[0225]                 push doassign_3
  5640 0000238E E84EE0                   call prs
  5641 00002391 83C402                   add  sp, 2
  5642 00002394 FF7606                   push word [bp+6]
  5643 00002397 E80AE4                   call printName
  5644 0000239A 83C402                   add  sp, 2
  5645 0000239D 68[0B25]                 push doassign_4
  5646 000023A0 E83CE0                   call prs
  5647 000023A3 83C402                   add  sp, 2
  5648 000023A6 E92801                   jmp .retndoassign
  5649                                  
  5650                                  ;-725   if (ixarr) {  prs("\n mov bx, ");
  5651                                  
  5652                                  .doassign296:
  5653 000023A9 8B4608                   mov ax, [bp+8]
  5654 000023AC 08C0                     or  al, al
  5655 000023AE 0F846E00                 je .doassign297
  5656 000023B2 68[1025]                 push doassign_5
  5657 000023B5 E827E0                   call prs
  5658 000023B8 83C402                   add  sp, 2
  5659                                  
  5660                                  ;-726     if(ixconst) prunsign1(ixarr); else v(ixarr);
  5661                                  
  5662 000023BB 8B460A                   mov ax, [bp+10]
  5663 000023BE 08C0                     or  al, al
  5664 000023C0 0F840C00                 je .doassign298
  5665 000023C4 FF7608                   push word [bp+8]
  5666 000023C7 E86AE1                   call prunsign1
  5667 000023CA 83C402                   add  sp, 2
  5668 000023CD E90900                   jmp .doassign299
  5669                                  .doassign298:
  5670 000023D0 FF7608                   push word [bp+8]
  5671 000023D3 E8ACEB                   call v
  5672 000023D6 83C402                   add  sp, 2
  5673                                  
  5674                                  ;-727     if (wi==2) prs("\n shl bx, 1");
  5675                                  
  5676                                  .doassign299:
  5677 000023D9 A1[3600]                 mov ax, [wi]
  5678 000023DC 83F802                   cmp ax, 2
  5679 000023DF 0F850900                 jne .doassign300
  5680 000023E3 68[1C25]                 push doassign_6
  5681 000023E6 E8F6DF                   call prs
  5682 000023E9 83C402                   add  sp, 2
  5683                                  
  5684                                  ;-728     prs("\n mov ["); printName(i);
  5685                                  
  5686                                  .doassign300:
  5687 000023EC 68[2925]                 push doassign_7
  5688 000023EF E8EDDF                   call prs
  5689 000023F2 83C402                   add  sp, 2
  5690 000023F5 FF7606                   push word [bp+6]
  5691 000023F8 E8A9E3                   call printName
  5692 000023FB 83C402                   add  sp, 2
  5693                                  
  5694                                  ;-729     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }
  5695                                  
  5696 000023FE A1[3600]                 mov ax, [wi]
  5697 00002401 83F802                   cmp ax, 2
  5698 00002404 0F850C00                 jne .doassign301
  5699 00002408 68[3225]                 push doassign_8
  5700 0000240B E8D1DF                   call prs
  5701 0000240E 83C402                   add  sp, 2
  5702 00002411 E90900                   jmp .doassign302
  5703                                  .doassign301:
  5704 00002414 68[3B25]                 push doassign_9
  5705 00002417 E8C5DF                   call prs
  5706 0000241A 83C402                   add  sp, 2
  5707                                  .doassign302:
  5708 0000241D E9B100                   jmp .retndoassign
  5709                                  
  5710                                  ;-730   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");
  5711                                  
  5712                                  .doassign297:
  5713 00002420 A1[3600]                 mov ax, [wi]
  5714 00002423 83F801                   cmp ax, 1
  5715 00002426 0F853100                 jne .doassign303
  5716 0000242A 68[4425]                 push doassign_10
  5717 0000242D E8AFDF                   call prs
  5718 00002430 83C402                   add  sp, 2
  5719 00002433 8B4606                   mov ax, [bp+6]
  5720 00002436 3DC800                   cmp ax, 200
  5721 00002439 0F8D0900                 jge .doassign304
  5722 0000243D 68[4C25]                 push doassign_11
  5723 00002440 E89CDF                   call prs
  5724 00002443 83C402                   add  sp, 2
  5725                                  
  5726                                  ;-731     } v(i); prs(", al"); return; }
  5727                                  
  5728                                  .doassign304:
  5729 00002446 FF7606                   push word [bp+6]
  5730 00002449 E836EB                   call v
  5731 0000244C 83C402                   add  sp, 2
  5732 0000244F 68[5225]                 push doassign_12
  5733 00002452 E88ADF                   call prs
  5734 00002455 83C402                   add  sp, 2
  5735 00002458 E97600                   jmp .retndoassign
  5736                                  
  5737                                  ;-732   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");
  5738                                  
  5739                                  .doassign303:
  5740 0000245B A1[3600]                 mov ax, [wi]
  5741 0000245E 83F802                   cmp ax, 2
  5742 00002461 0F853100                 jne .doassign305
  5743 00002465 68[5725]                 push doassign_13
  5744 00002468 E874DF                   call prs
  5745 0000246B 83C402                   add  sp, 2
  5746 0000246E 8B4606                   mov ax, [bp+6]
  5747 00002471 3DC800                   cmp ax, 200
  5748 00002474 0F8D0900                 jge .doassign306
  5749 00002478 68[5F25]                 push doassign_14
  5750 0000247B E861DF                   call prs
  5751 0000247E 83C402                   add  sp, 2
  5752                                  
  5753                                  ;-733     } v(i); prs(", ax"); return; }
  5754                                  
  5755                                  .doassign306:
  5756 00002481 FF7606                   push word [bp+6]
  5757 00002484 E8FBEA                   call v
  5758 00002487 83C402                   add  sp, 2
  5759 0000248A 68[6525]                 push doassign_15
  5760 0000248D E84FDF                   call prs
  5761 00002490 83C402                   add  sp, 2
  5762 00002493 E93B00                   jmp .retndoassign
  5763                                  
  5764                                  ;-734   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");
  5765                                  
  5766                                  .doassign305:
  5767 00002496 A1[3600]                 mov ax, [wi]
  5768 00002499 83F804                   cmp ax, 4
  5769 0000249C 0F853100                 jne .doassign307
  5770 000024A0 68[6A25]                 push doassign_16
  5771 000024A3 E839DF                   call prs
  5772 000024A6 83C402                   add  sp, 2
  5773 000024A9 8B4606                   mov ax, [bp+6]
  5774 000024AC 3DC800                   cmp ax, 200
  5775 000024AF 0F8D0900                 jge .doassign308
  5776 000024B3 68[7225]                 push doassign_17
  5777 000024B6 E826DF                   call prs
  5778 000024B9 83C402                   add  sp, 2
  5779                                  
  5780                                  ;-735     } v(i); prs(", eax"); return; }
  5781                                  
  5782                                  .doassign308:
  5783 000024BC FF7606                   push word [bp+6]
  5784 000024BF E8C0EA                   call v
  5785 000024C2 83C402                   add  sp, 2
  5786 000024C5 68[7925]                 push doassign_18
  5787 000024C8 E814DF                   call prs
  5788 000024CB 83C402                   add  sp, 2
  5789 000024CE E90000                   jmp .retndoassign
  5790                                  
  5791                                  ;-736 }
  5792                                  
  5793                                  .doassign307:
  5794                                  
  5795                                  ;-737 int domul(int ids) {
  5796                                  
  5797 000024D1 C9                       .retndoassign: LEAVE
  5798 000024D2 C3                       ret
  5799 000024D3 5C6E206D6F76202062-     doassign_0 db "\n mov  bx, ",0
  5800 000024DC 782C2000           
  5801 000024E0 5C6E206D6F7620205B-     doassign_1 db "\n mov  [bx], ax",0
  5802 000024E9 62785D2C20617800   
  5803 000024F1 5C6E206D6F7620205B-     doassign_2 db "\n mov  [bx], al",0
  5804 000024FA 62785D2C20616C00   
  5805 00002502 5C6E206D6F76202000      doassign_3 db "\n mov  ",0
  5806 0000250B 2C20617800              doassign_4 db ", ax",0
  5807 00002510 5C6E206D6F76206278-     doassign_5 db "\n mov bx, ",0
  5808 00002519 2C2000             
  5809 0000251C 5C6E2073686C206278-     doassign_6 db "\n shl bx, 1",0
  5810 00002525 2C203100           
  5811 00002529 5C6E206D6F76205B00      doassign_7 db "\n mov [",0
  5812 00002532 2B62785D2C20617800      doassign_8 db "+bx], ax",0
  5813 0000253B 2B62785D2C20616C00      doassign_9 db "+bx], al",0
  5814 00002544 5C6E206D6F762000        doassign_10 db "\n mov ",0
  5815 0000254C 627974652000            doassign_11 db "byte ",0
  5816 00002552 2C20616C00              doassign_12 db ", al",0
  5817 00002557 5C6E206D6F762000        doassign_13 db "\n mov ",0
  5818 0000255F 776F72642000            doassign_14 db "word ",0
  5819 00002565 2C20617800              doassign_15 db ", ax",0
  5820 0000256A 5C6E206D6F762000        doassign_16 db "\n mov ",0
  5821 00002572 64776F72642000          doassign_17 db "dword ",0
  5822 00002579 2C2065617800            doassign_18 db ", eax",0
  5823                                  ENDP
  5824                                  
  5825                                  domul: PROC
  5826                                  
  5827                                  ;-738   if (ids) rterm("imul"); else {
  5828                                  ;
  5829 0000257F C8000000                 ENTER  0,0
  5830 00002583 8B4604                   mov ax, [bp+4]
  5831 00002586 08C0                     or  al, al
  5832 00002588 0F840C00                 je .domul309
  5833 0000258C 68[D125]                 push domul_0
  5834 0000258F E88FF9                   call rterm
  5835 00002592 83C402                   add  sp, 2
  5836 00002595 E93700                   jmp .domul310
  5837                                  .domul309:
  5838                                  
  5839                                  ;-739   if (istoken(T_CONST)) {
  5840                                  
  5841 00002598 680101                   push 257
  5842 0000259B E85AE9                   call istoken
  5843 0000259E 83C402                   add  sp, 2
  5844 000025A1 08C0                     or  al, al
  5845 000025A3 0F841F00                 je .domul311
  5846                                  
  5847                                  ;-740     prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx");
  5848                                  
  5849 000025A7 68[D625]                 push domul_1
  5850 000025AA E832DE                   call prs
  5851 000025AD 83C402                   add  sp, 2
  5852 000025B0 FF36[2B00]               push word [lexval]
  5853 000025B4 E87DDF                   call prunsign1
  5854 000025B7 83C402                   add  sp, 2
  5855 000025BA 68[E225]                 push domul_2
  5856 000025BD E81FDE                   call prs
  5857 000025C0 83C402                   add  sp, 2
  5858                                  
  5859                                  ;-741     }
  5860                                  
  5861                                  
  5862                                  ;-742   else error1("with MUL only const number as multiplicator allowed"); } }
  5863                                  
  5864 000025C3 E90900                   jmp .domul312
  5865                                  .domul311:
  5866 000025C6 68[EC25]                 push domul_3
  5867 000025C9 E8CFDF                   call error1
  5868 000025CC 83C402                   add  sp, 2
  5869                                  .domul312:
  5870                                  .domul310:
  5871                                  
  5872                                  ;-743 int doidiv(int ids) { int mode; int id1;
  5873 000025CF C9                       LEAVE
  5874 000025D0 C3                       ret
  5875 000025D1 696D756C00              domul_0 db "imul",0
  5876 000025D6 5C6E206D6F76206278-     domul_1 db "\n mov bx, ",0
  5877 000025DF 2C2000             
  5878 000025E2 5C6E206D756C206278-     domul_2 db "\n mul bx",0
  5879 000025EB 00                 
  5880 000025EC 77697468204D554C20-     domul_3 db "with MUL only const number as multiplicator allowed",0
  5881 000025F5 6F6E6C7920636F6E73-
  5882 000025FE 74206E756D62657220-
  5883 00002607 6173206D756C746970-
  5884 00002610 6C696361746F722061-
  5885 00002619 6C6C6F77656400     
  5886                                  ENDP
  5887                                  
  5888                                  doidiv: PROC
  5889                                  
  5890                                  ;-744   if (istoken(T_CONST)) {
  5891                                  ;
  5892 00002620 C8040000                 ENTER  4,0
  5893 00002624 680101                   push 257
  5894 00002627 E8CEE8                   call istoken
  5895 0000262A 83C402                   add  sp, 2
  5896 0000262D 08C0                     or  al, al
  5897 0000262F 0F843400                 je .doidiv313
  5898                                  
  5899                                  ;-745     prs("\n mov bx, "); prunsign1(lexval);
  5900                                  
  5901 00002633 68[E526]                 push doidiv_0
  5902 00002636 E8A6DD                   call prs
  5903 00002639 83C402                   add  sp, 2
  5904 0000263C FF36[2B00]               push word [lexval]
  5905 00002640 E8F1DE                   call prunsign1
  5906 00002643 83C402                   add  sp, 2
  5907                                  
  5908                                  ;-746     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5909                                  
  5910 00002646 8B4604                   mov ax, [bp+4]
  5911 00002649 08C0                     or  al, al
  5912 0000264B 0F840C00                 je .doidiv314
  5913 0000264F 68[F126]                 push doidiv_1
  5914 00002652 E88ADD                   call prs
  5915 00002655 83C402                   add  sp, 2
  5916 00002658 E90900                   jmp .doidiv315
  5917                                  .doidiv314:
  5918 0000265B 68[0227]                 push doidiv_2
  5919 0000265E E87EDD                   call prs
  5920 00002661 83C402                   add  sp, 2
  5921                                  .doidiv315:
  5922                                  
  5923                                  ;-747   else {
  5924                                  
  5925 00002664 E97C00                   jmp .doidiv316
  5926                                  .doidiv313:
  5927                                  
  5928                                  ;-748     mode=typeName(); id1=searchname();
  5929                                  
  5930 00002667 E883EA                   call typeName
  5931 0000266A 8946FE                   mov [bp-2], ax
  5932 0000266D E81FEA                   call searchname
  5933 00002670 8946FC                   mov [bp-4], ax
  5934                                  
  5935                                  ;-749     if (mode) error1("only const number or int as divisor allowed");
  5936                                  
  5937 00002673 8B46FE                   mov ax, [bp-2]
  5938 00002676 08C0                     or  al, al
  5939 00002678 0F840900                 je .doidiv317
  5940 0000267C 68[1827]                 push doidiv_3
  5941 0000267F E819DF                   call error1
  5942 00002682 83C402                   add  sp, 2
  5943                                  
  5944                                  ;-750     gettypes(id1);
  5945                                  
  5946                                  .doidiv317:
  5947 00002685 FF76FC                   push word [bp-4]
  5948 00002688 E83BEB                   call gettypes
  5949 0000268B 83C402                   add  sp, 2
  5950                                  
  5951                                  ;-751     if (typei) error1("only int as simple var divisor allowed");
  5952                                  
  5953 0000268E A1[2D00]                 mov ax, [typei]
  5954 00002691 08C0                     or  al, al
  5955 00002693 0F840900                 je .doidiv318
  5956 00002697 68[4427]                 push doidiv_4
  5957 0000269A E8FEDE                   call error1
  5958 0000269D 83C402                   add  sp, 2
  5959                                  
  5960                                  ;-752     if (wi!=2) error1("only int, no byte as divisor allowed");
  5961                                  
  5962                                  .doidiv318:
  5963 000026A0 A1[3600]                 mov ax, [wi]
  5964 000026A3 83F802                   cmp ax, 2
  5965 000026A6 0F840900                 je  .doidiv319
  5966 000026AA 68[6B27]                 push doidiv_5
  5967 000026AD E8EBDE                   call error1
  5968 000026B0 83C402                   add  sp, 2
  5969                                  
  5970                                  ;-753     prs("\n mov bx, "); v(id1);
  5971                                  
  5972                                  .doidiv319:
  5973 000026B3 68[9027]                 push doidiv_6
  5974 000026B6 E826DD                   call prs
  5975 000026B9 83C402                   add  sp, 2
  5976 000026BC FF76FC                   push word [bp-4]
  5977 000026BF E8C0E8                   call v
  5978 000026C2 83C402                   add  sp, 2
  5979                                  
  5980                                  ;-754     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5981                                  
  5982 000026C5 8B4604                   mov ax, [bp+4]
  5983 000026C8 08C0                     or  al, al
  5984 000026CA 0F840C00                 je .doidiv320
  5985 000026CE 68[9C27]                 push doidiv_7
  5986 000026D1 E80BDD                   call prs
  5987 000026D4 83C402                   add  sp, 2
  5988 000026D7 E90900                   jmp .doidiv321
  5989                                  .doidiv320:
  5990 000026DA 68[AD27]                 push doidiv_8
  5991 000026DD E8FFDC                   call prs
  5992 000026E0 83C402                   add  sp, 2
  5993                                  .doidiv321:
  5994                                  
  5995                                  ;-755 }
  5996                                  
  5997                                  .doidiv316:
  5998                                  
  5999                                  ;-756 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
  6000 000026E3 C9                       LEAVE
  6001 000026E4 C3                       ret
  6002 000026E5 5C6E206D6F76206278-     doidiv_0 db "\n mov bx, ",0
  6003 000026EE 2C2000             
  6004 000026F1 5C6E206377645C6E20-     doidiv_1 db "\n cwd\n idiv bx",0
  6005 000026FA 6964697620627800   
  6006 00002702 5C6E206D6F76206478-     doidiv_2 db "\n mov dx, 0\n div bx",0
  6007 0000270B 2C20305C6E20646976-
  6008 00002714 20627800           
  6009 00002718 6F6E6C7920636F6E73-     doidiv_3 db "only const number or int as divisor allowed",0
  6010 00002721 74206E756D62657220-
  6011 0000272A 6F7220696E74206173-
  6012 00002733 2064697669736F7220-
  6013 0000273C 616C6C6F77656400   
  6014 00002744 6F6E6C7920696E7420-     doidiv_4 db "only int as simple var divisor allowed",0
  6015 0000274D 61732073696D706C65-
  6016 00002756 207661722064697669-
  6017 0000275F 736F7220616C6C6F77-
  6018 00002768 656400             
  6019 0000276B 6F6E6C7920696E742C-     doidiv_5 db "only int, no byte as divisor allowed",0
  6020 00002774 206E6F206279746520-
  6021 0000277D 61732064697669736F-
  6022 00002786 7220616C6C6F776564-
  6023 0000278F 00                 
  6024 00002790 5C6E206D6F76206278-     doidiv_6 db "\n mov bx, ",0
  6025 00002799 2C2000             
  6026 0000279C 5C6E206377645C6E20-     doidiv_7 db "\n cwd\n idiv bx",0
  6027 000027A5 6964697620627800   
  6028 000027AD 5C6E206D6F76206478-     doidiv_8 db "\n mov dx, 0\n div bx",0
  6029 000027B6 2C20305C6E20646976-
  6030 000027BF 20627800           
  6031                                  ENDP
  6032                                  
  6033                                  domod: PROC;
  6034 000027C3 C8000000                 ENTER  0,0
  6035 000027C7 FF7604                   push word [bp+4]
  6036 000027CA E853FE                   call doidiv
  6037 000027CD 83C402                   add  sp, 2
  6038 000027D0 68[DB27]                 push domod_0
  6039 000027D3 E809DC                   call prs
  6040 000027D6 83C402                   add  sp, 2
  6041                                  
  6042                                  ;-757 
  6043                                  
  6044                                  
  6045                                  ;-758 
  6046                                  
  6047                                  
  6048                                  ;-759 int docalltype[10]; int docallvalue[10];
  6049 000027D9 C9                       LEAVE
  6050 000027DA C3                       ret
  6051 000027DB 5C6E206D6F76206178-     domod_0 db "\n mov ax, dx",0
  6052 000027E4 2C20647800         
  6053                                  ENDP
  6054                                  section .bss
  6055                                  absolute 41742
  6056 0000A30E <res 00000014>          docalltype resw 10
  6057                                  section .text
  6058                                  section .bss
  6059                                  absolute 41762
  6060 0000A322 <res 00000014>          docallvalue resw 10
  6061                                  section .text
  6062                                  
  6063                                  ;-760 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register
  6064                                  
  6065                                  section .bss
  6066                                  absolute 41782
  6067 0000A336 <res 00000011>          procname resb 17
  6068                                  section .text
  6069                                  
  6070                                  ;-761 int docall1() {int i; int narg; int t0; int n0;  int sz32;
  6071                                  
  6072                                  
  6073                                  docall1: PROC
  6074                                  
  6075                                  ;-762   narg=0;  sz32=0;
  6076                                  ;
  6077 000027E9 C80A0000                 ENTER  10,0
  6078 000027ED B80000                   mov ax, 0
  6079 000027F0 8946FC                   mov [bp-4], ax
  6080 000027F3 B80000                   mov ax, 0
  6081 000027F6 8946F6                   mov [bp-10], ax
  6082                                  
  6083                                  ;-763   checknamelen();
  6084                                  
  6085 000027F9 E8B9E7                   call checknamelen
  6086                                  
  6087                                  ;-764   strcpy(&procname, symbol);
  6088                                  
  6089 000027FC 8D06606D                 lea  ax, [symbol]
  6090 00002800 50                       push ax
  6091 00002801 8D0636A3                 lea  ax, [procname]
  6092 00002805 50                       push ax
  6093 00002806 E820DA                   call strcpy
  6094 00002809 83C404                   add  sp, 4
  6095                                  
  6096                                  ;-765   expect('(');
  6097                                  
  6098 0000280C 6A28                     push 40
  6099 0000280E E809E7                   call expect
  6100 00002811 83C402                   add  sp, 2
  6101                                  
  6102                                  ;-766 	if (istoken(')') ==0 ) {
  6103                                  
  6104 00002814 6A29                     push 41
  6105 00002816 E8DFE6                   call istoken
  6106 00002819 83C402                   add  sp, 2
  6107 0000281C 83F800                   cmp ax, 0
  6108 0000281F 0F857802                 jne .docall1322
  6109                                  
  6110                                  ;-767 	  do { narg++;
  6111                                  
  6112                                  .docall1323:
  6113 00002823 FF46FC                   inc  word[bp-4]
  6114                                  
  6115                                  ;-768 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;
  6116                                  
  6117 00002826 8B46FC                   mov ax, [bp-4]
  6118 00002829 83F809                   cmp ax, 9
  6119 0000282C 0F8E0900                 jle .docall1324
  6120 00002830 68[DF2A]                 push docall1_0
  6121 00002833 E865DD                   call error1
  6122 00002836 83C402                   add  sp, 2
  6123                                  .docall1324:
  6124 00002839 B80000                   mov ax, 0
  6125 0000283C 8946FA                   mov [bp-6], ax
  6126                                  
  6127                                  ;-769       if(istoken(T_CONST)) {t0=1; n0=lexval; }
  6128                                  
  6129 0000283F 680101                   push 257
  6130 00002842 E8B3E6                   call istoken
  6131 00002845 83C402                   add  sp, 2
  6132 00002848 08C0                     or  al, al
  6133 0000284A 0F840C00                 je .docall1325
  6134 0000284E B80100                   mov ax, 1
  6135 00002851 8946FA                   mov [bp-6], ax
  6136 00002854 A1[2B00]                 mov ax, [lexval]
  6137 00002857 8946F8                   mov [bp-8], ax
  6138                                  
  6139                                  ;-770       if(istoken(T_STRING)){t0=2; n0=nconst;
  6140                                  
  6141                                  .docall1325:
  6142 0000285A 680201                   push 258
  6143 0000285D E898E6                   call istoken
  6144 00002860 83C402                   add  sp, 2
  6145 00002863 08C0                     or  al, al
  6146 00002865 0F846300                 je .docall1326
  6147 00002869 B80200                   mov ax, 2
  6148 0000286C 8946FA                   mov [bp-6], ax
  6149 0000286F A1[2500]                 mov ax, [nconst]
  6150 00002872 8946F8                   mov [bp-8], ax
  6151                                  
  6152                                  ;-771         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");
  6153                                  
  6154 00002875 68[F12A]                 push docall1_1
  6155 00002878 E8DDDA                   call eprs
  6156 0000287B 83C402                   add  sp, 2
  6157 0000287E 8D06E06D                 lea  ax, [fname]
  6158 00002882 50                       push ax
  6159 00002883 E8D2DA                   call eprs
  6160 00002886 83C402                   add  sp, 2
  6161 00002889 6A5F                     push 95
  6162 0000288B E8B7DA                   call eprc
  6163 0000288E 83C402                   add  sp, 2
  6164 00002891 FF36[2500]               push word [nconst]
  6165 00002895 E8DBDB                   call eprnum
  6166 00002898 83C402                   add  sp, 2
  6167 0000289B 68[F42A]                 push docall1_2
  6168 0000289E E8B7DA                   call eprs
  6169 000028A1 83C402                   add  sp, 2
  6170                                  
  6171                                  ;-772         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }
  6172                                  
  6173 000028A4 6A22                     push 34
  6174 000028A6 E89CDA                   call eprc
  6175 000028A9 83C402                   add  sp, 2
  6176 000028AC 8D06606D                 lea  ax, [symbol]
  6177 000028B0 50                       push ax
  6178 000028B1 E8A4DA                   call eprs
  6179 000028B4 83C402                   add  sp, 2
  6180 000028B7 6A22                     push 34
  6181 000028B9 E889DA                   call eprc
  6182 000028BC 83C402                   add  sp, 2
  6183 000028BF 68[F92A]                 push docall1_3
  6184 000028C2 E893DA                   call eprs
  6185 000028C5 83C402                   add  sp, 2
  6186 000028C8 FF06[2500]               inc  word[nconst]
  6187                                  
  6188                                  ;-773       if(istoken('&'))     {t0=3; name1(); n0=searchname();}
  6189                                  
  6190                                  .docall1326:
  6191 000028CC 6A26                     push 38
  6192 000028CE E827E6                   call istoken
  6193 000028D1 83C402                   add  sp, 2
  6194 000028D4 08C0                     or  al, al
  6195 000028D6 0F840F00                 je .docall1327
  6196 000028DA B80300                   mov ax, 3
  6197 000028DD 8946FA                   mov [bp-6], ax
  6198 000028E0 E8E2E7                   call name1
  6199 000028E3 E8A9E7                   call searchname
  6200 000028E6 8946F8                   mov [bp-8], ax
  6201                                  
  6202                                  ;-774       if(istoken(T_NAME))  { n0=checkreg();
  6203                                  
  6204                                  .docall1327:
  6205 000028E9 680001                   push 256
  6206 000028EC E809E6                   call istoken
  6207 000028EF 83C402                   add  sp, 2
  6208 000028F2 08C0                     or  al, al
  6209 000028F4 0F844800                 je .docall1328
  6210 000028F8 E843EC                   call checkreg
  6211 000028FB 8946F8                   mov [bp-8], ax
  6212                                  
  6213                                  ;-775         if (n0) t0=5;
  6214                                  
  6215 000028FE 8B46F8                   mov ax, [bp-8]
  6216 00002901 08C0                     or  al, al
  6217 00002903 0F840900                 je .docall1329
  6218 00002907 B80500                   mov ax, 5
  6219 0000290A 8946FA                   mov [bp-6], ax
  6220                                  
  6221                                  ;-776         else {t0=4; n0=searchname();
  6222                                  
  6223 0000290D E93000                   jmp .docall1330
  6224                                  .docall1329:
  6225 00002910 B80400                   mov ax, 4
  6226 00002913 8946FA                   mov [bp-6], ax
  6227 00002916 E876E7                   call searchname
  6228 00002919 8946F8                   mov [bp-8], ax
  6229                                  
  6230                                  ;-777           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }
  6231                                  
  6232 0000291C B8A96E                   mov ax, GType
  6233 0000291F A3[4400]                 mov word [p1], ax
  6234 00002922 A1[4400]                 mov ax, [p1]
  6235 00002925 0346F8                   add ax, [bp-8]
  6236 00002928 A3[4400]                 mov word [p1], ax
  6237 0000292B 8B1E[4400]               mov bx, [p1]
  6238 0000292F 8A07                     mov al, [bx]
  6239 00002931 B400                     mov ah, 0
  6240 00002933 83F826                   cmp ax, 38
  6241 00002936 0F850600                 jne .docall1331
  6242 0000293A B80300                   mov ax, 3
  6243 0000293D 8946FA                   mov [bp-6], ax
  6244                                  .docall1331:
  6245                                  .docall1330:
  6246                                  
  6247                                  ;-778       if (t0==0) error1("parameter not recognized (no * allowed)");
  6248                                  
  6249                                  .docall1328:
  6250 00002940 8B46FA                   mov ax, [bp-6]
  6251 00002943 83F800                   cmp ax, 0
  6252 00002946 0F850900                 jne .docall1332
  6253 0000294A 68[FC2A]                 push docall1_4
  6254 0000294D E84BDC                   call error1
  6255 00002950 83C402                   add  sp, 2
  6256                                  
  6257                                  ;-779       docalltype [narg] = t0;
  6258                                  
  6259                                  .docall1332:
  6260 00002953 8B46FA                   mov ax, [bp-6]
  6261 00002956 8B5EFC                   mov bx, [bp-4]
  6262 00002959 D1E3                     shl bx, 1
  6263 0000295B 89870EA3                 mov [docalltype+bx], ax
  6264                                  
  6265                                  ;-780       docallvalue[narg] = n0;
  6266                                  
  6267 0000295F 8B46F8                   mov ax, [bp-8]
  6268 00002962 8B5EFC                   mov bx, [bp-4]
  6269 00002965 D1E3                     shl bx, 1
  6270 00002967 898722A3                 mov [docallvalue+bx], ax
  6271                                  
  6272                                  ;-781     } while (istoken(','));
  6273                                  
  6274 0000296B 6A2C                     push 44
  6275 0000296D E888E5                   call istoken
  6276 00002970 83C402                   add  sp, 2
  6277 00002973 08C0                     or  al, al
  6278 00002975 0F840300                 je .docall1333
  6279 00002979 E9A7FE                   jmp .docall1323
  6280                                  .docall1333:
  6281                                  
  6282                                  ;-782 
  6283                                  
  6284                                  
  6285                                  ;-783   	expect(')');  i=narg;
  6286                                  
  6287 0000297C 6A29                     push 41
  6288 0000297E E899E5                   call expect
  6289 00002981 83C402                   add  sp, 2
  6290 00002984 8B46FC                   mov ax, [bp-4]
  6291 00002987 8946FE                   mov [bp-2], ax
  6292                                  
  6293                                  ;-784     do {
  6294                                  
  6295                                  .docall1334:
  6296                                  
  6297                                  ;-785       t0 = docalltype [i];
  6298                                  
  6299 0000298A 8B5EFE                   mov bx, [bp-2]
  6300 0000298D D1E3                     shl bx, 1
  6301 0000298F 8B870EA3                 mov ax, [docalltype + bx]
  6302 00002993 8946FA                   mov [bp-6], ax
  6303                                  
  6304                                  ;-786       n0 = docallvalue[i];
  6305                                  
  6306 00002996 8B5EFE                   mov bx, [bp-2]
  6307 00002999 D1E3                     shl bx, 1
  6308 0000299B 8B8722A3                 mov ax, [docallvalue + bx]
  6309 0000299F 8946F8                   mov [bp-8], ax
  6310                                  
  6311                                  ;-787       if(t0==1){ prs("\n push "); prunsign1(n0);}
  6312                                  
  6313 000029A2 8B46FA                   mov ax, [bp-6]
  6314 000029A5 83F801                   cmp ax, 1
  6315 000029A8 0F851200                 jne .docall1335
  6316 000029AC 68[242B]                 push docall1_5
  6317 000029AF E82DDA                   call prs
  6318 000029B2 83C402                   add  sp, 2
  6319 000029B5 FF76F8                   push word [bp-8]
  6320 000029B8 E879DB                   call prunsign1
  6321 000029BB 83C402                   add  sp, 2
  6322                                  
  6323                                  ;-788       if(t0==2){ prs("\n push ");
  6324                                  
  6325                                  .docall1335:
  6326 000029BE 8B46FA                   mov ax, [bp-6]
  6327 000029C1 83F802                   cmp ax, 2
  6328 000029C4 0F852500                 jne .docall1336
  6329 000029C8 68[2D2B]                 push docall1_6
  6330 000029CB E811DA                   call prs
  6331 000029CE 83C402                   add  sp, 2
  6332                                  
  6333                                  ;-789         prs(fname);prc(95);prunsign1(n0);}
  6334                                  
  6335 000029D1 8D06E06D                 lea  ax, [fname]
  6336 000029D5 50                       push ax
  6337 000029D6 E806DA                   call prs
  6338 000029D9 83C402                   add  sp, 2
  6339 000029DC 6A5F                     push 95
  6340 000029DE E8A5D9                   call prc
  6341 000029E1 83C402                   add  sp, 2
  6342 000029E4 FF76F8                   push word [bp-8]
  6343 000029E7 E84ADB                   call prunsign1
  6344 000029EA 83C402                   add  sp, 2
  6345                                  
  6346                                  ;-790       if(t0==3){ prs("\n lea  ax, ");   v(n0);
  6347                                  
  6348                                  .docall1336:
  6349 000029ED 8B46FA                   mov ax, [bp-6]
  6350 000029F0 83F803                   cmp ax, 3
  6351 000029F3 0F851B00                 jne .docall1337
  6352 000029F7 68[362B]                 push docall1_7
  6353 000029FA E8E2D9                   call prs
  6354 000029FD 83C402                   add  sp, 2
  6355 00002A00 FF76F8                   push word [bp-8]
  6356 00002A03 E87CE5                   call v
  6357 00002A06 83C402                   add  sp, 2
  6358                                  
  6359                                  ;-791         prs("\n push ax");}
  6360                                  
  6361 00002A09 68[432B]                 push docall1_8
  6362 00002A0C E8D0D9                   call prs
  6363 00002A0F 83C402                   add  sp, 2
  6364                                  
  6365                                  ;-792       if(t0==4){ gettypes(n0);
  6366                                  
  6367                                  .docall1337:
  6368 00002A12 8B46FA                   mov ax, [bp-6]
  6369 00002A15 83F804                   cmp ax, 4
  6370 00002A18 0F854300                 jne .docall1338
  6371 00002A1C FF76F8                   push word [bp-8]
  6372 00002A1F E8A4E7                   call gettypes
  6373 00002A22 83C402                   add  sp, 2
  6374                                  
  6375                                  ;-793         if(wi==2) { prs("\n push word "); v(n0);}
  6376                                  
  6377 00002A25 A1[3600]                 mov ax, [wi]
  6378 00002A28 83F802                   cmp ax, 2
  6379 00002A2B 0F851500                 jne .docall1339
  6380 00002A2F 68[4E2B]                 push docall1_9
  6381 00002A32 E8AAD9                   call prs
  6382 00002A35 83C402                   add  sp, 2
  6383 00002A38 FF76F8                   push word [bp-8]
  6384 00002A3B E844E5                   call v
  6385 00002A3E 83C402                   add  sp, 2
  6386                                  
  6387                                  ;-794         else { prs("\n mov al, byte ");   v(n0);
  6388                                  
  6389 00002A41 E91B00                   jmp .docall1340
  6390                                  .docall1339:
  6391 00002A44 68[5C2B]                 push docall1_10
  6392 00002A47 E895D9                   call prs
  6393 00002A4A 83C402                   add  sp, 2
  6394 00002A4D FF76F8                   push word [bp-8]
  6395 00002A50 E82FE5                   call v
  6396 00002A53 83C402                   add  sp, 2
  6397                                  
  6398                                  ;-795         prs("\n mov ah, 0\n push ax"); } }
  6399                                  
  6400 00002A56 68[6D2B]                 push docall1_11
  6401 00002A59 E883D9                   call prs
  6402 00002A5C 83C402                   add  sp, 2
  6403                                  .docall1340:
  6404                                  
  6405                                  ;-796       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }
  6406                                  
  6407                                  .docall1338:
  6408 00002A5F 8B46FA                   mov ax, [bp-6]
  6409 00002A62 83F805                   cmp ax, 5
  6410 00002A65 0F852200                 jne .docall1341
  6411 00002A69 68[842B]                 push docall1_12
  6412 00002A6C E870D9                   call prs
  6413 00002A6F 83C402                   add  sp, 2
  6414 00002A72 FF76F8                   push word [bp-8]
  6415 00002A75 E8B3EE                   call printreg
  6416 00002A78 83C402                   add  sp, 2
  6417 00002A7B 8B46F8                   mov ax, [bp-8]
  6418 00002A7E 83F82F                   cmp ax, 47 ;unsigned : 1
  6419 00002A81 0F8C0600                 jl  .docall1342
  6420 00002A85 8B46F6                   mov ax, [bp-10]
  6421 00002A88 83C002                   add ax, 2
  6422                                  .docall1342:
  6423                                  
  6424                                  ;-797    i--; } while (i > 0);  }
  6425                                  
  6426                                  .docall1341:
  6427 00002A8B FF4EFE                   dec  word[bp-2]
  6428 00002A8E 8B46FE                   mov ax, [bp-2]
  6429 00002A91 83F800                   cmp ax, 0
  6430 00002A94 0F8E0300                 jle .docall1343
  6431 00002A98 E9EFFE                   jmp .docall1334
  6432                                  .docall1343:
  6433                                  
  6434                                  ;-798 	 prs("\n call "); prs(&procname);
  6435                                  
  6436                                  .docall1322:
  6437 00002A9B 68[8D2B]                 push docall1_13
  6438 00002A9E E83ED9                   call prs
  6439 00002AA1 83C402                   add  sp, 2
  6440 00002AA4 8D0636A3                 lea  ax, [procname]
  6441 00002AA8 50                       push ax
  6442 00002AA9 E833D9                   call prs
  6443 00002AAC 83C402                   add  sp, 2
  6444                                  
  6445                                  ;-799 	 if (narg>0) {prs("\n add  sp, ");
  6446                                  
  6447 00002AAF 8B46FC                   mov ax, [bp-4]
  6448 00002AB2 83F800                   cmp ax, 0
  6449 00002AB5 0F8E2400                 jle .docall1344
  6450 00002AB9 68[962B]                 push docall1_14
  6451 00002ABC E820D9                   call prs
  6452 00002ABF 83C402                   add  sp, 2
  6453                                  
  6454                                  ;-800      narg=narg+narg; narg=narg+sz32; prunsign1(narg); }
  6455                                  
  6456 00002AC2 8B46FC                   mov ax, [bp-4]
  6457 00002AC5 0346FC                   add ax, [bp-4]
  6458 00002AC8 8946FC                   mov [bp-4], ax
  6459 00002ACB 8B46FC                   mov ax, [bp-4]
  6460 00002ACE 0346F6                   add ax, [bp-10]
  6461 00002AD1 8946FC                   mov [bp-4], ax
  6462 00002AD4 FF76FC                   push word [bp-4]
  6463 00002AD7 E85ADA                   call prunsign1
  6464 00002ADA 83C402                   add  sp, 2
  6465                                  
  6466                                  ;-801  }
  6467                                  
  6468                                  .docall1344:
  6469                                  
  6470                                  ;-802 
  6471                                  
  6472                                  
  6473                                  ;-803  int expr(int isRight)
  6474 00002ADD C9                       LEAVE
  6475 00002ADE C3                       ret
  6476 00002ADF 4D61782E2039207061-     docall1_0 db "Max. 9 parameters",0
  6477 00002AE8 72616D657465727300 
  6478 00002AF1 5C6E00                  docall1_1 db "\n",0
  6479 00002AF4 2064622000              docall1_2 db " db ",0
  6480 00002AF9 2C3000                  docall1_3 db ",0",0
  6481 00002AFC 706172616D65746572-     docall1_4 db "parameter not recognized (no * allowed)",0
  6482 00002B05 206E6F74207265636F-
  6483 00002B0E 676E697A656420286E-
  6484 00002B17 6F202A20616C6C6F77-
  6485 00002B20 65642900           
  6486 00002B24 5C6E20707573682000      docall1_5 db "\n push ",0
  6487 00002B2D 5C6E20707573682000      docall1_6 db "\n push ",0
  6488 00002B36 5C6E206C6561202061-     docall1_7 db "\n lea  ax, ",0
  6489 00002B3F 782C2000           
  6490 00002B43 5C6E20707573682061-     docall1_8 db "\n push ax",0
  6491 00002B4C 7800               
  6492 00002B4E 5C6E20707573682077-     docall1_9 db "\n push word ",0
  6493 00002B57 6F72642000         
  6494 00002B5C 5C6E206D6F7620616C-     docall1_10 db "\n mov al, byte ",0
  6495 00002B65 2C20627974652000   
  6496 00002B6D 5C6E206D6F76206168-     docall1_11 db "\n mov ah, 0\n push ax",0
  6497 00002B76 2C20305C6E20707573-
  6498 00002B7F 6820617800         
  6499 00002B84 5C6E20707573682000      docall1_12 db "\n push ",0
  6500 00002B8D 5C6E2063616C6C2000      docall1_13 db "\n call ",0
  6501 00002B96 5C6E20616464202073-     docall1_14 db "\n add  sp, ",0
  6502 00002B9F 702C2000           
  6503                                  ENDP
  6504                                  
  6505                                  expr: PROC
  6506                                  
  6507                                  ;-804  { int mode; int id1;     int ixarr; int ixconst;
  6508                                  
  6509                                  
  6510                                  ;-805    int ids;  int isCONST; int i;     unsigned char *p;
  6511                                  
  6512                                  
  6513                                  ;-806    if (istoken(T_CONST)) {
  6514                                  ;
  6515 00002BA3 C8100000                 ENTER  16,0
  6516 00002BA7 680101                   push 257
  6517 00002BAA E84BE3                   call istoken
  6518 00002BAD 83C402                   add  sp, 2
  6519 00002BB0 08C0                     or  al, al
  6520 00002BB2 0F841900                 je .expr345
  6521                                  
  6522                                  ;-807      prs("\n mov ax, "); prunsign1(lexval); return 4; }
  6523                                  
  6524 00002BB6 68[3A2F]                 push expr_0
  6525 00002BB9 E823D8                   call prs
  6526 00002BBC 83C402                   add  sp, 2
  6527 00002BBF FF36[2B00]               push word [lexval]
  6528 00002BC3 E86ED9                   call prunsign1
  6529 00002BC6 83C402                   add  sp, 2
  6530 00002BC9 B80400                   mov ax, 4
  6531 00002BCC E96903                   jmp .retnexpr
  6532                                  
  6533                                  ;-808    mode=typeName(); /*0=V,1=*,2=&*/
  6534                                  
  6535                                  .expr345:
  6536 00002BCF E81BE5                   call typeName
  6537 00002BD2 8946FE                   mov [bp-2], ax
  6538                                  
  6539                                  ;-809    ireg1=checkreg();
  6540                                  
  6541 00002BD5 E866E9                   call checkreg
  6542 00002BD8 A3[4B00]                 mov word [ireg1], ax
  6543                                  
  6544                                  ;-810    if (ireg1) { doreg1(0); return; }
  6545                                  
  6546 00002BDB A1[4B00]                 mov ax, [ireg1]
  6547 00002BDE 08C0                     or  al, al
  6548 00002BE0 0F840B00                 je .expr346
  6549 00002BE4 6A00                     push 0
  6550 00002BE6 E8AEEE                   call doreg1
  6551 00002BE9 83C402                   add  sp, 2
  6552 00002BEC E94903                   jmp .retnexpr
  6553                                  
  6554                                  ;-811    if (token=='(')  {docall1(); goto e1; }
  6555                                  
  6556                                  .expr346:
  6557 00002BEF A1[1E00]                 mov ax, [token]
  6558 00002BF2 83F828                   cmp ax, 40
  6559 00002BF5 0F850600                 jne .expr347
  6560 00002BF9 E8EDFB                   call docall1
  6561 00002BFC E92F02                   jmp .e1
  6562                                  
  6563                                  ;-812    if (isreg()) goto e1;
  6564                                  
  6565                                  .expr347:
  6566 00002BFF E8D8F4                   call isreg
  6567 00002C02 08C0                     or  al, al
  6568 00002C04 0F840300                 je .expr348
  6569 00002C08 E92302                   jmp .e1
  6570                                  
  6571                                  ;-813 
  6572                                  
  6573                                  
  6574                                  ;-814    id1=searchname(); gettypes(id1); ids=signi;
  6575                                  
  6576                                  .expr348:
  6577 00002C0B E881E4                   call searchname
  6578 00002C0E 8946FC                   mov [bp-4], ax
  6579 00002C11 FF76FC                   push word [bp-4]
  6580 00002C14 E8AFE5                   call gettypes
  6581 00002C17 83C402                   add  sp, 2
  6582 00002C1A A1[3000]                 mov ax, [signi]
  6583 00002C1D 8946F6                   mov [bp-10], ax
  6584                                  
  6585                                  ;-815    ixarr=0;  ixconst=0;
  6586                                  
  6587 00002C20 B80000                   mov ax, 0
  6588 00002C23 8946FA                   mov [bp-6], ax
  6589 00002C26 B80000                   mov ax, 0
  6590 00002C29 8946F8                   mov [bp-8], ax
  6591                                  
  6592                                  ;-816      if (istoken('[')) { if (istoken(T_CONST)) {
  6593                                  
  6594 00002C2C 6A5B                     push 91
  6595 00002C2E E8C7E2                   call istoken
  6596 00002C31 83C402                   add  sp, 2
  6597 00002C34 08C0                     or  al, al
  6598 00002C36 0F845900                 je .expr349
  6599 00002C3A 680101                   push 257
  6600 00002C3D E8B8E2                   call istoken
  6601 00002C40 83C402                   add  sp, 2
  6602 00002C43 08C0                     or  al, al
  6603 00002C45 0F841700                 je .expr350
  6604                                  
  6605                                  ;-817        ixconst=1; ixarr=lexval; expect(']');  }
  6606                                  
  6607 00002C49 B80100                   mov ax, 1
  6608 00002C4C 8946F8                   mov [bp-8], ax
  6609 00002C4F A1[2B00]                 mov ax, [lexval]
  6610 00002C52 8946FA                   mov [bp-6], ax
  6611 00002C55 6A5D                     push 93
  6612 00002C57 E8C0E2                   call expect
  6613 00002C5A 83C402                   add  sp, 2
  6614                                  
  6615                                  ;-818      else {ixarr=searchname(); expect(T_NAME); expect(']');
  6616                                  
  6617 00002C5D E93300                   jmp .expr351
  6618                                  .expr350:
  6619 00002C60 E82CE4                   call searchname
  6620 00002C63 8946FA                   mov [bp-6], ax
  6621 00002C66 680001                   push 256
  6622 00002C69 E8AEE2                   call expect
  6623 00002C6C 83C402                   add  sp, 2
  6624 00002C6F 6A5D                     push 93
  6625 00002C71 E8A6E2                   call expect
  6626 00002C74 83C402                   add  sp, 2
  6627                                  
  6628                                  ;-819      gettypes(ixarr);
  6629                                  
  6630 00002C77 FF76FA                   push word [bp-6]
  6631 00002C7A E849E5                   call gettypes
  6632 00002C7D 83C402                   add  sp, 2
  6633                                  
  6634                                  ;-820      if (widthi != 2) error1("Array index must be number or int"); } }
  6635                                  
  6636 00002C80 A1[3300]                 mov ax, [widthi]
  6637 00002C83 83F802                   cmp ax, 2
  6638 00002C86 0F840900                 je  .expr352
  6639 00002C8A 68[462F]                 push expr_1
  6640 00002C8D E80BD9                   call error1
  6641 00002C90 83C402                   add  sp, 2
  6642                                  .expr352:
  6643                                  .expr351:
  6644                                  
  6645                                  ;-821    if (istoken(T_PLUSPLUS  )) {if(mode)error1("Only var allowed");
  6646                                  
  6647                                  .expr349:
  6648 00002C93 68C304                   push 1219
  6649 00002C96 E85FE2                   call istoken
  6650 00002C99 83C402                   add  sp, 2
  6651 00002C9C 08C0                     or  al, al
  6652 00002C9E 0F844600                 je .expr353
  6653 00002CA2 8B46FE                   mov ax, [bp-2]
  6654 00002CA5 08C0                     or  al, al
  6655 00002CA7 0F840900                 je .expr354
  6656 00002CAB 68[682F]                 push expr_2
  6657 00002CAE E8EAD8                   call error1
  6658 00002CB1 83C402                   add  sp, 2
  6659                                  
  6660                                  ;-822       prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");
  6661                                  
  6662                                  .expr354:
  6663 00002CB4 68[792F]                 push expr_3
  6664 00002CB7 E825D7                   call prs
  6665 00002CBA 83C402                   add  sp, 2
  6666 00002CBD A1[3600]                 mov ax, [wi]
  6667 00002CC0 83F802                   cmp ax, 2
  6668 00002CC3 0F850C00                 jne .expr355
  6669 00002CC7 68[822F]                 push expr_4
  6670 00002CCA E812D7                   call prs
  6671 00002CCD 83C402                   add  sp, 2
  6672 00002CD0 E90900                   jmp .expr356
  6673                                  .expr355:
  6674 00002CD3 68[872F]                 push expr_5
  6675 00002CD6 E806D7                   call prs
  6676 00002CD9 83C402                   add  sp, 2
  6677                                  
  6678                                  ;-823       v(id1); goto e1;}
  6679                                  
  6680                                  .expr356:
  6681 00002CDC FF76FC                   push word [bp-4]
  6682 00002CDF E8A0E2                   call v
  6683 00002CE2 83C402                   add  sp, 2
  6684 00002CE5 E94601                   jmp .e1
  6685                                  
  6686                                  ;-824    if (istoken(T_MINUSMINUS)) {if(mode)error1("Only var allowed");
  6687                                  
  6688                                  .expr353:
  6689 00002CE8 68C904                   push 1225
  6690 00002CEB E80AE2                   call istoken
  6691 00002CEE 83C402                   add  sp, 2
  6692 00002CF1 08C0                     or  al, al
  6693 00002CF3 0F844600                 je .expr357
  6694 00002CF7 8B46FE                   mov ax, [bp-2]
  6695 00002CFA 08C0                     or  al, al
  6696 00002CFC 0F840900                 je .expr358
  6697 00002D00 68[8C2F]                 push expr_6
  6698 00002D03 E895D8                   call error1
  6699 00002D06 83C402                   add  sp, 2
  6700                                  
  6701                                  ;-825       prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");
  6702                                  
  6703                                  .expr358:
  6704 00002D09 68[9D2F]                 push expr_7
  6705 00002D0C E8D0D6                   call prs
  6706 00002D0F 83C402                   add  sp, 2
  6707 00002D12 A1[3600]                 mov ax, [wi]
  6708 00002D15 83F802                   cmp ax, 2
  6709 00002D18 0F850C00                 jne .expr359
  6710 00002D1C 68[A62F]                 push expr_8
  6711 00002D1F E8BDD6                   call prs
  6712 00002D22 83C402                   add  sp, 2
  6713 00002D25 E90900                   jmp .expr360
  6714                                  .expr359:
  6715 00002D28 68[AB2F]                 push expr_9
  6716 00002D2B E8B1D6                   call prs
  6717 00002D2E 83C402                   add  sp, 2
  6718                                  
  6719                                  ;-826       v(id1); goto e1;}
  6720                                  
  6721                                  .expr360:
  6722 00002D31 FF76FC                   push word [bp-4]
  6723 00002D34 E84BE2                   call v
  6724 00002D37 83C402                   add  sp, 2
  6725 00002D3A E9F100                   jmp .e1
  6726                                  
  6727                                  ;-827 
  6728                                  
  6729                                  
  6730                                  ;-828    if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}
  6731                                  
  6732                                  .expr357:
  6733 00002D3D 68CE04                   push 1230
  6734 00002D40 E8B5E1                   call istoken
  6735 00002D43 83C402                   add  sp, 2
  6736 00002D46 08C0                     or  al, al
  6737 00002D48 0F841200                 je .expr361
  6738 00002D4C FF76FC                   push word [bp-4]
  6739 00002D4F FF76FE                   push word [bp-2]
  6740 00002D52 68[B02F]                 push expr_10
  6741 00002D55 E835EF                   call compoundass
  6742 00002D58 83C406                   add  sp, 6
  6743 00002D5B E9D000                   jmp .e1
  6744                                  
  6745                                  ;-829    if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}
  6746                                  
  6747                                  .expr361:
  6748 00002D5E 68CF04                   push 1231
  6749 00002D61 E894E1                   call istoken
  6750 00002D64 83C402                   add  sp, 2
  6751 00002D67 08C0                     or  al, al
  6752 00002D69 0F841200                 je .expr362
  6753 00002D6D FF76FC                   push word [bp-4]
  6754 00002D70 FF76FE                   push word [bp-2]
  6755 00002D73 68[B42F]                 push expr_11
  6756 00002D76 E814EF                   call compoundass
  6757 00002D79 83C406                   add  sp, 6
  6758 00002D7C E9AF00                   jmp .e1
  6759                                  
  6760                                  ;-830    if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}
  6761                                  
  6762                                  .expr362:
  6763 00002D7F 68D204                   push 1234
  6764 00002D82 E873E1                   call istoken
  6765 00002D85 83C402                   add  sp, 2
  6766 00002D88 08C0                     or  al, al
  6767 00002D8A 0F841200                 je .expr363
  6768 00002D8E FF76FC                   push word [bp-4]
  6769 00002D91 FF76FE                   push word [bp-2]
  6770 00002D94 68[B82F]                 push expr_12
  6771 00002D97 E8F3EE                   call compoundass
  6772 00002D9A 83C406                   add  sp, 6
  6773 00002D9D E98E00                   jmp .e1
  6774                                  
  6775                                  ;-831    if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}
  6776                                  
  6777                                  .expr363:
  6778 00002DA0 68D304                   push 1235
  6779 00002DA3 E852E1                   call istoken
  6780 00002DA6 83C402                   add  sp, 2
  6781 00002DA9 08C0                     or  al, al
  6782 00002DAB 0F841200                 je .expr364
  6783 00002DAF FF76FC                   push word [bp-4]
  6784 00002DB2 FF76FE                   push word [bp-2]
  6785 00002DB5 68[BC2F]                 push expr_13
  6786 00002DB8 E8D2EE                   call compoundass
  6787 00002DBB 83C406                   add  sp, 6
  6788 00002DBE E96D00                   jmp .e1
  6789                                  
  6790                                  ;-832    if (istoken(T_MULASS    )) {error1("not implemented");}
  6791                                  
  6792                                  .expr364:
  6793 00002DC1 68D004                   push 1232
  6794 00002DC4 E831E1                   call istoken
  6795 00002DC7 83C402                   add  sp, 2
  6796 00002DCA 08C0                     or  al, al
  6797 00002DCC 0F840900                 je .expr365
  6798 00002DD0 68[BF2F]                 push expr_14
  6799 00002DD3 E8C5D7                   call error1
  6800 00002DD6 83C402                   add  sp, 2
  6801                                  
  6802                                  ;-833    if (istoken(T_DIVASS    )) {error1("not implemented");}
  6803                                  
  6804                                  .expr365:
  6805 00002DD9 68D104                   push 1233
  6806 00002DDC E819E1                   call istoken
  6807 00002DDF 83C402                   add  sp, 2
  6808 00002DE2 08C0                     or  al, al
  6809 00002DE4 0F840900                 je .expr366
  6810 00002DE8 68[CF2F]                 push expr_15
  6811 00002DEB E8ADD7                   call error1
  6812 00002DEE 83C402                   add  sp, 2
  6813                                  
  6814                                  ;-834 
  6815                                  
  6816                                  
  6817                                  ;-835    if (istoken('=')) {
  6818                                  
  6819                                  .expr366:
  6820 00002DF1 6A3D                     push 61
  6821 00002DF3 E802E1                   call istoken
  6822 00002DF6 83C402                   add  sp, 2
  6823 00002DF9 08C0                     or  al, al
  6824 00002DFB 0F841D00                 je .expr367
  6825                                  
  6826                                  ;-836        expr(1);
  6827                                  
  6828 00002DFF 6A01                     push 1
  6829 00002E01 E89FFD                   call expr
  6830 00002E04 83C402                   add  sp, 2
  6831                                  
  6832                                  ;-837        doassign(mode, id1, ixarr, ixconst);
  6833                                  
  6834 00002E07 FF76F8                   push word [bp-8]
  6835 00002E0A FF76FA                   push word [bp-6]
  6836 00002E0D FF76FC                   push word [bp-4]
  6837 00002E10 FF76FE                   push word [bp-2]
  6838 00002E13 E820F5                   call doassign
  6839 00002E16 83C408                   add  sp, 8
  6840                                  
  6841                                  ;-838        goto e1;
  6842                                  
  6843 00002E19 E91200                   jmp .e1
  6844                                  
  6845                                  ;-839    }
  6846                                  
  6847                                  
  6848                                  ;-840    dovar1(mode, "mov", ixarr, id1);
  6849                                  
  6850                                  .expr367:
  6851 00002E1C FF76FC                   push word [bp-4]
  6852 00002E1F FF76FA                   push word [bp-6]
  6853 00002E22 68[DF2F]                 push expr_16
  6854 00002E25 FF76FE                   push word [bp-2]
  6855 00002E28 E80EEF                   call dovar1
  6856 00002E2B 83C408                   add  sp, 8
  6857                                  
  6858                                  ;-841 
  6859                                  
  6860                                  
  6861                                  ;-842  e1:    if (istoken('+')) rterm("add");
  6862                                  
  6863                                  .e1:
  6864 00002E2E 6A2B                     push 43
  6865 00002E30 E8C5E0                   call istoken
  6866 00002E33 83C402                   add  sp, 2
  6867 00002E36 08C0                     or  al, al
  6868 00002E38 0F840C00                 je .expr368
  6869 00002E3C 68[E32F]                 push expr_17
  6870 00002E3F E8DFF0                   call rterm
  6871 00002E42 83C402                   add  sp, 2
  6872                                  
  6873                                  ;-843    else if (istoken('-')) rterm("sub" );
  6874                                  
  6875 00002E45 E9CF00                   jmp .expr369
  6876                                  .expr368:
  6877 00002E48 6A2D                     push 45
  6878 00002E4A E8ABE0                   call istoken
  6879 00002E4D 83C402                   add  sp, 2
  6880 00002E50 08C0                     or  al, al
  6881 00002E52 0F840C00                 je .expr370
  6882 00002E56 68[E72F]                 push expr_18
  6883 00002E59 E8C5F0                   call rterm
  6884 00002E5C 83C402                   add  sp, 2
  6885                                  
  6886                                  ;-844    else if (istoken('&')) rterm("and" );
  6887                                  
  6888 00002E5F E9B500                   jmp .expr371
  6889                                  .expr370:
  6890 00002E62 6A26                     push 38
  6891 00002E64 E891E0                   call istoken
  6892 00002E67 83C402                   add  sp, 2
  6893 00002E6A 08C0                     or  al, al
  6894 00002E6C 0F840C00                 je .expr372
  6895 00002E70 68[EB2F]                 push expr_19
  6896 00002E73 E8ABF0                   call rterm
  6897 00002E76 83C402                   add  sp, 2
  6898                                  
  6899                                  ;-845    else if (istoken('|')) rterm("or" );
  6900                                  
  6901 00002E79 E99B00                   jmp .expr373
  6902                                  .expr372:
  6903 00002E7C 6A7C                     push 124
  6904 00002E7E E877E0                   call istoken
  6905 00002E81 83C402                   add  sp, 2
  6906 00002E84 08C0                     or  al, al
  6907 00002E86 0F840C00                 je .expr374
  6908 00002E8A 68[EF2F]                 push expr_20
  6909 00002E8D E891F0                   call rterm
  6910 00002E90 83C402                   add  sp, 2
  6911                                  
  6912                                  ;-846    else if (istoken(T_LESSLESS)) rterm("shl");
  6913                                  
  6914 00002E93 E98100                   jmp .expr375
  6915                                  .expr374:
  6916 00002E96 68D804                   push 1240
  6917 00002E99 E85CE0                   call istoken
  6918 00002E9C 83C402                   add  sp, 2
  6919 00002E9F 08C0                     or  al, al
  6920 00002EA1 0F840C00                 je .expr376
  6921 00002EA5 68[F22F]                 push expr_21
  6922 00002EA8 E876F0                   call rterm
  6923 00002EAB 83C402                   add  sp, 2
  6924                                  
  6925                                  ;-847    else if (istoken(T_GREATGREAT)) rterm("shr");
  6926                                  
  6927 00002EAE E96600                   jmp .expr377
  6928                                  .expr376:
  6929 00002EB1 68D904                   push 1241
  6930 00002EB4 E841E0                   call istoken
  6931 00002EB7 83C402                   add  sp, 2
  6932 00002EBA 08C0                     or  al, al
  6933 00002EBC 0F840C00                 je .expr378
  6934 00002EC0 68[F62F]                 push expr_22
  6935 00002EC3 E85BF0                   call rterm
  6936 00002EC6 83C402                   add  sp, 2
  6937                                  
  6938                                  ;-848    else if (istoken('*')) domul (ids);
  6939                                  
  6940 00002EC9 E94B00                   jmp .expr379
  6941                                  .expr378:
  6942 00002ECC 6A2A                     push 42
  6943 00002ECE E827E0                   call istoken
  6944 00002ED1 83C402                   add  sp, 2
  6945 00002ED4 08C0                     or  al, al
  6946 00002ED6 0F840C00                 je .expr380
  6947 00002EDA FF76F6                   push word [bp-10]
  6948 00002EDD E89FF6                   call domul
  6949 00002EE0 83C402                   add  sp, 2
  6950                                  
  6951                                  ;-849    else if (istoken('/')) doidiv(ids);
  6952                                  
  6953 00002EE3 E93100                   jmp .expr381
  6954                                  .expr380:
  6955 00002EE6 6A2F                     push 47
  6956 00002EE8 E80DE0                   call istoken
  6957 00002EEB 83C402                   add  sp, 2
  6958 00002EEE 08C0                     or  al, al
  6959 00002EF0 0F840C00                 je .expr382
  6960 00002EF4 FF76F6                   push word [bp-10]
  6961 00002EF7 E826F7                   call doidiv
  6962 00002EFA 83C402                   add  sp, 2
  6963                                  
  6964                                  ;-850    else if (istoken('%')) domod (ids);
  6965                                  
  6966 00002EFD E91700                   jmp .expr383
  6967                                  .expr382:
  6968 00002F00 6A25                     push 37
  6969 00002F02 E8F3DF                   call istoken
  6970 00002F05 83C402                   add  sp, 2
  6971 00002F08 08C0                     or  al, al
  6972 00002F0A 0F840900                 je .expr384
  6973 00002F0E FF76F6                   push word [bp-10]
  6974 00002F11 E8AFF8                   call domod
  6975 00002F14 83C402                   add  sp, 2
  6976                                  
  6977                                  ;-851    if (isrelational()) { rterm("cmp"); cmpneg(ids);}
  6978                                  
  6979                                  .expr384:
  6980                                  .expr383:
  6981                                  .expr381:
  6982                                  .expr379:
  6983                                  .expr377:
  6984                                  .expr375:
  6985                                  .expr373:
  6986                                  .expr371:
  6987                                  .expr369:
  6988 00002F17 E8BDE5                   call isrelational
  6989 00002F1A 08C0                     or  al, al
  6990 00002F1C 0F841200                 je .expr385
  6991 00002F20 68[FA2F]                 push expr_23
  6992 00002F23 E8FBEF                   call rterm
  6993 00002F26 83C402                   add  sp, 2
  6994 00002F29 FF76F6                   push word [bp-10]
  6995 00002F2C E838E4                   call cmpneg
  6996 00002F2F 83C402                   add  sp, 2
  6997                                  
  6998                                  ;-852    return 0;
  6999                                  
  7000                                  .expr385:
  7001 00002F32 B80000                   mov ax, 0
  7002 00002F35 E90000                   jmp .retnexpr
  7003                                  
  7004                                  ;-853  }
  7005                                  
  7006                                  
  7007                                  ;-854 
  7008                                  
  7009                                  
  7010                                  ;-855  int pexpr() {expect('('); iscmp=0;
  7011                                  
  7012 00002F38 C9                       .retnexpr: LEAVE
  7013 00002F39 C3                       ret
  7014 00002F3A 5C6E206D6F76206178-     expr_0 db "\n mov ax, ",0
  7015 00002F43 2C2000             
  7016 00002F46 417272617920696E64-     expr_1 db "Array index must be number or int",0
  7017 00002F4F 6578206D7573742062-
  7018 00002F58 65206E756D62657220-
  7019 00002F61 6F7220696E7400     
  7020 00002F68 4F6E6C792076617220-     expr_2 db "Only var allowed",0
  7021 00002F71 616C6C6F77656400   
  7022 00002F79 5C6E20696E63202000      expr_3 db "\n inc  ",0
  7023 00002F82 776F726400              expr_4 db "word",0
  7024 00002F87 6279746500              expr_5 db "byte",0
  7025 00002F8C 4F6E6C792076617220-     expr_6 db "Only var allowed",0
  7026 00002F95 616C6C6F77656400   
  7027 00002F9D 5C6E20646563202000      expr_7 db "\n dec  ",0
  7028 00002FA6 776F726400              expr_8 db "word",0
  7029 00002FAB 6279746500              expr_9 db "byte",0
  7030 00002FB0 61646400                expr_10 db "add",0
  7031 00002FB4 73756200                expr_11 db "sub",0
  7032 00002FB8 616E6400                expr_12 db "and",0
  7033 00002FBC 6F7200                  expr_13 db "or",0
  7034 00002FBF 6E6F7420696D706C65-     expr_14 db "not implemented",0
  7035 00002FC8 6D656E74656400     
  7036 00002FCF 6E6F7420696D706C65-     expr_15 db "not implemented",0
  7037 00002FD8 6D656E74656400     
  7038 00002FDF 6D6F7600                expr_16 db "mov",0
  7039 00002FE3 61646400                expr_17 db "add",0
  7040 00002FE7 73756200                expr_18 db "sub",0
  7041 00002FEB 616E6400                expr_19 db "and",0
  7042 00002FEF 6F7200                  expr_20 db "or",0
  7043 00002FF2 73686C00                expr_21 db "shl",0
  7044 00002FF6 73687200                expr_22 db "shr",0
  7045 00002FFA 636D7000                expr_23 db "cmp",0
  7046                                  ENDP
  7047                                  
  7048                                  pexpr: PROC
  7049 00002FFE 6A28                     push 40
  7050 00003000 E817DF                   call expect
  7051 00003003 83C402                   add  sp, 2
  7052 00003006 B80000                   mov ax, 0
  7053 00003009 A3[2300]                 mov word [iscmp], ax
  7054                                  
  7055                                  ;-856    if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}
  7056                                  
  7057 0000300C A1[1E00]                 mov ax, [token]
  7058 0000300F 3D0001                   cmp ax, 256
  7059 00003012 0F853400                 jne .pexpr386
  7060 00003016 68[7930]                 push pexpr_0
  7061 00003019 8D06606D                 lea  ax, [symbol]
  7062 0000301D 50                       push ax
  7063 0000301E E83ED2                   call eqstr
  7064 00003021 83C404                   add  sp, 4
  7065 00003024 08C0                     or  al, al
  7066 00003026 0F840600                 je .pexpr387
  7067 0000302A E86BE9                   call constantexpr
  7068 0000302D E94800                   jmp .retnpexpr
  7069                                  
  7070                                  ;-857      ireg1=checkreg();
  7071                                  
  7072                                  .pexpr387:
  7073 00003030 E80BE5                   call checkreg
  7074 00003033 A3[4B00]                 mov word [ireg1], ax
  7075                                  
  7076                                  ;-858      if (ireg1) { doreg1(1); return; }  }
  7077                                  
  7078 00003036 A1[4B00]                 mov ax, [ireg1]
  7079 00003039 08C0                     or  al, al
  7080 0000303B 0F840B00                 je .pexpr388
  7081 0000303F 6A01                     push 1
  7082 00003041 E853EA                   call doreg1
  7083 00003044 83C402                   add  sp, 2
  7084 00003047 E92E00                   jmp .retnpexpr
  7085                                  .pexpr388:
  7086                                  
  7087                                  ;-859    expr(0);
  7088                                  
  7089                                  .pexpr386:
  7090 0000304A 6A00                     push 0
  7091 0000304C E854FB                   call expr
  7092 0000304F 83C402                   add  sp, 2
  7093                                  
  7094                                  ;-860    if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);
  7095                                  
  7096 00003052 A1[2300]                 mov ax, [iscmp]
  7097 00003055 83F800                   cmp ax, 0
  7098 00003058 0F850900                 jne .pexpr389
  7099 0000305C 68[7B30]                 push pexpr_1
  7100 0000305F E87DD3                   call prs
  7101 00003062 83C402                   add  sp, 2
  7102                                  .pexpr389:
  7103 00003065 8D06E06D                 lea  ax, [fname]
  7104 00003069 50                       push ax
  7105 0000306A E872D3                   call prs
  7106 0000306D 83C402                   add  sp, 2
  7107                                  
  7108                                  ;-861    expect(')');
  7109                                  
  7110 00003070 6A29                     push 41
  7111 00003072 E8A5DE                   call expect
  7112 00003075 83C402                   add  sp, 2
  7113                                  
  7114                                  ;-862  }
  7115                                  
  7116                                  
  7117                                  ;-863 
  7118                                  
  7119                                  
  7120                                  ;-864 /***************************************************************/
  7121                                  
  7122                                  
  7123                                  ;-865 
  7124                                  
  7125                                  
  7126                                  ;-866 int prlabel(int n) {
  7127                                  
  7128                                   .retnpexpr:
  7129 00003078 C3                       ret
  7130 00003079 5F00                    pexpr_0 db "_",0
  7131 0000307B 5C6E206F722020616C-     pexpr_1 db "\n or  al, al\n je .",0
  7132 00003084 2C20616C5C6E206A65-
  7133 0000308D 202E00             
  7134                                  ENDP
  7135                                  
  7136                                  prlabel: PROC
  7137                                  
  7138                                  ;-867     prs("\n.");
  7139                                  ;
  7140 00003090 C8000000                 ENTER  0,0
  7141 00003094 68[BB30]                 push prlabel_0
  7142 00003097 E845D3                   call prs
  7143 0000309A 83C402                   add  sp, 2
  7144                                  
  7145                                  ;-868     prs(fname);
  7146                                  
  7147 0000309D 8D06E06D                 lea  ax, [fname]
  7148 000030A1 50                       push ax
  7149 000030A2 E83AD3                   call prs
  7150 000030A5 83C402                   add  sp, 2
  7151                                  
  7152                                  ;-869     prunsign1(n);
  7153                                  
  7154 000030A8 FF7604                   push word [bp+4]
  7155 000030AB E886D4                   call prunsign1
  7156 000030AE 83C402                   add  sp, 2
  7157                                  
  7158                                  ;-870     prc(':');
  7159                                  
  7160 000030B1 6A3A                     push 58
  7161 000030B3 E8D0D2                   call prc
  7162 000030B6 83C402                   add  sp, 2
  7163                                  
  7164                                  ;-871 }
  7165                                  
  7166                                  
  7167                                  ;-872 int prjump (int n) {
  7168 000030B9 C9                       LEAVE
  7169 000030BA C3                       ret
  7170 000030BB 5C6E2E00                prlabel_0 db "\n.",0
  7171                                  ENDP
  7172                                  
  7173                                  prjump: PROC
  7174                                  
  7175                                  ;-873     prs("\n jmp .");
  7176                                  ;
  7177 000030BF C8000000                 ENTER  0,0
  7178 000030C3 68[E230]                 push prjump_0
  7179 000030C6 E816D3                   call prs
  7180 000030C9 83C402                   add  sp, 2
  7181                                  
  7182                                  ;-874     prs(fname);
  7183                                  
  7184 000030CC 8D06E06D                 lea  ax, [fname]
  7185 000030D0 50                       push ax
  7186 000030D1 E80BD3                   call prs
  7187 000030D4 83C402                   add  sp, 2
  7188                                  
  7189                                  ;-875     prunsign1(n);
  7190                                  
  7191 000030D7 FF7604                   push word [bp+4]
  7192 000030DA E857D4                   call prunsign1
  7193 000030DD 83C402                   add  sp, 2
  7194                                  
  7195                                  ;-876 }
  7196                                  
  7197                                  
  7198                                  ;-877 
  7199                                  
  7200                                  
  7201                                  ;-878 int stmt() {
  7202 000030E0 C9                       LEAVE
  7203 000030E1 C3                       ret
  7204 000030E2 5C6E206A6D70202E00      prjump_0 db "\n jmp .",0
  7205                                  ENDP
  7206                                  
  7207                                  stmt: PROC
  7208                                  
  7209                                  ;-879     int c; char cha;
  7210                                  
  7211                                  
  7212                                  ;-880     int jdest; int tst; int jtemp;
  7213                                  
  7214                                  
  7215                                  ;-881        if(istoken('{'))     {while(istoken('}')==0) stmt();}
  7216                                  ;
  7217 000030EB C80A0000                 ENTER  10,0
  7218 000030EF 6A7B                     push 123
  7219 000030F1 E804DE                   call istoken
  7220 000030F4 83C402                   add  sp, 2
  7221 000030F7 08C0                     or  al, al
  7222 000030F9 0F841700                 je .stmt390
  7223                                  .stmt391:
  7224 000030FD 6A7D                     push 125
  7225 000030FF E8F6DD                   call istoken
  7226 00003102 83C402                   add  sp, 2
  7227 00003105 83F800                   cmp ax, 0
  7228 00003108 0F850500                 jne .stmt392
  7229 0000310C E8DCFF                   call stmt
  7230 0000310F EBEC                     jmp .stmt391
  7231                                  .stmt392:
  7232                                  
  7233                                  ;-882   else if(istoken(T_IF)) {
  7234                                  
  7235 00003111 E9D002                   jmp .stmt393
  7236                                  .stmt390:
  7237 00003114 680102                   push 513
  7238 00003117 E8DEDD                   call istoken
  7239 0000311A 83C402                   add  sp, 2
  7240 0000311D 08C0                     or  al, al
  7241 0000311F 0F846500                 je .stmt394
  7242                                  
  7243                                  ;-883       int jdest; int tst;
  7244                                  
  7245 00003123 8B46FA                   mov ax, [bp-6]
  7246 00003126 8B46F8                   mov ax, [bp-8]
  7247                                  
  7248                                  ;-884       pexpr(); nlabel++; jdest=nlabel;
  7249                                  
  7250 00003129 E8D2FE                   call pexpr
  7251 0000312C FF06[2900]               inc  word[nlabel]
  7252 00003130 A1[2900]                 mov ax, [nlabel]
  7253 00003133 8946FA                   mov [bp-6], ax
  7254                                  
  7255                                  ;-885       pint1(jdest); stmt();
  7256                                  
  7257 00003136 FF76FA                   push word [bp-6]
  7258 00003139 E89AD3                   call pint1
  7259 0000313C 83C402                   add  sp, 2
  7260 0000313F E8A9FF                   call stmt
  7261                                  
  7262                                  ;-886       if (istoken(T_ELSE)) { nlabel++; tst=nlabel;
  7263                                  
  7264 00003142 680202                   push 514
  7265 00003145 E8B0DD                   call istoken
  7266 00003148 83C402                   add  sp, 2
  7267 0000314B 08C0                     or  al, al
  7268 0000314D 0F842B00                 je .stmt395
  7269 00003151 FF06[2900]               inc  word[nlabel]
  7270 00003155 A1[2900]                 mov ax, [nlabel]
  7271 00003158 8946F8                   mov [bp-8], ax
  7272                                  
  7273                                  ;-887           prjump(tst); prlabel(jdest); stmt(); prlabel(tst);
  7274                                  
  7275 0000315B FF76F8                   push word [bp-8]
  7276 0000315E E85EFF                   call prjump
  7277 00003161 83C402                   add  sp, 2
  7278 00003164 FF76FA                   push word [bp-6]
  7279 00003167 E826FF                   call prlabel
  7280 0000316A 83C402                   add  sp, 2
  7281 0000316D E87BFF                   call stmt
  7282 00003170 FF76F8                   push word [bp-8]
  7283 00003173 E81AFF                   call prlabel
  7284 00003176 83C402                   add  sp, 2
  7285                                  
  7286                                  ;-888       }
  7287                                  
  7288                                  
  7289                                  ;-889       else prlabel(jdest);
  7290                                  
  7291 00003179 E90900                   jmp .stmt396
  7292                                  .stmt395:
  7293 0000317C FF76FA                   push word [bp-6]
  7294 0000317F E80EFF                   call prlabel
  7295 00003182 83C402                   add  sp, 2
  7296                                  
  7297                                  ;-890   }
  7298                                  
  7299                                  .stmt396:
  7300                                  
  7301                                  ;-891   else if(istoken(T_DO)) {
  7302                                  
  7303 00003185 E95C02                   jmp .stmt397
  7304                                  .stmt394:
  7305 00003188 680402                   push 516
  7306 0000318B E86ADD                   call istoken
  7307 0000318E 83C402                   add  sp, 2
  7308 00003191 08C0                     or  al, al
  7309 00003193 0F844A00                 je .stmt398
  7310                                  
  7311                                  ;-892       nlabel++; jdest=nlabel; prlabel(jdest); stmt();
  7312                                  
  7313 00003197 FF06[2900]               inc  word[nlabel]
  7314 0000319B A1[2900]                 mov ax, [nlabel]
  7315 0000319E 8946FA                   mov [bp-6], ax
  7316 000031A1 FF76FA                   push word [bp-6]
  7317 000031A4 E8E9FE                   call prlabel
  7318 000031A7 83C402                   add  sp, 2
  7319 000031AA E83EFF                   call stmt
  7320                                  
  7321                                  ;-893       expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);
  7322                                  
  7323 000031AD 680302                   push 515
  7324 000031B0 E867DD                   call expect
  7325 000031B3 83C402                   add  sp, 2
  7326 000031B6 E845FE                   call pexpr
  7327 000031B9 FF06[2900]               inc  word[nlabel]
  7328 000031BD A1[2900]                 mov ax, [nlabel]
  7329 000031C0 8946F6                   mov [bp-10], ax
  7330 000031C3 FF76F6                   push word [bp-10]
  7331 000031C6 E80DD3                   call pint1
  7332 000031C9 83C402                   add  sp, 2
  7333                                  
  7334                                  ;-894       prjump(jdest); prlabel(jtemp);
  7335                                  
  7336 000031CC FF76FA                   push word [bp-6]
  7337 000031CF E8EDFE                   call prjump
  7338 000031D2 83C402                   add  sp, 2
  7339 000031D5 FF76F6                   push word [bp-10]
  7340 000031D8 E8B5FE                   call prlabel
  7341 000031DB 83C402                   add  sp, 2
  7342                                  
  7343                                  ;-895   }
  7344                                  
  7345                                  
  7346                                  ;-896   else if(istoken(T_WHILE)) {
  7347                                  
  7348 000031DE E90302                   jmp .stmt399
  7349                                  .stmt398:
  7350 000031E1 680302                   push 515
  7351 000031E4 E811DD                   call istoken
  7352 000031E7 83C402                   add  sp, 2
  7353 000031EA 08C0                     or  al, al
  7354 000031EC 0F844100                 je .stmt400
  7355                                  
  7356                                  ;-897       nlabel++; jdest=nlabel;
  7357                                  
  7358 000031F0 FF06[2900]               inc  word[nlabel]
  7359 000031F4 A1[2900]                 mov ax, [nlabel]
  7360 000031F7 8946FA                   mov [bp-6], ax
  7361                                  
  7362                                  ;-898       prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);
  7363                                  
  7364 000031FA FF76FA                   push word [bp-6]
  7365 000031FD E890FE                   call prlabel
  7366 00003200 83C402                   add  sp, 2
  7367 00003203 E8F8FD                   call pexpr
  7368 00003206 FF06[2900]               inc  word[nlabel]
  7369 0000320A A1[2900]                 mov ax, [nlabel]
  7370 0000320D 8946F8                   mov [bp-8], ax
  7371 00003210 FF76F8                   push word [bp-8]
  7372 00003213 E8C0D2                   call pint1
  7373 00003216 83C402                   add  sp, 2
  7374                                  
  7375                                  ;-899       stmt(); prjump(jdest); prlabel(tst);
  7376                                  
  7377 00003219 E8CFFE                   call stmt
  7378 0000321C FF76FA                   push word [bp-6]
  7379 0000321F E89DFE                   call prjump
  7380 00003222 83C402                   add  sp, 2
  7381 00003225 FF76F8                   push word [bp-8]
  7382 00003228 E865FE                   call prlabel
  7383 0000322B 83C402                   add  sp, 2
  7384                                  
  7385                                  ;-900   }
  7386                                  
  7387                                  
  7388                                  ;-901   else if(istoken(T_GOTO))  {
  7389                                  
  7390 0000322E E9B301                   jmp .stmt401
  7391                                  .stmt400:
  7392 00003231 680902                   push 521
  7393 00003234 E8C1DC                   call istoken
  7394 00003237 83C402                   add  sp, 2
  7395 0000323A 08C0                     or  al, al
  7396 0000323C 0F842200                 je .stmt402
  7397                                  
  7398                                  ;-902       prs("\n jmp .");name1();prs(symbol);expect(';');
  7399                                  
  7400 00003240 68[E633]                 push stmt_0
  7401 00003243 E899D1                   call prs
  7402 00003246 83C402                   add  sp, 2
  7403 00003249 E879DE                   call name1
  7404 0000324C 8D06606D                 lea  ax, [symbol]
  7405 00003250 50                       push ax
  7406 00003251 E88BD1                   call prs
  7407 00003254 83C402                   add  sp, 2
  7408 00003257 6A3B                     push 59
  7409 00003259 E8BEDC                   call expect
  7410 0000325C 83C402                   add  sp, 2
  7411                                  
  7412                                  ;-903   }
  7413                                  
  7414                                  
  7415                                  ;-904   else if(token==T_ASM)     {
  7416                                  
  7417 0000325F E98201                   jmp .stmt403
  7418                                  .stmt402:
  7419 00003262 A1[1E00]                 mov ax, [token]
  7420 00003265 3D0602                   cmp ax, 518
  7421 00003268 0F853300                 jne .stmt404
  7422                                  
  7423                                  ;-905       prs("\n"); c=next();
  7424                                  
  7425 0000326C 68[EF33]                 push stmt_1
  7426 0000326F E86DD1                   call prs
  7427 00003272 83C402                   add  sp, 2
  7428 00003275 E805D5                   call next
  7429 00003278 8946FE                   mov [bp-2], ax
  7430                                  
  7431                                  ;-906       while(c != '\n') { prc(c);	c=next(); };
  7432                                  
  7433                                  .stmt405:
  7434 0000327B 8B46FE                   mov ax, [bp-2]
  7435 0000327E 83F80A                   cmp ax, 10
  7436 00003281 0F841100                 je  .stmt406
  7437 00003285 FF76FE                   push word [bp-2]
  7438 00003288 E8FBD0                   call prc
  7439 0000328B 83C402                   add  sp, 2
  7440 0000328E E8ECD4                   call next
  7441 00003291 8946FE                   mov [bp-2], ax
  7442 00003294 EBE5                     jmp .stmt405
  7443                                  .stmt406:
  7444                                  
  7445                                  ;-907       token=getlex();
  7446                                  
  7447 00003296 E8ADD5                   call getlex
  7448 00003299 A3[1E00]                 mov word [token], ax
  7449                                  
  7450                                  ;-908   }
  7451                                  
  7452                                  
  7453                                  ;-909   else if(istoken(T_ASMBLOCK)) {
  7454                                  
  7455 0000329C E94501                   jmp .stmt407
  7456                                  .stmt404:
  7457 0000329F 680702                   push 519
  7458 000032A2 E853DC                   call istoken
  7459 000032A5 83C402                   add  sp, 2
  7460 000032A8 08C0                     or  al, al
  7461 000032AA 0F844B00                 je .stmt408
  7462                                  
  7463                                  ;-910       if (token== '{' )  {
  7464                                  
  7465 000032AE A1[1E00]                 mov ax, [token]
  7466 000032B1 83F87B                   cmp ax, 123
  7467 000032B4 0F853500                 jne .stmt409
  7468                                  
  7469                                  ;-911           prs("\n"); cha=next();
  7470                                  
  7471 000032B8 68[F233]                 push stmt_2
  7472 000032BB E821D1                   call prs
  7473 000032BE 83C402                   add  sp, 2
  7474 000032C1 E8B9D4                   call next
  7475 000032C4 8846FC                   mov [bp-4], al
  7476                                  
  7477                                  ;-912           while(cha!= '}') {
  7478                                  
  7479                                  .stmt410:
  7480 000032C7 8A46FC                   mov al, [bp-4]
  7481 000032CA 3C7D                     cmp al, 125
  7482 000032CC 0F841400                 je  .stmt411
  7483                                  
  7484                                  ;-913               prc(cha);
  7485                                  
  7486 000032D0 8A46FC                   mov al, byte [bp-4]
  7487 000032D3 B400                     mov ah, 0
  7488 000032D5 50                       push ax
  7489 000032D6 E8ADD0                   call prc
  7490 000032D9 83C402                   add  sp, 2
  7491                                  
  7492                                  ;-914               cha=next();
  7493                                  
  7494 000032DC E89ED4                   call next
  7495 000032DF 8846FC                   mov [bp-4], al
  7496                                  
  7497                                  ;-915           }
  7498                                  
  7499                                  
  7500                                  ;-916           token=getlex();
  7501                                  
  7502 000032E2 EBE3                     jmp .stmt410
  7503                                  .stmt411:
  7504 000032E4 E85FD5                   call getlex
  7505 000032E7 A3[1E00]                 mov word [token], ax
  7506                                  
  7507                                  ;-917       } else error1("Curly open expected");
  7508                                  
  7509 000032EA E90900                   jmp .stmt412
  7510                                  .stmt409:
  7511 000032ED 68[F533]                 push stmt_3
  7512 000032F0 E8A8D2                   call error1
  7513 000032F3 83C402                   add  sp, 2
  7514                                  
  7515                                  ;-918         }
  7516                                  
  7517                                  .stmt412:
  7518                                  
  7519                                  ;-919   else if(istoken(T_EMIT)) {
  7520                                  
  7521 000032F6 E9EB00                   jmp .stmt413
  7522                                  .stmt408:
  7523 000032F9 680802                   push 520
  7524 000032FC E8F9DB                   call istoken
  7525 000032FF 83C402                   add  sp, 2
  7526 00003302 08C0                     or  al, al
  7527 00003304 0F843E00                 je .stmt414
  7528                                  
  7529                                  ;-920       prs("\n db ");
  7530                                  
  7531 00003308 68[0934]                 push stmt_4
  7532 0000330B E8D1D0                   call prs
  7533 0000330E 83C402                   add  sp, 2
  7534                                  
  7535                                  ;-921     L1: token=getlex();
  7536                                  
  7537                                  .L1:
  7538 00003311 E832D5                   call getlex
  7539 00003314 A3[1E00]                 mov word [token], ax
  7540                                  
  7541                                  ;-922       prunsign1(lexval);
  7542                                  
  7543 00003317 FF36[2B00]               push word [lexval]
  7544 0000331B E816D2                   call prunsign1
  7545 0000331E 83C402                   add  sp, 2
  7546                                  
  7547                                  ;-923       token=getlex();
  7548                                  
  7549 00003321 E822D5                   call getlex
  7550 00003324 A3[1E00]                 mov word [token], ax
  7551                                  
  7552                                  ;-924       if (token== ',') {
  7553                                  
  7554 00003327 A1[1E00]                 mov ax, [token]
  7555 0000332A 83F82C                   cmp ax, 44
  7556 0000332D 0F850A00                 jne .stmt415
  7557                                  
  7558                                  ;-925           prc(',');
  7559                                  
  7560 00003331 6A2C                     push 44
  7561 00003333 E850D0                   call prc
  7562 00003336 83C402                   add  sp, 2
  7563                                  
  7564                                  ;-926           goto L1;
  7565                                  
  7566 00003339 EBD6                     jmp .L1
  7567                                  
  7568                                  ;-927       }
  7569                                  
  7570                                  
  7571                                  ;-928       expect(')');
  7572                                  
  7573                                  .stmt415:
  7574 0000333B 6A29                     push 41
  7575 0000333D E8DADB                   call expect
  7576 00003340 83C402                   add  sp, 2
  7577                                  
  7578                                  ;-929   }
  7579                                  
  7580                                  
  7581                                  ;-930   else if(istoken(';'))      { }
  7582                                  
  7583 00003343 E99E00                   jmp .stmt416
  7584                                  .stmt414:
  7585 00003346 6A3B                     push 59
  7586 00003348 E8ADDB                   call istoken
  7587 0000334B 83C402                   add  sp, 2
  7588 0000334E 08C0                     or  al, al
  7589 00003350 0F840300                 je .stmt417
  7590                                  
  7591                                  ;-931   else if(istoken(T_RETURN)) {
  7592                                  
  7593 00003354 E98D00                   jmp .stmt418
  7594                                  .stmt417:
  7595 00003357 680002                   push 512
  7596 0000335A E89BDB                   call istoken
  7597 0000335D 83C402                   add  sp, 2
  7598 00003360 08C0                     or  al, al
  7599 00003362 0F843500                 je .stmt419
  7600                                  
  7601                                  ;-932         if (token!=';') expr(0);
  7602                                  
  7603 00003366 A1[1E00]                 mov ax, [token]
  7604 00003369 83F83B                   cmp ax, 59
  7605 0000336C 0F840800                 je  .stmt420
  7606 00003370 6A00                     push 0
  7607 00003372 E82EF8                   call expr
  7608 00003375 83C402                   add  sp, 2
  7609                                  
  7610                                  ;-933         prs("\n jmp .retn");
  7611                                  
  7612                                  .stmt420:
  7613 00003378 68[1034]                 push stmt_5
  7614 0000337B E861D0                   call prs
  7615 0000337E 83C402                   add  sp, 2
  7616                                  
  7617                                  ;-934         prs(fname);
  7618                                  
  7619 00003381 8D06E06D                 lea  ax, [fname]
  7620 00003385 50                       push ax
  7621 00003386 E856D0                   call prs
  7622 00003389 83C402                   add  sp, 2
  7623                                  
  7624                                  ;-935         nreturn++;
  7625                                  
  7626 0000338C FF06[2700]               inc  word[nreturn]
  7627                                  
  7628                                  ;-936         expect(';');
  7629                                  
  7630 00003390 6A3B                     push 59
  7631 00003392 E885DB                   call expect
  7632 00003395 83C402                   add  sp, 2
  7633                                  
  7634                                  ;-937         }
  7635                                  
  7636                                  
  7637                                  ;-938   else if(thechar==':')      {
  7638                                  
  7639 00003398 E94900                   jmp .stmt421
  7640                                  .stmt419:
  7641 0000339B A0[2200]                 mov al, [thechar]
  7642 0000339E 3C3A                     cmp al, 58
  7643 000033A0 0F853000                 jne .stmt422
  7644                                  
  7645                                  ;-939         prs("\n."); // Label
  7646                                  
  7647 000033A4 68[1D34]                 push stmt_6
  7648 000033A7 E835D0                   call prs
  7649 000033AA 83C402                   add  sp, 2
  7650                                  
  7651                                  ;-940         prs(symbol); prc(':');
  7652                                  
  7653 000033AD 8D06606D                 lea  ax, [symbol]
  7654 000033B1 50                       push ax
  7655 000033B2 E82AD0                   call prs
  7656 000033B5 83C402                   add  sp, 2
  7657 000033B8 6A3A                     push 58
  7658 000033BA E8C9CF                   call prc
  7659 000033BD 83C402                   add  sp, 2
  7660                                  
  7661                                  ;-941         expect(T_NAME);
  7662                                  
  7663 000033C0 680001                   push 256
  7664 000033C3 E854DB                   call expect
  7665 000033C6 83C402                   add  sp, 2
  7666                                  
  7667                                  ;-942         expect(':');
  7668                                  
  7669 000033C9 6A3A                     push 58
  7670 000033CB E84CDB                   call expect
  7671 000033CE 83C402                   add  sp, 2
  7672                                  
  7673                                  ;-943         }
  7674                                  
  7675                                  
  7676                                  ;-944   else  {expr(0);; expect(';'); }
  7677                                  
  7678 000033D1 E91000                   jmp .stmt423
  7679                                  .stmt422:
  7680 000033D4 6A00                     push 0
  7681 000033D6 E8CAF7                   call expr
  7682 000033D9 83C402                   add  sp, 2
  7683 000033DC 6A3B                     push 59
  7684 000033DE E839DB                   call expect
  7685 000033E1 83C402                   add  sp, 2
  7686                                  
  7687                                  ;-945 }
  7688                                  
  7689                                  .stmt423:
  7690                                  .stmt421:
  7691                                  .stmt418:
  7692                                  .stmt416:
  7693                                  .stmt413:
  7694                                  .stmt407:
  7695                                  .stmt403:
  7696                                  .stmt401:
  7697                                  .stmt399:
  7698                                  .stmt397:
  7699                                  .stmt393:
  7700                                  
  7701                                  ;-946 
  7702                                  
  7703                                  
  7704                                  ;-947 
  7705                                  
  7706                                  
  7707                                  ;-948 int dofunc() { int nloc; int i; unsigned int j;int narg;
  7708 000033E4 C9                       LEAVE
  7709 000033E5 C3                       ret
  7710 000033E6 5C6E206A6D70202E00      stmt_0 db "\n jmp .",0
  7711 000033EF 5C6E00                  stmt_1 db "\n",0
  7712 000033F2 5C6E00                  stmt_2 db "\n",0
  7713 000033F5 4375726C79206F7065-     stmt_3 db "Curly open expected",0
  7714 000033FE 6E2065787065637465-
  7715 00003407 6400               
  7716 00003409 5C6E2064622000          stmt_4 db "\n db ",0
  7717 00003410 5C6E206A6D70202E72-     stmt_5 db "\n jmp .retn",0
  7718 00003419 65746E00           
  7719 0000341D 5C6E2E00                stmt_6 db "\n.",0
  7720                                  ENDP
  7721                                  
  7722                                  dofunc: PROC
  7723                                  
  7724                                  ;-949     cloc=&co;
  7725                                  ;
  7726 00003421 C8080000                 ENTER  8,0
  7727 00003425 B8A861                   mov ax, co
  7728 00003428 A3[1800]                 mov word [cloc], ax
  7729                                  
  7730                                  ;-950     checknamelen();
  7731                                  
  7732 0000342B E887DB                   call checknamelen
  7733                                  
  7734                                  ;-951     strcpy(fname, symbol);
  7735                                  
  7736 0000342E 8D06606D                 lea  ax, [symbol]
  7737 00003432 50                       push ax
  7738 00003433 8D06E06D                 lea  ax, [fname]
  7739 00003437 50                       push ax
  7740 00003438 E8EECD                   call strcpy
  7741 0000343B 83C404                   add  sp, 4
  7742                                  
  7743                                  ;-952     i=0;
  7744                                  
  7745 0000343E B80000                   mov ax, 0
  7746 00003441 8946FC                   mov [bp-4], ax
  7747                                  
  7748                                  ;-953     while (i < FTop) {
  7749                                  
  7750                                  .dofunc424:
  7751 00003444 8B46FC                   mov ax, [bp-4]
  7752 00003447 3B06[3C00]               cmp ax, [FTop]
  7753 0000344B 0F8D3300                 jge .dofunc425
  7754                                  
  7755                                  ;-954         j=adrF(FNameField, i);
  7756                                  
  7757 0000344F FF76FC                   push word [bp-4]
  7758 00003452 8D06798F                 lea  ax, [FNameField]
  7759 00003456 50                       push ax
  7760 00003457 E83BD3                   call adrF
  7761 0000345A 83C404                   add  sp, 4
  7762 0000345D 8946FA                   mov [bp-6], ax
  7763                                  
  7764                                  ;-955         if(eqstr(symbol, j)) error1("Function already defined");
  7765                                  
  7766 00003460 FF76FA                   push word [bp-6]
  7767 00003463 8D06606D                 lea  ax, [symbol]
  7768 00003467 50                       push ax
  7769 00003468 E8F4CD                   call eqstr
  7770 0000346B 83C404                   add  sp, 4
  7771 0000346E 08C0                     or  al, al
  7772 00003470 0F840900                 je .dofunc426
  7773 00003474 68[B336]                 push dofunc_0
  7774 00003477 E821D1                   call error1
  7775 0000347A 83C402                   add  sp, 2
  7776                                  
  7777                                  ;-956         i++;
  7778                                  
  7779                                  .dofunc426:
  7780 0000347D FF46FC                   inc  word[bp-4]
  7781                                  
  7782                                  ;-957     }
  7783                                  
  7784                                  
  7785                                  ;-958     if (FTop >= FUNCMAX) error1("Function table full");
  7786                                  
  7787 00003480 EBC2                     jmp .dofunc424
  7788                                  .dofunc425:
  7789 00003482 A1[3C00]                 mov ax, [FTop]
  7790 00003485 3D2C01                   cmp ax, 300 ;unsigned : 1
  7791 00003488 0F8C0900                 jl  .dofunc427
  7792 0000348C 68[CC36]                 push dofunc_1
  7793 0000348F E809D1                   call error1
  7794 00003492 83C402                   add  sp, 2
  7795                                  
  7796                                  ;-959     pt=adrF(FNameField, FTop);
  7797                                  
  7798                                  .dofunc427:
  7799 00003495 FF36[3C00]               push word [FTop]
  7800 00003499 8D06798F                 lea  ax, [FNameField]
  7801 0000349D 50                       push ax
  7802 0000349E E8F4D2                   call adrF
  7803 000034A1 83C404                   add  sp, 4
  7804 000034A4 A3[4200]                 mov word [pt], ax
  7805                                  
  7806                                  ;-960     strcpy(pt, symbol);
  7807                                  
  7808 000034A7 8D06606D                 lea  ax, [symbol]
  7809 000034AB 50                       push ax
  7810 000034AC FF36[4200]               push word [pt]
  7811 000034B0 E876CD                   call strcpy
  7812 000034B3 83C404                   add  sp, 4
  7813                                  
  7814                                  ;-961     FTop++;
  7815                                  
  7816 000034B6 FF06[3C00]               inc  word[FTop]
  7817                                  
  7818                                  ;-962 
  7819                                  
  7820                                  
  7821                                  ;-963   prs("\n\n"); prs(symbol); prs(": PROC");
  7822                                  
  7823 000034BA 68[E036]                 push dofunc_2
  7824 000034BD E81FCF                   call prs
  7825 000034C0 83C402                   add  sp, 2
  7826 000034C3 8D06606D                 lea  ax, [symbol]
  7827 000034C7 50                       push ax
  7828 000034C8 E814CF                   call prs
  7829 000034CB 83C402                   add  sp, 2
  7830 000034CE 68[E536]                 push dofunc_3
  7831 000034D1 E80BCF                   call prs
  7832 000034D4 83C402                   add  sp, 2
  7833                                  
  7834                                  ;-964   expect('('); LTop=LSTART;
  7835                                  
  7836 000034D7 6A28                     push 40
  7837 000034D9 E83EDA                   call expect
  7838 000034DC 83C402                   add  sp, 2
  7839 000034DF B8C800                   mov ax, 200
  7840 000034E2 A3[3A00]                 mov word [LTop], ax
  7841                                  
  7842                                  ;-965   if (istoken(')')==0) { narg=2;
  7843                                  
  7844 000034E5 6A29                     push 41
  7845 000034E7 E80EDA                   call istoken
  7846 000034EA 83C402                   add  sp, 2
  7847 000034ED 83F800                   cmp ax, 0
  7848 000034F0 0F854600                 jne .dofunc428
  7849 000034F4 B80200                   mov ax, 2
  7850 000034F7 8946F8                   mov [bp-8], ax
  7851                                  
  7852                                  ;-966     do { typeName();  addlocal(); narg+=2;
  7853                                  
  7854                                  .dofunc429:
  7855 000034FA E8F0DB                   call typeName
  7856 000034FD E87DDD                   call addlocal
  7857 00003500 8346F802                 add  word[bp-8], 2
  7858                                  
  7859                                  ;-967          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }
  7860                                  
  7861 00003504 8B46F8                   mov ax, [bp-8]
  7862 00003507 8B1E[3A00]               mov bx, [LTop]
  7863 0000350B D1E3                     shl bx, 1
  7864 0000350D 89875973                 mov [GData+bx], ax
  7865 00003511 A0[3500]                 mov al, [iswidth]
  7866 00003514 3C04                     cmp al, 4
  7867 00003516 0F850400                 jne .dofunc430
  7868 0000351A 8346F802                 add  word[bp-8], 2
  7869                                  .dofunc430:
  7870 0000351E FF06[3A00]               inc  word[LTop]
  7871                                  
  7872                                  ;-968     while (istoken(','));  expect(')'); }
  7873                                  
  7874 00003522 6A2C                     push 44
  7875 00003524 E8D1D9                   call istoken
  7876 00003527 83C402                   add  sp, 2
  7877 0000352A 08C0                     or  al, al
  7878 0000352C 0F840200                 je .dofunc431
  7879 00003530 EBC8                     jmp .dofunc429
  7880                                  .dofunc431:
  7881 00003532 6A29                     push 41
  7882 00003534 E8E3D9                   call expect
  7883 00003537 83C402                   add  sp, 2
  7884                                  
  7885                                  ;-969 
  7886                                  
  7887                                  
  7888                                  ;-970   expect('{'); /*body*/
  7889                                  
  7890                                  .dofunc428:
  7891 0000353A 6A7B                     push 123
  7892 0000353C E8DBD9                   call expect
  7893 0000353F 83C402                   add  sp, 2
  7894                                  
  7895                                  ;-971   nloc=0; nreturn=0; nconst=0;
  7896                                  
  7897 00003542 B80000                   mov ax, 0
  7898 00003545 8946FE                   mov [bp-2], ax
  7899 00003548 B80000                   mov ax, 0
  7900 0000354B A3[2700]                 mov word [nreturn], ax
  7901 0000354E B80000                   mov ax, 0
  7902 00003551 A3[2500]                 mov word [nconst], ax
  7903                                  
  7904                                  ;-972   while(isvariable()) {
  7905                                  
  7906                                  .dofunc432:
  7907 00003554 E8C2DD                   call isvariable
  7908 00003557 08C0                     or  al, al
  7909 00003559 0F849200                 je .dofunc433
  7910                                  
  7911                                  ;-973     do {typeName();
  7912                                  
  7913                                  .dofunc434:
  7914 0000355D E88DDB                   call typeName
  7915                                  
  7916                                  ;-974         checknamelen();
  7917                                  
  7918 00003560 E852DA                   call checknamelen
  7919                                  
  7920                                  ;-975         addlocal(); nloc-=2;
  7921                                  
  7922 00003563 E817DD                   call addlocal
  7923 00003566 836EFE02                 sub  word[bp-2], 2
  7924                                  
  7925                                  ;-976         if (iswidth == 4) nloc-=2;
  7926                                  
  7927 0000356A A0[3500]                 mov al, [iswidth]
  7928 0000356D 3C04                     cmp al, 4
  7929 0000356F 0F850400                 jne .dofunc435
  7930 00003573 836EFE02                 sub  word[bp-2], 2
  7931                                  
  7932                                  ;-977         GData[LTop]=nloc;
  7933                                  
  7934                                  .dofunc435:
  7935 00003577 8B46FE                   mov ax, [bp-2]
  7936 0000357A 8B1E[3A00]               mov bx, [LTop]
  7937 0000357E D1E3                     shl bx, 1
  7938 00003580 89875973                 mov [GData+bx], ax
  7939                                  
  7940                                  ;-978         if (istoken('[')){
  7941                                  
  7942 00003584 6A5B                     push 91
  7943 00003586 E86FD9                   call istoken
  7944 00003589 83C402                   add  sp, 2
  7945 0000358C 08C0                     or  al, al
  7946 0000358E 0F843D00                 je .dofunc436
  7947                                  
  7948                                  ;-979             istype='&';GType[LTop]='&';expect(T_CONST);expect(']');
  7949                                  
  7950 00003592 B82600                   mov ax, 38
  7951 00003595 A2[2F00]                 mov byte [istype], al
  7952 00003598 B82600                   mov ax, 38
  7953 0000359B 8B1E[3A00]               mov bx, [LTop]
  7954 0000359F 8887A96E                 mov [GType+bx], al
  7955 000035A3 680101                   push 257
  7956 000035A6 E871D9                   call expect
  7957 000035A9 83C402                   add  sp, 2
  7958 000035AC 6A5D                     push 93
  7959 000035AE E869D9                   call expect
  7960 000035B1 83C402                   add  sp, 2
  7961                                  
  7962                                  ;-980             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc;
  7963                                  
  7964 000035B4 8B46FE                   mov ax, [bp-2]
  7965 000035B7 2B06[2B00]               sub ax, [lexval]
  7966 000035BB 8946FE                   mov [bp-2], ax
  7967 000035BE 8346FE02                 add  word[bp-2], 2
  7968 000035C2 8B46FE                   mov ax, [bp-2]
  7969 000035C5 8B1E[3A00]               mov bx, [LTop]
  7970 000035C9 D1E3                     shl bx, 1
  7971 000035CB 89875973                 mov [GData+bx], ax
  7972                                  
  7973                                  ;-981             }
  7974                                  
  7975                                  
  7976                                  ;-982         LTop++;
  7977                                  
  7978                                  .dofunc436:
  7979 000035CF FF06[3A00]               inc  word[LTop]
  7980                                  
  7981                                  ;-983       } while (istoken(',')); expect(';'); }
  7982                                  
  7983 000035D3 6A2C                     push 44
  7984 000035D5 E820D9                   call istoken
  7985 000035D8 83C402                   add  sp, 2
  7986 000035DB 08C0                     or  al, al
  7987 000035DD 0F840300                 je .dofunc437
  7988 000035E1 E979FF                   jmp .dofunc434
  7989                                  .dofunc437:
  7990 000035E4 6A3B                     push 59
  7991 000035E6 E831D9                   call expect
  7992 000035E9 83C402                   add  sp, 2
  7993                                  
  7994                                  ;-984   if (LTop>LSTART){prs(";\n ENTER  ");
  7995                                  
  7996 000035EC E965FF                   jmp .dofunc432
  7997                                  .dofunc433:
  7998 000035EF A1[3A00]                 mov ax, [LTop]
  7999 000035F2 3DC800                   cmp ax, 200
  8000 000035F5 0F8E2700                 jle .dofunc438
  8001 000035F9 68[EC36]                 push dofunc_4
  8002 000035FC E8E0CD                   call prs
  8003 000035FF 83C402                   add  sp, 2
  8004                                  
  8005                                  ;-985     nloc=mkneg(nloc); prunsign1 (nloc); prs(",0"); }
  8006                                  
  8007 00003602 FF76FE                   push word [bp-2]
  8008 00003605 E899CA                   call mkneg
  8009 00003608 83C402                   add  sp, 2
  8010 0000360B 8946FE                   mov [bp-2], ax
  8011 0000360E FF76FE                   push word [bp-2]
  8012 00003611 E820CF                   call prunsign1
  8013 00003614 83C402                   add  sp, 2
  8014 00003617 68[F836]                 push dofunc_5
  8015 0000361A E8C2CD                   call prs
  8016 0000361D 83C402                   add  sp, 2
  8017                                  
  8018                                  ;-986   while(istoken('}')==0)   stmt();
  8019                                  
  8020                                  .dofunc438:
  8021                                  .dofunc439:
  8022 00003620 6A7D                     push 125
  8023 00003622 E8D3D8                   call istoken
  8024 00003625 83C402                   add  sp, 2
  8025 00003628 83F800                   cmp ax, 0
  8026 0000362B 0F850500                 jne .dofunc440
  8027 0000362F E8B9FA                   call stmt
  8028                                  
  8029                                  ;-987   if (nreturn) {
  8030                                  
  8031 00003632 EBEC                     jmp .dofunc439
  8032                                  .dofunc440:
  8033 00003634 A1[2700]                 mov ax, [nreturn]
  8034 00003637 08C0                     or  al, al
  8035 00003639 0F841C00                 je .dofunc441
  8036                                  
  8037                                  ;-988         prs("\n .retn");
  8038                                  
  8039 0000363D 68[FB36]                 push dofunc_6
  8040 00003640 E89CCD                   call prs
  8041 00003643 83C402                   add  sp, 2
  8042                                  
  8043                                  ;-989         prs(fname);
  8044                                  
  8045 00003646 8D06E06D                 lea  ax, [fname]
  8046 0000364A 50                       push ax
  8047 0000364B E891CD                   call prs
  8048 0000364E 83C402                   add  sp, 2
  8049                                  
  8050                                  ;-990         prc(':');
  8051                                  
  8052 00003651 6A3A                     push 58
  8053 00003653 E830CD                   call prc
  8054 00003656 83C402                   add  sp, 2
  8055                                  
  8056                                  ;-991         }
  8057                                  
  8058                                  
  8059                                  ;-992   if (LTop > LSTART) prs(" LEAVE");
  8060                                  
  8061                                  .dofunc441:
  8062 00003659 A1[3A00]                 mov ax, [LTop]
  8063 0000365C 3DC800                   cmp ax, 200
  8064 0000365F 0F8E0900                 jle .dofunc442
  8065 00003663 68[0437]                 push dofunc_7
  8066 00003666 E876CD                   call prs
  8067 00003669 83C402                   add  sp, 2
  8068                                  
  8069                                  ;-993   prs("\n ret");
  8070                                  
  8071                                  .dofunc442:
  8072 0000366C 68[0B37]                 push dofunc_8
  8073 0000366F E86DCD                   call prs
  8074 00003672 83C402                   add  sp, 2
  8075                                  
  8076                                  ;-994   *cloc=0; prs(co);
  8077                                  
  8078 00003675 B80000                   mov ax, 0
  8079 00003678 8B1E[1800]               mov  bx, [cloc]
  8080 0000367C 8807                     mov  [bx], al
  8081 0000367E 8D06A861                 lea  ax, [co]
  8082 00003682 50                       push ax
  8083 00003683 E859CD                   call prs
  8084 00003686 83C402                   add  sp, 2
  8085                                  
  8086                                  ;-995   maxco1=strlen(co);
  8087                                  
  8088 00003689 8D06A861                 lea  ax, [co]
  8089 0000368D 50                       push ax
  8090 0000368E E870CB                   call strlen
  8091 00003691 83C402                   add  sp, 2
  8092 00003694 A3[1600]                 mov word [maxco1], ax
  8093                                  
  8094                                  ;-996   if (maxco1 > maxco) maxco=maxco1;
  8095                                  
  8096 00003697 A1[1600]                 mov ax, [maxco1]
  8097 0000369A 3B06[1400]               cmp ax, [maxco]
  8098 0000369E 0F8E0600                 jle .dofunc443
  8099 000036A2 A1[1600]                 mov ax, [maxco1]
  8100 000036A5 A3[1400]                 mov word [maxco], ax
  8101                                  
  8102                                  ;-997   prs("\nENDP");
  8103                                  
  8104                                  .dofunc443:
  8105 000036A8 68[1237]                 push dofunc_9
  8106 000036AB E831CD                   call prs
  8107 000036AE 83C402                   add  sp, 2
  8108                                  
  8109                                  ;-998 }
  8110                                  
  8111                                  
  8112                                  ;-999 
  8113                                  
  8114                                  
  8115                                  ;-1000 char doglobName[IDLENMAX];
  8116 000036B1 C9                       LEAVE
  8117 000036B2 C3                       ret
  8118 000036B3 46756E6374696F6E20-     dofunc_0 db "Function already defined",0
  8119 000036BC 616C72656164792064-
  8120 000036C5 6566696E656400     
  8121 000036CC 46756E6374696F6E20-     dofunc_1 db "Function table full",0
  8122 000036D5 7461626C652066756C-
  8123 000036DE 6C00               
  8124 000036E0 5C6E5C6E00              dofunc_2 db "\n\n",0
  8125 000036E5 3A2050524F4300          dofunc_3 db ": PROC",0
  8126 000036EC 3B5C6E20454E544552-     dofunc_4 db ";\n ENTER  ",0
  8127 000036F5 202000             
  8128 000036F8 2C3000                  dofunc_5 db ",0",0
  8129 000036FB 5C6E202E7265746E00      dofunc_6 db "\n .retn",0
  8130 00003704 204C4541564500          dofunc_7 db " LEAVE",0
  8131 0000370B 5C6E2072657400          dofunc_8 db "\n ret",0
  8132 00003712 5C6E454E445000          dofunc_9 db "\nENDP",0
  8133                                  ENDP
  8134                                  section .bss
  8135                                  absolute 41799
  8136 0000A347 <res 0000000F>          doglobName resb 15
  8137                                  section .text
  8138                                  
  8139                                  ;-1001 int doglob() {
  8140                                  
  8141                                  
  8142                                  doglob: PROC
  8143                                  
  8144                                  ;-1002     int i; int j; int isstrarr; isstrarr=0;
  8145                                  ;
  8146 00003719 C8060000                 ENTER  6,0
  8147 0000371D B80000                   mov ax, 0
  8148 00003720 8946FA                   mov [bp-6], ax
  8149                                  
  8150                                  ;-1003   if (GTop >= LSTART) error1("Global table full");
  8151                                  
  8152 00003723 A1[3800]                 mov ax, [GTop]
  8153 00003726 3DC800                   cmp ax, 200 ;unsigned : 1
  8154 00003729 0F8C0900                 jl  .doglob444
  8155 0000372D 68[563A]                 push doglob_0
  8156 00003730 E868CE                   call error1
  8157 00003733 83C402                   add  sp, 2
  8158                                  
  8159                                  ;-1004   if (iswidth == 0) error1("no VOID as var type");
  8160                                  
  8161                                  .doglob444:
  8162 00003736 A0[3500]                 mov al, [iswidth]
  8163 00003739 3C00                     cmp al, 0
  8164 0000373B 0F850900                 jne .doglob445
  8165 0000373F 68[683A]                 push doglob_1
  8166 00003742 E856CE                   call error1
  8167 00003745 83C402                   add  sp, 2
  8168                                  
  8169                                  ;-1005   checknamelen();
  8170                                  
  8171                                  .doglob445:
  8172 00003748 E86AD8                   call checknamelen
  8173                                  
  8174                                  ;-1006   if (checkName() != 0) error1("Variable already defined");
  8175                                  
  8176 0000374B E8B3D8                   call checkName
  8177 0000374E 3C00                     cmp al, 0
  8178 00003750 0F840900                 je  .doglob446
  8179 00003754 68[7C3A]                 push doglob_2
  8180 00003757 E841CE                   call error1
  8181 0000375A 83C402                   add  sp, 2
  8182                                  
  8183                                  ;-1007   if (istoken('[')) { istype='&';
  8184                                  
  8185                                  .doglob446:
  8186 0000375D 6A5B                     push 91
  8187 0000375F E896D7                   call istoken
  8188 00003762 83C402                   add  sp, 2
  8189 00003765 08C0                     or  al, al
  8190 00003767 0F84E201                 je .doglob447
  8191 0000376B B82600                   mov ax, 38
  8192 0000376E A2[2F00]                 mov byte [istype], al
  8193                                  
  8194                                  ;-1008     if (istoken(T_CONST)) {
  8195                                  
  8196 00003771 680101                   push 257
  8197 00003774 E881D7                   call istoken
  8198 00003777 83C402                   add  sp, 2
  8199 0000377A 08C0                     or  al, al
  8200 0000377C 0F84C200                 je .doglob448
  8201                                  
  8202                                  ;-1009       prs("\nsection .bss\nabsolute ");
  8203                                  
  8204 00003780 68[953A]                 push doglob_3
  8205 00003783 E859CC                   call prs
  8206 00003786 83C402                   add  sp, 2
  8207                                  
  8208                                  ;-1010       prunsign1(orgData);
  8209                                  
  8210 00003789 FF36[1200]               push word [orgData]
  8211 0000378D E8A4CD                   call prunsign1
  8212 00003790 83C402                   add  sp, 2
  8213                                  
  8214                                  ;-1011       prs("\n"); prs(symbol);
  8215                                  
  8216 00003793 68[AF3A]                 push doglob_4
  8217 00003796 E846CC                   call prs
  8218 00003799 83C402                   add  sp, 2
  8219 0000379C 8D06606D                 lea  ax, [symbol]
  8220 000037A0 50                       push ax
  8221 000037A1 E83BCC                   call prs
  8222 000037A4 83C402                   add  sp, 2
  8223                                  
  8224                                  ;-1012       if (iswidth==1) prs(" resb ");
  8225                                  
  8226 000037A7 A0[3500]                 mov al, [iswidth]
  8227 000037AA 3C01                     cmp al, 1
  8228 000037AC 0F850900                 jne .doglob449
  8229 000037B0 68[B23A]                 push doglob_5
  8230 000037B3 E829CC                   call prs
  8231 000037B6 83C402                   add  sp, 2
  8232                                  
  8233                                  ;-1013       if (iswidth==2) prs(" resw ");
  8234                                  
  8235                                  .doglob449:
  8236 000037B9 A0[3500]                 mov al, [iswidth]
  8237 000037BC 3C02                     cmp al, 2
  8238 000037BE 0F850900                 jne .doglob450
  8239 000037C2 68[B93A]                 push doglob_6
  8240 000037C5 E817CC                   call prs
  8241 000037C8 83C402                   add  sp, 2
  8242                                  
  8243                                  ;-1014       if (iswidth==4) prs(" resd ");
  8244                                  
  8245                                  .doglob450:
  8246 000037CB A0[3500]                 mov al, [iswidth]
  8247 000037CE 3C04                     cmp al, 4
  8248 000037D0 0F850900                 jne .doglob451
  8249 000037D4 68[C03A]                 push doglob_7
  8250 000037D7 E805CC                   call prs
  8251 000037DA 83C402                   add  sp, 2
  8252                                  
  8253                                  ;-1015       prunsign1(lexval);
  8254                                  
  8255                                  .doglob451:
  8256 000037DD FF36[2B00]               push word [lexval]
  8257 000037E1 E850CD                   call prunsign1
  8258 000037E4 83C402                   add  sp, 2
  8259                                  
  8260                                  ;-1016       prs("\nsection .text");
  8261                                  
  8262 000037E7 68[C73A]                 push doglob_8
  8263 000037EA E8F2CB                   call prs
  8264 000037ED 83C402                   add  sp, 2
  8265                                  
  8266                                  ;-1017       orgData=orgData+lexval;
  8267                                  
  8268 000037F0 A1[1200]                 mov ax, [orgData]
  8269 000037F3 0306[2B00]               add ax, [lexval]
  8270 000037F7 A3[1200]                 mov word [orgData], ax
  8271                                  
  8272                                  ;-1018       if (iswidth==2) orgData=orgData+lexval;
  8273                                  
  8274 000037FA A0[3500]                 mov al, [iswidth]
  8275 000037FD 3C02                     cmp al, 2
  8276 000037FF 0F850A00                 jne .doglob452
  8277 00003803 A1[1200]                 mov ax, [orgData]
  8278 00003806 0306[2B00]               add ax, [lexval]
  8279 0000380A A3[1200]                 mov word [orgData], ax
  8280                                  
  8281                                  ;-1019       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}
  8282                                  
  8283                                  .doglob452:
  8284 0000380D A0[3500]                 mov al, [iswidth]
  8285 00003810 3C04                     cmp al, 4
  8286 00003812 0F851400                 jne .doglob453
  8287 00003816 A1[2B00]                 mov ax, [lexval]
  8288 00003819 BB0300                   mov bx, 3
  8289 0000381C F7E3                     mul bx
  8290 0000381E 8946FE                   mov [bp-2], ax
  8291 00003821 A1[1200]                 mov ax, [orgData]
  8292 00003824 0346FE                   add ax, [bp-2]
  8293 00003827 A3[1200]                 mov word [orgData], ax
  8294                                  
  8295                                  ;-1020       GData[GTop]=lexval; expect(']');
  8296                                  
  8297                                  .doglob453:
  8298 0000382A A1[2B00]                 mov ax, [lexval]
  8299 0000382D 8B1E[3800]               mov bx, [GTop]
  8300 00003831 D1E3                     shl bx, 1
  8301 00003833 89875973                 mov [GData+bx], ax
  8302 00003837 6A5D                     push 93
  8303 00003839 E8DED6                   call expect
  8304 0000383C 83C402                   add  sp, 2
  8305                                  
  8306                                  ;-1021     }else { expect(']');
  8307                                  
  8308 0000383F E90801                   jmp .doglob454
  8309                                  .doglob448:
  8310 00003842 6A5D                     push 93
  8311 00003844 E8D3D6                   call expect
  8312 00003847 83C402                   add  sp, 2
  8313                                  
  8314                                  ;-1022       if (iswidth != 1) error1("Only ByteArray allowed");
  8315                                  
  8316 0000384A A0[3500]                 mov al, [iswidth]
  8317 0000384D 3C01                     cmp al, 1
  8318 0000384F 0F840900                 je  .doglob455
  8319 00003853 68[D73A]                 push doglob_9
  8320 00003856 E842CD                   call error1
  8321 00003859 83C402                   add  sp, 2
  8322                                  
  8323                                  ;-1023       prs("\n"); prs(symbol); prs(" db ");
  8324                                  
  8325                                  .doglob455:
  8326 0000385C 68[EE3A]                 push doglob_10
  8327 0000385F E87DCB                   call prs
  8328 00003862 83C402                   add  sp, 2
  8329 00003865 8D06606D                 lea  ax, [symbol]
  8330 00003869 50                       push ax
  8331 0000386A E872CB                   call prs
  8332 0000386D 83C402                   add  sp, 2
  8333 00003870 68[F13A]                 push doglob_11
  8334 00003873 E869CB                   call prs
  8335 00003876 83C402                   add  sp, 2
  8336                                  
  8337                                  ;-1024       isstrarr=1; strcpy(doglobName, symbol);
  8338                                  
  8339 00003879 B80100                   mov ax, 1
  8340 0000387C 8946FA                   mov [bp-6], ax
  8341 0000387F 8D06606D                 lea  ax, [symbol]
  8342 00003883 50                       push ax
  8343 00003884 8D0647A3                 lea  ax, [doglobName]
  8344 00003888 50                       push ax
  8345 00003889 E89DC9                   call strcpy
  8346 0000388C 83C404                   add  sp, 4
  8347                                  
  8348                                  ;-1025       expect('=');
  8349                                  
  8350 0000388F 6A3D                     push 61
  8351 00003891 E886D6                   call expect
  8352 00003894 83C402                   add  sp, 2
  8353                                  
  8354                                  ;-1026       if (istoken(T_STRING)) {
  8355                                  
  8356 00003897 680201                   push 258
  8357 0000389A E85BD6                   call istoken
  8358 0000389D 83C402                   add  sp, 2
  8359 000038A0 08C0                     or  al, al
  8360 000038A2 0F844200                 je .doglob456
  8361                                  
  8362                                  ;-1027         prc(34); prscomment(symbol); prc(34); prs(",0");
  8363                                  
  8364 000038A6 6A22                     push 34
  8365 000038A8 E8DBCA                   call prc
  8366 000038AB 83C402                   add  sp, 2
  8367 000038AE 8D06606D                 lea  ax, [symbol]
  8368 000038B2 50                       push ax
  8369 000038B3 E8FBCA                   call prscomment
  8370 000038B6 83C402                   add  sp, 2
  8371 000038B9 6A22                     push 34
  8372 000038BB E8C8CA                   call prc
  8373 000038BE 83C402                   add  sp, 2
  8374 000038C1 68[F63A]                 push doglob_12
  8375 000038C4 E818CB                   call prs
  8376 000038C7 83C402                   add  sp, 2
  8377                                  
  8378                                  ;-1028         i=strlen(symbol); GData[GTop]=i; }
  8379                                  
  8380 000038CA 8D06606D                 lea  ax, [symbol]
  8381 000038CE 50                       push ax
  8382 000038CF E82FC9                   call strlen
  8383 000038D2 83C402                   add  sp, 2
  8384 000038D5 8946FE                   mov [bp-2], ax
  8385 000038D8 8B46FE                   mov ax, [bp-2]
  8386 000038DB 8B1E[3800]               mov bx, [GTop]
  8387 000038DF D1E3                     shl bx, 1
  8388 000038E1 89875973                 mov [GData+bx], ax
  8389                                  
  8390                                  ;-1029       else if (istoken('{' )) { i=0;
  8391                                  
  8392 000038E5 E96200                   jmp .doglob457
  8393                                  .doglob456:
  8394 000038E8 6A7B                     push 123
  8395 000038EA E80BD6                   call istoken
  8396 000038ED 83C402                   add  sp, 2
  8397 000038F0 08C0                     or  al, al
  8398 000038F2 0F844B00                 je .doglob458
  8399 000038F6 B80000                   mov ax, 0
  8400 000038F9 8946FE                   mov [bp-2], ax
  8401                                  
  8402                                  ;-1030         do { if(i) prc(',');
  8403                                  
  8404                                  .doglob459:
  8405 000038FC 8B46FE                   mov ax, [bp-2]
  8406 000038FF 08C0                     or  al, al
  8407 00003901 0F840800                 je .doglob460
  8408 00003905 6A2C                     push 44
  8409 00003907 E87CCA                   call prc
  8410 0000390A 83C402                   add  sp, 2
  8411                                  
  8412                                  ;-1031           expect(T_CONST); prunsign1(lexval); i=1; }
  8413                                  
  8414                                  .doglob460:
  8415 0000390D 680101                   push 257
  8416 00003910 E807D6                   call expect
  8417 00003913 83C402                   add  sp, 2
  8418 00003916 FF36[2B00]               push word [lexval]
  8419 0000391A E817CC                   call prunsign1
  8420 0000391D 83C402                   add  sp, 2
  8421 00003920 B80100                   mov ax, 1
  8422 00003923 8946FE                   mov [bp-2], ax
  8423                                  
  8424                                  ;-1032         while (istoken(',')); expect('}'); }
  8425                                  
  8426 00003926 6A2C                     push 44
  8427 00003928 E8CDD5                   call istoken
  8428 0000392B 83C402                   add  sp, 2
  8429 0000392E 08C0                     or  al, al
  8430 00003930 0F840200                 je .doglob461
  8431 00003934 EBC6                     jmp .doglob459
  8432                                  .doglob461:
  8433 00003936 6A7D                     push 125
  8434 00003938 E8DFD5                   call expect
  8435 0000393B 83C402                   add  sp, 2
  8436                                  
  8437                                  ;-1033       else error1("String or number array expected");
  8438                                  
  8439 0000393E E90900                   jmp .doglob462
  8440                                  .doglob458:
  8441 00003941 68[F93A]                 push doglob_13
  8442 00003944 E854CC                   call error1
  8443 00003947 83C402                   add  sp, 2
  8444                                  
  8445                                  ;-1034       };
  8446                                  
  8447                                  .doglob462:
  8448                                  .doglob457:
  8449                                  .doglob454:
  8450                                  
  8451                                  ;-1035   }else { //expect('=');
  8452                                  
  8453 0000394A E99E00                   jmp .doglob463
  8454                                  .doglob447:
  8455                                  
  8456                                  ;-1036     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");
  8457                                  
  8458 0000394D 68[193B]                 push doglob_14
  8459 00003950 E88CCA                   call prs
  8460 00003953 83C402                   add  sp, 2
  8461 00003956 8D06606D                 lea  ax, [symbol]
  8462 0000395A 50                       push ax
  8463 0000395B E881CA                   call prs
  8464 0000395E 83C402                   add  sp, 2
  8465 00003961 A0[2F00]                 mov al, [istype]
  8466 00003964 3C2A                     cmp al, 42
  8467 00003966 0F850C00                 jne .doglob464
  8468 0000396A 68[1C3B]                 push doglob_15
  8469 0000396D E86FCA                   call prs
  8470 00003970 83C402                   add  sp, 2
  8471                                  
  8472                                  ;-1037     else {
  8473                                  
  8474 00003973 E93300                   jmp .doglob465
  8475                                  .doglob464:
  8476                                  
  8477                                  ;-1038       if      (iswidth==1) prs(" db ");
  8478                                  
  8479 00003976 A0[3500]                 mov al, [iswidth]
  8480 00003979 3C01                     cmp al, 1
  8481 0000397B 0F850C00                 jne .doglob466
  8482 0000397F 68[213B]                 push doglob_16
  8483 00003982 E85ACA                   call prs
  8484 00003985 83C402                   add  sp, 2
  8485                                  
  8486                                  ;-1039       else if (iswidth==2) prs(" dw ");
  8487                                  
  8488 00003988 E91E00                   jmp .doglob467
  8489                                  .doglob466:
  8490 0000398B A0[3500]                 mov al, [iswidth]
  8491 0000398E 3C02                     cmp al, 2
  8492 00003990 0F850C00                 jne .doglob468
  8493 00003994 68[263B]                 push doglob_17
  8494 00003997 E845CA                   call prs
  8495 0000399A 83C402                   add  sp, 2
  8496                                  
  8497                                  ;-1040       else                 prs(" dd ");
  8498                                  
  8499 0000399D E90900                   jmp .doglob469
  8500                                  .doglob468:
  8501 000039A0 68[2B3B]                 push doglob_18
  8502 000039A3 E839CA                   call prs
  8503 000039A6 83C402                   add  sp, 2
  8504                                  
  8505                                  ;-1041     }
  8506                                  
  8507                                  .doglob469:
  8508                                  .doglob467:
  8509                                  
  8510                                  ;-1042     if(istoken('-')) prc('-');
  8511                                  
  8512                                  .doglob465:
  8513 000039A9 6A2D                     push 45
  8514 000039AB E84AD5                   call istoken
  8515 000039AE 83C402                   add  sp, 2
  8516 000039B1 08C0                     or  al, al
  8517 000039B3 0F840800                 je .doglob470
  8518 000039B7 6A2D                     push 45
  8519 000039B9 E8CAC9                   call prc
  8520 000039BC 83C402                   add  sp, 2
  8521                                  
  8522                                  ;-1043     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }
  8523                                  
  8524                                  .doglob470:
  8525 000039BF 6A3D                     push 61
  8526 000039C1 E834D5                   call istoken
  8527 000039C4 83C402                   add  sp, 2
  8528 000039C7 08C0                     or  al, al
  8529 000039C9 0F841600                 je .doglob471
  8530 000039CD 680101                   push 257
  8531 000039D0 E847D5                   call expect
  8532 000039D3 83C402                   add  sp, 2
  8533 000039D6 FF36[2B00]               push word [lexval]
  8534 000039DA E857CB                   call prunsign1
  8535 000039DD 83C402                   add  sp, 2
  8536                                  
  8537                                  ;-1044     else prunsign1(0); }
  8538                                  
  8539 000039E0 E90800                   jmp .doglob472
  8540                                  .doglob471:
  8541 000039E3 6A00                     push 0
  8542 000039E5 E84CCB                   call prunsign1
  8543 000039E8 83C402                   add  sp, 2
  8544                                  .doglob472:
  8545                                  
  8546                                  ;-1045   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;
  8547                                  
  8548                                  .doglob463:
  8549 000039EB A0[3200]                 mov al, [issign]
  8550 000039EE 8B1E[3800]               mov bx, [GTop]
  8551 000039F2 88873970                 mov [GSign+bx], al
  8552 000039F6 A0[3500]                 mov al, [iswidth]
  8553 000039F9 8B1E[3800]               mov bx, [GTop]
  8554 000039FD 8887C971                 mov [GWidth+bx], al
  8555 00003A01 A0[2F00]                 mov al, [istype]
  8556 00003A04 8B1E[3800]               mov bx, [GTop]
  8557 00003A08 8887A96E                 mov [GType+bx], al
  8558                                  
  8559                                  ;-1046   pt=adrF(GNameField, GTop);
  8560                                  
  8561 00003A0C FF36[3800]               push word [GTop]
  8562 00003A10 8D067976                 lea  ax, [GNameField]
  8563 00003A14 50                       push ax
  8564 00003A15 E87DCD                   call adrF
  8565 00003A18 83C404                   add  sp, 4
  8566 00003A1B A3[4200]                 mov word [pt], ax
  8567                                  
  8568                                  ;-1047   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);
  8569                                  
  8570 00003A1E 8B46FA                   mov ax, [bp-6]
  8571 00003A21 08C0                     or  al, al
  8572 00003A23 0F841200                 je .doglob473
  8573 00003A27 8D0647A3                 lea  ax, [doglobName]
  8574 00003A2B 50                       push ax
  8575 00003A2C FF36[4200]               push word [pt]
  8576 00003A30 E8F6C7                   call strcpy
  8577 00003A33 83C404                   add  sp, 4
  8578 00003A36 E90F00                   jmp .doglob474
  8579                                  .doglob473:
  8580 00003A39 8D06606D                 lea  ax, [symbol]
  8581 00003A3D 50                       push ax
  8582 00003A3E FF36[4200]               push word [pt]
  8583 00003A42 E8E4C7                   call strcpy
  8584 00003A45 83C404                   add  sp, 4
  8585                                  
  8586                                  ;-1048   GTop++; expect(';'); }
  8587                                  
  8588                                  .doglob474:
  8589 00003A48 FF06[3800]               inc  word[GTop]
  8590 00003A4C 6A3B                     push 59
  8591 00003A4E E8C9D4                   call expect
  8592 00003A51 83C402                   add  sp, 2
  8593                                  
  8594                                  ;-1049 
  8595                                  
  8596                                  
  8597                                  ;-1050 
  8598                                  
  8599                                  
  8600                                  ;-1051 int dodefine() {
  8601 00003A54 C9                       LEAVE
  8602 00003A55 C3                       ret
  8603 00003A56 476C6F62616C207461-     doglob_0 db "Global table full",0
  8604 00003A5F 626C652066756C6C00 
  8605 00003A68 6E6F20564F49442061-     doglob_1 db "no VOID as var type",0
  8606 00003A71 732076617220747970-
  8607 00003A7A 6500               
  8608 00003A7C 5661726961626C6520-     doglob_2 db "Variable already defined",0
  8609 00003A85 616C72656164792064-
  8610 00003A8E 6566696E656400     
  8611 00003A95 5C6E73656374696F6E-     doglob_3 db "\nsection .bss\nabsolute ",0
  8612 00003A9E 202E6273735C6E6162-
  8613 00003AA7 736F6C7574652000   
  8614 00003AAF 5C6E00                  doglob_4 db "\n",0
  8615 00003AB2 20726573622000          doglob_5 db " resb ",0
  8616 00003AB9 20726573772000          doglob_6 db " resw ",0
  8617 00003AC0 20726573642000          doglob_7 db " resd ",0
  8618 00003AC7 5C6E73656374696F6E-     doglob_8 db "\nsection .text",0
  8619 00003AD0 202E7465787400     
  8620 00003AD7 4F6E6C792042797465-     doglob_9 db "Only ByteArray allowed",0
  8621 00003AE0 417272617920616C6C-
  8622 00003AE9 6F77656400         
  8623 00003AEE 5C6E00                  doglob_10 db "\n",0
  8624 00003AF1 2064622000              doglob_11 db " db ",0
  8625 00003AF6 2C3000                  doglob_12 db ",0",0
  8626 00003AF9 537472696E67206F72-     doglob_13 db "String or number array expected",0
  8627 00003B02 206E756D6265722061-
  8628 00003B0B 727261792065787065-
  8629 00003B14 6374656400         
  8630 00003B19 5C6E00                  doglob_14 db "\n",0
  8631 00003B1C 2064772000              doglob_15 db " dw ",0
  8632 00003B21 2064622000              doglob_16 db " db ",0
  8633 00003B26 2064772000              doglob_17 db " dw ",0
  8634 00003B2B 2064642000              doglob_18 db " dd ",0
  8635                                  ENDP
  8636                                  
  8637                                  dodefine: PROC
  8638                                  
  8639                                  ;-1052     int i; int j; int fdtemp;
  8640                                  
  8641                                  
  8642                                  ;-1053     if (eqstr(symbol, "ORGDATA")) {
  8643                                  ;
  8644 00003B30 C8060000                 ENTER  6,0
  8645 00003B34 68[023C]                 push dodefine_0
  8646 00003B37 8D06606D                 lea  ax, [symbol]
  8647 00003B3B 50                       push ax
  8648 00003B3C E820C7                   call eqstr
  8649 00003B3F 83C404                   add  sp, 4
  8650 00003B42 08C0                     or  al, al
  8651 00003B44 0F841500                 je .dodefine475
  8652                                  
  8653                                  ;-1054         token=getlex();
  8654                                  
  8655 00003B48 E8FBCC                   call getlex
  8656 00003B4B A3[1E00]                 mov word [token], ax
  8657                                  
  8658                                  ;-1055         ORGDATAORIG=lexval;
  8659                                  
  8660 00003B4E A1[2B00]                 mov ax, [lexval]
  8661 00003B51 A3[1000]                 mov word [ORGDATAORIG], ax
  8662                                  
  8663                                  ;-1056         orgData=lexval;
  8664                                  
  8665 00003B54 A1[2B00]                 mov ax, [lexval]
  8666 00003B57 A3[1200]                 mov word [orgData], ax
  8667                                  
  8668                                  ;-1057         return;
  8669                                  
  8670 00003B5A E9A300                   jmp .retndodefine
  8671                                  
  8672                                  ;-1058     }
  8673                                  
  8674                                  
  8675                                  ;-1059     expect(T_NAME);
  8676                                  
  8677                                  .dodefine475:
  8678 00003B5D 680001                   push 256
  8679 00003B60 E8B7D3                   call expect
  8680 00003B63 83C402                   add  sp, 2
  8681                                  
  8682                                  ;-1060     if (token==T_CONST) {
  8683                                  
  8684 00003B66 A1[1E00]                 mov ax, [token]
  8685 00003B69 3D0101                   cmp ax, 257
  8686 00003B6C 0F859000                 jne .dodefine476
  8687                                  
  8688                                  ;-1061         if (GTop >= LSTART) error1("global table (define) full");
  8689                                  
  8690 00003B70 A1[3800]                 mov ax, [GTop]
  8691 00003B73 3DC800                   cmp ax, 200 ;unsigned : 1
  8692 00003B76 0F8C0900                 jl  .dodefine477
  8693 00003B7A 68[0A3C]                 push dodefine_1
  8694 00003B7D E81BCA                   call error1
  8695 00003B80 83C402                   add  sp, 2
  8696                                  
  8697                                  ;-1062         i=strlen(symbol);
  8698                                  
  8699                                  .dodefine477:
  8700 00003B83 8D06606D                 lea  ax, [symbol]
  8701 00003B87 50                       push ax
  8702 00003B88 E876C6                   call strlen
  8703 00003B8B 83C402                   add  sp, 2
  8704 00003B8E 8946FE                   mov [bp-2], ax
  8705                                  
  8706                                  ;-1063         if (i>15) error1("Define name longer 15 char");
  8707                                  
  8708 00003B91 8B46FE                   mov ax, [bp-2]
  8709 00003B94 83F80F                   cmp ax, 15
  8710 00003B97 0F8E0900                 jle .dodefine478
  8711 00003B9B 68[253C]                 push dodefine_2
  8712 00003B9E E8FAC9                   call error1
  8713 00003BA1 83C402                   add  sp, 2
  8714                                  
  8715                                  ;-1064         GSign [GTop]='U';
  8716                                  
  8717                                  .dodefine478:
  8718 00003BA4 B85500                   mov ax, 85
  8719 00003BA7 8B1E[3800]               mov bx, [GTop]
  8720 00003BAB 88873970                 mov [GSign+bx], al
  8721                                  
  8722                                  ;-1065         GWidth[GTop]=1;
  8723                                  
  8724 00003BAF B80100                   mov ax, 1
  8725 00003BB2 8B1E[3800]               mov bx, [GTop]
  8726 00003BB6 8887C971                 mov [GWidth+bx], al
  8727                                  
  8728                                  ;-1066         GType [GTop]='#';
  8729                                  
  8730 00003BBA B82300                   mov ax, 35
  8731 00003BBD 8B1E[3800]               mov bx, [GTop]
  8732 00003BC1 8887A96E                 mov [GType+bx], al
  8733                                  
  8734                                  ;-1067         pt=adrF(GNameField, GTop);
  8735                                  
  8736 00003BC5 FF36[3800]               push word [GTop]
  8737 00003BC9 8D067976                 lea  ax, [GNameField]
  8738 00003BCD 50                       push ax
  8739 00003BCE E8C4CB                   call adrF
  8740 00003BD1 83C404                   add  sp, 4
  8741 00003BD4 A3[4200]                 mov word [pt], ax
  8742                                  
  8743                                  ;-1068         strcpy(pt, symbol);
  8744                                  
  8745 00003BD7 8D06606D                 lea  ax, [symbol]
  8746 00003BDB 50                       push ax
  8747 00003BDC FF36[4200]               push word [pt]
  8748 00003BE0 E846C6                   call strcpy
  8749 00003BE3 83C404                   add  sp, 4
  8750                                  
  8751                                  ;-1069         GData[GTop]=lexval;
  8752                                  
  8753 00003BE6 A1[2B00]                 mov ax, [lexval]
  8754 00003BE9 8B1E[3800]               mov bx, [GTop]
  8755 00003BED D1E3                     shl bx, 1
  8756 00003BEF 89875973                 mov [GData+bx], ax
  8757                                  
  8758                                  ;-1070         expect(T_CONST);
  8759                                  
  8760 00003BF3 680101                   push 257
  8761 00003BF6 E821D3                   call expect
  8762 00003BF9 83C402                   add  sp, 2
  8763                                  
  8764                                  ;-1071         GTop++;
  8765                                  
  8766 00003BFC FF06[3800]               inc  word[GTop]
  8767                                  
  8768                                  ;-1072     }
  8769                                  
  8770                                  
  8771                                  ;-1073 }
  8772                                  
  8773                                  .dodefine476:
  8774                                  
  8775                                  ;-1074 
  8776                                  
  8777                                  
  8778                                  ;-1075 int parse() {
  8779                                  
  8780 00003C00 C9                       .retndodefine: LEAVE
  8781 00003C01 C3                       ret
  8782 00003C02 4F52474441544100        dodefine_0 db "ORGDATA",0
  8783 00003C0A 676C6F62616C207461-     dodefine_1 db "global table (define) full",0
  8784 00003C13 626C65202864656669-
  8785 00003C1C 6E65292066756C6C00 
  8786 00003C25 446566696E65206E61-     dodefine_2 db "Define name longer 15 char",0
  8787 00003C2E 6D65206C6F6E676572-
  8788 00003C37 203135206368617200 
  8789                                  ENDP
  8790                                  
  8791                                  parse: PROC
  8792                                  
  8793                                  ;-1076     token=getlex();
  8794                                  
  8795 00003C40 E803CC                   call getlex
  8796 00003C43 A3[1E00]                 mov word [token], ax
  8797                                  
  8798                                  ;-1077     do {
  8799                                  
  8800                                  .parse479:
  8801                                  
  8802                                  ;-1078         if (token <= 0) return 1;
  8803                                  
  8804 00003C46 A1[1E00]                 mov ax, [token]
  8805 00003C49 83F800                   cmp ax, 0
  8806 00003C4C 0F8F0600                 jg  .parse480
  8807 00003C50 B80100                   mov ax, 1
  8808 00003C53 E95000                   jmp .retnparse
  8809                                  
  8810                                  ;-1079         if (istoken('#')) {
  8811                                  
  8812                                  .parse480:
  8813 00003C56 6A23                     push 35
  8814 00003C58 E89DD2                   call istoken
  8815 00003C5B 83C402                   add  sp, 2
  8816 00003C5E 08C0                     or  al, al
  8817 00003C60 0F842100                 je .parse481
  8818                                  
  8819                                  ;-1080              if (istoken(T_DEFINE))  dodefine();
  8820                                  
  8821 00003C64 68FF01                   push 511
  8822 00003C67 E88ED2                   call istoken
  8823 00003C6A 83C402                   add  sp, 2
  8824 00003C6D 08C0                     or  al, al
  8825 00003C6F 0F840600                 je .parse482
  8826 00003C73 E8BAFE                   call dodefine
  8827                                  
  8828                                  ;-1081              else error1("define expected");
  8829                                  
  8830 00003C76 E90900                   jmp .parse483
  8831                                  .parse482:
  8832 00003C79 68[A73C]                 push parse_0
  8833 00003C7C E81CC9                   call error1
  8834 00003C7F 83C402                   add  sp, 2
  8835                                  
  8836                                  ;-1082         }
  8837                                  
  8838                                  .parse483:
  8839                                  
  8840                                  ;-1083     else{
  8841                                  
  8842 00003C82 E91600                   jmp .parse484
  8843                                  .parse481:
  8844                                  
  8845                                  ;-1084         typeName();
  8846                                  
  8847 00003C85 E865D4                   call typeName
  8848                                  
  8849                                  ;-1085         if (token=='(') dofunc();
  8850                                  
  8851 00003C88 A1[1E00]                 mov ax, [token]
  8852 00003C8B 83F828                   cmp ax, 40
  8853 00003C8E 0F850600                 jne .parse485
  8854 00003C92 E88CF7                   call dofunc
  8855                                  
  8856                                  ;-1086         else doglob(); }
  8857                                  
  8858 00003C95 E90300                   jmp .parse486
  8859                                  .parse485:
  8860 00003C98 E87EFA                   call doglob
  8861                                  .parse486:
  8862                                  
  8863                                  ;-1087     } while(1);
  8864                                  
  8865                                  .parse484:
  8866 00003C9B B80100                   mov ax, 1
  8867 00003C9E 08C0                     or  al, al
  8868 00003CA0 0F840200                 je .parse487
  8869 00003CA4 EBA0                     jmp .parse479
  8870                                  .parse487:
  8871                                  
  8872                                  ;-1088 }
  8873                                  
  8874                                  
  8875                                  ;-1089 
  8876                                  
  8877                                  
  8878                                  ;-1090 char *arglen=0x80; char *argv=0x82;
  8879                                  
  8880                                   .retnparse:
  8881 00003CA6 C3                       ret
  8882 00003CA7 646566696E65206578-     parse_0 db "define expected",0
  8883 00003CB0 70656374656400     
  8884                                  ENDP
  8885 00003CB7 8000                    arglen dw 128
  8886 00003CB9 8200                    argv dw 130
  8887                                  
  8888                                  ;-1091 int main() {
  8889                                  
  8890                                  
  8891                                  main: PROC
  8892                                  
  8893                                  ;-1092     int arglen1; unsigned int i; char *c;
  8894                                  
  8895                                  
  8896                                  ;-1093     arglen1=*arglen;
  8897                                  ;
  8898 00003CBB C8060000                 ENTER  6,0
  8899 00003CBF 8B1E[B73C]               mov bx, [arglen]
  8900 00003CC3 8A07                     mov al, [bx]
  8901 00003CC5 B400                     mov ah, 0
  8902 00003CC7 8946FE                   mov [bp-2], ax
  8903                                  
  8904                                  ;-1094     if (arglen1 == 0) {
  8905                                  
  8906 00003CCA 8B46FE                   mov ax, [bp-2]
  8907 00003CCD 83F800                   cmp ax, 0
  8908 00003CD0 0F851C00                 jne .main488
  8909                                  
  8910                                  ;-1095         cputs(Version1);
  8911                                  
  8912 00003CD4 8D06[0300]               lea  ax, [Version1]
  8913 00003CD8 50                       push ax
  8914 00003CD9 E897C3                   call cputs
  8915 00003CDC 83C402                   add  sp, 2
  8916                                  
  8917                                  ;-1096         cputs(" Usage: A.COM in_file[.C]: ");
  8918                                  
  8919 00003CDF 68[533F]                 push main_0
  8920 00003CE2 E88EC3                   call cputs
  8921 00003CE5 83C402                   add  sp, 2
  8922                                  
  8923                                  ;-1097         exitR(3);
  8924                                  
  8925 00003CE8 6A03                     push 3
  8926 00003CEA E8F8C3                   call exitR
  8927 00003CED 83C402                   add  sp, 2
  8928                                  
  8929                                  ;-1098         }
  8930                                  
  8931                                  
  8932                                  ;-1099     i=arglen1+129;
  8933                                  
  8934                                  .main488:
  8935 00003CF0 8B46FE                   mov ax, [bp-2]
  8936 00003CF3 058100                   add ax, 129
  8937 00003CF6 8946FC                   mov [bp-4], ax
  8938                                  
  8939                                  ;-1100     *i=0;
  8940                                  
  8941 00003CF9 B80000                   mov ax, 0
  8942 00003CFC 8B5EFC                   mov  bx, [bp-4]
  8943 00003CFF 8907                     mov  [bx], ax
  8944                                  
  8945                                  ;-1101     arglen1--;
  8946                                  
  8947 00003D01 FF4EFE                   dec  word[bp-2]
  8948                                  
  8949                                  ;-1102     toupper(argv);
  8950                                  
  8951 00003D04 FF36[B93C]               push word [argv]
  8952 00003D08 E8C5C5                   call toupper
  8953 00003D0B 83C402                   add  sp, 2
  8954                                  
  8955                                  ;-1103     strcpy(namein, argv);
  8956                                  
  8957 00003D0E FF36[B93C]               push word [argv]
  8958 00003D12 8D06236E                 lea  ax, [namein]
  8959 00003D16 50                       push ax
  8960 00003D17 E80FC5                   call strcpy
  8961 00003D1A 83C404                   add  sp, 4
  8962                                  
  8963                                  ;-1104     if (instr1(namein, '.') == 0) strcat1(namein, ".C");
  8964                                  
  8965 00003D1D 6A2E                     push 46
  8966 00003D1F 8D06236E                 lea  ax, [namein]
  8967 00003D23 50                       push ax
  8968 00003D24 E8ECC5                   call instr1
  8969 00003D27 83C404                   add  sp, 4
  8970 00003D2A 83F800                   cmp ax, 0
  8971 00003D2D 0F850E00                 jne .main489
  8972 00003D31 68[6F3F]                 push main_1
  8973 00003D34 8D06236E                 lea  ax, [namein]
  8974 00003D38 50                       push ax
  8975 00003D39 E86FC5                   call strcat1
  8976 00003D3C 83C404                   add  sp, 4
  8977                                  
  8978                                  ;-1105     strcpy(namelst, namein);
  8979                                  
  8980                                  .main489:
  8981 00003D3F 8D06236E                 lea  ax, [namein]
  8982 00003D43 50                       push ax
  8983 00003D44 8D06666E                 lea  ax, [namelst]
  8984 00003D48 50                       push ax
  8985 00003D49 E8DDC4                   call strcpy
  8986 00003D4C 83C404                   add  sp, 4
  8987                                  
  8988                                  ;-1106     i=strlen(namelst);
  8989                                  
  8990 00003D4F 8D06666E                 lea  ax, [namelst]
  8991 00003D53 50                       push ax
  8992 00003D54 E8AAC4                   call strlen
  8993 00003D57 83C402                   add  sp, 2
  8994 00003D5A 8946FC                   mov [bp-4], ax
  8995                                  
  8996                                  ;-1107     i--;
  8997                                  
  8998 00003D5D FF4EFC                   dec  word[bp-4]
  8999                                  
  9000                                  ;-1108     c=&namelst+i;
  9001                                  
  9002 00003D60 B8666E                   mov ax, namelst
  9003 00003D63 0346FC                   add ax, [bp-4]
  9004 00003D66 8946FA                   mov [bp-6], ax
  9005                                  
  9006                                  ;-1109     *c='S';
  9007                                  
  9008 00003D69 B85300                   mov ax, 83
  9009 00003D6C 8B5EFA                   mov  bx, [bp-6]
  9010 00003D6F 8807                     mov  [bx], al
  9011                                  
  9012                                  ;-1110 
  9013                                  
  9014                                  
  9015                                  ;-1111     fdin=openR (namein);
  9016                                  
  9017 00003D71 8D06236E                 lea  ax, [namein]
  9018 00003D75 50                       push ax
  9019 00003D76 E83CC3                   call openR
  9020 00003D79 83C402                   add  sp, 2
  9021 00003D7C A3[1A00]                 mov word [fdin], ax
  9022                                  
  9023                                  ;-1112     if(DOS_ERR){
  9024                                  
  9025 00003D7F A1[4600]                 mov ax, [DOS_ERR]
  9026 00003D82 08C0                     or  al, al
  9027 00003D84 0F841C00                 je .main490
  9028                                  
  9029                                  ;-1113         cputs("Source file missing (.C): ");
  9030                                  
  9031 00003D88 68[723F]                 push main_2
  9032 00003D8B E8E5C2                   call cputs
  9033 00003D8E 83C402                   add  sp, 2
  9034                                  
  9035                                  ;-1114         cputs(namein);
  9036                                  
  9037 00003D91 8D06236E                 lea  ax, [namein]
  9038 00003D95 50                       push ax
  9039 00003D96 E8DAC2                   call cputs
  9040 00003D99 83C402                   add  sp, 2
  9041                                  
  9042                                  ;-1115         exitR(1);
  9043                                  
  9044 00003D9C 6A01                     push 1
  9045 00003D9E E844C3                   call exitR
  9046 00003DA1 83C402                   add  sp, 2
  9047                                  
  9048                                  ;-1116         }
  9049                                  
  9050                                  
  9051                                  ;-1117     fdout=creatR(namelst);
  9052                                  
  9053                                  .main490:
  9054 00003DA4 8D06666E                 lea  ax, [namelst]
  9055 00003DA8 50                       push ax
  9056 00003DA9 E818C3                   call creatR
  9057 00003DAC 83C402                   add  sp, 2
  9058 00003DAF A3[1C00]                 mov word [fdout], ax
  9059                                  
  9060                                  ;-1118     if(DOS_ERR){
  9061                                  
  9062 00003DB2 A1[4600]                 mov ax, [DOS_ERR]
  9063 00003DB5 08C0                     or  al, al
  9064 00003DB7 0F841C00                 je .main491
  9065                                  
  9066                                  ;-1119         cputs("list file not creatable: ");
  9067                                  
  9068 00003DBB 68[8D3F]                 push main_3
  9069 00003DBE E8B2C2                   call cputs
  9070 00003DC1 83C402                   add  sp, 2
  9071                                  
  9072                                  ;-1120         cputs(namelst);
  9073                                  
  9074 00003DC4 8D06666E                 lea  ax, [namelst]
  9075 00003DC8 50                       push ax
  9076 00003DC9 E8A7C2                   call cputs
  9077 00003DCC 83C402                   add  sp, 2
  9078                                  
  9079                                  ;-1121         exitR(2);
  9080                                  
  9081 00003DCF 6A02                     push 2
  9082 00003DD1 E811C3                   call exitR
  9083 00003DD4 83C402                   add  sp, 2
  9084                                  
  9085                                  ;-1122         }
  9086                                  
  9087                                  
  9088                                  ;-1123     prs("\n; ");
  9089                                  
  9090                                  .main491:
  9091 00003DD7 68[A73F]                 push main_4
  9092 00003DDA E802C6                   call prs
  9093 00003DDD 83C402                   add  sp, 2
  9094                                  
  9095                                  ;-1124     prs(Version1);
  9096                                  
  9097 00003DE0 8D06[0300]               lea  ax, [Version1]
  9098 00003DE4 50                       push ax
  9099 00003DE5 E8F7C5                   call prs
  9100 00003DE8 83C402                   add  sp, 2
  9101                                  
  9102                                  ;-1125     prs(", Source: "); prs(namein);
  9103                                  
  9104 00003DEB 68[AC3F]                 push main_5
  9105 00003DEE E8EEC5                   call prs
  9106 00003DF1 83C402                   add  sp, 2
  9107 00003DF4 8D06236E                 lea  ax, [namein]
  9108 00003DF8 50                       push ax
  9109 00003DF9 E8E3C5                   call prs
  9110 00003DFC 83C402                   add  sp, 2
  9111                                  
  9112                                  ;-1126     prs(", Output asm: "); prs(namelst);
  9113                                  
  9114 00003DFF 68[B73F]                 push main_6
  9115 00003E02 E8DAC5                   call prs
  9116 00003E05 83C402                   add  sp, 2
  9117 00003E08 8D06666E                 lea  ax, [namelst]
  9118 00003E0C 50                       push ax
  9119 00003E0D E8CFC5                   call prs
  9120 00003E10 83C402                   add  sp, 2
  9121                                  
  9122                                  ;-1127     prs("\norg  256 \njmp main");
  9123                                  
  9124 00003E13 68[C63F]                 push main_7
  9125 00003E16 E8C6C5                   call prs
  9126 00003E19 83C402                   add  sp, 2
  9127                                  
  9128                                  ;-1128     orgData=ORGDATAORIG;
  9129                                  
  9130 00003E1C A1[1000]                 mov ax, [ORGDATAORIG]
  9131 00003E1F A3[1200]                 mov word [orgData], ax
  9132                                  
  9133                                  ;-1129     fgetsp=&fgetsdest;
  9134                                  
  9135 00003E22 B839A2                   mov ax, fgetsdest
  9136 00003E25 A3[3E00]                 mov word [fgetsp], ax
  9137                                  
  9138                                  ;-1130     *fgetsp=0;
  9139                                  
  9140 00003E28 B80000                   mov ax, 0
  9141 00003E2B 8B1E[3E00]               mov  bx, [fgetsp]
  9142 00003E2F 8807                     mov  [bx], al
  9143                                  
  9144                                  ;-1131     thechar=fgets1();
  9145                                  
  9146 00003E31 E8F7C8                   call fgets1
  9147 00003E34 A2[2200]                 mov byte [thechar], al
  9148                                  
  9149                                  ;-1132     parse();
  9150                                  
  9151 00003E37 E806FE                   call parse
  9152                                  
  9153                                  ;-1133     prs("\n;Input: "); prs(namein);
  9154                                  
  9155 00003E3A 68[DC3F]                 push main_8
  9156 00003E3D E89FC5                   call prs
  9157 00003E40 83C402                   add  sp, 2
  9158 00003E43 8D06236E                 lea  ax, [namein]
  9159 00003E47 50                       push ax
  9160 00003E48 E894C5                   call prs
  9161 00003E4B 83C402                   add  sp, 2
  9162                                  
  9163                                  ;-1134     prs(", List: ");   prs(namelst);
  9164                                  
  9165 00003E4E 68[E73F]                 push main_9
  9166 00003E51 E88BC5                   call prs
  9167 00003E54 83C402                   add  sp, 2
  9168 00003E57 8D06666E                 lea  ax, [namelst]
  9169 00003E5B 50                       push ax
  9170 00003E5C E880C5                   call prs
  9171 00003E5F 83C402                   add  sp, 2
  9172                                  
  9173                                  ;-1135     prs(", Lines: "); prunsign1(lineno);
  9174                                  
  9175 00003E62 68[F03F]                 push main_10
  9176 00003E65 E877C5                   call prs
  9177 00003E68 83C402                   add  sp, 2
  9178 00003E6B FF36[4000]               push word [lineno]
  9179 00003E6F E8C2C6                   call prunsign1
  9180 00003E72 83C402                   add  sp, 2
  9181                                  
  9182                                  ;-1136     prs("\n;Glob. variables: "); GTop--; prunsign1(GTop);
  9183                                  
  9184 00003E75 68[FA3F]                 push main_11
  9185 00003E78 E864C5                   call prs
  9186 00003E7B 83C402                   add  sp, 2
  9187 00003E7E FF0E[3800]               dec  word[GTop]
  9188 00003E82 FF36[3800]               push word [GTop]
  9189 00003E86 E8ABC6                   call prunsign1
  9190 00003E89 83C402                   add  sp, 2
  9191                                  
  9192                                  ;-1137     prs(" ("); prunsign1(LSTART);
  9193                                  
  9194 00003E8C 68[0F40]                 push main_12
  9195 00003E8F E84DC5                   call prs
  9196 00003E92 83C402                   add  sp, 2
  9197 00003E95 68C800                   push 200
  9198 00003E98 E899C6                   call prunsign1
  9199 00003E9B 83C402                   add  sp, 2
  9200                                  
  9201                                  ;-1138     prs("), Functions: "); prunsign1(FTop);
  9202                                  
  9203 00003E9E 68[1240]                 push main_13
  9204 00003EA1 E83BC5                   call prs
  9205 00003EA4 83C402                   add  sp, 2
  9206 00003EA7 FF36[3C00]               push word [FTop]
  9207 00003EAB E886C6                   call prunsign1
  9208 00003EAE 83C402                   add  sp, 2
  9209                                  
  9210                                  ;-1139     prs(" ("); prunsign1(FUNCMAX);
  9211                                  
  9212 00003EB1 68[2140]                 push main_14
  9213 00003EB4 E828C5                   call prs
  9214 00003EB7 83C402                   add  sp, 2
  9215 00003EBA 682C01                   push 300
  9216 00003EBD E874C6                   call prunsign1
  9217 00003EC0 83C402                   add  sp, 2
  9218                                  
  9219                                  ;-1140     prs(")\n;Constant: ");   prunsign1(maxco);
  9220                                  
  9221 00003EC3 68[2440]                 push main_15
  9222 00003EC6 E816C5                   call prs
  9223 00003EC9 83C402                   add  sp, 2
  9224 00003ECC FF36[1400]               push word [maxco]
  9225 00003ED0 E861C6                   call prunsign1
  9226 00003ED3 83C402                   add  sp, 2
  9227                                  
  9228                                  ;-1141     prs(" ("); prunsign1(COMAX);
  9229                                  
  9230 00003ED6 68[3340]                 push main_16
  9231 00003ED9 E803C5                   call prs
  9232 00003EDC 83C402                   add  sp, 2
  9233 00003EDF 68B80B                   push 3000
  9234 00003EE2 E84FC6                   call prunsign1
  9235 00003EE5 83C402                   add  sp, 2
  9236                                  
  9237                                  ;-1142     i=COMAX; i=i-maxco;
  9238                                  
  9239 00003EE8 B8B80B                   mov ax, 3000
  9240 00003EEB 8946FC                   mov [bp-4], ax
  9241 00003EEE 8B46FC                   mov ax, [bp-4]
  9242 00003EF1 2B06[1400]               sub ax, [maxco]
  9243 00003EF5 8946FC                   mov [bp-4], ax
  9244                                  
  9245                                  ;-1143     if (i <= 1000)prs("\n *** Warning *** constant area too small");
  9246                                  
  9247 00003EF8 8B46FC                   mov ax, [bp-4]
  9248 00003EFB 3DE803                   cmp ax, 1000
  9249 00003EFE 0F870900                 ja  .main492
  9250 00003F02 68[3640]                 push main_17
  9251 00003F05 E8D7C4                   call prs
  9252 00003F08 83C402                   add  sp, 2
  9253                                  
  9254                                  ;-1144     prs("), stacksize: ");
  9255                                  
  9256                                  .main492:
  9257 00003F0B 68[6140]                 push main_18
  9258 00003F0E E8CEC4                   call prs
  9259 00003F11 83C402                   add  sp, 2
  9260                                  
  9261                                  ;-1145     i=65636; i=i-orgData;
  9262                                  
  9263 00003F14 B86400                   mov ax, 100
  9264 00003F17 8946FC                   mov [bp-4], ax
  9265 00003F1A 8B46FC                   mov ax, [bp-4]
  9266 00003F1D 2B06[1200]               sub ax, [orgData]
  9267 00003F21 8946FC                   mov [bp-4], ax
  9268                                  
  9269                                  ;-1146     prunsign1(i);
  9270                                  
  9271 00003F24 FF76FC                   push word [bp-4]
  9272 00003F27 E80AC6                   call prunsign1
  9273 00003F2A 83C402                   add  sp, 2
  9274                                  
  9275                                  ;-1147     if (i <= 1000) prs("\n *** Warning *** Stack too small");
  9276                                  
  9277 00003F2D 8B46FC                   mov ax, [bp-4]
  9278 00003F30 3DE803                   cmp ax, 1000
  9279 00003F33 0F870900                 ja  .main493
  9280 00003F37 68[7040]                 push main_19
  9281 00003F3A E8A2C4                   call prs
  9282 00003F3D 83C402                   add  sp, 2
  9283                                  
  9284                                  ;-1148     prs("    ");
  9285                                  
  9286                                  .main493:
  9287 00003F40 68[9340]                 push main_20
  9288 00003F43 E899C4                   call prs
  9289 00003F46 83C402                   add  sp, 2
  9290                                  
  9291                                  ;-1149     end1(0);
  9292                                  
  9293 00003F49 6A00                     push 0
  9294 00003F4B E82AC6                   call end1
  9295 00003F4E 83C402                   add  sp, 2
  9296                                  
  9297                                  ;-1150 }
  9298 00003F51 C9                       LEAVE
  9299 00003F52 C3                       ret
  9300 00003F53 2055736167653A2041-     main_0 db " Usage: A.COM in_file[.C]: ",0
  9301 00003F5C 2E434F4D20696E5F66-
  9302 00003F65 696C655B2E435D3A20-
  9303 00003F6E 00                 
  9304 00003F6F 2E4300                  main_1 db ".C",0
  9305 00003F72 536F75726365206669-     main_2 db "Source file missing (.C): ",0
  9306 00003F7B 6C65206D697373696E-
  9307 00003F84 6720282E43293A2000 
  9308 00003F8D 6C6973742066696C65-     main_3 db "list file not creatable: ",0
  9309 00003F96 206E6F742063726561-
  9310 00003F9F 7461626C653A2000   
  9311 00003FA7 5C6E3B2000              main_4 db "\n; ",0
  9312 00003FAC 2C20536F757263653A-     main_5 db ", Source: ",0
  9313 00003FB5 2000               
  9314 00003FB7 2C204F757470757420-     main_6 db ", Output asm: ",0
  9315 00003FC0 61736D3A2000       
  9316 00003FC6 5C6E6F726720203235-     main_7 db "\norg  256 \njmp main",0
  9317 00003FCF 36205C6E6A6D70206D-
  9318 00003FD8 61696E00           
  9319 00003FDC 5C6E3B496E7075743A-     main_8 db "\n;Input: ",0
  9320 00003FE5 2000               
  9321 00003FE7 2C204C6973743A2000      main_9 db ", List: ",0
  9322 00003FF0 2C204C696E65733A20-     main_10 db ", Lines: ",0
  9323 00003FF9 00                 
  9324 00003FFA 5C6E3B476C6F622E20-     main_11 db "\n;Glob. variables: ",0
  9325 00004003 7661726961626C6573-
  9326 0000400C 3A2000             
  9327 0000400F 202800                  main_12 db " (",0
  9328 00004012 292C2046756E637469-     main_13 db "), Functions: ",0
  9329 0000401B 6F6E733A2000       
  9330 00004021 202800                  main_14 db " (",0
  9331 00004024 295C6E3B436F6E7374-     main_15 db ")\n;Constant: ",0
  9332 0000402D 616E743A2000       
  9333 00004033 202800                  main_16 db " (",0
  9334 00004036 5C6E202A2A2A205761-     main_17 db "\n *** Warning *** constant area too small",0
  9335 0000403F 726E696E67202A2A2A-
  9336 00004048 20636F6E7374616E74-
  9337 00004051 206172656120746F6F-
  9338 0000405A 20736D616C6C00     
  9339 00004061 292C20737461636B73-     main_18 db "), stacksize: ",0
  9340 0000406A 697A653A2000       
  9341 00004070 5C6E202A2A2A205761-     main_19 db "\n *** Warning *** Stack too small",0
  9342 00004079 726E696E67202A2A2A-
  9343 00004082 20537461636B20746F-
  9344 0000408B 6F20736D616C6C00   
  9345 00004093 2020202000              main_20 db "    ",0
  9346                                  ENDP
  9347                                  ;Input: A.C, List: A.S, Lines: 1151
  9348                                  ;Glob. variables: 99 (200), Functions: 74 (300)
  9349                                  ;Constant: 688 (3000), stacksize: 23822    
