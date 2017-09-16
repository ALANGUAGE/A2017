     1                                  
     2                                  ; A.COM V0.9, Source: A.C, Output asm: A.S
     3                                  org  256 
     4 00000000 E9E62F                  jmp main
     5                                  
     6                                  ;-1 //  .ret redefined 2011.04.25 23.644 bytes, Full  Working 2017.09.13
     7                                  
     8                                  
     9                                  ;-2 char Version1[]="A.COM V0.9";
    10                                  
    11 00000003 412E434F4D2056302E-     Version1 db "A.COM V0.9",0
    12 0000000C 3900               
    13                                  
    14                                  ;-3 #define LSTART        200
    15                                  
    16                                  
    17                                  ;-4 #define VARMAX        300
    18                                  
    19                                  
    20                                  ;-5 #define GNAMEMAX     4800 // 16*VARMAX
    21                                  
    22                                  
    23                                  ;-6 #define FUNCMAX       300
    24                                  
    25                                  
    26                                  ;-7 #define FNAMEMAX     4800 // 16*FUNCMAX
    27                                  
    28                                  
    29                                  ;-8 #define CALLMAX      2000
    30                                  
    31                                  
    32                                  ;-9 #define IDLENMAX       15
    33                                  
    34                                  
    35                                  ;-10 #define _                 // Konstantvergleich
    36                                  
    37                                  
    38                                  ;-11 #define T_NAME        256
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
   140                                  ;-45 #define COMAX        3000
   141                                  
   142                                  
   143                                  ;-46 #define CMDLENMAX      67
   144                                  
   145                                  
   146                                  ;-47 unsigned int ORGDATAORIG=30000;      unsigned int orgData=30000;
   147                                  
   148 0000000E 3075                    ORGDATAORIG dw 30000
   149 00000010 3075                    orgData dw 30000
   150                                  
   151                                  ;-48 char co[COMAX];    int maxco=0;      int maxco1=0;
   152                                  
   153                                  section .bss
   154                                  absolute 30000
   155 00007530 <res 00000BB8>          co resb 3000
   156                                  section .text
   157 00000012 0000                    maxco dw 0
   158 00000014 0000                    maxco1 dw 0
   159                                  
   160                                  ;-49 char coname[CMDLENMAX];              char *cloc=0;
   161                                  
   162                                  section .bss
   163                                  absolute -32536
   164 FFFF80E8 <res 00000043>          coname resb 67
   165                                  section .text
   166 00000016 0000                    cloc dw 0
   167                                  
   168                                  ;-50 int fdin=0;        int fdout=0;      char symbol[128];
   169                                  
   170 00000018 0000                    fdin dw 0
   171 0000001A 0000                    fdout dw 0
   172                                  section .bss
   173                                  absolute -32469
   174 FFFF812B <res 00000080>          symbol resb 128
   175                                  section .text
   176                                  
   177                                  ;-51 char fname[CMDLENMAX];               char namein[CMDLENMAX];
   178                                  
   179                                  section .bss
   180                                  absolute -32341
   181 FFFF81AB <res 00000043>          fname resb 67
   182                                  section .text
   183                                  section .bss
   184                                  absolute -32274
   185 FFFF81EE <res 00000043>          namein resb 67
   186                                  section .text
   187                                  
   188                                  ;-52 char namelst[CMDLENMAX];             char archivename[CMDLENMAX];
   189                                  
   190                                  section .bss
   191                                  absolute -32207
   192 FFFF8231 <res 00000043>          namelst resb 67
   193                                  section .text
   194                                  section .bss
   195                                  absolute -32140
   196 FFFF8274 <res 00000043>          archivename resb 67
   197                                  section .text
   198                                  
   199                                  ;-53 int token=0;       char globC=0;     int spalte=0;
   200                                  
   201 0000001C 0000                    token dw 0
   202 0000001E 00                      globC db 0
   203 0000001F 0000                    spalte dw 0
   204                                  
   205                                  ;-54 char thechar=0;    int iscmp=0;      int nconst=0;
   206                                  
   207 00000021 00                      thechar db 0
   208 00000022 0000                    iscmp dw 0
   209 00000024 0000                    nconst dw 0
   210                                  
   211                                  ;-55 int nreturn=0;     int nlabel=0;    
   212                                  
   213 00000026 0000                    nreturn dw 0
   214 00000028 0000                    nlabel dw 0
   215                                  
   216                                  ;-56 int GTop=1;        int LTop=150;
   217                                  
   218 0000002A 0100                    GTop dw 1
   219 0000002C 9600                    LTop dw 150
   220                                  
   221                                  ;-57 unsigned int lexval=0;
   222                                  
   223 0000002E 0000                    lexval dw 0
   224                                  
   225                                  ;-58 int typei;       char istype;  char GType [VARMAX]; // 0=V, 1=*, 2=&,#
   226                                  
   227 00000030 0000                    typei dw 0
   228 00000032 00                      istype db 0
   229                                  section .bss
   230                                  absolute -32073
   231 FFFF82B7 <res 0000012C>          GType resb 300
   232                                  section .text
   233                                  
   234                                  ;-59 int signi;       char issign;  char GSign [VARMAX]; // 0=U, 1=S
   235                                  
   236 00000033 0000                    signi dw 0
   237 00000035 00                      issign db 0
   238                                  section .bss
   239                                  absolute -31773
   240 FFFF83E3 <res 0000012C>          GSign resb 300
   241                                  section .text
   242                                  
   243                                  ;-60 int widthi;      char iswidth; char GWidth[VARMAX]; // 0, 1, 2, 4
   244                                  
   245 00000036 0000                    widthi dw 0
   246 00000038 00                      iswidth db 0
   247                                  section .bss
   248                                  absolute -31473
   249 FFFF850F <res 0000012C>          GWidth resb 300
   250                                  section .text
   251                                  
   252                                  ;-61              int GAdr[VARMAX]; int  GUsed [VARMAX];
   253                                  
   254                                  section .bss
   255                                  absolute -31173
   256 FFFF863B <res 00000258>          GAdr resw 300
   257                                  section .text
   258                                  section .bss
   259                                  absolute -30573
   260 FFFF8893 <res 00000258>          GUsed resw 300
   261                                  section .text
   262                                  
   263                                  ;-62 int wi=0;   int GData[VARMAX];  char GNameField[GNAMEMAX];
   264                                  
   265 00000039 0000                    wi dw 0
   266                                  section .bss
   267                                  absolute -29973
   268 FFFF8AEB <res 00000258>          GData resw 300
   269                                  section .text
   270                                  section .bss
   271                                  absolute -29373
   272 FFFF8D43 <res 000012C0>          GNameField resb 4800
   273                                  section .text
   274                                  
   275                                  ;-63 int  FTop=0;                 int  CTop=0;
   276                                  
   277 0000003B 0000                    FTop dw 0
   278 0000003D 0000                    CTop dw 0
   279                                  
   280                                  ;-64 char FType [FUNCMAX];        char CType[CALLMAX];
   281                                  
   282                                  section .bss
   283                                  absolute -24573
   284 FFFFA003 <res 0000012C>          FType resb 300
   285                                  section .text
   286                                  section .bss
   287                                  absolute -24273
   288 FFFFA12F <res 000007D0>          CType resb 2000
   289                                  section .text
   290                                  
   291                                  ;-65 int  FAdr  [FUNCMAX];        int  CAdr [CALLMAX];
   292                                  
   293                                  section .bss
   294                                  absolute -22273
   295 FFFFA8FF <res 00000258>          FAdr resw 300
   296                                  section .text
   297                                  section .bss
   298                                  absolute -21673
   299 FFFFAB57 <res 00000FA0>          CAdr resw 2000
   300                                  section .text
   301                                  
   302                                  ;-66 int  FCalls[FUNCMAX];
   303                                  
   304                                  section .bss
   305                                  absolute -17673
   306 FFFFBAF7 <res 00000258>          FCalls resw 300
   307                                  section .text
   308                                  
   309                                  ;-67 char FNameField[FNAMEMAX];   //char CNameField[CNAMEMAX];
   310                                  
   311                                  section .bss
   312                                  absolute -17073
   313 FFFFBD4F <res 000012C0>          FNameField resb 4800
   314                                  section .text
   315                                  
   316                                  ;-68 char NameA[]="12345678901234567890123456789012"; //must be in low memory
   317                                  
   318 0000003F 313233343536373839-     NameA db "12345678901234567890123456789012",0
   319 00000048 303132333435363738-
   320 00000051 393031323334353637-
   321 0000005A 383930313200       
   322                                  
   323                                  ;-69 char fgetsdest[128];         unsigned char *CNameTop=0;
   324                                  
   325                                  section .bss
   326                                  absolute -12273
   327 FFFFD00F <res 00000080>          fgetsdest resb 128
   328                                  section .text
   329 00000060 0000                    CNameTop dw 0
   330                                  
   331                                  ;-70 unsigned char *fgetsp=0;     unsigned int segE;
   332                                  
   333 00000062 0000                    fgetsp dw 0
   334 00000064 0000                    segE dw 0
   335                                  
   336                                  ;-71 unsigned int lineno=1;       unsigned int linenoinclude=1;
   337                                  
   338 00000066 0100                    lineno dw 1
   339 00000068 0100                    linenoinclude dw 1
   340                                  
   341                                  ;-72 unsigned char *pt=0;         unsigned char *p1=0;
   342                                  
   343 0000006A 0000                    pt dw 0
   344 0000006C 0000                    p1 dw 0
   345                                  
   346                                  ;-73 int DOS_ERR=0; int DOS_NoBytes=0; char DOS_ByteRead=0;
   347                                  
   348 0000006E 0000                    DOS_ERR dw 0
   349 00000070 0000                    DOS_NoBytes dw 0
   350 00000072 00                      DOS_ByteRead db 0
   351                                  
   352                                  ;-74 
   353                                  
   354                                  
   355                                  ;-75 int writetty()     { ah=0x0E; bx=0; __emit__(0xCD,0x10); } 
   356                                  
   357                                  
   358                                  writetty:  ; *** PROC ***
   359 00000073 B40E                     mov  ah, 14
   360 00000075 BB0000                   mov  bx, 0
   361 00000078 CD10                     db 205,16
   362                                  
   363                                  ;-76 int putch(char c)  {if (_ c==10) {al=13; writetty();} al=c; writetty(); }
   364                                  
   365 0000007A C3                       ret
   366                                  ; ENDP
   367                                  
   368                                  putch:  ; *** PROC ***
   369                                  ;Function : putch, Number of local variables: 1
   370                                  ;   # type sign width addr used name   list of local variables
   371                                  ;  200 var sign byte    76 NULL c = bp+4;
   372 0000007B C8000000                 ENTER  0,0 ; constant expression
   373 0000007F 807E040A                cmp byte[bp+4], 10
   374 00000083 0F850500                 jne .putch1
   375 00000087 B00D                     mov  al, 13
   376 00000089 E8E7FF                   call writetty
   377                                  .putch1:
   378 0000008C 8A4604                   mov  al, [bp+4]
   379 0000008F E8E1FF                   call writetty
   380                                  
   381                                  ;-77 int cputs(char *s) {char c;  while(*s) { c=*s; putch(c); s++; } }
   382 00000092 C9                       LEAVE
   383 00000093 C3                       ret
   384                                  ; ENDP
   385                                  
   386                                  cputs:  ; *** PROC ***
   387                                  ;Function : cputs, Number of local variables: 2
   388                                  ;   # type sign width addr used name   list of local variables
   389                                  ;  200 ptr sign byte    77 NULL s = bp+4
   390                                  ;  201 var sign byte    77 NULL c = bp-2;
   391 00000094 C8020000                 ENTER  2,0
   392                                  .cputs2:
   393 00000098 8B5E04                   mov bx, [bp+4]
   394 0000009B 8A07                     mov al, [bx]
   395 0000009D B400                     mov ah, 0
   396 0000009F 08C0                     or  al, al
   397 000000A1 0F841B00                 je .cputs3
   398 000000A5 8B5E04                   mov bx, [bp+4]
   399 000000A8 8A07                     mov al, [bx]
   400 000000AA B400                     mov ah, 0
   401 000000AC 8846FE                   mov [bp-2], al
   402 000000AF 8A46FE                   mov al, byte [bp-2]
   403 000000B2 B400                     mov ah, 0
   404 000000B4 50                       push ax
   405 000000B5 E8C3FF                   call putch
   406 000000B8 83C402                   add  sp, 2
   407 000000BB FF4604                   inc  word[bp+4]
   408 000000BE EBD8                     jmp .cputs2
   409                                  .cputs3:
   410                                  
   411                                  ;-78 int mkneg(int n)   { n; __asm {neg ax} }
   412 000000C0 C9                       LEAVE
   413 000000C1 C3                       ret
   414                                  ; ENDP
   415                                  
   416                                  mkneg:  ; *** PROC ***
   417                                  ;Function : mkneg, Number of local variables: 1
   418                                  ;   # type sign width addr used name   list of local variables
   419                                  ;  200 var sign word    78 NULL n = bp+4;
   420 000000C2 C8000000                 ENTER  0,0
   421 000000C6 8B4604                   mov ax, [bp+4]
   422 000000C9 F7D8                    neg ax
   423                                  
   424                                  ;-79 
   425                                  
   426                                  
   427                                  ;-80 int DosInt() { 
   428 000000CB C9                       LEAVE
   429 000000CC C3                       ret
   430                                  ; ENDP
   431                                  
   432                                  DosInt:  ; *** PROC ***
   433                                  
   434                                  ;-81     __emit__(0xCD,0x21);//inth 0x21; 
   435                                  
   436 000000CD CD21                     db 205,33
   437                                  
   438                                  ;-82     __emit__(0x73, 04); //ifcarry DOS_ERR++;
   439                                  
   440 000000CF 7304                     db 115,4
   441                                  
   442                                  ;-83     DOS_ERR++;
   443                                  
   444 000000D1 FF06[6E00]               inc  word[DOS_ERR]
   445                                  
   446                                  ;-84 }
   447                                  
   448                                  
   449                                  ;-85 int openR (char *s) { dx=s;       ax=0x3D02; DosInt(); }
   450                                  
   451 000000D5 C3                       ret
   452                                  ; ENDP
   453                                  
   454                                  openR:  ; *** PROC ***
   455                                  ;Function : openR, Number of local variables: 1
   456                                  ;   # type sign width addr used name   list of local variables
   457                                  ;  200 ptr sign byte    85 NULL s = bp+4;
   458 000000D6 C8000000                 ENTER  0,0
   459 000000DA 8B5604                   mov  dx, [bp+4]
   460 000000DD B8023D                   mov  ax, 15618
   461 000000E0 E8EAFF                   call DosInt
   462                                  
   463                                  ;-86 int creatR(char *s) { dx=s; cx=0; ax=0x3C00; DosInt(); }
   464 000000E3 C9                       LEAVE
   465 000000E4 C3                       ret
   466                                  ; ENDP
   467                                  
   468                                  creatR:  ; *** PROC ***
   469                                  ;Function : creatR, Number of local variables: 1
   470                                  ;   # type sign width addr used name   list of local variables
   471                                  ;  200 ptr sign byte    86 NULL s = bp+4;
   472 000000E5 C8000000                 ENTER  0,0
   473 000000E9 8B5604                   mov  dx, [bp+4]
   474 000000EC B90000                   mov  cx, 0
   475 000000EF B8003C                   mov  ax, 15360
   476 000000F2 E8D8FF                   call DosInt
   477                                  
   478                                  ;-87 int fcloseR(int fd) {bx=fd;       ax=0x3E00; DosInt(); }
   479 000000F5 C9                       LEAVE
   480 000000F6 C3                       ret
   481                                  ; ENDP
   482                                  
   483                                  fcloseR:  ; *** PROC ***
   484                                  ;Function : fcloseR, Number of local variables: 1
   485                                  ;   # type sign width addr used name   list of local variables
   486                                  ;  200 var sign word    87 NULL fd = bp+4;
   487 000000F7 C8000000                 ENTER  0,0
   488 000000FB 8B5E04                   mov  bx, [bp+4]
   489 000000FE B8003E                   mov  ax, 15872
   490 00000101 E8C9FF                   call DosInt
   491                                  
   492                                  ;-88 int exitR  (char c) {ah=0x4C; al=c;          DosInt(); }
   493 00000104 C9                       LEAVE
   494 00000105 C3                       ret
   495                                  ; ENDP
   496                                  
   497                                  exitR:  ; *** PROC ***
   498                                  ;Function : exitR, Number of local variables: 1
   499                                  ;   # type sign width addr used name   list of local variables
   500                                  ;  200 var sign byte    88 NULL c = bp+4;
   501 00000106 C8000000                 ENTER  0,0
   502 0000010A B44C                     mov  ah, 76
   503 0000010C 8A4604                   mov  al, [bp+4]
   504 0000010F E8BBFF                   call DosInt
   505                                  
   506                                  ;-89 int readRL(char *s, int fd, int len){dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}
   507 00000112 C9                       LEAVE
   508 00000113 C3                       ret
   509                                  ; ENDP
   510                                  
   511                                  readRL:  ; *** PROC ***
   512                                  ;Function : readRL, Number of local variables: 3
   513                                  ;   # type sign width addr used name   list of local variables
   514                                  ;  200 ptr sign byte    89 NULL s = bp+4
   515                                  ;  201 var sign word    89 NULL fd = bp+6
   516                                  ;  202 var sign word    89 NULL len = bp+8;
   517 00000114 C8000000                 ENTER  0,0
   518 00000118 8B5604                   mov  dx, [bp+4]
   519 0000011B 8B4E08                   mov  cx, [bp+8]
   520 0000011E 8B5E06                   mov  bx, [bp+6]
   521 00000121 B8003F                   mov  ax, 16128
   522 00000124 E8A6FF                   call DosInt
   523                                  
   524                                  ;-90 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
   525 00000127 C9                       LEAVE
   526 00000128 C3                       ret
   527                                  ; ENDP
   528                                  
   529                                  fputcR:  ; *** PROC ***
   530                                  ;Function : fputcR, Number of local variables: 2
   531                                  ;   # type sign width addr used name   list of local variables
   532                                  ;  200 ptr sign byte    90 NULL n = bp+4
   533                                  ;  201 var sign word    90 NULL fd = bp+6;
   534 00000129 C8000000                 ENTER  0,0
   535 0000012D 8D5604                  lea dx, [bp+4]
   536                                  
   537                                  ;-91   cx=1; bx=fd; ax=0x4000; DosInt(); }
   538                                  
   539 00000130 B90100                   mov  cx, 1
   540 00000133 8B5E06                   mov  bx, [bp+6]
   541 00000136 B80040                   mov  ax, 16384
   542 00000139 E891FF                   call DosInt
   543                                  
   544                                  ;-92 
   545                                  
   546                                  
   547                                  ;-93 int strlen(char *s) { int c; c=0; while (*s!=0) {s++; c++;} return c; }
   548 0000013C C9                       LEAVE
   549 0000013D C3                       ret
   550                                  ; ENDP
   551                                  
   552                                  strlen:  ; *** PROC ***
   553                                  ;Function : strlen, Number of local variables: 2
   554                                  ;   # type sign width addr used name   list of local variables
   555                                  ;  200 ptr sign byte    93 NULL s = bp+4
   556                                  ;  201 var sign word    93 NULL c = bp-2;
   557 0000013E C8020000                 ENTER  2,0
   558 00000142 B80000                   mov ax, 0
   559 00000145 8946FE                   mov [bp-2], ax
   560                                  .strlen4:
   561 00000148 8B5E04                   mov bx, [bp+4]
   562 0000014B 8A07                     mov al, [bx]
   563 0000014D B400                     mov ah, 0
   564 0000014F 83F800                   cmp ax, 0
   565 00000152 0F840800                 je  .strlen5
   566 00000156 FF4604                   inc  word[bp+4]
   567 00000159 FF46FE                   inc  word[bp-2]
   568 0000015C EBEA                     jmp .strlen4
   569                                  .strlen5:
   570 0000015E 8B46FE                   mov ax, [bp-2]
   571 00000161 E90000                   jmp .retnstrlen
   572                                  
   573                                  ;-94 int strcpy(char *s, char *t) {do { *s=*t; s++; t++; } while (*t!=0); *s=0; }
   574                                  
   575 00000164 C9                       .retnstrlen: LEAVE
   576 00000165 C3                       ret
   577                                  ; ENDP
   578                                  
   579                                  strcpy:  ; *** PROC ***
   580                                  ;Function : strcpy, Number of local variables: 2
   581                                  ;   # type sign width addr used name   list of local variables
   582                                  ;  200 ptr sign byte    94 NULL s = bp+4
   583                                  ;  201 ptr sign byte    94 NULL t = bp+6;
   584 00000166 C8000000                 ENTER  0,0
   585                                  .strcpy6:
   586 0000016A 8B5E06                   mov bx, [bp+6]
   587 0000016D 8A07                     mov al, [bx]
   588 0000016F B400                     mov ah, 0
   589 00000171 8B5E04                   mov  bx, [bp+4]
   590 00000174 8807                     mov  [bx], al
   591 00000176 FF4604                   inc  word[bp+4]
   592 00000179 FF4606                   inc  word[bp+6]
   593 0000017C 8B5E06                   mov bx, [bp+6]
   594 0000017F 8A07                     mov al, [bx]
   595 00000181 B400                     mov ah, 0
   596 00000183 83F800                   cmp ax, 0
   597 00000186 0F840200                 je  .strcpy7
   598 0000018A EBDE                     jmp .strcpy6
   599                                  .strcpy7:
   600 0000018C B80000                   mov ax, 0
   601 0000018F 8B5E04                   mov  bx, [bp+4]
   602 00000192 8807                     mov  [bx], al
   603                                  
   604                                  ;-95 int eqstr(char *p, char *q) { while(*p) {
   605 00000194 C9                       LEAVE
   606 00000195 C3                       ret
   607                                  ; ENDP
   608                                  
   609                                  eqstr:  ; *** PROC ***
   610                                  ;Function : eqstr, Number of local variables: 2
   611                                  ;   # type sign width addr used name   list of local variables
   612                                  ;  200 ptr sign byte    95 NULL p = bp+4
   613                                  ;  201 ptr sign byte    95 NULL q = bp+6;
   614 00000196 C8000000                 ENTER  0,0
   615                                  .eqstr8:
   616 0000019A 8B5E04                   mov bx, [bp+4]
   617 0000019D 8A07                     mov al, [bx]
   618 0000019F B400                     mov ah, 0
   619 000001A1 08C0                     or  al, al
   620 000001A3 0F842000                 je .eqstr9
   621                                  
   622                                  ;-96     if (*p != *q) return 0; p++; q++; }
   623                                  
   624 000001A7 8B5E04                   mov bx, [bp+4]
   625 000001AA 8A07                     mov al, [bx]
   626 000001AC B400                     mov ah, 0
   627 000001AE 8B5E06                   mov bx, [bp+6]
   628 000001B1 3A07                     cmp al, [bx]
   629 000001B3 B400                     mov ah, 0
   630 000001B5 0F840600                 je  .eqstr10
   631 000001B9 B80000                   mov ax, 0
   632 000001BC E92100                   jmp .retneqstr
   633                                  .eqstr10:
   634 000001BF FF4604                   inc  word[bp+4]
   635 000001C2 FF4606                   inc  word[bp+6]
   636                                  
   637                                  ;-97     if(*q) return 0; return 1; }
   638                                  
   639 000001C5 EBD3                     jmp .eqstr8
   640                                  .eqstr9:
   641 000001C7 8B5E06                   mov bx, [bp+6]
   642 000001CA 8A07                     mov al, [bx]
   643 000001CC B400                     mov ah, 0
   644 000001CE 08C0                     or  al, al
   645 000001D0 0F840600                 je .eqstr11
   646 000001D4 B80000                   mov ax, 0
   647 000001D7 E90600                   jmp .retneqstr
   648                                  .eqstr11:
   649 000001DA B80100                   mov ax, 1
   650 000001DD E90000                   jmp .retneqstr
   651                                  
   652                                  ;-98 int instr1(char *s, char c) { while(*s) {if (*s==c) return 1; s++;}return 0;}
   653                                  
   654 000001E0 C9                       .retneqstr: LEAVE
   655 000001E1 C3                       ret
   656                                  ; ENDP
   657                                  
   658                                  instr1:  ; *** PROC ***
   659                                  ;Function : instr1, Number of local variables: 2
   660                                  ;   # type sign width addr used name   list of local variables
   661                                  ;  200 ptr sign byte    98 NULL s = bp+4
   662                                  ;  201 var sign byte    98 NULL c = bp+6;
   663 000001E2 C8000000                 ENTER  0,0
   664                                  .instr112:
   665 000001E6 8B5E04                   mov bx, [bp+4]
   666 000001E9 8A07                     mov al, [bx]
   667 000001EB B400                     mov ah, 0
   668 000001ED 08C0                     or  al, al
   669 000001EF 0F841900                 je .instr113
   670 000001F3 8B5E04                   mov bx, [bp+4]
   671 000001F6 8A07                     mov al, [bx]
   672 000001F8 B400                     mov ah, 0
   673 000001FA 3A4606                   cmp al, [bp+6]
   674 000001FD 0F850600                 jne .instr114
   675 00000201 B80100                   mov ax, 1
   676 00000204 E90B00                   jmp .retninstr1
   677                                  .instr114:
   678 00000207 FF4604                   inc  word[bp+4]
   679 0000020A EBDA                     jmp .instr112
   680                                  .instr113:
   681 0000020C B80000                   mov ax, 0
   682 0000020F E90000                   jmp .retninstr1
   683                                  
   684                                  ;-99 int strcat1(char *s, char *t) { while (*s != 0) s++; strcpy(s, t);  }
   685                                  
   686 00000212 C9                       .retninstr1: LEAVE
   687 00000213 C3                       ret
   688                                  ; ENDP
   689                                  
   690                                  strcat1:  ; *** PROC ***
   691                                  ;Function : strcat1, Number of local variables: 2
   692                                  ;   # type sign width addr used name   list of local variables
   693                                  ;  200 ptr sign byte    99 NULL s = bp+4
   694                                  ;  201 ptr sign byte    99 NULL t = bp+6;
   695 00000214 C8000000                 ENTER  0,0
   696                                  .strcat115:
   697 00000218 8B5E04                   mov bx, [bp+4]
   698 0000021B 8A07                     mov al, [bx]
   699 0000021D B400                     mov ah, 0
   700 0000021F 83F800                   cmp ax, 0
   701 00000222 0F840500                 je  .strcat116
   702 00000226 FF4604                   inc  word[bp+4]
   703 00000229 EBED                     jmp .strcat115
   704                                  .strcat116:
   705 0000022B FF7606                   push word [bp+6]
   706 0000022E FF7604                   push word [bp+4]
   707 00000231 E832FF                   call strcpy
   708 00000234 83C404                   add  sp, 4
   709                                  
   710                                  ;-100 int toupper(char *s) {while(*s) {if (*s >= 'a') if (*s <= 'z') *s=*s-32; s++;}}
   711 00000237 C9                       LEAVE
   712 00000238 C3                       ret
   713                                  ; ENDP
   714                                  
   715                                  toupper:  ; *** PROC ***
   716                                  ;Function : toupper, Number of local variables: 1
   717                                  ;   # type sign width addr used name   list of local variables
   718                                  ;  200 ptr sign byte   100 NULL s = bp+4;
   719 00000239 C8000000                 ENTER  0,0
   720                                  .toupper17:
   721 0000023D 8B5E04                   mov bx, [bp+4]
   722 00000240 8A07                     mov al, [bx]
   723 00000242 B400                     mov ah, 0
   724 00000244 08C0                     or  al, al
   725 00000246 0F843000                 je .toupper18
   726 0000024A 8B5E04                   mov bx, [bp+4]
   727 0000024D 8A07                     mov al, [bx]
   728 0000024F B400                     mov ah, 0
   729 00000251 83F861                   cmp ax, 97 ;unsigned : 1
   730 00000254 0F8C1D00                 jl  .toupper19
   731 00000258 8B5E04                   mov bx, [bp+4]
   732 0000025B 8A07                     mov al, [bx]
   733 0000025D B400                     mov ah, 0
   734 0000025F 83F87A                   cmp ax, 122
   735 00000262 0F8F0F00                 jg  .toupper20
   736 00000266 8B5E04                   mov bx, [bp+4]
   737 00000269 8A07                     mov al, [bx]
   738 0000026B B400                     mov ah, 0
   739 0000026D 83E820                   sub ax, 32
   740 00000270 8B5E04                   mov  bx, [bp+4]
   741 00000273 8807                     mov  [bx], al
   742                                  .toupper20:
   743                                  .toupper19:
   744 00000275 FF4604                   inc  word[bp+4]
   745 00000278 EBC3                     jmp .toupper17
   746                                  .toupper18:
   747                                  
   748                                  ;-101 
   749                                  
   750                                  
   751                                  ;-102 int digit(char c){ 
   752 0000027A C9                       LEAVE
   753 0000027B C3                       ret
   754                                  ; ENDP
   755                                  
   756                                  digit:  ; *** PROC ***
   757                                  
   758                                  ;-103     if(c<'0') return 0; 
   759                                  
   760                                  ;Function : digit, Number of local variables: 1
   761                                  ;   # type sign width addr used name   list of local variables
   762                                  ;  200 var sign byte   102 NULL c = bp+4;
   763 0000027C C8000000                 ENTER  0,0
   764 00000280 8A4604                   mov al, [bp+4]
   765 00000283 3C30                     cmp al, 48
   766 00000285 0F8D0600                 jge .digit21
   767 00000289 B80000                   mov ax, 0
   768 0000028C E91500                   jmp .retndigit
   769                                  
   770                                  ;-104     if(c>'9') return 0; 
   771                                  
   772                                  .digit21:
   773 0000028F 8A4604                   mov al, [bp+4]
   774 00000292 3C39                     cmp al, 57
   775 00000294 0F8E0600                 jle .digit22
   776 00000298 B80000                   mov ax, 0
   777 0000029B E90600                   jmp .retndigit
   778                                  
   779                                  ;-105     return 1; 
   780                                  
   781                                  .digit22:
   782 0000029E B80100                   mov ax, 1
   783 000002A1 E90000                   jmp .retndigit
   784                                  
   785                                  ;-106 }
   786                                  
   787                                  
   788                                  ;-107 int letter(char c) { 
   789                                  
   790 000002A4 C9                       .retndigit: LEAVE
   791 000002A5 C3                       ret
   792                                  ; ENDP
   793                                  
   794                                  letter:  ; *** PROC ***
   795                                  
   796                                  ;-108     if (c=='_') return 1;
   797                                  
   798                                  ;Function : letter, Number of local variables: 1
   799                                  ;   # type sign width addr used name   list of local variables
   800                                  ;  200 var sign byte   107 NULL c = bp+4;
   801 000002A6 C8000000                 ENTER  0,0
   802 000002AA 8A4604                   mov al, [bp+4]
   803 000002AD 3C5F                     cmp al, 95
   804 000002AF 0F850600                 jne .letter23
   805 000002B3 B80100                   mov ax, 1
   806 000002B6 E96900                   jmp .retnletter
   807                                  
   808                                  ;-109     if (c=='.') return 1;
   809                                  
   810                                  .letter23:
   811 000002B9 8A4604                   mov al, [bp+4]
   812 000002BC 3C2E                     cmp al, 46
   813 000002BE 0F850600                 jne .letter24
   814 000002C2 B80100                   mov ax, 1
   815 000002C5 E95A00                   jmp .retnletter
   816                                  
   817                                  ;-110     if (c=='?') return 1;
   818                                  
   819                                  .letter24:
   820 000002C8 8A4604                   mov al, [bp+4]
   821 000002CB 3C3F                     cmp al, 63
   822 000002CD 0F850600                 jne .letter25
   823 000002D1 B80100                   mov ax, 1
   824 000002D4 E94B00                   jmp .retnletter
   825                                  
   826                                  ;-111     if (c=='$') return 1;
   827                                  
   828                                  .letter25:
   829 000002D7 8A4604                   mov al, [bp+4]
   830 000002DA 3C24                     cmp al, 36
   831 000002DC 0F850600                 jne .letter26
   832 000002E0 B80100                   mov ax, 1
   833 000002E3 E93C00                   jmp .retnletter
   834                                  
   835                                  ;-112     if (c> 'z') return 0; 
   836                                  
   837                                  .letter26:
   838 000002E6 8A4604                   mov al, [bp+4]
   839 000002E9 3C7A                     cmp al, 122
   840 000002EB 0F8E0600                 jle .letter27
   841 000002EF B80000                   mov ax, 0
   842 000002F2 E92D00                   jmp .retnletter
   843                                  
   844                                  ;-113     if (c< '@') return 0;// at included
   845                                  
   846                                  .letter27:
   847 000002F5 8A4604                   mov al, [bp+4]
   848 000002F8 3C40                     cmp al, 64
   849 000002FA 0F8D0600                 jge .letter28
   850 000002FE B80000                   mov ax, 0
   851 00000301 E91E00                   jmp .retnletter
   852                                  
   853                                  ;-114     if (c> 'Z') { if (c< 'a') return 0; }  
   854                                  
   855                                  .letter28:
   856 00000304 8A4604                   mov al, [bp+4]
   857 00000307 3C5A                     cmp al, 90
   858 00000309 0F8E0F00                 jle .letter29
   859 0000030D 8A4604                   mov al, [bp+4]
   860 00000310 3C61                     cmp al, 97
   861 00000312 0F8D0600                 jge .letter30
   862 00000316 B80000                   mov ax, 0
   863 00000319 E90600                   jmp .retnletter
   864                                  .letter30:
   865                                  
   866                                  ;-115     return 1; 
   867                                  
   868                                  .letter29:
   869 0000031C B80100                   mov ax, 1
   870 0000031F E90000                   jmp .retnletter
   871                                  
   872                                  ;-116 }    
   873                                  
   874                                  
   875                                  ;-117 int alnum(char c) {
   876                                  
   877 00000322 C9                       .retnletter: LEAVE
   878 00000323 C3                       ret
   879                                  ; ENDP
   880                                  
   881                                  alnum:  ; *** PROC ***
   882                                  
   883                                  ;-118   if (digit (c)) return 1;
   884                                  
   885                                  ;Function : alnum, Number of local variables: 1
   886                                  ;   # type sign width addr used name   list of local variables
   887                                  ;  200 var sign byte   117 NULL c = bp+4;
   888 00000324 C8000000                 ENTER  0,0
   889 00000328 8A4604                   mov al, byte [bp+4]
   890 0000032B B400                     mov ah, 0
   891 0000032D 50                       push ax
   892 0000032E E84BFF                   call digit
   893 00000331 83C402                   add  sp, 2
   894 00000334 08C0                     or  al, al
   895 00000336 0F840600                 je .alnum31
   896 0000033A B80100                   mov ax, 1
   897 0000033D E91E00                   jmp .retnalnum
   898                                  
   899                                  ;-119   if (letter(c)) return 1;
   900                                  
   901                                  .alnum31:
   902 00000340 8A4604                   mov al, byte [bp+4]
   903 00000343 B400                     mov ah, 0
   904 00000345 50                       push ax
   905 00000346 E85DFF                   call letter
   906 00000349 83C402                   add  sp, 2
   907 0000034C 08C0                     or  al, al
   908 0000034E 0F840600                 je .alnum32
   909 00000352 B80100                   mov ax, 1
   910 00000355 E90600                   jmp .retnalnum
   911                                  
   912                                  ;-120   return 0;
   913                                  
   914                                  .alnum32:
   915 00000358 B80000                   mov ax, 0
   916 0000035B E90000                   jmp .retnalnum
   917                                  
   918                                  ;-121 }       
   919                                  
   920                                  
   921                                  ;-122 int a(unsigned int i) {  printName(i);}//address
   922                                  
   923 0000035E C9                       .retnalnum: LEAVE
   924 0000035F C3                       ret
   925                                  ; ENDP
   926                                  
   927                                  a:  ; *** PROC ***
   928                                  ;Function : a, Number of local variables: 1
   929                                  ;   # type sign width addr used name   list of local variables
   930                                  ;  200 var unsg word   122 NULL i = bp+4;
   931 00000360 C8000000                 ENTER  0,0
   932 00000364 FF7604                   push word [bp+4]
   933 00000367 E88D05                   call printName
   934 0000036A 83C402                   add  sp, 2
   935                                  
   936                                  ;-123 int v(unsigned int i) {//value 
   937 0000036D C9                       LEAVE
   938 0000036E C3                       ret
   939                                  ; ENDP
   940                                  
   941                                  v:  ; *** PROC ***
   942                                  
   943                                  ;-124     if (i < LSTART) prc('['); 
   944                                  
   945                                  ;Function : v, Number of local variables: 1
   946                                  ;   # type sign width addr used name   list of local variables
   947                                  ;  200 var unsg word   123 NULL i = bp+4;
   948 0000036F C8000000                 ENTER  0,0
   949 00000373 8B4604                   mov ax, [bp+4]
   950 00000376 3DC800                   cmp ax, 200
   951 00000379 0F8D0800                 jge .v33
   952 0000037D 6A5B                     push 91
   953 0000037F E80041                   call prc
   954 00000382 83C402                   add  sp, 2
   955                                  
   956                                  ;-125     printName(i);
   957                                  
   958                                  .v33:
   959 00000385 FF7604                   push word [bp+4]
   960 00000388 E86C05                   call printName
   961 0000038B 83C402                   add  sp, 2
   962                                  
   963                                  ;-126     if (i < LSTART) prc(']');   
   964                                  
   965 0000038E 8B4604                   mov ax, [bp+4]
   966 00000391 3DC800                   cmp ax, 200
   967 00000394 0F8D0800                 jge .v34
   968 00000398 6A5D                     push 93
   969 0000039A E8E540                   call prc
   970 0000039D 83C402                   add  sp, 2
   971                                  
   972                                  ;-127 }
   973                                  
   974                                  .v34:
   975                                  
   976                                  ;-128 int checknamelen() { int i;    i=strlen(symbol);
   977 000003A0 C9                       LEAVE
   978 000003A1 C3                       ret
   979                                  ; ENDP
   980                                  
   981                                  checknamelen:  ; *** PROC ***
   982                                  ;Function : checknamelen, Number of local variables: 1
   983                                  ;   # type sign width addr used name   list of local variables
   984                                  ;  200 var sign word   128 NULL i = bp-2;
   985 000003A2 C8020000                 ENTER  2,0
   986 000003A6 8D062B81                 lea  ax, [symbol]
   987 000003AA 50                       push ax
   988 000003AB E890FD                   call strlen
   989 000003AE 83C402                   add  sp, 2
   990 000003B1 8946FE                   mov [bp-2], ax
   991                                  
   992                                  ;-129   if (i > IDLENMAX) error1("Item name is too long in characters)");
   993                                  
   994 000003B4 8B46FE                   mov ax, [bp-2]
   995 000003B7 83F80F                   cmp ax, 15
   996 000003BA 0F8E0900                 jle .checknamelen35
   997 000003BE 68[C903]                 push checknamelen_0
   998 000003C1 E8C943                   call error1
   999 000003C4 83C402                   add  sp, 2
  1000                                  
  1001                                  ;-130 }
  1002                                  
  1003                                  .checknamelen35:
  1004                                  
  1005                                  ;-131 char doglobName[IDLENMAX];
  1006 000003C7 C9                       LEAVE
  1007 000003C8 C3                       ret
  1008 000003C9 4974656D206E616D65-     checknamelen_0 db "Item name is too long in characters)",0
  1009 000003D2 20697320746F6F206C-
  1010 000003DB 6F6E6720696E206368-
  1011 000003E4 617261637465727329-
  1012 000003ED 00                 
  1013                                  ; ENDP
  1014                                  section .bss
  1015                                  absolute -12145
  1016 FFFFD08F <res 0000000F>          doglobName resb 15
  1017                                  section .text
  1018                                  
  1019                                  ;-132 int doglob() { int i; int j; int isstrarr; isstrarr=0;
  1020                                  
  1021                                  
  1022                                  doglob:  ; *** PROC ***
  1023                                  ;Function : doglob, Number of local variables: 3
  1024                                  ;   # type sign width addr used name   list of local variables
  1025                                  ;  200 var sign word   132 NULL i = bp-2
  1026                                  ;  201 var sign word   132 NULL j = bp-4
  1027                                  ;  202 var sign word   132 NULL isstrarr = bp-6;
  1028 000003EE C8060000                 ENTER  6,0
  1029 000003F2 B80000                   mov ax, 0
  1030 000003F5 8946FA                   mov [bp-6], ax
  1031                                  
  1032                                  ;-133   if (GTop >= LSTART) error1("Global table full");
  1033                                  
  1034 000003F8 A1[2A00]                 mov ax, [GTop]
  1035 000003FB 3DC800                   cmp ax, 200 ;unsigned : 1
  1036 000003FE 0F8C0900                 jl  .doglob36
  1037 00000402 68[4307]                 push doglob_0
  1038 00000405 E88543                   call error1
  1039 00000408 83C402                   add  sp, 2
  1040                                  
  1041                                  ;-134   if (iswidth == 0) error1("no VOID as var type");
  1042                                  
  1043                                  .doglob36:
  1044 0000040B A0[3800]                 mov al, [iswidth]
  1045 0000040E 3C00                     cmp al, 0
  1046 00000410 0F850900                 jne .doglob37
  1047 00000414 68[5507]                 push doglob_1
  1048 00000417 E87343                   call error1
  1049 0000041A 83C402                   add  sp, 2
  1050                                  
  1051                                  ;-135   checknamelen();
  1052                                  
  1053                                  .doglob37:
  1054 0000041D E882FF                   call checknamelen
  1055                                  
  1056                                  ;-136   if (checkName() != 0) error1("Variable already defined");
  1057                                  
  1058 00000420 E88305                   call checkName
  1059 00000423 3C00                     cmp al, 0
  1060 00000425 0F840900                 je  .doglob38
  1061 00000429 68[6907]                 push doglob_2
  1062 0000042C E85E43                   call error1
  1063 0000042F 83C402                   add  sp, 2
  1064                                  
  1065                                  ;-137   if (istoken('[')) { istype='&';
  1066                                  
  1067                                  .doglob38:
  1068 00000432 6A5B                     push 91
  1069 00000434 E87D3F                   call istoken
  1070 00000437 83C402                   add  sp, 2
  1071 0000043A 08C0                     or  al, al
  1072 0000043C 0F84E201                 je .doglob39
  1073 00000440 B82600                   mov ax, 38
  1074 00000443 A2[3200]                 mov byte [istype], al
  1075                                  
  1076                                  ;-138     if (istoken(T_CONST)) {
  1077                                  
  1078 00000446 680101                   push 257
  1079 00000449 E8683F                   call istoken
  1080 0000044C 83C402                   add  sp, 2
  1081 0000044F 08C0                     or  al, al
  1082 00000451 0F84C200                 je .doglob40
  1083                                  
  1084                                  ;-139       prs("\nsection .bss\nabsolute ");
  1085                                  
  1086 00000455 68[8207]                 push doglob_3
  1087 00000458 E88E40                   call prs
  1088 0000045B 83C402                   add  sp, 2
  1089                                  
  1090                                  ;-140       pint1(orgData);
  1091                                  
  1092 0000045E FF36[1000]               push word [orgData]
  1093 00000462 E87B41                   call pint1
  1094 00000465 83C402                   add  sp, 2
  1095                                  
  1096                                  ;-141       prs("\n"); prs(symbol); 
  1097                                  
  1098 00000468 68[9C07]                 push doglob_4
  1099 0000046B E87B40                   call prs
  1100 0000046E 83C402                   add  sp, 2
  1101 00000471 8D062B81                 lea  ax, [symbol]
  1102 00000475 50                       push ax
  1103 00000476 E87040                   call prs
  1104 00000479 83C402                   add  sp, 2
  1105                                  
  1106                                  ;-142       if (iswidth==1) prs(" resb "); 
  1107                                  
  1108 0000047C A0[3800]                 mov al, [iswidth]
  1109 0000047F 3C01                     cmp al, 1
  1110 00000481 0F850900                 jne .doglob41
  1111 00000485 68[9F07]                 push doglob_5
  1112 00000488 E85E40                   call prs
  1113 0000048B 83C402                   add  sp, 2
  1114                                  
  1115                                  ;-143       if (iswidth==2) prs(" resw ");
  1116                                  
  1117                                  .doglob41:
  1118 0000048E A0[3800]                 mov al, [iswidth]
  1119 00000491 3C02                     cmp al, 2
  1120 00000493 0F850900                 jne .doglob42
  1121 00000497 68[A607]                 push doglob_6
  1122 0000049A E84C40                   call prs
  1123 0000049D 83C402                   add  sp, 2
  1124                                  
  1125                                  ;-144       if (iswidth==4) prs(" resd ");
  1126                                  
  1127                                  .doglob42:
  1128 000004A0 A0[3800]                 mov al, [iswidth]
  1129 000004A3 3C04                     cmp al, 4
  1130 000004A5 0F850900                 jne .doglob43
  1131 000004A9 68[AD07]                 push doglob_7
  1132 000004AC E83A40                   call prs
  1133 000004AF 83C402                   add  sp, 2
  1134                                  
  1135                                  ;-145       pint1(lexval); 
  1136                                  
  1137                                  .doglob43:
  1138 000004B2 FF36[2E00]               push word [lexval]
  1139 000004B6 E82741                   call pint1
  1140 000004B9 83C402                   add  sp, 2
  1141                                  
  1142                                  ;-146       prs("\nsection .text");
  1143                                  
  1144 000004BC 68[B407]                 push doglob_8
  1145 000004BF E82740                   call prs
  1146 000004C2 83C402                   add  sp, 2
  1147                                  
  1148                                  ;-147       orgData=orgData+lexval;
  1149                                  
  1150 000004C5 A1[1000]                 mov ax, [orgData]
  1151 000004C8 0306[2E00]               add ax, [lexval]
  1152 000004CC A3[1000]                 mov word [orgData], ax
  1153                                  
  1154                                  ;-148       if (iswidth==2) orgData=orgData+lexval;
  1155                                  
  1156 000004CF A0[3800]                 mov al, [iswidth]
  1157 000004D2 3C02                     cmp al, 2
  1158 000004D4 0F850A00                 jne .doglob44
  1159 000004D8 A1[1000]                 mov ax, [orgData]
  1160 000004DB 0306[2E00]               add ax, [lexval]
  1161 000004DF A3[1000]                 mov word [orgData], ax
  1162                                  
  1163                                  ;-149       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}
  1164                                  
  1165                                  .doglob44:
  1166 000004E2 A0[3800]                 mov al, [iswidth]
  1167 000004E5 3C04                     cmp al, 4
  1168 000004E7 0F851400                 jne .doglob45
  1169 000004EB A1[2E00]                 mov ax, [lexval]
  1170 000004EE BB0300                   mov bx, 3
  1171 000004F1 F7E3                     mul bx
  1172 000004F3 8946FE                   mov [bp-2], ax
  1173 000004F6 A1[1000]                 mov ax, [orgData]
  1174 000004F9 0346FE                   add ax, [bp-2]
  1175 000004FC A3[1000]                 mov word [orgData], ax
  1176                                  
  1177                                  ;-150       GData[GTop]=lexval; expect(']');
  1178                                  
  1179                                  .doglob45:
  1180 000004FF A1[2E00]                 mov ax, [lexval]
  1181 00000502 8B1E[2A00]               mov bx, [GTop]
  1182 00000506 D1E3                     shl bx, 1
  1183 00000508 8987EB8A                 mov [GData+bx], ax
  1184 0000050C 6A5D                     push 93
  1185 0000050E E8C53E                   call expect
  1186 00000511 83C402                   add  sp, 2
  1187                                  
  1188                                  ;-151     }else { expect(']');
  1189                                  
  1190 00000514 E90801                   jmp .doglob46
  1191                                  .doglob40:
  1192 00000517 6A5D                     push 93
  1193 00000519 E8BA3E                   call expect
  1194 0000051C 83C402                   add  sp, 2
  1195                                  
  1196                                  ;-152       if (iswidth != 1) error1("Only ByteArray allowed");
  1197                                  
  1198 0000051F A0[3800]                 mov al, [iswidth]
  1199 00000522 3C01                     cmp al, 1
  1200 00000524 0F840900                 je  .doglob47
  1201 00000528 68[C407]                 push doglob_9
  1202 0000052B E85F42                   call error1
  1203 0000052E 83C402                   add  sp, 2
  1204                                  
  1205                                  ;-153       prs("\n"); prs(symbol); prs(" db "); 
  1206                                  
  1207                                  .doglob47:
  1208 00000531 68[DB07]                 push doglob_10
  1209 00000534 E8B23F                   call prs
  1210 00000537 83C402                   add  sp, 2
  1211 0000053A 8D062B81                 lea  ax, [symbol]
  1212 0000053E 50                       push ax
  1213 0000053F E8A73F                   call prs
  1214 00000542 83C402                   add  sp, 2
  1215 00000545 68[DE07]                 push doglob_11
  1216 00000548 E89E3F                   call prs
  1217 0000054B 83C402                   add  sp, 2
  1218                                  
  1219                                  ;-154       isstrarr=1; strcpy(doglobName, symbol);
  1220                                  
  1221 0000054E B80100                   mov ax, 1
  1222 00000551 8946FA                   mov [bp-6], ax
  1223 00000554 8D062B81                 lea  ax, [symbol]
  1224 00000558 50                       push ax
  1225 00000559 8D068FD0                 lea  ax, [doglobName]
  1226 0000055D 50                       push ax
  1227 0000055E E805FC                   call strcpy
  1228 00000561 83C404                   add  sp, 4
  1229                                  
  1230                                  ;-155       expect('='); 
  1231                                  
  1232 00000564 6A3D                     push 61
  1233 00000566 E86D3E                   call expect
  1234 00000569 83C402                   add  sp, 2
  1235                                  
  1236                                  ;-156       if (istoken(T_STRING)) { 
  1237                                  
  1238 0000056C 680201                   push 258
  1239 0000056F E8423E                   call istoken
  1240 00000572 83C402                   add  sp, 2
  1241 00000575 08C0                     or  al, al
  1242 00000577 0F844200                 je .doglob48
  1243                                  
  1244                                  ;-157         prc(34); prscomment(symbol); prc(34); prs(",0"); 
  1245                                  
  1246 0000057B 6A22                     push 34
  1247 0000057D E8023F                   call prc
  1248 00000580 83C402                   add  sp, 2
  1249 00000583 8D062B81                 lea  ax, [symbol]
  1250 00000587 50                       push ax
  1251 00000588 E8223F                   call prscomment
  1252 0000058B 83C402                   add  sp, 2
  1253 0000058E 6A22                     push 34
  1254 00000590 E8EF3E                   call prc
  1255 00000593 83C402                   add  sp, 2
  1256 00000596 68[E307]                 push doglob_12
  1257 00000599 E84D3F                   call prs
  1258 0000059C 83C402                   add  sp, 2
  1259                                  
  1260                                  ;-158         i=strlen(symbol); GData[GTop]=i; }
  1261                                  
  1262 0000059F 8D062B81                 lea  ax, [symbol]
  1263 000005A3 50                       push ax
  1264 000005A4 E897FB                   call strlen
  1265 000005A7 83C402                   add  sp, 2
  1266 000005AA 8946FE                   mov [bp-2], ax
  1267 000005AD 8B46FE                   mov ax, [bp-2]
  1268 000005B0 8B1E[2A00]               mov bx, [GTop]
  1269 000005B4 D1E3                     shl bx, 1
  1270 000005B6 8987EB8A                 mov [GData+bx], ax
  1271                                  
  1272                                  ;-159       else if (istoken('{' )) { i=0;
  1273                                  
  1274 000005BA E96200                   jmp .doglob49
  1275                                  .doglob48:
  1276 000005BD 6A7B                     push 123
  1277 000005BF E8F23D                   call istoken
  1278 000005C2 83C402                   add  sp, 2
  1279 000005C5 08C0                     or  al, al
  1280 000005C7 0F844B00                 je .doglob50
  1281 000005CB B80000                   mov ax, 0
  1282 000005CE 8946FE                   mov [bp-2], ax
  1283                                  
  1284                                  ;-160         do { if(i) prc(','); 
  1285                                  
  1286                                  .doglob51:
  1287 000005D1 8B46FE                   mov ax, [bp-2]
  1288 000005D4 08C0                     or  al, al
  1289 000005D6 0F840800                 je .doglob52
  1290 000005DA 6A2C                     push 44
  1291 000005DC E8A33E                   call prc
  1292 000005DF 83C402                   add  sp, 2
  1293                                  
  1294                                  ;-161           expect(T_CONST); pint1(lexval); i=1; }
  1295                                  
  1296                                  .doglob52:
  1297 000005E2 680101                   push 257
  1298 000005E5 E8EE3D                   call expect
  1299 000005E8 83C402                   add  sp, 2
  1300 000005EB FF36[2E00]               push word [lexval]
  1301 000005EF E8EE3F                   call pint1
  1302 000005F2 83C402                   add  sp, 2
  1303 000005F5 B80100                   mov ax, 1
  1304 000005F8 8946FE                   mov [bp-2], ax
  1305                                  
  1306                                  ;-162         while (istoken(',')); expect('}'); }  
  1307                                  
  1308 000005FB 6A2C                     push 44
  1309 000005FD E8B43D                   call istoken
  1310 00000600 83C402                   add  sp, 2
  1311 00000603 08C0                     or  al, al
  1312 00000605 0F840200                 je .doglob53
  1313 00000609 EBC6                     jmp .doglob51
  1314                                  .doglob53:
  1315 0000060B 6A7D                     push 125
  1316 0000060D E8C63D                   call expect
  1317 00000610 83C402                   add  sp, 2
  1318                                  
  1319                                  ;-163       else error1("String or number array expected");
  1320                                  
  1321 00000613 E90900                   jmp .doglob54
  1322                                  .doglob50:
  1323 00000616 68[E607]                 push doglob_13
  1324 00000619 E87141                   call error1
  1325 0000061C 83C402                   add  sp, 2
  1326                                  
  1327                                  ;-164       }; 
  1328                                  
  1329                                  .doglob54:
  1330                                  .doglob49:
  1331                                  .doglob46:
  1332                                  
  1333                                  ;-165   }else { //expect('=');
  1334                                  
  1335 0000061F E99E00                   jmp .doglob55
  1336                                  .doglob39:
  1337                                  
  1338                                  ;-166     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");
  1339                                  
  1340 00000622 68[0608]                 push doglob_14
  1341 00000625 E8C13E                   call prs
  1342 00000628 83C402                   add  sp, 2
  1343 0000062B 8D062B81                 lea  ax, [symbol]
  1344 0000062F 50                       push ax
  1345 00000630 E8B63E                   call prs
  1346 00000633 83C402                   add  sp, 2
  1347 00000636 A0[3200]                 mov al, [istype]
  1348 00000639 3C2A                     cmp al, 42
  1349 0000063B 0F850C00                 jne .doglob56
  1350 0000063F 68[0908]                 push doglob_15
  1351 00000642 E8A43E                   call prs
  1352 00000645 83C402                   add  sp, 2
  1353                                  
  1354                                  ;-167     else {
  1355                                  
  1356 00000648 E93300                   jmp .doglob57
  1357                                  .doglob56:
  1358                                  
  1359                                  ;-168       if      (iswidth==1) prs(" db ");
  1360                                  
  1361 0000064B A0[3800]                 mov al, [iswidth]
  1362 0000064E 3C01                     cmp al, 1
  1363 00000650 0F850C00                 jne .doglob58
  1364 00000654 68[0E08]                 push doglob_16
  1365 00000657 E88F3E                   call prs
  1366 0000065A 83C402                   add  sp, 2
  1367                                  
  1368                                  ;-169       else if (iswidth==2) prs(" dw ");
  1369                                  
  1370 0000065D E91E00                   jmp .doglob59
  1371                                  .doglob58:
  1372 00000660 A0[3800]                 mov al, [iswidth]
  1373 00000663 3C02                     cmp al, 2
  1374 00000665 0F850C00                 jne .doglob60
  1375 00000669 68[1308]                 push doglob_17
  1376 0000066C E87A3E                   call prs
  1377 0000066F 83C402                   add  sp, 2
  1378                                  
  1379                                  ;-170       else                 prs(" dd ");
  1380                                  
  1381 00000672 E90900                   jmp .doglob61
  1382                                  .doglob60:
  1383 00000675 68[1808]                 push doglob_18
  1384 00000678 E86E3E                   call prs
  1385 0000067B 83C402                   add  sp, 2
  1386                                  
  1387                                  ;-171     }
  1388                                  
  1389                                  .doglob61:
  1390                                  .doglob59:
  1391                                  
  1392                                  ;-172     if(istoken('-')) prc('-');
  1393                                  
  1394                                  .doglob57:
  1395 0000067E 6A2D                     push 45
  1396 00000680 E8313D                   call istoken
  1397 00000683 83C402                   add  sp, 2
  1398 00000686 08C0                     or  al, al
  1399 00000688 0F840800                 je .doglob62
  1400 0000068C 6A2D                     push 45
  1401 0000068E E8F13D                   call prc
  1402 00000691 83C402                   add  sp, 2
  1403                                  
  1404                                  ;-173     if (istoken('=')) {expect(T_CONST); pint1(lexval); }
  1405                                  
  1406                                  .doglob62:
  1407 00000694 6A3D                     push 61
  1408 00000696 E81B3D                   call istoken
  1409 00000699 83C402                   add  sp, 2
  1410 0000069C 08C0                     or  al, al
  1411 0000069E 0F841600                 je .doglob63
  1412 000006A2 680101                   push 257
  1413 000006A5 E82E3D                   call expect
  1414 000006A8 83C402                   add  sp, 2
  1415 000006AB FF36[2E00]               push word [lexval]
  1416 000006AF E82E3F                   call pint1
  1417 000006B2 83C402                   add  sp, 2
  1418                                  
  1419                                  ;-174     else pint1(0); }
  1420                                  
  1421 000006B5 E90800                   jmp .doglob64
  1422                                  .doglob63:
  1423 000006B8 6A00                     push 0
  1424 000006BA E8233F                   call pint1
  1425 000006BD 83C402                   add  sp, 2
  1426                                  .doglob64:
  1427                                  
  1428                                  ;-175   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;
  1429                                  
  1430                                  .doglob55:
  1431 000006C0 A0[3500]                 mov al, [issign]
  1432 000006C3 8B1E[2A00]               mov bx, [GTop]
  1433 000006C7 8887E383                 mov [GSign+bx], al
  1434 000006CB A0[3800]                 mov al, [iswidth]
  1435 000006CE 8B1E[2A00]               mov bx, [GTop]
  1436 000006D2 88870F85                 mov [GWidth+bx], al
  1437 000006D6 A0[3200]                 mov al, [istype]
  1438 000006D9 8B1E[2A00]               mov bx, [GTop]
  1439 000006DD 8887B782                 mov [GType+bx], al
  1440                                  
  1441                                  ;-176   GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  1442                                  
  1443 000006E1 A1[6600]                 mov ax, [lineno]
  1444 000006E4 83E801                   sub ax, 1
  1445 000006E7 8B1E[2A00]               mov bx, [GTop]
  1446 000006EB D1E3                     shl bx, 1
  1447 000006ED 89873B86                 mov [GAdr+bx], ax
  1448 000006F1 B80000                   mov ax, 0
  1449 000006F4 8B1E[2A00]               mov bx, [GTop]
  1450 000006F8 D1E3                     shl bx, 1
  1451 000006FA 89879388                 mov [GUsed+bx], ax
  1452                                  
  1453                                  ;-177   pt=adrofname(GTop);
  1454                                  
  1455 000006FE FF36[2A00]               push word [GTop]
  1456 00000702 E8CF01                   call adrofname
  1457 00000705 83C402                   add  sp, 2
  1458 00000708 A3[6A00]                 mov word [pt], ax
  1459                                  
  1460                                  ;-178   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);
  1461                                  
  1462 0000070B 8B46FA                   mov ax, [bp-6]
  1463 0000070E 08C0                     or  al, al
  1464 00000710 0F841200                 je .doglob65
  1465 00000714 8D068FD0                 lea  ax, [doglobName]
  1466 00000718 50                       push ax
  1467 00000719 FF36[6A00]               push word [pt]
  1468 0000071D E846FA                   call strcpy
  1469 00000720 83C404                   add  sp, 4
  1470 00000723 E90F00                   jmp .doglob66
  1471                                  .doglob65:
  1472 00000726 8D062B81                 lea  ax, [symbol]
  1473 0000072A 50                       push ax
  1474 0000072B FF36[6A00]               push word [pt]
  1475 0000072F E834FA                   call strcpy
  1476 00000732 83C404                   add  sp, 4
  1477                                  
  1478                                  ;-179   GTop++; expect(';'); }
  1479                                  
  1480                                  .doglob66:
  1481 00000735 FF06[2A00]               inc  word[GTop]
  1482 00000739 6A3B                     push 59
  1483 0000073B E8983C                   call expect
  1484 0000073E 83C402                   add  sp, 2
  1485                                  
  1486                                  ;-180 
  1487                                  
  1488                                  
  1489                                  ;-181 int gettypes(int i) {int j; char c;
  1490 00000741 C9                       LEAVE
  1491 00000742 C3                       ret
  1492 00000743 476C6F62616C207461-     doglob_0 db "Global table full",0
  1493 0000074C 626C652066756C6C00 
  1494 00000755 6E6F20564F49442061-     doglob_1 db "no VOID as var type",0
  1495 0000075E 732076617220747970-
  1496 00000767 6500               
  1497 00000769 5661726961626C6520-     doglob_2 db "Variable already defined",0
  1498 00000772 616C72656164792064-
  1499 0000077B 6566696E656400     
  1500 00000782 5C6E73656374696F6E-     doglob_3 db "\nsection .bss\nabsolute ",0
  1501 0000078B 202E6273735C6E6162-
  1502 00000794 736F6C7574652000   
  1503 0000079C 5C6E00                  doglob_4 db "\n",0
  1504 0000079F 20726573622000          doglob_5 db " resb ",0
  1505 000007A6 20726573772000          doglob_6 db " resw ",0
  1506 000007AD 20726573642000          doglob_7 db " resd ",0
  1507 000007B4 5C6E73656374696F6E-     doglob_8 db "\nsection .text",0
  1508 000007BD 202E7465787400     
  1509 000007C4 4F6E6C792042797465-     doglob_9 db "Only ByteArray allowed",0
  1510 000007CD 417272617920616C6C-
  1511 000007D6 6F77656400         
  1512 000007DB 5C6E00                  doglob_10 db "\n",0
  1513 000007DE 2064622000              doglob_11 db " db ",0
  1514 000007E3 2C3000                  doglob_12 db ",0",0
  1515 000007E6 537472696E67206F72-     doglob_13 db "String or number array expected",0
  1516 000007EF 206E756D6265722061-
  1517 000007F8 727261792065787065-
  1518 00000801 6374656400         
  1519 00000806 5C6E00                  doglob_14 db "\n",0
  1520 00000809 2064772000              doglob_15 db " dw ",0
  1521 0000080E 2064622000              doglob_16 db " db ",0
  1522 00000813 2064772000              doglob_17 db " dw ",0
  1523 00000818 2064642000              doglob_18 db " dd ",0
  1524                                  ; ENDP
  1525                                  
  1526                                  gettypes:  ; *** PROC ***
  1527                                  
  1528                                  ;-182   c=GSign [i]; if (c=='S') signi =1;    else signi =0;
  1529                                  
  1530                                  ;Function : gettypes, Number of local variables: 3
  1531                                  ;   # type sign width addr used name   list of local variables
  1532                                  ;  200 var sign word   181 NULL i = bp+4
  1533                                  ;  201 var sign word   181 NULL j = bp-2
  1534                                  ;  202 var sign byte   181 NULL c = bp-4;
  1535 0000081D C8040000                 ENTER  4,0
  1536 00000821 8B5E04                   mov bx, [bp+4]
  1537 00000824 8A87E383                 mov al, [GSign + bx]
  1538 00000828 8846FC                   mov [bp-4], al
  1539 0000082B 8A46FC                   mov al, [bp-4]
  1540 0000082E 3C53                     cmp al, 83
  1541 00000830 0F850900                 jne .gettypes67
  1542 00000834 B80100                   mov ax, 1
  1543 00000837 A3[3300]                 mov word [signi], ax
  1544 0000083A E90600                   jmp .gettypes68
  1545                                  .gettypes67:
  1546 0000083D B80000                   mov ax, 0
  1547 00000840 A3[3300]                 mov word [signi], ax
  1548                                  
  1549                                  ;-183   c=GWidth[i]; widthi=0;wi=0;
  1550                                  
  1551                                  .gettypes68:
  1552 00000843 8B5E04                   mov bx, [bp+4]
  1553 00000846 8A870F85                 mov al, [GWidth + bx]
  1554 0000084A 8846FC                   mov [bp-4], al
  1555 0000084D B80000                   mov ax, 0
  1556 00000850 A3[3600]                 mov word [widthi], ax
  1557 00000853 B80000                   mov ax, 0
  1558 00000856 A3[3900]                 mov word [wi], ax
  1559                                  
  1560                                  ;-184   if (c==1) {widthi=1;wi=1;}
  1561                                  
  1562 00000859 8A46FC                   mov al, [bp-4]
  1563 0000085C 3C01                     cmp al, 1
  1564 0000085E 0F850C00                 jne .gettypes69
  1565 00000862 B80100                   mov ax, 1
  1566 00000865 A3[3600]                 mov word [widthi], ax
  1567 00000868 B80100                   mov ax, 1
  1568 0000086B A3[3900]                 mov word [wi], ax
  1569                                  
  1570                                  ;-185   if (c==2) {widthi=2;wi=2;}
  1571                                  
  1572                                  .gettypes69:
  1573 0000086E 8A46FC                   mov al, [bp-4]
  1574 00000871 3C02                     cmp al, 2
  1575 00000873 0F850C00                 jne .gettypes70
  1576 00000877 B80200                   mov ax, 2
  1577 0000087A A3[3600]                 mov word [widthi], ax
  1578 0000087D B80200                   mov ax, 2
  1579 00000880 A3[3900]                 mov word [wi], ax
  1580                                  
  1581                                  ;-186   if (c==4) {widthi=4;wi=4;}
  1582                                  
  1583                                  .gettypes70:
  1584 00000883 8A46FC                   mov al, [bp-4]
  1585 00000886 3C04                     cmp al, 4
  1586 00000888 0F850C00                 jne .gettypes71
  1587 0000088C B80400                   mov ax, 4
  1588 0000088F A3[3600]                 mov word [widthi], ax
  1589 00000892 B80400                   mov ax, 4
  1590 00000895 A3[3900]                 mov word [wi], ax
  1591                                  
  1592                                  ;-187   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}
  1593                                  
  1594                                  .gettypes71:
  1595 00000898 8B5E04                   mov bx, [bp+4]
  1596 0000089B 8A87B782                 mov al, [GType + bx]
  1597 0000089F 8846FC                   mov [bp-4], al
  1598 000008A2 B80000                   mov ax, 0
  1599 000008A5 A3[3000]                 mov word [typei], ax
  1600 000008A8 8A46FC                   mov al, [bp-4]
  1601 000008AB 3C2A                     cmp al, 42
  1602 000008AD 0F850C00                 jne .gettypes72
  1603 000008B1 B80100                   mov ax, 1
  1604 000008B4 A3[3000]                 mov word [typei], ax
  1605 000008B7 B80200                   mov ax, 2
  1606 000008BA A3[3900]                 mov word [wi], ax
  1607                                  
  1608                                  ;-188   if (c=='&')  typei=2;  
  1609                                  
  1610                                  .gettypes72:
  1611 000008BD 8A46FC                   mov al, [bp-4]
  1612 000008C0 3C26                     cmp al, 38
  1613 000008C2 0F850600                 jne .gettypes73
  1614 000008C6 B80200                   mov ax, 2
  1615 000008C9 A3[3000]                 mov word [typei], ax
  1616                                  
  1617                                  ;-189   return i; }  
  1618                                  
  1619                                  .gettypes73:
  1620 000008CC 8B4604                   mov ax, [bp+4]
  1621 000008CF E90000                   jmp .retngettypes
  1622                                  
  1623                                  ;-190 int adrofname(unsigned int i) { adrF(GNameField, i); }
  1624                                  
  1625 000008D2 C9                       .retngettypes: LEAVE
  1626 000008D3 C3                       ret
  1627                                  ; ENDP
  1628                                  
  1629                                  adrofname:  ; *** PROC ***
  1630                                  ;Function : adrofname, Number of local variables: 1
  1631                                  ;   # type sign width addr used name   list of local variables
  1632                                  ;  200 var unsg word   190 NULL i = bp+4;
  1633 000008D4 C8000000                 ENTER  0,0
  1634 000008D8 FF7604                   push word [bp+4]
  1635 000008DB 8D06438D                 lea  ax, [GNameField]
  1636 000008DF 50                       push ax
  1637 000008E0 E80500                   call adrF
  1638 000008E3 83C404                   add  sp, 4
  1639                                  
  1640                                  ;-191 int adrF(char *s, unsigned int i) { i << 4;//*16; IDLENMAX=15!
  1641 000008E6 C9                       LEAVE
  1642 000008E7 C3                       ret
  1643                                  ; ENDP
  1644                                  
  1645                                  adrF:  ; *** PROC ***
  1646                                  ;Function : adrF, Number of local variables: 2
  1647                                  ;   # type sign width addr used name   list of local variables
  1648                                  ;  200 ptr sign byte   191 NULL s = bp+4
  1649                                  ;  201 var unsg word   191 NULL i = bp+6;
  1650 000008E8 C8000000                 ENTER  0,0
  1651 000008EC 8B4606                   mov ax, [bp+6]
  1652 000008EF C1E004                   shl ax, 4
  1653                                  
  1654                                  ;-192   __asm{ add ax, [bp+4]  ; offset s } }
  1655                                  
  1656 000008F2 034604                   add ax, [bp+4]  ; offset s 
  1657                                  
  1658                                  ;-193 int printName(unsigned int i) {int j;
  1659 000008F5 C9                       LEAVE
  1660 000008F6 C3                       ret
  1661                                  ; ENDP
  1662                                  
  1663                                  printName:  ; *** PROC ***
  1664                                  
  1665                                  ;-194   if (i < LSTART) { i=adrofname(i); prs(i); }
  1666                                  
  1667                                  ;Function : printName, Number of local variables: 2
  1668                                  ;   # type sign width addr used name   list of local variables
  1669                                  ;  200 var unsg word   193 NULL i = bp+4
  1670                                  ;  201 var sign word   193 NULL j = bp-2;
  1671 000008F7 C8020000                 ENTER  2,0
  1672 000008FB 8B4604                   mov ax, [bp+4]
  1673 000008FE 3DC800                   cmp ax, 200
  1674 00000901 0F8D1800                 jge .printName74
  1675 00000905 FF7604                   push word [bp+4]
  1676 00000908 E8C9FF                   call adrofname
  1677 0000090B 83C402                   add  sp, 2
  1678 0000090E 894604                   mov [bp+4], ax
  1679 00000911 FF7604                   push word [bp+4]
  1680 00000914 E8D23B                   call prs
  1681 00000917 83C402                   add  sp, 2
  1682                                  
  1683                                  ;-195   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }
  1684                                  
  1685 0000091A E93800                   jmp .printName75
  1686                                  .printName74:
  1687 0000091D 68[5709]                 push printName_0
  1688 00000920 E8C63B                   call prs
  1689 00000923 83C402                   add  sp, 2
  1690 00000926 8B5E04                   mov bx, [bp+4]
  1691 00000929 D1E3                     shl bx, 1
  1692 0000092B 8B87EB8A                 mov ax, [GData + bx]
  1693 0000092F 8946FE                   mov [bp-2], ax
  1694 00000932 8B46FE                   mov ax, [bp-2]
  1695 00000935 83F800                   cmp ax, 0
  1696 00000938 0F8E0800                 jle .printName76
  1697 0000093C 6A2B                     push 43
  1698 0000093E E8413B                   call prc
  1699 00000941 83C402                   add  sp, 2
  1700                                  .printName76:
  1701 00000944 FF76FE                   push word [bp-2]
  1702 00000947 E8963C                   call pint1
  1703 0000094A 83C402                   add  sp, 2
  1704 0000094D 6A5D                     push 93
  1705 0000094F E8303B                   call prc
  1706 00000952 83C402                   add  sp, 2
  1707                                  
  1708                                  ;-196 }
  1709                                  
  1710                                  .printName75:
  1711                                  
  1712                                  ;-197 int searchname() { unsigned int i;
  1713 00000955 C9                       LEAVE
  1714 00000956 C3                       ret
  1715 00000957 5B627000                printName_0 db "[bp",0
  1716                                  ; ENDP
  1717                                  
  1718                                  searchname:  ; *** PROC ***
  1719                                  
  1720                                  ;-198   i=checkName(); if (i == 0) error1("Variable unknown");
  1721                                  
  1722                                  ;Function : searchname, Number of local variables: 1
  1723                                  ;   # type sign width addr used name   list of local variables
  1724                                  ;  200 var unsg word   197 NULL i = bp-2;
  1725 0000095B C8020000                 ENTER  2,0
  1726 0000095F E84400                   call checkName
  1727 00000962 8946FE                   mov [bp-2], ax
  1728 00000965 8B46FE                   mov ax, [bp-2]
  1729 00000968 83F800                   cmp ax, 0
  1730 0000096B 0F850900                 jne .searchname77
  1731 0000096F 68[9509]                 push searchname_0
  1732 00000972 E8183E                   call error1
  1733 00000975 83C402                   add  sp, 2
  1734                                  
  1735                                  ;-199   GUsed[i]=GUsed[i] + 1; return i;
  1736                                  
  1737                                  .searchname77:
  1738 00000978 8B5EFE                   mov bx, [bp-2]
  1739 0000097B D1E3                     shl bx, 1
  1740 0000097D 8B879388                 mov ax, [GUsed + bx]
  1741 00000981 83C001                   add ax, 1
  1742 00000984 8B5EFE                   mov bx, [bp-2]
  1743 00000987 D1E3                     shl bx, 1
  1744 00000989 89879388                 mov [GUsed+bx], ax
  1745 0000098D 8B46FE                   mov ax, [bp-2]
  1746 00000990 E90000                   jmp .retnsearchname
  1747                                  
  1748                                  ;-200 }
  1749                                  
  1750                                  
  1751                                  ;-201 int checkName() { unsigned int i; unsigned int j;
  1752                                  
  1753 00000993 C9                       .retnsearchname: LEAVE
  1754 00000994 C3                       ret
  1755 00000995 5661726961626C6520-     searchname_0 db "Variable unknown",0
  1756 0000099E 756E6B6E6F776E00   
  1757                                  ; ENDP
  1758                                  
  1759                                  checkName:  ; *** PROC ***
  1760                                  
  1761                                  ;-202   i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  1762                                  
  1763                                  ;Function : checkName, Number of local variables: 2
  1764                                  ;   # type sign width addr used name   list of local variables
  1765                                  ;  200 var unsg word   201 NULL i = bp-2
  1766                                  ;  201 var unsg word   201 NULL j = bp-4;
  1767 000009A6 C8040000                 ENTER  4,0
  1768 000009AA B8C800                   mov ax, 200
  1769 000009AD 8946FE                   mov [bp-2], ax
  1770                                  .checkName78:
  1771 000009B0 8B46FE                   mov ax, [bp-2]
  1772 000009B3 3B06[2C00]               cmp ax, [LTop]
  1773 000009B7 0F8D2B00                 jge .checkName79
  1774 000009BB FF76FE                   push word [bp-2]
  1775 000009BE E813FF                   call adrofname
  1776 000009C1 83C402                   add  sp, 2
  1777 000009C4 8946FC                   mov [bp-4], ax
  1778 000009C7 FF76FC                   push word [bp-4]
  1779 000009CA 8D062B81                 lea  ax, [symbol]
  1780 000009CE 50                       push ax
  1781 000009CF E8C4F7                   call eqstr
  1782 000009D2 83C404                   add  sp, 4
  1783 000009D5 08C0                     or  al, al
  1784 000009D7 0F840600                 je .checkName80
  1785 000009DB 8B46FE                   mov ax, [bp-2]
  1786 000009DE E94700                   jmp .retncheckName
  1787                                  .checkName80:
  1788 000009E1 FF46FE                   inc  word[bp-2]
  1789                                  
  1790                                  ;-203   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  1791                                  
  1792 000009E4 EBCA                     jmp .checkName78
  1793                                  .checkName79:
  1794 000009E6 B80100                   mov ax, 1
  1795 000009E9 8946FE                   mov [bp-2], ax
  1796                                  .checkName81:
  1797 000009EC 8B46FE                   mov ax, [bp-2]
  1798 000009EF 3B06[2A00]               cmp ax, [GTop]
  1799 000009F3 0F8D2B00                 jge .checkName82
  1800 000009F7 FF76FE                   push word [bp-2]
  1801 000009FA E8D7FE                   call adrofname
  1802 000009FD 83C402                   add  sp, 2
  1803 00000A00 8946FC                   mov [bp-4], ax
  1804 00000A03 FF76FC                   push word [bp-4]
  1805 00000A06 8D062B81                 lea  ax, [symbol]
  1806 00000A0A 50                       push ax
  1807 00000A0B E888F7                   call eqstr
  1808 00000A0E 83C404                   add  sp, 4
  1809 00000A11 08C0                     or  al, al
  1810 00000A13 0F840600                 je .checkName83
  1811 00000A17 8B46FE                   mov ax, [bp-2]
  1812 00000A1A E90B00                   jmp .retncheckName
  1813                                  .checkName83:
  1814 00000A1D FF46FE                   inc  word[bp-2]
  1815                                  
  1816                                  ;-204   return 0;
  1817                                  
  1818 00000A20 EBCA                     jmp .checkName81
  1819                                  .checkName82:
  1820 00000A22 B80000                   mov ax, 0
  1821 00000A25 E90000                   jmp .retncheckName
  1822                                  
  1823                                  ;-205 }    
  1824                                  
  1825                                  
  1826                                  ;-206 int typeName() { int m; //0=V,1=*,2=&
  1827                                  
  1828 00000A28 C9                       .retncheckName: LEAVE
  1829 00000A29 C3                       ret
  1830                                  ; ENDP
  1831                                  
  1832                                  typeName:  ; *** PROC ***
  1833                                  
  1834                                  ;-207     issign='S';
  1835                                  
  1836                                  ;Function : typeName, Number of local variables: 1
  1837                                  ;   # type sign width addr used name   list of local variables
  1838                                  ;  200 var sign word   206 NULL m = bp-2;
  1839 00000A2A C8020000                 ENTER  2,0
  1840 00000A2E B85300                   mov ax, 83
  1841 00000A31 A2[3500]                 mov byte [issign], al
  1842                                  
  1843                                  ;-208     if(istoken(T_SIGNED))   issign='S';  
  1844                                  
  1845 00000A34 681302                   push 531
  1846 00000A37 E87A39                   call istoken
  1847 00000A3A 83C402                   add  sp, 2
  1848 00000A3D 08C0                     or  al, al
  1849 00000A3F 0F840600                 je .typeName84
  1850 00000A43 B85300                   mov ax, 83
  1851 00000A46 A2[3500]                 mov byte [issign], al
  1852                                  
  1853                                  ;-209     if(istoken(T_UNSIGNED)) issign='U';
  1854                                  
  1855                                  .typeName84:
  1856 00000A49 681402                   push 532
  1857 00000A4C E86539                   call istoken
  1858 00000A4F 83C402                   add  sp, 2
  1859 00000A52 08C0                     or  al, al
  1860 00000A54 0F840600                 je .typeName85
  1861 00000A58 B85500                   mov ax, 85
  1862 00000A5B A2[3500]                 mov byte [issign], al
  1863                                  
  1864                                  ;-210     iswidth=2;                           
  1865                                  
  1866                                  .typeName85:
  1867 00000A5E B80200                   mov ax, 2
  1868 00000A61 A2[3800]                 mov byte [iswidth], al
  1869                                  
  1870                                  ;-211     if(istoken(T_VOID))     iswidth=0;
  1871                                  
  1872 00000A64 681102                   push 529
  1873 00000A67 E84A39                   call istoken
  1874 00000A6A 83C402                   add  sp, 2
  1875 00000A6D 08C0                     or  al, al
  1876 00000A6F 0F840600                 je .typeName86
  1877 00000A73 B80000                   mov ax, 0
  1878 00000A76 A2[3800]                 mov byte [iswidth], al
  1879                                  
  1880                                  ;-212     if(istoken(T_CHAR))     iswidth=1;   
  1881                                  
  1882                                  .typeName86:
  1883 00000A79 681202                   push 530
  1884 00000A7C E83539                   call istoken
  1885 00000A7F 83C402                   add  sp, 2
  1886 00000A82 08C0                     or  al, al
  1887 00000A84 0F840600                 je .typeName87
  1888 00000A88 B80100                   mov ax, 1
  1889 00000A8B A2[3800]                 mov byte [iswidth], al
  1890                                  
  1891                                  ;-213     if(istoken(T_INT))      iswidth=2;
  1892                                  
  1893                                  .typeName87:
  1894 00000A8E 680502                   push 517
  1895 00000A91 E82039                   call istoken
  1896 00000A94 83C402                   add  sp, 2
  1897 00000A97 08C0                     or  al, al
  1898 00000A99 0F840600                 je .typeName88
  1899 00000A9D B80200                   mov ax, 2
  1900 00000AA0 A2[3800]                 mov byte [iswidth], al
  1901                                  
  1902                                  ;-214     if(istoken(T_LONG))     iswidth=4;
  1903                                  
  1904                                  .typeName88:
  1905 00000AA3 681502                   push 533
  1906 00000AA6 E80B39                   call istoken
  1907 00000AA9 83C402                   add  sp, 2
  1908 00000AAC 08C0                     or  al, al
  1909 00000AAE 0F840600                 je .typeName89
  1910 00000AB2 B80400                   mov ax, 4
  1911 00000AB5 A2[3800]                 mov byte [iswidth], al
  1912                                  
  1913                                  ;-215     istype='V'; 
  1914                                  
  1915                                  .typeName89:
  1916 00000AB8 B85600                   mov ax, 86
  1917 00000ABB A2[3200]                 mov byte [istype], al
  1918                                  
  1919                                  ;-216     m=0;
  1920                                  
  1921 00000ABE B80000                   mov ax, 0
  1922 00000AC1 8946FE                   mov [bp-2], ax
  1923                                  
  1924                                  ;-217     if(istoken('*'))  {istype='*'; m=1;} 
  1925                                  
  1926 00000AC4 6A2A                     push 42
  1927 00000AC6 E8EB38                   call istoken
  1928 00000AC9 83C402                   add  sp, 2
  1929 00000ACC 08C0                     or  al, al
  1930 00000ACE 0F840C00                 je .typeName90
  1931 00000AD2 B82A00                   mov ax, 42
  1932 00000AD5 A2[3200]                 mov byte [istype], al
  1933 00000AD8 B80100                   mov ax, 1
  1934 00000ADB 8946FE                   mov [bp-2], ax
  1935                                  
  1936                                  ;-218     if(istoken('&'))  {istype='&'; m=2;}
  1937                                  
  1938                                  .typeName90:
  1939 00000ADE 6A26                     push 38
  1940 00000AE0 E8D138                   call istoken
  1941 00000AE3 83C402                   add  sp, 2
  1942 00000AE6 08C0                     or  al, al
  1943 00000AE8 0F840C00                 je .typeName91
  1944 00000AEC B82600                   mov ax, 38
  1945 00000AEF A2[3200]                 mov byte [istype], al
  1946 00000AF2 B80200                   mov ax, 2
  1947 00000AF5 8946FE                   mov [bp-2], ax
  1948                                  
  1949                                  ;-219     name1(); 
  1950                                  
  1951                                  .typeName91:
  1952 00000AF8 E80800                   call name1
  1953                                  
  1954                                  ;-220     return m; 
  1955                                  
  1956 00000AFB 8B46FE                   mov ax, [bp-2]
  1957 00000AFE E90000                   jmp .retntypeName
  1958                                  
  1959                                  ;-221 }
  1960                                  
  1961                                  
  1962                                  ;-222 int name1() {
  1963                                  
  1964 00000B01 C9                       .retntypeName: LEAVE
  1965 00000B02 C3                       ret
  1966                                  ; ENDP
  1967                                  
  1968                                  name1:  ; *** PROC ***
  1969                                  
  1970                                  ;-223     if (token!=T_NAME) error1("Name expected"); 
  1971                                  
  1972 00000B03 A1[1C00]                 mov ax, [token]
  1973 00000B06 3D0001                   cmp ax, 256
  1974 00000B09 0F840900                 je  .name192
  1975 00000B0D 68[1D0B]                 push name1_0
  1976 00000B10 E87A3C                   call error1
  1977 00000B13 83C402                   add  sp, 2
  1978                                  
  1979                                  ;-224     token=getlex(); 
  1980                                  
  1981                                  .name192:
  1982 00000B16 E87731                   call getlex
  1983 00000B19 A3[1C00]                 mov word [token], ax
  1984                                  
  1985                                  ;-225 }
  1986                                  
  1987                                  
  1988                                  ;-226 
  1989                                  
  1990                                  
  1991                                  ;-227 int storecall() { int i; if (CTop >= CALLMAX) error1("Call table full");
  1992                                  
  1993 00000B1C C3                       ret
  1994 00000B1D 4E616D652065787065-     name1_0 db "Name expected",0
  1995 00000B26 6374656400         
  1996                                  ; ENDP
  1997                                  
  1998                                  storecall:  ; *** PROC ***
  1999                                  ;Function : storecall, Number of local variables: 1
  2000                                  ;   # type sign width addr used name   list of local variables
  2001                                  ;  200 var sign word   227 NULL i = bp-2;
  2002 00000B2B C8020000                 ENTER  2,0
  2003 00000B2F A1[3D00]                 mov ax, [CTop]
  2004 00000B32 3DD007                   cmp ax, 2000 ;unsigned : 1
  2005 00000B35 0F8C0900                 jl  .storecall93
  2006 00000B39 68[9D0B]                 push storecall_0
  2007 00000B3C E84E3C                   call error1
  2008 00000B3F 83C402                   add  sp, 2
  2009                                  
  2010                                  ;-228   if (CNameTop >= 65468) error1("Call name table fuill");
  2011                                  
  2012                                  .storecall93:
  2013 00000B42 A1[6000]                 mov ax, [CNameTop]
  2014 00000B45 83F8BC                   cmp ax, -68 ;unsigned : 0
  2015 00000B48 0F820900                 jb  .storecall94
  2016 00000B4C 68[AD0B]                 push storecall_1
  2017 00000B4F E83B3C                   call error1
  2018 00000B52 83C402                   add  sp, 2
  2019                                  
  2020                                  ;-229     CType[CTop]=0;  CAdr [CTop]=CNameTop; i=strlen(symbol);
  2021                                  
  2022                                  .storecall94:
  2023 00000B55 B80000                   mov ax, 0
  2024 00000B58 8B1E[3D00]               mov bx, [CTop]
  2025 00000B5C 88872FA1                 mov [CType+bx], al
  2026 00000B60 A1[6000]                 mov ax, [CNameTop]
  2027 00000B63 8B1E[3D00]               mov bx, [CTop]
  2028 00000B67 D1E3                     shl bx, 1
  2029 00000B69 898757AB                 mov [CAdr+bx], ax
  2030 00000B6D 8D062B81                 lea  ax, [symbol]
  2031 00000B71 50                       push ax
  2032 00000B72 E8C9F5                   call strlen
  2033 00000B75 83C402                   add  sp, 2
  2034 00000B78 8946FE                   mov [bp-2], ax
  2035                                  
  2036                                  ;-230     to_far(CNameTop, symbol);
  2037                                  
  2038 00000B7B 8D062B81                 lea  ax, [symbol]
  2039 00000B7F 50                       push ax
  2040 00000B80 FF36[6000]               push word [CNameTop]
  2041 00000B84 E85F47                   call to_far
  2042 00000B87 83C404                   add  sp, 4
  2043                                  
  2044                                  ;-231     CNameTop=CNameTop+i; CNameTop++; CTop++;
  2045                                  
  2046 00000B8A A1[6000]                 mov ax, [CNameTop]
  2047 00000B8D 0346FE                   add ax, [bp-2]
  2048 00000B90 A3[6000]                 mov word [CNameTop], ax
  2049 00000B93 FF06[6000]               inc  word[CNameTop]
  2050 00000B97 FF06[3D00]               inc  word[CTop]
  2051                                  
  2052                                  ;-232 }
  2053                                  
  2054                                  
  2055                                  ;-233 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
  2056 00000B9B C9                       LEAVE
  2057 00000B9C C3                       ret
  2058 00000B9D 43616C6C207461626C-     storecall_0 db "Call table full",0
  2059 00000BA6 652066756C6C00     
  2060 00000BAD 43616C6C206E616D65-     storecall_1 db "Call name table fuill",0
  2061 00000BB6 207461626C65206675-
  2062 00000BBF 696C6C00           
  2063                                  ; ENDP
  2064                                  
  2065                                  storefunc:  ; *** PROC ***
  2066 00000BC3 A1[3B00]                 mov ax, [FTop]
  2067 00000BC6 3D2C01                   cmp ax, 300 ;unsigned : 1
  2068 00000BC9 0F8C0900                 jl  .storefunc95
  2069 00000BCD 68[240C]                 push storefunc_0
  2070 00000BD0 E8BA3B                   call error1
  2071 00000BD3 83C402                   add  sp, 2
  2072                                  
  2073                                  ;-234     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;
  2074                                  
  2075                                  .storefunc95:
  2076 00000BD6 A1[6600]                 mov ax, [lineno]
  2077 00000BD9 83E801                   sub ax, 1
  2078 00000BDC 8B1E[3B00]               mov bx, [FTop]
  2079 00000BE0 D1E3                     shl bx, 1
  2080 00000BE2 8987FFA8                 mov [FAdr+bx], ax
  2081 00000BE6 B80000                   mov ax, 0
  2082 00000BE9 8B1E[3B00]               mov bx, [FTop]
  2083 00000BED D1E3                     shl bx, 1
  2084 00000BEF 8987F7BA                 mov [FCalls+bx], ax
  2085 00000BF3 A0[3800]                 mov al, [iswidth]
  2086 00000BF6 8B1E[3B00]               mov bx, [FTop]
  2087 00000BFA 888703A0                 mov [FType+bx], al
  2088                                  
  2089                                  ;-235     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;
  2090                                  
  2091 00000BFE FF36[3B00]               push word [FTop]
  2092 00000C02 8D064FBD                 lea  ax, [FNameField]
  2093 00000C06 50                       push ax
  2094 00000C07 E8DEFC                   call adrF
  2095 00000C0A 83C404                   add  sp, 4
  2096 00000C0D A3[6A00]                 mov word [pt], ax
  2097 00000C10 8D062B81                 lea  ax, [symbol]
  2098 00000C14 50                       push ax
  2099 00000C15 FF36[6A00]               push word [pt]
  2100 00000C19 E84AF5                   call strcpy
  2101 00000C1C 83C404                   add  sp, 4
  2102 00000C1F FF06[3B00]               inc  word[FTop]
  2103                                  
  2104                                  ;-236 }
  2105                                  
  2106                                  
  2107                                  ;-237 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");
  2108                                  
  2109 00000C23 C3                       ret
  2110 00000C24 46756E6374696F6E20-     storefunc_0 db "Function table full",0
  2111 00000C2D 7461626C652066756C-
  2112 00000C36 6C00               
  2113                                  ; ENDP
  2114                                  
  2115                                  addlocal:  ; *** PROC ***
  2116 00000C38 A1[2C00]                 mov ax, [LTop]
  2117 00000C3B 3D2C01                   cmp ax, 300 ;unsigned : 1
  2118 00000C3E 0F8C0900                 jl  .addlocal96
  2119 00000C42 68[BE0C]                 push addlocal_0
  2120 00000C45 E8453B                   call error1
  2121 00000C48 83C402                   add  sp, 2
  2122                                  
  2123                                  ;-238   if (checkName() != 0) error1("Variable already defined");
  2124                                  
  2125                                  .addlocal96:
  2126 00000C4B E858FD                   call checkName
  2127 00000C4E 83F800                   cmp ax, 0
  2128 00000C51 0F840900                 je  .addlocal97
  2129 00000C55 68[D80C]                 push addlocal_1
  2130 00000C58 E8323B                   call error1
  2131 00000C5B 83C402                   add  sp, 2
  2132                                  
  2133                                  ;-239   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;
  2134                                  
  2135                                  .addlocal97:
  2136 00000C5E A0[3500]                 mov al, [issign]
  2137 00000C61 8B1E[2C00]               mov bx, [LTop]
  2138 00000C65 8887E383                 mov [GSign+bx], al
  2139 00000C69 A0[3800]                 mov al, [iswidth]
  2140 00000C6C 8B1E[2C00]               mov bx, [LTop]
  2141 00000C70 88870F85                 mov [GWidth+bx], al
  2142 00000C74 A0[3200]                 mov al, [istype]
  2143 00000C77 8B1E[2C00]               mov bx, [LTop]
  2144 00000C7B 8887B782                 mov [GType+bx], al
  2145                                  
  2146                                  ;-240   GAdr [LTop]=lineno-1; GUsed[LTop]=0;
  2147                                  
  2148 00000C7F A1[6600]                 mov ax, [lineno]
  2149 00000C82 83E801                   sub ax, 1
  2150 00000C85 8B1E[2C00]               mov bx, [LTop]
  2151 00000C89 D1E3                     shl bx, 1
  2152 00000C8B 89873B86                 mov [GAdr+bx], ax
  2153 00000C8F B80000                   mov ax, 0
  2154 00000C92 8B1E[2C00]               mov bx, [LTop]
  2155 00000C96 D1E3                     shl bx, 1
  2156 00000C98 89879388                 mov [GUsed+bx], ax
  2157                                  
  2158                                  ;-241   pt=adrF(GNameField, LTop); strcpy(pt, symbol);
  2159                                  
  2160 00000C9C FF36[2C00]               push word [LTop]
  2161 00000CA0 8D06438D                 lea  ax, [GNameField]
  2162 00000CA4 50                       push ax
  2163 00000CA5 E840FC                   call adrF
  2164 00000CA8 83C404                   add  sp, 4
  2165 00000CAB A3[6A00]                 mov word [pt], ax
  2166 00000CAE 8D062B81                 lea  ax, [symbol]
  2167 00000CB2 50                       push ax
  2168 00000CB3 FF36[6A00]               push word [pt]
  2169 00000CB7 E8ACF4                   call strcpy
  2170 00000CBA 83C404                   add  sp, 4
  2171                                  
  2172                                  ;-242 }
  2173                                  
  2174                                  
  2175                                  ;-243 int checkFunction() { unsigned int i; unsigned int j; i=0;
  2176                                  
  2177 00000CBD C3                       ret
  2178 00000CBE 4C6F63616C20766172-     addlocal_0 db "Local variable table full",0
  2179 00000CC7 6961626C6520746162-
  2180 00000CD0 6C652066756C6C00   
  2181 00000CD8 5661726961626C6520-     addlocal_1 db "Variable already defined",0
  2182 00000CE1 616C72656164792064-
  2183 00000CEA 6566696E656400     
  2184                                  ; ENDP
  2185                                  
  2186                                  checkFunction:  ; *** PROC ***
  2187                                  ;Function : checkFunction, Number of local variables: 2
  2188                                  ;   # type sign width addr used name   list of local variables
  2189                                  ;  200 var unsg word   243 NULL i = bp-2
  2190                                  ;  201 var unsg word   243 NULL j = bp-4;
  2191 00000CF1 C8040000                 ENTER  4,0
  2192 00000CF5 B80000                   mov ax, 0
  2193 00000CF8 8946FE                   mov [bp-2], ax
  2194                                  
  2195                                  ;-244   while (i < FTop) { j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}
  2196                                  
  2197                                  .checkFunction98:
  2198 00000CFB 8B46FE                   mov ax, [bp-2]
  2199 00000CFE 3B06[3B00]               cmp ax, [FTop]
  2200 00000D02 0F8D3000                 jge .checkFunction99
  2201 00000D06 FF76FE                   push word [bp-2]
  2202 00000D09 8D064FBD                 lea  ax, [FNameField]
  2203 00000D0D 50                       push ax
  2204 00000D0E E8D7FB                   call adrF
  2205 00000D11 83C404                   add  sp, 4
  2206 00000D14 8946FC                   mov [bp-4], ax
  2207 00000D17 FF76FC                   push word [bp-4]
  2208 00000D1A 8D062B81                 lea  ax, [symbol]
  2209 00000D1E 50                       push ax
  2210 00000D1F E874F4                   call eqstr
  2211 00000D22 83C404                   add  sp, 4
  2212 00000D25 08C0                     or  al, al
  2213 00000D27 0F840600                 je .checkFunction100
  2214 00000D2B 8B46FE                   mov ax, [bp-2]
  2215 00000D2E E90B00                   jmp .retncheckFunction
  2216                                  .checkFunction100:
  2217 00000D31 FF46FE                   inc  word[bp-2]
  2218                                  
  2219                                  ;-245   return 0; }
  2220                                  
  2221 00000D34 EBC5                     jmp .checkFunction98
  2222                                  .checkFunction99:
  2223 00000D36 B80000                   mov ax, 0
  2224 00000D39 E90000                   jmp .retncheckFunction
  2225                                  
  2226                                  ;-246 int dofunc() { int nloc; int i; int narg;  
  2227                                  
  2228 00000D3C C9                       .retncheckFunction: LEAVE
  2229 00000D3D C3                       ret
  2230                                  ; ENDP
  2231                                  
  2232                                  dofunc:  ; *** PROC ***
  2233                                  
  2234                                  ;-247   cloc=&co; 
  2235                                  
  2236                                  ;Function : dofunc, Number of local variables: 3
  2237                                  ;   # type sign width addr used name   list of local variables
  2238                                  ;  200 var sign word   246 NULL nloc = bp-2
  2239                                  ;  201 var sign word   246 NULL i = bp-4
  2240                                  ;  202 var sign word   246 NULL narg = bp-6;
  2241 00000D3E C8060000                 ENTER  6,0
  2242 00000D42 B83075                   mov ax, co
  2243 00000D45 A3[1600]                 mov word [cloc], ax
  2244                                  
  2245                                  ;-248   checknamelen();
  2246                                  
  2247 00000D48 E857F6                   call checknamelen
  2248                                  
  2249                                  ;-249   strcpy(fname, symbol);
  2250                                  
  2251 00000D4B 8D062B81                 lea  ax, [symbol]
  2252 00000D4F 50                       push ax
  2253 00000D50 8D06AB81                 lea  ax, [fname]
  2254 00000D54 50                       push ax
  2255 00000D55 E80EF4                   call strcpy
  2256 00000D58 83C404                   add  sp, 4
  2257                                  
  2258                                  ;-250   if (checkFunction() ) error1("Function already defined");
  2259                                  
  2260 00000D5B E893FF                   call checkFunction
  2261 00000D5E 08C0                     or  al, al
  2262 00000D60 0F840900                 je .dofunc101
  2263 00000D64 68[880F]                 push dofunc_0
  2264 00000D67 E8233A                   call error1
  2265 00000D6A 83C402                   add  sp, 2
  2266                                  
  2267                                  ;-251   storefunc();
  2268                                  
  2269                                  .dofunc101:
  2270 00000D6D E853FE                   call storefunc
  2271                                  
  2272                                  ;-252   prs("\n\n"); prs(symbol); prs(":  ; *** PROC ***");
  2273                                  
  2274 00000D70 68[A10F]                 push dofunc_1
  2275 00000D73 E87337                   call prs
  2276 00000D76 83C402                   add  sp, 2
  2277 00000D79 8D062B81                 lea  ax, [symbol]
  2278 00000D7D 50                       push ax
  2279 00000D7E E86837                   call prs
  2280 00000D81 83C402                   add  sp, 2
  2281 00000D84 68[A60F]                 push dofunc_2
  2282 00000D87 E85F37                   call prs
  2283 00000D8A 83C402                   add  sp, 2
  2284                                  
  2285                                  ;-253   expect('('); LTop=LSTART;  i=0;
  2286                                  
  2287 00000D8D 6A28                     push 40
  2288 00000D8F E84436                   call expect
  2289 00000D92 83C402                   add  sp, 2
  2290 00000D95 B8C800                   mov ax, 200
  2291 00000D98 A3[2C00]                 mov word [LTop], ax
  2292 00000D9B B80000                   mov ax, 0
  2293 00000D9E 8946FC                   mov [bp-4], ax
  2294                                  
  2295                                  ;-254   if (istoken(')')==0) { narg=2; 
  2296                                  
  2297 00000DA1 6A29                     push 41
  2298 00000DA3 E80E36                   call istoken
  2299 00000DA6 83C402                   add  sp, 2
  2300 00000DA9 83F800                   cmp ax, 0
  2301 00000DAC 0F854600                 jne .dofunc102
  2302 00000DB0 B80200                   mov ax, 2
  2303 00000DB3 8946FA                   mov [bp-6], ax
  2304                                  
  2305                                  ;-255     do { typeName();  addlocal(); narg+=2;
  2306                                  
  2307                                  .dofunc103:
  2308 00000DB6 E871FC                   call typeName
  2309 00000DB9 E87CFE                   call addlocal
  2310 00000DBC 8346FA02                 add  word[bp-6], 2
  2311                                  
  2312                                  ;-256          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }
  2313                                  
  2314 00000DC0 8B46FA                   mov ax, [bp-6]
  2315 00000DC3 8B1E[2C00]               mov bx, [LTop]
  2316 00000DC7 D1E3                     shl bx, 1
  2317 00000DC9 8987EB8A                 mov [GData+bx], ax
  2318 00000DCD A0[3800]                 mov al, [iswidth]
  2319 00000DD0 3C04                     cmp al, 4
  2320 00000DD2 0F850400                 jne .dofunc104
  2321 00000DD6 8346FA02                 add  word[bp-6], 2
  2322                                  .dofunc104:
  2323 00000DDA FF06[2C00]               inc  word[LTop]
  2324                                  
  2325                                  ;-257     while (istoken(','));  expect(')'); }
  2326                                  
  2327 00000DDE 6A2C                     push 44
  2328 00000DE0 E8D135                   call istoken
  2329 00000DE3 83C402                   add  sp, 2
  2330 00000DE6 08C0                     or  al, al
  2331 00000DE8 0F840200                 je .dofunc105
  2332 00000DEC EBC8                     jmp .dofunc103
  2333                                  .dofunc105:
  2334 00000DEE 6A29                     push 41
  2335 00000DF0 E8E335                   call expect
  2336 00000DF3 83C402                   add  sp, 2
  2337                                  
  2338                                  ;-258     
  2339                                  
  2340                                  
  2341                                  ;-259   expect('{'); /*body*/
  2342                                  
  2343                                  .dofunc102:
  2344 00000DF6 6A7B                     push 123
  2345 00000DF8 E8DB35                   call expect
  2346 00000DFB 83C402                   add  sp, 2
  2347                                  
  2348                                  ;-260   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */
  2349                                  
  2350 00000DFE B80000                   mov ax, 0
  2351 00000E01 8946FE                   mov [bp-2], ax
  2352 00000E04 B80000                   mov ax, 0
  2353 00000E07 A3[2600]                 mov word [nreturn], ax
  2354 00000E0A B80000                   mov ax, 0
  2355 00000E0D A3[2400]                 mov word [nconst], ax
  2356 00000E10 B80000                   mov ax, 0
  2357 00000E13 8946FC                   mov [bp-4], ax
  2358                                  
  2359                                  ;-261   while(isvariable()) {
  2360                                  
  2361                                  .dofunc106:
  2362 00000E16 E8CE01                   call isvariable
  2363 00000E19 08C0                     or  al, al
  2364 00000E1B 0F849200                 je .dofunc107
  2365                                  
  2366                                  ;-262     do {typeName();
  2367                                  
  2368                                  .dofunc108:
  2369 00000E1F E808FC                   call typeName
  2370                                  
  2371                                  ;-263         checknamelen();
  2372                                  
  2373 00000E22 E87DF5                   call checknamelen
  2374                                  
  2375                                  ;-264         addlocal(); nloc-=2;
  2376                                  
  2377 00000E25 E810FE                   call addlocal
  2378 00000E28 836EFE02                 sub  word[bp-2], 2
  2379                                  
  2380                                  ;-265         if (iswidth == 4) nloc-=2;
  2381                                  
  2382 00000E2C A0[3800]                 mov al, [iswidth]
  2383 00000E2F 3C04                     cmp al, 4
  2384 00000E31 0F850400                 jne .dofunc109
  2385 00000E35 836EFE02                 sub  word[bp-2], 2
  2386                                  
  2387                                  ;-266         GData[LTop]=nloc;
  2388                                  
  2389                                  .dofunc109:
  2390 00000E39 8B46FE                   mov ax, [bp-2]
  2391 00000E3C 8B1E[2C00]               mov bx, [LTop]
  2392 00000E40 D1E3                     shl bx, 1
  2393 00000E42 8987EB8A                 mov [GData+bx], ax
  2394                                  
  2395                                  ;-267         if (istoken('[')){istype='&';GType[LTop]='&';expect(T_CONST);expect(']');
  2396                                  
  2397 00000E46 6A5B                     push 91
  2398 00000E48 E86935                   call istoken
  2399 00000E4B 83C402                   add  sp, 2
  2400 00000E4E 08C0                     or  al, al
  2401 00000E50 0F843D00                 je .dofunc110
  2402 00000E54 B82600                   mov ax, 38
  2403 00000E57 A2[3200]                 mov byte [istype], al
  2404 00000E5A B82600                   mov ax, 38
  2405 00000E5D 8B1E[2C00]               mov bx, [LTop]
  2406 00000E61 8887B782                 mov [GType+bx], al
  2407 00000E65 680101                   push 257
  2408 00000E68 E86B35                   call expect
  2409 00000E6B 83C402                   add  sp, 2
  2410 00000E6E 6A5D                     push 93
  2411 00000E70 E86335                   call expect
  2412 00000E73 83C402                   add  sp, 2
  2413                                  
  2414                                  ;-268             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc; }
  2415                                  
  2416 00000E76 8B46FE                   mov ax, [bp-2]
  2417 00000E79 2B06[2E00]               sub ax, [lexval]
  2418 00000E7D 8946FE                   mov [bp-2], ax
  2419 00000E80 8346FE02                 add  word[bp-2], 2
  2420 00000E84 8B46FE                   mov ax, [bp-2]
  2421 00000E87 8B1E[2C00]               mov bx, [LTop]
  2422 00000E8B D1E3                     shl bx, 1
  2423 00000E8D 8987EB8A                 mov [GData+bx], ax
  2424                                  
  2425                                  ;-269         LTop++;
  2426                                  
  2427                                  .dofunc110:
  2428 00000E91 FF06[2C00]               inc  word[LTop]
  2429                                  
  2430                                  ;-270       } while (istoken(',')); expect(';'); }
  2431                                  
  2432 00000E95 6A2C                     push 44
  2433 00000E97 E81A35                   call istoken
  2434 00000E9A 83C402                   add  sp, 2
  2435 00000E9D 08C0                     or  al, al
  2436 00000E9F 0F840300                 je .dofunc111
  2437 00000EA3 E979FF                   jmp .dofunc108
  2438                                  .dofunc111:
  2439 00000EA6 6A3B                     push 59
  2440 00000EA8 E82B35                   call expect
  2441 00000EAB 83C402                   add  sp, 2
  2442                                  
  2443                                  ;-271   listproc(); 
  2444                                  
  2445 00000EAE E965FF                   jmp .dofunc106
  2446                                  .dofunc107:
  2447 00000EB1 E8DB39                   call listproc
  2448                                  
  2449                                  ;-272   if (LTop>LSTART){prs(";\n ENTER  "); 
  2450                                  
  2451 00000EB4 A1[2C00]                 mov ax, [LTop]
  2452 00000EB7 3DC800                   cmp ax, 200
  2453 00000EBA 0F8E2700                 jle .dofunc112
  2454 00000EBE 68[B80F]                 push dofunc_3
  2455 00000EC1 E82536                   call prs
  2456 00000EC4 83C402                   add  sp, 2
  2457                                  
  2458                                  ;-273     nloc=mkneg(nloc); pint1 (nloc); prs(",0"); }
  2459                                  
  2460 00000EC7 FF76FE                   push word [bp-2]
  2461 00000ECA E8F5F1                   call mkneg
  2462 00000ECD 83C402                   add  sp, 2
  2463 00000ED0 8946FE                   mov [bp-2], ax
  2464 00000ED3 FF76FE                   push word [bp-2]
  2465 00000ED6 E80737                   call pint1
  2466 00000ED9 83C402                   add  sp, 2
  2467 00000EDC 68[C40F]                 push dofunc_4
  2468 00000EDF E80736                   call prs
  2469 00000EE2 83C402                   add  sp, 2
  2470                                  
  2471                                  ;-274   while(istoken('}')==0)   stmt();
  2472                                  
  2473                                  .dofunc112:
  2474                                  .dofunc113:
  2475 00000EE5 6A7D                     push 125
  2476 00000EE7 E8CA34                   call istoken
  2477 00000EEA 83C402                   add  sp, 2
  2478 00000EED 83F800                   cmp ax, 0
  2479 00000EF0 0F850500                 jne .dofunc114
  2480 00000EF4 E82228                   call stmt
  2481                                  
  2482                                  ;-275   if (nreturn) { 
  2483                                  
  2484 00000EF7 EBEC                     jmp .dofunc113
  2485                                  .dofunc114:
  2486 00000EF9 A1[2600]                 mov ax, [nreturn]
  2487 00000EFC 08C0                     or  al, al
  2488 00000EFE 0F841C00                 je .dofunc115
  2489                                  
  2490                                  ;-276         prs("\n .retn");
  2491                                  
  2492 00000F02 68[C70F]                 push dofunc_5
  2493 00000F05 E8E135                   call prs
  2494 00000F08 83C402                   add  sp, 2
  2495                                  
  2496                                  ;-277         prs(fname);
  2497                                  
  2498 00000F0B 8D06AB81                 lea  ax, [fname]
  2499 00000F0F 50                       push ax
  2500 00000F10 E8D635                   call prs
  2501 00000F13 83C402                   add  sp, 2
  2502                                  
  2503                                  ;-278         prc(':');
  2504                                  
  2505 00000F16 6A3A                     push 58
  2506 00000F18 E86735                   call prc
  2507 00000F1B 83C402                   add  sp, 2
  2508                                  
  2509                                  ;-279         }
  2510                                  
  2511                                  
  2512                                  ;-280   if (LTop > LSTART) prs(" LEAVE");
  2513                                  
  2514                                  .dofunc115:
  2515 00000F1E A1[2C00]                 mov ax, [LTop]
  2516 00000F21 3DC800                   cmp ax, 200
  2517 00000F24 0F8E0900                 jle .dofunc116
  2518 00000F28 68[D00F]                 push dofunc_6
  2519 00000F2B E8BB35                   call prs
  2520 00000F2E 83C402                   add  sp, 2
  2521                                  
  2522                                  ;-281   prs("\n ret"); 
  2523                                  
  2524                                  .dofunc116:
  2525 00000F31 68[D70F]                 push dofunc_7
  2526 00000F34 E8B235                   call prs
  2527 00000F37 83C402                   add  sp, 2
  2528                                  
  2529                                  ;-282   *cloc=0; prs(co); 
  2530                                  
  2531 00000F3A B80000                   mov ax, 0
  2532 00000F3D 8B1E[1600]               mov  bx, [cloc]
  2533 00000F41 8807                     mov  [bx], al
  2534 00000F43 8D063075                 lea  ax, [co]
  2535 00000F47 50                       push ax
  2536 00000F48 E89E35                   call prs
  2537 00000F4B 83C402                   add  sp, 2
  2538                                  
  2539                                  ;-283   maxco1=strlen(co);
  2540                                  
  2541 00000F4E 8D063075                 lea  ax, [co]
  2542 00000F52 50                       push ax
  2543 00000F53 E8E8F1                   call strlen
  2544 00000F56 83C402                   add  sp, 2
  2545 00000F59 A3[1400]                 mov word [maxco1], ax
  2546                                  
  2547                                  ;-284   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }
  2548                                  
  2549 00000F5C A1[1400]                 mov ax, [maxco1]
  2550 00000F5F 3B06[1200]               cmp ax, [maxco]
  2551 00000F63 0F8E1600                 jle .dofunc117
  2552 00000F67 A1[1400]                 mov ax, [maxco1]
  2553 00000F6A A3[1200]                 mov word [maxco], ax
  2554 00000F6D 8D06AB81                 lea  ax, [fname]
  2555 00000F71 50                       push ax
  2556 00000F72 8D06E880                 lea  ax, [coname]
  2557 00000F76 50                       push ax
  2558 00000F77 E8ECF1                   call strcpy
  2559 00000F7A 83C404                   add  sp, 4
  2560                                  
  2561                                  ;-285   prs("\n; ENDP"); 
  2562                                  
  2563                                  .dofunc117:
  2564 00000F7D 68[DE0F]                 push dofunc_8
  2565 00000F80 E86635                   call prs
  2566 00000F83 83C402                   add  sp, 2
  2567                                  
  2568                                  ;-286 }
  2569                                  
  2570                                  
  2571                                  ;-287 int isvariable() {
  2572 00000F86 C9                       LEAVE
  2573 00000F87 C3                       ret
  2574 00000F88 46756E6374696F6E20-     dofunc_0 db "Function already defined",0
  2575 00000F91 616C72656164792064-
  2576 00000F9A 6566696E656400     
  2577 00000FA1 5C6E5C6E00              dofunc_1 db "\n\n",0
  2578 00000FA6 3A20203B202A2A2A20-     dofunc_2 db ":  ; *** PROC ***",0
  2579 00000FAF 50524F43202A2A2A00 
  2580 00000FB8 3B5C6E20454E544552-     dofunc_3 db ";\n ENTER  ",0
  2581 00000FC1 202000             
  2582 00000FC4 2C3000                  dofunc_4 db ",0",0
  2583 00000FC7 5C6E202E7265746E00      dofunc_5 db "\n .retn",0
  2584 00000FD0 204C4541564500          dofunc_6 db " LEAVE",0
  2585 00000FD7 5C6E2072657400          dofunc_7 db "\n ret",0
  2586 00000FDE 5C6E3B20454E445000      dofunc_8 db "\n; ENDP",0
  2587                                  ; ENDP
  2588                                  
  2589                                  isvariable:  ; *** PROC ***
  2590                                  
  2591                                  ;-288     if(token==T_SIGNED)   goto v1;   
  2592                                  
  2593 00000FE7 A1[1C00]                 mov ax, [token]
  2594 00000FEA 3D1302                   cmp ax, 531
  2595 00000FED 0F850300                 jne .isvariable118
  2596 00000FF1 E93A00                   jmp .v1
  2597                                  
  2598                                  ;-289     if(token==T_UNSIGNED) goto v1;
  2599                                  
  2600                                  .isvariable118:
  2601 00000FF4 A1[1C00]                 mov ax, [token]
  2602 00000FF7 3D1402                   cmp ax, 532
  2603 00000FFA 0F850300                 jne .isvariable119
  2604 00000FFE E92D00                   jmp .v1
  2605                                  
  2606                                  ;-290     if(token==T_CHAR)     goto v1;   
  2607                                  
  2608                                  .isvariable119:
  2609 00001001 A1[1C00]                 mov ax, [token]
  2610 00001004 3D1202                   cmp ax, 530
  2611 00001007 0F850300                 jne .isvariable120
  2612 0000100B E92000                   jmp .v1
  2613                                  
  2614                                  ;-291     if(token==T_INT)      goto v1;
  2615                                  
  2616                                  .isvariable120:
  2617 0000100E A1[1C00]                 mov ax, [token]
  2618 00001011 3D0502                   cmp ax, 517
  2619 00001014 0F850300                 jne .isvariable121
  2620 00001018 E91300                   jmp .v1
  2621                                  
  2622                                  ;-292     if(token==T_LONG)     goto v1;
  2623                                  
  2624                                  .isvariable121:
  2625 0000101B A1[1C00]                 mov ax, [token]
  2626 0000101E 3D1502                   cmp ax, 533
  2627 00001021 0F850300                 jne .isvariable122
  2628 00001025 E90600                   jmp .v1
  2629                                  
  2630                                  ;-293     return 0;  
  2631                                  
  2632                                  .isvariable122:
  2633 00001028 B80000                   mov ax, 0
  2634 0000102B E90600                   jmp .retnisvariable
  2635                                  
  2636                                  ;-294 v1: return 1;
  2637                                  
  2638                                  .v1:
  2639 0000102E B80100                   mov ax, 1
  2640 00001031 E90000                   jmp .retnisvariable
  2641                                  
  2642                                  ;-295 }
  2643                                  
  2644                                  
  2645                                  ;-296                   
  2646                                  
  2647                                  
  2648                                  ;-297 int mod1; int ireg1; int idx1; int ids1; int idw1; int idt1; int val1;
  2649                                  
  2650                                   .retnisvariable:
  2651 00001034 C3                       ret
  2652                                  ; ENDP
  2653 00001035 0000                    mod1 dw 0
  2654 00001037 0000                    ireg1 dw 0
  2655 00001039 0000                    idx1 dw 0
  2656 0000103B 0000                    ids1 dw 0
  2657 0000103D 0000                    idw1 dw 0
  2658 0000103F 0000                    idt1 dw 0
  2659 00001041 0000                    val1 dw 0
  2660                                  
  2661                                  ;-298 int mod2; int ireg2; int idx2; int ids2; int idw2; int idt2; int val2;
  2662                                  
  2663 00001043 0000                    mod2 dw 0
  2664 00001045 0000                    ireg2 dw 0
  2665 00001047 0000                    idx2 dw 0
  2666 00001049 0000                    ids2 dw 0
  2667 0000104B 0000                    idw2 dw 0
  2668 0000104D 0000                    idt2 dw 0
  2669 0000104F 0000                    val2 dw 0
  2670                                  
  2671                                  ;-299 
  2672                                  
  2673                                  
  2674                                  ;-300 int pexpr() {expect('('); iscmp=0; 
  2675                                  
  2676                                  
  2677                                  pexpr:  ; *** PROC ***
  2678 00001051 6A28                     push 40
  2679 00001053 E88033                   call expect
  2680 00001056 83C402                   add  sp, 2
  2681 00001059 B80000                   mov ax, 0
  2682 0000105C A3[2200]                 mov word [iscmp], ax
  2683                                  
  2684                                  ;-301   if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}
  2685                                  
  2686 0000105F A1[1C00]                 mov ax, [token]
  2687 00001062 3D0001                   cmp ax, 256
  2688 00001065 0F853400                 jne .pexpr123
  2689 00001069 68[C710]                 push pexpr_0
  2690 0000106C 8D062B81                 lea  ax, [symbol]
  2691 00001070 50                       push ax
  2692 00001071 E822F1                   call eqstr
  2693 00001074 83C404                   add  sp, 4
  2694 00001077 08C0                     or  al, al
  2695 00001079 0F840600                 je .pexpr124
  2696 0000107D E85E00                   call constantexpr
  2697 00001080 E94300                   jmp .retnpexpr
  2698                                  
  2699                                  ;-302     ireg1=checkreg();
  2700                                  
  2701                                  .pexpr124:
  2702 00001083 E89A07                   call checkreg
  2703 00001086 A3[3710]                 mov word [ireg1], ax
  2704                                  
  2705                                  ;-303     if (ireg1) { doreg1(1); return; }  }
  2706                                  
  2707 00001089 A1[3710]                 mov ax, [ireg1]
  2708 0000108C 08C0                     or  al, al
  2709 0000108E 0F840B00                 je .pexpr125
  2710 00001092 6A01                     push 1
  2711 00001094 E89D05                   call doreg1
  2712 00001097 83C402                   add  sp, 2
  2713 0000109A E92900                   jmp .retnpexpr
  2714                                  .pexpr125:
  2715                                  
  2716                                  ;-304   exprstart(); if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);
  2717                                  
  2718                                  .pexpr123:
  2719 0000109D E83D01                   call exprstart
  2720 000010A0 A1[2200]                 mov ax, [iscmp]
  2721 000010A3 83F800                   cmp ax, 0
  2722 000010A6 0F850900                 jne .pexpr126
  2723 000010AA 68[C910]                 push pexpr_1
  2724 000010AD E83934                   call prs
  2725 000010B0 83C402                   add  sp, 2
  2726                                  .pexpr126:
  2727 000010B3 8D06AB81                 lea  ax, [fname]
  2728 000010B7 50                       push ax
  2729 000010B8 E82E34                   call prs
  2730 000010BB 83C402                   add  sp, 2
  2731                                  
  2732                                  ;-305   expect(')'); }           /*error1("Vergleich fehlt");*/
  2733                                  
  2734 000010BE 6A29                     push 41
  2735 000010C0 E81333                   call expect
  2736 000010C3 83C402                   add  sp, 2
  2737                                  
  2738                                  ;-306 
  2739                                  
  2740                                  
  2741                                  ;-307 int constantexpr() { int mode; int id1;int ids;
  2742                                  
  2743                                   .retnpexpr:
  2744 000010C6 C3                       ret
  2745 000010C7 5F00                    pexpr_0 db "_",0
  2746 000010C9 5C6E206F722020616C-     pexpr_1 db "\n or  al, al\n je .",0
  2747 000010D2 2C20616C5C6E206A65-
  2748 000010DB 202E00             
  2749                                  ; ENDP
  2750                                  
  2751                                  constantexpr:  ; *** PROC ***
  2752                                  
  2753                                  ;-308   token=getlex();   mode=typeName();  
  2754                                  
  2755                                  ;Function : constantexpr, Number of local variables: 3
  2756                                  ;   # type sign width addr used name   list of local variables
  2757                                  ;  200 var sign word   307 NULL mode = bp-2
  2758                                  ;  201 var sign word   307 NULL id1 = bp-4
  2759                                  ;  202 var sign word   307 NULL ids = bp-6;
  2760 000010DE C8060000                 ENTER  6,0
  2761 000010E2 E8AB2B                   call getlex
  2762 000010E5 A3[1C00]                 mov word [token], ax
  2763 000010E8 E83FF9                   call typeName
  2764 000010EB 8946FE                   mov [bp-2], ax
  2765                                  
  2766                                  ;-309   id1=searchname(); gettypes(id1); ids=signi;
  2767                                  
  2768 000010EE E86AF8                   call searchname
  2769 000010F1 8946FC                   mov [bp-4], ax
  2770 000010F4 FF76FC                   push word [bp-4]
  2771 000010F7 E823F7                   call gettypes
  2772 000010FA 83C402                   add  sp, 2
  2773 000010FD A1[3300]                 mov ax, [signi]
  2774 00001100 8946FA                   mov [bp-6], ax
  2775                                  
  2776                                  ;-310   if (isrelational() ==0) error1("Relational expression expected");
  2777                                  
  2778 00001103 E8232B                   call isrelational
  2779 00001106 83F800                   cmp ax, 0
  2780 00001109 0F850900                 jne .constantexpr127
  2781 0000110D 68[9311]                 push constantexpr_0
  2782 00001110 E87A36                   call error1
  2783 00001113 83C402                   add  sp, 2
  2784                                  
  2785                                  ;-311   expect(T_CONST);  prs(" ; constant expression");
  2786                                  
  2787                                  .constantexpr127:
  2788 00001116 680101                   push 257
  2789 00001119 E8BA32                   call expect
  2790 0000111C 83C402                   add  sp, 2
  2791 0000111F 68[B211]                 push constantexpr_1
  2792 00001122 E8C433                   call prs
  2793 00001125 83C402                   add  sp, 2
  2794                                  
  2795                                  ;-312   prs("\ncmp "); 
  2796                                  
  2797 00001128 68[C911]                 push constantexpr_2
  2798 0000112B E8BB33                   call prs
  2799 0000112E 83C402                   add  sp, 2
  2800                                  
  2801                                  ;-313   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  2802                                  
  2803 00001131 FF76FC                   push word [bp-4]
  2804 00001134 E8E6F6                   call gettypes
  2805 00001137 83C402                   add  sp, 2
  2806 0000113A A1[3900]                 mov ax, [wi]
  2807 0000113D 83F802                   cmp ax, 2
  2808 00001140 0F850C00                 jne .constantexpr128
  2809 00001144 68[D011]                 push constantexpr_3
  2810 00001147 E89F33                   call prs
  2811 0000114A 83C402                   add  sp, 2
  2812 0000114D E90900                   jmp .constantexpr129
  2813                                  .constantexpr128:
  2814 00001150 68[D511]                 push constantexpr_4
  2815 00001153 E89333                   call prs
  2816 00001156 83C402                   add  sp, 2
  2817                                  
  2818                                  ;-314   v(id1); prs(", "); pint1(lexval); cmpneg(ids);   prs(fname);
  2819                                  
  2820                                  .constantexpr129:
  2821 00001159 FF76FC                   push word [bp-4]
  2822 0000115C E810F2                   call v
  2823 0000115F 83C402                   add  sp, 2
  2824 00001162 68[DA11]                 push constantexpr_5
  2825 00001165 E88133                   call prs
  2826 00001168 83C402                   add  sp, 2
  2827 0000116B FF36[2E00]               push word [lexval]
  2828 0000116F E86E34                   call pint1
  2829 00001172 83C402                   add  sp, 2
  2830 00001175 FF76FA                   push word [bp-6]
  2831 00001178 E8F027                   call cmpneg
  2832 0000117B 83C402                   add  sp, 2
  2833 0000117E 8D06AB81                 lea  ax, [fname]
  2834 00001182 50                       push ax
  2835 00001183 E86333                   call prs
  2836 00001186 83C402                   add  sp, 2
  2837                                  
  2838                                  ;-315   expect(')');
  2839                                  
  2840 00001189 6A29                     push 41
  2841 0000118B E84832                   call expect
  2842 0000118E 83C402                   add  sp, 2
  2843                                  
  2844                                  ;-316 }  
  2845                                  
  2846                                  
  2847                                  ;-317 int exprstart() { if (eqstr(symbol, "_")) expr2(0); else expr(0); }
  2848 00001191 C9                       LEAVE
  2849 00001192 C3                       ret
  2850 00001193 52656C6174696F6E61-     constantexpr_0 db "Relational expression expected",0
  2851 0000119C 6C2065787072657373-
  2852 000011A5 696F6E206578706563-
  2853 000011AE 74656400           
  2854 000011B2 203B20636F6E737461-     constantexpr_1 db " ; constant expression",0
  2855 000011BB 6E7420657870726573-
  2856 000011C4 73696F6E00         
  2857 000011C9 5C6E636D702000          constantexpr_2 db "\ncmp ",0
  2858 000011D0 776F726400              constantexpr_3 db "word",0
  2859 000011D5 6279746500              constantexpr_4 db "byte",0
  2860 000011DA 2C2000                  constantexpr_5 db ", ",0
  2861                                  ; ENDP
  2862                                  
  2863                                  exprstart:  ; *** PROC ***
  2864 000011DD 68[0512]                 push exprstart_0
  2865 000011E0 8D062B81                 lea  ax, [symbol]
  2866 000011E4 50                       push ax
  2867 000011E5 E8AEEF                   call eqstr
  2868 000011E8 83C404                   add  sp, 4
  2869 000011EB 08C0                     or  al, al
  2870 000011ED 0F840B00                 je .exprstart130
  2871 000011F1 6A00                     push 0
  2872 000011F3 E81100                   call expr2
  2873 000011F6 83C402                   add  sp, 2
  2874 000011F9 E90800                   jmp .exprstart131
  2875                                  .exprstart130:
  2876 000011FC 6A00                     push 0
  2877 000011FE E89E0A                   call expr
  2878 00001201 83C402                   add  sp, 2
  2879                                  .exprstart131:
  2880                                  
  2881                                  ;-318 
  2882                                  
  2883                                  
  2884                                  ;-319 int expr2(int kind) {  int i;
  2885                                  
  2886 00001204 C3                       ret
  2887 00001205 5F00                    exprstart_0 db "_",0
  2888                                  ; ENDP
  2889                                  
  2890                                  expr2:  ; *** PROC ***
  2891                                  
  2892                                  ;-320   if(kind != 1) token=getlex();
  2893                                  
  2894                                  ;Function : expr2, Number of local variables: 2
  2895                                  ;   # type sign width addr used name   list of local variables
  2896                                  ;  200 var sign word   319 NULL kind = bp+4
  2897                                  ;  201 var sign word   319 NULL i = bp-2;
  2898 00001207 C8020000                 ENTER  2,0
  2899 0000120B 8B4604                   mov ax, [bp+4]
  2900 0000120E 83F801                   cmp ax, 1
  2901 00001211 0F840600                 je  .expr2132
  2902 00001215 E8782A                   call getlex
  2903 00001218 A3[1C00]                 mov word [token], ax
  2904                                  
  2905                                  ;-321   mod1=typeName();
  2906                                  
  2907                                  .expr2132:
  2908 0000121B E80CF8                   call typeName
  2909 0000121E A3[3510]                 mov word [mod1], ax
  2910                                  
  2911                                  ;-322   if (mod1) error1("Noch kein & und * im Text (Linke Hand) erlaubt");
  2912                                  
  2913 00001221 A1[3510]                 mov ax, [mod1]
  2914 00001224 08C0                     or  al, al
  2915 00001226 0F840900                 je .expr2133
  2916 0000122A 68[BF14]                 push expr2_0
  2917 0000122D E85D35                   call error1
  2918 00001230 83C402                   add  sp, 2
  2919                                  
  2920                                  ;-323   ireg1=checkreg();
  2921                                  
  2922                                  .expr2133:
  2923 00001233 E8EA05                   call checkreg
  2924 00001236 A3[3710]                 mov word [ireg1], ax
  2925                                  
  2926                                  ;-324   if (ireg1) { doreg1(0); return; }
  2927                                  
  2928 00001239 A1[3710]                 mov ax, [ireg1]
  2929 0000123C 08C0                     or  al, al
  2930 0000123E 0F840B00                 je .expr2134
  2931 00001242 6A00                     push 0
  2932 00001244 E8ED03                   call doreg1
  2933 00001247 83C402                   add  sp, 2
  2934 0000124A E97002                   jmp .retnexpr2
  2935                                  
  2936                                  ;-325   if (ireg1 == 0) { idx1=searchname();
  2937                                  
  2938                                  .expr2134:
  2939 0000124D A1[3710]                 mov ax, [ireg1]
  2940 00001250 83F800                   cmp ax, 0
  2941 00001253 0F853400                 jne .expr2135
  2942 00001257 E801F7                   call searchname
  2943 0000125A A3[3910]                 mov word [idx1], ax
  2944                                  
  2945                                  ;-326     gettypes(idx1); ids1=signi; idw1=wi; idt1=typei;
  2946                                  
  2947 0000125D FF36[3910]               push word [idx1]
  2948 00001261 E8B9F5                   call gettypes
  2949 00001264 83C402                   add  sp, 2
  2950 00001267 A1[3300]                 mov ax, [signi]
  2951 0000126A A3[3B10]                 mov word [ids1], ax
  2952 0000126D A1[3900]                 mov ax, [wi]
  2953 00001270 A3[3D10]                 mov word [idw1], ax
  2954 00001273 A1[3000]                 mov ax, [typei]
  2955 00001276 A3[3F10]                 mov word [idt1], ax
  2956                                  
  2957                                  ;-327     if (idt1)  error1("Noch kein Array oder Pointer links erlaubt");  }
  2958                                  
  2959 00001279 A1[3F10]                 mov ax, [idt1]
  2960 0000127C 08C0                     or  al, al
  2961 0000127E 0F840900                 je .expr2136
  2962 00001282 68[EE14]                 push expr2_1
  2963 00001285 E80535                   call error1
  2964 00001288 83C402                   add  sp, 2
  2965                                  .expr2136:
  2966                                  
  2967                                  ;-328   
  2968                                  
  2969                                  
  2970                                  ;-329   if (isrelational()) { error1("Vergleich noch nicht implementiert");
  2971                                  
  2972                                  .expr2135:
  2973 0000128B E89B29                   call isrelational
  2974 0000128E 08C0                     or  al, al
  2975 00001290 0F840900                 je .expr2137
  2976 00001294 68[1915]                 push expr2_2
  2977 00001297 E8F334                   call error1
  2978 0000129A 83C402                   add  sp, 2
  2979                                  
  2980                                  ;-330   }
  2981                                  
  2982                                  
  2983                                  ;-331   if (istoken('=') == 0) error1("Assign expected");
  2984                                  
  2985                                  .expr2137:
  2986 0000129D 6A3D                     push 61
  2987 0000129F E81231                   call istoken
  2988 000012A2 83C402                   add  sp, 2
  2989 000012A5 83F800                   cmp ax, 0
  2990 000012A8 0F850900                 jne .expr2138
  2991 000012AC 68[3C15]                 push expr2_3
  2992 000012AF E8DB34                   call error1
  2993 000012B2 83C402                   add  sp, 2
  2994                                  
  2995                                  ;-332   if (istoken(T_CONST) ) { val2=lexval; prs(" ; constant expression");
  2996                                  
  2997                                  .expr2138:
  2998 000012B5 680101                   push 257
  2999 000012B8 E8F930                   call istoken
  3000 000012BB 83C402                   add  sp, 2
  3001 000012BE 08C0                     or  al, al
  3002 000012C0 0F849A00                 je .expr2139
  3003 000012C4 A1[2E00]                 mov ax, [lexval]
  3004 000012C7 A3[4F10]                 mov word [val2], ax
  3005 000012CA 68[4C15]                 push expr2_4
  3006 000012CD E81932                   call prs
  3007 000012D0 83C402                   add  sp, 2
  3008                                  
  3009                                  ;-333     prs("\nmov ");
  3010                                  
  3011 000012D3 68[6315]                 push expr2_5
  3012 000012D6 E81032                   call prs
  3013 000012D9 83C402                   add  sp, 2
  3014                                  
  3015                                  ;-334     if (idw1 == 1) prs("byte ");
  3016                                  
  3017 000012DC A1[3D10]                 mov ax, [idw1]
  3018 000012DF 83F801                   cmp ax, 1
  3019 000012E2 0F850900                 jne .expr2140
  3020 000012E6 68[6A15]                 push expr2_6
  3021 000012E9 E8FD31                   call prs
  3022 000012EC 83C402                   add  sp, 2
  3023                                  
  3024                                  ;-335     if (idw1 == 2) prs("word ");
  3025                                  
  3026                                  .expr2140:
  3027 000012EF A1[3D10]                 mov ax, [idw1]
  3028 000012F2 83F802                   cmp ax, 2
  3029 000012F5 0F850900                 jne .expr2141
  3030 000012F9 68[7015]                 push expr2_7
  3031 000012FC E8EA31                   call prs
  3032 000012FF 83C402                   add  sp, 2
  3033                                  
  3034                                  ;-336     if (idw1 == 4) prs("dword ");
  3035                                  
  3036                                  .expr2141:
  3037 00001302 A1[3D10]                 mov ax, [idw1]
  3038 00001305 83F804                   cmp ax, 4
  3039 00001308 0F850900                 jne .expr2142
  3040 0000130C 68[7615]                 push expr2_8
  3041 0000130F E8D731                   call prs
  3042 00001312 83C402                   add  sp, 2
  3043                                  
  3044                                  ;-337     v(idx1);
  3045                                  
  3046                                  .expr2142:
  3047 00001315 FF36[3910]               push word [idx1]
  3048 00001319 E853F0                   call v
  3049 0000131C 83C402                   add  sp, 2
  3050                                  
  3051                                  ;-338     prs(", "); pint1(val2);
  3052                                  
  3053 0000131F 68[7D15]                 push expr2_9
  3054 00001322 E8C431                   call prs
  3055 00001325 83C402                   add  sp, 2
  3056 00001328 FF36[4F10]               push word [val2]
  3057 0000132C E8B132                   call pint1
  3058 0000132F 83C402                   add  sp, 2
  3059                                  
  3060                                  ;-339     if (idx1 >= LSTART) { i=adrofname(idx1);  prs("; "); prs(i); } return; }
  3061                                  
  3062 00001332 A1[3910]                 mov ax, [idx1]
  3063 00001335 3DC800                   cmp ax, 200 ;unsigned : 1
  3064 00001338 0F8C1F00                 jl  .expr2143
  3065 0000133C FF36[3910]               push word [idx1]
  3066 00001340 E891F5                   call adrofname
  3067 00001343 83C402                   add  sp, 2
  3068 00001346 8946FE                   mov [bp-2], ax
  3069 00001349 68[8015]                 push expr2_10
  3070 0000134C E89A31                   call prs
  3071 0000134F 83C402                   add  sp, 2
  3072 00001352 FF76FE                   push word [bp-2]
  3073 00001355 E89131                   call prs
  3074 00001358 83C402                   add  sp, 2
  3075                                  .expr2143:
  3076 0000135B E95F01                   jmp .retnexpr2
  3077                                  
  3078                                  ;-340   
  3079                                  
  3080                                  
  3081                                  ;-341   mod1=typeName(); ireg2=checkreg();
  3082                                  
  3083                                  .expr2139:
  3084 0000135E E8C9F6                   call typeName
  3085 00001361 A3[3510]                 mov word [mod1], ax
  3086 00001364 E8B904                   call checkreg
  3087 00001367 A3[4510]                 mov word [ireg2], ax
  3088                                  
  3089                                  ;-342   if (ireg2) { prs("\nmov ");
  3090                                  
  3091 0000136A A1[4510]                 mov ax, [ireg2]
  3092 0000136D 08C0                     or  al, al
  3093 0000136F 0F844200                 je .expr2144
  3094 00001373 68[8315]                 push expr2_11
  3095 00001376 E87031                   call prs
  3096 00001379 83C402                   add  sp, 2
  3097                                  
  3098                                  ;-343     if (ireg1) printreg(ireg1); else v(idx1); prs(", "); printreg(ireg2);return;}
  3099                                  
  3100 0000137C A1[3710]                 mov ax, [ireg1]
  3101 0000137F 08C0                     or  al, al
  3102 00001381 0F840D00                 je .expr2145
  3103 00001385 FF36[3710]               push word [ireg1]
  3104 00001389 E8A208                   call printreg
  3105 0000138C 83C402                   add  sp, 2
  3106 0000138F E90A00                   jmp .expr2146
  3107                                  .expr2145:
  3108 00001392 FF36[3910]               push word [idx1]
  3109 00001396 E8D6EF                   call v
  3110 00001399 83C402                   add  sp, 2
  3111                                  .expr2146:
  3112 0000139C 68[8A15]                 push expr2_12
  3113 0000139F E84731                   call prs
  3114 000013A2 83C402                   add  sp, 2
  3115 000013A5 FF36[4510]               push word [ireg2]
  3116 000013A9 E88208                   call printreg
  3117 000013AC 83C402                   add  sp, 2
  3118 000013AF E90B01                   jmp .retnexpr2
  3119                                  
  3120                                  ;-344   else {
  3121                                  
  3122 000013B2 E9FF00                   jmp .expr2147
  3123                                  .expr2144:
  3124                                  
  3125                                  ;-345     if (mod1 == 1) error1("Noch kein * im Text erlaubt");
  3126                                  
  3127 000013B5 A1[3510]                 mov ax, [mod1]
  3128 000013B8 83F801                   cmp ax, 1
  3129 000013BB 0F850900                 jne .expr2148
  3130 000013BF 68[8D15]                 push expr2_13
  3131 000013C2 E8C833                   call error1
  3132 000013C5 83C402                   add  sp, 2
  3133                                  
  3134                                  ;-346     
  3135                                  
  3136                                  
  3137                                  ;-347     idx2=searchname();
  3138                                  
  3139                                  .expr2148:
  3140 000013C8 E890F5                   call searchname
  3141 000013CB A3[4710]                 mov word [idx2], ax
  3142                                  
  3143                                  ;-348     gettypes(idx2); ids2=signi; idw2=wi; idt2=typei;
  3144                                  
  3145 000013CE FF36[4710]               push word [idx2]
  3146 000013D2 E848F4                   call gettypes
  3147 000013D5 83C402                   add  sp, 2
  3148 000013D8 A1[3300]                 mov ax, [signi]
  3149 000013DB A3[4910]                 mov word [ids2], ax
  3150 000013DE A1[3900]                 mov ax, [wi]
  3151 000013E1 A3[4B10]                 mov word [idw2], ax
  3152 000013E4 A1[3000]                 mov ax, [typei]
  3153 000013E7 A3[4D10]                 mov word [idt2], ax
  3154                                  
  3155                                  ;-349     if (idt2 == 1)  error1("Noch kein Array rechts erlaubt");
  3156                                  
  3157 000013EA A1[4D10]                 mov ax, [idt2]
  3158 000013ED 83F801                   cmp ax, 1
  3159 000013F0 0F850900                 jne .expr2149
  3160 000013F4 68[A915]                 push expr2_14
  3161 000013F7 E89333                   call error1
  3162 000013FA 83C402                   add  sp, 2
  3163                                  
  3164                                  ;-350     prs("\nmov ");
  3165                                  
  3166                                  .expr2149:
  3167 000013FD 68[C815]                 push expr2_15
  3168 00001400 E8E630                   call prs
  3169 00001403 83C402                   add  sp, 2
  3170                                  
  3171                                  ;-351     if (ireg1) printreg(ireg1); else error1("Mem to Mem not allowed by x86-CPU");
  3172                                  
  3173 00001406 A1[3710]                 mov ax, [ireg1]
  3174 00001409 08C0                     or  al, al
  3175 0000140B 0F840D00                 je .expr2150
  3176 0000140F FF36[3710]               push word [ireg1]
  3177 00001413 E81808                   call printreg
  3178 00001416 83C402                   add  sp, 2
  3179 00001419 E90900                   jmp .expr2151
  3180                                  .expr2150:
  3181 0000141C 68[CF15]                 push expr2_16
  3182 0000141F E86B33                   call error1
  3183 00001422 83C402                   add  sp, 2
  3184                                  
  3185                                  ;-352     prs(", ");
  3186                                  
  3187                                  .expr2151:
  3188 00001425 68[F115]                 push expr2_17
  3189 00001428 E8BE30                   call prs
  3190 0000142B 83C402                   add  sp, 2
  3191                                  
  3192                                  ;-353     if (mod1 == 2) a(idx2);
  3193                                  
  3194 0000142E A1[3510]                 mov ax, [mod1]
  3195 00001431 83F802                   cmp ax, 2
  3196 00001434 0F850D00                 jne .expr2152
  3197 00001438 FF36[4710]               push word [idx2]
  3198 0000143C E821EF                   call a
  3199 0000143F 83C402                   add  sp, 2
  3200                                  
  3201                                  ;-354     else {
  3202                                  
  3203 00001442 E96C00                   jmp .expr2153
  3204                                  .expr2152:
  3205                                  
  3206                                  ;-355       if (idw2 == 1) prs("byte ");
  3207                                  
  3208 00001445 A1[4B10]                 mov ax, [idw2]
  3209 00001448 83F801                   cmp ax, 1
  3210 0000144B 0F850900                 jne .expr2154
  3211 0000144F 68[F415]                 push expr2_18
  3212 00001452 E89430                   call prs
  3213 00001455 83C402                   add  sp, 2
  3214                                  
  3215                                  ;-356       if (idw2 == 2) prs("word ");
  3216                                  
  3217                                  .expr2154:
  3218 00001458 A1[4B10]                 mov ax, [idw2]
  3219 0000145B 83F802                   cmp ax, 2
  3220 0000145E 0F850900                 jne .expr2155
  3221 00001462 68[FA15]                 push expr2_19
  3222 00001465 E88130                   call prs
  3223 00001468 83C402                   add  sp, 2
  3224                                  
  3225                                  ;-357       if (idw2 == 4) prs("dword ");
  3226                                  
  3227                                  .expr2155:
  3228 0000146B A1[4B10]                 mov ax, [idw2]
  3229 0000146E 83F804                   cmp ax, 4
  3230 00001471 0F850900                 jne .expr2156
  3231 00001475 68[0016]                 push expr2_20
  3232 00001478 E86E30                   call prs
  3233 0000147B 83C402                   add  sp, 2
  3234                                  
  3235                                  ;-358       v(idx2);
  3236                                  
  3237                                  .expr2156:
  3238 0000147E FF36[4710]               push word [idx2]
  3239 00001482 E8EAEE                   call v
  3240 00001485 83C402                   add  sp, 2
  3241                                  
  3242                                  ;-359       if (idx2 >= LSTART) { i=adrofname(idx2);  prs("; "); prs(i); }  }
  3243                                  
  3244 00001488 A1[4710]                 mov ax, [idx2]
  3245 0000148B 3DC800                   cmp ax, 200 ;unsigned : 1
  3246 0000148E 0F8C1F00                 jl  .expr2157
  3247 00001492 FF36[4710]               push word [idx2]
  3248 00001496 E83BF4                   call adrofname
  3249 00001499 83C402                   add  sp, 2
  3250 0000149C 8946FE                   mov [bp-2], ax
  3251 0000149F 68[0716]                 push expr2_21
  3252 000014A2 E84430                   call prs
  3253 000014A5 83C402                   add  sp, 2
  3254 000014A8 FF76FE                   push word [bp-2]
  3255 000014AB E83B30                   call prs
  3256 000014AE 83C402                   add  sp, 2
  3257                                  .expr2157:
  3258                                  
  3259                                  ;-360     return;
  3260                                  
  3261                                  .expr2153:
  3262 000014B1 E90900                   jmp .retnexpr2
  3263                                  
  3264                                  ;-361   } error1("Internal error: only const or reg allowed");
  3265                                  
  3266                                  .expr2147:
  3267 000014B4 68[0A16]                 push expr2_22
  3268 000014B7 E8D332                   call error1
  3269 000014BA 83C402                   add  sp, 2
  3270                                  
  3271                                  ;-362 }
  3272                                  
  3273                                  
  3274                                  ;-363 char ops[5];
  3275                                  
  3276 000014BD C9                       .retnexpr2: LEAVE
  3277 000014BE C3                       ret
  3278 000014BF 4E6F6368206B65696E-     expr2_0 db "Noch kein & und * im Text (Linke Hand) erlaubt",0
  3279 000014C8 202620756E64202A20-
  3280 000014D1 696D20546578742028-
  3281 000014DA 4C696E6B652048616E-
  3282 000014E3 64292065726C617562-
  3283 000014EC 7400               
  3284 000014EE 4E6F6368206B65696E-     expr2_1 db "Noch kein Array oder Pointer links erlaubt",0
  3285 000014F7 204172726179206F64-
  3286 00001500 657220506F696E7465-
  3287 00001509 72206C696E6B732065-
  3288 00001512 726C6175627400     
  3289 00001519 566572676C65696368-     expr2_2 db "Vergleich noch nicht implementiert",0
  3290 00001522 206E6F6368206E6963-
  3291 0000152B 687420696D706C656D-
  3292 00001534 656E746965727400   
  3293 0000153C 41737369676E206578-     expr2_3 db "Assign expected",0
  3294 00001545 70656374656400     
  3295 0000154C 203B20636F6E737461-     expr2_4 db " ; constant expression",0
  3296 00001555 6E7420657870726573-
  3297 0000155E 73696F6E00         
  3298 00001563 5C6E6D6F762000          expr2_5 db "\nmov ",0
  3299 0000156A 627974652000            expr2_6 db "byte ",0
  3300 00001570 776F72642000            expr2_7 db "word ",0
  3301 00001576 64776F72642000          expr2_8 db "dword ",0
  3302 0000157D 2C2000                  expr2_9 db ", ",0
  3303 00001580 3B2000                  expr2_10 db "; ",0
  3304 00001583 5C6E6D6F762000          expr2_11 db "\nmov ",0
  3305 0000158A 2C2000                  expr2_12 db ", ",0
  3306 0000158D 4E6F6368206B65696E-     expr2_13 db "Noch kein * im Text erlaubt",0
  3307 00001596 202A20696D20546578-
  3308 0000159F 742065726C61756274-
  3309 000015A8 00                 
  3310 000015A9 4E6F6368206B65696E-     expr2_14 db "Noch kein Array rechts erlaubt",0
  3311 000015B2 204172726179207265-
  3312 000015BB 636874732065726C61-
  3313 000015C4 75627400           
  3314 000015C8 5C6E6D6F762000          expr2_15 db "\nmov ",0
  3315 000015CF 4D656D20746F204D65-     expr2_16 db "Mem to Mem not allowed by x86-CPU",0
  3316 000015D8 6D206E6F7420616C6C-
  3317 000015E1 6F7765642062792078-
  3318 000015EA 38362D43505500     
  3319 000015F1 2C2000                  expr2_17 db ", ",0
  3320 000015F4 627974652000            expr2_18 db "byte ",0
  3321 000015FA 776F72642000            expr2_19 db "word ",0
  3322 00001600 64776F72642000          expr2_20 db "dword ",0
  3323 00001607 3B2000                  expr2_21 db "; ",0
  3324 0000160A 496E7465726E616C20-     expr2_22 db "Internal error: only const or reg allowed",0
  3325 00001613 6572726F723A206F6E-
  3326 0000161C 6C7920636F6E737420-
  3327 00001625 6F722072656720616C-
  3328 0000162E 6C6F77656400       
  3329                                  ; ENDP
  3330                                  section .bss
  3331                                  absolute -12130
  3332 FFFFD09E <res 00000005>          ops resb 5
  3333                                  section .text
  3334                                  
  3335                                  ;-364 int doreg1(int iscmp1) { int i;
  3336                                  
  3337                                  
  3338                                  doreg1:  ; *** PROC ***
  3339                                  
  3340                                  ;-365   if (istoken('='))          strcpy(ops, "mov");
  3341                                  
  3342                                  ;Function : doreg1, Number of local variables: 2
  3343                                  ;   # type sign width addr used name   list of local variables
  3344                                  ;  200 var sign word   364 NULL iscmp1 = bp+4
  3345                                  ;  201 var sign word   364 NULL i = bp-2;
  3346 00001634 C8020000                 ENTER  2,0
  3347 00001638 6A3D                     push 61
  3348 0000163A E8772D                   call istoken
  3349 0000163D 83C402                   add  sp, 2
  3350 00001640 08C0                     or  al, al
  3351 00001642 0F840E00                 je .doreg1158
  3352 00001646 68[E717]                 push doreg1_0
  3353 00001649 8D069ED0                 lea  ax, [ops]
  3354 0000164D 50                       push ax
  3355 0000164E E815EB                   call strcpy
  3356 00001651 83C404                   add  sp, 4
  3357                                  
  3358                                  ;-366   if (istoken(T_PLUSASS))    strcpy(ops, "add");
  3359                                  
  3360                                  .doreg1158:
  3361 00001654 68CE04                   push 1230
  3362 00001657 E85A2D                   call istoken
  3363 0000165A 83C402                   add  sp, 2
  3364 0000165D 08C0                     or  al, al
  3365 0000165F 0F840E00                 je .doreg1159
  3366 00001663 68[EB17]                 push doreg1_1
  3367 00001666 8D069ED0                 lea  ax, [ops]
  3368 0000166A 50                       push ax
  3369 0000166B E8F8EA                   call strcpy
  3370 0000166E 83C404                   add  sp, 4
  3371                                  
  3372                                  ;-367   if (istoken(T_MINUSASS))   strcpy(ops, "sub");
  3373                                  
  3374                                  .doreg1159:
  3375 00001671 68CF04                   push 1231
  3376 00001674 E83D2D                   call istoken
  3377 00001677 83C402                   add  sp, 2
  3378 0000167A 08C0                     or  al, al
  3379 0000167C 0F840E00                 je .doreg1160
  3380 00001680 68[EF17]                 push doreg1_2
  3381 00001683 8D069ED0                 lea  ax, [ops]
  3382 00001687 50                       push ax
  3383 00001688 E8DBEA                   call strcpy
  3384 0000168B 83C404                   add  sp, 4
  3385                                  
  3386                                  ;-368   if (istoken(T_ANDASS))     strcpy(ops, "and");
  3387                                  
  3388                                  .doreg1160:
  3389 0000168E 68D204                   push 1234
  3390 00001691 E8202D                   call istoken
  3391 00001694 83C402                   add  sp, 2
  3392 00001697 08C0                     or  al, al
  3393 00001699 0F840E00                 je .doreg1161
  3394 0000169D 68[F317]                 push doreg1_3
  3395 000016A0 8D069ED0                 lea  ax, [ops]
  3396 000016A4 50                       push ax
  3397 000016A5 E8BEEA                   call strcpy
  3398 000016A8 83C404                   add  sp, 4
  3399                                  
  3400                                  ;-369   if (istoken(T_ORASS))      strcpy(ops, "or" );
  3401                                  
  3402                                  .doreg1161:
  3403 000016AB 68D304                   push 1235
  3404 000016AE E8032D                   call istoken
  3405 000016B1 83C402                   add  sp, 2
  3406 000016B4 08C0                     or  al, al
  3407 000016B6 0F840E00                 je .doreg1162
  3408 000016BA 68[F717]                 push doreg1_4
  3409 000016BD 8D069ED0                 lea  ax, [ops]
  3410 000016C1 50                       push ax
  3411 000016C2 E8A1EA                   call strcpy
  3412 000016C5 83C404                   add  sp, 4
  3413                                  
  3414                                  ;-370   if (istoken(T_LESSLESS))   strcpy(ops, "shl");
  3415                                  
  3416                                  .doreg1162:
  3417 000016C8 68D804                   push 1240
  3418 000016CB E8E62C                   call istoken
  3419 000016CE 83C402                   add  sp, 2
  3420 000016D1 08C0                     or  al, al
  3421 000016D3 0F840E00                 je .doreg1163
  3422 000016D7 68[FA17]                 push doreg1_5
  3423 000016DA 8D069ED0                 lea  ax, [ops]
  3424 000016DE 50                       push ax
  3425 000016DF E884EA                   call strcpy
  3426 000016E2 83C404                   add  sp, 4
  3427                                  
  3428                                  ;-371   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");
  3429                                  
  3430                                  .doreg1163:
  3431 000016E5 68D904                   push 1241
  3432 000016E8 E8C92C                   call istoken
  3433 000016EB 83C402                   add  sp, 2
  3434 000016EE 08C0                     or  al, al
  3435 000016F0 0F840E00                 je .doreg1164
  3436 000016F4 68[FE17]                 push doreg1_6
  3437 000016F7 8D069ED0                 lea  ax, [ops]
  3438 000016FB 50                       push ax
  3439 000016FC E867EA                   call strcpy
  3440 000016FF 83C404                   add  sp, 4
  3441                                  
  3442                                  ;-372   if (iscmp1 == 1) { token=getlex();
  3443                                  
  3444                                  .doreg1164:
  3445 00001702 8B4604                   mov ax, [bp+4]
  3446 00001705 83F801                   cmp ax, 1
  3447 00001708 0F852700                 jne .doreg1165
  3448 0000170C E88125                   call getlex
  3449 0000170F A3[1C00]                 mov word [token], ax
  3450                                  
  3451                                  ;-373       if (isrelational() ==0) error1("Relational expected");
  3452                                  
  3453 00001712 E81425                   call isrelational
  3454 00001715 83F800                   cmp ax, 0
  3455 00001718 0F850900                 jne .doreg1166
  3456 0000171C 68[0218]                 push doreg1_7
  3457 0000171F E86B30                   call error1
  3458 00001722 83C402                   add  sp, 2
  3459                                  
  3460                                  ;-374       strcpy(ops, "cmp"); }
  3461                                  
  3462                                  .doreg1166:
  3463 00001725 68[1618]                 push doreg1_8
  3464 00001728 8D069ED0                 lea  ax, [ops]
  3465 0000172C 50                       push ax
  3466 0000172D E836EA                   call strcpy
  3467 00001730 83C404                   add  sp, 4
  3468                                  
  3469                                  ;-375   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");
  3470                                  
  3471                                  .doreg1165:
  3472 00001733 E8A52D                   call prnl
  3473 00001736 8D069ED0                 lea  ax, [ops]
  3474 0000173A 50                       push ax
  3475 0000173B E8AB2D                   call prs
  3476 0000173E 83C402                   add  sp, 2
  3477 00001741 68[1A18]                 push doreg1_9
  3478 00001744 E8A22D                   call prs
  3479 00001747 83C402                   add  sp, 2
  3480 0000174A FF36[3710]               push word [ireg1]
  3481 0000174E E8DD04                   call printreg
  3482 00001751 83C402                   add  sp, 2
  3483 00001754 68[1D18]                 push doreg1_10
  3484 00001757 E88F2D                   call prs
  3485 0000175A 83C402                   add  sp, 2
  3486                                  
  3487                                  ;-376 
  3488                                  
  3489                                  
  3490                                  ;-377   if (istoken(T_CONST)) {pint1(lexval); goto reg1;}
  3491                                  
  3492 0000175D 680101                   push 257
  3493 00001760 E8512C                   call istoken
  3494 00001763 83C402                   add  sp, 2
  3495 00001766 08C0                     or  al, al
  3496 00001768 0F840D00                 je .doreg1167
  3497 0000176C FF36[2E00]               push word [lexval]
  3498 00001770 E86D2E                   call pint1
  3499 00001773 83C402                   add  sp, 2
  3500 00001776 E94700                   jmp .reg1
  3501                                  
  3502                                  ;-378   mod2=typeName(); ireg2=checkreg();
  3503                                  
  3504                                  .doreg1167:
  3505 00001779 E8AEF2                   call typeName
  3506 0000177C A3[4310]                 mov word [mod2], ax
  3507 0000177F E89E00                   call checkreg
  3508 00001782 A3[4510]                 mov word [ireg2], ax
  3509                                  
  3510                                  ;-379   if (ireg2) {printreg(ireg2); goto reg1;}
  3511                                  
  3512 00001785 A1[4510]                 mov ax, [ireg2]
  3513 00001788 08C0                     or  al, al
  3514 0000178A 0F840D00                 je .doreg1168
  3515 0000178E FF36[4510]               push word [ireg2]
  3516 00001792 E89904                   call printreg
  3517 00001795 83C402                   add  sp, 2
  3518 00001798 E92500                   jmp .reg1
  3519                                  
  3520                                  ;-380   i=searchname();  if (mod2 == 2) a(i); else v(i);
  3521                                  
  3522                                  .doreg1168:
  3523 0000179B E8BDF1                   call searchname
  3524 0000179E 8946FE                   mov [bp-2], ax
  3525 000017A1 A1[4310]                 mov ax, [mod2]
  3526 000017A4 83F802                   cmp ax, 2
  3527 000017A7 0F850C00                 jne .doreg1169
  3528 000017AB FF76FE                   push word [bp-2]
  3529 000017AE E8AFEB                   call a
  3530 000017B1 83C402                   add  sp, 2
  3531 000017B4 E90900                   jmp .doreg1170
  3532                                  .doreg1169:
  3533 000017B7 FF76FE                   push word [bp-2]
  3534 000017BA E8B2EB                   call v
  3535 000017BD 83C402                   add  sp, 2
  3536                                  
  3537                                  ;-381   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }
  3538                                  
  3539                                  .doreg1170:
  3540                                  .reg1:
  3541 000017C0 8B4604                   mov ax, [bp+4]
  3542 000017C3 83F801                   cmp ax, 1
  3543 000017C6 0F851B00                 jne .doreg1171
  3544 000017CA 6A00                     push 0
  3545 000017CC E89C21                   call cmpneg
  3546 000017CF 83C402                   add  sp, 2
  3547 000017D2 8D06AB81                 lea  ax, [fname]
  3548 000017D6 50                       push ax
  3549 000017D7 E80F2D                   call prs
  3550 000017DA 83C402                   add  sp, 2
  3551 000017DD 6A29                     push 41
  3552 000017DF E8F42B                   call expect
  3553 000017E2 83C402                   add  sp, 2
  3554                                  
  3555                                  ;-382 }
  3556                                  
  3557                                  .doreg1171:
  3558                                  
  3559                                  ;-383 int checkreg() { // >=17 = 16bit, >=47 = 32bit
  3560 000017E5 C9                       LEAVE
  3561 000017E6 C3                       ret
  3562 000017E7 6D6F7600                doreg1_0 db "mov",0
  3563 000017EB 61646400                doreg1_1 db "add",0
  3564 000017EF 73756200                doreg1_2 db "sub",0
  3565 000017F3 616E6400                doreg1_3 db "and",0
  3566 000017F7 6F7200                  doreg1_4 db "or",0
  3567 000017FA 73686C00                doreg1_5 db "shl",0
  3568 000017FE 73687200                doreg1_6 db "shr",0
  3569 00001802 52656C6174696F6E61-     doreg1_7 db "Relational expected",0
  3570 0000180B 6C2065787065637465-
  3571 00001814 6400               
  3572 00001816 636D7000                doreg1_8 db "cmp",0
  3573 0000181A 202000                  doreg1_9 db "  ",0
  3574 0000181D 2C2000                  doreg1_10 db ", ",0
  3575                                  ; ENDP
  3576                                  
  3577                                  checkreg:  ; *** PROC ***
  3578                                  
  3579                                  ;-384   if (strlen(symbol) <  2) return 0;
  3580                                  
  3581 00001820 8D062B81                 lea  ax, [symbol]
  3582 00001824 50                       push ax
  3583 00001825 E816E9                   call strlen
  3584 00001828 83C402                   add  sp, 2
  3585 0000182B 83F802                   cmp ax, 2
  3586 0000182E 0F8D0600                 jge .checkreg172
  3587 00001832 B80000                   mov ax, 0
  3588 00001835 E94403                   jmp .retncheckreg
  3589                                  
  3590                                  ;-385   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;
  3591                                  
  3592                                  .checkreg172:
  3593 00001838 68[7D1B]                 push checkreg_0
  3594 0000183B 8D062B81                 lea  ax, [symbol]
  3595 0000183F 50                       push ax
  3596 00001840 E853E9                   call eqstr
  3597 00001843 83C404                   add  sp, 4
  3598 00001846 08C0                     or  al, al
  3599 00001848 0F840600                 je .checkreg173
  3600 0000184C B80100                   mov ax, 1
  3601 0000184F E92A03                   jmp .retncheckreg
  3602                                  .checkreg173:
  3603 00001852 68[801B]                 push checkreg_1
  3604 00001855 8D062B81                 lea  ax, [symbol]
  3605 00001859 50                       push ax
  3606 0000185A E839E9                   call eqstr
  3607 0000185D 83C404                   add  sp, 4
  3608 00001860 08C0                     or  al, al
  3609 00001862 0F840600                 je .checkreg174
  3610 00001866 B80300                   mov ax, 3
  3611 00001869 E91003                   jmp .retncheckreg
  3612                                  
  3613                                  ;-386   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;
  3614                                  
  3615                                  .checkreg174:
  3616 0000186C 68[831B]                 push checkreg_2
  3617 0000186F 8D062B81                 lea  ax, [symbol]
  3618 00001873 50                       push ax
  3619 00001874 E81FE9                   call eqstr
  3620 00001877 83C404                   add  sp, 4
  3621 0000187A 08C0                     or  al, al
  3622 0000187C 0F840600                 je .checkreg175
  3623 00001880 B80500                   mov ax, 5
  3624 00001883 E9F602                   jmp .retncheckreg
  3625                                  .checkreg175:
  3626 00001886 68[861B]                 push checkreg_3
  3627 00001889 8D062B81                 lea  ax, [symbol]
  3628 0000188D 50                       push ax
  3629 0000188E E805E9                   call eqstr
  3630 00001891 83C404                   add  sp, 4
  3631 00001894 08C0                     or  al, al
  3632 00001896 0F840600                 je .checkreg176
  3633 0000189A B80700                   mov ax, 7
  3634 0000189D E9DC02                   jmp .retncheckreg
  3635                                  
  3636                                  ;-387   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;
  3637                                  
  3638                                  .checkreg176:
  3639 000018A0 68[891B]                 push checkreg_4
  3640 000018A3 8D062B81                 lea  ax, [symbol]
  3641 000018A7 50                       push ax
  3642 000018A8 E8EBE8                   call eqstr
  3643 000018AB 83C404                   add  sp, 4
  3644 000018AE 08C0                     or  al, al
  3645 000018B0 0F840600                 je .checkreg177
  3646 000018B4 B80900                   mov ax, 9
  3647 000018B7 E9C202                   jmp .retncheckreg
  3648                                  .checkreg177:
  3649 000018BA 68[8C1B]                 push checkreg_5
  3650 000018BD 8D062B81                 lea  ax, [symbol]
  3651 000018C1 50                       push ax
  3652 000018C2 E8D1E8                   call eqstr
  3653 000018C5 83C404                   add  sp, 4
  3654 000018C8 08C0                     or  al, al
  3655 000018CA 0F840600                 je .checkreg178
  3656 000018CE B80B00                   mov ax, 11
  3657 000018D1 E9A802                   jmp .retncheckreg
  3658                                  
  3659                                  ;-388   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;
  3660                                  
  3661                                  .checkreg178:
  3662 000018D4 68[8F1B]                 push checkreg_6
  3663 000018D7 8D062B81                 lea  ax, [symbol]
  3664 000018DB 50                       push ax
  3665 000018DC E8B7E8                   call eqstr
  3666 000018DF 83C404                   add  sp, 4
  3667 000018E2 08C0                     or  al, al
  3668 000018E4 0F840600                 je .checkreg179
  3669 000018E8 B80D00                   mov ax, 13
  3670 000018EB E98E02                   jmp .retncheckreg
  3671                                  .checkreg179:
  3672 000018EE 68[921B]                 push checkreg_7
  3673 000018F1 8D062B81                 lea  ax, [symbol]
  3674 000018F5 50                       push ax
  3675 000018F6 E89DE8                   call eqstr
  3676 000018F9 83C404                   add  sp, 4
  3677 000018FC 08C0                     or  al, al
  3678 000018FE 0F840600                 je .checkreg180
  3679 00001902 B80F00                   mov ax, 15
  3680 00001905 E97402                   jmp .retncheckreg
  3681                                  
  3682                                  ;-389   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;
  3683                                  
  3684                                  .checkreg180:
  3685 00001908 68[951B]                 push checkreg_8
  3686 0000190B 8D062B81                 lea  ax, [symbol]
  3687 0000190F 50                       push ax
  3688 00001910 E883E8                   call eqstr
  3689 00001913 83C404                   add  sp, 4
  3690 00001916 08C0                     or  al, al
  3691 00001918 0F840600                 je .checkreg181
  3692 0000191C B81100                   mov ax, 17
  3693 0000191F E95A02                   jmp .retncheckreg
  3694                                  .checkreg181:
  3695 00001922 68[981B]                 push checkreg_9
  3696 00001925 8D062B81                 lea  ax, [symbol]
  3697 00001929 50                       push ax
  3698 0000192A E869E8                   call eqstr
  3699 0000192D 83C404                   add  sp, 4
  3700 00001930 08C0                     or  al, al
  3701 00001932 0F840600                 je .checkreg182
  3702 00001936 B81300                   mov ax, 19
  3703 00001939 E94002                   jmp .retncheckreg
  3704                                  
  3705                                  ;-390   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;
  3706                                  
  3707                                  .checkreg182:
  3708 0000193C 68[9B1B]                 push checkreg_10
  3709 0000193F 8D062B81                 lea  ax, [symbol]
  3710 00001943 50                       push ax
  3711 00001944 E84FE8                   call eqstr
  3712 00001947 83C404                   add  sp, 4
  3713 0000194A 08C0                     or  al, al
  3714 0000194C 0F840600                 je .checkreg183
  3715 00001950 B81500                   mov ax, 21
  3716 00001953 E92602                   jmp .retncheckreg
  3717                                  .checkreg183:
  3718 00001956 68[9E1B]                 push checkreg_11
  3719 00001959 8D062B81                 lea  ax, [symbol]
  3720 0000195D 50                       push ax
  3721 0000195E E835E8                   call eqstr
  3722 00001961 83C404                   add  sp, 4
  3723 00001964 08C0                     or  al, al
  3724 00001966 0F840600                 je .checkreg184
  3725 0000196A B81700                   mov ax, 23
  3726 0000196D E90C02                   jmp .retncheckreg
  3727                                  
  3728                                  ;-391   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;
  3729                                  
  3730                                  .checkreg184:
  3731 00001970 68[A11B]                 push checkreg_12
  3732 00001973 8D062B81                 lea  ax, [symbol]
  3733 00001977 50                       push ax
  3734 00001978 E81BE8                   call eqstr
  3735 0000197B 83C404                   add  sp, 4
  3736 0000197E 08C0                     or  al, al
  3737 00001980 0F840600                 je .checkreg185
  3738 00001984 B81900                   mov ax, 25
  3739 00001987 E9F201                   jmp .retncheckreg
  3740                                  .checkreg185:
  3741 0000198A 68[A41B]                 push checkreg_13
  3742 0000198D 8D062B81                 lea  ax, [symbol]
  3743 00001991 50                       push ax
  3744 00001992 E801E8                   call eqstr
  3745 00001995 83C404                   add  sp, 4
  3746 00001998 08C0                     or  al, al
  3747 0000199A 0F840600                 je .checkreg186
  3748 0000199E B81B00                   mov ax, 27
  3749 000019A1 E9D801                   jmp .retncheckreg
  3750                                  
  3751                                  ;-392   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;
  3752                                  
  3753                                  .checkreg186:
  3754 000019A4 68[A71B]                 push checkreg_14
  3755 000019A7 8D062B81                 lea  ax, [symbol]
  3756 000019AB 50                       push ax
  3757 000019AC E8E7E7                   call eqstr
  3758 000019AF 83C404                   add  sp, 4
  3759 000019B2 08C0                     or  al, al
  3760 000019B4 0F840600                 je .checkreg187
  3761 000019B8 B81D00                   mov ax, 29
  3762 000019BB E9BE01                   jmp .retncheckreg
  3763                                  .checkreg187:
  3764 000019BE 68[AA1B]                 push checkreg_15
  3765 000019C1 8D062B81                 lea  ax, [symbol]
  3766 000019C5 50                       push ax
  3767 000019C6 E8CDE7                   call eqstr
  3768 000019C9 83C404                   add  sp, 4
  3769 000019CC 08C0                     or  al, al
  3770 000019CE 0F840600                 je .checkreg188
  3771 000019D2 B81F00                   mov ax, 31
  3772 000019D5 E9A401                   jmp .retncheckreg
  3773                                  
  3774                                  ;-393   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;
  3775                                  
  3776                                  .checkreg188:
  3777 000019D8 68[AD1B]                 push checkreg_16
  3778 000019DB 8D062B81                 lea  ax, [symbol]
  3779 000019DF 50                       push ax
  3780 000019E0 E8B3E7                   call eqstr
  3781 000019E3 83C404                   add  sp, 4
  3782 000019E6 08C0                     or  al, al
  3783 000019E8 0F840600                 je .checkreg189
  3784 000019EC B82100                   mov ax, 33
  3785 000019EF E98A01                   jmp .retncheckreg
  3786                                  .checkreg189:
  3787 000019F2 68[B01B]                 push checkreg_17
  3788 000019F5 8D062B81                 lea  ax, [symbol]
  3789 000019F9 50                       push ax
  3790 000019FA E899E7                   call eqstr
  3791 000019FD 83C404                   add  sp, 4
  3792 00001A00 08C0                     or  al, al
  3793 00001A02 0F840600                 je .checkreg190
  3794 00001A06 B82300                   mov ax, 35
  3795 00001A09 E97001                   jmp .retncheckreg
  3796                                  
  3797                                  ;-394   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;
  3798                                  
  3799                                  .checkreg190:
  3800 00001A0C 68[B31B]                 push checkreg_18
  3801 00001A0F 8D062B81                 lea  ax, [symbol]
  3802 00001A13 50                       push ax
  3803 00001A14 E87FE7                   call eqstr
  3804 00001A17 83C404                   add  sp, 4
  3805 00001A1A 08C0                     or  al, al
  3806 00001A1C 0F840600                 je .checkreg191
  3807 00001A20 B82500                   mov ax, 37
  3808 00001A23 E95601                   jmp .retncheckreg
  3809                                  .checkreg191:
  3810 00001A26 68[B61B]                 push checkreg_19
  3811 00001A29 8D062B81                 lea  ax, [symbol]
  3812 00001A2D 50                       push ax
  3813 00001A2E E865E7                   call eqstr
  3814 00001A31 83C404                   add  sp, 4
  3815 00001A34 08C0                     or  al, al
  3816 00001A36 0F840600                 je .checkreg192
  3817 00001A3A B82700                   mov ax, 39
  3818 00001A3D E93C01                   jmp .retncheckreg
  3819                                  
  3820                                  ;-395   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;
  3821                                  
  3822                                  .checkreg192:
  3823 00001A40 68[B91B]                 push checkreg_20
  3824 00001A43 8D062B81                 lea  ax, [symbol]
  3825 00001A47 50                       push ax
  3826 00001A48 E84BE7                   call eqstr
  3827 00001A4B 83C404                   add  sp, 4
  3828 00001A4E 08C0                     or  al, al
  3829 00001A50 0F840600                 je .checkreg193
  3830 00001A54 B82900                   mov ax, 41
  3831 00001A57 E92201                   jmp .retncheckreg
  3832                                  .checkreg193:
  3833 00001A5A 68[BC1B]                 push checkreg_21
  3834 00001A5D 8D062B81                 lea  ax, [symbol]
  3835 00001A61 50                       push ax
  3836 00001A62 E831E7                   call eqstr
  3837 00001A65 83C404                   add  sp, 4
  3838 00001A68 08C0                     or  al, al
  3839 00001A6A 0F840600                 je .checkreg194
  3840 00001A6E B82B00                   mov ax, 43
  3841 00001A71 E90801                   jmp .retncheckreg
  3842                                  
  3843                                  ;-396   // (eqstr(symbol,"ip")) return 45;
  3844                                  
  3845                                  
  3846                                  ;-397   if (strlen(symbol) >   3) return 0;
  3847                                  
  3848                                  .checkreg194:
  3849 00001A74 8D062B81                 lea  ax, [symbol]
  3850 00001A78 50                       push ax
  3851 00001A79 E8C2E6                   call strlen
  3852 00001A7C 83C402                   add  sp, 2
  3853 00001A7F 83F803                   cmp ax, 3
  3854 00001A82 0F8E0600                 jle .checkreg195
  3855 00001A86 B80000                   mov ax, 0
  3856 00001A89 E9F000                   jmp .retncheckreg
  3857                                  
  3858                                  ;-398   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;
  3859                                  
  3860                                  .checkreg195:
  3861 00001A8C 68[BF1B]                 push checkreg_22
  3862 00001A8F 8D062B81                 lea  ax, [symbol]
  3863 00001A93 50                       push ax
  3864 00001A94 E8FFE6                   call eqstr
  3865 00001A97 83C404                   add  sp, 4
  3866 00001A9A 08C0                     or  al, al
  3867 00001A9C 0F840600                 je .checkreg196
  3868 00001AA0 B82F00                   mov ax, 47
  3869 00001AA3 E9D600                   jmp .retncheckreg
  3870                                  .checkreg196:
  3871 00001AA6 68[C31B]                 push checkreg_23
  3872 00001AA9 8D062B81                 lea  ax, [symbol]
  3873 00001AAD 50                       push ax
  3874 00001AAE E8E5E6                   call eqstr
  3875 00001AB1 83C404                   add  sp, 4
  3876 00001AB4 08C0                     or  al, al
  3877 00001AB6 0F840600                 je .checkreg197
  3878 00001ABA B83200                   mov ax, 50
  3879 00001ABD E9BC00                   jmp .retncheckreg
  3880                                  
  3881                                  ;-399   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;
  3882                                  
  3883                                  .checkreg197:
  3884 00001AC0 68[C71B]                 push checkreg_24
  3885 00001AC3 8D062B81                 lea  ax, [symbol]
  3886 00001AC7 50                       push ax
  3887 00001AC8 E8CBE6                   call eqstr
  3888 00001ACB 83C404                   add  sp, 4
  3889 00001ACE 08C0                     or  al, al
  3890 00001AD0 0F840600                 je .checkreg198
  3891 00001AD4 B83500                   mov ax, 53
  3892 00001AD7 E9A200                   jmp .retncheckreg
  3893                                  .checkreg198:
  3894 00001ADA 68[CB1B]                 push checkreg_25
  3895 00001ADD 8D062B81                 lea  ax, [symbol]
  3896 00001AE1 50                       push ax
  3897 00001AE2 E8B1E6                   call eqstr
  3898 00001AE5 83C404                   add  sp, 4
  3899 00001AE8 08C0                     or  al, al
  3900 00001AEA 0F840600                 je .checkreg199
  3901 00001AEE B83800                   mov ax, 56
  3902 00001AF1 E98800                   jmp .retncheckreg
  3903                                  
  3904                                  ;-400   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;
  3905                                  
  3906                                  .checkreg199:
  3907 00001AF4 68[CF1B]                 push checkreg_26
  3908 00001AF7 8D062B81                 lea  ax, [symbol]
  3909 00001AFB 50                       push ax
  3910 00001AFC E897E6                   call eqstr
  3911 00001AFF 83C404                   add  sp, 4
  3912 00001B02 08C0                     or  al, al
  3913 00001B04 0F840600                 je .checkreg200
  3914 00001B08 B83B00                   mov ax, 59
  3915 00001B0B E96E00                   jmp .retncheckreg
  3916                                  .checkreg200:
  3917 00001B0E 68[D31B]                 push checkreg_27
  3918 00001B11 8D062B81                 lea  ax, [symbol]
  3919 00001B15 50                       push ax
  3920 00001B16 E87DE6                   call eqstr
  3921 00001B19 83C404                   add  sp, 4
  3922 00001B1C 08C0                     or  al, al
  3923 00001B1E 0F840600                 je .checkreg201
  3924 00001B22 B83E00                   mov ax, 62
  3925 00001B25 E95400                   jmp .retncheckreg
  3926                                  
  3927                                  ;-401   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;
  3928                                  
  3929                                  .checkreg201:
  3930 00001B28 68[D71B]                 push checkreg_28
  3931 00001B2B 8D062B81                 lea  ax, [symbol]
  3932 00001B2F 50                       push ax
  3933 00001B30 E863E6                   call eqstr
  3934 00001B33 83C404                   add  sp, 4
  3935 00001B36 08C0                     or  al, al
  3936 00001B38 0F840600                 je .checkreg202
  3937 00001B3C B84100                   mov ax, 65
  3938 00001B3F E93A00                   jmp .retncheckreg
  3939                                  .checkreg202:
  3940 00001B42 68[DB1B]                 push checkreg_29
  3941 00001B45 8D062B81                 lea  ax, [symbol]
  3942 00001B49 50                       push ax
  3943 00001B4A E849E6                   call eqstr
  3944 00001B4D 83C404                   add  sp, 4
  3945 00001B50 08C0                     or  al, al
  3946 00001B52 0F840600                 je .checkreg203
  3947 00001B56 B84400                   mov ax, 68
  3948 00001B59 E92000                   jmp .retncheckreg
  3949                                  
  3950                                  ;-402   if (eqstr(symbol,"cr0")) return 71;
  3951                                  
  3952                                  .checkreg203:
  3953 00001B5C 68[DF1B]                 push checkreg_30
  3954 00001B5F 8D062B81                 lea  ax, [symbol]
  3955 00001B63 50                       push ax
  3956 00001B64 E82FE6                   call eqstr
  3957 00001B67 83C404                   add  sp, 4
  3958 00001B6A 08C0                     or  al, al
  3959 00001B6C 0F840600                 je .checkreg204
  3960 00001B70 B84700                   mov ax, 71
  3961 00001B73 E90600                   jmp .retncheckreg
  3962                                  
  3963                                  ;-403   return 0;   }
  3964                                  
  3965                                  .checkreg204:
  3966 00001B76 B80000                   mov ax, 0
  3967 00001B79 E90000                   jmp .retncheckreg
  3968                                  
  3969                                  ;-404 char printregstr[]
  3970                                  
  3971                                   .retncheckreg:
  3972 00001B7C C3                       ret
  3973 00001B7D 616C00                  checkreg_0 db "al",0
  3974 00001B80 636C00                  checkreg_1 db "cl",0
  3975 00001B83 646C00                  checkreg_2 db "dl",0
  3976 00001B86 626C00                  checkreg_3 db "bl",0
  3977 00001B89 616800                  checkreg_4 db "ah",0
  3978 00001B8C 636800                  checkreg_5 db "ch",0
  3979 00001B8F 646800                  checkreg_6 db "dh",0
  3980 00001B92 626800                  checkreg_7 db "bh",0
  3981 00001B95 617800                  checkreg_8 db "ax",0
  3982 00001B98 637800                  checkreg_9 db "cx",0
  3983 00001B9B 647800                  checkreg_10 db "dx",0
  3984 00001B9E 627800                  checkreg_11 db "bx",0
  3985 00001BA1 737000                  checkreg_12 db "sp",0
  3986 00001BA4 627000                  checkreg_13 db "bp",0
  3987 00001BA7 736900                  checkreg_14 db "si",0
  3988 00001BAA 646900                  checkreg_15 db "di",0
  3989 00001BAD 657300                  checkreg_16 db "es",0
  3990 00001BB0 637300                  checkreg_17 db "cs",0
  3991 00001BB3 737300                  checkreg_18 db "ss",0
  3992 00001BB6 647300                  checkreg_19 db "ds",0
  3993 00001BB9 667300                  checkreg_20 db "fs",0
  3994 00001BBC 677300                  checkreg_21 db "gs",0
  3995 00001BBF 65617800                checkreg_22 db "eax",0
  3996 00001BC3 65637800                checkreg_23 db "ecx",0
  3997 00001BC7 65647800                checkreg_24 db "edx",0
  3998 00001BCB 65627800                checkreg_25 db "ebx",0
  3999 00001BCF 65737000                checkreg_26 db "esp",0
  4000 00001BD3 65627000                checkreg_27 db "ebp",0
  4001 00001BD7 65736900                checkreg_28 db "esi",0
  4002 00001BDB 65646900                checkreg_29 db "edi",0
  4003 00001BDF 63723000                checkreg_30 db "cr0",0
  4004                                  ; ENDP
  4005                                  
  4006                                  ;-405 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";
  4007                                  
  4008 00001BE3 2A616C636C646C626C-     printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0
  4009 00001BEC 616863686468626861-
  4010 00001BF5 786378647862787370-
  4011 00001BFE 627073696469657363-
  4012 00001C07 737373647366736773-
  4013 00001C10 697065617865637865-
  4014 00001C19 647865627865737065-
  4015 00001C22 627065736965646963-
  4016 00001C2B 723000             
  4017                                  
  4018                                  ;-406 //          1         2         3         4         5         6         7
  4019                                  
  4020                                  
  4021                                  ;-407 // 1 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3
  4022                                  
  4023                                  
  4024                                  ;-408 int printreg(int i) {  unsigned int k; unsigned char c;
  4025                                  
  4026                                  
  4027                                  printreg:  ; *** PROC ***
  4028                                  
  4029                                  ;-409   k = &printregstr + i; c=*k; prc(c); i++;
  4030                                  
  4031                                  ;Function : printreg, Number of local variables: 3
  4032                                  ;   # type sign width addr used name   list of local variables
  4033                                  ;  200 var sign word   408 NULL i = bp+4
  4034                                  ;  201 var unsg word   408 NULL k = bp-2
  4035                                  ;  202 var unsg byte   408 NULL c = bp-4;
  4036 00001C2E C8040000                 ENTER  4,0
  4037 00001C32 B8[E31B]                 mov ax, printregstr
  4038 00001C35 034604                   add ax, [bp+4]
  4039 00001C38 8946FE                   mov [bp-2], ax
  4040 00001C3B 8B5EFE                   mov bx, [bp-2]
  4041 00001C3E 8B07                     mov ax, [bx]
  4042 00001C40 8846FC                   mov [bp-4], al
  4043 00001C43 8A46FC                   mov al, byte [bp-4]
  4044 00001C46 B400                     mov ah, 0
  4045 00001C48 50                       push ax
  4046 00001C49 E83628                   call prc
  4047 00001C4C 83C402                   add  sp, 2
  4048 00001C4F FF4604                   inc  word[bp+4]
  4049                                  
  4050                                  ;-410   k = &printregstr + i; c=*k; prc(c);
  4051                                  
  4052 00001C52 B8[E31B]                 mov ax, printregstr
  4053 00001C55 034604                   add ax, [bp+4]
  4054 00001C58 8946FE                   mov [bp-2], ax
  4055 00001C5B 8B5EFE                   mov bx, [bp-2]
  4056 00001C5E 8B07                     mov ax, [bx]
  4057 00001C60 8846FC                   mov [bp-4], al
  4058 00001C63 8A46FC                   mov al, byte [bp-4]
  4059 00001C66 B400                     mov ah, 0
  4060 00001C68 50                       push ax
  4061 00001C69 E81628                   call prc
  4062 00001C6C 83C402                   add  sp, 2
  4063                                  
  4064                                  ;-411   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }
  4065                                  
  4066 00001C6F 8B4604                   mov ax, [bp+4]
  4067 00001C72 83F82F                   cmp ax, 47
  4068 00001C75 0F8E2000                 jle .printreg205
  4069 00001C79 FF4604                   inc  word[bp+4]
  4070 00001C7C B8[E31B]                 mov ax, printregstr
  4071 00001C7F 034604                   add ax, [bp+4]
  4072 00001C82 8946FE                   mov [bp-2], ax
  4073 00001C85 8B5EFE                   mov bx, [bp-2]
  4074 00001C88 8B07                     mov ax, [bx]
  4075 00001C8A 8846FC                   mov [bp-4], al
  4076 00001C8D 8A46FC                   mov al, byte [bp-4]
  4077 00001C90 B400                     mov ah, 0
  4078 00001C92 50                       push ax
  4079 00001C93 E8EC27                   call prc
  4080 00001C96 83C402                   add  sp, 2
  4081                                  
  4082                                  ;-412 }
  4083                                  
  4084                                  .printreg205:
  4085                                  
  4086                                  ;-413 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
  4087 00001C99 C9                       LEAVE
  4088 00001C9A C3                       ret
  4089                                  ; ENDP
  4090 00001C9B 0000                    evalue dw 0
  4091 00001C9D 0A00                    exprtype dw 10
  4092                                  
  4093                                  ;-414 int expr(int isRight)
  4094                                  
  4095                                  
  4096                                  expr:  ; *** PROC ***
  4097                                  
  4098                                  ;-415 { int mode; int id1;     int ixarr; int ixconst;
  4099                                  
  4100                                  
  4101                                  ;-416   int ids;  int isCONST; int i;     unsigned char *p;
  4102                                  
  4103                                  
  4104                                  ;-417   if (istoken(T_CONST)) { evalue=lexval;
  4105                                  
  4106                                  ;Function : expr, Number of local variables: 9
  4107                                  ;   # type sign width addr used name   list of local variables
  4108                                  ;  200 var sign word   414 NULL isRight = bp+4
  4109                                  ;  201 var sign word   415 NULL mode = bp-2
  4110                                  ;  202 var sign word   415 NULL id1 = bp-4
  4111                                  ;  203 var sign word   415 NULL ixarr = bp-6
  4112                                  ;  204 var sign word   415 NULL ixconst = bp-8
  4113                                  ;  205 var sign word   416 NULL ids = bp-10
  4114                                  ;  206 var sign word   416 NULL isCONST = bp-12
  4115                                  ;  207 var sign word   416 NULL i = bp-14
  4116                                  ;  208 ptr unsg byte   416 NULL p = bp-16;
  4117 00001C9F C8100000                 ENTER  16,0
  4118 00001CA3 680101                   push 257
  4119 00001CA6 E80B27                   call istoken
  4120 00001CA9 83C402                   add  sp, 2
  4121 00001CAC 08C0                     or  al, al
  4122 00001CAE 0F841F00                 je .expr206
  4123 00001CB2 A1[2E00]                 mov ax, [lexval]
  4124 00001CB5 A3[9B1C]                 mov word [evalue], ax
  4125                                  
  4126                                  ;-418     prs("\n mov ax, "); pint1(lexval); return 4; }
  4127                                  
  4128 00001CB8 68[3F20]                 push expr_0
  4129 00001CBB E82B28                   call prs
  4130 00001CBE 83C402                   add  sp, 2
  4131 00001CC1 FF36[2E00]               push word [lexval]
  4132 00001CC5 E81829                   call pint1
  4133 00001CC8 83C402                   add  sp, 2
  4134 00001CCB B80400                   mov ax, 4
  4135 00001CCE E96C03                   jmp .retnexpr
  4136                                  
  4137                                  ;-419   mode=typeName(); /*0=V,1=*,2=&*/
  4138                                  
  4139                                  .expr206:
  4140 00001CD1 E856ED                   call typeName
  4141 00001CD4 8946FE                   mov [bp-2], ax
  4142                                  
  4143                                  ;-420   ireg1=checkreg();
  4144                                  
  4145 00001CD7 E846FB                   call checkreg
  4146 00001CDA A3[3710]                 mov word [ireg1], ax
  4147                                  
  4148                                  ;-421   if (ireg1) { doreg1(0); return; }
  4149                                  
  4150 00001CDD A1[3710]                 mov ax, [ireg1]
  4151 00001CE0 08C0                     or  al, al
  4152 00001CE2 0F840B00                 je .expr207
  4153 00001CE6 6A00                     push 0
  4154 00001CE8 E849F9                   call doreg1
  4155 00001CEB 83C402                   add  sp, 2
  4156 00001CEE E94C03                   jmp .retnexpr
  4157                                  
  4158                                  ;-422   if (token=='(')  {docall1(); goto e1; }
  4159                                  
  4160                                  .expr207:
  4161 00001CF1 A1[1C00]                 mov ax, [token]
  4162 00001CF4 83F828                   cmp ax, 40
  4163 00001CF7 0F850600                 jne .expr208
  4164 00001CFB E82E0F                   call docall1
  4165 00001CFE E93202                   jmp .e1
  4166                                  
  4167                                  ;-423   if (isreg()) goto e1;
  4168                                  
  4169                                  .expr208:
  4170 00001D01 E88307                   call isreg
  4171 00001D04 08C0                     or  al, al
  4172 00001D06 0F840300                 je .expr209
  4173 00001D0A E92602                   jmp .e1
  4174                                  
  4175                                  ;-424 
  4176                                  
  4177                                  
  4178                                  ;-425   id1=searchname(); gettypes(id1); ids=signi;
  4179                                  
  4180                                  .expr209:
  4181 00001D0D E84BEC                   call searchname
  4182 00001D10 8946FC                   mov [bp-4], ax
  4183 00001D13 FF76FC                   push word [bp-4]
  4184 00001D16 E804EB                   call gettypes
  4185 00001D19 83C402                   add  sp, 2
  4186 00001D1C A1[3300]                 mov ax, [signi]
  4187 00001D1F 8946F6                   mov [bp-10], ax
  4188                                  
  4189                                  ;-426   ixarr=0;  ixconst=0;
  4190                                  
  4191 00001D22 B80000                   mov ax, 0
  4192 00001D25 8946FA                   mov [bp-6], ax
  4193 00001D28 B80000                   mov ax, 0
  4194 00001D2B 8946F8                   mov [bp-8], ax
  4195                                  
  4196                                  ;-427     if (istoken('[')) { if (istoken(T_CONST)) {
  4197                                  
  4198 00001D2E 6A5B                     push 91
  4199 00001D30 E88126                   call istoken
  4200 00001D33 83C402                   add  sp, 2
  4201 00001D36 08C0                     or  al, al
  4202 00001D38 0F845900                 je .expr210
  4203 00001D3C 680101                   push 257
  4204 00001D3F E87226                   call istoken
  4205 00001D42 83C402                   add  sp, 2
  4206 00001D45 08C0                     or  al, al
  4207 00001D47 0F841700                 je .expr211
  4208                                  
  4209                                  ;-428       ixconst=1; ixarr=lexval; expect(']');  }
  4210                                  
  4211 00001D4B B80100                   mov ax, 1
  4212 00001D4E 8946F8                   mov [bp-8], ax
  4213 00001D51 A1[2E00]                 mov ax, [lexval]
  4214 00001D54 8946FA                   mov [bp-6], ax
  4215 00001D57 6A5D                     push 93
  4216 00001D59 E87A26                   call expect
  4217 00001D5C 83C402                   add  sp, 2
  4218                                  
  4219                                  ;-429     else {ixarr=searchname(); expect(T_NAME); expect(']');
  4220                                  
  4221 00001D5F E93300                   jmp .expr212
  4222                                  .expr211:
  4223 00001D62 E8F6EB                   call searchname
  4224 00001D65 8946FA                   mov [bp-6], ax
  4225 00001D68 680001                   push 256
  4226 00001D6B E86826                   call expect
  4227 00001D6E 83C402                   add  sp, 2
  4228 00001D71 6A5D                     push 93
  4229 00001D73 E86026                   call expect
  4230 00001D76 83C402                   add  sp, 2
  4231                                  
  4232                                  ;-430     gettypes(ixarr);
  4233                                  
  4234 00001D79 FF76FA                   push word [bp-6]
  4235 00001D7C E89EEA                   call gettypes
  4236 00001D7F 83C402                   add  sp, 2
  4237                                  
  4238                                  ;-431     if (widthi != 2) error1("Arrayindex muss Zahl oder int sein"); } }
  4239                                  
  4240 00001D82 A1[3600]                 mov ax, [widthi]
  4241 00001D85 83F802                   cmp ax, 2
  4242 00001D88 0F840900                 je  .expr213
  4243 00001D8C 68[4B20]                 push expr_1
  4244 00001D8F E8FB29                   call error1
  4245 00001D92 83C402                   add  sp, 2
  4246                                  .expr213:
  4247                                  .expr212:
  4248                                  
  4249                                  ;-432   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Nur var erlaubt");
  4250                                  
  4251                                  .expr210:
  4252 00001D95 68C304                   push 1219
  4253 00001D98 E81926                   call istoken
  4254 00001D9B 83C402                   add  sp, 2
  4255 00001D9E 08C0                     or  al, al
  4256 00001DA0 0F844600                 je .expr214
  4257 00001DA4 8B46FE                   mov ax, [bp-2]
  4258 00001DA7 08C0                     or  al, al
  4259 00001DA9 0F840900                 je .expr215
  4260 00001DAD 68[6E20]                 push expr_2
  4261 00001DB0 E8DA29                   call error1
  4262 00001DB3 83C402                   add  sp, 2
  4263                                  
  4264                                  ;-433      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");
  4265                                  
  4266                                  .expr215:
  4267 00001DB6 68[7E20]                 push expr_3
  4268 00001DB9 E82D27                   call prs
  4269 00001DBC 83C402                   add  sp, 2
  4270 00001DBF A1[3900]                 mov ax, [wi]
  4271 00001DC2 83F802                   cmp ax, 2
  4272 00001DC5 0F850C00                 jne .expr216
  4273 00001DC9 68[8720]                 push expr_4
  4274 00001DCC E81A27                   call prs
  4275 00001DCF 83C402                   add  sp, 2
  4276 00001DD2 E90900                   jmp .expr217
  4277                                  .expr216:
  4278 00001DD5 68[8C20]                 push expr_5
  4279 00001DD8 E80E27                   call prs
  4280 00001DDB 83C402                   add  sp, 2
  4281                                  
  4282                                  ;-434      v(id1); goto e1;}
  4283                                  
  4284                                  .expr217:
  4285 00001DDE FF76FC                   push word [bp-4]
  4286 00001DE1 E88BE5                   call v
  4287 00001DE4 83C402                   add  sp, 2
  4288 00001DE7 E94901                   jmp .e1
  4289                                  
  4290                                  ;-435   if (istoken(T_MINUSMINUS)) {if(mode)error1("Nur var erlaubt");
  4291                                  
  4292                                  .expr214:
  4293 00001DEA 68C904                   push 1225
  4294 00001DED E8C425                   call istoken
  4295 00001DF0 83C402                   add  sp, 2
  4296 00001DF3 08C0                     or  al, al
  4297 00001DF5 0F844600                 je .expr218
  4298 00001DF9 8B46FE                   mov ax, [bp-2]
  4299 00001DFC 08C0                     or  al, al
  4300 00001DFE 0F840900                 je .expr219
  4301 00001E02 68[9120]                 push expr_6
  4302 00001E05 E88529                   call error1
  4303 00001E08 83C402                   add  sp, 2
  4304                                  
  4305                                  ;-436      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");
  4306                                  
  4307                                  .expr219:
  4308 00001E0B 68[A120]                 push expr_7
  4309 00001E0E E8D826                   call prs
  4310 00001E11 83C402                   add  sp, 2
  4311 00001E14 A1[3900]                 mov ax, [wi]
  4312 00001E17 83F802                   cmp ax, 2
  4313 00001E1A 0F850C00                 jne .expr220
  4314 00001E1E 68[AA20]                 push expr_8
  4315 00001E21 E8C526                   call prs
  4316 00001E24 83C402                   add  sp, 2
  4317 00001E27 E90900                   jmp .expr221
  4318                                  .expr220:
  4319 00001E2A 68[AF20]                 push expr_9
  4320 00001E2D E8B926                   call prs
  4321 00001E30 83C402                   add  sp, 2
  4322                                  
  4323                                  ;-437      v(id1); goto e1;}
  4324                                  
  4325                                  .expr221:
  4326 00001E33 FF76FC                   push word [bp-4]
  4327 00001E36 E836E5                   call v
  4328 00001E39 83C402                   add  sp, 2
  4329 00001E3C E9F400                   jmp .e1
  4330                                  
  4331                                  ;-438        
  4332                                  
  4333                                  
  4334                                  ;-439   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}
  4335                                  
  4336                                  .expr218:
  4337 00001E3F 68CE04                   push 1230
  4338 00001E42 E86F25                   call istoken
  4339 00001E45 83C402                   add  sp, 2
  4340 00001E48 08C0                     or  al, al
  4341 00001E4A 0F841200                 je .expr222
  4342 00001E4E FF76FC                   push word [bp-4]
  4343 00001E51 FF76FE                   push word [bp-2]
  4344 00001E54 68[B420]                 push expr_10
  4345 00001E57 E8A802                   call compoundass
  4346 00001E5A 83C406                   add  sp, 6
  4347 00001E5D E9D300                   jmp .e1
  4348                                  
  4349                                  ;-440   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}
  4350                                  
  4351                                  .expr222:
  4352 00001E60 68CF04                   push 1231
  4353 00001E63 E84E25                   call istoken
  4354 00001E66 83C402                   add  sp, 2
  4355 00001E69 08C0                     or  al, al
  4356 00001E6B 0F841200                 je .expr223
  4357 00001E6F FF76FC                   push word [bp-4]
  4358 00001E72 FF76FE                   push word [bp-2]
  4359 00001E75 68[B820]                 push expr_11
  4360 00001E78 E88702                   call compoundass
  4361 00001E7B 83C406                   add  sp, 6
  4362 00001E7E E9B200                   jmp .e1
  4363                                  
  4364                                  ;-441   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}
  4365                                  
  4366                                  .expr223:
  4367 00001E81 68D204                   push 1234
  4368 00001E84 E82D25                   call istoken
  4369 00001E87 83C402                   add  sp, 2
  4370 00001E8A 08C0                     or  al, al
  4371 00001E8C 0F841200                 je .expr224
  4372 00001E90 FF76FC                   push word [bp-4]
  4373 00001E93 FF76FE                   push word [bp-2]
  4374 00001E96 68[BC20]                 push expr_12
  4375 00001E99 E86602                   call compoundass
  4376 00001E9C 83C406                   add  sp, 6
  4377 00001E9F E99100                   jmp .e1
  4378                                  
  4379                                  ;-442   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}    
  4380                                  
  4381                                  .expr224:
  4382 00001EA2 68D304                   push 1235
  4383 00001EA5 E80C25                   call istoken
  4384 00001EA8 83C402                   add  sp, 2
  4385 00001EAB 08C0                     or  al, al
  4386 00001EAD 0F841200                 je .expr225
  4387 00001EB1 FF76FC                   push word [bp-4]
  4388 00001EB4 FF76FE                   push word [bp-2]
  4389 00001EB7 68[C020]                 push expr_13
  4390 00001EBA E84502                   call compoundass
  4391 00001EBD 83C406                   add  sp, 6
  4392 00001EC0 E97000                   jmp .e1
  4393                                  
  4394                                  ;-443   if (istoken(T_MULASS    )) {error1("not implemented");}
  4395                                  
  4396                                  .expr225:
  4397 00001EC3 68D004                   push 1232
  4398 00001EC6 E8EB24                   call istoken
  4399 00001EC9 83C402                   add  sp, 2
  4400 00001ECC 08C0                     or  al, al
  4401 00001ECE 0F840900                 je .expr226
  4402 00001ED2 68[C320]                 push expr_14
  4403 00001ED5 E8B528                   call error1
  4404 00001ED8 83C402                   add  sp, 2
  4405                                  
  4406                                  ;-444   if (istoken(T_DIVASS    )) {error1("not implemented");}
  4407                                  
  4408                                  .expr226:
  4409 00001EDB 68D104                   push 1233
  4410 00001EDE E8D324                   call istoken
  4411 00001EE1 83C402                   add  sp, 2
  4412 00001EE4 08C0                     or  al, al
  4413 00001EE6 0F840900                 je .expr227
  4414 00001EEA 68[D320]                 push expr_15
  4415 00001EED E89D28                   call error1
  4416 00001EF0 83C402                   add  sp, 2
  4417                                  
  4418                                  ;-445 
  4419                                  
  4420                                  
  4421                                  ;-446   if (istoken('=')) { exprtype= expr(1); 
  4422                                  
  4423                                  .expr227:
  4424 00001EF3 6A3D                     push 61
  4425 00001EF5 E8BC24                   call istoken
  4426 00001EF8 83C402                   add  sp, 2
  4427 00001EFB 08C0                     or  al, al
  4428 00001EFD 0F842000                 je .expr228
  4429 00001F01 6A01                     push 1
  4430 00001F03 E899FD                   call expr
  4431 00001F06 83C402                   add  sp, 2
  4432 00001F09 A3[9D1C]                 mov word [exprtype], ax
  4433                                  
  4434                                  ;-447   doassign(mode, id1, ixarr, ixconst); goto e1;  }
  4435                                  
  4436 00001F0C FF76F8                   push word [bp-8]
  4437 00001F0F FF76FA                   push word [bp-6]
  4438 00001F12 FF76FC                   push word [bp-4]
  4439 00001F15 FF76FE                   push word [bp-2]
  4440 00001F18 E85E08                   call doassign
  4441 00001F1B 83C408                   add  sp, 8
  4442 00001F1E E91200                   jmp .e1
  4443                                  
  4444                                  ;-448   dovar1(mode, "mov", ixarr, id1);
  4445                                  
  4446                                  .expr228:
  4447 00001F21 FF76FC                   push word [bp-4]
  4448 00001F24 FF76FA                   push word [bp-6]
  4449 00001F27 68[E320]                 push expr_16
  4450 00001F2A FF76FE                   push word [bp-2]
  4451 00001F2D E87402                   call dovar1
  4452 00001F30 83C408                   add  sp, 8
  4453                                  
  4454                                  ;-449   
  4455                                  
  4456                                  
  4457                                  ;-450 e1:    if (istoken('+')) rterm("add");
  4458                                  
  4459                                  .e1:
  4460 00001F33 6A2B                     push 43
  4461 00001F35 E87C24                   call istoken
  4462 00001F38 83C402                   add  sp, 2
  4463 00001F3B 08C0                     or  al, al
  4464 00001F3D 0F840C00                 je .expr229
  4465 00001F41 68[E720]                 push expr_17
  4466 00001F44 E82704                   call rterm
  4467 00001F47 83C402                   add  sp, 2
  4468                                  
  4469                                  ;-451   else if (istoken('-')) rterm("sub" );
  4470                                  
  4471 00001F4A E9CF00                   jmp .expr230
  4472                                  .expr229:
  4473 00001F4D 6A2D                     push 45
  4474 00001F4F E86224                   call istoken
  4475 00001F52 83C402                   add  sp, 2
  4476 00001F55 08C0                     or  al, al
  4477 00001F57 0F840C00                 je .expr231
  4478 00001F5B 68[EB20]                 push expr_18
  4479 00001F5E E80D04                   call rterm
  4480 00001F61 83C402                   add  sp, 2
  4481                                  
  4482                                  ;-452   else if (istoken('&')) rterm("and" );
  4483                                  
  4484 00001F64 E9B500                   jmp .expr232
  4485                                  .expr231:
  4486 00001F67 6A26                     push 38
  4487 00001F69 E84824                   call istoken
  4488 00001F6C 83C402                   add  sp, 2
  4489 00001F6F 08C0                     or  al, al
  4490 00001F71 0F840C00                 je .expr233
  4491 00001F75 68[EF20]                 push expr_19
  4492 00001F78 E8F303                   call rterm
  4493 00001F7B 83C402                   add  sp, 2
  4494                                  
  4495                                  ;-453   else if (istoken('|')) rterm("or" );  
  4496                                  
  4497 00001F7E E99B00                   jmp .expr234
  4498                                  .expr233:
  4499 00001F81 6A7C                     push 124
  4500 00001F83 E82E24                   call istoken
  4501 00001F86 83C402                   add  sp, 2
  4502 00001F89 08C0                     or  al, al
  4503 00001F8B 0F840C00                 je .expr235
  4504 00001F8F 68[F320]                 push expr_20
  4505 00001F92 E8D903                   call rterm
  4506 00001F95 83C402                   add  sp, 2
  4507                                  
  4508                                  ;-454   else if (istoken(T_LESSLESS)) rterm("shl");
  4509                                  
  4510 00001F98 E98100                   jmp .expr236
  4511                                  .expr235:
  4512 00001F9B 68D804                   push 1240
  4513 00001F9E E81324                   call istoken
  4514 00001FA1 83C402                   add  sp, 2
  4515 00001FA4 08C0                     or  al, al
  4516 00001FA6 0F840C00                 je .expr237
  4517 00001FAA 68[F620]                 push expr_21
  4518 00001FAD E8BE03                   call rterm
  4519 00001FB0 83C402                   add  sp, 2
  4520                                  
  4521                                  ;-455   else if (istoken(T_GREATGREAT)) rterm("shr");  
  4522                                  
  4523 00001FB3 E96600                   jmp .expr238
  4524                                  .expr237:
  4525 00001FB6 68D904                   push 1241
  4526 00001FB9 E8F823                   call istoken
  4527 00001FBC 83C402                   add  sp, 2
  4528 00001FBF 08C0                     or  al, al
  4529 00001FC1 0F840C00                 je .expr239
  4530 00001FC5 68[FA20]                 push expr_22
  4531 00001FC8 E8A303                   call rterm
  4532 00001FCB 83C402                   add  sp, 2
  4533                                  
  4534                                  ;-456   else if (istoken('*')) domul (ids);
  4535                                  
  4536 00001FCE E94B00                   jmp .expr240
  4537                                  .expr239:
  4538 00001FD1 6A2A                     push 42
  4539 00001FD3 E8DE23                   call istoken
  4540 00001FD6 83C402                   add  sp, 2
  4541 00001FD9 08C0                     or  al, al
  4542 00001FDB 0F840C00                 je .expr241
  4543 00001FDF FF76F6                   push word [bp-10]
  4544 00001FE2 E8DD09                   call domul
  4545 00001FE5 83C402                   add  sp, 2
  4546                                  
  4547                                  ;-457   else if (istoken('/')) doidiv(ids);
  4548                                  
  4549 00001FE8 E93100                   jmp .expr242
  4550                                  .expr241:
  4551 00001FEB 6A2F                     push 47
  4552 00001FED E8C423                   call istoken
  4553 00001FF0 83C402                   add  sp, 2
  4554 00001FF3 08C0                     or  al, al
  4555 00001FF5 0F840C00                 je .expr243
  4556 00001FF9 FF76F6                   push word [bp-10]
  4557 00001FFC E8640A                   call doidiv
  4558 00001FFF 83C402                   add  sp, 2
  4559                                  
  4560                                  ;-458   else if (istoken('%')) domod (ids);
  4561                                  
  4562 00002002 E91700                   jmp .expr244
  4563                                  .expr243:
  4564 00002005 6A25                     push 37
  4565 00002007 E8AA23                   call istoken
  4566 0000200A 83C402                   add  sp, 2
  4567 0000200D 08C0                     or  al, al
  4568 0000200F 0F840900                 je .expr245
  4569 00002013 FF76F6                   push word [bp-10]
  4570 00002016 E8ED0B                   call domod
  4571 00002019 83C402                   add  sp, 2
  4572                                  
  4573                                  ;-459   if (isrelational()) { rterm("cmp"); cmpneg(ids);}
  4574                                  
  4575                                  .expr245:
  4576                                  .expr244:
  4577                                  .expr242:
  4578                                  .expr240:
  4579                                  .expr238:
  4580                                  .expr236:
  4581                                  .expr234:
  4582                                  .expr232:
  4583                                  .expr230:
  4584 0000201C E80A1C                   call isrelational
  4585 0000201F 08C0                     or  al, al
  4586 00002021 0F841200                 je .expr246
  4587 00002025 68[FE20]                 push expr_23
  4588 00002028 E84303                   call rterm
  4589 0000202B 83C402                   add  sp, 2
  4590 0000202E FF76F6                   push word [bp-10]
  4591 00002031 E83719                   call cmpneg
  4592 00002034 83C402                   add  sp, 2
  4593                                  
  4594                                  ;-460   return 0;
  4595                                  
  4596                                  .expr246:
  4597 00002037 B80000                   mov ax, 0
  4598 0000203A E90000                   jmp .retnexpr
  4599                                  
  4600                                  ;-461 }
  4601                                  
  4602                                  
  4603                                  ;-462 
  4604                                  
  4605                                  
  4606                                  ;-463 int compoundass(char *op, int mode, int id1) {
  4607                                  
  4608 0000203D C9                       .retnexpr: LEAVE
  4609 0000203E C3                       ret
  4610 0000203F 5C6E206D6F76206178-     expr_0 db "\n mov ax, ",0
  4611 00002048 2C2000             
  4612 0000204B 4172726179696E6465-     expr_1 db "Arrayindex muss Zahl oder int sein",0
  4613 00002054 78206D757373205A61-
  4614 0000205D 686C206F6465722069-
  4615 00002066 6E74207365696E00   
  4616 0000206E 4E7572207661722065-     expr_2 db "Nur var erlaubt",0
  4617 00002077 726C6175627400     
  4618 0000207E 5C6E20696E63202000      expr_3 db "\n inc  ",0
  4619 00002087 776F726400              expr_4 db "word",0
  4620 0000208C 6279746500              expr_5 db "byte",0
  4621 00002091 4E7572207661722065-     expr_6 db "Nur var erlaubt",0
  4622 0000209A 726C6175627400     
  4623 000020A1 5C6E20646563202000      expr_7 db "\n dec  ",0
  4624 000020AA 776F726400              expr_8 db "word",0
  4625 000020AF 6279746500              expr_9 db "byte",0
  4626 000020B4 61646400                expr_10 db "add",0
  4627 000020B8 73756200                expr_11 db "sub",0
  4628 000020BC 616E6400                expr_12 db "and",0
  4629 000020C0 6F7200                  expr_13 db "or",0
  4630 000020C3 6E6F7420696D706C65-     expr_14 db "not implemented",0
  4631 000020CC 6D656E74656400     
  4632 000020D3 6E6F7420696D706C65-     expr_15 db "not implemented",0
  4633 000020DC 6D656E74656400     
  4634 000020E3 6D6F7600                expr_16 db "mov",0
  4635 000020E7 61646400                expr_17 db "add",0
  4636 000020EB 73756200                expr_18 db "sub",0
  4637 000020EF 616E6400                expr_19 db "and",0
  4638 000020F3 6F7200                  expr_20 db "or",0
  4639 000020F6 73686C00                expr_21 db "shl",0
  4640 000020FA 73687200                expr_22 db "shr",0
  4641 000020FE 636D7000                expr_23 db "cmp",0
  4642                                  ; ENDP
  4643                                  
  4644                                  compoundass:  ; *** PROC ***
  4645                                  
  4646                                  ;-464   if(mode) error1("only scalar Var allowed");
  4647                                  
  4648                                  ;Function : compoundass, Number of local variables: 3
  4649                                  ;   # type sign width addr used name   list of local variables
  4650                                  ;  200 ptr sign byte   463 NULL op = bp+4
  4651                                  ;  201 var sign word   463 NULL mode = bp+6
  4652                                  ;  202 var sign word   463 NULL id1 = bp+8;
  4653 00002102 C8000000                 ENTER  0,0
  4654 00002106 8B4606                   mov ax, [bp+6]
  4655 00002109 08C0                     or  al, al
  4656 0000210B 0F840900                 je .compoundass247
  4657 0000210F 68[7C21]                 push compoundass_0
  4658 00002112 E87826                   call error1
  4659 00002115 83C402                   add  sp, 2
  4660                                  
  4661                                  ;-465   prnl(); prs(op); prs("  "); 
  4662                                  
  4663                                  .compoundass247:
  4664 00002118 E8C023                   call prnl
  4665 0000211B FF7604                   push word [bp+4]
  4666 0000211E E8C823                   call prs
  4667 00002121 83C402                   add  sp, 2
  4668 00002124 68[9421]                 push compoundass_1
  4669 00002127 E8BF23                   call prs
  4670 0000212A 83C402                   add  sp, 2
  4671                                  
  4672                                  ;-466   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  4673                                  
  4674 0000212D FF7608                   push word [bp+8]
  4675 00002130 E8EAE6                   call gettypes
  4676 00002133 83C402                   add  sp, 2
  4677 00002136 A1[3900]                 mov ax, [wi]
  4678 00002139 83F802                   cmp ax, 2
  4679 0000213C 0F850C00                 jne .compoundass248
  4680 00002140 68[9721]                 push compoundass_2
  4681 00002143 E8A323                   call prs
  4682 00002146 83C402                   add  sp, 2
  4683 00002149 E90900                   jmp .compoundass249
  4684                                  .compoundass248:
  4685 0000214C 68[9C21]                 push compoundass_3
  4686 0000214F E89723                   call prs
  4687 00002152 83C402                   add  sp, 2
  4688                                  
  4689                                  ;-467   v(id1); prs(", ");
  4690                                  
  4691                                  .compoundass249:
  4692 00002155 FF7608                   push word [bp+8]
  4693 00002158 E814E2                   call v
  4694 0000215B 83C402                   add  sp, 2
  4695 0000215E 68[A121]                 push compoundass_4
  4696 00002161 E88523                   call prs
  4697 00002164 83C402                   add  sp, 2
  4698                                  
  4699                                  ;-468   expect(T_CONST); pint1(lexval);
  4700                                  
  4701 00002167 680101                   push 257
  4702 0000216A E86922                   call expect
  4703 0000216D 83C402                   add  sp, 2
  4704 00002170 FF36[2E00]               push word [lexval]
  4705 00002174 E86924                   call pint1
  4706 00002177 83C402                   add  sp, 2
  4707                                  
  4708                                  ;-469 }
  4709                                  
  4710                                  
  4711                                  ;-470 int dovar1(int mode, int op, int ixarr, int id1) { 
  4712 0000217A C9                       LEAVE
  4713 0000217B C3                       ret
  4714 0000217C 6F6E6C79207363616C-     compoundass_0 db "only scalar Var allowed",0
  4715 00002185 61722056617220616C-
  4716 0000218E 6C6F77656400       
  4717 00002194 202000                  compoundass_1 db "  ",0
  4718 00002197 776F726400              compoundass_2 db "word",0
  4719 0000219C 6279746500              compoundass_3 db "byte",0
  4720 000021A1 2C2000                  compoundass_4 db ", ",0
  4721                                  ; ENDP
  4722                                  
  4723                                  dovar1:  ; *** PROC ***
  4724                                  
  4725                                  ;-471   gettypes(id1);
  4726                                  
  4727                                  ;Function : dovar1, Number of local variables: 4
  4728                                  ;   # type sign width addr used name   list of local variables
  4729                                  ;  200 var sign word   470 NULL mode = bp+4
  4730                                  ;  201 var sign word   470 NULL op = bp+6
  4731                                  ;  202 var sign word   470 NULL ixarr = bp+8
  4732                                  ;  203 var sign word   470 NULL id1 = bp+10;
  4733 000021A4 C8000000                 ENTER  0,0
  4734 000021A8 FF760A                   push word [bp+10]
  4735 000021AB E86FE6                   call gettypes
  4736 000021AE 83C402                   add  sp, 2
  4737                                  
  4738                                  ;-472   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);
  4739                                  
  4740 000021B1 8B4604                   mov ax, [bp+4]
  4741 000021B4 83F801                   cmp ax, 1
  4742 000021B7 0F854700                 jne .dovar1250
  4743 000021BB 68[F922]                 push dovar1_0
  4744 000021BE E82823                   call prs
  4745 000021C1 83C402                   add  sp, 2
  4746 000021C4 FF760A                   push word [bp+10]
  4747 000021C7 E8A5E1                   call v
  4748 000021CA 83C402                   add  sp, 2
  4749 000021CD E80B23                   call prnl
  4750 000021D0 FF7606                   push word [bp+6]
  4751 000021D3 E81323                   call prs
  4752 000021D6 83C402                   add  sp, 2
  4753                                  
  4754                                  ;-473     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");
  4755                                  
  4756 000021D9 A1[3600]                 mov ax, [widthi]
  4757 000021DC 83F801                   cmp ax, 1
  4758 000021DF 0F850900                 jne .dovar1251
  4759 000021E3 68[0523]                 push dovar1_1
  4760 000021E6 E80023                   call prs
  4761 000021E9 83C402                   add  sp, 2
  4762                                  
  4763                                  ;-474     if(widthi == 2) prs(" ax, [bx]");
  4764                                  
  4765                                  .dovar1251:
  4766 000021EC A1[3600]                 mov ax, [widthi]
  4767 000021EF 83F802                   cmp ax, 2
  4768 000021F2 0F850900                 jne .dovar1252
  4769 000021F6 68[1B23]                 push dovar1_2
  4770 000021F9 E8ED22                   call prs
  4771 000021FC 83C402                   add  sp, 2
  4772                                  
  4773                                  ;-475     return; }
  4774                                  
  4775                                  .dovar1252:
  4776 000021FF E9F500                   jmp .retndovar1
  4777                                  
  4778                                  ;-476   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }
  4779                                  
  4780                                  .dovar1250:
  4781 00002202 8B4604                   mov ax, [bp+4]
  4782 00002205 83F802                   cmp ax, 2
  4783 00002208 0F852100                 jne .dovar1253
  4784 0000220C E8CC22                   call prnl
  4785 0000220F FF7606                   push word [bp+6]
  4786 00002212 E8D422                   call prs
  4787 00002215 83C402                   add  sp, 2
  4788 00002218 68[2523]                 push dovar1_3
  4789 0000221B E8CB22                   call prs
  4790 0000221E 83C402                   add  sp, 2
  4791 00002221 FF760A                   push word [bp+10]
  4792 00002224 E839E1                   call a
  4793 00002227 83C402                   add  sp, 2
  4794 0000222A E9CA00                   jmp .retndovar1
  4795                                  
  4796                                  ;-477   if (ixarr) {
  4797                                  
  4798                                  .dovar1253:
  4799 0000222D 8B4608                   mov ax, [bp+8]
  4800 00002230 08C0                     or  al, al
  4801 00002232 0F847300                 je .dovar1254
  4802                                  
  4803                                  ;-478     prs("\n mov bx, "); v(ixarr);
  4804                                  
  4805 00002236 68[2B23]                 push dovar1_4
  4806 00002239 E8AD22                   call prs
  4807 0000223C 83C402                   add  sp, 2
  4808 0000223F FF7608                   push word [bp+8]
  4809 00002242 E82AE1                   call v
  4810 00002245 83C402                   add  sp, 2
  4811                                  
  4812                                  ;-479     if (wi==2) prs("\n shl bx, 1");
  4813                                  
  4814 00002248 A1[3900]                 mov ax, [wi]
  4815 0000224B 83F802                   cmp ax, 2
  4816 0000224E 0F850900                 jne .dovar1255
  4817 00002252 68[3723]                 push dovar1_5
  4818 00002255 E89122                   call prs
  4819 00002258 83C402                   add  sp, 2
  4820                                  
  4821                                  ;-480     prs("\n "); prs(op);
  4822                                  
  4823                                  .dovar1255:
  4824 0000225B 68[4423]                 push dovar1_6
  4825 0000225E E88822                   call prs
  4826 00002261 83C402                   add  sp, 2
  4827 00002264 FF7606                   push word [bp+6]
  4828 00002267 E87F22                   call prs
  4829 0000226A 83C402                   add  sp, 2
  4830                                  
  4831                                  ;-481     if (wi==2) prs(" ax, "); else prs(" al, ");
  4832                                  
  4833 0000226D A1[3900]                 mov ax, [wi]
  4834 00002270 83F802                   cmp ax, 2
  4835 00002273 0F850C00                 jne .dovar1256
  4836 00002277 68[4823]                 push dovar1_7
  4837 0000227A E86C22                   call prs
  4838 0000227D 83C402                   add  sp, 2
  4839 00002280 E90900                   jmp .dovar1257
  4840                                  .dovar1256:
  4841 00002283 68[4E23]                 push dovar1_8
  4842 00002286 E86022                   call prs
  4843 00002289 83C402                   add  sp, 2
  4844                                  
  4845                                  ;-482 // v(id1); prs(" [bx]");
  4846                                  
  4847                                  
  4848                                  ;-483     prc('['); printName(id1); prs(" + bx]"); 
  4849                                  
  4850                                  .dovar1257:
  4851 0000228C 6A5B                     push 91
  4852 0000228E E8F121                   call prc
  4853 00002291 83C402                   add  sp, 2
  4854 00002294 FF760A                   push word [bp+10]
  4855 00002297 E85DE6                   call printName
  4856 0000229A 83C402                   add  sp, 2
  4857 0000229D 68[5423]                 push dovar1_9
  4858 000022A0 E84622                   call prs
  4859 000022A3 83C402                   add  sp, 2
  4860                                  
  4861                                  ;-484     return; }
  4862                                  
  4863 000022A6 E94E00                   jmp .retndovar1
  4864                                  
  4865                                  ;-485   prnl();prs(op);
  4866                                  
  4867                                  .dovar1254:
  4868 000022A9 E82F22                   call prnl
  4869 000022AC FF7606                   push word [bp+6]
  4870 000022AF E83722                   call prs
  4871 000022B2 83C402                   add  sp, 2
  4872                                  
  4873                                  ;-486   if(wi==1) prs(" al, ");
  4874                                  
  4875 000022B5 A1[3900]                 mov ax, [wi]
  4876 000022B8 83F801                   cmp ax, 1
  4877 000022BB 0F850900                 jne .dovar1258
  4878 000022BF 68[5B23]                 push dovar1_10
  4879 000022C2 E82422                   call prs
  4880 000022C5 83C402                   add  sp, 2
  4881                                  
  4882                                  ;-487   if(wi==2) prs(" ax, ");
  4883                                  
  4884                                  .dovar1258:
  4885 000022C8 A1[3900]                 mov ax, [wi]
  4886 000022CB 83F802                   cmp ax, 2
  4887 000022CE 0F850900                 jne .dovar1259
  4888 000022D2 68[6123]                 push dovar1_11
  4889 000022D5 E81122                   call prs
  4890 000022D8 83C402                   add  sp, 2
  4891                                  
  4892                                  ;-488   if(wi==4) prs(" eax, ");
  4893                                  
  4894                                  .dovar1259:
  4895 000022DB A1[3900]                 mov ax, [wi]
  4896 000022DE 83F804                   cmp ax, 4
  4897 000022E1 0F850900                 jne .dovar1260
  4898 000022E5 68[6723]                 push dovar1_12
  4899 000022E8 E8FE21                   call prs
  4900 000022EB 83C402                   add  sp, 2
  4901                                  
  4902                                  ;-489   v(id1);
  4903                                  
  4904                                  .dovar1260:
  4905 000022EE FF760A                   push word [bp+10]
  4906 000022F1 E87BE0                   call v
  4907 000022F4 83C402                   add  sp, 2
  4908                                  
  4909                                  ;-490 }
  4910                                  
  4911                                  
  4912                                  ;-491 int rterm(char *op) {int mode; int opint; int ixarr; int id1;
  4913                                  
  4914 000022F7 C9                       .retndovar1: LEAVE
  4915 000022F8 C3                       ret
  4916 000022F9 5C6E206D6F76206278-     dovar1_0 db "\n mov bx, ",0
  4917 00002302 2C2000             
  4918 00002305 20616C2C205B62785D-     dovar1_1 db " al, [bx]\n mov ah, 0",0
  4919 0000230E 5C6E206D6F76206168-
  4920 00002317 2C203000           
  4921 0000231B 2061782C205B62785D-     dovar1_2 db " ax, [bx]",0
  4922 00002324 00                 
  4923 00002325 2061782C2000            dovar1_3 db " ax, ",0
  4924 0000232B 5C6E206D6F76206278-     dovar1_4 db "\n mov bx, ",0
  4925 00002334 2C2000             
  4926 00002337 5C6E2073686C206278-     dovar1_5 db "\n shl bx, 1",0
  4927 00002340 2C203100           
  4928 00002344 5C6E2000                dovar1_6 db "\n ",0
  4929 00002348 2061782C2000            dovar1_7 db " ax, ",0
  4930 0000234E 20616C2C2000            dovar1_8 db " al, ",0
  4931 00002354 202B2062785D00          dovar1_9 db " + bx]",0
  4932 0000235B 20616C2C2000            dovar1_10 db " al, ",0
  4933 00002361 2061782C2000            dovar1_11 db " ax, ",0
  4934 00002367 206561782C2000          dovar1_12 db " eax, ",0
  4935                                  ; ENDP
  4936                                  
  4937                                  rterm:  ; *** PROC ***
  4938                                  
  4939                                  ;-492   if (istoken(T_CONST)) { prnl(); prs(op); 
  4940                                  
  4941                                  ;Function : rterm, Number of local variables: 5
  4942                                  ;   # type sign width addr used name   list of local variables
  4943                                  ;  200 ptr sign byte   491 NULL op = bp+4
  4944                                  ;  201 var sign word   491 NULL mode = bp-2
  4945                                  ;  202 var sign word   491 NULL opint = bp-4
  4946                                  ;  203 var sign word   491 NULL ixarr = bp-6
  4947                                  ;  204 var sign word   491 NULL id1 = bp-8;
  4948 0000236E C8080000                 ENTER  8,0
  4949 00002372 680101                   push 257
  4950 00002375 E83C20                   call istoken
  4951 00002378 83C402                   add  sp, 2
  4952 0000237B 08C0                     or  al, al
  4953 0000237D 0F845200                 je .rterm261
  4954 00002381 E85721                   call prnl
  4955 00002384 FF7604                   push word [bp+4]
  4956 00002387 E85F21                   call prs
  4957 0000238A 83C402                   add  sp, 2
  4958                                  
  4959                                  ;-493     if (wi==1) prs(" al, ");
  4960                                  
  4961 0000238D A1[3900]                 mov ax, [wi]
  4962 00002390 83F801                   cmp ax, 1
  4963 00002393 0F850900                 jne .rterm262
  4964 00002397 68[5724]                 push rterm_0
  4965 0000239A E84C21                   call prs
  4966 0000239D 83C402                   add  sp, 2
  4967                                  
  4968                                  ;-494     if (wi==2) prs(" ax, ");
  4969                                  
  4970                                  .rterm262:
  4971 000023A0 A1[3900]                 mov ax, [wi]
  4972 000023A3 83F802                   cmp ax, 2
  4973 000023A6 0F850900                 jne .rterm263
  4974 000023AA 68[5D24]                 push rterm_1
  4975 000023AD E83921                   call prs
  4976 000023B0 83C402                   add  sp, 2
  4977                                  
  4978                                  ;-495     if (wi==4) prs(" eax, ");
  4979                                  
  4980                                  .rterm263:
  4981 000023B3 A1[3900]                 mov ax, [wi]
  4982 000023B6 83F804                   cmp ax, 4
  4983 000023B9 0F850900                 jne .rterm264
  4984 000023BD 68[6324]                 push rterm_2
  4985 000023C0 E82621                   call prs
  4986 000023C3 83C402                   add  sp, 2
  4987                                  
  4988                                  ;-496     pint1(lexval); return;}
  4989                                  
  4990                                  .rterm264:
  4991 000023C6 FF36[2E00]               push word [lexval]
  4992 000023CA E81322                   call pint1
  4993 000023CD 83C402                   add  sp, 2
  4994 000023D0 E98200                   jmp .retnrterm
  4995                                  
  4996                                  ;-497   mode=typeName(); id1=searchname(); ixarr=0;
  4997                                  
  4998                                  .rterm261:
  4999 000023D3 E854E6                   call typeName
  5000 000023D6 8946FE                   mov [bp-2], ax
  5001 000023D9 E87FE5                   call searchname
  5002 000023DC 8946F8                   mov [bp-8], ax
  5003 000023DF B80000                   mov ax, 0
  5004 000023E2 8946FA                   mov [bp-6], ax
  5005                                  
  5006                                  ;-498   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');  
  5007                                  
  5008 000023E5 6A5B                     push 91
  5009 000023E7 E8CA1F                   call istoken
  5010 000023EA 83C402                   add  sp, 2
  5011 000023ED 08C0                     or  al, al
  5012 000023EF 0F843300                 je .rterm265
  5013 000023F3 E865E5                   call searchname
  5014 000023F6 8946FA                   mov [bp-6], ax
  5015 000023F9 680001                   push 256
  5016 000023FC E8D71F                   call expect
  5017 000023FF 83C402                   add  sp, 2
  5018 00002402 6A5D                     push 93
  5019 00002404 E8CF1F                   call expect
  5020 00002407 83C402                   add  sp, 2
  5021                                  
  5022                                  ;-499     gettypes(ixarr);
  5023                                  
  5024 0000240A FF76FA                   push word [bp-6]
  5025 0000240D E80DE4                   call gettypes
  5026 00002410 83C402                   add  sp, 2
  5027                                  
  5028                                  ;-500     if (widthi != 2) error1("Arrayindex muss int sein"); }
  5029                                  
  5030 00002413 A1[3600]                 mov ax, [widthi]
  5031 00002416 83F802                   cmp ax, 2
  5032 00002419 0F840900                 je  .rterm266
  5033 0000241D 68[6A24]                 push rterm_3
  5034 00002420 E86A23                   call error1
  5035 00002423 83C402                   add  sp, 2
  5036                                  .rterm266:
  5037                                  
  5038                                  ;-501   if (eqstr(symbol,"_AX")) return;
  5039                                  
  5040                                  .rterm265:
  5041 00002426 68[8324]                 push rterm_4
  5042 00002429 8D062B81                 lea  ax, [symbol]
  5043 0000242D 50                       push ax
  5044 0000242E E865DD                   call eqstr
  5045 00002431 83C404                   add  sp, 4
  5046 00002434 08C0                     or  al, al
  5047 00002436 0F840300                 je .rterm267
  5048 0000243A E91800                   jmp .retnrterm
  5049                                  
  5050                                  ;-502   opint=op; dovar1(mode, opint, ixarr, id1);
  5051                                  
  5052                                  .rterm267:
  5053 0000243D 8B4604                   mov ax, [bp+4]
  5054 00002440 8946FC                   mov [bp-4], ax
  5055 00002443 FF76F8                   push word [bp-8]
  5056 00002446 FF76FA                   push word [bp-6]
  5057 00002449 FF76FC                   push word [bp-4]
  5058 0000244C FF76FE                   push word [bp-2]
  5059 0000244F E852FD                   call dovar1
  5060 00002452 83C408                   add  sp, 8
  5061                                  
  5062                                  ;-503 }
  5063                                  
  5064                                  
  5065                                  ;-504 int isreg() {
  5066                                  
  5067 00002455 C9                       .retnrterm: LEAVE
  5068 00002456 C3                       ret
  5069 00002457 20616C2C2000            rterm_0 db " al, ",0
  5070 0000245D 2061782C2000            rterm_1 db " ax, ",0
  5071 00002463 206561782C2000          rterm_2 db " eax, ",0
  5072 0000246A 4172726179696E6465-     rterm_3 db "Arrayindex muss int sein",0
  5073 00002473 78206D75737320696E-
  5074 0000247C 74207365696E00     
  5075 00002483 5F415800                rterm_4 db "_AX",0
  5076                                  ; ENDP
  5077                                  
  5078                                  isreg:  ; *** PROC ***
  5079                                  
  5080                                  ;-505   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}
  5081                                  
  5082 00002487 68[7426]                 push isreg_0
  5083 0000248A 8D062B81                 lea  ax, [symbol]
  5084 0000248E 50                       push ax
  5085 0000248F E804DD                   call eqstr
  5086 00002492 83C404                   add  sp, 4
  5087 00002495 08C0                     or  al, al
  5088 00002497 0F840C00                 je .isreg268
  5089 0000249B 68[7826]                 push isreg_1
  5090 0000249E E84202                   call doreg
  5091 000024A1 83C402                   add  sp, 2
  5092 000024A4 E9C601                   jmp .r1
  5093                                  
  5094                                  ;-506   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}  
  5095                                  
  5096                                  .isreg268:
  5097 000024A7 68[7B26]                 push isreg_2
  5098 000024AA 8D062B81                 lea  ax, [symbol]
  5099 000024AE 50                       push ax
  5100 000024AF E8E4DC                   call eqstr
  5101 000024B2 83C404                   add  sp, 4
  5102 000024B5 08C0                     or  al, al
  5103 000024B7 0F840C00                 je .isreg269
  5104 000024BB 68[7F26]                 push isreg_3
  5105 000024BE E82202                   call doreg
  5106 000024C1 83C402                   add  sp, 2
  5107 000024C4 E9A601                   jmp .r1
  5108                                  
  5109                                  ;-507   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}
  5110                                  
  5111                                  .isreg269:
  5112 000024C7 68[8226]                 push isreg_4
  5113 000024CA 8D062B81                 lea  ax, [symbol]
  5114 000024CE 50                       push ax
  5115 000024CF E8C4DC                   call eqstr
  5116 000024D2 83C404                   add  sp, 4
  5117 000024D5 08C0                     or  al, al
  5118 000024D7 0F840C00                 je .isreg270
  5119 000024DB 68[8626]                 push isreg_5
  5120 000024DE E80202                   call doreg
  5121 000024E1 83C402                   add  sp, 2
  5122 000024E4 E98601                   jmp .r1
  5123                                  
  5124                                  ;-508   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}
  5125                                  
  5126                                  .isreg270:
  5127 000024E7 68[8926]                 push isreg_6
  5128 000024EA 8D062B81                 lea  ax, [symbol]
  5129 000024EE 50                       push ax
  5130 000024EF E8A4DC                   call eqstr
  5131 000024F2 83C404                   add  sp, 4
  5132 000024F5 08C0                     or  al, al
  5133 000024F7 0F840C00                 je .isreg271
  5134 000024FB 68[8D26]                 push isreg_7
  5135 000024FE E8E201                   call doreg
  5136 00002501 83C402                   add  sp, 2
  5137 00002504 E96601                   jmp .r1
  5138                                  
  5139                                  ;-509   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}
  5140                                  
  5141                                  .isreg271:
  5142 00002507 68[9026]                 push isreg_8
  5143 0000250A 8D062B81                 lea  ax, [symbol]
  5144 0000250E 50                       push ax
  5145 0000250F E884DC                   call eqstr
  5146 00002512 83C404                   add  sp, 4
  5147 00002515 08C0                     or  al, al
  5148 00002517 0F840C00                 je .isreg272
  5149 0000251B 68[9426]                 push isreg_9
  5150 0000251E E8C201                   call doreg
  5151 00002521 83C402                   add  sp, 2
  5152 00002524 E94601                   jmp .r1
  5153                                  
  5154                                  ;-510   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}    
  5155                                  
  5156                                  .isreg272:
  5157 00002527 68[9726]                 push isreg_10
  5158 0000252A 8D062B81                 lea  ax, [symbol]
  5159 0000252E 50                       push ax
  5160 0000252F E864DC                   call eqstr
  5161 00002532 83C404                   add  sp, 4
  5162 00002535 08C0                     or  al, al
  5163 00002537 0F840C00                 je .isreg273
  5164 0000253B 68[9B26]                 push isreg_11
  5165 0000253E E8A201                   call doreg
  5166 00002541 83C402                   add  sp, 2
  5167 00002544 E92601                   jmp .r1
  5168                                  
  5169                                  ;-511   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}
  5170                                  
  5171                                  .isreg273:
  5172 00002547 68[9E26]                 push isreg_12
  5173 0000254A 8D062B81                 lea  ax, [symbol]
  5174 0000254E 50                       push ax
  5175 0000254F E844DC                   call eqstr
  5176 00002552 83C404                   add  sp, 4
  5177 00002555 08C0                     or  al, al
  5178 00002557 0F840C00                 je .isreg274
  5179 0000255B 68[A226]                 push isreg_13
  5180 0000255E E88201                   call doreg
  5181 00002561 83C402                   add  sp, 2
  5182 00002564 E90601                   jmp .r1
  5183                                  
  5184                                  ;-512   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}
  5185                                  
  5186                                  .isreg274:
  5187 00002567 68[A526]                 push isreg_14
  5188 0000256A 8D062B81                 lea  ax, [symbol]
  5189 0000256E 50                       push ax
  5190 0000256F E824DC                   call eqstr
  5191 00002572 83C404                   add  sp, 4
  5192 00002575 08C0                     or  al, al
  5193 00002577 0F840C00                 je .isreg275
  5194 0000257B 68[A926]                 push isreg_15
  5195 0000257E E86201                   call doreg
  5196 00002581 83C402                   add  sp, 2
  5197 00002584 E9E600                   jmp .r1
  5198                                  
  5199                                  ;-513   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}    
  5200                                  
  5201                                  .isreg275:
  5202 00002587 68[AC26]                 push isreg_16
  5203 0000258A 8D062B81                 lea  ax, [symbol]
  5204 0000258E 50                       push ax
  5205 0000258F E804DC                   call eqstr
  5206 00002592 83C404                   add  sp, 4
  5207 00002595 08C0                     or  al, al
  5208 00002597 0F840C00                 je .isreg276
  5209 0000259B 68[B026]                 push isreg_17
  5210 0000259E E84201                   call doreg
  5211 000025A1 83C402                   add  sp, 2
  5212 000025A4 E9C600                   jmp .r1
  5213                                  
  5214                                  ;-514   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}
  5215                                  
  5216                                  .isreg276:
  5217 000025A7 68[B326]                 push isreg_18
  5218 000025AA 8D062B81                 lea  ax, [symbol]
  5219 000025AE 50                       push ax
  5220 000025AF E8E4DB                   call eqstr
  5221 000025B2 83C404                   add  sp, 4
  5222 000025B5 08C0                     or  al, al
  5223 000025B7 0F840C00                 je .isreg277
  5224 000025BB 68[B726]                 push isreg_19
  5225 000025BE E82201                   call doreg
  5226 000025C1 83C402                   add  sp, 2
  5227 000025C4 E9A600                   jmp .r1
  5228                                  
  5229                                  ;-515   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}
  5230                                  
  5231                                  .isreg277:
  5232 000025C7 68[BA26]                 push isreg_20
  5233 000025CA 8D062B81                 lea  ax, [symbol]
  5234 000025CE 50                       push ax
  5235 000025CF E8C4DB                   call eqstr
  5236 000025D2 83C404                   add  sp, 4
  5237 000025D5 08C0                     or  al, al
  5238 000025D7 0F840C00                 je .isreg278
  5239 000025DB 68[BE26]                 push isreg_21
  5240 000025DE E80201                   call doreg
  5241 000025E1 83C402                   add  sp, 2
  5242 000025E4 E98600                   jmp .r1
  5243                                  
  5244                                  ;-516   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}  
  5245                                  
  5246                                  .isreg278:
  5247 000025E7 68[C126]                 push isreg_22
  5248 000025EA 8D062B81                 lea  ax, [symbol]
  5249 000025EE 50                       push ax
  5250 000025EF E8A4DB                   call eqstr
  5251 000025F2 83C404                   add  sp, 4
  5252 000025F5 08C0                     or  al, al
  5253 000025F7 0F840C00                 je .isreg279
  5254 000025FB 68[C526]                 push isreg_23
  5255 000025FE E8E200                   call doreg
  5256 00002601 83C402                   add  sp, 2
  5257 00002604 E96600                   jmp .r1
  5258                                  
  5259                                  ;-517   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}
  5260                                  
  5261                                  .isreg279:
  5262 00002607 68[C826]                 push isreg_24
  5263 0000260A 8D062B81                 lea  ax, [symbol]
  5264 0000260E 50                       push ax
  5265 0000260F E884DB                   call eqstr
  5266 00002612 83C404                   add  sp, 4
  5267 00002615 08C0                     or  al, al
  5268 00002617 0F840C00                 je .isreg280
  5269 0000261B 68[CC26]                 push isreg_25
  5270 0000261E E8C200                   call doreg
  5271 00002621 83C402                   add  sp, 2
  5272 00002624 E94600                   jmp .r1
  5273                                  
  5274                                  ;-518   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}
  5275                                  
  5276                                  .isreg280:
  5277 00002627 68[CF26]                 push isreg_26
  5278 0000262A 8D062B81                 lea  ax, [symbol]
  5279 0000262E 50                       push ax
  5280 0000262F E864DB                   call eqstr
  5281 00002632 83C404                   add  sp, 4
  5282 00002635 08C0                     or  al, al
  5283 00002637 0F840C00                 je .isreg281
  5284 0000263B 68[D326]                 push isreg_27
  5285 0000263E E8A200                   call doreg
  5286 00002641 83C402                   add  sp, 2
  5287 00002644 E92600                   jmp .r1
  5288                                  
  5289                                  ;-519   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}  
  5290                                  
  5291                                  .isreg281:
  5292 00002647 68[D626]                 push isreg_28
  5293 0000264A 8D062B81                 lea  ax, [symbol]
  5294 0000264E 50                       push ax
  5295 0000264F E844DB                   call eqstr
  5296 00002652 83C404                   add  sp, 4
  5297 00002655 08C0                     or  al, al
  5298 00002657 0F840C00                 je .isreg282
  5299 0000265B 68[DD26]                 push isreg_29
  5300 0000265E E88200                   call doreg
  5301 00002661 83C402                   add  sp, 2
  5302 00002664 E90600                   jmp .r1
  5303                                  
  5304                                  ;-520   return 0;   r1: return 1; 
  5305                                  
  5306                                  .isreg282:
  5307 00002667 B80000                   mov ax, 0
  5308 0000266A E90600                   jmp .retnisreg
  5309                                  .r1:
  5310 0000266D B80100                   mov ax, 1
  5311 00002670 E90000                   jmp .retnisreg
  5312                                  
  5313                                  ;-521 }
  5314                                  
  5315                                  
  5316                                  ;-522 int doreg(char *dr) { int i; expect('=');
  5317                                  
  5318                                   .retnisreg:
  5319 00002673 C3                       ret
  5320 00002674 5F414800                isreg_0 db "_AH",0
  5321 00002678 616800                  isreg_1 db "ah",0
  5322 0000267B 5F414C00                isreg_2 db "_AL",0
  5323 0000267F 616C00                  isreg_3 db "al",0
  5324 00002682 5F415800                isreg_4 db "_AX",0
  5325 00002686 617800                  isreg_5 db "ax",0
  5326 00002689 5F424800                isreg_6 db "_BH",0
  5327 0000268D 626800                  isreg_7 db "bh",0
  5328 00002690 5F424C00                isreg_8 db "_BL",0
  5329 00002694 626C00                  isreg_9 db "bl",0
  5330 00002697 5F425800                isreg_10 db "_BX",0
  5331 0000269B 627800                  isreg_11 db "bx",0
  5332 0000269E 5F434800                isreg_12 db "_CH",0
  5333 000026A2 636800                  isreg_13 db "ch",0
  5334 000026A5 5F434C00                isreg_14 db "_CL",0
  5335 000026A9 636C00                  isreg_15 db "cl",0
  5336 000026AC 5F435800                isreg_16 db "_CX",0
  5337 000026B0 637800                  isreg_17 db "cx",0
  5338 000026B3 5F444800                isreg_18 db "_DH",0
  5339 000026B7 646800                  isreg_19 db "dh",0
  5340 000026BA 5F444C00                isreg_20 db "_DL",0
  5341 000026BE 646C00                  isreg_21 db "dl",0
  5342 000026C1 5F445800                isreg_22 db "_DX",0
  5343 000026C5 647800                  isreg_23 db "dx",0
  5344 000026C8 5F534900                isreg_24 db "_SI",0
  5345 000026CC 736900                  isreg_25 db "si",0
  5346 000026CF 5F444900                isreg_26 db "_DI",0
  5347 000026D3 646900                  isreg_27 db "di",0
  5348 000026D6 5F464C41475300          isreg_28 db "_FLAGS",0
  5349 000026DD 666C61677300            isreg_29 db "flags",0
  5350                                  ; ENDP
  5351                                  
  5352                                  doreg:  ; *** PROC ***
  5353                                  ;Function : doreg, Number of local variables: 2
  5354                                  ;   # type sign width addr used name   list of local variables
  5355                                  ;  200 ptr sign byte   522 NULL dr = bp+4
  5356                                  ;  201 var sign word   522 NULL i = bp-2;
  5357 000026E3 C8020000                 ENTER  2,0
  5358 000026E7 6A3D                     push 61
  5359 000026E9 E8EA1C                   call expect
  5360 000026EC 83C402                   add  sp, 2
  5361                                  
  5362                                  ;-523   prs("\n mov  "); prs(dr); prs(", ");
  5363                                  
  5364 000026EF 68[5227]                 push doreg_0
  5365 000026F2 E8F41D                   call prs
  5366 000026F5 83C402                   add  sp, 2
  5367 000026F8 FF7604                   push word [bp+4]
  5368 000026FB E8EB1D                   call prs
  5369 000026FE 83C402                   add  sp, 2
  5370 00002701 68[5B27]                 push doreg_1
  5371 00002704 E8E21D                   call prs
  5372 00002707 83C402                   add  sp, 2
  5373                                  
  5374                                  ;-524        if (istoken(T_CONST)) pint1(lexval);
  5375                                  
  5376 0000270A 680101                   push 257
  5377 0000270D E8A41C                   call istoken
  5378 00002710 83C402                   add  sp, 2
  5379 00002713 08C0                     or  al, al
  5380 00002715 0F840D00                 je .doreg283
  5381 00002719 FF36[2E00]               push word [lexval]
  5382 0000271D E8C01E                   call pint1
  5383 00002720 83C402                   add  sp, 2
  5384                                  
  5385                                  ;-525   else if (istoken(T_NAME )) { i=searchname(); v(i); }
  5386                                  
  5387 00002723 E92A00                   jmp .doreg284
  5388                                  .doreg283:
  5389 00002726 680001                   push 256
  5390 00002729 E8881C                   call istoken
  5391 0000272C 83C402                   add  sp, 2
  5392 0000272F 08C0                     or  al, al
  5393 00002731 0F841200                 je .doreg285
  5394 00002735 E823E2                   call searchname
  5395 00002738 8946FE                   mov [bp-2], ax
  5396 0000273B FF76FE                   push word [bp-2]
  5397 0000273E E82EDC                   call v
  5398 00002741 83C402                   add  sp, 2
  5399                                  
  5400                                  ;-526   else error1("only number or var allowed"); }
  5401                                  
  5402 00002744 E90900                   jmp .doreg286
  5403                                  .doreg285:
  5404 00002747 68[5E27]                 push doreg_2
  5405 0000274A E84020                   call error1
  5406 0000274D 83C402                   add  sp, 2
  5407                                  .doreg286:
  5408                                  .doreg284:
  5409                                  
  5410                                  ;-527 
  5411                                  
  5412                                  
  5413                                  ;-528 int doassign(int mode, int i, int ixarr, int ixconst) {
  5414 00002750 C9                       LEAVE
  5415 00002751 C3                       ret
  5416 00002752 5C6E206D6F76202000      doreg_0 db "\n mov  ",0
  5417 0000275B 2C2000                  doreg_1 db ", ",0
  5418 0000275E 6F6E6C79206E756D62-     doreg_2 db "only number or var allowed",0
  5419 00002767 6572206F7220766172-
  5420 00002770 20616C6C6F77656400 
  5421                                  ; ENDP
  5422                                  
  5423                                  doassign:  ; *** PROC ***
  5424                                  
  5425                                  ;-529   gettypes(i);
  5426                                  
  5427                                  ;Function : doassign, Number of local variables: 4
  5428                                  ;   # type sign width addr used name   list of local variables
  5429                                  ;  200 var sign word   528 NULL mode = bp+4
  5430                                  ;  201 var sign word   528 NULL i = bp+6
  5431                                  ;  202 var sign word   528 NULL ixarr = bp+8
  5432                                  ;  203 var sign word   528 NULL ixconst = bp+10;
  5433 00002779 C8000000                 ENTER  0,0
  5434 0000277D FF7606                   push word [bp+6]
  5435 00002780 E89AE0                   call gettypes
  5436 00002783 83C402                   add  sp, 2
  5437                                  
  5438                                  ;-530   if (mode==1) {prs("\n mov  bx, ");v(i);                  
  5439                                  
  5440 00002786 8B4604                   mov ax, [bp+4]
  5441 00002789 83F801                   cmp ax, 1
  5442 0000278C 0F853400                 jne .doassign287
  5443 00002790 68[1629]                 push doassign_0
  5444 00002793 E8531D                   call prs
  5445 00002796 83C402                   add  sp, 2
  5446 00002799 FF7606                   push word [bp+6]
  5447 0000279C E8D0DB                   call v
  5448 0000279F 83C402                   add  sp, 2
  5449                                  
  5450                                  ;-531     if (widthi == 2) prs("\n mov  [bx], ax");
  5451                                  
  5452 000027A2 A1[3600]                 mov ax, [widthi]
  5453 000027A5 83F802                   cmp ax, 2
  5454 000027A8 0F850C00                 jne .doassign288
  5455 000027AC 68[2329]                 push doassign_1
  5456 000027AF E8371D                   call prs
  5457 000027B2 83C402                   add  sp, 2
  5458                                  
  5459                                  ;-532     else  prs("\n mov  [bx], al"); return;}
  5460                                  
  5461 000027B5 E90900                   jmp .doassign289
  5462                                  .doassign288:
  5463 000027B8 68[3429]                 push doassign_2
  5464 000027BB E82B1D                   call prs
  5465 000027BE 83C402                   add  sp, 2
  5466                                  .doassign289:
  5467 000027C1 E95001                   jmp .retndoassign
  5468                                  
  5469                                  ;-533   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}
  5470                                  
  5471                                  .doassign287:
  5472 000027C4 8B4604                   mov ax, [bp+4]
  5473 000027C7 83F802                   cmp ax, 2
  5474 000027CA 0F851E00                 jne .doassign290
  5475 000027CE 68[4529]                 push doassign_3
  5476 000027D1 E8151D                   call prs
  5477 000027D4 83C402                   add  sp, 2
  5478 000027D7 FF7606                   push word [bp+6]
  5479 000027DA E883DB                   call a
  5480 000027DD 83C402                   add  sp, 2
  5481 000027E0 68[4E29]                 push doassign_4
  5482 000027E3 E8031D                   call prs
  5483 000027E6 83C402                   add  sp, 2
  5484 000027E9 E92801                   jmp .retndoassign
  5485                                  
  5486                                  ;-534   if (ixarr) {  prs("\n mov bx, ");
  5487                                  
  5488                                  .doassign290:
  5489 000027EC 8B4608                   mov ax, [bp+8]
  5490 000027EF 08C0                     or  al, al
  5491 000027F1 0F846E00                 je .doassign291
  5492 000027F5 68[5329]                 push doassign_5
  5493 000027F8 E8EE1C                   call prs
  5494 000027FB 83C402                   add  sp, 2
  5495                                  
  5496                                  ;-535     if(ixconst) pint1(ixarr); else v(ixarr);
  5497                                  
  5498 000027FE 8B460A                   mov ax, [bp+10]
  5499 00002801 08C0                     or  al, al
  5500 00002803 0F840C00                 je .doassign292
  5501 00002807 FF7608                   push word [bp+8]
  5502 0000280A E8D31D                   call pint1
  5503 0000280D 83C402                   add  sp, 2
  5504 00002810 E90900                   jmp .doassign293
  5505                                  .doassign292:
  5506 00002813 FF7608                   push word [bp+8]
  5507 00002816 E856DB                   call v
  5508 00002819 83C402                   add  sp, 2
  5509                                  
  5510                                  ;-536     if (wi==2) prs("\n shl bx, 1");
  5511                                  
  5512                                  .doassign293:
  5513 0000281C A1[3900]                 mov ax, [wi]
  5514 0000281F 83F802                   cmp ax, 2
  5515 00002822 0F850900                 jne .doassign294
  5516 00002826 68[5F29]                 push doassign_6
  5517 00002829 E8BD1C                   call prs
  5518 0000282C 83C402                   add  sp, 2
  5519                                  
  5520                                  ;-537     prs("\n mov ["); printName(i);
  5521                                  
  5522                                  .doassign294:
  5523 0000282F 68[6C29]                 push doassign_7
  5524 00002832 E8B41C                   call prs
  5525 00002835 83C402                   add  sp, 2
  5526 00002838 FF7606                   push word [bp+6]
  5527 0000283B E8B9E0                   call printName
  5528 0000283E 83C402                   add  sp, 2
  5529                                  
  5530                                  ;-538     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }
  5531                                  
  5532 00002841 A1[3900]                 mov ax, [wi]
  5533 00002844 83F802                   cmp ax, 2
  5534 00002847 0F850C00                 jne .doassign295
  5535 0000284B 68[7529]                 push doassign_8
  5536 0000284E E8981C                   call prs
  5537 00002851 83C402                   add  sp, 2
  5538 00002854 E90900                   jmp .doassign296
  5539                                  .doassign295:
  5540 00002857 68[7E29]                 push doassign_9
  5541 0000285A E88C1C                   call prs
  5542 0000285D 83C402                   add  sp, 2
  5543                                  .doassign296:
  5544 00002860 E9B100                   jmp .retndoassign
  5545                                  
  5546                                  ;-539   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");
  5547                                  
  5548                                  .doassign291:
  5549 00002863 A1[3900]                 mov ax, [wi]
  5550 00002866 83F801                   cmp ax, 1
  5551 00002869 0F853100                 jne .doassign297
  5552 0000286D 68[8729]                 push doassign_10
  5553 00002870 E8761C                   call prs
  5554 00002873 83C402                   add  sp, 2
  5555 00002876 8B4606                   mov ax, [bp+6]
  5556 00002879 3DC800                   cmp ax, 200
  5557 0000287C 0F8D0900                 jge .doassign298
  5558 00002880 68[8F29]                 push doassign_11
  5559 00002883 E8631C                   call prs
  5560 00002886 83C402                   add  sp, 2
  5561                                  
  5562                                  ;-540     } v(i); prs(", al"); return; }
  5563                                  
  5564                                  .doassign298:
  5565 00002889 FF7606                   push word [bp+6]
  5566 0000288C E8E0DA                   call v
  5567 0000288F 83C402                   add  sp, 2
  5568 00002892 68[9529]                 push doassign_12
  5569 00002895 E8511C                   call prs
  5570 00002898 83C402                   add  sp, 2
  5571 0000289B E97600                   jmp .retndoassign
  5572                                  
  5573                                  ;-541   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");
  5574                                  
  5575                                  .doassign297:
  5576 0000289E A1[3900]                 mov ax, [wi]
  5577 000028A1 83F802                   cmp ax, 2
  5578 000028A4 0F853100                 jne .doassign299
  5579 000028A8 68[9A29]                 push doassign_13
  5580 000028AB E83B1C                   call prs
  5581 000028AE 83C402                   add  sp, 2
  5582 000028B1 8B4606                   mov ax, [bp+6]
  5583 000028B4 3DC800                   cmp ax, 200
  5584 000028B7 0F8D0900                 jge .doassign300
  5585 000028BB 68[A229]                 push doassign_14
  5586 000028BE E8281C                   call prs
  5587 000028C1 83C402                   add  sp, 2
  5588                                  
  5589                                  ;-542     } v(i); prs(", ax"); return; }
  5590                                  
  5591                                  .doassign300:
  5592 000028C4 FF7606                   push word [bp+6]
  5593 000028C7 E8A5DA                   call v
  5594 000028CA 83C402                   add  sp, 2
  5595 000028CD 68[A829]                 push doassign_15
  5596 000028D0 E8161C                   call prs
  5597 000028D3 83C402                   add  sp, 2
  5598 000028D6 E93B00                   jmp .retndoassign
  5599                                  
  5600                                  ;-543   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");
  5601                                  
  5602                                  .doassign299:
  5603 000028D9 A1[3900]                 mov ax, [wi]
  5604 000028DC 83F804                   cmp ax, 4
  5605 000028DF 0F853100                 jne .doassign301
  5606 000028E3 68[AD29]                 push doassign_16
  5607 000028E6 E8001C                   call prs
  5608 000028E9 83C402                   add  sp, 2
  5609 000028EC 8B4606                   mov ax, [bp+6]
  5610 000028EF 3DC800                   cmp ax, 200
  5611 000028F2 0F8D0900                 jge .doassign302
  5612 000028F6 68[B529]                 push doassign_17
  5613 000028F9 E8ED1B                   call prs
  5614 000028FC 83C402                   add  sp, 2
  5615                                  
  5616                                  ;-544     } v(i); prs(", eax"); return; }
  5617                                  
  5618                                  .doassign302:
  5619 000028FF FF7606                   push word [bp+6]
  5620 00002902 E86ADA                   call v
  5621 00002905 83C402                   add  sp, 2
  5622 00002908 68[BC29]                 push doassign_18
  5623 0000290B E8DB1B                   call prs
  5624 0000290E 83C402                   add  sp, 2
  5625 00002911 E90000                   jmp .retndoassign
  5626                                  
  5627                                  ;-545 }
  5628                                  
  5629                                  .doassign301:
  5630                                  
  5631                                  ;-546 int domul(int ids) {
  5632                                  
  5633 00002914 C9                       .retndoassign: LEAVE
  5634 00002915 C3                       ret
  5635 00002916 5C6E206D6F76202062-     doassign_0 db "\n mov  bx, ",0
  5636 0000291F 782C2000           
  5637 00002923 5C6E206D6F7620205B-     doassign_1 db "\n mov  [bx], ax",0
  5638 0000292C 62785D2C20617800   
  5639 00002934 5C6E206D6F7620205B-     doassign_2 db "\n mov  [bx], al",0
  5640 0000293D 62785D2C20616C00   
  5641 00002945 5C6E206D6F76202000      doassign_3 db "\n mov  ",0
  5642 0000294E 2C20617800              doassign_4 db ", ax",0
  5643 00002953 5C6E206D6F76206278-     doassign_5 db "\n mov bx, ",0
  5644 0000295C 2C2000             
  5645 0000295F 5C6E2073686C206278-     doassign_6 db "\n shl bx, 1",0
  5646 00002968 2C203100           
  5647 0000296C 5C6E206D6F76205B00      doassign_7 db "\n mov [",0
  5648 00002975 2B62785D2C20617800      doassign_8 db "+bx], ax",0
  5649 0000297E 2B62785D2C20616C00      doassign_9 db "+bx], al",0
  5650 00002987 5C6E206D6F762000        doassign_10 db "\n mov ",0
  5651 0000298F 627974652000            doassign_11 db "byte ",0
  5652 00002995 2C20616C00              doassign_12 db ", al",0
  5653 0000299A 5C6E206D6F762000        doassign_13 db "\n mov ",0
  5654 000029A2 776F72642000            doassign_14 db "word ",0
  5655 000029A8 2C20617800              doassign_15 db ", ax",0
  5656 000029AD 5C6E206D6F762000        doassign_16 db "\n mov ",0
  5657 000029B5 64776F72642000          doassign_17 db "dword ",0
  5658 000029BC 2C2065617800            doassign_18 db ", eax",0
  5659                                  ; ENDP
  5660                                  
  5661                                  domul:  ; *** PROC ***
  5662                                  
  5663                                  ;-547   if (ids) rterm("imul"); else {
  5664                                  
  5665                                  ;Function : domul, Number of local variables: 1
  5666                                  ;   # type sign width addr used name   list of local variables
  5667                                  ;  200 var sign word   546 NULL ids = bp+4;
  5668 000029C2 C8000000                 ENTER  0,0
  5669 000029C6 8B4604                   mov ax, [bp+4]
  5670 000029C9 08C0                     or  al, al
  5671 000029CB 0F840C00                 je .domul303
  5672 000029CF 68[142A]                 push domul_0
  5673 000029D2 E899F9                   call rterm
  5674 000029D5 83C402                   add  sp, 2
  5675 000029D8 E93700                   jmp .domul304
  5676                                  .domul303:
  5677                                  
  5678                                  ;-548   if (istoken(T_CONST)) {prs("\n mov bx, "); pint1(lexval); prs("\n mul bx"); }
  5679                                  
  5680 000029DB 680101                   push 257
  5681 000029DE E8D319                   call istoken
  5682 000029E1 83C402                   add  sp, 2
  5683 000029E4 08C0                     or  al, al
  5684 000029E6 0F841F00                 je .domul305
  5685 000029EA 68[192A]                 push domul_1
  5686 000029ED E8F91A                   call prs
  5687 000029F0 83C402                   add  sp, 2
  5688 000029F3 FF36[2E00]               push word [lexval]
  5689 000029F7 E8E61B                   call pint1
  5690 000029FA 83C402                   add  sp, 2
  5691 000029FD 68[252A]                 push domul_2
  5692 00002A00 E8E61A                   call prs
  5693 00002A03 83C402                   add  sp, 2
  5694                                  
  5695                                  ;-549   else error1("with MUL only const number as multiplicator allowed"); } }
  5696                                  
  5697 00002A06 E90900                   jmp .domul306
  5698                                  .domul305:
  5699 00002A09 68[2F2A]                 push domul_3
  5700 00002A0C E87E1D                   call error1
  5701 00002A0F 83C402                   add  sp, 2
  5702                                  .domul306:
  5703                                  .domul304:
  5704                                  
  5705                                  ;-550 int doidiv(int ids) { int mode; int id1;
  5706 00002A12 C9                       LEAVE
  5707 00002A13 C3                       ret
  5708 00002A14 696D756C00              domul_0 db "imul",0
  5709 00002A19 5C6E206D6F76206278-     domul_1 db "\n mov bx, ",0
  5710 00002A22 2C2000             
  5711 00002A25 5C6E206D756C206278-     domul_2 db "\n mul bx",0
  5712 00002A2E 00                 
  5713 00002A2F 77697468204D554C20-     domul_3 db "with MUL only const number as multiplicator allowed",0
  5714 00002A38 6F6E6C7920636F6E73-
  5715 00002A41 74206E756D62657220-
  5716 00002A4A 6173206D756C746970-
  5717 00002A53 6C696361746F722061-
  5718 00002A5C 6C6C6F77656400     
  5719                                  ; ENDP
  5720                                  
  5721                                  doidiv:  ; *** PROC ***
  5722                                  
  5723                                  ;-551   if (istoken(T_CONST)) {
  5724                                  
  5725                                  ;Function : doidiv, Number of local variables: 3
  5726                                  ;   # type sign width addr used name   list of local variables
  5727                                  ;  200 var sign word   550 NULL ids = bp+4
  5728                                  ;  201 var sign word   550 NULL mode = bp-2
  5729                                  ;  202 var sign word   550 NULL id1 = bp-4;
  5730 00002A63 C8040000                 ENTER  4,0
  5731 00002A67 680101                   push 257
  5732 00002A6A E84719                   call istoken
  5733 00002A6D 83C402                   add  sp, 2
  5734 00002A70 08C0                     or  al, al
  5735 00002A72 0F843400                 je .doidiv307
  5736                                  
  5737                                  ;-552     prs("\n mov bx, "); pint1(lexval);
  5738                                  
  5739 00002A76 68[282B]                 push doidiv_0
  5740 00002A79 E86D1A                   call prs
  5741 00002A7C 83C402                   add  sp, 2
  5742 00002A7F FF36[2E00]               push word [lexval]
  5743 00002A83 E85A1B                   call pint1
  5744 00002A86 83C402                   add  sp, 2
  5745                                  
  5746                                  ;-553     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5747                                  
  5748 00002A89 8B4604                   mov ax, [bp+4]
  5749 00002A8C 08C0                     or  al, al
  5750 00002A8E 0F840C00                 je .doidiv308
  5751 00002A92 68[342B]                 push doidiv_1
  5752 00002A95 E8511A                   call prs
  5753 00002A98 83C402                   add  sp, 2
  5754 00002A9B E90900                   jmp .doidiv309
  5755                                  .doidiv308:
  5756 00002A9E 68[452B]                 push doidiv_2
  5757 00002AA1 E8451A                   call prs
  5758 00002AA4 83C402                   add  sp, 2
  5759                                  .doidiv309:
  5760                                  
  5761                                  ;-554   else {
  5762                                  
  5763 00002AA7 E97C00                   jmp .doidiv310
  5764                                  .doidiv307:
  5765                                  
  5766                                  ;-555     mode=typeName(); id1=searchname();
  5767                                  
  5768 00002AAA E87DDF                   call typeName
  5769 00002AAD 8946FE                   mov [bp-2], ax
  5770 00002AB0 E8A8DE                   call searchname
  5771 00002AB3 8946FC                   mov [bp-4], ax
  5772                                  
  5773                                  ;-556     if (mode) error1("only const number or int as divisor allowed");
  5774                                  
  5775 00002AB6 8B46FE                   mov ax, [bp-2]
  5776 00002AB9 08C0                     or  al, al
  5777 00002ABB 0F840900                 je .doidiv311
  5778 00002ABF 68[5B2B]                 push doidiv_3
  5779 00002AC2 E8C81C                   call error1
  5780 00002AC5 83C402                   add  sp, 2
  5781                                  
  5782                                  ;-557     gettypes(id1);
  5783                                  
  5784                                  .doidiv311:
  5785 00002AC8 FF76FC                   push word [bp-4]
  5786 00002ACB E84FDD                   call gettypes
  5787 00002ACE 83C402                   add  sp, 2
  5788                                  
  5789                                  ;-558     if (typei) error1("only int as simple var divisor allowed");
  5790                                  
  5791 00002AD1 A1[3000]                 mov ax, [typei]
  5792 00002AD4 08C0                     or  al, al
  5793 00002AD6 0F840900                 je .doidiv312
  5794 00002ADA 68[872B]                 push doidiv_4
  5795 00002ADD E8AD1C                   call error1
  5796 00002AE0 83C402                   add  sp, 2
  5797                                  
  5798                                  ;-559     if (wi!=2) error1("only int, no byte as divisor allowed");
  5799                                  
  5800                                  .doidiv312:
  5801 00002AE3 A1[3900]                 mov ax, [wi]
  5802 00002AE6 83F802                   cmp ax, 2
  5803 00002AE9 0F840900                 je  .doidiv313
  5804 00002AED 68[AE2B]                 push doidiv_5
  5805 00002AF0 E89A1C                   call error1
  5806 00002AF3 83C402                   add  sp, 2
  5807                                  
  5808                                  ;-560     prs("\n mov bx, "); v(id1);
  5809                                  
  5810                                  .doidiv313:
  5811 00002AF6 68[D32B]                 push doidiv_6
  5812 00002AF9 E8ED19                   call prs
  5813 00002AFC 83C402                   add  sp, 2
  5814 00002AFF FF76FC                   push word [bp-4]
  5815 00002B02 E86AD8                   call v
  5816 00002B05 83C402                   add  sp, 2
  5817                                  
  5818                                  ;-561     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5819                                  
  5820 00002B08 8B4604                   mov ax, [bp+4]
  5821 00002B0B 08C0                     or  al, al
  5822 00002B0D 0F840C00                 je .doidiv314
  5823 00002B11 68[DF2B]                 push doidiv_7
  5824 00002B14 E8D219                   call prs
  5825 00002B17 83C402                   add  sp, 2
  5826 00002B1A E90900                   jmp .doidiv315
  5827                                  .doidiv314:
  5828 00002B1D 68[F02B]                 push doidiv_8
  5829 00002B20 E8C619                   call prs
  5830 00002B23 83C402                   add  sp, 2
  5831                                  .doidiv315:
  5832                                  
  5833                                  ;-562 }
  5834                                  
  5835                                  .doidiv310:
  5836                                  
  5837                                  ;-563 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
  5838 00002B26 C9                       LEAVE
  5839 00002B27 C3                       ret
  5840 00002B28 5C6E206D6F76206278-     doidiv_0 db "\n mov bx, ",0
  5841 00002B31 2C2000             
  5842 00002B34 5C6E206377645C6E20-     doidiv_1 db "\n cwd\n idiv bx",0
  5843 00002B3D 6964697620627800   
  5844 00002B45 5C6E206D6F76206478-     doidiv_2 db "\n mov dx, 0\n div bx",0
  5845 00002B4E 2C20305C6E20646976-
  5846 00002B57 20627800           
  5847 00002B5B 6F6E6C7920636F6E73-     doidiv_3 db "only const number or int as divisor allowed",0
  5848 00002B64 74206E756D62657220-
  5849 00002B6D 6F7220696E74206173-
  5850 00002B76 2064697669736F7220-
  5851 00002B7F 616C6C6F77656400   
  5852 00002B87 6F6E6C7920696E7420-     doidiv_4 db "only int as simple var divisor allowed",0
  5853 00002B90 61732073696D706C65-
  5854 00002B99 207661722064697669-
  5855 00002BA2 736F7220616C6C6F77-
  5856 00002BAB 656400             
  5857 00002BAE 6F6E6C7920696E742C-     doidiv_5 db "only int, no byte as divisor allowed",0
  5858 00002BB7 206E6F206279746520-
  5859 00002BC0 61732064697669736F-
  5860 00002BC9 7220616C6C6F776564-
  5861 00002BD2 00                 
  5862 00002BD3 5C6E206D6F76206278-     doidiv_6 db "\n mov bx, ",0
  5863 00002BDC 2C2000             
  5864 00002BDF 5C6E206377645C6E20-     doidiv_7 db "\n cwd\n idiv bx",0
  5865 00002BE8 6964697620627800   
  5866 00002BF0 5C6E206D6F76206478-     doidiv_8 db "\n mov dx, 0\n div bx",0
  5867 00002BF9 2C20305C6E20646976-
  5868 00002C02 20627800           
  5869                                  ; ENDP
  5870                                  
  5871                                  domod:  ; *** PROC ***
  5872                                  ;Function : domod, Number of local variables: 1
  5873                                  ;   # type sign width addr used name   list of local variables
  5874                                  ;  200 var sign word   563 NULL ids = bp+4;
  5875 00002C06 C8000000                 ENTER  0,0
  5876 00002C0A FF7604                   push word [bp+4]
  5877 00002C0D E853FE                   call doidiv
  5878 00002C10 83C402                   add  sp, 2
  5879 00002C13 68[1E2C]                 push domod_0
  5880 00002C16 E8D018                   call prs
  5881 00002C19 83C402                   add  sp, 2
  5882                                  
  5883                                  ;-564 
  5884                                  
  5885                                  
  5886                                  ;-565 int docalltype[10]; int docallvalue[10];
  5887 00002C1C C9                       LEAVE
  5888 00002C1D C3                       ret
  5889 00002C1E 5C6E206D6F76206178-     domod_0 db "\n mov ax, dx",0
  5890 00002C27 2C20647800         
  5891                                  ; ENDP
  5892                                  section .bss
  5893                                  absolute -12125
  5894 FFFFD0A3 <res 00000014>          docalltype resw 10
  5895                                  section .text
  5896                                  section .bss
  5897                                  absolute -12105
  5898 FFFFD0B7 <res 00000014>          docallvalue resw 10
  5899                                  section .text
  5900                                  
  5901                                  ;-566 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register
  5902                                  
  5903                                  section .bss
  5904                                  absolute -12085
  5905 FFFFD0CB <res 00000011>          procname resb 17
  5906                                  section .text
  5907                                  
  5908                                  ;-567 int docall1() {int i; int narg; int t0; int n0;  int sz32;
  5909                                  
  5910                                  
  5911                                  docall1:  ; *** PROC ***
  5912                                  
  5913                                  ;-568   narg=0;  sz32=0;
  5914                                  
  5915                                  ;Function : docall1, Number of local variables: 5
  5916                                  ;   # type sign width addr used name   list of local variables
  5917                                  ;  200 var sign word   567 NULL i = bp-2
  5918                                  ;  201 var sign word   567 NULL narg = bp-4
  5919                                  ;  202 var sign word   567 NULL t0 = bp-6
  5920                                  ;  203 var sign word   567 NULL n0 = bp-8
  5921                                  ;  204 var sign word   567 NULL sz32 = bp-10;
  5922 00002C2C C80A0000                 ENTER  10,0
  5923 00002C30 B80000                   mov ax, 0
  5924 00002C33 8946FC                   mov [bp-4], ax
  5925 00002C36 B80000                   mov ax, 0
  5926 00002C39 8946F6                   mov [bp-10], ax
  5927                                  
  5928                                  ;-569   checknamelen();
  5929                                  
  5930 00002C3C E863D7                   call checknamelen
  5931                                  
  5932                                  ;-570   strcpy(&procname, symbol);
  5933                                  
  5934 00002C3F 8D062B81                 lea  ax, [symbol]
  5935 00002C43 50                       push ax
  5936 00002C44 8D06CBD0                 lea  ax, [procname]
  5937 00002C48 50                       push ax
  5938 00002C49 E81AD5                   call strcpy
  5939 00002C4C 83C404                   add  sp, 4
  5940                                  
  5941                                  ;-571   storecall();
  5942                                  
  5943 00002C4F E8D9DE                   call storecall
  5944                                  
  5945                                  ;-572   expect('(');
  5946                                  
  5947 00002C52 6A28                     push 40
  5948 00002C54 E87F17                   call expect
  5949 00002C57 83C402                   add  sp, 2
  5950                                  
  5951                                  ;-573 	if (istoken(')') ==0 ) {
  5952                                  
  5953 00002C5A 6A29                     push 41
  5954 00002C5C E85517                   call istoken
  5955 00002C5F 83C402                   add  sp, 2
  5956 00002C62 83F800                   cmp ax, 0
  5957 00002C65 0F857802                 jne .docall1316
  5958                                  
  5959                                  ;-574 	  do { narg++;
  5960                                  
  5961                                  .docall1317:
  5962 00002C69 FF46FC                   inc  word[bp-4]
  5963                                  
  5964                                  ;-575 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;
  5965                                  
  5966 00002C6C 8B46FC                   mov ax, [bp-4]
  5967 00002C6F 83F809                   cmp ax, 9
  5968 00002C72 0F8E0900                 jle .docall1318
  5969 00002C76 68[252F]                 push docall1_0
  5970 00002C79 E8111B                   call error1
  5971 00002C7C 83C402                   add  sp, 2
  5972                                  .docall1318:
  5973 00002C7F B80000                   mov ax, 0
  5974 00002C82 8946FA                   mov [bp-6], ax
  5975                                  
  5976                                  ;-576       if(istoken(T_CONST)) {t0=1; n0=lexval; }
  5977                                  
  5978 00002C85 680101                   push 257
  5979 00002C88 E82917                   call istoken
  5980 00002C8B 83C402                   add  sp, 2
  5981 00002C8E 08C0                     or  al, al
  5982 00002C90 0F840C00                 je .docall1319
  5983 00002C94 B80100                   mov ax, 1
  5984 00002C97 8946FA                   mov [bp-6], ax
  5985 00002C9A A1[2E00]                 mov ax, [lexval]
  5986 00002C9D 8946F8                   mov [bp-8], ax
  5987                                  
  5988                                  ;-577       if(istoken(T_STRING)){t0=2; n0=nconst;
  5989                                  
  5990                                  .docall1319:
  5991 00002CA0 680201                   push 258
  5992 00002CA3 E80E17                   call istoken
  5993 00002CA6 83C402                   add  sp, 2
  5994 00002CA9 08C0                     or  al, al
  5995 00002CAB 0F846300                 je .docall1320
  5996 00002CAF B80200                   mov ax, 2
  5997 00002CB2 8946FA                   mov [bp-6], ax
  5998 00002CB5 A1[2400]                 mov ax, [nconst]
  5999 00002CB8 8946F8                   mov [bp-8], ax
  6000                                  
  6001                                  ;-578         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");
  6002                                  
  6003 00002CBB 68[372F]                 push docall1_1
  6004 00002CBE E89317                   call eprs
  6005 00002CC1 83C402                   add  sp, 2
  6006 00002CC4 8D06AB81                 lea  ax, [fname]
  6007 00002CC8 50                       push ax
  6008 00002CC9 E88817                   call eprs
  6009 00002CCC 83C402                   add  sp, 2
  6010 00002CCF 6A5F                     push 95
  6011 00002CD1 E86D17                   call eprc
  6012 00002CD4 83C402                   add  sp, 2
  6013 00002CD7 FF36[2400]               push word [nconst]
  6014 00002CDB E89F18                   call eprnum
  6015 00002CDE 83C402                   add  sp, 2
  6016 00002CE1 68[3A2F]                 push docall1_2
  6017 00002CE4 E86D17                   call eprs
  6018 00002CE7 83C402                   add  sp, 2
  6019                                  
  6020                                  ;-579         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }
  6021                                  
  6022 00002CEA 6A22                     push 34
  6023 00002CEC E85217                   call eprc
  6024 00002CEF 83C402                   add  sp, 2
  6025 00002CF2 8D062B81                 lea  ax, [symbol]
  6026 00002CF6 50                       push ax
  6027 00002CF7 E85A17                   call eprs
  6028 00002CFA 83C402                   add  sp, 2
  6029 00002CFD 6A22                     push 34
  6030 00002CFF E83F17                   call eprc
  6031 00002D02 83C402                   add  sp, 2
  6032 00002D05 68[3F2F]                 push docall1_3
  6033 00002D08 E84917                   call eprs
  6034 00002D0B 83C402                   add  sp, 2
  6035 00002D0E FF06[2400]               inc  word[nconst]
  6036                                  
  6037                                  ;-580       if(istoken('&'))     {t0=3; name1(); n0=searchname();}
  6038                                  
  6039                                  .docall1320:
  6040 00002D12 6A26                     push 38
  6041 00002D14 E89D16                   call istoken
  6042 00002D17 83C402                   add  sp, 2
  6043 00002D1A 08C0                     or  al, al
  6044 00002D1C 0F840F00                 je .docall1321
  6045 00002D20 B80300                   mov ax, 3
  6046 00002D23 8946FA                   mov [bp-6], ax
  6047 00002D26 E8DADD                   call name1
  6048 00002D29 E82FDC                   call searchname
  6049 00002D2C 8946F8                   mov [bp-8], ax
  6050                                  
  6051                                  ;-581       if(istoken(T_NAME))  { n0=checkreg();
  6052                                  
  6053                                  .docall1321:
  6054 00002D2F 680001                   push 256
  6055 00002D32 E87F16                   call istoken
  6056 00002D35 83C402                   add  sp, 2
  6057 00002D38 08C0                     or  al, al
  6058 00002D3A 0F844800                 je .docall1322
  6059 00002D3E E8DFEA                   call checkreg
  6060 00002D41 8946F8                   mov [bp-8], ax
  6061                                  
  6062                                  ;-582         if (n0) t0=5;
  6063                                  
  6064 00002D44 8B46F8                   mov ax, [bp-8]
  6065 00002D47 08C0                     or  al, al
  6066 00002D49 0F840900                 je .docall1323
  6067 00002D4D B80500                   mov ax, 5
  6068 00002D50 8946FA                   mov [bp-6], ax
  6069                                  
  6070                                  ;-583         else {t0=4; n0=searchname();
  6071                                  
  6072 00002D53 E93000                   jmp .docall1324
  6073                                  .docall1323:
  6074 00002D56 B80400                   mov ax, 4
  6075 00002D59 8946FA                   mov [bp-6], ax
  6076 00002D5C E8FCDB                   call searchname
  6077 00002D5F 8946F8                   mov [bp-8], ax
  6078                                  
  6079                                  ;-584           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }
  6080                                  
  6081 00002D62 B8B782                   mov ax, GType
  6082 00002D65 A3[6C00]                 mov word [p1], ax
  6083 00002D68 A1[6C00]                 mov ax, [p1]
  6084 00002D6B 0346F8                   add ax, [bp-8]
  6085 00002D6E A3[6C00]                 mov word [p1], ax
  6086 00002D71 8B1E[6C00]               mov bx, [p1]
  6087 00002D75 8A07                     mov al, [bx]
  6088 00002D77 B400                     mov ah, 0
  6089 00002D79 83F826                   cmp ax, 38
  6090 00002D7C 0F850600                 jne .docall1325
  6091 00002D80 B80300                   mov ax, 3
  6092 00002D83 8946FA                   mov [bp-6], ax
  6093                                  .docall1325:
  6094                                  .docall1324:
  6095                                  
  6096                                  ;-585       if (t0==0) error1("parameter not recognized (no * allowed)");
  6097                                  
  6098                                  .docall1322:
  6099 00002D86 8B46FA                   mov ax, [bp-6]
  6100 00002D89 83F800                   cmp ax, 0
  6101 00002D8C 0F850900                 jne .docall1326
  6102 00002D90 68[422F]                 push docall1_4
  6103 00002D93 E8F719                   call error1
  6104 00002D96 83C402                   add  sp, 2
  6105                                  
  6106                                  ;-586       docalltype [narg] = t0;
  6107                                  
  6108                                  .docall1326:
  6109 00002D99 8B46FA                   mov ax, [bp-6]
  6110 00002D9C 8B5EFC                   mov bx, [bp-4]
  6111 00002D9F D1E3                     shl bx, 1
  6112 00002DA1 8987A3D0                 mov [docalltype+bx], ax
  6113                                  
  6114                                  ;-587       docallvalue[narg] = n0;
  6115                                  
  6116 00002DA5 8B46F8                   mov ax, [bp-8]
  6117 00002DA8 8B5EFC                   mov bx, [bp-4]
  6118 00002DAB D1E3                     shl bx, 1
  6119 00002DAD 8987B7D0                 mov [docallvalue+bx], ax
  6120                                  
  6121                                  ;-588     } while (istoken(','));
  6122                                  
  6123 00002DB1 6A2C                     push 44
  6124 00002DB3 E8FE15                   call istoken
  6125 00002DB6 83C402                   add  sp, 2
  6126 00002DB9 08C0                     or  al, al
  6127 00002DBB 0F840300                 je .docall1327
  6128 00002DBF E9A7FE                   jmp .docall1317
  6129                                  .docall1327:
  6130                                  
  6131                                  ;-589     
  6132                                  
  6133                                  
  6134                                  ;-590   	expect(')');  i=narg;
  6135                                  
  6136 00002DC2 6A29                     push 41
  6137 00002DC4 E80F16                   call expect
  6138 00002DC7 83C402                   add  sp, 2
  6139 00002DCA 8B46FC                   mov ax, [bp-4]
  6140 00002DCD 8946FE                   mov [bp-2], ax
  6141                                  
  6142                                  ;-591     do {
  6143                                  
  6144                                  .docall1328:
  6145                                  
  6146                                  ;-592       t0 = docalltype [i];
  6147                                  
  6148 00002DD0 8B5EFE                   mov bx, [bp-2]
  6149 00002DD3 D1E3                     shl bx, 1
  6150 00002DD5 8B87A3D0                 mov ax, [docalltype + bx]
  6151 00002DD9 8946FA                   mov [bp-6], ax
  6152                                  
  6153                                  ;-593       n0 = docallvalue[i];     
  6154                                  
  6155 00002DDC 8B5EFE                   mov bx, [bp-2]
  6156 00002DDF D1E3                     shl bx, 1
  6157 00002DE1 8B87B7D0                 mov ax, [docallvalue + bx]
  6158 00002DE5 8946F8                   mov [bp-8], ax
  6159                                  
  6160                                  ;-594       if(t0==1){ prs("\n push "); pint1(n0);}
  6161                                  
  6162 00002DE8 8B46FA                   mov ax, [bp-6]
  6163 00002DEB 83F801                   cmp ax, 1
  6164 00002DEE 0F851200                 jne .docall1329
  6165 00002DF2 68[6A2F]                 push docall1_5
  6166 00002DF5 E8F116                   call prs
  6167 00002DF8 83C402                   add  sp, 2
  6168 00002DFB FF76F8                   push word [bp-8]
  6169 00002DFE E8DF17                   call pint1
  6170 00002E01 83C402                   add  sp, 2
  6171                                  
  6172                                  ;-595       if(t0==2){ prs("\n push "); 
  6173                                  
  6174                                  .docall1329:
  6175 00002E04 8B46FA                   mov ax, [bp-6]
  6176 00002E07 83F802                   cmp ax, 2
  6177 00002E0A 0F852500                 jne .docall1330
  6178 00002E0E 68[732F]                 push docall1_6
  6179 00002E11 E8D516                   call prs
  6180 00002E14 83C402                   add  sp, 2
  6181                                  
  6182                                  ;-596         prs(fname);prc(95);pint1(n0);}
  6183                                  
  6184 00002E17 8D06AB81                 lea  ax, [fname]
  6185 00002E1B 50                       push ax
  6186 00002E1C E8CA16                   call prs
  6187 00002E1F 83C402                   add  sp, 2
  6188 00002E22 6A5F                     push 95
  6189 00002E24 E85B16                   call prc
  6190 00002E27 83C402                   add  sp, 2
  6191 00002E2A FF76F8                   push word [bp-8]
  6192 00002E2D E8B017                   call pint1
  6193 00002E30 83C402                   add  sp, 2
  6194                                  
  6195                                  ;-597       if(t0==3){ prs("\n lea  ax, ");   v(n0);
  6196                                  
  6197                                  .docall1330:
  6198 00002E33 8B46FA                   mov ax, [bp-6]
  6199 00002E36 83F803                   cmp ax, 3
  6200 00002E39 0F851B00                 jne .docall1331
  6201 00002E3D 68[7C2F]                 push docall1_7
  6202 00002E40 E8A616                   call prs
  6203 00002E43 83C402                   add  sp, 2
  6204 00002E46 FF76F8                   push word [bp-8]
  6205 00002E49 E823D5                   call v
  6206 00002E4C 83C402                   add  sp, 2
  6207                                  
  6208                                  ;-598         prs("\n push ax");}
  6209                                  
  6210 00002E4F 68[892F]                 push docall1_8
  6211 00002E52 E89416                   call prs
  6212 00002E55 83C402                   add  sp, 2
  6213                                  
  6214                                  ;-599       if(t0==4){ gettypes(n0); 
  6215                                  
  6216                                  .docall1331:
  6217 00002E58 8B46FA                   mov ax, [bp-6]
  6218 00002E5B 83F804                   cmp ax, 4
  6219 00002E5E 0F854300                 jne .docall1332
  6220 00002E62 FF76F8                   push word [bp-8]
  6221 00002E65 E8B5D9                   call gettypes
  6222 00002E68 83C402                   add  sp, 2
  6223                                  
  6224                                  ;-600         if(wi==2) { prs("\n push word "); v(n0);}
  6225                                  
  6226 00002E6B A1[3900]                 mov ax, [wi]
  6227 00002E6E 83F802                   cmp ax, 2
  6228 00002E71 0F851500                 jne .docall1333
  6229 00002E75 68[942F]                 push docall1_9
  6230 00002E78 E86E16                   call prs
  6231 00002E7B 83C402                   add  sp, 2
  6232 00002E7E FF76F8                   push word [bp-8]
  6233 00002E81 E8EBD4                   call v
  6234 00002E84 83C402                   add  sp, 2
  6235                                  
  6236                                  ;-601         else { prs("\n mov al, byte ");   v(n0);
  6237                                  
  6238 00002E87 E91B00                   jmp .docall1334
  6239                                  .docall1333:
  6240 00002E8A 68[A22F]                 push docall1_10
  6241 00002E8D E85916                   call prs
  6242 00002E90 83C402                   add  sp, 2
  6243 00002E93 FF76F8                   push word [bp-8]
  6244 00002E96 E8D6D4                   call v
  6245 00002E99 83C402                   add  sp, 2
  6246                                  
  6247                                  ;-602         prs("\n mov ah, 0\n push ax"); } }
  6248                                  
  6249 00002E9C 68[B32F]                 push docall1_11
  6250 00002E9F E84716                   call prs
  6251 00002EA2 83C402                   add  sp, 2
  6252                                  .docall1334:
  6253                                  
  6254                                  ;-603       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }
  6255                                  
  6256                                  .docall1332:
  6257 00002EA5 8B46FA                   mov ax, [bp-6]
  6258 00002EA8 83F805                   cmp ax, 5
  6259 00002EAB 0F852200                 jne .docall1335
  6260 00002EAF 68[CA2F]                 push docall1_12
  6261 00002EB2 E83416                   call prs
  6262 00002EB5 83C402                   add  sp, 2
  6263 00002EB8 FF76F8                   push word [bp-8]
  6264 00002EBB E870ED                   call printreg
  6265 00002EBE 83C402                   add  sp, 2
  6266 00002EC1 8B46F8                   mov ax, [bp-8]
  6267 00002EC4 83F82F                   cmp ax, 47 ;unsigned : 1
  6268 00002EC7 0F8C0600                 jl  .docall1336
  6269 00002ECB 8B46F6                   mov ax, [bp-10]
  6270 00002ECE 83C002                   add ax, 2
  6271                                  .docall1336:
  6272                                  
  6273                                  ;-604    i--; } while (i > 0);  }
  6274                                  
  6275                                  .docall1335:
  6276 00002ED1 FF4EFE                   dec  word[bp-2]
  6277 00002ED4 8B46FE                   mov ax, [bp-2]
  6278 00002ED7 83F800                   cmp ax, 0
  6279 00002EDA 0F8E0300                 jle .docall1337
  6280 00002EDE E9EFFE                   jmp .docall1328
  6281                                  .docall1337:
  6282                                  
  6283                                  ;-605 	 prs("\n call "); prs(&procname);
  6284                                  
  6285                                  .docall1316:
  6286 00002EE1 68[D32F]                 push docall1_13
  6287 00002EE4 E80216                   call prs
  6288 00002EE7 83C402                   add  sp, 2
  6289 00002EEA 8D06CBD0                 lea  ax, [procname]
  6290 00002EEE 50                       push ax
  6291 00002EEF E8F715                   call prs
  6292 00002EF2 83C402                   add  sp, 2
  6293                                  
  6294                                  ;-606 	 if (narg>0) {prs("\n add  sp, ");
  6295                                  
  6296 00002EF5 8B46FC                   mov ax, [bp-4]
  6297 00002EF8 83F800                   cmp ax, 0
  6298 00002EFB 0F8E2400                 jle .docall1338
  6299 00002EFF 68[DC2F]                 push docall1_14
  6300 00002F02 E8E415                   call prs
  6301 00002F05 83C402                   add  sp, 2
  6302                                  
  6303                                  ;-607      narg=narg+narg; narg=narg+sz32; pint1(narg); } }
  6304                                  
  6305 00002F08 8B46FC                   mov ax, [bp-4]
  6306 00002F0B 0346FC                   add ax, [bp-4]
  6307 00002F0E 8946FC                   mov [bp-4], ax
  6308 00002F11 8B46FC                   mov ax, [bp-4]
  6309 00002F14 0346F6                   add ax, [bp-10]
  6310 00002F17 8946FC                   mov [bp-4], ax
  6311 00002F1A FF76FC                   push word [bp-4]
  6312 00002F1D E8C016                   call pint1
  6313 00002F20 83C402                   add  sp, 2
  6314                                  .docall1338:
  6315                                  
  6316                                  ;-608 /****************************************************************************/
  6317                                  
  6318                                  
  6319                                  ;-609 int main() {
  6320 00002F23 C9                       LEAVE
  6321 00002F24 C3                       ret
  6322 00002F25 4D61782E2039207061-     docall1_0 db "Max. 9 parameters",0
  6323 00002F2E 72616D657465727300 
  6324 00002F37 5C6E00                  docall1_1 db "\n",0
  6325 00002F3A 2064622000              docall1_2 db " db ",0
  6326 00002F3F 2C3000                  docall1_3 db ",0",0
  6327 00002F42 706172616D65746572-     docall1_4 db "parameter not recognized (no * allowed)",0
  6328 00002F4B 206E6F74207265636F-
  6329 00002F54 676E697A656420286E-
  6330 00002F5D 6F202A20616C6C6F77-
  6331 00002F66 65642900           
  6332 00002F6A 5C6E20707573682000      docall1_5 db "\n push ",0
  6333 00002F73 5C6E20707573682000      docall1_6 db "\n push ",0
  6334 00002F7C 5C6E206C6561202061-     docall1_7 db "\n lea  ax, ",0
  6335 00002F85 782C2000           
  6336 00002F89 5C6E20707573682061-     docall1_8 db "\n push ax",0
  6337 00002F92 7800               
  6338 00002F94 5C6E20707573682077-     docall1_9 db "\n push word ",0
  6339 00002F9D 6F72642000         
  6340 00002FA2 5C6E206D6F7620616C-     docall1_10 db "\n mov al, byte ",0
  6341 00002FAB 2C20627974652000   
  6342 00002FB3 5C6E206D6F76206168-     docall1_11 db "\n mov ah, 0\n push ax",0
  6343 00002FBC 2C20305C6E20707573-
  6344 00002FC5 6820617800         
  6345 00002FCA 5C6E20707573682000      docall1_12 db "\n push ",0
  6346 00002FD3 5C6E2063616C6C2000      docall1_13 db "\n call ",0
  6347 00002FDC 5C6E20616464202073-     docall1_14 db "\n add  sp, ",0
  6348 00002FE5 702C2000           
  6349                                  ; ENDP
  6350                                  
  6351                                  main:  ; *** PROC ***
  6352                                  
  6353                                  ;-610   getarg();
  6354                                  
  6355 00002FE9 E88700                   call getarg
  6356                                  
  6357                                  ;-611   setblock(4096);
  6358                                  
  6359 00002FEC 680010                   push 4096
  6360 00002FEF E89022                   call setblock
  6361 00002FF2 83C402                   add  sp, 2
  6362                                  
  6363                                  ;-612   if (DOS_ERR) error1("SetBlock , AX=");
  6364                                  
  6365 00002FF5 A1[6E00]                 mov ax, [DOS_ERR]
  6366 00002FF8 08C0                     or  al, al
  6367 00002FFA 0F840900                 je .main339
  6368 00002FFE 68[3830]                 push main_0
  6369 00003001 E88917                   call error1
  6370 00003004 83C402                   add  sp, 2
  6371                                  
  6372                                  ;-613   segE=allocmem(4096);
  6373                                  
  6374                                  .main339:
  6375 00003007 680010                   push 4096
  6376 0000300A E88E22                   call allocmem
  6377 0000300D 83C402                   add  sp, 2
  6378 00003010 A3[6400]                 mov word [segE], ax
  6379                                  
  6380                                  ;-614   if (DOS_ERR)  error1("alloc memory, AX=");
  6381                                  
  6382 00003013 A1[6E00]                 mov ax, [DOS_ERR]
  6383 00003016 08C0                     or  al, al
  6384 00003018 0F840900                 je .main340
  6385 0000301C 68[4730]                 push main_1
  6386 0000301F E86B17                   call error1
  6387 00003022 83C402                   add  sp, 2
  6388                                  
  6389                                  ;-615   CNameTop=0;
  6390                                  
  6391                                  .main340:
  6392 00003025 B80000                   mov ax, 0
  6393 00003028 A3[6000]                 mov word [CNameTop], ax
  6394                                  
  6395                                  ;-616   getfirstchar();
  6396                                  
  6397 0000302B E82B00                   call getfirstchar
  6398                                  
  6399                                  ;-617   parse();
  6400                                  
  6401 0000302E E84B02                   call parse
  6402                                  
  6403                                  ;-618   checkcalls(); epilog();
  6404                                  
  6405 00003031 E8DF02                   call checkcalls
  6406 00003034 E8311E                   call epilog
  6407                                  
  6408                                  ;-619 }
  6409                                  
  6410                                  
  6411                                  ;-620 int getfirstchar() { fgetsp=&fgetsdest; *fgetsp=0; thechar=fgets1(); }
  6412                                  
  6413 00003037 C3                       ret
  6414 00003038 536574426C6F636B20-     main_0 db "SetBlock , AX=",0
  6415 00003041 2C2041583D00       
  6416 00003047 616C6C6F63206D656D-     main_1 db "alloc memory, AX=",0
  6417 00003050 6F72792C2041583D00 
  6418                                  ; ENDP
  6419                                  
  6420                                  getfirstchar:  ; *** PROC ***
  6421 00003059 B80FD0                   mov ax, fgetsdest
  6422 0000305C A3[6200]                 mov word [fgetsp], ax
  6423 0000305F B80000                   mov ax, 0
  6424 00003062 8B1E[6200]               mov  bx, [fgetsp]
  6425 00003066 8807                     mov  [bx], al
  6426 00003068 E82A16                   call fgets1
  6427 0000306B A2[2100]                 mov byte [thechar], al
  6428                                  
  6429                                  ;-621 char *arglen=0x80; char *argv=0x82;
  6430                                  
  6431 0000306E C3                       ret
  6432                                  ; ENDP
  6433 0000306F 8000                    arglen dw 128
  6434 00003071 8200                    argv dw 130
  6435                                  
  6436                                  ;-622 int getarg() { int arglen1; int i; char *c;
  6437                                  
  6438                                  
  6439                                  getarg:  ; *** PROC ***
  6440                                  
  6441                                  ;-623   arglen1=*arglen;
  6442                                  
  6443                                  ;Function : getarg, Number of local variables: 3
  6444                                  ;   # type sign width addr used name   list of local variables
  6445                                  ;  200 var sign word   622 NULL arglen1 = bp-2
  6446                                  ;  201 var sign word   622 NULL i = bp-4
  6447                                  ;  202 ptr sign byte   622 NULL c = bp-6;
  6448 00003073 C8060000                 ENTER  6,0
  6449 00003077 8B1E[6F30]               mov bx, [arglen]
  6450 0000307B 8A07                     mov al, [bx]
  6451 0000307D B400                     mov ah, 0
  6452 0000307F 8946FE                   mov [bp-2], ax
  6453                                  
  6454                                  ;-624   if (arglen1) { i=arglen1+129; *i=0; }
  6455                                  
  6456 00003082 8B46FE                   mov ax, [bp-2]
  6457 00003085 08C0                     or  al, al
  6458 00003087 0F841400                 je .getarg341
  6459 0000308B 8B46FE                   mov ax, [bp-2]
  6460 0000308E 058100                   add ax, 129
  6461 00003091 8946FC                   mov [bp-4], ax
  6462 00003094 B80000                   mov ax, 0
  6463 00003097 8B5EFC                   mov  bx, [bp-4]
  6464 0000309A 8907                     mov  [bx], ax
  6465                                  
  6466                                  ;-625   else { cputs(Version1); cputs(" Usage: A.COM in_file[.C]: ");
  6467                                  
  6468 0000309C E93900                   jmp .getarg342
  6469                                  .getarg341:
  6470 0000309F 8D06[0300]               lea  ax, [Version1]
  6471 000030A3 50                       push ax
  6472 000030A4 E8EDCF                   call cputs
  6473 000030A7 83C402                   add  sp, 2
  6474 000030AA 68[F331]                 push getarg_0
  6475 000030AD E8E4CF                   call cputs
  6476 000030B0 83C402                   add  sp, 2
  6477                                  
  6478                                  ;-626     DOS_NoBytes=readRL(argv, 0, CMDLENMAX); c=DOS_NoBytes+128; *c=0; prnl(); }
  6479                                  
  6480 000030B3 6A43                     push 67
  6481 000030B5 6A00                     push 0
  6482 000030B7 FF36[7130]               push word [argv]
  6483 000030BB E856D0                   call readRL
  6484 000030BE 83C406                   add  sp, 6
  6485 000030C1 A3[7000]                 mov word [DOS_NoBytes], ax
  6486 000030C4 A1[7000]                 mov ax, [DOS_NoBytes]
  6487 000030C7 058000                   add ax, 128
  6488 000030CA 8946FA                   mov [bp-6], ax
  6489 000030CD B80000                   mov ax, 0
  6490 000030D0 8B5EFA                   mov  bx, [bp-6]
  6491 000030D3 8807                     mov  [bx], al
  6492 000030D5 E80314                   call prnl
  6493                                  
  6494                                  ;-627   strcpy(namein, argv);
  6495                                  
  6496                                  .getarg342:
  6497 000030D8 FF36[7130]               push word [argv]
  6498 000030DC 8D06EE81                 lea  ax, [namein]
  6499 000030E0 50                       push ax
  6500 000030E1 E882D0                   call strcpy
  6501 000030E4 83C404                   add  sp, 4
  6502                                  
  6503                                  ;-628   if (instr1(namein, '.') == 0) strcat1(namein, ".C");
  6504                                  
  6505 000030E7 6A2E                     push 46
  6506 000030E9 8D06EE81                 lea  ax, [namein]
  6507 000030ED 50                       push ax
  6508 000030EE E8F1D0                   call instr1
  6509 000030F1 83C404                   add  sp, 4
  6510 000030F4 83F800                   cmp ax, 0
  6511 000030F7 0F850E00                 jne .getarg343
  6512 000030FB 68[0F32]                 push getarg_1
  6513 000030FE 8D06EE81                 lea  ax, [namein]
  6514 00003102 50                       push ax
  6515 00003103 E80ED1                   call strcat1
  6516 00003106 83C404                   add  sp, 4
  6517                                  
  6518                                  ;-629   toupper(namein);
  6519                                  
  6520                                  .getarg343:
  6521 00003109 8D06EE81                 lea  ax, [namein]
  6522 0000310D 50                       push ax
  6523 0000310E E828D1                   call toupper
  6524 00003111 83C402                   add  sp, 2
  6525                                  
  6526                                  ;-630   strcpy(namelst, namein); i=strlen(namelst); i--; c=&namelst+i; *c='S';
  6527                                  
  6528 00003114 8D06EE81                 lea  ax, [namein]
  6529 00003118 50                       push ax
  6530 00003119 8D063182                 lea  ax, [namelst]
  6531 0000311D 50                       push ax
  6532 0000311E E845D0                   call strcpy
  6533 00003121 83C404                   add  sp, 4
  6534 00003124 8D063182                 lea  ax, [namelst]
  6535 00003128 50                       push ax
  6536 00003129 E812D0                   call strlen
  6537 0000312C 83C402                   add  sp, 2
  6538 0000312F 8946FC                   mov [bp-4], ax
  6539 00003132 FF4EFC                   dec  word[bp-4]
  6540 00003135 B83182                   mov ax, namelst
  6541 00003138 0346FC                   add ax, [bp-4]
  6542 0000313B 8946FA                   mov [bp-6], ax
  6543 0000313E B85300                   mov ax, 83
  6544 00003141 8B5EFA                   mov  bx, [bp-6]
  6545 00003144 8807                     mov  [bx], al
  6546                                  
  6547                                  ;-631  
  6548                                  
  6549                                  
  6550                                  ;-632   fdin=openR (namein);
  6551                                  
  6552 00003146 8D06EE81                 lea  ax, [namein]
  6553 0000314A 50                       push ax
  6554 0000314B E888CF                   call openR
  6555 0000314E 83C402                   add  sp, 2
  6556 00003151 A3[1800]                 mov word [fdin], ax
  6557                                  
  6558                                  ;-633   if(DOS_ERR){cputs("Source file missing (.C): "); cputs(namein); exitR(1); }
  6559                                  
  6560 00003154 A1[6E00]                 mov ax, [DOS_ERR]
  6561 00003157 08C0                     or  al, al
  6562 00003159 0F841C00                 je .getarg344
  6563 0000315D 68[1232]                 push getarg_2
  6564 00003160 E831CF                   call cputs
  6565 00003163 83C402                   add  sp, 2
  6566 00003166 8D06EE81                 lea  ax, [namein]
  6567 0000316A 50                       push ax
  6568 0000316B E826CF                   call cputs
  6569 0000316E 83C402                   add  sp, 2
  6570 00003171 6A01                     push 1
  6571 00003173 E890CF                   call exitR
  6572 00003176 83C402                   add  sp, 2
  6573                                  
  6574                                  ;-634   fdout=creatR(namelst);
  6575                                  
  6576                                  .getarg344:
  6577 00003179 8D063182                 lea  ax, [namelst]
  6578 0000317D 50                       push ax
  6579 0000317E E864CF                   call creatR
  6580 00003181 83C402                   add  sp, 2
  6581 00003184 A3[1A00]                 mov word [fdout], ax
  6582                                  
  6583                                  ;-635   if(DOS_ERR){cputs("list file not creatable: ");cputs(namelst);exitR(2);}
  6584                                  
  6585 00003187 A1[6E00]                 mov ax, [DOS_ERR]
  6586 0000318A 08C0                     or  al, al
  6587 0000318C 0F841C00                 je .getarg345
  6588 00003190 68[2D32]                 push getarg_3
  6589 00003193 E8FECE                   call cputs
  6590 00003196 83C402                   add  sp, 2
  6591 00003199 8D063182                 lea  ax, [namelst]
  6592 0000319D 50                       push ax
  6593 0000319E E8F3CE                   call cputs
  6594 000031A1 83C402                   add  sp, 2
  6595 000031A4 6A02                     push 2
  6596 000031A6 E85DCF                   call exitR
  6597 000031A9 83C402                   add  sp, 2
  6598                                  
  6599                                  ;-636   prs("\n; ");prs(Version1);
  6600                                  
  6601                                  .getarg345:
  6602 000031AC 68[4732]                 push getarg_4
  6603 000031AF E83713                   call prs
  6604 000031B2 83C402                   add  sp, 2
  6605 000031B5 8D06[0300]               lea  ax, [Version1]
  6606 000031B9 50                       push ax
  6607 000031BA E82C13                   call prs
  6608 000031BD 83C402                   add  sp, 2
  6609                                  
  6610                                  ;-637   prs(", Source: "); prs(namein);  prs(", Output asm: "); prs(namelst);
  6611                                  
  6612 000031C0 68[4C32]                 push getarg_5
  6613 000031C3 E82313                   call prs
  6614 000031C6 83C402                   add  sp, 2
  6615 000031C9 8D06EE81                 lea  ax, [namein]
  6616 000031CD 50                       push ax
  6617 000031CE E81813                   call prs
  6618 000031D1 83C402                   add  sp, 2
  6619 000031D4 68[5732]                 push getarg_6
  6620 000031D7 E80F13                   call prs
  6621 000031DA 83C402                   add  sp, 2
  6622 000031DD 8D063182                 lea  ax, [namelst]
  6623 000031E1 50                       push ax
  6624 000031E2 E80413                   call prs
  6625 000031E5 83C402                   add  sp, 2
  6626                                  
  6627                                  ;-638   prs("\norg  256 \njmp main"); 
  6628                                  
  6629 000031E8 68[6632]                 push getarg_7
  6630 000031EB E8FB12                   call prs
  6631 000031EE 83C402                   add  sp, 2
  6632                                  
  6633                                  ;-639 }
  6634                                  
  6635                                  
  6636                                  ;-640 int parse() { token=getlex(); do {
  6637 000031F1 C9                       LEAVE
  6638 000031F2 C3                       ret
  6639 000031F3 2055736167653A2041-     getarg_0 db " Usage: A.COM in_file[.C]: ",0
  6640 000031FC 2E434F4D20696E5F66-
  6641 00003205 696C655B2E435D3A20-
  6642 0000320E 00                 
  6643 0000320F 2E4300                  getarg_1 db ".C",0
  6644 00003212 536F75726365206669-     getarg_2 db "Source file missing (.C): ",0
  6645 0000321B 6C65206D697373696E-
  6646 00003224 6720282E43293A2000 
  6647 0000322D 6C6973742066696C65-     getarg_3 db "list file not creatable: ",0
  6648 00003236 206E6F742063726561-
  6649 0000323F 7461626C653A2000   
  6650 00003247 5C6E3B2000              getarg_4 db "\n; ",0
  6651 0000324C 2C20536F757263653A-     getarg_5 db ", Source: ",0
  6652 00003255 2000               
  6653 00003257 2C204F757470757420-     getarg_6 db ", Output asm: ",0
  6654 00003260 61736D3A2000       
  6655 00003266 5C6E6F726720203235-     getarg_7 db "\norg  256 \njmp main",0
  6656 0000326F 36205C6E6A6D70206D-
  6657 00003278 61696E00           
  6658                                  ; ENDP
  6659                                  
  6660                                  parse:  ; *** PROC ***
  6661 0000327C E8110A                   call getlex
  6662 0000327F A3[1C00]                 mov word [token], ax
  6663                                  .parse346:
  6664                                  
  6665                                  ;-641     if (token <= 0) return 1;
  6666                                  
  6667 00003282 A1[1C00]                 mov ax, [token]
  6668 00003285 83F800                   cmp ax, 0
  6669 00003288 0F8F0600                 jg  .parse347
  6670 0000328C B80100                   mov ax, 1
  6671 0000328F E96500                   jmp .retnparse
  6672                                  
  6673                                  ;-642     if (istoken('#')) {
  6674                                  
  6675                                  .parse347:
  6676 00003292 6A23                     push 35
  6677 00003294 E81D11                   call istoken
  6678 00003297 83C402                   add  sp, 2
  6679 0000329A 08C0                     or  al, al
  6680 0000329C 0F843600                 je .parse348
  6681                                  
  6682                                  ;-643       if (istoken(T_DEFINE)) dodefine();
  6683                                  
  6684 000032A0 68FF01                   push 511
  6685 000032A3 E80E11                   call istoken
  6686 000032A6 83C402                   add  sp, 2
  6687 000032A9 08C0                     or  al, al
  6688 000032AB 0F840600                 je .parse349
  6689 000032AF E8A702                   call dodefine
  6690                                  
  6691                                  ;-644       else if (istoken(T_INCLUDE)) doinclude();
  6692                                  
  6693 000032B2 E91E00                   jmp .parse350
  6694                                  .parse349:
  6695 000032B5 68FE01                   push 510
  6696 000032B8 E8F910                   call istoken
  6697 000032BB 83C402                   add  sp, 2
  6698 000032BE 08C0                     or  al, al
  6699 000032C0 0F840600                 je .parse351
  6700 000032C4 E8AC01                   call doinclude
  6701                                  
  6702                                  ;-645       else error1("define or include expected");  }
  6703                                  
  6704 000032C7 E90900                   jmp .parse352
  6705                                  .parse351:
  6706 000032CA 68[F832]                 push parse_0
  6707 000032CD E8BD14                   call error1
  6708 000032D0 83C402                   add  sp, 2
  6709                                  .parse352:
  6710                                  .parse350:
  6711                                  
  6712                                  ;-646     else{ typeName();  if (token=='(') dofunc();  else doglob(); }
  6713                                  
  6714 000032D3 E91600                   jmp .parse353
  6715                                  .parse348:
  6716 000032D6 E851D7                   call typeName
  6717 000032D9 A1[1C00]                 mov ax, [token]
  6718 000032DC 83F828                   cmp ax, 40
  6719 000032DF 0F850600                 jne .parse354
  6720 000032E3 E858DA                   call dofunc
  6721 000032E6 E90300                   jmp .parse355
  6722                                  .parse354:
  6723 000032E9 E802D1                   call doglob
  6724                                  .parse355:
  6725                                  
  6726                                  ;-647   } while(1);
  6727                                  
  6728                                  .parse353:
  6729 000032EC B80100                   mov ax, 1
  6730 000032EF 08C0                     or  al, al
  6731 000032F1 0F840200                 je .parse356
  6732 000032F5 EB8B                     jmp .parse346
  6733                                  .parse356:
  6734                                  
  6735                                  ;-648 }
  6736                                  
  6737                                  
  6738                                  ;-649 int checkcalls() { int i; int j; int k;
  6739                                  
  6740                                   .retnparse:
  6741 000032F7 C3                       ret
  6742 000032F8 646566696E65206F72-     parse_0 db "define or include expected",0
  6743 00003301 20696E636C75646520-
  6744 0000330A 657870656374656400 
  6745                                  ; ENDP
  6746                                  
  6747                                  checkcalls:  ; *** PROC ***
  6748                                  
  6749                                  ;-650   prs("\n \n; missing functions: ");
  6750                                  
  6751                                  ;Function : checkcalls, Number of local variables: 3
  6752                                  ;   # type sign width addr used name   list of local variables
  6753                                  ;  200 var sign word   649 NULL i = bp-2
  6754                                  ;  201 var sign word   649 NULL j = bp-4
  6755                                  ;  202 var sign word   649 NULL k = bp-6;
  6756 00003313 C8060000                 ENTER  6,0
  6757 00003317 68[F933]                 push checkcalls_0
  6758 0000331A E8CC11                   call prs
  6759 0000331D 83C402                   add  sp, 2
  6760                                  
  6761                                  ;-651   i=0;  k=0;
  6762                                  
  6763 00003320 B80000                   mov ax, 0
  6764 00003323 8946FE                   mov [bp-2], ax
  6765 00003326 B80000                   mov ax, 0
  6766 00003329 8946FA                   mov [bp-6], ax
  6767                                  
  6768                                  ;-652   while (i < CTop) {
  6769                                  
  6770                                  .checkcalls357:
  6771 0000332C 8B46FE                   mov ax, [bp-2]
  6772 0000332F 3B06[3D00]               cmp ax, [CTop]
  6773 00003333 0F8D8F00                 jge .checkcalls358
  6774                                  
  6775                                  ;-653     pt=CAdr[i];
  6776                                  
  6777 00003337 8B5EFE                   mov bx, [bp-2]
  6778 0000333A D1E3                     shl bx, 1
  6779 0000333C 8B8757AB                 mov ax, [CAdr + bx]
  6780 00003340 A3[6A00]                 mov word [pt], ax
  6781                                  
  6782                                  ;-654     from_far(NameA, pt);
  6783                                  
  6784 00003343 FF36[6A00]               push word [pt]
  6785 00003347 8D06[3F00]               lea  ax, [NameA]
  6786 0000334B 50                       push ax
  6787 0000334C E8B31F                   call from_far
  6788 0000334F 83C404                   add  sp, 4
  6789                                  
  6790                                  ;-655     j=0;
  6791                                  
  6792 00003352 B80000                   mov ax, 0
  6793 00003355 8946FC                   mov [bp-4], ax
  6794                                  
  6795                                  ;-656     do { p1=adrF(FNameField, j);
  6796                                  
  6797                                  .checkcalls359:
  6798 00003358 FF76FC                   push word [bp-4]
  6799 0000335B 8D064FBD                 lea  ax, [FNameField]
  6800 0000335F 50                       push ax
  6801 00003360 E885D5                   call adrF
  6802 00003363 83C404                   add  sp, 4
  6803 00003366 A3[6C00]                 mov word [p1], ax
  6804                                  
  6805                                  ;-657       if (eqstr(NameA, p1)){ CType[i]=1; j=FTop; }
  6806                                  
  6807 00003369 FF36[6C00]               push word [p1]
  6808 0000336D 8D06[3F00]               lea  ax, [NameA]
  6809 00003371 50                       push ax
  6810 00003372 E821CE                   call eqstr
  6811 00003375 83C404                   add  sp, 4
  6812 00003378 08C0                     or  al, al
  6813 0000337A 0F841000                 je .checkcalls360
  6814 0000337E B80100                   mov ax, 1
  6815 00003381 8B5EFE                   mov bx, [bp-2]
  6816 00003384 88872FA1                 mov [CType+bx], al
  6817 00003388 A1[3B00]                 mov ax, [FTop]
  6818 0000338B 8946FC                   mov [bp-4], ax
  6819                                  
  6820                                  ;-658       j++; } while (j < FTop);
  6821                                  
  6822                                  .checkcalls360:
  6823 0000338E FF46FC                   inc  word[bp-4]
  6824 00003391 8B46FC                   mov ax, [bp-4]
  6825 00003394 3B06[3B00]               cmp ax, [FTop]
  6826 00003398 0F8D0200                 jge .checkcalls361
  6827 0000339C EBBA                     jmp .checkcalls359
  6828                                  .checkcalls361:
  6829                                  
  6830                                  ;-659     if (j == FTop) { k++; prs("\n; "); prs(NameA); }
  6831                                  
  6832 0000339E 8B46FC                   mov ax, [bp-4]
  6833 000033A1 3B06[3B00]               cmp ax, [FTop]
  6834 000033A5 0F851700                 jne .checkcalls362
  6835 000033A9 FF46FA                   inc  word[bp-6]
  6836 000033AC 68[1434]                 push checkcalls_1
  6837 000033AF E83711                   call prs
  6838 000033B2 83C402                   add  sp, 2
  6839 000033B5 8D06[3F00]               lea  ax, [NameA]
  6840 000033B9 50                       push ax
  6841 000033BA E82C11                   call prs
  6842 000033BD 83C402                   add  sp, 2
  6843                                  
  6844                                  ;-660     i++; }
  6845                                  
  6846                                  .checkcalls362:
  6847 000033C0 FF46FE                   inc  word[bp-2]
  6848                                  
  6849                                  ;-661   prs("\n; Number of unresolved CALLs :"); printint51(k);
  6850                                  
  6851 000033C3 E966FF                   jmp .checkcalls357
  6852                                  .checkcalls358:
  6853 000033C6 68[1934]                 push checkcalls_2
  6854 000033C9 E81D11                   call prs
  6855 000033CC 83C402                   add  sp, 2
  6856 000033CF FF76FA                   push word [bp-6]
  6857 000033D2 E86912                   call printint51
  6858 000033D5 83C402                   add  sp, 2
  6859                                  
  6860                                  ;-662   if (k!=0) error1("At least 1 function is missing! "); 
  6861                                  
  6862 000033D8 8B46FA                   mov ax, [bp-6]
  6863 000033DB 83F800                   cmp ax, 0
  6864 000033DE 0F840C00                 je  .checkcalls363
  6865 000033E2 68[3A34]                 push checkcalls_3
  6866 000033E5 E8A513                   call error1
  6867 000033E8 83C402                   add  sp, 2
  6868                                  
  6869                                  ;-663     else prs(" All FUNCTIONs in place");
  6870                                  
  6871 000033EB E90900                   jmp .checkcalls364
  6872                                  .checkcalls363:
  6873 000033EE 68[5B34]                 push checkcalls_4
  6874 000033F1 E8F510                   call prs
  6875 000033F4 83C402                   add  sp, 2
  6876                                  
  6877                                  ;-664 }
  6878                                  
  6879                                  .checkcalls364:
  6880                                  
  6881                                  ;-665 
  6882                                  
  6883                                  
  6884                                  ;-666 int doinclude() { int fdtemp;
  6885 000033F7 C9                       LEAVE
  6886 000033F8 C3                       ret
  6887 000033F9 5C6E205C6E3B206D69-     checkcalls_0 db "\n \n; missing functions: ",0
  6888 00003402 7373696E672066756E-
  6889 0000340B 6374696F6E733A2000 
  6890 00003414 5C6E3B2000              checkcalls_1 db "\n; ",0
  6891 00003419 5C6E3B204E756D6265-     checkcalls_2 db "\n; Number of unresolved CALLs :",0
  6892 00003422 72206F6620756E7265-
  6893 0000342B 736F6C766564204341-
  6894 00003434 4C4C73203A00       
  6895 0000343A 4174206C6561737420-     checkcalls_3 db "At least 1 function is missing! ",0
  6896 00003443 312066756E6374696F-
  6897 0000344C 6E206973206D697373-
  6898 00003455 696E67212000       
  6899 0000345B 20416C6C2046554E43-     checkcalls_4 db " All FUNCTIONs in place",0
  6900 00003464 54494F4E7320696E20-
  6901 0000346D 706C61636500       
  6902                                  ; ENDP
  6903                                  
  6904                                  doinclude:  ; *** PROC ***
  6905                                  
  6906                                  ;-667   if (token==T_STRING) {  fdtemp=fdin;
  6907                                  
  6908                                  ;Function : doinclude, Number of local variables: 1
  6909                                  ;   # type sign width addr used name   list of local variables
  6910                                  ;  200 var sign word   666 NULL fdtemp = bp-2;
  6911 00003473 C8020000                 ENTER  2,0
  6912 00003477 A1[1C00]                 mov ax, [token]
  6913 0000347A 3D0201                   cmp ax, 258
  6914 0000347D 0F858700                 jne .doinclude365
  6915 00003481 A1[1800]                 mov ax, [fdin]
  6916 00003484 8946FE                   mov [bp-2], ax
  6917                                  
  6918                                  ;-668   prs("\n;Use include file: "); prs(symbol);
  6919                                  
  6920 00003487 68[0A35]                 push doinclude_0
  6921 0000348A E85C10                   call prs
  6922 0000348D 83C402                   add  sp, 2
  6923 00003490 8D062B81                 lea  ax, [symbol]
  6924 00003494 50                       push ax
  6925 00003495 E85110                   call prs
  6926 00003498 83C402                   add  sp, 2
  6927                                  
  6928                                  ;-669   fdin=openR(symbol);
  6929                                  
  6930 0000349B 8D062B81                 lea  ax, [symbol]
  6931 0000349F 50                       push ax
  6932 000034A0 E833CC                   call openR
  6933 000034A3 83C402                   add  sp, 2
  6934 000034A6 A3[1800]                 mov word [fdin], ax
  6935                                  
  6936                                  ;-670   if (DOS_ERR !=0) {prs("Include file missing: "); prs(symbol);
  6937                                  
  6938 000034A9 A1[6E00]                 mov ax, [DOS_ERR]
  6939 000034AC 83F800                   cmp ax, 0
  6940 000034AF 0F841D00                 je  .doinclude366
  6941 000034B3 68[2035]                 push doinclude_1
  6942 000034B6 E83010                   call prs
  6943 000034B9 83C402                   add  sp, 2
  6944 000034BC 8D062B81                 lea  ax, [symbol]
  6945 000034C0 50                       push ax
  6946 000034C1 E82510                   call prs
  6947 000034C4 83C402                   add  sp, 2
  6948                                  
  6949                                  ;-671     error1(" Stop!!"); }
  6950                                  
  6951 000034C7 68[3735]                 push doinclude_2
  6952 000034CA E8C012                   call error1
  6953 000034CD 83C402                   add  sp, 2
  6954                                  
  6955                                  ;-672   linenoinclude=lineno; lineno=1;
  6956                                  
  6957                                  .doinclude366:
  6958 000034D0 A1[6600]                 mov ax, [lineno]
  6959 000034D3 A3[6800]                 mov word [linenoinclude], ax
  6960 000034D6 B80100                   mov ax, 1
  6961 000034D9 A3[6600]                 mov word [lineno], ax
  6962                                  
  6963                                  ;-673   parse(); lineno=linenoinclude;
  6964                                  
  6965 000034DC E89DFD                   call parse
  6966 000034DF A1[6800]                 mov ax, [linenoinclude]
  6967 000034E2 A3[6600]                 mov word [lineno], ax
  6968                                  
  6969                                  ;-674   fdin=fdtemp; prs("\n;Back to main program: "); prs(namein);
  6970                                  
  6971 000034E5 8B46FE                   mov ax, [bp-2]
  6972 000034E8 A3[1800]                 mov word [fdin], ax
  6973 000034EB 68[3F35]                 push doinclude_3
  6974 000034EE E8F80F                   call prs
  6975 000034F1 83C402                   add  sp, 2
  6976 000034F4 8D06EE81                 lea  ax, [namein]
  6977 000034F8 50                       push ax
  6978 000034F9 E8ED0F                   call prs
  6979 000034FC 83C402                   add  sp, 2
  6980                                  
  6981                                  ;-675   getfirstchar(); token=getlex(); }
  6982                                  
  6983 000034FF E857FB                   call getfirstchar
  6984 00003502 E88B07                   call getlex
  6985 00003505 A3[1C00]                 mov word [token], ax
  6986                                  
  6987                                  ;-676 }
  6988                                  
  6989                                  .doinclude365:
  6990                                  
  6991                                  ;-677 int dodefine() { int i; int j; int fdtemp;
  6992 00003508 C9                       LEAVE
  6993 00003509 C3                       ret
  6994 0000350A 5C6E3B55736520696E-     doinclude_0 db "\n;Use include file: ",0
  6995 00003513 636C7564652066696C-
  6996 0000351C 653A2000           
  6997 00003520 496E636C7564652066-     doinclude_1 db "Include file missing: ",0
  6998 00003529 696C65206D69737369-
  6999 00003532 6E673A2000         
  7000 00003537 2053746F70212100        doinclude_2 db " Stop!!",0
  7001 0000353F 5C6E3B4261636B2074-     doinclude_3 db "\n;Back to main program: ",0
  7002 00003548 6F206D61696E207072-
  7003 00003551 6F6772616D3A2000   
  7004                                  ; ENDP
  7005                                  
  7006                                  dodefine:  ; *** PROC ***
  7007                                  
  7008                                  ;-678   if (eqstr(symbol, "ORGDATA")) {token=getlex();
  7009                                  
  7010                                  ;Function : dodefine, Number of local variables: 3
  7011                                  ;   # type sign width addr used name   list of local variables
  7012                                  ;  200 var sign word   677 NULL i = bp-2
  7013                                  ;  201 var sign word   677 NULL j = bp-4
  7014                                  ;  202 var sign word   677 NULL fdtemp = bp-6;
  7015 00003559 C8060000                 ENTER  6,0
  7016 0000355D 68[A036]                 push dodefine_0
  7017 00003560 8D062B81                 lea  ax, [symbol]
  7018 00003564 50                       push ax
  7019 00003565 E82ECC                   call eqstr
  7020 00003568 83C404                   add  sp, 4
  7021 0000356B 08C0                     or  al, al
  7022 0000356D 0F841500                 je .dodefine367
  7023 00003571 E81C07                   call getlex
  7024 00003574 A3[1C00]                 mov word [token], ax
  7025                                  
  7026                                  ;-679     ORGDATAORIG=lexval; orgData=lexval; return; }
  7027                                  
  7028 00003577 A1[2E00]                 mov ax, [lexval]
  7029 0000357A A3[0E00]                 mov word [ORGDATAORIG], ax
  7030 0000357D A1[2E00]                 mov ax, [lexval]
  7031 00003580 A3[1000]                 mov word [orgData], ax
  7032 00003583 E91801                   jmp .retndodefine
  7033                                  
  7034                                  ;-680   if (eqstr(symbol, "ARCHIVE")){token=getlex();  if (token==T_STRING) {
  7035                                  
  7036                                  .dodefine367:
  7037 00003586 68[A836]                 push dodefine_1
  7038 00003589 8D062B81                 lea  ax, [symbol]
  7039 0000358D 50                       push ax
  7040 0000358E E805CC                   call eqstr
  7041 00003591 83C404                   add  sp, 4
  7042 00003594 08C0                     or  al, al
  7043 00003596 0F844900                 je .dodefine368
  7044 0000359A E8F306                   call getlex
  7045 0000359D A3[1C00]                 mov word [token], ax
  7046 000035A0 A1[1C00]                 mov ax, [token]
  7047 000035A3 3D0201                   cmp ax, 258
  7048 000035A6 0F852700                 jne .dodefine369
  7049                                  
  7050                                  ;-681     prs("\n;Use archive file: ");
  7051                                  
  7052 000035AA 68[B036]                 push dodefine_2
  7053 000035AD E8390F                   call prs
  7054 000035B0 83C402                   add  sp, 2
  7055                                  
  7056                                  ;-682     strcpy(archivename, symbol); prs(archivename);
  7057                                  
  7058 000035B3 8D062B81                 lea  ax, [symbol]
  7059 000035B7 50                       push ax
  7060 000035B8 8D067482                 lea  ax, [archivename]
  7061 000035BC 50                       push ax
  7062 000035BD E8A6CB                   call strcpy
  7063 000035C0 83C404                   add  sp, 4
  7064 000035C3 8D067482                 lea  ax, [archivename]
  7065 000035C7 50                       push ax
  7066 000035C8 E81E0F                   call prs
  7067 000035CB 83C402                   add  sp, 2
  7068                                  
  7069                                  ;-683     } else error1("Name of archive file missing"); token=getlex(); return;}
  7070                                  
  7071 000035CE E90900                   jmp .dodefine370
  7072                                  .dodefine369:
  7073 000035D1 68[C636]                 push dodefine_3
  7074 000035D4 E8B611                   call error1
  7075 000035D7 83C402                   add  sp, 2
  7076                                  .dodefine370:
  7077 000035DA E8B306                   call getlex
  7078 000035DD A3[1C00]                 mov word [token], ax
  7079 000035E0 E9BB00                   jmp .retndodefine
  7080                                  
  7081                                  ;-684    expect(T_NAME);
  7082                                  
  7083                                  .dodefine368:
  7084 000035E3 680001                   push 256
  7085 000035E6 E8ED0D                   call expect
  7086 000035E9 83C402                   add  sp, 2
  7087                                  
  7088                                  ;-685   if (token==T_CONST) { 
  7089                                  
  7090 000035EC A1[1C00]                 mov ax, [token]
  7091 000035EF 3D0101                   cmp ax, 257
  7092 000035F2 0F85A800                 jne .dodefine371
  7093                                  
  7094                                  ;-686     if (GTop >= LSTART) error1("global table (define) full");
  7095                                  
  7096 000035F6 A1[2A00]                 mov ax, [GTop]
  7097 000035F9 3DC800                   cmp ax, 200 ;unsigned : 1
  7098 000035FC 0F8C0900                 jl  .dodefine372
  7099 00003600 68[E336]                 push dodefine_4
  7100 00003603 E88711                   call error1
  7101 00003606 83C402                   add  sp, 2
  7102                                  
  7103                                  ;-687     i=strlen(symbol); if (i>15) error1("Define name longer 15 char");
  7104                                  
  7105                                  .dodefine372:
  7106 00003609 8D062B81                 lea  ax, [symbol]
  7107 0000360D 50                       push ax
  7108 0000360E E82DCB                   call strlen
  7109 00003611 83C402                   add  sp, 2
  7110 00003614 8946FE                   mov [bp-2], ax
  7111 00003617 8B46FE                   mov ax, [bp-2]
  7112 0000361A 83F80F                   cmp ax, 15
  7113 0000361D 0F8E0900                 jle .dodefine373
  7114 00003621 68[FE36]                 push dodefine_5
  7115 00003624 E86611                   call error1
  7116 00003627 83C402                   add  sp, 2
  7117                                  
  7118                                  ;-688     GSign [GTop]='U'; GWidth[GTop]=1; GType [GTop]='#';
  7119                                  
  7120                                  .dodefine373:
  7121 0000362A B85500                   mov ax, 85
  7122 0000362D 8B1E[2A00]               mov bx, [GTop]
  7123 00003631 8887E383                 mov [GSign+bx], al
  7124 00003635 B80100                   mov ax, 1
  7125 00003638 8B1E[2A00]               mov bx, [GTop]
  7126 0000363C 88870F85                 mov [GWidth+bx], al
  7127 00003640 B82300                   mov ax, 35
  7128 00003643 8B1E[2A00]               mov bx, [GTop]
  7129 00003647 8887B782                 mov [GType+bx], al
  7130                                  
  7131                                  ;-689     GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  7132                                  
  7133 0000364B A1[6600]                 mov ax, [lineno]
  7134 0000364E 83E801                   sub ax, 1
  7135 00003651 8B1E[2A00]               mov bx, [GTop]
  7136 00003655 D1E3                     shl bx, 1
  7137 00003657 89873B86                 mov [GAdr+bx], ax
  7138 0000365B B80000                   mov ax, 0
  7139 0000365E 8B1E[2A00]               mov bx, [GTop]
  7140 00003662 D1E3                     shl bx, 1
  7141 00003664 89879388                 mov [GUsed+bx], ax
  7142                                  
  7143                                  ;-690     pt=adrofname(GTop); strcpy(pt, symbol); GData[GTop]=lexval;
  7144                                  
  7145 00003668 FF36[2A00]               push word [GTop]
  7146 0000366C E865D2                   call adrofname
  7147 0000366F 83C402                   add  sp, 2
  7148 00003672 A3[6A00]                 mov word [pt], ax
  7149 00003675 8D062B81                 lea  ax, [symbol]
  7150 00003679 50                       push ax
  7151 0000367A FF36[6A00]               push word [pt]
  7152 0000367E E8E5CA                   call strcpy
  7153 00003681 83C404                   add  sp, 4
  7154 00003684 A1[2E00]                 mov ax, [lexval]
  7155 00003687 8B1E[2A00]               mov bx, [GTop]
  7156 0000368B D1E3                     shl bx, 1
  7157 0000368D 8987EB8A                 mov [GData+bx], ax
  7158                                  
  7159                                  ;-691     expect(T_CONST); GTop++;  } 
  7160                                  
  7161 00003691 680101                   push 257
  7162 00003694 E83F0D                   call expect
  7163 00003697 83C402                   add  sp, 2
  7164 0000369A FF06[2A00]               inc  word[GTop]
  7165                                  
  7166                                  ;-692 }
  7167                                  
  7168                                  .dodefine371:
  7169                                  
  7170                                  ;-693 int stmt() { int c; char cha;
  7171                                  
  7172 0000369E C9                       .retndodefine: LEAVE
  7173 0000369F C3                       ret
  7174 000036A0 4F52474441544100        dodefine_0 db "ORGDATA",0
  7175 000036A8 4152434849564500        dodefine_1 db "ARCHIVE",0
  7176 000036B0 5C6E3B557365206172-     dodefine_2 db "\n;Use archive file: ",0
  7177 000036B9 63686976652066696C-
  7178 000036C2 653A2000           
  7179 000036C6 4E616D65206F662061-     dodefine_3 db "Name of archive file missing",0
  7180 000036CF 726368697665206669-
  7181 000036D8 6C65206D697373696E-
  7182 000036E1 6700               
  7183 000036E3 676C6F62616C207461-     dodefine_4 db "global table (define) full",0
  7184 000036EC 626C65202864656669-
  7185 000036F5 6E65292066756C6C00 
  7186 000036FE 446566696E65206E61-     dodefine_5 db "Define name longer 15 char",0
  7187 00003707 6D65206C6F6E676572-
  7188 00003710 203135206368617200 
  7189                                  ; ENDP
  7190                                  
  7191                                  stmt:  ; *** PROC ***
  7192                                  
  7193                                  ;-694        if(istoken('{'))     {while(istoken('}')==0) stmt();}
  7194                                  
  7195                                  ;Function : stmt, Number of local variables: 2
  7196                                  ;   # type sign width addr used name   list of local variables
  7197                                  ;  200 var sign word   693 NULL c = bp-2
  7198                                  ;  201 var sign byte   693 NULL cha = bp-4;
  7199 00003719 C8040000                 ENTER  4,0
  7200 0000371D 6A7B                     push 123
  7201 0000371F E8920C                   call istoken
  7202 00003722 83C402                   add  sp, 2
  7203 00003725 08C0                     or  al, al
  7204 00003727 0F841700                 je .stmt374
  7205                                  .stmt375:
  7206 0000372B 6A7D                     push 125
  7207 0000372D E8840C                   call istoken
  7208 00003730 83C402                   add  sp, 2
  7209 00003733 83F800                   cmp ax, 0
  7210 00003736 0F850500                 jne .stmt376
  7211 0000373A E8DCFF                   call stmt
  7212 0000373D EBEC                     jmp .stmt375
  7213                                  .stmt376:
  7214                                  
  7215                                  ;-695   else if(istoken(T_IF))    doif();
  7216                                  
  7217 0000373F E9B001                   jmp .stmt377
  7218                                  .stmt374:
  7219 00003742 680102                   push 513
  7220 00003745 E86C0C                   call istoken
  7221 00003748 83C402                   add  sp, 2
  7222 0000374B 08C0                     or  al, al
  7223 0000374D 0F840600                 je .stmt378
  7224 00003751 E8E203                   call doif
  7225                                  
  7226                                  ;-696   else if(istoken(T_DO))    dodo();
  7227                                  
  7228 00003754 E99B01                   jmp .stmt379
  7229                                  .stmt378:
  7230 00003757 680402                   push 516
  7231 0000375A E8570C                   call istoken
  7232 0000375D 83C402                   add  sp, 2
  7233 00003760 08C0                     or  al, al
  7234 00003762 0F840600                 je .stmt380
  7235 00003766 E82F04                   call dodo
  7236                                  
  7237                                  ;-697   else if(istoken(T_WHILE)) dowhile();
  7238                                  
  7239 00003769 E98601                   jmp .stmt381
  7240                                  .stmt380:
  7241 0000376C 680302                   push 515
  7242 0000376F E8420C                   call istoken
  7243 00003772 83C402                   add  sp, 2
  7244 00003775 08C0                     or  al, al
  7245 00003777 0F840600                 je .stmt382
  7246 0000377B E86704                   call dowhile
  7247                                  
  7248                                  ;-698   else if(istoken(T_GOTO))  {prs("\n jmp .");name1();prs(symbol);expect(';');}
  7249                                  
  7250 0000377E E97101                   jmp .stmt383
  7251                                  .stmt382:
  7252 00003781 680902                   push 521
  7253 00003784 E82D0C                   call istoken
  7254 00003787 83C402                   add  sp, 2
  7255 0000378A 08C0                     or  al, al
  7256 0000378C 0F842200                 je .stmt384
  7257 00003790 68[F438]                 push stmt_0
  7258 00003793 E8530D                   call prs
  7259 00003796 83C402                   add  sp, 2
  7260 00003799 E867D3                   call name1
  7261 0000379C 8D062B81                 lea  ax, [symbol]
  7262 000037A0 50                       push ax
  7263 000037A1 E8450D                   call prs
  7264 000037A4 83C402                   add  sp, 2
  7265 000037A7 6A3B                     push 59
  7266 000037A9 E82A0C                   call expect
  7267 000037AC 83C402                   add  sp, 2
  7268                                  
  7269                                  ;-699   else if(token==T_ASM)     {prs("\n"); c=next();
  7270                                  
  7271 000037AF E94001                   jmp .stmt385
  7272                                  .stmt384:
  7273 000037B2 A1[1C00]                 mov ax, [token]
  7274 000037B5 3D0602                   cmp ax, 518
  7275 000037B8 0F853300                 jne .stmt386
  7276 000037BC 68[FD38]                 push stmt_1
  7277 000037BF E8270D                   call prs
  7278 000037C2 83C402                   add  sp, 2
  7279 000037C5 E8CE0B                   call next
  7280 000037C8 8946FE                   mov [bp-2], ax
  7281                                  
  7282                                  ;-700         while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }
  7283                                  
  7284                                  .stmt387:
  7285 000037CB 8B46FE                   mov ax, [bp-2]
  7286 000037CE 83F80A                   cmp ax, 10
  7287 000037D1 0F841100                 je  .stmt388
  7288 000037D5 FF76FE                   push word [bp-2]
  7289 000037D8 E8A70C                   call prc
  7290 000037DB 83C402                   add  sp, 2
  7291 000037DE E8B50B                   call next
  7292 000037E1 8946FE                   mov [bp-2], ax
  7293 000037E4 EBE5                     jmp .stmt387
  7294                                  .stmt388:
  7295 000037E6 E8A704                   call getlex
  7296 000037E9 A3[1C00]                 mov word [token], ax
  7297                                  
  7298                                  ;-701   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();  
  7299                                  
  7300 000037EC E90301                   jmp .stmt389
  7301                                  .stmt386:
  7302 000037EF 680702                   push 519
  7303 000037F2 E8BF0B                   call istoken
  7304 000037F5 83C402                   add  sp, 2
  7305 000037F8 08C0                     or  al, al
  7306 000037FA 0F844B00                 je .stmt390
  7307 000037FE A1[1C00]                 mov ax, [token]
  7308 00003801 83F87B                   cmp ax, 123
  7309 00003804 0F853500                 jne .stmt391
  7310 00003808 68[0039]                 push stmt_2
  7311 0000380B E8DB0C                   call prs
  7312 0000380E 83C402                   add  sp, 2
  7313 00003811 E8820B                   call next
  7314 00003814 8846FC                   mov [bp-4], al
  7315                                  
  7316                                  ;-702         while(cha!= '}') { prc(cha); cha=next(); }
  7317                                  
  7318                                  .stmt392:
  7319 00003817 8A46FC                   mov al, [bp-4]
  7320 0000381A 3C7D                     cmp al, 125
  7321 0000381C 0F841400                 je  .stmt393
  7322 00003820 8A46FC                   mov al, byte [bp-4]
  7323 00003823 B400                     mov ah, 0
  7324 00003825 50                       push ax
  7325 00003826 E8590C                   call prc
  7326 00003829 83C402                   add  sp, 2
  7327 0000382C E8670B                   call next
  7328 0000382F 8846FC                   mov [bp-4], al
  7329                                  
  7330                                  ;-703         token=getlex(); }
  7331                                  
  7332 00003832 EBE3                     jmp .stmt392
  7333                                  .stmt393:
  7334 00003834 E85904                   call getlex
  7335 00003837 A3[1C00]                 mov word [token], ax
  7336                                  
  7337                                  ;-704         else error1("Curly open expected"); 
  7338                                  
  7339 0000383A E90900                   jmp .stmt394
  7340                                  .stmt391:
  7341 0000383D 68[0339]                 push stmt_3
  7342 00003840 E84A0F                   call error1
  7343 00003843 83C402                   add  sp, 2
  7344                                  
  7345                                  ;-705         }
  7346                                  
  7347                                  .stmt394:
  7348                                  
  7349                                  ;-706   else if(istoken(T_EMIT))   doemit();
  7350                                  
  7351 00003846 E9A900                   jmp .stmt395
  7352                                  .stmt390:
  7353 00003849 680802                   push 520
  7354 0000384C E8650B                   call istoken
  7355 0000384F 83C402                   add  sp, 2
  7356 00003852 08C0                     or  al, al
  7357 00003854 0F840600                 je .stmt396
  7358 00003858 E8CD00                   call doemit
  7359                                  
  7360                                  ;-707   else if(istoken(';'))      { }
  7361                                  
  7362 0000385B E99400                   jmp .stmt397
  7363                                  .stmt396:
  7364 0000385E 6A3B                     push 59
  7365 00003860 E8510B                   call istoken
  7366 00003863 83C402                   add  sp, 2
  7367 00003866 08C0                     or  al, al
  7368 00003868 0F840300                 je .stmt398
  7369                                  
  7370                                  ;-708   else if(istoken(T_RETURN)) {
  7371                                  
  7372 0000386C E98300                   jmp .stmt399
  7373                                  .stmt398:
  7374 0000386F 680002                   push 512
  7375 00003872 E83F0B                   call istoken
  7376 00003875 83C402                   add  sp, 2
  7377 00003878 08C0                     or  al, al
  7378 0000387A 0F843000                 je .stmt400
  7379                                  
  7380                                  ;-709         if (token!=';') exprstart();
  7381                                  
  7382 0000387E A1[1C00]                 mov ax, [token]
  7383 00003881 83F83B                   cmp ax, 59
  7384 00003884 0F840300                 je  .stmt401
  7385 00003888 E852D9                   call exprstart
  7386                                  
  7387                                  ;-710         prs("\n jmp .retn"); 
  7388                                  
  7389                                  .stmt401:
  7390 0000388B 68[1739]                 push stmt_4
  7391 0000388E E8580C                   call prs
  7392 00003891 83C402                   add  sp, 2
  7393                                  
  7394                                  ;-711         prs(fname);
  7395                                  
  7396 00003894 8D06AB81                 lea  ax, [fname]
  7397 00003898 50                       push ax
  7398 00003899 E84D0C                   call prs
  7399 0000389C 83C402                   add  sp, 2
  7400                                  
  7401                                  ;-712         nreturn++; 
  7402                                  
  7403 0000389F FF06[2600]               inc  word[nreturn]
  7404                                  
  7405                                  ;-713         expect(';');
  7406                                  
  7407 000038A3 6A3B                     push 59
  7408 000038A5 E82E0B                   call expect
  7409 000038A8 83C402                   add  sp, 2
  7410                                  
  7411                                  ;-714         }
  7412                                  
  7413                                  
  7414                                  ;-715   else if(thechar==':')      {
  7415                                  
  7416 000038AB E94400                   jmp .stmt402
  7417                                  .stmt400:
  7418 000038AE A0[2100]                 mov al, [thechar]
  7419 000038B1 3C3A                     cmp al, 58
  7420 000038B3 0F853000                 jne .stmt403
  7421                                  
  7422                                  ;-716         prs("\n."); // Label
  7423                                  
  7424 000038B7 68[2439]                 push stmt_5
  7425 000038BA E82C0C                   call prs
  7426 000038BD 83C402                   add  sp, 2
  7427                                  
  7428                                  ;-717         prs(symbol); prc(':');  
  7429                                  
  7430 000038C0 8D062B81                 lea  ax, [symbol]
  7431 000038C4 50                       push ax
  7432 000038C5 E8210C                   call prs
  7433 000038C8 83C402                   add  sp, 2
  7434 000038CB 6A3A                     push 58
  7435 000038CD E8B20B                   call prc
  7436 000038D0 83C402                   add  sp, 2
  7437                                  
  7438                                  ;-718         expect(T_NAME); 
  7439                                  
  7440 000038D3 680001                   push 256
  7441 000038D6 E8FD0A                   call expect
  7442 000038D9 83C402                   add  sp, 2
  7443                                  
  7444                                  ;-719         expect(':'); 
  7445                                  
  7446 000038DC 6A3A                     push 58
  7447 000038DE E8F50A                   call expect
  7448 000038E1 83C402                   add  sp, 2
  7449                                  
  7450                                  ;-720         }
  7451                                  
  7452                                  
  7453                                  ;-721   else  {exprstart(); expect(';'); } 
  7454                                  
  7455 000038E4 E90B00                   jmp .stmt404
  7456                                  .stmt403:
  7457 000038E7 E8F3D8                   call exprstart
  7458 000038EA 6A3B                     push 59
  7459 000038EC E8E70A                   call expect
  7460 000038EF 83C402                   add  sp, 2
  7461                                  
  7462                                  ;-722 }
  7463                                  
  7464                                  .stmt404:
  7465                                  .stmt402:
  7466                                  .stmt399:
  7467                                  .stmt397:
  7468                                  .stmt395:
  7469                                  .stmt389:
  7470                                  .stmt385:
  7471                                  .stmt383:
  7472                                  .stmt381:
  7473                                  .stmt379:
  7474                                  .stmt377:
  7475                                  
  7476                                  ;-723 
  7477                                  
  7478                                  
  7479                                  ;-724 int doemit() {prs("\n db ");
  7480 000038F2 C9                       LEAVE
  7481 000038F3 C3                       ret
  7482 000038F4 5C6E206A6D70202E00      stmt_0 db "\n jmp .",0
  7483 000038FD 5C6E00                  stmt_1 db "\n",0
  7484 00003900 5C6E00                  stmt_2 db "\n",0
  7485 00003903 4375726C79206F7065-     stmt_3 db "Curly open expected",0
  7486 0000390C 6E2065787065637465-
  7487 00003915 6400               
  7488 00003917 5C6E206A6D70202E72-     stmt_4 db "\n jmp .retn",0
  7489 00003920 65746E00           
  7490 00003924 5C6E2E00                stmt_5 db "\n.",0
  7491                                  ; ENDP
  7492                                  
  7493                                  doemit:  ; *** PROC ***
  7494 00003928 68[6439]                 push doemit_0
  7495 0000392B E8BB0B                   call prs
  7496 0000392E 83C402                   add  sp, 2
  7497                                  
  7498                                  ;-725   L1: token=getlex(); pint1(lexval); token=getlex();
  7499                                  
  7500                                  .L1:
  7501 00003931 E85C03                   call getlex
  7502 00003934 A3[1C00]                 mov word [token], ax
  7503 00003937 FF36[2E00]               push word [lexval]
  7504 0000393B E8A20C                   call pint1
  7505 0000393E 83C402                   add  sp, 2
  7506 00003941 E84C03                   call getlex
  7507 00003944 A3[1C00]                 mov word [token], ax
  7508                                  
  7509                                  ;-726     if (token== ',') {prc(','); goto L1;} expect(')'); }
  7510                                  
  7511 00003947 A1[1C00]                 mov ax, [token]
  7512 0000394A 83F82C                   cmp ax, 44
  7513 0000394D 0F850A00                 jne .doemit405
  7514 00003951 6A2C                     push 44
  7515 00003953 E82C0B                   call prc
  7516 00003956 83C402                   add  sp, 2
  7517 00003959 EBD6                     jmp .L1
  7518                                  .doemit405:
  7519 0000395B 6A29                     push 41
  7520 0000395D E8760A                   call expect
  7521 00003960 83C402                   add  sp, 2
  7522                                  
  7523                                  ;-727 
  7524                                  
  7525                                  
  7526                                  ;-728 int cmpneg(int ids) {
  7527                                  
  7528 00003963 C3                       ret
  7529 00003964 5C6E2064622000          doemit_0 db "\n db ",0
  7530                                  ; ENDP
  7531                                  
  7532                                  cmpneg:  ; *** PROC ***
  7533                                  
  7534                                  ;-729        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
  7535                                  
  7536                                  ;Function : cmpneg, Number of local variables: 1
  7537                                  ;   # type sign width addr used name   list of local variables
  7538                                  ;  200 var sign word   728 NULL ids = bp+4;
  7539 0000396B C8000000                 ENTER  0,0
  7540 0000396F A1[2200]                 mov ax, [iscmp]
  7541 00003972 3D2603                   cmp ax, 806
  7542 00003975 0F850C00                 jne .cmpneg406
  7543 00003979 68[4C3A]                 push cmpneg_0
  7544 0000397C E86A0B                   call prs
  7545 0000397F 83C402                   add  sp, 2
  7546                                  
  7547                                  ;-730   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1
  7548                                  
  7549 00003982 E9C500                   jmp .cmpneg407
  7550                                  .cmpneg406:
  7551 00003985 A1[2200]                 mov ax, [iscmp]
  7552 00003988 3D2703                   cmp ax, 807
  7553 0000398B 0F850C00                 jne .cmpneg408
  7554 0000398F 68[553A]                 push cmpneg_1
  7555 00003992 E8540B                   call prs
  7556 00003995 83C402                   add  sp, 2
  7557                                  
  7558                                  ;-731   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF
  7559                                  
  7560 00003998 E9AF00                   jmp .cmpneg409
  7561                                  .cmpneg408:
  7562 0000399B A1[2200]                 mov ax, [iscmp]
  7563 0000399E 3D3803                   cmp ax, 824
  7564 000039A1 0F852100                 jne .cmpneg410
  7565 000039A5 8B4604                   mov ax, [bp+4]
  7566 000039A8 08C0                     or  al, al
  7567 000039AA 0F840C00                 je .cmpneg411
  7568 000039AE 68[5E3A]                 push cmpneg_2
  7569 000039B1 E8350B                   call prs
  7570 000039B4 83C402                   add  sp, 2
  7571                                  
  7572                                  ;-732                            else prs("\n ja  .");//ZF=0 CF=0
  7573                                  
  7574 000039B7 E90900                   jmp .cmpneg412
  7575                                  .cmpneg411:
  7576 000039BA 68[673A]                 push cmpneg_3
  7577 000039BD E8290B                   call prs
  7578 000039C0 83C402                   add  sp, 2
  7579                                  
  7580                                  ;-733   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); pint1(ids);
  7581                                  
  7582                                  .cmpneg412:
  7583 000039C3 E98400                   jmp .cmpneg413
  7584                                  .cmpneg410:
  7585 000039C6 A1[2200]                 mov ax, [iscmp]
  7586 000039C9 3D2B03                   cmp ax, 811
  7587 000039CC 0F854500                 jne .cmpneg414
  7588 000039D0 8B4604                   mov ax, [bp+4]
  7589 000039D3 08C0                     or  al, al
  7590 000039D5 0F841E00                 je .cmpneg415
  7591 000039D9 68[703A]                 push cmpneg_4
  7592 000039DC E80A0B                   call prs
  7593 000039DF 83C402                   add  sp, 2
  7594 000039E2 FF7604                   push word [bp+4]
  7595 000039E5 E8F80B                   call pint1
  7596 000039E8 83C402                   add  sp, 2
  7597                                  
  7598                                  ;-734                                prs("\n jl  .");}//          SF!=OF
  7599                                  
  7600 000039EB 68[7E3A]                 push cmpneg_5
  7601 000039EE E8F80A                   call prs
  7602 000039F1 83C402                   add  sp, 2
  7603                                  
  7604                                  ;-735                            else{prs(" ;unsigned : "); pint1(ids);
  7605                                  
  7606 000039F4 E91B00                   jmp .cmpneg416
  7607                                  .cmpneg415:
  7608 000039F7 68[873A]                 push cmpneg_6
  7609 000039FA E8EC0A                   call prs
  7610 000039FD 83C402                   add  sp, 2
  7611 00003A00 FF7604                   push word [bp+4]
  7612 00003A03 E8DA0B                   call pint1
  7613 00003A06 83C402                   add  sp, 2
  7614                                  
  7615                                  ;-736                                prs("\n jb  .");}//jb=jc=CF=1
  7616                                  
  7617 00003A09 68[953A]                 push cmpneg_7
  7618 00003A0C E8DA0A                   call prs
  7619 00003A0F 83C402                   add  sp, 2
  7620                                  
  7621                                  ;-737   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF
  7622                                  
  7623                                  .cmpneg416:
  7624 00003A12 E93500                   jmp .cmpneg417
  7625                                  .cmpneg414:
  7626 00003A15 A1[2200]                 mov ax, [iscmp]
  7627 00003A18 83F83C                   cmp ax, 60
  7628 00003A1B 0F850C00                 jne .cmpneg418
  7629 00003A1F 68[9E3A]                 push cmpneg_8
  7630 00003A22 E8C40A                   call prs
  7631 00003A25 83C402                   add  sp, 2
  7632                                  
  7633                                  ;-738   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF
  7634                                  
  7635 00003A28 E91F00                   jmp .cmpneg419
  7636                                  .cmpneg418:
  7637 00003A2B A1[2200]                 mov ax, [iscmp]
  7638 00003A2E 83F83E                   cmp ax, 62
  7639 00003A31 0F850C00                 jne .cmpneg420
  7640 00003A35 68[A73A]                 push cmpneg_9
  7641 00003A38 E8AE0A                   call prs
  7642 00003A3B 83C402                   add  sp, 2
  7643                                  
  7644                                  ;-739   else error1("internal error compare unknown in CMPNEG()");  }
  7645                                  
  7646 00003A3E E90900                   jmp .cmpneg421
  7647                                  .cmpneg420:
  7648 00003A41 68[B03A]                 push cmpneg_10
  7649 00003A44 E8460D                   call error1
  7650 00003A47 83C402                   add  sp, 2
  7651                                  .cmpneg421:
  7652                                  .cmpneg419:
  7653                                  .cmpneg417:
  7654                                  .cmpneg413:
  7655                                  .cmpneg409:
  7656                                  .cmpneg407:
  7657                                  
  7658                                  ;-740 
  7659                                  
  7660                                  
  7661                                  ;-741 int prlabel(int n) {prs("\n."); prs(fname); pint1(n); prc(':'); }
  7662 00003A4A C9                       LEAVE
  7663 00003A4B C3                       ret
  7664 00003A4C 5C6E206A6E65202E00      cmpneg_0 db "\n jne .",0
  7665 00003A55 5C6E206A6520202E00      cmpneg_1 db "\n je  .",0
  7666 00003A5E 5C6E206A6720202E00      cmpneg_2 db "\n jg  .",0
  7667 00003A67 5C6E206A6120202E00      cmpneg_3 db "\n ja  .",0
  7668 00003A70 203B756E7369676E65-     cmpneg_4 db " ;unsigned : ",0
  7669 00003A79 64203A2000         
  7670 00003A7E 5C6E206A6C20202E00      cmpneg_5 db "\n jl  .",0
  7671 00003A87 203B756E7369676E65-     cmpneg_6 db " ;unsigned : ",0
  7672 00003A90 64203A2000         
  7673 00003A95 5C6E206A6220202E00      cmpneg_7 db "\n jb  .",0
  7674 00003A9E 5C6E206A6765202E00      cmpneg_8 db "\n jge .",0
  7675 00003AA7 5C6E206A6C65202E00      cmpneg_9 db "\n jle .",0
  7676 00003AB0 696E7465726E616C20-     cmpneg_10 db "internal error compare unknown in CMPNEG()",0
  7677 00003AB9 6572726F7220636F6D-
  7678 00003AC2 7061726520756E6B6E-
  7679 00003ACB 6F776E20696E20434D-
  7680 00003AD4 504E4547282900     
  7681                                  ; ENDP
  7682                                  
  7683                                  prlabel:  ; *** PROC ***
  7684                                  ;Function : prlabel, Number of local variables: 1
  7685                                  ;   # type sign width addr used name   list of local variables
  7686                                  ;  200 var sign word   741 NULL n = bp+4;
  7687 00003ADB C8000000                 ENTER  0,0
  7688 00003ADF 68[063B]                 push prlabel_0
  7689 00003AE2 E8040A                   call prs
  7690 00003AE5 83C402                   add  sp, 2
  7691 00003AE8 8D06AB81                 lea  ax, [fname]
  7692 00003AEC 50                       push ax
  7693 00003AED E8F909                   call prs
  7694 00003AF0 83C402                   add  sp, 2
  7695 00003AF3 FF7604                   push word [bp+4]
  7696 00003AF6 E8E70A                   call pint1
  7697 00003AF9 83C402                   add  sp, 2
  7698 00003AFC 6A3A                     push 58
  7699 00003AFE E88109                   call prc
  7700 00003B01 83C402                   add  sp, 2
  7701                                  
  7702                                  ;-742 int prjump (int n) {prs("\n jmp ."); prs(fname); pint1(n); }
  7703 00003B04 C9                       LEAVE
  7704 00003B05 C3                       ret
  7705 00003B06 5C6E2E00                prlabel_0 db "\n.",0
  7706                                  ; ENDP
  7707                                  
  7708                                  prjump:  ; *** PROC ***
  7709                                  ;Function : prjump, Number of local variables: 1
  7710                                  ;   # type sign width addr used name   list of local variables
  7711                                  ;  200 var sign word   742 NULL n = bp+4;
  7712 00003B0A C8000000                 ENTER  0,0
  7713 00003B0E 68[2D3B]                 push prjump_0
  7714 00003B11 E8D509                   call prs
  7715 00003B14 83C402                   add  sp, 2
  7716 00003B17 8D06AB81                 lea  ax, [fname]
  7717 00003B1B 50                       push ax
  7718 00003B1C E8CA09                   call prs
  7719 00003B1F 83C402                   add  sp, 2
  7720 00003B22 FF7604                   push word [bp+4]
  7721 00003B25 E8B80A                   call pint1
  7722 00003B28 83C402                   add  sp, 2
  7723                                  
  7724                                  ;-743 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
  7725 00003B2B C9                       LEAVE
  7726 00003B2C C3                       ret
  7727 00003B2D 5C6E206A6D70202E00      prjump_0 db "\n jmp .",0
  7728                                  ; ENDP
  7729                                  
  7730                                  doif:  ; *** PROC ***
  7731                                  ;Function : doif, Number of local variables: 2
  7732                                  ;   # type sign width addr used name   list of local variables
  7733                                  ;  200 var sign word   743 NULL jdest = bp-2
  7734                                  ;  201 var sign word   743 NULL tst = bp-4;
  7735 00003B36 C8040000                 ENTER  4,0
  7736 00003B3A E814D5                   call pexpr
  7737 00003B3D FF06[2800]               inc  word[nlabel]
  7738 00003B41 A1[2800]                 mov ax, [nlabel]
  7739 00003B44 8946FE                   mov [bp-2], ax
  7740                                  
  7741                                  ;-744   pint1(jdest); stmt();
  7742                                  
  7743 00003B47 FF76FE                   push word [bp-2]
  7744 00003B4A E8930A                   call pint1
  7745 00003B4D 83C402                   add  sp, 2
  7746 00003B50 E8C6FB                   call stmt
  7747                                  
  7748                                  ;-745   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;
  7749                                  
  7750 00003B53 680202                   push 514
  7751 00003B56 E85B08                   call istoken
  7752 00003B59 83C402                   add  sp, 2
  7753 00003B5C 08C0                     or  al, al
  7754 00003B5E 0F842B00                 je .doif422
  7755 00003B62 FF06[2800]               inc  word[nlabel]
  7756 00003B66 A1[2800]                 mov ax, [nlabel]
  7757 00003B69 8946FC                   mov [bp-4], ax
  7758                                  
  7759                                  ;-746     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }
  7760                                  
  7761 00003B6C FF76FC                   push word [bp-4]
  7762 00003B6F E898FF                   call prjump
  7763 00003B72 83C402                   add  sp, 2
  7764 00003B75 FF76FE                   push word [bp-2]
  7765 00003B78 E860FF                   call prlabel
  7766 00003B7B 83C402                   add  sp, 2
  7767 00003B7E E898FB                   call stmt
  7768 00003B81 FF76FC                   push word [bp-4]
  7769 00003B84 E854FF                   call prlabel
  7770 00003B87 83C402                   add  sp, 2
  7771                                  
  7772                                  ;-747   else prlabel(jdest); }
  7773                                  
  7774 00003B8A E90900                   jmp .doif423
  7775                                  .doif422:
  7776 00003B8D FF76FE                   push word [bp-2]
  7777 00003B90 E848FF                   call prlabel
  7778 00003B93 83C402                   add  sp, 2
  7779                                  .doif423:
  7780                                  
  7781                                  ;-748 
  7782                                  
  7783                                  
  7784                                  ;-749 int dodo() {int jdest; int jtemp;
  7785 00003B96 C9                       LEAVE
  7786 00003B97 C3                       ret
  7787                                  ; ENDP
  7788                                  
  7789                                  dodo:  ; *** PROC ***
  7790                                  
  7791                                  ;-750   nlabel++; jdest=nlabel; prlabel(jdest); stmt();
  7792                                  
  7793                                  ;Function : dodo, Number of local variables: 2
  7794                                  ;   # type sign width addr used name   list of local variables
  7795                                  ;  200 var sign word   749 NULL jdest = bp-2
  7796                                  ;  201 var sign word   749 NULL jtemp = bp-4;
  7797 00003B98 C8040000                 ENTER  4,0
  7798 00003B9C FF06[2800]               inc  word[nlabel]
  7799 00003BA0 A1[2800]                 mov ax, [nlabel]
  7800 00003BA3 8946FE                   mov [bp-2], ax
  7801 00003BA6 FF76FE                   push word [bp-2]
  7802 00003BA9 E82FFF                   call prlabel
  7803 00003BAC 83C402                   add  sp, 2
  7804 00003BAF E867FB                   call stmt
  7805                                  
  7806                                  ;-751   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);
  7807                                  
  7808 00003BB2 680302                   push 515
  7809 00003BB5 E81E08                   call expect
  7810 00003BB8 83C402                   add  sp, 2
  7811 00003BBB E893D4                   call pexpr
  7812 00003BBE FF06[2800]               inc  word[nlabel]
  7813 00003BC2 A1[2800]                 mov ax, [nlabel]
  7814 00003BC5 8946FC                   mov [bp-4], ax
  7815 00003BC8 FF76FC                   push word [bp-4]
  7816 00003BCB E8120A                   call pint1
  7817 00003BCE 83C402                   add  sp, 2
  7818                                  
  7819                                  ;-752   prjump(jdest); prlabel(jtemp); }
  7820                                  
  7821 00003BD1 FF76FE                   push word [bp-2]
  7822 00003BD4 E833FF                   call prjump
  7823 00003BD7 83C402                   add  sp, 2
  7824 00003BDA FF76FC                   push word [bp-4]
  7825 00003BDD E8FBFE                   call prlabel
  7826 00003BE0 83C402                   add  sp, 2
  7827                                  
  7828                                  ;-753 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
  7829 00003BE3 C9                       LEAVE
  7830 00003BE4 C3                       ret
  7831                                  ; ENDP
  7832                                  
  7833                                  dowhile:  ; *** PROC ***
  7834                                  ;Function : dowhile, Number of local variables: 2
  7835                                  ;   # type sign width addr used name   list of local variables
  7836                                  ;  200 var sign word   753 NULL jdest = bp-2
  7837                                  ;  201 var sign word   753 NULL tst = bp-4;
  7838 00003BE5 C8040000                 ENTER  4,0
  7839 00003BE9 FF06[2800]               inc  word[nlabel]
  7840 00003BED A1[2800]                 mov ax, [nlabel]
  7841 00003BF0 8946FE                   mov [bp-2], ax
  7842                                  
  7843                                  ;-754   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);
  7844                                  
  7845 00003BF3 FF76FE                   push word [bp-2]
  7846 00003BF6 E8E2FE                   call prlabel
  7847 00003BF9 83C402                   add  sp, 2
  7848 00003BFC E852D4                   call pexpr
  7849 00003BFF FF06[2800]               inc  word[nlabel]
  7850 00003C03 A1[2800]                 mov ax, [nlabel]
  7851 00003C06 8946FC                   mov [bp-4], ax
  7852 00003C09 FF76FC                   push word [bp-4]
  7853 00003C0C E8D109                   call pint1
  7854 00003C0F 83C402                   add  sp, 2
  7855                                  
  7856                                  ;-755   stmt(); prjump(jdest); prlabel(tst); }
  7857                                  
  7858 00003C12 E804FB                   call stmt
  7859 00003C15 FF76FE                   push word [bp-2]
  7860 00003C18 E8EFFE                   call prjump
  7861 00003C1B 83C402                   add  sp, 2
  7862 00003C1E FF76FC                   push word [bp-4]
  7863 00003C21 E8B7FE                   call prlabel
  7864 00003C24 83C402                   add  sp, 2
  7865                                  
  7866                                  ;-756 int isrelational() {
  7867 00003C27 C9                       LEAVE
  7868 00003C28 C3                       ret
  7869                                  ; ENDP
  7870                                  
  7871                                  isrelational:  ; *** PROC ***
  7872                                  
  7873                                  ;-757   if (token==T_EQ) goto w; if (token==T_NE) goto w;
  7874                                  
  7875 00003C29 A1[1C00]                 mov ax, [token]
  7876 00003C2C 3D2603                   cmp ax, 806
  7877 00003C2F 0F850300                 jne .isrelational424
  7878 00003C33 E94700                   jmp .w
  7879                                  .isrelational424:
  7880 00003C36 A1[1C00]                 mov ax, [token]
  7881 00003C39 3D2703                   cmp ax, 807
  7882 00003C3C 0F850300                 jne .isrelational425
  7883 00003C40 E93A00                   jmp .w
  7884                                  
  7885                                  ;-758   if (token==T_LE) goto w; if (token==T_GE) goto w;
  7886                                  
  7887                                  .isrelational425:
  7888 00003C43 A1[1C00]                 mov ax, [token]
  7889 00003C46 3D3803                   cmp ax, 824
  7890 00003C49 0F850300                 jne .isrelational426
  7891 00003C4D E92D00                   jmp .w
  7892                                  .isrelational426:
  7893 00003C50 A1[1C00]                 mov ax, [token]
  7894 00003C53 3D2B03                   cmp ax, 811
  7895 00003C56 0F850300                 jne .isrelational427
  7896 00003C5A E92000                   jmp .w
  7897                                  
  7898                                  ;-759   if (token=='<' ) goto w; if (token=='>' ) goto w;
  7899                                  
  7900                                  .isrelational427:
  7901 00003C5D A1[1C00]                 mov ax, [token]
  7902 00003C60 83F83C                   cmp ax, 60
  7903 00003C63 0F850300                 jne .isrelational428
  7904 00003C67 E91300                   jmp .w
  7905                                  .isrelational428:
  7906 00003C6A A1[1C00]                 mov ax, [token]
  7907 00003C6D 83F83E                   cmp ax, 62
  7908 00003C70 0F850300                 jne .isrelational429
  7909 00003C74 E90600                   jmp .w
  7910                                  
  7911                                  ;-760   return 0;  w: iscmp=token; token=getlex(); return 1;}
  7912                                  
  7913                                  .isrelational429:
  7914 00003C77 B80000                   mov ax, 0
  7915 00003C7A E91200                   jmp .retnisrelational
  7916                                  .w:
  7917 00003C7D A1[1C00]                 mov ax, [token]
  7918 00003C80 A3[2200]                 mov word [iscmp], ax
  7919 00003C83 E80A00                   call getlex
  7920 00003C86 A3[1C00]                 mov word [token], ax
  7921 00003C89 B80100                   mov ax, 1
  7922 00003C8C E90000                   jmp .retnisrelational
  7923                                  
  7924                                  ;-761  
  7925                                  
  7926                                  
  7927                                  ;-762 char symboltemp[80];    
  7928                                  
  7929                                   .retnisrelational:
  7930 00003C8F C3                       ret
  7931                                  ; ENDP
  7932                                  section .bss
  7933                                  absolute -12068
  7934 FFFFD0DC <res 00000050>          symboltemp resb 80
  7935                                  section .text
  7936                                  
  7937                                  ;-763 int getlex() { char c; char *p; 
  7938                                  
  7939                                  
  7940                                  getlex:  ; *** PROC ***
  7941                                  
  7942                                  ;-764 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;
  7943                                  
  7944                                  ;Function : getlex, Number of local variables: 2
  7945                                  ;   # type sign width addr used name   list of local variables
  7946                                  ;  200 var sign byte   763 NULL c = bp-2
  7947                                  ;  201 ptr sign byte   763 NULL p = bp-4;
  7948 00003C90 C8040000                 ENTER  4,0
  7949                                  .g1:
  7950 00003C94 E8FF06                   call next
  7951 00003C97 8846FE                   mov [bp-2], al
  7952 00003C9A 8A46FE                   mov al, [bp-2]
  7953 00003C9D 3C00                     cmp al, 0
  7954 00003C9F 0F850600                 jne .getlex430
  7955 00003CA3 B80000                   mov ax, 0
  7956 00003CA6 E9EB04                   jmp .retngetlex
  7957                                  .getlex430:
  7958 00003CA9 8A46FE                   mov al, [bp-2]
  7959 00003CAC 3C20                     cmp al, 32
  7960 00003CAE 0F8F0200                 jg  .getlex431
  7961 00003CB2 EBE0                     jmp .g1
  7962                                  
  7963                                  ;-765   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}
  7964                                  
  7965                                  .getlex431:
  7966 00003CB4 8A46FE                   mov al, [bp-2]
  7967 00003CB7 3C3D                     cmp al, 61
  7968 00003CB9 0F851200                 jne .getlex432
  7969 00003CBD A0[2100]                 mov al, [thechar]
  7970 00003CC0 3C3D                     cmp al, 61
  7971 00003CC2 0F850900                 jne .getlex433
  7972 00003CC6 E8CD06                   call next
  7973 00003CC9 B82603                   mov ax, 806
  7974 00003CCC E9C504                   jmp .retngetlex
  7975                                  .getlex433:
  7976                                  
  7977                                  ;-766   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}
  7978                                  
  7979                                  .getlex432:
  7980 00003CCF 8A46FE                   mov al, [bp-2]
  7981 00003CD2 3C21                     cmp al, 33
  7982 00003CD4 0F851200                 jne .getlex434
  7983 00003CD8 A0[2100]                 mov al, [thechar]
  7984 00003CDB 3C3D                     cmp al, 61
  7985 00003CDD 0F850900                 jne .getlex435
  7986 00003CE1 E8B206                   call next
  7987 00003CE4 B82703                   mov ax, 807
  7988 00003CE7 E9AA04                   jmp .retngetlex
  7989                                  .getlex435:
  7990                                  
  7991                                  ;-767   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}
  7992                                  
  7993                                  .getlex434:
  7994 00003CEA 8A46FE                   mov al, [bp-2]
  7995 00003CED 3C3C                     cmp al, 60
  7996 00003CEF 0F851200                 jne .getlex436
  7997 00003CF3 A0[2100]                 mov al, [thechar]
  7998 00003CF6 3C3D                     cmp al, 61
  7999 00003CF8 0F850900                 jne .getlex437
  8000 00003CFC E89706                   call next
  8001 00003CFF B83803                   mov ax, 824
  8002 00003D02 E98F04                   jmp .retngetlex
  8003                                  .getlex437:
  8004                                  
  8005                                  ;-768   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}
  8006                                  
  8007                                  .getlex436:
  8008 00003D05 8A46FE                   mov al, [bp-2]
  8009 00003D08 3C3E                     cmp al, 62
  8010 00003D0A 0F851200                 jne .getlex438
  8011 00003D0E A0[2100]                 mov al, [thechar]
  8012 00003D11 3C3D                     cmp al, 61
  8013 00003D13 0F850900                 jne .getlex439
  8014 00003D17 E87C06                   call next
  8015 00003D1A B82B03                   mov ax, 811
  8016 00003D1D E97404                   jmp .retngetlex
  8017                                  .getlex439:
  8018                                  
  8019                                  ;-769   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}
  8020                                  
  8021                                  .getlex438:
  8022 00003D20 8A46FE                   mov al, [bp-2]
  8023 00003D23 3C3C                     cmp al, 60
  8024 00003D25 0F851200                 jne .getlex440
  8025 00003D29 A0[2100]                 mov al, [thechar]
  8026 00003D2C 3C3C                     cmp al, 60
  8027 00003D2E 0F850900                 jne .getlex441
  8028 00003D32 E86106                   call next
  8029 00003D35 B8D804                   mov ax, 1240
  8030 00003D38 E95904                   jmp .retngetlex
  8031                                  .getlex441:
  8032                                  
  8033                                  ;-770   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}
  8034                                  
  8035                                  .getlex440:
  8036 00003D3B 8A46FE                   mov al, [bp-2]
  8037 00003D3E 3C3E                     cmp al, 62
  8038 00003D40 0F851200                 jne .getlex442
  8039 00003D44 A0[2100]                 mov al, [thechar]
  8040 00003D47 3C3E                     cmp al, 62
  8041 00003D49 0F850900                 jne .getlex443
  8042 00003D4D E84606                   call next
  8043 00003D50 B8D904                   mov ax, 1241
  8044 00003D53 E93E04                   jmp .retngetlex
  8045                                  .getlex443:
  8046                                  
  8047                                  ;-771   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}
  8048                                  
  8049                                  .getlex442:
  8050 00003D56 8A46FE                   mov al, [bp-2]
  8051 00003D59 3C2B                     cmp al, 43
  8052 00003D5B 0F851200                 jne .getlex444
  8053 00003D5F A0[2100]                 mov al, [thechar]
  8054 00003D62 3C2B                     cmp al, 43
  8055 00003D64 0F850900                 jne .getlex445
  8056 00003D68 E82B06                   call next
  8057 00003D6B B8C304                   mov ax, 1219
  8058 00003D6E E92304                   jmp .retngetlex
  8059                                  .getlex445:
  8060                                  
  8061                                  ;-772   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}
  8062                                  
  8063                                  .getlex444:
  8064 00003D71 8A46FE                   mov al, [bp-2]
  8065 00003D74 3C2D                     cmp al, 45
  8066 00003D76 0F851200                 jne .getlex446
  8067 00003D7A A0[2100]                 mov al, [thechar]
  8068 00003D7D 3C2D                     cmp al, 45
  8069 00003D7F 0F850900                 jne .getlex447
  8070 00003D83 E81006                   call next
  8071 00003D86 B8C904                   mov ax, 1225
  8072 00003D89 E90804                   jmp .retngetlex
  8073                                  .getlex447:
  8074                                  
  8075                                  ;-773   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}
  8076                                  
  8077                                  .getlex446:
  8078 00003D8C 8A46FE                   mov al, [bp-2]
  8079 00003D8F 3C2B                     cmp al, 43
  8080 00003D91 0F851200                 jne .getlex448
  8081 00003D95 A0[2100]                 mov al, [thechar]
  8082 00003D98 3C3D                     cmp al, 61
  8083 00003D9A 0F850900                 jne .getlex449
  8084 00003D9E E8F505                   call next
  8085 00003DA1 B8CE04                   mov ax, 1230
  8086 00003DA4 E9ED03                   jmp .retngetlex
  8087                                  .getlex449:
  8088                                  
  8089                                  ;-774   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}
  8090                                  
  8091                                  .getlex448:
  8092 00003DA7 8A46FE                   mov al, [bp-2]
  8093 00003DAA 3C2D                     cmp al, 45
  8094 00003DAC 0F851200                 jne .getlex450
  8095 00003DB0 A0[2100]                 mov al, [thechar]
  8096 00003DB3 3C3D                     cmp al, 61
  8097 00003DB5 0F850900                 jne .getlex451
  8098 00003DB9 E8DA05                   call next
  8099 00003DBC B8CF04                   mov ax, 1231
  8100 00003DBF E9D203                   jmp .retngetlex
  8101                                  .getlex451:
  8102                                  
  8103                                  ;-775   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}
  8104                                  
  8105                                  .getlex450:
  8106 00003DC2 8A46FE                   mov al, [bp-2]
  8107 00003DC5 3C26                     cmp al, 38
  8108 00003DC7 0F851200                 jne .getlex452
  8109 00003DCB A0[2100]                 mov al, [thechar]
  8110 00003DCE 3C3D                     cmp al, 61
  8111 00003DD0 0F850900                 jne .getlex453
  8112 00003DD4 E8BF05                   call next
  8113 00003DD7 B8D204                   mov ax, 1234
  8114 00003DDA E9B703                   jmp .retngetlex
  8115                                  .getlex453:
  8116                                  
  8117                                  ;-776   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}    
  8118                                  
  8119                                  .getlex452:
  8120 00003DDD 8A46FE                   mov al, [bp-2]
  8121 00003DE0 3C7C                     cmp al, 124
  8122 00003DE2 0F851200                 jne .getlex454
  8123 00003DE6 A0[2100]                 mov al, [thechar]
  8124 00003DE9 3C3D                     cmp al, 61
  8125 00003DEB 0F850900                 jne .getlex455
  8126 00003DEF E8A405                   call next
  8127 00003DF2 B8D304                   mov ax, 1235
  8128 00003DF5 E99C03                   jmp .retngetlex
  8129                                  .getlex455:
  8130                                  
  8131                                  ;-777   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}
  8132                                  
  8133                                  .getlex454:
  8134 00003DF8 8A46FE                   mov al, [bp-2]
  8135 00003DFB 3C2A                     cmp al, 42
  8136 00003DFD 0F851200                 jne .getlex456
  8137 00003E01 A0[2100]                 mov al, [thechar]
  8138 00003E04 3C3D                     cmp al, 61
  8139 00003E06 0F850900                 jne .getlex457
  8140 00003E0A E88905                   call next
  8141 00003E0D B8D004                   mov ax, 1232
  8142 00003E10 E98103                   jmp .retngetlex
  8143                                  .getlex457:
  8144                                  
  8145                                  ;-778   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}        
  8146                                  
  8147                                  .getlex456:
  8148 00003E13 8A46FE                   mov al, [bp-2]
  8149 00003E16 3C2F                     cmp al, 47
  8150 00003E18 0F851200                 jne .getlex458
  8151 00003E1C A0[2100]                 mov al, [thechar]
  8152 00003E1F 3C3D                     cmp al, 61
  8153 00003E21 0F850900                 jne .getlex459
  8154 00003E25 E86E05                   call next
  8155 00003E28 B8D104                   mov ax, 1233
  8156 00003E2B E96603                   jmp .retngetlex
  8157                                  .getlex459:
  8158                                  
  8159                                  ;-779   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;
  8160                                  
  8161                                  .getlex458:
  8162 00003E2E 8A46FE                   mov al, byte [bp-2]
  8163 00003E31 B400                     mov ah, 0
  8164 00003E33 50                       push ax
  8165 00003E34 68[9641]                 push getlex_0
  8166 00003E37 E8A8C3                   call instr1
  8167 00003E3A 83C404                   add  sp, 4
  8168 00003E3D 08C0                     or  al, al
  8169 00003E3F 0F840600                 je .getlex460
  8170 00003E43 8A46FE                   mov al, [bp-2]
  8171 00003E46 E94B03                   jmp .retngetlex
  8172                                  
  8173                                  ;-780   if (c == '/') { if (thechar == '/') {
  8174                                  
  8175                                  .getlex460:
  8176 00003E49 8A46FE                   mov al, [bp-2]
  8177 00003E4C 3C2F                     cmp al, 47
  8178 00003E4E 0F852000                 jne .getlex461
  8179 00003E52 A0[2100]                 mov al, [thechar]
  8180 00003E55 3C2F                     cmp al, 47
  8181 00003E57 0F851700                 jne .getlex462
  8182                                  
  8183                                  ;-781       do c=next(); while(c != 13); /* c=next(); */ return getlex(); } }
  8184                                  
  8185                                  .getlex463:
  8186 00003E5B E83805                   call next
  8187 00003E5E 8846FE                   mov [bp-2], al
  8188 00003E61 8A46FE                   mov al, [bp-2]
  8189 00003E64 3C0D                     cmp al, 13
  8190 00003E66 0F840200                 je  .getlex464
  8191 00003E6A EBEF                     jmp .getlex463
  8192                                  .getlex464:
  8193 00003E6C E821FE                   call getlex
  8194 00003E6F E92203                   jmp .retngetlex
  8195                                  .getlex462:
  8196                                  
  8197                                  ;-782   if (c == '/') { if (thechar == '*') {
  8198                                  
  8199                                  .getlex461:
  8200 00003E72 8A46FE                   mov al, [bp-2]
  8201 00003E75 3C2F                     cmp al, 47
  8202 00003E77 0F853A00                 jne .getlex465
  8203 00003E7B A0[2100]                 mov al, [thechar]
  8204 00003E7E 3C2A                     cmp al, 42
  8205 00003E80 0F852B00                 jne .getlex466
  8206                                  
  8207                                  ;-783       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;
  8208                                  
  8209                                  .g2:
  8210 00003E84 E80F05                   call next
  8211 00003E87 8846FE                   mov [bp-2], al
  8212 00003E8A 8A46FE                   mov al, [bp-2]
  8213 00003E8D 3C2A                     cmp al, 42
  8214 00003E8F 0F840200                 je  .getlex467
  8215 00003E93 EBEF                     jmp .g2
  8216                                  .getlex467:
  8217 00003E95 A0[2100]                 mov al, [thechar]
  8218 00003E98 3C2F                     cmp al, 47
  8219 00003E9A 0F840200                 je  .getlex468
  8220 00003E9E EBE4                     jmp .g2
  8221                                  
  8222                                  ;-784       c=next(); return getlex(); } else  return '/'; }
  8223                                  
  8224                                  .getlex468:
  8225 00003EA0 E8F304                   call next
  8226 00003EA3 8846FE                   mov [bp-2], al
  8227 00003EA6 E8E7FD                   call getlex
  8228 00003EA9 E9E802                   jmp .retngetlex
  8229 00003EAC E90600                   jmp .getlex469
  8230                                  .getlex466:
  8231 00003EAF B82F00                   mov ax, 47
  8232 00003EB2 E9DF02                   jmp .retngetlex
  8233                                  .getlex469:
  8234                                  
  8235                                  ;-785   if (c == '"') {getstring(c); return T_STRING;}
  8236                                  
  8237                                  .getlex465:
  8238 00003EB5 8A46FE                   mov al, [bp-2]
  8239 00003EB8 3C22                     cmp al, 34
  8240 00003EBA 0F851200                 jne .getlex470
  8241 00003EBE 8A46FE                   mov al, byte [bp-2]
  8242 00003EC1 B400                     mov ah, 0
  8243 00003EC3 50                       push ax
  8244 00003EC4 E89804                   call getstring
  8245 00003EC7 83C402                   add  sp, 2
  8246 00003ECA B80201                   mov ax, 258
  8247 00003ECD E9C402                   jmp .retngetlex
  8248                                  
  8249                                  ;-786   if (digit(c)) { getdigit(c); return T_CONST; }
  8250                                  
  8251                                  .getlex470:
  8252 00003ED0 8A46FE                   mov al, byte [bp-2]
  8253 00003ED3 B400                     mov ah, 0
  8254 00003ED5 50                       push ax
  8255 00003ED6 E8A3C3                   call digit
  8256 00003ED9 83C402                   add  sp, 2
  8257 00003EDC 08C0                     or  al, al
  8258 00003EDE 0F841200                 je .getlex471
  8259 00003EE2 8A46FE                   mov al, byte [bp-2]
  8260 00003EE5 B400                     mov ah, 0
  8261 00003EE7 50                       push ax
  8262 00003EE8 E89E03                   call getdigit
  8263 00003EEB 83C402                   add  sp, 2
  8264 00003EEE B80101                   mov ax, 257
  8265 00003EF1 E9A002                   jmp .retngetlex
  8266                                  
  8267                                  ;-787   if (c==39) { lexval=next();
  8268                                  
  8269                                  .getlex471:
  8270 00003EF4 8A46FE                   mov al, [bp-2]
  8271 00003EF7 3C27                     cmp al, 39
  8272 00003EF9 0F854F00                 jne .getlex472
  8273 00003EFD E89604                   call next
  8274 00003F00 A3[2E00]                 mov word [lexval], ax
  8275                                  
  8276                                  ;-788     if (lexval==92) {lexval=next();
  8277                                  
  8278 00003F03 A1[2E00]                 mov ax, [lexval]
  8279 00003F06 83F85C                   cmp ax, 92
  8280 00003F09 0F853600                 jne .getlex473
  8281 00003F0D E88604                   call next
  8282 00003F10 A3[2E00]                 mov word [lexval], ax
  8283                                  
  8284                                  ;-789       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;
  8285                                  
  8286 00003F13 A1[2E00]                 mov ax, [lexval]
  8287 00003F16 83F86E                   cmp ax, 110
  8288 00003F19 0F850600                 jne .getlex474
  8289 00003F1D B80A00                   mov ax, 10
  8290 00003F20 A3[2E00]                 mov word [lexval], ax
  8291                                  .getlex474:
  8292 00003F23 A1[2E00]                 mov ax, [lexval]
  8293 00003F26 83F874                   cmp ax, 116
  8294 00003F29 0F850600                 jne .getlex475
  8295 00003F2D B80900                   mov ax, 9
  8296 00003F30 A3[2E00]                 mov word [lexval], ax
  8297                                  
  8298                                  ;-790       if (lexval=='0') lexval= 0; } next(); return T_CONST; }
  8299                                  
  8300                                  .getlex475:
  8301 00003F33 A1[2E00]                 mov ax, [lexval]
  8302 00003F36 83F830                   cmp ax, 48
  8303 00003F39 0F850600                 jne .getlex476
  8304 00003F3D B80000                   mov ax, 0
  8305 00003F40 A3[2E00]                 mov word [lexval], ax
  8306                                  .getlex476:
  8307                                  .getlex473:
  8308 00003F43 E85004                   call next
  8309 00003F46 B80101                   mov ax, 257
  8310 00003F49 E94802                   jmp .retngetlex
  8311                                  
  8312                                  ;-791   if (alnum(c)) { 
  8313                                  
  8314                                  .getlex472:
  8315 00003F4C 8A46FE                   mov al, byte [bp-2]
  8316 00003F4F B400                     mov ah, 0
  8317 00003F51 50                       push ax
  8318 00003F52 E8CFC3                   call alnum
  8319 00003F55 83C402                   add  sp, 2
  8320 00003F58 08C0                     or  al, al
  8321 00003F5A 0F842D02                 je .getlex477
  8322                                  
  8323                                  ;-792     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;
  8324                                  
  8325 00003F5E 8D062B81                 lea  ax, [symbol]
  8326 00003F62 50                       push ax
  8327 00003F63 8D06DCD0                 lea  ax, [symboltemp]
  8328 00003F67 50                       push ax
  8329 00003F68 E8FBC1                   call strcpy
  8330 00003F6B 83C404                   add  sp, 4
  8331 00003F6E B82B81                   mov ax, symbol
  8332 00003F71 8946FC                   mov [bp-4], ax
  8333 00003F74 8A46FE                   mov al, [bp-2]
  8334 00003F77 8B5EFC                   mov  bx, [bp-4]
  8335 00003F7A 8807                     mov  [bx], al
  8336 00003F7C FF46FC                   inc  word[bp-4]
  8337                                  
  8338                                  ;-793     while(alnum(thechar)) {c=next(); *p=c;  p++; } 
  8339                                  
  8340                                  .getlex478:
  8341 00003F7F A0[2100]                 mov al, byte [thechar]
  8342 00003F82 B400                     mov ah, 0
  8343 00003F84 50                       push ax
  8344 00003F85 E89CC3                   call alnum
  8345 00003F88 83C402                   add  sp, 2
  8346 00003F8B 08C0                     or  al, al
  8347 00003F8D 0F841300                 je .getlex479
  8348 00003F91 E80204                   call next
  8349 00003F94 8846FE                   mov [bp-2], al
  8350 00003F97 8A46FE                   mov al, [bp-2]
  8351 00003F9A 8B5EFC                   mov  bx, [bp-4]
  8352 00003F9D 8807                     mov  [bx], al
  8353 00003F9F FF46FC                   inc  word[bp-4]
  8354                                  
  8355                                  ;-794       *p=0;
  8356                                  
  8357 00003FA2 EBDB                     jmp .getlex478
  8358                                  .getlex479:
  8359 00003FA4 B80000                   mov ax, 0
  8360 00003FA7 8B5EFC                   mov  bx, [bp-4]
  8361 00003FAA 8807                     mov  [bx], al
  8362                                  
  8363                                  ;-795     if (eqstr(symbol,"signed"  )) return T_SIGNED;
  8364                                  
  8365 00003FAC 68[AC41]                 push getlex_1
  8366 00003FAF 8D062B81                 lea  ax, [symbol]
  8367 00003FB3 50                       push ax
  8368 00003FB4 E8DFC1                   call eqstr
  8369 00003FB7 83C404                   add  sp, 4
  8370 00003FBA 08C0                     or  al, al
  8371 00003FBC 0F840600                 je .getlex480
  8372 00003FC0 B81302                   mov ax, 531
  8373 00003FC3 E9CE01                   jmp .retngetlex
  8374                                  
  8375                                  ;-796     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;
  8376                                  
  8377                                  .getlex480:
  8378 00003FC6 68[B341]                 push getlex_2
  8379 00003FC9 8D062B81                 lea  ax, [symbol]
  8380 00003FCD 50                       push ax
  8381 00003FCE E8C5C1                   call eqstr
  8382 00003FD1 83C404                   add  sp, 4
  8383 00003FD4 08C0                     or  al, al
  8384 00003FD6 0F840600                 je .getlex481
  8385 00003FDA B81402                   mov ax, 532
  8386 00003FDD E9B401                   jmp .retngetlex
  8387                                  
  8388                                  ;-797     if (eqstr(symbol,"void"    )) return T_VOID;
  8389                                  
  8390                                  .getlex481:
  8391 00003FE0 68[BC41]                 push getlex_3
  8392 00003FE3 8D062B81                 lea  ax, [symbol]
  8393 00003FE7 50                       push ax
  8394 00003FE8 E8ABC1                   call eqstr
  8395 00003FEB 83C404                   add  sp, 4
  8396 00003FEE 08C0                     or  al, al
  8397 00003FF0 0F840600                 je .getlex482
  8398 00003FF4 B81102                   mov ax, 529
  8399 00003FF7 E99A01                   jmp .retngetlex
  8400                                  
  8401                                  ;-798     if (eqstr(symbol,"int"     )) return T_INT;
  8402                                  
  8403                                  .getlex482:
  8404 00003FFA 68[C141]                 push getlex_4
  8405 00003FFD 8D062B81                 lea  ax, [symbol]
  8406 00004001 50                       push ax
  8407 00004002 E891C1                   call eqstr
  8408 00004005 83C404                   add  sp, 4
  8409 00004008 08C0                     or  al, al
  8410 0000400A 0F840600                 je .getlex483
  8411 0000400E B80502                   mov ax, 517
  8412 00004011 E98001                   jmp .retngetlex
  8413                                  
  8414                                  ;-799     if (eqstr(symbol,"long"    )) return T_LONG;
  8415                                  
  8416                                  .getlex483:
  8417 00004014 68[C541]                 push getlex_5
  8418 00004017 8D062B81                 lea  ax, [symbol]
  8419 0000401B 50                       push ax
  8420 0000401C E877C1                   call eqstr
  8421 0000401F 83C404                   add  sp, 4
  8422 00004022 08C0                     or  al, al
  8423 00004024 0F840600                 je .getlex484
  8424 00004028 B81502                   mov ax, 533
  8425 0000402B E96601                   jmp .retngetlex
  8426                                  
  8427                                  ;-800     if (eqstr(symbol,"char"    )) return T_CHAR;
  8428                                  
  8429                                  .getlex484:
  8430 0000402E 68[CA41]                 push getlex_6
  8431 00004031 8D062B81                 lea  ax, [symbol]
  8432 00004035 50                       push ax
  8433 00004036 E85DC1                   call eqstr
  8434 00004039 83C404                   add  sp, 4
  8435 0000403C 08C0                     or  al, al
  8436 0000403E 0F840600                 je .getlex485
  8437 00004042 B81202                   mov ax, 530
  8438 00004045 E94C01                   jmp .retngetlex
  8439                                  
  8440                                  ;-801     if (eqstr(symbol,"asm"     )) return T_ASM;
  8441                                  
  8442                                  .getlex485:
  8443 00004048 68[CF41]                 push getlex_7
  8444 0000404B 8D062B81                 lea  ax, [symbol]
  8445 0000404F 50                       push ax
  8446 00004050 E843C1                   call eqstr
  8447 00004053 83C404                   add  sp, 4
  8448 00004056 08C0                     or  al, al
  8449 00004058 0F840600                 je .getlex486
  8450 0000405C B80602                   mov ax, 518
  8451 0000405F E93201                   jmp .retngetlex
  8452                                  
  8453                                  ;-802     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;
  8454                                  
  8455                                  .getlex486:
  8456 00004062 68[D341]                 push getlex_8
  8457 00004065 8D062B81                 lea  ax, [symbol]
  8458 00004069 50                       push ax
  8459 0000406A E829C1                   call eqstr
  8460 0000406D 83C404                   add  sp, 4
  8461 00004070 08C0                     or  al, al
  8462 00004072 0F840600                 je .getlex487
  8463 00004076 B80702                   mov ax, 519
  8464 00004079 E91801                   jmp .retngetlex
  8465                                  
  8466                                  ;-803     if (eqstr(symbol,"__emit__")) return T_EMIT;
  8467                                  
  8468                                  .getlex487:
  8469 0000407C 68[D941]                 push getlex_9
  8470 0000407F 8D062B81                 lea  ax, [symbol]
  8471 00004083 50                       push ax
  8472 00004084 E80FC1                   call eqstr
  8473 00004087 83C404                   add  sp, 4
  8474 0000408A 08C0                     or  al, al
  8475 0000408C 0F840600                 je .getlex488
  8476 00004090 B80802                   mov ax, 520
  8477 00004093 E9FE00                   jmp .retngetlex
  8478                                  
  8479                                  ;-804     if (eqstr(symbol,"return"  )) return T_RETURN;
  8480                                  
  8481                                  .getlex488:
  8482 00004096 68[E241]                 push getlex_10
  8483 00004099 8D062B81                 lea  ax, [symbol]
  8484 0000409D 50                       push ax
  8485 0000409E E8F5C0                   call eqstr
  8486 000040A1 83C404                   add  sp, 4
  8487 000040A4 08C0                     or  al, al
  8488 000040A6 0F840600                 je .getlex489
  8489 000040AA B80002                   mov ax, 512
  8490 000040AD E9E400                   jmp .retngetlex
  8491                                  
  8492                                  ;-805     if (eqstr(symbol,"if"      )) return T_IF;
  8493                                  
  8494                                  .getlex489:
  8495 000040B0 68[E941]                 push getlex_11
  8496 000040B3 8D062B81                 lea  ax, [symbol]
  8497 000040B7 50                       push ax
  8498 000040B8 E8DBC0                   call eqstr
  8499 000040BB 83C404                   add  sp, 4
  8500 000040BE 08C0                     or  al, al
  8501 000040C0 0F840600                 je .getlex490
  8502 000040C4 B80102                   mov ax, 513
  8503 000040C7 E9CA00                   jmp .retngetlex
  8504                                  
  8505                                  ;-806     if (eqstr(symbol,"else"    )) return T_ELSE;
  8506                                  
  8507                                  .getlex490:
  8508 000040CA 68[EC41]                 push getlex_12
  8509 000040CD 8D062B81                 lea  ax, [symbol]
  8510 000040D1 50                       push ax
  8511 000040D2 E8C1C0                   call eqstr
  8512 000040D5 83C404                   add  sp, 4
  8513 000040D8 08C0                     or  al, al
  8514 000040DA 0F840600                 je .getlex491
  8515 000040DE B80202                   mov ax, 514
  8516 000040E1 E9B000                   jmp .retngetlex
  8517                                  
  8518                                  ;-807     if (eqstr(symbol,"while"   )) return T_WHILE;
  8519                                  
  8520                                  .getlex491:
  8521 000040E4 68[F141]                 push getlex_13
  8522 000040E7 8D062B81                 lea  ax, [symbol]
  8523 000040EB 50                       push ax
  8524 000040EC E8A7C0                   call eqstr
  8525 000040EF 83C404                   add  sp, 4
  8526 000040F2 08C0                     or  al, al
  8527 000040F4 0F840600                 je .getlex492
  8528 000040F8 B80302                   mov ax, 515
  8529 000040FB E99600                   jmp .retngetlex
  8530                                  
  8531                                  ;-808     if (eqstr(symbol,"do"      )) return T_DO;
  8532                                  
  8533                                  .getlex492:
  8534 000040FE 68[F741]                 push getlex_14
  8535 00004101 8D062B81                 lea  ax, [symbol]
  8536 00004105 50                       push ax
  8537 00004106 E88DC0                   call eqstr
  8538 00004109 83C404                   add  sp, 4
  8539 0000410C 08C0                     or  al, al
  8540 0000410E 0F840600                 je .getlex493
  8541 00004112 B80402                   mov ax, 516
  8542 00004115 E97C00                   jmp .retngetlex
  8543                                  
  8544                                  ;-809     if (eqstr(symbol,"goto"    )) return T_GOTO;
  8545                                  
  8546                                  .getlex493:
  8547 00004118 68[FA41]                 push getlex_15
  8548 0000411B 8D062B81                 lea  ax, [symbol]
  8549 0000411F 50                       push ax
  8550 00004120 E873C0                   call eqstr
  8551 00004123 83C404                   add  sp, 4
  8552 00004126 08C0                     or  al, al
  8553 00004128 0F840600                 je .getlex494
  8554 0000412C B80902                   mov ax, 521
  8555 0000412F E96200                   jmp .retngetlex
  8556                                  
  8557                                  ;-810     if (eqstr(symbol,"define"  )) return T_DEFINE;   
  8558                                  
  8559                                  .getlex494:
  8560 00004132 68[FF41]                 push getlex_16
  8561 00004135 8D062B81                 lea  ax, [symbol]
  8562 00004139 50                       push ax
  8563 0000413A E859C0                   call eqstr
  8564 0000413D 83C404                   add  sp, 4
  8565 00004140 08C0                     or  al, al
  8566 00004142 0F840600                 je .getlex495
  8567 00004146 B8FF01                   mov ax, 511
  8568 00004149 E94800                   jmp .retngetlex
  8569                                  
  8570                                  ;-811     if (eqstr(symbol,"include" )) return T_INCLUDE;   
  8571                                  
  8572                                  .getlex495:
  8573 0000414C 68[0642]                 push getlex_17
  8574 0000414F 8D062B81                 lea  ax, [symbol]
  8575 00004153 50                       push ax
  8576 00004154 E83FC0                   call eqstr
  8577 00004157 83C404                   add  sp, 4
  8578 0000415A 08C0                     or  al, al
  8579 0000415C 0F840600                 je .getlex496
  8580 00004160 B8FE01                   mov ax, 510
  8581 00004163 E92E00                   jmp .retngetlex
  8582                                  
  8583                                  ;-812     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}
  8584                                  
  8585                                  .getlex496:
  8586 00004166 E8BF00                   call convertdefine
  8587 00004169 08C0                     or  al, al
  8588 0000416B 0F841600                 je .getlex497
  8589 0000416F 8D06DCD0                 lea  ax, [symboltemp]
  8590 00004173 50                       push ax
  8591 00004174 8D062B81                 lea  ax, [symbol]
  8592 00004178 50                       push ax
  8593 00004179 E8EABF                   call strcpy
  8594 0000417C 83C404                   add  sp, 4
  8595 0000417F B80101                   mov ax, 257
  8596 00004182 E90F00                   jmp .retngetlex
  8597                                  
  8598                                  ;-813     return T_NAME; } error1("Input item not recognized"); }
  8599                                  
  8600                                  .getlex497:
  8601 00004185 B80001                   mov ax, 256
  8602 00004188 E90900                   jmp .retngetlex
  8603                                  .getlex477:
  8604 0000418B 68[0E42]                 push getlex_18
  8605 0000418E E8FC05                   call error1
  8606 00004191 83C402                   add  sp, 2
  8607                                  
  8608                                  ;-814 
  8609                                  
  8610                                  
  8611                                  ;-815 int convertdefine() { int i; int j;   i=0;
  8612                                  
  8613 00004194 C9                       .retngetlex: LEAVE
  8614 00004195 C3                       ret
  8615 00004196 28295B5D7B7D2C3B2A-     getlex_0 db "()[]{},;*:%-><=+!&|#?",0
  8616 0000419F 3A252D3E3C3D2B2126-
  8617 000041A8 7C233F00           
  8618 000041AC 7369676E656400          getlex_1 db "signed",0
  8619 000041B3 756E7369676E656400      getlex_2 db "unsigned",0
  8620 000041BC 766F696400              getlex_3 db "void",0
  8621 000041C1 696E7400                getlex_4 db "int",0
  8622 000041C5 6C6F6E6700              getlex_5 db "long",0
  8623 000041CA 6368617200              getlex_6 db "char",0
  8624 000041CF 61736D00                getlex_7 db "asm",0
  8625 000041D3 5F5F61736D00            getlex_8 db "__asm",0
  8626 000041D9 5F5F656D69745F5F00      getlex_9 db "__emit__",0
  8627 000041E2 72657475726E00          getlex_10 db "return",0
  8628 000041E9 696600                  getlex_11 db "if",0
  8629 000041EC 656C736500              getlex_12 db "else",0
  8630 000041F1 7768696C6500            getlex_13 db "while",0
  8631 000041F7 646F00                  getlex_14 db "do",0
  8632 000041FA 676F746F00              getlex_15 db "goto",0
  8633 000041FF 646566696E6500          getlex_16 db "define",0
  8634 00004206 696E636C75646500        getlex_17 db "include",0
  8635 0000420E 496E70757420697465-     getlex_18 db "Input item not recognized",0
  8636 00004217 6D206E6F7420726563-
  8637 00004220 6F676E697A656400   
  8638                                  ; ENDP
  8639                                  
  8640                                  convertdefine:  ; *** PROC ***
  8641                                  ;Function : convertdefine, Number of local variables: 2
  8642                                  ;   # type sign width addr used name   list of local variables
  8643                                  ;  200 var sign word   815 NULL i = bp-2
  8644                                  ;  201 var sign word   815 NULL j = bp-4;
  8645 00004228 C8040000                 ENTER  4,0
  8646 0000422C B80000                   mov ax, 0
  8647 0000422F 8946FE                   mov [bp-2], ax
  8648                                  
  8649                                  ;-816   while (i < GTop) {
  8650                                  
  8651                                  .convertdefine498:
  8652 00004232 8B46FE                   mov ax, [bp-2]
  8653 00004235 3B06[2A00]               cmp ax, [GTop]
  8654 00004239 0F8D4400                 jge .convertdefine499
  8655                                  
  8656                                  ;-817    j=adrofname(i); 
  8657                                  
  8658 0000423D FF76FE                   push word [bp-2]
  8659 00004240 E891C6                   call adrofname
  8660 00004243 83C402                   add  sp, 2
  8661 00004246 8946FC                   mov [bp-4], ax
  8662                                  
  8663                                  ;-818    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];
  8664                                  
  8665 00004249 FF76FC                   push word [bp-4]
  8666 0000424C 8D062B81                 lea  ax, [symbol]
  8667 00004250 50                       push ax
  8668 00004251 E842BF                   call eqstr
  8669 00004254 83C404                   add  sp, 4
  8670 00004257 08C0                     or  al, al
  8671 00004259 0F841F00                 je .convertdefine500
  8672 0000425D 8B5EFE                   mov bx, [bp-2]
  8673 00004260 8A87B782                 mov al, [GType + bx]
  8674 00004264 3C23                     cmp al, 35
  8675 00004266 0F851200                 jne .convertdefine501
  8676 0000426A 8B5EFE                   mov bx, [bp-2]
  8677 0000426D D1E3                     shl bx, 1
  8678 0000426F 8B87EB8A                 mov ax, [GData + bx]
  8679 00004273 A3[2E00]                 mov word [lexval], ax
  8680                                  
  8681                                  ;-819    return T_CONST; } }
  8682                                  
  8683 00004276 B80101                   mov ax, 257
  8684 00004279 E90B00                   jmp .retnconvertdefine
  8685                                  .convertdefine501:
  8686                                  
  8687                                  ;-820    i++; } 
  8688                                  
  8689                                  .convertdefine500:
  8690 0000427C FF46FE                   inc  word[bp-2]
  8691                                  
  8692                                  ;-821    return 0; }
  8693                                  
  8694 0000427F EBB1                     jmp .convertdefine498
  8695                                  .convertdefine499:
  8696 00004281 B80000                   mov ax, 0
  8697 00004284 E90000                   jmp .retnconvertdefine
  8698                                  
  8699                                  ;-822 int getdigit(char c) { int i;
  8700                                  
  8701 00004287 C9                       .retnconvertdefine: LEAVE
  8702 00004288 C3                       ret
  8703                                  ; ENDP
  8704                                  
  8705                                  getdigit:  ; *** PROC ***
  8706                                  
  8707                                  ;-823     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char
  8708                                  
  8709                                  ;Function : getdigit, Number of local variables: 2
  8710                                  ;   # type sign width addr used name   list of local variables
  8711                                  ;  200 var sign byte   822 NULL c = bp+4
  8712                                  ;  201 var sign word   822 NULL i = bp-2;
  8713 00004289 C8020000                 ENTER  2,0
  8714 0000428D B80000                   mov ax, 0
  8715 00004290 A3[2E00]                 mov word [lexval], ax
  8716 00004293 8A4604                   mov al, [bp+4]
  8717 00004296 2C30                     sub al, 48
  8718 00004298 A3[2E00]                 mov word [lexval], ax
  8719                                  
  8720                                  ;-824     if (thechar=='x') thechar='X'; if (thechar=='X') { next();
  8721                                  
  8722 0000429B A0[2100]                 mov al, [thechar]
  8723 0000429E 3C78                     cmp al, 120
  8724 000042A0 0F850600                 jne .getdigit502
  8725 000042A4 B85800                   mov ax, 88
  8726 000042A7 A2[2100]                 mov byte [thechar], al
  8727                                  .getdigit502:
  8728 000042AA A0[2100]                 mov al, [thechar]
  8729 000042AD 3C58                     cmp al, 88
  8730 000042AF 0F856800                 jne .getdigit503
  8731 000042B3 E8E000                   call next
  8732                                  
  8733                                  ;-825       while(alnum(thechar)) { c=next(); if(c>96) c=c-39;
  8734                                  
  8735                                  .getdigit504:
  8736 000042B6 A0[2100]                 mov al, byte [thechar]
  8737 000042B9 B400                     mov ah, 0
  8738 000042BB 50                       push ax
  8739 000042BC E865C0                   call alnum
  8740 000042BF 83C402                   add  sp, 2
  8741 000042C2 08C0                     or  al, al
  8742 000042C4 0F845000                 je .getdigit505
  8743 000042C8 E8CB00                   call next
  8744 000042CB 884604                   mov [bp+4], al
  8745 000042CE 8A4604                   mov al, [bp+4]
  8746 000042D1 3C60                     cmp al, 96
  8747 000042D3 0F8E0800                 jle .getdigit506
  8748 000042D7 8A4604                   mov al, [bp+4]
  8749 000042DA 2C27                     sub al, 39
  8750 000042DC 884604                   mov [bp+4], al
  8751                                  
  8752                                  ;-826 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16
  8753                                  
  8754                                  .getdigit506:
  8755 000042DF 8A4604                   mov al, [bp+4]
  8756 000042E2 3C40                     cmp al, 64
  8757 000042E4 0F8E0800                 jle .getdigit507
  8758 000042E8 8A4604                   mov al, [bp+4]
  8759 000042EB 2C07                     sub al, 7
  8760 000042ED 884604                   mov [bp+4], al
  8761                                  .getdigit507:
  8762 000042F0 8A4604                   mov al, [bp+4]
  8763 000042F3 2C30                     sub al, 48
  8764 000042F5 884604                   mov [bp+4], al
  8765 000042F8 A1[2E00]                 mov ax, [lexval]
  8766 000042FB C1E004                   shl ax, 4
  8767 000042FE A3[2E00]                 mov word [lexval], ax
  8768                                  
  8769                                  ;-827      i=0; i=c; lexval=lexval+i;}
  8770                                  
  8771 00004301 B80000                   mov ax, 0
  8772 00004304 8946FE                   mov [bp-2], ax
  8773 00004307 8A4604                   mov al, [bp+4]
  8774 0000430A 8946FE                   mov [bp-2], ax
  8775 0000430D A1[2E00]                 mov ax, [lexval]
  8776 00004310 0346FE                   add ax, [bp-2]
  8777 00004313 A3[2E00]                 mov word [lexval], ax
  8778                                  
  8779                                  ;-828     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10; 
  8780                                  
  8781 00004316 EB9E                     jmp .getdigit504
  8782                                  .getdigit505:
  8783 00004318 E94200                   jmp .getdigit508
  8784                                  .getdigit503:
  8785                                  .getdigit509:
  8786 0000431B A0[2100]                 mov al, byte [thechar]
  8787 0000431E B400                     mov ah, 0
  8788 00004320 50                       push ax
  8789 00004321 E858BF                   call digit
  8790 00004324 83C402                   add  sp, 2
  8791 00004327 08C0                     or  al, al
  8792 00004329 0F843000                 je .getdigit510
  8793 0000432D E86600                   call next
  8794 00004330 884604                   mov [bp+4], al
  8795 00004333 8A4604                   mov al, [bp+4]
  8796 00004336 2C30                     sub al, 48
  8797 00004338 884604                   mov [bp+4], al
  8798 0000433B A1[2E00]                 mov ax, [lexval]
  8799 0000433E BB0A00                   mov bx, 10
  8800 00004341 F7E3                     mul bx
  8801 00004343 A3[2E00]                 mov word [lexval], ax
  8802                                  
  8803                                  ;-829      i=0; i=c; lexval=lexval+i; } } 
  8804                                  
  8805 00004346 B80000                   mov ax, 0
  8806 00004349 8946FE                   mov [bp-2], ax
  8807 0000434C 8A4604                   mov al, [bp+4]
  8808 0000434F 8946FE                   mov [bp-2], ax
  8809 00004352 A1[2E00]                 mov ax, [lexval]
  8810 00004355 0346FE                   add ax, [bp-2]
  8811 00004358 A3[2E00]                 mov word [lexval], ax
  8812 0000435B EBBE                     jmp .getdigit509
  8813                                  .getdigit510:
  8814                                  
  8815                                  ;-830 }
  8816                                  
  8817                                  .getdigit508:
  8818                                  
  8819                                  ;-831 int getstring(int delim) {int c; char *p;  p=&symbol; c=next();
  8820 0000435D C9                       LEAVE
  8821 0000435E C3                       ret
  8822                                  ; ENDP
  8823                                  
  8824                                  getstring:  ; *** PROC ***
  8825                                  ;Function : getstring, Number of local variables: 3
  8826                                  ;   # type sign width addr used name   list of local variables
  8827                                  ;  200 var sign word   831 NULL delim = bp+4
  8828                                  ;  201 var sign word   831 NULL c = bp-2
  8829                                  ;  202 ptr sign byte   831 NULL p = bp-4;
  8830 0000435F C8040000                 ENTER  4,0
  8831 00004363 B82B81                   mov ax, symbol
  8832 00004366 8946FC                   mov [bp-4], ax
  8833 00004369 E82A00                   call next
  8834 0000436C 8946FE                   mov [bp-2], ax
  8835                                  
  8836                                  ;-832   while (c != delim) {*p=c; p++; c=next(); } *p=0; }
  8837                                  
  8838                                  .getstring511:
  8839 0000436F 8B46FE                   mov ax, [bp-2]
  8840 00004372 3B4604                   cmp ax, [bp+4]
  8841 00004375 0F841300                 je  .getstring512
  8842 00004379 8B46FE                   mov ax, [bp-2]
  8843 0000437C 8B5EFC                   mov  bx, [bp-4]
  8844 0000437F 8807                     mov  [bx], al
  8845 00004381 FF46FC                   inc  word[bp-4]
  8846 00004384 E80F00                   call next
  8847 00004387 8946FE                   mov [bp-2], ax
  8848 0000438A EBE3                     jmp .getstring511
  8849                                  .getstring512:
  8850 0000438C B80000                   mov ax, 0
  8851 0000438F 8B5EFC                   mov  bx, [bp-4]
  8852 00004392 8807                     mov  [bx], al
  8853                                  
  8854                                  ;-833 
  8855                                  
  8856                                  
  8857                                  ;-834 int next() {char r; r = thechar; globC=r; thechar = fgets1(); return r; }
  8858 00004394 C9                       LEAVE
  8859 00004395 C3                       ret
  8860                                  ; ENDP
  8861                                  
  8862                                  next:  ; *** PROC ***
  8863                                  ;Function : next, Number of local variables: 1
  8864                                  ;   # type sign width addr used name   list of local variables
  8865                                  ;  200 var sign byte   834 NULL r = bp-2;
  8866 00004396 C8020000                 ENTER  2,0
  8867 0000439A A0[2100]                 mov al, [thechar]
  8868 0000439D 8846FE                   mov [bp-2], al
  8869 000043A0 8A46FE                   mov al, [bp-2]
  8870 000043A3 A2[1E00]                 mov byte [globC], al
  8871 000043A6 E8EC02                   call fgets1
  8872 000043A9 A2[2100]                 mov byte [thechar], al
  8873 000043AC 8A46FE                   mov al, [bp-2]
  8874 000043AF E90000                   jmp .retnnext
  8875                                  
  8876                                  ;-835 int istoken(int t) {if (token == t) { token=getlex(); return 1; } return 0;}
  8877                                  
  8878 000043B2 C9                       .retnnext: LEAVE
  8879 000043B3 C3                       ret
  8880                                  ; ENDP
  8881                                  
  8882                                  istoken:  ; *** PROC ***
  8883                                  ;Function : istoken, Number of local variables: 1
  8884                                  ;   # type sign width addr used name   list of local variables
  8885                                  ;  200 var sign word   835 NULL t = bp+4;
  8886 000043B4 C8000000                 ENTER  0,0
  8887 000043B8 A1[1C00]                 mov ax, [token]
  8888 000043BB 3B4604                   cmp ax, [bp+4]
  8889 000043BE 0F850C00                 jne .istoken513
  8890 000043C2 E8CBF8                   call getlex
  8891 000043C5 A3[1C00]                 mov word [token], ax
  8892 000043C8 B80100                   mov ax, 1
  8893 000043CB E90600                   jmp .retnistoken
  8894                                  .istoken513:
  8895 000043CE B80000                   mov ax, 0
  8896 000043D1 E90000                   jmp .retnistoken
  8897                                  
  8898                                  ;-836 int expect(int t) {if (istoken(t)==0) { *cloc=0; prs(co); listproc();
  8899                                  
  8900 000043D4 C9                       .retnistoken: LEAVE
  8901 000043D5 C3                       ret
  8902                                  ; ENDP
  8903                                  
  8904                                  expect:  ; *** PROC ***
  8905                                  ;Function : expect, Number of local variables: 1
  8906                                  ;   # type sign width addr used name   list of local variables
  8907                                  ;  200 var sign word   836 NULL t = bp+4;
  8908 000043D6 C8000000                 ENTER  0,0
  8909 000043DA FF7604                   push word [bp+4]
  8910 000043DD E8D4FF                   call istoken
  8911 000043E0 83C402                   add  sp, 2
  8912 000043E3 83F800                   cmp ax, 0
  8913 000043E6 0F853200                 jne .expect514
  8914 000043EA B80000                   mov ax, 0
  8915 000043ED 8B1E[1600]               mov  bx, [cloc]
  8916 000043F1 8807                     mov  [bx], al
  8917 000043F3 8D063075                 lea  ax, [co]
  8918 000043F7 50                       push ax
  8919 000043F8 E8EE00                   call prs
  8920 000043FB 83C402                   add  sp, 2
  8921 000043FE E88E04                   call listproc
  8922                                  
  8923                                  ;-837   prs("\nExpected ASCII(dez): "); pint1(t); error1(" not found"); } }
  8924                                  
  8925 00004401 68[1E44]                 push expect_0
  8926 00004404 E8E200                   call prs
  8927 00004407 83C402                   add  sp, 2
  8928 0000440A FF7604                   push word [bp+4]
  8929 0000440D E8D001                   call pint1
  8930 00004410 83C402                   add  sp, 2
  8931 00004413 68[3644]                 push expect_1
  8932 00004416 E87403                   call error1
  8933 00004419 83C402                   add  sp, 2
  8934                                  .expect514:
  8935                                  
  8936                                  ;-838 
  8937                                  
  8938                                  
  8939                                  ;-839 int eprc(char c)  {*cloc=c; cloc++; }
  8940 0000441C C9                       LEAVE
  8941 0000441D C3                       ret
  8942 0000441E 5C6E45787065637465-     expect_0 db "\nExpected ASCII(dez): ",0
  8943 00004427 642041534349492864-
  8944 00004430 657A293A2000       
  8945 00004436 206E6F7420666F756E-     expect_1 db " not found",0
  8946 0000443F 6400               
  8947                                  ; ENDP
  8948                                  
  8949                                  eprc:  ; *** PROC ***
  8950                                  ;Function : eprc, Number of local variables: 1
  8951                                  ;   # type sign width addr used name   list of local variables
  8952                                  ;  200 var sign byte   839 NULL c = bp+4;
  8953 00004441 C8000000                 ENTER  0,0
  8954 00004445 8A4604                   mov al, [bp+4]
  8955 00004448 8B1E[1600]               mov  bx, [cloc]
  8956 0000444C 8807                     mov  [bx], al
  8957 0000444E FF06[1600]               inc  word[cloc]
  8958                                  
  8959                                  ;-840 int eprs(char *s) {char c;  while(*s) { c=*s; eprc(c); s++; } }
  8960 00004452 C9                       LEAVE
  8961 00004453 C3                       ret
  8962                                  ; ENDP
  8963                                  
  8964                                  eprs:  ; *** PROC ***
  8965                                  ;Function : eprs, Number of local variables: 2
  8966                                  ;   # type sign width addr used name   list of local variables
  8967                                  ;  200 ptr sign byte   840 NULL s = bp+4
  8968                                  ;  201 var sign byte   840 NULL c = bp-2;
  8969 00004454 C8020000                 ENTER  2,0
  8970                                  .eprs515:
  8971 00004458 8B5E04                   mov bx, [bp+4]
  8972 0000445B 8A07                     mov al, [bx]
  8973 0000445D B400                     mov ah, 0
  8974 0000445F 08C0                     or  al, al
  8975 00004461 0F841B00                 je .eprs516
  8976 00004465 8B5E04                   mov bx, [bp+4]
  8977 00004468 8A07                     mov al, [bx]
  8978 0000446A B400                     mov ah, 0
  8979 0000446C 8846FE                   mov [bp-2], al
  8980 0000446F 8A46FE                   mov al, byte [bp-2]
  8981 00004472 B400                     mov ah, 0
  8982 00004474 50                       push ax
  8983 00004475 E8C9FF                   call eprc
  8984 00004478 83C402                   add  sp, 2
  8985 0000447B FF4604                   inc  word[bp+4]
  8986 0000447E EBD8                     jmp .eprs515
  8987                                  .eprs516:
  8988                                  
  8989                                  ;-841 int prc(unsigned char c) { 
  8990 00004480 C9                       LEAVE
  8991 00004481 C3                       ret
  8992                                  ; ENDP
  8993                                  
  8994                                  prc:  ; *** PROC ***
  8995                                  
  8996                                  ;-842   if (c==10) {_AX=13; writetty(); }
  8997                                  
  8998                                  ;Function : prc, Number of local variables: 1
  8999                                  ;   # type sign width addr used name   list of local variables
  9000                                  ;  200 var unsg byte   841 NULL c = bp+4;
  9001 00004482 C8000000                 ENTER  0,0
  9002 00004486 8A4604                   mov al, [bp+4]
  9003 00004489 3C0A                     cmp al, 10
  9004 0000448B 0F850600                 jne .prc517
  9005 0000448F B80D00                   mov  ax, 13
  9006 00004492 E8DEBB                   call writetty
  9007                                  
  9008                                  ;-843   _AL=c; writetty(); 
  9009                                  
  9010                                  .prc517:
  9011 00004495 8A4604                   mov  al, [bp+4]
  9012 00004498 E8D8BB                   call writetty
  9013                                  
  9014                                  ;-844   fputcR(c, fdout); 
  9015                                  
  9016 0000449B FF36[1A00]               push word [fdout]
  9017 0000449F 8A4604                   mov al, byte [bp+4]
  9018 000044A2 B400                     mov ah, 0
  9019 000044A4 50                       push ax
  9020 000044A5 E881BC                   call fputcR
  9021 000044A8 83C404                   add  sp, 4
  9022                                  
  9023                                  ;-845   }
  9024                                  
  9025                                  
  9026                                  ;-846 int prscomment(unsigned char *s) {unsigned char c;
  9027 000044AB C9                       LEAVE
  9028 000044AC C3                       ret
  9029                                  ; ENDP
  9030                                  
  9031                                  prscomment:  ; *** PROC ***
  9032                                  
  9033                                  ;-847   while(*s){c=*s;prc(c);s++;} }
  9034                                  
  9035                                  ;Function : prscomment, Number of local variables: 2
  9036                                  ;   # type sign width addr used name   list of local variables
  9037                                  ;  200 ptr unsg byte   846 NULL s = bp+4
  9038                                  ;  201 var unsg byte   846 NULL c = bp-2;
  9039 000044AD C8020000                 ENTER  2,0
  9040                                  .prscomment518:
  9041 000044B1 8B5E04                   mov bx, [bp+4]
  9042 000044B4 8A07                     mov al, [bx]
  9043 000044B6 B400                     mov ah, 0
  9044 000044B8 08C0                     or  al, al
  9045 000044BA 0F841B00                 je .prscomment519
  9046 000044BE 8B5E04                   mov bx, [bp+4]
  9047 000044C1 8A07                     mov al, [bx]
  9048 000044C3 B400                     mov ah, 0
  9049 000044C5 8846FE                   mov [bp-2], al
  9050 000044C8 8A46FE                   mov al, byte [bp-2]
  9051 000044CB B400                     mov ah, 0
  9052 000044CD 50                       push ax
  9053 000044CE E8B1FF                   call prc
  9054 000044D1 83C402                   add  sp, 2
  9055 000044D4 FF4604                   inc  word[bp+4]
  9056 000044D7 EBD8                     jmp .prscomment518
  9057                                  .prscomment519:
  9058                                  
  9059                                  ;-848 int prnl() { prs("\n ");}
  9060 000044D9 C9                       LEAVE
  9061 000044DA C3                       ret
  9062                                  ; ENDP
  9063                                  
  9064                                  prnl:  ; *** PROC ***
  9065 000044DB 68[E544]                 push prnl_0
  9066 000044DE E80800                   call prs
  9067 000044E1 83C402                   add  sp, 2
  9068                                  
  9069                                  ;-849 
  9070                                  
  9071                                  
  9072                                  ;-850 int prs(unsigned char *s) {unsigned char c; int com; com=0;
  9073                                  
  9074 000044E4 C3                       ret
  9075 000044E5 5C6E2000                prnl_0 db "\n ",0
  9076                                  ; ENDP
  9077                                  
  9078                                  prs:  ; *** PROC ***
  9079                                  ;Function : prs, Number of local variables: 3
  9080                                  ;   # type sign width addr used name   list of local variables
  9081                                  ;  200 ptr unsg byte   850 NULL s = bp+4
  9082                                  ;  201 var unsg byte   850 NULL c = bp-2
  9083                                  ;  202 var sign word   850 NULL com = bp-4;
  9084 000044E9 C8040000                 ENTER  4,0
  9085 000044ED B80000                   mov ax, 0
  9086 000044F0 8946FC                   mov [bp-4], ax
  9087                                  
  9088                                  ;-851   while(*s) { c=*s; if (c==34) if (com) com=0; else com=1;
  9089                                  
  9090                                  .prs520:
  9091 000044F3 8B5E04                   mov bx, [bp+4]
  9092 000044F6 8A07                     mov al, [bx]
  9093 000044F8 B400                     mov ah, 0
  9094 000044FA 08C0                     or  al, al
  9095 000044FC 0F847B00                 je .prs521
  9096 00004500 8B5E04                   mov bx, [bp+4]
  9097 00004503 8A07                     mov al, [bx]
  9098 00004505 B400                     mov ah, 0
  9099 00004507 8846FE                   mov [bp-2], al
  9100 0000450A 8A46FE                   mov al, [bp-2]
  9101 0000450D 3C22                     cmp al, 34
  9102 0000450F 0F851800                 jne .prs522
  9103 00004513 8B46FC                   mov ax, [bp-4]
  9104 00004516 08C0                     or  al, al
  9105 00004518 0F840900                 je .prs523
  9106 0000451C B80000                   mov ax, 0
  9107 0000451F 8946FC                   mov [bp-4], ax
  9108 00004522 E90600                   jmp .prs524
  9109                                  .prs523:
  9110 00004525 B80100                   mov ax, 1
  9111 00004528 8946FC                   mov [bp-4], ax
  9112                                  
  9113                                  ;-852     if (c==92) { if (com==0) { s++; c=*s;
  9114                                  
  9115                                  .prs524:
  9116                                  .prs522:
  9117 0000452B 8A46FE                   mov al, [bp-2]
  9118 0000452E 3C5C                     cmp al, 92
  9119 00004530 0F853500                 jne .prs525
  9120 00004534 8B46FC                   mov ax, [bp-4]
  9121 00004537 83F800                   cmp ax, 0
  9122 0000453A 0F852B00                 jne .prs526
  9123 0000453E FF4604                   inc  word[bp+4]
  9124 00004541 8B5E04                   mov bx, [bp+4]
  9125 00004544 8A07                     mov al, [bx]
  9126 00004546 B400                     mov ah, 0
  9127 00004548 8846FE                   mov [bp-2], al
  9128                                  
  9129                                  ;-853           if (c=='n') c=10; if (c=='t') c= 9;
  9130                                  
  9131 0000454B 8A46FE                   mov al, [bp-2]
  9132 0000454E 3C6E                     cmp al, 110
  9133 00004550 0F850600                 jne .prs527
  9134 00004554 B80A00                   mov ax, 10
  9135 00004557 8846FE                   mov [bp-2], al
  9136                                  .prs527:
  9137 0000455A 8A46FE                   mov al, [bp-2]
  9138 0000455D 3C74                     cmp al, 116
  9139 0000455F 0F850600                 jne .prs528
  9140 00004563 B80900                   mov ax, 9
  9141 00004566 8846FE                   mov [bp-2], al
  9142                                  
  9143                                  ;-854     } } prc(c); s++;  } }
  9144                                  
  9145                                  .prs528:
  9146                                  .prs526:
  9147                                  .prs525:
  9148 00004569 8A46FE                   mov al, byte [bp-2]
  9149 0000456C B400                     mov ah, 0
  9150 0000456E 50                       push ax
  9151 0000456F E810FF                   call prc
  9152 00004572 83C402                   add  sp, 2
  9153 00004575 FF4604                   inc  word[bp+4]
  9154 00004578 E978FF                   jmp .prs520
  9155                                  .prs521:
  9156                                  
  9157                                  ;-855 int eprnum(int n){int e; if(n<0) { eprc('-'); n=mkneg(n); }
  9158 0000457B C9                       LEAVE
  9159 0000457C C3                       ret
  9160                                  ; ENDP
  9161                                  
  9162                                  eprnum:  ; *** PROC ***
  9163                                  ;Function : eprnum, Number of local variables: 2
  9164                                  ;   # type sign width addr used name   list of local variables
  9165                                  ;  200 var sign word   855 NULL n = bp+4
  9166                                  ;  201 var sign word   855 NULL e = bp-2;
  9167 0000457D C8020000                 ENTER  2,0
  9168 00004581 8B4604                   mov ax, [bp+4]
  9169 00004584 83F800                   cmp ax, 0
  9170 00004587 0F8D1400                 jge .eprnum529
  9171 0000458B 6A2D                     push 45
  9172 0000458D E8B1FE                   call eprc
  9173 00004590 83C402                   add  sp, 2
  9174 00004593 FF7604                   push word [bp+4]
  9175 00004596 E829BB                   call mkneg
  9176 00004599 83C402                   add  sp, 2
  9177 0000459C 894604                   mov [bp+4], ax
  9178                                  
  9179                                  ;-856   if (n >= 10) {e=n/10; eprnum(e);}  n=n%10; n=n+'0'; eprc(n); }
  9180                                  
  9181                                  .eprnum529:
  9182 0000459F 8B4604                   mov ax, [bp+4]
  9183 000045A2 83F80A                   cmp ax, 10 ;unsigned : 1
  9184 000045A5 0F8C1500                 jl  .eprnum530
  9185 000045A9 8B4604                   mov ax, [bp+4]
  9186 000045AC BB0A00                   mov bx, 10
  9187 000045AF 99                       cwd
  9188 000045B0 F7FB                     idiv bx
  9189 000045B2 8946FE                   mov [bp-2], ax
  9190 000045B5 FF76FE                   push word [bp-2]
  9191 000045B8 E8C2FF                   call eprnum
  9192 000045BB 83C402                   add  sp, 2
  9193                                  .eprnum530:
  9194 000045BE 8B4604                   mov ax, [bp+4]
  9195 000045C1 BB0A00                   mov bx, 10
  9196 000045C4 99                       cwd
  9197 000045C5 F7FB                     idiv bx
  9198 000045C7 89D0                     mov ax, dx
  9199 000045C9 894604                   mov [bp+4], ax
  9200 000045CC 8B4604                   mov ax, [bp+4]
  9201 000045CF 83C030                   add ax, 48
  9202 000045D2 894604                   mov [bp+4], ax
  9203 000045D5 FF7604                   push word [bp+4]
  9204 000045D8 E866FE                   call eprc
  9205 000045DB 83C402                   add  sp, 2
  9206                                  
  9207                                  ;-857 int pint1 (int n){int e; if(n<0) {  prc('-');  n=mkneg(n); }
  9208 000045DE C9                       LEAVE
  9209 000045DF C3                       ret
  9210                                  ; ENDP
  9211                                  
  9212                                  pint1:  ; *** PROC ***
  9213                                  ;Function : pint1, Number of local variables: 2
  9214                                  ;   # type sign width addr used name   list of local variables
  9215                                  ;  200 var sign word   857 NULL n = bp+4
  9216                                  ;  201 var sign word   857 NULL e = bp-2;
  9217 000045E0 C8020000                 ENTER  2,0
  9218 000045E4 8B4604                   mov ax, [bp+4]
  9219 000045E7 83F800                   cmp ax, 0
  9220 000045EA 0F8D1400                 jge .pint1531
  9221 000045EE 6A2D                     push 45
  9222 000045F0 E88FFE                   call prc
  9223 000045F3 83C402                   add  sp, 2
  9224 000045F6 FF7604                   push word [bp+4]
  9225 000045F9 E8C6BA                   call mkneg
  9226 000045FC 83C402                   add  sp, 2
  9227 000045FF 894604                   mov [bp+4], ax
  9228                                  
  9229                                  ;-858   if (n >= 10) {e=n/10;  pint1(e);}  n=n%10; n += '0'; prc(n); }
  9230                                  
  9231                                  .pint1531:
  9232 00004602 8B4604                   mov ax, [bp+4]
  9233 00004605 83F80A                   cmp ax, 10 ;unsigned : 1
  9234 00004608 0F8C1500                 jl  .pint1532
  9235 0000460C 8B4604                   mov ax, [bp+4]
  9236 0000460F BB0A00                   mov bx, 10
  9237 00004612 99                       cwd
  9238 00004613 F7FB                     idiv bx
  9239 00004615 8946FE                   mov [bp-2], ax
  9240 00004618 FF76FE                   push word [bp-2]
  9241 0000461B E8C2FF                   call pint1
  9242 0000461E 83C402                   add  sp, 2
  9243                                  .pint1532:
  9244 00004621 8B4604                   mov ax, [bp+4]
  9245 00004624 BB0A00                   mov bx, 10
  9246 00004627 99                       cwd
  9247 00004628 F7FB                     idiv bx
  9248 0000462A 89D0                     mov ax, dx
  9249 0000462C 894604                   mov [bp+4], ax
  9250 0000462F 83460430                 add  word[bp+4], 48
  9251 00004633 FF7604                   push word [bp+4]
  9252 00004636 E849FE                   call prc
  9253 00004639 83C402                   add  sp, 2
  9254                                  
  9255                                  ;-859 int printint51(unsigned int j)  {
  9256 0000463C C9                       LEAVE
  9257 0000463D C3                       ret
  9258                                  ; ENDP
  9259                                  
  9260                                  printint51:  ; *** PROC ***
  9261                                  
  9262                                  ;-860   if (j<10000) prc(32); if (j<1000) prc(32);  if (j<100) prc(32);
  9263                                  
  9264                                  ;Function : printint51, Number of local variables: 1
  9265                                  ;   # type sign width addr used name   list of local variables
  9266                                  ;  200 var unsg word   859 NULL j = bp+4;
  9267 0000463E C8000000                 ENTER  0,0
  9268 00004642 8B4604                   mov ax, [bp+4]
  9269 00004645 3D1027                   cmp ax, 10000
  9270 00004648 0F8D0800                 jge .printint51533
  9271 0000464C 6A20                     push 32
  9272 0000464E E831FE                   call prc
  9273 00004651 83C402                   add  sp, 2
  9274                                  .printint51533:
  9275 00004654 8B4604                   mov ax, [bp+4]
  9276 00004657 3DE803                   cmp ax, 1000
  9277 0000465A 0F8D0800                 jge .printint51534
  9278 0000465E 6A20                     push 32
  9279 00004660 E81FFE                   call prc
  9280 00004663 83C402                   add  sp, 2
  9281                                  .printint51534:
  9282 00004666 8B4604                   mov ax, [bp+4]
  9283 00004669 83F864                   cmp ax, 100
  9284 0000466C 0F8D0800                 jge .printint51535
  9285 00004670 6A20                     push 32
  9286 00004672 E80DFE                   call prc
  9287 00004675 83C402                   add  sp, 2
  9288                                  
  9289                                  ;-861    if (j<10) prc(32);  pint1(j); }
  9290                                  
  9291                                  .printint51535:
  9292 00004678 8B4604                   mov ax, [bp+4]
  9293 0000467B 83F80A                   cmp ax, 10
  9294 0000467E 0F8D0800                 jge .printint51536
  9295 00004682 6A20                     push 32
  9296 00004684 E8FBFD                   call prc
  9297 00004687 83C402                   add  sp, 2
  9298                                  .printint51536:
  9299 0000468A FF7604                   push word [bp+4]
  9300 0000468D E850FF                   call pint1
  9301 00004690 83C402                   add  sp, 2
  9302                                  
  9303                                  ;-862 
  9304                                  
  9305                                  
  9306                                  ;-863 int fgets1() { char c; c=*fgetsp;
  9307 00004693 C9                       LEAVE
  9308 00004694 C3                       ret
  9309                                  ; ENDP
  9310                                  
  9311                                  fgets1:  ; *** PROC ***
  9312                                  ;Function : fgets1, Number of local variables: 1
  9313                                  ;   # type sign width addr used name   list of local variables
  9314                                  ;  200 var sign byte   863 NULL c = bp-2;
  9315 00004695 C8020000                 ENTER  2,0
  9316 00004699 8B1E[6200]               mov bx, [fgetsp]
  9317 0000469D 8A07                     mov al, [bx]
  9318 0000469F B400                     mov ah, 0
  9319 000046A1 8846FE                   mov [bp-2], al
  9320                                  
  9321                                  ;-864   if (c==0) { printinputline(); if (DOS_NoBytes == 0) return 0;
  9322                                  
  9323 000046A4 8A46FE                   mov al, [bp-2]
  9324 000046A7 3C00                     cmp al, 0
  9325 000046A9 0F852A00                 jne .fgets1537
  9326 000046AD E83700                   call printinputline
  9327 000046B0 A1[7000]                 mov ax, [DOS_NoBytes]
  9328 000046B3 83F800                   cmp ax, 0
  9329 000046B6 0F850600                 jne .fgets1538
  9330 000046BA B80000                   mov ax, 0
  9331 000046BD E92500                   jmp .retnfgets1
  9332                                  
  9333                                  ;-865     fgetsp=&fgetsdest; c=*fgetsp; spalte=0; }
  9334                                  
  9335                                  .fgets1538:
  9336 000046C0 B80FD0                   mov ax, fgetsdest
  9337 000046C3 A3[6200]                 mov word [fgetsp], ax
  9338 000046C6 8B1E[6200]               mov bx, [fgetsp]
  9339 000046CA 8A07                     mov al, [bx]
  9340 000046CC B400                     mov ah, 0
  9341 000046CE 8846FE                   mov [bp-2], al
  9342 000046D1 B80000                   mov ax, 0
  9343 000046D4 A3[1F00]                 mov word [spalte], ax
  9344                                  
  9345                                  ;-866   fgetsp++; spalte++;  return c; }
  9346                                  
  9347                                  .fgets1537:
  9348 000046D7 FF06[6200]               inc  word[fgetsp]
  9349 000046DB FF06[1F00]               inc  word[spalte]
  9350 000046DF 8A46FE                   mov al, [bp-2]
  9351 000046E2 E90000                   jmp .retnfgets1
  9352                                  
  9353                                  ;-867 int printinputline() { fgetsp=&fgetsdest;
  9354                                  
  9355 000046E5 C9                       .retnfgets1: LEAVE
  9356 000046E6 C3                       ret
  9357                                  ; ENDP
  9358                                  
  9359                                  printinputline:  ; *** PROC ***
  9360 000046E7 B80FD0                   mov ax, fgetsdest
  9361 000046EA A3[6200]                 mov word [fgetsp], ax
  9362                                  
  9363                                  ;-868   do {DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);
  9364                                  
  9365                                  .printinputline539:
  9366 000046ED 6A01                     push 1
  9367 000046EF FF36[1800]               push word [fdin]
  9368 000046F3 8D06[7200]               lea  ax, [DOS_ByteRead]
  9369 000046F7 50                       push ax
  9370 000046F8 E819BA                   call readRL
  9371 000046FB 83C406                   add  sp, 6
  9372 000046FE A3[7000]                 mov word [DOS_NoBytes], ax
  9373                                  
  9374                                  ;-869   if (DOS_NoBytes == 0) return; 
  9375                                  
  9376 00004701 A1[7000]                 mov ax, [DOS_NoBytes]
  9377 00004704 83F800                   cmp ax, 0
  9378 00004707 0F850300                 jne .printinputline540
  9379 0000470B E95400                   jmp .retnprintinputline
  9380                                  
  9381                                  ;-870     *fgetsp=DOS_ByteRead; fgetsp++;} 
  9382                                  
  9383                                  .printinputline540:
  9384 0000470E A0[7200]                 mov al, [DOS_ByteRead]
  9385 00004711 8B1E[6200]               mov  bx, [fgetsp]
  9386 00004715 8807                     mov  [bx], al
  9387 00004717 FF06[6200]               inc  word[fgetsp]
  9388                                  
  9389                                  ;-871   while (DOS_ByteRead != 10); *fgetsp=0;
  9390                                  
  9391 0000471B A0[7200]                 mov al, [DOS_ByteRead]
  9392 0000471E 3C0A                     cmp al, 10
  9393 00004720 0F840200                 je  .printinputline541
  9394 00004724 EBC7                     jmp .printinputline539
  9395                                  .printinputline541:
  9396 00004726 B80000                   mov ax, 0
  9397 00004729 8B1E[6200]               mov  bx, [fgetsp]
  9398 0000472D 8807                     mov  [bx], al
  9399                                  
  9400                                  ;-872     if (fdout) { prs("\n\n;-"); pint1(lineno); prc(' '); lineno++;
  9401                                  
  9402 0000472F A1[1A00]                 mov ax, [fdout]
  9403 00004732 08C0                     or  al, al
  9404 00004734 0F842A00                 je .printinputline542
  9405 00004738 68[6347]                 push printinputline_0
  9406 0000473B E8ABFD                   call prs
  9407 0000473E 83C402                   add  sp, 2
  9408 00004741 FF36[6600]               push word [lineno]
  9409 00004745 E898FE                   call pint1
  9410 00004748 83C402                   add  sp, 2
  9411 0000474B 6A20                     push 32
  9412 0000474D E832FD                   call prc
  9413 00004750 83C402                   add  sp, 2
  9414 00004753 FF06[6600]               inc  word[lineno]
  9415                                  
  9416                                  ;-873       prscomment(&fgetsdest);}
  9417                                  
  9418 00004757 8D060FD0                 lea  ax, [fgetsdest]
  9419 0000475B 50                       push ax
  9420 0000475C E84EFD                   call prscomment
  9421 0000475F 83C402                   add  sp, 2
  9422                                  
  9423                                  ;-874 }
  9424                                  
  9425                                  .printinputline542:
  9426                                  
  9427                                  ;-875 int end1(int n) {fcloseR(fdin); fcloseR(fdout); exitR(n); }
  9428                                  
  9429                                   .retnprintinputline:
  9430 00004762 C3                       ret
  9431 00004763 5C6E5C6E3B2D00          printinputline_0 db "\n\n;-",0
  9432                                  ; ENDP
  9433                                  
  9434                                  end1:  ; *** PROC ***
  9435                                  ;Function : end1, Number of local variables: 1
  9436                                  ;   # type sign width addr used name   list of local variables
  9437                                  ;  200 var sign word   875 NULL n = bp+4;
  9438 0000476A C8000000                 ENTER  0,0
  9439 0000476E FF36[1800]               push word [fdin]
  9440 00004772 E882B9                   call fcloseR
  9441 00004775 83C402                   add  sp, 2
  9442 00004778 FF36[1A00]               push word [fdout]
  9443 0000477C E878B9                   call fcloseR
  9444 0000477F 83C402                   add  sp, 2
  9445 00004782 FF7604                   push word [bp+4]
  9446 00004785 E87EB9                   call exitR
  9447 00004788 83C402                   add  sp, 2
  9448                                  
  9449                                  ;-876 int error1(char *s) { 
  9450 0000478B C9                       LEAVE
  9451 0000478C C3                       ret
  9452                                  ; ENDP
  9453                                  
  9454                                  error1:  ; *** PROC ***
  9455                                  
  9456                                  ;-877   lineno--;
  9457                                  
  9458                                  ;Function : error1, Number of local variables: 1
  9459                                  ;   # type sign width addr used name   list of local variables
  9460                                  ;  200 ptr sign byte   876 NULL s = bp+4;
  9461 0000478D C8000000                 ENTER  0,0
  9462 00004791 FF0E[6600]               dec  word[lineno]
  9463                                  
  9464                                  ;-878   prnl(); prscomment(&fgetsdest);
  9465                                  
  9466 00004795 E843FD                   call prnl
  9467 00004798 8D060FD0                 lea  ax, [fgetsdest]
  9468 0000479C 50                       push ax
  9469 0000479D E80DFD                   call prscomment
  9470 000047A0 83C402                   add  sp, 2
  9471                                  
  9472                                  ;-879   prs(";Line: "); pint1(lineno);
  9473                                  
  9474 000047A3 68[3648]                 push error1_0
  9475 000047A6 E840FD                   call prs
  9476 000047A9 83C402                   add  sp, 2
  9477 000047AC FF36[6600]               push word [lineno]
  9478 000047B0 E82DFE                   call pint1
  9479 000047B3 83C402                   add  sp, 2
  9480                                  
  9481                                  ;-880   prs(" ************** ERROR: "); prs(s);
  9482                                  
  9483 000047B6 68[3E48]                 push error1_1
  9484 000047B9 E82DFD                   call prs
  9485 000047BC 83C402                   add  sp, 2
  9486 000047BF FF7604                   push word [bp+4]
  9487 000047C2 E824FD                   call prs
  9488 000047C5 83C402                   add  sp, 2
  9489                                  
  9490                                  ;-881   prs("  in column: "); pint1(spalte);
  9491                                  
  9492 000047C8 68[5648]                 push error1_2
  9493 000047CB E81BFD                   call prs
  9494 000047CE 83C402                   add  sp, 2
  9495 000047D1 FF36[1F00]               push word [spalte]
  9496 000047D5 E808FE                   call pint1
  9497 000047D8 83C402                   add  sp, 2
  9498                                  
  9499                                  ;-882   prs("\nToken: "); pint1(token); prs(", globC: "); prc(globC);
  9500                                  
  9501 000047DB 68[6448]                 push error1_3
  9502 000047DE E808FD                   call prs
  9503 000047E1 83C402                   add  sp, 2
  9504 000047E4 FF36[1C00]               push word [token]
  9505 000047E8 E8F5FD                   call pint1
  9506 000047EB 83C402                   add  sp, 2
  9507 000047EE 68[6E48]                 push error1_4
  9508 000047F1 E8F5FC                   call prs
  9509 000047F4 83C402                   add  sp, 2
  9510 000047F7 A0[1E00]                 mov al, byte [globC]
  9511 000047FA B400                     mov ah, 0
  9512 000047FC 50                       push ax
  9513 000047FD E882FC                   call prc
  9514 00004800 83C402                   add  sp, 2
  9515                                  
  9516                                  ;-883   prs(", thechar: "); pint1(thechar); prs(", symbol: "); prs(symbol);
  9517                                  
  9518 00004803 68[7848]                 push error1_5
  9519 00004806 E8E0FC                   call prs
  9520 00004809 83C402                   add  sp, 2
  9521 0000480C A0[2100]                 mov al, byte [thechar]
  9522 0000480F B400                     mov ah, 0
  9523 00004811 50                       push ax
  9524 00004812 E8CBFD                   call pint1
  9525 00004815 83C402                   add  sp, 2
  9526 00004818 68[8448]                 push error1_6
  9527 0000481B E8CBFC                   call prs
  9528 0000481E 83C402                   add  sp, 2
  9529 00004821 8D062B81                 lea  ax, [symbol]
  9530 00004825 50                       push ax
  9531 00004826 E8C0FC                   call prs
  9532 00004829 83C402                   add  sp, 2
  9533                                  
  9534                                  ;-884   end1(1); }
  9535                                  
  9536 0000482C 6A01                     push 1
  9537 0000482E E839FF                   call end1
  9538 00004831 83C402                   add  sp, 2
  9539                                  
  9540                                  ;-885 int listproc() {int i; 
  9541 00004834 C9                       LEAVE
  9542 00004835 C3                       ret
  9543 00004836 3B4C696E653A2000        error1_0 db ";Line: ",0
  9544 0000483E 202A2A2A2A2A2A2A2A-     error1_1 db " ************** ERROR: ",0
  9545 00004847 2A2A2A2A2A2A204552-
  9546 00004850 524F523A2000       
  9547 00004856 2020696E20636F6C75-     error1_2 db "  in column: ",0
  9548 0000485F 6D6E3A2000         
  9549 00004864 5C6E546F6B656E3A20-     error1_3 db "\nToken: ",0
  9550 0000486D 00                 
  9551 0000486E 2C20676C6F62433A20-     error1_4 db ", globC: ",0
  9552 00004877 00                 
  9553 00004878 2C2074686563686172-     error1_5 db ", thechar: ",0
  9554 00004881 3A2000             
  9555 00004884 2C2073796D626F6C3A-     error1_6 db ", symbol: ",0
  9556 0000488D 2000               
  9557                                  ; ENDP
  9558                                  
  9559                                  listproc:  ; *** PROC ***
  9560                                  
  9561                                  ;-886   if (LTop > LSTART) {
  9562                                  
  9563                                  ;Function : listproc, Number of local variables: 1
  9564                                  ;   # type sign width addr used name   list of local variables
  9565                                  ;  200 var sign word   885 NULL i = bp-2;
  9566 0000488F C8020000                 ENTER  2,0
  9567 00004893 A1[2C00]                 mov ax, [LTop]
  9568 00004896 3DC800                   cmp ax, 200
  9569 00004899 0F8E5700                 jle .listproc543
  9570                                  
  9571                                  ;-887   prs("\n;Function : "); prs(fname);
  9572                                  
  9573 0000489D 68[F648]                 push listproc_0
  9574 000048A0 E846FC                   call prs
  9575 000048A3 83C402                   add  sp, 2
  9576 000048A6 8D06AB81                 lea  ax, [fname]
  9577 000048AA 50                       push ax
  9578 000048AB E83BFC                   call prs
  9579 000048AE 83C402                   add  sp, 2
  9580                                  
  9581                                  ;-888   prs(", Number of local variables: "); i=LTop - LSTART; pint1(i);
  9582                                  
  9583 000048B1 68[0549]                 push listproc_1
  9584 000048B4 E832FC                   call prs
  9585 000048B7 83C402                   add  sp, 2
  9586 000048BA A1[2C00]                 mov ax, [LTop]
  9587 000048BD 2DC800                   sub ax, 200
  9588 000048C0 8946FE                   mov [bp-2], ax
  9589 000048C3 FF76FE                   push word [bp-2]
  9590 000048C6 E817FD                   call pint1
  9591 000048C9 83C402                   add  sp, 2
  9592                                  
  9593                                  ;-889   prs("\n;   # type sign width addr used name   list of local variables");
  9594                                  
  9595 000048CC 68[2349]                 push listproc_2
  9596 000048CF E817FC                   call prs
  9597 000048D2 83C402                   add  sp, 2
  9598                                  
  9599                                  ;-890     i=LSTART; 
  9600                                  
  9601 000048D5 B8C800                   mov ax, 200
  9602 000048D8 8946FE                   mov [bp-2], ax
  9603                                  
  9604                                  ;-891     while (i < LTop) { listvar(i); i++; } } 
  9605                                  
  9606                                  .listproc544:
  9607 000048DB 8B46FE                   mov ax, [bp-2]
  9608 000048DE 3B06[2C00]               cmp ax, [LTop]
  9609 000048E2 0F8D0E00                 jge .listproc545
  9610 000048E6 FF76FE                   push word [bp-2]
  9611 000048E9 E87800                   call listvar
  9612 000048EC 83C402                   add  sp, 2
  9613 000048EF FF46FE                   inc  word[bp-2]
  9614 000048F2 EBE7                     jmp .listproc544
  9615                                  .listproc545:
  9616                                  
  9617                                  ;-892 }
  9618                                  
  9619                                  .listproc543:
  9620                                  
  9621                                  ;-893 int listvar(unsigned int i) {unsigned int j; char c;
  9622 000048F4 C9                       LEAVE
  9623 000048F5 C3                       ret
  9624 000048F6 5C6E3B46756E637469-     listproc_0 db "\n;Function : ",0
  9625 000048FF 6F6E203A2000       
  9626 00004905 2C204E756D62657220-     listproc_1 db ", Number of local variables: ",0
  9627 0000490E 6F66206C6F63616C20-
  9628 00004917 7661726961626C6573-
  9629 00004920 3A2000             
  9630 00004923 5C6E3B202020232074-     listproc_2 db "\n;   # type sign width addr used name   list of local variables",0
  9631 0000492C 797065207369676E20-
  9632 00004935 776964746820616464-
  9633 0000493E 722075736564206E61-
  9634 00004947 6D652020206C697374-
  9635 00004950 206F66206C6F63616C-
  9636 00004959 207661726961626C65-
  9637 00004962 7300               
  9638                                  ; ENDP
  9639                                  
  9640                                  listvar:  ; *** PROC ***
  9641                                  
  9642                                  ;-894   prs("\n;"); printint51(i); prc(32);
  9643                                  
  9644                                  ;Function : listvar, Number of local variables: 3
  9645                                  ;   # type sign width addr used name   list of local variables
  9646                                  ;  200 var unsg word   893 NULL i = bp+4
  9647                                  ;  201 var unsg word   893 NULL j = bp-2
  9648                                  ;  202 var sign byte   893 NULL c = bp-4;
  9649 00004964 C8040000                 ENTER  4,0
  9650 00004968 68[504B]                 push listvar_0
  9651 0000496B E87BFB                   call prs
  9652 0000496E 83C402                   add  sp, 2
  9653 00004971 FF7604                   push word [bp+4]
  9654 00004974 E8C7FC                   call printint51
  9655 00004977 83C402                   add  sp, 2
  9656 0000497A 6A20                     push 32
  9657 0000497C E803FB                   call prc
  9658 0000497F 83C402                   add  sp, 2
  9659                                  
  9660                                  ;-895   c=GType [i]; if(c=='V')prs("var ");   if(c=='*')prs("ptr ");
  9661                                  
  9662 00004982 8B5E04                   mov bx, [bp+4]
  9663 00004985 8A87B782                 mov al, [GType + bx]
  9664 00004989 8846FC                   mov [bp-4], al
  9665 0000498C 8A46FC                   mov al, [bp-4]
  9666 0000498F 3C56                     cmp al, 86
  9667 00004991 0F850900                 jne .listvar546
  9668 00004995 68[544B]                 push listvar_1
  9669 00004998 E84EFB                   call prs
  9670 0000499B 83C402                   add  sp, 2
  9671                                  .listvar546:
  9672 0000499E 8A46FC                   mov al, [bp-4]
  9673 000049A1 3C2A                     cmp al, 42
  9674 000049A3 0F850900                 jne .listvar547
  9675 000049A7 68[594B]                 push listvar_2
  9676 000049AA E83CFB                   call prs
  9677 000049AD 83C402                   add  sp, 2
  9678                                  
  9679                                  ;-896                if(c=='&')prs("arr ");   if(c=='#')prs("def ");
  9680                                  
  9681                                  .listvar547:
  9682 000049B0 8A46FC                   mov al, [bp-4]
  9683 000049B3 3C26                     cmp al, 38
  9684 000049B5 0F850900                 jne .listvar548
  9685 000049B9 68[5E4B]                 push listvar_3
  9686 000049BC E82AFB                   call prs
  9687 000049BF 83C402                   add  sp, 2
  9688                                  .listvar548:
  9689 000049C2 8A46FC                   mov al, [bp-4]
  9690 000049C5 3C23                     cmp al, 35
  9691 000049C7 0F850900                 jne .listvar549
  9692 000049CB 68[634B]                 push listvar_4
  9693 000049CE E818FB                   call prs
  9694 000049D1 83C402                   add  sp, 2
  9695                                  
  9696                                  ;-897   c=GSign [i]; if(c=='S')prs("sign ");  if(c=='U')prs("unsg ");
  9697                                  
  9698                                  .listvar549:
  9699 000049D4 8B5E04                   mov bx, [bp+4]
  9700 000049D7 8A87E383                 mov al, [GSign + bx]
  9701 000049DB 8846FC                   mov [bp-4], al
  9702 000049DE 8A46FC                   mov al, [bp-4]
  9703 000049E1 3C53                     cmp al, 83
  9704 000049E3 0F850900                 jne .listvar550
  9705 000049E7 68[684B]                 push listvar_5
  9706 000049EA E8FCFA                   call prs
  9707 000049ED 83C402                   add  sp, 2
  9708                                  .listvar550:
  9709 000049F0 8A46FC                   mov al, [bp-4]
  9710 000049F3 3C55                     cmp al, 85
  9711 000049F5 0F850900                 jne .listvar551
  9712 000049F9 68[6E4B]                 push listvar_6
  9713 000049FC E8EAFA                   call prs
  9714 000049FF 83C402                   add  sp, 2
  9715                                  
  9716                                  ;-898   c=GWidth[i]; if(c==  1)prs("byte " ); if(c==  2)prs("word " );
  9717                                  
  9718                                  .listvar551:
  9719 00004A02 8B5E04                   mov bx, [bp+4]
  9720 00004A05 8A870F85                 mov al, [GWidth + bx]
  9721 00004A09 8846FC                   mov [bp-4], al
  9722 00004A0C 8A46FC                   mov al, [bp-4]
  9723 00004A0F 3C01                     cmp al, 1
  9724 00004A11 0F850900                 jne .listvar552
  9725 00004A15 68[744B]                 push listvar_7
  9726 00004A18 E8CEFA                   call prs
  9727 00004A1B 83C402                   add  sp, 2
  9728                                  .listvar552:
  9729 00004A1E 8A46FC                   mov al, [bp-4]
  9730 00004A21 3C02                     cmp al, 2
  9731 00004A23 0F850900                 jne .listvar553
  9732 00004A27 68[7A4B]                 push listvar_8
  9733 00004A2A E8BCFA                   call prs
  9734 00004A2D 83C402                   add  sp, 2
  9735                                  
  9736                                  ;-899                if(c==  4)prs("dwrd " );
  9737                                  
  9738                                  .listvar553:
  9739 00004A30 8A46FC                   mov al, [bp-4]
  9740 00004A33 3C04                     cmp al, 4
  9741 00004A35 0F850900                 jne .listvar554
  9742 00004A39 68[804B]                 push listvar_9
  9743 00004A3C E8AAFA                   call prs
  9744 00004A3F 83C402                   add  sp, 2
  9745                                  
  9746                                  ;-900   j=GAdr[i]; printint51(j);
  9747                                  
  9748                                  .listvar554:
  9749 00004A42 8B5E04                   mov bx, [bp+4]
  9750 00004A45 D1E3                     shl bx, 1
  9751 00004A47 8B873B86                 mov ax, [GAdr + bx]
  9752 00004A4B 8946FE                   mov [bp-2], ax
  9753 00004A4E FF76FE                   push word [bp-2]
  9754 00004A51 E8EAFB                   call printint51
  9755 00004A54 83C402                   add  sp, 2
  9756                                  
  9757                                  ;-901   j=GUsed[i]; if (j) printint51(j);
  9758                                  
  9759 00004A57 8B5E04                   mov bx, [bp+4]
  9760 00004A5A D1E3                     shl bx, 1
  9761 00004A5C 8B879388                 mov ax, [GUsed + bx]
  9762 00004A60 8946FE                   mov [bp-2], ax
  9763 00004A63 8B46FE                   mov ax, [bp-2]
  9764 00004A66 08C0                     or  al, al
  9765 00004A68 0F840C00                 je .listvar555
  9766 00004A6C FF76FE                   push word [bp-2]
  9767 00004A6F E8CCFB                   call printint51
  9768 00004A72 83C402                   add  sp, 2
  9769                                  
  9770                                  ;-902   else {if(GType[i]=='#') prs("    -"); else prs(" NULL");}
  9771                                  
  9772 00004A75 E92200                   jmp .listvar556
  9773                                  .listvar555:
  9774 00004A78 8B5E04                   mov bx, [bp+4]
  9775 00004A7B 8A87B782                 mov al, [GType + bx]
  9776 00004A7F 3C23                     cmp al, 35
  9777 00004A81 0F850C00                 jne .listvar557
  9778 00004A85 68[864B]                 push listvar_10
  9779 00004A88 E85EFA                   call prs
  9780 00004A8B 83C402                   add  sp, 2
  9781 00004A8E E90900                   jmp .listvar558
  9782                                  .listvar557:
  9783 00004A91 68[8C4B]                 push listvar_11
  9784 00004A94 E852FA                   call prs
  9785 00004A97 83C402                   add  sp, 2
  9786                                  .listvar558:
  9787                                  
  9788                                  ;-903   prc(32);  pt=adrofname(i); prs(pt);
  9789                                  
  9790                                  .listvar556:
  9791 00004A9A 6A20                     push 32
  9792 00004A9C E8E3F9                   call prc
  9793 00004A9F 83C402                   add  sp, 2
  9794 00004AA2 FF7604                   push word [bp+4]
  9795 00004AA5 E82CBE                   call adrofname
  9796 00004AA8 83C402                   add  sp, 2
  9797 00004AAB A3[6A00]                 mov word [pt], ax
  9798 00004AAE FF36[6A00]               push word [pt]
  9799 00004AB2 E834FA                   call prs
  9800 00004AB5 83C402                   add  sp, 2
  9801                                  
  9802                                  ;-904   if(GType[i]=='#') { prc('='); j=GData[i]; pint1(j); }
  9803                                  
  9804 00004AB8 8B5E04                   mov bx, [bp+4]
  9805 00004ABB 8A87B782                 mov al, [GType + bx]
  9806 00004ABF 3C23                     cmp al, 35
  9807 00004AC1 0F851D00                 jne .listvar559
  9808 00004AC5 6A3D                     push 61
  9809 00004AC7 E8B8F9                   call prc
  9810 00004ACA 83C402                   add  sp, 2
  9811 00004ACD 8B5E04                   mov bx, [bp+4]
  9812 00004AD0 D1E3                     shl bx, 1
  9813 00004AD2 8B87EB8A                 mov ax, [GData + bx]
  9814 00004AD6 8946FE                   mov [bp-2], ax
  9815 00004AD9 FF76FE                   push word [bp-2]
  9816 00004ADC E801FB                   call pint1
  9817 00004ADF 83C402                   add  sp, 2
  9818                                  
  9819                                  ;-905   if(GType[i]=='&') { prc('['); j=GData[i]; pint1(j); prc(']');}
  9820                                  
  9821                                  .listvar559:
  9822 00004AE2 8B5E04                   mov bx, [bp+4]
  9823 00004AE5 8A87B782                 mov al, [GType + bx]
  9824 00004AE9 3C26                     cmp al, 38
  9825 00004AEB 0F852500                 jne .listvar560
  9826 00004AEF 6A5B                     push 91
  9827 00004AF1 E88EF9                   call prc
  9828 00004AF4 83C402                   add  sp, 2
  9829 00004AF7 8B5E04                   mov bx, [bp+4]
  9830 00004AFA D1E3                     shl bx, 1
  9831 00004AFC 8B87EB8A                 mov ax, [GData + bx]
  9832 00004B00 8946FE                   mov [bp-2], ax
  9833 00004B03 FF76FE                   push word [bp-2]
  9834 00004B06 E8D7FA                   call pint1
  9835 00004B09 83C402                   add  sp, 2
  9836 00004B0C 6A5D                     push 93
  9837 00004B0E E871F9                   call prc
  9838 00004B11 83C402                   add  sp, 2
  9839                                  
  9840                                  ;-906   if (i >= LSTART) { prs(" = bp"); j=GData[i];
  9841                                  
  9842                                  .listvar560:
  9843 00004B14 8B4604                   mov ax, [bp+4]
  9844 00004B17 3DC800                   cmp ax, 200 ;unsigned : 0
  9845 00004B1A 0F823000                 jb  .listvar561
  9846 00004B1E 68[924B]                 push listvar_12
  9847 00004B21 E8C5F9                   call prs
  9848 00004B24 83C402                   add  sp, 2
  9849 00004B27 8B5E04                   mov bx, [bp+4]
  9850 00004B2A D1E3                     shl bx, 1
  9851 00004B2C 8B87EB8A                 mov ax, [GData + bx]
  9852 00004B30 8946FE                   mov [bp-2], ax
  9853                                  
  9854                                  ;-907     if (j > 0) prc('+'); pint1(j);  }
  9855                                  
  9856 00004B33 8B46FE                   mov ax, [bp-2]
  9857 00004B36 83F800                   cmp ax, 0
  9858 00004B39 0F8E0800                 jle .listvar562
  9859 00004B3D 6A2B                     push 43
  9860 00004B3F E840F9                   call prc
  9861 00004B42 83C402                   add  sp, 2
  9862                                  .listvar562:
  9863 00004B45 FF76FE                   push word [bp-2]
  9864 00004B48 E895FA                   call pint1
  9865 00004B4B 83C402                   add  sp, 2
  9866                                  
  9867                                  ;-908 }
  9868                                  
  9869                                  .listvar561:
  9870                                  
  9871                                  ;-909 int listcall() { int i;
  9872 00004B4E C9                       LEAVE
  9873 00004B4F C3                       ret
  9874 00004B50 5C6E3B00                listvar_0 db "\n;",0
  9875 00004B54 7661722000              listvar_1 db "var ",0
  9876 00004B59 7074722000              listvar_2 db "ptr ",0
  9877 00004B5E 6172722000              listvar_3 db "arr ",0
  9878 00004B63 6465662000              listvar_4 db "def ",0
  9879 00004B68 7369676E2000            listvar_5 db "sign ",0
  9880 00004B6E 756E73672000            listvar_6 db "unsg ",0
  9881 00004B74 627974652000            listvar_7 db "byte ",0
  9882 00004B7A 776F72642000            listvar_8 db "word ",0
  9883 00004B80 647772642000            listvar_9 db "dwrd ",0
  9884 00004B86 202020202D00            listvar_10 db "    -",0
  9885 00004B8C 204E554C4C00            listvar_11 db " NULL",0
  9886 00004B92 203D20627000            listvar_12 db " = bp",0
  9887                                  ; ENDP
  9888                                  
  9889                                  listcall:  ; *** PROC ***
  9890                                  
  9891                                  ;-910   prs("\n\n;    #  addr name   list of CALLs\n");
  9892                                  
  9893                                  ;Function : listcall, Number of local variables: 1
  9894                                  ;   # type sign width addr used name   list of local variables
  9895                                  ;  200 var sign word   909 NULL i = bp-2;
  9896 00004B98 C8020000                 ENTER  2,0
  9897 00004B9C 68[C64B]                 push listcall_0
  9898 00004B9F E847F9                   call prs
  9899 00004BA2 83C402                   add  sp, 2
  9900                                  
  9901                                  ;-911   i=0;  while (i< CTop) { calllisting(i); i++; } }
  9902                                  
  9903 00004BA5 B80000                   mov ax, 0
  9904 00004BA8 8946FE                   mov [bp-2], ax
  9905                                  .listcall563:
  9906 00004BAB 8B46FE                   mov ax, [bp-2]
  9907 00004BAE 3B06[3D00]               cmp ax, [CTop]
  9908 00004BB2 0F8D0E00                 jge .listcall564
  9909 00004BB6 FF76FE                   push word [bp-2]
  9910 00004BB9 E83200                   call calllisting
  9911 00004BBC 83C402                   add  sp, 2
  9912 00004BBF FF46FE                   inc  word[bp-2]
  9913 00004BC2 EBE7                     jmp .listcall563
  9914                                  .listcall564:
  9915                                  
  9916                                  ;-912 int calllisting(int i) {char c; int j;
  9917 00004BC4 C9                       LEAVE
  9918 00004BC5 C3                       ret
  9919 00004BC6 5C6E5C6E3B20202020-     listcall_0 db "\n\n;    #  addr name   list of CALLs\n",0
  9920 00004BCF 23202061646472206E-
  9921 00004BD8 616D652020206C6973-
  9922 00004BE1 74206F662043414C4C-
  9923 00004BEA 735C6E00           
  9924                                  ; ENDP
  9925                                  
  9926                                  calllisting:  ; *** PROC ***
  9927                                  
  9928                                  ;-913   prs("\n;"); printint51(i); prc(32);
  9929                                  
  9930                                  ;Function : calllisting, Number of local variables: 3
  9931                                  ;   # type sign width addr used name   list of local variables
  9932                                  ;  200 var sign word   912 NULL i = bp+4
  9933                                  ;  201 var sign byte   912 NULL c = bp-2
  9934                                  ;  202 var sign word   912 NULL j = bp-4;
  9935 00004BEE C8040000                 ENTER  4,0
  9936 00004BF2 68[604C]                 push calllisting_0
  9937 00004BF5 E8F1F8                   call prs
  9938 00004BF8 83C402                   add  sp, 2
  9939 00004BFB FF7604                   push word [bp+4]
  9940 00004BFE E83DFA                   call printint51
  9941 00004C01 83C402                   add  sp, 2
  9942 00004C04 6A20                     push 32
  9943 00004C06 E879F8                   call prc
  9944 00004C09 83C402                   add  sp, 2
  9945                                  
  9946                                  ;-914   c=CType [i]; if(c==0)prs("unresolved ");
  9947                                  
  9948 00004C0C 8B5E04                   mov bx, [bp+4]
  9949 00004C0F 8A872FA1                 mov al, [CType + bx]
  9950 00004C13 8846FE                   mov [bp-2], al
  9951 00004C16 8A46FE                   mov al, [bp-2]
  9952 00004C19 3C00                     cmp al, 0
  9953 00004C1B 0F850900                 jne .calllisting565
  9954 00004C1F 68[644C]                 push calllisting_1
  9955 00004C22 E8C4F8                   call prs
  9956 00004C25 83C402                   add  sp, 2
  9957                                  
  9958                                  ;-915   j=CAdr[i];            printint51(j); prc(32);
  9959                                  
  9960                                  .calllisting565:
  9961 00004C28 8B5E04                   mov bx, [bp+4]
  9962 00004C2B D1E3                     shl bx, 1
  9963 00004C2D 8B8757AB                 mov ax, [CAdr + bx]
  9964 00004C31 8946FC                   mov [bp-4], ax
  9965 00004C34 FF76FC                   push word [bp-4]
  9966 00004C37 E804FA                   call printint51
  9967 00004C3A 83C402                   add  sp, 2
  9968 00004C3D 6A20                     push 32
  9969 00004C3F E840F8                   call prc
  9970 00004C42 83C402                   add  sp, 2
  9971                                  
  9972                                  ;-916   from_far(NameA, j);   prs(NameA);
  9973                                  
  9974 00004C45 FF76FC                   push word [bp-4]
  9975 00004C48 8D06[3F00]               lea  ax, [NameA]
  9976 00004C4C 50                       push ax
  9977 00004C4D E8B206                   call from_far
  9978 00004C50 83C404                   add  sp, 4
  9979 00004C53 8D06[3F00]               lea  ax, [NameA]
  9980 00004C57 50                       push ax
  9981 00004C58 E88EF8                   call prs
  9982 00004C5B 83C402                   add  sp, 2
  9983                                  
  9984                                  ;-917 }
  9985                                  
  9986                                  
  9987                                  ;-918 int countcalls(int f) { unsigned int i;
  9988 00004C5E C9                       LEAVE
  9989 00004C5F C3                       ret
  9990 00004C60 5C6E3B00                calllisting_0 db "\n;",0
  9991 00004C64 756E7265736F6C7665-     calllisting_1 db "unresolved ",0
  9992 00004C6D 642000             
  9993                                  ; ENDP
  9994                                  
  9995                                  countcalls:  ; *** PROC ***
  9996                                  
  9997                                  ;-919   pt=adrF(FNameField, f);
  9998                                  
  9999                                  ;Function : countcalls, Number of local variables: 2
 10000                                  ;   # type sign width addr used name   list of local variables
 10001                                  ;  200 var sign word   918 NULL f = bp+4
 10002                                  ;  201 var unsg word   918 NULL i = bp-2;
 10003 00004C70 C8020000                 ENTER  2,0
 10004 00004C74 FF7604                   push word [bp+4]
 10005 00004C77 8D064FBD                 lea  ax, [FNameField]
 10006 00004C7B 50                       push ax
 10007 00004C7C E869BC                   call adrF
 10008 00004C7F 83C404                   add  sp, 4
 10009 00004C82 A3[6A00]                 mov word [pt], ax
 10010                                  
 10011                                  ;-920   i=0;  while (i < CTop) {
 10012                                  
 10013 00004C85 B80000                   mov ax, 0
 10014 00004C88 8946FE                   mov [bp-2], ax
 10015                                  .countcalls566:
 10016 00004C8B 8B46FE                   mov ax, [bp-2]
 10017 00004C8E 3B06[3D00]               cmp ax, [CTop]
 10018 00004C92 0F8D4A00                 jge .countcalls567
 10019                                  
 10020                                  ;-921     p1=CAdr[i];
 10021                                  
 10022 00004C96 8B5EFE                   mov bx, [bp-2]
 10023 00004C99 D1E3                     shl bx, 1
 10024 00004C9B 8B8757AB                 mov ax, [CAdr + bx]
 10025 00004C9F A3[6C00]                 mov word [p1], ax
 10026                                  
 10027                                  ;-922     from_far(NameA, p1);
 10028                                  
 10029 00004CA2 FF36[6C00]               push word [p1]
 10030 00004CA6 8D06[3F00]               lea  ax, [NameA]
 10031 00004CAA 50                       push ax
 10032 00004CAB E85406                   call from_far
 10033 00004CAE 83C404                   add  sp, 4
 10034                                  
 10035                                  ;-923     if (eqstr(pt,NameA))  FCalls[f] = FCalls[f] + 1;
 10036                                  
 10037 00004CB1 8D06[3F00]               lea  ax, [NameA]
 10038 00004CB5 50                       push ax
 10039 00004CB6 FF36[6A00]               push word [pt]
 10040 00004CBA E8D9B4                   call eqstr
 10041 00004CBD 83C404                   add  sp, 4
 10042 00004CC0 08C0                     or  al, al
 10043 00004CC2 0F841500                 je .countcalls568
 10044 00004CC6 8B5E04                   mov bx, [bp+4]
 10045 00004CC9 D1E3                     shl bx, 1
 10046 00004CCB 8B87F7BA                 mov ax, [FCalls + bx]
 10047 00004CCF 83C001                   add ax, 1
 10048 00004CD2 8B5E04                   mov bx, [bp+4]
 10049 00004CD5 D1E3                     shl bx, 1
 10050 00004CD7 8987F7BA                 mov [FCalls+bx], ax
 10051                                  
 10052                                  ;-924     i++; }
 10053                                  
 10054                                  .countcalls568:
 10055 00004CDB FF46FE                   inc  word[bp-2]
 10056                                  
 10057                                  ;-925 }
 10058                                  
 10059 00004CDE EBAB                     jmp .countcalls566
 10060                                  .countcalls567:
 10061                                  
 10062                                  ;-926 int listfunc() { int i;
 10063 00004CE0 C9                       LEAVE
 10064 00004CE1 C3                       ret
 10065                                  ; ENDP
 10066                                  
 10067                                  listfunc:  ; *** PROC ***
 10068                                  
 10069                                  ;-927   prs("\n\n\n;   # Calls Line Width  Name   list of functions\n");
 10070                                  
 10071                                  ;Function : listfunc, Number of local variables: 1
 10072                                  ;   # type sign width addr used name   list of local variables
 10073                                  ;  200 var sign word   926 NULL i = bp-2;
 10074 00004CE2 C8020000                 ENTER  2,0
 10075 00004CE6 68[2F4D]                 push listfunc_0
 10076 00004CE9 E8FDF7                   call prs
 10077 00004CEC 83C402                   add  sp, 2
 10078                                  
 10079                                  ;-928   i=0;  while (i < FTop) { countcalls (i); i++; } 
 10080                                  
 10081 00004CEF B80000                   mov ax, 0
 10082 00004CF2 8946FE                   mov [bp-2], ax
 10083                                  .listfunc569:
 10084 00004CF5 8B46FE                   mov ax, [bp-2]
 10085 00004CF8 3B06[3B00]               cmp ax, [FTop]
 10086 00004CFC 0F8D0E00                 jge .listfunc570
 10087 00004D00 FF76FE                   push word [bp-2]
 10088 00004D03 E86AFF                   call countcalls
 10089 00004D06 83C402                   add  sp, 2
 10090 00004D09 FF46FE                   inc  word[bp-2]
 10091                                  
 10092                                  ;-929   i=0;  while (i < FTop) { funclisting(i); i++; } }
 10093                                  
 10094 00004D0C EBE7                     jmp .listfunc569
 10095                                  .listfunc570:
 10096 00004D0E B80000                   mov ax, 0
 10097 00004D11 8946FE                   mov [bp-2], ax
 10098                                  .listfunc571:
 10099 00004D14 8B46FE                   mov ax, [bp-2]
 10100 00004D17 3B06[3B00]               cmp ax, [FTop]
 10101 00004D1B 0F8D0E00                 jge .listfunc572
 10102 00004D1F FF76FE                   push word [bp-2]
 10103 00004D22 E84300                   call funclisting
 10104 00004D25 83C402                   add  sp, 2
 10105 00004D28 FF46FE                   inc  word[bp-2]
 10106 00004D2B EBE7                     jmp .listfunc571
 10107                                  .listfunc572:
 10108                                  
 10109                                  ;-930 int funclisting(int i) {int j;  char c;
 10110 00004D2D C9                       LEAVE
 10111 00004D2E C3                       ret
 10112 00004D2F 5C6E5C6E5C6E3B2020-     listfunc_0 db "\n\n\n;   # Calls Line Width  Name   list of functions\n",0
 10113 00004D38 20232043616C6C7320-
 10114 00004D41 4C696E652057696474-
 10115 00004D4A 6820204E616D652020-
 10116 00004D53 206C697374206F6620-
 10117 00004D5C 66756E6374696F6E73-
 10118 00004D65 5C6E00             
 10119                                  ; ENDP
 10120                                  
 10121                                  funclisting:  ; *** PROC ***
 10122                                  
 10123                                  ;-931   prs("\n;");    printint51(i);
 10124                                  
 10125                                  ;Function : funclisting, Number of local variables: 3
 10126                                  ;   # type sign width addr used name   list of local variables
 10127                                  ;  200 var sign word   930 NULL i = bp+4
 10128                                  ;  201 var sign word   930 NULL j = bp-2
 10129                                  ;  202 var sign byte   930 NULL c = bp-4;
 10130 00004D68 C8040000                 ENTER  4,0
 10131 00004D6C 68[444E]                 push funclisting_0
 10132 00004D6F E877F7                   call prs
 10133 00004D72 83C402                   add  sp, 2
 10134 00004D75 FF7604                   push word [bp+4]
 10135 00004D78 E8C3F8                   call printint51
 10136 00004D7B 83C402                   add  sp, 2
 10137                                  
 10138                                  ;-932   j = FCalls[i]; if (j) printint51(j); else prs(" NULL");
 10139                                  
 10140 00004D7E 8B5E04                   mov bx, [bp+4]
 10141 00004D81 D1E3                     shl bx, 1
 10142 00004D83 8B87F7BA                 mov ax, [FCalls + bx]
 10143 00004D87 8946FE                   mov [bp-2], ax
 10144 00004D8A 8B46FE                   mov ax, [bp-2]
 10145 00004D8D 08C0                     or  al, al
 10146 00004D8F 0F840C00                 je .funclisting573
 10147 00004D93 FF76FE                   push word [bp-2]
 10148 00004D96 E8A5F8                   call printint51
 10149 00004D99 83C402                   add  sp, 2
 10150 00004D9C E90900                   jmp .funclisting574
 10151                                  .funclisting573:
 10152 00004D9F 68[484E]                 push funclisting_1
 10153 00004DA2 E844F7                   call prs
 10154 00004DA5 83C402                   add  sp, 2
 10155                                  
 10156                                  ;-933   j = FAdr[i];   printint51(j); prc(32);
 10157                                  
 10158                                  .funclisting574:
 10159 00004DA8 8B5E04                   mov bx, [bp+4]
 10160 00004DAB D1E3                     shl bx, 1
 10161 00004DAD 8B87FFA8                 mov ax, [FAdr + bx]
 10162 00004DB1 8946FE                   mov [bp-2], ax
 10163 00004DB4 FF76FE                   push word [bp-2]
 10164 00004DB7 E884F8                   call printint51
 10165 00004DBA 83C402                   add  sp, 2
 10166 00004DBD 6A20                     push 32
 10167 00004DBF E8C0F6                   call prc
 10168 00004DC2 83C402                   add  sp, 2
 10169                                  
 10170                                  ;-934   c=FType[i];
 10171                                  
 10172 00004DC5 8B5E04                   mov bx, [bp+4]
 10173 00004DC8 8A8703A0                 mov al, [FType + bx]
 10174 00004DCC 8846FC                   mov [bp-4], al
 10175                                  
 10176                                  ;-935   if(c=='V')prs("void " );    if(c=='B')prs("byte " );
 10177                                  
 10178 00004DCF 8A46FC                   mov al, [bp-4]
 10179 00004DD2 3C56                     cmp al, 86
 10180 00004DD4 0F850900                 jne .funclisting575
 10181 00004DD8 68[4E4E]                 push funclisting_2
 10182 00004DDB E80BF7                   call prs
 10183 00004DDE 83C402                   add  sp, 2
 10184                                  .funclisting575:
 10185 00004DE1 8A46FC                   mov al, [bp-4]
 10186 00004DE4 3C42                     cmp al, 66
 10187 00004DE6 0F850900                 jne .funclisting576
 10188 00004DEA 68[544E]                 push funclisting_3
 10189 00004DED E8F9F6                   call prs
 10190 00004DF0 83C402                   add  sp, 2
 10191                                  
 10192                                  ;-936   if(c=='W')prs("word " );    if(c=='D')prs("dwrd " );
 10193                                  
 10194                                  .funclisting576:
 10195 00004DF3 8A46FC                   mov al, [bp-4]
 10196 00004DF6 3C57                     cmp al, 87
 10197 00004DF8 0F850900                 jne .funclisting577
 10198 00004DFC 68[5A4E]                 push funclisting_4
 10199 00004DFF E8E7F6                   call prs
 10200 00004E02 83C402                   add  sp, 2
 10201                                  .funclisting577:
 10202 00004E05 8A46FC                   mov al, [bp-4]
 10203 00004E08 3C44                     cmp al, 68
 10204 00004E0A 0F850900                 jne .funclisting578
 10205 00004E0E 68[604E]                 push funclisting_5
 10206 00004E11 E8D5F6                   call prs
 10207 00004E14 83C402                   add  sp, 2
 10208                                  
 10209                                  ;-937   prc(32); prc(32);
 10210                                  
 10211                                  .funclisting578:
 10212 00004E17 6A20                     push 32
 10213 00004E19 E866F6                   call prc
 10214 00004E1C 83C402                   add  sp, 2
 10215 00004E1F 6A20                     push 32
 10216 00004E21 E85EF6                   call prc
 10217 00004E24 83C402                   add  sp, 2
 10218                                  
 10219                                  ;-938   pt=adrF(FNameField, i); prs(pt);
 10220                                  
 10221 00004E27 FF7604                   push word [bp+4]
 10222 00004E2A 8D064FBD                 lea  ax, [FNameField]
 10223 00004E2E 50                       push ax
 10224 00004E2F E8B6BA                   call adrF
 10225 00004E32 83C404                   add  sp, 4
 10226 00004E35 A3[6A00]                 mov word [pt], ax
 10227 00004E38 FF36[6A00]               push word [pt]
 10228 00004E3C E8AAF6                   call prs
 10229 00004E3F 83C402                   add  sp, 2
 10230                                  
 10231                                  ;-939 }
 10232                                  
 10233                                  
 10234                                  ;-940 unsigned int MAXUI=65535;
 10235 00004E42 C9                       LEAVE
 10236 00004E43 C3                       ret
 10237 00004E44 5C6E3B00                funclisting_0 db "\n;",0
 10238 00004E48 204E554C4C00            funclisting_1 db " NULL",0
 10239 00004E4E 766F69642000            funclisting_2 db "void ",0
 10240 00004E54 627974652000            funclisting_3 db "byte ",0
 10241 00004E5A 776F72642000            funclisting_4 db "word ",0
 10242 00004E60 647772642000            funclisting_5 db "dwrd ",0
 10243                                  ; ENDP
 10244 00004E66 FFFF                    MAXUI dw -1
 10245                                  
 10246                                  ;-941 int epilog() {unsigned int i; 
 10247                                  
 10248                                  
 10249                                  epilog:  ; *** PROC ***
 10250                                  
 10251                                  ;-942   strcpy(symbol, "LastFunctionByt");  storefunc();
 10252                                  
 10253                                  ;Function : epilog, Number of local variables: 1
 10254                                  ;   # type sign width addr used name   list of local variables
 10255                                  ;  200 var unsg word   941 NULL i = bp-2;
 10256 00004E68 C8020000                 ENTER  2,0
 10257 00004E6C 68[9950]                 push epilog_0
 10258 00004E6F 8D062B81                 lea  ax, [symbol]
 10259 00004E73 50                       push ax
 10260 00004E74 E8EFB2                   call strcpy
 10261 00004E77 83C404                   add  sp, 4
 10262 00004E7A E846BD                   call storefunc
 10263                                  
 10264                                  ;-943   prs("\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret");
 10265                                  
 10266 00004E7D 68[A950]                 push epilog_1
 10267 00004E80 E866F6                   call prs
 10268 00004E83 83C402                   add  sp, 2
 10269                                  
 10270                                  ;-944   prs("\n \n;   # type sign width  adr used name   list of global variables\n");
 10271                                  
 10272 00004E86 68[D650]                 push epilog_2
 10273 00004E89 E85DF6                   call prs
 10274 00004E8C 83C402                   add  sp, 2
 10275                                  
 10276                                  ;-945   i=1;
 10277                                  
 10278 00004E8F B80100                   mov ax, 1
 10279 00004E92 8946FE                   mov [bp-2], ax
 10280                                  
 10281                                  ;-946   while (i< GTop) { listvar(i); i++; }
 10282                                  
 10283                                  .epilog579:
 10284 00004E95 8B46FE                   mov ax, [bp-2]
 10285 00004E98 3B06[2A00]               cmp ax, [GTop]
 10286 00004E9C 0F8D0E00                 jge .epilog580
 10287 00004EA0 FF76FE                   push word [bp-2]
 10288 00004EA3 E8BEFA                   call listvar
 10289 00004EA6 83C402                   add  sp, 2
 10290 00004EA9 FF46FE                   inc  word[bp-2]
 10291                                  
 10292                                  ;-947   listfunc();   listcall();
 10293                                  
 10294 00004EAC EBE7                     jmp .epilog579
 10295                                  .epilog580:
 10296 00004EAE E831FE                   call listfunc
 10297 00004EB1 E8E4FC                   call listcall
 10298                                  
 10299                                  ;-948 
 10300                                  
 10301                                  
 10302                                  ;-949   prs("\n;Input: "); prs(&namein);
 10303                                  
 10304 00004EB4 68[1D51]                 push epilog_3
 10305 00004EB7 E82FF6                   call prs
 10306 00004EBA 83C402                   add  sp, 2
 10307 00004EBD 8D06EE81                 lea  ax, [namein]
 10308 00004EC1 50                       push ax
 10309 00004EC2 E824F6                   call prs
 10310 00004EC5 83C402                   add  sp, 2
 10311                                  
 10312                                  ;-950   prs(", List: ");   prs(&namelst);
 10313                                  
 10314 00004EC8 68[2851]                 push epilog_4
 10315 00004ECB E81BF6                   call prs
 10316 00004ECE 83C402                   add  sp, 2
 10317 00004ED1 8D063182                 lea  ax, [namelst]
 10318 00004ED5 50                       push ax
 10319 00004ED6 E810F6                   call prs
 10320 00004ED9 83C402                   add  sp, 2
 10321                                  
 10322                                  ;-951   prs(",  Lines:"); printint51(lineno);
 10323                                  
 10324 00004EDC 68[3151]                 push epilog_5
 10325 00004EDF E807F6                   call prs
 10326 00004EE2 83C402                   add  sp, 2
 10327 00004EE5 FF36[6600]               push word [lineno]
 10328 00004EE9 E852F7                   call printint51
 10329 00004EEC 83C402                   add  sp, 2
 10330                                  
 10331                                  ;-952   prs("\n;Glob. variables:"); GTop--; printint51(GTop);
 10332                                  
 10333 00004EEF 68[3B51]                 push epilog_6
 10334 00004EF2 E8F4F5                   call prs
 10335 00004EF5 83C402                   add  sp, 2
 10336 00004EF8 FF0E[2A00]               dec  word[GTop]
 10337 00004EFC FF36[2A00]               push word [GTop]
 10338 00004F00 E83BF7                   call printint51
 10339 00004F03 83C402                   add  sp, 2
 10340                                  
 10341                                  ;-953   prs(" max.:"); printint51(LSTART);
 10342                                  
 10343 00004F06 68[4F51]                 push epilog_7
 10344 00004F09 E8DDF5                   call prs
 10345 00004F0C 83C402                   add  sp, 2
 10346 00004F0F 68C800                   push 200
 10347 00004F12 E829F7                   call printint51
 10348 00004F15 83C402                   add  sp, 2
 10349                                  
 10350                                  ;-954   prs("\n;Functions      :"); printint51(FTop);
 10351                                  
 10352 00004F18 68[5651]                 push epilog_8
 10353 00004F1B E8CBF5                   call prs
 10354 00004F1E 83C402                   add  sp, 2
 10355 00004F21 FF36[3B00]               push word [FTop]
 10356 00004F25 E816F7                   call printint51
 10357 00004F28 83C402                   add  sp, 2
 10358                                  
 10359                                  ;-955   prs(" max.:"); printint51(FUNCMAX);
 10360                                  
 10361 00004F2B 68[6A51]                 push epilog_9
 10362 00004F2E E8B8F5                   call prs
 10363 00004F31 83C402                   add  sp, 2
 10364 00004F34 682C01                   push 300
 10365 00004F37 E804F7                   call printint51
 10366 00004F3A 83C402                   add  sp, 2
 10367                                  
 10368                                  ;-956   prs("\n;Calls          :"); printint51(CTop);
 10369                                  
 10370 00004F3D 68[7151]                 push epilog_10
 10371 00004F40 E8A6F5                   call prs
 10372 00004F43 83C402                   add  sp, 2
 10373 00004F46 FF36[3D00]               push word [CTop]
 10374 00004F4A E8F1F6                   call printint51
 10375 00004F4D 83C402                   add  sp, 2
 10376                                  
 10377                                  ;-957   prs(" max.:"); printint51(CALLMAX);
 10378                                  
 10379 00004F50 68[8551]                 push epilog_11
 10380 00004F53 E893F5                   call prs
 10381 00004F56 83C402                   add  sp, 2
 10382 00004F59 68D007                   push 2000
 10383 00004F5C E8DFF6                   call printint51
 10384 00004F5F 83C402                   add  sp, 2
 10385                                  
 10386                                  ;-958   prs(", NameField:"); printint51(CNameTop);
 10387                                  
 10388 00004F62 68[8C51]                 push epilog_12
 10389 00004F65 E881F5                   call prs
 10390 00004F68 83C402                   add  sp, 2
 10391 00004F6B FF36[6000]               push word [CNameTop]
 10392 00004F6F E8CCF6                   call printint51
 10393 00004F72 83C402                   add  sp, 2
 10394                                  
 10395                                  ;-959   prs(" max.:"); printint51(65535);
 10396                                  
 10397 00004F75 68[9951]                 push epilog_13
 10398 00004F78 E86EF5                   call prs
 10399 00004F7B 83C402                   add  sp, 2
 10400 00004F7E 6AFF                     push -1
 10401 00004F80 E8BBF6                   call printint51
 10402 00004F83 83C402                   add  sp, 2
 10403                                  
 10404                                  ;-960 //  prs(", segE:"); printint51(segE);
 10405                                  
 10406                                  
 10407                                  ;-961   __asm{call LastFunctionByt}  _ i=ax;
 10408                                  
 10409 00004F86 E89903                  call LastFunctionByt
 10410 00004F89 8946FE                  mov [bp-2], ax
 10411                                  
 10412                                  ;-962   prs("\n;Code until     :"); printint51(i);
 10413                                  
 10414 00004F8C 68[A051]                 push epilog_14
 10415 00004F8F E857F5                   call prs
 10416 00004F92 83C402                   add  sp, 2
 10417 00004F95 FF76FE                   push word [bp-2]
 10418 00004F98 E8A3F6                   call printint51
 10419 00004F9B 83C402                   add  sp, 2
 10420                                  
 10421                                  ;-963   prs(" max.: "); printint51(ORGDATAORIG); i=ORGDATAORIG-i; prs(", free:");
 10422                                  
 10423 00004F9E 68[B451]                 push epilog_15
 10424 00004FA1 E845F5                   call prs
 10425 00004FA4 83C402                   add  sp, 2
 10426 00004FA7 FF36[0E00]               push word [ORGDATAORIG]
 10427 00004FAB E890F6                   call printint51
 10428 00004FAE 83C402                   add  sp, 2
 10429 00004FB1 A1[0E00]                 mov ax, [ORGDATAORIG]
 10430 00004FB4 2B46FE                   sub ax, [bp-2]
 10431 00004FB7 8946FE                   mov [bp-2], ax
 10432 00004FBA 68[BC51]                 push epilog_16
 10433 00004FBD E829F5                   call prs
 10434 00004FC0 83C402                   add  sp, 2
 10435                                  
 10436                                  ;-964   printint51(i); if (i <= 1000)prs(" *** Warning *** Code area too small");
 10437                                  
 10438 00004FC3 FF76FE                   push word [bp-2]
 10439 00004FC6 E875F6                   call printint51
 10440 00004FC9 83C402                   add  sp, 2
 10441 00004FCC 8B46FE                   mov ax, [bp-2]
 10442 00004FCF 3DE803                   cmp ax, 1000
 10443 00004FD2 0F870900                 ja  .epilog581
 10444 00004FD6 68[C451]                 push epilog_17
 10445 00004FD9 E80DF5                   call prs
 10446 00004FDC 83C402                   add  sp, 2
 10447                                  
 10448                                  ;-965   prs("\n;Data (HeapEnd) :"); pint1(orgData); i=MAXUI-orgData;
 10449                                  
 10450                                  .epilog581:
 10451 00004FDF 68[E951]                 push epilog_18
 10452 00004FE2 E804F5                   call prs
 10453 00004FE5 83C402                   add  sp, 2
 10454 00004FE8 FF36[1000]               push word [orgData]
 10455 00004FEC E8F1F5                   call pint1
 10456 00004FEF 83C402                   add  sp, 2
 10457 00004FF2 A1[664E]                 mov ax, [MAXUI]
 10458 00004FF5 2B06[1000]               sub ax, [orgData]
 10459 00004FF9 8946FE                   mov [bp-2], ax
 10460                                  
 10461                                  ;-966   prs(", resting stacksize: ");printint51(i);
 10462                                  
 10463 00004FFC 68[FD51]                 push epilog_19
 10464 00004FFF E8E7F4                   call prs
 10465 00005002 83C402                   add  sp, 2
 10466 00005005 FF76FE                   push word [bp-2]
 10467 00005008 E833F6                   call printint51
 10468 0000500B 83C402                   add  sp, 2
 10469                                  
 10470                                  ;-967   if (i <= 5000) prs(" *** Warning *** Stack too small");
 10471                                  
 10472 0000500E 8B46FE                   mov ax, [bp-2]
 10473 00005011 3D8813                   cmp ax, 5000
 10474 00005014 0F870900                 ja  .epilog582
 10475 00005018 68[1352]                 push epilog_20
 10476 0000501B E8CBF4                   call prs
 10477 0000501E 83C402                   add  sp, 2
 10478                                  
 10479                                  ;-968   prs("\n;Max. Const in '"); prs(coname); prs("' :"); printint51(maxco);
 10480                                  
 10481                                  .epilog582:
 10482 00005021 68[3452]                 push epilog_21
 10483 00005024 E8C2F4                   call prs
 10484 00005027 83C402                   add  sp, 2
 10485 0000502A 8D06E880                 lea  ax, [coname]
 10486 0000502E 50                       push ax
 10487 0000502F E8B7F4                   call prs
 10488 00005032 83C402                   add  sp, 2
 10489 00005035 68[4752]                 push epilog_22
 10490 00005038 E8AEF4                   call prs
 10491 0000503B 83C402                   add  sp, 2
 10492 0000503E FF36[1200]               push word [maxco]
 10493 00005042 E8F9F5                   call printint51
 10494 00005045 83C402                   add  sp, 2
 10495                                  
 10496                                  ;-969   prs(" max."); printint51(COMAX); i=COMAX; i=i-maxco; prs(", free:");
 10497                                  
 10498 00005048 68[4B52]                 push epilog_23
 10499 0000504B E89BF4                   call prs
 10500 0000504E 83C402                   add  sp, 2
 10501 00005051 68B80B                   push 3000
 10502 00005054 E8E7F5                   call printint51
 10503 00005057 83C402                   add  sp, 2
 10504 0000505A B8B80B                   mov ax, 3000
 10505 0000505D 8946FE                   mov [bp-2], ax
 10506 00005060 8B46FE                   mov ax, [bp-2]
 10507 00005063 2B06[1200]               sub ax, [maxco]
 10508 00005067 8946FE                   mov [bp-2], ax
 10509 0000506A 68[5152]                 push epilog_24
 10510 0000506D E879F4                   call prs
 10511 00005070 83C402                   add  sp, 2
 10512                                  
 10513                                  ;-970   printint51(i);if (i <= 1000)prs(" *** Warning *** constant area too small");
 10514                                  
 10515 00005073 FF76FE                   push word [bp-2]
 10516 00005076 E8C5F5                   call printint51
 10517 00005079 83C402                   add  sp, 2
 10518 0000507C 8B46FE                   mov ax, [bp-2]
 10519 0000507F 3DE803                   cmp ax, 1000
 10520 00005082 0F870900                 ja  .epilog583
 10521 00005086 68[5952]                 push epilog_25
 10522 00005089 E85DF4                   call prs
 10523 0000508C 83C402                   add  sp, 2
 10524                                  
 10525                                  ;-971   end1(0);}
 10526                                  
 10527                                  .epilog583:
 10528 0000508F 6A00                     push 0
 10529 00005091 E8D6F6                   call end1
 10530 00005094 83C402                   add  sp, 2
 10531                                  
 10532                                  ;-972 // while(expr) stmt; do stmt while(expr); FOR: i=0; while(i<10){stmt; i++;}
 10533                                  
 10534                                  
 10535                                  ;-973 int setblock(unsigned int i) {
 10536 00005097 C9                       LEAVE
 10537 00005098 C3                       ret
 10538 00005099 4C61737446756E6374-     epilog_0 db "LastFunctionByt",0
 10539 000050A2 696F6E42797400     
 10540 000050A9 5C6E4C61737446756E-     epilog_1 db "\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret",0
 10541 000050B2 6374696F6E4279743A-
 10542 000050BB 646220304538682C20-
 10543 000050C4 302C20305C6E706F70-
 10544 000050CD 2061785C6E72657400 
 10545 000050D6 5C6E205C6E3B202020-     epilog_2 db "\n \n;   # type sign width  adr used name   list of global variables\n",0
 10546 000050DF 232074797065207369-
 10547 000050E8 676E20776964746820-
 10548 000050F1 206164722075736564-
 10549 000050FA 206E616D652020206C-
 10550 00005103 697374206F6620676C-
 10551 0000510C 6F62616C2076617269-
 10552 00005115 61626C65735C6E00   
 10553 0000511D 5C6E3B496E7075743A-     epilog_3 db "\n;Input: ",0
 10554 00005126 2000               
 10555 00005128 2C204C6973743A2000      epilog_4 db ", List: ",0
 10556 00005131 2C20204C696E65733A-     epilog_5 db ",  Lines:",0
 10557 0000513A 00                 
 10558 0000513B 5C6E3B476C6F622E20-     epilog_6 db "\n;Glob. variables:",0
 10559 00005144 7661726961626C6573-
 10560 0000514D 3A00               
 10561 0000514F 206D61782E3A00          epilog_7 db " max.:",0
 10562 00005156 5C6E3B46756E637469-     epilog_8 db "\n;Functions      :",0
 10563 0000515F 6F6E73202020202020-
 10564 00005168 3A00               
 10565 0000516A 206D61782E3A00          epilog_9 db " max.:",0
 10566 00005171 5C6E3B43616C6C7320-     epilog_10 db "\n;Calls          :",0
 10567 0000517A 202020202020202020-
 10568 00005183 3A00               
 10569 00005185 206D61782E3A00          epilog_11 db " max.:",0
 10570 0000518C 2C204E616D65466965-     epilog_12 db ", NameField:",0
 10571 00005195 6C643A00           
 10572 00005199 206D61782E3A00          epilog_13 db " max.:",0
 10573 000051A0 5C6E3B436F64652075-     epilog_14 db "\n;Code until     :",0
 10574 000051A9 6E74696C2020202020-
 10575 000051B2 3A00               
 10576 000051B4 206D61782E3A2000        epilog_15 db " max.: ",0
 10577 000051BC 2C20667265653A00        epilog_16 db ", free:",0
 10578 000051C4 202A2A2A205761726E-     epilog_17 db " *** Warning *** Code area too small",0
 10579 000051CD 696E67202A2A2A2043-
 10580 000051D6 6F6465206172656120-
 10581 000051DF 746F6F20736D616C6C-
 10582 000051E8 00                 
 10583 000051E9 5C6E3B446174612028-     epilog_18 db "\n;Data (HeapEnd) :",0
 10584 000051F2 48656170456E642920-
 10585 000051FB 3A00               
 10586 000051FD 2C2072657374696E67-     epilog_19 db ", resting stacksize: ",0
 10587 00005206 20737461636B73697A-
 10588 0000520F 653A2000           
 10589 00005213 202A2A2A205761726E-     epilog_20 db " *** Warning *** Stack too small",0
 10590 0000521C 696E67202A2A2A2053-
 10591 00005225 7461636B20746F6F20-
 10592 0000522E 736D616C6C00       
 10593 00005234 5C6E3B4D61782E2043-     epilog_21 db "\n;Max. Const in '",0
 10594 0000523D 6F6E737420696E2027-
 10595 00005246 00                 
 10596 00005247 27203A00                epilog_22 db "' :",0
 10597 0000524B 206D61782E00            epilog_23 db " max.",0
 10598 00005251 2C20667265653A00        epilog_24 db ", free:",0
 10599 00005259 202A2A2A205761726E-     epilog_25 db " *** Warning *** constant area too small",0
 10600 00005262 696E67202A2A2A2063-
 10601 0000526B 6F6E7374616E742061-
 10602 00005274 72656120746F6F2073-
 10603 0000527D 6D616C6C00         
 10604                                  ; ENDP
 10605                                  
 10606                                  setblock:  ; *** PROC ***
 10607                                  
 10608                                  ;-974   DOS_ERR=0; _BX=i; _ ax=cs; _ es=ax; _AX=0x4A00; DosInt(); }
 10609                                  
 10610                                  ;Function : setblock, Number of local variables: 1
 10611                                  ;   # type sign width addr used name   list of local variables
 10612                                  ;  200 var unsg word   973 NULL i = bp+4;
 10613 00005282 C8000000                 ENTER  0,0
 10614 00005286 B80000                   mov ax, 0
 10615 00005289 A3[6E00]                 mov word [DOS_ERR], ax
 10616 0000528C 8B5E04                   mov  bx, [bp+4]
 10617 0000528F 8CC8                     mov  ax, cs
 10618 00005291 8EC0                     mov  es, ax
 10619 00005293 B8004A                   mov  ax, 18944
 10620 00005296 E834AE                   call DosInt
 10621                                  
 10622                                  ;-975 int allocmem(unsigned int i) { unsigned int vAX; unsigned int vBX;
 10623 00005299 C9                       LEAVE
 10624 0000529A C3                       ret
 10625                                  ; ENDP
 10626                                  
 10627                                  allocmem:  ; *** PROC ***
 10628                                  
 10629                                  ;-976   DOS_ERR=0; _BX=i;  _AX=0x4800; DosInt(); _ vAX=ax; _ vBX=bx;
 10630                                  
 10631                                  ;Function : allocmem, Number of local variables: 3
 10632                                  ;   # type sign width addr used name   list of local variables
 10633                                  ;  200 var unsg word   975 NULL i = bp+4
 10634                                  ;  201 var unsg word   975 NULL vAX = bp-2
 10635                                  ;  202 var unsg word   975 NULL vBX = bp-4;
 10636 0000529B C8040000                 ENTER  4,0
 10637 0000529F B80000                   mov ax, 0
 10638 000052A2 A3[6E00]                 mov word [DOS_ERR], ax
 10639 000052A5 8B5E04                   mov  bx, [bp+4]
 10640 000052A8 B80048                   mov  ax, 18432
 10641 000052AB E81FAE                   call DosInt
 10642 000052AE 8946FE                  mov [bp-2], ax
 10643 000052B1 895EFC                  mov [bp-4], bx
 10644                                  
 10645                                  ;-977   if(DOS_ERR) return vBX;   return vAX;
 10646                                  
 10647 000052B4 A1[6E00]                 mov ax, [DOS_ERR]
 10648 000052B7 08C0                     or  al, al
 10649 000052B9 0F840600                 je .allocmem584
 10650 000052BD 8B46FC                   mov ax, [bp-4]
 10651 000052C0 E90600                   jmp .retnallocmem
 10652                                  .allocmem584:
 10653 000052C3 8B46FE                   mov ax, [bp-2]
 10654 000052C6 E90000                   jmp .retnallocmem
 10655                                  
 10656                                  ;-978 }
 10657                                  
 10658                                  
 10659                                  ;-979 int copyF(char *dest, char *src, unsigned int sz) {
 10660                                  
 10661 000052C9 C9                       .retnallocmem: LEAVE
 10662 000052CA C3                       ret
 10663                                  ; ENDP
 10664                                  
 10665                                  copyF:  ; *** PROC ***
 10666                                  
 10667                                  ;-980   segE;  _ es=ax;  _ si=src;  _ di=dest; _ cx=sz;  // ds:si   es:di
 10668                                  
 10669                                  ;Function : copyF, Number of local variables: 3
 10670                                  ;   # type sign width addr used name   list of local variables
 10671                                  ;  200 ptr sign byte   979 NULL dest = bp+4
 10672                                  ;  201 ptr sign byte   979 NULL src = bp+6
 10673                                  ;  202 var unsg word   979 NULL sz = bp+8;
 10674 000052CB C8000000                 ENTER  0,0
 10675 000052CF A1[6400]                 mov ax, [segE]
 10676 000052D2 8EC0                     mov  es, ax
 10677 000052D4 8B7606                   mov  si, [bp+6]
 10678 000052D7 8B7E04                   mov  di, [bp+4]
 10679 000052DA 8B4E08                   mov  cx, [bp+8]
 10680                                  
 10681                                  ;-981   asm cld
 10682                                  
 10683 000052DD FC                       cld
 10684                                  
 10685                                  ;-982   asm rep movsb
 10686                                  
 10687 000052DE F3A4                     rep movsb
 10688                                  
 10689                                  ;-983   asm mov byte [es:di], 0
 10690                                  
 10691 000052E0 26C60500                 mov byte [es:di], 0
 10692                                  
 10693                                  ;-984 }
 10694                                  
 10695                                  
 10696                                  ;-985 int to_far(char *dest, char *src) {
 10697 000052E4 C9                       LEAVE
 10698 000052E5 C3                       ret
 10699                                  ; ENDP
 10700                                  
 10701                                  to_far:  ; *** PROC ***
 10702                                  
 10703                                  ;-986   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
 10704                                  
 10705                                  ;Function : to_far, Number of local variables: 2
 10706                                  ;   # type sign width addr used name   list of local variables
 10707                                  ;  200 ptr sign byte   985 NULL dest = bp+4
 10708                                  ;  201 ptr sign byte   985 NULL src = bp+6;
 10709 000052E6 C8000000                 ENTER  0,0
 10710 000052EA A1[6400]                 mov ax, [segE]
 10711 000052ED 8EC0                     mov  es, ax
 10712 000052EF 8B7606                   mov  si, [bp+6]
 10713 000052F2 8B7E04                   mov  di, [bp+4]
 10714                                  
 10715                                  ;-987   asm cld
 10716                                  
 10717 000052F5 FC                       cld
 10718                                  
 10719                                  ;-988   do{
 10720                                  
 10721                                  .to_far585:
 10722                                  
 10723                                  ;-989   asm lodsb  ; inc si
 10724                                  
 10725 000052F6 AC                       lodsb  ; inc si
 10726                                  
 10727                                  ;-990   asm stosb  ; inc di
 10728                                  
 10729 000052F7 AA                       stosb  ; inc di
 10730                                  
 10731                                  ;-991   } while (al != 0);
 10732                                  
 10733 000052F8 3C00                     cmp  al, 0
 10734 000052FA 0F840200                 je  .to_far586
 10735 000052FE EBF6                     jmp .to_far585
 10736                                  .to_far586:
 10737                                  
 10738                                  ;-992 }
 10739                                  
 10740                                  
 10741                                  ;-993 int from_far(char *dest, char *src) {
 10742 00005300 C9                       LEAVE
 10743 00005301 C3                       ret
 10744                                  ; ENDP
 10745                                  
 10746                                  from_far:  ; *** PROC ***
 10747                                  
 10748                                  ;-994   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
 10749                                  
 10750                                  ;Function : from_far, Number of local variables: 2
 10751                                  ;   # type sign width addr used name   list of local variables
 10752                                  ;  200 ptr sign byte   993 NULL dest = bp+4
 10753                                  ;  201 ptr sign byte   993 NULL src = bp+6;
 10754 00005302 C8000000                 ENTER  0,0
 10755 00005306 A1[6400]                 mov ax, [segE]
 10756 00005309 8EC0                     mov  es, ax
 10757 0000530B 8B7606                   mov  si, [bp+6]
 10758 0000530E 8B7E04                   mov  di, [bp+4]
 10759                                  
 10760                                  ;-995   do{
 10761                                  
 10762                                  .from_far587:
 10763                                  
 10764                                  ;-996   asm mov al, [es:si]
 10765                                  
 10766 00005311 268A04                   mov al, [es:si]
 10767                                  
 10768                                  ;-997   asm inc si
 10769                                  
 10770 00005314 46                       inc si
 10771                                  
 10772                                  ;-998   asm mov [di], al
 10773                                  
 10774 00005315 8805                     mov [di], al
 10775                                  
 10776                                  ;-999   asm inc di
 10777                                  
 10778 00005317 47                       inc di
 10779                                  
 10780                                  ;-1000   } while (al != 0);
 10781                                  
 10782 00005318 3C00                     cmp  al, 0
 10783 0000531A 0F840200                 je  .from_far588
 10784 0000531E EBF1                     jmp .from_far587
 10785                                  .from_far588:
 10786                                  
 10787                                  ;-1001 }
 10788 00005320 C9                       LEAVE
 10789 00005321 C3                       ret
 10790                                  ; ENDP
 10791                                   
 10792                                  ; missing functions: 
 10793                                  ; Number of unresolved CALLs :    0 All FUNCTIONs in place
 10794 00005322 E80000                  LastFunctionByt:db 0E8h, 0, 0
 10795 00005325 58                      pop ax
 10796 00005326 C3                      ret
 10797                                   
 10798                                  ;   # type sign width  adr used name   list of global variables
 10799                                  
 10800                                  ;    1 arr sign byte     2    2 Version1[10]
 10801                                  ;    2 def unsg byte     3    - LSTART=200
 10802                                  ;    3 def unsg byte     4    - VARMAX=300
 10803                                  ;    4 def unsg byte     5    - GNAMEMAX=4800
 10804                                  ;    5 def unsg byte     6    - FUNCMAX=300
 10805                                  ;    6 def unsg byte     7    - FNAMEMAX=4800
 10806                                  ;    7 def unsg byte     8    - CALLMAX=2000
 10807                                  ;    8 def unsg byte     9    - IDLENMAX=15
 10808                                  ;    9 def unsg byte    11    - T_NAME=256
 10809                                  ;   10 def unsg byte    12    - T_CONST=257
 10810                                  ;   11 def unsg byte    13    - T_STRING=258
 10811                                  ;   12 def unsg byte    14    - T_INCLUDE=510
 10812                                  ;   13 def unsg byte    15    - T_DEFINE=511
 10813                                  ;   14 def unsg byte    16    - T_RETURN=512
 10814                                  ;   15 def unsg byte    17    - T_IF=513
 10815                                  ;   16 def unsg byte    18    - T_ELSE=514
 10816                                  ;   17 def unsg byte    19    - T_WHILE=515
 10817                                  ;   18 def unsg byte    20    - T_DO=516
 10818                                  ;   19 def unsg byte    21    - T_INT=517
 10819                                  ;   20 def unsg byte    22    - T_ASM=518
 10820                                  ;   21 def unsg byte    23    - T_ASMBLOCK=519
 10821                                  ;   22 def unsg byte    24    - T_EMIT=520
 10822                                  ;   23 def unsg byte    25    - T_GOTO=521
 10823                                  ;   24 def unsg byte    26    - T_VOID=529
 10824                                  ;   25 def unsg byte    27    - T_CHAR=530
 10825                                  ;   26 def unsg byte    28    - T_SIGNED=531
 10826                                  ;   27 def unsg byte    29    - T_UNSIGNED=532
 10827                                  ;   28 def unsg byte    30    - T_LONG=533
 10828                                  ;   29 def unsg byte    31    - T_EQ=806
 10829                                  ;   30 def unsg byte    32    - T_NE=807
 10830                                  ;   31 def unsg byte    33    - T_GE=811
 10831                                  ;   32 def unsg byte    34    - T_LE=824
 10832                                  ;   33 def unsg byte    35    - T_PLUSPLUS=1219
 10833                                  ;   34 def unsg byte    36    - T_MINUSMINUS=1225
 10834                                  ;   35 def unsg byte    37    - T_PLUSASS=1230
 10835                                  ;   36 def unsg byte    38    - T_MINUSASS=1231
 10836                                  ;   37 def unsg byte    39    - T_MULASS=1232
 10837                                  ;   38 def unsg byte    40    - T_DIVASS=1233
 10838                                  ;   39 def unsg byte    41    - T_ANDASS=1234
 10839                                  ;   40 def unsg byte    42    - T_ORASS=1235
 10840                                  ;   41 def unsg byte    43    - T_LESSLESS=1240
 10841                                  ;   42 def unsg byte    44    - T_GREATGREAT=1241
 10842                                  ;   43 def unsg byte    45    - COMAX=3000
 10843                                  ;   44 def unsg byte    46    - CMDLENMAX=67
 10844                                  ;   45 var unsg word    47    3 ORGDATAORIG
 10845                                  ;   46 var unsg word    47   10 orgData
 10846                                  ;   47 arr sign byte    48    4 co[3000]
 10847                                  ;   48 var sign word    48    4 maxco
 10848                                  ;   49 var sign word    48    3 maxco1
 10849                                  ;   50 arr sign byte    49    2 coname[67]
 10850                                  ;   51 ptr sign byte    49    5 cloc
 10851                                  ;   52 var sign word    50    6 fdin
 10852                                  ;   53 var sign word    50    4 fdout
 10853                                  ;   54 arr sign byte    50  104 symbol[128]
 10854                                  ;   55 arr sign byte    51   12 fname[67]
 10855                                  ;   56 arr sign byte    51   10 namein[67]
 10856                                  ;   57 arr sign byte    52    7 namelst[67]
 10857                                  ;   58 arr sign byte    52    2 archivename[67]
 10858                                  ;   59 var sign word    53   41 token
 10859                                  ;   60 var sign byte    53    2 globC
 10860                                  ;   61 var sign word    53    3 spalte
 10861                                  ;   62 var sign byte    54   28 thechar
 10862                                  ;   63 var sign word    54    9 iscmp
 10863                                  ;   64 var sign word    54    4 nconst
 10864                                  ;   65 var sign word    55    3 nreturn
 10865                                  ;   66 var sign word    55   12 nlabel
 10866                                  ;   67 var sign word    56   24 GTop
 10867                                  ;   68 var sign word    56   20 LTop
 10868                                  ;   69 var unsg word    57   44 lexval
 10869                                  ;   70 var sign word    58    6 typei
 10870                                  ;   71 var sign byte    58    8 istype
 10871                                  ;   72 arr sign byte    58   11 GType[300]
 10872                                  ;   73 var sign word    59    6 signi
 10873                                  ;   74 var sign byte    59    5 issign
 10874                                  ;   75 arr sign byte    59    5 GSign[300]
 10875                                  ;   76 var sign word    60    9 widthi
 10876                                  ;   77 var sign byte    60   19 iswidth
 10877                                  ;   78 arr sign byte    60    5 GWidth[300]
 10878                                  ;   79 arr sign word    61    4 GAdr[300]
 10879                                  ;   80 arr sign word    61    6 GUsed[300]
 10880                                  ;   81 var sign word    62   26 wi
 10881                                  ;   82 arr sign word    62   11 GData[300]
 10882                                  ;   83 arr sign byte    62    2 GNameField[4800]
 10883                                  ;   84 var sign word    63   13 FTop
 10884                                  ;   85 var sign word    63    8 CTop
 10885                                  ;   86 arr sign byte    64    2 FType[300]
 10886                                  ;   87 arr sign byte    64    3 CType[2000]
 10887                                  ;   88 arr sign word    65    2 FAdr[300]
 10888                                  ;   89 arr sign word    65    4 CAdr[2000]
 10889                                  ;   90 arr sign word    66    4 FCalls[300]
 10890                                  ;   91 arr sign byte    67    5 FNameField[4800]
 10891                                  ;   92 arr sign byte    68    7 NameA[32]
 10892                                  ;   93 arr sign byte    69    5 fgetsdest[128]
 10893                                  ;   94 ptr unsg byte    69    8 CNameTop
 10894                                  ;   95 ptr unsg byte    70   10 fgetsp
 10895                                  ;   96 var unsg word    70    4 segE
 10896                                  ;   97 var unsg word    71   12 lineno
 10897                                  ;   98 var unsg word    71    2 linenoinclude
 10898                                  ;   99 ptr unsg byte    72   17 pt
 10899                                  ;  100 ptr unsg byte    72    8 p1
 10900                                  ;  101 var sign word    73    9 DOS_ERR
 10901                                  ;  102 var sign word    73    5 DOS_NoBytes
 10902                                  ;  103 var sign byte    73    3 DOS_ByteRead
 10903                                  ;  104 arr sign byte   131    2 doglobName[15]
 10904                                  ;  105 var sign word   297    5 mod1
 10905                                  ;  106 var sign word   297   12 ireg1
 10906                                  ;  107 var sign word   297    6 idx1
 10907                                  ;  108 var sign word   297    1 ids1
 10908                                  ;  109 var sign word   297    4 idw1
 10909                                  ;  110 var sign word   297    2 idt1
 10910                                  ;  111 var sign word   297 NULL val1
 10911                                  ;  112 var sign word   298    2 mod2
 10912                                  ;  113 var sign word   298    6 ireg2
 10913                                  ;  114 var sign word   298    6 idx2
 10914                                  ;  115 var sign word   298    1 ids2
 10915                                  ;  116 var sign word   298    4 idw2
 10916                                  ;  117 var sign word   298    2 idt2
 10917                                  ;  118 var sign word   298    2 val2
 10918                                  ;  119 arr sign byte   363    9 ops[5]
 10919                                  ;  120 arr sign byte   405    3 printregstr[74]
 10920                                  ;  121 var sign word   413    1 evalue
 10921                                  ;  122 var sign word   413    1 exprtype
 10922                                  ;  123 arr sign word   565    2 docalltype[10]
 10923                                  ;  124 arr sign word   565    2 docallvalue[10]
 10924                                  ;  125 arr sign byte   566    2 procname[17]
 10925                                  ;  126 ptr sign byte   621    1 arglen
 10926                                  ;  127 ptr sign byte   621    2 argv
 10927                                  ;  128 arr sign byte   762    2 symboltemp[80]
 10928                                  ;  129 var unsg word   940    1 MAXUI
 10929                                  
 10930                                  
 10931                                  ;   # Calls Line Width  Name   list of functions
 10932                                  
 10933                                  ;    0    4   75   writetty
 10934                                  ;    1    1   76   putch
 10935                                  ;    2    6   77   cputs
 10936                                  ;    3    3   78   mkneg
 10937                                  ;    4    8   80   DosInt
 10938                                  ;    5    2   85   openR
 10939                                  ;    6    1   86   creatR
 10940                                  ;    7    2   87   fcloseR
 10941                                  ;    8    3   88   exitR
 10942                                  ;    9    2   89   readRL
 10943                                  ;   10    1   90   fputcR
 10944                                  ;   11    8   93   strlen
 10945                                  ;   12   24   94   strcpy
 10946                                  ;   13   74   95   eqstr
 10947                                  ;   14    2   98   instr1
 10948                                  ;   15    1   99   strcat1
 10949                                  ;   16    1  100   toupper
 10950                                  ;   17    3  102   digit
 10951                                  ;   18    1  107   letter
 10952                                  ;   19    3  117   alnum
 10953                                  ;   20    4  122   a
 10954                                  ;   21   21  123   v
 10955                                  ;   22    4  128   checknamelen
 10956                                  ;   23    1  132   doglob
 10957                                  ;   24   12  181   gettypes
 10958                                  ;   25    9  190   adrofname
 10959                                  ;   26    7  191   adrF
 10960                                  ;   27    4  193   printName
 10961                                  ;   28   12  197   searchname
 10962                                  ;   29    3  201   checkName
 10963                                  ;   30   10  206   typeName
 10964                                  ;   31    3  222   name1
 10965                                  ;   32    1  227   storecall
 10966                                  ;   33    2  233   storefunc
 10967                                  ;   34    2  237   addlocal
 10968                                  ;   35    1  243   checkFunction
 10969                                  ;   36    1  246   dofunc
 10970                                  ;   37    1  287   isvariable
 10971                                  ;   38    3  300   pexpr
 10972                                  ;   39    1  307   constantexpr
 10973                                  ;   40    3  317   exprstart
 10974                                  ;   41    1  319   expr2
 10975                                  ;   42    3  364   doreg1
 10976                                  ;   43    6  383   checkreg
 10977                                  ;   44    6  408   printreg
 10978                                  ;   45    2  414   expr
 10979                                  ;   46    4  463   compoundass
 10980                                  ;   47    2  470   dovar1
 10981                                  ;   48    8  491   rterm
 10982                                  ;   49    1  504   isreg
 10983                                  ;   50   15  522   doreg
 10984                                  ;   51    1  528   doassign
 10985                                  ;   52    1  546   domul
 10986                                  ;   53    2  550   doidiv
 10987                                  ;   54    1  563   domod
 10988                                  ;   55    1  567   docall1
 10989                                  ;   56 NULL  609   main
 10990                                  ;   57    2  620   getfirstchar
 10991                                  ;   58    1  622   getarg
 10992                                  ;   59    2  640   parse
 10993                                  ;   60    1  649   checkcalls
 10994                                  ;   61    1  666   doinclude
 10995                                  ;   62    1  677   dodefine
 10996                                  ;   63    6  693   stmt
 10997                                  ;   64    1  724   doemit
 10998                                  ;   65    3  728   cmpneg
 10999                                  ;   66    7  741   prlabel
 11000                                  ;   67    3  742   prjump
 11001                                  ;   68    1  743   doif
 11002                                  ;   69    1  749   dodo
 11003                                  ;   70    1  753   dowhile
 11004                                  ;   71    4  756   isrelational
 11005                                  ;   72   17  763   getlex
 11006                                  ;   73    1  815   convertdefine
 11007                                  ;   74    1  822   getdigit
 11008                                  ;   75    1  831   getstring
 11009                                  ;   76   31  834   next
 11010                                  ;   77   78  835   istoken
 11011                                  ;   78   36  836   expect
 11012                                  ;   79    6  839   eprc
 11013                                  ;   80    5  840   eprs
 11014                                  ;   81   40  841   prc
 11015                                  ;   82    3  846   prscomment
 11016                                  ;   83    8  848   prnl
 11017                                  ;   84  249  850   prs
 11018                                  ;   85    2  855   eprnum
 11019                                  ;   86   41  857   pint1
 11020                                  ;   87   25  859   printint51
 11021                                  ;   88    2  863   fgets1
 11022                                  ;   89    1  867   printinputline
 11023                                  ;   90    2  875   end1
 11024                                  ;   91   50  876   error1
 11025                                  ;   92    2  885   listproc
 11026                                  ;   93    2  893   listvar
 11027                                  ;   94    1  909   listcall
 11028                                  ;   95    1  912   calllisting
 11029                                  ;   96    1  918   countcalls
 11030                                  ;   97    1  926   listfunc
 11031                                  ;   98    1  930   funclisting
 11032                                  ;   99    1  941   epilog
 11033                                  ;  100    1  973   setblock
 11034                                  ;  101    1  975   allocmem
 11035                                  ;  102 NULL  979   copyF
 11036                                  ;  103    1  985   to_far
 11037                                  ;  104    3  993   from_far
 11038                                  ;  105 NULL 1001   LastFunctionByt
 11039                                  
 11040                                  ;    #  addr name   list of CALLs
 11041                                  
 11042                                  ;    0     0 writetty
 11043                                  ;    1     9 writetty
 11044                                  ;    2    18 putch
 11045                                  ;    3    24 DosInt
 11046                                  ;    4    31 DosInt
 11047                                  ;    5    38 DosInt
 11048                                  ;    6    45 DosInt
 11049                                  ;    7    52 DosInt
 11050                                  ;    8    59 DosInt
 11051                                  ;    9    66 strcpy
 11052                                  ;   10    73 digit
 11053                                  ;   11    79 letter
 11054                                  ;   12    86 printName
 11055                                  ;   13    96 prc
 11056                                  ;   14   100 printName
 11057                                  ;   15   110 prc
 11058                                  ;   16   114 strlen
 11059                                  ;   17   121 error1
 11060                                  ;   18   128 error1
 11061                                  ;   19   135 error1
 11062                                  ;   20   142 checknamelen
 11063                                  ;   21   155 checkName
 11064                                  ;   22   165 error1
 11065                                  ;   23   172 istoken
 11066                                  ;   24   180 istoken
 11067                                  ;   25   188 prs
 11068                                  ;   26   192 pint1
 11069                                  ;   27   198 prs
 11070                                  ;   28   202 prs
 11071                                  ;   29   206 prs
 11072                                  ;   30   210 prs
 11073                                  ;   31   214 prs
 11074                                  ;   32   218 pint1
 11075                                  ;   33   224 prs
 11076                                  ;   34   228 expect
 11077                                  ;   35   235 expect
 11078                                  ;   36   242 error1
 11079                                  ;   37   249 prs
 11080                                  ;   38   253 prs
 11081                                  ;   39   257 prs
 11082                                  ;   40   261 strcpy
 11083                                  ;   41   268 expect
 11084                                  ;   42   275 istoken
 11085                                  ;   43   283 prc
 11086                                  ;   44   287 prscomment
 11087                                  ;   45   298 prc
 11088                                  ;   46   302 prs
 11089                                  ;   47   306 strlen
 11090                                  ;   48   313 istoken
 11091                                  ;   49   321 prc
 11092                                  ;   50   325 expect
 11093                                  ;   51   332 pint1
 11094                                  ;   52   338 istoken
 11095                                  ;   53   346 expect
 11096                                  ;   54   353 error1
 11097                                  ;   55   360 prs
 11098                                  ;   56   364 prs
 11099                                  ;   57   368 prs
 11100                                  ;   58   372 prs
 11101                                  ;   59   376 prs
 11102                                  ;   60   380 prs
 11103                                  ;   61   384 istoken
 11104                                  ;   62   392 prc
 11105                                  ;   63   396 istoken
 11106                                  ;   64   404 expect
 11107                                  ;   65   411 pint1
 11108                                  ;   66   417 pint1
 11109                                  ;   67   423 adrofname
 11110                                  ;   68   433 strcpy
 11111                                  ;   69   440 strcpy
 11112                                  ;   70   447 expect
 11113                                  ;   71   454 adrF
 11114                                  ;   72   459 adrofname
 11115                                  ;   73   469 prs
 11116                                  ;   74   473 prs
 11117                                  ;   75   477 prc
 11118                                  ;   76   481 pint1
 11119                                  ;   77   487 prc
 11120                                  ;   78   491 checkName
 11121                                  ;   79   501 error1
 11122                                  ;   80   508 adrofname
 11123                                  ;   81   518 eqstr
 11124                                  ;   82   524 adrofname
 11125                                  ;   83   534 eqstr
 11126                                  ;   84   540 istoken
 11127                                  ;   85   548 istoken
 11128                                  ;   86   556 istoken
 11129                                  ;   87   564 istoken
 11130                                  ;   88   572 istoken
 11131                                  ;   89   580 istoken
 11132                                  ;   90   588 istoken
 11133                                  ;   91   596 istoken
 11134                                  ;   92   604 name1
 11135                                  ;   93   610 error1
 11136                                  ;   94   617 getlex
 11137                                  ;   95   624 error1
 11138                                  ;   96   631 error1
 11139                                  ;   97   638 strlen
 11140                                  ;   98   645 to_far
 11141                                  ;   99   652 error1
 11142                                  ;  100   659 adrF
 11143                                  ;  101   664 strcpy
 11144                                  ;  102   671 error1
 11145                                  ;  103   678 checkName
 11146                                  ;  104   688 error1
 11147                                  ;  105   695 adrF
 11148                                  ;  106   700 strcpy
 11149                                  ;  107   707 adrF
 11150                                  ;  108   712 eqstr
 11151                                  ;  109   718 checknamelen
 11152                                  ;  110   731 strcpy
 11153                                  ;  111   738 checkFunction
 11154                                  ;  112   752 error1
 11155                                  ;  113   759 storefunc
 11156                                  ;  114   769 prs
 11157                                  ;  115   773 prs
 11158                                  ;  116   777 prs
 11159                                  ;  117   781 expect
 11160                                  ;  118   788 istoken
 11161                                  ;  119   796 typeName
 11162                                  ;  120   805 addlocal
 11163                                  ;  121   814 istoken
 11164                                  ;  122   822 expect
 11165                                  ;  123   829 expect
 11166                                  ;  124   836 isvariable
 11167                                  ;  125   847 typeName
 11168                                  ;  126   856 checknamelen
 11169                                  ;  127   869 addlocal
 11170                                  ;  128   878 istoken
 11171                                  ;  129   886 expect
 11172                                  ;  130   893 expect
 11173                                  ;  131   900 istoken
 11174                                  ;  132   908 expect
 11175                                  ;  133   915 listproc
 11176                                  ;  134   924 prs
 11177                                  ;  135   928 mkneg
 11178                                  ;  136   934 pint1
 11179                                  ;  137   940 prs
 11180                                  ;  138   944 istoken
 11181                                  ;  139   952 stmt
 11182                                  ;  140   957 prs
 11183                                  ;  141   961 prs
 11184                                  ;  142   965 prc
 11185                                  ;  143   969 prs
 11186                                  ;  144   973 prs
 11187                                  ;  145   977 prs
 11188                                  ;  146   981 strlen
 11189                                  ;  147   988 strcpy
 11190                                  ;  148   995 prs
 11191                                  ;  149   999 expect
 11192                                  ;  150  1006 eqstr
 11193                                  ;  151  1012 constantexpr
 11194                                  ;  152  1025 checkreg
 11195                                  ;  153  1034 doreg1
 11196                                  ;  154  1041 exprstart
 11197                                  ;  155  1051 prs
 11198                                  ;  156  1055 prs
 11199                                  ;  157  1059 expect
 11200                                  ;  158  1066 getlex
 11201                                  ;  159  1073 typeName
 11202                                  ;  160  1082 searchname
 11203                                  ;  161  1093 gettypes
 11204                                  ;  162  1102 isrelational
 11205                                  ;  163  1115 error1
 11206                                  ;  164  1122 expect
 11207                                  ;  165  1129 prs
 11208                                  ;  166  1133 prs
 11209                                  ;  167  1137 gettypes
 11210                                  ;  168  1146 prs
 11211                                  ;  169  1150 prs
 11212                                  ;  170  1154 v
 11213                                  ;  171  1156 prs
 11214                                  ;  172  1160 pint1
 11215                                  ;  173  1166 cmpneg
 11216                                  ;  174  1173 prs
 11217                                  ;  175  1177 expect
 11218                                  ;  176  1184 eqstr
 11219                                  ;  177  1190 expr2
 11220                                  ;  178  1196 expr
 11221                                  ;  179  1201 getlex
 11222                                  ;  180  1208 typeName
 11223                                  ;  181  1217 error1
 11224                                  ;  182  1224 checkreg
 11225                                  ;  183  1233 doreg1
 11226                                  ;  184  1240 searchname
 11227                                  ;  185  1251 gettypes
 11228                                  ;  186  1260 error1
 11229                                  ;  187  1267 isrelational
 11230                                  ;  188  1280 error1
 11231                                  ;  189  1287 istoken
 11232                                  ;  190  1295 error1
 11233                                  ;  191  1302 istoken
 11234                                  ;  192  1310 prs
 11235                                  ;  193  1314 prs
 11236                                  ;  194  1318 prs
 11237                                  ;  195  1322 prs
 11238                                  ;  196  1326 prs
 11239                                  ;  197  1330 v
 11240                                  ;  198  1332 prs
 11241                                  ;  199  1336 pint1
 11242                                  ;  200  1342 adrofname
 11243                                  ;  201  1352 prs
 11244                                  ;  202  1356 prs
 11245                                  ;  203  1360 typeName
 11246                                  ;  204  1369 checkreg
 11247                                  ;  205  1378 prs
 11248                                  ;  206  1382 printreg
 11249                                  ;  207  1391 v
 11250                                  ;  208  1393 prs
 11251                                  ;  209  1397 printreg
 11252                                  ;  210  1406 error1
 11253                                  ;  211  1413 searchname
 11254                                  ;  212  1424 gettypes
 11255                                  ;  213  1433 error1
 11256                                  ;  214  1440 prs
 11257                                  ;  215  1444 printreg
 11258                                  ;  216  1453 error1
 11259                                  ;  217  1460 prs
 11260                                  ;  218  1464 a
 11261                                  ;  219  1466 prs
 11262                                  ;  220  1470 prs
 11263                                  ;  221  1474 prs
 11264                                  ;  222  1478 v
 11265                                  ;  223  1480 adrofname
 11266                                  ;  224  1490 prs
 11267                                  ;  225  1494 prs
 11268                                  ;  226  1498 error1
 11269                                  ;  227  1505 istoken
 11270                                  ;  228  1513 strcpy
 11271                                  ;  229  1520 istoken
 11272                                  ;  230  1528 strcpy
 11273                                  ;  231  1535 istoken
 11274                                  ;  232  1543 strcpy
 11275                                  ;  233  1550 istoken
 11276                                  ;  234  1558 strcpy
 11277                                  ;  235  1565 istoken
 11278                                  ;  236  1573 strcpy
 11279                                  ;  237  1580 istoken
 11280                                  ;  238  1588 strcpy
 11281                                  ;  239  1595 istoken
 11282                                  ;  240  1603 strcpy
 11283                                  ;  241  1610 getlex
 11284                                  ;  242  1617 isrelational
 11285                                  ;  243  1630 error1
 11286                                  ;  244  1637 strcpy
 11287                                  ;  245  1644 prnl
 11288                                  ;  246  1649 prs
 11289                                  ;  247  1653 prs
 11290                                  ;  248  1657 printreg
 11291                                  ;  249  1666 prs
 11292                                  ;  250  1670 istoken
 11293                                  ;  251  1678 pint1
 11294                                  ;  252  1684 typeName
 11295                                  ;  253  1693 checkreg
 11296                                  ;  254  1702 printreg
 11297                                  ;  255  1711 searchname
 11298                                  ;  256  1722 a
 11299                                  ;  257  1724 v
 11300                                  ;  258  1726 cmpneg
 11301                                  ;  259  1733 prs
 11302                                  ;  260  1737 expect
 11303                                  ;  261  1744 strlen
 11304                                  ;  262  1751 eqstr
 11305                                  ;  263  1757 eqstr
 11306                                  ;  264  1763 eqstr
 11307                                  ;  265  1769 eqstr
 11308                                  ;  266  1775 eqstr
 11309                                  ;  267  1781 eqstr
 11310                                  ;  268  1787 eqstr
 11311                                  ;  269  1793 eqstr
 11312                                  ;  270  1799 eqstr
 11313                                  ;  271  1805 eqstr
 11314                                  ;  272  1811 eqstr
 11315                                  ;  273  1817 eqstr
 11316                                  ;  274  1823 eqstr
 11317                                  ;  275  1829 eqstr
 11318                                  ;  276  1835 eqstr
 11319                                  ;  277  1841 eqstr
 11320                                  ;  278  1847 eqstr
 11321                                  ;  279  1853 eqstr
 11322                                  ;  280  1859 eqstr
 11323                                  ;  281  1865 eqstr
 11324                                  ;  282  1871 eqstr
 11325                                  ;  283  1877 eqstr
 11326                                  ;  284  1883 strlen
 11327                                  ;  285  1890 eqstr
 11328                                  ;  286  1896 eqstr
 11329                                  ;  287  1902 eqstr
 11330                                  ;  288  1908 eqstr
 11331                                  ;  289  1914 eqstr
 11332                                  ;  290  1920 eqstr
 11333                                  ;  291  1926 eqstr
 11334                                  ;  292  1932 eqstr
 11335                                  ;  293  1938 eqstr
 11336                                  ;  294  1944 prc
 11337                                  ;  295  1948 prc
 11338                                  ;  296  1952 prc
 11339                                  ;  297  1956 istoken
 11340                                  ;  298  1964 prs
 11341                                  ;  299  1968 pint1
 11342                                  ;  300  1974 typeName
 11343                                  ;  301  1983 checkreg
 11344                                  ;  302  1992 doreg1
 11345                                  ;  303  1999 docall1
 11346                                  ;  304  2007 isreg
 11347                                  ;  305  2013 searchname
 11348                                  ;  306  2024 gettypes
 11349                                  ;  307  2033 istoken
 11350                                  ;  308  2041 istoken
 11351                                  ;  309  2049 expect
 11352                                  ;  310  2056 searchname
 11353                                  ;  311  2067 expect
 11354                                  ;  312  2074 expect
 11355                                  ;  313  2081 gettypes
 11356                                  ;  314  2090 error1
 11357                                  ;  315  2097 istoken
 11358                                  ;  316  2105 error1
 11359                                  ;  317  2112 prs
 11360                                  ;  318  2116 prs
 11361                                  ;  319  2120 prs
 11362                                  ;  320  2124 v
 11363                                  ;  321  2126 istoken
 11364                                  ;  322  2134 error1
 11365                                  ;  323  2141 prs
 11366                                  ;  324  2145 prs
 11367                                  ;  325  2149 prs
 11368                                  ;  326  2153 v
 11369                                  ;  327  2155 istoken
 11370                                  ;  328  2163 compoundass
 11371                                  ;  329  2175 istoken
 11372                                  ;  330  2183 compoundass
 11373                                  ;  331  2195 istoken
 11374                                  ;  332  2203 compoundass
 11375                                  ;  333  2215 istoken
 11376                                  ;  334  2223 compoundass
 11377                                  ;  335  2235 istoken
 11378                                  ;  336  2243 error1
 11379                                  ;  337  2250 istoken
 11380                                  ;  338  2258 error1
 11381                                  ;  339  2265 istoken
 11382                                  ;  340  2273 expr
 11383                                  ;  341  2278 doassign
 11384                                  ;  342  2287 dovar1
 11385                                  ;  343  2294 istoken
 11386                                  ;  344  2302 rterm
 11387                                  ;  345  2308 istoken
 11388                                  ;  346  2316 rterm
 11389                                  ;  347  2322 istoken
 11390                                  ;  348  2330 rterm
 11391                                  ;  349  2336 istoken
 11392                                  ;  350  2344 rterm
 11393                                  ;  351  2350 istoken
 11394                                  ;  352  2358 rterm
 11395                                  ;  353  2364 istoken
 11396                                  ;  354  2372 rterm
 11397                                  ;  355  2378 istoken
 11398                                  ;  356  2386 domul
 11399                                  ;  357  2392 istoken
 11400                                  ;  358  2400 doidiv
 11401                                  ;  359  2407 istoken
 11402                                  ;  360  2415 domod
 11403                                  ;  361  2421 isrelational
 11404                                  ;  362  2434 rterm
 11405                                  ;  363  2440 cmpneg
 11406                                  ;  364  2447 error1
 11407                                  ;  365  2454 prnl
 11408                                  ;  366  2459 prs
 11409                                  ;  367  2463 prs
 11410                                  ;  368  2467 gettypes
 11411                                  ;  369  2476 prs
 11412                                  ;  370  2480 prs
 11413                                  ;  371  2484 v
 11414                                  ;  372  2486 prs
 11415                                  ;  373  2490 expect
 11416                                  ;  374  2497 pint1
 11417                                  ;  375  2503 gettypes
 11418                                  ;  376  2512 prs
 11419                                  ;  377  2516 v
 11420                                  ;  378  2518 prnl
 11421                                  ;  379  2523 prs
 11422                                  ;  380  2527 prs
 11423                                  ;  381  2531 prs
 11424                                  ;  382  2535 prnl
 11425                                  ;  383  2540 prs
 11426                                  ;  384  2544 prs
 11427                                  ;  385  2548 a
 11428                                  ;  386  2550 prs
 11429                                  ;  387  2554 v
 11430                                  ;  388  2556 prs
 11431                                  ;  389  2560 prs
 11432                                  ;  390  2564 prs
 11433                                  ;  391  2568 prs
 11434                                  ;  392  2572 prs
 11435                                  ;  393  2576 prc
 11436                                  ;  394  2580 printName
 11437                                  ;  395  2590 prs
 11438                                  ;  396  2594 prnl
 11439                                  ;  397  2599 prs
 11440                                  ;  398  2603 prs
 11441                                  ;  399  2607 prs
 11442                                  ;  400  2611 prs
 11443                                  ;  401  2615 v
 11444                                  ;  402  2617 istoken
 11445                                  ;  403  2625 prnl
 11446                                  ;  404  2630 prs
 11447                                  ;  405  2634 prs
 11448                                  ;  406  2638 prs
 11449                                  ;  407  2642 prs
 11450                                  ;  408  2646 pint1
 11451                                  ;  409  2652 typeName
 11452                                  ;  410  2661 searchname
 11453                                  ;  411  2672 istoken
 11454                                  ;  412  2680 searchname
 11455                                  ;  413  2691 expect
 11456                                  ;  414  2698 expect
 11457                                  ;  415  2705 gettypes
 11458                                  ;  416  2714 error1
 11459                                  ;  417  2721 eqstr
 11460                                  ;  418  2727 dovar1
 11461                                  ;  419  2734 eqstr
 11462                                  ;  420  2740 doreg
 11463                                  ;  421  2746 eqstr
 11464                                  ;  422  2752 doreg
 11465                                  ;  423  2758 eqstr
 11466                                  ;  424  2764 doreg
 11467                                  ;  425  2770 eqstr
 11468                                  ;  426  2776 doreg
 11469                                  ;  427  2782 eqstr
 11470                                  ;  428  2788 doreg
 11471                                  ;  429  2794 eqstr
 11472                                  ;  430  2800 doreg
 11473                                  ;  431  2806 eqstr
 11474                                  ;  432  2812 doreg
 11475                                  ;  433  2818 eqstr
 11476                                  ;  434  2824 doreg
 11477                                  ;  435  2830 eqstr
 11478                                  ;  436  2836 doreg
 11479                                  ;  437  2842 eqstr
 11480                                  ;  438  2848 doreg
 11481                                  ;  439  2854 eqstr
 11482                                  ;  440  2860 doreg
 11483                                  ;  441  2866 eqstr
 11484                                  ;  442  2872 doreg
 11485                                  ;  443  2878 eqstr
 11486                                  ;  444  2884 doreg
 11487                                  ;  445  2890 eqstr
 11488                                  ;  446  2896 doreg
 11489                                  ;  447  2902 eqstr
 11490                                  ;  448  2908 doreg
 11491                                  ;  449  2914 expect
 11492                                  ;  450  2921 prs
 11493                                  ;  451  2925 prs
 11494                                  ;  452  2929 prs
 11495                                  ;  453  2933 istoken
 11496                                  ;  454  2941 pint1
 11497                                  ;  455  2947 istoken
 11498                                  ;  456  2955 searchname
 11499                                  ;  457  2966 v
 11500                                  ;  458  2968 error1
 11501                                  ;  459  2975 gettypes
 11502                                  ;  460  2984 prs
 11503                                  ;  461  2988 v
 11504                                  ;  462  2990 prs
 11505                                  ;  463  2994 prs
 11506                                  ;  464  2998 prs
 11507                                  ;  465  3002 a
 11508                                  ;  466  3004 prs
 11509                                  ;  467  3008 prs
 11510                                  ;  468  3012 pint1
 11511                                  ;  469  3018 v
 11512                                  ;  470  3020 prs
 11513                                  ;  471  3024 prs
 11514                                  ;  472  3028 printName
 11515                                  ;  473  3038 prs
 11516                                  ;  474  3042 prs
 11517                                  ;  475  3046 prs
 11518                                  ;  476  3050 prs
 11519                                  ;  477  3054 v
 11520                                  ;  478  3056 prs
 11521                                  ;  479  3060 prs
 11522                                  ;  480  3064 prs
 11523                                  ;  481  3068 v
 11524                                  ;  482  3070 prs
 11525                                  ;  483  3074 prs
 11526                                  ;  484  3078 prs
 11527                                  ;  485  3082 v
 11528                                  ;  486  3084 prs
 11529                                  ;  487  3088 rterm
 11530                                  ;  488  3094 istoken
 11531                                  ;  489  3102 prs
 11532                                  ;  490  3106 pint1
 11533                                  ;  491  3112 prs
 11534                                  ;  492  3116 error1
 11535                                  ;  493  3123 istoken
 11536                                  ;  494  3131 prs
 11537                                  ;  495  3135 pint1
 11538                                  ;  496  3141 prs
 11539                                  ;  497  3145 prs
 11540                                  ;  498  3149 typeName
 11541                                  ;  499  3158 searchname
 11542                                  ;  500  3169 error1
 11543                                  ;  501  3176 gettypes
 11544                                  ;  502  3185 error1
 11545                                  ;  503  3192 error1
 11546                                  ;  504  3199 prs
 11547                                  ;  505  3203 v
 11548                                  ;  506  3205 prs
 11549                                  ;  507  3209 prs
 11550                                  ;  508  3213 doidiv
 11551                                  ;  509  3220 prs
 11552                                  ;  510  3224 checknamelen
 11553                                  ;  511  3237 strcpy
 11554                                  ;  512  3244 storecall
 11555                                  ;  513  3254 expect
 11556                                  ;  514  3261 istoken
 11557                                  ;  515  3269 error1
 11558                                  ;  516  3276 istoken
 11559                                  ;  517  3284 istoken
 11560                                  ;  518  3292 eprs
 11561                                  ;  519  3297 eprs
 11562                                  ;  520  3302 eprc
 11563                                  ;  521  3307 eprnum
 11564                                  ;  522  3314 eprs
 11565                                  ;  523  3319 eprc
 11566                                  ;  524  3324 eprs
 11567                                  ;  525  3329 eprc
 11568                                  ;  526  3334 eprs
 11569                                  ;  527  3339 istoken
 11570                                  ;  528  3347 name1
 11571                                  ;  529  3353 searchname
 11572                                  ;  530  3364 istoken
 11573                                  ;  531  3372 checkreg
 11574                                  ;  532  3381 searchname
 11575                                  ;  533  3392 error1
 11576                                  ;  534  3399 istoken
 11577                                  ;  535  3407 expect
 11578                                  ;  536  3414 prs
 11579                                  ;  537  3418 pint1
 11580                                  ;  538  3424 prs
 11581                                  ;  539  3428 prs
 11582                                  ;  540  3432 prc
 11583                                  ;  541  3436 pint1
 11584                                  ;  542  3442 prs
 11585                                  ;  543  3446 v
 11586                                  ;  544  3448 prs
 11587                                  ;  545  3452 gettypes
 11588                                  ;  546  3461 prs
 11589                                  ;  547  3465 v
 11590                                  ;  548  3467 prs
 11591                                  ;  549  3471 v
 11592                                  ;  550  3473 prs
 11593                                  ;  551  3477 prs
 11594                                  ;  552  3481 printreg
 11595                                  ;  553  3490 prs
 11596                                  ;  554  3494 prs
 11597                                  ;  555  3498 prs
 11598                                  ;  556  3502 pint1
 11599                                  ;  557  3508 getarg
 11600                                  ;  558  3515 setblock
 11601                                  ;  559  3524 error1
 11602                                  ;  560  3531 allocmem
 11603                                  ;  561  3540 error1
 11604                                  ;  562  3547 getfirstchar
 11605                                  ;  563  3560 parse
 11606                                  ;  564  3566 checkcalls
 11607                                  ;  565  3577 epilog
 11608                                  ;  566  3584 fgets1
 11609                                  ;  567  3591 cputs
 11610                                  ;  568  3597 cputs
 11611                                  ;  569  3603 readRL
 11612                                  ;  570  3610 prnl
 11613                                  ;  571  3615 strcpy
 11614                                  ;  572  3622 instr1
 11615                                  ;  573  3629 strcat1
 11616                                  ;  574  3637 toupper
 11617                                  ;  575  3645 strcpy
 11618                                  ;  576  3652 strlen
 11619                                  ;  577  3659 openR
 11620                                  ;  578  3665 cputs
 11621                                  ;  579  3671 cputs
 11622                                  ;  580  3677 exitR
 11623                                  ;  581  3683 creatR
 11624                                  ;  582  3690 cputs
 11625                                  ;  583  3696 cputs
 11626                                  ;  584  3702 exitR
 11627                                  ;  585  3708 prs
 11628                                  ;  586  3712 prs
 11629                                  ;  587  3716 prs
 11630                                  ;  588  3720 prs
 11631                                  ;  589  3724 prs
 11632                                  ;  590  3728 prs
 11633                                  ;  591  3732 prs
 11634                                  ;  592  3736 getlex
 11635                                  ;  593  3743 istoken
 11636                                  ;  594  3751 istoken
 11637                                  ;  595  3759 dodefine
 11638                                  ;  596  3768 istoken
 11639                                  ;  597  3776 doinclude
 11640                                  ;  598  3786 error1
 11641                                  ;  599  3793 typeName
 11642                                  ;  600  3802 dofunc
 11643                                  ;  601  3809 doglob
 11644                                  ;  602  3816 prs
 11645                                  ;  603  3820 from_far
 11646                                  ;  604  3829 adrF
 11647                                  ;  605  3834 eqstr
 11648                                  ;  606  3840 prs
 11649                                  ;  607  3844 prs
 11650                                  ;  608  3848 prs
 11651                                  ;  609  3852 printint51
 11652                                  ;  610  3863 error1
 11653                                  ;  611  3870 prs
 11654                                  ;  612  3874 prs
 11655                                  ;  613  3878 prs
 11656                                  ;  614  3882 openR
 11657                                  ;  615  3888 prs
 11658                                  ;  616  3892 prs
 11659                                  ;  617  3896 error1
 11660                                  ;  618  3903 parse
 11661                                  ;  619  3909 prs
 11662                                  ;  620  3913 prs
 11663                                  ;  621  3917 getfirstchar
 11664                                  ;  622  3930 getlex
 11665                                  ;  623  3937 eqstr
 11666                                  ;  624  3943 getlex
 11667                                  ;  625  3950 eqstr
 11668                                  ;  626  3956 getlex
 11669                                  ;  627  3963 prs
 11670                                  ;  628  3967 strcpy
 11671                                  ;  629  3974 prs
 11672                                  ;  630  3978 error1
 11673                                  ;  631  3985 getlex
 11674                                  ;  632  3992 expect
 11675                                  ;  633  3999 error1
 11676                                  ;  634  4006 strlen
 11677                                  ;  635  4013 error1
 11678                                  ;  636  4020 adrofname
 11679                                  ;  637  4030 strcpy
 11680                                  ;  638  4037 expect
 11681                                  ;  639  4044 istoken
 11682                                  ;  640  4052 istoken
 11683                                  ;  641  4060 stmt
 11684                                  ;  642  4065 istoken
 11685                                  ;  643  4073 doif
 11686                                  ;  644  4078 istoken
 11687                                  ;  645  4086 dodo
 11688                                  ;  646  4091 istoken
 11689                                  ;  647  4099 dowhile
 11690                                  ;  648  4107 istoken
 11691                                  ;  649  4115 prs
 11692                                  ;  650  4119 name1
 11693                                  ;  651  4125 prs
 11694                                  ;  652  4129 expect
 11695                                  ;  653  4136 prs
 11696                                  ;  654  4140 next
 11697                                  ;  655  4145 prc
 11698                                  ;  656  4149 next
 11699                                  ;  657  4154 getlex
 11700                                  ;  658  4161 istoken
 11701                                  ;  659  4169 prs
 11702                                  ;  660  4173 next
 11703                                  ;  661  4178 prc
 11704                                  ;  662  4182 next
 11705                                  ;  663  4187 getlex
 11706                                  ;  664  4194 error1
 11707                                  ;  665  4201 istoken
 11708                                  ;  666  4209 doemit
 11709                                  ;  667  4216 istoken
 11710                                  ;  668  4224 istoken
 11711                                  ;  669  4232 exprstart
 11712                                  ;  670  4242 prs
 11713                                  ;  671  4246 prs
 11714                                  ;  672  4250 expect
 11715                                  ;  673  4257 prs
 11716                                  ;  674  4261 prs
 11717                                  ;  675  4265 prc
 11718                                  ;  676  4269 expect
 11719                                  ;  677  4276 expect
 11720                                  ;  678  4283 exprstart
 11721                                  ;  679  4293 expect
 11722                                  ;  680  4300 prs
 11723                                  ;  681  4304 getlex
 11724                                  ;  682  4311 pint1
 11725                                  ;  683  4317 getlex
 11726                                  ;  684  4324 prc
 11727                                  ;  685  4328 expect
 11728                                  ;  686  4335 prs
 11729                                  ;  687  4339 prs
 11730                                  ;  688  4343 prs
 11731                                  ;  689  4347 prs
 11732                                  ;  690  4351 prs
 11733                                  ;  691  4355 pint1
 11734                                  ;  692  4361 prs
 11735                                  ;  693  4365 prs
 11736                                  ;  694  4369 pint1
 11737                                  ;  695  4375 prs
 11738                                  ;  696  4379 prs
 11739                                  ;  697  4383 prs
 11740                                  ;  698  4387 error1
 11741                                  ;  699  4394 prs
 11742                                  ;  700  4398 prs
 11743                                  ;  701  4402 pint1
 11744                                  ;  702  4408 prc
 11745                                  ;  703  4412 prs
 11746                                  ;  704  4416 prs
 11747                                  ;  705  4420 pint1
 11748                                  ;  706  4426 pexpr
 11749                                  ;  707  4432 pint1
 11750                                  ;  708  4438 stmt
 11751                                  ;  709  4443 istoken
 11752                                  ;  710  4451 prjump
 11753                                  ;  711  4458 prlabel
 11754                                  ;  712  4466 stmt
 11755                                  ;  713  4471 prlabel
 11756                                  ;  714  4479 prlabel
 11757                                  ;  715  4487 prlabel
 11758                                  ;  716  4495 stmt
 11759                                  ;  717  4500 expect
 11760                                  ;  718  4507 pexpr
 11761                                  ;  719  4513 pint1
 11762                                  ;  720  4519 prjump
 11763                                  ;  721  4526 prlabel
 11764                                  ;  722  4534 prlabel
 11765                                  ;  723  4542 pexpr
 11766                                  ;  724  4548 pint1
 11767                                  ;  725  4554 stmt
 11768                                  ;  726  4559 prjump
 11769                                  ;  727  4566 prlabel
 11770                                  ;  728  4574 getlex
 11771                                  ;  729  4581 next
 11772                                  ;  730  4586 next
 11773                                  ;  731  4591 next
 11774                                  ;  732  4596 next
 11775                                  ;  733  4601 next
 11776                                  ;  734  4606 next
 11777                                  ;  735  4611 next
 11778                                  ;  736  4616 next
 11779                                  ;  737  4621 next
 11780                                  ;  738  4626 next
 11781                                  ;  739  4631 next
 11782                                  ;  740  4636 next
 11783                                  ;  741  4641 next
 11784                                  ;  742  4646 next
 11785                                  ;  743  4651 next
 11786                                  ;  744  4656 instr1
 11787                                  ;  745  4663 next
 11788                                  ;  746  4668 getlex
 11789                                  ;  747  4675 next
 11790                                  ;  748  4680 next
 11791                                  ;  749  4685 getlex
 11792                                  ;  750  4692 getstring
 11793                                  ;  751  4702 digit
 11794                                  ;  752  4708 getdigit
 11795                                  ;  753  4717 next
 11796                                  ;  754  4722 next
 11797                                  ;  755  4727 next
 11798                                  ;  756  4732 alnum
 11799                                  ;  757  4738 strcpy
 11800                                  ;  758  4745 alnum
 11801                                  ;  759  4751 next
 11802                                  ;  760  4756 eqstr
 11803                                  ;  761  4762 eqstr
 11804                                  ;  762  4768 eqstr
 11805                                  ;  763  4774 eqstr
 11806                                  ;  764  4780 eqstr
 11807                                  ;  765  4786 eqstr
 11808                                  ;  766  4792 eqstr
 11809                                  ;  767  4798 eqstr
 11810                                  ;  768  4804 eqstr
 11811                                  ;  769  4810 eqstr
 11812                                  ;  770  4816 eqstr
 11813                                  ;  771  4822 eqstr
 11814                                  ;  772  4828 eqstr
 11815                                  ;  773  4834 eqstr
 11816                                  ;  774  4840 eqstr
 11817                                  ;  775  4846 eqstr
 11818                                  ;  776  4852 eqstr
 11819                                  ;  777  4858 convertdefine
 11820                                  ;  778  4872 strcpy
 11821                                  ;  779  4879 error1
 11822                                  ;  780  4886 adrofname
 11823                                  ;  781  4896 eqstr
 11824                                  ;  782  4902 next
 11825                                  ;  783  4907 alnum
 11826                                  ;  784  4913 next
 11827                                  ;  785  4918 digit
 11828                                  ;  786  4924 next
 11829                                  ;  787  4929 next
 11830                                  ;  788  4934 next
 11831                                  ;  789  4939 fgets1
 11832                                  ;  790  4946 getlex
 11833                                  ;  791  4953 istoken
 11834                                  ;  792  4961 prs
 11835                                  ;  793  4965 listproc
 11836                                  ;  794  4974 prs
 11837                                  ;  795  4978 pint1
 11838                                  ;  796  4984 error1
 11839                                  ;  797  4991 eprc
 11840                                  ;  798  4996 writetty
 11841                                  ;  799  5005 writetty
 11842                                  ;  800  5014 fputcR
 11843                                  ;  801  5021 prc
 11844                                  ;  802  5025 prs
 11845                                  ;  803  5029 prc
 11846                                  ;  804  5033 eprc
 11847                                  ;  805  5038 mkneg
 11848                                  ;  806  5044 eprnum
 11849                                  ;  807  5051 eprc
 11850                                  ;  808  5056 prc
 11851                                  ;  809  5060 mkneg
 11852                                  ;  810  5066 pint1
 11853                                  ;  811  5072 prc
 11854                                  ;  812  5076 prc
 11855                                  ;  813  5080 prc
 11856                                  ;  814  5084 prc
 11857                                  ;  815  5088 prc
 11858                                  ;  816  5092 pint1
 11859                                  ;  817  5098 printinputline
 11860                                  ;  818  5113 readRL
 11861                                  ;  819  5120 prs
 11862                                  ;  820  5124 pint1
 11863                                  ;  821  5130 prc
 11864                                  ;  822  5134 prscomment
 11865                                  ;  823  5145 fcloseR
 11866                                  ;  824  5153 fcloseR
 11867                                  ;  825  5161 exitR
 11868                                  ;  826  5167 prnl
 11869                                  ;  827  5172 prscomment
 11870                                  ;  828  5183 prs
 11871                                  ;  829  5187 pint1
 11872                                  ;  830  5193 prs
 11873                                  ;  831  5197 prs
 11874                                  ;  832  5201 prs
 11875                                  ;  833  5205 pint1
 11876                                  ;  834  5211 prs
 11877                                  ;  835  5215 pint1
 11878                                  ;  836  5221 prs
 11879                                  ;  837  5225 prc
 11880                                  ;  838  5229 prs
 11881                                  ;  839  5233 pint1
 11882                                  ;  840  5239 prs
 11883                                  ;  841  5243 prs
 11884                                  ;  842  5247 end1
 11885                                  ;  843  5252 prs
 11886                                  ;  844  5256 prs
 11887                                  ;  845  5260 prs
 11888                                  ;  846  5264 pint1
 11889                                  ;  847  5270 prs
 11890                                  ;  848  5274 listvar
 11891                                  ;  849  5282 prs
 11892                                  ;  850  5286 printint51
 11893                                  ;  851  5297 prc
 11894                                  ;  852  5301 prs
 11895                                  ;  853  5305 prs
 11896                                  ;  854  5309 prs
 11897                                  ;  855  5313 prs
 11898                                  ;  856  5317 prs
 11899                                  ;  857  5321 prs
 11900                                  ;  858  5325 prs
 11901                                  ;  859  5329 prs
 11902                                  ;  860  5333 prs
 11903                                  ;  861  5337 printint51
 11904                                  ;  862  5348 printint51
 11905                                  ;  863  5359 prs
 11906                                  ;  864  5363 prs
 11907                                  ;  865  5367 prc
 11908                                  ;  866  5371 adrofname
 11909                                  ;  867  5381 prs
 11910                                  ;  868  5385 prc
 11911                                  ;  869  5389 pint1
 11912                                  ;  870  5395 prc
 11913                                  ;  871  5399 pint1
 11914                                  ;  872  5405 prc
 11915                                  ;  873  5409 prs
 11916                                  ;  874  5413 prc
 11917                                  ;  875  5417 pint1
 11918                                  ;  876  5423 prs
 11919                                  ;  877  5427 calllisting
 11920                                  ;  878  5439 prs
 11921                                  ;  879  5443 printint51
 11922                                  ;  880  5454 prc
 11923                                  ;  881  5458 prs
 11924                                  ;  882  5462 printint51
 11925                                  ;  883  5473 prc
 11926                                  ;  884  5477 from_far
 11927                                  ;  885  5486 prs
 11928                                  ;  886  5490 adrF
 11929                                  ;  887  5495 from_far
 11930                                  ;  888  5504 eqstr
 11931                                  ;  889  5510 prs
 11932                                  ;  890  5514 countcalls
 11933                                  ;  891  5525 funclisting
 11934                                  ;  892  5537 prs
 11935                                  ;  893  5541 printint51
 11936                                  ;  894  5552 printint51
 11937                                  ;  895  5563 prs
 11938                                  ;  896  5567 printint51
 11939                                  ;  897  5578 prc
 11940                                  ;  898  5582 prs
 11941                                  ;  899  5586 prs
 11942                                  ;  900  5590 prs
 11943                                  ;  901  5594 prs
 11944                                  ;  902  5598 prc
 11945                                  ;  903  5602 prc
 11946                                  ;  904  5606 adrF
 11947                                  ;  905  5611 prs
 11948                                  ;  906  5615 strcpy
 11949                                  ;  907  5622 storefunc
 11950                                  ;  908  5632 prs
 11951                                  ;  909  5636 prs
 11952                                  ;  910  5640 listvar
 11953                                  ;  911  5648 listfunc
 11954                                  ;  912  5657 listcall
 11955                                  ;  913  5666 prs
 11956                                  ;  914  5670 prs
 11957                                  ;  915  5674 prs
 11958                                  ;  916  5678 prs
 11959                                  ;  917  5682 prs
 11960                                  ;  918  5686 printint51
 11961                                  ;  919  5697 prs
 11962                                  ;  920  5701 printint51
 11963                                  ;  921  5712 prs
 11964                                  ;  922  5716 printint51
 11965                                  ;  923  5727 prs
 11966                                  ;  924  5731 printint51
 11967                                  ;  925  5742 prs
 11968                                  ;  926  5746 printint51
 11969                                  ;  927  5757 prs
 11970                                  ;  928  5761 printint51
 11971                                  ;  929  5772 prs
 11972                                  ;  930  5776 printint51
 11973                                  ;  931  5787 prs
 11974                                  ;  932  5791 printint51
 11975                                  ;  933  5802 prs
 11976                                  ;  934  5806 printint51
 11977                                  ;  935  5817 prs
 11978                                  ;  936  5821 printint51
 11979                                  ;  937  5832 prs
 11980                                  ;  938  5836 printint51
 11981                                  ;  939  5847 prs
 11982                                  ;  940  5851 printint51
 11983                                  ;  941  5862 prs
 11984                                  ;  942  5866 prs
 11985                                  ;  943  5870 pint1
 11986                                  ;  944  5876 prs
 11987                                  ;  945  5880 printint51
 11988                                  ;  946  5891 prs
 11989                                  ;  947  5895 prs
 11990                                  ;  948  5899 prs
 11991                                  ;  949  5903 prs
 11992                                  ;  950  5907 printint51
 11993                                  ;  951  5918 prs
 11994                                  ;  952  5922 printint51
 11995                                  ;  953  5933 prs
 11996                                  ;  954  5937 printint51
 11997                                  ;  955  5948 prs
 11998                                  ;  956  5952 end1
 11999                                  ;  957  5957 DosInt
 12000                                  ;  958  5964 DosInt
 12001                                  ;Input: A.C, List: A.S,  Lines: 1002
 12002                                  ;Glob. variables:  129 max.:  200
 12003                                  ;Functions      :  106 max.:  300
 12004                                  ;Calls          :  959 max.: 2000, NameField: 5971 max.:    -1
 12005                                  ;Code until     :21541 max.: 30000, free: 8459
 12006                                  ;Data (HeapEnd) :-11988, resting stacksize: 11987
 12007                                  ;Max. Const in 'epilog' :  947 max. 3000, free: 2053
