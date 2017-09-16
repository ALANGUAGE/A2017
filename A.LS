     1                                  
     2                                  ; A.COM V0.9, Source: A.C, Output asm: A.S
     3                                  org  256 
     4 00000000 E93730                  jmp main
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
   684                                  ;-99 int strcat1(char *s, char *t) { while (*s != 0) s++; strcpy(s, t);  }
   685                                  
   686 00000212 C9                       .retn: LEAVE
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
   748                                  ;-101 int pint (int n){int e; if(n<0) {  prc('-');  n=mkneg(n); }
   749 0000027A C9                       LEAVE
   750 0000027B C3                       ret
   751                                  ; ENDP
   752                                  
   753                                  pint:  ; *** PROC ***
   754                                  ;Function : pint, Number of local variables: 2
   755                                  ;   # type sign width addr used name   list of local variables
   756                                  ;  200 var sign word   101 NULL n = bp+4
   757                                  ;  201 var sign word   101 NULL e = bp-2;
   758 0000027C C8020000                 ENTER  2,0
   759 00000280 8B4604                   mov ax, [bp+4]
   760 00000283 83F800                   cmp ax, 0
   761 00000286 0F8D1400                 jge .pint21
   762 0000028A 6A2D                     push 45
   763 0000028C E82E42                   call prc
   764 0000028F 83C402                   add  sp, 2
   765 00000292 FF7604                   push word [bp+4]
   766 00000295 E82AFE                   call mkneg
   767 00000298 83C402                   add  sp, 2
   768 0000029B 894604                   mov [bp+4], ax
   769                                  
   770                                  ;-102   if (n >= 10) {e=n/10;  pint(e);}  n=n%10; n=n+'0'; putch(n); }
   771                                  
   772                                  .pint21:
   773 0000029E 8B4604                   mov ax, [bp+4]
   774 000002A1 83F80A                   cmp ax, 10 ;unsigned : 1
   775 000002A4 0F8C1500                 jl  .pint22
   776 000002A8 8B4604                   mov ax, [bp+4]
   777 000002AB BB0A00                   mov bx, 10
   778 000002AE 99                       cwd
   779 000002AF F7FB                     idiv bx
   780 000002B1 8946FE                   mov [bp-2], ax
   781 000002B4 FF76FE                   push word [bp-2]
   782 000002B7 E8C2FF                   call pint
   783 000002BA 83C402                   add  sp, 2
   784                                  .pint22:
   785 000002BD 8B4604                   mov ax, [bp+4]
   786 000002C0 BB0A00                   mov bx, 10
   787 000002C3 99                       cwd
   788 000002C4 F7FB                     idiv bx
   789 000002C6 89D0                     mov ax, dx
   790 000002C8 894604                   mov [bp+4], ax
   791 000002CB 8B4604                   mov ax, [bp+4]
   792 000002CE 83C030                   add ax, 48
   793 000002D1 894604                   mov [bp+4], ax
   794 000002D4 FF7604                   push word [bp+4]
   795 000002D7 E8A1FD                   call putch
   796 000002DA 83C402                   add  sp, 2
   797                                  
   798                                  ;-103 int digit(char c){ 
   799 000002DD C9                       LEAVE
   800 000002DE C3                       ret
   801                                  ; ENDP
   802                                  
   803                                  digit:  ; *** PROC ***
   804                                  
   805                                  ;-104     if(c<'0') return 0; 
   806                                  
   807                                  ;Function : digit, Number of local variables: 1
   808                                  ;   # type sign width addr used name   list of local variables
   809                                  ;  200 var sign byte   103 NULL c = bp+4;
   810 000002DF C8000000                 ENTER  0,0
   811 000002E3 8A4604                   mov al, [bp+4]
   812 000002E6 3C30                     cmp al, 48
   813 000002E8 0F8D0600                 jge .digit23
   814 000002EC B80000                   mov ax, 0
   815 000002EF E91500                   jmp .retn
   816                                  
   817                                  ;-105     if(c>'9') return 0; 
   818                                  
   819                                  .digit23:
   820 000002F2 8A4604                   mov al, [bp+4]
   821 000002F5 3C39                     cmp al, 57
   822 000002F7 0F8E0600                 jle .digit24
   823 000002FB B80000                   mov ax, 0
   824 000002FE E90600                   jmp .retn
   825                                  
   826                                  ;-106     return 1; 
   827                                  
   828                                  .digit24:
   829 00000301 B80100                   mov ax, 1
   830 00000304 E90000                   jmp .retn
   831                                  
   832                                  ;-107 }
   833                                  
   834                                  
   835                                  ;-108 int letter(char c) { 
   836                                  
   837 00000307 C9                       .retn: LEAVE
   838 00000308 C3                       ret
   839                                  ; ENDP
   840                                  
   841                                  letter:  ; *** PROC ***
   842                                  
   843                                  ;-109     if (c=='_') return 1;
   844                                  
   845                                  ;Function : letter, Number of local variables: 1
   846                                  ;   # type sign width addr used name   list of local variables
   847                                  ;  200 var sign byte   108 NULL c = bp+4;
   848 00000309 C8000000                 ENTER  0,0
   849 0000030D 8A4604                   mov al, [bp+4]
   850 00000310 3C5F                     cmp al, 95
   851 00000312 0F850600                 jne .letter25
   852 00000316 B80100                   mov ax, 1
   853 00000319 E96900                   jmp .retn
   854                                  
   855                                  ;-110     if (c=='.') return 1;
   856                                  
   857                                  .letter25:
   858 0000031C 8A4604                   mov al, [bp+4]
   859 0000031F 3C2E                     cmp al, 46
   860 00000321 0F850600                 jne .letter26
   861 00000325 B80100                   mov ax, 1
   862 00000328 E95A00                   jmp .retn
   863                                  
   864                                  ;-111     if (c=='?') return 1;
   865                                  
   866                                  .letter26:
   867 0000032B 8A4604                   mov al, [bp+4]
   868 0000032E 3C3F                     cmp al, 63
   869 00000330 0F850600                 jne .letter27
   870 00000334 B80100                   mov ax, 1
   871 00000337 E94B00                   jmp .retn
   872                                  
   873                                  ;-112     if (c=='$') return 1;
   874                                  
   875                                  .letter27:
   876 0000033A 8A4604                   mov al, [bp+4]
   877 0000033D 3C24                     cmp al, 36
   878 0000033F 0F850600                 jne .letter28
   879 00000343 B80100                   mov ax, 1
   880 00000346 E93C00                   jmp .retn
   881                                  
   882                                  ;-113     if (c> 'z') return 0; 
   883                                  
   884                                  .letter28:
   885 00000349 8A4604                   mov al, [bp+4]
   886 0000034C 3C7A                     cmp al, 122
   887 0000034E 0F8E0600                 jle .letter29
   888 00000352 B80000                   mov ax, 0
   889 00000355 E92D00                   jmp .retn
   890                                  
   891                                  ;-114     if (c< '@') return 0;// at included
   892                                  
   893                                  .letter29:
   894 00000358 8A4604                   mov al, [bp+4]
   895 0000035B 3C40                     cmp al, 64
   896 0000035D 0F8D0600                 jge .letter30
   897 00000361 B80000                   mov ax, 0
   898 00000364 E91E00                   jmp .retn
   899                                  
   900                                  ;-115     if (c> 'Z') { if (c< 'a') return 0; }  
   901                                  
   902                                  .letter30:
   903 00000367 8A4604                   mov al, [bp+4]
   904 0000036A 3C5A                     cmp al, 90
   905 0000036C 0F8E0F00                 jle .letter31
   906 00000370 8A4604                   mov al, [bp+4]
   907 00000373 3C61                     cmp al, 97
   908 00000375 0F8D0600                 jge .letter32
   909 00000379 B80000                   mov ax, 0
   910 0000037C E90600                   jmp .retn
   911                                  .letter32:
   912                                  
   913                                  ;-116     return 1; 
   914                                  
   915                                  .letter31:
   916 0000037F B80100                   mov ax, 1
   917 00000382 E90000                   jmp .retn
   918                                  
   919                                  ;-117 }    
   920                                  
   921                                  
   922                                  ;-118 int alnum(char c) {
   923                                  
   924 00000385 C9                       .retn: LEAVE
   925 00000386 C3                       ret
   926                                  ; ENDP
   927                                  
   928                                  alnum:  ; *** PROC ***
   929                                  
   930                                  ;-119   if (digit (c)) return 1;
   931                                  
   932                                  ;Function : alnum, Number of local variables: 1
   933                                  ;   # type sign width addr used name   list of local variables
   934                                  ;  200 var sign byte   118 NULL c = bp+4;
   935 00000387 C8000000                 ENTER  0,0
   936 0000038B 8A4604                   mov al, byte [bp+4]
   937 0000038E B400                     mov ah, 0
   938 00000390 50                       push ax
   939 00000391 E84BFF                   call digit
   940 00000394 83C402                   add  sp, 2
   941 00000397 08C0                     or  al, al
   942 00000399 0F840600                 je .alnum33
   943 0000039D B80100                   mov ax, 1
   944 000003A0 E91E00                   jmp .retn
   945                                  
   946                                  ;-120   if (letter(c)) return 1;
   947                                  
   948                                  .alnum33:
   949 000003A3 8A4604                   mov al, byte [bp+4]
   950 000003A6 B400                     mov ah, 0
   951 000003A8 50                       push ax
   952 000003A9 E85DFF                   call letter
   953 000003AC 83C402                   add  sp, 2
   954 000003AF 08C0                     or  al, al
   955 000003B1 0F840600                 je .alnum34
   956 000003B5 B80100                   mov ax, 1
   957 000003B8 E90600                   jmp .retn
   958                                  
   959                                  ;-121   return 0;
   960                                  
   961                                  .alnum34:
   962 000003BB B80000                   mov ax, 0
   963 000003BE E90000                   jmp .retn
   964                                  
   965                                  ;-122 }       
   966                                  
   967                                  
   968                                  ;-123 int a(unsigned int i) {  printName(i);}//address
   969                                  
   970 000003C1 C9                       .retn: LEAVE
   971 000003C2 C3                       ret
   972                                  ; ENDP
   973                                  
   974                                  a:  ; *** PROC ***
   975                                  ;Function : a, Number of local variables: 1
   976                                  ;   # type sign width addr used name   list of local variables
   977                                  ;  200 var unsg word   123 NULL i = bp+4;
   978 000003C3 C8000000                 ENTER  0,0
   979 000003C7 FF7604                   push word [bp+4]
   980 000003CA E88D05                   call printName
   981 000003CD 83C402                   add  sp, 2
   982                                  
   983                                  ;-124 int v(unsigned int i) {//value 
   984 000003D0 C9                       LEAVE
   985 000003D1 C3                       ret
   986                                  ; ENDP
   987                                  
   988                                  v:  ; *** PROC ***
   989                                  
   990                                  ;-125     if (i < LSTART) prc('['); 
   991                                  
   992                                  ;Function : v, Number of local variables: 1
   993                                  ;   # type sign width addr used name   list of local variables
   994                                  ;  200 var unsg word   124 NULL i = bp+4;
   995 000003D2 C8000000                 ENTER  0,0
   996 000003D6 8B4604                   mov ax, [bp+4]
   997 000003D9 3DC800                   cmp ax, 200
   998 000003DC 0F8D0800                 jge .v35
   999 000003E0 6A5B                     push 91
  1000 000003E2 E8D840                   call prc
  1001 000003E5 83C402                   add  sp, 2
  1002                                  
  1003                                  ;-126     printName(i);
  1004                                  
  1005                                  .v35:
  1006 000003E8 FF7604                   push word [bp+4]
  1007 000003EB E86C05                   call printName
  1008 000003EE 83C402                   add  sp, 2
  1009                                  
  1010                                  ;-127     if (i < LSTART) prc(']');   
  1011                                  
  1012 000003F1 8B4604                   mov ax, [bp+4]
  1013 000003F4 3DC800                   cmp ax, 200
  1014 000003F7 0F8D0800                 jge .v36
  1015 000003FB 6A5D                     push 93
  1016 000003FD E8BD40                   call prc
  1017 00000400 83C402                   add  sp, 2
  1018                                  
  1019                                  ;-128 }
  1020                                  
  1021                                  .v36:
  1022                                  
  1023                                  ;-129 int checknamelen() { int i;    i=strlen(symbol);
  1024 00000403 C9                       LEAVE
  1025 00000404 C3                       ret
  1026                                  ; ENDP
  1027                                  
  1028                                  checknamelen:  ; *** PROC ***
  1029                                  ;Function : checknamelen, Number of local variables: 1
  1030                                  ;   # type sign width addr used name   list of local variables
  1031                                  ;  200 var sign word   129 NULL i = bp-2;
  1032 00000405 C8020000                 ENTER  2,0
  1033 00000409 8D062B81                 lea  ax, [symbol]
  1034 0000040D 50                       push ax
  1035 0000040E E82DFD                   call strlen
  1036 00000411 83C402                   add  sp, 2
  1037 00000414 8946FE                   mov [bp-2], ax
  1038                                  
  1039                                  ;-130   if (i > IDLENMAX) error1("Item name is too long in characters)");
  1040                                  
  1041 00000417 8B46FE                   mov ax, [bp-2]
  1042 0000041A 83F80F                   cmp ax, 15
  1043 0000041D 0F8E0900                 jle .checknamelen37
  1044 00000421 68[2C04]                 push checknamelen_0
  1045 00000424 E8E843                   call error1
  1046 00000427 83C402                   add  sp, 2
  1047                                  
  1048                                  ;-131 }
  1049                                  
  1050                                  .checknamelen37:
  1051                                  
  1052                                  ;-132 char doglobName[IDLENMAX];
  1053 0000042A C9                       LEAVE
  1054 0000042B C3                       ret
  1055                                  ; ENDP
  1056 0000042C 4974656D206E616D65-     checknamelen_0 db "Item name is too long in characters)",0
  1057 00000435 20697320746F6F206C-
  1058 0000043E 6F6E6720696E206368-
  1059 00000447 617261637465727329-
  1060 00000450 00                 
  1061                                  section .bss
  1062                                  absolute 53391
  1063 0000D08F <res 0000000F>          doglobName resb 15
  1064                                  section .text
  1065                                  
  1066                                  ;-133 int doglob() { int i; int j; int isstrarr; isstrarr=0;
  1067                                  
  1068                                  
  1069                                  doglob:  ; *** PROC ***
  1070                                  ;Function : doglob, Number of local variables: 3
  1071                                  ;   # type sign width addr used name   list of local variables
  1072                                  ;  200 var sign word   133 NULL i = bp-2
  1073                                  ;  201 var sign word   133 NULL j = bp-4
  1074                                  ;  202 var sign word   133 NULL isstrarr = bp-6;
  1075 00000451 C8060000                 ENTER  6,0
  1076 00000455 B80000                   mov ax, 0
  1077 00000458 8946FA                   mov [bp-6], ax
  1078                                  
  1079                                  ;-134   if (GTop >= LSTART) error1("Global table full");
  1080                                  
  1081 0000045B A1[2A00]                 mov ax, [GTop]
  1082 0000045E 3DC800                   cmp ax, 200 ;unsigned : 1
  1083 00000461 0F8C0900                 jl  .doglob38
  1084 00000465 68[A607]                 push doglob_0
  1085 00000468 E8A443                   call error1
  1086 0000046B 83C402                   add  sp, 2
  1087                                  
  1088                                  ;-135   if (iswidth == 0) error1("no VOID as var type");
  1089                                  
  1090                                  .doglob38:
  1091 0000046E A0[3800]                 mov al, [iswidth]
  1092 00000471 3C00                     cmp al, 0
  1093 00000473 0F850900                 jne .doglob39
  1094 00000477 68[B807]                 push doglob_1
  1095 0000047A E89243                   call error1
  1096 0000047D 83C402                   add  sp, 2
  1097                                  
  1098                                  ;-136   checknamelen();
  1099                                  
  1100                                  .doglob39:
  1101 00000480 E882FF                   call checknamelen
  1102                                  
  1103                                  ;-137   if (checkName() != 0) error1("Variable already defined");
  1104                                  
  1105 00000483 E88305                   call checkName
  1106 00000486 3C00                     cmp al, 0
  1107 00000488 0F840900                 je  .doglob40
  1108 0000048C 68[CC07]                 push doglob_2
  1109 0000048F E87D43                   call error1
  1110 00000492 83C402                   add  sp, 2
  1111                                  
  1112                                  ;-138   if (istoken('[')) { istype='&';
  1113                                  
  1114                                  .doglob40:
  1115 00000495 6A5B                     push 91
  1116 00000497 E8553F                   call istoken
  1117 0000049A 83C402                   add  sp, 2
  1118 0000049D 08C0                     or  al, al
  1119 0000049F 0F84E201                 je .doglob41
  1120 000004A3 B82600                   mov ax, 38
  1121 000004A6 A2[3200]                 mov byte [istype], al
  1122                                  
  1123                                  ;-139     if (istoken(T_CONST)) {
  1124                                  
  1125 000004A9 680101                   push 257
  1126 000004AC E8403F                   call istoken
  1127 000004AF 83C402                   add  sp, 2
  1128 000004B2 08C0                     or  al, al
  1129 000004B4 0F84C200                 je .doglob42
  1130                                  
  1131                                  ;-140       prs("\nsection .bss\nabsolute ");
  1132                                  
  1133 000004B8 68[E507]                 push doglob_3
  1134 000004BB E86640                   call prs
  1135 000004BE 83C402                   add  sp, 2
  1136                                  
  1137                                  ;-141       prunsign1(orgData);
  1138                                  
  1139 000004C1 FF36[1000]               push word [orgData]
  1140 000004C5 E8B641                   call prunsign1
  1141 000004C8 83C402                   add  sp, 2
  1142                                  
  1143                                  ;-142       prs("\n"); prs(symbol); 
  1144                                  
  1145 000004CB 68[FF07]                 push doglob_4
  1146 000004CE E85340                   call prs
  1147 000004D1 83C402                   add  sp, 2
  1148 000004D4 8D062B81                 lea  ax, [symbol]
  1149 000004D8 50                       push ax
  1150 000004D9 E84840                   call prs
  1151 000004DC 83C402                   add  sp, 2
  1152                                  
  1153                                  ;-143       if (iswidth==1) prs(" resb "); 
  1154                                  
  1155 000004DF A0[3800]                 mov al, [iswidth]
  1156 000004E2 3C01                     cmp al, 1
  1157 000004E4 0F850900                 jne .doglob43
  1158 000004E8 68[0208]                 push doglob_5
  1159 000004EB E83640                   call prs
  1160 000004EE 83C402                   add  sp, 2
  1161                                  
  1162                                  ;-144       if (iswidth==2) prs(" resw ");
  1163                                  
  1164                                  .doglob43:
  1165 000004F1 A0[3800]                 mov al, [iswidth]
  1166 000004F4 3C02                     cmp al, 2
  1167 000004F6 0F850900                 jne .doglob44
  1168 000004FA 68[0908]                 push doglob_6
  1169 000004FD E82440                   call prs
  1170 00000500 83C402                   add  sp, 2
  1171                                  
  1172                                  ;-145       if (iswidth==4) prs(" resd ");
  1173                                  
  1174                                  .doglob44:
  1175 00000503 A0[3800]                 mov al, [iswidth]
  1176 00000506 3C04                     cmp al, 4
  1177 00000508 0F850900                 jne .doglob45
  1178 0000050C 68[1008]                 push doglob_7
  1179 0000050F E81240                   call prs
  1180 00000512 83C402                   add  sp, 2
  1181                                  
  1182                                  ;-146       prunsign1(lexval); 
  1183                                  
  1184                                  .doglob45:
  1185 00000515 FF36[2E00]               push word [lexval]
  1186 00000519 E86241                   call prunsign1
  1187 0000051C 83C402                   add  sp, 2
  1188                                  
  1189                                  ;-147       prs("\nsection .text");
  1190                                  
  1191 0000051F 68[1708]                 push doglob_8
  1192 00000522 E8FF3F                   call prs
  1193 00000525 83C402                   add  sp, 2
  1194                                  
  1195                                  ;-148       orgData=orgData+lexval;
  1196                                  
  1197 00000528 A1[1000]                 mov ax, [orgData]
  1198 0000052B 0306[2E00]               add ax, [lexval]
  1199 0000052F A3[1000]                 mov word [orgData], ax
  1200                                  
  1201                                  ;-149       if (iswidth==2) orgData=orgData+lexval;
  1202                                  
  1203 00000532 A0[3800]                 mov al, [iswidth]
  1204 00000535 3C02                     cmp al, 2
  1205 00000537 0F850A00                 jne .doglob46
  1206 0000053B A1[1000]                 mov ax, [orgData]
  1207 0000053E 0306[2E00]               add ax, [lexval]
  1208 00000542 A3[1000]                 mov word [orgData], ax
  1209                                  
  1210                                  ;-150       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}
  1211                                  
  1212                                  .doglob46:
  1213 00000545 A0[3800]                 mov al, [iswidth]
  1214 00000548 3C04                     cmp al, 4
  1215 0000054A 0F851400                 jne .doglob47
  1216 0000054E A1[2E00]                 mov ax, [lexval]
  1217 00000551 BB0300                   mov bx, 3
  1218 00000554 F7E3                     mul bx
  1219 00000556 8946FE                   mov [bp-2], ax
  1220 00000559 A1[1000]                 mov ax, [orgData]
  1221 0000055C 0346FE                   add ax, [bp-2]
  1222 0000055F A3[1000]                 mov word [orgData], ax
  1223                                  
  1224                                  ;-151       GData[GTop]=lexval; expect(']');
  1225                                  
  1226                                  .doglob47:
  1227 00000562 A1[2E00]                 mov ax, [lexval]
  1228 00000565 8B1E[2A00]               mov bx, [GTop]
  1229 00000569 D1E3                     shl bx, 1
  1230 0000056B 8987EB8A                 mov [GData+bx], ax
  1231 0000056F 6A5D                     push 93
  1232 00000571 E89D3E                   call expect
  1233 00000574 83C402                   add  sp, 2
  1234                                  
  1235                                  ;-152     }else { expect(']');
  1236                                  
  1237 00000577 E90801                   jmp .doglob48
  1238                                  .doglob42:
  1239 0000057A 6A5D                     push 93
  1240 0000057C E8923E                   call expect
  1241 0000057F 83C402                   add  sp, 2
  1242                                  
  1243                                  ;-153       if (iswidth != 1) error1("Only ByteArray allowed");
  1244                                  
  1245 00000582 A0[3800]                 mov al, [iswidth]
  1246 00000585 3C01                     cmp al, 1
  1247 00000587 0F840900                 je  .doglob49
  1248 0000058B 68[2708]                 push doglob_9
  1249 0000058E E87E42                   call error1
  1250 00000591 83C402                   add  sp, 2
  1251                                  
  1252                                  ;-154       prs("\n"); prs(symbol); prs(" db "); 
  1253                                  
  1254                                  .doglob49:
  1255 00000594 68[3E08]                 push doglob_10
  1256 00000597 E88A3F                   call prs
  1257 0000059A 83C402                   add  sp, 2
  1258 0000059D 8D062B81                 lea  ax, [symbol]
  1259 000005A1 50                       push ax
  1260 000005A2 E87F3F                   call prs
  1261 000005A5 83C402                   add  sp, 2
  1262 000005A8 68[4108]                 push doglob_11
  1263 000005AB E8763F                   call prs
  1264 000005AE 83C402                   add  sp, 2
  1265                                  
  1266                                  ;-155       isstrarr=1; strcpy(doglobName, symbol);
  1267                                  
  1268 000005B1 B80100                   mov ax, 1
  1269 000005B4 8946FA                   mov [bp-6], ax
  1270 000005B7 8D062B81                 lea  ax, [symbol]
  1271 000005BB 50                       push ax
  1272 000005BC 8D068FD0                 lea  ax, [doglobName]
  1273 000005C0 50                       push ax
  1274 000005C1 E8A2FB                   call strcpy
  1275 000005C4 83C404                   add  sp, 4
  1276                                  
  1277                                  ;-156       expect('='); 
  1278                                  
  1279 000005C7 6A3D                     push 61
  1280 000005C9 E8453E                   call expect
  1281 000005CC 83C402                   add  sp, 2
  1282                                  
  1283                                  ;-157       if (istoken(T_STRING)) { 
  1284                                  
  1285 000005CF 680201                   push 258
  1286 000005D2 E81A3E                   call istoken
  1287 000005D5 83C402                   add  sp, 2
  1288 000005D8 08C0                     or  al, al
  1289 000005DA 0F844200                 je .doglob50
  1290                                  
  1291                                  ;-158         prc(34); prscomment(symbol); prc(34); prs(",0"); 
  1292                                  
  1293 000005DE 6A22                     push 34
  1294 000005E0 E8DA3E                   call prc
  1295 000005E3 83C402                   add  sp, 2
  1296 000005E6 8D062B81                 lea  ax, [symbol]
  1297 000005EA 50                       push ax
  1298 000005EB E8FA3E                   call prscomment
  1299 000005EE 83C402                   add  sp, 2
  1300 000005F1 6A22                     push 34
  1301 000005F3 E8C73E                   call prc
  1302 000005F6 83C402                   add  sp, 2
  1303 000005F9 68[4608]                 push doglob_12
  1304 000005FC E8253F                   call prs
  1305 000005FF 83C402                   add  sp, 2
  1306                                  
  1307                                  ;-159         i=strlen(symbol); GData[GTop]=i; }
  1308                                  
  1309 00000602 8D062B81                 lea  ax, [symbol]
  1310 00000606 50                       push ax
  1311 00000607 E834FB                   call strlen
  1312 0000060A 83C402                   add  sp, 2
  1313 0000060D 8946FE                   mov [bp-2], ax
  1314 00000610 8B46FE                   mov ax, [bp-2]
  1315 00000613 8B1E[2A00]               mov bx, [GTop]
  1316 00000617 D1E3                     shl bx, 1
  1317 00000619 8987EB8A                 mov [GData+bx], ax
  1318                                  
  1319                                  ;-160       else if (istoken('{' )) { i=0;
  1320                                  
  1321 0000061D E96200                   jmp .doglob51
  1322                                  .doglob50:
  1323 00000620 6A7B                     push 123
  1324 00000622 E8CA3D                   call istoken
  1325 00000625 83C402                   add  sp, 2
  1326 00000628 08C0                     or  al, al
  1327 0000062A 0F844B00                 je .doglob52
  1328 0000062E B80000                   mov ax, 0
  1329 00000631 8946FE                   mov [bp-2], ax
  1330                                  
  1331                                  ;-161         do { if(i) prc(','); 
  1332                                  
  1333                                  .doglob53:
  1334 00000634 8B46FE                   mov ax, [bp-2]
  1335 00000637 08C0                     or  al, al
  1336 00000639 0F840800                 je .doglob54
  1337 0000063D 6A2C                     push 44
  1338 0000063F E87B3E                   call prc
  1339 00000642 83C402                   add  sp, 2
  1340                                  
  1341                                  ;-162           expect(T_CONST); prunsign1(lexval); i=1; }
  1342                                  
  1343                                  .doglob54:
  1344 00000645 680101                   push 257
  1345 00000648 E8C63D                   call expect
  1346 0000064B 83C402                   add  sp, 2
  1347 0000064E FF36[2E00]               push word [lexval]
  1348 00000652 E82940                   call prunsign1
  1349 00000655 83C402                   add  sp, 2
  1350 00000658 B80100                   mov ax, 1
  1351 0000065B 8946FE                   mov [bp-2], ax
  1352                                  
  1353                                  ;-163         while (istoken(',')); expect('}'); }  
  1354                                  
  1355 0000065E 6A2C                     push 44
  1356 00000660 E88C3D                   call istoken
  1357 00000663 83C402                   add  sp, 2
  1358 00000666 08C0                     or  al, al
  1359 00000668 0F840200                 je .doglob55
  1360 0000066C EBC6                     jmp .doglob53
  1361                                  .doglob55:
  1362 0000066E 6A7D                     push 125
  1363 00000670 E89E3D                   call expect
  1364 00000673 83C402                   add  sp, 2
  1365                                  
  1366                                  ;-164       else error1("String or number array expected");
  1367                                  
  1368 00000676 E90900                   jmp .doglob56
  1369                                  .doglob52:
  1370 00000679 68[4908]                 push doglob_13
  1371 0000067C E89041                   call error1
  1372 0000067F 83C402                   add  sp, 2
  1373                                  
  1374                                  ;-165       }; 
  1375                                  
  1376                                  .doglob56:
  1377                                  .doglob51:
  1378                                  .doglob48:
  1379                                  
  1380                                  ;-166   }else { //expect('=');
  1381                                  
  1382 00000682 E99E00                   jmp .doglob57
  1383                                  .doglob41:
  1384                                  
  1385                                  ;-167     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");
  1386                                  
  1387 00000685 68[6908]                 push doglob_14
  1388 00000688 E8993E                   call prs
  1389 0000068B 83C402                   add  sp, 2
  1390 0000068E 8D062B81                 lea  ax, [symbol]
  1391 00000692 50                       push ax
  1392 00000693 E88E3E                   call prs
  1393 00000696 83C402                   add  sp, 2
  1394 00000699 A0[3200]                 mov al, [istype]
  1395 0000069C 3C2A                     cmp al, 42
  1396 0000069E 0F850C00                 jne .doglob58
  1397 000006A2 68[6C08]                 push doglob_15
  1398 000006A5 E87C3E                   call prs
  1399 000006A8 83C402                   add  sp, 2
  1400                                  
  1401                                  ;-168     else {
  1402                                  
  1403 000006AB E93300                   jmp .doglob59
  1404                                  .doglob58:
  1405                                  
  1406                                  ;-169       if      (iswidth==1) prs(" db ");
  1407                                  
  1408 000006AE A0[3800]                 mov al, [iswidth]
  1409 000006B1 3C01                     cmp al, 1
  1410 000006B3 0F850C00                 jne .doglob60
  1411 000006B7 68[7108]                 push doglob_16
  1412 000006BA E8673E                   call prs
  1413 000006BD 83C402                   add  sp, 2
  1414                                  
  1415                                  ;-170       else if (iswidth==2) prs(" dw ");
  1416                                  
  1417 000006C0 E91E00                   jmp .doglob61
  1418                                  .doglob60:
  1419 000006C3 A0[3800]                 mov al, [iswidth]
  1420 000006C6 3C02                     cmp al, 2
  1421 000006C8 0F850C00                 jne .doglob62
  1422 000006CC 68[7608]                 push doglob_17
  1423 000006CF E8523E                   call prs
  1424 000006D2 83C402                   add  sp, 2
  1425                                  
  1426                                  ;-171       else                 prs(" dd ");
  1427                                  
  1428 000006D5 E90900                   jmp .doglob63
  1429                                  .doglob62:
  1430 000006D8 68[7B08]                 push doglob_18
  1431 000006DB E8463E                   call prs
  1432 000006DE 83C402                   add  sp, 2
  1433                                  
  1434                                  ;-172     }
  1435                                  
  1436                                  .doglob63:
  1437                                  .doglob61:
  1438                                  
  1439                                  ;-173     if(istoken('-')) prc('-');
  1440                                  
  1441                                  .doglob59:
  1442 000006E1 6A2D                     push 45
  1443 000006E3 E8093D                   call istoken
  1444 000006E6 83C402                   add  sp, 2
  1445 000006E9 08C0                     or  al, al
  1446 000006EB 0F840800                 je .doglob64
  1447 000006EF 6A2D                     push 45
  1448 000006F1 E8C93D                   call prc
  1449 000006F4 83C402                   add  sp, 2
  1450                                  
  1451                                  ;-174     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }
  1452                                  
  1453                                  .doglob64:
  1454 000006F7 6A3D                     push 61
  1455 000006F9 E8F33C                   call istoken
  1456 000006FC 83C402                   add  sp, 2
  1457 000006FF 08C0                     or  al, al
  1458 00000701 0F841600                 je .doglob65
  1459 00000705 680101                   push 257
  1460 00000708 E8063D                   call expect
  1461 0000070B 83C402                   add  sp, 2
  1462 0000070E FF36[2E00]               push word [lexval]
  1463 00000712 E8693F                   call prunsign1
  1464 00000715 83C402                   add  sp, 2
  1465                                  
  1466                                  ;-175     else prunsign1(0); }
  1467                                  
  1468 00000718 E90800                   jmp .doglob66
  1469                                  .doglob65:
  1470 0000071B 6A00                     push 0
  1471 0000071D E85E3F                   call prunsign1
  1472 00000720 83C402                   add  sp, 2
  1473                                  .doglob66:
  1474                                  
  1475                                  ;-176   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;
  1476                                  
  1477                                  .doglob57:
  1478 00000723 A0[3500]                 mov al, [issign]
  1479 00000726 8B1E[2A00]               mov bx, [GTop]
  1480 0000072A 8887E383                 mov [GSign+bx], al
  1481 0000072E A0[3800]                 mov al, [iswidth]
  1482 00000731 8B1E[2A00]               mov bx, [GTop]
  1483 00000735 88870F85                 mov [GWidth+bx], al
  1484 00000739 A0[3200]                 mov al, [istype]
  1485 0000073C 8B1E[2A00]               mov bx, [GTop]
  1486 00000740 8887B782                 mov [GType+bx], al
  1487                                  
  1488                                  ;-177   GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  1489                                  
  1490 00000744 A1[6600]                 mov ax, [lineno]
  1491 00000747 83E801                   sub ax, 1
  1492 0000074A 8B1E[2A00]               mov bx, [GTop]
  1493 0000074E D1E3                     shl bx, 1
  1494 00000750 89873B86                 mov [GAdr+bx], ax
  1495 00000754 B80000                   mov ax, 0
  1496 00000757 8B1E[2A00]               mov bx, [GTop]
  1497 0000075B D1E3                     shl bx, 1
  1498 0000075D 89879388                 mov [GUsed+bx], ax
  1499                                  
  1500                                  ;-178   pt=adrofname(GTop);
  1501                                  
  1502 00000761 FF36[2A00]               push word [GTop]
  1503 00000765 E8CF01                   call adrofname
  1504 00000768 83C402                   add  sp, 2
  1505 0000076B A3[6A00]                 mov word [pt], ax
  1506                                  
  1507                                  ;-179   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);
  1508                                  
  1509 0000076E 8B46FA                   mov ax, [bp-6]
  1510 00000771 08C0                     or  al, al
  1511 00000773 0F841200                 je .doglob67
  1512 00000777 8D068FD0                 lea  ax, [doglobName]
  1513 0000077B 50                       push ax
  1514 0000077C FF36[6A00]               push word [pt]
  1515 00000780 E8E3F9                   call strcpy
  1516 00000783 83C404                   add  sp, 4
  1517 00000786 E90F00                   jmp .doglob68
  1518                                  .doglob67:
  1519 00000789 8D062B81                 lea  ax, [symbol]
  1520 0000078D 50                       push ax
  1521 0000078E FF36[6A00]               push word [pt]
  1522 00000792 E8D1F9                   call strcpy
  1523 00000795 83C404                   add  sp, 4
  1524                                  
  1525                                  ;-180   GTop++; expect(';'); }
  1526                                  
  1527                                  .doglob68:
  1528 00000798 FF06[2A00]               inc  word[GTop]
  1529 0000079C 6A3B                     push 59
  1530 0000079E E8703C                   call expect
  1531 000007A1 83C402                   add  sp, 2
  1532                                  
  1533                                  ;-181 
  1534                                  
  1535                                  
  1536                                  ;-182 int gettypes(int i) {int j; char c;
  1537 000007A4 C9                       LEAVE
  1538 000007A5 C3                       ret
  1539                                  ; ENDP
  1540 000007A6 476C6F62616C207461-     doglob_0 db "Global table full",0
  1541 000007AF 626C652066756C6C00 
  1542 000007B8 6E6F20564F49442061-     doglob_1 db "no VOID as var type",0
  1543 000007C1 732076617220747970-
  1544 000007CA 6500               
  1545 000007CC 5661726961626C6520-     doglob_2 db "Variable already defined",0
  1546 000007D5 616C72656164792064-
  1547 000007DE 6566696E656400     
  1548 000007E5 5C6E73656374696F6E-     doglob_3 db "\nsection .bss\nabsolute ",0
  1549 000007EE 202E6273735C6E6162-
  1550 000007F7 736F6C7574652000   
  1551 000007FF 5C6E00                  doglob_4 db "\n",0
  1552 00000802 20726573622000          doglob_5 db " resb ",0
  1553 00000809 20726573772000          doglob_6 db " resw ",0
  1554 00000810 20726573642000          doglob_7 db " resd ",0
  1555 00000817 5C6E73656374696F6E-     doglob_8 db "\nsection .text",0
  1556 00000820 202E7465787400     
  1557 00000827 4F6E6C792042797465-     doglob_9 db "Only ByteArray allowed",0
  1558 00000830 417272617920616C6C-
  1559 00000839 6F77656400         
  1560 0000083E 5C6E00                  doglob_10 db "\n",0
  1561 00000841 2064622000              doglob_11 db " db ",0
  1562 00000846 2C3000                  doglob_12 db ",0",0
  1563 00000849 537472696E67206F72-     doglob_13 db "String or number array expected",0
  1564 00000852 206E756D6265722061-
  1565 0000085B 727261792065787065-
  1566 00000864 6374656400         
  1567 00000869 5C6E00                  doglob_14 db "\n",0
  1568 0000086C 2064772000              doglob_15 db " dw ",0
  1569 00000871 2064622000              doglob_16 db " db ",0
  1570 00000876 2064772000              doglob_17 db " dw ",0
  1571 0000087B 2064642000              doglob_18 db " dd ",0
  1572                                  
  1573                                  gettypes:  ; *** PROC ***
  1574                                  
  1575                                  ;-183   c=GSign [i]; if (c=='S') signi =1;    else signi =0;
  1576                                  
  1577                                  ;Function : gettypes, Number of local variables: 3
  1578                                  ;   # type sign width addr used name   list of local variables
  1579                                  ;  200 var sign word   182 NULL i = bp+4
  1580                                  ;  201 var sign word   182 NULL j = bp-2
  1581                                  ;  202 var sign byte   182 NULL c = bp-4;
  1582 00000880 C8040000                 ENTER  4,0
  1583 00000884 8B5E04                   mov bx, [bp+4]
  1584 00000887 8A87E383                 mov al, [GSign + bx]
  1585 0000088B 8846FC                   mov [bp-4], al
  1586 0000088E 8A46FC                   mov al, [bp-4]
  1587 00000891 3C53                     cmp al, 83
  1588 00000893 0F850900                 jne .gettypes69
  1589 00000897 B80100                   mov ax, 1
  1590 0000089A A3[3300]                 mov word [signi], ax
  1591 0000089D E90600                   jmp .gettypes70
  1592                                  .gettypes69:
  1593 000008A0 B80000                   mov ax, 0
  1594 000008A3 A3[3300]                 mov word [signi], ax
  1595                                  
  1596                                  ;-184   c=GWidth[i]; widthi=0;wi=0;
  1597                                  
  1598                                  .gettypes70:
  1599 000008A6 8B5E04                   mov bx, [bp+4]
  1600 000008A9 8A870F85                 mov al, [GWidth + bx]
  1601 000008AD 8846FC                   mov [bp-4], al
  1602 000008B0 B80000                   mov ax, 0
  1603 000008B3 A3[3600]                 mov word [widthi], ax
  1604 000008B6 B80000                   mov ax, 0
  1605 000008B9 A3[3900]                 mov word [wi], ax
  1606                                  
  1607                                  ;-185   if (c==1) {widthi=1;wi=1;}
  1608                                  
  1609 000008BC 8A46FC                   mov al, [bp-4]
  1610 000008BF 3C01                     cmp al, 1
  1611 000008C1 0F850C00                 jne .gettypes71
  1612 000008C5 B80100                   mov ax, 1
  1613 000008C8 A3[3600]                 mov word [widthi], ax
  1614 000008CB B80100                   mov ax, 1
  1615 000008CE A3[3900]                 mov word [wi], ax
  1616                                  
  1617                                  ;-186   if (c==2) {widthi=2;wi=2;}
  1618                                  
  1619                                  .gettypes71:
  1620 000008D1 8A46FC                   mov al, [bp-4]
  1621 000008D4 3C02                     cmp al, 2
  1622 000008D6 0F850C00                 jne .gettypes72
  1623 000008DA B80200                   mov ax, 2
  1624 000008DD A3[3600]                 mov word [widthi], ax
  1625 000008E0 B80200                   mov ax, 2
  1626 000008E3 A3[3900]                 mov word [wi], ax
  1627                                  
  1628                                  ;-187   if (c==4) {widthi=4;wi=4;}
  1629                                  
  1630                                  .gettypes72:
  1631 000008E6 8A46FC                   mov al, [bp-4]
  1632 000008E9 3C04                     cmp al, 4
  1633 000008EB 0F850C00                 jne .gettypes73
  1634 000008EF B80400                   mov ax, 4
  1635 000008F2 A3[3600]                 mov word [widthi], ax
  1636 000008F5 B80400                   mov ax, 4
  1637 000008F8 A3[3900]                 mov word [wi], ax
  1638                                  
  1639                                  ;-188   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}
  1640                                  
  1641                                  .gettypes73:
  1642 000008FB 8B5E04                   mov bx, [bp+4]
  1643 000008FE 8A87B782                 mov al, [GType + bx]
  1644 00000902 8846FC                   mov [bp-4], al
  1645 00000905 B80000                   mov ax, 0
  1646 00000908 A3[3000]                 mov word [typei], ax
  1647 0000090B 8A46FC                   mov al, [bp-4]
  1648 0000090E 3C2A                     cmp al, 42
  1649 00000910 0F850C00                 jne .gettypes74
  1650 00000914 B80100                   mov ax, 1
  1651 00000917 A3[3000]                 mov word [typei], ax
  1652 0000091A B80200                   mov ax, 2
  1653 0000091D A3[3900]                 mov word [wi], ax
  1654                                  
  1655                                  ;-189   if (c=='&')  typei=2;  
  1656                                  
  1657                                  .gettypes74:
  1658 00000920 8A46FC                   mov al, [bp-4]
  1659 00000923 3C26                     cmp al, 38
  1660 00000925 0F850600                 jne .gettypes75
  1661 00000929 B80200                   mov ax, 2
  1662 0000092C A3[3000]                 mov word [typei], ax
  1663                                  
  1664                                  ;-190   return i; }  
  1665                                  
  1666                                  .gettypes75:
  1667 0000092F 8B4604                   mov ax, [bp+4]
  1668 00000932 E90000                   jmp .retn
  1669                                  
  1670                                  ;-191 int adrofname(unsigned int i) { adrF(GNameField, i); }
  1671                                  
  1672 00000935 C9                       .retn: LEAVE
  1673 00000936 C3                       ret
  1674                                  ; ENDP
  1675                                  
  1676                                  adrofname:  ; *** PROC ***
  1677                                  ;Function : adrofname, Number of local variables: 1
  1678                                  ;   # type sign width addr used name   list of local variables
  1679                                  ;  200 var unsg word   191 NULL i = bp+4;
  1680 00000937 C8000000                 ENTER  0,0
  1681 0000093B FF7604                   push word [bp+4]
  1682 0000093E 8D06438D                 lea  ax, [GNameField]
  1683 00000942 50                       push ax
  1684 00000943 E80500                   call adrF
  1685 00000946 83C404                   add  sp, 4
  1686                                  
  1687                                  ;-192 int adrF(char *s, unsigned int i) { i << 4;//*16; IDLENMAX=15!
  1688 00000949 C9                       LEAVE
  1689 0000094A C3                       ret
  1690                                  ; ENDP
  1691                                  
  1692                                  adrF:  ; *** PROC ***
  1693                                  ;Function : adrF, Number of local variables: 2
  1694                                  ;   # type sign width addr used name   list of local variables
  1695                                  ;  200 ptr sign byte   192 NULL s = bp+4
  1696                                  ;  201 var unsg word   192 NULL i = bp+6;
  1697 0000094B C8000000                 ENTER  0,0
  1698 0000094F 8B4606                   mov ax, [bp+6]
  1699 00000952 C1E004                   shl ax, 4
  1700                                  
  1701                                  ;-193   __asm{ add ax, [bp+4]  ; offset s } }
  1702                                  
  1703 00000955 034604                   add ax, [bp+4]  ; offset s 
  1704                                  
  1705                                  ;-194 int printName(unsigned int i) {int j;
  1706 00000958 C9                       LEAVE
  1707 00000959 C3                       ret
  1708                                  ; ENDP
  1709                                  
  1710                                  printName:  ; *** PROC ***
  1711                                  
  1712                                  ;-195   if (i < LSTART) { i=adrofname(i); prs(i); }
  1713                                  
  1714                                  ;Function : printName, Number of local variables: 2
  1715                                  ;   # type sign width addr used name   list of local variables
  1716                                  ;  200 var unsg word   194 NULL i = bp+4
  1717                                  ;  201 var sign word   194 NULL j = bp-2;
  1718 0000095A C8020000                 ENTER  2,0
  1719 0000095E 8B4604                   mov ax, [bp+4]
  1720 00000961 3DC800                   cmp ax, 200
  1721 00000964 0F8D1800                 jge .printName76
  1722 00000968 FF7604                   push word [bp+4]
  1723 0000096B E8C9FF                   call adrofname
  1724 0000096E 83C402                   add  sp, 2
  1725 00000971 894604                   mov [bp+4], ax
  1726 00000974 FF7604                   push word [bp+4]
  1727 00000977 E8AA3B                   call prs
  1728 0000097A 83C402                   add  sp, 2
  1729                                  
  1730                                  ;-196   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }
  1731                                  
  1732 0000097D E93800                   jmp .printName77
  1733                                  .printName76:
  1734 00000980 68[BA09]                 push printName_0
  1735 00000983 E89E3B                   call prs
  1736 00000986 83C402                   add  sp, 2
  1737 00000989 8B5E04                   mov bx, [bp+4]
  1738 0000098C D1E3                     shl bx, 1
  1739 0000098E 8B87EB8A                 mov ax, [GData + bx]
  1740 00000992 8946FE                   mov [bp-2], ax
  1741 00000995 8B46FE                   mov ax, [bp-2]
  1742 00000998 83F800                   cmp ax, 0
  1743 0000099B 0F8E0800                 jle .printName78
  1744 0000099F 6A2B                     push 43
  1745 000009A1 E8193B                   call prc
  1746 000009A4 83C402                   add  sp, 2
  1747                                  .printName78:
  1748 000009A7 FF76FE                   push word [bp-2]
  1749 000009AA E86E3C                   call pint1
  1750 000009AD 83C402                   add  sp, 2
  1751 000009B0 6A5D                     push 93
  1752 000009B2 E8083B                   call prc
  1753 000009B5 83C402                   add  sp, 2
  1754                                  
  1755                                  ;-197 }
  1756                                  
  1757                                  .printName77:
  1758                                  
  1759                                  ;-198 int searchname() { unsigned int i;
  1760 000009B8 C9                       LEAVE
  1761 000009B9 C3                       ret
  1762                                  ; ENDP
  1763 000009BA 5B627000                printName_0 db "[bp",0
  1764                                  
  1765                                  searchname:  ; *** PROC ***
  1766                                  
  1767                                  ;-199   i=checkName(); if (i == 0) error1("Variable unknown");
  1768                                  
  1769                                  ;Function : searchname, Number of local variables: 1
  1770                                  ;   # type sign width addr used name   list of local variables
  1771                                  ;  200 var unsg word   198 NULL i = bp-2;
  1772 000009BE C8020000                 ENTER  2,0
  1773 000009C2 E84400                   call checkName
  1774 000009C5 8946FE                   mov [bp-2], ax
  1775 000009C8 8B46FE                   mov ax, [bp-2]
  1776 000009CB 83F800                   cmp ax, 0
  1777 000009CE 0F850900                 jne .searchname79
  1778 000009D2 68[F809]                 push searchname_0
  1779 000009D5 E8373E                   call error1
  1780 000009D8 83C402                   add  sp, 2
  1781                                  
  1782                                  ;-200   GUsed[i]=GUsed[i] + 1; return i;
  1783                                  
  1784                                  .searchname79:
  1785 000009DB 8B5EFE                   mov bx, [bp-2]
  1786 000009DE D1E3                     shl bx, 1
  1787 000009E0 8B879388                 mov ax, [GUsed + bx]
  1788 000009E4 83C001                   add ax, 1
  1789 000009E7 8B5EFE                   mov bx, [bp-2]
  1790 000009EA D1E3                     shl bx, 1
  1791 000009EC 89879388                 mov [GUsed+bx], ax
  1792 000009F0 8B46FE                   mov ax, [bp-2]
  1793 000009F3 E90000                   jmp .retn
  1794                                  
  1795                                  ;-201 }
  1796                                  
  1797                                  
  1798                                  ;-202 int checkName() { unsigned int i; unsigned int j;
  1799                                  
  1800 000009F6 C9                       .retn: LEAVE
  1801 000009F7 C3                       ret
  1802                                  ; ENDP
  1803 000009F8 5661726961626C6520-     searchname_0 db "Variable unknown",0
  1804 00000A01 756E6B6E6F776E00   
  1805                                  
  1806                                  checkName:  ; *** PROC ***
  1807                                  
  1808                                  ;-203   i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  1809                                  
  1810                                  ;Function : checkName, Number of local variables: 2
  1811                                  ;   # type sign width addr used name   list of local variables
  1812                                  ;  200 var unsg word   202 NULL i = bp-2
  1813                                  ;  201 var unsg word   202 NULL j = bp-4;
  1814 00000A09 C8040000                 ENTER  4,0
  1815 00000A0D B8C800                   mov ax, 200
  1816 00000A10 8946FE                   mov [bp-2], ax
  1817                                  .checkName80:
  1818 00000A13 8B46FE                   mov ax, [bp-2]
  1819 00000A16 3B06[2C00]               cmp ax, [LTop]
  1820 00000A1A 0F8D2B00                 jge .checkName81
  1821 00000A1E FF76FE                   push word [bp-2]
  1822 00000A21 E813FF                   call adrofname
  1823 00000A24 83C402                   add  sp, 2
  1824 00000A27 8946FC                   mov [bp-4], ax
  1825 00000A2A FF76FC                   push word [bp-4]
  1826 00000A2D 8D062B81                 lea  ax, [symbol]
  1827 00000A31 50                       push ax
  1828 00000A32 E861F7                   call eqstr
  1829 00000A35 83C404                   add  sp, 4
  1830 00000A38 08C0                     or  al, al
  1831 00000A3A 0F840600                 je .checkName82
  1832 00000A3E 8B46FE                   mov ax, [bp-2]
  1833 00000A41 E94700                   jmp .retn
  1834                                  .checkName82:
  1835 00000A44 FF46FE                   inc  word[bp-2]
  1836                                  
  1837                                  ;-204   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  1838                                  
  1839 00000A47 EBCA                     jmp .checkName80
  1840                                  .checkName81:
  1841 00000A49 B80100                   mov ax, 1
  1842 00000A4C 8946FE                   mov [bp-2], ax
  1843                                  .checkName83:
  1844 00000A4F 8B46FE                   mov ax, [bp-2]
  1845 00000A52 3B06[2A00]               cmp ax, [GTop]
  1846 00000A56 0F8D2B00                 jge .checkName84
  1847 00000A5A FF76FE                   push word [bp-2]
  1848 00000A5D E8D7FE                   call adrofname
  1849 00000A60 83C402                   add  sp, 2
  1850 00000A63 8946FC                   mov [bp-4], ax
  1851 00000A66 FF76FC                   push word [bp-4]
  1852 00000A69 8D062B81                 lea  ax, [symbol]
  1853 00000A6D 50                       push ax
  1854 00000A6E E825F7                   call eqstr
  1855 00000A71 83C404                   add  sp, 4
  1856 00000A74 08C0                     or  al, al
  1857 00000A76 0F840600                 je .checkName85
  1858 00000A7A 8B46FE                   mov ax, [bp-2]
  1859 00000A7D E90B00                   jmp .retn
  1860                                  .checkName85:
  1861 00000A80 FF46FE                   inc  word[bp-2]
  1862                                  
  1863                                  ;-205   return 0;
  1864                                  
  1865 00000A83 EBCA                     jmp .checkName83
  1866                                  .checkName84:
  1867 00000A85 B80000                   mov ax, 0
  1868 00000A88 E90000                   jmp .retn
  1869                                  
  1870                                  ;-206 }    
  1871                                  
  1872                                  
  1873                                  ;-207 int typeName() { int m; //0=V,1=*,2=&
  1874                                  
  1875 00000A8B C9                       .retn: LEAVE
  1876 00000A8C C3                       ret
  1877                                  ; ENDP
  1878                                  
  1879                                  typeName:  ; *** PROC ***
  1880                                  
  1881                                  ;-208     issign='S';
  1882                                  
  1883                                  ;Function : typeName, Number of local variables: 1
  1884                                  ;   # type sign width addr used name   list of local variables
  1885                                  ;  200 var sign word   207 NULL m = bp-2;
  1886 00000A8D C8020000                 ENTER  2,0
  1887 00000A91 B85300                   mov ax, 83
  1888 00000A94 A2[3500]                 mov byte [issign], al
  1889                                  
  1890                                  ;-209     if(istoken(T_SIGNED))   issign='S';  
  1891                                  
  1892 00000A97 681302                   push 531
  1893 00000A9A E85239                   call istoken
  1894 00000A9D 83C402                   add  sp, 2
  1895 00000AA0 08C0                     or  al, al
  1896 00000AA2 0F840600                 je .typeName86
  1897 00000AA6 B85300                   mov ax, 83
  1898 00000AA9 A2[3500]                 mov byte [issign], al
  1899                                  
  1900                                  ;-210     if(istoken(T_UNSIGNED)) issign='U';
  1901                                  
  1902                                  .typeName86:
  1903 00000AAC 681402                   push 532
  1904 00000AAF E83D39                   call istoken
  1905 00000AB2 83C402                   add  sp, 2
  1906 00000AB5 08C0                     or  al, al
  1907 00000AB7 0F840600                 je .typeName87
  1908 00000ABB B85500                   mov ax, 85
  1909 00000ABE A2[3500]                 mov byte [issign], al
  1910                                  
  1911                                  ;-211     iswidth=2;                           
  1912                                  
  1913                                  .typeName87:
  1914 00000AC1 B80200                   mov ax, 2
  1915 00000AC4 A2[3800]                 mov byte [iswidth], al
  1916                                  
  1917                                  ;-212     if(istoken(T_VOID))     iswidth=0;
  1918                                  
  1919 00000AC7 681102                   push 529
  1920 00000ACA E82239                   call istoken
  1921 00000ACD 83C402                   add  sp, 2
  1922 00000AD0 08C0                     or  al, al
  1923 00000AD2 0F840600                 je .typeName88
  1924 00000AD6 B80000                   mov ax, 0
  1925 00000AD9 A2[3800]                 mov byte [iswidth], al
  1926                                  
  1927                                  ;-213     if(istoken(T_CHAR))     iswidth=1;   
  1928                                  
  1929                                  .typeName88:
  1930 00000ADC 681202                   push 530
  1931 00000ADF E80D39                   call istoken
  1932 00000AE2 83C402                   add  sp, 2
  1933 00000AE5 08C0                     or  al, al
  1934 00000AE7 0F840600                 je .typeName89
  1935 00000AEB B80100                   mov ax, 1
  1936 00000AEE A2[3800]                 mov byte [iswidth], al
  1937                                  
  1938                                  ;-214     if(istoken(T_INT))      iswidth=2;
  1939                                  
  1940                                  .typeName89:
  1941 00000AF1 680502                   push 517
  1942 00000AF4 E8F838                   call istoken
  1943 00000AF7 83C402                   add  sp, 2
  1944 00000AFA 08C0                     or  al, al
  1945 00000AFC 0F840600                 je .typeName90
  1946 00000B00 B80200                   mov ax, 2
  1947 00000B03 A2[3800]                 mov byte [iswidth], al
  1948                                  
  1949                                  ;-215     if(istoken(T_LONG))     iswidth=4;
  1950                                  
  1951                                  .typeName90:
  1952 00000B06 681502                   push 533
  1953 00000B09 E8E338                   call istoken
  1954 00000B0C 83C402                   add  sp, 2
  1955 00000B0F 08C0                     or  al, al
  1956 00000B11 0F840600                 je .typeName91
  1957 00000B15 B80400                   mov ax, 4
  1958 00000B18 A2[3800]                 mov byte [iswidth], al
  1959                                  
  1960                                  ;-216     istype='V'; 
  1961                                  
  1962                                  .typeName91:
  1963 00000B1B B85600                   mov ax, 86
  1964 00000B1E A2[3200]                 mov byte [istype], al
  1965                                  
  1966                                  ;-217     m=0;
  1967                                  
  1968 00000B21 B80000                   mov ax, 0
  1969 00000B24 8946FE                   mov [bp-2], ax
  1970                                  
  1971                                  ;-218     if(istoken('*'))  {istype='*'; m=1;} 
  1972                                  
  1973 00000B27 6A2A                     push 42
  1974 00000B29 E8C338                   call istoken
  1975 00000B2C 83C402                   add  sp, 2
  1976 00000B2F 08C0                     or  al, al
  1977 00000B31 0F840C00                 je .typeName92
  1978 00000B35 B82A00                   mov ax, 42
  1979 00000B38 A2[3200]                 mov byte [istype], al
  1980 00000B3B B80100                   mov ax, 1
  1981 00000B3E 8946FE                   mov [bp-2], ax
  1982                                  
  1983                                  ;-219     if(istoken('&'))  {istype='&'; m=2;}
  1984                                  
  1985                                  .typeName92:
  1986 00000B41 6A26                     push 38
  1987 00000B43 E8A938                   call istoken
  1988 00000B46 83C402                   add  sp, 2
  1989 00000B49 08C0                     or  al, al
  1990 00000B4B 0F840C00                 je .typeName93
  1991 00000B4F B82600                   mov ax, 38
  1992 00000B52 A2[3200]                 mov byte [istype], al
  1993 00000B55 B80200                   mov ax, 2
  1994 00000B58 8946FE                   mov [bp-2], ax
  1995                                  
  1996                                  ;-220     name1(); 
  1997                                  
  1998                                  .typeName93:
  1999 00000B5B E80800                   call name1
  2000                                  
  2001                                  ;-221     return m; 
  2002                                  
  2003 00000B5E 8B46FE                   mov ax, [bp-2]
  2004 00000B61 E90000                   jmp .retn
  2005                                  
  2006                                  ;-222 }
  2007                                  
  2008                                  
  2009                                  ;-223 int name1() {
  2010                                  
  2011 00000B64 C9                       .retn: LEAVE
  2012 00000B65 C3                       ret
  2013                                  ; ENDP
  2014                                  
  2015                                  name1:  ; *** PROC ***
  2016                                  
  2017                                  ;-224     if (token!=T_NAME) error1("Name expected"); 
  2018                                  
  2019 00000B66 A1[1C00]                 mov ax, [token]
  2020 00000B69 3D0001                   cmp ax, 256
  2021 00000B6C 0F840900                 je  .name194
  2022 00000B70 68[800B]                 push name1_0
  2023 00000B73 E8993C                   call error1
  2024 00000B76 83C402                   add  sp, 2
  2025                                  
  2026                                  ;-225     token=getlex(); 
  2027                                  
  2028                                  .name194:
  2029 00000B79 E84F31                   call getlex
  2030 00000B7C A3[1C00]                 mov word [token], ax
  2031                                  
  2032                                  ;-226 }
  2033                                  
  2034                                  
  2035                                  ;-227 
  2036                                  
  2037                                  
  2038                                  ;-228 int storecall() { int i; if (CTop >= CALLMAX) error1("Call table full");
  2039                                  
  2040 00000B7F C3                       ret
  2041                                  ; ENDP
  2042 00000B80 4E616D652065787065-     name1_0 db "Name expected",0
  2043 00000B89 6374656400         
  2044                                  
  2045                                  storecall:  ; *** PROC ***
  2046                                  ;Function : storecall, Number of local variables: 1
  2047                                  ;   # type sign width addr used name   list of local variables
  2048                                  ;  200 var sign word   228 NULL i = bp-2;
  2049 00000B8E C8020000                 ENTER  2,0
  2050 00000B92 A1[3D00]                 mov ax, [CTop]
  2051 00000B95 3DD007                   cmp ax, 2000 ;unsigned : 1
  2052 00000B98 0F8C0900                 jl  .storecall95
  2053 00000B9C 68[000C]                 push storecall_0
  2054 00000B9F E86D3C                   call error1
  2055 00000BA2 83C402                   add  sp, 2
  2056                                  
  2057                                  ;-229   if (CNameTop >= 65468) error1("Call name table fuill");
  2058                                  
  2059                                  .storecall95:
  2060 00000BA5 A1[6000]                 mov ax, [CNameTop]
  2061 00000BA8 3DBCFF                   cmp ax, 65468 ;unsigned : 0
  2062 00000BAB 0F820900                 jb  .storecall96
  2063 00000BAF 68[100C]                 push storecall_1
  2064 00000BB2 E85A3C                   call error1
  2065 00000BB5 83C402                   add  sp, 2
  2066                                  
  2067                                  ;-230     CType[CTop]=0;  CAdr [CTop]=CNameTop; i=strlen(symbol);
  2068                                  
  2069                                  .storecall96:
  2070 00000BB8 B80000                   mov ax, 0
  2071 00000BBB 8B1E[3D00]               mov bx, [CTop]
  2072 00000BBF 88872FA1                 mov [CType+bx], al
  2073 00000BC3 A1[6000]                 mov ax, [CNameTop]
  2074 00000BC6 8B1E[3D00]               mov bx, [CTop]
  2075 00000BCA D1E3                     shl bx, 1
  2076 00000BCC 898757AB                 mov [CAdr+bx], ax
  2077 00000BD0 8D062B81                 lea  ax, [symbol]
  2078 00000BD4 50                       push ax
  2079 00000BD5 E866F5                   call strlen
  2080 00000BD8 83C402                   add  sp, 2
  2081 00000BDB 8946FE                   mov [bp-2], ax
  2082                                  
  2083                                  ;-231     to_far(CNameTop, symbol);
  2084                                  
  2085 00000BDE 8D062B81                 lea  ax, [symbol]
  2086 00000BE2 50                       push ax
  2087 00000BE3 FF36[6000]               push word [CNameTop]
  2088 00000BE7 E87E47                   call to_far
  2089 00000BEA 83C404                   add  sp, 4
  2090                                  
  2091                                  ;-232     CNameTop=CNameTop+i; CNameTop++; CTop++;
  2092                                  
  2093 00000BED A1[6000]                 mov ax, [CNameTop]
  2094 00000BF0 0346FE                   add ax, [bp-2]
  2095 00000BF3 A3[6000]                 mov word [CNameTop], ax
  2096 00000BF6 FF06[6000]               inc  word[CNameTop]
  2097 00000BFA FF06[3D00]               inc  word[CTop]
  2098                                  
  2099                                  ;-233 }
  2100                                  
  2101                                  
  2102                                  ;-234 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
  2103 00000BFE C9                       LEAVE
  2104 00000BFF C3                       ret
  2105                                  ; ENDP
  2106 00000C00 43616C6C207461626C-     storecall_0 db "Call table full",0
  2107 00000C09 652066756C6C00     
  2108 00000C10 43616C6C206E616D65-     storecall_1 db "Call name table fuill",0
  2109 00000C19 207461626C65206675-
  2110 00000C22 696C6C00           
  2111                                  
  2112                                  storefunc:  ; *** PROC ***
  2113 00000C26 A1[3B00]                 mov ax, [FTop]
  2114 00000C29 3D2C01                   cmp ax, 300 ;unsigned : 1
  2115 00000C2C 0F8C0900                 jl  .storefunc97
  2116 00000C30 68[870C]                 push storefunc_0
  2117 00000C33 E8D93B                   call error1
  2118 00000C36 83C402                   add  sp, 2
  2119                                  
  2120                                  ;-235     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;
  2121                                  
  2122                                  .storefunc97:
  2123 00000C39 A1[6600]                 mov ax, [lineno]
  2124 00000C3C 83E801                   sub ax, 1
  2125 00000C3F 8B1E[3B00]               mov bx, [FTop]
  2126 00000C43 D1E3                     shl bx, 1
  2127 00000C45 8987FFA8                 mov [FAdr+bx], ax
  2128 00000C49 B80000                   mov ax, 0
  2129 00000C4C 8B1E[3B00]               mov bx, [FTop]
  2130 00000C50 D1E3                     shl bx, 1
  2131 00000C52 8987F7BA                 mov [FCalls+bx], ax
  2132 00000C56 A0[3800]                 mov al, [iswidth]
  2133 00000C59 8B1E[3B00]               mov bx, [FTop]
  2134 00000C5D 888703A0                 mov [FType+bx], al
  2135                                  
  2136                                  ;-236     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;
  2137                                  
  2138 00000C61 FF36[3B00]               push word [FTop]
  2139 00000C65 8D064FBD                 lea  ax, [FNameField]
  2140 00000C69 50                       push ax
  2141 00000C6A E8DEFC                   call adrF
  2142 00000C6D 83C404                   add  sp, 4
  2143 00000C70 A3[6A00]                 mov word [pt], ax
  2144 00000C73 8D062B81                 lea  ax, [symbol]
  2145 00000C77 50                       push ax
  2146 00000C78 FF36[6A00]               push word [pt]
  2147 00000C7C E8E7F4                   call strcpy
  2148 00000C7F 83C404                   add  sp, 4
  2149 00000C82 FF06[3B00]               inc  word[FTop]
  2150                                  
  2151                                  ;-237 }
  2152                                  
  2153                                  
  2154                                  ;-238 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");
  2155                                  
  2156 00000C86 C3                       ret
  2157                                  ; ENDP
  2158 00000C87 46756E6374696F6E20-     storefunc_0 db "Function table full",0
  2159 00000C90 7461626C652066756C-
  2160 00000C99 6C00               
  2161                                  
  2162                                  addlocal:  ; *** PROC ***
  2163 00000C9B A1[2C00]                 mov ax, [LTop]
  2164 00000C9E 3D2C01                   cmp ax, 300 ;unsigned : 1
  2165 00000CA1 0F8C0900                 jl  .addlocal98
  2166 00000CA5 68[210D]                 push addlocal_0
  2167 00000CA8 E8643B                   call error1
  2168 00000CAB 83C402                   add  sp, 2
  2169                                  
  2170                                  ;-239   if (checkName() != 0) error1("Variable already defined");
  2171                                  
  2172                                  .addlocal98:
  2173 00000CAE E858FD                   call checkName
  2174 00000CB1 83F800                   cmp ax, 0
  2175 00000CB4 0F840900                 je  .addlocal99
  2176 00000CB8 68[3B0D]                 push addlocal_1
  2177 00000CBB E8513B                   call error1
  2178 00000CBE 83C402                   add  sp, 2
  2179                                  
  2180                                  ;-240   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;
  2181                                  
  2182                                  .addlocal99:
  2183 00000CC1 A0[3500]                 mov al, [issign]
  2184 00000CC4 8B1E[2C00]               mov bx, [LTop]
  2185 00000CC8 8887E383                 mov [GSign+bx], al
  2186 00000CCC A0[3800]                 mov al, [iswidth]
  2187 00000CCF 8B1E[2C00]               mov bx, [LTop]
  2188 00000CD3 88870F85                 mov [GWidth+bx], al
  2189 00000CD7 A0[3200]                 mov al, [istype]
  2190 00000CDA 8B1E[2C00]               mov bx, [LTop]
  2191 00000CDE 8887B782                 mov [GType+bx], al
  2192                                  
  2193                                  ;-241   GAdr [LTop]=lineno-1; GUsed[LTop]=0;
  2194                                  
  2195 00000CE2 A1[6600]                 mov ax, [lineno]
  2196 00000CE5 83E801                   sub ax, 1
  2197 00000CE8 8B1E[2C00]               mov bx, [LTop]
  2198 00000CEC D1E3                     shl bx, 1
  2199 00000CEE 89873B86                 mov [GAdr+bx], ax
  2200 00000CF2 B80000                   mov ax, 0
  2201 00000CF5 8B1E[2C00]               mov bx, [LTop]
  2202 00000CF9 D1E3                     shl bx, 1
  2203 00000CFB 89879388                 mov [GUsed+bx], ax
  2204                                  
  2205                                  ;-242   pt=adrF(GNameField, LTop); strcpy(pt, symbol);
  2206                                  
  2207 00000CFF FF36[2C00]               push word [LTop]
  2208 00000D03 8D06438D                 lea  ax, [GNameField]
  2209 00000D07 50                       push ax
  2210 00000D08 E840FC                   call adrF
  2211 00000D0B 83C404                   add  sp, 4
  2212 00000D0E A3[6A00]                 mov word [pt], ax
  2213 00000D11 8D062B81                 lea  ax, [symbol]
  2214 00000D15 50                       push ax
  2215 00000D16 FF36[6A00]               push word [pt]
  2216 00000D1A E849F4                   call strcpy
  2217 00000D1D 83C404                   add  sp, 4
  2218                                  
  2219                                  ;-243 }
  2220                                  
  2221                                  
  2222                                  ;-244 int checkFunction() { unsigned int i; unsigned int j; i=0;
  2223                                  
  2224 00000D20 C3                       ret
  2225                                  ; ENDP
  2226 00000D21 4C6F63616C20766172-     addlocal_0 db "Local variable table full",0
  2227 00000D2A 6961626C6520746162-
  2228 00000D33 6C652066756C6C00   
  2229 00000D3B 5661726961626C6520-     addlocal_1 db "Variable already defined",0
  2230 00000D44 616C72656164792064-
  2231 00000D4D 6566696E656400     
  2232                                  
  2233                                  checkFunction:  ; *** PROC ***
  2234                                  ;Function : checkFunction, Number of local variables: 2
  2235                                  ;   # type sign width addr used name   list of local variables
  2236                                  ;  200 var unsg word   244 NULL i = bp-2
  2237                                  ;  201 var unsg word   244 NULL j = bp-4;
  2238 00000D54 C8040000                 ENTER  4,0
  2239 00000D58 B80000                   mov ax, 0
  2240 00000D5B 8946FE                   mov [bp-2], ax
  2241                                  
  2242                                  ;-245   while (i < FTop) { j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}
  2243                                  
  2244                                  .checkFunction100:
  2245 00000D5E 8B46FE                   mov ax, [bp-2]
  2246 00000D61 3B06[3B00]               cmp ax, [FTop]
  2247 00000D65 0F8D3000                 jge .checkFunction101
  2248 00000D69 FF76FE                   push word [bp-2]
  2249 00000D6C 8D064FBD                 lea  ax, [FNameField]
  2250 00000D70 50                       push ax
  2251 00000D71 E8D7FB                   call adrF
  2252 00000D74 83C404                   add  sp, 4
  2253 00000D77 8946FC                   mov [bp-4], ax
  2254 00000D7A FF76FC                   push word [bp-4]
  2255 00000D7D 8D062B81                 lea  ax, [symbol]
  2256 00000D81 50                       push ax
  2257 00000D82 E811F4                   call eqstr
  2258 00000D85 83C404                   add  sp, 4
  2259 00000D88 08C0                     or  al, al
  2260 00000D8A 0F840600                 je .checkFunction102
  2261 00000D8E 8B46FE                   mov ax, [bp-2]
  2262 00000D91 E90B00                   jmp .retn
  2263                                  .checkFunction102:
  2264 00000D94 FF46FE                   inc  word[bp-2]
  2265                                  
  2266                                  ;-246   return 0; }
  2267                                  
  2268 00000D97 EBC5                     jmp .checkFunction100
  2269                                  .checkFunction101:
  2270 00000D99 B80000                   mov ax, 0
  2271 00000D9C E90000                   jmp .retn
  2272                                  
  2273                                  ;-247 int dofunc() { int nloc; int i; int narg;  
  2274                                  
  2275 00000D9F C9                       .retn: LEAVE
  2276 00000DA0 C3                       ret
  2277                                  ; ENDP
  2278                                  
  2279                                  dofunc:  ; *** PROC ***
  2280                                  
  2281                                  ;-248   cloc=&co; 
  2282                                  
  2283                                  ;Function : dofunc, Number of local variables: 3
  2284                                  ;   # type sign width addr used name   list of local variables
  2285                                  ;  200 var sign word   247 NULL nloc = bp-2
  2286                                  ;  201 var sign word   247 NULL i = bp-4
  2287                                  ;  202 var sign word   247 NULL narg = bp-6;
  2288 00000DA1 C8060000                 ENTER  6,0
  2289 00000DA5 B83075                   mov ax, co
  2290 00000DA8 A3[1600]                 mov word [cloc], ax
  2291                                  
  2292                                  ;-249   checknamelen();
  2293                                  
  2294 00000DAB E857F6                   call checknamelen
  2295                                  
  2296                                  ;-250   strcpy(fname, symbol);
  2297                                  
  2298 00000DAE 8D062B81                 lea  ax, [symbol]
  2299 00000DB2 50                       push ax
  2300 00000DB3 8D06AB81                 lea  ax, [fname]
  2301 00000DB7 50                       push ax
  2302 00000DB8 E8ABF3                   call strcpy
  2303 00000DBB 83C404                   add  sp, 4
  2304                                  
  2305                                  ;-251   if (checkFunction() ) error1("Function already defined");
  2306                                  
  2307 00000DBE E893FF                   call checkFunction
  2308 00000DC1 08C0                     or  al, al
  2309 00000DC3 0F840900                 je .dofunc103
  2310 00000DC7 68[D80F]                 push dofunc_0
  2311 00000DCA E8423A                   call error1
  2312 00000DCD 83C402                   add  sp, 2
  2313                                  
  2314                                  ;-252   storefunc();
  2315                                  
  2316                                  .dofunc103:
  2317 00000DD0 E853FE                   call storefunc
  2318                                  
  2319                                  ;-253   prs("\n\n"); prs(symbol); prs(":  ; *** PROC ***");
  2320                                  
  2321 00000DD3 68[F10F]                 push dofunc_1
  2322 00000DD6 E84B37                   call prs
  2323 00000DD9 83C402                   add  sp, 2
  2324 00000DDC 8D062B81                 lea  ax, [symbol]
  2325 00000DE0 50                       push ax
  2326 00000DE1 E84037                   call prs
  2327 00000DE4 83C402                   add  sp, 2
  2328 00000DE7 68[F60F]                 push dofunc_2
  2329 00000DEA E83737                   call prs
  2330 00000DED 83C402                   add  sp, 2
  2331                                  
  2332                                  ;-254   expect('('); LTop=LSTART;  i=0;
  2333                                  
  2334 00000DF0 6A28                     push 40
  2335 00000DF2 E81C36                   call expect
  2336 00000DF5 83C402                   add  sp, 2
  2337 00000DF8 B8C800                   mov ax, 200
  2338 00000DFB A3[2C00]                 mov word [LTop], ax
  2339 00000DFE B80000                   mov ax, 0
  2340 00000E01 8946FC                   mov [bp-4], ax
  2341                                  
  2342                                  ;-255   if (istoken(')')==0) { narg=2; 
  2343                                  
  2344 00000E04 6A29                     push 41
  2345 00000E06 E8E635                   call istoken
  2346 00000E09 83C402                   add  sp, 2
  2347 00000E0C 83F800                   cmp ax, 0
  2348 00000E0F 0F854600                 jne .dofunc104
  2349 00000E13 B80200                   mov ax, 2
  2350 00000E16 8946FA                   mov [bp-6], ax
  2351                                  
  2352                                  ;-256     do { typeName();  addlocal(); narg+=2;
  2353                                  
  2354                                  .dofunc105:
  2355 00000E19 E871FC                   call typeName
  2356 00000E1C E87CFE                   call addlocal
  2357 00000E1F 8346FA02                 add  word[bp-6], 2
  2358                                  
  2359                                  ;-257          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }
  2360                                  
  2361 00000E23 8B46FA                   mov ax, [bp-6]
  2362 00000E26 8B1E[2C00]               mov bx, [LTop]
  2363 00000E2A D1E3                     shl bx, 1
  2364 00000E2C 8987EB8A                 mov [GData+bx], ax
  2365 00000E30 A0[3800]                 mov al, [iswidth]
  2366 00000E33 3C04                     cmp al, 4
  2367 00000E35 0F850400                 jne .dofunc106
  2368 00000E39 8346FA02                 add  word[bp-6], 2
  2369                                  .dofunc106:
  2370 00000E3D FF06[2C00]               inc  word[LTop]
  2371                                  
  2372                                  ;-258     while (istoken(','));  expect(')'); }
  2373                                  
  2374 00000E41 6A2C                     push 44
  2375 00000E43 E8A935                   call istoken
  2376 00000E46 83C402                   add  sp, 2
  2377 00000E49 08C0                     or  al, al
  2378 00000E4B 0F840200                 je .dofunc107
  2379 00000E4F EBC8                     jmp .dofunc105
  2380                                  .dofunc107:
  2381 00000E51 6A29                     push 41
  2382 00000E53 E8BB35                   call expect
  2383 00000E56 83C402                   add  sp, 2
  2384                                  
  2385                                  ;-259     
  2386                                  
  2387                                  
  2388                                  ;-260   expect('{'); /*body*/
  2389                                  
  2390                                  .dofunc104:
  2391 00000E59 6A7B                     push 123
  2392 00000E5B E8B335                   call expect
  2393 00000E5E 83C402                   add  sp, 2
  2394                                  
  2395                                  ;-261   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */
  2396                                  
  2397 00000E61 B80000                   mov ax, 0
  2398 00000E64 8946FE                   mov [bp-2], ax
  2399 00000E67 B80000                   mov ax, 0
  2400 00000E6A A3[2600]                 mov word [nreturn], ax
  2401 00000E6D B80000                   mov ax, 0
  2402 00000E70 A3[2400]                 mov word [nconst], ax
  2403 00000E73 B80000                   mov ax, 0
  2404 00000E76 8946FC                   mov [bp-4], ax
  2405                                  
  2406                                  ;-262   while(isvariable()) {
  2407                                  
  2408                                  .dofunc108:
  2409 00000E79 E8BC01                   call isvariable
  2410 00000E7C 08C0                     or  al, al
  2411 00000E7E 0F849200                 je .dofunc109
  2412                                  
  2413                                  ;-263     do {typeName();
  2414                                  
  2415                                  .dofunc110:
  2416 00000E82 E808FC                   call typeName
  2417                                  
  2418                                  ;-264         checknamelen();
  2419                                  
  2420 00000E85 E87DF5                   call checknamelen
  2421                                  
  2422                                  ;-265         addlocal(); nloc-=2;
  2423                                  
  2424 00000E88 E810FE                   call addlocal
  2425 00000E8B 836EFE02                 sub  word[bp-2], 2
  2426                                  
  2427                                  ;-266         if (iswidth == 4) nloc-=2;
  2428                                  
  2429 00000E8F A0[3800]                 mov al, [iswidth]
  2430 00000E92 3C04                     cmp al, 4
  2431 00000E94 0F850400                 jne .dofunc111
  2432 00000E98 836EFE02                 sub  word[bp-2], 2
  2433                                  
  2434                                  ;-267         GData[LTop]=nloc;
  2435                                  
  2436                                  .dofunc111:
  2437 00000E9C 8B46FE                   mov ax, [bp-2]
  2438 00000E9F 8B1E[2C00]               mov bx, [LTop]
  2439 00000EA3 D1E3                     shl bx, 1
  2440 00000EA5 8987EB8A                 mov [GData+bx], ax
  2441                                  
  2442                                  ;-268         if (istoken('[')){istype='&';GType[LTop]='&';expect(T_CONST);expect(']');
  2443                                  
  2444 00000EA9 6A5B                     push 91
  2445 00000EAB E84135                   call istoken
  2446 00000EAE 83C402                   add  sp, 2
  2447 00000EB1 08C0                     or  al, al
  2448 00000EB3 0F843D00                 je .dofunc112
  2449 00000EB7 B82600                   mov ax, 38
  2450 00000EBA A2[3200]                 mov byte [istype], al
  2451 00000EBD B82600                   mov ax, 38
  2452 00000EC0 8B1E[2C00]               mov bx, [LTop]
  2453 00000EC4 8887B782                 mov [GType+bx], al
  2454 00000EC8 680101                   push 257
  2455 00000ECB E84335                   call expect
  2456 00000ECE 83C402                   add  sp, 2
  2457 00000ED1 6A5D                     push 93
  2458 00000ED3 E83B35                   call expect
  2459 00000ED6 83C402                   add  sp, 2
  2460                                  
  2461                                  ;-269             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc; }
  2462                                  
  2463 00000ED9 8B46FE                   mov ax, [bp-2]
  2464 00000EDC 2B06[2E00]               sub ax, [lexval]
  2465 00000EE0 8946FE                   mov [bp-2], ax
  2466 00000EE3 8346FE02                 add  word[bp-2], 2
  2467 00000EE7 8B46FE                   mov ax, [bp-2]
  2468 00000EEA 8B1E[2C00]               mov bx, [LTop]
  2469 00000EEE D1E3                     shl bx, 1
  2470 00000EF0 8987EB8A                 mov [GData+bx], ax
  2471                                  
  2472                                  ;-270         LTop++;
  2473                                  
  2474                                  .dofunc112:
  2475 00000EF4 FF06[2C00]               inc  word[LTop]
  2476                                  
  2477                                  ;-271       } while (istoken(',')); expect(';'); }
  2478                                  
  2479 00000EF8 6A2C                     push 44
  2480 00000EFA E8F234                   call istoken
  2481 00000EFD 83C402                   add  sp, 2
  2482 00000F00 08C0                     or  al, al
  2483 00000F02 0F840300                 je .dofunc113
  2484 00000F06 E979FF                   jmp .dofunc110
  2485                                  .dofunc113:
  2486 00000F09 6A3B                     push 59
  2487 00000F0B E80335                   call expect
  2488 00000F0E 83C402                   add  sp, 2
  2489                                  
  2490                                  ;-272   listproc(); 
  2491                                  
  2492 00000F11 E965FF                   jmp .dofunc108
  2493                                  .dofunc109:
  2494 00000F14 E8FA39                   call listproc
  2495                                  
  2496                                  ;-273   if (LTop>LSTART){prs(";\n ENTER  "); 
  2497                                  
  2498 00000F17 A1[2C00]                 mov ax, [LTop]
  2499 00000F1A 3DC800                   cmp ax, 200
  2500 00000F1D 0F8E2700                 jle .dofunc114
  2501 00000F21 68[0810]                 push dofunc_3
  2502 00000F24 E8FD35                   call prs
  2503 00000F27 83C402                   add  sp, 2
  2504                                  
  2505                                  ;-274     nloc=mkneg(nloc); pint1 (nloc); prs(",0"); }
  2506                                  
  2507 00000F2A FF76FE                   push word [bp-2]
  2508 00000F2D E892F1                   call mkneg
  2509 00000F30 83C402                   add  sp, 2
  2510 00000F33 8946FE                   mov [bp-2], ax
  2511 00000F36 FF76FE                   push word [bp-2]
  2512 00000F39 E8DF36                   call pint1
  2513 00000F3C 83C402                   add  sp, 2
  2514 00000F3F 68[1410]                 push dofunc_4
  2515 00000F42 E8DF35                   call prs
  2516 00000F45 83C402                   add  sp, 2
  2517                                  
  2518                                  ;-275   while(istoken('}')==0)   stmt();
  2519                                  
  2520                                  .dofunc114:
  2521                                  .dofunc115:
  2522 00000F48 6A7D                     push 125
  2523 00000F4A E8A234                   call istoken
  2524 00000F4D 83C402                   add  sp, 2
  2525 00000F50 83F800                   cmp ax, 0
  2526 00000F53 0F850500                 jne .dofunc116
  2527 00000F57 E81028                   call stmt
  2528                                  
  2529                                  ;-276   if (nreturn) { prs("\n .retn:");}
  2530                                  
  2531 00000F5A EBEC                     jmp .dofunc115
  2532                                  .dofunc116:
  2533 00000F5C A1[2600]                 mov ax, [nreturn]
  2534 00000F5F 08C0                     or  al, al
  2535 00000F61 0F840900                 je .dofunc117
  2536 00000F65 68[1710]                 push dofunc_5
  2537 00000F68 E8B935                   call prs
  2538 00000F6B 83C402                   add  sp, 2
  2539                                  
  2540                                  ;-277   if (LTop > LSTART) prs(" LEAVE");
  2541                                  
  2542                                  .dofunc117:
  2543 00000F6E A1[2C00]                 mov ax, [LTop]
  2544 00000F71 3DC800                   cmp ax, 200
  2545 00000F74 0F8E0900                 jle .dofunc118
  2546 00000F78 68[2110]                 push dofunc_6
  2547 00000F7B E8A635                   call prs
  2548 00000F7E 83C402                   add  sp, 2
  2549                                  
  2550                                  ;-278   prs("\n ret"); prs("\n; ENDP"); 
  2551                                  
  2552                                  .dofunc118:
  2553 00000F81 68[2810]                 push dofunc_7
  2554 00000F84 E89D35                   call prs
  2555 00000F87 83C402                   add  sp, 2
  2556 00000F8A 68[2F10]                 push dofunc_8
  2557 00000F8D E89435                   call prs
  2558 00000F90 83C402                   add  sp, 2
  2559                                  
  2560                                  ;-279   *cloc=0; prs(co); maxco1=strlen(co);
  2561                                  
  2562 00000F93 B80000                   mov ax, 0
  2563 00000F96 8B1E[1600]               mov  bx, [cloc]
  2564 00000F9A 8807                     mov  [bx], al
  2565 00000F9C 8D063075                 lea  ax, [co]
  2566 00000FA0 50                       push ax
  2567 00000FA1 E88035                   call prs
  2568 00000FA4 83C402                   add  sp, 2
  2569 00000FA7 8D063075                 lea  ax, [co]
  2570 00000FAB 50                       push ax
  2571 00000FAC E88FF1                   call strlen
  2572 00000FAF 83C402                   add  sp, 2
  2573 00000FB2 A3[1400]                 mov word [maxco1], ax
  2574                                  
  2575                                  ;-280   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }
  2576                                  
  2577 00000FB5 A1[1400]                 mov ax, [maxco1]
  2578 00000FB8 3B06[1200]               cmp ax, [maxco]
  2579 00000FBC 0F8E1600                 jle .dofunc119
  2580 00000FC0 A1[1400]                 mov ax, [maxco1]
  2581 00000FC3 A3[1200]                 mov word [maxco], ax
  2582 00000FC6 8D06AB81                 lea  ax, [fname]
  2583 00000FCA 50                       push ax
  2584 00000FCB 8D06E880                 lea  ax, [coname]
  2585 00000FCF 50                       push ax
  2586 00000FD0 E893F1                   call strcpy
  2587 00000FD3 83C404                   add  sp, 4
  2588                                  
  2589                                  ;-281 }
  2590                                  
  2591                                  .dofunc119:
  2592                                  
  2593                                  ;-282 int isvariable() {
  2594 00000FD6 C9                       LEAVE
  2595 00000FD7 C3                       ret
  2596                                  ; ENDP
  2597 00000FD8 46756E6374696F6E20-     dofunc_0 db "Function already defined",0
  2598 00000FE1 616C72656164792064-
  2599 00000FEA 6566696E656400     
  2600 00000FF1 5C6E5C6E00              dofunc_1 db "\n\n",0
  2601 00000FF6 3A20203B202A2A2A20-     dofunc_2 db ":  ; *** PROC ***",0
  2602 00000FFF 50524F43202A2A2A00 
  2603 00001008 3B5C6E20454E544552-     dofunc_3 db ";\n ENTER  ",0
  2604 00001011 202000             
  2605 00001014 2C3000                  dofunc_4 db ",0",0
  2606 00001017 5C6E202E7265746E3A-     dofunc_5 db "\n .retn:",0
  2607 00001020 00                 
  2608 00001021 204C4541564500          dofunc_6 db " LEAVE",0
  2609 00001028 5C6E2072657400          dofunc_7 db "\n ret",0
  2610 0000102F 5C6E3B20454E445000      dofunc_8 db "\n; ENDP",0
  2611                                  
  2612                                  isvariable:  ; *** PROC ***
  2613                                  
  2614                                  ;-283     if(token==T_SIGNED)   goto v1;   
  2615                                  
  2616 00001038 A1[1C00]                 mov ax, [token]
  2617 0000103B 3D1302                   cmp ax, 531
  2618 0000103E 0F850300                 jne .isvariable120
  2619 00001042 E93A00                   jmp .v1
  2620                                  
  2621                                  ;-284     if(token==T_UNSIGNED) goto v1;
  2622                                  
  2623                                  .isvariable120:
  2624 00001045 A1[1C00]                 mov ax, [token]
  2625 00001048 3D1402                   cmp ax, 532
  2626 0000104B 0F850300                 jne .isvariable121
  2627 0000104F E92D00                   jmp .v1
  2628                                  
  2629                                  ;-285     if(token==T_CHAR)     goto v1;   
  2630                                  
  2631                                  .isvariable121:
  2632 00001052 A1[1C00]                 mov ax, [token]
  2633 00001055 3D1202                   cmp ax, 530
  2634 00001058 0F850300                 jne .isvariable122
  2635 0000105C E92000                   jmp .v1
  2636                                  
  2637                                  ;-286     if(token==T_INT)      goto v1;
  2638                                  
  2639                                  .isvariable122:
  2640 0000105F A1[1C00]                 mov ax, [token]
  2641 00001062 3D0502                   cmp ax, 517
  2642 00001065 0F850300                 jne .isvariable123
  2643 00001069 E91300                   jmp .v1
  2644                                  
  2645                                  ;-287     if(token==T_LONG)     goto v1;
  2646                                  
  2647                                  .isvariable123:
  2648 0000106C A1[1C00]                 mov ax, [token]
  2649 0000106F 3D1502                   cmp ax, 533
  2650 00001072 0F850300                 jne .isvariable124
  2651 00001076 E90600                   jmp .v1
  2652                                  
  2653                                  ;-288     return 0;  
  2654                                  
  2655                                  .isvariable124:
  2656 00001079 B80000                   mov ax, 0
  2657 0000107C E90600                   jmp .retn
  2658                                  
  2659                                  ;-289 v1: return 1;
  2660                                  
  2661                                  .v1:
  2662 0000107F B80100                   mov ax, 1
  2663 00001082 E90000                   jmp .retn
  2664                                  
  2665                                  ;-290 }
  2666                                  
  2667                                  
  2668                                  ;-291                   
  2669                                  
  2670                                  
  2671                                  ;-292 int mod1; int ireg1; int idx1; int ids1; int idw1; int idt1; int val1;
  2672                                  
  2673                                   .retn:
  2674 00001085 C3                       ret
  2675                                  ; ENDP
  2676 00001086 0000                    mod1 dw 0
  2677 00001088 0000                    ireg1 dw 0
  2678 0000108A 0000                    idx1 dw 0
  2679 0000108C 0000                    ids1 dw 0
  2680 0000108E 0000                    idw1 dw 0
  2681 00001090 0000                    idt1 dw 0
  2682 00001092 0000                    val1 dw 0
  2683                                  
  2684                                  ;-293 int mod2; int ireg2; int idx2; int ids2; int idw2; int idt2; int val2;
  2685                                  
  2686 00001094 0000                    mod2 dw 0
  2687 00001096 0000                    ireg2 dw 0
  2688 00001098 0000                    idx2 dw 0
  2689 0000109A 0000                    ids2 dw 0
  2690 0000109C 0000                    idw2 dw 0
  2691 0000109E 0000                    idt2 dw 0
  2692 000010A0 0000                    val2 dw 0
  2693                                  
  2694                                  ;-294 
  2695                                  
  2696                                  
  2697                                  ;-295 int pexpr() {expect('('); iscmp=0; 
  2698                                  
  2699                                  
  2700                                  pexpr:  ; *** PROC ***
  2701 000010A2 6A28                     push 40
  2702 000010A4 E86A33                   call expect
  2703 000010A7 83C402                   add  sp, 2
  2704 000010AA B80000                   mov ax, 0
  2705 000010AD A3[2200]                 mov word [iscmp], ax
  2706                                  
  2707                                  ;-296   if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}
  2708                                  
  2709 000010B0 A1[1C00]                 mov ax, [token]
  2710 000010B3 3D0001                   cmp ax, 256
  2711 000010B6 0F853400                 jne .pexpr125
  2712 000010BA 68[1811]                 push pexpr_0
  2713 000010BD 8D062B81                 lea  ax, [symbol]
  2714 000010C1 50                       push ax
  2715 000010C2 E8D1F0                   call eqstr
  2716 000010C5 83C404                   add  sp, 4
  2717 000010C8 08C0                     or  al, al
  2718 000010CA 0F840600                 je .pexpr126
  2719 000010CE E85E00                   call constantexpr
  2720 000010D1 E94300                   jmp .retn
  2721                                  
  2722                                  ;-297     ireg1=checkreg();
  2723                                  
  2724                                  .pexpr126:
  2725 000010D4 E89A07                   call checkreg
  2726 000010D7 A3[8810]                 mov word [ireg1], ax
  2727                                  
  2728                                  ;-298     if (ireg1) { doreg1(1); return; }  }
  2729                                  
  2730 000010DA A1[8810]                 mov ax, [ireg1]
  2731 000010DD 08C0                     or  al, al
  2732 000010DF 0F840B00                 je .pexpr127
  2733 000010E3 6A01                     push 1
  2734 000010E5 E89D05                   call doreg1
  2735 000010E8 83C402                   add  sp, 2
  2736 000010EB E92900                   jmp .retn
  2737                                  .pexpr127:
  2738                                  
  2739                                  ;-299   exprstart(); if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);
  2740                                  
  2741                                  .pexpr125:
  2742 000010EE E83D01                   call exprstart
  2743 000010F1 A1[2200]                 mov ax, [iscmp]
  2744 000010F4 83F800                   cmp ax, 0
  2745 000010F7 0F850900                 jne .pexpr128
  2746 000010FB 68[1A11]                 push pexpr_1
  2747 000010FE E82334                   call prs
  2748 00001101 83C402                   add  sp, 2
  2749                                  .pexpr128:
  2750 00001104 8D06AB81                 lea  ax, [fname]
  2751 00001108 50                       push ax
  2752 00001109 E81834                   call prs
  2753 0000110C 83C402                   add  sp, 2
  2754                                  
  2755                                  ;-300   expect(')'); }           /*error1("Vergleich fehlt");*/
  2756                                  
  2757 0000110F 6A29                     push 41
  2758 00001111 E8FD32                   call expect
  2759 00001114 83C402                   add  sp, 2
  2760                                  
  2761                                  ;-301 
  2762                                  
  2763                                  
  2764                                  ;-302 int constantexpr() { int mode; int id1;int ids;
  2765                                  
  2766                                   .retn:
  2767 00001117 C3                       ret
  2768                                  ; ENDP
  2769 00001118 5F00                    pexpr_0 db "_",0
  2770 0000111A 5C6E206F722020616C-     pexpr_1 db "\n or  al, al\n je .",0
  2771 00001123 2C20616C5C6E206A65-
  2772 0000112C 202E00             
  2773                                  
  2774                                  constantexpr:  ; *** PROC ***
  2775                                  
  2776                                  ;-303   token=getlex();   mode=typeName();  
  2777                                  
  2778                                  ;Function : constantexpr, Number of local variables: 3
  2779                                  ;   # type sign width addr used name   list of local variables
  2780                                  ;  200 var sign word   302 NULL mode = bp-2
  2781                                  ;  201 var sign word   302 NULL id1 = bp-4
  2782                                  ;  202 var sign word   302 NULL ids = bp-6;
  2783 0000112F C8060000                 ENTER  6,0
  2784 00001133 E8952B                   call getlex
  2785 00001136 A3[1C00]                 mov word [token], ax
  2786 00001139 E851F9                   call typeName
  2787 0000113C 8946FE                   mov [bp-2], ax
  2788                                  
  2789                                  ;-304   id1=searchname(); gettypes(id1); ids=signi;
  2790                                  
  2791 0000113F E87CF8                   call searchname
  2792 00001142 8946FC                   mov [bp-4], ax
  2793 00001145 FF76FC                   push word [bp-4]
  2794 00001148 E835F7                   call gettypes
  2795 0000114B 83C402                   add  sp, 2
  2796 0000114E A1[3300]                 mov ax, [signi]
  2797 00001151 8946FA                   mov [bp-6], ax
  2798                                  
  2799                                  ;-305   if (isrelational() ==0) error1("Relational expression expected");
  2800                                  
  2801 00001154 E80D2B                   call isrelational
  2802 00001157 83F800                   cmp ax, 0
  2803 0000115A 0F850900                 jne .constantexpr129
  2804 0000115E 68[E411]                 push constantexpr_0
  2805 00001161 E8AB36                   call error1
  2806 00001164 83C402                   add  sp, 2
  2807                                  
  2808                                  ;-306   expect(T_CONST);  prs(" ; constant expression");
  2809                                  
  2810                                  .constantexpr129:
  2811 00001167 680101                   push 257
  2812 0000116A E8A432                   call expect
  2813 0000116D 83C402                   add  sp, 2
  2814 00001170 68[0312]                 push constantexpr_1
  2815 00001173 E8AE33                   call prs
  2816 00001176 83C402                   add  sp, 2
  2817                                  
  2818                                  ;-307   prs("\ncmp "); 
  2819                                  
  2820 00001179 68[1A12]                 push constantexpr_2
  2821 0000117C E8A533                   call prs
  2822 0000117F 83C402                   add  sp, 2
  2823                                  
  2824                                  ;-308   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  2825                                  
  2826 00001182 FF76FC                   push word [bp-4]
  2827 00001185 E8F8F6                   call gettypes
  2828 00001188 83C402                   add  sp, 2
  2829 0000118B A1[3900]                 mov ax, [wi]
  2830 0000118E 83F802                   cmp ax, 2
  2831 00001191 0F850C00                 jne .constantexpr130
  2832 00001195 68[2112]                 push constantexpr_3
  2833 00001198 E88933                   call prs
  2834 0000119B 83C402                   add  sp, 2
  2835 0000119E E90900                   jmp .constantexpr131
  2836                                  .constantexpr130:
  2837 000011A1 68[2612]                 push constantexpr_4
  2838 000011A4 E87D33                   call prs
  2839 000011A7 83C402                   add  sp, 2
  2840                                  
  2841                                  ;-309   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);
  2842                                  
  2843                                  .constantexpr131:
  2844 000011AA FF76FC                   push word [bp-4]
  2845 000011AD E822F2                   call v
  2846 000011B0 83C402                   add  sp, 2
  2847 000011B3 68[2B12]                 push constantexpr_5
  2848 000011B6 E86B33                   call prs
  2849 000011B9 83C402                   add  sp, 2
  2850 000011BC FF36[2E00]               push word [lexval]
  2851 000011C0 E8BB34                   call prunsign1
  2852 000011C3 83C402                   add  sp, 2
  2853 000011C6 FF76FA                   push word [bp-6]
  2854 000011C9 E8E527                   call cmpneg
  2855 000011CC 83C402                   add  sp, 2
  2856 000011CF 8D06AB81                 lea  ax, [fname]
  2857 000011D3 50                       push ax
  2858 000011D4 E84D33                   call prs
  2859 000011D7 83C402                   add  sp, 2
  2860                                  
  2861                                  ;-310   expect(')');
  2862                                  
  2863 000011DA 6A29                     push 41
  2864 000011DC E83232                   call expect
  2865 000011DF 83C402                   add  sp, 2
  2866                                  
  2867                                  ;-311 }  
  2868                                  
  2869                                  
  2870                                  ;-312 int exprstart() { if (eqstr(symbol, "_")) expr2(0); else expr(0); }
  2871 000011E2 C9                       LEAVE
  2872 000011E3 C3                       ret
  2873                                  ; ENDP
  2874 000011E4 52656C6174696F6E61-     constantexpr_0 db "Relational expression expected",0
  2875 000011ED 6C2065787072657373-
  2876 000011F6 696F6E206578706563-
  2877 000011FF 74656400           
  2878 00001203 203B20636F6E737461-     constantexpr_1 db " ; constant expression",0
  2879 0000120C 6E7420657870726573-
  2880 00001215 73696F6E00         
  2881 0000121A 5C6E636D702000          constantexpr_2 db "\ncmp ",0
  2882 00001221 776F726400              constantexpr_3 db "word",0
  2883 00001226 6279746500              constantexpr_4 db "byte",0
  2884 0000122B 2C2000                  constantexpr_5 db ", ",0
  2885                                  
  2886                                  exprstart:  ; *** PROC ***
  2887 0000122E 68[5612]                 push exprstart_0
  2888 00001231 8D062B81                 lea  ax, [symbol]
  2889 00001235 50                       push ax
  2890 00001236 E85DEF                   call eqstr
  2891 00001239 83C404                   add  sp, 4
  2892 0000123C 08C0                     or  al, al
  2893 0000123E 0F840B00                 je .exprstart132
  2894 00001242 6A00                     push 0
  2895 00001244 E81100                   call expr2
  2896 00001247 83C402                   add  sp, 2
  2897 0000124A E90800                   jmp .exprstart133
  2898                                  .exprstart132:
  2899 0000124D 6A00                     push 0
  2900 0000124F E89E0A                   call expr
  2901 00001252 83C402                   add  sp, 2
  2902                                  .exprstart133:
  2903                                  
  2904                                  ;-313 
  2905                                  
  2906                                  
  2907                                  ;-314 int expr2(int kind) {  int i;
  2908                                  
  2909 00001255 C3                       ret
  2910                                  ; ENDP
  2911 00001256 5F00                    exprstart_0 db "_",0
  2912                                  
  2913                                  expr2:  ; *** PROC ***
  2914                                  
  2915                                  ;-315   if(kind != 1) token=getlex();
  2916                                  
  2917                                  ;Function : expr2, Number of local variables: 2
  2918                                  ;   # type sign width addr used name   list of local variables
  2919                                  ;  200 var sign word   314 NULL kind = bp+4
  2920                                  ;  201 var sign word   314 NULL i = bp-2;
  2921 00001258 C8020000                 ENTER  2,0
  2922 0000125C 8B4604                   mov ax, [bp+4]
  2923 0000125F 83F801                   cmp ax, 1
  2924 00001262 0F840600                 je  .expr2134
  2925 00001266 E8622A                   call getlex
  2926 00001269 A3[1C00]                 mov word [token], ax
  2927                                  
  2928                                  ;-316   mod1=typeName();
  2929                                  
  2930                                  .expr2134:
  2931 0000126C E81EF8                   call typeName
  2932 0000126F A3[8610]                 mov word [mod1], ax
  2933                                  
  2934                                  ;-317   if (mod1) error1("Noch kein & und * im Text (Linke Hand) erlaubt");
  2935                                  
  2936 00001272 A1[8610]                 mov ax, [mod1]
  2937 00001275 08C0                     or  al, al
  2938 00001277 0F840900                 je .expr2135
  2939 0000127B 68[1015]                 push expr2_0
  2940 0000127E E88E35                   call error1
  2941 00001281 83C402                   add  sp, 2
  2942                                  
  2943                                  ;-318   ireg1=checkreg();
  2944                                  
  2945                                  .expr2135:
  2946 00001284 E8EA05                   call checkreg
  2947 00001287 A3[8810]                 mov word [ireg1], ax
  2948                                  
  2949                                  ;-319   if (ireg1) { doreg1(0); return; }
  2950                                  
  2951 0000128A A1[8810]                 mov ax, [ireg1]
  2952 0000128D 08C0                     or  al, al
  2953 0000128F 0F840B00                 je .expr2136
  2954 00001293 6A00                     push 0
  2955 00001295 E8ED03                   call doreg1
  2956 00001298 83C402                   add  sp, 2
  2957 0000129B E97002                   jmp .retn
  2958                                  
  2959                                  ;-320   if (ireg1 == 0) { idx1=searchname();
  2960                                  
  2961                                  .expr2136:
  2962 0000129E A1[8810]                 mov ax, [ireg1]
  2963 000012A1 83F800                   cmp ax, 0
  2964 000012A4 0F853400                 jne .expr2137
  2965 000012A8 E813F7                   call searchname
  2966 000012AB A3[8A10]                 mov word [idx1], ax
  2967                                  
  2968                                  ;-321     gettypes(idx1); ids1=signi; idw1=wi; idt1=typei;
  2969                                  
  2970 000012AE FF36[8A10]               push word [idx1]
  2971 000012B2 E8CBF5                   call gettypes
  2972 000012B5 83C402                   add  sp, 2
  2973 000012B8 A1[3300]                 mov ax, [signi]
  2974 000012BB A3[8C10]                 mov word [ids1], ax
  2975 000012BE A1[3900]                 mov ax, [wi]
  2976 000012C1 A3[8E10]                 mov word [idw1], ax
  2977 000012C4 A1[3000]                 mov ax, [typei]
  2978 000012C7 A3[9010]                 mov word [idt1], ax
  2979                                  
  2980                                  ;-322     if (idt1)  error1("Noch kein Array oder Pointer links erlaubt");  }
  2981                                  
  2982 000012CA A1[9010]                 mov ax, [idt1]
  2983 000012CD 08C0                     or  al, al
  2984 000012CF 0F840900                 je .expr2138
  2985 000012D3 68[3F15]                 push expr2_1
  2986 000012D6 E83635                   call error1
  2987 000012D9 83C402                   add  sp, 2
  2988                                  .expr2138:
  2989                                  
  2990                                  ;-323   
  2991                                  
  2992                                  
  2993                                  ;-324   if (isrelational()) { error1("Vergleich noch nicht implementiert");
  2994                                  
  2995                                  .expr2137:
  2996 000012DC E88529                   call isrelational
  2997 000012DF 08C0                     or  al, al
  2998 000012E1 0F840900                 je .expr2139
  2999 000012E5 68[6A15]                 push expr2_2
  3000 000012E8 E82435                   call error1
  3001 000012EB 83C402                   add  sp, 2
  3002                                  
  3003                                  ;-325   }
  3004                                  
  3005                                  
  3006                                  ;-326   if (istoken('=') == 0) error1("Assign expected");
  3007                                  
  3008                                  .expr2139:
  3009 000012EE 6A3D                     push 61
  3010 000012F0 E8FC30                   call istoken
  3011 000012F3 83C402                   add  sp, 2
  3012 000012F6 83F800                   cmp ax, 0
  3013 000012F9 0F850900                 jne .expr2140
  3014 000012FD 68[8D15]                 push expr2_3
  3015 00001300 E80C35                   call error1
  3016 00001303 83C402                   add  sp, 2
  3017                                  
  3018                                  ;-327   if (istoken(T_CONST) ) { val2=lexval; prs(" ; constant expression");
  3019                                  
  3020                                  .expr2140:
  3021 00001306 680101                   push 257
  3022 00001309 E8E330                   call istoken
  3023 0000130C 83C402                   add  sp, 2
  3024 0000130F 08C0                     or  al, al
  3025 00001311 0F849A00                 je .expr2141
  3026 00001315 A1[2E00]                 mov ax, [lexval]
  3027 00001318 A3[A010]                 mov word [val2], ax
  3028 0000131B 68[9D15]                 push expr2_4
  3029 0000131E E80332                   call prs
  3030 00001321 83C402                   add  sp, 2
  3031                                  
  3032                                  ;-328     prs("\nmov ");
  3033                                  
  3034 00001324 68[B415]                 push expr2_5
  3035 00001327 E8FA31                   call prs
  3036 0000132A 83C402                   add  sp, 2
  3037                                  
  3038                                  ;-329     if (idw1 == 1) prs("byte ");
  3039                                  
  3040 0000132D A1[8E10]                 mov ax, [idw1]
  3041 00001330 83F801                   cmp ax, 1
  3042 00001333 0F850900                 jne .expr2142
  3043 00001337 68[BB15]                 push expr2_6
  3044 0000133A E8E731                   call prs
  3045 0000133D 83C402                   add  sp, 2
  3046                                  
  3047                                  ;-330     if (idw1 == 2) prs("word ");
  3048                                  
  3049                                  .expr2142:
  3050 00001340 A1[8E10]                 mov ax, [idw1]
  3051 00001343 83F802                   cmp ax, 2
  3052 00001346 0F850900                 jne .expr2143
  3053 0000134A 68[C115]                 push expr2_7
  3054 0000134D E8D431                   call prs
  3055 00001350 83C402                   add  sp, 2
  3056                                  
  3057                                  ;-331     if (idw1 == 4) prs("dword ");
  3058                                  
  3059                                  .expr2143:
  3060 00001353 A1[8E10]                 mov ax, [idw1]
  3061 00001356 83F804                   cmp ax, 4
  3062 00001359 0F850900                 jne .expr2144
  3063 0000135D 68[C715]                 push expr2_8
  3064 00001360 E8C131                   call prs
  3065 00001363 83C402                   add  sp, 2
  3066                                  
  3067                                  ;-332     v(idx1);
  3068                                  
  3069                                  .expr2144:
  3070 00001366 FF36[8A10]               push word [idx1]
  3071 0000136A E865F0                   call v
  3072 0000136D 83C402                   add  sp, 2
  3073                                  
  3074                                  ;-333     prs(", "); prunsign1(val2);
  3075                                  
  3076 00001370 68[CE15]                 push expr2_9
  3077 00001373 E8AE31                   call prs
  3078 00001376 83C402                   add  sp, 2
  3079 00001379 FF36[A010]               push word [val2]
  3080 0000137D E8FE32                   call prunsign1
  3081 00001380 83C402                   add  sp, 2
  3082                                  
  3083                                  ;-334     if (idx1 >= LSTART) { i=adrofname(idx1);  prs("; "); prs(i); } return; }
  3084                                  
  3085 00001383 A1[8A10]                 mov ax, [idx1]
  3086 00001386 3DC800                   cmp ax, 200 ;unsigned : 1
  3087 00001389 0F8C1F00                 jl  .expr2145
  3088 0000138D FF36[8A10]               push word [idx1]
  3089 00001391 E8A3F5                   call adrofname
  3090 00001394 83C402                   add  sp, 2
  3091 00001397 8946FE                   mov [bp-2], ax
  3092 0000139A 68[D115]                 push expr2_10
  3093 0000139D E88431                   call prs
  3094 000013A0 83C402                   add  sp, 2
  3095 000013A3 FF76FE                   push word [bp-2]
  3096 000013A6 E87B31                   call prs
  3097 000013A9 83C402                   add  sp, 2
  3098                                  .expr2145:
  3099 000013AC E95F01                   jmp .retn
  3100                                  
  3101                                  ;-335   
  3102                                  
  3103                                  
  3104                                  ;-336   mod1=typeName(); ireg2=checkreg();
  3105                                  
  3106                                  .expr2141:
  3107 000013AF E8DBF6                   call typeName
  3108 000013B2 A3[8610]                 mov word [mod1], ax
  3109 000013B5 E8B904                   call checkreg
  3110 000013B8 A3[9610]                 mov word [ireg2], ax
  3111                                  
  3112                                  ;-337   if (ireg2) { prs("\nmov ");
  3113                                  
  3114 000013BB A1[9610]                 mov ax, [ireg2]
  3115 000013BE 08C0                     or  al, al
  3116 000013C0 0F844200                 je .expr2146
  3117 000013C4 68[D415]                 push expr2_11
  3118 000013C7 E85A31                   call prs
  3119 000013CA 83C402                   add  sp, 2
  3120                                  
  3121                                  ;-338     if (ireg1) printreg(ireg1); else v(idx1); prs(", "); printreg(ireg2);return;}
  3122                                  
  3123 000013CD A1[8810]                 mov ax, [ireg1]
  3124 000013D0 08C0                     or  al, al
  3125 000013D2 0F840D00                 je .expr2147
  3126 000013D6 FF36[8810]               push word [ireg1]
  3127 000013DA E8A208                   call printreg
  3128 000013DD 83C402                   add  sp, 2
  3129 000013E0 E90A00                   jmp .expr2148
  3130                                  .expr2147:
  3131 000013E3 FF36[8A10]               push word [idx1]
  3132 000013E7 E8E8EF                   call v
  3133 000013EA 83C402                   add  sp, 2
  3134                                  .expr2148:
  3135 000013ED 68[DB15]                 push expr2_12
  3136 000013F0 E83131                   call prs
  3137 000013F3 83C402                   add  sp, 2
  3138 000013F6 FF36[9610]               push word [ireg2]
  3139 000013FA E88208                   call printreg
  3140 000013FD 83C402                   add  sp, 2
  3141 00001400 E90B01                   jmp .retn
  3142                                  
  3143                                  ;-339   else {
  3144                                  
  3145 00001403 E9FF00                   jmp .expr2149
  3146                                  .expr2146:
  3147                                  
  3148                                  ;-340     if (mod1 == 1) error1("Noch kein * im Text erlaubt");
  3149                                  
  3150 00001406 A1[8610]                 mov ax, [mod1]
  3151 00001409 83F801                   cmp ax, 1
  3152 0000140C 0F850900                 jne .expr2150
  3153 00001410 68[DE15]                 push expr2_13
  3154 00001413 E8F933                   call error1
  3155 00001416 83C402                   add  sp, 2
  3156                                  
  3157                                  ;-341     
  3158                                  
  3159                                  
  3160                                  ;-342     idx2=searchname();
  3161                                  
  3162                                  .expr2150:
  3163 00001419 E8A2F5                   call searchname
  3164 0000141C A3[9810]                 mov word [idx2], ax
  3165                                  
  3166                                  ;-343     gettypes(idx2); ids2=signi; idw2=wi; idt2=typei;
  3167                                  
  3168 0000141F FF36[9810]               push word [idx2]
  3169 00001423 E85AF4                   call gettypes
  3170 00001426 83C402                   add  sp, 2
  3171 00001429 A1[3300]                 mov ax, [signi]
  3172 0000142C A3[9A10]                 mov word [ids2], ax
  3173 0000142F A1[3900]                 mov ax, [wi]
  3174 00001432 A3[9C10]                 mov word [idw2], ax
  3175 00001435 A1[3000]                 mov ax, [typei]
  3176 00001438 A3[9E10]                 mov word [idt2], ax
  3177                                  
  3178                                  ;-344     if (idt2 == 1)  error1("Noch kein Array rechts erlaubt");
  3179                                  
  3180 0000143B A1[9E10]                 mov ax, [idt2]
  3181 0000143E 83F801                   cmp ax, 1
  3182 00001441 0F850900                 jne .expr2151
  3183 00001445 68[FA15]                 push expr2_14
  3184 00001448 E8C433                   call error1
  3185 0000144B 83C402                   add  sp, 2
  3186                                  
  3187                                  ;-345     prs("\nmov ");
  3188                                  
  3189                                  .expr2151:
  3190 0000144E 68[1916]                 push expr2_15
  3191 00001451 E8D030                   call prs
  3192 00001454 83C402                   add  sp, 2
  3193                                  
  3194                                  ;-346     if (ireg1) printreg(ireg1); else error1("Mem to Mem not allowed by x86-CPU");
  3195                                  
  3196 00001457 A1[8810]                 mov ax, [ireg1]
  3197 0000145A 08C0                     or  al, al
  3198 0000145C 0F840D00                 je .expr2152
  3199 00001460 FF36[8810]               push word [ireg1]
  3200 00001464 E81808                   call printreg
  3201 00001467 83C402                   add  sp, 2
  3202 0000146A E90900                   jmp .expr2153
  3203                                  .expr2152:
  3204 0000146D 68[2016]                 push expr2_16
  3205 00001470 E89C33                   call error1
  3206 00001473 83C402                   add  sp, 2
  3207                                  
  3208                                  ;-347     prs(", ");
  3209                                  
  3210                                  .expr2153:
  3211 00001476 68[4216]                 push expr2_17
  3212 00001479 E8A830                   call prs
  3213 0000147C 83C402                   add  sp, 2
  3214                                  
  3215                                  ;-348     if (mod1 == 2) a(idx2);
  3216                                  
  3217 0000147F A1[8610]                 mov ax, [mod1]
  3218 00001482 83F802                   cmp ax, 2
  3219 00001485 0F850D00                 jne .expr2154
  3220 00001489 FF36[9810]               push word [idx2]
  3221 0000148D E833EF                   call a
  3222 00001490 83C402                   add  sp, 2
  3223                                  
  3224                                  ;-349     else {
  3225                                  
  3226 00001493 E96C00                   jmp .expr2155
  3227                                  .expr2154:
  3228                                  
  3229                                  ;-350       if (idw2 == 1) prs("byte ");
  3230                                  
  3231 00001496 A1[9C10]                 mov ax, [idw2]
  3232 00001499 83F801                   cmp ax, 1
  3233 0000149C 0F850900                 jne .expr2156
  3234 000014A0 68[4516]                 push expr2_18
  3235 000014A3 E87E30                   call prs
  3236 000014A6 83C402                   add  sp, 2
  3237                                  
  3238                                  ;-351       if (idw2 == 2) prs("word ");
  3239                                  
  3240                                  .expr2156:
  3241 000014A9 A1[9C10]                 mov ax, [idw2]
  3242 000014AC 83F802                   cmp ax, 2
  3243 000014AF 0F850900                 jne .expr2157
  3244 000014B3 68[4B16]                 push expr2_19
  3245 000014B6 E86B30                   call prs
  3246 000014B9 83C402                   add  sp, 2
  3247                                  
  3248                                  ;-352       if (idw2 == 4) prs("dword ");
  3249                                  
  3250                                  .expr2157:
  3251 000014BC A1[9C10]                 mov ax, [idw2]
  3252 000014BF 83F804                   cmp ax, 4
  3253 000014C2 0F850900                 jne .expr2158
  3254 000014C6 68[5116]                 push expr2_20
  3255 000014C9 E85830                   call prs
  3256 000014CC 83C402                   add  sp, 2
  3257                                  
  3258                                  ;-353       v(idx2);
  3259                                  
  3260                                  .expr2158:
  3261 000014CF FF36[9810]               push word [idx2]
  3262 000014D3 E8FCEE                   call v
  3263 000014D6 83C402                   add  sp, 2
  3264                                  
  3265                                  ;-354       if (idx2 >= LSTART) { i=adrofname(idx2);  prs("; "); prs(i); }  }
  3266                                  
  3267 000014D9 A1[9810]                 mov ax, [idx2]
  3268 000014DC 3DC800                   cmp ax, 200 ;unsigned : 1
  3269 000014DF 0F8C1F00                 jl  .expr2159
  3270 000014E3 FF36[9810]               push word [idx2]
  3271 000014E7 E84DF4                   call adrofname
  3272 000014EA 83C402                   add  sp, 2
  3273 000014ED 8946FE                   mov [bp-2], ax
  3274 000014F0 68[5816]                 push expr2_21
  3275 000014F3 E82E30                   call prs
  3276 000014F6 83C402                   add  sp, 2
  3277 000014F9 FF76FE                   push word [bp-2]
  3278 000014FC E82530                   call prs
  3279 000014FF 83C402                   add  sp, 2
  3280                                  .expr2159:
  3281                                  
  3282                                  ;-355     return;
  3283                                  
  3284                                  .expr2155:
  3285 00001502 E90900                   jmp .retn
  3286                                  
  3287                                  ;-356   } error1("Internal error: only const or reg allowed");
  3288                                  
  3289                                  .expr2149:
  3290 00001505 68[5B16]                 push expr2_22
  3291 00001508 E80433                   call error1
  3292 0000150B 83C402                   add  sp, 2
  3293                                  
  3294                                  ;-357 }
  3295                                  
  3296                                  
  3297                                  ;-358 char ops[5];
  3298                                  
  3299 0000150E C9                       .retn: LEAVE
  3300 0000150F C3                       ret
  3301                                  ; ENDP
  3302 00001510 4E6F6368206B65696E-     expr2_0 db "Noch kein & und * im Text (Linke Hand) erlaubt",0
  3303 00001519 202620756E64202A20-
  3304 00001522 696D20546578742028-
  3305 0000152B 4C696E6B652048616E-
  3306 00001534 64292065726C617562-
  3307 0000153D 7400               
  3308 0000153F 4E6F6368206B65696E-     expr2_1 db "Noch kein Array oder Pointer links erlaubt",0
  3309 00001548 204172726179206F64-
  3310 00001551 657220506F696E7465-
  3311 0000155A 72206C696E6B732065-
  3312 00001563 726C6175627400     
  3313 0000156A 566572676C65696368-     expr2_2 db "Vergleich noch nicht implementiert",0
  3314 00001573 206E6F6368206E6963-
  3315 0000157C 687420696D706C656D-
  3316 00001585 656E746965727400   
  3317 0000158D 41737369676E206578-     expr2_3 db "Assign expected",0
  3318 00001596 70656374656400     
  3319 0000159D 203B20636F6E737461-     expr2_4 db " ; constant expression",0
  3320 000015A6 6E7420657870726573-
  3321 000015AF 73696F6E00         
  3322 000015B4 5C6E6D6F762000          expr2_5 db "\nmov ",0
  3323 000015BB 627974652000            expr2_6 db "byte ",0
  3324 000015C1 776F72642000            expr2_7 db "word ",0
  3325 000015C7 64776F72642000          expr2_8 db "dword ",0
  3326 000015CE 2C2000                  expr2_9 db ", ",0
  3327 000015D1 3B2000                  expr2_10 db "; ",0
  3328 000015D4 5C6E6D6F762000          expr2_11 db "\nmov ",0
  3329 000015DB 2C2000                  expr2_12 db ", ",0
  3330 000015DE 4E6F6368206B65696E-     expr2_13 db "Noch kein * im Text erlaubt",0
  3331 000015E7 202A20696D20546578-
  3332 000015F0 742065726C61756274-
  3333 000015F9 00                 
  3334 000015FA 4E6F6368206B65696E-     expr2_14 db "Noch kein Array rechts erlaubt",0
  3335 00001603 204172726179207265-
  3336 0000160C 636874732065726C61-
  3337 00001615 75627400           
  3338 00001619 5C6E6D6F762000          expr2_15 db "\nmov ",0
  3339 00001620 4D656D20746F204D65-     expr2_16 db "Mem to Mem not allowed by x86-CPU",0
  3340 00001629 6D206E6F7420616C6C-
  3341 00001632 6F7765642062792078-
  3342 0000163B 38362D43505500     
  3343 00001642 2C2000                  expr2_17 db ", ",0
  3344 00001645 627974652000            expr2_18 db "byte ",0
  3345 0000164B 776F72642000            expr2_19 db "word ",0
  3346 00001651 64776F72642000          expr2_20 db "dword ",0
  3347 00001658 3B2000                  expr2_21 db "; ",0
  3348 0000165B 496E7465726E616C20-     expr2_22 db "Internal error: only const or reg allowed",0
  3349 00001664 6572726F723A206F6E-
  3350 0000166D 6C7920636F6E737420-
  3351 00001676 6F722072656720616C-
  3352 0000167F 6C6F77656400       
  3353                                  section .bss
  3354                                  absolute 53406
  3355 0000D09E <res 00000005>          ops resb 5
  3356                                  section .text
  3357                                  
  3358                                  ;-359 int doreg1(int iscmp1) { int i;
  3359                                  
  3360                                  
  3361                                  doreg1:  ; *** PROC ***
  3362                                  
  3363                                  ;-360   if (istoken('='))          strcpy(ops, "mov");
  3364                                  
  3365                                  ;Function : doreg1, Number of local variables: 2
  3366                                  ;   # type sign width addr used name   list of local variables
  3367                                  ;  200 var sign word   359 NULL iscmp1 = bp+4
  3368                                  ;  201 var sign word   359 NULL i = bp-2;
  3369 00001685 C8020000                 ENTER  2,0
  3370 00001689 6A3D                     push 61
  3371 0000168B E8612D                   call istoken
  3372 0000168E 83C402                   add  sp, 2
  3373 00001691 08C0                     or  al, al
  3374 00001693 0F840E00                 je .doreg1160
  3375 00001697 68[3818]                 push doreg1_0
  3376 0000169A 8D069ED0                 lea  ax, [ops]
  3377 0000169E 50                       push ax
  3378 0000169F E8C4EA                   call strcpy
  3379 000016A2 83C404                   add  sp, 4
  3380                                  
  3381                                  ;-361   if (istoken(T_PLUSASS))    strcpy(ops, "add");
  3382                                  
  3383                                  .doreg1160:
  3384 000016A5 68CE04                   push 1230
  3385 000016A8 E8442D                   call istoken
  3386 000016AB 83C402                   add  sp, 2
  3387 000016AE 08C0                     or  al, al
  3388 000016B0 0F840E00                 je .doreg1161
  3389 000016B4 68[3C18]                 push doreg1_1
  3390 000016B7 8D069ED0                 lea  ax, [ops]
  3391 000016BB 50                       push ax
  3392 000016BC E8A7EA                   call strcpy
  3393 000016BF 83C404                   add  sp, 4
  3394                                  
  3395                                  ;-362   if (istoken(T_MINUSASS))   strcpy(ops, "sub");
  3396                                  
  3397                                  .doreg1161:
  3398 000016C2 68CF04                   push 1231
  3399 000016C5 E8272D                   call istoken
  3400 000016C8 83C402                   add  sp, 2
  3401 000016CB 08C0                     or  al, al
  3402 000016CD 0F840E00                 je .doreg1162
  3403 000016D1 68[4018]                 push doreg1_2
  3404 000016D4 8D069ED0                 lea  ax, [ops]
  3405 000016D8 50                       push ax
  3406 000016D9 E88AEA                   call strcpy
  3407 000016DC 83C404                   add  sp, 4
  3408                                  
  3409                                  ;-363   if (istoken(T_ANDASS))     strcpy(ops, "and");
  3410                                  
  3411                                  .doreg1162:
  3412 000016DF 68D204                   push 1234
  3413 000016E2 E80A2D                   call istoken
  3414 000016E5 83C402                   add  sp, 2
  3415 000016E8 08C0                     or  al, al
  3416 000016EA 0F840E00                 je .doreg1163
  3417 000016EE 68[4418]                 push doreg1_3
  3418 000016F1 8D069ED0                 lea  ax, [ops]
  3419 000016F5 50                       push ax
  3420 000016F6 E86DEA                   call strcpy
  3421 000016F9 83C404                   add  sp, 4
  3422                                  
  3423                                  ;-364   if (istoken(T_ORASS))      strcpy(ops, "or" );
  3424                                  
  3425                                  .doreg1163:
  3426 000016FC 68D304                   push 1235
  3427 000016FF E8ED2C                   call istoken
  3428 00001702 83C402                   add  sp, 2
  3429 00001705 08C0                     or  al, al
  3430 00001707 0F840E00                 je .doreg1164
  3431 0000170B 68[4818]                 push doreg1_4
  3432 0000170E 8D069ED0                 lea  ax, [ops]
  3433 00001712 50                       push ax
  3434 00001713 E850EA                   call strcpy
  3435 00001716 83C404                   add  sp, 4
  3436                                  
  3437                                  ;-365   if (istoken(T_LESSLESS))   strcpy(ops, "shl");
  3438                                  
  3439                                  .doreg1164:
  3440 00001719 68D804                   push 1240
  3441 0000171C E8D02C                   call istoken
  3442 0000171F 83C402                   add  sp, 2
  3443 00001722 08C0                     or  al, al
  3444 00001724 0F840E00                 je .doreg1165
  3445 00001728 68[4B18]                 push doreg1_5
  3446 0000172B 8D069ED0                 lea  ax, [ops]
  3447 0000172F 50                       push ax
  3448 00001730 E833EA                   call strcpy
  3449 00001733 83C404                   add  sp, 4
  3450                                  
  3451                                  ;-366   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");
  3452                                  
  3453                                  .doreg1165:
  3454 00001736 68D904                   push 1241
  3455 00001739 E8B32C                   call istoken
  3456 0000173C 83C402                   add  sp, 2
  3457 0000173F 08C0                     or  al, al
  3458 00001741 0F840E00                 je .doreg1166
  3459 00001745 68[4F18]                 push doreg1_6
  3460 00001748 8D069ED0                 lea  ax, [ops]
  3461 0000174C 50                       push ax
  3462 0000174D E816EA                   call strcpy
  3463 00001750 83C404                   add  sp, 4
  3464                                  
  3465                                  ;-367   if (iscmp1 == 1) { token=getlex();
  3466                                  
  3467                                  .doreg1166:
  3468 00001753 8B4604                   mov ax, [bp+4]
  3469 00001756 83F801                   cmp ax, 1
  3470 00001759 0F852700                 jne .doreg1167
  3471 0000175D E86B25                   call getlex
  3472 00001760 A3[1C00]                 mov word [token], ax
  3473                                  
  3474                                  ;-368       if (isrelational() ==0) error1("Relational expected");
  3475                                  
  3476 00001763 E8FE24                   call isrelational
  3477 00001766 83F800                   cmp ax, 0
  3478 00001769 0F850900                 jne .doreg1168
  3479 0000176D 68[5318]                 push doreg1_7
  3480 00001770 E89C30                   call error1
  3481 00001773 83C402                   add  sp, 2
  3482                                  
  3483                                  ;-369       strcpy(ops, "cmp"); }
  3484                                  
  3485                                  .doreg1168:
  3486 00001776 68[6718]                 push doreg1_8
  3487 00001779 8D069ED0                 lea  ax, [ops]
  3488 0000177D 50                       push ax
  3489 0000177E E8E5E9                   call strcpy
  3490 00001781 83C404                   add  sp, 4
  3491                                  
  3492                                  ;-370   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");
  3493                                  
  3494                                  .doreg1167:
  3495 00001784 E88F2D                   call prnl
  3496 00001787 8D069ED0                 lea  ax, [ops]
  3497 0000178B 50                       push ax
  3498 0000178C E8952D                   call prs
  3499 0000178F 83C402                   add  sp, 2
  3500 00001792 68[6B18]                 push doreg1_9
  3501 00001795 E88C2D                   call prs
  3502 00001798 83C402                   add  sp, 2
  3503 0000179B FF36[8810]               push word [ireg1]
  3504 0000179F E8DD04                   call printreg
  3505 000017A2 83C402                   add  sp, 2
  3506 000017A5 68[6E18]                 push doreg1_10
  3507 000017A8 E8792D                   call prs
  3508 000017AB 83C402                   add  sp, 2
  3509                                  
  3510                                  ;-371 
  3511                                  
  3512                                  
  3513                                  ;-372   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}
  3514                                  
  3515 000017AE 680101                   push 257
  3516 000017B1 E83B2C                   call istoken
  3517 000017B4 83C402                   add  sp, 2
  3518 000017B7 08C0                     or  al, al
  3519 000017B9 0F840D00                 je .doreg1169
  3520 000017BD FF36[2E00]               push word [lexval]
  3521 000017C1 E8BA2E                   call prunsign1
  3522 000017C4 83C402                   add  sp, 2
  3523 000017C7 E94700                   jmp .reg1
  3524                                  
  3525                                  ;-373   mod2=typeName(); ireg2=checkreg();
  3526                                  
  3527                                  .doreg1169:
  3528 000017CA E8C0F2                   call typeName
  3529 000017CD A3[9410]                 mov word [mod2], ax
  3530 000017D0 E89E00                   call checkreg
  3531 000017D3 A3[9610]                 mov word [ireg2], ax
  3532                                  
  3533                                  ;-374   if (ireg2) {printreg(ireg2); goto reg1;}
  3534                                  
  3535 000017D6 A1[9610]                 mov ax, [ireg2]
  3536 000017D9 08C0                     or  al, al
  3537 000017DB 0F840D00                 je .doreg1170
  3538 000017DF FF36[9610]               push word [ireg2]
  3539 000017E3 E89904                   call printreg
  3540 000017E6 83C402                   add  sp, 2
  3541 000017E9 E92500                   jmp .reg1
  3542                                  
  3543                                  ;-375   i=searchname();  if (mod2 == 2) a(i); else v(i);
  3544                                  
  3545                                  .doreg1170:
  3546 000017EC E8CFF1                   call searchname
  3547 000017EF 8946FE                   mov [bp-2], ax
  3548 000017F2 A1[9410]                 mov ax, [mod2]
  3549 000017F5 83F802                   cmp ax, 2
  3550 000017F8 0F850C00                 jne .doreg1171
  3551 000017FC FF76FE                   push word [bp-2]
  3552 000017FF E8C1EB                   call a
  3553 00001802 83C402                   add  sp, 2
  3554 00001805 E90900                   jmp .doreg1172
  3555                                  .doreg1171:
  3556 00001808 FF76FE                   push word [bp-2]
  3557 0000180B E8C4EB                   call v
  3558 0000180E 83C402                   add  sp, 2
  3559                                  
  3560                                  ;-376   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }
  3561                                  
  3562                                  .doreg1172:
  3563                                  .reg1:
  3564 00001811 8B4604                   mov ax, [bp+4]
  3565 00001814 83F801                   cmp ax, 1
  3566 00001817 0F851B00                 jne .doreg1173
  3567 0000181B 6A00                     push 0
  3568 0000181D E89121                   call cmpneg
  3569 00001820 83C402                   add  sp, 2
  3570 00001823 8D06AB81                 lea  ax, [fname]
  3571 00001827 50                       push ax
  3572 00001828 E8F92C                   call prs
  3573 0000182B 83C402                   add  sp, 2
  3574 0000182E 6A29                     push 41
  3575 00001830 E8DE2B                   call expect
  3576 00001833 83C402                   add  sp, 2
  3577                                  
  3578                                  ;-377 }
  3579                                  
  3580                                  .doreg1173:
  3581                                  
  3582                                  ;-378 int checkreg() { // >=17 = 16bit, >=47 = 32bit
  3583 00001836 C9                       LEAVE
  3584 00001837 C3                       ret
  3585                                  ; ENDP
  3586 00001838 6D6F7600                doreg1_0 db "mov",0
  3587 0000183C 61646400                doreg1_1 db "add",0
  3588 00001840 73756200                doreg1_2 db "sub",0
  3589 00001844 616E6400                doreg1_3 db "and",0
  3590 00001848 6F7200                  doreg1_4 db "or",0
  3591 0000184B 73686C00                doreg1_5 db "shl",0
  3592 0000184F 73687200                doreg1_6 db "shr",0
  3593 00001853 52656C6174696F6E61-     doreg1_7 db "Relational expected",0
  3594 0000185C 6C2065787065637465-
  3595 00001865 6400               
  3596 00001867 636D7000                doreg1_8 db "cmp",0
  3597 0000186B 202000                  doreg1_9 db "  ",0
  3598 0000186E 2C2000                  doreg1_10 db ", ",0
  3599                                  
  3600                                  checkreg:  ; *** PROC ***
  3601                                  
  3602                                  ;-379   if (strlen(symbol) <  2) return 0;
  3603                                  
  3604 00001871 8D062B81                 lea  ax, [symbol]
  3605 00001875 50                       push ax
  3606 00001876 E8C5E8                   call strlen
  3607 00001879 83C402                   add  sp, 2
  3608 0000187C 83F802                   cmp ax, 2
  3609 0000187F 0F8D0600                 jge .checkreg174
  3610 00001883 B80000                   mov ax, 0
  3611 00001886 E94403                   jmp .retn
  3612                                  
  3613                                  ;-380   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;
  3614                                  
  3615                                  .checkreg174:
  3616 00001889 68[CE1B]                 push checkreg_0
  3617 0000188C 8D062B81                 lea  ax, [symbol]
  3618 00001890 50                       push ax
  3619 00001891 E802E9                   call eqstr
  3620 00001894 83C404                   add  sp, 4
  3621 00001897 08C0                     or  al, al
  3622 00001899 0F840600                 je .checkreg175
  3623 0000189D B80100                   mov ax, 1
  3624 000018A0 E92A03                   jmp .retn
  3625                                  .checkreg175:
  3626 000018A3 68[D11B]                 push checkreg_1
  3627 000018A6 8D062B81                 lea  ax, [symbol]
  3628 000018AA 50                       push ax
  3629 000018AB E8E8E8                   call eqstr
  3630 000018AE 83C404                   add  sp, 4
  3631 000018B1 08C0                     or  al, al
  3632 000018B3 0F840600                 je .checkreg176
  3633 000018B7 B80300                   mov ax, 3
  3634 000018BA E91003                   jmp .retn
  3635                                  
  3636                                  ;-381   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;
  3637                                  
  3638                                  .checkreg176:
  3639 000018BD 68[D41B]                 push checkreg_2
  3640 000018C0 8D062B81                 lea  ax, [symbol]
  3641 000018C4 50                       push ax
  3642 000018C5 E8CEE8                   call eqstr
  3643 000018C8 83C404                   add  sp, 4
  3644 000018CB 08C0                     or  al, al
  3645 000018CD 0F840600                 je .checkreg177
  3646 000018D1 B80500                   mov ax, 5
  3647 000018D4 E9F602                   jmp .retn
  3648                                  .checkreg177:
  3649 000018D7 68[D71B]                 push checkreg_3
  3650 000018DA 8D062B81                 lea  ax, [symbol]
  3651 000018DE 50                       push ax
  3652 000018DF E8B4E8                   call eqstr
  3653 000018E2 83C404                   add  sp, 4
  3654 000018E5 08C0                     or  al, al
  3655 000018E7 0F840600                 je .checkreg178
  3656 000018EB B80700                   mov ax, 7
  3657 000018EE E9DC02                   jmp .retn
  3658                                  
  3659                                  ;-382   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;
  3660                                  
  3661                                  .checkreg178:
  3662 000018F1 68[DA1B]                 push checkreg_4
  3663 000018F4 8D062B81                 lea  ax, [symbol]
  3664 000018F8 50                       push ax
  3665 000018F9 E89AE8                   call eqstr
  3666 000018FC 83C404                   add  sp, 4
  3667 000018FF 08C0                     or  al, al
  3668 00001901 0F840600                 je .checkreg179
  3669 00001905 B80900                   mov ax, 9
  3670 00001908 E9C202                   jmp .retn
  3671                                  .checkreg179:
  3672 0000190B 68[DD1B]                 push checkreg_5
  3673 0000190E 8D062B81                 lea  ax, [symbol]
  3674 00001912 50                       push ax
  3675 00001913 E880E8                   call eqstr
  3676 00001916 83C404                   add  sp, 4
  3677 00001919 08C0                     or  al, al
  3678 0000191B 0F840600                 je .checkreg180
  3679 0000191F B80B00                   mov ax, 11
  3680 00001922 E9A802                   jmp .retn
  3681                                  
  3682                                  ;-383   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;
  3683                                  
  3684                                  .checkreg180:
  3685 00001925 68[E01B]                 push checkreg_6
  3686 00001928 8D062B81                 lea  ax, [symbol]
  3687 0000192C 50                       push ax
  3688 0000192D E866E8                   call eqstr
  3689 00001930 83C404                   add  sp, 4
  3690 00001933 08C0                     or  al, al
  3691 00001935 0F840600                 je .checkreg181
  3692 00001939 B80D00                   mov ax, 13
  3693 0000193C E98E02                   jmp .retn
  3694                                  .checkreg181:
  3695 0000193F 68[E31B]                 push checkreg_7
  3696 00001942 8D062B81                 lea  ax, [symbol]
  3697 00001946 50                       push ax
  3698 00001947 E84CE8                   call eqstr
  3699 0000194A 83C404                   add  sp, 4
  3700 0000194D 08C0                     or  al, al
  3701 0000194F 0F840600                 je .checkreg182
  3702 00001953 B80F00                   mov ax, 15
  3703 00001956 E97402                   jmp .retn
  3704                                  
  3705                                  ;-384   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;
  3706                                  
  3707                                  .checkreg182:
  3708 00001959 68[E61B]                 push checkreg_8
  3709 0000195C 8D062B81                 lea  ax, [symbol]
  3710 00001960 50                       push ax
  3711 00001961 E832E8                   call eqstr
  3712 00001964 83C404                   add  sp, 4
  3713 00001967 08C0                     or  al, al
  3714 00001969 0F840600                 je .checkreg183
  3715 0000196D B81100                   mov ax, 17
  3716 00001970 E95A02                   jmp .retn
  3717                                  .checkreg183:
  3718 00001973 68[E91B]                 push checkreg_9
  3719 00001976 8D062B81                 lea  ax, [symbol]
  3720 0000197A 50                       push ax
  3721 0000197B E818E8                   call eqstr
  3722 0000197E 83C404                   add  sp, 4
  3723 00001981 08C0                     or  al, al
  3724 00001983 0F840600                 je .checkreg184
  3725 00001987 B81300                   mov ax, 19
  3726 0000198A E94002                   jmp .retn
  3727                                  
  3728                                  ;-385   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;
  3729                                  
  3730                                  .checkreg184:
  3731 0000198D 68[EC1B]                 push checkreg_10
  3732 00001990 8D062B81                 lea  ax, [symbol]
  3733 00001994 50                       push ax
  3734 00001995 E8FEE7                   call eqstr
  3735 00001998 83C404                   add  sp, 4
  3736 0000199B 08C0                     or  al, al
  3737 0000199D 0F840600                 je .checkreg185
  3738 000019A1 B81500                   mov ax, 21
  3739 000019A4 E92602                   jmp .retn
  3740                                  .checkreg185:
  3741 000019A7 68[EF1B]                 push checkreg_11
  3742 000019AA 8D062B81                 lea  ax, [symbol]
  3743 000019AE 50                       push ax
  3744 000019AF E8E4E7                   call eqstr
  3745 000019B2 83C404                   add  sp, 4
  3746 000019B5 08C0                     or  al, al
  3747 000019B7 0F840600                 je .checkreg186
  3748 000019BB B81700                   mov ax, 23
  3749 000019BE E90C02                   jmp .retn
  3750                                  
  3751                                  ;-386   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;
  3752                                  
  3753                                  .checkreg186:
  3754 000019C1 68[F21B]                 push checkreg_12
  3755 000019C4 8D062B81                 lea  ax, [symbol]
  3756 000019C8 50                       push ax
  3757 000019C9 E8CAE7                   call eqstr
  3758 000019CC 83C404                   add  sp, 4
  3759 000019CF 08C0                     or  al, al
  3760 000019D1 0F840600                 je .checkreg187
  3761 000019D5 B81900                   mov ax, 25
  3762 000019D8 E9F201                   jmp .retn
  3763                                  .checkreg187:
  3764 000019DB 68[F51B]                 push checkreg_13
  3765 000019DE 8D062B81                 lea  ax, [symbol]
  3766 000019E2 50                       push ax
  3767 000019E3 E8B0E7                   call eqstr
  3768 000019E6 83C404                   add  sp, 4
  3769 000019E9 08C0                     or  al, al
  3770 000019EB 0F840600                 je .checkreg188
  3771 000019EF B81B00                   mov ax, 27
  3772 000019F2 E9D801                   jmp .retn
  3773                                  
  3774                                  ;-387   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;
  3775                                  
  3776                                  .checkreg188:
  3777 000019F5 68[F81B]                 push checkreg_14
  3778 000019F8 8D062B81                 lea  ax, [symbol]
  3779 000019FC 50                       push ax
  3780 000019FD E896E7                   call eqstr
  3781 00001A00 83C404                   add  sp, 4
  3782 00001A03 08C0                     or  al, al
  3783 00001A05 0F840600                 je .checkreg189
  3784 00001A09 B81D00                   mov ax, 29
  3785 00001A0C E9BE01                   jmp .retn
  3786                                  .checkreg189:
  3787 00001A0F 68[FB1B]                 push checkreg_15
  3788 00001A12 8D062B81                 lea  ax, [symbol]
  3789 00001A16 50                       push ax
  3790 00001A17 E87CE7                   call eqstr
  3791 00001A1A 83C404                   add  sp, 4
  3792 00001A1D 08C0                     or  al, al
  3793 00001A1F 0F840600                 je .checkreg190
  3794 00001A23 B81F00                   mov ax, 31
  3795 00001A26 E9A401                   jmp .retn
  3796                                  
  3797                                  ;-388   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;
  3798                                  
  3799                                  .checkreg190:
  3800 00001A29 68[FE1B]                 push checkreg_16
  3801 00001A2C 8D062B81                 lea  ax, [symbol]
  3802 00001A30 50                       push ax
  3803 00001A31 E862E7                   call eqstr
  3804 00001A34 83C404                   add  sp, 4
  3805 00001A37 08C0                     or  al, al
  3806 00001A39 0F840600                 je .checkreg191
  3807 00001A3D B82100                   mov ax, 33
  3808 00001A40 E98A01                   jmp .retn
  3809                                  .checkreg191:
  3810 00001A43 68[011C]                 push checkreg_17
  3811 00001A46 8D062B81                 lea  ax, [symbol]
  3812 00001A4A 50                       push ax
  3813 00001A4B E848E7                   call eqstr
  3814 00001A4E 83C404                   add  sp, 4
  3815 00001A51 08C0                     or  al, al
  3816 00001A53 0F840600                 je .checkreg192
  3817 00001A57 B82300                   mov ax, 35
  3818 00001A5A E97001                   jmp .retn
  3819                                  
  3820                                  ;-389   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;
  3821                                  
  3822                                  .checkreg192:
  3823 00001A5D 68[041C]                 push checkreg_18
  3824 00001A60 8D062B81                 lea  ax, [symbol]
  3825 00001A64 50                       push ax
  3826 00001A65 E82EE7                   call eqstr
  3827 00001A68 83C404                   add  sp, 4
  3828 00001A6B 08C0                     or  al, al
  3829 00001A6D 0F840600                 je .checkreg193
  3830 00001A71 B82500                   mov ax, 37
  3831 00001A74 E95601                   jmp .retn
  3832                                  .checkreg193:
  3833 00001A77 68[071C]                 push checkreg_19
  3834 00001A7A 8D062B81                 lea  ax, [symbol]
  3835 00001A7E 50                       push ax
  3836 00001A7F E814E7                   call eqstr
  3837 00001A82 83C404                   add  sp, 4
  3838 00001A85 08C0                     or  al, al
  3839 00001A87 0F840600                 je .checkreg194
  3840 00001A8B B82700                   mov ax, 39
  3841 00001A8E E93C01                   jmp .retn
  3842                                  
  3843                                  ;-390   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;
  3844                                  
  3845                                  .checkreg194:
  3846 00001A91 68[0A1C]                 push checkreg_20
  3847 00001A94 8D062B81                 lea  ax, [symbol]
  3848 00001A98 50                       push ax
  3849 00001A99 E8FAE6                   call eqstr
  3850 00001A9C 83C404                   add  sp, 4
  3851 00001A9F 08C0                     or  al, al
  3852 00001AA1 0F840600                 je .checkreg195
  3853 00001AA5 B82900                   mov ax, 41
  3854 00001AA8 E92201                   jmp .retn
  3855                                  .checkreg195:
  3856 00001AAB 68[0D1C]                 push checkreg_21
  3857 00001AAE 8D062B81                 lea  ax, [symbol]
  3858 00001AB2 50                       push ax
  3859 00001AB3 E8E0E6                   call eqstr
  3860 00001AB6 83C404                   add  sp, 4
  3861 00001AB9 08C0                     or  al, al
  3862 00001ABB 0F840600                 je .checkreg196
  3863 00001ABF B82B00                   mov ax, 43
  3864 00001AC2 E90801                   jmp .retn
  3865                                  
  3866                                  ;-391   // (eqstr(symbol,"ip")) return 45;
  3867                                  
  3868                                  
  3869                                  ;-392   if (strlen(symbol) >   3) return 0;
  3870                                  
  3871                                  .checkreg196:
  3872 00001AC5 8D062B81                 lea  ax, [symbol]
  3873 00001AC9 50                       push ax
  3874 00001ACA E871E6                   call strlen
  3875 00001ACD 83C402                   add  sp, 2
  3876 00001AD0 83F803                   cmp ax, 3
  3877 00001AD3 0F8E0600                 jle .checkreg197
  3878 00001AD7 B80000                   mov ax, 0
  3879 00001ADA E9F000                   jmp .retn
  3880                                  
  3881                                  ;-393   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;
  3882                                  
  3883                                  .checkreg197:
  3884 00001ADD 68[101C]                 push checkreg_22
  3885 00001AE0 8D062B81                 lea  ax, [symbol]
  3886 00001AE4 50                       push ax
  3887 00001AE5 E8AEE6                   call eqstr
  3888 00001AE8 83C404                   add  sp, 4
  3889 00001AEB 08C0                     or  al, al
  3890 00001AED 0F840600                 je .checkreg198
  3891 00001AF1 B82F00                   mov ax, 47
  3892 00001AF4 E9D600                   jmp .retn
  3893                                  .checkreg198:
  3894 00001AF7 68[141C]                 push checkreg_23
  3895 00001AFA 8D062B81                 lea  ax, [symbol]
  3896 00001AFE 50                       push ax
  3897 00001AFF E894E6                   call eqstr
  3898 00001B02 83C404                   add  sp, 4
  3899 00001B05 08C0                     or  al, al
  3900 00001B07 0F840600                 je .checkreg199
  3901 00001B0B B83200                   mov ax, 50
  3902 00001B0E E9BC00                   jmp .retn
  3903                                  
  3904                                  ;-394   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;
  3905                                  
  3906                                  .checkreg199:
  3907 00001B11 68[181C]                 push checkreg_24
  3908 00001B14 8D062B81                 lea  ax, [symbol]
  3909 00001B18 50                       push ax
  3910 00001B19 E87AE6                   call eqstr
  3911 00001B1C 83C404                   add  sp, 4
  3912 00001B1F 08C0                     or  al, al
  3913 00001B21 0F840600                 je .checkreg200
  3914 00001B25 B83500                   mov ax, 53
  3915 00001B28 E9A200                   jmp .retn
  3916                                  .checkreg200:
  3917 00001B2B 68[1C1C]                 push checkreg_25
  3918 00001B2E 8D062B81                 lea  ax, [symbol]
  3919 00001B32 50                       push ax
  3920 00001B33 E860E6                   call eqstr
  3921 00001B36 83C404                   add  sp, 4
  3922 00001B39 08C0                     or  al, al
  3923 00001B3B 0F840600                 je .checkreg201
  3924 00001B3F B83800                   mov ax, 56
  3925 00001B42 E98800                   jmp .retn
  3926                                  
  3927                                  ;-395   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;
  3928                                  
  3929                                  .checkreg201:
  3930 00001B45 68[201C]                 push checkreg_26
  3931 00001B48 8D062B81                 lea  ax, [symbol]
  3932 00001B4C 50                       push ax
  3933 00001B4D E846E6                   call eqstr
  3934 00001B50 83C404                   add  sp, 4
  3935 00001B53 08C0                     or  al, al
  3936 00001B55 0F840600                 je .checkreg202
  3937 00001B59 B83B00                   mov ax, 59
  3938 00001B5C E96E00                   jmp .retn
  3939                                  .checkreg202:
  3940 00001B5F 68[241C]                 push checkreg_27
  3941 00001B62 8D062B81                 lea  ax, [symbol]
  3942 00001B66 50                       push ax
  3943 00001B67 E82CE6                   call eqstr
  3944 00001B6A 83C404                   add  sp, 4
  3945 00001B6D 08C0                     or  al, al
  3946 00001B6F 0F840600                 je .checkreg203
  3947 00001B73 B83E00                   mov ax, 62
  3948 00001B76 E95400                   jmp .retn
  3949                                  
  3950                                  ;-396   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;
  3951                                  
  3952                                  .checkreg203:
  3953 00001B79 68[281C]                 push checkreg_28
  3954 00001B7C 8D062B81                 lea  ax, [symbol]
  3955 00001B80 50                       push ax
  3956 00001B81 E812E6                   call eqstr
  3957 00001B84 83C404                   add  sp, 4
  3958 00001B87 08C0                     or  al, al
  3959 00001B89 0F840600                 je .checkreg204
  3960 00001B8D B84100                   mov ax, 65
  3961 00001B90 E93A00                   jmp .retn
  3962                                  .checkreg204:
  3963 00001B93 68[2C1C]                 push checkreg_29
  3964 00001B96 8D062B81                 lea  ax, [symbol]
  3965 00001B9A 50                       push ax
  3966 00001B9B E8F8E5                   call eqstr
  3967 00001B9E 83C404                   add  sp, 4
  3968 00001BA1 08C0                     or  al, al
  3969 00001BA3 0F840600                 je .checkreg205
  3970 00001BA7 B84400                   mov ax, 68
  3971 00001BAA E92000                   jmp .retn
  3972                                  
  3973                                  ;-397   if (eqstr(symbol,"cr0")) return 71;
  3974                                  
  3975                                  .checkreg205:
  3976 00001BAD 68[301C]                 push checkreg_30
  3977 00001BB0 8D062B81                 lea  ax, [symbol]
  3978 00001BB4 50                       push ax
  3979 00001BB5 E8DEE5                   call eqstr
  3980 00001BB8 83C404                   add  sp, 4
  3981 00001BBB 08C0                     or  al, al
  3982 00001BBD 0F840600                 je .checkreg206
  3983 00001BC1 B84700                   mov ax, 71
  3984 00001BC4 E90600                   jmp .retn
  3985                                  
  3986                                  ;-398   return 0;   }
  3987                                  
  3988                                  .checkreg206:
  3989 00001BC7 B80000                   mov ax, 0
  3990 00001BCA E90000                   jmp .retn
  3991                                  
  3992                                  ;-399 char printregstr[]
  3993                                  
  3994                                   .retn:
  3995 00001BCD C3                       ret
  3996                                  ; ENDP
  3997 00001BCE 616C00                  checkreg_0 db "al",0
  3998 00001BD1 636C00                  checkreg_1 db "cl",0
  3999 00001BD4 646C00                  checkreg_2 db "dl",0
  4000 00001BD7 626C00                  checkreg_3 db "bl",0
  4001 00001BDA 616800                  checkreg_4 db "ah",0
  4002 00001BDD 636800                  checkreg_5 db "ch",0
  4003 00001BE0 646800                  checkreg_6 db "dh",0
  4004 00001BE3 626800                  checkreg_7 db "bh",0
  4005 00001BE6 617800                  checkreg_8 db "ax",0
  4006 00001BE9 637800                  checkreg_9 db "cx",0
  4007 00001BEC 647800                  checkreg_10 db "dx",0
  4008 00001BEF 627800                  checkreg_11 db "bx",0
  4009 00001BF2 737000                  checkreg_12 db "sp",0
  4010 00001BF5 627000                  checkreg_13 db "bp",0
  4011 00001BF8 736900                  checkreg_14 db "si",0
  4012 00001BFB 646900                  checkreg_15 db "di",0
  4013 00001BFE 657300                  checkreg_16 db "es",0
  4014 00001C01 637300                  checkreg_17 db "cs",0
  4015 00001C04 737300                  checkreg_18 db "ss",0
  4016 00001C07 647300                  checkreg_19 db "ds",0
  4017 00001C0A 667300                  checkreg_20 db "fs",0
  4018 00001C0D 677300                  checkreg_21 db "gs",0
  4019 00001C10 65617800                checkreg_22 db "eax",0
  4020 00001C14 65637800                checkreg_23 db "ecx",0
  4021 00001C18 65647800                checkreg_24 db "edx",0
  4022 00001C1C 65627800                checkreg_25 db "ebx",0
  4023 00001C20 65737000                checkreg_26 db "esp",0
  4024 00001C24 65627000                checkreg_27 db "ebp",0
  4025 00001C28 65736900                checkreg_28 db "esi",0
  4026 00001C2C 65646900                checkreg_29 db "edi",0
  4027 00001C30 63723000                checkreg_30 db "cr0",0
  4028                                  
  4029                                  ;-400 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";
  4030                                  
  4031 00001C34 2A616C636C646C626C-     printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0
  4032 00001C3D 616863686468626861-
  4033 00001C46 786378647862787370-
  4034 00001C4F 627073696469657363-
  4035 00001C58 737373647366736773-
  4036 00001C61 697065617865637865-
  4037 00001C6A 647865627865737065-
  4038 00001C73 627065736965646963-
  4039 00001C7C 723000             
  4040                                  
  4041                                  ;-401 //          1         2         3         4         5         6         7
  4042                                  
  4043                                  
  4044                                  ;-402 // 1 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3
  4045                                  
  4046                                  
  4047                                  ;-403 int printreg(int i) {  unsigned int k; unsigned char c;
  4048                                  
  4049                                  
  4050                                  printreg:  ; *** PROC ***
  4051                                  
  4052                                  ;-404   k = &printregstr + i; c=*k; prc(c); i++;
  4053                                  
  4054                                  ;Function : printreg, Number of local variables: 3
  4055                                  ;   # type sign width addr used name   list of local variables
  4056                                  ;  200 var sign word   403 NULL i = bp+4
  4057                                  ;  201 var unsg word   403 NULL k = bp-2
  4058                                  ;  202 var unsg byte   403 NULL c = bp-4;
  4059 00001C7F C8040000                 ENTER  4,0
  4060 00001C83 B8[341C]                 mov ax, printregstr
  4061 00001C86 034604                   add ax, [bp+4]
  4062 00001C89 8946FE                   mov [bp-2], ax
  4063 00001C8C 8B5EFE                   mov bx, [bp-2]
  4064 00001C8F 8B07                     mov ax, [bx]
  4065 00001C91 8846FC                   mov [bp-4], al
  4066 00001C94 8A46FC                   mov al, byte [bp-4]
  4067 00001C97 B400                     mov ah, 0
  4068 00001C99 50                       push ax
  4069 00001C9A E82028                   call prc
  4070 00001C9D 83C402                   add  sp, 2
  4071 00001CA0 FF4604                   inc  word[bp+4]
  4072                                  
  4073                                  ;-405   k = &printregstr + i; c=*k; prc(c);
  4074                                  
  4075 00001CA3 B8[341C]                 mov ax, printregstr
  4076 00001CA6 034604                   add ax, [bp+4]
  4077 00001CA9 8946FE                   mov [bp-2], ax
  4078 00001CAC 8B5EFE                   mov bx, [bp-2]
  4079 00001CAF 8B07                     mov ax, [bx]
  4080 00001CB1 8846FC                   mov [bp-4], al
  4081 00001CB4 8A46FC                   mov al, byte [bp-4]
  4082 00001CB7 B400                     mov ah, 0
  4083 00001CB9 50                       push ax
  4084 00001CBA E80028                   call prc
  4085 00001CBD 83C402                   add  sp, 2
  4086                                  
  4087                                  ;-406   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }
  4088                                  
  4089 00001CC0 8B4604                   mov ax, [bp+4]
  4090 00001CC3 83F82F                   cmp ax, 47
  4091 00001CC6 0F8E2000                 jle .printreg207
  4092 00001CCA FF4604                   inc  word[bp+4]
  4093 00001CCD B8[341C]                 mov ax, printregstr
  4094 00001CD0 034604                   add ax, [bp+4]
  4095 00001CD3 8946FE                   mov [bp-2], ax
  4096 00001CD6 8B5EFE                   mov bx, [bp-2]
  4097 00001CD9 8B07                     mov ax, [bx]
  4098 00001CDB 8846FC                   mov [bp-4], al
  4099 00001CDE 8A46FC                   mov al, byte [bp-4]
  4100 00001CE1 B400                     mov ah, 0
  4101 00001CE3 50                       push ax
  4102 00001CE4 E8D627                   call prc
  4103 00001CE7 83C402                   add  sp, 2
  4104                                  
  4105                                  ;-407 }
  4106                                  
  4107                                  .printreg207:
  4108                                  
  4109                                  ;-408 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
  4110 00001CEA C9                       LEAVE
  4111 00001CEB C3                       ret
  4112                                  ; ENDP
  4113 00001CEC 0000                    evalue dw 0
  4114 00001CEE 0A00                    exprtype dw 10
  4115                                  
  4116                                  ;-409 int expr(int isRight)
  4117                                  
  4118                                  
  4119                                  expr:  ; *** PROC ***
  4120                                  
  4121                                  ;-410 { int mode; int id1;     int ixarr; int ixconst;
  4122                                  
  4123                                  
  4124                                  ;-411   int ids;  int isCONST; int i;     unsigned char *p;
  4125                                  
  4126                                  
  4127                                  ;-412   if (istoken(T_CONST)) { evalue=lexval;
  4128                                  
  4129                                  ;Function : expr, Number of local variables: 9
  4130                                  ;   # type sign width addr used name   list of local variables
  4131                                  ;  200 var sign word   409 NULL isRight = bp+4
  4132                                  ;  201 var sign word   410 NULL mode = bp-2
  4133                                  ;  202 var sign word   410 NULL id1 = bp-4
  4134                                  ;  203 var sign word   410 NULL ixarr = bp-6
  4135                                  ;  204 var sign word   410 NULL ixconst = bp-8
  4136                                  ;  205 var sign word   411 NULL ids = bp-10
  4137                                  ;  206 var sign word   411 NULL isCONST = bp-12
  4138                                  ;  207 var sign word   411 NULL i = bp-14
  4139                                  ;  208 ptr unsg byte   411 NULL p = bp-16;
  4140 00001CF0 C8100000                 ENTER  16,0
  4141 00001CF4 680101                   push 257
  4142 00001CF7 E8F526                   call istoken
  4143 00001CFA 83C402                   add  sp, 2
  4144 00001CFD 08C0                     or  al, al
  4145 00001CFF 0F841F00                 je .expr208
  4146 00001D03 A1[2E00]                 mov ax, [lexval]
  4147 00001D06 A3[EC1C]                 mov word [evalue], ax
  4148                                  
  4149                                  ;-413     prs("\n mov ax, "); prunsign1(lexval); return 4; }
  4150                                  
  4151 00001D09 68[9020]                 push expr_0
  4152 00001D0C E81528                   call prs
  4153 00001D0F 83C402                   add  sp, 2
  4154 00001D12 FF36[2E00]               push word [lexval]
  4155 00001D16 E86529                   call prunsign1
  4156 00001D19 83C402                   add  sp, 2
  4157 00001D1C B80400                   mov ax, 4
  4158 00001D1F E96C03                   jmp .retn
  4159                                  
  4160                                  ;-414   mode=typeName(); /*0=V,1=*,2=&*/
  4161                                  
  4162                                  .expr208:
  4163 00001D22 E868ED                   call typeName
  4164 00001D25 8946FE                   mov [bp-2], ax
  4165                                  
  4166                                  ;-415   ireg1=checkreg();
  4167                                  
  4168 00001D28 E846FB                   call checkreg
  4169 00001D2B A3[8810]                 mov word [ireg1], ax
  4170                                  
  4171                                  ;-416   if (ireg1) { doreg1(0); return; }
  4172                                  
  4173 00001D2E A1[8810]                 mov ax, [ireg1]
  4174 00001D31 08C0                     or  al, al
  4175 00001D33 0F840B00                 je .expr209
  4176 00001D37 6A00                     push 0
  4177 00001D39 E849F9                   call doreg1
  4178 00001D3C 83C402                   add  sp, 2
  4179 00001D3F E94C03                   jmp .retn
  4180                                  
  4181                                  ;-417   if (token=='(')  {docall1(); goto e1; }
  4182                                  
  4183                                  .expr209:
  4184 00001D42 A1[1C00]                 mov ax, [token]
  4185 00001D45 83F828                   cmp ax, 40
  4186 00001D48 0F850600                 jne .expr210
  4187 00001D4C E82E0F                   call docall1
  4188 00001D4F E93202                   jmp .e1
  4189                                  
  4190                                  ;-418   if (isreg()) goto e1;
  4191                                  
  4192                                  .expr210:
  4193 00001D52 E88307                   call isreg
  4194 00001D55 08C0                     or  al, al
  4195 00001D57 0F840300                 je .expr211
  4196 00001D5B E92602                   jmp .e1
  4197                                  
  4198                                  ;-419 
  4199                                  
  4200                                  
  4201                                  ;-420   id1=searchname(); gettypes(id1); ids=signi;
  4202                                  
  4203                                  .expr211:
  4204 00001D5E E85DEC                   call searchname
  4205 00001D61 8946FC                   mov [bp-4], ax
  4206 00001D64 FF76FC                   push word [bp-4]
  4207 00001D67 E816EB                   call gettypes
  4208 00001D6A 83C402                   add  sp, 2
  4209 00001D6D A1[3300]                 mov ax, [signi]
  4210 00001D70 8946F6                   mov [bp-10], ax
  4211                                  
  4212                                  ;-421   ixarr=0;  ixconst=0;
  4213                                  
  4214 00001D73 B80000                   mov ax, 0
  4215 00001D76 8946FA                   mov [bp-6], ax
  4216 00001D79 B80000                   mov ax, 0
  4217 00001D7C 8946F8                   mov [bp-8], ax
  4218                                  
  4219                                  ;-422     if (istoken('[')) { if (istoken(T_CONST)) {
  4220                                  
  4221 00001D7F 6A5B                     push 91
  4222 00001D81 E86B26                   call istoken
  4223 00001D84 83C402                   add  sp, 2
  4224 00001D87 08C0                     or  al, al
  4225 00001D89 0F845900                 je .expr212
  4226 00001D8D 680101                   push 257
  4227 00001D90 E85C26                   call istoken
  4228 00001D93 83C402                   add  sp, 2
  4229 00001D96 08C0                     or  al, al
  4230 00001D98 0F841700                 je .expr213
  4231                                  
  4232                                  ;-423       ixconst=1; ixarr=lexval; expect(']');  }
  4233                                  
  4234 00001D9C B80100                   mov ax, 1
  4235 00001D9F 8946F8                   mov [bp-8], ax
  4236 00001DA2 A1[2E00]                 mov ax, [lexval]
  4237 00001DA5 8946FA                   mov [bp-6], ax
  4238 00001DA8 6A5D                     push 93
  4239 00001DAA E86426                   call expect
  4240 00001DAD 83C402                   add  sp, 2
  4241                                  
  4242                                  ;-424     else {ixarr=searchname(); expect(T_NAME); expect(']');
  4243                                  
  4244 00001DB0 E93300                   jmp .expr214
  4245                                  .expr213:
  4246 00001DB3 E808EC                   call searchname
  4247 00001DB6 8946FA                   mov [bp-6], ax
  4248 00001DB9 680001                   push 256
  4249 00001DBC E85226                   call expect
  4250 00001DBF 83C402                   add  sp, 2
  4251 00001DC2 6A5D                     push 93
  4252 00001DC4 E84A26                   call expect
  4253 00001DC7 83C402                   add  sp, 2
  4254                                  
  4255                                  ;-425     gettypes(ixarr);
  4256                                  
  4257 00001DCA FF76FA                   push word [bp-6]
  4258 00001DCD E8B0EA                   call gettypes
  4259 00001DD0 83C402                   add  sp, 2
  4260                                  
  4261                                  ;-426     if (widthi != 2) error1("Arrayindex muss Zahl oder int sein"); } }
  4262                                  
  4263 00001DD3 A1[3600]                 mov ax, [widthi]
  4264 00001DD6 83F802                   cmp ax, 2
  4265 00001DD9 0F840900                 je  .expr215
  4266 00001DDD 68[9C20]                 push expr_1
  4267 00001DE0 E82C2A                   call error1
  4268 00001DE3 83C402                   add  sp, 2
  4269                                  .expr215:
  4270                                  .expr214:
  4271                                  
  4272                                  ;-427   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Nur var erlaubt");
  4273                                  
  4274                                  .expr212:
  4275 00001DE6 68C304                   push 1219
  4276 00001DE9 E80326                   call istoken
  4277 00001DEC 83C402                   add  sp, 2
  4278 00001DEF 08C0                     or  al, al
  4279 00001DF1 0F844600                 je .expr216
  4280 00001DF5 8B46FE                   mov ax, [bp-2]
  4281 00001DF8 08C0                     or  al, al
  4282 00001DFA 0F840900                 je .expr217
  4283 00001DFE 68[BF20]                 push expr_2
  4284 00001E01 E80B2A                   call error1
  4285 00001E04 83C402                   add  sp, 2
  4286                                  
  4287                                  ;-428      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");
  4288                                  
  4289                                  .expr217:
  4290 00001E07 68[CF20]                 push expr_3
  4291 00001E0A E81727                   call prs
  4292 00001E0D 83C402                   add  sp, 2
  4293 00001E10 A1[3900]                 mov ax, [wi]
  4294 00001E13 83F802                   cmp ax, 2
  4295 00001E16 0F850C00                 jne .expr218
  4296 00001E1A 68[D820]                 push expr_4
  4297 00001E1D E80427                   call prs
  4298 00001E20 83C402                   add  sp, 2
  4299 00001E23 E90900                   jmp .expr219
  4300                                  .expr218:
  4301 00001E26 68[DD20]                 push expr_5
  4302 00001E29 E8F826                   call prs
  4303 00001E2C 83C402                   add  sp, 2
  4304                                  
  4305                                  ;-429      v(id1); goto e1;}
  4306                                  
  4307                                  .expr219:
  4308 00001E2F FF76FC                   push word [bp-4]
  4309 00001E32 E89DE5                   call v
  4310 00001E35 83C402                   add  sp, 2
  4311 00001E38 E94901                   jmp .e1
  4312                                  
  4313                                  ;-430   if (istoken(T_MINUSMINUS)) {if(mode)error1("Nur var erlaubt");
  4314                                  
  4315                                  .expr216:
  4316 00001E3B 68C904                   push 1225
  4317 00001E3E E8AE25                   call istoken
  4318 00001E41 83C402                   add  sp, 2
  4319 00001E44 08C0                     or  al, al
  4320 00001E46 0F844600                 je .expr220
  4321 00001E4A 8B46FE                   mov ax, [bp-2]
  4322 00001E4D 08C0                     or  al, al
  4323 00001E4F 0F840900                 je .expr221
  4324 00001E53 68[E220]                 push expr_6
  4325 00001E56 E8B629                   call error1
  4326 00001E59 83C402                   add  sp, 2
  4327                                  
  4328                                  ;-431      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");
  4329                                  
  4330                                  .expr221:
  4331 00001E5C 68[F220]                 push expr_7
  4332 00001E5F E8C226                   call prs
  4333 00001E62 83C402                   add  sp, 2
  4334 00001E65 A1[3900]                 mov ax, [wi]
  4335 00001E68 83F802                   cmp ax, 2
  4336 00001E6B 0F850C00                 jne .expr222
  4337 00001E6F 68[FB20]                 push expr_8
  4338 00001E72 E8AF26                   call prs
  4339 00001E75 83C402                   add  sp, 2
  4340 00001E78 E90900                   jmp .expr223
  4341                                  .expr222:
  4342 00001E7B 68[0021]                 push expr_9
  4343 00001E7E E8A326                   call prs
  4344 00001E81 83C402                   add  sp, 2
  4345                                  
  4346                                  ;-432      v(id1); goto e1;}
  4347                                  
  4348                                  .expr223:
  4349 00001E84 FF76FC                   push word [bp-4]
  4350 00001E87 E848E5                   call v
  4351 00001E8A 83C402                   add  sp, 2
  4352 00001E8D E9F400                   jmp .e1
  4353                                  
  4354                                  ;-433        
  4355                                  
  4356                                  
  4357                                  ;-434   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}
  4358                                  
  4359                                  .expr220:
  4360 00001E90 68CE04                   push 1230
  4361 00001E93 E85925                   call istoken
  4362 00001E96 83C402                   add  sp, 2
  4363 00001E99 08C0                     or  al, al
  4364 00001E9B 0F841200                 je .expr224
  4365 00001E9F FF76FC                   push word [bp-4]
  4366 00001EA2 FF76FE                   push word [bp-2]
  4367 00001EA5 68[0521]                 push expr_10
  4368 00001EA8 E8A802                   call compoundass
  4369 00001EAB 83C406                   add  sp, 6
  4370 00001EAE E9D300                   jmp .e1
  4371                                  
  4372                                  ;-435   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}
  4373                                  
  4374                                  .expr224:
  4375 00001EB1 68CF04                   push 1231
  4376 00001EB4 E83825                   call istoken
  4377 00001EB7 83C402                   add  sp, 2
  4378 00001EBA 08C0                     or  al, al
  4379 00001EBC 0F841200                 je .expr225
  4380 00001EC0 FF76FC                   push word [bp-4]
  4381 00001EC3 FF76FE                   push word [bp-2]
  4382 00001EC6 68[0921]                 push expr_11
  4383 00001EC9 E88702                   call compoundass
  4384 00001ECC 83C406                   add  sp, 6
  4385 00001ECF E9B200                   jmp .e1
  4386                                  
  4387                                  ;-436   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}
  4388                                  
  4389                                  .expr225:
  4390 00001ED2 68D204                   push 1234
  4391 00001ED5 E81725                   call istoken
  4392 00001ED8 83C402                   add  sp, 2
  4393 00001EDB 08C0                     or  al, al
  4394 00001EDD 0F841200                 je .expr226
  4395 00001EE1 FF76FC                   push word [bp-4]
  4396 00001EE4 FF76FE                   push word [bp-2]
  4397 00001EE7 68[0D21]                 push expr_12
  4398 00001EEA E86602                   call compoundass
  4399 00001EED 83C406                   add  sp, 6
  4400 00001EF0 E99100                   jmp .e1
  4401                                  
  4402                                  ;-437   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}    
  4403                                  
  4404                                  .expr226:
  4405 00001EF3 68D304                   push 1235
  4406 00001EF6 E8F624                   call istoken
  4407 00001EF9 83C402                   add  sp, 2
  4408 00001EFC 08C0                     or  al, al
  4409 00001EFE 0F841200                 je .expr227
  4410 00001F02 FF76FC                   push word [bp-4]
  4411 00001F05 FF76FE                   push word [bp-2]
  4412 00001F08 68[1121]                 push expr_13
  4413 00001F0B E84502                   call compoundass
  4414 00001F0E 83C406                   add  sp, 6
  4415 00001F11 E97000                   jmp .e1
  4416                                  
  4417                                  ;-438   if (istoken(T_MULASS    )) {error1("not implemented");}
  4418                                  
  4419                                  .expr227:
  4420 00001F14 68D004                   push 1232
  4421 00001F17 E8D524                   call istoken
  4422 00001F1A 83C402                   add  sp, 2
  4423 00001F1D 08C0                     or  al, al
  4424 00001F1F 0F840900                 je .expr228
  4425 00001F23 68[1421]                 push expr_14
  4426 00001F26 E8E628                   call error1
  4427 00001F29 83C402                   add  sp, 2
  4428                                  
  4429                                  ;-439   if (istoken(T_DIVASS    )) {error1("not implemented");}
  4430                                  
  4431                                  .expr228:
  4432 00001F2C 68D104                   push 1233
  4433 00001F2F E8BD24                   call istoken
  4434 00001F32 83C402                   add  sp, 2
  4435 00001F35 08C0                     or  al, al
  4436 00001F37 0F840900                 je .expr229
  4437 00001F3B 68[2421]                 push expr_15
  4438 00001F3E E8CE28                   call error1
  4439 00001F41 83C402                   add  sp, 2
  4440                                  
  4441                                  ;-440 
  4442                                  
  4443                                  
  4444                                  ;-441   if (istoken('=')) { exprtype= expr(1); 
  4445                                  
  4446                                  .expr229:
  4447 00001F44 6A3D                     push 61
  4448 00001F46 E8A624                   call istoken
  4449 00001F49 83C402                   add  sp, 2
  4450 00001F4C 08C0                     or  al, al
  4451 00001F4E 0F842000                 je .expr230
  4452 00001F52 6A01                     push 1
  4453 00001F54 E899FD                   call expr
  4454 00001F57 83C402                   add  sp, 2
  4455 00001F5A A3[EE1C]                 mov word [exprtype], ax
  4456                                  
  4457                                  ;-442   doassign(mode, id1, ixarr, ixconst); goto e1;  }
  4458                                  
  4459 00001F5D FF76F8                   push word [bp-8]
  4460 00001F60 FF76FA                   push word [bp-6]
  4461 00001F63 FF76FC                   push word [bp-4]
  4462 00001F66 FF76FE                   push word [bp-2]
  4463 00001F69 E85E08                   call doassign
  4464 00001F6C 83C408                   add  sp, 8
  4465 00001F6F E91200                   jmp .e1
  4466                                  
  4467                                  ;-443   dovar1(mode, "mov", ixarr, id1);
  4468                                  
  4469                                  .expr230:
  4470 00001F72 FF76FC                   push word [bp-4]
  4471 00001F75 FF76FA                   push word [bp-6]
  4472 00001F78 68[3421]                 push expr_16
  4473 00001F7B FF76FE                   push word [bp-2]
  4474 00001F7E E87402                   call dovar1
  4475 00001F81 83C408                   add  sp, 8
  4476                                  
  4477                                  ;-444   
  4478                                  
  4479                                  
  4480                                  ;-445 e1:    if (istoken('+')) rterm("add");
  4481                                  
  4482                                  .e1:
  4483 00001F84 6A2B                     push 43
  4484 00001F86 E86624                   call istoken
  4485 00001F89 83C402                   add  sp, 2
  4486 00001F8C 08C0                     or  al, al
  4487 00001F8E 0F840C00                 je .expr231
  4488 00001F92 68[3821]                 push expr_17
  4489 00001F95 E82704                   call rterm
  4490 00001F98 83C402                   add  sp, 2
  4491                                  
  4492                                  ;-446   else if (istoken('-')) rterm("sub" );
  4493                                  
  4494 00001F9B E9CF00                   jmp .expr232
  4495                                  .expr231:
  4496 00001F9E 6A2D                     push 45
  4497 00001FA0 E84C24                   call istoken
  4498 00001FA3 83C402                   add  sp, 2
  4499 00001FA6 08C0                     or  al, al
  4500 00001FA8 0F840C00                 je .expr233
  4501 00001FAC 68[3C21]                 push expr_18
  4502 00001FAF E80D04                   call rterm
  4503 00001FB2 83C402                   add  sp, 2
  4504                                  
  4505                                  ;-447   else if (istoken('&')) rterm("and" );
  4506                                  
  4507 00001FB5 E9B500                   jmp .expr234
  4508                                  .expr233:
  4509 00001FB8 6A26                     push 38
  4510 00001FBA E83224                   call istoken
  4511 00001FBD 83C402                   add  sp, 2
  4512 00001FC0 08C0                     or  al, al
  4513 00001FC2 0F840C00                 je .expr235
  4514 00001FC6 68[4021]                 push expr_19
  4515 00001FC9 E8F303                   call rterm
  4516 00001FCC 83C402                   add  sp, 2
  4517                                  
  4518                                  ;-448   else if (istoken('|')) rterm("or" );  
  4519                                  
  4520 00001FCF E99B00                   jmp .expr236
  4521                                  .expr235:
  4522 00001FD2 6A7C                     push 124
  4523 00001FD4 E81824                   call istoken
  4524 00001FD7 83C402                   add  sp, 2
  4525 00001FDA 08C0                     or  al, al
  4526 00001FDC 0F840C00                 je .expr237
  4527 00001FE0 68[4421]                 push expr_20
  4528 00001FE3 E8D903                   call rterm
  4529 00001FE6 83C402                   add  sp, 2
  4530                                  
  4531                                  ;-449   else if (istoken(T_LESSLESS)) rterm("shl");
  4532                                  
  4533 00001FE9 E98100                   jmp .expr238
  4534                                  .expr237:
  4535 00001FEC 68D804                   push 1240
  4536 00001FEF E8FD23                   call istoken
  4537 00001FF2 83C402                   add  sp, 2
  4538 00001FF5 08C0                     or  al, al
  4539 00001FF7 0F840C00                 je .expr239
  4540 00001FFB 68[4721]                 push expr_21
  4541 00001FFE E8BE03                   call rterm
  4542 00002001 83C402                   add  sp, 2
  4543                                  
  4544                                  ;-450   else if (istoken(T_GREATGREAT)) rterm("shr");  
  4545                                  
  4546 00002004 E96600                   jmp .expr240
  4547                                  .expr239:
  4548 00002007 68D904                   push 1241
  4549 0000200A E8E223                   call istoken
  4550 0000200D 83C402                   add  sp, 2
  4551 00002010 08C0                     or  al, al
  4552 00002012 0F840C00                 je .expr241
  4553 00002016 68[4B21]                 push expr_22
  4554 00002019 E8A303                   call rterm
  4555 0000201C 83C402                   add  sp, 2
  4556                                  
  4557                                  ;-451   else if (istoken('*')) domul (ids);
  4558                                  
  4559 0000201F E94B00                   jmp .expr242
  4560                                  .expr241:
  4561 00002022 6A2A                     push 42
  4562 00002024 E8C823                   call istoken
  4563 00002027 83C402                   add  sp, 2
  4564 0000202A 08C0                     or  al, al
  4565 0000202C 0F840C00                 je .expr243
  4566 00002030 FF76F6                   push word [bp-10]
  4567 00002033 E8DD09                   call domul
  4568 00002036 83C402                   add  sp, 2
  4569                                  
  4570                                  ;-452   else if (istoken('/')) doidiv(ids);
  4571                                  
  4572 00002039 E93100                   jmp .expr244
  4573                                  .expr243:
  4574 0000203C 6A2F                     push 47
  4575 0000203E E8AE23                   call istoken
  4576 00002041 83C402                   add  sp, 2
  4577 00002044 08C0                     or  al, al
  4578 00002046 0F840C00                 je .expr245
  4579 0000204A FF76F6                   push word [bp-10]
  4580 0000204D E8640A                   call doidiv
  4581 00002050 83C402                   add  sp, 2
  4582                                  
  4583                                  ;-453   else if (istoken('%')) domod (ids);
  4584                                  
  4585 00002053 E91700                   jmp .expr246
  4586                                  .expr245:
  4587 00002056 6A25                     push 37
  4588 00002058 E89423                   call istoken
  4589 0000205B 83C402                   add  sp, 2
  4590 0000205E 08C0                     or  al, al
  4591 00002060 0F840900                 je .expr247
  4592 00002064 FF76F6                   push word [bp-10]
  4593 00002067 E8ED0B                   call domod
  4594 0000206A 83C402                   add  sp, 2
  4595                                  
  4596                                  ;-454   if (isrelational()) { rterm("cmp"); cmpneg(ids);}
  4597                                  
  4598                                  .expr247:
  4599                                  .expr246:
  4600                                  .expr244:
  4601                                  .expr242:
  4602                                  .expr240:
  4603                                  .expr238:
  4604                                  .expr236:
  4605                                  .expr234:
  4606                                  .expr232:
  4607 0000206D E8F41B                   call isrelational
  4608 00002070 08C0                     or  al, al
  4609 00002072 0F841200                 je .expr248
  4610 00002076 68[4F21]                 push expr_23
  4611 00002079 E84303                   call rterm
  4612 0000207C 83C402                   add  sp, 2
  4613 0000207F FF76F6                   push word [bp-10]
  4614 00002082 E82C19                   call cmpneg
  4615 00002085 83C402                   add  sp, 2
  4616                                  
  4617                                  ;-455   return 0;
  4618                                  
  4619                                  .expr248:
  4620 00002088 B80000                   mov ax, 0
  4621 0000208B E90000                   jmp .retn
  4622                                  
  4623                                  ;-456 }
  4624                                  
  4625                                  
  4626                                  ;-457 
  4627                                  
  4628                                  
  4629                                  ;-458 int compoundass(char *op, int mode, int id1) {
  4630                                  
  4631 0000208E C9                       .retn: LEAVE
  4632 0000208F C3                       ret
  4633                                  ; ENDP
  4634 00002090 5C6E206D6F76206178-     expr_0 db "\n mov ax, ",0
  4635 00002099 2C2000             
  4636 0000209C 4172726179696E6465-     expr_1 db "Arrayindex muss Zahl oder int sein",0
  4637 000020A5 78206D757373205A61-
  4638 000020AE 686C206F6465722069-
  4639 000020B7 6E74207365696E00   
  4640 000020BF 4E7572207661722065-     expr_2 db "Nur var erlaubt",0
  4641 000020C8 726C6175627400     
  4642 000020CF 5C6E20696E63202000      expr_3 db "\n inc  ",0
  4643 000020D8 776F726400              expr_4 db "word",0
  4644 000020DD 6279746500              expr_5 db "byte",0
  4645 000020E2 4E7572207661722065-     expr_6 db "Nur var erlaubt",0
  4646 000020EB 726C6175627400     
  4647 000020F2 5C6E20646563202000      expr_7 db "\n dec  ",0
  4648 000020FB 776F726400              expr_8 db "word",0
  4649 00002100 6279746500              expr_9 db "byte",0
  4650 00002105 61646400                expr_10 db "add",0
  4651 00002109 73756200                expr_11 db "sub",0
  4652 0000210D 616E6400                expr_12 db "and",0
  4653 00002111 6F7200                  expr_13 db "or",0
  4654 00002114 6E6F7420696D706C65-     expr_14 db "not implemented",0
  4655 0000211D 6D656E74656400     
  4656 00002124 6E6F7420696D706C65-     expr_15 db "not implemented",0
  4657 0000212D 6D656E74656400     
  4658 00002134 6D6F7600                expr_16 db "mov",0
  4659 00002138 61646400                expr_17 db "add",0
  4660 0000213C 73756200                expr_18 db "sub",0
  4661 00002140 616E6400                expr_19 db "and",0
  4662 00002144 6F7200                  expr_20 db "or",0
  4663 00002147 73686C00                expr_21 db "shl",0
  4664 0000214B 73687200                expr_22 db "shr",0
  4665 0000214F 636D7000                expr_23 db "cmp",0
  4666                                  
  4667                                  compoundass:  ; *** PROC ***
  4668                                  
  4669                                  ;-459   if(mode) error1("only scalar Var allowed");
  4670                                  
  4671                                  ;Function : compoundass, Number of local variables: 3
  4672                                  ;   # type sign width addr used name   list of local variables
  4673                                  ;  200 ptr sign byte   458 NULL op = bp+4
  4674                                  ;  201 var sign word   458 NULL mode = bp+6
  4675                                  ;  202 var sign word   458 NULL id1 = bp+8;
  4676 00002153 C8000000                 ENTER  0,0
  4677 00002157 8B4606                   mov ax, [bp+6]
  4678 0000215A 08C0                     or  al, al
  4679 0000215C 0F840900                 je .compoundass249
  4680 00002160 68[CD21]                 push compoundass_0
  4681 00002163 E8A926                   call error1
  4682 00002166 83C402                   add  sp, 2
  4683                                  
  4684                                  ;-460   prnl(); prs(op); prs("  "); 
  4685                                  
  4686                                  .compoundass249:
  4687 00002169 E8AA23                   call prnl
  4688 0000216C FF7604                   push word [bp+4]
  4689 0000216F E8B223                   call prs
  4690 00002172 83C402                   add  sp, 2
  4691 00002175 68[E521]                 push compoundass_1
  4692 00002178 E8A923                   call prs
  4693 0000217B 83C402                   add  sp, 2
  4694                                  
  4695                                  ;-461   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  4696                                  
  4697 0000217E FF7608                   push word [bp+8]
  4698 00002181 E8FCE6                   call gettypes
  4699 00002184 83C402                   add  sp, 2
  4700 00002187 A1[3900]                 mov ax, [wi]
  4701 0000218A 83F802                   cmp ax, 2
  4702 0000218D 0F850C00                 jne .compoundass250
  4703 00002191 68[E821]                 push compoundass_2
  4704 00002194 E88D23                   call prs
  4705 00002197 83C402                   add  sp, 2
  4706 0000219A E90900                   jmp .compoundass251
  4707                                  .compoundass250:
  4708 0000219D 68[ED21]                 push compoundass_3
  4709 000021A0 E88123                   call prs
  4710 000021A3 83C402                   add  sp, 2
  4711                                  
  4712                                  ;-462   v(id1); prs(", ");
  4713                                  
  4714                                  .compoundass251:
  4715 000021A6 FF7608                   push word [bp+8]
  4716 000021A9 E826E2                   call v
  4717 000021AC 83C402                   add  sp, 2
  4718 000021AF 68[F221]                 push compoundass_4
  4719 000021B2 E86F23                   call prs
  4720 000021B5 83C402                   add  sp, 2
  4721                                  
  4722                                  ;-463   expect(T_CONST); prunsign1(lexval);
  4723                                  
  4724 000021B8 680101                   push 257
  4725 000021BB E85322                   call expect
  4726 000021BE 83C402                   add  sp, 2
  4727 000021C1 FF36[2E00]               push word [lexval]
  4728 000021C5 E8B624                   call prunsign1
  4729 000021C8 83C402                   add  sp, 2
  4730                                  
  4731                                  ;-464 }
  4732                                  
  4733                                  
  4734                                  ;-465 int dovar1(int mode, int op, int ixarr, int id1) { 
  4735 000021CB C9                       LEAVE
  4736 000021CC C3                       ret
  4737                                  ; ENDP
  4738 000021CD 6F6E6C79207363616C-     compoundass_0 db "only scalar Var allowed",0
  4739 000021D6 61722056617220616C-
  4740 000021DF 6C6F77656400       
  4741 000021E5 202000                  compoundass_1 db "  ",0
  4742 000021E8 776F726400              compoundass_2 db "word",0
  4743 000021ED 6279746500              compoundass_3 db "byte",0
  4744 000021F2 2C2000                  compoundass_4 db ", ",0
  4745                                  
  4746                                  dovar1:  ; *** PROC ***
  4747                                  
  4748                                  ;-466   gettypes(id1);
  4749                                  
  4750                                  ;Function : dovar1, Number of local variables: 4
  4751                                  ;   # type sign width addr used name   list of local variables
  4752                                  ;  200 var sign word   465 NULL mode = bp+4
  4753                                  ;  201 var sign word   465 NULL op = bp+6
  4754                                  ;  202 var sign word   465 NULL ixarr = bp+8
  4755                                  ;  203 var sign word   465 NULL id1 = bp+10;
  4756 000021F5 C8000000                 ENTER  0,0
  4757 000021F9 FF760A                   push word [bp+10]
  4758 000021FC E881E6                   call gettypes
  4759 000021FF 83C402                   add  sp, 2
  4760                                  
  4761                                  ;-467   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);
  4762                                  
  4763 00002202 8B4604                   mov ax, [bp+4]
  4764 00002205 83F801                   cmp ax, 1
  4765 00002208 0F854700                 jne .dovar1252
  4766 0000220C 68[4A23]                 push dovar1_0
  4767 0000220F E81223                   call prs
  4768 00002212 83C402                   add  sp, 2
  4769 00002215 FF760A                   push word [bp+10]
  4770 00002218 E8B7E1                   call v
  4771 0000221B 83C402                   add  sp, 2
  4772 0000221E E8F522                   call prnl
  4773 00002221 FF7606                   push word [bp+6]
  4774 00002224 E8FD22                   call prs
  4775 00002227 83C402                   add  sp, 2
  4776                                  
  4777                                  ;-468     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");
  4778                                  
  4779 0000222A A1[3600]                 mov ax, [widthi]
  4780 0000222D 83F801                   cmp ax, 1
  4781 00002230 0F850900                 jne .dovar1253
  4782 00002234 68[5623]                 push dovar1_1
  4783 00002237 E8EA22                   call prs
  4784 0000223A 83C402                   add  sp, 2
  4785                                  
  4786                                  ;-469     if(widthi == 2) prs(" ax, [bx]");
  4787                                  
  4788                                  .dovar1253:
  4789 0000223D A1[3600]                 mov ax, [widthi]
  4790 00002240 83F802                   cmp ax, 2
  4791 00002243 0F850900                 jne .dovar1254
  4792 00002247 68[6C23]                 push dovar1_2
  4793 0000224A E8D722                   call prs
  4794 0000224D 83C402                   add  sp, 2
  4795                                  
  4796                                  ;-470     return; }
  4797                                  
  4798                                  .dovar1254:
  4799 00002250 E9F500                   jmp .retn
  4800                                  
  4801                                  ;-471   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }
  4802                                  
  4803                                  .dovar1252:
  4804 00002253 8B4604                   mov ax, [bp+4]
  4805 00002256 83F802                   cmp ax, 2
  4806 00002259 0F852100                 jne .dovar1255
  4807 0000225D E8B622                   call prnl
  4808 00002260 FF7606                   push word [bp+6]
  4809 00002263 E8BE22                   call prs
  4810 00002266 83C402                   add  sp, 2
  4811 00002269 68[7623]                 push dovar1_3
  4812 0000226C E8B522                   call prs
  4813 0000226F 83C402                   add  sp, 2
  4814 00002272 FF760A                   push word [bp+10]
  4815 00002275 E84BE1                   call a
  4816 00002278 83C402                   add  sp, 2
  4817 0000227B E9CA00                   jmp .retn
  4818                                  
  4819                                  ;-472   if (ixarr) {
  4820                                  
  4821                                  .dovar1255:
  4822 0000227E 8B4608                   mov ax, [bp+8]
  4823 00002281 08C0                     or  al, al
  4824 00002283 0F847300                 je .dovar1256
  4825                                  
  4826                                  ;-473     prs("\n mov bx, "); v(ixarr);
  4827                                  
  4828 00002287 68[7C23]                 push dovar1_4
  4829 0000228A E89722                   call prs
  4830 0000228D 83C402                   add  sp, 2
  4831 00002290 FF7608                   push word [bp+8]
  4832 00002293 E83CE1                   call v
  4833 00002296 83C402                   add  sp, 2
  4834                                  
  4835                                  ;-474     if (wi==2) prs("\n shl bx, 1");
  4836                                  
  4837 00002299 A1[3900]                 mov ax, [wi]
  4838 0000229C 83F802                   cmp ax, 2
  4839 0000229F 0F850900                 jne .dovar1257
  4840 000022A3 68[8823]                 push dovar1_5
  4841 000022A6 E87B22                   call prs
  4842 000022A9 83C402                   add  sp, 2
  4843                                  
  4844                                  ;-475     prs("\n "); prs(op);
  4845                                  
  4846                                  .dovar1257:
  4847 000022AC 68[9523]                 push dovar1_6
  4848 000022AF E87222                   call prs
  4849 000022B2 83C402                   add  sp, 2
  4850 000022B5 FF7606                   push word [bp+6]
  4851 000022B8 E86922                   call prs
  4852 000022BB 83C402                   add  sp, 2
  4853                                  
  4854                                  ;-476     if (wi==2) prs(" ax, "); else prs(" al, ");
  4855                                  
  4856 000022BE A1[3900]                 mov ax, [wi]
  4857 000022C1 83F802                   cmp ax, 2
  4858 000022C4 0F850C00                 jne .dovar1258
  4859 000022C8 68[9923]                 push dovar1_7
  4860 000022CB E85622                   call prs
  4861 000022CE 83C402                   add  sp, 2
  4862 000022D1 E90900                   jmp .dovar1259
  4863                                  .dovar1258:
  4864 000022D4 68[9F23]                 push dovar1_8
  4865 000022D7 E84A22                   call prs
  4866 000022DA 83C402                   add  sp, 2
  4867                                  
  4868                                  ;-477 // v(id1); prs(" [bx]");
  4869                                  
  4870                                  
  4871                                  ;-478     prc('['); printName(id1); prs(" + bx]"); 
  4872                                  
  4873                                  .dovar1259:
  4874 000022DD 6A5B                     push 91
  4875 000022DF E8DB21                   call prc
  4876 000022E2 83C402                   add  sp, 2
  4877 000022E5 FF760A                   push word [bp+10]
  4878 000022E8 E86FE6                   call printName
  4879 000022EB 83C402                   add  sp, 2
  4880 000022EE 68[A523]                 push dovar1_9
  4881 000022F1 E83022                   call prs
  4882 000022F4 83C402                   add  sp, 2
  4883                                  
  4884                                  ;-479     return; }
  4885                                  
  4886 000022F7 E94E00                   jmp .retn
  4887                                  
  4888                                  ;-480   prnl();prs(op);
  4889                                  
  4890                                  .dovar1256:
  4891 000022FA E81922                   call prnl
  4892 000022FD FF7606                   push word [bp+6]
  4893 00002300 E82122                   call prs
  4894 00002303 83C402                   add  sp, 2
  4895                                  
  4896                                  ;-481   if(wi==1) prs(" al, ");
  4897                                  
  4898 00002306 A1[3900]                 mov ax, [wi]
  4899 00002309 83F801                   cmp ax, 1
  4900 0000230C 0F850900                 jne .dovar1260
  4901 00002310 68[AC23]                 push dovar1_10
  4902 00002313 E80E22                   call prs
  4903 00002316 83C402                   add  sp, 2
  4904                                  
  4905                                  ;-482   if(wi==2) prs(" ax, ");
  4906                                  
  4907                                  .dovar1260:
  4908 00002319 A1[3900]                 mov ax, [wi]
  4909 0000231C 83F802                   cmp ax, 2
  4910 0000231F 0F850900                 jne .dovar1261
  4911 00002323 68[B223]                 push dovar1_11
  4912 00002326 E8FB21                   call prs
  4913 00002329 83C402                   add  sp, 2
  4914                                  
  4915                                  ;-483   if(wi==4) prs(" eax, ");
  4916                                  
  4917                                  .dovar1261:
  4918 0000232C A1[3900]                 mov ax, [wi]
  4919 0000232F 83F804                   cmp ax, 4
  4920 00002332 0F850900                 jne .dovar1262
  4921 00002336 68[B823]                 push dovar1_12
  4922 00002339 E8E821                   call prs
  4923 0000233C 83C402                   add  sp, 2
  4924                                  
  4925                                  ;-484   v(id1);
  4926                                  
  4927                                  .dovar1262:
  4928 0000233F FF760A                   push word [bp+10]
  4929 00002342 E88DE0                   call v
  4930 00002345 83C402                   add  sp, 2
  4931                                  
  4932                                  ;-485 }
  4933                                  
  4934                                  
  4935                                  ;-486 int rterm(char *op) {int mode; int opint; int ixarr; int id1;
  4936                                  
  4937 00002348 C9                       .retn: LEAVE
  4938 00002349 C3                       ret
  4939                                  ; ENDP
  4940 0000234A 5C6E206D6F76206278-     dovar1_0 db "\n mov bx, ",0
  4941 00002353 2C2000             
  4942 00002356 20616C2C205B62785D-     dovar1_1 db " al, [bx]\n mov ah, 0",0
  4943 0000235F 5C6E206D6F76206168-
  4944 00002368 2C203000           
  4945 0000236C 2061782C205B62785D-     dovar1_2 db " ax, [bx]",0
  4946 00002375 00                 
  4947 00002376 2061782C2000            dovar1_3 db " ax, ",0
  4948 0000237C 5C6E206D6F76206278-     dovar1_4 db "\n mov bx, ",0
  4949 00002385 2C2000             
  4950 00002388 5C6E2073686C206278-     dovar1_5 db "\n shl bx, 1",0
  4951 00002391 2C203100           
  4952 00002395 5C6E2000                dovar1_6 db "\n ",0
  4953 00002399 2061782C2000            dovar1_7 db " ax, ",0
  4954 0000239F 20616C2C2000            dovar1_8 db " al, ",0
  4955 000023A5 202B2062785D00          dovar1_9 db " + bx]",0
  4956 000023AC 20616C2C2000            dovar1_10 db " al, ",0
  4957 000023B2 2061782C2000            dovar1_11 db " ax, ",0
  4958 000023B8 206561782C2000          dovar1_12 db " eax, ",0
  4959                                  
  4960                                  rterm:  ; *** PROC ***
  4961                                  
  4962                                  ;-487   if (istoken(T_CONST)) { prnl(); prs(op); 
  4963                                  
  4964                                  ;Function : rterm, Number of local variables: 5
  4965                                  ;   # type sign width addr used name   list of local variables
  4966                                  ;  200 ptr sign byte   486 NULL op = bp+4
  4967                                  ;  201 var sign word   486 NULL mode = bp-2
  4968                                  ;  202 var sign word   486 NULL opint = bp-4
  4969                                  ;  203 var sign word   486 NULL ixarr = bp-6
  4970                                  ;  204 var sign word   486 NULL id1 = bp-8;
  4971 000023BF C8080000                 ENTER  8,0
  4972 000023C3 680101                   push 257
  4973 000023C6 E82620                   call istoken
  4974 000023C9 83C402                   add  sp, 2
  4975 000023CC 08C0                     or  al, al
  4976 000023CE 0F845200                 je .rterm263
  4977 000023D2 E84121                   call prnl
  4978 000023D5 FF7604                   push word [bp+4]
  4979 000023D8 E84921                   call prs
  4980 000023DB 83C402                   add  sp, 2
  4981                                  
  4982                                  ;-488     if (wi==1) prs(" al, ");
  4983                                  
  4984 000023DE A1[3900]                 mov ax, [wi]
  4985 000023E1 83F801                   cmp ax, 1
  4986 000023E4 0F850900                 jne .rterm264
  4987 000023E8 68[A824]                 push rterm_0
  4988 000023EB E83621                   call prs
  4989 000023EE 83C402                   add  sp, 2
  4990                                  
  4991                                  ;-489     if (wi==2) prs(" ax, ");
  4992                                  
  4993                                  .rterm264:
  4994 000023F1 A1[3900]                 mov ax, [wi]
  4995 000023F4 83F802                   cmp ax, 2
  4996 000023F7 0F850900                 jne .rterm265
  4997 000023FB 68[AE24]                 push rterm_1
  4998 000023FE E82321                   call prs
  4999 00002401 83C402                   add  sp, 2
  5000                                  
  5001                                  ;-490     if (wi==4) prs(" eax, ");
  5002                                  
  5003                                  .rterm265:
  5004 00002404 A1[3900]                 mov ax, [wi]
  5005 00002407 83F804                   cmp ax, 4
  5006 0000240A 0F850900                 jne .rterm266
  5007 0000240E 68[B424]                 push rterm_2
  5008 00002411 E81021                   call prs
  5009 00002414 83C402                   add  sp, 2
  5010                                  
  5011                                  ;-491     prunsign1(lexval); return;}
  5012                                  
  5013                                  .rterm266:
  5014 00002417 FF36[2E00]               push word [lexval]
  5015 0000241B E86022                   call prunsign1
  5016 0000241E 83C402                   add  sp, 2
  5017 00002421 E98200                   jmp .retn
  5018                                  
  5019                                  ;-492   mode=typeName(); id1=searchname(); ixarr=0;
  5020                                  
  5021                                  .rterm263:
  5022 00002424 E866E6                   call typeName
  5023 00002427 8946FE                   mov [bp-2], ax
  5024 0000242A E891E5                   call searchname
  5025 0000242D 8946F8                   mov [bp-8], ax
  5026 00002430 B80000                   mov ax, 0
  5027 00002433 8946FA                   mov [bp-6], ax
  5028                                  
  5029                                  ;-493   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');  
  5030                                  
  5031 00002436 6A5B                     push 91
  5032 00002438 E8B41F                   call istoken
  5033 0000243B 83C402                   add  sp, 2
  5034 0000243E 08C0                     or  al, al
  5035 00002440 0F843300                 je .rterm267
  5036 00002444 E877E5                   call searchname
  5037 00002447 8946FA                   mov [bp-6], ax
  5038 0000244A 680001                   push 256
  5039 0000244D E8C11F                   call expect
  5040 00002450 83C402                   add  sp, 2
  5041 00002453 6A5D                     push 93
  5042 00002455 E8B91F                   call expect
  5043 00002458 83C402                   add  sp, 2
  5044                                  
  5045                                  ;-494     gettypes(ixarr);
  5046                                  
  5047 0000245B FF76FA                   push word [bp-6]
  5048 0000245E E81FE4                   call gettypes
  5049 00002461 83C402                   add  sp, 2
  5050                                  
  5051                                  ;-495     if (widthi != 2) error1("Arrayindex muss int sein"); }
  5052                                  
  5053 00002464 A1[3600]                 mov ax, [widthi]
  5054 00002467 83F802                   cmp ax, 2
  5055 0000246A 0F840900                 je  .rterm268
  5056 0000246E 68[BB24]                 push rterm_3
  5057 00002471 E89B23                   call error1
  5058 00002474 83C402                   add  sp, 2
  5059                                  .rterm268:
  5060                                  
  5061                                  ;-496   if (eqstr(symbol,"_AX")) return;
  5062                                  
  5063                                  .rterm267:
  5064 00002477 68[D424]                 push rterm_4
  5065 0000247A 8D062B81                 lea  ax, [symbol]
  5066 0000247E 50                       push ax
  5067 0000247F E814DD                   call eqstr
  5068 00002482 83C404                   add  sp, 4
  5069 00002485 08C0                     or  al, al
  5070 00002487 0F840300                 je .rterm269
  5071 0000248B E91800                   jmp .retn
  5072                                  
  5073                                  ;-497   opint=op; dovar1(mode, opint, ixarr, id1);
  5074                                  
  5075                                  .rterm269:
  5076 0000248E 8B4604                   mov ax, [bp+4]
  5077 00002491 8946FC                   mov [bp-4], ax
  5078 00002494 FF76F8                   push word [bp-8]
  5079 00002497 FF76FA                   push word [bp-6]
  5080 0000249A FF76FC                   push word [bp-4]
  5081 0000249D FF76FE                   push word [bp-2]
  5082 000024A0 E852FD                   call dovar1
  5083 000024A3 83C408                   add  sp, 8
  5084                                  
  5085                                  ;-498 }
  5086                                  
  5087                                  
  5088                                  ;-499 int isreg() {
  5089                                  
  5090 000024A6 C9                       .retn: LEAVE
  5091 000024A7 C3                       ret
  5092                                  ; ENDP
  5093 000024A8 20616C2C2000            rterm_0 db " al, ",0
  5094 000024AE 2061782C2000            rterm_1 db " ax, ",0
  5095 000024B4 206561782C2000          rterm_2 db " eax, ",0
  5096 000024BB 4172726179696E6465-     rterm_3 db "Arrayindex muss int sein",0
  5097 000024C4 78206D75737320696E-
  5098 000024CD 74207365696E00     
  5099 000024D4 5F415800                rterm_4 db "_AX",0
  5100                                  
  5101                                  isreg:  ; *** PROC ***
  5102                                  
  5103                                  ;-500   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}
  5104                                  
  5105 000024D8 68[C526]                 push isreg_0
  5106 000024DB 8D062B81                 lea  ax, [symbol]
  5107 000024DF 50                       push ax
  5108 000024E0 E8B3DC                   call eqstr
  5109 000024E3 83C404                   add  sp, 4
  5110 000024E6 08C0                     or  al, al
  5111 000024E8 0F840C00                 je .isreg270
  5112 000024EC 68[C926]                 push isreg_1
  5113 000024EF E84202                   call doreg
  5114 000024F2 83C402                   add  sp, 2
  5115 000024F5 E9C601                   jmp .r1
  5116                                  
  5117                                  ;-501   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}  
  5118                                  
  5119                                  .isreg270:
  5120 000024F8 68[CC26]                 push isreg_2
  5121 000024FB 8D062B81                 lea  ax, [symbol]
  5122 000024FF 50                       push ax
  5123 00002500 E893DC                   call eqstr
  5124 00002503 83C404                   add  sp, 4
  5125 00002506 08C0                     or  al, al
  5126 00002508 0F840C00                 je .isreg271
  5127 0000250C 68[D026]                 push isreg_3
  5128 0000250F E82202                   call doreg
  5129 00002512 83C402                   add  sp, 2
  5130 00002515 E9A601                   jmp .r1
  5131                                  
  5132                                  ;-502   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}
  5133                                  
  5134                                  .isreg271:
  5135 00002518 68[D326]                 push isreg_4
  5136 0000251B 8D062B81                 lea  ax, [symbol]
  5137 0000251F 50                       push ax
  5138 00002520 E873DC                   call eqstr
  5139 00002523 83C404                   add  sp, 4
  5140 00002526 08C0                     or  al, al
  5141 00002528 0F840C00                 je .isreg272
  5142 0000252C 68[D726]                 push isreg_5
  5143 0000252F E80202                   call doreg
  5144 00002532 83C402                   add  sp, 2
  5145 00002535 E98601                   jmp .r1
  5146                                  
  5147                                  ;-503   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}
  5148                                  
  5149                                  .isreg272:
  5150 00002538 68[DA26]                 push isreg_6
  5151 0000253B 8D062B81                 lea  ax, [symbol]
  5152 0000253F 50                       push ax
  5153 00002540 E853DC                   call eqstr
  5154 00002543 83C404                   add  sp, 4
  5155 00002546 08C0                     or  al, al
  5156 00002548 0F840C00                 je .isreg273
  5157 0000254C 68[DE26]                 push isreg_7
  5158 0000254F E8E201                   call doreg
  5159 00002552 83C402                   add  sp, 2
  5160 00002555 E96601                   jmp .r1
  5161                                  
  5162                                  ;-504   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}
  5163                                  
  5164                                  .isreg273:
  5165 00002558 68[E126]                 push isreg_8
  5166 0000255B 8D062B81                 lea  ax, [symbol]
  5167 0000255F 50                       push ax
  5168 00002560 E833DC                   call eqstr
  5169 00002563 83C404                   add  sp, 4
  5170 00002566 08C0                     or  al, al
  5171 00002568 0F840C00                 je .isreg274
  5172 0000256C 68[E526]                 push isreg_9
  5173 0000256F E8C201                   call doreg
  5174 00002572 83C402                   add  sp, 2
  5175 00002575 E94601                   jmp .r1
  5176                                  
  5177                                  ;-505   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}    
  5178                                  
  5179                                  .isreg274:
  5180 00002578 68[E826]                 push isreg_10
  5181 0000257B 8D062B81                 lea  ax, [symbol]
  5182 0000257F 50                       push ax
  5183 00002580 E813DC                   call eqstr
  5184 00002583 83C404                   add  sp, 4
  5185 00002586 08C0                     or  al, al
  5186 00002588 0F840C00                 je .isreg275
  5187 0000258C 68[EC26]                 push isreg_11
  5188 0000258F E8A201                   call doreg
  5189 00002592 83C402                   add  sp, 2
  5190 00002595 E92601                   jmp .r1
  5191                                  
  5192                                  ;-506   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}
  5193                                  
  5194                                  .isreg275:
  5195 00002598 68[EF26]                 push isreg_12
  5196 0000259B 8D062B81                 lea  ax, [symbol]
  5197 0000259F 50                       push ax
  5198 000025A0 E8F3DB                   call eqstr
  5199 000025A3 83C404                   add  sp, 4
  5200 000025A6 08C0                     or  al, al
  5201 000025A8 0F840C00                 je .isreg276
  5202 000025AC 68[F326]                 push isreg_13
  5203 000025AF E88201                   call doreg
  5204 000025B2 83C402                   add  sp, 2
  5205 000025B5 E90601                   jmp .r1
  5206                                  
  5207                                  ;-507   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}
  5208                                  
  5209                                  .isreg276:
  5210 000025B8 68[F626]                 push isreg_14
  5211 000025BB 8D062B81                 lea  ax, [symbol]
  5212 000025BF 50                       push ax
  5213 000025C0 E8D3DB                   call eqstr
  5214 000025C3 83C404                   add  sp, 4
  5215 000025C6 08C0                     or  al, al
  5216 000025C8 0F840C00                 je .isreg277
  5217 000025CC 68[FA26]                 push isreg_15
  5218 000025CF E86201                   call doreg
  5219 000025D2 83C402                   add  sp, 2
  5220 000025D5 E9E600                   jmp .r1
  5221                                  
  5222                                  ;-508   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}    
  5223                                  
  5224                                  .isreg277:
  5225 000025D8 68[FD26]                 push isreg_16
  5226 000025DB 8D062B81                 lea  ax, [symbol]
  5227 000025DF 50                       push ax
  5228 000025E0 E8B3DB                   call eqstr
  5229 000025E3 83C404                   add  sp, 4
  5230 000025E6 08C0                     or  al, al
  5231 000025E8 0F840C00                 je .isreg278
  5232 000025EC 68[0127]                 push isreg_17
  5233 000025EF E84201                   call doreg
  5234 000025F2 83C402                   add  sp, 2
  5235 000025F5 E9C600                   jmp .r1
  5236                                  
  5237                                  ;-509   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}
  5238                                  
  5239                                  .isreg278:
  5240 000025F8 68[0427]                 push isreg_18
  5241 000025FB 8D062B81                 lea  ax, [symbol]
  5242 000025FF 50                       push ax
  5243 00002600 E893DB                   call eqstr
  5244 00002603 83C404                   add  sp, 4
  5245 00002606 08C0                     or  al, al
  5246 00002608 0F840C00                 je .isreg279
  5247 0000260C 68[0827]                 push isreg_19
  5248 0000260F E82201                   call doreg
  5249 00002612 83C402                   add  sp, 2
  5250 00002615 E9A600                   jmp .r1
  5251                                  
  5252                                  ;-510   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}
  5253                                  
  5254                                  .isreg279:
  5255 00002618 68[0B27]                 push isreg_20
  5256 0000261B 8D062B81                 lea  ax, [symbol]
  5257 0000261F 50                       push ax
  5258 00002620 E873DB                   call eqstr
  5259 00002623 83C404                   add  sp, 4
  5260 00002626 08C0                     or  al, al
  5261 00002628 0F840C00                 je .isreg280
  5262 0000262C 68[0F27]                 push isreg_21
  5263 0000262F E80201                   call doreg
  5264 00002632 83C402                   add  sp, 2
  5265 00002635 E98600                   jmp .r1
  5266                                  
  5267                                  ;-511   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}  
  5268                                  
  5269                                  .isreg280:
  5270 00002638 68[1227]                 push isreg_22
  5271 0000263B 8D062B81                 lea  ax, [symbol]
  5272 0000263F 50                       push ax
  5273 00002640 E853DB                   call eqstr
  5274 00002643 83C404                   add  sp, 4
  5275 00002646 08C0                     or  al, al
  5276 00002648 0F840C00                 je .isreg281
  5277 0000264C 68[1627]                 push isreg_23
  5278 0000264F E8E200                   call doreg
  5279 00002652 83C402                   add  sp, 2
  5280 00002655 E96600                   jmp .r1
  5281                                  
  5282                                  ;-512   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}
  5283                                  
  5284                                  .isreg281:
  5285 00002658 68[1927]                 push isreg_24
  5286 0000265B 8D062B81                 lea  ax, [symbol]
  5287 0000265F 50                       push ax
  5288 00002660 E833DB                   call eqstr
  5289 00002663 83C404                   add  sp, 4
  5290 00002666 08C0                     or  al, al
  5291 00002668 0F840C00                 je .isreg282
  5292 0000266C 68[1D27]                 push isreg_25
  5293 0000266F E8C200                   call doreg
  5294 00002672 83C402                   add  sp, 2
  5295 00002675 E94600                   jmp .r1
  5296                                  
  5297                                  ;-513   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}
  5298                                  
  5299                                  .isreg282:
  5300 00002678 68[2027]                 push isreg_26
  5301 0000267B 8D062B81                 lea  ax, [symbol]
  5302 0000267F 50                       push ax
  5303 00002680 E813DB                   call eqstr
  5304 00002683 83C404                   add  sp, 4
  5305 00002686 08C0                     or  al, al
  5306 00002688 0F840C00                 je .isreg283
  5307 0000268C 68[2427]                 push isreg_27
  5308 0000268F E8A200                   call doreg
  5309 00002692 83C402                   add  sp, 2
  5310 00002695 E92600                   jmp .r1
  5311                                  
  5312                                  ;-514   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}  
  5313                                  
  5314                                  .isreg283:
  5315 00002698 68[2727]                 push isreg_28
  5316 0000269B 8D062B81                 lea  ax, [symbol]
  5317 0000269F 50                       push ax
  5318 000026A0 E8F3DA                   call eqstr
  5319 000026A3 83C404                   add  sp, 4
  5320 000026A6 08C0                     or  al, al
  5321 000026A8 0F840C00                 je .isreg284
  5322 000026AC 68[2E27]                 push isreg_29
  5323 000026AF E88200                   call doreg
  5324 000026B2 83C402                   add  sp, 2
  5325 000026B5 E90600                   jmp .r1
  5326                                  
  5327                                  ;-515   return 0;   r1: return 1; 
  5328                                  
  5329                                  .isreg284:
  5330 000026B8 B80000                   mov ax, 0
  5331 000026BB E90600                   jmp .retn
  5332                                  .r1:
  5333 000026BE B80100                   mov ax, 1
  5334 000026C1 E90000                   jmp .retn
  5335                                  
  5336                                  ;-516 }
  5337                                  
  5338                                  
  5339                                  ;-517 int doreg(char *dr) { int i; expect('=');
  5340                                  
  5341                                   .retn:
  5342 000026C4 C3                       ret
  5343                                  ; ENDP
  5344 000026C5 5F414800                isreg_0 db "_AH",0
  5345 000026C9 616800                  isreg_1 db "ah",0
  5346 000026CC 5F414C00                isreg_2 db "_AL",0
  5347 000026D0 616C00                  isreg_3 db "al",0
  5348 000026D3 5F415800                isreg_4 db "_AX",0
  5349 000026D7 617800                  isreg_5 db "ax",0
  5350 000026DA 5F424800                isreg_6 db "_BH",0
  5351 000026DE 626800                  isreg_7 db "bh",0
  5352 000026E1 5F424C00                isreg_8 db "_BL",0
  5353 000026E5 626C00                  isreg_9 db "bl",0
  5354 000026E8 5F425800                isreg_10 db "_BX",0
  5355 000026EC 627800                  isreg_11 db "bx",0
  5356 000026EF 5F434800                isreg_12 db "_CH",0
  5357 000026F3 636800                  isreg_13 db "ch",0
  5358 000026F6 5F434C00                isreg_14 db "_CL",0
  5359 000026FA 636C00                  isreg_15 db "cl",0
  5360 000026FD 5F435800                isreg_16 db "_CX",0
  5361 00002701 637800                  isreg_17 db "cx",0
  5362 00002704 5F444800                isreg_18 db "_DH",0
  5363 00002708 646800                  isreg_19 db "dh",0
  5364 0000270B 5F444C00                isreg_20 db "_DL",0
  5365 0000270F 646C00                  isreg_21 db "dl",0
  5366 00002712 5F445800                isreg_22 db "_DX",0
  5367 00002716 647800                  isreg_23 db "dx",0
  5368 00002719 5F534900                isreg_24 db "_SI",0
  5369 0000271D 736900                  isreg_25 db "si",0
  5370 00002720 5F444900                isreg_26 db "_DI",0
  5371 00002724 646900                  isreg_27 db "di",0
  5372 00002727 5F464C41475300          isreg_28 db "_FLAGS",0
  5373 0000272E 666C61677300            isreg_29 db "flags",0
  5374                                  
  5375                                  doreg:  ; *** PROC ***
  5376                                  ;Function : doreg, Number of local variables: 2
  5377                                  ;   # type sign width addr used name   list of local variables
  5378                                  ;  200 ptr sign byte   517 NULL dr = bp+4
  5379                                  ;  201 var sign word   517 NULL i = bp-2;
  5380 00002734 C8020000                 ENTER  2,0
  5381 00002738 6A3D                     push 61
  5382 0000273A E8D41C                   call expect
  5383 0000273D 83C402                   add  sp, 2
  5384                                  
  5385                                  ;-518   prs("\n mov  "); prs(dr); prs(", ");
  5386                                  
  5387 00002740 68[A327]                 push doreg_0
  5388 00002743 E8DE1D                   call prs
  5389 00002746 83C402                   add  sp, 2
  5390 00002749 FF7604                   push word [bp+4]
  5391 0000274C E8D51D                   call prs
  5392 0000274F 83C402                   add  sp, 2
  5393 00002752 68[AC27]                 push doreg_1
  5394 00002755 E8CC1D                   call prs
  5395 00002758 83C402                   add  sp, 2
  5396                                  
  5397                                  ;-519        if (istoken(T_CONST)) prunsign1(lexval);
  5398                                  
  5399 0000275B 680101                   push 257
  5400 0000275E E88E1C                   call istoken
  5401 00002761 83C402                   add  sp, 2
  5402 00002764 08C0                     or  al, al
  5403 00002766 0F840D00                 je .doreg285
  5404 0000276A FF36[2E00]               push word [lexval]
  5405 0000276E E80D1F                   call prunsign1
  5406 00002771 83C402                   add  sp, 2
  5407                                  
  5408                                  ;-520   else if (istoken(T_NAME )) { i=searchname(); v(i); }
  5409                                  
  5410 00002774 E92A00                   jmp .doreg286
  5411                                  .doreg285:
  5412 00002777 680001                   push 256
  5413 0000277A E8721C                   call istoken
  5414 0000277D 83C402                   add  sp, 2
  5415 00002780 08C0                     or  al, al
  5416 00002782 0F841200                 je .doreg287
  5417 00002786 E835E2                   call searchname
  5418 00002789 8946FE                   mov [bp-2], ax
  5419 0000278C FF76FE                   push word [bp-2]
  5420 0000278F E840DC                   call v
  5421 00002792 83C402                   add  sp, 2
  5422                                  
  5423                                  ;-521   else error1("only number or var allowed"); }
  5424                                  
  5425 00002795 E90900                   jmp .doreg288
  5426                                  .doreg287:
  5427 00002798 68[AF27]                 push doreg_2
  5428 0000279B E87120                   call error1
  5429 0000279E 83C402                   add  sp, 2
  5430                                  .doreg288:
  5431                                  .doreg286:
  5432                                  
  5433                                  ;-522 
  5434                                  
  5435                                  
  5436                                  ;-523 int doassign(int mode, int i, int ixarr, int ixconst) {
  5437 000027A1 C9                       LEAVE
  5438 000027A2 C3                       ret
  5439                                  ; ENDP
  5440 000027A3 5C6E206D6F76202000      doreg_0 db "\n mov  ",0
  5441 000027AC 2C2000                  doreg_1 db ", ",0
  5442 000027AF 6F6E6C79206E756D62-     doreg_2 db "only number or var allowed",0
  5443 000027B8 6572206F7220766172-
  5444 000027C1 20616C6C6F77656400 
  5445                                  
  5446                                  doassign:  ; *** PROC ***
  5447                                  
  5448                                  ;-524   gettypes(i);
  5449                                  
  5450                                  ;Function : doassign, Number of local variables: 4
  5451                                  ;   # type sign width addr used name   list of local variables
  5452                                  ;  200 var sign word   523 NULL mode = bp+4
  5453                                  ;  201 var sign word   523 NULL i = bp+6
  5454                                  ;  202 var sign word   523 NULL ixarr = bp+8
  5455                                  ;  203 var sign word   523 NULL ixconst = bp+10;
  5456 000027CA C8000000                 ENTER  0,0
  5457 000027CE FF7606                   push word [bp+6]
  5458 000027D1 E8ACE0                   call gettypes
  5459 000027D4 83C402                   add  sp, 2
  5460                                  
  5461                                  ;-525   if (mode==1) {prs("\n mov  bx, ");v(i);                  
  5462                                  
  5463 000027D7 8B4604                   mov ax, [bp+4]
  5464 000027DA 83F801                   cmp ax, 1
  5465 000027DD 0F853400                 jne .doassign289
  5466 000027E1 68[6729]                 push doassign_0
  5467 000027E4 E83D1D                   call prs
  5468 000027E7 83C402                   add  sp, 2
  5469 000027EA FF7606                   push word [bp+6]
  5470 000027ED E8E2DB                   call v
  5471 000027F0 83C402                   add  sp, 2
  5472                                  
  5473                                  ;-526     if (widthi == 2) prs("\n mov  [bx], ax");
  5474                                  
  5475 000027F3 A1[3600]                 mov ax, [widthi]
  5476 000027F6 83F802                   cmp ax, 2
  5477 000027F9 0F850C00                 jne .doassign290
  5478 000027FD 68[7429]                 push doassign_1
  5479 00002800 E8211D                   call prs
  5480 00002803 83C402                   add  sp, 2
  5481                                  
  5482                                  ;-527     else  prs("\n mov  [bx], al"); return;}
  5483                                  
  5484 00002806 E90900                   jmp .doassign291
  5485                                  .doassign290:
  5486 00002809 68[8529]                 push doassign_2
  5487 0000280C E8151D                   call prs
  5488 0000280F 83C402                   add  sp, 2
  5489                                  .doassign291:
  5490 00002812 E95001                   jmp .retn
  5491                                  
  5492                                  ;-528   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}
  5493                                  
  5494                                  .doassign289:
  5495 00002815 8B4604                   mov ax, [bp+4]
  5496 00002818 83F802                   cmp ax, 2
  5497 0000281B 0F851E00                 jne .doassign292
  5498 0000281F 68[9629]                 push doassign_3
  5499 00002822 E8FF1C                   call prs
  5500 00002825 83C402                   add  sp, 2
  5501 00002828 FF7606                   push word [bp+6]
  5502 0000282B E895DB                   call a
  5503 0000282E 83C402                   add  sp, 2
  5504 00002831 68[9F29]                 push doassign_4
  5505 00002834 E8ED1C                   call prs
  5506 00002837 83C402                   add  sp, 2
  5507 0000283A E92801                   jmp .retn
  5508                                  
  5509                                  ;-529   if (ixarr) {  prs("\n mov bx, ");
  5510                                  
  5511                                  .doassign292:
  5512 0000283D 8B4608                   mov ax, [bp+8]
  5513 00002840 08C0                     or  al, al
  5514 00002842 0F846E00                 je .doassign293
  5515 00002846 68[A429]                 push doassign_5
  5516 00002849 E8D81C                   call prs
  5517 0000284C 83C402                   add  sp, 2
  5518                                  
  5519                                  ;-530     if(ixconst) prunsign1(ixarr); else v(ixarr);
  5520                                  
  5521 0000284F 8B460A                   mov ax, [bp+10]
  5522 00002852 08C0                     or  al, al
  5523 00002854 0F840C00                 je .doassign294
  5524 00002858 FF7608                   push word [bp+8]
  5525 0000285B E8201E                   call prunsign1
  5526 0000285E 83C402                   add  sp, 2
  5527 00002861 E90900                   jmp .doassign295
  5528                                  .doassign294:
  5529 00002864 FF7608                   push word [bp+8]
  5530 00002867 E868DB                   call v
  5531 0000286A 83C402                   add  sp, 2
  5532                                  
  5533                                  ;-531     if (wi==2) prs("\n shl bx, 1");
  5534                                  
  5535                                  .doassign295:
  5536 0000286D A1[3900]                 mov ax, [wi]
  5537 00002870 83F802                   cmp ax, 2
  5538 00002873 0F850900                 jne .doassign296
  5539 00002877 68[B029]                 push doassign_6
  5540 0000287A E8A71C                   call prs
  5541 0000287D 83C402                   add  sp, 2
  5542                                  
  5543                                  ;-532     prs("\n mov ["); printName(i);
  5544                                  
  5545                                  .doassign296:
  5546 00002880 68[BD29]                 push doassign_7
  5547 00002883 E89E1C                   call prs
  5548 00002886 83C402                   add  sp, 2
  5549 00002889 FF7606                   push word [bp+6]
  5550 0000288C E8CBE0                   call printName
  5551 0000288F 83C402                   add  sp, 2
  5552                                  
  5553                                  ;-533     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }
  5554                                  
  5555 00002892 A1[3900]                 mov ax, [wi]
  5556 00002895 83F802                   cmp ax, 2
  5557 00002898 0F850C00                 jne .doassign297
  5558 0000289C 68[C629]                 push doassign_8
  5559 0000289F E8821C                   call prs
  5560 000028A2 83C402                   add  sp, 2
  5561 000028A5 E90900                   jmp .doassign298
  5562                                  .doassign297:
  5563 000028A8 68[CF29]                 push doassign_9
  5564 000028AB E8761C                   call prs
  5565 000028AE 83C402                   add  sp, 2
  5566                                  .doassign298:
  5567 000028B1 E9B100                   jmp .retn
  5568                                  
  5569                                  ;-534   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");
  5570                                  
  5571                                  .doassign293:
  5572 000028B4 A1[3900]                 mov ax, [wi]
  5573 000028B7 83F801                   cmp ax, 1
  5574 000028BA 0F853100                 jne .doassign299
  5575 000028BE 68[D829]                 push doassign_10
  5576 000028C1 E8601C                   call prs
  5577 000028C4 83C402                   add  sp, 2
  5578 000028C7 8B4606                   mov ax, [bp+6]
  5579 000028CA 3DC800                   cmp ax, 200
  5580 000028CD 0F8D0900                 jge .doassign300
  5581 000028D1 68[E029]                 push doassign_11
  5582 000028D4 E84D1C                   call prs
  5583 000028D7 83C402                   add  sp, 2
  5584                                  
  5585                                  ;-535     } v(i); prs(", al"); return; }
  5586                                  
  5587                                  .doassign300:
  5588 000028DA FF7606                   push word [bp+6]
  5589 000028DD E8F2DA                   call v
  5590 000028E0 83C402                   add  sp, 2
  5591 000028E3 68[E629]                 push doassign_12
  5592 000028E6 E83B1C                   call prs
  5593 000028E9 83C402                   add  sp, 2
  5594 000028EC E97600                   jmp .retn
  5595                                  
  5596                                  ;-536   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");
  5597                                  
  5598                                  .doassign299:
  5599 000028EF A1[3900]                 mov ax, [wi]
  5600 000028F2 83F802                   cmp ax, 2
  5601 000028F5 0F853100                 jne .doassign301
  5602 000028F9 68[EB29]                 push doassign_13
  5603 000028FC E8251C                   call prs
  5604 000028FF 83C402                   add  sp, 2
  5605 00002902 8B4606                   mov ax, [bp+6]
  5606 00002905 3DC800                   cmp ax, 200
  5607 00002908 0F8D0900                 jge .doassign302
  5608 0000290C 68[F329]                 push doassign_14
  5609 0000290F E8121C                   call prs
  5610 00002912 83C402                   add  sp, 2
  5611                                  
  5612                                  ;-537     } v(i); prs(", ax"); return; }
  5613                                  
  5614                                  .doassign302:
  5615 00002915 FF7606                   push word [bp+6]
  5616 00002918 E8B7DA                   call v
  5617 0000291B 83C402                   add  sp, 2
  5618 0000291E 68[F929]                 push doassign_15
  5619 00002921 E8001C                   call prs
  5620 00002924 83C402                   add  sp, 2
  5621 00002927 E93B00                   jmp .retn
  5622                                  
  5623                                  ;-538   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");
  5624                                  
  5625                                  .doassign301:
  5626 0000292A A1[3900]                 mov ax, [wi]
  5627 0000292D 83F804                   cmp ax, 4
  5628 00002930 0F853100                 jne .doassign303
  5629 00002934 68[FE29]                 push doassign_16
  5630 00002937 E8EA1B                   call prs
  5631 0000293A 83C402                   add  sp, 2
  5632 0000293D 8B4606                   mov ax, [bp+6]
  5633 00002940 3DC800                   cmp ax, 200
  5634 00002943 0F8D0900                 jge .doassign304
  5635 00002947 68[062A]                 push doassign_17
  5636 0000294A E8D71B                   call prs
  5637 0000294D 83C402                   add  sp, 2
  5638                                  
  5639                                  ;-539     } v(i); prs(", eax"); return; }
  5640                                  
  5641                                  .doassign304:
  5642 00002950 FF7606                   push word [bp+6]
  5643 00002953 E87CDA                   call v
  5644 00002956 83C402                   add  sp, 2
  5645 00002959 68[0D2A]                 push doassign_18
  5646 0000295C E8C51B                   call prs
  5647 0000295F 83C402                   add  sp, 2
  5648 00002962 E90000                   jmp .retn
  5649                                  
  5650                                  ;-540 }
  5651                                  
  5652                                  .doassign303:
  5653                                  
  5654                                  ;-541 int domul(int ids) {
  5655                                  
  5656 00002965 C9                       .retn: LEAVE
  5657 00002966 C3                       ret
  5658                                  ; ENDP
  5659 00002967 5C6E206D6F76202062-     doassign_0 db "\n mov  bx, ",0
  5660 00002970 782C2000           
  5661 00002974 5C6E206D6F7620205B-     doassign_1 db "\n mov  [bx], ax",0
  5662 0000297D 62785D2C20617800   
  5663 00002985 5C6E206D6F7620205B-     doassign_2 db "\n mov  [bx], al",0
  5664 0000298E 62785D2C20616C00   
  5665 00002996 5C6E206D6F76202000      doassign_3 db "\n mov  ",0
  5666 0000299F 2C20617800              doassign_4 db ", ax",0
  5667 000029A4 5C6E206D6F76206278-     doassign_5 db "\n mov bx, ",0
  5668 000029AD 2C2000             
  5669 000029B0 5C6E2073686C206278-     doassign_6 db "\n shl bx, 1",0
  5670 000029B9 2C203100           
  5671 000029BD 5C6E206D6F76205B00      doassign_7 db "\n mov [",0
  5672 000029C6 2B62785D2C20617800      doassign_8 db "+bx], ax",0
  5673 000029CF 2B62785D2C20616C00      doassign_9 db "+bx], al",0
  5674 000029D8 5C6E206D6F762000        doassign_10 db "\n mov ",0
  5675 000029E0 627974652000            doassign_11 db "byte ",0
  5676 000029E6 2C20616C00              doassign_12 db ", al",0
  5677 000029EB 5C6E206D6F762000        doassign_13 db "\n mov ",0
  5678 000029F3 776F72642000            doassign_14 db "word ",0
  5679 000029F9 2C20617800              doassign_15 db ", ax",0
  5680 000029FE 5C6E206D6F762000        doassign_16 db "\n mov ",0
  5681 00002A06 64776F72642000          doassign_17 db "dword ",0
  5682 00002A0D 2C2065617800            doassign_18 db ", eax",0
  5683                                  
  5684                                  domul:  ; *** PROC ***
  5685                                  
  5686                                  ;-542   if (ids) rterm("imul"); else {
  5687                                  
  5688                                  ;Function : domul, Number of local variables: 1
  5689                                  ;   # type sign width addr used name   list of local variables
  5690                                  ;  200 var sign word   541 NULL ids = bp+4;
  5691 00002A13 C8000000                 ENTER  0,0
  5692 00002A17 8B4604                   mov ax, [bp+4]
  5693 00002A1A 08C0                     or  al, al
  5694 00002A1C 0F840C00                 je .domul305
  5695 00002A20 68[652A]                 push domul_0
  5696 00002A23 E899F9                   call rterm
  5697 00002A26 83C402                   add  sp, 2
  5698 00002A29 E93700                   jmp .domul306
  5699                                  .domul305:
  5700                                  
  5701                                  ;-543   if (istoken(T_CONST)) {prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx"); }
  5702                                  
  5703 00002A2C 680101                   push 257
  5704 00002A2F E8BD19                   call istoken
  5705 00002A32 83C402                   add  sp, 2
  5706 00002A35 08C0                     or  al, al
  5707 00002A37 0F841F00                 je .domul307
  5708 00002A3B 68[6A2A]                 push domul_1
  5709 00002A3E E8E31A                   call prs
  5710 00002A41 83C402                   add  sp, 2
  5711 00002A44 FF36[2E00]               push word [lexval]
  5712 00002A48 E8331C                   call prunsign1
  5713 00002A4B 83C402                   add  sp, 2
  5714 00002A4E 68[762A]                 push domul_2
  5715 00002A51 E8D01A                   call prs
  5716 00002A54 83C402                   add  sp, 2
  5717                                  
  5718                                  ;-544   else error1("with MUL only const number as multiplicator allowed"); } }
  5719                                  
  5720 00002A57 E90900                   jmp .domul308
  5721                                  .domul307:
  5722 00002A5A 68[802A]                 push domul_3
  5723 00002A5D E8AF1D                   call error1
  5724 00002A60 83C402                   add  sp, 2
  5725                                  .domul308:
  5726                                  .domul306:
  5727                                  
  5728                                  ;-545 int doidiv(int ids) { int mode; int id1;
  5729 00002A63 C9                       LEAVE
  5730 00002A64 C3                       ret
  5731                                  ; ENDP
  5732 00002A65 696D756C00              domul_0 db "imul",0
  5733 00002A6A 5C6E206D6F76206278-     domul_1 db "\n mov bx, ",0
  5734 00002A73 2C2000             
  5735 00002A76 5C6E206D756C206278-     domul_2 db "\n mul bx",0
  5736 00002A7F 00                 
  5737 00002A80 77697468204D554C20-     domul_3 db "with MUL only const number as multiplicator allowed",0
  5738 00002A89 6F6E6C7920636F6E73-
  5739 00002A92 74206E756D62657220-
  5740 00002A9B 6173206D756C746970-
  5741 00002AA4 6C696361746F722061-
  5742 00002AAD 6C6C6F77656400     
  5743                                  
  5744                                  doidiv:  ; *** PROC ***
  5745                                  
  5746                                  ;-546   if (istoken(T_CONST)) {
  5747                                  
  5748                                  ;Function : doidiv, Number of local variables: 3
  5749                                  ;   # type sign width addr used name   list of local variables
  5750                                  ;  200 var sign word   545 NULL ids = bp+4
  5751                                  ;  201 var sign word   545 NULL mode = bp-2
  5752                                  ;  202 var sign word   545 NULL id1 = bp-4;
  5753 00002AB4 C8040000                 ENTER  4,0
  5754 00002AB8 680101                   push 257
  5755 00002ABB E83119                   call istoken
  5756 00002ABE 83C402                   add  sp, 2
  5757 00002AC1 08C0                     or  al, al
  5758 00002AC3 0F843400                 je .doidiv309
  5759                                  
  5760                                  ;-547     prs("\n mov bx, "); prunsign1(lexval);
  5761                                  
  5762 00002AC7 68[792B]                 push doidiv_0
  5763 00002ACA E8571A                   call prs
  5764 00002ACD 83C402                   add  sp, 2
  5765 00002AD0 FF36[2E00]               push word [lexval]
  5766 00002AD4 E8A71B                   call prunsign1
  5767 00002AD7 83C402                   add  sp, 2
  5768                                  
  5769                                  ;-548     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5770                                  
  5771 00002ADA 8B4604                   mov ax, [bp+4]
  5772 00002ADD 08C0                     or  al, al
  5773 00002ADF 0F840C00                 je .doidiv310
  5774 00002AE3 68[852B]                 push doidiv_1
  5775 00002AE6 E83B1A                   call prs
  5776 00002AE9 83C402                   add  sp, 2
  5777 00002AEC E90900                   jmp .doidiv311
  5778                                  .doidiv310:
  5779 00002AEF 68[962B]                 push doidiv_2
  5780 00002AF2 E82F1A                   call prs
  5781 00002AF5 83C402                   add  sp, 2
  5782                                  .doidiv311:
  5783                                  
  5784                                  ;-549   else {
  5785                                  
  5786 00002AF8 E97C00                   jmp .doidiv312
  5787                                  .doidiv309:
  5788                                  
  5789                                  ;-550     mode=typeName(); id1=searchname();
  5790                                  
  5791 00002AFB E88FDF                   call typeName
  5792 00002AFE 8946FE                   mov [bp-2], ax
  5793 00002B01 E8BADE                   call searchname
  5794 00002B04 8946FC                   mov [bp-4], ax
  5795                                  
  5796                                  ;-551     if (mode) error1("only const number or int as divisor allowed");
  5797                                  
  5798 00002B07 8B46FE                   mov ax, [bp-2]
  5799 00002B0A 08C0                     or  al, al
  5800 00002B0C 0F840900                 je .doidiv313
  5801 00002B10 68[AC2B]                 push doidiv_3
  5802 00002B13 E8F91C                   call error1
  5803 00002B16 83C402                   add  sp, 2
  5804                                  
  5805                                  ;-552     gettypes(id1);
  5806                                  
  5807                                  .doidiv313:
  5808 00002B19 FF76FC                   push word [bp-4]
  5809 00002B1C E861DD                   call gettypes
  5810 00002B1F 83C402                   add  sp, 2
  5811                                  
  5812                                  ;-553     if (typei) error1("only int as simple var divisor allowed");
  5813                                  
  5814 00002B22 A1[3000]                 mov ax, [typei]
  5815 00002B25 08C0                     or  al, al
  5816 00002B27 0F840900                 je .doidiv314
  5817 00002B2B 68[D82B]                 push doidiv_4
  5818 00002B2E E8DE1C                   call error1
  5819 00002B31 83C402                   add  sp, 2
  5820                                  
  5821                                  ;-554     if (wi!=2) error1("only int, no byte as divisor allowed");
  5822                                  
  5823                                  .doidiv314:
  5824 00002B34 A1[3900]                 mov ax, [wi]
  5825 00002B37 83F802                   cmp ax, 2
  5826 00002B3A 0F840900                 je  .doidiv315
  5827 00002B3E 68[FF2B]                 push doidiv_5
  5828 00002B41 E8CB1C                   call error1
  5829 00002B44 83C402                   add  sp, 2
  5830                                  
  5831                                  ;-555     prs("\n mov bx, "); v(id1);
  5832                                  
  5833                                  .doidiv315:
  5834 00002B47 68[242C]                 push doidiv_6
  5835 00002B4A E8D719                   call prs
  5836 00002B4D 83C402                   add  sp, 2
  5837 00002B50 FF76FC                   push word [bp-4]
  5838 00002B53 E87CD8                   call v
  5839 00002B56 83C402                   add  sp, 2
  5840                                  
  5841                                  ;-556     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5842                                  
  5843 00002B59 8B4604                   mov ax, [bp+4]
  5844 00002B5C 08C0                     or  al, al
  5845 00002B5E 0F840C00                 je .doidiv316
  5846 00002B62 68[302C]                 push doidiv_7
  5847 00002B65 E8BC19                   call prs
  5848 00002B68 83C402                   add  sp, 2
  5849 00002B6B E90900                   jmp .doidiv317
  5850                                  .doidiv316:
  5851 00002B6E 68[412C]                 push doidiv_8
  5852 00002B71 E8B019                   call prs
  5853 00002B74 83C402                   add  sp, 2
  5854                                  .doidiv317:
  5855                                  
  5856                                  ;-557 }
  5857                                  
  5858                                  .doidiv312:
  5859                                  
  5860                                  ;-558 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
  5861 00002B77 C9                       LEAVE
  5862 00002B78 C3                       ret
  5863                                  ; ENDP
  5864 00002B79 5C6E206D6F76206278-     doidiv_0 db "\n mov bx, ",0
  5865 00002B82 2C2000             
  5866 00002B85 5C6E206377645C6E20-     doidiv_1 db "\n cwd\n idiv bx",0
  5867 00002B8E 6964697620627800   
  5868 00002B96 5C6E206D6F76206478-     doidiv_2 db "\n mov dx, 0\n div bx",0
  5869 00002B9F 2C20305C6E20646976-
  5870 00002BA8 20627800           
  5871 00002BAC 6F6E6C7920636F6E73-     doidiv_3 db "only const number or int as divisor allowed",0
  5872 00002BB5 74206E756D62657220-
  5873 00002BBE 6F7220696E74206173-
  5874 00002BC7 2064697669736F7220-
  5875 00002BD0 616C6C6F77656400   
  5876 00002BD8 6F6E6C7920696E7420-     doidiv_4 db "only int as simple var divisor allowed",0
  5877 00002BE1 61732073696D706C65-
  5878 00002BEA 207661722064697669-
  5879 00002BF3 736F7220616C6C6F77-
  5880 00002BFC 656400             
  5881 00002BFF 6F6E6C7920696E742C-     doidiv_5 db "only int, no byte as divisor allowed",0
  5882 00002C08 206E6F206279746520-
  5883 00002C11 61732064697669736F-
  5884 00002C1A 7220616C6C6F776564-
  5885 00002C23 00                 
  5886 00002C24 5C6E206D6F76206278-     doidiv_6 db "\n mov bx, ",0
  5887 00002C2D 2C2000             
  5888 00002C30 5C6E206377645C6E20-     doidiv_7 db "\n cwd\n idiv bx",0
  5889 00002C39 6964697620627800   
  5890 00002C41 5C6E206D6F76206478-     doidiv_8 db "\n mov dx, 0\n div bx",0
  5891 00002C4A 2C20305C6E20646976-
  5892 00002C53 20627800           
  5893                                  
  5894                                  domod:  ; *** PROC ***
  5895                                  ;Function : domod, Number of local variables: 1
  5896                                  ;   # type sign width addr used name   list of local variables
  5897                                  ;  200 var sign word   558 NULL ids = bp+4;
  5898 00002C57 C8000000                 ENTER  0,0
  5899 00002C5B FF7604                   push word [bp+4]
  5900 00002C5E E853FE                   call doidiv
  5901 00002C61 83C402                   add  sp, 2
  5902 00002C64 68[6F2C]                 push domod_0
  5903 00002C67 E8BA18                   call prs
  5904 00002C6A 83C402                   add  sp, 2
  5905                                  
  5906                                  ;-559 
  5907                                  
  5908                                  
  5909                                  ;-560 int docalltype[10]; int docallvalue[10];
  5910 00002C6D C9                       LEAVE
  5911 00002C6E C3                       ret
  5912                                  ; ENDP
  5913 00002C6F 5C6E206D6F76206178-     domod_0 db "\n mov ax, dx",0
  5914 00002C78 2C20647800         
  5915                                  section .bss
  5916                                  absolute 53411
  5917 0000D0A3 <res 00000014>          docalltype resw 10
  5918                                  section .text
  5919                                  section .bss
  5920                                  absolute 53431
  5921 0000D0B7 <res 00000014>          docallvalue resw 10
  5922                                  section .text
  5923                                  
  5924                                  ;-561 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register
  5925                                  
  5926                                  section .bss
  5927                                  absolute 53451
  5928 0000D0CB <res 00000011>          procname resb 17
  5929                                  section .text
  5930                                  
  5931                                  ;-562 int docall1() {int i; int narg; int t0; int n0;  int sz32;
  5932                                  
  5933                                  
  5934                                  docall1:  ; *** PROC ***
  5935                                  
  5936                                  ;-563   narg=0;  sz32=0;
  5937                                  
  5938                                  ;Function : docall1, Number of local variables: 5
  5939                                  ;   # type sign width addr used name   list of local variables
  5940                                  ;  200 var sign word   562 NULL i = bp-2
  5941                                  ;  201 var sign word   562 NULL narg = bp-4
  5942                                  ;  202 var sign word   562 NULL t0 = bp-6
  5943                                  ;  203 var sign word   562 NULL n0 = bp-8
  5944                                  ;  204 var sign word   562 NULL sz32 = bp-10;
  5945 00002C7D C80A0000                 ENTER  10,0
  5946 00002C81 B80000                   mov ax, 0
  5947 00002C84 8946FC                   mov [bp-4], ax
  5948 00002C87 B80000                   mov ax, 0
  5949 00002C8A 8946F6                   mov [bp-10], ax
  5950                                  
  5951                                  ;-564   checknamelen();
  5952                                  
  5953 00002C8D E875D7                   call checknamelen
  5954                                  
  5955                                  ;-565   strcpy(&procname, symbol);
  5956                                  
  5957 00002C90 8D062B81                 lea  ax, [symbol]
  5958 00002C94 50                       push ax
  5959 00002C95 8D06CBD0                 lea  ax, [procname]
  5960 00002C99 50                       push ax
  5961 00002C9A E8C9D4                   call strcpy
  5962 00002C9D 83C404                   add  sp, 4
  5963                                  
  5964                                  ;-566   storecall();
  5965                                  
  5966 00002CA0 E8EBDE                   call storecall
  5967                                  
  5968                                  ;-567   expect('(');
  5969                                  
  5970 00002CA3 6A28                     push 40
  5971 00002CA5 E86917                   call expect
  5972 00002CA8 83C402                   add  sp, 2
  5973                                  
  5974                                  ;-568 	if (istoken(')') ==0 ) {
  5975                                  
  5976 00002CAB 6A29                     push 41
  5977 00002CAD E83F17                   call istoken
  5978 00002CB0 83C402                   add  sp, 2
  5979 00002CB3 83F800                   cmp ax, 0
  5980 00002CB6 0F857802                 jne .docall1318
  5981                                  
  5982                                  ;-569 	  do { narg++;
  5983                                  
  5984                                  .docall1319:
  5985 00002CBA FF46FC                   inc  word[bp-4]
  5986                                  
  5987                                  ;-570 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;
  5988                                  
  5989 00002CBD 8B46FC                   mov ax, [bp-4]
  5990 00002CC0 83F809                   cmp ax, 9
  5991 00002CC3 0F8E0900                 jle .docall1320
  5992 00002CC7 68[762F]                 push docall1_0
  5993 00002CCA E8421B                   call error1
  5994 00002CCD 83C402                   add  sp, 2
  5995                                  .docall1320:
  5996 00002CD0 B80000                   mov ax, 0
  5997 00002CD3 8946FA                   mov [bp-6], ax
  5998                                  
  5999                                  ;-571       if(istoken(T_CONST)) {t0=1; n0=lexval; }
  6000                                  
  6001 00002CD6 680101                   push 257
  6002 00002CD9 E81317                   call istoken
  6003 00002CDC 83C402                   add  sp, 2
  6004 00002CDF 08C0                     or  al, al
  6005 00002CE1 0F840C00                 je .docall1321
  6006 00002CE5 B80100                   mov ax, 1
  6007 00002CE8 8946FA                   mov [bp-6], ax
  6008 00002CEB A1[2E00]                 mov ax, [lexval]
  6009 00002CEE 8946F8                   mov [bp-8], ax
  6010                                  
  6011                                  ;-572       if(istoken(T_STRING)){t0=2; n0=nconst;
  6012                                  
  6013                                  .docall1321:
  6014 00002CF1 680201                   push 258
  6015 00002CF4 E8F816                   call istoken
  6016 00002CF7 83C402                   add  sp, 2
  6017 00002CFA 08C0                     or  al, al
  6018 00002CFC 0F846300                 je .docall1322
  6019 00002D00 B80200                   mov ax, 2
  6020 00002D03 8946FA                   mov [bp-6], ax
  6021 00002D06 A1[2400]                 mov ax, [nconst]
  6022 00002D09 8946F8                   mov [bp-8], ax
  6023                                  
  6024                                  ;-573         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");
  6025                                  
  6026 00002D0C 68[882F]                 push docall1_1
  6027 00002D0F E87D17                   call eprs
  6028 00002D12 83C402                   add  sp, 2
  6029 00002D15 8D06AB81                 lea  ax, [fname]
  6030 00002D19 50                       push ax
  6031 00002D1A E87217                   call eprs
  6032 00002D1D 83C402                   add  sp, 2
  6033 00002D20 6A5F                     push 95
  6034 00002D22 E85717                   call eprc
  6035 00002D25 83C402                   add  sp, 2
  6036 00002D28 FF36[2400]               push word [nconst]
  6037 00002D2C E88918                   call eprnum
  6038 00002D2F 83C402                   add  sp, 2
  6039 00002D32 68[8B2F]                 push docall1_2
  6040 00002D35 E85717                   call eprs
  6041 00002D38 83C402                   add  sp, 2
  6042                                  
  6043                                  ;-574         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }
  6044                                  
  6045 00002D3B 6A22                     push 34
  6046 00002D3D E83C17                   call eprc
  6047 00002D40 83C402                   add  sp, 2
  6048 00002D43 8D062B81                 lea  ax, [symbol]
  6049 00002D47 50                       push ax
  6050 00002D48 E84417                   call eprs
  6051 00002D4B 83C402                   add  sp, 2
  6052 00002D4E 6A22                     push 34
  6053 00002D50 E82917                   call eprc
  6054 00002D53 83C402                   add  sp, 2
  6055 00002D56 68[902F]                 push docall1_3
  6056 00002D59 E83317                   call eprs
  6057 00002D5C 83C402                   add  sp, 2
  6058 00002D5F FF06[2400]               inc  word[nconst]
  6059                                  
  6060                                  ;-575       if(istoken('&'))     {t0=3; name1(); n0=searchname();}
  6061                                  
  6062                                  .docall1322:
  6063 00002D63 6A26                     push 38
  6064 00002D65 E88716                   call istoken
  6065 00002D68 83C402                   add  sp, 2
  6066 00002D6B 08C0                     or  al, al
  6067 00002D6D 0F840F00                 je .docall1323
  6068 00002D71 B80300                   mov ax, 3
  6069 00002D74 8946FA                   mov [bp-6], ax
  6070 00002D77 E8ECDD                   call name1
  6071 00002D7A E841DC                   call searchname
  6072 00002D7D 8946F8                   mov [bp-8], ax
  6073                                  
  6074                                  ;-576       if(istoken(T_NAME))  { n0=checkreg();
  6075                                  
  6076                                  .docall1323:
  6077 00002D80 680001                   push 256
  6078 00002D83 E86916                   call istoken
  6079 00002D86 83C402                   add  sp, 2
  6080 00002D89 08C0                     or  al, al
  6081 00002D8B 0F844800                 je .docall1324
  6082 00002D8F E8DFEA                   call checkreg
  6083 00002D92 8946F8                   mov [bp-8], ax
  6084                                  
  6085                                  ;-577         if (n0) t0=5;
  6086                                  
  6087 00002D95 8B46F8                   mov ax, [bp-8]
  6088 00002D98 08C0                     or  al, al
  6089 00002D9A 0F840900                 je .docall1325
  6090 00002D9E B80500                   mov ax, 5
  6091 00002DA1 8946FA                   mov [bp-6], ax
  6092                                  
  6093                                  ;-578         else {t0=4; n0=searchname();
  6094                                  
  6095 00002DA4 E93000                   jmp .docall1326
  6096                                  .docall1325:
  6097 00002DA7 B80400                   mov ax, 4
  6098 00002DAA 8946FA                   mov [bp-6], ax
  6099 00002DAD E80EDC                   call searchname
  6100 00002DB0 8946F8                   mov [bp-8], ax
  6101                                  
  6102                                  ;-579           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }
  6103                                  
  6104 00002DB3 B8B782                   mov ax, GType
  6105 00002DB6 A3[6C00]                 mov word [p1], ax
  6106 00002DB9 A1[6C00]                 mov ax, [p1]
  6107 00002DBC 0346F8                   add ax, [bp-8]
  6108 00002DBF A3[6C00]                 mov word [p1], ax
  6109 00002DC2 8B1E[6C00]               mov bx, [p1]
  6110 00002DC6 8A07                     mov al, [bx]
  6111 00002DC8 B400                     mov ah, 0
  6112 00002DCA 83F826                   cmp ax, 38
  6113 00002DCD 0F850600                 jne .docall1327
  6114 00002DD1 B80300                   mov ax, 3
  6115 00002DD4 8946FA                   mov [bp-6], ax
  6116                                  .docall1327:
  6117                                  .docall1326:
  6118                                  
  6119                                  ;-580       if (t0==0) error1("parameter not recognized (no * allowed)");
  6120                                  
  6121                                  .docall1324:
  6122 00002DD7 8B46FA                   mov ax, [bp-6]
  6123 00002DDA 83F800                   cmp ax, 0
  6124 00002DDD 0F850900                 jne .docall1328
  6125 00002DE1 68[932F]                 push docall1_4
  6126 00002DE4 E8281A                   call error1
  6127 00002DE7 83C402                   add  sp, 2
  6128                                  
  6129                                  ;-581       docalltype [narg] = t0;
  6130                                  
  6131                                  .docall1328:
  6132 00002DEA 8B46FA                   mov ax, [bp-6]
  6133 00002DED 8B5EFC                   mov bx, [bp-4]
  6134 00002DF0 D1E3                     shl bx, 1
  6135 00002DF2 8987A3D0                 mov [docalltype+bx], ax
  6136                                  
  6137                                  ;-582       docallvalue[narg] = n0;
  6138                                  
  6139 00002DF6 8B46F8                   mov ax, [bp-8]
  6140 00002DF9 8B5EFC                   mov bx, [bp-4]
  6141 00002DFC D1E3                     shl bx, 1
  6142 00002DFE 8987B7D0                 mov [docallvalue+bx], ax
  6143                                  
  6144                                  ;-583     } while (istoken(','));
  6145                                  
  6146 00002E02 6A2C                     push 44
  6147 00002E04 E8E815                   call istoken
  6148 00002E07 83C402                   add  sp, 2
  6149 00002E0A 08C0                     or  al, al
  6150 00002E0C 0F840300                 je .docall1329
  6151 00002E10 E9A7FE                   jmp .docall1319
  6152                                  .docall1329:
  6153                                  
  6154                                  ;-584     
  6155                                  
  6156                                  
  6157                                  ;-585   	expect(')');  i=narg;
  6158                                  
  6159 00002E13 6A29                     push 41
  6160 00002E15 E8F915                   call expect
  6161 00002E18 83C402                   add  sp, 2
  6162 00002E1B 8B46FC                   mov ax, [bp-4]
  6163 00002E1E 8946FE                   mov [bp-2], ax
  6164                                  
  6165                                  ;-586     do {
  6166                                  
  6167                                  .docall1330:
  6168                                  
  6169                                  ;-587       t0 = docalltype [i];
  6170                                  
  6171 00002E21 8B5EFE                   mov bx, [bp-2]
  6172 00002E24 D1E3                     shl bx, 1
  6173 00002E26 8B87A3D0                 mov ax, [docalltype + bx]
  6174 00002E2A 8946FA                   mov [bp-6], ax
  6175                                  
  6176                                  ;-588       n0 = docallvalue[i];     
  6177                                  
  6178 00002E2D 8B5EFE                   mov bx, [bp-2]
  6179 00002E30 D1E3                     shl bx, 1
  6180 00002E32 8B87B7D0                 mov ax, [docallvalue + bx]
  6181 00002E36 8946F8                   mov [bp-8], ax
  6182                                  
  6183                                  ;-589       if(t0==1){ prs("\n push "); pint1(n0);}
  6184                                  
  6185 00002E39 8B46FA                   mov ax, [bp-6]
  6186 00002E3C 83F801                   cmp ax, 1
  6187 00002E3F 0F851200                 jne .docall1331
  6188 00002E43 68[BB2F]                 push docall1_5
  6189 00002E46 E8DB16                   call prs
  6190 00002E49 83C402                   add  sp, 2
  6191 00002E4C FF76F8                   push word [bp-8]
  6192 00002E4F E8C917                   call pint1
  6193 00002E52 83C402                   add  sp, 2
  6194                                  
  6195                                  ;-590       if(t0==2){ prs("\n push "); 
  6196                                  
  6197                                  .docall1331:
  6198 00002E55 8B46FA                   mov ax, [bp-6]
  6199 00002E58 83F802                   cmp ax, 2
  6200 00002E5B 0F852500                 jne .docall1332
  6201 00002E5F 68[C42F]                 push docall1_6
  6202 00002E62 E8BF16                   call prs
  6203 00002E65 83C402                   add  sp, 2
  6204                                  
  6205                                  ;-591         prs(fname);prc(95);pint1(n0);}
  6206                                  
  6207 00002E68 8D06AB81                 lea  ax, [fname]
  6208 00002E6C 50                       push ax
  6209 00002E6D E8B416                   call prs
  6210 00002E70 83C402                   add  sp, 2
  6211 00002E73 6A5F                     push 95
  6212 00002E75 E84516                   call prc
  6213 00002E78 83C402                   add  sp, 2
  6214 00002E7B FF76F8                   push word [bp-8]
  6215 00002E7E E89A17                   call pint1
  6216 00002E81 83C402                   add  sp, 2
  6217                                  
  6218                                  ;-592       if(t0==3){ prs("\n lea  ax, ");   v(n0);
  6219                                  
  6220                                  .docall1332:
  6221 00002E84 8B46FA                   mov ax, [bp-6]
  6222 00002E87 83F803                   cmp ax, 3
  6223 00002E8A 0F851B00                 jne .docall1333
  6224 00002E8E 68[CD2F]                 push docall1_7
  6225 00002E91 E89016                   call prs
  6226 00002E94 83C402                   add  sp, 2
  6227 00002E97 FF76F8                   push word [bp-8]
  6228 00002E9A E835D5                   call v
  6229 00002E9D 83C402                   add  sp, 2
  6230                                  
  6231                                  ;-593         prs("\n push ax");}
  6232                                  
  6233 00002EA0 68[DA2F]                 push docall1_8
  6234 00002EA3 E87E16                   call prs
  6235 00002EA6 83C402                   add  sp, 2
  6236                                  
  6237                                  ;-594       if(t0==4){ gettypes(n0); 
  6238                                  
  6239                                  .docall1333:
  6240 00002EA9 8B46FA                   mov ax, [bp-6]
  6241 00002EAC 83F804                   cmp ax, 4
  6242 00002EAF 0F854300                 jne .docall1334
  6243 00002EB3 FF76F8                   push word [bp-8]
  6244 00002EB6 E8C7D9                   call gettypes
  6245 00002EB9 83C402                   add  sp, 2
  6246                                  
  6247                                  ;-595         if(wi==2) { prs("\n push word "); v(n0);}
  6248                                  
  6249 00002EBC A1[3900]                 mov ax, [wi]
  6250 00002EBF 83F802                   cmp ax, 2
  6251 00002EC2 0F851500                 jne .docall1335
  6252 00002EC6 68[E52F]                 push docall1_9
  6253 00002EC9 E85816                   call prs
  6254 00002ECC 83C402                   add  sp, 2
  6255 00002ECF FF76F8                   push word [bp-8]
  6256 00002ED2 E8FDD4                   call v
  6257 00002ED5 83C402                   add  sp, 2
  6258                                  
  6259                                  ;-596         else { prs("\n mov al, byte ");   v(n0);
  6260                                  
  6261 00002ED8 E91B00                   jmp .docall1336
  6262                                  .docall1335:
  6263 00002EDB 68[F32F]                 push docall1_10
  6264 00002EDE E84316                   call prs
  6265 00002EE1 83C402                   add  sp, 2
  6266 00002EE4 FF76F8                   push word [bp-8]
  6267 00002EE7 E8E8D4                   call v
  6268 00002EEA 83C402                   add  sp, 2
  6269                                  
  6270                                  ;-597         prs("\n mov ah, 0\n push ax"); } }
  6271                                  
  6272 00002EED 68[0430]                 push docall1_11
  6273 00002EF0 E83116                   call prs
  6274 00002EF3 83C402                   add  sp, 2
  6275                                  .docall1336:
  6276                                  
  6277                                  ;-598       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }
  6278                                  
  6279                                  .docall1334:
  6280 00002EF6 8B46FA                   mov ax, [bp-6]
  6281 00002EF9 83F805                   cmp ax, 5
  6282 00002EFC 0F852200                 jne .docall1337
  6283 00002F00 68[1B30]                 push docall1_12
  6284 00002F03 E81E16                   call prs
  6285 00002F06 83C402                   add  sp, 2
  6286 00002F09 FF76F8                   push word [bp-8]
  6287 00002F0C E870ED                   call printreg
  6288 00002F0F 83C402                   add  sp, 2
  6289 00002F12 8B46F8                   mov ax, [bp-8]
  6290 00002F15 83F82F                   cmp ax, 47 ;unsigned : 1
  6291 00002F18 0F8C0600                 jl  .docall1338
  6292 00002F1C 8B46F6                   mov ax, [bp-10]
  6293 00002F1F 83C002                   add ax, 2
  6294                                  .docall1338:
  6295                                  
  6296                                  ;-599    i--; } while (i > 0);  }
  6297                                  
  6298                                  .docall1337:
  6299 00002F22 FF4EFE                   dec  word[bp-2]
  6300 00002F25 8B46FE                   mov ax, [bp-2]
  6301 00002F28 83F800                   cmp ax, 0
  6302 00002F2B 0F8E0300                 jle .docall1339
  6303 00002F2F E9EFFE                   jmp .docall1330
  6304                                  .docall1339:
  6305                                  
  6306                                  ;-600 	 prs("\n call "); prs(&procname);
  6307                                  
  6308                                  .docall1318:
  6309 00002F32 68[2430]                 push docall1_13
  6310 00002F35 E8EC15                   call prs
  6311 00002F38 83C402                   add  sp, 2
  6312 00002F3B 8D06CBD0                 lea  ax, [procname]
  6313 00002F3F 50                       push ax
  6314 00002F40 E8E115                   call prs
  6315 00002F43 83C402                   add  sp, 2
  6316                                  
  6317                                  ;-601 	 if (narg>0) {prs("\n add  sp, ");
  6318                                  
  6319 00002F46 8B46FC                   mov ax, [bp-4]
  6320 00002F49 83F800                   cmp ax, 0
  6321 00002F4C 0F8E2400                 jle .docall1340
  6322 00002F50 68[2D30]                 push docall1_14
  6323 00002F53 E8CE15                   call prs
  6324 00002F56 83C402                   add  sp, 2
  6325                                  
  6326                                  ;-602      narg=narg+narg; narg=narg+sz32; pint1(narg); } }
  6327                                  
  6328 00002F59 8B46FC                   mov ax, [bp-4]
  6329 00002F5C 0346FC                   add ax, [bp-4]
  6330 00002F5F 8946FC                   mov [bp-4], ax
  6331 00002F62 8B46FC                   mov ax, [bp-4]
  6332 00002F65 0346F6                   add ax, [bp-10]
  6333 00002F68 8946FC                   mov [bp-4], ax
  6334 00002F6B FF76FC                   push word [bp-4]
  6335 00002F6E E8AA16                   call pint1
  6336 00002F71 83C402                   add  sp, 2
  6337                                  .docall1340:
  6338                                  
  6339                                  ;-603 /****************************************************************************/
  6340                                  
  6341                                  
  6342                                  ;-604 int main() {
  6343 00002F74 C9                       LEAVE
  6344 00002F75 C3                       ret
  6345                                  ; ENDP
  6346 00002F76 4D61782E2039207061-     docall1_0 db "Max. 9 parameters",0
  6347 00002F7F 72616D657465727300 
  6348 00002F88 5C6E00                  docall1_1 db "\n",0
  6349 00002F8B 2064622000              docall1_2 db " db ",0
  6350 00002F90 2C3000                  docall1_3 db ",0",0
  6351 00002F93 706172616D65746572-     docall1_4 db "parameter not recognized (no * allowed)",0
  6352 00002F9C 206E6F74207265636F-
  6353 00002FA5 676E697A656420286E-
  6354 00002FAE 6F202A20616C6C6F77-
  6355 00002FB7 65642900           
  6356 00002FBB 5C6E20707573682000      docall1_5 db "\n push ",0
  6357 00002FC4 5C6E20707573682000      docall1_6 db "\n push ",0
  6358 00002FCD 5C6E206C6561202061-     docall1_7 db "\n lea  ax, ",0
  6359 00002FD6 782C2000           
  6360 00002FDA 5C6E20707573682061-     docall1_8 db "\n push ax",0
  6361 00002FE3 7800               
  6362 00002FE5 5C6E20707573682077-     docall1_9 db "\n push word ",0
  6363 00002FEE 6F72642000         
  6364 00002FF3 5C6E206D6F7620616C-     docall1_10 db "\n mov al, byte ",0
  6365 00002FFC 2C20627974652000   
  6366 00003004 5C6E206D6F76206168-     docall1_11 db "\n mov ah, 0\n push ax",0
  6367 0000300D 2C20305C6E20707573-
  6368 00003016 6820617800         
  6369 0000301B 5C6E20707573682000      docall1_12 db "\n push ",0
  6370 00003024 5C6E2063616C6C2000      docall1_13 db "\n call ",0
  6371 0000302D 5C6E20616464202073-     docall1_14 db "\n add  sp, ",0
  6372 00003036 702C2000           
  6373                                  
  6374                                  main:  ; *** PROC ***
  6375                                  
  6376                                  ;-605   getarg();
  6377                                  
  6378 0000303A E88700                   call getarg
  6379                                  
  6380                                  ;-606   setblock(4096);
  6381                                  
  6382 0000303D 680010                   push 4096
  6383 00003040 E8C122                   call setblock
  6384 00003043 83C402                   add  sp, 2
  6385                                  
  6386                                  ;-607   if (DOS_ERR) error1("SetBlock , AX=");
  6387                                  
  6388 00003046 A1[6E00]                 mov ax, [DOS_ERR]
  6389 00003049 08C0                     or  al, al
  6390 0000304B 0F840900                 je .main341
  6391 0000304F 68[8930]                 push main_0
  6392 00003052 E8BA17                   call error1
  6393 00003055 83C402                   add  sp, 2
  6394                                  
  6395                                  ;-608   segE=allocmem(4096);
  6396                                  
  6397                                  .main341:
  6398 00003058 680010                   push 4096
  6399 0000305B E8BF22                   call allocmem
  6400 0000305E 83C402                   add  sp, 2
  6401 00003061 A3[6400]                 mov word [segE], ax
  6402                                  
  6403                                  ;-609   if (DOS_ERR)  error1("alloc memory, AX=");
  6404                                  
  6405 00003064 A1[6E00]                 mov ax, [DOS_ERR]
  6406 00003067 08C0                     or  al, al
  6407 00003069 0F840900                 je .main342
  6408 0000306D 68[9830]                 push main_1
  6409 00003070 E89C17                   call error1
  6410 00003073 83C402                   add  sp, 2
  6411                                  
  6412                                  ;-610   CNameTop=0;
  6413                                  
  6414                                  .main342:
  6415 00003076 B80000                   mov ax, 0
  6416 00003079 A3[6000]                 mov word [CNameTop], ax
  6417                                  
  6418                                  ;-611   getfirstchar();
  6419                                  
  6420 0000307C E82B00                   call getfirstchar
  6421                                  
  6422                                  ;-612   parse();
  6423                                  
  6424 0000307F E84B02                   call parse
  6425                                  
  6426                                  ;-613   checkcalls(); epilog();
  6427                                  
  6428 00003082 E8DF02                   call checkcalls
  6429 00003085 E8621E                   call epilog
  6430                                  
  6431                                  ;-614 }
  6432                                  
  6433                                  
  6434                                  ;-615 int getfirstchar() { fgetsp=&fgetsdest; *fgetsp=0; thechar=fgets1(); }
  6435                                  
  6436 00003088 C3                       ret
  6437                                  ; ENDP
  6438 00003089 536574426C6F636B20-     main_0 db "SetBlock , AX=",0
  6439 00003092 2C2041583D00       
  6440 00003098 616C6C6F63206D656D-     main_1 db "alloc memory, AX=",0
  6441 000030A1 6F72792C2041583D00 
  6442                                  
  6443                                  getfirstchar:  ; *** PROC ***
  6444 000030AA B80FD0                   mov ax, fgetsdest
  6445 000030AD A3[6200]                 mov word [fgetsp], ax
  6446 000030B0 B80000                   mov ax, 0
  6447 000030B3 8B1E[6200]               mov  bx, [fgetsp]
  6448 000030B7 8807                     mov  [bx], al
  6449 000030B9 E85B16                   call fgets1
  6450 000030BC A2[2100]                 mov byte [thechar], al
  6451                                  
  6452                                  ;-616 char *arglen=0x80; char *argv=0x82;
  6453                                  
  6454 000030BF C3                       ret
  6455                                  ; ENDP
  6456 000030C0 8000                    arglen dw 128
  6457 000030C2 8200                    argv dw 130
  6458                                  
  6459                                  ;-617 int getarg() { int arglen1; int i; char *c;
  6460                                  
  6461                                  
  6462                                  getarg:  ; *** PROC ***
  6463                                  
  6464                                  ;-618   arglen1=*arglen;
  6465                                  
  6466                                  ;Function : getarg, Number of local variables: 3
  6467                                  ;   # type sign width addr used name   list of local variables
  6468                                  ;  200 var sign word   617 NULL arglen1 = bp-2
  6469                                  ;  201 var sign word   617 NULL i = bp-4
  6470                                  ;  202 ptr sign byte   617 NULL c = bp-6;
  6471 000030C4 C8060000                 ENTER  6,0
  6472 000030C8 8B1E[C030]               mov bx, [arglen]
  6473 000030CC 8A07                     mov al, [bx]
  6474 000030CE B400                     mov ah, 0
  6475 000030D0 8946FE                   mov [bp-2], ax
  6476                                  
  6477                                  ;-619   if (arglen1) { i=arglen1+129; *i=0; }
  6478                                  
  6479 000030D3 8B46FE                   mov ax, [bp-2]
  6480 000030D6 08C0                     or  al, al
  6481 000030D8 0F841400                 je .getarg343
  6482 000030DC 8B46FE                   mov ax, [bp-2]
  6483 000030DF 058100                   add ax, 129
  6484 000030E2 8946FC                   mov [bp-4], ax
  6485 000030E5 B80000                   mov ax, 0
  6486 000030E8 8B5EFC                   mov  bx, [bp-4]
  6487 000030EB 8907                     mov  [bx], ax
  6488                                  
  6489                                  ;-620   else { cputs(Version1); cputs(" Usage: A.COM in_file[.C]: ");
  6490                                  
  6491 000030ED E93900                   jmp .getarg344
  6492                                  .getarg343:
  6493 000030F0 8D06[0300]               lea  ax, [Version1]
  6494 000030F4 50                       push ax
  6495 000030F5 E89CCF                   call cputs
  6496 000030F8 83C402                   add  sp, 2
  6497 000030FB 68[4432]                 push getarg_0
  6498 000030FE E893CF                   call cputs
  6499 00003101 83C402                   add  sp, 2
  6500                                  
  6501                                  ;-621     DOS_NoBytes=readRL(argv, 0, CMDLENMAX); c=DOS_NoBytes+128; *c=0; prnl(); }
  6502                                  
  6503 00003104 6A43                     push 67
  6504 00003106 6A00                     push 0
  6505 00003108 FF36[C230]               push word [argv]
  6506 0000310C E805D0                   call readRL
  6507 0000310F 83C406                   add  sp, 6
  6508 00003112 A3[7000]                 mov word [DOS_NoBytes], ax
  6509 00003115 A1[7000]                 mov ax, [DOS_NoBytes]
  6510 00003118 058000                   add ax, 128
  6511 0000311B 8946FA                   mov [bp-6], ax
  6512 0000311E B80000                   mov ax, 0
  6513 00003121 8B5EFA                   mov  bx, [bp-6]
  6514 00003124 8807                     mov  [bx], al
  6515 00003126 E8ED13                   call prnl
  6516                                  
  6517                                  ;-622   strcpy(namein, argv);
  6518                                  
  6519                                  .getarg344:
  6520 00003129 FF36[C230]               push word [argv]
  6521 0000312D 8D06EE81                 lea  ax, [namein]
  6522 00003131 50                       push ax
  6523 00003132 E831D0                   call strcpy
  6524 00003135 83C404                   add  sp, 4
  6525                                  
  6526                                  ;-623   if (instr1(namein, '.') == 0) strcat1(namein, ".C");
  6527                                  
  6528 00003138 6A2E                     push 46
  6529 0000313A 8D06EE81                 lea  ax, [namein]
  6530 0000313E 50                       push ax
  6531 0000313F E8A0D0                   call instr1
  6532 00003142 83C404                   add  sp, 4
  6533 00003145 83F800                   cmp ax, 0
  6534 00003148 0F850E00                 jne .getarg345
  6535 0000314C 68[6032]                 push getarg_1
  6536 0000314F 8D06EE81                 lea  ax, [namein]
  6537 00003153 50                       push ax
  6538 00003154 E8BDD0                   call strcat1
  6539 00003157 83C404                   add  sp, 4
  6540                                  
  6541                                  ;-624   toupper(namein);
  6542                                  
  6543                                  .getarg345:
  6544 0000315A 8D06EE81                 lea  ax, [namein]
  6545 0000315E 50                       push ax
  6546 0000315F E8D7D0                   call toupper
  6547 00003162 83C402                   add  sp, 2
  6548                                  
  6549                                  ;-625   strcpy(namelst, namein); i=strlen(namelst); i--; c=&namelst+i; *c='S';
  6550                                  
  6551 00003165 8D06EE81                 lea  ax, [namein]
  6552 00003169 50                       push ax
  6553 0000316A 8D063182                 lea  ax, [namelst]
  6554 0000316E 50                       push ax
  6555 0000316F E8F4CF                   call strcpy
  6556 00003172 83C404                   add  sp, 4
  6557 00003175 8D063182                 lea  ax, [namelst]
  6558 00003179 50                       push ax
  6559 0000317A E8C1CF                   call strlen
  6560 0000317D 83C402                   add  sp, 2
  6561 00003180 8946FC                   mov [bp-4], ax
  6562 00003183 FF4EFC                   dec  word[bp-4]
  6563 00003186 B83182                   mov ax, namelst
  6564 00003189 0346FC                   add ax, [bp-4]
  6565 0000318C 8946FA                   mov [bp-6], ax
  6566 0000318F B85300                   mov ax, 83
  6567 00003192 8B5EFA                   mov  bx, [bp-6]
  6568 00003195 8807                     mov  [bx], al
  6569                                  
  6570                                  ;-626  
  6571                                  
  6572                                  
  6573                                  ;-627   fdin=openR (namein);
  6574                                  
  6575 00003197 8D06EE81                 lea  ax, [namein]
  6576 0000319B 50                       push ax
  6577 0000319C E837CF                   call openR
  6578 0000319F 83C402                   add  sp, 2
  6579 000031A2 A3[1800]                 mov word [fdin], ax
  6580                                  
  6581                                  ;-628   if(DOS_ERR){cputs("Source file missing (.C): "); cputs(namein); exitR(1); }
  6582                                  
  6583 000031A5 A1[6E00]                 mov ax, [DOS_ERR]
  6584 000031A8 08C0                     or  al, al
  6585 000031AA 0F841C00                 je .getarg346
  6586 000031AE 68[6332]                 push getarg_2
  6587 000031B1 E8E0CE                   call cputs
  6588 000031B4 83C402                   add  sp, 2
  6589 000031B7 8D06EE81                 lea  ax, [namein]
  6590 000031BB 50                       push ax
  6591 000031BC E8D5CE                   call cputs
  6592 000031BF 83C402                   add  sp, 2
  6593 000031C2 6A01                     push 1
  6594 000031C4 E83FCF                   call exitR
  6595 000031C7 83C402                   add  sp, 2
  6596                                  
  6597                                  ;-629   fdout=creatR(namelst);
  6598                                  
  6599                                  .getarg346:
  6600 000031CA 8D063182                 lea  ax, [namelst]
  6601 000031CE 50                       push ax
  6602 000031CF E813CF                   call creatR
  6603 000031D2 83C402                   add  sp, 2
  6604 000031D5 A3[1A00]                 mov word [fdout], ax
  6605                                  
  6606                                  ;-630   if(DOS_ERR){cputs("list file not creatable: ");cputs(namelst);exitR(2);}
  6607                                  
  6608 000031D8 A1[6E00]                 mov ax, [DOS_ERR]
  6609 000031DB 08C0                     or  al, al
  6610 000031DD 0F841C00                 je .getarg347
  6611 000031E1 68[7E32]                 push getarg_3
  6612 000031E4 E8ADCE                   call cputs
  6613 000031E7 83C402                   add  sp, 2
  6614 000031EA 8D063182                 lea  ax, [namelst]
  6615 000031EE 50                       push ax
  6616 000031EF E8A2CE                   call cputs
  6617 000031F2 83C402                   add  sp, 2
  6618 000031F5 6A02                     push 2
  6619 000031F7 E80CCF                   call exitR
  6620 000031FA 83C402                   add  sp, 2
  6621                                  
  6622                                  ;-631   prs("\n; ");prs(Version1);
  6623                                  
  6624                                  .getarg347:
  6625 000031FD 68[9832]                 push getarg_4
  6626 00003200 E82113                   call prs
  6627 00003203 83C402                   add  sp, 2
  6628 00003206 8D06[0300]               lea  ax, [Version1]
  6629 0000320A 50                       push ax
  6630 0000320B E81613                   call prs
  6631 0000320E 83C402                   add  sp, 2
  6632                                  
  6633                                  ;-632   prs(", Source: "); prs(namein);  prs(", Output asm: "); prs(namelst);
  6634                                  
  6635 00003211 68[9D32]                 push getarg_5
  6636 00003214 E80D13                   call prs
  6637 00003217 83C402                   add  sp, 2
  6638 0000321A 8D06EE81                 lea  ax, [namein]
  6639 0000321E 50                       push ax
  6640 0000321F E80213                   call prs
  6641 00003222 83C402                   add  sp, 2
  6642 00003225 68[A832]                 push getarg_6
  6643 00003228 E8F912                   call prs
  6644 0000322B 83C402                   add  sp, 2
  6645 0000322E 8D063182                 lea  ax, [namelst]
  6646 00003232 50                       push ax
  6647 00003233 E8EE12                   call prs
  6648 00003236 83C402                   add  sp, 2
  6649                                  
  6650                                  ;-633   prs("\norg  256 \njmp main"); 
  6651                                  
  6652 00003239 68[B732]                 push getarg_7
  6653 0000323C E8E512                   call prs
  6654 0000323F 83C402                   add  sp, 2
  6655                                  
  6656                                  ;-634 }
  6657                                  
  6658                                  
  6659                                  ;-635 int parse() { token=getlex(); do {
  6660 00003242 C9                       LEAVE
  6661 00003243 C3                       ret
  6662                                  ; ENDP
  6663 00003244 2055736167653A2041-     getarg_0 db " Usage: A.COM in_file[.C]: ",0
  6664 0000324D 2E434F4D20696E5F66-
  6665 00003256 696C655B2E435D3A20-
  6666 0000325F 00                 
  6667 00003260 2E4300                  getarg_1 db ".C",0
  6668 00003263 536F75726365206669-     getarg_2 db "Source file missing (.C): ",0
  6669 0000326C 6C65206D697373696E-
  6670 00003275 6720282E43293A2000 
  6671 0000327E 6C6973742066696C65-     getarg_3 db "list file not creatable: ",0
  6672 00003287 206E6F742063726561-
  6673 00003290 7461626C653A2000   
  6674 00003298 5C6E3B2000              getarg_4 db "\n; ",0
  6675 0000329D 2C20536F757263653A-     getarg_5 db ", Source: ",0
  6676 000032A6 2000               
  6677 000032A8 2C204F757470757420-     getarg_6 db ", Output asm: ",0
  6678 000032B1 61736D3A2000       
  6679 000032B7 5C6E6F726720203235-     getarg_7 db "\norg  256 \njmp main",0
  6680 000032C0 36205C6E6A6D70206D-
  6681 000032C9 61696E00           
  6682                                  
  6683                                  parse:  ; *** PROC ***
  6684 000032CD E8FB09                   call getlex
  6685 000032D0 A3[1C00]                 mov word [token], ax
  6686                                  .parse348:
  6687                                  
  6688                                  ;-636     if (token <= 0) return 1;
  6689                                  
  6690 000032D3 A1[1C00]                 mov ax, [token]
  6691 000032D6 83F800                   cmp ax, 0
  6692 000032D9 0F8F0600                 jg  .parse349
  6693 000032DD B80100                   mov ax, 1
  6694 000032E0 E96500                   jmp .retn
  6695                                  
  6696                                  ;-637     if (istoken('#')) {
  6697                                  
  6698                                  .parse349:
  6699 000032E3 6A23                     push 35
  6700 000032E5 E80711                   call istoken
  6701 000032E8 83C402                   add  sp, 2
  6702 000032EB 08C0                     or  al, al
  6703 000032ED 0F843600                 je .parse350
  6704                                  
  6705                                  ;-638       if (istoken(T_DEFINE)) dodefine();
  6706                                  
  6707 000032F1 68FF01                   push 511
  6708 000032F4 E8F810                   call istoken
  6709 000032F7 83C402                   add  sp, 2
  6710 000032FA 08C0                     or  al, al
  6711 000032FC 0F840600                 je .parse351
  6712 00003300 E8A702                   call dodefine
  6713                                  
  6714                                  ;-639       else if (istoken(T_INCLUDE)) doinclude();
  6715                                  
  6716 00003303 E91E00                   jmp .parse352
  6717                                  .parse351:
  6718 00003306 68FE01                   push 510
  6719 00003309 E8E310                   call istoken
  6720 0000330C 83C402                   add  sp, 2
  6721 0000330F 08C0                     or  al, al
  6722 00003311 0F840600                 je .parse353
  6723 00003315 E8AC01                   call doinclude
  6724                                  
  6725                                  ;-640       else error1("define or include expected");  }
  6726                                  
  6727 00003318 E90900                   jmp .parse354
  6728                                  .parse353:
  6729 0000331B 68[4933]                 push parse_0
  6730 0000331E E8EE14                   call error1
  6731 00003321 83C402                   add  sp, 2
  6732                                  .parse354:
  6733                                  .parse352:
  6734                                  
  6735                                  ;-641     else{ typeName();  if (token=='(') dofunc();  else doglob(); }
  6736                                  
  6737 00003324 E91600                   jmp .parse355
  6738                                  .parse350:
  6739 00003327 E863D7                   call typeName
  6740 0000332A A1[1C00]                 mov ax, [token]
  6741 0000332D 83F828                   cmp ax, 40
  6742 00003330 0F850600                 jne .parse356
  6743 00003334 E86ADA                   call dofunc
  6744 00003337 E90300                   jmp .parse357
  6745                                  .parse356:
  6746 0000333A E814D1                   call doglob
  6747                                  .parse357:
  6748                                  
  6749                                  ;-642   } while(1);
  6750                                  
  6751                                  .parse355:
  6752 0000333D B80100                   mov ax, 1
  6753 00003340 08C0                     or  al, al
  6754 00003342 0F840200                 je .parse358
  6755 00003346 EB8B                     jmp .parse348
  6756                                  .parse358:
  6757                                  
  6758                                  ;-643 }
  6759                                  
  6760                                  
  6761                                  ;-644 int checkcalls() { int i; int j; int k;
  6762                                  
  6763                                   .retn:
  6764 00003348 C3                       ret
  6765                                  ; ENDP
  6766 00003349 646566696E65206F72-     parse_0 db "define or include expected",0
  6767 00003352 20696E636C75646520-
  6768 0000335B 657870656374656400 
  6769                                  
  6770                                  checkcalls:  ; *** PROC ***
  6771                                  
  6772                                  ;-645   prs("\n \n; missing functions: ");
  6773                                  
  6774                                  ;Function : checkcalls, Number of local variables: 3
  6775                                  ;   # type sign width addr used name   list of local variables
  6776                                  ;  200 var sign word   644 NULL i = bp-2
  6777                                  ;  201 var sign word   644 NULL j = bp-4
  6778                                  ;  202 var sign word   644 NULL k = bp-6;
  6779 00003364 C8060000                 ENTER  6,0
  6780 00003368 68[4A34]                 push checkcalls_0
  6781 0000336B E8B611                   call prs
  6782 0000336E 83C402                   add  sp, 2
  6783                                  
  6784                                  ;-646   i=0;  k=0;
  6785                                  
  6786 00003371 B80000                   mov ax, 0
  6787 00003374 8946FE                   mov [bp-2], ax
  6788 00003377 B80000                   mov ax, 0
  6789 0000337A 8946FA                   mov [bp-6], ax
  6790                                  
  6791                                  ;-647   while (i < CTop) {
  6792                                  
  6793                                  .checkcalls359:
  6794 0000337D 8B46FE                   mov ax, [bp-2]
  6795 00003380 3B06[3D00]               cmp ax, [CTop]
  6796 00003384 0F8D8F00                 jge .checkcalls360
  6797                                  
  6798                                  ;-648     pt=CAdr[i];
  6799                                  
  6800 00003388 8B5EFE                   mov bx, [bp-2]
  6801 0000338B D1E3                     shl bx, 1
  6802 0000338D 8B8757AB                 mov ax, [CAdr + bx]
  6803 00003391 A3[6A00]                 mov word [pt], ax
  6804                                  
  6805                                  ;-649     from_far(NameA, pt);
  6806                                  
  6807 00003394 FF36[6A00]               push word [pt]
  6808 00003398 8D06[3F00]               lea  ax, [NameA]
  6809 0000339C 50                       push ax
  6810 0000339D E8E41F                   call from_far
  6811 000033A0 83C404                   add  sp, 4
  6812                                  
  6813                                  ;-650     j=0;
  6814                                  
  6815 000033A3 B80000                   mov ax, 0
  6816 000033A6 8946FC                   mov [bp-4], ax
  6817                                  
  6818                                  ;-651     do { p1=adrF(FNameField, j);
  6819                                  
  6820                                  .checkcalls361:
  6821 000033A9 FF76FC                   push word [bp-4]
  6822 000033AC 8D064FBD                 lea  ax, [FNameField]
  6823 000033B0 50                       push ax
  6824 000033B1 E897D5                   call adrF
  6825 000033B4 83C404                   add  sp, 4
  6826 000033B7 A3[6C00]                 mov word [p1], ax
  6827                                  
  6828                                  ;-652       if (eqstr(NameA, p1)){ CType[i]=1; j=FTop; }
  6829                                  
  6830 000033BA FF36[6C00]               push word [p1]
  6831 000033BE 8D06[3F00]               lea  ax, [NameA]
  6832 000033C2 50                       push ax
  6833 000033C3 E8D0CD                   call eqstr
  6834 000033C6 83C404                   add  sp, 4
  6835 000033C9 08C0                     or  al, al
  6836 000033CB 0F841000                 je .checkcalls362
  6837 000033CF B80100                   mov ax, 1
  6838 000033D2 8B5EFE                   mov bx, [bp-2]
  6839 000033D5 88872FA1                 mov [CType+bx], al
  6840 000033D9 A1[3B00]                 mov ax, [FTop]
  6841 000033DC 8946FC                   mov [bp-4], ax
  6842                                  
  6843                                  ;-653       j++; } while (j < FTop);
  6844                                  
  6845                                  .checkcalls362:
  6846 000033DF FF46FC                   inc  word[bp-4]
  6847 000033E2 8B46FC                   mov ax, [bp-4]
  6848 000033E5 3B06[3B00]               cmp ax, [FTop]
  6849 000033E9 0F8D0200                 jge .checkcalls363
  6850 000033ED EBBA                     jmp .checkcalls361
  6851                                  .checkcalls363:
  6852                                  
  6853                                  ;-654     if (j == FTop) { k++; prs("\n; "); prs(NameA); }
  6854                                  
  6855 000033EF 8B46FC                   mov ax, [bp-4]
  6856 000033F2 3B06[3B00]               cmp ax, [FTop]
  6857 000033F6 0F851700                 jne .checkcalls364
  6858 000033FA FF46FA                   inc  word[bp-6]
  6859 000033FD 68[6534]                 push checkcalls_1
  6860 00003400 E82111                   call prs
  6861 00003403 83C402                   add  sp, 2
  6862 00003406 8D06[3F00]               lea  ax, [NameA]
  6863 0000340A 50                       push ax
  6864 0000340B E81611                   call prs
  6865 0000340E 83C402                   add  sp, 2
  6866                                  
  6867                                  ;-655     i++; }
  6868                                  
  6869                                  .checkcalls364:
  6870 00003411 FF46FE                   inc  word[bp-2]
  6871                                  
  6872                                  ;-656   prs("\n; Number of unresolved CALLs :"); printint51(k);
  6873                                  
  6874 00003414 E966FF                   jmp .checkcalls359
  6875                                  .checkcalls360:
  6876 00003417 68[6A34]                 push checkcalls_2
  6877 0000341A E80711                   call prs
  6878 0000341D 83C402                   add  sp, 2
  6879 00003420 FF76FA                   push word [bp-6]
  6880 00003423 E89A12                   call printint51
  6881 00003426 83C402                   add  sp, 2
  6882                                  
  6883                                  ;-657   if (k!=0) error1("At least 1 function is missing! "); 
  6884                                  
  6885 00003429 8B46FA                   mov ax, [bp-6]
  6886 0000342C 83F800                   cmp ax, 0
  6887 0000342F 0F840C00                 je  .checkcalls365
  6888 00003433 68[8B34]                 push checkcalls_3
  6889 00003436 E8D613                   call error1
  6890 00003439 83C402                   add  sp, 2
  6891                                  
  6892                                  ;-658     else prs(" All FUNCTIONs in place");
  6893                                  
  6894 0000343C E90900                   jmp .checkcalls366
  6895                                  .checkcalls365:
  6896 0000343F 68[AC34]                 push checkcalls_4
  6897 00003442 E8DF10                   call prs
  6898 00003445 83C402                   add  sp, 2
  6899                                  
  6900                                  ;-659 }
  6901                                  
  6902                                  .checkcalls366:
  6903                                  
  6904                                  ;-660 
  6905                                  
  6906                                  
  6907                                  ;-661 int doinclude() { int fdtemp;
  6908 00003448 C9                       LEAVE
  6909 00003449 C3                       ret
  6910                                  ; ENDP
  6911 0000344A 5C6E205C6E3B206D69-     checkcalls_0 db "\n \n; missing functions: ",0
  6912 00003453 7373696E672066756E-
  6913 0000345C 6374696F6E733A2000 
  6914 00003465 5C6E3B2000              checkcalls_1 db "\n; ",0
  6915 0000346A 5C6E3B204E756D6265-     checkcalls_2 db "\n; Number of unresolved CALLs :",0
  6916 00003473 72206F6620756E7265-
  6917 0000347C 736F6C766564204341-
  6918 00003485 4C4C73203A00       
  6919 0000348B 4174206C6561737420-     checkcalls_3 db "At least 1 function is missing! ",0
  6920 00003494 312066756E6374696F-
  6921 0000349D 6E206973206D697373-
  6922 000034A6 696E67212000       
  6923 000034AC 20416C6C2046554E43-     checkcalls_4 db " All FUNCTIONs in place",0
  6924 000034B5 54494F4E7320696E20-
  6925 000034BE 706C61636500       
  6926                                  
  6927                                  doinclude:  ; *** PROC ***
  6928                                  
  6929                                  ;-662   if (token==T_STRING) {  fdtemp=fdin;
  6930                                  
  6931                                  ;Function : doinclude, Number of local variables: 1
  6932                                  ;   # type sign width addr used name   list of local variables
  6933                                  ;  200 var sign word   661 NULL fdtemp = bp-2;
  6934 000034C4 C8020000                 ENTER  2,0
  6935 000034C8 A1[1C00]                 mov ax, [token]
  6936 000034CB 3D0201                   cmp ax, 258
  6937 000034CE 0F858700                 jne .doinclude367
  6938 000034D2 A1[1800]                 mov ax, [fdin]
  6939 000034D5 8946FE                   mov [bp-2], ax
  6940                                  
  6941                                  ;-663   prs("\n;Use include file: "); prs(symbol);
  6942                                  
  6943 000034D8 68[5B35]                 push doinclude_0
  6944 000034DB E84610                   call prs
  6945 000034DE 83C402                   add  sp, 2
  6946 000034E1 8D062B81                 lea  ax, [symbol]
  6947 000034E5 50                       push ax
  6948 000034E6 E83B10                   call prs
  6949 000034E9 83C402                   add  sp, 2
  6950                                  
  6951                                  ;-664   fdin=openR(symbol);
  6952                                  
  6953 000034EC 8D062B81                 lea  ax, [symbol]
  6954 000034F0 50                       push ax
  6955 000034F1 E8E2CB                   call openR
  6956 000034F4 83C402                   add  sp, 2
  6957 000034F7 A3[1800]                 mov word [fdin], ax
  6958                                  
  6959                                  ;-665   if (DOS_ERR !=0) {prs("Include file missing: "); prs(symbol);
  6960                                  
  6961 000034FA A1[6E00]                 mov ax, [DOS_ERR]
  6962 000034FD 83F800                   cmp ax, 0
  6963 00003500 0F841D00                 je  .doinclude368
  6964 00003504 68[7135]                 push doinclude_1
  6965 00003507 E81A10                   call prs
  6966 0000350A 83C402                   add  sp, 2
  6967 0000350D 8D062B81                 lea  ax, [symbol]
  6968 00003511 50                       push ax
  6969 00003512 E80F10                   call prs
  6970 00003515 83C402                   add  sp, 2
  6971                                  
  6972                                  ;-666     error1(" Stop!!"); }
  6973                                  
  6974 00003518 68[8835]                 push doinclude_2
  6975 0000351B E8F112                   call error1
  6976 0000351E 83C402                   add  sp, 2
  6977                                  
  6978                                  ;-667   linenoinclude=lineno; lineno=1;
  6979                                  
  6980                                  .doinclude368:
  6981 00003521 A1[6600]                 mov ax, [lineno]
  6982 00003524 A3[6800]                 mov word [linenoinclude], ax
  6983 00003527 B80100                   mov ax, 1
  6984 0000352A A3[6600]                 mov word [lineno], ax
  6985                                  
  6986                                  ;-668   parse(); lineno=linenoinclude;
  6987                                  
  6988 0000352D E89DFD                   call parse
  6989 00003530 A1[6800]                 mov ax, [linenoinclude]
  6990 00003533 A3[6600]                 mov word [lineno], ax
  6991                                  
  6992                                  ;-669   fdin=fdtemp; prs("\n;Back to main program: "); prs(namein);
  6993                                  
  6994 00003536 8B46FE                   mov ax, [bp-2]
  6995 00003539 A3[1800]                 mov word [fdin], ax
  6996 0000353C 68[9035]                 push doinclude_3
  6997 0000353F E8E20F                   call prs
  6998 00003542 83C402                   add  sp, 2
  6999 00003545 8D06EE81                 lea  ax, [namein]
  7000 00003549 50                       push ax
  7001 0000354A E8D70F                   call prs
  7002 0000354D 83C402                   add  sp, 2
  7003                                  
  7004                                  ;-670   getfirstchar(); token=getlex(); }
  7005                                  
  7006 00003550 E857FB                   call getfirstchar
  7007 00003553 E87507                   call getlex
  7008 00003556 A3[1C00]                 mov word [token], ax
  7009                                  
  7010                                  ;-671 }
  7011                                  
  7012                                  .doinclude367:
  7013                                  
  7014                                  ;-672 int dodefine() { int i; int j; int fdtemp;
  7015 00003559 C9                       LEAVE
  7016 0000355A C3                       ret
  7017                                  ; ENDP
  7018 0000355B 5C6E3B55736520696E-     doinclude_0 db "\n;Use include file: ",0
  7019 00003564 636C7564652066696C-
  7020 0000356D 653A2000           
  7021 00003571 496E636C7564652066-     doinclude_1 db "Include file missing: ",0
  7022 0000357A 696C65206D69737369-
  7023 00003583 6E673A2000         
  7024 00003588 2053746F70212100        doinclude_2 db " Stop!!",0
  7025 00003590 5C6E3B4261636B2074-     doinclude_3 db "\n;Back to main program: ",0
  7026 00003599 6F206D61696E207072-
  7027 000035A2 6F6772616D3A2000   
  7028                                  
  7029                                  dodefine:  ; *** PROC ***
  7030                                  
  7031                                  ;-673   if (eqstr(symbol, "ORGDATA")) {token=getlex();
  7032                                  
  7033                                  ;Function : dodefine, Number of local variables: 3
  7034                                  ;   # type sign width addr used name   list of local variables
  7035                                  ;  200 var sign word   672 NULL i = bp-2
  7036                                  ;  201 var sign word   672 NULL j = bp-4
  7037                                  ;  202 var sign word   672 NULL fdtemp = bp-6;
  7038 000035AA C8060000                 ENTER  6,0
  7039 000035AE 68[F136]                 push dodefine_0
  7040 000035B1 8D062B81                 lea  ax, [symbol]
  7041 000035B5 50                       push ax
  7042 000035B6 E8DDCB                   call eqstr
  7043 000035B9 83C404                   add  sp, 4
  7044 000035BC 08C0                     or  al, al
  7045 000035BE 0F841500                 je .dodefine369
  7046 000035C2 E80607                   call getlex
  7047 000035C5 A3[1C00]                 mov word [token], ax
  7048                                  
  7049                                  ;-674     ORGDATAORIG=lexval; orgData=lexval; return; }
  7050                                  
  7051 000035C8 A1[2E00]                 mov ax, [lexval]
  7052 000035CB A3[0E00]                 mov word [ORGDATAORIG], ax
  7053 000035CE A1[2E00]                 mov ax, [lexval]
  7054 000035D1 A3[1000]                 mov word [orgData], ax
  7055 000035D4 E91801                   jmp .retn
  7056                                  
  7057                                  ;-675   if (eqstr(symbol, "ARCHIVE")){token=getlex();  if (token==T_STRING) {
  7058                                  
  7059                                  .dodefine369:
  7060 000035D7 68[F936]                 push dodefine_1
  7061 000035DA 8D062B81                 lea  ax, [symbol]
  7062 000035DE 50                       push ax
  7063 000035DF E8B4CB                   call eqstr
  7064 000035E2 83C404                   add  sp, 4
  7065 000035E5 08C0                     or  al, al
  7066 000035E7 0F844900                 je .dodefine370
  7067 000035EB E8DD06                   call getlex
  7068 000035EE A3[1C00]                 mov word [token], ax
  7069 000035F1 A1[1C00]                 mov ax, [token]
  7070 000035F4 3D0201                   cmp ax, 258
  7071 000035F7 0F852700                 jne .dodefine371
  7072                                  
  7073                                  ;-676     prs("\n;Use archive file: ");
  7074                                  
  7075 000035FB 68[0137]                 push dodefine_2
  7076 000035FE E8230F                   call prs
  7077 00003601 83C402                   add  sp, 2
  7078                                  
  7079                                  ;-677     strcpy(archivename, symbol); prs(archivename);
  7080                                  
  7081 00003604 8D062B81                 lea  ax, [symbol]
  7082 00003608 50                       push ax
  7083 00003609 8D067482                 lea  ax, [archivename]
  7084 0000360D 50                       push ax
  7085 0000360E E855CB                   call strcpy
  7086 00003611 83C404                   add  sp, 4
  7087 00003614 8D067482                 lea  ax, [archivename]
  7088 00003618 50                       push ax
  7089 00003619 E8080F                   call prs
  7090 0000361C 83C402                   add  sp, 2
  7091                                  
  7092                                  ;-678     } else error1("Name of archive file missing"); token=getlex(); return;}
  7093                                  
  7094 0000361F E90900                   jmp .dodefine372
  7095                                  .dodefine371:
  7096 00003622 68[1737]                 push dodefine_3
  7097 00003625 E8E711                   call error1
  7098 00003628 83C402                   add  sp, 2
  7099                                  .dodefine372:
  7100 0000362B E89D06                   call getlex
  7101 0000362E A3[1C00]                 mov word [token], ax
  7102 00003631 E9BB00                   jmp .retn
  7103                                  
  7104                                  ;-679    expect(T_NAME);
  7105                                  
  7106                                  .dodefine370:
  7107 00003634 680001                   push 256
  7108 00003637 E8D70D                   call expect
  7109 0000363A 83C402                   add  sp, 2
  7110                                  
  7111                                  ;-680   if (token==T_CONST) { 
  7112                                  
  7113 0000363D A1[1C00]                 mov ax, [token]
  7114 00003640 3D0101                   cmp ax, 257
  7115 00003643 0F85A800                 jne .dodefine373
  7116                                  
  7117                                  ;-681     if (GTop >= LSTART) error1("global table (define) full");
  7118                                  
  7119 00003647 A1[2A00]                 mov ax, [GTop]
  7120 0000364A 3DC800                   cmp ax, 200 ;unsigned : 1
  7121 0000364D 0F8C0900                 jl  .dodefine374
  7122 00003651 68[3437]                 push dodefine_4
  7123 00003654 E8B811                   call error1
  7124 00003657 83C402                   add  sp, 2
  7125                                  
  7126                                  ;-682     i=strlen(symbol); if (i>15) error1("Define name longer 15 char");
  7127                                  
  7128                                  .dodefine374:
  7129 0000365A 8D062B81                 lea  ax, [symbol]
  7130 0000365E 50                       push ax
  7131 0000365F E8DCCA                   call strlen
  7132 00003662 83C402                   add  sp, 2
  7133 00003665 8946FE                   mov [bp-2], ax
  7134 00003668 8B46FE                   mov ax, [bp-2]
  7135 0000366B 83F80F                   cmp ax, 15
  7136 0000366E 0F8E0900                 jle .dodefine375
  7137 00003672 68[4F37]                 push dodefine_5
  7138 00003675 E89711                   call error1
  7139 00003678 83C402                   add  sp, 2
  7140                                  
  7141                                  ;-683     GSign [GTop]='U'; GWidth[GTop]=1; GType [GTop]='#';
  7142                                  
  7143                                  .dodefine375:
  7144 0000367B B85500                   mov ax, 85
  7145 0000367E 8B1E[2A00]               mov bx, [GTop]
  7146 00003682 8887E383                 mov [GSign+bx], al
  7147 00003686 B80100                   mov ax, 1
  7148 00003689 8B1E[2A00]               mov bx, [GTop]
  7149 0000368D 88870F85                 mov [GWidth+bx], al
  7150 00003691 B82300                   mov ax, 35
  7151 00003694 8B1E[2A00]               mov bx, [GTop]
  7152 00003698 8887B782                 mov [GType+bx], al
  7153                                  
  7154                                  ;-684     GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  7155                                  
  7156 0000369C A1[6600]                 mov ax, [lineno]
  7157 0000369F 83E801                   sub ax, 1
  7158 000036A2 8B1E[2A00]               mov bx, [GTop]
  7159 000036A6 D1E3                     shl bx, 1
  7160 000036A8 89873B86                 mov [GAdr+bx], ax
  7161 000036AC B80000                   mov ax, 0
  7162 000036AF 8B1E[2A00]               mov bx, [GTop]
  7163 000036B3 D1E3                     shl bx, 1
  7164 000036B5 89879388                 mov [GUsed+bx], ax
  7165                                  
  7166                                  ;-685     pt=adrofname(GTop); strcpy(pt, symbol); GData[GTop]=lexval;
  7167                                  
  7168 000036B9 FF36[2A00]               push word [GTop]
  7169 000036BD E877D2                   call adrofname
  7170 000036C0 83C402                   add  sp, 2
  7171 000036C3 A3[6A00]                 mov word [pt], ax
  7172 000036C6 8D062B81                 lea  ax, [symbol]
  7173 000036CA 50                       push ax
  7174 000036CB FF36[6A00]               push word [pt]
  7175 000036CF E894CA                   call strcpy
  7176 000036D2 83C404                   add  sp, 4
  7177 000036D5 A1[2E00]                 mov ax, [lexval]
  7178 000036D8 8B1E[2A00]               mov bx, [GTop]
  7179 000036DC D1E3                     shl bx, 1
  7180 000036DE 8987EB8A                 mov [GData+bx], ax
  7181                                  
  7182                                  ;-686     expect(T_CONST); GTop++;  } 
  7183                                  
  7184 000036E2 680101                   push 257
  7185 000036E5 E8290D                   call expect
  7186 000036E8 83C402                   add  sp, 2
  7187 000036EB FF06[2A00]               inc  word[GTop]
  7188                                  
  7189                                  ;-687 }
  7190                                  
  7191                                  .dodefine373:
  7192                                  
  7193                                  ;-688 int stmt() { int c; char cha;
  7194                                  
  7195 000036EF C9                       .retn: LEAVE
  7196 000036F0 C3                       ret
  7197                                  ; ENDP
  7198 000036F1 4F52474441544100        dodefine_0 db "ORGDATA",0
  7199 000036F9 4152434849564500        dodefine_1 db "ARCHIVE",0
  7200 00003701 5C6E3B557365206172-     dodefine_2 db "\n;Use archive file: ",0
  7201 0000370A 63686976652066696C-
  7202 00003713 653A2000           
  7203 00003717 4E616D65206F662061-     dodefine_3 db "Name of archive file missing",0
  7204 00003720 726368697665206669-
  7205 00003729 6C65206D697373696E-
  7206 00003732 6700               
  7207 00003734 676C6F62616C207461-     dodefine_4 db "global table (define) full",0
  7208 0000373D 626C65202864656669-
  7209 00003746 6E65292066756C6C00 
  7210 0000374F 446566696E65206E61-     dodefine_5 db "Define name longer 15 char",0
  7211 00003758 6D65206C6F6E676572-
  7212 00003761 203135206368617200 
  7213                                  
  7214                                  stmt:  ; *** PROC ***
  7215                                  
  7216                                  ;-689        if(istoken('{'))     {while(istoken('}')==0) stmt();}
  7217                                  
  7218                                  ;Function : stmt, Number of local variables: 2
  7219                                  ;   # type sign width addr used name   list of local variables
  7220                                  ;  200 var sign word   688 NULL c = bp-2
  7221                                  ;  201 var sign byte   688 NULL cha = bp-4;
  7222 0000376A C8040000                 ENTER  4,0
  7223 0000376E 6A7B                     push 123
  7224 00003770 E87C0C                   call istoken
  7225 00003773 83C402                   add  sp, 2
  7226 00003776 08C0                     or  al, al
  7227 00003778 0F841700                 je .stmt376
  7228                                  .stmt377:
  7229 0000377C 6A7D                     push 125
  7230 0000377E E86E0C                   call istoken
  7231 00003781 83C402                   add  sp, 2
  7232 00003784 83F800                   cmp ax, 0
  7233 00003787 0F850500                 jne .stmt378
  7234 0000378B E8DCFF                   call stmt
  7235 0000378E EBEC                     jmp .stmt377
  7236                                  .stmt378:
  7237                                  
  7238                                  ;-690   else if(istoken(T_IF))    doif();
  7239                                  
  7240 00003790 E9A501                   jmp .stmt379
  7241                                  .stmt376:
  7242 00003793 680102                   push 513
  7243 00003796 E8560C                   call istoken
  7244 00003799 83C402                   add  sp, 2
  7245 0000379C 08C0                     or  al, al
  7246 0000379E 0F840600                 je .stmt380
  7247 000037A2 E8CC03                   call doif
  7248                                  
  7249                                  ;-691   else if(istoken(T_DO))    dodo();
  7250                                  
  7251 000037A5 E99001                   jmp .stmt381
  7252                                  .stmt380:
  7253 000037A8 680402                   push 516
  7254 000037AB E8410C                   call istoken
  7255 000037AE 83C402                   add  sp, 2
  7256 000037B1 08C0                     or  al, al
  7257 000037B3 0F840600                 je .stmt382
  7258 000037B7 E81904                   call dodo
  7259                                  
  7260                                  ;-692   else if(istoken(T_WHILE)) dowhile();
  7261                                  
  7262 000037BA E97B01                   jmp .stmt383
  7263                                  .stmt382:
  7264 000037BD 680302                   push 515
  7265 000037C0 E82C0C                   call istoken
  7266 000037C3 83C402                   add  sp, 2
  7267 000037C6 08C0                     or  al, al
  7268 000037C8 0F840600                 je .stmt384
  7269 000037CC E85104                   call dowhile
  7270                                  
  7271                                  ;-693   else if(istoken(T_GOTO))  {prs("\n jmp .");name1();prs(symbol);expect(';');}
  7272                                  
  7273 000037CF E96601                   jmp .stmt385
  7274                                  .stmt384:
  7275 000037D2 680902                   push 521
  7276 000037D5 E8170C                   call istoken
  7277 000037D8 83C402                   add  sp, 2
  7278 000037DB 08C0                     or  al, al
  7279 000037DD 0F842200                 je .stmt386
  7280 000037E1 68[3A39]                 push stmt_0
  7281 000037E4 E83D0D                   call prs
  7282 000037E7 83C402                   add  sp, 2
  7283 000037EA E879D3                   call name1
  7284 000037ED 8D062B81                 lea  ax, [symbol]
  7285 000037F1 50                       push ax
  7286 000037F2 E82F0D                   call prs
  7287 000037F5 83C402                   add  sp, 2
  7288 000037F8 6A3B                     push 59
  7289 000037FA E8140C                   call expect
  7290 000037FD 83C402                   add  sp, 2
  7291                                  
  7292                                  ;-694   else if(token==T_ASM)     {prs("\n"); c=next();
  7293                                  
  7294 00003800 E93501                   jmp .stmt387
  7295                                  .stmt386:
  7296 00003803 A1[1C00]                 mov ax, [token]
  7297 00003806 3D0602                   cmp ax, 518
  7298 00003809 0F853300                 jne .stmt388
  7299 0000380D 68[4339]                 push stmt_1
  7300 00003810 E8110D                   call prs
  7301 00003813 83C402                   add  sp, 2
  7302 00003816 E8B80B                   call next
  7303 00003819 8946FE                   mov [bp-2], ax
  7304                                  
  7305                                  ;-695         while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }
  7306                                  
  7307                                  .stmt389:
  7308 0000381C 8B46FE                   mov ax, [bp-2]
  7309 0000381F 83F80A                   cmp ax, 10
  7310 00003822 0F841100                 je  .stmt390
  7311 00003826 FF76FE                   push word [bp-2]
  7312 00003829 E8910C                   call prc
  7313 0000382C 83C402                   add  sp, 2
  7314 0000382F E89F0B                   call next
  7315 00003832 8946FE                   mov [bp-2], ax
  7316 00003835 EBE5                     jmp .stmt389
  7317                                  .stmt390:
  7318 00003837 E89104                   call getlex
  7319 0000383A A3[1C00]                 mov word [token], ax
  7320                                  
  7321                                  ;-696   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();  
  7322                                  
  7323 0000383D E9F800                   jmp .stmt391
  7324                                  .stmt388:
  7325 00003840 680702                   push 519
  7326 00003843 E8A90B                   call istoken
  7327 00003846 83C402                   add  sp, 2
  7328 00003849 08C0                     or  al, al
  7329 0000384B 0F844B00                 je .stmt392
  7330 0000384F A1[1C00]                 mov ax, [token]
  7331 00003852 83F87B                   cmp ax, 123
  7332 00003855 0F853500                 jne .stmt393
  7333 00003859 68[4639]                 push stmt_2
  7334 0000385C E8C50C                   call prs
  7335 0000385F 83C402                   add  sp, 2
  7336 00003862 E86C0B                   call next
  7337 00003865 8846FC                   mov [bp-4], al
  7338                                  
  7339                                  ;-697         while(cha!= '}') { prc(cha); cha=next(); }
  7340                                  
  7341                                  .stmt394:
  7342 00003868 8A46FC                   mov al, [bp-4]
  7343 0000386B 3C7D                     cmp al, 125
  7344 0000386D 0F841400                 je  .stmt395
  7345 00003871 8A46FC                   mov al, byte [bp-4]
  7346 00003874 B400                     mov ah, 0
  7347 00003876 50                       push ax
  7348 00003877 E8430C                   call prc
  7349 0000387A 83C402                   add  sp, 2
  7350 0000387D E8510B                   call next
  7351 00003880 8846FC                   mov [bp-4], al
  7352                                  
  7353                                  ;-698         token=getlex(); }
  7354                                  
  7355 00003883 EBE3                     jmp .stmt394
  7356                                  .stmt395:
  7357 00003885 E84304                   call getlex
  7358 00003888 A3[1C00]                 mov word [token], ax
  7359                                  
  7360                                  ;-699         else error1("Curly open expected"); 
  7361                                  
  7362 0000388B E90900                   jmp .stmt396
  7363                                  .stmt393:
  7364 0000388E 68[4939]                 push stmt_3
  7365 00003891 E87B0F                   call error1
  7366 00003894 83C402                   add  sp, 2
  7367                                  
  7368                                  ;-700         }
  7369                                  
  7370                                  .stmt396:
  7371                                  
  7372                                  ;-701   else if(istoken(T_EMIT))   doemit();
  7373                                  
  7374 00003897 E99E00                   jmp .stmt397
  7375                                  .stmt392:
  7376 0000389A 680802                   push 520
  7377 0000389D E84F0B                   call istoken
  7378 000038A0 83C402                   add  sp, 2
  7379 000038A3 08C0                     or  al, al
  7380 000038A5 0F840600                 je .stmt398
  7381 000038A9 E8C200                   call doemit
  7382                                  
  7383                                  ;-702   else if(istoken(';'))      { }
  7384                                  
  7385 000038AC E98900                   jmp .stmt399
  7386                                  .stmt398:
  7387 000038AF 6A3B                     push 59
  7388 000038B1 E83B0B                   call istoken
  7389 000038B4 83C402                   add  sp, 2
  7390 000038B7 08C0                     or  al, al
  7391 000038B9 0F840300                 je .stmt400
  7392                                  
  7393                                  ;-703   else if(istoken(T_RETURN)) {
  7394                                  
  7395 000038BD E97800                   jmp .stmt401
  7396                                  .stmt400:
  7397 000038C0 680002                   push 512
  7398 000038C3 E8290B                   call istoken
  7399 000038C6 83C402                   add  sp, 2
  7400 000038C9 08C0                     or  al, al
  7401 000038CB 0F842500                 je .stmt402
  7402                                  
  7403                                  ;-704         if (token!=';') exprstart();
  7404                                  
  7405 000038CF A1[1C00]                 mov ax, [token]
  7406 000038D2 83F83B                   cmp ax, 59
  7407 000038D5 0F840300                 je  .stmt403
  7408 000038D9 E852D9                   call exprstart
  7409                                  
  7410                                  ;-705         prs("\n jmp .retn"); 
  7411                                  
  7412                                  .stmt403:
  7413 000038DC 68[5D39]                 push stmt_4
  7414 000038DF E8420C                   call prs
  7415 000038E2 83C402                   add  sp, 2
  7416                                  
  7417                                  ;-706         nreturn++; 
  7418                                  
  7419 000038E5 FF06[2600]               inc  word[nreturn]
  7420                                  
  7421                                  ;-707         expect(';');
  7422                                  
  7423 000038E9 6A3B                     push 59
  7424 000038EB E8230B                   call expect
  7425 000038EE 83C402                   add  sp, 2
  7426                                  
  7427                                  ;-708         }
  7428                                  
  7429                                  
  7430                                  ;-709   else if(thechar==':')      {
  7431                                  
  7432 000038F1 E94400                   jmp .stmt404
  7433                                  .stmt402:
  7434 000038F4 A0[2100]                 mov al, [thechar]
  7435 000038F7 3C3A                     cmp al, 58
  7436 000038F9 0F853000                 jne .stmt405
  7437                                  
  7438                                  ;-710         prs("\n."); // Label
  7439                                  
  7440 000038FD 68[6A39]                 push stmt_5
  7441 00003900 E8210C                   call prs
  7442 00003903 83C402                   add  sp, 2
  7443                                  
  7444                                  ;-711         prs(symbol); prc(':');  
  7445                                  
  7446 00003906 8D062B81                 lea  ax, [symbol]
  7447 0000390A 50                       push ax
  7448 0000390B E8160C                   call prs
  7449 0000390E 83C402                   add  sp, 2
  7450 00003911 6A3A                     push 58
  7451 00003913 E8A70B                   call prc
  7452 00003916 83C402                   add  sp, 2
  7453                                  
  7454                                  ;-712         expect(T_NAME); 
  7455                                  
  7456 00003919 680001                   push 256
  7457 0000391C E8F20A                   call expect
  7458 0000391F 83C402                   add  sp, 2
  7459                                  
  7460                                  ;-713         expect(':'); 
  7461                                  
  7462 00003922 6A3A                     push 58
  7463 00003924 E8EA0A                   call expect
  7464 00003927 83C402                   add  sp, 2
  7465                                  
  7466                                  ;-714         }
  7467                                  
  7468                                  
  7469                                  ;-715   else  {exprstart(); expect(';'); } 
  7470                                  
  7471 0000392A E90B00                   jmp .stmt406
  7472                                  .stmt405:
  7473 0000392D E8FED8                   call exprstart
  7474 00003930 6A3B                     push 59
  7475 00003932 E8DC0A                   call expect
  7476 00003935 83C402                   add  sp, 2
  7477                                  
  7478                                  ;-716 }
  7479                                  
  7480                                  .stmt406:
  7481                                  .stmt404:
  7482                                  .stmt401:
  7483                                  .stmt399:
  7484                                  .stmt397:
  7485                                  .stmt391:
  7486                                  .stmt387:
  7487                                  .stmt385:
  7488                                  .stmt383:
  7489                                  .stmt381:
  7490                                  .stmt379:
  7491                                  
  7492                                  ;-717 
  7493                                  
  7494                                  
  7495                                  ;-718 int doemit() {prs("\n db ");
  7496 00003938 C9                       LEAVE
  7497 00003939 C3                       ret
  7498                                  ; ENDP
  7499 0000393A 5C6E206A6D70202E00      stmt_0 db "\n jmp .",0
  7500 00003943 5C6E00                  stmt_1 db "\n",0
  7501 00003946 5C6E00                  stmt_2 db "\n",0
  7502 00003949 4375726C79206F7065-     stmt_3 db "Curly open expected",0
  7503 00003952 6E2065787065637465-
  7504 0000395B 6400               
  7505 0000395D 5C6E206A6D70202E72-     stmt_4 db "\n jmp .retn",0
  7506 00003966 65746E00           
  7507 0000396A 5C6E2E00                stmt_5 db "\n.",0
  7508                                  
  7509                                  doemit:  ; *** PROC ***
  7510 0000396E 68[AA39]                 push doemit_0
  7511 00003971 E8B00B                   call prs
  7512 00003974 83C402                   add  sp, 2
  7513                                  
  7514                                  ;-719   L1: token=getlex(); prunsign1(lexval); token=getlex();
  7515                                  
  7516                                  .L1:
  7517 00003977 E85103                   call getlex
  7518 0000397A A3[1C00]                 mov word [token], ax
  7519 0000397D FF36[2E00]               push word [lexval]
  7520 00003981 E8FA0C                   call prunsign1
  7521 00003984 83C402                   add  sp, 2
  7522 00003987 E84103                   call getlex
  7523 0000398A A3[1C00]                 mov word [token], ax
  7524                                  
  7525                                  ;-720     if (token== ',') {prc(','); goto L1;} expect(')'); }
  7526                                  
  7527 0000398D A1[1C00]                 mov ax, [token]
  7528 00003990 83F82C                   cmp ax, 44
  7529 00003993 0F850A00                 jne .doemit407
  7530 00003997 6A2C                     push 44
  7531 00003999 E8210B                   call prc
  7532 0000399C 83C402                   add  sp, 2
  7533 0000399F EBD6                     jmp .L1
  7534                                  .doemit407:
  7535 000039A1 6A29                     push 41
  7536 000039A3 E86B0A                   call expect
  7537 000039A6 83C402                   add  sp, 2
  7538                                  
  7539                                  ;-721 
  7540                                  
  7541                                  
  7542                                  ;-722 int cmpneg(int ids) {
  7543                                  
  7544 000039A9 C3                       ret
  7545                                  ; ENDP
  7546 000039AA 5C6E2064622000          doemit_0 db "\n db ",0
  7547                                  
  7548                                  cmpneg:  ; *** PROC ***
  7549                                  
  7550                                  ;-723        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
  7551                                  
  7552                                  ;Function : cmpneg, Number of local variables: 1
  7553                                  ;   # type sign width addr used name   list of local variables
  7554                                  ;  200 var sign word   722 NULL ids = bp+4;
  7555 000039B1 C8000000                 ENTER  0,0
  7556 000039B5 A1[2200]                 mov ax, [iscmp]
  7557 000039B8 3D2603                   cmp ax, 806
  7558 000039BB 0F850C00                 jne .cmpneg408
  7559 000039BF 68[923A]                 push cmpneg_0
  7560 000039C2 E85F0B                   call prs
  7561 000039C5 83C402                   add  sp, 2
  7562                                  
  7563                                  ;-724   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1
  7564                                  
  7565 000039C8 E9C500                   jmp .cmpneg409
  7566                                  .cmpneg408:
  7567 000039CB A1[2200]                 mov ax, [iscmp]
  7568 000039CE 3D2703                   cmp ax, 807
  7569 000039D1 0F850C00                 jne .cmpneg410
  7570 000039D5 68[9B3A]                 push cmpneg_1
  7571 000039D8 E8490B                   call prs
  7572 000039DB 83C402                   add  sp, 2
  7573                                  
  7574                                  ;-725   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF
  7575                                  
  7576 000039DE E9AF00                   jmp .cmpneg411
  7577                                  .cmpneg410:
  7578 000039E1 A1[2200]                 mov ax, [iscmp]
  7579 000039E4 3D3803                   cmp ax, 824
  7580 000039E7 0F852100                 jne .cmpneg412
  7581 000039EB 8B4604                   mov ax, [bp+4]
  7582 000039EE 08C0                     or  al, al
  7583 000039F0 0F840C00                 je .cmpneg413
  7584 000039F4 68[A43A]                 push cmpneg_2
  7585 000039F7 E82A0B                   call prs
  7586 000039FA 83C402                   add  sp, 2
  7587                                  
  7588                                  ;-726                            else prs("\n ja  .");//ZF=0 CF=0
  7589                                  
  7590 000039FD E90900                   jmp .cmpneg414
  7591                                  .cmpneg413:
  7592 00003A00 68[AD3A]                 push cmpneg_3
  7593 00003A03 E81E0B                   call prs
  7594 00003A06 83C402                   add  sp, 2
  7595                                  
  7596                                  ;-727   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);
  7597                                  
  7598                                  .cmpneg414:
  7599 00003A09 E98400                   jmp .cmpneg415
  7600                                  .cmpneg412:
  7601 00003A0C A1[2200]                 mov ax, [iscmp]
  7602 00003A0F 3D2B03                   cmp ax, 811
  7603 00003A12 0F854500                 jne .cmpneg416
  7604 00003A16 8B4604                   mov ax, [bp+4]
  7605 00003A19 08C0                     or  al, al
  7606 00003A1B 0F841E00                 je .cmpneg417
  7607 00003A1F 68[B63A]                 push cmpneg_4
  7608 00003A22 E8FF0A                   call prs
  7609 00003A25 83C402                   add  sp, 2
  7610 00003A28 FF7604                   push word [bp+4]
  7611 00003A2B E8500C                   call prunsign1
  7612 00003A2E 83C402                   add  sp, 2
  7613                                  
  7614                                  ;-728                                prs("\n jl  .");}//          SF!=OF
  7615                                  
  7616 00003A31 68[C43A]                 push cmpneg_5
  7617 00003A34 E8ED0A                   call prs
  7618 00003A37 83C402                   add  sp, 2
  7619                                  
  7620                                  ;-729                            else{prs(" ;unsigned : "); prunsign1(ids);
  7621                                  
  7622 00003A3A E91B00                   jmp .cmpneg418
  7623                                  .cmpneg417:
  7624 00003A3D 68[CD3A]                 push cmpneg_6
  7625 00003A40 E8E10A                   call prs
  7626 00003A43 83C402                   add  sp, 2
  7627 00003A46 FF7604                   push word [bp+4]
  7628 00003A49 E8320C                   call prunsign1
  7629 00003A4C 83C402                   add  sp, 2
  7630                                  
  7631                                  ;-730                                prs("\n jb  .");}//jb=jc=CF=1
  7632                                  
  7633 00003A4F 68[DB3A]                 push cmpneg_7
  7634 00003A52 E8CF0A                   call prs
  7635 00003A55 83C402                   add  sp, 2
  7636                                  
  7637                                  ;-731   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF
  7638                                  
  7639                                  .cmpneg418:
  7640 00003A58 E93500                   jmp .cmpneg419
  7641                                  .cmpneg416:
  7642 00003A5B A1[2200]                 mov ax, [iscmp]
  7643 00003A5E 83F83C                   cmp ax, 60
  7644 00003A61 0F850C00                 jne .cmpneg420
  7645 00003A65 68[E43A]                 push cmpneg_8
  7646 00003A68 E8B90A                   call prs
  7647 00003A6B 83C402                   add  sp, 2
  7648                                  
  7649                                  ;-732   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF
  7650                                  
  7651 00003A6E E91F00                   jmp .cmpneg421
  7652                                  .cmpneg420:
  7653 00003A71 A1[2200]                 mov ax, [iscmp]
  7654 00003A74 83F83E                   cmp ax, 62
  7655 00003A77 0F850C00                 jne .cmpneg422
  7656 00003A7B 68[ED3A]                 push cmpneg_9
  7657 00003A7E E8A30A                   call prs
  7658 00003A81 83C402                   add  sp, 2
  7659                                  
  7660                                  ;-733   else error1("Vergleich unbekannt in CMPNEG()");  }
  7661                                  
  7662 00003A84 E90900                   jmp .cmpneg423
  7663                                  .cmpneg422:
  7664 00003A87 68[F63A]                 push cmpneg_10
  7665 00003A8A E8820D                   call error1
  7666 00003A8D 83C402                   add  sp, 2
  7667                                  .cmpneg423:
  7668                                  .cmpneg421:
  7669                                  .cmpneg419:
  7670                                  .cmpneg415:
  7671                                  .cmpneg411:
  7672                                  .cmpneg409:
  7673                                  
  7674                                  ;-734 
  7675                                  
  7676                                  
  7677                                  ;-735 int prlabel(int n) {prs("\n."); prs(fname); pint1(n); prc(':'); }
  7678 00003A90 C9                       LEAVE
  7679 00003A91 C3                       ret
  7680                                  ; ENDP
  7681 00003A92 5C6E206A6E65202E00      cmpneg_0 db "\n jne .",0
  7682 00003A9B 5C6E206A6520202E00      cmpneg_1 db "\n je  .",0
  7683 00003AA4 5C6E206A6720202E00      cmpneg_2 db "\n jg  .",0
  7684 00003AAD 5C6E206A6120202E00      cmpneg_3 db "\n ja  .",0
  7685 00003AB6 203B756E7369676E65-     cmpneg_4 db " ;unsigned : ",0
  7686 00003ABF 64203A2000         
  7687 00003AC4 5C6E206A6C20202E00      cmpneg_5 db "\n jl  .",0
  7688 00003ACD 203B756E7369676E65-     cmpneg_6 db " ;unsigned : ",0
  7689 00003AD6 64203A2000         
  7690 00003ADB 5C6E206A6220202E00      cmpneg_7 db "\n jb  .",0
  7691 00003AE4 5C6E206A6765202E00      cmpneg_8 db "\n jge .",0
  7692 00003AED 5C6E206A6C65202E00      cmpneg_9 db "\n jle .",0
  7693 00003AF6 566572676C65696368-     cmpneg_10 db "Vergleich unbekannt in CMPNEG()",0
  7694 00003AFF 20756E62656B616E6E-
  7695 00003B08 7420696E20434D504E-
  7696 00003B11 4547282900         
  7697                                  
  7698                                  prlabel:  ; *** PROC ***
  7699                                  ;Function : prlabel, Number of local variables: 1
  7700                                  ;   # type sign width addr used name   list of local variables
  7701                                  ;  200 var sign word   735 NULL n = bp+4;
  7702 00003B16 C8000000                 ENTER  0,0
  7703 00003B1A 68[413B]                 push prlabel_0
  7704 00003B1D E8040A                   call prs
  7705 00003B20 83C402                   add  sp, 2
  7706 00003B23 8D06AB81                 lea  ax, [fname]
  7707 00003B27 50                       push ax
  7708 00003B28 E8F909                   call prs
  7709 00003B2B 83C402                   add  sp, 2
  7710 00003B2E FF7604                   push word [bp+4]
  7711 00003B31 E8E70A                   call pint1
  7712 00003B34 83C402                   add  sp, 2
  7713 00003B37 6A3A                     push 58
  7714 00003B39 E88109                   call prc
  7715 00003B3C 83C402                   add  sp, 2
  7716                                  
  7717                                  ;-736 int prjump (int n) {prs("\n jmp ."); prs(fname); pint1(n); }
  7718 00003B3F C9                       LEAVE
  7719 00003B40 C3                       ret
  7720                                  ; ENDP
  7721 00003B41 5C6E2E00                prlabel_0 db "\n.",0
  7722                                  
  7723                                  prjump:  ; *** PROC ***
  7724                                  ;Function : prjump, Number of local variables: 1
  7725                                  ;   # type sign width addr used name   list of local variables
  7726                                  ;  200 var sign word   736 NULL n = bp+4;
  7727 00003B45 C8000000                 ENTER  0,0
  7728 00003B49 68[683B]                 push prjump_0
  7729 00003B4C E8D509                   call prs
  7730 00003B4F 83C402                   add  sp, 2
  7731 00003B52 8D06AB81                 lea  ax, [fname]
  7732 00003B56 50                       push ax
  7733 00003B57 E8CA09                   call prs
  7734 00003B5A 83C402                   add  sp, 2
  7735 00003B5D FF7604                   push word [bp+4]
  7736 00003B60 E8B80A                   call pint1
  7737 00003B63 83C402                   add  sp, 2
  7738                                  
  7739                                  ;-737 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
  7740 00003B66 C9                       LEAVE
  7741 00003B67 C3                       ret
  7742                                  ; ENDP
  7743 00003B68 5C6E206A6D70202E00      prjump_0 db "\n jmp .",0
  7744                                  
  7745                                  doif:  ; *** PROC ***
  7746                                  ;Function : doif, Number of local variables: 2
  7747                                  ;   # type sign width addr used name   list of local variables
  7748                                  ;  200 var sign word   737 NULL jdest = bp-2
  7749                                  ;  201 var sign word   737 NULL tst = bp-4;
  7750 00003B71 C8040000                 ENTER  4,0
  7751 00003B75 E82AD5                   call pexpr
  7752 00003B78 FF06[2800]               inc  word[nlabel]
  7753 00003B7C A1[2800]                 mov ax, [nlabel]
  7754 00003B7F 8946FE                   mov [bp-2], ax
  7755                                  
  7756                                  ;-738   pint1(jdest); stmt();
  7757                                  
  7758 00003B82 FF76FE                   push word [bp-2]
  7759 00003B85 E8930A                   call pint1
  7760 00003B88 83C402                   add  sp, 2
  7761 00003B8B E8DCFB                   call stmt
  7762                                  
  7763                                  ;-739   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;
  7764                                  
  7765 00003B8E 680202                   push 514
  7766 00003B91 E85B08                   call istoken
  7767 00003B94 83C402                   add  sp, 2
  7768 00003B97 08C0                     or  al, al
  7769 00003B99 0F842B00                 je .doif424
  7770 00003B9D FF06[2800]               inc  word[nlabel]
  7771 00003BA1 A1[2800]                 mov ax, [nlabel]
  7772 00003BA4 8946FC                   mov [bp-4], ax
  7773                                  
  7774                                  ;-740     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }
  7775                                  
  7776 00003BA7 FF76FC                   push word [bp-4]
  7777 00003BAA E898FF                   call prjump
  7778 00003BAD 83C402                   add  sp, 2
  7779 00003BB0 FF76FE                   push word [bp-2]
  7780 00003BB3 E860FF                   call prlabel
  7781 00003BB6 83C402                   add  sp, 2
  7782 00003BB9 E8AEFB                   call stmt
  7783 00003BBC FF76FC                   push word [bp-4]
  7784 00003BBF E854FF                   call prlabel
  7785 00003BC2 83C402                   add  sp, 2
  7786                                  
  7787                                  ;-741   else prlabel(jdest); }
  7788                                  
  7789 00003BC5 E90900                   jmp .doif425
  7790                                  .doif424:
  7791 00003BC8 FF76FE                   push word [bp-2]
  7792 00003BCB E848FF                   call prlabel
  7793 00003BCE 83C402                   add  sp, 2
  7794                                  .doif425:
  7795                                  
  7796                                  ;-742 
  7797                                  
  7798                                  
  7799                                  ;-743 int dodo() {int jdest; int jtemp;
  7800 00003BD1 C9                       LEAVE
  7801 00003BD2 C3                       ret
  7802                                  ; ENDP
  7803                                  
  7804                                  dodo:  ; *** PROC ***
  7805                                  
  7806                                  ;-744   nlabel++; jdest=nlabel; prlabel(jdest); stmt();
  7807                                  
  7808                                  ;Function : dodo, Number of local variables: 2
  7809                                  ;   # type sign width addr used name   list of local variables
  7810                                  ;  200 var sign word   743 NULL jdest = bp-2
  7811                                  ;  201 var sign word   743 NULL jtemp = bp-4;
  7812 00003BD3 C8040000                 ENTER  4,0
  7813 00003BD7 FF06[2800]               inc  word[nlabel]
  7814 00003BDB A1[2800]                 mov ax, [nlabel]
  7815 00003BDE 8946FE                   mov [bp-2], ax
  7816 00003BE1 FF76FE                   push word [bp-2]
  7817 00003BE4 E82FFF                   call prlabel
  7818 00003BE7 83C402                   add  sp, 2
  7819 00003BEA E87DFB                   call stmt
  7820                                  
  7821                                  ;-745   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);
  7822                                  
  7823 00003BED 680302                   push 515
  7824 00003BF0 E81E08                   call expect
  7825 00003BF3 83C402                   add  sp, 2
  7826 00003BF6 E8A9D4                   call pexpr
  7827 00003BF9 FF06[2800]               inc  word[nlabel]
  7828 00003BFD A1[2800]                 mov ax, [nlabel]
  7829 00003C00 8946FC                   mov [bp-4], ax
  7830 00003C03 FF76FC                   push word [bp-4]
  7831 00003C06 E8120A                   call pint1
  7832 00003C09 83C402                   add  sp, 2
  7833                                  
  7834                                  ;-746   prjump(jdest); prlabel(jtemp); }
  7835                                  
  7836 00003C0C FF76FE                   push word [bp-2]
  7837 00003C0F E833FF                   call prjump
  7838 00003C12 83C402                   add  sp, 2
  7839 00003C15 FF76FC                   push word [bp-4]
  7840 00003C18 E8FBFE                   call prlabel
  7841 00003C1B 83C402                   add  sp, 2
  7842                                  
  7843                                  ;-747 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
  7844 00003C1E C9                       LEAVE
  7845 00003C1F C3                       ret
  7846                                  ; ENDP
  7847                                  
  7848                                  dowhile:  ; *** PROC ***
  7849                                  ;Function : dowhile, Number of local variables: 2
  7850                                  ;   # type sign width addr used name   list of local variables
  7851                                  ;  200 var sign word   747 NULL jdest = bp-2
  7852                                  ;  201 var sign word   747 NULL tst = bp-4;
  7853 00003C20 C8040000                 ENTER  4,0
  7854 00003C24 FF06[2800]               inc  word[nlabel]
  7855 00003C28 A1[2800]                 mov ax, [nlabel]
  7856 00003C2B 8946FE                   mov [bp-2], ax
  7857                                  
  7858                                  ;-748   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);
  7859                                  
  7860 00003C2E FF76FE                   push word [bp-2]
  7861 00003C31 E8E2FE                   call prlabel
  7862 00003C34 83C402                   add  sp, 2
  7863 00003C37 E868D4                   call pexpr
  7864 00003C3A FF06[2800]               inc  word[nlabel]
  7865 00003C3E A1[2800]                 mov ax, [nlabel]
  7866 00003C41 8946FC                   mov [bp-4], ax
  7867 00003C44 FF76FC                   push word [bp-4]
  7868 00003C47 E8D109                   call pint1
  7869 00003C4A 83C402                   add  sp, 2
  7870                                  
  7871                                  ;-749   stmt(); prjump(jdest); prlabel(tst); }
  7872                                  
  7873 00003C4D E81AFB                   call stmt
  7874 00003C50 FF76FE                   push word [bp-2]
  7875 00003C53 E8EFFE                   call prjump
  7876 00003C56 83C402                   add  sp, 2
  7877 00003C59 FF76FC                   push word [bp-4]
  7878 00003C5C E8B7FE                   call prlabel
  7879 00003C5F 83C402                   add  sp, 2
  7880                                  
  7881                                  ;-750 int isrelational() {
  7882 00003C62 C9                       LEAVE
  7883 00003C63 C3                       ret
  7884                                  ; ENDP
  7885                                  
  7886                                  isrelational:  ; *** PROC ***
  7887                                  
  7888                                  ;-751   if (token==T_EQ) goto w; if (token==T_NE) goto w;
  7889                                  
  7890 00003C64 A1[1C00]                 mov ax, [token]
  7891 00003C67 3D2603                   cmp ax, 806
  7892 00003C6A 0F850300                 jne .isrelational426
  7893 00003C6E E94700                   jmp .w
  7894                                  .isrelational426:
  7895 00003C71 A1[1C00]                 mov ax, [token]
  7896 00003C74 3D2703                   cmp ax, 807
  7897 00003C77 0F850300                 jne .isrelational427
  7898 00003C7B E93A00                   jmp .w
  7899                                  
  7900                                  ;-752   if (token==T_LE) goto w; if (token==T_GE) goto w;
  7901                                  
  7902                                  .isrelational427:
  7903 00003C7E A1[1C00]                 mov ax, [token]
  7904 00003C81 3D3803                   cmp ax, 824
  7905 00003C84 0F850300                 jne .isrelational428
  7906 00003C88 E92D00                   jmp .w
  7907                                  .isrelational428:
  7908 00003C8B A1[1C00]                 mov ax, [token]
  7909 00003C8E 3D2B03                   cmp ax, 811
  7910 00003C91 0F850300                 jne .isrelational429
  7911 00003C95 E92000                   jmp .w
  7912                                  
  7913                                  ;-753   if (token=='<' ) goto w; if (token=='>' ) goto w;
  7914                                  
  7915                                  .isrelational429:
  7916 00003C98 A1[1C00]                 mov ax, [token]
  7917 00003C9B 83F83C                   cmp ax, 60
  7918 00003C9E 0F850300                 jne .isrelational430
  7919 00003CA2 E91300                   jmp .w
  7920                                  .isrelational430:
  7921 00003CA5 A1[1C00]                 mov ax, [token]
  7922 00003CA8 83F83E                   cmp ax, 62
  7923 00003CAB 0F850300                 jne .isrelational431
  7924 00003CAF E90600                   jmp .w
  7925                                  
  7926                                  ;-754   return 0;  w: iscmp=token; token=getlex(); return 1;}
  7927                                  
  7928                                  .isrelational431:
  7929 00003CB2 B80000                   mov ax, 0
  7930 00003CB5 E91200                   jmp .retn
  7931                                  .w:
  7932 00003CB8 A1[1C00]                 mov ax, [token]
  7933 00003CBB A3[2200]                 mov word [iscmp], ax
  7934 00003CBE E80A00                   call getlex
  7935 00003CC1 A3[1C00]                 mov word [token], ax
  7936 00003CC4 B80100                   mov ax, 1
  7937 00003CC7 E90000                   jmp .retn
  7938                                  
  7939                                  ;-755  
  7940                                  
  7941                                  
  7942                                  ;-756 char symboltemp[80];    
  7943                                  
  7944                                   .retn:
  7945 00003CCA C3                       ret
  7946                                  ; ENDP
  7947                                  section .bss
  7948                                  absolute 53468
  7949 0000D0DC <res 00000050>          symboltemp resb 80
  7950                                  section .text
  7951                                  
  7952                                  ;-757 int getlex() { char c; char *p; 
  7953                                  
  7954                                  
  7955                                  getlex:  ; *** PROC ***
  7956                                  
  7957                                  ;-758 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;
  7958                                  
  7959                                  ;Function : getlex, Number of local variables: 2
  7960                                  ;   # type sign width addr used name   list of local variables
  7961                                  ;  200 var sign byte   757 NULL c = bp-2
  7962                                  ;  201 ptr sign byte   757 NULL p = bp-4;
  7963 00003CCB C8040000                 ENTER  4,0
  7964                                  .g1:
  7965 00003CCF E8FF06                   call next
  7966 00003CD2 8846FE                   mov [bp-2], al
  7967 00003CD5 8A46FE                   mov al, [bp-2]
  7968 00003CD8 3C00                     cmp al, 0
  7969 00003CDA 0F850600                 jne .getlex432
  7970 00003CDE B80000                   mov ax, 0
  7971 00003CE1 E9EB04                   jmp .retn
  7972                                  .getlex432:
  7973 00003CE4 8A46FE                   mov al, [bp-2]
  7974 00003CE7 3C20                     cmp al, 32
  7975 00003CE9 0F8F0200                 jg  .getlex433
  7976 00003CED EBE0                     jmp .g1
  7977                                  
  7978                                  ;-759   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}
  7979                                  
  7980                                  .getlex433:
  7981 00003CEF 8A46FE                   mov al, [bp-2]
  7982 00003CF2 3C3D                     cmp al, 61
  7983 00003CF4 0F851200                 jne .getlex434
  7984 00003CF8 A0[2100]                 mov al, [thechar]
  7985 00003CFB 3C3D                     cmp al, 61
  7986 00003CFD 0F850900                 jne .getlex435
  7987 00003D01 E8CD06                   call next
  7988 00003D04 B82603                   mov ax, 806
  7989 00003D07 E9C504                   jmp .retn
  7990                                  .getlex435:
  7991                                  
  7992                                  ;-760   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}
  7993                                  
  7994                                  .getlex434:
  7995 00003D0A 8A46FE                   mov al, [bp-2]
  7996 00003D0D 3C21                     cmp al, 33
  7997 00003D0F 0F851200                 jne .getlex436
  7998 00003D13 A0[2100]                 mov al, [thechar]
  7999 00003D16 3C3D                     cmp al, 61
  8000 00003D18 0F850900                 jne .getlex437
  8001 00003D1C E8B206                   call next
  8002 00003D1F B82703                   mov ax, 807
  8003 00003D22 E9AA04                   jmp .retn
  8004                                  .getlex437:
  8005                                  
  8006                                  ;-761   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}
  8007                                  
  8008                                  .getlex436:
  8009 00003D25 8A46FE                   mov al, [bp-2]
  8010 00003D28 3C3C                     cmp al, 60
  8011 00003D2A 0F851200                 jne .getlex438
  8012 00003D2E A0[2100]                 mov al, [thechar]
  8013 00003D31 3C3D                     cmp al, 61
  8014 00003D33 0F850900                 jne .getlex439
  8015 00003D37 E89706                   call next
  8016 00003D3A B83803                   mov ax, 824
  8017 00003D3D E98F04                   jmp .retn
  8018                                  .getlex439:
  8019                                  
  8020                                  ;-762   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}
  8021                                  
  8022                                  .getlex438:
  8023 00003D40 8A46FE                   mov al, [bp-2]
  8024 00003D43 3C3E                     cmp al, 62
  8025 00003D45 0F851200                 jne .getlex440
  8026 00003D49 A0[2100]                 mov al, [thechar]
  8027 00003D4C 3C3D                     cmp al, 61
  8028 00003D4E 0F850900                 jne .getlex441
  8029 00003D52 E87C06                   call next
  8030 00003D55 B82B03                   mov ax, 811
  8031 00003D58 E97404                   jmp .retn
  8032                                  .getlex441:
  8033                                  
  8034                                  ;-763   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}
  8035                                  
  8036                                  .getlex440:
  8037 00003D5B 8A46FE                   mov al, [bp-2]
  8038 00003D5E 3C3C                     cmp al, 60
  8039 00003D60 0F851200                 jne .getlex442
  8040 00003D64 A0[2100]                 mov al, [thechar]
  8041 00003D67 3C3C                     cmp al, 60
  8042 00003D69 0F850900                 jne .getlex443
  8043 00003D6D E86106                   call next
  8044 00003D70 B8D804                   mov ax, 1240
  8045 00003D73 E95904                   jmp .retn
  8046                                  .getlex443:
  8047                                  
  8048                                  ;-764   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}
  8049                                  
  8050                                  .getlex442:
  8051 00003D76 8A46FE                   mov al, [bp-2]
  8052 00003D79 3C3E                     cmp al, 62
  8053 00003D7B 0F851200                 jne .getlex444
  8054 00003D7F A0[2100]                 mov al, [thechar]
  8055 00003D82 3C3E                     cmp al, 62
  8056 00003D84 0F850900                 jne .getlex445
  8057 00003D88 E84606                   call next
  8058 00003D8B B8D904                   mov ax, 1241
  8059 00003D8E E93E04                   jmp .retn
  8060                                  .getlex445:
  8061                                  
  8062                                  ;-765   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}
  8063                                  
  8064                                  .getlex444:
  8065 00003D91 8A46FE                   mov al, [bp-2]
  8066 00003D94 3C2B                     cmp al, 43
  8067 00003D96 0F851200                 jne .getlex446
  8068 00003D9A A0[2100]                 mov al, [thechar]
  8069 00003D9D 3C2B                     cmp al, 43
  8070 00003D9F 0F850900                 jne .getlex447
  8071 00003DA3 E82B06                   call next
  8072 00003DA6 B8C304                   mov ax, 1219
  8073 00003DA9 E92304                   jmp .retn
  8074                                  .getlex447:
  8075                                  
  8076                                  ;-766   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}
  8077                                  
  8078                                  .getlex446:
  8079 00003DAC 8A46FE                   mov al, [bp-2]
  8080 00003DAF 3C2D                     cmp al, 45
  8081 00003DB1 0F851200                 jne .getlex448
  8082 00003DB5 A0[2100]                 mov al, [thechar]
  8083 00003DB8 3C2D                     cmp al, 45
  8084 00003DBA 0F850900                 jne .getlex449
  8085 00003DBE E81006                   call next
  8086 00003DC1 B8C904                   mov ax, 1225
  8087 00003DC4 E90804                   jmp .retn
  8088                                  .getlex449:
  8089                                  
  8090                                  ;-767   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}
  8091                                  
  8092                                  .getlex448:
  8093 00003DC7 8A46FE                   mov al, [bp-2]
  8094 00003DCA 3C2B                     cmp al, 43
  8095 00003DCC 0F851200                 jne .getlex450
  8096 00003DD0 A0[2100]                 mov al, [thechar]
  8097 00003DD3 3C3D                     cmp al, 61
  8098 00003DD5 0F850900                 jne .getlex451
  8099 00003DD9 E8F505                   call next
  8100 00003DDC B8CE04                   mov ax, 1230
  8101 00003DDF E9ED03                   jmp .retn
  8102                                  .getlex451:
  8103                                  
  8104                                  ;-768   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}
  8105                                  
  8106                                  .getlex450:
  8107 00003DE2 8A46FE                   mov al, [bp-2]
  8108 00003DE5 3C2D                     cmp al, 45
  8109 00003DE7 0F851200                 jne .getlex452
  8110 00003DEB A0[2100]                 mov al, [thechar]
  8111 00003DEE 3C3D                     cmp al, 61
  8112 00003DF0 0F850900                 jne .getlex453
  8113 00003DF4 E8DA05                   call next
  8114 00003DF7 B8CF04                   mov ax, 1231
  8115 00003DFA E9D203                   jmp .retn
  8116                                  .getlex453:
  8117                                  
  8118                                  ;-769   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}
  8119                                  
  8120                                  .getlex452:
  8121 00003DFD 8A46FE                   mov al, [bp-2]
  8122 00003E00 3C26                     cmp al, 38
  8123 00003E02 0F851200                 jne .getlex454
  8124 00003E06 A0[2100]                 mov al, [thechar]
  8125 00003E09 3C3D                     cmp al, 61
  8126 00003E0B 0F850900                 jne .getlex455
  8127 00003E0F E8BF05                   call next
  8128 00003E12 B8D204                   mov ax, 1234
  8129 00003E15 E9B703                   jmp .retn
  8130                                  .getlex455:
  8131                                  
  8132                                  ;-770   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}    
  8133                                  
  8134                                  .getlex454:
  8135 00003E18 8A46FE                   mov al, [bp-2]
  8136 00003E1B 3C7C                     cmp al, 124
  8137 00003E1D 0F851200                 jne .getlex456
  8138 00003E21 A0[2100]                 mov al, [thechar]
  8139 00003E24 3C3D                     cmp al, 61
  8140 00003E26 0F850900                 jne .getlex457
  8141 00003E2A E8A405                   call next
  8142 00003E2D B8D304                   mov ax, 1235
  8143 00003E30 E99C03                   jmp .retn
  8144                                  .getlex457:
  8145                                  
  8146                                  ;-771   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}
  8147                                  
  8148                                  .getlex456:
  8149 00003E33 8A46FE                   mov al, [bp-2]
  8150 00003E36 3C2A                     cmp al, 42
  8151 00003E38 0F851200                 jne .getlex458
  8152 00003E3C A0[2100]                 mov al, [thechar]
  8153 00003E3F 3C3D                     cmp al, 61
  8154 00003E41 0F850900                 jne .getlex459
  8155 00003E45 E88905                   call next
  8156 00003E48 B8D004                   mov ax, 1232
  8157 00003E4B E98103                   jmp .retn
  8158                                  .getlex459:
  8159                                  
  8160                                  ;-772   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}        
  8161                                  
  8162                                  .getlex458:
  8163 00003E4E 8A46FE                   mov al, [bp-2]
  8164 00003E51 3C2F                     cmp al, 47
  8165 00003E53 0F851200                 jne .getlex460
  8166 00003E57 A0[2100]                 mov al, [thechar]
  8167 00003E5A 3C3D                     cmp al, 61
  8168 00003E5C 0F850900                 jne .getlex461
  8169 00003E60 E86E05                   call next
  8170 00003E63 B8D104                   mov ax, 1233
  8171 00003E66 E96603                   jmp .retn
  8172                                  .getlex461:
  8173                                  
  8174                                  ;-773   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;
  8175                                  
  8176                                  .getlex460:
  8177 00003E69 8A46FE                   mov al, byte [bp-2]
  8178 00003E6C B400                     mov ah, 0
  8179 00003E6E 50                       push ax
  8180 00003E6F 68[D141]                 push getlex_0
  8181 00003E72 E86DC3                   call instr1
  8182 00003E75 83C404                   add  sp, 4
  8183 00003E78 08C0                     or  al, al
  8184 00003E7A 0F840600                 je .getlex462
  8185 00003E7E 8A46FE                   mov al, [bp-2]
  8186 00003E81 E94B03                   jmp .retn
  8187                                  
  8188                                  ;-774   if (c == '/') { if (thechar == '/') {
  8189                                  
  8190                                  .getlex462:
  8191 00003E84 8A46FE                   mov al, [bp-2]
  8192 00003E87 3C2F                     cmp al, 47
  8193 00003E89 0F852000                 jne .getlex463
  8194 00003E8D A0[2100]                 mov al, [thechar]
  8195 00003E90 3C2F                     cmp al, 47
  8196 00003E92 0F851700                 jne .getlex464
  8197                                  
  8198                                  ;-775       do c=next(); while(c != 13); /* c=next(); */ return getlex(); } }
  8199                                  
  8200                                  .getlex465:
  8201 00003E96 E83805                   call next
  8202 00003E99 8846FE                   mov [bp-2], al
  8203 00003E9C 8A46FE                   mov al, [bp-2]
  8204 00003E9F 3C0D                     cmp al, 13
  8205 00003EA1 0F840200                 je  .getlex466
  8206 00003EA5 EBEF                     jmp .getlex465
  8207                                  .getlex466:
  8208 00003EA7 E821FE                   call getlex
  8209 00003EAA E92203                   jmp .retn
  8210                                  .getlex464:
  8211                                  
  8212                                  ;-776   if (c == '/') { if (thechar == '*') {
  8213                                  
  8214                                  .getlex463:
  8215 00003EAD 8A46FE                   mov al, [bp-2]
  8216 00003EB0 3C2F                     cmp al, 47
  8217 00003EB2 0F853A00                 jne .getlex467
  8218 00003EB6 A0[2100]                 mov al, [thechar]
  8219 00003EB9 3C2A                     cmp al, 42
  8220 00003EBB 0F852B00                 jne .getlex468
  8221                                  
  8222                                  ;-777       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;
  8223                                  
  8224                                  .g2:
  8225 00003EBF E80F05                   call next
  8226 00003EC2 8846FE                   mov [bp-2], al
  8227 00003EC5 8A46FE                   mov al, [bp-2]
  8228 00003EC8 3C2A                     cmp al, 42
  8229 00003ECA 0F840200                 je  .getlex469
  8230 00003ECE EBEF                     jmp .g2
  8231                                  .getlex469:
  8232 00003ED0 A0[2100]                 mov al, [thechar]
  8233 00003ED3 3C2F                     cmp al, 47
  8234 00003ED5 0F840200                 je  .getlex470
  8235 00003ED9 EBE4                     jmp .g2
  8236                                  
  8237                                  ;-778       c=next(); return getlex(); } else  return '/'; }
  8238                                  
  8239                                  .getlex470:
  8240 00003EDB E8F304                   call next
  8241 00003EDE 8846FE                   mov [bp-2], al
  8242 00003EE1 E8E7FD                   call getlex
  8243 00003EE4 E9E802                   jmp .retn
  8244 00003EE7 E90600                   jmp .getlex471
  8245                                  .getlex468:
  8246 00003EEA B82F00                   mov ax, 47
  8247 00003EED E9DF02                   jmp .retn
  8248                                  .getlex471:
  8249                                  
  8250                                  ;-779   if (c == '"') {getstring(c); return T_STRING;}
  8251                                  
  8252                                  .getlex467:
  8253 00003EF0 8A46FE                   mov al, [bp-2]
  8254 00003EF3 3C22                     cmp al, 34
  8255 00003EF5 0F851200                 jne .getlex472
  8256 00003EF9 8A46FE                   mov al, byte [bp-2]
  8257 00003EFC B400                     mov ah, 0
  8258 00003EFE 50                       push ax
  8259 00003EFF E89804                   call getstring
  8260 00003F02 83C402                   add  sp, 2
  8261 00003F05 B80201                   mov ax, 258
  8262 00003F08 E9C402                   jmp .retn
  8263                                  
  8264                                  ;-780   if (digit(c)) { getdigit(c); return T_CONST; }
  8265                                  
  8266                                  .getlex472:
  8267 00003F0B 8A46FE                   mov al, byte [bp-2]
  8268 00003F0E B400                     mov ah, 0
  8269 00003F10 50                       push ax
  8270 00003F11 E8CBC3                   call digit
  8271 00003F14 83C402                   add  sp, 2
  8272 00003F17 08C0                     or  al, al
  8273 00003F19 0F841200                 je .getlex473
  8274 00003F1D 8A46FE                   mov al, byte [bp-2]
  8275 00003F20 B400                     mov ah, 0
  8276 00003F22 50                       push ax
  8277 00003F23 E89E03                   call getdigit
  8278 00003F26 83C402                   add  sp, 2
  8279 00003F29 B80101                   mov ax, 257
  8280 00003F2C E9A002                   jmp .retn
  8281                                  
  8282                                  ;-781   if (c==39) { lexval=next();
  8283                                  
  8284                                  .getlex473:
  8285 00003F2F 8A46FE                   mov al, [bp-2]
  8286 00003F32 3C27                     cmp al, 39
  8287 00003F34 0F854F00                 jne .getlex474
  8288 00003F38 E89604                   call next
  8289 00003F3B A3[2E00]                 mov word [lexval], ax
  8290                                  
  8291                                  ;-782     if (lexval==92) {lexval=next();
  8292                                  
  8293 00003F3E A1[2E00]                 mov ax, [lexval]
  8294 00003F41 83F85C                   cmp ax, 92
  8295 00003F44 0F853600                 jne .getlex475
  8296 00003F48 E88604                   call next
  8297 00003F4B A3[2E00]                 mov word [lexval], ax
  8298                                  
  8299                                  ;-783       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;
  8300                                  
  8301 00003F4E A1[2E00]                 mov ax, [lexval]
  8302 00003F51 83F86E                   cmp ax, 110
  8303 00003F54 0F850600                 jne .getlex476
  8304 00003F58 B80A00                   mov ax, 10
  8305 00003F5B A3[2E00]                 mov word [lexval], ax
  8306                                  .getlex476:
  8307 00003F5E A1[2E00]                 mov ax, [lexval]
  8308 00003F61 83F874                   cmp ax, 116
  8309 00003F64 0F850600                 jne .getlex477
  8310 00003F68 B80900                   mov ax, 9
  8311 00003F6B A3[2E00]                 mov word [lexval], ax
  8312                                  
  8313                                  ;-784       if (lexval=='0') lexval= 0; } next(); return T_CONST; }
  8314                                  
  8315                                  .getlex477:
  8316 00003F6E A1[2E00]                 mov ax, [lexval]
  8317 00003F71 83F830                   cmp ax, 48
  8318 00003F74 0F850600                 jne .getlex478
  8319 00003F78 B80000                   mov ax, 0
  8320 00003F7B A3[2E00]                 mov word [lexval], ax
  8321                                  .getlex478:
  8322                                  .getlex475:
  8323 00003F7E E85004                   call next
  8324 00003F81 B80101                   mov ax, 257
  8325 00003F84 E94802                   jmp .retn
  8326                                  
  8327                                  ;-785   if (alnum(c)) { 
  8328                                  
  8329                                  .getlex474:
  8330 00003F87 8A46FE                   mov al, byte [bp-2]
  8331 00003F8A B400                     mov ah, 0
  8332 00003F8C 50                       push ax
  8333 00003F8D E8F7C3                   call alnum
  8334 00003F90 83C402                   add  sp, 2
  8335 00003F93 08C0                     or  al, al
  8336 00003F95 0F842D02                 je .getlex479
  8337                                  
  8338                                  ;-786     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;
  8339                                  
  8340 00003F99 8D062B81                 lea  ax, [symbol]
  8341 00003F9D 50                       push ax
  8342 00003F9E 8D06DCD0                 lea  ax, [symboltemp]
  8343 00003FA2 50                       push ax
  8344 00003FA3 E8C0C1                   call strcpy
  8345 00003FA6 83C404                   add  sp, 4
  8346 00003FA9 B82B81                   mov ax, symbol
  8347 00003FAC 8946FC                   mov [bp-4], ax
  8348 00003FAF 8A46FE                   mov al, [bp-2]
  8349 00003FB2 8B5EFC                   mov  bx, [bp-4]
  8350 00003FB5 8807                     mov  [bx], al
  8351 00003FB7 FF46FC                   inc  word[bp-4]
  8352                                  
  8353                                  ;-787     while(alnum(thechar)) {c=next(); *p=c;  p++; } 
  8354                                  
  8355                                  .getlex480:
  8356 00003FBA A0[2100]                 mov al, byte [thechar]
  8357 00003FBD B400                     mov ah, 0
  8358 00003FBF 50                       push ax
  8359 00003FC0 E8C4C3                   call alnum
  8360 00003FC3 83C402                   add  sp, 2
  8361 00003FC6 08C0                     or  al, al
  8362 00003FC8 0F841300                 je .getlex481
  8363 00003FCC E80204                   call next
  8364 00003FCF 8846FE                   mov [bp-2], al
  8365 00003FD2 8A46FE                   mov al, [bp-2]
  8366 00003FD5 8B5EFC                   mov  bx, [bp-4]
  8367 00003FD8 8807                     mov  [bx], al
  8368 00003FDA FF46FC                   inc  word[bp-4]
  8369                                  
  8370                                  ;-788       *p=0;
  8371                                  
  8372 00003FDD EBDB                     jmp .getlex480
  8373                                  .getlex481:
  8374 00003FDF B80000                   mov ax, 0
  8375 00003FE2 8B5EFC                   mov  bx, [bp-4]
  8376 00003FE5 8807                     mov  [bx], al
  8377                                  
  8378                                  ;-789     if (eqstr(symbol,"signed"  )) return T_SIGNED;
  8379                                  
  8380 00003FE7 68[E741]                 push getlex_1
  8381 00003FEA 8D062B81                 lea  ax, [symbol]
  8382 00003FEE 50                       push ax
  8383 00003FEF E8A4C1                   call eqstr
  8384 00003FF2 83C404                   add  sp, 4
  8385 00003FF5 08C0                     or  al, al
  8386 00003FF7 0F840600                 je .getlex482
  8387 00003FFB B81302                   mov ax, 531
  8388 00003FFE E9CE01                   jmp .retn
  8389                                  
  8390                                  ;-790     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;
  8391                                  
  8392                                  .getlex482:
  8393 00004001 68[EE41]                 push getlex_2
  8394 00004004 8D062B81                 lea  ax, [symbol]
  8395 00004008 50                       push ax
  8396 00004009 E88AC1                   call eqstr
  8397 0000400C 83C404                   add  sp, 4
  8398 0000400F 08C0                     or  al, al
  8399 00004011 0F840600                 je .getlex483
  8400 00004015 B81402                   mov ax, 532
  8401 00004018 E9B401                   jmp .retn
  8402                                  
  8403                                  ;-791     if (eqstr(symbol,"void"    )) return T_VOID;
  8404                                  
  8405                                  .getlex483:
  8406 0000401B 68[F741]                 push getlex_3
  8407 0000401E 8D062B81                 lea  ax, [symbol]
  8408 00004022 50                       push ax
  8409 00004023 E870C1                   call eqstr
  8410 00004026 83C404                   add  sp, 4
  8411 00004029 08C0                     or  al, al
  8412 0000402B 0F840600                 je .getlex484
  8413 0000402F B81102                   mov ax, 529
  8414 00004032 E99A01                   jmp .retn
  8415                                  
  8416                                  ;-792     if (eqstr(symbol,"int"     )) return T_INT;
  8417                                  
  8418                                  .getlex484:
  8419 00004035 68[FC41]                 push getlex_4
  8420 00004038 8D062B81                 lea  ax, [symbol]
  8421 0000403C 50                       push ax
  8422 0000403D E856C1                   call eqstr
  8423 00004040 83C404                   add  sp, 4
  8424 00004043 08C0                     or  al, al
  8425 00004045 0F840600                 je .getlex485
  8426 00004049 B80502                   mov ax, 517
  8427 0000404C E98001                   jmp .retn
  8428                                  
  8429                                  ;-793     if (eqstr(symbol,"long"    )) return T_LONG;
  8430                                  
  8431                                  .getlex485:
  8432 0000404F 68[0042]                 push getlex_5
  8433 00004052 8D062B81                 lea  ax, [symbol]
  8434 00004056 50                       push ax
  8435 00004057 E83CC1                   call eqstr
  8436 0000405A 83C404                   add  sp, 4
  8437 0000405D 08C0                     or  al, al
  8438 0000405F 0F840600                 je .getlex486
  8439 00004063 B81502                   mov ax, 533
  8440 00004066 E96601                   jmp .retn
  8441                                  
  8442                                  ;-794     if (eqstr(symbol,"char"    )) return T_CHAR;
  8443                                  
  8444                                  .getlex486:
  8445 00004069 68[0542]                 push getlex_6
  8446 0000406C 8D062B81                 lea  ax, [symbol]
  8447 00004070 50                       push ax
  8448 00004071 E822C1                   call eqstr
  8449 00004074 83C404                   add  sp, 4
  8450 00004077 08C0                     or  al, al
  8451 00004079 0F840600                 je .getlex487
  8452 0000407D B81202                   mov ax, 530
  8453 00004080 E94C01                   jmp .retn
  8454                                  
  8455                                  ;-795     if (eqstr(symbol,"asm"     )) return T_ASM;
  8456                                  
  8457                                  .getlex487:
  8458 00004083 68[0A42]                 push getlex_7
  8459 00004086 8D062B81                 lea  ax, [symbol]
  8460 0000408A 50                       push ax
  8461 0000408B E808C1                   call eqstr
  8462 0000408E 83C404                   add  sp, 4
  8463 00004091 08C0                     or  al, al
  8464 00004093 0F840600                 je .getlex488
  8465 00004097 B80602                   mov ax, 518
  8466 0000409A E93201                   jmp .retn
  8467                                  
  8468                                  ;-796     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;
  8469                                  
  8470                                  .getlex488:
  8471 0000409D 68[0E42]                 push getlex_8
  8472 000040A0 8D062B81                 lea  ax, [symbol]
  8473 000040A4 50                       push ax
  8474 000040A5 E8EEC0                   call eqstr
  8475 000040A8 83C404                   add  sp, 4
  8476 000040AB 08C0                     or  al, al
  8477 000040AD 0F840600                 je .getlex489
  8478 000040B1 B80702                   mov ax, 519
  8479 000040B4 E91801                   jmp .retn
  8480                                  
  8481                                  ;-797     if (eqstr(symbol,"__emit__")) return T_EMIT;
  8482                                  
  8483                                  .getlex489:
  8484 000040B7 68[1442]                 push getlex_9
  8485 000040BA 8D062B81                 lea  ax, [symbol]
  8486 000040BE 50                       push ax
  8487 000040BF E8D4C0                   call eqstr
  8488 000040C2 83C404                   add  sp, 4
  8489 000040C5 08C0                     or  al, al
  8490 000040C7 0F840600                 je .getlex490
  8491 000040CB B80802                   mov ax, 520
  8492 000040CE E9FE00                   jmp .retn
  8493                                  
  8494                                  ;-798     if (eqstr(symbol,"return"  )) return T_RETURN;
  8495                                  
  8496                                  .getlex490:
  8497 000040D1 68[1D42]                 push getlex_10
  8498 000040D4 8D062B81                 lea  ax, [symbol]
  8499 000040D8 50                       push ax
  8500 000040D9 E8BAC0                   call eqstr
  8501 000040DC 83C404                   add  sp, 4
  8502 000040DF 08C0                     or  al, al
  8503 000040E1 0F840600                 je .getlex491
  8504 000040E5 B80002                   mov ax, 512
  8505 000040E8 E9E400                   jmp .retn
  8506                                  
  8507                                  ;-799     if (eqstr(symbol,"if"      )) return T_IF;
  8508                                  
  8509                                  .getlex491:
  8510 000040EB 68[2442]                 push getlex_11
  8511 000040EE 8D062B81                 lea  ax, [symbol]
  8512 000040F2 50                       push ax
  8513 000040F3 E8A0C0                   call eqstr
  8514 000040F6 83C404                   add  sp, 4
  8515 000040F9 08C0                     or  al, al
  8516 000040FB 0F840600                 je .getlex492
  8517 000040FF B80102                   mov ax, 513
  8518 00004102 E9CA00                   jmp .retn
  8519                                  
  8520                                  ;-800     if (eqstr(symbol,"else"    )) return T_ELSE;
  8521                                  
  8522                                  .getlex492:
  8523 00004105 68[2742]                 push getlex_12
  8524 00004108 8D062B81                 lea  ax, [symbol]
  8525 0000410C 50                       push ax
  8526 0000410D E886C0                   call eqstr
  8527 00004110 83C404                   add  sp, 4
  8528 00004113 08C0                     or  al, al
  8529 00004115 0F840600                 je .getlex493
  8530 00004119 B80202                   mov ax, 514
  8531 0000411C E9B000                   jmp .retn
  8532                                  
  8533                                  ;-801     if (eqstr(symbol,"while"   )) return T_WHILE;
  8534                                  
  8535                                  .getlex493:
  8536 0000411F 68[2C42]                 push getlex_13
  8537 00004122 8D062B81                 lea  ax, [symbol]
  8538 00004126 50                       push ax
  8539 00004127 E86CC0                   call eqstr
  8540 0000412A 83C404                   add  sp, 4
  8541 0000412D 08C0                     or  al, al
  8542 0000412F 0F840600                 je .getlex494
  8543 00004133 B80302                   mov ax, 515
  8544 00004136 E99600                   jmp .retn
  8545                                  
  8546                                  ;-802     if (eqstr(symbol,"do"      )) return T_DO;
  8547                                  
  8548                                  .getlex494:
  8549 00004139 68[3242]                 push getlex_14
  8550 0000413C 8D062B81                 lea  ax, [symbol]
  8551 00004140 50                       push ax
  8552 00004141 E852C0                   call eqstr
  8553 00004144 83C404                   add  sp, 4
  8554 00004147 08C0                     or  al, al
  8555 00004149 0F840600                 je .getlex495
  8556 0000414D B80402                   mov ax, 516
  8557 00004150 E97C00                   jmp .retn
  8558                                  
  8559                                  ;-803     if (eqstr(symbol,"goto"    )) return T_GOTO;
  8560                                  
  8561                                  .getlex495:
  8562 00004153 68[3542]                 push getlex_15
  8563 00004156 8D062B81                 lea  ax, [symbol]
  8564 0000415A 50                       push ax
  8565 0000415B E838C0                   call eqstr
  8566 0000415E 83C404                   add  sp, 4
  8567 00004161 08C0                     or  al, al
  8568 00004163 0F840600                 je .getlex496
  8569 00004167 B80902                   mov ax, 521
  8570 0000416A E96200                   jmp .retn
  8571                                  
  8572                                  ;-804     if (eqstr(symbol,"define"  )) return T_DEFINE;   
  8573                                  
  8574                                  .getlex496:
  8575 0000416D 68[3A42]                 push getlex_16
  8576 00004170 8D062B81                 lea  ax, [symbol]
  8577 00004174 50                       push ax
  8578 00004175 E81EC0                   call eqstr
  8579 00004178 83C404                   add  sp, 4
  8580 0000417B 08C0                     or  al, al
  8581 0000417D 0F840600                 je .getlex497
  8582 00004181 B8FF01                   mov ax, 511
  8583 00004184 E94800                   jmp .retn
  8584                                  
  8585                                  ;-805     if (eqstr(symbol,"include" )) return T_INCLUDE;   
  8586                                  
  8587                                  .getlex497:
  8588 00004187 68[4142]                 push getlex_17
  8589 0000418A 8D062B81                 lea  ax, [symbol]
  8590 0000418E 50                       push ax
  8591 0000418F E804C0                   call eqstr
  8592 00004192 83C404                   add  sp, 4
  8593 00004195 08C0                     or  al, al
  8594 00004197 0F840600                 je .getlex498
  8595 0000419B B8FE01                   mov ax, 510
  8596 0000419E E92E00                   jmp .retn
  8597                                  
  8598                                  ;-806     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}
  8599                                  
  8600                                  .getlex498:
  8601 000041A1 E8BF00                   call convertdefine
  8602 000041A4 08C0                     or  al, al
  8603 000041A6 0F841600                 je .getlex499
  8604 000041AA 8D06DCD0                 lea  ax, [symboltemp]
  8605 000041AE 50                       push ax
  8606 000041AF 8D062B81                 lea  ax, [symbol]
  8607 000041B3 50                       push ax
  8608 000041B4 E8AFBF                   call strcpy
  8609 000041B7 83C404                   add  sp, 4
  8610 000041BA B80101                   mov ax, 257
  8611 000041BD E90F00                   jmp .retn
  8612                                  
  8613                                  ;-807     return T_NAME; } error1("Input item not recognized"); }
  8614                                  
  8615                                  .getlex499:
  8616 000041C0 B80001                   mov ax, 256
  8617 000041C3 E90900                   jmp .retn
  8618                                  .getlex479:
  8619 000041C6 68[4942]                 push getlex_18
  8620 000041C9 E84306                   call error1
  8621 000041CC 83C402                   add  sp, 2
  8622                                  
  8623                                  ;-808 
  8624                                  
  8625                                  
  8626                                  ;-809 int convertdefine() { int i; int j;   i=0;
  8627                                  
  8628 000041CF C9                       .retn: LEAVE
  8629 000041D0 C3                       ret
  8630                                  ; ENDP
  8631 000041D1 28295B5D7B7D2C3B2A-     getlex_0 db "()[]{},;*:%-><=+!&|#?",0
  8632 000041DA 3A252D3E3C3D2B2126-
  8633 000041E3 7C233F00           
  8634 000041E7 7369676E656400          getlex_1 db "signed",0
  8635 000041EE 756E7369676E656400      getlex_2 db "unsigned",0
  8636 000041F7 766F696400              getlex_3 db "void",0
  8637 000041FC 696E7400                getlex_4 db "int",0
  8638 00004200 6C6F6E6700              getlex_5 db "long",0
  8639 00004205 6368617200              getlex_6 db "char",0
  8640 0000420A 61736D00                getlex_7 db "asm",0
  8641 0000420E 5F5F61736D00            getlex_8 db "__asm",0
  8642 00004214 5F5F656D69745F5F00      getlex_9 db "__emit__",0
  8643 0000421D 72657475726E00          getlex_10 db "return",0
  8644 00004224 696600                  getlex_11 db "if",0
  8645 00004227 656C736500              getlex_12 db "else",0
  8646 0000422C 7768696C6500            getlex_13 db "while",0
  8647 00004232 646F00                  getlex_14 db "do",0
  8648 00004235 676F746F00              getlex_15 db "goto",0
  8649 0000423A 646566696E6500          getlex_16 db "define",0
  8650 00004241 696E636C75646500        getlex_17 db "include",0
  8651 00004249 496E70757420697465-     getlex_18 db "Input item not recognized",0
  8652 00004252 6D206E6F7420726563-
  8653 0000425B 6F676E697A656400   
  8654                                  
  8655                                  convertdefine:  ; *** PROC ***
  8656                                  ;Function : convertdefine, Number of local variables: 2
  8657                                  ;   # type sign width addr used name   list of local variables
  8658                                  ;  200 var sign word   809 NULL i = bp-2
  8659                                  ;  201 var sign word   809 NULL j = bp-4;
  8660 00004263 C8040000                 ENTER  4,0
  8661 00004267 B80000                   mov ax, 0
  8662 0000426A 8946FE                   mov [bp-2], ax
  8663                                  
  8664                                  ;-810   while (i < GTop) {
  8665                                  
  8666                                  .convertdefine500:
  8667 0000426D 8B46FE                   mov ax, [bp-2]
  8668 00004270 3B06[2A00]               cmp ax, [GTop]
  8669 00004274 0F8D4400                 jge .convertdefine501
  8670                                  
  8671                                  ;-811    j=adrofname(i); 
  8672                                  
  8673 00004278 FF76FE                   push word [bp-2]
  8674 0000427B E8B9C6                   call adrofname
  8675 0000427E 83C402                   add  sp, 2
  8676 00004281 8946FC                   mov [bp-4], ax
  8677                                  
  8678                                  ;-812    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];
  8679                                  
  8680 00004284 FF76FC                   push word [bp-4]
  8681 00004287 8D062B81                 lea  ax, [symbol]
  8682 0000428B 50                       push ax
  8683 0000428C E807BF                   call eqstr
  8684 0000428F 83C404                   add  sp, 4
  8685 00004292 08C0                     or  al, al
  8686 00004294 0F841F00                 je .convertdefine502
  8687 00004298 8B5EFE                   mov bx, [bp-2]
  8688 0000429B 8A87B782                 mov al, [GType + bx]
  8689 0000429F 3C23                     cmp al, 35
  8690 000042A1 0F851200                 jne .convertdefine503
  8691 000042A5 8B5EFE                   mov bx, [bp-2]
  8692 000042A8 D1E3                     shl bx, 1
  8693 000042AA 8B87EB8A                 mov ax, [GData + bx]
  8694 000042AE A3[2E00]                 mov word [lexval], ax
  8695                                  
  8696                                  ;-813    return T_CONST; } }
  8697                                  
  8698 000042B1 B80101                   mov ax, 257
  8699 000042B4 E90B00                   jmp .retn
  8700                                  .convertdefine503:
  8701                                  
  8702                                  ;-814    i++; } 
  8703                                  
  8704                                  .convertdefine502:
  8705 000042B7 FF46FE                   inc  word[bp-2]
  8706                                  
  8707                                  ;-815    return 0; }
  8708                                  
  8709 000042BA EBB1                     jmp .convertdefine500
  8710                                  .convertdefine501:
  8711 000042BC B80000                   mov ax, 0
  8712 000042BF E90000                   jmp .retn
  8713                                  
  8714                                  ;-816 int getdigit(char c) { int i;
  8715                                  
  8716 000042C2 C9                       .retn: LEAVE
  8717 000042C3 C3                       ret
  8718                                  ; ENDP
  8719                                  
  8720                                  getdigit:  ; *** PROC ***
  8721                                  
  8722                                  ;-817     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char
  8723                                  
  8724                                  ;Function : getdigit, Number of local variables: 2
  8725                                  ;   # type sign width addr used name   list of local variables
  8726                                  ;  200 var sign byte   816 NULL c = bp+4
  8727                                  ;  201 var sign word   816 NULL i = bp-2;
  8728 000042C4 C8020000                 ENTER  2,0
  8729 000042C8 B80000                   mov ax, 0
  8730 000042CB A3[2E00]                 mov word [lexval], ax
  8731 000042CE 8A4604                   mov al, [bp+4]
  8732 000042D1 2C30                     sub al, 48
  8733 000042D3 A3[2E00]                 mov word [lexval], ax
  8734                                  
  8735                                  ;-818     if (thechar=='x') thechar='X'; if (thechar=='X') { next();
  8736                                  
  8737 000042D6 A0[2100]                 mov al, [thechar]
  8738 000042D9 3C78                     cmp al, 120
  8739 000042DB 0F850600                 jne .getdigit504
  8740 000042DF B85800                   mov ax, 88
  8741 000042E2 A2[2100]                 mov byte [thechar], al
  8742                                  .getdigit504:
  8743 000042E5 A0[2100]                 mov al, [thechar]
  8744 000042E8 3C58                     cmp al, 88
  8745 000042EA 0F856800                 jne .getdigit505
  8746 000042EE E8E000                   call next
  8747                                  
  8748                                  ;-819       while(alnum(thechar)) { c=next(); if(c>96) c=c-39;
  8749                                  
  8750                                  .getdigit506:
  8751 000042F1 A0[2100]                 mov al, byte [thechar]
  8752 000042F4 B400                     mov ah, 0
  8753 000042F6 50                       push ax
  8754 000042F7 E88DC0                   call alnum
  8755 000042FA 83C402                   add  sp, 2
  8756 000042FD 08C0                     or  al, al
  8757 000042FF 0F845000                 je .getdigit507
  8758 00004303 E8CB00                   call next
  8759 00004306 884604                   mov [bp+4], al
  8760 00004309 8A4604                   mov al, [bp+4]
  8761 0000430C 3C60                     cmp al, 96
  8762 0000430E 0F8E0800                 jle .getdigit508
  8763 00004312 8A4604                   mov al, [bp+4]
  8764 00004315 2C27                     sub al, 39
  8765 00004317 884604                   mov [bp+4], al
  8766                                  
  8767                                  ;-820 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16
  8768                                  
  8769                                  .getdigit508:
  8770 0000431A 8A4604                   mov al, [bp+4]
  8771 0000431D 3C40                     cmp al, 64
  8772 0000431F 0F8E0800                 jle .getdigit509
  8773 00004323 8A4604                   mov al, [bp+4]
  8774 00004326 2C07                     sub al, 7
  8775 00004328 884604                   mov [bp+4], al
  8776                                  .getdigit509:
  8777 0000432B 8A4604                   mov al, [bp+4]
  8778 0000432E 2C30                     sub al, 48
  8779 00004330 884604                   mov [bp+4], al
  8780 00004333 A1[2E00]                 mov ax, [lexval]
  8781 00004336 C1E004                   shl ax, 4
  8782 00004339 A3[2E00]                 mov word [lexval], ax
  8783                                  
  8784                                  ;-821      i=0; i=c; lexval=lexval+i;}
  8785                                  
  8786 0000433C B80000                   mov ax, 0
  8787 0000433F 8946FE                   mov [bp-2], ax
  8788 00004342 8A4604                   mov al, [bp+4]
  8789 00004345 8946FE                   mov [bp-2], ax
  8790 00004348 A1[2E00]                 mov ax, [lexval]
  8791 0000434B 0346FE                   add ax, [bp-2]
  8792 0000434E A3[2E00]                 mov word [lexval], ax
  8793                                  
  8794                                  ;-822     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10; 
  8795                                  
  8796 00004351 EB9E                     jmp .getdigit506
  8797                                  .getdigit507:
  8798 00004353 E94200                   jmp .getdigit510
  8799                                  .getdigit505:
  8800                                  .getdigit511:
  8801 00004356 A0[2100]                 mov al, byte [thechar]
  8802 00004359 B400                     mov ah, 0
  8803 0000435B 50                       push ax
  8804 0000435C E880BF                   call digit
  8805 0000435F 83C402                   add  sp, 2
  8806 00004362 08C0                     or  al, al
  8807 00004364 0F843000                 je .getdigit512
  8808 00004368 E86600                   call next
  8809 0000436B 884604                   mov [bp+4], al
  8810 0000436E 8A4604                   mov al, [bp+4]
  8811 00004371 2C30                     sub al, 48
  8812 00004373 884604                   mov [bp+4], al
  8813 00004376 A1[2E00]                 mov ax, [lexval]
  8814 00004379 BB0A00                   mov bx, 10
  8815 0000437C F7E3                     mul bx
  8816 0000437E A3[2E00]                 mov word [lexval], ax
  8817                                  
  8818                                  ;-823      i=0; i=c; lexval=lexval+i; } } 
  8819                                  
  8820 00004381 B80000                   mov ax, 0
  8821 00004384 8946FE                   mov [bp-2], ax
  8822 00004387 8A4604                   mov al, [bp+4]
  8823 0000438A 8946FE                   mov [bp-2], ax
  8824 0000438D A1[2E00]                 mov ax, [lexval]
  8825 00004390 0346FE                   add ax, [bp-2]
  8826 00004393 A3[2E00]                 mov word [lexval], ax
  8827 00004396 EBBE                     jmp .getdigit511
  8828                                  .getdigit512:
  8829                                  
  8830                                  ;-824 }
  8831                                  
  8832                                  .getdigit510:
  8833                                  
  8834                                  ;-825 int getstring(int delim) {int c; char *p;  p=&symbol; c=next();
  8835 00004398 C9                       LEAVE
  8836 00004399 C3                       ret
  8837                                  ; ENDP
  8838                                  
  8839                                  getstring:  ; *** PROC ***
  8840                                  ;Function : getstring, Number of local variables: 3
  8841                                  ;   # type sign width addr used name   list of local variables
  8842                                  ;  200 var sign word   825 NULL delim = bp+4
  8843                                  ;  201 var sign word   825 NULL c = bp-2
  8844                                  ;  202 ptr sign byte   825 NULL p = bp-4;
  8845 0000439A C8040000                 ENTER  4,0
  8846 0000439E B82B81                   mov ax, symbol
  8847 000043A1 8946FC                   mov [bp-4], ax
  8848 000043A4 E82A00                   call next
  8849 000043A7 8946FE                   mov [bp-2], ax
  8850                                  
  8851                                  ;-826   while (c != delim) {*p=c; p++; c=next(); } *p=0; }
  8852                                  
  8853                                  .getstring513:
  8854 000043AA 8B46FE                   mov ax, [bp-2]
  8855 000043AD 3B4604                   cmp ax, [bp+4]
  8856 000043B0 0F841300                 je  .getstring514
  8857 000043B4 8B46FE                   mov ax, [bp-2]
  8858 000043B7 8B5EFC                   mov  bx, [bp-4]
  8859 000043BA 8807                     mov  [bx], al
  8860 000043BC FF46FC                   inc  word[bp-4]
  8861 000043BF E80F00                   call next
  8862 000043C2 8946FE                   mov [bp-2], ax
  8863 000043C5 EBE3                     jmp .getstring513
  8864                                  .getstring514:
  8865 000043C7 B80000                   mov ax, 0
  8866 000043CA 8B5EFC                   mov  bx, [bp-4]
  8867 000043CD 8807                     mov  [bx], al
  8868                                  
  8869                                  ;-827 
  8870                                  
  8871                                  
  8872                                  ;-828 int next() {char r; r = thechar; globC=r; thechar = fgets1(); return r; }
  8873 000043CF C9                       LEAVE
  8874 000043D0 C3                       ret
  8875                                  ; ENDP
  8876                                  
  8877                                  next:  ; *** PROC ***
  8878                                  ;Function : next, Number of local variables: 1
  8879                                  ;   # type sign width addr used name   list of local variables
  8880                                  ;  200 var sign byte   828 NULL r = bp-2;
  8881 000043D1 C8020000                 ENTER  2,0
  8882 000043D5 A0[2100]                 mov al, [thechar]
  8883 000043D8 8846FE                   mov [bp-2], al
  8884 000043DB 8A46FE                   mov al, [bp-2]
  8885 000043DE A2[1E00]                 mov byte [globC], al
  8886 000043E1 E83303                   call fgets1
  8887 000043E4 A2[2100]                 mov byte [thechar], al
  8888 000043E7 8A46FE                   mov al, [bp-2]
  8889 000043EA E90000                   jmp .retn
  8890                                  
  8891                                  ;-829 int istoken(int t) {if (token == t) { token=getlex(); return 1; } return 0;}
  8892                                  
  8893 000043ED C9                       .retn: LEAVE
  8894 000043EE C3                       ret
  8895                                  ; ENDP
  8896                                  
  8897                                  istoken:  ; *** PROC ***
  8898                                  ;Function : istoken, Number of local variables: 1
  8899                                  ;   # type sign width addr used name   list of local variables
  8900                                  ;  200 var sign word   829 NULL t = bp+4;
  8901 000043EF C8000000                 ENTER  0,0
  8902 000043F3 A1[1C00]                 mov ax, [token]
  8903 000043F6 3B4604                   cmp ax, [bp+4]
  8904 000043F9 0F850C00                 jne .istoken515
  8905 000043FD E8CBF8                   call getlex
  8906 00004400 A3[1C00]                 mov word [token], ax
  8907 00004403 B80100                   mov ax, 1
  8908 00004406 E90600                   jmp .retn
  8909                                  .istoken515:
  8910 00004409 B80000                   mov ax, 0
  8911 0000440C E90000                   jmp .retn
  8912                                  
  8913                                  ;-830 int expect(int t) {if (istoken(t)==0) { *cloc=0; prs(co); listproc();
  8914                                  
  8915 0000440F C9                       .retn: LEAVE
  8916 00004410 C3                       ret
  8917                                  ; ENDP
  8918                                  
  8919                                  expect:  ; *** PROC ***
  8920                                  ;Function : expect, Number of local variables: 1
  8921                                  ;   # type sign width addr used name   list of local variables
  8922                                  ;  200 var sign word   830 NULL t = bp+4;
  8923 00004411 C8000000                 ENTER  0,0
  8924 00004415 FF7604                   push word [bp+4]
  8925 00004418 E8D4FF                   call istoken
  8926 0000441B 83C402                   add  sp, 2
  8927 0000441E 83F800                   cmp ax, 0
  8928 00004421 0F853200                 jne .expect516
  8929 00004425 B80000                   mov ax, 0
  8930 00004428 8B1E[1600]               mov  bx, [cloc]
  8931 0000442C 8807                     mov  [bx], al
  8932 0000442E 8D063075                 lea  ax, [co]
  8933 00004432 50                       push ax
  8934 00004433 E8EE00                   call prs
  8935 00004436 83C402                   add  sp, 2
  8936 00004439 E8D504                   call listproc
  8937                                  
  8938                                  ;-831   prs("\nExpected ASCII(dez): "); pint1(t); error1(" not found"); } }
  8939                                  
  8940 0000443C 68[5944]                 push expect_0
  8941 0000443F E8E200                   call prs
  8942 00004442 83C402                   add  sp, 2
  8943 00004445 FF7604                   push word [bp+4]
  8944 00004448 E8D001                   call pint1
  8945 0000444B 83C402                   add  sp, 2
  8946 0000444E 68[7144]                 push expect_1
  8947 00004451 E8BB03                   call error1
  8948 00004454 83C402                   add  sp, 2
  8949                                  .expect516:
  8950                                  
  8951                                  ;-832 
  8952                                  
  8953                                  
  8954                                  ;-833 int eprc(char c)  {*cloc=c; cloc++; }
  8955 00004457 C9                       LEAVE
  8956 00004458 C3                       ret
  8957                                  ; ENDP
  8958 00004459 5C6E45787065637465-     expect_0 db "\nExpected ASCII(dez): ",0
  8959 00004462 642041534349492864-
  8960 0000446B 657A293A2000       
  8961 00004471 206E6F7420666F756E-     expect_1 db " not found",0
  8962 0000447A 6400               
  8963                                  
  8964                                  eprc:  ; *** PROC ***
  8965                                  ;Function : eprc, Number of local variables: 1
  8966                                  ;   # type sign width addr used name   list of local variables
  8967                                  ;  200 var sign byte   833 NULL c = bp+4;
  8968 0000447C C8000000                 ENTER  0,0
  8969 00004480 8A4604                   mov al, [bp+4]
  8970 00004483 8B1E[1600]               mov  bx, [cloc]
  8971 00004487 8807                     mov  [bx], al
  8972 00004489 FF06[1600]               inc  word[cloc]
  8973                                  
  8974                                  ;-834 int eprs(char *s) {char c;  while(*s) { c=*s; eprc(c); s++; } }
  8975 0000448D C9                       LEAVE
  8976 0000448E C3                       ret
  8977                                  ; ENDP
  8978                                  
  8979                                  eprs:  ; *** PROC ***
  8980                                  ;Function : eprs, Number of local variables: 2
  8981                                  ;   # type sign width addr used name   list of local variables
  8982                                  ;  200 ptr sign byte   834 NULL s = bp+4
  8983                                  ;  201 var sign byte   834 NULL c = bp-2;
  8984 0000448F C8020000                 ENTER  2,0
  8985                                  .eprs517:
  8986 00004493 8B5E04                   mov bx, [bp+4]
  8987 00004496 8A07                     mov al, [bx]
  8988 00004498 B400                     mov ah, 0
  8989 0000449A 08C0                     or  al, al
  8990 0000449C 0F841B00                 je .eprs518
  8991 000044A0 8B5E04                   mov bx, [bp+4]
  8992 000044A3 8A07                     mov al, [bx]
  8993 000044A5 B400                     mov ah, 0
  8994 000044A7 8846FE                   mov [bp-2], al
  8995 000044AA 8A46FE                   mov al, byte [bp-2]
  8996 000044AD B400                     mov ah, 0
  8997 000044AF 50                       push ax
  8998 000044B0 E8C9FF                   call eprc
  8999 000044B3 83C402                   add  sp, 2
  9000 000044B6 FF4604                   inc  word[bp+4]
  9001 000044B9 EBD8                     jmp .eprs517
  9002                                  .eprs518:
  9003                                  
  9004                                  ;-835 int prc(unsigned char c) { 
  9005 000044BB C9                       LEAVE
  9006 000044BC C3                       ret
  9007                                  ; ENDP
  9008                                  
  9009                                  prc:  ; *** PROC ***
  9010                                  
  9011                                  ;-836   if (c==10) {_AX=13; writetty(); }
  9012                                  
  9013                                  ;Function : prc, Number of local variables: 1
  9014                                  ;   # type sign width addr used name   list of local variables
  9015                                  ;  200 var unsg byte   835 NULL c = bp+4;
  9016 000044BD C8000000                 ENTER  0,0
  9017 000044C1 8A4604                   mov al, [bp+4]
  9018 000044C4 3C0A                     cmp al, 10
  9019 000044C6 0F850600                 jne .prc519
  9020 000044CA B80D00                   mov  ax, 13
  9021 000044CD E8A3BB                   call writetty
  9022                                  
  9023                                  ;-837   _AL=c; writetty(); 
  9024                                  
  9025                                  .prc519:
  9026 000044D0 8A4604                   mov  al, [bp+4]
  9027 000044D3 E89DBB                   call writetty
  9028                                  
  9029                                  ;-838   fputcR(c, fdout); 
  9030                                  
  9031 000044D6 FF36[1A00]               push word [fdout]
  9032 000044DA 8A4604                   mov al, byte [bp+4]
  9033 000044DD B400                     mov ah, 0
  9034 000044DF 50                       push ax
  9035 000044E0 E846BC                   call fputcR
  9036 000044E3 83C404                   add  sp, 4
  9037                                  
  9038                                  ;-839   }
  9039                                  
  9040                                  
  9041                                  ;-840 int prscomment(unsigned char *s) {unsigned char c;
  9042 000044E6 C9                       LEAVE
  9043 000044E7 C3                       ret
  9044                                  ; ENDP
  9045                                  
  9046                                  prscomment:  ; *** PROC ***
  9047                                  
  9048                                  ;-841   while(*s){c=*s;prc(c);s++;} }
  9049                                  
  9050                                  ;Function : prscomment, Number of local variables: 2
  9051                                  ;   # type sign width addr used name   list of local variables
  9052                                  ;  200 ptr unsg byte   840 NULL s = bp+4
  9053                                  ;  201 var unsg byte   840 NULL c = bp-2;
  9054 000044E8 C8020000                 ENTER  2,0
  9055                                  .prscomment520:
  9056 000044EC 8B5E04                   mov bx, [bp+4]
  9057 000044EF 8A07                     mov al, [bx]
  9058 000044F1 B400                     mov ah, 0
  9059 000044F3 08C0                     or  al, al
  9060 000044F5 0F841B00                 je .prscomment521
  9061 000044F9 8B5E04                   mov bx, [bp+4]
  9062 000044FC 8A07                     mov al, [bx]
  9063 000044FE B400                     mov ah, 0
  9064 00004500 8846FE                   mov [bp-2], al
  9065 00004503 8A46FE                   mov al, byte [bp-2]
  9066 00004506 B400                     mov ah, 0
  9067 00004508 50                       push ax
  9068 00004509 E8B1FF                   call prc
  9069 0000450C 83C402                   add  sp, 2
  9070 0000450F FF4604                   inc  word[bp+4]
  9071 00004512 EBD8                     jmp .prscomment520
  9072                                  .prscomment521:
  9073                                  
  9074                                  ;-842 int prnl() { prs("\n ");}
  9075 00004514 C9                       LEAVE
  9076 00004515 C3                       ret
  9077                                  ; ENDP
  9078                                  
  9079                                  prnl:  ; *** PROC ***
  9080 00004516 68[2045]                 push prnl_0
  9081 00004519 E80800                   call prs
  9082 0000451C 83C402                   add  sp, 2
  9083                                  
  9084                                  ;-843 
  9085                                  
  9086                                  
  9087                                  ;-844 int prs(unsigned char *s) {unsigned char c; int com; com=0;
  9088                                  
  9089 0000451F C3                       ret
  9090                                  ; ENDP
  9091 00004520 5C6E2000                prnl_0 db "\n ",0
  9092                                  
  9093                                  prs:  ; *** PROC ***
  9094                                  ;Function : prs, Number of local variables: 3
  9095                                  ;   # type sign width addr used name   list of local variables
  9096                                  ;  200 ptr unsg byte   844 NULL s = bp+4
  9097                                  ;  201 var unsg byte   844 NULL c = bp-2
  9098                                  ;  202 var sign word   844 NULL com = bp-4;
  9099 00004524 C8040000                 ENTER  4,0
  9100 00004528 B80000                   mov ax, 0
  9101 0000452B 8946FC                   mov [bp-4], ax
  9102                                  
  9103                                  ;-845   while(*s) { c=*s; if (c==34) if (com) com=0; else com=1;
  9104                                  
  9105                                  .prs522:
  9106 0000452E 8B5E04                   mov bx, [bp+4]
  9107 00004531 8A07                     mov al, [bx]
  9108 00004533 B400                     mov ah, 0
  9109 00004535 08C0                     or  al, al
  9110 00004537 0F847B00                 je .prs523
  9111 0000453B 8B5E04                   mov bx, [bp+4]
  9112 0000453E 8A07                     mov al, [bx]
  9113 00004540 B400                     mov ah, 0
  9114 00004542 8846FE                   mov [bp-2], al
  9115 00004545 8A46FE                   mov al, [bp-2]
  9116 00004548 3C22                     cmp al, 34
  9117 0000454A 0F851800                 jne .prs524
  9118 0000454E 8B46FC                   mov ax, [bp-4]
  9119 00004551 08C0                     or  al, al
  9120 00004553 0F840900                 je .prs525
  9121 00004557 B80000                   mov ax, 0
  9122 0000455A 8946FC                   mov [bp-4], ax
  9123 0000455D E90600                   jmp .prs526
  9124                                  .prs525:
  9125 00004560 B80100                   mov ax, 1
  9126 00004563 8946FC                   mov [bp-4], ax
  9127                                  
  9128                                  ;-846     if (c==92) { if (com==0) { s++; c=*s;
  9129                                  
  9130                                  .prs526:
  9131                                  .prs524:
  9132 00004566 8A46FE                   mov al, [bp-2]
  9133 00004569 3C5C                     cmp al, 92
  9134 0000456B 0F853500                 jne .prs527
  9135 0000456F 8B46FC                   mov ax, [bp-4]
  9136 00004572 83F800                   cmp ax, 0
  9137 00004575 0F852B00                 jne .prs528
  9138 00004579 FF4604                   inc  word[bp+4]
  9139 0000457C 8B5E04                   mov bx, [bp+4]
  9140 0000457F 8A07                     mov al, [bx]
  9141 00004581 B400                     mov ah, 0
  9142 00004583 8846FE                   mov [bp-2], al
  9143                                  
  9144                                  ;-847           if (c=='n') c=10; if (c=='t') c= 9;
  9145                                  
  9146 00004586 8A46FE                   mov al, [bp-2]
  9147 00004589 3C6E                     cmp al, 110
  9148 0000458B 0F850600                 jne .prs529
  9149 0000458F B80A00                   mov ax, 10
  9150 00004592 8846FE                   mov [bp-2], al
  9151                                  .prs529:
  9152 00004595 8A46FE                   mov al, [bp-2]
  9153 00004598 3C74                     cmp al, 116
  9154 0000459A 0F850600                 jne .prs530
  9155 0000459E B80900                   mov ax, 9
  9156 000045A1 8846FE                   mov [bp-2], al
  9157                                  
  9158                                  ;-848     } } prc(c); s++;  } }
  9159                                  
  9160                                  .prs530:
  9161                                  .prs528:
  9162                                  .prs527:
  9163 000045A4 8A46FE                   mov al, byte [bp-2]
  9164 000045A7 B400                     mov ah, 0
  9165 000045A9 50                       push ax
  9166 000045AA E810FF                   call prc
  9167 000045AD 83C402                   add  sp, 2
  9168 000045B0 FF4604                   inc  word[bp+4]
  9169 000045B3 E978FF                   jmp .prs522
  9170                                  .prs523:
  9171                                  
  9172                                  ;-849 int eprnum(int n){int e; if(n<0) { eprc('-'); n=mkneg(n); }
  9173 000045B6 C9                       LEAVE
  9174 000045B7 C3                       ret
  9175                                  ; ENDP
  9176                                  
  9177                                  eprnum:  ; *** PROC ***
  9178                                  ;Function : eprnum, Number of local variables: 2
  9179                                  ;   # type sign width addr used name   list of local variables
  9180                                  ;  200 var sign word   849 NULL n = bp+4
  9181                                  ;  201 var sign word   849 NULL e = bp-2;
  9182 000045B8 C8020000                 ENTER  2,0
  9183 000045BC 8B4604                   mov ax, [bp+4]
  9184 000045BF 83F800                   cmp ax, 0
  9185 000045C2 0F8D1400                 jge .eprnum531
  9186 000045C6 6A2D                     push 45
  9187 000045C8 E8B1FE                   call eprc
  9188 000045CB 83C402                   add  sp, 2
  9189 000045CE FF7604                   push word [bp+4]
  9190 000045D1 E8EEBA                   call mkneg
  9191 000045D4 83C402                   add  sp, 2
  9192 000045D7 894604                   mov [bp+4], ax
  9193                                  
  9194                                  ;-850   if (n >= 10) {e=n/10; eprnum(e);}  n=n%10; n=n+'0'; eprc(n); }
  9195                                  
  9196                                  .eprnum531:
  9197 000045DA 8B4604                   mov ax, [bp+4]
  9198 000045DD 83F80A                   cmp ax, 10 ;unsigned : 1
  9199 000045E0 0F8C1500                 jl  .eprnum532
  9200 000045E4 8B4604                   mov ax, [bp+4]
  9201 000045E7 BB0A00                   mov bx, 10
  9202 000045EA 99                       cwd
  9203 000045EB F7FB                     idiv bx
  9204 000045ED 8946FE                   mov [bp-2], ax
  9205 000045F0 FF76FE                   push word [bp-2]
  9206 000045F3 E8C2FF                   call eprnum
  9207 000045F6 83C402                   add  sp, 2
  9208                                  .eprnum532:
  9209 000045F9 8B4604                   mov ax, [bp+4]
  9210 000045FC BB0A00                   mov bx, 10
  9211 000045FF 99                       cwd
  9212 00004600 F7FB                     idiv bx
  9213 00004602 89D0                     mov ax, dx
  9214 00004604 894604                   mov [bp+4], ax
  9215 00004607 8B4604                   mov ax, [bp+4]
  9216 0000460A 83C030                   add ax, 48
  9217 0000460D 894604                   mov [bp+4], ax
  9218 00004610 FF7604                   push word [bp+4]
  9219 00004613 E866FE                   call eprc
  9220 00004616 83C402                   add  sp, 2
  9221                                  
  9222                                  ;-851 int pint1 (int n){int e; if(n<0) {  prc('-');  n=mkneg(n); }
  9223 00004619 C9                       LEAVE
  9224 0000461A C3                       ret
  9225                                  ; ENDP
  9226                                  
  9227                                  pint1:  ; *** PROC ***
  9228                                  ;Function : pint1, Number of local variables: 2
  9229                                  ;   # type sign width addr used name   list of local variables
  9230                                  ;  200 var sign word   851 NULL n = bp+4
  9231                                  ;  201 var sign word   851 NULL e = bp-2;
  9232 0000461B C8020000                 ENTER  2,0
  9233 0000461F 8B4604                   mov ax, [bp+4]
  9234 00004622 83F800                   cmp ax, 0
  9235 00004625 0F8D1400                 jge .pint1533
  9236 00004629 6A2D                     push 45
  9237 0000462B E88FFE                   call prc
  9238 0000462E 83C402                   add  sp, 2
  9239 00004631 FF7604                   push word [bp+4]
  9240 00004634 E88BBA                   call mkneg
  9241 00004637 83C402                   add  sp, 2
  9242 0000463A 894604                   mov [bp+4], ax
  9243                                  
  9244                                  ;-852   if (n >= 10) {e=n/10;  pint1(e);}  n=n%10; n=n+'0'; prc(n); }
  9245                                  
  9246                                  .pint1533:
  9247 0000463D 8B4604                   mov ax, [bp+4]
  9248 00004640 83F80A                   cmp ax, 10 ;unsigned : 1
  9249 00004643 0F8C1500                 jl  .pint1534
  9250 00004647 8B4604                   mov ax, [bp+4]
  9251 0000464A BB0A00                   mov bx, 10
  9252 0000464D 99                       cwd
  9253 0000464E F7FB                     idiv bx
  9254 00004650 8946FE                   mov [bp-2], ax
  9255 00004653 FF76FE                   push word [bp-2]
  9256 00004656 E8C2FF                   call pint1
  9257 00004659 83C402                   add  sp, 2
  9258                                  .pint1534:
  9259 0000465C 8B4604                   mov ax, [bp+4]
  9260 0000465F BB0A00                   mov bx, 10
  9261 00004662 99                       cwd
  9262 00004663 F7FB                     idiv bx
  9263 00004665 89D0                     mov ax, dx
  9264 00004667 894604                   mov [bp+4], ax
  9265 0000466A 8B4604                   mov ax, [bp+4]
  9266 0000466D 83C030                   add ax, 48
  9267 00004670 894604                   mov [bp+4], ax
  9268 00004673 FF7604                   push word [bp+4]
  9269 00004676 E844FE                   call prc
  9270 00004679 83C402                   add  sp, 2
  9271                                  
  9272                                  ;-853 int prunsign1(unsigned int n) { unsigned int e;
  9273 0000467C C9                       LEAVE
  9274 0000467D C3                       ret
  9275                                  ; ENDP
  9276                                  
  9277                                  prunsign1:  ; *** PROC ***
  9278                                  
  9279                                  ;-854   if ( _ n >= 10) {  e=n/10; /*DIV*/ prunsign1(e); }
  9280                                  
  9281                                  ;Function : prunsign1, Number of local variables: 2
  9282                                  ;   # type sign width addr used name   list of local variables
  9283                                  ;  200 var unsg word   853 NULL n = bp+4
  9284                                  ;  201 var unsg word   853 NULL e = bp-2;
  9285 0000467E C8020000                 ENTER  2,0 ; constant expression
  9286 00004682 837E040A                cmp word[bp+4], 10 ;unsigned : 0
  9287 00004686 0F821700                 jb  .prunsign1535
  9288 0000468A 8B4604                   mov ax, [bp+4]
  9289 0000468D BB0A00                   mov bx, 10
  9290 00004690 BA0000                   mov dx, 0
  9291 00004693 F7F3                     div bx
  9292 00004695 8946FE                   mov [bp-2], ax
  9293 00004698 FF76FE                   push word [bp-2]
  9294 0000469B E8E0FF                   call prunsign1
  9295 0000469E 83C402                   add  sp, 2
  9296                                  
  9297                                  ;-855     n = n % 10; /*unsigned mod*/   n += '0'; prc(n); }
  9298                                  
  9299                                  .prunsign1535:
  9300 000046A1 8B4604                   mov ax, [bp+4]
  9301 000046A4 BB0A00                   mov bx, 10
  9302 000046A7 BA0000                   mov dx, 0
  9303 000046AA F7F3                     div bx
  9304 000046AC 89D0                     mov ax, dx
  9305 000046AE 894604                   mov [bp+4], ax
  9306 000046B1 83460430                 add  word[bp+4], 48
  9307 000046B5 FF7604                   push word [bp+4]
  9308 000046B8 E802FE                   call prc
  9309 000046BB 83C402                   add  sp, 2
  9310                                  
  9311                                  ;-856 int printint51(unsigned int j)  {
  9312 000046BE C9                       LEAVE
  9313 000046BF C3                       ret
  9314                                  ; ENDP
  9315                                  
  9316                                  printint51:  ; *** PROC ***
  9317                                  
  9318                                  ;-857   if (j<10000) prc(32); if (j<1000) prc(32);  if (j<100) prc(32);
  9319                                  
  9320                                  ;Function : printint51, Number of local variables: 1
  9321                                  ;   # type sign width addr used name   list of local variables
  9322                                  ;  200 var unsg word   856 NULL j = bp+4;
  9323 000046C0 C8000000                 ENTER  0,0
  9324 000046C4 8B4604                   mov ax, [bp+4]
  9325 000046C7 3D1027                   cmp ax, 10000
  9326 000046CA 0F8D0800                 jge .printint51536
  9327 000046CE 6A20                     push 32
  9328 000046D0 E8EAFD                   call prc
  9329 000046D3 83C402                   add  sp, 2
  9330                                  .printint51536:
  9331 000046D6 8B4604                   mov ax, [bp+4]
  9332 000046D9 3DE803                   cmp ax, 1000
  9333 000046DC 0F8D0800                 jge .printint51537
  9334 000046E0 6A20                     push 32
  9335 000046E2 E8D8FD                   call prc
  9336 000046E5 83C402                   add  sp, 2
  9337                                  .printint51537:
  9338 000046E8 8B4604                   mov ax, [bp+4]
  9339 000046EB 83F864                   cmp ax, 100
  9340 000046EE 0F8D0800                 jge .printint51538
  9341 000046F2 6A20                     push 32
  9342 000046F4 E8C6FD                   call prc
  9343 000046F7 83C402                   add  sp, 2
  9344                                  
  9345                                  ;-858    if (j<10) prc(32);  prunsign1(j); }
  9346                                  
  9347                                  .printint51538:
  9348 000046FA 8B4604                   mov ax, [bp+4]
  9349 000046FD 83F80A                   cmp ax, 10
  9350 00004700 0F8D0800                 jge .printint51539
  9351 00004704 6A20                     push 32
  9352 00004706 E8B4FD                   call prc
  9353 00004709 83C402                   add  sp, 2
  9354                                  .printint51539:
  9355 0000470C FF7604                   push word [bp+4]
  9356 0000470F E86CFF                   call prunsign1
  9357 00004712 83C402                   add  sp, 2
  9358                                  
  9359                                  ;-859 
  9360                                  
  9361                                  
  9362                                  ;-860 int fgets1() { char c; c=*fgetsp;
  9363 00004715 C9                       LEAVE
  9364 00004716 C3                       ret
  9365                                  ; ENDP
  9366                                  
  9367                                  fgets1:  ; *** PROC ***
  9368                                  ;Function : fgets1, Number of local variables: 1
  9369                                  ;   # type sign width addr used name   list of local variables
  9370                                  ;  200 var sign byte   860 NULL c = bp-2;
  9371 00004717 C8020000                 ENTER  2,0
  9372 0000471B 8B1E[6200]               mov bx, [fgetsp]
  9373 0000471F 8A07                     mov al, [bx]
  9374 00004721 B400                     mov ah, 0
  9375 00004723 8846FE                   mov [bp-2], al
  9376                                  
  9377                                  ;-861   if (c==0) { printinputline(); if (DOS_NoBytes == 0) return 0;
  9378                                  
  9379 00004726 8A46FE                   mov al, [bp-2]
  9380 00004729 3C00                     cmp al, 0
  9381 0000472B 0F852A00                 jne .fgets1540
  9382 0000472F E83700                   call printinputline
  9383 00004732 A1[7000]                 mov ax, [DOS_NoBytes]
  9384 00004735 83F800                   cmp ax, 0
  9385 00004738 0F850600                 jne .fgets1541
  9386 0000473C B80000                   mov ax, 0
  9387 0000473F E92500                   jmp .retn
  9388                                  
  9389                                  ;-862     fgetsp=&fgetsdest; c=*fgetsp; spalte=0; }
  9390                                  
  9391                                  .fgets1541:
  9392 00004742 B80FD0                   mov ax, fgetsdest
  9393 00004745 A3[6200]                 mov word [fgetsp], ax
  9394 00004748 8B1E[6200]               mov bx, [fgetsp]
  9395 0000474C 8A07                     mov al, [bx]
  9396 0000474E B400                     mov ah, 0
  9397 00004750 8846FE                   mov [bp-2], al
  9398 00004753 B80000                   mov ax, 0
  9399 00004756 A3[1F00]                 mov word [spalte], ax
  9400                                  
  9401                                  ;-863   fgetsp++; spalte++;  return c; }
  9402                                  
  9403                                  .fgets1540:
  9404 00004759 FF06[6200]               inc  word[fgetsp]
  9405 0000475D FF06[1F00]               inc  word[spalte]
  9406 00004761 8A46FE                   mov al, [bp-2]
  9407 00004764 E90000                   jmp .retn
  9408                                  
  9409                                  ;-864 int printinputline() { fgetsp=&fgetsdest;
  9410                                  
  9411 00004767 C9                       .retn: LEAVE
  9412 00004768 C3                       ret
  9413                                  ; ENDP
  9414                                  
  9415                                  printinputline:  ; *** PROC ***
  9416 00004769 B80FD0                   mov ax, fgetsdest
  9417 0000476C A3[6200]                 mov word [fgetsp], ax
  9418                                  
  9419                                  ;-865   do {DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);
  9420                                  
  9421                                  .printinputline542:
  9422 0000476F 6A01                     push 1
  9423 00004771 FF36[1800]               push word [fdin]
  9424 00004775 8D06[7200]               lea  ax, [DOS_ByteRead]
  9425 00004779 50                       push ax
  9426 0000477A E897B9                   call readRL
  9427 0000477D 83C406                   add  sp, 6
  9428 00004780 A3[7000]                 mov word [DOS_NoBytes], ax
  9429                                  
  9430                                  ;-866   if (DOS_NoBytes == 0) return; 
  9431                                  
  9432 00004783 A1[7000]                 mov ax, [DOS_NoBytes]
  9433 00004786 83F800                   cmp ax, 0
  9434 00004789 0F850300                 jne .printinputline543
  9435 0000478D E95400                   jmp .retn
  9436                                  
  9437                                  ;-867     *fgetsp=DOS_ByteRead; fgetsp++;} 
  9438                                  
  9439                                  .printinputline543:
  9440 00004790 A0[7200]                 mov al, [DOS_ByteRead]
  9441 00004793 8B1E[6200]               mov  bx, [fgetsp]
  9442 00004797 8807                     mov  [bx], al
  9443 00004799 FF06[6200]               inc  word[fgetsp]
  9444                                  
  9445                                  ;-868   while (DOS_ByteRead != 10); *fgetsp=0;
  9446                                  
  9447 0000479D A0[7200]                 mov al, [DOS_ByteRead]
  9448 000047A0 3C0A                     cmp al, 10
  9449 000047A2 0F840200                 je  .printinputline544
  9450 000047A6 EBC7                     jmp .printinputline542
  9451                                  .printinputline544:
  9452 000047A8 B80000                   mov ax, 0
  9453 000047AB 8B1E[6200]               mov  bx, [fgetsp]
  9454 000047AF 8807                     mov  [bx], al
  9455                                  
  9456                                  ;-869     if (fdout) { prs("\n\n;-"); prunsign1(lineno); prc(' '); lineno++;
  9457                                  
  9458 000047B1 A1[1A00]                 mov ax, [fdout]
  9459 000047B4 08C0                     or  al, al
  9460 000047B6 0F842A00                 je .printinputline545
  9461 000047BA 68[E547]                 push printinputline_0
  9462 000047BD E864FD                   call prs
  9463 000047C0 83C402                   add  sp, 2
  9464 000047C3 FF36[6600]               push word [lineno]
  9465 000047C7 E8B4FE                   call prunsign1
  9466 000047CA 83C402                   add  sp, 2
  9467 000047CD 6A20                     push 32
  9468 000047CF E8EBFC                   call prc
  9469 000047D2 83C402                   add  sp, 2
  9470 000047D5 FF06[6600]               inc  word[lineno]
  9471                                  
  9472                                  ;-870       prscomment(&fgetsdest);}
  9473                                  
  9474 000047D9 8D060FD0                 lea  ax, [fgetsdest]
  9475 000047DD 50                       push ax
  9476 000047DE E807FD                   call prscomment
  9477 000047E1 83C402                   add  sp, 2
  9478                                  
  9479                                  ;-871 }
  9480                                  
  9481                                  .printinputline545:
  9482                                  
  9483                                  ;-872 int end1(int n) {fcloseR(fdin); fcloseR(fdout); exitR(n); }
  9484                                  
  9485                                   .retn:
  9486 000047E4 C3                       ret
  9487                                  ; ENDP
  9488 000047E5 5C6E5C6E3B2D00          printinputline_0 db "\n\n;-",0
  9489                                  
  9490                                  end1:  ; *** PROC ***
  9491                                  ;Function : end1, Number of local variables: 1
  9492                                  ;   # type sign width addr used name   list of local variables
  9493                                  ;  200 var sign word   872 NULL n = bp+4;
  9494 000047EC C8000000                 ENTER  0,0
  9495 000047F0 FF36[1800]               push word [fdin]
  9496 000047F4 E800B9                   call fcloseR
  9497 000047F7 83C402                   add  sp, 2
  9498 000047FA FF36[1A00]               push word [fdout]
  9499 000047FE E8F6B8                   call fcloseR
  9500 00004801 83C402                   add  sp, 2
  9501 00004804 FF7604                   push word [bp+4]
  9502 00004807 E8FCB8                   call exitR
  9503 0000480A 83C402                   add  sp, 2
  9504                                  
  9505                                  ;-873 int error1(char *s) { 
  9506 0000480D C9                       LEAVE
  9507 0000480E C3                       ret
  9508                                  ; ENDP
  9509                                  
  9510                                  error1:  ; *** PROC ***
  9511                                  
  9512                                  ;-874   lineno--;
  9513                                  
  9514                                  ;Function : error1, Number of local variables: 1
  9515                                  ;   # type sign width addr used name   list of local variables
  9516                                  ;  200 ptr sign byte   873 NULL s = bp+4;
  9517 0000480F C8000000                 ENTER  0,0
  9518 00004813 FF0E[6600]               dec  word[lineno]
  9519                                  
  9520                                  ;-875   prnl(); prscomment(&fgetsdest);
  9521                                  
  9522 00004817 E8FCFC                   call prnl
  9523 0000481A 8D060FD0                 lea  ax, [fgetsdest]
  9524 0000481E 50                       push ax
  9525 0000481F E8C6FC                   call prscomment
  9526 00004822 83C402                   add  sp, 2
  9527                                  
  9528                                  ;-876   prs(";Line: "); prunsign1(lineno);
  9529                                  
  9530 00004825 68[B848]                 push error1_0
  9531 00004828 E8F9FC                   call prs
  9532 0000482B 83C402                   add  sp, 2
  9533 0000482E FF36[6600]               push word [lineno]
  9534 00004832 E849FE                   call prunsign1
  9535 00004835 83C402                   add  sp, 2
  9536                                  
  9537                                  ;-877   prs(" ************** ERROR: "); prs(s);
  9538                                  
  9539 00004838 68[C048]                 push error1_1
  9540 0000483B E8E6FC                   call prs
  9541 0000483E 83C402                   add  sp, 2
  9542 00004841 FF7604                   push word [bp+4]
  9543 00004844 E8DDFC                   call prs
  9544 00004847 83C402                   add  sp, 2
  9545                                  
  9546                                  ;-878   prs("  in column: "); pint1(spalte);
  9547                                  
  9548 0000484A 68[D848]                 push error1_2
  9549 0000484D E8D4FC                   call prs
  9550 00004850 83C402                   add  sp, 2
  9551 00004853 FF36[1F00]               push word [spalte]
  9552 00004857 E8C1FD                   call pint1
  9553 0000485A 83C402                   add  sp, 2
  9554                                  
  9555                                  ;-879   prs("\nToken: "); prunsign1(token); prs(", globC: "); prc(globC);
  9556                                  
  9557 0000485D 68[E648]                 push error1_3
  9558 00004860 E8C1FC                   call prs
  9559 00004863 83C402                   add  sp, 2
  9560 00004866 FF36[1C00]               push word [token]
  9561 0000486A E811FE                   call prunsign1
  9562 0000486D 83C402                   add  sp, 2
  9563 00004870 68[F048]                 push error1_4
  9564 00004873 E8AEFC                   call prs
  9565 00004876 83C402                   add  sp, 2
  9566 00004879 A0[1E00]                 mov al, byte [globC]
  9567 0000487C B400                     mov ah, 0
  9568 0000487E 50                       push ax
  9569 0000487F E83BFC                   call prc
  9570 00004882 83C402                   add  sp, 2
  9571                                  
  9572                                  ;-880   prs(", thechar: "); pint1(thechar); prs(", symbol: "); prs(symbol);
  9573                                  
  9574 00004885 68[FA48]                 push error1_5
  9575 00004888 E899FC                   call prs
  9576 0000488B 83C402                   add  sp, 2
  9577 0000488E A0[2100]                 mov al, byte [thechar]
  9578 00004891 B400                     mov ah, 0
  9579 00004893 50                       push ax
  9580 00004894 E884FD                   call pint1
  9581 00004897 83C402                   add  sp, 2
  9582 0000489A 68[0649]                 push error1_6
  9583 0000489D E884FC                   call prs
  9584 000048A0 83C402                   add  sp, 2
  9585 000048A3 8D062B81                 lea  ax, [symbol]
  9586 000048A7 50                       push ax
  9587 000048A8 E879FC                   call prs
  9588 000048AB 83C402                   add  sp, 2
  9589                                  
  9590                                  ;-881   end1(1); }
  9591                                  
  9592 000048AE 6A01                     push 1
  9593 000048B0 E839FF                   call end1
  9594 000048B3 83C402                   add  sp, 2
  9595                                  
  9596                                  ;-882 int listproc() {int i; 
  9597 000048B6 C9                       LEAVE
  9598 000048B7 C3                       ret
  9599                                  ; ENDP
  9600 000048B8 3B4C696E653A2000        error1_0 db ";Line: ",0
  9601 000048C0 202A2A2A2A2A2A2A2A-     error1_1 db " ************** ERROR: ",0
  9602 000048C9 2A2A2A2A2A2A204552-
  9603 000048D2 524F523A2000       
  9604 000048D8 2020696E20636F6C75-     error1_2 db "  in column: ",0
  9605 000048E1 6D6E3A2000         
  9606 000048E6 5C6E546F6B656E3A20-     error1_3 db "\nToken: ",0
  9607 000048EF 00                 
  9608 000048F0 2C20676C6F62433A20-     error1_4 db ", globC: ",0
  9609 000048F9 00                 
  9610 000048FA 2C2074686563686172-     error1_5 db ", thechar: ",0
  9611 00004903 3A2000             
  9612 00004906 2C2073796D626F6C3A-     error1_6 db ", symbol: ",0
  9613 0000490F 2000               
  9614                                  
  9615                                  listproc:  ; *** PROC ***
  9616                                  
  9617                                  ;-883   if (LTop > LSTART) {
  9618                                  
  9619                                  ;Function : listproc, Number of local variables: 1
  9620                                  ;   # type sign width addr used name   list of local variables
  9621                                  ;  200 var sign word   882 NULL i = bp-2;
  9622 00004911 C8020000                 ENTER  2,0
  9623 00004915 A1[2C00]                 mov ax, [LTop]
  9624 00004918 3DC800                   cmp ax, 200
  9625 0000491B 0F8E5700                 jle .listproc546
  9626                                  
  9627                                  ;-884   prs("\n;Function : "); prs(fname);
  9628                                  
  9629 0000491F 68[7849]                 push listproc_0
  9630 00004922 E8FFFB                   call prs
  9631 00004925 83C402                   add  sp, 2
  9632 00004928 8D06AB81                 lea  ax, [fname]
  9633 0000492C 50                       push ax
  9634 0000492D E8F4FB                   call prs
  9635 00004930 83C402                   add  sp, 2
  9636                                  
  9637                                  ;-885   prs(", Number of local variables: "); i=LTop - LSTART; prunsign1(i);
  9638                                  
  9639 00004933 68[8749]                 push listproc_1
  9640 00004936 E8EBFB                   call prs
  9641 00004939 83C402                   add  sp, 2
  9642 0000493C A1[2C00]                 mov ax, [LTop]
  9643 0000493F 2DC800                   sub ax, 200
  9644 00004942 8946FE                   mov [bp-2], ax
  9645 00004945 FF76FE                   push word [bp-2]
  9646 00004948 E833FD                   call prunsign1
  9647 0000494B 83C402                   add  sp, 2
  9648                                  
  9649                                  ;-886   prs("\n;   # type sign width addr used name   list of local variables");
  9650                                  
  9651 0000494E 68[A549]                 push listproc_2
  9652 00004951 E8D0FB                   call prs
  9653 00004954 83C402                   add  sp, 2
  9654                                  
  9655                                  ;-887     i=LSTART; 
  9656                                  
  9657 00004957 B8C800                   mov ax, 200
  9658 0000495A 8946FE                   mov [bp-2], ax
  9659                                  
  9660                                  ;-888     while (i < LTop) { listvar(i); i++; } } 
  9661                                  
  9662                                  .listproc547:
  9663 0000495D 8B46FE                   mov ax, [bp-2]
  9664 00004960 3B06[2C00]               cmp ax, [LTop]
  9665 00004964 0F8D0E00                 jge .listproc548
  9666 00004968 FF76FE                   push word [bp-2]
  9667 0000496B E87800                   call listvar
  9668 0000496E 83C402                   add  sp, 2
  9669 00004971 FF46FE                   inc  word[bp-2]
  9670 00004974 EBE7                     jmp .listproc547
  9671                                  .listproc548:
  9672                                  
  9673                                  ;-889 }
  9674                                  
  9675                                  .listproc546:
  9676                                  
  9677                                  ;-890 int listvar(unsigned int i) {unsigned int j; char c;
  9678 00004976 C9                       LEAVE
  9679 00004977 C3                       ret
  9680                                  ; ENDP
  9681 00004978 5C6E3B46756E637469-     listproc_0 db "\n;Function : ",0
  9682 00004981 6F6E203A2000       
  9683 00004987 2C204E756D62657220-     listproc_1 db ", Number of local variables: ",0
  9684 00004990 6F66206C6F63616C20-
  9685 00004999 7661726961626C6573-
  9686 000049A2 3A2000             
  9687 000049A5 5C6E3B202020232074-     listproc_2 db "\n;   # type sign width addr used name   list of local variables",0
  9688 000049AE 797065207369676E20-
  9689 000049B7 776964746820616464-
  9690 000049C0 722075736564206E61-
  9691 000049C9 6D652020206C697374-
  9692 000049D2 206F66206C6F63616C-
  9693 000049DB 207661726961626C65-
  9694 000049E4 7300               
  9695                                  
  9696                                  listvar:  ; *** PROC ***
  9697                                  
  9698                                  ;-891   prs("\n;"); printint51(i); prc(32);
  9699                                  
  9700                                  ;Function : listvar, Number of local variables: 3
  9701                                  ;   # type sign width addr used name   list of local variables
  9702                                  ;  200 var unsg word   890 NULL i = bp+4
  9703                                  ;  201 var unsg word   890 NULL j = bp-2
  9704                                  ;  202 var sign byte   890 NULL c = bp-4;
  9705 000049E6 C8040000                 ENTER  4,0
  9706 000049EA 68[D24B]                 push listvar_0
  9707 000049ED E834FB                   call prs
  9708 000049F0 83C402                   add  sp, 2
  9709 000049F3 FF7604                   push word [bp+4]
  9710 000049F6 E8C7FC                   call printint51
  9711 000049F9 83C402                   add  sp, 2
  9712 000049FC 6A20                     push 32
  9713 000049FE E8BCFA                   call prc
  9714 00004A01 83C402                   add  sp, 2
  9715                                  
  9716                                  ;-892   c=GType [i]; if(c=='V')prs("var ");   if(c=='*')prs("ptr ");
  9717                                  
  9718 00004A04 8B5E04                   mov bx, [bp+4]
  9719 00004A07 8A87B782                 mov al, [GType + bx]
  9720 00004A0B 8846FC                   mov [bp-4], al
  9721 00004A0E 8A46FC                   mov al, [bp-4]
  9722 00004A11 3C56                     cmp al, 86
  9723 00004A13 0F850900                 jne .listvar549
  9724 00004A17 68[D64B]                 push listvar_1
  9725 00004A1A E807FB                   call prs
  9726 00004A1D 83C402                   add  sp, 2
  9727                                  .listvar549:
  9728 00004A20 8A46FC                   mov al, [bp-4]
  9729 00004A23 3C2A                     cmp al, 42
  9730 00004A25 0F850900                 jne .listvar550
  9731 00004A29 68[DB4B]                 push listvar_2
  9732 00004A2C E8F5FA                   call prs
  9733 00004A2F 83C402                   add  sp, 2
  9734                                  
  9735                                  ;-893                if(c=='&')prs("arr ");   if(c=='#')prs("def ");
  9736                                  
  9737                                  .listvar550:
  9738 00004A32 8A46FC                   mov al, [bp-4]
  9739 00004A35 3C26                     cmp al, 38
  9740 00004A37 0F850900                 jne .listvar551
  9741 00004A3B 68[E04B]                 push listvar_3
  9742 00004A3E E8E3FA                   call prs
  9743 00004A41 83C402                   add  sp, 2
  9744                                  .listvar551:
  9745 00004A44 8A46FC                   mov al, [bp-4]
  9746 00004A47 3C23                     cmp al, 35
  9747 00004A49 0F850900                 jne .listvar552
  9748 00004A4D 68[E54B]                 push listvar_4
  9749 00004A50 E8D1FA                   call prs
  9750 00004A53 83C402                   add  sp, 2
  9751                                  
  9752                                  ;-894   c=GSign [i]; if(c=='S')prs("sign ");  if(c=='U')prs("unsg ");
  9753                                  
  9754                                  .listvar552:
  9755 00004A56 8B5E04                   mov bx, [bp+4]
  9756 00004A59 8A87E383                 mov al, [GSign + bx]
  9757 00004A5D 8846FC                   mov [bp-4], al
  9758 00004A60 8A46FC                   mov al, [bp-4]
  9759 00004A63 3C53                     cmp al, 83
  9760 00004A65 0F850900                 jne .listvar553
  9761 00004A69 68[EA4B]                 push listvar_5
  9762 00004A6C E8B5FA                   call prs
  9763 00004A6F 83C402                   add  sp, 2
  9764                                  .listvar553:
  9765 00004A72 8A46FC                   mov al, [bp-4]
  9766 00004A75 3C55                     cmp al, 85
  9767 00004A77 0F850900                 jne .listvar554
  9768 00004A7B 68[F04B]                 push listvar_6
  9769 00004A7E E8A3FA                   call prs
  9770 00004A81 83C402                   add  sp, 2
  9771                                  
  9772                                  ;-895   c=GWidth[i]; if(c==  1)prs("byte " ); if(c==  2)prs("word " );
  9773                                  
  9774                                  .listvar554:
  9775 00004A84 8B5E04                   mov bx, [bp+4]
  9776 00004A87 8A870F85                 mov al, [GWidth + bx]
  9777 00004A8B 8846FC                   mov [bp-4], al
  9778 00004A8E 8A46FC                   mov al, [bp-4]
  9779 00004A91 3C01                     cmp al, 1
  9780 00004A93 0F850900                 jne .listvar555
  9781 00004A97 68[F64B]                 push listvar_7
  9782 00004A9A E887FA                   call prs
  9783 00004A9D 83C402                   add  sp, 2
  9784                                  .listvar555:
  9785 00004AA0 8A46FC                   mov al, [bp-4]
  9786 00004AA3 3C02                     cmp al, 2
  9787 00004AA5 0F850900                 jne .listvar556
  9788 00004AA9 68[FC4B]                 push listvar_8
  9789 00004AAC E875FA                   call prs
  9790 00004AAF 83C402                   add  sp, 2
  9791                                  
  9792                                  ;-896                if(c==  4)prs("dwrd " );
  9793                                  
  9794                                  .listvar556:
  9795 00004AB2 8A46FC                   mov al, [bp-4]
  9796 00004AB5 3C04                     cmp al, 4
  9797 00004AB7 0F850900                 jne .listvar557
  9798 00004ABB 68[024C]                 push listvar_9
  9799 00004ABE E863FA                   call prs
  9800 00004AC1 83C402                   add  sp, 2
  9801                                  
  9802                                  ;-897   j=GAdr[i]; printint51(j);
  9803                                  
  9804                                  .listvar557:
  9805 00004AC4 8B5E04                   mov bx, [bp+4]
  9806 00004AC7 D1E3                     shl bx, 1
  9807 00004AC9 8B873B86                 mov ax, [GAdr + bx]
  9808 00004ACD 8946FE                   mov [bp-2], ax
  9809 00004AD0 FF76FE                   push word [bp-2]
  9810 00004AD3 E8EAFB                   call printint51
  9811 00004AD6 83C402                   add  sp, 2
  9812                                  
  9813                                  ;-898   j=GUsed[i]; if (j) printint51(j);
  9814                                  
  9815 00004AD9 8B5E04                   mov bx, [bp+4]
  9816 00004ADC D1E3                     shl bx, 1
  9817 00004ADE 8B879388                 mov ax, [GUsed + bx]
  9818 00004AE2 8946FE                   mov [bp-2], ax
  9819 00004AE5 8B46FE                   mov ax, [bp-2]
  9820 00004AE8 08C0                     or  al, al
  9821 00004AEA 0F840C00                 je .listvar558
  9822 00004AEE FF76FE                   push word [bp-2]
  9823 00004AF1 E8CCFB                   call printint51
  9824 00004AF4 83C402                   add  sp, 2
  9825                                  
  9826                                  ;-899   else {if(GType[i]=='#') prs("    -"); else prs(" NULL");}
  9827                                  
  9828 00004AF7 E92200                   jmp .listvar559
  9829                                  .listvar558:
  9830 00004AFA 8B5E04                   mov bx, [bp+4]
  9831 00004AFD 8A87B782                 mov al, [GType + bx]
  9832 00004B01 3C23                     cmp al, 35
  9833 00004B03 0F850C00                 jne .listvar560
  9834 00004B07 68[084C]                 push listvar_10
  9835 00004B0A E817FA                   call prs
  9836 00004B0D 83C402                   add  sp, 2
  9837 00004B10 E90900                   jmp .listvar561
  9838                                  .listvar560:
  9839 00004B13 68[0E4C]                 push listvar_11
  9840 00004B16 E80BFA                   call prs
  9841 00004B19 83C402                   add  sp, 2
  9842                                  .listvar561:
  9843                                  
  9844                                  ;-900   prc(32);  pt=adrofname(i); prs(pt);
  9845                                  
  9846                                  .listvar559:
  9847 00004B1C 6A20                     push 32
  9848 00004B1E E89CF9                   call prc
  9849 00004B21 83C402                   add  sp, 2
  9850 00004B24 FF7604                   push word [bp+4]
  9851 00004B27 E80DBE                   call adrofname
  9852 00004B2A 83C402                   add  sp, 2
  9853 00004B2D A3[6A00]                 mov word [pt], ax
  9854 00004B30 FF36[6A00]               push word [pt]
  9855 00004B34 E8EDF9                   call prs
  9856 00004B37 83C402                   add  sp, 2
  9857                                  
  9858                                  ;-901   if(GType[i]=='#') { prc('='); j=GData[i]; prunsign1(j); }
  9859                                  
  9860 00004B3A 8B5E04                   mov bx, [bp+4]
  9861 00004B3D 8A87B782                 mov al, [GType + bx]
  9862 00004B41 3C23                     cmp al, 35
  9863 00004B43 0F851D00                 jne .listvar562
  9864 00004B47 6A3D                     push 61
  9865 00004B49 E871F9                   call prc
  9866 00004B4C 83C402                   add  sp, 2
  9867 00004B4F 8B5E04                   mov bx, [bp+4]
  9868 00004B52 D1E3                     shl bx, 1
  9869 00004B54 8B87EB8A                 mov ax, [GData + bx]
  9870 00004B58 8946FE                   mov [bp-2], ax
  9871 00004B5B FF76FE                   push word [bp-2]
  9872 00004B5E E81DFB                   call prunsign1
  9873 00004B61 83C402                   add  sp, 2
  9874                                  
  9875                                  ;-902   if(GType[i]=='&') { prc('['); j=GData[i]; prunsign1(j); prc(']');}
  9876                                  
  9877                                  .listvar562:
  9878 00004B64 8B5E04                   mov bx, [bp+4]
  9879 00004B67 8A87B782                 mov al, [GType + bx]
  9880 00004B6B 3C26                     cmp al, 38
  9881 00004B6D 0F852500                 jne .listvar563
  9882 00004B71 6A5B                     push 91
  9883 00004B73 E847F9                   call prc
  9884 00004B76 83C402                   add  sp, 2
  9885 00004B79 8B5E04                   mov bx, [bp+4]
  9886 00004B7C D1E3                     shl bx, 1
  9887 00004B7E 8B87EB8A                 mov ax, [GData + bx]
  9888 00004B82 8946FE                   mov [bp-2], ax
  9889 00004B85 FF76FE                   push word [bp-2]
  9890 00004B88 E8F3FA                   call prunsign1
  9891 00004B8B 83C402                   add  sp, 2
  9892 00004B8E 6A5D                     push 93
  9893 00004B90 E82AF9                   call prc
  9894 00004B93 83C402                   add  sp, 2
  9895                                  
  9896                                  ;-903   if (i >= LSTART) { prs(" = bp"); j=GData[i];
  9897                                  
  9898                                  .listvar563:
  9899 00004B96 8B4604                   mov ax, [bp+4]
  9900 00004B99 3DC800                   cmp ax, 200 ;unsigned : 0
  9901 00004B9C 0F823000                 jb  .listvar564
  9902 00004BA0 68[144C]                 push listvar_12
  9903 00004BA3 E87EF9                   call prs
  9904 00004BA6 83C402                   add  sp, 2
  9905 00004BA9 8B5E04                   mov bx, [bp+4]
  9906 00004BAC D1E3                     shl bx, 1
  9907 00004BAE 8B87EB8A                 mov ax, [GData + bx]
  9908 00004BB2 8946FE                   mov [bp-2], ax
  9909                                  
  9910                                  ;-904     if (j > 0) prc('+'); pint1(j);  }
  9911                                  
  9912 00004BB5 8B46FE                   mov ax, [bp-2]
  9913 00004BB8 83F800                   cmp ax, 0
  9914 00004BBB 0F8E0800                 jle .listvar565
  9915 00004BBF 6A2B                     push 43
  9916 00004BC1 E8F9F8                   call prc
  9917 00004BC4 83C402                   add  sp, 2
  9918                                  .listvar565:
  9919 00004BC7 FF76FE                   push word [bp-2]
  9920 00004BCA E84EFA                   call pint1
  9921 00004BCD 83C402                   add  sp, 2
  9922                                  
  9923                                  ;-905 }
  9924                                  
  9925                                  .listvar564:
  9926                                  
  9927                                  ;-906 int listcall() { int i;
  9928 00004BD0 C9                       LEAVE
  9929 00004BD1 C3                       ret
  9930                                  ; ENDP
  9931 00004BD2 5C6E3B00                listvar_0 db "\n;",0
  9932 00004BD6 7661722000              listvar_1 db "var ",0
  9933 00004BDB 7074722000              listvar_2 db "ptr ",0
  9934 00004BE0 6172722000              listvar_3 db "arr ",0
  9935 00004BE5 6465662000              listvar_4 db "def ",0
  9936 00004BEA 7369676E2000            listvar_5 db "sign ",0
  9937 00004BF0 756E73672000            listvar_6 db "unsg ",0
  9938 00004BF6 627974652000            listvar_7 db "byte ",0
  9939 00004BFC 776F72642000            listvar_8 db "word ",0
  9940 00004C02 647772642000            listvar_9 db "dwrd ",0
  9941 00004C08 202020202D00            listvar_10 db "    -",0
  9942 00004C0E 204E554C4C00            listvar_11 db " NULL",0
  9943 00004C14 203D20627000            listvar_12 db " = bp",0
  9944                                  
  9945                                  listcall:  ; *** PROC ***
  9946                                  
  9947                                  ;-907   prs("\n\n;    #  addr name   list of CALLs\n");
  9948                                  
  9949                                  ;Function : listcall, Number of local variables: 1
  9950                                  ;   # type sign width addr used name   list of local variables
  9951                                  ;  200 var sign word   906 NULL i = bp-2;
  9952 00004C1A C8020000                 ENTER  2,0
  9953 00004C1E 68[484C]                 push listcall_0
  9954 00004C21 E800F9                   call prs
  9955 00004C24 83C402                   add  sp, 2
  9956                                  
  9957                                  ;-908   i=0;  while (i< CTop) { calllisting(i); i++; } }
  9958                                  
  9959 00004C27 B80000                   mov ax, 0
  9960 00004C2A 8946FE                   mov [bp-2], ax
  9961                                  .listcall566:
  9962 00004C2D 8B46FE                   mov ax, [bp-2]
  9963 00004C30 3B06[3D00]               cmp ax, [CTop]
  9964 00004C34 0F8D0E00                 jge .listcall567
  9965 00004C38 FF76FE                   push word [bp-2]
  9966 00004C3B E83200                   call calllisting
  9967 00004C3E 83C402                   add  sp, 2
  9968 00004C41 FF46FE                   inc  word[bp-2]
  9969 00004C44 EBE7                     jmp .listcall566
  9970                                  .listcall567:
  9971                                  
  9972                                  ;-909 int calllisting(int i) {char c; int j;
  9973 00004C46 C9                       LEAVE
  9974 00004C47 C3                       ret
  9975                                  ; ENDP
  9976 00004C48 5C6E5C6E3B20202020-     listcall_0 db "\n\n;    #  addr name   list of CALLs\n",0
  9977 00004C51 23202061646472206E-
  9978 00004C5A 616D652020206C6973-
  9979 00004C63 74206F662043414C4C-
  9980 00004C6C 735C6E00           
  9981                                  
  9982                                  calllisting:  ; *** PROC ***
  9983                                  
  9984                                  ;-910   prs("\n;"); printint51(i); prc(32);
  9985                                  
  9986                                  ;Function : calllisting, Number of local variables: 3
  9987                                  ;   # type sign width addr used name   list of local variables
  9988                                  ;  200 var sign word   909 NULL i = bp+4
  9989                                  ;  201 var sign byte   909 NULL c = bp-2
  9990                                  ;  202 var sign word   909 NULL j = bp-4;
  9991 00004C70 C8040000                 ENTER  4,0
  9992 00004C74 68[E24C]                 push calllisting_0
  9993 00004C77 E8AAF8                   call prs
  9994 00004C7A 83C402                   add  sp, 2
  9995 00004C7D FF7604                   push word [bp+4]
  9996 00004C80 E83DFA                   call printint51
  9997 00004C83 83C402                   add  sp, 2
  9998 00004C86 6A20                     push 32
  9999 00004C88 E832F8                   call prc
 10000 00004C8B 83C402                   add  sp, 2
 10001                                  
 10002                                  ;-911   c=CType [i]; if(c==0)prs("unresolved ");
 10003                                  
 10004 00004C8E 8B5E04                   mov bx, [bp+4]
 10005 00004C91 8A872FA1                 mov al, [CType + bx]
 10006 00004C95 8846FE                   mov [bp-2], al
 10007 00004C98 8A46FE                   mov al, [bp-2]
 10008 00004C9B 3C00                     cmp al, 0
 10009 00004C9D 0F850900                 jne .calllisting568
 10010 00004CA1 68[E64C]                 push calllisting_1
 10011 00004CA4 E87DF8                   call prs
 10012 00004CA7 83C402                   add  sp, 2
 10013                                  
 10014                                  ;-912   j=CAdr[i];            printint51(j); prc(32);
 10015                                  
 10016                                  .calllisting568:
 10017 00004CAA 8B5E04                   mov bx, [bp+4]
 10018 00004CAD D1E3                     shl bx, 1
 10019 00004CAF 8B8757AB                 mov ax, [CAdr + bx]
 10020 00004CB3 8946FC                   mov [bp-4], ax
 10021 00004CB6 FF76FC                   push word [bp-4]
 10022 00004CB9 E804FA                   call printint51
 10023 00004CBC 83C402                   add  sp, 2
 10024 00004CBF 6A20                     push 32
 10025 00004CC1 E8F9F7                   call prc
 10026 00004CC4 83C402                   add  sp, 2
 10027                                  
 10028                                  ;-913   from_far(NameA, j);   prs(NameA);
 10029                                  
 10030 00004CC7 FF76FC                   push word [bp-4]
 10031 00004CCA 8D06[3F00]               lea  ax, [NameA]
 10032 00004CCE 50                       push ax
 10033 00004CCF E8B206                   call from_far
 10034 00004CD2 83C404                   add  sp, 4
 10035 00004CD5 8D06[3F00]               lea  ax, [NameA]
 10036 00004CD9 50                       push ax
 10037 00004CDA E847F8                   call prs
 10038 00004CDD 83C402                   add  sp, 2
 10039                                  
 10040                                  ;-914 }
 10041                                  
 10042                                  
 10043                                  ;-915 int countcalls(int f) { unsigned int i;
 10044 00004CE0 C9                       LEAVE
 10045 00004CE1 C3                       ret
 10046                                  ; ENDP
 10047 00004CE2 5C6E3B00                calllisting_0 db "\n;",0
 10048 00004CE6 756E7265736F6C7665-     calllisting_1 db "unresolved ",0
 10049 00004CEF 642000             
 10050                                  
 10051                                  countcalls:  ; *** PROC ***
 10052                                  
 10053                                  ;-916   pt=adrF(FNameField, f);
 10054                                  
 10055                                  ;Function : countcalls, Number of local variables: 2
 10056                                  ;   # type sign width addr used name   list of local variables
 10057                                  ;  200 var sign word   915 NULL f = bp+4
 10058                                  ;  201 var unsg word   915 NULL i = bp-2;
 10059 00004CF2 C8020000                 ENTER  2,0
 10060 00004CF6 FF7604                   push word [bp+4]
 10061 00004CF9 8D064FBD                 lea  ax, [FNameField]
 10062 00004CFD 50                       push ax
 10063 00004CFE E84ABC                   call adrF
 10064 00004D01 83C404                   add  sp, 4
 10065 00004D04 A3[6A00]                 mov word [pt], ax
 10066                                  
 10067                                  ;-917   i=0;  while (i < CTop) {
 10068                                  
 10069 00004D07 B80000                   mov ax, 0
 10070 00004D0A 8946FE                   mov [bp-2], ax
 10071                                  .countcalls569:
 10072 00004D0D 8B46FE                   mov ax, [bp-2]
 10073 00004D10 3B06[3D00]               cmp ax, [CTop]
 10074 00004D14 0F8D4A00                 jge .countcalls570
 10075                                  
 10076                                  ;-918     p1=CAdr[i];
 10077                                  
 10078 00004D18 8B5EFE                   mov bx, [bp-2]
 10079 00004D1B D1E3                     shl bx, 1
 10080 00004D1D 8B8757AB                 mov ax, [CAdr + bx]
 10081 00004D21 A3[6C00]                 mov word [p1], ax
 10082                                  
 10083                                  ;-919     from_far(NameA, p1);
 10084                                  
 10085 00004D24 FF36[6C00]               push word [p1]
 10086 00004D28 8D06[3F00]               lea  ax, [NameA]
 10087 00004D2C 50                       push ax
 10088 00004D2D E85406                   call from_far
 10089 00004D30 83C404                   add  sp, 4
 10090                                  
 10091                                  ;-920     if (eqstr(pt,NameA))  FCalls[f] = FCalls[f] + 1;
 10092                                  
 10093 00004D33 8D06[3F00]               lea  ax, [NameA]
 10094 00004D37 50                       push ax
 10095 00004D38 FF36[6A00]               push word [pt]
 10096 00004D3C E857B4                   call eqstr
 10097 00004D3F 83C404                   add  sp, 4
 10098 00004D42 08C0                     or  al, al
 10099 00004D44 0F841500                 je .countcalls571
 10100 00004D48 8B5E04                   mov bx, [bp+4]
 10101 00004D4B D1E3                     shl bx, 1
 10102 00004D4D 8B87F7BA                 mov ax, [FCalls + bx]
 10103 00004D51 83C001                   add ax, 1
 10104 00004D54 8B5E04                   mov bx, [bp+4]
 10105 00004D57 D1E3                     shl bx, 1
 10106 00004D59 8987F7BA                 mov [FCalls+bx], ax
 10107                                  
 10108                                  ;-921     i++; }
 10109                                  
 10110                                  .countcalls571:
 10111 00004D5D FF46FE                   inc  word[bp-2]
 10112                                  
 10113                                  ;-922 }
 10114                                  
 10115 00004D60 EBAB                     jmp .countcalls569
 10116                                  .countcalls570:
 10117                                  
 10118                                  ;-923 int listfunc() { int i;
 10119 00004D62 C9                       LEAVE
 10120 00004D63 C3                       ret
 10121                                  ; ENDP
 10122                                  
 10123                                  listfunc:  ; *** PROC ***
 10124                                  
 10125                                  ;-924   prs("\n\n\n;   # Calls Line Width  Name   list of functions\n");
 10126                                  
 10127                                  ;Function : listfunc, Number of local variables: 1
 10128                                  ;   # type sign width addr used name   list of local variables
 10129                                  ;  200 var sign word   923 NULL i = bp-2;
 10130 00004D64 C8020000                 ENTER  2,0
 10131 00004D68 68[B14D]                 push listfunc_0
 10132 00004D6B E8B6F7                   call prs
 10133 00004D6E 83C402                   add  sp, 2
 10134                                  
 10135                                  ;-925   i=0;  while (i < FTop) { countcalls (i); i++; } 
 10136                                  
 10137 00004D71 B80000                   mov ax, 0
 10138 00004D74 8946FE                   mov [bp-2], ax
 10139                                  .listfunc572:
 10140 00004D77 8B46FE                   mov ax, [bp-2]
 10141 00004D7A 3B06[3B00]               cmp ax, [FTop]
 10142 00004D7E 0F8D0E00                 jge .listfunc573
 10143 00004D82 FF76FE                   push word [bp-2]
 10144 00004D85 E86AFF                   call countcalls
 10145 00004D88 83C402                   add  sp, 2
 10146 00004D8B FF46FE                   inc  word[bp-2]
 10147                                  
 10148                                  ;-926   i=0;  while (i < FTop) { funclisting(i); i++; } }
 10149                                  
 10150 00004D8E EBE7                     jmp .listfunc572
 10151                                  .listfunc573:
 10152 00004D90 B80000                   mov ax, 0
 10153 00004D93 8946FE                   mov [bp-2], ax
 10154                                  .listfunc574:
 10155 00004D96 8B46FE                   mov ax, [bp-2]
 10156 00004D99 3B06[3B00]               cmp ax, [FTop]
 10157 00004D9D 0F8D0E00                 jge .listfunc575
 10158 00004DA1 FF76FE                   push word [bp-2]
 10159 00004DA4 E84300                   call funclisting
 10160 00004DA7 83C402                   add  sp, 2
 10161 00004DAA FF46FE                   inc  word[bp-2]
 10162 00004DAD EBE7                     jmp .listfunc574
 10163                                  .listfunc575:
 10164                                  
 10165                                  ;-927 int funclisting(int i) {int j;  char c;
 10166 00004DAF C9                       LEAVE
 10167 00004DB0 C3                       ret
 10168                                  ; ENDP
 10169 00004DB1 5C6E5C6E5C6E3B2020-     listfunc_0 db "\n\n\n;   # Calls Line Width  Name   list of functions\n",0
 10170 00004DBA 20232043616C6C7320-
 10171 00004DC3 4C696E652057696474-
 10172 00004DCC 6820204E616D652020-
 10173 00004DD5 206C697374206F6620-
 10174 00004DDE 66756E6374696F6E73-
 10175 00004DE7 5C6E00             
 10176                                  
 10177                                  funclisting:  ; *** PROC ***
 10178                                  
 10179                                  ;-928   prs("\n;");    printint51(i);
 10180                                  
 10181                                  ;Function : funclisting, Number of local variables: 3
 10182                                  ;   # type sign width addr used name   list of local variables
 10183                                  ;  200 var sign word   927 NULL i = bp+4
 10184                                  ;  201 var sign word   927 NULL j = bp-2
 10185                                  ;  202 var sign byte   927 NULL c = bp-4;
 10186 00004DEA C8040000                 ENTER  4,0
 10187 00004DEE 68[C64E]                 push funclisting_0
 10188 00004DF1 E830F7                   call prs
 10189 00004DF4 83C402                   add  sp, 2
 10190 00004DF7 FF7604                   push word [bp+4]
 10191 00004DFA E8C3F8                   call printint51
 10192 00004DFD 83C402                   add  sp, 2
 10193                                  
 10194                                  ;-929   j = FCalls[i]; if (j) printint51(j); else prs(" NULL");
 10195                                  
 10196 00004E00 8B5E04                   mov bx, [bp+4]
 10197 00004E03 D1E3                     shl bx, 1
 10198 00004E05 8B87F7BA                 mov ax, [FCalls + bx]
 10199 00004E09 8946FE                   mov [bp-2], ax
 10200 00004E0C 8B46FE                   mov ax, [bp-2]
 10201 00004E0F 08C0                     or  al, al
 10202 00004E11 0F840C00                 je .funclisting576
 10203 00004E15 FF76FE                   push word [bp-2]
 10204 00004E18 E8A5F8                   call printint51
 10205 00004E1B 83C402                   add  sp, 2
 10206 00004E1E E90900                   jmp .funclisting577
 10207                                  .funclisting576:
 10208 00004E21 68[CA4E]                 push funclisting_1
 10209 00004E24 E8FDF6                   call prs
 10210 00004E27 83C402                   add  sp, 2
 10211                                  
 10212                                  ;-930   j = FAdr[i];   printint51(j); prc(32);
 10213                                  
 10214                                  .funclisting577:
 10215 00004E2A 8B5E04                   mov bx, [bp+4]
 10216 00004E2D D1E3                     shl bx, 1
 10217 00004E2F 8B87FFA8                 mov ax, [FAdr + bx]
 10218 00004E33 8946FE                   mov [bp-2], ax
 10219 00004E36 FF76FE                   push word [bp-2]
 10220 00004E39 E884F8                   call printint51
 10221 00004E3C 83C402                   add  sp, 2
 10222 00004E3F 6A20                     push 32
 10223 00004E41 E879F6                   call prc
 10224 00004E44 83C402                   add  sp, 2
 10225                                  
 10226                                  ;-931   c=FType[i];
 10227                                  
 10228 00004E47 8B5E04                   mov bx, [bp+4]
 10229 00004E4A 8A8703A0                 mov al, [FType + bx]
 10230 00004E4E 8846FC                   mov [bp-4], al
 10231                                  
 10232                                  ;-932   if(c=='V')prs("void " );    if(c=='B')prs("byte " );
 10233                                  
 10234 00004E51 8A46FC                   mov al, [bp-4]
 10235 00004E54 3C56                     cmp al, 86
 10236 00004E56 0F850900                 jne .funclisting578
 10237 00004E5A 68[D04E]                 push funclisting_2
 10238 00004E5D E8C4F6                   call prs
 10239 00004E60 83C402                   add  sp, 2
 10240                                  .funclisting578:
 10241 00004E63 8A46FC                   mov al, [bp-4]
 10242 00004E66 3C42                     cmp al, 66
 10243 00004E68 0F850900                 jne .funclisting579
 10244 00004E6C 68[D64E]                 push funclisting_3
 10245 00004E6F E8B2F6                   call prs
 10246 00004E72 83C402                   add  sp, 2
 10247                                  
 10248                                  ;-933   if(c=='W')prs("word " );    if(c=='D')prs("dwrd " );
 10249                                  
 10250                                  .funclisting579:
 10251 00004E75 8A46FC                   mov al, [bp-4]
 10252 00004E78 3C57                     cmp al, 87
 10253 00004E7A 0F850900                 jne .funclisting580
 10254 00004E7E 68[DC4E]                 push funclisting_4
 10255 00004E81 E8A0F6                   call prs
 10256 00004E84 83C402                   add  sp, 2
 10257                                  .funclisting580:
 10258 00004E87 8A46FC                   mov al, [bp-4]
 10259 00004E8A 3C44                     cmp al, 68
 10260 00004E8C 0F850900                 jne .funclisting581
 10261 00004E90 68[E24E]                 push funclisting_5
 10262 00004E93 E88EF6                   call prs
 10263 00004E96 83C402                   add  sp, 2
 10264                                  
 10265                                  ;-934   prc(32); prc(32);
 10266                                  
 10267                                  .funclisting581:
 10268 00004E99 6A20                     push 32
 10269 00004E9B E81FF6                   call prc
 10270 00004E9E 83C402                   add  sp, 2
 10271 00004EA1 6A20                     push 32
 10272 00004EA3 E817F6                   call prc
 10273 00004EA6 83C402                   add  sp, 2
 10274                                  
 10275                                  ;-935   pt=adrF(FNameField, i); prs(pt);
 10276                                  
 10277 00004EA9 FF7604                   push word [bp+4]
 10278 00004EAC 8D064FBD                 lea  ax, [FNameField]
 10279 00004EB0 50                       push ax
 10280 00004EB1 E897BA                   call adrF
 10281 00004EB4 83C404                   add  sp, 4
 10282 00004EB7 A3[6A00]                 mov word [pt], ax
 10283 00004EBA FF36[6A00]               push word [pt]
 10284 00004EBE E863F6                   call prs
 10285 00004EC1 83C402                   add  sp, 2
 10286                                  
 10287                                  ;-936 }
 10288                                  
 10289                                  
 10290                                  ;-937 unsigned int MAXUI=65535;
 10291 00004EC4 C9                       LEAVE
 10292 00004EC5 C3                       ret
 10293                                  ; ENDP
 10294 00004EC6 5C6E3B00                funclisting_0 db "\n;",0
 10295 00004ECA 204E554C4C00            funclisting_1 db " NULL",0
 10296 00004ED0 766F69642000            funclisting_2 db "void ",0
 10297 00004ED6 627974652000            funclisting_3 db "byte ",0
 10298 00004EDC 776F72642000            funclisting_4 db "word ",0
 10299 00004EE2 647772642000            funclisting_5 db "dwrd ",0
 10300 00004EE8 FFFF                    MAXUI dw 65535
 10301                                  
 10302                                  ;-938 int epilog() {unsigned int i; 
 10303                                  
 10304                                  
 10305                                  epilog:  ; *** PROC ***
 10306                                  
 10307                                  ;-939   strcpy(symbol, "LastFunctionByt");  storefunc();
 10308                                  
 10309                                  ;Function : epilog, Number of local variables: 1
 10310                                  ;   # type sign width addr used name   list of local variables
 10311                                  ;  200 var unsg word   938 NULL i = bp-2;
 10312 00004EEA C8020000                 ENTER  2,0
 10313 00004EEE 68[1B51]                 push epilog_0
 10314 00004EF1 8D062B81                 lea  ax, [symbol]
 10315 00004EF5 50                       push ax
 10316 00004EF6 E86DB2                   call strcpy
 10317 00004EF9 83C404                   add  sp, 4
 10318 00004EFC E827BD                   call storefunc
 10319                                  
 10320                                  ;-940   prs("\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret");
 10321                                  
 10322 00004EFF 68[2B51]                 push epilog_1
 10323 00004F02 E81FF6                   call prs
 10324 00004F05 83C402                   add  sp, 2
 10325                                  
 10326                                  ;-941   prs("\n \n;   # type sign width  adr used name   list of global variables\n");
 10327                                  
 10328 00004F08 68[5851]                 push epilog_2
 10329 00004F0B E816F6                   call prs
 10330 00004F0E 83C402                   add  sp, 2
 10331                                  
 10332                                  ;-942   i=1;
 10333                                  
 10334 00004F11 B80100                   mov ax, 1
 10335 00004F14 8946FE                   mov [bp-2], ax
 10336                                  
 10337                                  ;-943   while (i< GTop) { listvar(i); i++; }
 10338                                  
 10339                                  .epilog582:
 10340 00004F17 8B46FE                   mov ax, [bp-2]
 10341 00004F1A 3B06[2A00]               cmp ax, [GTop]
 10342 00004F1E 0F8D0E00                 jge .epilog583
 10343 00004F22 FF76FE                   push word [bp-2]
 10344 00004F25 E8BEFA                   call listvar
 10345 00004F28 83C402                   add  sp, 2
 10346 00004F2B FF46FE                   inc  word[bp-2]
 10347                                  
 10348                                  ;-944   listfunc();   listcall();
 10349                                  
 10350 00004F2E EBE7                     jmp .epilog582
 10351                                  .epilog583:
 10352 00004F30 E831FE                   call listfunc
 10353 00004F33 E8E4FC                   call listcall
 10354                                  
 10355                                  ;-945 
 10356                                  
 10357                                  
 10358                                  ;-946   prs("\n;Input: "); prs(&namein);
 10359                                  
 10360 00004F36 68[9F51]                 push epilog_3
 10361 00004F39 E8E8F5                   call prs
 10362 00004F3C 83C402                   add  sp, 2
 10363 00004F3F 8D06EE81                 lea  ax, [namein]
 10364 00004F43 50                       push ax
 10365 00004F44 E8DDF5                   call prs
 10366 00004F47 83C402                   add  sp, 2
 10367                                  
 10368                                  ;-947   prs(", List: ");   prs(&namelst);
 10369                                  
 10370 00004F4A 68[AA51]                 push epilog_4
 10371 00004F4D E8D4F5                   call prs
 10372 00004F50 83C402                   add  sp, 2
 10373 00004F53 8D063182                 lea  ax, [namelst]
 10374 00004F57 50                       push ax
 10375 00004F58 E8C9F5                   call prs
 10376 00004F5B 83C402                   add  sp, 2
 10377                                  
 10378                                  ;-948   prs(",  Lines:"); printint51(lineno);
 10379                                  
 10380 00004F5E 68[B351]                 push epilog_5
 10381 00004F61 E8C0F5                   call prs
 10382 00004F64 83C402                   add  sp, 2
 10383 00004F67 FF36[6600]               push word [lineno]
 10384 00004F6B E852F7                   call printint51
 10385 00004F6E 83C402                   add  sp, 2
 10386                                  
 10387                                  ;-949   prs("\n;Glob. variables:"); GTop--; printint51(GTop);
 10388                                  
 10389 00004F71 68[BD51]                 push epilog_6
 10390 00004F74 E8ADF5                   call prs
 10391 00004F77 83C402                   add  sp, 2
 10392 00004F7A FF0E[2A00]               dec  word[GTop]
 10393 00004F7E FF36[2A00]               push word [GTop]
 10394 00004F82 E83BF7                   call printint51
 10395 00004F85 83C402                   add  sp, 2
 10396                                  
 10397                                  ;-950   prs(" max.:"); printint51(LSTART);
 10398                                  
 10399 00004F88 68[D151]                 push epilog_7
 10400 00004F8B E896F5                   call prs
 10401 00004F8E 83C402                   add  sp, 2
 10402 00004F91 68C800                   push 200
 10403 00004F94 E829F7                   call printint51
 10404 00004F97 83C402                   add  sp, 2
 10405                                  
 10406                                  ;-951   prs("\n;Functions      :"); printint51(FTop);
 10407                                  
 10408 00004F9A 68[D851]                 push epilog_8
 10409 00004F9D E884F5                   call prs
 10410 00004FA0 83C402                   add  sp, 2
 10411 00004FA3 FF36[3B00]               push word [FTop]
 10412 00004FA7 E816F7                   call printint51
 10413 00004FAA 83C402                   add  sp, 2
 10414                                  
 10415                                  ;-952   prs(" max.:"); printint51(FUNCMAX);
 10416                                  
 10417 00004FAD 68[EC51]                 push epilog_9
 10418 00004FB0 E871F5                   call prs
 10419 00004FB3 83C402                   add  sp, 2
 10420 00004FB6 682C01                   push 300
 10421 00004FB9 E804F7                   call printint51
 10422 00004FBC 83C402                   add  sp, 2
 10423                                  
 10424                                  ;-953   prs("\n;Calls          :"); printint51(CTop);
 10425                                  
 10426 00004FBF 68[F351]                 push epilog_10
 10427 00004FC2 E85FF5                   call prs
 10428 00004FC5 83C402                   add  sp, 2
 10429 00004FC8 FF36[3D00]               push word [CTop]
 10430 00004FCC E8F1F6                   call printint51
 10431 00004FCF 83C402                   add  sp, 2
 10432                                  
 10433                                  ;-954   prs(" max.:"); printint51(CALLMAX);
 10434                                  
 10435 00004FD2 68[0752]                 push epilog_11
 10436 00004FD5 E84CF5                   call prs
 10437 00004FD8 83C402                   add  sp, 2
 10438 00004FDB 68D007                   push 2000
 10439 00004FDE E8DFF6                   call printint51
 10440 00004FE1 83C402                   add  sp, 2
 10441                                  
 10442                                  ;-955   prs(", NameField:"); printint51(CNameTop);
 10443                                  
 10444 00004FE4 68[0E52]                 push epilog_12
 10445 00004FE7 E83AF5                   call prs
 10446 00004FEA 83C402                   add  sp, 2
 10447 00004FED FF36[6000]               push word [CNameTop]
 10448 00004FF1 E8CCF6                   call printint51
 10449 00004FF4 83C402                   add  sp, 2
 10450                                  
 10451                                  ;-956   prs(" max.:"); printint51(65535);
 10452                                  
 10453 00004FF7 68[1B52]                 push epilog_13
 10454 00004FFA E827F5                   call prs
 10455 00004FFD 83C402                   add  sp, 2
 10456 00005000 6AFF                     push -1
 10457 00005002 E8BBF6                   call printint51
 10458 00005005 83C402                   add  sp, 2
 10459                                  
 10460                                  ;-957 //  prs(", segE:"); printint51(segE);
 10461                                  
 10462                                  
 10463                                  ;-958   __asm{call LastFunctionByt}  _ i=ax;
 10464                                  
 10465 00005008 E89903                  call LastFunctionByt
 10466 0000500B 8946FE                  mov [bp-2], ax
 10467                                  
 10468                                  ;-959   prs("\n;Code until     :"); printint51(i);
 10469                                  
 10470 0000500E 68[2252]                 push epilog_14
 10471 00005011 E810F5                   call prs
 10472 00005014 83C402                   add  sp, 2
 10473 00005017 FF76FE                   push word [bp-2]
 10474 0000501A E8A3F6                   call printint51
 10475 0000501D 83C402                   add  sp, 2
 10476                                  
 10477                                  ;-960   prs(" max.: "); printint51(ORGDATAORIG); i=ORGDATAORIG-i; prs(", free:");
 10478                                  
 10479 00005020 68[3652]                 push epilog_15
 10480 00005023 E8FEF4                   call prs
 10481 00005026 83C402                   add  sp, 2
 10482 00005029 FF36[0E00]               push word [ORGDATAORIG]
 10483 0000502D E890F6                   call printint51
 10484 00005030 83C402                   add  sp, 2
 10485 00005033 A1[0E00]                 mov ax, [ORGDATAORIG]
 10486 00005036 2B46FE                   sub ax, [bp-2]
 10487 00005039 8946FE                   mov [bp-2], ax
 10488 0000503C 68[3E52]                 push epilog_16
 10489 0000503F E8E2F4                   call prs
 10490 00005042 83C402                   add  sp, 2
 10491                                  
 10492                                  ;-961   printint51(i); if (i <= 1000)prs(" *** Warning *** Code area too small");
 10493                                  
 10494 00005045 FF76FE                   push word [bp-2]
 10495 00005048 E875F6                   call printint51
 10496 0000504B 83C402                   add  sp, 2
 10497 0000504E 8B46FE                   mov ax, [bp-2]
 10498 00005051 3DE803                   cmp ax, 1000
 10499 00005054 0F870900                 ja  .epilog584
 10500 00005058 68[4652]                 push epilog_17
 10501 0000505B E8C6F4                   call prs
 10502 0000505E 83C402                   add  sp, 2
 10503                                  
 10504                                  ;-962   prs("\n;Data (HeapEnd) :"); prunsign1(orgData); i=MAXUI-orgData;
 10505                                  
 10506                                  .epilog584:
 10507 00005061 68[6B52]                 push epilog_18
 10508 00005064 E8BDF4                   call prs
 10509 00005067 83C402                   add  sp, 2
 10510 0000506A FF36[1000]               push word [orgData]
 10511 0000506E E80DF6                   call prunsign1
 10512 00005071 83C402                   add  sp, 2
 10513 00005074 A1[E84E]                 mov ax, [MAXUI]
 10514 00005077 2B06[1000]               sub ax, [orgData]
 10515 0000507B 8946FE                   mov [bp-2], ax
 10516                                  
 10517                                  ;-963   prs(", resting stacksize: ");printint51(i);
 10518                                  
 10519 0000507E 68[7F52]                 push epilog_19
 10520 00005081 E8A0F4                   call prs
 10521 00005084 83C402                   add  sp, 2
 10522 00005087 FF76FE                   push word [bp-2]
 10523 0000508A E833F6                   call printint51
 10524 0000508D 83C402                   add  sp, 2
 10525                                  
 10526                                  ;-964   if (i <= 5000) prs(" *** Warning *** Stack too small");
 10527                                  
 10528 00005090 8B46FE                   mov ax, [bp-2]
 10529 00005093 3D8813                   cmp ax, 5000
 10530 00005096 0F870900                 ja  .epilog585
 10531 0000509A 68[9552]                 push epilog_20
 10532 0000509D E884F4                   call prs
 10533 000050A0 83C402                   add  sp, 2
 10534                                  
 10535                                  ;-965   prs("\n;Max. Const in '"); prs(coname); prs("' :"); printint51(maxco);
 10536                                  
 10537                                  .epilog585:
 10538 000050A3 68[B652]                 push epilog_21
 10539 000050A6 E87BF4                   call prs
 10540 000050A9 83C402                   add  sp, 2
 10541 000050AC 8D06E880                 lea  ax, [coname]
 10542 000050B0 50                       push ax
 10543 000050B1 E870F4                   call prs
 10544 000050B4 83C402                   add  sp, 2
 10545 000050B7 68[C952]                 push epilog_22
 10546 000050BA E867F4                   call prs
 10547 000050BD 83C402                   add  sp, 2
 10548 000050C0 FF36[1200]               push word [maxco]
 10549 000050C4 E8F9F5                   call printint51
 10550 000050C7 83C402                   add  sp, 2
 10551                                  
 10552                                  ;-966   prs(" max."); printint51(COMAX); i=COMAX; i=i-maxco; prs(", free:");
 10553                                  
 10554 000050CA 68[CD52]                 push epilog_23
 10555 000050CD E854F4                   call prs
 10556 000050D0 83C402                   add  sp, 2
 10557 000050D3 68B80B                   push 3000
 10558 000050D6 E8E7F5                   call printint51
 10559 000050D9 83C402                   add  sp, 2
 10560 000050DC B8B80B                   mov ax, 3000
 10561 000050DF 8946FE                   mov [bp-2], ax
 10562 000050E2 8B46FE                   mov ax, [bp-2]
 10563 000050E5 2B06[1200]               sub ax, [maxco]
 10564 000050E9 8946FE                   mov [bp-2], ax
 10565 000050EC 68[D352]                 push epilog_24
 10566 000050EF E832F4                   call prs
 10567 000050F2 83C402                   add  sp, 2
 10568                                  
 10569                                  ;-967   printint51(i);if (i <= 1000)prs(" *** Warning *** constant area too small");
 10570                                  
 10571 000050F5 FF76FE                   push word [bp-2]
 10572 000050F8 E8C5F5                   call printint51
 10573 000050FB 83C402                   add  sp, 2
 10574 000050FE 8B46FE                   mov ax, [bp-2]
 10575 00005101 3DE803                   cmp ax, 1000
 10576 00005104 0F870900                 ja  .epilog586
 10577 00005108 68[DB52]                 push epilog_25
 10578 0000510B E816F4                   call prs
 10579 0000510E 83C402                   add  sp, 2
 10580                                  
 10581                                  ;-968   end1(0);}
 10582                                  
 10583                                  .epilog586:
 10584 00005111 6A00                     push 0
 10585 00005113 E8D6F6                   call end1
 10586 00005116 83C402                   add  sp, 2
 10587                                  
 10588                                  ;-969 // while(expr) stmt; do stmt while(expr); FOR: i=0; while(i<10){stmt; i++;}
 10589                                  
 10590                                  
 10591                                  ;-970 int setblock(unsigned int i) {
 10592 00005119 C9                       LEAVE
 10593 0000511A C3                       ret
 10594                                  ; ENDP
 10595 0000511B 4C61737446756E6374-     epilog_0 db "LastFunctionByt",0
 10596 00005124 696F6E42797400     
 10597 0000512B 5C6E4C61737446756E-     epilog_1 db "\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret",0
 10598 00005134 6374696F6E4279743A-
 10599 0000513D 646220304538682C20-
 10600 00005146 302C20305C6E706F70-
 10601 0000514F 2061785C6E72657400 
 10602 00005158 5C6E205C6E3B202020-     epilog_2 db "\n \n;   # type sign width  adr used name   list of global variables\n",0
 10603 00005161 232074797065207369-
 10604 0000516A 676E20776964746820-
 10605 00005173 206164722075736564-
 10606 0000517C 206E616D652020206C-
 10607 00005185 697374206F6620676C-
 10608 0000518E 6F62616C2076617269-
 10609 00005197 61626C65735C6E00   
 10610 0000519F 5C6E3B496E7075743A-     epilog_3 db "\n;Input: ",0
 10611 000051A8 2000               
 10612 000051AA 2C204C6973743A2000      epilog_4 db ", List: ",0
 10613 000051B3 2C20204C696E65733A-     epilog_5 db ",  Lines:",0
 10614 000051BC 00                 
 10615 000051BD 5C6E3B476C6F622E20-     epilog_6 db "\n;Glob. variables:",0
 10616 000051C6 7661726961626C6573-
 10617 000051CF 3A00               
 10618 000051D1 206D61782E3A00          epilog_7 db " max.:",0
 10619 000051D8 5C6E3B46756E637469-     epilog_8 db "\n;Functions      :",0
 10620 000051E1 6F6E73202020202020-
 10621 000051EA 3A00               
 10622 000051EC 206D61782E3A00          epilog_9 db " max.:",0
 10623 000051F3 5C6E3B43616C6C7320-     epilog_10 db "\n;Calls          :",0
 10624 000051FC 202020202020202020-
 10625 00005205 3A00               
 10626 00005207 206D61782E3A00          epilog_11 db " max.:",0
 10627 0000520E 2C204E616D65466965-     epilog_12 db ", NameField:",0
 10628 00005217 6C643A00           
 10629 0000521B 206D61782E3A00          epilog_13 db " max.:",0
 10630 00005222 5C6E3B436F64652075-     epilog_14 db "\n;Code until     :",0
 10631 0000522B 6E74696C2020202020-
 10632 00005234 3A00               
 10633 00005236 206D61782E3A2000        epilog_15 db " max.: ",0
 10634 0000523E 2C20667265653A00        epilog_16 db ", free:",0
 10635 00005246 202A2A2A205761726E-     epilog_17 db " *** Warning *** Code area too small",0
 10636 0000524F 696E67202A2A2A2043-
 10637 00005258 6F6465206172656120-
 10638 00005261 746F6F20736D616C6C-
 10639 0000526A 00                 
 10640 0000526B 5C6E3B446174612028-     epilog_18 db "\n;Data (HeapEnd) :",0
 10641 00005274 48656170456E642920-
 10642 0000527D 3A00               
 10643 0000527F 2C2072657374696E67-     epilog_19 db ", resting stacksize: ",0
 10644 00005288 20737461636B73697A-
 10645 00005291 653A2000           
 10646 00005295 202A2A2A205761726E-     epilog_20 db " *** Warning *** Stack too small",0
 10647 0000529E 696E67202A2A2A2053-
 10648 000052A7 7461636B20746F6F20-
 10649 000052B0 736D616C6C00       
 10650 000052B6 5C6E3B4D61782E2043-     epilog_21 db "\n;Max. Const in '",0
 10651 000052BF 6F6E737420696E2027-
 10652 000052C8 00                 
 10653 000052C9 27203A00                epilog_22 db "' :",0
 10654 000052CD 206D61782E00            epilog_23 db " max.",0
 10655 000052D3 2C20667265653A00        epilog_24 db ", free:",0
 10656 000052DB 202A2A2A205761726E-     epilog_25 db " *** Warning *** constant area too small",0
 10657 000052E4 696E67202A2A2A2063-
 10658 000052ED 6F6E7374616E742061-
 10659 000052F6 72656120746F6F2073-
 10660 000052FF 6D616C6C00         
 10661                                  
 10662                                  setblock:  ; *** PROC ***
 10663                                  
 10664                                  ;-971   DOS_ERR=0; _BX=i; _ ax=cs; _ es=ax; _AX=0x4A00; DosInt(); }
 10665                                  
 10666                                  ;Function : setblock, Number of local variables: 1
 10667                                  ;   # type sign width addr used name   list of local variables
 10668                                  ;  200 var unsg word   970 NULL i = bp+4;
 10669 00005304 C8000000                 ENTER  0,0
 10670 00005308 B80000                   mov ax, 0
 10671 0000530B A3[6E00]                 mov word [DOS_ERR], ax
 10672 0000530E 8B5E04                   mov  bx, [bp+4]
 10673 00005311 8CC8                     mov  ax, cs
 10674 00005313 8EC0                     mov  es, ax
 10675 00005315 B8004A                   mov  ax, 18944
 10676 00005318 E8B2AD                   call DosInt
 10677                                  
 10678                                  ;-972 int allocmem(unsigned int i) { unsigned int vAX; unsigned int vBX;
 10679 0000531B C9                       LEAVE
 10680 0000531C C3                       ret
 10681                                  ; ENDP
 10682                                  
 10683                                  allocmem:  ; *** PROC ***
 10684                                  
 10685                                  ;-973   DOS_ERR=0; _BX=i;  _AX=0x4800; DosInt(); _ vAX=ax; _ vBX=bx;
 10686                                  
 10687                                  ;Function : allocmem, Number of local variables: 3
 10688                                  ;   # type sign width addr used name   list of local variables
 10689                                  ;  200 var unsg word   972 NULL i = bp+4
 10690                                  ;  201 var unsg word   972 NULL vAX = bp-2
 10691                                  ;  202 var unsg word   972 NULL vBX = bp-4;
 10692 0000531D C8040000                 ENTER  4,0
 10693 00005321 B80000                   mov ax, 0
 10694 00005324 A3[6E00]                 mov word [DOS_ERR], ax
 10695 00005327 8B5E04                   mov  bx, [bp+4]
 10696 0000532A B80048                   mov  ax, 18432
 10697 0000532D E89DAD                   call DosInt
 10698 00005330 8946FE                  mov [bp-2], ax
 10699 00005333 895EFC                  mov [bp-4], bx
 10700                                  
 10701                                  ;-974   if(DOS_ERR) return vBX;   return vAX;
 10702                                  
 10703 00005336 A1[6E00]                 mov ax, [DOS_ERR]
 10704 00005339 08C0                     or  al, al
 10705 0000533B 0F840600                 je .allocmem587
 10706 0000533F 8B46FC                   mov ax, [bp-4]
 10707 00005342 E90600                   jmp .retn
 10708                                  .allocmem587:
 10709 00005345 8B46FE                   mov ax, [bp-2]
 10710 00005348 E90000                   jmp .retn
 10711                                  
 10712                                  ;-975 }
 10713                                  
 10714                                  
 10715                                  ;-976 int copyF(char *dest, char *src, unsigned int sz) {
 10716                                  
 10717 0000534B C9                       .retn: LEAVE
 10718 0000534C C3                       ret
 10719                                  ; ENDP
 10720                                  
 10721                                  copyF:  ; *** PROC ***
 10722                                  
 10723                                  ;-977   segE;  _ es=ax;  _ si=src;  _ di=dest; _ cx=sz;  // ds:si   es:di
 10724                                  
 10725                                  ;Function : copyF, Number of local variables: 3
 10726                                  ;   # type sign width addr used name   list of local variables
 10727                                  ;  200 ptr sign byte   976 NULL dest = bp+4
 10728                                  ;  201 ptr sign byte   976 NULL src = bp+6
 10729                                  ;  202 var unsg word   976 NULL sz = bp+8;
 10730 0000534D C8000000                 ENTER  0,0
 10731 00005351 A1[6400]                 mov ax, [segE]
 10732 00005354 8EC0                     mov  es, ax
 10733 00005356 8B7606                   mov  si, [bp+6]
 10734 00005359 8B7E04                   mov  di, [bp+4]
 10735 0000535C 8B4E08                   mov  cx, [bp+8]
 10736                                  
 10737                                  ;-978   asm cld
 10738                                  
 10739 0000535F FC                       cld
 10740                                  
 10741                                  ;-979   asm rep movsb
 10742                                  
 10743 00005360 F3A4                     rep movsb
 10744                                  
 10745                                  ;-980   asm mov byte [es:di], 0
 10746                                  
 10747 00005362 26C60500                 mov byte [es:di], 0
 10748                                  
 10749                                  ;-981 }
 10750                                  
 10751                                  
 10752                                  ;-982 int to_far(char *dest, char *src) {
 10753 00005366 C9                       LEAVE
 10754 00005367 C3                       ret
 10755                                  ; ENDP
 10756                                  
 10757                                  to_far:  ; *** PROC ***
 10758                                  
 10759                                  ;-983   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
 10760                                  
 10761                                  ;Function : to_far, Number of local variables: 2
 10762                                  ;   # type sign width addr used name   list of local variables
 10763                                  ;  200 ptr sign byte   982 NULL dest = bp+4
 10764                                  ;  201 ptr sign byte   982 NULL src = bp+6;
 10765 00005368 C8000000                 ENTER  0,0
 10766 0000536C A1[6400]                 mov ax, [segE]
 10767 0000536F 8EC0                     mov  es, ax
 10768 00005371 8B7606                   mov  si, [bp+6]
 10769 00005374 8B7E04                   mov  di, [bp+4]
 10770                                  
 10771                                  ;-984   asm cld
 10772                                  
 10773 00005377 FC                       cld
 10774                                  
 10775                                  ;-985   do{
 10776                                  
 10777                                  .to_far588:
 10778                                  
 10779                                  ;-986   asm lodsb  ; inc si
 10780                                  
 10781 00005378 AC                       lodsb  ; inc si
 10782                                  
 10783                                  ;-987   asm stosb  ; inc di
 10784                                  
 10785 00005379 AA                       stosb  ; inc di
 10786                                  
 10787                                  ;-988   } while (al != 0);
 10788                                  
 10789 0000537A 3C00                     cmp  al, 0
 10790 0000537C 0F840200                 je  .to_far589
 10791 00005380 EBF6                     jmp .to_far588
 10792                                  .to_far589:
 10793                                  
 10794                                  ;-989 }
 10795                                  
 10796                                  
 10797                                  ;-990 int from_far(char *dest, char *src) {
 10798 00005382 C9                       LEAVE
 10799 00005383 C3                       ret
 10800                                  ; ENDP
 10801                                  
 10802                                  from_far:  ; *** PROC ***
 10803                                  
 10804                                  ;-991   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
 10805                                  
 10806                                  ;Function : from_far, Number of local variables: 2
 10807                                  ;   # type sign width addr used name   list of local variables
 10808                                  ;  200 ptr sign byte   990 NULL dest = bp+4
 10809                                  ;  201 ptr sign byte   990 NULL src = bp+6;
 10810 00005384 C8000000                 ENTER  0,0
 10811 00005388 A1[6400]                 mov ax, [segE]
 10812 0000538B 8EC0                     mov  es, ax
 10813 0000538D 8B7606                   mov  si, [bp+6]
 10814 00005390 8B7E04                   mov  di, [bp+4]
 10815                                  
 10816                                  ;-992   do{
 10817                                  
 10818                                  .from_far590:
 10819                                  
 10820                                  ;-993   asm mov al, [es:si]
 10821                                  
 10822 00005393 268A04                   mov al, [es:si]
 10823                                  
 10824                                  ;-994   asm inc si
 10825                                  
 10826 00005396 46                       inc si
 10827                                  
 10828                                  ;-995   asm mov [di], al
 10829                                  
 10830 00005397 8805                     mov [di], al
 10831                                  
 10832                                  ;-996   asm inc di
 10833                                  
 10834 00005399 47                       inc di
 10835                                  
 10836                                  ;-997   } while (al != 0);
 10837                                  
 10838 0000539A 3C00                     cmp  al, 0
 10839 0000539C 0F840200                 je  .from_far591
 10840 000053A0 EBF1                     jmp .from_far590
 10841                                  .from_far591:
 10842                                  
 10843                                  ;-998 }
 10844 000053A2 C9                       LEAVE
 10845 000053A3 C3                       ret
 10846                                  ; ENDP
 10847                                   
 10848                                  ; missing functions: 
 10849                                  ; Number of unresolved CALLs :    0 All FUNCTIONs in place
 10850 000053A4 E80000                  LastFunctionByt:db 0E8h, 0, 0
 10851 000053A7 58                      pop ax
 10852 000053A8 C3                      ret
 10853                                   
 10854                                  ;   # type sign width  adr used name   list of global variables
 10855                                  
 10856                                  ;    1 arr sign byte     2    2 Version1[10]
 10857                                  ;    2 def unsg byte     3    - LSTART=200
 10858                                  ;    3 def unsg byte     4    - VARMAX=300
 10859                                  ;    4 def unsg byte     5    - GNAMEMAX=4800
 10860                                  ;    5 def unsg byte     6    - FUNCMAX=300
 10861                                  ;    6 def unsg byte     7    - FNAMEMAX=4800
 10862                                  ;    7 def unsg byte     8    - CALLMAX=2000
 10863                                  ;    8 def unsg byte     9    - IDLENMAX=15
 10864                                  ;    9 def unsg byte    11    - T_NAME=256
 10865                                  ;   10 def unsg byte    12    - T_CONST=257
 10866                                  ;   11 def unsg byte    13    - T_STRING=258
 10867                                  ;   12 def unsg byte    14    - T_INCLUDE=510
 10868                                  ;   13 def unsg byte    15    - T_DEFINE=511
 10869                                  ;   14 def unsg byte    16    - T_RETURN=512
 10870                                  ;   15 def unsg byte    17    - T_IF=513
 10871                                  ;   16 def unsg byte    18    - T_ELSE=514
 10872                                  ;   17 def unsg byte    19    - T_WHILE=515
 10873                                  ;   18 def unsg byte    20    - T_DO=516
 10874                                  ;   19 def unsg byte    21    - T_INT=517
 10875                                  ;   20 def unsg byte    22    - T_ASM=518
 10876                                  ;   21 def unsg byte    23    - T_ASMBLOCK=519
 10877                                  ;   22 def unsg byte    24    - T_EMIT=520
 10878                                  ;   23 def unsg byte    25    - T_GOTO=521
 10879                                  ;   24 def unsg byte    26    - T_VOID=529
 10880                                  ;   25 def unsg byte    27    - T_CHAR=530
 10881                                  ;   26 def unsg byte    28    - T_SIGNED=531
 10882                                  ;   27 def unsg byte    29    - T_UNSIGNED=532
 10883                                  ;   28 def unsg byte    30    - T_LONG=533
 10884                                  ;   29 def unsg byte    31    - T_EQ=806
 10885                                  ;   30 def unsg byte    32    - T_NE=807
 10886                                  ;   31 def unsg byte    33    - T_GE=811
 10887                                  ;   32 def unsg byte    34    - T_LE=824
 10888                                  ;   33 def unsg byte    35    - T_PLUSPLUS=1219
 10889                                  ;   34 def unsg byte    36    - T_MINUSMINUS=1225
 10890                                  ;   35 def unsg byte    37    - T_PLUSASS=1230
 10891                                  ;   36 def unsg byte    38    - T_MINUSASS=1231
 10892                                  ;   37 def unsg byte    39    - T_MULASS=1232
 10893                                  ;   38 def unsg byte    40    - T_DIVASS=1233
 10894                                  ;   39 def unsg byte    41    - T_ANDASS=1234
 10895                                  ;   40 def unsg byte    42    - T_ORASS=1235
 10896                                  ;   41 def unsg byte    43    - T_LESSLESS=1240
 10897                                  ;   42 def unsg byte    44    - T_GREATGREAT=1241
 10898                                  ;   43 def unsg byte    45    - COMAX=3000
 10899                                  ;   44 def unsg byte    46    - CMDLENMAX=67
 10900                                  ;   45 var unsg word    47    3 ORGDATAORIG
 10901                                  ;   46 var unsg word    47   10 orgData
 10902                                  ;   47 arr sign byte    48    4 co[3000]
 10903                                  ;   48 var sign word    48    4 maxco
 10904                                  ;   49 var sign word    48    3 maxco1
 10905                                  ;   50 arr sign byte    49    2 coname[67]
 10906                                  ;   51 ptr sign byte    49    5 cloc
 10907                                  ;   52 var sign word    50    6 fdin
 10908                                  ;   53 var sign word    50    4 fdout
 10909                                  ;   54 arr sign byte    50  104 symbol[128]
 10910                                  ;   55 arr sign byte    51   10 fname[67]
 10911                                  ;   56 arr sign byte    51   10 namein[67]
 10912                                  ;   57 arr sign byte    52    7 namelst[67]
 10913                                  ;   58 arr sign byte    52    2 archivename[67]
 10914                                  ;   59 var sign word    53   41 token
 10915                                  ;   60 var sign byte    53    2 globC
 10916                                  ;   61 var sign word    53    3 spalte
 10917                                  ;   62 var sign byte    54   28 thechar
 10918                                  ;   63 var sign word    54    9 iscmp
 10919                                  ;   64 var sign word    54    4 nconst
 10920                                  ;   65 var sign word    55    3 nreturn
 10921                                  ;   66 var sign word    55   12 nlabel
 10922                                  ;   67 var sign word    56   24 GTop
 10923                                  ;   68 var sign word    56   20 LTop
 10924                                  ;   69 var unsg word    57   44 lexval
 10925                                  ;   70 var sign word    58    6 typei
 10926                                  ;   71 var sign byte    58    8 istype
 10927                                  ;   72 arr sign byte    58   11 GType[300]
 10928                                  ;   73 var sign word    59    6 signi
 10929                                  ;   74 var sign byte    59    5 issign
 10930                                  ;   75 arr sign byte    59    5 GSign[300]
 10931                                  ;   76 var sign word    60    9 widthi
 10932                                  ;   77 var sign byte    60   19 iswidth
 10933                                  ;   78 arr sign byte    60    5 GWidth[300]
 10934                                  ;   79 arr sign word    61    4 GAdr[300]
 10935                                  ;   80 arr sign word    61    6 GUsed[300]
 10936                                  ;   81 var sign word    62   26 wi
 10937                                  ;   82 arr sign word    62   11 GData[300]
 10938                                  ;   83 arr sign byte    62    2 GNameField[4800]
 10939                                  ;   84 var sign word    63   13 FTop
 10940                                  ;   85 var sign word    63    8 CTop
 10941                                  ;   86 arr sign byte    64    2 FType[300]
 10942                                  ;   87 arr sign byte    64    3 CType[2000]
 10943                                  ;   88 arr sign word    65    2 FAdr[300]
 10944                                  ;   89 arr sign word    65    4 CAdr[2000]
 10945                                  ;   90 arr sign word    66    4 FCalls[300]
 10946                                  ;   91 arr sign byte    67    5 FNameField[4800]
 10947                                  ;   92 arr sign byte    68    7 NameA[32]
 10948                                  ;   93 arr sign byte    69    5 fgetsdest[128]
 10949                                  ;   94 ptr unsg byte    69    8 CNameTop
 10950                                  ;   95 ptr unsg byte    70   10 fgetsp
 10951                                  ;   96 var unsg word    70    4 segE
 10952                                  ;   97 var unsg word    71   12 lineno
 10953                                  ;   98 var unsg word    71    2 linenoinclude
 10954                                  ;   99 ptr unsg byte    72   17 pt
 10955                                  ;  100 ptr unsg byte    72    8 p1
 10956                                  ;  101 var sign word    73    9 DOS_ERR
 10957                                  ;  102 var sign word    73    5 DOS_NoBytes
 10958                                  ;  103 var sign byte    73    3 DOS_ByteRead
 10959                                  ;  104 arr sign byte   132    2 doglobName[15]
 10960                                  ;  105 var sign word   292    5 mod1
 10961                                  ;  106 var sign word   292   12 ireg1
 10962                                  ;  107 var sign word   292    6 idx1
 10963                                  ;  108 var sign word   292    1 ids1
 10964                                  ;  109 var sign word   292    4 idw1
 10965                                  ;  110 var sign word   292    2 idt1
 10966                                  ;  111 var sign word   292 NULL val1
 10967                                  ;  112 var sign word   293    2 mod2
 10968                                  ;  113 var sign word   293    6 ireg2
 10969                                  ;  114 var sign word   293    6 idx2
 10970                                  ;  115 var sign word   293    1 ids2
 10971                                  ;  116 var sign word   293    4 idw2
 10972                                  ;  117 var sign word   293    2 idt2
 10973                                  ;  118 var sign word   293    2 val2
 10974                                  ;  119 arr sign byte   358    9 ops[5]
 10975                                  ;  120 arr sign byte   400    3 printregstr[74]
 10976                                  ;  121 var sign word   408    1 evalue
 10977                                  ;  122 var sign word   408    1 exprtype
 10978                                  ;  123 arr sign word   560    2 docalltype[10]
 10979                                  ;  124 arr sign word   560    2 docallvalue[10]
 10980                                  ;  125 arr sign byte   561    2 procname[17]
 10981                                  ;  126 ptr sign byte   616    1 arglen
 10982                                  ;  127 ptr sign byte   616    2 argv
 10983                                  ;  128 arr sign byte   756    2 symboltemp[80]
 10984                                  ;  129 var unsg word   937    1 MAXUI
 10985                                  
 10986                                  
 10987                                  ;   # Calls Line Width  Name   list of functions
 10988                                  
 10989                                  ;    0    4   75   writetty
 10990                                  ;    1    2   76   putch
 10991                                  ;    2    6   77   cputs
 10992                                  ;    3    4   78   mkneg
 10993                                  ;    4    8   80   DosInt
 10994                                  ;    5    2   85   openR
 10995                                  ;    6    1   86   creatR
 10996                                  ;    7    2   87   fcloseR
 10997                                  ;    8    3   88   exitR
 10998                                  ;    9    2   89   readRL
 10999                                  ;   10    1   90   fputcR
 11000                                  ;   11    8   93   strlen
 11001                                  ;   12   24   94   strcpy
 11002                                  ;   13   74   95   eqstr
 11003                                  ;   14    2   98   instr1
 11004                                  ;   15    1   99   strcat1
 11005                                  ;   16    1  100   toupper
 11006                                  ;   17    1  101   pint
 11007                                  ;   18    3  103   digit
 11008                                  ;   19    1  108   letter
 11009                                  ;   20    3  118   alnum
 11010                                  ;   21    4  123   a
 11011                                  ;   22   21  124   v
 11012                                  ;   23    4  129   checknamelen
 11013                                  ;   24    1  133   doglob
 11014                                  ;   25   12  182   gettypes
 11015                                  ;   26    9  191   adrofname
 11016                                  ;   27    7  192   adrF
 11017                                  ;   28    4  194   printName
 11018                                  ;   29   12  198   searchname
 11019                                  ;   30    3  202   checkName
 11020                                  ;   31   10  207   typeName
 11021                                  ;   32    3  223   name1
 11022                                  ;   33    1  228   storecall
 11023                                  ;   34    2  234   storefunc
 11024                                  ;   35    2  238   addlocal
 11025                                  ;   36    1  244   checkFunction
 11026                                  ;   37    1  247   dofunc
 11027                                  ;   38    1  282   isvariable
 11028                                  ;   39    3  295   pexpr
 11029                                  ;   40    1  302   constantexpr
 11030                                  ;   41    3  312   exprstart
 11031                                  ;   42    1  314   expr2
 11032                                  ;   43    3  359   doreg1
 11033                                  ;   44    6  378   checkreg
 11034                                  ;   45    6  403   printreg
 11035                                  ;   46    2  409   expr
 11036                                  ;   47    4  458   compoundass
 11037                                  ;   48    2  465   dovar1
 11038                                  ;   49    8  486   rterm
 11039                                  ;   50    1  499   isreg
 11040                                  ;   51   15  517   doreg
 11041                                  ;   52    1  523   doassign
 11042                                  ;   53    1  541   domul
 11043                                  ;   54    2  545   doidiv
 11044                                  ;   55    1  558   domod
 11045                                  ;   56    1  562   docall1
 11046                                  ;   57 NULL  604   main
 11047                                  ;   58    2  615   getfirstchar
 11048                                  ;   59    1  617   getarg
 11049                                  ;   60    2  635   parse
 11050                                  ;   61    1  644   checkcalls
 11051                                  ;   62    1  661   doinclude
 11052                                  ;   63    1  672   dodefine
 11053                                  ;   64    6  688   stmt
 11054                                  ;   65    1  718   doemit
 11055                                  ;   66    3  722   cmpneg
 11056                                  ;   67    7  735   prlabel
 11057                                  ;   68    3  736   prjump
 11058                                  ;   69    1  737   doif
 11059                                  ;   70    1  743   dodo
 11060                                  ;   71    1  747   dowhile
 11061                                  ;   72    4  750   isrelational
 11062                                  ;   73   17  757   getlex
 11063                                  ;   74    1  809   convertdefine
 11064                                  ;   75    1  816   getdigit
 11065                                  ;   76    1  825   getstring
 11066                                  ;   77   31  828   next
 11067                                  ;   78   78  829   istoken
 11068                                  ;   79   36  830   expect
 11069                                  ;   80    6  833   eprc
 11070                                  ;   81    5  834   eprs
 11071                                  ;   82   41  835   prc
 11072                                  ;   83    3  840   prscomment
 11073                                  ;   84    8  842   prnl
 11074                                  ;   85  247  844   prs
 11075                                  ;   86    2  849   eprnum
 11076                                  ;   87   15  851   pint1
 11077                                  ;   88   27  853   prunsign1
 11078                                  ;   89   25  856   printint51
 11079                                  ;   90    2  860   fgets1
 11080                                  ;   91    1  864   printinputline
 11081                                  ;   92    2  872   end1
 11082                                  ;   93   50  873   error1
 11083                                  ;   94    2  882   listproc
 11084                                  ;   95    2  890   listvar
 11085                                  ;   96    1  906   listcall
 11086                                  ;   97    1  909   calllisting
 11087                                  ;   98    1  915   countcalls
 11088                                  ;   99    1  923   listfunc
 11089                                  ;  100    1  927   funclisting
 11090                                  ;  101    1  938   epilog
 11091                                  ;  102    1  970   setblock
 11092                                  ;  103    1  972   allocmem
 11093                                  ;  104 NULL  976   copyF
 11094                                  ;  105    1  982   to_far
 11095                                  ;  106    3  990   from_far
 11096                                  ;  107 NULL  998   LastFunctionByt
 11097                                  
 11098                                  ;    #  addr name   list of CALLs
 11099                                  
 11100                                  ;    0     0 writetty
 11101                                  ;    1     9 writetty
 11102                                  ;    2    18 putch
 11103                                  ;    3    24 DosInt
 11104                                  ;    4    31 DosInt
 11105                                  ;    5    38 DosInt
 11106                                  ;    6    45 DosInt
 11107                                  ;    7    52 DosInt
 11108                                  ;    8    59 DosInt
 11109                                  ;    9    66 strcpy
 11110                                  ;   10    73 prc
 11111                                  ;   11    77 mkneg
 11112                                  ;   12    83 pint
 11113                                  ;   13    88 putch
 11114                                  ;   14    94 digit
 11115                                  ;   15   100 letter
 11116                                  ;   16   107 printName
 11117                                  ;   17   117 prc
 11118                                  ;   18   121 printName
 11119                                  ;   19   131 prc
 11120                                  ;   20   135 strlen
 11121                                  ;   21   142 error1
 11122                                  ;   22   149 error1
 11123                                  ;   23   156 error1
 11124                                  ;   24   163 checknamelen
 11125                                  ;   25   176 checkName
 11126                                  ;   26   186 error1
 11127                                  ;   27   193 istoken
 11128                                  ;   28   201 istoken
 11129                                  ;   29   209 prs
 11130                                  ;   30   213 prunsign1
 11131                                  ;   31   223 prs
 11132                                  ;   32   227 prs
 11133                                  ;   33   231 prs
 11134                                  ;   34   235 prs
 11135                                  ;   35   239 prs
 11136                                  ;   36   243 prunsign1
 11137                                  ;   37   253 prs
 11138                                  ;   38   257 expect
 11139                                  ;   39   264 expect
 11140                                  ;   40   271 error1
 11141                                  ;   41   278 prs
 11142                                  ;   42   282 prs
 11143                                  ;   43   286 prs
 11144                                  ;   44   290 strcpy
 11145                                  ;   45   297 expect
 11146                                  ;   46   304 istoken
 11147                                  ;   47   312 prc
 11148                                  ;   48   316 prscomment
 11149                                  ;   49   327 prc
 11150                                  ;   50   331 prs
 11151                                  ;   51   335 strlen
 11152                                  ;   52   342 istoken
 11153                                  ;   53   350 prc
 11154                                  ;   54   354 expect
 11155                                  ;   55   361 prunsign1
 11156                                  ;   56   371 istoken
 11157                                  ;   57   379 expect
 11158                                  ;   58   386 error1
 11159                                  ;   59   393 prs
 11160                                  ;   60   397 prs
 11161                                  ;   61   401 prs
 11162                                  ;   62   405 prs
 11163                                  ;   63   409 prs
 11164                                  ;   64   413 prs
 11165                                  ;   65   417 istoken
 11166                                  ;   66   425 prc
 11167                                  ;   67   429 istoken
 11168                                  ;   68   437 expect
 11169                                  ;   69   444 prunsign1
 11170                                  ;   70   454 prunsign1
 11171                                  ;   71   464 adrofname
 11172                                  ;   72   474 strcpy
 11173                                  ;   73   481 strcpy
 11174                                  ;   74   488 expect
 11175                                  ;   75   495 adrF
 11176                                  ;   76   500 adrofname
 11177                                  ;   77   510 prs
 11178                                  ;   78   514 prs
 11179                                  ;   79   518 prc
 11180                                  ;   80   522 pint1
 11181                                  ;   81   528 prc
 11182                                  ;   82   532 checkName
 11183                                  ;   83   542 error1
 11184                                  ;   84   549 adrofname
 11185                                  ;   85   559 eqstr
 11186                                  ;   86   565 adrofname
 11187                                  ;   87   575 eqstr
 11188                                  ;   88   581 istoken
 11189                                  ;   89   589 istoken
 11190                                  ;   90   597 istoken
 11191                                  ;   91   605 istoken
 11192                                  ;   92   613 istoken
 11193                                  ;   93   621 istoken
 11194                                  ;   94   629 istoken
 11195                                  ;   95   637 istoken
 11196                                  ;   96   645 name1
 11197                                  ;   97   651 error1
 11198                                  ;   98   658 getlex
 11199                                  ;   99   665 error1
 11200                                  ;  100   672 error1
 11201                                  ;  101   679 strlen
 11202                                  ;  102   686 to_far
 11203                                  ;  103   693 error1
 11204                                  ;  104   700 adrF
 11205                                  ;  105   705 strcpy
 11206                                  ;  106   712 error1
 11207                                  ;  107   719 checkName
 11208                                  ;  108   729 error1
 11209                                  ;  109   736 adrF
 11210                                  ;  110   741 strcpy
 11211                                  ;  111   748 adrF
 11212                                  ;  112   753 eqstr
 11213                                  ;  113   759 checknamelen
 11214                                  ;  114   772 strcpy
 11215                                  ;  115   779 checkFunction
 11216                                  ;  116   793 error1
 11217                                  ;  117   800 storefunc
 11218                                  ;  118   810 prs
 11219                                  ;  119   814 prs
 11220                                  ;  120   818 prs
 11221                                  ;  121   822 expect
 11222                                  ;  122   829 istoken
 11223                                  ;  123   837 typeName
 11224                                  ;  124   846 addlocal
 11225                                  ;  125   855 istoken
 11226                                  ;  126   863 expect
 11227                                  ;  127   870 expect
 11228                                  ;  128   877 isvariable
 11229                                  ;  129   888 typeName
 11230                                  ;  130   897 checknamelen
 11231                                  ;  131   910 addlocal
 11232                                  ;  132   919 istoken
 11233                                  ;  133   927 expect
 11234                                  ;  134   934 expect
 11235                                  ;  135   941 istoken
 11236                                  ;  136   949 expect
 11237                                  ;  137   956 listproc
 11238                                  ;  138   965 prs
 11239                                  ;  139   969 mkneg
 11240                                  ;  140   975 pint1
 11241                                  ;  141   981 prs
 11242                                  ;  142   985 istoken
 11243                                  ;  143   993 stmt
 11244                                  ;  144   998 prs
 11245                                  ;  145  1002 prs
 11246                                  ;  146  1006 prs
 11247                                  ;  147  1010 prs
 11248                                  ;  148  1014 prs
 11249                                  ;  149  1018 strlen
 11250                                  ;  150  1025 strcpy
 11251                                  ;  151  1032 expect
 11252                                  ;  152  1039 eqstr
 11253                                  ;  153  1045 constantexpr
 11254                                  ;  154  1058 checkreg
 11255                                  ;  155  1067 doreg1
 11256                                  ;  156  1074 exprstart
 11257                                  ;  157  1084 prs
 11258                                  ;  158  1088 prs
 11259                                  ;  159  1092 expect
 11260                                  ;  160  1099 getlex
 11261                                  ;  161  1106 typeName
 11262                                  ;  162  1115 searchname
 11263                                  ;  163  1126 gettypes
 11264                                  ;  164  1135 isrelational
 11265                                  ;  165  1148 error1
 11266                                  ;  166  1155 expect
 11267                                  ;  167  1162 prs
 11268                                  ;  168  1166 prs
 11269                                  ;  169  1170 gettypes
 11270                                  ;  170  1179 prs
 11271                                  ;  171  1183 prs
 11272                                  ;  172  1187 v
 11273                                  ;  173  1189 prs
 11274                                  ;  174  1193 prunsign1
 11275                                  ;  175  1203 cmpneg
 11276                                  ;  176  1210 prs
 11277                                  ;  177  1214 expect
 11278                                  ;  178  1221 eqstr
 11279                                  ;  179  1227 expr2
 11280                                  ;  180  1233 expr
 11281                                  ;  181  1238 getlex
 11282                                  ;  182  1245 typeName
 11283                                  ;  183  1254 error1
 11284                                  ;  184  1261 checkreg
 11285                                  ;  185  1270 doreg1
 11286                                  ;  186  1277 searchname
 11287                                  ;  187  1288 gettypes
 11288                                  ;  188  1297 error1
 11289                                  ;  189  1304 isrelational
 11290                                  ;  190  1317 error1
 11291                                  ;  191  1324 istoken
 11292                                  ;  192  1332 error1
 11293                                  ;  193  1339 istoken
 11294                                  ;  194  1347 prs
 11295                                  ;  195  1351 prs
 11296                                  ;  196  1355 prs
 11297                                  ;  197  1359 prs
 11298                                  ;  198  1363 prs
 11299                                  ;  199  1367 v
 11300                                  ;  200  1369 prs
 11301                                  ;  201  1373 prunsign1
 11302                                  ;  202  1383 adrofname
 11303                                  ;  203  1393 prs
 11304                                  ;  204  1397 prs
 11305                                  ;  205  1401 typeName
 11306                                  ;  206  1410 checkreg
 11307                                  ;  207  1419 prs
 11308                                  ;  208  1423 printreg
 11309                                  ;  209  1432 v
 11310                                  ;  210  1434 prs
 11311                                  ;  211  1438 printreg
 11312                                  ;  212  1447 error1
 11313                                  ;  213  1454 searchname
 11314                                  ;  214  1465 gettypes
 11315                                  ;  215  1474 error1
 11316                                  ;  216  1481 prs
 11317                                  ;  217  1485 printreg
 11318                                  ;  218  1494 error1
 11319                                  ;  219  1501 prs
 11320                                  ;  220  1505 a
 11321                                  ;  221  1507 prs
 11322                                  ;  222  1511 prs
 11323                                  ;  223  1515 prs
 11324                                  ;  224  1519 v
 11325                                  ;  225  1521 adrofname
 11326                                  ;  226  1531 prs
 11327                                  ;  227  1535 prs
 11328                                  ;  228  1539 error1
 11329                                  ;  229  1546 istoken
 11330                                  ;  230  1554 strcpy
 11331                                  ;  231  1561 istoken
 11332                                  ;  232  1569 strcpy
 11333                                  ;  233  1576 istoken
 11334                                  ;  234  1584 strcpy
 11335                                  ;  235  1591 istoken
 11336                                  ;  236  1599 strcpy
 11337                                  ;  237  1606 istoken
 11338                                  ;  238  1614 strcpy
 11339                                  ;  239  1621 istoken
 11340                                  ;  240  1629 strcpy
 11341                                  ;  241  1636 istoken
 11342                                  ;  242  1644 strcpy
 11343                                  ;  243  1651 getlex
 11344                                  ;  244  1658 isrelational
 11345                                  ;  245  1671 error1
 11346                                  ;  246  1678 strcpy
 11347                                  ;  247  1685 prnl
 11348                                  ;  248  1690 prs
 11349                                  ;  249  1694 prs
 11350                                  ;  250  1698 printreg
 11351                                  ;  251  1707 prs
 11352                                  ;  252  1711 istoken
 11353                                  ;  253  1719 prunsign1
 11354                                  ;  254  1729 typeName
 11355                                  ;  255  1738 checkreg
 11356                                  ;  256  1747 printreg
 11357                                  ;  257  1756 searchname
 11358                                  ;  258  1767 a
 11359                                  ;  259  1769 v
 11360                                  ;  260  1771 cmpneg
 11361                                  ;  261  1778 prs
 11362                                  ;  262  1782 expect
 11363                                  ;  263  1789 strlen
 11364                                  ;  264  1796 eqstr
 11365                                  ;  265  1802 eqstr
 11366                                  ;  266  1808 eqstr
 11367                                  ;  267  1814 eqstr
 11368                                  ;  268  1820 eqstr
 11369                                  ;  269  1826 eqstr
 11370                                  ;  270  1832 eqstr
 11371                                  ;  271  1838 eqstr
 11372                                  ;  272  1844 eqstr
 11373                                  ;  273  1850 eqstr
 11374                                  ;  274  1856 eqstr
 11375                                  ;  275  1862 eqstr
 11376                                  ;  276  1868 eqstr
 11377                                  ;  277  1874 eqstr
 11378                                  ;  278  1880 eqstr
 11379                                  ;  279  1886 eqstr
 11380                                  ;  280  1892 eqstr
 11381                                  ;  281  1898 eqstr
 11382                                  ;  282  1904 eqstr
 11383                                  ;  283  1910 eqstr
 11384                                  ;  284  1916 eqstr
 11385                                  ;  285  1922 eqstr
 11386                                  ;  286  1928 strlen
 11387                                  ;  287  1935 eqstr
 11388                                  ;  288  1941 eqstr
 11389                                  ;  289  1947 eqstr
 11390                                  ;  290  1953 eqstr
 11391                                  ;  291  1959 eqstr
 11392                                  ;  292  1965 eqstr
 11393                                  ;  293  1971 eqstr
 11394                                  ;  294  1977 eqstr
 11395                                  ;  295  1983 eqstr
 11396                                  ;  296  1989 prc
 11397                                  ;  297  1993 prc
 11398                                  ;  298  1997 prc
 11399                                  ;  299  2001 istoken
 11400                                  ;  300  2009 prs
 11401                                  ;  301  2013 prunsign1
 11402                                  ;  302  2023 typeName
 11403                                  ;  303  2032 checkreg
 11404                                  ;  304  2041 doreg1
 11405                                  ;  305  2048 docall1
 11406                                  ;  306  2056 isreg
 11407                                  ;  307  2062 searchname
 11408                                  ;  308  2073 gettypes
 11409                                  ;  309  2082 istoken
 11410                                  ;  310  2090 istoken
 11411                                  ;  311  2098 expect
 11412                                  ;  312  2105 searchname
 11413                                  ;  313  2116 expect
 11414                                  ;  314  2123 expect
 11415                                  ;  315  2130 gettypes
 11416                                  ;  316  2139 error1
 11417                                  ;  317  2146 istoken
 11418                                  ;  318  2154 error1
 11419                                  ;  319  2161 prs
 11420                                  ;  320  2165 prs
 11421                                  ;  321  2169 prs
 11422                                  ;  322  2173 v
 11423                                  ;  323  2175 istoken
 11424                                  ;  324  2183 error1
 11425                                  ;  325  2190 prs
 11426                                  ;  326  2194 prs
 11427                                  ;  327  2198 prs
 11428                                  ;  328  2202 v
 11429                                  ;  329  2204 istoken
 11430                                  ;  330  2212 compoundass
 11431                                  ;  331  2224 istoken
 11432                                  ;  332  2232 compoundass
 11433                                  ;  333  2244 istoken
 11434                                  ;  334  2252 compoundass
 11435                                  ;  335  2264 istoken
 11436                                  ;  336  2272 compoundass
 11437                                  ;  337  2284 istoken
 11438                                  ;  338  2292 error1
 11439                                  ;  339  2299 istoken
 11440                                  ;  340  2307 error1
 11441                                  ;  341  2314 istoken
 11442                                  ;  342  2322 expr
 11443                                  ;  343  2327 doassign
 11444                                  ;  344  2336 dovar1
 11445                                  ;  345  2343 istoken
 11446                                  ;  346  2351 rterm
 11447                                  ;  347  2357 istoken
 11448                                  ;  348  2365 rterm
 11449                                  ;  349  2371 istoken
 11450                                  ;  350  2379 rterm
 11451                                  ;  351  2385 istoken
 11452                                  ;  352  2393 rterm
 11453                                  ;  353  2399 istoken
 11454                                  ;  354  2407 rterm
 11455                                  ;  355  2413 istoken
 11456                                  ;  356  2421 rterm
 11457                                  ;  357  2427 istoken
 11458                                  ;  358  2435 domul
 11459                                  ;  359  2441 istoken
 11460                                  ;  360  2449 doidiv
 11461                                  ;  361  2456 istoken
 11462                                  ;  362  2464 domod
 11463                                  ;  363  2470 isrelational
 11464                                  ;  364  2483 rterm
 11465                                  ;  365  2489 cmpneg
 11466                                  ;  366  2496 error1
 11467                                  ;  367  2503 prnl
 11468                                  ;  368  2508 prs
 11469                                  ;  369  2512 prs
 11470                                  ;  370  2516 gettypes
 11471                                  ;  371  2525 prs
 11472                                  ;  372  2529 prs
 11473                                  ;  373  2533 v
 11474                                  ;  374  2535 prs
 11475                                  ;  375  2539 expect
 11476                                  ;  376  2546 prunsign1
 11477                                  ;  377  2556 gettypes
 11478                                  ;  378  2565 prs
 11479                                  ;  379  2569 v
 11480                                  ;  380  2571 prnl
 11481                                  ;  381  2576 prs
 11482                                  ;  382  2580 prs
 11483                                  ;  383  2584 prs
 11484                                  ;  384  2588 prnl
 11485                                  ;  385  2593 prs
 11486                                  ;  386  2597 prs
 11487                                  ;  387  2601 a
 11488                                  ;  388  2603 prs
 11489                                  ;  389  2607 v
 11490                                  ;  390  2609 prs
 11491                                  ;  391  2613 prs
 11492                                  ;  392  2617 prs
 11493                                  ;  393  2621 prs
 11494                                  ;  394  2625 prs
 11495                                  ;  395  2629 prc
 11496                                  ;  396  2633 printName
 11497                                  ;  397  2643 prs
 11498                                  ;  398  2647 prnl
 11499                                  ;  399  2652 prs
 11500                                  ;  400  2656 prs
 11501                                  ;  401  2660 prs
 11502                                  ;  402  2664 prs
 11503                                  ;  403  2668 v
 11504                                  ;  404  2670 istoken
 11505                                  ;  405  2678 prnl
 11506                                  ;  406  2683 prs
 11507                                  ;  407  2687 prs
 11508                                  ;  408  2691 prs
 11509                                  ;  409  2695 prs
 11510                                  ;  410  2699 prunsign1
 11511                                  ;  411  2709 typeName
 11512                                  ;  412  2718 searchname
 11513                                  ;  413  2729 istoken
 11514                                  ;  414  2737 searchname
 11515                                  ;  415  2748 expect
 11516                                  ;  416  2755 expect
 11517                                  ;  417  2762 gettypes
 11518                                  ;  418  2771 error1
 11519                                  ;  419  2778 eqstr
 11520                                  ;  420  2784 dovar1
 11521                                  ;  421  2791 eqstr
 11522                                  ;  422  2797 doreg
 11523                                  ;  423  2803 eqstr
 11524                                  ;  424  2809 doreg
 11525                                  ;  425  2815 eqstr
 11526                                  ;  426  2821 doreg
 11527                                  ;  427  2827 eqstr
 11528                                  ;  428  2833 doreg
 11529                                  ;  429  2839 eqstr
 11530                                  ;  430  2845 doreg
 11531                                  ;  431  2851 eqstr
 11532                                  ;  432  2857 doreg
 11533                                  ;  433  2863 eqstr
 11534                                  ;  434  2869 doreg
 11535                                  ;  435  2875 eqstr
 11536                                  ;  436  2881 doreg
 11537                                  ;  437  2887 eqstr
 11538                                  ;  438  2893 doreg
 11539                                  ;  439  2899 eqstr
 11540                                  ;  440  2905 doreg
 11541                                  ;  441  2911 eqstr
 11542                                  ;  442  2917 doreg
 11543                                  ;  443  2923 eqstr
 11544                                  ;  444  2929 doreg
 11545                                  ;  445  2935 eqstr
 11546                                  ;  446  2941 doreg
 11547                                  ;  447  2947 eqstr
 11548                                  ;  448  2953 doreg
 11549                                  ;  449  2959 eqstr
 11550                                  ;  450  2965 doreg
 11551                                  ;  451  2971 expect
 11552                                  ;  452  2978 prs
 11553                                  ;  453  2982 prs
 11554                                  ;  454  2986 prs
 11555                                  ;  455  2990 istoken
 11556                                  ;  456  2998 prunsign1
 11557                                  ;  457  3008 istoken
 11558                                  ;  458  3016 searchname
 11559                                  ;  459  3027 v
 11560                                  ;  460  3029 error1
 11561                                  ;  461  3036 gettypes
 11562                                  ;  462  3045 prs
 11563                                  ;  463  3049 v
 11564                                  ;  464  3051 prs
 11565                                  ;  465  3055 prs
 11566                                  ;  466  3059 prs
 11567                                  ;  467  3063 a
 11568                                  ;  468  3065 prs
 11569                                  ;  469  3069 prs
 11570                                  ;  470  3073 prunsign1
 11571                                  ;  471  3083 v
 11572                                  ;  472  3085 prs
 11573                                  ;  473  3089 prs
 11574                                  ;  474  3093 printName
 11575                                  ;  475  3103 prs
 11576                                  ;  476  3107 prs
 11577                                  ;  477  3111 prs
 11578                                  ;  478  3115 prs
 11579                                  ;  479  3119 v
 11580                                  ;  480  3121 prs
 11581                                  ;  481  3125 prs
 11582                                  ;  482  3129 prs
 11583                                  ;  483  3133 v
 11584                                  ;  484  3135 prs
 11585                                  ;  485  3139 prs
 11586                                  ;  486  3143 prs
 11587                                  ;  487  3147 v
 11588                                  ;  488  3149 prs
 11589                                  ;  489  3153 rterm
 11590                                  ;  490  3159 istoken
 11591                                  ;  491  3167 prs
 11592                                  ;  492  3171 prunsign1
 11593                                  ;  493  3181 prs
 11594                                  ;  494  3185 error1
 11595                                  ;  495  3192 istoken
 11596                                  ;  496  3200 prs
 11597                                  ;  497  3204 prunsign1
 11598                                  ;  498  3214 prs
 11599                                  ;  499  3218 prs
 11600                                  ;  500  3222 typeName
 11601                                  ;  501  3231 searchname
 11602                                  ;  502  3242 error1
 11603                                  ;  503  3249 gettypes
 11604                                  ;  504  3258 error1
 11605                                  ;  505  3265 error1
 11606                                  ;  506  3272 prs
 11607                                  ;  507  3276 v
 11608                                  ;  508  3278 prs
 11609                                  ;  509  3282 prs
 11610                                  ;  510  3286 doidiv
 11611                                  ;  511  3293 prs
 11612                                  ;  512  3297 checknamelen
 11613                                  ;  513  3310 strcpy
 11614                                  ;  514  3317 storecall
 11615                                  ;  515  3327 expect
 11616                                  ;  516  3334 istoken
 11617                                  ;  517  3342 error1
 11618                                  ;  518  3349 istoken
 11619                                  ;  519  3357 istoken
 11620                                  ;  520  3365 eprs
 11621                                  ;  521  3370 eprs
 11622                                  ;  522  3375 eprc
 11623                                  ;  523  3380 eprnum
 11624                                  ;  524  3387 eprs
 11625                                  ;  525  3392 eprc
 11626                                  ;  526  3397 eprs
 11627                                  ;  527  3402 eprc
 11628                                  ;  528  3407 eprs
 11629                                  ;  529  3412 istoken
 11630                                  ;  530  3420 name1
 11631                                  ;  531  3426 searchname
 11632                                  ;  532  3437 istoken
 11633                                  ;  533  3445 checkreg
 11634                                  ;  534  3454 searchname
 11635                                  ;  535  3465 error1
 11636                                  ;  536  3472 istoken
 11637                                  ;  537  3480 expect
 11638                                  ;  538  3487 prs
 11639                                  ;  539  3491 pint1
 11640                                  ;  540  3497 prs
 11641                                  ;  541  3501 prs
 11642                                  ;  542  3505 prc
 11643                                  ;  543  3509 pint1
 11644                                  ;  544  3515 prs
 11645                                  ;  545  3519 v
 11646                                  ;  546  3521 prs
 11647                                  ;  547  3525 gettypes
 11648                                  ;  548  3534 prs
 11649                                  ;  549  3538 v
 11650                                  ;  550  3540 prs
 11651                                  ;  551  3544 v
 11652                                  ;  552  3546 prs
 11653                                  ;  553  3550 prs
 11654                                  ;  554  3554 printreg
 11655                                  ;  555  3563 prs
 11656                                  ;  556  3567 prs
 11657                                  ;  557  3571 prs
 11658                                  ;  558  3575 pint1
 11659                                  ;  559  3581 getarg
 11660                                  ;  560  3588 setblock
 11661                                  ;  561  3597 error1
 11662                                  ;  562  3604 allocmem
 11663                                  ;  563  3613 error1
 11664                                  ;  564  3620 getfirstchar
 11665                                  ;  565  3633 parse
 11666                                  ;  566  3639 checkcalls
 11667                                  ;  567  3650 epilog
 11668                                  ;  568  3657 fgets1
 11669                                  ;  569  3664 cputs
 11670                                  ;  570  3670 cputs
 11671                                  ;  571  3676 readRL
 11672                                  ;  572  3683 prnl
 11673                                  ;  573  3688 strcpy
 11674                                  ;  574  3695 instr1
 11675                                  ;  575  3702 strcat1
 11676                                  ;  576  3710 toupper
 11677                                  ;  577  3718 strcpy
 11678                                  ;  578  3725 strlen
 11679                                  ;  579  3732 openR
 11680                                  ;  580  3738 cputs
 11681                                  ;  581  3744 cputs
 11682                                  ;  582  3750 exitR
 11683                                  ;  583  3756 creatR
 11684                                  ;  584  3763 cputs
 11685                                  ;  585  3769 cputs
 11686                                  ;  586  3775 exitR
 11687                                  ;  587  3781 prs
 11688                                  ;  588  3785 prs
 11689                                  ;  589  3789 prs
 11690                                  ;  590  3793 prs
 11691                                  ;  591  3797 prs
 11692                                  ;  592  3801 prs
 11693                                  ;  593  3805 prs
 11694                                  ;  594  3809 getlex
 11695                                  ;  595  3816 istoken
 11696                                  ;  596  3824 istoken
 11697                                  ;  597  3832 dodefine
 11698                                  ;  598  3841 istoken
 11699                                  ;  599  3849 doinclude
 11700                                  ;  600  3859 error1
 11701                                  ;  601  3866 typeName
 11702                                  ;  602  3875 dofunc
 11703                                  ;  603  3882 doglob
 11704                                  ;  604  3889 prs
 11705                                  ;  605  3893 from_far
 11706                                  ;  606  3902 adrF
 11707                                  ;  607  3907 eqstr
 11708                                  ;  608  3913 prs
 11709                                  ;  609  3917 prs
 11710                                  ;  610  3921 prs
 11711                                  ;  611  3925 printint51
 11712                                  ;  612  3936 error1
 11713                                  ;  613  3943 prs
 11714                                  ;  614  3947 prs
 11715                                  ;  615  3951 prs
 11716                                  ;  616  3955 openR
 11717                                  ;  617  3961 prs
 11718                                  ;  618  3965 prs
 11719                                  ;  619  3969 error1
 11720                                  ;  620  3976 parse
 11721                                  ;  621  3982 prs
 11722                                  ;  622  3986 prs
 11723                                  ;  623  3990 getfirstchar
 11724                                  ;  624  4003 getlex
 11725                                  ;  625  4010 eqstr
 11726                                  ;  626  4016 getlex
 11727                                  ;  627  4023 eqstr
 11728                                  ;  628  4029 getlex
 11729                                  ;  629  4036 prs
 11730                                  ;  630  4040 strcpy
 11731                                  ;  631  4047 prs
 11732                                  ;  632  4051 error1
 11733                                  ;  633  4058 getlex
 11734                                  ;  634  4065 expect
 11735                                  ;  635  4072 error1
 11736                                  ;  636  4079 strlen
 11737                                  ;  637  4086 error1
 11738                                  ;  638  4093 adrofname
 11739                                  ;  639  4103 strcpy
 11740                                  ;  640  4110 expect
 11741                                  ;  641  4117 istoken
 11742                                  ;  642  4125 istoken
 11743                                  ;  643  4133 stmt
 11744                                  ;  644  4138 istoken
 11745                                  ;  645  4146 doif
 11746                                  ;  646  4151 istoken
 11747                                  ;  647  4159 dodo
 11748                                  ;  648  4164 istoken
 11749                                  ;  649  4172 dowhile
 11750                                  ;  650  4180 istoken
 11751                                  ;  651  4188 prs
 11752                                  ;  652  4192 name1
 11753                                  ;  653  4198 prs
 11754                                  ;  654  4202 expect
 11755                                  ;  655  4209 prs
 11756                                  ;  656  4213 next
 11757                                  ;  657  4218 prc
 11758                                  ;  658  4222 next
 11759                                  ;  659  4227 getlex
 11760                                  ;  660  4234 istoken
 11761                                  ;  661  4242 prs
 11762                                  ;  662  4246 next
 11763                                  ;  663  4251 prc
 11764                                  ;  664  4255 next
 11765                                  ;  665  4260 getlex
 11766                                  ;  666  4267 error1
 11767                                  ;  667  4274 istoken
 11768                                  ;  668  4282 doemit
 11769                                  ;  669  4289 istoken
 11770                                  ;  670  4297 istoken
 11771                                  ;  671  4305 exprstart
 11772                                  ;  672  4315 prs
 11773                                  ;  673  4319 expect
 11774                                  ;  674  4326 prs
 11775                                  ;  675  4330 prs
 11776                                  ;  676  4334 prc
 11777                                  ;  677  4338 expect
 11778                                  ;  678  4345 expect
 11779                                  ;  679  4352 exprstart
 11780                                  ;  680  4362 expect
 11781                                  ;  681  4369 prs
 11782                                  ;  682  4373 getlex
 11783                                  ;  683  4380 prunsign1
 11784                                  ;  684  4390 getlex
 11785                                  ;  685  4397 prc
 11786                                  ;  686  4401 expect
 11787                                  ;  687  4408 prs
 11788                                  ;  688  4412 prs
 11789                                  ;  689  4416 prs
 11790                                  ;  690  4420 prs
 11791                                  ;  691  4424 prs
 11792                                  ;  692  4428 prunsign1
 11793                                  ;  693  4438 prs
 11794                                  ;  694  4442 prs
 11795                                  ;  695  4446 prunsign1
 11796                                  ;  696  4456 prs
 11797                                  ;  697  4460 prs
 11798                                  ;  698  4464 prs
 11799                                  ;  699  4468 error1
 11800                                  ;  700  4475 prs
 11801                                  ;  701  4479 prs
 11802                                  ;  702  4483 pint1
 11803                                  ;  703  4489 prc
 11804                                  ;  704  4493 prs
 11805                                  ;  705  4497 prs
 11806                                  ;  706  4501 pint1
 11807                                  ;  707  4507 pexpr
 11808                                  ;  708  4513 pint1
 11809                                  ;  709  4519 stmt
 11810                                  ;  710  4524 istoken
 11811                                  ;  711  4532 prjump
 11812                                  ;  712  4539 prlabel
 11813                                  ;  713  4547 stmt
 11814                                  ;  714  4552 prlabel
 11815                                  ;  715  4560 prlabel
 11816                                  ;  716  4568 prlabel
 11817                                  ;  717  4576 stmt
 11818                                  ;  718  4581 expect
 11819                                  ;  719  4588 pexpr
 11820                                  ;  720  4594 pint1
 11821                                  ;  721  4600 prjump
 11822                                  ;  722  4607 prlabel
 11823                                  ;  723  4615 prlabel
 11824                                  ;  724  4623 pexpr
 11825                                  ;  725  4629 pint1
 11826                                  ;  726  4635 stmt
 11827                                  ;  727  4640 prjump
 11828                                  ;  728  4647 prlabel
 11829                                  ;  729  4655 getlex
 11830                                  ;  730  4662 next
 11831                                  ;  731  4667 next
 11832                                  ;  732  4672 next
 11833                                  ;  733  4677 next
 11834                                  ;  734  4682 next
 11835                                  ;  735  4687 next
 11836                                  ;  736  4692 next
 11837                                  ;  737  4697 next
 11838                                  ;  738  4702 next
 11839                                  ;  739  4707 next
 11840                                  ;  740  4712 next
 11841                                  ;  741  4717 next
 11842                                  ;  742  4722 next
 11843                                  ;  743  4727 next
 11844                                  ;  744  4732 next
 11845                                  ;  745  4737 instr1
 11846                                  ;  746  4744 next
 11847                                  ;  747  4749 getlex
 11848                                  ;  748  4756 next
 11849                                  ;  749  4761 next
 11850                                  ;  750  4766 getlex
 11851                                  ;  751  4773 getstring
 11852                                  ;  752  4783 digit
 11853                                  ;  753  4789 getdigit
 11854                                  ;  754  4798 next
 11855                                  ;  755  4803 next
 11856                                  ;  756  4808 next
 11857                                  ;  757  4813 alnum
 11858                                  ;  758  4819 strcpy
 11859                                  ;  759  4826 alnum
 11860                                  ;  760  4832 next
 11861                                  ;  761  4837 eqstr
 11862                                  ;  762  4843 eqstr
 11863                                  ;  763  4849 eqstr
 11864                                  ;  764  4855 eqstr
 11865                                  ;  765  4861 eqstr
 11866                                  ;  766  4867 eqstr
 11867                                  ;  767  4873 eqstr
 11868                                  ;  768  4879 eqstr
 11869                                  ;  769  4885 eqstr
 11870                                  ;  770  4891 eqstr
 11871                                  ;  771  4897 eqstr
 11872                                  ;  772  4903 eqstr
 11873                                  ;  773  4909 eqstr
 11874                                  ;  774  4915 eqstr
 11875                                  ;  775  4921 eqstr
 11876                                  ;  776  4927 eqstr
 11877                                  ;  777  4933 eqstr
 11878                                  ;  778  4939 convertdefine
 11879                                  ;  779  4953 strcpy
 11880                                  ;  780  4960 error1
 11881                                  ;  781  4967 adrofname
 11882                                  ;  782  4977 eqstr
 11883                                  ;  783  4983 next
 11884                                  ;  784  4988 alnum
 11885                                  ;  785  4994 next
 11886                                  ;  786  4999 digit
 11887                                  ;  787  5005 next
 11888                                  ;  788  5010 next
 11889                                  ;  789  5015 next
 11890                                  ;  790  5020 fgets1
 11891                                  ;  791  5027 getlex
 11892                                  ;  792  5034 istoken
 11893                                  ;  793  5042 prs
 11894                                  ;  794  5046 listproc
 11895                                  ;  795  5055 prs
 11896                                  ;  796  5059 pint1
 11897                                  ;  797  5065 error1
 11898                                  ;  798  5072 eprc
 11899                                  ;  799  5077 writetty
 11900                                  ;  800  5086 writetty
 11901                                  ;  801  5095 fputcR
 11902                                  ;  802  5102 prc
 11903                                  ;  803  5106 prs
 11904                                  ;  804  5110 prc
 11905                                  ;  805  5114 eprc
 11906                                  ;  806  5119 mkneg
 11907                                  ;  807  5125 eprnum
 11908                                  ;  808  5132 eprc
 11909                                  ;  809  5137 prc
 11910                                  ;  810  5141 mkneg
 11911                                  ;  811  5147 pint1
 11912                                  ;  812  5153 prc
 11913                                  ;  813  5157 prunsign1
 11914                                  ;  814  5167 prc
 11915                                  ;  815  5171 prc
 11916                                  ;  816  5175 prc
 11917                                  ;  817  5179 prc
 11918                                  ;  818  5183 prc
 11919                                  ;  819  5187 prunsign1
 11920                                  ;  820  5197 printinputline
 11921                                  ;  821  5212 readRL
 11922                                  ;  822  5219 prs
 11923                                  ;  823  5223 prunsign1
 11924                                  ;  824  5233 prc
 11925                                  ;  825  5237 prscomment
 11926                                  ;  826  5248 fcloseR
 11927                                  ;  827  5256 fcloseR
 11928                                  ;  828  5264 exitR
 11929                                  ;  829  5270 prnl
 11930                                  ;  830  5275 prscomment
 11931                                  ;  831  5286 prs
 11932                                  ;  832  5290 prunsign1
 11933                                  ;  833  5300 prs
 11934                                  ;  834  5304 prs
 11935                                  ;  835  5308 prs
 11936                                  ;  836  5312 pint1
 11937                                  ;  837  5318 prs
 11938                                  ;  838  5322 prunsign1
 11939                                  ;  839  5332 prs
 11940                                  ;  840  5336 prc
 11941                                  ;  841  5340 prs
 11942                                  ;  842  5344 pint1
 11943                                  ;  843  5350 prs
 11944                                  ;  844  5354 prs
 11945                                  ;  845  5358 end1
 11946                                  ;  846  5363 prs
 11947                                  ;  847  5367 prs
 11948                                  ;  848  5371 prs
 11949                                  ;  849  5375 prunsign1
 11950                                  ;  850  5385 prs
 11951                                  ;  851  5389 listvar
 11952                                  ;  852  5397 prs
 11953                                  ;  853  5401 printint51
 11954                                  ;  854  5412 prc
 11955                                  ;  855  5416 prs
 11956                                  ;  856  5420 prs
 11957                                  ;  857  5424 prs
 11958                                  ;  858  5428 prs
 11959                                  ;  859  5432 prs
 11960                                  ;  860  5436 prs
 11961                                  ;  861  5440 prs
 11962                                  ;  862  5444 prs
 11963                                  ;  863  5448 prs
 11964                                  ;  864  5452 printint51
 11965                                  ;  865  5463 printint51
 11966                                  ;  866  5474 prs
 11967                                  ;  867  5478 prs
 11968                                  ;  868  5482 prc
 11969                                  ;  869  5486 adrofname
 11970                                  ;  870  5496 prs
 11971                                  ;  871  5500 prc
 11972                                  ;  872  5504 prunsign1
 11973                                  ;  873  5514 prc
 11974                                  ;  874  5518 prunsign1
 11975                                  ;  875  5528 prc
 11976                                  ;  876  5532 prs
 11977                                  ;  877  5536 prc
 11978                                  ;  878  5540 pint1
 11979                                  ;  879  5546 prs
 11980                                  ;  880  5550 calllisting
 11981                                  ;  881  5562 prs
 11982                                  ;  882  5566 printint51
 11983                                  ;  883  5577 prc
 11984                                  ;  884  5581 prs
 11985                                  ;  885  5585 printint51
 11986                                  ;  886  5596 prc
 11987                                  ;  887  5600 from_far
 11988                                  ;  888  5609 prs
 11989                                  ;  889  5613 adrF
 11990                                  ;  890  5618 from_far
 11991                                  ;  891  5627 eqstr
 11992                                  ;  892  5633 prs
 11993                                  ;  893  5637 countcalls
 11994                                  ;  894  5648 funclisting
 11995                                  ;  895  5660 prs
 11996                                  ;  896  5664 printint51
 11997                                  ;  897  5675 printint51
 11998                                  ;  898  5686 prs
 11999                                  ;  899  5690 printint51
 12000                                  ;  900  5701 prc
 12001                                  ;  901  5705 prs
 12002                                  ;  902  5709 prs
 12003                                  ;  903  5713 prs
 12004                                  ;  904  5717 prs
 12005                                  ;  905  5721 prc
 12006                                  ;  906  5725 prc
 12007                                  ;  907  5729 adrF
 12008                                  ;  908  5734 prs
 12009                                  ;  909  5738 strcpy
 12010                                  ;  910  5745 storefunc
 12011                                  ;  911  5755 prs
 12012                                  ;  912  5759 prs
 12013                                  ;  913  5763 listvar
 12014                                  ;  914  5771 listfunc
 12015                                  ;  915  5780 listcall
 12016                                  ;  916  5789 prs
 12017                                  ;  917  5793 prs
 12018                                  ;  918  5797 prs
 12019                                  ;  919  5801 prs
 12020                                  ;  920  5805 prs
 12021                                  ;  921  5809 printint51
 12022                                  ;  922  5820 prs
 12023                                  ;  923  5824 printint51
 12024                                  ;  924  5835 prs
 12025                                  ;  925  5839 printint51
 12026                                  ;  926  5850 prs
 12027                                  ;  927  5854 printint51
 12028                                  ;  928  5865 prs
 12029                                  ;  929  5869 printint51
 12030                                  ;  930  5880 prs
 12031                                  ;  931  5884 printint51
 12032                                  ;  932  5895 prs
 12033                                  ;  933  5899 printint51
 12034                                  ;  934  5910 prs
 12035                                  ;  935  5914 printint51
 12036                                  ;  936  5925 prs
 12037                                  ;  937  5929 printint51
 12038                                  ;  938  5940 prs
 12039                                  ;  939  5944 printint51
 12040                                  ;  940  5955 prs
 12041                                  ;  941  5959 printint51
 12042                                  ;  942  5970 prs
 12043                                  ;  943  5974 printint51
 12044                                  ;  944  5985 prs
 12045                                  ;  945  5989 prs
 12046                                  ;  946  5993 prunsign1
 12047                                  ;  947  6003 prs
 12048                                  ;  948  6007 printint51
 12049                                  ;  949  6018 prs
 12050                                  ;  950  6022 prs
 12051                                  ;  951  6026 prs
 12052                                  ;  952  6030 prs
 12053                                  ;  953  6034 printint51
 12054                                  ;  954  6045 prs
 12055                                  ;  955  6049 printint51
 12056                                  ;  956  6060 prs
 12057                                  ;  957  6064 printint51
 12058                                  ;  958  6075 prs
 12059                                  ;  959  6079 end1
 12060                                  ;  960  6084 DosInt
 12061                                  ;  961  6091 DosInt
 12062                                  ;Input: A.C, List: A.S,  Lines:  999
 12063                                  ;Glob. variables:  129 max.:  200
 12064                                  ;Functions      :  108 max.:  300
 12065                                  ;Calls          :  962 max.: 2000, NameField: 6098 max.:    65535
 12066                                  ;Code until     :21671 max.: 30000, free: 8329
 12067                                  ;Data (HeapEnd) :53548, resting stacksize: 11987
 12068                                  ;Max. Const in 'epilog' :  947 max. 3000, free: 2053
