     1                                  
     2                                  ; A.COM V0.9.2, Source: A.C, Output asm: A.S
     3                                  org  256 
     4 00000000 E93A51                  jmp main
     5                                  
     6                                  ;-1 char Version1[]="A.COM V0.9.2";
     7                                  
     8 00000003 412E434F4D2056302E-     Version1 db "A.COM V0.9.2",0
     9 0000000C 392E3200           
    10                                  
    11                                  ;-2 #define LSTART        200//max global var
    12                                  
    13                                  
    14                                  ;-3 #define VARMAX        300//max global and local var
    15                                  
    16                                  
    17                                  ;-4 #define GNAMEMAX     4800// 16*VARMAX
    18                                  
    19                                  
    20                                  ;-5 #define FUNCMAX       300//max functions
    21                                  
    22                                  
    23                                  ;-6 #define FNAMEMAX     4800// 16*FUNCMAX
    24                                  
    25                                  
    26                                  ;-7 #define CALLMAX      2000//max call
    27                                  
    28                                  
    29                                  ;-8 #define IDLENMAX       15//max length of names
    30                                  
    31                                  
    32                                  ;-9 #define COLUMNMAX     128
    33                                  
    34                                  
    35                                  ;-10 #define _                // compare constants
    36                                  
    37                                  
    38                                  ;-11 #define T_NAME        256//the following defines for better clearity
    39                                  
    40                                  
    41                                  ;-12 #define T_CONST       257
    42                                  
    43                                  
    44                                  ;-13 #define T_STRING      258
    45                                  
    46                                  
    47                                  ;-14 #define T_INCLUDE     510
    48                                  
    49                                  
    50                                  ;-15 #define T_DEFINE      511
    51                                  
    52                                  
    53                                  ;-16 #define T_RETURN      512
    54                                  
    55                                  
    56                                  ;-17 #define T_IF          513
    57                                  
    58                                  
    59                                  ;-18 #define T_ELSE        514
    60                                  
    61                                  
    62                                  ;-19 #define T_WHILE       515
    63                                  
    64                                  
    65                                  ;-20 #define T_DO          516
    66                                  
    67                                  
    68                                  ;-21 #define T_INT         517
    69                                  
    70                                  
    71                                  ;-22 #define T_ASM         518
    72                                  
    73                                  
    74                                  ;-23 #define T_ASMBLOCK    519
    75                                  
    76                                  
    77                                  ;-24 #define T_EMIT        520
    78                                  
    79                                  
    80                                  ;-25 #define T_GOTO        521
    81                                  
    82                                  
    83                                  ;-26 #define T_VOID        529
    84                                  
    85                                  
    86                                  ;-27 #define T_CHAR        530
    87                                  
    88                                  
    89                                  ;-28 #define T_SIGNED      531
    90                                  
    91                                  
    92                                  ;-29 #define T_UNSIGNED    532
    93                                  
    94                                  
    95                                  ;-30 #define T_LONG        533
    96                                  
    97                                  
    98                                  ;-31 #define T_EQ          806
    99                                  
   100                                  
   101                                  ;-32 #define T_NE          807
   102                                  
   103                                  
   104                                  ;-33 #define T_GE          811
   105                                  
   106                                  
   107                                  ;-34 #define T_LE          824
   108                                  
   109                                  
   110                                  ;-35 #define T_PLUSPLUS   1219
   111                                  
   112                                  
   113                                  ;-36 #define T_MINUSMINUS 1225
   114                                  
   115                                  
   116                                  ;-37 #define T_PLUSASS    1230
   117                                  
   118                                  
   119                                  ;-38 #define T_MINUSASS   1231
   120                                  
   121                                  
   122                                  ;-39 #define T_MULASS     1232
   123                                  
   124                                  
   125                                  ;-40 #define T_DIVASS     1233
   126                                  
   127                                  
   128                                  ;-41 #define T_ANDASS     1234
   129                                  
   130                                  
   131                                  ;-42 #define T_ORASS      1235
   132                                  
   133                                  
   134                                  ;-43 #define T_LESSLESS   1240
   135                                  
   136                                  
   137                                  ;-44 #define T_GREATGREAT 1241
   138                                  
   139                                  
   140                                  ;-45 
   141                                  
   142                                  
   143                                  ;-46 unsigned int ORGDATAORIG=25000;//start of arrays      
   144                                  
   145 00000010 A861                    ORGDATAORIG dw 25000
   146                                  
   147                                  ;-47 unsigned int orgData;//actual max of array, must be less than stack
   148                                  
   149 00000012 0000                    orgData dw 0
   150                                  
   151                                  ;-48 #define COMAX        3000
   152                                  
   153                                  
   154                                  ;-49 char co[COMAX];//constant storage    
   155                                  
   156                                  section .bss
   157                                  absolute 25000
   158 000061A8 <res 00000BB8>          co resb 3000
   159                                  section .text
   160                                  
   161                                  ;-50 int maxco=0;      
   162                                  
   163 00000014 0000                    maxco dw 0
   164                                  
   165                                  ;-51 int maxco1=0;
   166                                  
   167 00000016 0000                    maxco1 dw 0
   168                                  
   169                                  ;-52 #define CMDLENMAX      67
   170                                  
   171                                  
   172                                  ;-53 char coname[CMDLENMAX];              
   173                                  
   174                                  section .bss
   175                                  absolute 28000
   176 00006D60 <res 00000043>          coname resb 67
   177                                  section .text
   178                                  
   179                                  ;-54 char symbol[COLUMNMAX];
   180                                  
   181                                  section .bss
   182                                  absolute 28067
   183 00006DA3 <res 00000080>          symbol resb 128
   184                                  section .text
   185                                  
   186                                  ;-55 char fname[CMDLENMAX];               
   187                                  
   188                                  section .bss
   189                                  absolute 28195
   190 00006E23 <res 00000043>          fname resb 67
   191                                  section .text
   192                                  
   193                                  ;-56 char namein[CMDLENMAX];
   194                                  
   195                                  section .bss
   196                                  absolute 28262
   197 00006E66 <res 00000043>          namein resb 67
   198                                  section .text
   199                                  
   200                                  ;-57 char namelst[CMDLENMAX];             
   201                                  
   202                                  section .bss
   203                                  absolute 28329
   204 00006EA9 <res 00000043>          namelst resb 67
   205                                  section .text
   206                                  
   207                                  ;-58 char archivename[CMDLENMAX];
   208                                  
   209                                  section .bss
   210                                  absolute 28396
   211 00006EEC <res 00000043>          archivename resb 67
   212                                  section .text
   213                                  
   214                                  ;-59 char *cloc=0;
   215                                  
   216 00000018 0000                    cloc dw 0
   217                                  
   218                                  ;-60 int fdin=0;        
   219                                  
   220 0000001A 0000                    fdin dw 0
   221                                  
   222                                  ;-61 int fdout=0;      
   223                                  
   224 0000001C 0000                    fdout dw 0
   225                                  
   226                                  ;-62 int token=0;       
   227                                  
   228 0000001E 0000                    token dw 0
   229                                  
   230                                  ;-63 char globC=0;     
   231                                  
   232 00000020 00                      globC db 0
   233                                  
   234                                  ;-64 int column=0;
   235                                  
   236 00000021 0000                    column dw 0
   237                                  
   238                                  ;-65 char thechar=0;   //reads one char forward
   239                                  
   240 00000023 00                      thechar db 0
   241                                  
   242                                  ;-66 int iscmp=0;      
   243                                  
   244 00000024 0000                    iscmp dw 0
   245                                  
   246                                  ;-67 int nconst=0;
   247                                  
   248 00000026 0000                    nconst dw 0
   249                                  
   250                                  ;-68 int nreturn=0;     
   251                                  
   252 00000028 0000                    nreturn dw 0
   253                                  
   254                                  ;-69 int nlabel=0;
   255                                  
   256 0000002A 0000                    nlabel dw 0
   257                                  
   258                                  ;-70 int GTop=1;        
   259                                  
   260 0000002C 0100                    GTop dw 1
   261                                  
   262                                  ;-71 int LTop=LSTART;
   263                                  
   264 0000002E C800                    LTop dw 200
   265                                  
   266                                  ;-72 unsigned int lexval=0;
   267                                  
   268 00000030 0000                    lexval dw 0
   269                                  
   270                                  ;-73 int typei;       char istype;  
   271                                  
   272 00000032 0000                    typei dw 0
   273 00000034 00                      istype db 0
   274                                  
   275                                  ;-74 int signi;       char issign;  
   276                                  
   277 00000035 0000                    signi dw 0
   278 00000037 00                      issign db 0
   279                                  
   280                                  ;-75 int widthi;      char iswidth; 
   281                                  
   282 00000038 0000                    widthi dw 0
   283 0000003A 00                      iswidth db 0
   284                                  
   285                                  ;-76 char GType [VARMAX]; // 0=V, 1=*, 2=&,#
   286                                  
   287                                  section .bss
   288                                  absolute 28463
   289 00006F2F <res 0000012C>          GType resb 300
   290                                  section .text
   291                                  
   292                                  ;-77 char GSign [VARMAX]; // 0=U, 1=S
   293                                  
   294                                  section .bss
   295                                  absolute 28763
   296 0000705B <res 0000012C>          GSign resb 300
   297                                  section .text
   298                                  
   299                                  ;-78 char GWidth[VARMAX]; // 0, 1, 2, 4             
   300                                  
   301                                  section .bss
   302                                  absolute 29063
   303 00007187 <res 0000012C>          GWidth resb 300
   304                                  section .text
   305                                  
   306                                  ;-79 int GAdr [VARMAX]; 
   307                                  
   308                                  section .bss
   309                                  absolute 29363
   310 000072B3 <res 00000258>          GAdr resw 300
   311                                  section .text
   312                                  
   313                                  ;-80 int GUsed[VARMAX];
   314                                  
   315                                  section .bss
   316                                  absolute 29963
   317 0000750B <res 00000258>          GUsed resw 300
   318                                  section .text
   319                                  
   320                                  ;-81 int GData[VARMAX];  
   321                                  
   322                                  section .bss
   323                                  absolute 30563
   324 00007763 <res 00000258>          GData resw 300
   325                                  section .text
   326                                  
   327                                  ;-82 char GNameField[GNAMEMAX];  
   328                                  
   329                                  section .bss
   330                                  absolute 31163
   331 000079BB <res 000012C0>          GNameField resb 4800
   332                                  section .text
   333                                  
   334                                  ;-83 int wi=0;   
   335                                  
   336 0000003B 0000                    wi dw 0
   337                                  
   338                                  ;-84 int  FTop=0;                 
   339                                  
   340 0000003D 0000                    FTop dw 0
   341                                  
   342                                  ;-85 int  CTop=0;
   343                                  
   344 0000003F 0000                    CTop dw 0
   345                                  
   346                                  ;-86 char FType [FUNCMAX];        
   347                                  
   348                                  section .bss
   349                                  absolute 35963
   350 00008C7B <res 0000012C>          FType resb 300
   351                                  section .text
   352                                  
   353                                  ;-87 char CType[CALLMAX];
   354                                  
   355                                  section .bss
   356                                  absolute 36263
   357 00008DA7 <res 000007D0>          CType resb 2000
   358                                  section .text
   359                                  
   360                                  ;-88 int  FAdr  [FUNCMAX];        
   361                                  
   362                                  section .bss
   363                                  absolute 38263
   364 00009577 <res 00000258>          FAdr resw 300
   365                                  section .text
   366                                  
   367                                  ;-89 int  CAdr [CALLMAX];
   368                                  
   369                                  section .bss
   370                                  absolute 38863
   371 000097CF <res 00000FA0>          CAdr resw 2000
   372                                  section .text
   373                                  
   374                                  ;-90 int  FCalls[FUNCMAX];
   375                                  
   376                                  section .bss
   377                                  absolute 42863
   378 0000A76F <res 00000258>          FCalls resw 300
   379                                  section .text
   380                                  
   381                                  ;-91 char FNameField[FNAMEMAX];   //char CNameField[CNAMEMAX];
   382                                  
   383                                  section .bss
   384                                  absolute 43463
   385 0000A9C7 <res 000012C0>          FNameField resb 4800
   386                                  section .text
   387                                  
   388                                  ;-92 char NameA[]="12345678901234567890123456789012"; //must be in low memory
   389                                  
   390 00000041 313233343536373839-     NameA db "12345678901234567890123456789012",0
   391 0000004A 303132333435363738-
   392 00000053 393031323334353637-
   393 0000005C 383930313200       
   394                                  
   395                                  ;-93 char fgetsdest[COLUMNMAX];         
   396                                  
   397                                  section .bss
   398                                  absolute 48263
   399 0000BC87 <res 00000080>          fgetsdest resb 128
   400                                  section .text
   401                                  
   402                                  ;-94 unsigned char *CNameTop=0;
   403                                  
   404 00000062 0000                    CNameTop dw 0
   405                                  
   406                                  ;-95 unsigned char *fgetsp=0;     
   407                                  
   408 00000064 0000                    fgetsp dw 0
   409                                  
   410                                  ;-96 unsigned int segE;
   411                                  
   412 00000066 0000                    segE dw 0
   413                                  
   414                                  ;-97 unsigned int lineno=1;       
   415                                  
   416 00000068 0100                    lineno dw 1
   417                                  
   418                                  ;-98 unsigned int linenoinclude=1;
   419                                  
   420 0000006A 0100                    linenoinclude dw 1
   421                                  
   422                                  ;-99 unsigned char *pt=0;         
   423                                  
   424 0000006C 0000                    pt dw 0
   425                                  
   426                                  ;-100 unsigned char *p1=0;
   427                                  
   428 0000006E 0000                    p1 dw 0
   429                                  
   430                                  ;-101 int DOS_ERR=0; 
   431                                  
   432 00000070 0000                    DOS_ERR dw 0
   433                                  
   434                                  ;-102 int DOS_NoBytes=0; 
   435                                  
   436 00000072 0000                    DOS_NoBytes dw 0
   437                                  
   438                                  ;-103 char DOS_ByteRead=0;
   439                                  
   440 00000074 00                      DOS_ByteRead db 0
   441                                  
   442                                  ;-104 
   443                                  
   444                                  
   445                                  ;-105 
   446                                  
   447                                  
   448                                  ;-106 int writetty()     { ah=0x0E; bx=0; __emit__(0xCD,0x10); }
   449                                  
   450                                  
   451                                  writetty: PROC
   452 00000075 B40E                     mov  ah, 14
   453 00000077 BB0000                   mov  bx, 0
   454 0000007A CD10                     db 205,16
   455                                  
   456                                  ;-107 int putch(char c)  {if (_ c==10) {al=13; writetty();} al=c; writetty(); }
   457                                  
   458 0000007C C3                       ret
   459                                  ENDP
   460                                  
   461                                  putch: PROC
   462                                  ;Function : putch, Number of local variables: 1
   463                                  ;   # type sign width addr used name   list of local variables
   464                                  ;  200 var sign byte   107 NULL c = bp+4;
   465 0000007D C8000000                 ENTER  0,0 ; constant expression
   466 00000081 807E040A                cmp byte[bp+4], 10
   467 00000085 0F850500                 jne .putch1
   468 00000089 B00D                     mov  al, 13
   469 0000008B E8E7FF                   call writetty
   470                                  .putch1:
   471 0000008E 8A4604                   mov  al, [bp+4]
   472 00000091 E8E1FF                   call writetty
   473                                  
   474                                  ;-108 int cputs(char *s) {char c;  while(*s) { c=*s; putch(c); s++; } }
   475 00000094 C9                       LEAVE
   476 00000095 C3                       ret
   477                                  ENDP
   478                                  
   479                                  cputs: PROC
   480                                  ;Function : cputs, Number of local variables: 2
   481                                  ;   # type sign width addr used name   list of local variables
   482                                  ;  200 ptr sign byte   108 NULL s = bp+4
   483                                  ;  201 var sign byte   108 NULL c = bp-2;
   484 00000096 C8020000                 ENTER  2,0
   485                                  .cputs2:
   486 0000009A 8B5E04                   mov bx, [bp+4]
   487 0000009D 8A07                     mov al, [bx]
   488 0000009F B400                     mov ah, 0
   489 000000A1 08C0                     or  al, al
   490 000000A3 0F841B00                 je .cputs3
   491 000000A7 8B5E04                   mov bx, [bp+4]
   492 000000AA 8A07                     mov al, [bx]
   493 000000AC B400                     mov ah, 0
   494 000000AE 8846FE                   mov [bp-2], al
   495 000000B1 8A46FE                   mov al, byte [bp-2]
   496 000000B4 B400                     mov ah, 0
   497 000000B6 50                       push ax
   498 000000B7 E8C3FF                   call putch
   499 000000BA 83C402                   add  sp, 2
   500 000000BD FF4604                   inc  word[bp+4]
   501 000000C0 EBD8                     jmp .cputs2
   502                                  .cputs3:
   503                                  
   504                                  ;-109 int mkneg(int n)   { n; __asm {neg ax} }
   505 000000C2 C9                       LEAVE
   506 000000C3 C3                       ret
   507                                  ENDP
   508                                  
   509                                  mkneg: PROC
   510                                  ;Function : mkneg, Number of local variables: 1
   511                                  ;   # type sign width addr used name   list of local variables
   512                                  ;  200 var sign word   109 NULL n = bp+4;
   513 000000C4 C8000000                 ENTER  0,0
   514 000000C8 8B4604                   mov ax, [bp+4]
   515 000000CB F7D8                    neg ax
   516                                  
   517                                  ;-110 
   518                                  
   519                                  
   520                                  ;-111 int DosInt() {
   521 000000CD C9                       LEAVE
   522 000000CE C3                       ret
   523                                  ENDP
   524                                  
   525                                  DosInt: PROC
   526                                  
   527                                  ;-112     __emit__(0xCD,0x21);//inth 0x21;
   528                                  
   529 000000CF CD21                     db 205,33
   530                                  
   531                                  ;-113     __emit__(0x73, 04); //ifcarry DOS_ERR++;
   532                                  
   533 000000D1 7304                     db 115,4
   534                                  
   535                                  ;-114     DOS_ERR++;
   536                                  
   537 000000D3 FF06[7000]               inc  word[DOS_ERR]
   538                                  
   539                                  ;-115 }
   540                                  
   541                                  
   542                                  ;-116 int openR (char *s) { dx=s;       ax=0x3D02; DosInt(); }
   543                                  
   544 000000D7 C3                       ret
   545                                  ENDP
   546                                  
   547                                  openR: PROC
   548                                  ;Function : openR, Number of local variables: 1
   549                                  ;   # type sign width addr used name   list of local variables
   550                                  ;  200 ptr sign byte   116 NULL s = bp+4;
   551 000000D8 C8000000                 ENTER  0,0
   552 000000DC 8B5604                   mov  dx, [bp+4]
   553 000000DF B8023D                   mov  ax, 15618
   554 000000E2 E8EAFF                   call DosInt
   555                                  
   556                                  ;-117 int creatR(char *s) { dx=s; cx=0; ax=0x3C00; DosInt(); }
   557 000000E5 C9                       LEAVE
   558 000000E6 C3                       ret
   559                                  ENDP
   560                                  
   561                                  creatR: PROC
   562                                  ;Function : creatR, Number of local variables: 1
   563                                  ;   # type sign width addr used name   list of local variables
   564                                  ;  200 ptr sign byte   117 NULL s = bp+4;
   565 000000E7 C8000000                 ENTER  0,0
   566 000000EB 8B5604                   mov  dx, [bp+4]
   567 000000EE B90000                   mov  cx, 0
   568 000000F1 B8003C                   mov  ax, 15360
   569 000000F4 E8D8FF                   call DosInt
   570                                  
   571                                  ;-118 int fcloseR(int fd) {bx=fd;       ax=0x3E00; DosInt(); }
   572 000000F7 C9                       LEAVE
   573 000000F8 C3                       ret
   574                                  ENDP
   575                                  
   576                                  fcloseR: PROC
   577                                  ;Function : fcloseR, Number of local variables: 1
   578                                  ;   # type sign width addr used name   list of local variables
   579                                  ;  200 var sign word   118 NULL fd = bp+4;
   580 000000F9 C8000000                 ENTER  0,0
   581 000000FD 8B5E04                   mov  bx, [bp+4]
   582 00000100 B8003E                   mov  ax, 15872
   583 00000103 E8C9FF                   call DosInt
   584                                  
   585                                  ;-119 int exitR  (char c) {ah=0x4C; al=c;          DosInt(); }
   586 00000106 C9                       LEAVE
   587 00000107 C3                       ret
   588                                  ENDP
   589                                  
   590                                  exitR: PROC
   591                                  ;Function : exitR, Number of local variables: 1
   592                                  ;   # type sign width addr used name   list of local variables
   593                                  ;  200 var sign byte   119 NULL c = bp+4;
   594 00000108 C8000000                 ENTER  0,0
   595 0000010C B44C                     mov  ah, 76
   596 0000010E 8A4604                   mov  al, [bp+4]
   597 00000111 E8BBFF                   call DosInt
   598                                  
   599                                  ;-120 int readRL(char *s, int fd, int len){
   600 00000114 C9                       LEAVE
   601 00000115 C3                       ret
   602                                  ENDP
   603                                  
   604                                  readRL: PROC
   605                                  
   606                                  ;-121     dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}
   607                                  
   608                                  ;Function : readRL, Number of local variables: 3
   609                                  ;   # type sign width addr used name   list of local variables
   610                                  ;  200 ptr sign byte   120 NULL s = bp+4
   611                                  ;  201 var sign word   120 NULL fd = bp+6
   612                                  ;  202 var sign word   120 NULL len = bp+8;
   613 00000116 C8000000                 ENTER  0,0
   614 0000011A 8B5604                   mov  dx, [bp+4]
   615 0000011D 8B4E08                   mov  cx, [bp+8]
   616 00000120 8B5E06                   mov  bx, [bp+6]
   617 00000123 B8003F                   mov  ax, 16128
   618 00000126 E8A6FF                   call DosInt
   619                                  
   620                                  ;-122 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
   621 00000129 C9                       LEAVE
   622 0000012A C3                       ret
   623                                  ENDP
   624                                  
   625                                  fputcR: PROC
   626                                  ;Function : fputcR, Number of local variables: 2
   627                                  ;   # type sign width addr used name   list of local variables
   628                                  ;  200 ptr sign byte   122 NULL n = bp+4
   629                                  ;  201 var sign word   122 NULL fd = bp+6;
   630 0000012B C8000000                 ENTER  0,0
   631 0000012F 8D5604                  lea dx, [bp+4]
   632                                  
   633                                  ;-123   cx=1; bx=fd; ax=0x4000; DosInt(); }
   634                                  
   635 00000132 B90100                   mov  cx, 1
   636 00000135 8B5E06                   mov  bx, [bp+6]
   637 00000138 B80040                   mov  ax, 16384
   638 0000013B E891FF                   call DosInt
   639                                  
   640                                  ;-124 
   641                                  
   642                                  
   643                                  ;-125 int strlen(char *s) { int c; c=0; while (*s!=0) {s++; c++;} return c; }
   644 0000013E C9                       LEAVE
   645 0000013F C3                       ret
   646                                  ENDP
   647                                  
   648                                  strlen: PROC
   649                                  ;Function : strlen, Number of local variables: 2
   650                                  ;   # type sign width addr used name   list of local variables
   651                                  ;  200 ptr sign byte   125 NULL s = bp+4
   652                                  ;  201 var sign word   125 NULL c = bp-2;
   653 00000140 C8020000                 ENTER  2,0
   654 00000144 B80000                   mov ax, 0
   655 00000147 8946FE                   mov [bp-2], ax
   656                                  .strlen4:
   657 0000014A 8B5E04                   mov bx, [bp+4]
   658 0000014D 8A07                     mov al, [bx]
   659 0000014F B400                     mov ah, 0
   660 00000151 83F800                   cmp ax, 0
   661 00000154 0F840800                 je  .strlen5
   662 00000158 FF4604                   inc  word[bp+4]
   663 0000015B FF46FE                   inc  word[bp-2]
   664 0000015E EBEA                     jmp .strlen4
   665                                  .strlen5:
   666 00000160 8B46FE                   mov ax, [bp-2]
   667 00000163 E90000                   jmp .retnstrlen
   668                                  
   669                                  ;-126 int strcpy(char *s, char *t) {do { *s=*t; s++; t++; } while (*t!=0); *s=0; }
   670                                  
   671 00000166 C9                       .retnstrlen: LEAVE
   672 00000167 C3                       ret
   673                                  ENDP
   674                                  
   675                                  strcpy: PROC
   676                                  ;Function : strcpy, Number of local variables: 2
   677                                  ;   # type sign width addr used name   list of local variables
   678                                  ;  200 ptr sign byte   126 NULL s = bp+4
   679                                  ;  201 ptr sign byte   126 NULL t = bp+6;
   680 00000168 C8000000                 ENTER  0,0
   681                                  .strcpy6:
   682 0000016C 8B5E06                   mov bx, [bp+6]
   683 0000016F 8A07                     mov al, [bx]
   684 00000171 B400                     mov ah, 0
   685 00000173 8B5E04                   mov  bx, [bp+4]
   686 00000176 8807                     mov  [bx], al
   687 00000178 FF4604                   inc  word[bp+4]
   688 0000017B FF4606                   inc  word[bp+6]
   689 0000017E 8B5E06                   mov bx, [bp+6]
   690 00000181 8A07                     mov al, [bx]
   691 00000183 B400                     mov ah, 0
   692 00000185 83F800                   cmp ax, 0
   693 00000188 0F840200                 je  .strcpy7
   694 0000018C EBDE                     jmp .strcpy6
   695                                  .strcpy7:
   696 0000018E B80000                   mov ax, 0
   697 00000191 8B5E04                   mov  bx, [bp+4]
   698 00000194 8807                     mov  [bx], al
   699                                  
   700                                  ;-127 int eqstr(char *p, char *q) { while(*p) {
   701 00000196 C9                       LEAVE
   702 00000197 C3                       ret
   703                                  ENDP
   704                                  
   705                                  eqstr: PROC
   706                                  ;Function : eqstr, Number of local variables: 2
   707                                  ;   # type sign width addr used name   list of local variables
   708                                  ;  200 ptr sign byte   127 NULL p = bp+4
   709                                  ;  201 ptr sign byte   127 NULL q = bp+6;
   710 00000198 C8000000                 ENTER  0,0
   711                                  .eqstr8:
   712 0000019C 8B5E04                   mov bx, [bp+4]
   713 0000019F 8A07                     mov al, [bx]
   714 000001A1 B400                     mov ah, 0
   715 000001A3 08C0                     or  al, al
   716 000001A5 0F842000                 je .eqstr9
   717                                  
   718                                  ;-128     if (*p != *q) return 0; p++; q++; }
   719                                  
   720 000001A9 8B5E04                   mov bx, [bp+4]
   721 000001AC 8A07                     mov al, [bx]
   722 000001AE B400                     mov ah, 0
   723 000001B0 8B5E06                   mov bx, [bp+6]
   724 000001B3 3A07                     cmp al, [bx]
   725 000001B5 B400                     mov ah, 0
   726 000001B7 0F840600                 je  .eqstr10
   727 000001BB B80000                   mov ax, 0
   728 000001BE E92100                   jmp .retneqstr
   729                                  .eqstr10:
   730 000001C1 FF4604                   inc  word[bp+4]
   731 000001C4 FF4606                   inc  word[bp+6]
   732                                  
   733                                  ;-129     if(*q) return 0; return 1; }
   734                                  
   735 000001C7 EBD3                     jmp .eqstr8
   736                                  .eqstr9:
   737 000001C9 8B5E06                   mov bx, [bp+6]
   738 000001CC 8A07                     mov al, [bx]
   739 000001CE B400                     mov ah, 0
   740 000001D0 08C0                     or  al, al
   741 000001D2 0F840600                 je .eqstr11
   742 000001D6 B80000                   mov ax, 0
   743 000001D9 E90600                   jmp .retneqstr
   744                                  .eqstr11:
   745 000001DC B80100                   mov ax, 1
   746 000001DF E90000                   jmp .retneqstr
   747                                  
   748                                  ;-130 int instr1(char *s, char c) { while(*s) {if (*s==c) return 1; s++;}return 0;}
   749                                  
   750 000001E2 C9                       .retneqstr: LEAVE
   751 000001E3 C3                       ret
   752                                  ENDP
   753                                  
   754                                  instr1: PROC
   755                                  ;Function : instr1, Number of local variables: 2
   756                                  ;   # type sign width addr used name   list of local variables
   757                                  ;  200 ptr sign byte   130 NULL s = bp+4
   758                                  ;  201 var sign byte   130 NULL c = bp+6;
   759 000001E4 C8000000                 ENTER  0,0
   760                                  .instr112:
   761 000001E8 8B5E04                   mov bx, [bp+4]
   762 000001EB 8A07                     mov al, [bx]
   763 000001ED B400                     mov ah, 0
   764 000001EF 08C0                     or  al, al
   765 000001F1 0F841900                 je .instr113
   766 000001F5 8B5E04                   mov bx, [bp+4]
   767 000001F8 8A07                     mov al, [bx]
   768 000001FA B400                     mov ah, 0
   769 000001FC 3A4606                   cmp al, [bp+6]
   770 000001FF 0F850600                 jne .instr114
   771 00000203 B80100                   mov ax, 1
   772 00000206 E90B00                   jmp .retninstr1
   773                                  .instr114:
   774 00000209 FF4604                   inc  word[bp+4]
   775 0000020C EBDA                     jmp .instr112
   776                                  .instr113:
   777 0000020E B80000                   mov ax, 0
   778 00000211 E90000                   jmp .retninstr1
   779                                  
   780                                  ;-131 int strcat1(char *s, char *t) { while (*s != 0) s++; strcpy(s, t);  }
   781                                  
   782 00000214 C9                       .retninstr1: LEAVE
   783 00000215 C3                       ret
   784                                  ENDP
   785                                  
   786                                  strcat1: PROC
   787                                  ;Function : strcat1, Number of local variables: 2
   788                                  ;   # type sign width addr used name   list of local variables
   789                                  ;  200 ptr sign byte   131 NULL s = bp+4
   790                                  ;  201 ptr sign byte   131 NULL t = bp+6;
   791 00000216 C8000000                 ENTER  0,0
   792                                  .strcat115:
   793 0000021A 8B5E04                   mov bx, [bp+4]
   794 0000021D 8A07                     mov al, [bx]
   795 0000021F B400                     mov ah, 0
   796 00000221 83F800                   cmp ax, 0
   797 00000224 0F840500                 je  .strcat116
   798 00000228 FF4604                   inc  word[bp+4]
   799 0000022B EBED                     jmp .strcat115
   800                                  .strcat116:
   801 0000022D FF7606                   push word [bp+6]
   802 00000230 FF7604                   push word [bp+4]
   803 00000233 E832FF                   call strcpy
   804 00000236 83C404                   add  sp, 4
   805                                  
   806                                  ;-132 int toupper(char *s) {
   807 00000239 C9                       LEAVE
   808 0000023A C3                       ret
   809                                  ENDP
   810                                  
   811                                  toupper: PROC
   812                                  
   813                                  ;-133     while(*s) {if (*s >= 'a') if (*s <= 'z') *s=*s-32; s++;}}
   814                                  
   815                                  ;Function : toupper, Number of local variables: 1
   816                                  ;   # type sign width addr used name   list of local variables
   817                                  ;  200 ptr sign byte   132 NULL s = bp+4;
   818 0000023B C8000000                 ENTER  0,0
   819                                  .toupper17:
   820 0000023F 8B5E04                   mov bx, [bp+4]
   821 00000242 8A07                     mov al, [bx]
   822 00000244 B400                     mov ah, 0
   823 00000246 08C0                     or  al, al
   824 00000248 0F843000                 je .toupper18
   825 0000024C 8B5E04                   mov bx, [bp+4]
   826 0000024F 8A07                     mov al, [bx]
   827 00000251 B400                     mov ah, 0
   828 00000253 83F861                   cmp ax, 97 ;unsigned : 1
   829 00000256 0F8C1D00                 jl  .toupper19
   830 0000025A 8B5E04                   mov bx, [bp+4]
   831 0000025D 8A07                     mov al, [bx]
   832 0000025F B400                     mov ah, 0
   833 00000261 83F87A                   cmp ax, 122
   834 00000264 0F8F0F00                 jg  .toupper20
   835 00000268 8B5E04                   mov bx, [bp+4]
   836 0000026B 8A07                     mov al, [bx]
   837 0000026D B400                     mov ah, 0
   838 0000026F 83E820                   sub ax, 32
   839 00000272 8B5E04                   mov  bx, [bp+4]
   840 00000275 8807                     mov  [bx], al
   841                                  .toupper20:
   842                                  .toupper19:
   843 00000277 FF4604                   inc  word[bp+4]
   844 0000027A EBC3                     jmp .toupper17
   845                                  .toupper18:
   846                                  
   847                                  ;-134 
   848                                  
   849                                  
   850                                  ;-135 int digit(char c){
   851 0000027C C9                       LEAVE
   852 0000027D C3                       ret
   853                                  ENDP
   854                                  
   855                                  digit: PROC
   856                                  
   857                                  ;-136     if(c<'0') return 0;
   858                                  
   859                                  ;Function : digit, Number of local variables: 1
   860                                  ;   # type sign width addr used name   list of local variables
   861                                  ;  200 var sign byte   135 NULL c = bp+4;
   862 0000027E C8000000                 ENTER  0,0
   863 00000282 8A4604                   mov al, [bp+4]
   864 00000285 3C30                     cmp al, 48
   865 00000287 0F8D0600                 jge .digit21
   866 0000028B B80000                   mov ax, 0
   867 0000028E E91500                   jmp .retndigit
   868                                  
   869                                  ;-137     if(c>'9') return 0;
   870                                  
   871                                  .digit21:
   872 00000291 8A4604                   mov al, [bp+4]
   873 00000294 3C39                     cmp al, 57
   874 00000296 0F8E0600                 jle .digit22
   875 0000029A B80000                   mov ax, 0
   876 0000029D E90600                   jmp .retndigit
   877                                  
   878                                  ;-138     return 1;
   879                                  
   880                                  .digit22:
   881 000002A0 B80100                   mov ax, 1
   882 000002A3 E90000                   jmp .retndigit
   883                                  
   884                                  ;-139 }
   885                                  
   886                                  
   887                                  ;-140 int letter(char c) {
   888                                  
   889 000002A6 C9                       .retndigit: LEAVE
   890 000002A7 C3                       ret
   891                                  ENDP
   892                                  
   893                                  letter: PROC
   894                                  
   895                                  ;-141     if (c=='_') return 1;
   896                                  
   897                                  ;Function : letter, Number of local variables: 1
   898                                  ;   # type sign width addr used name   list of local variables
   899                                  ;  200 var sign byte   140 NULL c = bp+4;
   900 000002A8 C8000000                 ENTER  0,0
   901 000002AC 8A4604                   mov al, [bp+4]
   902 000002AF 3C5F                     cmp al, 95
   903 000002B1 0F850600                 jne .letter23
   904 000002B5 B80100                   mov ax, 1
   905 000002B8 E96900                   jmp .retnletter
   906                                  
   907                                  ;-142     if (c=='.') return 1;
   908                                  
   909                                  .letter23:
   910 000002BB 8A4604                   mov al, [bp+4]
   911 000002BE 3C2E                     cmp al, 46
   912 000002C0 0F850600                 jne .letter24
   913 000002C4 B80100                   mov ax, 1
   914 000002C7 E95A00                   jmp .retnletter
   915                                  
   916                                  ;-143     if (c=='?') return 1;
   917                                  
   918                                  .letter24:
   919 000002CA 8A4604                   mov al, [bp+4]
   920 000002CD 3C3F                     cmp al, 63
   921 000002CF 0F850600                 jne .letter25
   922 000002D3 B80100                   mov ax, 1
   923 000002D6 E94B00                   jmp .retnletter
   924                                  
   925                                  ;-144     if (c=='$') return 1;
   926                                  
   927                                  .letter25:
   928 000002D9 8A4604                   mov al, [bp+4]
   929 000002DC 3C24                     cmp al, 36
   930 000002DE 0F850600                 jne .letter26
   931 000002E2 B80100                   mov ax, 1
   932 000002E5 E93C00                   jmp .retnletter
   933                                  
   934                                  ;-145     if (c> 'z') return 0;
   935                                  
   936                                  .letter26:
   937 000002E8 8A4604                   mov al, [bp+4]
   938 000002EB 3C7A                     cmp al, 122
   939 000002ED 0F8E0600                 jle .letter27
   940 000002F1 B80000                   mov ax, 0
   941 000002F4 E92D00                   jmp .retnletter
   942                                  
   943                                  ;-146     if (c< '@') return 0;// at included
   944                                  
   945                                  .letter27:
   946 000002F7 8A4604                   mov al, [bp+4]
   947 000002FA 3C40                     cmp al, 64
   948 000002FC 0F8D0600                 jge .letter28
   949 00000300 B80000                   mov ax, 0
   950 00000303 E91E00                   jmp .retnletter
   951                                  
   952                                  ;-147     if (c> 'Z') { if (c< 'a') return 0; }
   953                                  
   954                                  .letter28:
   955 00000306 8A4604                   mov al, [bp+4]
   956 00000309 3C5A                     cmp al, 90
   957 0000030B 0F8E0F00                 jle .letter29
   958 0000030F 8A4604                   mov al, [bp+4]
   959 00000312 3C61                     cmp al, 97
   960 00000314 0F8D0600                 jge .letter30
   961 00000318 B80000                   mov ax, 0
   962 0000031B E90600                   jmp .retnletter
   963                                  .letter30:
   964                                  
   965                                  ;-148     return 1;
   966                                  
   967                                  .letter29:
   968 0000031E B80100                   mov ax, 1
   969 00000321 E90000                   jmp .retnletter
   970                                  
   971                                  ;-149 }
   972                                  
   973                                  
   974                                  ;-150 int alnum(char c) {
   975                                  
   976 00000324 C9                       .retnletter: LEAVE
   977 00000325 C3                       ret
   978                                  ENDP
   979                                  
   980                                  alnum: PROC
   981                                  
   982                                  ;-151   if (digit (c)) return 1;
   983                                  
   984                                  ;Function : alnum, Number of local variables: 1
   985                                  ;   # type sign width addr used name   list of local variables
   986                                  ;  200 var sign byte   150 NULL c = bp+4;
   987 00000326 C8000000                 ENTER  0,0
   988 0000032A 8A4604                   mov al, byte [bp+4]
   989 0000032D B400                     mov ah, 0
   990 0000032F 50                       push ax
   991 00000330 E84BFF                   call digit
   992 00000333 83C402                   add  sp, 2
   993 00000336 08C0                     or  al, al
   994 00000338 0F840600                 je .alnum31
   995 0000033C B80100                   mov ax, 1
   996 0000033F E91E00                   jmp .retnalnum
   997                                  
   998                                  ;-152   if (letter(c)) return 1;
   999                                  
  1000                                  .alnum31:
  1001 00000342 8A4604                   mov al, byte [bp+4]
  1002 00000345 B400                     mov ah, 0
  1003 00000347 50                       push ax
  1004 00000348 E85DFF                   call letter
  1005 0000034B 83C402                   add  sp, 2
  1006 0000034E 08C0                     or  al, al
  1007 00000350 0F840600                 je .alnum32
  1008 00000354 B80100                   mov ax, 1
  1009 00000357 E90600                   jmp .retnalnum
  1010                                  
  1011                                  ;-153   return 0;
  1012                                  
  1013                                  .alnum32:
  1014 0000035A B80000                   mov ax, 0
  1015 0000035D E90000                   jmp .retnalnum
  1016                                  
  1017                                  ;-154 }
  1018                                  
  1019                                  
  1020                                  ;-155 int a(unsigned int i) {  printName(i);}//address
  1021                                  
  1022 00000360 C9                       .retnalnum: LEAVE
  1023 00000361 C3                       ret
  1024                                  ENDP
  1025                                  
  1026                                  a: PROC
  1027                                  ;Function : a, Number of local variables: 1
  1028                                  ;   # type sign width addr used name   list of local variables
  1029                                  ;  200 var unsg word   155 NULL i = bp+4;
  1030 00000362 C8000000                 ENTER  0,0
  1031 00000366 FF7604                   push word [bp+4]
  1032 00000369 E88D05                   call printName
  1033 0000036C 83C402                   add  sp, 2
  1034                                  
  1035                                  ;-156 int v(unsigned int i) {//value
  1036 0000036F C9                       LEAVE
  1037 00000370 C3                       ret
  1038                                  ENDP
  1039                                  
  1040                                  v: PROC
  1041                                  
  1042                                  ;-157     if (i < LSTART) prc('[');
  1043                                  
  1044                                  ;Function : v, Number of local variables: 1
  1045                                  ;   # type sign width addr used name   list of local variables
  1046                                  ;  200 var unsg word   156 NULL i = bp+4;
  1047 00000371 C8000000                 ENTER  0,0
  1048 00000375 8B4604                   mov ax, [bp+4]
  1049 00000378 3DC800                   cmp ax, 200
  1050 0000037B 0F8D0800                 jge .v33
  1051 0000037F 6A5B                     push 91
  1052 00000381 E8723C                   call prc
  1053 00000384 83C402                   add  sp, 2
  1054                                  
  1055                                  ;-158     printName(i);
  1056                                  
  1057                                  .v33:
  1058 00000387 FF7604                   push word [bp+4]
  1059 0000038A E86C05                   call printName
  1060 0000038D 83C402                   add  sp, 2
  1061                                  
  1062                                  ;-159     if (i < LSTART) prc(']');
  1063                                  
  1064 00000390 8B4604                   mov ax, [bp+4]
  1065 00000393 3DC800                   cmp ax, 200
  1066 00000396 0F8D0800                 jge .v34
  1067 0000039A 6A5D                     push 93
  1068 0000039C E8573C                   call prc
  1069 0000039F 83C402                   add  sp, 2
  1070                                  
  1071                                  ;-160 }
  1072                                  
  1073                                  .v34:
  1074                                  
  1075                                  ;-161 int checknamelen() { int i;    i=strlen(symbol);
  1076 000003A2 C9                       LEAVE
  1077 000003A3 C3                       ret
  1078                                  ENDP
  1079                                  
  1080                                  checknamelen: PROC
  1081                                  ;Function : checknamelen, Number of local variables: 1
  1082                                  ;   # type sign width addr used name   list of local variables
  1083                                  ;  200 var sign word   161 NULL i = bp-2;
  1084 000003A4 C8020000                 ENTER  2,0
  1085 000003A8 8D06A36D                 lea  ax, [symbol]
  1086 000003AC 50                       push ax
  1087 000003AD E890FD                   call strlen
  1088 000003B0 83C402                   add  sp, 2
  1089 000003B3 8946FE                   mov [bp-2], ax
  1090                                  
  1091                                  ;-162   if (i > IDLENMAX) error1("Item name is too long in characters)");
  1092                                  
  1093 000003B6 8B46FE                   mov ax, [bp-2]
  1094 000003B9 83F80F                   cmp ax, 15
  1095 000003BC 0F8E0900                 jle .checknamelen35
  1096 000003C0 68[CB03]                 push checknamelen_0
  1097 000003C3 E8F63F                   call error1
  1098 000003C6 83C402                   add  sp, 2
  1099                                  
  1100                                  ;-163 }
  1101                                  
  1102                                  .checknamelen35:
  1103                                  
  1104                                  ;-164 char doglobName[IDLENMAX];
  1105 000003C9 C9                       LEAVE
  1106 000003CA C3                       ret
  1107 000003CB 4974656D206E616D65-     checknamelen_0 db "Item name is too long in characters)",0
  1108 000003D4 20697320746F6F206C-
  1109 000003DD 6F6E6720696E206368-
  1110 000003E6 617261637465727329-
  1111 000003EF 00                 
  1112                                  ENDP
  1113                                  section .bss
  1114                                  absolute 48391
  1115 0000BD07 <res 0000000F>          doglobName resb 15
  1116                                  section .text
  1117                                  
  1118                                  ;-165 int doglob() { int i; int j; int isstrarr; isstrarr=0;
  1119                                  
  1120                                  
  1121                                  doglob: PROC
  1122                                  ;Function : doglob, Number of local variables: 3
  1123                                  ;   # type sign width addr used name   list of local variables
  1124                                  ;  200 var sign word   165 NULL i = bp-2
  1125                                  ;  201 var sign word   165 NULL j = bp-4
  1126                                  ;  202 var sign word   165 NULL isstrarr = bp-6;
  1127 000003F0 C8060000                 ENTER  6,0
  1128 000003F4 B80000                   mov ax, 0
  1129 000003F7 8946FA                   mov [bp-6], ax
  1130                                  
  1131                                  ;-166   if (GTop >= LSTART) error1("Global table full");
  1132                                  
  1133 000003FA A1[2C00]                 mov ax, [GTop]
  1134 000003FD 3DC800                   cmp ax, 200 ;unsigned : 1
  1135 00000400 0F8C0900                 jl  .doglob36
  1136 00000404 68[4507]                 push doglob_0
  1137 00000407 E8B23F                   call error1
  1138 0000040A 83C402                   add  sp, 2
  1139                                  
  1140                                  ;-167   if (iswidth == 0) error1("no VOID as var type");
  1141                                  
  1142                                  .doglob36:
  1143 0000040D A0[3A00]                 mov al, [iswidth]
  1144 00000410 3C00                     cmp al, 0
  1145 00000412 0F850900                 jne .doglob37
  1146 00000416 68[5707]                 push doglob_1
  1147 00000419 E8A03F                   call error1
  1148 0000041C 83C402                   add  sp, 2
  1149                                  
  1150                                  ;-168   checknamelen();
  1151                                  
  1152                                  .doglob37:
  1153 0000041F E882FF                   call checknamelen
  1154                                  
  1155                                  ;-169   if (checkName() != 0) error1("Variable already defined");
  1156                                  
  1157 00000422 E88305                   call checkName
  1158 00000425 3C00                     cmp al, 0
  1159 00000427 0F840900                 je  .doglob38
  1160 0000042B 68[6B07]                 push doglob_2
  1161 0000042E E88B3F                   call error1
  1162 00000431 83C402                   add  sp, 2
  1163                                  
  1164                                  ;-170   if (istoken('[')) { istype='&';
  1165                                  
  1166                                  .doglob38:
  1167 00000434 6A5B                     push 91
  1168 00000436 E8EF3A                   call istoken
  1169 00000439 83C402                   add  sp, 2
  1170 0000043C 08C0                     or  al, al
  1171 0000043E 0F84E201                 je .doglob39
  1172 00000442 B82600                   mov ax, 38
  1173 00000445 A2[3400]                 mov byte [istype], al
  1174                                  
  1175                                  ;-171     if (istoken(T_CONST)) {
  1176                                  
  1177 00000448 680101                   push 257
  1178 0000044B E8DA3A                   call istoken
  1179 0000044E 83C402                   add  sp, 2
  1180 00000451 08C0                     or  al, al
  1181 00000453 0F84C200                 je .doglob40
  1182                                  
  1183                                  ;-172       prs("\nsection .bss\nabsolute ");
  1184                                  
  1185 00000457 68[8407]                 push doglob_3
  1186 0000045A E8003C                   call prs
  1187 0000045D 83C402                   add  sp, 2
  1188                                  
  1189                                  ;-173       prunsign1(orgData);
  1190                                  
  1191 00000460 FF36[1200]               push word [orgData]
  1192 00000464 E84B3D                   call prunsign1
  1193 00000467 83C402                   add  sp, 2
  1194                                  
  1195                                  ;-174       prs("\n"); prs(symbol);
  1196                                  
  1197 0000046A 68[9E07]                 push doglob_4
  1198 0000046D E8ED3B                   call prs
  1199 00000470 83C402                   add  sp, 2
  1200 00000473 8D06A36D                 lea  ax, [symbol]
  1201 00000477 50                       push ax
  1202 00000478 E8E23B                   call prs
  1203 0000047B 83C402                   add  sp, 2
  1204                                  
  1205                                  ;-175       if (iswidth==1) prs(" resb ");
  1206                                  
  1207 0000047E A0[3A00]                 mov al, [iswidth]
  1208 00000481 3C01                     cmp al, 1
  1209 00000483 0F850900                 jne .doglob41
  1210 00000487 68[A107]                 push doglob_5
  1211 0000048A E8D03B                   call prs
  1212 0000048D 83C402                   add  sp, 2
  1213                                  
  1214                                  ;-176       if (iswidth==2) prs(" resw ");
  1215                                  
  1216                                  .doglob41:
  1217 00000490 A0[3A00]                 mov al, [iswidth]
  1218 00000493 3C02                     cmp al, 2
  1219 00000495 0F850900                 jne .doglob42
  1220 00000499 68[A807]                 push doglob_6
  1221 0000049C E8BE3B                   call prs
  1222 0000049F 83C402                   add  sp, 2
  1223                                  
  1224                                  ;-177       if (iswidth==4) prs(" resd ");
  1225                                  
  1226                                  .doglob42:
  1227 000004A2 A0[3A00]                 mov al, [iswidth]
  1228 000004A5 3C04                     cmp al, 4
  1229 000004A7 0F850900                 jne .doglob43
  1230 000004AB 68[AF07]                 push doglob_7
  1231 000004AE E8AC3B                   call prs
  1232 000004B1 83C402                   add  sp, 2
  1233                                  
  1234                                  ;-178       prunsign1(lexval);
  1235                                  
  1236                                  .doglob43:
  1237 000004B4 FF36[3000]               push word [lexval]
  1238 000004B8 E8F73C                   call prunsign1
  1239 000004BB 83C402                   add  sp, 2
  1240                                  
  1241                                  ;-179       prs("\nsection .text");
  1242                                  
  1243 000004BE 68[B607]                 push doglob_8
  1244 000004C1 E8993B                   call prs
  1245 000004C4 83C402                   add  sp, 2
  1246                                  
  1247                                  ;-180       orgData=orgData+lexval;
  1248                                  
  1249 000004C7 A1[1200]                 mov ax, [orgData]
  1250 000004CA 0306[3000]               add ax, [lexval]
  1251 000004CE A3[1200]                 mov word [orgData], ax
  1252                                  
  1253                                  ;-181       if (iswidth==2) orgData=orgData+lexval;
  1254                                  
  1255 000004D1 A0[3A00]                 mov al, [iswidth]
  1256 000004D4 3C02                     cmp al, 2
  1257 000004D6 0F850A00                 jne .doglob44
  1258 000004DA A1[1200]                 mov ax, [orgData]
  1259 000004DD 0306[3000]               add ax, [lexval]
  1260 000004E1 A3[1200]                 mov word [orgData], ax
  1261                                  
  1262                                  ;-182       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}
  1263                                  
  1264                                  .doglob44:
  1265 000004E4 A0[3A00]                 mov al, [iswidth]
  1266 000004E7 3C04                     cmp al, 4
  1267 000004E9 0F851400                 jne .doglob45
  1268 000004ED A1[3000]                 mov ax, [lexval]
  1269 000004F0 BB0300                   mov bx, 3
  1270 000004F3 F7E3                     mul bx
  1271 000004F5 8946FE                   mov [bp-2], ax
  1272 000004F8 A1[1200]                 mov ax, [orgData]
  1273 000004FB 0346FE                   add ax, [bp-2]
  1274 000004FE A3[1200]                 mov word [orgData], ax
  1275                                  
  1276                                  ;-183       GData[GTop]=lexval; expect(']');
  1277                                  
  1278                                  .doglob45:
  1279 00000501 A1[3000]                 mov ax, [lexval]
  1280 00000504 8B1E[2C00]               mov bx, [GTop]
  1281 00000508 D1E3                     shl bx, 1
  1282 0000050A 89876377                 mov [GData+bx], ax
  1283 0000050E 6A5D                     push 93
  1284 00000510 E8373A                   call expect
  1285 00000513 83C402                   add  sp, 2
  1286                                  
  1287                                  ;-184     }else { expect(']');
  1288                                  
  1289 00000516 E90801                   jmp .doglob46
  1290                                  .doglob40:
  1291 00000519 6A5D                     push 93
  1292 0000051B E82C3A                   call expect
  1293 0000051E 83C402                   add  sp, 2
  1294                                  
  1295                                  ;-185       if (iswidth != 1) error1("Only ByteArray allowed");
  1296                                  
  1297 00000521 A0[3A00]                 mov al, [iswidth]
  1298 00000524 3C01                     cmp al, 1
  1299 00000526 0F840900                 je  .doglob47
  1300 0000052A 68[C607]                 push doglob_9
  1301 0000052D E88C3E                   call error1
  1302 00000530 83C402                   add  sp, 2
  1303                                  
  1304                                  ;-186       prs("\n"); prs(symbol); prs(" db ");
  1305                                  
  1306                                  .doglob47:
  1307 00000533 68[DD07]                 push doglob_10
  1308 00000536 E8243B                   call prs
  1309 00000539 83C402                   add  sp, 2
  1310 0000053C 8D06A36D                 lea  ax, [symbol]
  1311 00000540 50                       push ax
  1312 00000541 E8193B                   call prs
  1313 00000544 83C402                   add  sp, 2
  1314 00000547 68[E007]                 push doglob_11
  1315 0000054A E8103B                   call prs
  1316 0000054D 83C402                   add  sp, 2
  1317                                  
  1318                                  ;-187       isstrarr=1; strcpy(doglobName, symbol);
  1319                                  
  1320 00000550 B80100                   mov ax, 1
  1321 00000553 8946FA                   mov [bp-6], ax
  1322 00000556 8D06A36D                 lea  ax, [symbol]
  1323 0000055A 50                       push ax
  1324 0000055B 8D0607BD                 lea  ax, [doglobName]
  1325 0000055F 50                       push ax
  1326 00000560 E805FC                   call strcpy
  1327 00000563 83C404                   add  sp, 4
  1328                                  
  1329                                  ;-188       expect('=');
  1330                                  
  1331 00000566 6A3D                     push 61
  1332 00000568 E8DF39                   call expect
  1333 0000056B 83C402                   add  sp, 2
  1334                                  
  1335                                  ;-189       if (istoken(T_STRING)) {
  1336                                  
  1337 0000056E 680201                   push 258
  1338 00000571 E8B439                   call istoken
  1339 00000574 83C402                   add  sp, 2
  1340 00000577 08C0                     or  al, al
  1341 00000579 0F844200                 je .doglob48
  1342                                  
  1343                                  ;-190         prc(34); prscomment(symbol); prc(34); prs(",0");
  1344                                  
  1345 0000057D 6A22                     push 34
  1346 0000057F E8743A                   call prc
  1347 00000582 83C402                   add  sp, 2
  1348 00000585 8D06A36D                 lea  ax, [symbol]
  1349 00000589 50                       push ax
  1350 0000058A E8943A                   call prscomment
  1351 0000058D 83C402                   add  sp, 2
  1352 00000590 6A22                     push 34
  1353 00000592 E8613A                   call prc
  1354 00000595 83C402                   add  sp, 2
  1355 00000598 68[E507]                 push doglob_12
  1356 0000059B E8BF3A                   call prs
  1357 0000059E 83C402                   add  sp, 2
  1358                                  
  1359                                  ;-191         i=strlen(symbol); GData[GTop]=i; }
  1360                                  
  1361 000005A1 8D06A36D                 lea  ax, [symbol]
  1362 000005A5 50                       push ax
  1363 000005A6 E897FB                   call strlen
  1364 000005A9 83C402                   add  sp, 2
  1365 000005AC 8946FE                   mov [bp-2], ax
  1366 000005AF 8B46FE                   mov ax, [bp-2]
  1367 000005B2 8B1E[2C00]               mov bx, [GTop]
  1368 000005B6 D1E3                     shl bx, 1
  1369 000005B8 89876377                 mov [GData+bx], ax
  1370                                  
  1371                                  ;-192       else if (istoken('{' )) { i=0;
  1372                                  
  1373 000005BC E96200                   jmp .doglob49
  1374                                  .doglob48:
  1375 000005BF 6A7B                     push 123
  1376 000005C1 E86439                   call istoken
  1377 000005C4 83C402                   add  sp, 2
  1378 000005C7 08C0                     or  al, al
  1379 000005C9 0F844B00                 je .doglob50
  1380 000005CD B80000                   mov ax, 0
  1381 000005D0 8946FE                   mov [bp-2], ax
  1382                                  
  1383                                  ;-193         do { if(i) prc(',');
  1384                                  
  1385                                  .doglob51:
  1386 000005D3 8B46FE                   mov ax, [bp-2]
  1387 000005D6 08C0                     or  al, al
  1388 000005D8 0F840800                 je .doglob52
  1389 000005DC 6A2C                     push 44
  1390 000005DE E8153A                   call prc
  1391 000005E1 83C402                   add  sp, 2
  1392                                  
  1393                                  ;-194           expect(T_CONST); prunsign1(lexval); i=1; }
  1394                                  
  1395                                  .doglob52:
  1396 000005E4 680101                   push 257
  1397 000005E7 E86039                   call expect
  1398 000005EA 83C402                   add  sp, 2
  1399 000005ED FF36[3000]               push word [lexval]
  1400 000005F1 E8BE3B                   call prunsign1
  1401 000005F4 83C402                   add  sp, 2
  1402 000005F7 B80100                   mov ax, 1
  1403 000005FA 8946FE                   mov [bp-2], ax
  1404                                  
  1405                                  ;-195         while (istoken(',')); expect('}'); }
  1406                                  
  1407 000005FD 6A2C                     push 44
  1408 000005FF E82639                   call istoken
  1409 00000602 83C402                   add  sp, 2
  1410 00000605 08C0                     or  al, al
  1411 00000607 0F840200                 je .doglob53
  1412 0000060B EBC6                     jmp .doglob51
  1413                                  .doglob53:
  1414 0000060D 6A7D                     push 125
  1415 0000060F E83839                   call expect
  1416 00000612 83C402                   add  sp, 2
  1417                                  
  1418                                  ;-196       else error1("String or number array expected");
  1419                                  
  1420 00000615 E90900                   jmp .doglob54
  1421                                  .doglob50:
  1422 00000618 68[E807]                 push doglob_13
  1423 0000061B E89E3D                   call error1
  1424 0000061E 83C402                   add  sp, 2
  1425                                  
  1426                                  ;-197       };
  1427                                  
  1428                                  .doglob54:
  1429                                  .doglob49:
  1430                                  .doglob46:
  1431                                  
  1432                                  ;-198   }else { //expect('=');
  1433                                  
  1434 00000621 E99E00                   jmp .doglob55
  1435                                  .doglob39:
  1436                                  
  1437                                  ;-199     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");
  1438                                  
  1439 00000624 68[0808]                 push doglob_14
  1440 00000627 E8333A                   call prs
  1441 0000062A 83C402                   add  sp, 2
  1442 0000062D 8D06A36D                 lea  ax, [symbol]
  1443 00000631 50                       push ax
  1444 00000632 E8283A                   call prs
  1445 00000635 83C402                   add  sp, 2
  1446 00000638 A0[3400]                 mov al, [istype]
  1447 0000063B 3C2A                     cmp al, 42
  1448 0000063D 0F850C00                 jne .doglob56
  1449 00000641 68[0B08]                 push doglob_15
  1450 00000644 E8163A                   call prs
  1451 00000647 83C402                   add  sp, 2
  1452                                  
  1453                                  ;-200     else {
  1454                                  
  1455 0000064A E93300                   jmp .doglob57
  1456                                  .doglob56:
  1457                                  
  1458                                  ;-201       if      (iswidth==1) prs(" db ");
  1459                                  
  1460 0000064D A0[3A00]                 mov al, [iswidth]
  1461 00000650 3C01                     cmp al, 1
  1462 00000652 0F850C00                 jne .doglob58
  1463 00000656 68[1008]                 push doglob_16
  1464 00000659 E8013A                   call prs
  1465 0000065C 83C402                   add  sp, 2
  1466                                  
  1467                                  ;-202       else if (iswidth==2) prs(" dw ");
  1468                                  
  1469 0000065F E91E00                   jmp .doglob59
  1470                                  .doglob58:
  1471 00000662 A0[3A00]                 mov al, [iswidth]
  1472 00000665 3C02                     cmp al, 2
  1473 00000667 0F850C00                 jne .doglob60
  1474 0000066B 68[1508]                 push doglob_17
  1475 0000066E E8EC39                   call prs
  1476 00000671 83C402                   add  sp, 2
  1477                                  
  1478                                  ;-203       else                 prs(" dd ");
  1479                                  
  1480 00000674 E90900                   jmp .doglob61
  1481                                  .doglob60:
  1482 00000677 68[1A08]                 push doglob_18
  1483 0000067A E8E039                   call prs
  1484 0000067D 83C402                   add  sp, 2
  1485                                  
  1486                                  ;-204     }
  1487                                  
  1488                                  .doglob61:
  1489                                  .doglob59:
  1490                                  
  1491                                  ;-205     if(istoken('-')) prc('-');
  1492                                  
  1493                                  .doglob57:
  1494 00000680 6A2D                     push 45
  1495 00000682 E8A338                   call istoken
  1496 00000685 83C402                   add  sp, 2
  1497 00000688 08C0                     or  al, al
  1498 0000068A 0F840800                 je .doglob62
  1499 0000068E 6A2D                     push 45
  1500 00000690 E86339                   call prc
  1501 00000693 83C402                   add  sp, 2
  1502                                  
  1503                                  ;-206     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }
  1504                                  
  1505                                  .doglob62:
  1506 00000696 6A3D                     push 61
  1507 00000698 E88D38                   call istoken
  1508 0000069B 83C402                   add  sp, 2
  1509 0000069E 08C0                     or  al, al
  1510 000006A0 0F841600                 je .doglob63
  1511 000006A4 680101                   push 257
  1512 000006A7 E8A038                   call expect
  1513 000006AA 83C402                   add  sp, 2
  1514 000006AD FF36[3000]               push word [lexval]
  1515 000006B1 E8FE3A                   call prunsign1
  1516 000006B4 83C402                   add  sp, 2
  1517                                  
  1518                                  ;-207     else prunsign1(0); }
  1519                                  
  1520 000006B7 E90800                   jmp .doglob64
  1521                                  .doglob63:
  1522 000006BA 6A00                     push 0
  1523 000006BC E8F33A                   call prunsign1
  1524 000006BF 83C402                   add  sp, 2
  1525                                  .doglob64:
  1526                                  
  1527                                  ;-208   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;
  1528                                  
  1529                                  .doglob55:
  1530 000006C2 A0[3700]                 mov al, [issign]
  1531 000006C5 8B1E[2C00]               mov bx, [GTop]
  1532 000006C9 88875B70                 mov [GSign+bx], al
  1533 000006CD A0[3A00]                 mov al, [iswidth]
  1534 000006D0 8B1E[2C00]               mov bx, [GTop]
  1535 000006D4 88878771                 mov [GWidth+bx], al
  1536 000006D8 A0[3400]                 mov al, [istype]
  1537 000006DB 8B1E[2C00]               mov bx, [GTop]
  1538 000006DF 88872F6F                 mov [GType+bx], al
  1539                                  
  1540                                  ;-209   GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  1541                                  
  1542 000006E3 A1[6800]                 mov ax, [lineno]
  1543 000006E6 83E801                   sub ax, 1
  1544 000006E9 8B1E[2C00]               mov bx, [GTop]
  1545 000006ED D1E3                     shl bx, 1
  1546 000006EF 8987B372                 mov [GAdr+bx], ax
  1547 000006F3 B80000                   mov ax, 0
  1548 000006F6 8B1E[2C00]               mov bx, [GTop]
  1549 000006FA D1E3                     shl bx, 1
  1550 000006FC 89870B75                 mov [GUsed+bx], ax
  1551                                  
  1552                                  ;-210   pt=adrofname(GTop);
  1553                                  
  1554 00000700 FF36[2C00]               push word [GTop]
  1555 00000704 E8CF01                   call adrofname
  1556 00000707 83C402                   add  sp, 2
  1557 0000070A A3[6C00]                 mov word [pt], ax
  1558                                  
  1559                                  ;-211   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);
  1560                                  
  1561 0000070D 8B46FA                   mov ax, [bp-6]
  1562 00000710 08C0                     or  al, al
  1563 00000712 0F841200                 je .doglob65
  1564 00000716 8D0607BD                 lea  ax, [doglobName]
  1565 0000071A 50                       push ax
  1566 0000071B FF36[6C00]               push word [pt]
  1567 0000071F E846FA                   call strcpy
  1568 00000722 83C404                   add  sp, 4
  1569 00000725 E90F00                   jmp .doglob66
  1570                                  .doglob65:
  1571 00000728 8D06A36D                 lea  ax, [symbol]
  1572 0000072C 50                       push ax
  1573 0000072D FF36[6C00]               push word [pt]
  1574 00000731 E834FA                   call strcpy
  1575 00000734 83C404                   add  sp, 4
  1576                                  
  1577                                  ;-212   GTop++; expect(';'); }
  1578                                  
  1579                                  .doglob66:
  1580 00000737 FF06[2C00]               inc  word[GTop]
  1581 0000073B 6A3B                     push 59
  1582 0000073D E80A38                   call expect
  1583 00000740 83C402                   add  sp, 2
  1584                                  
  1585                                  ;-213 
  1586                                  
  1587                                  
  1588                                  ;-214 int gettypes(int i) {int j; char c;
  1589 00000743 C9                       LEAVE
  1590 00000744 C3                       ret
  1591 00000745 476C6F62616C207461-     doglob_0 db "Global table full",0
  1592 0000074E 626C652066756C6C00 
  1593 00000757 6E6F20564F49442061-     doglob_1 db "no VOID as var type",0
  1594 00000760 732076617220747970-
  1595 00000769 6500               
  1596 0000076B 5661726961626C6520-     doglob_2 db "Variable already defined",0
  1597 00000774 616C72656164792064-
  1598 0000077D 6566696E656400     
  1599 00000784 5C6E73656374696F6E-     doglob_3 db "\nsection .bss\nabsolute ",0
  1600 0000078D 202E6273735C6E6162-
  1601 00000796 736F6C7574652000   
  1602 0000079E 5C6E00                  doglob_4 db "\n",0
  1603 000007A1 20726573622000          doglob_5 db " resb ",0
  1604 000007A8 20726573772000          doglob_6 db " resw ",0
  1605 000007AF 20726573642000          doglob_7 db " resd ",0
  1606 000007B6 5C6E73656374696F6E-     doglob_8 db "\nsection .text",0
  1607 000007BF 202E7465787400     
  1608 000007C6 4F6E6C792042797465-     doglob_9 db "Only ByteArray allowed",0
  1609 000007CF 417272617920616C6C-
  1610 000007D8 6F77656400         
  1611 000007DD 5C6E00                  doglob_10 db "\n",0
  1612 000007E0 2064622000              doglob_11 db " db ",0
  1613 000007E5 2C3000                  doglob_12 db ",0",0
  1614 000007E8 537472696E67206F72-     doglob_13 db "String or number array expected",0
  1615 000007F1 206E756D6265722061-
  1616 000007FA 727261792065787065-
  1617 00000803 6374656400         
  1618 00000808 5C6E00                  doglob_14 db "\n",0
  1619 0000080B 2064772000              doglob_15 db " dw ",0
  1620 00000810 2064622000              doglob_16 db " db ",0
  1621 00000815 2064772000              doglob_17 db " dw ",0
  1622 0000081A 2064642000              doglob_18 db " dd ",0
  1623                                  ENDP
  1624                                  
  1625                                  gettypes: PROC
  1626                                  
  1627                                  ;-215   c=GSign [i]; if (c=='S') signi =1;    else signi =0;
  1628                                  
  1629                                  ;Function : gettypes, Number of local variables: 3
  1630                                  ;   # type sign width addr used name   list of local variables
  1631                                  ;  200 var sign word   214 NULL i = bp+4
  1632                                  ;  201 var sign word   214 NULL j = bp-2
  1633                                  ;  202 var sign byte   214 NULL c = bp-4;
  1634 0000081F C8040000                 ENTER  4,0
  1635 00000823 8B5E04                   mov bx, [bp+4]
  1636 00000826 8A875B70                 mov al, [GSign + bx]
  1637 0000082A 8846FC                   mov [bp-4], al
  1638 0000082D 8A46FC                   mov al, [bp-4]
  1639 00000830 3C53                     cmp al, 83
  1640 00000832 0F850900                 jne .gettypes67
  1641 00000836 B80100                   mov ax, 1
  1642 00000839 A3[3500]                 mov word [signi], ax
  1643 0000083C E90600                   jmp .gettypes68
  1644                                  .gettypes67:
  1645 0000083F B80000                   mov ax, 0
  1646 00000842 A3[3500]                 mov word [signi], ax
  1647                                  
  1648                                  ;-216   c=GWidth[i]; widthi=0;wi=0;
  1649                                  
  1650                                  .gettypes68:
  1651 00000845 8B5E04                   mov bx, [bp+4]
  1652 00000848 8A878771                 mov al, [GWidth + bx]
  1653 0000084C 8846FC                   mov [bp-4], al
  1654 0000084F B80000                   mov ax, 0
  1655 00000852 A3[3800]                 mov word [widthi], ax
  1656 00000855 B80000                   mov ax, 0
  1657 00000858 A3[3B00]                 mov word [wi], ax
  1658                                  
  1659                                  ;-217   if (c==1) {widthi=1;wi=1;}
  1660                                  
  1661 0000085B 8A46FC                   mov al, [bp-4]
  1662 0000085E 3C01                     cmp al, 1
  1663 00000860 0F850C00                 jne .gettypes69
  1664 00000864 B80100                   mov ax, 1
  1665 00000867 A3[3800]                 mov word [widthi], ax
  1666 0000086A B80100                   mov ax, 1
  1667 0000086D A3[3B00]                 mov word [wi], ax
  1668                                  
  1669                                  ;-218   if (c==2) {widthi=2;wi=2;}
  1670                                  
  1671                                  .gettypes69:
  1672 00000870 8A46FC                   mov al, [bp-4]
  1673 00000873 3C02                     cmp al, 2
  1674 00000875 0F850C00                 jne .gettypes70
  1675 00000879 B80200                   mov ax, 2
  1676 0000087C A3[3800]                 mov word [widthi], ax
  1677 0000087F B80200                   mov ax, 2
  1678 00000882 A3[3B00]                 mov word [wi], ax
  1679                                  
  1680                                  ;-219   if (c==4) {widthi=4;wi=4;}
  1681                                  
  1682                                  .gettypes70:
  1683 00000885 8A46FC                   mov al, [bp-4]
  1684 00000888 3C04                     cmp al, 4
  1685 0000088A 0F850C00                 jne .gettypes71
  1686 0000088E B80400                   mov ax, 4
  1687 00000891 A3[3800]                 mov word [widthi], ax
  1688 00000894 B80400                   mov ax, 4
  1689 00000897 A3[3B00]                 mov word [wi], ax
  1690                                  
  1691                                  ;-220   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}
  1692                                  
  1693                                  .gettypes71:
  1694 0000089A 8B5E04                   mov bx, [bp+4]
  1695 0000089D 8A872F6F                 mov al, [GType + bx]
  1696 000008A1 8846FC                   mov [bp-4], al
  1697 000008A4 B80000                   mov ax, 0
  1698 000008A7 A3[3200]                 mov word [typei], ax
  1699 000008AA 8A46FC                   mov al, [bp-4]
  1700 000008AD 3C2A                     cmp al, 42
  1701 000008AF 0F850C00                 jne .gettypes72
  1702 000008B3 B80100                   mov ax, 1
  1703 000008B6 A3[3200]                 mov word [typei], ax
  1704 000008B9 B80200                   mov ax, 2
  1705 000008BC A3[3B00]                 mov word [wi], ax
  1706                                  
  1707                                  ;-221   if (c=='&')  typei=2;
  1708                                  
  1709                                  .gettypes72:
  1710 000008BF 8A46FC                   mov al, [bp-4]
  1711 000008C2 3C26                     cmp al, 38
  1712 000008C4 0F850600                 jne .gettypes73
  1713 000008C8 B80200                   mov ax, 2
  1714 000008CB A3[3200]                 mov word [typei], ax
  1715                                  
  1716                                  ;-222   return i; }
  1717                                  
  1718                                  .gettypes73:
  1719 000008CE 8B4604                   mov ax, [bp+4]
  1720 000008D1 E90000                   jmp .retngettypes
  1721                                  
  1722                                  ;-223 int adrofname(unsigned int i) { adrF(GNameField, i); }
  1723                                  
  1724 000008D4 C9                       .retngettypes: LEAVE
  1725 000008D5 C3                       ret
  1726                                  ENDP
  1727                                  
  1728                                  adrofname: PROC
  1729                                  ;Function : adrofname, Number of local variables: 1
  1730                                  ;   # type sign width addr used name   list of local variables
  1731                                  ;  200 var unsg word   223 NULL i = bp+4;
  1732 000008D6 C8000000                 ENTER  0,0
  1733 000008DA FF7604                   push word [bp+4]
  1734 000008DD 8D06BB79                 lea  ax, [GNameField]
  1735 000008E1 50                       push ax
  1736 000008E2 E80500                   call adrF
  1737 000008E5 83C404                   add  sp, 4
  1738                                  
  1739                                  ;-224 int adrF(char *s, unsigned int i) { i << 4;//*16; IDLENMAX=15!
  1740 000008E8 C9                       LEAVE
  1741 000008E9 C3                       ret
  1742                                  ENDP
  1743                                  
  1744                                  adrF: PROC
  1745                                  ;Function : adrF, Number of local variables: 2
  1746                                  ;   # type sign width addr used name   list of local variables
  1747                                  ;  200 ptr sign byte   224 NULL s = bp+4
  1748                                  ;  201 var unsg word   224 NULL i = bp+6;
  1749 000008EA C8000000                 ENTER  0,0
  1750 000008EE 8B4606                   mov ax, [bp+6]
  1751 000008F1 C1E004                   shl ax, 4
  1752                                  
  1753                                  ;-225   __asm{ add ax, [bp+4]  ; offset s } }
  1754                                  
  1755 000008F4 034604                   add ax, [bp+4]  ; offset s 
  1756                                  
  1757                                  ;-226 int printName(unsigned int i) {int j;
  1758 000008F7 C9                       LEAVE
  1759 000008F8 C3                       ret
  1760                                  ENDP
  1761                                  
  1762                                  printName: PROC
  1763                                  
  1764                                  ;-227   if (i < LSTART) { i=adrofname(i); prs(i); }
  1765                                  
  1766                                  ;Function : printName, Number of local variables: 2
  1767                                  ;   # type sign width addr used name   list of local variables
  1768                                  ;  200 var unsg word   226 NULL i = bp+4
  1769                                  ;  201 var sign word   226 NULL j = bp-2;
  1770 000008F9 C8020000                 ENTER  2,0
  1771 000008FD 8B4604                   mov ax, [bp+4]
  1772 00000900 3DC800                   cmp ax, 200
  1773 00000903 0F8D1800                 jge .printName74
  1774 00000907 FF7604                   push word [bp+4]
  1775 0000090A E8C9FF                   call adrofname
  1776 0000090D 83C402                   add  sp, 2
  1777 00000910 894604                   mov [bp+4], ax
  1778 00000913 FF7604                   push word [bp+4]
  1779 00000916 E84437                   call prs
  1780 00000919 83C402                   add  sp, 2
  1781                                  
  1782                                  ;-228   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }
  1783                                  
  1784 0000091C E93800                   jmp .printName75
  1785                                  .printName74:
  1786 0000091F 68[5909]                 push printName_0
  1787 00000922 E83837                   call prs
  1788 00000925 83C402                   add  sp, 2
  1789 00000928 8B5E04                   mov bx, [bp+4]
  1790 0000092B D1E3                     shl bx, 1
  1791 0000092D 8B876377                 mov ax, [GData + bx]
  1792 00000931 8946FE                   mov [bp-2], ax
  1793 00000934 8B46FE                   mov ax, [bp-2]
  1794 00000937 83F800                   cmp ax, 0
  1795 0000093A 0F8E0800                 jle .printName76
  1796 0000093E 6A2B                     push 43
  1797 00000940 E8B336                   call prc
  1798 00000943 83C402                   add  sp, 2
  1799                                  .printName76:
  1800 00000946 FF76FE                   push word [bp-2]
  1801 00000949 E80838                   call pint1
  1802 0000094C 83C402                   add  sp, 2
  1803 0000094F 6A5D                     push 93
  1804 00000951 E8A236                   call prc
  1805 00000954 83C402                   add  sp, 2
  1806                                  
  1807                                  ;-229 }
  1808                                  
  1809                                  .printName75:
  1810                                  
  1811                                  ;-230 int searchname() { unsigned int i;
  1812 00000957 C9                       LEAVE
  1813 00000958 C3                       ret
  1814 00000959 5B627000                printName_0 db "[bp",0
  1815                                  ENDP
  1816                                  
  1817                                  searchname: PROC
  1818                                  
  1819                                  ;-231   i=checkName(); if (i == 0) error1("Variable unknown");
  1820                                  
  1821                                  ;Function : searchname, Number of local variables: 1
  1822                                  ;   # type sign width addr used name   list of local variables
  1823                                  ;  200 var unsg word   230 NULL i = bp-2;
  1824 0000095D C8020000                 ENTER  2,0
  1825 00000961 E84400                   call checkName
  1826 00000964 8946FE                   mov [bp-2], ax
  1827 00000967 8B46FE                   mov ax, [bp-2]
  1828 0000096A 83F800                   cmp ax, 0
  1829 0000096D 0F850900                 jne .searchname77
  1830 00000971 68[9709]                 push searchname_0
  1831 00000974 E8453A                   call error1
  1832 00000977 83C402                   add  sp, 2
  1833                                  
  1834                                  ;-232   GUsed[i]=GUsed[i] + 1; return i;
  1835                                  
  1836                                  .searchname77:
  1837 0000097A 8B5EFE                   mov bx, [bp-2]
  1838 0000097D D1E3                     shl bx, 1
  1839 0000097F 8B870B75                 mov ax, [GUsed + bx]
  1840 00000983 83C001                   add ax, 1
  1841 00000986 8B5EFE                   mov bx, [bp-2]
  1842 00000989 D1E3                     shl bx, 1
  1843 0000098B 89870B75                 mov [GUsed+bx], ax
  1844 0000098F 8B46FE                   mov ax, [bp-2]
  1845 00000992 E90000                   jmp .retnsearchname
  1846                                  
  1847                                  ;-233 }
  1848                                  
  1849                                  
  1850                                  ;-234 int checkName() { unsigned int i; unsigned int j;
  1851                                  
  1852 00000995 C9                       .retnsearchname: LEAVE
  1853 00000996 C3                       ret
  1854 00000997 5661726961626C6520-     searchname_0 db "Variable unknown",0
  1855 000009A0 756E6B6E6F776E00   
  1856                                  ENDP
  1857                                  
  1858                                  checkName: PROC
  1859                                  
  1860                                  ;-235   i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  1861                                  
  1862                                  ;Function : checkName, Number of local variables: 2
  1863                                  ;   # type sign width addr used name   list of local variables
  1864                                  ;  200 var unsg word   234 NULL i = bp-2
  1865                                  ;  201 var unsg word   234 NULL j = bp-4;
  1866 000009A8 C8040000                 ENTER  4,0
  1867 000009AC B8C800                   mov ax, 200
  1868 000009AF 8946FE                   mov [bp-2], ax
  1869                                  .checkName78:
  1870 000009B2 8B46FE                   mov ax, [bp-2]
  1871 000009B5 3B06[2E00]               cmp ax, [LTop]
  1872 000009B9 0F8D2B00                 jge .checkName79
  1873 000009BD FF76FE                   push word [bp-2]
  1874 000009C0 E813FF                   call adrofname
  1875 000009C3 83C402                   add  sp, 2
  1876 000009C6 8946FC                   mov [bp-4], ax
  1877 000009C9 FF76FC                   push word [bp-4]
  1878 000009CC 8D06A36D                 lea  ax, [symbol]
  1879 000009D0 50                       push ax
  1880 000009D1 E8C4F7                   call eqstr
  1881 000009D4 83C404                   add  sp, 4
  1882 000009D7 08C0                     or  al, al
  1883 000009D9 0F840600                 je .checkName80
  1884 000009DD 8B46FE                   mov ax, [bp-2]
  1885 000009E0 E94700                   jmp .retncheckName
  1886                                  .checkName80:
  1887 000009E3 FF46FE                   inc  word[bp-2]
  1888                                  
  1889                                  ;-236   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  1890                                  
  1891 000009E6 EBCA                     jmp .checkName78
  1892                                  .checkName79:
  1893 000009E8 B80100                   mov ax, 1
  1894 000009EB 8946FE                   mov [bp-2], ax
  1895                                  .checkName81:
  1896 000009EE 8B46FE                   mov ax, [bp-2]
  1897 000009F1 3B06[2C00]               cmp ax, [GTop]
  1898 000009F5 0F8D2B00                 jge .checkName82
  1899 000009F9 FF76FE                   push word [bp-2]
  1900 000009FC E8D7FE                   call adrofname
  1901 000009FF 83C402                   add  sp, 2
  1902 00000A02 8946FC                   mov [bp-4], ax
  1903 00000A05 FF76FC                   push word [bp-4]
  1904 00000A08 8D06A36D                 lea  ax, [symbol]
  1905 00000A0C 50                       push ax
  1906 00000A0D E888F7                   call eqstr
  1907 00000A10 83C404                   add  sp, 4
  1908 00000A13 08C0                     or  al, al
  1909 00000A15 0F840600                 je .checkName83
  1910 00000A19 8B46FE                   mov ax, [bp-2]
  1911 00000A1C E90B00                   jmp .retncheckName
  1912                                  .checkName83:
  1913 00000A1F FF46FE                   inc  word[bp-2]
  1914                                  
  1915                                  ;-237   return 0;
  1916                                  
  1917 00000A22 EBCA                     jmp .checkName81
  1918                                  .checkName82:
  1919 00000A24 B80000                   mov ax, 0
  1920 00000A27 E90000                   jmp .retncheckName
  1921                                  
  1922                                  ;-238 }
  1923                                  
  1924                                  
  1925                                  ;-239 int typeName() { int m; //0=V,1=*,2=&
  1926                                  
  1927 00000A2A C9                       .retncheckName: LEAVE
  1928 00000A2B C3                       ret
  1929                                  ENDP
  1930                                  
  1931                                  typeName: PROC
  1932                                  
  1933                                  ;-240     issign='S';
  1934                                  
  1935                                  ;Function : typeName, Number of local variables: 1
  1936                                  ;   # type sign width addr used name   list of local variables
  1937                                  ;  200 var sign word   239 NULL m = bp-2;
  1938 00000A2C C8020000                 ENTER  2,0
  1939 00000A30 B85300                   mov ax, 83
  1940 00000A33 A2[3700]                 mov byte [issign], al
  1941                                  
  1942                                  ;-241     if(istoken(T_SIGNED))   issign='S';
  1943                                  
  1944 00000A36 681302                   push 531
  1945 00000A39 E8EC34                   call istoken
  1946 00000A3C 83C402                   add  sp, 2
  1947 00000A3F 08C0                     or  al, al
  1948 00000A41 0F840600                 je .typeName84
  1949 00000A45 B85300                   mov ax, 83
  1950 00000A48 A2[3700]                 mov byte [issign], al
  1951                                  
  1952                                  ;-242     if(istoken(T_UNSIGNED)) issign='U';
  1953                                  
  1954                                  .typeName84:
  1955 00000A4B 681402                   push 532
  1956 00000A4E E8D734                   call istoken
  1957 00000A51 83C402                   add  sp, 2
  1958 00000A54 08C0                     or  al, al
  1959 00000A56 0F840600                 je .typeName85
  1960 00000A5A B85500                   mov ax, 85
  1961 00000A5D A2[3700]                 mov byte [issign], al
  1962                                  
  1963                                  ;-243     iswidth=2;
  1964                                  
  1965                                  .typeName85:
  1966 00000A60 B80200                   mov ax, 2
  1967 00000A63 A2[3A00]                 mov byte [iswidth], al
  1968                                  
  1969                                  ;-244     if(istoken(T_VOID))     iswidth=0;
  1970                                  
  1971 00000A66 681102                   push 529
  1972 00000A69 E8BC34                   call istoken
  1973 00000A6C 83C402                   add  sp, 2
  1974 00000A6F 08C0                     or  al, al
  1975 00000A71 0F840600                 je .typeName86
  1976 00000A75 B80000                   mov ax, 0
  1977 00000A78 A2[3A00]                 mov byte [iswidth], al
  1978                                  
  1979                                  ;-245     if(istoken(T_CHAR))     iswidth=1;
  1980                                  
  1981                                  .typeName86:
  1982 00000A7B 681202                   push 530
  1983 00000A7E E8A734                   call istoken
  1984 00000A81 83C402                   add  sp, 2
  1985 00000A84 08C0                     or  al, al
  1986 00000A86 0F840600                 je .typeName87
  1987 00000A8A B80100                   mov ax, 1
  1988 00000A8D A2[3A00]                 mov byte [iswidth], al
  1989                                  
  1990                                  ;-246     if(istoken(T_INT))      iswidth=2;
  1991                                  
  1992                                  .typeName87:
  1993 00000A90 680502                   push 517
  1994 00000A93 E89234                   call istoken
  1995 00000A96 83C402                   add  sp, 2
  1996 00000A99 08C0                     or  al, al
  1997 00000A9B 0F840600                 je .typeName88
  1998 00000A9F B80200                   mov ax, 2
  1999 00000AA2 A2[3A00]                 mov byte [iswidth], al
  2000                                  
  2001                                  ;-247     if(istoken(T_LONG))     iswidth=4;
  2002                                  
  2003                                  .typeName88:
  2004 00000AA5 681502                   push 533
  2005 00000AA8 E87D34                   call istoken
  2006 00000AAB 83C402                   add  sp, 2
  2007 00000AAE 08C0                     or  al, al
  2008 00000AB0 0F840600                 je .typeName89
  2009 00000AB4 B80400                   mov ax, 4
  2010 00000AB7 A2[3A00]                 mov byte [iswidth], al
  2011                                  
  2012                                  ;-248     istype='V';
  2013                                  
  2014                                  .typeName89:
  2015 00000ABA B85600                   mov ax, 86
  2016 00000ABD A2[3400]                 mov byte [istype], al
  2017                                  
  2018                                  ;-249     m=0;
  2019                                  
  2020 00000AC0 B80000                   mov ax, 0
  2021 00000AC3 8946FE                   mov [bp-2], ax
  2022                                  
  2023                                  ;-250     if(istoken('*'))  {istype='*'; m=1;}
  2024                                  
  2025 00000AC6 6A2A                     push 42
  2026 00000AC8 E85D34                   call istoken
  2027 00000ACB 83C402                   add  sp, 2
  2028 00000ACE 08C0                     or  al, al
  2029 00000AD0 0F840C00                 je .typeName90
  2030 00000AD4 B82A00                   mov ax, 42
  2031 00000AD7 A2[3400]                 mov byte [istype], al
  2032 00000ADA B80100                   mov ax, 1
  2033 00000ADD 8946FE                   mov [bp-2], ax
  2034                                  
  2035                                  ;-251     if(istoken('&'))  {istype='&'; m=2;}
  2036                                  
  2037                                  .typeName90:
  2038 00000AE0 6A26                     push 38
  2039 00000AE2 E84334                   call istoken
  2040 00000AE5 83C402                   add  sp, 2
  2041 00000AE8 08C0                     or  al, al
  2042 00000AEA 0F840C00                 je .typeName91
  2043 00000AEE B82600                   mov ax, 38
  2044 00000AF1 A2[3400]                 mov byte [istype], al
  2045 00000AF4 B80200                   mov ax, 2
  2046 00000AF7 8946FE                   mov [bp-2], ax
  2047                                  
  2048                                  ;-252     name1();
  2049                                  
  2050                                  .typeName91:
  2051 00000AFA E80800                   call name1
  2052                                  
  2053                                  ;-253     return m;
  2054                                  
  2055 00000AFD 8B46FE                   mov ax, [bp-2]
  2056 00000B00 E90000                   jmp .retntypeName
  2057                                  
  2058                                  ;-254 }
  2059                                  
  2060                                  
  2061                                  ;-255 int name1() {
  2062                                  
  2063 00000B03 C9                       .retntypeName: LEAVE
  2064 00000B04 C3                       ret
  2065                                  ENDP
  2066                                  
  2067                                  name1: PROC
  2068                                  
  2069                                  ;-256     if (token!=T_NAME) error1("Name expected");
  2070                                  
  2071 00000B05 A1[1E00]                 mov ax, [token]
  2072 00000B08 3D0001                   cmp ax, 256
  2073 00000B0B 0F840900                 je  .name192
  2074 00000B0F 68[1F0B]                 push name1_0
  2075 00000B12 E8A738                   call error1
  2076 00000B15 83C402                   add  sp, 2
  2077                                  
  2078                                  ;-257     token=getlex();
  2079                                  
  2080                                  .name192:
  2081 00000B18 E8E02C                   call getlex
  2082 00000B1B A3[1E00]                 mov word [token], ax
  2083                                  
  2084                                  ;-258 }
  2085                                  
  2086                                  
  2087                                  ;-259 
  2088                                  
  2089                                  
  2090                                  ;-260 int storecall() { int i; if (CTop >= CALLMAX) error1("Call table full");
  2091                                  
  2092 00000B1E C3                       ret
  2093 00000B1F 4E616D652065787065-     name1_0 db "Name expected",0
  2094 00000B28 6374656400         
  2095                                  ENDP
  2096                                  
  2097                                  storecall: PROC
  2098                                  ;Function : storecall, Number of local variables: 1
  2099                                  ;   # type sign width addr used name   list of local variables
  2100                                  ;  200 var sign word   260 NULL i = bp-2;
  2101 00000B2D C8020000                 ENTER  2,0
  2102 00000B31 A1[3F00]                 mov ax, [CTop]
  2103 00000B34 3DD007                   cmp ax, 2000 ;unsigned : 1
  2104 00000B37 0F8C0900                 jl  .storecall93
  2105 00000B3B 68[9F0B]                 push storecall_0
  2106 00000B3E E87B38                   call error1
  2107 00000B41 83C402                   add  sp, 2
  2108                                  
  2109                                  ;-261   if (CNameTop >= 65468) error1("Call name table fuill");
  2110                                  
  2111                                  .storecall93:
  2112 00000B44 A1[6200]                 mov ax, [CNameTop]
  2113 00000B47 3DBCFF                   cmp ax, 65468 ;unsigned : 0
  2114 00000B4A 0F820900                 jb  .storecall94
  2115 00000B4E 68[AF0B]                 push storecall_1
  2116 00000B51 E86838                   call error1
  2117 00000B54 83C402                   add  sp, 2
  2118                                  
  2119                                  ;-262     CType[CTop]=0;  CAdr [CTop]=CNameTop; i=strlen(symbol);
  2120                                  
  2121                                  .storecall94:
  2122 00000B57 B80000                   mov ax, 0
  2123 00000B5A 8B1E[3F00]               mov bx, [CTop]
  2124 00000B5E 8887A78D                 mov [CType+bx], al
  2125 00000B62 A1[6200]                 mov ax, [CNameTop]
  2126 00000B65 8B1E[3F00]               mov bx, [CTop]
  2127 00000B69 D1E3                     shl bx, 1
  2128 00000B6B 8987CF97                 mov [CAdr+bx], ax
  2129 00000B6F 8D06A36D                 lea  ax, [symbol]
  2130 00000B73 50                       push ax
  2131 00000B74 E8C9F5                   call strlen
  2132 00000B77 83C402                   add  sp, 2
  2133 00000B7A 8946FE                   mov [bp-2], ax
  2134                                  
  2135                                  ;-263     to_far(CNameTop, symbol);
  2136                                  
  2137 00000B7D 8D06A36D                 lea  ax, [symbol]
  2138 00000B81 50                       push ax
  2139 00000B82 FF36[6200]               push word [CNameTop]
  2140 00000B86 E86046                   call to_far
  2141 00000B89 83C404                   add  sp, 4
  2142                                  
  2143                                  ;-264     CNameTop=CNameTop+i; CNameTop++; CTop++;
  2144                                  
  2145 00000B8C A1[6200]                 mov ax, [CNameTop]
  2146 00000B8F 0346FE                   add ax, [bp-2]
  2147 00000B92 A3[6200]                 mov word [CNameTop], ax
  2148 00000B95 FF06[6200]               inc  word[CNameTop]
  2149 00000B99 FF06[3F00]               inc  word[CTop]
  2150                                  
  2151                                  ;-265 }
  2152                                  
  2153                                  
  2154                                  ;-266 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
  2155 00000B9D C9                       LEAVE
  2156 00000B9E C3                       ret
  2157 00000B9F 43616C6C207461626C-     storecall_0 db "Call table full",0
  2158 00000BA8 652066756C6C00     
  2159 00000BAF 43616C6C206E616D65-     storecall_1 db "Call name table fuill",0
  2160 00000BB8 207461626C65206675-
  2161 00000BC1 696C6C00           
  2162                                  ENDP
  2163                                  
  2164                                  storefunc: PROC
  2165 00000BC5 A1[3D00]                 mov ax, [FTop]
  2166 00000BC8 3D2C01                   cmp ax, 300 ;unsigned : 1
  2167 00000BCB 0F8C0900                 jl  .storefunc95
  2168 00000BCF 68[260C]                 push storefunc_0
  2169 00000BD2 E8E737                   call error1
  2170 00000BD5 83C402                   add  sp, 2
  2171                                  
  2172                                  ;-267     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;
  2173                                  
  2174                                  .storefunc95:
  2175 00000BD8 A1[6800]                 mov ax, [lineno]
  2176 00000BDB 83E801                   sub ax, 1
  2177 00000BDE 8B1E[3D00]               mov bx, [FTop]
  2178 00000BE2 D1E3                     shl bx, 1
  2179 00000BE4 89877795                 mov [FAdr+bx], ax
  2180 00000BE8 B80000                   mov ax, 0
  2181 00000BEB 8B1E[3D00]               mov bx, [FTop]
  2182 00000BEF D1E3                     shl bx, 1
  2183 00000BF1 89876FA7                 mov [FCalls+bx], ax
  2184 00000BF5 A0[3A00]                 mov al, [iswidth]
  2185 00000BF8 8B1E[3D00]               mov bx, [FTop]
  2186 00000BFC 88877B8C                 mov [FType+bx], al
  2187                                  
  2188                                  ;-268     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;
  2189                                  
  2190 00000C00 FF36[3D00]               push word [FTop]
  2191 00000C04 8D06C7A9                 lea  ax, [FNameField]
  2192 00000C08 50                       push ax
  2193 00000C09 E8DEFC                   call adrF
  2194 00000C0C 83C404                   add  sp, 4
  2195 00000C0F A3[6C00]                 mov word [pt], ax
  2196 00000C12 8D06A36D                 lea  ax, [symbol]
  2197 00000C16 50                       push ax
  2198 00000C17 FF36[6C00]               push word [pt]
  2199 00000C1B E84AF5                   call strcpy
  2200 00000C1E 83C404                   add  sp, 4
  2201 00000C21 FF06[3D00]               inc  word[FTop]
  2202                                  
  2203                                  ;-269 }
  2204                                  
  2205                                  
  2206                                  ;-270 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");
  2207                                  
  2208 00000C25 C3                       ret
  2209 00000C26 46756E6374696F6E20-     storefunc_0 db "Function table full",0
  2210 00000C2F 7461626C652066756C-
  2211 00000C38 6C00               
  2212                                  ENDP
  2213                                  
  2214                                  addlocal: PROC
  2215 00000C3A A1[2E00]                 mov ax, [LTop]
  2216 00000C3D 3D2C01                   cmp ax, 300 ;unsigned : 1
  2217 00000C40 0F8C0900                 jl  .addlocal96
  2218 00000C44 68[C00C]                 push addlocal_0
  2219 00000C47 E87237                   call error1
  2220 00000C4A 83C402                   add  sp, 2
  2221                                  
  2222                                  ;-271   if (checkName() != 0) error1("Variable already defined");
  2223                                  
  2224                                  .addlocal96:
  2225 00000C4D E858FD                   call checkName
  2226 00000C50 83F800                   cmp ax, 0
  2227 00000C53 0F840900                 je  .addlocal97
  2228 00000C57 68[DA0C]                 push addlocal_1
  2229 00000C5A E85F37                   call error1
  2230 00000C5D 83C402                   add  sp, 2
  2231                                  
  2232                                  ;-272   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;
  2233                                  
  2234                                  .addlocal97:
  2235 00000C60 A0[3700]                 mov al, [issign]
  2236 00000C63 8B1E[2E00]               mov bx, [LTop]
  2237 00000C67 88875B70                 mov [GSign+bx], al
  2238 00000C6B A0[3A00]                 mov al, [iswidth]
  2239 00000C6E 8B1E[2E00]               mov bx, [LTop]
  2240 00000C72 88878771                 mov [GWidth+bx], al
  2241 00000C76 A0[3400]                 mov al, [istype]
  2242 00000C79 8B1E[2E00]               mov bx, [LTop]
  2243 00000C7D 88872F6F                 mov [GType+bx], al
  2244                                  
  2245                                  ;-273   GAdr [LTop]=lineno-1; GUsed[LTop]=0;
  2246                                  
  2247 00000C81 A1[6800]                 mov ax, [lineno]
  2248 00000C84 83E801                   sub ax, 1
  2249 00000C87 8B1E[2E00]               mov bx, [LTop]
  2250 00000C8B D1E3                     shl bx, 1
  2251 00000C8D 8987B372                 mov [GAdr+bx], ax
  2252 00000C91 B80000                   mov ax, 0
  2253 00000C94 8B1E[2E00]               mov bx, [LTop]
  2254 00000C98 D1E3                     shl bx, 1
  2255 00000C9A 89870B75                 mov [GUsed+bx], ax
  2256                                  
  2257                                  ;-274   pt=adrF(GNameField, LTop); strcpy(pt, symbol);
  2258                                  
  2259 00000C9E FF36[2E00]               push word [LTop]
  2260 00000CA2 8D06BB79                 lea  ax, [GNameField]
  2261 00000CA6 50                       push ax
  2262 00000CA7 E840FC                   call adrF
  2263 00000CAA 83C404                   add  sp, 4
  2264 00000CAD A3[6C00]                 mov word [pt], ax
  2265 00000CB0 8D06A36D                 lea  ax, [symbol]
  2266 00000CB4 50                       push ax
  2267 00000CB5 FF36[6C00]               push word [pt]
  2268 00000CB9 E8ACF4                   call strcpy
  2269 00000CBC 83C404                   add  sp, 4
  2270                                  
  2271                                  ;-275 }
  2272                                  
  2273                                  
  2274                                  ;-276 int checkFunction() { unsigned int i; unsigned int j; i=0;
  2275                                  
  2276 00000CBF C3                       ret
  2277 00000CC0 4C6F63616C20766172-     addlocal_0 db "Local variable table full",0
  2278 00000CC9 6961626C6520746162-
  2279 00000CD2 6C652066756C6C00   
  2280 00000CDA 5661726961626C6520-     addlocal_1 db "Variable already defined",0
  2281 00000CE3 616C72656164792064-
  2282 00000CEC 6566696E656400     
  2283                                  ENDP
  2284                                  
  2285                                  checkFunction: PROC
  2286                                  ;Function : checkFunction, Number of local variables: 2
  2287                                  ;   # type sign width addr used name   list of local variables
  2288                                  ;  200 var unsg word   276 NULL i = bp-2
  2289                                  ;  201 var unsg word   276 NULL j = bp-4;
  2290 00000CF3 C8040000                 ENTER  4,0
  2291 00000CF7 B80000                   mov ax, 0
  2292 00000CFA 8946FE                   mov [bp-2], ax
  2293                                  
  2294                                  ;-277   while (i < FTop) { 
  2295                                  
  2296                                  .checkFunction98:
  2297 00000CFD 8B46FE                   mov ax, [bp-2]
  2298 00000D00 3B06[3D00]               cmp ax, [FTop]
  2299 00000D04 0F8D3000                 jge .checkFunction99
  2300                                  
  2301                                  ;-278     j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}
  2302                                  
  2303 00000D08 FF76FE                   push word [bp-2]
  2304 00000D0B 8D06C7A9                 lea  ax, [FNameField]
  2305 00000D0F 50                       push ax
  2306 00000D10 E8D7FB                   call adrF
  2307 00000D13 83C404                   add  sp, 4
  2308 00000D16 8946FC                   mov [bp-4], ax
  2309 00000D19 FF76FC                   push word [bp-4]
  2310 00000D1C 8D06A36D                 lea  ax, [symbol]
  2311 00000D20 50                       push ax
  2312 00000D21 E874F4                   call eqstr
  2313 00000D24 83C404                   add  sp, 4
  2314 00000D27 08C0                     or  al, al
  2315 00000D29 0F840600                 je .checkFunction100
  2316 00000D2D 8B46FE                   mov ax, [bp-2]
  2317 00000D30 E90B00                   jmp .retncheckFunction
  2318                                  .checkFunction100:
  2319 00000D33 FF46FE                   inc  word[bp-2]
  2320                                  
  2321                                  ;-279   return 0; }
  2322                                  
  2323 00000D36 EBC5                     jmp .checkFunction98
  2324                                  .checkFunction99:
  2325 00000D38 B80000                   mov ax, 0
  2326 00000D3B E90000                   jmp .retncheckFunction
  2327                                  
  2328                                  ;-280 int dofunc() { int nloc; int i; int narg;
  2329                                  
  2330 00000D3E C9                       .retncheckFunction: LEAVE
  2331 00000D3F C3                       ret
  2332                                  ENDP
  2333                                  
  2334                                  dofunc: PROC
  2335                                  
  2336                                  ;-281   cloc=&co;
  2337                                  
  2338                                  ;Function : dofunc, Number of local variables: 3
  2339                                  ;   # type sign width addr used name   list of local variables
  2340                                  ;  200 var sign word   280 NULL nloc = bp-2
  2341                                  ;  201 var sign word   280 NULL i = bp-4
  2342                                  ;  202 var sign word   280 NULL narg = bp-6;
  2343 00000D40 C8060000                 ENTER  6,0
  2344 00000D44 B8A861                   mov ax, co
  2345 00000D47 A3[1800]                 mov word [cloc], ax
  2346                                  
  2347                                  ;-282   checknamelen();
  2348                                  
  2349 00000D4A E857F6                   call checknamelen
  2350                                  
  2351                                  ;-283   strcpy(fname, symbol);
  2352                                  
  2353 00000D4D 8D06A36D                 lea  ax, [symbol]
  2354 00000D51 50                       push ax
  2355 00000D52 8D06236E                 lea  ax, [fname]
  2356 00000D56 50                       push ax
  2357 00000D57 E80EF4                   call strcpy
  2358 00000D5A 83C404                   add  sp, 4
  2359                                  
  2360                                  ;-284   if (checkFunction() ) error1("Function already defined");
  2361                                  
  2362 00000D5D E893FF                   call checkFunction
  2363 00000D60 08C0                     or  al, al
  2364 00000D62 0F840900                 je .dofunc101
  2365 00000D66 68[8A0F]                 push dofunc_0
  2366 00000D69 E85036                   call error1
  2367 00000D6C 83C402                   add  sp, 2
  2368                                  
  2369                                  ;-285   storefunc();
  2370                                  
  2371                                  .dofunc101:
  2372 00000D6F E853FE                   call storefunc
  2373                                  
  2374                                  ;-286   prs("\n\n"); prs(symbol); prs(": PROC");
  2375                                  
  2376 00000D72 68[A30F]                 push dofunc_1
  2377 00000D75 E8E532                   call prs
  2378 00000D78 83C402                   add  sp, 2
  2379 00000D7B 8D06A36D                 lea  ax, [symbol]
  2380 00000D7F 50                       push ax
  2381 00000D80 E8DA32                   call prs
  2382 00000D83 83C402                   add  sp, 2
  2383 00000D86 68[A80F]                 push dofunc_2
  2384 00000D89 E8D132                   call prs
  2385 00000D8C 83C402                   add  sp, 2
  2386                                  
  2387                                  ;-287   expect('('); LTop=LSTART;  i=0;
  2388                                  
  2389 00000D8F 6A28                     push 40
  2390 00000D91 E8B631                   call expect
  2391 00000D94 83C402                   add  sp, 2
  2392 00000D97 B8C800                   mov ax, 200
  2393 00000D9A A3[2E00]                 mov word [LTop], ax
  2394 00000D9D B80000                   mov ax, 0
  2395 00000DA0 8946FC                   mov [bp-4], ax
  2396                                  
  2397                                  ;-288   if (istoken(')')==0) { narg=2;
  2398                                  
  2399 00000DA3 6A29                     push 41
  2400 00000DA5 E88031                   call istoken
  2401 00000DA8 83C402                   add  sp, 2
  2402 00000DAB 83F800                   cmp ax, 0
  2403 00000DAE 0F854600                 jne .dofunc102
  2404 00000DB2 B80200                   mov ax, 2
  2405 00000DB5 8946FA                   mov [bp-6], ax
  2406                                  
  2407                                  ;-289     do { typeName();  addlocal(); narg+=2;
  2408                                  
  2409                                  .dofunc103:
  2410 00000DB8 E871FC                   call typeName
  2411 00000DBB E87CFE                   call addlocal
  2412 00000DBE 8346FA02                 add  word[bp-6], 2
  2413                                  
  2414                                  ;-290          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }
  2415                                  
  2416 00000DC2 8B46FA                   mov ax, [bp-6]
  2417 00000DC5 8B1E[2E00]               mov bx, [LTop]
  2418 00000DC9 D1E3                     shl bx, 1
  2419 00000DCB 89876377                 mov [GData+bx], ax
  2420 00000DCF A0[3A00]                 mov al, [iswidth]
  2421 00000DD2 3C04                     cmp al, 4
  2422 00000DD4 0F850400                 jne .dofunc104
  2423 00000DD8 8346FA02                 add  word[bp-6], 2
  2424                                  .dofunc104:
  2425 00000DDC FF06[2E00]               inc  word[LTop]
  2426                                  
  2427                                  ;-291     while (istoken(','));  expect(')'); }
  2428                                  
  2429 00000DE0 6A2C                     push 44
  2430 00000DE2 E84331                   call istoken
  2431 00000DE5 83C402                   add  sp, 2
  2432 00000DE8 08C0                     or  al, al
  2433 00000DEA 0F840200                 je .dofunc105
  2434 00000DEE EBC8                     jmp .dofunc103
  2435                                  .dofunc105:
  2436 00000DF0 6A29                     push 41
  2437 00000DF2 E85531                   call expect
  2438 00000DF5 83C402                   add  sp, 2
  2439                                  
  2440                                  ;-292 
  2441                                  
  2442                                  
  2443                                  ;-293   expect('{'); /*body*/
  2444                                  
  2445                                  .dofunc102:
  2446 00000DF8 6A7B                     push 123
  2447 00000DFA E84D31                   call expect
  2448 00000DFD 83C402                   add  sp, 2
  2449                                  
  2450                                  ;-294   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */
  2451                                  
  2452 00000E00 B80000                   mov ax, 0
  2453 00000E03 8946FE                   mov [bp-2], ax
  2454 00000E06 B80000                   mov ax, 0
  2455 00000E09 A3[2800]                 mov word [nreturn], ax
  2456 00000E0C B80000                   mov ax, 0
  2457 00000E0F A3[2600]                 mov word [nconst], ax
  2458 00000E12 B80000                   mov ax, 0
  2459 00000E15 8946FC                   mov [bp-4], ax
  2460                                  
  2461                                  ;-295   while(isvariable()) {
  2462                                  
  2463                                  .dofunc106:
  2464 00000E18 E8C101                   call isvariable
  2465 00000E1B 08C0                     or  al, al
  2466 00000E1D 0F849200                 je .dofunc107
  2467                                  
  2468                                  ;-296     do {typeName();
  2469                                  
  2470                                  .dofunc108:
  2471 00000E21 E808FC                   call typeName
  2472                                  
  2473                                  ;-297         checknamelen();
  2474                                  
  2475 00000E24 E87DF5                   call checknamelen
  2476                                  
  2477                                  ;-298         addlocal(); nloc-=2;
  2478                                  
  2479 00000E27 E810FE                   call addlocal
  2480 00000E2A 836EFE02                 sub  word[bp-2], 2
  2481                                  
  2482                                  ;-299         if (iswidth == 4) nloc-=2;
  2483                                  
  2484 00000E2E A0[3A00]                 mov al, [iswidth]
  2485 00000E31 3C04                     cmp al, 4
  2486 00000E33 0F850400                 jne .dofunc109
  2487 00000E37 836EFE02                 sub  word[bp-2], 2
  2488                                  
  2489                                  ;-300         GData[LTop]=nloc;
  2490                                  
  2491                                  .dofunc109:
  2492 00000E3B 8B46FE                   mov ax, [bp-2]
  2493 00000E3E 8B1E[2E00]               mov bx, [LTop]
  2494 00000E42 D1E3                     shl bx, 1
  2495 00000E44 89876377                 mov [GData+bx], ax
  2496                                  
  2497                                  ;-301         if (istoken('[')){
  2498                                  
  2499 00000E48 6A5B                     push 91
  2500 00000E4A E8DB30                   call istoken
  2501 00000E4D 83C402                   add  sp, 2
  2502 00000E50 08C0                     or  al, al
  2503 00000E52 0F843D00                 je .dofunc110
  2504                                  
  2505                                  ;-302             istype='&';GType[LTop]='&';expect(T_CONST);expect(']');
  2506                                  
  2507 00000E56 B82600                   mov ax, 38
  2508 00000E59 A2[3400]                 mov byte [istype], al
  2509 00000E5C B82600                   mov ax, 38
  2510 00000E5F 8B1E[2E00]               mov bx, [LTop]
  2511 00000E63 88872F6F                 mov [GType+bx], al
  2512 00000E67 680101                   push 257
  2513 00000E6A E8DD30                   call expect
  2514 00000E6D 83C402                   add  sp, 2
  2515 00000E70 6A5D                     push 93
  2516 00000E72 E8D530                   call expect
  2517 00000E75 83C402                   add  sp, 2
  2518                                  
  2519                                  ;-303             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc; 
  2520                                  
  2521 00000E78 8B46FE                   mov ax, [bp-2]
  2522 00000E7B 2B06[3000]               sub ax, [lexval]
  2523 00000E7F 8946FE                   mov [bp-2], ax
  2524 00000E82 8346FE02                 add  word[bp-2], 2
  2525 00000E86 8B46FE                   mov ax, [bp-2]
  2526 00000E89 8B1E[2E00]               mov bx, [LTop]
  2527 00000E8D D1E3                     shl bx, 1
  2528 00000E8F 89876377                 mov [GData+bx], ax
  2529                                  
  2530                                  ;-304             }
  2531                                  
  2532                                  
  2533                                  ;-305         LTop++;
  2534                                  
  2535                                  .dofunc110:
  2536 00000E93 FF06[2E00]               inc  word[LTop]
  2537                                  
  2538                                  ;-306       } while (istoken(',')); expect(';'); }
  2539                                  
  2540 00000E97 6A2C                     push 44
  2541 00000E99 E88C30                   call istoken
  2542 00000E9C 83C402                   add  sp, 2
  2543 00000E9F 08C0                     or  al, al
  2544 00000EA1 0F840300                 je .dofunc111
  2545 00000EA5 E979FF                   jmp .dofunc108
  2546                                  .dofunc111:
  2547 00000EA8 6A3B                     push 59
  2548 00000EAA E89D30                   call expect
  2549 00000EAD 83C402                   add  sp, 2
  2550                                  
  2551                                  ;-307   listproc();
  2552                                  
  2553 00000EB0 E965FF                   jmp .dofunc106
  2554                                  .dofunc107:
  2555 00000EB3 E8C835                   call listproc
  2556                                  
  2557                                  ;-308   if (LTop>LSTART){prs(";\n ENTER  ");
  2558                                  
  2559 00000EB6 A1[2E00]                 mov ax, [LTop]
  2560 00000EB9 3DC800                   cmp ax, 200
  2561 00000EBC 0F8E2700                 jle .dofunc112
  2562 00000EC0 68[AF0F]                 push dofunc_3
  2563 00000EC3 E89731                   call prs
  2564 00000EC6 83C402                   add  sp, 2
  2565                                  
  2566                                  ;-309     nloc=mkneg(nloc); prunsign1 (nloc); prs(",0"); }
  2567                                  
  2568 00000EC9 FF76FE                   push word [bp-2]
  2569 00000ECC E8F5F1                   call mkneg
  2570 00000ECF 83C402                   add  sp, 2
  2571 00000ED2 8946FE                   mov [bp-2], ax
  2572 00000ED5 FF76FE                   push word [bp-2]
  2573 00000ED8 E8D732                   call prunsign1
  2574 00000EDB 83C402                   add  sp, 2
  2575 00000EDE 68[BB0F]                 push dofunc_4
  2576 00000EE1 E87931                   call prs
  2577 00000EE4 83C402                   add  sp, 2
  2578                                  
  2579                                  ;-310   while(istoken('}')==0)   stmt();
  2580                                  
  2581                                  .dofunc112:
  2582                                  .dofunc113:
  2583 00000EE7 6A7D                     push 125
  2584 00000EE9 E83C30                   call istoken
  2585 00000EEC 83C402                   add  sp, 2
  2586 00000EEF 83F800                   cmp ax, 0
  2587 00000EF2 0F850500                 jne .dofunc114
  2588 00000EF6 E88B23                   call stmt
  2589                                  
  2590                                  ;-311   if (nreturn) {
  2591                                  
  2592 00000EF9 EBEC                     jmp .dofunc113
  2593                                  .dofunc114:
  2594 00000EFB A1[2800]                 mov ax, [nreturn]
  2595 00000EFE 08C0                     or  al, al
  2596 00000F00 0F841C00                 je .dofunc115
  2597                                  
  2598                                  ;-312         prs("\n .retn");
  2599                                  
  2600 00000F04 68[BE0F]                 push dofunc_5
  2601 00000F07 E85331                   call prs
  2602 00000F0A 83C402                   add  sp, 2
  2603                                  
  2604                                  ;-313         prs(fname);
  2605                                  
  2606 00000F0D 8D06236E                 lea  ax, [fname]
  2607 00000F11 50                       push ax
  2608 00000F12 E84831                   call prs
  2609 00000F15 83C402                   add  sp, 2
  2610                                  
  2611                                  ;-314         prc(':');
  2612                                  
  2613 00000F18 6A3A                     push 58
  2614 00000F1A E8D930                   call prc
  2615 00000F1D 83C402                   add  sp, 2
  2616                                  
  2617                                  ;-315         }
  2618                                  
  2619                                  
  2620                                  ;-316   if (LTop > LSTART) prs(" LEAVE");
  2621                                  
  2622                                  .dofunc115:
  2623 00000F20 A1[2E00]                 mov ax, [LTop]
  2624 00000F23 3DC800                   cmp ax, 200
  2625 00000F26 0F8E0900                 jle .dofunc116
  2626 00000F2A 68[C70F]                 push dofunc_6
  2627 00000F2D E82D31                   call prs
  2628 00000F30 83C402                   add  sp, 2
  2629                                  
  2630                                  ;-317   prs("\n ret");
  2631                                  
  2632                                  .dofunc116:
  2633 00000F33 68[CE0F]                 push dofunc_7
  2634 00000F36 E82431                   call prs
  2635 00000F39 83C402                   add  sp, 2
  2636                                  
  2637                                  ;-318   *cloc=0; prs(co);
  2638                                  
  2639 00000F3C B80000                   mov ax, 0
  2640 00000F3F 8B1E[1800]               mov  bx, [cloc]
  2641 00000F43 8807                     mov  [bx], al
  2642 00000F45 8D06A861                 lea  ax, [co]
  2643 00000F49 50                       push ax
  2644 00000F4A E81031                   call prs
  2645 00000F4D 83C402                   add  sp, 2
  2646                                  
  2647                                  ;-319   maxco1=strlen(co);
  2648                                  
  2649 00000F50 8D06A861                 lea  ax, [co]
  2650 00000F54 50                       push ax
  2651 00000F55 E8E8F1                   call strlen
  2652 00000F58 83C402                   add  sp, 2
  2653 00000F5B A3[1600]                 mov word [maxco1], ax
  2654                                  
  2655                                  ;-320   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }
  2656                                  
  2657 00000F5E A1[1600]                 mov ax, [maxco1]
  2658 00000F61 3B06[1400]               cmp ax, [maxco]
  2659 00000F65 0F8E1600                 jle .dofunc117
  2660 00000F69 A1[1600]                 mov ax, [maxco1]
  2661 00000F6C A3[1400]                 mov word [maxco], ax
  2662 00000F6F 8D06236E                 lea  ax, [fname]
  2663 00000F73 50                       push ax
  2664 00000F74 8D06606D                 lea  ax, [coname]
  2665 00000F78 50                       push ax
  2666 00000F79 E8ECF1                   call strcpy
  2667 00000F7C 83C404                   add  sp, 4
  2668                                  
  2669                                  ;-321   prs("\nENDP");
  2670                                  
  2671                                  .dofunc117:
  2672 00000F7F 68[D50F]                 push dofunc_8
  2673 00000F82 E8D830                   call prs
  2674 00000F85 83C402                   add  sp, 2
  2675                                  
  2676                                  ;-322 }
  2677                                  
  2678                                  
  2679                                  ;-323 int isvariable() {
  2680 00000F88 C9                       LEAVE
  2681 00000F89 C3                       ret
  2682 00000F8A 46756E6374696F6E20-     dofunc_0 db "Function already defined",0
  2683 00000F93 616C72656164792064-
  2684 00000F9C 6566696E656400     
  2685 00000FA3 5C6E5C6E00              dofunc_1 db "\n\n",0
  2686 00000FA8 3A2050524F4300          dofunc_2 db ": PROC",0
  2687 00000FAF 3B5C6E20454E544552-     dofunc_3 db ";\n ENTER  ",0
  2688 00000FB8 202000             
  2689 00000FBB 2C3000                  dofunc_4 db ",0",0
  2690 00000FBE 5C6E202E7265746E00      dofunc_5 db "\n .retn",0
  2691 00000FC7 204C4541564500          dofunc_6 db " LEAVE",0
  2692 00000FCE 5C6E2072657400          dofunc_7 db "\n ret",0
  2693 00000FD5 5C6E454E445000          dofunc_8 db "\nENDP",0
  2694                                  ENDP
  2695                                  
  2696                                  isvariable: PROC
  2697                                  
  2698                                  ;-324     if(token==T_SIGNED)   goto v1;
  2699                                  
  2700 00000FDC A1[1E00]                 mov ax, [token]
  2701 00000FDF 3D1302                   cmp ax, 531
  2702 00000FE2 0F850300                 jne .isvariable118
  2703 00000FE6 E93A00                   jmp .v1
  2704                                  
  2705                                  ;-325     if(token==T_UNSIGNED) goto v1;
  2706                                  
  2707                                  .isvariable118:
  2708 00000FE9 A1[1E00]                 mov ax, [token]
  2709 00000FEC 3D1402                   cmp ax, 532
  2710 00000FEF 0F850300                 jne .isvariable119
  2711 00000FF3 E92D00                   jmp .v1
  2712                                  
  2713                                  ;-326     if(token==T_CHAR)     goto v1;
  2714                                  
  2715                                  .isvariable119:
  2716 00000FF6 A1[1E00]                 mov ax, [token]
  2717 00000FF9 3D1202                   cmp ax, 530
  2718 00000FFC 0F850300                 jne .isvariable120
  2719 00001000 E92000                   jmp .v1
  2720                                  
  2721                                  ;-327     if(token==T_INT)      goto v1;
  2722                                  
  2723                                  .isvariable120:
  2724 00001003 A1[1E00]                 mov ax, [token]
  2725 00001006 3D0502                   cmp ax, 517
  2726 00001009 0F850300                 jne .isvariable121
  2727 0000100D E91300                   jmp .v1
  2728                                  
  2729                                  ;-328     if(token==T_LONG)     goto v1;
  2730                                  
  2731                                  .isvariable121:
  2732 00001010 A1[1E00]                 mov ax, [token]
  2733 00001013 3D1502                   cmp ax, 533
  2734 00001016 0F850300                 jne .isvariable122
  2735 0000101A E90600                   jmp .v1
  2736                                  
  2737                                  ;-329     return 0;
  2738                                  
  2739                                  .isvariable122:
  2740 0000101D B80000                   mov ax, 0
  2741 00001020 E90600                   jmp .retnisvariable
  2742                                  
  2743                                  ;-330 v1: return 1;
  2744                                  
  2745                                  .v1:
  2746 00001023 B80100                   mov ax, 1
  2747 00001026 E90000                   jmp .retnisvariable
  2748                                  
  2749                                  ;-331 }
  2750                                  
  2751                                  
  2752                                  ;-332 
  2753                                  
  2754                                  
  2755                                  ;-333 int mod1; int ireg1; int idx1; int ids1; int idw1; int idt1; int val1;
  2756                                  
  2757                                   .retnisvariable:
  2758 00001029 C3                       ret
  2759                                  ENDP
  2760 0000102A 0000                    mod1 dw 0
  2761 0000102C 0000                    ireg1 dw 0
  2762 0000102E 0000                    idx1 dw 0
  2763 00001030 0000                    ids1 dw 0
  2764 00001032 0000                    idw1 dw 0
  2765 00001034 0000                    idt1 dw 0
  2766 00001036 0000                    val1 dw 0
  2767                                  
  2768                                  ;-334 int mod2; int ireg2; int idx2; int ids2; int idw2; int idt2; int val2;
  2769                                  
  2770 00001038 0000                    mod2 dw 0
  2771 0000103A 0000                    ireg2 dw 0
  2772 0000103C 0000                    idx2 dw 0
  2773 0000103E 0000                    ids2 dw 0
  2774 00001040 0000                    idw2 dw 0
  2775 00001042 0000                    idt2 dw 0
  2776 00001044 0000                    val2 dw 0
  2777                                  
  2778                                  ;-335 
  2779                                  
  2780                                  
  2781                                  ;-336 int pexpr() {expect('('); iscmp=0;
  2782                                  
  2783                                  
  2784                                  pexpr: PROC
  2785 00001046 6A28                     push 40
  2786 00001048 E8FF2E                   call expect
  2787 0000104B 83C402                   add  sp, 2
  2788 0000104E B80000                   mov ax, 0
  2789 00001051 A3[2400]                 mov word [iscmp], ax
  2790                                  
  2791                                  ;-337   if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}
  2792                                  
  2793 00001054 A1[1E00]                 mov ax, [token]
  2794 00001057 3D0001                   cmp ax, 256
  2795 0000105A 0F853400                 jne .pexpr123
  2796 0000105E 68[BC10]                 push pexpr_0
  2797 00001061 8D06A36D                 lea  ax, [symbol]
  2798 00001065 50                       push ax
  2799 00001066 E82FF1                   call eqstr
  2800 00001069 83C404                   add  sp, 4
  2801 0000106C 08C0                     or  al, al
  2802 0000106E 0F840600                 je .pexpr124
  2803 00001072 E85E00                   call constantexpr
  2804 00001075 E94300                   jmp .retnpexpr
  2805                                  
  2806                                  ;-338     ireg1=checkreg();
  2807                                  
  2808                                  .pexpr124:
  2809 00001078 E89A07                   call checkreg
  2810 0000107B A3[2C10]                 mov word [ireg1], ax
  2811                                  
  2812                                  ;-339     if (ireg1) { doreg1(1); return; }  }
  2813                                  
  2814 0000107E A1[2C10]                 mov ax, [ireg1]
  2815 00001081 08C0                     or  al, al
  2816 00001083 0F840B00                 je .pexpr125
  2817 00001087 6A01                     push 1
  2818 00001089 E89D05                   call doreg1
  2819 0000108C 83C402                   add  sp, 2
  2820 0000108F E92900                   jmp .retnpexpr
  2821                                  .pexpr125:
  2822                                  
  2823                                  ;-340   exprstart(); if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);
  2824                                  
  2825                                  .pexpr123:
  2826 00001092 E83D01                   call exprstart
  2827 00001095 A1[2400]                 mov ax, [iscmp]
  2828 00001098 83F800                   cmp ax, 0
  2829 0000109B 0F850900                 jne .pexpr126
  2830 0000109F 68[BE10]                 push pexpr_1
  2831 000010A2 E8B82F                   call prs
  2832 000010A5 83C402                   add  sp, 2
  2833                                  .pexpr126:
  2834 000010A8 8D06236E                 lea  ax, [fname]
  2835 000010AC 50                       push ax
  2836 000010AD E8AD2F                   call prs
  2837 000010B0 83C402                   add  sp, 2
  2838                                  
  2839                                  ;-341   expect(')'); }           /*error1("Vergleich fehlt");*/
  2840                                  
  2841 000010B3 6A29                     push 41
  2842 000010B5 E8922E                   call expect
  2843 000010B8 83C402                   add  sp, 2
  2844                                  
  2845                                  ;-342 
  2846                                  
  2847                                  
  2848                                  ;-343 int constantexpr() { int mode; int id1;int ids;
  2849                                  
  2850                                   .retnpexpr:
  2851 000010BB C3                       ret
  2852 000010BC 5F00                    pexpr_0 db "_",0
  2853 000010BE 5C6E206F722020616C-     pexpr_1 db "\n or  al, al\n je .",0
  2854 000010C7 2C20616C5C6E206A65-
  2855 000010D0 202E00             
  2856                                  ENDP
  2857                                  
  2858                                  constantexpr: PROC
  2859                                  
  2860                                  ;-344   token=getlex();   mode=typeName();
  2861                                  
  2862                                  ;Function : constantexpr, Number of local variables: 3
  2863                                  ;   # type sign width addr used name   list of local variables
  2864                                  ;  200 var sign word   343 NULL mode = bp-2
  2865                                  ;  201 var sign word   343 NULL id1 = bp-4
  2866                                  ;  202 var sign word   343 NULL ids = bp-6;
  2867 000010D3 C8060000                 ENTER  6,0
  2868 000010D7 E82127                   call getlex
  2869 000010DA A3[1E00]                 mov word [token], ax
  2870 000010DD E84CF9                   call typeName
  2871 000010E0 8946FE                   mov [bp-2], ax
  2872                                  
  2873                                  ;-345   id1=searchname(); gettypes(id1); ids=signi;
  2874                                  
  2875 000010E3 E877F8                   call searchname
  2876 000010E6 8946FC                   mov [bp-4], ax
  2877 000010E9 FF76FC                   push word [bp-4]
  2878 000010EC E830F7                   call gettypes
  2879 000010EF 83C402                   add  sp, 2
  2880 000010F2 A1[3500]                 mov ax, [signi]
  2881 000010F5 8946FA                   mov [bp-6], ax
  2882                                  
  2883                                  ;-346   if (isrelational() ==0) error1("Relational expression expected");
  2884                                  
  2885 000010F8 E89926                   call isrelational
  2886 000010FB 83F800                   cmp ax, 0
  2887 000010FE 0F850900                 jne .constantexpr127
  2888 00001102 68[8811]                 push constantexpr_0
  2889 00001105 E8B432                   call error1
  2890 00001108 83C402                   add  sp, 2
  2891                                  
  2892                                  ;-347   expect(T_CONST);  prs(" ; constant expression");
  2893                                  
  2894                                  .constantexpr127:
  2895 0000110B 680101                   push 257
  2896 0000110E E8392E                   call expect
  2897 00001111 83C402                   add  sp, 2
  2898 00001114 68[A711]                 push constantexpr_1
  2899 00001117 E8432F                   call prs
  2900 0000111A 83C402                   add  sp, 2
  2901                                  
  2902                                  ;-348   prs("\ncmp ");
  2903                                  
  2904 0000111D 68[BE11]                 push constantexpr_2
  2905 00001120 E83A2F                   call prs
  2906 00001123 83C402                   add  sp, 2
  2907                                  
  2908                                  ;-349   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  2909                                  
  2910 00001126 FF76FC                   push word [bp-4]
  2911 00001129 E8F3F6                   call gettypes
  2912 0000112C 83C402                   add  sp, 2
  2913 0000112F A1[3B00]                 mov ax, [wi]
  2914 00001132 83F802                   cmp ax, 2
  2915 00001135 0F850C00                 jne .constantexpr128
  2916 00001139 68[C511]                 push constantexpr_3
  2917 0000113C E81E2F                   call prs
  2918 0000113F 83C402                   add  sp, 2
  2919 00001142 E90900                   jmp .constantexpr129
  2920                                  .constantexpr128:
  2921 00001145 68[CA11]                 push constantexpr_4
  2922 00001148 E8122F                   call prs
  2923 0000114B 83C402                   add  sp, 2
  2924                                  
  2925                                  ;-350   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);
  2926                                  
  2927                                  .constantexpr129:
  2928 0000114E FF76FC                   push word [bp-4]
  2929 00001151 E81DF2                   call v
  2930 00001154 83C402                   add  sp, 2
  2931 00001157 68[CF11]                 push constantexpr_5
  2932 0000115A E8002F                   call prs
  2933 0000115D 83C402                   add  sp, 2
  2934 00001160 FF36[3000]               push word [lexval]
  2935 00001164 E84B30                   call prunsign1
  2936 00001167 83C402                   add  sp, 2
  2937 0000116A FF76FA                   push word [bp-6]
  2938 0000116D E86623                   call cmpneg
  2939 00001170 83C402                   add  sp, 2
  2940 00001173 8D06236E                 lea  ax, [fname]
  2941 00001177 50                       push ax
  2942 00001178 E8E22E                   call prs
  2943 0000117B 83C402                   add  sp, 2
  2944                                  
  2945                                  ;-351   expect(')');
  2946                                  
  2947 0000117E 6A29                     push 41
  2948 00001180 E8C72D                   call expect
  2949 00001183 83C402                   add  sp, 2
  2950                                  
  2951                                  ;-352 }
  2952                                  
  2953                                  
  2954                                  ;-353 int exprstart() { if (eqstr(symbol, "_")) expr2(0); else expr(0); }
  2955 00001186 C9                       LEAVE
  2956 00001187 C3                       ret
  2957 00001188 52656C6174696F6E61-     constantexpr_0 db "Relational expression expected",0
  2958 00001191 6C2065787072657373-
  2959 0000119A 696F6E206578706563-
  2960 000011A3 74656400           
  2961 000011A7 203B20636F6E737461-     constantexpr_1 db " ; constant expression",0
  2962 000011B0 6E7420657870726573-
  2963 000011B9 73696F6E00         
  2964 000011BE 5C6E636D702000          constantexpr_2 db "\ncmp ",0
  2965 000011C5 776F726400              constantexpr_3 db "word",0
  2966 000011CA 6279746500              constantexpr_4 db "byte",0
  2967 000011CF 2C2000                  constantexpr_5 db ", ",0
  2968                                  ENDP
  2969                                  
  2970                                  exprstart: PROC
  2971 000011D2 68[FA11]                 push exprstart_0
  2972 000011D5 8D06A36D                 lea  ax, [symbol]
  2973 000011D9 50                       push ax
  2974 000011DA E8BBEF                   call eqstr
  2975 000011DD 83C404                   add  sp, 4
  2976 000011E0 08C0                     or  al, al
  2977 000011E2 0F840B00                 je .exprstart130
  2978 000011E6 6A00                     push 0
  2979 000011E8 E81100                   call expr2
  2980 000011EB 83C402                   add  sp, 2
  2981 000011EE E90800                   jmp .exprstart131
  2982                                  .exprstart130:
  2983 000011F1 6A00                     push 0
  2984 000011F3 E89E0A                   call expr
  2985 000011F6 83C402                   add  sp, 2
  2986                                  .exprstart131:
  2987                                  
  2988                                  ;-354 
  2989                                  
  2990                                  
  2991                                  ;-355 int expr2(int kind) {  int i;
  2992                                  
  2993 000011F9 C3                       ret
  2994 000011FA 5F00                    exprstart_0 db "_",0
  2995                                  ENDP
  2996                                  
  2997                                  expr2: PROC
  2998                                  
  2999                                  ;-356   if(kind != 1) token=getlex();
  3000                                  
  3001                                  ;Function : expr2, Number of local variables: 2
  3002                                  ;   # type sign width addr used name   list of local variables
  3003                                  ;  200 var sign word   355 NULL kind = bp+4
  3004                                  ;  201 var sign word   355 NULL i = bp-2;
  3005 000011FC C8020000                 ENTER  2,0
  3006 00001200 8B4604                   mov ax, [bp+4]
  3007 00001203 83F801                   cmp ax, 1
  3008 00001206 0F840600                 je  .expr2132
  3009 0000120A E8EE25                   call getlex
  3010 0000120D A3[1E00]                 mov word [token], ax
  3011                                  
  3012                                  ;-357   mod1=typeName();
  3013                                  
  3014                                  .expr2132:
  3015 00001210 E819F8                   call typeName
  3016 00001213 A3[2A10]                 mov word [mod1], ax
  3017                                  
  3018                                  ;-358   if (mod1) error1("Noch kein & und * im Text (Linke Hand) erlaubt");
  3019                                  
  3020 00001216 A1[2A10]                 mov ax, [mod1]
  3021 00001219 08C0                     or  al, al
  3022 0000121B 0F840900                 je .expr2133
  3023 0000121F 68[B414]                 push expr2_0
  3024 00001222 E89731                   call error1
  3025 00001225 83C402                   add  sp, 2
  3026                                  
  3027                                  ;-359   ireg1=checkreg();
  3028                                  
  3029                                  .expr2133:
  3030 00001228 E8EA05                   call checkreg
  3031 0000122B A3[2C10]                 mov word [ireg1], ax
  3032                                  
  3033                                  ;-360   if (ireg1) { doreg1(0); return; }
  3034                                  
  3035 0000122E A1[2C10]                 mov ax, [ireg1]
  3036 00001231 08C0                     or  al, al
  3037 00001233 0F840B00                 je .expr2134
  3038 00001237 6A00                     push 0
  3039 00001239 E8ED03                   call doreg1
  3040 0000123C 83C402                   add  sp, 2
  3041 0000123F E97002                   jmp .retnexpr2
  3042                                  
  3043                                  ;-361   if (ireg1 == 0) { idx1=searchname();
  3044                                  
  3045                                  .expr2134:
  3046 00001242 A1[2C10]                 mov ax, [ireg1]
  3047 00001245 83F800                   cmp ax, 0
  3048 00001248 0F853400                 jne .expr2135
  3049 0000124C E80EF7                   call searchname
  3050 0000124F A3[2E10]                 mov word [idx1], ax
  3051                                  
  3052                                  ;-362     gettypes(idx1); ids1=signi; idw1=wi; idt1=typei;
  3053                                  
  3054 00001252 FF36[2E10]               push word [idx1]
  3055 00001256 E8C6F5                   call gettypes
  3056 00001259 83C402                   add  sp, 2
  3057 0000125C A1[3500]                 mov ax, [signi]
  3058 0000125F A3[3010]                 mov word [ids1], ax
  3059 00001262 A1[3B00]                 mov ax, [wi]
  3060 00001265 A3[3210]                 mov word [idw1], ax
  3061 00001268 A1[3200]                 mov ax, [typei]
  3062 0000126B A3[3410]                 mov word [idt1], ax
  3063                                  
  3064                                  ;-363     if (idt1)  error1("Noch kein Array oder Pointer links erlaubt");  }
  3065                                  
  3066 0000126E A1[3410]                 mov ax, [idt1]
  3067 00001271 08C0                     or  al, al
  3068 00001273 0F840900                 je .expr2136
  3069 00001277 68[E314]                 push expr2_1
  3070 0000127A E83F31                   call error1
  3071 0000127D 83C402                   add  sp, 2
  3072                                  .expr2136:
  3073                                  
  3074                                  ;-364 
  3075                                  
  3076                                  
  3077                                  ;-365   if (isrelational()) { error1("Vergleich noch nicht implementiert");
  3078                                  
  3079                                  .expr2135:
  3080 00001280 E81125                   call isrelational
  3081 00001283 08C0                     or  al, al
  3082 00001285 0F840900                 je .expr2137
  3083 00001289 68[0E15]                 push expr2_2
  3084 0000128C E82D31                   call error1
  3085 0000128F 83C402                   add  sp, 2
  3086                                  
  3087                                  ;-366   }
  3088                                  
  3089                                  
  3090                                  ;-367   if (istoken('=') == 0) error1("Assign expected");
  3091                                  
  3092                                  .expr2137:
  3093 00001292 6A3D                     push 61
  3094 00001294 E8912C                   call istoken
  3095 00001297 83C402                   add  sp, 2
  3096 0000129A 83F800                   cmp ax, 0
  3097 0000129D 0F850900                 jne .expr2138
  3098 000012A1 68[3115]                 push expr2_3
  3099 000012A4 E81531                   call error1
  3100 000012A7 83C402                   add  sp, 2
  3101                                  
  3102                                  ;-368   if (istoken(T_CONST) ) { val2=lexval; prs(" ; constant expression");
  3103                                  
  3104                                  .expr2138:
  3105 000012AA 680101                   push 257
  3106 000012AD E8782C                   call istoken
  3107 000012B0 83C402                   add  sp, 2
  3108 000012B3 08C0                     or  al, al
  3109 000012B5 0F849A00                 je .expr2139
  3110 000012B9 A1[3000]                 mov ax, [lexval]
  3111 000012BC A3[4410]                 mov word [val2], ax
  3112 000012BF 68[4115]                 push expr2_4
  3113 000012C2 E8982D                   call prs
  3114 000012C5 83C402                   add  sp, 2
  3115                                  
  3116                                  ;-369     prs("\nmov ");
  3117                                  
  3118 000012C8 68[5815]                 push expr2_5
  3119 000012CB E88F2D                   call prs
  3120 000012CE 83C402                   add  sp, 2
  3121                                  
  3122                                  ;-370     if (idw1 == 1) prs("byte ");
  3123                                  
  3124 000012D1 A1[3210]                 mov ax, [idw1]
  3125 000012D4 83F801                   cmp ax, 1
  3126 000012D7 0F850900                 jne .expr2140
  3127 000012DB 68[5F15]                 push expr2_6
  3128 000012DE E87C2D                   call prs
  3129 000012E1 83C402                   add  sp, 2
  3130                                  
  3131                                  ;-371     if (idw1 == 2) prs("word ");
  3132                                  
  3133                                  .expr2140:
  3134 000012E4 A1[3210]                 mov ax, [idw1]
  3135 000012E7 83F802                   cmp ax, 2
  3136 000012EA 0F850900                 jne .expr2141
  3137 000012EE 68[6515]                 push expr2_7
  3138 000012F1 E8692D                   call prs
  3139 000012F4 83C402                   add  sp, 2
  3140                                  
  3141                                  ;-372     if (idw1 == 4) prs("dword ");
  3142                                  
  3143                                  .expr2141:
  3144 000012F7 A1[3210]                 mov ax, [idw1]
  3145 000012FA 83F804                   cmp ax, 4
  3146 000012FD 0F850900                 jne .expr2142
  3147 00001301 68[6B15]                 push expr2_8
  3148 00001304 E8562D                   call prs
  3149 00001307 83C402                   add  sp, 2
  3150                                  
  3151                                  ;-373     v(idx1);
  3152                                  
  3153                                  .expr2142:
  3154 0000130A FF36[2E10]               push word [idx1]
  3155 0000130E E860F0                   call v
  3156 00001311 83C402                   add  sp, 2
  3157                                  
  3158                                  ;-374     prs(", "); prunsign1(val2);
  3159                                  
  3160 00001314 68[7215]                 push expr2_9
  3161 00001317 E8432D                   call prs
  3162 0000131A 83C402                   add  sp, 2
  3163 0000131D FF36[4410]               push word [val2]
  3164 00001321 E88E2E                   call prunsign1
  3165 00001324 83C402                   add  sp, 2
  3166                                  
  3167                                  ;-375     if (idx1 >= LSTART) { i=adrofname(idx1);  prs("; "); prs(i); } return; }
  3168                                  
  3169 00001327 A1[2E10]                 mov ax, [idx1]
  3170 0000132A 3DC800                   cmp ax, 200 ;unsigned : 1
  3171 0000132D 0F8C1F00                 jl  .expr2143
  3172 00001331 FF36[2E10]               push word [idx1]
  3173 00001335 E89EF5                   call adrofname
  3174 00001338 83C402                   add  sp, 2
  3175 0000133B 8946FE                   mov [bp-2], ax
  3176 0000133E 68[7515]                 push expr2_10
  3177 00001341 E8192D                   call prs
  3178 00001344 83C402                   add  sp, 2
  3179 00001347 FF76FE                   push word [bp-2]
  3180 0000134A E8102D                   call prs
  3181 0000134D 83C402                   add  sp, 2
  3182                                  .expr2143:
  3183 00001350 E95F01                   jmp .retnexpr2
  3184                                  
  3185                                  ;-376 
  3186                                  
  3187                                  
  3188                                  ;-377   mod1=typeName(); ireg2=checkreg();
  3189                                  
  3190                                  .expr2139:
  3191 00001353 E8D6F6                   call typeName
  3192 00001356 A3[2A10]                 mov word [mod1], ax
  3193 00001359 E8B904                   call checkreg
  3194 0000135C A3[3A10]                 mov word [ireg2], ax
  3195                                  
  3196                                  ;-378   if (ireg2) { prs("\nmov ");
  3197                                  
  3198 0000135F A1[3A10]                 mov ax, [ireg2]
  3199 00001362 08C0                     or  al, al
  3200 00001364 0F844200                 je .expr2144
  3201 00001368 68[7815]                 push expr2_11
  3202 0000136B E8EF2C                   call prs
  3203 0000136E 83C402                   add  sp, 2
  3204                                  
  3205                                  ;-379     if (ireg1) printreg(ireg1); 
  3206                                  
  3207 00001371 A1[2C10]                 mov ax, [ireg1]
  3208 00001374 08C0                     or  al, al
  3209 00001376 0F840D00                 je .expr2145
  3210 0000137A FF36[2C10]               push word [ireg1]
  3211 0000137E E8A208                   call printreg
  3212 00001381 83C402                   add  sp, 2
  3213                                  
  3214                                  ;-380         else v(idx1); 
  3215                                  
  3216 00001384 E90A00                   jmp .expr2146
  3217                                  .expr2145:
  3218 00001387 FF36[2E10]               push word [idx1]
  3219 0000138B E8E3EF                   call v
  3220 0000138E 83C402                   add  sp, 2
  3221                                  
  3222                                  ;-381             prs(", "); printreg(ireg2);return;
  3223                                  
  3224                                  .expr2146:
  3225 00001391 68[7F15]                 push expr2_12
  3226 00001394 E8C62C                   call prs
  3227 00001397 83C402                   add  sp, 2
  3228 0000139A FF36[3A10]               push word [ireg2]
  3229 0000139E E88208                   call printreg
  3230 000013A1 83C402                   add  sp, 2
  3231 000013A4 E90B01                   jmp .retnexpr2
  3232                                  
  3233                                  ;-382             }
  3234                                  
  3235                                  
  3236                                  ;-383   else {
  3237                                  
  3238 000013A7 E9FF00                   jmp .expr2147
  3239                                  .expr2144:
  3240                                  
  3241                                  ;-384     if (mod1 == 1) error1("Noch kein * im Text erlaubt");
  3242                                  
  3243 000013AA A1[2A10]                 mov ax, [mod1]
  3244 000013AD 83F801                   cmp ax, 1
  3245 000013B0 0F850900                 jne .expr2148
  3246 000013B4 68[8215]                 push expr2_13
  3247 000013B7 E80230                   call error1
  3248 000013BA 83C402                   add  sp, 2
  3249                                  
  3250                                  ;-385 
  3251                                  
  3252                                  
  3253                                  ;-386     idx2=searchname();
  3254                                  
  3255                                  .expr2148:
  3256 000013BD E89DF5                   call searchname
  3257 000013C0 A3[3C10]                 mov word [idx2], ax
  3258                                  
  3259                                  ;-387     gettypes(idx2); ids2=signi; idw2=wi; idt2=typei;
  3260                                  
  3261 000013C3 FF36[3C10]               push word [idx2]
  3262 000013C7 E855F4                   call gettypes
  3263 000013CA 83C402                   add  sp, 2
  3264 000013CD A1[3500]                 mov ax, [signi]
  3265 000013D0 A3[3E10]                 mov word [ids2], ax
  3266 000013D3 A1[3B00]                 mov ax, [wi]
  3267 000013D6 A3[4010]                 mov word [idw2], ax
  3268 000013D9 A1[3200]                 mov ax, [typei]
  3269 000013DC A3[4210]                 mov word [idt2], ax
  3270                                  
  3271                                  ;-388     if (idt2 == 1)  error1("Noch kein Array rechts erlaubt");
  3272                                  
  3273 000013DF A1[4210]                 mov ax, [idt2]
  3274 000013E2 83F801                   cmp ax, 1
  3275 000013E5 0F850900                 jne .expr2149
  3276 000013E9 68[9E15]                 push expr2_14
  3277 000013EC E8CD2F                   call error1
  3278 000013EF 83C402                   add  sp, 2
  3279                                  
  3280                                  ;-389     prs("\nmov ");
  3281                                  
  3282                                  .expr2149:
  3283 000013F2 68[BD15]                 push expr2_15
  3284 000013F5 E8652C                   call prs
  3285 000013F8 83C402                   add  sp, 2
  3286                                  
  3287                                  ;-390     if (ireg1) printreg(ireg1); 
  3288                                  
  3289 000013FB A1[2C10]                 mov ax, [ireg1]
  3290 000013FE 08C0                     or  al, al
  3291 00001400 0F840D00                 je .expr2150
  3292 00001404 FF36[2C10]               push word [ireg1]
  3293 00001408 E81808                   call printreg
  3294 0000140B 83C402                   add  sp, 2
  3295                                  
  3296                                  ;-391         else error1("Mem to Mem not allowed by x86-CPU");
  3297                                  
  3298 0000140E E90900                   jmp .expr2151
  3299                                  .expr2150:
  3300 00001411 68[C415]                 push expr2_16
  3301 00001414 E8A52F                   call error1
  3302 00001417 83C402                   add  sp, 2
  3303                                  
  3304                                  ;-392     prs(", ");
  3305                                  
  3306                                  .expr2151:
  3307 0000141A 68[E615]                 push expr2_17
  3308 0000141D E83D2C                   call prs
  3309 00001420 83C402                   add  sp, 2
  3310                                  
  3311                                  ;-393     if (mod1 == 2) a(idx2);
  3312                                  
  3313 00001423 A1[2A10]                 mov ax, [mod1]
  3314 00001426 83F802                   cmp ax, 2
  3315 00001429 0F850D00                 jne .expr2152
  3316 0000142D FF36[3C10]               push word [idx2]
  3317 00001431 E82EEF                   call a
  3318 00001434 83C402                   add  sp, 2
  3319                                  
  3320                                  ;-394     else {
  3321                                  
  3322 00001437 E96C00                   jmp .expr2153
  3323                                  .expr2152:
  3324                                  
  3325                                  ;-395       if (idw2 == 1) prs("byte ");
  3326                                  
  3327 0000143A A1[4010]                 mov ax, [idw2]
  3328 0000143D 83F801                   cmp ax, 1
  3329 00001440 0F850900                 jne .expr2154
  3330 00001444 68[E915]                 push expr2_18
  3331 00001447 E8132C                   call prs
  3332 0000144A 83C402                   add  sp, 2
  3333                                  
  3334                                  ;-396       if (idw2 == 2) prs("word ");
  3335                                  
  3336                                  .expr2154:
  3337 0000144D A1[4010]                 mov ax, [idw2]
  3338 00001450 83F802                   cmp ax, 2
  3339 00001453 0F850900                 jne .expr2155
  3340 00001457 68[EF15]                 push expr2_19
  3341 0000145A E8002C                   call prs
  3342 0000145D 83C402                   add  sp, 2
  3343                                  
  3344                                  ;-397       if (idw2 == 4) prs("dword ");
  3345                                  
  3346                                  .expr2155:
  3347 00001460 A1[4010]                 mov ax, [idw2]
  3348 00001463 83F804                   cmp ax, 4
  3349 00001466 0F850900                 jne .expr2156
  3350 0000146A 68[F515]                 push expr2_20
  3351 0000146D E8ED2B                   call prs
  3352 00001470 83C402                   add  sp, 2
  3353                                  
  3354                                  ;-398       v(idx2);
  3355                                  
  3356                                  .expr2156:
  3357 00001473 FF36[3C10]               push word [idx2]
  3358 00001477 E8F7EE                   call v
  3359 0000147A 83C402                   add  sp, 2
  3360                                  
  3361                                  ;-399       if (idx2 >= LSTART) { i=adrofname(idx2);  prs("; "); prs(i); }  }
  3362                                  
  3363 0000147D A1[3C10]                 mov ax, [idx2]
  3364 00001480 3DC800                   cmp ax, 200 ;unsigned : 1
  3365 00001483 0F8C1F00                 jl  .expr2157
  3366 00001487 FF36[3C10]               push word [idx2]
  3367 0000148B E848F4                   call adrofname
  3368 0000148E 83C402                   add  sp, 2
  3369 00001491 8946FE                   mov [bp-2], ax
  3370 00001494 68[FC15]                 push expr2_21
  3371 00001497 E8C32B                   call prs
  3372 0000149A 83C402                   add  sp, 2
  3373 0000149D FF76FE                   push word [bp-2]
  3374 000014A0 E8BA2B                   call prs
  3375 000014A3 83C402                   add  sp, 2
  3376                                  .expr2157:
  3377                                  
  3378                                  ;-400     return;
  3379                                  
  3380                                  .expr2153:
  3381 000014A6 E90900                   jmp .retnexpr2
  3382                                  
  3383                                  ;-401   } error1("Internal error: only const or reg allowed");
  3384                                  
  3385                                  .expr2147:
  3386 000014A9 68[FF15]                 push expr2_22
  3387 000014AC E80D2F                   call error1
  3388 000014AF 83C402                   add  sp, 2
  3389                                  
  3390                                  ;-402 }
  3391                                  
  3392                                  
  3393                                  ;-403 char ops[5];
  3394                                  
  3395 000014B2 C9                       .retnexpr2: LEAVE
  3396 000014B3 C3                       ret
  3397 000014B4 4E6F6368206B65696E-     expr2_0 db "Noch kein & und * im Text (Linke Hand) erlaubt",0
  3398 000014BD 202620756E64202A20-
  3399 000014C6 696D20546578742028-
  3400 000014CF 4C696E6B652048616E-
  3401 000014D8 64292065726C617562-
  3402 000014E1 7400               
  3403 000014E3 4E6F6368206B65696E-     expr2_1 db "Noch kein Array oder Pointer links erlaubt",0
  3404 000014EC 204172726179206F64-
  3405 000014F5 657220506F696E7465-
  3406 000014FE 72206C696E6B732065-
  3407 00001507 726C6175627400     
  3408 0000150E 566572676C65696368-     expr2_2 db "Vergleich noch nicht implementiert",0
  3409 00001517 206E6F6368206E6963-
  3410 00001520 687420696D706C656D-
  3411 00001529 656E746965727400   
  3412 00001531 41737369676E206578-     expr2_3 db "Assign expected",0
  3413 0000153A 70656374656400     
  3414 00001541 203B20636F6E737461-     expr2_4 db " ; constant expression",0
  3415 0000154A 6E7420657870726573-
  3416 00001553 73696F6E00         
  3417 00001558 5C6E6D6F762000          expr2_5 db "\nmov ",0
  3418 0000155F 627974652000            expr2_6 db "byte ",0
  3419 00001565 776F72642000            expr2_7 db "word ",0
  3420 0000156B 64776F72642000          expr2_8 db "dword ",0
  3421 00001572 2C2000                  expr2_9 db ", ",0
  3422 00001575 3B2000                  expr2_10 db "; ",0
  3423 00001578 5C6E6D6F762000          expr2_11 db "\nmov ",0
  3424 0000157F 2C2000                  expr2_12 db ", ",0
  3425 00001582 4E6F6368206B65696E-     expr2_13 db "Noch kein * im Text erlaubt",0
  3426 0000158B 202A20696D20546578-
  3427 00001594 742065726C61756274-
  3428 0000159D 00                 
  3429 0000159E 4E6F6368206B65696E-     expr2_14 db "Noch kein Array rechts erlaubt",0
  3430 000015A7 204172726179207265-
  3431 000015B0 636874732065726C61-
  3432 000015B9 75627400           
  3433 000015BD 5C6E6D6F762000          expr2_15 db "\nmov ",0
  3434 000015C4 4D656D20746F204D65-     expr2_16 db "Mem to Mem not allowed by x86-CPU",0
  3435 000015CD 6D206E6F7420616C6C-
  3436 000015D6 6F7765642062792078-
  3437 000015DF 38362D43505500     
  3438 000015E6 2C2000                  expr2_17 db ", ",0
  3439 000015E9 627974652000            expr2_18 db "byte ",0
  3440 000015EF 776F72642000            expr2_19 db "word ",0
  3441 000015F5 64776F72642000          expr2_20 db "dword ",0
  3442 000015FC 3B2000                  expr2_21 db "; ",0
  3443 000015FF 496E7465726E616C20-     expr2_22 db "Internal error: only const or reg allowed",0
  3444 00001608 6572726F723A206F6E-
  3445 00001611 6C7920636F6E737420-
  3446 0000161A 6F722072656720616C-
  3447 00001623 6C6F77656400       
  3448                                  ENDP
  3449                                  section .bss
  3450                                  absolute 48406
  3451 0000BD16 <res 00000005>          ops resb 5
  3452                                  section .text
  3453                                  
  3454                                  ;-404 int doreg1(int iscmp1) { int i;
  3455                                  
  3456                                  
  3457                                  doreg1: PROC
  3458                                  
  3459                                  ;-405   if (istoken('='))          strcpy(ops, "mov");
  3460                                  
  3461                                  ;Function : doreg1, Number of local variables: 2
  3462                                  ;   # type sign width addr used name   list of local variables
  3463                                  ;  200 var sign word   404 NULL iscmp1 = bp+4
  3464                                  ;  201 var sign word   404 NULL i = bp-2;
  3465 00001629 C8020000                 ENTER  2,0
  3466 0000162D 6A3D                     push 61
  3467 0000162F E8F628                   call istoken
  3468 00001632 83C402                   add  sp, 2
  3469 00001635 08C0                     or  al, al
  3470 00001637 0F840E00                 je .doreg1158
  3471 0000163B 68[DC17]                 push doreg1_0
  3472 0000163E 8D0616BD                 lea  ax, [ops]
  3473 00001642 50                       push ax
  3474 00001643 E822EB                   call strcpy
  3475 00001646 83C404                   add  sp, 4
  3476                                  
  3477                                  ;-406   if (istoken(T_PLUSASS))    strcpy(ops, "add");
  3478                                  
  3479                                  .doreg1158:
  3480 00001649 68CE04                   push 1230
  3481 0000164C E8D928                   call istoken
  3482 0000164F 83C402                   add  sp, 2
  3483 00001652 08C0                     or  al, al
  3484 00001654 0F840E00                 je .doreg1159
  3485 00001658 68[E017]                 push doreg1_1
  3486 0000165B 8D0616BD                 lea  ax, [ops]
  3487 0000165F 50                       push ax
  3488 00001660 E805EB                   call strcpy
  3489 00001663 83C404                   add  sp, 4
  3490                                  
  3491                                  ;-407   if (istoken(T_MINUSASS))   strcpy(ops, "sub");
  3492                                  
  3493                                  .doreg1159:
  3494 00001666 68CF04                   push 1231
  3495 00001669 E8BC28                   call istoken
  3496 0000166C 83C402                   add  sp, 2
  3497 0000166F 08C0                     or  al, al
  3498 00001671 0F840E00                 je .doreg1160
  3499 00001675 68[E417]                 push doreg1_2
  3500 00001678 8D0616BD                 lea  ax, [ops]
  3501 0000167C 50                       push ax
  3502 0000167D E8E8EA                   call strcpy
  3503 00001680 83C404                   add  sp, 4
  3504                                  
  3505                                  ;-408   if (istoken(T_ANDASS))     strcpy(ops, "and");
  3506                                  
  3507                                  .doreg1160:
  3508 00001683 68D204                   push 1234
  3509 00001686 E89F28                   call istoken
  3510 00001689 83C402                   add  sp, 2
  3511 0000168C 08C0                     or  al, al
  3512 0000168E 0F840E00                 je .doreg1161
  3513 00001692 68[E817]                 push doreg1_3
  3514 00001695 8D0616BD                 lea  ax, [ops]
  3515 00001699 50                       push ax
  3516 0000169A E8CBEA                   call strcpy
  3517 0000169D 83C404                   add  sp, 4
  3518                                  
  3519                                  ;-409   if (istoken(T_ORASS))      strcpy(ops, "or" );
  3520                                  
  3521                                  .doreg1161:
  3522 000016A0 68D304                   push 1235
  3523 000016A3 E88228                   call istoken
  3524 000016A6 83C402                   add  sp, 2
  3525 000016A9 08C0                     or  al, al
  3526 000016AB 0F840E00                 je .doreg1162
  3527 000016AF 68[EC17]                 push doreg1_4
  3528 000016B2 8D0616BD                 lea  ax, [ops]
  3529 000016B6 50                       push ax
  3530 000016B7 E8AEEA                   call strcpy
  3531 000016BA 83C404                   add  sp, 4
  3532                                  
  3533                                  ;-410   if (istoken(T_LESSLESS))   strcpy(ops, "shl");
  3534                                  
  3535                                  .doreg1162:
  3536 000016BD 68D804                   push 1240
  3537 000016C0 E86528                   call istoken
  3538 000016C3 83C402                   add  sp, 2
  3539 000016C6 08C0                     or  al, al
  3540 000016C8 0F840E00                 je .doreg1163
  3541 000016CC 68[EF17]                 push doreg1_5
  3542 000016CF 8D0616BD                 lea  ax, [ops]
  3543 000016D3 50                       push ax
  3544 000016D4 E891EA                   call strcpy
  3545 000016D7 83C404                   add  sp, 4
  3546                                  
  3547                                  ;-411   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");
  3548                                  
  3549                                  .doreg1163:
  3550 000016DA 68D904                   push 1241
  3551 000016DD E84828                   call istoken
  3552 000016E0 83C402                   add  sp, 2
  3553 000016E3 08C0                     or  al, al
  3554 000016E5 0F840E00                 je .doreg1164
  3555 000016E9 68[F317]                 push doreg1_6
  3556 000016EC 8D0616BD                 lea  ax, [ops]
  3557 000016F0 50                       push ax
  3558 000016F1 E874EA                   call strcpy
  3559 000016F4 83C404                   add  sp, 4
  3560                                  
  3561                                  ;-412   if (iscmp1 == 1) { token=getlex();
  3562                                  
  3563                                  .doreg1164:
  3564 000016F7 8B4604                   mov ax, [bp+4]
  3565 000016FA 83F801                   cmp ax, 1
  3566 000016FD 0F852700                 jne .doreg1165
  3567 00001701 E8F720                   call getlex
  3568 00001704 A3[1E00]                 mov word [token], ax
  3569                                  
  3570                                  ;-413       if (isrelational() ==0) error1("Relational expected");
  3571                                  
  3572 00001707 E88A20                   call isrelational
  3573 0000170A 83F800                   cmp ax, 0
  3574 0000170D 0F850900                 jne .doreg1166
  3575 00001711 68[F717]                 push doreg1_7
  3576 00001714 E8A52C                   call error1
  3577 00001717 83C402                   add  sp, 2
  3578                                  
  3579                                  ;-414       strcpy(ops, "cmp"); }
  3580                                  
  3581                                  .doreg1166:
  3582 0000171A 68[0B18]                 push doreg1_8
  3583 0000171D 8D0616BD                 lea  ax, [ops]
  3584 00001721 50                       push ax
  3585 00001722 E843EA                   call strcpy
  3586 00001725 83C404                   add  sp, 4
  3587                                  
  3588                                  ;-415   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");
  3589                                  
  3590                                  .doreg1165:
  3591 00001728 E82429                   call prnl
  3592 0000172B 8D0616BD                 lea  ax, [ops]
  3593 0000172F 50                       push ax
  3594 00001730 E82A29                   call prs
  3595 00001733 83C402                   add  sp, 2
  3596 00001736 68[0F18]                 push doreg1_9
  3597 00001739 E82129                   call prs
  3598 0000173C 83C402                   add  sp, 2
  3599 0000173F FF36[2C10]               push word [ireg1]
  3600 00001743 E8DD04                   call printreg
  3601 00001746 83C402                   add  sp, 2
  3602 00001749 68[1218]                 push doreg1_10
  3603 0000174C E80E29                   call prs
  3604 0000174F 83C402                   add  sp, 2
  3605                                  
  3606                                  ;-416 
  3607                                  
  3608                                  
  3609                                  ;-417   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}
  3610                                  
  3611 00001752 680101                   push 257
  3612 00001755 E8D027                   call istoken
  3613 00001758 83C402                   add  sp, 2
  3614 0000175B 08C0                     or  al, al
  3615 0000175D 0F840D00                 je .doreg1167
  3616 00001761 FF36[3000]               push word [lexval]
  3617 00001765 E84A2A                   call prunsign1
  3618 00001768 83C402                   add  sp, 2
  3619 0000176B E94700                   jmp .reg1
  3620                                  
  3621                                  ;-418   mod2=typeName(); ireg2=checkreg();
  3622                                  
  3623                                  .doreg1167:
  3624 0000176E E8BBF2                   call typeName
  3625 00001771 A3[3810]                 mov word [mod2], ax
  3626 00001774 E89E00                   call checkreg
  3627 00001777 A3[3A10]                 mov word [ireg2], ax
  3628                                  
  3629                                  ;-419   if (ireg2) {printreg(ireg2); goto reg1;}
  3630                                  
  3631 0000177A A1[3A10]                 mov ax, [ireg2]
  3632 0000177D 08C0                     or  al, al
  3633 0000177F 0F840D00                 je .doreg1168
  3634 00001783 FF36[3A10]               push word [ireg2]
  3635 00001787 E89904                   call printreg
  3636 0000178A 83C402                   add  sp, 2
  3637 0000178D E92500                   jmp .reg1
  3638                                  
  3639                                  ;-420   i=searchname();  if (mod2 == 2) a(i); else v(i);
  3640                                  
  3641                                  .doreg1168:
  3642 00001790 E8CAF1                   call searchname
  3643 00001793 8946FE                   mov [bp-2], ax
  3644 00001796 A1[3810]                 mov ax, [mod2]
  3645 00001799 83F802                   cmp ax, 2
  3646 0000179C 0F850C00                 jne .doreg1169
  3647 000017A0 FF76FE                   push word [bp-2]
  3648 000017A3 E8BCEB                   call a
  3649 000017A6 83C402                   add  sp, 2
  3650 000017A9 E90900                   jmp .doreg1170
  3651                                  .doreg1169:
  3652 000017AC FF76FE                   push word [bp-2]
  3653 000017AF E8BFEB                   call v
  3654 000017B2 83C402                   add  sp, 2
  3655                                  
  3656                                  ;-421   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }
  3657                                  
  3658                                  .doreg1170:
  3659                                  .reg1:
  3660 000017B5 8B4604                   mov ax, [bp+4]
  3661 000017B8 83F801                   cmp ax, 1
  3662 000017BB 0F851B00                 jne .doreg1171
  3663 000017BF 6A00                     push 0
  3664 000017C1 E8121D                   call cmpneg
  3665 000017C4 83C402                   add  sp, 2
  3666 000017C7 8D06236E                 lea  ax, [fname]
  3667 000017CB 50                       push ax
  3668 000017CC E88E28                   call prs
  3669 000017CF 83C402                   add  sp, 2
  3670 000017D2 6A29                     push 41
  3671 000017D4 E87327                   call expect
  3672 000017D7 83C402                   add  sp, 2
  3673                                  
  3674                                  ;-422 }
  3675                                  
  3676                                  .doreg1171:
  3677                                  
  3678                                  ;-423 int checkreg() { // >=17 = 16bit, >=47 = 32bit
  3679 000017DA C9                       LEAVE
  3680 000017DB C3                       ret
  3681 000017DC 6D6F7600                doreg1_0 db "mov",0
  3682 000017E0 61646400                doreg1_1 db "add",0
  3683 000017E4 73756200                doreg1_2 db "sub",0
  3684 000017E8 616E6400                doreg1_3 db "and",0
  3685 000017EC 6F7200                  doreg1_4 db "or",0
  3686 000017EF 73686C00                doreg1_5 db "shl",0
  3687 000017F3 73687200                doreg1_6 db "shr",0
  3688 000017F7 52656C6174696F6E61-     doreg1_7 db "Relational expected",0
  3689 00001800 6C2065787065637465-
  3690 00001809 6400               
  3691 0000180B 636D7000                doreg1_8 db "cmp",0
  3692 0000180F 202000                  doreg1_9 db "  ",0
  3693 00001812 2C2000                  doreg1_10 db ", ",0
  3694                                  ENDP
  3695                                  
  3696                                  checkreg: PROC
  3697                                  
  3698                                  ;-424   if (strlen(symbol) <  2) return 0;
  3699                                  
  3700 00001815 8D06A36D                 lea  ax, [symbol]
  3701 00001819 50                       push ax
  3702 0000181A E823E9                   call strlen
  3703 0000181D 83C402                   add  sp, 2
  3704 00001820 83F802                   cmp ax, 2
  3705 00001823 0F8D0600                 jge .checkreg172
  3706 00001827 B80000                   mov ax, 0
  3707 0000182A E94403                   jmp .retncheckreg
  3708                                  
  3709                                  ;-425   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;
  3710                                  
  3711                                  .checkreg172:
  3712 0000182D 68[721B]                 push checkreg_0
  3713 00001830 8D06A36D                 lea  ax, [symbol]
  3714 00001834 50                       push ax
  3715 00001835 E860E9                   call eqstr
  3716 00001838 83C404                   add  sp, 4
  3717 0000183B 08C0                     or  al, al
  3718 0000183D 0F840600                 je .checkreg173
  3719 00001841 B80100                   mov ax, 1
  3720 00001844 E92A03                   jmp .retncheckreg
  3721                                  .checkreg173:
  3722 00001847 68[751B]                 push checkreg_1
  3723 0000184A 8D06A36D                 lea  ax, [symbol]
  3724 0000184E 50                       push ax
  3725 0000184F E846E9                   call eqstr
  3726 00001852 83C404                   add  sp, 4
  3727 00001855 08C0                     or  al, al
  3728 00001857 0F840600                 je .checkreg174
  3729 0000185B B80300                   mov ax, 3
  3730 0000185E E91003                   jmp .retncheckreg
  3731                                  
  3732                                  ;-426   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;
  3733                                  
  3734                                  .checkreg174:
  3735 00001861 68[781B]                 push checkreg_2
  3736 00001864 8D06A36D                 lea  ax, [symbol]
  3737 00001868 50                       push ax
  3738 00001869 E82CE9                   call eqstr
  3739 0000186C 83C404                   add  sp, 4
  3740 0000186F 08C0                     or  al, al
  3741 00001871 0F840600                 je .checkreg175
  3742 00001875 B80500                   mov ax, 5
  3743 00001878 E9F602                   jmp .retncheckreg
  3744                                  .checkreg175:
  3745 0000187B 68[7B1B]                 push checkreg_3
  3746 0000187E 8D06A36D                 lea  ax, [symbol]
  3747 00001882 50                       push ax
  3748 00001883 E812E9                   call eqstr
  3749 00001886 83C404                   add  sp, 4
  3750 00001889 08C0                     or  al, al
  3751 0000188B 0F840600                 je .checkreg176
  3752 0000188F B80700                   mov ax, 7
  3753 00001892 E9DC02                   jmp .retncheckreg
  3754                                  
  3755                                  ;-427   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;
  3756                                  
  3757                                  .checkreg176:
  3758 00001895 68[7E1B]                 push checkreg_4
  3759 00001898 8D06A36D                 lea  ax, [symbol]
  3760 0000189C 50                       push ax
  3761 0000189D E8F8E8                   call eqstr
  3762 000018A0 83C404                   add  sp, 4
  3763 000018A3 08C0                     or  al, al
  3764 000018A5 0F840600                 je .checkreg177
  3765 000018A9 B80900                   mov ax, 9
  3766 000018AC E9C202                   jmp .retncheckreg
  3767                                  .checkreg177:
  3768 000018AF 68[811B]                 push checkreg_5
  3769 000018B2 8D06A36D                 lea  ax, [symbol]
  3770 000018B6 50                       push ax
  3771 000018B7 E8DEE8                   call eqstr
  3772 000018BA 83C404                   add  sp, 4
  3773 000018BD 08C0                     or  al, al
  3774 000018BF 0F840600                 je .checkreg178
  3775 000018C3 B80B00                   mov ax, 11
  3776 000018C6 E9A802                   jmp .retncheckreg
  3777                                  
  3778                                  ;-428   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;
  3779                                  
  3780                                  .checkreg178:
  3781 000018C9 68[841B]                 push checkreg_6
  3782 000018CC 8D06A36D                 lea  ax, [symbol]
  3783 000018D0 50                       push ax
  3784 000018D1 E8C4E8                   call eqstr
  3785 000018D4 83C404                   add  sp, 4
  3786 000018D7 08C0                     or  al, al
  3787 000018D9 0F840600                 je .checkreg179
  3788 000018DD B80D00                   mov ax, 13
  3789 000018E0 E98E02                   jmp .retncheckreg
  3790                                  .checkreg179:
  3791 000018E3 68[871B]                 push checkreg_7
  3792 000018E6 8D06A36D                 lea  ax, [symbol]
  3793 000018EA 50                       push ax
  3794 000018EB E8AAE8                   call eqstr
  3795 000018EE 83C404                   add  sp, 4
  3796 000018F1 08C0                     or  al, al
  3797 000018F3 0F840600                 je .checkreg180
  3798 000018F7 B80F00                   mov ax, 15
  3799 000018FA E97402                   jmp .retncheckreg
  3800                                  
  3801                                  ;-429   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;
  3802                                  
  3803                                  .checkreg180:
  3804 000018FD 68[8A1B]                 push checkreg_8
  3805 00001900 8D06A36D                 lea  ax, [symbol]
  3806 00001904 50                       push ax
  3807 00001905 E890E8                   call eqstr
  3808 00001908 83C404                   add  sp, 4
  3809 0000190B 08C0                     or  al, al
  3810 0000190D 0F840600                 je .checkreg181
  3811 00001911 B81100                   mov ax, 17
  3812 00001914 E95A02                   jmp .retncheckreg
  3813                                  .checkreg181:
  3814 00001917 68[8D1B]                 push checkreg_9
  3815 0000191A 8D06A36D                 lea  ax, [symbol]
  3816 0000191E 50                       push ax
  3817 0000191F E876E8                   call eqstr
  3818 00001922 83C404                   add  sp, 4
  3819 00001925 08C0                     or  al, al
  3820 00001927 0F840600                 je .checkreg182
  3821 0000192B B81300                   mov ax, 19
  3822 0000192E E94002                   jmp .retncheckreg
  3823                                  
  3824                                  ;-430   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;
  3825                                  
  3826                                  .checkreg182:
  3827 00001931 68[901B]                 push checkreg_10
  3828 00001934 8D06A36D                 lea  ax, [symbol]
  3829 00001938 50                       push ax
  3830 00001939 E85CE8                   call eqstr
  3831 0000193C 83C404                   add  sp, 4
  3832 0000193F 08C0                     or  al, al
  3833 00001941 0F840600                 je .checkreg183
  3834 00001945 B81500                   mov ax, 21
  3835 00001948 E92602                   jmp .retncheckreg
  3836                                  .checkreg183:
  3837 0000194B 68[931B]                 push checkreg_11
  3838 0000194E 8D06A36D                 lea  ax, [symbol]
  3839 00001952 50                       push ax
  3840 00001953 E842E8                   call eqstr
  3841 00001956 83C404                   add  sp, 4
  3842 00001959 08C0                     or  al, al
  3843 0000195B 0F840600                 je .checkreg184
  3844 0000195F B81700                   mov ax, 23
  3845 00001962 E90C02                   jmp .retncheckreg
  3846                                  
  3847                                  ;-431   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;
  3848                                  
  3849                                  .checkreg184:
  3850 00001965 68[961B]                 push checkreg_12
  3851 00001968 8D06A36D                 lea  ax, [symbol]
  3852 0000196C 50                       push ax
  3853 0000196D E828E8                   call eqstr
  3854 00001970 83C404                   add  sp, 4
  3855 00001973 08C0                     or  al, al
  3856 00001975 0F840600                 je .checkreg185
  3857 00001979 B81900                   mov ax, 25
  3858 0000197C E9F201                   jmp .retncheckreg
  3859                                  .checkreg185:
  3860 0000197F 68[991B]                 push checkreg_13
  3861 00001982 8D06A36D                 lea  ax, [symbol]
  3862 00001986 50                       push ax
  3863 00001987 E80EE8                   call eqstr
  3864 0000198A 83C404                   add  sp, 4
  3865 0000198D 08C0                     or  al, al
  3866 0000198F 0F840600                 je .checkreg186
  3867 00001993 B81B00                   mov ax, 27
  3868 00001996 E9D801                   jmp .retncheckreg
  3869                                  
  3870                                  ;-432   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;
  3871                                  
  3872                                  .checkreg186:
  3873 00001999 68[9C1B]                 push checkreg_14
  3874 0000199C 8D06A36D                 lea  ax, [symbol]
  3875 000019A0 50                       push ax
  3876 000019A1 E8F4E7                   call eqstr
  3877 000019A4 83C404                   add  sp, 4
  3878 000019A7 08C0                     or  al, al
  3879 000019A9 0F840600                 je .checkreg187
  3880 000019AD B81D00                   mov ax, 29
  3881 000019B0 E9BE01                   jmp .retncheckreg
  3882                                  .checkreg187:
  3883 000019B3 68[9F1B]                 push checkreg_15
  3884 000019B6 8D06A36D                 lea  ax, [symbol]
  3885 000019BA 50                       push ax
  3886 000019BB E8DAE7                   call eqstr
  3887 000019BE 83C404                   add  sp, 4
  3888 000019C1 08C0                     or  al, al
  3889 000019C3 0F840600                 je .checkreg188
  3890 000019C7 B81F00                   mov ax, 31
  3891 000019CA E9A401                   jmp .retncheckreg
  3892                                  
  3893                                  ;-433   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;
  3894                                  
  3895                                  .checkreg188:
  3896 000019CD 68[A21B]                 push checkreg_16
  3897 000019D0 8D06A36D                 lea  ax, [symbol]
  3898 000019D4 50                       push ax
  3899 000019D5 E8C0E7                   call eqstr
  3900 000019D8 83C404                   add  sp, 4
  3901 000019DB 08C0                     or  al, al
  3902 000019DD 0F840600                 je .checkreg189
  3903 000019E1 B82100                   mov ax, 33
  3904 000019E4 E98A01                   jmp .retncheckreg
  3905                                  .checkreg189:
  3906 000019E7 68[A51B]                 push checkreg_17
  3907 000019EA 8D06A36D                 lea  ax, [symbol]
  3908 000019EE 50                       push ax
  3909 000019EF E8A6E7                   call eqstr
  3910 000019F2 83C404                   add  sp, 4
  3911 000019F5 08C0                     or  al, al
  3912 000019F7 0F840600                 je .checkreg190
  3913 000019FB B82300                   mov ax, 35
  3914 000019FE E97001                   jmp .retncheckreg
  3915                                  
  3916                                  ;-434   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;
  3917                                  
  3918                                  .checkreg190:
  3919 00001A01 68[A81B]                 push checkreg_18
  3920 00001A04 8D06A36D                 lea  ax, [symbol]
  3921 00001A08 50                       push ax
  3922 00001A09 E88CE7                   call eqstr
  3923 00001A0C 83C404                   add  sp, 4
  3924 00001A0F 08C0                     or  al, al
  3925 00001A11 0F840600                 je .checkreg191
  3926 00001A15 B82500                   mov ax, 37
  3927 00001A18 E95601                   jmp .retncheckreg
  3928                                  .checkreg191:
  3929 00001A1B 68[AB1B]                 push checkreg_19
  3930 00001A1E 8D06A36D                 lea  ax, [symbol]
  3931 00001A22 50                       push ax
  3932 00001A23 E872E7                   call eqstr
  3933 00001A26 83C404                   add  sp, 4
  3934 00001A29 08C0                     or  al, al
  3935 00001A2B 0F840600                 je .checkreg192
  3936 00001A2F B82700                   mov ax, 39
  3937 00001A32 E93C01                   jmp .retncheckreg
  3938                                  
  3939                                  ;-435   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;
  3940                                  
  3941                                  .checkreg192:
  3942 00001A35 68[AE1B]                 push checkreg_20
  3943 00001A38 8D06A36D                 lea  ax, [symbol]
  3944 00001A3C 50                       push ax
  3945 00001A3D E858E7                   call eqstr
  3946 00001A40 83C404                   add  sp, 4
  3947 00001A43 08C0                     or  al, al
  3948 00001A45 0F840600                 je .checkreg193
  3949 00001A49 B82900                   mov ax, 41
  3950 00001A4C E92201                   jmp .retncheckreg
  3951                                  .checkreg193:
  3952 00001A4F 68[B11B]                 push checkreg_21
  3953 00001A52 8D06A36D                 lea  ax, [symbol]
  3954 00001A56 50                       push ax
  3955 00001A57 E83EE7                   call eqstr
  3956 00001A5A 83C404                   add  sp, 4
  3957 00001A5D 08C0                     or  al, al
  3958 00001A5F 0F840600                 je .checkreg194
  3959 00001A63 B82B00                   mov ax, 43
  3960 00001A66 E90801                   jmp .retncheckreg
  3961                                  
  3962                                  ;-436   // (eqstr(symbol,"ip")) return 45;
  3963                                  
  3964                                  
  3965                                  ;-437   if (strlen(symbol) >   3) return 0;
  3966                                  
  3967                                  .checkreg194:
  3968 00001A69 8D06A36D                 lea  ax, [symbol]
  3969 00001A6D 50                       push ax
  3970 00001A6E E8CFE6                   call strlen
  3971 00001A71 83C402                   add  sp, 2
  3972 00001A74 83F803                   cmp ax, 3
  3973 00001A77 0F8E0600                 jle .checkreg195
  3974 00001A7B B80000                   mov ax, 0
  3975 00001A7E E9F000                   jmp .retncheckreg
  3976                                  
  3977                                  ;-438   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;
  3978                                  
  3979                                  .checkreg195:
  3980 00001A81 68[B41B]                 push checkreg_22
  3981 00001A84 8D06A36D                 lea  ax, [symbol]
  3982 00001A88 50                       push ax
  3983 00001A89 E80CE7                   call eqstr
  3984 00001A8C 83C404                   add  sp, 4
  3985 00001A8F 08C0                     or  al, al
  3986 00001A91 0F840600                 je .checkreg196
  3987 00001A95 B82F00                   mov ax, 47
  3988 00001A98 E9D600                   jmp .retncheckreg
  3989                                  .checkreg196:
  3990 00001A9B 68[B81B]                 push checkreg_23
  3991 00001A9E 8D06A36D                 lea  ax, [symbol]
  3992 00001AA2 50                       push ax
  3993 00001AA3 E8F2E6                   call eqstr
  3994 00001AA6 83C404                   add  sp, 4
  3995 00001AA9 08C0                     or  al, al
  3996 00001AAB 0F840600                 je .checkreg197
  3997 00001AAF B83200                   mov ax, 50
  3998 00001AB2 E9BC00                   jmp .retncheckreg
  3999                                  
  4000                                  ;-439   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;
  4001                                  
  4002                                  .checkreg197:
  4003 00001AB5 68[BC1B]                 push checkreg_24
  4004 00001AB8 8D06A36D                 lea  ax, [symbol]
  4005 00001ABC 50                       push ax
  4006 00001ABD E8D8E6                   call eqstr
  4007 00001AC0 83C404                   add  sp, 4
  4008 00001AC3 08C0                     or  al, al
  4009 00001AC5 0F840600                 je .checkreg198
  4010 00001AC9 B83500                   mov ax, 53
  4011 00001ACC E9A200                   jmp .retncheckreg
  4012                                  .checkreg198:
  4013 00001ACF 68[C01B]                 push checkreg_25
  4014 00001AD2 8D06A36D                 lea  ax, [symbol]
  4015 00001AD6 50                       push ax
  4016 00001AD7 E8BEE6                   call eqstr
  4017 00001ADA 83C404                   add  sp, 4
  4018 00001ADD 08C0                     or  al, al
  4019 00001ADF 0F840600                 je .checkreg199
  4020 00001AE3 B83800                   mov ax, 56
  4021 00001AE6 E98800                   jmp .retncheckreg
  4022                                  
  4023                                  ;-440   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;
  4024                                  
  4025                                  .checkreg199:
  4026 00001AE9 68[C41B]                 push checkreg_26
  4027 00001AEC 8D06A36D                 lea  ax, [symbol]
  4028 00001AF0 50                       push ax
  4029 00001AF1 E8A4E6                   call eqstr
  4030 00001AF4 83C404                   add  sp, 4
  4031 00001AF7 08C0                     or  al, al
  4032 00001AF9 0F840600                 je .checkreg200
  4033 00001AFD B83B00                   mov ax, 59
  4034 00001B00 E96E00                   jmp .retncheckreg
  4035                                  .checkreg200:
  4036 00001B03 68[C81B]                 push checkreg_27
  4037 00001B06 8D06A36D                 lea  ax, [symbol]
  4038 00001B0A 50                       push ax
  4039 00001B0B E88AE6                   call eqstr
  4040 00001B0E 83C404                   add  sp, 4
  4041 00001B11 08C0                     or  al, al
  4042 00001B13 0F840600                 je .checkreg201
  4043 00001B17 B83E00                   mov ax, 62
  4044 00001B1A E95400                   jmp .retncheckreg
  4045                                  
  4046                                  ;-441   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;
  4047                                  
  4048                                  .checkreg201:
  4049 00001B1D 68[CC1B]                 push checkreg_28
  4050 00001B20 8D06A36D                 lea  ax, [symbol]
  4051 00001B24 50                       push ax
  4052 00001B25 E870E6                   call eqstr
  4053 00001B28 83C404                   add  sp, 4
  4054 00001B2B 08C0                     or  al, al
  4055 00001B2D 0F840600                 je .checkreg202
  4056 00001B31 B84100                   mov ax, 65
  4057 00001B34 E93A00                   jmp .retncheckreg
  4058                                  .checkreg202:
  4059 00001B37 68[D01B]                 push checkreg_29
  4060 00001B3A 8D06A36D                 lea  ax, [symbol]
  4061 00001B3E 50                       push ax
  4062 00001B3F E856E6                   call eqstr
  4063 00001B42 83C404                   add  sp, 4
  4064 00001B45 08C0                     or  al, al
  4065 00001B47 0F840600                 je .checkreg203
  4066 00001B4B B84400                   mov ax, 68
  4067 00001B4E E92000                   jmp .retncheckreg
  4068                                  
  4069                                  ;-442   if (eqstr(symbol,"cr0")) return 71;
  4070                                  
  4071                                  .checkreg203:
  4072 00001B51 68[D41B]                 push checkreg_30
  4073 00001B54 8D06A36D                 lea  ax, [symbol]
  4074 00001B58 50                       push ax
  4075 00001B59 E83CE6                   call eqstr
  4076 00001B5C 83C404                   add  sp, 4
  4077 00001B5F 08C0                     or  al, al
  4078 00001B61 0F840600                 je .checkreg204
  4079 00001B65 B84700                   mov ax, 71
  4080 00001B68 E90600                   jmp .retncheckreg
  4081                                  
  4082                                  ;-443   return 0;   }
  4083                                  
  4084                                  .checkreg204:
  4085 00001B6B B80000                   mov ax, 0
  4086 00001B6E E90000                   jmp .retncheckreg
  4087                                  
  4088                                  ;-444 char printregstr[]
  4089                                  
  4090                                   .retncheckreg:
  4091 00001B71 C3                       ret
  4092 00001B72 616C00                  checkreg_0 db "al",0
  4093 00001B75 636C00                  checkreg_1 db "cl",0
  4094 00001B78 646C00                  checkreg_2 db "dl",0
  4095 00001B7B 626C00                  checkreg_3 db "bl",0
  4096 00001B7E 616800                  checkreg_4 db "ah",0
  4097 00001B81 636800                  checkreg_5 db "ch",0
  4098 00001B84 646800                  checkreg_6 db "dh",0
  4099 00001B87 626800                  checkreg_7 db "bh",0
  4100 00001B8A 617800                  checkreg_8 db "ax",0
  4101 00001B8D 637800                  checkreg_9 db "cx",0
  4102 00001B90 647800                  checkreg_10 db "dx",0
  4103 00001B93 627800                  checkreg_11 db "bx",0
  4104 00001B96 737000                  checkreg_12 db "sp",0
  4105 00001B99 627000                  checkreg_13 db "bp",0
  4106 00001B9C 736900                  checkreg_14 db "si",0
  4107 00001B9F 646900                  checkreg_15 db "di",0
  4108 00001BA2 657300                  checkreg_16 db "es",0
  4109 00001BA5 637300                  checkreg_17 db "cs",0
  4110 00001BA8 737300                  checkreg_18 db "ss",0
  4111 00001BAB 647300                  checkreg_19 db "ds",0
  4112 00001BAE 667300                  checkreg_20 db "fs",0
  4113 00001BB1 677300                  checkreg_21 db "gs",0
  4114 00001BB4 65617800                checkreg_22 db "eax",0
  4115 00001BB8 65637800                checkreg_23 db "ecx",0
  4116 00001BBC 65647800                checkreg_24 db "edx",0
  4117 00001BC0 65627800                checkreg_25 db "ebx",0
  4118 00001BC4 65737000                checkreg_26 db "esp",0
  4119 00001BC8 65627000                checkreg_27 db "ebp",0
  4120 00001BCC 65736900                checkreg_28 db "esi",0
  4121 00001BD0 65646900                checkreg_29 db "edi",0
  4122 00001BD4 63723000                checkreg_30 db "cr0",0
  4123                                  ENDP
  4124                                  
  4125                                  ;-445 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";
  4126                                  
  4127 00001BD8 2A616C636C646C626C-     printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0
  4128 00001BE1 616863686468626861-
  4129 00001BEA 786378647862787370-
  4130 00001BF3 627073696469657363-
  4131 00001BFC 737373647366736773-
  4132 00001C05 697065617865637865-
  4133 00001C0E 647865627865737065-
  4134 00001C17 627065736965646963-
  4135 00001C20 723000             
  4136                                  
  4137                                  ;-446 //          1         2         3         4         5         6         7
  4138                                  
  4139                                  
  4140                                  ;-447 // 1 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3
  4141                                  
  4142                                  
  4143                                  ;-448 int printreg(int i) {  unsigned int k; unsigned char c;
  4144                                  
  4145                                  
  4146                                  printreg: PROC
  4147                                  
  4148                                  ;-449   k = &printregstr + i; c=*k; prc(c); i++;
  4149                                  
  4150                                  ;Function : printreg, Number of local variables: 3
  4151                                  ;   # type sign width addr used name   list of local variables
  4152                                  ;  200 var sign word   448 NULL i = bp+4
  4153                                  ;  201 var unsg word   448 NULL k = bp-2
  4154                                  ;  202 var unsg byte   448 NULL c = bp-4;
  4155 00001C23 C8040000                 ENTER  4,0
  4156 00001C27 B8[D81B]                 mov ax, printregstr
  4157 00001C2A 034604                   add ax, [bp+4]
  4158 00001C2D 8946FE                   mov [bp-2], ax
  4159 00001C30 8B5EFE                   mov bx, [bp-2]
  4160 00001C33 8B07                     mov ax, [bx]
  4161 00001C35 8846FC                   mov [bp-4], al
  4162 00001C38 8A46FC                   mov al, byte [bp-4]
  4163 00001C3B B400                     mov ah, 0
  4164 00001C3D 50                       push ax
  4165 00001C3E E8B523                   call prc
  4166 00001C41 83C402                   add  sp, 2
  4167 00001C44 FF4604                   inc  word[bp+4]
  4168                                  
  4169                                  ;-450   k = &printregstr + i; c=*k; prc(c);
  4170                                  
  4171 00001C47 B8[D81B]                 mov ax, printregstr
  4172 00001C4A 034604                   add ax, [bp+4]
  4173 00001C4D 8946FE                   mov [bp-2], ax
  4174 00001C50 8B5EFE                   mov bx, [bp-2]
  4175 00001C53 8B07                     mov ax, [bx]
  4176 00001C55 8846FC                   mov [bp-4], al
  4177 00001C58 8A46FC                   mov al, byte [bp-4]
  4178 00001C5B B400                     mov ah, 0
  4179 00001C5D 50                       push ax
  4180 00001C5E E89523                   call prc
  4181 00001C61 83C402                   add  sp, 2
  4182                                  
  4183                                  ;-451   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }
  4184                                  
  4185 00001C64 8B4604                   mov ax, [bp+4]
  4186 00001C67 83F82F                   cmp ax, 47
  4187 00001C6A 0F8E2000                 jle .printreg205
  4188 00001C6E FF4604                   inc  word[bp+4]
  4189 00001C71 B8[D81B]                 mov ax, printregstr
  4190 00001C74 034604                   add ax, [bp+4]
  4191 00001C77 8946FE                   mov [bp-2], ax
  4192 00001C7A 8B5EFE                   mov bx, [bp-2]
  4193 00001C7D 8B07                     mov ax, [bx]
  4194 00001C7F 8846FC                   mov [bp-4], al
  4195 00001C82 8A46FC                   mov al, byte [bp-4]
  4196 00001C85 B400                     mov ah, 0
  4197 00001C87 50                       push ax
  4198 00001C88 E86B23                   call prc
  4199 00001C8B 83C402                   add  sp, 2
  4200                                  
  4201                                  ;-452 }
  4202                                  
  4203                                  .printreg205:
  4204                                  
  4205                                  ;-453 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
  4206 00001C8E C9                       LEAVE
  4207 00001C8F C3                       ret
  4208                                  ENDP
  4209 00001C90 0000                    evalue dw 0
  4210 00001C92 0A00                    exprtype dw 10
  4211                                  
  4212                                  ;-454 int expr(int isRight)
  4213                                  
  4214                                  
  4215                                  expr: PROC
  4216                                  
  4217                                  ;-455 { int mode; int id1;     int ixarr; int ixconst;
  4218                                  
  4219                                  
  4220                                  ;-456   int ids;  int isCONST; int i;     unsigned char *p;
  4221                                  
  4222                                  
  4223                                  ;-457   if (istoken(T_CONST)) { evalue=lexval;
  4224                                  
  4225                                  ;Function : expr, Number of local variables: 9
  4226                                  ;   # type sign width addr used name   list of local variables
  4227                                  ;  200 var sign word   454 NULL isRight = bp+4
  4228                                  ;  201 var sign word   455 NULL mode = bp-2
  4229                                  ;  202 var sign word   455 NULL id1 = bp-4
  4230                                  ;  203 var sign word   455 NULL ixarr = bp-6
  4231                                  ;  204 var sign word   455 NULL ixconst = bp-8
  4232                                  ;  205 var sign word   456 NULL ids = bp-10
  4233                                  ;  206 var sign word   456 NULL isCONST = bp-12
  4234                                  ;  207 var sign word   456 NULL i = bp-14
  4235                                  ;  208 ptr unsg byte   456 NULL p = bp-16;
  4236 00001C94 C8100000                 ENTER  16,0
  4237 00001C98 680101                   push 257
  4238 00001C9B E88A22                   call istoken
  4239 00001C9E 83C402                   add  sp, 2
  4240 00001CA1 08C0                     or  al, al
  4241 00001CA3 0F841F00                 je .expr206
  4242 00001CA7 A1[3000]                 mov ax, [lexval]
  4243 00001CAA A3[901C]                 mov word [evalue], ax
  4244                                  
  4245                                  ;-458     prs("\n mov ax, "); prunsign1(lexval); return 4; }
  4246                                  
  4247 00001CAD 68[3420]                 push expr_0
  4248 00001CB0 E8AA23                   call prs
  4249 00001CB3 83C402                   add  sp, 2
  4250 00001CB6 FF36[3000]               push word [lexval]
  4251 00001CBA E8F524                   call prunsign1
  4252 00001CBD 83C402                   add  sp, 2
  4253 00001CC0 B80400                   mov ax, 4
  4254 00001CC3 E96C03                   jmp .retnexpr
  4255                                  
  4256                                  ;-459   mode=typeName(); /*0=V,1=*,2=&*/
  4257                                  
  4258                                  .expr206:
  4259 00001CC6 E863ED                   call typeName
  4260 00001CC9 8946FE                   mov [bp-2], ax
  4261                                  
  4262                                  ;-460   ireg1=checkreg();
  4263                                  
  4264 00001CCC E846FB                   call checkreg
  4265 00001CCF A3[2C10]                 mov word [ireg1], ax
  4266                                  
  4267                                  ;-461   if (ireg1) { doreg1(0); return; }
  4268                                  
  4269 00001CD2 A1[2C10]                 mov ax, [ireg1]
  4270 00001CD5 08C0                     or  al, al
  4271 00001CD7 0F840B00                 je .expr207
  4272 00001CDB 6A00                     push 0
  4273 00001CDD E849F9                   call doreg1
  4274 00001CE0 83C402                   add  sp, 2
  4275 00001CE3 E94C03                   jmp .retnexpr
  4276                                  
  4277                                  ;-462   if (token=='(')  {docall1(); goto e1; }
  4278                                  
  4279                                  .expr207:
  4280 00001CE6 A1[1E00]                 mov ax, [token]
  4281 00001CE9 83F828                   cmp ax, 40
  4282 00001CEC 0F850600                 jne .expr208
  4283 00001CF0 E82E0F                   call docall1
  4284 00001CF3 E93202                   jmp .e1
  4285                                  
  4286                                  ;-463   if (isreg()) goto e1;
  4287                                  
  4288                                  .expr208:
  4289 00001CF6 E88307                   call isreg
  4290 00001CF9 08C0                     or  al, al
  4291 00001CFB 0F840300                 je .expr209
  4292 00001CFF E92602                   jmp .e1
  4293                                  
  4294                                  ;-464 
  4295                                  
  4296                                  
  4297                                  ;-465   id1=searchname(); gettypes(id1); ids=signi;
  4298                                  
  4299                                  .expr209:
  4300 00001D02 E858EC                   call searchname
  4301 00001D05 8946FC                   mov [bp-4], ax
  4302 00001D08 FF76FC                   push word [bp-4]
  4303 00001D0B E811EB                   call gettypes
  4304 00001D0E 83C402                   add  sp, 2
  4305 00001D11 A1[3500]                 mov ax, [signi]
  4306 00001D14 8946F6                   mov [bp-10], ax
  4307                                  
  4308                                  ;-466   ixarr=0;  ixconst=0;
  4309                                  
  4310 00001D17 B80000                   mov ax, 0
  4311 00001D1A 8946FA                   mov [bp-6], ax
  4312 00001D1D B80000                   mov ax, 0
  4313 00001D20 8946F8                   mov [bp-8], ax
  4314                                  
  4315                                  ;-467     if (istoken('[')) { if (istoken(T_CONST)) {
  4316                                  
  4317 00001D23 6A5B                     push 91
  4318 00001D25 E80022                   call istoken
  4319 00001D28 83C402                   add  sp, 2
  4320 00001D2B 08C0                     or  al, al
  4321 00001D2D 0F845900                 je .expr210
  4322 00001D31 680101                   push 257
  4323 00001D34 E8F121                   call istoken
  4324 00001D37 83C402                   add  sp, 2
  4325 00001D3A 08C0                     or  al, al
  4326 00001D3C 0F841700                 je .expr211
  4327                                  
  4328                                  ;-468       ixconst=1; ixarr=lexval; expect(']');  }
  4329                                  
  4330 00001D40 B80100                   mov ax, 1
  4331 00001D43 8946F8                   mov [bp-8], ax
  4332 00001D46 A1[3000]                 mov ax, [lexval]
  4333 00001D49 8946FA                   mov [bp-6], ax
  4334 00001D4C 6A5D                     push 93
  4335 00001D4E E8F921                   call expect
  4336 00001D51 83C402                   add  sp, 2
  4337                                  
  4338                                  ;-469     else {ixarr=searchname(); expect(T_NAME); expect(']');
  4339                                  
  4340 00001D54 E93300                   jmp .expr212
  4341                                  .expr211:
  4342 00001D57 E803EC                   call searchname
  4343 00001D5A 8946FA                   mov [bp-6], ax
  4344 00001D5D 680001                   push 256
  4345 00001D60 E8E721                   call expect
  4346 00001D63 83C402                   add  sp, 2
  4347 00001D66 6A5D                     push 93
  4348 00001D68 E8DF21                   call expect
  4349 00001D6B 83C402                   add  sp, 2
  4350                                  
  4351                                  ;-470     gettypes(ixarr);
  4352                                  
  4353 00001D6E FF76FA                   push word [bp-6]
  4354 00001D71 E8ABEA                   call gettypes
  4355 00001D74 83C402                   add  sp, 2
  4356                                  
  4357                                  ;-471     if (widthi != 2) error1("Arrayindex muss Zahl oder int sein"); } }
  4358                                  
  4359 00001D77 A1[3800]                 mov ax, [widthi]
  4360 00001D7A 83F802                   cmp ax, 2
  4361 00001D7D 0F840900                 je  .expr213
  4362 00001D81 68[4020]                 push expr_1
  4363 00001D84 E83526                   call error1
  4364 00001D87 83C402                   add  sp, 2
  4365                                  .expr213:
  4366                                  .expr212:
  4367                                  
  4368                                  ;-472   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Nur var erlaubt");
  4369                                  
  4370                                  .expr210:
  4371 00001D8A 68C304                   push 1219
  4372 00001D8D E89821                   call istoken
  4373 00001D90 83C402                   add  sp, 2
  4374 00001D93 08C0                     or  al, al
  4375 00001D95 0F844600                 je .expr214
  4376 00001D99 8B46FE                   mov ax, [bp-2]
  4377 00001D9C 08C0                     or  al, al
  4378 00001D9E 0F840900                 je .expr215
  4379 00001DA2 68[6320]                 push expr_2
  4380 00001DA5 E81426                   call error1
  4381 00001DA8 83C402                   add  sp, 2
  4382                                  
  4383                                  ;-473      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");
  4384                                  
  4385                                  .expr215:
  4386 00001DAB 68[7320]                 push expr_3
  4387 00001DAE E8AC22                   call prs
  4388 00001DB1 83C402                   add  sp, 2
  4389 00001DB4 A1[3B00]                 mov ax, [wi]
  4390 00001DB7 83F802                   cmp ax, 2
  4391 00001DBA 0F850C00                 jne .expr216
  4392 00001DBE 68[7C20]                 push expr_4
  4393 00001DC1 E89922                   call prs
  4394 00001DC4 83C402                   add  sp, 2
  4395 00001DC7 E90900                   jmp .expr217
  4396                                  .expr216:
  4397 00001DCA 68[8120]                 push expr_5
  4398 00001DCD E88D22                   call prs
  4399 00001DD0 83C402                   add  sp, 2
  4400                                  
  4401                                  ;-474      v(id1); goto e1;}
  4402                                  
  4403                                  .expr217:
  4404 00001DD3 FF76FC                   push word [bp-4]
  4405 00001DD6 E898E5                   call v
  4406 00001DD9 83C402                   add  sp, 2
  4407 00001DDC E94901                   jmp .e1
  4408                                  
  4409                                  ;-475   if (istoken(T_MINUSMINUS)) {if(mode)error1("Nur var erlaubt");
  4410                                  
  4411                                  .expr214:
  4412 00001DDF 68C904                   push 1225
  4413 00001DE2 E84321                   call istoken
  4414 00001DE5 83C402                   add  sp, 2
  4415 00001DE8 08C0                     or  al, al
  4416 00001DEA 0F844600                 je .expr218
  4417 00001DEE 8B46FE                   mov ax, [bp-2]
  4418 00001DF1 08C0                     or  al, al
  4419 00001DF3 0F840900                 je .expr219
  4420 00001DF7 68[8620]                 push expr_6
  4421 00001DFA E8BF25                   call error1
  4422 00001DFD 83C402                   add  sp, 2
  4423                                  
  4424                                  ;-476      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");
  4425                                  
  4426                                  .expr219:
  4427 00001E00 68[9620]                 push expr_7
  4428 00001E03 E85722                   call prs
  4429 00001E06 83C402                   add  sp, 2
  4430 00001E09 A1[3B00]                 mov ax, [wi]
  4431 00001E0C 83F802                   cmp ax, 2
  4432 00001E0F 0F850C00                 jne .expr220
  4433 00001E13 68[9F20]                 push expr_8
  4434 00001E16 E84422                   call prs
  4435 00001E19 83C402                   add  sp, 2
  4436 00001E1C E90900                   jmp .expr221
  4437                                  .expr220:
  4438 00001E1F 68[A420]                 push expr_9
  4439 00001E22 E83822                   call prs
  4440 00001E25 83C402                   add  sp, 2
  4441                                  
  4442                                  ;-477      v(id1); goto e1;}
  4443                                  
  4444                                  .expr221:
  4445 00001E28 FF76FC                   push word [bp-4]
  4446 00001E2B E843E5                   call v
  4447 00001E2E 83C402                   add  sp, 2
  4448 00001E31 E9F400                   jmp .e1
  4449                                  
  4450                                  ;-478 
  4451                                  
  4452                                  
  4453                                  ;-479   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}
  4454                                  
  4455                                  .expr218:
  4456 00001E34 68CE04                   push 1230
  4457 00001E37 E8EE20                   call istoken
  4458 00001E3A 83C402                   add  sp, 2
  4459 00001E3D 08C0                     or  al, al
  4460 00001E3F 0F841200                 je .expr222
  4461 00001E43 FF76FC                   push word [bp-4]
  4462 00001E46 FF76FE                   push word [bp-2]
  4463 00001E49 68[A920]                 push expr_10
  4464 00001E4C E8A802                   call compoundass
  4465 00001E4F 83C406                   add  sp, 6
  4466 00001E52 E9D300                   jmp .e1
  4467                                  
  4468                                  ;-480   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}
  4469                                  
  4470                                  .expr222:
  4471 00001E55 68CF04                   push 1231
  4472 00001E58 E8CD20                   call istoken
  4473 00001E5B 83C402                   add  sp, 2
  4474 00001E5E 08C0                     or  al, al
  4475 00001E60 0F841200                 je .expr223
  4476 00001E64 FF76FC                   push word [bp-4]
  4477 00001E67 FF76FE                   push word [bp-2]
  4478 00001E6A 68[AD20]                 push expr_11
  4479 00001E6D E88702                   call compoundass
  4480 00001E70 83C406                   add  sp, 6
  4481 00001E73 E9B200                   jmp .e1
  4482                                  
  4483                                  ;-481   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}
  4484                                  
  4485                                  .expr223:
  4486 00001E76 68D204                   push 1234
  4487 00001E79 E8AC20                   call istoken
  4488 00001E7C 83C402                   add  sp, 2
  4489 00001E7F 08C0                     or  al, al
  4490 00001E81 0F841200                 je .expr224
  4491 00001E85 FF76FC                   push word [bp-4]
  4492 00001E88 FF76FE                   push word [bp-2]
  4493 00001E8B 68[B120]                 push expr_12
  4494 00001E8E E86602                   call compoundass
  4495 00001E91 83C406                   add  sp, 6
  4496 00001E94 E99100                   jmp .e1
  4497                                  
  4498                                  ;-482   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}
  4499                                  
  4500                                  .expr224:
  4501 00001E97 68D304                   push 1235
  4502 00001E9A E88B20                   call istoken
  4503 00001E9D 83C402                   add  sp, 2
  4504 00001EA0 08C0                     or  al, al
  4505 00001EA2 0F841200                 je .expr225
  4506 00001EA6 FF76FC                   push word [bp-4]
  4507 00001EA9 FF76FE                   push word [bp-2]
  4508 00001EAC 68[B520]                 push expr_13
  4509 00001EAF E84502                   call compoundass
  4510 00001EB2 83C406                   add  sp, 6
  4511 00001EB5 E97000                   jmp .e1
  4512                                  
  4513                                  ;-483   if (istoken(T_MULASS    )) {error1("not implemented");}
  4514                                  
  4515                                  .expr225:
  4516 00001EB8 68D004                   push 1232
  4517 00001EBB E86A20                   call istoken
  4518 00001EBE 83C402                   add  sp, 2
  4519 00001EC1 08C0                     or  al, al
  4520 00001EC3 0F840900                 je .expr226
  4521 00001EC7 68[B820]                 push expr_14
  4522 00001ECA E8EF24                   call error1
  4523 00001ECD 83C402                   add  sp, 2
  4524                                  
  4525                                  ;-484   if (istoken(T_DIVASS    )) {error1("not implemented");}
  4526                                  
  4527                                  .expr226:
  4528 00001ED0 68D104                   push 1233
  4529 00001ED3 E85220                   call istoken
  4530 00001ED6 83C402                   add  sp, 2
  4531 00001ED9 08C0                     or  al, al
  4532 00001EDB 0F840900                 je .expr227
  4533 00001EDF 68[C820]                 push expr_15
  4534 00001EE2 E8D724                   call error1
  4535 00001EE5 83C402                   add  sp, 2
  4536                                  
  4537                                  ;-485 
  4538                                  
  4539                                  
  4540                                  ;-486   if (istoken('=')) { exprtype= expr(1);
  4541                                  
  4542                                  .expr227:
  4543 00001EE8 6A3D                     push 61
  4544 00001EEA E83B20                   call istoken
  4545 00001EED 83C402                   add  sp, 2
  4546 00001EF0 08C0                     or  al, al
  4547 00001EF2 0F842000                 je .expr228
  4548 00001EF6 6A01                     push 1
  4549 00001EF8 E899FD                   call expr
  4550 00001EFB 83C402                   add  sp, 2
  4551 00001EFE A3[921C]                 mov word [exprtype], ax
  4552                                  
  4553                                  ;-487   doassign(mode, id1, ixarr, ixconst); goto e1;  }
  4554                                  
  4555 00001F01 FF76F8                   push word [bp-8]
  4556 00001F04 FF76FA                   push word [bp-6]
  4557 00001F07 FF76FC                   push word [bp-4]
  4558 00001F0A FF76FE                   push word [bp-2]
  4559 00001F0D E85E08                   call doassign
  4560 00001F10 83C408                   add  sp, 8
  4561 00001F13 E91200                   jmp .e1
  4562                                  
  4563                                  ;-488   dovar1(mode, "mov", ixarr, id1);
  4564                                  
  4565                                  .expr228:
  4566 00001F16 FF76FC                   push word [bp-4]
  4567 00001F19 FF76FA                   push word [bp-6]
  4568 00001F1C 68[D820]                 push expr_16
  4569 00001F1F FF76FE                   push word [bp-2]
  4570 00001F22 E87402                   call dovar1
  4571 00001F25 83C408                   add  sp, 8
  4572                                  
  4573                                  ;-489 
  4574                                  
  4575                                  
  4576                                  ;-490 e1:    if (istoken('+')) rterm("add");
  4577                                  
  4578                                  .e1:
  4579 00001F28 6A2B                     push 43
  4580 00001F2A E8FB1F                   call istoken
  4581 00001F2D 83C402                   add  sp, 2
  4582 00001F30 08C0                     or  al, al
  4583 00001F32 0F840C00                 je .expr229
  4584 00001F36 68[DC20]                 push expr_17
  4585 00001F39 E82704                   call rterm
  4586 00001F3C 83C402                   add  sp, 2
  4587                                  
  4588                                  ;-491   else if (istoken('-')) rterm("sub" );
  4589                                  
  4590 00001F3F E9CF00                   jmp .expr230
  4591                                  .expr229:
  4592 00001F42 6A2D                     push 45
  4593 00001F44 E8E11F                   call istoken
  4594 00001F47 83C402                   add  sp, 2
  4595 00001F4A 08C0                     or  al, al
  4596 00001F4C 0F840C00                 je .expr231
  4597 00001F50 68[E020]                 push expr_18
  4598 00001F53 E80D04                   call rterm
  4599 00001F56 83C402                   add  sp, 2
  4600                                  
  4601                                  ;-492   else if (istoken('&')) rterm("and" );
  4602                                  
  4603 00001F59 E9B500                   jmp .expr232
  4604                                  .expr231:
  4605 00001F5C 6A26                     push 38
  4606 00001F5E E8C71F                   call istoken
  4607 00001F61 83C402                   add  sp, 2
  4608 00001F64 08C0                     or  al, al
  4609 00001F66 0F840C00                 je .expr233
  4610 00001F6A 68[E420]                 push expr_19
  4611 00001F6D E8F303                   call rterm
  4612 00001F70 83C402                   add  sp, 2
  4613                                  
  4614                                  ;-493   else if (istoken('|')) rterm("or" );
  4615                                  
  4616 00001F73 E99B00                   jmp .expr234
  4617                                  .expr233:
  4618 00001F76 6A7C                     push 124
  4619 00001F78 E8AD1F                   call istoken
  4620 00001F7B 83C402                   add  sp, 2
  4621 00001F7E 08C0                     or  al, al
  4622 00001F80 0F840C00                 je .expr235
  4623 00001F84 68[E820]                 push expr_20
  4624 00001F87 E8D903                   call rterm
  4625 00001F8A 83C402                   add  sp, 2
  4626                                  
  4627                                  ;-494   else if (istoken(T_LESSLESS)) rterm("shl");
  4628                                  
  4629 00001F8D E98100                   jmp .expr236
  4630                                  .expr235:
  4631 00001F90 68D804                   push 1240
  4632 00001F93 E8921F                   call istoken
  4633 00001F96 83C402                   add  sp, 2
  4634 00001F99 08C0                     or  al, al
  4635 00001F9B 0F840C00                 je .expr237
  4636 00001F9F 68[EB20]                 push expr_21
  4637 00001FA2 E8BE03                   call rterm
  4638 00001FA5 83C402                   add  sp, 2
  4639                                  
  4640                                  ;-495   else if (istoken(T_GREATGREAT)) rterm("shr");
  4641                                  
  4642 00001FA8 E96600                   jmp .expr238
  4643                                  .expr237:
  4644 00001FAB 68D904                   push 1241
  4645 00001FAE E8771F                   call istoken
  4646 00001FB1 83C402                   add  sp, 2
  4647 00001FB4 08C0                     or  al, al
  4648 00001FB6 0F840C00                 je .expr239
  4649 00001FBA 68[EF20]                 push expr_22
  4650 00001FBD E8A303                   call rterm
  4651 00001FC0 83C402                   add  sp, 2
  4652                                  
  4653                                  ;-496   else if (istoken('*')) domul (ids);
  4654                                  
  4655 00001FC3 E94B00                   jmp .expr240
  4656                                  .expr239:
  4657 00001FC6 6A2A                     push 42
  4658 00001FC8 E85D1F                   call istoken
  4659 00001FCB 83C402                   add  sp, 2
  4660 00001FCE 08C0                     or  al, al
  4661 00001FD0 0F840C00                 je .expr241
  4662 00001FD4 FF76F6                   push word [bp-10]
  4663 00001FD7 E8DD09                   call domul
  4664 00001FDA 83C402                   add  sp, 2
  4665                                  
  4666                                  ;-497   else if (istoken('/')) doidiv(ids);
  4667                                  
  4668 00001FDD E93100                   jmp .expr242
  4669                                  .expr241:
  4670 00001FE0 6A2F                     push 47
  4671 00001FE2 E8431F                   call istoken
  4672 00001FE5 83C402                   add  sp, 2
  4673 00001FE8 08C0                     or  al, al
  4674 00001FEA 0F840C00                 je .expr243
  4675 00001FEE FF76F6                   push word [bp-10]
  4676 00001FF1 E8640A                   call doidiv
  4677 00001FF4 83C402                   add  sp, 2
  4678                                  
  4679                                  ;-498   else if (istoken('%')) domod (ids);
  4680                                  
  4681 00001FF7 E91700                   jmp .expr244
  4682                                  .expr243:
  4683 00001FFA 6A25                     push 37
  4684 00001FFC E8291F                   call istoken
  4685 00001FFF 83C402                   add  sp, 2
  4686 00002002 08C0                     or  al, al
  4687 00002004 0F840900                 je .expr245
  4688 00002008 FF76F6                   push word [bp-10]
  4689 0000200B E8ED0B                   call domod
  4690 0000200E 83C402                   add  sp, 2
  4691                                  
  4692                                  ;-499   if (isrelational()) { rterm("cmp"); cmpneg(ids);}
  4693                                  
  4694                                  .expr245:
  4695                                  .expr244:
  4696                                  .expr242:
  4697                                  .expr240:
  4698                                  .expr238:
  4699                                  .expr236:
  4700                                  .expr234:
  4701                                  .expr232:
  4702                                  .expr230:
  4703 00002011 E88017                   call isrelational
  4704 00002014 08C0                     or  al, al
  4705 00002016 0F841200                 je .expr246
  4706 0000201A 68[F320]                 push expr_23
  4707 0000201D E84303                   call rterm
  4708 00002020 83C402                   add  sp, 2
  4709 00002023 FF76F6                   push word [bp-10]
  4710 00002026 E8AD14                   call cmpneg
  4711 00002029 83C402                   add  sp, 2
  4712                                  
  4713                                  ;-500   return 0;
  4714                                  
  4715                                  .expr246:
  4716 0000202C B80000                   mov ax, 0
  4717 0000202F E90000                   jmp .retnexpr
  4718                                  
  4719                                  ;-501 }
  4720                                  
  4721                                  
  4722                                  ;-502 
  4723                                  
  4724                                  
  4725                                  ;-503 int compoundass(char *op, int mode, int id1) {
  4726                                  
  4727 00002032 C9                       .retnexpr: LEAVE
  4728 00002033 C3                       ret
  4729 00002034 5C6E206D6F76206178-     expr_0 db "\n mov ax, ",0
  4730 0000203D 2C2000             
  4731 00002040 4172726179696E6465-     expr_1 db "Arrayindex muss Zahl oder int sein",0
  4732 00002049 78206D757373205A61-
  4733 00002052 686C206F6465722069-
  4734 0000205B 6E74207365696E00   
  4735 00002063 4E7572207661722065-     expr_2 db "Nur var erlaubt",0
  4736 0000206C 726C6175627400     
  4737 00002073 5C6E20696E63202000      expr_3 db "\n inc  ",0
  4738 0000207C 776F726400              expr_4 db "word",0
  4739 00002081 6279746500              expr_5 db "byte",0
  4740 00002086 4E7572207661722065-     expr_6 db "Nur var erlaubt",0
  4741 0000208F 726C6175627400     
  4742 00002096 5C6E20646563202000      expr_7 db "\n dec  ",0
  4743 0000209F 776F726400              expr_8 db "word",0
  4744 000020A4 6279746500              expr_9 db "byte",0
  4745 000020A9 61646400                expr_10 db "add",0
  4746 000020AD 73756200                expr_11 db "sub",0
  4747 000020B1 616E6400                expr_12 db "and",0
  4748 000020B5 6F7200                  expr_13 db "or",0
  4749 000020B8 6E6F7420696D706C65-     expr_14 db "not implemented",0
  4750 000020C1 6D656E74656400     
  4751 000020C8 6E6F7420696D706C65-     expr_15 db "not implemented",0
  4752 000020D1 6D656E74656400     
  4753 000020D8 6D6F7600                expr_16 db "mov",0
  4754 000020DC 61646400                expr_17 db "add",0
  4755 000020E0 73756200                expr_18 db "sub",0
  4756 000020E4 616E6400                expr_19 db "and",0
  4757 000020E8 6F7200                  expr_20 db "or",0
  4758 000020EB 73686C00                expr_21 db "shl",0
  4759 000020EF 73687200                expr_22 db "shr",0
  4760 000020F3 636D7000                expr_23 db "cmp",0
  4761                                  ENDP
  4762                                  
  4763                                  compoundass: PROC
  4764                                  
  4765                                  ;-504   if(mode) error1("only scalar Var allowed");
  4766                                  
  4767                                  ;Function : compoundass, Number of local variables: 3
  4768                                  ;   # type sign width addr used name   list of local variables
  4769                                  ;  200 ptr sign byte   503 NULL op = bp+4
  4770                                  ;  201 var sign word   503 NULL mode = bp+6
  4771                                  ;  202 var sign word   503 NULL id1 = bp+8;
  4772 000020F7 C8000000                 ENTER  0,0
  4773 000020FB 8B4606                   mov ax, [bp+6]
  4774 000020FE 08C0                     or  al, al
  4775 00002100 0F840900                 je .compoundass247
  4776 00002104 68[7121]                 push compoundass_0
  4777 00002107 E8B222                   call error1
  4778 0000210A 83C402                   add  sp, 2
  4779                                  
  4780                                  ;-505   prnl(); prs(op); prs("  ");
  4781                                  
  4782                                  .compoundass247:
  4783 0000210D E83F1F                   call prnl
  4784 00002110 FF7604                   push word [bp+4]
  4785 00002113 E8471F                   call prs
  4786 00002116 83C402                   add  sp, 2
  4787 00002119 68[8921]                 push compoundass_1
  4788 0000211C E83E1F                   call prs
  4789 0000211F 83C402                   add  sp, 2
  4790                                  
  4791                                  ;-506   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  4792                                  
  4793 00002122 FF7608                   push word [bp+8]
  4794 00002125 E8F7E6                   call gettypes
  4795 00002128 83C402                   add  sp, 2
  4796 0000212B A1[3B00]                 mov ax, [wi]
  4797 0000212E 83F802                   cmp ax, 2
  4798 00002131 0F850C00                 jne .compoundass248
  4799 00002135 68[8C21]                 push compoundass_2
  4800 00002138 E8221F                   call prs
  4801 0000213B 83C402                   add  sp, 2
  4802 0000213E E90900                   jmp .compoundass249
  4803                                  .compoundass248:
  4804 00002141 68[9121]                 push compoundass_3
  4805 00002144 E8161F                   call prs
  4806 00002147 83C402                   add  sp, 2
  4807                                  
  4808                                  ;-507   v(id1); prs(", ");
  4809                                  
  4810                                  .compoundass249:
  4811 0000214A FF7608                   push word [bp+8]
  4812 0000214D E821E2                   call v
  4813 00002150 83C402                   add  sp, 2
  4814 00002153 68[9621]                 push compoundass_4
  4815 00002156 E8041F                   call prs
  4816 00002159 83C402                   add  sp, 2
  4817                                  
  4818                                  ;-508   expect(T_CONST); prunsign1(lexval);
  4819                                  
  4820 0000215C 680101                   push 257
  4821 0000215F E8E81D                   call expect
  4822 00002162 83C402                   add  sp, 2
  4823 00002165 FF36[3000]               push word [lexval]
  4824 00002169 E84620                   call prunsign1
  4825 0000216C 83C402                   add  sp, 2
  4826                                  
  4827                                  ;-509 }
  4828                                  
  4829                                  
  4830                                  ;-510 int dovar1(int mode, int op, int ixarr, int id1) {
  4831 0000216F C9                       LEAVE
  4832 00002170 C3                       ret
  4833 00002171 6F6E6C79207363616C-     compoundass_0 db "only scalar Var allowed",0
  4834 0000217A 61722056617220616C-
  4835 00002183 6C6F77656400       
  4836 00002189 202000                  compoundass_1 db "  ",0
  4837 0000218C 776F726400              compoundass_2 db "word",0
  4838 00002191 6279746500              compoundass_3 db "byte",0
  4839 00002196 2C2000                  compoundass_4 db ", ",0
  4840                                  ENDP
  4841                                  
  4842                                  dovar1: PROC
  4843                                  
  4844                                  ;-511   gettypes(id1);
  4845                                  
  4846                                  ;Function : dovar1, Number of local variables: 4
  4847                                  ;   # type sign width addr used name   list of local variables
  4848                                  ;  200 var sign word   510 NULL mode = bp+4
  4849                                  ;  201 var sign word   510 NULL op = bp+6
  4850                                  ;  202 var sign word   510 NULL ixarr = bp+8
  4851                                  ;  203 var sign word   510 NULL id1 = bp+10;
  4852 00002199 C8000000                 ENTER  0,0
  4853 0000219D FF760A                   push word [bp+10]
  4854 000021A0 E87CE6                   call gettypes
  4855 000021A3 83C402                   add  sp, 2
  4856                                  
  4857                                  ;-512   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);
  4858                                  
  4859 000021A6 8B4604                   mov ax, [bp+4]
  4860 000021A9 83F801                   cmp ax, 1
  4861 000021AC 0F854700                 jne .dovar1250
  4862 000021B0 68[EE22]                 push dovar1_0
  4863 000021B3 E8A71E                   call prs
  4864 000021B6 83C402                   add  sp, 2
  4865 000021B9 FF760A                   push word [bp+10]
  4866 000021BC E8B2E1                   call v
  4867 000021BF 83C402                   add  sp, 2
  4868 000021C2 E88A1E                   call prnl
  4869 000021C5 FF7606                   push word [bp+6]
  4870 000021C8 E8921E                   call prs
  4871 000021CB 83C402                   add  sp, 2
  4872                                  
  4873                                  ;-513     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");
  4874                                  
  4875 000021CE A1[3800]                 mov ax, [widthi]
  4876 000021D1 83F801                   cmp ax, 1
  4877 000021D4 0F850900                 jne .dovar1251
  4878 000021D8 68[FA22]                 push dovar1_1
  4879 000021DB E87F1E                   call prs
  4880 000021DE 83C402                   add  sp, 2
  4881                                  
  4882                                  ;-514     if(widthi == 2) prs(" ax, [bx]");
  4883                                  
  4884                                  .dovar1251:
  4885 000021E1 A1[3800]                 mov ax, [widthi]
  4886 000021E4 83F802                   cmp ax, 2
  4887 000021E7 0F850900                 jne .dovar1252
  4888 000021EB 68[1023]                 push dovar1_2
  4889 000021EE E86C1E                   call prs
  4890 000021F1 83C402                   add  sp, 2
  4891                                  
  4892                                  ;-515     return; }
  4893                                  
  4894                                  .dovar1252:
  4895 000021F4 E9F500                   jmp .retndovar1
  4896                                  
  4897                                  ;-516   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }
  4898                                  
  4899                                  .dovar1250:
  4900 000021F7 8B4604                   mov ax, [bp+4]
  4901 000021FA 83F802                   cmp ax, 2
  4902 000021FD 0F852100                 jne .dovar1253
  4903 00002201 E84B1E                   call prnl
  4904 00002204 FF7606                   push word [bp+6]
  4905 00002207 E8531E                   call prs
  4906 0000220A 83C402                   add  sp, 2
  4907 0000220D 68[1A23]                 push dovar1_3
  4908 00002210 E84A1E                   call prs
  4909 00002213 83C402                   add  sp, 2
  4910 00002216 FF760A                   push word [bp+10]
  4911 00002219 E846E1                   call a
  4912 0000221C 83C402                   add  sp, 2
  4913 0000221F E9CA00                   jmp .retndovar1
  4914                                  
  4915                                  ;-517   if (ixarr) {
  4916                                  
  4917                                  .dovar1253:
  4918 00002222 8B4608                   mov ax, [bp+8]
  4919 00002225 08C0                     or  al, al
  4920 00002227 0F847300                 je .dovar1254
  4921                                  
  4922                                  ;-518     prs("\n mov bx, "); v(ixarr);
  4923                                  
  4924 0000222B 68[2023]                 push dovar1_4
  4925 0000222E E82C1E                   call prs
  4926 00002231 83C402                   add  sp, 2
  4927 00002234 FF7608                   push word [bp+8]
  4928 00002237 E837E1                   call v
  4929 0000223A 83C402                   add  sp, 2
  4930                                  
  4931                                  ;-519     if (wi==2) prs("\n shl bx, 1");
  4932                                  
  4933 0000223D A1[3B00]                 mov ax, [wi]
  4934 00002240 83F802                   cmp ax, 2
  4935 00002243 0F850900                 jne .dovar1255
  4936 00002247 68[2C23]                 push dovar1_5
  4937 0000224A E8101E                   call prs
  4938 0000224D 83C402                   add  sp, 2
  4939                                  
  4940                                  ;-520     prs("\n "); prs(op);
  4941                                  
  4942                                  .dovar1255:
  4943 00002250 68[3923]                 push dovar1_6
  4944 00002253 E8071E                   call prs
  4945 00002256 83C402                   add  sp, 2
  4946 00002259 FF7606                   push word [bp+6]
  4947 0000225C E8FE1D                   call prs
  4948 0000225F 83C402                   add  sp, 2
  4949                                  
  4950                                  ;-521     if (wi==2) prs(" ax, "); else prs(" al, ");
  4951                                  
  4952 00002262 A1[3B00]                 mov ax, [wi]
  4953 00002265 83F802                   cmp ax, 2
  4954 00002268 0F850C00                 jne .dovar1256
  4955 0000226C 68[3D23]                 push dovar1_7
  4956 0000226F E8EB1D                   call prs
  4957 00002272 83C402                   add  sp, 2
  4958 00002275 E90900                   jmp .dovar1257
  4959                                  .dovar1256:
  4960 00002278 68[4323]                 push dovar1_8
  4961 0000227B E8DF1D                   call prs
  4962 0000227E 83C402                   add  sp, 2
  4963                                  
  4964                                  ;-522 // v(id1); prs(" [bx]");
  4965                                  
  4966                                  
  4967                                  ;-523     prc('['); printName(id1); prs(" + bx]");
  4968                                  
  4969                                  .dovar1257:
  4970 00002281 6A5B                     push 91
  4971 00002283 E8701D                   call prc
  4972 00002286 83C402                   add  sp, 2
  4973 00002289 FF760A                   push word [bp+10]
  4974 0000228C E86AE6                   call printName
  4975 0000228F 83C402                   add  sp, 2
  4976 00002292 68[4923]                 push dovar1_9
  4977 00002295 E8C51D                   call prs
  4978 00002298 83C402                   add  sp, 2
  4979                                  
  4980                                  ;-524     return; }
  4981                                  
  4982 0000229B E94E00                   jmp .retndovar1
  4983                                  
  4984                                  ;-525   prnl();prs(op);
  4985                                  
  4986                                  .dovar1254:
  4987 0000229E E8AE1D                   call prnl
  4988 000022A1 FF7606                   push word [bp+6]
  4989 000022A4 E8B61D                   call prs
  4990 000022A7 83C402                   add  sp, 2
  4991                                  
  4992                                  ;-526   if(wi==1) prs(" al, ");
  4993                                  
  4994 000022AA A1[3B00]                 mov ax, [wi]
  4995 000022AD 83F801                   cmp ax, 1
  4996 000022B0 0F850900                 jne .dovar1258
  4997 000022B4 68[5023]                 push dovar1_10
  4998 000022B7 E8A31D                   call prs
  4999 000022BA 83C402                   add  sp, 2
  5000                                  
  5001                                  ;-527   if(wi==2) prs(" ax, ");
  5002                                  
  5003                                  .dovar1258:
  5004 000022BD A1[3B00]                 mov ax, [wi]
  5005 000022C0 83F802                   cmp ax, 2
  5006 000022C3 0F850900                 jne .dovar1259
  5007 000022C7 68[5623]                 push dovar1_11
  5008 000022CA E8901D                   call prs
  5009 000022CD 83C402                   add  sp, 2
  5010                                  
  5011                                  ;-528   if(wi==4) prs(" eax, ");
  5012                                  
  5013                                  .dovar1259:
  5014 000022D0 A1[3B00]                 mov ax, [wi]
  5015 000022D3 83F804                   cmp ax, 4
  5016 000022D6 0F850900                 jne .dovar1260
  5017 000022DA 68[5C23]                 push dovar1_12
  5018 000022DD E87D1D                   call prs
  5019 000022E0 83C402                   add  sp, 2
  5020                                  
  5021                                  ;-529   v(id1);
  5022                                  
  5023                                  .dovar1260:
  5024 000022E3 FF760A                   push word [bp+10]
  5025 000022E6 E888E0                   call v
  5026 000022E9 83C402                   add  sp, 2
  5027                                  
  5028                                  ;-530 }
  5029                                  
  5030                                  
  5031                                  ;-531 int rterm(char *op) {int mode; int opint; int ixarr; int id1;
  5032                                  
  5033 000022EC C9                       .retndovar1: LEAVE
  5034 000022ED C3                       ret
  5035 000022EE 5C6E206D6F76206278-     dovar1_0 db "\n mov bx, ",0
  5036 000022F7 2C2000             
  5037 000022FA 20616C2C205B62785D-     dovar1_1 db " al, [bx]\n mov ah, 0",0
  5038 00002303 5C6E206D6F76206168-
  5039 0000230C 2C203000           
  5040 00002310 2061782C205B62785D-     dovar1_2 db " ax, [bx]",0
  5041 00002319 00                 
  5042 0000231A 2061782C2000            dovar1_3 db " ax, ",0
  5043 00002320 5C6E206D6F76206278-     dovar1_4 db "\n mov bx, ",0
  5044 00002329 2C2000             
  5045 0000232C 5C6E2073686C206278-     dovar1_5 db "\n shl bx, 1",0
  5046 00002335 2C203100           
  5047 00002339 5C6E2000                dovar1_6 db "\n ",0
  5048 0000233D 2061782C2000            dovar1_7 db " ax, ",0
  5049 00002343 20616C2C2000            dovar1_8 db " al, ",0
  5050 00002349 202B2062785D00          dovar1_9 db " + bx]",0
  5051 00002350 20616C2C2000            dovar1_10 db " al, ",0
  5052 00002356 2061782C2000            dovar1_11 db " ax, ",0
  5053 0000235C 206561782C2000          dovar1_12 db " eax, ",0
  5054                                  ENDP
  5055                                  
  5056                                  rterm: PROC
  5057                                  
  5058                                  ;-532   if (istoken(T_CONST)) { prnl(); prs(op);
  5059                                  
  5060                                  ;Function : rterm, Number of local variables: 5
  5061                                  ;   # type sign width addr used name   list of local variables
  5062                                  ;  200 ptr sign byte   531 NULL op = bp+4
  5063                                  ;  201 var sign word   531 NULL mode = bp-2
  5064                                  ;  202 var sign word   531 NULL opint = bp-4
  5065                                  ;  203 var sign word   531 NULL ixarr = bp-6
  5066                                  ;  204 var sign word   531 NULL id1 = bp-8;
  5067 00002363 C8080000                 ENTER  8,0
  5068 00002367 680101                   push 257
  5069 0000236A E8BB1B                   call istoken
  5070 0000236D 83C402                   add  sp, 2
  5071 00002370 08C0                     or  al, al
  5072 00002372 0F845200                 je .rterm261
  5073 00002376 E8D61C                   call prnl
  5074 00002379 FF7604                   push word [bp+4]
  5075 0000237C E8DE1C                   call prs
  5076 0000237F 83C402                   add  sp, 2
  5077                                  
  5078                                  ;-533     if (wi==1) prs(" al, ");
  5079                                  
  5080 00002382 A1[3B00]                 mov ax, [wi]
  5081 00002385 83F801                   cmp ax, 1
  5082 00002388 0F850900                 jne .rterm262
  5083 0000238C 68[4C24]                 push rterm_0
  5084 0000238F E8CB1C                   call prs
  5085 00002392 83C402                   add  sp, 2
  5086                                  
  5087                                  ;-534     if (wi==2) prs(" ax, ");
  5088                                  
  5089                                  .rterm262:
  5090 00002395 A1[3B00]                 mov ax, [wi]
  5091 00002398 83F802                   cmp ax, 2
  5092 0000239B 0F850900                 jne .rterm263
  5093 0000239F 68[5224]                 push rterm_1
  5094 000023A2 E8B81C                   call prs
  5095 000023A5 83C402                   add  sp, 2
  5096                                  
  5097                                  ;-535     if (wi==4) prs(" eax, ");
  5098                                  
  5099                                  .rterm263:
  5100 000023A8 A1[3B00]                 mov ax, [wi]
  5101 000023AB 83F804                   cmp ax, 4
  5102 000023AE 0F850900                 jne .rterm264
  5103 000023B2 68[5824]                 push rterm_2
  5104 000023B5 E8A51C                   call prs
  5105 000023B8 83C402                   add  sp, 2
  5106                                  
  5107                                  ;-536     prunsign1(lexval); return;}
  5108                                  
  5109                                  .rterm264:
  5110 000023BB FF36[3000]               push word [lexval]
  5111 000023BF E8F01D                   call prunsign1
  5112 000023C2 83C402                   add  sp, 2
  5113 000023C5 E98200                   jmp .retnrterm
  5114                                  
  5115                                  ;-537   mode=typeName(); id1=searchname(); ixarr=0;
  5116                                  
  5117                                  .rterm261:
  5118 000023C8 E861E6                   call typeName
  5119 000023CB 8946FE                   mov [bp-2], ax
  5120 000023CE E88CE5                   call searchname
  5121 000023D1 8946F8                   mov [bp-8], ax
  5122 000023D4 B80000                   mov ax, 0
  5123 000023D7 8946FA                   mov [bp-6], ax
  5124                                  
  5125                                  ;-538   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');
  5126                                  
  5127 000023DA 6A5B                     push 91
  5128 000023DC E8491B                   call istoken
  5129 000023DF 83C402                   add  sp, 2
  5130 000023E2 08C0                     or  al, al
  5131 000023E4 0F843300                 je .rterm265
  5132 000023E8 E872E5                   call searchname
  5133 000023EB 8946FA                   mov [bp-6], ax
  5134 000023EE 680001                   push 256
  5135 000023F1 E8561B                   call expect
  5136 000023F4 83C402                   add  sp, 2
  5137 000023F7 6A5D                     push 93
  5138 000023F9 E84E1B                   call expect
  5139 000023FC 83C402                   add  sp, 2
  5140                                  
  5141                                  ;-539     gettypes(ixarr);
  5142                                  
  5143 000023FF FF76FA                   push word [bp-6]
  5144 00002402 E81AE4                   call gettypes
  5145 00002405 83C402                   add  sp, 2
  5146                                  
  5147                                  ;-540     if (widthi != 2) error1("Arrayindex muss int sein"); }
  5148                                  
  5149 00002408 A1[3800]                 mov ax, [widthi]
  5150 0000240B 83F802                   cmp ax, 2
  5151 0000240E 0F840900                 je  .rterm266
  5152 00002412 68[5F24]                 push rterm_3
  5153 00002415 E8A41F                   call error1
  5154 00002418 83C402                   add  sp, 2
  5155                                  .rterm266:
  5156                                  
  5157                                  ;-541   if (eqstr(symbol,"_AX")) return;
  5158                                  
  5159                                  .rterm265:
  5160 0000241B 68[7824]                 push rterm_4
  5161 0000241E 8D06A36D                 lea  ax, [symbol]
  5162 00002422 50                       push ax
  5163 00002423 E872DD                   call eqstr
  5164 00002426 83C404                   add  sp, 4
  5165 00002429 08C0                     or  al, al
  5166 0000242B 0F840300                 je .rterm267
  5167 0000242F E91800                   jmp .retnrterm
  5168                                  
  5169                                  ;-542   opint=op; dovar1(mode, opint, ixarr, id1);
  5170                                  
  5171                                  .rterm267:
  5172 00002432 8B4604                   mov ax, [bp+4]
  5173 00002435 8946FC                   mov [bp-4], ax
  5174 00002438 FF76F8                   push word [bp-8]
  5175 0000243B FF76FA                   push word [bp-6]
  5176 0000243E FF76FC                   push word [bp-4]
  5177 00002441 FF76FE                   push word [bp-2]
  5178 00002444 E852FD                   call dovar1
  5179 00002447 83C408                   add  sp, 8
  5180                                  
  5181                                  ;-543 }
  5182                                  
  5183                                  
  5184                                  ;-544 int isreg() {
  5185                                  
  5186 0000244A C9                       .retnrterm: LEAVE
  5187 0000244B C3                       ret
  5188 0000244C 20616C2C2000            rterm_0 db " al, ",0
  5189 00002452 2061782C2000            rterm_1 db " ax, ",0
  5190 00002458 206561782C2000          rterm_2 db " eax, ",0
  5191 0000245F 4172726179696E6465-     rterm_3 db "Arrayindex muss int sein",0
  5192 00002468 78206D75737320696E-
  5193 00002471 74207365696E00     
  5194 00002478 5F415800                rterm_4 db "_AX",0
  5195                                  ENDP
  5196                                  
  5197                                  isreg: PROC
  5198                                  
  5199                                  ;-545   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}
  5200                                  
  5201 0000247C 68[6926]                 push isreg_0
  5202 0000247F 8D06A36D                 lea  ax, [symbol]
  5203 00002483 50                       push ax
  5204 00002484 E811DD                   call eqstr
  5205 00002487 83C404                   add  sp, 4
  5206 0000248A 08C0                     or  al, al
  5207 0000248C 0F840C00                 je .isreg268
  5208 00002490 68[6D26]                 push isreg_1
  5209 00002493 E84202                   call doreg
  5210 00002496 83C402                   add  sp, 2
  5211 00002499 E9C601                   jmp .r1
  5212                                  
  5213                                  ;-546   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}
  5214                                  
  5215                                  .isreg268:
  5216 0000249C 68[7026]                 push isreg_2
  5217 0000249F 8D06A36D                 lea  ax, [symbol]
  5218 000024A3 50                       push ax
  5219 000024A4 E8F1DC                   call eqstr
  5220 000024A7 83C404                   add  sp, 4
  5221 000024AA 08C0                     or  al, al
  5222 000024AC 0F840C00                 je .isreg269
  5223 000024B0 68[7426]                 push isreg_3
  5224 000024B3 E82202                   call doreg
  5225 000024B6 83C402                   add  sp, 2
  5226 000024B9 E9A601                   jmp .r1
  5227                                  
  5228                                  ;-547   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}
  5229                                  
  5230                                  .isreg269:
  5231 000024BC 68[7726]                 push isreg_4
  5232 000024BF 8D06A36D                 lea  ax, [symbol]
  5233 000024C3 50                       push ax
  5234 000024C4 E8D1DC                   call eqstr
  5235 000024C7 83C404                   add  sp, 4
  5236 000024CA 08C0                     or  al, al
  5237 000024CC 0F840C00                 je .isreg270
  5238 000024D0 68[7B26]                 push isreg_5
  5239 000024D3 E80202                   call doreg
  5240 000024D6 83C402                   add  sp, 2
  5241 000024D9 E98601                   jmp .r1
  5242                                  
  5243                                  ;-548   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}
  5244                                  
  5245                                  .isreg270:
  5246 000024DC 68[7E26]                 push isreg_6
  5247 000024DF 8D06A36D                 lea  ax, [symbol]
  5248 000024E3 50                       push ax
  5249 000024E4 E8B1DC                   call eqstr
  5250 000024E7 83C404                   add  sp, 4
  5251 000024EA 08C0                     or  al, al
  5252 000024EC 0F840C00                 je .isreg271
  5253 000024F0 68[8226]                 push isreg_7
  5254 000024F3 E8E201                   call doreg
  5255 000024F6 83C402                   add  sp, 2
  5256 000024F9 E96601                   jmp .r1
  5257                                  
  5258                                  ;-549   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}
  5259                                  
  5260                                  .isreg271:
  5261 000024FC 68[8526]                 push isreg_8
  5262 000024FF 8D06A36D                 lea  ax, [symbol]
  5263 00002503 50                       push ax
  5264 00002504 E891DC                   call eqstr
  5265 00002507 83C404                   add  sp, 4
  5266 0000250A 08C0                     or  al, al
  5267 0000250C 0F840C00                 je .isreg272
  5268 00002510 68[8926]                 push isreg_9
  5269 00002513 E8C201                   call doreg
  5270 00002516 83C402                   add  sp, 2
  5271 00002519 E94601                   jmp .r1
  5272                                  
  5273                                  ;-550   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}
  5274                                  
  5275                                  .isreg272:
  5276 0000251C 68[8C26]                 push isreg_10
  5277 0000251F 8D06A36D                 lea  ax, [symbol]
  5278 00002523 50                       push ax
  5279 00002524 E871DC                   call eqstr
  5280 00002527 83C404                   add  sp, 4
  5281 0000252A 08C0                     or  al, al
  5282 0000252C 0F840C00                 je .isreg273
  5283 00002530 68[9026]                 push isreg_11
  5284 00002533 E8A201                   call doreg
  5285 00002536 83C402                   add  sp, 2
  5286 00002539 E92601                   jmp .r1
  5287                                  
  5288                                  ;-551   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}
  5289                                  
  5290                                  .isreg273:
  5291 0000253C 68[9326]                 push isreg_12
  5292 0000253F 8D06A36D                 lea  ax, [symbol]
  5293 00002543 50                       push ax
  5294 00002544 E851DC                   call eqstr
  5295 00002547 83C404                   add  sp, 4
  5296 0000254A 08C0                     or  al, al
  5297 0000254C 0F840C00                 je .isreg274
  5298 00002550 68[9726]                 push isreg_13
  5299 00002553 E88201                   call doreg
  5300 00002556 83C402                   add  sp, 2
  5301 00002559 E90601                   jmp .r1
  5302                                  
  5303                                  ;-552   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}
  5304                                  
  5305                                  .isreg274:
  5306 0000255C 68[9A26]                 push isreg_14
  5307 0000255F 8D06A36D                 lea  ax, [symbol]
  5308 00002563 50                       push ax
  5309 00002564 E831DC                   call eqstr
  5310 00002567 83C404                   add  sp, 4
  5311 0000256A 08C0                     or  al, al
  5312 0000256C 0F840C00                 je .isreg275
  5313 00002570 68[9E26]                 push isreg_15
  5314 00002573 E86201                   call doreg
  5315 00002576 83C402                   add  sp, 2
  5316 00002579 E9E600                   jmp .r1
  5317                                  
  5318                                  ;-553   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}
  5319                                  
  5320                                  .isreg275:
  5321 0000257C 68[A126]                 push isreg_16
  5322 0000257F 8D06A36D                 lea  ax, [symbol]
  5323 00002583 50                       push ax
  5324 00002584 E811DC                   call eqstr
  5325 00002587 83C404                   add  sp, 4
  5326 0000258A 08C0                     or  al, al
  5327 0000258C 0F840C00                 je .isreg276
  5328 00002590 68[A526]                 push isreg_17
  5329 00002593 E84201                   call doreg
  5330 00002596 83C402                   add  sp, 2
  5331 00002599 E9C600                   jmp .r1
  5332                                  
  5333                                  ;-554   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}
  5334                                  
  5335                                  .isreg276:
  5336 0000259C 68[A826]                 push isreg_18
  5337 0000259F 8D06A36D                 lea  ax, [symbol]
  5338 000025A3 50                       push ax
  5339 000025A4 E8F1DB                   call eqstr
  5340 000025A7 83C404                   add  sp, 4
  5341 000025AA 08C0                     or  al, al
  5342 000025AC 0F840C00                 je .isreg277
  5343 000025B0 68[AC26]                 push isreg_19
  5344 000025B3 E82201                   call doreg
  5345 000025B6 83C402                   add  sp, 2
  5346 000025B9 E9A600                   jmp .r1
  5347                                  
  5348                                  ;-555   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}
  5349                                  
  5350                                  .isreg277:
  5351 000025BC 68[AF26]                 push isreg_20
  5352 000025BF 8D06A36D                 lea  ax, [symbol]
  5353 000025C3 50                       push ax
  5354 000025C4 E8D1DB                   call eqstr
  5355 000025C7 83C404                   add  sp, 4
  5356 000025CA 08C0                     or  al, al
  5357 000025CC 0F840C00                 je .isreg278
  5358 000025D0 68[B326]                 push isreg_21
  5359 000025D3 E80201                   call doreg
  5360 000025D6 83C402                   add  sp, 2
  5361 000025D9 E98600                   jmp .r1
  5362                                  
  5363                                  ;-556   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}
  5364                                  
  5365                                  .isreg278:
  5366 000025DC 68[B626]                 push isreg_22
  5367 000025DF 8D06A36D                 lea  ax, [symbol]
  5368 000025E3 50                       push ax
  5369 000025E4 E8B1DB                   call eqstr
  5370 000025E7 83C404                   add  sp, 4
  5371 000025EA 08C0                     or  al, al
  5372 000025EC 0F840C00                 je .isreg279
  5373 000025F0 68[BA26]                 push isreg_23
  5374 000025F3 E8E200                   call doreg
  5375 000025F6 83C402                   add  sp, 2
  5376 000025F9 E96600                   jmp .r1
  5377                                  
  5378                                  ;-557   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}
  5379                                  
  5380                                  .isreg279:
  5381 000025FC 68[BD26]                 push isreg_24
  5382 000025FF 8D06A36D                 lea  ax, [symbol]
  5383 00002603 50                       push ax
  5384 00002604 E891DB                   call eqstr
  5385 00002607 83C404                   add  sp, 4
  5386 0000260A 08C0                     or  al, al
  5387 0000260C 0F840C00                 je .isreg280
  5388 00002610 68[C126]                 push isreg_25
  5389 00002613 E8C200                   call doreg
  5390 00002616 83C402                   add  sp, 2
  5391 00002619 E94600                   jmp .r1
  5392                                  
  5393                                  ;-558   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}
  5394                                  
  5395                                  .isreg280:
  5396 0000261C 68[C426]                 push isreg_26
  5397 0000261F 8D06A36D                 lea  ax, [symbol]
  5398 00002623 50                       push ax
  5399 00002624 E871DB                   call eqstr
  5400 00002627 83C404                   add  sp, 4
  5401 0000262A 08C0                     or  al, al
  5402 0000262C 0F840C00                 je .isreg281
  5403 00002630 68[C826]                 push isreg_27
  5404 00002633 E8A200                   call doreg
  5405 00002636 83C402                   add  sp, 2
  5406 00002639 E92600                   jmp .r1
  5407                                  
  5408                                  ;-559   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}
  5409                                  
  5410                                  .isreg281:
  5411 0000263C 68[CB26]                 push isreg_28
  5412 0000263F 8D06A36D                 lea  ax, [symbol]
  5413 00002643 50                       push ax
  5414 00002644 E851DB                   call eqstr
  5415 00002647 83C404                   add  sp, 4
  5416 0000264A 08C0                     or  al, al
  5417 0000264C 0F840C00                 je .isreg282
  5418 00002650 68[D226]                 push isreg_29
  5419 00002653 E88200                   call doreg
  5420 00002656 83C402                   add  sp, 2
  5421 00002659 E90600                   jmp .r1
  5422                                  
  5423                                  ;-560   return 0;   r1: return 1;
  5424                                  
  5425                                  .isreg282:
  5426 0000265C B80000                   mov ax, 0
  5427 0000265F E90600                   jmp .retnisreg
  5428                                  .r1:
  5429 00002662 B80100                   mov ax, 1
  5430 00002665 E90000                   jmp .retnisreg
  5431                                  
  5432                                  ;-561 }
  5433                                  
  5434                                  
  5435                                  ;-562 int doreg(char *dr) { int i; expect('=');
  5436                                  
  5437                                   .retnisreg:
  5438 00002668 C3                       ret
  5439 00002669 5F414800                isreg_0 db "_AH",0
  5440 0000266D 616800                  isreg_1 db "ah",0
  5441 00002670 5F414C00                isreg_2 db "_AL",0
  5442 00002674 616C00                  isreg_3 db "al",0
  5443 00002677 5F415800                isreg_4 db "_AX",0
  5444 0000267B 617800                  isreg_5 db "ax",0
  5445 0000267E 5F424800                isreg_6 db "_BH",0
  5446 00002682 626800                  isreg_7 db "bh",0
  5447 00002685 5F424C00                isreg_8 db "_BL",0
  5448 00002689 626C00                  isreg_9 db "bl",0
  5449 0000268C 5F425800                isreg_10 db "_BX",0
  5450 00002690 627800                  isreg_11 db "bx",0
  5451 00002693 5F434800                isreg_12 db "_CH",0
  5452 00002697 636800                  isreg_13 db "ch",0
  5453 0000269A 5F434C00                isreg_14 db "_CL",0
  5454 0000269E 636C00                  isreg_15 db "cl",0
  5455 000026A1 5F435800                isreg_16 db "_CX",0
  5456 000026A5 637800                  isreg_17 db "cx",0
  5457 000026A8 5F444800                isreg_18 db "_DH",0
  5458 000026AC 646800                  isreg_19 db "dh",0
  5459 000026AF 5F444C00                isreg_20 db "_DL",0
  5460 000026B3 646C00                  isreg_21 db "dl",0
  5461 000026B6 5F445800                isreg_22 db "_DX",0
  5462 000026BA 647800                  isreg_23 db "dx",0
  5463 000026BD 5F534900                isreg_24 db "_SI",0
  5464 000026C1 736900                  isreg_25 db "si",0
  5465 000026C4 5F444900                isreg_26 db "_DI",0
  5466 000026C8 646900                  isreg_27 db "di",0
  5467 000026CB 5F464C41475300          isreg_28 db "_FLAGS",0
  5468 000026D2 666C61677300            isreg_29 db "flags",0
  5469                                  ENDP
  5470                                  
  5471                                  doreg: PROC
  5472                                  ;Function : doreg, Number of local variables: 2
  5473                                  ;   # type sign width addr used name   list of local variables
  5474                                  ;  200 ptr sign byte   562 NULL dr = bp+4
  5475                                  ;  201 var sign word   562 NULL i = bp-2;
  5476 000026D8 C8020000                 ENTER  2,0
  5477 000026DC 6A3D                     push 61
  5478 000026DE E86918                   call expect
  5479 000026E1 83C402                   add  sp, 2
  5480                                  
  5481                                  ;-563   prs("\n mov  "); prs(dr); prs(", ");
  5482                                  
  5483 000026E4 68[4727]                 push doreg_0
  5484 000026E7 E87319                   call prs
  5485 000026EA 83C402                   add  sp, 2
  5486 000026ED FF7604                   push word [bp+4]
  5487 000026F0 E86A19                   call prs
  5488 000026F3 83C402                   add  sp, 2
  5489 000026F6 68[5027]                 push doreg_1
  5490 000026F9 E86119                   call prs
  5491 000026FC 83C402                   add  sp, 2
  5492                                  
  5493                                  ;-564        if (istoken(T_CONST)) prunsign1(lexval);
  5494                                  
  5495 000026FF 680101                   push 257
  5496 00002702 E82318                   call istoken
  5497 00002705 83C402                   add  sp, 2
  5498 00002708 08C0                     or  al, al
  5499 0000270A 0F840D00                 je .doreg283
  5500 0000270E FF36[3000]               push word [lexval]
  5501 00002712 E89D1A                   call prunsign1
  5502 00002715 83C402                   add  sp, 2
  5503                                  
  5504                                  ;-565   else if (istoken(T_NAME )) { i=searchname(); v(i); }
  5505                                  
  5506 00002718 E92A00                   jmp .doreg284
  5507                                  .doreg283:
  5508 0000271B 680001                   push 256
  5509 0000271E E80718                   call istoken
  5510 00002721 83C402                   add  sp, 2
  5511 00002724 08C0                     or  al, al
  5512 00002726 0F841200                 je .doreg285
  5513 0000272A E830E2                   call searchname
  5514 0000272D 8946FE                   mov [bp-2], ax
  5515 00002730 FF76FE                   push word [bp-2]
  5516 00002733 E83BDC                   call v
  5517 00002736 83C402                   add  sp, 2
  5518                                  
  5519                                  ;-566   else error1("only number or var allowed"); }
  5520                                  
  5521 00002739 E90900                   jmp .doreg286
  5522                                  .doreg285:
  5523 0000273C 68[5327]                 push doreg_2
  5524 0000273F E87A1C                   call error1
  5525 00002742 83C402                   add  sp, 2
  5526                                  .doreg286:
  5527                                  .doreg284:
  5528                                  
  5529                                  ;-567 
  5530                                  
  5531                                  
  5532                                  ;-568 int doassign(int mode, int i, int ixarr, int ixconst) {
  5533 00002745 C9                       LEAVE
  5534 00002746 C3                       ret
  5535 00002747 5C6E206D6F76202000      doreg_0 db "\n mov  ",0
  5536 00002750 2C2000                  doreg_1 db ", ",0
  5537 00002753 6F6E6C79206E756D62-     doreg_2 db "only number or var allowed",0
  5538 0000275C 6572206F7220766172-
  5539 00002765 20616C6C6F77656400 
  5540                                  ENDP
  5541                                  
  5542                                  doassign: PROC
  5543                                  
  5544                                  ;-569   gettypes(i);
  5545                                  
  5546                                  ;Function : doassign, Number of local variables: 4
  5547                                  ;   # type sign width addr used name   list of local variables
  5548                                  ;  200 var sign word   568 NULL mode = bp+4
  5549                                  ;  201 var sign word   568 NULL i = bp+6
  5550                                  ;  202 var sign word   568 NULL ixarr = bp+8
  5551                                  ;  203 var sign word   568 NULL ixconst = bp+10;
  5552 0000276E C8000000                 ENTER  0,0
  5553 00002772 FF7606                   push word [bp+6]
  5554 00002775 E8A7E0                   call gettypes
  5555 00002778 83C402                   add  sp, 2
  5556                                  
  5557                                  ;-570   if (mode==1) {prs("\n mov  bx, ");v(i);
  5558                                  
  5559 0000277B 8B4604                   mov ax, [bp+4]
  5560 0000277E 83F801                   cmp ax, 1
  5561 00002781 0F853400                 jne .doassign287
  5562 00002785 68[0B29]                 push doassign_0
  5563 00002788 E8D218                   call prs
  5564 0000278B 83C402                   add  sp, 2
  5565 0000278E FF7606                   push word [bp+6]
  5566 00002791 E8DDDB                   call v
  5567 00002794 83C402                   add  sp, 2
  5568                                  
  5569                                  ;-571     if (widthi == 2) prs("\n mov  [bx], ax");
  5570                                  
  5571 00002797 A1[3800]                 mov ax, [widthi]
  5572 0000279A 83F802                   cmp ax, 2
  5573 0000279D 0F850C00                 jne .doassign288
  5574 000027A1 68[1829]                 push doassign_1
  5575 000027A4 E8B618                   call prs
  5576 000027A7 83C402                   add  sp, 2
  5577                                  
  5578                                  ;-572     else  prs("\n mov  [bx], al"); return;}
  5579                                  
  5580 000027AA E90900                   jmp .doassign289
  5581                                  .doassign288:
  5582 000027AD 68[2929]                 push doassign_2
  5583 000027B0 E8AA18                   call prs
  5584 000027B3 83C402                   add  sp, 2
  5585                                  .doassign289:
  5586 000027B6 E95001                   jmp .retndoassign
  5587                                  
  5588                                  ;-573   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}
  5589                                  
  5590                                  .doassign287:
  5591 000027B9 8B4604                   mov ax, [bp+4]
  5592 000027BC 83F802                   cmp ax, 2
  5593 000027BF 0F851E00                 jne .doassign290
  5594 000027C3 68[3A29]                 push doassign_3
  5595 000027C6 E89418                   call prs
  5596 000027C9 83C402                   add  sp, 2
  5597 000027CC FF7606                   push word [bp+6]
  5598 000027CF E890DB                   call a
  5599 000027D2 83C402                   add  sp, 2
  5600 000027D5 68[4329]                 push doassign_4
  5601 000027D8 E88218                   call prs
  5602 000027DB 83C402                   add  sp, 2
  5603 000027DE E92801                   jmp .retndoassign
  5604                                  
  5605                                  ;-574   if (ixarr) {  prs("\n mov bx, ");
  5606                                  
  5607                                  .doassign290:
  5608 000027E1 8B4608                   mov ax, [bp+8]
  5609 000027E4 08C0                     or  al, al
  5610 000027E6 0F846E00                 je .doassign291
  5611 000027EA 68[4829]                 push doassign_5
  5612 000027ED E86D18                   call prs
  5613 000027F0 83C402                   add  sp, 2
  5614                                  
  5615                                  ;-575     if(ixconst) prunsign1(ixarr); else v(ixarr);
  5616                                  
  5617 000027F3 8B460A                   mov ax, [bp+10]
  5618 000027F6 08C0                     or  al, al
  5619 000027F8 0F840C00                 je .doassign292
  5620 000027FC FF7608                   push word [bp+8]
  5621 000027FF E8B019                   call prunsign1
  5622 00002802 83C402                   add  sp, 2
  5623 00002805 E90900                   jmp .doassign293
  5624                                  .doassign292:
  5625 00002808 FF7608                   push word [bp+8]
  5626 0000280B E863DB                   call v
  5627 0000280E 83C402                   add  sp, 2
  5628                                  
  5629                                  ;-576     if (wi==2) prs("\n shl bx, 1");
  5630                                  
  5631                                  .doassign293:
  5632 00002811 A1[3B00]                 mov ax, [wi]
  5633 00002814 83F802                   cmp ax, 2
  5634 00002817 0F850900                 jne .doassign294
  5635 0000281B 68[5429]                 push doassign_6
  5636 0000281E E83C18                   call prs
  5637 00002821 83C402                   add  sp, 2
  5638                                  
  5639                                  ;-577     prs("\n mov ["); printName(i);
  5640                                  
  5641                                  .doassign294:
  5642 00002824 68[6129]                 push doassign_7
  5643 00002827 E83318                   call prs
  5644 0000282A 83C402                   add  sp, 2
  5645 0000282D FF7606                   push word [bp+6]
  5646 00002830 E8C6E0                   call printName
  5647 00002833 83C402                   add  sp, 2
  5648                                  
  5649                                  ;-578     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }
  5650                                  
  5651 00002836 A1[3B00]                 mov ax, [wi]
  5652 00002839 83F802                   cmp ax, 2
  5653 0000283C 0F850C00                 jne .doassign295
  5654 00002840 68[6A29]                 push doassign_8
  5655 00002843 E81718                   call prs
  5656 00002846 83C402                   add  sp, 2
  5657 00002849 E90900                   jmp .doassign296
  5658                                  .doassign295:
  5659 0000284C 68[7329]                 push doassign_9
  5660 0000284F E80B18                   call prs
  5661 00002852 83C402                   add  sp, 2
  5662                                  .doassign296:
  5663 00002855 E9B100                   jmp .retndoassign
  5664                                  
  5665                                  ;-579   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");
  5666                                  
  5667                                  .doassign291:
  5668 00002858 A1[3B00]                 mov ax, [wi]
  5669 0000285B 83F801                   cmp ax, 1
  5670 0000285E 0F853100                 jne .doassign297
  5671 00002862 68[7C29]                 push doassign_10
  5672 00002865 E8F517                   call prs
  5673 00002868 83C402                   add  sp, 2
  5674 0000286B 8B4606                   mov ax, [bp+6]
  5675 0000286E 3DC800                   cmp ax, 200
  5676 00002871 0F8D0900                 jge .doassign298
  5677 00002875 68[8429]                 push doassign_11
  5678 00002878 E8E217                   call prs
  5679 0000287B 83C402                   add  sp, 2
  5680                                  
  5681                                  ;-580     } v(i); prs(", al"); return; }
  5682                                  
  5683                                  .doassign298:
  5684 0000287E FF7606                   push word [bp+6]
  5685 00002881 E8EDDA                   call v
  5686 00002884 83C402                   add  sp, 2
  5687 00002887 68[8A29]                 push doassign_12
  5688 0000288A E8D017                   call prs
  5689 0000288D 83C402                   add  sp, 2
  5690 00002890 E97600                   jmp .retndoassign
  5691                                  
  5692                                  ;-581   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");
  5693                                  
  5694                                  .doassign297:
  5695 00002893 A1[3B00]                 mov ax, [wi]
  5696 00002896 83F802                   cmp ax, 2
  5697 00002899 0F853100                 jne .doassign299
  5698 0000289D 68[8F29]                 push doassign_13
  5699 000028A0 E8BA17                   call prs
  5700 000028A3 83C402                   add  sp, 2
  5701 000028A6 8B4606                   mov ax, [bp+6]
  5702 000028A9 3DC800                   cmp ax, 200
  5703 000028AC 0F8D0900                 jge .doassign300
  5704 000028B0 68[9729]                 push doassign_14
  5705 000028B3 E8A717                   call prs
  5706 000028B6 83C402                   add  sp, 2
  5707                                  
  5708                                  ;-582     } v(i); prs(", ax"); return; }
  5709                                  
  5710                                  .doassign300:
  5711 000028B9 FF7606                   push word [bp+6]
  5712 000028BC E8B2DA                   call v
  5713 000028BF 83C402                   add  sp, 2
  5714 000028C2 68[9D29]                 push doassign_15
  5715 000028C5 E89517                   call prs
  5716 000028C8 83C402                   add  sp, 2
  5717 000028CB E93B00                   jmp .retndoassign
  5718                                  
  5719                                  ;-583   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");
  5720                                  
  5721                                  .doassign299:
  5722 000028CE A1[3B00]                 mov ax, [wi]
  5723 000028D1 83F804                   cmp ax, 4
  5724 000028D4 0F853100                 jne .doassign301
  5725 000028D8 68[A229]                 push doassign_16
  5726 000028DB E87F17                   call prs
  5727 000028DE 83C402                   add  sp, 2
  5728 000028E1 8B4606                   mov ax, [bp+6]
  5729 000028E4 3DC800                   cmp ax, 200
  5730 000028E7 0F8D0900                 jge .doassign302
  5731 000028EB 68[AA29]                 push doassign_17
  5732 000028EE E86C17                   call prs
  5733 000028F1 83C402                   add  sp, 2
  5734                                  
  5735                                  ;-584     } v(i); prs(", eax"); return; }
  5736                                  
  5737                                  .doassign302:
  5738 000028F4 FF7606                   push word [bp+6]
  5739 000028F7 E877DA                   call v
  5740 000028FA 83C402                   add  sp, 2
  5741 000028FD 68[B129]                 push doassign_18
  5742 00002900 E85A17                   call prs
  5743 00002903 83C402                   add  sp, 2
  5744 00002906 E90000                   jmp .retndoassign
  5745                                  
  5746                                  ;-585 }
  5747                                  
  5748                                  .doassign301:
  5749                                  
  5750                                  ;-586 int domul(int ids) {
  5751                                  
  5752 00002909 C9                       .retndoassign: LEAVE
  5753 0000290A C3                       ret
  5754 0000290B 5C6E206D6F76202062-     doassign_0 db "\n mov  bx, ",0
  5755 00002914 782C2000           
  5756 00002918 5C6E206D6F7620205B-     doassign_1 db "\n mov  [bx], ax",0
  5757 00002921 62785D2C20617800   
  5758 00002929 5C6E206D6F7620205B-     doassign_2 db "\n mov  [bx], al",0
  5759 00002932 62785D2C20616C00   
  5760 0000293A 5C6E206D6F76202000      doassign_3 db "\n mov  ",0
  5761 00002943 2C20617800              doassign_4 db ", ax",0
  5762 00002948 5C6E206D6F76206278-     doassign_5 db "\n mov bx, ",0
  5763 00002951 2C2000             
  5764 00002954 5C6E2073686C206278-     doassign_6 db "\n shl bx, 1",0
  5765 0000295D 2C203100           
  5766 00002961 5C6E206D6F76205B00      doassign_7 db "\n mov [",0
  5767 0000296A 2B62785D2C20617800      doassign_8 db "+bx], ax",0
  5768 00002973 2B62785D2C20616C00      doassign_9 db "+bx], al",0
  5769 0000297C 5C6E206D6F762000        doassign_10 db "\n mov ",0
  5770 00002984 627974652000            doassign_11 db "byte ",0
  5771 0000298A 2C20616C00              doassign_12 db ", al",0
  5772 0000298F 5C6E206D6F762000        doassign_13 db "\n mov ",0
  5773 00002997 776F72642000            doassign_14 db "word ",0
  5774 0000299D 2C20617800              doassign_15 db ", ax",0
  5775 000029A2 5C6E206D6F762000        doassign_16 db "\n mov ",0
  5776 000029AA 64776F72642000          doassign_17 db "dword ",0
  5777 000029B1 2C2065617800            doassign_18 db ", eax",0
  5778                                  ENDP
  5779                                  
  5780                                  domul: PROC
  5781                                  
  5782                                  ;-587   if (ids) rterm("imul"); else {
  5783                                  
  5784                                  ;Function : domul, Number of local variables: 1
  5785                                  ;   # type sign width addr used name   list of local variables
  5786                                  ;  200 var sign word   586 NULL ids = bp+4;
  5787 000029B7 C8000000                 ENTER  0,0
  5788 000029BB 8B4604                   mov ax, [bp+4]
  5789 000029BE 08C0                     or  al, al
  5790 000029C0 0F840C00                 je .domul303
  5791 000029C4 68[092A]                 push domul_0
  5792 000029C7 E899F9                   call rterm
  5793 000029CA 83C402                   add  sp, 2
  5794 000029CD E93700                   jmp .domul304
  5795                                  .domul303:
  5796                                  
  5797                                  ;-588   if (istoken(T_CONST)) {
  5798                                  
  5799 000029D0 680101                   push 257
  5800 000029D3 E85215                   call istoken
  5801 000029D6 83C402                   add  sp, 2
  5802 000029D9 08C0                     or  al, al
  5803 000029DB 0F841F00                 je .domul305
  5804                                  
  5805                                  ;-589     prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx"); 
  5806                                  
  5807 000029DF 68[0E2A]                 push domul_1
  5808 000029E2 E87816                   call prs
  5809 000029E5 83C402                   add  sp, 2
  5810 000029E8 FF36[3000]               push word [lexval]
  5811 000029EC E8C317                   call prunsign1
  5812 000029EF 83C402                   add  sp, 2
  5813 000029F2 68[1A2A]                 push domul_2
  5814 000029F5 E86516                   call prs
  5815 000029F8 83C402                   add  sp, 2
  5816                                  
  5817                                  ;-590     }
  5818                                  
  5819                                  
  5820                                  ;-591   else error1("with MUL only const number as multiplicator allowed"); } }
  5821                                  
  5822 000029FB E90900                   jmp .domul306
  5823                                  .domul305:
  5824 000029FE 68[242A]                 push domul_3
  5825 00002A01 E8B819                   call error1
  5826 00002A04 83C402                   add  sp, 2
  5827                                  .domul306:
  5828                                  .domul304:
  5829                                  
  5830                                  ;-592 int doidiv(int ids) { int mode; int id1;
  5831 00002A07 C9                       LEAVE
  5832 00002A08 C3                       ret
  5833 00002A09 696D756C00              domul_0 db "imul",0
  5834 00002A0E 5C6E206D6F76206278-     domul_1 db "\n mov bx, ",0
  5835 00002A17 2C2000             
  5836 00002A1A 5C6E206D756C206278-     domul_2 db "\n mul bx",0
  5837 00002A23 00                 
  5838 00002A24 77697468204D554C20-     domul_3 db "with MUL only const number as multiplicator allowed",0
  5839 00002A2D 6F6E6C7920636F6E73-
  5840 00002A36 74206E756D62657220-
  5841 00002A3F 6173206D756C746970-
  5842 00002A48 6C696361746F722061-
  5843 00002A51 6C6C6F77656400     
  5844                                  ENDP
  5845                                  
  5846                                  doidiv: PROC
  5847                                  
  5848                                  ;-593   if (istoken(T_CONST)) {
  5849                                  
  5850                                  ;Function : doidiv, Number of local variables: 3
  5851                                  ;   # type sign width addr used name   list of local variables
  5852                                  ;  200 var sign word   592 NULL ids = bp+4
  5853                                  ;  201 var sign word   592 NULL mode = bp-2
  5854                                  ;  202 var sign word   592 NULL id1 = bp-4;
  5855 00002A58 C8040000                 ENTER  4,0
  5856 00002A5C 680101                   push 257
  5857 00002A5F E8C614                   call istoken
  5858 00002A62 83C402                   add  sp, 2
  5859 00002A65 08C0                     or  al, al
  5860 00002A67 0F843400                 je .doidiv307
  5861                                  
  5862                                  ;-594     prs("\n mov bx, "); prunsign1(lexval);
  5863                                  
  5864 00002A6B 68[1D2B]                 push doidiv_0
  5865 00002A6E E8EC15                   call prs
  5866 00002A71 83C402                   add  sp, 2
  5867 00002A74 FF36[3000]               push word [lexval]
  5868 00002A78 E83717                   call prunsign1
  5869 00002A7B 83C402                   add  sp, 2
  5870                                  
  5871                                  ;-595     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5872                                  
  5873 00002A7E 8B4604                   mov ax, [bp+4]
  5874 00002A81 08C0                     or  al, al
  5875 00002A83 0F840C00                 je .doidiv308
  5876 00002A87 68[292B]                 push doidiv_1
  5877 00002A8A E8D015                   call prs
  5878 00002A8D 83C402                   add  sp, 2
  5879 00002A90 E90900                   jmp .doidiv309
  5880                                  .doidiv308:
  5881 00002A93 68[3A2B]                 push doidiv_2
  5882 00002A96 E8C415                   call prs
  5883 00002A99 83C402                   add  sp, 2
  5884                                  .doidiv309:
  5885                                  
  5886                                  ;-596   else {
  5887                                  
  5888 00002A9C E97C00                   jmp .doidiv310
  5889                                  .doidiv307:
  5890                                  
  5891                                  ;-597     mode=typeName(); id1=searchname();
  5892                                  
  5893 00002A9F E88ADF                   call typeName
  5894 00002AA2 8946FE                   mov [bp-2], ax
  5895 00002AA5 E8B5DE                   call searchname
  5896 00002AA8 8946FC                   mov [bp-4], ax
  5897                                  
  5898                                  ;-598     if (mode) error1("only const number or int as divisor allowed");
  5899                                  
  5900 00002AAB 8B46FE                   mov ax, [bp-2]
  5901 00002AAE 08C0                     or  al, al
  5902 00002AB0 0F840900                 je .doidiv311
  5903 00002AB4 68[502B]                 push doidiv_3
  5904 00002AB7 E80219                   call error1
  5905 00002ABA 83C402                   add  sp, 2
  5906                                  
  5907                                  ;-599     gettypes(id1);
  5908                                  
  5909                                  .doidiv311:
  5910 00002ABD FF76FC                   push word [bp-4]
  5911 00002AC0 E85CDD                   call gettypes
  5912 00002AC3 83C402                   add  sp, 2
  5913                                  
  5914                                  ;-600     if (typei) error1("only int as simple var divisor allowed");
  5915                                  
  5916 00002AC6 A1[3200]                 mov ax, [typei]
  5917 00002AC9 08C0                     or  al, al
  5918 00002ACB 0F840900                 je .doidiv312
  5919 00002ACF 68[7C2B]                 push doidiv_4
  5920 00002AD2 E8E718                   call error1
  5921 00002AD5 83C402                   add  sp, 2
  5922                                  
  5923                                  ;-601     if (wi!=2) error1("only int, no byte as divisor allowed");
  5924                                  
  5925                                  .doidiv312:
  5926 00002AD8 A1[3B00]                 mov ax, [wi]
  5927 00002ADB 83F802                   cmp ax, 2
  5928 00002ADE 0F840900                 je  .doidiv313
  5929 00002AE2 68[A32B]                 push doidiv_5
  5930 00002AE5 E8D418                   call error1
  5931 00002AE8 83C402                   add  sp, 2
  5932                                  
  5933                                  ;-602     prs("\n mov bx, "); v(id1);
  5934                                  
  5935                                  .doidiv313:
  5936 00002AEB 68[C82B]                 push doidiv_6
  5937 00002AEE E86C15                   call prs
  5938 00002AF1 83C402                   add  sp, 2
  5939 00002AF4 FF76FC                   push word [bp-4]
  5940 00002AF7 E877D8                   call v
  5941 00002AFA 83C402                   add  sp, 2
  5942                                  
  5943                                  ;-603     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5944                                  
  5945 00002AFD 8B4604                   mov ax, [bp+4]
  5946 00002B00 08C0                     or  al, al
  5947 00002B02 0F840C00                 je .doidiv314
  5948 00002B06 68[D42B]                 push doidiv_7
  5949 00002B09 E85115                   call prs
  5950 00002B0C 83C402                   add  sp, 2
  5951 00002B0F E90900                   jmp .doidiv315
  5952                                  .doidiv314:
  5953 00002B12 68[E52B]                 push doidiv_8
  5954 00002B15 E84515                   call prs
  5955 00002B18 83C402                   add  sp, 2
  5956                                  .doidiv315:
  5957                                  
  5958                                  ;-604 }
  5959                                  
  5960                                  .doidiv310:
  5961                                  
  5962                                  ;-605 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
  5963 00002B1B C9                       LEAVE
  5964 00002B1C C3                       ret
  5965 00002B1D 5C6E206D6F76206278-     doidiv_0 db "\n mov bx, ",0
  5966 00002B26 2C2000             
  5967 00002B29 5C6E206377645C6E20-     doidiv_1 db "\n cwd\n idiv bx",0
  5968 00002B32 6964697620627800   
  5969 00002B3A 5C6E206D6F76206478-     doidiv_2 db "\n mov dx, 0\n div bx",0
  5970 00002B43 2C20305C6E20646976-
  5971 00002B4C 20627800           
  5972 00002B50 6F6E6C7920636F6E73-     doidiv_3 db "only const number or int as divisor allowed",0
  5973 00002B59 74206E756D62657220-
  5974 00002B62 6F7220696E74206173-
  5975 00002B6B 2064697669736F7220-
  5976 00002B74 616C6C6F77656400   
  5977 00002B7C 6F6E6C7920696E7420-     doidiv_4 db "only int as simple var divisor allowed",0
  5978 00002B85 61732073696D706C65-
  5979 00002B8E 207661722064697669-
  5980 00002B97 736F7220616C6C6F77-
  5981 00002BA0 656400             
  5982 00002BA3 6F6E6C7920696E742C-     doidiv_5 db "only int, no byte as divisor allowed",0
  5983 00002BAC 206E6F206279746520-
  5984 00002BB5 61732064697669736F-
  5985 00002BBE 7220616C6C6F776564-
  5986 00002BC7 00                 
  5987 00002BC8 5C6E206D6F76206278-     doidiv_6 db "\n mov bx, ",0
  5988 00002BD1 2C2000             
  5989 00002BD4 5C6E206377645C6E20-     doidiv_7 db "\n cwd\n idiv bx",0
  5990 00002BDD 6964697620627800   
  5991 00002BE5 5C6E206D6F76206478-     doidiv_8 db "\n mov dx, 0\n div bx",0
  5992 00002BEE 2C20305C6E20646976-
  5993 00002BF7 20627800           
  5994                                  ENDP
  5995                                  
  5996                                  domod: PROC
  5997                                  ;Function : domod, Number of local variables: 1
  5998                                  ;   # type sign width addr used name   list of local variables
  5999                                  ;  200 var sign word   605 NULL ids = bp+4;
  6000 00002BFB C8000000                 ENTER  0,0
  6001 00002BFF FF7604                   push word [bp+4]
  6002 00002C02 E853FE                   call doidiv
  6003 00002C05 83C402                   add  sp, 2
  6004 00002C08 68[132C]                 push domod_0
  6005 00002C0B E84F14                   call prs
  6006 00002C0E 83C402                   add  sp, 2
  6007                                  
  6008                                  ;-606 
  6009                                  
  6010                                  
  6011                                  ;-607 int docalltype[10]; int docallvalue[10];
  6012 00002C11 C9                       LEAVE
  6013 00002C12 C3                       ret
  6014 00002C13 5C6E206D6F76206178-     domod_0 db "\n mov ax, dx",0
  6015 00002C1C 2C20647800         
  6016                                  ENDP
  6017                                  section .bss
  6018                                  absolute 48411
  6019 0000BD1B <res 00000014>          docalltype resw 10
  6020                                  section .text
  6021                                  section .bss
  6022                                  absolute 48431
  6023 0000BD2F <res 00000014>          docallvalue resw 10
  6024                                  section .text
  6025                                  
  6026                                  ;-608 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register
  6027                                  
  6028                                  section .bss
  6029                                  absolute 48451
  6030 0000BD43 <res 00000011>          procname resb 17
  6031                                  section .text
  6032                                  
  6033                                  ;-609 int docall1() {int i; int narg; int t0; int n0;  int sz32;
  6034                                  
  6035                                  
  6036                                  docall1: PROC
  6037                                  
  6038                                  ;-610   narg=0;  sz32=0;
  6039                                  
  6040                                  ;Function : docall1, Number of local variables: 5
  6041                                  ;   # type sign width addr used name   list of local variables
  6042                                  ;  200 var sign word   609 NULL i = bp-2
  6043                                  ;  201 var sign word   609 NULL narg = bp-4
  6044                                  ;  202 var sign word   609 NULL t0 = bp-6
  6045                                  ;  203 var sign word   609 NULL n0 = bp-8
  6046                                  ;  204 var sign word   609 NULL sz32 = bp-10;
  6047 00002C21 C80A0000                 ENTER  10,0
  6048 00002C25 B80000                   mov ax, 0
  6049 00002C28 8946FC                   mov [bp-4], ax
  6050 00002C2B B80000                   mov ax, 0
  6051 00002C2E 8946F6                   mov [bp-10], ax
  6052                                  
  6053                                  ;-611   checknamelen();
  6054                                  
  6055 00002C31 E870D7                   call checknamelen
  6056                                  
  6057                                  ;-612   strcpy(&procname, symbol);
  6058                                  
  6059 00002C34 8D06A36D                 lea  ax, [symbol]
  6060 00002C38 50                       push ax
  6061 00002C39 8D0643BD                 lea  ax, [procname]
  6062 00002C3D 50                       push ax
  6063 00002C3E E827D5                   call strcpy
  6064 00002C41 83C404                   add  sp, 4
  6065                                  
  6066                                  ;-613   storecall();
  6067                                  
  6068 00002C44 E8E6DE                   call storecall
  6069                                  
  6070                                  ;-614   expect('(');
  6071                                  
  6072 00002C47 6A28                     push 40
  6073 00002C49 E8FE12                   call expect
  6074 00002C4C 83C402                   add  sp, 2
  6075                                  
  6076                                  ;-615 	if (istoken(')') ==0 ) {
  6077                                  
  6078 00002C4F 6A29                     push 41
  6079 00002C51 E8D412                   call istoken
  6080 00002C54 83C402                   add  sp, 2
  6081 00002C57 83F800                   cmp ax, 0
  6082 00002C5A 0F857802                 jne .docall1316
  6083                                  
  6084                                  ;-616 	  do { narg++;
  6085                                  
  6086                                  .docall1317:
  6087 00002C5E FF46FC                   inc  word[bp-4]
  6088                                  
  6089                                  ;-617 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;
  6090                                  
  6091 00002C61 8B46FC                   mov ax, [bp-4]
  6092 00002C64 83F809                   cmp ax, 9
  6093 00002C67 0F8E0900                 jle .docall1318
  6094 00002C6B 68[1A2F]                 push docall1_0
  6095 00002C6E E84B17                   call error1
  6096 00002C71 83C402                   add  sp, 2
  6097                                  .docall1318:
  6098 00002C74 B80000                   mov ax, 0
  6099 00002C77 8946FA                   mov [bp-6], ax
  6100                                  
  6101                                  ;-618       if(istoken(T_CONST)) {t0=1; n0=lexval; }
  6102                                  
  6103 00002C7A 680101                   push 257
  6104 00002C7D E8A812                   call istoken
  6105 00002C80 83C402                   add  sp, 2
  6106 00002C83 08C0                     or  al, al
  6107 00002C85 0F840C00                 je .docall1319
  6108 00002C89 B80100                   mov ax, 1
  6109 00002C8C 8946FA                   mov [bp-6], ax
  6110 00002C8F A1[3000]                 mov ax, [lexval]
  6111 00002C92 8946F8                   mov [bp-8], ax
  6112                                  
  6113                                  ;-619       if(istoken(T_STRING)){t0=2; n0=nconst;
  6114                                  
  6115                                  .docall1319:
  6116 00002C95 680201                   push 258
  6117 00002C98 E88D12                   call istoken
  6118 00002C9B 83C402                   add  sp, 2
  6119 00002C9E 08C0                     or  al, al
  6120 00002CA0 0F846300                 je .docall1320
  6121 00002CA4 B80200                   mov ax, 2
  6122 00002CA7 8946FA                   mov [bp-6], ax
  6123 00002CAA A1[2600]                 mov ax, [nconst]
  6124 00002CAD 8946F8                   mov [bp-8], ax
  6125                                  
  6126                                  ;-620         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");
  6127                                  
  6128 00002CB0 68[2C2F]                 push docall1_1
  6129 00002CB3 E81213                   call eprs
  6130 00002CB6 83C402                   add  sp, 2
  6131 00002CB9 8D06236E                 lea  ax, [fname]
  6132 00002CBD 50                       push ax
  6133 00002CBE E80713                   call eprs
  6134 00002CC1 83C402                   add  sp, 2
  6135 00002CC4 6A5F                     push 95
  6136 00002CC6 E8EC12                   call eprc
  6137 00002CC9 83C402                   add  sp, 2
  6138 00002CCC FF36[2600]               push word [nconst]
  6139 00002CD0 E81E14                   call eprnum
  6140 00002CD3 83C402                   add  sp, 2
  6141 00002CD6 68[2F2F]                 push docall1_2
  6142 00002CD9 E8EC12                   call eprs
  6143 00002CDC 83C402                   add  sp, 2
  6144                                  
  6145                                  ;-621         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }
  6146                                  
  6147 00002CDF 6A22                     push 34
  6148 00002CE1 E8D112                   call eprc
  6149 00002CE4 83C402                   add  sp, 2
  6150 00002CE7 8D06A36D                 lea  ax, [symbol]
  6151 00002CEB 50                       push ax
  6152 00002CEC E8D912                   call eprs
  6153 00002CEF 83C402                   add  sp, 2
  6154 00002CF2 6A22                     push 34
  6155 00002CF4 E8BE12                   call eprc
  6156 00002CF7 83C402                   add  sp, 2
  6157 00002CFA 68[342F]                 push docall1_3
  6158 00002CFD E8C812                   call eprs
  6159 00002D00 83C402                   add  sp, 2
  6160 00002D03 FF06[2600]               inc  word[nconst]
  6161                                  
  6162                                  ;-622       if(istoken('&'))     {t0=3; name1(); n0=searchname();}
  6163                                  
  6164                                  .docall1320:
  6165 00002D07 6A26                     push 38
  6166 00002D09 E81C12                   call istoken
  6167 00002D0C 83C402                   add  sp, 2
  6168 00002D0F 08C0                     or  al, al
  6169 00002D11 0F840F00                 je .docall1321
  6170 00002D15 B80300                   mov ax, 3
  6171 00002D18 8946FA                   mov [bp-6], ax
  6172 00002D1B E8E7DD                   call name1
  6173 00002D1E E83CDC                   call searchname
  6174 00002D21 8946F8                   mov [bp-8], ax
  6175                                  
  6176                                  ;-623       if(istoken(T_NAME))  { n0=checkreg();
  6177                                  
  6178                                  .docall1321:
  6179 00002D24 680001                   push 256
  6180 00002D27 E8FE11                   call istoken
  6181 00002D2A 83C402                   add  sp, 2
  6182 00002D2D 08C0                     or  al, al
  6183 00002D2F 0F844800                 je .docall1322
  6184 00002D33 E8DFEA                   call checkreg
  6185 00002D36 8946F8                   mov [bp-8], ax
  6186                                  
  6187                                  ;-624         if (n0) t0=5;
  6188                                  
  6189 00002D39 8B46F8                   mov ax, [bp-8]
  6190 00002D3C 08C0                     or  al, al
  6191 00002D3E 0F840900                 je .docall1323
  6192 00002D42 B80500                   mov ax, 5
  6193 00002D45 8946FA                   mov [bp-6], ax
  6194                                  
  6195                                  ;-625         else {t0=4; n0=searchname();
  6196                                  
  6197 00002D48 E93000                   jmp .docall1324
  6198                                  .docall1323:
  6199 00002D4B B80400                   mov ax, 4
  6200 00002D4E 8946FA                   mov [bp-6], ax
  6201 00002D51 E809DC                   call searchname
  6202 00002D54 8946F8                   mov [bp-8], ax
  6203                                  
  6204                                  ;-626           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }
  6205                                  
  6206 00002D57 B82F6F                   mov ax, GType
  6207 00002D5A A3[6E00]                 mov word [p1], ax
  6208 00002D5D A1[6E00]                 mov ax, [p1]
  6209 00002D60 0346F8                   add ax, [bp-8]
  6210 00002D63 A3[6E00]                 mov word [p1], ax
  6211 00002D66 8B1E[6E00]               mov bx, [p1]
  6212 00002D6A 8A07                     mov al, [bx]
  6213 00002D6C B400                     mov ah, 0
  6214 00002D6E 83F826                   cmp ax, 38
  6215 00002D71 0F850600                 jne .docall1325
  6216 00002D75 B80300                   mov ax, 3
  6217 00002D78 8946FA                   mov [bp-6], ax
  6218                                  .docall1325:
  6219                                  .docall1324:
  6220                                  
  6221                                  ;-627       if (t0==0) error1("parameter not recognized (no * allowed)");
  6222                                  
  6223                                  .docall1322:
  6224 00002D7B 8B46FA                   mov ax, [bp-6]
  6225 00002D7E 83F800                   cmp ax, 0
  6226 00002D81 0F850900                 jne .docall1326
  6227 00002D85 68[372F]                 push docall1_4
  6228 00002D88 E83116                   call error1
  6229 00002D8B 83C402                   add  sp, 2
  6230                                  
  6231                                  ;-628       docalltype [narg] = t0;
  6232                                  
  6233                                  .docall1326:
  6234 00002D8E 8B46FA                   mov ax, [bp-6]
  6235 00002D91 8B5EFC                   mov bx, [bp-4]
  6236 00002D94 D1E3                     shl bx, 1
  6237 00002D96 89871BBD                 mov [docalltype+bx], ax
  6238                                  
  6239                                  ;-629       docallvalue[narg] = n0;
  6240                                  
  6241 00002D9A 8B46F8                   mov ax, [bp-8]
  6242 00002D9D 8B5EFC                   mov bx, [bp-4]
  6243 00002DA0 D1E3                     shl bx, 1
  6244 00002DA2 89872FBD                 mov [docallvalue+bx], ax
  6245                                  
  6246                                  ;-630     } while (istoken(','));
  6247                                  
  6248 00002DA6 6A2C                     push 44
  6249 00002DA8 E87D11                   call istoken
  6250 00002DAB 83C402                   add  sp, 2
  6251 00002DAE 08C0                     or  al, al
  6252 00002DB0 0F840300                 je .docall1327
  6253 00002DB4 E9A7FE                   jmp .docall1317
  6254                                  .docall1327:
  6255                                  
  6256                                  ;-631 
  6257                                  
  6258                                  
  6259                                  ;-632   	expect(')');  i=narg;
  6260                                  
  6261 00002DB7 6A29                     push 41
  6262 00002DB9 E88E11                   call expect
  6263 00002DBC 83C402                   add  sp, 2
  6264 00002DBF 8B46FC                   mov ax, [bp-4]
  6265 00002DC2 8946FE                   mov [bp-2], ax
  6266                                  
  6267                                  ;-633     do {
  6268                                  
  6269                                  .docall1328:
  6270                                  
  6271                                  ;-634       t0 = docalltype [i];
  6272                                  
  6273 00002DC5 8B5EFE                   mov bx, [bp-2]
  6274 00002DC8 D1E3                     shl bx, 1
  6275 00002DCA 8B871BBD                 mov ax, [docalltype + bx]
  6276 00002DCE 8946FA                   mov [bp-6], ax
  6277                                  
  6278                                  ;-635       n0 = docallvalue[i];
  6279                                  
  6280 00002DD1 8B5EFE                   mov bx, [bp-2]
  6281 00002DD4 D1E3                     shl bx, 1
  6282 00002DD6 8B872FBD                 mov ax, [docallvalue + bx]
  6283 00002DDA 8946F8                   mov [bp-8], ax
  6284                                  
  6285                                  ;-636       if(t0==1){ prs("\n push "); prunsign1(n0);}
  6286                                  
  6287 00002DDD 8B46FA                   mov ax, [bp-6]
  6288 00002DE0 83F801                   cmp ax, 1
  6289 00002DE3 0F851200                 jne .docall1329
  6290 00002DE7 68[5F2F]                 push docall1_5
  6291 00002DEA E87012                   call prs
  6292 00002DED 83C402                   add  sp, 2
  6293 00002DF0 FF76F8                   push word [bp-8]
  6294 00002DF3 E8BC13                   call prunsign1
  6295 00002DF6 83C402                   add  sp, 2
  6296                                  
  6297                                  ;-637       if(t0==2){ prs("\n push ");
  6298                                  
  6299                                  .docall1329:
  6300 00002DF9 8B46FA                   mov ax, [bp-6]
  6301 00002DFC 83F802                   cmp ax, 2
  6302 00002DFF 0F852500                 jne .docall1330
  6303 00002E03 68[682F]                 push docall1_6
  6304 00002E06 E85412                   call prs
  6305 00002E09 83C402                   add  sp, 2
  6306                                  
  6307                                  ;-638         prs(fname);prc(95);prunsign1(n0);}
  6308                                  
  6309 00002E0C 8D06236E                 lea  ax, [fname]
  6310 00002E10 50                       push ax
  6311 00002E11 E84912                   call prs
  6312 00002E14 83C402                   add  sp, 2
  6313 00002E17 6A5F                     push 95
  6314 00002E19 E8DA11                   call prc
  6315 00002E1C 83C402                   add  sp, 2
  6316 00002E1F FF76F8                   push word [bp-8]
  6317 00002E22 E88D13                   call prunsign1
  6318 00002E25 83C402                   add  sp, 2
  6319                                  
  6320                                  ;-639       if(t0==3){ prs("\n lea  ax, ");   v(n0);
  6321                                  
  6322                                  .docall1330:
  6323 00002E28 8B46FA                   mov ax, [bp-6]
  6324 00002E2B 83F803                   cmp ax, 3
  6325 00002E2E 0F851B00                 jne .docall1331
  6326 00002E32 68[712F]                 push docall1_7
  6327 00002E35 E82512                   call prs
  6328 00002E38 83C402                   add  sp, 2
  6329 00002E3B FF76F8                   push word [bp-8]
  6330 00002E3E E830D5                   call v
  6331 00002E41 83C402                   add  sp, 2
  6332                                  
  6333                                  ;-640         prs("\n push ax");}
  6334                                  
  6335 00002E44 68[7E2F]                 push docall1_8
  6336 00002E47 E81312                   call prs
  6337 00002E4A 83C402                   add  sp, 2
  6338                                  
  6339                                  ;-641       if(t0==4){ gettypes(n0);
  6340                                  
  6341                                  .docall1331:
  6342 00002E4D 8B46FA                   mov ax, [bp-6]
  6343 00002E50 83F804                   cmp ax, 4
  6344 00002E53 0F854300                 jne .docall1332
  6345 00002E57 FF76F8                   push word [bp-8]
  6346 00002E5A E8C2D9                   call gettypes
  6347 00002E5D 83C402                   add  sp, 2
  6348                                  
  6349                                  ;-642         if(wi==2) { prs("\n push word "); v(n0);}
  6350                                  
  6351 00002E60 A1[3B00]                 mov ax, [wi]
  6352 00002E63 83F802                   cmp ax, 2
  6353 00002E66 0F851500                 jne .docall1333
  6354 00002E6A 68[892F]                 push docall1_9
  6355 00002E6D E8ED11                   call prs
  6356 00002E70 83C402                   add  sp, 2
  6357 00002E73 FF76F8                   push word [bp-8]
  6358 00002E76 E8F8D4                   call v
  6359 00002E79 83C402                   add  sp, 2
  6360                                  
  6361                                  ;-643         else { prs("\n mov al, byte ");   v(n0);
  6362                                  
  6363 00002E7C E91B00                   jmp .docall1334
  6364                                  .docall1333:
  6365 00002E7F 68[972F]                 push docall1_10
  6366 00002E82 E8D811                   call prs
  6367 00002E85 83C402                   add  sp, 2
  6368 00002E88 FF76F8                   push word [bp-8]
  6369 00002E8B E8E3D4                   call v
  6370 00002E8E 83C402                   add  sp, 2
  6371                                  
  6372                                  ;-644         prs("\n mov ah, 0\n push ax"); } }
  6373                                  
  6374 00002E91 68[A82F]                 push docall1_11
  6375 00002E94 E8C611                   call prs
  6376 00002E97 83C402                   add  sp, 2
  6377                                  .docall1334:
  6378                                  
  6379                                  ;-645       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }
  6380                                  
  6381                                  .docall1332:
  6382 00002E9A 8B46FA                   mov ax, [bp-6]
  6383 00002E9D 83F805                   cmp ax, 5
  6384 00002EA0 0F852200                 jne .docall1335
  6385 00002EA4 68[BF2F]                 push docall1_12
  6386 00002EA7 E8B311                   call prs
  6387 00002EAA 83C402                   add  sp, 2
  6388 00002EAD FF76F8                   push word [bp-8]
  6389 00002EB0 E870ED                   call printreg
  6390 00002EB3 83C402                   add  sp, 2
  6391 00002EB6 8B46F8                   mov ax, [bp-8]
  6392 00002EB9 83F82F                   cmp ax, 47 ;unsigned : 1
  6393 00002EBC 0F8C0600                 jl  .docall1336
  6394 00002EC0 8B46F6                   mov ax, [bp-10]
  6395 00002EC3 83C002                   add ax, 2
  6396                                  .docall1336:
  6397                                  
  6398                                  ;-646    i--; } while (i > 0);  }
  6399                                  
  6400                                  .docall1335:
  6401 00002EC6 FF4EFE                   dec  word[bp-2]
  6402 00002EC9 8B46FE                   mov ax, [bp-2]
  6403 00002ECC 83F800                   cmp ax, 0
  6404 00002ECF 0F8E0300                 jle .docall1337
  6405 00002ED3 E9EFFE                   jmp .docall1328
  6406                                  .docall1337:
  6407                                  
  6408                                  ;-647 	 prs("\n call "); prs(&procname);
  6409                                  
  6410                                  .docall1316:
  6411 00002ED6 68[C82F]                 push docall1_13
  6412 00002ED9 E88111                   call prs
  6413 00002EDC 83C402                   add  sp, 2
  6414 00002EDF 8D0643BD                 lea  ax, [procname]
  6415 00002EE3 50                       push ax
  6416 00002EE4 E87611                   call prs
  6417 00002EE7 83C402                   add  sp, 2
  6418                                  
  6419                                  ;-648 	 if (narg>0) {prs("\n add  sp, ");
  6420                                  
  6421 00002EEA 8B46FC                   mov ax, [bp-4]
  6422 00002EED 83F800                   cmp ax, 0
  6423 00002EF0 0F8E2400                 jle .docall1338
  6424 00002EF4 68[D12F]                 push docall1_14
  6425 00002EF7 E86311                   call prs
  6426 00002EFA 83C402                   add  sp, 2
  6427                                  
  6428                                  ;-649      narg=narg+narg; narg=narg+sz32; prunsign1(narg); } }
  6429                                  
  6430 00002EFD 8B46FC                   mov ax, [bp-4]
  6431 00002F00 0346FC                   add ax, [bp-4]
  6432 00002F03 8946FC                   mov [bp-4], ax
  6433 00002F06 8B46FC                   mov ax, [bp-4]
  6434 00002F09 0346F6                   add ax, [bp-10]
  6435 00002F0C 8946FC                   mov [bp-4], ax
  6436 00002F0F FF76FC                   push word [bp-4]
  6437 00002F12 E89D12                   call prunsign1
  6438 00002F15 83C402                   add  sp, 2
  6439                                  .docall1338:
  6440                                  
  6441                                  ;-650 /***************************************************************/
  6442                                  
  6443                                  
  6444                                  ;-651 
  6445                                  
  6446                                  
  6447                                  ;-652 int doinclude() { int fdtemp;
  6448 00002F18 C9                       LEAVE
  6449 00002F19 C3                       ret
  6450 00002F1A 4D61782E2039207061-     docall1_0 db "Max. 9 parameters",0
  6451 00002F23 72616D657465727300 
  6452 00002F2C 5C6E00                  docall1_1 db "\n",0
  6453 00002F2F 2064622000              docall1_2 db " db ",0
  6454 00002F34 2C3000                  docall1_3 db ",0",0
  6455 00002F37 706172616D65746572-     docall1_4 db "parameter not recognized (no * allowed)",0
  6456 00002F40 206E6F74207265636F-
  6457 00002F49 676E697A656420286E-
  6458 00002F52 6F202A20616C6C6F77-
  6459 00002F5B 65642900           
  6460 00002F5F 5C6E20707573682000      docall1_5 db "\n push ",0
  6461 00002F68 5C6E20707573682000      docall1_6 db "\n push ",0
  6462 00002F71 5C6E206C6561202061-     docall1_7 db "\n lea  ax, ",0
  6463 00002F7A 782C2000           
  6464 00002F7E 5C6E20707573682061-     docall1_8 db "\n push ax",0
  6465 00002F87 7800               
  6466 00002F89 5C6E20707573682077-     docall1_9 db "\n push word ",0
  6467 00002F92 6F72642000         
  6468 00002F97 5C6E206D6F7620616C-     docall1_10 db "\n mov al, byte ",0
  6469 00002FA0 2C20627974652000   
  6470 00002FA8 5C6E206D6F76206168-     docall1_11 db "\n mov ah, 0\n push ax",0
  6471 00002FB1 2C20305C6E20707573-
  6472 00002FBA 6820617800         
  6473 00002FBF 5C6E20707573682000      docall1_12 db "\n push ",0
  6474 00002FC8 5C6E2063616C6C2000      docall1_13 db "\n call ",0
  6475 00002FD1 5C6E20616464202073-     docall1_14 db "\n add  sp, ",0
  6476 00002FDA 702C2000           
  6477                                  ENDP
  6478                                  
  6479                                  doinclude: PROC
  6480                                  
  6481                                  ;-653   if (token==T_STRING) {  fdtemp=fdin;
  6482                                  
  6483                                  ;Function : doinclude, Number of local variables: 1
  6484                                  ;   # type sign width addr used name   list of local variables
  6485                                  ;  200 var sign word   652 NULL fdtemp = bp-2;
  6486 00002FDE C8020000                 ENTER  2,0
  6487 00002FE2 A1[1E00]                 mov ax, [token]
  6488 00002FE5 3D0201                   cmp ax, 258
  6489 00002FE8 0F858700                 jne .doinclude339
  6490 00002FEC A1[1A00]                 mov ax, [fdin]
  6491 00002FEF 8946FE                   mov [bp-2], ax
  6492                                  
  6493                                  ;-654   prs("\n;Use include file: "); prs(symbol);
  6494                                  
  6495 00002FF2 68[7530]                 push doinclude_0
  6496 00002FF5 E86510                   call prs
  6497 00002FF8 83C402                   add  sp, 2
  6498 00002FFB 8D06A36D                 lea  ax, [symbol]
  6499 00002FFF 50                       push ax
  6500 00003000 E85A10                   call prs
  6501 00003003 83C402                   add  sp, 2
  6502                                  
  6503                                  ;-655   fdin=openR(symbol);
  6504                                  
  6505 00003006 8D06A36D                 lea  ax, [symbol]
  6506 0000300A 50                       push ax
  6507 0000300B E8CAD0                   call openR
  6508 0000300E 83C402                   add  sp, 2
  6509 00003011 A3[1A00]                 mov word [fdin], ax
  6510                                  
  6511                                  ;-656   if (DOS_ERR !=0) {prs("Include file missing: "); prs(symbol);
  6512                                  
  6513 00003014 A1[7000]                 mov ax, [DOS_ERR]
  6514 00003017 83F800                   cmp ax, 0
  6515 0000301A 0F841D00                 je  .doinclude340
  6516 0000301E 68[8B30]                 push doinclude_1
  6517 00003021 E83910                   call prs
  6518 00003024 83C402                   add  sp, 2
  6519 00003027 8D06A36D                 lea  ax, [symbol]
  6520 0000302B 50                       push ax
  6521 0000302C E82E10                   call prs
  6522 0000302F 83C402                   add  sp, 2
  6523                                  
  6524                                  ;-657     error1(" Stop!!"); }
  6525                                  
  6526 00003032 68[A230]                 push doinclude_2
  6527 00003035 E88413                   call error1
  6528 00003038 83C402                   add  sp, 2
  6529                                  
  6530                                  ;-658   linenoinclude=lineno; lineno=1;
  6531                                  
  6532                                  .doinclude340:
  6533 0000303B A1[6800]                 mov ax, [lineno]
  6534 0000303E A3[6A00]                 mov word [linenoinclude], ax
  6535 00003041 B80100                   mov ax, 1
  6536 00003044 A3[6800]                 mov word [lineno], ax
  6537                                  
  6538                                  ;-659   parse(); lineno=linenoinclude;
  6539                                  
  6540 00003047 E83D1E                   call parse
  6541 0000304A A1[6A00]                 mov ax, [linenoinclude]
  6542 0000304D A3[6800]                 mov word [lineno], ax
  6543                                  
  6544                                  ;-660   fdin=fdtemp; prs("\n;Back to main program: "); prs(namein);
  6545                                  
  6546 00003050 8B46FE                   mov ax, [bp-2]
  6547 00003053 A3[1A00]                 mov word [fdin], ax
  6548 00003056 68[AA30]                 push doinclude_3
  6549 00003059 E80110                   call prs
  6550 0000305C 83C402                   add  sp, 2
  6551 0000305F 8D06666E                 lea  ax, [namein]
  6552 00003063 50                       push ax
  6553 00003064 E8F60F                   call prs
  6554 00003067 83C402                   add  sp, 2
  6555                                  
  6556                                  ;-661   getfirstchar(); token=getlex(); }
  6557                                  
  6558 0000306A E8B11E                   call getfirstchar
  6559 0000306D E88B07                   call getlex
  6560 00003070 A3[1E00]                 mov word [token], ax
  6561                                  
  6562                                  ;-662 }
  6563                                  
  6564                                  .doinclude339:
  6565                                  
  6566                                  ;-663 int dodefine() { int i; int j; int fdtemp;
  6567 00003073 C9                       LEAVE
  6568 00003074 C3                       ret
  6569 00003075 5C6E3B55736520696E-     doinclude_0 db "\n;Use include file: ",0
  6570 0000307E 636C7564652066696C-
  6571 00003087 653A2000           
  6572 0000308B 496E636C7564652066-     doinclude_1 db "Include file missing: ",0
  6573 00003094 696C65206D69737369-
  6574 0000309D 6E673A2000         
  6575 000030A2 2053746F70212100        doinclude_2 db " Stop!!",0
  6576 000030AA 5C6E3B4261636B2074-     doinclude_3 db "\n;Back to main program: ",0
  6577 000030B3 6F206D61696E207072-
  6578 000030BC 6F6772616D3A2000   
  6579                                  ENDP
  6580                                  
  6581                                  dodefine: PROC
  6582                                  
  6583                                  ;-664   if (eqstr(symbol, "ORGDATA")) {token=getlex();
  6584                                  
  6585                                  ;Function : dodefine, Number of local variables: 3
  6586                                  ;   # type sign width addr used name   list of local variables
  6587                                  ;  200 var sign word   663 NULL i = bp-2
  6588                                  ;  201 var sign word   663 NULL j = bp-4
  6589                                  ;  202 var sign word   663 NULL fdtemp = bp-6;
  6590 000030C4 C8060000                 ENTER  6,0
  6591 000030C8 68[0B32]                 push dodefine_0
  6592 000030CB 8D06A36D                 lea  ax, [symbol]
  6593 000030CF 50                       push ax
  6594 000030D0 E8C5D0                   call eqstr
  6595 000030D3 83C404                   add  sp, 4
  6596 000030D6 08C0                     or  al, al
  6597 000030D8 0F841500                 je .dodefine341
  6598 000030DC E81C07                   call getlex
  6599 000030DF A3[1E00]                 mov word [token], ax
  6600                                  
  6601                                  ;-665     ORGDATAORIG=lexval; orgData=lexval; return; }
  6602                                  
  6603 000030E2 A1[3000]                 mov ax, [lexval]
  6604 000030E5 A3[1000]                 mov word [ORGDATAORIG], ax
  6605 000030E8 A1[3000]                 mov ax, [lexval]
  6606 000030EB A3[1200]                 mov word [orgData], ax
  6607 000030EE E91801                   jmp .retndodefine
  6608                                  
  6609                                  ;-666   if (eqstr(symbol, "ARCHIVE")){token=getlex();  if (token==T_STRING) {
  6610                                  
  6611                                  .dodefine341:
  6612 000030F1 68[1332]                 push dodefine_1
  6613 000030F4 8D06A36D                 lea  ax, [symbol]
  6614 000030F8 50                       push ax
  6615 000030F9 E89CD0                   call eqstr
  6616 000030FC 83C404                   add  sp, 4
  6617 000030FF 08C0                     or  al, al
  6618 00003101 0F844900                 je .dodefine342
  6619 00003105 E8F306                   call getlex
  6620 00003108 A3[1E00]                 mov word [token], ax
  6621 0000310B A1[1E00]                 mov ax, [token]
  6622 0000310E 3D0201                   cmp ax, 258
  6623 00003111 0F852700                 jne .dodefine343
  6624                                  
  6625                                  ;-667     prs("\n;Use archive file: ");
  6626                                  
  6627 00003115 68[1B32]                 push dodefine_2
  6628 00003118 E8420F                   call prs
  6629 0000311B 83C402                   add  sp, 2
  6630                                  
  6631                                  ;-668     strcpy(archivename, symbol); prs(archivename);
  6632                                  
  6633 0000311E 8D06A36D                 lea  ax, [symbol]
  6634 00003122 50                       push ax
  6635 00003123 8D06EC6E                 lea  ax, [archivename]
  6636 00003127 50                       push ax
  6637 00003128 E83DD0                   call strcpy
  6638 0000312B 83C404                   add  sp, 4
  6639 0000312E 8D06EC6E                 lea  ax, [archivename]
  6640 00003132 50                       push ax
  6641 00003133 E8270F                   call prs
  6642 00003136 83C402                   add  sp, 2
  6643                                  
  6644                                  ;-669     } else error1("Name of archive file missing"); token=getlex(); return;}
  6645                                  
  6646 00003139 E90900                   jmp .dodefine344
  6647                                  .dodefine343:
  6648 0000313C 68[3132]                 push dodefine_3
  6649 0000313F E87A12                   call error1
  6650 00003142 83C402                   add  sp, 2
  6651                                  .dodefine344:
  6652 00003145 E8B306                   call getlex
  6653 00003148 A3[1E00]                 mov word [token], ax
  6654 0000314B E9BB00                   jmp .retndodefine
  6655                                  
  6656                                  ;-670    expect(T_NAME);
  6657                                  
  6658                                  .dodefine342:
  6659 0000314E 680001                   push 256
  6660 00003151 E8F60D                   call expect
  6661 00003154 83C402                   add  sp, 2
  6662                                  
  6663                                  ;-671   if (token==T_CONST) {
  6664                                  
  6665 00003157 A1[1E00]                 mov ax, [token]
  6666 0000315A 3D0101                   cmp ax, 257
  6667 0000315D 0F85A800                 jne .dodefine345
  6668                                  
  6669                                  ;-672     if (GTop >= LSTART) error1("global table (define) full");
  6670                                  
  6671 00003161 A1[2C00]                 mov ax, [GTop]
  6672 00003164 3DC800                   cmp ax, 200 ;unsigned : 1
  6673 00003167 0F8C0900                 jl  .dodefine346
  6674 0000316B 68[4E32]                 push dodefine_4
  6675 0000316E E84B12                   call error1
  6676 00003171 83C402                   add  sp, 2
  6677                                  
  6678                                  ;-673     i=strlen(symbol); if (i>15) error1("Define name longer 15 char");
  6679                                  
  6680                                  .dodefine346:
  6681 00003174 8D06A36D                 lea  ax, [symbol]
  6682 00003178 50                       push ax
  6683 00003179 E8C4CF                   call strlen
  6684 0000317C 83C402                   add  sp, 2
  6685 0000317F 8946FE                   mov [bp-2], ax
  6686 00003182 8B46FE                   mov ax, [bp-2]
  6687 00003185 83F80F                   cmp ax, 15
  6688 00003188 0F8E0900                 jle .dodefine347
  6689 0000318C 68[6932]                 push dodefine_5
  6690 0000318F E82A12                   call error1
  6691 00003192 83C402                   add  sp, 2
  6692                                  
  6693                                  ;-674     GSign [GTop]='U'; GWidth[GTop]=1; GType [GTop]='#';
  6694                                  
  6695                                  .dodefine347:
  6696 00003195 B85500                   mov ax, 85
  6697 00003198 8B1E[2C00]               mov bx, [GTop]
  6698 0000319C 88875B70                 mov [GSign+bx], al
  6699 000031A0 B80100                   mov ax, 1
  6700 000031A3 8B1E[2C00]               mov bx, [GTop]
  6701 000031A7 88878771                 mov [GWidth+bx], al
  6702 000031AB B82300                   mov ax, 35
  6703 000031AE 8B1E[2C00]               mov bx, [GTop]
  6704 000031B2 88872F6F                 mov [GType+bx], al
  6705                                  
  6706                                  ;-675     GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  6707                                  
  6708 000031B6 A1[6800]                 mov ax, [lineno]
  6709 000031B9 83E801                   sub ax, 1
  6710 000031BC 8B1E[2C00]               mov bx, [GTop]
  6711 000031C0 D1E3                     shl bx, 1
  6712 000031C2 8987B372                 mov [GAdr+bx], ax
  6713 000031C6 B80000                   mov ax, 0
  6714 000031C9 8B1E[2C00]               mov bx, [GTop]
  6715 000031CD D1E3                     shl bx, 1
  6716 000031CF 89870B75                 mov [GUsed+bx], ax
  6717                                  
  6718                                  ;-676     pt=adrofname(GTop); strcpy(pt, symbol); GData[GTop]=lexval;
  6719                                  
  6720 000031D3 FF36[2C00]               push word [GTop]
  6721 000031D7 E8FCD6                   call adrofname
  6722 000031DA 83C402                   add  sp, 2
  6723 000031DD A3[6C00]                 mov word [pt], ax
  6724 000031E0 8D06A36D                 lea  ax, [symbol]
  6725 000031E4 50                       push ax
  6726 000031E5 FF36[6C00]               push word [pt]
  6727 000031E9 E87CCF                   call strcpy
  6728 000031EC 83C404                   add  sp, 4
  6729 000031EF A1[3000]                 mov ax, [lexval]
  6730 000031F2 8B1E[2C00]               mov bx, [GTop]
  6731 000031F6 D1E3                     shl bx, 1
  6732 000031F8 89876377                 mov [GData+bx], ax
  6733                                  
  6734                                  ;-677     expect(T_CONST); GTop++;  }
  6735                                  
  6736 000031FC 680101                   push 257
  6737 000031FF E8480D                   call expect
  6738 00003202 83C402                   add  sp, 2
  6739 00003205 FF06[2C00]               inc  word[GTop]
  6740                                  
  6741                                  ;-678 }
  6742                                  
  6743                                  .dodefine345:
  6744                                  
  6745                                  ;-679 int stmt() { int c; char cha;
  6746                                  
  6747 00003209 C9                       .retndodefine: LEAVE
  6748 0000320A C3                       ret
  6749 0000320B 4F52474441544100        dodefine_0 db "ORGDATA",0
  6750 00003213 4152434849564500        dodefine_1 db "ARCHIVE",0
  6751 0000321B 5C6E3B557365206172-     dodefine_2 db "\n;Use archive file: ",0
  6752 00003224 63686976652066696C-
  6753 0000322D 653A2000           
  6754 00003231 4E616D65206F662061-     dodefine_3 db "Name of archive file missing",0
  6755 0000323A 726368697665206669-
  6756 00003243 6C65206D697373696E-
  6757 0000324C 6700               
  6758 0000324E 676C6F62616C207461-     dodefine_4 db "global table (define) full",0
  6759 00003257 626C65202864656669-
  6760 00003260 6E65292066756C6C00 
  6761 00003269 446566696E65206E61-     dodefine_5 db "Define name longer 15 char",0
  6762 00003272 6D65206C6F6E676572-
  6763 0000327B 203135206368617200 
  6764                                  ENDP
  6765                                  
  6766                                  stmt: PROC
  6767                                  
  6768                                  ;-680        if(istoken('{'))     {while(istoken('}')==0) stmt();}
  6769                                  
  6770                                  ;Function : stmt, Number of local variables: 2
  6771                                  ;   # type sign width addr used name   list of local variables
  6772                                  ;  200 var sign word   679 NULL c = bp-2
  6773                                  ;  201 var sign byte   679 NULL cha = bp-4;
  6774 00003284 C8040000                 ENTER  4,0
  6775 00003288 6A7B                     push 123
  6776 0000328A E89B0C                   call istoken
  6777 0000328D 83C402                   add  sp, 2
  6778 00003290 08C0                     or  al, al
  6779 00003292 0F841700                 je .stmt348
  6780                                  .stmt349:
  6781 00003296 6A7D                     push 125
  6782 00003298 E88D0C                   call istoken
  6783 0000329B 83C402                   add  sp, 2
  6784 0000329E 83F800                   cmp ax, 0
  6785 000032A1 0F850500                 jne .stmt350
  6786 000032A5 E8DCFF                   call stmt
  6787 000032A8 EBEC                     jmp .stmt349
  6788                                  .stmt350:
  6789                                  
  6790                                  ;-681   else if(istoken(T_IF))    doif();
  6791                                  
  6792 000032AA E9B001                   jmp .stmt351
  6793                                  .stmt348:
  6794 000032AD 680102                   push 513
  6795 000032B0 E8750C                   call istoken
  6796 000032B3 83C402                   add  sp, 2
  6797 000032B6 08C0                     or  al, al
  6798 000032B8 0F840600                 je .stmt352
  6799 000032BC E8E203                   call doif
  6800                                  
  6801                                  ;-682   else if(istoken(T_DO))    dodo();
  6802                                  
  6803 000032BF E99B01                   jmp .stmt353
  6804                                  .stmt352:
  6805 000032C2 680402                   push 516
  6806 000032C5 E8600C                   call istoken
  6807 000032C8 83C402                   add  sp, 2
  6808 000032CB 08C0                     or  al, al
  6809 000032CD 0F840600                 je .stmt354
  6810 000032D1 E82F04                   call dodo
  6811                                  
  6812                                  ;-683   else if(istoken(T_WHILE)) dowhile();
  6813                                  
  6814 000032D4 E98601                   jmp .stmt355
  6815                                  .stmt354:
  6816 000032D7 680302                   push 515
  6817 000032DA E84B0C                   call istoken
  6818 000032DD 83C402                   add  sp, 2
  6819 000032E0 08C0                     or  al, al
  6820 000032E2 0F840600                 je .stmt356
  6821 000032E6 E86704                   call dowhile
  6822                                  
  6823                                  ;-684   else if(istoken(T_GOTO))  {
  6824                                  
  6825 000032E9 E97101                   jmp .stmt357
  6826                                  .stmt356:
  6827 000032EC 680902                   push 521
  6828 000032EF E8360C                   call istoken
  6829 000032F2 83C402                   add  sp, 2
  6830 000032F5 08C0                     or  al, al
  6831 000032F7 0F842200                 je .stmt358
  6832                                  
  6833                                  ;-685     prs("\n jmp .");name1();prs(symbol);expect(';');}
  6834                                  
  6835 000032FB 68[5F34]                 push stmt_0
  6836 000032FE E85C0D                   call prs
  6837 00003301 83C402                   add  sp, 2
  6838 00003304 E8FED7                   call name1
  6839 00003307 8D06A36D                 lea  ax, [symbol]
  6840 0000330B 50                       push ax
  6841 0000330C E84E0D                   call prs
  6842 0000330F 83C402                   add  sp, 2
  6843 00003312 6A3B                     push 59
  6844 00003314 E8330C                   call expect
  6845 00003317 83C402                   add  sp, 2
  6846                                  
  6847                                  ;-686   else if(token==T_ASM)     {prs("\n"); c=next();
  6848                                  
  6849 0000331A E94001                   jmp .stmt359
  6850                                  .stmt358:
  6851 0000331D A1[1E00]                 mov ax, [token]
  6852 00003320 3D0602                   cmp ax, 518
  6853 00003323 0F853300                 jne .stmt360
  6854 00003327 68[6834]                 push stmt_1
  6855 0000332A E8300D                   call prs
  6856 0000332D 83C402                   add  sp, 2
  6857 00003330 E8D70B                   call next
  6858 00003333 8946FE                   mov [bp-2], ax
  6859                                  
  6860                                  ;-687         while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }
  6861                                  
  6862                                  .stmt361:
  6863 00003336 8B46FE                   mov ax, [bp-2]
  6864 00003339 83F80A                   cmp ax, 10
  6865 0000333C 0F841100                 je  .stmt362
  6866 00003340 FF76FE                   push word [bp-2]
  6867 00003343 E8B00C                   call prc
  6868 00003346 83C402                   add  sp, 2
  6869 00003349 E8BE0B                   call next
  6870 0000334C 8946FE                   mov [bp-2], ax
  6871 0000334F EBE5                     jmp .stmt361
  6872                                  .stmt362:
  6873 00003351 E8A704                   call getlex
  6874 00003354 A3[1E00]                 mov word [token], ax
  6875                                  
  6876                                  ;-688   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();
  6877                                  
  6878 00003357 E90301                   jmp .stmt363
  6879                                  .stmt360:
  6880 0000335A 680702                   push 519
  6881 0000335D E8C80B                   call istoken
  6882 00003360 83C402                   add  sp, 2
  6883 00003363 08C0                     or  al, al
  6884 00003365 0F844B00                 je .stmt364
  6885 00003369 A1[1E00]                 mov ax, [token]
  6886 0000336C 83F87B                   cmp ax, 123
  6887 0000336F 0F853500                 jne .stmt365
  6888 00003373 68[6B34]                 push stmt_2
  6889 00003376 E8E40C                   call prs
  6890 00003379 83C402                   add  sp, 2
  6891 0000337C E88B0B                   call next
  6892 0000337F 8846FC                   mov [bp-4], al
  6893                                  
  6894                                  ;-689         while(cha!= '}') { prc(cha); cha=next(); }
  6895                                  
  6896                                  .stmt366:
  6897 00003382 8A46FC                   mov al, [bp-4]
  6898 00003385 3C7D                     cmp al, 125
  6899 00003387 0F841400                 je  .stmt367
  6900 0000338B 8A46FC                   mov al, byte [bp-4]
  6901 0000338E B400                     mov ah, 0
  6902 00003390 50                       push ax
  6903 00003391 E8620C                   call prc
  6904 00003394 83C402                   add  sp, 2
  6905 00003397 E8700B                   call next
  6906 0000339A 8846FC                   mov [bp-4], al
  6907                                  
  6908                                  ;-690         token=getlex(); }
  6909                                  
  6910 0000339D EBE3                     jmp .stmt366
  6911                                  .stmt367:
  6912 0000339F E85904                   call getlex
  6913 000033A2 A3[1E00]                 mov word [token], ax
  6914                                  
  6915                                  ;-691         else error1("Curly open expected");
  6916                                  
  6917 000033A5 E90900                   jmp .stmt368
  6918                                  .stmt365:
  6919 000033A8 68[6E34]                 push stmt_3
  6920 000033AB E80E10                   call error1
  6921 000033AE 83C402                   add  sp, 2
  6922                                  
  6923                                  ;-692         }
  6924                                  
  6925                                  .stmt368:
  6926                                  
  6927                                  ;-693   else if(istoken(T_EMIT))   doemit();
  6928                                  
  6929 000033B1 E9A900                   jmp .stmt369
  6930                                  .stmt364:
  6931 000033B4 680802                   push 520
  6932 000033B7 E86E0B                   call istoken
  6933 000033BA 83C402                   add  sp, 2
  6934 000033BD 08C0                     or  al, al
  6935 000033BF 0F840600                 je .stmt370
  6936 000033C3 E8CD00                   call doemit
  6937                                  
  6938                                  ;-694   else if(istoken(';'))      { }
  6939                                  
  6940 000033C6 E99400                   jmp .stmt371
  6941                                  .stmt370:
  6942 000033C9 6A3B                     push 59
  6943 000033CB E85A0B                   call istoken
  6944 000033CE 83C402                   add  sp, 2
  6945 000033D1 08C0                     or  al, al
  6946 000033D3 0F840300                 je .stmt372
  6947                                  
  6948                                  ;-695   else if(istoken(T_RETURN)) {
  6949                                  
  6950 000033D7 E98300                   jmp .stmt373
  6951                                  .stmt372:
  6952 000033DA 680002                   push 512
  6953 000033DD E8480B                   call istoken
  6954 000033E0 83C402                   add  sp, 2
  6955 000033E3 08C0                     or  al, al
  6956 000033E5 0F843000                 je .stmt374
  6957                                  
  6958                                  ;-696         if (token!=';') exprstart();
  6959                                  
  6960 000033E9 A1[1E00]                 mov ax, [token]
  6961 000033EC 83F83B                   cmp ax, 59
  6962 000033EF 0F840300                 je  .stmt375
  6963 000033F3 E8DCDD                   call exprstart
  6964                                  
  6965                                  ;-697         prs("\n jmp .retn");
  6966                                  
  6967                                  .stmt375:
  6968 000033F6 68[8234]                 push stmt_4
  6969 000033F9 E8610C                   call prs
  6970 000033FC 83C402                   add  sp, 2
  6971                                  
  6972                                  ;-698         prs(fname);
  6973                                  
  6974 000033FF 8D06236E                 lea  ax, [fname]
  6975 00003403 50                       push ax
  6976 00003404 E8560C                   call prs
  6977 00003407 83C402                   add  sp, 2
  6978                                  
  6979                                  ;-699         nreturn++;
  6980                                  
  6981 0000340A FF06[2800]               inc  word[nreturn]
  6982                                  
  6983                                  ;-700         expect(';');
  6984                                  
  6985 0000340E 6A3B                     push 59
  6986 00003410 E8370B                   call expect
  6987 00003413 83C402                   add  sp, 2
  6988                                  
  6989                                  ;-701         }
  6990                                  
  6991                                  
  6992                                  ;-702   else if(thechar==':')      {
  6993                                  
  6994 00003416 E94400                   jmp .stmt376
  6995                                  .stmt374:
  6996 00003419 A0[2300]                 mov al, [thechar]
  6997 0000341C 3C3A                     cmp al, 58
  6998 0000341E 0F853000                 jne .stmt377
  6999                                  
  7000                                  ;-703         prs("\n."); // Label
  7001                                  
  7002 00003422 68[8F34]                 push stmt_5
  7003 00003425 E8350C                   call prs
  7004 00003428 83C402                   add  sp, 2
  7005                                  
  7006                                  ;-704         prs(symbol); prc(':');
  7007                                  
  7008 0000342B 8D06A36D                 lea  ax, [symbol]
  7009 0000342F 50                       push ax
  7010 00003430 E82A0C                   call prs
  7011 00003433 83C402                   add  sp, 2
  7012 00003436 6A3A                     push 58
  7013 00003438 E8BB0B                   call prc
  7014 0000343B 83C402                   add  sp, 2
  7015                                  
  7016                                  ;-705         expect(T_NAME);
  7017                                  
  7018 0000343E 680001                   push 256
  7019 00003441 E8060B                   call expect
  7020 00003444 83C402                   add  sp, 2
  7021                                  
  7022                                  ;-706         expect(':');
  7023                                  
  7024 00003447 6A3A                     push 58
  7025 00003449 E8FE0A                   call expect
  7026 0000344C 83C402                   add  sp, 2
  7027                                  
  7028                                  ;-707         }
  7029                                  
  7030                                  
  7031                                  ;-708   else  {exprstart(); expect(';'); }
  7032                                  
  7033 0000344F E90B00                   jmp .stmt378
  7034                                  .stmt377:
  7035 00003452 E87DDD                   call exprstart
  7036 00003455 6A3B                     push 59
  7037 00003457 E8F00A                   call expect
  7038 0000345A 83C402                   add  sp, 2
  7039                                  
  7040                                  ;-709 }
  7041                                  
  7042                                  .stmt378:
  7043                                  .stmt376:
  7044                                  .stmt373:
  7045                                  .stmt371:
  7046                                  .stmt369:
  7047                                  .stmt363:
  7048                                  .stmt359:
  7049                                  .stmt357:
  7050                                  .stmt355:
  7051                                  .stmt353:
  7052                                  .stmt351:
  7053                                  
  7054                                  ;-710 
  7055                                  
  7056                                  
  7057                                  ;-711 int doemit() {prs("\n db ");
  7058 0000345D C9                       LEAVE
  7059 0000345E C3                       ret
  7060 0000345F 5C6E206A6D70202E00      stmt_0 db "\n jmp .",0
  7061 00003468 5C6E00                  stmt_1 db "\n",0
  7062 0000346B 5C6E00                  stmt_2 db "\n",0
  7063 0000346E 4375726C79206F7065-     stmt_3 db "Curly open expected",0
  7064 00003477 6E2065787065637465-
  7065 00003480 6400               
  7066 00003482 5C6E206A6D70202E72-     stmt_4 db "\n jmp .retn",0
  7067 0000348B 65746E00           
  7068 0000348F 5C6E2E00                stmt_5 db "\n.",0
  7069                                  ENDP
  7070                                  
  7071                                  doemit: PROC
  7072 00003493 68[CF34]                 push doemit_0
  7073 00003496 E8C40B                   call prs
  7074 00003499 83C402                   add  sp, 2
  7075                                  
  7076                                  ;-712   L1: token=getlex(); prunsign1(lexval); token=getlex();
  7077                                  
  7078                                  .L1:
  7079 0000349C E85C03                   call getlex
  7080 0000349F A3[1E00]                 mov word [token], ax
  7081 000034A2 FF36[3000]               push word [lexval]
  7082 000034A6 E8090D                   call prunsign1
  7083 000034A9 83C402                   add  sp, 2
  7084 000034AC E84C03                   call getlex
  7085 000034AF A3[1E00]                 mov word [token], ax
  7086                                  
  7087                                  ;-713     if (token== ',') {prc(','); goto L1;} expect(')'); }
  7088                                  
  7089 000034B2 A1[1E00]                 mov ax, [token]
  7090 000034B5 83F82C                   cmp ax, 44
  7091 000034B8 0F850A00                 jne .doemit379
  7092 000034BC 6A2C                     push 44
  7093 000034BE E8350B                   call prc
  7094 000034C1 83C402                   add  sp, 2
  7095 000034C4 EBD6                     jmp .L1
  7096                                  .doemit379:
  7097 000034C6 6A29                     push 41
  7098 000034C8 E87F0A                   call expect
  7099 000034CB 83C402                   add  sp, 2
  7100                                  
  7101                                  ;-714 
  7102                                  
  7103                                  
  7104                                  ;-715 int cmpneg(int ids) {
  7105                                  
  7106 000034CE C3                       ret
  7107 000034CF 5C6E2064622000          doemit_0 db "\n db ",0
  7108                                  ENDP
  7109                                  
  7110                                  cmpneg: PROC
  7111                                  
  7112                                  ;-716        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
  7113                                  
  7114                                  ;Function : cmpneg, Number of local variables: 1
  7115                                  ;   # type sign width addr used name   list of local variables
  7116                                  ;  200 var sign word   715 NULL ids = bp+4;
  7117 000034D6 C8000000                 ENTER  0,0
  7118 000034DA A1[2400]                 mov ax, [iscmp]
  7119 000034DD 3D2603                   cmp ax, 806
  7120 000034E0 0F850C00                 jne .cmpneg380
  7121 000034E4 68[B735]                 push cmpneg_0
  7122 000034E7 E8730B                   call prs
  7123 000034EA 83C402                   add  sp, 2
  7124                                  
  7125                                  ;-717   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1
  7126                                  
  7127 000034ED E9C500                   jmp .cmpneg381
  7128                                  .cmpneg380:
  7129 000034F0 A1[2400]                 mov ax, [iscmp]
  7130 000034F3 3D2703                   cmp ax, 807
  7131 000034F6 0F850C00                 jne .cmpneg382
  7132 000034FA 68[C035]                 push cmpneg_1
  7133 000034FD E85D0B                   call prs
  7134 00003500 83C402                   add  sp, 2
  7135                                  
  7136                                  ;-718   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF
  7137                                  
  7138 00003503 E9AF00                   jmp .cmpneg383
  7139                                  .cmpneg382:
  7140 00003506 A1[2400]                 mov ax, [iscmp]
  7141 00003509 3D3803                   cmp ax, 824
  7142 0000350C 0F852100                 jne .cmpneg384
  7143 00003510 8B4604                   mov ax, [bp+4]
  7144 00003513 08C0                     or  al, al
  7145 00003515 0F840C00                 je .cmpneg385
  7146 00003519 68[C935]                 push cmpneg_2
  7147 0000351C E83E0B                   call prs
  7148 0000351F 83C402                   add  sp, 2
  7149                                  
  7150                                  ;-719                            else prs("\n ja  .");//ZF=0 CF=0
  7151                                  
  7152 00003522 E90900                   jmp .cmpneg386
  7153                                  .cmpneg385:
  7154 00003525 68[D235]                 push cmpneg_3
  7155 00003528 E8320B                   call prs
  7156 0000352B 83C402                   add  sp, 2
  7157                                  
  7158                                  ;-720   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);
  7159                                  
  7160                                  .cmpneg386:
  7161 0000352E E98400                   jmp .cmpneg387
  7162                                  .cmpneg384:
  7163 00003531 A1[2400]                 mov ax, [iscmp]
  7164 00003534 3D2B03                   cmp ax, 811
  7165 00003537 0F854500                 jne .cmpneg388
  7166 0000353B 8B4604                   mov ax, [bp+4]
  7167 0000353E 08C0                     or  al, al
  7168 00003540 0F841E00                 je .cmpneg389
  7169 00003544 68[DB35]                 push cmpneg_4
  7170 00003547 E8130B                   call prs
  7171 0000354A 83C402                   add  sp, 2
  7172 0000354D FF7604                   push word [bp+4]
  7173 00003550 E85F0C                   call prunsign1
  7174 00003553 83C402                   add  sp, 2
  7175                                  
  7176                                  ;-721                                prs("\n jl  .");}//          SF!=OF
  7177                                  
  7178 00003556 68[E935]                 push cmpneg_5
  7179 00003559 E8010B                   call prs
  7180 0000355C 83C402                   add  sp, 2
  7181                                  
  7182                                  ;-722                            else{prs(" ;unsigned : "); prunsign1(ids);
  7183                                  
  7184 0000355F E91B00                   jmp .cmpneg390
  7185                                  .cmpneg389:
  7186 00003562 68[F235]                 push cmpneg_6
  7187 00003565 E8F50A                   call prs
  7188 00003568 83C402                   add  sp, 2
  7189 0000356B FF7604                   push word [bp+4]
  7190 0000356E E8410C                   call prunsign1
  7191 00003571 83C402                   add  sp, 2
  7192                                  
  7193                                  ;-723                                prs("\n jb  .");}//jb=jc=CF=1
  7194                                  
  7195 00003574 68[0036]                 push cmpneg_7
  7196 00003577 E8E30A                   call prs
  7197 0000357A 83C402                   add  sp, 2
  7198                                  
  7199                                  ;-724   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF
  7200                                  
  7201                                  .cmpneg390:
  7202 0000357D E93500                   jmp .cmpneg391
  7203                                  .cmpneg388:
  7204 00003580 A1[2400]                 mov ax, [iscmp]
  7205 00003583 83F83C                   cmp ax, 60
  7206 00003586 0F850C00                 jne .cmpneg392
  7207 0000358A 68[0936]                 push cmpneg_8
  7208 0000358D E8CD0A                   call prs
  7209 00003590 83C402                   add  sp, 2
  7210                                  
  7211                                  ;-725   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF
  7212                                  
  7213 00003593 E91F00                   jmp .cmpneg393
  7214                                  .cmpneg392:
  7215 00003596 A1[2400]                 mov ax, [iscmp]
  7216 00003599 83F83E                   cmp ax, 62
  7217 0000359C 0F850C00                 jne .cmpneg394
  7218 000035A0 68[1236]                 push cmpneg_9
  7219 000035A3 E8B70A                   call prs
  7220 000035A6 83C402                   add  sp, 2
  7221                                  
  7222                                  ;-726   else error1("internal error compare unknown in CMPNEG()");  }
  7223                                  
  7224 000035A9 E90900                   jmp .cmpneg395
  7225                                  .cmpneg394:
  7226 000035AC 68[1B36]                 push cmpneg_10
  7227 000035AF E80A0E                   call error1
  7228 000035B2 83C402                   add  sp, 2
  7229                                  .cmpneg395:
  7230                                  .cmpneg393:
  7231                                  .cmpneg391:
  7232                                  .cmpneg387:
  7233                                  .cmpneg383:
  7234                                  .cmpneg381:
  7235                                  
  7236                                  ;-727 
  7237                                  
  7238                                  
  7239                                  ;-728 int prlabel(int n) {prs("\n."); prs(fname); prunsign1(n); prc(':'); }
  7240 000035B5 C9                       LEAVE
  7241 000035B6 C3                       ret
  7242 000035B7 5C6E206A6E65202E00      cmpneg_0 db "\n jne .",0
  7243 000035C0 5C6E206A6520202E00      cmpneg_1 db "\n je  .",0
  7244 000035C9 5C6E206A6720202E00      cmpneg_2 db "\n jg  .",0
  7245 000035D2 5C6E206A6120202E00      cmpneg_3 db "\n ja  .",0
  7246 000035DB 203B756E7369676E65-     cmpneg_4 db " ;unsigned : ",0
  7247 000035E4 64203A2000         
  7248 000035E9 5C6E206A6C20202E00      cmpneg_5 db "\n jl  .",0
  7249 000035F2 203B756E7369676E65-     cmpneg_6 db " ;unsigned : ",0
  7250 000035FB 64203A2000         
  7251 00003600 5C6E206A6220202E00      cmpneg_7 db "\n jb  .",0
  7252 00003609 5C6E206A6765202E00      cmpneg_8 db "\n jge .",0
  7253 00003612 5C6E206A6C65202E00      cmpneg_9 db "\n jle .",0
  7254 0000361B 696E7465726E616C20-     cmpneg_10 db "internal error compare unknown in CMPNEG()",0
  7255 00003624 6572726F7220636F6D-
  7256 0000362D 7061726520756E6B6E-
  7257 00003636 6F776E20696E20434D-
  7258 0000363F 504E4547282900     
  7259                                  ENDP
  7260                                  
  7261                                  prlabel: PROC
  7262                                  ;Function : prlabel, Number of local variables: 1
  7263                                  ;   # type sign width addr used name   list of local variables
  7264                                  ;  200 var sign word   728 NULL n = bp+4;
  7265 00003646 C8000000                 ENTER  0,0
  7266 0000364A 68[7136]                 push prlabel_0
  7267 0000364D E80D0A                   call prs
  7268 00003650 83C402                   add  sp, 2
  7269 00003653 8D06236E                 lea  ax, [fname]
  7270 00003657 50                       push ax
  7271 00003658 E8020A                   call prs
  7272 0000365B 83C402                   add  sp, 2
  7273 0000365E FF7604                   push word [bp+4]
  7274 00003661 E84E0B                   call prunsign1
  7275 00003664 83C402                   add  sp, 2
  7276 00003667 6A3A                     push 58
  7277 00003669 E88A09                   call prc
  7278 0000366C 83C402                   add  sp, 2
  7279                                  
  7280                                  ;-729 int prjump (int n) {prs("\n jmp ."); prs(fname); prunsign1(n); }
  7281 0000366F C9                       LEAVE
  7282 00003670 C3                       ret
  7283 00003671 5C6E2E00                prlabel_0 db "\n.",0
  7284                                  ENDP
  7285                                  
  7286                                  prjump: PROC
  7287                                  ;Function : prjump, Number of local variables: 1
  7288                                  ;   # type sign width addr used name   list of local variables
  7289                                  ;  200 var sign word   729 NULL n = bp+4;
  7290 00003675 C8000000                 ENTER  0,0
  7291 00003679 68[9836]                 push prjump_0
  7292 0000367C E8DE09                   call prs
  7293 0000367F 83C402                   add  sp, 2
  7294 00003682 8D06236E                 lea  ax, [fname]
  7295 00003686 50                       push ax
  7296 00003687 E8D309                   call prs
  7297 0000368A 83C402                   add  sp, 2
  7298 0000368D FF7604                   push word [bp+4]
  7299 00003690 E81F0B                   call prunsign1
  7300 00003693 83C402                   add  sp, 2
  7301                                  
  7302                                  ;-730 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
  7303 00003696 C9                       LEAVE
  7304 00003697 C3                       ret
  7305 00003698 5C6E206A6D70202E00      prjump_0 db "\n jmp .",0
  7306                                  ENDP
  7307                                  
  7308                                  doif: PROC
  7309                                  ;Function : doif, Number of local variables: 2
  7310                                  ;   # type sign width addr used name   list of local variables
  7311                                  ;  200 var sign word   730 NULL jdest = bp-2
  7312                                  ;  201 var sign word   730 NULL tst = bp-4;
  7313 000036A1 C8040000                 ENTER  4,0
  7314 000036A5 E89ED9                   call pexpr
  7315 000036A8 FF06[2A00]               inc  word[nlabel]
  7316 000036AC A1[2A00]                 mov ax, [nlabel]
  7317 000036AF 8946FE                   mov [bp-2], ax
  7318                                  
  7319                                  ;-731   pint1(jdest); stmt();
  7320                                  
  7321 000036B2 FF76FE                   push word [bp-2]
  7322 000036B5 E89C0A                   call pint1
  7323 000036B8 83C402                   add  sp, 2
  7324 000036BB E8C6FB                   call stmt
  7325                                  
  7326                                  ;-732   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;
  7327                                  
  7328 000036BE 680202                   push 514
  7329 000036C1 E86408                   call istoken
  7330 000036C4 83C402                   add  sp, 2
  7331 000036C7 08C0                     or  al, al
  7332 000036C9 0F842B00                 je .doif396
  7333 000036CD FF06[2A00]               inc  word[nlabel]
  7334 000036D1 A1[2A00]                 mov ax, [nlabel]
  7335 000036D4 8946FC                   mov [bp-4], ax
  7336                                  
  7337                                  ;-733     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }
  7338                                  
  7339 000036D7 FF76FC                   push word [bp-4]
  7340 000036DA E898FF                   call prjump
  7341 000036DD 83C402                   add  sp, 2
  7342 000036E0 FF76FE                   push word [bp-2]
  7343 000036E3 E860FF                   call prlabel
  7344 000036E6 83C402                   add  sp, 2
  7345 000036E9 E898FB                   call stmt
  7346 000036EC FF76FC                   push word [bp-4]
  7347 000036EF E854FF                   call prlabel
  7348 000036F2 83C402                   add  sp, 2
  7349                                  
  7350                                  ;-734   else prlabel(jdest); }
  7351                                  
  7352 000036F5 E90900                   jmp .doif397
  7353                                  .doif396:
  7354 000036F8 FF76FE                   push word [bp-2]
  7355 000036FB E848FF                   call prlabel
  7356 000036FE 83C402                   add  sp, 2
  7357                                  .doif397:
  7358                                  
  7359                                  ;-735 
  7360                                  
  7361                                  
  7362                                  ;-736 int dodo() {int jdest; int jtemp;
  7363 00003701 C9                       LEAVE
  7364 00003702 C3                       ret
  7365                                  ENDP
  7366                                  
  7367                                  dodo: PROC
  7368                                  
  7369                                  ;-737   nlabel++; jdest=nlabel; prlabel(jdest); stmt();
  7370                                  
  7371                                  ;Function : dodo, Number of local variables: 2
  7372                                  ;   # type sign width addr used name   list of local variables
  7373                                  ;  200 var sign word   736 NULL jdest = bp-2
  7374                                  ;  201 var sign word   736 NULL jtemp = bp-4;
  7375 00003703 C8040000                 ENTER  4,0
  7376 00003707 FF06[2A00]               inc  word[nlabel]
  7377 0000370B A1[2A00]                 mov ax, [nlabel]
  7378 0000370E 8946FE                   mov [bp-2], ax
  7379 00003711 FF76FE                   push word [bp-2]
  7380 00003714 E82FFF                   call prlabel
  7381 00003717 83C402                   add  sp, 2
  7382 0000371A E867FB                   call stmt
  7383                                  
  7384                                  ;-738   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);
  7385                                  
  7386 0000371D 680302                   push 515
  7387 00003720 E82708                   call expect
  7388 00003723 83C402                   add  sp, 2
  7389 00003726 E81DD9                   call pexpr
  7390 00003729 FF06[2A00]               inc  word[nlabel]
  7391 0000372D A1[2A00]                 mov ax, [nlabel]
  7392 00003730 8946FC                   mov [bp-4], ax
  7393 00003733 FF76FC                   push word [bp-4]
  7394 00003736 E81B0A                   call pint1
  7395 00003739 83C402                   add  sp, 2
  7396                                  
  7397                                  ;-739   prjump(jdest); prlabel(jtemp); }
  7398                                  
  7399 0000373C FF76FE                   push word [bp-2]
  7400 0000373F E833FF                   call prjump
  7401 00003742 83C402                   add  sp, 2
  7402 00003745 FF76FC                   push word [bp-4]
  7403 00003748 E8FBFE                   call prlabel
  7404 0000374B 83C402                   add  sp, 2
  7405                                  
  7406                                  ;-740 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
  7407 0000374E C9                       LEAVE
  7408 0000374F C3                       ret
  7409                                  ENDP
  7410                                  
  7411                                  dowhile: PROC
  7412                                  ;Function : dowhile, Number of local variables: 2
  7413                                  ;   # type sign width addr used name   list of local variables
  7414                                  ;  200 var sign word   740 NULL jdest = bp-2
  7415                                  ;  201 var sign word   740 NULL tst = bp-4;
  7416 00003750 C8040000                 ENTER  4,0
  7417 00003754 FF06[2A00]               inc  word[nlabel]
  7418 00003758 A1[2A00]                 mov ax, [nlabel]
  7419 0000375B 8946FE                   mov [bp-2], ax
  7420                                  
  7421                                  ;-741   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);
  7422                                  
  7423 0000375E FF76FE                   push word [bp-2]
  7424 00003761 E8E2FE                   call prlabel
  7425 00003764 83C402                   add  sp, 2
  7426 00003767 E8DCD8                   call pexpr
  7427 0000376A FF06[2A00]               inc  word[nlabel]
  7428 0000376E A1[2A00]                 mov ax, [nlabel]
  7429 00003771 8946FC                   mov [bp-4], ax
  7430 00003774 FF76FC                   push word [bp-4]
  7431 00003777 E8DA09                   call pint1
  7432 0000377A 83C402                   add  sp, 2
  7433                                  
  7434                                  ;-742   stmt(); prjump(jdest); prlabel(tst); }
  7435                                  
  7436 0000377D E804FB                   call stmt
  7437 00003780 FF76FE                   push word [bp-2]
  7438 00003783 E8EFFE                   call prjump
  7439 00003786 83C402                   add  sp, 2
  7440 00003789 FF76FC                   push word [bp-4]
  7441 0000378C E8B7FE                   call prlabel
  7442 0000378F 83C402                   add  sp, 2
  7443                                  
  7444                                  ;-743 int isrelational() {
  7445 00003792 C9                       LEAVE
  7446 00003793 C3                       ret
  7447                                  ENDP
  7448                                  
  7449                                  isrelational: PROC
  7450                                  
  7451                                  ;-744   if (token==T_EQ) goto w; if (token==T_NE) goto w;
  7452                                  
  7453 00003794 A1[1E00]                 mov ax, [token]
  7454 00003797 3D2603                   cmp ax, 806
  7455 0000379A 0F850300                 jne .isrelational398
  7456 0000379E E94700                   jmp .w
  7457                                  .isrelational398:
  7458 000037A1 A1[1E00]                 mov ax, [token]
  7459 000037A4 3D2703                   cmp ax, 807
  7460 000037A7 0F850300                 jne .isrelational399
  7461 000037AB E93A00                   jmp .w
  7462                                  
  7463                                  ;-745   if (token==T_LE) goto w; if (token==T_GE) goto w;
  7464                                  
  7465                                  .isrelational399:
  7466 000037AE A1[1E00]                 mov ax, [token]
  7467 000037B1 3D3803                   cmp ax, 824
  7468 000037B4 0F850300                 jne .isrelational400
  7469 000037B8 E92D00                   jmp .w
  7470                                  .isrelational400:
  7471 000037BB A1[1E00]                 mov ax, [token]
  7472 000037BE 3D2B03                   cmp ax, 811
  7473 000037C1 0F850300                 jne .isrelational401
  7474 000037C5 E92000                   jmp .w
  7475                                  
  7476                                  ;-746   if (token=='<' ) goto w; if (token=='>' ) goto w;
  7477                                  
  7478                                  .isrelational401:
  7479 000037C8 A1[1E00]                 mov ax, [token]
  7480 000037CB 83F83C                   cmp ax, 60
  7481 000037CE 0F850300                 jne .isrelational402
  7482 000037D2 E91300                   jmp .w
  7483                                  .isrelational402:
  7484 000037D5 A1[1E00]                 mov ax, [token]
  7485 000037D8 83F83E                   cmp ax, 62
  7486 000037DB 0F850300                 jne .isrelational403
  7487 000037DF E90600                   jmp .w
  7488                                  
  7489                                  ;-747   return 0;  w: iscmp=token; token=getlex(); return 1;}
  7490                                  
  7491                                  .isrelational403:
  7492 000037E2 B80000                   mov ax, 0
  7493 000037E5 E91200                   jmp .retnisrelational
  7494                                  .w:
  7495 000037E8 A1[1E00]                 mov ax, [token]
  7496 000037EB A3[2400]                 mov word [iscmp], ax
  7497 000037EE E80A00                   call getlex
  7498 000037F1 A3[1E00]                 mov word [token], ax
  7499 000037F4 B80100                   mov ax, 1
  7500 000037F7 E90000                   jmp .retnisrelational
  7501                                  
  7502                                  ;-748 
  7503                                  
  7504                                  
  7505                                  ;-749 char symboltemp[80];
  7506                                  
  7507                                   .retnisrelational:
  7508 000037FA C3                       ret
  7509                                  ENDP
  7510                                  section .bss
  7511                                  absolute 48468
  7512 0000BD54 <res 00000050>          symboltemp resb 80
  7513                                  section .text
  7514                                  
  7515                                  ;-750 int getlex() { char c; char *p;
  7516                                  
  7517                                  
  7518                                  getlex: PROC
  7519                                  
  7520                                  ;-751 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;
  7521                                  
  7522                                  ;Function : getlex, Number of local variables: 2
  7523                                  ;   # type sign width addr used name   list of local variables
  7524                                  ;  200 var sign byte   750 NULL c = bp-2
  7525                                  ;  201 ptr sign byte   750 NULL p = bp-4;
  7526 000037FB C8040000                 ENTER  4,0
  7527                                  .g1:
  7528 000037FF E80807                   call next
  7529 00003802 8846FE                   mov [bp-2], al
  7530 00003805 8A46FE                   mov al, [bp-2]
  7531 00003808 3C00                     cmp al, 0
  7532 0000380A 0F850600                 jne .getlex404
  7533 0000380E B80000                   mov ax, 0
  7534 00003811 E9F404                   jmp .retngetlex
  7535                                  .getlex404:
  7536 00003814 8A46FE                   mov al, [bp-2]
  7537 00003817 3C20                     cmp al, 32
  7538 00003819 0F8F0200                 jg  .getlex405
  7539 0000381D EBE0                     jmp .g1
  7540                                  
  7541                                  ;-752   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}
  7542                                  
  7543                                  .getlex405:
  7544 0000381F 8A46FE                   mov al, [bp-2]
  7545 00003822 3C3D                     cmp al, 61
  7546 00003824 0F851200                 jne .getlex406
  7547 00003828 A0[2300]                 mov al, [thechar]
  7548 0000382B 3C3D                     cmp al, 61
  7549 0000382D 0F850900                 jne .getlex407
  7550 00003831 E8D606                   call next
  7551 00003834 B82603                   mov ax, 806
  7552 00003837 E9CE04                   jmp .retngetlex
  7553                                  .getlex407:
  7554                                  
  7555                                  ;-753   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}
  7556                                  
  7557                                  .getlex406:
  7558 0000383A 8A46FE                   mov al, [bp-2]
  7559 0000383D 3C21                     cmp al, 33
  7560 0000383F 0F851200                 jne .getlex408
  7561 00003843 A0[2300]                 mov al, [thechar]
  7562 00003846 3C3D                     cmp al, 61
  7563 00003848 0F850900                 jne .getlex409
  7564 0000384C E8BB06                   call next
  7565 0000384F B82703                   mov ax, 807
  7566 00003852 E9B304                   jmp .retngetlex
  7567                                  .getlex409:
  7568                                  
  7569                                  ;-754   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}
  7570                                  
  7571                                  .getlex408:
  7572 00003855 8A46FE                   mov al, [bp-2]
  7573 00003858 3C3C                     cmp al, 60
  7574 0000385A 0F851200                 jne .getlex410
  7575 0000385E A0[2300]                 mov al, [thechar]
  7576 00003861 3C3D                     cmp al, 61
  7577 00003863 0F850900                 jne .getlex411
  7578 00003867 E8A006                   call next
  7579 0000386A B83803                   mov ax, 824
  7580 0000386D E99804                   jmp .retngetlex
  7581                                  .getlex411:
  7582                                  
  7583                                  ;-755   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}
  7584                                  
  7585                                  .getlex410:
  7586 00003870 8A46FE                   mov al, [bp-2]
  7587 00003873 3C3E                     cmp al, 62
  7588 00003875 0F851200                 jne .getlex412
  7589 00003879 A0[2300]                 mov al, [thechar]
  7590 0000387C 3C3D                     cmp al, 61
  7591 0000387E 0F850900                 jne .getlex413
  7592 00003882 E88506                   call next
  7593 00003885 B82B03                   mov ax, 811
  7594 00003888 E97D04                   jmp .retngetlex
  7595                                  .getlex413:
  7596                                  
  7597                                  ;-756   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}
  7598                                  
  7599                                  .getlex412:
  7600 0000388B 8A46FE                   mov al, [bp-2]
  7601 0000388E 3C3C                     cmp al, 60
  7602 00003890 0F851200                 jne .getlex414
  7603 00003894 A0[2300]                 mov al, [thechar]
  7604 00003897 3C3C                     cmp al, 60
  7605 00003899 0F850900                 jne .getlex415
  7606 0000389D E86A06                   call next
  7607 000038A0 B8D804                   mov ax, 1240
  7608 000038A3 E96204                   jmp .retngetlex
  7609                                  .getlex415:
  7610                                  
  7611                                  ;-757   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}
  7612                                  
  7613                                  .getlex414:
  7614 000038A6 8A46FE                   mov al, [bp-2]
  7615 000038A9 3C3E                     cmp al, 62
  7616 000038AB 0F851200                 jne .getlex416
  7617 000038AF A0[2300]                 mov al, [thechar]
  7618 000038B2 3C3E                     cmp al, 62
  7619 000038B4 0F850900                 jne .getlex417
  7620 000038B8 E84F06                   call next
  7621 000038BB B8D904                   mov ax, 1241
  7622 000038BE E94704                   jmp .retngetlex
  7623                                  .getlex417:
  7624                                  
  7625                                  ;-758   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}
  7626                                  
  7627                                  .getlex416:
  7628 000038C1 8A46FE                   mov al, [bp-2]
  7629 000038C4 3C2B                     cmp al, 43
  7630 000038C6 0F851200                 jne .getlex418
  7631 000038CA A0[2300]                 mov al, [thechar]
  7632 000038CD 3C2B                     cmp al, 43
  7633 000038CF 0F850900                 jne .getlex419
  7634 000038D3 E83406                   call next
  7635 000038D6 B8C304                   mov ax, 1219
  7636 000038D9 E92C04                   jmp .retngetlex
  7637                                  .getlex419:
  7638                                  
  7639                                  ;-759   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}
  7640                                  
  7641                                  .getlex418:
  7642 000038DC 8A46FE                   mov al, [bp-2]
  7643 000038DF 3C2D                     cmp al, 45
  7644 000038E1 0F851200                 jne .getlex420
  7645 000038E5 A0[2300]                 mov al, [thechar]
  7646 000038E8 3C2D                     cmp al, 45
  7647 000038EA 0F850900                 jne .getlex421
  7648 000038EE E81906                   call next
  7649 000038F1 B8C904                   mov ax, 1225
  7650 000038F4 E91104                   jmp .retngetlex
  7651                                  .getlex421:
  7652                                  
  7653                                  ;-760   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}
  7654                                  
  7655                                  .getlex420:
  7656 000038F7 8A46FE                   mov al, [bp-2]
  7657 000038FA 3C2B                     cmp al, 43
  7658 000038FC 0F851200                 jne .getlex422
  7659 00003900 A0[2300]                 mov al, [thechar]
  7660 00003903 3C3D                     cmp al, 61
  7661 00003905 0F850900                 jne .getlex423
  7662 00003909 E8FE05                   call next
  7663 0000390C B8CE04                   mov ax, 1230
  7664 0000390F E9F603                   jmp .retngetlex
  7665                                  .getlex423:
  7666                                  
  7667                                  ;-761   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}
  7668                                  
  7669                                  .getlex422:
  7670 00003912 8A46FE                   mov al, [bp-2]
  7671 00003915 3C2D                     cmp al, 45
  7672 00003917 0F851200                 jne .getlex424
  7673 0000391B A0[2300]                 mov al, [thechar]
  7674 0000391E 3C3D                     cmp al, 61
  7675 00003920 0F850900                 jne .getlex425
  7676 00003924 E8E305                   call next
  7677 00003927 B8CF04                   mov ax, 1231
  7678 0000392A E9DB03                   jmp .retngetlex
  7679                                  .getlex425:
  7680                                  
  7681                                  ;-762   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}
  7682                                  
  7683                                  .getlex424:
  7684 0000392D 8A46FE                   mov al, [bp-2]
  7685 00003930 3C26                     cmp al, 38
  7686 00003932 0F851200                 jne .getlex426
  7687 00003936 A0[2300]                 mov al, [thechar]
  7688 00003939 3C3D                     cmp al, 61
  7689 0000393B 0F850900                 jne .getlex427
  7690 0000393F E8C805                   call next
  7691 00003942 B8D204                   mov ax, 1234
  7692 00003945 E9C003                   jmp .retngetlex
  7693                                  .getlex427:
  7694                                  
  7695                                  ;-763   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}
  7696                                  
  7697                                  .getlex426:
  7698 00003948 8A46FE                   mov al, [bp-2]
  7699 0000394B 3C7C                     cmp al, 124
  7700 0000394D 0F851200                 jne .getlex428
  7701 00003951 A0[2300]                 mov al, [thechar]
  7702 00003954 3C3D                     cmp al, 61
  7703 00003956 0F850900                 jne .getlex429
  7704 0000395A E8AD05                   call next
  7705 0000395D B8D304                   mov ax, 1235
  7706 00003960 E9A503                   jmp .retngetlex
  7707                                  .getlex429:
  7708                                  
  7709                                  ;-764   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}
  7710                                  
  7711                                  .getlex428:
  7712 00003963 8A46FE                   mov al, [bp-2]
  7713 00003966 3C2A                     cmp al, 42
  7714 00003968 0F851200                 jne .getlex430
  7715 0000396C A0[2300]                 mov al, [thechar]
  7716 0000396F 3C3D                     cmp al, 61
  7717 00003971 0F850900                 jne .getlex431
  7718 00003975 E89205                   call next
  7719 00003978 B8D004                   mov ax, 1232
  7720 0000397B E98A03                   jmp .retngetlex
  7721                                  .getlex431:
  7722                                  
  7723                                  ;-765   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}
  7724                                  
  7725                                  .getlex430:
  7726 0000397E 8A46FE                   mov al, [bp-2]
  7727 00003981 3C2F                     cmp al, 47
  7728 00003983 0F851200                 jne .getlex432
  7729 00003987 A0[2300]                 mov al, [thechar]
  7730 0000398A 3C3D                     cmp al, 61
  7731 0000398C 0F850900                 jne .getlex433
  7732 00003990 E87705                   call next
  7733 00003993 B8D104                   mov ax, 1233
  7734 00003996 E96F03                   jmp .retngetlex
  7735                                  .getlex433:
  7736                                  
  7737                                  ;-766   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;
  7738                                  
  7739                                  .getlex432:
  7740 00003999 8A46FE                   mov al, byte [bp-2]
  7741 0000399C B400                     mov ah, 0
  7742 0000399E 50                       push ax
  7743 0000399F 68[0A3D]                 push getlex_0
  7744 000039A2 E83FC8                   call instr1
  7745 000039A5 83C404                   add  sp, 4
  7746 000039A8 08C0                     or  al, al
  7747 000039AA 0F840600                 je .getlex434
  7748 000039AE 8A46FE                   mov al, [bp-2]
  7749 000039B1 E95403                   jmp .retngetlex
  7750                                  
  7751                                  ;-767   if (c == '/') { if (thechar == '/') {
  7752                                  
  7753                                  .getlex434:
  7754 000039B4 8A46FE                   mov al, [bp-2]
  7755 000039B7 3C2F                     cmp al, 47
  7756 000039B9 0F852900                 jne .getlex435
  7757 000039BD A0[2300]                 mov al, [thechar]
  7758 000039C0 3C2F                     cmp al, 47
  7759 000039C2 0F852000                 jne .getlex436
  7760                                  
  7761                                  ;-768       do c=next(); while(ifEOL(c)==0) return getlex(); } }
  7762                                  
  7763                                  .getlex437:
  7764 000039C6 E84105                   call next
  7765 000039C9 8846FE                   mov [bp-2], al
  7766 000039CC 8A46FE                   mov al, byte [bp-2]
  7767 000039CF B400                     mov ah, 0
  7768 000039D1 50                       push ax
  7769 000039D2 E88B09                   call ifEOL
  7770 000039D5 83C402                   add  sp, 2
  7771 000039D8 3C00                     cmp al, 0
  7772 000039DA 0F850200                 jne .getlex438
  7773 000039DE EBE6                     jmp .getlex437
  7774                                  .getlex438:
  7775 000039E0 E818FE                   call getlex
  7776 000039E3 E92203                   jmp .retngetlex
  7777                                  .getlex436:
  7778                                  
  7779                                  ;-769   if (c == '/') { if (thechar == '*') {
  7780                                  
  7781                                  .getlex435:
  7782 000039E6 8A46FE                   mov al, [bp-2]
  7783 000039E9 3C2F                     cmp al, 47
  7784 000039EB 0F853A00                 jne .getlex439
  7785 000039EF A0[2300]                 mov al, [thechar]
  7786 000039F2 3C2A                     cmp al, 42
  7787 000039F4 0F852B00                 jne .getlex440
  7788                                  
  7789                                  ;-770       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;
  7790                                  
  7791                                  .g2:
  7792 000039F8 E80F05                   call next
  7793 000039FB 8846FE                   mov [bp-2], al
  7794 000039FE 8A46FE                   mov al, [bp-2]
  7795 00003A01 3C2A                     cmp al, 42
  7796 00003A03 0F840200                 je  .getlex441
  7797 00003A07 EBEF                     jmp .g2
  7798                                  .getlex441:
  7799 00003A09 A0[2300]                 mov al, [thechar]
  7800 00003A0C 3C2F                     cmp al, 47
  7801 00003A0E 0F840200                 je  .getlex442
  7802 00003A12 EBE4                     jmp .g2
  7803                                  
  7804                                  ;-771       c=next(); return getlex(); } else  return '/'; }
  7805                                  
  7806                                  .getlex442:
  7807 00003A14 E8F304                   call next
  7808 00003A17 8846FE                   mov [bp-2], al
  7809 00003A1A E8DEFD                   call getlex
  7810 00003A1D E9E802                   jmp .retngetlex
  7811 00003A20 E90600                   jmp .getlex443
  7812                                  .getlex440:
  7813 00003A23 B82F00                   mov ax, 47
  7814 00003A26 E9DF02                   jmp .retngetlex
  7815                                  .getlex443:
  7816                                  
  7817                                  ;-772   if (c == '"') {getstring(c); return T_STRING;}
  7818                                  
  7819                                  .getlex439:
  7820 00003A29 8A46FE                   mov al, [bp-2]
  7821 00003A2C 3C22                     cmp al, 34
  7822 00003A2E 0F851200                 jne .getlex444
  7823 00003A32 8A46FE                   mov al, byte [bp-2]
  7824 00003A35 B400                     mov ah, 0
  7825 00003A37 50                       push ax
  7826 00003A38 E89804                   call getstring
  7827 00003A3B 83C402                   add  sp, 2
  7828 00003A3E B80201                   mov ax, 258
  7829 00003A41 E9C402                   jmp .retngetlex
  7830                                  
  7831                                  ;-773   if (digit(c)) { getdigit(c); return T_CONST; }
  7832                                  
  7833                                  .getlex444:
  7834 00003A44 8A46FE                   mov al, byte [bp-2]
  7835 00003A47 B400                     mov ah, 0
  7836 00003A49 50                       push ax
  7837 00003A4A E831C8                   call digit
  7838 00003A4D 83C402                   add  sp, 2
  7839 00003A50 08C0                     or  al, al
  7840 00003A52 0F841200                 je .getlex445
  7841 00003A56 8A46FE                   mov al, byte [bp-2]
  7842 00003A59 B400                     mov ah, 0
  7843 00003A5B 50                       push ax
  7844 00003A5C E89E03                   call getdigit
  7845 00003A5F 83C402                   add  sp, 2
  7846 00003A62 B80101                   mov ax, 257
  7847 00003A65 E9A002                   jmp .retngetlex
  7848                                  
  7849                                  ;-774   if (c==39) { lexval=next();
  7850                                  
  7851                                  .getlex445:
  7852 00003A68 8A46FE                   mov al, [bp-2]
  7853 00003A6B 3C27                     cmp al, 39
  7854 00003A6D 0F854F00                 jne .getlex446
  7855 00003A71 E89604                   call next
  7856 00003A74 A3[3000]                 mov word [lexval], ax
  7857                                  
  7858                                  ;-775     if (lexval==92) {lexval=next();
  7859                                  
  7860 00003A77 A1[3000]                 mov ax, [lexval]
  7861 00003A7A 83F85C                   cmp ax, 92
  7862 00003A7D 0F853600                 jne .getlex447
  7863 00003A81 E88604                   call next
  7864 00003A84 A3[3000]                 mov word [lexval], ax
  7865                                  
  7866                                  ;-776       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;
  7867                                  
  7868 00003A87 A1[3000]                 mov ax, [lexval]
  7869 00003A8A 83F86E                   cmp ax, 110
  7870 00003A8D 0F850600                 jne .getlex448
  7871 00003A91 B80A00                   mov ax, 10
  7872 00003A94 A3[3000]                 mov word [lexval], ax
  7873                                  .getlex448:
  7874 00003A97 A1[3000]                 mov ax, [lexval]
  7875 00003A9A 83F874                   cmp ax, 116
  7876 00003A9D 0F850600                 jne .getlex449
  7877 00003AA1 B80900                   mov ax, 9
  7878 00003AA4 A3[3000]                 mov word [lexval], ax
  7879                                  
  7880                                  ;-777       if (lexval=='0') lexval= 0; } next(); return T_CONST; }
  7881                                  
  7882                                  .getlex449:
  7883 00003AA7 A1[3000]                 mov ax, [lexval]
  7884 00003AAA 83F830                   cmp ax, 48
  7885 00003AAD 0F850600                 jne .getlex450
  7886 00003AB1 B80000                   mov ax, 0
  7887 00003AB4 A3[3000]                 mov word [lexval], ax
  7888                                  .getlex450:
  7889                                  .getlex447:
  7890 00003AB7 E85004                   call next
  7891 00003ABA B80101                   mov ax, 257
  7892 00003ABD E94802                   jmp .retngetlex
  7893                                  
  7894                                  ;-778   if (alnum(c)) {
  7895                                  
  7896                                  .getlex446:
  7897 00003AC0 8A46FE                   mov al, byte [bp-2]
  7898 00003AC3 B400                     mov ah, 0
  7899 00003AC5 50                       push ax
  7900 00003AC6 E85DC8                   call alnum
  7901 00003AC9 83C402                   add  sp, 2
  7902 00003ACC 08C0                     or  al, al
  7903 00003ACE 0F842D02                 je .getlex451
  7904                                  
  7905                                  ;-779     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;
  7906                                  
  7907 00003AD2 8D06A36D                 lea  ax, [symbol]
  7908 00003AD6 50                       push ax
  7909 00003AD7 8D0654BD                 lea  ax, [symboltemp]
  7910 00003ADB 50                       push ax
  7911 00003ADC E889C6                   call strcpy
  7912 00003ADF 83C404                   add  sp, 4
  7913 00003AE2 B8A36D                   mov ax, symbol
  7914 00003AE5 8946FC                   mov [bp-4], ax
  7915 00003AE8 8A46FE                   mov al, [bp-2]
  7916 00003AEB 8B5EFC                   mov  bx, [bp-4]
  7917 00003AEE 8807                     mov  [bx], al
  7918 00003AF0 FF46FC                   inc  word[bp-4]
  7919                                  
  7920                                  ;-780     while(alnum(thechar)) {c=next(); *p=c;  p++; }
  7921                                  
  7922                                  .getlex452:
  7923 00003AF3 A0[2300]                 mov al, byte [thechar]
  7924 00003AF6 B400                     mov ah, 0
  7925 00003AF8 50                       push ax
  7926 00003AF9 E82AC8                   call alnum
  7927 00003AFC 83C402                   add  sp, 2
  7928 00003AFF 08C0                     or  al, al
  7929 00003B01 0F841300                 je .getlex453
  7930 00003B05 E80204                   call next
  7931 00003B08 8846FE                   mov [bp-2], al
  7932 00003B0B 8A46FE                   mov al, [bp-2]
  7933 00003B0E 8B5EFC                   mov  bx, [bp-4]
  7934 00003B11 8807                     mov  [bx], al
  7935 00003B13 FF46FC                   inc  word[bp-4]
  7936                                  
  7937                                  ;-781       *p=0;
  7938                                  
  7939 00003B16 EBDB                     jmp .getlex452
  7940                                  .getlex453:
  7941 00003B18 B80000                   mov ax, 0
  7942 00003B1B 8B5EFC                   mov  bx, [bp-4]
  7943 00003B1E 8807                     mov  [bx], al
  7944                                  
  7945                                  ;-782     if (eqstr(symbol,"signed"  )) return T_SIGNED;
  7946                                  
  7947 00003B20 68[203D]                 push getlex_1
  7948 00003B23 8D06A36D                 lea  ax, [symbol]
  7949 00003B27 50                       push ax
  7950 00003B28 E86DC6                   call eqstr
  7951 00003B2B 83C404                   add  sp, 4
  7952 00003B2E 08C0                     or  al, al
  7953 00003B30 0F840600                 je .getlex454
  7954 00003B34 B81302                   mov ax, 531
  7955 00003B37 E9CE01                   jmp .retngetlex
  7956                                  
  7957                                  ;-783     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;
  7958                                  
  7959                                  .getlex454:
  7960 00003B3A 68[273D]                 push getlex_2
  7961 00003B3D 8D06A36D                 lea  ax, [symbol]
  7962 00003B41 50                       push ax
  7963 00003B42 E853C6                   call eqstr
  7964 00003B45 83C404                   add  sp, 4
  7965 00003B48 08C0                     or  al, al
  7966 00003B4A 0F840600                 je .getlex455
  7967 00003B4E B81402                   mov ax, 532
  7968 00003B51 E9B401                   jmp .retngetlex
  7969                                  
  7970                                  ;-784     if (eqstr(symbol,"void"    )) return T_VOID;
  7971                                  
  7972                                  .getlex455:
  7973 00003B54 68[303D]                 push getlex_3
  7974 00003B57 8D06A36D                 lea  ax, [symbol]
  7975 00003B5B 50                       push ax
  7976 00003B5C E839C6                   call eqstr
  7977 00003B5F 83C404                   add  sp, 4
  7978 00003B62 08C0                     or  al, al
  7979 00003B64 0F840600                 je .getlex456
  7980 00003B68 B81102                   mov ax, 529
  7981 00003B6B E99A01                   jmp .retngetlex
  7982                                  
  7983                                  ;-785     if (eqstr(symbol,"int"     )) return T_INT;
  7984                                  
  7985                                  .getlex456:
  7986 00003B6E 68[353D]                 push getlex_4
  7987 00003B71 8D06A36D                 lea  ax, [symbol]
  7988 00003B75 50                       push ax
  7989 00003B76 E81FC6                   call eqstr
  7990 00003B79 83C404                   add  sp, 4
  7991 00003B7C 08C0                     or  al, al
  7992 00003B7E 0F840600                 je .getlex457
  7993 00003B82 B80502                   mov ax, 517
  7994 00003B85 E98001                   jmp .retngetlex
  7995                                  
  7996                                  ;-786     if (eqstr(symbol,"long"    )) return T_LONG;
  7997                                  
  7998                                  .getlex457:
  7999 00003B88 68[393D]                 push getlex_5
  8000 00003B8B 8D06A36D                 lea  ax, [symbol]
  8001 00003B8F 50                       push ax
  8002 00003B90 E805C6                   call eqstr
  8003 00003B93 83C404                   add  sp, 4
  8004 00003B96 08C0                     or  al, al
  8005 00003B98 0F840600                 je .getlex458
  8006 00003B9C B81502                   mov ax, 533
  8007 00003B9F E96601                   jmp .retngetlex
  8008                                  
  8009                                  ;-787     if (eqstr(symbol,"char"    )) return T_CHAR;
  8010                                  
  8011                                  .getlex458:
  8012 00003BA2 68[3E3D]                 push getlex_6
  8013 00003BA5 8D06A36D                 lea  ax, [symbol]
  8014 00003BA9 50                       push ax
  8015 00003BAA E8EBC5                   call eqstr
  8016 00003BAD 83C404                   add  sp, 4
  8017 00003BB0 08C0                     or  al, al
  8018 00003BB2 0F840600                 je .getlex459
  8019 00003BB6 B81202                   mov ax, 530
  8020 00003BB9 E94C01                   jmp .retngetlex
  8021                                  
  8022                                  ;-788     if (eqstr(symbol,"asm"     )) return T_ASM;
  8023                                  
  8024                                  .getlex459:
  8025 00003BBC 68[433D]                 push getlex_7
  8026 00003BBF 8D06A36D                 lea  ax, [symbol]
  8027 00003BC3 50                       push ax
  8028 00003BC4 E8D1C5                   call eqstr
  8029 00003BC7 83C404                   add  sp, 4
  8030 00003BCA 08C0                     or  al, al
  8031 00003BCC 0F840600                 je .getlex460
  8032 00003BD0 B80602                   mov ax, 518
  8033 00003BD3 E93201                   jmp .retngetlex
  8034                                  
  8035                                  ;-789     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;
  8036                                  
  8037                                  .getlex460:
  8038 00003BD6 68[473D]                 push getlex_8
  8039 00003BD9 8D06A36D                 lea  ax, [symbol]
  8040 00003BDD 50                       push ax
  8041 00003BDE E8B7C5                   call eqstr
  8042 00003BE1 83C404                   add  sp, 4
  8043 00003BE4 08C0                     or  al, al
  8044 00003BE6 0F840600                 je .getlex461
  8045 00003BEA B80702                   mov ax, 519
  8046 00003BED E91801                   jmp .retngetlex
  8047                                  
  8048                                  ;-790     if (eqstr(symbol,"__emit__")) return T_EMIT;
  8049                                  
  8050                                  .getlex461:
  8051 00003BF0 68[4D3D]                 push getlex_9
  8052 00003BF3 8D06A36D                 lea  ax, [symbol]
  8053 00003BF7 50                       push ax
  8054 00003BF8 E89DC5                   call eqstr
  8055 00003BFB 83C404                   add  sp, 4
  8056 00003BFE 08C0                     or  al, al
  8057 00003C00 0F840600                 je .getlex462
  8058 00003C04 B80802                   mov ax, 520
  8059 00003C07 E9FE00                   jmp .retngetlex
  8060                                  
  8061                                  ;-791     if (eqstr(symbol,"return"  )) return T_RETURN;
  8062                                  
  8063                                  .getlex462:
  8064 00003C0A 68[563D]                 push getlex_10
  8065 00003C0D 8D06A36D                 lea  ax, [symbol]
  8066 00003C11 50                       push ax
  8067 00003C12 E883C5                   call eqstr
  8068 00003C15 83C404                   add  sp, 4
  8069 00003C18 08C0                     or  al, al
  8070 00003C1A 0F840600                 je .getlex463
  8071 00003C1E B80002                   mov ax, 512
  8072 00003C21 E9E400                   jmp .retngetlex
  8073                                  
  8074                                  ;-792     if (eqstr(symbol,"if"      )) return T_IF;
  8075                                  
  8076                                  .getlex463:
  8077 00003C24 68[5D3D]                 push getlex_11
  8078 00003C27 8D06A36D                 lea  ax, [symbol]
  8079 00003C2B 50                       push ax
  8080 00003C2C E869C5                   call eqstr
  8081 00003C2F 83C404                   add  sp, 4
  8082 00003C32 08C0                     or  al, al
  8083 00003C34 0F840600                 je .getlex464
  8084 00003C38 B80102                   mov ax, 513
  8085 00003C3B E9CA00                   jmp .retngetlex
  8086                                  
  8087                                  ;-793     if (eqstr(symbol,"else"    )) return T_ELSE;
  8088                                  
  8089                                  .getlex464:
  8090 00003C3E 68[603D]                 push getlex_12
  8091 00003C41 8D06A36D                 lea  ax, [symbol]
  8092 00003C45 50                       push ax
  8093 00003C46 E84FC5                   call eqstr
  8094 00003C49 83C404                   add  sp, 4
  8095 00003C4C 08C0                     or  al, al
  8096 00003C4E 0F840600                 je .getlex465
  8097 00003C52 B80202                   mov ax, 514
  8098 00003C55 E9B000                   jmp .retngetlex
  8099                                  
  8100                                  ;-794     if (eqstr(symbol,"while"   )) return T_WHILE;
  8101                                  
  8102                                  .getlex465:
  8103 00003C58 68[653D]                 push getlex_13
  8104 00003C5B 8D06A36D                 lea  ax, [symbol]
  8105 00003C5F 50                       push ax
  8106 00003C60 E835C5                   call eqstr
  8107 00003C63 83C404                   add  sp, 4
  8108 00003C66 08C0                     or  al, al
  8109 00003C68 0F840600                 je .getlex466
  8110 00003C6C B80302                   mov ax, 515
  8111 00003C6F E99600                   jmp .retngetlex
  8112                                  
  8113                                  ;-795     if (eqstr(symbol,"do"      )) return T_DO;
  8114                                  
  8115                                  .getlex466:
  8116 00003C72 68[6B3D]                 push getlex_14
  8117 00003C75 8D06A36D                 lea  ax, [symbol]
  8118 00003C79 50                       push ax
  8119 00003C7A E81BC5                   call eqstr
  8120 00003C7D 83C404                   add  sp, 4
  8121 00003C80 08C0                     or  al, al
  8122 00003C82 0F840600                 je .getlex467
  8123 00003C86 B80402                   mov ax, 516
  8124 00003C89 E97C00                   jmp .retngetlex
  8125                                  
  8126                                  ;-796     if (eqstr(symbol,"goto"    )) return T_GOTO;
  8127                                  
  8128                                  .getlex467:
  8129 00003C8C 68[6E3D]                 push getlex_15
  8130 00003C8F 8D06A36D                 lea  ax, [symbol]
  8131 00003C93 50                       push ax
  8132 00003C94 E801C5                   call eqstr
  8133 00003C97 83C404                   add  sp, 4
  8134 00003C9A 08C0                     or  al, al
  8135 00003C9C 0F840600                 je .getlex468
  8136 00003CA0 B80902                   mov ax, 521
  8137 00003CA3 E96200                   jmp .retngetlex
  8138                                  
  8139                                  ;-797     if (eqstr(symbol,"define"  )) return T_DEFINE;
  8140                                  
  8141                                  .getlex468:
  8142 00003CA6 68[733D]                 push getlex_16
  8143 00003CA9 8D06A36D                 lea  ax, [symbol]
  8144 00003CAD 50                       push ax
  8145 00003CAE E8E7C4                   call eqstr
  8146 00003CB1 83C404                   add  sp, 4
  8147 00003CB4 08C0                     or  al, al
  8148 00003CB6 0F840600                 je .getlex469
  8149 00003CBA B8FF01                   mov ax, 511
  8150 00003CBD E94800                   jmp .retngetlex
  8151                                  
  8152                                  ;-798     if (eqstr(symbol,"include" )) return T_INCLUDE;
  8153                                  
  8154                                  .getlex469:
  8155 00003CC0 68[7A3D]                 push getlex_17
  8156 00003CC3 8D06A36D                 lea  ax, [symbol]
  8157 00003CC7 50                       push ax
  8158 00003CC8 E8CDC4                   call eqstr
  8159 00003CCB 83C404                   add  sp, 4
  8160 00003CCE 08C0                     or  al, al
  8161 00003CD0 0F840600                 je .getlex470
  8162 00003CD4 B8FE01                   mov ax, 510
  8163 00003CD7 E92E00                   jmp .retngetlex
  8164                                  
  8165                                  ;-799     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}
  8166                                  
  8167                                  .getlex470:
  8168 00003CDA E8BF00                   call convertdefine
  8169 00003CDD 08C0                     or  al, al
  8170 00003CDF 0F841600                 je .getlex471
  8171 00003CE3 8D0654BD                 lea  ax, [symboltemp]
  8172 00003CE7 50                       push ax
  8173 00003CE8 8D06A36D                 lea  ax, [symbol]
  8174 00003CEC 50                       push ax
  8175 00003CED E878C4                   call strcpy
  8176 00003CF0 83C404                   add  sp, 4
  8177 00003CF3 B80101                   mov ax, 257
  8178 00003CF6 E90F00                   jmp .retngetlex
  8179                                  
  8180                                  ;-800     return T_NAME; } error1("Input item not recognized"); }
  8181                                  
  8182                                  .getlex471:
  8183 00003CF9 B80001                   mov ax, 256
  8184 00003CFC E90900                   jmp .retngetlex
  8185                                  .getlex451:
  8186 00003CFF 68[823D]                 push getlex_18
  8187 00003D02 E8B706                   call error1
  8188 00003D05 83C402                   add  sp, 2
  8189                                  
  8190                                  ;-801 
  8191                                  
  8192                                  
  8193                                  ;-802 int convertdefine() { int i; int j;   i=0;
  8194                                  
  8195 00003D08 C9                       .retngetlex: LEAVE
  8196 00003D09 C3                       ret
  8197 00003D0A 28295B5D7B7D2C3B2A-     getlex_0 db "()[]{},;*:%-><=+!&|#?",0
  8198 00003D13 3A252D3E3C3D2B2126-
  8199 00003D1C 7C233F00           
  8200 00003D20 7369676E656400          getlex_1 db "signed",0
  8201 00003D27 756E7369676E656400      getlex_2 db "unsigned",0
  8202 00003D30 766F696400              getlex_3 db "void",0
  8203 00003D35 696E7400                getlex_4 db "int",0
  8204 00003D39 6C6F6E6700              getlex_5 db "long",0
  8205 00003D3E 6368617200              getlex_6 db "char",0
  8206 00003D43 61736D00                getlex_7 db "asm",0
  8207 00003D47 5F5F61736D00            getlex_8 db "__asm",0
  8208 00003D4D 5F5F656D69745F5F00      getlex_9 db "__emit__",0
  8209 00003D56 72657475726E00          getlex_10 db "return",0
  8210 00003D5D 696600                  getlex_11 db "if",0
  8211 00003D60 656C736500              getlex_12 db "else",0
  8212 00003D65 7768696C6500            getlex_13 db "while",0
  8213 00003D6B 646F00                  getlex_14 db "do",0
  8214 00003D6E 676F746F00              getlex_15 db "goto",0
  8215 00003D73 646566696E6500          getlex_16 db "define",0
  8216 00003D7A 696E636C75646500        getlex_17 db "include",0
  8217 00003D82 496E70757420697465-     getlex_18 db "Input item not recognized",0
  8218 00003D8B 6D206E6F7420726563-
  8219 00003D94 6F676E697A656400   
  8220                                  ENDP
  8221                                  
  8222                                  convertdefine: PROC
  8223                                  ;Function : convertdefine, Number of local variables: 2
  8224                                  ;   # type sign width addr used name   list of local variables
  8225                                  ;  200 var sign word   802 NULL i = bp-2
  8226                                  ;  201 var sign word   802 NULL j = bp-4;
  8227 00003D9C C8040000                 ENTER  4,0
  8228 00003DA0 B80000                   mov ax, 0
  8229 00003DA3 8946FE                   mov [bp-2], ax
  8230                                  
  8231                                  ;-803   while (i < GTop) {
  8232                                  
  8233                                  .convertdefine472:
  8234 00003DA6 8B46FE                   mov ax, [bp-2]
  8235 00003DA9 3B06[2C00]               cmp ax, [GTop]
  8236 00003DAD 0F8D4400                 jge .convertdefine473
  8237                                  
  8238                                  ;-804    j=adrofname(i);
  8239                                  
  8240 00003DB1 FF76FE                   push word [bp-2]
  8241 00003DB4 E81FCB                   call adrofname
  8242 00003DB7 83C402                   add  sp, 2
  8243 00003DBA 8946FC                   mov [bp-4], ax
  8244                                  
  8245                                  ;-805    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];
  8246                                  
  8247 00003DBD FF76FC                   push word [bp-4]
  8248 00003DC0 8D06A36D                 lea  ax, [symbol]
  8249 00003DC4 50                       push ax
  8250 00003DC5 E8D0C3                   call eqstr
  8251 00003DC8 83C404                   add  sp, 4
  8252 00003DCB 08C0                     or  al, al
  8253 00003DCD 0F841F00                 je .convertdefine474
  8254 00003DD1 8B5EFE                   mov bx, [bp-2]
  8255 00003DD4 8A872F6F                 mov al, [GType + bx]
  8256 00003DD8 3C23                     cmp al, 35
  8257 00003DDA 0F851200                 jne .convertdefine475
  8258 00003DDE 8B5EFE                   mov bx, [bp-2]
  8259 00003DE1 D1E3                     shl bx, 1
  8260 00003DE3 8B876377                 mov ax, [GData + bx]
  8261 00003DE7 A3[3000]                 mov word [lexval], ax
  8262                                  
  8263                                  ;-806    return T_CONST; } }
  8264                                  
  8265 00003DEA B80101                   mov ax, 257
  8266 00003DED E90B00                   jmp .retnconvertdefine
  8267                                  .convertdefine475:
  8268                                  
  8269                                  ;-807    i++; }
  8270                                  
  8271                                  .convertdefine474:
  8272 00003DF0 FF46FE                   inc  word[bp-2]
  8273                                  
  8274                                  ;-808    return 0; }
  8275                                  
  8276 00003DF3 EBB1                     jmp .convertdefine472
  8277                                  .convertdefine473:
  8278 00003DF5 B80000                   mov ax, 0
  8279 00003DF8 E90000                   jmp .retnconvertdefine
  8280                                  
  8281                                  ;-809 int getdigit(char c) { int i;
  8282                                  
  8283 00003DFB C9                       .retnconvertdefine: LEAVE
  8284 00003DFC C3                       ret
  8285                                  ENDP
  8286                                  
  8287                                  getdigit: PROC
  8288                                  
  8289                                  ;-810     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char
  8290                                  
  8291                                  ;Function : getdigit, Number of local variables: 2
  8292                                  ;   # type sign width addr used name   list of local variables
  8293                                  ;  200 var sign byte   809 NULL c = bp+4
  8294                                  ;  201 var sign word   809 NULL i = bp-2;
  8295 00003DFD C8020000                 ENTER  2,0
  8296 00003E01 B80000                   mov ax, 0
  8297 00003E04 A3[3000]                 mov word [lexval], ax
  8298 00003E07 8A4604                   mov al, [bp+4]
  8299 00003E0A 2C30                     sub al, 48
  8300 00003E0C A3[3000]                 mov word [lexval], ax
  8301                                  
  8302                                  ;-811     if (thechar=='x') thechar='X'; if (thechar=='X') { next();
  8303                                  
  8304 00003E0F A0[2300]                 mov al, [thechar]
  8305 00003E12 3C78                     cmp al, 120
  8306 00003E14 0F850600                 jne .getdigit476
  8307 00003E18 B85800                   mov ax, 88
  8308 00003E1B A2[2300]                 mov byte [thechar], al
  8309                                  .getdigit476:
  8310 00003E1E A0[2300]                 mov al, [thechar]
  8311 00003E21 3C58                     cmp al, 88
  8312 00003E23 0F856800                 jne .getdigit477
  8313 00003E27 E8E000                   call next
  8314                                  
  8315                                  ;-812       while(alnum(thechar)) { c=next(); if(c>96) c=c-39;
  8316                                  
  8317                                  .getdigit478:
  8318 00003E2A A0[2300]                 mov al, byte [thechar]
  8319 00003E2D B400                     mov ah, 0
  8320 00003E2F 50                       push ax
  8321 00003E30 E8F3C4                   call alnum
  8322 00003E33 83C402                   add  sp, 2
  8323 00003E36 08C0                     or  al, al
  8324 00003E38 0F845000                 je .getdigit479
  8325 00003E3C E8CB00                   call next
  8326 00003E3F 884604                   mov [bp+4], al
  8327 00003E42 8A4604                   mov al, [bp+4]
  8328 00003E45 3C60                     cmp al, 96
  8329 00003E47 0F8E0800                 jle .getdigit480
  8330 00003E4B 8A4604                   mov al, [bp+4]
  8331 00003E4E 2C27                     sub al, 39
  8332 00003E50 884604                   mov [bp+4], al
  8333                                  
  8334                                  ;-813 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16
  8335                                  
  8336                                  .getdigit480:
  8337 00003E53 8A4604                   mov al, [bp+4]
  8338 00003E56 3C40                     cmp al, 64
  8339 00003E58 0F8E0800                 jle .getdigit481
  8340 00003E5C 8A4604                   mov al, [bp+4]
  8341 00003E5F 2C07                     sub al, 7
  8342 00003E61 884604                   mov [bp+4], al
  8343                                  .getdigit481:
  8344 00003E64 8A4604                   mov al, [bp+4]
  8345 00003E67 2C30                     sub al, 48
  8346 00003E69 884604                   mov [bp+4], al
  8347 00003E6C A1[3000]                 mov ax, [lexval]
  8348 00003E6F C1E004                   shl ax, 4
  8349 00003E72 A3[3000]                 mov word [lexval], ax
  8350                                  
  8351                                  ;-814      i=0; i=c; lexval=lexval+i;}
  8352                                  
  8353 00003E75 B80000                   mov ax, 0
  8354 00003E78 8946FE                   mov [bp-2], ax
  8355 00003E7B 8A4604                   mov al, [bp+4]
  8356 00003E7E 8946FE                   mov [bp-2], ax
  8357 00003E81 A1[3000]                 mov ax, [lexval]
  8358 00003E84 0346FE                   add ax, [bp-2]
  8359 00003E87 A3[3000]                 mov word [lexval], ax
  8360                                  
  8361                                  ;-815     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10;
  8362                                  
  8363 00003E8A EB9E                     jmp .getdigit478
  8364                                  .getdigit479:
  8365 00003E8C E94200                   jmp .getdigit482
  8366                                  .getdigit477:
  8367                                  .getdigit483:
  8368 00003E8F A0[2300]                 mov al, byte [thechar]
  8369 00003E92 B400                     mov ah, 0
  8370 00003E94 50                       push ax
  8371 00003E95 E8E6C3                   call digit
  8372 00003E98 83C402                   add  sp, 2
  8373 00003E9B 08C0                     or  al, al
  8374 00003E9D 0F843000                 je .getdigit484
  8375 00003EA1 E86600                   call next
  8376 00003EA4 884604                   mov [bp+4], al
  8377 00003EA7 8A4604                   mov al, [bp+4]
  8378 00003EAA 2C30                     sub al, 48
  8379 00003EAC 884604                   mov [bp+4], al
  8380 00003EAF A1[3000]                 mov ax, [lexval]
  8381 00003EB2 BB0A00                   mov bx, 10
  8382 00003EB5 F7E3                     mul bx
  8383 00003EB7 A3[3000]                 mov word [lexval], ax
  8384                                  
  8385                                  ;-816      i=0; i=c; lexval=lexval+i; } }
  8386                                  
  8387 00003EBA B80000                   mov ax, 0
  8388 00003EBD 8946FE                   mov [bp-2], ax
  8389 00003EC0 8A4604                   mov al, [bp+4]
  8390 00003EC3 8946FE                   mov [bp-2], ax
  8391 00003EC6 A1[3000]                 mov ax, [lexval]
  8392 00003EC9 0346FE                   add ax, [bp-2]
  8393 00003ECC A3[3000]                 mov word [lexval], ax
  8394 00003ECF EBBE                     jmp .getdigit483
  8395                                  .getdigit484:
  8396                                  
  8397                                  ;-817 }
  8398                                  
  8399                                  .getdigit482:
  8400                                  
  8401                                  ;-818 int getstring(int delim) {int c; char *p;  p=&symbol; c=next();
  8402 00003ED1 C9                       LEAVE
  8403 00003ED2 C3                       ret
  8404                                  ENDP
  8405                                  
  8406                                  getstring: PROC
  8407                                  ;Function : getstring, Number of local variables: 3
  8408                                  ;   # type sign width addr used name   list of local variables
  8409                                  ;  200 var sign word   818 NULL delim = bp+4
  8410                                  ;  201 var sign word   818 NULL c = bp-2
  8411                                  ;  202 ptr sign byte   818 NULL p = bp-4;
  8412 00003ED3 C8040000                 ENTER  4,0
  8413 00003ED7 B8A36D                   mov ax, symbol
  8414 00003EDA 8946FC                   mov [bp-4], ax
  8415 00003EDD E82A00                   call next
  8416 00003EE0 8946FE                   mov [bp-2], ax
  8417                                  
  8418                                  ;-819   while (c != delim) {*p=c; p++; c=next(); } *p=0; }
  8419                                  
  8420                                  .getstring485:
  8421 00003EE3 8B46FE                   mov ax, [bp-2]
  8422 00003EE6 3B4604                   cmp ax, [bp+4]
  8423 00003EE9 0F841300                 je  .getstring486
  8424 00003EED 8B46FE                   mov ax, [bp-2]
  8425 00003EF0 8B5EFC                   mov  bx, [bp-4]
  8426 00003EF3 8807                     mov  [bx], al
  8427 00003EF5 FF46FC                   inc  word[bp-4]
  8428 00003EF8 E80F00                   call next
  8429 00003EFB 8946FE                   mov [bp-2], ax
  8430 00003EFE EBE3                     jmp .getstring485
  8431                                  .getstring486:
  8432 00003F00 B80000                   mov ax, 0
  8433 00003F03 8B5EFC                   mov  bx, [bp-4]
  8434 00003F06 8807                     mov  [bx], al
  8435                                  
  8436                                  ;-820 
  8437                                  
  8438                                  
  8439                                  ;-821 int next() {char r; r = thechar; globC=r; thechar = fgets1(); return r; }
  8440 00003F08 C9                       LEAVE
  8441 00003F09 C3                       ret
  8442                                  ENDP
  8443                                  
  8444                                  next: PROC
  8445                                  ;Function : next, Number of local variables: 1
  8446                                  ;   # type sign width addr used name   list of local variables
  8447                                  ;  200 var sign byte   821 NULL r = bp-2;
  8448 00003F0A C8020000                 ENTER  2,0
  8449 00003F0E A0[2300]                 mov al, [thechar]
  8450 00003F11 8846FE                   mov [bp-2], al
  8451 00003F14 8A46FE                   mov al, [bp-2]
  8452 00003F17 A2[2000]                 mov byte [globC], al
  8453 00003F1A E82E03                   call fgets1
  8454 00003F1D A2[2300]                 mov byte [thechar], al
  8455 00003F20 8A46FE                   mov al, [bp-2]
  8456 00003F23 E90000                   jmp .retnnext
  8457                                  
  8458                                  ;-822 int istoken(int t) {if (token == t) { token=getlex(); return 1; } return 0;}
  8459                                  
  8460 00003F26 C9                       .retnnext: LEAVE
  8461 00003F27 C3                       ret
  8462                                  ENDP
  8463                                  
  8464                                  istoken: PROC
  8465                                  ;Function : istoken, Number of local variables: 1
  8466                                  ;   # type sign width addr used name   list of local variables
  8467                                  ;  200 var sign word   822 NULL t = bp+4;
  8468 00003F28 C8000000                 ENTER  0,0
  8469 00003F2C A1[1E00]                 mov ax, [token]
  8470 00003F2F 3B4604                   cmp ax, [bp+4]
  8471 00003F32 0F850C00                 jne .istoken487
  8472 00003F36 E8C2F8                   call getlex
  8473 00003F39 A3[1E00]                 mov word [token], ax
  8474 00003F3C B80100                   mov ax, 1
  8475 00003F3F E90600                   jmp .retnistoken
  8476                                  .istoken487:
  8477 00003F42 B80000                   mov ax, 0
  8478 00003F45 E90000                   jmp .retnistoken
  8479                                  
  8480                                  ;-823 int expect(int t) {if (istoken(t)==0) { *cloc=0; prs(co); listproc();
  8481                                  
  8482 00003F48 C9                       .retnistoken: LEAVE
  8483 00003F49 C3                       ret
  8484                                  ENDP
  8485                                  
  8486                                  expect: PROC
  8487                                  ;Function : expect, Number of local variables: 1
  8488                                  ;   # type sign width addr used name   list of local variables
  8489                                  ;  200 var sign word   823 NULL t = bp+4;
  8490 00003F4A C8000000                 ENTER  0,0
  8491 00003F4E FF7604                   push word [bp+4]
  8492 00003F51 E8D4FF                   call istoken
  8493 00003F54 83C402                   add  sp, 2
  8494 00003F57 83F800                   cmp ax, 0
  8495 00003F5A 0F853200                 jne .expect488
  8496 00003F5E B80000                   mov ax, 0
  8497 00003F61 8B1E[1800]               mov  bx, [cloc]
  8498 00003F65 8807                     mov  [bx], al
  8499 00003F67 8D06A861                 lea  ax, [co]
  8500 00003F6B 50                       push ax
  8501 00003F6C E8EE00                   call prs
  8502 00003F6F 83C402                   add  sp, 2
  8503 00003F72 E80905                   call listproc
  8504                                  
  8505                                  ;-824   prs("\nExpected ASCII(dez): "); pint1(t); error1(" not found"); } }
  8506                                  
  8507 00003F75 68[923F]                 push expect_0
  8508 00003F78 E8E200                   call prs
  8509 00003F7B 83C402                   add  sp, 2
  8510 00003F7E FF7604                   push word [bp+4]
  8511 00003F81 E8D001                   call pint1
  8512 00003F84 83C402                   add  sp, 2
  8513 00003F87 68[AA3F]                 push expect_1
  8514 00003F8A E82F04                   call error1
  8515 00003F8D 83C402                   add  sp, 2
  8516                                  .expect488:
  8517                                  
  8518                                  ;-825 
  8519                                  
  8520                                  
  8521                                  ;-826 int eprc(char c)  {*cloc=c; cloc++; }
  8522 00003F90 C9                       LEAVE
  8523 00003F91 C3                       ret
  8524 00003F92 5C6E45787065637465-     expect_0 db "\nExpected ASCII(dez): ",0
  8525 00003F9B 642041534349492864-
  8526 00003FA4 657A293A2000       
  8527 00003FAA 206E6F7420666F756E-     expect_1 db " not found",0
  8528 00003FB3 6400               
  8529                                  ENDP
  8530                                  
  8531                                  eprc: PROC
  8532                                  ;Function : eprc, Number of local variables: 1
  8533                                  ;   # type sign width addr used name   list of local variables
  8534                                  ;  200 var sign byte   826 NULL c = bp+4;
  8535 00003FB5 C8000000                 ENTER  0,0
  8536 00003FB9 8A4604                   mov al, [bp+4]
  8537 00003FBC 8B1E[1800]               mov  bx, [cloc]
  8538 00003FC0 8807                     mov  [bx], al
  8539 00003FC2 FF06[1800]               inc  word[cloc]
  8540                                  
  8541                                  ;-827 int eprs(char *s) {char c;  while(*s) { c=*s; eprc(c); s++; } }
  8542 00003FC6 C9                       LEAVE
  8543 00003FC7 C3                       ret
  8544                                  ENDP
  8545                                  
  8546                                  eprs: PROC
  8547                                  ;Function : eprs, Number of local variables: 2
  8548                                  ;   # type sign width addr used name   list of local variables
  8549                                  ;  200 ptr sign byte   827 NULL s = bp+4
  8550                                  ;  201 var sign byte   827 NULL c = bp-2;
  8551 00003FC8 C8020000                 ENTER  2,0
  8552                                  .eprs489:
  8553 00003FCC 8B5E04                   mov bx, [bp+4]
  8554 00003FCF 8A07                     mov al, [bx]
  8555 00003FD1 B400                     mov ah, 0
  8556 00003FD3 08C0                     or  al, al
  8557 00003FD5 0F841B00                 je .eprs490
  8558 00003FD9 8B5E04                   mov bx, [bp+4]
  8559 00003FDC 8A07                     mov al, [bx]
  8560 00003FDE B400                     mov ah, 0
  8561 00003FE0 8846FE                   mov [bp-2], al
  8562 00003FE3 8A46FE                   mov al, byte [bp-2]
  8563 00003FE6 B400                     mov ah, 0
  8564 00003FE8 50                       push ax
  8565 00003FE9 E8C9FF                   call eprc
  8566 00003FEC 83C402                   add  sp, 2
  8567 00003FEF FF4604                   inc  word[bp+4]
  8568 00003FF2 EBD8                     jmp .eprs489
  8569                                  .eprs490:
  8570                                  
  8571                                  ;-828 int prc(unsigned char c) {
  8572 00003FF4 C9                       LEAVE
  8573 00003FF5 C3                       ret
  8574                                  ENDP
  8575                                  
  8576                                  prc: PROC
  8577                                  
  8578                                  ;-829   if (c==10) {_AX=13; writetty(); }
  8579                                  
  8580                                  ;Function : prc, Number of local variables: 1
  8581                                  ;   # type sign width addr used name   list of local variables
  8582                                  ;  200 var unsg byte   828 NULL c = bp+4;
  8583 00003FF6 C8000000                 ENTER  0,0
  8584 00003FFA 8A4604                   mov al, [bp+4]
  8585 00003FFD 3C0A                     cmp al, 10
  8586 00003FFF 0F850600                 jne .prc491
  8587 00004003 B80D00                   mov  ax, 13
  8588 00004006 E86CC0                   call writetty
  8589                                  
  8590                                  ;-830   _AL=c; writetty();
  8591                                  
  8592                                  .prc491:
  8593 00004009 8A4604                   mov  al, [bp+4]
  8594 0000400C E866C0                   call writetty
  8595                                  
  8596                                  ;-831   fputcR(c, fdout);
  8597                                  
  8598 0000400F FF36[1C00]               push word [fdout]
  8599 00004013 8A4604                   mov al, byte [bp+4]
  8600 00004016 B400                     mov ah, 0
  8601 00004018 50                       push ax
  8602 00004019 E80FC1                   call fputcR
  8603 0000401C 83C404                   add  sp, 4
  8604                                  
  8605                                  ;-832   }
  8606                                  
  8607                                  
  8608                                  ;-833 int prscomment(unsigned char *s) {unsigned char c;
  8609 0000401F C9                       LEAVE
  8610 00004020 C3                       ret
  8611                                  ENDP
  8612                                  
  8613                                  prscomment: PROC
  8614                                  
  8615                                  ;-834   while(*s){c=*s;prc(c);s++;} }
  8616                                  
  8617                                  ;Function : prscomment, Number of local variables: 2
  8618                                  ;   # type sign width addr used name   list of local variables
  8619                                  ;  200 ptr unsg byte   833 NULL s = bp+4
  8620                                  ;  201 var unsg byte   833 NULL c = bp-2;
  8621 00004021 C8020000                 ENTER  2,0
  8622                                  .prscomment492:
  8623 00004025 8B5E04                   mov bx, [bp+4]
  8624 00004028 8A07                     mov al, [bx]
  8625 0000402A B400                     mov ah, 0
  8626 0000402C 08C0                     or  al, al
  8627 0000402E 0F841B00                 je .prscomment493
  8628 00004032 8B5E04                   mov bx, [bp+4]
  8629 00004035 8A07                     mov al, [bx]
  8630 00004037 B400                     mov ah, 0
  8631 00004039 8846FE                   mov [bp-2], al
  8632 0000403C 8A46FE                   mov al, byte [bp-2]
  8633 0000403F B400                     mov ah, 0
  8634 00004041 50                       push ax
  8635 00004042 E8B1FF                   call prc
  8636 00004045 83C402                   add  sp, 2
  8637 00004048 FF4604                   inc  word[bp+4]
  8638 0000404B EBD8                     jmp .prscomment492
  8639                                  .prscomment493:
  8640                                  
  8641                                  ;-835 int prnl() { prs("\n ");}
  8642 0000404D C9                       LEAVE
  8643 0000404E C3                       ret
  8644                                  ENDP
  8645                                  
  8646                                  prnl: PROC
  8647 0000404F 68[5940]                 push prnl_0
  8648 00004052 E80800                   call prs
  8649 00004055 83C402                   add  sp, 2
  8650                                  
  8651                                  ;-836 
  8652                                  
  8653                                  
  8654                                  ;-837 int prs(unsigned char *s) {unsigned char c; int com; com=0;
  8655                                  
  8656 00004058 C3                       ret
  8657 00004059 5C6E2000                prnl_0 db "\n ",0
  8658                                  ENDP
  8659                                  
  8660                                  prs: PROC
  8661                                  ;Function : prs, Number of local variables: 3
  8662                                  ;   # type sign width addr used name   list of local variables
  8663                                  ;  200 ptr unsg byte   837 NULL s = bp+4
  8664                                  ;  201 var unsg byte   837 NULL c = bp-2
  8665                                  ;  202 var sign word   837 NULL com = bp-4;
  8666 0000405D C8040000                 ENTER  4,0
  8667 00004061 B80000                   mov ax, 0
  8668 00004064 8946FC                   mov [bp-4], ax
  8669                                  
  8670                                  ;-838   while(*s) { c=*s; if (c==34) if (com) com=0; else com=1;
  8671                                  
  8672                                  .prs494:
  8673 00004067 8B5E04                   mov bx, [bp+4]
  8674 0000406A 8A07                     mov al, [bx]
  8675 0000406C B400                     mov ah, 0
  8676 0000406E 08C0                     or  al, al
  8677 00004070 0F847B00                 je .prs495
  8678 00004074 8B5E04                   mov bx, [bp+4]
  8679 00004077 8A07                     mov al, [bx]
  8680 00004079 B400                     mov ah, 0
  8681 0000407B 8846FE                   mov [bp-2], al
  8682 0000407E 8A46FE                   mov al, [bp-2]
  8683 00004081 3C22                     cmp al, 34
  8684 00004083 0F851800                 jne .prs496
  8685 00004087 8B46FC                   mov ax, [bp-4]
  8686 0000408A 08C0                     or  al, al
  8687 0000408C 0F840900                 je .prs497
  8688 00004090 B80000                   mov ax, 0
  8689 00004093 8946FC                   mov [bp-4], ax
  8690 00004096 E90600                   jmp .prs498
  8691                                  .prs497:
  8692 00004099 B80100                   mov ax, 1
  8693 0000409C 8946FC                   mov [bp-4], ax
  8694                                  
  8695                                  ;-839     if (c==92) { if (com==0) { s++; c=*s;
  8696                                  
  8697                                  .prs498:
  8698                                  .prs496:
  8699 0000409F 8A46FE                   mov al, [bp-2]
  8700 000040A2 3C5C                     cmp al, 92
  8701 000040A4 0F853500                 jne .prs499
  8702 000040A8 8B46FC                   mov ax, [bp-4]
  8703 000040AB 83F800                   cmp ax, 0
  8704 000040AE 0F852B00                 jne .prs500
  8705 000040B2 FF4604                   inc  word[bp+4]
  8706 000040B5 8B5E04                   mov bx, [bp+4]
  8707 000040B8 8A07                     mov al, [bx]
  8708 000040BA B400                     mov ah, 0
  8709 000040BC 8846FE                   mov [bp-2], al
  8710                                  
  8711                                  ;-840           if (c=='n') c=10; if (c=='t') c= 9;
  8712                                  
  8713 000040BF 8A46FE                   mov al, [bp-2]
  8714 000040C2 3C6E                     cmp al, 110
  8715 000040C4 0F850600                 jne .prs501
  8716 000040C8 B80A00                   mov ax, 10
  8717 000040CB 8846FE                   mov [bp-2], al
  8718                                  .prs501:
  8719 000040CE 8A46FE                   mov al, [bp-2]
  8720 000040D1 3C74                     cmp al, 116
  8721 000040D3 0F850600                 jne .prs502
  8722 000040D7 B80900                   mov ax, 9
  8723 000040DA 8846FE                   mov [bp-2], al
  8724                                  
  8725                                  ;-841     } } prc(c); s++;  } }
  8726                                  
  8727                                  .prs502:
  8728                                  .prs500:
  8729                                  .prs499:
  8730 000040DD 8A46FE                   mov al, byte [bp-2]
  8731 000040E0 B400                     mov ah, 0
  8732 000040E2 50                       push ax
  8733 000040E3 E810FF                   call prc
  8734 000040E6 83C402                   add  sp, 2
  8735 000040E9 FF4604                   inc  word[bp+4]
  8736 000040EC E978FF                   jmp .prs494
  8737                                  .prs495:
  8738                                  
  8739                                  ;-842 int eprnum(int n){int e; if(n<0) { eprc('-'); n=mkneg(n); }
  8740 000040EF C9                       LEAVE
  8741 000040F0 C3                       ret
  8742                                  ENDP
  8743                                  
  8744                                  eprnum: PROC
  8745                                  ;Function : eprnum, Number of local variables: 2
  8746                                  ;   # type sign width addr used name   list of local variables
  8747                                  ;  200 var sign word   842 NULL n = bp+4
  8748                                  ;  201 var sign word   842 NULL e = bp-2;
  8749 000040F1 C8020000                 ENTER  2,0
  8750 000040F5 8B4604                   mov ax, [bp+4]
  8751 000040F8 83F800                   cmp ax, 0
  8752 000040FB 0F8D1400                 jge .eprnum503
  8753 000040FF 6A2D                     push 45
  8754 00004101 E8B1FE                   call eprc
  8755 00004104 83C402                   add  sp, 2
  8756 00004107 FF7604                   push word [bp+4]
  8757 0000410A E8B7BF                   call mkneg
  8758 0000410D 83C402                   add  sp, 2
  8759 00004110 894604                   mov [bp+4], ax
  8760                                  
  8761                                  ;-843   if (n >= 10) {e=n/10; eprnum(e);}  n=n%10; n=n+'0'; eprc(n); }
  8762                                  
  8763                                  .eprnum503:
  8764 00004113 8B4604                   mov ax, [bp+4]
  8765 00004116 83F80A                   cmp ax, 10 ;unsigned : 1
  8766 00004119 0F8C1500                 jl  .eprnum504
  8767 0000411D 8B4604                   mov ax, [bp+4]
  8768 00004120 BB0A00                   mov bx, 10
  8769 00004123 99                       cwd
  8770 00004124 F7FB                     idiv bx
  8771 00004126 8946FE                   mov [bp-2], ax
  8772 00004129 FF76FE                   push word [bp-2]
  8773 0000412C E8C2FF                   call eprnum
  8774 0000412F 83C402                   add  sp, 2
  8775                                  .eprnum504:
  8776 00004132 8B4604                   mov ax, [bp+4]
  8777 00004135 BB0A00                   mov bx, 10
  8778 00004138 99                       cwd
  8779 00004139 F7FB                     idiv bx
  8780 0000413B 89D0                     mov ax, dx
  8781 0000413D 894604                   mov [bp+4], ax
  8782 00004140 8B4604                   mov ax, [bp+4]
  8783 00004143 83C030                   add ax, 48
  8784 00004146 894604                   mov [bp+4], ax
  8785 00004149 FF7604                   push word [bp+4]
  8786 0000414C E866FE                   call eprc
  8787 0000414F 83C402                   add  sp, 2
  8788                                  
  8789                                  ;-844 int pint1 (int n){int e; if(n<0) {  prc('-');  n=mkneg(n); }
  8790 00004152 C9                       LEAVE
  8791 00004153 C3                       ret
  8792                                  ENDP
  8793                                  
  8794                                  pint1: PROC
  8795                                  ;Function : pint1, Number of local variables: 2
  8796                                  ;   # type sign width addr used name   list of local variables
  8797                                  ;  200 var sign word   844 NULL n = bp+4
  8798                                  ;  201 var sign word   844 NULL e = bp-2;
  8799 00004154 C8020000                 ENTER  2,0
  8800 00004158 8B4604                   mov ax, [bp+4]
  8801 0000415B 83F800                   cmp ax, 0
  8802 0000415E 0F8D1400                 jge .pint1505
  8803 00004162 6A2D                     push 45
  8804 00004164 E88FFE                   call prc
  8805 00004167 83C402                   add  sp, 2
  8806 0000416A FF7604                   push word [bp+4]
  8807 0000416D E854BF                   call mkneg
  8808 00004170 83C402                   add  sp, 2
  8809 00004173 894604                   mov [bp+4], ax
  8810                                  
  8811                                  ;-845   if (n >= 10) {e=n/10;  pint1(e);}  n=n%10; n += '0'; prc(n); }
  8812                                  
  8813                                  .pint1505:
  8814 00004176 8B4604                   mov ax, [bp+4]
  8815 00004179 83F80A                   cmp ax, 10 ;unsigned : 1
  8816 0000417C 0F8C1500                 jl  .pint1506
  8817 00004180 8B4604                   mov ax, [bp+4]
  8818 00004183 BB0A00                   mov bx, 10
  8819 00004186 99                       cwd
  8820 00004187 F7FB                     idiv bx
  8821 00004189 8946FE                   mov [bp-2], ax
  8822 0000418C FF76FE                   push word [bp-2]
  8823 0000418F E8C2FF                   call pint1
  8824 00004192 83C402                   add  sp, 2
  8825                                  .pint1506:
  8826 00004195 8B4604                   mov ax, [bp+4]
  8827 00004198 BB0A00                   mov bx, 10
  8828 0000419B 99                       cwd
  8829 0000419C F7FB                     idiv bx
  8830 0000419E 89D0                     mov ax, dx
  8831 000041A0 894604                   mov [bp+4], ax
  8832 000041A3 83460430                 add  word[bp+4], 48
  8833 000041A7 FF7604                   push word [bp+4]
  8834 000041AA E849FE                   call prc
  8835 000041AD 83C402                   add  sp, 2
  8836                                  
  8837                                  ;-846 int prunsign1(unsigned int n) { unsigned int e;
  8838 000041B0 C9                       LEAVE
  8839 000041B1 C3                       ret
  8840                                  ENDP
  8841                                  
  8842                                  prunsign1: PROC
  8843                                  
  8844                                  ;-847   if ( _ n >= 10) {  e=n/10; prunsign1(e); }
  8845                                  
  8846                                  ;Function : prunsign1, Number of local variables: 2
  8847                                  ;   # type sign width addr used name   list of local variables
  8848                                  ;  200 var unsg word   846 NULL n = bp+4
  8849                                  ;  201 var unsg word   846 NULL e = bp-2;
  8850 000041B2 C8020000                 ENTER  2,0 ; constant expression
  8851 000041B6 837E040A                cmp word[bp+4], 10 ;unsigned : 0
  8852 000041BA 0F821700                 jb  .prunsign1507
  8853 000041BE 8B4604                   mov ax, [bp+4]
  8854 000041C1 BB0A00                   mov bx, 10
  8855 000041C4 BA0000                   mov dx, 0
  8856 000041C7 F7F3                     div bx
  8857 000041C9 8946FE                   mov [bp-2], ax
  8858 000041CC FF76FE                   push word [bp-2]
  8859 000041CF E8E0FF                   call prunsign1
  8860 000041D2 83C402                   add  sp, 2
  8861                                  
  8862                                  ;-848     n = n % 10; /*unsigned mod*/   n += '0'; prc(n); }
  8863                                  
  8864                                  .prunsign1507:
  8865 000041D5 8B4604                   mov ax, [bp+4]
  8866 000041D8 BB0A00                   mov bx, 10
  8867 000041DB BA0000                   mov dx, 0
  8868 000041DE F7F3                     div bx
  8869 000041E0 89D0                     mov ax, dx
  8870 000041E2 894604                   mov [bp+4], ax
  8871 000041E5 83460430                 add  word[bp+4], 48
  8872 000041E9 FF7604                   push word [bp+4]
  8873 000041EC E807FE                   call prc
  8874 000041EF 83C402                   add  sp, 2
  8875                                  
  8876                                  ;-849 int printint51(unsigned int j)  {
  8877 000041F2 C9                       LEAVE
  8878 000041F3 C3                       ret
  8879                                  ENDP
  8880                                  
  8881                                  printint51: PROC
  8882                                  
  8883                                  ;-850   if (j<10000) prc(32); if (j<1000) prc(32);  if (j<100) prc(32);
  8884                                  
  8885                                  ;Function : printint51, Number of local variables: 1
  8886                                  ;   # type sign width addr used name   list of local variables
  8887                                  ;  200 var unsg word   849 NULL j = bp+4;
  8888 000041F4 C8000000                 ENTER  0,0
  8889 000041F8 8B4604                   mov ax, [bp+4]
  8890 000041FB 3D1027                   cmp ax, 10000
  8891 000041FE 0F8D0800                 jge .printint51508
  8892 00004202 6A20                     push 32
  8893 00004204 E8EFFD                   call prc
  8894 00004207 83C402                   add  sp, 2
  8895                                  .printint51508:
  8896 0000420A 8B4604                   mov ax, [bp+4]
  8897 0000420D 3DE803                   cmp ax, 1000
  8898 00004210 0F8D0800                 jge .printint51509
  8899 00004214 6A20                     push 32
  8900 00004216 E8DDFD                   call prc
  8901 00004219 83C402                   add  sp, 2
  8902                                  .printint51509:
  8903 0000421C 8B4604                   mov ax, [bp+4]
  8904 0000421F 83F864                   cmp ax, 100
  8905 00004222 0F8D0800                 jge .printint51510
  8906 00004226 6A20                     push 32
  8907 00004228 E8CBFD                   call prc
  8908 0000422B 83C402                   add  sp, 2
  8909                                  
  8910                                  ;-851    if (j<10) prc(32);  prunsign1(j); }
  8911                                  
  8912                                  .printint51510:
  8913 0000422E 8B4604                   mov ax, [bp+4]
  8914 00004231 83F80A                   cmp ax, 10
  8915 00004234 0F8D0800                 jge .printint51511
  8916 00004238 6A20                     push 32
  8917 0000423A E8B9FD                   call prc
  8918 0000423D 83C402                   add  sp, 2
  8919                                  .printint51511:
  8920 00004240 FF7604                   push word [bp+4]
  8921 00004243 E86CFF                   call prunsign1
  8922 00004246 83C402                   add  sp, 2
  8923                                  
  8924                                  ;-852 
  8925                                  
  8926                                  
  8927                                  ;-853 int fgets1() { char c; c=*fgetsp;
  8928 00004249 C9                       LEAVE
  8929 0000424A C3                       ret
  8930                                  ENDP
  8931                                  
  8932                                  fgets1: PROC
  8933                                  ;Function : fgets1, Number of local variables: 1
  8934                                  ;   # type sign width addr used name   list of local variables
  8935                                  ;  200 var sign byte   853 NULL c = bp-2;
  8936 0000424B C8020000                 ENTER  2,0
  8937 0000424F 8B1E[6400]               mov bx, [fgetsp]
  8938 00004253 8A07                     mov al, [bx]
  8939 00004255 B400                     mov ah, 0
  8940 00004257 8846FE                   mov [bp-2], al
  8941                                  
  8942                                  ;-854   if (c==0) { printinputline(); if (DOS_NoBytes == 0) return 0;
  8943                                  
  8944 0000425A 8A46FE                   mov al, [bp-2]
  8945 0000425D 3C00                     cmp al, 0
  8946 0000425F 0F852A00                 jne .fgets1512
  8947 00004263 E83700                   call printinputline
  8948 00004266 A1[7200]                 mov ax, [DOS_NoBytes]
  8949 00004269 83F800                   cmp ax, 0
  8950 0000426C 0F850600                 jne .fgets1513
  8951 00004270 B80000                   mov ax, 0
  8952 00004273 E92500                   jmp .retnfgets1
  8953                                  
  8954                                  ;-855     fgetsp=&fgetsdest; c=*fgetsp; column=0; }
  8955                                  
  8956                                  .fgets1513:
  8957 00004276 B887BC                   mov ax, fgetsdest
  8958 00004279 A3[6400]                 mov word [fgetsp], ax
  8959 0000427C 8B1E[6400]               mov bx, [fgetsp]
  8960 00004280 8A07                     mov al, [bx]
  8961 00004282 B400                     mov ah, 0
  8962 00004284 8846FE                   mov [bp-2], al
  8963 00004287 B80000                   mov ax, 0
  8964 0000428A A3[2100]                 mov word [column], ax
  8965                                  
  8966                                  ;-856   fgetsp++; column++;  return c; }
  8967                                  
  8968                                  .fgets1512:
  8969 0000428D FF06[6400]               inc  word[fgetsp]
  8970 00004291 FF06[2100]               inc  word[column]
  8971 00004295 8A46FE                   mov al, [bp-2]
  8972 00004298 E90000                   jmp .retnfgets1
  8973                                  
  8974                                  ;-857 int printinputline() {
  8975                                  
  8976 0000429B C9                       .retnfgets1: LEAVE
  8977 0000429C C3                       ret
  8978                                  ENDP
  8979                                  
  8980                                  printinputline: PROC
  8981                                  
  8982                                  ;-858     int col; 
  8983                                  
  8984                                  
  8985                                  ;-859     col=0;
  8986                                  
  8987                                  ;Function : printinputline, Number of local variables: 1
  8988                                  ;   # type sign width addr used name   list of local variables
  8989                                  ;  200 var sign word   858 NULL col = bp-2;
  8990 0000429D C8020000                 ENTER  2,0
  8991 000042A1 B80000                   mov ax, 0
  8992 000042A4 8946FE                   mov [bp-2], ax
  8993                                  
  8994                                  ;-860     fgetsp=&fgetsdest;
  8995                                  
  8996 000042A7 B887BC                   mov ax, fgetsdest
  8997 000042AA A3[6400]                 mov word [fgetsp], ax
  8998                                  
  8999                                  ;-861     do {
  9000                                  
  9001                                  .printinputline514:
  9002                                  
  9003                                  ;-862         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);
  9004                                  
  9005 000042AD 6A01                     push 1
  9006 000042AF FF36[1A00]               push word [fdin]
  9007 000042B3 8D06[7400]               lea  ax, [DOS_ByteRead]
  9008 000042B7 50                       push ax
  9009 000042B8 E85BBE                   call readRL
  9010 000042BB 83C406                   add  sp, 6
  9011 000042BE A3[7200]                 mov word [DOS_NoBytes], ax
  9012                                  
  9013                                  ;-863         if (DOS_NoBytes == 0) return;
  9014                                  
  9015 000042C1 A1[7200]                 mov ax, [DOS_NoBytes]
  9016 000042C4 83F800                   cmp ax, 0
  9017 000042C7 0F850300                 jne .printinputline515
  9018 000042CB E96A00                   jmp .retnprintinputline
  9019                                  
  9020                                  ;-864         *fgetsp=DOS_ByteRead; 
  9021                                  
  9022                                  .printinputline515:
  9023 000042CE A0[7400]                 mov al, [DOS_ByteRead]
  9024 000042D1 8B1E[6400]               mov  bx, [fgetsp]
  9025 000042D5 8807                     mov  [bx], al
  9026                                  
  9027                                  ;-865         fgetsp++; 
  9028                                  
  9029 000042D7 FF06[6400]               inc  word[fgetsp]
  9030                                  
  9031                                  ;-866         col++;
  9032                                  
  9033 000042DB FF46FE                   inc  word[bp-2]
  9034                                  
  9035                                  ;-867         if (col >80) error1("input line longer than 80 char");
  9036                                  
  9037 000042DE 8B46FE                   mov ax, [bp-2]
  9038 000042E1 83F850                   cmp ax, 80
  9039 000042E4 0F8E0900                 jle .printinputline516
  9040 000042E8 68[3A43]                 push printinputline_0
  9041 000042EB E8CE00                   call error1
  9042 000042EE 83C402                   add  sp, 2
  9043                                  
  9044                                  ;-868         }
  9045                                  
  9046                                  .printinputline516:
  9047                                  
  9048                                  ;-869         while (DOS_ByteRead != 10); 
  9049                                  
  9050 000042F1 A0[7400]                 mov al, [DOS_ByteRead]
  9051 000042F4 3C0A                     cmp al, 10
  9052 000042F6 0F840200                 je  .printinputline517
  9053 000042FA EBB1                     jmp .printinputline514
  9054                                  .printinputline517:
  9055                                  
  9056                                  ;-870     *fgetsp=0;
  9057                                  
  9058 000042FC B80000                   mov ax, 0
  9059 000042FF 8B1E[6400]               mov  bx, [fgetsp]
  9060 00004303 8807                     mov  [bx], al
  9061                                  
  9062                                  ;-871     if (fdout) { 
  9063                                  
  9064 00004305 A1[1C00]                 mov ax, [fdout]
  9065 00004308 08C0                     or  al, al
  9066 0000430A 0F842A00                 je .printinputline518
  9067                                  
  9068                                  ;-872         prs("\n\n;-"); 
  9069                                  
  9070 0000430E 68[5943]                 push printinputline_1
  9071 00004311 E849FD                   call prs
  9072 00004314 83C402                   add  sp, 2
  9073                                  
  9074                                  ;-873         prunsign1(lineno); 
  9075                                  
  9076 00004317 FF36[6800]               push word [lineno]
  9077 0000431B E894FE                   call prunsign1
  9078 0000431E 83C402                   add  sp, 2
  9079                                  
  9080                                  ;-874         prc(' '); 
  9081                                  
  9082 00004321 6A20                     push 32
  9083 00004323 E8D0FC                   call prc
  9084 00004326 83C402                   add  sp, 2
  9085                                  
  9086                                  ;-875         lineno++;
  9087                                  
  9088 00004329 FF06[6800]               inc  word[lineno]
  9089                                  
  9090                                  ;-876         prscomment(&fgetsdest);
  9091                                  
  9092 0000432D 8D0687BC                 lea  ax, [fgetsdest]
  9093 00004331 50                       push ax
  9094 00004332 E8ECFC                   call prscomment
  9095 00004335 83C402                   add  sp, 2
  9096                                  
  9097                                  ;-877         }
  9098                                  
  9099                                  
  9100                                  ;-878 }
  9101                                  
  9102                                  .printinputline518:
  9103                                  
  9104                                  ;-879 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR
  9105                                  
  9106 00004338 C9                       .retnprintinputline: LEAVE
  9107 00004339 C3                       ret
  9108 0000433A 696E707574206C696E-     printinputline_0 db "input line longer than 80 char",0
  9109 00004343 65206C6F6E67657220-
  9110 0000434C 7468616E2038302063-
  9111 00004355 68617200           
  9112 00004359 5C6E5C6E3B2D00          printinputline_1 db "\n\n;-",0
  9113                                  ENDP
  9114                                  
  9115                                  ifEOL: PROC
  9116                                  
  9117                                  ;-880     if (c == 10) return 1;//LF
  9118                                  
  9119                                  ;Function : ifEOL, Number of local variables: 1
  9120                                  ;   # type sign width addr used name   list of local variables
  9121                                  ;  200 var sign byte   879 NULL c = bp+4;
  9122 00004360 C8000000                 ENTER  0,0
  9123 00004364 8A4604                   mov al, [bp+4]
  9124 00004367 3C0A                     cmp al, 10
  9125 00004369 0F850600                 jne .ifEOL519
  9126 0000436D B80100                   mov ax, 1
  9127 00004370 E92400                   jmp .retnifEOL
  9128                                  
  9129                                  ;-881     if (c == 13) {//CR
  9130                                  
  9131                                  .ifEOL519:
  9132 00004373 8A4604                   mov al, [bp+4]
  9133 00004376 3C0D                     cmp al, 13
  9134 00004378 0F851500                 jne .ifEOL520
  9135                                  
  9136                                  ;-882         if (thechar == 10) c=next();
  9137                                  
  9138 0000437C A0[2300]                 mov al, [thechar]
  9139 0000437F 3C0A                     cmp al, 10
  9140 00004381 0F850600                 jne .ifEOL521
  9141 00004385 E882FB                   call next
  9142 00004388 884604                   mov [bp+4], al
  9143                                  
  9144                                  ;-883         return 1;
  9145                                  
  9146                                  .ifEOL521:
  9147 0000438B B80100                   mov ax, 1
  9148 0000438E E90600                   jmp .retnifEOL
  9149                                  
  9150                                  ;-884     }
  9151                                  
  9152                                  
  9153                                  ;-885     return 0;
  9154                                  
  9155                                  .ifEOL520:
  9156 00004391 B80000                   mov ax, 0
  9157 00004394 E90000                   jmp .retnifEOL
  9158                                  
  9159                                  ;-886 }
  9160                                  
  9161                                  
  9162                                  ;-887 
  9163                                  
  9164                                  
  9165                                  ;-888 
  9166                                  
  9167                                  
  9168                                  ;-889 
  9169                                  
  9170                                  
  9171                                  ;-890 int end1(int n) {
  9172                                  
  9173 00004397 C9                       .retnifEOL: LEAVE
  9174 00004398 C3                       ret
  9175                                  ENDP
  9176                                  
  9177                                  end1: PROC
  9178                                  
  9179                                  ;-891     fcloseR(fdin); 
  9180                                  
  9181                                  ;Function : end1, Number of local variables: 1
  9182                                  ;   # type sign width addr used name   list of local variables
  9183                                  ;  200 var sign word   890 NULL n = bp+4;
  9184 00004399 C8000000                 ENTER  0,0
  9185 0000439D FF36[1A00]               push word [fdin]
  9186 000043A1 E855BD                   call fcloseR
  9187 000043A4 83C402                   add  sp, 2
  9188                                  
  9189                                  ;-892     fcloseR(fdout); 
  9190                                  
  9191 000043A7 FF36[1C00]               push word [fdout]
  9192 000043AB E84BBD                   call fcloseR
  9193 000043AE 83C402                   add  sp, 2
  9194                                  
  9195                                  ;-893     exitR(n); 
  9196                                  
  9197 000043B1 FF7604                   push word [bp+4]
  9198 000043B4 E851BD                   call exitR
  9199 000043B7 83C402                   add  sp, 2
  9200                                  
  9201                                  ;-894 }
  9202                                  
  9203                                  
  9204                                  ;-895 int error1(char *s) {
  9205 000043BA C9                       LEAVE
  9206 000043BB C3                       ret
  9207                                  ENDP
  9208                                  
  9209                                  error1: PROC
  9210                                  
  9211                                  ;-896     lineno--;
  9212                                  
  9213                                  ;Function : error1, Number of local variables: 1
  9214                                  ;   # type sign width addr used name   list of local variables
  9215                                  ;  200 ptr sign byte   895 NULL s = bp+4;
  9216 000043BC C8000000                 ENTER  0,0
  9217 000043C0 FF0E[6800]               dec  word[lineno]
  9218                                  
  9219                                  ;-897     prnl(); 
  9220                                  
  9221 000043C4 E888FC                   call prnl
  9222                                  
  9223                                  ;-898     prscomment(&fgetsdest);
  9224                                  
  9225 000043C7 8D0687BC                 lea  ax, [fgetsdest]
  9226 000043CB 50                       push ax
  9227 000043CC E852FC                   call prscomment
  9228 000043CF 83C402                   add  sp, 2
  9229                                  
  9230                                  ;-899     prs(";Line: "); 
  9231                                  
  9232 000043D2 68[3B44]                 push error1_0
  9233 000043D5 E885FC                   call prs
  9234 000043D8 83C402                   add  sp, 2
  9235                                  
  9236                                  ;-900     prunsign1(lineno);
  9237                                  
  9238 000043DB FF36[6800]               push word [lineno]
  9239 000043DF E8D0FD                   call prunsign1
  9240 000043E2 83C402                   add  sp, 2
  9241                                  
  9242                                  ;-901     prs(" ************** ERROR: "); 
  9243                                  
  9244 000043E5 68[4344]                 push error1_1
  9245 000043E8 E872FC                   call prs
  9246 000043EB 83C402                   add  sp, 2
  9247                                  
  9248                                  ;-902     prs(s);
  9249                                  
  9250 000043EE FF7604                   push word [bp+4]
  9251 000043F1 E869FC                   call prs
  9252 000043F4 83C402                   add  sp, 2
  9253                                  
  9254                                  ;-903     prs("  in column: "); 
  9255                                  
  9256 000043F7 68[5B44]                 push error1_2
  9257 000043FA E860FC                   call prs
  9258 000043FD 83C402                   add  sp, 2
  9259                                  
  9260                                  ;-904     prunsign1(column);
  9261                                  
  9262 00004400 FF36[2100]               push word [column]
  9263 00004404 E8ABFD                   call prunsign1
  9264 00004407 83C402                   add  sp, 2
  9265                                  
  9266                                  ;-905     prs("\nToken: "); 
  9267                                  
  9268 0000440A 68[6944]                 push error1_3
  9269 0000440D E84DFC                   call prs
  9270 00004410 83C402                   add  sp, 2
  9271                                  
  9272                                  ;-906     prunsign1(token); 
  9273                                  
  9274 00004413 FF36[1E00]               push word [token]
  9275 00004417 E898FD                   call prunsign1
  9276 0000441A 83C402                   add  sp, 2
  9277                                  
  9278                                  ;-907 //    prs(", globC: "); 
  9279                                  
  9280                                  
  9281                                  ;-908 //    prc(globC);
  9282                                  
  9283                                  
  9284                                  ;-909 //    prs(", thechar: "); 
  9285                                  
  9286                                  
  9287                                  ;-910 //    prunsign1(thechar); 
  9288                                  
  9289                                  
  9290                                  ;-911     prs(", symbol: "); 
  9291                                  
  9292 0000441D 68[7344]                 push error1_4
  9293 00004420 E83AFC                   call prs
  9294 00004423 83C402                   add  sp, 2
  9295                                  
  9296                                  ;-912     prs(symbol);
  9297                                  
  9298 00004426 8D06A36D                 lea  ax, [symbol]
  9299 0000442A 50                       push ax
  9300 0000442B E82FFC                   call prs
  9301 0000442E 83C402                   add  sp, 2
  9302                                  
  9303                                  ;-913     end1(1); 
  9304                                  
  9305 00004431 6A01                     push 1
  9306 00004433 E863FF                   call end1
  9307 00004436 83C402                   add  sp, 2
  9308                                  
  9309                                  ;-914 }
  9310                                  
  9311                                  
  9312                                  ;-915 int listproc() {
  9313 00004439 C9                       LEAVE
  9314 0000443A C3                       ret
  9315 0000443B 3B4C696E653A2000        error1_0 db ";Line: ",0
  9316 00004443 202A2A2A2A2A2A2A2A-     error1_1 db " ************** ERROR: ",0
  9317 0000444C 2A2A2A2A2A2A204552-
  9318 00004455 524F523A2000       
  9319 0000445B 2020696E20636F6C75-     error1_2 db "  in column: ",0
  9320 00004464 6D6E3A2000         
  9321 00004469 5C6E546F6B656E3A20-     error1_3 db "\nToken: ",0
  9322 00004472 00                 
  9323 00004473 2C2073796D626F6C3A-     error1_4 db ", symbol: ",0
  9324 0000447C 2000               
  9325                                  ENDP
  9326                                  
  9327                                  listproc: PROC
  9328                                  
  9329                                  ;-916     int i;
  9330                                  
  9331                                  
  9332                                  ;-917     if (LTop > LSTART) {
  9333                                  
  9334                                  ;Function : listproc, Number of local variables: 1
  9335                                  ;   # type sign width addr used name   list of local variables
  9336                                  ;  200 var sign word   916 NULL i = bp-2;
  9337 0000447E C8020000                 ENTER  2,0
  9338 00004482 A1[2E00]                 mov ax, [LTop]
  9339 00004485 3DC800                   cmp ax, 200
  9340 00004488 0F8E6000                 jle .listproc522
  9341                                  
  9342                                  ;-918         prs("\n;Function : "); prs(fname);
  9343                                  
  9344 0000448C 68[EE44]                 push listproc_0
  9345 0000448F E8CBFB                   call prs
  9346 00004492 83C402                   add  sp, 2
  9347 00004495 8D06236E                 lea  ax, [fname]
  9348 00004499 50                       push ax
  9349 0000449A E8C0FB                   call prs
  9350 0000449D 83C402                   add  sp, 2
  9351                                  
  9352                                  ;-919         prs(", Number of local variables: "); 
  9353                                  
  9354 000044A0 68[FD44]                 push listproc_1
  9355 000044A3 E8B7FB                   call prs
  9356 000044A6 83C402                   add  sp, 2
  9357                                  
  9358                                  ;-920         i=LTop - LSTART; 
  9359                                  
  9360 000044A9 A1[2E00]                 mov ax, [LTop]
  9361 000044AC 2DC800                   sub ax, 200
  9362 000044AF 8946FE                   mov [bp-2], ax
  9363                                  
  9364                                  ;-921         prunsign1(i);
  9365                                  
  9366 000044B2 FF76FE                   push word [bp-2]
  9367 000044B5 E8FAFC                   call prunsign1
  9368 000044B8 83C402                   add  sp, 2
  9369                                  
  9370                                  ;-922         prs("\n;   # type sign width addr used name");
  9371                                  
  9372 000044BB 68[1B45]                 push listproc_2
  9373 000044BE E89CFB                   call prs
  9374 000044C1 83C402                   add  sp, 2
  9375                                  
  9376                                  ;-923         prs("   list of local variables");
  9377                                  
  9378 000044C4 68[4245]                 push listproc_3
  9379 000044C7 E893FB                   call prs
  9380 000044CA 83C402                   add  sp, 2
  9381                                  
  9382                                  ;-924         i=LSTART;
  9383                                  
  9384 000044CD B8C800                   mov ax, 200
  9385 000044D0 8946FE                   mov [bp-2], ax
  9386                                  
  9387                                  ;-925         while (i < LTop) { 
  9388                                  
  9389                                  .listproc523:
  9390 000044D3 8B46FE                   mov ax, [bp-2]
  9391 000044D6 3B06[2E00]               cmp ax, [LTop]
  9392 000044DA 0F8D0E00                 jge .listproc524
  9393                                  
  9394                                  ;-926             listvar(i); 
  9395                                  
  9396 000044DE FF76FE                   push word [bp-2]
  9397 000044E1 E84703                   call listvar
  9398 000044E4 83C402                   add  sp, 2
  9399                                  
  9400                                  ;-927             i++; 
  9401                                  
  9402 000044E7 FF46FE                   inc  word[bp-2]
  9403                                  
  9404                                  ;-928             } 
  9405                                  
  9406                                  
  9407                                  ;-929         }
  9408                                  
  9409 000044EA EBE7                     jmp .listproc523
  9410                                  .listproc524:
  9411                                  
  9412                                  ;-930 }
  9413                                  
  9414                                  .listproc522:
  9415                                  
  9416                                  ;-931 int listcall() { 
  9417 000044EC C9                       LEAVE
  9418 000044ED C3                       ret
  9419 000044EE 5C6E3B46756E637469-     listproc_0 db "\n;Function : ",0
  9420 000044F7 6F6E203A2000       
  9421 000044FD 2C204E756D62657220-     listproc_1 db ", Number of local variables: ",0
  9422 00004506 6F66206C6F63616C20-
  9423 0000450F 7661726961626C6573-
  9424 00004518 3A2000             
  9425 0000451B 5C6E3B202020232074-     listproc_2 db "\n;   # type sign width addr used name",0
  9426 00004524 797065207369676E20-
  9427 0000452D 776964746820616464-
  9428 00004536 722075736564206E61-
  9429 0000453F 6D6500             
  9430 00004542 2020206C697374206F-     listproc_3 db "   list of local variables",0
  9431 0000454B 66206C6F63616C2076-
  9432 00004554 61726961626C657300 
  9433                                  ENDP
  9434                                  
  9435                                  listcall: PROC
  9436                                  
  9437                                  ;-932     int i;
  9438                                  
  9439                                  
  9440                                  ;-933     prs("\n\n;    #  addr name   list of CALLs\n");
  9441                                  
  9442                                  ;Function : listcall, Number of local variables: 1
  9443                                  ;   # type sign width addr used name   list of local variables
  9444                                  ;  200 var sign word   932 NULL i = bp-2;
  9445 0000455D C8020000                 ENTER  2,0
  9446 00004561 68[8B45]                 push listcall_0
  9447 00004564 E8F6FA                   call prs
  9448 00004567 83C402                   add  sp, 2
  9449                                  
  9450                                  ;-934     i=0;  
  9451                                  
  9452 0000456A B80000                   mov ax, 0
  9453 0000456D 8946FE                   mov [bp-2], ax
  9454                                  
  9455                                  ;-935     while (i< CTop) { 
  9456                                  
  9457                                  .listcall525:
  9458 00004570 8B46FE                   mov ax, [bp-2]
  9459 00004573 3B06[3F00]               cmp ax, [CTop]
  9460 00004577 0F8D0E00                 jge .listcall526
  9461                                  
  9462                                  ;-936         calllisting(i); 
  9463                                  
  9464 0000457B FF76FE                   push word [bp-2]
  9465 0000457E E83200                   call calllisting
  9466 00004581 83C402                   add  sp, 2
  9467                                  
  9468                                  ;-937         i++; 
  9469                                  
  9470 00004584 FF46FE                   inc  word[bp-2]
  9471                                  
  9472                                  ;-938         } 
  9473                                  
  9474                                  
  9475                                  ;-939 }
  9476                                  
  9477 00004587 EBE7                     jmp .listcall525
  9478                                  .listcall526:
  9479                                  
  9480                                  ;-940 int calllisting(int i) {
  9481 00004589 C9                       LEAVE
  9482 0000458A C3                       ret
  9483 0000458B 5C6E5C6E3B20202020-     listcall_0 db "\n\n;    #  addr name   list of CALLs\n",0
  9484 00004594 23202061646472206E-
  9485 0000459D 616D652020206C6973-
  9486 000045A6 74206F662043414C4C-
  9487 000045AF 735C6E00           
  9488                                  ENDP
  9489                                  
  9490                                  calllisting: PROC
  9491                                  
  9492                                  ;-941     char c; int j;
  9493                                  
  9494                                  
  9495                                  ;-942     prs("\n;"); 
  9496                                  
  9497                                  ;Function : calllisting, Number of local variables: 3
  9498                                  ;   # type sign width addr used name   list of local variables
  9499                                  ;  200 var sign word   940 NULL i = bp+4
  9500                                  ;  201 var sign byte   941 NULL c = bp-2
  9501                                  ;  202 var sign word   941 NULL j = bp-4;
  9502 000045B3 C8040000                 ENTER  4,0
  9503 000045B7 68[2546]                 push calllisting_0
  9504 000045BA E8A0FA                   call prs
  9505 000045BD 83C402                   add  sp, 2
  9506                                  
  9507                                  ;-943     printint51(i); 
  9508                                  
  9509 000045C0 FF7604                   push word [bp+4]
  9510 000045C3 E82EFC                   call printint51
  9511 000045C6 83C402                   add  sp, 2
  9512                                  
  9513                                  ;-944     prc(32);
  9514                                  
  9515 000045C9 6A20                     push 32
  9516 000045CB E828FA                   call prc
  9517 000045CE 83C402                   add  sp, 2
  9518                                  
  9519                                  ;-945     c=CType [i]; 
  9520                                  
  9521 000045D1 8B5E04                   mov bx, [bp+4]
  9522 000045D4 8A87A78D                 mov al, [CType + bx]
  9523 000045D8 8846FE                   mov [bp-2], al
  9524                                  
  9525                                  ;-946     if(c==0)prs("unresolved ");
  9526                                  
  9527 000045DB 8A46FE                   mov al, [bp-2]
  9528 000045DE 3C00                     cmp al, 0
  9529 000045E0 0F850900                 jne .calllisting527
  9530 000045E4 68[2946]                 push calllisting_1
  9531 000045E7 E873FA                   call prs
  9532 000045EA 83C402                   add  sp, 2
  9533                                  
  9534                                  ;-947     j=CAdr[i];            
  9535                                  
  9536                                  .calllisting527:
  9537 000045ED 8B5E04                   mov bx, [bp+4]
  9538 000045F0 D1E3                     shl bx, 1
  9539 000045F2 8B87CF97                 mov ax, [CAdr + bx]
  9540 000045F6 8946FC                   mov [bp-4], ax
  9541                                  
  9542                                  ;-948     printint51(j); 
  9543                                  
  9544 000045F9 FF76FC                   push word [bp-4]
  9545 000045FC E8F5FB                   call printint51
  9546 000045FF 83C402                   add  sp, 2
  9547                                  
  9548                                  ;-949     prc(32);
  9549                                  
  9550 00004602 6A20                     push 32
  9551 00004604 E8EFF9                   call prc
  9552 00004607 83C402                   add  sp, 2
  9553                                  
  9554                                  ;-950     from_far(NameA, j);   
  9555                                  
  9556 0000460A FF76FC                   push word [bp-4]
  9557 0000460D 8D06[4100]               lea  ax, [NameA]
  9558 00004611 50                       push ax
  9559 00004612 E8F00B                   call from_far
  9560 00004615 83C404                   add  sp, 4
  9561                                  
  9562                                  ;-951     prs(NameA);
  9563                                  
  9564 00004618 8D06[4100]               lea  ax, [NameA]
  9565 0000461C 50                       push ax
  9566 0000461D E83DFA                   call prs
  9567 00004620 83C402                   add  sp, 2
  9568                                  
  9569                                  ;-952 }
  9570                                  
  9571                                  
  9572                                  ;-953 int countcalls(int f) { 
  9573 00004623 C9                       LEAVE
  9574 00004624 C3                       ret
  9575 00004625 5C6E3B00                calllisting_0 db "\n;",0
  9576 00004629 756E7265736F6C7665-     calllisting_1 db "unresolved ",0
  9577 00004632 642000             
  9578                                  ENDP
  9579                                  
  9580                                  countcalls: PROC
  9581                                  
  9582                                  ;-954     unsigned int i;
  9583                                  
  9584                                  
  9585                                  ;-955     pt=adrF(FNameField, f);
  9586                                  
  9587                                  ;Function : countcalls, Number of local variables: 2
  9588                                  ;   # type sign width addr used name   list of local variables
  9589                                  ;  200 var sign word   953 NULL f = bp+4
  9590                                  ;  201 var unsg word   954 NULL i = bp-2;
  9591 00004635 C8020000                 ENTER  2,0
  9592 00004639 FF7604                   push word [bp+4]
  9593 0000463C 8D06C7A9                 lea  ax, [FNameField]
  9594 00004640 50                       push ax
  9595 00004641 E8A6C2                   call adrF
  9596 00004644 83C404                   add  sp, 4
  9597 00004647 A3[6C00]                 mov word [pt], ax
  9598                                  
  9599                                  ;-956     i=0;  
  9600                                  
  9601 0000464A B80000                   mov ax, 0
  9602 0000464D 8946FE                   mov [bp-2], ax
  9603                                  
  9604                                  ;-957     while (i < CTop) {
  9605                                  
  9606                                  .countcalls528:
  9607 00004650 8B46FE                   mov ax, [bp-2]
  9608 00004653 3B06[3F00]               cmp ax, [CTop]
  9609 00004657 0F8D4A00                 jge .countcalls529
  9610                                  
  9611                                  ;-958         p1=CAdr[i];
  9612                                  
  9613 0000465B 8B5EFE                   mov bx, [bp-2]
  9614 0000465E D1E3                     shl bx, 1
  9615 00004660 8B87CF97                 mov ax, [CAdr + bx]
  9616 00004664 A3[6E00]                 mov word [p1], ax
  9617                                  
  9618                                  ;-959         from_far(NameA, p1);
  9619                                  
  9620 00004667 FF36[6E00]               push word [p1]
  9621 0000466B 8D06[4100]               lea  ax, [NameA]
  9622 0000466F 50                       push ax
  9623 00004670 E8920B                   call from_far
  9624 00004673 83C404                   add  sp, 4
  9625                                  
  9626                                  ;-960         if (eqstr(pt,NameA))  FCalls[f] = FCalls[f] + 1;
  9627                                  
  9628 00004676 8D06[4100]               lea  ax, [NameA]
  9629 0000467A 50                       push ax
  9630 0000467B FF36[6C00]               push word [pt]
  9631 0000467F E816BB                   call eqstr
  9632 00004682 83C404                   add  sp, 4
  9633 00004685 08C0                     or  al, al
  9634 00004687 0F841500                 je .countcalls530
  9635 0000468B 8B5E04                   mov bx, [bp+4]
  9636 0000468E D1E3                     shl bx, 1
  9637 00004690 8B876FA7                 mov ax, [FCalls + bx]
  9638 00004694 83C001                   add ax, 1
  9639 00004697 8B5E04                   mov bx, [bp+4]
  9640 0000469A D1E3                     shl bx, 1
  9641 0000469C 89876FA7                 mov [FCalls+bx], ax
  9642                                  
  9643                                  ;-961         i++; 
  9644                                  
  9645                                  .countcalls530:
  9646 000046A0 FF46FE                   inc  word[bp-2]
  9647                                  
  9648                                  ;-962         }
  9649                                  
  9650                                  
  9651                                  ;-963 }
  9652                                  
  9653 000046A3 EBAB                     jmp .countcalls528
  9654                                  .countcalls529:
  9655                                  
  9656                                  ;-964 int listfunc() { 
  9657 000046A5 C9                       LEAVE
  9658 000046A6 C3                       ret
  9659                                  ENDP
  9660                                  
  9661                                  listfunc: PROC
  9662                                  
  9663                                  ;-965     int i;
  9664                                  
  9665                                  
  9666                                  ;-966     prs("\n\n\n;   # Calls Line Width  Name   list of functions\n");
  9667                                  
  9668                                  ;Function : listfunc, Number of local variables: 1
  9669                                  ;   # type sign width addr used name   list of local variables
  9670                                  ;  200 var sign word   965 NULL i = bp-2;
  9671 000046A7 C8020000                 ENTER  2,0
  9672 000046AB 68[F446]                 push listfunc_0
  9673 000046AE E8ACF9                   call prs
  9674 000046B1 83C402                   add  sp, 2
  9675                                  
  9676                                  ;-967     i=0;  
  9677                                  
  9678 000046B4 B80000                   mov ax, 0
  9679 000046B7 8946FE                   mov [bp-2], ax
  9680                                  
  9681                                  ;-968     while (i < FTop) { 
  9682                                  
  9683                                  .listfunc531:
  9684 000046BA 8B46FE                   mov ax, [bp-2]
  9685 000046BD 3B06[3D00]               cmp ax, [FTop]
  9686 000046C1 0F8D0E00                 jge .listfunc532
  9687                                  
  9688                                  ;-969         countcalls (i); 
  9689                                  
  9690 000046C5 FF76FE                   push word [bp-2]
  9691 000046C8 E86AFF                   call countcalls
  9692 000046CB 83C402                   add  sp, 2
  9693                                  
  9694                                  ;-970         i++; 
  9695                                  
  9696 000046CE FF46FE                   inc  word[bp-2]
  9697                                  
  9698                                  ;-971         }
  9699                                  
  9700                                  
  9701                                  ;-972     i=0;  
  9702                                  
  9703 000046D1 EBE7                     jmp .listfunc531
  9704                                  .listfunc532:
  9705 000046D3 B80000                   mov ax, 0
  9706 000046D6 8946FE                   mov [bp-2], ax
  9707                                  
  9708                                  ;-973     while (i < FTop) { 
  9709                                  
  9710                                  .listfunc533:
  9711 000046D9 8B46FE                   mov ax, [bp-2]
  9712 000046DC 3B06[3D00]               cmp ax, [FTop]
  9713 000046E0 0F8D0E00                 jge .listfunc534
  9714                                  
  9715                                  ;-974         funclisting(i); 
  9716                                  
  9717 000046E4 FF76FE                   push word [bp-2]
  9718 000046E7 E84300                   call funclisting
  9719 000046EA 83C402                   add  sp, 2
  9720                                  
  9721                                  ;-975         i++; 
  9722                                  
  9723 000046ED FF46FE                   inc  word[bp-2]
  9724                                  
  9725                                  ;-976         } 
  9726                                  
  9727                                  
  9728                                  ;-977 }
  9729                                  
  9730 000046F0 EBE7                     jmp .listfunc533
  9731                                  .listfunc534:
  9732                                  
  9733                                  ;-978 int funclisting(int i) {
  9734 000046F2 C9                       LEAVE
  9735 000046F3 C3                       ret
  9736 000046F4 5C6E5C6E5C6E3B2020-     listfunc_0 db "\n\n\n;   # Calls Line Width  Name   list of functions\n",0
  9737 000046FD 20232043616C6C7320-
  9738 00004706 4C696E652057696474-
  9739 0000470F 6820204E616D652020-
  9740 00004718 206C697374206F6620-
  9741 00004721 66756E6374696F6E73-
  9742 0000472A 5C6E00             
  9743                                  ENDP
  9744                                  
  9745                                  funclisting: PROC
  9746                                  
  9747                                  ;-979     int j;  char c;
  9748                                  
  9749                                  
  9750                                  ;-980     prs("\n;");    printint51(i);
  9751                                  
  9752                                  ;Function : funclisting, Number of local variables: 3
  9753                                  ;   # type sign width addr used name   list of local variables
  9754                                  ;  200 var sign word   978 NULL i = bp+4
  9755                                  ;  201 var sign word   979 NULL j = bp-2
  9756                                  ;  202 var sign byte   979 NULL c = bp-4;
  9757 0000472D C8040000                 ENTER  4,0
  9758 00004731 68[0948]                 push funclisting_0
  9759 00004734 E826F9                   call prs
  9760 00004737 83C402                   add  sp, 2
  9761 0000473A FF7604                   push word [bp+4]
  9762 0000473D E8B4FA                   call printint51
  9763 00004740 83C402                   add  sp, 2
  9764                                  
  9765                                  ;-981     j = FCalls[i]; 
  9766                                  
  9767 00004743 8B5E04                   mov bx, [bp+4]
  9768 00004746 D1E3                     shl bx, 1
  9769 00004748 8B876FA7                 mov ax, [FCalls + bx]
  9770 0000474C 8946FE                   mov [bp-2], ax
  9771                                  
  9772                                  ;-982     if (j) printint51(j); 
  9773                                  
  9774 0000474F 8B46FE                   mov ax, [bp-2]
  9775 00004752 08C0                     or  al, al
  9776 00004754 0F840C00                 je .funclisting535
  9777 00004758 FF76FE                   push word [bp-2]
  9778 0000475B E896FA                   call printint51
  9779 0000475E 83C402                   add  sp, 2
  9780                                  
  9781                                  ;-983         else prs(" NULL");
  9782                                  
  9783 00004761 E90900                   jmp .funclisting536
  9784                                  .funclisting535:
  9785 00004764 68[0D48]                 push funclisting_1
  9786 00004767 E8F3F8                   call prs
  9787 0000476A 83C402                   add  sp, 2
  9788                                  
  9789                                  ;-984     j = FAdr[i];   
  9790                                  
  9791                                  .funclisting536:
  9792 0000476D 8B5E04                   mov bx, [bp+4]
  9793 00004770 D1E3                     shl bx, 1
  9794 00004772 8B877795                 mov ax, [FAdr + bx]
  9795 00004776 8946FE                   mov [bp-2], ax
  9796                                  
  9797                                  ;-985     printint51(j); 
  9798                                  
  9799 00004779 FF76FE                   push word [bp-2]
  9800 0000477C E875FA                   call printint51
  9801 0000477F 83C402                   add  sp, 2
  9802                                  
  9803                                  ;-986     prc(32);
  9804                                  
  9805 00004782 6A20                     push 32
  9806 00004784 E86FF8                   call prc
  9807 00004787 83C402                   add  sp, 2
  9808                                  
  9809                                  ;-987     c=FType[i];
  9810                                  
  9811 0000478A 8B5E04                   mov bx, [bp+4]
  9812 0000478D 8A877B8C                 mov al, [FType + bx]
  9813 00004791 8846FC                   mov [bp-4], al
  9814                                  
  9815                                  ;-988     if(c=='V')prs("void " );    
  9816                                  
  9817 00004794 8A46FC                   mov al, [bp-4]
  9818 00004797 3C56                     cmp al, 86
  9819 00004799 0F850900                 jne .funclisting537
  9820 0000479D 68[1348]                 push funclisting_2
  9821 000047A0 E8BAF8                   call prs
  9822 000047A3 83C402                   add  sp, 2
  9823                                  
  9824                                  ;-989     if(c=='B')prs("byte " );
  9825                                  
  9826                                  .funclisting537:
  9827 000047A6 8A46FC                   mov al, [bp-4]
  9828 000047A9 3C42                     cmp al, 66
  9829 000047AB 0F850900                 jne .funclisting538
  9830 000047AF 68[1948]                 push funclisting_3
  9831 000047B2 E8A8F8                   call prs
  9832 000047B5 83C402                   add  sp, 2
  9833                                  
  9834                                  ;-990     if(c=='W')prs("word " );    
  9835                                  
  9836                                  .funclisting538:
  9837 000047B8 8A46FC                   mov al, [bp-4]
  9838 000047BB 3C57                     cmp al, 87
  9839 000047BD 0F850900                 jne .funclisting539
  9840 000047C1 68[1F48]                 push funclisting_4
  9841 000047C4 E896F8                   call prs
  9842 000047C7 83C402                   add  sp, 2
  9843                                  
  9844                                  ;-991     if(c=='D')prs("dwrd " );
  9845                                  
  9846                                  .funclisting539:
  9847 000047CA 8A46FC                   mov al, [bp-4]
  9848 000047CD 3C44                     cmp al, 68
  9849 000047CF 0F850900                 jne .funclisting540
  9850 000047D3 68[2548]                 push funclisting_5
  9851 000047D6 E884F8                   call prs
  9852 000047D9 83C402                   add  sp, 2
  9853                                  
  9854                                  ;-992     prc(32); prc(32);
  9855                                  
  9856                                  .funclisting540:
  9857 000047DC 6A20                     push 32
  9858 000047DE E815F8                   call prc
  9859 000047E1 83C402                   add  sp, 2
  9860 000047E4 6A20                     push 32
  9861 000047E6 E80DF8                   call prc
  9862 000047E9 83C402                   add  sp, 2
  9863                                  
  9864                                  ;-993     pt=adrF(FNameField, i); 
  9865                                  
  9866 000047EC FF7604                   push word [bp+4]
  9867 000047EF 8D06C7A9                 lea  ax, [FNameField]
  9868 000047F3 50                       push ax
  9869 000047F4 E8F3C0                   call adrF
  9870 000047F7 83C404                   add  sp, 4
  9871 000047FA A3[6C00]                 mov word [pt], ax
  9872                                  
  9873                                  ;-994     prs(pt);
  9874                                  
  9875 000047FD FF36[6C00]               push word [pt]
  9876 00004801 E859F8                   call prs
  9877 00004804 83C402                   add  sp, 2
  9878                                  
  9879                                  ;-995 }
  9880                                  
  9881                                  
  9882                                  ;-996 
  9883                                  
  9884                                  
  9885                                  ;-997 int listvar(unsigned int i) {
  9886 00004807 C9                       LEAVE
  9887 00004808 C3                       ret
  9888 00004809 5C6E3B00                funclisting_0 db "\n;",0
  9889 0000480D 204E554C4C00            funclisting_1 db " NULL",0
  9890 00004813 766F69642000            funclisting_2 db "void ",0
  9891 00004819 627974652000            funclisting_3 db "byte ",0
  9892 0000481F 776F72642000            funclisting_4 db "word ",0
  9893 00004825 647772642000            funclisting_5 db "dwrd ",0
  9894                                  ENDP
  9895                                  
  9896                                  listvar: PROC
  9897                                  
  9898                                  ;-998     unsigned int j; char c;
  9899                                  
  9900                                  
  9901                                  ;-999     prs("\n;"); printint51(i); prc(32);
  9902                                  
  9903                                  ;Function : listvar, Number of local variables: 3
  9904                                  ;   # type sign width addr used name   list of local variables
  9905                                  ;  200 var unsg word   997 NULL i = bp+4
  9906                                  ;  201 var unsg word   998 NULL j = bp-2
  9907                                  ;  202 var sign byte   998 NULL c = bp-4;
  9908 0000482B C8040000                 ENTER  4,0
  9909 0000482F 68[174A]                 push listvar_0
  9910 00004832 E828F8                   call prs
  9911 00004835 83C402                   add  sp, 2
  9912 00004838 FF7604                   push word [bp+4]
  9913 0000483B E8B6F9                   call printint51
  9914 0000483E 83C402                   add  sp, 2
  9915 00004841 6A20                     push 32
  9916 00004843 E8B0F7                   call prc
  9917 00004846 83C402                   add  sp, 2
  9918                                  
  9919                                  ;-1000     c=GType [i]; if(c=='V')prs("var ");   if(c=='*')prs("ptr ");
  9920                                  
  9921 00004849 8B5E04                   mov bx, [bp+4]
  9922 0000484C 8A872F6F                 mov al, [GType + bx]
  9923 00004850 8846FC                   mov [bp-4], al
  9924 00004853 8A46FC                   mov al, [bp-4]
  9925 00004856 3C56                     cmp al, 86
  9926 00004858 0F850900                 jne .listvar541
  9927 0000485C 68[1B4A]                 push listvar_1
  9928 0000485F E8FBF7                   call prs
  9929 00004862 83C402                   add  sp, 2
  9930                                  .listvar541:
  9931 00004865 8A46FC                   mov al, [bp-4]
  9932 00004868 3C2A                     cmp al, 42
  9933 0000486A 0F850900                 jne .listvar542
  9934 0000486E 68[204A]                 push listvar_2
  9935 00004871 E8E9F7                   call prs
  9936 00004874 83C402                   add  sp, 2
  9937                                  
  9938                                  ;-1001                  if(c=='&')prs("arr ");   if(c=='#')prs("def ");
  9939                                  
  9940                                  .listvar542:
  9941 00004877 8A46FC                   mov al, [bp-4]
  9942 0000487A 3C26                     cmp al, 38
  9943 0000487C 0F850900                 jne .listvar543
  9944 00004880 68[254A]                 push listvar_3
  9945 00004883 E8D7F7                   call prs
  9946 00004886 83C402                   add  sp, 2
  9947                                  .listvar543:
  9948 00004889 8A46FC                   mov al, [bp-4]
  9949 0000488C 3C23                     cmp al, 35
  9950 0000488E 0F850900                 jne .listvar544
  9951 00004892 68[2A4A]                 push listvar_4
  9952 00004895 E8C5F7                   call prs
  9953 00004898 83C402                   add  sp, 2
  9954                                  
  9955                                  ;-1002     c=GSign [i]; if(c=='S')prs("sign ");  if(c=='U')prs("unsg ");
  9956                                  
  9957                                  .listvar544:
  9958 0000489B 8B5E04                   mov bx, [bp+4]
  9959 0000489E 8A875B70                 mov al, [GSign + bx]
  9960 000048A2 8846FC                   mov [bp-4], al
  9961 000048A5 8A46FC                   mov al, [bp-4]
  9962 000048A8 3C53                     cmp al, 83
  9963 000048AA 0F850900                 jne .listvar545
  9964 000048AE 68[2F4A]                 push listvar_5
  9965 000048B1 E8A9F7                   call prs
  9966 000048B4 83C402                   add  sp, 2
  9967                                  .listvar545:
  9968 000048B7 8A46FC                   mov al, [bp-4]
  9969 000048BA 3C55                     cmp al, 85
  9970 000048BC 0F850900                 jne .listvar546
  9971 000048C0 68[354A]                 push listvar_6
  9972 000048C3 E897F7                   call prs
  9973 000048C6 83C402                   add  sp, 2
  9974                                  
  9975                                  ;-1003     c=GWidth[i]; if(c==  1)prs("byte " ); if(c==  2)prs("word " );
  9976                                  
  9977                                  .listvar546:
  9978 000048C9 8B5E04                   mov bx, [bp+4]
  9979 000048CC 8A878771                 mov al, [GWidth + bx]
  9980 000048D0 8846FC                   mov [bp-4], al
  9981 000048D3 8A46FC                   mov al, [bp-4]
  9982 000048D6 3C01                     cmp al, 1
  9983 000048D8 0F850900                 jne .listvar547
  9984 000048DC 68[3B4A]                 push listvar_7
  9985 000048DF E87BF7                   call prs
  9986 000048E2 83C402                   add  sp, 2
  9987                                  .listvar547:
  9988 000048E5 8A46FC                   mov al, [bp-4]
  9989 000048E8 3C02                     cmp al, 2
  9990 000048EA 0F850900                 jne .listvar548
  9991 000048EE 68[414A]                 push listvar_8
  9992 000048F1 E869F7                   call prs
  9993 000048F4 83C402                   add  sp, 2
  9994                                  
  9995                                  ;-1004                  if(c==  4)prs("dwrd " );
  9996                                  
  9997                                  .listvar548:
  9998 000048F7 8A46FC                   mov al, [bp-4]
  9999 000048FA 3C04                     cmp al, 4
 10000 000048FC 0F850900                 jne .listvar549
 10001 00004900 68[474A]                 push listvar_9
 10002 00004903 E857F7                   call prs
 10003 00004906 83C402                   add  sp, 2
 10004                                  
 10005                                  ;-1005     j=GAdr[i]; printint51(j);
 10006                                  
 10007                                  .listvar549:
 10008 00004909 8B5E04                   mov bx, [bp+4]
 10009 0000490C D1E3                     shl bx, 1
 10010 0000490E 8B87B372                 mov ax, [GAdr + bx]
 10011 00004912 8946FE                   mov [bp-2], ax
 10012 00004915 FF76FE                   push word [bp-2]
 10013 00004918 E8D9F8                   call printint51
 10014 0000491B 83C402                   add  sp, 2
 10015                                  
 10016                                  ;-1006     j=GUsed[i]; 
 10017                                  
 10018 0000491E 8B5E04                   mov bx, [bp+4]
 10019 00004921 D1E3                     shl bx, 1
 10020 00004923 8B870B75                 mov ax, [GUsed + bx]
 10021 00004927 8946FE                   mov [bp-2], ax
 10022                                  
 10023                                  ;-1007     if (j) printint51(j);
 10024                                  
 10025 0000492A 8B46FE                   mov ax, [bp-2]
 10026 0000492D 08C0                     or  al, al
 10027 0000492F 0F840C00                 je .listvar550
 10028 00004933 FF76FE                   push word [bp-2]
 10029 00004936 E8BBF8                   call printint51
 10030 00004939 83C402                   add  sp, 2
 10031                                  
 10032                                  ;-1008     else {
 10033                                  
 10034 0000493C E92200                   jmp .listvar551
 10035                                  .listvar550:
 10036                                  
 10037                                  ;-1009         if(GType[i]=='#') prs("    -"); 
 10038                                  
 10039 0000493F 8B5E04                   mov bx, [bp+4]
 10040 00004942 8A872F6F                 mov al, [GType + bx]
 10041 00004946 3C23                     cmp al, 35
 10042 00004948 0F850C00                 jne .listvar552
 10043 0000494C 68[4D4A]                 push listvar_10
 10044 0000494F E80BF7                   call prs
 10045 00004952 83C402                   add  sp, 2
 10046                                  
 10047                                  ;-1010         else prs(" NULL");
 10048                                  
 10049 00004955 E90900                   jmp .listvar553
 10050                                  .listvar552:
 10051 00004958 68[534A]                 push listvar_11
 10052 0000495B E8FFF6                   call prs
 10053 0000495E 83C402                   add  sp, 2
 10054                                  
 10055                                  ;-1011          }
 10056                                  
 10057                                  .listvar553:
 10058                                  
 10059                                  ;-1012     prc(32);  
 10060                                  
 10061                                  .listvar551:
 10062 00004961 6A20                     push 32
 10063 00004963 E890F6                   call prc
 10064 00004966 83C402                   add  sp, 2
 10065                                  
 10066                                  ;-1013     pt=adrofname(i); prs(pt);
 10067                                  
 10068 00004969 FF7604                   push word [bp+4]
 10069 0000496C E867BF                   call adrofname
 10070 0000496F 83C402                   add  sp, 2
 10071 00004972 A3[6C00]                 mov word [pt], ax
 10072 00004975 FF36[6C00]               push word [pt]
 10073 00004979 E8E1F6                   call prs
 10074 0000497C 83C402                   add  sp, 2
 10075                                  
 10076                                  ;-1014     if(GType[i]=='#') { 
 10077                                  
 10078 0000497F 8B5E04                   mov bx, [bp+4]
 10079 00004982 8A872F6F                 mov al, [GType + bx]
 10080 00004986 3C23                     cmp al, 35
 10081 00004988 0F851D00                 jne .listvar554
 10082                                  
 10083                                  ;-1015         prc('='); 
 10084                                  
 10085 0000498C 6A3D                     push 61
 10086 0000498E E865F6                   call prc
 10087 00004991 83C402                   add  sp, 2
 10088                                  
 10089                                  ;-1016         j=GData[i]; 
 10090                                  
 10091 00004994 8B5E04                   mov bx, [bp+4]
 10092 00004997 D1E3                     shl bx, 1
 10093 00004999 8B876377                 mov ax, [GData + bx]
 10094 0000499D 8946FE                   mov [bp-2], ax
 10095                                  
 10096                                  ;-1017         prunsign1(j); 
 10097                                  
 10098 000049A0 FF76FE                   push word [bp-2]
 10099 000049A3 E80CF8                   call prunsign1
 10100 000049A6 83C402                   add  sp, 2
 10101                                  
 10102                                  ;-1018         }
 10103                                  
 10104                                  
 10105                                  ;-1019     if(GType[i]=='&') { 
 10106                                  
 10107                                  .listvar554:
 10108 000049A9 8B5E04                   mov bx, [bp+4]
 10109 000049AC 8A872F6F                 mov al, [GType + bx]
 10110 000049B0 3C26                     cmp al, 38
 10111 000049B2 0F852500                 jne .listvar555
 10112                                  
 10113                                  ;-1020         prc('['); 
 10114                                  
 10115 000049B6 6A5B                     push 91
 10116 000049B8 E83BF6                   call prc
 10117 000049BB 83C402                   add  sp, 2
 10118                                  
 10119                                  ;-1021         j=GData[i]; 
 10120                                  
 10121 000049BE 8B5E04                   mov bx, [bp+4]
 10122 000049C1 D1E3                     shl bx, 1
 10123 000049C3 8B876377                 mov ax, [GData + bx]
 10124 000049C7 8946FE                   mov [bp-2], ax
 10125                                  
 10126                                  ;-1022         prunsign1(j); 
 10127                                  
 10128 000049CA FF76FE                   push word [bp-2]
 10129 000049CD E8E2F7                   call prunsign1
 10130 000049D0 83C402                   add  sp, 2
 10131                                  
 10132                                  ;-1023         prc(']');
 10133                                  
 10134 000049D3 6A5D                     push 93
 10135 000049D5 E81EF6                   call prc
 10136 000049D8 83C402                   add  sp, 2
 10137                                  
 10138                                  ;-1024         }
 10139                                  
 10140                                  
 10141                                  ;-1025     if (i >= LSTART) { 
 10142                                  
 10143                                  .listvar555:
 10144 000049DB 8B4604                   mov ax, [bp+4]
 10145 000049DE 3DC800                   cmp ax, 200 ;unsigned : 0
 10146 000049E1 0F823000                 jb  .listvar556
 10147                                  
 10148                                  ;-1026         prs(" = bp"); 
 10149                                  
 10150 000049E5 68[594A]                 push listvar_12
 10151 000049E8 E872F6                   call prs
 10152 000049EB 83C402                   add  sp, 2
 10153                                  
 10154                                  ;-1027         j=GData[i];
 10155                                  
 10156 000049EE 8B5E04                   mov bx, [bp+4]
 10157 000049F1 D1E3                     shl bx, 1
 10158 000049F3 8B876377                 mov ax, [GData + bx]
 10159 000049F7 8946FE                   mov [bp-2], ax
 10160                                  
 10161                                  ;-1028         if (j > 0) prc('+'); 
 10162                                  
 10163 000049FA 8B46FE                   mov ax, [bp-2]
 10164 000049FD 83F800                   cmp ax, 0
 10165 00004A00 0F8E0800                 jle .listvar557
 10166 00004A04 6A2B                     push 43
 10167 00004A06 E8EDF5                   call prc
 10168 00004A09 83C402                   add  sp, 2
 10169                                  
 10170                                  ;-1029         pint1(j);  
 10171                                  
 10172                                  .listvar557:
 10173 00004A0C FF76FE                   push word [bp-2]
 10174 00004A0F E842F7                   call pint1
 10175 00004A12 83C402                   add  sp, 2
 10176                                  
 10177                                  ;-1030     }
 10178                                  
 10179                                  
 10180                                  ;-1031 }
 10181                                  
 10182                                  .listvar556:
 10183                                  
 10184                                  ;-1032 
 10185                                  
 10186                                  
 10187                                  ;-1033 unsigned int MAXUI=65535;
 10188 00004A15 C9                       LEAVE
 10189 00004A16 C3                       ret
 10190 00004A17 5C6E3B00                listvar_0 db "\n;",0
 10191 00004A1B 7661722000              listvar_1 db "var ",0
 10192 00004A20 7074722000              listvar_2 db "ptr ",0
 10193 00004A25 6172722000              listvar_3 db "arr ",0
 10194 00004A2A 6465662000              listvar_4 db "def ",0
 10195 00004A2F 7369676E2000            listvar_5 db "sign ",0
 10196 00004A35 756E73672000            listvar_6 db "unsg ",0
 10197 00004A3B 627974652000            listvar_7 db "byte ",0
 10198 00004A41 776F72642000            listvar_8 db "word ",0
 10199 00004A47 647772642000            listvar_9 db "dwrd ",0
 10200 00004A4D 202020202D00            listvar_10 db "    -",0
 10201 00004A53 204E554C4C00            listvar_11 db " NULL",0
 10202 00004A59 203D20627000            listvar_12 db " = bp",0
 10203                                  ENDP
 10204 00004A5F FFFF                    MAXUI dw 65535
 10205                                  
 10206                                  ;-1034 int epilog() {
 10207                                  
 10208                                  
 10209                                  epilog: PROC
 10210                                  
 10211                                  ;-1035     unsigned int i;
 10212                                  
 10213                                  
 10214                                  ;-1036     prs("\n \n;   # type sign width  adr used name");
 10215                                  
 10216                                  ;Function : epilog, Number of local variables: 1
 10217                                  ;   # type sign width addr used name   list of local variables
 10218                                  ;  200 var unsg word  1035 NULL i = bp-2;
 10219 00004A61 C8020000                 ENTER  2,0
 10220 00004A65 68[F24B]                 push epilog_0
 10221 00004A68 E8F2F5                   call prs
 10222 00004A6B 83C402                   add  sp, 2
 10223                                  
 10224                                  ;-1037     prs("   list of global variables\n");
 10225                                  
 10226 00004A6E 68[1C4C]                 push epilog_1
 10227 00004A71 E8E9F5                   call prs
 10228 00004A74 83C402                   add  sp, 2
 10229                                  
 10230                                  ;-1038     i=1;
 10231                                  
 10232 00004A77 B80100                   mov ax, 1
 10233 00004A7A 8946FE                   mov [bp-2], ax
 10234                                  
 10235                                  ;-1039     while (i< GTop) { 
 10236                                  
 10237                                  .epilog558:
 10238 00004A7D 8B46FE                   mov ax, [bp-2]
 10239 00004A80 3B06[2C00]               cmp ax, [GTop]
 10240 00004A84 0F8D0E00                 jge .epilog559
 10241                                  
 10242                                  ;-1040         listvar(i); 
 10243                                  
 10244 00004A88 FF76FE                   push word [bp-2]
 10245 00004A8B E89DFD                   call listvar
 10246 00004A8E 83C402                   add  sp, 2
 10247                                  
 10248                                  ;-1041         i++; 
 10249                                  
 10250 00004A91 FF46FE                   inc  word[bp-2]
 10251                                  
 10252                                  ;-1042         }
 10253                                  
 10254                                  
 10255                                  ;-1043     listfunc();   
 10256                                  
 10257 00004A94 EBE7                     jmp .epilog558
 10258                                  .epilog559:
 10259 00004A96 E80EFC                   call listfunc
 10260                                  
 10261                                  ;-1044     listcall();
 10262                                  
 10263 00004A99 E8C1FA                   call listcall
 10264                                  
 10265                                  ;-1045     prs("\n;Input: "); prs(&namein);
 10266                                  
 10267 00004A9C 68[3A4C]                 push epilog_2
 10268 00004A9F E8BBF5                   call prs
 10269 00004AA2 83C402                   add  sp, 2
 10270 00004AA5 8D06666E                 lea  ax, [namein]
 10271 00004AA9 50                       push ax
 10272 00004AAA E8B0F5                   call prs
 10273 00004AAD 83C402                   add  sp, 2
 10274                                  
 10275                                  ;-1046     prs(", List: ");   prs(&namelst);
 10276                                  
 10277 00004AB0 68[454C]                 push epilog_3
 10278 00004AB3 E8A7F5                   call prs
 10279 00004AB6 83C402                   add  sp, 2
 10280 00004AB9 8D06A96E                 lea  ax, [namelst]
 10281 00004ABD 50                       push ax
 10282 00004ABE E89CF5                   call prs
 10283 00004AC1 83C402                   add  sp, 2
 10284                                  
 10285                                  ;-1047     prs(",  Lines:"); printint51(lineno);
 10286                                  
 10287 00004AC4 68[4E4C]                 push epilog_4
 10288 00004AC7 E893F5                   call prs
 10289 00004ACA 83C402                   add  sp, 2
 10290 00004ACD FF36[6800]               push word [lineno]
 10291 00004AD1 E820F7                   call printint51
 10292 00004AD4 83C402                   add  sp, 2
 10293                                  
 10294                                  ;-1048     prs("\n;Glob. variables:"); GTop--; printint51(GTop);
 10295                                  
 10296 00004AD7 68[584C]                 push epilog_5
 10297 00004ADA E880F5                   call prs
 10298 00004ADD 83C402                   add  sp, 2
 10299 00004AE0 FF0E[2C00]               dec  word[GTop]
 10300 00004AE4 FF36[2C00]               push word [GTop]
 10301 00004AE8 E809F7                   call printint51
 10302 00004AEB 83C402                   add  sp, 2
 10303                                  
 10304                                  ;-1049     prs(" max.:"); printint51(LSTART);
 10305                                  
 10306 00004AEE 68[6C4C]                 push epilog_6
 10307 00004AF1 E869F5                   call prs
 10308 00004AF4 83C402                   add  sp, 2
 10309 00004AF7 68C800                   push 200
 10310 00004AFA E8F7F6                   call printint51
 10311 00004AFD 83C402                   add  sp, 2
 10312                                  
 10313                                  ;-1050     prs("\n;Functions      :"); printint51(FTop);
 10314                                  
 10315 00004B00 68[734C]                 push epilog_7
 10316 00004B03 E857F5                   call prs
 10317 00004B06 83C402                   add  sp, 2
 10318 00004B09 FF36[3D00]               push word [FTop]
 10319 00004B0D E8E4F6                   call printint51
 10320 00004B10 83C402                   add  sp, 2
 10321                                  
 10322                                  ;-1051     prs(" max.:"); printint51(FUNCMAX);
 10323                                  
 10324 00004B13 68[874C]                 push epilog_8
 10325 00004B16 E844F5                   call prs
 10326 00004B19 83C402                   add  sp, 2
 10327 00004B1C 682C01                   push 300
 10328 00004B1F E8D2F6                   call printint51
 10329 00004B22 83C402                   add  sp, 2
 10330                                  
 10331                                  ;-1052     prs("\n;Calls          :"); printint51(CTop);
 10332                                  
 10333 00004B25 68[8E4C]                 push epilog_9
 10334 00004B28 E832F5                   call prs
 10335 00004B2B 83C402                   add  sp, 2
 10336 00004B2E FF36[3F00]               push word [CTop]
 10337 00004B32 E8BFF6                   call printint51
 10338 00004B35 83C402                   add  sp, 2
 10339                                  
 10340                                  ;-1053     prs(" max.:"); printint51(CALLMAX);
 10341                                  
 10342 00004B38 68[A24C]                 push epilog_10
 10343 00004B3B E81FF5                   call prs
 10344 00004B3E 83C402                   add  sp, 2
 10345 00004B41 68D007                   push 2000
 10346 00004B44 E8ADF6                   call printint51
 10347 00004B47 83C402                   add  sp, 2
 10348                                  
 10349                                  ;-1054     prs(", NameField:"); printint51(CNameTop);
 10350                                  
 10351 00004B4A 68[A94C]                 push epilog_11
 10352 00004B4D E80DF5                   call prs
 10353 00004B50 83C402                   add  sp, 2
 10354 00004B53 FF36[6200]               push word [CNameTop]
 10355 00004B57 E89AF6                   call printint51
 10356 00004B5A 83C402                   add  sp, 2
 10357                                  
 10358                                  ;-1055 //    prs(" max.:"); 
 10359                                  
 10360                                  
 10361                                  ;-1056     prs("\n;Const in '"); prs(coname); prs("' :"); printint51(maxco);
 10362                                  
 10363 00004B5D 68[B64C]                 push epilog_12
 10364 00004B60 E8FAF4                   call prs
 10365 00004B63 83C402                   add  sp, 2
 10366 00004B66 8D06606D                 lea  ax, [coname]
 10367 00004B6A 50                       push ax
 10368 00004B6B E8EFF4                   call prs
 10369 00004B6E 83C402                   add  sp, 2
 10370 00004B71 68[C44C]                 push epilog_13
 10371 00004B74 E8E6F4                   call prs
 10372 00004B77 83C402                   add  sp, 2
 10373 00004B7A FF36[1400]               push word [maxco]
 10374 00004B7E E873F6                   call printint51
 10375 00004B81 83C402                   add  sp, 2
 10376                                  
 10377                                  ;-1057     prs(" max.:"); printint51(COMAX); i=COMAX; i=i-maxco; 
 10378                                  
 10379 00004B84 68[C84C]                 push epilog_14
 10380 00004B87 E8D3F4                   call prs
 10381 00004B8A 83C402                   add  sp, 2
 10382 00004B8D 68B80B                   push 3000
 10383 00004B90 E861F6                   call printint51
 10384 00004B93 83C402                   add  sp, 2
 10385 00004B96 B8B80B                   mov ax, 3000
 10386 00004B99 8946FE                   mov [bp-2], ax
 10387 00004B9C 8B46FE                   mov ax, [bp-2]
 10388 00004B9F 2B06[1400]               sub ax, [maxco]
 10389 00004BA3 8946FE                   mov [bp-2], ax
 10390                                  
 10391                                  ;-1058     if (i <= 1000)prs(" *** Warning *** constant area too small");
 10392                                  
 10393 00004BA6 8B46FE                   mov ax, [bp-2]
 10394 00004BA9 3DE803                   cmp ax, 1000
 10395 00004BAC 0F870900                 ja  .epilog560
 10396 00004BB0 68[CF4C]                 push epilog_15
 10397 00004BB3 E8A7F4                   call prs
 10398 00004BB6 83C402                   add  sp, 2
 10399                                  
 10400                                  ;-1059     prs(", stacksize: ");  
 10401                                  
 10402                                  .epilog560:
 10403 00004BB9 68[F84C]                 push epilog_16
 10404 00004BBC E89EF4                   call prs
 10405 00004BBF 83C402                   add  sp, 2
 10406                                  
 10407                                  ;-1060     i=MAXUI-orgData; printint51(i);
 10408                                  
 10409 00004BC2 A1[5F4A]                 mov ax, [MAXUI]
 10410 00004BC5 2B06[1200]               sub ax, [orgData]
 10411 00004BC9 8946FE                   mov [bp-2], ax
 10412 00004BCC FF76FE                   push word [bp-2]
 10413 00004BCF E822F6                   call printint51
 10414 00004BD2 83C402                   add  sp, 2
 10415                                  
 10416                                  ;-1061     if (i <= 1000) prs(" *** Warning *** Stack too small");
 10417                                  
 10418 00004BD5 8B46FE                   mov ax, [bp-2]
 10419 00004BD8 3DE803                   cmp ax, 1000
 10420 00004BDB 0F870900                 ja  .epilog561
 10421 00004BDF 68[064D]                 push epilog_17
 10422 00004BE2 E878F4                   call prs
 10423 00004BE5 83C402                   add  sp, 2
 10424                                  
 10425                                  ;-1062   end1(0);}
 10426                                  
 10427                                  .epilog561:
 10428 00004BE8 6A00                     push 0
 10429 00004BEA E8ACF7                   call end1
 10430 00004BED 83C402                   add  sp, 2
 10431                                  
 10432                                  ;-1063 
 10433                                  
 10434                                  
 10435                                  ;-1064 int checkcalls() { 
 10436 00004BF0 C9                       LEAVE
 10437 00004BF1 C3                       ret
 10438 00004BF2 5C6E205C6E3B202020-     epilog_0 db "\n \n;   # type sign width  adr used name",0
 10439 00004BFB 232074797065207369-
 10440 00004C04 676E20776964746820-
 10441 00004C0D 206164722075736564-
 10442 00004C16 206E616D6500       
 10443 00004C1C 2020206C697374206F-     epilog_1 db "   list of global variables\n",0
 10444 00004C25 6620676C6F62616C20-
 10445 00004C2E 7661726961626C6573-
 10446 00004C37 5C6E00             
 10447 00004C3A 5C6E3B496E7075743A-     epilog_2 db "\n;Input: ",0
 10448 00004C43 2000               
 10449 00004C45 2C204C6973743A2000      epilog_3 db ", List: ",0
 10450 00004C4E 2C20204C696E65733A-     epilog_4 db ",  Lines:",0
 10451 00004C57 00                 
 10452 00004C58 5C6E3B476C6F622E20-     epilog_5 db "\n;Glob. variables:",0
 10453 00004C61 7661726961626C6573-
 10454 00004C6A 3A00               
 10455 00004C6C 206D61782E3A00          epilog_6 db " max.:",0
 10456 00004C73 5C6E3B46756E637469-     epilog_7 db "\n;Functions      :",0
 10457 00004C7C 6F6E73202020202020-
 10458 00004C85 3A00               
 10459 00004C87 206D61782E3A00          epilog_8 db " max.:",0
 10460 00004C8E 5C6E3B43616C6C7320-     epilog_9 db "\n;Calls          :",0
 10461 00004C97 202020202020202020-
 10462 00004CA0 3A00               
 10463 00004CA2 206D61782E3A00          epilog_10 db " max.:",0
 10464 00004CA9 2C204E616D65466965-     epilog_11 db ", NameField:",0
 10465 00004CB2 6C643A00           
 10466 00004CB6 5C6E3B436F6E737420-     epilog_12 db "\n;Const in '",0
 10467 00004CBF 696E202700         
 10468 00004CC4 27203A00                epilog_13 db "' :",0
 10469 00004CC8 206D61782E3A00          epilog_14 db " max.:",0
 10470 00004CCF 202A2A2A205761726E-     epilog_15 db " *** Warning *** constant area too small",0
 10471 00004CD8 696E67202A2A2A2063-
 10472 00004CE1 6F6E7374616E742061-
 10473 00004CEA 72656120746F6F2073-
 10474 00004CF3 6D616C6C00         
 10475 00004CF8 2C20737461636B7369-     epilog_16 db ", stacksize: ",0
 10476 00004D01 7A653A2000         
 10477 00004D06 202A2A2A205761726E-     epilog_17 db " *** Warning *** Stack too small",0
 10478 00004D0F 696E67202A2A2A2053-
 10479 00004D18 7461636B20746F6F20-
 10480 00004D21 736D616C6C00       
 10481                                  ENDP
 10482                                  
 10483                                  checkcalls: PROC
 10484                                  
 10485                                  ;-1065     int i; int j; int k;
 10486                                  
 10487                                  
 10488                                  ;-1066     prs("\n \n; missing functions: ");
 10489                                  
 10490                                  ;Function : checkcalls, Number of local variables: 3
 10491                                  ;   # type sign width addr used name   list of local variables
 10492                                  ;  200 var sign word  1065 NULL i = bp-2
 10493                                  ;  201 var sign word  1065 NULL j = bp-4
 10494                                  ;  202 var sign word  1065 NULL k = bp-6;
 10495 00004D27 C8060000                 ENTER  6,0
 10496 00004D2B 68[0D4E]                 push checkcalls_0
 10497 00004D2E E82CF3                   call prs
 10498 00004D31 83C402                   add  sp, 2
 10499                                  
 10500                                  ;-1067     i=0;  k=0;
 10501                                  
 10502 00004D34 B80000                   mov ax, 0
 10503 00004D37 8946FE                   mov [bp-2], ax
 10504 00004D3A B80000                   mov ax, 0
 10505 00004D3D 8946FA                   mov [bp-6], ax
 10506                                  
 10507                                  ;-1068     while (i < CTop) {
 10508                                  
 10509                                  .checkcalls562:
 10510 00004D40 8B46FE                   mov ax, [bp-2]
 10511 00004D43 3B06[3F00]               cmp ax, [CTop]
 10512 00004D47 0F8D8F00                 jge .checkcalls563
 10513                                  
 10514                                  ;-1069         pt=CAdr[i];
 10515                                  
 10516 00004D4B 8B5EFE                   mov bx, [bp-2]
 10517 00004D4E D1E3                     shl bx, 1
 10518 00004D50 8B87CF97                 mov ax, [CAdr + bx]
 10519 00004D54 A3[6C00]                 mov word [pt], ax
 10520                                  
 10521                                  ;-1070         from_far(NameA, pt);
 10522                                  
 10523 00004D57 FF36[6C00]               push word [pt]
 10524 00004D5B 8D06[4100]               lea  ax, [NameA]
 10525 00004D5F 50                       push ax
 10526 00004D60 E8A204                   call from_far
 10527 00004D63 83C404                   add  sp, 4
 10528                                  
 10529                                  ;-1071         j=0;
 10530                                  
 10531 00004D66 B80000                   mov ax, 0
 10532 00004D69 8946FC                   mov [bp-4], ax
 10533                                  
 10534                                  ;-1072         do { 
 10535                                  
 10536                                  .checkcalls564:
 10537                                  
 10538                                  ;-1073             p1=adrF(FNameField, j);
 10539                                  
 10540 00004D6C FF76FC                   push word [bp-4]
 10541 00004D6F 8D06C7A9                 lea  ax, [FNameField]
 10542 00004D73 50                       push ax
 10543 00004D74 E873BB                   call adrF
 10544 00004D77 83C404                   add  sp, 4
 10545 00004D7A A3[6E00]                 mov word [p1], ax
 10546                                  
 10547                                  ;-1074             if (eqstr(NameA, p1)){ 
 10548                                  
 10549 00004D7D FF36[6E00]               push word [p1]
 10550 00004D81 8D06[4100]               lea  ax, [NameA]
 10551 00004D85 50                       push ax
 10552 00004D86 E80FB4                   call eqstr
 10553 00004D89 83C404                   add  sp, 4
 10554 00004D8C 08C0                     or  al, al
 10555 00004D8E 0F841000                 je .checkcalls565
 10556                                  
 10557                                  ;-1075                 CType[i]=1; 
 10558                                  
 10559 00004D92 B80100                   mov ax, 1
 10560 00004D95 8B5EFE                   mov bx, [bp-2]
 10561 00004D98 8887A78D                 mov [CType+bx], al
 10562                                  
 10563                                  ;-1076                 j=FTop; 
 10564                                  
 10565 00004D9C A1[3D00]                 mov ax, [FTop]
 10566 00004D9F 8946FC                   mov [bp-4], ax
 10567                                  
 10568                                  ;-1077                 }
 10569                                  
 10570                                  
 10571                                  ;-1078             j++; 
 10572                                  
 10573                                  .checkcalls565:
 10574 00004DA2 FF46FC                   inc  word[bp-4]
 10575                                  
 10576                                  ;-1079             } while (j < FTop);
 10577                                  
 10578 00004DA5 8B46FC                   mov ax, [bp-4]
 10579 00004DA8 3B06[3D00]               cmp ax, [FTop]
 10580 00004DAC 0F8D0200                 jge .checkcalls566
 10581 00004DB0 EBBA                     jmp .checkcalls564
 10582                                  .checkcalls566:
 10583                                  
 10584                                  ;-1080         if (j == FTop) { 
 10585                                  
 10586 00004DB2 8B46FC                   mov ax, [bp-4]
 10587 00004DB5 3B06[3D00]               cmp ax, [FTop]
 10588 00004DB9 0F851700                 jne .checkcalls567
 10589                                  
 10590                                  ;-1081             k++; prs("\n; "); 
 10591                                  
 10592 00004DBD FF46FA                   inc  word[bp-6]
 10593 00004DC0 68[284E]                 push checkcalls_1
 10594 00004DC3 E897F2                   call prs
 10595 00004DC6 83C402                   add  sp, 2
 10596                                  
 10597                                  ;-1082             prs(NameA); 
 10598                                  
 10599 00004DC9 8D06[4100]               lea  ax, [NameA]
 10600 00004DCD 50                       push ax
 10601 00004DCE E88CF2                   call prs
 10602 00004DD1 83C402                   add  sp, 2
 10603                                  
 10604                                  ;-1083         }
 10605                                  
 10606                                  
 10607                                  ;-1084         i++; 
 10608                                  
 10609                                  .checkcalls567:
 10610 00004DD4 FF46FE                   inc  word[bp-2]
 10611                                  
 10612                                  ;-1085     }
 10613                                  
 10614                                  
 10615                                  ;-1086     prs("\n; Number of unresolved CALLs :"); printint51(k);
 10616                                  
 10617 00004DD7 E966FF                   jmp .checkcalls562
 10618                                  .checkcalls563:
 10619 00004DDA 68[2D4E]                 push checkcalls_2
 10620 00004DDD E87DF2                   call prs
 10621 00004DE0 83C402                   add  sp, 2
 10622 00004DE3 FF76FA                   push word [bp-6]
 10623 00004DE6 E80BF4                   call printint51
 10624 00004DE9 83C402                   add  sp, 2
 10625                                  
 10626                                  ;-1087     if (k!=0) error1("At least 1 function is missing! ");
 10627                                  
 10628 00004DEC 8B46FA                   mov ax, [bp-6]
 10629 00004DEF 83F800                   cmp ax, 0
 10630 00004DF2 0F840C00                 je  .checkcalls568
 10631 00004DF6 68[4E4E]                 push checkcalls_3
 10632 00004DF9 E8C0F5                   call error1
 10633 00004DFC 83C402                   add  sp, 2
 10634                                  
 10635                                  ;-1088     else prs(" All FUNCTIONs in place");
 10636                                  
 10637 00004DFF E90900                   jmp .checkcalls569
 10638                                  .checkcalls568:
 10639 00004E02 68[6F4E]                 push checkcalls_4
 10640 00004E05 E855F2                   call prs
 10641 00004E08 83C402                   add  sp, 2
 10642                                  
 10643                                  ;-1089 }
 10644                                  
 10645                                  .checkcalls569:
 10646                                  
 10647                                  ;-1090 
 10648                                  
 10649                                  
 10650                                  ;-1091 int parse() { 
 10651 00004E0B C9                       LEAVE
 10652 00004E0C C3                       ret
 10653 00004E0D 5C6E205C6E3B206D69-     checkcalls_0 db "\n \n; missing functions: ",0
 10654 00004E16 7373696E672066756E-
 10655 00004E1F 6374696F6E733A2000 
 10656 00004E28 5C6E3B2000              checkcalls_1 db "\n; ",0
 10657 00004E2D 5C6E3B204E756D6265-     checkcalls_2 db "\n; Number of unresolved CALLs :",0
 10658 00004E36 72206F6620756E7265-
 10659 00004E3F 736F6C766564204341-
 10660 00004E48 4C4C73203A00       
 10661 00004E4E 4174206C6561737420-     checkcalls_3 db "At least 1 function is missing! ",0
 10662 00004E57 312066756E6374696F-
 10663 00004E60 6E206973206D697373-
 10664 00004E69 696E67212000       
 10665 00004E6F 20416C6C2046554E43-     checkcalls_4 db " All FUNCTIONs in place",0
 10666 00004E78 54494F4E7320696E20-
 10667 00004E81 706C61636500       
 10668                                  ENDP
 10669                                  
 10670                                  parse: PROC
 10671                                  
 10672                                  ;-1092     token=getlex(); 
 10673                                  
 10674 00004E87 E871E9                   call getlex
 10675 00004E8A A3[1E00]                 mov word [token], ax
 10676                                  
 10677                                  ;-1093     do {
 10678                                  
 10679                                  .parse570:
 10680                                  
 10681                                  ;-1094         if (token <= 0) return 1;
 10682                                  
 10683 00004E8D A1[1E00]                 mov ax, [token]
 10684 00004E90 83F800                   cmp ax, 0
 10685 00004E93 0F8F0600                 jg  .parse571
 10686 00004E97 B80100                   mov ax, 1
 10687 00004E9A E96500                   jmp .retnparse
 10688                                  
 10689                                  ;-1095         if (istoken('#')) {
 10690                                  
 10691                                  .parse571:
 10692 00004E9D 6A23                     push 35
 10693 00004E9F E886F0                   call istoken
 10694 00004EA2 83C402                   add  sp, 2
 10695 00004EA5 08C0                     or  al, al
 10696 00004EA7 0F843600                 je .parse572
 10697                                  
 10698                                  ;-1096              if (istoken(T_DEFINE))  dodefine();
 10699                                  
 10700 00004EAB 68FF01                   push 511
 10701 00004EAE E877F0                   call istoken
 10702 00004EB1 83C402                   add  sp, 2
 10703 00004EB4 08C0                     or  al, al
 10704 00004EB6 0F840600                 je .parse573
 10705 00004EBA E807E2                   call dodefine
 10706                                  
 10707                                  ;-1097         else if (istoken(T_INCLUDE)) doinclude();
 10708                                  
 10709 00004EBD E91E00                   jmp .parse574
 10710                                  .parse573:
 10711 00004EC0 68FE01                   push 510
 10712 00004EC3 E862F0                   call istoken
 10713 00004EC6 83C402                   add  sp, 2
 10714 00004EC9 08C0                     or  al, al
 10715 00004ECB 0F840600                 je .parse575
 10716 00004ECF E80CE1                   call doinclude
 10717                                  
 10718                                  ;-1098         else error1("define or include expected");  
 10719                                  
 10720 00004ED2 E90900                   jmp .parse576
 10721                                  .parse575:
 10722 00004ED5 68[034F]                 push parse_0
 10723 00004ED8 E8E1F4                   call error1
 10724 00004EDB 83C402                   add  sp, 2
 10725                                  
 10726                                  ;-1099         }
 10727                                  
 10728                                  .parse576:
 10729                                  .parse574:
 10730                                  
 10731                                  ;-1100     else{ 
 10732                                  
 10733 00004EDE E91600                   jmp .parse577
 10734                                  .parse572:
 10735                                  
 10736                                  ;-1101         typeName();  
 10737                                  
 10738 00004EE1 E848BB                   call typeName
 10739                                  
 10740                                  ;-1102         if (token=='(') dofunc();  
 10741                                  
 10742 00004EE4 A1[1E00]                 mov ax, [token]
 10743 00004EE7 83F828                   cmp ax, 40
 10744 00004EEA 0F850600                 jne .parse578
 10745 00004EEE E84FBE                   call dofunc
 10746                                  
 10747                                  ;-1103         else doglob(); }
 10748                                  
 10749 00004EF1 E90300                   jmp .parse579
 10750                                  .parse578:
 10751 00004EF4 E8F9B4                   call doglob
 10752                                  .parse579:
 10753                                  
 10754                                  ;-1104     } while(1);
 10755                                  
 10756                                  .parse577:
 10757 00004EF7 B80100                   mov ax, 1
 10758 00004EFA 08C0                     or  al, al
 10759 00004EFC 0F840200                 je .parse580
 10760 00004F00 EB8B                     jmp .parse570
 10761                                  .parse580:
 10762                                  
 10763                                  ;-1105 }
 10764                                  
 10765                                  
 10766                                  ;-1106 
 10767                                  
 10768                                  
 10769                                  ;-1107 int getfirstchar() { 
 10770                                  
 10771                                   .retnparse:
 10772 00004F02 C3                       ret
 10773 00004F03 646566696E65206F72-     parse_0 db "define or include expected",0
 10774 00004F0C 20696E636C75646520-
 10775 00004F15 657870656374656400 
 10776                                  ENDP
 10777                                  
 10778                                  getfirstchar: PROC
 10779                                  
 10780                                  ;-1108     fgetsp=&fgetsdest; 
 10781                                  
 10782 00004F1E B887BC                   mov ax, fgetsdest
 10783 00004F21 A3[6400]                 mov word [fgetsp], ax
 10784                                  
 10785                                  ;-1109     *fgetsp=0; 
 10786                                  
 10787 00004F24 B80000                   mov ax, 0
 10788 00004F27 8B1E[6400]               mov  bx, [fgetsp]
 10789 00004F2B 8807                     mov  [bx], al
 10790                                  
 10791                                  ;-1110     thechar=fgets1(); 
 10792                                  
 10793 00004F2D E81BF3                   call fgets1
 10794 00004F30 A2[2300]                 mov byte [thechar], al
 10795                                  
 10796                                  ;-1111     }
 10797                                  
 10798                                  
 10799                                  ;-1112 
 10800                                  
 10801                                  
 10802                                  ;-1113 char *arglen=0x80; char *argv=0x82;
 10803                                  
 10804 00004F33 C3                       ret
 10805                                  ENDP
 10806 00004F34 8000                    arglen dw 128
 10807 00004F36 8200                    argv dw 130
 10808                                  
 10809                                  ;-1114 int getarg() { 
 10810                                  
 10811                                  
 10812                                  getarg: PROC
 10813                                  
 10814                                  ;-1115     int arglen1; int i; char *c;
 10815                                  
 10816                                  
 10817                                  ;-1116     arglen1=*arglen;
 10818                                  
 10819                                  ;Function : getarg, Number of local variables: 3
 10820                                  ;   # type sign width addr used name   list of local variables
 10821                                  ;  200 var sign word  1115 NULL arglen1 = bp-2
 10822                                  ;  201 var sign word  1115 NULL i = bp-4
 10823                                  ;  202 ptr sign byte  1115 NULL c = bp-6;
 10824 00004F38 C8060000                 ENTER  6,0
 10825 00004F3C 8B1E[344F]               mov bx, [arglen]
 10826 00004F40 8A07                     mov al, [bx]
 10827 00004F42 B400                     mov ah, 0
 10828 00004F44 8946FE                   mov [bp-2], ax
 10829                                  
 10830                                  ;-1117     if (arglen1 == 0) { 
 10831                                  
 10832 00004F47 8B46FE                   mov ax, [bp-2]
 10833 00004F4A 83F800                   cmp ax, 0
 10834 00004F4D 0F851C00                 jne .getarg581
 10835                                  
 10836                                  ;-1118         cputs(Version1); 
 10837                                  
 10838 00004F51 8D06[0300]               lea  ax, [Version1]
 10839 00004F55 50                       push ax
 10840 00004F56 E83DB1                   call cputs
 10841 00004F59 83C402                   add  sp, 2
 10842                                  
 10843                                  ;-1119         cputs(" Usage: A.COM in_file[.C]: "); 
 10844                                  
 10845 00004F5C 68[9B50]                 push getarg_0
 10846 00004F5F E834B1                   call cputs
 10847 00004F62 83C402                   add  sp, 2
 10848                                  
 10849                                  ;-1120         exitR(3);
 10850                                  
 10851 00004F65 6A03                     push 3
 10852 00004F67 E89EB1                   call exitR
 10853 00004F6A 83C402                   add  sp, 2
 10854                                  
 10855                                  ;-1121         }
 10856                                  
 10857                                  
 10858                                  ;-1122     i=arglen1+129; 
 10859                                  
 10860                                  .getarg581:
 10861 00004F6D 8B46FE                   mov ax, [bp-2]
 10862 00004F70 058100                   add ax, 129
 10863 00004F73 8946FC                   mov [bp-4], ax
 10864                                  
 10865                                  ;-1123     *i=0;
 10866                                  
 10867 00004F76 B80000                   mov ax, 0
 10868 00004F79 8B5EFC                   mov  bx, [bp-4]
 10869 00004F7C 8907                     mov  [bx], ax
 10870                                  
 10871                                  ;-1124     arglen1--;
 10872                                  
 10873 00004F7E FF4EFE                   dec  word[bp-2]
 10874                                  
 10875                                  ;-1125     toupper(argv);     
 10876                                  
 10877 00004F81 FF36[364F]               push word [argv]
 10878 00004F85 E8B3B2                   call toupper
 10879 00004F88 83C402                   add  sp, 2
 10880                                  
 10881                                  ;-1126     strcpy(namein, argv);
 10882                                  
 10883 00004F8B FF36[364F]               push word [argv]
 10884 00004F8F 8D06666E                 lea  ax, [namein]
 10885 00004F93 50                       push ax
 10886 00004F94 E8D1B1                   call strcpy
 10887 00004F97 83C404                   add  sp, 4
 10888                                  
 10889                                  ;-1127     if (instr1(namein, '.') == 0) strcat1(namein, ".C");
 10890                                  
 10891 00004F9A 6A2E                     push 46
 10892 00004F9C 8D06666E                 lea  ax, [namein]
 10893 00004FA0 50                       push ax
 10894 00004FA1 E840B2                   call instr1
 10895 00004FA4 83C404                   add  sp, 4
 10896 00004FA7 83F800                   cmp ax, 0
 10897 00004FAA 0F850E00                 jne .getarg582
 10898 00004FAE 68[B750]                 push getarg_1
 10899 00004FB1 8D06666E                 lea  ax, [namein]
 10900 00004FB5 50                       push ax
 10901 00004FB6 E85DB2                   call strcat1
 10902 00004FB9 83C404                   add  sp, 4
 10903                                  
 10904                                  ;-1128     strcpy(namelst, namein); 
 10905                                  
 10906                                  .getarg582:
 10907 00004FBC 8D06666E                 lea  ax, [namein]
 10908 00004FC0 50                       push ax
 10909 00004FC1 8D06A96E                 lea  ax, [namelst]
 10910 00004FC5 50                       push ax
 10911 00004FC6 E89FB1                   call strcpy
 10912 00004FC9 83C404                   add  sp, 4
 10913                                  
 10914                                  ;-1129     i=strlen(namelst); 
 10915                                  
 10916 00004FCC 8D06A96E                 lea  ax, [namelst]
 10917 00004FD0 50                       push ax
 10918 00004FD1 E86CB1                   call strlen
 10919 00004FD4 83C402                   add  sp, 2
 10920 00004FD7 8946FC                   mov [bp-4], ax
 10921                                  
 10922                                  ;-1130     i--; 
 10923                                  
 10924 00004FDA FF4EFC                   dec  word[bp-4]
 10925                                  
 10926                                  ;-1131     c=&namelst+i; 
 10927                                  
 10928 00004FDD B8A96E                   mov ax, namelst
 10929 00004FE0 0346FC                   add ax, [bp-4]
 10930 00004FE3 8946FA                   mov [bp-6], ax
 10931                                  
 10932                                  ;-1132     *c='S';
 10933                                  
 10934 00004FE6 B85300                   mov ax, 83
 10935 00004FE9 8B5EFA                   mov  bx, [bp-6]
 10936 00004FEC 8807                     mov  [bx], al
 10937                                  
 10938                                  ;-1133 
 10939                                  
 10940                                  
 10941                                  ;-1134     fdin=openR (namein);
 10942                                  
 10943 00004FEE 8D06666E                 lea  ax, [namein]
 10944 00004FF2 50                       push ax
 10945 00004FF3 E8E2B0                   call openR
 10946 00004FF6 83C402                   add  sp, 2
 10947 00004FF9 A3[1A00]                 mov word [fdin], ax
 10948                                  
 10949                                  ;-1135     if(DOS_ERR){
 10950                                  
 10951 00004FFC A1[7000]                 mov ax, [DOS_ERR]
 10952 00004FFF 08C0                     or  al, al
 10953 00005001 0F841C00                 je .getarg583
 10954                                  
 10955                                  ;-1136         cputs("Source file missing (.C): "); 
 10956                                  
 10957 00005005 68[BA50]                 push getarg_2
 10958 00005008 E88BB0                   call cputs
 10959 0000500B 83C402                   add  sp, 2
 10960                                  
 10961                                  ;-1137         cputs(namein); 
 10962                                  
 10963 0000500E 8D06666E                 lea  ax, [namein]
 10964 00005012 50                       push ax
 10965 00005013 E880B0                   call cputs
 10966 00005016 83C402                   add  sp, 2
 10967                                  
 10968                                  ;-1138         exitR(1); 
 10969                                  
 10970 00005019 6A01                     push 1
 10971 0000501B E8EAB0                   call exitR
 10972 0000501E 83C402                   add  sp, 2
 10973                                  
 10974                                  ;-1139         }
 10975                                  
 10976                                  
 10977                                  ;-1140     fdout=creatR(namelst);
 10978                                  
 10979                                  .getarg583:
 10980 00005021 8D06A96E                 lea  ax, [namelst]
 10981 00005025 50                       push ax
 10982 00005026 E8BEB0                   call creatR
 10983 00005029 83C402                   add  sp, 2
 10984 0000502C A3[1C00]                 mov word [fdout], ax
 10985                                  
 10986                                  ;-1141     if(DOS_ERR){
 10987                                  
 10988 0000502F A1[7000]                 mov ax, [DOS_ERR]
 10989 00005032 08C0                     or  al, al
 10990 00005034 0F841C00                 je .getarg584
 10991                                  
 10992                                  ;-1142         cputs("list file not creatable: ");
 10993                                  
 10994 00005038 68[D550]                 push getarg_3
 10995 0000503B E858B0                   call cputs
 10996 0000503E 83C402                   add  sp, 2
 10997                                  
 10998                                  ;-1143         cputs(namelst);
 10999                                  
 11000 00005041 8D06A96E                 lea  ax, [namelst]
 11001 00005045 50                       push ax
 11002 00005046 E84DB0                   call cputs
 11003 00005049 83C402                   add  sp, 2
 11004                                  
 11005                                  ;-1144         exitR(2);
 11006                                  
 11007 0000504C 6A02                     push 2
 11008 0000504E E8B7B0                   call exitR
 11009 00005051 83C402                   add  sp, 2
 11010                                  
 11011                                  ;-1145         }
 11012                                  
 11013                                  
 11014                                  ;-1146     prs("\n; ");
 11015                                  
 11016                                  .getarg584:
 11017 00005054 68[EF50]                 push getarg_4
 11018 00005057 E803F0                   call prs
 11019 0000505A 83C402                   add  sp, 2
 11020                                  
 11021                                  ;-1147     prs(Version1);
 11022                                  
 11023 0000505D 8D06[0300]               lea  ax, [Version1]
 11024 00005061 50                       push ax
 11025 00005062 E8F8EF                   call prs
 11026 00005065 83C402                   add  sp, 2
 11027                                  
 11028                                  ;-1148     prs(", Source: "); prs(namein);  
 11029                                  
 11030 00005068 68[F450]                 push getarg_5
 11031 0000506B E8EFEF                   call prs
 11032 0000506E 83C402                   add  sp, 2
 11033 00005071 8D06666E                 lea  ax, [namein]
 11034 00005075 50                       push ax
 11035 00005076 E8E4EF                   call prs
 11036 00005079 83C402                   add  sp, 2
 11037                                  
 11038                                  ;-1149     prs(", Output asm: "); prs(namelst);
 11039                                  
 11040 0000507C 68[FF50]                 push getarg_6
 11041 0000507F E8DBEF                   call prs
 11042 00005082 83C402                   add  sp, 2
 11043 00005085 8D06A96E                 lea  ax, [namelst]
 11044 00005089 50                       push ax
 11045 0000508A E8D0EF                   call prs
 11046 0000508D 83C402                   add  sp, 2
 11047                                  
 11048                                  ;-1150     prs("\norg  256 \njmp main");
 11049                                  
 11050 00005090 68[0E51]                 push getarg_7
 11051 00005093 E8C7EF                   call prs
 11052 00005096 83C402                   add  sp, 2
 11053                                  
 11054                                  ;-1151 }
 11055                                  
 11056                                  
 11057                                  ;-1152 
 11058                                  
 11059                                  
 11060                                  ;-1153 int setblock(unsigned int i) {
 11061 00005099 C9                       LEAVE
 11062 0000509A C3                       ret
 11063 0000509B 2055736167653A2041-     getarg_0 db " Usage: A.COM in_file[.C]: ",0
 11064 000050A4 2E434F4D20696E5F66-
 11065 000050AD 696C655B2E435D3A20-
 11066 000050B6 00                 
 11067 000050B7 2E4300                  getarg_1 db ".C",0
 11068 000050BA 536F75726365206669-     getarg_2 db "Source file missing (.C): ",0
 11069 000050C3 6C65206D697373696E-
 11070 000050CC 6720282E43293A2000 
 11071 000050D5 6C6973742066696C65-     getarg_3 db "list file not creatable: ",0
 11072 000050DE 206E6F742063726561-
 11073 000050E7 7461626C653A2000   
 11074 000050EF 5C6E3B2000              getarg_4 db "\n; ",0
 11075 000050F4 2C20536F757263653A-     getarg_5 db ", Source: ",0
 11076 000050FD 2000               
 11077 000050FF 2C204F757470757420-     getarg_6 db ", Output asm: ",0
 11078 00005108 61736D3A2000       
 11079 0000510E 5C6E6F726720203235-     getarg_7 db "\norg  256 \njmp main",0
 11080 00005117 36205C6E6A6D70206D-
 11081 00005120 61696E00           
 11082                                  ENDP
 11083                                  
 11084                                  setblock: PROC
 11085                                  
 11086                                  ;-1154     DOS_ERR=0; 
 11087                                  
 11088                                  ;Function : setblock, Number of local variables: 1
 11089                                  ;   # type sign width addr used name   list of local variables
 11090                                  ;  200 var unsg word  1153 NULL i = bp+4;
 11091 00005124 C8000000                 ENTER  0,0
 11092 00005128 B80000                   mov ax, 0
 11093 0000512B A3[7000]                 mov word [DOS_ERR], ax
 11094                                  
 11095                                  ;-1155     _BX=i; 
 11096                                  
 11097 0000512E 8B5E04                   mov  bx, [bp+4]
 11098                                  
 11099                                  ;-1156     _ ax=cs; 
 11100                                  
 11101 00005131 8CC8                     mov  ax, cs
 11102                                  
 11103                                  ;-1157     _ es=ax; 
 11104                                  
 11105 00005133 8EC0                     mov  es, ax
 11106                                  
 11107                                  ;-1158     _AX=0x4A00; 
 11108                                  
 11109 00005135 B8004A                   mov  ax, 18944
 11110                                  
 11111                                  ;-1159     DosInt();                                                             
 11112                                  
 11113 00005138 E894AF                   call DosInt
 11114                                  
 11115                                  ;-1160 }
 11116                                  
 11117                                  
 11118                                  ;-1161 int main() {
 11119 0000513B C9                       LEAVE
 11120 0000513C C3                       ret
 11121                                  ENDP
 11122                                  
 11123                                  main: PROC
 11124                                  
 11125                                  ;-1162     getarg();
 11126                                  
 11127 0000513D E8F8FD                   call getarg
 11128                                  
 11129                                  ;-1163 setblock(4096);
 11130                                  
 11131 00005140 680010                   push 4096
 11132 00005143 E8DEFF                   call setblock
 11133 00005146 83C402                   add  sp, 2
 11134                                  
 11135                                  ;-1164 if (DOS_ERR) error1("SetBlock , AX=");
 11136                                  
 11137 00005149 A1[7000]                 mov ax, [DOS_ERR]
 11138 0000514C 08C0                     or  al, al
 11139 0000514E 0F840900                 je .main585
 11140 00005152 68[9851]                 push main_0
 11141 00005155 E864F2                   call error1
 11142 00005158 83C402                   add  sp, 2
 11143                                  
 11144                                  ;-1165 segE=allocmem(4096);
 11145                                  
 11146                                  .main585:
 11147 0000515B 680010                   push 4096
 11148 0000515E E85800                   call allocmem
 11149 00005161 83C402                   add  sp, 2
 11150 00005164 A3[6600]                 mov word [segE], ax
 11151                                  
 11152                                  ;-1166 if (DOS_ERR)  error1("alloc memory, AX=");
 11153                                  
 11154 00005167 A1[7000]                 mov ax, [DOS_ERR]
 11155 0000516A 08C0                     or  al, al
 11156 0000516C 0F840900                 je .main586
 11157 00005170 68[A751]                 push main_1
 11158 00005173 E846F2                   call error1
 11159 00005176 83C402                   add  sp, 2
 11160                                  
 11161                                  ;-1167     CNameTop=0;
 11162                                  
 11163                                  .main586:
 11164 00005179 B80000                   mov ax, 0
 11165 0000517C A3[6200]                 mov word [CNameTop], ax
 11166                                  
 11167                                  ;-1168     coname=0;
 11168                                  
 11169 0000517F B80000                   mov ax, 0
 11170 00005182 A2606D                   mov byte [coname], al
 11171                                  
 11172                                  ;-1169     orgData=ORGDATAORIG;
 11173                                  
 11174 00005185 A1[1000]                 mov ax, [ORGDATAORIG]
 11175 00005188 A3[1200]                 mov word [orgData], ax
 11176                                  
 11177                                  ;-1170     getfirstchar();
 11178                                  
 11179 0000518B E890FD                   call getfirstchar
 11180                                  
 11181                                  ;-1171     parse();
 11182                                  
 11183 0000518E E8F6FC                   call parse
 11184                                  
 11185                                  ;-1172   checkcalls(); 
 11186                                  
 11187 00005191 E893FB                   call checkcalls
 11188                                  
 11189                                  ;-1173   epilog();
 11190                                  
 11191 00005194 E8CAF8                   call epilog
 11192                                  
 11193                                  ;-1174 }
 11194                                  
 11195                                  
 11196                                  ;-1175 
 11197                                  
 11198                                  
 11199                                  ;-1176 
 11200                                  
 11201                                  
 11202                                  ;-1177 
 11203                                  
 11204                                  
 11205                                  ;-1178 int allocmem(unsigned int i) { unsigned int vAX; unsigned int vBX;
 11206                                  
 11207 00005197 C3                       ret
 11208 00005198 536574426C6F636B20-     main_0 db "SetBlock , AX=",0
 11209 000051A1 2C2041583D00       
 11210 000051A7 616C6C6F63206D656D-     main_1 db "alloc memory, AX=",0
 11211 000051B0 6F72792C2041583D00 
 11212                                  ENDP
 11213                                  
 11214                                  allocmem: PROC
 11215                                  
 11216                                  ;-1179   DOS_ERR=0; _BX=i;  _AX=0x4800; DosInt(); _ vAX=ax; _ vBX=bx;
 11217                                  
 11218                                  ;Function : allocmem, Number of local variables: 3
 11219                                  ;   # type sign width addr used name   list of local variables
 11220                                  ;  200 var unsg word  1178 NULL i = bp+4
 11221                                  ;  201 var unsg word  1178 NULL vAX = bp-2
 11222                                  ;  202 var unsg word  1178 NULL vBX = bp-4;
 11223 000051B9 C8040000                 ENTER  4,0
 11224 000051BD B80000                   mov ax, 0
 11225 000051C0 A3[7000]                 mov word [DOS_ERR], ax
 11226 000051C3 8B5E04                   mov  bx, [bp+4]
 11227 000051C6 B80048                   mov  ax, 18432
 11228 000051C9 E803AF                   call DosInt
 11229 000051CC 8946FE                  mov [bp-2], ax
 11230 000051CF 895EFC                  mov [bp-4], bx
 11231                                  
 11232                                  ;-1180   if(DOS_ERR) return vBX;   return vAX;
 11233                                  
 11234 000051D2 A1[7000]                 mov ax, [DOS_ERR]
 11235 000051D5 08C0                     or  al, al
 11236 000051D7 0F840600                 je .allocmem587
 11237 000051DB 8B46FC                   mov ax, [bp-4]
 11238 000051DE E90600                   jmp .retnallocmem
 11239                                  .allocmem587:
 11240 000051E1 8B46FE                   mov ax, [bp-2]
 11241 000051E4 E90000                   jmp .retnallocmem
 11242                                  
 11243                                  ;-1181 }
 11244                                  
 11245                                  
 11246                                  ;-1182 int to_far(char *dest, char *src) {
 11247                                  
 11248 000051E7 C9                       .retnallocmem: LEAVE
 11249 000051E8 C3                       ret
 11250                                  ENDP
 11251                                  
 11252                                  to_far: PROC
 11253                                  
 11254                                  ;-1183   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
 11255                                  
 11256                                  ;Function : to_far, Number of local variables: 2
 11257                                  ;   # type sign width addr used name   list of local variables
 11258                                  ;  200 ptr sign byte  1182 NULL dest = bp+4
 11259                                  ;  201 ptr sign byte  1182 NULL src = bp+6;
 11260 000051E9 C8000000                 ENTER  0,0
 11261 000051ED A1[6600]                 mov ax, [segE]
 11262 000051F0 8EC0                     mov  es, ax
 11263 000051F2 8B7606                   mov  si, [bp+6]
 11264 000051F5 8B7E04                   mov  di, [bp+4]
 11265                                  
 11266                                  ;-1184   asm cld
 11267                                  
 11268 000051F8 FC                       cld
 11269                                  
 11270                                  ;-1185   do{
 11271                                  
 11272                                  .to_far588:
 11273                                  
 11274                                  ;-1186   asm lodsb  ; inc si
 11275                                  
 11276 000051F9 AC                       lodsb  ; inc si
 11277                                  
 11278                                  ;-1187   asm stosb  ; inc di
 11279                                  
 11280 000051FA AA                       stosb  ; inc di
 11281                                  
 11282                                  ;-1188   } while (al != 0);
 11283                                  
 11284 000051FB 3C00                     cmp  al, 0
 11285 000051FD 0F840200                 je  .to_far589
 11286 00005201 EBF6                     jmp .to_far588
 11287                                  .to_far589:
 11288                                  
 11289                                  ;-1189 }
 11290                                  
 11291                                  
 11292                                  ;-1190 int from_far(char *dest, char *src) {
 11293 00005203 C9                       LEAVE
 11294 00005204 C3                       ret
 11295                                  ENDP
 11296                                  
 11297                                  from_far: PROC
 11298                                  
 11299                                  ;-1191   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
 11300                                  
 11301                                  ;Function : from_far, Number of local variables: 2
 11302                                  ;   # type sign width addr used name   list of local variables
 11303                                  ;  200 ptr sign byte  1190 NULL dest = bp+4
 11304                                  ;  201 ptr sign byte  1190 NULL src = bp+6;
 11305 00005205 C8000000                 ENTER  0,0
 11306 00005209 A1[6600]                 mov ax, [segE]
 11307 0000520C 8EC0                     mov  es, ax
 11308 0000520E 8B7606                   mov  si, [bp+6]
 11309 00005211 8B7E04                   mov  di, [bp+4]
 11310                                  
 11311                                  ;-1192   do{
 11312                                  
 11313                                  .from_far590:
 11314                                  
 11315                                  ;-1193   asm mov al, [es:si]
 11316                                  
 11317 00005214 268A04                   mov al, [es:si]
 11318                                  
 11319                                  ;-1194   asm inc si
 11320                                  
 11321 00005217 46                       inc si
 11322                                  
 11323                                  ;-1195   asm mov [di], al
 11324                                  
 11325 00005218 8805                     mov [di], al
 11326                                  
 11327                                  ;-1196   asm inc di
 11328                                  
 11329 0000521A 47                       inc di
 11330                                  
 11331                                  ;-1197   } while (al != 0);
 11332                                  
 11333 0000521B 3C00                     cmp  al, 0
 11334 0000521D 0F840200                 je  .from_far591
 11335 00005221 EBF1                     jmp .from_far590
 11336                                  .from_far591:
 11337                                  
 11338                                  ;-1198 }
 11339                                  
 11340                                  
 11341                                  ;-1199 
 11342 00005223 C9                       LEAVE
 11343 00005224 C3                       ret
 11344                                  ENDP
 11345                                   
 11346                                  ; missing functions: 
 11347                                  ; Number of unresolved CALLs :    0 All FUNCTIONs in place
 11348                                   
 11349                                  ;   # type sign width  adr used name   list of global variables
 11350                                  
 11351                                  ;    1 arr sign byte     1    2 Version1[12]
 11352                                  ;    2 def unsg byte     2    - LSTART=200
 11353                                  ;    3 def unsg byte     3    - VARMAX=300
 11354                                  ;    4 def unsg byte     4    - GNAMEMAX=4800
 11355                                  ;    5 def unsg byte     5    - FUNCMAX=300
 11356                                  ;    6 def unsg byte     6    - FNAMEMAX=4800
 11357                                  ;    7 def unsg byte     7    - CALLMAX=2000
 11358                                  ;    8 def unsg byte     8    - IDLENMAX=15
 11359                                  ;    9 def unsg byte     9    - COLUMNMAX=128
 11360                                  ;   10 def unsg byte    11    - T_NAME=256
 11361                                  ;   11 def unsg byte    12    - T_CONST=257
 11362                                  ;   12 def unsg byte    13    - T_STRING=258
 11363                                  ;   13 def unsg byte    14    - T_INCLUDE=510
 11364                                  ;   14 def unsg byte    15    - T_DEFINE=511
 11365                                  ;   15 def unsg byte    16    - T_RETURN=512
 11366                                  ;   16 def unsg byte    17    - T_IF=513
 11367                                  ;   17 def unsg byte    18    - T_ELSE=514
 11368                                  ;   18 def unsg byte    19    - T_WHILE=515
 11369                                  ;   19 def unsg byte    20    - T_DO=516
 11370                                  ;   20 def unsg byte    21    - T_INT=517
 11371                                  ;   21 def unsg byte    22    - T_ASM=518
 11372                                  ;   22 def unsg byte    23    - T_ASMBLOCK=519
 11373                                  ;   23 def unsg byte    24    - T_EMIT=520
 11374                                  ;   24 def unsg byte    25    - T_GOTO=521
 11375                                  ;   25 def unsg byte    26    - T_VOID=529
 11376                                  ;   26 def unsg byte    27    - T_CHAR=530
 11377                                  ;   27 def unsg byte    28    - T_SIGNED=531
 11378                                  ;   28 def unsg byte    29    - T_UNSIGNED=532
 11379                                  ;   29 def unsg byte    30    - T_LONG=533
 11380                                  ;   30 def unsg byte    31    - T_EQ=806
 11381                                  ;   31 def unsg byte    32    - T_NE=807
 11382                                  ;   32 def unsg byte    33    - T_GE=811
 11383                                  ;   33 def unsg byte    34    - T_LE=824
 11384                                  ;   34 def unsg byte    35    - T_PLUSPLUS=1219
 11385                                  ;   35 def unsg byte    36    - T_MINUSMINUS=1225
 11386                                  ;   36 def unsg byte    37    - T_PLUSASS=1230
 11387                                  ;   37 def unsg byte    38    - T_MINUSASS=1231
 11388                                  ;   38 def unsg byte    39    - T_MULASS=1232
 11389                                  ;   39 def unsg byte    40    - T_DIVASS=1233
 11390                                  ;   40 def unsg byte    41    - T_ANDASS=1234
 11391                                  ;   41 def unsg byte    42    - T_ORASS=1235
 11392                                  ;   42 def unsg byte    43    - T_LESSLESS=1240
 11393                                  ;   43 def unsg byte    44    - T_GREATGREAT=1241
 11394                                  ;   44 var unsg word    46    2 ORGDATAORIG
 11395                                  ;   45 var unsg word    47   10 orgData
 11396                                  ;   46 def unsg byte    48    - COMAX=3000
 11397                                  ;   47 arr sign byte    49    4 co[3000]
 11398                                  ;   48 var sign word    50    4 maxco
 11399                                  ;   49 var sign word    51    3 maxco1
 11400                                  ;   50 def unsg byte    52    - CMDLENMAX=67
 11401                                  ;   51 arr sign byte    53    3 coname[67]
 11402                                  ;   52 arr sign byte    54  103 symbol[128]
 11403                                  ;   53 arr sign byte    55   12 fname[67]
 11404                                  ;   54 arr sign byte    56    9 namein[67]
 11405                                  ;   55 arr sign byte    57    7 namelst[67]
 11406                                  ;   56 arr sign byte    58    2 archivename[67]
 11407                                  ;   57 ptr sign byte    59    5 cloc
 11408                                  ;   58 var sign word    60    6 fdin
 11409                                  ;   59 var sign word    61    4 fdout
 11410                                  ;   60 var sign word    62   41 token
 11411                                  ;   61 var sign byte    63    1 globC
 11412                                  ;   62 var sign word    64    3 column
 11413                                  ;   63 var sign byte    65   28 thechar
 11414                                  ;   64 var sign word    66    9 iscmp
 11415                                  ;   65 var sign word    67    4 nconst
 11416                                  ;   66 var sign word    68    3 nreturn
 11417                                  ;   67 var sign word    69   12 nlabel
 11418                                  ;   68 var sign word    70   24 GTop
 11419                                  ;   69 var sign word    71   20 LTop
 11420                                  ;   70 var unsg word    72   44 lexval
 11421                                  ;   71 var sign word    73    6 typei
 11422                                  ;   72 var sign byte    73    8 istype
 11423                                  ;   73 var sign word    74    6 signi
 11424                                  ;   74 var sign byte    74    5 issign
 11425                                  ;   75 var sign word    75    9 widthi
 11426                                  ;   76 var sign byte    75   19 iswidth
 11427                                  ;   77 arr sign byte    76   11 GType[300]
 11428                                  ;   78 arr sign byte    77    5 GSign[300]
 11429                                  ;   79 arr sign byte    78    5 GWidth[300]
 11430                                  ;   80 arr sign word    79    4 GAdr[300]
 11431                                  ;   81 arr sign word    80    6 GUsed[300]
 11432                                  ;   82 arr sign word    81   11 GData[300]
 11433                                  ;   83 arr sign byte    82    2 GNameField[4800]
 11434                                  ;   84 var sign word    83   26 wi
 11435                                  ;   85 var sign word    84   13 FTop
 11436                                  ;   86 var sign word    85    8 CTop
 11437                                  ;   87 arr sign byte    86    2 FType[300]
 11438                                  ;   88 arr sign byte    87    3 CType[2000]
 11439                                  ;   89 arr sign word    88    2 FAdr[300]
 11440                                  ;   90 arr sign word    89    4 CAdr[2000]
 11441                                  ;   91 arr sign word    90    4 FCalls[300]
 11442                                  ;   92 arr sign byte    91    5 FNameField[4800]
 11443                                  ;   93 arr sign byte    92    7 NameA[32]
 11444                                  ;   94 arr sign byte    93    5 fgetsdest[128]
 11445                                  ;   95 ptr unsg byte    94    8 CNameTop
 11446                                  ;   96 ptr unsg byte    95   10 fgetsp
 11447                                  ;   97 var unsg word    96    3 segE
 11448                                  ;   98 var unsg word    97   12 lineno
 11449                                  ;   99 var unsg word    98    2 linenoinclude
 11450                                  ;  100 ptr unsg byte    99   17 pt
 11451                                  ;  101 ptr unsg byte   100    8 p1
 11452                                  ;  102 var sign word   101    9 DOS_ERR
 11453                                  ;  103 var sign word   102    3 DOS_NoBytes
 11454                                  ;  104 var sign byte   103    3 DOS_ByteRead
 11455                                  ;  105 arr sign byte   164    2 doglobName[15]
 11456                                  ;  106 var sign word   333    5 mod1
 11457                                  ;  107 var sign word   333   12 ireg1
 11458                                  ;  108 var sign word   333    6 idx1
 11459                                  ;  109 var sign word   333    1 ids1
 11460                                  ;  110 var sign word   333    4 idw1
 11461                                  ;  111 var sign word   333    2 idt1
 11462                                  ;  112 var sign word   333 NULL val1
 11463                                  ;  113 var sign word   334    2 mod2
 11464                                  ;  114 var sign word   334    6 ireg2
 11465                                  ;  115 var sign word   334    6 idx2
 11466                                  ;  116 var sign word   334    1 ids2
 11467                                  ;  117 var sign word   334    4 idw2
 11468                                  ;  118 var sign word   334    2 idt2
 11469                                  ;  119 var sign word   334    2 val2
 11470                                  ;  120 arr sign byte   403    9 ops[5]
 11471                                  ;  121 arr sign byte   445    3 printregstr[74]
 11472                                  ;  122 var sign word   453    1 evalue
 11473                                  ;  123 var sign word   453    1 exprtype
 11474                                  ;  124 arr sign word   607    2 docalltype[10]
 11475                                  ;  125 arr sign word   607    2 docallvalue[10]
 11476                                  ;  126 arr sign byte   608    2 procname[17]
 11477                                  ;  127 arr sign byte   749    2 symboltemp[80]
 11478                                  ;  128 var unsg word  1033    1 MAXUI
 11479                                  ;  129 ptr sign byte  1113    1 arglen
 11480                                  ;  130 ptr sign byte  1113    2 argv
 11481                                  
 11482                                  
 11483                                  ;   # Calls Line Width  Name   list of functions
 11484                                  
 11485                                  ;    0    4  106   writetty
 11486                                  ;    1    1  107   putch
 11487                                  ;    2    6  108   cputs
 11488                                  ;    3    3  109   mkneg
 11489                                  ;    4    8  111   DosInt
 11490                                  ;    5    2  116   openR
 11491                                  ;    6    1  117   creatR
 11492                                  ;    7    2  118   fcloseR
 11493                                  ;    8    4  119   exitR
 11494                                  ;    9    1  120   readRL
 11495                                  ;   10    1  122   fputcR
 11496                                  ;   11    8  125   strlen
 11497                                  ;   12   23  126   strcpy
 11498                                  ;   13   74  127   eqstr
 11499                                  ;   14    2  130   instr1
 11500                                  ;   15    1  131   strcat1
 11501                                  ;   16    1  132   toupper
 11502                                  ;   17    3  135   digit
 11503                                  ;   18    1  140   letter
 11504                                  ;   19    3  150   alnum
 11505                                  ;   20    4  155   a
 11506                                  ;   21   21  156   v
 11507                                  ;   22    4  161   checknamelen
 11508                                  ;   23    1  165   doglob
 11509                                  ;   24   12  214   gettypes
 11510                                  ;   25    9  223   adrofname
 11511                                  ;   26    7  224   adrF
 11512                                  ;   27    4  226   printName
 11513                                  ;   28   12  230   searchname
 11514                                  ;   29    3  234   checkName
 11515                                  ;   30   10  239   typeName
 11516                                  ;   31    3  255   name1
 11517                                  ;   32    1  260   storecall
 11518                                  ;   33    1  266   storefunc
 11519                                  ;   34    2  270   addlocal
 11520                                  ;   35    1  276   checkFunction
 11521                                  ;   36    1  280   dofunc
 11522                                  ;   37    1  323   isvariable
 11523                                  ;   38    3  336   pexpr
 11524                                  ;   39    1  343   constantexpr
 11525                                  ;   40    3  353   exprstart
 11526                                  ;   41    1  355   expr2
 11527                                  ;   42    3  404   doreg1
 11528                                  ;   43    6  423   checkreg
 11529                                  ;   44    6  448   printreg
 11530                                  ;   45    2  454   expr
 11531                                  ;   46    4  503   compoundass
 11532                                  ;   47    2  510   dovar1
 11533                                  ;   48    8  531   rterm
 11534                                  ;   49    1  544   isreg
 11535                                  ;   50   15  562   doreg
 11536                                  ;   51    1  568   doassign
 11537                                  ;   52    1  586   domul
 11538                                  ;   53    2  592   doidiv
 11539                                  ;   54    1  605   domod
 11540                                  ;   55    1  609   docall1
 11541                                  ;   56    1  652   doinclude
 11542                                  ;   57    1  663   dodefine
 11543                                  ;   58    6  679   stmt
 11544                                  ;   59    1  711   doemit
 11545                                  ;   60    3  715   cmpneg
 11546                                  ;   61    7  728   prlabel
 11547                                  ;   62    3  729   prjump
 11548                                  ;   63    1  730   doif
 11549                                  ;   64    1  736   dodo
 11550                                  ;   65    1  740   dowhile
 11551                                  ;   66    4  743   isrelational
 11552                                  ;   67   17  750   getlex
 11553                                  ;   68    1  802   convertdefine
 11554                                  ;   69    1  809   getdigit
 11555                                  ;   70    1  818   getstring
 11556                                  ;   71   32  821   next
 11557                                  ;   72   78  822   istoken
 11558                                  ;   73   36  823   expect
 11559                                  ;   74    6  826   eprc
 11560                                  ;   75    5  827   eprs
 11561                                  ;   76   40  828   prc
 11562                                  ;   77    3  833   prscomment
 11563                                  ;   78    7  835   prnl
 11564                                  ;   79  241  837   prs
 11565                                  ;   80    2  842   eprnum
 11566                                  ;   81    7  844   pint1
 11567                                  ;   82   33  846   prunsign1
 11568                                  ;   83   20  849   printint51
 11569                                  ;   84    2  853   fgets1
 11570                                  ;   85    1  857   printinputline
 11571                                  ;   86    1  879   ifEOL
 11572                                  ;   87    2  890   end1
 11573                                  ;   88   51  895   error1
 11574                                  ;   89    2  915   listproc
 11575                                  ;   90    1  931   listcall
 11576                                  ;   91    1  940   calllisting
 11577                                  ;   92    1  953   countcalls
 11578                                  ;   93    1  964   listfunc
 11579                                  ;   94    1  978   funclisting
 11580                                  ;   95    2  997   listvar
 11581                                  ;   96    1 1034   epilog
 11582                                  ;   97    1 1064   checkcalls
 11583                                  ;   98    2 1091   parse
 11584                                  ;   99    2 1107   getfirstchar
 11585                                  ;  100    1 1114   getarg
 11586                                  ;  101    1 1153   setblock
 11587                                  ;  102 NULL 1161   main
 11588                                  ;  103    1 1178   allocmem
 11589                                  ;  104    1 1182   to_far
 11590                                  ;  105    3 1190   from_far
 11591                                  
 11592                                  ;    #  addr name   list of CALLs
 11593                                  
 11594                                  ;    0     0 writetty
 11595                                  ;    1     9 writetty
 11596                                  ;    2    18 putch
 11597                                  ;    3    24 DosInt
 11598                                  ;    4    31 DosInt
 11599                                  ;    5    38 DosInt
 11600                                  ;    6    45 DosInt
 11601                                  ;    7    52 DosInt
 11602                                  ;    8    59 DosInt
 11603                                  ;    9    66 strcpy
 11604                                  ;   10    73 digit
 11605                                  ;   11    79 letter
 11606                                  ;   12    86 printName
 11607                                  ;   13    96 prc
 11608                                  ;   14   100 printName
 11609                                  ;   15   110 prc
 11610                                  ;   16   114 strlen
 11611                                  ;   17   121 error1
 11612                                  ;   18   128 error1
 11613                                  ;   19   135 error1
 11614                                  ;   20   142 checknamelen
 11615                                  ;   21   155 checkName
 11616                                  ;   22   165 error1
 11617                                  ;   23   172 istoken
 11618                                  ;   24   180 istoken
 11619                                  ;   25   188 prs
 11620                                  ;   26   192 prunsign1
 11621                                  ;   27   202 prs
 11622                                  ;   28   206 prs
 11623                                  ;   29   210 prs
 11624                                  ;   30   214 prs
 11625                                  ;   31   218 prs
 11626                                  ;   32   222 prunsign1
 11627                                  ;   33   232 prs
 11628                                  ;   34   236 expect
 11629                                  ;   35   243 expect
 11630                                  ;   36   250 error1
 11631                                  ;   37   257 prs
 11632                                  ;   38   261 prs
 11633                                  ;   39   265 prs
 11634                                  ;   40   269 strcpy
 11635                                  ;   41   276 expect
 11636                                  ;   42   283 istoken
 11637                                  ;   43   291 prc
 11638                                  ;   44   295 prscomment
 11639                                  ;   45   306 prc
 11640                                  ;   46   310 prs
 11641                                  ;   47   314 strlen
 11642                                  ;   48   321 istoken
 11643                                  ;   49   329 prc
 11644                                  ;   50   333 expect
 11645                                  ;   51   340 prunsign1
 11646                                  ;   52   350 istoken
 11647                                  ;   53   358 expect
 11648                                  ;   54   365 error1
 11649                                  ;   55   372 prs
 11650                                  ;   56   376 prs
 11651                                  ;   57   380 prs
 11652                                  ;   58   384 prs
 11653                                  ;   59   388 prs
 11654                                  ;   60   392 prs
 11655                                  ;   61   396 istoken
 11656                                  ;   62   404 prc
 11657                                  ;   63   408 istoken
 11658                                  ;   64   416 expect
 11659                                  ;   65   423 prunsign1
 11660                                  ;   66   433 prunsign1
 11661                                  ;   67   443 adrofname
 11662                                  ;   68   453 strcpy
 11663                                  ;   69   460 strcpy
 11664                                  ;   70   467 expect
 11665                                  ;   71   474 adrF
 11666                                  ;   72   479 adrofname
 11667                                  ;   73   489 prs
 11668                                  ;   74   493 prs
 11669                                  ;   75   497 prc
 11670                                  ;   76   501 pint1
 11671                                  ;   77   507 prc
 11672                                  ;   78   511 checkName
 11673                                  ;   79   521 error1
 11674                                  ;   80   528 adrofname
 11675                                  ;   81   538 eqstr
 11676                                  ;   82   544 adrofname
 11677                                  ;   83   554 eqstr
 11678                                  ;   84   560 istoken
 11679                                  ;   85   568 istoken
 11680                                  ;   86   576 istoken
 11681                                  ;   87   584 istoken
 11682                                  ;   88   592 istoken
 11683                                  ;   89   600 istoken
 11684                                  ;   90   608 istoken
 11685                                  ;   91   616 istoken
 11686                                  ;   92   624 name1
 11687                                  ;   93   630 error1
 11688                                  ;   94   637 getlex
 11689                                  ;   95   644 error1
 11690                                  ;   96   651 error1
 11691                                  ;   97   658 strlen
 11692                                  ;   98   665 to_far
 11693                                  ;   99   672 error1
 11694                                  ;  100   679 adrF
 11695                                  ;  101   684 strcpy
 11696                                  ;  102   691 error1
 11697                                  ;  103   698 checkName
 11698                                  ;  104   708 error1
 11699                                  ;  105   715 adrF
 11700                                  ;  106   720 strcpy
 11701                                  ;  107   727 adrF
 11702                                  ;  108   732 eqstr
 11703                                  ;  109   738 checknamelen
 11704                                  ;  110   751 strcpy
 11705                                  ;  111   758 checkFunction
 11706                                  ;  112   772 error1
 11707                                  ;  113   779 storefunc
 11708                                  ;  114   789 prs
 11709                                  ;  115   793 prs
 11710                                  ;  116   797 prs
 11711                                  ;  117   801 expect
 11712                                  ;  118   808 istoken
 11713                                  ;  119   816 typeName
 11714                                  ;  120   825 addlocal
 11715                                  ;  121   834 istoken
 11716                                  ;  122   842 expect
 11717                                  ;  123   849 expect
 11718                                  ;  124   856 isvariable
 11719                                  ;  125   867 typeName
 11720                                  ;  126   876 checknamelen
 11721                                  ;  127   889 addlocal
 11722                                  ;  128   898 istoken
 11723                                  ;  129   906 expect
 11724                                  ;  130   913 expect
 11725                                  ;  131   920 istoken
 11726                                  ;  132   928 expect
 11727                                  ;  133   935 listproc
 11728                                  ;  134   944 prs
 11729                                  ;  135   948 mkneg
 11730                                  ;  136   954 prunsign1
 11731                                  ;  137   964 prs
 11732                                  ;  138   968 istoken
 11733                                  ;  139   976 stmt
 11734                                  ;  140   981 prs
 11735                                  ;  141   985 prs
 11736                                  ;  142   989 prc
 11737                                  ;  143   993 prs
 11738                                  ;  144   997 prs
 11739                                  ;  145  1001 prs
 11740                                  ;  146  1005 strlen
 11741                                  ;  147  1012 strcpy
 11742                                  ;  148  1019 prs
 11743                                  ;  149  1023 expect
 11744                                  ;  150  1030 eqstr
 11745                                  ;  151  1036 constantexpr
 11746                                  ;  152  1049 checkreg
 11747                                  ;  153  1058 doreg1
 11748                                  ;  154  1065 exprstart
 11749                                  ;  155  1075 prs
 11750                                  ;  156  1079 prs
 11751                                  ;  157  1083 expect
 11752                                  ;  158  1090 getlex
 11753                                  ;  159  1097 typeName
 11754                                  ;  160  1106 searchname
 11755                                  ;  161  1117 gettypes
 11756                                  ;  162  1126 isrelational
 11757                                  ;  163  1139 error1
 11758                                  ;  164  1146 expect
 11759                                  ;  165  1153 prs
 11760                                  ;  166  1157 prs
 11761                                  ;  167  1161 gettypes
 11762                                  ;  168  1170 prs
 11763                                  ;  169  1174 prs
 11764                                  ;  170  1178 v
 11765                                  ;  171  1180 prs
 11766                                  ;  172  1184 prunsign1
 11767                                  ;  173  1194 cmpneg
 11768                                  ;  174  1201 prs
 11769                                  ;  175  1205 expect
 11770                                  ;  176  1212 eqstr
 11771                                  ;  177  1218 expr2
 11772                                  ;  178  1224 expr
 11773                                  ;  179  1229 getlex
 11774                                  ;  180  1236 typeName
 11775                                  ;  181  1245 error1
 11776                                  ;  182  1252 checkreg
 11777                                  ;  183  1261 doreg1
 11778                                  ;  184  1268 searchname
 11779                                  ;  185  1279 gettypes
 11780                                  ;  186  1288 error1
 11781                                  ;  187  1295 isrelational
 11782                                  ;  188  1308 error1
 11783                                  ;  189  1315 istoken
 11784                                  ;  190  1323 error1
 11785                                  ;  191  1330 istoken
 11786                                  ;  192  1338 prs
 11787                                  ;  193  1342 prs
 11788                                  ;  194  1346 prs
 11789                                  ;  195  1350 prs
 11790                                  ;  196  1354 prs
 11791                                  ;  197  1358 v
 11792                                  ;  198  1360 prs
 11793                                  ;  199  1364 prunsign1
 11794                                  ;  200  1374 adrofname
 11795                                  ;  201  1384 prs
 11796                                  ;  202  1388 prs
 11797                                  ;  203  1392 typeName
 11798                                  ;  204  1401 checkreg
 11799                                  ;  205  1410 prs
 11800                                  ;  206  1414 printreg
 11801                                  ;  207  1423 v
 11802                                  ;  208  1425 prs
 11803                                  ;  209  1429 printreg
 11804                                  ;  210  1438 error1
 11805                                  ;  211  1445 searchname
 11806                                  ;  212  1456 gettypes
 11807                                  ;  213  1465 error1
 11808                                  ;  214  1472 prs
 11809                                  ;  215  1476 printreg
 11810                                  ;  216  1485 error1
 11811                                  ;  217  1492 prs
 11812                                  ;  218  1496 a
 11813                                  ;  219  1498 prs
 11814                                  ;  220  1502 prs
 11815                                  ;  221  1506 prs
 11816                                  ;  222  1510 v
 11817                                  ;  223  1512 adrofname
 11818                                  ;  224  1522 prs
 11819                                  ;  225  1526 prs
 11820                                  ;  226  1530 error1
 11821                                  ;  227  1537 istoken
 11822                                  ;  228  1545 strcpy
 11823                                  ;  229  1552 istoken
 11824                                  ;  230  1560 strcpy
 11825                                  ;  231  1567 istoken
 11826                                  ;  232  1575 strcpy
 11827                                  ;  233  1582 istoken
 11828                                  ;  234  1590 strcpy
 11829                                  ;  235  1597 istoken
 11830                                  ;  236  1605 strcpy
 11831                                  ;  237  1612 istoken
 11832                                  ;  238  1620 strcpy
 11833                                  ;  239  1627 istoken
 11834                                  ;  240  1635 strcpy
 11835                                  ;  241  1642 getlex
 11836                                  ;  242  1649 isrelational
 11837                                  ;  243  1662 error1
 11838                                  ;  244  1669 strcpy
 11839                                  ;  245  1676 prnl
 11840                                  ;  246  1681 prs
 11841                                  ;  247  1685 prs
 11842                                  ;  248  1689 printreg
 11843                                  ;  249  1698 prs
 11844                                  ;  250  1702 istoken
 11845                                  ;  251  1710 prunsign1
 11846                                  ;  252  1720 typeName
 11847                                  ;  253  1729 checkreg
 11848                                  ;  254  1738 printreg
 11849                                  ;  255  1747 searchname
 11850                                  ;  256  1758 a
 11851                                  ;  257  1760 v
 11852                                  ;  258  1762 cmpneg
 11853                                  ;  259  1769 prs
 11854                                  ;  260  1773 expect
 11855                                  ;  261  1780 strlen
 11856                                  ;  262  1787 eqstr
 11857                                  ;  263  1793 eqstr
 11858                                  ;  264  1799 eqstr
 11859                                  ;  265  1805 eqstr
 11860                                  ;  266  1811 eqstr
 11861                                  ;  267  1817 eqstr
 11862                                  ;  268  1823 eqstr
 11863                                  ;  269  1829 eqstr
 11864                                  ;  270  1835 eqstr
 11865                                  ;  271  1841 eqstr
 11866                                  ;  272  1847 eqstr
 11867                                  ;  273  1853 eqstr
 11868                                  ;  274  1859 eqstr
 11869                                  ;  275  1865 eqstr
 11870                                  ;  276  1871 eqstr
 11871                                  ;  277  1877 eqstr
 11872                                  ;  278  1883 eqstr
 11873                                  ;  279  1889 eqstr
 11874                                  ;  280  1895 eqstr
 11875                                  ;  281  1901 eqstr
 11876                                  ;  282  1907 eqstr
 11877                                  ;  283  1913 eqstr
 11878                                  ;  284  1919 strlen
 11879                                  ;  285  1926 eqstr
 11880                                  ;  286  1932 eqstr
 11881                                  ;  287  1938 eqstr
 11882                                  ;  288  1944 eqstr
 11883                                  ;  289  1950 eqstr
 11884                                  ;  290  1956 eqstr
 11885                                  ;  291  1962 eqstr
 11886                                  ;  292  1968 eqstr
 11887                                  ;  293  1974 eqstr
 11888                                  ;  294  1980 prc
 11889                                  ;  295  1984 prc
 11890                                  ;  296  1988 prc
 11891                                  ;  297  1992 istoken
 11892                                  ;  298  2000 prs
 11893                                  ;  299  2004 prunsign1
 11894                                  ;  300  2014 typeName
 11895                                  ;  301  2023 checkreg
 11896                                  ;  302  2032 doreg1
 11897                                  ;  303  2039 docall1
 11898                                  ;  304  2047 isreg
 11899                                  ;  305  2053 searchname
 11900                                  ;  306  2064 gettypes
 11901                                  ;  307  2073 istoken
 11902                                  ;  308  2081 istoken
 11903                                  ;  309  2089 expect
 11904                                  ;  310  2096 searchname
 11905                                  ;  311  2107 expect
 11906                                  ;  312  2114 expect
 11907                                  ;  313  2121 gettypes
 11908                                  ;  314  2130 error1
 11909                                  ;  315  2137 istoken
 11910                                  ;  316  2145 error1
 11911                                  ;  317  2152 prs
 11912                                  ;  318  2156 prs
 11913                                  ;  319  2160 prs
 11914                                  ;  320  2164 v
 11915                                  ;  321  2166 istoken
 11916                                  ;  322  2174 error1
 11917                                  ;  323  2181 prs
 11918                                  ;  324  2185 prs
 11919                                  ;  325  2189 prs
 11920                                  ;  326  2193 v
 11921                                  ;  327  2195 istoken
 11922                                  ;  328  2203 compoundass
 11923                                  ;  329  2215 istoken
 11924                                  ;  330  2223 compoundass
 11925                                  ;  331  2235 istoken
 11926                                  ;  332  2243 compoundass
 11927                                  ;  333  2255 istoken
 11928                                  ;  334  2263 compoundass
 11929                                  ;  335  2275 istoken
 11930                                  ;  336  2283 error1
 11931                                  ;  337  2290 istoken
 11932                                  ;  338  2298 error1
 11933                                  ;  339  2305 istoken
 11934                                  ;  340  2313 expr
 11935                                  ;  341  2318 doassign
 11936                                  ;  342  2327 dovar1
 11937                                  ;  343  2334 istoken
 11938                                  ;  344  2342 rterm
 11939                                  ;  345  2348 istoken
 11940                                  ;  346  2356 rterm
 11941                                  ;  347  2362 istoken
 11942                                  ;  348  2370 rterm
 11943                                  ;  349  2376 istoken
 11944                                  ;  350  2384 rterm
 11945                                  ;  351  2390 istoken
 11946                                  ;  352  2398 rterm
 11947                                  ;  353  2404 istoken
 11948                                  ;  354  2412 rterm
 11949                                  ;  355  2418 istoken
 11950                                  ;  356  2426 domul
 11951                                  ;  357  2432 istoken
 11952                                  ;  358  2440 doidiv
 11953                                  ;  359  2447 istoken
 11954                                  ;  360  2455 domod
 11955                                  ;  361  2461 isrelational
 11956                                  ;  362  2474 rterm
 11957                                  ;  363  2480 cmpneg
 11958                                  ;  364  2487 error1
 11959                                  ;  365  2494 prnl
 11960                                  ;  366  2499 prs
 11961                                  ;  367  2503 prs
 11962                                  ;  368  2507 gettypes
 11963                                  ;  369  2516 prs
 11964                                  ;  370  2520 prs
 11965                                  ;  371  2524 v
 11966                                  ;  372  2526 prs
 11967                                  ;  373  2530 expect
 11968                                  ;  374  2537 prunsign1
 11969                                  ;  375  2547 gettypes
 11970                                  ;  376  2556 prs
 11971                                  ;  377  2560 v
 11972                                  ;  378  2562 prnl
 11973                                  ;  379  2567 prs
 11974                                  ;  380  2571 prs
 11975                                  ;  381  2575 prs
 11976                                  ;  382  2579 prnl
 11977                                  ;  383  2584 prs
 11978                                  ;  384  2588 prs
 11979                                  ;  385  2592 a
 11980                                  ;  386  2594 prs
 11981                                  ;  387  2598 v
 11982                                  ;  388  2600 prs
 11983                                  ;  389  2604 prs
 11984                                  ;  390  2608 prs
 11985                                  ;  391  2612 prs
 11986                                  ;  392  2616 prs
 11987                                  ;  393  2620 prc
 11988                                  ;  394  2624 printName
 11989                                  ;  395  2634 prs
 11990                                  ;  396  2638 prnl
 11991                                  ;  397  2643 prs
 11992                                  ;  398  2647 prs
 11993                                  ;  399  2651 prs
 11994                                  ;  400  2655 prs
 11995                                  ;  401  2659 v
 11996                                  ;  402  2661 istoken
 11997                                  ;  403  2669 prnl
 11998                                  ;  404  2674 prs
 11999                                  ;  405  2678 prs
 12000                                  ;  406  2682 prs
 12001                                  ;  407  2686 prs
 12002                                  ;  408  2690 prunsign1
 12003                                  ;  409  2700 typeName
 12004                                  ;  410  2709 searchname
 12005                                  ;  411  2720 istoken
 12006                                  ;  412  2728 searchname
 12007                                  ;  413  2739 expect
 12008                                  ;  414  2746 expect
 12009                                  ;  415  2753 gettypes
 12010                                  ;  416  2762 error1
 12011                                  ;  417  2769 eqstr
 12012                                  ;  418  2775 dovar1
 12013                                  ;  419  2782 eqstr
 12014                                  ;  420  2788 doreg
 12015                                  ;  421  2794 eqstr
 12016                                  ;  422  2800 doreg
 12017                                  ;  423  2806 eqstr
 12018                                  ;  424  2812 doreg
 12019                                  ;  425  2818 eqstr
 12020                                  ;  426  2824 doreg
 12021                                  ;  427  2830 eqstr
 12022                                  ;  428  2836 doreg
 12023                                  ;  429  2842 eqstr
 12024                                  ;  430  2848 doreg
 12025                                  ;  431  2854 eqstr
 12026                                  ;  432  2860 doreg
 12027                                  ;  433  2866 eqstr
 12028                                  ;  434  2872 doreg
 12029                                  ;  435  2878 eqstr
 12030                                  ;  436  2884 doreg
 12031                                  ;  437  2890 eqstr
 12032                                  ;  438  2896 doreg
 12033                                  ;  439  2902 eqstr
 12034                                  ;  440  2908 doreg
 12035                                  ;  441  2914 eqstr
 12036                                  ;  442  2920 doreg
 12037                                  ;  443  2926 eqstr
 12038                                  ;  444  2932 doreg
 12039                                  ;  445  2938 eqstr
 12040                                  ;  446  2944 doreg
 12041                                  ;  447  2950 eqstr
 12042                                  ;  448  2956 doreg
 12043                                  ;  449  2962 expect
 12044                                  ;  450  2969 prs
 12045                                  ;  451  2973 prs
 12046                                  ;  452  2977 prs
 12047                                  ;  453  2981 istoken
 12048                                  ;  454  2989 prunsign1
 12049                                  ;  455  2999 istoken
 12050                                  ;  456  3007 searchname
 12051                                  ;  457  3018 v
 12052                                  ;  458  3020 error1
 12053                                  ;  459  3027 gettypes
 12054                                  ;  460  3036 prs
 12055                                  ;  461  3040 v
 12056                                  ;  462  3042 prs
 12057                                  ;  463  3046 prs
 12058                                  ;  464  3050 prs
 12059                                  ;  465  3054 a
 12060                                  ;  466  3056 prs
 12061                                  ;  467  3060 prs
 12062                                  ;  468  3064 prunsign1
 12063                                  ;  469  3074 v
 12064                                  ;  470  3076 prs
 12065                                  ;  471  3080 prs
 12066                                  ;  472  3084 printName
 12067                                  ;  473  3094 prs
 12068                                  ;  474  3098 prs
 12069                                  ;  475  3102 prs
 12070                                  ;  476  3106 prs
 12071                                  ;  477  3110 v
 12072                                  ;  478  3112 prs
 12073                                  ;  479  3116 prs
 12074                                  ;  480  3120 prs
 12075                                  ;  481  3124 v
 12076                                  ;  482  3126 prs
 12077                                  ;  483  3130 prs
 12078                                  ;  484  3134 prs
 12079                                  ;  485  3138 v
 12080                                  ;  486  3140 prs
 12081                                  ;  487  3144 rterm
 12082                                  ;  488  3150 istoken
 12083                                  ;  489  3158 prs
 12084                                  ;  490  3162 prunsign1
 12085                                  ;  491  3172 prs
 12086                                  ;  492  3176 error1
 12087                                  ;  493  3183 istoken
 12088                                  ;  494  3191 prs
 12089                                  ;  495  3195 prunsign1
 12090                                  ;  496  3205 prs
 12091                                  ;  497  3209 prs
 12092                                  ;  498  3213 typeName
 12093                                  ;  499  3222 searchname
 12094                                  ;  500  3233 error1
 12095                                  ;  501  3240 gettypes
 12096                                  ;  502  3249 error1
 12097                                  ;  503  3256 error1
 12098                                  ;  504  3263 prs
 12099                                  ;  505  3267 v
 12100                                  ;  506  3269 prs
 12101                                  ;  507  3273 prs
 12102                                  ;  508  3277 doidiv
 12103                                  ;  509  3284 prs
 12104                                  ;  510  3288 checknamelen
 12105                                  ;  511  3301 strcpy
 12106                                  ;  512  3308 storecall
 12107                                  ;  513  3318 expect
 12108                                  ;  514  3325 istoken
 12109                                  ;  515  3333 error1
 12110                                  ;  516  3340 istoken
 12111                                  ;  517  3348 istoken
 12112                                  ;  518  3356 eprs
 12113                                  ;  519  3361 eprs
 12114                                  ;  520  3366 eprc
 12115                                  ;  521  3371 eprnum
 12116                                  ;  522  3378 eprs
 12117                                  ;  523  3383 eprc
 12118                                  ;  524  3388 eprs
 12119                                  ;  525  3393 eprc
 12120                                  ;  526  3398 eprs
 12121                                  ;  527  3403 istoken
 12122                                  ;  528  3411 name1
 12123                                  ;  529  3417 searchname
 12124                                  ;  530  3428 istoken
 12125                                  ;  531  3436 checkreg
 12126                                  ;  532  3445 searchname
 12127                                  ;  533  3456 error1
 12128                                  ;  534  3463 istoken
 12129                                  ;  535  3471 expect
 12130                                  ;  536  3478 prs
 12131                                  ;  537  3482 prunsign1
 12132                                  ;  538  3492 prs
 12133                                  ;  539  3496 prs
 12134                                  ;  540  3500 prc
 12135                                  ;  541  3504 prunsign1
 12136                                  ;  542  3514 prs
 12137                                  ;  543  3518 v
 12138                                  ;  544  3520 prs
 12139                                  ;  545  3524 gettypes
 12140                                  ;  546  3533 prs
 12141                                  ;  547  3537 v
 12142                                  ;  548  3539 prs
 12143                                  ;  549  3543 v
 12144                                  ;  550  3545 prs
 12145                                  ;  551  3549 prs
 12146                                  ;  552  3553 printreg
 12147                                  ;  553  3562 prs
 12148                                  ;  554  3566 prs
 12149                                  ;  555  3570 prs
 12150                                  ;  556  3574 prunsign1
 12151                                  ;  557  3584 prs
 12152                                  ;  558  3588 prs
 12153                                  ;  559  3592 openR
 12154                                  ;  560  3598 prs
 12155                                  ;  561  3602 prs
 12156                                  ;  562  3606 error1
 12157                                  ;  563  3613 parse
 12158                                  ;  564  3619 prs
 12159                                  ;  565  3623 prs
 12160                                  ;  566  3627 getfirstchar
 12161                                  ;  567  3640 getlex
 12162                                  ;  568  3647 eqstr
 12163                                  ;  569  3653 getlex
 12164                                  ;  570  3660 eqstr
 12165                                  ;  571  3666 getlex
 12166                                  ;  572  3673 prs
 12167                                  ;  573  3677 strcpy
 12168                                  ;  574  3684 prs
 12169                                  ;  575  3688 error1
 12170                                  ;  576  3695 getlex
 12171                                  ;  577  3702 expect
 12172                                  ;  578  3709 error1
 12173                                  ;  579  3716 strlen
 12174                                  ;  580  3723 error1
 12175                                  ;  581  3730 adrofname
 12176                                  ;  582  3740 strcpy
 12177                                  ;  583  3747 expect
 12178                                  ;  584  3754 istoken
 12179                                  ;  585  3762 istoken
 12180                                  ;  586  3770 stmt
 12181                                  ;  587  3775 istoken
 12182                                  ;  588  3783 doif
 12183                                  ;  589  3788 istoken
 12184                                  ;  590  3796 dodo
 12185                                  ;  591  3801 istoken
 12186                                  ;  592  3809 dowhile
 12187                                  ;  593  3817 istoken
 12188                                  ;  594  3825 prs
 12189                                  ;  595  3829 name1
 12190                                  ;  596  3835 prs
 12191                                  ;  597  3839 expect
 12192                                  ;  598  3846 prs
 12193                                  ;  599  3850 next
 12194                                  ;  600  3855 prc
 12195                                  ;  601  3859 next
 12196                                  ;  602  3864 getlex
 12197                                  ;  603  3871 istoken
 12198                                  ;  604  3879 prs
 12199                                  ;  605  3883 next
 12200                                  ;  606  3888 prc
 12201                                  ;  607  3892 next
 12202                                  ;  608  3897 getlex
 12203                                  ;  609  3904 error1
 12204                                  ;  610  3911 istoken
 12205                                  ;  611  3919 doemit
 12206                                  ;  612  3926 istoken
 12207                                  ;  613  3934 istoken
 12208                                  ;  614  3942 exprstart
 12209                                  ;  615  3952 prs
 12210                                  ;  616  3956 prs
 12211                                  ;  617  3960 expect
 12212                                  ;  618  3967 prs
 12213                                  ;  619  3971 prs
 12214                                  ;  620  3975 prc
 12215                                  ;  621  3979 expect
 12216                                  ;  622  3986 expect
 12217                                  ;  623  3993 exprstart
 12218                                  ;  624  4003 expect
 12219                                  ;  625  4010 prs
 12220                                  ;  626  4014 getlex
 12221                                  ;  627  4021 prunsign1
 12222                                  ;  628  4031 getlex
 12223                                  ;  629  4038 prc
 12224                                  ;  630  4042 expect
 12225                                  ;  631  4049 prs
 12226                                  ;  632  4053 prs
 12227                                  ;  633  4057 prs
 12228                                  ;  634  4061 prs
 12229                                  ;  635  4065 prs
 12230                                  ;  636  4069 prunsign1
 12231                                  ;  637  4079 prs
 12232                                  ;  638  4083 prs
 12233                                  ;  639  4087 prunsign1
 12234                                  ;  640  4097 prs
 12235                                  ;  641  4101 prs
 12236                                  ;  642  4105 prs
 12237                                  ;  643  4109 error1
 12238                                  ;  644  4116 prs
 12239                                  ;  645  4120 prs
 12240                                  ;  646  4124 prunsign1
 12241                                  ;  647  4134 prc
 12242                                  ;  648  4138 prs
 12243                                  ;  649  4142 prs
 12244                                  ;  650  4146 prunsign1
 12245                                  ;  651  4156 pexpr
 12246                                  ;  652  4162 pint1
 12247                                  ;  653  4168 stmt
 12248                                  ;  654  4173 istoken
 12249                                  ;  655  4181 prjump
 12250                                  ;  656  4188 prlabel
 12251                                  ;  657  4196 stmt
 12252                                  ;  658  4201 prlabel
 12253                                  ;  659  4209 prlabel
 12254                                  ;  660  4217 prlabel
 12255                                  ;  661  4225 stmt
 12256                                  ;  662  4230 expect
 12257                                  ;  663  4237 pexpr
 12258                                  ;  664  4243 pint1
 12259                                  ;  665  4249 prjump
 12260                                  ;  666  4256 prlabel
 12261                                  ;  667  4264 prlabel
 12262                                  ;  668  4272 pexpr
 12263                                  ;  669  4278 pint1
 12264                                  ;  670  4284 stmt
 12265                                  ;  671  4289 prjump
 12266                                  ;  672  4296 prlabel
 12267                                  ;  673  4304 getlex
 12268                                  ;  674  4311 next
 12269                                  ;  675  4316 next
 12270                                  ;  676  4321 next
 12271                                  ;  677  4326 next
 12272                                  ;  678  4331 next
 12273                                  ;  679  4336 next
 12274                                  ;  680  4341 next
 12275                                  ;  681  4346 next
 12276                                  ;  682  4351 next
 12277                                  ;  683  4356 next
 12278                                  ;  684  4361 next
 12279                                  ;  685  4366 next
 12280                                  ;  686  4371 next
 12281                                  ;  687  4376 next
 12282                                  ;  688  4381 next
 12283                                  ;  689  4386 instr1
 12284                                  ;  690  4393 next
 12285                                  ;  691  4398 ifEOL
 12286                                  ;  692  4404 getlex
 12287                                  ;  693  4411 next
 12288                                  ;  694  4416 next
 12289                                  ;  695  4421 getlex
 12290                                  ;  696  4428 getstring
 12291                                  ;  697  4438 digit
 12292                                  ;  698  4444 getdigit
 12293                                  ;  699  4453 next
 12294                                  ;  700  4458 next
 12295                                  ;  701  4463 next
 12296                                  ;  702  4468 alnum
 12297                                  ;  703  4474 strcpy
 12298                                  ;  704  4481 alnum
 12299                                  ;  705  4487 next
 12300                                  ;  706  4492 eqstr
 12301                                  ;  707  4498 eqstr
 12302                                  ;  708  4504 eqstr
 12303                                  ;  709  4510 eqstr
 12304                                  ;  710  4516 eqstr
 12305                                  ;  711  4522 eqstr
 12306                                  ;  712  4528 eqstr
 12307                                  ;  713  4534 eqstr
 12308                                  ;  714  4540 eqstr
 12309                                  ;  715  4546 eqstr
 12310                                  ;  716  4552 eqstr
 12311                                  ;  717  4558 eqstr
 12312                                  ;  718  4564 eqstr
 12313                                  ;  719  4570 eqstr
 12314                                  ;  720  4576 eqstr
 12315                                  ;  721  4582 eqstr
 12316                                  ;  722  4588 eqstr
 12317                                  ;  723  4594 convertdefine
 12318                                  ;  724  4608 strcpy
 12319                                  ;  725  4615 error1
 12320                                  ;  726  4622 adrofname
 12321                                  ;  727  4632 eqstr
 12322                                  ;  728  4638 next
 12323                                  ;  729  4643 alnum
 12324                                  ;  730  4649 next
 12325                                  ;  731  4654 digit
 12326                                  ;  732  4660 next
 12327                                  ;  733  4665 next
 12328                                  ;  734  4670 next
 12329                                  ;  735  4675 fgets1
 12330                                  ;  736  4682 getlex
 12331                                  ;  737  4689 istoken
 12332                                  ;  738  4697 prs
 12333                                  ;  739  4701 listproc
 12334                                  ;  740  4710 prs
 12335                                  ;  741  4714 pint1
 12336                                  ;  742  4720 error1
 12337                                  ;  743  4727 eprc
 12338                                  ;  744  4732 writetty
 12339                                  ;  745  4741 writetty
 12340                                  ;  746  4750 fputcR
 12341                                  ;  747  4757 prc
 12342                                  ;  748  4761 prs
 12343                                  ;  749  4765 prc
 12344                                  ;  750  4769 eprc
 12345                                  ;  751  4774 mkneg
 12346                                  ;  752  4780 eprnum
 12347                                  ;  753  4787 eprc
 12348                                  ;  754  4792 prc
 12349                                  ;  755  4796 mkneg
 12350                                  ;  756  4802 pint1
 12351                                  ;  757  4808 prc
 12352                                  ;  758  4812 prunsign1
 12353                                  ;  759  4822 prc
 12354                                  ;  760  4826 prc
 12355                                  ;  761  4830 prc
 12356                                  ;  762  4834 prc
 12357                                  ;  763  4838 prc
 12358                                  ;  764  4842 prunsign1
 12359                                  ;  765  4852 printinputline
 12360                                  ;  766  4867 readRL
 12361                                  ;  767  4874 error1
 12362                                  ;  768  4881 prs
 12363                                  ;  769  4885 prunsign1
 12364                                  ;  770  4895 prc
 12365                                  ;  771  4899 prscomment
 12366                                  ;  772  4910 next
 12367                                  ;  773  4915 fcloseR
 12368                                  ;  774  4923 fcloseR
 12369                                  ;  775  4931 exitR
 12370                                  ;  776  4937 prnl
 12371                                  ;  777  4942 prscomment
 12372                                  ;  778  4953 prs
 12373                                  ;  779  4957 prunsign1
 12374                                  ;  780  4967 prs
 12375                                  ;  781  4971 prs
 12376                                  ;  782  4975 prs
 12377                                  ;  783  4979 prunsign1
 12378                                  ;  784  4989 prs
 12379                                  ;  785  4993 prunsign1
 12380                                  ;  786  5003 prs
 12381                                  ;  787  5007 prs
 12382                                  ;  788  5011 end1
 12383                                  ;  789  5016 prs
 12384                                  ;  790  5020 prs
 12385                                  ;  791  5024 prs
 12386                                  ;  792  5028 prunsign1
 12387                                  ;  793  5038 prs
 12388                                  ;  794  5042 prs
 12389                                  ;  795  5046 listvar
 12390                                  ;  796  5054 prs
 12391                                  ;  797  5058 calllisting
 12392                                  ;  798  5070 prs
 12393                                  ;  799  5074 printint51
 12394                                  ;  800  5085 prc
 12395                                  ;  801  5089 prs
 12396                                  ;  802  5093 printint51
 12397                                  ;  803  5104 prc
 12398                                  ;  804  5108 from_far
 12399                                  ;  805  5117 prs
 12400                                  ;  806  5121 adrF
 12401                                  ;  807  5126 from_far
 12402                                  ;  808  5135 eqstr
 12403                                  ;  809  5141 prs
 12404                                  ;  810  5145 countcalls
 12405                                  ;  811  5156 funclisting
 12406                                  ;  812  5168 prs
 12407                                  ;  813  5172 printint51
 12408                                  ;  814  5183 printint51
 12409                                  ;  815  5194 prs
 12410                                  ;  816  5198 printint51
 12411                                  ;  817  5209 prc
 12412                                  ;  818  5213 prs
 12413                                  ;  819  5217 prs
 12414                                  ;  820  5221 prs
 12415                                  ;  821  5225 prs
 12416                                  ;  822  5229 prc
 12417                                  ;  823  5233 prc
 12418                                  ;  824  5237 adrF
 12419                                  ;  825  5242 prs
 12420                                  ;  826  5246 prs
 12421                                  ;  827  5250 printint51
 12422                                  ;  828  5261 prc
 12423                                  ;  829  5265 prs
 12424                                  ;  830  5269 prs
 12425                                  ;  831  5273 prs
 12426                                  ;  832  5277 prs
 12427                                  ;  833  5281 prs
 12428                                  ;  834  5285 prs
 12429                                  ;  835  5289 prs
 12430                                  ;  836  5293 prs
 12431                                  ;  837  5297 prs
 12432                                  ;  838  5301 printint51
 12433                                  ;  839  5312 printint51
 12434                                  ;  840  5323 prs
 12435                                  ;  841  5327 prs
 12436                                  ;  842  5331 prc
 12437                                  ;  843  5335 adrofname
 12438                                  ;  844  5345 prs
 12439                                  ;  845  5349 prc
 12440                                  ;  846  5353 prunsign1
 12441                                  ;  847  5363 prc
 12442                                  ;  848  5367 prunsign1
 12443                                  ;  849  5377 prc
 12444                                  ;  850  5381 prs
 12445                                  ;  851  5385 prc
 12446                                  ;  852  5389 pint1
 12447                                  ;  853  5395 prs
 12448                                  ;  854  5399 prs
 12449                                  ;  855  5403 listvar
 12450                                  ;  856  5411 listfunc
 12451                                  ;  857  5420 listcall
 12452                                  ;  858  5429 prs
 12453                                  ;  859  5433 prs
 12454                                  ;  860  5437 prs
 12455                                  ;  861  5441 prs
 12456                                  ;  862  5445 prs
 12457                                  ;  863  5449 printint51
 12458                                  ;  864  5460 prs
 12459                                  ;  865  5464 printint51
 12460                                  ;  866  5475 prs
 12461                                  ;  867  5479 printint51
 12462                                  ;  868  5490 prs
 12463                                  ;  869  5494 printint51
 12464                                  ;  870  5505 prs
 12465                                  ;  871  5509 printint51
 12466                                  ;  872  5520 prs
 12467                                  ;  873  5524 printint51
 12468                                  ;  874  5535 prs
 12469                                  ;  875  5539 printint51
 12470                                  ;  876  5550 prs
 12471                                  ;  877  5554 printint51
 12472                                  ;  878  5565 prs
 12473                                  ;  879  5569 prs
 12474                                  ;  880  5573 prs
 12475                                  ;  881  5577 printint51
 12476                                  ;  882  5588 prs
 12477                                  ;  883  5592 printint51
 12478                                  ;  884  5603 prs
 12479                                  ;  885  5607 prs
 12480                                  ;  886  5611 printint51
 12481                                  ;  887  5622 prs
 12482                                  ;  888  5626 end1
 12483                                  ;  889  5631 prs
 12484                                  ;  890  5635 from_far
 12485                                  ;  891  5644 adrF
 12486                                  ;  892  5649 eqstr
 12487                                  ;  893  5655 prs
 12488                                  ;  894  5659 prs
 12489                                  ;  895  5663 prs
 12490                                  ;  896  5667 printint51
 12491                                  ;  897  5678 error1
 12492                                  ;  898  5685 prs
 12493                                  ;  899  5689 getlex
 12494                                  ;  900  5696 istoken
 12495                                  ;  901  5704 istoken
 12496                                  ;  902  5712 dodefine
 12497                                  ;  903  5721 istoken
 12498                                  ;  904  5729 doinclude
 12499                                  ;  905  5739 error1
 12500                                  ;  906  5746 typeName
 12501                                  ;  907  5755 dofunc
 12502                                  ;  908  5762 doglob
 12503                                  ;  909  5769 fgets1
 12504                                  ;  910  5776 cputs
 12505                                  ;  911  5782 cputs
 12506                                  ;  912  5788 exitR
 12507                                  ;  913  5794 toupper
 12508                                  ;  914  5802 strcpy
 12509                                  ;  915  5809 instr1
 12510                                  ;  916  5816 strcat1
 12511                                  ;  917  5824 strcpy
 12512                                  ;  918  5831 strlen
 12513                                  ;  919  5838 openR
 12514                                  ;  920  5844 cputs
 12515                                  ;  921  5850 cputs
 12516                                  ;  922  5856 exitR
 12517                                  ;  923  5862 creatR
 12518                                  ;  924  5869 cputs
 12519                                  ;  925  5875 cputs
 12520                                  ;  926  5881 exitR
 12521                                  ;  927  5887 prs
 12522                                  ;  928  5891 prs
 12523                                  ;  929  5895 prs
 12524                                  ;  930  5899 prs
 12525                                  ;  931  5903 prs
 12526                                  ;  932  5907 prs
 12527                                  ;  933  5911 prs
 12528                                  ;  934  5915 DosInt
 12529                                  ;  935  5922 getarg
 12530                                  ;  936  5929 setblock
 12531                                  ;  937  5938 error1
 12532                                  ;  938  5945 allocmem
 12533                                  ;  939  5954 error1
 12534                                  ;  940  5961 getfirstchar
 12535                                  ;  941  5974 parse
 12536                                  ;  942  5980 checkcalls
 12537                                  ;  943  5991 epilog
 12538                                  ;  944  5998 DosInt
 12539                                  ;Input: A.C, List: A.S,  Lines: 1200
 12540                                  ;Glob. variables:  130 max.:  200
 12541                                  ;Functions      :  106 max.:  300
 12542                                  ;Calls          :  945 max.: 2000, NameField: 6005
 12543                                  ;Const in 'expr2' :  754 max.: 3000, stacksize: 16987
