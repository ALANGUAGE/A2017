     1                                  
     2                                  ; A.COM V0.9.3, Source: A.C, Output asm: A.S
     3                                  org  256 
     4 00000000 E9D83C                  jmp main
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
  1652                                  ;-285         if (col >80) error1("input line longer than 80 char");
  1653                                  
  1654 000006A8 8B46FE                   mov ax, [bp-2]
  1655 000006AB 83F850                   cmp ax, 80
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
  1687 000006D8 68[2307]                 push printinputline_1
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
  1725 00000704 696E707574206C696E-     printinputline_0 db "input line longer than 80 char",0
  1726 0000070D 65206C6F6E67657220-
  1727 00000716 7468616E2038302063-
  1728 0000071F 68617200           
  1729 00000723 5C6E5C6E3B2D00          printinputline_1 db "\n\n;-",0
  1730                                  ENDP
  1731                                  
  1732                                  fgets1: PROC
  1733                                  
  1734                                  ;-298     char c;
  1735                                  
  1736                                  
  1737                                  ;-299     c=*fgetsp;
  1738                                  ;
  1739 0000072A C8020000                 ENTER  2,0
  1740 0000072E 8B1E[3E00]               mov bx, [fgetsp]
  1741 00000732 8A07                     mov al, [bx]
  1742 00000734 B400                     mov ah, 0
  1743 00000736 8846FE                   mov [bp-2], al
  1744                                  
  1745                                  ;-300     if (c==0) {
  1746                                  
  1747 00000739 8A46FE                   mov al, [bp-2]
  1748 0000073C 3C00                     cmp al, 0
  1749 0000073E 0F852A00                 jne .fgets157
  1750                                  
  1751                                  ;-301         printinputline();
  1752                                  
  1753 00000742 E822FF                   call printinputline
  1754                                  
  1755                                  ;-302         if (DOS_NoBytes == 0) return 0;
  1756                                  
  1757 00000745 A1[4800]                 mov ax, [DOS_NoBytes]
  1758 00000748 83F800                   cmp ax, 0
  1759 0000074B 0F850600                 jne .fgets158
  1760 0000074F B80000                   mov ax, 0
  1761 00000752 E92500                   jmp .retnfgets1
  1762                                  
  1763                                  ;-303         fgetsp=&fgetsdest;
  1764                                  
  1765                                  .fgets158:
  1766 00000755 B839A2                   mov ax, fgetsdest
  1767 00000758 A3[3E00]                 mov word [fgetsp], ax
  1768                                  
  1769                                  ;-304         c=*fgetsp;
  1770                                  
  1771 0000075B 8B1E[3E00]               mov bx, [fgetsp]
  1772 0000075F 8A07                     mov al, [bx]
  1773 00000761 B400                     mov ah, 0
  1774 00000763 8846FE                   mov [bp-2], al
  1775                                  
  1776                                  ;-305         column=0;
  1777                                  
  1778 00000766 B80000                   mov ax, 0
  1779 00000769 A3[2000]                 mov word [column], ax
  1780                                  
  1781                                  ;-306     }
  1782                                  
  1783                                  
  1784                                  ;-307     fgetsp++;
  1785                                  
  1786                                  .fgets157:
  1787 0000076C FF06[3E00]               inc  word[fgetsp]
  1788                                  
  1789                                  ;-308     column++;
  1790                                  
  1791 00000770 FF06[2000]               inc  word[column]
  1792                                  
  1793                                  ;-309     return c;
  1794                                  
  1795 00000774 8A46FE                   mov al, [bp-2]
  1796 00000777 E90000                   jmp .retnfgets1
  1797                                  
  1798                                  ;-310 }
  1799                                  
  1800                                  
  1801                                  ;-311 int next() {
  1802                                  
  1803 0000077A C9                       .retnfgets1: LEAVE
  1804 0000077B C3                       ret
  1805                                  ENDP
  1806                                  
  1807                                  next: PROC
  1808                                  
  1809                                  ;-312     char r;
  1810                                  
  1811                                  
  1812                                  ;-313     r = thechar;
  1813                                  ;
  1814 0000077C C8020000                 ENTER  2,0
  1815 00000780 A0[2200]                 mov al, [thechar]
  1816 00000783 8846FE                   mov [bp-2], al
  1817                                  
  1818                                  ;-314     thechar = fgets1();
  1819                                  
  1820 00000786 E8A1FF                   call fgets1
  1821 00000789 A2[2200]                 mov byte [thechar], al
  1822                                  
  1823                                  ;-315     return r;
  1824                                  
  1825 0000078C 8A46FE                   mov al, [bp-2]
  1826 0000078F E90000                   jmp .retnnext
  1827                                  
  1828                                  ;-316 }
  1829                                  
  1830                                  
  1831                                  ;-317 
  1832                                  
  1833                                  
  1834                                  ;-318 int adrF(char *s, unsigned int i) {
  1835                                  
  1836 00000792 C9                       .retnnext: LEAVE
  1837 00000793 C3                       ret
  1838                                  ENDP
  1839                                  
  1840                                  adrF: PROC
  1841                                  
  1842                                  ;-319     i << 4;//*16; IDLENMAX=15!
  1843                                  ;
  1844 00000794 C8000000                 ENTER  0,0
  1845 00000798 8B4606                   mov ax, [bp+6]
  1846 0000079B C1E004                   shl ax, 4
  1847                                  
  1848                                  ;-320     __asm{ add ax, [bp+4]  ; offset s }
  1849                                  
  1850 0000079E 034604                   add ax, [bp+4]  ; offset s 
  1851                                  
  1852                                  ;-321 }
  1853                                  
  1854                                  
  1855                                  ;-322 
  1856                                  
  1857                                  
  1858                                  ;-323 int printName(unsigned int i) {
  1859 000007A1 C9                       LEAVE
  1860 000007A2 C3                       ret
  1861                                  ENDP
  1862                                  
  1863                                  printName: PROC
  1864                                  
  1865                                  ;-324     int j;
  1866                                  
  1867                                  
  1868                                  ;-325     if (i < LSTART) {
  1869                                  ;
  1870 000007A3 C8020000                 ENTER  2,0
  1871 000007A7 8B4604                   mov ax, [bp+4]
  1872 000007AA 3DC800                   cmp ax, 200
  1873 000007AD 0F8D1D00                 jge .printName59
  1874                                  
  1875                                  ;-326         i=adrF(GNameField, i);
  1876                                  
  1877 000007B1 FF7604                   push word [bp+4]
  1878 000007B4 8D067976                 lea  ax, [GNameField]
  1879 000007B8 50                       push ax
  1880 000007B9 E8D8FF                   call adrF
  1881 000007BC 83C404                   add  sp, 4
  1882 000007BF 894604                   mov [bp+4], ax
  1883                                  
  1884                                  ;-327         prs(i);
  1885                                  
  1886 000007C2 FF7604                   push word [bp+4]
  1887 000007C5 E817FC                   call prs
  1888 000007C8 83C402                   add  sp, 2
  1889                                  
  1890                                  ;-328     }
  1891                                  
  1892                                  
  1893                                  ;-329     else {
  1894                                  
  1895 000007CB E93800                   jmp .printName60
  1896                                  .printName59:
  1897                                  
  1898                                  ;-330         prs("[bp");
  1899                                  
  1900 000007CE 68[0808]                 push printName_0
  1901 000007D1 E80BFC                   call prs
  1902 000007D4 83C402                   add  sp, 2
  1903                                  
  1904                                  ;-331         j = GData[i];
  1905                                  
  1906 000007D7 8B5E04                   mov bx, [bp+4]
  1907 000007DA D1E3                     shl bx, 1
  1908 000007DC 8B875973                 mov ax, [GData + bx]
  1909 000007E0 8946FE                   mov [bp-2], ax
  1910                                  
  1911                                  ;-332         if (j>0) prc('+');
  1912                                  
  1913 000007E3 8B46FE                   mov ax, [bp-2]
  1914 000007E6 83F800                   cmp ax, 0
  1915 000007E9 0F8E0800                 jle .printName61
  1916 000007ED 6A2B                     push 43
  1917 000007EF E894FB                   call prc
  1918 000007F2 83C402                   add  sp, 2
  1919                                  
  1920                                  ;-333         pint1(j);
  1921                                  
  1922                                  .printName61:
  1923 000007F5 FF76FE                   push word [bp-2]
  1924 000007F8 E8DBFC                   call pint1
  1925 000007FB 83C402                   add  sp, 2
  1926                                  
  1927                                  ;-334         prc(']');
  1928                                  
  1929 000007FE 6A5D                     push 93
  1930 00000800 E883FB                   call prc
  1931 00000803 83C402                   add  sp, 2
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
  1944 00000806 C9                       LEAVE
  1945 00000807 C3                       ret
  1946 00000808 5B627000                printName_0 db "[bp",0
  1947                                  ENDP
  1948                                  
  1949                                  ifEOL: PROC
  1950                                  
  1951                                  ;-339     if (c == 10) return 1;//LF
  1952                                  ;
  1953 0000080C C8000000                 ENTER  0,0
  1954 00000810 8A4604                   mov al, [bp+4]
  1955 00000813 3C0A                     cmp al, 10
  1956 00000815 0F850600                 jne .ifEOL62
  1957 00000819 B80100                   mov ax, 1
  1958 0000081C E92400                   jmp .retnifEOL
  1959                                  
  1960                                  ;-340     if (c == 13) {//CR
  1961                                  
  1962                                  .ifEOL62:
  1963 0000081F 8A4604                   mov al, [bp+4]
  1964 00000822 3C0D                     cmp al, 13
  1965 00000824 0F851500                 jne .ifEOL63
  1966                                  
  1967                                  ;-341         if (thechar == 10) c=next();
  1968                                  
  1969 00000828 A0[2200]                 mov al, [thechar]
  1970 0000082B 3C0A                     cmp al, 10
  1971 0000082D 0F850600                 jne .ifEOL64
  1972 00000831 E848FF                   call next
  1973 00000834 884604                   mov [bp+4], al
  1974                                  
  1975                                  ;-342         return 1;
  1976                                  
  1977                                  .ifEOL64:
  1978 00000837 B80100                   mov ax, 1
  1979 0000083A E90600                   jmp .retnifEOL
  1980                                  
  1981                                  ;-343     }
  1982                                  
  1983                                  
  1984                                  ;-344     return 0;
  1985                                  
  1986                                  .ifEOL63:
  1987 0000083D B80000                   mov ax, 0
  1988 00000840 E90000                   jmp .retnifEOL
  1989                                  
  1990                                  ;-345 }
  1991                                  
  1992                                  
  1993                                  ;-346 
  1994                                  
  1995                                  
  1996                                  ;-347 char symboltemp[80];
  1997                                  
  1998 00000843 C9                       .retnifEOL: LEAVE
  1999 00000844 C3                       ret
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
  2019 00000845 C8080000                 ENTER  8,0
  2020                                  .g1:
  2021 00000849 E830FF                   call next
  2022 0000084C 8846FE                   mov [bp-2], al
  2023                                  
  2024                                  ;-352     if (c == 0) return 0;
  2025                                  
  2026 0000084F 8A46FE                   mov al, [bp-2]
  2027 00000852 3C00                     cmp al, 0
  2028 00000854 0F850600                 jne .getlex65
  2029 00000858 B80000                   mov ax, 0
  2030 0000085B E90D06                   jmp .retngetlex
  2031                                  
  2032                                  ;-353     if (c <= ' ') goto g1;
  2033                                  
  2034                                  .getlex65:
  2035 0000085E 8A46FE                   mov al, [bp-2]
  2036 00000861 3C20                     cmp al, 32
  2037 00000863 0F8F0200                 jg  .getlex66
  2038 00000867 EBE0                     jmp .g1
  2039                                  
  2040                                  ;-354   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}
  2041                                  
  2042                                  .getlex66:
  2043 00000869 8A46FE                   mov al, [bp-2]
  2044 0000086C 3C3D                     cmp al, 61
  2045 0000086E 0F851200                 jne .getlex67
  2046 00000872 A0[2200]                 mov al, [thechar]
  2047 00000875 3C3D                     cmp al, 61
  2048 00000877 0F850900                 jne .getlex68
  2049 0000087B E8FEFE                   call next
  2050 0000087E B82603                   mov ax, 806
  2051 00000881 E9E705                   jmp .retngetlex
  2052                                  .getlex68:
  2053                                  
  2054                                  ;-355   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}
  2055                                  
  2056                                  .getlex67:
  2057 00000884 8A46FE                   mov al, [bp-2]
  2058 00000887 3C21                     cmp al, 33
  2059 00000889 0F851200                 jne .getlex69
  2060 0000088D A0[2200]                 mov al, [thechar]
  2061 00000890 3C3D                     cmp al, 61
  2062 00000892 0F850900                 jne .getlex70
  2063 00000896 E8E3FE                   call next
  2064 00000899 B82703                   mov ax, 807
  2065 0000089C E9CC05                   jmp .retngetlex
  2066                                  .getlex70:
  2067                                  
  2068                                  ;-356   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}
  2069                                  
  2070                                  .getlex69:
  2071 0000089F 8A46FE                   mov al, [bp-2]
  2072 000008A2 3C3C                     cmp al, 60
  2073 000008A4 0F851200                 jne .getlex71
  2074 000008A8 A0[2200]                 mov al, [thechar]
  2075 000008AB 3C3D                     cmp al, 61
  2076 000008AD 0F850900                 jne .getlex72
  2077 000008B1 E8C8FE                   call next
  2078 000008B4 B83803                   mov ax, 824
  2079 000008B7 E9B105                   jmp .retngetlex
  2080                                  .getlex72:
  2081                                  
  2082                                  ;-357   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}
  2083                                  
  2084                                  .getlex71:
  2085 000008BA 8A46FE                   mov al, [bp-2]
  2086 000008BD 3C3E                     cmp al, 62
  2087 000008BF 0F851200                 jne .getlex73
  2088 000008C3 A0[2200]                 mov al, [thechar]
  2089 000008C6 3C3D                     cmp al, 61
  2090 000008C8 0F850900                 jne .getlex74
  2091 000008CC E8ADFE                   call next
  2092 000008CF B82B03                   mov ax, 811
  2093 000008D2 E99605                   jmp .retngetlex
  2094                                  .getlex74:
  2095                                  
  2096                                  ;-358   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}
  2097                                  
  2098                                  .getlex73:
  2099 000008D5 8A46FE                   mov al, [bp-2]
  2100 000008D8 3C3C                     cmp al, 60
  2101 000008DA 0F851200                 jne .getlex75
  2102 000008DE A0[2200]                 mov al, [thechar]
  2103 000008E1 3C3C                     cmp al, 60
  2104 000008E3 0F850900                 jne .getlex76
  2105 000008E7 E892FE                   call next
  2106 000008EA B8D804                   mov ax, 1240
  2107 000008ED E97B05                   jmp .retngetlex
  2108                                  .getlex76:
  2109                                  
  2110                                  ;-359   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}
  2111                                  
  2112                                  .getlex75:
  2113 000008F0 8A46FE                   mov al, [bp-2]
  2114 000008F3 3C3E                     cmp al, 62
  2115 000008F5 0F851200                 jne .getlex77
  2116 000008F9 A0[2200]                 mov al, [thechar]
  2117 000008FC 3C3E                     cmp al, 62
  2118 000008FE 0F850900                 jne .getlex78
  2119 00000902 E877FE                   call next
  2120 00000905 B8D904                   mov ax, 1241
  2121 00000908 E96005                   jmp .retngetlex
  2122                                  .getlex78:
  2123                                  
  2124                                  ;-360   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}
  2125                                  
  2126                                  .getlex77:
  2127 0000090B 8A46FE                   mov al, [bp-2]
  2128 0000090E 3C2B                     cmp al, 43
  2129 00000910 0F851200                 jne .getlex79
  2130 00000914 A0[2200]                 mov al, [thechar]
  2131 00000917 3C2B                     cmp al, 43
  2132 00000919 0F850900                 jne .getlex80
  2133 0000091D E85CFE                   call next
  2134 00000920 B8C304                   mov ax, 1219
  2135 00000923 E94505                   jmp .retngetlex
  2136                                  .getlex80:
  2137                                  
  2138                                  ;-361   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}
  2139                                  
  2140                                  .getlex79:
  2141 00000926 8A46FE                   mov al, [bp-2]
  2142 00000929 3C2D                     cmp al, 45
  2143 0000092B 0F851200                 jne .getlex81
  2144 0000092F A0[2200]                 mov al, [thechar]
  2145 00000932 3C2D                     cmp al, 45
  2146 00000934 0F850900                 jne .getlex82
  2147 00000938 E841FE                   call next
  2148 0000093B B8C904                   mov ax, 1225
  2149 0000093E E92A05                   jmp .retngetlex
  2150                                  .getlex82:
  2151                                  
  2152                                  ;-362   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}
  2153                                  
  2154                                  .getlex81:
  2155 00000941 8A46FE                   mov al, [bp-2]
  2156 00000944 3C2B                     cmp al, 43
  2157 00000946 0F851200                 jne .getlex83
  2158 0000094A A0[2200]                 mov al, [thechar]
  2159 0000094D 3C3D                     cmp al, 61
  2160 0000094F 0F850900                 jne .getlex84
  2161 00000953 E826FE                   call next
  2162 00000956 B8CE04                   mov ax, 1230
  2163 00000959 E90F05                   jmp .retngetlex
  2164                                  .getlex84:
  2165                                  
  2166                                  ;-363   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}
  2167                                  
  2168                                  .getlex83:
  2169 0000095C 8A46FE                   mov al, [bp-2]
  2170 0000095F 3C2D                     cmp al, 45
  2171 00000961 0F851200                 jne .getlex85
  2172 00000965 A0[2200]                 mov al, [thechar]
  2173 00000968 3C3D                     cmp al, 61
  2174 0000096A 0F850900                 jne .getlex86
  2175 0000096E E80BFE                   call next
  2176 00000971 B8CF04                   mov ax, 1231
  2177 00000974 E9F404                   jmp .retngetlex
  2178                                  .getlex86:
  2179                                  
  2180                                  ;-364   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}
  2181                                  
  2182                                  .getlex85:
  2183 00000977 8A46FE                   mov al, [bp-2]
  2184 0000097A 3C26                     cmp al, 38
  2185 0000097C 0F851200                 jne .getlex87
  2186 00000980 A0[2200]                 mov al, [thechar]
  2187 00000983 3C3D                     cmp al, 61
  2188 00000985 0F850900                 jne .getlex88
  2189 00000989 E8F0FD                   call next
  2190 0000098C B8D204                   mov ax, 1234
  2191 0000098F E9D904                   jmp .retngetlex
  2192                                  .getlex88:
  2193                                  
  2194                                  ;-365   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}
  2195                                  
  2196                                  .getlex87:
  2197 00000992 8A46FE                   mov al, [bp-2]
  2198 00000995 3C7C                     cmp al, 124
  2199 00000997 0F851200                 jne .getlex89
  2200 0000099B A0[2200]                 mov al, [thechar]
  2201 0000099E 3C3D                     cmp al, 61
  2202 000009A0 0F850900                 jne .getlex90
  2203 000009A4 E8D5FD                   call next
  2204 000009A7 B8D304                   mov ax, 1235
  2205 000009AA E9BE04                   jmp .retngetlex
  2206                                  .getlex90:
  2207                                  
  2208                                  ;-366   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}
  2209                                  
  2210                                  .getlex89:
  2211 000009AD 8A46FE                   mov al, [bp-2]
  2212 000009B0 3C2A                     cmp al, 42
  2213 000009B2 0F851200                 jne .getlex91
  2214 000009B6 A0[2200]                 mov al, [thechar]
  2215 000009B9 3C3D                     cmp al, 61
  2216 000009BB 0F850900                 jne .getlex92
  2217 000009BF E8BAFD                   call next
  2218 000009C2 B8D004                   mov ax, 1232
  2219 000009C5 E9A304                   jmp .retngetlex
  2220                                  .getlex92:
  2221                                  
  2222                                  ;-367   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}
  2223                                  
  2224                                  .getlex91:
  2225 000009C8 8A46FE                   mov al, [bp-2]
  2226 000009CB 3C2F                     cmp al, 47
  2227 000009CD 0F851200                 jne .getlex93
  2228 000009D1 A0[2200]                 mov al, [thechar]
  2229 000009D4 3C3D                     cmp al, 61
  2230 000009D6 0F850900                 jne .getlex94
  2231 000009DA E89FFD                   call next
  2232 000009DD B8D104                   mov ax, 1233
  2233 000009E0 E98804                   jmp .retngetlex
  2234                                  .getlex94:
  2235                                  
  2236                                  ;-368   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;
  2237                                  
  2238                                  .getlex93:
  2239 000009E3 8A46FE                   mov al, byte [bp-2]
  2240 000009E6 B400                     mov ah, 0
  2241 000009E8 50                       push ax
  2242 000009E9 68[6D0E]                 push getlex_0
  2243 000009EC E824F9                   call instr1
  2244 000009EF 83C404                   add  sp, 4
  2245 000009F2 08C0                     or  al, al
  2246 000009F4 0F840600                 je .getlex95
  2247 000009F8 8A46FE                   mov al, [bp-2]
  2248 000009FB E96D04                   jmp .retngetlex
  2249                                  
  2250                                  ;-369   if (c == '/') {
  2251                                  
  2252                                  .getlex95:
  2253 000009FE 8A46FE                   mov al, [bp-2]
  2254 00000A01 3C2F                     cmp al, 47
  2255 00000A03 0F852900                 jne .getlex96
  2256                                  
  2257                                  ;-370       if (thechar == '/') {
  2258                                  
  2259 00000A07 A0[2200]                 mov al, [thechar]
  2260 00000A0A 3C2F                     cmp al, 47
  2261 00000A0C 0F852000                 jne .getlex97
  2262                                  
  2263                                  ;-371           do c=next();
  2264                                  
  2265                                  .getlex98:
  2266 00000A10 E869FD                   call next
  2267 00000A13 8846FE                   mov [bp-2], al
  2268                                  
  2269                                  ;-372           while(ifEOL(c)==0) return getlex();
  2270                                  
  2271 00000A16 8A46FE                   mov al, byte [bp-2]
  2272 00000A19 B400                     mov ah, 0
  2273 00000A1B 50                       push ax
  2274 00000A1C E8EDFD                   call ifEOL
  2275 00000A1F 83C402                   add  sp, 2
  2276 00000A22 3C00                     cmp al, 0
  2277 00000A24 0F850200                 jne .getlex99
  2278 00000A28 EBE6                     jmp .getlex98
  2279                                  .getlex99:
  2280 00000A2A E818FE                   call getlex
  2281 00000A2D E93B04                   jmp .retngetlex
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
  2293 00000A30 8A46FE                   mov al, [bp-2]
  2294 00000A33 3C2F                     cmp al, 47
  2295 00000A35 0F853A00                 jne .getlex100
  2296                                  
  2297                                  ;-376       if (thechar == '*') {
  2298                                  
  2299 00000A39 A0[2200]                 mov al, [thechar]
  2300 00000A3C 3C2A                     cmp al, 42
  2301 00000A3E 0F852B00                 jne .getlex101
  2302                                  
  2303                                  ;-377           g2: c=next();
  2304                                  
  2305                                  .g2:
  2306 00000A42 E837FD                   call next
  2307 00000A45 8846FE                   mov [bp-2], al
  2308                                  
  2309                                  ;-378           if (c != '*') goto g2;
  2310                                  
  2311 00000A48 8A46FE                   mov al, [bp-2]
  2312 00000A4B 3C2A                     cmp al, 42
  2313 00000A4D 0F840200                 je  .getlex102
  2314 00000A51 EBEF                     jmp .g2
  2315                                  
  2316                                  ;-379           if (thechar != '/') goto g2;
  2317                                  
  2318                                  .getlex102:
  2319 00000A53 A0[2200]                 mov al, [thechar]
  2320 00000A56 3C2F                     cmp al, 47
  2321 00000A58 0F840200                 je  .getlex103
  2322 00000A5C EBE4                     jmp .g2
  2323                                  
  2324                                  ;-380           c=next();
  2325                                  
  2326                                  .getlex103:
  2327 00000A5E E81BFD                   call next
  2328 00000A61 8846FE                   mov [bp-2], al
  2329                                  
  2330                                  ;-381           return getlex();
  2331                                  
  2332 00000A64 E8DEFD                   call getlex
  2333 00000A67 E90104                   jmp .retngetlex
  2334                                  
  2335                                  ;-382       } else  return '/';
  2336                                  
  2337 00000A6A E90600                   jmp .getlex104
  2338                                  .getlex101:
  2339 00000A6D B82F00                   mov ax, 47
  2340 00000A70 E9F803                   jmp .retngetlex
  2341                                  
  2342                                  ;-383   }
  2343                                  
  2344                                  .getlex104:
  2345                                  
  2346                                  ;-384   if (c == '"') {
  2347                                  
  2348                                  .getlex100:
  2349 00000A73 8A46FE                   mov al, [bp-2]
  2350 00000A76 3C22                     cmp al, 34
  2351 00000A78 0F853600                 jne .getlex105
  2352                                  
  2353                                  ;-385       p=&symbol;
  2354                                  
  2355 00000A7C B8606D                   mov ax, symbol
  2356 00000A7F 8946FC                   mov [bp-4], ax
  2357                                  
  2358                                  ;-386       c=next();
  2359                                  
  2360 00000A82 E8F7FC                   call next
  2361 00000A85 8846FE                   mov [bp-2], al
  2362                                  
  2363                                  ;-387       while (c != '"') {
  2364                                  
  2365                                  .getlex106:
  2366 00000A88 8A46FE                   mov al, [bp-2]
  2367 00000A8B 3C22                     cmp al, 34
  2368 00000A8D 0F841300                 je  .getlex107
  2369                                  
  2370                                  ;-388           *p=c;
  2371                                  
  2372 00000A91 8A46FE                   mov al, [bp-2]
  2373 00000A94 8B5EFC                   mov  bx, [bp-4]
  2374 00000A97 8807                     mov  [bx], al
  2375                                  
  2376                                  ;-389           p++;
  2377                                  
  2378 00000A99 FF46FC                   inc  word[bp-4]
  2379                                  
  2380                                  ;-390           c=next();
  2381                                  
  2382 00000A9C E8DDFC                   call next
  2383 00000A9F 8846FE                   mov [bp-2], al
  2384                                  
  2385                                  ;-391           }
  2386                                  
  2387                                  
  2388                                  ;-392           *p=0;
  2389                                  
  2390 00000AA2 EBE4                     jmp .getlex106
  2391                                  .getlex107:
  2392 00000AA4 B80000                   mov ax, 0
  2393 00000AA7 8B5EFC                   mov  bx, [bp-4]
  2394 00000AAA 8807                     mov  [bx], al
  2395                                  
  2396                                  ;-393       return T_STRING;
  2397                                  
  2398 00000AAC B80201                   mov ax, 258
  2399 00000AAF E9B903                   jmp .retngetlex
  2400                                  
  2401                                  ;-394   }
  2402                                  
  2403                                  
  2404                                  ;-395   if (digit(c)) {
  2405                                  
  2406                                  .getlex105:
  2407 00000AB2 8A46FE                   mov al, byte [bp-2]
  2408 00000AB5 B400                     mov ah, 0
  2409 00000AB7 50                       push ax
  2410 00000AB8 E8E0F6                   call digit
  2411 00000ABB 83C402                   add  sp, 2
  2412 00000ABE 08C0                     or  al, al
  2413 00000AC0 0F84D600                 je .getlex108
  2414                                  
  2415                                  ;-396       lexval=0;
  2416                                  
  2417 00000AC4 B80000                   mov ax, 0
  2418 00000AC7 A3[2B00]                 mov word [lexval], ax
  2419                                  
  2420                                  ;-397       lexval=c-'0'; // lexval=int hi=0, c=char
  2421                                  
  2422 00000ACA 8A46FE                   mov al, [bp-2]
  2423 00000ACD 2C30                     sub al, 48
  2424 00000ACF A3[2B00]                 mov word [lexval], ax
  2425                                  
  2426                                  ;-398       if (thechar=='x') thechar='X';
  2427                                  
  2428 00000AD2 A0[2200]                 mov al, [thechar]
  2429 00000AD5 3C78                     cmp al, 120
  2430 00000AD7 0F850600                 jne .getlex109
  2431 00000ADB B85800                   mov ax, 88
  2432 00000ADE A2[2200]                 mov byte [thechar], al
  2433                                  
  2434                                  ;-399       if (thechar=='X') {
  2435                                  
  2436                                  .getlex109:
  2437 00000AE1 A0[2200]                 mov al, [thechar]
  2438 00000AE4 3C58                     cmp al, 88
  2439 00000AE6 0F856800                 jne .getlex110
  2440                                  
  2441                                  ;-400           next();
  2442                                  
  2443 00000AEA E88FFC                   call next
  2444                                  
  2445                                  ;-401           while(alnum(thechar)) {
  2446                                  
  2447                                  .getlex111:
  2448 00000AED A0[2200]                 mov al, byte [thechar]
  2449 00000AF0 B400                     mov ah, 0
  2450 00000AF2 50                       push ax
  2451 00000AF3 E8CFF6                   call alnum
  2452 00000AF6 83C402                   add  sp, 2
  2453 00000AF9 08C0                     or  al, al
  2454 00000AFB 0F845000                 je .getlex112
  2455                                  
  2456                                  ;-402               c=next();
  2457                                  
  2458 00000AFF E87AFC                   call next
  2459 00000B02 8846FE                   mov [bp-2], al
  2460                                  
  2461                                  ;-403               if(c>96) c=c-39;
  2462                                  
  2463 00000B05 8A46FE                   mov al, [bp-2]
  2464 00000B08 3C60                     cmp al, 96
  2465 00000B0A 0F8E0800                 jle .getlex113
  2466 00000B0E 8A46FE                   mov al, [bp-2]
  2467 00000B11 2C27                     sub al, 39
  2468 00000B13 8846FE                   mov [bp-2], al
  2469                                  
  2470                                  ;-404       	       if (c>64) c=c-7;
  2471                                  
  2472                                  .getlex113:
  2473 00000B16 8A46FE                   mov al, [bp-2]
  2474 00000B19 3C40                     cmp al, 64
  2475 00000B1B 0F8E0800                 jle .getlex114
  2476 00000B1F 8A46FE                   mov al, [bp-2]
  2477 00000B22 2C07                     sub al, 7
  2478 00000B24 8846FE                   mov [bp-2], al
  2479                                  
  2480                                  ;-405                c=c-48;
  2481                                  
  2482                                  .getlex114:
  2483 00000B27 8A46FE                   mov al, [bp-2]
  2484 00000B2A 2C30                     sub al, 48
  2485 00000B2C 8846FE                   mov [bp-2], al
  2486                                  
  2487                                  ;-406                lexval=lexval << 4; // * 16
  2488                                  
  2489 00000B2F A1[2B00]                 mov ax, [lexval]
  2490 00000B32 C1E004                   shl ax, 4
  2491 00000B35 A3[2B00]                 mov word [lexval], ax
  2492                                  
  2493                                  ;-407                i=0;
  2494                                  
  2495 00000B38 B80000                   mov ax, 0
  2496 00000B3B 8946FA                   mov [bp-6], ax
  2497                                  
  2498                                  ;-408                i=c;
  2499                                  
  2500 00000B3E 8A46FE                   mov al, [bp-2]
  2501 00000B41 8946FA                   mov [bp-6], ax
  2502                                  
  2503                                  ;-409                lexval=lexval+i;
  2504                                  
  2505 00000B44 A1[2B00]                 mov ax, [lexval]
  2506 00000B47 0346FA                   add ax, [bp-6]
  2507 00000B4A A3[2B00]                 mov word [lexval], ax
  2508                                  
  2509                                  ;-410            }
  2510                                  
  2511                                  
  2512                                  ;-411        }else {
  2513                                  
  2514 00000B4D EB9E                     jmp .getlex111
  2515                                  .getlex112:
  2516 00000B4F E94200                   jmp .getlex115
  2517                                  .getlex110:
  2518                                  
  2519                                  ;-412            while(digit(thechar)) {
  2520                                  
  2521                                  .getlex116:
  2522 00000B52 A0[2200]                 mov al, byte [thechar]
  2523 00000B55 B400                     mov ah, 0
  2524 00000B57 50                       push ax
  2525 00000B58 E840F6                   call digit
  2526 00000B5B 83C402                   add  sp, 2
  2527 00000B5E 08C0                     or  al, al
  2528 00000B60 0F843000                 je .getlex117
  2529                                  
  2530                                  ;-413                c=next();
  2531                                  
  2532 00000B64 E815FC                   call next
  2533 00000B67 8846FE                   mov [bp-2], al
  2534                                  
  2535                                  ;-414                c=c-48;
  2536                                  
  2537 00000B6A 8A46FE                   mov al, [bp-2]
  2538 00000B6D 2C30                     sub al, 48
  2539 00000B6F 8846FE                   mov [bp-2], al
  2540                                  
  2541                                  ;-415                lexval=lexval*10;
  2542                                  
  2543 00000B72 A1[2B00]                 mov ax, [lexval]
  2544 00000B75 BB0A00                   mov bx, 10
  2545 00000B78 F7E3                     mul bx
  2546 00000B7A A3[2B00]                 mov word [lexval], ax
  2547                                  
  2548                                  ;-416                i=0;
  2549                                  
  2550 00000B7D B80000                   mov ax, 0
  2551 00000B80 8946FA                   mov [bp-6], ax
  2552                                  
  2553                                  ;-417                i=c;
  2554                                  
  2555 00000B83 8A46FE                   mov al, [bp-2]
  2556 00000B86 8946FA                   mov [bp-6], ax
  2557                                  
  2558                                  ;-418                lexval=lexval+i;
  2559                                  
  2560 00000B89 A1[2B00]                 mov ax, [lexval]
  2561 00000B8C 0346FA                   add ax, [bp-6]
  2562 00000B8F A3[2B00]                 mov word [lexval], ax
  2563                                  
  2564                                  ;-419            }
  2565                                  
  2566                                  
  2567                                  ;-420        }
  2568                                  
  2569 00000B92 EBBE                     jmp .getlex116
  2570                                  .getlex117:
  2571                                  
  2572                                  ;-421       return T_CONST;
  2573                                  
  2574                                  .getlex115:
  2575 00000B94 B80101                   mov ax, 257
  2576 00000B97 E9D102                   jmp .retngetlex
  2577                                  
  2578                                  ;-422   }
  2579                                  
  2580                                  
  2581                                  ;-423   if (c==39) {
  2582                                  
  2583                                  .getlex108:
  2584 00000B9A 8A46FE                   mov al, [bp-2]
  2585 00000B9D 3C27                     cmp al, 39
  2586 00000B9F 0F854F00                 jne .getlex118
  2587                                  
  2588                                  ;-424       lexval=next();
  2589                                  
  2590 00000BA3 E8D6FB                   call next
  2591 00000BA6 A3[2B00]                 mov word [lexval], ax
  2592                                  
  2593                                  ;-425       if (lexval==92) {
  2594                                  
  2595 00000BA9 A1[2B00]                 mov ax, [lexval]
  2596 00000BAC 83F85C                   cmp ax, 92
  2597 00000BAF 0F853600                 jne .getlex119
  2598                                  
  2599                                  ;-426           lexval=next();
  2600                                  
  2601 00000BB3 E8C6FB                   call next
  2602 00000BB6 A3[2B00]                 mov word [lexval], ax
  2603                                  
  2604                                  ;-427           if (lexval=='n') lexval=10;
  2605                                  
  2606 00000BB9 A1[2B00]                 mov ax, [lexval]
  2607 00000BBC 83F86E                   cmp ax, 110
  2608 00000BBF 0F850600                 jne .getlex120
  2609 00000BC3 B80A00                   mov ax, 10
  2610 00000BC6 A3[2B00]                 mov word [lexval], ax
  2611                                  
  2612                                  ;-428           if (lexval=='t') lexval= 9;
  2613                                  
  2614                                  .getlex120:
  2615 00000BC9 A1[2B00]                 mov ax, [lexval]
  2616 00000BCC 83F874                   cmp ax, 116
  2617 00000BCF 0F850600                 jne .getlex121
  2618 00000BD3 B80900                   mov ax, 9
  2619 00000BD6 A3[2B00]                 mov word [lexval], ax
  2620                                  
  2621                                  ;-429           if (lexval=='0') lexval= 0;
  2622                                  
  2623                                  .getlex121:
  2624 00000BD9 A1[2B00]                 mov ax, [lexval]
  2625 00000BDC 83F830                   cmp ax, 48
  2626 00000BDF 0F850600                 jne .getlex122
  2627 00000BE3 B80000                   mov ax, 0
  2628 00000BE6 A3[2B00]                 mov word [lexval], ax
  2629                                  
  2630                                  ;-430       }
  2631                                  
  2632                                  .getlex122:
  2633                                  
  2634                                  ;-431       next();
  2635                                  
  2636                                  .getlex119:
  2637 00000BE9 E890FB                   call next
  2638                                  
  2639                                  ;-432       return T_CONST;
  2640                                  
  2641 00000BEC B80101                   mov ax, 257
  2642 00000BEF E97902                   jmp .retngetlex
  2643                                  
  2644                                  ;-433   }
  2645                                  
  2646                                  
  2647                                  ;-434   if (alnum(c)) {
  2648                                  
  2649                                  .getlex118:
  2650 00000BF2 8A46FE                   mov al, byte [bp-2]
  2651 00000BF5 B400                     mov ah, 0
  2652 00000BF7 50                       push ax
  2653 00000BF8 E8CAF5                   call alnum
  2654 00000BFB 83C402                   add  sp, 2
  2655 00000BFE 08C0                     or  al, al
  2656 00000C00 0F845E02                 je .getlex123
  2657                                  
  2658                                  ;-435     strcpy(symboltemp, symbol);
  2659                                  
  2660 00000C04 8D06606D                 lea  ax, [symbol]
  2661 00000C08 50                       push ax
  2662 00000C09 8D06B9A2                 lea  ax, [symboltemp]
  2663 00000C0D 50                       push ax
  2664 00000C0E E818F6                   call strcpy
  2665 00000C11 83C404                   add  sp, 4
  2666                                  
  2667                                  ;-436     p=&symbol;
  2668                                  
  2669 00000C14 B8606D                   mov ax, symbol
  2670 00000C17 8946FC                   mov [bp-4], ax
  2671                                  
  2672                                  ;-437     *p=c;
  2673                                  
  2674 00000C1A 8A46FE                   mov al, [bp-2]
  2675 00000C1D 8B5EFC                   mov  bx, [bp-4]
  2676 00000C20 8807                     mov  [bx], al
  2677                                  
  2678                                  ;-438     p++;
  2679                                  
  2680 00000C22 FF46FC                   inc  word[bp-4]
  2681                                  
  2682                                  ;-439     while(alnum(thechar)) {
  2683                                  
  2684                                  .getlex124:
  2685 00000C25 A0[2200]                 mov al, byte [thechar]
  2686 00000C28 B400                     mov ah, 0
  2687 00000C2A 50                       push ax
  2688 00000C2B E897F5                   call alnum
  2689 00000C2E 83C402                   add  sp, 2
  2690 00000C31 08C0                     or  al, al
  2691 00000C33 0F841300                 je .getlex125
  2692                                  
  2693                                  ;-440         c=next();
  2694                                  
  2695 00000C37 E842FB                   call next
  2696 00000C3A 8846FE                   mov [bp-2], al
  2697                                  
  2698                                  ;-441         *p=c;
  2699                                  
  2700 00000C3D 8A46FE                   mov al, [bp-2]
  2701 00000C40 8B5EFC                   mov  bx, [bp-4]
  2702 00000C43 8807                     mov  [bx], al
  2703                                  
  2704                                  ;-442         p++;
  2705                                  
  2706 00000C45 FF46FC                   inc  word[bp-4]
  2707                                  
  2708                                  ;-443     }
  2709                                  
  2710                                  
  2711                                  ;-444     *p=0;
  2712                                  
  2713 00000C48 EBDB                     jmp .getlex124
  2714                                  .getlex125:
  2715 00000C4A B80000                   mov ax, 0
  2716 00000C4D 8B5EFC                   mov  bx, [bp-4]
  2717 00000C50 8807                     mov  [bx], al
  2718                                  
  2719                                  ;-445     if (eqstr(symbol,"signed"  )) return T_SIGNED;
  2720                                  
  2721 00000C52 68[830E]                 push getlex_1
  2722 00000C55 8D06606D                 lea  ax, [symbol]
  2723 00000C59 50                       push ax
  2724 00000C5A E802F6                   call eqstr
  2725 00000C5D 83C404                   add  sp, 4
  2726 00000C60 08C0                     or  al, al
  2727 00000C62 0F840600                 je .getlex126
  2728 00000C66 B81302                   mov ax, 531
  2729 00000C69 E9FF01                   jmp .retngetlex
  2730                                  
  2731                                  ;-446     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;
  2732                                  
  2733                                  .getlex126:
  2734 00000C6C 68[8A0E]                 push getlex_2
  2735 00000C6F 8D06606D                 lea  ax, [symbol]
  2736 00000C73 50                       push ax
  2737 00000C74 E8E8F5                   call eqstr
  2738 00000C77 83C404                   add  sp, 4
  2739 00000C7A 08C0                     or  al, al
  2740 00000C7C 0F840600                 je .getlex127
  2741 00000C80 B81402                   mov ax, 532
  2742 00000C83 E9E501                   jmp .retngetlex
  2743                                  
  2744                                  ;-447     if (eqstr(symbol,"void"    )) return T_VOID;
  2745                                  
  2746                                  .getlex127:
  2747 00000C86 68[930E]                 push getlex_3
  2748 00000C89 8D06606D                 lea  ax, [symbol]
  2749 00000C8D 50                       push ax
  2750 00000C8E E8CEF5                   call eqstr
  2751 00000C91 83C404                   add  sp, 4
  2752 00000C94 08C0                     or  al, al
  2753 00000C96 0F840600                 je .getlex128
  2754 00000C9A B81102                   mov ax, 529
  2755 00000C9D E9CB01                   jmp .retngetlex
  2756                                  
  2757                                  ;-448     if (eqstr(symbol,"int"     )) return T_INT;
  2758                                  
  2759                                  .getlex128:
  2760 00000CA0 68[980E]                 push getlex_4
  2761 00000CA3 8D06606D                 lea  ax, [symbol]
  2762 00000CA7 50                       push ax
  2763 00000CA8 E8B4F5                   call eqstr
  2764 00000CAB 83C404                   add  sp, 4
  2765 00000CAE 08C0                     or  al, al
  2766 00000CB0 0F840600                 je .getlex129
  2767 00000CB4 B80502                   mov ax, 517
  2768 00000CB7 E9B101                   jmp .retngetlex
  2769                                  
  2770                                  ;-449     if (eqstr(symbol,"long"    )) return T_LONG;
  2771                                  
  2772                                  .getlex129:
  2773 00000CBA 68[9C0E]                 push getlex_5
  2774 00000CBD 8D06606D                 lea  ax, [symbol]
  2775 00000CC1 50                       push ax
  2776 00000CC2 E89AF5                   call eqstr
  2777 00000CC5 83C404                   add  sp, 4
  2778 00000CC8 08C0                     or  al, al
  2779 00000CCA 0F840600                 je .getlex130
  2780 00000CCE B81502                   mov ax, 533
  2781 00000CD1 E99701                   jmp .retngetlex
  2782                                  
  2783                                  ;-450     if (eqstr(symbol,"char"    )) return T_CHAR;
  2784                                  
  2785                                  .getlex130:
  2786 00000CD4 68[A10E]                 push getlex_6
  2787 00000CD7 8D06606D                 lea  ax, [symbol]
  2788 00000CDB 50                       push ax
  2789 00000CDC E880F5                   call eqstr
  2790 00000CDF 83C404                   add  sp, 4
  2791 00000CE2 08C0                     or  al, al
  2792 00000CE4 0F840600                 je .getlex131
  2793 00000CE8 B81202                   mov ax, 530
  2794 00000CEB E97D01                   jmp .retngetlex
  2795                                  
  2796                                  ;-451     if (eqstr(symbol,"asm"     )) return T_ASM;
  2797                                  
  2798                                  .getlex131:
  2799 00000CEE 68[A60E]                 push getlex_7
  2800 00000CF1 8D06606D                 lea  ax, [symbol]
  2801 00000CF5 50                       push ax
  2802 00000CF6 E866F5                   call eqstr
  2803 00000CF9 83C404                   add  sp, 4
  2804 00000CFC 08C0                     or  al, al
  2805 00000CFE 0F840600                 je .getlex132
  2806 00000D02 B80602                   mov ax, 518
  2807 00000D05 E96301                   jmp .retngetlex
  2808                                  
  2809                                  ;-452     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;
  2810                                  
  2811                                  .getlex132:
  2812 00000D08 68[AA0E]                 push getlex_8
  2813 00000D0B 8D06606D                 lea  ax, [symbol]
  2814 00000D0F 50                       push ax
  2815 00000D10 E84CF5                   call eqstr
  2816 00000D13 83C404                   add  sp, 4
  2817 00000D16 08C0                     or  al, al
  2818 00000D18 0F840600                 je .getlex133
  2819 00000D1C B80702                   mov ax, 519
  2820 00000D1F E94901                   jmp .retngetlex
  2821                                  
  2822                                  ;-453     if (eqstr(symbol,"__emit__")) return T_EMIT;
  2823                                  
  2824                                  .getlex133:
  2825 00000D22 68[B00E]                 push getlex_9
  2826 00000D25 8D06606D                 lea  ax, [symbol]
  2827 00000D29 50                       push ax
  2828 00000D2A E832F5                   call eqstr
  2829 00000D2D 83C404                   add  sp, 4
  2830 00000D30 08C0                     or  al, al
  2831 00000D32 0F840600                 je .getlex134
  2832 00000D36 B80802                   mov ax, 520
  2833 00000D39 E92F01                   jmp .retngetlex
  2834                                  
  2835                                  ;-454     if (eqstr(symbol,"return"  )) return T_RETURN;
  2836                                  
  2837                                  .getlex134:
  2838 00000D3C 68[B90E]                 push getlex_10
  2839 00000D3F 8D06606D                 lea  ax, [symbol]
  2840 00000D43 50                       push ax
  2841 00000D44 E818F5                   call eqstr
  2842 00000D47 83C404                   add  sp, 4
  2843 00000D4A 08C0                     or  al, al
  2844 00000D4C 0F840600                 je .getlex135
  2845 00000D50 B80002                   mov ax, 512
  2846 00000D53 E91501                   jmp .retngetlex
  2847                                  
  2848                                  ;-455     if (eqstr(symbol,"if"      )) return T_IF;
  2849                                  
  2850                                  .getlex135:
  2851 00000D56 68[C00E]                 push getlex_11
  2852 00000D59 8D06606D                 lea  ax, [symbol]
  2853 00000D5D 50                       push ax
  2854 00000D5E E8FEF4                   call eqstr
  2855 00000D61 83C404                   add  sp, 4
  2856 00000D64 08C0                     or  al, al
  2857 00000D66 0F840600                 je .getlex136
  2858 00000D6A B80102                   mov ax, 513
  2859 00000D6D E9FB00                   jmp .retngetlex
  2860                                  
  2861                                  ;-456     if (eqstr(symbol,"else"    )) return T_ELSE;
  2862                                  
  2863                                  .getlex136:
  2864 00000D70 68[C30E]                 push getlex_12
  2865 00000D73 8D06606D                 lea  ax, [symbol]
  2866 00000D77 50                       push ax
  2867 00000D78 E8E4F4                   call eqstr
  2868 00000D7B 83C404                   add  sp, 4
  2869 00000D7E 08C0                     or  al, al
  2870 00000D80 0F840600                 je .getlex137
  2871 00000D84 B80202                   mov ax, 514
  2872 00000D87 E9E100                   jmp .retngetlex
  2873                                  
  2874                                  ;-457     if (eqstr(symbol,"while"   )) return T_WHILE;
  2875                                  
  2876                                  .getlex137:
  2877 00000D8A 68[C80E]                 push getlex_13
  2878 00000D8D 8D06606D                 lea  ax, [symbol]
  2879 00000D91 50                       push ax
  2880 00000D92 E8CAF4                   call eqstr
  2881 00000D95 83C404                   add  sp, 4
  2882 00000D98 08C0                     or  al, al
  2883 00000D9A 0F840600                 je .getlex138
  2884 00000D9E B80302                   mov ax, 515
  2885 00000DA1 E9C700                   jmp .retngetlex
  2886                                  
  2887                                  ;-458     if (eqstr(symbol,"do"      )) return T_DO;
  2888                                  
  2889                                  .getlex138:
  2890 00000DA4 68[CE0E]                 push getlex_14
  2891 00000DA7 8D06606D                 lea  ax, [symbol]
  2892 00000DAB 50                       push ax
  2893 00000DAC E8B0F4                   call eqstr
  2894 00000DAF 83C404                   add  sp, 4
  2895 00000DB2 08C0                     or  al, al
  2896 00000DB4 0F840600                 je .getlex139
  2897 00000DB8 B80402                   mov ax, 516
  2898 00000DBB E9AD00                   jmp .retngetlex
  2899                                  
  2900                                  ;-459     if (eqstr(symbol,"goto"    )) return T_GOTO;
  2901                                  
  2902                                  .getlex139:
  2903 00000DBE 68[D10E]                 push getlex_15
  2904 00000DC1 8D06606D                 lea  ax, [symbol]
  2905 00000DC5 50                       push ax
  2906 00000DC6 E896F4                   call eqstr
  2907 00000DC9 83C404                   add  sp, 4
  2908 00000DCC 08C0                     or  al, al
  2909 00000DCE 0F840600                 je .getlex140
  2910 00000DD2 B80902                   mov ax, 521
  2911 00000DD5 E99300                   jmp .retngetlex
  2912                                  
  2913                                  ;-460     if (eqstr(symbol,"define"  )) return T_DEFINE;
  2914                                  
  2915                                  .getlex140:
  2916 00000DD8 68[D60E]                 push getlex_16
  2917 00000DDB 8D06606D                 lea  ax, [symbol]
  2918 00000DDF 50                       push ax
  2919 00000DE0 E87CF4                   call eqstr
  2920 00000DE3 83C404                   add  sp, 4
  2921 00000DE6 08C0                     or  al, al
  2922 00000DE8 0F840600                 je .getlex141
  2923 00000DEC B8FF01                   mov ax, 511
  2924 00000DEF E97900                   jmp .retngetlex
  2925                                  
  2926                                  ;-461 
  2927                                  
  2928                                  
  2929                                  ;-462     i=0;//convert define to value
  2930                                  
  2931                                  .getlex141:
  2932 00000DF2 B80000                   mov ax, 0
  2933 00000DF5 8946FA                   mov [bp-6], ax
  2934                                  
  2935                                  ;-463     while (i < GTop) {
  2936                                  
  2937                                  .getlex142:
  2938 00000DF8 8B46FA                   mov ax, [bp-6]
  2939 00000DFB 3B06[3800]               cmp ax, [GTop]
  2940 00000DFF 0F8D5900                 jge .getlex143
  2941                                  
  2942                                  ;-464         j=adrF(GNameField, i);
  2943                                  
  2944 00000E03 FF76FA                   push word [bp-6]
  2945 00000E06 8D067976                 lea  ax, [GNameField]
  2946 00000E0A 50                       push ax
  2947 00000E0B E886F9                   call adrF
  2948 00000E0E 83C404                   add  sp, 4
  2949 00000E11 8946F8                   mov [bp-8], ax
  2950                                  
  2951                                  ;-465         if (eqstr(symbol,j)) {
  2952                                  
  2953 00000E14 FF76F8                   push word [bp-8]
  2954 00000E17 8D06606D                 lea  ax, [symbol]
  2955 00000E1B 50                       push ax
  2956 00000E1C E840F4                   call eqstr
  2957 00000E1F 83C404                   add  sp, 4
  2958 00000E22 08C0                     or  al, al
  2959 00000E24 0F842F00                 je .getlex144
  2960                                  
  2961                                  ;-466             if (GType[i]=='#') {
  2962                                  
  2963 00000E28 8B5EFA                   mov bx, [bp-6]
  2964 00000E2B 8A87A96E                 mov al, [GType + bx]
  2965 00000E2F 3C23                     cmp al, 35
  2966 00000E31 0F852200                 jne .getlex145
  2967                                  
  2968                                  ;-467                 lexval=GData[i];
  2969                                  
  2970 00000E35 8B5EFA                   mov bx, [bp-6]
  2971 00000E38 D1E3                     shl bx, 1
  2972 00000E3A 8B875973                 mov ax, [GData + bx]
  2973 00000E3E A3[2B00]                 mov word [lexval], ax
  2974                                  
  2975                                  ;-468                 strcpy(symbol, symboltemp);
  2976                                  
  2977 00000E41 8D06B9A2                 lea  ax, [symboltemp]
  2978 00000E45 50                       push ax
  2979 00000E46 8D06606D                 lea  ax, [symbol]
  2980 00000E4A 50                       push ax
  2981 00000E4B E8DBF3                   call strcpy
  2982 00000E4E 83C404                   add  sp, 4
  2983                                  
  2984                                  ;-469                 return T_CONST;
  2985                                  
  2986 00000E51 B80101                   mov ax, 257
  2987 00000E54 E91400                   jmp .retngetlex
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
  2999 00000E57 FF46FA                   inc  word[bp-6]
  3000                                  
  3001                                  ;-473     }
  3002                                  
  3003                                  
  3004                                  ;-474     return T_NAME; } error1("Input item not recognized");
  3005                                  
  3006 00000E5A EB9C                     jmp .getlex142
  3007                                  .getlex143:
  3008 00000E5C B80001                   mov ax, 256
  3009 00000E5F E90900                   jmp .retngetlex
  3010                                  .getlex123:
  3011 00000E62 68[DD0E]                 push getlex_17
  3012 00000E65 E833F7                   call error1
  3013 00000E68 83C402                   add  sp, 2
  3014                                  
  3015                                  ;-475 }
  3016                                  
  3017                                  
  3018                                  ;-476 
  3019                                  
  3020                                  
  3021                                  ;-477 int istoken(int t) {
  3022                                  
  3023 00000E6B C9                       .retngetlex: LEAVE
  3024 00000E6C C3                       ret
  3025 00000E6D 28295B5D7B7D2C3B2A-     getlex_0 db "()[]{},;*:%-><=+!&|#?",0
  3026 00000E76 3A252D3E3C3D2B2126-
  3027 00000E7F 7C233F00           
  3028 00000E83 7369676E656400          getlex_1 db "signed",0
  3029 00000E8A 756E7369676E656400      getlex_2 db "unsigned",0
  3030 00000E93 766F696400              getlex_3 db "void",0
  3031 00000E98 696E7400                getlex_4 db "int",0
  3032 00000E9C 6C6F6E6700              getlex_5 db "long",0
  3033 00000EA1 6368617200              getlex_6 db "char",0
  3034 00000EA6 61736D00                getlex_7 db "asm",0
  3035 00000EAA 5F5F61736D00            getlex_8 db "__asm",0
  3036 00000EB0 5F5F656D69745F5F00      getlex_9 db "__emit__",0
  3037 00000EB9 72657475726E00          getlex_10 db "return",0
  3038 00000EC0 696600                  getlex_11 db "if",0
  3039 00000EC3 656C736500              getlex_12 db "else",0
  3040 00000EC8 7768696C6500            getlex_13 db "while",0
  3041 00000ECE 646F00                  getlex_14 db "do",0
  3042 00000ED1 676F746F00              getlex_15 db "goto",0
  3043 00000ED6 646566696E6500          getlex_16 db "define",0
  3044 00000EDD 496E70757420697465-     getlex_17 db "Input item not recognized",0
  3045 00000EE6 6D206E6F7420726563-
  3046 00000EEF 6F676E697A656400   
  3047                                  ENDP
  3048                                  
  3049                                  istoken: PROC
  3050                                  
  3051                                  ;-478     if (token == t) {
  3052                                  ;
  3053 00000EF7 C8000000                 ENTER  0,0
  3054 00000EFB A1[1E00]                 mov ax, [token]
  3055 00000EFE 3B4604                   cmp ax, [bp+4]
  3056 00000F01 0F850C00                 jne .istoken146
  3057                                  
  3058                                  ;-479         token=getlex();
  3059                                  
  3060 00000F05 E83DF9                   call getlex
  3061 00000F08 A3[1E00]                 mov word [token], ax
  3062                                  
  3063                                  ;-480         return 1;
  3064                                  
  3065 00000F0B B80100                   mov ax, 1
  3066 00000F0E E90600                   jmp .retnistoken
  3067                                  
  3068                                  ;-481     }
  3069                                  
  3070                                  
  3071                                  ;-482     return 0;
  3072                                  
  3073                                  .istoken146:
  3074 00000F11 B80000                   mov ax, 0
  3075 00000F14 E90000                   jmp .retnistoken
  3076                                  
  3077                                  ;-483 }
  3078                                  
  3079                                  
  3080                                  ;-484 int expect(int t) {
  3081                                  
  3082 00000F17 C9                       .retnistoken: LEAVE
  3083 00000F18 C3                       ret
  3084                                  ENDP
  3085                                  
  3086                                  expect: PROC
  3087                                  
  3088                                  ;-485     if (istoken(t)==0) {
  3089                                  ;
  3090 00000F19 C8000000                 ENTER  0,0
  3091 00000F1D FF7604                   push word [bp+4]
  3092 00000F20 E8D4FF                   call istoken
  3093 00000F23 83C402                   add  sp, 2
  3094 00000F26 83F800                   cmp ax, 0
  3095 00000F29 0F852F00                 jne .expect147
  3096                                  
  3097                                  ;-486         *cloc=0;
  3098                                  
  3099 00000F2D B80000                   mov ax, 0
  3100 00000F30 8B1E[1800]               mov  bx, [cloc]
  3101 00000F34 8807                     mov  [bx], al
  3102                                  
  3103                                  ;-487         prs(co);
  3104                                  
  3105 00000F36 8D06A861                 lea  ax, [co]
  3106 00000F3A 50                       push ax
  3107 00000F3B E8A1F4                   call prs
  3108 00000F3E 83C402                   add  sp, 2
  3109                                  
  3110                                  ;-488         prs("\nExpected ASCII(dez): ");
  3111                                  
  3112 00000F41 68[5E0F]                 push expect_0
  3113 00000F44 E898F4                   call prs
  3114 00000F47 83C402                   add  sp, 2
  3115                                  
  3116                                  ;-489         pint1(t);
  3117                                  
  3118 00000F4A FF7604                   push word [bp+4]
  3119 00000F4D E886F5                   call pint1
  3120 00000F50 83C402                   add  sp, 2
  3121                                  
  3122                                  ;-490         error1(" not found");
  3123                                  
  3124 00000F53 68[760F]                 push expect_1
  3125 00000F56 E842F6                   call error1
  3126 00000F59 83C402                   add  sp, 2
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
  3139 00000F5C C9                       LEAVE
  3140 00000F5D C3                       ret
  3141 00000F5E 5C6E45787065637465-     expect_0 db "\nExpected ASCII(dez): ",0
  3142 00000F67 642041534349492864-
  3143 00000F70 657A293A2000       
  3144 00000F76 206E6F7420666F756E-     expect_1 db " not found",0
  3145 00000F7F 6400               
  3146                                  ENDP
  3147                                  
  3148                                  v: PROC
  3149                                  
  3150                                  ;-495     if (i < LSTART) prc('[');
  3151                                  ;
  3152 00000F81 C8000000                 ENTER  0,0
  3153 00000F85 8B4604                   mov ax, [bp+4]
  3154 00000F88 3DC800                   cmp ax, 200
  3155 00000F8B 0F8D0800                 jge .v148
  3156 00000F8F 6A5B                     push 91
  3157 00000F91 E8F2F3                   call prc
  3158 00000F94 83C402                   add  sp, 2
  3159                                  
  3160                                  ;-496     printName(i);
  3161                                  
  3162                                  .v148:
  3163 00000F97 FF7604                   push word [bp+4]
  3164 00000F9A E806F8                   call printName
  3165 00000F9D 83C402                   add  sp, 2
  3166                                  
  3167                                  ;-497     if (i < LSTART) prc(']');
  3168                                  
  3169 00000FA0 8B4604                   mov ax, [bp+4]
  3170 00000FA3 3DC800                   cmp ax, 200
  3171 00000FA6 0F8D0800                 jge .v149
  3172 00000FAA 6A5D                     push 93
  3173 00000FAC E8D7F3                   call prc
  3174 00000FAF 83C402                   add  sp, 2
  3175                                  
  3176                                  ;-498 }
  3177                                  
  3178                                  .v149:
  3179                                  
  3180                                  ;-499 int checknamelen() {
  3181 00000FB2 C9                       LEAVE
  3182 00000FB3 C3                       ret
  3183                                  ENDP
  3184                                  
  3185                                  checknamelen: PROC
  3186                                  
  3187                                  ;-500     int i;
  3188                                  
  3189                                  
  3190                                  ;-501     i=strlen(symbol);
  3191                                  ;
  3192 00000FB4 C8020000                 ENTER  2,0
  3193 00000FB8 8D06606D                 lea  ax, [symbol]
  3194 00000FBC 50                       push ax
  3195 00000FBD E841F2                   call strlen
  3196 00000FC0 83C402                   add  sp, 2
  3197 00000FC3 8946FE                   mov [bp-2], ax
  3198                                  
  3199                                  ;-502     if (i > IDLENMAX) error1("Item name is too long in characters)");
  3200                                  
  3201 00000FC6 8B46FE                   mov ax, [bp-2]
  3202 00000FC9 83F80F                   cmp ax, 15
  3203 00000FCC 0F8E0900                 jle .checknamelen150
  3204 00000FD0 68[DB0F]                 push checknamelen_0
  3205 00000FD3 E8C5F5                   call error1
  3206 00000FD6 83C402                   add  sp, 2
  3207                                  
  3208                                  ;-503 }
  3209                                  
  3210                                  .checknamelen150:
  3211                                  
  3212                                  ;-504 
  3213                                  
  3214                                  
  3215                                  ;-505 int checkName() { unsigned int i; unsigned int j;
  3216 00000FD9 C9                       LEAVE
  3217 00000FDA C3                       ret
  3218 00000FDB 4974656D206E616D65-     checknamelen_0 db "Item name is too long in characters)",0
  3219 00000FE4 20697320746F6F206C-
  3220 00000FED 6F6E6720696E206368-
  3221 00000FF6 617261637465727329-
  3222 00000FFF 00                 
  3223                                  ENDP
  3224                                  
  3225                                  checkName: PROC
  3226                                  
  3227                                  ;-506     i=LSTART;
  3228                                  ;
  3229 00001000 C8040000                 ENTER  4,0
  3230 00001004 B8C800                   mov ax, 200
  3231 00001007 8946FE                   mov [bp-2], ax
  3232                                  
  3233                                  ;-507     while(i<LTop) {
  3234                                  
  3235                                  .checkName151:
  3236 0000100A 8B46FE                   mov ax, [bp-2]
  3237 0000100D 3B06[3A00]               cmp ax, [LTop]
  3238 00001011 0F8D3000                 jge .checkName152
  3239                                  
  3240                                  ;-508         j=adrF(GNameField, i);
  3241                                  
  3242 00001015 FF76FE                   push word [bp-2]
  3243 00001018 8D067976                 lea  ax, [GNameField]
  3244 0000101C 50                       push ax
  3245 0000101D E874F7                   call adrF
  3246 00001020 83C404                   add  sp, 4
  3247 00001023 8946FC                   mov [bp-4], ax
  3248                                  
  3249                                  ;-509         if(eqstr(symbol,j))return i;
  3250                                  
  3251 00001026 FF76FC                   push word [bp-4]
  3252 00001029 8D06606D                 lea  ax, [symbol]
  3253 0000102D 50                       push ax
  3254 0000102E E82EF2                   call eqstr
  3255 00001031 83C404                   add  sp, 4
  3256 00001034 08C0                     or  al, al
  3257 00001036 0F840600                 je .checkName153
  3258 0000103A 8B46FE                   mov ax, [bp-2]
  3259 0000103D E94C00                   jmp .retncheckName
  3260                                  
  3261                                  ;-510         i++;
  3262                                  
  3263                                  .checkName153:
  3264 00001040 FF46FE                   inc  word[bp-2]
  3265                                  
  3266                                  ;-511     }
  3267                                  
  3268                                  
  3269                                  ;-512     i=1;
  3270                                  
  3271 00001043 EBC5                     jmp .checkName151
  3272                                  .checkName152:
  3273 00001045 B80100                   mov ax, 1
  3274 00001048 8946FE                   mov [bp-2], ax
  3275                                  
  3276                                  ;-513     while(i<GTop) {
  3277                                  
  3278                                  .checkName154:
  3279 0000104B 8B46FE                   mov ax, [bp-2]
  3280 0000104E 3B06[3800]               cmp ax, [GTop]
  3281 00001052 0F8D3000                 jge .checkName155
  3282                                  
  3283                                  ;-514         j=adrF(GNameField, i);
  3284                                  
  3285 00001056 FF76FE                   push word [bp-2]
  3286 00001059 8D067976                 lea  ax, [GNameField]
  3287 0000105D 50                       push ax
  3288 0000105E E833F7                   call adrF
  3289 00001061 83C404                   add  sp, 4
  3290 00001064 8946FC                   mov [bp-4], ax
  3291                                  
  3292                                  ;-515         if(eqstr(symbol,j))return i;
  3293                                  
  3294 00001067 FF76FC                   push word [bp-4]
  3295 0000106A 8D06606D                 lea  ax, [symbol]
  3296 0000106E 50                       push ax
  3297 0000106F E8EDF1                   call eqstr
  3298 00001072 83C404                   add  sp, 4
  3299 00001075 08C0                     or  al, al
  3300 00001077 0F840600                 je .checkName156
  3301 0000107B 8B46FE                   mov ax, [bp-2]
  3302 0000107E E90B00                   jmp .retncheckName
  3303                                  
  3304                                  ;-516         i++;
  3305                                  
  3306                                  .checkName156:
  3307 00001081 FF46FE                   inc  word[bp-2]
  3308                                  
  3309                                  ;-517     }
  3310                                  
  3311                                  
  3312                                  ;-518     return 0;
  3313                                  
  3314 00001084 EBC5                     jmp .checkName154
  3315                                  .checkName155:
  3316 00001086 B80000                   mov ax, 0
  3317 00001089 E90000                   jmp .retncheckName
  3318                                  
  3319                                  ;-519 }
  3320                                  
  3321                                  
  3322                                  ;-520 int searchname() { unsigned int i;
  3323                                  
  3324 0000108C C9                       .retncheckName: LEAVE
  3325 0000108D C3                       ret
  3326                                  ENDP
  3327                                  
  3328                                  searchname: PROC
  3329                                  
  3330                                  ;-521   i=checkName(); if (i == 0) error1("Variable unknown");
  3331                                  ;
  3332 0000108E C8020000                 ENTER  2,0
  3333 00001092 E86BFF                   call checkName
  3334 00001095 8946FE                   mov [bp-2], ax
  3335 00001098 8B46FE                   mov ax, [bp-2]
  3336 0000109B 83F800                   cmp ax, 0
  3337 0000109E 0F850900                 jne .searchname157
  3338 000010A2 68[B310]                 push searchname_0
  3339 000010A5 E8F3F4                   call error1
  3340 000010A8 83C402                   add  sp, 2
  3341                                  
  3342                                  ;-522   return i;
  3343                                  
  3344                                  .searchname157:
  3345 000010AB 8B46FE                   mov ax, [bp-2]
  3346 000010AE E90000                   jmp .retnsearchname
  3347                                  
  3348                                  ;-523 }
  3349                                  
  3350                                  
  3351                                  ;-524 int name1() {
  3352                                  
  3353 000010B1 C9                       .retnsearchname: LEAVE
  3354 000010B2 C3                       ret
  3355 000010B3 5661726961626C6520-     searchname_0 db "Variable unknown",0
  3356 000010BC 756E6B6E6F776E00   
  3357                                  ENDP
  3358                                  
  3359                                  name1: PROC
  3360                                  
  3361                                  ;-525     if (token!=T_NAME) error1("Name expected");
  3362                                  
  3363 000010C4 A1[1E00]                 mov ax, [token]
  3364 000010C7 3D0001                   cmp ax, 256
  3365 000010CA 0F840900                 je  .name1158
  3366 000010CE 68[DE10]                 push name1_0
  3367 000010D1 E8C7F4                   call error1
  3368 000010D4 83C402                   add  sp, 2
  3369                                  
  3370                                  ;-526     token=getlex();
  3371                                  
  3372                                  .name1158:
  3373 000010D7 E86BF7                   call getlex
  3374 000010DA A3[1E00]                 mov word [token], ax
  3375                                  
  3376                                  ;-527 }
  3377                                  
  3378                                  
  3379                                  ;-528 int typeName() { int m; //0=V,1=*,2=&
  3380                                  
  3381 000010DD C3                       ret
  3382 000010DE 4E616D652065787065-     name1_0 db "Name expected",0
  3383 000010E7 6374656400         
  3384                                  ENDP
  3385                                  
  3386                                  typeName: PROC
  3387                                  
  3388                                  ;-529     issign='S';
  3389                                  ;
  3390 000010EC C8020000                 ENTER  2,0
  3391 000010F0 B85300                   mov ax, 83
  3392 000010F3 A2[3200]                 mov byte [issign], al
  3393                                  
  3394                                  ;-530     if(istoken(T_SIGNED))   issign='S';
  3395                                  
  3396 000010F6 681302                   push 531
  3397 000010F9 E8FBFD                   call istoken
  3398 000010FC 83C402                   add  sp, 2
  3399 000010FF 08C0                     or  al, al
  3400 00001101 0F840600                 je .typeName159
  3401 00001105 B85300                   mov ax, 83
  3402 00001108 A2[3200]                 mov byte [issign], al
  3403                                  
  3404                                  ;-531     if(istoken(T_UNSIGNED)) issign='U';
  3405                                  
  3406                                  .typeName159:
  3407 0000110B 681402                   push 532
  3408 0000110E E8E6FD                   call istoken
  3409 00001111 83C402                   add  sp, 2
  3410 00001114 08C0                     or  al, al
  3411 00001116 0F840600                 je .typeName160
  3412 0000111A B85500                   mov ax, 85
  3413 0000111D A2[3200]                 mov byte [issign], al
  3414                                  
  3415                                  ;-532     iswidth=2;
  3416                                  
  3417                                  .typeName160:
  3418 00001120 B80200                   mov ax, 2
  3419 00001123 A2[3500]                 mov byte [iswidth], al
  3420                                  
  3421                                  ;-533     if(istoken(T_VOID))     iswidth=0;
  3422                                  
  3423 00001126 681102                   push 529
  3424 00001129 E8CBFD                   call istoken
  3425 0000112C 83C402                   add  sp, 2
  3426 0000112F 08C0                     or  al, al
  3427 00001131 0F840600                 je .typeName161
  3428 00001135 B80000                   mov ax, 0
  3429 00001138 A2[3500]                 mov byte [iswidth], al
  3430                                  
  3431                                  ;-534     if(istoken(T_CHAR))     iswidth=1;
  3432                                  
  3433                                  .typeName161:
  3434 0000113B 681202                   push 530
  3435 0000113E E8B6FD                   call istoken
  3436 00001141 83C402                   add  sp, 2
  3437 00001144 08C0                     or  al, al
  3438 00001146 0F840600                 je .typeName162
  3439 0000114A B80100                   mov ax, 1
  3440 0000114D A2[3500]                 mov byte [iswidth], al
  3441                                  
  3442                                  ;-535     if(istoken(T_INT))      iswidth=2;
  3443                                  
  3444                                  .typeName162:
  3445 00001150 680502                   push 517
  3446 00001153 E8A1FD                   call istoken
  3447 00001156 83C402                   add  sp, 2
  3448 00001159 08C0                     or  al, al
  3449 0000115B 0F840600                 je .typeName163
  3450 0000115F B80200                   mov ax, 2
  3451 00001162 A2[3500]                 mov byte [iswidth], al
  3452                                  
  3453                                  ;-536     if(istoken(T_LONG))     iswidth=4;
  3454                                  
  3455                                  .typeName163:
  3456 00001165 681502                   push 533
  3457 00001168 E88CFD                   call istoken
  3458 0000116B 83C402                   add  sp, 2
  3459 0000116E 08C0                     or  al, al
  3460 00001170 0F840600                 je .typeName164
  3461 00001174 B80400                   mov ax, 4
  3462 00001177 A2[3500]                 mov byte [iswidth], al
  3463                                  
  3464                                  ;-537     istype='V';
  3465                                  
  3466                                  .typeName164:
  3467 0000117A B85600                   mov ax, 86
  3468 0000117D A2[2F00]                 mov byte [istype], al
  3469                                  
  3470                                  ;-538     m=0;
  3471                                  
  3472 00001180 B80000                   mov ax, 0
  3473 00001183 8946FE                   mov [bp-2], ax
  3474                                  
  3475                                  ;-539     if(istoken('*'))  {istype='*'; m=1;}
  3476                                  
  3477 00001186 6A2A                     push 42
  3478 00001188 E86CFD                   call istoken
  3479 0000118B 83C402                   add  sp, 2
  3480 0000118E 08C0                     or  al, al
  3481 00001190 0F840C00                 je .typeName165
  3482 00001194 B82A00                   mov ax, 42
  3483 00001197 A2[2F00]                 mov byte [istype], al
  3484 0000119A B80100                   mov ax, 1
  3485 0000119D 8946FE                   mov [bp-2], ax
  3486                                  
  3487                                  ;-540     if(istoken('&'))  {istype='&'; m=2;}
  3488                                  
  3489                                  .typeName165:
  3490 000011A0 6A26                     push 38
  3491 000011A2 E852FD                   call istoken
  3492 000011A5 83C402                   add  sp, 2
  3493 000011A8 08C0                     or  al, al
  3494 000011AA 0F840C00                 je .typeName166
  3495 000011AE B82600                   mov ax, 38
  3496 000011B1 A2[2F00]                 mov byte [istype], al
  3497 000011B4 B80200                   mov ax, 2
  3498 000011B7 8946FE                   mov [bp-2], ax
  3499                                  
  3500                                  ;-541     name1();
  3501                                  
  3502                                  .typeName166:
  3503 000011BA E807FF                   call name1
  3504                                  
  3505                                  ;-542     return m;
  3506                                  
  3507 000011BD 8B46FE                   mov ax, [bp-2]
  3508 000011C0 E90000                   jmp .retntypeName
  3509                                  
  3510                                  ;-543 }
  3511                                  
  3512                                  
  3513                                  ;-544 int gettypes(int i) {int j; char c;
  3514                                  
  3515 000011C3 C9                       .retntypeName: LEAVE
  3516 000011C4 C3                       ret
  3517                                  ENDP
  3518                                  
  3519                                  gettypes: PROC
  3520                                  
  3521                                  ;-545   c=GSign [i]; if (c=='S') signi =1;    else signi =0;
  3522                                  ;
  3523 000011C5 C8040000                 ENTER  4,0
  3524 000011C9 8B5E04                   mov bx, [bp+4]
  3525 000011CC 8A873970                 mov al, [GSign + bx]
  3526 000011D0 8846FC                   mov [bp-4], al
  3527 000011D3 8A46FC                   mov al, [bp-4]
  3528 000011D6 3C53                     cmp al, 83
  3529 000011D8 0F850900                 jne .gettypes167
  3530 000011DC B80100                   mov ax, 1
  3531 000011DF A3[3000]                 mov word [signi], ax
  3532 000011E2 E90600                   jmp .gettypes168
  3533                                  .gettypes167:
  3534 000011E5 B80000                   mov ax, 0
  3535 000011E8 A3[3000]                 mov word [signi], ax
  3536                                  
  3537                                  ;-546   c=GWidth[i]; widthi=0;wi=0;
  3538                                  
  3539                                  .gettypes168:
  3540 000011EB 8B5E04                   mov bx, [bp+4]
  3541 000011EE 8A87C971                 mov al, [GWidth + bx]
  3542 000011F2 8846FC                   mov [bp-4], al
  3543 000011F5 B80000                   mov ax, 0
  3544 000011F8 A3[3300]                 mov word [widthi], ax
  3545 000011FB B80000                   mov ax, 0
  3546 000011FE A3[3600]                 mov word [wi], ax
  3547                                  
  3548                                  ;-547   if (c==1) {widthi=1;wi=1;}
  3549                                  
  3550 00001201 8A46FC                   mov al, [bp-4]
  3551 00001204 3C01                     cmp al, 1
  3552 00001206 0F850C00                 jne .gettypes169
  3553 0000120A B80100                   mov ax, 1
  3554 0000120D A3[3300]                 mov word [widthi], ax
  3555 00001210 B80100                   mov ax, 1
  3556 00001213 A3[3600]                 mov word [wi], ax
  3557                                  
  3558                                  ;-548   if (c==2) {widthi=2;wi=2;}
  3559                                  
  3560                                  .gettypes169:
  3561 00001216 8A46FC                   mov al, [bp-4]
  3562 00001219 3C02                     cmp al, 2
  3563 0000121B 0F850C00                 jne .gettypes170
  3564 0000121F B80200                   mov ax, 2
  3565 00001222 A3[3300]                 mov word [widthi], ax
  3566 00001225 B80200                   mov ax, 2
  3567 00001228 A3[3600]                 mov word [wi], ax
  3568                                  
  3569                                  ;-549   if (c==4) {widthi=4;wi=4;}
  3570                                  
  3571                                  .gettypes170:
  3572 0000122B 8A46FC                   mov al, [bp-4]
  3573 0000122E 3C04                     cmp al, 4
  3574 00001230 0F850C00                 jne .gettypes171
  3575 00001234 B80400                   mov ax, 4
  3576 00001237 A3[3300]                 mov word [widthi], ax
  3577 0000123A B80400                   mov ax, 4
  3578 0000123D A3[3600]                 mov word [wi], ax
  3579                                  
  3580                                  ;-550   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}
  3581                                  
  3582                                  .gettypes171:
  3583 00001240 8B5E04                   mov bx, [bp+4]
  3584 00001243 8A87A96E                 mov al, [GType + bx]
  3585 00001247 8846FC                   mov [bp-4], al
  3586 0000124A B80000                   mov ax, 0
  3587 0000124D A3[2D00]                 mov word [typei], ax
  3588 00001250 8A46FC                   mov al, [bp-4]
  3589 00001253 3C2A                     cmp al, 42
  3590 00001255 0F850C00                 jne .gettypes172
  3591 00001259 B80100                   mov ax, 1
  3592 0000125C A3[2D00]                 mov word [typei], ax
  3593 0000125F B80200                   mov ax, 2
  3594 00001262 A3[3600]                 mov word [wi], ax
  3595                                  
  3596                                  ;-551   if (c=='&')  typei=2;
  3597                                  
  3598                                  .gettypes172:
  3599 00001265 8A46FC                   mov al, [bp-4]
  3600 00001268 3C26                     cmp al, 38
  3601 0000126A 0F850600                 jne .gettypes173
  3602 0000126E B80200                   mov ax, 2
  3603 00001271 A3[2D00]                 mov word [typei], ax
  3604                                  
  3605                                  ;-552   return i; }
  3606                                  
  3607                                  .gettypes173:
  3608 00001274 8B4604                   mov ax, [bp+4]
  3609 00001277 E90000                   jmp .retngettypes
  3610                                  
  3611                                  ;-553 
  3612                                  
  3613                                  
  3614                                  ;-554 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");
  3615                                  
  3616 0000127A C9                       .retngettypes: LEAVE
  3617 0000127B C3                       ret
  3618                                  ENDP
  3619                                  
  3620                                  addlocal: PROC
  3621 0000127C A1[3A00]                 mov ax, [LTop]
  3622 0000127F 3D9001                   cmp ax, 400 ;unsigned : 1
  3623 00001282 0F8C0900                 jl  .addlocal174
  3624 00001286 68[E512]                 push addlocal_0
  3625 00001289 E80FF3                   call error1
  3626 0000128C 83C402                   add  sp, 2
  3627                                  
  3628                                  ;-555   if (checkName() != 0) error1("Variable already defined");
  3629                                  
  3630                                  .addlocal174:
  3631 0000128F E86EFD                   call checkName
  3632 00001292 83F800                   cmp ax, 0
  3633 00001295 0F840900                 je  .addlocal175
  3634 00001299 68[FF12]                 push addlocal_1
  3635 0000129C E8FCF2                   call error1
  3636 0000129F 83C402                   add  sp, 2
  3637                                  
  3638                                  ;-556   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;
  3639                                  
  3640                                  .addlocal175:
  3641 000012A2 A0[3200]                 mov al, [issign]
  3642 000012A5 8B1E[3A00]               mov bx, [LTop]
  3643 000012A9 88873970                 mov [GSign+bx], al
  3644 000012AD A0[3500]                 mov al, [iswidth]
  3645 000012B0 8B1E[3A00]               mov bx, [LTop]
  3646 000012B4 8887C971                 mov [GWidth+bx], al
  3647 000012B8 A0[2F00]                 mov al, [istype]
  3648 000012BB 8B1E[3A00]               mov bx, [LTop]
  3649 000012BF 8887A96E                 mov [GType+bx], al
  3650                                  
  3651                                  ;-557   pt=adrF(GNameField, LTop); strcpy(pt, symbol);
  3652                                  
  3653 000012C3 FF36[3A00]               push word [LTop]
  3654 000012C7 8D067976                 lea  ax, [GNameField]
  3655 000012CB 50                       push ax
  3656 000012CC E8C5F4                   call adrF
  3657 000012CF 83C404                   add  sp, 4
  3658 000012D2 A3[4200]                 mov word [pt], ax
  3659 000012D5 8D06606D                 lea  ax, [symbol]
  3660 000012D9 50                       push ax
  3661 000012DA FF36[4200]               push word [pt]
  3662 000012DE E848EF                   call strcpy
  3663 000012E1 83C404                   add  sp, 4
  3664                                  
  3665                                  ;-558 }
  3666                                  
  3667                                  
  3668                                  ;-559 
  3669                                  
  3670                                  
  3671                                  ;-560 int isvariable() {
  3672                                  
  3673 000012E4 C3                       ret
  3674 000012E5 4C6F63616C20766172-     addlocal_0 db "Local variable table full",0
  3675 000012EE 6961626C6520746162-
  3676 000012F7 6C652066756C6C00   
  3677 000012FF 5661726961626C6520-     addlocal_1 db "Variable already defined",0
  3678 00001308 616C72656164792064-
  3679 00001311 6566696E656400     
  3680                                  ENDP
  3681                                  
  3682                                  isvariable: PROC
  3683                                  
  3684                                  ;-561     if(token==T_SIGNED)   goto v1;
  3685                                  
  3686 00001318 A1[1E00]                 mov ax, [token]
  3687 0000131B 3D1302                   cmp ax, 531
  3688 0000131E 0F850300                 jne .isvariable176
  3689 00001322 E93A00                   jmp .v1
  3690                                  
  3691                                  ;-562     if(token==T_UNSIGNED) goto v1;
  3692                                  
  3693                                  .isvariable176:
  3694 00001325 A1[1E00]                 mov ax, [token]
  3695 00001328 3D1402                   cmp ax, 532
  3696 0000132B 0F850300                 jne .isvariable177
  3697 0000132F E92D00                   jmp .v1
  3698                                  
  3699                                  ;-563     if(token==T_CHAR)     goto v1;
  3700                                  
  3701                                  .isvariable177:
  3702 00001332 A1[1E00]                 mov ax, [token]
  3703 00001335 3D1202                   cmp ax, 530
  3704 00001338 0F850300                 jne .isvariable178
  3705 0000133C E92000                   jmp .v1
  3706                                  
  3707                                  ;-564     if(token==T_INT)      goto v1;
  3708                                  
  3709                                  .isvariable178:
  3710 0000133F A1[1E00]                 mov ax, [token]
  3711 00001342 3D0502                   cmp ax, 517
  3712 00001345 0F850300                 jne .isvariable179
  3713 00001349 E91300                   jmp .v1
  3714                                  
  3715                                  ;-565     if(token==T_LONG)     goto v1;
  3716                                  
  3717                                  .isvariable179:
  3718 0000134C A1[1E00]                 mov ax, [token]
  3719 0000134F 3D1502                   cmp ax, 533
  3720 00001352 0F850300                 jne .isvariable180
  3721 00001356 E90600                   jmp .v1
  3722                                  
  3723                                  ;-566     return 0;
  3724                                  
  3725                                  .isvariable180:
  3726 00001359 B80000                   mov ax, 0
  3727 0000135C E90600                   jmp .retnisvariable
  3728                                  
  3729                                  ;-567 v1: return 1;
  3730                                  
  3731                                  .v1:
  3732 0000135F B80100                   mov ax, 1
  3733 00001362 E90000                   jmp .retnisvariable
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
  3744 00001365 C3                       ret
  3745                                  ENDP
  3746                                  
  3747                                  cmpneg: PROC
  3748                                  
  3749                                  ;-571        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
  3750                                  ;
  3751 00001366 C8000000                 ENTER  0,0
  3752 0000136A A1[2300]                 mov ax, [iscmp]
  3753 0000136D 3D2603                   cmp ax, 806
  3754 00001370 0F850C00                 jne .cmpneg181
  3755 00001374 68[4714]                 push cmpneg_0
  3756 00001377 E865F0                   call prs
  3757 0000137A 83C402                   add  sp, 2
  3758                                  
  3759                                  ;-572   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1
  3760                                  
  3761 0000137D E9C500                   jmp .cmpneg182
  3762                                  .cmpneg181:
  3763 00001380 A1[2300]                 mov ax, [iscmp]
  3764 00001383 3D2703                   cmp ax, 807
  3765 00001386 0F850C00                 jne .cmpneg183
  3766 0000138A 68[5014]                 push cmpneg_1
  3767 0000138D E84FF0                   call prs
  3768 00001390 83C402                   add  sp, 2
  3769                                  
  3770                                  ;-573   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF
  3771                                  
  3772 00001393 E9AF00                   jmp .cmpneg184
  3773                                  .cmpneg183:
  3774 00001396 A1[2300]                 mov ax, [iscmp]
  3775 00001399 3D3803                   cmp ax, 824
  3776 0000139C 0F852100                 jne .cmpneg185
  3777 000013A0 8B4604                   mov ax, [bp+4]
  3778 000013A3 08C0                     or  al, al
  3779 000013A5 0F840C00                 je .cmpneg186
  3780 000013A9 68[5914]                 push cmpneg_2
  3781 000013AC E830F0                   call prs
  3782 000013AF 83C402                   add  sp, 2
  3783                                  
  3784                                  ;-574                            else prs("\n ja  .");//ZF=0 CF=0
  3785                                  
  3786 000013B2 E90900                   jmp .cmpneg187
  3787                                  .cmpneg186:
  3788 000013B5 68[6214]                 push cmpneg_3
  3789 000013B8 E824F0                   call prs
  3790 000013BB 83C402                   add  sp, 2
  3791                                  
  3792                                  ;-575   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);
  3793                                  
  3794                                  .cmpneg187:
  3795 000013BE E98400                   jmp .cmpneg188
  3796                                  .cmpneg185:
  3797 000013C1 A1[2300]                 mov ax, [iscmp]
  3798 000013C4 3D2B03                   cmp ax, 811
  3799 000013C7 0F854500                 jne .cmpneg189
  3800 000013CB 8B4604                   mov ax, [bp+4]
  3801 000013CE 08C0                     or  al, al
  3802 000013D0 0F841E00                 je .cmpneg190
  3803 000013D4 68[6B14]                 push cmpneg_4
  3804 000013D7 E805F0                   call prs
  3805 000013DA 83C402                   add  sp, 2
  3806 000013DD FF7604                   push word [bp+4]
  3807 000013E0 E851F1                   call prunsign1
  3808 000013E3 83C402                   add  sp, 2
  3809                                  
  3810                                  ;-576                                prs("\n jl  .");}//          SF!=OF
  3811                                  
  3812 000013E6 68[7914]                 push cmpneg_5
  3813 000013E9 E8F3EF                   call prs
  3814 000013EC 83C402                   add  sp, 2
  3815                                  
  3816                                  ;-577                            else{prs(" ;unsigned : "); prunsign1(ids);
  3817                                  
  3818 000013EF E91B00                   jmp .cmpneg191
  3819                                  .cmpneg190:
  3820 000013F2 68[8214]                 push cmpneg_6
  3821 000013F5 E8E7EF                   call prs
  3822 000013F8 83C402                   add  sp, 2
  3823 000013FB FF7604                   push word [bp+4]
  3824 000013FE E833F1                   call prunsign1
  3825 00001401 83C402                   add  sp, 2
  3826                                  
  3827                                  ;-578                                prs("\n jb  .");}//jb=jc=CF=1
  3828                                  
  3829 00001404 68[9014]                 push cmpneg_7
  3830 00001407 E8D5EF                   call prs
  3831 0000140A 83C402                   add  sp, 2
  3832                                  
  3833                                  ;-579   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF
  3834                                  
  3835                                  .cmpneg191:
  3836 0000140D E93500                   jmp .cmpneg192
  3837                                  .cmpneg189:
  3838 00001410 A1[2300]                 mov ax, [iscmp]
  3839 00001413 83F83C                   cmp ax, 60
  3840 00001416 0F850C00                 jne .cmpneg193
  3841 0000141A 68[9914]                 push cmpneg_8
  3842 0000141D E8BFEF                   call prs
  3843 00001420 83C402                   add  sp, 2
  3844                                  
  3845                                  ;-580   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF
  3846                                  
  3847 00001423 E91F00                   jmp .cmpneg194
  3848                                  .cmpneg193:
  3849 00001426 A1[2300]                 mov ax, [iscmp]
  3850 00001429 83F83E                   cmp ax, 62
  3851 0000142C 0F850C00                 jne .cmpneg195
  3852 00001430 68[A214]                 push cmpneg_9
  3853 00001433 E8A9EF                   call prs
  3854 00001436 83C402                   add  sp, 2
  3855                                  
  3856                                  ;-581   else error1("internal error compare unknown in CMPNEG()");  }
  3857                                  
  3858 00001439 E90900                   jmp .cmpneg196
  3859                                  .cmpneg195:
  3860 0000143C 68[AB14]                 push cmpneg_10
  3861 0000143F E859F1                   call error1
  3862 00001442 83C402                   add  sp, 2
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
  3874 00001445 C9                       LEAVE
  3875 00001446 C3                       ret
  3876 00001447 5C6E206A6E65202E00      cmpneg_0 db "\n jne .",0
  3877 00001450 5C6E206A6520202E00      cmpneg_1 db "\n je  .",0
  3878 00001459 5C6E206A6720202E00      cmpneg_2 db "\n jg  .",0
  3879 00001462 5C6E206A6120202E00      cmpneg_3 db "\n ja  .",0
  3880 0000146B 203B756E7369676E65-     cmpneg_4 db " ;unsigned : ",0
  3881 00001474 64203A2000         
  3882 00001479 5C6E206A6C20202E00      cmpneg_5 db "\n jl  .",0
  3883 00001482 203B756E7369676E65-     cmpneg_6 db " ;unsigned : ",0
  3884 0000148B 64203A2000         
  3885 00001490 5C6E206A6220202E00      cmpneg_7 db "\n jb  .",0
  3886 00001499 5C6E206A6765202E00      cmpneg_8 db "\n jge .",0
  3887 000014A2 5C6E206A6C65202E00      cmpneg_9 db "\n jle .",0
  3888 000014AB 696E7465726E616C20-     cmpneg_10 db "internal error compare unknown in CMPNEG()",0
  3889 000014B4 6572726F7220636F6D-
  3890 000014BD 7061726520756E6B6E-
  3891 000014C6 6F776E20696E20434D-
  3892 000014CF 504E4547282900     
  3893                                  ENDP
  3894                                  
  3895                                  isrelational: PROC
  3896                                  
  3897                                  ;-584     if (token==T_EQ) goto w; if (token==T_NE) goto w;
  3898                                  
  3899 000014D6 A1[1E00]                 mov ax, [token]
  3900 000014D9 3D2603                   cmp ax, 806
  3901 000014DC 0F850300                 jne .isrelational197
  3902 000014E0 E94700                   jmp .w
  3903                                  .isrelational197:
  3904 000014E3 A1[1E00]                 mov ax, [token]
  3905 000014E6 3D2703                   cmp ax, 807
  3906 000014E9 0F850300                 jne .isrelational198
  3907 000014ED E93A00                   jmp .w
  3908                                  
  3909                                  ;-585     if (token==T_LE) goto w; if (token==T_GE) goto w;
  3910                                  
  3911                                  .isrelational198:
  3912 000014F0 A1[1E00]                 mov ax, [token]
  3913 000014F3 3D3803                   cmp ax, 824
  3914 000014F6 0F850300                 jne .isrelational199
  3915 000014FA E92D00                   jmp .w
  3916                                  .isrelational199:
  3917 000014FD A1[1E00]                 mov ax, [token]
  3918 00001500 3D2B03                   cmp ax, 811
  3919 00001503 0F850300                 jne .isrelational200
  3920 00001507 E92000                   jmp .w
  3921                                  
  3922                                  ;-586     if (token=='<' ) goto w; if (token=='>' ) goto w;
  3923                                  
  3924                                  .isrelational200:
  3925 0000150A A1[1E00]                 mov ax, [token]
  3926 0000150D 83F83C                   cmp ax, 60
  3927 00001510 0F850300                 jne .isrelational201
  3928 00001514 E91300                   jmp .w
  3929                                  .isrelational201:
  3930 00001517 A1[1E00]                 mov ax, [token]
  3931 0000151A 83F83E                   cmp ax, 62
  3932 0000151D 0F850300                 jne .isrelational202
  3933 00001521 E90600                   jmp .w
  3934                                  
  3935                                  ;-587     return 0;  w: iscmp=token; token=getlex(); return 1;}
  3936                                  
  3937                                  .isrelational202:
  3938 00001524 B80000                   mov ax, 0
  3939 00001527 E91200                   jmp .retnisrelational
  3940                                  .w:
  3941 0000152A A1[1E00]                 mov ax, [token]
  3942 0000152D A3[2300]                 mov word [iscmp], ax
  3943 00001530 E812F3                   call getlex
  3944 00001533 A3[1E00]                 mov word [token], ax
  3945 00001536 B80100                   mov ax, 1
  3946 00001539 E90000                   jmp .retnisrelational
  3947                                  
  3948                                  ;-588 
  3949                                  
  3950                                  
  3951                                  ;-589 int checkreg() { // >=17 = 16bit, >=47 = 32bit
  3952                                  
  3953                                   .retnisrelational:
  3954 0000153C C3                       ret
  3955                                  ENDP
  3956                                  
  3957                                  checkreg: PROC
  3958                                  
  3959                                  ;-590   if (strlen(symbol) <  2) return 0;
  3960                                  
  3961 0000153D 8D06606D                 lea  ax, [symbol]
  3962 00001541 50                       push ax
  3963 00001542 E8BCEC                   call strlen
  3964 00001545 83C402                   add  sp, 2
  3965 00001548 83F802                   cmp ax, 2
  3966 0000154B 0F8D0600                 jge .checkreg203
  3967 0000154F B80000                   mov ax, 0
  3968 00001552 E94403                   jmp .retncheckreg
  3969                                  
  3970                                  ;-591   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;
  3971                                  
  3972                                  .checkreg203:
  3973 00001555 68[9A18]                 push checkreg_0
  3974 00001558 8D06606D                 lea  ax, [symbol]
  3975 0000155C 50                       push ax
  3976 0000155D E8FFEC                   call eqstr
  3977 00001560 83C404                   add  sp, 4
  3978 00001563 08C0                     or  al, al
  3979 00001565 0F840600                 je .checkreg204
  3980 00001569 B80100                   mov ax, 1
  3981 0000156C E92A03                   jmp .retncheckreg
  3982                                  .checkreg204:
  3983 0000156F 68[9D18]                 push checkreg_1
  3984 00001572 8D06606D                 lea  ax, [symbol]
  3985 00001576 50                       push ax
  3986 00001577 E8E5EC                   call eqstr
  3987 0000157A 83C404                   add  sp, 4
  3988 0000157D 08C0                     or  al, al
  3989 0000157F 0F840600                 je .checkreg205
  3990 00001583 B80300                   mov ax, 3
  3991 00001586 E91003                   jmp .retncheckreg
  3992                                  
  3993                                  ;-592   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;
  3994                                  
  3995                                  .checkreg205:
  3996 00001589 68[A018]                 push checkreg_2
  3997 0000158C 8D06606D                 lea  ax, [symbol]
  3998 00001590 50                       push ax
  3999 00001591 E8CBEC                   call eqstr
  4000 00001594 83C404                   add  sp, 4
  4001 00001597 08C0                     or  al, al
  4002 00001599 0F840600                 je .checkreg206
  4003 0000159D B80500                   mov ax, 5
  4004 000015A0 E9F602                   jmp .retncheckreg
  4005                                  .checkreg206:
  4006 000015A3 68[A318]                 push checkreg_3
  4007 000015A6 8D06606D                 lea  ax, [symbol]
  4008 000015AA 50                       push ax
  4009 000015AB E8B1EC                   call eqstr
  4010 000015AE 83C404                   add  sp, 4
  4011 000015B1 08C0                     or  al, al
  4012 000015B3 0F840600                 je .checkreg207
  4013 000015B7 B80700                   mov ax, 7
  4014 000015BA E9DC02                   jmp .retncheckreg
  4015                                  
  4016                                  ;-593   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;
  4017                                  
  4018                                  .checkreg207:
  4019 000015BD 68[A618]                 push checkreg_4
  4020 000015C0 8D06606D                 lea  ax, [symbol]
  4021 000015C4 50                       push ax
  4022 000015C5 E897EC                   call eqstr
  4023 000015C8 83C404                   add  sp, 4
  4024 000015CB 08C0                     or  al, al
  4025 000015CD 0F840600                 je .checkreg208
  4026 000015D1 B80900                   mov ax, 9
  4027 000015D4 E9C202                   jmp .retncheckreg
  4028                                  .checkreg208:
  4029 000015D7 68[A918]                 push checkreg_5
  4030 000015DA 8D06606D                 lea  ax, [symbol]
  4031 000015DE 50                       push ax
  4032 000015DF E87DEC                   call eqstr
  4033 000015E2 83C404                   add  sp, 4
  4034 000015E5 08C0                     or  al, al
  4035 000015E7 0F840600                 je .checkreg209
  4036 000015EB B80B00                   mov ax, 11
  4037 000015EE E9A802                   jmp .retncheckreg
  4038                                  
  4039                                  ;-594   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;
  4040                                  
  4041                                  .checkreg209:
  4042 000015F1 68[AC18]                 push checkreg_6
  4043 000015F4 8D06606D                 lea  ax, [symbol]
  4044 000015F8 50                       push ax
  4045 000015F9 E863EC                   call eqstr
  4046 000015FC 83C404                   add  sp, 4
  4047 000015FF 08C0                     or  al, al
  4048 00001601 0F840600                 je .checkreg210
  4049 00001605 B80D00                   mov ax, 13
  4050 00001608 E98E02                   jmp .retncheckreg
  4051                                  .checkreg210:
  4052 0000160B 68[AF18]                 push checkreg_7
  4053 0000160E 8D06606D                 lea  ax, [symbol]
  4054 00001612 50                       push ax
  4055 00001613 E849EC                   call eqstr
  4056 00001616 83C404                   add  sp, 4
  4057 00001619 08C0                     or  al, al
  4058 0000161B 0F840600                 je .checkreg211
  4059 0000161F B80F00                   mov ax, 15
  4060 00001622 E97402                   jmp .retncheckreg
  4061                                  
  4062                                  ;-595   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;
  4063                                  
  4064                                  .checkreg211:
  4065 00001625 68[B218]                 push checkreg_8
  4066 00001628 8D06606D                 lea  ax, [symbol]
  4067 0000162C 50                       push ax
  4068 0000162D E82FEC                   call eqstr
  4069 00001630 83C404                   add  sp, 4
  4070 00001633 08C0                     or  al, al
  4071 00001635 0F840600                 je .checkreg212
  4072 00001639 B81100                   mov ax, 17
  4073 0000163C E95A02                   jmp .retncheckreg
  4074                                  .checkreg212:
  4075 0000163F 68[B518]                 push checkreg_9
  4076 00001642 8D06606D                 lea  ax, [symbol]
  4077 00001646 50                       push ax
  4078 00001647 E815EC                   call eqstr
  4079 0000164A 83C404                   add  sp, 4
  4080 0000164D 08C0                     or  al, al
  4081 0000164F 0F840600                 je .checkreg213
  4082 00001653 B81300                   mov ax, 19
  4083 00001656 E94002                   jmp .retncheckreg
  4084                                  
  4085                                  ;-596   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;
  4086                                  
  4087                                  .checkreg213:
  4088 00001659 68[B818]                 push checkreg_10
  4089 0000165C 8D06606D                 lea  ax, [symbol]
  4090 00001660 50                       push ax
  4091 00001661 E8FBEB                   call eqstr
  4092 00001664 83C404                   add  sp, 4
  4093 00001667 08C0                     or  al, al
  4094 00001669 0F840600                 je .checkreg214
  4095 0000166D B81500                   mov ax, 21
  4096 00001670 E92602                   jmp .retncheckreg
  4097                                  .checkreg214:
  4098 00001673 68[BB18]                 push checkreg_11
  4099 00001676 8D06606D                 lea  ax, [symbol]
  4100 0000167A 50                       push ax
  4101 0000167B E8E1EB                   call eqstr
  4102 0000167E 83C404                   add  sp, 4
  4103 00001681 08C0                     or  al, al
  4104 00001683 0F840600                 je .checkreg215
  4105 00001687 B81700                   mov ax, 23
  4106 0000168A E90C02                   jmp .retncheckreg
  4107                                  
  4108                                  ;-597   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;
  4109                                  
  4110                                  .checkreg215:
  4111 0000168D 68[BE18]                 push checkreg_12
  4112 00001690 8D06606D                 lea  ax, [symbol]
  4113 00001694 50                       push ax
  4114 00001695 E8C7EB                   call eqstr
  4115 00001698 83C404                   add  sp, 4
  4116 0000169B 08C0                     or  al, al
  4117 0000169D 0F840600                 je .checkreg216
  4118 000016A1 B81900                   mov ax, 25
  4119 000016A4 E9F201                   jmp .retncheckreg
  4120                                  .checkreg216:
  4121 000016A7 68[C118]                 push checkreg_13
  4122 000016AA 8D06606D                 lea  ax, [symbol]
  4123 000016AE 50                       push ax
  4124 000016AF E8ADEB                   call eqstr
  4125 000016B2 83C404                   add  sp, 4
  4126 000016B5 08C0                     or  al, al
  4127 000016B7 0F840600                 je .checkreg217
  4128 000016BB B81B00                   mov ax, 27
  4129 000016BE E9D801                   jmp .retncheckreg
  4130                                  
  4131                                  ;-598   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;
  4132                                  
  4133                                  .checkreg217:
  4134 000016C1 68[C418]                 push checkreg_14
  4135 000016C4 8D06606D                 lea  ax, [symbol]
  4136 000016C8 50                       push ax
  4137 000016C9 E893EB                   call eqstr
  4138 000016CC 83C404                   add  sp, 4
  4139 000016CF 08C0                     or  al, al
  4140 000016D1 0F840600                 je .checkreg218
  4141 000016D5 B81D00                   mov ax, 29
  4142 000016D8 E9BE01                   jmp .retncheckreg
  4143                                  .checkreg218:
  4144 000016DB 68[C718]                 push checkreg_15
  4145 000016DE 8D06606D                 lea  ax, [symbol]
  4146 000016E2 50                       push ax
  4147 000016E3 E879EB                   call eqstr
  4148 000016E6 83C404                   add  sp, 4
  4149 000016E9 08C0                     or  al, al
  4150 000016EB 0F840600                 je .checkreg219
  4151 000016EF B81F00                   mov ax, 31
  4152 000016F2 E9A401                   jmp .retncheckreg
  4153                                  
  4154                                  ;-599   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;
  4155                                  
  4156                                  .checkreg219:
  4157 000016F5 68[CA18]                 push checkreg_16
  4158 000016F8 8D06606D                 lea  ax, [symbol]
  4159 000016FC 50                       push ax
  4160 000016FD E85FEB                   call eqstr
  4161 00001700 83C404                   add  sp, 4
  4162 00001703 08C0                     or  al, al
  4163 00001705 0F840600                 je .checkreg220
  4164 00001709 B82100                   mov ax, 33
  4165 0000170C E98A01                   jmp .retncheckreg
  4166                                  .checkreg220:
  4167 0000170F 68[CD18]                 push checkreg_17
  4168 00001712 8D06606D                 lea  ax, [symbol]
  4169 00001716 50                       push ax
  4170 00001717 E845EB                   call eqstr
  4171 0000171A 83C404                   add  sp, 4
  4172 0000171D 08C0                     or  al, al
  4173 0000171F 0F840600                 je .checkreg221
  4174 00001723 B82300                   mov ax, 35
  4175 00001726 E97001                   jmp .retncheckreg
  4176                                  
  4177                                  ;-600   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;
  4178                                  
  4179                                  .checkreg221:
  4180 00001729 68[D018]                 push checkreg_18
  4181 0000172C 8D06606D                 lea  ax, [symbol]
  4182 00001730 50                       push ax
  4183 00001731 E82BEB                   call eqstr
  4184 00001734 83C404                   add  sp, 4
  4185 00001737 08C0                     or  al, al
  4186 00001739 0F840600                 je .checkreg222
  4187 0000173D B82500                   mov ax, 37
  4188 00001740 E95601                   jmp .retncheckreg
  4189                                  .checkreg222:
  4190 00001743 68[D318]                 push checkreg_19
  4191 00001746 8D06606D                 lea  ax, [symbol]
  4192 0000174A 50                       push ax
  4193 0000174B E811EB                   call eqstr
  4194 0000174E 83C404                   add  sp, 4
  4195 00001751 08C0                     or  al, al
  4196 00001753 0F840600                 je .checkreg223
  4197 00001757 B82700                   mov ax, 39
  4198 0000175A E93C01                   jmp .retncheckreg
  4199                                  
  4200                                  ;-601   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;
  4201                                  
  4202                                  .checkreg223:
  4203 0000175D 68[D618]                 push checkreg_20
  4204 00001760 8D06606D                 lea  ax, [symbol]
  4205 00001764 50                       push ax
  4206 00001765 E8F7EA                   call eqstr
  4207 00001768 83C404                   add  sp, 4
  4208 0000176B 08C0                     or  al, al
  4209 0000176D 0F840600                 je .checkreg224
  4210 00001771 B82900                   mov ax, 41
  4211 00001774 E92201                   jmp .retncheckreg
  4212                                  .checkreg224:
  4213 00001777 68[D918]                 push checkreg_21
  4214 0000177A 8D06606D                 lea  ax, [symbol]
  4215 0000177E 50                       push ax
  4216 0000177F E8DDEA                   call eqstr
  4217 00001782 83C404                   add  sp, 4
  4218 00001785 08C0                     or  al, al
  4219 00001787 0F840600                 je .checkreg225
  4220 0000178B B82B00                   mov ax, 43
  4221 0000178E E90801                   jmp .retncheckreg
  4222                                  
  4223                                  ;-602   // (eqstr(symbol,"ip")) return 45;
  4224                                  
  4225                                  
  4226                                  ;-603   if (strlen(symbol) >   3) return 0;
  4227                                  
  4228                                  .checkreg225:
  4229 00001791 8D06606D                 lea  ax, [symbol]
  4230 00001795 50                       push ax
  4231 00001796 E868EA                   call strlen
  4232 00001799 83C402                   add  sp, 2
  4233 0000179C 83F803                   cmp ax, 3
  4234 0000179F 0F8E0600                 jle .checkreg226
  4235 000017A3 B80000                   mov ax, 0
  4236 000017A6 E9F000                   jmp .retncheckreg
  4237                                  
  4238                                  ;-604   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;
  4239                                  
  4240                                  .checkreg226:
  4241 000017A9 68[DC18]                 push checkreg_22
  4242 000017AC 8D06606D                 lea  ax, [symbol]
  4243 000017B0 50                       push ax
  4244 000017B1 E8ABEA                   call eqstr
  4245 000017B4 83C404                   add  sp, 4
  4246 000017B7 08C0                     or  al, al
  4247 000017B9 0F840600                 je .checkreg227
  4248 000017BD B82F00                   mov ax, 47
  4249 000017C0 E9D600                   jmp .retncheckreg
  4250                                  .checkreg227:
  4251 000017C3 68[E018]                 push checkreg_23
  4252 000017C6 8D06606D                 lea  ax, [symbol]
  4253 000017CA 50                       push ax
  4254 000017CB E891EA                   call eqstr
  4255 000017CE 83C404                   add  sp, 4
  4256 000017D1 08C0                     or  al, al
  4257 000017D3 0F840600                 je .checkreg228
  4258 000017D7 B83200                   mov ax, 50
  4259 000017DA E9BC00                   jmp .retncheckreg
  4260                                  
  4261                                  ;-605   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;
  4262                                  
  4263                                  .checkreg228:
  4264 000017DD 68[E418]                 push checkreg_24
  4265 000017E0 8D06606D                 lea  ax, [symbol]
  4266 000017E4 50                       push ax
  4267 000017E5 E877EA                   call eqstr
  4268 000017E8 83C404                   add  sp, 4
  4269 000017EB 08C0                     or  al, al
  4270 000017ED 0F840600                 je .checkreg229
  4271 000017F1 B83500                   mov ax, 53
  4272 000017F4 E9A200                   jmp .retncheckreg
  4273                                  .checkreg229:
  4274 000017F7 68[E818]                 push checkreg_25
  4275 000017FA 8D06606D                 lea  ax, [symbol]
  4276 000017FE 50                       push ax
  4277 000017FF E85DEA                   call eqstr
  4278 00001802 83C404                   add  sp, 4
  4279 00001805 08C0                     or  al, al
  4280 00001807 0F840600                 je .checkreg230
  4281 0000180B B83800                   mov ax, 56
  4282 0000180E E98800                   jmp .retncheckreg
  4283                                  
  4284                                  ;-606   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;
  4285                                  
  4286                                  .checkreg230:
  4287 00001811 68[EC18]                 push checkreg_26
  4288 00001814 8D06606D                 lea  ax, [symbol]
  4289 00001818 50                       push ax
  4290 00001819 E843EA                   call eqstr
  4291 0000181C 83C404                   add  sp, 4
  4292 0000181F 08C0                     or  al, al
  4293 00001821 0F840600                 je .checkreg231
  4294 00001825 B83B00                   mov ax, 59
  4295 00001828 E96E00                   jmp .retncheckreg
  4296                                  .checkreg231:
  4297 0000182B 68[F018]                 push checkreg_27
  4298 0000182E 8D06606D                 lea  ax, [symbol]
  4299 00001832 50                       push ax
  4300 00001833 E829EA                   call eqstr
  4301 00001836 83C404                   add  sp, 4
  4302 00001839 08C0                     or  al, al
  4303 0000183B 0F840600                 je .checkreg232
  4304 0000183F B83E00                   mov ax, 62
  4305 00001842 E95400                   jmp .retncheckreg
  4306                                  
  4307                                  ;-607   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;
  4308                                  
  4309                                  .checkreg232:
  4310 00001845 68[F418]                 push checkreg_28
  4311 00001848 8D06606D                 lea  ax, [symbol]
  4312 0000184C 50                       push ax
  4313 0000184D E80FEA                   call eqstr
  4314 00001850 83C404                   add  sp, 4
  4315 00001853 08C0                     or  al, al
  4316 00001855 0F840600                 je .checkreg233
  4317 00001859 B84100                   mov ax, 65
  4318 0000185C E93A00                   jmp .retncheckreg
  4319                                  .checkreg233:
  4320 0000185F 68[F818]                 push checkreg_29
  4321 00001862 8D06606D                 lea  ax, [symbol]
  4322 00001866 50                       push ax
  4323 00001867 E8F5E9                   call eqstr
  4324 0000186A 83C404                   add  sp, 4
  4325 0000186D 08C0                     or  al, al
  4326 0000186F 0F840600                 je .checkreg234
  4327 00001873 B84400                   mov ax, 68
  4328 00001876 E92000                   jmp .retncheckreg
  4329                                  
  4330                                  ;-608   if (eqstr(symbol,"cr0")) return 71;
  4331                                  
  4332                                  .checkreg234:
  4333 00001879 68[FC18]                 push checkreg_30
  4334 0000187C 8D06606D                 lea  ax, [symbol]
  4335 00001880 50                       push ax
  4336 00001881 E8DBE9                   call eqstr
  4337 00001884 83C404                   add  sp, 4
  4338 00001887 08C0                     or  al, al
  4339 00001889 0F840600                 je .checkreg235
  4340 0000188D B84700                   mov ax, 71
  4341 00001890 E90600                   jmp .retncheckreg
  4342                                  
  4343                                  ;-609   return 0;   }
  4344                                  
  4345                                  .checkreg235:
  4346 00001893 B80000                   mov ax, 0
  4347 00001896 E90000                   jmp .retncheckreg
  4348                                  
  4349                                  ;-610 
  4350                                  
  4351                                  
  4352                                  ;-611 char printregstr[]
  4353                                  
  4354                                   .retncheckreg:
  4355 00001899 C3                       ret
  4356 0000189A 616C00                  checkreg_0 db "al",0
  4357 0000189D 636C00                  checkreg_1 db "cl",0
  4358 000018A0 646C00                  checkreg_2 db "dl",0
  4359 000018A3 626C00                  checkreg_3 db "bl",0
  4360 000018A6 616800                  checkreg_4 db "ah",0
  4361 000018A9 636800                  checkreg_5 db "ch",0
  4362 000018AC 646800                  checkreg_6 db "dh",0
  4363 000018AF 626800                  checkreg_7 db "bh",0
  4364 000018B2 617800                  checkreg_8 db "ax",0
  4365 000018B5 637800                  checkreg_9 db "cx",0
  4366 000018B8 647800                  checkreg_10 db "dx",0
  4367 000018BB 627800                  checkreg_11 db "bx",0
  4368 000018BE 737000                  checkreg_12 db "sp",0
  4369 000018C1 627000                  checkreg_13 db "bp",0
  4370 000018C4 736900                  checkreg_14 db "si",0
  4371 000018C7 646900                  checkreg_15 db "di",0
  4372 000018CA 657300                  checkreg_16 db "es",0
  4373 000018CD 637300                  checkreg_17 db "cs",0
  4374 000018D0 737300                  checkreg_18 db "ss",0
  4375 000018D3 647300                  checkreg_19 db "ds",0
  4376 000018D6 667300                  checkreg_20 db "fs",0
  4377 000018D9 677300                  checkreg_21 db "gs",0
  4378 000018DC 65617800                checkreg_22 db "eax",0
  4379 000018E0 65637800                checkreg_23 db "ecx",0
  4380 000018E4 65647800                checkreg_24 db "edx",0
  4381 000018E8 65627800                checkreg_25 db "ebx",0
  4382 000018EC 65737000                checkreg_26 db "esp",0
  4383 000018F0 65627000                checkreg_27 db "ebp",0
  4384 000018F4 65736900                checkreg_28 db "esi",0
  4385 000018F8 65646900                checkreg_29 db "edi",0
  4386 000018FC 63723000                checkreg_30 db "cr0",0
  4387                                  ENDP
  4388                                  
  4389                                  ;-612 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";
  4390                                  
  4391 00001900 2A616C636C646C626C-     printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0
  4392 00001909 616863686468626861-
  4393 00001912 786378647862787370-
  4394 0000191B 627073696469657363-
  4395 00001924 737373647366736773-
  4396 0000192D 697065617865637865-
  4397 00001936 647865627865737065-
  4398 0000193F 627065736965646963-
  4399 00001948 723000             
  4400                                  
  4401                                  ;-613 
  4402                                  
  4403                                  
  4404                                  ;-614 int printreg(int i) {  unsigned int k; unsigned char c;
  4405                                  
  4406                                  
  4407                                  printreg: PROC
  4408                                  
  4409                                  ;-615   k = &printregstr + i; c=*k; prc(c); i++;
  4410                                  ;
  4411 0000194B C8040000                 ENTER  4,0
  4412 0000194F B8[0019]                 mov ax, printregstr
  4413 00001952 034604                   add ax, [bp+4]
  4414 00001955 8946FE                   mov [bp-2], ax
  4415 00001958 8B5EFE                   mov bx, [bp-2]
  4416 0000195B 8B07                     mov ax, [bx]
  4417 0000195D 8846FC                   mov [bp-4], al
  4418 00001960 8A46FC                   mov al, byte [bp-4]
  4419 00001963 B400                     mov ah, 0
  4420 00001965 50                       push ax
  4421 00001966 E81DEA                   call prc
  4422 00001969 83C402                   add  sp, 2
  4423 0000196C FF4604                   inc  word[bp+4]
  4424                                  
  4425                                  ;-616   k = &printregstr + i; c=*k; prc(c);
  4426                                  
  4427 0000196F B8[0019]                 mov ax, printregstr
  4428 00001972 034604                   add ax, [bp+4]
  4429 00001975 8946FE                   mov [bp-2], ax
  4430 00001978 8B5EFE                   mov bx, [bp-2]
  4431 0000197B 8B07                     mov ax, [bx]
  4432 0000197D 8846FC                   mov [bp-4], al
  4433 00001980 8A46FC                   mov al, byte [bp-4]
  4434 00001983 B400                     mov ah, 0
  4435 00001985 50                       push ax
  4436 00001986 E8FDE9                   call prc
  4437 00001989 83C402                   add  sp, 2
  4438                                  
  4439                                  ;-617   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }
  4440                                  
  4441 0000198C 8B4604                   mov ax, [bp+4]
  4442 0000198F 83F82F                   cmp ax, 47
  4443 00001992 0F8E2000                 jle .printreg236
  4444 00001996 FF4604                   inc  word[bp+4]
  4445 00001999 B8[0019]                 mov ax, printregstr
  4446 0000199C 034604                   add ax, [bp+4]
  4447 0000199F 8946FE                   mov [bp-2], ax
  4448 000019A2 8B5EFE                   mov bx, [bp-2]
  4449 000019A5 8B07                     mov ax, [bx]
  4450 000019A7 8846FC                   mov [bp-4], al
  4451 000019AA 8A46FC                   mov al, byte [bp-4]
  4452 000019AD B400                     mov ah, 0
  4453 000019AF 50                       push ax
  4454 000019B0 E8D3E9                   call prc
  4455 000019B3 83C402                   add  sp, 2
  4456                                  
  4457                                  ;-618 }
  4458                                  
  4459                                  .printreg236:
  4460                                  
  4461                                  ;-619 
  4462                                  
  4463                                  
  4464                                  ;-620 int constantexpr() { int mode; int id1;int ids;
  4465 000019B6 C9                       LEAVE
  4466 000019B7 C3                       ret
  4467                                  ENDP
  4468                                  
  4469                                  constantexpr: PROC
  4470                                  
  4471                                  ;-621   token=getlex();   mode=typeName();
  4472                                  ;
  4473 000019B8 C8060000                 ENTER  6,0
  4474 000019BC E886EE                   call getlex
  4475 000019BF A3[1E00]                 mov word [token], ax
  4476 000019C2 E827F7                   call typeName
  4477 000019C5 8946FE                   mov [bp-2], ax
  4478                                  
  4479                                  ;-622   id1=searchname(); gettypes(id1); ids=signi;
  4480                                  
  4481 000019C8 E8C3F6                   call searchname
  4482 000019CB 8946FC                   mov [bp-4], ax
  4483 000019CE FF76FC                   push word [bp-4]
  4484 000019D1 E8F1F7                   call gettypes
  4485 000019D4 83C402                   add  sp, 2
  4486 000019D7 A1[3000]                 mov ax, [signi]
  4487 000019DA 8946FA                   mov [bp-6], ax
  4488                                  
  4489                                  ;-623   if (isrelational() ==0) error1("Relational expression expected");
  4490                                  
  4491 000019DD E8F6FA                   call isrelational
  4492 000019E0 83F800                   cmp ax, 0
  4493 000019E3 0F850900                 jne .constantexpr237
  4494 000019E7 68[6D1A]                 push constantexpr_0
  4495 000019EA E8AEEB                   call error1
  4496 000019ED 83C402                   add  sp, 2
  4497                                  
  4498                                  ;-624   expect(T_CONST);  prs(" ; constant expression");
  4499                                  
  4500                                  .constantexpr237:
  4501 000019F0 680101                   push 257
  4502 000019F3 E823F5                   call expect
  4503 000019F6 83C402                   add  sp, 2
  4504 000019F9 68[8C1A]                 push constantexpr_1
  4505 000019FC E8E0E9                   call prs
  4506 000019FF 83C402                   add  sp, 2
  4507                                  
  4508                                  ;-625   prs("\ncmp ");
  4509                                  
  4510 00001A02 68[A31A]                 push constantexpr_2
  4511 00001A05 E8D7E9                   call prs
  4512 00001A08 83C402                   add  sp, 2
  4513                                  
  4514                                  ;-626   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  4515                                  
  4516 00001A0B FF76FC                   push word [bp-4]
  4517 00001A0E E8B4F7                   call gettypes
  4518 00001A11 83C402                   add  sp, 2
  4519 00001A14 A1[3600]                 mov ax, [wi]
  4520 00001A17 83F802                   cmp ax, 2
  4521 00001A1A 0F850C00                 jne .constantexpr238
  4522 00001A1E 68[AA1A]                 push constantexpr_3
  4523 00001A21 E8BBE9                   call prs
  4524 00001A24 83C402                   add  sp, 2
  4525 00001A27 E90900                   jmp .constantexpr239
  4526                                  .constantexpr238:
  4527 00001A2A 68[AF1A]                 push constantexpr_4
  4528 00001A2D E8AFE9                   call prs
  4529 00001A30 83C402                   add  sp, 2
  4530                                  
  4531                                  ;-627   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);
  4532                                  
  4533                                  .constantexpr239:
  4534 00001A33 FF76FC                   push word [bp-4]
  4535 00001A36 E848F5                   call v
  4536 00001A39 83C402                   add  sp, 2
  4537 00001A3C 68[B41A]                 push constantexpr_5
  4538 00001A3F E89DE9                   call prs
  4539 00001A42 83C402                   add  sp, 2
  4540 00001A45 FF36[2B00]               push word [lexval]
  4541 00001A49 E8E8EA                   call prunsign1
  4542 00001A4C 83C402                   add  sp, 2
  4543 00001A4F FF76FA                   push word [bp-6]
  4544 00001A52 E811F9                   call cmpneg
  4545 00001A55 83C402                   add  sp, 2
  4546 00001A58 8D06E06D                 lea  ax, [fname]
  4547 00001A5C 50                       push ax
  4548 00001A5D E87FE9                   call prs
  4549 00001A60 83C402                   add  sp, 2
  4550                                  
  4551                                  ;-628   expect(')');
  4552                                  
  4553 00001A63 6A29                     push 41
  4554 00001A65 E8B1F4                   call expect
  4555 00001A68 83C402                   add  sp, 2
  4556                                  
  4557                                  ;-629 }
  4558                                  
  4559                                  
  4560                                  ;-630 
  4561                                  
  4562                                  
  4563                                  ;-631 char ops[5];
  4564 00001A6B C9                       LEAVE
  4565 00001A6C C3                       ret
  4566 00001A6D 52656C6174696F6E61-     constantexpr_0 db "Relational expression expected",0
  4567 00001A76 6C2065787072657373-
  4568 00001A7F 696F6E206578706563-
  4569 00001A88 74656400           
  4570 00001A8C 203B20636F6E737461-     constantexpr_1 db " ; constant expression",0
  4571 00001A95 6E7420657870726573-
  4572 00001A9E 73696F6E00         
  4573 00001AA3 5C6E636D702000          constantexpr_2 db "\ncmp ",0
  4574 00001AAA 776F726400              constantexpr_3 db "word",0
  4575 00001AAF 6279746500              constantexpr_4 db "byte",0
  4576 00001AB4 2C2000                  constantexpr_5 db ", ",0
  4577                                  ENDP
  4578                                  section .bss
  4579                                  absolute 41737
  4580 0000A309 <res 00000005>          ops resb 5
  4581                                  section .text
  4582                                  
  4583                                  ;-632 int doreg1(int iscmp1) { int i;
  4584                                  
  4585                                  
  4586                                  doreg1: PROC
  4587                                  
  4588                                  ;-633   if (istoken('='))          strcpy(ops, "mov");
  4589                                  ;
  4590 00001AB7 C8020000                 ENTER  2,0
  4591 00001ABB 6A3D                     push 61
  4592 00001ABD E837F4                   call istoken
  4593 00001AC0 83C402                   add  sp, 2
  4594 00001AC3 08C0                     or  al, al
  4595 00001AC5 0F840E00                 je .doreg1240
  4596 00001AC9 68[701C]                 push doreg1_0
  4597 00001ACC 8D0609A3                 lea  ax, [ops]
  4598 00001AD0 50                       push ax
  4599 00001AD1 E855E7                   call strcpy
  4600 00001AD4 83C404                   add  sp, 4
  4601                                  
  4602                                  ;-634   if (istoken(T_PLUSASS))    strcpy(ops, "add");
  4603                                  
  4604                                  .doreg1240:
  4605 00001AD7 68CE04                   push 1230
  4606 00001ADA E81AF4                   call istoken
  4607 00001ADD 83C402                   add  sp, 2
  4608 00001AE0 08C0                     or  al, al
  4609 00001AE2 0F840E00                 je .doreg1241
  4610 00001AE6 68[741C]                 push doreg1_1
  4611 00001AE9 8D0609A3                 lea  ax, [ops]
  4612 00001AED 50                       push ax
  4613 00001AEE E838E7                   call strcpy
  4614 00001AF1 83C404                   add  sp, 4
  4615                                  
  4616                                  ;-635   if (istoken(T_MINUSASS))   strcpy(ops, "sub");
  4617                                  
  4618                                  .doreg1241:
  4619 00001AF4 68CF04                   push 1231
  4620 00001AF7 E8FDF3                   call istoken
  4621 00001AFA 83C402                   add  sp, 2
  4622 00001AFD 08C0                     or  al, al
  4623 00001AFF 0F840E00                 je .doreg1242
  4624 00001B03 68[781C]                 push doreg1_2
  4625 00001B06 8D0609A3                 lea  ax, [ops]
  4626 00001B0A 50                       push ax
  4627 00001B0B E81BE7                   call strcpy
  4628 00001B0E 83C404                   add  sp, 4
  4629                                  
  4630                                  ;-636   if (istoken(T_ANDASS))     strcpy(ops, "and");
  4631                                  
  4632                                  .doreg1242:
  4633 00001B11 68D204                   push 1234
  4634 00001B14 E8E0F3                   call istoken
  4635 00001B17 83C402                   add  sp, 2
  4636 00001B1A 08C0                     or  al, al
  4637 00001B1C 0F840E00                 je .doreg1243
  4638 00001B20 68[7C1C]                 push doreg1_3
  4639 00001B23 8D0609A3                 lea  ax, [ops]
  4640 00001B27 50                       push ax
  4641 00001B28 E8FEE6                   call strcpy
  4642 00001B2B 83C404                   add  sp, 4
  4643                                  
  4644                                  ;-637   if (istoken(T_ORASS))      strcpy(ops, "or" );
  4645                                  
  4646                                  .doreg1243:
  4647 00001B2E 68D304                   push 1235
  4648 00001B31 E8C3F3                   call istoken
  4649 00001B34 83C402                   add  sp, 2
  4650 00001B37 08C0                     or  al, al
  4651 00001B39 0F840E00                 je .doreg1244
  4652 00001B3D 68[801C]                 push doreg1_4
  4653 00001B40 8D0609A3                 lea  ax, [ops]
  4654 00001B44 50                       push ax
  4655 00001B45 E8E1E6                   call strcpy
  4656 00001B48 83C404                   add  sp, 4
  4657                                  
  4658                                  ;-638   if (istoken(T_LESSLESS))   strcpy(ops, "shl");
  4659                                  
  4660                                  .doreg1244:
  4661 00001B4B 68D804                   push 1240
  4662 00001B4E E8A6F3                   call istoken
  4663 00001B51 83C402                   add  sp, 2
  4664 00001B54 08C0                     or  al, al
  4665 00001B56 0F840E00                 je .doreg1245
  4666 00001B5A 68[831C]                 push doreg1_5
  4667 00001B5D 8D0609A3                 lea  ax, [ops]
  4668 00001B61 50                       push ax
  4669 00001B62 E8C4E6                   call strcpy
  4670 00001B65 83C404                   add  sp, 4
  4671                                  
  4672                                  ;-639   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");
  4673                                  
  4674                                  .doreg1245:
  4675 00001B68 68D904                   push 1241
  4676 00001B6B E889F3                   call istoken
  4677 00001B6E 83C402                   add  sp, 2
  4678 00001B71 08C0                     or  al, al
  4679 00001B73 0F840E00                 je .doreg1246
  4680 00001B77 68[871C]                 push doreg1_6
  4681 00001B7A 8D0609A3                 lea  ax, [ops]
  4682 00001B7E 50                       push ax
  4683 00001B7F E8A7E6                   call strcpy
  4684 00001B82 83C404                   add  sp, 4
  4685                                  
  4686                                  ;-640   if (iscmp1 == 1) { token=getlex();
  4687                                  
  4688                                  .doreg1246:
  4689 00001B85 8B4604                   mov ax, [bp+4]
  4690 00001B88 83F801                   cmp ax, 1
  4691 00001B8B 0F852700                 jne .doreg1247
  4692 00001B8F E8B3EC                   call getlex
  4693 00001B92 A3[1E00]                 mov word [token], ax
  4694                                  
  4695                                  ;-641       if (isrelational() ==0) error1("Relational expected");
  4696                                  
  4697 00001B95 E83EF9                   call isrelational
  4698 00001B98 83F800                   cmp ax, 0
  4699 00001B9B 0F850900                 jne .doreg1248
  4700 00001B9F 68[8B1C]                 push doreg1_7
  4701 00001BA2 E8F6E9                   call error1
  4702 00001BA5 83C402                   add  sp, 2
  4703                                  
  4704                                  ;-642       strcpy(ops, "cmp"); }
  4705                                  
  4706                                  .doreg1248:
  4707 00001BA8 68[9F1C]                 push doreg1_8
  4708 00001BAB 8D0609A3                 lea  ax, [ops]
  4709 00001BAF 50                       push ax
  4710 00001BB0 E876E6                   call strcpy
  4711 00001BB3 83C404                   add  sp, 4
  4712                                  
  4713                                  ;-643   prs("\n "); prs(ops); prs("  "); printreg(ireg1); prs(", ");
  4714                                  
  4715                                  .doreg1247:
  4716 00001BB6 68[A31C]                 push doreg1_9
  4717 00001BB9 E823E8                   call prs
  4718 00001BBC 83C402                   add  sp, 2
  4719 00001BBF 8D0609A3                 lea  ax, [ops]
  4720 00001BC3 50                       push ax
  4721 00001BC4 E818E8                   call prs
  4722 00001BC7 83C402                   add  sp, 2
  4723 00001BCA 68[A71C]                 push doreg1_10
  4724 00001BCD E80FE8                   call prs
  4725 00001BD0 83C402                   add  sp, 2
  4726 00001BD3 FF36[4B00]               push word [ireg1]
  4727 00001BD7 E871FD                   call printreg
  4728 00001BDA 83C402                   add  sp, 2
  4729 00001BDD 68[AA1C]                 push doreg1_11
  4730 00001BE0 E8FCE7                   call prs
  4731 00001BE3 83C402                   add  sp, 2
  4732                                  
  4733                                  ;-644 
  4734                                  
  4735                                  
  4736                                  ;-645   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}
  4737                                  
  4738 00001BE6 680101                   push 257
  4739 00001BE9 E80BF3                   call istoken
  4740 00001BEC 83C402                   add  sp, 2
  4741 00001BEF 08C0                     or  al, al
  4742 00001BF1 0F840D00                 je .doreg1249
  4743 00001BF5 FF36[2B00]               push word [lexval]
  4744 00001BF9 E838E9                   call prunsign1
  4745 00001BFC 83C402                   add  sp, 2
  4746 00001BFF E94700                   jmp .reg1
  4747                                  
  4748                                  ;-646   mod2=typeName(); ireg2=checkreg();
  4749                                  
  4750                                  .doreg1249:
  4751 00001C02 E8E7F4                   call typeName
  4752 00001C05 A3[4D00]                 mov word [mod2], ax
  4753 00001C08 E832F9                   call checkreg
  4754 00001C0B A3[4F00]                 mov word [ireg2], ax
  4755                                  
  4756                                  ;-647   if (ireg2) {printreg(ireg2); goto reg1;}
  4757                                  
  4758 00001C0E A1[4F00]                 mov ax, [ireg2]
  4759 00001C11 08C0                     or  al, al
  4760 00001C13 0F840D00                 je .doreg1250
  4761 00001C17 FF36[4F00]               push word [ireg2]
  4762 00001C1B E82DFD                   call printreg
  4763 00001C1E 83C402                   add  sp, 2
  4764 00001C21 E92500                   jmp .reg1
  4765                                  
  4766                                  ;-648   i=searchname();  if (mod2 == 2) printName(i); else v(i);
  4767                                  
  4768                                  .doreg1250:
  4769 00001C24 E867F4                   call searchname
  4770 00001C27 8946FE                   mov [bp-2], ax
  4771 00001C2A A1[4D00]                 mov ax, [mod2]
  4772 00001C2D 83F802                   cmp ax, 2
  4773 00001C30 0F850C00                 jne .doreg1251
  4774 00001C34 FF76FE                   push word [bp-2]
  4775 00001C37 E869EB                   call printName
  4776 00001C3A 83C402                   add  sp, 2
  4777 00001C3D E90900                   jmp .doreg1252
  4778                                  .doreg1251:
  4779 00001C40 FF76FE                   push word [bp-2]
  4780 00001C43 E83BF3                   call v
  4781 00001C46 83C402                   add  sp, 2
  4782                                  
  4783                                  ;-649   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }
  4784                                  
  4785                                  .doreg1252:
  4786                                  .reg1:
  4787 00001C49 8B4604                   mov ax, [bp+4]
  4788 00001C4C 83F801                   cmp ax, 1
  4789 00001C4F 0F851B00                 jne .doreg1253
  4790 00001C53 6A00                     push 0
  4791 00001C55 E80EF7                   call cmpneg
  4792 00001C58 83C402                   add  sp, 2
  4793 00001C5B 8D06E06D                 lea  ax, [fname]
  4794 00001C5F 50                       push ax
  4795 00001C60 E87CE7                   call prs
  4796 00001C63 83C402                   add  sp, 2
  4797 00001C66 6A29                     push 41
  4798 00001C68 E8AEF2                   call expect
  4799 00001C6B 83C402                   add  sp, 2
  4800                                  
  4801                                  ;-650 }
  4802                                  
  4803                                  .doreg1253:
  4804                                  
  4805                                  ;-651 
  4806                                  
  4807                                  
  4808                                  ;-652 int compoundass(char *op, int mode, int id1) {
  4809 00001C6E C9                       LEAVE
  4810 00001C6F C3                       ret
  4811 00001C70 6D6F7600                doreg1_0 db "mov",0
  4812 00001C74 61646400                doreg1_1 db "add",0
  4813 00001C78 73756200                doreg1_2 db "sub",0
  4814 00001C7C 616E6400                doreg1_3 db "and",0
  4815 00001C80 6F7200                  doreg1_4 db "or",0
  4816 00001C83 73686C00                doreg1_5 db "shl",0
  4817 00001C87 73687200                doreg1_6 db "shr",0
  4818 00001C8B 52656C6174696F6E61-     doreg1_7 db "Relational expected",0
  4819 00001C94 6C2065787065637465-
  4820 00001C9D 6400               
  4821 00001C9F 636D7000                doreg1_8 db "cmp",0
  4822 00001CA3 5C6E2000                doreg1_9 db "\n ",0
  4823 00001CA7 202000                  doreg1_10 db "  ",0
  4824 00001CAA 2C2000                  doreg1_11 db ", ",0
  4825                                  ENDP
  4826                                  
  4827                                  compoundass: PROC
  4828                                  
  4829                                  ;-653   if(mode) error1("only scalar Var allowed");
  4830                                  ;
  4831 00001CAD C8000000                 ENTER  0,0
  4832 00001CB1 8B4606                   mov ax, [bp+6]
  4833 00001CB4 08C0                     or  al, al
  4834 00001CB6 0F840900                 je .compoundass254
  4835 00001CBA 68[2D1D]                 push compoundass_0
  4836 00001CBD E8DBE8                   call error1
  4837 00001CC0 83C402                   add  sp, 2
  4838                                  
  4839                                  ;-654   prs("\n "); prs(op); prs("  ");
  4840                                  
  4841                                  .compoundass254:
  4842 00001CC3 68[451D]                 push compoundass_1
  4843 00001CC6 E816E7                   call prs
  4844 00001CC9 83C402                   add  sp, 2
  4845 00001CCC FF7604                   push word [bp+4]
  4846 00001CCF E80DE7                   call prs
  4847 00001CD2 83C402                   add  sp, 2
  4848 00001CD5 68[491D]                 push compoundass_2
  4849 00001CD8 E804E7                   call prs
  4850 00001CDB 83C402                   add  sp, 2
  4851                                  
  4852                                  ;-655   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  4853                                  
  4854 00001CDE FF7608                   push word [bp+8]
  4855 00001CE1 E8E1F4                   call gettypes
  4856 00001CE4 83C402                   add  sp, 2
  4857 00001CE7 A1[3600]                 mov ax, [wi]
  4858 00001CEA 83F802                   cmp ax, 2
  4859 00001CED 0F850C00                 jne .compoundass255
  4860 00001CF1 68[4C1D]                 push compoundass_3
  4861 00001CF4 E8E8E6                   call prs
  4862 00001CF7 83C402                   add  sp, 2
  4863 00001CFA E90900                   jmp .compoundass256
  4864                                  .compoundass255:
  4865 00001CFD 68[511D]                 push compoundass_4
  4866 00001D00 E8DCE6                   call prs
  4867 00001D03 83C402                   add  sp, 2
  4868                                  
  4869                                  ;-656   v(id1); prs(", ");
  4870                                  
  4871                                  .compoundass256:
  4872 00001D06 FF7608                   push word [bp+8]
  4873 00001D09 E875F2                   call v
  4874 00001D0C 83C402                   add  sp, 2
  4875 00001D0F 68[561D]                 push compoundass_5
  4876 00001D12 E8CAE6                   call prs
  4877 00001D15 83C402                   add  sp, 2
  4878                                  
  4879                                  ;-657   expect(T_CONST); prunsign1(lexval);
  4880                                  
  4881 00001D18 680101                   push 257
  4882 00001D1B E8FBF1                   call expect
  4883 00001D1E 83C402                   add  sp, 2
  4884 00001D21 FF36[2B00]               push word [lexval]
  4885 00001D25 E80CE8                   call prunsign1
  4886 00001D28 83C402                   add  sp, 2
  4887                                  
  4888                                  ;-658 }
  4889                                  
  4890                                  
  4891                                  ;-659 int dovar1(int mode, int op, int ixarr, int id1) {
  4892 00001D2B C9                       LEAVE
  4893 00001D2C C3                       ret
  4894 00001D2D 6F6E6C79207363616C-     compoundass_0 db "only scalar Var allowed",0
  4895 00001D36 61722056617220616C-
  4896 00001D3F 6C6F77656400       
  4897 00001D45 5C6E2000                compoundass_1 db "\n ",0
  4898 00001D49 202000                  compoundass_2 db "  ",0
  4899 00001D4C 776F726400              compoundass_3 db "word",0
  4900 00001D51 6279746500              compoundass_4 db "byte",0
  4901 00001D56 2C2000                  compoundass_5 db ", ",0
  4902                                  ENDP
  4903                                  
  4904                                  dovar1: PROC
  4905                                  
  4906                                  ;-660   gettypes(id1);
  4907                                  ;
  4908 00001D59 C8000000                 ENTER  0,0
  4909 00001D5D FF760A                   push word [bp+10]
  4910 00001D60 E862F4                   call gettypes
  4911 00001D63 83C402                   add  sp, 2
  4912                                  
  4913                                  ;-661   if (mode==1) {prs("\n mov bx, "); v(id1); prs("\n "); prs(op);
  4914                                  
  4915 00001D66 8B4604                   mov ax, [bp+4]
  4916 00001D69 83F801                   cmp ax, 1
  4917 00001D6C 0F854D00                 jne .dovar1257
  4918 00001D70 68[C01E]                 push dovar1_0
  4919 00001D73 E869E6                   call prs
  4920 00001D76 83C402                   add  sp, 2
  4921 00001D79 FF760A                   push word [bp+10]
  4922 00001D7C E802F2                   call v
  4923 00001D7F 83C402                   add  sp, 2
  4924 00001D82 68[CC1E]                 push dovar1_1
  4925 00001D85 E857E6                   call prs
  4926 00001D88 83C402                   add  sp, 2
  4927 00001D8B FF7606                   push word [bp+6]
  4928 00001D8E E84EE6                   call prs
  4929 00001D91 83C402                   add  sp, 2
  4930                                  
  4931                                  ;-662     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");
  4932                                  
  4933 00001D94 A1[3300]                 mov ax, [widthi]
  4934 00001D97 83F801                   cmp ax, 1
  4935 00001D9A 0F850900                 jne .dovar1258
  4936 00001D9E 68[D01E]                 push dovar1_2
  4937 00001DA1 E83BE6                   call prs
  4938 00001DA4 83C402                   add  sp, 2
  4939                                  
  4940                                  ;-663     if(widthi == 2) prs(" ax, [bx]");
  4941                                  
  4942                                  .dovar1258:
  4943 00001DA7 A1[3300]                 mov ax, [widthi]
  4944 00001DAA 83F802                   cmp ax, 2
  4945 00001DAD 0F850900                 jne .dovar1259
  4946 00001DB1 68[E61E]                 push dovar1_3
  4947 00001DB4 E828E6                   call prs
  4948 00001DB7 83C402                   add  sp, 2
  4949                                  
  4950                                  ;-664     return; }
  4951                                  
  4952                                  .dovar1259:
  4953 00001DBA E90101                   jmp .retndovar1
  4954                                  
  4955                                  ;-665   if (mode==2){prs("\n ");prs(op);prs(" ax, "); printName(id1); return; }
  4956                                  
  4957                                  .dovar1257:
  4958 00001DBD 8B4604                   mov ax, [bp+4]
  4959 00001DC0 83F802                   cmp ax, 2
  4960 00001DC3 0F852700                 jne .dovar1260
  4961 00001DC7 68[F01E]                 push dovar1_4
  4962 00001DCA E812E6                   call prs
  4963 00001DCD 83C402                   add  sp, 2
  4964 00001DD0 FF7606                   push word [bp+6]
  4965 00001DD3 E809E6                   call prs
  4966 00001DD6 83C402                   add  sp, 2
  4967 00001DD9 68[F41E]                 push dovar1_5
  4968 00001DDC E800E6                   call prs
  4969 00001DDF 83C402                   add  sp, 2
  4970 00001DE2 FF760A                   push word [bp+10]
  4971 00001DE5 E8BBE9                   call printName
  4972 00001DE8 83C402                   add  sp, 2
  4973 00001DEB E9D000                   jmp .retndovar1
  4974                                  
  4975                                  ;-666   if (ixarr) {
  4976                                  
  4977                                  .dovar1260:
  4978 00001DEE 8B4608                   mov ax, [bp+8]
  4979 00001DF1 08C0                     or  al, al
  4980 00001DF3 0F847300                 je .dovar1261
  4981                                  
  4982                                  ;-667     prs("\n mov bx, "); v(ixarr);
  4983                                  
  4984 00001DF7 68[FA1E]                 push dovar1_6
  4985 00001DFA E8E2E5                   call prs
  4986 00001DFD 83C402                   add  sp, 2
  4987 00001E00 FF7608                   push word [bp+8]
  4988 00001E03 E87BF1                   call v
  4989 00001E06 83C402                   add  sp, 2
  4990                                  
  4991                                  ;-668     if (wi==2) prs("\n shl bx, 1");
  4992                                  
  4993 00001E09 A1[3600]                 mov ax, [wi]
  4994 00001E0C 83F802                   cmp ax, 2
  4995 00001E0F 0F850900                 jne .dovar1262
  4996 00001E13 68[061F]                 push dovar1_7
  4997 00001E16 E8C6E5                   call prs
  4998 00001E19 83C402                   add  sp, 2
  4999                                  
  5000                                  ;-669     prs("\n "); prs(op);
  5001                                  
  5002                                  .dovar1262:
  5003 00001E1C 68[131F]                 push dovar1_8
  5004 00001E1F E8BDE5                   call prs
  5005 00001E22 83C402                   add  sp, 2
  5006 00001E25 FF7606                   push word [bp+6]
  5007 00001E28 E8B4E5                   call prs
  5008 00001E2B 83C402                   add  sp, 2
  5009                                  
  5010                                  ;-670     if (wi==2) prs(" ax, "); else prs(" al, ");
  5011                                  
  5012 00001E2E A1[3600]                 mov ax, [wi]
  5013 00001E31 83F802                   cmp ax, 2
  5014 00001E34 0F850C00                 jne .dovar1263
  5015 00001E38 68[171F]                 push dovar1_9
  5016 00001E3B E8A1E5                   call prs
  5017 00001E3E 83C402                   add  sp, 2
  5018 00001E41 E90900                   jmp .dovar1264
  5019                                  .dovar1263:
  5020 00001E44 68[1D1F]                 push dovar1_10
  5021 00001E47 E895E5                   call prs
  5022 00001E4A 83C402                   add  sp, 2
  5023                                  
  5024                                  ;-671 // v(id1); prs(" [bx]");
  5025                                  
  5026                                  
  5027                                  ;-672     prc('['); printName(id1); prs(" + bx]");
  5028                                  
  5029                                  .dovar1264:
  5030 00001E4D 6A5B                     push 91
  5031 00001E4F E834E5                   call prc
  5032 00001E52 83C402                   add  sp, 2
  5033 00001E55 FF760A                   push word [bp+10]
  5034 00001E58 E848E9                   call printName
  5035 00001E5B 83C402                   add  sp, 2
  5036 00001E5E 68[231F]                 push dovar1_11
  5037 00001E61 E87BE5                   call prs
  5038 00001E64 83C402                   add  sp, 2
  5039                                  
  5040                                  ;-673     return; }
  5041                                  
  5042 00001E67 E95400                   jmp .retndovar1
  5043                                  
  5044                                  ;-674   prs("\n ");prs(op);
  5045                                  
  5046                                  .dovar1261:
  5047 00001E6A 68[2A1F]                 push dovar1_12
  5048 00001E6D E86FE5                   call prs
  5049 00001E70 83C402                   add  sp, 2
  5050 00001E73 FF7606                   push word [bp+6]
  5051 00001E76 E866E5                   call prs
  5052 00001E79 83C402                   add  sp, 2
  5053                                  
  5054                                  ;-675   if(wi==1) prs(" al, ");
  5055                                  
  5056 00001E7C A1[3600]                 mov ax, [wi]
  5057 00001E7F 83F801                   cmp ax, 1
  5058 00001E82 0F850900                 jne .dovar1265
  5059 00001E86 68[2E1F]                 push dovar1_13
  5060 00001E89 E853E5                   call prs
  5061 00001E8C 83C402                   add  sp, 2
  5062                                  
  5063                                  ;-676   if(wi==2) prs(" ax, ");
  5064                                  
  5065                                  .dovar1265:
  5066 00001E8F A1[3600]                 mov ax, [wi]
  5067 00001E92 83F802                   cmp ax, 2
  5068 00001E95 0F850900                 jne .dovar1266
  5069 00001E99 68[341F]                 push dovar1_14
  5070 00001E9C E840E5                   call prs
  5071 00001E9F 83C402                   add  sp, 2
  5072                                  
  5073                                  ;-677   if(wi==4) prs(" eax, ");
  5074                                  
  5075                                  .dovar1266:
  5076 00001EA2 A1[3600]                 mov ax, [wi]
  5077 00001EA5 83F804                   cmp ax, 4
  5078 00001EA8 0F850900                 jne .dovar1267
  5079 00001EAC 68[3A1F]                 push dovar1_15
  5080 00001EAF E82DE5                   call prs
  5081 00001EB2 83C402                   add  sp, 2
  5082                                  
  5083                                  ;-678   v(id1);
  5084                                  
  5085                                  .dovar1267:
  5086 00001EB5 FF760A                   push word [bp+10]
  5087 00001EB8 E8C6F0                   call v
  5088 00001EBB 83C402                   add  sp, 2
  5089                                  
  5090                                  ;-679 }
  5091                                  
  5092                                  
  5093                                  ;-680 int rterm(char *op) {int mode; int opint; int ixarr; int id1;
  5094                                  
  5095 00001EBE C9                       .retndovar1: LEAVE
  5096 00001EBF C3                       ret
  5097 00001EC0 5C6E206D6F76206278-     dovar1_0 db "\n mov bx, ",0
  5098 00001EC9 2C2000             
  5099 00001ECC 5C6E2000                dovar1_1 db "\n ",0
  5100 00001ED0 20616C2C205B62785D-     dovar1_2 db " al, [bx]\n mov ah, 0",0
  5101 00001ED9 5C6E206D6F76206168-
  5102 00001EE2 2C203000           
  5103 00001EE6 2061782C205B62785D-     dovar1_3 db " ax, [bx]",0
  5104 00001EEF 00                 
  5105 00001EF0 5C6E2000                dovar1_4 db "\n ",0
  5106 00001EF4 2061782C2000            dovar1_5 db " ax, ",0
  5107 00001EFA 5C6E206D6F76206278-     dovar1_6 db "\n mov bx, ",0
  5108 00001F03 2C2000             
  5109 00001F06 5C6E2073686C206278-     dovar1_7 db "\n shl bx, 1",0
  5110 00001F0F 2C203100           
  5111 00001F13 5C6E2000                dovar1_8 db "\n ",0
  5112 00001F17 2061782C2000            dovar1_9 db " ax, ",0
  5113 00001F1D 20616C2C2000            dovar1_10 db " al, ",0
  5114 00001F23 202B2062785D00          dovar1_11 db " + bx]",0
  5115 00001F2A 5C6E2000                dovar1_12 db "\n ",0
  5116 00001F2E 20616C2C2000            dovar1_13 db " al, ",0
  5117 00001F34 2061782C2000            dovar1_14 db " ax, ",0
  5118 00001F3A 206561782C2000          dovar1_15 db " eax, ",0
  5119                                  ENDP
  5120                                  
  5121                                  rterm: PROC
  5122                                  
  5123                                  ;-681   if (istoken(T_CONST)) { prs("\n "); prs(op);
  5124                                  ;
  5125 00001F41 C8080000                 ENTER  8,0
  5126 00001F45 680101                   push 257
  5127 00001F48 E8ACEF                   call istoken
  5128 00001F4B 83C402                   add  sp, 2
  5129 00001F4E 08C0                     or  al, al
  5130 00001F50 0F845800                 je .rterm268
  5131 00001F54 68[3020]                 push rterm_0
  5132 00001F57 E885E4                   call prs
  5133 00001F5A 83C402                   add  sp, 2
  5134 00001F5D FF7604                   push word [bp+4]
  5135 00001F60 E87CE4                   call prs
  5136 00001F63 83C402                   add  sp, 2
  5137                                  
  5138                                  ;-682     if (wi==1) prs(" al, ");
  5139                                  
  5140 00001F66 A1[3600]                 mov ax, [wi]
  5141 00001F69 83F801                   cmp ax, 1
  5142 00001F6C 0F850900                 jne .rterm269
  5143 00001F70 68[3420]                 push rterm_1
  5144 00001F73 E869E4                   call prs
  5145 00001F76 83C402                   add  sp, 2
  5146                                  
  5147                                  ;-683     if (wi==2) prs(" ax, ");
  5148                                  
  5149                                  .rterm269:
  5150 00001F79 A1[3600]                 mov ax, [wi]
  5151 00001F7C 83F802                   cmp ax, 2
  5152 00001F7F 0F850900                 jne .rterm270
  5153 00001F83 68[3A20]                 push rterm_2
  5154 00001F86 E856E4                   call prs
  5155 00001F89 83C402                   add  sp, 2
  5156                                  
  5157                                  ;-684     if (wi==4) prs(" eax, ");
  5158                                  
  5159                                  .rterm270:
  5160 00001F8C A1[3600]                 mov ax, [wi]
  5161 00001F8F 83F804                   cmp ax, 4
  5162 00001F92 0F850900                 jne .rterm271
  5163 00001F96 68[4020]                 push rterm_3
  5164 00001F99 E843E4                   call prs
  5165 00001F9C 83C402                   add  sp, 2
  5166                                  
  5167                                  ;-685     prunsign1(lexval); return;}
  5168                                  
  5169                                  .rterm271:
  5170 00001F9F FF36[2B00]               push word [lexval]
  5171 00001FA3 E88EE5                   call prunsign1
  5172 00001FA6 83C402                   add  sp, 2
  5173 00001FA9 E98200                   jmp .retnrterm
  5174                                  
  5175                                  ;-686   mode=typeName(); id1=searchname(); ixarr=0;
  5176                                  
  5177                                  .rterm268:
  5178 00001FAC E83DF1                   call typeName
  5179 00001FAF 8946FE                   mov [bp-2], ax
  5180 00001FB2 E8D9F0                   call searchname
  5181 00001FB5 8946F8                   mov [bp-8], ax
  5182 00001FB8 B80000                   mov ax, 0
  5183 00001FBB 8946FA                   mov [bp-6], ax
  5184                                  
  5185                                  ;-687   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');
  5186                                  
  5187 00001FBE 6A5B                     push 91
  5188 00001FC0 E834EF                   call istoken
  5189 00001FC3 83C402                   add  sp, 2
  5190 00001FC6 08C0                     or  al, al
  5191 00001FC8 0F843300                 je .rterm272
  5192 00001FCC E8BFF0                   call searchname
  5193 00001FCF 8946FA                   mov [bp-6], ax
  5194 00001FD2 680001                   push 256
  5195 00001FD5 E841EF                   call expect
  5196 00001FD8 83C402                   add  sp, 2
  5197 00001FDB 6A5D                     push 93
  5198 00001FDD E839EF                   call expect
  5199 00001FE0 83C402                   add  sp, 2
  5200                                  
  5201                                  ;-688     gettypes(ixarr);
  5202                                  
  5203 00001FE3 FF76FA                   push word [bp-6]
  5204 00001FE6 E8DCF1                   call gettypes
  5205 00001FE9 83C402                   add  sp, 2
  5206                                  
  5207                                  ;-689     if (widthi != 2) error1("Arrayindex muss int sein"); }
  5208                                  
  5209 00001FEC A1[3300]                 mov ax, [widthi]
  5210 00001FEF 83F802                   cmp ax, 2
  5211 00001FF2 0F840900                 je  .rterm273
  5212 00001FF6 68[4720]                 push rterm_4
  5213 00001FF9 E89FE5                   call error1
  5214 00001FFC 83C402                   add  sp, 2
  5215                                  .rterm273:
  5216                                  
  5217                                  ;-690   if (eqstr(symbol,"_AX")) return;
  5218                                  
  5219                                  .rterm272:
  5220 00001FFF 68[6020]                 push rterm_5
  5221 00002002 8D06606D                 lea  ax, [symbol]
  5222 00002006 50                       push ax
  5223 00002007 E855E2                   call eqstr
  5224 0000200A 83C404                   add  sp, 4
  5225 0000200D 08C0                     or  al, al
  5226 0000200F 0F840300                 je .rterm274
  5227 00002013 E91800                   jmp .retnrterm
  5228                                  
  5229                                  ;-691   opint=op; dovar1(mode, opint, ixarr, id1);
  5230                                  
  5231                                  .rterm274:
  5232 00002016 8B4604                   mov ax, [bp+4]
  5233 00002019 8946FC                   mov [bp-4], ax
  5234 0000201C FF76F8                   push word [bp-8]
  5235 0000201F FF76FA                   push word [bp-6]
  5236 00002022 FF76FC                   push word [bp-4]
  5237 00002025 FF76FE                   push word [bp-2]
  5238 00002028 E82EFD                   call dovar1
  5239 0000202B 83C408                   add  sp, 8
  5240                                  
  5241                                  ;-692 }
  5242                                  
  5243                                  
  5244                                  ;-693 
  5245                                  
  5246                                  
  5247                                  ;-694 int doreg(char *dr) { int i; expect('=');
  5248                                  
  5249 0000202E C9                       .retnrterm: LEAVE
  5250 0000202F C3                       ret
  5251 00002030 5C6E2000                rterm_0 db "\n ",0
  5252 00002034 20616C2C2000            rterm_1 db " al, ",0
  5253 0000203A 2061782C2000            rterm_2 db " ax, ",0
  5254 00002040 206561782C2000          rterm_3 db " eax, ",0
  5255 00002047 4172726179696E6465-     rterm_4 db "Arrayindex muss int sein",0
  5256 00002050 78206D75737320696E-
  5257 00002059 74207365696E00     
  5258 00002060 5F415800                rterm_5 db "_AX",0
  5259                                  ENDP
  5260                                  
  5261                                  doreg: PROC;
  5262 00002064 C8020000                 ENTER  2,0
  5263 00002068 6A3D                     push 61
  5264 0000206A E8ACEE                   call expect
  5265 0000206D 83C402                   add  sp, 2
  5266                                  
  5267                                  ;-695   prs("\n mov  "); prs(dr); prs(", ");
  5268                                  
  5269 00002070 68[D320]                 push doreg_0
  5270 00002073 E869E3                   call prs
  5271 00002076 83C402                   add  sp, 2
  5272 00002079 FF7604                   push word [bp+4]
  5273 0000207C E860E3                   call prs
  5274 0000207F 83C402                   add  sp, 2
  5275 00002082 68[DC20]                 push doreg_1
  5276 00002085 E857E3                   call prs
  5277 00002088 83C402                   add  sp, 2
  5278                                  
  5279                                  ;-696        if (istoken(T_CONST)) prunsign1(lexval);
  5280                                  
  5281 0000208B 680101                   push 257
  5282 0000208E E866EE                   call istoken
  5283 00002091 83C402                   add  sp, 2
  5284 00002094 08C0                     or  al, al
  5285 00002096 0F840D00                 je .doreg275
  5286 0000209A FF36[2B00]               push word [lexval]
  5287 0000209E E893E4                   call prunsign1
  5288 000020A1 83C402                   add  sp, 2
  5289                                  
  5290                                  ;-697   else if (istoken(T_NAME )) { i=searchname(); v(i); }
  5291                                  
  5292 000020A4 E92A00                   jmp .doreg276
  5293                                  .doreg275:
  5294 000020A7 680001                   push 256
  5295 000020AA E84AEE                   call istoken
  5296 000020AD 83C402                   add  sp, 2
  5297 000020B0 08C0                     or  al, al
  5298 000020B2 0F841200                 je .doreg277
  5299 000020B6 E8D5EF                   call searchname
  5300 000020B9 8946FE                   mov [bp-2], ax
  5301 000020BC FF76FE                   push word [bp-2]
  5302 000020BF E8BFEE                   call v
  5303 000020C2 83C402                   add  sp, 2
  5304                                  
  5305                                  ;-698   else error1("only number or var allowed");
  5306                                  
  5307 000020C5 E90900                   jmp .doreg278
  5308                                  .doreg277:
  5309 000020C8 68[DF20]                 push doreg_2
  5310 000020CB E8CDE4                   call error1
  5311 000020CE 83C402                   add  sp, 2
  5312                                  
  5313                                  ;-699 }
  5314                                  
  5315                                  .doreg278:
  5316                                  .doreg276:
  5317                                  
  5318                                  ;-700 int isreg() {
  5319 000020D1 C9                       LEAVE
  5320 000020D2 C3                       ret
  5321 000020D3 5C6E206D6F76202000      doreg_0 db "\n mov  ",0
  5322 000020DC 2C2000                  doreg_1 db ", ",0
  5323 000020DF 6F6E6C79206E756D62-     doreg_2 db "only number or var allowed",0
  5324 000020E8 6572206F7220766172-
  5325 000020F1 20616C6C6F77656400 
  5326                                  ENDP
  5327                                  
  5328                                  isreg: PROC
  5329                                  
  5330                                  ;-701   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}
  5331                                  
  5332 000020FA 68[E722]                 push isreg_0
  5333 000020FD 8D06606D                 lea  ax, [symbol]
  5334 00002101 50                       push ax
  5335 00002102 E85AE1                   call eqstr
  5336 00002105 83C404                   add  sp, 4
  5337 00002108 08C0                     or  al, al
  5338 0000210A 0F840C00                 je .isreg279
  5339 0000210E 68[EB22]                 push isreg_1
  5340 00002111 E850FF                   call doreg
  5341 00002114 83C402                   add  sp, 2
  5342 00002117 E9C601                   jmp .r1
  5343                                  
  5344                                  ;-702   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}
  5345                                  
  5346                                  .isreg279:
  5347 0000211A 68[EE22]                 push isreg_2
  5348 0000211D 8D06606D                 lea  ax, [symbol]
  5349 00002121 50                       push ax
  5350 00002122 E83AE1                   call eqstr
  5351 00002125 83C404                   add  sp, 4
  5352 00002128 08C0                     or  al, al
  5353 0000212A 0F840C00                 je .isreg280
  5354 0000212E 68[F222]                 push isreg_3
  5355 00002131 E830FF                   call doreg
  5356 00002134 83C402                   add  sp, 2
  5357 00002137 E9A601                   jmp .r1
  5358                                  
  5359                                  ;-703   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}
  5360                                  
  5361                                  .isreg280:
  5362 0000213A 68[F522]                 push isreg_4
  5363 0000213D 8D06606D                 lea  ax, [symbol]
  5364 00002141 50                       push ax
  5365 00002142 E81AE1                   call eqstr
  5366 00002145 83C404                   add  sp, 4
  5367 00002148 08C0                     or  al, al
  5368 0000214A 0F840C00                 je .isreg281
  5369 0000214E 68[F922]                 push isreg_5
  5370 00002151 E810FF                   call doreg
  5371 00002154 83C402                   add  sp, 2
  5372 00002157 E98601                   jmp .r1
  5373                                  
  5374                                  ;-704   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}
  5375                                  
  5376                                  .isreg281:
  5377 0000215A 68[FC22]                 push isreg_6
  5378 0000215D 8D06606D                 lea  ax, [symbol]
  5379 00002161 50                       push ax
  5380 00002162 E8FAE0                   call eqstr
  5381 00002165 83C404                   add  sp, 4
  5382 00002168 08C0                     or  al, al
  5383 0000216A 0F840C00                 je .isreg282
  5384 0000216E 68[0023]                 push isreg_7
  5385 00002171 E8F0FE                   call doreg
  5386 00002174 83C402                   add  sp, 2
  5387 00002177 E96601                   jmp .r1
  5388                                  
  5389                                  ;-705   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}
  5390                                  
  5391                                  .isreg282:
  5392 0000217A 68[0323]                 push isreg_8
  5393 0000217D 8D06606D                 lea  ax, [symbol]
  5394 00002181 50                       push ax
  5395 00002182 E8DAE0                   call eqstr
  5396 00002185 83C404                   add  sp, 4
  5397 00002188 08C0                     or  al, al
  5398 0000218A 0F840C00                 je .isreg283
  5399 0000218E 68[0723]                 push isreg_9
  5400 00002191 E8D0FE                   call doreg
  5401 00002194 83C402                   add  sp, 2
  5402 00002197 E94601                   jmp .r1
  5403                                  
  5404                                  ;-706   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}
  5405                                  
  5406                                  .isreg283:
  5407 0000219A 68[0A23]                 push isreg_10
  5408 0000219D 8D06606D                 lea  ax, [symbol]
  5409 000021A1 50                       push ax
  5410 000021A2 E8BAE0                   call eqstr
  5411 000021A5 83C404                   add  sp, 4
  5412 000021A8 08C0                     or  al, al
  5413 000021AA 0F840C00                 je .isreg284
  5414 000021AE 68[0E23]                 push isreg_11
  5415 000021B1 E8B0FE                   call doreg
  5416 000021B4 83C402                   add  sp, 2
  5417 000021B7 E92601                   jmp .r1
  5418                                  
  5419                                  ;-707   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}
  5420                                  
  5421                                  .isreg284:
  5422 000021BA 68[1123]                 push isreg_12
  5423 000021BD 8D06606D                 lea  ax, [symbol]
  5424 000021C1 50                       push ax
  5425 000021C2 E89AE0                   call eqstr
  5426 000021C5 83C404                   add  sp, 4
  5427 000021C8 08C0                     or  al, al
  5428 000021CA 0F840C00                 je .isreg285
  5429 000021CE 68[1523]                 push isreg_13
  5430 000021D1 E890FE                   call doreg
  5431 000021D4 83C402                   add  sp, 2
  5432 000021D7 E90601                   jmp .r1
  5433                                  
  5434                                  ;-708   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}
  5435                                  
  5436                                  .isreg285:
  5437 000021DA 68[1823]                 push isreg_14
  5438 000021DD 8D06606D                 lea  ax, [symbol]
  5439 000021E1 50                       push ax
  5440 000021E2 E87AE0                   call eqstr
  5441 000021E5 83C404                   add  sp, 4
  5442 000021E8 08C0                     or  al, al
  5443 000021EA 0F840C00                 je .isreg286
  5444 000021EE 68[1C23]                 push isreg_15
  5445 000021F1 E870FE                   call doreg
  5446 000021F4 83C402                   add  sp, 2
  5447 000021F7 E9E600                   jmp .r1
  5448                                  
  5449                                  ;-709   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}
  5450                                  
  5451                                  .isreg286:
  5452 000021FA 68[1F23]                 push isreg_16
  5453 000021FD 8D06606D                 lea  ax, [symbol]
  5454 00002201 50                       push ax
  5455 00002202 E85AE0                   call eqstr
  5456 00002205 83C404                   add  sp, 4
  5457 00002208 08C0                     or  al, al
  5458 0000220A 0F840C00                 je .isreg287
  5459 0000220E 68[2323]                 push isreg_17
  5460 00002211 E850FE                   call doreg
  5461 00002214 83C402                   add  sp, 2
  5462 00002217 E9C600                   jmp .r1
  5463                                  
  5464                                  ;-710   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}
  5465                                  
  5466                                  .isreg287:
  5467 0000221A 68[2623]                 push isreg_18
  5468 0000221D 8D06606D                 lea  ax, [symbol]
  5469 00002221 50                       push ax
  5470 00002222 E83AE0                   call eqstr
  5471 00002225 83C404                   add  sp, 4
  5472 00002228 08C0                     or  al, al
  5473 0000222A 0F840C00                 je .isreg288
  5474 0000222E 68[2A23]                 push isreg_19
  5475 00002231 E830FE                   call doreg
  5476 00002234 83C402                   add  sp, 2
  5477 00002237 E9A600                   jmp .r1
  5478                                  
  5479                                  ;-711   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}
  5480                                  
  5481                                  .isreg288:
  5482 0000223A 68[2D23]                 push isreg_20
  5483 0000223D 8D06606D                 lea  ax, [symbol]
  5484 00002241 50                       push ax
  5485 00002242 E81AE0                   call eqstr
  5486 00002245 83C404                   add  sp, 4
  5487 00002248 08C0                     or  al, al
  5488 0000224A 0F840C00                 je .isreg289
  5489 0000224E 68[3123]                 push isreg_21
  5490 00002251 E810FE                   call doreg
  5491 00002254 83C402                   add  sp, 2
  5492 00002257 E98600                   jmp .r1
  5493                                  
  5494                                  ;-712   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}
  5495                                  
  5496                                  .isreg289:
  5497 0000225A 68[3423]                 push isreg_22
  5498 0000225D 8D06606D                 lea  ax, [symbol]
  5499 00002261 50                       push ax
  5500 00002262 E8FADF                   call eqstr
  5501 00002265 83C404                   add  sp, 4
  5502 00002268 08C0                     or  al, al
  5503 0000226A 0F840C00                 je .isreg290
  5504 0000226E 68[3823]                 push isreg_23
  5505 00002271 E8F0FD                   call doreg
  5506 00002274 83C402                   add  sp, 2
  5507 00002277 E96600                   jmp .r1
  5508                                  
  5509                                  ;-713   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}
  5510                                  
  5511                                  .isreg290:
  5512 0000227A 68[3B23]                 push isreg_24
  5513 0000227D 8D06606D                 lea  ax, [symbol]
  5514 00002281 50                       push ax
  5515 00002282 E8DADF                   call eqstr
  5516 00002285 83C404                   add  sp, 4
  5517 00002288 08C0                     or  al, al
  5518 0000228A 0F840C00                 je .isreg291
  5519 0000228E 68[3F23]                 push isreg_25
  5520 00002291 E8D0FD                   call doreg
  5521 00002294 83C402                   add  sp, 2
  5522 00002297 E94600                   jmp .r1
  5523                                  
  5524                                  ;-714   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}
  5525                                  
  5526                                  .isreg291:
  5527 0000229A 68[4223]                 push isreg_26
  5528 0000229D 8D06606D                 lea  ax, [symbol]
  5529 000022A1 50                       push ax
  5530 000022A2 E8BADF                   call eqstr
  5531 000022A5 83C404                   add  sp, 4
  5532 000022A8 08C0                     or  al, al
  5533 000022AA 0F840C00                 je .isreg292
  5534 000022AE 68[4623]                 push isreg_27
  5535 000022B1 E8B0FD                   call doreg
  5536 000022B4 83C402                   add  sp, 2
  5537 000022B7 E92600                   jmp .r1
  5538                                  
  5539                                  ;-715   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}
  5540                                  
  5541                                  .isreg292:
  5542 000022BA 68[4923]                 push isreg_28
  5543 000022BD 8D06606D                 lea  ax, [symbol]
  5544 000022C1 50                       push ax
  5545 000022C2 E89ADF                   call eqstr
  5546 000022C5 83C404                   add  sp, 4
  5547 000022C8 08C0                     or  al, al
  5548 000022CA 0F840C00                 je .isreg293
  5549 000022CE 68[5023]                 push isreg_29
  5550 000022D1 E890FD                   call doreg
  5551 000022D4 83C402                   add  sp, 2
  5552 000022D7 E90600                   jmp .r1
  5553                                  
  5554                                  ;-716   return 0;   r1: return 1;
  5555                                  
  5556                                  .isreg293:
  5557 000022DA B80000                   mov ax, 0
  5558 000022DD E90600                   jmp .retnisreg
  5559                                  .r1:
  5560 000022E0 B80100                   mov ax, 1
  5561 000022E3 E90000                   jmp .retnisreg
  5562                                  
  5563                                  ;-717 }
  5564                                  
  5565                                  
  5566                                  ;-718 
  5567                                  
  5568                                  
  5569                                  ;-719 int doassign(int mode, int i, int ixarr, int ixconst) {
  5570                                  
  5571                                   .retnisreg:
  5572 000022E6 C3                       ret
  5573 000022E7 5F414800                isreg_0 db "_AH",0
  5574 000022EB 616800                  isreg_1 db "ah",0
  5575 000022EE 5F414C00                isreg_2 db "_AL",0
  5576 000022F2 616C00                  isreg_3 db "al",0
  5577 000022F5 5F415800                isreg_4 db "_AX",0
  5578 000022F9 617800                  isreg_5 db "ax",0
  5579 000022FC 5F424800                isreg_6 db "_BH",0
  5580 00002300 626800                  isreg_7 db "bh",0
  5581 00002303 5F424C00                isreg_8 db "_BL",0
  5582 00002307 626C00                  isreg_9 db "bl",0
  5583 0000230A 5F425800                isreg_10 db "_BX",0
  5584 0000230E 627800                  isreg_11 db "bx",0
  5585 00002311 5F434800                isreg_12 db "_CH",0
  5586 00002315 636800                  isreg_13 db "ch",0
  5587 00002318 5F434C00                isreg_14 db "_CL",0
  5588 0000231C 636C00                  isreg_15 db "cl",0
  5589 0000231F 5F435800                isreg_16 db "_CX",0
  5590 00002323 637800                  isreg_17 db "cx",0
  5591 00002326 5F444800                isreg_18 db "_DH",0
  5592 0000232A 646800                  isreg_19 db "dh",0
  5593 0000232D 5F444C00                isreg_20 db "_DL",0
  5594 00002331 646C00                  isreg_21 db "dl",0
  5595 00002334 5F445800                isreg_22 db "_DX",0
  5596 00002338 647800                  isreg_23 db "dx",0
  5597 0000233B 5F534900                isreg_24 db "_SI",0
  5598 0000233F 736900                  isreg_25 db "si",0
  5599 00002342 5F444900                isreg_26 db "_DI",0
  5600 00002346 646900                  isreg_27 db "di",0
  5601 00002349 5F464C41475300          isreg_28 db "_FLAGS",0
  5602 00002350 666C61677300            isreg_29 db "flags",0
  5603                                  ENDP
  5604                                  
  5605                                  doassign: PROC
  5606                                  
  5607                                  ;-720   gettypes(i);
  5608                                  ;
  5609 00002356 C8000000                 ENTER  0,0
  5610 0000235A FF7606                   push word [bp+6]
  5611 0000235D E865EE                   call gettypes
  5612 00002360 83C402                   add  sp, 2
  5613                                  
  5614                                  ;-721   if (mode==1) {prs("\n mov  bx, ");v(i);
  5615                                  
  5616 00002363 8B4604                   mov ax, [bp+4]
  5617 00002366 83F801                   cmp ax, 1
  5618 00002369 0F853400                 jne .doassign294
  5619 0000236D 68[F324]                 push doassign_0
  5620 00002370 E86CE0                   call prs
  5621 00002373 83C402                   add  sp, 2
  5622 00002376 FF7606                   push word [bp+6]
  5623 00002379 E805EC                   call v
  5624 0000237C 83C402                   add  sp, 2
  5625                                  
  5626                                  ;-722     if (widthi == 2) prs("\n mov  [bx], ax");
  5627                                  
  5628 0000237F A1[3300]                 mov ax, [widthi]
  5629 00002382 83F802                   cmp ax, 2
  5630 00002385 0F850C00                 jne .doassign295
  5631 00002389 68[0025]                 push doassign_1
  5632 0000238C E850E0                   call prs
  5633 0000238F 83C402                   add  sp, 2
  5634                                  
  5635                                  ;-723     else  prs("\n mov  [bx], al"); return;}
  5636                                  
  5637 00002392 E90900                   jmp .doassign296
  5638                                  .doassign295:
  5639 00002395 68[1125]                 push doassign_2
  5640 00002398 E844E0                   call prs
  5641 0000239B 83C402                   add  sp, 2
  5642                                  .doassign296:
  5643 0000239E E95001                   jmp .retndoassign
  5644                                  
  5645                                  ;-724   if (mode==2) {prs("\n mov  ");printName(i); prs(", ax"); return;}
  5646                                  
  5647                                  .doassign294:
  5648 000023A1 8B4604                   mov ax, [bp+4]
  5649 000023A4 83F802                   cmp ax, 2
  5650 000023A7 0F851E00                 jne .doassign297
  5651 000023AB 68[2225]                 push doassign_3
  5652 000023AE E82EE0                   call prs
  5653 000023B1 83C402                   add  sp, 2
  5654 000023B4 FF7606                   push word [bp+6]
  5655 000023B7 E8E9E3                   call printName
  5656 000023BA 83C402                   add  sp, 2
  5657 000023BD 68[2B25]                 push doassign_4
  5658 000023C0 E81CE0                   call prs
  5659 000023C3 83C402                   add  sp, 2
  5660 000023C6 E92801                   jmp .retndoassign
  5661                                  
  5662                                  ;-725   if (ixarr) {  prs("\n mov bx, ");
  5663                                  
  5664                                  .doassign297:
  5665 000023C9 8B4608                   mov ax, [bp+8]
  5666 000023CC 08C0                     or  al, al
  5667 000023CE 0F846E00                 je .doassign298
  5668 000023D2 68[3025]                 push doassign_5
  5669 000023D5 E807E0                   call prs
  5670 000023D8 83C402                   add  sp, 2
  5671                                  
  5672                                  ;-726     if(ixconst) prunsign1(ixarr); else v(ixarr);
  5673                                  
  5674 000023DB 8B460A                   mov ax, [bp+10]
  5675 000023DE 08C0                     or  al, al
  5676 000023E0 0F840C00                 je .doassign299
  5677 000023E4 FF7608                   push word [bp+8]
  5678 000023E7 E84AE1                   call prunsign1
  5679 000023EA 83C402                   add  sp, 2
  5680 000023ED E90900                   jmp .doassign300
  5681                                  .doassign299:
  5682 000023F0 FF7608                   push word [bp+8]
  5683 000023F3 E88BEB                   call v
  5684 000023F6 83C402                   add  sp, 2
  5685                                  
  5686                                  ;-727     if (wi==2) prs("\n shl bx, 1");
  5687                                  
  5688                                  .doassign300:
  5689 000023F9 A1[3600]                 mov ax, [wi]
  5690 000023FC 83F802                   cmp ax, 2
  5691 000023FF 0F850900                 jne .doassign301
  5692 00002403 68[3C25]                 push doassign_6
  5693 00002406 E8D6DF                   call prs
  5694 00002409 83C402                   add  sp, 2
  5695                                  
  5696                                  ;-728     prs("\n mov ["); printName(i);
  5697                                  
  5698                                  .doassign301:
  5699 0000240C 68[4925]                 push doassign_7
  5700 0000240F E8CDDF                   call prs
  5701 00002412 83C402                   add  sp, 2
  5702 00002415 FF7606                   push word [bp+6]
  5703 00002418 E888E3                   call printName
  5704 0000241B 83C402                   add  sp, 2
  5705                                  
  5706                                  ;-729     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }
  5707                                  
  5708 0000241E A1[3600]                 mov ax, [wi]
  5709 00002421 83F802                   cmp ax, 2
  5710 00002424 0F850C00                 jne .doassign302
  5711 00002428 68[5225]                 push doassign_8
  5712 0000242B E8B1DF                   call prs
  5713 0000242E 83C402                   add  sp, 2
  5714 00002431 E90900                   jmp .doassign303
  5715                                  .doassign302:
  5716 00002434 68[5B25]                 push doassign_9
  5717 00002437 E8A5DF                   call prs
  5718 0000243A 83C402                   add  sp, 2
  5719                                  .doassign303:
  5720 0000243D E9B100                   jmp .retndoassign
  5721                                  
  5722                                  ;-730   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");
  5723                                  
  5724                                  .doassign298:
  5725 00002440 A1[3600]                 mov ax, [wi]
  5726 00002443 83F801                   cmp ax, 1
  5727 00002446 0F853100                 jne .doassign304
  5728 0000244A 68[6425]                 push doassign_10
  5729 0000244D E88FDF                   call prs
  5730 00002450 83C402                   add  sp, 2
  5731 00002453 8B4606                   mov ax, [bp+6]
  5732 00002456 3DC800                   cmp ax, 200
  5733 00002459 0F8D0900                 jge .doassign305
  5734 0000245D 68[6C25]                 push doassign_11
  5735 00002460 E87CDF                   call prs
  5736 00002463 83C402                   add  sp, 2
  5737                                  
  5738                                  ;-731     } v(i); prs(", al"); return; }
  5739                                  
  5740                                  .doassign305:
  5741 00002466 FF7606                   push word [bp+6]
  5742 00002469 E815EB                   call v
  5743 0000246C 83C402                   add  sp, 2
  5744 0000246F 68[7225]                 push doassign_12
  5745 00002472 E86ADF                   call prs
  5746 00002475 83C402                   add  sp, 2
  5747 00002478 E97600                   jmp .retndoassign
  5748                                  
  5749                                  ;-732   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");
  5750                                  
  5751                                  .doassign304:
  5752 0000247B A1[3600]                 mov ax, [wi]
  5753 0000247E 83F802                   cmp ax, 2
  5754 00002481 0F853100                 jne .doassign306
  5755 00002485 68[7725]                 push doassign_13
  5756 00002488 E854DF                   call prs
  5757 0000248B 83C402                   add  sp, 2
  5758 0000248E 8B4606                   mov ax, [bp+6]
  5759 00002491 3DC800                   cmp ax, 200
  5760 00002494 0F8D0900                 jge .doassign307
  5761 00002498 68[7F25]                 push doassign_14
  5762 0000249B E841DF                   call prs
  5763 0000249E 83C402                   add  sp, 2
  5764                                  
  5765                                  ;-733     } v(i); prs(", ax"); return; }
  5766                                  
  5767                                  .doassign307:
  5768 000024A1 FF7606                   push word [bp+6]
  5769 000024A4 E8DAEA                   call v
  5770 000024A7 83C402                   add  sp, 2
  5771 000024AA 68[8525]                 push doassign_15
  5772 000024AD E82FDF                   call prs
  5773 000024B0 83C402                   add  sp, 2
  5774 000024B3 E93B00                   jmp .retndoassign
  5775                                  
  5776                                  ;-734   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");
  5777                                  
  5778                                  .doassign306:
  5779 000024B6 A1[3600]                 mov ax, [wi]
  5780 000024B9 83F804                   cmp ax, 4
  5781 000024BC 0F853100                 jne .doassign308
  5782 000024C0 68[8A25]                 push doassign_16
  5783 000024C3 E819DF                   call prs
  5784 000024C6 83C402                   add  sp, 2
  5785 000024C9 8B4606                   mov ax, [bp+6]
  5786 000024CC 3DC800                   cmp ax, 200
  5787 000024CF 0F8D0900                 jge .doassign309
  5788 000024D3 68[9225]                 push doassign_17
  5789 000024D6 E806DF                   call prs
  5790 000024D9 83C402                   add  sp, 2
  5791                                  
  5792                                  ;-735     } v(i); prs(", eax"); return; }
  5793                                  
  5794                                  .doassign309:
  5795 000024DC FF7606                   push word [bp+6]
  5796 000024DF E89FEA                   call v
  5797 000024E2 83C402                   add  sp, 2
  5798 000024E5 68[9925]                 push doassign_18
  5799 000024E8 E8F4DE                   call prs
  5800 000024EB 83C402                   add  sp, 2
  5801 000024EE E90000                   jmp .retndoassign
  5802                                  
  5803                                  ;-736 }
  5804                                  
  5805                                  .doassign308:
  5806                                  
  5807                                  ;-737 int domul(int ids) {
  5808                                  
  5809 000024F1 C9                       .retndoassign: LEAVE
  5810 000024F2 C3                       ret
  5811 000024F3 5C6E206D6F76202062-     doassign_0 db "\n mov  bx, ",0
  5812 000024FC 782C2000           
  5813 00002500 5C6E206D6F7620205B-     doassign_1 db "\n mov  [bx], ax",0
  5814 00002509 62785D2C20617800   
  5815 00002511 5C6E206D6F7620205B-     doassign_2 db "\n mov  [bx], al",0
  5816 0000251A 62785D2C20616C00   
  5817 00002522 5C6E206D6F76202000      doassign_3 db "\n mov  ",0
  5818 0000252B 2C20617800              doassign_4 db ", ax",0
  5819 00002530 5C6E206D6F76206278-     doassign_5 db "\n mov bx, ",0
  5820 00002539 2C2000             
  5821 0000253C 5C6E2073686C206278-     doassign_6 db "\n shl bx, 1",0
  5822 00002545 2C203100           
  5823 00002549 5C6E206D6F76205B00      doassign_7 db "\n mov [",0
  5824 00002552 2B62785D2C20617800      doassign_8 db "+bx], ax",0
  5825 0000255B 2B62785D2C20616C00      doassign_9 db "+bx], al",0
  5826 00002564 5C6E206D6F762000        doassign_10 db "\n mov ",0
  5827 0000256C 627974652000            doassign_11 db "byte ",0
  5828 00002572 2C20616C00              doassign_12 db ", al",0
  5829 00002577 5C6E206D6F762000        doassign_13 db "\n mov ",0
  5830 0000257F 776F72642000            doassign_14 db "word ",0
  5831 00002585 2C20617800              doassign_15 db ", ax",0
  5832 0000258A 5C6E206D6F762000        doassign_16 db "\n mov ",0
  5833 00002592 64776F72642000          doassign_17 db "dword ",0
  5834 00002599 2C2065617800            doassign_18 db ", eax",0
  5835                                  ENDP
  5836                                  
  5837                                  domul: PROC
  5838                                  
  5839                                  ;-738   if (ids) rterm("imul"); else {
  5840                                  ;
  5841 0000259F C8000000                 ENTER  0,0
  5842 000025A3 8B4604                   mov ax, [bp+4]
  5843 000025A6 08C0                     or  al, al
  5844 000025A8 0F840C00                 je .domul310
  5845 000025AC 68[F125]                 push domul_0
  5846 000025AF E88FF9                   call rterm
  5847 000025B2 83C402                   add  sp, 2
  5848 000025B5 E93700                   jmp .domul311
  5849                                  .domul310:
  5850                                  
  5851                                  ;-739   if (istoken(T_CONST)) {
  5852                                  
  5853 000025B8 680101                   push 257
  5854 000025BB E839E9                   call istoken
  5855 000025BE 83C402                   add  sp, 2
  5856 000025C1 08C0                     or  al, al
  5857 000025C3 0F841F00                 je .domul312
  5858                                  
  5859                                  ;-740     prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx");
  5860                                  
  5861 000025C7 68[F625]                 push domul_1
  5862 000025CA E812DE                   call prs
  5863 000025CD 83C402                   add  sp, 2
  5864 000025D0 FF36[2B00]               push word [lexval]
  5865 000025D4 E85DDF                   call prunsign1
  5866 000025D7 83C402                   add  sp, 2
  5867 000025DA 68[0226]                 push domul_2
  5868 000025DD E8FFDD                   call prs
  5869 000025E0 83C402                   add  sp, 2
  5870                                  
  5871                                  ;-741     }
  5872                                  
  5873                                  
  5874                                  ;-742   else error1("with MUL only const number as multiplicator allowed"); } }
  5875                                  
  5876 000025E3 E90900                   jmp .domul313
  5877                                  .domul312:
  5878 000025E6 68[0C26]                 push domul_3
  5879 000025E9 E8AFDF                   call error1
  5880 000025EC 83C402                   add  sp, 2
  5881                                  .domul313:
  5882                                  .domul311:
  5883                                  
  5884                                  ;-743 int doidiv(int ids) { int mode; int id1;
  5885 000025EF C9                       LEAVE
  5886 000025F0 C3                       ret
  5887 000025F1 696D756C00              domul_0 db "imul",0
  5888 000025F6 5C6E206D6F76206278-     domul_1 db "\n mov bx, ",0
  5889 000025FF 2C2000             
  5890 00002602 5C6E206D756C206278-     domul_2 db "\n mul bx",0
  5891 0000260B 00                 
  5892 0000260C 77697468204D554C20-     domul_3 db "with MUL only const number as multiplicator allowed",0
  5893 00002615 6F6E6C7920636F6E73-
  5894 0000261E 74206E756D62657220-
  5895 00002627 6173206D756C746970-
  5896 00002630 6C696361746F722061-
  5897 00002639 6C6C6F77656400     
  5898                                  ENDP
  5899                                  
  5900                                  doidiv: PROC
  5901                                  
  5902                                  ;-744   if (istoken(T_CONST)) {
  5903                                  ;
  5904 00002640 C8040000                 ENTER  4,0
  5905 00002644 680101                   push 257
  5906 00002647 E8ADE8                   call istoken
  5907 0000264A 83C402                   add  sp, 2
  5908 0000264D 08C0                     or  al, al
  5909 0000264F 0F843400                 je .doidiv314
  5910                                  
  5911                                  ;-745     prs("\n mov bx, "); prunsign1(lexval);
  5912                                  
  5913 00002653 68[0527]                 push doidiv_0
  5914 00002656 E886DD                   call prs
  5915 00002659 83C402                   add  sp, 2
  5916 0000265C FF36[2B00]               push word [lexval]
  5917 00002660 E8D1DE                   call prunsign1
  5918 00002663 83C402                   add  sp, 2
  5919                                  
  5920                                  ;-746     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5921                                  
  5922 00002666 8B4604                   mov ax, [bp+4]
  5923 00002669 08C0                     or  al, al
  5924 0000266B 0F840C00                 je .doidiv315
  5925 0000266F 68[1127]                 push doidiv_1
  5926 00002672 E86ADD                   call prs
  5927 00002675 83C402                   add  sp, 2
  5928 00002678 E90900                   jmp .doidiv316
  5929                                  .doidiv315:
  5930 0000267B 68[2227]                 push doidiv_2
  5931 0000267E E85EDD                   call prs
  5932 00002681 83C402                   add  sp, 2
  5933                                  .doidiv316:
  5934                                  
  5935                                  ;-747   else {
  5936                                  
  5937 00002684 E97C00                   jmp .doidiv317
  5938                                  .doidiv314:
  5939                                  
  5940                                  ;-748     mode=typeName(); id1=searchname();
  5941                                  
  5942 00002687 E862EA                   call typeName
  5943 0000268A 8946FE                   mov [bp-2], ax
  5944 0000268D E8FEE9                   call searchname
  5945 00002690 8946FC                   mov [bp-4], ax
  5946                                  
  5947                                  ;-749     if (mode) error1("only const number or int as divisor allowed");
  5948                                  
  5949 00002693 8B46FE                   mov ax, [bp-2]
  5950 00002696 08C0                     or  al, al
  5951 00002698 0F840900                 je .doidiv318
  5952 0000269C 68[3827]                 push doidiv_3
  5953 0000269F E8F9DE                   call error1
  5954 000026A2 83C402                   add  sp, 2
  5955                                  
  5956                                  ;-750     gettypes(id1);
  5957                                  
  5958                                  .doidiv318:
  5959 000026A5 FF76FC                   push word [bp-4]
  5960 000026A8 E81AEB                   call gettypes
  5961 000026AB 83C402                   add  sp, 2
  5962                                  
  5963                                  ;-751     if (typei) error1("only int as simple var divisor allowed");
  5964                                  
  5965 000026AE A1[2D00]                 mov ax, [typei]
  5966 000026B1 08C0                     or  al, al
  5967 000026B3 0F840900                 je .doidiv319
  5968 000026B7 68[6427]                 push doidiv_4
  5969 000026BA E8DEDE                   call error1
  5970 000026BD 83C402                   add  sp, 2
  5971                                  
  5972                                  ;-752     if (wi!=2) error1("only int, no byte as divisor allowed");
  5973                                  
  5974                                  .doidiv319:
  5975 000026C0 A1[3600]                 mov ax, [wi]
  5976 000026C3 83F802                   cmp ax, 2
  5977 000026C6 0F840900                 je  .doidiv320
  5978 000026CA 68[8B27]                 push doidiv_5
  5979 000026CD E8CBDE                   call error1
  5980 000026D0 83C402                   add  sp, 2
  5981                                  
  5982                                  ;-753     prs("\n mov bx, "); v(id1);
  5983                                  
  5984                                  .doidiv320:
  5985 000026D3 68[B027]                 push doidiv_6
  5986 000026D6 E806DD                   call prs
  5987 000026D9 83C402                   add  sp, 2
  5988 000026DC FF76FC                   push word [bp-4]
  5989 000026DF E89FE8                   call v
  5990 000026E2 83C402                   add  sp, 2
  5991                                  
  5992                                  ;-754     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5993                                  
  5994 000026E5 8B4604                   mov ax, [bp+4]
  5995 000026E8 08C0                     or  al, al
  5996 000026EA 0F840C00                 je .doidiv321
  5997 000026EE 68[BC27]                 push doidiv_7
  5998 000026F1 E8EBDC                   call prs
  5999 000026F4 83C402                   add  sp, 2
  6000 000026F7 E90900                   jmp .doidiv322
  6001                                  .doidiv321:
  6002 000026FA 68[CD27]                 push doidiv_8
  6003 000026FD E8DFDC                   call prs
  6004 00002700 83C402                   add  sp, 2
  6005                                  .doidiv322:
  6006                                  
  6007                                  ;-755 }
  6008                                  
  6009                                  .doidiv317:
  6010                                  
  6011                                  ;-756 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
  6012 00002703 C9                       LEAVE
  6013 00002704 C3                       ret
  6014 00002705 5C6E206D6F76206278-     doidiv_0 db "\n mov bx, ",0
  6015 0000270E 2C2000             
  6016 00002711 5C6E206377645C6E20-     doidiv_1 db "\n cwd\n idiv bx",0
  6017 0000271A 6964697620627800   
  6018 00002722 5C6E206D6F76206478-     doidiv_2 db "\n mov dx, 0\n div bx",0
  6019 0000272B 2C20305C6E20646976-
  6020 00002734 20627800           
  6021 00002738 6F6E6C7920636F6E73-     doidiv_3 db "only const number or int as divisor allowed",0
  6022 00002741 74206E756D62657220-
  6023 0000274A 6F7220696E74206173-
  6024 00002753 2064697669736F7220-
  6025 0000275C 616C6C6F77656400   
  6026 00002764 6F6E6C7920696E7420-     doidiv_4 db "only int as simple var divisor allowed",0
  6027 0000276D 61732073696D706C65-
  6028 00002776 207661722064697669-
  6029 0000277F 736F7220616C6C6F77-
  6030 00002788 656400             
  6031 0000278B 6F6E6C7920696E742C-     doidiv_5 db "only int, no byte as divisor allowed",0
  6032 00002794 206E6F206279746520-
  6033 0000279D 61732064697669736F-
  6034 000027A6 7220616C6C6F776564-
  6035 000027AF 00                 
  6036 000027B0 5C6E206D6F76206278-     doidiv_6 db "\n mov bx, ",0
  6037 000027B9 2C2000             
  6038 000027BC 5C6E206377645C6E20-     doidiv_7 db "\n cwd\n idiv bx",0
  6039 000027C5 6964697620627800   
  6040 000027CD 5C6E206D6F76206478-     doidiv_8 db "\n mov dx, 0\n div bx",0
  6041 000027D6 2C20305C6E20646976-
  6042 000027DF 20627800           
  6043                                  ENDP
  6044                                  
  6045                                  domod: PROC;
  6046 000027E3 C8000000                 ENTER  0,0
  6047 000027E7 FF7604                   push word [bp+4]
  6048 000027EA E853FE                   call doidiv
  6049 000027ED 83C402                   add  sp, 2
  6050 000027F0 68[FB27]                 push domod_0
  6051 000027F3 E8E9DB                   call prs
  6052 000027F6 83C402                   add  sp, 2
  6053                                  
  6054                                  ;-757 
  6055                                  
  6056                                  
  6057                                  ;-758 
  6058                                  
  6059                                  
  6060                                  ;-759 int docalltype[10]; int docallvalue[10];
  6061 000027F9 C9                       LEAVE
  6062 000027FA C3                       ret
  6063 000027FB 5C6E206D6F76206178-     domod_0 db "\n mov ax, dx",0
  6064 00002804 2C20647800         
  6065                                  ENDP
  6066                                  section .bss
  6067                                  absolute 41742
  6068 0000A30E <res 00000014>          docalltype resw 10
  6069                                  section .text
  6070                                  section .bss
  6071                                  absolute 41762
  6072 0000A322 <res 00000014>          docallvalue resw 10
  6073                                  section .text
  6074                                  
  6075                                  ;-760 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register
  6076                                  
  6077                                  section .bss
  6078                                  absolute 41782
  6079 0000A336 <res 00000011>          procname resb 17
  6080                                  section .text
  6081                                  
  6082                                  ;-761 int docall1() {int i; int narg; int t0; int n0;  int sz32;
  6083                                  
  6084                                  
  6085                                  docall1: PROC
  6086                                  
  6087                                  ;-762   narg=0;  sz32=0;
  6088                                  ;
  6089 00002809 C80A0000                 ENTER  10,0
  6090 0000280D B80000                   mov ax, 0
  6091 00002810 8946FC                   mov [bp-4], ax
  6092 00002813 B80000                   mov ax, 0
  6093 00002816 8946F6                   mov [bp-10], ax
  6094                                  
  6095                                  ;-763   checknamelen();
  6096                                  
  6097 00002819 E898E7                   call checknamelen
  6098                                  
  6099                                  ;-764   strcpy(&procname, symbol);
  6100                                  
  6101 0000281C 8D06606D                 lea  ax, [symbol]
  6102 00002820 50                       push ax
  6103 00002821 8D0636A3                 lea  ax, [procname]
  6104 00002825 50                       push ax
  6105 00002826 E800DA                   call strcpy
  6106 00002829 83C404                   add  sp, 4
  6107                                  
  6108                                  ;-765   expect('(');
  6109                                  
  6110 0000282C 6A28                     push 40
  6111 0000282E E8E8E6                   call expect
  6112 00002831 83C402                   add  sp, 2
  6113                                  
  6114                                  ;-766 	if (istoken(')') ==0 ) {
  6115                                  
  6116 00002834 6A29                     push 41
  6117 00002836 E8BEE6                   call istoken
  6118 00002839 83C402                   add  sp, 2
  6119 0000283C 83F800                   cmp ax, 0
  6120 0000283F 0F857802                 jne .docall1323
  6121                                  
  6122                                  ;-767 	  do { narg++;
  6123                                  
  6124                                  .docall1324:
  6125 00002843 FF46FC                   inc  word[bp-4]
  6126                                  
  6127                                  ;-768 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;
  6128                                  
  6129 00002846 8B46FC                   mov ax, [bp-4]
  6130 00002849 83F809                   cmp ax, 9
  6131 0000284C 0F8E0900                 jle .docall1325
  6132 00002850 68[FF2A]                 push docall1_0
  6133 00002853 E845DD                   call error1
  6134 00002856 83C402                   add  sp, 2
  6135                                  .docall1325:
  6136 00002859 B80000                   mov ax, 0
  6137 0000285C 8946FA                   mov [bp-6], ax
  6138                                  
  6139                                  ;-769       if(istoken(T_CONST)) {t0=1; n0=lexval; }
  6140                                  
  6141 0000285F 680101                   push 257
  6142 00002862 E892E6                   call istoken
  6143 00002865 83C402                   add  sp, 2
  6144 00002868 08C0                     or  al, al
  6145 0000286A 0F840C00                 je .docall1326
  6146 0000286E B80100                   mov ax, 1
  6147 00002871 8946FA                   mov [bp-6], ax
  6148 00002874 A1[2B00]                 mov ax, [lexval]
  6149 00002877 8946F8                   mov [bp-8], ax
  6150                                  
  6151                                  ;-770       if(istoken(T_STRING)){t0=2; n0=nconst;
  6152                                  
  6153                                  .docall1326:
  6154 0000287A 680201                   push 258
  6155 0000287D E877E6                   call istoken
  6156 00002880 83C402                   add  sp, 2
  6157 00002883 08C0                     or  al, al
  6158 00002885 0F846300                 je .docall1327
  6159 00002889 B80200                   mov ax, 2
  6160 0000288C 8946FA                   mov [bp-6], ax
  6161 0000288F A1[2500]                 mov ax, [nconst]
  6162 00002892 8946F8                   mov [bp-8], ax
  6163                                  
  6164                                  ;-771         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");
  6165                                  
  6166 00002895 68[112B]                 push docall1_1
  6167 00002898 E8BDDA                   call eprs
  6168 0000289B 83C402                   add  sp, 2
  6169 0000289E 8D06E06D                 lea  ax, [fname]
  6170 000028A2 50                       push ax
  6171 000028A3 E8B2DA                   call eprs
  6172 000028A6 83C402                   add  sp, 2
  6173 000028A9 6A5F                     push 95
  6174 000028AB E897DA                   call eprc
  6175 000028AE 83C402                   add  sp, 2
  6176 000028B1 FF36[2500]               push word [nconst]
  6177 000028B5 E8BBDB                   call eprnum
  6178 000028B8 83C402                   add  sp, 2
  6179 000028BB 68[142B]                 push docall1_2
  6180 000028BE E897DA                   call eprs
  6181 000028C1 83C402                   add  sp, 2
  6182                                  
  6183                                  ;-772         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }
  6184                                  
  6185 000028C4 6A22                     push 34
  6186 000028C6 E87CDA                   call eprc
  6187 000028C9 83C402                   add  sp, 2
  6188 000028CC 8D06606D                 lea  ax, [symbol]
  6189 000028D0 50                       push ax
  6190 000028D1 E884DA                   call eprs
  6191 000028D4 83C402                   add  sp, 2
  6192 000028D7 6A22                     push 34
  6193 000028D9 E869DA                   call eprc
  6194 000028DC 83C402                   add  sp, 2
  6195 000028DF 68[192B]                 push docall1_3
  6196 000028E2 E873DA                   call eprs
  6197 000028E5 83C402                   add  sp, 2
  6198 000028E8 FF06[2500]               inc  word[nconst]
  6199                                  
  6200                                  ;-773       if(istoken('&'))     {t0=3; name1(); n0=searchname();}
  6201                                  
  6202                                  .docall1327:
  6203 000028EC 6A26                     push 38
  6204 000028EE E806E6                   call istoken
  6205 000028F1 83C402                   add  sp, 2
  6206 000028F4 08C0                     or  al, al
  6207 000028F6 0F840F00                 je .docall1328
  6208 000028FA B80300                   mov ax, 3
  6209 000028FD 8946FA                   mov [bp-6], ax
  6210 00002900 E8C1E7                   call name1
  6211 00002903 E888E7                   call searchname
  6212 00002906 8946F8                   mov [bp-8], ax
  6213                                  
  6214                                  ;-774       if(istoken(T_NAME))  { n0=checkreg();
  6215                                  
  6216                                  .docall1328:
  6217 00002909 680001                   push 256
  6218 0000290C E8E8E5                   call istoken
  6219 0000290F 83C402                   add  sp, 2
  6220 00002912 08C0                     or  al, al
  6221 00002914 0F844800                 je .docall1329
  6222 00002918 E822EC                   call checkreg
  6223 0000291B 8946F8                   mov [bp-8], ax
  6224                                  
  6225                                  ;-775         if (n0) t0=5;
  6226                                  
  6227 0000291E 8B46F8                   mov ax, [bp-8]
  6228 00002921 08C0                     or  al, al
  6229 00002923 0F840900                 je .docall1330
  6230 00002927 B80500                   mov ax, 5
  6231 0000292A 8946FA                   mov [bp-6], ax
  6232                                  
  6233                                  ;-776         else {t0=4; n0=searchname();
  6234                                  
  6235 0000292D E93000                   jmp .docall1331
  6236                                  .docall1330:
  6237 00002930 B80400                   mov ax, 4
  6238 00002933 8946FA                   mov [bp-6], ax
  6239 00002936 E855E7                   call searchname
  6240 00002939 8946F8                   mov [bp-8], ax
  6241                                  
  6242                                  ;-777           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }
  6243                                  
  6244 0000293C B8A96E                   mov ax, GType
  6245 0000293F A3[4400]                 mov word [p1], ax
  6246 00002942 A1[4400]                 mov ax, [p1]
  6247 00002945 0346F8                   add ax, [bp-8]
  6248 00002948 A3[4400]                 mov word [p1], ax
  6249 0000294B 8B1E[4400]               mov bx, [p1]
  6250 0000294F 8A07                     mov al, [bx]
  6251 00002951 B400                     mov ah, 0
  6252 00002953 83F826                   cmp ax, 38
  6253 00002956 0F850600                 jne .docall1332
  6254 0000295A B80300                   mov ax, 3
  6255 0000295D 8946FA                   mov [bp-6], ax
  6256                                  .docall1332:
  6257                                  .docall1331:
  6258                                  
  6259                                  ;-778       if (t0==0) error1("parameter not recognized (no * allowed)");
  6260                                  
  6261                                  .docall1329:
  6262 00002960 8B46FA                   mov ax, [bp-6]
  6263 00002963 83F800                   cmp ax, 0
  6264 00002966 0F850900                 jne .docall1333
  6265 0000296A 68[1C2B]                 push docall1_4
  6266 0000296D E82BDC                   call error1
  6267 00002970 83C402                   add  sp, 2
  6268                                  
  6269                                  ;-779       docalltype [narg] = t0;
  6270                                  
  6271                                  .docall1333:
  6272 00002973 8B46FA                   mov ax, [bp-6]
  6273 00002976 8B5EFC                   mov bx, [bp-4]
  6274 00002979 D1E3                     shl bx, 1
  6275 0000297B 89870EA3                 mov [docalltype+bx], ax
  6276                                  
  6277                                  ;-780       docallvalue[narg] = n0;
  6278                                  
  6279 0000297F 8B46F8                   mov ax, [bp-8]
  6280 00002982 8B5EFC                   mov bx, [bp-4]
  6281 00002985 D1E3                     shl bx, 1
  6282 00002987 898722A3                 mov [docallvalue+bx], ax
  6283                                  
  6284                                  ;-781     } while (istoken(','));
  6285                                  
  6286 0000298B 6A2C                     push 44
  6287 0000298D E867E5                   call istoken
  6288 00002990 83C402                   add  sp, 2
  6289 00002993 08C0                     or  al, al
  6290 00002995 0F840300                 je .docall1334
  6291 00002999 E9A7FE                   jmp .docall1324
  6292                                  .docall1334:
  6293                                  
  6294                                  ;-782 
  6295                                  
  6296                                  
  6297                                  ;-783   	expect(')');  i=narg;
  6298                                  
  6299 0000299C 6A29                     push 41
  6300 0000299E E878E5                   call expect
  6301 000029A1 83C402                   add  sp, 2
  6302 000029A4 8B46FC                   mov ax, [bp-4]
  6303 000029A7 8946FE                   mov [bp-2], ax
  6304                                  
  6305                                  ;-784     do {
  6306                                  
  6307                                  .docall1335:
  6308                                  
  6309                                  ;-785       t0 = docalltype [i];
  6310                                  
  6311 000029AA 8B5EFE                   mov bx, [bp-2]
  6312 000029AD D1E3                     shl bx, 1
  6313 000029AF 8B870EA3                 mov ax, [docalltype + bx]
  6314 000029B3 8946FA                   mov [bp-6], ax
  6315                                  
  6316                                  ;-786       n0 = docallvalue[i];
  6317                                  
  6318 000029B6 8B5EFE                   mov bx, [bp-2]
  6319 000029B9 D1E3                     shl bx, 1
  6320 000029BB 8B8722A3                 mov ax, [docallvalue + bx]
  6321 000029BF 8946F8                   mov [bp-8], ax
  6322                                  
  6323                                  ;-787       if(t0==1){ prs("\n push "); prunsign1(n0);}
  6324                                  
  6325 000029C2 8B46FA                   mov ax, [bp-6]
  6326 000029C5 83F801                   cmp ax, 1
  6327 000029C8 0F851200                 jne .docall1336
  6328 000029CC 68[442B]                 push docall1_5
  6329 000029CF E80DDA                   call prs
  6330 000029D2 83C402                   add  sp, 2
  6331 000029D5 FF76F8                   push word [bp-8]
  6332 000029D8 E859DB                   call prunsign1
  6333 000029DB 83C402                   add  sp, 2
  6334                                  
  6335                                  ;-788       if(t0==2){ prs("\n push ");
  6336                                  
  6337                                  .docall1336:
  6338 000029DE 8B46FA                   mov ax, [bp-6]
  6339 000029E1 83F802                   cmp ax, 2
  6340 000029E4 0F852500                 jne .docall1337
  6341 000029E8 68[4D2B]                 push docall1_6
  6342 000029EB E8F1D9                   call prs
  6343 000029EE 83C402                   add  sp, 2
  6344                                  
  6345                                  ;-789         prs(fname);prc(95);prunsign1(n0);}
  6346                                  
  6347 000029F1 8D06E06D                 lea  ax, [fname]
  6348 000029F5 50                       push ax
  6349 000029F6 E8E6D9                   call prs
  6350 000029F9 83C402                   add  sp, 2
  6351 000029FC 6A5F                     push 95
  6352 000029FE E885D9                   call prc
  6353 00002A01 83C402                   add  sp, 2
  6354 00002A04 FF76F8                   push word [bp-8]
  6355 00002A07 E82ADB                   call prunsign1
  6356 00002A0A 83C402                   add  sp, 2
  6357                                  
  6358                                  ;-790       if(t0==3){ prs("\n lea  ax, ");   v(n0);
  6359                                  
  6360                                  .docall1337:
  6361 00002A0D 8B46FA                   mov ax, [bp-6]
  6362 00002A10 83F803                   cmp ax, 3
  6363 00002A13 0F851B00                 jne .docall1338
  6364 00002A17 68[562B]                 push docall1_7
  6365 00002A1A E8C2D9                   call prs
  6366 00002A1D 83C402                   add  sp, 2
  6367 00002A20 FF76F8                   push word [bp-8]
  6368 00002A23 E85BE5                   call v
  6369 00002A26 83C402                   add  sp, 2
  6370                                  
  6371                                  ;-791         prs("\n push ax");}
  6372                                  
  6373 00002A29 68[632B]                 push docall1_8
  6374 00002A2C E8B0D9                   call prs
  6375 00002A2F 83C402                   add  sp, 2
  6376                                  
  6377                                  ;-792       if(t0==4){ gettypes(n0);
  6378                                  
  6379                                  .docall1338:
  6380 00002A32 8B46FA                   mov ax, [bp-6]
  6381 00002A35 83F804                   cmp ax, 4
  6382 00002A38 0F854300                 jne .docall1339
  6383 00002A3C FF76F8                   push word [bp-8]
  6384 00002A3F E883E7                   call gettypes
  6385 00002A42 83C402                   add  sp, 2
  6386                                  
  6387                                  ;-793         if(wi==2) { prs("\n push word "); v(n0);}
  6388                                  
  6389 00002A45 A1[3600]                 mov ax, [wi]
  6390 00002A48 83F802                   cmp ax, 2
  6391 00002A4B 0F851500                 jne .docall1340
  6392 00002A4F 68[6E2B]                 push docall1_9
  6393 00002A52 E88AD9                   call prs
  6394 00002A55 83C402                   add  sp, 2
  6395 00002A58 FF76F8                   push word [bp-8]
  6396 00002A5B E823E5                   call v
  6397 00002A5E 83C402                   add  sp, 2
  6398                                  
  6399                                  ;-794         else { prs("\n mov al, byte ");   v(n0);
  6400                                  
  6401 00002A61 E91B00                   jmp .docall1341
  6402                                  .docall1340:
  6403 00002A64 68[7C2B]                 push docall1_10
  6404 00002A67 E875D9                   call prs
  6405 00002A6A 83C402                   add  sp, 2
  6406 00002A6D FF76F8                   push word [bp-8]
  6407 00002A70 E80EE5                   call v
  6408 00002A73 83C402                   add  sp, 2
  6409                                  
  6410                                  ;-795         prs("\n mov ah, 0\n push ax"); } }
  6411                                  
  6412 00002A76 68[8D2B]                 push docall1_11
  6413 00002A79 E863D9                   call prs
  6414 00002A7C 83C402                   add  sp, 2
  6415                                  .docall1341:
  6416                                  
  6417                                  ;-796       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }
  6418                                  
  6419                                  .docall1339:
  6420 00002A7F 8B46FA                   mov ax, [bp-6]
  6421 00002A82 83F805                   cmp ax, 5
  6422 00002A85 0F852200                 jne .docall1342
  6423 00002A89 68[A42B]                 push docall1_12
  6424 00002A8C E850D9                   call prs
  6425 00002A8F 83C402                   add  sp, 2
  6426 00002A92 FF76F8                   push word [bp-8]
  6427 00002A95 E8B3EE                   call printreg
  6428 00002A98 83C402                   add  sp, 2
  6429 00002A9B 8B46F8                   mov ax, [bp-8]
  6430 00002A9E 83F82F                   cmp ax, 47 ;unsigned : 1
  6431 00002AA1 0F8C0600                 jl  .docall1343
  6432 00002AA5 8B46F6                   mov ax, [bp-10]
  6433 00002AA8 83C002                   add ax, 2
  6434                                  .docall1343:
  6435                                  
  6436                                  ;-797    i--; } while (i > 0);  }
  6437                                  
  6438                                  .docall1342:
  6439 00002AAB FF4EFE                   dec  word[bp-2]
  6440 00002AAE 8B46FE                   mov ax, [bp-2]
  6441 00002AB1 83F800                   cmp ax, 0
  6442 00002AB4 0F8E0300                 jle .docall1344
  6443 00002AB8 E9EFFE                   jmp .docall1335
  6444                                  .docall1344:
  6445                                  
  6446                                  ;-798 	 prs("\n call "); prs(&procname);
  6447                                  
  6448                                  .docall1323:
  6449 00002ABB 68[AD2B]                 push docall1_13
  6450 00002ABE E81ED9                   call prs
  6451 00002AC1 83C402                   add  sp, 2
  6452 00002AC4 8D0636A3                 lea  ax, [procname]
  6453 00002AC8 50                       push ax
  6454 00002AC9 E813D9                   call prs
  6455 00002ACC 83C402                   add  sp, 2
  6456                                  
  6457                                  ;-799 	 if (narg>0) {prs("\n add  sp, ");
  6458                                  
  6459 00002ACF 8B46FC                   mov ax, [bp-4]
  6460 00002AD2 83F800                   cmp ax, 0
  6461 00002AD5 0F8E2400                 jle .docall1345
  6462 00002AD9 68[B62B]                 push docall1_14
  6463 00002ADC E800D9                   call prs
  6464 00002ADF 83C402                   add  sp, 2
  6465                                  
  6466                                  ;-800      narg=narg+narg; narg=narg+sz32; prunsign1(narg); }
  6467                                  
  6468 00002AE2 8B46FC                   mov ax, [bp-4]
  6469 00002AE5 0346FC                   add ax, [bp-4]
  6470 00002AE8 8946FC                   mov [bp-4], ax
  6471 00002AEB 8B46FC                   mov ax, [bp-4]
  6472 00002AEE 0346F6                   add ax, [bp-10]
  6473 00002AF1 8946FC                   mov [bp-4], ax
  6474 00002AF4 FF76FC                   push word [bp-4]
  6475 00002AF7 E83ADA                   call prunsign1
  6476 00002AFA 83C402                   add  sp, 2
  6477                                  
  6478                                  ;-801  }
  6479                                  
  6480                                  .docall1345:
  6481                                  
  6482                                  ;-802 
  6483                                  
  6484                                  
  6485                                  ;-803  int expr(int isRight)
  6486 00002AFD C9                       LEAVE
  6487 00002AFE C3                       ret
  6488 00002AFF 4D61782E2039207061-     docall1_0 db "Max. 9 parameters",0
  6489 00002B08 72616D657465727300 
  6490 00002B11 5C6E00                  docall1_1 db "\n",0
  6491 00002B14 2064622000              docall1_2 db " db ",0
  6492 00002B19 2C3000                  docall1_3 db ",0",0
  6493 00002B1C 706172616D65746572-     docall1_4 db "parameter not recognized (no * allowed)",0
  6494 00002B25 206E6F74207265636F-
  6495 00002B2E 676E697A656420286E-
  6496 00002B37 6F202A20616C6C6F77-
  6497 00002B40 65642900           
  6498 00002B44 5C6E20707573682000      docall1_5 db "\n push ",0
  6499 00002B4D 5C6E20707573682000      docall1_6 db "\n push ",0
  6500 00002B56 5C6E206C6561202061-     docall1_7 db "\n lea  ax, ",0
  6501 00002B5F 782C2000           
  6502 00002B63 5C6E20707573682061-     docall1_8 db "\n push ax",0
  6503 00002B6C 7800               
  6504 00002B6E 5C6E20707573682077-     docall1_9 db "\n push word ",0
  6505 00002B77 6F72642000         
  6506 00002B7C 5C6E206D6F7620616C-     docall1_10 db "\n mov al, byte ",0
  6507 00002B85 2C20627974652000   
  6508 00002B8D 5C6E206D6F76206168-     docall1_11 db "\n mov ah, 0\n push ax",0
  6509 00002B96 2C20305C6E20707573-
  6510 00002B9F 6820617800         
  6511 00002BA4 5C6E20707573682000      docall1_12 db "\n push ",0
  6512 00002BAD 5C6E2063616C6C2000      docall1_13 db "\n call ",0
  6513 00002BB6 5C6E20616464202073-     docall1_14 db "\n add  sp, ",0
  6514 00002BBF 702C2000           
  6515                                  ENDP
  6516                                  
  6517                                  expr: PROC
  6518                                  
  6519                                  ;-804  { int mode; int id1;     int ixarr; int ixconst;
  6520                                  
  6521                                  
  6522                                  ;-805    int ids;  int isCONST; int i;     unsigned char *p;
  6523                                  
  6524                                  
  6525                                  ;-806    if (istoken(T_CONST)) {
  6526                                  ;
  6527 00002BC3 C8100000                 ENTER  16,0
  6528 00002BC7 680101                   push 257
  6529 00002BCA E82AE3                   call istoken
  6530 00002BCD 83C402                   add  sp, 2
  6531 00002BD0 08C0                     or  al, al
  6532 00002BD2 0F841900                 je .expr346
  6533                                  
  6534                                  ;-807      prs("\n mov ax, "); prunsign1(lexval); return 4; }
  6535                                  
  6536 00002BD6 68[5A2F]                 push expr_0
  6537 00002BD9 E803D8                   call prs
  6538 00002BDC 83C402                   add  sp, 2
  6539 00002BDF FF36[2B00]               push word [lexval]
  6540 00002BE3 E84ED9                   call prunsign1
  6541 00002BE6 83C402                   add  sp, 2
  6542 00002BE9 B80400                   mov ax, 4
  6543 00002BEC E96903                   jmp .retnexpr
  6544                                  
  6545                                  ;-808    mode=typeName(); /*0=V,1=*,2=&*/
  6546                                  
  6547                                  .expr346:
  6548 00002BEF E8FAE4                   call typeName
  6549 00002BF2 8946FE                   mov [bp-2], ax
  6550                                  
  6551                                  ;-809    ireg1=checkreg();
  6552                                  
  6553 00002BF5 E845E9                   call checkreg
  6554 00002BF8 A3[4B00]                 mov word [ireg1], ax
  6555                                  
  6556                                  ;-810    if (ireg1) { doreg1(0); return; }
  6557                                  
  6558 00002BFB A1[4B00]                 mov ax, [ireg1]
  6559 00002BFE 08C0                     or  al, al
  6560 00002C00 0F840B00                 je .expr347
  6561 00002C04 6A00                     push 0
  6562 00002C06 E8AEEE                   call doreg1
  6563 00002C09 83C402                   add  sp, 2
  6564 00002C0C E94903                   jmp .retnexpr
  6565                                  
  6566                                  ;-811    if (token=='(')  {docall1(); goto e1; }
  6567                                  
  6568                                  .expr347:
  6569 00002C0F A1[1E00]                 mov ax, [token]
  6570 00002C12 83F828                   cmp ax, 40
  6571 00002C15 0F850600                 jne .expr348
  6572 00002C19 E8EDFB                   call docall1
  6573 00002C1C E92F02                   jmp .e1
  6574                                  
  6575                                  ;-812    if (isreg()) goto e1;
  6576                                  
  6577                                  .expr348:
  6578 00002C1F E8D8F4                   call isreg
  6579 00002C22 08C0                     or  al, al
  6580 00002C24 0F840300                 je .expr349
  6581 00002C28 E92302                   jmp .e1
  6582                                  
  6583                                  ;-813 
  6584                                  
  6585                                  
  6586                                  ;-814    id1=searchname(); gettypes(id1); ids=signi;
  6587                                  
  6588                                  .expr349:
  6589 00002C2B E860E4                   call searchname
  6590 00002C2E 8946FC                   mov [bp-4], ax
  6591 00002C31 FF76FC                   push word [bp-4]
  6592 00002C34 E88EE5                   call gettypes
  6593 00002C37 83C402                   add  sp, 2
  6594 00002C3A A1[3000]                 mov ax, [signi]
  6595 00002C3D 8946F6                   mov [bp-10], ax
  6596                                  
  6597                                  ;-815    ixarr=0;  ixconst=0;
  6598                                  
  6599 00002C40 B80000                   mov ax, 0
  6600 00002C43 8946FA                   mov [bp-6], ax
  6601 00002C46 B80000                   mov ax, 0
  6602 00002C49 8946F8                   mov [bp-8], ax
  6603                                  
  6604                                  ;-816      if (istoken('[')) { if (istoken(T_CONST)) {
  6605                                  
  6606 00002C4C 6A5B                     push 91
  6607 00002C4E E8A6E2                   call istoken
  6608 00002C51 83C402                   add  sp, 2
  6609 00002C54 08C0                     or  al, al
  6610 00002C56 0F845900                 je .expr350
  6611 00002C5A 680101                   push 257
  6612 00002C5D E897E2                   call istoken
  6613 00002C60 83C402                   add  sp, 2
  6614 00002C63 08C0                     or  al, al
  6615 00002C65 0F841700                 je .expr351
  6616                                  
  6617                                  ;-817        ixconst=1; ixarr=lexval; expect(']');  }
  6618                                  
  6619 00002C69 B80100                   mov ax, 1
  6620 00002C6C 8946F8                   mov [bp-8], ax
  6621 00002C6F A1[2B00]                 mov ax, [lexval]
  6622 00002C72 8946FA                   mov [bp-6], ax
  6623 00002C75 6A5D                     push 93
  6624 00002C77 E89FE2                   call expect
  6625 00002C7A 83C402                   add  sp, 2
  6626                                  
  6627                                  ;-818      else {ixarr=searchname(); expect(T_NAME); expect(']');
  6628                                  
  6629 00002C7D E93300                   jmp .expr352
  6630                                  .expr351:
  6631 00002C80 E80BE4                   call searchname
  6632 00002C83 8946FA                   mov [bp-6], ax
  6633 00002C86 680001                   push 256
  6634 00002C89 E88DE2                   call expect
  6635 00002C8C 83C402                   add  sp, 2
  6636 00002C8F 6A5D                     push 93
  6637 00002C91 E885E2                   call expect
  6638 00002C94 83C402                   add  sp, 2
  6639                                  
  6640                                  ;-819      gettypes(ixarr);
  6641                                  
  6642 00002C97 FF76FA                   push word [bp-6]
  6643 00002C9A E828E5                   call gettypes
  6644 00002C9D 83C402                   add  sp, 2
  6645                                  
  6646                                  ;-820      if (widthi != 2) error1("Array index must be number or int"); } }
  6647                                  
  6648 00002CA0 A1[3300]                 mov ax, [widthi]
  6649 00002CA3 83F802                   cmp ax, 2
  6650 00002CA6 0F840900                 je  .expr353
  6651 00002CAA 68[662F]                 push expr_1
  6652 00002CAD E8EBD8                   call error1
  6653 00002CB0 83C402                   add  sp, 2
  6654                                  .expr353:
  6655                                  .expr352:
  6656                                  
  6657                                  ;-821    if (istoken(T_PLUSPLUS  )) {if(mode)error1("Only var allowed");
  6658                                  
  6659                                  .expr350:
  6660 00002CB3 68C304                   push 1219
  6661 00002CB6 E83EE2                   call istoken
  6662 00002CB9 83C402                   add  sp, 2
  6663 00002CBC 08C0                     or  al, al
  6664 00002CBE 0F844600                 je .expr354
  6665 00002CC2 8B46FE                   mov ax, [bp-2]
  6666 00002CC5 08C0                     or  al, al
  6667 00002CC7 0F840900                 je .expr355
  6668 00002CCB 68[882F]                 push expr_2
  6669 00002CCE E8CAD8                   call error1
  6670 00002CD1 83C402                   add  sp, 2
  6671                                  
  6672                                  ;-822       prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");
  6673                                  
  6674                                  .expr355:
  6675 00002CD4 68[992F]                 push expr_3
  6676 00002CD7 E805D7                   call prs
  6677 00002CDA 83C402                   add  sp, 2
  6678 00002CDD A1[3600]                 mov ax, [wi]
  6679 00002CE0 83F802                   cmp ax, 2
  6680 00002CE3 0F850C00                 jne .expr356
  6681 00002CE7 68[A22F]                 push expr_4
  6682 00002CEA E8F2D6                   call prs
  6683 00002CED 83C402                   add  sp, 2
  6684 00002CF0 E90900                   jmp .expr357
  6685                                  .expr356:
  6686 00002CF3 68[A72F]                 push expr_5
  6687 00002CF6 E8E6D6                   call prs
  6688 00002CF9 83C402                   add  sp, 2
  6689                                  
  6690                                  ;-823       v(id1); goto e1;}
  6691                                  
  6692                                  .expr357:
  6693 00002CFC FF76FC                   push word [bp-4]
  6694 00002CFF E87FE2                   call v
  6695 00002D02 83C402                   add  sp, 2
  6696 00002D05 E94601                   jmp .e1
  6697                                  
  6698                                  ;-824    if (istoken(T_MINUSMINUS)) {if(mode)error1("Only var allowed");
  6699                                  
  6700                                  .expr354:
  6701 00002D08 68C904                   push 1225
  6702 00002D0B E8E9E1                   call istoken
  6703 00002D0E 83C402                   add  sp, 2
  6704 00002D11 08C0                     or  al, al
  6705 00002D13 0F844600                 je .expr358
  6706 00002D17 8B46FE                   mov ax, [bp-2]
  6707 00002D1A 08C0                     or  al, al
  6708 00002D1C 0F840900                 je .expr359
  6709 00002D20 68[AC2F]                 push expr_6
  6710 00002D23 E875D8                   call error1
  6711 00002D26 83C402                   add  sp, 2
  6712                                  
  6713                                  ;-825       prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");
  6714                                  
  6715                                  .expr359:
  6716 00002D29 68[BD2F]                 push expr_7
  6717 00002D2C E8B0D6                   call prs
  6718 00002D2F 83C402                   add  sp, 2
  6719 00002D32 A1[3600]                 mov ax, [wi]
  6720 00002D35 83F802                   cmp ax, 2
  6721 00002D38 0F850C00                 jne .expr360
  6722 00002D3C 68[C62F]                 push expr_8
  6723 00002D3F E89DD6                   call prs
  6724 00002D42 83C402                   add  sp, 2
  6725 00002D45 E90900                   jmp .expr361
  6726                                  .expr360:
  6727 00002D48 68[CB2F]                 push expr_9
  6728 00002D4B E891D6                   call prs
  6729 00002D4E 83C402                   add  sp, 2
  6730                                  
  6731                                  ;-826       v(id1); goto e1;}
  6732                                  
  6733                                  .expr361:
  6734 00002D51 FF76FC                   push word [bp-4]
  6735 00002D54 E82AE2                   call v
  6736 00002D57 83C402                   add  sp, 2
  6737 00002D5A E9F100                   jmp .e1
  6738                                  
  6739                                  ;-827 
  6740                                  
  6741                                  
  6742                                  ;-828    if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}
  6743                                  
  6744                                  .expr358:
  6745 00002D5D 68CE04                   push 1230
  6746 00002D60 E894E1                   call istoken
  6747 00002D63 83C402                   add  sp, 2
  6748 00002D66 08C0                     or  al, al
  6749 00002D68 0F841200                 je .expr362
  6750 00002D6C FF76FC                   push word [bp-4]
  6751 00002D6F FF76FE                   push word [bp-2]
  6752 00002D72 68[D02F]                 push expr_10
  6753 00002D75 E835EF                   call compoundass
  6754 00002D78 83C406                   add  sp, 6
  6755 00002D7B E9D000                   jmp .e1
  6756                                  
  6757                                  ;-829    if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}
  6758                                  
  6759                                  .expr362:
  6760 00002D7E 68CF04                   push 1231
  6761 00002D81 E873E1                   call istoken
  6762 00002D84 83C402                   add  sp, 2
  6763 00002D87 08C0                     or  al, al
  6764 00002D89 0F841200                 je .expr363
  6765 00002D8D FF76FC                   push word [bp-4]
  6766 00002D90 FF76FE                   push word [bp-2]
  6767 00002D93 68[D42F]                 push expr_11
  6768 00002D96 E814EF                   call compoundass
  6769 00002D99 83C406                   add  sp, 6
  6770 00002D9C E9AF00                   jmp .e1
  6771                                  
  6772                                  ;-830    if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}
  6773                                  
  6774                                  .expr363:
  6775 00002D9F 68D204                   push 1234
  6776 00002DA2 E852E1                   call istoken
  6777 00002DA5 83C402                   add  sp, 2
  6778 00002DA8 08C0                     or  al, al
  6779 00002DAA 0F841200                 je .expr364
  6780 00002DAE FF76FC                   push word [bp-4]
  6781 00002DB1 FF76FE                   push word [bp-2]
  6782 00002DB4 68[D82F]                 push expr_12
  6783 00002DB7 E8F3EE                   call compoundass
  6784 00002DBA 83C406                   add  sp, 6
  6785 00002DBD E98E00                   jmp .e1
  6786                                  
  6787                                  ;-831    if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}
  6788                                  
  6789                                  .expr364:
  6790 00002DC0 68D304                   push 1235
  6791 00002DC3 E831E1                   call istoken
  6792 00002DC6 83C402                   add  sp, 2
  6793 00002DC9 08C0                     or  al, al
  6794 00002DCB 0F841200                 je .expr365
  6795 00002DCF FF76FC                   push word [bp-4]
  6796 00002DD2 FF76FE                   push word [bp-2]
  6797 00002DD5 68[DC2F]                 push expr_13
  6798 00002DD8 E8D2EE                   call compoundass
  6799 00002DDB 83C406                   add  sp, 6
  6800 00002DDE E96D00                   jmp .e1
  6801                                  
  6802                                  ;-832    if (istoken(T_MULASS    )) {error1("not implemented");}
  6803                                  
  6804                                  .expr365:
  6805 00002DE1 68D004                   push 1232
  6806 00002DE4 E810E1                   call istoken
  6807 00002DE7 83C402                   add  sp, 2
  6808 00002DEA 08C0                     or  al, al
  6809 00002DEC 0F840900                 je .expr366
  6810 00002DF0 68[DF2F]                 push expr_14
  6811 00002DF3 E8A5D7                   call error1
  6812 00002DF6 83C402                   add  sp, 2
  6813                                  
  6814                                  ;-833    if (istoken(T_DIVASS    )) {error1("not implemented");}
  6815                                  
  6816                                  .expr366:
  6817 00002DF9 68D104                   push 1233
  6818 00002DFC E8F8E0                   call istoken
  6819 00002DFF 83C402                   add  sp, 2
  6820 00002E02 08C0                     or  al, al
  6821 00002E04 0F840900                 je .expr367
  6822 00002E08 68[EF2F]                 push expr_15
  6823 00002E0B E88DD7                   call error1
  6824 00002E0E 83C402                   add  sp, 2
  6825                                  
  6826                                  ;-834 
  6827                                  
  6828                                  
  6829                                  ;-835    if (istoken('=')) {
  6830                                  
  6831                                  .expr367:
  6832 00002E11 6A3D                     push 61
  6833 00002E13 E8E1E0                   call istoken
  6834 00002E16 83C402                   add  sp, 2
  6835 00002E19 08C0                     or  al, al
  6836 00002E1B 0F841D00                 je .expr368
  6837                                  
  6838                                  ;-836        expr(1);
  6839                                  
  6840 00002E1F 6A01                     push 1
  6841 00002E21 E89FFD                   call expr
  6842 00002E24 83C402                   add  sp, 2
  6843                                  
  6844                                  ;-837        doassign(mode, id1, ixarr, ixconst);
  6845                                  
  6846 00002E27 FF76F8                   push word [bp-8]
  6847 00002E2A FF76FA                   push word [bp-6]
  6848 00002E2D FF76FC                   push word [bp-4]
  6849 00002E30 FF76FE                   push word [bp-2]
  6850 00002E33 E820F5                   call doassign
  6851 00002E36 83C408                   add  sp, 8
  6852                                  
  6853                                  ;-838        goto e1;
  6854                                  
  6855 00002E39 E91200                   jmp .e1
  6856                                  
  6857                                  ;-839    }
  6858                                  
  6859                                  
  6860                                  ;-840    dovar1(mode, "mov", ixarr, id1);
  6861                                  
  6862                                  .expr368:
  6863 00002E3C FF76FC                   push word [bp-4]
  6864 00002E3F FF76FA                   push word [bp-6]
  6865 00002E42 68[FF2F]                 push expr_16
  6866 00002E45 FF76FE                   push word [bp-2]
  6867 00002E48 E80EEF                   call dovar1
  6868 00002E4B 83C408                   add  sp, 8
  6869                                  
  6870                                  ;-841 
  6871                                  
  6872                                  
  6873                                  ;-842  e1:    if (istoken('+')) rterm("add");
  6874                                  
  6875                                  .e1:
  6876 00002E4E 6A2B                     push 43
  6877 00002E50 E8A4E0                   call istoken
  6878 00002E53 83C402                   add  sp, 2
  6879 00002E56 08C0                     or  al, al
  6880 00002E58 0F840C00                 je .expr369
  6881 00002E5C 68[0330]                 push expr_17
  6882 00002E5F E8DFF0                   call rterm
  6883 00002E62 83C402                   add  sp, 2
  6884                                  
  6885                                  ;-843    else if (istoken('-')) rterm("sub" );
  6886                                  
  6887 00002E65 E9CF00                   jmp .expr370
  6888                                  .expr369:
  6889 00002E68 6A2D                     push 45
  6890 00002E6A E88AE0                   call istoken
  6891 00002E6D 83C402                   add  sp, 2
  6892 00002E70 08C0                     or  al, al
  6893 00002E72 0F840C00                 je .expr371
  6894 00002E76 68[0730]                 push expr_18
  6895 00002E79 E8C5F0                   call rterm
  6896 00002E7C 83C402                   add  sp, 2
  6897                                  
  6898                                  ;-844    else if (istoken('&')) rterm("and" );
  6899                                  
  6900 00002E7F E9B500                   jmp .expr372
  6901                                  .expr371:
  6902 00002E82 6A26                     push 38
  6903 00002E84 E870E0                   call istoken
  6904 00002E87 83C402                   add  sp, 2
  6905 00002E8A 08C0                     or  al, al
  6906 00002E8C 0F840C00                 je .expr373
  6907 00002E90 68[0B30]                 push expr_19
  6908 00002E93 E8ABF0                   call rterm
  6909 00002E96 83C402                   add  sp, 2
  6910                                  
  6911                                  ;-845    else if (istoken('|')) rterm("or" );
  6912                                  
  6913 00002E99 E99B00                   jmp .expr374
  6914                                  .expr373:
  6915 00002E9C 6A7C                     push 124
  6916 00002E9E E856E0                   call istoken
  6917 00002EA1 83C402                   add  sp, 2
  6918 00002EA4 08C0                     or  al, al
  6919 00002EA6 0F840C00                 je .expr375
  6920 00002EAA 68[0F30]                 push expr_20
  6921 00002EAD E891F0                   call rterm
  6922 00002EB0 83C402                   add  sp, 2
  6923                                  
  6924                                  ;-846    else if (istoken(T_LESSLESS)) rterm("shl");
  6925                                  
  6926 00002EB3 E98100                   jmp .expr376
  6927                                  .expr375:
  6928 00002EB6 68D804                   push 1240
  6929 00002EB9 E83BE0                   call istoken
  6930 00002EBC 83C402                   add  sp, 2
  6931 00002EBF 08C0                     or  al, al
  6932 00002EC1 0F840C00                 je .expr377
  6933 00002EC5 68[1230]                 push expr_21
  6934 00002EC8 E876F0                   call rterm
  6935 00002ECB 83C402                   add  sp, 2
  6936                                  
  6937                                  ;-847    else if (istoken(T_GREATGREAT)) rterm("shr");
  6938                                  
  6939 00002ECE E96600                   jmp .expr378
  6940                                  .expr377:
  6941 00002ED1 68D904                   push 1241
  6942 00002ED4 E820E0                   call istoken
  6943 00002ED7 83C402                   add  sp, 2
  6944 00002EDA 08C0                     or  al, al
  6945 00002EDC 0F840C00                 je .expr379
  6946 00002EE0 68[1630]                 push expr_22
  6947 00002EE3 E85BF0                   call rterm
  6948 00002EE6 83C402                   add  sp, 2
  6949                                  
  6950                                  ;-848    else if (istoken('*')) domul (ids);
  6951                                  
  6952 00002EE9 E94B00                   jmp .expr380
  6953                                  .expr379:
  6954 00002EEC 6A2A                     push 42
  6955 00002EEE E806E0                   call istoken
  6956 00002EF1 83C402                   add  sp, 2
  6957 00002EF4 08C0                     or  al, al
  6958 00002EF6 0F840C00                 je .expr381
  6959 00002EFA FF76F6                   push word [bp-10]
  6960 00002EFD E89FF6                   call domul
  6961 00002F00 83C402                   add  sp, 2
  6962                                  
  6963                                  ;-849    else if (istoken('/')) doidiv(ids);
  6964                                  
  6965 00002F03 E93100                   jmp .expr382
  6966                                  .expr381:
  6967 00002F06 6A2F                     push 47
  6968 00002F08 E8ECDF                   call istoken
  6969 00002F0B 83C402                   add  sp, 2
  6970 00002F0E 08C0                     or  al, al
  6971 00002F10 0F840C00                 je .expr383
  6972 00002F14 FF76F6                   push word [bp-10]
  6973 00002F17 E826F7                   call doidiv
  6974 00002F1A 83C402                   add  sp, 2
  6975                                  
  6976                                  ;-850    else if (istoken('%')) domod (ids);
  6977                                  
  6978 00002F1D E91700                   jmp .expr384
  6979                                  .expr383:
  6980 00002F20 6A25                     push 37
  6981 00002F22 E8D2DF                   call istoken
  6982 00002F25 83C402                   add  sp, 2
  6983 00002F28 08C0                     or  al, al
  6984 00002F2A 0F840900                 je .expr385
  6985 00002F2E FF76F6                   push word [bp-10]
  6986 00002F31 E8AFF8                   call domod
  6987 00002F34 83C402                   add  sp, 2
  6988                                  
  6989                                  ;-851    if (isrelational()) { rterm("cmp"); cmpneg(ids);}
  6990                                  
  6991                                  .expr385:
  6992                                  .expr384:
  6993                                  .expr382:
  6994                                  .expr380:
  6995                                  .expr378:
  6996                                  .expr376:
  6997                                  .expr374:
  6998                                  .expr372:
  6999                                  .expr370:
  7000 00002F37 E89CE5                   call isrelational
  7001 00002F3A 08C0                     or  al, al
  7002 00002F3C 0F841200                 je .expr386
  7003 00002F40 68[1A30]                 push expr_23
  7004 00002F43 E8FBEF                   call rterm
  7005 00002F46 83C402                   add  sp, 2
  7006 00002F49 FF76F6                   push word [bp-10]
  7007 00002F4C E817E4                   call cmpneg
  7008 00002F4F 83C402                   add  sp, 2
  7009                                  
  7010                                  ;-852    return 0;
  7011                                  
  7012                                  .expr386:
  7013 00002F52 B80000                   mov ax, 0
  7014 00002F55 E90000                   jmp .retnexpr
  7015                                  
  7016                                  ;-853  }
  7017                                  
  7018                                  
  7019                                  ;-854 
  7020                                  
  7021                                  
  7022                                  ;-855  int pexpr() {expect('('); iscmp=0;
  7023                                  
  7024 00002F58 C9                       .retnexpr: LEAVE
  7025 00002F59 C3                       ret
  7026 00002F5A 5C6E206D6F76206178-     expr_0 db "\n mov ax, ",0
  7027 00002F63 2C2000             
  7028 00002F66 417272617920696E64-     expr_1 db "Array index must be number or int",0
  7029 00002F6F 6578206D7573742062-
  7030 00002F78 65206E756D62657220-
  7031 00002F81 6F7220696E7400     
  7032 00002F88 4F6E6C792076617220-     expr_2 db "Only var allowed",0
  7033 00002F91 616C6C6F77656400   
  7034 00002F99 5C6E20696E63202000      expr_3 db "\n inc  ",0
  7035 00002FA2 776F726400              expr_4 db "word",0
  7036 00002FA7 6279746500              expr_5 db "byte",0
  7037 00002FAC 4F6E6C792076617220-     expr_6 db "Only var allowed",0
  7038 00002FB5 616C6C6F77656400   
  7039 00002FBD 5C6E20646563202000      expr_7 db "\n dec  ",0
  7040 00002FC6 776F726400              expr_8 db "word",0
  7041 00002FCB 6279746500              expr_9 db "byte",0
  7042 00002FD0 61646400                expr_10 db "add",0
  7043 00002FD4 73756200                expr_11 db "sub",0
  7044 00002FD8 616E6400                expr_12 db "and",0
  7045 00002FDC 6F7200                  expr_13 db "or",0
  7046 00002FDF 6E6F7420696D706C65-     expr_14 db "not implemented",0
  7047 00002FE8 6D656E74656400     
  7048 00002FEF 6E6F7420696D706C65-     expr_15 db "not implemented",0
  7049 00002FF8 6D656E74656400     
  7050 00002FFF 6D6F7600                expr_16 db "mov",0
  7051 00003003 61646400                expr_17 db "add",0
  7052 00003007 73756200                expr_18 db "sub",0
  7053 0000300B 616E6400                expr_19 db "and",0
  7054 0000300F 6F7200                  expr_20 db "or",0
  7055 00003012 73686C00                expr_21 db "shl",0
  7056 00003016 73687200                expr_22 db "shr",0
  7057 0000301A 636D7000                expr_23 db "cmp",0
  7058                                  ENDP
  7059                                  
  7060                                  pexpr: PROC
  7061 0000301E 6A28                     push 40
  7062 00003020 E8F6DE                   call expect
  7063 00003023 83C402                   add  sp, 2
  7064 00003026 B80000                   mov ax, 0
  7065 00003029 A3[2300]                 mov word [iscmp], ax
  7066                                  
  7067                                  ;-856    if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}
  7068                                  
  7069 0000302C A1[1E00]                 mov ax, [token]
  7070 0000302F 3D0001                   cmp ax, 256
  7071 00003032 0F853400                 jne .pexpr387
  7072 00003036 68[9930]                 push pexpr_0
  7073 00003039 8D06606D                 lea  ax, [symbol]
  7074 0000303D 50                       push ax
  7075 0000303E E81ED2                   call eqstr
  7076 00003041 83C404                   add  sp, 4
  7077 00003044 08C0                     or  al, al
  7078 00003046 0F840600                 je .pexpr388
  7079 0000304A E86BE9                   call constantexpr
  7080 0000304D E94800                   jmp .retnpexpr
  7081                                  
  7082                                  ;-857      ireg1=checkreg();
  7083                                  
  7084                                  .pexpr388:
  7085 00003050 E8EAE4                   call checkreg
  7086 00003053 A3[4B00]                 mov word [ireg1], ax
  7087                                  
  7088                                  ;-858      if (ireg1) { doreg1(1); return; }  }
  7089                                  
  7090 00003056 A1[4B00]                 mov ax, [ireg1]
  7091 00003059 08C0                     or  al, al
  7092 0000305B 0F840B00                 je .pexpr389
  7093 0000305F 6A01                     push 1
  7094 00003061 E853EA                   call doreg1
  7095 00003064 83C402                   add  sp, 2
  7096 00003067 E92E00                   jmp .retnpexpr
  7097                                  .pexpr389:
  7098                                  
  7099                                  ;-859    expr(0);
  7100                                  
  7101                                  .pexpr387:
  7102 0000306A 6A00                     push 0
  7103 0000306C E854FB                   call expr
  7104 0000306F 83C402                   add  sp, 2
  7105                                  
  7106                                  ;-860    if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);
  7107                                  
  7108 00003072 A1[2300]                 mov ax, [iscmp]
  7109 00003075 83F800                   cmp ax, 0
  7110 00003078 0F850900                 jne .pexpr390
  7111 0000307C 68[9B30]                 push pexpr_1
  7112 0000307F E85DD3                   call prs
  7113 00003082 83C402                   add  sp, 2
  7114                                  .pexpr390:
  7115 00003085 8D06E06D                 lea  ax, [fname]
  7116 00003089 50                       push ax
  7117 0000308A E852D3                   call prs
  7118 0000308D 83C402                   add  sp, 2
  7119                                  
  7120                                  ;-861    expect(')');
  7121                                  
  7122 00003090 6A29                     push 41
  7123 00003092 E884DE                   call expect
  7124 00003095 83C402                   add  sp, 2
  7125                                  
  7126                                  ;-862  }
  7127                                  
  7128                                  
  7129                                  ;-863 
  7130                                  
  7131                                  
  7132                                  ;-864 /***************************************************************/
  7133                                  
  7134                                  
  7135                                  ;-865 
  7136                                  
  7137                                  
  7138                                  ;-866 int prlabel(int n) {
  7139                                  
  7140                                   .retnpexpr:
  7141 00003098 C3                       ret
  7142 00003099 5F00                    pexpr_0 db "_",0
  7143 0000309B 5C6E206F722020616C-     pexpr_1 db "\n or  al, al\n je .",0
  7144 000030A4 2C20616C5C6E206A65-
  7145 000030AD 202E00             
  7146                                  ENDP
  7147                                  
  7148                                  prlabel: PROC
  7149                                  
  7150                                  ;-867     prs("\n.");
  7151                                  ;
  7152 000030B0 C8000000                 ENTER  0,0
  7153 000030B4 68[DB30]                 push prlabel_0
  7154 000030B7 E825D3                   call prs
  7155 000030BA 83C402                   add  sp, 2
  7156                                  
  7157                                  ;-868     prs(fname);
  7158                                  
  7159 000030BD 8D06E06D                 lea  ax, [fname]
  7160 000030C1 50                       push ax
  7161 000030C2 E81AD3                   call prs
  7162 000030C5 83C402                   add  sp, 2
  7163                                  
  7164                                  ;-869     prunsign1(n);
  7165                                  
  7166 000030C8 FF7604                   push word [bp+4]
  7167 000030CB E866D4                   call prunsign1
  7168 000030CE 83C402                   add  sp, 2
  7169                                  
  7170                                  ;-870     prc(':');
  7171                                  
  7172 000030D1 6A3A                     push 58
  7173 000030D3 E8B0D2                   call prc
  7174 000030D6 83C402                   add  sp, 2
  7175                                  
  7176                                  ;-871 }
  7177                                  
  7178                                  
  7179                                  ;-872 int prjump (int n) {
  7180 000030D9 C9                       LEAVE
  7181 000030DA C3                       ret
  7182 000030DB 5C6E2E00                prlabel_0 db "\n.",0
  7183                                  ENDP
  7184                                  
  7185                                  prjump: PROC
  7186                                  
  7187                                  ;-873     prs("\n jmp .");
  7188                                  ;
  7189 000030DF C8000000                 ENTER  0,0
  7190 000030E3 68[0231]                 push prjump_0
  7191 000030E6 E8F6D2                   call prs
  7192 000030E9 83C402                   add  sp, 2
  7193                                  
  7194                                  ;-874     prs(fname);
  7195                                  
  7196 000030EC 8D06E06D                 lea  ax, [fname]
  7197 000030F0 50                       push ax
  7198 000030F1 E8EBD2                   call prs
  7199 000030F4 83C402                   add  sp, 2
  7200                                  
  7201                                  ;-875     prunsign1(n);
  7202                                  
  7203 000030F7 FF7604                   push word [bp+4]
  7204 000030FA E837D4                   call prunsign1
  7205 000030FD 83C402                   add  sp, 2
  7206                                  
  7207                                  ;-876 }
  7208                                  
  7209                                  
  7210                                  ;-877 
  7211                                  
  7212                                  
  7213                                  ;-878 int stmt() {
  7214 00003100 C9                       LEAVE
  7215 00003101 C3                       ret
  7216 00003102 5C6E206A6D70202E00      prjump_0 db "\n jmp .",0
  7217                                  ENDP
  7218                                  
  7219                                  stmt: PROC
  7220                                  
  7221                                  ;-879     int c; char cha;
  7222                                  
  7223                                  
  7224                                  ;-880     int jdest; int tst; int jtemp;
  7225                                  
  7226                                  
  7227                                  ;-881        if(istoken('{'))     {while(istoken('}')==0) stmt();}
  7228                                  ;
  7229 0000310B C80A0000                 ENTER  10,0
  7230 0000310F 6A7B                     push 123
  7231 00003111 E8E3DD                   call istoken
  7232 00003114 83C402                   add  sp, 2
  7233 00003117 08C0                     or  al, al
  7234 00003119 0F841700                 je .stmt391
  7235                                  .stmt392:
  7236 0000311D 6A7D                     push 125
  7237 0000311F E8D5DD                   call istoken
  7238 00003122 83C402                   add  sp, 2
  7239 00003125 83F800                   cmp ax, 0
  7240 00003128 0F850500                 jne .stmt393
  7241 0000312C E8DCFF                   call stmt
  7242 0000312F EBEC                     jmp .stmt392
  7243                                  .stmt393:
  7244                                  
  7245                                  ;-882   else if(istoken(T_IF)) {
  7246                                  
  7247 00003131 E9D002                   jmp .stmt394
  7248                                  .stmt391:
  7249 00003134 680102                   push 513
  7250 00003137 E8BDDD                   call istoken
  7251 0000313A 83C402                   add  sp, 2
  7252 0000313D 08C0                     or  al, al
  7253 0000313F 0F846500                 je .stmt395
  7254                                  
  7255                                  ;-883       int jdest; int tst;
  7256                                  
  7257 00003143 8B46FA                   mov ax, [bp-6]
  7258 00003146 8B46F8                   mov ax, [bp-8]
  7259                                  
  7260                                  ;-884       pexpr(); nlabel++; jdest=nlabel;
  7261                                  
  7262 00003149 E8D2FE                   call pexpr
  7263 0000314C FF06[2900]               inc  word[nlabel]
  7264 00003150 A1[2900]                 mov ax, [nlabel]
  7265 00003153 8946FA                   mov [bp-6], ax
  7266                                  
  7267                                  ;-885       pint1(jdest); stmt();
  7268                                  
  7269 00003156 FF76FA                   push word [bp-6]
  7270 00003159 E87AD3                   call pint1
  7271 0000315C 83C402                   add  sp, 2
  7272 0000315F E8A9FF                   call stmt
  7273                                  
  7274                                  ;-886       if (istoken(T_ELSE)) { nlabel++; tst=nlabel;
  7275                                  
  7276 00003162 680202                   push 514
  7277 00003165 E88FDD                   call istoken
  7278 00003168 83C402                   add  sp, 2
  7279 0000316B 08C0                     or  al, al
  7280 0000316D 0F842B00                 je .stmt396
  7281 00003171 FF06[2900]               inc  word[nlabel]
  7282 00003175 A1[2900]                 mov ax, [nlabel]
  7283 00003178 8946F8                   mov [bp-8], ax
  7284                                  
  7285                                  ;-887           prjump(tst); prlabel(jdest); stmt(); prlabel(tst);
  7286                                  
  7287 0000317B FF76F8                   push word [bp-8]
  7288 0000317E E85EFF                   call prjump
  7289 00003181 83C402                   add  sp, 2
  7290 00003184 FF76FA                   push word [bp-6]
  7291 00003187 E826FF                   call prlabel
  7292 0000318A 83C402                   add  sp, 2
  7293 0000318D E87BFF                   call stmt
  7294 00003190 FF76F8                   push word [bp-8]
  7295 00003193 E81AFF                   call prlabel
  7296 00003196 83C402                   add  sp, 2
  7297                                  
  7298                                  ;-888       }
  7299                                  
  7300                                  
  7301                                  ;-889       else prlabel(jdest);
  7302                                  
  7303 00003199 E90900                   jmp .stmt397
  7304                                  .stmt396:
  7305 0000319C FF76FA                   push word [bp-6]
  7306 0000319F E80EFF                   call prlabel
  7307 000031A2 83C402                   add  sp, 2
  7308                                  
  7309                                  ;-890   }
  7310                                  
  7311                                  .stmt397:
  7312                                  
  7313                                  ;-891   else if(istoken(T_DO)) {
  7314                                  
  7315 000031A5 E95C02                   jmp .stmt398
  7316                                  .stmt395:
  7317 000031A8 680402                   push 516
  7318 000031AB E849DD                   call istoken
  7319 000031AE 83C402                   add  sp, 2
  7320 000031B1 08C0                     or  al, al
  7321 000031B3 0F844A00                 je .stmt399
  7322                                  
  7323                                  ;-892       nlabel++; jdest=nlabel; prlabel(jdest); stmt();
  7324                                  
  7325 000031B7 FF06[2900]               inc  word[nlabel]
  7326 000031BB A1[2900]                 mov ax, [nlabel]
  7327 000031BE 8946FA                   mov [bp-6], ax
  7328 000031C1 FF76FA                   push word [bp-6]
  7329 000031C4 E8E9FE                   call prlabel
  7330 000031C7 83C402                   add  sp, 2
  7331 000031CA E83EFF                   call stmt
  7332                                  
  7333                                  ;-893       expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);
  7334                                  
  7335 000031CD 680302                   push 515
  7336 000031D0 E846DD                   call expect
  7337 000031D3 83C402                   add  sp, 2
  7338 000031D6 E845FE                   call pexpr
  7339 000031D9 FF06[2900]               inc  word[nlabel]
  7340 000031DD A1[2900]                 mov ax, [nlabel]
  7341 000031E0 8946F6                   mov [bp-10], ax
  7342 000031E3 FF76F6                   push word [bp-10]
  7343 000031E6 E8EDD2                   call pint1
  7344 000031E9 83C402                   add  sp, 2
  7345                                  
  7346                                  ;-894       prjump(jdest); prlabel(jtemp);
  7347                                  
  7348 000031EC FF76FA                   push word [bp-6]
  7349 000031EF E8EDFE                   call prjump
  7350 000031F2 83C402                   add  sp, 2
  7351 000031F5 FF76F6                   push word [bp-10]
  7352 000031F8 E8B5FE                   call prlabel
  7353 000031FB 83C402                   add  sp, 2
  7354                                  
  7355                                  ;-895   }
  7356                                  
  7357                                  
  7358                                  ;-896   else if(istoken(T_WHILE)) {
  7359                                  
  7360 000031FE E90302                   jmp .stmt400
  7361                                  .stmt399:
  7362 00003201 680302                   push 515
  7363 00003204 E8F0DC                   call istoken
  7364 00003207 83C402                   add  sp, 2
  7365 0000320A 08C0                     or  al, al
  7366 0000320C 0F844100                 je .stmt401
  7367                                  
  7368                                  ;-897       nlabel++; jdest=nlabel;
  7369                                  
  7370 00003210 FF06[2900]               inc  word[nlabel]
  7371 00003214 A1[2900]                 mov ax, [nlabel]
  7372 00003217 8946FA                   mov [bp-6], ax
  7373                                  
  7374                                  ;-898       prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);
  7375                                  
  7376 0000321A FF76FA                   push word [bp-6]
  7377 0000321D E890FE                   call prlabel
  7378 00003220 83C402                   add  sp, 2
  7379 00003223 E8F8FD                   call pexpr
  7380 00003226 FF06[2900]               inc  word[nlabel]
  7381 0000322A A1[2900]                 mov ax, [nlabel]
  7382 0000322D 8946F8                   mov [bp-8], ax
  7383 00003230 FF76F8                   push word [bp-8]
  7384 00003233 E8A0D2                   call pint1
  7385 00003236 83C402                   add  sp, 2
  7386                                  
  7387                                  ;-899       stmt(); prjump(jdest); prlabel(tst);
  7388                                  
  7389 00003239 E8CFFE                   call stmt
  7390 0000323C FF76FA                   push word [bp-6]
  7391 0000323F E89DFE                   call prjump
  7392 00003242 83C402                   add  sp, 2
  7393 00003245 FF76F8                   push word [bp-8]
  7394 00003248 E865FE                   call prlabel
  7395 0000324B 83C402                   add  sp, 2
  7396                                  
  7397                                  ;-900   }
  7398                                  
  7399                                  
  7400                                  ;-901   else if(istoken(T_GOTO))  {
  7401                                  
  7402 0000324E E9B301                   jmp .stmt402
  7403                                  .stmt401:
  7404 00003251 680902                   push 521
  7405 00003254 E8A0DC                   call istoken
  7406 00003257 83C402                   add  sp, 2
  7407 0000325A 08C0                     or  al, al
  7408 0000325C 0F842200                 je .stmt403
  7409                                  
  7410                                  ;-902       prs("\n jmp .");name1();prs(symbol);expect(';');
  7411                                  
  7412 00003260 68[0634]                 push stmt_0
  7413 00003263 E879D1                   call prs
  7414 00003266 83C402                   add  sp, 2
  7415 00003269 E858DE                   call name1
  7416 0000326C 8D06606D                 lea  ax, [symbol]
  7417 00003270 50                       push ax
  7418 00003271 E86BD1                   call prs
  7419 00003274 83C402                   add  sp, 2
  7420 00003277 6A3B                     push 59
  7421 00003279 E89DDC                   call expect
  7422 0000327C 83C402                   add  sp, 2
  7423                                  
  7424                                  ;-903   }
  7425                                  
  7426                                  
  7427                                  ;-904   else if(token==T_ASM)     {
  7428                                  
  7429 0000327F E98201                   jmp .stmt404
  7430                                  .stmt403:
  7431 00003282 A1[1E00]                 mov ax, [token]
  7432 00003285 3D0602                   cmp ax, 518
  7433 00003288 0F853300                 jne .stmt405
  7434                                  
  7435                                  ;-905       prs("\n"); c=next();
  7436                                  
  7437 0000328C 68[0F34]                 push stmt_1
  7438 0000328F E84DD1                   call prs
  7439 00003292 83C402                   add  sp, 2
  7440 00003295 E8E4D4                   call next
  7441 00003298 8946FE                   mov [bp-2], ax
  7442                                  
  7443                                  ;-906       while(c != '\n') { prc(c);	c=next(); };
  7444                                  
  7445                                  .stmt406:
  7446 0000329B 8B46FE                   mov ax, [bp-2]
  7447 0000329E 83F80A                   cmp ax, 10
  7448 000032A1 0F841100                 je  .stmt407
  7449 000032A5 FF76FE                   push word [bp-2]
  7450 000032A8 E8DBD0                   call prc
  7451 000032AB 83C402                   add  sp, 2
  7452 000032AE E8CBD4                   call next
  7453 000032B1 8946FE                   mov [bp-2], ax
  7454 000032B4 EBE5                     jmp .stmt406
  7455                                  .stmt407:
  7456                                  
  7457                                  ;-907       token=getlex();
  7458                                  
  7459 000032B6 E88CD5                   call getlex
  7460 000032B9 A3[1E00]                 mov word [token], ax
  7461                                  
  7462                                  ;-908   }
  7463                                  
  7464                                  
  7465                                  ;-909   else if(istoken(T_ASMBLOCK)) {
  7466                                  
  7467 000032BC E94501                   jmp .stmt408
  7468                                  .stmt405:
  7469 000032BF 680702                   push 519
  7470 000032C2 E832DC                   call istoken
  7471 000032C5 83C402                   add  sp, 2
  7472 000032C8 08C0                     or  al, al
  7473 000032CA 0F844B00                 je .stmt409
  7474                                  
  7475                                  ;-910       if (token== '{' )  {
  7476                                  
  7477 000032CE A1[1E00]                 mov ax, [token]
  7478 000032D1 83F87B                   cmp ax, 123
  7479 000032D4 0F853500                 jne .stmt410
  7480                                  
  7481                                  ;-911           prs("\n"); cha=next();
  7482                                  
  7483 000032D8 68[1234]                 push stmt_2
  7484 000032DB E801D1                   call prs
  7485 000032DE 83C402                   add  sp, 2
  7486 000032E1 E898D4                   call next
  7487 000032E4 8846FC                   mov [bp-4], al
  7488                                  
  7489                                  ;-912           while(cha!= '}') {
  7490                                  
  7491                                  .stmt411:
  7492 000032E7 8A46FC                   mov al, [bp-4]
  7493 000032EA 3C7D                     cmp al, 125
  7494 000032EC 0F841400                 je  .stmt412
  7495                                  
  7496                                  ;-913               prc(cha);
  7497                                  
  7498 000032F0 8A46FC                   mov al, byte [bp-4]
  7499 000032F3 B400                     mov ah, 0
  7500 000032F5 50                       push ax
  7501 000032F6 E88DD0                   call prc
  7502 000032F9 83C402                   add  sp, 2
  7503                                  
  7504                                  ;-914               cha=next();
  7505                                  
  7506 000032FC E87DD4                   call next
  7507 000032FF 8846FC                   mov [bp-4], al
  7508                                  
  7509                                  ;-915           }
  7510                                  
  7511                                  
  7512                                  ;-916           token=getlex();
  7513                                  
  7514 00003302 EBE3                     jmp .stmt411
  7515                                  .stmt412:
  7516 00003304 E83ED5                   call getlex
  7517 00003307 A3[1E00]                 mov word [token], ax
  7518                                  
  7519                                  ;-917       } else error1("Curly open expected");
  7520                                  
  7521 0000330A E90900                   jmp .stmt413
  7522                                  .stmt410:
  7523 0000330D 68[1534]                 push stmt_3
  7524 00003310 E888D2                   call error1
  7525 00003313 83C402                   add  sp, 2
  7526                                  
  7527                                  ;-918         }
  7528                                  
  7529                                  .stmt413:
  7530                                  
  7531                                  ;-919   else if(istoken(T_EMIT)) {
  7532                                  
  7533 00003316 E9EB00                   jmp .stmt414
  7534                                  .stmt409:
  7535 00003319 680802                   push 520
  7536 0000331C E8D8DB                   call istoken
  7537 0000331F 83C402                   add  sp, 2
  7538 00003322 08C0                     or  al, al
  7539 00003324 0F843E00                 je .stmt415
  7540                                  
  7541                                  ;-920       prs("\n db ");
  7542                                  
  7543 00003328 68[2934]                 push stmt_4
  7544 0000332B E8B1D0                   call prs
  7545 0000332E 83C402                   add  sp, 2
  7546                                  
  7547                                  ;-921     L1: token=getlex();
  7548                                  
  7549                                  .L1:
  7550 00003331 E811D5                   call getlex
  7551 00003334 A3[1E00]                 mov word [token], ax
  7552                                  
  7553                                  ;-922       prunsign1(lexval);
  7554                                  
  7555 00003337 FF36[2B00]               push word [lexval]
  7556 0000333B E8F6D1                   call prunsign1
  7557 0000333E 83C402                   add  sp, 2
  7558                                  
  7559                                  ;-923       token=getlex();
  7560                                  
  7561 00003341 E801D5                   call getlex
  7562 00003344 A3[1E00]                 mov word [token], ax
  7563                                  
  7564                                  ;-924       if (token== ',') {
  7565                                  
  7566 00003347 A1[1E00]                 mov ax, [token]
  7567 0000334A 83F82C                   cmp ax, 44
  7568 0000334D 0F850A00                 jne .stmt416
  7569                                  
  7570                                  ;-925           prc(',');
  7571                                  
  7572 00003351 6A2C                     push 44
  7573 00003353 E830D0                   call prc
  7574 00003356 83C402                   add  sp, 2
  7575                                  
  7576                                  ;-926           goto L1;
  7577                                  
  7578 00003359 EBD6                     jmp .L1
  7579                                  
  7580                                  ;-927       }
  7581                                  
  7582                                  
  7583                                  ;-928       expect(')');
  7584                                  
  7585                                  .stmt416:
  7586 0000335B 6A29                     push 41
  7587 0000335D E8B9DB                   call expect
  7588 00003360 83C402                   add  sp, 2
  7589                                  
  7590                                  ;-929   }
  7591                                  
  7592                                  
  7593                                  ;-930   else if(istoken(';'))      { }
  7594                                  
  7595 00003363 E99E00                   jmp .stmt417
  7596                                  .stmt415:
  7597 00003366 6A3B                     push 59
  7598 00003368 E88CDB                   call istoken
  7599 0000336B 83C402                   add  sp, 2
  7600 0000336E 08C0                     or  al, al
  7601 00003370 0F840300                 je .stmt418
  7602                                  
  7603                                  ;-931   else if(istoken(T_RETURN)) {
  7604                                  
  7605 00003374 E98D00                   jmp .stmt419
  7606                                  .stmt418:
  7607 00003377 680002                   push 512
  7608 0000337A E87ADB                   call istoken
  7609 0000337D 83C402                   add  sp, 2
  7610 00003380 08C0                     or  al, al
  7611 00003382 0F843500                 je .stmt420
  7612                                  
  7613                                  ;-932         if (token!=';') expr(0);
  7614                                  
  7615 00003386 A1[1E00]                 mov ax, [token]
  7616 00003389 83F83B                   cmp ax, 59
  7617 0000338C 0F840800                 je  .stmt421
  7618 00003390 6A00                     push 0
  7619 00003392 E82EF8                   call expr
  7620 00003395 83C402                   add  sp, 2
  7621                                  
  7622                                  ;-933         prs("\n jmp .retn");
  7623                                  
  7624                                  .stmt421:
  7625 00003398 68[3034]                 push stmt_5
  7626 0000339B E841D0                   call prs
  7627 0000339E 83C402                   add  sp, 2
  7628                                  
  7629                                  ;-934         prs(fname);
  7630                                  
  7631 000033A1 8D06E06D                 lea  ax, [fname]
  7632 000033A5 50                       push ax
  7633 000033A6 E836D0                   call prs
  7634 000033A9 83C402                   add  sp, 2
  7635                                  
  7636                                  ;-935         nreturn++;
  7637                                  
  7638 000033AC FF06[2700]               inc  word[nreturn]
  7639                                  
  7640                                  ;-936         expect(';');
  7641                                  
  7642 000033B0 6A3B                     push 59
  7643 000033B2 E864DB                   call expect
  7644 000033B5 83C402                   add  sp, 2
  7645                                  
  7646                                  ;-937         }
  7647                                  
  7648                                  
  7649                                  ;-938   else if(thechar==':')      {
  7650                                  
  7651 000033B8 E94900                   jmp .stmt422
  7652                                  .stmt420:
  7653 000033BB A0[2200]                 mov al, [thechar]
  7654 000033BE 3C3A                     cmp al, 58
  7655 000033C0 0F853000                 jne .stmt423
  7656                                  
  7657                                  ;-939         prs("\n."); // Label
  7658                                  
  7659 000033C4 68[3D34]                 push stmt_6
  7660 000033C7 E815D0                   call prs
  7661 000033CA 83C402                   add  sp, 2
  7662                                  
  7663                                  ;-940         prs(symbol); prc(':');
  7664                                  
  7665 000033CD 8D06606D                 lea  ax, [symbol]
  7666 000033D1 50                       push ax
  7667 000033D2 E80AD0                   call prs
  7668 000033D5 83C402                   add  sp, 2
  7669 000033D8 6A3A                     push 58
  7670 000033DA E8A9CF                   call prc
  7671 000033DD 83C402                   add  sp, 2
  7672                                  
  7673                                  ;-941         expect(T_NAME);
  7674                                  
  7675 000033E0 680001                   push 256
  7676 000033E3 E833DB                   call expect
  7677 000033E6 83C402                   add  sp, 2
  7678                                  
  7679                                  ;-942         expect(':');
  7680                                  
  7681 000033E9 6A3A                     push 58
  7682 000033EB E82BDB                   call expect
  7683 000033EE 83C402                   add  sp, 2
  7684                                  
  7685                                  ;-943         }
  7686                                  
  7687                                  
  7688                                  ;-944   else  {expr(0);; expect(';'); }
  7689                                  
  7690 000033F1 E91000                   jmp .stmt424
  7691                                  .stmt423:
  7692 000033F4 6A00                     push 0
  7693 000033F6 E8CAF7                   call expr
  7694 000033F9 83C402                   add  sp, 2
  7695 000033FC 6A3B                     push 59
  7696 000033FE E818DB                   call expect
  7697 00003401 83C402                   add  sp, 2
  7698                                  
  7699                                  ;-945 }
  7700                                  
  7701                                  .stmt424:
  7702                                  .stmt422:
  7703                                  .stmt419:
  7704                                  .stmt417:
  7705                                  .stmt414:
  7706                                  .stmt408:
  7707                                  .stmt404:
  7708                                  .stmt402:
  7709                                  .stmt400:
  7710                                  .stmt398:
  7711                                  .stmt394:
  7712                                  
  7713                                  ;-946 
  7714                                  
  7715                                  
  7716                                  ;-947 
  7717                                  
  7718                                  
  7719                                  ;-948 int dofunc() { int nloc; int i; unsigned int j;int narg;
  7720 00003404 C9                       LEAVE
  7721 00003405 C3                       ret
  7722 00003406 5C6E206A6D70202E00      stmt_0 db "\n jmp .",0
  7723 0000340F 5C6E00                  stmt_1 db "\n",0
  7724 00003412 5C6E00                  stmt_2 db "\n",0
  7725 00003415 4375726C79206F7065-     stmt_3 db "Curly open expected",0
  7726 0000341E 6E2065787065637465-
  7727 00003427 6400               
  7728 00003429 5C6E2064622000          stmt_4 db "\n db ",0
  7729 00003430 5C6E206A6D70202E72-     stmt_5 db "\n jmp .retn",0
  7730 00003439 65746E00           
  7731 0000343D 5C6E2E00                stmt_6 db "\n.",0
  7732                                  ENDP
  7733                                  
  7734                                  dofunc: PROC
  7735                                  
  7736                                  ;-949     cloc=&co;
  7737                                  ;
  7738 00003441 C8080000                 ENTER  8,0
  7739 00003445 B8A861                   mov ax, co
  7740 00003448 A3[1800]                 mov word [cloc], ax
  7741                                  
  7742                                  ;-950     checknamelen();
  7743                                  
  7744 0000344B E866DB                   call checknamelen
  7745                                  
  7746                                  ;-951     strcpy(fname, symbol);
  7747                                  
  7748 0000344E 8D06606D                 lea  ax, [symbol]
  7749 00003452 50                       push ax
  7750 00003453 8D06E06D                 lea  ax, [fname]
  7751 00003457 50                       push ax
  7752 00003458 E8CECD                   call strcpy
  7753 0000345B 83C404                   add  sp, 4
  7754                                  
  7755                                  ;-952     i=0;
  7756                                  
  7757 0000345E B80000                   mov ax, 0
  7758 00003461 8946FC                   mov [bp-4], ax
  7759                                  
  7760                                  ;-953     while (i < FTop) {
  7761                                  
  7762                                  .dofunc425:
  7763 00003464 8B46FC                   mov ax, [bp-4]
  7764 00003467 3B06[3C00]               cmp ax, [FTop]
  7765 0000346B 0F8D3300                 jge .dofunc426
  7766                                  
  7767                                  ;-954         j=adrF(FNameField, i);
  7768                                  
  7769 0000346F FF76FC                   push word [bp-4]
  7770 00003472 8D06798F                 lea  ax, [FNameField]
  7771 00003476 50                       push ax
  7772 00003477 E81AD3                   call adrF
  7773 0000347A 83C404                   add  sp, 4
  7774 0000347D 8946FA                   mov [bp-6], ax
  7775                                  
  7776                                  ;-955         if(eqstr(symbol, j)) error1("Function already defined");
  7777                                  
  7778 00003480 FF76FA                   push word [bp-6]
  7779 00003483 8D06606D                 lea  ax, [symbol]
  7780 00003487 50                       push ax
  7781 00003488 E8D4CD                   call eqstr
  7782 0000348B 83C404                   add  sp, 4
  7783 0000348E 08C0                     or  al, al
  7784 00003490 0F840900                 je .dofunc427
  7785 00003494 68[D336]                 push dofunc_0
  7786 00003497 E801D1                   call error1
  7787 0000349A 83C402                   add  sp, 2
  7788                                  
  7789                                  ;-956         i++;
  7790                                  
  7791                                  .dofunc427:
  7792 0000349D FF46FC                   inc  word[bp-4]
  7793                                  
  7794                                  ;-957     }
  7795                                  
  7796                                  
  7797                                  ;-958     if (FTop >= FUNCMAX) error1("Function table full");
  7798                                  
  7799 000034A0 EBC2                     jmp .dofunc425
  7800                                  .dofunc426:
  7801 000034A2 A1[3C00]                 mov ax, [FTop]
  7802 000034A5 3D2C01                   cmp ax, 300 ;unsigned : 1
  7803 000034A8 0F8C0900                 jl  .dofunc428
  7804 000034AC 68[EC36]                 push dofunc_1
  7805 000034AF E8E9D0                   call error1
  7806 000034B2 83C402                   add  sp, 2
  7807                                  
  7808                                  ;-959     pt=adrF(FNameField, FTop);
  7809                                  
  7810                                  .dofunc428:
  7811 000034B5 FF36[3C00]               push word [FTop]
  7812 000034B9 8D06798F                 lea  ax, [FNameField]
  7813 000034BD 50                       push ax
  7814 000034BE E8D3D2                   call adrF
  7815 000034C1 83C404                   add  sp, 4
  7816 000034C4 A3[4200]                 mov word [pt], ax
  7817                                  
  7818                                  ;-960     strcpy(pt, symbol);
  7819                                  
  7820 000034C7 8D06606D                 lea  ax, [symbol]
  7821 000034CB 50                       push ax
  7822 000034CC FF36[4200]               push word [pt]
  7823 000034D0 E856CD                   call strcpy
  7824 000034D3 83C404                   add  sp, 4
  7825                                  
  7826                                  ;-961     FTop++;
  7827                                  
  7828 000034D6 FF06[3C00]               inc  word[FTop]
  7829                                  
  7830                                  ;-962 
  7831                                  
  7832                                  
  7833                                  ;-963   prs("\n\n"); prs(symbol); prs(": PROC");
  7834                                  
  7835 000034DA 68[0037]                 push dofunc_2
  7836 000034DD E8FFCE                   call prs
  7837 000034E0 83C402                   add  sp, 2
  7838 000034E3 8D06606D                 lea  ax, [symbol]
  7839 000034E7 50                       push ax
  7840 000034E8 E8F4CE                   call prs
  7841 000034EB 83C402                   add  sp, 2
  7842 000034EE 68[0537]                 push dofunc_3
  7843 000034F1 E8EBCE                   call prs
  7844 000034F4 83C402                   add  sp, 2
  7845                                  
  7846                                  ;-964   expect('('); LTop=LSTART;
  7847                                  
  7848 000034F7 6A28                     push 40
  7849 000034F9 E81DDA                   call expect
  7850 000034FC 83C402                   add  sp, 2
  7851 000034FF B8C800                   mov ax, 200
  7852 00003502 A3[3A00]                 mov word [LTop], ax
  7853                                  
  7854                                  ;-965   if (istoken(')')==0) { narg=2;
  7855                                  
  7856 00003505 6A29                     push 41
  7857 00003507 E8EDD9                   call istoken
  7858 0000350A 83C402                   add  sp, 2
  7859 0000350D 83F800                   cmp ax, 0
  7860 00003510 0F854600                 jne .dofunc429
  7861 00003514 B80200                   mov ax, 2
  7862 00003517 8946F8                   mov [bp-8], ax
  7863                                  
  7864                                  ;-966     do { typeName();  addlocal(); narg+=2;
  7865                                  
  7866                                  .dofunc430:
  7867 0000351A E8CFDB                   call typeName
  7868 0000351D E85CDD                   call addlocal
  7869 00003520 8346F802                 add  word[bp-8], 2
  7870                                  
  7871                                  ;-967          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }
  7872                                  
  7873 00003524 8B46F8                   mov ax, [bp-8]
  7874 00003527 8B1E[3A00]               mov bx, [LTop]
  7875 0000352B D1E3                     shl bx, 1
  7876 0000352D 89875973                 mov [GData+bx], ax
  7877 00003531 A0[3500]                 mov al, [iswidth]
  7878 00003534 3C04                     cmp al, 4
  7879 00003536 0F850400                 jne .dofunc431
  7880 0000353A 8346F802                 add  word[bp-8], 2
  7881                                  .dofunc431:
  7882 0000353E FF06[3A00]               inc  word[LTop]
  7883                                  
  7884                                  ;-968     while (istoken(','));  expect(')'); }
  7885                                  
  7886 00003542 6A2C                     push 44
  7887 00003544 E8B0D9                   call istoken
  7888 00003547 83C402                   add  sp, 2
  7889 0000354A 08C0                     or  al, al
  7890 0000354C 0F840200                 je .dofunc432
  7891 00003550 EBC8                     jmp .dofunc430
  7892                                  .dofunc432:
  7893 00003552 6A29                     push 41
  7894 00003554 E8C2D9                   call expect
  7895 00003557 83C402                   add  sp, 2
  7896                                  
  7897                                  ;-969 
  7898                                  
  7899                                  
  7900                                  ;-970   expect('{'); /*body*/
  7901                                  
  7902                                  .dofunc429:
  7903 0000355A 6A7B                     push 123
  7904 0000355C E8BAD9                   call expect
  7905 0000355F 83C402                   add  sp, 2
  7906                                  
  7907                                  ;-971   nloc=0; nreturn=0; nconst=0;
  7908                                  
  7909 00003562 B80000                   mov ax, 0
  7910 00003565 8946FE                   mov [bp-2], ax
  7911 00003568 B80000                   mov ax, 0
  7912 0000356B A3[2700]                 mov word [nreturn], ax
  7913 0000356E B80000                   mov ax, 0
  7914 00003571 A3[2500]                 mov word [nconst], ax
  7915                                  
  7916                                  ;-972   while(isvariable()) {
  7917                                  
  7918                                  .dofunc433:
  7919 00003574 E8A1DD                   call isvariable
  7920 00003577 08C0                     or  al, al
  7921 00003579 0F849200                 je .dofunc434
  7922                                  
  7923                                  ;-973     do {typeName();
  7924                                  
  7925                                  .dofunc435:
  7926 0000357D E86CDB                   call typeName
  7927                                  
  7928                                  ;-974         checknamelen();
  7929                                  
  7930 00003580 E831DA                   call checknamelen
  7931                                  
  7932                                  ;-975         addlocal(); nloc-=2;
  7933                                  
  7934 00003583 E8F6DC                   call addlocal
  7935 00003586 836EFE02                 sub  word[bp-2], 2
  7936                                  
  7937                                  ;-976         if (iswidth == 4) nloc-=2;
  7938                                  
  7939 0000358A A0[3500]                 mov al, [iswidth]
  7940 0000358D 3C04                     cmp al, 4
  7941 0000358F 0F850400                 jne .dofunc436
  7942 00003593 836EFE02                 sub  word[bp-2], 2
  7943                                  
  7944                                  ;-977         GData[LTop]=nloc;
  7945                                  
  7946                                  .dofunc436:
  7947 00003597 8B46FE                   mov ax, [bp-2]
  7948 0000359A 8B1E[3A00]               mov bx, [LTop]
  7949 0000359E D1E3                     shl bx, 1
  7950 000035A0 89875973                 mov [GData+bx], ax
  7951                                  
  7952                                  ;-978         if (istoken('[')){
  7953                                  
  7954 000035A4 6A5B                     push 91
  7955 000035A6 E84ED9                   call istoken
  7956 000035A9 83C402                   add  sp, 2
  7957 000035AC 08C0                     or  al, al
  7958 000035AE 0F843D00                 je .dofunc437
  7959                                  
  7960                                  ;-979             istype='&';GType[LTop]='&';expect(T_CONST);expect(']');
  7961                                  
  7962 000035B2 B82600                   mov ax, 38
  7963 000035B5 A2[2F00]                 mov byte [istype], al
  7964 000035B8 B82600                   mov ax, 38
  7965 000035BB 8B1E[3A00]               mov bx, [LTop]
  7966 000035BF 8887A96E                 mov [GType+bx], al
  7967 000035C3 680101                   push 257
  7968 000035C6 E850D9                   call expect
  7969 000035C9 83C402                   add  sp, 2
  7970 000035CC 6A5D                     push 93
  7971 000035CE E848D9                   call expect
  7972 000035D1 83C402                   add  sp, 2
  7973                                  
  7974                                  ;-980             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc;
  7975                                  
  7976 000035D4 8B46FE                   mov ax, [bp-2]
  7977 000035D7 2B06[2B00]               sub ax, [lexval]
  7978 000035DB 8946FE                   mov [bp-2], ax
  7979 000035DE 8346FE02                 add  word[bp-2], 2
  7980 000035E2 8B46FE                   mov ax, [bp-2]
  7981 000035E5 8B1E[3A00]               mov bx, [LTop]
  7982 000035E9 D1E3                     shl bx, 1
  7983 000035EB 89875973                 mov [GData+bx], ax
  7984                                  
  7985                                  ;-981             }
  7986                                  
  7987                                  
  7988                                  ;-982         LTop++;
  7989                                  
  7990                                  .dofunc437:
  7991 000035EF FF06[3A00]               inc  word[LTop]
  7992                                  
  7993                                  ;-983       } while (istoken(',')); expect(';'); }
  7994                                  
  7995 000035F3 6A2C                     push 44
  7996 000035F5 E8FFD8                   call istoken
  7997 000035F8 83C402                   add  sp, 2
  7998 000035FB 08C0                     or  al, al
  7999 000035FD 0F840300                 je .dofunc438
  8000 00003601 E979FF                   jmp .dofunc435
  8001                                  .dofunc438:
  8002 00003604 6A3B                     push 59
  8003 00003606 E810D9                   call expect
  8004 00003609 83C402                   add  sp, 2
  8005                                  
  8006                                  ;-984   if (LTop>LSTART){prs(";\n ENTER  ");
  8007                                  
  8008 0000360C E965FF                   jmp .dofunc433
  8009                                  .dofunc434:
  8010 0000360F A1[3A00]                 mov ax, [LTop]
  8011 00003612 3DC800                   cmp ax, 200
  8012 00003615 0F8E2700                 jle .dofunc439
  8013 00003619 68[0C37]                 push dofunc_4
  8014 0000361C E8C0CD                   call prs
  8015 0000361F 83C402                   add  sp, 2
  8016                                  
  8017                                  ;-985     nloc=mkneg(nloc); prunsign1 (nloc); prs(",0"); }
  8018                                  
  8019 00003622 FF76FE                   push word [bp-2]
  8020 00003625 E879CA                   call mkneg
  8021 00003628 83C402                   add  sp, 2
  8022 0000362B 8946FE                   mov [bp-2], ax
  8023 0000362E FF76FE                   push word [bp-2]
  8024 00003631 E800CF                   call prunsign1
  8025 00003634 83C402                   add  sp, 2
  8026 00003637 68[1837]                 push dofunc_5
  8027 0000363A E8A2CD                   call prs
  8028 0000363D 83C402                   add  sp, 2
  8029                                  
  8030                                  ;-986   while(istoken('}')==0)   stmt();
  8031                                  
  8032                                  .dofunc439:
  8033                                  .dofunc440:
  8034 00003640 6A7D                     push 125
  8035 00003642 E8B2D8                   call istoken
  8036 00003645 83C402                   add  sp, 2
  8037 00003648 83F800                   cmp ax, 0
  8038 0000364B 0F850500                 jne .dofunc441
  8039 0000364F E8B9FA                   call stmt
  8040                                  
  8041                                  ;-987   if (nreturn) {
  8042                                  
  8043 00003652 EBEC                     jmp .dofunc440
  8044                                  .dofunc441:
  8045 00003654 A1[2700]                 mov ax, [nreturn]
  8046 00003657 08C0                     or  al, al
  8047 00003659 0F841C00                 je .dofunc442
  8048                                  
  8049                                  ;-988         prs("\n .retn");
  8050                                  
  8051 0000365D 68[1B37]                 push dofunc_6
  8052 00003660 E87CCD                   call prs
  8053 00003663 83C402                   add  sp, 2
  8054                                  
  8055                                  ;-989         prs(fname);
  8056                                  
  8057 00003666 8D06E06D                 lea  ax, [fname]
  8058 0000366A 50                       push ax
  8059 0000366B E871CD                   call prs
  8060 0000366E 83C402                   add  sp, 2
  8061                                  
  8062                                  ;-990         prc(':');
  8063                                  
  8064 00003671 6A3A                     push 58
  8065 00003673 E810CD                   call prc
  8066 00003676 83C402                   add  sp, 2
  8067                                  
  8068                                  ;-991         }
  8069                                  
  8070                                  
  8071                                  ;-992   if (LTop > LSTART) prs(" LEAVE");
  8072                                  
  8073                                  .dofunc442:
  8074 00003679 A1[3A00]                 mov ax, [LTop]
  8075 0000367C 3DC800                   cmp ax, 200
  8076 0000367F 0F8E0900                 jle .dofunc443
  8077 00003683 68[2437]                 push dofunc_7
  8078 00003686 E856CD                   call prs
  8079 00003689 83C402                   add  sp, 2
  8080                                  
  8081                                  ;-993   prs("\n ret");
  8082                                  
  8083                                  .dofunc443:
  8084 0000368C 68[2B37]                 push dofunc_8
  8085 0000368F E84DCD                   call prs
  8086 00003692 83C402                   add  sp, 2
  8087                                  
  8088                                  ;-994   *cloc=0; prs(co);
  8089                                  
  8090 00003695 B80000                   mov ax, 0
  8091 00003698 8B1E[1800]               mov  bx, [cloc]
  8092 0000369C 8807                     mov  [bx], al
  8093 0000369E 8D06A861                 lea  ax, [co]
  8094 000036A2 50                       push ax
  8095 000036A3 E839CD                   call prs
  8096 000036A6 83C402                   add  sp, 2
  8097                                  
  8098                                  ;-995   maxco1=strlen(co);
  8099                                  
  8100 000036A9 8D06A861                 lea  ax, [co]
  8101 000036AD 50                       push ax
  8102 000036AE E850CB                   call strlen
  8103 000036B1 83C402                   add  sp, 2
  8104 000036B4 A3[1600]                 mov word [maxco1], ax
  8105                                  
  8106                                  ;-996   if (maxco1 > maxco) maxco=maxco1;
  8107                                  
  8108 000036B7 A1[1600]                 mov ax, [maxco1]
  8109 000036BA 3B06[1400]               cmp ax, [maxco]
  8110 000036BE 0F8E0600                 jle .dofunc444
  8111 000036C2 A1[1600]                 mov ax, [maxco1]
  8112 000036C5 A3[1400]                 mov word [maxco], ax
  8113                                  
  8114                                  ;-997   prs("\nENDP");
  8115                                  
  8116                                  .dofunc444:
  8117 000036C8 68[3237]                 push dofunc_9
  8118 000036CB E811CD                   call prs
  8119 000036CE 83C402                   add  sp, 2
  8120                                  
  8121                                  ;-998 }
  8122                                  
  8123                                  
  8124                                  ;-999 
  8125                                  
  8126                                  
  8127                                  ;-1000 char doglobName[IDLENMAX];
  8128 000036D1 C9                       LEAVE
  8129 000036D2 C3                       ret
  8130 000036D3 46756E6374696F6E20-     dofunc_0 db "Function already defined",0
  8131 000036DC 616C72656164792064-
  8132 000036E5 6566696E656400     
  8133 000036EC 46756E6374696F6E20-     dofunc_1 db "Function table full",0
  8134 000036F5 7461626C652066756C-
  8135 000036FE 6C00               
  8136 00003700 5C6E5C6E00              dofunc_2 db "\n\n",0
  8137 00003705 3A2050524F4300          dofunc_3 db ": PROC",0
  8138 0000370C 3B5C6E20454E544552-     dofunc_4 db ";\n ENTER  ",0
  8139 00003715 202000             
  8140 00003718 2C3000                  dofunc_5 db ",0",0
  8141 0000371B 5C6E202E7265746E00      dofunc_6 db "\n .retn",0
  8142 00003724 204C4541564500          dofunc_7 db " LEAVE",0
  8143 0000372B 5C6E2072657400          dofunc_8 db "\n ret",0
  8144 00003732 5C6E454E445000          dofunc_9 db "\nENDP",0
  8145                                  ENDP
  8146                                  section .bss
  8147                                  absolute 41799
  8148 0000A347 <res 0000000F>          doglobName resb 15
  8149                                  section .text
  8150                                  
  8151                                  ;-1001 int doglob() {
  8152                                  
  8153                                  
  8154                                  doglob: PROC
  8155                                  
  8156                                  ;-1002     int i; int j; int isstrarr; isstrarr=0;
  8157                                  ;
  8158 00003739 C8060000                 ENTER  6,0
  8159 0000373D B80000                   mov ax, 0
  8160 00003740 8946FA                   mov [bp-6], ax
  8161                                  
  8162                                  ;-1003   if (GTop >= LSTART) error1("Global table full");
  8163                                  
  8164 00003743 A1[3800]                 mov ax, [GTop]
  8165 00003746 3DC800                   cmp ax, 200 ;unsigned : 1
  8166 00003749 0F8C0900                 jl  .doglob445
  8167 0000374D 68[763A]                 push doglob_0
  8168 00003750 E848CE                   call error1
  8169 00003753 83C402                   add  sp, 2
  8170                                  
  8171                                  ;-1004   if (iswidth == 0) error1("no VOID as var type");
  8172                                  
  8173                                  .doglob445:
  8174 00003756 A0[3500]                 mov al, [iswidth]
  8175 00003759 3C00                     cmp al, 0
  8176 0000375B 0F850900                 jne .doglob446
  8177 0000375F 68[883A]                 push doglob_1
  8178 00003762 E836CE                   call error1
  8179 00003765 83C402                   add  sp, 2
  8180                                  
  8181                                  ;-1005   checknamelen();
  8182                                  
  8183                                  .doglob446:
  8184 00003768 E849D8                   call checknamelen
  8185                                  
  8186                                  ;-1006   if (checkName() != 0) error1("Variable already defined");
  8187                                  
  8188 0000376B E892D8                   call checkName
  8189 0000376E 3C00                     cmp al, 0
  8190 00003770 0F840900                 je  .doglob447
  8191 00003774 68[9C3A]                 push doglob_2
  8192 00003777 E821CE                   call error1
  8193 0000377A 83C402                   add  sp, 2
  8194                                  
  8195                                  ;-1007   if (istoken('[')) { istype='&';
  8196                                  
  8197                                  .doglob447:
  8198 0000377D 6A5B                     push 91
  8199 0000377F E875D7                   call istoken
  8200 00003782 83C402                   add  sp, 2
  8201 00003785 08C0                     or  al, al
  8202 00003787 0F84E201                 je .doglob448
  8203 0000378B B82600                   mov ax, 38
  8204 0000378E A2[2F00]                 mov byte [istype], al
  8205                                  
  8206                                  ;-1008     if (istoken(T_CONST)) {
  8207                                  
  8208 00003791 680101                   push 257
  8209 00003794 E860D7                   call istoken
  8210 00003797 83C402                   add  sp, 2
  8211 0000379A 08C0                     or  al, al
  8212 0000379C 0F84C200                 je .doglob449
  8213                                  
  8214                                  ;-1009       prs("\nsection .bss\nabsolute ");
  8215                                  
  8216 000037A0 68[B53A]                 push doglob_3
  8217 000037A3 E839CC                   call prs
  8218 000037A6 83C402                   add  sp, 2
  8219                                  
  8220                                  ;-1010       prunsign1(orgData);
  8221                                  
  8222 000037A9 FF36[1200]               push word [orgData]
  8223 000037AD E884CD                   call prunsign1
  8224 000037B0 83C402                   add  sp, 2
  8225                                  
  8226                                  ;-1011       prs("\n"); prs(symbol);
  8227                                  
  8228 000037B3 68[CF3A]                 push doglob_4
  8229 000037B6 E826CC                   call prs
  8230 000037B9 83C402                   add  sp, 2
  8231 000037BC 8D06606D                 lea  ax, [symbol]
  8232 000037C0 50                       push ax
  8233 000037C1 E81BCC                   call prs
  8234 000037C4 83C402                   add  sp, 2
  8235                                  
  8236                                  ;-1012       if (iswidth==1) prs(" resb ");
  8237                                  
  8238 000037C7 A0[3500]                 mov al, [iswidth]
  8239 000037CA 3C01                     cmp al, 1
  8240 000037CC 0F850900                 jne .doglob450
  8241 000037D0 68[D23A]                 push doglob_5
  8242 000037D3 E809CC                   call prs
  8243 000037D6 83C402                   add  sp, 2
  8244                                  
  8245                                  ;-1013       if (iswidth==2) prs(" resw ");
  8246                                  
  8247                                  .doglob450:
  8248 000037D9 A0[3500]                 mov al, [iswidth]
  8249 000037DC 3C02                     cmp al, 2
  8250 000037DE 0F850900                 jne .doglob451
  8251 000037E2 68[D93A]                 push doglob_6
  8252 000037E5 E8F7CB                   call prs
  8253 000037E8 83C402                   add  sp, 2
  8254                                  
  8255                                  ;-1014       if (iswidth==4) prs(" resd ");
  8256                                  
  8257                                  .doglob451:
  8258 000037EB A0[3500]                 mov al, [iswidth]
  8259 000037EE 3C04                     cmp al, 4
  8260 000037F0 0F850900                 jne .doglob452
  8261 000037F4 68[E03A]                 push doglob_7
  8262 000037F7 E8E5CB                   call prs
  8263 000037FA 83C402                   add  sp, 2
  8264                                  
  8265                                  ;-1015       prunsign1(lexval);
  8266                                  
  8267                                  .doglob452:
  8268 000037FD FF36[2B00]               push word [lexval]
  8269 00003801 E830CD                   call prunsign1
  8270 00003804 83C402                   add  sp, 2
  8271                                  
  8272                                  ;-1016       prs("\nsection .text");
  8273                                  
  8274 00003807 68[E73A]                 push doglob_8
  8275 0000380A E8D2CB                   call prs
  8276 0000380D 83C402                   add  sp, 2
  8277                                  
  8278                                  ;-1017       orgData=orgData+lexval;
  8279                                  
  8280 00003810 A1[1200]                 mov ax, [orgData]
  8281 00003813 0306[2B00]               add ax, [lexval]
  8282 00003817 A3[1200]                 mov word [orgData], ax
  8283                                  
  8284                                  ;-1018       if (iswidth==2) orgData=orgData+lexval;
  8285                                  
  8286 0000381A A0[3500]                 mov al, [iswidth]
  8287 0000381D 3C02                     cmp al, 2
  8288 0000381F 0F850A00                 jne .doglob453
  8289 00003823 A1[1200]                 mov ax, [orgData]
  8290 00003826 0306[2B00]               add ax, [lexval]
  8291 0000382A A3[1200]                 mov word [orgData], ax
  8292                                  
  8293                                  ;-1019       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}
  8294                                  
  8295                                  .doglob453:
  8296 0000382D A0[3500]                 mov al, [iswidth]
  8297 00003830 3C04                     cmp al, 4
  8298 00003832 0F851400                 jne .doglob454
  8299 00003836 A1[2B00]                 mov ax, [lexval]
  8300 00003839 BB0300                   mov bx, 3
  8301 0000383C F7E3                     mul bx
  8302 0000383E 8946FE                   mov [bp-2], ax
  8303 00003841 A1[1200]                 mov ax, [orgData]
  8304 00003844 0346FE                   add ax, [bp-2]
  8305 00003847 A3[1200]                 mov word [orgData], ax
  8306                                  
  8307                                  ;-1020       GData[GTop]=lexval; expect(']');
  8308                                  
  8309                                  .doglob454:
  8310 0000384A A1[2B00]                 mov ax, [lexval]
  8311 0000384D 8B1E[3800]               mov bx, [GTop]
  8312 00003851 D1E3                     shl bx, 1
  8313 00003853 89875973                 mov [GData+bx], ax
  8314 00003857 6A5D                     push 93
  8315 00003859 E8BDD6                   call expect
  8316 0000385C 83C402                   add  sp, 2
  8317                                  
  8318                                  ;-1021     }else { expect(']');
  8319                                  
  8320 0000385F E90801                   jmp .doglob455
  8321                                  .doglob449:
  8322 00003862 6A5D                     push 93
  8323 00003864 E8B2D6                   call expect
  8324 00003867 83C402                   add  sp, 2
  8325                                  
  8326                                  ;-1022       if (iswidth != 1) error1("Only ByteArray allowed");
  8327                                  
  8328 0000386A A0[3500]                 mov al, [iswidth]
  8329 0000386D 3C01                     cmp al, 1
  8330 0000386F 0F840900                 je  .doglob456
  8331 00003873 68[F73A]                 push doglob_9
  8332 00003876 E822CD                   call error1
  8333 00003879 83C402                   add  sp, 2
  8334                                  
  8335                                  ;-1023       prs("\n"); prs(symbol); prs(" db ");
  8336                                  
  8337                                  .doglob456:
  8338 0000387C 68[0E3B]                 push doglob_10
  8339 0000387F E85DCB                   call prs
  8340 00003882 83C402                   add  sp, 2
  8341 00003885 8D06606D                 lea  ax, [symbol]
  8342 00003889 50                       push ax
  8343 0000388A E852CB                   call prs
  8344 0000388D 83C402                   add  sp, 2
  8345 00003890 68[113B]                 push doglob_11
  8346 00003893 E849CB                   call prs
  8347 00003896 83C402                   add  sp, 2
  8348                                  
  8349                                  ;-1024       isstrarr=1; strcpy(doglobName, symbol);
  8350                                  
  8351 00003899 B80100                   mov ax, 1
  8352 0000389C 8946FA                   mov [bp-6], ax
  8353 0000389F 8D06606D                 lea  ax, [symbol]
  8354 000038A3 50                       push ax
  8355 000038A4 8D0647A3                 lea  ax, [doglobName]
  8356 000038A8 50                       push ax
  8357 000038A9 E87DC9                   call strcpy
  8358 000038AC 83C404                   add  sp, 4
  8359                                  
  8360                                  ;-1025       expect('=');
  8361                                  
  8362 000038AF 6A3D                     push 61
  8363 000038B1 E865D6                   call expect
  8364 000038B4 83C402                   add  sp, 2
  8365                                  
  8366                                  ;-1026       if (istoken(T_STRING)) {
  8367                                  
  8368 000038B7 680201                   push 258
  8369 000038BA E83AD6                   call istoken
  8370 000038BD 83C402                   add  sp, 2
  8371 000038C0 08C0                     or  al, al
  8372 000038C2 0F844200                 je .doglob457
  8373                                  
  8374                                  ;-1027         prc(34); prscomment(symbol); prc(34); prs(",0");
  8375                                  
  8376 000038C6 6A22                     push 34
  8377 000038C8 E8BBCA                   call prc
  8378 000038CB 83C402                   add  sp, 2
  8379 000038CE 8D06606D                 lea  ax, [symbol]
  8380 000038D2 50                       push ax
  8381 000038D3 E8DBCA                   call prscomment
  8382 000038D6 83C402                   add  sp, 2
  8383 000038D9 6A22                     push 34
  8384 000038DB E8A8CA                   call prc
  8385 000038DE 83C402                   add  sp, 2
  8386 000038E1 68[163B]                 push doglob_12
  8387 000038E4 E8F8CA                   call prs
  8388 000038E7 83C402                   add  sp, 2
  8389                                  
  8390                                  ;-1028         i=strlen(symbol); GData[GTop]=i; }
  8391                                  
  8392 000038EA 8D06606D                 lea  ax, [symbol]
  8393 000038EE 50                       push ax
  8394 000038EF E80FC9                   call strlen
  8395 000038F2 83C402                   add  sp, 2
  8396 000038F5 8946FE                   mov [bp-2], ax
  8397 000038F8 8B46FE                   mov ax, [bp-2]
  8398 000038FB 8B1E[3800]               mov bx, [GTop]
  8399 000038FF D1E3                     shl bx, 1
  8400 00003901 89875973                 mov [GData+bx], ax
  8401                                  
  8402                                  ;-1029       else if (istoken('{' )) { i=0;
  8403                                  
  8404 00003905 E96200                   jmp .doglob458
  8405                                  .doglob457:
  8406 00003908 6A7B                     push 123
  8407 0000390A E8EAD5                   call istoken
  8408 0000390D 83C402                   add  sp, 2
  8409 00003910 08C0                     or  al, al
  8410 00003912 0F844B00                 je .doglob459
  8411 00003916 B80000                   mov ax, 0
  8412 00003919 8946FE                   mov [bp-2], ax
  8413                                  
  8414                                  ;-1030         do { if(i) prc(',');
  8415                                  
  8416                                  .doglob460:
  8417 0000391C 8B46FE                   mov ax, [bp-2]
  8418 0000391F 08C0                     or  al, al
  8419 00003921 0F840800                 je .doglob461
  8420 00003925 6A2C                     push 44
  8421 00003927 E85CCA                   call prc
  8422 0000392A 83C402                   add  sp, 2
  8423                                  
  8424                                  ;-1031           expect(T_CONST); prunsign1(lexval); i=1; }
  8425                                  
  8426                                  .doglob461:
  8427 0000392D 680101                   push 257
  8428 00003930 E8E6D5                   call expect
  8429 00003933 83C402                   add  sp, 2
  8430 00003936 FF36[2B00]               push word [lexval]
  8431 0000393A E8F7CB                   call prunsign1
  8432 0000393D 83C402                   add  sp, 2
  8433 00003940 B80100                   mov ax, 1
  8434 00003943 8946FE                   mov [bp-2], ax
  8435                                  
  8436                                  ;-1032         while (istoken(',')); expect('}'); }
  8437                                  
  8438 00003946 6A2C                     push 44
  8439 00003948 E8ACD5                   call istoken
  8440 0000394B 83C402                   add  sp, 2
  8441 0000394E 08C0                     or  al, al
  8442 00003950 0F840200                 je .doglob462
  8443 00003954 EBC6                     jmp .doglob460
  8444                                  .doglob462:
  8445 00003956 6A7D                     push 125
  8446 00003958 E8BED5                   call expect
  8447 0000395B 83C402                   add  sp, 2
  8448                                  
  8449                                  ;-1033       else error1("String or number array expected");
  8450                                  
  8451 0000395E E90900                   jmp .doglob463
  8452                                  .doglob459:
  8453 00003961 68[193B]                 push doglob_13
  8454 00003964 E834CC                   call error1
  8455 00003967 83C402                   add  sp, 2
  8456                                  
  8457                                  ;-1034       };
  8458                                  
  8459                                  .doglob463:
  8460                                  .doglob458:
  8461                                  .doglob455:
  8462                                  
  8463                                  ;-1035   }else { //expect('=');
  8464                                  
  8465 0000396A E99E00                   jmp .doglob464
  8466                                  .doglob448:
  8467                                  
  8468                                  ;-1036     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");
  8469                                  
  8470 0000396D 68[393B]                 push doglob_14
  8471 00003970 E86CCA                   call prs
  8472 00003973 83C402                   add  sp, 2
  8473 00003976 8D06606D                 lea  ax, [symbol]
  8474 0000397A 50                       push ax
  8475 0000397B E861CA                   call prs
  8476 0000397E 83C402                   add  sp, 2
  8477 00003981 A0[2F00]                 mov al, [istype]
  8478 00003984 3C2A                     cmp al, 42
  8479 00003986 0F850C00                 jne .doglob465
  8480 0000398A 68[3C3B]                 push doglob_15
  8481 0000398D E84FCA                   call prs
  8482 00003990 83C402                   add  sp, 2
  8483                                  
  8484                                  ;-1037     else {
  8485                                  
  8486 00003993 E93300                   jmp .doglob466
  8487                                  .doglob465:
  8488                                  
  8489                                  ;-1038       if      (iswidth==1) prs(" db ");
  8490                                  
  8491 00003996 A0[3500]                 mov al, [iswidth]
  8492 00003999 3C01                     cmp al, 1
  8493 0000399B 0F850C00                 jne .doglob467
  8494 0000399F 68[413B]                 push doglob_16
  8495 000039A2 E83ACA                   call prs
  8496 000039A5 83C402                   add  sp, 2
  8497                                  
  8498                                  ;-1039       else if (iswidth==2) prs(" dw ");
  8499                                  
  8500 000039A8 E91E00                   jmp .doglob468
  8501                                  .doglob467:
  8502 000039AB A0[3500]                 mov al, [iswidth]
  8503 000039AE 3C02                     cmp al, 2
  8504 000039B0 0F850C00                 jne .doglob469
  8505 000039B4 68[463B]                 push doglob_17
  8506 000039B7 E825CA                   call prs
  8507 000039BA 83C402                   add  sp, 2
  8508                                  
  8509                                  ;-1040       else                 prs(" dd ");
  8510                                  
  8511 000039BD E90900                   jmp .doglob470
  8512                                  .doglob469:
  8513 000039C0 68[4B3B]                 push doglob_18
  8514 000039C3 E819CA                   call prs
  8515 000039C6 83C402                   add  sp, 2
  8516                                  
  8517                                  ;-1041     }
  8518                                  
  8519                                  .doglob470:
  8520                                  .doglob468:
  8521                                  
  8522                                  ;-1042     if(istoken('-')) prc('-');
  8523                                  
  8524                                  .doglob466:
  8525 000039C9 6A2D                     push 45
  8526 000039CB E829D5                   call istoken
  8527 000039CE 83C402                   add  sp, 2
  8528 000039D1 08C0                     or  al, al
  8529 000039D3 0F840800                 je .doglob471
  8530 000039D7 6A2D                     push 45
  8531 000039D9 E8AAC9                   call prc
  8532 000039DC 83C402                   add  sp, 2
  8533                                  
  8534                                  ;-1043     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }
  8535                                  
  8536                                  .doglob471:
  8537 000039DF 6A3D                     push 61
  8538 000039E1 E813D5                   call istoken
  8539 000039E4 83C402                   add  sp, 2
  8540 000039E7 08C0                     or  al, al
  8541 000039E9 0F841600                 je .doglob472
  8542 000039ED 680101                   push 257
  8543 000039F0 E826D5                   call expect
  8544 000039F3 83C402                   add  sp, 2
  8545 000039F6 FF36[2B00]               push word [lexval]
  8546 000039FA E837CB                   call prunsign1
  8547 000039FD 83C402                   add  sp, 2
  8548                                  
  8549                                  ;-1044     else prunsign1(0); }
  8550                                  
  8551 00003A00 E90800                   jmp .doglob473
  8552                                  .doglob472:
  8553 00003A03 6A00                     push 0
  8554 00003A05 E82CCB                   call prunsign1
  8555 00003A08 83C402                   add  sp, 2
  8556                                  .doglob473:
  8557                                  
  8558                                  ;-1045   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;
  8559                                  
  8560                                  .doglob464:
  8561 00003A0B A0[3200]                 mov al, [issign]
  8562 00003A0E 8B1E[3800]               mov bx, [GTop]
  8563 00003A12 88873970                 mov [GSign+bx], al
  8564 00003A16 A0[3500]                 mov al, [iswidth]
  8565 00003A19 8B1E[3800]               mov bx, [GTop]
  8566 00003A1D 8887C971                 mov [GWidth+bx], al
  8567 00003A21 A0[2F00]                 mov al, [istype]
  8568 00003A24 8B1E[3800]               mov bx, [GTop]
  8569 00003A28 8887A96E                 mov [GType+bx], al
  8570                                  
  8571                                  ;-1046   pt=adrF(GNameField, GTop);
  8572                                  
  8573 00003A2C FF36[3800]               push word [GTop]
  8574 00003A30 8D067976                 lea  ax, [GNameField]
  8575 00003A34 50                       push ax
  8576 00003A35 E85CCD                   call adrF
  8577 00003A38 83C404                   add  sp, 4
  8578 00003A3B A3[4200]                 mov word [pt], ax
  8579                                  
  8580                                  ;-1047   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);
  8581                                  
  8582 00003A3E 8B46FA                   mov ax, [bp-6]
  8583 00003A41 08C0                     or  al, al
  8584 00003A43 0F841200                 je .doglob474
  8585 00003A47 8D0647A3                 lea  ax, [doglobName]
  8586 00003A4B 50                       push ax
  8587 00003A4C FF36[4200]               push word [pt]
  8588 00003A50 E8D6C7                   call strcpy
  8589 00003A53 83C404                   add  sp, 4
  8590 00003A56 E90F00                   jmp .doglob475
  8591                                  .doglob474:
  8592 00003A59 8D06606D                 lea  ax, [symbol]
  8593 00003A5D 50                       push ax
  8594 00003A5E FF36[4200]               push word [pt]
  8595 00003A62 E8C4C7                   call strcpy
  8596 00003A65 83C404                   add  sp, 4
  8597                                  
  8598                                  ;-1048   GTop++; expect(';'); }
  8599                                  
  8600                                  .doglob475:
  8601 00003A68 FF06[3800]               inc  word[GTop]
  8602 00003A6C 6A3B                     push 59
  8603 00003A6E E8A8D4                   call expect
  8604 00003A71 83C402                   add  sp, 2
  8605                                  
  8606                                  ;-1049 
  8607                                  
  8608                                  
  8609                                  ;-1050 
  8610                                  
  8611                                  
  8612                                  ;-1051 int dodefine() {
  8613 00003A74 C9                       LEAVE
  8614 00003A75 C3                       ret
  8615 00003A76 476C6F62616C207461-     doglob_0 db "Global table full",0
  8616 00003A7F 626C652066756C6C00 
  8617 00003A88 6E6F20564F49442061-     doglob_1 db "no VOID as var type",0
  8618 00003A91 732076617220747970-
  8619 00003A9A 6500               
  8620 00003A9C 5661726961626C6520-     doglob_2 db "Variable already defined",0
  8621 00003AA5 616C72656164792064-
  8622 00003AAE 6566696E656400     
  8623 00003AB5 5C6E73656374696F6E-     doglob_3 db "\nsection .bss\nabsolute ",0
  8624 00003ABE 202E6273735C6E6162-
  8625 00003AC7 736F6C7574652000   
  8626 00003ACF 5C6E00                  doglob_4 db "\n",0
  8627 00003AD2 20726573622000          doglob_5 db " resb ",0
  8628 00003AD9 20726573772000          doglob_6 db " resw ",0
  8629 00003AE0 20726573642000          doglob_7 db " resd ",0
  8630 00003AE7 5C6E73656374696F6E-     doglob_8 db "\nsection .text",0
  8631 00003AF0 202E7465787400     
  8632 00003AF7 4F6E6C792042797465-     doglob_9 db "Only ByteArray allowed",0
  8633 00003B00 417272617920616C6C-
  8634 00003B09 6F77656400         
  8635 00003B0E 5C6E00                  doglob_10 db "\n",0
  8636 00003B11 2064622000              doglob_11 db " db ",0
  8637 00003B16 2C3000                  doglob_12 db ",0",0
  8638 00003B19 537472696E67206F72-     doglob_13 db "String or number array expected",0
  8639 00003B22 206E756D6265722061-
  8640 00003B2B 727261792065787065-
  8641 00003B34 6374656400         
  8642 00003B39 5C6E00                  doglob_14 db "\n",0
  8643 00003B3C 2064772000              doglob_15 db " dw ",0
  8644 00003B41 2064622000              doglob_16 db " db ",0
  8645 00003B46 2064772000              doglob_17 db " dw ",0
  8646 00003B4B 2064642000              doglob_18 db " dd ",0
  8647                                  ENDP
  8648                                  
  8649                                  dodefine: PROC
  8650                                  
  8651                                  ;-1052     int i; int j; int fdtemp;
  8652                                  
  8653                                  
  8654                                  ;-1053     if (eqstr(symbol, "ORGDATA")) {
  8655                                  ;
  8656 00003B50 C8060000                 ENTER  6,0
  8657 00003B54 68[223C]                 push dodefine_0
  8658 00003B57 8D06606D                 lea  ax, [symbol]
  8659 00003B5B 50                       push ax
  8660 00003B5C E800C7                   call eqstr
  8661 00003B5F 83C404                   add  sp, 4
  8662 00003B62 08C0                     or  al, al
  8663 00003B64 0F841500                 je .dodefine476
  8664                                  
  8665                                  ;-1054         token=getlex();
  8666                                  
  8667 00003B68 E8DACC                   call getlex
  8668 00003B6B A3[1E00]                 mov word [token], ax
  8669                                  
  8670                                  ;-1055         ORGDATAORIG=lexval;
  8671                                  
  8672 00003B6E A1[2B00]                 mov ax, [lexval]
  8673 00003B71 A3[1000]                 mov word [ORGDATAORIG], ax
  8674                                  
  8675                                  ;-1056         orgData=lexval;
  8676                                  
  8677 00003B74 A1[2B00]                 mov ax, [lexval]
  8678 00003B77 A3[1200]                 mov word [orgData], ax
  8679                                  
  8680                                  ;-1057         return;
  8681                                  
  8682 00003B7A E9A300                   jmp .retndodefine
  8683                                  
  8684                                  ;-1058     }
  8685                                  
  8686                                  
  8687                                  ;-1059     expect(T_NAME);
  8688                                  
  8689                                  .dodefine476:
  8690 00003B7D 680001                   push 256
  8691 00003B80 E896D3                   call expect
  8692 00003B83 83C402                   add  sp, 2
  8693                                  
  8694                                  ;-1060     if (token==T_CONST) {
  8695                                  
  8696 00003B86 A1[1E00]                 mov ax, [token]
  8697 00003B89 3D0101                   cmp ax, 257
  8698 00003B8C 0F859000                 jne .dodefine477
  8699                                  
  8700                                  ;-1061         if (GTop >= LSTART) error1("global table (define) full");
  8701                                  
  8702 00003B90 A1[3800]                 mov ax, [GTop]
  8703 00003B93 3DC800                   cmp ax, 200 ;unsigned : 1
  8704 00003B96 0F8C0900                 jl  .dodefine478
  8705 00003B9A 68[2A3C]                 push dodefine_1
  8706 00003B9D E8FBC9                   call error1
  8707 00003BA0 83C402                   add  sp, 2
  8708                                  
  8709                                  ;-1062         i=strlen(symbol);
  8710                                  
  8711                                  .dodefine478:
  8712 00003BA3 8D06606D                 lea  ax, [symbol]
  8713 00003BA7 50                       push ax
  8714 00003BA8 E856C6                   call strlen
  8715 00003BAB 83C402                   add  sp, 2
  8716 00003BAE 8946FE                   mov [bp-2], ax
  8717                                  
  8718                                  ;-1063         if (i>15) error1("Define name longer 15 char");
  8719                                  
  8720 00003BB1 8B46FE                   mov ax, [bp-2]
  8721 00003BB4 83F80F                   cmp ax, 15
  8722 00003BB7 0F8E0900                 jle .dodefine479
  8723 00003BBB 68[453C]                 push dodefine_2
  8724 00003BBE E8DAC9                   call error1
  8725 00003BC1 83C402                   add  sp, 2
  8726                                  
  8727                                  ;-1064         GSign [GTop]='U';
  8728                                  
  8729                                  .dodefine479:
  8730 00003BC4 B85500                   mov ax, 85
  8731 00003BC7 8B1E[3800]               mov bx, [GTop]
  8732 00003BCB 88873970                 mov [GSign+bx], al
  8733                                  
  8734                                  ;-1065         GWidth[GTop]=1;
  8735                                  
  8736 00003BCF B80100                   mov ax, 1
  8737 00003BD2 8B1E[3800]               mov bx, [GTop]
  8738 00003BD6 8887C971                 mov [GWidth+bx], al
  8739                                  
  8740                                  ;-1066         GType [GTop]='#';
  8741                                  
  8742 00003BDA B82300                   mov ax, 35
  8743 00003BDD 8B1E[3800]               mov bx, [GTop]
  8744 00003BE1 8887A96E                 mov [GType+bx], al
  8745                                  
  8746                                  ;-1067         pt=adrF(GNameField, GTop);
  8747                                  
  8748 00003BE5 FF36[3800]               push word [GTop]
  8749 00003BE9 8D067976                 lea  ax, [GNameField]
  8750 00003BED 50                       push ax
  8751 00003BEE E8A3CB                   call adrF
  8752 00003BF1 83C404                   add  sp, 4
  8753 00003BF4 A3[4200]                 mov word [pt], ax
  8754                                  
  8755                                  ;-1068         strcpy(pt, symbol);
  8756                                  
  8757 00003BF7 8D06606D                 lea  ax, [symbol]
  8758 00003BFB 50                       push ax
  8759 00003BFC FF36[4200]               push word [pt]
  8760 00003C00 E826C6                   call strcpy
  8761 00003C03 83C404                   add  sp, 4
  8762                                  
  8763                                  ;-1069         GData[GTop]=lexval;
  8764                                  
  8765 00003C06 A1[2B00]                 mov ax, [lexval]
  8766 00003C09 8B1E[3800]               mov bx, [GTop]
  8767 00003C0D D1E3                     shl bx, 1
  8768 00003C0F 89875973                 mov [GData+bx], ax
  8769                                  
  8770                                  ;-1070         expect(T_CONST);
  8771                                  
  8772 00003C13 680101                   push 257
  8773 00003C16 E800D3                   call expect
  8774 00003C19 83C402                   add  sp, 2
  8775                                  
  8776                                  ;-1071         GTop++;
  8777                                  
  8778 00003C1C FF06[3800]               inc  word[GTop]
  8779                                  
  8780                                  ;-1072     }
  8781                                  
  8782                                  
  8783                                  ;-1073 }
  8784                                  
  8785                                  .dodefine477:
  8786                                  
  8787                                  ;-1074 
  8788                                  
  8789                                  
  8790                                  ;-1075 int parse() {
  8791                                  
  8792 00003C20 C9                       .retndodefine: LEAVE
  8793 00003C21 C3                       ret
  8794 00003C22 4F52474441544100        dodefine_0 db "ORGDATA",0
  8795 00003C2A 676C6F62616C207461-     dodefine_1 db "global table (define) full",0
  8796 00003C33 626C65202864656669-
  8797 00003C3C 6E65292066756C6C00 
  8798 00003C45 446566696E65206E61-     dodefine_2 db "Define name longer 15 char",0
  8799 00003C4E 6D65206C6F6E676572-
  8800 00003C57 203135206368617200 
  8801                                  ENDP
  8802                                  
  8803                                  parse: PROC
  8804                                  
  8805                                  ;-1076     token=getlex();
  8806                                  
  8807 00003C60 E8E2CB                   call getlex
  8808 00003C63 A3[1E00]                 mov word [token], ax
  8809                                  
  8810                                  ;-1077     do {
  8811                                  
  8812                                  .parse480:
  8813                                  
  8814                                  ;-1078         if (token <= 0) return 1;
  8815                                  
  8816 00003C66 A1[1E00]                 mov ax, [token]
  8817 00003C69 83F800                   cmp ax, 0
  8818 00003C6C 0F8F0600                 jg  .parse481
  8819 00003C70 B80100                   mov ax, 1
  8820 00003C73 E95000                   jmp .retnparse
  8821                                  
  8822                                  ;-1079         if (istoken('#')) {
  8823                                  
  8824                                  .parse481:
  8825 00003C76 6A23                     push 35
  8826 00003C78 E87CD2                   call istoken
  8827 00003C7B 83C402                   add  sp, 2
  8828 00003C7E 08C0                     or  al, al
  8829 00003C80 0F842100                 je .parse482
  8830                                  
  8831                                  ;-1080              if (istoken(T_DEFINE))  dodefine();
  8832                                  
  8833 00003C84 68FF01                   push 511
  8834 00003C87 E86DD2                   call istoken
  8835 00003C8A 83C402                   add  sp, 2
  8836 00003C8D 08C0                     or  al, al
  8837 00003C8F 0F840600                 je .parse483
  8838 00003C93 E8BAFE                   call dodefine
  8839                                  
  8840                                  ;-1081              else error1("define expected");
  8841                                  
  8842 00003C96 E90900                   jmp .parse484
  8843                                  .parse483:
  8844 00003C99 68[C73C]                 push parse_0
  8845 00003C9C E8FCC8                   call error1
  8846 00003C9F 83C402                   add  sp, 2
  8847                                  
  8848                                  ;-1082         }
  8849                                  
  8850                                  .parse484:
  8851                                  
  8852                                  ;-1083     else{
  8853                                  
  8854 00003CA2 E91600                   jmp .parse485
  8855                                  .parse482:
  8856                                  
  8857                                  ;-1084         typeName();
  8858                                  
  8859 00003CA5 E844D4                   call typeName
  8860                                  
  8861                                  ;-1085         if (token=='(') dofunc();
  8862                                  
  8863 00003CA8 A1[1E00]                 mov ax, [token]
  8864 00003CAB 83F828                   cmp ax, 40
  8865 00003CAE 0F850600                 jne .parse486
  8866 00003CB2 E88CF7                   call dofunc
  8867                                  
  8868                                  ;-1086         else doglob(); }
  8869                                  
  8870 00003CB5 E90300                   jmp .parse487
  8871                                  .parse486:
  8872 00003CB8 E87EFA                   call doglob
  8873                                  .parse487:
  8874                                  
  8875                                  ;-1087     } while(1);
  8876                                  
  8877                                  .parse485:
  8878 00003CBB B80100                   mov ax, 1
  8879 00003CBE 08C0                     or  al, al
  8880 00003CC0 0F840200                 je .parse488
  8881 00003CC4 EBA0                     jmp .parse480
  8882                                  .parse488:
  8883                                  
  8884                                  ;-1088 }
  8885                                  
  8886                                  
  8887                                  ;-1089 
  8888                                  
  8889                                  
  8890                                  ;-1090 char *arglen=0x80; char *argv=0x82;
  8891                                  
  8892                                   .retnparse:
  8893 00003CC6 C3                       ret
  8894 00003CC7 646566696E65206578-     parse_0 db "define expected",0
  8895 00003CD0 70656374656400     
  8896                                  ENDP
  8897 00003CD7 8000                    arglen dw 128
  8898 00003CD9 8200                    argv dw 130
  8899                                  
  8900                                  ;-1091 int main() {
  8901                                  
  8902                                  
  8903                                  main: PROC
  8904                                  
  8905                                  ;-1092     int arglen1; unsigned int i; char *c;
  8906                                  
  8907                                  
  8908                                  ;-1093     arglen1=*arglen;
  8909                                  ;
  8910 00003CDB C8060000                 ENTER  6,0
  8911 00003CDF 8B1E[D73C]               mov bx, [arglen]
  8912 00003CE3 8A07                     mov al, [bx]
  8913 00003CE5 B400                     mov ah, 0
  8914 00003CE7 8946FE                   mov [bp-2], ax
  8915                                  
  8916                                  ;-1094     if (arglen1 == 0) {
  8917                                  
  8918 00003CEA 8B46FE                   mov ax, [bp-2]
  8919 00003CED 83F800                   cmp ax, 0
  8920 00003CF0 0F851C00                 jne .main489
  8921                                  
  8922                                  ;-1095         cputs(Version1);
  8923                                  
  8924 00003CF4 8D06[0300]               lea  ax, [Version1]
  8925 00003CF8 50                       push ax
  8926 00003CF9 E877C3                   call cputs
  8927 00003CFC 83C402                   add  sp, 2
  8928                                  
  8929                                  ;-1096         cputs(" Usage: A.COM in_file[.C]: ");
  8930                                  
  8931 00003CFF 68[733F]                 push main_0
  8932 00003D02 E86EC3                   call cputs
  8933 00003D05 83C402                   add  sp, 2
  8934                                  
  8935                                  ;-1097         exitR(3);
  8936                                  
  8937 00003D08 6A03                     push 3
  8938 00003D0A E8D8C3                   call exitR
  8939 00003D0D 83C402                   add  sp, 2
  8940                                  
  8941                                  ;-1098         }
  8942                                  
  8943                                  
  8944                                  ;-1099     i=arglen1+129;
  8945                                  
  8946                                  .main489:
  8947 00003D10 8B46FE                   mov ax, [bp-2]
  8948 00003D13 058100                   add ax, 129
  8949 00003D16 8946FC                   mov [bp-4], ax
  8950                                  
  8951                                  ;-1100     *i=0;
  8952                                  
  8953 00003D19 B80000                   mov ax, 0
  8954 00003D1C 8B5EFC                   mov  bx, [bp-4]
  8955 00003D1F 8907                     mov  [bx], ax
  8956                                  
  8957                                  ;-1101     arglen1--;
  8958                                  
  8959 00003D21 FF4EFE                   dec  word[bp-2]
  8960                                  
  8961                                  ;-1102     toupper(argv);
  8962                                  
  8963 00003D24 FF36[D93C]               push word [argv]
  8964 00003D28 E8A5C5                   call toupper
  8965 00003D2B 83C402                   add  sp, 2
  8966                                  
  8967                                  ;-1103     strcpy(namein, argv);
  8968                                  
  8969 00003D2E FF36[D93C]               push word [argv]
  8970 00003D32 8D06236E                 lea  ax, [namein]
  8971 00003D36 50                       push ax
  8972 00003D37 E8EFC4                   call strcpy
  8973 00003D3A 83C404                   add  sp, 4
  8974                                  
  8975                                  ;-1104     if (instr1(namein, '.') == 0) strcat1(namein, ".C");
  8976                                  
  8977 00003D3D 6A2E                     push 46
  8978 00003D3F 8D06236E                 lea  ax, [namein]
  8979 00003D43 50                       push ax
  8980 00003D44 E8CCC5                   call instr1
  8981 00003D47 83C404                   add  sp, 4
  8982 00003D4A 83F800                   cmp ax, 0
  8983 00003D4D 0F850E00                 jne .main490
  8984 00003D51 68[8F3F]                 push main_1
  8985 00003D54 8D06236E                 lea  ax, [namein]
  8986 00003D58 50                       push ax
  8987 00003D59 E84FC5                   call strcat1
  8988 00003D5C 83C404                   add  sp, 4
  8989                                  
  8990                                  ;-1105     strcpy(namelst, namein);
  8991                                  
  8992                                  .main490:
  8993 00003D5F 8D06236E                 lea  ax, [namein]
  8994 00003D63 50                       push ax
  8995 00003D64 8D06666E                 lea  ax, [namelst]
  8996 00003D68 50                       push ax
  8997 00003D69 E8BDC4                   call strcpy
  8998 00003D6C 83C404                   add  sp, 4
  8999                                  
  9000                                  ;-1106     i=strlen(namelst);
  9001                                  
  9002 00003D6F 8D06666E                 lea  ax, [namelst]
  9003 00003D73 50                       push ax
  9004 00003D74 E88AC4                   call strlen
  9005 00003D77 83C402                   add  sp, 2
  9006 00003D7A 8946FC                   mov [bp-4], ax
  9007                                  
  9008                                  ;-1107     i--;
  9009                                  
  9010 00003D7D FF4EFC                   dec  word[bp-4]
  9011                                  
  9012                                  ;-1108     c=&namelst+i;
  9013                                  
  9014 00003D80 B8666E                   mov ax, namelst
  9015 00003D83 0346FC                   add ax, [bp-4]
  9016 00003D86 8946FA                   mov [bp-6], ax
  9017                                  
  9018                                  ;-1109     *c='S';
  9019                                  
  9020 00003D89 B85300                   mov ax, 83
  9021 00003D8C 8B5EFA                   mov  bx, [bp-6]
  9022 00003D8F 8807                     mov  [bx], al
  9023                                  
  9024                                  ;-1110 
  9025                                  
  9026                                  
  9027                                  ;-1111     fdin=openR (namein);
  9028                                  
  9029 00003D91 8D06236E                 lea  ax, [namein]
  9030 00003D95 50                       push ax
  9031 00003D96 E81CC3                   call openR
  9032 00003D99 83C402                   add  sp, 2
  9033 00003D9C A3[1A00]                 mov word [fdin], ax
  9034                                  
  9035                                  ;-1112     if(DOS_ERR){
  9036                                  
  9037 00003D9F A1[4600]                 mov ax, [DOS_ERR]
  9038 00003DA2 08C0                     or  al, al
  9039 00003DA4 0F841C00                 je .main491
  9040                                  
  9041                                  ;-1113         cputs("Source file missing (.C): ");
  9042                                  
  9043 00003DA8 68[923F]                 push main_2
  9044 00003DAB E8C5C2                   call cputs
  9045 00003DAE 83C402                   add  sp, 2
  9046                                  
  9047                                  ;-1114         cputs(namein);
  9048                                  
  9049 00003DB1 8D06236E                 lea  ax, [namein]
  9050 00003DB5 50                       push ax
  9051 00003DB6 E8BAC2                   call cputs
  9052 00003DB9 83C402                   add  sp, 2
  9053                                  
  9054                                  ;-1115         exitR(1);
  9055                                  
  9056 00003DBC 6A01                     push 1
  9057 00003DBE E824C3                   call exitR
  9058 00003DC1 83C402                   add  sp, 2
  9059                                  
  9060                                  ;-1116         }
  9061                                  
  9062                                  
  9063                                  ;-1117     fdout=creatR(namelst);
  9064                                  
  9065                                  .main491:
  9066 00003DC4 8D06666E                 lea  ax, [namelst]
  9067 00003DC8 50                       push ax
  9068 00003DC9 E8F8C2                   call creatR
  9069 00003DCC 83C402                   add  sp, 2
  9070 00003DCF A3[1C00]                 mov word [fdout], ax
  9071                                  
  9072                                  ;-1118     if(DOS_ERR){
  9073                                  
  9074 00003DD2 A1[4600]                 mov ax, [DOS_ERR]
  9075 00003DD5 08C0                     or  al, al
  9076 00003DD7 0F841C00                 je .main492
  9077                                  
  9078                                  ;-1119         cputs("list file not creatable: ");
  9079                                  
  9080 00003DDB 68[AD3F]                 push main_3
  9081 00003DDE E892C2                   call cputs
  9082 00003DE1 83C402                   add  sp, 2
  9083                                  
  9084                                  ;-1120         cputs(namelst);
  9085                                  
  9086 00003DE4 8D06666E                 lea  ax, [namelst]
  9087 00003DE8 50                       push ax
  9088 00003DE9 E887C2                   call cputs
  9089 00003DEC 83C402                   add  sp, 2
  9090                                  
  9091                                  ;-1121         exitR(2);
  9092                                  
  9093 00003DEF 6A02                     push 2
  9094 00003DF1 E8F1C2                   call exitR
  9095 00003DF4 83C402                   add  sp, 2
  9096                                  
  9097                                  ;-1122         }
  9098                                  
  9099                                  
  9100                                  ;-1123     prs("\n; ");
  9101                                  
  9102                                  .main492:
  9103 00003DF7 68[C73F]                 push main_4
  9104 00003DFA E8E2C5                   call prs
  9105 00003DFD 83C402                   add  sp, 2
  9106                                  
  9107                                  ;-1124     prs(Version1);
  9108                                  
  9109 00003E00 8D06[0300]               lea  ax, [Version1]
  9110 00003E04 50                       push ax
  9111 00003E05 E8D7C5                   call prs
  9112 00003E08 83C402                   add  sp, 2
  9113                                  
  9114                                  ;-1125     prs(", Source: "); prs(namein);
  9115                                  
  9116 00003E0B 68[CC3F]                 push main_5
  9117 00003E0E E8CEC5                   call prs
  9118 00003E11 83C402                   add  sp, 2
  9119 00003E14 8D06236E                 lea  ax, [namein]
  9120 00003E18 50                       push ax
  9121 00003E19 E8C3C5                   call prs
  9122 00003E1C 83C402                   add  sp, 2
  9123                                  
  9124                                  ;-1126     prs(", Output asm: "); prs(namelst);
  9125                                  
  9126 00003E1F 68[D73F]                 push main_6
  9127 00003E22 E8BAC5                   call prs
  9128 00003E25 83C402                   add  sp, 2
  9129 00003E28 8D06666E                 lea  ax, [namelst]
  9130 00003E2C 50                       push ax
  9131 00003E2D E8AFC5                   call prs
  9132 00003E30 83C402                   add  sp, 2
  9133                                  
  9134                                  ;-1127     prs("\norg  256 \njmp main");
  9135                                  
  9136 00003E33 68[E63F]                 push main_7
  9137 00003E36 E8A6C5                   call prs
  9138 00003E39 83C402                   add  sp, 2
  9139                                  
  9140                                  ;-1128     orgData=ORGDATAORIG;
  9141                                  
  9142 00003E3C A1[1000]                 mov ax, [ORGDATAORIG]
  9143 00003E3F A3[1200]                 mov word [orgData], ax
  9144                                  
  9145                                  ;-1129     fgetsp=&fgetsdest;
  9146                                  
  9147 00003E42 B839A2                   mov ax, fgetsdest
  9148 00003E45 A3[3E00]                 mov word [fgetsp], ax
  9149                                  
  9150                                  ;-1130     *fgetsp=0;
  9151                                  
  9152 00003E48 B80000                   mov ax, 0
  9153 00003E4B 8B1E[3E00]               mov  bx, [fgetsp]
  9154 00003E4F 8807                     mov  [bx], al
  9155                                  
  9156                                  ;-1131     thechar=fgets1();
  9157                                  
  9158 00003E51 E8D6C8                   call fgets1
  9159 00003E54 A2[2200]                 mov byte [thechar], al
  9160                                  
  9161                                  ;-1132     parse();
  9162                                  
  9163 00003E57 E806FE                   call parse
  9164                                  
  9165                                  ;-1133     prs("\n;Input: "); prs(namein);
  9166                                  
  9167 00003E5A 68[FC3F]                 push main_8
  9168 00003E5D E87FC5                   call prs
  9169 00003E60 83C402                   add  sp, 2
  9170 00003E63 8D06236E                 lea  ax, [namein]
  9171 00003E67 50                       push ax
  9172 00003E68 E874C5                   call prs
  9173 00003E6B 83C402                   add  sp, 2
  9174                                  
  9175                                  ;-1134     prs(", List: ");   prs(namelst);
  9176                                  
  9177 00003E6E 68[0740]                 push main_9
  9178 00003E71 E86BC5                   call prs
  9179 00003E74 83C402                   add  sp, 2
  9180 00003E77 8D06666E                 lea  ax, [namelst]
  9181 00003E7B 50                       push ax
  9182 00003E7C E860C5                   call prs
  9183 00003E7F 83C402                   add  sp, 2
  9184                                  
  9185                                  ;-1135     prs(", Lines: "); prunsign1(lineno);
  9186                                  
  9187 00003E82 68[1040]                 push main_10
  9188 00003E85 E857C5                   call prs
  9189 00003E88 83C402                   add  sp, 2
  9190 00003E8B FF36[4000]               push word [lineno]
  9191 00003E8F E8A2C6                   call prunsign1
  9192 00003E92 83C402                   add  sp, 2
  9193                                  
  9194                                  ;-1136     prs("\n;Glob. variables: "); GTop--; prunsign1(GTop);
  9195                                  
  9196 00003E95 68[1A40]                 push main_11
  9197 00003E98 E844C5                   call prs
  9198 00003E9B 83C402                   add  sp, 2
  9199 00003E9E FF0E[3800]               dec  word[GTop]
  9200 00003EA2 FF36[3800]               push word [GTop]
  9201 00003EA6 E88BC6                   call prunsign1
  9202 00003EA9 83C402                   add  sp, 2
  9203                                  
  9204                                  ;-1137     prs(" ("); prunsign1(LSTART);
  9205                                  
  9206 00003EAC 68[2F40]                 push main_12
  9207 00003EAF E82DC5                   call prs
  9208 00003EB2 83C402                   add  sp, 2
  9209 00003EB5 68C800                   push 200
  9210 00003EB8 E879C6                   call prunsign1
  9211 00003EBB 83C402                   add  sp, 2
  9212                                  
  9213                                  ;-1138     prs("), Functions: "); prunsign1(FTop);
  9214                                  
  9215 00003EBE 68[3240]                 push main_13
  9216 00003EC1 E81BC5                   call prs
  9217 00003EC4 83C402                   add  sp, 2
  9218 00003EC7 FF36[3C00]               push word [FTop]
  9219 00003ECB E866C6                   call prunsign1
  9220 00003ECE 83C402                   add  sp, 2
  9221                                  
  9222                                  ;-1139     prs(" ("); prunsign1(FUNCMAX);
  9223                                  
  9224 00003ED1 68[4140]                 push main_14
  9225 00003ED4 E808C5                   call prs
  9226 00003ED7 83C402                   add  sp, 2
  9227 00003EDA 682C01                   push 300
  9228 00003EDD E854C6                   call prunsign1
  9229 00003EE0 83C402                   add  sp, 2
  9230                                  
  9231                                  ;-1140     prs(")\n;Constant: ");   prunsign1(maxco);
  9232                                  
  9233 00003EE3 68[4440]                 push main_15
  9234 00003EE6 E8F6C4                   call prs
  9235 00003EE9 83C402                   add  sp, 2
  9236 00003EEC FF36[1400]               push word [maxco]
  9237 00003EF0 E841C6                   call prunsign1
  9238 00003EF3 83C402                   add  sp, 2
  9239                                  
  9240                                  ;-1141     prs(" ("); prunsign1(COMAX);
  9241                                  
  9242 00003EF6 68[5340]                 push main_16
  9243 00003EF9 E8E3C4                   call prs
  9244 00003EFC 83C402                   add  sp, 2
  9245 00003EFF 68B80B                   push 3000
  9246 00003F02 E82FC6                   call prunsign1
  9247 00003F05 83C402                   add  sp, 2
  9248                                  
  9249                                  ;-1142     i=COMAX; i=i-maxco;
  9250                                  
  9251 00003F08 B8B80B                   mov ax, 3000
  9252 00003F0B 8946FC                   mov [bp-4], ax
  9253 00003F0E 8B46FC                   mov ax, [bp-4]
  9254 00003F11 2B06[1400]               sub ax, [maxco]
  9255 00003F15 8946FC                   mov [bp-4], ax
  9256                                  
  9257                                  ;-1143     if (i <= 1000)prs("\n *** Warning *** constant area too small");
  9258                                  
  9259 00003F18 8B46FC                   mov ax, [bp-4]
  9260 00003F1B 3DE803                   cmp ax, 1000
  9261 00003F1E 0F870900                 ja  .main493
  9262 00003F22 68[5640]                 push main_17
  9263 00003F25 E8B7C4                   call prs
  9264 00003F28 83C402                   add  sp, 2
  9265                                  
  9266                                  ;-1144     prs("), stacksize: ");
  9267                                  
  9268                                  .main493:
  9269 00003F2B 68[8140]                 push main_18
  9270 00003F2E E8AEC4                   call prs
  9271 00003F31 83C402                   add  sp, 2
  9272                                  
  9273                                  ;-1145     i=65636; i=i-orgData;
  9274                                  
  9275 00003F34 B86400                   mov ax, 100
  9276 00003F37 8946FC                   mov [bp-4], ax
  9277 00003F3A 8B46FC                   mov ax, [bp-4]
  9278 00003F3D 2B06[1200]               sub ax, [orgData]
  9279 00003F41 8946FC                   mov [bp-4], ax
  9280                                  
  9281                                  ;-1146     prunsign1(i);
  9282                                  
  9283 00003F44 FF76FC                   push word [bp-4]
  9284 00003F47 E8EAC5                   call prunsign1
  9285 00003F4A 83C402                   add  sp, 2
  9286                                  
  9287                                  ;-1147     if (i <= 1000) prs("\n *** Warning *** Stack too small");
  9288                                  
  9289 00003F4D 8B46FC                   mov ax, [bp-4]
  9290 00003F50 3DE803                   cmp ax, 1000
  9291 00003F53 0F870900                 ja  .main494
  9292 00003F57 68[9040]                 push main_19
  9293 00003F5A E882C4                   call prs
  9294 00003F5D 83C402                   add  sp, 2
  9295                                  
  9296                                  ;-1148     prs("    ");
  9297                                  
  9298                                  .main494:
  9299 00003F60 68[B340]                 push main_20
  9300 00003F63 E879C4                   call prs
  9301 00003F66 83C402                   add  sp, 2
  9302                                  
  9303                                  ;-1149     end1(0);
  9304                                  
  9305 00003F69 6A00                     push 0
  9306 00003F6B E80AC6                   call end1
  9307 00003F6E 83C402                   add  sp, 2
  9308                                  
  9309                                  ;-1150 }
  9310 00003F71 C9                       LEAVE
  9311 00003F72 C3                       ret
  9312 00003F73 2055736167653A2041-     main_0 db " Usage: A.COM in_file[.C]: ",0
  9313 00003F7C 2E434F4D20696E5F66-
  9314 00003F85 696C655B2E435D3A20-
  9315 00003F8E 00                 
  9316 00003F8F 2E4300                  main_1 db ".C",0
  9317 00003F92 536F75726365206669-     main_2 db "Source file missing (.C): ",0
  9318 00003F9B 6C65206D697373696E-
  9319 00003FA4 6720282E43293A2000 
  9320 00003FAD 6C6973742066696C65-     main_3 db "list file not creatable: ",0
  9321 00003FB6 206E6F742063726561-
  9322 00003FBF 7461626C653A2000   
  9323 00003FC7 5C6E3B2000              main_4 db "\n; ",0
  9324 00003FCC 2C20536F757263653A-     main_5 db ", Source: ",0
  9325 00003FD5 2000               
  9326 00003FD7 2C204F757470757420-     main_6 db ", Output asm: ",0
  9327 00003FE0 61736D3A2000       
  9328 00003FE6 5C6E6F726720203235-     main_7 db "\norg  256 \njmp main",0
  9329 00003FEF 36205C6E6A6D70206D-
  9330 00003FF8 61696E00           
  9331 00003FFC 5C6E3B496E7075743A-     main_8 db "\n;Input: ",0
  9332 00004005 2000               
  9333 00004007 2C204C6973743A2000      main_9 db ", List: ",0
  9334 00004010 2C204C696E65733A20-     main_10 db ", Lines: ",0
  9335 00004019 00                 
  9336 0000401A 5C6E3B476C6F622E20-     main_11 db "\n;Glob. variables: ",0
  9337 00004023 7661726961626C6573-
  9338 0000402C 3A2000             
  9339 0000402F 202800                  main_12 db " (",0
  9340 00004032 292C2046756E637469-     main_13 db "), Functions: ",0
  9341 0000403B 6F6E733A2000       
  9342 00004041 202800                  main_14 db " (",0
  9343 00004044 295C6E3B436F6E7374-     main_15 db ")\n;Constant: ",0
  9344 0000404D 616E743A2000       
  9345 00004053 202800                  main_16 db " (",0
  9346 00004056 5C6E202A2A2A205761-     main_17 db "\n *** Warning *** constant area too small",0
  9347 0000405F 726E696E67202A2A2A-
  9348 00004068 20636F6E7374616E74-
  9349 00004071 206172656120746F6F-
  9350 0000407A 20736D616C6C00     
  9351 00004081 292C20737461636B73-     main_18 db "), stacksize: ",0
  9352 0000408A 697A653A2000       
  9353 00004090 5C6E202A2A2A205761-     main_19 db "\n *** Warning *** Stack too small",0
  9354 00004099 726E696E67202A2A2A-
  9355 000040A2 20537461636B20746F-
  9356 000040AB 6F20736D616C6C00   
  9357 000040B3 2020202000              main_20 db "    ",0
  9358                                  ENDP
  9359                                  ;Input: A.C, List: A.S, Lines: 1151
  9360                                  ;Glob. variables: 99 (200), Functions: 74 (300)
  9361                                  ;Constant: 712 (3000), stacksize: 23822    
