     1                                  
     2                                  ; A.COM V0.9, Source: A.C, Output asm: A.S
     3                                  org  256 
     4 00000000 E96930                  jmp main
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
   163                                  absolute 33000
   164 000080E8 <res 00000043>          coname resb 67
   165                                  section .text
   166 00000016 0000                    cloc dw 0
   167                                  
   168                                  ;-50 int fdin=0;        int fdout=0;      char symbol[128];
   169                                  
   170 00000018 0000                    fdin dw 0
   171 0000001A 0000                    fdout dw 0
   172                                  section .bss
   173                                  absolute 33067
   174 0000812B <res 00000080>          symbol resb 128
   175                                  section .text
   176                                  
   177                                  ;-51 char fname[CMDLENMAX];               char namein[CMDLENMAX];
   178                                  
   179                                  section .bss
   180                                  absolute 33195
   181 000081AB <res 00000043>          fname resb 67
   182                                  section .text
   183                                  section .bss
   184                                  absolute 33262
   185 000081EE <res 00000043>          namein resb 67
   186                                  section .text
   187                                  
   188                                  ;-52 char namelst[CMDLENMAX];             char archivename[CMDLENMAX];
   189                                  
   190                                  section .bss
   191                                  absolute 33329
   192 00008231 <res 00000043>          namelst resb 67
   193                                  section .text
   194                                  section .bss
   195                                  absolute 33396
   196 00008274 <res 00000043>          archivename resb 67
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
   230                                  absolute 33463
   231 000082B7 <res 0000012C>          GType resb 300
   232                                  section .text
   233                                  
   234                                  ;-59 int signi;       char issign;  char GSign [VARMAX]; // 0=U, 1=S
   235                                  
   236 00000033 0000                    signi dw 0
   237 00000035 00                      issign db 0
   238                                  section .bss
   239                                  absolute 33763
   240 000083E3 <res 0000012C>          GSign resb 300
   241                                  section .text
   242                                  
   243                                  ;-60 int widthi;      char iswidth; char GWidth[VARMAX]; // 0, 1, 2, 4
   244                                  
   245 00000036 0000                    widthi dw 0
   246 00000038 00                      iswidth db 0
   247                                  section .bss
   248                                  absolute 34063
   249 0000850F <res 0000012C>          GWidth resb 300
   250                                  section .text
   251                                  
   252                                  ;-61              int GAdr[VARMAX]; int  GUsed [VARMAX];
   253                                  
   254                                  section .bss
   255                                  absolute 34363
   256 0000863B <res 00000258>          GAdr resw 300
   257                                  section .text
   258                                  section .bss
   259                                  absolute 34963
   260 00008893 <res 00000258>          GUsed resw 300
   261                                  section .text
   262                                  
   263                                  ;-62 int wi=0;   int GData[VARMAX];  char GNameField[GNAMEMAX];
   264                                  
   265 00000039 0000                    wi dw 0
   266                                  section .bss
   267                                  absolute 35563
   268 00008AEB <res 00000258>          GData resw 300
   269                                  section .text
   270                                  section .bss
   271                                  absolute 36163
   272 00008D43 <res 000012C0>          GNameField resb 4800
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
   283                                  absolute 40963
   284 0000A003 <res 0000012C>          FType resb 300
   285                                  section .text
   286                                  section .bss
   287                                  absolute 41263
   288 0000A12F <res 000007D0>          CType resb 2000
   289                                  section .text
   290                                  
   291                                  ;-65 int  FAdr  [FUNCMAX];        int  CAdr [CALLMAX];
   292                                  
   293                                  section .bss
   294                                  absolute 43263
   295 0000A8FF <res 00000258>          FAdr resw 300
   296                                  section .text
   297                                  section .bss
   298                                  absolute 43863
   299 0000AB57 <res 00000FA0>          CAdr resw 2000
   300                                  section .text
   301                                  
   302                                  ;-66 int  FCalls[FUNCMAX];
   303                                  
   304                                  section .bss
   305                                  absolute 47863
   306 0000BAF7 <res 00000258>          FCalls resw 300
   307                                  section .text
   308                                  
   309                                  ;-67 char FNameField[FNAMEMAX];   //char CNameField[CNAMEMAX];
   310                                  
   311                                  section .bss
   312                                  absolute 48463
   313 0000BD4F <res 000012C0>          FNameField resb 4800
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
   326                                  absolute 53263
   327 0000D00F <res 00000080>          fgetsdest resb 128
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
   571 00000161 E90000                   jmp .retn
   572                                  
   573                                  ;-94 int strcpy(char *s, char *t) {do { *s=*t; s++; t++; } while (*t!=0); *s=0; }
   574                                  
   575 00000164 C9                       .retn: LEAVE
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
   632 000001BC E92100                   jmp .retn
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
   647 000001D7 E90600                   jmp .retn
   648                                  .eqstr11:
   649 000001DA B80100                   mov ax, 1
   650 000001DD E90000                   jmp .retn
   651                                  
   652                                  ;-98 int instr1(char *s, char c) { while(*s) {if (*s==c) return 1; s++;}return 0;}
   653                                  
   654 000001E0 C9                       .retn: LEAVE
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
   676 00000204 E90B00                   jmp .retn
   677                                  .instr114:
   678 00000207 FF4604                   inc  word[bp+4]
   679 0000020A EBDA                     jmp .instr112
   680                                  .instr113:
   681 0000020C B80000                   mov ax, 0
   682 0000020F E90000                   jmp .retn
   683                                  
   684                                  ;-99 int instr2(char *s, char c) { while(*s) {if (*s==c)return &s; s++;}return 0;}
   685                                  
   686 00000212 C9                       .retn: LEAVE
   687 00000213 C3                       ret
   688                                  ; ENDP
   689                                  
   690                                  instr2:  ; *** PROC ***
   691                                  ;Function : instr2, Number of local variables: 2
   692                                  ;   # type sign width addr used name   list of local variables
   693                                  ;  200 ptr sign byte    99 NULL s = bp+4
   694                                  ;  201 var sign byte    99 NULL c = bp+6;
   695 00000214 C8000000                 ENTER  0,0
   696                                  .instr215:
   697 00000218 8B5E04                   mov bx, [bp+4]
   698 0000021B 8A07                     mov al, [bx]
   699 0000021D B400                     mov ah, 0
   700 0000021F 08C0                     or  al, al
   701 00000221 0F841900                 je .instr216
   702 00000225 8B5E04                   mov bx, [bp+4]
   703 00000228 8A07                     mov al, [bx]
   704 0000022A B400                     mov ah, 0
   705 0000022C 3A4606                   cmp al, [bp+6]
   706 0000022F 0F850600                 jne .instr217
   707 00000233 8B4604                   mov ax, [bp+4]
   708 00000236 E90B00                   jmp .retn
   709                                  .instr217:
   710 00000239 FF4604                   inc  word[bp+4]
   711 0000023C EBDA                     jmp .instr215
   712                                  .instr216:
   713 0000023E B80000                   mov ax, 0
   714 00000241 E90000                   jmp .retn
   715                                  
   716                                  ;-100 int strcat1(char *s, char *t) { while (*s != 0) s++; strcpy(s, t);  }
   717                                  
   718 00000244 C9                       .retn: LEAVE
   719 00000245 C3                       ret
   720                                  ; ENDP
   721                                  
   722                                  strcat1:  ; *** PROC ***
   723                                  ;Function : strcat1, Number of local variables: 2
   724                                  ;   # type sign width addr used name   list of local variables
   725                                  ;  200 ptr sign byte   100 NULL s = bp+4
   726                                  ;  201 ptr sign byte   100 NULL t = bp+6;
   727 00000246 C8000000                 ENTER  0,0
   728                                  .strcat118:
   729 0000024A 8B5E04                   mov bx, [bp+4]
   730 0000024D 8A07                     mov al, [bx]
   731 0000024F B400                     mov ah, 0
   732 00000251 83F800                   cmp ax, 0
   733 00000254 0F840500                 je  .strcat119
   734 00000258 FF4604                   inc  word[bp+4]
   735 0000025B EBED                     jmp .strcat118
   736                                  .strcat119:
   737 0000025D FF7606                   push word [bp+6]
   738 00000260 FF7604                   push word [bp+4]
   739 00000263 E800FF                   call strcpy
   740 00000266 83C404                   add  sp, 4
   741                                  
   742                                  ;-101 int toupper(char *s) {while(*s) {if (*s >= 'a') if (*s <= 'z') *s=*s-32; s++;}}
   743 00000269 C9                       LEAVE
   744 0000026A C3                       ret
   745                                  ; ENDP
   746                                  
   747                                  toupper:  ; *** PROC ***
   748                                  ;Function : toupper, Number of local variables: 1
   749                                  ;   # type sign width addr used name   list of local variables
   750                                  ;  200 ptr sign byte   101 NULL s = bp+4;
   751 0000026B C8000000                 ENTER  0,0
   752                                  .toupper20:
   753 0000026F 8B5E04                   mov bx, [bp+4]
   754 00000272 8A07                     mov al, [bx]
   755 00000274 B400                     mov ah, 0
   756 00000276 08C0                     or  al, al
   757 00000278 0F843000                 je .toupper21
   758 0000027C 8B5E04                   mov bx, [bp+4]
   759 0000027F 8A07                     mov al, [bx]
   760 00000281 B400                     mov ah, 0
   761 00000283 83F861                   cmp ax, 97 ;unsigned : 1
   762 00000286 0F8C1D00                 jl  .toupper22
   763 0000028A 8B5E04                   mov bx, [bp+4]
   764 0000028D 8A07                     mov al, [bx]
   765 0000028F B400                     mov ah, 0
   766 00000291 83F87A                   cmp ax, 122
   767 00000294 0F8F0F00                 jg  .toupper23
   768 00000298 8B5E04                   mov bx, [bp+4]
   769 0000029B 8A07                     mov al, [bx]
   770 0000029D B400                     mov ah, 0
   771 0000029F 83E820                   sub ax, 32
   772 000002A2 8B5E04                   mov  bx, [bp+4]
   773 000002A5 8807                     mov  [bx], al
   774                                  .toupper23:
   775                                  .toupper22:
   776 000002A7 FF4604                   inc  word[bp+4]
   777 000002AA EBC3                     jmp .toupper20
   778                                  .toupper21:
   779                                  
   780                                  ;-102 int pint (int n){int e; if(n<0) {  prc('-');  n=mkneg(n); }
   781 000002AC C9                       LEAVE
   782 000002AD C3                       ret
   783                                  ; ENDP
   784                                  
   785                                  pint:  ; *** PROC ***
   786                                  ;Function : pint, Number of local variables: 2
   787                                  ;   # type sign width addr used name   list of local variables
   788                                  ;  200 var sign word   102 NULL n = bp+4
   789                                  ;  201 var sign word   102 NULL e = bp-2;
   790 000002AE C8020000                 ENTER  2,0
   791 000002B2 8B4604                   mov ax, [bp+4]
   792 000002B5 83F800                   cmp ax, 0
   793 000002B8 0F8D1400                 jge .pint24
   794 000002BC 6A2D                     push 45
   795 000002BE E82E42                   call prc
   796 000002C1 83C402                   add  sp, 2
   797 000002C4 FF7604                   push word [bp+4]
   798 000002C7 E8F8FD                   call mkneg
   799 000002CA 83C402                   add  sp, 2
   800 000002CD 894604                   mov [bp+4], ax
   801                                  
   802                                  ;-103   if (n >= 10) {e=n/10;  pint(e);}  n=n%10; n=n+'0'; putch(n); }
   803                                  
   804                                  .pint24:
   805 000002D0 8B4604                   mov ax, [bp+4]
   806 000002D3 83F80A                   cmp ax, 10 ;unsigned : 1
   807 000002D6 0F8C1500                 jl  .pint25
   808 000002DA 8B4604                   mov ax, [bp+4]
   809 000002DD BB0A00                   mov bx, 10
   810 000002E0 99                       cwd
   811 000002E1 F7FB                     idiv bx
   812 000002E3 8946FE                   mov [bp-2], ax
   813 000002E6 FF76FE                   push word [bp-2]
   814 000002E9 E8C2FF                   call pint
   815 000002EC 83C402                   add  sp, 2
   816                                  .pint25:
   817 000002EF 8B4604                   mov ax, [bp+4]
   818 000002F2 BB0A00                   mov bx, 10
   819 000002F5 99                       cwd
   820 000002F6 F7FB                     idiv bx
   821 000002F8 89D0                     mov ax, dx
   822 000002FA 894604                   mov [bp+4], ax
   823 000002FD 8B4604                   mov ax, [bp+4]
   824 00000300 83C030                   add ax, 48
   825 00000303 894604                   mov [bp+4], ax
   826 00000306 FF7604                   push word [bp+4]
   827 00000309 E86FFD                   call putch
   828 0000030C 83C402                   add  sp, 2
   829                                  
   830                                  ;-104 int digit(char c){ 
   831 0000030F C9                       LEAVE
   832 00000310 C3                       ret
   833                                  ; ENDP
   834                                  
   835                                  digit:  ; *** PROC ***
   836                                  
   837                                  ;-105     if(c<'0') return 0; 
   838                                  
   839                                  ;Function : digit, Number of local variables: 1
   840                                  ;   # type sign width addr used name   list of local variables
   841                                  ;  200 var sign byte   104 NULL c = bp+4;
   842 00000311 C8000000                 ENTER  0,0
   843 00000315 8A4604                   mov al, [bp+4]
   844 00000318 3C30                     cmp al, 48
   845 0000031A 0F8D0600                 jge .digit26
   846 0000031E B80000                   mov ax, 0
   847 00000321 E91500                   jmp .retn
   848                                  
   849                                  ;-106     if(c>'9') return 0; 
   850                                  
   851                                  .digit26:
   852 00000324 8A4604                   mov al, [bp+4]
   853 00000327 3C39                     cmp al, 57
   854 00000329 0F8E0600                 jle .digit27
   855 0000032D B80000                   mov ax, 0
   856 00000330 E90600                   jmp .retn
   857                                  
   858                                  ;-107     return 1; 
   859                                  
   860                                  .digit27:
   861 00000333 B80100                   mov ax, 1
   862 00000336 E90000                   jmp .retn
   863                                  
   864                                  ;-108 }
   865                                  
   866                                  
   867                                  ;-109 int letter(char c) { 
   868                                  
   869 00000339 C9                       .retn: LEAVE
   870 0000033A C3                       ret
   871                                  ; ENDP
   872                                  
   873                                  letter:  ; *** PROC ***
   874                                  
   875                                  ;-110     if (c=='_') return 1;
   876                                  
   877                                  ;Function : letter, Number of local variables: 1
   878                                  ;   # type sign width addr used name   list of local variables
   879                                  ;  200 var sign byte   109 NULL c = bp+4;
   880 0000033B C8000000                 ENTER  0,0
   881 0000033F 8A4604                   mov al, [bp+4]
   882 00000342 3C5F                     cmp al, 95
   883 00000344 0F850600                 jne .letter28
   884 00000348 B80100                   mov ax, 1
   885 0000034B E96900                   jmp .retn
   886                                  
   887                                  ;-111     if (c=='.') return 1;
   888                                  
   889                                  .letter28:
   890 0000034E 8A4604                   mov al, [bp+4]
   891 00000351 3C2E                     cmp al, 46
   892 00000353 0F850600                 jne .letter29
   893 00000357 B80100                   mov ax, 1
   894 0000035A E95A00                   jmp .retn
   895                                  
   896                                  ;-112     if (c=='?') return 1;
   897                                  
   898                                  .letter29:
   899 0000035D 8A4604                   mov al, [bp+4]
   900 00000360 3C3F                     cmp al, 63
   901 00000362 0F850600                 jne .letter30
   902 00000366 B80100                   mov ax, 1
   903 00000369 E94B00                   jmp .retn
   904                                  
   905                                  ;-113     if (c=='$') return 1;
   906                                  
   907                                  .letter30:
   908 0000036C 8A4604                   mov al, [bp+4]
   909 0000036F 3C24                     cmp al, 36
   910 00000371 0F850600                 jne .letter31
   911 00000375 B80100                   mov ax, 1
   912 00000378 E93C00                   jmp .retn
   913                                  
   914                                  ;-114     if (c> 'z') return 0; 
   915                                  
   916                                  .letter31:
   917 0000037B 8A4604                   mov al, [bp+4]
   918 0000037E 3C7A                     cmp al, 122
   919 00000380 0F8E0600                 jle .letter32
   920 00000384 B80000                   mov ax, 0
   921 00000387 E92D00                   jmp .retn
   922                                  
   923                                  ;-115     if (c< '@') return 0;// at included
   924                                  
   925                                  .letter32:
   926 0000038A 8A4604                   mov al, [bp+4]
   927 0000038D 3C40                     cmp al, 64
   928 0000038F 0F8D0600                 jge .letter33
   929 00000393 B80000                   mov ax, 0
   930 00000396 E91E00                   jmp .retn
   931                                  
   932                                  ;-116     if (c> 'Z') { if (c< 'a') return 0; }  
   933                                  
   934                                  .letter33:
   935 00000399 8A4604                   mov al, [bp+4]
   936 0000039C 3C5A                     cmp al, 90
   937 0000039E 0F8E0F00                 jle .letter34
   938 000003A2 8A4604                   mov al, [bp+4]
   939 000003A5 3C61                     cmp al, 97
   940 000003A7 0F8D0600                 jge .letter35
   941 000003AB B80000                   mov ax, 0
   942 000003AE E90600                   jmp .retn
   943                                  .letter35:
   944                                  
   945                                  ;-117     return 1; 
   946                                  
   947                                  .letter34:
   948 000003B1 B80100                   mov ax, 1
   949 000003B4 E90000                   jmp .retn
   950                                  
   951                                  ;-118 }    
   952                                  
   953                                  
   954                                  ;-119 int alnum(char c) {
   955                                  
   956 000003B7 C9                       .retn: LEAVE
   957 000003B8 C3                       ret
   958                                  ; ENDP
   959                                  
   960                                  alnum:  ; *** PROC ***
   961                                  
   962                                  ;-120   if (digit (c)) return 1;
   963                                  
   964                                  ;Function : alnum, Number of local variables: 1
   965                                  ;   # type sign width addr used name   list of local variables
   966                                  ;  200 var sign byte   119 NULL c = bp+4;
   967 000003B9 C8000000                 ENTER  0,0
   968 000003BD 8A4604                   mov al, byte [bp+4]
   969 000003C0 B400                     mov ah, 0
   970 000003C2 50                       push ax
   971 000003C3 E84BFF                   call digit
   972 000003C6 83C402                   add  sp, 2
   973 000003C9 08C0                     or  al, al
   974 000003CB 0F840600                 je .alnum36
   975 000003CF B80100                   mov ax, 1
   976 000003D2 E91E00                   jmp .retn
   977                                  
   978                                  ;-121   if (letter(c)) return 1;
   979                                  
   980                                  .alnum36:
   981 000003D5 8A4604                   mov al, byte [bp+4]
   982 000003D8 B400                     mov ah, 0
   983 000003DA 50                       push ax
   984 000003DB E85DFF                   call letter
   985 000003DE 83C402                   add  sp, 2
   986 000003E1 08C0                     or  al, al
   987 000003E3 0F840600                 je .alnum37
   988 000003E7 B80100                   mov ax, 1
   989 000003EA E90600                   jmp .retn
   990                                  
   991                                  ;-122   return 0;
   992                                  
   993                                  .alnum37:
   994 000003ED B80000                   mov ax, 0
   995 000003F0 E90000                   jmp .retn
   996                                  
   997                                  ;-123 }       
   998                                  
   999                                  
  1000                                  ;-124 int a(unsigned int i) {  printName(i);}//address
  1001                                  
  1002 000003F3 C9                       .retn: LEAVE
  1003 000003F4 C3                       ret
  1004                                  ; ENDP
  1005                                  
  1006                                  a:  ; *** PROC ***
  1007                                  ;Function : a, Number of local variables: 1
  1008                                  ;   # type sign width addr used name   list of local variables
  1009                                  ;  200 var unsg word   124 NULL i = bp+4;
  1010 000003F5 C8000000                 ENTER  0,0
  1011 000003F9 FF7604                   push word [bp+4]
  1012 000003FC E88D05                   call printName
  1013 000003FF 83C402                   add  sp, 2
  1014                                  
  1015                                  ;-125 int v(unsigned int i) {//value 
  1016 00000402 C9                       LEAVE
  1017 00000403 C3                       ret
  1018                                  ; ENDP
  1019                                  
  1020                                  v:  ; *** PROC ***
  1021                                  
  1022                                  ;-126     if (i < LSTART) prc('['); 
  1023                                  
  1024                                  ;Function : v, Number of local variables: 1
  1025                                  ;   # type sign width addr used name   list of local variables
  1026                                  ;  200 var unsg word   125 NULL i = bp+4;
  1027 00000404 C8000000                 ENTER  0,0
  1028 00000408 8B4604                   mov ax, [bp+4]
  1029 0000040B 3DC800                   cmp ax, 200
  1030 0000040E 0F8D0800                 jge .v38
  1031 00000412 6A5B                     push 91
  1032 00000414 E8D840                   call prc
  1033 00000417 83C402                   add  sp, 2
  1034                                  
  1035                                  ;-127     printName(i);
  1036                                  
  1037                                  .v38:
  1038 0000041A FF7604                   push word [bp+4]
  1039 0000041D E86C05                   call printName
  1040 00000420 83C402                   add  sp, 2
  1041                                  
  1042                                  ;-128     if (i < LSTART) prc(']');   
  1043                                  
  1044 00000423 8B4604                   mov ax, [bp+4]
  1045 00000426 3DC800                   cmp ax, 200
  1046 00000429 0F8D0800                 jge .v39
  1047 0000042D 6A5D                     push 93
  1048 0000042F E8BD40                   call prc
  1049 00000432 83C402                   add  sp, 2
  1050                                  
  1051                                  ;-129 }
  1052                                  
  1053                                  .v39:
  1054                                  
  1055                                  ;-130 int checknamelen() { int i;    i=strlen(symbol);
  1056 00000435 C9                       LEAVE
  1057 00000436 C3                       ret
  1058                                  ; ENDP
  1059                                  
  1060                                  checknamelen:  ; *** PROC ***
  1061                                  ;Function : checknamelen, Number of local variables: 1
  1062                                  ;   # type sign width addr used name   list of local variables
  1063                                  ;  200 var sign word   130 NULL i = bp-2;
  1064 00000437 C8020000                 ENTER  2,0
  1065 0000043B 8D062B81                 lea  ax, [symbol]
  1066 0000043F 50                       push ax
  1067 00000440 E8FBFC                   call strlen
  1068 00000443 83C402                   add  sp, 2
  1069 00000446 8946FE                   mov [bp-2], ax
  1070                                  
  1071                                  ;-131   if (i > IDLENMAX) error1("Item name is too long in characters)");
  1072                                  
  1073 00000449 8B46FE                   mov ax, [bp-2]
  1074 0000044C 83F80F                   cmp ax, 15
  1075 0000044F 0F8E0900                 jle .checknamelen40
  1076 00000453 68[5E04]                 push checknamelen_0
  1077 00000456 E8E843                   call error1
  1078 00000459 83C402                   add  sp, 2
  1079                                  
  1080                                  ;-132 }
  1081                                  
  1082                                  .checknamelen40:
  1083                                  
  1084                                  ;-133 char doglobName[IDLENMAX];
  1085 0000045C C9                       LEAVE
  1086 0000045D C3                       ret
  1087                                  ; ENDP
  1088 0000045E 4974656D206E616D65-     checknamelen_0 db "Item name is too long in characters)",0
  1089 00000467 20697320746F6F206C-
  1090 00000470 6F6E6720696E206368-
  1091 00000479 617261637465727329-
  1092 00000482 00                 
  1093                                  section .bss
  1094                                  absolute 53391
  1095 0000D08F <res 0000000F>          doglobName resb 15
  1096                                  section .text
  1097                                  
  1098                                  ;-134 int doglob() { int i; int j; int isstrarr; isstrarr=0;
  1099                                  
  1100                                  
  1101                                  doglob:  ; *** PROC ***
  1102                                  ;Function : doglob, Number of local variables: 3
  1103                                  ;   # type sign width addr used name   list of local variables
  1104                                  ;  200 var sign word   134 NULL i = bp-2
  1105                                  ;  201 var sign word   134 NULL j = bp-4
  1106                                  ;  202 var sign word   134 NULL isstrarr = bp-6;
  1107 00000483 C8060000                 ENTER  6,0
  1108 00000487 B80000                   mov ax, 0
  1109 0000048A 8946FA                   mov [bp-6], ax
  1110                                  
  1111                                  ;-135   if (GTop >= LSTART) error1("Global table full");
  1112                                  
  1113 0000048D A1[2A00]                 mov ax, [GTop]
  1114 00000490 3DC800                   cmp ax, 200 ;unsigned : 1
  1115 00000493 0F8C0900                 jl  .doglob41
  1116 00000497 68[D807]                 push doglob_0
  1117 0000049A E8A443                   call error1
  1118 0000049D 83C402                   add  sp, 2
  1119                                  
  1120                                  ;-136   if (iswidth == 0) error1("no VOID as var type");
  1121                                  
  1122                                  .doglob41:
  1123 000004A0 A0[3800]                 mov al, [iswidth]
  1124 000004A3 3C00                     cmp al, 0
  1125 000004A5 0F850900                 jne .doglob42
  1126 000004A9 68[EA07]                 push doglob_1
  1127 000004AC E89243                   call error1
  1128 000004AF 83C402                   add  sp, 2
  1129                                  
  1130                                  ;-137   checknamelen();
  1131                                  
  1132                                  .doglob42:
  1133 000004B2 E882FF                   call checknamelen
  1134                                  
  1135                                  ;-138   if (checkName() != 0) error1("Variable already defined");
  1136                                  
  1137 000004B5 E88305                   call checkName
  1138 000004B8 3C00                     cmp al, 0
  1139 000004BA 0F840900                 je  .doglob43
  1140 000004BE 68[FE07]                 push doglob_2
  1141 000004C1 E87D43                   call error1
  1142 000004C4 83C402                   add  sp, 2
  1143                                  
  1144                                  ;-139   if (istoken('[')) { istype='&';
  1145                                  
  1146                                  .doglob43:
  1147 000004C7 6A5B                     push 91
  1148 000004C9 E8553F                   call istoken
  1149 000004CC 83C402                   add  sp, 2
  1150 000004CF 08C0                     or  al, al
  1151 000004D1 0F84E201                 je .doglob44
  1152 000004D5 B82600                   mov ax, 38
  1153 000004D8 A2[3200]                 mov byte [istype], al
  1154                                  
  1155                                  ;-140     if (istoken(T_CONST)) {
  1156                                  
  1157 000004DB 680101                   push 257
  1158 000004DE E8403F                   call istoken
  1159 000004E1 83C402                   add  sp, 2
  1160 000004E4 08C0                     or  al, al
  1161 000004E6 0F84C200                 je .doglob45
  1162                                  
  1163                                  ;-141       prs("\nsection .bss\nabsolute ");
  1164                                  
  1165 000004EA 68[1708]                 push doglob_3
  1166 000004ED E86640                   call prs
  1167 000004F0 83C402                   add  sp, 2
  1168                                  
  1169                                  ;-142       prunsign1(orgData);
  1170                                  
  1171 000004F3 FF36[1000]               push word [orgData]
  1172 000004F7 E8B641                   call prunsign1
  1173 000004FA 83C402                   add  sp, 2
  1174                                  
  1175                                  ;-143       prs("\n"); prs(symbol); 
  1176                                  
  1177 000004FD 68[3108]                 push doglob_4
  1178 00000500 E85340                   call prs
  1179 00000503 83C402                   add  sp, 2
  1180 00000506 8D062B81                 lea  ax, [symbol]
  1181 0000050A 50                       push ax
  1182 0000050B E84840                   call prs
  1183 0000050E 83C402                   add  sp, 2
  1184                                  
  1185                                  ;-144       if (iswidth==1) prs(" resb "); 
  1186                                  
  1187 00000511 A0[3800]                 mov al, [iswidth]
  1188 00000514 3C01                     cmp al, 1
  1189 00000516 0F850900                 jne .doglob46
  1190 0000051A 68[3408]                 push doglob_5
  1191 0000051D E83640                   call prs
  1192 00000520 83C402                   add  sp, 2
  1193                                  
  1194                                  ;-145       if (iswidth==2) prs(" resw ");
  1195                                  
  1196                                  .doglob46:
  1197 00000523 A0[3800]                 mov al, [iswidth]
  1198 00000526 3C02                     cmp al, 2
  1199 00000528 0F850900                 jne .doglob47
  1200 0000052C 68[3B08]                 push doglob_6
  1201 0000052F E82440                   call prs
  1202 00000532 83C402                   add  sp, 2
  1203                                  
  1204                                  ;-146       if (iswidth==4) prs(" resd ");
  1205                                  
  1206                                  .doglob47:
  1207 00000535 A0[3800]                 mov al, [iswidth]
  1208 00000538 3C04                     cmp al, 4
  1209 0000053A 0F850900                 jne .doglob48
  1210 0000053E 68[4208]                 push doglob_7
  1211 00000541 E81240                   call prs
  1212 00000544 83C402                   add  sp, 2
  1213                                  
  1214                                  ;-147       prunsign1(lexval); 
  1215                                  
  1216                                  .doglob48:
  1217 00000547 FF36[2E00]               push word [lexval]
  1218 0000054B E86241                   call prunsign1
  1219 0000054E 83C402                   add  sp, 2
  1220                                  
  1221                                  ;-148       prs("\nsection .text");
  1222                                  
  1223 00000551 68[4908]                 push doglob_8
  1224 00000554 E8FF3F                   call prs
  1225 00000557 83C402                   add  sp, 2
  1226                                  
  1227                                  ;-149       orgData=orgData+lexval;
  1228                                  
  1229 0000055A A1[1000]                 mov ax, [orgData]
  1230 0000055D 0306[2E00]               add ax, [lexval]
  1231 00000561 A3[1000]                 mov word [orgData], ax
  1232                                  
  1233                                  ;-150       if (iswidth==2) orgData=orgData+lexval;
  1234                                  
  1235 00000564 A0[3800]                 mov al, [iswidth]
  1236 00000567 3C02                     cmp al, 2
  1237 00000569 0F850A00                 jne .doglob49
  1238 0000056D A1[1000]                 mov ax, [orgData]
  1239 00000570 0306[2E00]               add ax, [lexval]
  1240 00000574 A3[1000]                 mov word [orgData], ax
  1241                                  
  1242                                  ;-151       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}
  1243                                  
  1244                                  .doglob49:
  1245 00000577 A0[3800]                 mov al, [iswidth]
  1246 0000057A 3C04                     cmp al, 4
  1247 0000057C 0F851400                 jne .doglob50
  1248 00000580 A1[2E00]                 mov ax, [lexval]
  1249 00000583 BB0300                   mov bx, 3
  1250 00000586 F7E3                     mul bx
  1251 00000588 8946FE                   mov [bp-2], ax
  1252 0000058B A1[1000]                 mov ax, [orgData]
  1253 0000058E 0346FE                   add ax, [bp-2]
  1254 00000591 A3[1000]                 mov word [orgData], ax
  1255                                  
  1256                                  ;-152       GData[GTop]=lexval; expect(']');
  1257                                  
  1258                                  .doglob50:
  1259 00000594 A1[2E00]                 mov ax, [lexval]
  1260 00000597 8B1E[2A00]               mov bx, [GTop]
  1261 0000059B D1E3                     shl bx, 1
  1262 0000059D 8987EB8A                 mov [GData+bx], ax
  1263 000005A1 6A5D                     push 93
  1264 000005A3 E89D3E                   call expect
  1265 000005A6 83C402                   add  sp, 2
  1266                                  
  1267                                  ;-153     }else { expect(']');
  1268                                  
  1269 000005A9 E90801                   jmp .doglob51
  1270                                  .doglob45:
  1271 000005AC 6A5D                     push 93
  1272 000005AE E8923E                   call expect
  1273 000005B1 83C402                   add  sp, 2
  1274                                  
  1275                                  ;-154       if (iswidth != 1) error1("Only ByteArray allowed");
  1276                                  
  1277 000005B4 A0[3800]                 mov al, [iswidth]
  1278 000005B7 3C01                     cmp al, 1
  1279 000005B9 0F840900                 je  .doglob52
  1280 000005BD 68[5908]                 push doglob_9
  1281 000005C0 E87E42                   call error1
  1282 000005C3 83C402                   add  sp, 2
  1283                                  
  1284                                  ;-155       prs("\n"); prs(symbol); prs(" db "); 
  1285                                  
  1286                                  .doglob52:
  1287 000005C6 68[7008]                 push doglob_10
  1288 000005C9 E88A3F                   call prs
  1289 000005CC 83C402                   add  sp, 2
  1290 000005CF 8D062B81                 lea  ax, [symbol]
  1291 000005D3 50                       push ax
  1292 000005D4 E87F3F                   call prs
  1293 000005D7 83C402                   add  sp, 2
  1294 000005DA 68[7308]                 push doglob_11
  1295 000005DD E8763F                   call prs
  1296 000005E0 83C402                   add  sp, 2
  1297                                  
  1298                                  ;-156       isstrarr=1; strcpy(doglobName, symbol);
  1299                                  
  1300 000005E3 B80100                   mov ax, 1
  1301 000005E6 8946FA                   mov [bp-6], ax
  1302 000005E9 8D062B81                 lea  ax, [symbol]
  1303 000005ED 50                       push ax
  1304 000005EE 8D068FD0                 lea  ax, [doglobName]
  1305 000005F2 50                       push ax
  1306 000005F3 E870FB                   call strcpy
  1307 000005F6 83C404                   add  sp, 4
  1308                                  
  1309                                  ;-157       expect('='); 
  1310                                  
  1311 000005F9 6A3D                     push 61
  1312 000005FB E8453E                   call expect
  1313 000005FE 83C402                   add  sp, 2
  1314                                  
  1315                                  ;-158       if (istoken(T_STRING)) { 
  1316                                  
  1317 00000601 680201                   push 258
  1318 00000604 E81A3E                   call istoken
  1319 00000607 83C402                   add  sp, 2
  1320 0000060A 08C0                     or  al, al
  1321 0000060C 0F844200                 je .doglob53
  1322                                  
  1323                                  ;-159         prc(34); prscomment(symbol); prc(34); prs(",0"); 
  1324                                  
  1325 00000610 6A22                     push 34
  1326 00000612 E8DA3E                   call prc
  1327 00000615 83C402                   add  sp, 2
  1328 00000618 8D062B81                 lea  ax, [symbol]
  1329 0000061C 50                       push ax
  1330 0000061D E8FA3E                   call prscomment
  1331 00000620 83C402                   add  sp, 2
  1332 00000623 6A22                     push 34
  1333 00000625 E8C73E                   call prc
  1334 00000628 83C402                   add  sp, 2
  1335 0000062B 68[7808]                 push doglob_12
  1336 0000062E E8253F                   call prs
  1337 00000631 83C402                   add  sp, 2
  1338                                  
  1339                                  ;-160         i=strlen(symbol); GData[GTop]=i; }
  1340                                  
  1341 00000634 8D062B81                 lea  ax, [symbol]
  1342 00000638 50                       push ax
  1343 00000639 E802FB                   call strlen
  1344 0000063C 83C402                   add  sp, 2
  1345 0000063F 8946FE                   mov [bp-2], ax
  1346 00000642 8B46FE                   mov ax, [bp-2]
  1347 00000645 8B1E[2A00]               mov bx, [GTop]
  1348 00000649 D1E3                     shl bx, 1
  1349 0000064B 8987EB8A                 mov [GData+bx], ax
  1350                                  
  1351                                  ;-161       else if (istoken('{' )) { i=0;
  1352                                  
  1353 0000064F E96200                   jmp .doglob54
  1354                                  .doglob53:
  1355 00000652 6A7B                     push 123
  1356 00000654 E8CA3D                   call istoken
  1357 00000657 83C402                   add  sp, 2
  1358 0000065A 08C0                     or  al, al
  1359 0000065C 0F844B00                 je .doglob55
  1360 00000660 B80000                   mov ax, 0
  1361 00000663 8946FE                   mov [bp-2], ax
  1362                                  
  1363                                  ;-162         do { if(i) prc(','); 
  1364                                  
  1365                                  .doglob56:
  1366 00000666 8B46FE                   mov ax, [bp-2]
  1367 00000669 08C0                     or  al, al
  1368 0000066B 0F840800                 je .doglob57
  1369 0000066F 6A2C                     push 44
  1370 00000671 E87B3E                   call prc
  1371 00000674 83C402                   add  sp, 2
  1372                                  
  1373                                  ;-163           expect(T_CONST); prunsign1(lexval); i=1; }
  1374                                  
  1375                                  .doglob57:
  1376 00000677 680101                   push 257
  1377 0000067A E8C63D                   call expect
  1378 0000067D 83C402                   add  sp, 2
  1379 00000680 FF36[2E00]               push word [lexval]
  1380 00000684 E82940                   call prunsign1
  1381 00000687 83C402                   add  sp, 2
  1382 0000068A B80100                   mov ax, 1
  1383 0000068D 8946FE                   mov [bp-2], ax
  1384                                  
  1385                                  ;-164         while (istoken(',')); expect('}'); }  
  1386                                  
  1387 00000690 6A2C                     push 44
  1388 00000692 E88C3D                   call istoken
  1389 00000695 83C402                   add  sp, 2
  1390 00000698 08C0                     or  al, al
  1391 0000069A 0F840200                 je .doglob58
  1392 0000069E EBC6                     jmp .doglob56
  1393                                  .doglob58:
  1394 000006A0 6A7D                     push 125
  1395 000006A2 E89E3D                   call expect
  1396 000006A5 83C402                   add  sp, 2
  1397                                  
  1398                                  ;-165       else error1("String or number array expected");
  1399                                  
  1400 000006A8 E90900                   jmp .doglob59
  1401                                  .doglob55:
  1402 000006AB 68[7B08]                 push doglob_13
  1403 000006AE E89041                   call error1
  1404 000006B1 83C402                   add  sp, 2
  1405                                  
  1406                                  ;-166       }; 
  1407                                  
  1408                                  .doglob59:
  1409                                  .doglob54:
  1410                                  .doglob51:
  1411                                  
  1412                                  ;-167   }else { //expect('=');
  1413                                  
  1414 000006B4 E99E00                   jmp .doglob60
  1415                                  .doglob44:
  1416                                  
  1417                                  ;-168     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");
  1418                                  
  1419 000006B7 68[9B08]                 push doglob_14
  1420 000006BA E8993E                   call prs
  1421 000006BD 83C402                   add  sp, 2
  1422 000006C0 8D062B81                 lea  ax, [symbol]
  1423 000006C4 50                       push ax
  1424 000006C5 E88E3E                   call prs
  1425 000006C8 83C402                   add  sp, 2
  1426 000006CB A0[3200]                 mov al, [istype]
  1427 000006CE 3C2A                     cmp al, 42
  1428 000006D0 0F850C00                 jne .doglob61
  1429 000006D4 68[9E08]                 push doglob_15
  1430 000006D7 E87C3E                   call prs
  1431 000006DA 83C402                   add  sp, 2
  1432                                  
  1433                                  ;-169     else {
  1434                                  
  1435 000006DD E93300                   jmp .doglob62
  1436                                  .doglob61:
  1437                                  
  1438                                  ;-170       if      (iswidth==1) prs(" db ");
  1439                                  
  1440 000006E0 A0[3800]                 mov al, [iswidth]
  1441 000006E3 3C01                     cmp al, 1
  1442 000006E5 0F850C00                 jne .doglob63
  1443 000006E9 68[A308]                 push doglob_16
  1444 000006EC E8673E                   call prs
  1445 000006EF 83C402                   add  sp, 2
  1446                                  
  1447                                  ;-171       else if (iswidth==2) prs(" dw ");
  1448                                  
  1449 000006F2 E91E00                   jmp .doglob64
  1450                                  .doglob63:
  1451 000006F5 A0[3800]                 mov al, [iswidth]
  1452 000006F8 3C02                     cmp al, 2
  1453 000006FA 0F850C00                 jne .doglob65
  1454 000006FE 68[A808]                 push doglob_17
  1455 00000701 E8523E                   call prs
  1456 00000704 83C402                   add  sp, 2
  1457                                  
  1458                                  ;-172       else                 prs(" dd ");
  1459                                  
  1460 00000707 E90900                   jmp .doglob66
  1461                                  .doglob65:
  1462 0000070A 68[AD08]                 push doglob_18
  1463 0000070D E8463E                   call prs
  1464 00000710 83C402                   add  sp, 2
  1465                                  
  1466                                  ;-173     }
  1467                                  
  1468                                  .doglob66:
  1469                                  .doglob64:
  1470                                  
  1471                                  ;-174     if(istoken('-')) prc('-');
  1472                                  
  1473                                  .doglob62:
  1474 00000713 6A2D                     push 45
  1475 00000715 E8093D                   call istoken
  1476 00000718 83C402                   add  sp, 2
  1477 0000071B 08C0                     or  al, al
  1478 0000071D 0F840800                 je .doglob67
  1479 00000721 6A2D                     push 45
  1480 00000723 E8C93D                   call prc
  1481 00000726 83C402                   add  sp, 2
  1482                                  
  1483                                  ;-175     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }
  1484                                  
  1485                                  .doglob67:
  1486 00000729 6A3D                     push 61
  1487 0000072B E8F33C                   call istoken
  1488 0000072E 83C402                   add  sp, 2
  1489 00000731 08C0                     or  al, al
  1490 00000733 0F841600                 je .doglob68
  1491 00000737 680101                   push 257
  1492 0000073A E8063D                   call expect
  1493 0000073D 83C402                   add  sp, 2
  1494 00000740 FF36[2E00]               push word [lexval]
  1495 00000744 E8693F                   call prunsign1
  1496 00000747 83C402                   add  sp, 2
  1497                                  
  1498                                  ;-176     else prunsign1(0); }
  1499                                  
  1500 0000074A E90800                   jmp .doglob69
  1501                                  .doglob68:
  1502 0000074D 6A00                     push 0
  1503 0000074F E85E3F                   call prunsign1
  1504 00000752 83C402                   add  sp, 2
  1505                                  .doglob69:
  1506                                  
  1507                                  ;-177   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;
  1508                                  
  1509                                  .doglob60:
  1510 00000755 A0[3500]                 mov al, [issign]
  1511 00000758 8B1E[2A00]               mov bx, [GTop]
  1512 0000075C 8887E383                 mov [GSign+bx], al
  1513 00000760 A0[3800]                 mov al, [iswidth]
  1514 00000763 8B1E[2A00]               mov bx, [GTop]
  1515 00000767 88870F85                 mov [GWidth+bx], al
  1516 0000076B A0[3200]                 mov al, [istype]
  1517 0000076E 8B1E[2A00]               mov bx, [GTop]
  1518 00000772 8887B782                 mov [GType+bx], al
  1519                                  
  1520                                  ;-178   GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  1521                                  
  1522 00000776 A1[6600]                 mov ax, [lineno]
  1523 00000779 83E801                   sub ax, 1
  1524 0000077C 8B1E[2A00]               mov bx, [GTop]
  1525 00000780 D1E3                     shl bx, 1
  1526 00000782 89873B86                 mov [GAdr+bx], ax
  1527 00000786 B80000                   mov ax, 0
  1528 00000789 8B1E[2A00]               mov bx, [GTop]
  1529 0000078D D1E3                     shl bx, 1
  1530 0000078F 89879388                 mov [GUsed+bx], ax
  1531                                  
  1532                                  ;-179   pt=adrofname(GTop);
  1533                                  
  1534 00000793 FF36[2A00]               push word [GTop]
  1535 00000797 E8CF01                   call adrofname
  1536 0000079A 83C402                   add  sp, 2
  1537 0000079D A3[6A00]                 mov word [pt], ax
  1538                                  
  1539                                  ;-180   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);
  1540                                  
  1541 000007A0 8B46FA                   mov ax, [bp-6]
  1542 000007A3 08C0                     or  al, al
  1543 000007A5 0F841200                 je .doglob70
  1544 000007A9 8D068FD0                 lea  ax, [doglobName]
  1545 000007AD 50                       push ax
  1546 000007AE FF36[6A00]               push word [pt]
  1547 000007B2 E8B1F9                   call strcpy
  1548 000007B5 83C404                   add  sp, 4
  1549 000007B8 E90F00                   jmp .doglob71
  1550                                  .doglob70:
  1551 000007BB 8D062B81                 lea  ax, [symbol]
  1552 000007BF 50                       push ax
  1553 000007C0 FF36[6A00]               push word [pt]
  1554 000007C4 E89FF9                   call strcpy
  1555 000007C7 83C404                   add  sp, 4
  1556                                  
  1557                                  ;-181   GTop++; expect(';'); }
  1558                                  
  1559                                  .doglob71:
  1560 000007CA FF06[2A00]               inc  word[GTop]
  1561 000007CE 6A3B                     push 59
  1562 000007D0 E8703C                   call expect
  1563 000007D3 83C402                   add  sp, 2
  1564                                  
  1565                                  ;-182 
  1566                                  
  1567                                  
  1568                                  ;-183 int gettypes(int i) {int j; char c;
  1569 000007D6 C9                       LEAVE
  1570 000007D7 C3                       ret
  1571                                  ; ENDP
  1572 000007D8 476C6F62616C207461-     doglob_0 db "Global table full",0
  1573 000007E1 626C652066756C6C00 
  1574 000007EA 6E6F20564F49442061-     doglob_1 db "no VOID as var type",0
  1575 000007F3 732076617220747970-
  1576 000007FC 6500               
  1577 000007FE 5661726961626C6520-     doglob_2 db "Variable already defined",0
  1578 00000807 616C72656164792064-
  1579 00000810 6566696E656400     
  1580 00000817 5C6E73656374696F6E-     doglob_3 db "\nsection .bss\nabsolute ",0
  1581 00000820 202E6273735C6E6162-
  1582 00000829 736F6C7574652000   
  1583 00000831 5C6E00                  doglob_4 db "\n",0
  1584 00000834 20726573622000          doglob_5 db " resb ",0
  1585 0000083B 20726573772000          doglob_6 db " resw ",0
  1586 00000842 20726573642000          doglob_7 db " resd ",0
  1587 00000849 5C6E73656374696F6E-     doglob_8 db "\nsection .text",0
  1588 00000852 202E7465787400     
  1589 00000859 4F6E6C792042797465-     doglob_9 db "Only ByteArray allowed",0
  1590 00000862 417272617920616C6C-
  1591 0000086B 6F77656400         
  1592 00000870 5C6E00                  doglob_10 db "\n",0
  1593 00000873 2064622000              doglob_11 db " db ",0
  1594 00000878 2C3000                  doglob_12 db ",0",0
  1595 0000087B 537472696E67206F72-     doglob_13 db "String or number array expected",0
  1596 00000884 206E756D6265722061-
  1597 0000088D 727261792065787065-
  1598 00000896 6374656400         
  1599 0000089B 5C6E00                  doglob_14 db "\n",0
  1600 0000089E 2064772000              doglob_15 db " dw ",0
  1601 000008A3 2064622000              doglob_16 db " db ",0
  1602 000008A8 2064772000              doglob_17 db " dw ",0
  1603 000008AD 2064642000              doglob_18 db " dd ",0
  1604                                  
  1605                                  gettypes:  ; *** PROC ***
  1606                                  
  1607                                  ;-184   c=GSign [i]; if (c=='S') signi =1;    else signi =0;
  1608                                  
  1609                                  ;Function : gettypes, Number of local variables: 3
  1610                                  ;   # type sign width addr used name   list of local variables
  1611                                  ;  200 var sign word   183 NULL i = bp+4
  1612                                  ;  201 var sign word   183 NULL j = bp-2
  1613                                  ;  202 var sign byte   183 NULL c = bp-4;
  1614 000008B2 C8040000                 ENTER  4,0
  1615 000008B6 8B5E04                   mov bx, [bp+4]
  1616 000008B9 8A87E383                 mov al, [GSign + bx]
  1617 000008BD 8846FC                   mov [bp-4], al
  1618 000008C0 8A46FC                   mov al, [bp-4]
  1619 000008C3 3C53                     cmp al, 83
  1620 000008C5 0F850900                 jne .gettypes72
  1621 000008C9 B80100                   mov ax, 1
  1622 000008CC A3[3300]                 mov word [signi], ax
  1623 000008CF E90600                   jmp .gettypes73
  1624                                  .gettypes72:
  1625 000008D2 B80000                   mov ax, 0
  1626 000008D5 A3[3300]                 mov word [signi], ax
  1627                                  
  1628                                  ;-185   c=GWidth[i]; widthi=0;wi=0;
  1629                                  
  1630                                  .gettypes73:
  1631 000008D8 8B5E04                   mov bx, [bp+4]
  1632 000008DB 8A870F85                 mov al, [GWidth + bx]
  1633 000008DF 8846FC                   mov [bp-4], al
  1634 000008E2 B80000                   mov ax, 0
  1635 000008E5 A3[3600]                 mov word [widthi], ax
  1636 000008E8 B80000                   mov ax, 0
  1637 000008EB A3[3900]                 mov word [wi], ax
  1638                                  
  1639                                  ;-186   if (c==1) {widthi=1;wi=1;}
  1640                                  
  1641 000008EE 8A46FC                   mov al, [bp-4]
  1642 000008F1 3C01                     cmp al, 1
  1643 000008F3 0F850C00                 jne .gettypes74
  1644 000008F7 B80100                   mov ax, 1
  1645 000008FA A3[3600]                 mov word [widthi], ax
  1646 000008FD B80100                   mov ax, 1
  1647 00000900 A3[3900]                 mov word [wi], ax
  1648                                  
  1649                                  ;-187   if (c==2) {widthi=2;wi=2;}
  1650                                  
  1651                                  .gettypes74:
  1652 00000903 8A46FC                   mov al, [bp-4]
  1653 00000906 3C02                     cmp al, 2
  1654 00000908 0F850C00                 jne .gettypes75
  1655 0000090C B80200                   mov ax, 2
  1656 0000090F A3[3600]                 mov word [widthi], ax
  1657 00000912 B80200                   mov ax, 2
  1658 00000915 A3[3900]                 mov word [wi], ax
  1659                                  
  1660                                  ;-188   if (c==4) {widthi=4;wi=4;}
  1661                                  
  1662                                  .gettypes75:
  1663 00000918 8A46FC                   mov al, [bp-4]
  1664 0000091B 3C04                     cmp al, 4
  1665 0000091D 0F850C00                 jne .gettypes76
  1666 00000921 B80400                   mov ax, 4
  1667 00000924 A3[3600]                 mov word [widthi], ax
  1668 00000927 B80400                   mov ax, 4
  1669 0000092A A3[3900]                 mov word [wi], ax
  1670                                  
  1671                                  ;-189   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}
  1672                                  
  1673                                  .gettypes76:
  1674 0000092D 8B5E04                   mov bx, [bp+4]
  1675 00000930 8A87B782                 mov al, [GType + bx]
  1676 00000934 8846FC                   mov [bp-4], al
  1677 00000937 B80000                   mov ax, 0
  1678 0000093A A3[3000]                 mov word [typei], ax
  1679 0000093D 8A46FC                   mov al, [bp-4]
  1680 00000940 3C2A                     cmp al, 42
  1681 00000942 0F850C00                 jne .gettypes77
  1682 00000946 B80100                   mov ax, 1
  1683 00000949 A3[3000]                 mov word [typei], ax
  1684 0000094C B80200                   mov ax, 2
  1685 0000094F A3[3900]                 mov word [wi], ax
  1686                                  
  1687                                  ;-190   if (c=='&')  typei=2;  
  1688                                  
  1689                                  .gettypes77:
  1690 00000952 8A46FC                   mov al, [bp-4]
  1691 00000955 3C26                     cmp al, 38
  1692 00000957 0F850600                 jne .gettypes78
  1693 0000095B B80200                   mov ax, 2
  1694 0000095E A3[3000]                 mov word [typei], ax
  1695                                  
  1696                                  ;-191   return i; }  
  1697                                  
  1698                                  .gettypes78:
  1699 00000961 8B4604                   mov ax, [bp+4]
  1700 00000964 E90000                   jmp .retn
  1701                                  
  1702                                  ;-192 int adrofname(unsigned int i) { adrF(GNameField, i); }
  1703                                  
  1704 00000967 C9                       .retn: LEAVE
  1705 00000968 C3                       ret
  1706                                  ; ENDP
  1707                                  
  1708                                  adrofname:  ; *** PROC ***
  1709                                  ;Function : adrofname, Number of local variables: 1
  1710                                  ;   # type sign width addr used name   list of local variables
  1711                                  ;  200 var unsg word   192 NULL i = bp+4;
  1712 00000969 C8000000                 ENTER  0,0
  1713 0000096D FF7604                   push word [bp+4]
  1714 00000970 8D06438D                 lea  ax, [GNameField]
  1715 00000974 50                       push ax
  1716 00000975 E80500                   call adrF
  1717 00000978 83C404                   add  sp, 4
  1718                                  
  1719                                  ;-193 int adrF(char *s, unsigned int i) { i << 4;//*16; IDLENMAX=15!
  1720 0000097B C9                       LEAVE
  1721 0000097C C3                       ret
  1722                                  ; ENDP
  1723                                  
  1724                                  adrF:  ; *** PROC ***
  1725                                  ;Function : adrF, Number of local variables: 2
  1726                                  ;   # type sign width addr used name   list of local variables
  1727                                  ;  200 ptr sign byte   193 NULL s = bp+4
  1728                                  ;  201 var unsg word   193 NULL i = bp+6;
  1729 0000097D C8000000                 ENTER  0,0
  1730 00000981 8B4606                   mov ax, [bp+6]
  1731 00000984 C1E004                   shl ax, 4
  1732                                  
  1733                                  ;-194   __asm{ add ax, [bp+4]  ; offset s } }
  1734                                  
  1735 00000987 034604                   add ax, [bp+4]  ; offset s 
  1736                                  
  1737                                  ;-195 int printName(unsigned int i) {int j;
  1738 0000098A C9                       LEAVE
  1739 0000098B C3                       ret
  1740                                  ; ENDP
  1741                                  
  1742                                  printName:  ; *** PROC ***
  1743                                  
  1744                                  ;-196   if (i < LSTART) { i=adrofname(i); prs(i); }
  1745                                  
  1746                                  ;Function : printName, Number of local variables: 2
  1747                                  ;   # type sign width addr used name   list of local variables
  1748                                  ;  200 var unsg word   195 NULL i = bp+4
  1749                                  ;  201 var sign word   195 NULL j = bp-2;
  1750 0000098C C8020000                 ENTER  2,0
  1751 00000990 8B4604                   mov ax, [bp+4]
  1752 00000993 3DC800                   cmp ax, 200
  1753 00000996 0F8D1800                 jge .printName79
  1754 0000099A FF7604                   push word [bp+4]
  1755 0000099D E8C9FF                   call adrofname
  1756 000009A0 83C402                   add  sp, 2
  1757 000009A3 894604                   mov [bp+4], ax
  1758 000009A6 FF7604                   push word [bp+4]
  1759 000009A9 E8AA3B                   call prs
  1760 000009AC 83C402                   add  sp, 2
  1761                                  
  1762                                  ;-197   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }
  1763                                  
  1764 000009AF E93800                   jmp .printName80
  1765                                  .printName79:
  1766 000009B2 68[EC09]                 push printName_0
  1767 000009B5 E89E3B                   call prs
  1768 000009B8 83C402                   add  sp, 2
  1769 000009BB 8B5E04                   mov bx, [bp+4]
  1770 000009BE D1E3                     shl bx, 1
  1771 000009C0 8B87EB8A                 mov ax, [GData + bx]
  1772 000009C4 8946FE                   mov [bp-2], ax
  1773 000009C7 8B46FE                   mov ax, [bp-2]
  1774 000009CA 83F800                   cmp ax, 0
  1775 000009CD 0F8E0800                 jle .printName81
  1776 000009D1 6A2B                     push 43
  1777 000009D3 E8193B                   call prc
  1778 000009D6 83C402                   add  sp, 2
  1779                                  .printName81:
  1780 000009D9 FF76FE                   push word [bp-2]
  1781 000009DC E86E3C                   call pint1
  1782 000009DF 83C402                   add  sp, 2
  1783 000009E2 6A5D                     push 93
  1784 000009E4 E8083B                   call prc
  1785 000009E7 83C402                   add  sp, 2
  1786                                  
  1787                                  ;-198 }
  1788                                  
  1789                                  .printName80:
  1790                                  
  1791                                  ;-199 int searchname() { unsigned int i;
  1792 000009EA C9                       LEAVE
  1793 000009EB C3                       ret
  1794                                  ; ENDP
  1795 000009EC 5B627000                printName_0 db "[bp",0
  1796                                  
  1797                                  searchname:  ; *** PROC ***
  1798                                  
  1799                                  ;-200   i=checkName(); if (i == 0) error1("Variable unknown");
  1800                                  
  1801                                  ;Function : searchname, Number of local variables: 1
  1802                                  ;   # type sign width addr used name   list of local variables
  1803                                  ;  200 var unsg word   199 NULL i = bp-2;
  1804 000009F0 C8020000                 ENTER  2,0
  1805 000009F4 E84400                   call checkName
  1806 000009F7 8946FE                   mov [bp-2], ax
  1807 000009FA 8B46FE                   mov ax, [bp-2]
  1808 000009FD 83F800                   cmp ax, 0
  1809 00000A00 0F850900                 jne .searchname82
  1810 00000A04 68[2A0A]                 push searchname_0
  1811 00000A07 E8373E                   call error1
  1812 00000A0A 83C402                   add  sp, 2
  1813                                  
  1814                                  ;-201   GUsed[i]=GUsed[i] + 1; return i;
  1815                                  
  1816                                  .searchname82:
  1817 00000A0D 8B5EFE                   mov bx, [bp-2]
  1818 00000A10 D1E3                     shl bx, 1
  1819 00000A12 8B879388                 mov ax, [GUsed + bx]
  1820 00000A16 83C001                   add ax, 1
  1821 00000A19 8B5EFE                   mov bx, [bp-2]
  1822 00000A1C D1E3                     shl bx, 1
  1823 00000A1E 89879388                 mov [GUsed+bx], ax
  1824 00000A22 8B46FE                   mov ax, [bp-2]
  1825 00000A25 E90000                   jmp .retn
  1826                                  
  1827                                  ;-202 }
  1828                                  
  1829                                  
  1830                                  ;-203 int checkName() { unsigned int i; unsigned int j;
  1831                                  
  1832 00000A28 C9                       .retn: LEAVE
  1833 00000A29 C3                       ret
  1834                                  ; ENDP
  1835 00000A2A 5661726961626C6520-     searchname_0 db "Variable unknown",0
  1836 00000A33 756E6B6E6F776E00   
  1837                                  
  1838                                  checkName:  ; *** PROC ***
  1839                                  
  1840                                  ;-204   i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  1841                                  
  1842                                  ;Function : checkName, Number of local variables: 2
  1843                                  ;   # type sign width addr used name   list of local variables
  1844                                  ;  200 var unsg word   203 NULL i = bp-2
  1845                                  ;  201 var unsg word   203 NULL j = bp-4;
  1846 00000A3B C8040000                 ENTER  4,0
  1847 00000A3F B8C800                   mov ax, 200
  1848 00000A42 8946FE                   mov [bp-2], ax
  1849                                  .checkName83:
  1850 00000A45 8B46FE                   mov ax, [bp-2]
  1851 00000A48 3B06[2C00]               cmp ax, [LTop]
  1852 00000A4C 0F8D2B00                 jge .checkName84
  1853 00000A50 FF76FE                   push word [bp-2]
  1854 00000A53 E813FF                   call adrofname
  1855 00000A56 83C402                   add  sp, 2
  1856 00000A59 8946FC                   mov [bp-4], ax
  1857 00000A5C FF76FC                   push word [bp-4]
  1858 00000A5F 8D062B81                 lea  ax, [symbol]
  1859 00000A63 50                       push ax
  1860 00000A64 E82FF7                   call eqstr
  1861 00000A67 83C404                   add  sp, 4
  1862 00000A6A 08C0                     or  al, al
  1863 00000A6C 0F840600                 je .checkName85
  1864 00000A70 8B46FE                   mov ax, [bp-2]
  1865 00000A73 E94700                   jmp .retn
  1866                                  .checkName85:
  1867 00000A76 FF46FE                   inc  word[bp-2]
  1868                                  
  1869                                  ;-205   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  1870                                  
  1871 00000A79 EBCA                     jmp .checkName83
  1872                                  .checkName84:
  1873 00000A7B B80100                   mov ax, 1
  1874 00000A7E 8946FE                   mov [bp-2], ax
  1875                                  .checkName86:
  1876 00000A81 8B46FE                   mov ax, [bp-2]
  1877 00000A84 3B06[2A00]               cmp ax, [GTop]
  1878 00000A88 0F8D2B00                 jge .checkName87
  1879 00000A8C FF76FE                   push word [bp-2]
  1880 00000A8F E8D7FE                   call adrofname
  1881 00000A92 83C402                   add  sp, 2
  1882 00000A95 8946FC                   mov [bp-4], ax
  1883 00000A98 FF76FC                   push word [bp-4]
  1884 00000A9B 8D062B81                 lea  ax, [symbol]
  1885 00000A9F 50                       push ax
  1886 00000AA0 E8F3F6                   call eqstr
  1887 00000AA3 83C404                   add  sp, 4
  1888 00000AA6 08C0                     or  al, al
  1889 00000AA8 0F840600                 je .checkName88
  1890 00000AAC 8B46FE                   mov ax, [bp-2]
  1891 00000AAF E90B00                   jmp .retn
  1892                                  .checkName88:
  1893 00000AB2 FF46FE                   inc  word[bp-2]
  1894                                  
  1895                                  ;-206   return 0;
  1896                                  
  1897 00000AB5 EBCA                     jmp .checkName86
  1898                                  .checkName87:
  1899 00000AB7 B80000                   mov ax, 0
  1900 00000ABA E90000                   jmp .retn
  1901                                  
  1902                                  ;-207 }    
  1903                                  
  1904                                  
  1905                                  ;-208 int typeName() { int m; //0=V,1=*,2=&
  1906                                  
  1907 00000ABD C9                       .retn: LEAVE
  1908 00000ABE C3                       ret
  1909                                  ; ENDP
  1910                                  
  1911                                  typeName:  ; *** PROC ***
  1912                                  
  1913                                  ;-209     issign='S';
  1914                                  
  1915                                  ;Function : typeName, Number of local variables: 1
  1916                                  ;   # type sign width addr used name   list of local variables
  1917                                  ;  200 var sign word   208 NULL m = bp-2;
  1918 00000ABF C8020000                 ENTER  2,0
  1919 00000AC3 B85300                   mov ax, 83
  1920 00000AC6 A2[3500]                 mov byte [issign], al
  1921                                  
  1922                                  ;-210     if(istoken(T_SIGNED))   issign='S';  
  1923                                  
  1924 00000AC9 681302                   push 531
  1925 00000ACC E85239                   call istoken
  1926 00000ACF 83C402                   add  sp, 2
  1927 00000AD2 08C0                     or  al, al
  1928 00000AD4 0F840600                 je .typeName89
  1929 00000AD8 B85300                   mov ax, 83
  1930 00000ADB A2[3500]                 mov byte [issign], al
  1931                                  
  1932                                  ;-211     if(istoken(T_UNSIGNED)) issign='U';
  1933                                  
  1934                                  .typeName89:
  1935 00000ADE 681402                   push 532
  1936 00000AE1 E83D39                   call istoken
  1937 00000AE4 83C402                   add  sp, 2
  1938 00000AE7 08C0                     or  al, al
  1939 00000AE9 0F840600                 je .typeName90
  1940 00000AED B85500                   mov ax, 85
  1941 00000AF0 A2[3500]                 mov byte [issign], al
  1942                                  
  1943                                  ;-212     iswidth=2;                           
  1944                                  
  1945                                  .typeName90:
  1946 00000AF3 B80200                   mov ax, 2
  1947 00000AF6 A2[3800]                 mov byte [iswidth], al
  1948                                  
  1949                                  ;-213     if(istoken(T_VOID))     iswidth=0;
  1950                                  
  1951 00000AF9 681102                   push 529
  1952 00000AFC E82239                   call istoken
  1953 00000AFF 83C402                   add  sp, 2
  1954 00000B02 08C0                     or  al, al
  1955 00000B04 0F840600                 je .typeName91
  1956 00000B08 B80000                   mov ax, 0
  1957 00000B0B A2[3800]                 mov byte [iswidth], al
  1958                                  
  1959                                  ;-214     if(istoken(T_CHAR))     iswidth=1;   
  1960                                  
  1961                                  .typeName91:
  1962 00000B0E 681202                   push 530
  1963 00000B11 E80D39                   call istoken
  1964 00000B14 83C402                   add  sp, 2
  1965 00000B17 08C0                     or  al, al
  1966 00000B19 0F840600                 je .typeName92
  1967 00000B1D B80100                   mov ax, 1
  1968 00000B20 A2[3800]                 mov byte [iswidth], al
  1969                                  
  1970                                  ;-215     if(istoken(T_INT))      iswidth=2;
  1971                                  
  1972                                  .typeName92:
  1973 00000B23 680502                   push 517
  1974 00000B26 E8F838                   call istoken
  1975 00000B29 83C402                   add  sp, 2
  1976 00000B2C 08C0                     or  al, al
  1977 00000B2E 0F840600                 je .typeName93
  1978 00000B32 B80200                   mov ax, 2
  1979 00000B35 A2[3800]                 mov byte [iswidth], al
  1980                                  
  1981                                  ;-216     if(istoken(T_LONG))     iswidth=4;
  1982                                  
  1983                                  .typeName93:
  1984 00000B38 681502                   push 533
  1985 00000B3B E8E338                   call istoken
  1986 00000B3E 83C402                   add  sp, 2
  1987 00000B41 08C0                     or  al, al
  1988 00000B43 0F840600                 je .typeName94
  1989 00000B47 B80400                   mov ax, 4
  1990 00000B4A A2[3800]                 mov byte [iswidth], al
  1991                                  
  1992                                  ;-217     istype='V'; 
  1993                                  
  1994                                  .typeName94:
  1995 00000B4D B85600                   mov ax, 86
  1996 00000B50 A2[3200]                 mov byte [istype], al
  1997                                  
  1998                                  ;-218     m=0;
  1999                                  
  2000 00000B53 B80000                   mov ax, 0
  2001 00000B56 8946FE                   mov [bp-2], ax
  2002                                  
  2003                                  ;-219     if(istoken('*'))  {istype='*'; m=1;} 
  2004                                  
  2005 00000B59 6A2A                     push 42
  2006 00000B5B E8C338                   call istoken
  2007 00000B5E 83C402                   add  sp, 2
  2008 00000B61 08C0                     or  al, al
  2009 00000B63 0F840C00                 je .typeName95
  2010 00000B67 B82A00                   mov ax, 42
  2011 00000B6A A2[3200]                 mov byte [istype], al
  2012 00000B6D B80100                   mov ax, 1
  2013 00000B70 8946FE                   mov [bp-2], ax
  2014                                  
  2015                                  ;-220     if(istoken('&'))  {istype='&'; m=2;}
  2016                                  
  2017                                  .typeName95:
  2018 00000B73 6A26                     push 38
  2019 00000B75 E8A938                   call istoken
  2020 00000B78 83C402                   add  sp, 2
  2021 00000B7B 08C0                     or  al, al
  2022 00000B7D 0F840C00                 je .typeName96
  2023 00000B81 B82600                   mov ax, 38
  2024 00000B84 A2[3200]                 mov byte [istype], al
  2025 00000B87 B80200                   mov ax, 2
  2026 00000B8A 8946FE                   mov [bp-2], ax
  2027                                  
  2028                                  ;-221     name1(); 
  2029                                  
  2030                                  .typeName96:
  2031 00000B8D E80800                   call name1
  2032                                  
  2033                                  ;-222     return m; 
  2034                                  
  2035 00000B90 8B46FE                   mov ax, [bp-2]
  2036 00000B93 E90000                   jmp .retn
  2037                                  
  2038                                  ;-223 }
  2039                                  
  2040                                  
  2041                                  ;-224 int name1() {
  2042                                  
  2043 00000B96 C9                       .retn: LEAVE
  2044 00000B97 C3                       ret
  2045                                  ; ENDP
  2046                                  
  2047                                  name1:  ; *** PROC ***
  2048                                  
  2049                                  ;-225     if (token!=T_NAME) error1("Name expected"); 
  2050                                  
  2051 00000B98 A1[1C00]                 mov ax, [token]
  2052 00000B9B 3D0001                   cmp ax, 256
  2053 00000B9E 0F840900                 je  .name197
  2054 00000BA2 68[B20B]                 push name1_0
  2055 00000BA5 E8993C                   call error1
  2056 00000BA8 83C402                   add  sp, 2
  2057                                  
  2058                                  ;-226     token=getlex(); 
  2059                                  
  2060                                  .name197:
  2061 00000BAB E84F31                   call getlex
  2062 00000BAE A3[1C00]                 mov word [token], ax
  2063                                  
  2064                                  ;-227 }
  2065                                  
  2066                                  
  2067                                  ;-228 
  2068                                  
  2069                                  
  2070                                  ;-229 int storecall() { int i; if (CTop >= CALLMAX) error1("Call table full");
  2071                                  
  2072 00000BB1 C3                       ret
  2073                                  ; ENDP
  2074 00000BB2 4E616D652065787065-     name1_0 db "Name expected",0
  2075 00000BBB 6374656400         
  2076                                  
  2077                                  storecall:  ; *** PROC ***
  2078                                  ;Function : storecall, Number of local variables: 1
  2079                                  ;   # type sign width addr used name   list of local variables
  2080                                  ;  200 var sign word   229 NULL i = bp-2;
  2081 00000BC0 C8020000                 ENTER  2,0
  2082 00000BC4 A1[3D00]                 mov ax, [CTop]
  2083 00000BC7 3DD007                   cmp ax, 2000 ;unsigned : 1
  2084 00000BCA 0F8C0900                 jl  .storecall98
  2085 00000BCE 68[320C]                 push storecall_0
  2086 00000BD1 E86D3C                   call error1
  2087 00000BD4 83C402                   add  sp, 2
  2088                                  
  2089                                  ;-230   if (CNameTop >= 65468) error1("Call name table fuill");
  2090                                  
  2091                                  .storecall98:
  2092 00000BD7 A1[6000]                 mov ax, [CNameTop]
  2093 00000BDA 3DBCFF                   cmp ax, 65468 ;unsigned : 0
  2094 00000BDD 0F820900                 jb  .storecall99
  2095 00000BE1 68[420C]                 push storecall_1
  2096 00000BE4 E85A3C                   call error1
  2097 00000BE7 83C402                   add  sp, 2
  2098                                  
  2099                                  ;-231     CType[CTop]=0;  CAdr [CTop]=CNameTop; i=strlen(symbol);
  2100                                  
  2101                                  .storecall99:
  2102 00000BEA B80000                   mov ax, 0
  2103 00000BED 8B1E[3D00]               mov bx, [CTop]
  2104 00000BF1 88872FA1                 mov [CType+bx], al
  2105 00000BF5 A1[6000]                 mov ax, [CNameTop]
  2106 00000BF8 8B1E[3D00]               mov bx, [CTop]
  2107 00000BFC D1E3                     shl bx, 1
  2108 00000BFE 898757AB                 mov [CAdr+bx], ax
  2109 00000C02 8D062B81                 lea  ax, [symbol]
  2110 00000C06 50                       push ax
  2111 00000C07 E834F5                   call strlen
  2112 00000C0A 83C402                   add  sp, 2
  2113 00000C0D 8946FE                   mov [bp-2], ax
  2114                                  
  2115                                  ;-232     to_far(CNameTop, symbol);
  2116                                  
  2117 00000C10 8D062B81                 lea  ax, [symbol]
  2118 00000C14 50                       push ax
  2119 00000C15 FF36[6000]               push word [CNameTop]
  2120 00000C19 E87E47                   call to_far
  2121 00000C1C 83C404                   add  sp, 4
  2122                                  
  2123                                  ;-233     CNameTop=CNameTop+i; CNameTop++; CTop++;
  2124                                  
  2125 00000C1F A1[6000]                 mov ax, [CNameTop]
  2126 00000C22 0346FE                   add ax, [bp-2]
  2127 00000C25 A3[6000]                 mov word [CNameTop], ax
  2128 00000C28 FF06[6000]               inc  word[CNameTop]
  2129 00000C2C FF06[3D00]               inc  word[CTop]
  2130                                  
  2131                                  ;-234 }
  2132                                  
  2133                                  
  2134                                  ;-235 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
  2135 00000C30 C9                       LEAVE
  2136 00000C31 C3                       ret
  2137                                  ; ENDP
  2138 00000C32 43616C6C207461626C-     storecall_0 db "Call table full",0
  2139 00000C3B 652066756C6C00     
  2140 00000C42 43616C6C206E616D65-     storecall_1 db "Call name table fuill",0
  2141 00000C4B 207461626C65206675-
  2142 00000C54 696C6C00           
  2143                                  
  2144                                  storefunc:  ; *** PROC ***
  2145 00000C58 A1[3B00]                 mov ax, [FTop]
  2146 00000C5B 3D2C01                   cmp ax, 300 ;unsigned : 1
  2147 00000C5E 0F8C0900                 jl  .storefunc100
  2148 00000C62 68[B90C]                 push storefunc_0
  2149 00000C65 E8D93B                   call error1
  2150 00000C68 83C402                   add  sp, 2
  2151                                  
  2152                                  ;-236     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;
  2153                                  
  2154                                  .storefunc100:
  2155 00000C6B A1[6600]                 mov ax, [lineno]
  2156 00000C6E 83E801                   sub ax, 1
  2157 00000C71 8B1E[3B00]               mov bx, [FTop]
  2158 00000C75 D1E3                     shl bx, 1
  2159 00000C77 8987FFA8                 mov [FAdr+bx], ax
  2160 00000C7B B80000                   mov ax, 0
  2161 00000C7E 8B1E[3B00]               mov bx, [FTop]
  2162 00000C82 D1E3                     shl bx, 1
  2163 00000C84 8987F7BA                 mov [FCalls+bx], ax
  2164 00000C88 A0[3800]                 mov al, [iswidth]
  2165 00000C8B 8B1E[3B00]               mov bx, [FTop]
  2166 00000C8F 888703A0                 mov [FType+bx], al
  2167                                  
  2168                                  ;-237     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;
  2169                                  
  2170 00000C93 FF36[3B00]               push word [FTop]
  2171 00000C97 8D064FBD                 lea  ax, [FNameField]
  2172 00000C9B 50                       push ax
  2173 00000C9C E8DEFC                   call adrF
  2174 00000C9F 83C404                   add  sp, 4
  2175 00000CA2 A3[6A00]                 mov word [pt], ax
  2176 00000CA5 8D062B81                 lea  ax, [symbol]
  2177 00000CA9 50                       push ax
  2178 00000CAA FF36[6A00]               push word [pt]
  2179 00000CAE E8B5F4                   call strcpy
  2180 00000CB1 83C404                   add  sp, 4
  2181 00000CB4 FF06[3B00]               inc  word[FTop]
  2182                                  
  2183                                  ;-238 }
  2184                                  
  2185                                  
  2186                                  ;-239 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");
  2187                                  
  2188 00000CB8 C3                       ret
  2189                                  ; ENDP
  2190 00000CB9 46756E6374696F6E20-     storefunc_0 db "Function table full",0
  2191 00000CC2 7461626C652066756C-
  2192 00000CCB 6C00               
  2193                                  
  2194                                  addlocal:  ; *** PROC ***
  2195 00000CCD A1[2C00]                 mov ax, [LTop]
  2196 00000CD0 3D2C01                   cmp ax, 300 ;unsigned : 1
  2197 00000CD3 0F8C0900                 jl  .addlocal101
  2198 00000CD7 68[530D]                 push addlocal_0
  2199 00000CDA E8643B                   call error1
  2200 00000CDD 83C402                   add  sp, 2
  2201                                  
  2202                                  ;-240   if (checkName() != 0) error1("Variable already defined");
  2203                                  
  2204                                  .addlocal101:
  2205 00000CE0 E858FD                   call checkName
  2206 00000CE3 83F800                   cmp ax, 0
  2207 00000CE6 0F840900                 je  .addlocal102
  2208 00000CEA 68[6D0D]                 push addlocal_1
  2209 00000CED E8513B                   call error1
  2210 00000CF0 83C402                   add  sp, 2
  2211                                  
  2212                                  ;-241   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;
  2213                                  
  2214                                  .addlocal102:
  2215 00000CF3 A0[3500]                 mov al, [issign]
  2216 00000CF6 8B1E[2C00]               mov bx, [LTop]
  2217 00000CFA 8887E383                 mov [GSign+bx], al
  2218 00000CFE A0[3800]                 mov al, [iswidth]
  2219 00000D01 8B1E[2C00]               mov bx, [LTop]
  2220 00000D05 88870F85                 mov [GWidth+bx], al
  2221 00000D09 A0[3200]                 mov al, [istype]
  2222 00000D0C 8B1E[2C00]               mov bx, [LTop]
  2223 00000D10 8887B782                 mov [GType+bx], al
  2224                                  
  2225                                  ;-242   GAdr [LTop]=lineno-1; GUsed[LTop]=0;
  2226                                  
  2227 00000D14 A1[6600]                 mov ax, [lineno]
  2228 00000D17 83E801                   sub ax, 1
  2229 00000D1A 8B1E[2C00]               mov bx, [LTop]
  2230 00000D1E D1E3                     shl bx, 1
  2231 00000D20 89873B86                 mov [GAdr+bx], ax
  2232 00000D24 B80000                   mov ax, 0
  2233 00000D27 8B1E[2C00]               mov bx, [LTop]
  2234 00000D2B D1E3                     shl bx, 1
  2235 00000D2D 89879388                 mov [GUsed+bx], ax
  2236                                  
  2237                                  ;-243   pt=adrF(GNameField, LTop); strcpy(pt, symbol);
  2238                                  
  2239 00000D31 FF36[2C00]               push word [LTop]
  2240 00000D35 8D06438D                 lea  ax, [GNameField]
  2241 00000D39 50                       push ax
  2242 00000D3A E840FC                   call adrF
  2243 00000D3D 83C404                   add  sp, 4
  2244 00000D40 A3[6A00]                 mov word [pt], ax
  2245 00000D43 8D062B81                 lea  ax, [symbol]
  2246 00000D47 50                       push ax
  2247 00000D48 FF36[6A00]               push word [pt]
  2248 00000D4C E817F4                   call strcpy
  2249 00000D4F 83C404                   add  sp, 4
  2250                                  
  2251                                  ;-244 }
  2252                                  
  2253                                  
  2254                                  ;-245 int checkFunction() { unsigned int i; unsigned int j; i=0;
  2255                                  
  2256 00000D52 C3                       ret
  2257                                  ; ENDP
  2258 00000D53 4C6F63616C20766172-     addlocal_0 db "Local variable table full",0
  2259 00000D5C 6961626C6520746162-
  2260 00000D65 6C652066756C6C00   
  2261 00000D6D 5661726961626C6520-     addlocal_1 db "Variable already defined",0
  2262 00000D76 616C72656164792064-
  2263 00000D7F 6566696E656400     
  2264                                  
  2265                                  checkFunction:  ; *** PROC ***
  2266                                  ;Function : checkFunction, Number of local variables: 2
  2267                                  ;   # type sign width addr used name   list of local variables
  2268                                  ;  200 var unsg word   245 NULL i = bp-2
  2269                                  ;  201 var unsg word   245 NULL j = bp-4;
  2270 00000D86 C8040000                 ENTER  4,0
  2271 00000D8A B80000                   mov ax, 0
  2272 00000D8D 8946FE                   mov [bp-2], ax
  2273                                  
  2274                                  ;-246   while (i < FTop) { j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}
  2275                                  
  2276                                  .checkFunction103:
  2277 00000D90 8B46FE                   mov ax, [bp-2]
  2278 00000D93 3B06[3B00]               cmp ax, [FTop]
  2279 00000D97 0F8D3000                 jge .checkFunction104
  2280 00000D9B FF76FE                   push word [bp-2]
  2281 00000D9E 8D064FBD                 lea  ax, [FNameField]
  2282 00000DA2 50                       push ax
  2283 00000DA3 E8D7FB                   call adrF
  2284 00000DA6 83C404                   add  sp, 4
  2285 00000DA9 8946FC                   mov [bp-4], ax
  2286 00000DAC FF76FC                   push word [bp-4]
  2287 00000DAF 8D062B81                 lea  ax, [symbol]
  2288 00000DB3 50                       push ax
  2289 00000DB4 E8DFF3                   call eqstr
  2290 00000DB7 83C404                   add  sp, 4
  2291 00000DBA 08C0                     or  al, al
  2292 00000DBC 0F840600                 je .checkFunction105
  2293 00000DC0 8B46FE                   mov ax, [bp-2]
  2294 00000DC3 E90B00                   jmp .retn
  2295                                  .checkFunction105:
  2296 00000DC6 FF46FE                   inc  word[bp-2]
  2297                                  
  2298                                  ;-247   return 0; }
  2299                                  
  2300 00000DC9 EBC5                     jmp .checkFunction103
  2301                                  .checkFunction104:
  2302 00000DCB B80000                   mov ax, 0
  2303 00000DCE E90000                   jmp .retn
  2304                                  
  2305                                  ;-248 int dofunc() { int nloc; int i; int narg;  
  2306                                  
  2307 00000DD1 C9                       .retn: LEAVE
  2308 00000DD2 C3                       ret
  2309                                  ; ENDP
  2310                                  
  2311                                  dofunc:  ; *** PROC ***
  2312                                  
  2313                                  ;-249   cloc=&co; 
  2314                                  
  2315                                  ;Function : dofunc, Number of local variables: 3
  2316                                  ;   # type sign width addr used name   list of local variables
  2317                                  ;  200 var sign word   248 NULL nloc = bp-2
  2318                                  ;  201 var sign word   248 NULL i = bp-4
  2319                                  ;  202 var sign word   248 NULL narg = bp-6;
  2320 00000DD3 C8060000                 ENTER  6,0
  2321 00000DD7 B83075                   mov ax, co
  2322 00000DDA A3[1600]                 mov word [cloc], ax
  2323                                  
  2324                                  ;-250   checknamelen();
  2325                                  
  2326 00000DDD E857F6                   call checknamelen
  2327                                  
  2328                                  ;-251   strcpy(fname, symbol);
  2329                                  
  2330 00000DE0 8D062B81                 lea  ax, [symbol]
  2331 00000DE4 50                       push ax
  2332 00000DE5 8D06AB81                 lea  ax, [fname]
  2333 00000DE9 50                       push ax
  2334 00000DEA E879F3                   call strcpy
  2335 00000DED 83C404                   add  sp, 4
  2336                                  
  2337                                  ;-252   if (checkFunction() ) error1("Function already defined");
  2338                                  
  2339 00000DF0 E893FF                   call checkFunction
  2340 00000DF3 08C0                     or  al, al
  2341 00000DF5 0F840900                 je .dofunc106
  2342 00000DF9 68[0A10]                 push dofunc_0
  2343 00000DFC E8423A                   call error1
  2344 00000DFF 83C402                   add  sp, 2
  2345                                  
  2346                                  ;-253   storefunc();
  2347                                  
  2348                                  .dofunc106:
  2349 00000E02 E853FE                   call storefunc
  2350                                  
  2351                                  ;-254   prs("\n\n"); prs(symbol); prs(":  ; *** PROC ***");
  2352                                  
  2353 00000E05 68[2310]                 push dofunc_1
  2354 00000E08 E84B37                   call prs
  2355 00000E0B 83C402                   add  sp, 2
  2356 00000E0E 8D062B81                 lea  ax, [symbol]
  2357 00000E12 50                       push ax
  2358 00000E13 E84037                   call prs
  2359 00000E16 83C402                   add  sp, 2
  2360 00000E19 68[2810]                 push dofunc_2
  2361 00000E1C E83737                   call prs
  2362 00000E1F 83C402                   add  sp, 2
  2363                                  
  2364                                  ;-255   expect('('); LTop=LSTART;  i=0;
  2365                                  
  2366 00000E22 6A28                     push 40
  2367 00000E24 E81C36                   call expect
  2368 00000E27 83C402                   add  sp, 2
  2369 00000E2A B8C800                   mov ax, 200
  2370 00000E2D A3[2C00]                 mov word [LTop], ax
  2371 00000E30 B80000                   mov ax, 0
  2372 00000E33 8946FC                   mov [bp-4], ax
  2373                                  
  2374                                  ;-256   if (istoken(')')==0) { narg=2; 
  2375                                  
  2376 00000E36 6A29                     push 41
  2377 00000E38 E8E635                   call istoken
  2378 00000E3B 83C402                   add  sp, 2
  2379 00000E3E 83F800                   cmp ax, 0
  2380 00000E41 0F854600                 jne .dofunc107
  2381 00000E45 B80200                   mov ax, 2
  2382 00000E48 8946FA                   mov [bp-6], ax
  2383                                  
  2384                                  ;-257     do { typeName();  addlocal(); narg+=2;
  2385                                  
  2386                                  .dofunc108:
  2387 00000E4B E871FC                   call typeName
  2388 00000E4E E87CFE                   call addlocal
  2389 00000E51 8346FA02                 add  word[bp-6], 2
  2390                                  
  2391                                  ;-258          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }
  2392                                  
  2393 00000E55 8B46FA                   mov ax, [bp-6]
  2394 00000E58 8B1E[2C00]               mov bx, [LTop]
  2395 00000E5C D1E3                     shl bx, 1
  2396 00000E5E 8987EB8A                 mov [GData+bx], ax
  2397 00000E62 A0[3800]                 mov al, [iswidth]
  2398 00000E65 3C04                     cmp al, 4
  2399 00000E67 0F850400                 jne .dofunc109
  2400 00000E6B 8346FA02                 add  word[bp-6], 2
  2401                                  .dofunc109:
  2402 00000E6F FF06[2C00]               inc  word[LTop]
  2403                                  
  2404                                  ;-259     while (istoken(','));  expect(')'); }
  2405                                  
  2406 00000E73 6A2C                     push 44
  2407 00000E75 E8A935                   call istoken
  2408 00000E78 83C402                   add  sp, 2
  2409 00000E7B 08C0                     or  al, al
  2410 00000E7D 0F840200                 je .dofunc110
  2411 00000E81 EBC8                     jmp .dofunc108
  2412                                  .dofunc110:
  2413 00000E83 6A29                     push 41
  2414 00000E85 E8BB35                   call expect
  2415 00000E88 83C402                   add  sp, 2
  2416                                  
  2417                                  ;-260     
  2418                                  
  2419                                  
  2420                                  ;-261   expect('{'); /*body*/
  2421                                  
  2422                                  .dofunc107:
  2423 00000E8B 6A7B                     push 123
  2424 00000E8D E8B335                   call expect
  2425 00000E90 83C402                   add  sp, 2
  2426                                  
  2427                                  ;-262   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */
  2428                                  
  2429 00000E93 B80000                   mov ax, 0
  2430 00000E96 8946FE                   mov [bp-2], ax
  2431 00000E99 B80000                   mov ax, 0
  2432 00000E9C A3[2600]                 mov word [nreturn], ax
  2433 00000E9F B80000                   mov ax, 0
  2434 00000EA2 A3[2400]                 mov word [nconst], ax
  2435 00000EA5 B80000                   mov ax, 0
  2436 00000EA8 8946FC                   mov [bp-4], ax
  2437                                  
  2438                                  ;-263   while(isvariable()) {
  2439                                  
  2440                                  .dofunc111:
  2441 00000EAB E8BC01                   call isvariable
  2442 00000EAE 08C0                     or  al, al
  2443 00000EB0 0F849200                 je .dofunc112
  2444                                  
  2445                                  ;-264     do {typeName();
  2446                                  
  2447                                  .dofunc113:
  2448 00000EB4 E808FC                   call typeName
  2449                                  
  2450                                  ;-265         checknamelen();
  2451                                  
  2452 00000EB7 E87DF5                   call checknamelen
  2453                                  
  2454                                  ;-266         addlocal(); nloc-=2;
  2455                                  
  2456 00000EBA E810FE                   call addlocal
  2457 00000EBD 836EFE02                 sub  word[bp-2], 2
  2458                                  
  2459                                  ;-267         if (iswidth == 4) nloc-=2;
  2460                                  
  2461 00000EC1 A0[3800]                 mov al, [iswidth]
  2462 00000EC4 3C04                     cmp al, 4
  2463 00000EC6 0F850400                 jne .dofunc114
  2464 00000ECA 836EFE02                 sub  word[bp-2], 2
  2465                                  
  2466                                  ;-268         GData[LTop]=nloc;
  2467                                  
  2468                                  .dofunc114:
  2469 00000ECE 8B46FE                   mov ax, [bp-2]
  2470 00000ED1 8B1E[2C00]               mov bx, [LTop]
  2471 00000ED5 D1E3                     shl bx, 1
  2472 00000ED7 8987EB8A                 mov [GData+bx], ax
  2473                                  
  2474                                  ;-269         if (istoken('[')){istype='&';GType[LTop]='&';expect(T_CONST);expect(']');
  2475                                  
  2476 00000EDB 6A5B                     push 91
  2477 00000EDD E84135                   call istoken
  2478 00000EE0 83C402                   add  sp, 2
  2479 00000EE3 08C0                     or  al, al
  2480 00000EE5 0F843D00                 je .dofunc115
  2481 00000EE9 B82600                   mov ax, 38
  2482 00000EEC A2[3200]                 mov byte [istype], al
  2483 00000EEF B82600                   mov ax, 38
  2484 00000EF2 8B1E[2C00]               mov bx, [LTop]
  2485 00000EF6 8887B782                 mov [GType+bx], al
  2486 00000EFA 680101                   push 257
  2487 00000EFD E84335                   call expect
  2488 00000F00 83C402                   add  sp, 2
  2489 00000F03 6A5D                     push 93
  2490 00000F05 E83B35                   call expect
  2491 00000F08 83C402                   add  sp, 2
  2492                                  
  2493                                  ;-270             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc; }
  2494                                  
  2495 00000F0B 8B46FE                   mov ax, [bp-2]
  2496 00000F0E 2B06[2E00]               sub ax, [lexval]
  2497 00000F12 8946FE                   mov [bp-2], ax
  2498 00000F15 8346FE02                 add  word[bp-2], 2
  2499 00000F19 8B46FE                   mov ax, [bp-2]
  2500 00000F1C 8B1E[2C00]               mov bx, [LTop]
  2501 00000F20 D1E3                     shl bx, 1
  2502 00000F22 8987EB8A                 mov [GData+bx], ax
  2503                                  
  2504                                  ;-271         LTop++;
  2505                                  
  2506                                  .dofunc115:
  2507 00000F26 FF06[2C00]               inc  word[LTop]
  2508                                  
  2509                                  ;-272       } while (istoken(',')); expect(';'); }
  2510                                  
  2511 00000F2A 6A2C                     push 44
  2512 00000F2C E8F234                   call istoken
  2513 00000F2F 83C402                   add  sp, 2
  2514 00000F32 08C0                     or  al, al
  2515 00000F34 0F840300                 je .dofunc116
  2516 00000F38 E979FF                   jmp .dofunc113
  2517                                  .dofunc116:
  2518 00000F3B 6A3B                     push 59
  2519 00000F3D E80335                   call expect
  2520 00000F40 83C402                   add  sp, 2
  2521                                  
  2522                                  ;-273   listproc(); 
  2523                                  
  2524 00000F43 E965FF                   jmp .dofunc111
  2525                                  .dofunc112:
  2526 00000F46 E8FA39                   call listproc
  2527                                  
  2528                                  ;-274   if (LTop>LSTART){prs(";\n ENTER  "); 
  2529                                  
  2530 00000F49 A1[2C00]                 mov ax, [LTop]
  2531 00000F4C 3DC800                   cmp ax, 200
  2532 00000F4F 0F8E2700                 jle .dofunc117
  2533 00000F53 68[3A10]                 push dofunc_3
  2534 00000F56 E8FD35                   call prs
  2535 00000F59 83C402                   add  sp, 2
  2536                                  
  2537                                  ;-275     nloc=mkneg(nloc); pint1 (nloc); prs(",0"); }
  2538                                  
  2539 00000F5C FF76FE                   push word [bp-2]
  2540 00000F5F E860F1                   call mkneg
  2541 00000F62 83C402                   add  sp, 2
  2542 00000F65 8946FE                   mov [bp-2], ax
  2543 00000F68 FF76FE                   push word [bp-2]
  2544 00000F6B E8DF36                   call pint1
  2545 00000F6E 83C402                   add  sp, 2
  2546 00000F71 68[4610]                 push dofunc_4
  2547 00000F74 E8DF35                   call prs
  2548 00000F77 83C402                   add  sp, 2
  2549                                  
  2550                                  ;-276   while(istoken('}')==0)   stmt();
  2551                                  
  2552                                  .dofunc117:
  2553                                  .dofunc118:
  2554 00000F7A 6A7D                     push 125
  2555 00000F7C E8A234                   call istoken
  2556 00000F7F 83C402                   add  sp, 2
  2557 00000F82 83F800                   cmp ax, 0
  2558 00000F85 0F850500                 jne .dofunc119
  2559 00000F89 E81028                   call stmt
  2560                                  
  2561                                  ;-277   if (nreturn) { prs("\n .retn:");}
  2562                                  
  2563 00000F8C EBEC                     jmp .dofunc118
  2564                                  .dofunc119:
  2565 00000F8E A1[2600]                 mov ax, [nreturn]
  2566 00000F91 08C0                     or  al, al
  2567 00000F93 0F840900                 je .dofunc120
  2568 00000F97 68[4910]                 push dofunc_5
  2569 00000F9A E8B935                   call prs
  2570 00000F9D 83C402                   add  sp, 2
  2571                                  
  2572                                  ;-278   if (LTop > LSTART) prs(" LEAVE");
  2573                                  
  2574                                  .dofunc120:
  2575 00000FA0 A1[2C00]                 mov ax, [LTop]
  2576 00000FA3 3DC800                   cmp ax, 200
  2577 00000FA6 0F8E0900                 jle .dofunc121
  2578 00000FAA 68[5310]                 push dofunc_6
  2579 00000FAD E8A635                   call prs
  2580 00000FB0 83C402                   add  sp, 2
  2581                                  
  2582                                  ;-279   prs("\n ret"); prs("\n; ENDP"); 
  2583                                  
  2584                                  .dofunc121:
  2585 00000FB3 68[5A10]                 push dofunc_7
  2586 00000FB6 E89D35                   call prs
  2587 00000FB9 83C402                   add  sp, 2
  2588 00000FBC 68[6110]                 push dofunc_8
  2589 00000FBF E89435                   call prs
  2590 00000FC2 83C402                   add  sp, 2
  2591                                  
  2592                                  ;-280   *cloc=0; prs(co); maxco1=strlen(co);
  2593                                  
  2594 00000FC5 B80000                   mov ax, 0
  2595 00000FC8 8B1E[1600]               mov  bx, [cloc]
  2596 00000FCC 8807                     mov  [bx], al
  2597 00000FCE 8D063075                 lea  ax, [co]
  2598 00000FD2 50                       push ax
  2599 00000FD3 E88035                   call prs
  2600 00000FD6 83C402                   add  sp, 2
  2601 00000FD9 8D063075                 lea  ax, [co]
  2602 00000FDD 50                       push ax
  2603 00000FDE E85DF1                   call strlen
  2604 00000FE1 83C402                   add  sp, 2
  2605 00000FE4 A3[1400]                 mov word [maxco1], ax
  2606                                  
  2607                                  ;-281   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }
  2608                                  
  2609 00000FE7 A1[1400]                 mov ax, [maxco1]
  2610 00000FEA 3B06[1200]               cmp ax, [maxco]
  2611 00000FEE 0F8E1600                 jle .dofunc122
  2612 00000FF2 A1[1400]                 mov ax, [maxco1]
  2613 00000FF5 A3[1200]                 mov word [maxco], ax
  2614 00000FF8 8D06AB81                 lea  ax, [fname]
  2615 00000FFC 50                       push ax
  2616 00000FFD 8D06E880                 lea  ax, [coname]
  2617 00001001 50                       push ax
  2618 00001002 E861F1                   call strcpy
  2619 00001005 83C404                   add  sp, 4
  2620                                  
  2621                                  ;-282 }
  2622                                  
  2623                                  .dofunc122:
  2624                                  
  2625                                  ;-283 int isvariable() {
  2626 00001008 C9                       LEAVE
  2627 00001009 C3                       ret
  2628                                  ; ENDP
  2629 0000100A 46756E6374696F6E20-     dofunc_0 db "Function already defined",0
  2630 00001013 616C72656164792064-
  2631 0000101C 6566696E656400     
  2632 00001023 5C6E5C6E00              dofunc_1 db "\n\n",0
  2633 00001028 3A20203B202A2A2A20-     dofunc_2 db ":  ; *** PROC ***",0
  2634 00001031 50524F43202A2A2A00 
  2635 0000103A 3B5C6E20454E544552-     dofunc_3 db ";\n ENTER  ",0
  2636 00001043 202000             
  2637 00001046 2C3000                  dofunc_4 db ",0",0
  2638 00001049 5C6E202E7265746E3A-     dofunc_5 db "\n .retn:",0
  2639 00001052 00                 
  2640 00001053 204C4541564500          dofunc_6 db " LEAVE",0
  2641 0000105A 5C6E2072657400          dofunc_7 db "\n ret",0
  2642 00001061 5C6E3B20454E445000      dofunc_8 db "\n; ENDP",0
  2643                                  
  2644                                  isvariable:  ; *** PROC ***
  2645                                  
  2646                                  ;-284     if(token==T_SIGNED)   goto v1;   
  2647                                  
  2648 0000106A A1[1C00]                 mov ax, [token]
  2649 0000106D 3D1302                   cmp ax, 531
  2650 00001070 0F850300                 jne .isvariable123
  2651 00001074 E93A00                   jmp .v1
  2652                                  
  2653                                  ;-285     if(token==T_UNSIGNED) goto v1;
  2654                                  
  2655                                  .isvariable123:
  2656 00001077 A1[1C00]                 mov ax, [token]
  2657 0000107A 3D1402                   cmp ax, 532
  2658 0000107D 0F850300                 jne .isvariable124
  2659 00001081 E92D00                   jmp .v1
  2660                                  
  2661                                  ;-286     if(token==T_CHAR)     goto v1;   
  2662                                  
  2663                                  .isvariable124:
  2664 00001084 A1[1C00]                 mov ax, [token]
  2665 00001087 3D1202                   cmp ax, 530
  2666 0000108A 0F850300                 jne .isvariable125
  2667 0000108E E92000                   jmp .v1
  2668                                  
  2669                                  ;-287     if(token==T_INT)      goto v1;
  2670                                  
  2671                                  .isvariable125:
  2672 00001091 A1[1C00]                 mov ax, [token]
  2673 00001094 3D0502                   cmp ax, 517
  2674 00001097 0F850300                 jne .isvariable126
  2675 0000109B E91300                   jmp .v1
  2676                                  
  2677                                  ;-288     if(token==T_LONG)     goto v1;
  2678                                  
  2679                                  .isvariable126:
  2680 0000109E A1[1C00]                 mov ax, [token]
  2681 000010A1 3D1502                   cmp ax, 533
  2682 000010A4 0F850300                 jne .isvariable127
  2683 000010A8 E90600                   jmp .v1
  2684                                  
  2685                                  ;-289     return 0;  
  2686                                  
  2687                                  .isvariable127:
  2688 000010AB B80000                   mov ax, 0
  2689 000010AE E90600                   jmp .retn
  2690                                  
  2691                                  ;-290 v1: return 1;
  2692                                  
  2693                                  .v1:
  2694 000010B1 B80100                   mov ax, 1
  2695 000010B4 E90000                   jmp .retn
  2696                                  
  2697                                  ;-291 }
  2698                                  
  2699                                  
  2700                                  ;-292                   
  2701                                  
  2702                                  
  2703                                  ;-293 int mod1; int ireg1; int idx1; int ids1; int idw1; int idt1; int val1;
  2704                                  
  2705                                   .retn:
  2706 000010B7 C3                       ret
  2707                                  ; ENDP
  2708 000010B8 0000                    mod1 dw 0
  2709 000010BA 0000                    ireg1 dw 0
  2710 000010BC 0000                    idx1 dw 0
  2711 000010BE 0000                    ids1 dw 0
  2712 000010C0 0000                    idw1 dw 0
  2713 000010C2 0000                    idt1 dw 0
  2714 000010C4 0000                    val1 dw 0
  2715                                  
  2716                                  ;-294 int mod2; int ireg2; int idx2; int ids2; int idw2; int idt2; int val2;
  2717                                  
  2718 000010C6 0000                    mod2 dw 0
  2719 000010C8 0000                    ireg2 dw 0
  2720 000010CA 0000                    idx2 dw 0
  2721 000010CC 0000                    ids2 dw 0
  2722 000010CE 0000                    idw2 dw 0
  2723 000010D0 0000                    idt2 dw 0
  2724 000010D2 0000                    val2 dw 0
  2725                                  
  2726                                  ;-295 
  2727                                  
  2728                                  
  2729                                  ;-296 int pexpr() {expect('('); iscmp=0; 
  2730                                  
  2731                                  
  2732                                  pexpr:  ; *** PROC ***
  2733 000010D4 6A28                     push 40
  2734 000010D6 E86A33                   call expect
  2735 000010D9 83C402                   add  sp, 2
  2736 000010DC B80000                   mov ax, 0
  2737 000010DF A3[2200]                 mov word [iscmp], ax
  2738                                  
  2739                                  ;-297   if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}
  2740                                  
  2741 000010E2 A1[1C00]                 mov ax, [token]
  2742 000010E5 3D0001                   cmp ax, 256
  2743 000010E8 0F853400                 jne .pexpr128
  2744 000010EC 68[4A11]                 push pexpr_0
  2745 000010EF 8D062B81                 lea  ax, [symbol]
  2746 000010F3 50                       push ax
  2747 000010F4 E89FF0                   call eqstr
  2748 000010F7 83C404                   add  sp, 4
  2749 000010FA 08C0                     or  al, al
  2750 000010FC 0F840600                 je .pexpr129
  2751 00001100 E85E00                   call constantexpr
  2752 00001103 E94300                   jmp .retn
  2753                                  
  2754                                  ;-298     ireg1=checkreg();
  2755                                  
  2756                                  .pexpr129:
  2757 00001106 E89A07                   call checkreg
  2758 00001109 A3[BA10]                 mov word [ireg1], ax
  2759                                  
  2760                                  ;-299     if (ireg1) { doreg1(1); return; }  }
  2761                                  
  2762 0000110C A1[BA10]                 mov ax, [ireg1]
  2763 0000110F 08C0                     or  al, al
  2764 00001111 0F840B00                 je .pexpr130
  2765 00001115 6A01                     push 1
  2766 00001117 E89D05                   call doreg1
  2767 0000111A 83C402                   add  sp, 2
  2768 0000111D E92900                   jmp .retn
  2769                                  .pexpr130:
  2770                                  
  2771                                  ;-300   exprstart(); if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);
  2772                                  
  2773                                  .pexpr128:
  2774 00001120 E83D01                   call exprstart
  2775 00001123 A1[2200]                 mov ax, [iscmp]
  2776 00001126 83F800                   cmp ax, 0
  2777 00001129 0F850900                 jne .pexpr131
  2778 0000112D 68[4C11]                 push pexpr_1
  2779 00001130 E82334                   call prs
  2780 00001133 83C402                   add  sp, 2
  2781                                  .pexpr131:
  2782 00001136 8D06AB81                 lea  ax, [fname]
  2783 0000113A 50                       push ax
  2784 0000113B E81834                   call prs
  2785 0000113E 83C402                   add  sp, 2
  2786                                  
  2787                                  ;-301   expect(')'); }           /*error1("Vergleich fehlt");*/
  2788                                  
  2789 00001141 6A29                     push 41
  2790 00001143 E8FD32                   call expect
  2791 00001146 83C402                   add  sp, 2
  2792                                  
  2793                                  ;-302 
  2794                                  
  2795                                  
  2796                                  ;-303 int constantexpr() { int mode; int id1;int ids;
  2797                                  
  2798                                   .retn:
  2799 00001149 C3                       ret
  2800                                  ; ENDP
  2801 0000114A 5F00                    pexpr_0 db "_",0
  2802 0000114C 5C6E206F722020616C-     pexpr_1 db "\n or  al, al\n je .",0
  2803 00001155 2C20616C5C6E206A65-
  2804 0000115E 202E00             
  2805                                  
  2806                                  constantexpr:  ; *** PROC ***
  2807                                  
  2808                                  ;-304   token=getlex();   mode=typeName();  
  2809                                  
  2810                                  ;Function : constantexpr, Number of local variables: 3
  2811                                  ;   # type sign width addr used name   list of local variables
  2812                                  ;  200 var sign word   303 NULL mode = bp-2
  2813                                  ;  201 var sign word   303 NULL id1 = bp-4
  2814                                  ;  202 var sign word   303 NULL ids = bp-6;
  2815 00001161 C8060000                 ENTER  6,0
  2816 00001165 E8952B                   call getlex
  2817 00001168 A3[1C00]                 mov word [token], ax
  2818 0000116B E851F9                   call typeName
  2819 0000116E 8946FE                   mov [bp-2], ax
  2820                                  
  2821                                  ;-305   id1=searchname(); gettypes(id1); ids=signi;
  2822                                  
  2823 00001171 E87CF8                   call searchname
  2824 00001174 8946FC                   mov [bp-4], ax
  2825 00001177 FF76FC                   push word [bp-4]
  2826 0000117A E835F7                   call gettypes
  2827 0000117D 83C402                   add  sp, 2
  2828 00001180 A1[3300]                 mov ax, [signi]
  2829 00001183 8946FA                   mov [bp-6], ax
  2830                                  
  2831                                  ;-306   if (isrelational() ==0) error1("Relational expression expected");
  2832                                  
  2833 00001186 E80D2B                   call isrelational
  2834 00001189 83F800                   cmp ax, 0
  2835 0000118C 0F850900                 jne .constantexpr132
  2836 00001190 68[1612]                 push constantexpr_0
  2837 00001193 E8AB36                   call error1
  2838 00001196 83C402                   add  sp, 2
  2839                                  
  2840                                  ;-307   expect(T_CONST);  prs(" ; constant expression");
  2841                                  
  2842                                  .constantexpr132:
  2843 00001199 680101                   push 257
  2844 0000119C E8A432                   call expect
  2845 0000119F 83C402                   add  sp, 2
  2846 000011A2 68[3512]                 push constantexpr_1
  2847 000011A5 E8AE33                   call prs
  2848 000011A8 83C402                   add  sp, 2
  2849                                  
  2850                                  ;-308   prs("\ncmp "); 
  2851                                  
  2852 000011AB 68[4C12]                 push constantexpr_2
  2853 000011AE E8A533                   call prs
  2854 000011B1 83C402                   add  sp, 2
  2855                                  
  2856                                  ;-309   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  2857                                  
  2858 000011B4 FF76FC                   push word [bp-4]
  2859 000011B7 E8F8F6                   call gettypes
  2860 000011BA 83C402                   add  sp, 2
  2861 000011BD A1[3900]                 mov ax, [wi]
  2862 000011C0 83F802                   cmp ax, 2
  2863 000011C3 0F850C00                 jne .constantexpr133
  2864 000011C7 68[5312]                 push constantexpr_3
  2865 000011CA E88933                   call prs
  2866 000011CD 83C402                   add  sp, 2
  2867 000011D0 E90900                   jmp .constantexpr134
  2868                                  .constantexpr133:
  2869 000011D3 68[5812]                 push constantexpr_4
  2870 000011D6 E87D33                   call prs
  2871 000011D9 83C402                   add  sp, 2
  2872                                  
  2873                                  ;-310   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);
  2874                                  
  2875                                  .constantexpr134:
  2876 000011DC FF76FC                   push word [bp-4]
  2877 000011DF E822F2                   call v
  2878 000011E2 83C402                   add  sp, 2
  2879 000011E5 68[5D12]                 push constantexpr_5
  2880 000011E8 E86B33                   call prs
  2881 000011EB 83C402                   add  sp, 2
  2882 000011EE FF36[2E00]               push word [lexval]
  2883 000011F2 E8BB34                   call prunsign1
  2884 000011F5 83C402                   add  sp, 2
  2885 000011F8 FF76FA                   push word [bp-6]
  2886 000011FB E8E527                   call cmpneg
  2887 000011FE 83C402                   add  sp, 2
  2888 00001201 8D06AB81                 lea  ax, [fname]
  2889 00001205 50                       push ax
  2890 00001206 E84D33                   call prs
  2891 00001209 83C402                   add  sp, 2
  2892                                  
  2893                                  ;-311   expect(')');
  2894                                  
  2895 0000120C 6A29                     push 41
  2896 0000120E E83232                   call expect
  2897 00001211 83C402                   add  sp, 2
  2898                                  
  2899                                  ;-312 }  
  2900                                  
  2901                                  
  2902                                  ;-313 int exprstart() { if (eqstr(symbol, "_")) expr2(0); else expr(0); }
  2903 00001214 C9                       LEAVE
  2904 00001215 C3                       ret
  2905                                  ; ENDP
  2906 00001216 52656C6174696F6E61-     constantexpr_0 db "Relational expression expected",0
  2907 0000121F 6C2065787072657373-
  2908 00001228 696F6E206578706563-
  2909 00001231 74656400           
  2910 00001235 203B20636F6E737461-     constantexpr_1 db " ; constant expression",0
  2911 0000123E 6E7420657870726573-
  2912 00001247 73696F6E00         
  2913 0000124C 5C6E636D702000          constantexpr_2 db "\ncmp ",0
  2914 00001253 776F726400              constantexpr_3 db "word",0
  2915 00001258 6279746500              constantexpr_4 db "byte",0
  2916 0000125D 2C2000                  constantexpr_5 db ", ",0
  2917                                  
  2918                                  exprstart:  ; *** PROC ***
  2919 00001260 68[8812]                 push exprstart_0
  2920 00001263 8D062B81                 lea  ax, [symbol]
  2921 00001267 50                       push ax
  2922 00001268 E82BEF                   call eqstr
  2923 0000126B 83C404                   add  sp, 4
  2924 0000126E 08C0                     or  al, al
  2925 00001270 0F840B00                 je .exprstart135
  2926 00001274 6A00                     push 0
  2927 00001276 E81100                   call expr2
  2928 00001279 83C402                   add  sp, 2
  2929 0000127C E90800                   jmp .exprstart136
  2930                                  .exprstart135:
  2931 0000127F 6A00                     push 0
  2932 00001281 E89E0A                   call expr
  2933 00001284 83C402                   add  sp, 2
  2934                                  .exprstart136:
  2935                                  
  2936                                  ;-314 
  2937                                  
  2938                                  
  2939                                  ;-315 int expr2(int kind) {  int i;
  2940                                  
  2941 00001287 C3                       ret
  2942                                  ; ENDP
  2943 00001288 5F00                    exprstart_0 db "_",0
  2944                                  
  2945                                  expr2:  ; *** PROC ***
  2946                                  
  2947                                  ;-316   if(kind != 1) token=getlex();
  2948                                  
  2949                                  ;Function : expr2, Number of local variables: 2
  2950                                  ;   # type sign width addr used name   list of local variables
  2951                                  ;  200 var sign word   315 NULL kind = bp+4
  2952                                  ;  201 var sign word   315 NULL i = bp-2;
  2953 0000128A C8020000                 ENTER  2,0
  2954 0000128E 8B4604                   mov ax, [bp+4]
  2955 00001291 83F801                   cmp ax, 1
  2956 00001294 0F840600                 je  .expr2137
  2957 00001298 E8622A                   call getlex
  2958 0000129B A3[1C00]                 mov word [token], ax
  2959                                  
  2960                                  ;-317   mod1=typeName();
  2961                                  
  2962                                  .expr2137:
  2963 0000129E E81EF8                   call typeName
  2964 000012A1 A3[B810]                 mov word [mod1], ax
  2965                                  
  2966                                  ;-318   if (mod1) error1("Noch kein & und * im Text (Linke Hand) erlaubt");
  2967                                  
  2968 000012A4 A1[B810]                 mov ax, [mod1]
  2969 000012A7 08C0                     or  al, al
  2970 000012A9 0F840900                 je .expr2138
  2971 000012AD 68[4215]                 push expr2_0
  2972 000012B0 E88E35                   call error1
  2973 000012B3 83C402                   add  sp, 2
  2974                                  
  2975                                  ;-319   ireg1=checkreg();
  2976                                  
  2977                                  .expr2138:
  2978 000012B6 E8EA05                   call checkreg
  2979 000012B9 A3[BA10]                 mov word [ireg1], ax
  2980                                  
  2981                                  ;-320   if (ireg1) { doreg1(0); return; }
  2982                                  
  2983 000012BC A1[BA10]                 mov ax, [ireg1]
  2984 000012BF 08C0                     or  al, al
  2985 000012C1 0F840B00                 je .expr2139
  2986 000012C5 6A00                     push 0
  2987 000012C7 E8ED03                   call doreg1
  2988 000012CA 83C402                   add  sp, 2
  2989 000012CD E97002                   jmp .retn
  2990                                  
  2991                                  ;-321   if (ireg1 == 0) { idx1=searchname();
  2992                                  
  2993                                  .expr2139:
  2994 000012D0 A1[BA10]                 mov ax, [ireg1]
  2995 000012D3 83F800                   cmp ax, 0
  2996 000012D6 0F853400                 jne .expr2140
  2997 000012DA E813F7                   call searchname
  2998 000012DD A3[BC10]                 mov word [idx1], ax
  2999                                  
  3000                                  ;-322     gettypes(idx1); ids1=signi; idw1=wi; idt1=typei;
  3001                                  
  3002 000012E0 FF36[BC10]               push word [idx1]
  3003 000012E4 E8CBF5                   call gettypes
  3004 000012E7 83C402                   add  sp, 2
  3005 000012EA A1[3300]                 mov ax, [signi]
  3006 000012ED A3[BE10]                 mov word [ids1], ax
  3007 000012F0 A1[3900]                 mov ax, [wi]
  3008 000012F3 A3[C010]                 mov word [idw1], ax
  3009 000012F6 A1[3000]                 mov ax, [typei]
  3010 000012F9 A3[C210]                 mov word [idt1], ax
  3011                                  
  3012                                  ;-323     if (idt1)  error1("Noch kein Array oder Pointer links erlaubt");  }
  3013                                  
  3014 000012FC A1[C210]                 mov ax, [idt1]
  3015 000012FF 08C0                     or  al, al
  3016 00001301 0F840900                 je .expr2141
  3017 00001305 68[7115]                 push expr2_1
  3018 00001308 E83635                   call error1
  3019 0000130B 83C402                   add  sp, 2
  3020                                  .expr2141:
  3021                                  
  3022                                  ;-324   
  3023                                  
  3024                                  
  3025                                  ;-325   if (isrelational()) { error1("Vergleich noch nicht implementiert");
  3026                                  
  3027                                  .expr2140:
  3028 0000130E E88529                   call isrelational
  3029 00001311 08C0                     or  al, al
  3030 00001313 0F840900                 je .expr2142
  3031 00001317 68[9C15]                 push expr2_2
  3032 0000131A E82435                   call error1
  3033 0000131D 83C402                   add  sp, 2
  3034                                  
  3035                                  ;-326   }
  3036                                  
  3037                                  
  3038                                  ;-327   if (istoken('=') == 0) error1("Assign expected");
  3039                                  
  3040                                  .expr2142:
  3041 00001320 6A3D                     push 61
  3042 00001322 E8FC30                   call istoken
  3043 00001325 83C402                   add  sp, 2
  3044 00001328 83F800                   cmp ax, 0
  3045 0000132B 0F850900                 jne .expr2143
  3046 0000132F 68[BF15]                 push expr2_3
  3047 00001332 E80C35                   call error1
  3048 00001335 83C402                   add  sp, 2
  3049                                  
  3050                                  ;-328   if (istoken(T_CONST) ) { val2=lexval; prs(" ; constant expression");
  3051                                  
  3052                                  .expr2143:
  3053 00001338 680101                   push 257
  3054 0000133B E8E330                   call istoken
  3055 0000133E 83C402                   add  sp, 2
  3056 00001341 08C0                     or  al, al
  3057 00001343 0F849A00                 je .expr2144
  3058 00001347 A1[2E00]                 mov ax, [lexval]
  3059 0000134A A3[D210]                 mov word [val2], ax
  3060 0000134D 68[CF15]                 push expr2_4
  3061 00001350 E80332                   call prs
  3062 00001353 83C402                   add  sp, 2
  3063                                  
  3064                                  ;-329     prs("\nmov ");
  3065                                  
  3066 00001356 68[E615]                 push expr2_5
  3067 00001359 E8FA31                   call prs
  3068 0000135C 83C402                   add  sp, 2
  3069                                  
  3070                                  ;-330     if (idw1 == 1) prs("byte ");
  3071                                  
  3072 0000135F A1[C010]                 mov ax, [idw1]
  3073 00001362 83F801                   cmp ax, 1
  3074 00001365 0F850900                 jne .expr2145
  3075 00001369 68[ED15]                 push expr2_6
  3076 0000136C E8E731                   call prs
  3077 0000136F 83C402                   add  sp, 2
  3078                                  
  3079                                  ;-331     if (idw1 == 2) prs("word ");
  3080                                  
  3081                                  .expr2145:
  3082 00001372 A1[C010]                 mov ax, [idw1]
  3083 00001375 83F802                   cmp ax, 2
  3084 00001378 0F850900                 jne .expr2146
  3085 0000137C 68[F315]                 push expr2_7
  3086 0000137F E8D431                   call prs
  3087 00001382 83C402                   add  sp, 2
  3088                                  
  3089                                  ;-332     if (idw1 == 4) prs("dword ");
  3090                                  
  3091                                  .expr2146:
  3092 00001385 A1[C010]                 mov ax, [idw1]
  3093 00001388 83F804                   cmp ax, 4
  3094 0000138B 0F850900                 jne .expr2147
  3095 0000138F 68[F915]                 push expr2_8
  3096 00001392 E8C131                   call prs
  3097 00001395 83C402                   add  sp, 2
  3098                                  
  3099                                  ;-333     v(idx1);
  3100                                  
  3101                                  .expr2147:
  3102 00001398 FF36[BC10]               push word [idx1]
  3103 0000139C E865F0                   call v
  3104 0000139F 83C402                   add  sp, 2
  3105                                  
  3106                                  ;-334     prs(", "); prunsign1(val2);
  3107                                  
  3108 000013A2 68[0016]                 push expr2_9
  3109 000013A5 E8AE31                   call prs
  3110 000013A8 83C402                   add  sp, 2
  3111 000013AB FF36[D210]               push word [val2]
  3112 000013AF E8FE32                   call prunsign1
  3113 000013B2 83C402                   add  sp, 2
  3114                                  
  3115                                  ;-335     if (idx1 >= LSTART) { i=adrofname(idx1);  prs("; "); prs(i); } return; }
  3116                                  
  3117 000013B5 A1[BC10]                 mov ax, [idx1]
  3118 000013B8 3DC800                   cmp ax, 200 ;unsigned : 1
  3119 000013BB 0F8C1F00                 jl  .expr2148
  3120 000013BF FF36[BC10]               push word [idx1]
  3121 000013C3 E8A3F5                   call adrofname
  3122 000013C6 83C402                   add  sp, 2
  3123 000013C9 8946FE                   mov [bp-2], ax
  3124 000013CC 68[0316]                 push expr2_10
  3125 000013CF E88431                   call prs
  3126 000013D2 83C402                   add  sp, 2
  3127 000013D5 FF76FE                   push word [bp-2]
  3128 000013D8 E87B31                   call prs
  3129 000013DB 83C402                   add  sp, 2
  3130                                  .expr2148:
  3131 000013DE E95F01                   jmp .retn
  3132                                  
  3133                                  ;-336   
  3134                                  
  3135                                  
  3136                                  ;-337   mod1=typeName(); ireg2=checkreg();
  3137                                  
  3138                                  .expr2144:
  3139 000013E1 E8DBF6                   call typeName
  3140 000013E4 A3[B810]                 mov word [mod1], ax
  3141 000013E7 E8B904                   call checkreg
  3142 000013EA A3[C810]                 mov word [ireg2], ax
  3143                                  
  3144                                  ;-338   if (ireg2) { prs("\nmov ");
  3145                                  
  3146 000013ED A1[C810]                 mov ax, [ireg2]
  3147 000013F0 08C0                     or  al, al
  3148 000013F2 0F844200                 je .expr2149
  3149 000013F6 68[0616]                 push expr2_11
  3150 000013F9 E85A31                   call prs
  3151 000013FC 83C402                   add  sp, 2
  3152                                  
  3153                                  ;-339     if (ireg1) printreg(ireg1); else v(idx1); prs(", "); printreg(ireg2);return;}
  3154                                  
  3155 000013FF A1[BA10]                 mov ax, [ireg1]
  3156 00001402 08C0                     or  al, al
  3157 00001404 0F840D00                 je .expr2150
  3158 00001408 FF36[BA10]               push word [ireg1]
  3159 0000140C E8A208                   call printreg
  3160 0000140F 83C402                   add  sp, 2
  3161 00001412 E90A00                   jmp .expr2151
  3162                                  .expr2150:
  3163 00001415 FF36[BC10]               push word [idx1]
  3164 00001419 E8E8EF                   call v
  3165 0000141C 83C402                   add  sp, 2
  3166                                  .expr2151:
  3167 0000141F 68[0D16]                 push expr2_12
  3168 00001422 E83131                   call prs
  3169 00001425 83C402                   add  sp, 2
  3170 00001428 FF36[C810]               push word [ireg2]
  3171 0000142C E88208                   call printreg
  3172 0000142F 83C402                   add  sp, 2
  3173 00001432 E90B01                   jmp .retn
  3174                                  
  3175                                  ;-340   else {
  3176                                  
  3177 00001435 E9FF00                   jmp .expr2152
  3178                                  .expr2149:
  3179                                  
  3180                                  ;-341     if (mod1 == 1) error1("Noch kein * im Text erlaubt");
  3181                                  
  3182 00001438 A1[B810]                 mov ax, [mod1]
  3183 0000143B 83F801                   cmp ax, 1
  3184 0000143E 0F850900                 jne .expr2153
  3185 00001442 68[1016]                 push expr2_13
  3186 00001445 E8F933                   call error1
  3187 00001448 83C402                   add  sp, 2
  3188                                  
  3189                                  ;-342     
  3190                                  
  3191                                  
  3192                                  ;-343     idx2=searchname();
  3193                                  
  3194                                  .expr2153:
  3195 0000144B E8A2F5                   call searchname
  3196 0000144E A3[CA10]                 mov word [idx2], ax
  3197                                  
  3198                                  ;-344     gettypes(idx2); ids2=signi; idw2=wi; idt2=typei;
  3199                                  
  3200 00001451 FF36[CA10]               push word [idx2]
  3201 00001455 E85AF4                   call gettypes
  3202 00001458 83C402                   add  sp, 2
  3203 0000145B A1[3300]                 mov ax, [signi]
  3204 0000145E A3[CC10]                 mov word [ids2], ax
  3205 00001461 A1[3900]                 mov ax, [wi]
  3206 00001464 A3[CE10]                 mov word [idw2], ax
  3207 00001467 A1[3000]                 mov ax, [typei]
  3208 0000146A A3[D010]                 mov word [idt2], ax
  3209                                  
  3210                                  ;-345     if (idt2 == 1)  error1("Noch kein Array rechts erlaubt");
  3211                                  
  3212 0000146D A1[D010]                 mov ax, [idt2]
  3213 00001470 83F801                   cmp ax, 1
  3214 00001473 0F850900                 jne .expr2154
  3215 00001477 68[2C16]                 push expr2_14
  3216 0000147A E8C433                   call error1
  3217 0000147D 83C402                   add  sp, 2
  3218                                  
  3219                                  ;-346     prs("\nmov ");
  3220                                  
  3221                                  .expr2154:
  3222 00001480 68[4B16]                 push expr2_15
  3223 00001483 E8D030                   call prs
  3224 00001486 83C402                   add  sp, 2
  3225                                  
  3226                                  ;-347     if (ireg1) printreg(ireg1); else error1("Mem to Mem not allowed by x86-CPU");
  3227                                  
  3228 00001489 A1[BA10]                 mov ax, [ireg1]
  3229 0000148C 08C0                     or  al, al
  3230 0000148E 0F840D00                 je .expr2155
  3231 00001492 FF36[BA10]               push word [ireg1]
  3232 00001496 E81808                   call printreg
  3233 00001499 83C402                   add  sp, 2
  3234 0000149C E90900                   jmp .expr2156
  3235                                  .expr2155:
  3236 0000149F 68[5216]                 push expr2_16
  3237 000014A2 E89C33                   call error1
  3238 000014A5 83C402                   add  sp, 2
  3239                                  
  3240                                  ;-348     prs(", ");
  3241                                  
  3242                                  .expr2156:
  3243 000014A8 68[7416]                 push expr2_17
  3244 000014AB E8A830                   call prs
  3245 000014AE 83C402                   add  sp, 2
  3246                                  
  3247                                  ;-349     if (mod1 == 2) a(idx2);
  3248                                  
  3249 000014B1 A1[B810]                 mov ax, [mod1]
  3250 000014B4 83F802                   cmp ax, 2
  3251 000014B7 0F850D00                 jne .expr2157
  3252 000014BB FF36[CA10]               push word [idx2]
  3253 000014BF E833EF                   call a
  3254 000014C2 83C402                   add  sp, 2
  3255                                  
  3256                                  ;-350     else {
  3257                                  
  3258 000014C5 E96C00                   jmp .expr2158
  3259                                  .expr2157:
  3260                                  
  3261                                  ;-351       if (idw2 == 1) prs("byte ");
  3262                                  
  3263 000014C8 A1[CE10]                 mov ax, [idw2]
  3264 000014CB 83F801                   cmp ax, 1
  3265 000014CE 0F850900                 jne .expr2159
  3266 000014D2 68[7716]                 push expr2_18
  3267 000014D5 E87E30                   call prs
  3268 000014D8 83C402                   add  sp, 2
  3269                                  
  3270                                  ;-352       if (idw2 == 2) prs("word ");
  3271                                  
  3272                                  .expr2159:
  3273 000014DB A1[CE10]                 mov ax, [idw2]
  3274 000014DE 83F802                   cmp ax, 2
  3275 000014E1 0F850900                 jne .expr2160
  3276 000014E5 68[7D16]                 push expr2_19
  3277 000014E8 E86B30                   call prs
  3278 000014EB 83C402                   add  sp, 2
  3279                                  
  3280                                  ;-353       if (idw2 == 4) prs("dword ");
  3281                                  
  3282                                  .expr2160:
  3283 000014EE A1[CE10]                 mov ax, [idw2]
  3284 000014F1 83F804                   cmp ax, 4
  3285 000014F4 0F850900                 jne .expr2161
  3286 000014F8 68[8316]                 push expr2_20
  3287 000014FB E85830                   call prs
  3288 000014FE 83C402                   add  sp, 2
  3289                                  
  3290                                  ;-354       v(idx2);
  3291                                  
  3292                                  .expr2161:
  3293 00001501 FF36[CA10]               push word [idx2]
  3294 00001505 E8FCEE                   call v
  3295 00001508 83C402                   add  sp, 2
  3296                                  
  3297                                  ;-355       if (idx2 >= LSTART) { i=adrofname(idx2);  prs("; "); prs(i); }  }
  3298                                  
  3299 0000150B A1[CA10]                 mov ax, [idx2]
  3300 0000150E 3DC800                   cmp ax, 200 ;unsigned : 1
  3301 00001511 0F8C1F00                 jl  .expr2162
  3302 00001515 FF36[CA10]               push word [idx2]
  3303 00001519 E84DF4                   call adrofname
  3304 0000151C 83C402                   add  sp, 2
  3305 0000151F 8946FE                   mov [bp-2], ax
  3306 00001522 68[8A16]                 push expr2_21
  3307 00001525 E82E30                   call prs
  3308 00001528 83C402                   add  sp, 2
  3309 0000152B FF76FE                   push word [bp-2]
  3310 0000152E E82530                   call prs
  3311 00001531 83C402                   add  sp, 2
  3312                                  .expr2162:
  3313                                  
  3314                                  ;-356     return;
  3315                                  
  3316                                  .expr2158:
  3317 00001534 E90900                   jmp .retn
  3318                                  
  3319                                  ;-357   } error1("Internal error: only const or reg allowed");
  3320                                  
  3321                                  .expr2152:
  3322 00001537 68[8D16]                 push expr2_22
  3323 0000153A E80433                   call error1
  3324 0000153D 83C402                   add  sp, 2
  3325                                  
  3326                                  ;-358 }
  3327                                  
  3328                                  
  3329                                  ;-359 char ops[5];
  3330                                  
  3331 00001540 C9                       .retn: LEAVE
  3332 00001541 C3                       ret
  3333                                  ; ENDP
  3334 00001542 4E6F6368206B65696E-     expr2_0 db "Noch kein & und * im Text (Linke Hand) erlaubt",0
  3335 0000154B 202620756E64202A20-
  3336 00001554 696D20546578742028-
  3337 0000155D 4C696E6B652048616E-
  3338 00001566 64292065726C617562-
  3339 0000156F 7400               
  3340 00001571 4E6F6368206B65696E-     expr2_1 db "Noch kein Array oder Pointer links erlaubt",0
  3341 0000157A 204172726179206F64-
  3342 00001583 657220506F696E7465-
  3343 0000158C 72206C696E6B732065-
  3344 00001595 726C6175627400     
  3345 0000159C 566572676C65696368-     expr2_2 db "Vergleich noch nicht implementiert",0
  3346 000015A5 206E6F6368206E6963-
  3347 000015AE 687420696D706C656D-
  3348 000015B7 656E746965727400   
  3349 000015BF 41737369676E206578-     expr2_3 db "Assign expected",0
  3350 000015C8 70656374656400     
  3351 000015CF 203B20636F6E737461-     expr2_4 db " ; constant expression",0
  3352 000015D8 6E7420657870726573-
  3353 000015E1 73696F6E00         
  3354 000015E6 5C6E6D6F762000          expr2_5 db "\nmov ",0
  3355 000015ED 627974652000            expr2_6 db "byte ",0
  3356 000015F3 776F72642000            expr2_7 db "word ",0
  3357 000015F9 64776F72642000          expr2_8 db "dword ",0
  3358 00001600 2C2000                  expr2_9 db ", ",0
  3359 00001603 3B2000                  expr2_10 db "; ",0
  3360 00001606 5C6E6D6F762000          expr2_11 db "\nmov ",0
  3361 0000160D 2C2000                  expr2_12 db ", ",0
  3362 00001610 4E6F6368206B65696E-     expr2_13 db "Noch kein * im Text erlaubt",0
  3363 00001619 202A20696D20546578-
  3364 00001622 742065726C61756274-
  3365 0000162B 00                 
  3366 0000162C 4E6F6368206B65696E-     expr2_14 db "Noch kein Array rechts erlaubt",0
  3367 00001635 204172726179207265-
  3368 0000163E 636874732065726C61-
  3369 00001647 75627400           
  3370 0000164B 5C6E6D6F762000          expr2_15 db "\nmov ",0
  3371 00001652 4D656D20746F204D65-     expr2_16 db "Mem to Mem not allowed by x86-CPU",0
  3372 0000165B 6D206E6F7420616C6C-
  3373 00001664 6F7765642062792078-
  3374 0000166D 38362D43505500     
  3375 00001674 2C2000                  expr2_17 db ", ",0
  3376 00001677 627974652000            expr2_18 db "byte ",0
  3377 0000167D 776F72642000            expr2_19 db "word ",0
  3378 00001683 64776F72642000          expr2_20 db "dword ",0
  3379 0000168A 3B2000                  expr2_21 db "; ",0
  3380 0000168D 496E7465726E616C20-     expr2_22 db "Internal error: only const or reg allowed",0
  3381 00001696 6572726F723A206F6E-
  3382 0000169F 6C7920636F6E737420-
  3383 000016A8 6F722072656720616C-
  3384 000016B1 6C6F77656400       
  3385                                  section .bss
  3386                                  absolute 53406
  3387 0000D09E <res 00000005>          ops resb 5
  3388                                  section .text
  3389                                  
  3390                                  ;-360 int doreg1(int iscmp1) { int i;
  3391                                  
  3392                                  
  3393                                  doreg1:  ; *** PROC ***
  3394                                  
  3395                                  ;-361   if (istoken('='))          strcpy(ops, "mov");
  3396                                  
  3397                                  ;Function : doreg1, Number of local variables: 2
  3398                                  ;   # type sign width addr used name   list of local variables
  3399                                  ;  200 var sign word   360 NULL iscmp1 = bp+4
  3400                                  ;  201 var sign word   360 NULL i = bp-2;
  3401 000016B7 C8020000                 ENTER  2,0
  3402 000016BB 6A3D                     push 61
  3403 000016BD E8612D                   call istoken
  3404 000016C0 83C402                   add  sp, 2
  3405 000016C3 08C0                     or  al, al
  3406 000016C5 0F840E00                 je .doreg1163
  3407 000016C9 68[6A18]                 push doreg1_0
  3408 000016CC 8D069ED0                 lea  ax, [ops]
  3409 000016D0 50                       push ax
  3410 000016D1 E892EA                   call strcpy
  3411 000016D4 83C404                   add  sp, 4
  3412                                  
  3413                                  ;-362   if (istoken(T_PLUSASS))    strcpy(ops, "add");
  3414                                  
  3415                                  .doreg1163:
  3416 000016D7 68CE04                   push 1230
  3417 000016DA E8442D                   call istoken
  3418 000016DD 83C402                   add  sp, 2
  3419 000016E0 08C0                     or  al, al
  3420 000016E2 0F840E00                 je .doreg1164
  3421 000016E6 68[6E18]                 push doreg1_1
  3422 000016E9 8D069ED0                 lea  ax, [ops]
  3423 000016ED 50                       push ax
  3424 000016EE E875EA                   call strcpy
  3425 000016F1 83C404                   add  sp, 4
  3426                                  
  3427                                  ;-363   if (istoken(T_MINUSASS))   strcpy(ops, "sub");
  3428                                  
  3429                                  .doreg1164:
  3430 000016F4 68CF04                   push 1231
  3431 000016F7 E8272D                   call istoken
  3432 000016FA 83C402                   add  sp, 2
  3433 000016FD 08C0                     or  al, al
  3434 000016FF 0F840E00                 je .doreg1165
  3435 00001703 68[7218]                 push doreg1_2
  3436 00001706 8D069ED0                 lea  ax, [ops]
  3437 0000170A 50                       push ax
  3438 0000170B E858EA                   call strcpy
  3439 0000170E 83C404                   add  sp, 4
  3440                                  
  3441                                  ;-364   if (istoken(T_ANDASS))     strcpy(ops, "and");
  3442                                  
  3443                                  .doreg1165:
  3444 00001711 68D204                   push 1234
  3445 00001714 E80A2D                   call istoken
  3446 00001717 83C402                   add  sp, 2
  3447 0000171A 08C0                     or  al, al
  3448 0000171C 0F840E00                 je .doreg1166
  3449 00001720 68[7618]                 push doreg1_3
  3450 00001723 8D069ED0                 lea  ax, [ops]
  3451 00001727 50                       push ax
  3452 00001728 E83BEA                   call strcpy
  3453 0000172B 83C404                   add  sp, 4
  3454                                  
  3455                                  ;-365   if (istoken(T_ORASS))      strcpy(ops, "or" );
  3456                                  
  3457                                  .doreg1166:
  3458 0000172E 68D304                   push 1235
  3459 00001731 E8ED2C                   call istoken
  3460 00001734 83C402                   add  sp, 2
  3461 00001737 08C0                     or  al, al
  3462 00001739 0F840E00                 je .doreg1167
  3463 0000173D 68[7A18]                 push doreg1_4
  3464 00001740 8D069ED0                 lea  ax, [ops]
  3465 00001744 50                       push ax
  3466 00001745 E81EEA                   call strcpy
  3467 00001748 83C404                   add  sp, 4
  3468                                  
  3469                                  ;-366   if (istoken(T_LESSLESS))   strcpy(ops, "shl");
  3470                                  
  3471                                  .doreg1167:
  3472 0000174B 68D804                   push 1240
  3473 0000174E E8D02C                   call istoken
  3474 00001751 83C402                   add  sp, 2
  3475 00001754 08C0                     or  al, al
  3476 00001756 0F840E00                 je .doreg1168
  3477 0000175A 68[7D18]                 push doreg1_5
  3478 0000175D 8D069ED0                 lea  ax, [ops]
  3479 00001761 50                       push ax
  3480 00001762 E801EA                   call strcpy
  3481 00001765 83C404                   add  sp, 4
  3482                                  
  3483                                  ;-367   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");
  3484                                  
  3485                                  .doreg1168:
  3486 00001768 68D904                   push 1241
  3487 0000176B E8B32C                   call istoken
  3488 0000176E 83C402                   add  sp, 2
  3489 00001771 08C0                     or  al, al
  3490 00001773 0F840E00                 je .doreg1169
  3491 00001777 68[8118]                 push doreg1_6
  3492 0000177A 8D069ED0                 lea  ax, [ops]
  3493 0000177E 50                       push ax
  3494 0000177F E8E4E9                   call strcpy
  3495 00001782 83C404                   add  sp, 4
  3496                                  
  3497                                  ;-368   if (iscmp1 == 1) { token=getlex();
  3498                                  
  3499                                  .doreg1169:
  3500 00001785 8B4604                   mov ax, [bp+4]
  3501 00001788 83F801                   cmp ax, 1
  3502 0000178B 0F852700                 jne .doreg1170
  3503 0000178F E86B25                   call getlex
  3504 00001792 A3[1C00]                 mov word [token], ax
  3505                                  
  3506                                  ;-369       if (isrelational() ==0) error1("Relational expected");
  3507                                  
  3508 00001795 E8FE24                   call isrelational
  3509 00001798 83F800                   cmp ax, 0
  3510 0000179B 0F850900                 jne .doreg1171
  3511 0000179F 68[8518]                 push doreg1_7
  3512 000017A2 E89C30                   call error1
  3513 000017A5 83C402                   add  sp, 2
  3514                                  
  3515                                  ;-370       strcpy(ops, "cmp"); }
  3516                                  
  3517                                  .doreg1171:
  3518 000017A8 68[9918]                 push doreg1_8
  3519 000017AB 8D069ED0                 lea  ax, [ops]
  3520 000017AF 50                       push ax
  3521 000017B0 E8B3E9                   call strcpy
  3522 000017B3 83C404                   add  sp, 4
  3523                                  
  3524                                  ;-371   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");
  3525                                  
  3526                                  .doreg1170:
  3527 000017B6 E88F2D                   call prnl
  3528 000017B9 8D069ED0                 lea  ax, [ops]
  3529 000017BD 50                       push ax
  3530 000017BE E8952D                   call prs
  3531 000017C1 83C402                   add  sp, 2
  3532 000017C4 68[9D18]                 push doreg1_9
  3533 000017C7 E88C2D                   call prs
  3534 000017CA 83C402                   add  sp, 2
  3535 000017CD FF36[BA10]               push word [ireg1]
  3536 000017D1 E8DD04                   call printreg
  3537 000017D4 83C402                   add  sp, 2
  3538 000017D7 68[A018]                 push doreg1_10
  3539 000017DA E8792D                   call prs
  3540 000017DD 83C402                   add  sp, 2
  3541                                  
  3542                                  ;-372 
  3543                                  
  3544                                  
  3545                                  ;-373   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}
  3546                                  
  3547 000017E0 680101                   push 257
  3548 000017E3 E83B2C                   call istoken
  3549 000017E6 83C402                   add  sp, 2
  3550 000017E9 08C0                     or  al, al
  3551 000017EB 0F840D00                 je .doreg1172
  3552 000017EF FF36[2E00]               push word [lexval]
  3553 000017F3 E8BA2E                   call prunsign1
  3554 000017F6 83C402                   add  sp, 2
  3555 000017F9 E94700                   jmp .reg1
  3556                                  
  3557                                  ;-374   mod2=typeName(); ireg2=checkreg();
  3558                                  
  3559                                  .doreg1172:
  3560 000017FC E8C0F2                   call typeName
  3561 000017FF A3[C610]                 mov word [mod2], ax
  3562 00001802 E89E00                   call checkreg
  3563 00001805 A3[C810]                 mov word [ireg2], ax
  3564                                  
  3565                                  ;-375   if (ireg2) {printreg(ireg2); goto reg1;}
  3566                                  
  3567 00001808 A1[C810]                 mov ax, [ireg2]
  3568 0000180B 08C0                     or  al, al
  3569 0000180D 0F840D00                 je .doreg1173
  3570 00001811 FF36[C810]               push word [ireg2]
  3571 00001815 E89904                   call printreg
  3572 00001818 83C402                   add  sp, 2
  3573 0000181B E92500                   jmp .reg1
  3574                                  
  3575                                  ;-376   i=searchname();  if (mod2 == 2) a(i); else v(i);
  3576                                  
  3577                                  .doreg1173:
  3578 0000181E E8CFF1                   call searchname
  3579 00001821 8946FE                   mov [bp-2], ax
  3580 00001824 A1[C610]                 mov ax, [mod2]
  3581 00001827 83F802                   cmp ax, 2
  3582 0000182A 0F850C00                 jne .doreg1174
  3583 0000182E FF76FE                   push word [bp-2]
  3584 00001831 E8C1EB                   call a
  3585 00001834 83C402                   add  sp, 2
  3586 00001837 E90900                   jmp .doreg1175
  3587                                  .doreg1174:
  3588 0000183A FF76FE                   push word [bp-2]
  3589 0000183D E8C4EB                   call v
  3590 00001840 83C402                   add  sp, 2
  3591                                  
  3592                                  ;-377   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }
  3593                                  
  3594                                  .doreg1175:
  3595                                  .reg1:
  3596 00001843 8B4604                   mov ax, [bp+4]
  3597 00001846 83F801                   cmp ax, 1
  3598 00001849 0F851B00                 jne .doreg1176
  3599 0000184D 6A00                     push 0
  3600 0000184F E89121                   call cmpneg
  3601 00001852 83C402                   add  sp, 2
  3602 00001855 8D06AB81                 lea  ax, [fname]
  3603 00001859 50                       push ax
  3604 0000185A E8F92C                   call prs
  3605 0000185D 83C402                   add  sp, 2
  3606 00001860 6A29                     push 41
  3607 00001862 E8DE2B                   call expect
  3608 00001865 83C402                   add  sp, 2
  3609                                  
  3610                                  ;-378 }
  3611                                  
  3612                                  .doreg1176:
  3613                                  
  3614                                  ;-379 int checkreg() { // >=17 = 16bit, >=47 = 32bit
  3615 00001868 C9                       LEAVE
  3616 00001869 C3                       ret
  3617                                  ; ENDP
  3618 0000186A 6D6F7600                doreg1_0 db "mov",0
  3619 0000186E 61646400                doreg1_1 db "add",0
  3620 00001872 73756200                doreg1_2 db "sub",0
  3621 00001876 616E6400                doreg1_3 db "and",0
  3622 0000187A 6F7200                  doreg1_4 db "or",0
  3623 0000187D 73686C00                doreg1_5 db "shl",0
  3624 00001881 73687200                doreg1_6 db "shr",0
  3625 00001885 52656C6174696F6E61-     doreg1_7 db "Relational expected",0
  3626 0000188E 6C2065787065637465-
  3627 00001897 6400               
  3628 00001899 636D7000                doreg1_8 db "cmp",0
  3629 0000189D 202000                  doreg1_9 db "  ",0
  3630 000018A0 2C2000                  doreg1_10 db ", ",0
  3631                                  
  3632                                  checkreg:  ; *** PROC ***
  3633                                  
  3634                                  ;-380   if (strlen(symbol) <  2) return 0;
  3635                                  
  3636 000018A3 8D062B81                 lea  ax, [symbol]
  3637 000018A7 50                       push ax
  3638 000018A8 E893E8                   call strlen
  3639 000018AB 83C402                   add  sp, 2
  3640 000018AE 83F802                   cmp ax, 2
  3641 000018B1 0F8D0600                 jge .checkreg177
  3642 000018B5 B80000                   mov ax, 0
  3643 000018B8 E94403                   jmp .retn
  3644                                  
  3645                                  ;-381   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;
  3646                                  
  3647                                  .checkreg177:
  3648 000018BB 68[001C]                 push checkreg_0
  3649 000018BE 8D062B81                 lea  ax, [symbol]
  3650 000018C2 50                       push ax
  3651 000018C3 E8D0E8                   call eqstr
  3652 000018C6 83C404                   add  sp, 4
  3653 000018C9 08C0                     or  al, al
  3654 000018CB 0F840600                 je .checkreg178
  3655 000018CF B80100                   mov ax, 1
  3656 000018D2 E92A03                   jmp .retn
  3657                                  .checkreg178:
  3658 000018D5 68[031C]                 push checkreg_1
  3659 000018D8 8D062B81                 lea  ax, [symbol]
  3660 000018DC 50                       push ax
  3661 000018DD E8B6E8                   call eqstr
  3662 000018E0 83C404                   add  sp, 4
  3663 000018E3 08C0                     or  al, al
  3664 000018E5 0F840600                 je .checkreg179
  3665 000018E9 B80300                   mov ax, 3
  3666 000018EC E91003                   jmp .retn
  3667                                  
  3668                                  ;-382   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;
  3669                                  
  3670                                  .checkreg179:
  3671 000018EF 68[061C]                 push checkreg_2
  3672 000018F2 8D062B81                 lea  ax, [symbol]
  3673 000018F6 50                       push ax
  3674 000018F7 E89CE8                   call eqstr
  3675 000018FA 83C404                   add  sp, 4
  3676 000018FD 08C0                     or  al, al
  3677 000018FF 0F840600                 je .checkreg180
  3678 00001903 B80500                   mov ax, 5
  3679 00001906 E9F602                   jmp .retn
  3680                                  .checkreg180:
  3681 00001909 68[091C]                 push checkreg_3
  3682 0000190C 8D062B81                 lea  ax, [symbol]
  3683 00001910 50                       push ax
  3684 00001911 E882E8                   call eqstr
  3685 00001914 83C404                   add  sp, 4
  3686 00001917 08C0                     or  al, al
  3687 00001919 0F840600                 je .checkreg181
  3688 0000191D B80700                   mov ax, 7
  3689 00001920 E9DC02                   jmp .retn
  3690                                  
  3691                                  ;-383   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;
  3692                                  
  3693                                  .checkreg181:
  3694 00001923 68[0C1C]                 push checkreg_4
  3695 00001926 8D062B81                 lea  ax, [symbol]
  3696 0000192A 50                       push ax
  3697 0000192B E868E8                   call eqstr
  3698 0000192E 83C404                   add  sp, 4
  3699 00001931 08C0                     or  al, al
  3700 00001933 0F840600                 je .checkreg182
  3701 00001937 B80900                   mov ax, 9
  3702 0000193A E9C202                   jmp .retn
  3703                                  .checkreg182:
  3704 0000193D 68[0F1C]                 push checkreg_5
  3705 00001940 8D062B81                 lea  ax, [symbol]
  3706 00001944 50                       push ax
  3707 00001945 E84EE8                   call eqstr
  3708 00001948 83C404                   add  sp, 4
  3709 0000194B 08C0                     or  al, al
  3710 0000194D 0F840600                 je .checkreg183
  3711 00001951 B80B00                   mov ax, 11
  3712 00001954 E9A802                   jmp .retn
  3713                                  
  3714                                  ;-384   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;
  3715                                  
  3716                                  .checkreg183:
  3717 00001957 68[121C]                 push checkreg_6
  3718 0000195A 8D062B81                 lea  ax, [symbol]
  3719 0000195E 50                       push ax
  3720 0000195F E834E8                   call eqstr
  3721 00001962 83C404                   add  sp, 4
  3722 00001965 08C0                     or  al, al
  3723 00001967 0F840600                 je .checkreg184
  3724 0000196B B80D00                   mov ax, 13
  3725 0000196E E98E02                   jmp .retn
  3726                                  .checkreg184:
  3727 00001971 68[151C]                 push checkreg_7
  3728 00001974 8D062B81                 lea  ax, [symbol]
  3729 00001978 50                       push ax
  3730 00001979 E81AE8                   call eqstr
  3731 0000197C 83C404                   add  sp, 4
  3732 0000197F 08C0                     or  al, al
  3733 00001981 0F840600                 je .checkreg185
  3734 00001985 B80F00                   mov ax, 15
  3735 00001988 E97402                   jmp .retn
  3736                                  
  3737                                  ;-385   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;
  3738                                  
  3739                                  .checkreg185:
  3740 0000198B 68[181C]                 push checkreg_8
  3741 0000198E 8D062B81                 lea  ax, [symbol]
  3742 00001992 50                       push ax
  3743 00001993 E800E8                   call eqstr
  3744 00001996 83C404                   add  sp, 4
  3745 00001999 08C0                     or  al, al
  3746 0000199B 0F840600                 je .checkreg186
  3747 0000199F B81100                   mov ax, 17
  3748 000019A2 E95A02                   jmp .retn
  3749                                  .checkreg186:
  3750 000019A5 68[1B1C]                 push checkreg_9
  3751 000019A8 8D062B81                 lea  ax, [symbol]
  3752 000019AC 50                       push ax
  3753 000019AD E8E6E7                   call eqstr
  3754 000019B0 83C404                   add  sp, 4
  3755 000019B3 08C0                     or  al, al
  3756 000019B5 0F840600                 je .checkreg187
  3757 000019B9 B81300                   mov ax, 19
  3758 000019BC E94002                   jmp .retn
  3759                                  
  3760                                  ;-386   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;
  3761                                  
  3762                                  .checkreg187:
  3763 000019BF 68[1E1C]                 push checkreg_10
  3764 000019C2 8D062B81                 lea  ax, [symbol]
  3765 000019C6 50                       push ax
  3766 000019C7 E8CCE7                   call eqstr
  3767 000019CA 83C404                   add  sp, 4
  3768 000019CD 08C0                     or  al, al
  3769 000019CF 0F840600                 je .checkreg188
  3770 000019D3 B81500                   mov ax, 21
  3771 000019D6 E92602                   jmp .retn
  3772                                  .checkreg188:
  3773 000019D9 68[211C]                 push checkreg_11
  3774 000019DC 8D062B81                 lea  ax, [symbol]
  3775 000019E0 50                       push ax
  3776 000019E1 E8B2E7                   call eqstr
  3777 000019E4 83C404                   add  sp, 4
  3778 000019E7 08C0                     or  al, al
  3779 000019E9 0F840600                 je .checkreg189
  3780 000019ED B81700                   mov ax, 23
  3781 000019F0 E90C02                   jmp .retn
  3782                                  
  3783                                  ;-387   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;
  3784                                  
  3785                                  .checkreg189:
  3786 000019F3 68[241C]                 push checkreg_12
  3787 000019F6 8D062B81                 lea  ax, [symbol]
  3788 000019FA 50                       push ax
  3789 000019FB E898E7                   call eqstr
  3790 000019FE 83C404                   add  sp, 4
  3791 00001A01 08C0                     or  al, al
  3792 00001A03 0F840600                 je .checkreg190
  3793 00001A07 B81900                   mov ax, 25
  3794 00001A0A E9F201                   jmp .retn
  3795                                  .checkreg190:
  3796 00001A0D 68[271C]                 push checkreg_13
  3797 00001A10 8D062B81                 lea  ax, [symbol]
  3798 00001A14 50                       push ax
  3799 00001A15 E87EE7                   call eqstr
  3800 00001A18 83C404                   add  sp, 4
  3801 00001A1B 08C0                     or  al, al
  3802 00001A1D 0F840600                 je .checkreg191
  3803 00001A21 B81B00                   mov ax, 27
  3804 00001A24 E9D801                   jmp .retn
  3805                                  
  3806                                  ;-388   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;
  3807                                  
  3808                                  .checkreg191:
  3809 00001A27 68[2A1C]                 push checkreg_14
  3810 00001A2A 8D062B81                 lea  ax, [symbol]
  3811 00001A2E 50                       push ax
  3812 00001A2F E864E7                   call eqstr
  3813 00001A32 83C404                   add  sp, 4
  3814 00001A35 08C0                     or  al, al
  3815 00001A37 0F840600                 je .checkreg192
  3816 00001A3B B81D00                   mov ax, 29
  3817 00001A3E E9BE01                   jmp .retn
  3818                                  .checkreg192:
  3819 00001A41 68[2D1C]                 push checkreg_15
  3820 00001A44 8D062B81                 lea  ax, [symbol]
  3821 00001A48 50                       push ax
  3822 00001A49 E84AE7                   call eqstr
  3823 00001A4C 83C404                   add  sp, 4
  3824 00001A4F 08C0                     or  al, al
  3825 00001A51 0F840600                 je .checkreg193
  3826 00001A55 B81F00                   mov ax, 31
  3827 00001A58 E9A401                   jmp .retn
  3828                                  
  3829                                  ;-389   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;
  3830                                  
  3831                                  .checkreg193:
  3832 00001A5B 68[301C]                 push checkreg_16
  3833 00001A5E 8D062B81                 lea  ax, [symbol]
  3834 00001A62 50                       push ax
  3835 00001A63 E830E7                   call eqstr
  3836 00001A66 83C404                   add  sp, 4
  3837 00001A69 08C0                     or  al, al
  3838 00001A6B 0F840600                 je .checkreg194
  3839 00001A6F B82100                   mov ax, 33
  3840 00001A72 E98A01                   jmp .retn
  3841                                  .checkreg194:
  3842 00001A75 68[331C]                 push checkreg_17
  3843 00001A78 8D062B81                 lea  ax, [symbol]
  3844 00001A7C 50                       push ax
  3845 00001A7D E816E7                   call eqstr
  3846 00001A80 83C404                   add  sp, 4
  3847 00001A83 08C0                     or  al, al
  3848 00001A85 0F840600                 je .checkreg195
  3849 00001A89 B82300                   mov ax, 35
  3850 00001A8C E97001                   jmp .retn
  3851                                  
  3852                                  ;-390   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;
  3853                                  
  3854                                  .checkreg195:
  3855 00001A8F 68[361C]                 push checkreg_18
  3856 00001A92 8D062B81                 lea  ax, [symbol]
  3857 00001A96 50                       push ax
  3858 00001A97 E8FCE6                   call eqstr
  3859 00001A9A 83C404                   add  sp, 4
  3860 00001A9D 08C0                     or  al, al
  3861 00001A9F 0F840600                 je .checkreg196
  3862 00001AA3 B82500                   mov ax, 37
  3863 00001AA6 E95601                   jmp .retn
  3864                                  .checkreg196:
  3865 00001AA9 68[391C]                 push checkreg_19
  3866 00001AAC 8D062B81                 lea  ax, [symbol]
  3867 00001AB0 50                       push ax
  3868 00001AB1 E8E2E6                   call eqstr
  3869 00001AB4 83C404                   add  sp, 4
  3870 00001AB7 08C0                     or  al, al
  3871 00001AB9 0F840600                 je .checkreg197
  3872 00001ABD B82700                   mov ax, 39
  3873 00001AC0 E93C01                   jmp .retn
  3874                                  
  3875                                  ;-391   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;
  3876                                  
  3877                                  .checkreg197:
  3878 00001AC3 68[3C1C]                 push checkreg_20
  3879 00001AC6 8D062B81                 lea  ax, [symbol]
  3880 00001ACA 50                       push ax
  3881 00001ACB E8C8E6                   call eqstr
  3882 00001ACE 83C404                   add  sp, 4
  3883 00001AD1 08C0                     or  al, al
  3884 00001AD3 0F840600                 je .checkreg198
  3885 00001AD7 B82900                   mov ax, 41
  3886 00001ADA E92201                   jmp .retn
  3887                                  .checkreg198:
  3888 00001ADD 68[3F1C]                 push checkreg_21
  3889 00001AE0 8D062B81                 lea  ax, [symbol]
  3890 00001AE4 50                       push ax
  3891 00001AE5 E8AEE6                   call eqstr
  3892 00001AE8 83C404                   add  sp, 4
  3893 00001AEB 08C0                     or  al, al
  3894 00001AED 0F840600                 je .checkreg199
  3895 00001AF1 B82B00                   mov ax, 43
  3896 00001AF4 E90801                   jmp .retn
  3897                                  
  3898                                  ;-392   // (eqstr(symbol,"ip")) return 45;
  3899                                  
  3900                                  
  3901                                  ;-393   if (strlen(symbol) >   3) return 0;
  3902                                  
  3903                                  .checkreg199:
  3904 00001AF7 8D062B81                 lea  ax, [symbol]
  3905 00001AFB 50                       push ax
  3906 00001AFC E83FE6                   call strlen
  3907 00001AFF 83C402                   add  sp, 2
  3908 00001B02 83F803                   cmp ax, 3
  3909 00001B05 0F8E0600                 jle .checkreg200
  3910 00001B09 B80000                   mov ax, 0
  3911 00001B0C E9F000                   jmp .retn
  3912                                  
  3913                                  ;-394   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;
  3914                                  
  3915                                  .checkreg200:
  3916 00001B0F 68[421C]                 push checkreg_22
  3917 00001B12 8D062B81                 lea  ax, [symbol]
  3918 00001B16 50                       push ax
  3919 00001B17 E87CE6                   call eqstr
  3920 00001B1A 83C404                   add  sp, 4
  3921 00001B1D 08C0                     or  al, al
  3922 00001B1F 0F840600                 je .checkreg201
  3923 00001B23 B82F00                   mov ax, 47
  3924 00001B26 E9D600                   jmp .retn
  3925                                  .checkreg201:
  3926 00001B29 68[461C]                 push checkreg_23
  3927 00001B2C 8D062B81                 lea  ax, [symbol]
  3928 00001B30 50                       push ax
  3929 00001B31 E862E6                   call eqstr
  3930 00001B34 83C404                   add  sp, 4
  3931 00001B37 08C0                     or  al, al
  3932 00001B39 0F840600                 je .checkreg202
  3933 00001B3D B83200                   mov ax, 50
  3934 00001B40 E9BC00                   jmp .retn
  3935                                  
  3936                                  ;-395   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;
  3937                                  
  3938                                  .checkreg202:
  3939 00001B43 68[4A1C]                 push checkreg_24
  3940 00001B46 8D062B81                 lea  ax, [symbol]
  3941 00001B4A 50                       push ax
  3942 00001B4B E848E6                   call eqstr
  3943 00001B4E 83C404                   add  sp, 4
  3944 00001B51 08C0                     or  al, al
  3945 00001B53 0F840600                 je .checkreg203
  3946 00001B57 B83500                   mov ax, 53
  3947 00001B5A E9A200                   jmp .retn
  3948                                  .checkreg203:
  3949 00001B5D 68[4E1C]                 push checkreg_25
  3950 00001B60 8D062B81                 lea  ax, [symbol]
  3951 00001B64 50                       push ax
  3952 00001B65 E82EE6                   call eqstr
  3953 00001B68 83C404                   add  sp, 4
  3954 00001B6B 08C0                     or  al, al
  3955 00001B6D 0F840600                 je .checkreg204
  3956 00001B71 B83800                   mov ax, 56
  3957 00001B74 E98800                   jmp .retn
  3958                                  
  3959                                  ;-396   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;
  3960                                  
  3961                                  .checkreg204:
  3962 00001B77 68[521C]                 push checkreg_26
  3963 00001B7A 8D062B81                 lea  ax, [symbol]
  3964 00001B7E 50                       push ax
  3965 00001B7F E814E6                   call eqstr
  3966 00001B82 83C404                   add  sp, 4
  3967 00001B85 08C0                     or  al, al
  3968 00001B87 0F840600                 je .checkreg205
  3969 00001B8B B83B00                   mov ax, 59
  3970 00001B8E E96E00                   jmp .retn
  3971                                  .checkreg205:
  3972 00001B91 68[561C]                 push checkreg_27
  3973 00001B94 8D062B81                 lea  ax, [symbol]
  3974 00001B98 50                       push ax
  3975 00001B99 E8FAE5                   call eqstr
  3976 00001B9C 83C404                   add  sp, 4
  3977 00001B9F 08C0                     or  al, al
  3978 00001BA1 0F840600                 je .checkreg206
  3979 00001BA5 B83E00                   mov ax, 62
  3980 00001BA8 E95400                   jmp .retn
  3981                                  
  3982                                  ;-397   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;
  3983                                  
  3984                                  .checkreg206:
  3985 00001BAB 68[5A1C]                 push checkreg_28
  3986 00001BAE 8D062B81                 lea  ax, [symbol]
  3987 00001BB2 50                       push ax
  3988 00001BB3 E8E0E5                   call eqstr
  3989 00001BB6 83C404                   add  sp, 4
  3990 00001BB9 08C0                     or  al, al
  3991 00001BBB 0F840600                 je .checkreg207
  3992 00001BBF B84100                   mov ax, 65
  3993 00001BC2 E93A00                   jmp .retn
  3994                                  .checkreg207:
  3995 00001BC5 68[5E1C]                 push checkreg_29
  3996 00001BC8 8D062B81                 lea  ax, [symbol]
  3997 00001BCC 50                       push ax
  3998 00001BCD E8C6E5                   call eqstr
  3999 00001BD0 83C404                   add  sp, 4
  4000 00001BD3 08C0                     or  al, al
  4001 00001BD5 0F840600                 je .checkreg208
  4002 00001BD9 B84400                   mov ax, 68
  4003 00001BDC E92000                   jmp .retn
  4004                                  
  4005                                  ;-398   if (eqstr(symbol,"cr0")) return 71;
  4006                                  
  4007                                  .checkreg208:
  4008 00001BDF 68[621C]                 push checkreg_30
  4009 00001BE2 8D062B81                 lea  ax, [symbol]
  4010 00001BE6 50                       push ax
  4011 00001BE7 E8ACE5                   call eqstr
  4012 00001BEA 83C404                   add  sp, 4
  4013 00001BED 08C0                     or  al, al
  4014 00001BEF 0F840600                 je .checkreg209
  4015 00001BF3 B84700                   mov ax, 71
  4016 00001BF6 E90600                   jmp .retn
  4017                                  
  4018                                  ;-399   return 0;   }
  4019                                  
  4020                                  .checkreg209:
  4021 00001BF9 B80000                   mov ax, 0
  4022 00001BFC E90000                   jmp .retn
  4023                                  
  4024                                  ;-400 char printregstr[]
  4025                                  
  4026                                   .retn:
  4027 00001BFF C3                       ret
  4028                                  ; ENDP
  4029 00001C00 616C00                  checkreg_0 db "al",0
  4030 00001C03 636C00                  checkreg_1 db "cl",0
  4031 00001C06 646C00                  checkreg_2 db "dl",0
  4032 00001C09 626C00                  checkreg_3 db "bl",0
  4033 00001C0C 616800                  checkreg_4 db "ah",0
  4034 00001C0F 636800                  checkreg_5 db "ch",0
  4035 00001C12 646800                  checkreg_6 db "dh",0
  4036 00001C15 626800                  checkreg_7 db "bh",0
  4037 00001C18 617800                  checkreg_8 db "ax",0
  4038 00001C1B 637800                  checkreg_9 db "cx",0
  4039 00001C1E 647800                  checkreg_10 db "dx",0
  4040 00001C21 627800                  checkreg_11 db "bx",0
  4041 00001C24 737000                  checkreg_12 db "sp",0
  4042 00001C27 627000                  checkreg_13 db "bp",0
  4043 00001C2A 736900                  checkreg_14 db "si",0
  4044 00001C2D 646900                  checkreg_15 db "di",0
  4045 00001C30 657300                  checkreg_16 db "es",0
  4046 00001C33 637300                  checkreg_17 db "cs",0
  4047 00001C36 737300                  checkreg_18 db "ss",0
  4048 00001C39 647300                  checkreg_19 db "ds",0
  4049 00001C3C 667300                  checkreg_20 db "fs",0
  4050 00001C3F 677300                  checkreg_21 db "gs",0
  4051 00001C42 65617800                checkreg_22 db "eax",0
  4052 00001C46 65637800                checkreg_23 db "ecx",0
  4053 00001C4A 65647800                checkreg_24 db "edx",0
  4054 00001C4E 65627800                checkreg_25 db "ebx",0
  4055 00001C52 65737000                checkreg_26 db "esp",0
  4056 00001C56 65627000                checkreg_27 db "ebp",0
  4057 00001C5A 65736900                checkreg_28 db "esi",0
  4058 00001C5E 65646900                checkreg_29 db "edi",0
  4059 00001C62 63723000                checkreg_30 db "cr0",0
  4060                                  
  4061                                  ;-401 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";
  4062                                  
  4063 00001C66 2A616C636C646C626C-     printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0
  4064 00001C6F 616863686468626861-
  4065 00001C78 786378647862787370-
  4066 00001C81 627073696469657363-
  4067 00001C8A 737373647366736773-
  4068 00001C93 697065617865637865-
  4069 00001C9C 647865627865737065-
  4070 00001CA5 627065736965646963-
  4071 00001CAE 723000             
  4072                                  
  4073                                  ;-402 //          1         2         3         4         5         6         7
  4074                                  
  4075                                  
  4076                                  ;-403 // 1 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3
  4077                                  
  4078                                  
  4079                                  ;-404 int printreg(int i) {  unsigned int k; unsigned char c;
  4080                                  
  4081                                  
  4082                                  printreg:  ; *** PROC ***
  4083                                  
  4084                                  ;-405   k = &printregstr + i; c=*k; prc(c); i++;
  4085                                  
  4086                                  ;Function : printreg, Number of local variables: 3
  4087                                  ;   # type sign width addr used name   list of local variables
  4088                                  ;  200 var sign word   404 NULL i = bp+4
  4089                                  ;  201 var unsg word   404 NULL k = bp-2
  4090                                  ;  202 var unsg byte   404 NULL c = bp-4;
  4091 00001CB1 C8040000                 ENTER  4,0
  4092 00001CB5 B8[661C]                 mov ax, printregstr
  4093 00001CB8 034604                   add ax, [bp+4]
  4094 00001CBB 8946FE                   mov [bp-2], ax
  4095 00001CBE 8B5EFE                   mov bx, [bp-2]
  4096 00001CC1 8B07                     mov ax, [bx]
  4097 00001CC3 8846FC                   mov [bp-4], al
  4098 00001CC6 8A46FC                   mov al, byte [bp-4]
  4099 00001CC9 B400                     mov ah, 0
  4100 00001CCB 50                       push ax
  4101 00001CCC E82028                   call prc
  4102 00001CCF 83C402                   add  sp, 2
  4103 00001CD2 FF4604                   inc  word[bp+4]
  4104                                  
  4105                                  ;-406   k = &printregstr + i; c=*k; prc(c);
  4106                                  
  4107 00001CD5 B8[661C]                 mov ax, printregstr
  4108 00001CD8 034604                   add ax, [bp+4]
  4109 00001CDB 8946FE                   mov [bp-2], ax
  4110 00001CDE 8B5EFE                   mov bx, [bp-2]
  4111 00001CE1 8B07                     mov ax, [bx]
  4112 00001CE3 8846FC                   mov [bp-4], al
  4113 00001CE6 8A46FC                   mov al, byte [bp-4]
  4114 00001CE9 B400                     mov ah, 0
  4115 00001CEB 50                       push ax
  4116 00001CEC E80028                   call prc
  4117 00001CEF 83C402                   add  sp, 2
  4118                                  
  4119                                  ;-407   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }
  4120                                  
  4121 00001CF2 8B4604                   mov ax, [bp+4]
  4122 00001CF5 83F82F                   cmp ax, 47
  4123 00001CF8 0F8E2000                 jle .printreg210
  4124 00001CFC FF4604                   inc  word[bp+4]
  4125 00001CFF B8[661C]                 mov ax, printregstr
  4126 00001D02 034604                   add ax, [bp+4]
  4127 00001D05 8946FE                   mov [bp-2], ax
  4128 00001D08 8B5EFE                   mov bx, [bp-2]
  4129 00001D0B 8B07                     mov ax, [bx]
  4130 00001D0D 8846FC                   mov [bp-4], al
  4131 00001D10 8A46FC                   mov al, byte [bp-4]
  4132 00001D13 B400                     mov ah, 0
  4133 00001D15 50                       push ax
  4134 00001D16 E8D627                   call prc
  4135 00001D19 83C402                   add  sp, 2
  4136                                  
  4137                                  ;-408 }
  4138                                  
  4139                                  .printreg210:
  4140                                  
  4141                                  ;-409 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
  4142 00001D1C C9                       LEAVE
  4143 00001D1D C3                       ret
  4144                                  ; ENDP
  4145 00001D1E 0000                    evalue dw 0
  4146 00001D20 0A00                    exprtype dw 10
  4147                                  
  4148                                  ;-410 int expr(int isRight)
  4149                                  
  4150                                  
  4151                                  expr:  ; *** PROC ***
  4152                                  
  4153                                  ;-411 { int mode; int id1;     int ixarr; int ixconst;
  4154                                  
  4155                                  
  4156                                  ;-412   int ids;  int isCONST; int i;     unsigned char *p;
  4157                                  
  4158                                  
  4159                                  ;-413   if (istoken(T_CONST)) { evalue=lexval;
  4160                                  
  4161                                  ;Function : expr, Number of local variables: 9
  4162                                  ;   # type sign width addr used name   list of local variables
  4163                                  ;  200 var sign word   410 NULL isRight = bp+4
  4164                                  ;  201 var sign word   411 NULL mode = bp-2
  4165                                  ;  202 var sign word   411 NULL id1 = bp-4
  4166                                  ;  203 var sign word   411 NULL ixarr = bp-6
  4167                                  ;  204 var sign word   411 NULL ixconst = bp-8
  4168                                  ;  205 var sign word   412 NULL ids = bp-10
  4169                                  ;  206 var sign word   412 NULL isCONST = bp-12
  4170                                  ;  207 var sign word   412 NULL i = bp-14
  4171                                  ;  208 ptr unsg byte   412 NULL p = bp-16;
  4172 00001D22 C8100000                 ENTER  16,0
  4173 00001D26 680101                   push 257
  4174 00001D29 E8F526                   call istoken
  4175 00001D2C 83C402                   add  sp, 2
  4176 00001D2F 08C0                     or  al, al
  4177 00001D31 0F841F00                 je .expr211
  4178 00001D35 A1[2E00]                 mov ax, [lexval]
  4179 00001D38 A3[1E1D]                 mov word [evalue], ax
  4180                                  
  4181                                  ;-414     prs("\n mov ax, "); prunsign1(lexval); return 4; }
  4182                                  
  4183 00001D3B 68[C220]                 push expr_0
  4184 00001D3E E81528                   call prs
  4185 00001D41 83C402                   add  sp, 2
  4186 00001D44 FF36[2E00]               push word [lexval]
  4187 00001D48 E86529                   call prunsign1
  4188 00001D4B 83C402                   add  sp, 2
  4189 00001D4E B80400                   mov ax, 4
  4190 00001D51 E96C03                   jmp .retn
  4191                                  
  4192                                  ;-415   mode=typeName(); /*0=V,1=*,2=&*/
  4193                                  
  4194                                  .expr211:
  4195 00001D54 E868ED                   call typeName
  4196 00001D57 8946FE                   mov [bp-2], ax
  4197                                  
  4198                                  ;-416   ireg1=checkreg();
  4199                                  
  4200 00001D5A E846FB                   call checkreg
  4201 00001D5D A3[BA10]                 mov word [ireg1], ax
  4202                                  
  4203                                  ;-417   if (ireg1) { doreg1(0); return; }
  4204                                  
  4205 00001D60 A1[BA10]                 mov ax, [ireg1]
  4206 00001D63 08C0                     or  al, al
  4207 00001D65 0F840B00                 je .expr212
  4208 00001D69 6A00                     push 0
  4209 00001D6B E849F9                   call doreg1
  4210 00001D6E 83C402                   add  sp, 2
  4211 00001D71 E94C03                   jmp .retn
  4212                                  
  4213                                  ;-418   if (token=='(')  {docall1(); goto e1; }
  4214                                  
  4215                                  .expr212:
  4216 00001D74 A1[1C00]                 mov ax, [token]
  4217 00001D77 83F828                   cmp ax, 40
  4218 00001D7A 0F850600                 jne .expr213
  4219 00001D7E E82E0F                   call docall1
  4220 00001D81 E93202                   jmp .e1
  4221                                  
  4222                                  ;-419   if (isreg()) goto e1;
  4223                                  
  4224                                  .expr213:
  4225 00001D84 E88307                   call isreg
  4226 00001D87 08C0                     or  al, al
  4227 00001D89 0F840300                 je .expr214
  4228 00001D8D E92602                   jmp .e1
  4229                                  
  4230                                  ;-420 
  4231                                  
  4232                                  
  4233                                  ;-421   id1=searchname(); gettypes(id1); ids=signi;
  4234                                  
  4235                                  .expr214:
  4236 00001D90 E85DEC                   call searchname
  4237 00001D93 8946FC                   mov [bp-4], ax
  4238 00001D96 FF76FC                   push word [bp-4]
  4239 00001D99 E816EB                   call gettypes
  4240 00001D9C 83C402                   add  sp, 2
  4241 00001D9F A1[3300]                 mov ax, [signi]
  4242 00001DA2 8946F6                   mov [bp-10], ax
  4243                                  
  4244                                  ;-422   ixarr=0;  ixconst=0;
  4245                                  
  4246 00001DA5 B80000                   mov ax, 0
  4247 00001DA8 8946FA                   mov [bp-6], ax
  4248 00001DAB B80000                   mov ax, 0
  4249 00001DAE 8946F8                   mov [bp-8], ax
  4250                                  
  4251                                  ;-423     if (istoken('[')) { if (istoken(T_CONST)) {
  4252                                  
  4253 00001DB1 6A5B                     push 91
  4254 00001DB3 E86B26                   call istoken
  4255 00001DB6 83C402                   add  sp, 2
  4256 00001DB9 08C0                     or  al, al
  4257 00001DBB 0F845900                 je .expr215
  4258 00001DBF 680101                   push 257
  4259 00001DC2 E85C26                   call istoken
  4260 00001DC5 83C402                   add  sp, 2
  4261 00001DC8 08C0                     or  al, al
  4262 00001DCA 0F841700                 je .expr216
  4263                                  
  4264                                  ;-424       ixconst=1; ixarr=lexval; expect(']');  }
  4265                                  
  4266 00001DCE B80100                   mov ax, 1
  4267 00001DD1 8946F8                   mov [bp-8], ax
  4268 00001DD4 A1[2E00]                 mov ax, [lexval]
  4269 00001DD7 8946FA                   mov [bp-6], ax
  4270 00001DDA 6A5D                     push 93
  4271 00001DDC E86426                   call expect
  4272 00001DDF 83C402                   add  sp, 2
  4273                                  
  4274                                  ;-425     else {ixarr=searchname(); expect(T_NAME); expect(']');
  4275                                  
  4276 00001DE2 E93300                   jmp .expr217
  4277                                  .expr216:
  4278 00001DE5 E808EC                   call searchname
  4279 00001DE8 8946FA                   mov [bp-6], ax
  4280 00001DEB 680001                   push 256
  4281 00001DEE E85226                   call expect
  4282 00001DF1 83C402                   add  sp, 2
  4283 00001DF4 6A5D                     push 93
  4284 00001DF6 E84A26                   call expect
  4285 00001DF9 83C402                   add  sp, 2
  4286                                  
  4287                                  ;-426     gettypes(ixarr);
  4288                                  
  4289 00001DFC FF76FA                   push word [bp-6]
  4290 00001DFF E8B0EA                   call gettypes
  4291 00001E02 83C402                   add  sp, 2
  4292                                  
  4293                                  ;-427     if (widthi != 2) error1("Arrayindex muss Zahl oder int sein"); } }
  4294                                  
  4295 00001E05 A1[3600]                 mov ax, [widthi]
  4296 00001E08 83F802                   cmp ax, 2
  4297 00001E0B 0F840900                 je  .expr218
  4298 00001E0F 68[CE20]                 push expr_1
  4299 00001E12 E82C2A                   call error1
  4300 00001E15 83C402                   add  sp, 2
  4301                                  .expr218:
  4302                                  .expr217:
  4303                                  
  4304                                  ;-428   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Nur var erlaubt");
  4305                                  
  4306                                  .expr215:
  4307 00001E18 68C304                   push 1219
  4308 00001E1B E80326                   call istoken
  4309 00001E1E 83C402                   add  sp, 2
  4310 00001E21 08C0                     or  al, al
  4311 00001E23 0F844600                 je .expr219
  4312 00001E27 8B46FE                   mov ax, [bp-2]
  4313 00001E2A 08C0                     or  al, al
  4314 00001E2C 0F840900                 je .expr220
  4315 00001E30 68[F120]                 push expr_2
  4316 00001E33 E80B2A                   call error1
  4317 00001E36 83C402                   add  sp, 2
  4318                                  
  4319                                  ;-429      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");
  4320                                  
  4321                                  .expr220:
  4322 00001E39 68[0121]                 push expr_3
  4323 00001E3C E81727                   call prs
  4324 00001E3F 83C402                   add  sp, 2
  4325 00001E42 A1[3900]                 mov ax, [wi]
  4326 00001E45 83F802                   cmp ax, 2
  4327 00001E48 0F850C00                 jne .expr221
  4328 00001E4C 68[0A21]                 push expr_4
  4329 00001E4F E80427                   call prs
  4330 00001E52 83C402                   add  sp, 2
  4331 00001E55 E90900                   jmp .expr222
  4332                                  .expr221:
  4333 00001E58 68[0F21]                 push expr_5
  4334 00001E5B E8F826                   call prs
  4335 00001E5E 83C402                   add  sp, 2
  4336                                  
  4337                                  ;-430      v(id1); goto e1;}
  4338                                  
  4339                                  .expr222:
  4340 00001E61 FF76FC                   push word [bp-4]
  4341 00001E64 E89DE5                   call v
  4342 00001E67 83C402                   add  sp, 2
  4343 00001E6A E94901                   jmp .e1
  4344                                  
  4345                                  ;-431   if (istoken(T_MINUSMINUS)) {if(mode)error1("Nur var erlaubt");
  4346                                  
  4347                                  .expr219:
  4348 00001E6D 68C904                   push 1225
  4349 00001E70 E8AE25                   call istoken
  4350 00001E73 83C402                   add  sp, 2
  4351 00001E76 08C0                     or  al, al
  4352 00001E78 0F844600                 je .expr223
  4353 00001E7C 8B46FE                   mov ax, [bp-2]
  4354 00001E7F 08C0                     or  al, al
  4355 00001E81 0F840900                 je .expr224
  4356 00001E85 68[1421]                 push expr_6
  4357 00001E88 E8B629                   call error1
  4358 00001E8B 83C402                   add  sp, 2
  4359                                  
  4360                                  ;-432      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");
  4361                                  
  4362                                  .expr224:
  4363 00001E8E 68[2421]                 push expr_7
  4364 00001E91 E8C226                   call prs
  4365 00001E94 83C402                   add  sp, 2
  4366 00001E97 A1[3900]                 mov ax, [wi]
  4367 00001E9A 83F802                   cmp ax, 2
  4368 00001E9D 0F850C00                 jne .expr225
  4369 00001EA1 68[2D21]                 push expr_8
  4370 00001EA4 E8AF26                   call prs
  4371 00001EA7 83C402                   add  sp, 2
  4372 00001EAA E90900                   jmp .expr226
  4373                                  .expr225:
  4374 00001EAD 68[3221]                 push expr_9
  4375 00001EB0 E8A326                   call prs
  4376 00001EB3 83C402                   add  sp, 2
  4377                                  
  4378                                  ;-433      v(id1); goto e1;}
  4379                                  
  4380                                  .expr226:
  4381 00001EB6 FF76FC                   push word [bp-4]
  4382 00001EB9 E848E5                   call v
  4383 00001EBC 83C402                   add  sp, 2
  4384 00001EBF E9F400                   jmp .e1
  4385                                  
  4386                                  ;-434        
  4387                                  
  4388                                  
  4389                                  ;-435   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}
  4390                                  
  4391                                  .expr223:
  4392 00001EC2 68CE04                   push 1230
  4393 00001EC5 E85925                   call istoken
  4394 00001EC8 83C402                   add  sp, 2
  4395 00001ECB 08C0                     or  al, al
  4396 00001ECD 0F841200                 je .expr227
  4397 00001ED1 FF76FC                   push word [bp-4]
  4398 00001ED4 FF76FE                   push word [bp-2]
  4399 00001ED7 68[3721]                 push expr_10
  4400 00001EDA E8A802                   call compoundass
  4401 00001EDD 83C406                   add  sp, 6
  4402 00001EE0 E9D300                   jmp .e1
  4403                                  
  4404                                  ;-436   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}
  4405                                  
  4406                                  .expr227:
  4407 00001EE3 68CF04                   push 1231
  4408 00001EE6 E83825                   call istoken
  4409 00001EE9 83C402                   add  sp, 2
  4410 00001EEC 08C0                     or  al, al
  4411 00001EEE 0F841200                 je .expr228
  4412 00001EF2 FF76FC                   push word [bp-4]
  4413 00001EF5 FF76FE                   push word [bp-2]
  4414 00001EF8 68[3B21]                 push expr_11
  4415 00001EFB E88702                   call compoundass
  4416 00001EFE 83C406                   add  sp, 6
  4417 00001F01 E9B200                   jmp .e1
  4418                                  
  4419                                  ;-437   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}
  4420                                  
  4421                                  .expr228:
  4422 00001F04 68D204                   push 1234
  4423 00001F07 E81725                   call istoken
  4424 00001F0A 83C402                   add  sp, 2
  4425 00001F0D 08C0                     or  al, al
  4426 00001F0F 0F841200                 je .expr229
  4427 00001F13 FF76FC                   push word [bp-4]
  4428 00001F16 FF76FE                   push word [bp-2]
  4429 00001F19 68[3F21]                 push expr_12
  4430 00001F1C E86602                   call compoundass
  4431 00001F1F 83C406                   add  sp, 6
  4432 00001F22 E99100                   jmp .e1
  4433                                  
  4434                                  ;-438   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}    
  4435                                  
  4436                                  .expr229:
  4437 00001F25 68D304                   push 1235
  4438 00001F28 E8F624                   call istoken
  4439 00001F2B 83C402                   add  sp, 2
  4440 00001F2E 08C0                     or  al, al
  4441 00001F30 0F841200                 je .expr230
  4442 00001F34 FF76FC                   push word [bp-4]
  4443 00001F37 FF76FE                   push word [bp-2]
  4444 00001F3A 68[4321]                 push expr_13
  4445 00001F3D E84502                   call compoundass
  4446 00001F40 83C406                   add  sp, 6
  4447 00001F43 E97000                   jmp .e1
  4448                                  
  4449                                  ;-439   if (istoken(T_MULASS    )) {error1("not implemented");}
  4450                                  
  4451                                  .expr230:
  4452 00001F46 68D004                   push 1232
  4453 00001F49 E8D524                   call istoken
  4454 00001F4C 83C402                   add  sp, 2
  4455 00001F4F 08C0                     or  al, al
  4456 00001F51 0F840900                 je .expr231
  4457 00001F55 68[4621]                 push expr_14
  4458 00001F58 E8E628                   call error1
  4459 00001F5B 83C402                   add  sp, 2
  4460                                  
  4461                                  ;-440   if (istoken(T_DIVASS    )) {error1("not implemented");}
  4462                                  
  4463                                  .expr231:
  4464 00001F5E 68D104                   push 1233
  4465 00001F61 E8BD24                   call istoken
  4466 00001F64 83C402                   add  sp, 2
  4467 00001F67 08C0                     or  al, al
  4468 00001F69 0F840900                 je .expr232
  4469 00001F6D 68[5621]                 push expr_15
  4470 00001F70 E8CE28                   call error1
  4471 00001F73 83C402                   add  sp, 2
  4472                                  
  4473                                  ;-441 
  4474                                  
  4475                                  
  4476                                  ;-442   if (istoken('=')) { exprtype= expr(1); 
  4477                                  
  4478                                  .expr232:
  4479 00001F76 6A3D                     push 61
  4480 00001F78 E8A624                   call istoken
  4481 00001F7B 83C402                   add  sp, 2
  4482 00001F7E 08C0                     or  al, al
  4483 00001F80 0F842000                 je .expr233
  4484 00001F84 6A01                     push 1
  4485 00001F86 E899FD                   call expr
  4486 00001F89 83C402                   add  sp, 2
  4487 00001F8C A3[201D]                 mov word [exprtype], ax
  4488                                  
  4489                                  ;-443   doassign(mode, id1, ixarr, ixconst); goto e1;  }
  4490                                  
  4491 00001F8F FF76F8                   push word [bp-8]
  4492 00001F92 FF76FA                   push word [bp-6]
  4493 00001F95 FF76FC                   push word [bp-4]
  4494 00001F98 FF76FE                   push word [bp-2]
  4495 00001F9B E85E08                   call doassign
  4496 00001F9E 83C408                   add  sp, 8
  4497 00001FA1 E91200                   jmp .e1
  4498                                  
  4499                                  ;-444   dovar1(mode, "mov", ixarr, id1);
  4500                                  
  4501                                  .expr233:
  4502 00001FA4 FF76FC                   push word [bp-4]
  4503 00001FA7 FF76FA                   push word [bp-6]
  4504 00001FAA 68[6621]                 push expr_16
  4505 00001FAD FF76FE                   push word [bp-2]
  4506 00001FB0 E87402                   call dovar1
  4507 00001FB3 83C408                   add  sp, 8
  4508                                  
  4509                                  ;-445   
  4510                                  
  4511                                  
  4512                                  ;-446 e1:    if (istoken('+')) rterm("add");
  4513                                  
  4514                                  .e1:
  4515 00001FB6 6A2B                     push 43
  4516 00001FB8 E86624                   call istoken
  4517 00001FBB 83C402                   add  sp, 2
  4518 00001FBE 08C0                     or  al, al
  4519 00001FC0 0F840C00                 je .expr234
  4520 00001FC4 68[6A21]                 push expr_17
  4521 00001FC7 E82704                   call rterm
  4522 00001FCA 83C402                   add  sp, 2
  4523                                  
  4524                                  ;-447   else if (istoken('-')) rterm("sub" );
  4525                                  
  4526 00001FCD E9CF00                   jmp .expr235
  4527                                  .expr234:
  4528 00001FD0 6A2D                     push 45
  4529 00001FD2 E84C24                   call istoken
  4530 00001FD5 83C402                   add  sp, 2
  4531 00001FD8 08C0                     or  al, al
  4532 00001FDA 0F840C00                 je .expr236
  4533 00001FDE 68[6E21]                 push expr_18
  4534 00001FE1 E80D04                   call rterm
  4535 00001FE4 83C402                   add  sp, 2
  4536                                  
  4537                                  ;-448   else if (istoken('&')) rterm("and" );
  4538                                  
  4539 00001FE7 E9B500                   jmp .expr237
  4540                                  .expr236:
  4541 00001FEA 6A26                     push 38
  4542 00001FEC E83224                   call istoken
  4543 00001FEF 83C402                   add  sp, 2
  4544 00001FF2 08C0                     or  al, al
  4545 00001FF4 0F840C00                 je .expr238
  4546 00001FF8 68[7221]                 push expr_19
  4547 00001FFB E8F303                   call rterm
  4548 00001FFE 83C402                   add  sp, 2
  4549                                  
  4550                                  ;-449   else if (istoken('|')) rterm("or" );  
  4551                                  
  4552 00002001 E99B00                   jmp .expr239
  4553                                  .expr238:
  4554 00002004 6A7C                     push 124
  4555 00002006 E81824                   call istoken
  4556 00002009 83C402                   add  sp, 2
  4557 0000200C 08C0                     or  al, al
  4558 0000200E 0F840C00                 je .expr240
  4559 00002012 68[7621]                 push expr_20
  4560 00002015 E8D903                   call rterm
  4561 00002018 83C402                   add  sp, 2
  4562                                  
  4563                                  ;-450   else if (istoken(T_LESSLESS)) rterm("shl");
  4564                                  
  4565 0000201B E98100                   jmp .expr241
  4566                                  .expr240:
  4567 0000201E 68D804                   push 1240
  4568 00002021 E8FD23                   call istoken
  4569 00002024 83C402                   add  sp, 2
  4570 00002027 08C0                     or  al, al
  4571 00002029 0F840C00                 je .expr242
  4572 0000202D 68[7921]                 push expr_21
  4573 00002030 E8BE03                   call rterm
  4574 00002033 83C402                   add  sp, 2
  4575                                  
  4576                                  ;-451   else if (istoken(T_GREATGREAT)) rterm("shr");  
  4577                                  
  4578 00002036 E96600                   jmp .expr243
  4579                                  .expr242:
  4580 00002039 68D904                   push 1241
  4581 0000203C E8E223                   call istoken
  4582 0000203F 83C402                   add  sp, 2
  4583 00002042 08C0                     or  al, al
  4584 00002044 0F840C00                 je .expr244
  4585 00002048 68[7D21]                 push expr_22
  4586 0000204B E8A303                   call rterm
  4587 0000204E 83C402                   add  sp, 2
  4588                                  
  4589                                  ;-452   else if (istoken('*')) domul (ids);
  4590                                  
  4591 00002051 E94B00                   jmp .expr245
  4592                                  .expr244:
  4593 00002054 6A2A                     push 42
  4594 00002056 E8C823                   call istoken
  4595 00002059 83C402                   add  sp, 2
  4596 0000205C 08C0                     or  al, al
  4597 0000205E 0F840C00                 je .expr246
  4598 00002062 FF76F6                   push word [bp-10]
  4599 00002065 E8DD09                   call domul
  4600 00002068 83C402                   add  sp, 2
  4601                                  
  4602                                  ;-453   else if (istoken('/')) doidiv(ids);
  4603                                  
  4604 0000206B E93100                   jmp .expr247
  4605                                  .expr246:
  4606 0000206E 6A2F                     push 47
  4607 00002070 E8AE23                   call istoken
  4608 00002073 83C402                   add  sp, 2
  4609 00002076 08C0                     or  al, al
  4610 00002078 0F840C00                 je .expr248
  4611 0000207C FF76F6                   push word [bp-10]
  4612 0000207F E8640A                   call doidiv
  4613 00002082 83C402                   add  sp, 2
  4614                                  
  4615                                  ;-454   else if (istoken('%')) domod (ids);
  4616                                  
  4617 00002085 E91700                   jmp .expr249
  4618                                  .expr248:
  4619 00002088 6A25                     push 37
  4620 0000208A E89423                   call istoken
  4621 0000208D 83C402                   add  sp, 2
  4622 00002090 08C0                     or  al, al
  4623 00002092 0F840900                 je .expr250
  4624 00002096 FF76F6                   push word [bp-10]
  4625 00002099 E8ED0B                   call domod
  4626 0000209C 83C402                   add  sp, 2
  4627                                  
  4628                                  ;-455   if (isrelational()) { rterm("cmp"); cmpneg(ids);}
  4629                                  
  4630                                  .expr250:
  4631                                  .expr249:
  4632                                  .expr247:
  4633                                  .expr245:
  4634                                  .expr243:
  4635                                  .expr241:
  4636                                  .expr239:
  4637                                  .expr237:
  4638                                  .expr235:
  4639 0000209F E8F41B                   call isrelational
  4640 000020A2 08C0                     or  al, al
  4641 000020A4 0F841200                 je .expr251
  4642 000020A8 68[8121]                 push expr_23
  4643 000020AB E84303                   call rterm
  4644 000020AE 83C402                   add  sp, 2
  4645 000020B1 FF76F6                   push word [bp-10]
  4646 000020B4 E82C19                   call cmpneg
  4647 000020B7 83C402                   add  sp, 2
  4648                                  
  4649                                  ;-456   return 0;
  4650                                  
  4651                                  .expr251:
  4652 000020BA B80000                   mov ax, 0
  4653 000020BD E90000                   jmp .retn
  4654                                  
  4655                                  ;-457 }
  4656                                  
  4657                                  
  4658                                  ;-458 
  4659                                  
  4660                                  
  4661                                  ;-459 int compoundass(char *op, int mode, int id1) {
  4662                                  
  4663 000020C0 C9                       .retn: LEAVE
  4664 000020C1 C3                       ret
  4665                                  ; ENDP
  4666 000020C2 5C6E206D6F76206178-     expr_0 db "\n mov ax, ",0
  4667 000020CB 2C2000             
  4668 000020CE 4172726179696E6465-     expr_1 db "Arrayindex muss Zahl oder int sein",0
  4669 000020D7 78206D757373205A61-
  4670 000020E0 686C206F6465722069-
  4671 000020E9 6E74207365696E00   
  4672 000020F1 4E7572207661722065-     expr_2 db "Nur var erlaubt",0
  4673 000020FA 726C6175627400     
  4674 00002101 5C6E20696E63202000      expr_3 db "\n inc  ",0
  4675 0000210A 776F726400              expr_4 db "word",0
  4676 0000210F 6279746500              expr_5 db "byte",0
  4677 00002114 4E7572207661722065-     expr_6 db "Nur var erlaubt",0
  4678 0000211D 726C6175627400     
  4679 00002124 5C6E20646563202000      expr_7 db "\n dec  ",0
  4680 0000212D 776F726400              expr_8 db "word",0
  4681 00002132 6279746500              expr_9 db "byte",0
  4682 00002137 61646400                expr_10 db "add",0
  4683 0000213B 73756200                expr_11 db "sub",0
  4684 0000213F 616E6400                expr_12 db "and",0
  4685 00002143 6F7200                  expr_13 db "or",0
  4686 00002146 6E6F7420696D706C65-     expr_14 db "not implemented",0
  4687 0000214F 6D656E74656400     
  4688 00002156 6E6F7420696D706C65-     expr_15 db "not implemented",0
  4689 0000215F 6D656E74656400     
  4690 00002166 6D6F7600                expr_16 db "mov",0
  4691 0000216A 61646400                expr_17 db "add",0
  4692 0000216E 73756200                expr_18 db "sub",0
  4693 00002172 616E6400                expr_19 db "and",0
  4694 00002176 6F7200                  expr_20 db "or",0
  4695 00002179 73686C00                expr_21 db "shl",0
  4696 0000217D 73687200                expr_22 db "shr",0
  4697 00002181 636D7000                expr_23 db "cmp",0
  4698                                  
  4699                                  compoundass:  ; *** PROC ***
  4700                                  
  4701                                  ;-460   if(mode) error1("only scalar Var allowed");
  4702                                  
  4703                                  ;Function : compoundass, Number of local variables: 3
  4704                                  ;   # type sign width addr used name   list of local variables
  4705                                  ;  200 ptr sign byte   459 NULL op = bp+4
  4706                                  ;  201 var sign word   459 NULL mode = bp+6
  4707                                  ;  202 var sign word   459 NULL id1 = bp+8;
  4708 00002185 C8000000                 ENTER  0,0
  4709 00002189 8B4606                   mov ax, [bp+6]
  4710 0000218C 08C0                     or  al, al
  4711 0000218E 0F840900                 je .compoundass252
  4712 00002192 68[FF21]                 push compoundass_0
  4713 00002195 E8A926                   call error1
  4714 00002198 83C402                   add  sp, 2
  4715                                  
  4716                                  ;-461   prnl(); prs(op); prs("  "); 
  4717                                  
  4718                                  .compoundass252:
  4719 0000219B E8AA23                   call prnl
  4720 0000219E FF7604                   push word [bp+4]
  4721 000021A1 E8B223                   call prs
  4722 000021A4 83C402                   add  sp, 2
  4723 000021A7 68[1722]                 push compoundass_1
  4724 000021AA E8A923                   call prs
  4725 000021AD 83C402                   add  sp, 2
  4726                                  
  4727                                  ;-462   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  4728                                  
  4729 000021B0 FF7608                   push word [bp+8]
  4730 000021B3 E8FCE6                   call gettypes
  4731 000021B6 83C402                   add  sp, 2
  4732 000021B9 A1[3900]                 mov ax, [wi]
  4733 000021BC 83F802                   cmp ax, 2
  4734 000021BF 0F850C00                 jne .compoundass253
  4735 000021C3 68[1A22]                 push compoundass_2
  4736 000021C6 E88D23                   call prs
  4737 000021C9 83C402                   add  sp, 2
  4738 000021CC E90900                   jmp .compoundass254
  4739                                  .compoundass253:
  4740 000021CF 68[1F22]                 push compoundass_3
  4741 000021D2 E88123                   call prs
  4742 000021D5 83C402                   add  sp, 2
  4743                                  
  4744                                  ;-463   v(id1); prs(", ");
  4745                                  
  4746                                  .compoundass254:
  4747 000021D8 FF7608                   push word [bp+8]
  4748 000021DB E826E2                   call v
  4749 000021DE 83C402                   add  sp, 2
  4750 000021E1 68[2422]                 push compoundass_4
  4751 000021E4 E86F23                   call prs
  4752 000021E7 83C402                   add  sp, 2
  4753                                  
  4754                                  ;-464   expect(T_CONST); prunsign1(lexval);
  4755                                  
  4756 000021EA 680101                   push 257
  4757 000021ED E85322                   call expect
  4758 000021F0 83C402                   add  sp, 2
  4759 000021F3 FF36[2E00]               push word [lexval]
  4760 000021F7 E8B624                   call prunsign1
  4761 000021FA 83C402                   add  sp, 2
  4762                                  
  4763                                  ;-465 }
  4764                                  
  4765                                  
  4766                                  ;-466 int dovar1(int mode, int op, int ixarr, int id1) { 
  4767 000021FD C9                       LEAVE
  4768 000021FE C3                       ret
  4769                                  ; ENDP
  4770 000021FF 6F6E6C79207363616C-     compoundass_0 db "only scalar Var allowed",0
  4771 00002208 61722056617220616C-
  4772 00002211 6C6F77656400       
  4773 00002217 202000                  compoundass_1 db "  ",0
  4774 0000221A 776F726400              compoundass_2 db "word",0
  4775 0000221F 6279746500              compoundass_3 db "byte",0
  4776 00002224 2C2000                  compoundass_4 db ", ",0
  4777                                  
  4778                                  dovar1:  ; *** PROC ***
  4779                                  
  4780                                  ;-467   gettypes(id1);
  4781                                  
  4782                                  ;Function : dovar1, Number of local variables: 4
  4783                                  ;   # type sign width addr used name   list of local variables
  4784                                  ;  200 var sign word   466 NULL mode = bp+4
  4785                                  ;  201 var sign word   466 NULL op = bp+6
  4786                                  ;  202 var sign word   466 NULL ixarr = bp+8
  4787                                  ;  203 var sign word   466 NULL id1 = bp+10;
  4788 00002227 C8000000                 ENTER  0,0
  4789 0000222B FF760A                   push word [bp+10]
  4790 0000222E E881E6                   call gettypes
  4791 00002231 83C402                   add  sp, 2
  4792                                  
  4793                                  ;-468   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);
  4794                                  
  4795 00002234 8B4604                   mov ax, [bp+4]
  4796 00002237 83F801                   cmp ax, 1
  4797 0000223A 0F854700                 jne .dovar1255
  4798 0000223E 68[7C23]                 push dovar1_0
  4799 00002241 E81223                   call prs
  4800 00002244 83C402                   add  sp, 2
  4801 00002247 FF760A                   push word [bp+10]
  4802 0000224A E8B7E1                   call v
  4803 0000224D 83C402                   add  sp, 2
  4804 00002250 E8F522                   call prnl
  4805 00002253 FF7606                   push word [bp+6]
  4806 00002256 E8FD22                   call prs
  4807 00002259 83C402                   add  sp, 2
  4808                                  
  4809                                  ;-469     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");
  4810                                  
  4811 0000225C A1[3600]                 mov ax, [widthi]
  4812 0000225F 83F801                   cmp ax, 1
  4813 00002262 0F850900                 jne .dovar1256
  4814 00002266 68[8823]                 push dovar1_1
  4815 00002269 E8EA22                   call prs
  4816 0000226C 83C402                   add  sp, 2
  4817                                  
  4818                                  ;-470     if(widthi == 2) prs(" ax, [bx]");
  4819                                  
  4820                                  .dovar1256:
  4821 0000226F A1[3600]                 mov ax, [widthi]
  4822 00002272 83F802                   cmp ax, 2
  4823 00002275 0F850900                 jne .dovar1257
  4824 00002279 68[9E23]                 push dovar1_2
  4825 0000227C E8D722                   call prs
  4826 0000227F 83C402                   add  sp, 2
  4827                                  
  4828                                  ;-471     return; }
  4829                                  
  4830                                  .dovar1257:
  4831 00002282 E9F500                   jmp .retn
  4832                                  
  4833                                  ;-472   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }
  4834                                  
  4835                                  .dovar1255:
  4836 00002285 8B4604                   mov ax, [bp+4]
  4837 00002288 83F802                   cmp ax, 2
  4838 0000228B 0F852100                 jne .dovar1258
  4839 0000228F E8B622                   call prnl
  4840 00002292 FF7606                   push word [bp+6]
  4841 00002295 E8BE22                   call prs
  4842 00002298 83C402                   add  sp, 2
  4843 0000229B 68[A823]                 push dovar1_3
  4844 0000229E E8B522                   call prs
  4845 000022A1 83C402                   add  sp, 2
  4846 000022A4 FF760A                   push word [bp+10]
  4847 000022A7 E84BE1                   call a
  4848 000022AA 83C402                   add  sp, 2
  4849 000022AD E9CA00                   jmp .retn
  4850                                  
  4851                                  ;-473   if (ixarr) {
  4852                                  
  4853                                  .dovar1258:
  4854 000022B0 8B4608                   mov ax, [bp+8]
  4855 000022B3 08C0                     or  al, al
  4856 000022B5 0F847300                 je .dovar1259
  4857                                  
  4858                                  ;-474     prs("\n mov bx, "); v(ixarr);
  4859                                  
  4860 000022B9 68[AE23]                 push dovar1_4
  4861 000022BC E89722                   call prs
  4862 000022BF 83C402                   add  sp, 2
  4863 000022C2 FF7608                   push word [bp+8]
  4864 000022C5 E83CE1                   call v
  4865 000022C8 83C402                   add  sp, 2
  4866                                  
  4867                                  ;-475     if (wi==2) prs("\n shl bx, 1");
  4868                                  
  4869 000022CB A1[3900]                 mov ax, [wi]
  4870 000022CE 83F802                   cmp ax, 2
  4871 000022D1 0F850900                 jne .dovar1260
  4872 000022D5 68[BA23]                 push dovar1_5
  4873 000022D8 E87B22                   call prs
  4874 000022DB 83C402                   add  sp, 2
  4875                                  
  4876                                  ;-476     prs("\n "); prs(op);
  4877                                  
  4878                                  .dovar1260:
  4879 000022DE 68[C723]                 push dovar1_6
  4880 000022E1 E87222                   call prs
  4881 000022E4 83C402                   add  sp, 2
  4882 000022E7 FF7606                   push word [bp+6]
  4883 000022EA E86922                   call prs
  4884 000022ED 83C402                   add  sp, 2
  4885                                  
  4886                                  ;-477     if (wi==2) prs(" ax, "); else prs(" al, ");
  4887                                  
  4888 000022F0 A1[3900]                 mov ax, [wi]
  4889 000022F3 83F802                   cmp ax, 2
  4890 000022F6 0F850C00                 jne .dovar1261
  4891 000022FA 68[CB23]                 push dovar1_7
  4892 000022FD E85622                   call prs
  4893 00002300 83C402                   add  sp, 2
  4894 00002303 E90900                   jmp .dovar1262
  4895                                  .dovar1261:
  4896 00002306 68[D123]                 push dovar1_8
  4897 00002309 E84A22                   call prs
  4898 0000230C 83C402                   add  sp, 2
  4899                                  
  4900                                  ;-478 // v(id1); prs(" [bx]");
  4901                                  
  4902                                  
  4903                                  ;-479     prc('['); printName(id1); prs(" + bx]"); 
  4904                                  
  4905                                  .dovar1262:
  4906 0000230F 6A5B                     push 91
  4907 00002311 E8DB21                   call prc
  4908 00002314 83C402                   add  sp, 2
  4909 00002317 FF760A                   push word [bp+10]
  4910 0000231A E86FE6                   call printName
  4911 0000231D 83C402                   add  sp, 2
  4912 00002320 68[D723]                 push dovar1_9
  4913 00002323 E83022                   call prs
  4914 00002326 83C402                   add  sp, 2
  4915                                  
  4916                                  ;-480     return; }
  4917                                  
  4918 00002329 E94E00                   jmp .retn
  4919                                  
  4920                                  ;-481   prnl();prs(op);
  4921                                  
  4922                                  .dovar1259:
  4923 0000232C E81922                   call prnl
  4924 0000232F FF7606                   push word [bp+6]
  4925 00002332 E82122                   call prs
  4926 00002335 83C402                   add  sp, 2
  4927                                  
  4928                                  ;-482   if(wi==1) prs(" al, ");
  4929                                  
  4930 00002338 A1[3900]                 mov ax, [wi]
  4931 0000233B 83F801                   cmp ax, 1
  4932 0000233E 0F850900                 jne .dovar1263
  4933 00002342 68[DE23]                 push dovar1_10
  4934 00002345 E80E22                   call prs
  4935 00002348 83C402                   add  sp, 2
  4936                                  
  4937                                  ;-483   if(wi==2) prs(" ax, ");
  4938                                  
  4939                                  .dovar1263:
  4940 0000234B A1[3900]                 mov ax, [wi]
  4941 0000234E 83F802                   cmp ax, 2
  4942 00002351 0F850900                 jne .dovar1264
  4943 00002355 68[E423]                 push dovar1_11
  4944 00002358 E8FB21                   call prs
  4945 0000235B 83C402                   add  sp, 2
  4946                                  
  4947                                  ;-484   if(wi==4) prs(" eax, ");
  4948                                  
  4949                                  .dovar1264:
  4950 0000235E A1[3900]                 mov ax, [wi]
  4951 00002361 83F804                   cmp ax, 4
  4952 00002364 0F850900                 jne .dovar1265
  4953 00002368 68[EA23]                 push dovar1_12
  4954 0000236B E8E821                   call prs
  4955 0000236E 83C402                   add  sp, 2
  4956                                  
  4957                                  ;-485   v(id1);
  4958                                  
  4959                                  .dovar1265:
  4960 00002371 FF760A                   push word [bp+10]
  4961 00002374 E88DE0                   call v
  4962 00002377 83C402                   add  sp, 2
  4963                                  
  4964                                  ;-486 }
  4965                                  
  4966                                  
  4967                                  ;-487 int rterm(char *op) {int mode; int opint; int ixarr; int id1;
  4968                                  
  4969 0000237A C9                       .retn: LEAVE
  4970 0000237B C3                       ret
  4971                                  ; ENDP
  4972 0000237C 5C6E206D6F76206278-     dovar1_0 db "\n mov bx, ",0
  4973 00002385 2C2000             
  4974 00002388 20616C2C205B62785D-     dovar1_1 db " al, [bx]\n mov ah, 0",0
  4975 00002391 5C6E206D6F76206168-
  4976 0000239A 2C203000           
  4977 0000239E 2061782C205B62785D-     dovar1_2 db " ax, [bx]",0
  4978 000023A7 00                 
  4979 000023A8 2061782C2000            dovar1_3 db " ax, ",0
  4980 000023AE 5C6E206D6F76206278-     dovar1_4 db "\n mov bx, ",0
  4981 000023B7 2C2000             
  4982 000023BA 5C6E2073686C206278-     dovar1_5 db "\n shl bx, 1",0
  4983 000023C3 2C203100           
  4984 000023C7 5C6E2000                dovar1_6 db "\n ",0
  4985 000023CB 2061782C2000            dovar1_7 db " ax, ",0
  4986 000023D1 20616C2C2000            dovar1_8 db " al, ",0
  4987 000023D7 202B2062785D00          dovar1_9 db " + bx]",0
  4988 000023DE 20616C2C2000            dovar1_10 db " al, ",0
  4989 000023E4 2061782C2000            dovar1_11 db " ax, ",0
  4990 000023EA 206561782C2000          dovar1_12 db " eax, ",0
  4991                                  
  4992                                  rterm:  ; *** PROC ***
  4993                                  
  4994                                  ;-488   if (istoken(T_CONST)) { prnl(); prs(op); 
  4995                                  
  4996                                  ;Function : rterm, Number of local variables: 5
  4997                                  ;   # type sign width addr used name   list of local variables
  4998                                  ;  200 ptr sign byte   487 NULL op = bp+4
  4999                                  ;  201 var sign word   487 NULL mode = bp-2
  5000                                  ;  202 var sign word   487 NULL opint = bp-4
  5001                                  ;  203 var sign word   487 NULL ixarr = bp-6
  5002                                  ;  204 var sign word   487 NULL id1 = bp-8;
  5003 000023F1 C8080000                 ENTER  8,0
  5004 000023F5 680101                   push 257
  5005 000023F8 E82620                   call istoken
  5006 000023FB 83C402                   add  sp, 2
  5007 000023FE 08C0                     or  al, al
  5008 00002400 0F845200                 je .rterm266
  5009 00002404 E84121                   call prnl
  5010 00002407 FF7604                   push word [bp+4]
  5011 0000240A E84921                   call prs
  5012 0000240D 83C402                   add  sp, 2
  5013                                  
  5014                                  ;-489     if (wi==1) prs(" al, ");
  5015                                  
  5016 00002410 A1[3900]                 mov ax, [wi]
  5017 00002413 83F801                   cmp ax, 1
  5018 00002416 0F850900                 jne .rterm267
  5019 0000241A 68[DA24]                 push rterm_0
  5020 0000241D E83621                   call prs
  5021 00002420 83C402                   add  sp, 2
  5022                                  
  5023                                  ;-490     if (wi==2) prs(" ax, ");
  5024                                  
  5025                                  .rterm267:
  5026 00002423 A1[3900]                 mov ax, [wi]
  5027 00002426 83F802                   cmp ax, 2
  5028 00002429 0F850900                 jne .rterm268
  5029 0000242D 68[E024]                 push rterm_1
  5030 00002430 E82321                   call prs
  5031 00002433 83C402                   add  sp, 2
  5032                                  
  5033                                  ;-491     if (wi==4) prs(" eax, ");
  5034                                  
  5035                                  .rterm268:
  5036 00002436 A1[3900]                 mov ax, [wi]
  5037 00002439 83F804                   cmp ax, 4
  5038 0000243C 0F850900                 jne .rterm269
  5039 00002440 68[E624]                 push rterm_2
  5040 00002443 E81021                   call prs
  5041 00002446 83C402                   add  sp, 2
  5042                                  
  5043                                  ;-492     prunsign1(lexval); return;}
  5044                                  
  5045                                  .rterm269:
  5046 00002449 FF36[2E00]               push word [lexval]
  5047 0000244D E86022                   call prunsign1
  5048 00002450 83C402                   add  sp, 2
  5049 00002453 E98200                   jmp .retn
  5050                                  
  5051                                  ;-493   mode=typeName(); id1=searchname(); ixarr=0;
  5052                                  
  5053                                  .rterm266:
  5054 00002456 E866E6                   call typeName
  5055 00002459 8946FE                   mov [bp-2], ax
  5056 0000245C E891E5                   call searchname
  5057 0000245F 8946F8                   mov [bp-8], ax
  5058 00002462 B80000                   mov ax, 0
  5059 00002465 8946FA                   mov [bp-6], ax
  5060                                  
  5061                                  ;-494   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');  
  5062                                  
  5063 00002468 6A5B                     push 91
  5064 0000246A E8B41F                   call istoken
  5065 0000246D 83C402                   add  sp, 2
  5066 00002470 08C0                     or  al, al
  5067 00002472 0F843300                 je .rterm270
  5068 00002476 E877E5                   call searchname
  5069 00002479 8946FA                   mov [bp-6], ax
  5070 0000247C 680001                   push 256
  5071 0000247F E8C11F                   call expect
  5072 00002482 83C402                   add  sp, 2
  5073 00002485 6A5D                     push 93
  5074 00002487 E8B91F                   call expect
  5075 0000248A 83C402                   add  sp, 2
  5076                                  
  5077                                  ;-495     gettypes(ixarr);
  5078                                  
  5079 0000248D FF76FA                   push word [bp-6]
  5080 00002490 E81FE4                   call gettypes
  5081 00002493 83C402                   add  sp, 2
  5082                                  
  5083                                  ;-496     if (widthi != 2) error1("Arrayindex muss int sein"); }
  5084                                  
  5085 00002496 A1[3600]                 mov ax, [widthi]
  5086 00002499 83F802                   cmp ax, 2
  5087 0000249C 0F840900                 je  .rterm271
  5088 000024A0 68[ED24]                 push rterm_3
  5089 000024A3 E89B23                   call error1
  5090 000024A6 83C402                   add  sp, 2
  5091                                  .rterm271:
  5092                                  
  5093                                  ;-497   if (eqstr(symbol,"_AX")) return;
  5094                                  
  5095                                  .rterm270:
  5096 000024A9 68[0625]                 push rterm_4
  5097 000024AC 8D062B81                 lea  ax, [symbol]
  5098 000024B0 50                       push ax
  5099 000024B1 E8E2DC                   call eqstr
  5100 000024B4 83C404                   add  sp, 4
  5101 000024B7 08C0                     or  al, al
  5102 000024B9 0F840300                 je .rterm272
  5103 000024BD E91800                   jmp .retn
  5104                                  
  5105                                  ;-498   opint=op; dovar1(mode, opint, ixarr, id1);
  5106                                  
  5107                                  .rterm272:
  5108 000024C0 8B4604                   mov ax, [bp+4]
  5109 000024C3 8946FC                   mov [bp-4], ax
  5110 000024C6 FF76F8                   push word [bp-8]
  5111 000024C9 FF76FA                   push word [bp-6]
  5112 000024CC FF76FC                   push word [bp-4]
  5113 000024CF FF76FE                   push word [bp-2]
  5114 000024D2 E852FD                   call dovar1
  5115 000024D5 83C408                   add  sp, 8
  5116                                  
  5117                                  ;-499 }
  5118                                  
  5119                                  
  5120                                  ;-500 int isreg() {
  5121                                  
  5122 000024D8 C9                       .retn: LEAVE
  5123 000024D9 C3                       ret
  5124                                  ; ENDP
  5125 000024DA 20616C2C2000            rterm_0 db " al, ",0
  5126 000024E0 2061782C2000            rterm_1 db " ax, ",0
  5127 000024E6 206561782C2000          rterm_2 db " eax, ",0
  5128 000024ED 4172726179696E6465-     rterm_3 db "Arrayindex muss int sein",0
  5129 000024F6 78206D75737320696E-
  5130 000024FF 74207365696E00     
  5131 00002506 5F415800                rterm_4 db "_AX",0
  5132                                  
  5133                                  isreg:  ; *** PROC ***
  5134                                  
  5135                                  ;-501   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}
  5136                                  
  5137 0000250A 68[F726]                 push isreg_0
  5138 0000250D 8D062B81                 lea  ax, [symbol]
  5139 00002511 50                       push ax
  5140 00002512 E881DC                   call eqstr
  5141 00002515 83C404                   add  sp, 4
  5142 00002518 08C0                     or  al, al
  5143 0000251A 0F840C00                 je .isreg273
  5144 0000251E 68[FB26]                 push isreg_1
  5145 00002521 E84202                   call doreg
  5146 00002524 83C402                   add  sp, 2
  5147 00002527 E9C601                   jmp .r1
  5148                                  
  5149                                  ;-502   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}  
  5150                                  
  5151                                  .isreg273:
  5152 0000252A 68[FE26]                 push isreg_2
  5153 0000252D 8D062B81                 lea  ax, [symbol]
  5154 00002531 50                       push ax
  5155 00002532 E861DC                   call eqstr
  5156 00002535 83C404                   add  sp, 4
  5157 00002538 08C0                     or  al, al
  5158 0000253A 0F840C00                 je .isreg274
  5159 0000253E 68[0227]                 push isreg_3
  5160 00002541 E82202                   call doreg
  5161 00002544 83C402                   add  sp, 2
  5162 00002547 E9A601                   jmp .r1
  5163                                  
  5164                                  ;-503   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}
  5165                                  
  5166                                  .isreg274:
  5167 0000254A 68[0527]                 push isreg_4
  5168 0000254D 8D062B81                 lea  ax, [symbol]
  5169 00002551 50                       push ax
  5170 00002552 E841DC                   call eqstr
  5171 00002555 83C404                   add  sp, 4
  5172 00002558 08C0                     or  al, al
  5173 0000255A 0F840C00                 je .isreg275
  5174 0000255E 68[0927]                 push isreg_5
  5175 00002561 E80202                   call doreg
  5176 00002564 83C402                   add  sp, 2
  5177 00002567 E98601                   jmp .r1
  5178                                  
  5179                                  ;-504   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}
  5180                                  
  5181                                  .isreg275:
  5182 0000256A 68[0C27]                 push isreg_6
  5183 0000256D 8D062B81                 lea  ax, [symbol]
  5184 00002571 50                       push ax
  5185 00002572 E821DC                   call eqstr
  5186 00002575 83C404                   add  sp, 4
  5187 00002578 08C0                     or  al, al
  5188 0000257A 0F840C00                 je .isreg276
  5189 0000257E 68[1027]                 push isreg_7
  5190 00002581 E8E201                   call doreg
  5191 00002584 83C402                   add  sp, 2
  5192 00002587 E96601                   jmp .r1
  5193                                  
  5194                                  ;-505   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}
  5195                                  
  5196                                  .isreg276:
  5197 0000258A 68[1327]                 push isreg_8
  5198 0000258D 8D062B81                 lea  ax, [symbol]
  5199 00002591 50                       push ax
  5200 00002592 E801DC                   call eqstr
  5201 00002595 83C404                   add  sp, 4
  5202 00002598 08C0                     or  al, al
  5203 0000259A 0F840C00                 je .isreg277
  5204 0000259E 68[1727]                 push isreg_9
  5205 000025A1 E8C201                   call doreg
  5206 000025A4 83C402                   add  sp, 2
  5207 000025A7 E94601                   jmp .r1
  5208                                  
  5209                                  ;-506   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}    
  5210                                  
  5211                                  .isreg277:
  5212 000025AA 68[1A27]                 push isreg_10
  5213 000025AD 8D062B81                 lea  ax, [symbol]
  5214 000025B1 50                       push ax
  5215 000025B2 E8E1DB                   call eqstr
  5216 000025B5 83C404                   add  sp, 4
  5217 000025B8 08C0                     or  al, al
  5218 000025BA 0F840C00                 je .isreg278
  5219 000025BE 68[1E27]                 push isreg_11
  5220 000025C1 E8A201                   call doreg
  5221 000025C4 83C402                   add  sp, 2
  5222 000025C7 E92601                   jmp .r1
  5223                                  
  5224                                  ;-507   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}
  5225                                  
  5226                                  .isreg278:
  5227 000025CA 68[2127]                 push isreg_12
  5228 000025CD 8D062B81                 lea  ax, [symbol]
  5229 000025D1 50                       push ax
  5230 000025D2 E8C1DB                   call eqstr
  5231 000025D5 83C404                   add  sp, 4
  5232 000025D8 08C0                     or  al, al
  5233 000025DA 0F840C00                 je .isreg279
  5234 000025DE 68[2527]                 push isreg_13
  5235 000025E1 E88201                   call doreg
  5236 000025E4 83C402                   add  sp, 2
  5237 000025E7 E90601                   jmp .r1
  5238                                  
  5239                                  ;-508   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}
  5240                                  
  5241                                  .isreg279:
  5242 000025EA 68[2827]                 push isreg_14
  5243 000025ED 8D062B81                 lea  ax, [symbol]
  5244 000025F1 50                       push ax
  5245 000025F2 E8A1DB                   call eqstr
  5246 000025F5 83C404                   add  sp, 4
  5247 000025F8 08C0                     or  al, al
  5248 000025FA 0F840C00                 je .isreg280
  5249 000025FE 68[2C27]                 push isreg_15
  5250 00002601 E86201                   call doreg
  5251 00002604 83C402                   add  sp, 2
  5252 00002607 E9E600                   jmp .r1
  5253                                  
  5254                                  ;-509   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}    
  5255                                  
  5256                                  .isreg280:
  5257 0000260A 68[2F27]                 push isreg_16
  5258 0000260D 8D062B81                 lea  ax, [symbol]
  5259 00002611 50                       push ax
  5260 00002612 E881DB                   call eqstr
  5261 00002615 83C404                   add  sp, 4
  5262 00002618 08C0                     or  al, al
  5263 0000261A 0F840C00                 je .isreg281
  5264 0000261E 68[3327]                 push isreg_17
  5265 00002621 E84201                   call doreg
  5266 00002624 83C402                   add  sp, 2
  5267 00002627 E9C600                   jmp .r1
  5268                                  
  5269                                  ;-510   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}
  5270                                  
  5271                                  .isreg281:
  5272 0000262A 68[3627]                 push isreg_18
  5273 0000262D 8D062B81                 lea  ax, [symbol]
  5274 00002631 50                       push ax
  5275 00002632 E861DB                   call eqstr
  5276 00002635 83C404                   add  sp, 4
  5277 00002638 08C0                     or  al, al
  5278 0000263A 0F840C00                 je .isreg282
  5279 0000263E 68[3A27]                 push isreg_19
  5280 00002641 E82201                   call doreg
  5281 00002644 83C402                   add  sp, 2
  5282 00002647 E9A600                   jmp .r1
  5283                                  
  5284                                  ;-511   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}
  5285                                  
  5286                                  .isreg282:
  5287 0000264A 68[3D27]                 push isreg_20
  5288 0000264D 8D062B81                 lea  ax, [symbol]
  5289 00002651 50                       push ax
  5290 00002652 E841DB                   call eqstr
  5291 00002655 83C404                   add  sp, 4
  5292 00002658 08C0                     or  al, al
  5293 0000265A 0F840C00                 je .isreg283
  5294 0000265E 68[4127]                 push isreg_21
  5295 00002661 E80201                   call doreg
  5296 00002664 83C402                   add  sp, 2
  5297 00002667 E98600                   jmp .r1
  5298                                  
  5299                                  ;-512   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}  
  5300                                  
  5301                                  .isreg283:
  5302 0000266A 68[4427]                 push isreg_22
  5303 0000266D 8D062B81                 lea  ax, [symbol]
  5304 00002671 50                       push ax
  5305 00002672 E821DB                   call eqstr
  5306 00002675 83C404                   add  sp, 4
  5307 00002678 08C0                     or  al, al
  5308 0000267A 0F840C00                 je .isreg284
  5309 0000267E 68[4827]                 push isreg_23
  5310 00002681 E8E200                   call doreg
  5311 00002684 83C402                   add  sp, 2
  5312 00002687 E96600                   jmp .r1
  5313                                  
  5314                                  ;-513   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}
  5315                                  
  5316                                  .isreg284:
  5317 0000268A 68[4B27]                 push isreg_24
  5318 0000268D 8D062B81                 lea  ax, [symbol]
  5319 00002691 50                       push ax
  5320 00002692 E801DB                   call eqstr
  5321 00002695 83C404                   add  sp, 4
  5322 00002698 08C0                     or  al, al
  5323 0000269A 0F840C00                 je .isreg285
  5324 0000269E 68[4F27]                 push isreg_25
  5325 000026A1 E8C200                   call doreg
  5326 000026A4 83C402                   add  sp, 2
  5327 000026A7 E94600                   jmp .r1
  5328                                  
  5329                                  ;-514   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}
  5330                                  
  5331                                  .isreg285:
  5332 000026AA 68[5227]                 push isreg_26
  5333 000026AD 8D062B81                 lea  ax, [symbol]
  5334 000026B1 50                       push ax
  5335 000026B2 E8E1DA                   call eqstr
  5336 000026B5 83C404                   add  sp, 4
  5337 000026B8 08C0                     or  al, al
  5338 000026BA 0F840C00                 je .isreg286
  5339 000026BE 68[5627]                 push isreg_27
  5340 000026C1 E8A200                   call doreg
  5341 000026C4 83C402                   add  sp, 2
  5342 000026C7 E92600                   jmp .r1
  5343                                  
  5344                                  ;-515   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}  
  5345                                  
  5346                                  .isreg286:
  5347 000026CA 68[5927]                 push isreg_28
  5348 000026CD 8D062B81                 lea  ax, [symbol]
  5349 000026D1 50                       push ax
  5350 000026D2 E8C1DA                   call eqstr
  5351 000026D5 83C404                   add  sp, 4
  5352 000026D8 08C0                     or  al, al
  5353 000026DA 0F840C00                 je .isreg287
  5354 000026DE 68[6027]                 push isreg_29
  5355 000026E1 E88200                   call doreg
  5356 000026E4 83C402                   add  sp, 2
  5357 000026E7 E90600                   jmp .r1
  5358                                  
  5359                                  ;-516   return 0;   r1: return 1; 
  5360                                  
  5361                                  .isreg287:
  5362 000026EA B80000                   mov ax, 0
  5363 000026ED E90600                   jmp .retn
  5364                                  .r1:
  5365 000026F0 B80100                   mov ax, 1
  5366 000026F3 E90000                   jmp .retn
  5367                                  
  5368                                  ;-517 }
  5369                                  
  5370                                  
  5371                                  ;-518 int doreg(char *dr) { int i; expect('=');
  5372                                  
  5373                                   .retn:
  5374 000026F6 C3                       ret
  5375                                  ; ENDP
  5376 000026F7 5F414800                isreg_0 db "_AH",0
  5377 000026FB 616800                  isreg_1 db "ah",0
  5378 000026FE 5F414C00                isreg_2 db "_AL",0
  5379 00002702 616C00                  isreg_3 db "al",0
  5380 00002705 5F415800                isreg_4 db "_AX",0
  5381 00002709 617800                  isreg_5 db "ax",0
  5382 0000270C 5F424800                isreg_6 db "_BH",0
  5383 00002710 626800                  isreg_7 db "bh",0
  5384 00002713 5F424C00                isreg_8 db "_BL",0
  5385 00002717 626C00                  isreg_9 db "bl",0
  5386 0000271A 5F425800                isreg_10 db "_BX",0
  5387 0000271E 627800                  isreg_11 db "bx",0
  5388 00002721 5F434800                isreg_12 db "_CH",0
  5389 00002725 636800                  isreg_13 db "ch",0
  5390 00002728 5F434C00                isreg_14 db "_CL",0
  5391 0000272C 636C00                  isreg_15 db "cl",0
  5392 0000272F 5F435800                isreg_16 db "_CX",0
  5393 00002733 637800                  isreg_17 db "cx",0
  5394 00002736 5F444800                isreg_18 db "_DH",0
  5395 0000273A 646800                  isreg_19 db "dh",0
  5396 0000273D 5F444C00                isreg_20 db "_DL",0
  5397 00002741 646C00                  isreg_21 db "dl",0
  5398 00002744 5F445800                isreg_22 db "_DX",0
  5399 00002748 647800                  isreg_23 db "dx",0
  5400 0000274B 5F534900                isreg_24 db "_SI",0
  5401 0000274F 736900                  isreg_25 db "si",0
  5402 00002752 5F444900                isreg_26 db "_DI",0
  5403 00002756 646900                  isreg_27 db "di",0
  5404 00002759 5F464C41475300          isreg_28 db "_FLAGS",0
  5405 00002760 666C61677300            isreg_29 db "flags",0
  5406                                  
  5407                                  doreg:  ; *** PROC ***
  5408                                  ;Function : doreg, Number of local variables: 2
  5409                                  ;   # type sign width addr used name   list of local variables
  5410                                  ;  200 ptr sign byte   518 NULL dr = bp+4
  5411                                  ;  201 var sign word   518 NULL i = bp-2;
  5412 00002766 C8020000                 ENTER  2,0
  5413 0000276A 6A3D                     push 61
  5414 0000276C E8D41C                   call expect
  5415 0000276F 83C402                   add  sp, 2
  5416                                  
  5417                                  ;-519   prs("\n mov  "); prs(dr); prs(", ");
  5418                                  
  5419 00002772 68[D527]                 push doreg_0
  5420 00002775 E8DE1D                   call prs
  5421 00002778 83C402                   add  sp, 2
  5422 0000277B FF7604                   push word [bp+4]
  5423 0000277E E8D51D                   call prs
  5424 00002781 83C402                   add  sp, 2
  5425 00002784 68[DE27]                 push doreg_1
  5426 00002787 E8CC1D                   call prs
  5427 0000278A 83C402                   add  sp, 2
  5428                                  
  5429                                  ;-520        if (istoken(T_CONST)) prunsign1(lexval);
  5430                                  
  5431 0000278D 680101                   push 257
  5432 00002790 E88E1C                   call istoken
  5433 00002793 83C402                   add  sp, 2
  5434 00002796 08C0                     or  al, al
  5435 00002798 0F840D00                 je .doreg288
  5436 0000279C FF36[2E00]               push word [lexval]
  5437 000027A0 E80D1F                   call prunsign1
  5438 000027A3 83C402                   add  sp, 2
  5439                                  
  5440                                  ;-521   else if (istoken(T_NAME )) { i=searchname(); v(i); }
  5441                                  
  5442 000027A6 E92A00                   jmp .doreg289
  5443                                  .doreg288:
  5444 000027A9 680001                   push 256
  5445 000027AC E8721C                   call istoken
  5446 000027AF 83C402                   add  sp, 2
  5447 000027B2 08C0                     or  al, al
  5448 000027B4 0F841200                 je .doreg290
  5449 000027B8 E835E2                   call searchname
  5450 000027BB 8946FE                   mov [bp-2], ax
  5451 000027BE FF76FE                   push word [bp-2]
  5452 000027C1 E840DC                   call v
  5453 000027C4 83C402                   add  sp, 2
  5454                                  
  5455                                  ;-522   else error1("only number or var allowed"); }
  5456                                  
  5457 000027C7 E90900                   jmp .doreg291
  5458                                  .doreg290:
  5459 000027CA 68[E127]                 push doreg_2
  5460 000027CD E87120                   call error1
  5461 000027D0 83C402                   add  sp, 2
  5462                                  .doreg291:
  5463                                  .doreg289:
  5464                                  
  5465                                  ;-523 
  5466                                  
  5467                                  
  5468                                  ;-524 int doassign(int mode, int i, int ixarr, int ixconst) {
  5469 000027D3 C9                       LEAVE
  5470 000027D4 C3                       ret
  5471                                  ; ENDP
  5472 000027D5 5C6E206D6F76202000      doreg_0 db "\n mov  ",0
  5473 000027DE 2C2000                  doreg_1 db ", ",0
  5474 000027E1 6F6E6C79206E756D62-     doreg_2 db "only number or var allowed",0
  5475 000027EA 6572206F7220766172-
  5476 000027F3 20616C6C6F77656400 
  5477                                  
  5478                                  doassign:  ; *** PROC ***
  5479                                  
  5480                                  ;-525   gettypes(i);
  5481                                  
  5482                                  ;Function : doassign, Number of local variables: 4
  5483                                  ;   # type sign width addr used name   list of local variables
  5484                                  ;  200 var sign word   524 NULL mode = bp+4
  5485                                  ;  201 var sign word   524 NULL i = bp+6
  5486                                  ;  202 var sign word   524 NULL ixarr = bp+8
  5487                                  ;  203 var sign word   524 NULL ixconst = bp+10;
  5488 000027FC C8000000                 ENTER  0,0
  5489 00002800 FF7606                   push word [bp+6]
  5490 00002803 E8ACE0                   call gettypes
  5491 00002806 83C402                   add  sp, 2
  5492                                  
  5493                                  ;-526   if (mode==1) {prs("\n mov  bx, ");v(i);                  
  5494                                  
  5495 00002809 8B4604                   mov ax, [bp+4]
  5496 0000280C 83F801                   cmp ax, 1
  5497 0000280F 0F853400                 jne .doassign292
  5498 00002813 68[9929]                 push doassign_0
  5499 00002816 E83D1D                   call prs
  5500 00002819 83C402                   add  sp, 2
  5501 0000281C FF7606                   push word [bp+6]
  5502 0000281F E8E2DB                   call v
  5503 00002822 83C402                   add  sp, 2
  5504                                  
  5505                                  ;-527     if (widthi == 2) prs("\n mov  [bx], ax");
  5506                                  
  5507 00002825 A1[3600]                 mov ax, [widthi]
  5508 00002828 83F802                   cmp ax, 2
  5509 0000282B 0F850C00                 jne .doassign293
  5510 0000282F 68[A629]                 push doassign_1
  5511 00002832 E8211D                   call prs
  5512 00002835 83C402                   add  sp, 2
  5513                                  
  5514                                  ;-528     else  prs("\n mov  [bx], al"); return;}
  5515                                  
  5516 00002838 E90900                   jmp .doassign294
  5517                                  .doassign293:
  5518 0000283B 68[B729]                 push doassign_2
  5519 0000283E E8151D                   call prs
  5520 00002841 83C402                   add  sp, 2
  5521                                  .doassign294:
  5522 00002844 E95001                   jmp .retn
  5523                                  
  5524                                  ;-529   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}
  5525                                  
  5526                                  .doassign292:
  5527 00002847 8B4604                   mov ax, [bp+4]
  5528 0000284A 83F802                   cmp ax, 2
  5529 0000284D 0F851E00                 jne .doassign295
  5530 00002851 68[C829]                 push doassign_3
  5531 00002854 E8FF1C                   call prs
  5532 00002857 83C402                   add  sp, 2
  5533 0000285A FF7606                   push word [bp+6]
  5534 0000285D E895DB                   call a
  5535 00002860 83C402                   add  sp, 2
  5536 00002863 68[D129]                 push doassign_4
  5537 00002866 E8ED1C                   call prs
  5538 00002869 83C402                   add  sp, 2
  5539 0000286C E92801                   jmp .retn
  5540                                  
  5541                                  ;-530   if (ixarr) {  prs("\n mov bx, ");
  5542                                  
  5543                                  .doassign295:
  5544 0000286F 8B4608                   mov ax, [bp+8]
  5545 00002872 08C0                     or  al, al
  5546 00002874 0F846E00                 je .doassign296
  5547 00002878 68[D629]                 push doassign_5
  5548 0000287B E8D81C                   call prs
  5549 0000287E 83C402                   add  sp, 2
  5550                                  
  5551                                  ;-531     if(ixconst) prunsign1(ixarr); else v(ixarr);
  5552                                  
  5553 00002881 8B460A                   mov ax, [bp+10]
  5554 00002884 08C0                     or  al, al
  5555 00002886 0F840C00                 je .doassign297
  5556 0000288A FF7608                   push word [bp+8]
  5557 0000288D E8201E                   call prunsign1
  5558 00002890 83C402                   add  sp, 2
  5559 00002893 E90900                   jmp .doassign298
  5560                                  .doassign297:
  5561 00002896 FF7608                   push word [bp+8]
  5562 00002899 E868DB                   call v
  5563 0000289C 83C402                   add  sp, 2
  5564                                  
  5565                                  ;-532     if (wi==2) prs("\n shl bx, 1");
  5566                                  
  5567                                  .doassign298:
  5568 0000289F A1[3900]                 mov ax, [wi]
  5569 000028A2 83F802                   cmp ax, 2
  5570 000028A5 0F850900                 jne .doassign299
  5571 000028A9 68[E229]                 push doassign_6
  5572 000028AC E8A71C                   call prs
  5573 000028AF 83C402                   add  sp, 2
  5574                                  
  5575                                  ;-533     prs("\n mov ["); printName(i);
  5576                                  
  5577                                  .doassign299:
  5578 000028B2 68[EF29]                 push doassign_7
  5579 000028B5 E89E1C                   call prs
  5580 000028B8 83C402                   add  sp, 2
  5581 000028BB FF7606                   push word [bp+6]
  5582 000028BE E8CBE0                   call printName
  5583 000028C1 83C402                   add  sp, 2
  5584                                  
  5585                                  ;-534     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }
  5586                                  
  5587 000028C4 A1[3900]                 mov ax, [wi]
  5588 000028C7 83F802                   cmp ax, 2
  5589 000028CA 0F850C00                 jne .doassign300
  5590 000028CE 68[F829]                 push doassign_8
  5591 000028D1 E8821C                   call prs
  5592 000028D4 83C402                   add  sp, 2
  5593 000028D7 E90900                   jmp .doassign301
  5594                                  .doassign300:
  5595 000028DA 68[012A]                 push doassign_9
  5596 000028DD E8761C                   call prs
  5597 000028E0 83C402                   add  sp, 2
  5598                                  .doassign301:
  5599 000028E3 E9B100                   jmp .retn
  5600                                  
  5601                                  ;-535   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");
  5602                                  
  5603                                  .doassign296:
  5604 000028E6 A1[3900]                 mov ax, [wi]
  5605 000028E9 83F801                   cmp ax, 1
  5606 000028EC 0F853100                 jne .doassign302
  5607 000028F0 68[0A2A]                 push doassign_10
  5608 000028F3 E8601C                   call prs
  5609 000028F6 83C402                   add  sp, 2
  5610 000028F9 8B4606                   mov ax, [bp+6]
  5611 000028FC 3DC800                   cmp ax, 200
  5612 000028FF 0F8D0900                 jge .doassign303
  5613 00002903 68[122A]                 push doassign_11
  5614 00002906 E84D1C                   call prs
  5615 00002909 83C402                   add  sp, 2
  5616                                  
  5617                                  ;-536     } v(i); prs(", al"); return; }
  5618                                  
  5619                                  .doassign303:
  5620 0000290C FF7606                   push word [bp+6]
  5621 0000290F E8F2DA                   call v
  5622 00002912 83C402                   add  sp, 2
  5623 00002915 68[182A]                 push doassign_12
  5624 00002918 E83B1C                   call prs
  5625 0000291B 83C402                   add  sp, 2
  5626 0000291E E97600                   jmp .retn
  5627                                  
  5628                                  ;-537   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");
  5629                                  
  5630                                  .doassign302:
  5631 00002921 A1[3900]                 mov ax, [wi]
  5632 00002924 83F802                   cmp ax, 2
  5633 00002927 0F853100                 jne .doassign304
  5634 0000292B 68[1D2A]                 push doassign_13
  5635 0000292E E8251C                   call prs
  5636 00002931 83C402                   add  sp, 2
  5637 00002934 8B4606                   mov ax, [bp+6]
  5638 00002937 3DC800                   cmp ax, 200
  5639 0000293A 0F8D0900                 jge .doassign305
  5640 0000293E 68[252A]                 push doassign_14
  5641 00002941 E8121C                   call prs
  5642 00002944 83C402                   add  sp, 2
  5643                                  
  5644                                  ;-538     } v(i); prs(", ax"); return; }
  5645                                  
  5646                                  .doassign305:
  5647 00002947 FF7606                   push word [bp+6]
  5648 0000294A E8B7DA                   call v
  5649 0000294D 83C402                   add  sp, 2
  5650 00002950 68[2B2A]                 push doassign_15
  5651 00002953 E8001C                   call prs
  5652 00002956 83C402                   add  sp, 2
  5653 00002959 E93B00                   jmp .retn
  5654                                  
  5655                                  ;-539   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");
  5656                                  
  5657                                  .doassign304:
  5658 0000295C A1[3900]                 mov ax, [wi]
  5659 0000295F 83F804                   cmp ax, 4
  5660 00002962 0F853100                 jne .doassign306
  5661 00002966 68[302A]                 push doassign_16
  5662 00002969 E8EA1B                   call prs
  5663 0000296C 83C402                   add  sp, 2
  5664 0000296F 8B4606                   mov ax, [bp+6]
  5665 00002972 3DC800                   cmp ax, 200
  5666 00002975 0F8D0900                 jge .doassign307
  5667 00002979 68[382A]                 push doassign_17
  5668 0000297C E8D71B                   call prs
  5669 0000297F 83C402                   add  sp, 2
  5670                                  
  5671                                  ;-540     } v(i); prs(", eax"); return; }
  5672                                  
  5673                                  .doassign307:
  5674 00002982 FF7606                   push word [bp+6]
  5675 00002985 E87CDA                   call v
  5676 00002988 83C402                   add  sp, 2
  5677 0000298B 68[3F2A]                 push doassign_18
  5678 0000298E E8C51B                   call prs
  5679 00002991 83C402                   add  sp, 2
  5680 00002994 E90000                   jmp .retn
  5681                                  
  5682                                  ;-541 }
  5683                                  
  5684                                  .doassign306:
  5685                                  
  5686                                  ;-542 int domul(int ids) {
  5687                                  
  5688 00002997 C9                       .retn: LEAVE
  5689 00002998 C3                       ret
  5690                                  ; ENDP
  5691 00002999 5C6E206D6F76202062-     doassign_0 db "\n mov  bx, ",0
  5692 000029A2 782C2000           
  5693 000029A6 5C6E206D6F7620205B-     doassign_1 db "\n mov  [bx], ax",0
  5694 000029AF 62785D2C20617800   
  5695 000029B7 5C6E206D6F7620205B-     doassign_2 db "\n mov  [bx], al",0
  5696 000029C0 62785D2C20616C00   
  5697 000029C8 5C6E206D6F76202000      doassign_3 db "\n mov  ",0
  5698 000029D1 2C20617800              doassign_4 db ", ax",0
  5699 000029D6 5C6E206D6F76206278-     doassign_5 db "\n mov bx, ",0
  5700 000029DF 2C2000             
  5701 000029E2 5C6E2073686C206278-     doassign_6 db "\n shl bx, 1",0
  5702 000029EB 2C203100           
  5703 000029EF 5C6E206D6F76205B00      doassign_7 db "\n mov [",0
  5704 000029F8 2B62785D2C20617800      doassign_8 db "+bx], ax",0
  5705 00002A01 2B62785D2C20616C00      doassign_9 db "+bx], al",0
  5706 00002A0A 5C6E206D6F762000        doassign_10 db "\n mov ",0
  5707 00002A12 627974652000            doassign_11 db "byte ",0
  5708 00002A18 2C20616C00              doassign_12 db ", al",0
  5709 00002A1D 5C6E206D6F762000        doassign_13 db "\n mov ",0
  5710 00002A25 776F72642000            doassign_14 db "word ",0
  5711 00002A2B 2C20617800              doassign_15 db ", ax",0
  5712 00002A30 5C6E206D6F762000        doassign_16 db "\n mov ",0
  5713 00002A38 64776F72642000          doassign_17 db "dword ",0
  5714 00002A3F 2C2065617800            doassign_18 db ", eax",0
  5715                                  
  5716                                  domul:  ; *** PROC ***
  5717                                  
  5718                                  ;-543   if (ids) rterm("imul"); else {
  5719                                  
  5720                                  ;Function : domul, Number of local variables: 1
  5721                                  ;   # type sign width addr used name   list of local variables
  5722                                  ;  200 var sign word   542 NULL ids = bp+4;
  5723 00002A45 C8000000                 ENTER  0,0
  5724 00002A49 8B4604                   mov ax, [bp+4]
  5725 00002A4C 08C0                     or  al, al
  5726 00002A4E 0F840C00                 je .domul308
  5727 00002A52 68[972A]                 push domul_0
  5728 00002A55 E899F9                   call rterm
  5729 00002A58 83C402                   add  sp, 2
  5730 00002A5B E93700                   jmp .domul309
  5731                                  .domul308:
  5732                                  
  5733                                  ;-544   if (istoken(T_CONST)) {prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx"); }
  5734                                  
  5735 00002A5E 680101                   push 257
  5736 00002A61 E8BD19                   call istoken
  5737 00002A64 83C402                   add  sp, 2
  5738 00002A67 08C0                     or  al, al
  5739 00002A69 0F841F00                 je .domul310
  5740 00002A6D 68[9C2A]                 push domul_1
  5741 00002A70 E8E31A                   call prs
  5742 00002A73 83C402                   add  sp, 2
  5743 00002A76 FF36[2E00]               push word [lexval]
  5744 00002A7A E8331C                   call prunsign1
  5745 00002A7D 83C402                   add  sp, 2
  5746 00002A80 68[A82A]                 push domul_2
  5747 00002A83 E8D01A                   call prs
  5748 00002A86 83C402                   add  sp, 2
  5749                                  
  5750                                  ;-545   else error1("with MUL only const number as multiplicator allowed"); } }
  5751                                  
  5752 00002A89 E90900                   jmp .domul311
  5753                                  .domul310:
  5754 00002A8C 68[B22A]                 push domul_3
  5755 00002A8F E8AF1D                   call error1
  5756 00002A92 83C402                   add  sp, 2
  5757                                  .domul311:
  5758                                  .domul309:
  5759                                  
  5760                                  ;-546 int doidiv(int ids) { int mode; int id1;
  5761 00002A95 C9                       LEAVE
  5762 00002A96 C3                       ret
  5763                                  ; ENDP
  5764 00002A97 696D756C00              domul_0 db "imul",0
  5765 00002A9C 5C6E206D6F76206278-     domul_1 db "\n mov bx, ",0
  5766 00002AA5 2C2000             
  5767 00002AA8 5C6E206D756C206278-     domul_2 db "\n mul bx",0
  5768 00002AB1 00                 
  5769 00002AB2 77697468204D554C20-     domul_3 db "with MUL only const number as multiplicator allowed",0
  5770 00002ABB 6F6E6C7920636F6E73-
  5771 00002AC4 74206E756D62657220-
  5772 00002ACD 6173206D756C746970-
  5773 00002AD6 6C696361746F722061-
  5774 00002ADF 6C6C6F77656400     
  5775                                  
  5776                                  doidiv:  ; *** PROC ***
  5777                                  
  5778                                  ;-547   if (istoken(T_CONST)) {
  5779                                  
  5780                                  ;Function : doidiv, Number of local variables: 3
  5781                                  ;   # type sign width addr used name   list of local variables
  5782                                  ;  200 var sign word   546 NULL ids = bp+4
  5783                                  ;  201 var sign word   546 NULL mode = bp-2
  5784                                  ;  202 var sign word   546 NULL id1 = bp-4;
  5785 00002AE6 C8040000                 ENTER  4,0
  5786 00002AEA 680101                   push 257
  5787 00002AED E83119                   call istoken
  5788 00002AF0 83C402                   add  sp, 2
  5789 00002AF3 08C0                     or  al, al
  5790 00002AF5 0F843400                 je .doidiv312
  5791                                  
  5792                                  ;-548     prs("\n mov bx, "); prunsign1(lexval);
  5793                                  
  5794 00002AF9 68[AB2B]                 push doidiv_0
  5795 00002AFC E8571A                   call prs
  5796 00002AFF 83C402                   add  sp, 2
  5797 00002B02 FF36[2E00]               push word [lexval]
  5798 00002B06 E8A71B                   call prunsign1
  5799 00002B09 83C402                   add  sp, 2
  5800                                  
  5801                                  ;-549     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5802                                  
  5803 00002B0C 8B4604                   mov ax, [bp+4]
  5804 00002B0F 08C0                     or  al, al
  5805 00002B11 0F840C00                 je .doidiv313
  5806 00002B15 68[B72B]                 push doidiv_1
  5807 00002B18 E83B1A                   call prs
  5808 00002B1B 83C402                   add  sp, 2
  5809 00002B1E E90900                   jmp .doidiv314
  5810                                  .doidiv313:
  5811 00002B21 68[C82B]                 push doidiv_2
  5812 00002B24 E82F1A                   call prs
  5813 00002B27 83C402                   add  sp, 2
  5814                                  .doidiv314:
  5815                                  
  5816                                  ;-550   else {
  5817                                  
  5818 00002B2A E97C00                   jmp .doidiv315
  5819                                  .doidiv312:
  5820                                  
  5821                                  ;-551     mode=typeName(); id1=searchname();
  5822                                  
  5823 00002B2D E88FDF                   call typeName
  5824 00002B30 8946FE                   mov [bp-2], ax
  5825 00002B33 E8BADE                   call searchname
  5826 00002B36 8946FC                   mov [bp-4], ax
  5827                                  
  5828                                  ;-552     if (mode) error1("only const number or int as divisor allowed");
  5829                                  
  5830 00002B39 8B46FE                   mov ax, [bp-2]
  5831 00002B3C 08C0                     or  al, al
  5832 00002B3E 0F840900                 je .doidiv316
  5833 00002B42 68[DE2B]                 push doidiv_3
  5834 00002B45 E8F91C                   call error1
  5835 00002B48 83C402                   add  sp, 2
  5836                                  
  5837                                  ;-553     gettypes(id1);
  5838                                  
  5839                                  .doidiv316:
  5840 00002B4B FF76FC                   push word [bp-4]
  5841 00002B4E E861DD                   call gettypes
  5842 00002B51 83C402                   add  sp, 2
  5843                                  
  5844                                  ;-554     if (typei) error1("only int as simple var divisor allowed");
  5845                                  
  5846 00002B54 A1[3000]                 mov ax, [typei]
  5847 00002B57 08C0                     or  al, al
  5848 00002B59 0F840900                 je .doidiv317
  5849 00002B5D 68[0A2C]                 push doidiv_4
  5850 00002B60 E8DE1C                   call error1
  5851 00002B63 83C402                   add  sp, 2
  5852                                  
  5853                                  ;-555     if (wi!=2) error1("only int, no byte as divisor allowed");
  5854                                  
  5855                                  .doidiv317:
  5856 00002B66 A1[3900]                 mov ax, [wi]
  5857 00002B69 83F802                   cmp ax, 2
  5858 00002B6C 0F840900                 je  .doidiv318
  5859 00002B70 68[312C]                 push doidiv_5
  5860 00002B73 E8CB1C                   call error1
  5861 00002B76 83C402                   add  sp, 2
  5862                                  
  5863                                  ;-556     prs("\n mov bx, "); v(id1);
  5864                                  
  5865                                  .doidiv318:
  5866 00002B79 68[562C]                 push doidiv_6
  5867 00002B7C E8D719                   call prs
  5868 00002B7F 83C402                   add  sp, 2
  5869 00002B82 FF76FC                   push word [bp-4]
  5870 00002B85 E87CD8                   call v
  5871 00002B88 83C402                   add  sp, 2
  5872                                  
  5873                                  ;-557     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5874                                  
  5875 00002B8B 8B4604                   mov ax, [bp+4]
  5876 00002B8E 08C0                     or  al, al
  5877 00002B90 0F840C00                 je .doidiv319
  5878 00002B94 68[622C]                 push doidiv_7
  5879 00002B97 E8BC19                   call prs
  5880 00002B9A 83C402                   add  sp, 2
  5881 00002B9D E90900                   jmp .doidiv320
  5882                                  .doidiv319:
  5883 00002BA0 68[732C]                 push doidiv_8
  5884 00002BA3 E8B019                   call prs
  5885 00002BA6 83C402                   add  sp, 2
  5886                                  .doidiv320:
  5887                                  
  5888                                  ;-558 }
  5889                                  
  5890                                  .doidiv315:
  5891                                  
  5892                                  ;-559 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
  5893 00002BA9 C9                       LEAVE
  5894 00002BAA C3                       ret
  5895                                  ; ENDP
  5896 00002BAB 5C6E206D6F76206278-     doidiv_0 db "\n mov bx, ",0
  5897 00002BB4 2C2000             
  5898 00002BB7 5C6E206377645C6E20-     doidiv_1 db "\n cwd\n idiv bx",0
  5899 00002BC0 6964697620627800   
  5900 00002BC8 5C6E206D6F76206478-     doidiv_2 db "\n mov dx, 0\n div bx",0
  5901 00002BD1 2C20305C6E20646976-
  5902 00002BDA 20627800           
  5903 00002BDE 6F6E6C7920636F6E73-     doidiv_3 db "only const number or int as divisor allowed",0
  5904 00002BE7 74206E756D62657220-
  5905 00002BF0 6F7220696E74206173-
  5906 00002BF9 2064697669736F7220-
  5907 00002C02 616C6C6F77656400   
  5908 00002C0A 6F6E6C7920696E7420-     doidiv_4 db "only int as simple var divisor allowed",0
  5909 00002C13 61732073696D706C65-
  5910 00002C1C 207661722064697669-
  5911 00002C25 736F7220616C6C6F77-
  5912 00002C2E 656400             
  5913 00002C31 6F6E6C7920696E742C-     doidiv_5 db "only int, no byte as divisor allowed",0
  5914 00002C3A 206E6F206279746520-
  5915 00002C43 61732064697669736F-
  5916 00002C4C 7220616C6C6F776564-
  5917 00002C55 00                 
  5918 00002C56 5C6E206D6F76206278-     doidiv_6 db "\n mov bx, ",0
  5919 00002C5F 2C2000             
  5920 00002C62 5C6E206377645C6E20-     doidiv_7 db "\n cwd\n idiv bx",0
  5921 00002C6B 6964697620627800   
  5922 00002C73 5C6E206D6F76206478-     doidiv_8 db "\n mov dx, 0\n div bx",0
  5923 00002C7C 2C20305C6E20646976-
  5924 00002C85 20627800           
  5925                                  
  5926                                  domod:  ; *** PROC ***
  5927                                  ;Function : domod, Number of local variables: 1
  5928                                  ;   # type sign width addr used name   list of local variables
  5929                                  ;  200 var sign word   559 NULL ids = bp+4;
  5930 00002C89 C8000000                 ENTER  0,0
  5931 00002C8D FF7604                   push word [bp+4]
  5932 00002C90 E853FE                   call doidiv
  5933 00002C93 83C402                   add  sp, 2
  5934 00002C96 68[A12C]                 push domod_0
  5935 00002C99 E8BA18                   call prs
  5936 00002C9C 83C402                   add  sp, 2
  5937                                  
  5938                                  ;-560 
  5939                                  
  5940                                  
  5941                                  ;-561 int docalltype[10]; int docallvalue[10];
  5942 00002C9F C9                       LEAVE
  5943 00002CA0 C3                       ret
  5944                                  ; ENDP
  5945 00002CA1 5C6E206D6F76206178-     domod_0 db "\n mov ax, dx",0
  5946 00002CAA 2C20647800         
  5947                                  section .bss
  5948                                  absolute 53411
  5949 0000D0A3 <res 00000014>          docalltype resw 10
  5950                                  section .text
  5951                                  section .bss
  5952                                  absolute 53431
  5953 0000D0B7 <res 00000014>          docallvalue resw 10
  5954                                  section .text
  5955                                  
  5956                                  ;-562 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register
  5957                                  
  5958                                  section .bss
  5959                                  absolute 53451
  5960 0000D0CB <res 00000011>          procname resb 17
  5961                                  section .text
  5962                                  
  5963                                  ;-563 int docall1() {int i; int narg; int t0; int n0;  int sz32;
  5964                                  
  5965                                  
  5966                                  docall1:  ; *** PROC ***
  5967                                  
  5968                                  ;-564   narg=0;  sz32=0;
  5969                                  
  5970                                  ;Function : docall1, Number of local variables: 5
  5971                                  ;   # type sign width addr used name   list of local variables
  5972                                  ;  200 var sign word   563 NULL i = bp-2
  5973                                  ;  201 var sign word   563 NULL narg = bp-4
  5974                                  ;  202 var sign word   563 NULL t0 = bp-6
  5975                                  ;  203 var sign word   563 NULL n0 = bp-8
  5976                                  ;  204 var sign word   563 NULL sz32 = bp-10;
  5977 00002CAF C80A0000                 ENTER  10,0
  5978 00002CB3 B80000                   mov ax, 0
  5979 00002CB6 8946FC                   mov [bp-4], ax
  5980 00002CB9 B80000                   mov ax, 0
  5981 00002CBC 8946F6                   mov [bp-10], ax
  5982                                  
  5983                                  ;-565   checknamelen();
  5984                                  
  5985 00002CBF E875D7                   call checknamelen
  5986                                  
  5987                                  ;-566   strcpy(&procname, symbol);
  5988                                  
  5989 00002CC2 8D062B81                 lea  ax, [symbol]
  5990 00002CC6 50                       push ax
  5991 00002CC7 8D06CBD0                 lea  ax, [procname]
  5992 00002CCB 50                       push ax
  5993 00002CCC E897D4                   call strcpy
  5994 00002CCF 83C404                   add  sp, 4
  5995                                  
  5996                                  ;-567   storecall();
  5997                                  
  5998 00002CD2 E8EBDE                   call storecall
  5999                                  
  6000                                  ;-568   expect('(');
  6001                                  
  6002 00002CD5 6A28                     push 40
  6003 00002CD7 E86917                   call expect
  6004 00002CDA 83C402                   add  sp, 2
  6005                                  
  6006                                  ;-569 	if (istoken(')') ==0 ) {
  6007                                  
  6008 00002CDD 6A29                     push 41
  6009 00002CDF E83F17                   call istoken
  6010 00002CE2 83C402                   add  sp, 2
  6011 00002CE5 83F800                   cmp ax, 0
  6012 00002CE8 0F857802                 jne .docall1321
  6013                                  
  6014                                  ;-570 	  do { narg++;
  6015                                  
  6016                                  .docall1322:
  6017 00002CEC FF46FC                   inc  word[bp-4]
  6018                                  
  6019                                  ;-571 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;
  6020                                  
  6021 00002CEF 8B46FC                   mov ax, [bp-4]
  6022 00002CF2 83F809                   cmp ax, 9
  6023 00002CF5 0F8E0900                 jle .docall1323
  6024 00002CF9 68[A82F]                 push docall1_0
  6025 00002CFC E8421B                   call error1
  6026 00002CFF 83C402                   add  sp, 2
  6027                                  .docall1323:
  6028 00002D02 B80000                   mov ax, 0
  6029 00002D05 8946FA                   mov [bp-6], ax
  6030                                  
  6031                                  ;-572       if(istoken(T_CONST)) {t0=1; n0=lexval; }
  6032                                  
  6033 00002D08 680101                   push 257
  6034 00002D0B E81317                   call istoken
  6035 00002D0E 83C402                   add  sp, 2
  6036 00002D11 08C0                     or  al, al
  6037 00002D13 0F840C00                 je .docall1324
  6038 00002D17 B80100                   mov ax, 1
  6039 00002D1A 8946FA                   mov [bp-6], ax
  6040 00002D1D A1[2E00]                 mov ax, [lexval]
  6041 00002D20 8946F8                   mov [bp-8], ax
  6042                                  
  6043                                  ;-573       if(istoken(T_STRING)){t0=2; n0=nconst;
  6044                                  
  6045                                  .docall1324:
  6046 00002D23 680201                   push 258
  6047 00002D26 E8F816                   call istoken
  6048 00002D29 83C402                   add  sp, 2
  6049 00002D2C 08C0                     or  al, al
  6050 00002D2E 0F846300                 je .docall1325
  6051 00002D32 B80200                   mov ax, 2
  6052 00002D35 8946FA                   mov [bp-6], ax
  6053 00002D38 A1[2400]                 mov ax, [nconst]
  6054 00002D3B 8946F8                   mov [bp-8], ax
  6055                                  
  6056                                  ;-574         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");
  6057                                  
  6058 00002D3E 68[BA2F]                 push docall1_1
  6059 00002D41 E87D17                   call eprs
  6060 00002D44 83C402                   add  sp, 2
  6061 00002D47 8D06AB81                 lea  ax, [fname]
  6062 00002D4B 50                       push ax
  6063 00002D4C E87217                   call eprs
  6064 00002D4F 83C402                   add  sp, 2
  6065 00002D52 6A5F                     push 95
  6066 00002D54 E85717                   call eprc
  6067 00002D57 83C402                   add  sp, 2
  6068 00002D5A FF36[2400]               push word [nconst]
  6069 00002D5E E88918                   call eprnum
  6070 00002D61 83C402                   add  sp, 2
  6071 00002D64 68[BD2F]                 push docall1_2
  6072 00002D67 E85717                   call eprs
  6073 00002D6A 83C402                   add  sp, 2
  6074                                  
  6075                                  ;-575         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }
  6076                                  
  6077 00002D6D 6A22                     push 34
  6078 00002D6F E83C17                   call eprc
  6079 00002D72 83C402                   add  sp, 2
  6080 00002D75 8D062B81                 lea  ax, [symbol]
  6081 00002D79 50                       push ax
  6082 00002D7A E84417                   call eprs
  6083 00002D7D 83C402                   add  sp, 2
  6084 00002D80 6A22                     push 34
  6085 00002D82 E82917                   call eprc
  6086 00002D85 83C402                   add  sp, 2
  6087 00002D88 68[C22F]                 push docall1_3
  6088 00002D8B E83317                   call eprs
  6089 00002D8E 83C402                   add  sp, 2
  6090 00002D91 FF06[2400]               inc  word[nconst]
  6091                                  
  6092                                  ;-576       if(istoken('&'))     {t0=3; name1(); n0=searchname();}
  6093                                  
  6094                                  .docall1325:
  6095 00002D95 6A26                     push 38
  6096 00002D97 E88716                   call istoken
  6097 00002D9A 83C402                   add  sp, 2
  6098 00002D9D 08C0                     or  al, al
  6099 00002D9F 0F840F00                 je .docall1326
  6100 00002DA3 B80300                   mov ax, 3
  6101 00002DA6 8946FA                   mov [bp-6], ax
  6102 00002DA9 E8ECDD                   call name1
  6103 00002DAC E841DC                   call searchname
  6104 00002DAF 8946F8                   mov [bp-8], ax
  6105                                  
  6106                                  ;-577       if(istoken(T_NAME))  { n0=checkreg();
  6107                                  
  6108                                  .docall1326:
  6109 00002DB2 680001                   push 256
  6110 00002DB5 E86916                   call istoken
  6111 00002DB8 83C402                   add  sp, 2
  6112 00002DBB 08C0                     or  al, al
  6113 00002DBD 0F844800                 je .docall1327
  6114 00002DC1 E8DFEA                   call checkreg
  6115 00002DC4 8946F8                   mov [bp-8], ax
  6116                                  
  6117                                  ;-578         if (n0) t0=5;
  6118                                  
  6119 00002DC7 8B46F8                   mov ax, [bp-8]
  6120 00002DCA 08C0                     or  al, al
  6121 00002DCC 0F840900                 je .docall1328
  6122 00002DD0 B80500                   mov ax, 5
  6123 00002DD3 8946FA                   mov [bp-6], ax
  6124                                  
  6125                                  ;-579         else {t0=4; n0=searchname();
  6126                                  
  6127 00002DD6 E93000                   jmp .docall1329
  6128                                  .docall1328:
  6129 00002DD9 B80400                   mov ax, 4
  6130 00002DDC 8946FA                   mov [bp-6], ax
  6131 00002DDF E80EDC                   call searchname
  6132 00002DE2 8946F8                   mov [bp-8], ax
  6133                                  
  6134                                  ;-580           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }
  6135                                  
  6136 00002DE5 B8B782                   mov ax, GType
  6137 00002DE8 A3[6C00]                 mov word [p1], ax
  6138 00002DEB A1[6C00]                 mov ax, [p1]
  6139 00002DEE 0346F8                   add ax, [bp-8]
  6140 00002DF1 A3[6C00]                 mov word [p1], ax
  6141 00002DF4 8B1E[6C00]               mov bx, [p1]
  6142 00002DF8 8A07                     mov al, [bx]
  6143 00002DFA B400                     mov ah, 0
  6144 00002DFC 83F826                   cmp ax, 38
  6145 00002DFF 0F850600                 jne .docall1330
  6146 00002E03 B80300                   mov ax, 3
  6147 00002E06 8946FA                   mov [bp-6], ax
  6148                                  .docall1330:
  6149                                  .docall1329:
  6150                                  
  6151                                  ;-581       if (t0==0) error1("parameter not recognized (no * allowed)");
  6152                                  
  6153                                  .docall1327:
  6154 00002E09 8B46FA                   mov ax, [bp-6]
  6155 00002E0C 83F800                   cmp ax, 0
  6156 00002E0F 0F850900                 jne .docall1331
  6157 00002E13 68[C52F]                 push docall1_4
  6158 00002E16 E8281A                   call error1
  6159 00002E19 83C402                   add  sp, 2
  6160                                  
  6161                                  ;-582       docalltype [narg] = t0;
  6162                                  
  6163                                  .docall1331:
  6164 00002E1C 8B46FA                   mov ax, [bp-6]
  6165 00002E1F 8B5EFC                   mov bx, [bp-4]
  6166 00002E22 D1E3                     shl bx, 1
  6167 00002E24 8987A3D0                 mov [docalltype+bx], ax
  6168                                  
  6169                                  ;-583       docallvalue[narg] = n0;
  6170                                  
  6171 00002E28 8B46F8                   mov ax, [bp-8]
  6172 00002E2B 8B5EFC                   mov bx, [bp-4]
  6173 00002E2E D1E3                     shl bx, 1
  6174 00002E30 8987B7D0                 mov [docallvalue+bx], ax
  6175                                  
  6176                                  ;-584     } while (istoken(','));
  6177                                  
  6178 00002E34 6A2C                     push 44
  6179 00002E36 E8E815                   call istoken
  6180 00002E39 83C402                   add  sp, 2
  6181 00002E3C 08C0                     or  al, al
  6182 00002E3E 0F840300                 je .docall1332
  6183 00002E42 E9A7FE                   jmp .docall1322
  6184                                  .docall1332:
  6185                                  
  6186                                  ;-585     
  6187                                  
  6188                                  
  6189                                  ;-586   	expect(')');  i=narg;
  6190                                  
  6191 00002E45 6A29                     push 41
  6192 00002E47 E8F915                   call expect
  6193 00002E4A 83C402                   add  sp, 2
  6194 00002E4D 8B46FC                   mov ax, [bp-4]
  6195 00002E50 8946FE                   mov [bp-2], ax
  6196                                  
  6197                                  ;-587     do {
  6198                                  
  6199                                  .docall1333:
  6200                                  
  6201                                  ;-588       t0 = docalltype [i];
  6202                                  
  6203 00002E53 8B5EFE                   mov bx, [bp-2]
  6204 00002E56 D1E3                     shl bx, 1
  6205 00002E58 8B87A3D0                 mov ax, [docalltype + bx]
  6206 00002E5C 8946FA                   mov [bp-6], ax
  6207                                  
  6208                                  ;-589       n0 = docallvalue[i];     
  6209                                  
  6210 00002E5F 8B5EFE                   mov bx, [bp-2]
  6211 00002E62 D1E3                     shl bx, 1
  6212 00002E64 8B87B7D0                 mov ax, [docallvalue + bx]
  6213 00002E68 8946F8                   mov [bp-8], ax
  6214                                  
  6215                                  ;-590       if(t0==1){ prs("\n push "); pint1(n0);}
  6216                                  
  6217 00002E6B 8B46FA                   mov ax, [bp-6]
  6218 00002E6E 83F801                   cmp ax, 1
  6219 00002E71 0F851200                 jne .docall1334
  6220 00002E75 68[ED2F]                 push docall1_5
  6221 00002E78 E8DB16                   call prs
  6222 00002E7B 83C402                   add  sp, 2
  6223 00002E7E FF76F8                   push word [bp-8]
  6224 00002E81 E8C917                   call pint1
  6225 00002E84 83C402                   add  sp, 2
  6226                                  
  6227                                  ;-591       if(t0==2){ prs("\n push "); 
  6228                                  
  6229                                  .docall1334:
  6230 00002E87 8B46FA                   mov ax, [bp-6]
  6231 00002E8A 83F802                   cmp ax, 2
  6232 00002E8D 0F852500                 jne .docall1335
  6233 00002E91 68[F62F]                 push docall1_6
  6234 00002E94 E8BF16                   call prs
  6235 00002E97 83C402                   add  sp, 2
  6236                                  
  6237                                  ;-592         prs(fname);prc(95);pint1(n0);}
  6238                                  
  6239 00002E9A 8D06AB81                 lea  ax, [fname]
  6240 00002E9E 50                       push ax
  6241 00002E9F E8B416                   call prs
  6242 00002EA2 83C402                   add  sp, 2
  6243 00002EA5 6A5F                     push 95
  6244 00002EA7 E84516                   call prc
  6245 00002EAA 83C402                   add  sp, 2
  6246 00002EAD FF76F8                   push word [bp-8]
  6247 00002EB0 E89A17                   call pint1
  6248 00002EB3 83C402                   add  sp, 2
  6249                                  
  6250                                  ;-593       if(t0==3){ prs("\n lea  ax, ");   v(n0);
  6251                                  
  6252                                  .docall1335:
  6253 00002EB6 8B46FA                   mov ax, [bp-6]
  6254 00002EB9 83F803                   cmp ax, 3
  6255 00002EBC 0F851B00                 jne .docall1336
  6256 00002EC0 68[FF2F]                 push docall1_7
  6257 00002EC3 E89016                   call prs
  6258 00002EC6 83C402                   add  sp, 2
  6259 00002EC9 FF76F8                   push word [bp-8]
  6260 00002ECC E835D5                   call v
  6261 00002ECF 83C402                   add  sp, 2
  6262                                  
  6263                                  ;-594         prs("\n push ax");}
  6264                                  
  6265 00002ED2 68[0C30]                 push docall1_8
  6266 00002ED5 E87E16                   call prs
  6267 00002ED8 83C402                   add  sp, 2
  6268                                  
  6269                                  ;-595       if(t0==4){ gettypes(n0); 
  6270                                  
  6271                                  .docall1336:
  6272 00002EDB 8B46FA                   mov ax, [bp-6]
  6273 00002EDE 83F804                   cmp ax, 4
  6274 00002EE1 0F854300                 jne .docall1337
  6275 00002EE5 FF76F8                   push word [bp-8]
  6276 00002EE8 E8C7D9                   call gettypes
  6277 00002EEB 83C402                   add  sp, 2
  6278                                  
  6279                                  ;-596         if(wi==2) { prs("\n push word "); v(n0);}
  6280                                  
  6281 00002EEE A1[3900]                 mov ax, [wi]
  6282 00002EF1 83F802                   cmp ax, 2
  6283 00002EF4 0F851500                 jne .docall1338
  6284 00002EF8 68[1730]                 push docall1_9
  6285 00002EFB E85816                   call prs
  6286 00002EFE 83C402                   add  sp, 2
  6287 00002F01 FF76F8                   push word [bp-8]
  6288 00002F04 E8FDD4                   call v
  6289 00002F07 83C402                   add  sp, 2
  6290                                  
  6291                                  ;-597         else { prs("\n mov al, byte ");   v(n0);
  6292                                  
  6293 00002F0A E91B00                   jmp .docall1339
  6294                                  .docall1338:
  6295 00002F0D 68[2530]                 push docall1_10
  6296 00002F10 E84316                   call prs
  6297 00002F13 83C402                   add  sp, 2
  6298 00002F16 FF76F8                   push word [bp-8]
  6299 00002F19 E8E8D4                   call v
  6300 00002F1C 83C402                   add  sp, 2
  6301                                  
  6302                                  ;-598         prs("\n mov ah, 0\n push ax"); } }
  6303                                  
  6304 00002F1F 68[3630]                 push docall1_11
  6305 00002F22 E83116                   call prs
  6306 00002F25 83C402                   add  sp, 2
  6307                                  .docall1339:
  6308                                  
  6309                                  ;-599       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }
  6310                                  
  6311                                  .docall1337:
  6312 00002F28 8B46FA                   mov ax, [bp-6]
  6313 00002F2B 83F805                   cmp ax, 5
  6314 00002F2E 0F852200                 jne .docall1340
  6315 00002F32 68[4D30]                 push docall1_12
  6316 00002F35 E81E16                   call prs
  6317 00002F38 83C402                   add  sp, 2
  6318 00002F3B FF76F8                   push word [bp-8]
  6319 00002F3E E870ED                   call printreg
  6320 00002F41 83C402                   add  sp, 2
  6321 00002F44 8B46F8                   mov ax, [bp-8]
  6322 00002F47 83F82F                   cmp ax, 47 ;unsigned : 1
  6323 00002F4A 0F8C0600                 jl  .docall1341
  6324 00002F4E 8B46F6                   mov ax, [bp-10]
  6325 00002F51 83C002                   add ax, 2
  6326                                  .docall1341:
  6327                                  
  6328                                  ;-600    i--; } while (i > 0);  }
  6329                                  
  6330                                  .docall1340:
  6331 00002F54 FF4EFE                   dec  word[bp-2]
  6332 00002F57 8B46FE                   mov ax, [bp-2]
  6333 00002F5A 83F800                   cmp ax, 0
  6334 00002F5D 0F8E0300                 jle .docall1342
  6335 00002F61 E9EFFE                   jmp .docall1333
  6336                                  .docall1342:
  6337                                  
  6338                                  ;-601 	 prs("\n call "); prs(&procname);
  6339                                  
  6340                                  .docall1321:
  6341 00002F64 68[5630]                 push docall1_13
  6342 00002F67 E8EC15                   call prs
  6343 00002F6A 83C402                   add  sp, 2
  6344 00002F6D 8D06CBD0                 lea  ax, [procname]
  6345 00002F71 50                       push ax
  6346 00002F72 E8E115                   call prs
  6347 00002F75 83C402                   add  sp, 2
  6348                                  
  6349                                  ;-602 	 if (narg>0) {prs("\n add  sp, ");
  6350                                  
  6351 00002F78 8B46FC                   mov ax, [bp-4]
  6352 00002F7B 83F800                   cmp ax, 0
  6353 00002F7E 0F8E2400                 jle .docall1343
  6354 00002F82 68[5F30]                 push docall1_14
  6355 00002F85 E8CE15                   call prs
  6356 00002F88 83C402                   add  sp, 2
  6357                                  
  6358                                  ;-603      narg=narg+narg; narg=narg+sz32; pint1(narg); } }
  6359                                  
  6360 00002F8B 8B46FC                   mov ax, [bp-4]
  6361 00002F8E 0346FC                   add ax, [bp-4]
  6362 00002F91 8946FC                   mov [bp-4], ax
  6363 00002F94 8B46FC                   mov ax, [bp-4]
  6364 00002F97 0346F6                   add ax, [bp-10]
  6365 00002F9A 8946FC                   mov [bp-4], ax
  6366 00002F9D FF76FC                   push word [bp-4]
  6367 00002FA0 E8AA16                   call pint1
  6368 00002FA3 83C402                   add  sp, 2
  6369                                  .docall1343:
  6370                                  
  6371                                  ;-604 /****************************************************************************/
  6372                                  
  6373                                  
  6374                                  ;-605 int main() {
  6375 00002FA6 C9                       LEAVE
  6376 00002FA7 C3                       ret
  6377                                  ; ENDP
  6378 00002FA8 4D61782E2039207061-     docall1_0 db "Max. 9 parameters",0
  6379 00002FB1 72616D657465727300 
  6380 00002FBA 5C6E00                  docall1_1 db "\n",0
  6381 00002FBD 2064622000              docall1_2 db " db ",0
  6382 00002FC2 2C3000                  docall1_3 db ",0",0
  6383 00002FC5 706172616D65746572-     docall1_4 db "parameter not recognized (no * allowed)",0
  6384 00002FCE 206E6F74207265636F-
  6385 00002FD7 676E697A656420286E-
  6386 00002FE0 6F202A20616C6C6F77-
  6387 00002FE9 65642900           
  6388 00002FED 5C6E20707573682000      docall1_5 db "\n push ",0
  6389 00002FF6 5C6E20707573682000      docall1_6 db "\n push ",0
  6390 00002FFF 5C6E206C6561202061-     docall1_7 db "\n lea  ax, ",0
  6391 00003008 782C2000           
  6392 0000300C 5C6E20707573682061-     docall1_8 db "\n push ax",0
  6393 00003015 7800               
  6394 00003017 5C6E20707573682077-     docall1_9 db "\n push word ",0
  6395 00003020 6F72642000         
  6396 00003025 5C6E206D6F7620616C-     docall1_10 db "\n mov al, byte ",0
  6397 0000302E 2C20627974652000   
  6398 00003036 5C6E206D6F76206168-     docall1_11 db "\n mov ah, 0\n push ax",0
  6399 0000303F 2C20305C6E20707573-
  6400 00003048 6820617800         
  6401 0000304D 5C6E20707573682000      docall1_12 db "\n push ",0
  6402 00003056 5C6E2063616C6C2000      docall1_13 db "\n call ",0
  6403 0000305F 5C6E20616464202073-     docall1_14 db "\n add  sp, ",0
  6404 00003068 702C2000           
  6405                                  
  6406                                  main:  ; *** PROC ***
  6407                                  
  6408                                  ;-606   getarg();
  6409                                  
  6410 0000306C E88700                   call getarg
  6411                                  
  6412                                  ;-607   setblock(4096);
  6413                                  
  6414 0000306F 680010                   push 4096
  6415 00003072 E8C122                   call setblock
  6416 00003075 83C402                   add  sp, 2
  6417                                  
  6418                                  ;-608   if (DOS_ERR) error1("SetBlock , AX=");
  6419                                  
  6420 00003078 A1[6E00]                 mov ax, [DOS_ERR]
  6421 0000307B 08C0                     or  al, al
  6422 0000307D 0F840900                 je .main344
  6423 00003081 68[BB30]                 push main_0
  6424 00003084 E8BA17                   call error1
  6425 00003087 83C402                   add  sp, 2
  6426                                  
  6427                                  ;-609   segE=allocmem(4096);
  6428                                  
  6429                                  .main344:
  6430 0000308A 680010                   push 4096
  6431 0000308D E8BF22                   call allocmem
  6432 00003090 83C402                   add  sp, 2
  6433 00003093 A3[6400]                 mov word [segE], ax
  6434                                  
  6435                                  ;-610   if (DOS_ERR)  error1("alloc memory, AX=");
  6436                                  
  6437 00003096 A1[6E00]                 mov ax, [DOS_ERR]
  6438 00003099 08C0                     or  al, al
  6439 0000309B 0F840900                 je .main345
  6440 0000309F 68[CA30]                 push main_1
  6441 000030A2 E89C17                   call error1
  6442 000030A5 83C402                   add  sp, 2
  6443                                  
  6444                                  ;-611   CNameTop=0;
  6445                                  
  6446                                  .main345:
  6447 000030A8 B80000                   mov ax, 0
  6448 000030AB A3[6000]                 mov word [CNameTop], ax
  6449                                  
  6450                                  ;-612   getfirstchar();
  6451                                  
  6452 000030AE E82B00                   call getfirstchar
  6453                                  
  6454                                  ;-613   parse();
  6455                                  
  6456 000030B1 E84B02                   call parse
  6457                                  
  6458                                  ;-614   checkcalls(); epilog();
  6459                                  
  6460 000030B4 E8DF02                   call checkcalls
  6461 000030B7 E8621E                   call epilog
  6462                                  
  6463                                  ;-615 }
  6464                                  
  6465                                  
  6466                                  ;-616 int getfirstchar() { fgetsp=&fgetsdest; *fgetsp=0; thechar=fgets1(); }
  6467                                  
  6468 000030BA C3                       ret
  6469                                  ; ENDP
  6470 000030BB 536574426C6F636B20-     main_0 db "SetBlock , AX=",0
  6471 000030C4 2C2041583D00       
  6472 000030CA 616C6C6F63206D656D-     main_1 db "alloc memory, AX=",0
  6473 000030D3 6F72792C2041583D00 
  6474                                  
  6475                                  getfirstchar:  ; *** PROC ***
  6476 000030DC B80FD0                   mov ax, fgetsdest
  6477 000030DF A3[6200]                 mov word [fgetsp], ax
  6478 000030E2 B80000                   mov ax, 0
  6479 000030E5 8B1E[6200]               mov  bx, [fgetsp]
  6480 000030E9 8807                     mov  [bx], al
  6481 000030EB E85B16                   call fgets1
  6482 000030EE A2[2100]                 mov byte [thechar], al
  6483                                  
  6484                                  ;-617 char *arglen=0x80; char *argv=0x82;
  6485                                  
  6486 000030F1 C3                       ret
  6487                                  ; ENDP
  6488 000030F2 8000                    arglen dw 128
  6489 000030F4 8200                    argv dw 130
  6490                                  
  6491                                  ;-618 int getarg() { int arglen1; int i; char *c;
  6492                                  
  6493                                  
  6494                                  getarg:  ; *** PROC ***
  6495                                  
  6496                                  ;-619   arglen1=*arglen;
  6497                                  
  6498                                  ;Function : getarg, Number of local variables: 3
  6499                                  ;   # type sign width addr used name   list of local variables
  6500                                  ;  200 var sign word   618 NULL arglen1 = bp-2
  6501                                  ;  201 var sign word   618 NULL i = bp-4
  6502                                  ;  202 ptr sign byte   618 NULL c = bp-6;
  6503 000030F6 C8060000                 ENTER  6,0
  6504 000030FA 8B1E[F230]               mov bx, [arglen]
  6505 000030FE 8A07                     mov al, [bx]
  6506 00003100 B400                     mov ah, 0
  6507 00003102 8946FE                   mov [bp-2], ax
  6508                                  
  6509                                  ;-620   if (arglen1) { i=arglen1+129; *i=0; }
  6510                                  
  6511 00003105 8B46FE                   mov ax, [bp-2]
  6512 00003108 08C0                     or  al, al
  6513 0000310A 0F841400                 je .getarg346
  6514 0000310E 8B46FE                   mov ax, [bp-2]
  6515 00003111 058100                   add ax, 129
  6516 00003114 8946FC                   mov [bp-4], ax
  6517 00003117 B80000                   mov ax, 0
  6518 0000311A 8B5EFC                   mov  bx, [bp-4]
  6519 0000311D 8907                     mov  [bx], ax
  6520                                  
  6521                                  ;-621   else { cputs(Version1); cputs(" Usage: A.COM in_file[.C]: ");
  6522                                  
  6523 0000311F E93900                   jmp .getarg347
  6524                                  .getarg346:
  6525 00003122 8D06[0300]               lea  ax, [Version1]
  6526 00003126 50                       push ax
  6527 00003127 E86ACF                   call cputs
  6528 0000312A 83C402                   add  sp, 2
  6529 0000312D 68[7632]                 push getarg_0
  6530 00003130 E861CF                   call cputs
  6531 00003133 83C402                   add  sp, 2
  6532                                  
  6533                                  ;-622     DOS_NoBytes=readRL(argv, 0, CMDLENMAX); c=DOS_NoBytes+128; *c=0; prnl(); }
  6534                                  
  6535 00003136 6A43                     push 67
  6536 00003138 6A00                     push 0
  6537 0000313A FF36[F430]               push word [argv]
  6538 0000313E E8D3CF                   call readRL
  6539 00003141 83C406                   add  sp, 6
  6540 00003144 A3[7000]                 mov word [DOS_NoBytes], ax
  6541 00003147 A1[7000]                 mov ax, [DOS_NoBytes]
  6542 0000314A 058000                   add ax, 128
  6543 0000314D 8946FA                   mov [bp-6], ax
  6544 00003150 B80000                   mov ax, 0
  6545 00003153 8B5EFA                   mov  bx, [bp-6]
  6546 00003156 8807                     mov  [bx], al
  6547 00003158 E8ED13                   call prnl
  6548                                  
  6549                                  ;-623   strcpy(namein, argv);
  6550                                  
  6551                                  .getarg347:
  6552 0000315B FF36[F430]               push word [argv]
  6553 0000315F 8D06EE81                 lea  ax, [namein]
  6554 00003163 50                       push ax
  6555 00003164 E8FFCF                   call strcpy
  6556 00003167 83C404                   add  sp, 4
  6557                                  
  6558                                  ;-624   if (instr2(namein, '.') == 0) strcat1(namein, ".C");
  6559                                  
  6560 0000316A 6A2E                     push 46
  6561 0000316C 8D06EE81                 lea  ax, [namein]
  6562 00003170 50                       push ax
  6563 00003171 E8A0D0                   call instr2
  6564 00003174 83C404                   add  sp, 4
  6565 00003177 83F800                   cmp ax, 0
  6566 0000317A 0F850E00                 jne .getarg348
  6567 0000317E 68[9232]                 push getarg_1
  6568 00003181 8D06EE81                 lea  ax, [namein]
  6569 00003185 50                       push ax
  6570 00003186 E8BDD0                   call strcat1
  6571 00003189 83C404                   add  sp, 4
  6572                                  
  6573                                  ;-625   toupper(namein);
  6574                                  
  6575                                  .getarg348:
  6576 0000318C 8D06EE81                 lea  ax, [namein]
  6577 00003190 50                       push ax
  6578 00003191 E8D7D0                   call toupper
  6579 00003194 83C402                   add  sp, 2
  6580                                  
  6581                                  ;-626   strcpy(namelst, namein); i=strlen(namelst); i--; c=&namelst+i; *c='S';
  6582                                  
  6583 00003197 8D06EE81                 lea  ax, [namein]
  6584 0000319B 50                       push ax
  6585 0000319C 8D063182                 lea  ax, [namelst]
  6586 000031A0 50                       push ax
  6587 000031A1 E8C2CF                   call strcpy
  6588 000031A4 83C404                   add  sp, 4
  6589 000031A7 8D063182                 lea  ax, [namelst]
  6590 000031AB 50                       push ax
  6591 000031AC E88FCF                   call strlen
  6592 000031AF 83C402                   add  sp, 2
  6593 000031B2 8946FC                   mov [bp-4], ax
  6594 000031B5 FF4EFC                   dec  word[bp-4]
  6595 000031B8 B83182                   mov ax, namelst
  6596 000031BB 0346FC                   add ax, [bp-4]
  6597 000031BE 8946FA                   mov [bp-6], ax
  6598 000031C1 B85300                   mov ax, 83
  6599 000031C4 8B5EFA                   mov  bx, [bp-6]
  6600 000031C7 8807                     mov  [bx], al
  6601                                  
  6602                                  ;-627  
  6603                                  
  6604                                  
  6605                                  ;-628   fdin=openR (namein);
  6606                                  
  6607 000031C9 8D06EE81                 lea  ax, [namein]
  6608 000031CD 50                       push ax
  6609 000031CE E805CF                   call openR
  6610 000031D1 83C402                   add  sp, 2
  6611 000031D4 A3[1800]                 mov word [fdin], ax
  6612                                  
  6613                                  ;-629   if(DOS_ERR){cputs("Source file missing (.C): "); cputs(namein); exitR(1); }
  6614                                  
  6615 000031D7 A1[6E00]                 mov ax, [DOS_ERR]
  6616 000031DA 08C0                     or  al, al
  6617 000031DC 0F841C00                 je .getarg349
  6618 000031E0 68[9532]                 push getarg_2
  6619 000031E3 E8AECE                   call cputs
  6620 000031E6 83C402                   add  sp, 2
  6621 000031E9 8D06EE81                 lea  ax, [namein]
  6622 000031ED 50                       push ax
  6623 000031EE E8A3CE                   call cputs
  6624 000031F1 83C402                   add  sp, 2
  6625 000031F4 6A01                     push 1
  6626 000031F6 E80DCF                   call exitR
  6627 000031F9 83C402                   add  sp, 2
  6628                                  
  6629                                  ;-630   fdout=creatR(namelst);
  6630                                  
  6631                                  .getarg349:
  6632 000031FC 8D063182                 lea  ax, [namelst]
  6633 00003200 50                       push ax
  6634 00003201 E8E1CE                   call creatR
  6635 00003204 83C402                   add  sp, 2
  6636 00003207 A3[1A00]                 mov word [fdout], ax
  6637                                  
  6638                                  ;-631   if(DOS_ERR){cputs("list file not creatable: ");cputs(namelst);exitR(2);}
  6639                                  
  6640 0000320A A1[6E00]                 mov ax, [DOS_ERR]
  6641 0000320D 08C0                     or  al, al
  6642 0000320F 0F841C00                 je .getarg350
  6643 00003213 68[B032]                 push getarg_3
  6644 00003216 E87BCE                   call cputs
  6645 00003219 83C402                   add  sp, 2
  6646 0000321C 8D063182                 lea  ax, [namelst]
  6647 00003220 50                       push ax
  6648 00003221 E870CE                   call cputs
  6649 00003224 83C402                   add  sp, 2
  6650 00003227 6A02                     push 2
  6651 00003229 E8DACE                   call exitR
  6652 0000322C 83C402                   add  sp, 2
  6653                                  
  6654                                  ;-632   prs("\n; ");prs(Version1);
  6655                                  
  6656                                  .getarg350:
  6657 0000322F 68[CA32]                 push getarg_4
  6658 00003232 E82113                   call prs
  6659 00003235 83C402                   add  sp, 2
  6660 00003238 8D06[0300]               lea  ax, [Version1]
  6661 0000323C 50                       push ax
  6662 0000323D E81613                   call prs
  6663 00003240 83C402                   add  sp, 2
  6664                                  
  6665                                  ;-633   prs(", Source: "); prs(namein);  prs(", Output asm: "); prs(namelst);
  6666                                  
  6667 00003243 68[CF32]                 push getarg_5
  6668 00003246 E80D13                   call prs
  6669 00003249 83C402                   add  sp, 2
  6670 0000324C 8D06EE81                 lea  ax, [namein]
  6671 00003250 50                       push ax
  6672 00003251 E80213                   call prs
  6673 00003254 83C402                   add  sp, 2
  6674 00003257 68[DA32]                 push getarg_6
  6675 0000325A E8F912                   call prs
  6676 0000325D 83C402                   add  sp, 2
  6677 00003260 8D063182                 lea  ax, [namelst]
  6678 00003264 50                       push ax
  6679 00003265 E8EE12                   call prs
  6680 00003268 83C402                   add  sp, 2
  6681                                  
  6682                                  ;-634   prs("\norg  256 \njmp main"); 
  6683                                  
  6684 0000326B 68[E932]                 push getarg_7
  6685 0000326E E8E512                   call prs
  6686 00003271 83C402                   add  sp, 2
  6687                                  
  6688                                  ;-635 }
  6689                                  
  6690                                  
  6691                                  ;-636 int parse() { token=getlex(); do {
  6692 00003274 C9                       LEAVE
  6693 00003275 C3                       ret
  6694                                  ; ENDP
  6695 00003276 2055736167653A2041-     getarg_0 db " Usage: A.COM in_file[.C]: ",0
  6696 0000327F 2E434F4D20696E5F66-
  6697 00003288 696C655B2E435D3A20-
  6698 00003291 00                 
  6699 00003292 2E4300                  getarg_1 db ".C",0
  6700 00003295 536F75726365206669-     getarg_2 db "Source file missing (.C): ",0
  6701 0000329E 6C65206D697373696E-
  6702 000032A7 6720282E43293A2000 
  6703 000032B0 6C6973742066696C65-     getarg_3 db "list file not creatable: ",0
  6704 000032B9 206E6F742063726561-
  6705 000032C2 7461626C653A2000   
  6706 000032CA 5C6E3B2000              getarg_4 db "\n; ",0
  6707 000032CF 2C20536F757263653A-     getarg_5 db ", Source: ",0
  6708 000032D8 2000               
  6709 000032DA 2C204F757470757420-     getarg_6 db ", Output asm: ",0
  6710 000032E3 61736D3A2000       
  6711 000032E9 5C6E6F726720203235-     getarg_7 db "\norg  256 \njmp main",0
  6712 000032F2 36205C6E6A6D70206D-
  6713 000032FB 61696E00           
  6714                                  
  6715                                  parse:  ; *** PROC ***
  6716 000032FF E8FB09                   call getlex
  6717 00003302 A3[1C00]                 mov word [token], ax
  6718                                  .parse351:
  6719                                  
  6720                                  ;-637     if (token <= 0) return 1;
  6721                                  
  6722 00003305 A1[1C00]                 mov ax, [token]
  6723 00003308 83F800                   cmp ax, 0
  6724 0000330B 0F8F0600                 jg  .parse352
  6725 0000330F B80100                   mov ax, 1
  6726 00003312 E96500                   jmp .retn
  6727                                  
  6728                                  ;-638     if (istoken('#')) {
  6729                                  
  6730                                  .parse352:
  6731 00003315 6A23                     push 35
  6732 00003317 E80711                   call istoken
  6733 0000331A 83C402                   add  sp, 2
  6734 0000331D 08C0                     or  al, al
  6735 0000331F 0F843600                 je .parse353
  6736                                  
  6737                                  ;-639       if (istoken(T_DEFINE)) dodefine();
  6738                                  
  6739 00003323 68FF01                   push 511
  6740 00003326 E8F810                   call istoken
  6741 00003329 83C402                   add  sp, 2
  6742 0000332C 08C0                     or  al, al
  6743 0000332E 0F840600                 je .parse354
  6744 00003332 E8A702                   call dodefine
  6745                                  
  6746                                  ;-640       else if (istoken(T_INCLUDE)) doinclude();
  6747                                  
  6748 00003335 E91E00                   jmp .parse355
  6749                                  .parse354:
  6750 00003338 68FE01                   push 510
  6751 0000333B E8E310                   call istoken
  6752 0000333E 83C402                   add  sp, 2
  6753 00003341 08C0                     or  al, al
  6754 00003343 0F840600                 je .parse356
  6755 00003347 E8AC01                   call doinclude
  6756                                  
  6757                                  ;-641       else error1("define or include expected");  }
  6758                                  
  6759 0000334A E90900                   jmp .parse357
  6760                                  .parse356:
  6761 0000334D 68[7B33]                 push parse_0
  6762 00003350 E8EE14                   call error1
  6763 00003353 83C402                   add  sp, 2
  6764                                  .parse357:
  6765                                  .parse355:
  6766                                  
  6767                                  ;-642     else{ typeName();  if (token=='(') dofunc();  else doglob(); }
  6768                                  
  6769 00003356 E91600                   jmp .parse358
  6770                                  .parse353:
  6771 00003359 E863D7                   call typeName
  6772 0000335C A1[1C00]                 mov ax, [token]
  6773 0000335F 83F828                   cmp ax, 40
  6774 00003362 0F850600                 jne .parse359
  6775 00003366 E86ADA                   call dofunc
  6776 00003369 E90300                   jmp .parse360
  6777                                  .parse359:
  6778 0000336C E814D1                   call doglob
  6779                                  .parse360:
  6780                                  
  6781                                  ;-643   } while(1);
  6782                                  
  6783                                  .parse358:
  6784 0000336F B80100                   mov ax, 1
  6785 00003372 08C0                     or  al, al
  6786 00003374 0F840200                 je .parse361
  6787 00003378 EB8B                     jmp .parse351
  6788                                  .parse361:
  6789                                  
  6790                                  ;-644 }
  6791                                  
  6792                                  
  6793                                  ;-645 int checkcalls() { int i; int j; int k;
  6794                                  
  6795                                   .retn:
  6796 0000337A C3                       ret
  6797                                  ; ENDP
  6798 0000337B 646566696E65206F72-     parse_0 db "define or include expected",0
  6799 00003384 20696E636C75646520-
  6800 0000338D 657870656374656400 
  6801                                  
  6802                                  checkcalls:  ; *** PROC ***
  6803                                  
  6804                                  ;-646   prs("\n \n; missing functions: ");
  6805                                  
  6806                                  ;Function : checkcalls, Number of local variables: 3
  6807                                  ;   # type sign width addr used name   list of local variables
  6808                                  ;  200 var sign word   645 NULL i = bp-2
  6809                                  ;  201 var sign word   645 NULL j = bp-4
  6810                                  ;  202 var sign word   645 NULL k = bp-6;
  6811 00003396 C8060000                 ENTER  6,0
  6812 0000339A 68[7C34]                 push checkcalls_0
  6813 0000339D E8B611                   call prs
  6814 000033A0 83C402                   add  sp, 2
  6815                                  
  6816                                  ;-647   i=0;  k=0;
  6817                                  
  6818 000033A3 B80000                   mov ax, 0
  6819 000033A6 8946FE                   mov [bp-2], ax
  6820 000033A9 B80000                   mov ax, 0
  6821 000033AC 8946FA                   mov [bp-6], ax
  6822                                  
  6823                                  ;-648   while (i < CTop) {
  6824                                  
  6825                                  .checkcalls362:
  6826 000033AF 8B46FE                   mov ax, [bp-2]
  6827 000033B2 3B06[3D00]               cmp ax, [CTop]
  6828 000033B6 0F8D8F00                 jge .checkcalls363
  6829                                  
  6830                                  ;-649     pt=CAdr[i];
  6831                                  
  6832 000033BA 8B5EFE                   mov bx, [bp-2]
  6833 000033BD D1E3                     shl bx, 1
  6834 000033BF 8B8757AB                 mov ax, [CAdr + bx]
  6835 000033C3 A3[6A00]                 mov word [pt], ax
  6836                                  
  6837                                  ;-650     from_far(NameA, pt);
  6838                                  
  6839 000033C6 FF36[6A00]               push word [pt]
  6840 000033CA 8D06[3F00]               lea  ax, [NameA]
  6841 000033CE 50                       push ax
  6842 000033CF E8E41F                   call from_far
  6843 000033D2 83C404                   add  sp, 4
  6844                                  
  6845                                  ;-651     j=0;
  6846                                  
  6847 000033D5 B80000                   mov ax, 0
  6848 000033D8 8946FC                   mov [bp-4], ax
  6849                                  
  6850                                  ;-652     do { p1=adrF(FNameField, j);
  6851                                  
  6852                                  .checkcalls364:
  6853 000033DB FF76FC                   push word [bp-4]
  6854 000033DE 8D064FBD                 lea  ax, [FNameField]
  6855 000033E2 50                       push ax
  6856 000033E3 E897D5                   call adrF
  6857 000033E6 83C404                   add  sp, 4
  6858 000033E9 A3[6C00]                 mov word [p1], ax
  6859                                  
  6860                                  ;-653       if (eqstr(NameA, p1)){ CType[i]=1; j=FTop; }
  6861                                  
  6862 000033EC FF36[6C00]               push word [p1]
  6863 000033F0 8D06[3F00]               lea  ax, [NameA]
  6864 000033F4 50                       push ax
  6865 000033F5 E89ECD                   call eqstr
  6866 000033F8 83C404                   add  sp, 4
  6867 000033FB 08C0                     or  al, al
  6868 000033FD 0F841000                 je .checkcalls365
  6869 00003401 B80100                   mov ax, 1
  6870 00003404 8B5EFE                   mov bx, [bp-2]
  6871 00003407 88872FA1                 mov [CType+bx], al
  6872 0000340B A1[3B00]                 mov ax, [FTop]
  6873 0000340E 8946FC                   mov [bp-4], ax
  6874                                  
  6875                                  ;-654       j++; } while (j < FTop);
  6876                                  
  6877                                  .checkcalls365:
  6878 00003411 FF46FC                   inc  word[bp-4]
  6879 00003414 8B46FC                   mov ax, [bp-4]
  6880 00003417 3B06[3B00]               cmp ax, [FTop]
  6881 0000341B 0F8D0200                 jge .checkcalls366
  6882 0000341F EBBA                     jmp .checkcalls364
  6883                                  .checkcalls366:
  6884                                  
  6885                                  ;-655     if (j == FTop) { k++; prs("\n; "); prs(NameA); }
  6886                                  
  6887 00003421 8B46FC                   mov ax, [bp-4]
  6888 00003424 3B06[3B00]               cmp ax, [FTop]
  6889 00003428 0F851700                 jne .checkcalls367
  6890 0000342C FF46FA                   inc  word[bp-6]
  6891 0000342F 68[9734]                 push checkcalls_1
  6892 00003432 E82111                   call prs
  6893 00003435 83C402                   add  sp, 2
  6894 00003438 8D06[3F00]               lea  ax, [NameA]
  6895 0000343C 50                       push ax
  6896 0000343D E81611                   call prs
  6897 00003440 83C402                   add  sp, 2
  6898                                  
  6899                                  ;-656     i++; }
  6900                                  
  6901                                  .checkcalls367:
  6902 00003443 FF46FE                   inc  word[bp-2]
  6903                                  
  6904                                  ;-657   prs("\n; Number of unresolved CALLs :"); printint51(k);
  6905                                  
  6906 00003446 E966FF                   jmp .checkcalls362
  6907                                  .checkcalls363:
  6908 00003449 68[9C34]                 push checkcalls_2
  6909 0000344C E80711                   call prs
  6910 0000344F 83C402                   add  sp, 2
  6911 00003452 FF76FA                   push word [bp-6]
  6912 00003455 E89A12                   call printint51
  6913 00003458 83C402                   add  sp, 2
  6914                                  
  6915                                  ;-658   if (k!=0) error1("At least 1 function is missing! "); 
  6916                                  
  6917 0000345B 8B46FA                   mov ax, [bp-6]
  6918 0000345E 83F800                   cmp ax, 0
  6919 00003461 0F840C00                 je  .checkcalls368
  6920 00003465 68[BD34]                 push checkcalls_3
  6921 00003468 E8D613                   call error1
  6922 0000346B 83C402                   add  sp, 2
  6923                                  
  6924                                  ;-659     else prs(" All FUNCTIONs in place");
  6925                                  
  6926 0000346E E90900                   jmp .checkcalls369
  6927                                  .checkcalls368:
  6928 00003471 68[DE34]                 push checkcalls_4
  6929 00003474 E8DF10                   call prs
  6930 00003477 83C402                   add  sp, 2
  6931                                  
  6932                                  ;-660 }
  6933                                  
  6934                                  .checkcalls369:
  6935                                  
  6936                                  ;-661 
  6937                                  
  6938                                  
  6939                                  ;-662 int doinclude() { int fdtemp;
  6940 0000347A C9                       LEAVE
  6941 0000347B C3                       ret
  6942                                  ; ENDP
  6943 0000347C 5C6E205C6E3B206D69-     checkcalls_0 db "\n \n; missing functions: ",0
  6944 00003485 7373696E672066756E-
  6945 0000348E 6374696F6E733A2000 
  6946 00003497 5C6E3B2000              checkcalls_1 db "\n; ",0
  6947 0000349C 5C6E3B204E756D6265-     checkcalls_2 db "\n; Number of unresolved CALLs :",0
  6948 000034A5 72206F6620756E7265-
  6949 000034AE 736F6C766564204341-
  6950 000034B7 4C4C73203A00       
  6951 000034BD 4174206C6561737420-     checkcalls_3 db "At least 1 function is missing! ",0
  6952 000034C6 312066756E6374696F-
  6953 000034CF 6E206973206D697373-
  6954 000034D8 696E67212000       
  6955 000034DE 20416C6C2046554E43-     checkcalls_4 db " All FUNCTIONs in place",0
  6956 000034E7 54494F4E7320696E20-
  6957 000034F0 706C61636500       
  6958                                  
  6959                                  doinclude:  ; *** PROC ***
  6960                                  
  6961                                  ;-663   if (token==T_STRING) {  fdtemp=fdin;
  6962                                  
  6963                                  ;Function : doinclude, Number of local variables: 1
  6964                                  ;   # type sign width addr used name   list of local variables
  6965                                  ;  200 var sign word   662 NULL fdtemp = bp-2;
  6966 000034F6 C8020000                 ENTER  2,0
  6967 000034FA A1[1C00]                 mov ax, [token]
  6968 000034FD 3D0201                   cmp ax, 258
  6969 00003500 0F858700                 jne .doinclude370
  6970 00003504 A1[1800]                 mov ax, [fdin]
  6971 00003507 8946FE                   mov [bp-2], ax
  6972                                  
  6973                                  ;-664   prs("\n;Use include file: "); prs(symbol);
  6974                                  
  6975 0000350A 68[8D35]                 push doinclude_0
  6976 0000350D E84610                   call prs
  6977 00003510 83C402                   add  sp, 2
  6978 00003513 8D062B81                 lea  ax, [symbol]
  6979 00003517 50                       push ax
  6980 00003518 E83B10                   call prs
  6981 0000351B 83C402                   add  sp, 2
  6982                                  
  6983                                  ;-665   fdin=openR(symbol);
  6984                                  
  6985 0000351E 8D062B81                 lea  ax, [symbol]
  6986 00003522 50                       push ax
  6987 00003523 E8B0CB                   call openR
  6988 00003526 83C402                   add  sp, 2
  6989 00003529 A3[1800]                 mov word [fdin], ax
  6990                                  
  6991                                  ;-666   if (DOS_ERR !=0) {prs("Include file missing: "); prs(symbol);
  6992                                  
  6993 0000352C A1[6E00]                 mov ax, [DOS_ERR]
  6994 0000352F 83F800                   cmp ax, 0
  6995 00003532 0F841D00                 je  .doinclude371
  6996 00003536 68[A335]                 push doinclude_1
  6997 00003539 E81A10                   call prs
  6998 0000353C 83C402                   add  sp, 2
  6999 0000353F 8D062B81                 lea  ax, [symbol]
  7000 00003543 50                       push ax
  7001 00003544 E80F10                   call prs
  7002 00003547 83C402                   add  sp, 2
  7003                                  
  7004                                  ;-667     error1(" Stop!!"); }
  7005                                  
  7006 0000354A 68[BA35]                 push doinclude_2
  7007 0000354D E8F112                   call error1
  7008 00003550 83C402                   add  sp, 2
  7009                                  
  7010                                  ;-668   linenoinclude=lineno; lineno=1;
  7011                                  
  7012                                  .doinclude371:
  7013 00003553 A1[6600]                 mov ax, [lineno]
  7014 00003556 A3[6800]                 mov word [linenoinclude], ax
  7015 00003559 B80100                   mov ax, 1
  7016 0000355C A3[6600]                 mov word [lineno], ax
  7017                                  
  7018                                  ;-669   parse(); lineno=linenoinclude;
  7019                                  
  7020 0000355F E89DFD                   call parse
  7021 00003562 A1[6800]                 mov ax, [linenoinclude]
  7022 00003565 A3[6600]                 mov word [lineno], ax
  7023                                  
  7024                                  ;-670   fdin=fdtemp; prs("\n;Back to main program: "); prs(namein);
  7025                                  
  7026 00003568 8B46FE                   mov ax, [bp-2]
  7027 0000356B A3[1800]                 mov word [fdin], ax
  7028 0000356E 68[C235]                 push doinclude_3
  7029 00003571 E8E20F                   call prs
  7030 00003574 83C402                   add  sp, 2
  7031 00003577 8D06EE81                 lea  ax, [namein]
  7032 0000357B 50                       push ax
  7033 0000357C E8D70F                   call prs
  7034 0000357F 83C402                   add  sp, 2
  7035                                  
  7036                                  ;-671   getfirstchar(); token=getlex(); }
  7037                                  
  7038 00003582 E857FB                   call getfirstchar
  7039 00003585 E87507                   call getlex
  7040 00003588 A3[1C00]                 mov word [token], ax
  7041                                  
  7042                                  ;-672 }
  7043                                  
  7044                                  .doinclude370:
  7045                                  
  7046                                  ;-673 int dodefine() { int i; int j; int fdtemp;
  7047 0000358B C9                       LEAVE
  7048 0000358C C3                       ret
  7049                                  ; ENDP
  7050 0000358D 5C6E3B55736520696E-     doinclude_0 db "\n;Use include file: ",0
  7051 00003596 636C7564652066696C-
  7052 0000359F 653A2000           
  7053 000035A3 496E636C7564652066-     doinclude_1 db "Include file missing: ",0
  7054 000035AC 696C65206D69737369-
  7055 000035B5 6E673A2000         
  7056 000035BA 2053746F70212100        doinclude_2 db " Stop!!",0
  7057 000035C2 5C6E3B4261636B2074-     doinclude_3 db "\n;Back to main program: ",0
  7058 000035CB 6F206D61696E207072-
  7059 000035D4 6F6772616D3A2000   
  7060                                  
  7061                                  dodefine:  ; *** PROC ***
  7062                                  
  7063                                  ;-674   if (eqstr(symbol, "ORGDATA")) {token=getlex();
  7064                                  
  7065                                  ;Function : dodefine, Number of local variables: 3
  7066                                  ;   # type sign width addr used name   list of local variables
  7067                                  ;  200 var sign word   673 NULL i = bp-2
  7068                                  ;  201 var sign word   673 NULL j = bp-4
  7069                                  ;  202 var sign word   673 NULL fdtemp = bp-6;
  7070 000035DC C8060000                 ENTER  6,0
  7071 000035E0 68[2337]                 push dodefine_0
  7072 000035E3 8D062B81                 lea  ax, [symbol]
  7073 000035E7 50                       push ax
  7074 000035E8 E8ABCB                   call eqstr
  7075 000035EB 83C404                   add  sp, 4
  7076 000035EE 08C0                     or  al, al
  7077 000035F0 0F841500                 je .dodefine372
  7078 000035F4 E80607                   call getlex
  7079 000035F7 A3[1C00]                 mov word [token], ax
  7080                                  
  7081                                  ;-675     ORGDATAORIG=lexval; orgData=lexval; return; }
  7082                                  
  7083 000035FA A1[2E00]                 mov ax, [lexval]
  7084 000035FD A3[0E00]                 mov word [ORGDATAORIG], ax
  7085 00003600 A1[2E00]                 mov ax, [lexval]
  7086 00003603 A3[1000]                 mov word [orgData], ax
  7087 00003606 E91801                   jmp .retn
  7088                                  
  7089                                  ;-676   if (eqstr(symbol, "ARCHIVE")){token=getlex();  if (token==T_STRING) {
  7090                                  
  7091                                  .dodefine372:
  7092 00003609 68[2B37]                 push dodefine_1
  7093 0000360C 8D062B81                 lea  ax, [symbol]
  7094 00003610 50                       push ax
  7095 00003611 E882CB                   call eqstr
  7096 00003614 83C404                   add  sp, 4
  7097 00003617 08C0                     or  al, al
  7098 00003619 0F844900                 je .dodefine373
  7099 0000361D E8DD06                   call getlex
  7100 00003620 A3[1C00]                 mov word [token], ax
  7101 00003623 A1[1C00]                 mov ax, [token]
  7102 00003626 3D0201                   cmp ax, 258
  7103 00003629 0F852700                 jne .dodefine374
  7104                                  
  7105                                  ;-677     prs("\n;Use archive file: ");
  7106                                  
  7107 0000362D 68[3337]                 push dodefine_2
  7108 00003630 E8230F                   call prs
  7109 00003633 83C402                   add  sp, 2
  7110                                  
  7111                                  ;-678     strcpy(archivename, symbol); prs(archivename);
  7112                                  
  7113 00003636 8D062B81                 lea  ax, [symbol]
  7114 0000363A 50                       push ax
  7115 0000363B 8D067482                 lea  ax, [archivename]
  7116 0000363F 50                       push ax
  7117 00003640 E823CB                   call strcpy
  7118 00003643 83C404                   add  sp, 4
  7119 00003646 8D067482                 lea  ax, [archivename]
  7120 0000364A 50                       push ax
  7121 0000364B E8080F                   call prs
  7122 0000364E 83C402                   add  sp, 2
  7123                                  
  7124                                  ;-679     } else error1("Name of archive file missing"); token=getlex(); return;}
  7125                                  
  7126 00003651 E90900                   jmp .dodefine375
  7127                                  .dodefine374:
  7128 00003654 68[4937]                 push dodefine_3
  7129 00003657 E8E711                   call error1
  7130 0000365A 83C402                   add  sp, 2
  7131                                  .dodefine375:
  7132 0000365D E89D06                   call getlex
  7133 00003660 A3[1C00]                 mov word [token], ax
  7134 00003663 E9BB00                   jmp .retn
  7135                                  
  7136                                  ;-680    expect(T_NAME);
  7137                                  
  7138                                  .dodefine373:
  7139 00003666 680001                   push 256
  7140 00003669 E8D70D                   call expect
  7141 0000366C 83C402                   add  sp, 2
  7142                                  
  7143                                  ;-681   if (token==T_CONST) { 
  7144                                  
  7145 0000366F A1[1C00]                 mov ax, [token]
  7146 00003672 3D0101                   cmp ax, 257
  7147 00003675 0F85A800                 jne .dodefine376
  7148                                  
  7149                                  ;-682     if (GTop >= LSTART) error1("global table (define) full");
  7150                                  
  7151 00003679 A1[2A00]                 mov ax, [GTop]
  7152 0000367C 3DC800                   cmp ax, 200 ;unsigned : 1
  7153 0000367F 0F8C0900                 jl  .dodefine377
  7154 00003683 68[6637]                 push dodefine_4
  7155 00003686 E8B811                   call error1
  7156 00003689 83C402                   add  sp, 2
  7157                                  
  7158                                  ;-683     i=strlen(symbol); if (i>15) error1("Define name longer 15 char");
  7159                                  
  7160                                  .dodefine377:
  7161 0000368C 8D062B81                 lea  ax, [symbol]
  7162 00003690 50                       push ax
  7163 00003691 E8AACA                   call strlen
  7164 00003694 83C402                   add  sp, 2
  7165 00003697 8946FE                   mov [bp-2], ax
  7166 0000369A 8B46FE                   mov ax, [bp-2]
  7167 0000369D 83F80F                   cmp ax, 15
  7168 000036A0 0F8E0900                 jle .dodefine378
  7169 000036A4 68[8137]                 push dodefine_5
  7170 000036A7 E89711                   call error1
  7171 000036AA 83C402                   add  sp, 2
  7172                                  
  7173                                  ;-684     GSign [GTop]='U'; GWidth[GTop]=1; GType [GTop]='#';
  7174                                  
  7175                                  .dodefine378:
  7176 000036AD B85500                   mov ax, 85
  7177 000036B0 8B1E[2A00]               mov bx, [GTop]
  7178 000036B4 8887E383                 mov [GSign+bx], al
  7179 000036B8 B80100                   mov ax, 1
  7180 000036BB 8B1E[2A00]               mov bx, [GTop]
  7181 000036BF 88870F85                 mov [GWidth+bx], al
  7182 000036C3 B82300                   mov ax, 35
  7183 000036C6 8B1E[2A00]               mov bx, [GTop]
  7184 000036CA 8887B782                 mov [GType+bx], al
  7185                                  
  7186                                  ;-685     GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  7187                                  
  7188 000036CE A1[6600]                 mov ax, [lineno]
  7189 000036D1 83E801                   sub ax, 1
  7190 000036D4 8B1E[2A00]               mov bx, [GTop]
  7191 000036D8 D1E3                     shl bx, 1
  7192 000036DA 89873B86                 mov [GAdr+bx], ax
  7193 000036DE B80000                   mov ax, 0
  7194 000036E1 8B1E[2A00]               mov bx, [GTop]
  7195 000036E5 D1E3                     shl bx, 1
  7196 000036E7 89879388                 mov [GUsed+bx], ax
  7197                                  
  7198                                  ;-686     pt=adrofname(GTop); strcpy(pt, symbol); GData[GTop]=lexval;
  7199                                  
  7200 000036EB FF36[2A00]               push word [GTop]
  7201 000036EF E877D2                   call adrofname
  7202 000036F2 83C402                   add  sp, 2
  7203 000036F5 A3[6A00]                 mov word [pt], ax
  7204 000036F8 8D062B81                 lea  ax, [symbol]
  7205 000036FC 50                       push ax
  7206 000036FD FF36[6A00]               push word [pt]
  7207 00003701 E862CA                   call strcpy
  7208 00003704 83C404                   add  sp, 4
  7209 00003707 A1[2E00]                 mov ax, [lexval]
  7210 0000370A 8B1E[2A00]               mov bx, [GTop]
  7211 0000370E D1E3                     shl bx, 1
  7212 00003710 8987EB8A                 mov [GData+bx], ax
  7213                                  
  7214                                  ;-687     expect(T_CONST); GTop++;  } 
  7215                                  
  7216 00003714 680101                   push 257
  7217 00003717 E8290D                   call expect
  7218 0000371A 83C402                   add  sp, 2
  7219 0000371D FF06[2A00]               inc  word[GTop]
  7220                                  
  7221                                  ;-688 }
  7222                                  
  7223                                  .dodefine376:
  7224                                  
  7225                                  ;-689 int stmt() { int c; char cha;
  7226                                  
  7227 00003721 C9                       .retn: LEAVE
  7228 00003722 C3                       ret
  7229                                  ; ENDP
  7230 00003723 4F52474441544100        dodefine_0 db "ORGDATA",0
  7231 0000372B 4152434849564500        dodefine_1 db "ARCHIVE",0
  7232 00003733 5C6E3B557365206172-     dodefine_2 db "\n;Use archive file: ",0
  7233 0000373C 63686976652066696C-
  7234 00003745 653A2000           
  7235 00003749 4E616D65206F662061-     dodefine_3 db "Name of archive file missing",0
  7236 00003752 726368697665206669-
  7237 0000375B 6C65206D697373696E-
  7238 00003764 6700               
  7239 00003766 676C6F62616C207461-     dodefine_4 db "global table (define) full",0
  7240 0000376F 626C65202864656669-
  7241 00003778 6E65292066756C6C00 
  7242 00003781 446566696E65206E61-     dodefine_5 db "Define name longer 15 char",0
  7243 0000378A 6D65206C6F6E676572-
  7244 00003793 203135206368617200 
  7245                                  
  7246                                  stmt:  ; *** PROC ***
  7247                                  
  7248                                  ;-690        if(istoken('{'))     {while(istoken('}')==0) stmt();}
  7249                                  
  7250                                  ;Function : stmt, Number of local variables: 2
  7251                                  ;   # type sign width addr used name   list of local variables
  7252                                  ;  200 var sign word   689 NULL c = bp-2
  7253                                  ;  201 var sign byte   689 NULL cha = bp-4;
  7254 0000379C C8040000                 ENTER  4,0
  7255 000037A0 6A7B                     push 123
  7256 000037A2 E87C0C                   call istoken
  7257 000037A5 83C402                   add  sp, 2
  7258 000037A8 08C0                     or  al, al
  7259 000037AA 0F841700                 je .stmt379
  7260                                  .stmt380:
  7261 000037AE 6A7D                     push 125
  7262 000037B0 E86E0C                   call istoken
  7263 000037B3 83C402                   add  sp, 2
  7264 000037B6 83F800                   cmp ax, 0
  7265 000037B9 0F850500                 jne .stmt381
  7266 000037BD E8DCFF                   call stmt
  7267 000037C0 EBEC                     jmp .stmt380
  7268                                  .stmt381:
  7269                                  
  7270                                  ;-691   else if(istoken(T_IF))    doif();
  7271                                  
  7272 000037C2 E9A501                   jmp .stmt382
  7273                                  .stmt379:
  7274 000037C5 680102                   push 513
  7275 000037C8 E8560C                   call istoken
  7276 000037CB 83C402                   add  sp, 2
  7277 000037CE 08C0                     or  al, al
  7278 000037D0 0F840600                 je .stmt383
  7279 000037D4 E8CC03                   call doif
  7280                                  
  7281                                  ;-692   else if(istoken(T_DO))    dodo();
  7282                                  
  7283 000037D7 E99001                   jmp .stmt384
  7284                                  .stmt383:
  7285 000037DA 680402                   push 516
  7286 000037DD E8410C                   call istoken
  7287 000037E0 83C402                   add  sp, 2
  7288 000037E3 08C0                     or  al, al
  7289 000037E5 0F840600                 je .stmt385
  7290 000037E9 E81904                   call dodo
  7291                                  
  7292                                  ;-693   else if(istoken(T_WHILE)) dowhile();
  7293                                  
  7294 000037EC E97B01                   jmp .stmt386
  7295                                  .stmt385:
  7296 000037EF 680302                   push 515
  7297 000037F2 E82C0C                   call istoken
  7298 000037F5 83C402                   add  sp, 2
  7299 000037F8 08C0                     or  al, al
  7300 000037FA 0F840600                 je .stmt387
  7301 000037FE E85104                   call dowhile
  7302                                  
  7303                                  ;-694   else if(istoken(T_GOTO))  {prs("\n jmp .");name1();prs(symbol);expect(';');}
  7304                                  
  7305 00003801 E96601                   jmp .stmt388
  7306                                  .stmt387:
  7307 00003804 680902                   push 521
  7308 00003807 E8170C                   call istoken
  7309 0000380A 83C402                   add  sp, 2
  7310 0000380D 08C0                     or  al, al
  7311 0000380F 0F842200                 je .stmt389
  7312 00003813 68[6C39]                 push stmt_0
  7313 00003816 E83D0D                   call prs
  7314 00003819 83C402                   add  sp, 2
  7315 0000381C E879D3                   call name1
  7316 0000381F 8D062B81                 lea  ax, [symbol]
  7317 00003823 50                       push ax
  7318 00003824 E82F0D                   call prs
  7319 00003827 83C402                   add  sp, 2
  7320 0000382A 6A3B                     push 59
  7321 0000382C E8140C                   call expect
  7322 0000382F 83C402                   add  sp, 2
  7323                                  
  7324                                  ;-695   else if(token==T_ASM)     {prs("\n"); c=next();
  7325                                  
  7326 00003832 E93501                   jmp .stmt390
  7327                                  .stmt389:
  7328 00003835 A1[1C00]                 mov ax, [token]
  7329 00003838 3D0602                   cmp ax, 518
  7330 0000383B 0F853300                 jne .stmt391
  7331 0000383F 68[7539]                 push stmt_1
  7332 00003842 E8110D                   call prs
  7333 00003845 83C402                   add  sp, 2
  7334 00003848 E8B80B                   call next
  7335 0000384B 8946FE                   mov [bp-2], ax
  7336                                  
  7337                                  ;-696         while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }
  7338                                  
  7339                                  .stmt392:
  7340 0000384E 8B46FE                   mov ax, [bp-2]
  7341 00003851 83F80A                   cmp ax, 10
  7342 00003854 0F841100                 je  .stmt393
  7343 00003858 FF76FE                   push word [bp-2]
  7344 0000385B E8910C                   call prc
  7345 0000385E 83C402                   add  sp, 2
  7346 00003861 E89F0B                   call next
  7347 00003864 8946FE                   mov [bp-2], ax
  7348 00003867 EBE5                     jmp .stmt392
  7349                                  .stmt393:
  7350 00003869 E89104                   call getlex
  7351 0000386C A3[1C00]                 mov word [token], ax
  7352                                  
  7353                                  ;-697   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();  
  7354                                  
  7355 0000386F E9F800                   jmp .stmt394
  7356                                  .stmt391:
  7357 00003872 680702                   push 519
  7358 00003875 E8A90B                   call istoken
  7359 00003878 83C402                   add  sp, 2
  7360 0000387B 08C0                     or  al, al
  7361 0000387D 0F844B00                 je .stmt395
  7362 00003881 A1[1C00]                 mov ax, [token]
  7363 00003884 83F87B                   cmp ax, 123
  7364 00003887 0F853500                 jne .stmt396
  7365 0000388B 68[7839]                 push stmt_2
  7366 0000388E E8C50C                   call prs
  7367 00003891 83C402                   add  sp, 2
  7368 00003894 E86C0B                   call next
  7369 00003897 8846FC                   mov [bp-4], al
  7370                                  
  7371                                  ;-698         while(cha!= '}') { prc(cha); cha=next(); }
  7372                                  
  7373                                  .stmt397:
  7374 0000389A 8A46FC                   mov al, [bp-4]
  7375 0000389D 3C7D                     cmp al, 125
  7376 0000389F 0F841400                 je  .stmt398
  7377 000038A3 8A46FC                   mov al, byte [bp-4]
  7378 000038A6 B400                     mov ah, 0
  7379 000038A8 50                       push ax
  7380 000038A9 E8430C                   call prc
  7381 000038AC 83C402                   add  sp, 2
  7382 000038AF E8510B                   call next
  7383 000038B2 8846FC                   mov [bp-4], al
  7384                                  
  7385                                  ;-699         token=getlex(); }
  7386                                  
  7387 000038B5 EBE3                     jmp .stmt397
  7388                                  .stmt398:
  7389 000038B7 E84304                   call getlex
  7390 000038BA A3[1C00]                 mov word [token], ax
  7391                                  
  7392                                  ;-700         else error1("Curly open expected"); 
  7393                                  
  7394 000038BD E90900                   jmp .stmt399
  7395                                  .stmt396:
  7396 000038C0 68[7B39]                 push stmt_3
  7397 000038C3 E87B0F                   call error1
  7398 000038C6 83C402                   add  sp, 2
  7399                                  
  7400                                  ;-701         }
  7401                                  
  7402                                  .stmt399:
  7403                                  
  7404                                  ;-702   else if(istoken(T_EMIT))   doemit();
  7405                                  
  7406 000038C9 E99E00                   jmp .stmt400
  7407                                  .stmt395:
  7408 000038CC 680802                   push 520
  7409 000038CF E84F0B                   call istoken
  7410 000038D2 83C402                   add  sp, 2
  7411 000038D5 08C0                     or  al, al
  7412 000038D7 0F840600                 je .stmt401
  7413 000038DB E8C200                   call doemit
  7414                                  
  7415                                  ;-703   else if(istoken(';'))      { }
  7416                                  
  7417 000038DE E98900                   jmp .stmt402
  7418                                  .stmt401:
  7419 000038E1 6A3B                     push 59
  7420 000038E3 E83B0B                   call istoken
  7421 000038E6 83C402                   add  sp, 2
  7422 000038E9 08C0                     or  al, al
  7423 000038EB 0F840300                 je .stmt403
  7424                                  
  7425                                  ;-704   else if(istoken(T_RETURN)) {
  7426                                  
  7427 000038EF E97800                   jmp .stmt404
  7428                                  .stmt403:
  7429 000038F2 680002                   push 512
  7430 000038F5 E8290B                   call istoken
  7431 000038F8 83C402                   add  sp, 2
  7432 000038FB 08C0                     or  al, al
  7433 000038FD 0F842500                 je .stmt405
  7434                                  
  7435                                  ;-705         if (token!=';') exprstart();
  7436                                  
  7437 00003901 A1[1C00]                 mov ax, [token]
  7438 00003904 83F83B                   cmp ax, 59
  7439 00003907 0F840300                 je  .stmt406
  7440 0000390B E852D9                   call exprstart
  7441                                  
  7442                                  ;-706         prs("\n jmp .retn"); 
  7443                                  
  7444                                  .stmt406:
  7445 0000390E 68[8F39]                 push stmt_4
  7446 00003911 E8420C                   call prs
  7447 00003914 83C402                   add  sp, 2
  7448                                  
  7449                                  ;-707         nreturn++; 
  7450                                  
  7451 00003917 FF06[2600]               inc  word[nreturn]
  7452                                  
  7453                                  ;-708         expect(';');
  7454                                  
  7455 0000391B 6A3B                     push 59
  7456 0000391D E8230B                   call expect
  7457 00003920 83C402                   add  sp, 2
  7458                                  
  7459                                  ;-709         }
  7460                                  
  7461                                  
  7462                                  ;-710   else if(thechar==':')      {
  7463                                  
  7464 00003923 E94400                   jmp .stmt407
  7465                                  .stmt405:
  7466 00003926 A0[2100]                 mov al, [thechar]
  7467 00003929 3C3A                     cmp al, 58
  7468 0000392B 0F853000                 jne .stmt408
  7469                                  
  7470                                  ;-711         prs("\n."); // Label
  7471                                  
  7472 0000392F 68[9C39]                 push stmt_5
  7473 00003932 E8210C                   call prs
  7474 00003935 83C402                   add  sp, 2
  7475                                  
  7476                                  ;-712         prs(symbol); prc(':');  
  7477                                  
  7478 00003938 8D062B81                 lea  ax, [symbol]
  7479 0000393C 50                       push ax
  7480 0000393D E8160C                   call prs
  7481 00003940 83C402                   add  sp, 2
  7482 00003943 6A3A                     push 58
  7483 00003945 E8A70B                   call prc
  7484 00003948 83C402                   add  sp, 2
  7485                                  
  7486                                  ;-713         expect(T_NAME); 
  7487                                  
  7488 0000394B 680001                   push 256
  7489 0000394E E8F20A                   call expect
  7490 00003951 83C402                   add  sp, 2
  7491                                  
  7492                                  ;-714         expect(':'); 
  7493                                  
  7494 00003954 6A3A                     push 58
  7495 00003956 E8EA0A                   call expect
  7496 00003959 83C402                   add  sp, 2
  7497                                  
  7498                                  ;-715         }
  7499                                  
  7500                                  
  7501                                  ;-716   else  {exprstart(); expect(';'); } 
  7502                                  
  7503 0000395C E90B00                   jmp .stmt409
  7504                                  .stmt408:
  7505 0000395F E8FED8                   call exprstart
  7506 00003962 6A3B                     push 59
  7507 00003964 E8DC0A                   call expect
  7508 00003967 83C402                   add  sp, 2
  7509                                  
  7510                                  ;-717 }
  7511                                  
  7512                                  .stmt409:
  7513                                  .stmt407:
  7514                                  .stmt404:
  7515                                  .stmt402:
  7516                                  .stmt400:
  7517                                  .stmt394:
  7518                                  .stmt390:
  7519                                  .stmt388:
  7520                                  .stmt386:
  7521                                  .stmt384:
  7522                                  .stmt382:
  7523                                  
  7524                                  ;-718 
  7525                                  
  7526                                  
  7527                                  ;-719 int doemit() {prs("\n db ");
  7528 0000396A C9                       LEAVE
  7529 0000396B C3                       ret
  7530                                  ; ENDP
  7531 0000396C 5C6E206A6D70202E00      stmt_0 db "\n jmp .",0
  7532 00003975 5C6E00                  stmt_1 db "\n",0
  7533 00003978 5C6E00                  stmt_2 db "\n",0
  7534 0000397B 4375726C79206F7065-     stmt_3 db "Curly open expected",0
  7535 00003984 6E2065787065637465-
  7536 0000398D 6400               
  7537 0000398F 5C6E206A6D70202E72-     stmt_4 db "\n jmp .retn",0
  7538 00003998 65746E00           
  7539 0000399C 5C6E2E00                stmt_5 db "\n.",0
  7540                                  
  7541                                  doemit:  ; *** PROC ***
  7542 000039A0 68[DC39]                 push doemit_0
  7543 000039A3 E8B00B                   call prs
  7544 000039A6 83C402                   add  sp, 2
  7545                                  
  7546                                  ;-720   L1: token=getlex(); prunsign1(lexval); token=getlex();
  7547                                  
  7548                                  .L1:
  7549 000039A9 E85103                   call getlex
  7550 000039AC A3[1C00]                 mov word [token], ax
  7551 000039AF FF36[2E00]               push word [lexval]
  7552 000039B3 E8FA0C                   call prunsign1
  7553 000039B6 83C402                   add  sp, 2
  7554 000039B9 E84103                   call getlex
  7555 000039BC A3[1C00]                 mov word [token], ax
  7556                                  
  7557                                  ;-721     if (token== ',') {prc(','); goto L1;} expect(')'); }
  7558                                  
  7559 000039BF A1[1C00]                 mov ax, [token]
  7560 000039C2 83F82C                   cmp ax, 44
  7561 000039C5 0F850A00                 jne .doemit410
  7562 000039C9 6A2C                     push 44
  7563 000039CB E8210B                   call prc
  7564 000039CE 83C402                   add  sp, 2
  7565 000039D1 EBD6                     jmp .L1
  7566                                  .doemit410:
  7567 000039D3 6A29                     push 41
  7568 000039D5 E86B0A                   call expect
  7569 000039D8 83C402                   add  sp, 2
  7570                                  
  7571                                  ;-722 
  7572                                  
  7573                                  
  7574                                  ;-723 int cmpneg(int ids) {
  7575                                  
  7576 000039DB C3                       ret
  7577                                  ; ENDP
  7578 000039DC 5C6E2064622000          doemit_0 db "\n db ",0
  7579                                  
  7580                                  cmpneg:  ; *** PROC ***
  7581                                  
  7582                                  ;-724        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
  7583                                  
  7584                                  ;Function : cmpneg, Number of local variables: 1
  7585                                  ;   # type sign width addr used name   list of local variables
  7586                                  ;  200 var sign word   723 NULL ids = bp+4;
  7587 000039E3 C8000000                 ENTER  0,0
  7588 000039E7 A1[2200]                 mov ax, [iscmp]
  7589 000039EA 3D2603                   cmp ax, 806
  7590 000039ED 0F850C00                 jne .cmpneg411
  7591 000039F1 68[C43A]                 push cmpneg_0
  7592 000039F4 E85F0B                   call prs
  7593 000039F7 83C402                   add  sp, 2
  7594                                  
  7595                                  ;-725   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1
  7596                                  
  7597 000039FA E9C500                   jmp .cmpneg412
  7598                                  .cmpneg411:
  7599 000039FD A1[2200]                 mov ax, [iscmp]
  7600 00003A00 3D2703                   cmp ax, 807
  7601 00003A03 0F850C00                 jne .cmpneg413
  7602 00003A07 68[CD3A]                 push cmpneg_1
  7603 00003A0A E8490B                   call prs
  7604 00003A0D 83C402                   add  sp, 2
  7605                                  
  7606                                  ;-726   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF
  7607                                  
  7608 00003A10 E9AF00                   jmp .cmpneg414
  7609                                  .cmpneg413:
  7610 00003A13 A1[2200]                 mov ax, [iscmp]
  7611 00003A16 3D3803                   cmp ax, 824
  7612 00003A19 0F852100                 jne .cmpneg415
  7613 00003A1D 8B4604                   mov ax, [bp+4]
  7614 00003A20 08C0                     or  al, al
  7615 00003A22 0F840C00                 je .cmpneg416
  7616 00003A26 68[D63A]                 push cmpneg_2
  7617 00003A29 E82A0B                   call prs
  7618 00003A2C 83C402                   add  sp, 2
  7619                                  
  7620                                  ;-727                            else prs("\n ja  .");//ZF=0 CF=0
  7621                                  
  7622 00003A2F E90900                   jmp .cmpneg417
  7623                                  .cmpneg416:
  7624 00003A32 68[DF3A]                 push cmpneg_3
  7625 00003A35 E81E0B                   call prs
  7626 00003A38 83C402                   add  sp, 2
  7627                                  
  7628                                  ;-728   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);
  7629                                  
  7630                                  .cmpneg417:
  7631 00003A3B E98400                   jmp .cmpneg418
  7632                                  .cmpneg415:
  7633 00003A3E A1[2200]                 mov ax, [iscmp]
  7634 00003A41 3D2B03                   cmp ax, 811
  7635 00003A44 0F854500                 jne .cmpneg419
  7636 00003A48 8B4604                   mov ax, [bp+4]
  7637 00003A4B 08C0                     or  al, al
  7638 00003A4D 0F841E00                 je .cmpneg420
  7639 00003A51 68[E83A]                 push cmpneg_4
  7640 00003A54 E8FF0A                   call prs
  7641 00003A57 83C402                   add  sp, 2
  7642 00003A5A FF7604                   push word [bp+4]
  7643 00003A5D E8500C                   call prunsign1
  7644 00003A60 83C402                   add  sp, 2
  7645                                  
  7646                                  ;-729                                prs("\n jl  .");}//          SF!=OF
  7647                                  
  7648 00003A63 68[F63A]                 push cmpneg_5
  7649 00003A66 E8ED0A                   call prs
  7650 00003A69 83C402                   add  sp, 2
  7651                                  
  7652                                  ;-730                            else{prs(" ;unsigned : "); prunsign1(ids);
  7653                                  
  7654 00003A6C E91B00                   jmp .cmpneg421
  7655                                  .cmpneg420:
  7656 00003A6F 68[FF3A]                 push cmpneg_6
  7657 00003A72 E8E10A                   call prs
  7658 00003A75 83C402                   add  sp, 2
  7659 00003A78 FF7604                   push word [bp+4]
  7660 00003A7B E8320C                   call prunsign1
  7661 00003A7E 83C402                   add  sp, 2
  7662                                  
  7663                                  ;-731                                prs("\n jb  .");}//jb=jc=CF=1
  7664                                  
  7665 00003A81 68[0D3B]                 push cmpneg_7
  7666 00003A84 E8CF0A                   call prs
  7667 00003A87 83C402                   add  sp, 2
  7668                                  
  7669                                  ;-732   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF
  7670                                  
  7671                                  .cmpneg421:
  7672 00003A8A E93500                   jmp .cmpneg422
  7673                                  .cmpneg419:
  7674 00003A8D A1[2200]                 mov ax, [iscmp]
  7675 00003A90 83F83C                   cmp ax, 60
  7676 00003A93 0F850C00                 jne .cmpneg423
  7677 00003A97 68[163B]                 push cmpneg_8
  7678 00003A9A E8B90A                   call prs
  7679 00003A9D 83C402                   add  sp, 2
  7680                                  
  7681                                  ;-733   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF
  7682                                  
  7683 00003AA0 E91F00                   jmp .cmpneg424
  7684                                  .cmpneg423:
  7685 00003AA3 A1[2200]                 mov ax, [iscmp]
  7686 00003AA6 83F83E                   cmp ax, 62
  7687 00003AA9 0F850C00                 jne .cmpneg425
  7688 00003AAD 68[1F3B]                 push cmpneg_9
  7689 00003AB0 E8A30A                   call prs
  7690 00003AB3 83C402                   add  sp, 2
  7691                                  
  7692                                  ;-734   else error1("Vergleich unbekannt in CMPNEG()");  }
  7693                                  
  7694 00003AB6 E90900                   jmp .cmpneg426
  7695                                  .cmpneg425:
  7696 00003AB9 68[283B]                 push cmpneg_10
  7697 00003ABC E8820D                   call error1
  7698 00003ABF 83C402                   add  sp, 2
  7699                                  .cmpneg426:
  7700                                  .cmpneg424:
  7701                                  .cmpneg422:
  7702                                  .cmpneg418:
  7703                                  .cmpneg414:
  7704                                  .cmpneg412:
  7705                                  
  7706                                  ;-735 
  7707                                  
  7708                                  
  7709                                  ;-736 int prlabel(int n) {prs("\n."); prs(fname); pint1(n); prc(':'); }
  7710 00003AC2 C9                       LEAVE
  7711 00003AC3 C3                       ret
  7712                                  ; ENDP
  7713 00003AC4 5C6E206A6E65202E00      cmpneg_0 db "\n jne .",0
  7714 00003ACD 5C6E206A6520202E00      cmpneg_1 db "\n je  .",0
  7715 00003AD6 5C6E206A6720202E00      cmpneg_2 db "\n jg  .",0
  7716 00003ADF 5C6E206A6120202E00      cmpneg_3 db "\n ja  .",0
  7717 00003AE8 203B756E7369676E65-     cmpneg_4 db " ;unsigned : ",0
  7718 00003AF1 64203A2000         
  7719 00003AF6 5C6E206A6C20202E00      cmpneg_5 db "\n jl  .",0
  7720 00003AFF 203B756E7369676E65-     cmpneg_6 db " ;unsigned : ",0
  7721 00003B08 64203A2000         
  7722 00003B0D 5C6E206A6220202E00      cmpneg_7 db "\n jb  .",0
  7723 00003B16 5C6E206A6765202E00      cmpneg_8 db "\n jge .",0
  7724 00003B1F 5C6E206A6C65202E00      cmpneg_9 db "\n jle .",0
  7725 00003B28 566572676C65696368-     cmpneg_10 db "Vergleich unbekannt in CMPNEG()",0
  7726 00003B31 20756E62656B616E6E-
  7727 00003B3A 7420696E20434D504E-
  7728 00003B43 4547282900         
  7729                                  
  7730                                  prlabel:  ; *** PROC ***
  7731                                  ;Function : prlabel, Number of local variables: 1
  7732                                  ;   # type sign width addr used name   list of local variables
  7733                                  ;  200 var sign word   736 NULL n = bp+4;
  7734 00003B48 C8000000                 ENTER  0,0
  7735 00003B4C 68[733B]                 push prlabel_0
  7736 00003B4F E8040A                   call prs
  7737 00003B52 83C402                   add  sp, 2
  7738 00003B55 8D06AB81                 lea  ax, [fname]
  7739 00003B59 50                       push ax
  7740 00003B5A E8F909                   call prs
  7741 00003B5D 83C402                   add  sp, 2
  7742 00003B60 FF7604                   push word [bp+4]
  7743 00003B63 E8E70A                   call pint1
  7744 00003B66 83C402                   add  sp, 2
  7745 00003B69 6A3A                     push 58
  7746 00003B6B E88109                   call prc
  7747 00003B6E 83C402                   add  sp, 2
  7748                                  
  7749                                  ;-737 int prjump (int n) {prs("\n jmp ."); prs(fname); pint1(n); }
  7750 00003B71 C9                       LEAVE
  7751 00003B72 C3                       ret
  7752                                  ; ENDP
  7753 00003B73 5C6E2E00                prlabel_0 db "\n.",0
  7754                                  
  7755                                  prjump:  ; *** PROC ***
  7756                                  ;Function : prjump, Number of local variables: 1
  7757                                  ;   # type sign width addr used name   list of local variables
  7758                                  ;  200 var sign word   737 NULL n = bp+4;
  7759 00003B77 C8000000                 ENTER  0,0
  7760 00003B7B 68[9A3B]                 push prjump_0
  7761 00003B7E E8D509                   call prs
  7762 00003B81 83C402                   add  sp, 2
  7763 00003B84 8D06AB81                 lea  ax, [fname]
  7764 00003B88 50                       push ax
  7765 00003B89 E8CA09                   call prs
  7766 00003B8C 83C402                   add  sp, 2
  7767 00003B8F FF7604                   push word [bp+4]
  7768 00003B92 E8B80A                   call pint1
  7769 00003B95 83C402                   add  sp, 2
  7770                                  
  7771                                  ;-738 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
  7772 00003B98 C9                       LEAVE
  7773 00003B99 C3                       ret
  7774                                  ; ENDP
  7775 00003B9A 5C6E206A6D70202E00      prjump_0 db "\n jmp .",0
  7776                                  
  7777                                  doif:  ; *** PROC ***
  7778                                  ;Function : doif, Number of local variables: 2
  7779                                  ;   # type sign width addr used name   list of local variables
  7780                                  ;  200 var sign word   738 NULL jdest = bp-2
  7781                                  ;  201 var sign word   738 NULL tst = bp-4;
  7782 00003BA3 C8040000                 ENTER  4,0
  7783 00003BA7 E82AD5                   call pexpr
  7784 00003BAA FF06[2800]               inc  word[nlabel]
  7785 00003BAE A1[2800]                 mov ax, [nlabel]
  7786 00003BB1 8946FE                   mov [bp-2], ax
  7787                                  
  7788                                  ;-739   pint1(jdest); stmt();
  7789                                  
  7790 00003BB4 FF76FE                   push word [bp-2]
  7791 00003BB7 E8930A                   call pint1
  7792 00003BBA 83C402                   add  sp, 2
  7793 00003BBD E8DCFB                   call stmt
  7794                                  
  7795                                  ;-740   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;
  7796                                  
  7797 00003BC0 680202                   push 514
  7798 00003BC3 E85B08                   call istoken
  7799 00003BC6 83C402                   add  sp, 2
  7800 00003BC9 08C0                     or  al, al
  7801 00003BCB 0F842B00                 je .doif427
  7802 00003BCF FF06[2800]               inc  word[nlabel]
  7803 00003BD3 A1[2800]                 mov ax, [nlabel]
  7804 00003BD6 8946FC                   mov [bp-4], ax
  7805                                  
  7806                                  ;-741     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }
  7807                                  
  7808 00003BD9 FF76FC                   push word [bp-4]
  7809 00003BDC E898FF                   call prjump
  7810 00003BDF 83C402                   add  sp, 2
  7811 00003BE2 FF76FE                   push word [bp-2]
  7812 00003BE5 E860FF                   call prlabel
  7813 00003BE8 83C402                   add  sp, 2
  7814 00003BEB E8AEFB                   call stmt
  7815 00003BEE FF76FC                   push word [bp-4]
  7816 00003BF1 E854FF                   call prlabel
  7817 00003BF4 83C402                   add  sp, 2
  7818                                  
  7819                                  ;-742   else prlabel(jdest); }
  7820                                  
  7821 00003BF7 E90900                   jmp .doif428
  7822                                  .doif427:
  7823 00003BFA FF76FE                   push word [bp-2]
  7824 00003BFD E848FF                   call prlabel
  7825 00003C00 83C402                   add  sp, 2
  7826                                  .doif428:
  7827                                  
  7828                                  ;-743 
  7829                                  
  7830                                  
  7831                                  ;-744 int dodo() {int jdest; int jtemp;
  7832 00003C03 C9                       LEAVE
  7833 00003C04 C3                       ret
  7834                                  ; ENDP
  7835                                  
  7836                                  dodo:  ; *** PROC ***
  7837                                  
  7838                                  ;-745   nlabel++; jdest=nlabel; prlabel(jdest); stmt();
  7839                                  
  7840                                  ;Function : dodo, Number of local variables: 2
  7841                                  ;   # type sign width addr used name   list of local variables
  7842                                  ;  200 var sign word   744 NULL jdest = bp-2
  7843                                  ;  201 var sign word   744 NULL jtemp = bp-4;
  7844 00003C05 C8040000                 ENTER  4,0
  7845 00003C09 FF06[2800]               inc  word[nlabel]
  7846 00003C0D A1[2800]                 mov ax, [nlabel]
  7847 00003C10 8946FE                   mov [bp-2], ax
  7848 00003C13 FF76FE                   push word [bp-2]
  7849 00003C16 E82FFF                   call prlabel
  7850 00003C19 83C402                   add  sp, 2
  7851 00003C1C E87DFB                   call stmt
  7852                                  
  7853                                  ;-746   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);
  7854                                  
  7855 00003C1F 680302                   push 515
  7856 00003C22 E81E08                   call expect
  7857 00003C25 83C402                   add  sp, 2
  7858 00003C28 E8A9D4                   call pexpr
  7859 00003C2B FF06[2800]               inc  word[nlabel]
  7860 00003C2F A1[2800]                 mov ax, [nlabel]
  7861 00003C32 8946FC                   mov [bp-4], ax
  7862 00003C35 FF76FC                   push word [bp-4]
  7863 00003C38 E8120A                   call pint1
  7864 00003C3B 83C402                   add  sp, 2
  7865                                  
  7866                                  ;-747   prjump(jdest); prlabel(jtemp); }
  7867                                  
  7868 00003C3E FF76FE                   push word [bp-2]
  7869 00003C41 E833FF                   call prjump
  7870 00003C44 83C402                   add  sp, 2
  7871 00003C47 FF76FC                   push word [bp-4]
  7872 00003C4A E8FBFE                   call prlabel
  7873 00003C4D 83C402                   add  sp, 2
  7874                                  
  7875                                  ;-748 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
  7876 00003C50 C9                       LEAVE
  7877 00003C51 C3                       ret
  7878                                  ; ENDP
  7879                                  
  7880                                  dowhile:  ; *** PROC ***
  7881                                  ;Function : dowhile, Number of local variables: 2
  7882                                  ;   # type sign width addr used name   list of local variables
  7883                                  ;  200 var sign word   748 NULL jdest = bp-2
  7884                                  ;  201 var sign word   748 NULL tst = bp-4;
  7885 00003C52 C8040000                 ENTER  4,0
  7886 00003C56 FF06[2800]               inc  word[nlabel]
  7887 00003C5A A1[2800]                 mov ax, [nlabel]
  7888 00003C5D 8946FE                   mov [bp-2], ax
  7889                                  
  7890                                  ;-749   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);
  7891                                  
  7892 00003C60 FF76FE                   push word [bp-2]
  7893 00003C63 E8E2FE                   call prlabel
  7894 00003C66 83C402                   add  sp, 2
  7895 00003C69 E868D4                   call pexpr
  7896 00003C6C FF06[2800]               inc  word[nlabel]
  7897 00003C70 A1[2800]                 mov ax, [nlabel]
  7898 00003C73 8946FC                   mov [bp-4], ax
  7899 00003C76 FF76FC                   push word [bp-4]
  7900 00003C79 E8D109                   call pint1
  7901 00003C7C 83C402                   add  sp, 2
  7902                                  
  7903                                  ;-750   stmt(); prjump(jdest); prlabel(tst); }
  7904                                  
  7905 00003C7F E81AFB                   call stmt
  7906 00003C82 FF76FE                   push word [bp-2]
  7907 00003C85 E8EFFE                   call prjump
  7908 00003C88 83C402                   add  sp, 2
  7909 00003C8B FF76FC                   push word [bp-4]
  7910 00003C8E E8B7FE                   call prlabel
  7911 00003C91 83C402                   add  sp, 2
  7912                                  
  7913                                  ;-751 int isrelational() {
  7914 00003C94 C9                       LEAVE
  7915 00003C95 C3                       ret
  7916                                  ; ENDP
  7917                                  
  7918                                  isrelational:  ; *** PROC ***
  7919                                  
  7920                                  ;-752   if (token==T_EQ) goto w; if (token==T_NE) goto w;
  7921                                  
  7922 00003C96 A1[1C00]                 mov ax, [token]
  7923 00003C99 3D2603                   cmp ax, 806
  7924 00003C9C 0F850300                 jne .isrelational429
  7925 00003CA0 E94700                   jmp .w
  7926                                  .isrelational429:
  7927 00003CA3 A1[1C00]                 mov ax, [token]
  7928 00003CA6 3D2703                   cmp ax, 807
  7929 00003CA9 0F850300                 jne .isrelational430
  7930 00003CAD E93A00                   jmp .w
  7931                                  
  7932                                  ;-753   if (token==T_LE) goto w; if (token==T_GE) goto w;
  7933                                  
  7934                                  .isrelational430:
  7935 00003CB0 A1[1C00]                 mov ax, [token]
  7936 00003CB3 3D3803                   cmp ax, 824
  7937 00003CB6 0F850300                 jne .isrelational431
  7938 00003CBA E92D00                   jmp .w
  7939                                  .isrelational431:
  7940 00003CBD A1[1C00]                 mov ax, [token]
  7941 00003CC0 3D2B03                   cmp ax, 811
  7942 00003CC3 0F850300                 jne .isrelational432
  7943 00003CC7 E92000                   jmp .w
  7944                                  
  7945                                  ;-754   if (token=='<' ) goto w; if (token=='>' ) goto w;
  7946                                  
  7947                                  .isrelational432:
  7948 00003CCA A1[1C00]                 mov ax, [token]
  7949 00003CCD 83F83C                   cmp ax, 60
  7950 00003CD0 0F850300                 jne .isrelational433
  7951 00003CD4 E91300                   jmp .w
  7952                                  .isrelational433:
  7953 00003CD7 A1[1C00]                 mov ax, [token]
  7954 00003CDA 83F83E                   cmp ax, 62
  7955 00003CDD 0F850300                 jne .isrelational434
  7956 00003CE1 E90600                   jmp .w
  7957                                  
  7958                                  ;-755   return 0;  w: iscmp=token; token=getlex(); return 1;}
  7959                                  
  7960                                  .isrelational434:
  7961 00003CE4 B80000                   mov ax, 0
  7962 00003CE7 E91200                   jmp .retn
  7963                                  .w:
  7964 00003CEA A1[1C00]                 mov ax, [token]
  7965 00003CED A3[2200]                 mov word [iscmp], ax
  7966 00003CF0 E80A00                   call getlex
  7967 00003CF3 A3[1C00]                 mov word [token], ax
  7968 00003CF6 B80100                   mov ax, 1
  7969 00003CF9 E90000                   jmp .retn
  7970                                  
  7971                                  ;-756  
  7972                                  
  7973                                  
  7974                                  ;-757 char symboltemp[80];    
  7975                                  
  7976                                   .retn:
  7977 00003CFC C3                       ret
  7978                                  ; ENDP
  7979                                  section .bss
  7980                                  absolute 53468
  7981 0000D0DC <res 00000050>          symboltemp resb 80
  7982                                  section .text
  7983                                  
  7984                                  ;-758 int getlex() { char c; char *p; 
  7985                                  
  7986                                  
  7987                                  getlex:  ; *** PROC ***
  7988                                  
  7989                                  ;-759 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;
  7990                                  
  7991                                  ;Function : getlex, Number of local variables: 2
  7992                                  ;   # type sign width addr used name   list of local variables
  7993                                  ;  200 var sign byte   758 NULL c = bp-2
  7994                                  ;  201 ptr sign byte   758 NULL p = bp-4;
  7995 00003CFD C8040000                 ENTER  4,0
  7996                                  .g1:
  7997 00003D01 E8FF06                   call next
  7998 00003D04 8846FE                   mov [bp-2], al
  7999 00003D07 8A46FE                   mov al, [bp-2]
  8000 00003D0A 3C00                     cmp al, 0
  8001 00003D0C 0F850600                 jne .getlex435
  8002 00003D10 B80000                   mov ax, 0
  8003 00003D13 E9EB04                   jmp .retn
  8004                                  .getlex435:
  8005 00003D16 8A46FE                   mov al, [bp-2]
  8006 00003D19 3C20                     cmp al, 32
  8007 00003D1B 0F8F0200                 jg  .getlex436
  8008 00003D1F EBE0                     jmp .g1
  8009                                  
  8010                                  ;-760   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}
  8011                                  
  8012                                  .getlex436:
  8013 00003D21 8A46FE                   mov al, [bp-2]
  8014 00003D24 3C3D                     cmp al, 61
  8015 00003D26 0F851200                 jne .getlex437
  8016 00003D2A A0[2100]                 mov al, [thechar]
  8017 00003D2D 3C3D                     cmp al, 61
  8018 00003D2F 0F850900                 jne .getlex438
  8019 00003D33 E8CD06                   call next
  8020 00003D36 B82603                   mov ax, 806
  8021 00003D39 E9C504                   jmp .retn
  8022                                  .getlex438:
  8023                                  
  8024                                  ;-761   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}
  8025                                  
  8026                                  .getlex437:
  8027 00003D3C 8A46FE                   mov al, [bp-2]
  8028 00003D3F 3C21                     cmp al, 33
  8029 00003D41 0F851200                 jne .getlex439
  8030 00003D45 A0[2100]                 mov al, [thechar]
  8031 00003D48 3C3D                     cmp al, 61
  8032 00003D4A 0F850900                 jne .getlex440
  8033 00003D4E E8B206                   call next
  8034 00003D51 B82703                   mov ax, 807
  8035 00003D54 E9AA04                   jmp .retn
  8036                                  .getlex440:
  8037                                  
  8038                                  ;-762   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}
  8039                                  
  8040                                  .getlex439:
  8041 00003D57 8A46FE                   mov al, [bp-2]
  8042 00003D5A 3C3C                     cmp al, 60
  8043 00003D5C 0F851200                 jne .getlex441
  8044 00003D60 A0[2100]                 mov al, [thechar]
  8045 00003D63 3C3D                     cmp al, 61
  8046 00003D65 0F850900                 jne .getlex442
  8047 00003D69 E89706                   call next
  8048 00003D6C B83803                   mov ax, 824
  8049 00003D6F E98F04                   jmp .retn
  8050                                  .getlex442:
  8051                                  
  8052                                  ;-763   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}
  8053                                  
  8054                                  .getlex441:
  8055 00003D72 8A46FE                   mov al, [bp-2]
  8056 00003D75 3C3E                     cmp al, 62
  8057 00003D77 0F851200                 jne .getlex443
  8058 00003D7B A0[2100]                 mov al, [thechar]
  8059 00003D7E 3C3D                     cmp al, 61
  8060 00003D80 0F850900                 jne .getlex444
  8061 00003D84 E87C06                   call next
  8062 00003D87 B82B03                   mov ax, 811
  8063 00003D8A E97404                   jmp .retn
  8064                                  .getlex444:
  8065                                  
  8066                                  ;-764   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}
  8067                                  
  8068                                  .getlex443:
  8069 00003D8D 8A46FE                   mov al, [bp-2]
  8070 00003D90 3C3C                     cmp al, 60
  8071 00003D92 0F851200                 jne .getlex445
  8072 00003D96 A0[2100]                 mov al, [thechar]
  8073 00003D99 3C3C                     cmp al, 60
  8074 00003D9B 0F850900                 jne .getlex446
  8075 00003D9F E86106                   call next
  8076 00003DA2 B8D804                   mov ax, 1240
  8077 00003DA5 E95904                   jmp .retn
  8078                                  .getlex446:
  8079                                  
  8080                                  ;-765   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}
  8081                                  
  8082                                  .getlex445:
  8083 00003DA8 8A46FE                   mov al, [bp-2]
  8084 00003DAB 3C3E                     cmp al, 62
  8085 00003DAD 0F851200                 jne .getlex447
  8086 00003DB1 A0[2100]                 mov al, [thechar]
  8087 00003DB4 3C3E                     cmp al, 62
  8088 00003DB6 0F850900                 jne .getlex448
  8089 00003DBA E84606                   call next
  8090 00003DBD B8D904                   mov ax, 1241
  8091 00003DC0 E93E04                   jmp .retn
  8092                                  .getlex448:
  8093                                  
  8094                                  ;-766   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}
  8095                                  
  8096                                  .getlex447:
  8097 00003DC3 8A46FE                   mov al, [bp-2]
  8098 00003DC6 3C2B                     cmp al, 43
  8099 00003DC8 0F851200                 jne .getlex449
  8100 00003DCC A0[2100]                 mov al, [thechar]
  8101 00003DCF 3C2B                     cmp al, 43
  8102 00003DD1 0F850900                 jne .getlex450
  8103 00003DD5 E82B06                   call next
  8104 00003DD8 B8C304                   mov ax, 1219
  8105 00003DDB E92304                   jmp .retn
  8106                                  .getlex450:
  8107                                  
  8108                                  ;-767   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}
  8109                                  
  8110                                  .getlex449:
  8111 00003DDE 8A46FE                   mov al, [bp-2]
  8112 00003DE1 3C2D                     cmp al, 45
  8113 00003DE3 0F851200                 jne .getlex451
  8114 00003DE7 A0[2100]                 mov al, [thechar]
  8115 00003DEA 3C2D                     cmp al, 45
  8116 00003DEC 0F850900                 jne .getlex452
  8117 00003DF0 E81006                   call next
  8118 00003DF3 B8C904                   mov ax, 1225
  8119 00003DF6 E90804                   jmp .retn
  8120                                  .getlex452:
  8121                                  
  8122                                  ;-768   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}
  8123                                  
  8124                                  .getlex451:
  8125 00003DF9 8A46FE                   mov al, [bp-2]
  8126 00003DFC 3C2B                     cmp al, 43
  8127 00003DFE 0F851200                 jne .getlex453
  8128 00003E02 A0[2100]                 mov al, [thechar]
  8129 00003E05 3C3D                     cmp al, 61
  8130 00003E07 0F850900                 jne .getlex454
  8131 00003E0B E8F505                   call next
  8132 00003E0E B8CE04                   mov ax, 1230
  8133 00003E11 E9ED03                   jmp .retn
  8134                                  .getlex454:
  8135                                  
  8136                                  ;-769   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}
  8137                                  
  8138                                  .getlex453:
  8139 00003E14 8A46FE                   mov al, [bp-2]
  8140 00003E17 3C2D                     cmp al, 45
  8141 00003E19 0F851200                 jne .getlex455
  8142 00003E1D A0[2100]                 mov al, [thechar]
  8143 00003E20 3C3D                     cmp al, 61
  8144 00003E22 0F850900                 jne .getlex456
  8145 00003E26 E8DA05                   call next
  8146 00003E29 B8CF04                   mov ax, 1231
  8147 00003E2C E9D203                   jmp .retn
  8148                                  .getlex456:
  8149                                  
  8150                                  ;-770   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}
  8151                                  
  8152                                  .getlex455:
  8153 00003E2F 8A46FE                   mov al, [bp-2]
  8154 00003E32 3C26                     cmp al, 38
  8155 00003E34 0F851200                 jne .getlex457
  8156 00003E38 A0[2100]                 mov al, [thechar]
  8157 00003E3B 3C3D                     cmp al, 61
  8158 00003E3D 0F850900                 jne .getlex458
  8159 00003E41 E8BF05                   call next
  8160 00003E44 B8D204                   mov ax, 1234
  8161 00003E47 E9B703                   jmp .retn
  8162                                  .getlex458:
  8163                                  
  8164                                  ;-771   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}    
  8165                                  
  8166                                  .getlex457:
  8167 00003E4A 8A46FE                   mov al, [bp-2]
  8168 00003E4D 3C7C                     cmp al, 124
  8169 00003E4F 0F851200                 jne .getlex459
  8170 00003E53 A0[2100]                 mov al, [thechar]
  8171 00003E56 3C3D                     cmp al, 61
  8172 00003E58 0F850900                 jne .getlex460
  8173 00003E5C E8A405                   call next
  8174 00003E5F B8D304                   mov ax, 1235
  8175 00003E62 E99C03                   jmp .retn
  8176                                  .getlex460:
  8177                                  
  8178                                  ;-772   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}
  8179                                  
  8180                                  .getlex459:
  8181 00003E65 8A46FE                   mov al, [bp-2]
  8182 00003E68 3C2A                     cmp al, 42
  8183 00003E6A 0F851200                 jne .getlex461
  8184 00003E6E A0[2100]                 mov al, [thechar]
  8185 00003E71 3C3D                     cmp al, 61
  8186 00003E73 0F850900                 jne .getlex462
  8187 00003E77 E88905                   call next
  8188 00003E7A B8D004                   mov ax, 1232
  8189 00003E7D E98103                   jmp .retn
  8190                                  .getlex462:
  8191                                  
  8192                                  ;-773   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}        
  8193                                  
  8194                                  .getlex461:
  8195 00003E80 8A46FE                   mov al, [bp-2]
  8196 00003E83 3C2F                     cmp al, 47
  8197 00003E85 0F851200                 jne .getlex463
  8198 00003E89 A0[2100]                 mov al, [thechar]
  8199 00003E8C 3C3D                     cmp al, 61
  8200 00003E8E 0F850900                 jne .getlex464
  8201 00003E92 E86E05                   call next
  8202 00003E95 B8D104                   mov ax, 1233
  8203 00003E98 E96603                   jmp .retn
  8204                                  .getlex464:
  8205                                  
  8206                                  ;-774   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;
  8207                                  
  8208                                  .getlex463:
  8209 00003E9B 8A46FE                   mov al, byte [bp-2]
  8210 00003E9E B400                     mov ah, 0
  8211 00003EA0 50                       push ax
  8212 00003EA1 68[0342]                 push getlex_0
  8213 00003EA4 E83BC3                   call instr1
  8214 00003EA7 83C404                   add  sp, 4
  8215 00003EAA 08C0                     or  al, al
  8216 00003EAC 0F840600                 je .getlex465
  8217 00003EB0 8A46FE                   mov al, [bp-2]
  8218 00003EB3 E94B03                   jmp .retn
  8219                                  
  8220                                  ;-775   if (c == '/') { if (thechar == '/') {
  8221                                  
  8222                                  .getlex465:
  8223 00003EB6 8A46FE                   mov al, [bp-2]
  8224 00003EB9 3C2F                     cmp al, 47
  8225 00003EBB 0F852000                 jne .getlex466
  8226 00003EBF A0[2100]                 mov al, [thechar]
  8227 00003EC2 3C2F                     cmp al, 47
  8228 00003EC4 0F851700                 jne .getlex467
  8229                                  
  8230                                  ;-776       do c=next(); while(c != 13); /* c=next(); */ return getlex(); } }
  8231                                  
  8232                                  .getlex468:
  8233 00003EC8 E83805                   call next
  8234 00003ECB 8846FE                   mov [bp-2], al
  8235 00003ECE 8A46FE                   mov al, [bp-2]
  8236 00003ED1 3C0D                     cmp al, 13
  8237 00003ED3 0F840200                 je  .getlex469
  8238 00003ED7 EBEF                     jmp .getlex468
  8239                                  .getlex469:
  8240 00003ED9 E821FE                   call getlex
  8241 00003EDC E92203                   jmp .retn
  8242                                  .getlex467:
  8243                                  
  8244                                  ;-777   if (c == '/') { if (thechar == '*') {
  8245                                  
  8246                                  .getlex466:
  8247 00003EDF 8A46FE                   mov al, [bp-2]
  8248 00003EE2 3C2F                     cmp al, 47
  8249 00003EE4 0F853A00                 jne .getlex470
  8250 00003EE8 A0[2100]                 mov al, [thechar]
  8251 00003EEB 3C2A                     cmp al, 42
  8252 00003EED 0F852B00                 jne .getlex471
  8253                                  
  8254                                  ;-778       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;
  8255                                  
  8256                                  .g2:
  8257 00003EF1 E80F05                   call next
  8258 00003EF4 8846FE                   mov [bp-2], al
  8259 00003EF7 8A46FE                   mov al, [bp-2]
  8260 00003EFA 3C2A                     cmp al, 42
  8261 00003EFC 0F840200                 je  .getlex472
  8262 00003F00 EBEF                     jmp .g2
  8263                                  .getlex472:
  8264 00003F02 A0[2100]                 mov al, [thechar]
  8265 00003F05 3C2F                     cmp al, 47
  8266 00003F07 0F840200                 je  .getlex473
  8267 00003F0B EBE4                     jmp .g2
  8268                                  
  8269                                  ;-779       c=next(); return getlex(); } else  return '/'; }
  8270                                  
  8271                                  .getlex473:
  8272 00003F0D E8F304                   call next
  8273 00003F10 8846FE                   mov [bp-2], al
  8274 00003F13 E8E7FD                   call getlex
  8275 00003F16 E9E802                   jmp .retn
  8276 00003F19 E90600                   jmp .getlex474
  8277                                  .getlex471:
  8278 00003F1C B82F00                   mov ax, 47
  8279 00003F1F E9DF02                   jmp .retn
  8280                                  .getlex474:
  8281                                  
  8282                                  ;-780   if (c == '"') {getstring(c); return T_STRING;}
  8283                                  
  8284                                  .getlex470:
  8285 00003F22 8A46FE                   mov al, [bp-2]
  8286 00003F25 3C22                     cmp al, 34
  8287 00003F27 0F851200                 jne .getlex475
  8288 00003F2B 8A46FE                   mov al, byte [bp-2]
  8289 00003F2E B400                     mov ah, 0
  8290 00003F30 50                       push ax
  8291 00003F31 E89804                   call getstring
  8292 00003F34 83C402                   add  sp, 2
  8293 00003F37 B80201                   mov ax, 258
  8294 00003F3A E9C402                   jmp .retn
  8295                                  
  8296                                  ;-781   if (digit(c)) { getdigit(c); return T_CONST; }
  8297                                  
  8298                                  .getlex475:
  8299 00003F3D 8A46FE                   mov al, byte [bp-2]
  8300 00003F40 B400                     mov ah, 0
  8301 00003F42 50                       push ax
  8302 00003F43 E8CBC3                   call digit
  8303 00003F46 83C402                   add  sp, 2
  8304 00003F49 08C0                     or  al, al
  8305 00003F4B 0F841200                 je .getlex476
  8306 00003F4F 8A46FE                   mov al, byte [bp-2]
  8307 00003F52 B400                     mov ah, 0
  8308 00003F54 50                       push ax
  8309 00003F55 E89E03                   call getdigit
  8310 00003F58 83C402                   add  sp, 2
  8311 00003F5B B80101                   mov ax, 257
  8312 00003F5E E9A002                   jmp .retn
  8313                                  
  8314                                  ;-782   if (c==39) { lexval=next();
  8315                                  
  8316                                  .getlex476:
  8317 00003F61 8A46FE                   mov al, [bp-2]
  8318 00003F64 3C27                     cmp al, 39
  8319 00003F66 0F854F00                 jne .getlex477
  8320 00003F6A E89604                   call next
  8321 00003F6D A3[2E00]                 mov word [lexval], ax
  8322                                  
  8323                                  ;-783     if (lexval==92) {lexval=next();
  8324                                  
  8325 00003F70 A1[2E00]                 mov ax, [lexval]
  8326 00003F73 83F85C                   cmp ax, 92
  8327 00003F76 0F853600                 jne .getlex478
  8328 00003F7A E88604                   call next
  8329 00003F7D A3[2E00]                 mov word [lexval], ax
  8330                                  
  8331                                  ;-784       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;
  8332                                  
  8333 00003F80 A1[2E00]                 mov ax, [lexval]
  8334 00003F83 83F86E                   cmp ax, 110
  8335 00003F86 0F850600                 jne .getlex479
  8336 00003F8A B80A00                   mov ax, 10
  8337 00003F8D A3[2E00]                 mov word [lexval], ax
  8338                                  .getlex479:
  8339 00003F90 A1[2E00]                 mov ax, [lexval]
  8340 00003F93 83F874                   cmp ax, 116
  8341 00003F96 0F850600                 jne .getlex480
  8342 00003F9A B80900                   mov ax, 9
  8343 00003F9D A3[2E00]                 mov word [lexval], ax
  8344                                  
  8345                                  ;-785       if (lexval=='0') lexval= 0; } next(); return T_CONST; }
  8346                                  
  8347                                  .getlex480:
  8348 00003FA0 A1[2E00]                 mov ax, [lexval]
  8349 00003FA3 83F830                   cmp ax, 48
  8350 00003FA6 0F850600                 jne .getlex481
  8351 00003FAA B80000                   mov ax, 0
  8352 00003FAD A3[2E00]                 mov word [lexval], ax
  8353                                  .getlex481:
  8354                                  .getlex478:
  8355 00003FB0 E85004                   call next
  8356 00003FB3 B80101                   mov ax, 257
  8357 00003FB6 E94802                   jmp .retn
  8358                                  
  8359                                  ;-786   if (alnum(c)) { 
  8360                                  
  8361                                  .getlex477:
  8362 00003FB9 8A46FE                   mov al, byte [bp-2]
  8363 00003FBC B400                     mov ah, 0
  8364 00003FBE 50                       push ax
  8365 00003FBF E8F7C3                   call alnum
  8366 00003FC2 83C402                   add  sp, 2
  8367 00003FC5 08C0                     or  al, al
  8368 00003FC7 0F842D02                 je .getlex482
  8369                                  
  8370                                  ;-787     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;
  8371                                  
  8372 00003FCB 8D062B81                 lea  ax, [symbol]
  8373 00003FCF 50                       push ax
  8374 00003FD0 8D06DCD0                 lea  ax, [symboltemp]
  8375 00003FD4 50                       push ax
  8376 00003FD5 E88EC1                   call strcpy
  8377 00003FD8 83C404                   add  sp, 4
  8378 00003FDB B82B81                   mov ax, symbol
  8379 00003FDE 8946FC                   mov [bp-4], ax
  8380 00003FE1 8A46FE                   mov al, [bp-2]
  8381 00003FE4 8B5EFC                   mov  bx, [bp-4]
  8382 00003FE7 8807                     mov  [bx], al
  8383 00003FE9 FF46FC                   inc  word[bp-4]
  8384                                  
  8385                                  ;-788     while(alnum(thechar)) {c=next(); *p=c;  p++; } 
  8386                                  
  8387                                  .getlex483:
  8388 00003FEC A0[2100]                 mov al, byte [thechar]
  8389 00003FEF B400                     mov ah, 0
  8390 00003FF1 50                       push ax
  8391 00003FF2 E8C4C3                   call alnum
  8392 00003FF5 83C402                   add  sp, 2
  8393 00003FF8 08C0                     or  al, al
  8394 00003FFA 0F841300                 je .getlex484
  8395 00003FFE E80204                   call next
  8396 00004001 8846FE                   mov [bp-2], al
  8397 00004004 8A46FE                   mov al, [bp-2]
  8398 00004007 8B5EFC                   mov  bx, [bp-4]
  8399 0000400A 8807                     mov  [bx], al
  8400 0000400C FF46FC                   inc  word[bp-4]
  8401                                  
  8402                                  ;-789       *p=0;
  8403                                  
  8404 0000400F EBDB                     jmp .getlex483
  8405                                  .getlex484:
  8406 00004011 B80000                   mov ax, 0
  8407 00004014 8B5EFC                   mov  bx, [bp-4]
  8408 00004017 8807                     mov  [bx], al
  8409                                  
  8410                                  ;-790     if (eqstr(symbol,"signed"  )) return T_SIGNED;
  8411                                  
  8412 00004019 68[1942]                 push getlex_1
  8413 0000401C 8D062B81                 lea  ax, [symbol]
  8414 00004020 50                       push ax
  8415 00004021 E872C1                   call eqstr
  8416 00004024 83C404                   add  sp, 4
  8417 00004027 08C0                     or  al, al
  8418 00004029 0F840600                 je .getlex485
  8419 0000402D B81302                   mov ax, 531
  8420 00004030 E9CE01                   jmp .retn
  8421                                  
  8422                                  ;-791     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;
  8423                                  
  8424                                  .getlex485:
  8425 00004033 68[2042]                 push getlex_2
  8426 00004036 8D062B81                 lea  ax, [symbol]
  8427 0000403A 50                       push ax
  8428 0000403B E858C1                   call eqstr
  8429 0000403E 83C404                   add  sp, 4
  8430 00004041 08C0                     or  al, al
  8431 00004043 0F840600                 je .getlex486
  8432 00004047 B81402                   mov ax, 532
  8433 0000404A E9B401                   jmp .retn
  8434                                  
  8435                                  ;-792     if (eqstr(symbol,"void"    )) return T_VOID;
  8436                                  
  8437                                  .getlex486:
  8438 0000404D 68[2942]                 push getlex_3
  8439 00004050 8D062B81                 lea  ax, [symbol]
  8440 00004054 50                       push ax
  8441 00004055 E83EC1                   call eqstr
  8442 00004058 83C404                   add  sp, 4
  8443 0000405B 08C0                     or  al, al
  8444 0000405D 0F840600                 je .getlex487
  8445 00004061 B81102                   mov ax, 529
  8446 00004064 E99A01                   jmp .retn
  8447                                  
  8448                                  ;-793     if (eqstr(symbol,"int"     )) return T_INT;
  8449                                  
  8450                                  .getlex487:
  8451 00004067 68[2E42]                 push getlex_4
  8452 0000406A 8D062B81                 lea  ax, [symbol]
  8453 0000406E 50                       push ax
  8454 0000406F E824C1                   call eqstr
  8455 00004072 83C404                   add  sp, 4
  8456 00004075 08C0                     or  al, al
  8457 00004077 0F840600                 je .getlex488
  8458 0000407B B80502                   mov ax, 517
  8459 0000407E E98001                   jmp .retn
  8460                                  
  8461                                  ;-794     if (eqstr(symbol,"long"    )) return T_LONG;
  8462                                  
  8463                                  .getlex488:
  8464 00004081 68[3242]                 push getlex_5
  8465 00004084 8D062B81                 lea  ax, [symbol]
  8466 00004088 50                       push ax
  8467 00004089 E80AC1                   call eqstr
  8468 0000408C 83C404                   add  sp, 4
  8469 0000408F 08C0                     or  al, al
  8470 00004091 0F840600                 je .getlex489
  8471 00004095 B81502                   mov ax, 533
  8472 00004098 E96601                   jmp .retn
  8473                                  
  8474                                  ;-795     if (eqstr(symbol,"char"    )) return T_CHAR;
  8475                                  
  8476                                  .getlex489:
  8477 0000409B 68[3742]                 push getlex_6
  8478 0000409E 8D062B81                 lea  ax, [symbol]
  8479 000040A2 50                       push ax
  8480 000040A3 E8F0C0                   call eqstr
  8481 000040A6 83C404                   add  sp, 4
  8482 000040A9 08C0                     or  al, al
  8483 000040AB 0F840600                 je .getlex490
  8484 000040AF B81202                   mov ax, 530
  8485 000040B2 E94C01                   jmp .retn
  8486                                  
  8487                                  ;-796     if (eqstr(symbol,"asm"     )) return T_ASM;
  8488                                  
  8489                                  .getlex490:
  8490 000040B5 68[3C42]                 push getlex_7
  8491 000040B8 8D062B81                 lea  ax, [symbol]
  8492 000040BC 50                       push ax
  8493 000040BD E8D6C0                   call eqstr
  8494 000040C0 83C404                   add  sp, 4
  8495 000040C3 08C0                     or  al, al
  8496 000040C5 0F840600                 je .getlex491
  8497 000040C9 B80602                   mov ax, 518
  8498 000040CC E93201                   jmp .retn
  8499                                  
  8500                                  ;-797     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;
  8501                                  
  8502                                  .getlex491:
  8503 000040CF 68[4042]                 push getlex_8
  8504 000040D2 8D062B81                 lea  ax, [symbol]
  8505 000040D6 50                       push ax
  8506 000040D7 E8BCC0                   call eqstr
  8507 000040DA 83C404                   add  sp, 4
  8508 000040DD 08C0                     or  al, al
  8509 000040DF 0F840600                 je .getlex492
  8510 000040E3 B80702                   mov ax, 519
  8511 000040E6 E91801                   jmp .retn
  8512                                  
  8513                                  ;-798     if (eqstr(symbol,"__emit__")) return T_EMIT;
  8514                                  
  8515                                  .getlex492:
  8516 000040E9 68[4642]                 push getlex_9
  8517 000040EC 8D062B81                 lea  ax, [symbol]
  8518 000040F0 50                       push ax
  8519 000040F1 E8A2C0                   call eqstr
  8520 000040F4 83C404                   add  sp, 4
  8521 000040F7 08C0                     or  al, al
  8522 000040F9 0F840600                 je .getlex493
  8523 000040FD B80802                   mov ax, 520
  8524 00004100 E9FE00                   jmp .retn
  8525                                  
  8526                                  ;-799     if (eqstr(symbol,"return"  )) return T_RETURN;
  8527                                  
  8528                                  .getlex493:
  8529 00004103 68[4F42]                 push getlex_10
  8530 00004106 8D062B81                 lea  ax, [symbol]
  8531 0000410A 50                       push ax
  8532 0000410B E888C0                   call eqstr
  8533 0000410E 83C404                   add  sp, 4
  8534 00004111 08C0                     or  al, al
  8535 00004113 0F840600                 je .getlex494
  8536 00004117 B80002                   mov ax, 512
  8537 0000411A E9E400                   jmp .retn
  8538                                  
  8539                                  ;-800     if (eqstr(symbol,"if"      )) return T_IF;
  8540                                  
  8541                                  .getlex494:
  8542 0000411D 68[5642]                 push getlex_11
  8543 00004120 8D062B81                 lea  ax, [symbol]
  8544 00004124 50                       push ax
  8545 00004125 E86EC0                   call eqstr
  8546 00004128 83C404                   add  sp, 4
  8547 0000412B 08C0                     or  al, al
  8548 0000412D 0F840600                 je .getlex495
  8549 00004131 B80102                   mov ax, 513
  8550 00004134 E9CA00                   jmp .retn
  8551                                  
  8552                                  ;-801     if (eqstr(symbol,"else"    )) return T_ELSE;
  8553                                  
  8554                                  .getlex495:
  8555 00004137 68[5942]                 push getlex_12
  8556 0000413A 8D062B81                 lea  ax, [symbol]
  8557 0000413E 50                       push ax
  8558 0000413F E854C0                   call eqstr
  8559 00004142 83C404                   add  sp, 4
  8560 00004145 08C0                     or  al, al
  8561 00004147 0F840600                 je .getlex496
  8562 0000414B B80202                   mov ax, 514
  8563 0000414E E9B000                   jmp .retn
  8564                                  
  8565                                  ;-802     if (eqstr(symbol,"while"   )) return T_WHILE;
  8566                                  
  8567                                  .getlex496:
  8568 00004151 68[5E42]                 push getlex_13
  8569 00004154 8D062B81                 lea  ax, [symbol]
  8570 00004158 50                       push ax
  8571 00004159 E83AC0                   call eqstr
  8572 0000415C 83C404                   add  sp, 4
  8573 0000415F 08C0                     or  al, al
  8574 00004161 0F840600                 je .getlex497
  8575 00004165 B80302                   mov ax, 515
  8576 00004168 E99600                   jmp .retn
  8577                                  
  8578                                  ;-803     if (eqstr(symbol,"do"      )) return T_DO;
  8579                                  
  8580                                  .getlex497:
  8581 0000416B 68[6442]                 push getlex_14
  8582 0000416E 8D062B81                 lea  ax, [symbol]
  8583 00004172 50                       push ax
  8584 00004173 E820C0                   call eqstr
  8585 00004176 83C404                   add  sp, 4
  8586 00004179 08C0                     or  al, al
  8587 0000417B 0F840600                 je .getlex498
  8588 0000417F B80402                   mov ax, 516
  8589 00004182 E97C00                   jmp .retn
  8590                                  
  8591                                  ;-804     if (eqstr(symbol,"goto"    )) return T_GOTO;
  8592                                  
  8593                                  .getlex498:
  8594 00004185 68[6742]                 push getlex_15
  8595 00004188 8D062B81                 lea  ax, [symbol]
  8596 0000418C 50                       push ax
  8597 0000418D E806C0                   call eqstr
  8598 00004190 83C404                   add  sp, 4
  8599 00004193 08C0                     or  al, al
  8600 00004195 0F840600                 je .getlex499
  8601 00004199 B80902                   mov ax, 521
  8602 0000419C E96200                   jmp .retn
  8603                                  
  8604                                  ;-805     if (eqstr(symbol,"define"  )) return T_DEFINE;   
  8605                                  
  8606                                  .getlex499:
  8607 0000419F 68[6C42]                 push getlex_16
  8608 000041A2 8D062B81                 lea  ax, [symbol]
  8609 000041A6 50                       push ax
  8610 000041A7 E8ECBF                   call eqstr
  8611 000041AA 83C404                   add  sp, 4
  8612 000041AD 08C0                     or  al, al
  8613 000041AF 0F840600                 je .getlex500
  8614 000041B3 B8FF01                   mov ax, 511
  8615 000041B6 E94800                   jmp .retn
  8616                                  
  8617                                  ;-806     if (eqstr(symbol,"include" )) return T_INCLUDE;   
  8618                                  
  8619                                  .getlex500:
  8620 000041B9 68[7342]                 push getlex_17
  8621 000041BC 8D062B81                 lea  ax, [symbol]
  8622 000041C0 50                       push ax
  8623 000041C1 E8D2BF                   call eqstr
  8624 000041C4 83C404                   add  sp, 4
  8625 000041C7 08C0                     or  al, al
  8626 000041C9 0F840600                 je .getlex501
  8627 000041CD B8FE01                   mov ax, 510
  8628 000041D0 E92E00                   jmp .retn
  8629                                  
  8630                                  ;-807     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}
  8631                                  
  8632                                  .getlex501:
  8633 000041D3 E8BF00                   call convertdefine
  8634 000041D6 08C0                     or  al, al
  8635 000041D8 0F841600                 je .getlex502
  8636 000041DC 8D06DCD0                 lea  ax, [symboltemp]
  8637 000041E0 50                       push ax
  8638 000041E1 8D062B81                 lea  ax, [symbol]
  8639 000041E5 50                       push ax
  8640 000041E6 E87DBF                   call strcpy
  8641 000041E9 83C404                   add  sp, 4
  8642 000041EC B80101                   mov ax, 257
  8643 000041EF E90F00                   jmp .retn
  8644                                  
  8645                                  ;-808     return T_NAME; } error1("Input item not recognized"); }
  8646                                  
  8647                                  .getlex502:
  8648 000041F2 B80001                   mov ax, 256
  8649 000041F5 E90900                   jmp .retn
  8650                                  .getlex482:
  8651 000041F8 68[7B42]                 push getlex_18
  8652 000041FB E84306                   call error1
  8653 000041FE 83C402                   add  sp, 2
  8654                                  
  8655                                  ;-809 
  8656                                  
  8657                                  
  8658                                  ;-810 int convertdefine() { int i; int j;   i=0;
  8659                                  
  8660 00004201 C9                       .retn: LEAVE
  8661 00004202 C3                       ret
  8662                                  ; ENDP
  8663 00004203 28295B5D7B7D2C3B2A-     getlex_0 db "()[]{},;*:%-><=+!&|#?",0
  8664 0000420C 3A252D3E3C3D2B2126-
  8665 00004215 7C233F00           
  8666 00004219 7369676E656400          getlex_1 db "signed",0
  8667 00004220 756E7369676E656400      getlex_2 db "unsigned",0
  8668 00004229 766F696400              getlex_3 db "void",0
  8669 0000422E 696E7400                getlex_4 db "int",0
  8670 00004232 6C6F6E6700              getlex_5 db "long",0
  8671 00004237 6368617200              getlex_6 db "char",0
  8672 0000423C 61736D00                getlex_7 db "asm",0
  8673 00004240 5F5F61736D00            getlex_8 db "__asm",0
  8674 00004246 5F5F656D69745F5F00      getlex_9 db "__emit__",0
  8675 0000424F 72657475726E00          getlex_10 db "return",0
  8676 00004256 696600                  getlex_11 db "if",0
  8677 00004259 656C736500              getlex_12 db "else",0
  8678 0000425E 7768696C6500            getlex_13 db "while",0
  8679 00004264 646F00                  getlex_14 db "do",0
  8680 00004267 676F746F00              getlex_15 db "goto",0
  8681 0000426C 646566696E6500          getlex_16 db "define",0
  8682 00004273 696E636C75646500        getlex_17 db "include",0
  8683 0000427B 496E70757420697465-     getlex_18 db "Input item not recognized",0
  8684 00004284 6D206E6F7420726563-
  8685 0000428D 6F676E697A656400   
  8686                                  
  8687                                  convertdefine:  ; *** PROC ***
  8688                                  ;Function : convertdefine, Number of local variables: 2
  8689                                  ;   # type sign width addr used name   list of local variables
  8690                                  ;  200 var sign word   810 NULL i = bp-2
  8691                                  ;  201 var sign word   810 NULL j = bp-4;
  8692 00004295 C8040000                 ENTER  4,0
  8693 00004299 B80000                   mov ax, 0
  8694 0000429C 8946FE                   mov [bp-2], ax
  8695                                  
  8696                                  ;-811   while (i < GTop) {
  8697                                  
  8698                                  .convertdefine503:
  8699 0000429F 8B46FE                   mov ax, [bp-2]
  8700 000042A2 3B06[2A00]               cmp ax, [GTop]
  8701 000042A6 0F8D4400                 jge .convertdefine504
  8702                                  
  8703                                  ;-812    j=adrofname(i); 
  8704                                  
  8705 000042AA FF76FE                   push word [bp-2]
  8706 000042AD E8B9C6                   call adrofname
  8707 000042B0 83C402                   add  sp, 2
  8708 000042B3 8946FC                   mov [bp-4], ax
  8709                                  
  8710                                  ;-813    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];
  8711                                  
  8712 000042B6 FF76FC                   push word [bp-4]
  8713 000042B9 8D062B81                 lea  ax, [symbol]
  8714 000042BD 50                       push ax
  8715 000042BE E8D5BE                   call eqstr
  8716 000042C1 83C404                   add  sp, 4
  8717 000042C4 08C0                     or  al, al
  8718 000042C6 0F841F00                 je .convertdefine505
  8719 000042CA 8B5EFE                   mov bx, [bp-2]
  8720 000042CD 8A87B782                 mov al, [GType + bx]
  8721 000042D1 3C23                     cmp al, 35
  8722 000042D3 0F851200                 jne .convertdefine506
  8723 000042D7 8B5EFE                   mov bx, [bp-2]
  8724 000042DA D1E3                     shl bx, 1
  8725 000042DC 8B87EB8A                 mov ax, [GData + bx]
  8726 000042E0 A3[2E00]                 mov word [lexval], ax
  8727                                  
  8728                                  ;-814    return T_CONST; } }
  8729                                  
  8730 000042E3 B80101                   mov ax, 257
  8731 000042E6 E90B00                   jmp .retn
  8732                                  .convertdefine506:
  8733                                  
  8734                                  ;-815    i++; } 
  8735                                  
  8736                                  .convertdefine505:
  8737 000042E9 FF46FE                   inc  word[bp-2]
  8738                                  
  8739                                  ;-816    return 0; }
  8740                                  
  8741 000042EC EBB1                     jmp .convertdefine503
  8742                                  .convertdefine504:
  8743 000042EE B80000                   mov ax, 0
  8744 000042F1 E90000                   jmp .retn
  8745                                  
  8746                                  ;-817 int getdigit(char c) { int i;
  8747                                  
  8748 000042F4 C9                       .retn: LEAVE
  8749 000042F5 C3                       ret
  8750                                  ; ENDP
  8751                                  
  8752                                  getdigit:  ; *** PROC ***
  8753                                  
  8754                                  ;-818     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char
  8755                                  
  8756                                  ;Function : getdigit, Number of local variables: 2
  8757                                  ;   # type sign width addr used name   list of local variables
  8758                                  ;  200 var sign byte   817 NULL c = bp+4
  8759                                  ;  201 var sign word   817 NULL i = bp-2;
  8760 000042F6 C8020000                 ENTER  2,0
  8761 000042FA B80000                   mov ax, 0
  8762 000042FD A3[2E00]                 mov word [lexval], ax
  8763 00004300 8A4604                   mov al, [bp+4]
  8764 00004303 2C30                     sub al, 48
  8765 00004305 A3[2E00]                 mov word [lexval], ax
  8766                                  
  8767                                  ;-819     if (thechar=='x') thechar='X'; if (thechar=='X') { next();
  8768                                  
  8769 00004308 A0[2100]                 mov al, [thechar]
  8770 0000430B 3C78                     cmp al, 120
  8771 0000430D 0F850600                 jne .getdigit507
  8772 00004311 B85800                   mov ax, 88
  8773 00004314 A2[2100]                 mov byte [thechar], al
  8774                                  .getdigit507:
  8775 00004317 A0[2100]                 mov al, [thechar]
  8776 0000431A 3C58                     cmp al, 88
  8777 0000431C 0F856800                 jne .getdigit508
  8778 00004320 E8E000                   call next
  8779                                  
  8780                                  ;-820       while(alnum(thechar)) { c=next(); if(c>96) c=c-39;
  8781                                  
  8782                                  .getdigit509:
  8783 00004323 A0[2100]                 mov al, byte [thechar]
  8784 00004326 B400                     mov ah, 0
  8785 00004328 50                       push ax
  8786 00004329 E88DC0                   call alnum
  8787 0000432C 83C402                   add  sp, 2
  8788 0000432F 08C0                     or  al, al
  8789 00004331 0F845000                 je .getdigit510
  8790 00004335 E8CB00                   call next
  8791 00004338 884604                   mov [bp+4], al
  8792 0000433B 8A4604                   mov al, [bp+4]
  8793 0000433E 3C60                     cmp al, 96
  8794 00004340 0F8E0800                 jle .getdigit511
  8795 00004344 8A4604                   mov al, [bp+4]
  8796 00004347 2C27                     sub al, 39
  8797 00004349 884604                   mov [bp+4], al
  8798                                  
  8799                                  ;-821 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16
  8800                                  
  8801                                  .getdigit511:
  8802 0000434C 8A4604                   mov al, [bp+4]
  8803 0000434F 3C40                     cmp al, 64
  8804 00004351 0F8E0800                 jle .getdigit512
  8805 00004355 8A4604                   mov al, [bp+4]
  8806 00004358 2C07                     sub al, 7
  8807 0000435A 884604                   mov [bp+4], al
  8808                                  .getdigit512:
  8809 0000435D 8A4604                   mov al, [bp+4]
  8810 00004360 2C30                     sub al, 48
  8811 00004362 884604                   mov [bp+4], al
  8812 00004365 A1[2E00]                 mov ax, [lexval]
  8813 00004368 C1E004                   shl ax, 4
  8814 0000436B A3[2E00]                 mov word [lexval], ax
  8815                                  
  8816                                  ;-822      i=0; i=c; lexval=lexval+i;}
  8817                                  
  8818 0000436E B80000                   mov ax, 0
  8819 00004371 8946FE                   mov [bp-2], ax
  8820 00004374 8A4604                   mov al, [bp+4]
  8821 00004377 8946FE                   mov [bp-2], ax
  8822 0000437A A1[2E00]                 mov ax, [lexval]
  8823 0000437D 0346FE                   add ax, [bp-2]
  8824 00004380 A3[2E00]                 mov word [lexval], ax
  8825                                  
  8826                                  ;-823     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10; 
  8827                                  
  8828 00004383 EB9E                     jmp .getdigit509
  8829                                  .getdigit510:
  8830 00004385 E94200                   jmp .getdigit513
  8831                                  .getdigit508:
  8832                                  .getdigit514:
  8833 00004388 A0[2100]                 mov al, byte [thechar]
  8834 0000438B B400                     mov ah, 0
  8835 0000438D 50                       push ax
  8836 0000438E E880BF                   call digit
  8837 00004391 83C402                   add  sp, 2
  8838 00004394 08C0                     or  al, al
  8839 00004396 0F843000                 je .getdigit515
  8840 0000439A E86600                   call next
  8841 0000439D 884604                   mov [bp+4], al
  8842 000043A0 8A4604                   mov al, [bp+4]
  8843 000043A3 2C30                     sub al, 48
  8844 000043A5 884604                   mov [bp+4], al
  8845 000043A8 A1[2E00]                 mov ax, [lexval]
  8846 000043AB BB0A00                   mov bx, 10
  8847 000043AE F7E3                     mul bx
  8848 000043B0 A3[2E00]                 mov word [lexval], ax
  8849                                  
  8850                                  ;-824      i=0; i=c; lexval=lexval+i; } } 
  8851                                  
  8852 000043B3 B80000                   mov ax, 0
  8853 000043B6 8946FE                   mov [bp-2], ax
  8854 000043B9 8A4604                   mov al, [bp+4]
  8855 000043BC 8946FE                   mov [bp-2], ax
  8856 000043BF A1[2E00]                 mov ax, [lexval]
  8857 000043C2 0346FE                   add ax, [bp-2]
  8858 000043C5 A3[2E00]                 mov word [lexval], ax
  8859 000043C8 EBBE                     jmp .getdigit514
  8860                                  .getdigit515:
  8861                                  
  8862                                  ;-825 }
  8863                                  
  8864                                  .getdigit513:
  8865                                  
  8866                                  ;-826 int getstring(int delim) {int c; char *p;  p=&symbol; c=next();
  8867 000043CA C9                       LEAVE
  8868 000043CB C3                       ret
  8869                                  ; ENDP
  8870                                  
  8871                                  getstring:  ; *** PROC ***
  8872                                  ;Function : getstring, Number of local variables: 3
  8873                                  ;   # type sign width addr used name   list of local variables
  8874                                  ;  200 var sign word   826 NULL delim = bp+4
  8875                                  ;  201 var sign word   826 NULL c = bp-2
  8876                                  ;  202 ptr sign byte   826 NULL p = bp-4;
  8877 000043CC C8040000                 ENTER  4,0
  8878 000043D0 B82B81                   mov ax, symbol
  8879 000043D3 8946FC                   mov [bp-4], ax
  8880 000043D6 E82A00                   call next
  8881 000043D9 8946FE                   mov [bp-2], ax
  8882                                  
  8883                                  ;-827   while (c != delim) {*p=c; p++; c=next(); } *p=0; }
  8884                                  
  8885                                  .getstring516:
  8886 000043DC 8B46FE                   mov ax, [bp-2]
  8887 000043DF 3B4604                   cmp ax, [bp+4]
  8888 000043E2 0F841300                 je  .getstring517
  8889 000043E6 8B46FE                   mov ax, [bp-2]
  8890 000043E9 8B5EFC                   mov  bx, [bp-4]
  8891 000043EC 8807                     mov  [bx], al
  8892 000043EE FF46FC                   inc  word[bp-4]
  8893 000043F1 E80F00                   call next
  8894 000043F4 8946FE                   mov [bp-2], ax
  8895 000043F7 EBE3                     jmp .getstring516
  8896                                  .getstring517:
  8897 000043F9 B80000                   mov ax, 0
  8898 000043FC 8B5EFC                   mov  bx, [bp-4]
  8899 000043FF 8807                     mov  [bx], al
  8900                                  
  8901                                  ;-828 
  8902                                  
  8903                                  
  8904                                  ;-829 int next() {char r; r = thechar; globC=r; thechar = fgets1(); return r; }
  8905 00004401 C9                       LEAVE
  8906 00004402 C3                       ret
  8907                                  ; ENDP
  8908                                  
  8909                                  next:  ; *** PROC ***
  8910                                  ;Function : next, Number of local variables: 1
  8911                                  ;   # type sign width addr used name   list of local variables
  8912                                  ;  200 var sign byte   829 NULL r = bp-2;
  8913 00004403 C8020000                 ENTER  2,0
  8914 00004407 A0[2100]                 mov al, [thechar]
  8915 0000440A 8846FE                   mov [bp-2], al
  8916 0000440D 8A46FE                   mov al, [bp-2]
  8917 00004410 A2[1E00]                 mov byte [globC], al
  8918 00004413 E83303                   call fgets1
  8919 00004416 A2[2100]                 mov byte [thechar], al
  8920 00004419 8A46FE                   mov al, [bp-2]
  8921 0000441C E90000                   jmp .retn
  8922                                  
  8923                                  ;-830 int istoken(int t) {if (token == t) { token=getlex(); return 1; } return 0;}
  8924                                  
  8925 0000441F C9                       .retn: LEAVE
  8926 00004420 C3                       ret
  8927                                  ; ENDP
  8928                                  
  8929                                  istoken:  ; *** PROC ***
  8930                                  ;Function : istoken, Number of local variables: 1
  8931                                  ;   # type sign width addr used name   list of local variables
  8932                                  ;  200 var sign word   830 NULL t = bp+4;
  8933 00004421 C8000000                 ENTER  0,0
  8934 00004425 A1[1C00]                 mov ax, [token]
  8935 00004428 3B4604                   cmp ax, [bp+4]
  8936 0000442B 0F850C00                 jne .istoken518
  8937 0000442F E8CBF8                   call getlex
  8938 00004432 A3[1C00]                 mov word [token], ax
  8939 00004435 B80100                   mov ax, 1
  8940 00004438 E90600                   jmp .retn
  8941                                  .istoken518:
  8942 0000443B B80000                   mov ax, 0
  8943 0000443E E90000                   jmp .retn
  8944                                  
  8945                                  ;-831 int expect(int t) {if (istoken(t)==0) { *cloc=0; prs(co); listproc();
  8946                                  
  8947 00004441 C9                       .retn: LEAVE
  8948 00004442 C3                       ret
  8949                                  ; ENDP
  8950                                  
  8951                                  expect:  ; *** PROC ***
  8952                                  ;Function : expect, Number of local variables: 1
  8953                                  ;   # type sign width addr used name   list of local variables
  8954                                  ;  200 var sign word   831 NULL t = bp+4;
  8955 00004443 C8000000                 ENTER  0,0
  8956 00004447 FF7604                   push word [bp+4]
  8957 0000444A E8D4FF                   call istoken
  8958 0000444D 83C402                   add  sp, 2
  8959 00004450 83F800                   cmp ax, 0
  8960 00004453 0F853200                 jne .expect519
  8961 00004457 B80000                   mov ax, 0
  8962 0000445A 8B1E[1600]               mov  bx, [cloc]
  8963 0000445E 8807                     mov  [bx], al
  8964 00004460 8D063075                 lea  ax, [co]
  8965 00004464 50                       push ax
  8966 00004465 E8EE00                   call prs
  8967 00004468 83C402                   add  sp, 2
  8968 0000446B E8D504                   call listproc
  8969                                  
  8970                                  ;-832   prs("\nExpected ASCII(dez): "); pint1(t); error1(" not found"); } }
  8971                                  
  8972 0000446E 68[8B44]                 push expect_0
  8973 00004471 E8E200                   call prs
  8974 00004474 83C402                   add  sp, 2
  8975 00004477 FF7604                   push word [bp+4]
  8976 0000447A E8D001                   call pint1
  8977 0000447D 83C402                   add  sp, 2
  8978 00004480 68[A344]                 push expect_1
  8979 00004483 E8BB03                   call error1
  8980 00004486 83C402                   add  sp, 2
  8981                                  .expect519:
  8982                                  
  8983                                  ;-833 
  8984                                  
  8985                                  
  8986                                  ;-834 int eprc(char c)  {*cloc=c; cloc++; }
  8987 00004489 C9                       LEAVE
  8988 0000448A C3                       ret
  8989                                  ; ENDP
  8990 0000448B 5C6E45787065637465-     expect_0 db "\nExpected ASCII(dez): ",0
  8991 00004494 642041534349492864-
  8992 0000449D 657A293A2000       
  8993 000044A3 206E6F7420666F756E-     expect_1 db " not found",0
  8994 000044AC 6400               
  8995                                  
  8996                                  eprc:  ; *** PROC ***
  8997                                  ;Function : eprc, Number of local variables: 1
  8998                                  ;   # type sign width addr used name   list of local variables
  8999                                  ;  200 var sign byte   834 NULL c = bp+4;
  9000 000044AE C8000000                 ENTER  0,0
  9001 000044B2 8A4604                   mov al, [bp+4]
  9002 000044B5 8B1E[1600]               mov  bx, [cloc]
  9003 000044B9 8807                     mov  [bx], al
  9004 000044BB FF06[1600]               inc  word[cloc]
  9005                                  
  9006                                  ;-835 int eprs(char *s) {char c;  while(*s) { c=*s; eprc(c); s++; } }
  9007 000044BF C9                       LEAVE
  9008 000044C0 C3                       ret
  9009                                  ; ENDP
  9010                                  
  9011                                  eprs:  ; *** PROC ***
  9012                                  ;Function : eprs, Number of local variables: 2
  9013                                  ;   # type sign width addr used name   list of local variables
  9014                                  ;  200 ptr sign byte   835 NULL s = bp+4
  9015                                  ;  201 var sign byte   835 NULL c = bp-2;
  9016 000044C1 C8020000                 ENTER  2,0
  9017                                  .eprs520:
  9018 000044C5 8B5E04                   mov bx, [bp+4]
  9019 000044C8 8A07                     mov al, [bx]
  9020 000044CA B400                     mov ah, 0
  9021 000044CC 08C0                     or  al, al
  9022 000044CE 0F841B00                 je .eprs521
  9023 000044D2 8B5E04                   mov bx, [bp+4]
  9024 000044D5 8A07                     mov al, [bx]
  9025 000044D7 B400                     mov ah, 0
  9026 000044D9 8846FE                   mov [bp-2], al
  9027 000044DC 8A46FE                   mov al, byte [bp-2]
  9028 000044DF B400                     mov ah, 0
  9029 000044E1 50                       push ax
  9030 000044E2 E8C9FF                   call eprc
  9031 000044E5 83C402                   add  sp, 2
  9032 000044E8 FF4604                   inc  word[bp+4]
  9033 000044EB EBD8                     jmp .eprs520
  9034                                  .eprs521:
  9035                                  
  9036                                  ;-836 int prc(unsigned char c) { 
  9037 000044ED C9                       LEAVE
  9038 000044EE C3                       ret
  9039                                  ; ENDP
  9040                                  
  9041                                  prc:  ; *** PROC ***
  9042                                  
  9043                                  ;-837   if (c==10) {_AX=13; writetty(); }
  9044                                  
  9045                                  ;Function : prc, Number of local variables: 1
  9046                                  ;   # type sign width addr used name   list of local variables
  9047                                  ;  200 var unsg byte   836 NULL c = bp+4;
  9048 000044EF C8000000                 ENTER  0,0
  9049 000044F3 8A4604                   mov al, [bp+4]
  9050 000044F6 3C0A                     cmp al, 10
  9051 000044F8 0F850600                 jne .prc522
  9052 000044FC B80D00                   mov  ax, 13
  9053 000044FF E871BB                   call writetty
  9054                                  
  9055                                  ;-838   _AL=c; writetty(); 
  9056                                  
  9057                                  .prc522:
  9058 00004502 8A4604                   mov  al, [bp+4]
  9059 00004505 E86BBB                   call writetty
  9060                                  
  9061                                  ;-839   fputcR(c, fdout); 
  9062                                  
  9063 00004508 FF36[1A00]               push word [fdout]
  9064 0000450C 8A4604                   mov al, byte [bp+4]
  9065 0000450F B400                     mov ah, 0
  9066 00004511 50                       push ax
  9067 00004512 E814BC                   call fputcR
  9068 00004515 83C404                   add  sp, 4
  9069                                  
  9070                                  ;-840   }
  9071                                  
  9072                                  
  9073                                  ;-841 int prscomment(unsigned char *s) {unsigned char c;
  9074 00004518 C9                       LEAVE
  9075 00004519 C3                       ret
  9076                                  ; ENDP
  9077                                  
  9078                                  prscomment:  ; *** PROC ***
  9079                                  
  9080                                  ;-842   while(*s){c=*s;prc(c);s++;} }
  9081                                  
  9082                                  ;Function : prscomment, Number of local variables: 2
  9083                                  ;   # type sign width addr used name   list of local variables
  9084                                  ;  200 ptr unsg byte   841 NULL s = bp+4
  9085                                  ;  201 var unsg byte   841 NULL c = bp-2;
  9086 0000451A C8020000                 ENTER  2,0
  9087                                  .prscomment523:
  9088 0000451E 8B5E04                   mov bx, [bp+4]
  9089 00004521 8A07                     mov al, [bx]
  9090 00004523 B400                     mov ah, 0
  9091 00004525 08C0                     or  al, al
  9092 00004527 0F841B00                 je .prscomment524
  9093 0000452B 8B5E04                   mov bx, [bp+4]
  9094 0000452E 8A07                     mov al, [bx]
  9095 00004530 B400                     mov ah, 0
  9096 00004532 8846FE                   mov [bp-2], al
  9097 00004535 8A46FE                   mov al, byte [bp-2]
  9098 00004538 B400                     mov ah, 0
  9099 0000453A 50                       push ax
  9100 0000453B E8B1FF                   call prc
  9101 0000453E 83C402                   add  sp, 2
  9102 00004541 FF4604                   inc  word[bp+4]
  9103 00004544 EBD8                     jmp .prscomment523
  9104                                  .prscomment524:
  9105                                  
  9106                                  ;-843 int prnl() { prs("\n ");}
  9107 00004546 C9                       LEAVE
  9108 00004547 C3                       ret
  9109                                  ; ENDP
  9110                                  
  9111                                  prnl:  ; *** PROC ***
  9112 00004548 68[5245]                 push prnl_0
  9113 0000454B E80800                   call prs
  9114 0000454E 83C402                   add  sp, 2
  9115                                  
  9116                                  ;-844 
  9117                                  
  9118                                  
  9119                                  ;-845 int prs(unsigned char *s) {unsigned char c; int com; com=0;
  9120                                  
  9121 00004551 C3                       ret
  9122                                  ; ENDP
  9123 00004552 5C6E2000                prnl_0 db "\n ",0
  9124                                  
  9125                                  prs:  ; *** PROC ***
  9126                                  ;Function : prs, Number of local variables: 3
  9127                                  ;   # type sign width addr used name   list of local variables
  9128                                  ;  200 ptr unsg byte   845 NULL s = bp+4
  9129                                  ;  201 var unsg byte   845 NULL c = bp-2
  9130                                  ;  202 var sign word   845 NULL com = bp-4;
  9131 00004556 C8040000                 ENTER  4,0
  9132 0000455A B80000                   mov ax, 0
  9133 0000455D 8946FC                   mov [bp-4], ax
  9134                                  
  9135                                  ;-846   while(*s) { c=*s; if (c==34) if (com) com=0; else com=1;
  9136                                  
  9137                                  .prs525:
  9138 00004560 8B5E04                   mov bx, [bp+4]
  9139 00004563 8A07                     mov al, [bx]
  9140 00004565 B400                     mov ah, 0
  9141 00004567 08C0                     or  al, al
  9142 00004569 0F847B00                 je .prs526
  9143 0000456D 8B5E04                   mov bx, [bp+4]
  9144 00004570 8A07                     mov al, [bx]
  9145 00004572 B400                     mov ah, 0
  9146 00004574 8846FE                   mov [bp-2], al
  9147 00004577 8A46FE                   mov al, [bp-2]
  9148 0000457A 3C22                     cmp al, 34
  9149 0000457C 0F851800                 jne .prs527
  9150 00004580 8B46FC                   mov ax, [bp-4]
  9151 00004583 08C0                     or  al, al
  9152 00004585 0F840900                 je .prs528
  9153 00004589 B80000                   mov ax, 0
  9154 0000458C 8946FC                   mov [bp-4], ax
  9155 0000458F E90600                   jmp .prs529
  9156                                  .prs528:
  9157 00004592 B80100                   mov ax, 1
  9158 00004595 8946FC                   mov [bp-4], ax
  9159                                  
  9160                                  ;-847     if (c==92) { if (com==0) { s++; c=*s;
  9161                                  
  9162                                  .prs529:
  9163                                  .prs527:
  9164 00004598 8A46FE                   mov al, [bp-2]
  9165 0000459B 3C5C                     cmp al, 92
  9166 0000459D 0F853500                 jne .prs530
  9167 000045A1 8B46FC                   mov ax, [bp-4]
  9168 000045A4 83F800                   cmp ax, 0
  9169 000045A7 0F852B00                 jne .prs531
  9170 000045AB FF4604                   inc  word[bp+4]
  9171 000045AE 8B5E04                   mov bx, [bp+4]
  9172 000045B1 8A07                     mov al, [bx]
  9173 000045B3 B400                     mov ah, 0
  9174 000045B5 8846FE                   mov [bp-2], al
  9175                                  
  9176                                  ;-848           if (c=='n') c=10; if (c=='t') c= 9;
  9177                                  
  9178 000045B8 8A46FE                   mov al, [bp-2]
  9179 000045BB 3C6E                     cmp al, 110
  9180 000045BD 0F850600                 jne .prs532
  9181 000045C1 B80A00                   mov ax, 10
  9182 000045C4 8846FE                   mov [bp-2], al
  9183                                  .prs532:
  9184 000045C7 8A46FE                   mov al, [bp-2]
  9185 000045CA 3C74                     cmp al, 116
  9186 000045CC 0F850600                 jne .prs533
  9187 000045D0 B80900                   mov ax, 9
  9188 000045D3 8846FE                   mov [bp-2], al
  9189                                  
  9190                                  ;-849     } } prc(c); s++;  } }
  9191                                  
  9192                                  .prs533:
  9193                                  .prs531:
  9194                                  .prs530:
  9195 000045D6 8A46FE                   mov al, byte [bp-2]
  9196 000045D9 B400                     mov ah, 0
  9197 000045DB 50                       push ax
  9198 000045DC E810FF                   call prc
  9199 000045DF 83C402                   add  sp, 2
  9200 000045E2 FF4604                   inc  word[bp+4]
  9201 000045E5 E978FF                   jmp .prs525
  9202                                  .prs526:
  9203                                  
  9204                                  ;-850 int eprnum(int n){int e; if(n<0) { eprc('-'); n=mkneg(n); }
  9205 000045E8 C9                       LEAVE
  9206 000045E9 C3                       ret
  9207                                  ; ENDP
  9208                                  
  9209                                  eprnum:  ; *** PROC ***
  9210                                  ;Function : eprnum, Number of local variables: 2
  9211                                  ;   # type sign width addr used name   list of local variables
  9212                                  ;  200 var sign word   850 NULL n = bp+4
  9213                                  ;  201 var sign word   850 NULL e = bp-2;
  9214 000045EA C8020000                 ENTER  2,0
  9215 000045EE 8B4604                   mov ax, [bp+4]
  9216 000045F1 83F800                   cmp ax, 0
  9217 000045F4 0F8D1400                 jge .eprnum534
  9218 000045F8 6A2D                     push 45
  9219 000045FA E8B1FE                   call eprc
  9220 000045FD 83C402                   add  sp, 2
  9221 00004600 FF7604                   push word [bp+4]
  9222 00004603 E8BCBA                   call mkneg
  9223 00004606 83C402                   add  sp, 2
  9224 00004609 894604                   mov [bp+4], ax
  9225                                  
  9226                                  ;-851   if (n >= 10) {e=n/10; eprnum(e);}  n=n%10; n=n+'0'; eprc(n); }
  9227                                  
  9228                                  .eprnum534:
  9229 0000460C 8B4604                   mov ax, [bp+4]
  9230 0000460F 83F80A                   cmp ax, 10 ;unsigned : 1
  9231 00004612 0F8C1500                 jl  .eprnum535
  9232 00004616 8B4604                   mov ax, [bp+4]
  9233 00004619 BB0A00                   mov bx, 10
  9234 0000461C 99                       cwd
  9235 0000461D F7FB                     idiv bx
  9236 0000461F 8946FE                   mov [bp-2], ax
  9237 00004622 FF76FE                   push word [bp-2]
  9238 00004625 E8C2FF                   call eprnum
  9239 00004628 83C402                   add  sp, 2
  9240                                  .eprnum535:
  9241 0000462B 8B4604                   mov ax, [bp+4]
  9242 0000462E BB0A00                   mov bx, 10
  9243 00004631 99                       cwd
  9244 00004632 F7FB                     idiv bx
  9245 00004634 89D0                     mov ax, dx
  9246 00004636 894604                   mov [bp+4], ax
  9247 00004639 8B4604                   mov ax, [bp+4]
  9248 0000463C 83C030                   add ax, 48
  9249 0000463F 894604                   mov [bp+4], ax
  9250 00004642 FF7604                   push word [bp+4]
  9251 00004645 E866FE                   call eprc
  9252 00004648 83C402                   add  sp, 2
  9253                                  
  9254                                  ;-852 int pint1 (int n){int e; if(n<0) {  prc('-');  n=mkneg(n); }
  9255 0000464B C9                       LEAVE
  9256 0000464C C3                       ret
  9257                                  ; ENDP
  9258                                  
  9259                                  pint1:  ; *** PROC ***
  9260                                  ;Function : pint1, Number of local variables: 2
  9261                                  ;   # type sign width addr used name   list of local variables
  9262                                  ;  200 var sign word   852 NULL n = bp+4
  9263                                  ;  201 var sign word   852 NULL e = bp-2;
  9264 0000464D C8020000                 ENTER  2,0
  9265 00004651 8B4604                   mov ax, [bp+4]
  9266 00004654 83F800                   cmp ax, 0
  9267 00004657 0F8D1400                 jge .pint1536
  9268 0000465B 6A2D                     push 45
  9269 0000465D E88FFE                   call prc
  9270 00004660 83C402                   add  sp, 2
  9271 00004663 FF7604                   push word [bp+4]
  9272 00004666 E859BA                   call mkneg
  9273 00004669 83C402                   add  sp, 2
  9274 0000466C 894604                   mov [bp+4], ax
  9275                                  
  9276                                  ;-853   if (n >= 10) {e=n/10;  pint1(e);}  n=n%10; n=n+'0'; prc(n); }
  9277                                  
  9278                                  .pint1536:
  9279 0000466F 8B4604                   mov ax, [bp+4]
  9280 00004672 83F80A                   cmp ax, 10 ;unsigned : 1
  9281 00004675 0F8C1500                 jl  .pint1537
  9282 00004679 8B4604                   mov ax, [bp+4]
  9283 0000467C BB0A00                   mov bx, 10
  9284 0000467F 99                       cwd
  9285 00004680 F7FB                     idiv bx
  9286 00004682 8946FE                   mov [bp-2], ax
  9287 00004685 FF76FE                   push word [bp-2]
  9288 00004688 E8C2FF                   call pint1
  9289 0000468B 83C402                   add  sp, 2
  9290                                  .pint1537:
  9291 0000468E 8B4604                   mov ax, [bp+4]
  9292 00004691 BB0A00                   mov bx, 10
  9293 00004694 99                       cwd
  9294 00004695 F7FB                     idiv bx
  9295 00004697 89D0                     mov ax, dx
  9296 00004699 894604                   mov [bp+4], ax
  9297 0000469C 8B4604                   mov ax, [bp+4]
  9298 0000469F 83C030                   add ax, 48
  9299 000046A2 894604                   mov [bp+4], ax
  9300 000046A5 FF7604                   push word [bp+4]
  9301 000046A8 E844FE                   call prc
  9302 000046AB 83C402                   add  sp, 2
  9303                                  
  9304                                  ;-854 int prunsign1(unsigned int n) { unsigned int e;
  9305 000046AE C9                       LEAVE
  9306 000046AF C3                       ret
  9307                                  ; ENDP
  9308                                  
  9309                                  prunsign1:  ; *** PROC ***
  9310                                  
  9311                                  ;-855   if ( _ n >= 10) {  e=n/10; /*DIV*/ prunsign1(e); }
  9312                                  
  9313                                  ;Function : prunsign1, Number of local variables: 2
  9314                                  ;   # type sign width addr used name   list of local variables
  9315                                  ;  200 var unsg word   854 NULL n = bp+4
  9316                                  ;  201 var unsg word   854 NULL e = bp-2;
  9317 000046B0 C8020000                 ENTER  2,0 ; constant expression
  9318 000046B4 837E040A                cmp word[bp+4], 10 ;unsigned : 0
  9319 000046B8 0F821700                 jb  .prunsign1538
  9320 000046BC 8B4604                   mov ax, [bp+4]
  9321 000046BF BB0A00                   mov bx, 10
  9322 000046C2 BA0000                   mov dx, 0
  9323 000046C5 F7F3                     div bx
  9324 000046C7 8946FE                   mov [bp-2], ax
  9325 000046CA FF76FE                   push word [bp-2]
  9326 000046CD E8E0FF                   call prunsign1
  9327 000046D0 83C402                   add  sp, 2
  9328                                  
  9329                                  ;-856     n = n % 10; /*unsigned mod*/   n += '0'; prc(n); }
  9330                                  
  9331                                  .prunsign1538:
  9332 000046D3 8B4604                   mov ax, [bp+4]
  9333 000046D6 BB0A00                   mov bx, 10
  9334 000046D9 BA0000                   mov dx, 0
  9335 000046DC F7F3                     div bx
  9336 000046DE 89D0                     mov ax, dx
  9337 000046E0 894604                   mov [bp+4], ax
  9338 000046E3 83460430                 add  word[bp+4], 48
  9339 000046E7 FF7604                   push word [bp+4]
  9340 000046EA E802FE                   call prc
  9341 000046ED 83C402                   add  sp, 2
  9342                                  
  9343                                  ;-857 int printint51(unsigned int j)  {
  9344 000046F0 C9                       LEAVE
  9345 000046F1 C3                       ret
  9346                                  ; ENDP
  9347                                  
  9348                                  printint51:  ; *** PROC ***
  9349                                  
  9350                                  ;-858   if (j<10000) prc(32); if (j<1000) prc(32);  if (j<100) prc(32);
  9351                                  
  9352                                  ;Function : printint51, Number of local variables: 1
  9353                                  ;   # type sign width addr used name   list of local variables
  9354                                  ;  200 var unsg word   857 NULL j = bp+4;
  9355 000046F2 C8000000                 ENTER  0,0
  9356 000046F6 8B4604                   mov ax, [bp+4]
  9357 000046F9 3D1027                   cmp ax, 10000
  9358 000046FC 0F8D0800                 jge .printint51539
  9359 00004700 6A20                     push 32
  9360 00004702 E8EAFD                   call prc
  9361 00004705 83C402                   add  sp, 2
  9362                                  .printint51539:
  9363 00004708 8B4604                   mov ax, [bp+4]
  9364 0000470B 3DE803                   cmp ax, 1000
  9365 0000470E 0F8D0800                 jge .printint51540
  9366 00004712 6A20                     push 32
  9367 00004714 E8D8FD                   call prc
  9368 00004717 83C402                   add  sp, 2
  9369                                  .printint51540:
  9370 0000471A 8B4604                   mov ax, [bp+4]
  9371 0000471D 83F864                   cmp ax, 100
  9372 00004720 0F8D0800                 jge .printint51541
  9373 00004724 6A20                     push 32
  9374 00004726 E8C6FD                   call prc
  9375 00004729 83C402                   add  sp, 2
  9376                                  
  9377                                  ;-859    if (j<10) prc(32);  prunsign1(j); }
  9378                                  
  9379                                  .printint51541:
  9380 0000472C 8B4604                   mov ax, [bp+4]
  9381 0000472F 83F80A                   cmp ax, 10
  9382 00004732 0F8D0800                 jge .printint51542
  9383 00004736 6A20                     push 32
  9384 00004738 E8B4FD                   call prc
  9385 0000473B 83C402                   add  sp, 2
  9386                                  .printint51542:
  9387 0000473E FF7604                   push word [bp+4]
  9388 00004741 E86CFF                   call prunsign1
  9389 00004744 83C402                   add  sp, 2
  9390                                  
  9391                                  ;-860 
  9392                                  
  9393                                  
  9394                                  ;-861 int fgets1() { char c; c=*fgetsp;
  9395 00004747 C9                       LEAVE
  9396 00004748 C3                       ret
  9397                                  ; ENDP
  9398                                  
  9399                                  fgets1:  ; *** PROC ***
  9400                                  ;Function : fgets1, Number of local variables: 1
  9401                                  ;   # type sign width addr used name   list of local variables
  9402                                  ;  200 var sign byte   861 NULL c = bp-2;
  9403 00004749 C8020000                 ENTER  2,0
  9404 0000474D 8B1E[6200]               mov bx, [fgetsp]
  9405 00004751 8A07                     mov al, [bx]
  9406 00004753 B400                     mov ah, 0
  9407 00004755 8846FE                   mov [bp-2], al
  9408                                  
  9409                                  ;-862   if (c==0) { printinputline(); if (DOS_NoBytes == 0) return 0;
  9410                                  
  9411 00004758 8A46FE                   mov al, [bp-2]
  9412 0000475B 3C00                     cmp al, 0
  9413 0000475D 0F852A00                 jne .fgets1543
  9414 00004761 E83700                   call printinputline
  9415 00004764 A1[7000]                 mov ax, [DOS_NoBytes]
  9416 00004767 83F800                   cmp ax, 0
  9417 0000476A 0F850600                 jne .fgets1544
  9418 0000476E B80000                   mov ax, 0
  9419 00004771 E92500                   jmp .retn
  9420                                  
  9421                                  ;-863     fgetsp=&fgetsdest; c=*fgetsp; spalte=0; }
  9422                                  
  9423                                  .fgets1544:
  9424 00004774 B80FD0                   mov ax, fgetsdest
  9425 00004777 A3[6200]                 mov word [fgetsp], ax
  9426 0000477A 8B1E[6200]               mov bx, [fgetsp]
  9427 0000477E 8A07                     mov al, [bx]
  9428 00004780 B400                     mov ah, 0
  9429 00004782 8846FE                   mov [bp-2], al
  9430 00004785 B80000                   mov ax, 0
  9431 00004788 A3[1F00]                 mov word [spalte], ax
  9432                                  
  9433                                  ;-864   fgetsp++; spalte++;  return c; }
  9434                                  
  9435                                  .fgets1543:
  9436 0000478B FF06[6200]               inc  word[fgetsp]
  9437 0000478F FF06[1F00]               inc  word[spalte]
  9438 00004793 8A46FE                   mov al, [bp-2]
  9439 00004796 E90000                   jmp .retn
  9440                                  
  9441                                  ;-865 int printinputline() { fgetsp=&fgetsdest;
  9442                                  
  9443 00004799 C9                       .retn: LEAVE
  9444 0000479A C3                       ret
  9445                                  ; ENDP
  9446                                  
  9447                                  printinputline:  ; *** PROC ***
  9448 0000479B B80FD0                   mov ax, fgetsdest
  9449 0000479E A3[6200]                 mov word [fgetsp], ax
  9450                                  
  9451                                  ;-866   do {DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);
  9452                                  
  9453                                  .printinputline545:
  9454 000047A1 6A01                     push 1
  9455 000047A3 FF36[1800]               push word [fdin]
  9456 000047A7 8D06[7200]               lea  ax, [DOS_ByteRead]
  9457 000047AB 50                       push ax
  9458 000047AC E865B9                   call readRL
  9459 000047AF 83C406                   add  sp, 6
  9460 000047B2 A3[7000]                 mov word [DOS_NoBytes], ax
  9461                                  
  9462                                  ;-867   if (DOS_NoBytes == 0) return; 
  9463                                  
  9464 000047B5 A1[7000]                 mov ax, [DOS_NoBytes]
  9465 000047B8 83F800                   cmp ax, 0
  9466 000047BB 0F850300                 jne .printinputline546
  9467 000047BF E95400                   jmp .retn
  9468                                  
  9469                                  ;-868     *fgetsp=DOS_ByteRead; fgetsp++;} 
  9470                                  
  9471                                  .printinputline546:
  9472 000047C2 A0[7200]                 mov al, [DOS_ByteRead]
  9473 000047C5 8B1E[6200]               mov  bx, [fgetsp]
  9474 000047C9 8807                     mov  [bx], al
  9475 000047CB FF06[6200]               inc  word[fgetsp]
  9476                                  
  9477                                  ;-869   while (DOS_ByteRead != 10); *fgetsp=0;
  9478                                  
  9479 000047CF A0[7200]                 mov al, [DOS_ByteRead]
  9480 000047D2 3C0A                     cmp al, 10
  9481 000047D4 0F840200                 je  .printinputline547
  9482 000047D8 EBC7                     jmp .printinputline545
  9483                                  .printinputline547:
  9484 000047DA B80000                   mov ax, 0
  9485 000047DD 8B1E[6200]               mov  bx, [fgetsp]
  9486 000047E1 8807                     mov  [bx], al
  9487                                  
  9488                                  ;-870     if (fdout) { prs("\n\n;-"); prunsign1(lineno); prc(' '); lineno++;
  9489                                  
  9490 000047E3 A1[1A00]                 mov ax, [fdout]
  9491 000047E6 08C0                     or  al, al
  9492 000047E8 0F842A00                 je .printinputline548
  9493 000047EC 68[1748]                 push printinputline_0
  9494 000047EF E864FD                   call prs
  9495 000047F2 83C402                   add  sp, 2
  9496 000047F5 FF36[6600]               push word [lineno]
  9497 000047F9 E8B4FE                   call prunsign1
  9498 000047FC 83C402                   add  sp, 2
  9499 000047FF 6A20                     push 32
  9500 00004801 E8EBFC                   call prc
  9501 00004804 83C402                   add  sp, 2
  9502 00004807 FF06[6600]               inc  word[lineno]
  9503                                  
  9504                                  ;-871       prscomment(&fgetsdest);}
  9505                                  
  9506 0000480B 8D060FD0                 lea  ax, [fgetsdest]
  9507 0000480F 50                       push ax
  9508 00004810 E807FD                   call prscomment
  9509 00004813 83C402                   add  sp, 2
  9510                                  
  9511                                  ;-872 }
  9512                                  
  9513                                  .printinputline548:
  9514                                  
  9515                                  ;-873 int end1(int n) {fcloseR(fdin); fcloseR(fdout); exitR(n); }
  9516                                  
  9517                                   .retn:
  9518 00004816 C3                       ret
  9519                                  ; ENDP
  9520 00004817 5C6E5C6E3B2D00          printinputline_0 db "\n\n;-",0
  9521                                  
  9522                                  end1:  ; *** PROC ***
  9523                                  ;Function : end1, Number of local variables: 1
  9524                                  ;   # type sign width addr used name   list of local variables
  9525                                  ;  200 var sign word   873 NULL n = bp+4;
  9526 0000481E C8000000                 ENTER  0,0
  9527 00004822 FF36[1800]               push word [fdin]
  9528 00004826 E8CEB8                   call fcloseR
  9529 00004829 83C402                   add  sp, 2
  9530 0000482C FF36[1A00]               push word [fdout]
  9531 00004830 E8C4B8                   call fcloseR
  9532 00004833 83C402                   add  sp, 2
  9533 00004836 FF7604                   push word [bp+4]
  9534 00004839 E8CAB8                   call exitR
  9535 0000483C 83C402                   add  sp, 2
  9536                                  
  9537                                  ;-874 int error1(char *s) { 
  9538 0000483F C9                       LEAVE
  9539 00004840 C3                       ret
  9540                                  ; ENDP
  9541                                  
  9542                                  error1:  ; *** PROC ***
  9543                                  
  9544                                  ;-875   lineno--;
  9545                                  
  9546                                  ;Function : error1, Number of local variables: 1
  9547                                  ;   # type sign width addr used name   list of local variables
  9548                                  ;  200 ptr sign byte   874 NULL s = bp+4;
  9549 00004841 C8000000                 ENTER  0,0
  9550 00004845 FF0E[6600]               dec  word[lineno]
  9551                                  
  9552                                  ;-876   prnl(); prscomment(&fgetsdest);
  9553                                  
  9554 00004849 E8FCFC                   call prnl
  9555 0000484C 8D060FD0                 lea  ax, [fgetsdest]
  9556 00004850 50                       push ax
  9557 00004851 E8C6FC                   call prscomment
  9558 00004854 83C402                   add  sp, 2
  9559                                  
  9560                                  ;-877   prs(";Line: "); prunsign1(lineno);
  9561                                  
  9562 00004857 68[EA48]                 push error1_0
  9563 0000485A E8F9FC                   call prs
  9564 0000485D 83C402                   add  sp, 2
  9565 00004860 FF36[6600]               push word [lineno]
  9566 00004864 E849FE                   call prunsign1
  9567 00004867 83C402                   add  sp, 2
  9568                                  
  9569                                  ;-878   prs(" ************** ERROR: "); prs(s);
  9570                                  
  9571 0000486A 68[F248]                 push error1_1
  9572 0000486D E8E6FC                   call prs
  9573 00004870 83C402                   add  sp, 2
  9574 00004873 FF7604                   push word [bp+4]
  9575 00004876 E8DDFC                   call prs
  9576 00004879 83C402                   add  sp, 2
  9577                                  
  9578                                  ;-879   prs("  in column: "); pint1(spalte);
  9579                                  
  9580 0000487C 68[0A49]                 push error1_2
  9581 0000487F E8D4FC                   call prs
  9582 00004882 83C402                   add  sp, 2
  9583 00004885 FF36[1F00]               push word [spalte]
  9584 00004889 E8C1FD                   call pint1
  9585 0000488C 83C402                   add  sp, 2
  9586                                  
  9587                                  ;-880   prs("\nToken: "); prunsign1(token); prs(", globC: "); prc(globC);
  9588                                  
  9589 0000488F 68[1849]                 push error1_3
  9590 00004892 E8C1FC                   call prs
  9591 00004895 83C402                   add  sp, 2
  9592 00004898 FF36[1C00]               push word [token]
  9593 0000489C E811FE                   call prunsign1
  9594 0000489F 83C402                   add  sp, 2
  9595 000048A2 68[2249]                 push error1_4
  9596 000048A5 E8AEFC                   call prs
  9597 000048A8 83C402                   add  sp, 2
  9598 000048AB A0[1E00]                 mov al, byte [globC]
  9599 000048AE B400                     mov ah, 0
  9600 000048B0 50                       push ax
  9601 000048B1 E83BFC                   call prc
  9602 000048B4 83C402                   add  sp, 2
  9603                                  
  9604                                  ;-881   prs(", thechar: "); pint1(thechar); prs(", symbol: "); prs(symbol);
  9605                                  
  9606 000048B7 68[2C49]                 push error1_5
  9607 000048BA E899FC                   call prs
  9608 000048BD 83C402                   add  sp, 2
  9609 000048C0 A0[2100]                 mov al, byte [thechar]
  9610 000048C3 B400                     mov ah, 0
  9611 000048C5 50                       push ax
  9612 000048C6 E884FD                   call pint1
  9613 000048C9 83C402                   add  sp, 2
  9614 000048CC 68[3849]                 push error1_6
  9615 000048CF E884FC                   call prs
  9616 000048D2 83C402                   add  sp, 2
  9617 000048D5 8D062B81                 lea  ax, [symbol]
  9618 000048D9 50                       push ax
  9619 000048DA E879FC                   call prs
  9620 000048DD 83C402                   add  sp, 2
  9621                                  
  9622                                  ;-882   end1(1); }
  9623                                  
  9624 000048E0 6A01                     push 1
  9625 000048E2 E839FF                   call end1
  9626 000048E5 83C402                   add  sp, 2
  9627                                  
  9628                                  ;-883 int listproc() {int i; 
  9629 000048E8 C9                       LEAVE
  9630 000048E9 C3                       ret
  9631                                  ; ENDP
  9632 000048EA 3B4C696E653A2000        error1_0 db ";Line: ",0
  9633 000048F2 202A2A2A2A2A2A2A2A-     error1_1 db " ************** ERROR: ",0
  9634 000048FB 2A2A2A2A2A2A204552-
  9635 00004904 524F523A2000       
  9636 0000490A 2020696E20636F6C75-     error1_2 db "  in column: ",0
  9637 00004913 6D6E3A2000         
  9638 00004918 5C6E546F6B656E3A20-     error1_3 db "\nToken: ",0
  9639 00004921 00                 
  9640 00004922 2C20676C6F62433A20-     error1_4 db ", globC: ",0
  9641 0000492B 00                 
  9642 0000492C 2C2074686563686172-     error1_5 db ", thechar: ",0
  9643 00004935 3A2000             
  9644 00004938 2C2073796D626F6C3A-     error1_6 db ", symbol: ",0
  9645 00004941 2000               
  9646                                  
  9647                                  listproc:  ; *** PROC ***
  9648                                  
  9649                                  ;-884   if (LTop > LSTART) {
  9650                                  
  9651                                  ;Function : listproc, Number of local variables: 1
  9652                                  ;   # type sign width addr used name   list of local variables
  9653                                  ;  200 var sign word   883 NULL i = bp-2;
  9654 00004943 C8020000                 ENTER  2,0
  9655 00004947 A1[2C00]                 mov ax, [LTop]
  9656 0000494A 3DC800                   cmp ax, 200
  9657 0000494D 0F8E5700                 jle .listproc549
  9658                                  
  9659                                  ;-885   prs("\n;Function : "); prs(fname);
  9660                                  
  9661 00004951 68[AA49]                 push listproc_0
  9662 00004954 E8FFFB                   call prs
  9663 00004957 83C402                   add  sp, 2
  9664 0000495A 8D06AB81                 lea  ax, [fname]
  9665 0000495E 50                       push ax
  9666 0000495F E8F4FB                   call prs
  9667 00004962 83C402                   add  sp, 2
  9668                                  
  9669                                  ;-886   prs(", Number of local variables: "); i=LTop - LSTART; prunsign1(i);
  9670                                  
  9671 00004965 68[B949]                 push listproc_1
  9672 00004968 E8EBFB                   call prs
  9673 0000496B 83C402                   add  sp, 2
  9674 0000496E A1[2C00]                 mov ax, [LTop]
  9675 00004971 2DC800                   sub ax, 200
  9676 00004974 8946FE                   mov [bp-2], ax
  9677 00004977 FF76FE                   push word [bp-2]
  9678 0000497A E833FD                   call prunsign1
  9679 0000497D 83C402                   add  sp, 2
  9680                                  
  9681                                  ;-887   prs("\n;   # type sign width addr used name   list of local variables");
  9682                                  
  9683 00004980 68[D749]                 push listproc_2
  9684 00004983 E8D0FB                   call prs
  9685 00004986 83C402                   add  sp, 2
  9686                                  
  9687                                  ;-888     i=LSTART; 
  9688                                  
  9689 00004989 B8C800                   mov ax, 200
  9690 0000498C 8946FE                   mov [bp-2], ax
  9691                                  
  9692                                  ;-889     while (i < LTop) { listvar(i); i++; } } 
  9693                                  
  9694                                  .listproc550:
  9695 0000498F 8B46FE                   mov ax, [bp-2]
  9696 00004992 3B06[2C00]               cmp ax, [LTop]
  9697 00004996 0F8D0E00                 jge .listproc551
  9698 0000499A FF76FE                   push word [bp-2]
  9699 0000499D E87800                   call listvar
  9700 000049A0 83C402                   add  sp, 2
  9701 000049A3 FF46FE                   inc  word[bp-2]
  9702 000049A6 EBE7                     jmp .listproc550
  9703                                  .listproc551:
  9704                                  
  9705                                  ;-890 }
  9706                                  
  9707                                  .listproc549:
  9708                                  
  9709                                  ;-891 int listvar(unsigned int i) {unsigned int j; char c;
  9710 000049A8 C9                       LEAVE
  9711 000049A9 C3                       ret
  9712                                  ; ENDP
  9713 000049AA 5C6E3B46756E637469-     listproc_0 db "\n;Function : ",0
  9714 000049B3 6F6E203A2000       
  9715 000049B9 2C204E756D62657220-     listproc_1 db ", Number of local variables: ",0
  9716 000049C2 6F66206C6F63616C20-
  9717 000049CB 7661726961626C6573-
  9718 000049D4 3A2000             
  9719 000049D7 5C6E3B202020232074-     listproc_2 db "\n;   # type sign width addr used name   list of local variables",0
  9720 000049E0 797065207369676E20-
  9721 000049E9 776964746820616464-
  9722 000049F2 722075736564206E61-
  9723 000049FB 6D652020206C697374-
  9724 00004A04 206F66206C6F63616C-
  9725 00004A0D 207661726961626C65-
  9726 00004A16 7300               
  9727                                  
  9728                                  listvar:  ; *** PROC ***
  9729                                  
  9730                                  ;-892   prs("\n;"); printint51(i); prc(32);
  9731                                  
  9732                                  ;Function : listvar, Number of local variables: 3
  9733                                  ;   # type sign width addr used name   list of local variables
  9734                                  ;  200 var unsg word   891 NULL i = bp+4
  9735                                  ;  201 var unsg word   891 NULL j = bp-2
  9736                                  ;  202 var sign byte   891 NULL c = bp-4;
  9737 00004A18 C8040000                 ENTER  4,0
  9738 00004A1C 68[044C]                 push listvar_0
  9739 00004A1F E834FB                   call prs
  9740 00004A22 83C402                   add  sp, 2
  9741 00004A25 FF7604                   push word [bp+4]
  9742 00004A28 E8C7FC                   call printint51
  9743 00004A2B 83C402                   add  sp, 2
  9744 00004A2E 6A20                     push 32
  9745 00004A30 E8BCFA                   call prc
  9746 00004A33 83C402                   add  sp, 2
  9747                                  
  9748                                  ;-893   c=GType [i]; if(c=='V')prs("var ");   if(c=='*')prs("ptr ");
  9749                                  
  9750 00004A36 8B5E04                   mov bx, [bp+4]
  9751 00004A39 8A87B782                 mov al, [GType + bx]
  9752 00004A3D 8846FC                   mov [bp-4], al
  9753 00004A40 8A46FC                   mov al, [bp-4]
  9754 00004A43 3C56                     cmp al, 86
  9755 00004A45 0F850900                 jne .listvar552
  9756 00004A49 68[084C]                 push listvar_1
  9757 00004A4C E807FB                   call prs
  9758 00004A4F 83C402                   add  sp, 2
  9759                                  .listvar552:
  9760 00004A52 8A46FC                   mov al, [bp-4]
  9761 00004A55 3C2A                     cmp al, 42
  9762 00004A57 0F850900                 jne .listvar553
  9763 00004A5B 68[0D4C]                 push listvar_2
  9764 00004A5E E8F5FA                   call prs
  9765 00004A61 83C402                   add  sp, 2
  9766                                  
  9767                                  ;-894                if(c=='&')prs("arr ");   if(c=='#')prs("def ");
  9768                                  
  9769                                  .listvar553:
  9770 00004A64 8A46FC                   mov al, [bp-4]
  9771 00004A67 3C26                     cmp al, 38
  9772 00004A69 0F850900                 jne .listvar554
  9773 00004A6D 68[124C]                 push listvar_3
  9774 00004A70 E8E3FA                   call prs
  9775 00004A73 83C402                   add  sp, 2
  9776                                  .listvar554:
  9777 00004A76 8A46FC                   mov al, [bp-4]
  9778 00004A79 3C23                     cmp al, 35
  9779 00004A7B 0F850900                 jne .listvar555
  9780 00004A7F 68[174C]                 push listvar_4
  9781 00004A82 E8D1FA                   call prs
  9782 00004A85 83C402                   add  sp, 2
  9783                                  
  9784                                  ;-895   c=GSign [i]; if(c=='S')prs("sign ");  if(c=='U')prs("unsg ");
  9785                                  
  9786                                  .listvar555:
  9787 00004A88 8B5E04                   mov bx, [bp+4]
  9788 00004A8B 8A87E383                 mov al, [GSign + bx]
  9789 00004A8F 8846FC                   mov [bp-4], al
  9790 00004A92 8A46FC                   mov al, [bp-4]
  9791 00004A95 3C53                     cmp al, 83
  9792 00004A97 0F850900                 jne .listvar556
  9793 00004A9B 68[1C4C]                 push listvar_5
  9794 00004A9E E8B5FA                   call prs
  9795 00004AA1 83C402                   add  sp, 2
  9796                                  .listvar556:
  9797 00004AA4 8A46FC                   mov al, [bp-4]
  9798 00004AA7 3C55                     cmp al, 85
  9799 00004AA9 0F850900                 jne .listvar557
  9800 00004AAD 68[224C]                 push listvar_6
  9801 00004AB0 E8A3FA                   call prs
  9802 00004AB3 83C402                   add  sp, 2
  9803                                  
  9804                                  ;-896   c=GWidth[i]; if(c==  1)prs("byte " ); if(c==  2)prs("word " );
  9805                                  
  9806                                  .listvar557:
  9807 00004AB6 8B5E04                   mov bx, [bp+4]
  9808 00004AB9 8A870F85                 mov al, [GWidth + bx]
  9809 00004ABD 8846FC                   mov [bp-4], al
  9810 00004AC0 8A46FC                   mov al, [bp-4]
  9811 00004AC3 3C01                     cmp al, 1
  9812 00004AC5 0F850900                 jne .listvar558
  9813 00004AC9 68[284C]                 push listvar_7
  9814 00004ACC E887FA                   call prs
  9815 00004ACF 83C402                   add  sp, 2
  9816                                  .listvar558:
  9817 00004AD2 8A46FC                   mov al, [bp-4]
  9818 00004AD5 3C02                     cmp al, 2
  9819 00004AD7 0F850900                 jne .listvar559
  9820 00004ADB 68[2E4C]                 push listvar_8
  9821 00004ADE E875FA                   call prs
  9822 00004AE1 83C402                   add  sp, 2
  9823                                  
  9824                                  ;-897                if(c==  4)prs("dwrd " );
  9825                                  
  9826                                  .listvar559:
  9827 00004AE4 8A46FC                   mov al, [bp-4]
  9828 00004AE7 3C04                     cmp al, 4
  9829 00004AE9 0F850900                 jne .listvar560
  9830 00004AED 68[344C]                 push listvar_9
  9831 00004AF0 E863FA                   call prs
  9832 00004AF3 83C402                   add  sp, 2
  9833                                  
  9834                                  ;-898   j=GAdr[i]; printint51(j);
  9835                                  
  9836                                  .listvar560:
  9837 00004AF6 8B5E04                   mov bx, [bp+4]
  9838 00004AF9 D1E3                     shl bx, 1
  9839 00004AFB 8B873B86                 mov ax, [GAdr + bx]
  9840 00004AFF 8946FE                   mov [bp-2], ax
  9841 00004B02 FF76FE                   push word [bp-2]
  9842 00004B05 E8EAFB                   call printint51
  9843 00004B08 83C402                   add  sp, 2
  9844                                  
  9845                                  ;-899   j=GUsed[i]; if (j) printint51(j);
  9846                                  
  9847 00004B0B 8B5E04                   mov bx, [bp+4]
  9848 00004B0E D1E3                     shl bx, 1
  9849 00004B10 8B879388                 mov ax, [GUsed + bx]
  9850 00004B14 8946FE                   mov [bp-2], ax
  9851 00004B17 8B46FE                   mov ax, [bp-2]
  9852 00004B1A 08C0                     or  al, al
  9853 00004B1C 0F840C00                 je .listvar561
  9854 00004B20 FF76FE                   push word [bp-2]
  9855 00004B23 E8CCFB                   call printint51
  9856 00004B26 83C402                   add  sp, 2
  9857                                  
  9858                                  ;-900   else {if(GType[i]=='#') prs("    -"); else prs(" NULL");}
  9859                                  
  9860 00004B29 E92200                   jmp .listvar562
  9861                                  .listvar561:
  9862 00004B2C 8B5E04                   mov bx, [bp+4]
  9863 00004B2F 8A87B782                 mov al, [GType + bx]
  9864 00004B33 3C23                     cmp al, 35
  9865 00004B35 0F850C00                 jne .listvar563
  9866 00004B39 68[3A4C]                 push listvar_10
  9867 00004B3C E817FA                   call prs
  9868 00004B3F 83C402                   add  sp, 2
  9869 00004B42 E90900                   jmp .listvar564
  9870                                  .listvar563:
  9871 00004B45 68[404C]                 push listvar_11
  9872 00004B48 E80BFA                   call prs
  9873 00004B4B 83C402                   add  sp, 2
  9874                                  .listvar564:
  9875                                  
  9876                                  ;-901   prc(32);  pt=adrofname(i); prs(pt);
  9877                                  
  9878                                  .listvar562:
  9879 00004B4E 6A20                     push 32
  9880 00004B50 E89CF9                   call prc
  9881 00004B53 83C402                   add  sp, 2
  9882 00004B56 FF7604                   push word [bp+4]
  9883 00004B59 E80DBE                   call adrofname
  9884 00004B5C 83C402                   add  sp, 2
  9885 00004B5F A3[6A00]                 mov word [pt], ax
  9886 00004B62 FF36[6A00]               push word [pt]
  9887 00004B66 E8EDF9                   call prs
  9888 00004B69 83C402                   add  sp, 2
  9889                                  
  9890                                  ;-902   if(GType[i]=='#') { prc('='); j=GData[i]; prunsign1(j); }
  9891                                  
  9892 00004B6C 8B5E04                   mov bx, [bp+4]
  9893 00004B6F 8A87B782                 mov al, [GType + bx]
  9894 00004B73 3C23                     cmp al, 35
  9895 00004B75 0F851D00                 jne .listvar565
  9896 00004B79 6A3D                     push 61
  9897 00004B7B E871F9                   call prc
  9898 00004B7E 83C402                   add  sp, 2
  9899 00004B81 8B5E04                   mov bx, [bp+4]
  9900 00004B84 D1E3                     shl bx, 1
  9901 00004B86 8B87EB8A                 mov ax, [GData + bx]
  9902 00004B8A 8946FE                   mov [bp-2], ax
  9903 00004B8D FF76FE                   push word [bp-2]
  9904 00004B90 E81DFB                   call prunsign1
  9905 00004B93 83C402                   add  sp, 2
  9906                                  
  9907                                  ;-903   if(GType[i]=='&') { prc('['); j=GData[i]; prunsign1(j); prc(']');}
  9908                                  
  9909                                  .listvar565:
  9910 00004B96 8B5E04                   mov bx, [bp+4]
  9911 00004B99 8A87B782                 mov al, [GType + bx]
  9912 00004B9D 3C26                     cmp al, 38
  9913 00004B9F 0F852500                 jne .listvar566
  9914 00004BA3 6A5B                     push 91
  9915 00004BA5 E847F9                   call prc
  9916 00004BA8 83C402                   add  sp, 2
  9917 00004BAB 8B5E04                   mov bx, [bp+4]
  9918 00004BAE D1E3                     shl bx, 1
  9919 00004BB0 8B87EB8A                 mov ax, [GData + bx]
  9920 00004BB4 8946FE                   mov [bp-2], ax
  9921 00004BB7 FF76FE                   push word [bp-2]
  9922 00004BBA E8F3FA                   call prunsign1
  9923 00004BBD 83C402                   add  sp, 2
  9924 00004BC0 6A5D                     push 93
  9925 00004BC2 E82AF9                   call prc
  9926 00004BC5 83C402                   add  sp, 2
  9927                                  
  9928                                  ;-904   if (i >= LSTART) { prs(" = bp"); j=GData[i];
  9929                                  
  9930                                  .listvar566:
  9931 00004BC8 8B4604                   mov ax, [bp+4]
  9932 00004BCB 3DC800                   cmp ax, 200 ;unsigned : 0
  9933 00004BCE 0F823000                 jb  .listvar567
  9934 00004BD2 68[464C]                 push listvar_12
  9935 00004BD5 E87EF9                   call prs
  9936 00004BD8 83C402                   add  sp, 2
  9937 00004BDB 8B5E04                   mov bx, [bp+4]
  9938 00004BDE D1E3                     shl bx, 1
  9939 00004BE0 8B87EB8A                 mov ax, [GData + bx]
  9940 00004BE4 8946FE                   mov [bp-2], ax
  9941                                  
  9942                                  ;-905     if (j > 0) prc('+'); pint1(j);  }
  9943                                  
  9944 00004BE7 8B46FE                   mov ax, [bp-2]
  9945 00004BEA 83F800                   cmp ax, 0
  9946 00004BED 0F8E0800                 jle .listvar568
  9947 00004BF1 6A2B                     push 43
  9948 00004BF3 E8F9F8                   call prc
  9949 00004BF6 83C402                   add  sp, 2
  9950                                  .listvar568:
  9951 00004BF9 FF76FE                   push word [bp-2]
  9952 00004BFC E84EFA                   call pint1
  9953 00004BFF 83C402                   add  sp, 2
  9954                                  
  9955                                  ;-906 }
  9956                                  
  9957                                  .listvar567:
  9958                                  
  9959                                  ;-907 int listcall() { int i;
  9960 00004C02 C9                       LEAVE
  9961 00004C03 C3                       ret
  9962                                  ; ENDP
  9963 00004C04 5C6E3B00                listvar_0 db "\n;",0
  9964 00004C08 7661722000              listvar_1 db "var ",0
  9965 00004C0D 7074722000              listvar_2 db "ptr ",0
  9966 00004C12 6172722000              listvar_3 db "arr ",0
  9967 00004C17 6465662000              listvar_4 db "def ",0
  9968 00004C1C 7369676E2000            listvar_5 db "sign ",0
  9969 00004C22 756E73672000            listvar_6 db "unsg ",0
  9970 00004C28 627974652000            listvar_7 db "byte ",0
  9971 00004C2E 776F72642000            listvar_8 db "word ",0
  9972 00004C34 647772642000            listvar_9 db "dwrd ",0
  9973 00004C3A 202020202D00            listvar_10 db "    -",0
  9974 00004C40 204E554C4C00            listvar_11 db " NULL",0
  9975 00004C46 203D20627000            listvar_12 db " = bp",0
  9976                                  
  9977                                  listcall:  ; *** PROC ***
  9978                                  
  9979                                  ;-908   prs("\n\n;    #  addr name   list of CALLs\n");
  9980                                  
  9981                                  ;Function : listcall, Number of local variables: 1
  9982                                  ;   # type sign width addr used name   list of local variables
  9983                                  ;  200 var sign word   907 NULL i = bp-2;
  9984 00004C4C C8020000                 ENTER  2,0
  9985 00004C50 68[7A4C]                 push listcall_0
  9986 00004C53 E800F9                   call prs
  9987 00004C56 83C402                   add  sp, 2
  9988                                  
  9989                                  ;-909   i=0;  while (i< CTop) { calllisting(i); i++; } }
  9990                                  
  9991 00004C59 B80000                   mov ax, 0
  9992 00004C5C 8946FE                   mov [bp-2], ax
  9993                                  .listcall569:
  9994 00004C5F 8B46FE                   mov ax, [bp-2]
  9995 00004C62 3B06[3D00]               cmp ax, [CTop]
  9996 00004C66 0F8D0E00                 jge .listcall570
  9997 00004C6A FF76FE                   push word [bp-2]
  9998 00004C6D E83200                   call calllisting
  9999 00004C70 83C402                   add  sp, 2
 10000 00004C73 FF46FE                   inc  word[bp-2]
 10001 00004C76 EBE7                     jmp .listcall569
 10002                                  .listcall570:
 10003                                  
 10004                                  ;-910 int calllisting(int i) {char c; int j;
 10005 00004C78 C9                       LEAVE
 10006 00004C79 C3                       ret
 10007                                  ; ENDP
 10008 00004C7A 5C6E5C6E3B20202020-     listcall_0 db "\n\n;    #  addr name   list of CALLs\n",0
 10009 00004C83 23202061646472206E-
 10010 00004C8C 616D652020206C6973-
 10011 00004C95 74206F662043414C4C-
 10012 00004C9E 735C6E00           
 10013                                  
 10014                                  calllisting:  ; *** PROC ***
 10015                                  
 10016                                  ;-911   prs("\n;"); printint51(i); prc(32);
 10017                                  
 10018                                  ;Function : calllisting, Number of local variables: 3
 10019                                  ;   # type sign width addr used name   list of local variables
 10020                                  ;  200 var sign word   910 NULL i = bp+4
 10021                                  ;  201 var sign byte   910 NULL c = bp-2
 10022                                  ;  202 var sign word   910 NULL j = bp-4;
 10023 00004CA2 C8040000                 ENTER  4,0
 10024 00004CA6 68[144D]                 push calllisting_0
 10025 00004CA9 E8AAF8                   call prs
 10026 00004CAC 83C402                   add  sp, 2
 10027 00004CAF FF7604                   push word [bp+4]
 10028 00004CB2 E83DFA                   call printint51
 10029 00004CB5 83C402                   add  sp, 2
 10030 00004CB8 6A20                     push 32
 10031 00004CBA E832F8                   call prc
 10032 00004CBD 83C402                   add  sp, 2
 10033                                  
 10034                                  ;-912   c=CType [i]; if(c==0)prs("unresolved ");
 10035                                  
 10036 00004CC0 8B5E04                   mov bx, [bp+4]
 10037 00004CC3 8A872FA1                 mov al, [CType + bx]
 10038 00004CC7 8846FE                   mov [bp-2], al
 10039 00004CCA 8A46FE                   mov al, [bp-2]
 10040 00004CCD 3C00                     cmp al, 0
 10041 00004CCF 0F850900                 jne .calllisting571
 10042 00004CD3 68[184D]                 push calllisting_1
 10043 00004CD6 E87DF8                   call prs
 10044 00004CD9 83C402                   add  sp, 2
 10045                                  
 10046                                  ;-913   j=CAdr[i];            printint51(j); prc(32);
 10047                                  
 10048                                  .calllisting571:
 10049 00004CDC 8B5E04                   mov bx, [bp+4]
 10050 00004CDF D1E3                     shl bx, 1
 10051 00004CE1 8B8757AB                 mov ax, [CAdr + bx]
 10052 00004CE5 8946FC                   mov [bp-4], ax
 10053 00004CE8 FF76FC                   push word [bp-4]
 10054 00004CEB E804FA                   call printint51
 10055 00004CEE 83C402                   add  sp, 2
 10056 00004CF1 6A20                     push 32
 10057 00004CF3 E8F9F7                   call prc
 10058 00004CF6 83C402                   add  sp, 2
 10059                                  
 10060                                  ;-914   from_far(NameA, j);   prs(NameA);
 10061                                  
 10062 00004CF9 FF76FC                   push word [bp-4]
 10063 00004CFC 8D06[3F00]               lea  ax, [NameA]
 10064 00004D00 50                       push ax
 10065 00004D01 E8B206                   call from_far
 10066 00004D04 83C404                   add  sp, 4
 10067 00004D07 8D06[3F00]               lea  ax, [NameA]
 10068 00004D0B 50                       push ax
 10069 00004D0C E847F8                   call prs
 10070 00004D0F 83C402                   add  sp, 2
 10071                                  
 10072                                  ;-915 }
 10073                                  
 10074                                  
 10075                                  ;-916 int countcalls(int f) { unsigned int i;
 10076 00004D12 C9                       LEAVE
 10077 00004D13 C3                       ret
 10078                                  ; ENDP
 10079 00004D14 5C6E3B00                calllisting_0 db "\n;",0
 10080 00004D18 756E7265736F6C7665-     calllisting_1 db "unresolved ",0
 10081 00004D21 642000             
 10082                                  
 10083                                  countcalls:  ; *** PROC ***
 10084                                  
 10085                                  ;-917   pt=adrF(FNameField, f);
 10086                                  
 10087                                  ;Function : countcalls, Number of local variables: 2
 10088                                  ;   # type sign width addr used name   list of local variables
 10089                                  ;  200 var sign word   916 NULL f = bp+4
 10090                                  ;  201 var unsg word   916 NULL i = bp-2;
 10091 00004D24 C8020000                 ENTER  2,0
 10092 00004D28 FF7604                   push word [bp+4]
 10093 00004D2B 8D064FBD                 lea  ax, [FNameField]
 10094 00004D2F 50                       push ax
 10095 00004D30 E84ABC                   call adrF
 10096 00004D33 83C404                   add  sp, 4
 10097 00004D36 A3[6A00]                 mov word [pt], ax
 10098                                  
 10099                                  ;-918   i=0;  while (i < CTop) {
 10100                                  
 10101 00004D39 B80000                   mov ax, 0
 10102 00004D3C 8946FE                   mov [bp-2], ax
 10103                                  .countcalls572:
 10104 00004D3F 8B46FE                   mov ax, [bp-2]
 10105 00004D42 3B06[3D00]               cmp ax, [CTop]
 10106 00004D46 0F8D4A00                 jge .countcalls573
 10107                                  
 10108                                  ;-919     p1=CAdr[i];
 10109                                  
 10110 00004D4A 8B5EFE                   mov bx, [bp-2]
 10111 00004D4D D1E3                     shl bx, 1
 10112 00004D4F 8B8757AB                 mov ax, [CAdr + bx]
 10113 00004D53 A3[6C00]                 mov word [p1], ax
 10114                                  
 10115                                  ;-920     from_far(NameA, p1);
 10116                                  
 10117 00004D56 FF36[6C00]               push word [p1]
 10118 00004D5A 8D06[3F00]               lea  ax, [NameA]
 10119 00004D5E 50                       push ax
 10120 00004D5F E85406                   call from_far
 10121 00004D62 83C404                   add  sp, 4
 10122                                  
 10123                                  ;-921     if (eqstr(pt,NameA))  FCalls[f] = FCalls[f] + 1;
 10124                                  
 10125 00004D65 8D06[3F00]               lea  ax, [NameA]
 10126 00004D69 50                       push ax
 10127 00004D6A FF36[6A00]               push word [pt]
 10128 00004D6E E825B4                   call eqstr
 10129 00004D71 83C404                   add  sp, 4
 10130 00004D74 08C0                     or  al, al
 10131 00004D76 0F841500                 je .countcalls574
 10132 00004D7A 8B5E04                   mov bx, [bp+4]
 10133 00004D7D D1E3                     shl bx, 1
 10134 00004D7F 8B87F7BA                 mov ax, [FCalls + bx]
 10135 00004D83 83C001                   add ax, 1
 10136 00004D86 8B5E04                   mov bx, [bp+4]
 10137 00004D89 D1E3                     shl bx, 1
 10138 00004D8B 8987F7BA                 mov [FCalls+bx], ax
 10139                                  
 10140                                  ;-922     i++; }
 10141                                  
 10142                                  .countcalls574:
 10143 00004D8F FF46FE                   inc  word[bp-2]
 10144                                  
 10145                                  ;-923 }
 10146                                  
 10147 00004D92 EBAB                     jmp .countcalls572
 10148                                  .countcalls573:
 10149                                  
 10150                                  ;-924 int listfunc() { int i;
 10151 00004D94 C9                       LEAVE
 10152 00004D95 C3                       ret
 10153                                  ; ENDP
 10154                                  
 10155                                  listfunc:  ; *** PROC ***
 10156                                  
 10157                                  ;-925   prs("\n\n\n;   # Calls Line Width  Name   list of functions\n");
 10158                                  
 10159                                  ;Function : listfunc, Number of local variables: 1
 10160                                  ;   # type sign width addr used name   list of local variables
 10161                                  ;  200 var sign word   924 NULL i = bp-2;
 10162 00004D96 C8020000                 ENTER  2,0
 10163 00004D9A 68[E34D]                 push listfunc_0
 10164 00004D9D E8B6F7                   call prs
 10165 00004DA0 83C402                   add  sp, 2
 10166                                  
 10167                                  ;-926   i=0;  while (i < FTop) { countcalls (i); i++; } 
 10168                                  
 10169 00004DA3 B80000                   mov ax, 0
 10170 00004DA6 8946FE                   mov [bp-2], ax
 10171                                  .listfunc575:
 10172 00004DA9 8B46FE                   mov ax, [bp-2]
 10173 00004DAC 3B06[3B00]               cmp ax, [FTop]
 10174 00004DB0 0F8D0E00                 jge .listfunc576
 10175 00004DB4 FF76FE                   push word [bp-2]
 10176 00004DB7 E86AFF                   call countcalls
 10177 00004DBA 83C402                   add  sp, 2
 10178 00004DBD FF46FE                   inc  word[bp-2]
 10179                                  
 10180                                  ;-927   i=0;  while (i < FTop) { funclisting(i); i++; } }
 10181                                  
 10182 00004DC0 EBE7                     jmp .listfunc575
 10183                                  .listfunc576:
 10184 00004DC2 B80000                   mov ax, 0
 10185 00004DC5 8946FE                   mov [bp-2], ax
 10186                                  .listfunc577:
 10187 00004DC8 8B46FE                   mov ax, [bp-2]
 10188 00004DCB 3B06[3B00]               cmp ax, [FTop]
 10189 00004DCF 0F8D0E00                 jge .listfunc578
 10190 00004DD3 FF76FE                   push word [bp-2]
 10191 00004DD6 E84300                   call funclisting
 10192 00004DD9 83C402                   add  sp, 2
 10193 00004DDC FF46FE                   inc  word[bp-2]
 10194 00004DDF EBE7                     jmp .listfunc577
 10195                                  .listfunc578:
 10196                                  
 10197                                  ;-928 int funclisting(int i) {int j;  char c;
 10198 00004DE1 C9                       LEAVE
 10199 00004DE2 C3                       ret
 10200                                  ; ENDP
 10201 00004DE3 5C6E5C6E5C6E3B2020-     listfunc_0 db "\n\n\n;   # Calls Line Width  Name   list of functions\n",0
 10202 00004DEC 20232043616C6C7320-
 10203 00004DF5 4C696E652057696474-
 10204 00004DFE 6820204E616D652020-
 10205 00004E07 206C697374206F6620-
 10206 00004E10 66756E6374696F6E73-
 10207 00004E19 5C6E00             
 10208                                  
 10209                                  funclisting:  ; *** PROC ***
 10210                                  
 10211                                  ;-929   prs("\n;");    printint51(i);
 10212                                  
 10213                                  ;Function : funclisting, Number of local variables: 3
 10214                                  ;   # type sign width addr used name   list of local variables
 10215                                  ;  200 var sign word   928 NULL i = bp+4
 10216                                  ;  201 var sign word   928 NULL j = bp-2
 10217                                  ;  202 var sign byte   928 NULL c = bp-4;
 10218 00004E1C C8040000                 ENTER  4,0
 10219 00004E20 68[F84E]                 push funclisting_0
 10220 00004E23 E830F7                   call prs
 10221 00004E26 83C402                   add  sp, 2
 10222 00004E29 FF7604                   push word [bp+4]
 10223 00004E2C E8C3F8                   call printint51
 10224 00004E2F 83C402                   add  sp, 2
 10225                                  
 10226                                  ;-930   j = FCalls[i]; if (j) printint51(j); else prs(" NULL");
 10227                                  
 10228 00004E32 8B5E04                   mov bx, [bp+4]
 10229 00004E35 D1E3                     shl bx, 1
 10230 00004E37 8B87F7BA                 mov ax, [FCalls + bx]
 10231 00004E3B 8946FE                   mov [bp-2], ax
 10232 00004E3E 8B46FE                   mov ax, [bp-2]
 10233 00004E41 08C0                     or  al, al
 10234 00004E43 0F840C00                 je .funclisting579
 10235 00004E47 FF76FE                   push word [bp-2]
 10236 00004E4A E8A5F8                   call printint51
 10237 00004E4D 83C402                   add  sp, 2
 10238 00004E50 E90900                   jmp .funclisting580
 10239                                  .funclisting579:
 10240 00004E53 68[FC4E]                 push funclisting_1
 10241 00004E56 E8FDF6                   call prs
 10242 00004E59 83C402                   add  sp, 2
 10243                                  
 10244                                  ;-931   j = FAdr[i];   printint51(j); prc(32);
 10245                                  
 10246                                  .funclisting580:
 10247 00004E5C 8B5E04                   mov bx, [bp+4]
 10248 00004E5F D1E3                     shl bx, 1
 10249 00004E61 8B87FFA8                 mov ax, [FAdr + bx]
 10250 00004E65 8946FE                   mov [bp-2], ax
 10251 00004E68 FF76FE                   push word [bp-2]
 10252 00004E6B E884F8                   call printint51
 10253 00004E6E 83C402                   add  sp, 2
 10254 00004E71 6A20                     push 32
 10255 00004E73 E879F6                   call prc
 10256 00004E76 83C402                   add  sp, 2
 10257                                  
 10258                                  ;-932   c=FType[i];
 10259                                  
 10260 00004E79 8B5E04                   mov bx, [bp+4]
 10261 00004E7C 8A8703A0                 mov al, [FType + bx]
 10262 00004E80 8846FC                   mov [bp-4], al
 10263                                  
 10264                                  ;-933   if(c=='V')prs("void " );    if(c=='B')prs("byte " );
 10265                                  
 10266 00004E83 8A46FC                   mov al, [bp-4]
 10267 00004E86 3C56                     cmp al, 86
 10268 00004E88 0F850900                 jne .funclisting581
 10269 00004E8C 68[024F]                 push funclisting_2
 10270 00004E8F E8C4F6                   call prs
 10271 00004E92 83C402                   add  sp, 2
 10272                                  .funclisting581:
 10273 00004E95 8A46FC                   mov al, [bp-4]
 10274 00004E98 3C42                     cmp al, 66
 10275 00004E9A 0F850900                 jne .funclisting582
 10276 00004E9E 68[084F]                 push funclisting_3
 10277 00004EA1 E8B2F6                   call prs
 10278 00004EA4 83C402                   add  sp, 2
 10279                                  
 10280                                  ;-934   if(c=='W')prs("word " );    if(c=='D')prs("dwrd " );
 10281                                  
 10282                                  .funclisting582:
 10283 00004EA7 8A46FC                   mov al, [bp-4]
 10284 00004EAA 3C57                     cmp al, 87
 10285 00004EAC 0F850900                 jne .funclisting583
 10286 00004EB0 68[0E4F]                 push funclisting_4
 10287 00004EB3 E8A0F6                   call prs
 10288 00004EB6 83C402                   add  sp, 2
 10289                                  .funclisting583:
 10290 00004EB9 8A46FC                   mov al, [bp-4]
 10291 00004EBC 3C44                     cmp al, 68
 10292 00004EBE 0F850900                 jne .funclisting584
 10293 00004EC2 68[144F]                 push funclisting_5
 10294 00004EC5 E88EF6                   call prs
 10295 00004EC8 83C402                   add  sp, 2
 10296                                  
 10297                                  ;-935   prc(32); prc(32);
 10298                                  
 10299                                  .funclisting584:
 10300 00004ECB 6A20                     push 32
 10301 00004ECD E81FF6                   call prc
 10302 00004ED0 83C402                   add  sp, 2
 10303 00004ED3 6A20                     push 32
 10304 00004ED5 E817F6                   call prc
 10305 00004ED8 83C402                   add  sp, 2
 10306                                  
 10307                                  ;-936   pt=adrF(FNameField, i); prs(pt);
 10308                                  
 10309 00004EDB FF7604                   push word [bp+4]
 10310 00004EDE 8D064FBD                 lea  ax, [FNameField]
 10311 00004EE2 50                       push ax
 10312 00004EE3 E897BA                   call adrF
 10313 00004EE6 83C404                   add  sp, 4
 10314 00004EE9 A3[6A00]                 mov word [pt], ax
 10315 00004EEC FF36[6A00]               push word [pt]
 10316 00004EF0 E863F6                   call prs
 10317 00004EF3 83C402                   add  sp, 2
 10318                                  
 10319                                  ;-937 }
 10320                                  
 10321                                  
 10322                                  ;-938 unsigned int MAXUI=65535;
 10323 00004EF6 C9                       LEAVE
 10324 00004EF7 C3                       ret
 10325                                  ; ENDP
 10326 00004EF8 5C6E3B00                funclisting_0 db "\n;",0
 10327 00004EFC 204E554C4C00            funclisting_1 db " NULL",0
 10328 00004F02 766F69642000            funclisting_2 db "void ",0
 10329 00004F08 627974652000            funclisting_3 db "byte ",0
 10330 00004F0E 776F72642000            funclisting_4 db "word ",0
 10331 00004F14 647772642000            funclisting_5 db "dwrd ",0
 10332 00004F1A FFFF                    MAXUI dw 65535
 10333                                  
 10334                                  ;-939 int epilog() {unsigned int i; 
 10335                                  
 10336                                  
 10337                                  epilog:  ; *** PROC ***
 10338                                  
 10339                                  ;-940   strcpy(symbol, "LastFunctionByt");  storefunc();
 10340                                  
 10341                                  ;Function : epilog, Number of local variables: 1
 10342                                  ;   # type sign width addr used name   list of local variables
 10343                                  ;  200 var unsg word   939 NULL i = bp-2;
 10344 00004F1C C8020000                 ENTER  2,0
 10345 00004F20 68[4D51]                 push epilog_0
 10346 00004F23 8D062B81                 lea  ax, [symbol]
 10347 00004F27 50                       push ax
 10348 00004F28 E83BB2                   call strcpy
 10349 00004F2B 83C404                   add  sp, 4
 10350 00004F2E E827BD                   call storefunc
 10351                                  
 10352                                  ;-941   prs("\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret");
 10353                                  
 10354 00004F31 68[5D51]                 push epilog_1
 10355 00004F34 E81FF6                   call prs
 10356 00004F37 83C402                   add  sp, 2
 10357                                  
 10358                                  ;-942   prs("\n \n;   # type sign width  adr used name   list of global variables\n");
 10359                                  
 10360 00004F3A 68[8A51]                 push epilog_2
 10361 00004F3D E816F6                   call prs
 10362 00004F40 83C402                   add  sp, 2
 10363                                  
 10364                                  ;-943   i=1;
 10365                                  
 10366 00004F43 B80100                   mov ax, 1
 10367 00004F46 8946FE                   mov [bp-2], ax
 10368                                  
 10369                                  ;-944   while (i< GTop) { listvar(i); i++; }
 10370                                  
 10371                                  .epilog585:
 10372 00004F49 8B46FE                   mov ax, [bp-2]
 10373 00004F4C 3B06[2A00]               cmp ax, [GTop]
 10374 00004F50 0F8D0E00                 jge .epilog586
 10375 00004F54 FF76FE                   push word [bp-2]
 10376 00004F57 E8BEFA                   call listvar
 10377 00004F5A 83C402                   add  sp, 2
 10378 00004F5D FF46FE                   inc  word[bp-2]
 10379                                  
 10380                                  ;-945   listfunc();   listcall();
 10381                                  
 10382 00004F60 EBE7                     jmp .epilog585
 10383                                  .epilog586:
 10384 00004F62 E831FE                   call listfunc
 10385 00004F65 E8E4FC                   call listcall
 10386                                  
 10387                                  ;-946 
 10388                                  
 10389                                  
 10390                                  ;-947   prs("\n;Input: "); prs(&namein);
 10391                                  
 10392 00004F68 68[D151]                 push epilog_3
 10393 00004F6B E8E8F5                   call prs
 10394 00004F6E 83C402                   add  sp, 2
 10395 00004F71 8D06EE81                 lea  ax, [namein]
 10396 00004F75 50                       push ax
 10397 00004F76 E8DDF5                   call prs
 10398 00004F79 83C402                   add  sp, 2
 10399                                  
 10400                                  ;-948   prs(", List: ");   prs(&namelst);
 10401                                  
 10402 00004F7C 68[DC51]                 push epilog_4
 10403 00004F7F E8D4F5                   call prs
 10404 00004F82 83C402                   add  sp, 2
 10405 00004F85 8D063182                 lea  ax, [namelst]
 10406 00004F89 50                       push ax
 10407 00004F8A E8C9F5                   call prs
 10408 00004F8D 83C402                   add  sp, 2
 10409                                  
 10410                                  ;-949   prs(",  Lines:"); printint51(lineno);
 10411                                  
 10412 00004F90 68[E551]                 push epilog_5
 10413 00004F93 E8C0F5                   call prs
 10414 00004F96 83C402                   add  sp, 2
 10415 00004F99 FF36[6600]               push word [lineno]
 10416 00004F9D E852F7                   call printint51
 10417 00004FA0 83C402                   add  sp, 2
 10418                                  
 10419                                  ;-950   prs("\n;Glob. variables:"); GTop--; printint51(GTop);
 10420                                  
 10421 00004FA3 68[EF51]                 push epilog_6
 10422 00004FA6 E8ADF5                   call prs
 10423 00004FA9 83C402                   add  sp, 2
 10424 00004FAC FF0E[2A00]               dec  word[GTop]
 10425 00004FB0 FF36[2A00]               push word [GTop]
 10426 00004FB4 E83BF7                   call printint51
 10427 00004FB7 83C402                   add  sp, 2
 10428                                  
 10429                                  ;-951   prs(" max.:"); printint51(LSTART);
 10430                                  
 10431 00004FBA 68[0352]                 push epilog_7
 10432 00004FBD E896F5                   call prs
 10433 00004FC0 83C402                   add  sp, 2
 10434 00004FC3 68C800                   push 200
 10435 00004FC6 E829F7                   call printint51
 10436 00004FC9 83C402                   add  sp, 2
 10437                                  
 10438                                  ;-952   prs("\n;Functions      :"); printint51(FTop);
 10439                                  
 10440 00004FCC 68[0A52]                 push epilog_8
 10441 00004FCF E884F5                   call prs
 10442 00004FD2 83C402                   add  sp, 2
 10443 00004FD5 FF36[3B00]               push word [FTop]
 10444 00004FD9 E816F7                   call printint51
 10445 00004FDC 83C402                   add  sp, 2
 10446                                  
 10447                                  ;-953   prs(" max.:"); printint51(FUNCMAX);
 10448                                  
 10449 00004FDF 68[1E52]                 push epilog_9
 10450 00004FE2 E871F5                   call prs
 10451 00004FE5 83C402                   add  sp, 2
 10452 00004FE8 682C01                   push 300
 10453 00004FEB E804F7                   call printint51
 10454 00004FEE 83C402                   add  sp, 2
 10455                                  
 10456                                  ;-954   prs("\n;Calls          :"); printint51(CTop);
 10457                                  
 10458 00004FF1 68[2552]                 push epilog_10
 10459 00004FF4 E85FF5                   call prs
 10460 00004FF7 83C402                   add  sp, 2
 10461 00004FFA FF36[3D00]               push word [CTop]
 10462 00004FFE E8F1F6                   call printint51
 10463 00005001 83C402                   add  sp, 2
 10464                                  
 10465                                  ;-955   prs(" max.:"); printint51(CALLMAX);
 10466                                  
 10467 00005004 68[3952]                 push epilog_11
 10468 00005007 E84CF5                   call prs
 10469 0000500A 83C402                   add  sp, 2
 10470 0000500D 68D007                   push 2000
 10471 00005010 E8DFF6                   call printint51
 10472 00005013 83C402                   add  sp, 2
 10473                                  
 10474                                  ;-956   prs(", NameField:"); printint51(CNameTop);
 10475                                  
 10476 00005016 68[4052]                 push epilog_12
 10477 00005019 E83AF5                   call prs
 10478 0000501C 83C402                   add  sp, 2
 10479 0000501F FF36[6000]               push word [CNameTop]
 10480 00005023 E8CCF6                   call printint51
 10481 00005026 83C402                   add  sp, 2
 10482                                  
 10483                                  ;-957   prs(" max.:"); printint51(65535);
 10484                                  
 10485 00005029 68[4D52]                 push epilog_13
 10486 0000502C E827F5                   call prs
 10487 0000502F 83C402                   add  sp, 2
 10488 00005032 6AFF                     push -1
 10489 00005034 E8BBF6                   call printint51
 10490 00005037 83C402                   add  sp, 2
 10491                                  
 10492                                  ;-958 //  prs(", segE:"); printint51(segE);
 10493                                  
 10494                                  
 10495                                  ;-959   __asm{call LastFunctionByt}  _ i=ax;
 10496                                  
 10497 0000503A E89903                  call LastFunctionByt
 10498 0000503D 8946FE                  mov [bp-2], ax
 10499                                  
 10500                                  ;-960   prs("\n;Code until     :"); printint51(i);
 10501                                  
 10502 00005040 68[5452]                 push epilog_14
 10503 00005043 E810F5                   call prs
 10504 00005046 83C402                   add  sp, 2
 10505 00005049 FF76FE                   push word [bp-2]
 10506 0000504C E8A3F6                   call printint51
 10507 0000504F 83C402                   add  sp, 2
 10508                                  
 10509                                  ;-961   prs(" max.: "); printint51(ORGDATAORIG); i=ORGDATAORIG-i; prs(", free:");
 10510                                  
 10511 00005052 68[6852]                 push epilog_15
 10512 00005055 E8FEF4                   call prs
 10513 00005058 83C402                   add  sp, 2
 10514 0000505B FF36[0E00]               push word [ORGDATAORIG]
 10515 0000505F E890F6                   call printint51
 10516 00005062 83C402                   add  sp, 2
 10517 00005065 A1[0E00]                 mov ax, [ORGDATAORIG]
 10518 00005068 2B46FE                   sub ax, [bp-2]
 10519 0000506B 8946FE                   mov [bp-2], ax
 10520 0000506E 68[7052]                 push epilog_16
 10521 00005071 E8E2F4                   call prs
 10522 00005074 83C402                   add  sp, 2
 10523                                  
 10524                                  ;-962   printint51(i); if (i <= 1000)prs(" *** Warning *** Code area too small");
 10525                                  
 10526 00005077 FF76FE                   push word [bp-2]
 10527 0000507A E875F6                   call printint51
 10528 0000507D 83C402                   add  sp, 2
 10529 00005080 8B46FE                   mov ax, [bp-2]
 10530 00005083 3DE803                   cmp ax, 1000
 10531 00005086 0F870900                 ja  .epilog587
 10532 0000508A 68[7852]                 push epilog_17
 10533 0000508D E8C6F4                   call prs
 10534 00005090 83C402                   add  sp, 2
 10535                                  
 10536                                  ;-963   prs("\n;Data (HeapEnd) :"); prunsign1(orgData); i=MAXUI-orgData;
 10537                                  
 10538                                  .epilog587:
 10539 00005093 68[9D52]                 push epilog_18
 10540 00005096 E8BDF4                   call prs
 10541 00005099 83C402                   add  sp, 2
 10542 0000509C FF36[1000]               push word [orgData]
 10543 000050A0 E80DF6                   call prunsign1
 10544 000050A3 83C402                   add  sp, 2
 10545 000050A6 A1[1A4F]                 mov ax, [MAXUI]
 10546 000050A9 2B06[1000]               sub ax, [orgData]
 10547 000050AD 8946FE                   mov [bp-2], ax
 10548                                  
 10549                                  ;-964   prs(", resting stacksize: ");printint51(i);
 10550                                  
 10551 000050B0 68[B152]                 push epilog_19
 10552 000050B3 E8A0F4                   call prs
 10553 000050B6 83C402                   add  sp, 2
 10554 000050B9 FF76FE                   push word [bp-2]
 10555 000050BC E833F6                   call printint51
 10556 000050BF 83C402                   add  sp, 2
 10557                                  
 10558                                  ;-965   if (i <= 5000) prs(" *** Warning *** Stack too small");
 10559                                  
 10560 000050C2 8B46FE                   mov ax, [bp-2]
 10561 000050C5 3D8813                   cmp ax, 5000
 10562 000050C8 0F870900                 ja  .epilog588
 10563 000050CC 68[C752]                 push epilog_20
 10564 000050CF E884F4                   call prs
 10565 000050D2 83C402                   add  sp, 2
 10566                                  
 10567                                  ;-966   prs("\n;Max. Const in '"); prs(coname); prs("' :"); printint51(maxco);
 10568                                  
 10569                                  .epilog588:
 10570 000050D5 68[E852]                 push epilog_21
 10571 000050D8 E87BF4                   call prs
 10572 000050DB 83C402                   add  sp, 2
 10573 000050DE 8D06E880                 lea  ax, [coname]
 10574 000050E2 50                       push ax
 10575 000050E3 E870F4                   call prs
 10576 000050E6 83C402                   add  sp, 2
 10577 000050E9 68[FB52]                 push epilog_22
 10578 000050EC E867F4                   call prs
 10579 000050EF 83C402                   add  sp, 2
 10580 000050F2 FF36[1200]               push word [maxco]
 10581 000050F6 E8F9F5                   call printint51
 10582 000050F9 83C402                   add  sp, 2
 10583                                  
 10584                                  ;-967   prs(" max."); printint51(COMAX); i=COMAX; i=i-maxco; prs(", free:");
 10585                                  
 10586 000050FC 68[FF52]                 push epilog_23
 10587 000050FF E854F4                   call prs
 10588 00005102 83C402                   add  sp, 2
 10589 00005105 68B80B                   push 3000
 10590 00005108 E8E7F5                   call printint51
 10591 0000510B 83C402                   add  sp, 2
 10592 0000510E B8B80B                   mov ax, 3000
 10593 00005111 8946FE                   mov [bp-2], ax
 10594 00005114 8B46FE                   mov ax, [bp-2]
 10595 00005117 2B06[1200]               sub ax, [maxco]
 10596 0000511B 8946FE                   mov [bp-2], ax
 10597 0000511E 68[0553]                 push epilog_24
 10598 00005121 E832F4                   call prs
 10599 00005124 83C402                   add  sp, 2
 10600                                  
 10601                                  ;-968   printint51(i);if (i <= 1000)prs(" *** Warning *** constant area too small");
 10602                                  
 10603 00005127 FF76FE                   push word [bp-2]
 10604 0000512A E8C5F5                   call printint51
 10605 0000512D 83C402                   add  sp, 2
 10606 00005130 8B46FE                   mov ax, [bp-2]
 10607 00005133 3DE803                   cmp ax, 1000
 10608 00005136 0F870900                 ja  .epilog589
 10609 0000513A 68[0D53]                 push epilog_25
 10610 0000513D E816F4                   call prs
 10611 00005140 83C402                   add  sp, 2
 10612                                  
 10613                                  ;-969   end1(0);}
 10614                                  
 10615                                  .epilog589:
 10616 00005143 6A00                     push 0
 10617 00005145 E8D6F6                   call end1
 10618 00005148 83C402                   add  sp, 2
 10619                                  
 10620                                  ;-970 // while(expr) stmt; do stmt while(expr); FOR: i=0; while(i<10){stmt; i++;}
 10621                                  
 10622                                  
 10623                                  ;-971 int setblock(unsigned int i) {
 10624 0000514B C9                       LEAVE
 10625 0000514C C3                       ret
 10626                                  ; ENDP
 10627 0000514D 4C61737446756E6374-     epilog_0 db "LastFunctionByt",0
 10628 00005156 696F6E42797400     
 10629 0000515D 5C6E4C61737446756E-     epilog_1 db "\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret",0
 10630 00005166 6374696F6E4279743A-
 10631 0000516F 646220304538682C20-
 10632 00005178 302C20305C6E706F70-
 10633 00005181 2061785C6E72657400 
 10634 0000518A 5C6E205C6E3B202020-     epilog_2 db "\n \n;   # type sign width  adr used name   list of global variables\n",0
 10635 00005193 232074797065207369-
 10636 0000519C 676E20776964746820-
 10637 000051A5 206164722075736564-
 10638 000051AE 206E616D652020206C-
 10639 000051B7 697374206F6620676C-
 10640 000051C0 6F62616C2076617269-
 10641 000051C9 61626C65735C6E00   
 10642 000051D1 5C6E3B496E7075743A-     epilog_3 db "\n;Input: ",0
 10643 000051DA 2000               
 10644 000051DC 2C204C6973743A2000      epilog_4 db ", List: ",0
 10645 000051E5 2C20204C696E65733A-     epilog_5 db ",  Lines:",0
 10646 000051EE 00                 
 10647 000051EF 5C6E3B476C6F622E20-     epilog_6 db "\n;Glob. variables:",0
 10648 000051F8 7661726961626C6573-
 10649 00005201 3A00               
 10650 00005203 206D61782E3A00          epilog_7 db " max.:",0
 10651 0000520A 5C6E3B46756E637469-     epilog_8 db "\n;Functions      :",0
 10652 00005213 6F6E73202020202020-
 10653 0000521C 3A00               
 10654 0000521E 206D61782E3A00          epilog_9 db " max.:",0
 10655 00005225 5C6E3B43616C6C7320-     epilog_10 db "\n;Calls          :",0
 10656 0000522E 202020202020202020-
 10657 00005237 3A00               
 10658 00005239 206D61782E3A00          epilog_11 db " max.:",0
 10659 00005240 2C204E616D65466965-     epilog_12 db ", NameField:",0
 10660 00005249 6C643A00           
 10661 0000524D 206D61782E3A00          epilog_13 db " max.:",0
 10662 00005254 5C6E3B436F64652075-     epilog_14 db "\n;Code until     :",0
 10663 0000525D 6E74696C2020202020-
 10664 00005266 3A00               
 10665 00005268 206D61782E3A2000        epilog_15 db " max.: ",0
 10666 00005270 2C20667265653A00        epilog_16 db ", free:",0
 10667 00005278 202A2A2A205761726E-     epilog_17 db " *** Warning *** Code area too small",0
 10668 00005281 696E67202A2A2A2043-
 10669 0000528A 6F6465206172656120-
 10670 00005293 746F6F20736D616C6C-
 10671 0000529C 00                 
 10672 0000529D 5C6E3B446174612028-     epilog_18 db "\n;Data (HeapEnd) :",0
 10673 000052A6 48656170456E642920-
 10674 000052AF 3A00               
 10675 000052B1 2C2072657374696E67-     epilog_19 db ", resting stacksize: ",0
 10676 000052BA 20737461636B73697A-
 10677 000052C3 653A2000           
 10678 000052C7 202A2A2A205761726E-     epilog_20 db " *** Warning *** Stack too small",0
 10679 000052D0 696E67202A2A2A2053-
 10680 000052D9 7461636B20746F6F20-
 10681 000052E2 736D616C6C00       
 10682 000052E8 5C6E3B4D61782E2043-     epilog_21 db "\n;Max. Const in '",0
 10683 000052F1 6F6E737420696E2027-
 10684 000052FA 00                 
 10685 000052FB 27203A00                epilog_22 db "' :",0
 10686 000052FF 206D61782E00            epilog_23 db " max.",0
 10687 00005305 2C20667265653A00        epilog_24 db ", free:",0
 10688 0000530D 202A2A2A205761726E-     epilog_25 db " *** Warning *** constant area too small",0
 10689 00005316 696E67202A2A2A2063-
 10690 0000531F 6F6E7374616E742061-
 10691 00005328 72656120746F6F2073-
 10692 00005331 6D616C6C00         
 10693                                  
 10694                                  setblock:  ; *** PROC ***
 10695                                  
 10696                                  ;-972   DOS_ERR=0; _BX=i; _ ax=cs; _ es=ax; _AX=0x4A00; DosInt(); }
 10697                                  
 10698                                  ;Function : setblock, Number of local variables: 1
 10699                                  ;   # type sign width addr used name   list of local variables
 10700                                  ;  200 var unsg word   971 NULL i = bp+4;
 10701 00005336 C8000000                 ENTER  0,0
 10702 0000533A B80000                   mov ax, 0
 10703 0000533D A3[6E00]                 mov word [DOS_ERR], ax
 10704 00005340 8B5E04                   mov  bx, [bp+4]
 10705 00005343 8CC8                     mov  ax, cs
 10706 00005345 8EC0                     mov  es, ax
 10707 00005347 B8004A                   mov  ax, 18944
 10708 0000534A E880AD                   call DosInt
 10709                                  
 10710                                  ;-973 int allocmem(unsigned int i) { unsigned int vAX; unsigned int vBX;
 10711 0000534D C9                       LEAVE
 10712 0000534E C3                       ret
 10713                                  ; ENDP
 10714                                  
 10715                                  allocmem:  ; *** PROC ***
 10716                                  
 10717                                  ;-974   DOS_ERR=0; _BX=i;  _AX=0x4800; DosInt(); _ vAX=ax; _ vBX=bx;
 10718                                  
 10719                                  ;Function : allocmem, Number of local variables: 3
 10720                                  ;   # type sign width addr used name   list of local variables
 10721                                  ;  200 var unsg word   973 NULL i = bp+4
 10722                                  ;  201 var unsg word   973 NULL vAX = bp-2
 10723                                  ;  202 var unsg word   973 NULL vBX = bp-4;
 10724 0000534F C8040000                 ENTER  4,0
 10725 00005353 B80000                   mov ax, 0
 10726 00005356 A3[6E00]                 mov word [DOS_ERR], ax
 10727 00005359 8B5E04                   mov  bx, [bp+4]
 10728 0000535C B80048                   mov  ax, 18432
 10729 0000535F E86BAD                   call DosInt
 10730 00005362 8946FE                  mov [bp-2], ax
 10731 00005365 895EFC                  mov [bp-4], bx
 10732                                  
 10733                                  ;-975   if(DOS_ERR) return vBX;   return vAX;
 10734                                  
 10735 00005368 A1[6E00]                 mov ax, [DOS_ERR]
 10736 0000536B 08C0                     or  al, al
 10737 0000536D 0F840600                 je .allocmem590
 10738 00005371 8B46FC                   mov ax, [bp-4]
 10739 00005374 E90600                   jmp .retn
 10740                                  .allocmem590:
 10741 00005377 8B46FE                   mov ax, [bp-2]
 10742 0000537A E90000                   jmp .retn
 10743                                  
 10744                                  ;-976 }
 10745                                  
 10746                                  
 10747                                  ;-977 int copyF(char *dest, char *src, unsigned int sz) {
 10748                                  
 10749 0000537D C9                       .retn: LEAVE
 10750 0000537E C3                       ret
 10751                                  ; ENDP
 10752                                  
 10753                                  copyF:  ; *** PROC ***
 10754                                  
 10755                                  ;-978   segE;  _ es=ax;  _ si=src;  _ di=dest; _ cx=sz;  // ds:si   es:di
 10756                                  
 10757                                  ;Function : copyF, Number of local variables: 3
 10758                                  ;   # type sign width addr used name   list of local variables
 10759                                  ;  200 ptr sign byte   977 NULL dest = bp+4
 10760                                  ;  201 ptr sign byte   977 NULL src = bp+6
 10761                                  ;  202 var unsg word   977 NULL sz = bp+8;
 10762 0000537F C8000000                 ENTER  0,0
 10763 00005383 A1[6400]                 mov ax, [segE]
 10764 00005386 8EC0                     mov  es, ax
 10765 00005388 8B7606                   mov  si, [bp+6]
 10766 0000538B 8B7E04                   mov  di, [bp+4]
 10767 0000538E 8B4E08                   mov  cx, [bp+8]
 10768                                  
 10769                                  ;-979   asm cld
 10770                                  
 10771 00005391 FC                       cld
 10772                                  
 10773                                  ;-980   asm rep movsb
 10774                                  
 10775 00005392 F3A4                     rep movsb
 10776                                  
 10777                                  ;-981   asm mov byte [es:di], 0
 10778                                  
 10779 00005394 26C60500                 mov byte [es:di], 0
 10780                                  
 10781                                  ;-982 }
 10782                                  
 10783                                  
 10784                                  ;-983 int to_far(char *dest, char *src) {
 10785 00005398 C9                       LEAVE
 10786 00005399 C3                       ret
 10787                                  ; ENDP
 10788                                  
 10789                                  to_far:  ; *** PROC ***
 10790                                  
 10791                                  ;-984   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
 10792                                  
 10793                                  ;Function : to_far, Number of local variables: 2
 10794                                  ;   # type sign width addr used name   list of local variables
 10795                                  ;  200 ptr sign byte   983 NULL dest = bp+4
 10796                                  ;  201 ptr sign byte   983 NULL src = bp+6;
 10797 0000539A C8000000                 ENTER  0,0
 10798 0000539E A1[6400]                 mov ax, [segE]
 10799 000053A1 8EC0                     mov  es, ax
 10800 000053A3 8B7606                   mov  si, [bp+6]
 10801 000053A6 8B7E04                   mov  di, [bp+4]
 10802                                  
 10803                                  ;-985   asm cld
 10804                                  
 10805 000053A9 FC                       cld
 10806                                  
 10807                                  ;-986   do{
 10808                                  
 10809                                  .to_far591:
 10810                                  
 10811                                  ;-987   asm lodsb  ; inc si
 10812                                  
 10813 000053AA AC                       lodsb  ; inc si
 10814                                  
 10815                                  ;-988   asm stosb  ; inc di
 10816                                  
 10817 000053AB AA                       stosb  ; inc di
 10818                                  
 10819                                  ;-989   } while (al != 0);
 10820                                  
 10821 000053AC 3C00                     cmp  al, 0
 10822 000053AE 0F840200                 je  .to_far592
 10823 000053B2 EBF6                     jmp .to_far591
 10824                                  .to_far592:
 10825                                  
 10826                                  ;-990 }
 10827                                  
 10828                                  
 10829                                  ;-991 int from_far(char *dest, char *src) {
 10830 000053B4 C9                       LEAVE
 10831 000053B5 C3                       ret
 10832                                  ; ENDP
 10833                                  
 10834                                  from_far:  ; *** PROC ***
 10835                                  
 10836                                  ;-992   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
 10837                                  
 10838                                  ;Function : from_far, Number of local variables: 2
 10839                                  ;   # type sign width addr used name   list of local variables
 10840                                  ;  200 ptr sign byte   991 NULL dest = bp+4
 10841                                  ;  201 ptr sign byte   991 NULL src = bp+6;
 10842 000053B6 C8000000                 ENTER  0,0
 10843 000053BA A1[6400]                 mov ax, [segE]
 10844 000053BD 8EC0                     mov  es, ax
 10845 000053BF 8B7606                   mov  si, [bp+6]
 10846 000053C2 8B7E04                   mov  di, [bp+4]
 10847                                  
 10848                                  ;-993   do{
 10849                                  
 10850                                  .from_far593:
 10851                                  
 10852                                  ;-994   asm mov al, [es:si]
 10853                                  
 10854 000053C5 268A04                   mov al, [es:si]
 10855                                  
 10856                                  ;-995   asm inc si
 10857                                  
 10858 000053C8 46                       inc si
 10859                                  
 10860                                  ;-996   asm mov [di], al
 10861                                  
 10862 000053C9 8805                     mov [di], al
 10863                                  
 10864                                  ;-997   asm inc di
 10865                                  
 10866 000053CB 47                       inc di
 10867                                  
 10868                                  ;-998   } while (al != 0);
 10869                                  
 10870 000053CC 3C00                     cmp  al, 0
 10871 000053CE 0F840200                 je  .from_far594
 10872 000053D2 EBF1                     jmp .from_far593
 10873                                  .from_far594:
 10874                                  
 10875                                  ;-999 }
 10876 000053D4 C9                       LEAVE
 10877 000053D5 C3                       ret
 10878                                  ; ENDP
 10879                                   
 10880                                  ; missing functions: 
 10881                                  ; Number of unresolved CALLs :    0 All FUNCTIONs in place
 10882 000053D6 E80000                  LastFunctionByt:db 0E8h, 0, 0
 10883 000053D9 58                      pop ax
 10884 000053DA C3                      ret
 10885                                   
 10886                                  ;   # type sign width  adr used name   list of global variables
 10887                                  
 10888                                  ;    1 arr sign byte     2    2 Version1[10]
 10889                                  ;    2 def unsg byte     3    - LSTART=200
 10890                                  ;    3 def unsg byte     4    - VARMAX=300
 10891                                  ;    4 def unsg byte     5    - GNAMEMAX=4800
 10892                                  ;    5 def unsg byte     6    - FUNCMAX=300
 10893                                  ;    6 def unsg byte     7    - FNAMEMAX=4800
 10894                                  ;    7 def unsg byte     8    - CALLMAX=2000
 10895                                  ;    8 def unsg byte     9    - IDLENMAX=15
 10896                                  ;    9 def unsg byte    11    - T_NAME=256
 10897                                  ;   10 def unsg byte    12    - T_CONST=257
 10898                                  ;   11 def unsg byte    13    - T_STRING=258
 10899                                  ;   12 def unsg byte    14    - T_INCLUDE=510
 10900                                  ;   13 def unsg byte    15    - T_DEFINE=511
 10901                                  ;   14 def unsg byte    16    - T_RETURN=512
 10902                                  ;   15 def unsg byte    17    - T_IF=513
 10903                                  ;   16 def unsg byte    18    - T_ELSE=514
 10904                                  ;   17 def unsg byte    19    - T_WHILE=515
 10905                                  ;   18 def unsg byte    20    - T_DO=516
 10906                                  ;   19 def unsg byte    21    - T_INT=517
 10907                                  ;   20 def unsg byte    22    - T_ASM=518
 10908                                  ;   21 def unsg byte    23    - T_ASMBLOCK=519
 10909                                  ;   22 def unsg byte    24    - T_EMIT=520
 10910                                  ;   23 def unsg byte    25    - T_GOTO=521
 10911                                  ;   24 def unsg byte    26    - T_VOID=529
 10912                                  ;   25 def unsg byte    27    - T_CHAR=530
 10913                                  ;   26 def unsg byte    28    - T_SIGNED=531
 10914                                  ;   27 def unsg byte    29    - T_UNSIGNED=532
 10915                                  ;   28 def unsg byte    30    - T_LONG=533
 10916                                  ;   29 def unsg byte    31    - T_EQ=806
 10917                                  ;   30 def unsg byte    32    - T_NE=807
 10918                                  ;   31 def unsg byte    33    - T_GE=811
 10919                                  ;   32 def unsg byte    34    - T_LE=824
 10920                                  ;   33 def unsg byte    35    - T_PLUSPLUS=1219
 10921                                  ;   34 def unsg byte    36    - T_MINUSMINUS=1225
 10922                                  ;   35 def unsg byte    37    - T_PLUSASS=1230
 10923                                  ;   36 def unsg byte    38    - T_MINUSASS=1231
 10924                                  ;   37 def unsg byte    39    - T_MULASS=1232
 10925                                  ;   38 def unsg byte    40    - T_DIVASS=1233
 10926                                  ;   39 def unsg byte    41    - T_ANDASS=1234
 10927                                  ;   40 def unsg byte    42    - T_ORASS=1235
 10928                                  ;   41 def unsg byte    43    - T_LESSLESS=1240
 10929                                  ;   42 def unsg byte    44    - T_GREATGREAT=1241
 10930                                  ;   43 def unsg byte    45    - COMAX=3000
 10931                                  ;   44 def unsg byte    46    - CMDLENMAX=67
 10932                                  ;   45 var unsg word    47    3 ORGDATAORIG
 10933                                  ;   46 var unsg word    47   10 orgData
 10934                                  ;   47 arr sign byte    48    4 co[3000]
 10935                                  ;   48 var sign word    48    4 maxco
 10936                                  ;   49 var sign word    48    3 maxco1
 10937                                  ;   50 arr sign byte    49    2 coname[67]
 10938                                  ;   51 ptr sign byte    49    5 cloc
 10939                                  ;   52 var sign word    50    6 fdin
 10940                                  ;   53 var sign word    50    4 fdout
 10941                                  ;   54 arr sign byte    50  104 symbol[128]
 10942                                  ;   55 arr sign byte    51   10 fname[67]
 10943                                  ;   56 arr sign byte    51   10 namein[67]
 10944                                  ;   57 arr sign byte    52    7 namelst[67]
 10945                                  ;   58 arr sign byte    52    2 archivename[67]
 10946                                  ;   59 var sign word    53   41 token
 10947                                  ;   60 var sign byte    53    2 globC
 10948                                  ;   61 var sign word    53    3 spalte
 10949                                  ;   62 var sign byte    54   28 thechar
 10950                                  ;   63 var sign word    54    9 iscmp
 10951                                  ;   64 var sign word    54    4 nconst
 10952                                  ;   65 var sign word    55    3 nreturn
 10953                                  ;   66 var sign word    55   12 nlabel
 10954                                  ;   67 var sign word    56   24 GTop
 10955                                  ;   68 var sign word    56   20 LTop
 10956                                  ;   69 var unsg word    57   44 lexval
 10957                                  ;   70 var sign word    58    6 typei
 10958                                  ;   71 var sign byte    58    8 istype
 10959                                  ;   72 arr sign byte    58   11 GType[300]
 10960                                  ;   73 var sign word    59    6 signi
 10961                                  ;   74 var sign byte    59    5 issign
 10962                                  ;   75 arr sign byte    59    5 GSign[300]
 10963                                  ;   76 var sign word    60    9 widthi
 10964                                  ;   77 var sign byte    60   19 iswidth
 10965                                  ;   78 arr sign byte    60    5 GWidth[300]
 10966                                  ;   79 arr sign word    61    4 GAdr[300]
 10967                                  ;   80 arr sign word    61    6 GUsed[300]
 10968                                  ;   81 var sign word    62   26 wi
 10969                                  ;   82 arr sign word    62   11 GData[300]
 10970                                  ;   83 arr sign byte    62    2 GNameField[4800]
 10971                                  ;   84 var sign word    63   13 FTop
 10972                                  ;   85 var sign word    63    8 CTop
 10973                                  ;   86 arr sign byte    64    2 FType[300]
 10974                                  ;   87 arr sign byte    64    3 CType[2000]
 10975                                  ;   88 arr sign word    65    2 FAdr[300]
 10976                                  ;   89 arr sign word    65    4 CAdr[2000]
 10977                                  ;   90 arr sign word    66    4 FCalls[300]
 10978                                  ;   91 arr sign byte    67    5 FNameField[4800]
 10979                                  ;   92 arr sign byte    68    7 NameA[32]
 10980                                  ;   93 arr sign byte    69    5 fgetsdest[128]
 10981                                  ;   94 ptr unsg byte    69    8 CNameTop
 10982                                  ;   95 ptr unsg byte    70   10 fgetsp
 10983                                  ;   96 var unsg word    70    4 segE
 10984                                  ;   97 var unsg word    71   12 lineno
 10985                                  ;   98 var unsg word    71    2 linenoinclude
 10986                                  ;   99 ptr unsg byte    72   17 pt
 10987                                  ;  100 ptr unsg byte    72    8 p1
 10988                                  ;  101 var sign word    73    9 DOS_ERR
 10989                                  ;  102 var sign word    73    5 DOS_NoBytes
 10990                                  ;  103 var sign byte    73    3 DOS_ByteRead
 10991                                  ;  104 arr sign byte   133    2 doglobName[15]
 10992                                  ;  105 var sign word   293    5 mod1
 10993                                  ;  106 var sign word   293   12 ireg1
 10994                                  ;  107 var sign word   293    6 idx1
 10995                                  ;  108 var sign word   293    1 ids1
 10996                                  ;  109 var sign word   293    4 idw1
 10997                                  ;  110 var sign word   293    2 idt1
 10998                                  ;  111 var sign word   293 NULL val1
 10999                                  ;  112 var sign word   294    2 mod2
 11000                                  ;  113 var sign word   294    6 ireg2
 11001                                  ;  114 var sign word   294    6 idx2
 11002                                  ;  115 var sign word   294    1 ids2
 11003                                  ;  116 var sign word   294    4 idw2
 11004                                  ;  117 var sign word   294    2 idt2
 11005                                  ;  118 var sign word   294    2 val2
 11006                                  ;  119 arr sign byte   359    9 ops[5]
 11007                                  ;  120 arr sign byte   401    3 printregstr[74]
 11008                                  ;  121 var sign word   409    1 evalue
 11009                                  ;  122 var sign word   409    1 exprtype
 11010                                  ;  123 arr sign word   561    2 docalltype[10]
 11011                                  ;  124 arr sign word   561    2 docallvalue[10]
 11012                                  ;  125 arr sign byte   562    2 procname[17]
 11013                                  ;  126 ptr sign byte   617    1 arglen
 11014                                  ;  127 ptr sign byte   617    2 argv
 11015                                  ;  128 arr sign byte   757    2 symboltemp[80]
 11016                                  ;  129 var unsg word   938    1 MAXUI
 11017                                  
 11018                                  
 11019                                  ;   # Calls Line Width  Name   list of functions
 11020                                  
 11021                                  ;    0    4   75   writetty
 11022                                  ;    1    2   76   putch
 11023                                  ;    2    6   77   cputs
 11024                                  ;    3    4   78   mkneg
 11025                                  ;    4    8   80   DosInt
 11026                                  ;    5    2   85   openR
 11027                                  ;    6    1   86   creatR
 11028                                  ;    7    2   87   fcloseR
 11029                                  ;    8    3   88   exitR
 11030                                  ;    9    2   89   readRL
 11031                                  ;   10    1   90   fputcR
 11032                                  ;   11    8   93   strlen
 11033                                  ;   12   24   94   strcpy
 11034                                  ;   13   74   95   eqstr
 11035                                  ;   14    1   98   instr1
 11036                                  ;   15    1   99   instr2
 11037                                  ;   16    1  100   strcat1
 11038                                  ;   17    1  101   toupper
 11039                                  ;   18    1  102   pint
 11040                                  ;   19    3  104   digit
 11041                                  ;   20    1  109   letter
 11042                                  ;   21    3  119   alnum
 11043                                  ;   22    4  124   a
 11044                                  ;   23   21  125   v
 11045                                  ;   24    4  130   checknamelen
 11046                                  ;   25    1  134   doglob
 11047                                  ;   26   12  183   gettypes
 11048                                  ;   27    9  192   adrofname
 11049                                  ;   28    7  193   adrF
 11050                                  ;   29    4  195   printName
 11051                                  ;   30   12  199   searchname
 11052                                  ;   31    3  203   checkName
 11053                                  ;   32   10  208   typeName
 11054                                  ;   33    3  224   name1
 11055                                  ;   34    1  229   storecall
 11056                                  ;   35    2  235   storefunc
 11057                                  ;   36    2  239   addlocal
 11058                                  ;   37    1  245   checkFunction
 11059                                  ;   38    1  248   dofunc
 11060                                  ;   39    1  283   isvariable
 11061                                  ;   40    3  296   pexpr
 11062                                  ;   41    1  303   constantexpr
 11063                                  ;   42    3  313   exprstart
 11064                                  ;   43    1  315   expr2
 11065                                  ;   44    3  360   doreg1
 11066                                  ;   45    6  379   checkreg
 11067                                  ;   46    6  404   printreg
 11068                                  ;   47    2  410   expr
 11069                                  ;   48    4  459   compoundass
 11070                                  ;   49    2  466   dovar1
 11071                                  ;   50    8  487   rterm
 11072                                  ;   51    1  500   isreg
 11073                                  ;   52   15  518   doreg
 11074                                  ;   53    1  524   doassign
 11075                                  ;   54    1  542   domul
 11076                                  ;   55    2  546   doidiv
 11077                                  ;   56    1  559   domod
 11078                                  ;   57    1  563   docall1
 11079                                  ;   58 NULL  605   main
 11080                                  ;   59    2  616   getfirstchar
 11081                                  ;   60    1  618   getarg
 11082                                  ;   61    2  636   parse
 11083                                  ;   62    1  645   checkcalls
 11084                                  ;   63    1  662   doinclude
 11085                                  ;   64    1  673   dodefine
 11086                                  ;   65    6  689   stmt
 11087                                  ;   66    1  719   doemit
 11088                                  ;   67    3  723   cmpneg
 11089                                  ;   68    7  736   prlabel
 11090                                  ;   69    3  737   prjump
 11091                                  ;   70    1  738   doif
 11092                                  ;   71    1  744   dodo
 11093                                  ;   72    1  748   dowhile
 11094                                  ;   73    4  751   isrelational
 11095                                  ;   74   17  758   getlex
 11096                                  ;   75    1  810   convertdefine
 11097                                  ;   76    1  817   getdigit
 11098                                  ;   77    1  826   getstring
 11099                                  ;   78   31  829   next
 11100                                  ;   79   78  830   istoken
 11101                                  ;   80   36  831   expect
 11102                                  ;   81    6  834   eprc
 11103                                  ;   82    5  835   eprs
 11104                                  ;   83   41  836   prc
 11105                                  ;   84    3  841   prscomment
 11106                                  ;   85    8  843   prnl
 11107                                  ;   86  247  845   prs
 11108                                  ;   87    2  850   eprnum
 11109                                  ;   88   15  852   pint1
 11110                                  ;   89   27  854   prunsign1
 11111                                  ;   90   25  857   printint51
 11112                                  ;   91    2  861   fgets1
 11113                                  ;   92    1  865   printinputline
 11114                                  ;   93    2  873   end1
 11115                                  ;   94   50  874   error1
 11116                                  ;   95    2  883   listproc
 11117                                  ;   96    2  891   listvar
 11118                                  ;   97    1  907   listcall
 11119                                  ;   98    1  910   calllisting
 11120                                  ;   99    1  916   countcalls
 11121                                  ;  100    1  924   listfunc
 11122                                  ;  101    1  928   funclisting
 11123                                  ;  102    1  939   epilog
 11124                                  ;  103    1  971   setblock
 11125                                  ;  104    1  973   allocmem
 11126                                  ;  105 NULL  977   copyF
 11127                                  ;  106    1  983   to_far
 11128                                  ;  107    3  991   from_far
 11129                                  ;  108 NULL  999   LastFunctionByt
 11130                                  
 11131                                  ;    #  addr name   list of CALLs
 11132                                  
 11133                                  ;    0     0 writetty
 11134                                  ;    1     9 writetty
 11135                                  ;    2    18 putch
 11136                                  ;    3    24 DosInt
 11137                                  ;    4    31 DosInt
 11138                                  ;    5    38 DosInt
 11139                                  ;    6    45 DosInt
 11140                                  ;    7    52 DosInt
 11141                                  ;    8    59 DosInt
 11142                                  ;    9    66 strcpy
 11143                                  ;   10    73 prc
 11144                                  ;   11    77 mkneg
 11145                                  ;   12    83 pint
 11146                                  ;   13    88 putch
 11147                                  ;   14    94 digit
 11148                                  ;   15   100 letter
 11149                                  ;   16   107 printName
 11150                                  ;   17   117 prc
 11151                                  ;   18   121 printName
 11152                                  ;   19   131 prc
 11153                                  ;   20   135 strlen
 11154                                  ;   21   142 error1
 11155                                  ;   22   149 error1
 11156                                  ;   23   156 error1
 11157                                  ;   24   163 checknamelen
 11158                                  ;   25   176 checkName
 11159                                  ;   26   186 error1
 11160                                  ;   27   193 istoken
 11161                                  ;   28   201 istoken
 11162                                  ;   29   209 prs
 11163                                  ;   30   213 prunsign1
 11164                                  ;   31   223 prs
 11165                                  ;   32   227 prs
 11166                                  ;   33   231 prs
 11167                                  ;   34   235 prs
 11168                                  ;   35   239 prs
 11169                                  ;   36   243 prunsign1
 11170                                  ;   37   253 prs
 11171                                  ;   38   257 expect
 11172                                  ;   39   264 expect
 11173                                  ;   40   271 error1
 11174                                  ;   41   278 prs
 11175                                  ;   42   282 prs
 11176                                  ;   43   286 prs
 11177                                  ;   44   290 strcpy
 11178                                  ;   45   297 expect
 11179                                  ;   46   304 istoken
 11180                                  ;   47   312 prc
 11181                                  ;   48   316 prscomment
 11182                                  ;   49   327 prc
 11183                                  ;   50   331 prs
 11184                                  ;   51   335 strlen
 11185                                  ;   52   342 istoken
 11186                                  ;   53   350 prc
 11187                                  ;   54   354 expect
 11188                                  ;   55   361 prunsign1
 11189                                  ;   56   371 istoken
 11190                                  ;   57   379 expect
 11191                                  ;   58   386 error1
 11192                                  ;   59   393 prs
 11193                                  ;   60   397 prs
 11194                                  ;   61   401 prs
 11195                                  ;   62   405 prs
 11196                                  ;   63   409 prs
 11197                                  ;   64   413 prs
 11198                                  ;   65   417 istoken
 11199                                  ;   66   425 prc
 11200                                  ;   67   429 istoken
 11201                                  ;   68   437 expect
 11202                                  ;   69   444 prunsign1
 11203                                  ;   70   454 prunsign1
 11204                                  ;   71   464 adrofname
 11205                                  ;   72   474 strcpy
 11206                                  ;   73   481 strcpy
 11207                                  ;   74   488 expect
 11208                                  ;   75   495 adrF
 11209                                  ;   76   500 adrofname
 11210                                  ;   77   510 prs
 11211                                  ;   78   514 prs
 11212                                  ;   79   518 prc
 11213                                  ;   80   522 pint1
 11214                                  ;   81   528 prc
 11215                                  ;   82   532 checkName
 11216                                  ;   83   542 error1
 11217                                  ;   84   549 adrofname
 11218                                  ;   85   559 eqstr
 11219                                  ;   86   565 adrofname
 11220                                  ;   87   575 eqstr
 11221                                  ;   88   581 istoken
 11222                                  ;   89   589 istoken
 11223                                  ;   90   597 istoken
 11224                                  ;   91   605 istoken
 11225                                  ;   92   613 istoken
 11226                                  ;   93   621 istoken
 11227                                  ;   94   629 istoken
 11228                                  ;   95   637 istoken
 11229                                  ;   96   645 name1
 11230                                  ;   97   651 error1
 11231                                  ;   98   658 getlex
 11232                                  ;   99   665 error1
 11233                                  ;  100   672 error1
 11234                                  ;  101   679 strlen
 11235                                  ;  102   686 to_far
 11236                                  ;  103   693 error1
 11237                                  ;  104   700 adrF
 11238                                  ;  105   705 strcpy
 11239                                  ;  106   712 error1
 11240                                  ;  107   719 checkName
 11241                                  ;  108   729 error1
 11242                                  ;  109   736 adrF
 11243                                  ;  110   741 strcpy
 11244                                  ;  111   748 adrF
 11245                                  ;  112   753 eqstr
 11246                                  ;  113   759 checknamelen
 11247                                  ;  114   772 strcpy
 11248                                  ;  115   779 checkFunction
 11249                                  ;  116   793 error1
 11250                                  ;  117   800 storefunc
 11251                                  ;  118   810 prs
 11252                                  ;  119   814 prs
 11253                                  ;  120   818 prs
 11254                                  ;  121   822 expect
 11255                                  ;  122   829 istoken
 11256                                  ;  123   837 typeName
 11257                                  ;  124   846 addlocal
 11258                                  ;  125   855 istoken
 11259                                  ;  126   863 expect
 11260                                  ;  127   870 expect
 11261                                  ;  128   877 isvariable
 11262                                  ;  129   888 typeName
 11263                                  ;  130   897 checknamelen
 11264                                  ;  131   910 addlocal
 11265                                  ;  132   919 istoken
 11266                                  ;  133   927 expect
 11267                                  ;  134   934 expect
 11268                                  ;  135   941 istoken
 11269                                  ;  136   949 expect
 11270                                  ;  137   956 listproc
 11271                                  ;  138   965 prs
 11272                                  ;  139   969 mkneg
 11273                                  ;  140   975 pint1
 11274                                  ;  141   981 prs
 11275                                  ;  142   985 istoken
 11276                                  ;  143   993 stmt
 11277                                  ;  144   998 prs
 11278                                  ;  145  1002 prs
 11279                                  ;  146  1006 prs
 11280                                  ;  147  1010 prs
 11281                                  ;  148  1014 prs
 11282                                  ;  149  1018 strlen
 11283                                  ;  150  1025 strcpy
 11284                                  ;  151  1032 expect
 11285                                  ;  152  1039 eqstr
 11286                                  ;  153  1045 constantexpr
 11287                                  ;  154  1058 checkreg
 11288                                  ;  155  1067 doreg1
 11289                                  ;  156  1074 exprstart
 11290                                  ;  157  1084 prs
 11291                                  ;  158  1088 prs
 11292                                  ;  159  1092 expect
 11293                                  ;  160  1099 getlex
 11294                                  ;  161  1106 typeName
 11295                                  ;  162  1115 searchname
 11296                                  ;  163  1126 gettypes
 11297                                  ;  164  1135 isrelational
 11298                                  ;  165  1148 error1
 11299                                  ;  166  1155 expect
 11300                                  ;  167  1162 prs
 11301                                  ;  168  1166 prs
 11302                                  ;  169  1170 gettypes
 11303                                  ;  170  1179 prs
 11304                                  ;  171  1183 prs
 11305                                  ;  172  1187 v
 11306                                  ;  173  1189 prs
 11307                                  ;  174  1193 prunsign1
 11308                                  ;  175  1203 cmpneg
 11309                                  ;  176  1210 prs
 11310                                  ;  177  1214 expect
 11311                                  ;  178  1221 eqstr
 11312                                  ;  179  1227 expr2
 11313                                  ;  180  1233 expr
 11314                                  ;  181  1238 getlex
 11315                                  ;  182  1245 typeName
 11316                                  ;  183  1254 error1
 11317                                  ;  184  1261 checkreg
 11318                                  ;  185  1270 doreg1
 11319                                  ;  186  1277 searchname
 11320                                  ;  187  1288 gettypes
 11321                                  ;  188  1297 error1
 11322                                  ;  189  1304 isrelational
 11323                                  ;  190  1317 error1
 11324                                  ;  191  1324 istoken
 11325                                  ;  192  1332 error1
 11326                                  ;  193  1339 istoken
 11327                                  ;  194  1347 prs
 11328                                  ;  195  1351 prs
 11329                                  ;  196  1355 prs
 11330                                  ;  197  1359 prs
 11331                                  ;  198  1363 prs
 11332                                  ;  199  1367 v
 11333                                  ;  200  1369 prs
 11334                                  ;  201  1373 prunsign1
 11335                                  ;  202  1383 adrofname
 11336                                  ;  203  1393 prs
 11337                                  ;  204  1397 prs
 11338                                  ;  205  1401 typeName
 11339                                  ;  206  1410 checkreg
 11340                                  ;  207  1419 prs
 11341                                  ;  208  1423 printreg
 11342                                  ;  209  1432 v
 11343                                  ;  210  1434 prs
 11344                                  ;  211  1438 printreg
 11345                                  ;  212  1447 error1
 11346                                  ;  213  1454 searchname
 11347                                  ;  214  1465 gettypes
 11348                                  ;  215  1474 error1
 11349                                  ;  216  1481 prs
 11350                                  ;  217  1485 printreg
 11351                                  ;  218  1494 error1
 11352                                  ;  219  1501 prs
 11353                                  ;  220  1505 a
 11354                                  ;  221  1507 prs
 11355                                  ;  222  1511 prs
 11356                                  ;  223  1515 prs
 11357                                  ;  224  1519 v
 11358                                  ;  225  1521 adrofname
 11359                                  ;  226  1531 prs
 11360                                  ;  227  1535 prs
 11361                                  ;  228  1539 error1
 11362                                  ;  229  1546 istoken
 11363                                  ;  230  1554 strcpy
 11364                                  ;  231  1561 istoken
 11365                                  ;  232  1569 strcpy
 11366                                  ;  233  1576 istoken
 11367                                  ;  234  1584 strcpy
 11368                                  ;  235  1591 istoken
 11369                                  ;  236  1599 strcpy
 11370                                  ;  237  1606 istoken
 11371                                  ;  238  1614 strcpy
 11372                                  ;  239  1621 istoken
 11373                                  ;  240  1629 strcpy
 11374                                  ;  241  1636 istoken
 11375                                  ;  242  1644 strcpy
 11376                                  ;  243  1651 getlex
 11377                                  ;  244  1658 isrelational
 11378                                  ;  245  1671 error1
 11379                                  ;  246  1678 strcpy
 11380                                  ;  247  1685 prnl
 11381                                  ;  248  1690 prs
 11382                                  ;  249  1694 prs
 11383                                  ;  250  1698 printreg
 11384                                  ;  251  1707 prs
 11385                                  ;  252  1711 istoken
 11386                                  ;  253  1719 prunsign1
 11387                                  ;  254  1729 typeName
 11388                                  ;  255  1738 checkreg
 11389                                  ;  256  1747 printreg
 11390                                  ;  257  1756 searchname
 11391                                  ;  258  1767 a
 11392                                  ;  259  1769 v
 11393                                  ;  260  1771 cmpneg
 11394                                  ;  261  1778 prs
 11395                                  ;  262  1782 expect
 11396                                  ;  263  1789 strlen
 11397                                  ;  264  1796 eqstr
 11398                                  ;  265  1802 eqstr
 11399                                  ;  266  1808 eqstr
 11400                                  ;  267  1814 eqstr
 11401                                  ;  268  1820 eqstr
 11402                                  ;  269  1826 eqstr
 11403                                  ;  270  1832 eqstr
 11404                                  ;  271  1838 eqstr
 11405                                  ;  272  1844 eqstr
 11406                                  ;  273  1850 eqstr
 11407                                  ;  274  1856 eqstr
 11408                                  ;  275  1862 eqstr
 11409                                  ;  276  1868 eqstr
 11410                                  ;  277  1874 eqstr
 11411                                  ;  278  1880 eqstr
 11412                                  ;  279  1886 eqstr
 11413                                  ;  280  1892 eqstr
 11414                                  ;  281  1898 eqstr
 11415                                  ;  282  1904 eqstr
 11416                                  ;  283  1910 eqstr
 11417                                  ;  284  1916 eqstr
 11418                                  ;  285  1922 eqstr
 11419                                  ;  286  1928 strlen
 11420                                  ;  287  1935 eqstr
 11421                                  ;  288  1941 eqstr
 11422                                  ;  289  1947 eqstr
 11423                                  ;  290  1953 eqstr
 11424                                  ;  291  1959 eqstr
 11425                                  ;  292  1965 eqstr
 11426                                  ;  293  1971 eqstr
 11427                                  ;  294  1977 eqstr
 11428                                  ;  295  1983 eqstr
 11429                                  ;  296  1989 prc
 11430                                  ;  297  1993 prc
 11431                                  ;  298  1997 prc
 11432                                  ;  299  2001 istoken
 11433                                  ;  300  2009 prs
 11434                                  ;  301  2013 prunsign1
 11435                                  ;  302  2023 typeName
 11436                                  ;  303  2032 checkreg
 11437                                  ;  304  2041 doreg1
 11438                                  ;  305  2048 docall1
 11439                                  ;  306  2056 isreg
 11440                                  ;  307  2062 searchname
 11441                                  ;  308  2073 gettypes
 11442                                  ;  309  2082 istoken
 11443                                  ;  310  2090 istoken
 11444                                  ;  311  2098 expect
 11445                                  ;  312  2105 searchname
 11446                                  ;  313  2116 expect
 11447                                  ;  314  2123 expect
 11448                                  ;  315  2130 gettypes
 11449                                  ;  316  2139 error1
 11450                                  ;  317  2146 istoken
 11451                                  ;  318  2154 error1
 11452                                  ;  319  2161 prs
 11453                                  ;  320  2165 prs
 11454                                  ;  321  2169 prs
 11455                                  ;  322  2173 v
 11456                                  ;  323  2175 istoken
 11457                                  ;  324  2183 error1
 11458                                  ;  325  2190 prs
 11459                                  ;  326  2194 prs
 11460                                  ;  327  2198 prs
 11461                                  ;  328  2202 v
 11462                                  ;  329  2204 istoken
 11463                                  ;  330  2212 compoundass
 11464                                  ;  331  2224 istoken
 11465                                  ;  332  2232 compoundass
 11466                                  ;  333  2244 istoken
 11467                                  ;  334  2252 compoundass
 11468                                  ;  335  2264 istoken
 11469                                  ;  336  2272 compoundass
 11470                                  ;  337  2284 istoken
 11471                                  ;  338  2292 error1
 11472                                  ;  339  2299 istoken
 11473                                  ;  340  2307 error1
 11474                                  ;  341  2314 istoken
 11475                                  ;  342  2322 expr
 11476                                  ;  343  2327 doassign
 11477                                  ;  344  2336 dovar1
 11478                                  ;  345  2343 istoken
 11479                                  ;  346  2351 rterm
 11480                                  ;  347  2357 istoken
 11481                                  ;  348  2365 rterm
 11482                                  ;  349  2371 istoken
 11483                                  ;  350  2379 rterm
 11484                                  ;  351  2385 istoken
 11485                                  ;  352  2393 rterm
 11486                                  ;  353  2399 istoken
 11487                                  ;  354  2407 rterm
 11488                                  ;  355  2413 istoken
 11489                                  ;  356  2421 rterm
 11490                                  ;  357  2427 istoken
 11491                                  ;  358  2435 domul
 11492                                  ;  359  2441 istoken
 11493                                  ;  360  2449 doidiv
 11494                                  ;  361  2456 istoken
 11495                                  ;  362  2464 domod
 11496                                  ;  363  2470 isrelational
 11497                                  ;  364  2483 rterm
 11498                                  ;  365  2489 cmpneg
 11499                                  ;  366  2496 error1
 11500                                  ;  367  2503 prnl
 11501                                  ;  368  2508 prs
 11502                                  ;  369  2512 prs
 11503                                  ;  370  2516 gettypes
 11504                                  ;  371  2525 prs
 11505                                  ;  372  2529 prs
 11506                                  ;  373  2533 v
 11507                                  ;  374  2535 prs
 11508                                  ;  375  2539 expect
 11509                                  ;  376  2546 prunsign1
 11510                                  ;  377  2556 gettypes
 11511                                  ;  378  2565 prs
 11512                                  ;  379  2569 v
 11513                                  ;  380  2571 prnl
 11514                                  ;  381  2576 prs
 11515                                  ;  382  2580 prs
 11516                                  ;  383  2584 prs
 11517                                  ;  384  2588 prnl
 11518                                  ;  385  2593 prs
 11519                                  ;  386  2597 prs
 11520                                  ;  387  2601 a
 11521                                  ;  388  2603 prs
 11522                                  ;  389  2607 v
 11523                                  ;  390  2609 prs
 11524                                  ;  391  2613 prs
 11525                                  ;  392  2617 prs
 11526                                  ;  393  2621 prs
 11527                                  ;  394  2625 prs
 11528                                  ;  395  2629 prc
 11529                                  ;  396  2633 printName
 11530                                  ;  397  2643 prs
 11531                                  ;  398  2647 prnl
 11532                                  ;  399  2652 prs
 11533                                  ;  400  2656 prs
 11534                                  ;  401  2660 prs
 11535                                  ;  402  2664 prs
 11536                                  ;  403  2668 v
 11537                                  ;  404  2670 istoken
 11538                                  ;  405  2678 prnl
 11539                                  ;  406  2683 prs
 11540                                  ;  407  2687 prs
 11541                                  ;  408  2691 prs
 11542                                  ;  409  2695 prs
 11543                                  ;  410  2699 prunsign1
 11544                                  ;  411  2709 typeName
 11545                                  ;  412  2718 searchname
 11546                                  ;  413  2729 istoken
 11547                                  ;  414  2737 searchname
 11548                                  ;  415  2748 expect
 11549                                  ;  416  2755 expect
 11550                                  ;  417  2762 gettypes
 11551                                  ;  418  2771 error1
 11552                                  ;  419  2778 eqstr
 11553                                  ;  420  2784 dovar1
 11554                                  ;  421  2791 eqstr
 11555                                  ;  422  2797 doreg
 11556                                  ;  423  2803 eqstr
 11557                                  ;  424  2809 doreg
 11558                                  ;  425  2815 eqstr
 11559                                  ;  426  2821 doreg
 11560                                  ;  427  2827 eqstr
 11561                                  ;  428  2833 doreg
 11562                                  ;  429  2839 eqstr
 11563                                  ;  430  2845 doreg
 11564                                  ;  431  2851 eqstr
 11565                                  ;  432  2857 doreg
 11566                                  ;  433  2863 eqstr
 11567                                  ;  434  2869 doreg
 11568                                  ;  435  2875 eqstr
 11569                                  ;  436  2881 doreg
 11570                                  ;  437  2887 eqstr
 11571                                  ;  438  2893 doreg
 11572                                  ;  439  2899 eqstr
 11573                                  ;  440  2905 doreg
 11574                                  ;  441  2911 eqstr
 11575                                  ;  442  2917 doreg
 11576                                  ;  443  2923 eqstr
 11577                                  ;  444  2929 doreg
 11578                                  ;  445  2935 eqstr
 11579                                  ;  446  2941 doreg
 11580                                  ;  447  2947 eqstr
 11581                                  ;  448  2953 doreg
 11582                                  ;  449  2959 eqstr
 11583                                  ;  450  2965 doreg
 11584                                  ;  451  2971 expect
 11585                                  ;  452  2978 prs
 11586                                  ;  453  2982 prs
 11587                                  ;  454  2986 prs
 11588                                  ;  455  2990 istoken
 11589                                  ;  456  2998 prunsign1
 11590                                  ;  457  3008 istoken
 11591                                  ;  458  3016 searchname
 11592                                  ;  459  3027 v
 11593                                  ;  460  3029 error1
 11594                                  ;  461  3036 gettypes
 11595                                  ;  462  3045 prs
 11596                                  ;  463  3049 v
 11597                                  ;  464  3051 prs
 11598                                  ;  465  3055 prs
 11599                                  ;  466  3059 prs
 11600                                  ;  467  3063 a
 11601                                  ;  468  3065 prs
 11602                                  ;  469  3069 prs
 11603                                  ;  470  3073 prunsign1
 11604                                  ;  471  3083 v
 11605                                  ;  472  3085 prs
 11606                                  ;  473  3089 prs
 11607                                  ;  474  3093 printName
 11608                                  ;  475  3103 prs
 11609                                  ;  476  3107 prs
 11610                                  ;  477  3111 prs
 11611                                  ;  478  3115 prs
 11612                                  ;  479  3119 v
 11613                                  ;  480  3121 prs
 11614                                  ;  481  3125 prs
 11615                                  ;  482  3129 prs
 11616                                  ;  483  3133 v
 11617                                  ;  484  3135 prs
 11618                                  ;  485  3139 prs
 11619                                  ;  486  3143 prs
 11620                                  ;  487  3147 v
 11621                                  ;  488  3149 prs
 11622                                  ;  489  3153 rterm
 11623                                  ;  490  3159 istoken
 11624                                  ;  491  3167 prs
 11625                                  ;  492  3171 prunsign1
 11626                                  ;  493  3181 prs
 11627                                  ;  494  3185 error1
 11628                                  ;  495  3192 istoken
 11629                                  ;  496  3200 prs
 11630                                  ;  497  3204 prunsign1
 11631                                  ;  498  3214 prs
 11632                                  ;  499  3218 prs
 11633                                  ;  500  3222 typeName
 11634                                  ;  501  3231 searchname
 11635                                  ;  502  3242 error1
 11636                                  ;  503  3249 gettypes
 11637                                  ;  504  3258 error1
 11638                                  ;  505  3265 error1
 11639                                  ;  506  3272 prs
 11640                                  ;  507  3276 v
 11641                                  ;  508  3278 prs
 11642                                  ;  509  3282 prs
 11643                                  ;  510  3286 doidiv
 11644                                  ;  511  3293 prs
 11645                                  ;  512  3297 checknamelen
 11646                                  ;  513  3310 strcpy
 11647                                  ;  514  3317 storecall
 11648                                  ;  515  3327 expect
 11649                                  ;  516  3334 istoken
 11650                                  ;  517  3342 error1
 11651                                  ;  518  3349 istoken
 11652                                  ;  519  3357 istoken
 11653                                  ;  520  3365 eprs
 11654                                  ;  521  3370 eprs
 11655                                  ;  522  3375 eprc
 11656                                  ;  523  3380 eprnum
 11657                                  ;  524  3387 eprs
 11658                                  ;  525  3392 eprc
 11659                                  ;  526  3397 eprs
 11660                                  ;  527  3402 eprc
 11661                                  ;  528  3407 eprs
 11662                                  ;  529  3412 istoken
 11663                                  ;  530  3420 name1
 11664                                  ;  531  3426 searchname
 11665                                  ;  532  3437 istoken
 11666                                  ;  533  3445 checkreg
 11667                                  ;  534  3454 searchname
 11668                                  ;  535  3465 error1
 11669                                  ;  536  3472 istoken
 11670                                  ;  537  3480 expect
 11671                                  ;  538  3487 prs
 11672                                  ;  539  3491 pint1
 11673                                  ;  540  3497 prs
 11674                                  ;  541  3501 prs
 11675                                  ;  542  3505 prc
 11676                                  ;  543  3509 pint1
 11677                                  ;  544  3515 prs
 11678                                  ;  545  3519 v
 11679                                  ;  546  3521 prs
 11680                                  ;  547  3525 gettypes
 11681                                  ;  548  3534 prs
 11682                                  ;  549  3538 v
 11683                                  ;  550  3540 prs
 11684                                  ;  551  3544 v
 11685                                  ;  552  3546 prs
 11686                                  ;  553  3550 prs
 11687                                  ;  554  3554 printreg
 11688                                  ;  555  3563 prs
 11689                                  ;  556  3567 prs
 11690                                  ;  557  3571 prs
 11691                                  ;  558  3575 pint1
 11692                                  ;  559  3581 getarg
 11693                                  ;  560  3588 setblock
 11694                                  ;  561  3597 error1
 11695                                  ;  562  3604 allocmem
 11696                                  ;  563  3613 error1
 11697                                  ;  564  3620 getfirstchar
 11698                                  ;  565  3633 parse
 11699                                  ;  566  3639 checkcalls
 11700                                  ;  567  3650 epilog
 11701                                  ;  568  3657 fgets1
 11702                                  ;  569  3664 cputs
 11703                                  ;  570  3670 cputs
 11704                                  ;  571  3676 readRL
 11705                                  ;  572  3683 prnl
 11706                                  ;  573  3688 strcpy
 11707                                  ;  574  3695 instr2
 11708                                  ;  575  3702 strcat1
 11709                                  ;  576  3710 toupper
 11710                                  ;  577  3718 strcpy
 11711                                  ;  578  3725 strlen
 11712                                  ;  579  3732 openR
 11713                                  ;  580  3738 cputs
 11714                                  ;  581  3744 cputs
 11715                                  ;  582  3750 exitR
 11716                                  ;  583  3756 creatR
 11717                                  ;  584  3763 cputs
 11718                                  ;  585  3769 cputs
 11719                                  ;  586  3775 exitR
 11720                                  ;  587  3781 prs
 11721                                  ;  588  3785 prs
 11722                                  ;  589  3789 prs
 11723                                  ;  590  3793 prs
 11724                                  ;  591  3797 prs
 11725                                  ;  592  3801 prs
 11726                                  ;  593  3805 prs
 11727                                  ;  594  3809 getlex
 11728                                  ;  595  3816 istoken
 11729                                  ;  596  3824 istoken
 11730                                  ;  597  3832 dodefine
 11731                                  ;  598  3841 istoken
 11732                                  ;  599  3849 doinclude
 11733                                  ;  600  3859 error1
 11734                                  ;  601  3866 typeName
 11735                                  ;  602  3875 dofunc
 11736                                  ;  603  3882 doglob
 11737                                  ;  604  3889 prs
 11738                                  ;  605  3893 from_far
 11739                                  ;  606  3902 adrF
 11740                                  ;  607  3907 eqstr
 11741                                  ;  608  3913 prs
 11742                                  ;  609  3917 prs
 11743                                  ;  610  3921 prs
 11744                                  ;  611  3925 printint51
 11745                                  ;  612  3936 error1
 11746                                  ;  613  3943 prs
 11747                                  ;  614  3947 prs
 11748                                  ;  615  3951 prs
 11749                                  ;  616  3955 openR
 11750                                  ;  617  3961 prs
 11751                                  ;  618  3965 prs
 11752                                  ;  619  3969 error1
 11753                                  ;  620  3976 parse
 11754                                  ;  621  3982 prs
 11755                                  ;  622  3986 prs
 11756                                  ;  623  3990 getfirstchar
 11757                                  ;  624  4003 getlex
 11758                                  ;  625  4010 eqstr
 11759                                  ;  626  4016 getlex
 11760                                  ;  627  4023 eqstr
 11761                                  ;  628  4029 getlex
 11762                                  ;  629  4036 prs
 11763                                  ;  630  4040 strcpy
 11764                                  ;  631  4047 prs
 11765                                  ;  632  4051 error1
 11766                                  ;  633  4058 getlex
 11767                                  ;  634  4065 expect
 11768                                  ;  635  4072 error1
 11769                                  ;  636  4079 strlen
 11770                                  ;  637  4086 error1
 11771                                  ;  638  4093 adrofname
 11772                                  ;  639  4103 strcpy
 11773                                  ;  640  4110 expect
 11774                                  ;  641  4117 istoken
 11775                                  ;  642  4125 istoken
 11776                                  ;  643  4133 stmt
 11777                                  ;  644  4138 istoken
 11778                                  ;  645  4146 doif
 11779                                  ;  646  4151 istoken
 11780                                  ;  647  4159 dodo
 11781                                  ;  648  4164 istoken
 11782                                  ;  649  4172 dowhile
 11783                                  ;  650  4180 istoken
 11784                                  ;  651  4188 prs
 11785                                  ;  652  4192 name1
 11786                                  ;  653  4198 prs
 11787                                  ;  654  4202 expect
 11788                                  ;  655  4209 prs
 11789                                  ;  656  4213 next
 11790                                  ;  657  4218 prc
 11791                                  ;  658  4222 next
 11792                                  ;  659  4227 getlex
 11793                                  ;  660  4234 istoken
 11794                                  ;  661  4242 prs
 11795                                  ;  662  4246 next
 11796                                  ;  663  4251 prc
 11797                                  ;  664  4255 next
 11798                                  ;  665  4260 getlex
 11799                                  ;  666  4267 error1
 11800                                  ;  667  4274 istoken
 11801                                  ;  668  4282 doemit
 11802                                  ;  669  4289 istoken
 11803                                  ;  670  4297 istoken
 11804                                  ;  671  4305 exprstart
 11805                                  ;  672  4315 prs
 11806                                  ;  673  4319 expect
 11807                                  ;  674  4326 prs
 11808                                  ;  675  4330 prs
 11809                                  ;  676  4334 prc
 11810                                  ;  677  4338 expect
 11811                                  ;  678  4345 expect
 11812                                  ;  679  4352 exprstart
 11813                                  ;  680  4362 expect
 11814                                  ;  681  4369 prs
 11815                                  ;  682  4373 getlex
 11816                                  ;  683  4380 prunsign1
 11817                                  ;  684  4390 getlex
 11818                                  ;  685  4397 prc
 11819                                  ;  686  4401 expect
 11820                                  ;  687  4408 prs
 11821                                  ;  688  4412 prs
 11822                                  ;  689  4416 prs
 11823                                  ;  690  4420 prs
 11824                                  ;  691  4424 prs
 11825                                  ;  692  4428 prunsign1
 11826                                  ;  693  4438 prs
 11827                                  ;  694  4442 prs
 11828                                  ;  695  4446 prunsign1
 11829                                  ;  696  4456 prs
 11830                                  ;  697  4460 prs
 11831                                  ;  698  4464 prs
 11832                                  ;  699  4468 error1
 11833                                  ;  700  4475 prs
 11834                                  ;  701  4479 prs
 11835                                  ;  702  4483 pint1
 11836                                  ;  703  4489 prc
 11837                                  ;  704  4493 prs
 11838                                  ;  705  4497 prs
 11839                                  ;  706  4501 pint1
 11840                                  ;  707  4507 pexpr
 11841                                  ;  708  4513 pint1
 11842                                  ;  709  4519 stmt
 11843                                  ;  710  4524 istoken
 11844                                  ;  711  4532 prjump
 11845                                  ;  712  4539 prlabel
 11846                                  ;  713  4547 stmt
 11847                                  ;  714  4552 prlabel
 11848                                  ;  715  4560 prlabel
 11849                                  ;  716  4568 prlabel
 11850                                  ;  717  4576 stmt
 11851                                  ;  718  4581 expect
 11852                                  ;  719  4588 pexpr
 11853                                  ;  720  4594 pint1
 11854                                  ;  721  4600 prjump
 11855                                  ;  722  4607 prlabel
 11856                                  ;  723  4615 prlabel
 11857                                  ;  724  4623 pexpr
 11858                                  ;  725  4629 pint1
 11859                                  ;  726  4635 stmt
 11860                                  ;  727  4640 prjump
 11861                                  ;  728  4647 prlabel
 11862                                  ;  729  4655 getlex
 11863                                  ;  730  4662 next
 11864                                  ;  731  4667 next
 11865                                  ;  732  4672 next
 11866                                  ;  733  4677 next
 11867                                  ;  734  4682 next
 11868                                  ;  735  4687 next
 11869                                  ;  736  4692 next
 11870                                  ;  737  4697 next
 11871                                  ;  738  4702 next
 11872                                  ;  739  4707 next
 11873                                  ;  740  4712 next
 11874                                  ;  741  4717 next
 11875                                  ;  742  4722 next
 11876                                  ;  743  4727 next
 11877                                  ;  744  4732 next
 11878                                  ;  745  4737 instr1
 11879                                  ;  746  4744 next
 11880                                  ;  747  4749 getlex
 11881                                  ;  748  4756 next
 11882                                  ;  749  4761 next
 11883                                  ;  750  4766 getlex
 11884                                  ;  751  4773 getstring
 11885                                  ;  752  4783 digit
 11886                                  ;  753  4789 getdigit
 11887                                  ;  754  4798 next
 11888                                  ;  755  4803 next
 11889                                  ;  756  4808 next
 11890                                  ;  757  4813 alnum
 11891                                  ;  758  4819 strcpy
 11892                                  ;  759  4826 alnum
 11893                                  ;  760  4832 next
 11894                                  ;  761  4837 eqstr
 11895                                  ;  762  4843 eqstr
 11896                                  ;  763  4849 eqstr
 11897                                  ;  764  4855 eqstr
 11898                                  ;  765  4861 eqstr
 11899                                  ;  766  4867 eqstr
 11900                                  ;  767  4873 eqstr
 11901                                  ;  768  4879 eqstr
 11902                                  ;  769  4885 eqstr
 11903                                  ;  770  4891 eqstr
 11904                                  ;  771  4897 eqstr
 11905                                  ;  772  4903 eqstr
 11906                                  ;  773  4909 eqstr
 11907                                  ;  774  4915 eqstr
 11908                                  ;  775  4921 eqstr
 11909                                  ;  776  4927 eqstr
 11910                                  ;  777  4933 eqstr
 11911                                  ;  778  4939 convertdefine
 11912                                  ;  779  4953 strcpy
 11913                                  ;  780  4960 error1
 11914                                  ;  781  4967 adrofname
 11915                                  ;  782  4977 eqstr
 11916                                  ;  783  4983 next
 11917                                  ;  784  4988 alnum
 11918                                  ;  785  4994 next
 11919                                  ;  786  4999 digit
 11920                                  ;  787  5005 next
 11921                                  ;  788  5010 next
 11922                                  ;  789  5015 next
 11923                                  ;  790  5020 fgets1
 11924                                  ;  791  5027 getlex
 11925                                  ;  792  5034 istoken
 11926                                  ;  793  5042 prs
 11927                                  ;  794  5046 listproc
 11928                                  ;  795  5055 prs
 11929                                  ;  796  5059 pint1
 11930                                  ;  797  5065 error1
 11931                                  ;  798  5072 eprc
 11932                                  ;  799  5077 writetty
 11933                                  ;  800  5086 writetty
 11934                                  ;  801  5095 fputcR
 11935                                  ;  802  5102 prc
 11936                                  ;  803  5106 prs
 11937                                  ;  804  5110 prc
 11938                                  ;  805  5114 eprc
 11939                                  ;  806  5119 mkneg
 11940                                  ;  807  5125 eprnum
 11941                                  ;  808  5132 eprc
 11942                                  ;  809  5137 prc
 11943                                  ;  810  5141 mkneg
 11944                                  ;  811  5147 pint1
 11945                                  ;  812  5153 prc
 11946                                  ;  813  5157 prunsign1
 11947                                  ;  814  5167 prc
 11948                                  ;  815  5171 prc
 11949                                  ;  816  5175 prc
 11950                                  ;  817  5179 prc
 11951                                  ;  818  5183 prc
 11952                                  ;  819  5187 prunsign1
 11953                                  ;  820  5197 printinputline
 11954                                  ;  821  5212 readRL
 11955                                  ;  822  5219 prs
 11956                                  ;  823  5223 prunsign1
 11957                                  ;  824  5233 prc
 11958                                  ;  825  5237 prscomment
 11959                                  ;  826  5248 fcloseR
 11960                                  ;  827  5256 fcloseR
 11961                                  ;  828  5264 exitR
 11962                                  ;  829  5270 prnl
 11963                                  ;  830  5275 prscomment
 11964                                  ;  831  5286 prs
 11965                                  ;  832  5290 prunsign1
 11966                                  ;  833  5300 prs
 11967                                  ;  834  5304 prs
 11968                                  ;  835  5308 prs
 11969                                  ;  836  5312 pint1
 11970                                  ;  837  5318 prs
 11971                                  ;  838  5322 prunsign1
 11972                                  ;  839  5332 prs
 11973                                  ;  840  5336 prc
 11974                                  ;  841  5340 prs
 11975                                  ;  842  5344 pint1
 11976                                  ;  843  5350 prs
 11977                                  ;  844  5354 prs
 11978                                  ;  845  5358 end1
 11979                                  ;  846  5363 prs
 11980                                  ;  847  5367 prs
 11981                                  ;  848  5371 prs
 11982                                  ;  849  5375 prunsign1
 11983                                  ;  850  5385 prs
 11984                                  ;  851  5389 listvar
 11985                                  ;  852  5397 prs
 11986                                  ;  853  5401 printint51
 11987                                  ;  854  5412 prc
 11988                                  ;  855  5416 prs
 11989                                  ;  856  5420 prs
 11990                                  ;  857  5424 prs
 11991                                  ;  858  5428 prs
 11992                                  ;  859  5432 prs
 11993                                  ;  860  5436 prs
 11994                                  ;  861  5440 prs
 11995                                  ;  862  5444 prs
 11996                                  ;  863  5448 prs
 11997                                  ;  864  5452 printint51
 11998                                  ;  865  5463 printint51
 11999                                  ;  866  5474 prs
 12000                                  ;  867  5478 prs
 12001                                  ;  868  5482 prc
 12002                                  ;  869  5486 adrofname
 12003                                  ;  870  5496 prs
 12004                                  ;  871  5500 prc
 12005                                  ;  872  5504 prunsign1
 12006                                  ;  873  5514 prc
 12007                                  ;  874  5518 prunsign1
 12008                                  ;  875  5528 prc
 12009                                  ;  876  5532 prs
 12010                                  ;  877  5536 prc
 12011                                  ;  878  5540 pint1
 12012                                  ;  879  5546 prs
 12013                                  ;  880  5550 calllisting
 12014                                  ;  881  5562 prs
 12015                                  ;  882  5566 printint51
 12016                                  ;  883  5577 prc
 12017                                  ;  884  5581 prs
 12018                                  ;  885  5585 printint51
 12019                                  ;  886  5596 prc
 12020                                  ;  887  5600 from_far
 12021                                  ;  888  5609 prs
 12022                                  ;  889  5613 adrF
 12023                                  ;  890  5618 from_far
 12024                                  ;  891  5627 eqstr
 12025                                  ;  892  5633 prs
 12026                                  ;  893  5637 countcalls
 12027                                  ;  894  5648 funclisting
 12028                                  ;  895  5660 prs
 12029                                  ;  896  5664 printint51
 12030                                  ;  897  5675 printint51
 12031                                  ;  898  5686 prs
 12032                                  ;  899  5690 printint51
 12033                                  ;  900  5701 prc
 12034                                  ;  901  5705 prs
 12035                                  ;  902  5709 prs
 12036                                  ;  903  5713 prs
 12037                                  ;  904  5717 prs
 12038                                  ;  905  5721 prc
 12039                                  ;  906  5725 prc
 12040                                  ;  907  5729 adrF
 12041                                  ;  908  5734 prs
 12042                                  ;  909  5738 strcpy
 12043                                  ;  910  5745 storefunc
 12044                                  ;  911  5755 prs
 12045                                  ;  912  5759 prs
 12046                                  ;  913  5763 listvar
 12047                                  ;  914  5771 listfunc
 12048                                  ;  915  5780 listcall
 12049                                  ;  916  5789 prs
 12050                                  ;  917  5793 prs
 12051                                  ;  918  5797 prs
 12052                                  ;  919  5801 prs
 12053                                  ;  920  5805 prs
 12054                                  ;  921  5809 printint51
 12055                                  ;  922  5820 prs
 12056                                  ;  923  5824 printint51
 12057                                  ;  924  5835 prs
 12058                                  ;  925  5839 printint51
 12059                                  ;  926  5850 prs
 12060                                  ;  927  5854 printint51
 12061                                  ;  928  5865 prs
 12062                                  ;  929  5869 printint51
 12063                                  ;  930  5880 prs
 12064                                  ;  931  5884 printint51
 12065                                  ;  932  5895 prs
 12066                                  ;  933  5899 printint51
 12067                                  ;  934  5910 prs
 12068                                  ;  935  5914 printint51
 12069                                  ;  936  5925 prs
 12070                                  ;  937  5929 printint51
 12071                                  ;  938  5940 prs
 12072                                  ;  939  5944 printint51
 12073                                  ;  940  5955 prs
 12074                                  ;  941  5959 printint51
 12075                                  ;  942  5970 prs
 12076                                  ;  943  5974 printint51
 12077                                  ;  944  5985 prs
 12078                                  ;  945  5989 prs
 12079                                  ;  946  5993 prunsign1
 12080                                  ;  947  6003 prs
 12081                                  ;  948  6007 printint51
 12082                                  ;  949  6018 prs
 12083                                  ;  950  6022 prs
 12084                                  ;  951  6026 prs
 12085                                  ;  952  6030 prs
 12086                                  ;  953  6034 printint51
 12087                                  ;  954  6045 prs
 12088                                  ;  955  6049 printint51
 12089                                  ;  956  6060 prs
 12090                                  ;  957  6064 printint51
 12091                                  ;  958  6075 prs
 12092                                  ;  959  6079 end1
 12093                                  ;  960  6084 DosInt
 12094                                  ;  961  6091 DosInt
 12095                                  ;Input: A.C, List: A.S,  Lines: 1000
 12096                                  ;Glob. variables:  129 max.:  200
 12097                                  ;Functions      :  109 max.:  300
 12098                                  ;Calls          :  962 max.: 2000, NameField: 6098 max.:    65535
 12099                                  ;Code until     :21721 max.: 30000, free: 8279
 12100                                  ;Data (HeapEnd) :53548, resting stacksize: 11987
 12101                                  ;Max. Const in 'epilog' :  947 max. 3000, free: 2053
