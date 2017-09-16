     1                                  
     2                                  ; A.COM V0.9, Source: A.C, Output asm: A.S
     3                                  org  256 
     4 00000000 E94930                  jmp main
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
   763 0000028C E85642                   call prc
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
   815 000002EF E91500                   jmp .retndigit
   816                                  
   817                                  ;-105     if(c>'9') return 0; 
   818                                  
   819                                  .digit23:
   820 000002F2 8A4604                   mov al, [bp+4]
   821 000002F5 3C39                     cmp al, 57
   822 000002F7 0F8E0600                 jle .digit24
   823 000002FB B80000                   mov ax, 0
   824 000002FE E90600                   jmp .retndigit
   825                                  
   826                                  ;-106     return 1; 
   827                                  
   828                                  .digit24:
   829 00000301 B80100                   mov ax, 1
   830 00000304 E90000                   jmp .retndigit
   831                                  
   832                                  ;-107 }
   833                                  
   834                                  
   835                                  ;-108 int letter(char c) { 
   836                                  
   837 00000307 C9                       .retndigit: LEAVE
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
   853 00000319 E96900                   jmp .retnletter
   854                                  
   855                                  ;-110     if (c=='.') return 1;
   856                                  
   857                                  .letter25:
   858 0000031C 8A4604                   mov al, [bp+4]
   859 0000031F 3C2E                     cmp al, 46
   860 00000321 0F850600                 jne .letter26
   861 00000325 B80100                   mov ax, 1
   862 00000328 E95A00                   jmp .retnletter
   863                                  
   864                                  ;-111     if (c=='?') return 1;
   865                                  
   866                                  .letter26:
   867 0000032B 8A4604                   mov al, [bp+4]
   868 0000032E 3C3F                     cmp al, 63
   869 00000330 0F850600                 jne .letter27
   870 00000334 B80100                   mov ax, 1
   871 00000337 E94B00                   jmp .retnletter
   872                                  
   873                                  ;-112     if (c=='$') return 1;
   874                                  
   875                                  .letter27:
   876 0000033A 8A4604                   mov al, [bp+4]
   877 0000033D 3C24                     cmp al, 36
   878 0000033F 0F850600                 jne .letter28
   879 00000343 B80100                   mov ax, 1
   880 00000346 E93C00                   jmp .retnletter
   881                                  
   882                                  ;-113     if (c> 'z') return 0; 
   883                                  
   884                                  .letter28:
   885 00000349 8A4604                   mov al, [bp+4]
   886 0000034C 3C7A                     cmp al, 122
   887 0000034E 0F8E0600                 jle .letter29
   888 00000352 B80000                   mov ax, 0
   889 00000355 E92D00                   jmp .retnletter
   890                                  
   891                                  ;-114     if (c< '@') return 0;// at included
   892                                  
   893                                  .letter29:
   894 00000358 8A4604                   mov al, [bp+4]
   895 0000035B 3C40                     cmp al, 64
   896 0000035D 0F8D0600                 jge .letter30
   897 00000361 B80000                   mov ax, 0
   898 00000364 E91E00                   jmp .retnletter
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
   910 0000037C E90600                   jmp .retnletter
   911                                  .letter32:
   912                                  
   913                                  ;-116     return 1; 
   914                                  
   915                                  .letter31:
   916 0000037F B80100                   mov ax, 1
   917 00000382 E90000                   jmp .retnletter
   918                                  
   919                                  ;-117 }    
   920                                  
   921                                  
   922                                  ;-118 int alnum(char c) {
   923                                  
   924 00000385 C9                       .retnletter: LEAVE
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
   944 000003A0 E91E00                   jmp .retnalnum
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
   957 000003B8 E90600                   jmp .retnalnum
   958                                  
   959                                  ;-121   return 0;
   960                                  
   961                                  .alnum34:
   962 000003BB B80000                   mov ax, 0
   963 000003BE E90000                   jmp .retnalnum
   964                                  
   965                                  ;-122 }       
   966                                  
   967                                  
   968                                  ;-123 int a(unsigned int i) {  printName(i);}//address
   969                                  
   970 000003C1 C9                       .retnalnum: LEAVE
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
  1000 000003E2 E80041                   call prc
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
  1016 000003FD E8E540                   call prc
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
  1045 00000424 E81044                   call error1
  1046 00000427 83C402                   add  sp, 2
  1047                                  
  1048                                  ;-131 }
  1049                                  
  1050                                  .checknamelen37:
  1051                                  
  1052                                  ;-132 char doglobName[IDLENMAX];
  1053 0000042A C9                       LEAVE
  1054 0000042B C3                       ret
  1055 0000042C 4974656D206E616D65-     checknamelen_0 db "Item name is too long in characters)",0
  1056 00000435 20697320746F6F206C-
  1057 0000043E 6F6E6720696E206368-
  1058 00000447 617261637465727329-
  1059 00000450 00                 
  1060                                  ; ENDP
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
  1085 00000468 E8CC43                   call error1
  1086 0000046B 83C402                   add  sp, 2
  1087                                  
  1088                                  ;-135   if (iswidth == 0) error1("no VOID as var type");
  1089                                  
  1090                                  .doglob38:
  1091 0000046E A0[3800]                 mov al, [iswidth]
  1092 00000471 3C00                     cmp al, 0
  1093 00000473 0F850900                 jne .doglob39
  1094 00000477 68[B807]                 push doglob_1
  1095 0000047A E8BA43                   call error1
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
  1109 0000048F E8A543                   call error1
  1110 00000492 83C402                   add  sp, 2
  1111                                  
  1112                                  ;-138   if (istoken('[')) { istype='&';
  1113                                  
  1114                                  .doglob40:
  1115 00000495 6A5B                     push 91
  1116 00000497 E87D3F                   call istoken
  1117 0000049A 83C402                   add  sp, 2
  1118 0000049D 08C0                     or  al, al
  1119 0000049F 0F84E201                 je .doglob41
  1120 000004A3 B82600                   mov ax, 38
  1121 000004A6 A2[3200]                 mov byte [istype], al
  1122                                  
  1123                                  ;-139     if (istoken(T_CONST)) {
  1124                                  
  1125 000004A9 680101                   push 257
  1126 000004AC E8683F                   call istoken
  1127 000004AF 83C402                   add  sp, 2
  1128 000004B2 08C0                     or  al, al
  1129 000004B4 0F84C200                 je .doglob42
  1130                                  
  1131                                  ;-140       prs("\nsection .bss\nabsolute ");
  1132                                  
  1133 000004B8 68[E507]                 push doglob_3
  1134 000004BB E88E40                   call prs
  1135 000004BE 83C402                   add  sp, 2
  1136                                  
  1137                                  ;-141       prunsign1(orgData);
  1138                                  
  1139 000004C1 FF36[1000]               push word [orgData]
  1140 000004C5 E8DE41                   call prunsign1
  1141 000004C8 83C402                   add  sp, 2
  1142                                  
  1143                                  ;-142       prs("\n"); prs(symbol); 
  1144                                  
  1145 000004CB 68[FF07]                 push doglob_4
  1146 000004CE E87B40                   call prs
  1147 000004D1 83C402                   add  sp, 2
  1148 000004D4 8D062B81                 lea  ax, [symbol]
  1149 000004D8 50                       push ax
  1150 000004D9 E87040                   call prs
  1151 000004DC 83C402                   add  sp, 2
  1152                                  
  1153                                  ;-143       if (iswidth==1) prs(" resb "); 
  1154                                  
  1155 000004DF A0[3800]                 mov al, [iswidth]
  1156 000004E2 3C01                     cmp al, 1
  1157 000004E4 0F850900                 jne .doglob43
  1158 000004E8 68[0208]                 push doglob_5
  1159 000004EB E85E40                   call prs
  1160 000004EE 83C402                   add  sp, 2
  1161                                  
  1162                                  ;-144       if (iswidth==2) prs(" resw ");
  1163                                  
  1164                                  .doglob43:
  1165 000004F1 A0[3800]                 mov al, [iswidth]
  1166 000004F4 3C02                     cmp al, 2
  1167 000004F6 0F850900                 jne .doglob44
  1168 000004FA 68[0908]                 push doglob_6
  1169 000004FD E84C40                   call prs
  1170 00000500 83C402                   add  sp, 2
  1171                                  
  1172                                  ;-145       if (iswidth==4) prs(" resd ");
  1173                                  
  1174                                  .doglob44:
  1175 00000503 A0[3800]                 mov al, [iswidth]
  1176 00000506 3C04                     cmp al, 4
  1177 00000508 0F850900                 jne .doglob45
  1178 0000050C 68[1008]                 push doglob_7
  1179 0000050F E83A40                   call prs
  1180 00000512 83C402                   add  sp, 2
  1181                                  
  1182                                  ;-146       prunsign1(lexval); 
  1183                                  
  1184                                  .doglob45:
  1185 00000515 FF36[2E00]               push word [lexval]
  1186 00000519 E88A41                   call prunsign1
  1187 0000051C 83C402                   add  sp, 2
  1188                                  
  1189                                  ;-147       prs("\nsection .text");
  1190                                  
  1191 0000051F 68[1708]                 push doglob_8
  1192 00000522 E82740                   call prs
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
  1232 00000571 E8C53E                   call expect
  1233 00000574 83C402                   add  sp, 2
  1234                                  
  1235                                  ;-152     }else { expect(']');
  1236                                  
  1237 00000577 E90801                   jmp .doglob48
  1238                                  .doglob42:
  1239 0000057A 6A5D                     push 93
  1240 0000057C E8BA3E                   call expect
  1241 0000057F 83C402                   add  sp, 2
  1242                                  
  1243                                  ;-153       if (iswidth != 1) error1("Only ByteArray allowed");
  1244                                  
  1245 00000582 A0[3800]                 mov al, [iswidth]
  1246 00000585 3C01                     cmp al, 1
  1247 00000587 0F840900                 je  .doglob49
  1248 0000058B 68[2708]                 push doglob_9
  1249 0000058E E8A642                   call error1
  1250 00000591 83C402                   add  sp, 2
  1251                                  
  1252                                  ;-154       prs("\n"); prs(symbol); prs(" db "); 
  1253                                  
  1254                                  .doglob49:
  1255 00000594 68[3E08]                 push doglob_10
  1256 00000597 E8B23F                   call prs
  1257 0000059A 83C402                   add  sp, 2
  1258 0000059D 8D062B81                 lea  ax, [symbol]
  1259 000005A1 50                       push ax
  1260 000005A2 E8A73F                   call prs
  1261 000005A5 83C402                   add  sp, 2
  1262 000005A8 68[4108]                 push doglob_11
  1263 000005AB E89E3F                   call prs
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
  1280 000005C9 E86D3E                   call expect
  1281 000005CC 83C402                   add  sp, 2
  1282                                  
  1283                                  ;-157       if (istoken(T_STRING)) { 
  1284                                  
  1285 000005CF 680201                   push 258
  1286 000005D2 E8423E                   call istoken
  1287 000005D5 83C402                   add  sp, 2
  1288 000005D8 08C0                     or  al, al
  1289 000005DA 0F844200                 je .doglob50
  1290                                  
  1291                                  ;-158         prc(34); prscomment(symbol); prc(34); prs(",0"); 
  1292                                  
  1293 000005DE 6A22                     push 34
  1294 000005E0 E8023F                   call prc
  1295 000005E3 83C402                   add  sp, 2
  1296 000005E6 8D062B81                 lea  ax, [symbol]
  1297 000005EA 50                       push ax
  1298 000005EB E8223F                   call prscomment
  1299 000005EE 83C402                   add  sp, 2
  1300 000005F1 6A22                     push 34
  1301 000005F3 E8EF3E                   call prc
  1302 000005F6 83C402                   add  sp, 2
  1303 000005F9 68[4608]                 push doglob_12
  1304 000005FC E84D3F                   call prs
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
  1324 00000622 E8F23D                   call istoken
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
  1338 0000063F E8A33E                   call prc
  1339 00000642 83C402                   add  sp, 2
  1340                                  
  1341                                  ;-162           expect(T_CONST); prunsign1(lexval); i=1; }
  1342                                  
  1343                                  .doglob54:
  1344 00000645 680101                   push 257
  1345 00000648 E8EE3D                   call expect
  1346 0000064B 83C402                   add  sp, 2
  1347 0000064E FF36[2E00]               push word [lexval]
  1348 00000652 E85140                   call prunsign1
  1349 00000655 83C402                   add  sp, 2
  1350 00000658 B80100                   mov ax, 1
  1351 0000065B 8946FE                   mov [bp-2], ax
  1352                                  
  1353                                  ;-163         while (istoken(',')); expect('}'); }  
  1354                                  
  1355 0000065E 6A2C                     push 44
  1356 00000660 E8B43D                   call istoken
  1357 00000663 83C402                   add  sp, 2
  1358 00000666 08C0                     or  al, al
  1359 00000668 0F840200                 je .doglob55
  1360 0000066C EBC6                     jmp .doglob53
  1361                                  .doglob55:
  1362 0000066E 6A7D                     push 125
  1363 00000670 E8C63D                   call expect
  1364 00000673 83C402                   add  sp, 2
  1365                                  
  1366                                  ;-164       else error1("String or number array expected");
  1367                                  
  1368 00000676 E90900                   jmp .doglob56
  1369                                  .doglob52:
  1370 00000679 68[4908]                 push doglob_13
  1371 0000067C E8B841                   call error1
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
  1388 00000688 E8C13E                   call prs
  1389 0000068B 83C402                   add  sp, 2
  1390 0000068E 8D062B81                 lea  ax, [symbol]
  1391 00000692 50                       push ax
  1392 00000693 E8B63E                   call prs
  1393 00000696 83C402                   add  sp, 2
  1394 00000699 A0[3200]                 mov al, [istype]
  1395 0000069C 3C2A                     cmp al, 42
  1396 0000069E 0F850C00                 jne .doglob58
  1397 000006A2 68[6C08]                 push doglob_15
  1398 000006A5 E8A43E                   call prs
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
  1412 000006BA E88F3E                   call prs
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
  1423 000006CF E87A3E                   call prs
  1424 000006D2 83C402                   add  sp, 2
  1425                                  
  1426                                  ;-171       else                 prs(" dd ");
  1427                                  
  1428 000006D5 E90900                   jmp .doglob63
  1429                                  .doglob62:
  1430 000006D8 68[7B08]                 push doglob_18
  1431 000006DB E86E3E                   call prs
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
  1443 000006E3 E8313D                   call istoken
  1444 000006E6 83C402                   add  sp, 2
  1445 000006E9 08C0                     or  al, al
  1446 000006EB 0F840800                 je .doglob64
  1447 000006EF 6A2D                     push 45
  1448 000006F1 E8F13D                   call prc
  1449 000006F4 83C402                   add  sp, 2
  1450                                  
  1451                                  ;-174     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }
  1452                                  
  1453                                  .doglob64:
  1454 000006F7 6A3D                     push 61
  1455 000006F9 E81B3D                   call istoken
  1456 000006FC 83C402                   add  sp, 2
  1457 000006FF 08C0                     or  al, al
  1458 00000701 0F841600                 je .doglob65
  1459 00000705 680101                   push 257
  1460 00000708 E82E3D                   call expect
  1461 0000070B 83C402                   add  sp, 2
  1462 0000070E FF36[2E00]               push word [lexval]
  1463 00000712 E8913F                   call prunsign1
  1464 00000715 83C402                   add  sp, 2
  1465                                  
  1466                                  ;-175     else prunsign1(0); }
  1467                                  
  1468 00000718 E90800                   jmp .doglob66
  1469                                  .doglob65:
  1470 0000071B 6A00                     push 0
  1471 0000071D E8863F                   call prunsign1
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
  1530 0000079E E8983C                   call expect
  1531 000007A1 83C402                   add  sp, 2
  1532                                  
  1533                                  ;-181 
  1534                                  
  1535                                  
  1536                                  ;-182 int gettypes(int i) {int j; char c;
  1537 000007A4 C9                       LEAVE
  1538 000007A5 C3                       ret
  1539 000007A6 476C6F62616C207461-     doglob_0 db "Global table full",0
  1540 000007AF 626C652066756C6C00 
  1541 000007B8 6E6F20564F49442061-     doglob_1 db "no VOID as var type",0
  1542 000007C1 732076617220747970-
  1543 000007CA 6500               
  1544 000007CC 5661726961626C6520-     doglob_2 db "Variable already defined",0
  1545 000007D5 616C72656164792064-
  1546 000007DE 6566696E656400     
  1547 000007E5 5C6E73656374696F6E-     doglob_3 db "\nsection .bss\nabsolute ",0
  1548 000007EE 202E6273735C6E6162-
  1549 000007F7 736F6C7574652000   
  1550 000007FF 5C6E00                  doglob_4 db "\n",0
  1551 00000802 20726573622000          doglob_5 db " resb ",0
  1552 00000809 20726573772000          doglob_6 db " resw ",0
  1553 00000810 20726573642000          doglob_7 db " resd ",0
  1554 00000817 5C6E73656374696F6E-     doglob_8 db "\nsection .text",0
  1555 00000820 202E7465787400     
  1556 00000827 4F6E6C792042797465-     doglob_9 db "Only ByteArray allowed",0
  1557 00000830 417272617920616C6C-
  1558 00000839 6F77656400         
  1559 0000083E 5C6E00                  doglob_10 db "\n",0
  1560 00000841 2064622000              doglob_11 db " db ",0
  1561 00000846 2C3000                  doglob_12 db ",0",0
  1562 00000849 537472696E67206F72-     doglob_13 db "String or number array expected",0
  1563 00000852 206E756D6265722061-
  1564 0000085B 727261792065787065-
  1565 00000864 6374656400         
  1566 00000869 5C6E00                  doglob_14 db "\n",0
  1567 0000086C 2064772000              doglob_15 db " dw ",0
  1568 00000871 2064622000              doglob_16 db " db ",0
  1569 00000876 2064772000              doglob_17 db " dw ",0
  1570 0000087B 2064642000              doglob_18 db " dd ",0
  1571                                  ; ENDP
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
  1668 00000932 E90000                   jmp .retngettypes
  1669                                  
  1670                                  ;-191 int adrofname(unsigned int i) { adrF(GNameField, i); }
  1671                                  
  1672 00000935 C9                       .retngettypes: LEAVE
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
  1727 00000977 E8D23B                   call prs
  1728 0000097A 83C402                   add  sp, 2
  1729                                  
  1730                                  ;-196   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }
  1731                                  
  1732 0000097D E93800                   jmp .printName77
  1733                                  .printName76:
  1734 00000980 68[BA09]                 push printName_0
  1735 00000983 E8C63B                   call prs
  1736 00000986 83C402                   add  sp, 2
  1737 00000989 8B5E04                   mov bx, [bp+4]
  1738 0000098C D1E3                     shl bx, 1
  1739 0000098E 8B87EB8A                 mov ax, [GData + bx]
  1740 00000992 8946FE                   mov [bp-2], ax
  1741 00000995 8B46FE                   mov ax, [bp-2]
  1742 00000998 83F800                   cmp ax, 0
  1743 0000099B 0F8E0800                 jle .printName78
  1744 0000099F 6A2B                     push 43
  1745 000009A1 E8413B                   call prc
  1746 000009A4 83C402                   add  sp, 2
  1747                                  .printName78:
  1748 000009A7 FF76FE                   push word [bp-2]
  1749 000009AA E8963C                   call pint1
  1750 000009AD 83C402                   add  sp, 2
  1751 000009B0 6A5D                     push 93
  1752 000009B2 E8303B                   call prc
  1753 000009B5 83C402                   add  sp, 2
  1754                                  
  1755                                  ;-197 }
  1756                                  
  1757                                  .printName77:
  1758                                  
  1759                                  ;-198 int searchname() { unsigned int i;
  1760 000009B8 C9                       LEAVE
  1761 000009B9 C3                       ret
  1762 000009BA 5B627000                printName_0 db "[bp",0
  1763                                  ; ENDP
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
  1779 000009D5 E85F3E                   call error1
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
  1793 000009F3 E90000                   jmp .retnsearchname
  1794                                  
  1795                                  ;-201 }
  1796                                  
  1797                                  
  1798                                  ;-202 int checkName() { unsigned int i; unsigned int j;
  1799                                  
  1800 000009F6 C9                       .retnsearchname: LEAVE
  1801 000009F7 C3                       ret
  1802 000009F8 5661726961626C6520-     searchname_0 db "Variable unknown",0
  1803 00000A01 756E6B6E6F776E00   
  1804                                  ; ENDP
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
  1833 00000A41 E94700                   jmp .retncheckName
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
  1859 00000A7D E90B00                   jmp .retncheckName
  1860                                  .checkName85:
  1861 00000A80 FF46FE                   inc  word[bp-2]
  1862                                  
  1863                                  ;-205   return 0;
  1864                                  
  1865 00000A83 EBCA                     jmp .checkName83
  1866                                  .checkName84:
  1867 00000A85 B80000                   mov ax, 0
  1868 00000A88 E90000                   jmp .retncheckName
  1869                                  
  1870                                  ;-206 }    
  1871                                  
  1872                                  
  1873                                  ;-207 int typeName() { int m; //0=V,1=*,2=&
  1874                                  
  1875 00000A8B C9                       .retncheckName: LEAVE
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
  1893 00000A9A E87A39                   call istoken
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
  1904 00000AAF E86539                   call istoken
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
  1920 00000ACA E84A39                   call istoken
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
  1931 00000ADF E83539                   call istoken
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
  1942 00000AF4 E82039                   call istoken
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
  1953 00000B09 E80B39                   call istoken
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
  1974 00000B29 E8EB38                   call istoken
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
  1987 00000B43 E8D138                   call istoken
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
  2004 00000B61 E90000                   jmp .retntypeName
  2005                                  
  2006                                  ;-222 }
  2007                                  
  2008                                  
  2009                                  ;-223 int name1() {
  2010                                  
  2011 00000B64 C9                       .retntypeName: LEAVE
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
  2023 00000B73 E8C13C                   call error1
  2024 00000B76 83C402                   add  sp, 2
  2025                                  
  2026                                  ;-225     token=getlex(); 
  2027                                  
  2028                                  .name194:
  2029 00000B79 E87731                   call getlex
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
  2041 00000B80 4E616D652065787065-     name1_0 db "Name expected",0
  2042 00000B89 6374656400         
  2043                                  ; ENDP
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
  2054 00000B9F E8953C                   call error1
  2055 00000BA2 83C402                   add  sp, 2
  2056                                  
  2057                                  ;-229   if (CNameTop >= 65468) error1("Call name table fuill");
  2058                                  
  2059                                  .storecall95:
  2060 00000BA5 A1[6000]                 mov ax, [CNameTop]
  2061 00000BA8 3DBCFF                   cmp ax, 65468 ;unsigned : 0
  2062 00000BAB 0F820900                 jb  .storecall96
  2063 00000BAF 68[100C]                 push storecall_1
  2064 00000BB2 E8823C                   call error1
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
  2088 00000BE7 E8A647                   call to_far
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
  2105 00000C00 43616C6C207461626C-     storecall_0 db "Call table full",0
  2106 00000C09 652066756C6C00     
  2107 00000C10 43616C6C206E616D65-     storecall_1 db "Call name table fuill",0
  2108 00000C19 207461626C65206675-
  2109 00000C22 696C6C00           
  2110                                  ; ENDP
  2111                                  
  2112                                  storefunc:  ; *** PROC ***
  2113 00000C26 A1[3B00]                 mov ax, [FTop]
  2114 00000C29 3D2C01                   cmp ax, 300 ;unsigned : 1
  2115 00000C2C 0F8C0900                 jl  .storefunc97
  2116 00000C30 68[870C]                 push storefunc_0
  2117 00000C33 E8013C                   call error1
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
  2157 00000C87 46756E6374696F6E20-     storefunc_0 db "Function table full",0
  2158 00000C90 7461626C652066756C-
  2159 00000C99 6C00               
  2160                                  ; ENDP
  2161                                  
  2162                                  addlocal:  ; *** PROC ***
  2163 00000C9B A1[2C00]                 mov ax, [LTop]
  2164 00000C9E 3D2C01                   cmp ax, 300 ;unsigned : 1
  2165 00000CA1 0F8C0900                 jl  .addlocal98
  2166 00000CA5 68[210D]                 push addlocal_0
  2167 00000CA8 E88C3B                   call error1
  2168 00000CAB 83C402                   add  sp, 2
  2169                                  
  2170                                  ;-239   if (checkName() != 0) error1("Variable already defined");
  2171                                  
  2172                                  .addlocal98:
  2173 00000CAE E858FD                   call checkName
  2174 00000CB1 83F800                   cmp ax, 0
  2175 00000CB4 0F840900                 je  .addlocal99
  2176 00000CB8 68[3B0D]                 push addlocal_1
  2177 00000CBB E8793B                   call error1
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
  2225 00000D21 4C6F63616C20766172-     addlocal_0 db "Local variable table full",0
  2226 00000D2A 6961626C6520746162-
  2227 00000D33 6C652066756C6C00   
  2228 00000D3B 5661726961626C6520-     addlocal_1 db "Variable already defined",0
  2229 00000D44 616C72656164792064-
  2230 00000D4D 6566696E656400     
  2231                                  ; ENDP
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
  2262 00000D91 E90B00                   jmp .retncheckFunction
  2263                                  .checkFunction102:
  2264 00000D94 FF46FE                   inc  word[bp-2]
  2265                                  
  2266                                  ;-246   return 0; }
  2267                                  
  2268 00000D97 EBC5                     jmp .checkFunction100
  2269                                  .checkFunction101:
  2270 00000D99 B80000                   mov ax, 0
  2271 00000D9C E90000                   jmp .retncheckFunction
  2272                                  
  2273                                  ;-247 int dofunc() { int nloc; int i; int narg;  
  2274                                  
  2275 00000D9F C9                       .retncheckFunction: LEAVE
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
  2310 00000DC7 68[EB0F]                 push dofunc_0
  2311 00000DCA E86A3A                   call error1
  2312 00000DCD 83C402                   add  sp, 2
  2313                                  
  2314                                  ;-252   storefunc();
  2315                                  
  2316                                  .dofunc103:
  2317 00000DD0 E853FE                   call storefunc
  2318                                  
  2319                                  ;-253   prs("\n\n"); prs(symbol); prs(":  ; *** PROC ***");
  2320                                  
  2321 00000DD3 68[0410]                 push dofunc_1
  2322 00000DD6 E87337                   call prs
  2323 00000DD9 83C402                   add  sp, 2
  2324 00000DDC 8D062B81                 lea  ax, [symbol]
  2325 00000DE0 50                       push ax
  2326 00000DE1 E86837                   call prs
  2327 00000DE4 83C402                   add  sp, 2
  2328 00000DE7 68[0910]                 push dofunc_2
  2329 00000DEA E85F37                   call prs
  2330 00000DED 83C402                   add  sp, 2
  2331                                  
  2332                                  ;-254   expect('('); LTop=LSTART;  i=0;
  2333                                  
  2334 00000DF0 6A28                     push 40
  2335 00000DF2 E84436                   call expect
  2336 00000DF5 83C402                   add  sp, 2
  2337 00000DF8 B8C800                   mov ax, 200
  2338 00000DFB A3[2C00]                 mov word [LTop], ax
  2339 00000DFE B80000                   mov ax, 0
  2340 00000E01 8946FC                   mov [bp-4], ax
  2341                                  
  2342                                  ;-255   if (istoken(')')==0) { narg=2; 
  2343                                  
  2344 00000E04 6A29                     push 41
  2345 00000E06 E80E36                   call istoken
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
  2375 00000E43 E8D135                   call istoken
  2376 00000E46 83C402                   add  sp, 2
  2377 00000E49 08C0                     or  al, al
  2378 00000E4B 0F840200                 je .dofunc107
  2379 00000E4F EBC8                     jmp .dofunc105
  2380                                  .dofunc107:
  2381 00000E51 6A29                     push 41
  2382 00000E53 E8E335                   call expect
  2383 00000E56 83C402                   add  sp, 2
  2384                                  
  2385                                  ;-259     
  2386                                  
  2387                                  
  2388                                  ;-260   expect('{'); /*body*/
  2389                                  
  2390                                  .dofunc104:
  2391 00000E59 6A7B                     push 123
  2392 00000E5B E8DB35                   call expect
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
  2409 00000E79 E8CE01                   call isvariable
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
  2445 00000EAB E86935                   call istoken
  2446 00000EAE 83C402                   add  sp, 2
  2447 00000EB1 08C0                     or  al, al
  2448 00000EB3 0F843D00                 je .dofunc112
  2449 00000EB7 B82600                   mov ax, 38
  2450 00000EBA A2[3200]                 mov byte [istype], al
  2451 00000EBD B82600                   mov ax, 38
  2452 00000EC0 8B1E[2C00]               mov bx, [LTop]
  2453 00000EC4 8887B782                 mov [GType+bx], al
  2454 00000EC8 680101                   push 257
  2455 00000ECB E86B35                   call expect
  2456 00000ECE 83C402                   add  sp, 2
  2457 00000ED1 6A5D                     push 93
  2458 00000ED3 E86335                   call expect
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
  2480 00000EFA E81A35                   call istoken
  2481 00000EFD 83C402                   add  sp, 2
  2482 00000F00 08C0                     or  al, al
  2483 00000F02 0F840300                 je .dofunc113
  2484 00000F06 E979FF                   jmp .dofunc110
  2485                                  .dofunc113:
  2486 00000F09 6A3B                     push 59
  2487 00000F0B E82B35                   call expect
  2488 00000F0E 83C402                   add  sp, 2
  2489                                  
  2490                                  ;-272   listproc(); 
  2491                                  
  2492 00000F11 E965FF                   jmp .dofunc108
  2493                                  .dofunc109:
  2494 00000F14 E8223A                   call listproc
  2495                                  
  2496                                  ;-273   if (LTop>LSTART){prs(";\n ENTER  "); 
  2497                                  
  2498 00000F17 A1[2C00]                 mov ax, [LTop]
  2499 00000F1A 3DC800                   cmp ax, 200
  2500 00000F1D 0F8E2700                 jle .dofunc114
  2501 00000F21 68[1B10]                 push dofunc_3
  2502 00000F24 E82536                   call prs
  2503 00000F27 83C402                   add  sp, 2
  2504                                  
  2505                                  ;-274     nloc=mkneg(nloc); pint1 (nloc); prs(",0"); }
  2506                                  
  2507 00000F2A FF76FE                   push word [bp-2]
  2508 00000F2D E892F1                   call mkneg
  2509 00000F30 83C402                   add  sp, 2
  2510 00000F33 8946FE                   mov [bp-2], ax
  2511 00000F36 FF76FE                   push word [bp-2]
  2512 00000F39 E80737                   call pint1
  2513 00000F3C 83C402                   add  sp, 2
  2514 00000F3F 68[2710]                 push dofunc_4
  2515 00000F42 E80736                   call prs
  2516 00000F45 83C402                   add  sp, 2
  2517                                  
  2518                                  ;-275   while(istoken('}')==0)   stmt();
  2519                                  
  2520                                  .dofunc114:
  2521                                  .dofunc115:
  2522 00000F48 6A7D                     push 125
  2523 00000F4A E8CA34                   call istoken
  2524 00000F4D 83C402                   add  sp, 2
  2525 00000F50 83F800                   cmp ax, 0
  2526 00000F53 0F850500                 jne .dofunc116
  2527 00000F57 E82228                   call stmt
  2528                                  
  2529                                  ;-276   if (nreturn) { 
  2530                                  
  2531 00000F5A EBEC                     jmp .dofunc115
  2532                                  .dofunc116:
  2533 00000F5C A1[2600]                 mov ax, [nreturn]
  2534 00000F5F 08C0                     or  al, al
  2535 00000F61 0F841C00                 je .dofunc117
  2536                                  
  2537                                  ;-277         prs("\n .retn");
  2538                                  
  2539 00000F65 68[2A10]                 push dofunc_5
  2540 00000F68 E8E135                   call prs
  2541 00000F6B 83C402                   add  sp, 2
  2542                                  
  2543                                  ;-278         prs(fname);
  2544                                  
  2545 00000F6E 8D06AB81                 lea  ax, [fname]
  2546 00000F72 50                       push ax
  2547 00000F73 E8D635                   call prs
  2548 00000F76 83C402                   add  sp, 2
  2549                                  
  2550                                  ;-279         prc(':');
  2551                                  
  2552 00000F79 6A3A                     push 58
  2553 00000F7B E86735                   call prc
  2554 00000F7E 83C402                   add  sp, 2
  2555                                  
  2556                                  ;-280         }
  2557                                  
  2558                                  
  2559                                  ;-281   if (LTop > LSTART) prs(" LEAVE");
  2560                                  
  2561                                  .dofunc117:
  2562 00000F81 A1[2C00]                 mov ax, [LTop]
  2563 00000F84 3DC800                   cmp ax, 200
  2564 00000F87 0F8E0900                 jle .dofunc118
  2565 00000F8B 68[3310]                 push dofunc_6
  2566 00000F8E E8BB35                   call prs
  2567 00000F91 83C402                   add  sp, 2
  2568                                  
  2569                                  ;-282   prs("\n ret"); 
  2570                                  
  2571                                  .dofunc118:
  2572 00000F94 68[3A10]                 push dofunc_7
  2573 00000F97 E8B235                   call prs
  2574 00000F9A 83C402                   add  sp, 2
  2575                                  
  2576                                  ;-283   *cloc=0; prs(co); 
  2577                                  
  2578 00000F9D B80000                   mov ax, 0
  2579 00000FA0 8B1E[1600]               mov  bx, [cloc]
  2580 00000FA4 8807                     mov  [bx], al
  2581 00000FA6 8D063075                 lea  ax, [co]
  2582 00000FAA 50                       push ax
  2583 00000FAB E89E35                   call prs
  2584 00000FAE 83C402                   add  sp, 2
  2585                                  
  2586                                  ;-284   maxco1=strlen(co);
  2587                                  
  2588 00000FB1 8D063075                 lea  ax, [co]
  2589 00000FB5 50                       push ax
  2590 00000FB6 E885F1                   call strlen
  2591 00000FB9 83C402                   add  sp, 2
  2592 00000FBC A3[1400]                 mov word [maxco1], ax
  2593                                  
  2594                                  ;-285   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }
  2595                                  
  2596 00000FBF A1[1400]                 mov ax, [maxco1]
  2597 00000FC2 3B06[1200]               cmp ax, [maxco]
  2598 00000FC6 0F8E1600                 jle .dofunc119
  2599 00000FCA A1[1400]                 mov ax, [maxco1]
  2600 00000FCD A3[1200]                 mov word [maxco], ax
  2601 00000FD0 8D06AB81                 lea  ax, [fname]
  2602 00000FD4 50                       push ax
  2603 00000FD5 8D06E880                 lea  ax, [coname]
  2604 00000FD9 50                       push ax
  2605 00000FDA E889F1                   call strcpy
  2606 00000FDD 83C404                   add  sp, 4
  2607                                  
  2608                                  ;-286   prs("\n; ENDP"); 
  2609                                  
  2610                                  .dofunc119:
  2611 00000FE0 68[4110]                 push dofunc_8
  2612 00000FE3 E86635                   call prs
  2613 00000FE6 83C402                   add  sp, 2
  2614                                  
  2615                                  ;-287 }
  2616                                  
  2617                                  
  2618                                  ;-288 int isvariable() {
  2619 00000FE9 C9                       LEAVE
  2620 00000FEA C3                       ret
  2621 00000FEB 46756E6374696F6E20-     dofunc_0 db "Function already defined",0
  2622 00000FF4 616C72656164792064-
  2623 00000FFD 6566696E656400     
  2624 00001004 5C6E5C6E00              dofunc_1 db "\n\n",0
  2625 00001009 3A20203B202A2A2A20-     dofunc_2 db ":  ; *** PROC ***",0
  2626 00001012 50524F43202A2A2A00 
  2627 0000101B 3B5C6E20454E544552-     dofunc_3 db ";\n ENTER  ",0
  2628 00001024 202000             
  2629 00001027 2C3000                  dofunc_4 db ",0",0
  2630 0000102A 5C6E202E7265746E00      dofunc_5 db "\n .retn",0
  2631 00001033 204C4541564500          dofunc_6 db " LEAVE",0
  2632 0000103A 5C6E2072657400          dofunc_7 db "\n ret",0
  2633 00001041 5C6E3B20454E445000      dofunc_8 db "\n; ENDP",0
  2634                                  ; ENDP
  2635                                  
  2636                                  isvariable:  ; *** PROC ***
  2637                                  
  2638                                  ;-289     if(token==T_SIGNED)   goto v1;   
  2639                                  
  2640 0000104A A1[1C00]                 mov ax, [token]
  2641 0000104D 3D1302                   cmp ax, 531
  2642 00001050 0F850300                 jne .isvariable120
  2643 00001054 E93A00                   jmp .v1
  2644                                  
  2645                                  ;-290     if(token==T_UNSIGNED) goto v1;
  2646                                  
  2647                                  .isvariable120:
  2648 00001057 A1[1C00]                 mov ax, [token]
  2649 0000105A 3D1402                   cmp ax, 532
  2650 0000105D 0F850300                 jne .isvariable121
  2651 00001061 E92D00                   jmp .v1
  2652                                  
  2653                                  ;-291     if(token==T_CHAR)     goto v1;   
  2654                                  
  2655                                  .isvariable121:
  2656 00001064 A1[1C00]                 mov ax, [token]
  2657 00001067 3D1202                   cmp ax, 530
  2658 0000106A 0F850300                 jne .isvariable122
  2659 0000106E E92000                   jmp .v1
  2660                                  
  2661                                  ;-292     if(token==T_INT)      goto v1;
  2662                                  
  2663                                  .isvariable122:
  2664 00001071 A1[1C00]                 mov ax, [token]
  2665 00001074 3D0502                   cmp ax, 517
  2666 00001077 0F850300                 jne .isvariable123
  2667 0000107B E91300                   jmp .v1
  2668                                  
  2669                                  ;-293     if(token==T_LONG)     goto v1;
  2670                                  
  2671                                  .isvariable123:
  2672 0000107E A1[1C00]                 mov ax, [token]
  2673 00001081 3D1502                   cmp ax, 533
  2674 00001084 0F850300                 jne .isvariable124
  2675 00001088 E90600                   jmp .v1
  2676                                  
  2677                                  ;-294     return 0;  
  2678                                  
  2679                                  .isvariable124:
  2680 0000108B B80000                   mov ax, 0
  2681 0000108E E90600                   jmp .retnisvariable
  2682                                  
  2683                                  ;-295 v1: return 1;
  2684                                  
  2685                                  .v1:
  2686 00001091 B80100                   mov ax, 1
  2687 00001094 E90000                   jmp .retnisvariable
  2688                                  
  2689                                  ;-296 }
  2690                                  
  2691                                  
  2692                                  ;-297                   
  2693                                  
  2694                                  
  2695                                  ;-298 int mod1; int ireg1; int idx1; int ids1; int idw1; int idt1; int val1;
  2696                                  
  2697                                   .retnisvariable:
  2698 00001097 C3                       ret
  2699                                  ; ENDP
  2700 00001098 0000                    mod1 dw 0
  2701 0000109A 0000                    ireg1 dw 0
  2702 0000109C 0000                    idx1 dw 0
  2703 0000109E 0000                    ids1 dw 0
  2704 000010A0 0000                    idw1 dw 0
  2705 000010A2 0000                    idt1 dw 0
  2706 000010A4 0000                    val1 dw 0
  2707                                  
  2708                                  ;-299 int mod2; int ireg2; int idx2; int ids2; int idw2; int idt2; int val2;
  2709                                  
  2710 000010A6 0000                    mod2 dw 0
  2711 000010A8 0000                    ireg2 dw 0
  2712 000010AA 0000                    idx2 dw 0
  2713 000010AC 0000                    ids2 dw 0
  2714 000010AE 0000                    idw2 dw 0
  2715 000010B0 0000                    idt2 dw 0
  2716 000010B2 0000                    val2 dw 0
  2717                                  
  2718                                  ;-300 
  2719                                  
  2720                                  
  2721                                  ;-301 int pexpr() {expect('('); iscmp=0; 
  2722                                  
  2723                                  
  2724                                  pexpr:  ; *** PROC ***
  2725 000010B4 6A28                     push 40
  2726 000010B6 E88033                   call expect
  2727 000010B9 83C402                   add  sp, 2
  2728 000010BC B80000                   mov ax, 0
  2729 000010BF A3[2200]                 mov word [iscmp], ax
  2730                                  
  2731                                  ;-302   if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}
  2732                                  
  2733 000010C2 A1[1C00]                 mov ax, [token]
  2734 000010C5 3D0001                   cmp ax, 256
  2735 000010C8 0F853400                 jne .pexpr125
  2736 000010CC 68[2A11]                 push pexpr_0
  2737 000010CF 8D062B81                 lea  ax, [symbol]
  2738 000010D3 50                       push ax
  2739 000010D4 E8BFF0                   call eqstr
  2740 000010D7 83C404                   add  sp, 4
  2741 000010DA 08C0                     or  al, al
  2742 000010DC 0F840600                 je .pexpr126
  2743 000010E0 E85E00                   call constantexpr
  2744 000010E3 E94300                   jmp .retnpexpr
  2745                                  
  2746                                  ;-303     ireg1=checkreg();
  2747                                  
  2748                                  .pexpr126:
  2749 000010E6 E89A07                   call checkreg
  2750 000010E9 A3[9A10]                 mov word [ireg1], ax
  2751                                  
  2752                                  ;-304     if (ireg1) { doreg1(1); return; }  }
  2753                                  
  2754 000010EC A1[9A10]                 mov ax, [ireg1]
  2755 000010EF 08C0                     or  al, al
  2756 000010F1 0F840B00                 je .pexpr127
  2757 000010F5 6A01                     push 1
  2758 000010F7 E89D05                   call doreg1
  2759 000010FA 83C402                   add  sp, 2
  2760 000010FD E92900                   jmp .retnpexpr
  2761                                  .pexpr127:
  2762                                  
  2763                                  ;-305   exprstart(); if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);
  2764                                  
  2765                                  .pexpr125:
  2766 00001100 E83D01                   call exprstart
  2767 00001103 A1[2200]                 mov ax, [iscmp]
  2768 00001106 83F800                   cmp ax, 0
  2769 00001109 0F850900                 jne .pexpr128
  2770 0000110D 68[2C11]                 push pexpr_1
  2771 00001110 E83934                   call prs
  2772 00001113 83C402                   add  sp, 2
  2773                                  .pexpr128:
  2774 00001116 8D06AB81                 lea  ax, [fname]
  2775 0000111A 50                       push ax
  2776 0000111B E82E34                   call prs
  2777 0000111E 83C402                   add  sp, 2
  2778                                  
  2779                                  ;-306   expect(')'); }           /*error1("Vergleich fehlt");*/
  2780                                  
  2781 00001121 6A29                     push 41
  2782 00001123 E81333                   call expect
  2783 00001126 83C402                   add  sp, 2
  2784                                  
  2785                                  ;-307 
  2786                                  
  2787                                  
  2788                                  ;-308 int constantexpr() { int mode; int id1;int ids;
  2789                                  
  2790                                   .retnpexpr:
  2791 00001129 C3                       ret
  2792 0000112A 5F00                    pexpr_0 db "_",0
  2793 0000112C 5C6E206F722020616C-     pexpr_1 db "\n or  al, al\n je .",0
  2794 00001135 2C20616C5C6E206A65-
  2795 0000113E 202E00             
  2796                                  ; ENDP
  2797                                  
  2798                                  constantexpr:  ; *** PROC ***
  2799                                  
  2800                                  ;-309   token=getlex();   mode=typeName();  
  2801                                  
  2802                                  ;Function : constantexpr, Number of local variables: 3
  2803                                  ;   # type sign width addr used name   list of local variables
  2804                                  ;  200 var sign word   308 NULL mode = bp-2
  2805                                  ;  201 var sign word   308 NULL id1 = bp-4
  2806                                  ;  202 var sign word   308 NULL ids = bp-6;
  2807 00001141 C8060000                 ENTER  6,0
  2808 00001145 E8AB2B                   call getlex
  2809 00001148 A3[1C00]                 mov word [token], ax
  2810 0000114B E83FF9                   call typeName
  2811 0000114E 8946FE                   mov [bp-2], ax
  2812                                  
  2813                                  ;-310   id1=searchname(); gettypes(id1); ids=signi;
  2814                                  
  2815 00001151 E86AF8                   call searchname
  2816 00001154 8946FC                   mov [bp-4], ax
  2817 00001157 FF76FC                   push word [bp-4]
  2818 0000115A E823F7                   call gettypes
  2819 0000115D 83C402                   add  sp, 2
  2820 00001160 A1[3300]                 mov ax, [signi]
  2821 00001163 8946FA                   mov [bp-6], ax
  2822                                  
  2823                                  ;-311   if (isrelational() ==0) error1("Relational expression expected");
  2824                                  
  2825 00001166 E8232B                   call isrelational
  2826 00001169 83F800                   cmp ax, 0
  2827 0000116C 0F850900                 jne .constantexpr129
  2828 00001170 68[F611]                 push constantexpr_0
  2829 00001173 E8C136                   call error1
  2830 00001176 83C402                   add  sp, 2
  2831                                  
  2832                                  ;-312   expect(T_CONST);  prs(" ; constant expression");
  2833                                  
  2834                                  .constantexpr129:
  2835 00001179 680101                   push 257
  2836 0000117C E8BA32                   call expect
  2837 0000117F 83C402                   add  sp, 2
  2838 00001182 68[1512]                 push constantexpr_1
  2839 00001185 E8C433                   call prs
  2840 00001188 83C402                   add  sp, 2
  2841                                  
  2842                                  ;-313   prs("\ncmp "); 
  2843                                  
  2844 0000118B 68[2C12]                 push constantexpr_2
  2845 0000118E E8BB33                   call prs
  2846 00001191 83C402                   add  sp, 2
  2847                                  
  2848                                  ;-314   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  2849                                  
  2850 00001194 FF76FC                   push word [bp-4]
  2851 00001197 E8E6F6                   call gettypes
  2852 0000119A 83C402                   add  sp, 2
  2853 0000119D A1[3900]                 mov ax, [wi]
  2854 000011A0 83F802                   cmp ax, 2
  2855 000011A3 0F850C00                 jne .constantexpr130
  2856 000011A7 68[3312]                 push constantexpr_3
  2857 000011AA E89F33                   call prs
  2858 000011AD 83C402                   add  sp, 2
  2859 000011B0 E90900                   jmp .constantexpr131
  2860                                  .constantexpr130:
  2861 000011B3 68[3812]                 push constantexpr_4
  2862 000011B6 E89333                   call prs
  2863 000011B9 83C402                   add  sp, 2
  2864                                  
  2865                                  ;-315   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);
  2866                                  
  2867                                  .constantexpr131:
  2868 000011BC FF76FC                   push word [bp-4]
  2869 000011BF E810F2                   call v
  2870 000011C2 83C402                   add  sp, 2
  2871 000011C5 68[3D12]                 push constantexpr_5
  2872 000011C8 E88133                   call prs
  2873 000011CB 83C402                   add  sp, 2
  2874 000011CE FF36[2E00]               push word [lexval]
  2875 000011D2 E8D134                   call prunsign1
  2876 000011D5 83C402                   add  sp, 2
  2877 000011D8 FF76FA                   push word [bp-6]
  2878 000011DB E8F027                   call cmpneg
  2879 000011DE 83C402                   add  sp, 2
  2880 000011E1 8D06AB81                 lea  ax, [fname]
  2881 000011E5 50                       push ax
  2882 000011E6 E86333                   call prs
  2883 000011E9 83C402                   add  sp, 2
  2884                                  
  2885                                  ;-316   expect(')');
  2886                                  
  2887 000011EC 6A29                     push 41
  2888 000011EE E84832                   call expect
  2889 000011F1 83C402                   add  sp, 2
  2890                                  
  2891                                  ;-317 }  
  2892                                  
  2893                                  
  2894                                  ;-318 int exprstart() { if (eqstr(symbol, "_")) expr2(0); else expr(0); }
  2895 000011F4 C9                       LEAVE
  2896 000011F5 C3                       ret
  2897 000011F6 52656C6174696F6E61-     constantexpr_0 db "Relational expression expected",0
  2898 000011FF 6C2065787072657373-
  2899 00001208 696F6E206578706563-
  2900 00001211 74656400           
  2901 00001215 203B20636F6E737461-     constantexpr_1 db " ; constant expression",0
  2902 0000121E 6E7420657870726573-
  2903 00001227 73696F6E00         
  2904 0000122C 5C6E636D702000          constantexpr_2 db "\ncmp ",0
  2905 00001233 776F726400              constantexpr_3 db "word",0
  2906 00001238 6279746500              constantexpr_4 db "byte",0
  2907 0000123D 2C2000                  constantexpr_5 db ", ",0
  2908                                  ; ENDP
  2909                                  
  2910                                  exprstart:  ; *** PROC ***
  2911 00001240 68[6812]                 push exprstart_0
  2912 00001243 8D062B81                 lea  ax, [symbol]
  2913 00001247 50                       push ax
  2914 00001248 E84BEF                   call eqstr
  2915 0000124B 83C404                   add  sp, 4
  2916 0000124E 08C0                     or  al, al
  2917 00001250 0F840B00                 je .exprstart132
  2918 00001254 6A00                     push 0
  2919 00001256 E81100                   call expr2
  2920 00001259 83C402                   add  sp, 2
  2921 0000125C E90800                   jmp .exprstart133
  2922                                  .exprstart132:
  2923 0000125F 6A00                     push 0
  2924 00001261 E89E0A                   call expr
  2925 00001264 83C402                   add  sp, 2
  2926                                  .exprstart133:
  2927                                  
  2928                                  ;-319 
  2929                                  
  2930                                  
  2931                                  ;-320 int expr2(int kind) {  int i;
  2932                                  
  2933 00001267 C3                       ret
  2934 00001268 5F00                    exprstart_0 db "_",0
  2935                                  ; ENDP
  2936                                  
  2937                                  expr2:  ; *** PROC ***
  2938                                  
  2939                                  ;-321   if(kind != 1) token=getlex();
  2940                                  
  2941                                  ;Function : expr2, Number of local variables: 2
  2942                                  ;   # type sign width addr used name   list of local variables
  2943                                  ;  200 var sign word   320 NULL kind = bp+4
  2944                                  ;  201 var sign word   320 NULL i = bp-2;
  2945 0000126A C8020000                 ENTER  2,0
  2946 0000126E 8B4604                   mov ax, [bp+4]
  2947 00001271 83F801                   cmp ax, 1
  2948 00001274 0F840600                 je  .expr2134
  2949 00001278 E8782A                   call getlex
  2950 0000127B A3[1C00]                 mov word [token], ax
  2951                                  
  2952                                  ;-322   mod1=typeName();
  2953                                  
  2954                                  .expr2134:
  2955 0000127E E80CF8                   call typeName
  2956 00001281 A3[9810]                 mov word [mod1], ax
  2957                                  
  2958                                  ;-323   if (mod1) error1("Noch kein & und * im Text (Linke Hand) erlaubt");
  2959                                  
  2960 00001284 A1[9810]                 mov ax, [mod1]
  2961 00001287 08C0                     or  al, al
  2962 00001289 0F840900                 je .expr2135
  2963 0000128D 68[2215]                 push expr2_0
  2964 00001290 E8A435                   call error1
  2965 00001293 83C402                   add  sp, 2
  2966                                  
  2967                                  ;-324   ireg1=checkreg();
  2968                                  
  2969                                  .expr2135:
  2970 00001296 E8EA05                   call checkreg
  2971 00001299 A3[9A10]                 mov word [ireg1], ax
  2972                                  
  2973                                  ;-325   if (ireg1) { doreg1(0); return; }
  2974                                  
  2975 0000129C A1[9A10]                 mov ax, [ireg1]
  2976 0000129F 08C0                     or  al, al
  2977 000012A1 0F840B00                 je .expr2136
  2978 000012A5 6A00                     push 0
  2979 000012A7 E8ED03                   call doreg1
  2980 000012AA 83C402                   add  sp, 2
  2981 000012AD E97002                   jmp .retnexpr2
  2982                                  
  2983                                  ;-326   if (ireg1 == 0) { idx1=searchname();
  2984                                  
  2985                                  .expr2136:
  2986 000012B0 A1[9A10]                 mov ax, [ireg1]
  2987 000012B3 83F800                   cmp ax, 0
  2988 000012B6 0F853400                 jne .expr2137
  2989 000012BA E801F7                   call searchname
  2990 000012BD A3[9C10]                 mov word [idx1], ax
  2991                                  
  2992                                  ;-327     gettypes(idx1); ids1=signi; idw1=wi; idt1=typei;
  2993                                  
  2994 000012C0 FF36[9C10]               push word [idx1]
  2995 000012C4 E8B9F5                   call gettypes
  2996 000012C7 83C402                   add  sp, 2
  2997 000012CA A1[3300]                 mov ax, [signi]
  2998 000012CD A3[9E10]                 mov word [ids1], ax
  2999 000012D0 A1[3900]                 mov ax, [wi]
  3000 000012D3 A3[A010]                 mov word [idw1], ax
  3001 000012D6 A1[3000]                 mov ax, [typei]
  3002 000012D9 A3[A210]                 mov word [idt1], ax
  3003                                  
  3004                                  ;-328     if (idt1)  error1("Noch kein Array oder Pointer links erlaubt");  }
  3005                                  
  3006 000012DC A1[A210]                 mov ax, [idt1]
  3007 000012DF 08C0                     or  al, al
  3008 000012E1 0F840900                 je .expr2138
  3009 000012E5 68[5115]                 push expr2_1
  3010 000012E8 E84C35                   call error1
  3011 000012EB 83C402                   add  sp, 2
  3012                                  .expr2138:
  3013                                  
  3014                                  ;-329   
  3015                                  
  3016                                  
  3017                                  ;-330   if (isrelational()) { error1("Vergleich noch nicht implementiert");
  3018                                  
  3019                                  .expr2137:
  3020 000012EE E89B29                   call isrelational
  3021 000012F1 08C0                     or  al, al
  3022 000012F3 0F840900                 je .expr2139
  3023 000012F7 68[7C15]                 push expr2_2
  3024 000012FA E83A35                   call error1
  3025 000012FD 83C402                   add  sp, 2
  3026                                  
  3027                                  ;-331   }
  3028                                  
  3029                                  
  3030                                  ;-332   if (istoken('=') == 0) error1("Assign expected");
  3031                                  
  3032                                  .expr2139:
  3033 00001300 6A3D                     push 61
  3034 00001302 E81231                   call istoken
  3035 00001305 83C402                   add  sp, 2
  3036 00001308 83F800                   cmp ax, 0
  3037 0000130B 0F850900                 jne .expr2140
  3038 0000130F 68[9F15]                 push expr2_3
  3039 00001312 E82235                   call error1
  3040 00001315 83C402                   add  sp, 2
  3041                                  
  3042                                  ;-333   if (istoken(T_CONST) ) { val2=lexval; prs(" ; constant expression");
  3043                                  
  3044                                  .expr2140:
  3045 00001318 680101                   push 257
  3046 0000131B E8F930                   call istoken
  3047 0000131E 83C402                   add  sp, 2
  3048 00001321 08C0                     or  al, al
  3049 00001323 0F849A00                 je .expr2141
  3050 00001327 A1[2E00]                 mov ax, [lexval]
  3051 0000132A A3[B210]                 mov word [val2], ax
  3052 0000132D 68[AF15]                 push expr2_4
  3053 00001330 E81932                   call prs
  3054 00001333 83C402                   add  sp, 2
  3055                                  
  3056                                  ;-334     prs("\nmov ");
  3057                                  
  3058 00001336 68[C615]                 push expr2_5
  3059 00001339 E81032                   call prs
  3060 0000133C 83C402                   add  sp, 2
  3061                                  
  3062                                  ;-335     if (idw1 == 1) prs("byte ");
  3063                                  
  3064 0000133F A1[A010]                 mov ax, [idw1]
  3065 00001342 83F801                   cmp ax, 1
  3066 00001345 0F850900                 jne .expr2142
  3067 00001349 68[CD15]                 push expr2_6
  3068 0000134C E8FD31                   call prs
  3069 0000134F 83C402                   add  sp, 2
  3070                                  
  3071                                  ;-336     if (idw1 == 2) prs("word ");
  3072                                  
  3073                                  .expr2142:
  3074 00001352 A1[A010]                 mov ax, [idw1]
  3075 00001355 83F802                   cmp ax, 2
  3076 00001358 0F850900                 jne .expr2143
  3077 0000135C 68[D315]                 push expr2_7
  3078 0000135F E8EA31                   call prs
  3079 00001362 83C402                   add  sp, 2
  3080                                  
  3081                                  ;-337     if (idw1 == 4) prs("dword ");
  3082                                  
  3083                                  .expr2143:
  3084 00001365 A1[A010]                 mov ax, [idw1]
  3085 00001368 83F804                   cmp ax, 4
  3086 0000136B 0F850900                 jne .expr2144
  3087 0000136F 68[D915]                 push expr2_8
  3088 00001372 E8D731                   call prs
  3089 00001375 83C402                   add  sp, 2
  3090                                  
  3091                                  ;-338     v(idx1);
  3092                                  
  3093                                  .expr2144:
  3094 00001378 FF36[9C10]               push word [idx1]
  3095 0000137C E853F0                   call v
  3096 0000137F 83C402                   add  sp, 2
  3097                                  
  3098                                  ;-339     prs(", "); prunsign1(val2);
  3099                                  
  3100 00001382 68[E015]                 push expr2_9
  3101 00001385 E8C431                   call prs
  3102 00001388 83C402                   add  sp, 2
  3103 0000138B FF36[B210]               push word [val2]
  3104 0000138F E81433                   call prunsign1
  3105 00001392 83C402                   add  sp, 2
  3106                                  
  3107                                  ;-340     if (idx1 >= LSTART) { i=adrofname(idx1);  prs("; "); prs(i); } return; }
  3108                                  
  3109 00001395 A1[9C10]                 mov ax, [idx1]
  3110 00001398 3DC800                   cmp ax, 200 ;unsigned : 1
  3111 0000139B 0F8C1F00                 jl  .expr2145
  3112 0000139F FF36[9C10]               push word [idx1]
  3113 000013A3 E891F5                   call adrofname
  3114 000013A6 83C402                   add  sp, 2
  3115 000013A9 8946FE                   mov [bp-2], ax
  3116 000013AC 68[E315]                 push expr2_10
  3117 000013AF E89A31                   call prs
  3118 000013B2 83C402                   add  sp, 2
  3119 000013B5 FF76FE                   push word [bp-2]
  3120 000013B8 E89131                   call prs
  3121 000013BB 83C402                   add  sp, 2
  3122                                  .expr2145:
  3123 000013BE E95F01                   jmp .retnexpr2
  3124                                  
  3125                                  ;-341   
  3126                                  
  3127                                  
  3128                                  ;-342   mod1=typeName(); ireg2=checkreg();
  3129                                  
  3130                                  .expr2141:
  3131 000013C1 E8C9F6                   call typeName
  3132 000013C4 A3[9810]                 mov word [mod1], ax
  3133 000013C7 E8B904                   call checkreg
  3134 000013CA A3[A810]                 mov word [ireg2], ax
  3135                                  
  3136                                  ;-343   if (ireg2) { prs("\nmov ");
  3137                                  
  3138 000013CD A1[A810]                 mov ax, [ireg2]
  3139 000013D0 08C0                     or  al, al
  3140 000013D2 0F844200                 je .expr2146
  3141 000013D6 68[E615]                 push expr2_11
  3142 000013D9 E87031                   call prs
  3143 000013DC 83C402                   add  sp, 2
  3144                                  
  3145                                  ;-344     if (ireg1) printreg(ireg1); else v(idx1); prs(", "); printreg(ireg2);return;}
  3146                                  
  3147 000013DF A1[9A10]                 mov ax, [ireg1]
  3148 000013E2 08C0                     or  al, al
  3149 000013E4 0F840D00                 je .expr2147
  3150 000013E8 FF36[9A10]               push word [ireg1]
  3151 000013EC E8A208                   call printreg
  3152 000013EF 83C402                   add  sp, 2
  3153 000013F2 E90A00                   jmp .expr2148
  3154                                  .expr2147:
  3155 000013F5 FF36[9C10]               push word [idx1]
  3156 000013F9 E8D6EF                   call v
  3157 000013FC 83C402                   add  sp, 2
  3158                                  .expr2148:
  3159 000013FF 68[ED15]                 push expr2_12
  3160 00001402 E84731                   call prs
  3161 00001405 83C402                   add  sp, 2
  3162 00001408 FF36[A810]               push word [ireg2]
  3163 0000140C E88208                   call printreg
  3164 0000140F 83C402                   add  sp, 2
  3165 00001412 E90B01                   jmp .retnexpr2
  3166                                  
  3167                                  ;-345   else {
  3168                                  
  3169 00001415 E9FF00                   jmp .expr2149
  3170                                  .expr2146:
  3171                                  
  3172                                  ;-346     if (mod1 == 1) error1("Noch kein * im Text erlaubt");
  3173                                  
  3174 00001418 A1[9810]                 mov ax, [mod1]
  3175 0000141B 83F801                   cmp ax, 1
  3176 0000141E 0F850900                 jne .expr2150
  3177 00001422 68[F015]                 push expr2_13
  3178 00001425 E80F34                   call error1
  3179 00001428 83C402                   add  sp, 2
  3180                                  
  3181                                  ;-347     
  3182                                  
  3183                                  
  3184                                  ;-348     idx2=searchname();
  3185                                  
  3186                                  .expr2150:
  3187 0000142B E890F5                   call searchname
  3188 0000142E A3[AA10]                 mov word [idx2], ax
  3189                                  
  3190                                  ;-349     gettypes(idx2); ids2=signi; idw2=wi; idt2=typei;
  3191                                  
  3192 00001431 FF36[AA10]               push word [idx2]
  3193 00001435 E848F4                   call gettypes
  3194 00001438 83C402                   add  sp, 2
  3195 0000143B A1[3300]                 mov ax, [signi]
  3196 0000143E A3[AC10]                 mov word [ids2], ax
  3197 00001441 A1[3900]                 mov ax, [wi]
  3198 00001444 A3[AE10]                 mov word [idw2], ax
  3199 00001447 A1[3000]                 mov ax, [typei]
  3200 0000144A A3[B010]                 mov word [idt2], ax
  3201                                  
  3202                                  ;-350     if (idt2 == 1)  error1("Noch kein Array rechts erlaubt");
  3203                                  
  3204 0000144D A1[B010]                 mov ax, [idt2]
  3205 00001450 83F801                   cmp ax, 1
  3206 00001453 0F850900                 jne .expr2151
  3207 00001457 68[0C16]                 push expr2_14
  3208 0000145A E8DA33                   call error1
  3209 0000145D 83C402                   add  sp, 2
  3210                                  
  3211                                  ;-351     prs("\nmov ");
  3212                                  
  3213                                  .expr2151:
  3214 00001460 68[2B16]                 push expr2_15
  3215 00001463 E8E630                   call prs
  3216 00001466 83C402                   add  sp, 2
  3217                                  
  3218                                  ;-352     if (ireg1) printreg(ireg1); else error1("Mem to Mem not allowed by x86-CPU");
  3219                                  
  3220 00001469 A1[9A10]                 mov ax, [ireg1]
  3221 0000146C 08C0                     or  al, al
  3222 0000146E 0F840D00                 je .expr2152
  3223 00001472 FF36[9A10]               push word [ireg1]
  3224 00001476 E81808                   call printreg
  3225 00001479 83C402                   add  sp, 2
  3226 0000147C E90900                   jmp .expr2153
  3227                                  .expr2152:
  3228 0000147F 68[3216]                 push expr2_16
  3229 00001482 E8B233                   call error1
  3230 00001485 83C402                   add  sp, 2
  3231                                  
  3232                                  ;-353     prs(", ");
  3233                                  
  3234                                  .expr2153:
  3235 00001488 68[5416]                 push expr2_17
  3236 0000148B E8BE30                   call prs
  3237 0000148E 83C402                   add  sp, 2
  3238                                  
  3239                                  ;-354     if (mod1 == 2) a(idx2);
  3240                                  
  3241 00001491 A1[9810]                 mov ax, [mod1]
  3242 00001494 83F802                   cmp ax, 2
  3243 00001497 0F850D00                 jne .expr2154
  3244 0000149B FF36[AA10]               push word [idx2]
  3245 0000149F E821EF                   call a
  3246 000014A2 83C402                   add  sp, 2
  3247                                  
  3248                                  ;-355     else {
  3249                                  
  3250 000014A5 E96C00                   jmp .expr2155
  3251                                  .expr2154:
  3252                                  
  3253                                  ;-356       if (idw2 == 1) prs("byte ");
  3254                                  
  3255 000014A8 A1[AE10]                 mov ax, [idw2]
  3256 000014AB 83F801                   cmp ax, 1
  3257 000014AE 0F850900                 jne .expr2156
  3258 000014B2 68[5716]                 push expr2_18
  3259 000014B5 E89430                   call prs
  3260 000014B8 83C402                   add  sp, 2
  3261                                  
  3262                                  ;-357       if (idw2 == 2) prs("word ");
  3263                                  
  3264                                  .expr2156:
  3265 000014BB A1[AE10]                 mov ax, [idw2]
  3266 000014BE 83F802                   cmp ax, 2
  3267 000014C1 0F850900                 jne .expr2157
  3268 000014C5 68[5D16]                 push expr2_19
  3269 000014C8 E88130                   call prs
  3270 000014CB 83C402                   add  sp, 2
  3271                                  
  3272                                  ;-358       if (idw2 == 4) prs("dword ");
  3273                                  
  3274                                  .expr2157:
  3275 000014CE A1[AE10]                 mov ax, [idw2]
  3276 000014D1 83F804                   cmp ax, 4
  3277 000014D4 0F850900                 jne .expr2158
  3278 000014D8 68[6316]                 push expr2_20
  3279 000014DB E86E30                   call prs
  3280 000014DE 83C402                   add  sp, 2
  3281                                  
  3282                                  ;-359       v(idx2);
  3283                                  
  3284                                  .expr2158:
  3285 000014E1 FF36[AA10]               push word [idx2]
  3286 000014E5 E8EAEE                   call v
  3287 000014E8 83C402                   add  sp, 2
  3288                                  
  3289                                  ;-360       if (idx2 >= LSTART) { i=adrofname(idx2);  prs("; "); prs(i); }  }
  3290                                  
  3291 000014EB A1[AA10]                 mov ax, [idx2]
  3292 000014EE 3DC800                   cmp ax, 200 ;unsigned : 1
  3293 000014F1 0F8C1F00                 jl  .expr2159
  3294 000014F5 FF36[AA10]               push word [idx2]
  3295 000014F9 E83BF4                   call adrofname
  3296 000014FC 83C402                   add  sp, 2
  3297 000014FF 8946FE                   mov [bp-2], ax
  3298 00001502 68[6A16]                 push expr2_21
  3299 00001505 E84430                   call prs
  3300 00001508 83C402                   add  sp, 2
  3301 0000150B FF76FE                   push word [bp-2]
  3302 0000150E E83B30                   call prs
  3303 00001511 83C402                   add  sp, 2
  3304                                  .expr2159:
  3305                                  
  3306                                  ;-361     return;
  3307                                  
  3308                                  .expr2155:
  3309 00001514 E90900                   jmp .retnexpr2
  3310                                  
  3311                                  ;-362   } error1("Internal error: only const or reg allowed");
  3312                                  
  3313                                  .expr2149:
  3314 00001517 68[6D16]                 push expr2_22
  3315 0000151A E81A33                   call error1
  3316 0000151D 83C402                   add  sp, 2
  3317                                  
  3318                                  ;-363 }
  3319                                  
  3320                                  
  3321                                  ;-364 char ops[5];
  3322                                  
  3323 00001520 C9                       .retnexpr2: LEAVE
  3324 00001521 C3                       ret
  3325 00001522 4E6F6368206B65696E-     expr2_0 db "Noch kein & und * im Text (Linke Hand) erlaubt",0
  3326 0000152B 202620756E64202A20-
  3327 00001534 696D20546578742028-
  3328 0000153D 4C696E6B652048616E-
  3329 00001546 64292065726C617562-
  3330 0000154F 7400               
  3331 00001551 4E6F6368206B65696E-     expr2_1 db "Noch kein Array oder Pointer links erlaubt",0
  3332 0000155A 204172726179206F64-
  3333 00001563 657220506F696E7465-
  3334 0000156C 72206C696E6B732065-
  3335 00001575 726C6175627400     
  3336 0000157C 566572676C65696368-     expr2_2 db "Vergleich noch nicht implementiert",0
  3337 00001585 206E6F6368206E6963-
  3338 0000158E 687420696D706C656D-
  3339 00001597 656E746965727400   
  3340 0000159F 41737369676E206578-     expr2_3 db "Assign expected",0
  3341 000015A8 70656374656400     
  3342 000015AF 203B20636F6E737461-     expr2_4 db " ; constant expression",0
  3343 000015B8 6E7420657870726573-
  3344 000015C1 73696F6E00         
  3345 000015C6 5C6E6D6F762000          expr2_5 db "\nmov ",0
  3346 000015CD 627974652000            expr2_6 db "byte ",0
  3347 000015D3 776F72642000            expr2_7 db "word ",0
  3348 000015D9 64776F72642000          expr2_8 db "dword ",0
  3349 000015E0 2C2000                  expr2_9 db ", ",0
  3350 000015E3 3B2000                  expr2_10 db "; ",0
  3351 000015E6 5C6E6D6F762000          expr2_11 db "\nmov ",0
  3352 000015ED 2C2000                  expr2_12 db ", ",0
  3353 000015F0 4E6F6368206B65696E-     expr2_13 db "Noch kein * im Text erlaubt",0
  3354 000015F9 202A20696D20546578-
  3355 00001602 742065726C61756274-
  3356 0000160B 00                 
  3357 0000160C 4E6F6368206B65696E-     expr2_14 db "Noch kein Array rechts erlaubt",0
  3358 00001615 204172726179207265-
  3359 0000161E 636874732065726C61-
  3360 00001627 75627400           
  3361 0000162B 5C6E6D6F762000          expr2_15 db "\nmov ",0
  3362 00001632 4D656D20746F204D65-     expr2_16 db "Mem to Mem not allowed by x86-CPU",0
  3363 0000163B 6D206E6F7420616C6C-
  3364 00001644 6F7765642062792078-
  3365 0000164D 38362D43505500     
  3366 00001654 2C2000                  expr2_17 db ", ",0
  3367 00001657 627974652000            expr2_18 db "byte ",0
  3368 0000165D 776F72642000            expr2_19 db "word ",0
  3369 00001663 64776F72642000          expr2_20 db "dword ",0
  3370 0000166A 3B2000                  expr2_21 db "; ",0
  3371 0000166D 496E7465726E616C20-     expr2_22 db "Internal error: only const or reg allowed",0
  3372 00001676 6572726F723A206F6E-
  3373 0000167F 6C7920636F6E737420-
  3374 00001688 6F722072656720616C-
  3375 00001691 6C6F77656400       
  3376                                  ; ENDP
  3377                                  section .bss
  3378                                  absolute 53406
  3379 0000D09E <res 00000005>          ops resb 5
  3380                                  section .text
  3381                                  
  3382                                  ;-365 int doreg1(int iscmp1) { int i;
  3383                                  
  3384                                  
  3385                                  doreg1:  ; *** PROC ***
  3386                                  
  3387                                  ;-366   if (istoken('='))          strcpy(ops, "mov");
  3388                                  
  3389                                  ;Function : doreg1, Number of local variables: 2
  3390                                  ;   # type sign width addr used name   list of local variables
  3391                                  ;  200 var sign word   365 NULL iscmp1 = bp+4
  3392                                  ;  201 var sign word   365 NULL i = bp-2;
  3393 00001697 C8020000                 ENTER  2,0
  3394 0000169B 6A3D                     push 61
  3395 0000169D E8772D                   call istoken
  3396 000016A0 83C402                   add  sp, 2
  3397 000016A3 08C0                     or  al, al
  3398 000016A5 0F840E00                 je .doreg1160
  3399 000016A9 68[4A18]                 push doreg1_0
  3400 000016AC 8D069ED0                 lea  ax, [ops]
  3401 000016B0 50                       push ax
  3402 000016B1 E8B2EA                   call strcpy
  3403 000016B4 83C404                   add  sp, 4
  3404                                  
  3405                                  ;-367   if (istoken(T_PLUSASS))    strcpy(ops, "add");
  3406                                  
  3407                                  .doreg1160:
  3408 000016B7 68CE04                   push 1230
  3409 000016BA E85A2D                   call istoken
  3410 000016BD 83C402                   add  sp, 2
  3411 000016C0 08C0                     or  al, al
  3412 000016C2 0F840E00                 je .doreg1161
  3413 000016C6 68[4E18]                 push doreg1_1
  3414 000016C9 8D069ED0                 lea  ax, [ops]
  3415 000016CD 50                       push ax
  3416 000016CE E895EA                   call strcpy
  3417 000016D1 83C404                   add  sp, 4
  3418                                  
  3419                                  ;-368   if (istoken(T_MINUSASS))   strcpy(ops, "sub");
  3420                                  
  3421                                  .doreg1161:
  3422 000016D4 68CF04                   push 1231
  3423 000016D7 E83D2D                   call istoken
  3424 000016DA 83C402                   add  sp, 2
  3425 000016DD 08C0                     or  al, al
  3426 000016DF 0F840E00                 je .doreg1162
  3427 000016E3 68[5218]                 push doreg1_2
  3428 000016E6 8D069ED0                 lea  ax, [ops]
  3429 000016EA 50                       push ax
  3430 000016EB E878EA                   call strcpy
  3431 000016EE 83C404                   add  sp, 4
  3432                                  
  3433                                  ;-369   if (istoken(T_ANDASS))     strcpy(ops, "and");
  3434                                  
  3435                                  .doreg1162:
  3436 000016F1 68D204                   push 1234
  3437 000016F4 E8202D                   call istoken
  3438 000016F7 83C402                   add  sp, 2
  3439 000016FA 08C0                     or  al, al
  3440 000016FC 0F840E00                 je .doreg1163
  3441 00001700 68[5618]                 push doreg1_3
  3442 00001703 8D069ED0                 lea  ax, [ops]
  3443 00001707 50                       push ax
  3444 00001708 E85BEA                   call strcpy
  3445 0000170B 83C404                   add  sp, 4
  3446                                  
  3447                                  ;-370   if (istoken(T_ORASS))      strcpy(ops, "or" );
  3448                                  
  3449                                  .doreg1163:
  3450 0000170E 68D304                   push 1235
  3451 00001711 E8032D                   call istoken
  3452 00001714 83C402                   add  sp, 2
  3453 00001717 08C0                     or  al, al
  3454 00001719 0F840E00                 je .doreg1164
  3455 0000171D 68[5A18]                 push doreg1_4
  3456 00001720 8D069ED0                 lea  ax, [ops]
  3457 00001724 50                       push ax
  3458 00001725 E83EEA                   call strcpy
  3459 00001728 83C404                   add  sp, 4
  3460                                  
  3461                                  ;-371   if (istoken(T_LESSLESS))   strcpy(ops, "shl");
  3462                                  
  3463                                  .doreg1164:
  3464 0000172B 68D804                   push 1240
  3465 0000172E E8E62C                   call istoken
  3466 00001731 83C402                   add  sp, 2
  3467 00001734 08C0                     or  al, al
  3468 00001736 0F840E00                 je .doreg1165
  3469 0000173A 68[5D18]                 push doreg1_5
  3470 0000173D 8D069ED0                 lea  ax, [ops]
  3471 00001741 50                       push ax
  3472 00001742 E821EA                   call strcpy
  3473 00001745 83C404                   add  sp, 4
  3474                                  
  3475                                  ;-372   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");
  3476                                  
  3477                                  .doreg1165:
  3478 00001748 68D904                   push 1241
  3479 0000174B E8C92C                   call istoken
  3480 0000174E 83C402                   add  sp, 2
  3481 00001751 08C0                     or  al, al
  3482 00001753 0F840E00                 je .doreg1166
  3483 00001757 68[6118]                 push doreg1_6
  3484 0000175A 8D069ED0                 lea  ax, [ops]
  3485 0000175E 50                       push ax
  3486 0000175F E804EA                   call strcpy
  3487 00001762 83C404                   add  sp, 4
  3488                                  
  3489                                  ;-373   if (iscmp1 == 1) { token=getlex();
  3490                                  
  3491                                  .doreg1166:
  3492 00001765 8B4604                   mov ax, [bp+4]
  3493 00001768 83F801                   cmp ax, 1
  3494 0000176B 0F852700                 jne .doreg1167
  3495 0000176F E88125                   call getlex
  3496 00001772 A3[1C00]                 mov word [token], ax
  3497                                  
  3498                                  ;-374       if (isrelational() ==0) error1("Relational expected");
  3499                                  
  3500 00001775 E81425                   call isrelational
  3501 00001778 83F800                   cmp ax, 0
  3502 0000177B 0F850900                 jne .doreg1168
  3503 0000177F 68[6518]                 push doreg1_7
  3504 00001782 E8B230                   call error1
  3505 00001785 83C402                   add  sp, 2
  3506                                  
  3507                                  ;-375       strcpy(ops, "cmp"); }
  3508                                  
  3509                                  .doreg1168:
  3510 00001788 68[7918]                 push doreg1_8
  3511 0000178B 8D069ED0                 lea  ax, [ops]
  3512 0000178F 50                       push ax
  3513 00001790 E8D3E9                   call strcpy
  3514 00001793 83C404                   add  sp, 4
  3515                                  
  3516                                  ;-376   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");
  3517                                  
  3518                                  .doreg1167:
  3519 00001796 E8A52D                   call prnl
  3520 00001799 8D069ED0                 lea  ax, [ops]
  3521 0000179D 50                       push ax
  3522 0000179E E8AB2D                   call prs
  3523 000017A1 83C402                   add  sp, 2
  3524 000017A4 68[7D18]                 push doreg1_9
  3525 000017A7 E8A22D                   call prs
  3526 000017AA 83C402                   add  sp, 2
  3527 000017AD FF36[9A10]               push word [ireg1]
  3528 000017B1 E8DD04                   call printreg
  3529 000017B4 83C402                   add  sp, 2
  3530 000017B7 68[8018]                 push doreg1_10
  3531 000017BA E88F2D                   call prs
  3532 000017BD 83C402                   add  sp, 2
  3533                                  
  3534                                  ;-377 
  3535                                  
  3536                                  
  3537                                  ;-378   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}
  3538                                  
  3539 000017C0 680101                   push 257
  3540 000017C3 E8512C                   call istoken
  3541 000017C6 83C402                   add  sp, 2
  3542 000017C9 08C0                     or  al, al
  3543 000017CB 0F840D00                 je .doreg1169
  3544 000017CF FF36[2E00]               push word [lexval]
  3545 000017D3 E8D02E                   call prunsign1
  3546 000017D6 83C402                   add  sp, 2
  3547 000017D9 E94700                   jmp .reg1
  3548                                  
  3549                                  ;-379   mod2=typeName(); ireg2=checkreg();
  3550                                  
  3551                                  .doreg1169:
  3552 000017DC E8AEF2                   call typeName
  3553 000017DF A3[A610]                 mov word [mod2], ax
  3554 000017E2 E89E00                   call checkreg
  3555 000017E5 A3[A810]                 mov word [ireg2], ax
  3556                                  
  3557                                  ;-380   if (ireg2) {printreg(ireg2); goto reg1;}
  3558                                  
  3559 000017E8 A1[A810]                 mov ax, [ireg2]
  3560 000017EB 08C0                     or  al, al
  3561 000017ED 0F840D00                 je .doreg1170
  3562 000017F1 FF36[A810]               push word [ireg2]
  3563 000017F5 E89904                   call printreg
  3564 000017F8 83C402                   add  sp, 2
  3565 000017FB E92500                   jmp .reg1
  3566                                  
  3567                                  ;-381   i=searchname();  if (mod2 == 2) a(i); else v(i);
  3568                                  
  3569                                  .doreg1170:
  3570 000017FE E8BDF1                   call searchname
  3571 00001801 8946FE                   mov [bp-2], ax
  3572 00001804 A1[A610]                 mov ax, [mod2]
  3573 00001807 83F802                   cmp ax, 2
  3574 0000180A 0F850C00                 jne .doreg1171
  3575 0000180E FF76FE                   push word [bp-2]
  3576 00001811 E8AFEB                   call a
  3577 00001814 83C402                   add  sp, 2
  3578 00001817 E90900                   jmp .doreg1172
  3579                                  .doreg1171:
  3580 0000181A FF76FE                   push word [bp-2]
  3581 0000181D E8B2EB                   call v
  3582 00001820 83C402                   add  sp, 2
  3583                                  
  3584                                  ;-382   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }
  3585                                  
  3586                                  .doreg1172:
  3587                                  .reg1:
  3588 00001823 8B4604                   mov ax, [bp+4]
  3589 00001826 83F801                   cmp ax, 1
  3590 00001829 0F851B00                 jne .doreg1173
  3591 0000182D 6A00                     push 0
  3592 0000182F E89C21                   call cmpneg
  3593 00001832 83C402                   add  sp, 2
  3594 00001835 8D06AB81                 lea  ax, [fname]
  3595 00001839 50                       push ax
  3596 0000183A E80F2D                   call prs
  3597 0000183D 83C402                   add  sp, 2
  3598 00001840 6A29                     push 41
  3599 00001842 E8F42B                   call expect
  3600 00001845 83C402                   add  sp, 2
  3601                                  
  3602                                  ;-383 }
  3603                                  
  3604                                  .doreg1173:
  3605                                  
  3606                                  ;-384 int checkreg() { // >=17 = 16bit, >=47 = 32bit
  3607 00001848 C9                       LEAVE
  3608 00001849 C3                       ret
  3609 0000184A 6D6F7600                doreg1_0 db "mov",0
  3610 0000184E 61646400                doreg1_1 db "add",0
  3611 00001852 73756200                doreg1_2 db "sub",0
  3612 00001856 616E6400                doreg1_3 db "and",0
  3613 0000185A 6F7200                  doreg1_4 db "or",0
  3614 0000185D 73686C00                doreg1_5 db "shl",0
  3615 00001861 73687200                doreg1_6 db "shr",0
  3616 00001865 52656C6174696F6E61-     doreg1_7 db "Relational expected",0
  3617 0000186E 6C2065787065637465-
  3618 00001877 6400               
  3619 00001879 636D7000                doreg1_8 db "cmp",0
  3620 0000187D 202000                  doreg1_9 db "  ",0
  3621 00001880 2C2000                  doreg1_10 db ", ",0
  3622                                  ; ENDP
  3623                                  
  3624                                  checkreg:  ; *** PROC ***
  3625                                  
  3626                                  ;-385   if (strlen(symbol) <  2) return 0;
  3627                                  
  3628 00001883 8D062B81                 lea  ax, [symbol]
  3629 00001887 50                       push ax
  3630 00001888 E8B3E8                   call strlen
  3631 0000188B 83C402                   add  sp, 2
  3632 0000188E 83F802                   cmp ax, 2
  3633 00001891 0F8D0600                 jge .checkreg174
  3634 00001895 B80000                   mov ax, 0
  3635 00001898 E94403                   jmp .retncheckreg
  3636                                  
  3637                                  ;-386   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;
  3638                                  
  3639                                  .checkreg174:
  3640 0000189B 68[E01B]                 push checkreg_0
  3641 0000189E 8D062B81                 lea  ax, [symbol]
  3642 000018A2 50                       push ax
  3643 000018A3 E8F0E8                   call eqstr
  3644 000018A6 83C404                   add  sp, 4
  3645 000018A9 08C0                     or  al, al
  3646 000018AB 0F840600                 je .checkreg175
  3647 000018AF B80100                   mov ax, 1
  3648 000018B2 E92A03                   jmp .retncheckreg
  3649                                  .checkreg175:
  3650 000018B5 68[E31B]                 push checkreg_1
  3651 000018B8 8D062B81                 lea  ax, [symbol]
  3652 000018BC 50                       push ax
  3653 000018BD E8D6E8                   call eqstr
  3654 000018C0 83C404                   add  sp, 4
  3655 000018C3 08C0                     or  al, al
  3656 000018C5 0F840600                 je .checkreg176
  3657 000018C9 B80300                   mov ax, 3
  3658 000018CC E91003                   jmp .retncheckreg
  3659                                  
  3660                                  ;-387   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;
  3661                                  
  3662                                  .checkreg176:
  3663 000018CF 68[E61B]                 push checkreg_2
  3664 000018D2 8D062B81                 lea  ax, [symbol]
  3665 000018D6 50                       push ax
  3666 000018D7 E8BCE8                   call eqstr
  3667 000018DA 83C404                   add  sp, 4
  3668 000018DD 08C0                     or  al, al
  3669 000018DF 0F840600                 je .checkreg177
  3670 000018E3 B80500                   mov ax, 5
  3671 000018E6 E9F602                   jmp .retncheckreg
  3672                                  .checkreg177:
  3673 000018E9 68[E91B]                 push checkreg_3
  3674 000018EC 8D062B81                 lea  ax, [symbol]
  3675 000018F0 50                       push ax
  3676 000018F1 E8A2E8                   call eqstr
  3677 000018F4 83C404                   add  sp, 4
  3678 000018F7 08C0                     or  al, al
  3679 000018F9 0F840600                 je .checkreg178
  3680 000018FD B80700                   mov ax, 7
  3681 00001900 E9DC02                   jmp .retncheckreg
  3682                                  
  3683                                  ;-388   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;
  3684                                  
  3685                                  .checkreg178:
  3686 00001903 68[EC1B]                 push checkreg_4
  3687 00001906 8D062B81                 lea  ax, [symbol]
  3688 0000190A 50                       push ax
  3689 0000190B E888E8                   call eqstr
  3690 0000190E 83C404                   add  sp, 4
  3691 00001911 08C0                     or  al, al
  3692 00001913 0F840600                 je .checkreg179
  3693 00001917 B80900                   mov ax, 9
  3694 0000191A E9C202                   jmp .retncheckreg
  3695                                  .checkreg179:
  3696 0000191D 68[EF1B]                 push checkreg_5
  3697 00001920 8D062B81                 lea  ax, [symbol]
  3698 00001924 50                       push ax
  3699 00001925 E86EE8                   call eqstr
  3700 00001928 83C404                   add  sp, 4
  3701 0000192B 08C0                     or  al, al
  3702 0000192D 0F840600                 je .checkreg180
  3703 00001931 B80B00                   mov ax, 11
  3704 00001934 E9A802                   jmp .retncheckreg
  3705                                  
  3706                                  ;-389   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;
  3707                                  
  3708                                  .checkreg180:
  3709 00001937 68[F21B]                 push checkreg_6
  3710 0000193A 8D062B81                 lea  ax, [symbol]
  3711 0000193E 50                       push ax
  3712 0000193F E854E8                   call eqstr
  3713 00001942 83C404                   add  sp, 4
  3714 00001945 08C0                     or  al, al
  3715 00001947 0F840600                 je .checkreg181
  3716 0000194B B80D00                   mov ax, 13
  3717 0000194E E98E02                   jmp .retncheckreg
  3718                                  .checkreg181:
  3719 00001951 68[F51B]                 push checkreg_7
  3720 00001954 8D062B81                 lea  ax, [symbol]
  3721 00001958 50                       push ax
  3722 00001959 E83AE8                   call eqstr
  3723 0000195C 83C404                   add  sp, 4
  3724 0000195F 08C0                     or  al, al
  3725 00001961 0F840600                 je .checkreg182
  3726 00001965 B80F00                   mov ax, 15
  3727 00001968 E97402                   jmp .retncheckreg
  3728                                  
  3729                                  ;-390   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;
  3730                                  
  3731                                  .checkreg182:
  3732 0000196B 68[F81B]                 push checkreg_8
  3733 0000196E 8D062B81                 lea  ax, [symbol]
  3734 00001972 50                       push ax
  3735 00001973 E820E8                   call eqstr
  3736 00001976 83C404                   add  sp, 4
  3737 00001979 08C0                     or  al, al
  3738 0000197B 0F840600                 je .checkreg183
  3739 0000197F B81100                   mov ax, 17
  3740 00001982 E95A02                   jmp .retncheckreg
  3741                                  .checkreg183:
  3742 00001985 68[FB1B]                 push checkreg_9
  3743 00001988 8D062B81                 lea  ax, [symbol]
  3744 0000198C 50                       push ax
  3745 0000198D E806E8                   call eqstr
  3746 00001990 83C404                   add  sp, 4
  3747 00001993 08C0                     or  al, al
  3748 00001995 0F840600                 je .checkreg184
  3749 00001999 B81300                   mov ax, 19
  3750 0000199C E94002                   jmp .retncheckreg
  3751                                  
  3752                                  ;-391   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;
  3753                                  
  3754                                  .checkreg184:
  3755 0000199F 68[FE1B]                 push checkreg_10
  3756 000019A2 8D062B81                 lea  ax, [symbol]
  3757 000019A6 50                       push ax
  3758 000019A7 E8ECE7                   call eqstr
  3759 000019AA 83C404                   add  sp, 4
  3760 000019AD 08C0                     or  al, al
  3761 000019AF 0F840600                 je .checkreg185
  3762 000019B3 B81500                   mov ax, 21
  3763 000019B6 E92602                   jmp .retncheckreg
  3764                                  .checkreg185:
  3765 000019B9 68[011C]                 push checkreg_11
  3766 000019BC 8D062B81                 lea  ax, [symbol]
  3767 000019C0 50                       push ax
  3768 000019C1 E8D2E7                   call eqstr
  3769 000019C4 83C404                   add  sp, 4
  3770 000019C7 08C0                     or  al, al
  3771 000019C9 0F840600                 je .checkreg186
  3772 000019CD B81700                   mov ax, 23
  3773 000019D0 E90C02                   jmp .retncheckreg
  3774                                  
  3775                                  ;-392   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;
  3776                                  
  3777                                  .checkreg186:
  3778 000019D3 68[041C]                 push checkreg_12
  3779 000019D6 8D062B81                 lea  ax, [symbol]
  3780 000019DA 50                       push ax
  3781 000019DB E8B8E7                   call eqstr
  3782 000019DE 83C404                   add  sp, 4
  3783 000019E1 08C0                     or  al, al
  3784 000019E3 0F840600                 je .checkreg187
  3785 000019E7 B81900                   mov ax, 25
  3786 000019EA E9F201                   jmp .retncheckreg
  3787                                  .checkreg187:
  3788 000019ED 68[071C]                 push checkreg_13
  3789 000019F0 8D062B81                 lea  ax, [symbol]
  3790 000019F4 50                       push ax
  3791 000019F5 E89EE7                   call eqstr
  3792 000019F8 83C404                   add  sp, 4
  3793 000019FB 08C0                     or  al, al
  3794 000019FD 0F840600                 je .checkreg188
  3795 00001A01 B81B00                   mov ax, 27
  3796 00001A04 E9D801                   jmp .retncheckreg
  3797                                  
  3798                                  ;-393   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;
  3799                                  
  3800                                  .checkreg188:
  3801 00001A07 68[0A1C]                 push checkreg_14
  3802 00001A0A 8D062B81                 lea  ax, [symbol]
  3803 00001A0E 50                       push ax
  3804 00001A0F E884E7                   call eqstr
  3805 00001A12 83C404                   add  sp, 4
  3806 00001A15 08C0                     or  al, al
  3807 00001A17 0F840600                 je .checkreg189
  3808 00001A1B B81D00                   mov ax, 29
  3809 00001A1E E9BE01                   jmp .retncheckreg
  3810                                  .checkreg189:
  3811 00001A21 68[0D1C]                 push checkreg_15
  3812 00001A24 8D062B81                 lea  ax, [symbol]
  3813 00001A28 50                       push ax
  3814 00001A29 E86AE7                   call eqstr
  3815 00001A2C 83C404                   add  sp, 4
  3816 00001A2F 08C0                     or  al, al
  3817 00001A31 0F840600                 je .checkreg190
  3818 00001A35 B81F00                   mov ax, 31
  3819 00001A38 E9A401                   jmp .retncheckreg
  3820                                  
  3821                                  ;-394   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;
  3822                                  
  3823                                  .checkreg190:
  3824 00001A3B 68[101C]                 push checkreg_16
  3825 00001A3E 8D062B81                 lea  ax, [symbol]
  3826 00001A42 50                       push ax
  3827 00001A43 E850E7                   call eqstr
  3828 00001A46 83C404                   add  sp, 4
  3829 00001A49 08C0                     or  al, al
  3830 00001A4B 0F840600                 je .checkreg191
  3831 00001A4F B82100                   mov ax, 33
  3832 00001A52 E98A01                   jmp .retncheckreg
  3833                                  .checkreg191:
  3834 00001A55 68[131C]                 push checkreg_17
  3835 00001A58 8D062B81                 lea  ax, [symbol]
  3836 00001A5C 50                       push ax
  3837 00001A5D E836E7                   call eqstr
  3838 00001A60 83C404                   add  sp, 4
  3839 00001A63 08C0                     or  al, al
  3840 00001A65 0F840600                 je .checkreg192
  3841 00001A69 B82300                   mov ax, 35
  3842 00001A6C E97001                   jmp .retncheckreg
  3843                                  
  3844                                  ;-395   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;
  3845                                  
  3846                                  .checkreg192:
  3847 00001A6F 68[161C]                 push checkreg_18
  3848 00001A72 8D062B81                 lea  ax, [symbol]
  3849 00001A76 50                       push ax
  3850 00001A77 E81CE7                   call eqstr
  3851 00001A7A 83C404                   add  sp, 4
  3852 00001A7D 08C0                     or  al, al
  3853 00001A7F 0F840600                 je .checkreg193
  3854 00001A83 B82500                   mov ax, 37
  3855 00001A86 E95601                   jmp .retncheckreg
  3856                                  .checkreg193:
  3857 00001A89 68[191C]                 push checkreg_19
  3858 00001A8C 8D062B81                 lea  ax, [symbol]
  3859 00001A90 50                       push ax
  3860 00001A91 E802E7                   call eqstr
  3861 00001A94 83C404                   add  sp, 4
  3862 00001A97 08C0                     or  al, al
  3863 00001A99 0F840600                 je .checkreg194
  3864 00001A9D B82700                   mov ax, 39
  3865 00001AA0 E93C01                   jmp .retncheckreg
  3866                                  
  3867                                  ;-396   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;
  3868                                  
  3869                                  .checkreg194:
  3870 00001AA3 68[1C1C]                 push checkreg_20
  3871 00001AA6 8D062B81                 lea  ax, [symbol]
  3872 00001AAA 50                       push ax
  3873 00001AAB E8E8E6                   call eqstr
  3874 00001AAE 83C404                   add  sp, 4
  3875 00001AB1 08C0                     or  al, al
  3876 00001AB3 0F840600                 je .checkreg195
  3877 00001AB7 B82900                   mov ax, 41
  3878 00001ABA E92201                   jmp .retncheckreg
  3879                                  .checkreg195:
  3880 00001ABD 68[1F1C]                 push checkreg_21
  3881 00001AC0 8D062B81                 lea  ax, [symbol]
  3882 00001AC4 50                       push ax
  3883 00001AC5 E8CEE6                   call eqstr
  3884 00001AC8 83C404                   add  sp, 4
  3885 00001ACB 08C0                     or  al, al
  3886 00001ACD 0F840600                 je .checkreg196
  3887 00001AD1 B82B00                   mov ax, 43
  3888 00001AD4 E90801                   jmp .retncheckreg
  3889                                  
  3890                                  ;-397   // (eqstr(symbol,"ip")) return 45;
  3891                                  
  3892                                  
  3893                                  ;-398   if (strlen(symbol) >   3) return 0;
  3894                                  
  3895                                  .checkreg196:
  3896 00001AD7 8D062B81                 lea  ax, [symbol]
  3897 00001ADB 50                       push ax
  3898 00001ADC E85FE6                   call strlen
  3899 00001ADF 83C402                   add  sp, 2
  3900 00001AE2 83F803                   cmp ax, 3
  3901 00001AE5 0F8E0600                 jle .checkreg197
  3902 00001AE9 B80000                   mov ax, 0
  3903 00001AEC E9F000                   jmp .retncheckreg
  3904                                  
  3905                                  ;-399   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;
  3906                                  
  3907                                  .checkreg197:
  3908 00001AEF 68[221C]                 push checkreg_22
  3909 00001AF2 8D062B81                 lea  ax, [symbol]
  3910 00001AF6 50                       push ax
  3911 00001AF7 E89CE6                   call eqstr
  3912 00001AFA 83C404                   add  sp, 4
  3913 00001AFD 08C0                     or  al, al
  3914 00001AFF 0F840600                 je .checkreg198
  3915 00001B03 B82F00                   mov ax, 47
  3916 00001B06 E9D600                   jmp .retncheckreg
  3917                                  .checkreg198:
  3918 00001B09 68[261C]                 push checkreg_23
  3919 00001B0C 8D062B81                 lea  ax, [symbol]
  3920 00001B10 50                       push ax
  3921 00001B11 E882E6                   call eqstr
  3922 00001B14 83C404                   add  sp, 4
  3923 00001B17 08C0                     or  al, al
  3924 00001B19 0F840600                 je .checkreg199
  3925 00001B1D B83200                   mov ax, 50
  3926 00001B20 E9BC00                   jmp .retncheckreg
  3927                                  
  3928                                  ;-400   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;
  3929                                  
  3930                                  .checkreg199:
  3931 00001B23 68[2A1C]                 push checkreg_24
  3932 00001B26 8D062B81                 lea  ax, [symbol]
  3933 00001B2A 50                       push ax
  3934 00001B2B E868E6                   call eqstr
  3935 00001B2E 83C404                   add  sp, 4
  3936 00001B31 08C0                     or  al, al
  3937 00001B33 0F840600                 je .checkreg200
  3938 00001B37 B83500                   mov ax, 53
  3939 00001B3A E9A200                   jmp .retncheckreg
  3940                                  .checkreg200:
  3941 00001B3D 68[2E1C]                 push checkreg_25
  3942 00001B40 8D062B81                 lea  ax, [symbol]
  3943 00001B44 50                       push ax
  3944 00001B45 E84EE6                   call eqstr
  3945 00001B48 83C404                   add  sp, 4
  3946 00001B4B 08C0                     or  al, al
  3947 00001B4D 0F840600                 je .checkreg201
  3948 00001B51 B83800                   mov ax, 56
  3949 00001B54 E98800                   jmp .retncheckreg
  3950                                  
  3951                                  ;-401   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;
  3952                                  
  3953                                  .checkreg201:
  3954 00001B57 68[321C]                 push checkreg_26
  3955 00001B5A 8D062B81                 lea  ax, [symbol]
  3956 00001B5E 50                       push ax
  3957 00001B5F E834E6                   call eqstr
  3958 00001B62 83C404                   add  sp, 4
  3959 00001B65 08C0                     or  al, al
  3960 00001B67 0F840600                 je .checkreg202
  3961 00001B6B B83B00                   mov ax, 59
  3962 00001B6E E96E00                   jmp .retncheckreg
  3963                                  .checkreg202:
  3964 00001B71 68[361C]                 push checkreg_27
  3965 00001B74 8D062B81                 lea  ax, [symbol]
  3966 00001B78 50                       push ax
  3967 00001B79 E81AE6                   call eqstr
  3968 00001B7C 83C404                   add  sp, 4
  3969 00001B7F 08C0                     or  al, al
  3970 00001B81 0F840600                 je .checkreg203
  3971 00001B85 B83E00                   mov ax, 62
  3972 00001B88 E95400                   jmp .retncheckreg
  3973                                  
  3974                                  ;-402   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;
  3975                                  
  3976                                  .checkreg203:
  3977 00001B8B 68[3A1C]                 push checkreg_28
  3978 00001B8E 8D062B81                 lea  ax, [symbol]
  3979 00001B92 50                       push ax
  3980 00001B93 E800E6                   call eqstr
  3981 00001B96 83C404                   add  sp, 4
  3982 00001B99 08C0                     or  al, al
  3983 00001B9B 0F840600                 je .checkreg204
  3984 00001B9F B84100                   mov ax, 65
  3985 00001BA2 E93A00                   jmp .retncheckreg
  3986                                  .checkreg204:
  3987 00001BA5 68[3E1C]                 push checkreg_29
  3988 00001BA8 8D062B81                 lea  ax, [symbol]
  3989 00001BAC 50                       push ax
  3990 00001BAD E8E6E5                   call eqstr
  3991 00001BB0 83C404                   add  sp, 4
  3992 00001BB3 08C0                     or  al, al
  3993 00001BB5 0F840600                 je .checkreg205
  3994 00001BB9 B84400                   mov ax, 68
  3995 00001BBC E92000                   jmp .retncheckreg
  3996                                  
  3997                                  ;-403   if (eqstr(symbol,"cr0")) return 71;
  3998                                  
  3999                                  .checkreg205:
  4000 00001BBF 68[421C]                 push checkreg_30
  4001 00001BC2 8D062B81                 lea  ax, [symbol]
  4002 00001BC6 50                       push ax
  4003 00001BC7 E8CCE5                   call eqstr
  4004 00001BCA 83C404                   add  sp, 4
  4005 00001BCD 08C0                     or  al, al
  4006 00001BCF 0F840600                 je .checkreg206
  4007 00001BD3 B84700                   mov ax, 71
  4008 00001BD6 E90600                   jmp .retncheckreg
  4009                                  
  4010                                  ;-404   return 0;   }
  4011                                  
  4012                                  .checkreg206:
  4013 00001BD9 B80000                   mov ax, 0
  4014 00001BDC E90000                   jmp .retncheckreg
  4015                                  
  4016                                  ;-405 char printregstr[]
  4017                                  
  4018                                   .retncheckreg:
  4019 00001BDF C3                       ret
  4020 00001BE0 616C00                  checkreg_0 db "al",0
  4021 00001BE3 636C00                  checkreg_1 db "cl",0
  4022 00001BE6 646C00                  checkreg_2 db "dl",0
  4023 00001BE9 626C00                  checkreg_3 db "bl",0
  4024 00001BEC 616800                  checkreg_4 db "ah",0
  4025 00001BEF 636800                  checkreg_5 db "ch",0
  4026 00001BF2 646800                  checkreg_6 db "dh",0
  4027 00001BF5 626800                  checkreg_7 db "bh",0
  4028 00001BF8 617800                  checkreg_8 db "ax",0
  4029 00001BFB 637800                  checkreg_9 db "cx",0
  4030 00001BFE 647800                  checkreg_10 db "dx",0
  4031 00001C01 627800                  checkreg_11 db "bx",0
  4032 00001C04 737000                  checkreg_12 db "sp",0
  4033 00001C07 627000                  checkreg_13 db "bp",0
  4034 00001C0A 736900                  checkreg_14 db "si",0
  4035 00001C0D 646900                  checkreg_15 db "di",0
  4036 00001C10 657300                  checkreg_16 db "es",0
  4037 00001C13 637300                  checkreg_17 db "cs",0
  4038 00001C16 737300                  checkreg_18 db "ss",0
  4039 00001C19 647300                  checkreg_19 db "ds",0
  4040 00001C1C 667300                  checkreg_20 db "fs",0
  4041 00001C1F 677300                  checkreg_21 db "gs",0
  4042 00001C22 65617800                checkreg_22 db "eax",0
  4043 00001C26 65637800                checkreg_23 db "ecx",0
  4044 00001C2A 65647800                checkreg_24 db "edx",0
  4045 00001C2E 65627800                checkreg_25 db "ebx",0
  4046 00001C32 65737000                checkreg_26 db "esp",0
  4047 00001C36 65627000                checkreg_27 db "ebp",0
  4048 00001C3A 65736900                checkreg_28 db "esi",0
  4049 00001C3E 65646900                checkreg_29 db "edi",0
  4050 00001C42 63723000                checkreg_30 db "cr0",0
  4051                                  ; ENDP
  4052                                  
  4053                                  ;-406 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";
  4054                                  
  4055 00001C46 2A616C636C646C626C-     printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0
  4056 00001C4F 616863686468626861-
  4057 00001C58 786378647862787370-
  4058 00001C61 627073696469657363-
  4059 00001C6A 737373647366736773-
  4060 00001C73 697065617865637865-
  4061 00001C7C 647865627865737065-
  4062 00001C85 627065736965646963-
  4063 00001C8E 723000             
  4064                                  
  4065                                  ;-407 //          1         2         3         4         5         6         7
  4066                                  
  4067                                  
  4068                                  ;-408 // 1 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3
  4069                                  
  4070                                  
  4071                                  ;-409 int printreg(int i) {  unsigned int k; unsigned char c;
  4072                                  
  4073                                  
  4074                                  printreg:  ; *** PROC ***
  4075                                  
  4076                                  ;-410   k = &printregstr + i; c=*k; prc(c); i++;
  4077                                  
  4078                                  ;Function : printreg, Number of local variables: 3
  4079                                  ;   # type sign width addr used name   list of local variables
  4080                                  ;  200 var sign word   409 NULL i = bp+4
  4081                                  ;  201 var unsg word   409 NULL k = bp-2
  4082                                  ;  202 var unsg byte   409 NULL c = bp-4;
  4083 00001C91 C8040000                 ENTER  4,0
  4084 00001C95 B8[461C]                 mov ax, printregstr
  4085 00001C98 034604                   add ax, [bp+4]
  4086 00001C9B 8946FE                   mov [bp-2], ax
  4087 00001C9E 8B5EFE                   mov bx, [bp-2]
  4088 00001CA1 8B07                     mov ax, [bx]
  4089 00001CA3 8846FC                   mov [bp-4], al
  4090 00001CA6 8A46FC                   mov al, byte [bp-4]
  4091 00001CA9 B400                     mov ah, 0
  4092 00001CAB 50                       push ax
  4093 00001CAC E83628                   call prc
  4094 00001CAF 83C402                   add  sp, 2
  4095 00001CB2 FF4604                   inc  word[bp+4]
  4096                                  
  4097                                  ;-411   k = &printregstr + i; c=*k; prc(c);
  4098                                  
  4099 00001CB5 B8[461C]                 mov ax, printregstr
  4100 00001CB8 034604                   add ax, [bp+4]
  4101 00001CBB 8946FE                   mov [bp-2], ax
  4102 00001CBE 8B5EFE                   mov bx, [bp-2]
  4103 00001CC1 8B07                     mov ax, [bx]
  4104 00001CC3 8846FC                   mov [bp-4], al
  4105 00001CC6 8A46FC                   mov al, byte [bp-4]
  4106 00001CC9 B400                     mov ah, 0
  4107 00001CCB 50                       push ax
  4108 00001CCC E81628                   call prc
  4109 00001CCF 83C402                   add  sp, 2
  4110                                  
  4111                                  ;-412   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }
  4112                                  
  4113 00001CD2 8B4604                   mov ax, [bp+4]
  4114 00001CD5 83F82F                   cmp ax, 47
  4115 00001CD8 0F8E2000                 jle .printreg207
  4116 00001CDC FF4604                   inc  word[bp+4]
  4117 00001CDF B8[461C]                 mov ax, printregstr
  4118 00001CE2 034604                   add ax, [bp+4]
  4119 00001CE5 8946FE                   mov [bp-2], ax
  4120 00001CE8 8B5EFE                   mov bx, [bp-2]
  4121 00001CEB 8B07                     mov ax, [bx]
  4122 00001CED 8846FC                   mov [bp-4], al
  4123 00001CF0 8A46FC                   mov al, byte [bp-4]
  4124 00001CF3 B400                     mov ah, 0
  4125 00001CF5 50                       push ax
  4126 00001CF6 E8EC27                   call prc
  4127 00001CF9 83C402                   add  sp, 2
  4128                                  
  4129                                  ;-413 }
  4130                                  
  4131                                  .printreg207:
  4132                                  
  4133                                  ;-414 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
  4134 00001CFC C9                       LEAVE
  4135 00001CFD C3                       ret
  4136                                  ; ENDP
  4137 00001CFE 0000                    evalue dw 0
  4138 00001D00 0A00                    exprtype dw 10
  4139                                  
  4140                                  ;-415 int expr(int isRight)
  4141                                  
  4142                                  
  4143                                  expr:  ; *** PROC ***
  4144                                  
  4145                                  ;-416 { int mode; int id1;     int ixarr; int ixconst;
  4146                                  
  4147                                  
  4148                                  ;-417   int ids;  int isCONST; int i;     unsigned char *p;
  4149                                  
  4150                                  
  4151                                  ;-418   if (istoken(T_CONST)) { evalue=lexval;
  4152                                  
  4153                                  ;Function : expr, Number of local variables: 9
  4154                                  ;   # type sign width addr used name   list of local variables
  4155                                  ;  200 var sign word   415 NULL isRight = bp+4
  4156                                  ;  201 var sign word   416 NULL mode = bp-2
  4157                                  ;  202 var sign word   416 NULL id1 = bp-4
  4158                                  ;  203 var sign word   416 NULL ixarr = bp-6
  4159                                  ;  204 var sign word   416 NULL ixconst = bp-8
  4160                                  ;  205 var sign word   417 NULL ids = bp-10
  4161                                  ;  206 var sign word   417 NULL isCONST = bp-12
  4162                                  ;  207 var sign word   417 NULL i = bp-14
  4163                                  ;  208 ptr unsg byte   417 NULL p = bp-16;
  4164 00001D02 C8100000                 ENTER  16,0
  4165 00001D06 680101                   push 257
  4166 00001D09 E80B27                   call istoken
  4167 00001D0C 83C402                   add  sp, 2
  4168 00001D0F 08C0                     or  al, al
  4169 00001D11 0F841F00                 je .expr208
  4170 00001D15 A1[2E00]                 mov ax, [lexval]
  4171 00001D18 A3[FE1C]                 mov word [evalue], ax
  4172                                  
  4173                                  ;-419     prs("\n mov ax, "); prunsign1(lexval); return 4; }
  4174                                  
  4175 00001D1B 68[A220]                 push expr_0
  4176 00001D1E E82B28                   call prs
  4177 00001D21 83C402                   add  sp, 2
  4178 00001D24 FF36[2E00]               push word [lexval]
  4179 00001D28 E87B29                   call prunsign1
  4180 00001D2B 83C402                   add  sp, 2
  4181 00001D2E B80400                   mov ax, 4
  4182 00001D31 E96C03                   jmp .retnexpr
  4183                                  
  4184                                  ;-420   mode=typeName(); /*0=V,1=*,2=&*/
  4185                                  
  4186                                  .expr208:
  4187 00001D34 E856ED                   call typeName
  4188 00001D37 8946FE                   mov [bp-2], ax
  4189                                  
  4190                                  ;-421   ireg1=checkreg();
  4191                                  
  4192 00001D3A E846FB                   call checkreg
  4193 00001D3D A3[9A10]                 mov word [ireg1], ax
  4194                                  
  4195                                  ;-422   if (ireg1) { doreg1(0); return; }
  4196                                  
  4197 00001D40 A1[9A10]                 mov ax, [ireg1]
  4198 00001D43 08C0                     or  al, al
  4199 00001D45 0F840B00                 je .expr209
  4200 00001D49 6A00                     push 0
  4201 00001D4B E849F9                   call doreg1
  4202 00001D4E 83C402                   add  sp, 2
  4203 00001D51 E94C03                   jmp .retnexpr
  4204                                  
  4205                                  ;-423   if (token=='(')  {docall1(); goto e1; }
  4206                                  
  4207                                  .expr209:
  4208 00001D54 A1[1C00]                 mov ax, [token]
  4209 00001D57 83F828                   cmp ax, 40
  4210 00001D5A 0F850600                 jne .expr210
  4211 00001D5E E82E0F                   call docall1
  4212 00001D61 E93202                   jmp .e1
  4213                                  
  4214                                  ;-424   if (isreg()) goto e1;
  4215                                  
  4216                                  .expr210:
  4217 00001D64 E88307                   call isreg
  4218 00001D67 08C0                     or  al, al
  4219 00001D69 0F840300                 je .expr211
  4220 00001D6D E92602                   jmp .e1
  4221                                  
  4222                                  ;-425 
  4223                                  
  4224                                  
  4225                                  ;-426   id1=searchname(); gettypes(id1); ids=signi;
  4226                                  
  4227                                  .expr211:
  4228 00001D70 E84BEC                   call searchname
  4229 00001D73 8946FC                   mov [bp-4], ax
  4230 00001D76 FF76FC                   push word [bp-4]
  4231 00001D79 E804EB                   call gettypes
  4232 00001D7C 83C402                   add  sp, 2
  4233 00001D7F A1[3300]                 mov ax, [signi]
  4234 00001D82 8946F6                   mov [bp-10], ax
  4235                                  
  4236                                  ;-427   ixarr=0;  ixconst=0;
  4237                                  
  4238 00001D85 B80000                   mov ax, 0
  4239 00001D88 8946FA                   mov [bp-6], ax
  4240 00001D8B B80000                   mov ax, 0
  4241 00001D8E 8946F8                   mov [bp-8], ax
  4242                                  
  4243                                  ;-428     if (istoken('[')) { if (istoken(T_CONST)) {
  4244                                  
  4245 00001D91 6A5B                     push 91
  4246 00001D93 E88126                   call istoken
  4247 00001D96 83C402                   add  sp, 2
  4248 00001D99 08C0                     or  al, al
  4249 00001D9B 0F845900                 je .expr212
  4250 00001D9F 680101                   push 257
  4251 00001DA2 E87226                   call istoken
  4252 00001DA5 83C402                   add  sp, 2
  4253 00001DA8 08C0                     or  al, al
  4254 00001DAA 0F841700                 je .expr213
  4255                                  
  4256                                  ;-429       ixconst=1; ixarr=lexval; expect(']');  }
  4257                                  
  4258 00001DAE B80100                   mov ax, 1
  4259 00001DB1 8946F8                   mov [bp-8], ax
  4260 00001DB4 A1[2E00]                 mov ax, [lexval]
  4261 00001DB7 8946FA                   mov [bp-6], ax
  4262 00001DBA 6A5D                     push 93
  4263 00001DBC E87A26                   call expect
  4264 00001DBF 83C402                   add  sp, 2
  4265                                  
  4266                                  ;-430     else {ixarr=searchname(); expect(T_NAME); expect(']');
  4267                                  
  4268 00001DC2 E93300                   jmp .expr214
  4269                                  .expr213:
  4270 00001DC5 E8F6EB                   call searchname
  4271 00001DC8 8946FA                   mov [bp-6], ax
  4272 00001DCB 680001                   push 256
  4273 00001DCE E86826                   call expect
  4274 00001DD1 83C402                   add  sp, 2
  4275 00001DD4 6A5D                     push 93
  4276 00001DD6 E86026                   call expect
  4277 00001DD9 83C402                   add  sp, 2
  4278                                  
  4279                                  ;-431     gettypes(ixarr);
  4280                                  
  4281 00001DDC FF76FA                   push word [bp-6]
  4282 00001DDF E89EEA                   call gettypes
  4283 00001DE2 83C402                   add  sp, 2
  4284                                  
  4285                                  ;-432     if (widthi != 2) error1("Arrayindex muss Zahl oder int sein"); } }
  4286                                  
  4287 00001DE5 A1[3600]                 mov ax, [widthi]
  4288 00001DE8 83F802                   cmp ax, 2
  4289 00001DEB 0F840900                 je  .expr215
  4290 00001DEF 68[AE20]                 push expr_1
  4291 00001DF2 E8422A                   call error1
  4292 00001DF5 83C402                   add  sp, 2
  4293                                  .expr215:
  4294                                  .expr214:
  4295                                  
  4296                                  ;-433   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Nur var erlaubt");
  4297                                  
  4298                                  .expr212:
  4299 00001DF8 68C304                   push 1219
  4300 00001DFB E81926                   call istoken
  4301 00001DFE 83C402                   add  sp, 2
  4302 00001E01 08C0                     or  al, al
  4303 00001E03 0F844600                 je .expr216
  4304 00001E07 8B46FE                   mov ax, [bp-2]
  4305 00001E0A 08C0                     or  al, al
  4306 00001E0C 0F840900                 je .expr217
  4307 00001E10 68[D120]                 push expr_2
  4308 00001E13 E8212A                   call error1
  4309 00001E16 83C402                   add  sp, 2
  4310                                  
  4311                                  ;-434      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");
  4312                                  
  4313                                  .expr217:
  4314 00001E19 68[E120]                 push expr_3
  4315 00001E1C E82D27                   call prs
  4316 00001E1F 83C402                   add  sp, 2
  4317 00001E22 A1[3900]                 mov ax, [wi]
  4318 00001E25 83F802                   cmp ax, 2
  4319 00001E28 0F850C00                 jne .expr218
  4320 00001E2C 68[EA20]                 push expr_4
  4321 00001E2F E81A27                   call prs
  4322 00001E32 83C402                   add  sp, 2
  4323 00001E35 E90900                   jmp .expr219
  4324                                  .expr218:
  4325 00001E38 68[EF20]                 push expr_5
  4326 00001E3B E80E27                   call prs
  4327 00001E3E 83C402                   add  sp, 2
  4328                                  
  4329                                  ;-435      v(id1); goto e1;}
  4330                                  
  4331                                  .expr219:
  4332 00001E41 FF76FC                   push word [bp-4]
  4333 00001E44 E88BE5                   call v
  4334 00001E47 83C402                   add  sp, 2
  4335 00001E4A E94901                   jmp .e1
  4336                                  
  4337                                  ;-436   if (istoken(T_MINUSMINUS)) {if(mode)error1("Nur var erlaubt");
  4338                                  
  4339                                  .expr216:
  4340 00001E4D 68C904                   push 1225
  4341 00001E50 E8C425                   call istoken
  4342 00001E53 83C402                   add  sp, 2
  4343 00001E56 08C0                     or  al, al
  4344 00001E58 0F844600                 je .expr220
  4345 00001E5C 8B46FE                   mov ax, [bp-2]
  4346 00001E5F 08C0                     or  al, al
  4347 00001E61 0F840900                 je .expr221
  4348 00001E65 68[F420]                 push expr_6
  4349 00001E68 E8CC29                   call error1
  4350 00001E6B 83C402                   add  sp, 2
  4351                                  
  4352                                  ;-437      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");
  4353                                  
  4354                                  .expr221:
  4355 00001E6E 68[0421]                 push expr_7
  4356 00001E71 E8D826                   call prs
  4357 00001E74 83C402                   add  sp, 2
  4358 00001E77 A1[3900]                 mov ax, [wi]
  4359 00001E7A 83F802                   cmp ax, 2
  4360 00001E7D 0F850C00                 jne .expr222
  4361 00001E81 68[0D21]                 push expr_8
  4362 00001E84 E8C526                   call prs
  4363 00001E87 83C402                   add  sp, 2
  4364 00001E8A E90900                   jmp .expr223
  4365                                  .expr222:
  4366 00001E8D 68[1221]                 push expr_9
  4367 00001E90 E8B926                   call prs
  4368 00001E93 83C402                   add  sp, 2
  4369                                  
  4370                                  ;-438      v(id1); goto e1;}
  4371                                  
  4372                                  .expr223:
  4373 00001E96 FF76FC                   push word [bp-4]
  4374 00001E99 E836E5                   call v
  4375 00001E9C 83C402                   add  sp, 2
  4376 00001E9F E9F400                   jmp .e1
  4377                                  
  4378                                  ;-439        
  4379                                  
  4380                                  
  4381                                  ;-440   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}
  4382                                  
  4383                                  .expr220:
  4384 00001EA2 68CE04                   push 1230
  4385 00001EA5 E86F25                   call istoken
  4386 00001EA8 83C402                   add  sp, 2
  4387 00001EAB 08C0                     or  al, al
  4388 00001EAD 0F841200                 je .expr224
  4389 00001EB1 FF76FC                   push word [bp-4]
  4390 00001EB4 FF76FE                   push word [bp-2]
  4391 00001EB7 68[1721]                 push expr_10
  4392 00001EBA E8A802                   call compoundass
  4393 00001EBD 83C406                   add  sp, 6
  4394 00001EC0 E9D300                   jmp .e1
  4395                                  
  4396                                  ;-441   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}
  4397                                  
  4398                                  .expr224:
  4399 00001EC3 68CF04                   push 1231
  4400 00001EC6 E84E25                   call istoken
  4401 00001EC9 83C402                   add  sp, 2
  4402 00001ECC 08C0                     or  al, al
  4403 00001ECE 0F841200                 je .expr225
  4404 00001ED2 FF76FC                   push word [bp-4]
  4405 00001ED5 FF76FE                   push word [bp-2]
  4406 00001ED8 68[1B21]                 push expr_11
  4407 00001EDB E88702                   call compoundass
  4408 00001EDE 83C406                   add  sp, 6
  4409 00001EE1 E9B200                   jmp .e1
  4410                                  
  4411                                  ;-442   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}
  4412                                  
  4413                                  .expr225:
  4414 00001EE4 68D204                   push 1234
  4415 00001EE7 E82D25                   call istoken
  4416 00001EEA 83C402                   add  sp, 2
  4417 00001EED 08C0                     or  al, al
  4418 00001EEF 0F841200                 je .expr226
  4419 00001EF3 FF76FC                   push word [bp-4]
  4420 00001EF6 FF76FE                   push word [bp-2]
  4421 00001EF9 68[1F21]                 push expr_12
  4422 00001EFC E86602                   call compoundass
  4423 00001EFF 83C406                   add  sp, 6
  4424 00001F02 E99100                   jmp .e1
  4425                                  
  4426                                  ;-443   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}    
  4427                                  
  4428                                  .expr226:
  4429 00001F05 68D304                   push 1235
  4430 00001F08 E80C25                   call istoken
  4431 00001F0B 83C402                   add  sp, 2
  4432 00001F0E 08C0                     or  al, al
  4433 00001F10 0F841200                 je .expr227
  4434 00001F14 FF76FC                   push word [bp-4]
  4435 00001F17 FF76FE                   push word [bp-2]
  4436 00001F1A 68[2321]                 push expr_13
  4437 00001F1D E84502                   call compoundass
  4438 00001F20 83C406                   add  sp, 6
  4439 00001F23 E97000                   jmp .e1
  4440                                  
  4441                                  ;-444   if (istoken(T_MULASS    )) {error1("not implemented");}
  4442                                  
  4443                                  .expr227:
  4444 00001F26 68D004                   push 1232
  4445 00001F29 E8EB24                   call istoken
  4446 00001F2C 83C402                   add  sp, 2
  4447 00001F2F 08C0                     or  al, al
  4448 00001F31 0F840900                 je .expr228
  4449 00001F35 68[2621]                 push expr_14
  4450 00001F38 E8FC28                   call error1
  4451 00001F3B 83C402                   add  sp, 2
  4452                                  
  4453                                  ;-445   if (istoken(T_DIVASS    )) {error1("not implemented");}
  4454                                  
  4455                                  .expr228:
  4456 00001F3E 68D104                   push 1233
  4457 00001F41 E8D324                   call istoken
  4458 00001F44 83C402                   add  sp, 2
  4459 00001F47 08C0                     or  al, al
  4460 00001F49 0F840900                 je .expr229
  4461 00001F4D 68[3621]                 push expr_15
  4462 00001F50 E8E428                   call error1
  4463 00001F53 83C402                   add  sp, 2
  4464                                  
  4465                                  ;-446 
  4466                                  
  4467                                  
  4468                                  ;-447   if (istoken('=')) { exprtype= expr(1); 
  4469                                  
  4470                                  .expr229:
  4471 00001F56 6A3D                     push 61
  4472 00001F58 E8BC24                   call istoken
  4473 00001F5B 83C402                   add  sp, 2
  4474 00001F5E 08C0                     or  al, al
  4475 00001F60 0F842000                 je .expr230
  4476 00001F64 6A01                     push 1
  4477 00001F66 E899FD                   call expr
  4478 00001F69 83C402                   add  sp, 2
  4479 00001F6C A3[001D]                 mov word [exprtype], ax
  4480                                  
  4481                                  ;-448   doassign(mode, id1, ixarr, ixconst); goto e1;  }
  4482                                  
  4483 00001F6F FF76F8                   push word [bp-8]
  4484 00001F72 FF76FA                   push word [bp-6]
  4485 00001F75 FF76FC                   push word [bp-4]
  4486 00001F78 FF76FE                   push word [bp-2]
  4487 00001F7B E85E08                   call doassign
  4488 00001F7E 83C408                   add  sp, 8
  4489 00001F81 E91200                   jmp .e1
  4490                                  
  4491                                  ;-449   dovar1(mode, "mov", ixarr, id1);
  4492                                  
  4493                                  .expr230:
  4494 00001F84 FF76FC                   push word [bp-4]
  4495 00001F87 FF76FA                   push word [bp-6]
  4496 00001F8A 68[4621]                 push expr_16
  4497 00001F8D FF76FE                   push word [bp-2]
  4498 00001F90 E87402                   call dovar1
  4499 00001F93 83C408                   add  sp, 8
  4500                                  
  4501                                  ;-450   
  4502                                  
  4503                                  
  4504                                  ;-451 e1:    if (istoken('+')) rterm("add");
  4505                                  
  4506                                  .e1:
  4507 00001F96 6A2B                     push 43
  4508 00001F98 E87C24                   call istoken
  4509 00001F9B 83C402                   add  sp, 2
  4510 00001F9E 08C0                     or  al, al
  4511 00001FA0 0F840C00                 je .expr231
  4512 00001FA4 68[4A21]                 push expr_17
  4513 00001FA7 E82704                   call rterm
  4514 00001FAA 83C402                   add  sp, 2
  4515                                  
  4516                                  ;-452   else if (istoken('-')) rterm("sub" );
  4517                                  
  4518 00001FAD E9CF00                   jmp .expr232
  4519                                  .expr231:
  4520 00001FB0 6A2D                     push 45
  4521 00001FB2 E86224                   call istoken
  4522 00001FB5 83C402                   add  sp, 2
  4523 00001FB8 08C0                     or  al, al
  4524 00001FBA 0F840C00                 je .expr233
  4525 00001FBE 68[4E21]                 push expr_18
  4526 00001FC1 E80D04                   call rterm
  4527 00001FC4 83C402                   add  sp, 2
  4528                                  
  4529                                  ;-453   else if (istoken('&')) rterm("and" );
  4530                                  
  4531 00001FC7 E9B500                   jmp .expr234
  4532                                  .expr233:
  4533 00001FCA 6A26                     push 38
  4534 00001FCC E84824                   call istoken
  4535 00001FCF 83C402                   add  sp, 2
  4536 00001FD2 08C0                     or  al, al
  4537 00001FD4 0F840C00                 je .expr235
  4538 00001FD8 68[5221]                 push expr_19
  4539 00001FDB E8F303                   call rterm
  4540 00001FDE 83C402                   add  sp, 2
  4541                                  
  4542                                  ;-454   else if (istoken('|')) rterm("or" );  
  4543                                  
  4544 00001FE1 E99B00                   jmp .expr236
  4545                                  .expr235:
  4546 00001FE4 6A7C                     push 124
  4547 00001FE6 E82E24                   call istoken
  4548 00001FE9 83C402                   add  sp, 2
  4549 00001FEC 08C0                     or  al, al
  4550 00001FEE 0F840C00                 je .expr237
  4551 00001FF2 68[5621]                 push expr_20
  4552 00001FF5 E8D903                   call rterm
  4553 00001FF8 83C402                   add  sp, 2
  4554                                  
  4555                                  ;-455   else if (istoken(T_LESSLESS)) rterm("shl");
  4556                                  
  4557 00001FFB E98100                   jmp .expr238
  4558                                  .expr237:
  4559 00001FFE 68D804                   push 1240
  4560 00002001 E81324                   call istoken
  4561 00002004 83C402                   add  sp, 2
  4562 00002007 08C0                     or  al, al
  4563 00002009 0F840C00                 je .expr239
  4564 0000200D 68[5921]                 push expr_21
  4565 00002010 E8BE03                   call rterm
  4566 00002013 83C402                   add  sp, 2
  4567                                  
  4568                                  ;-456   else if (istoken(T_GREATGREAT)) rterm("shr");  
  4569                                  
  4570 00002016 E96600                   jmp .expr240
  4571                                  .expr239:
  4572 00002019 68D904                   push 1241
  4573 0000201C E8F823                   call istoken
  4574 0000201F 83C402                   add  sp, 2
  4575 00002022 08C0                     or  al, al
  4576 00002024 0F840C00                 je .expr241
  4577 00002028 68[5D21]                 push expr_22
  4578 0000202B E8A303                   call rterm
  4579 0000202E 83C402                   add  sp, 2
  4580                                  
  4581                                  ;-457   else if (istoken('*')) domul (ids);
  4582                                  
  4583 00002031 E94B00                   jmp .expr242
  4584                                  .expr241:
  4585 00002034 6A2A                     push 42
  4586 00002036 E8DE23                   call istoken
  4587 00002039 83C402                   add  sp, 2
  4588 0000203C 08C0                     or  al, al
  4589 0000203E 0F840C00                 je .expr243
  4590 00002042 FF76F6                   push word [bp-10]
  4591 00002045 E8DD09                   call domul
  4592 00002048 83C402                   add  sp, 2
  4593                                  
  4594                                  ;-458   else if (istoken('/')) doidiv(ids);
  4595                                  
  4596 0000204B E93100                   jmp .expr244
  4597                                  .expr243:
  4598 0000204E 6A2F                     push 47
  4599 00002050 E8C423                   call istoken
  4600 00002053 83C402                   add  sp, 2
  4601 00002056 08C0                     or  al, al
  4602 00002058 0F840C00                 je .expr245
  4603 0000205C FF76F6                   push word [bp-10]
  4604 0000205F E8640A                   call doidiv
  4605 00002062 83C402                   add  sp, 2
  4606                                  
  4607                                  ;-459   else if (istoken('%')) domod (ids);
  4608                                  
  4609 00002065 E91700                   jmp .expr246
  4610                                  .expr245:
  4611 00002068 6A25                     push 37
  4612 0000206A E8AA23                   call istoken
  4613 0000206D 83C402                   add  sp, 2
  4614 00002070 08C0                     or  al, al
  4615 00002072 0F840900                 je .expr247
  4616 00002076 FF76F6                   push word [bp-10]
  4617 00002079 E8ED0B                   call domod
  4618 0000207C 83C402                   add  sp, 2
  4619                                  
  4620                                  ;-460   if (isrelational()) { rterm("cmp"); cmpneg(ids);}
  4621                                  
  4622                                  .expr247:
  4623                                  .expr246:
  4624                                  .expr244:
  4625                                  .expr242:
  4626                                  .expr240:
  4627                                  .expr238:
  4628                                  .expr236:
  4629                                  .expr234:
  4630                                  .expr232:
  4631 0000207F E80A1C                   call isrelational
  4632 00002082 08C0                     or  al, al
  4633 00002084 0F841200                 je .expr248
  4634 00002088 68[6121]                 push expr_23
  4635 0000208B E84303                   call rterm
  4636 0000208E 83C402                   add  sp, 2
  4637 00002091 FF76F6                   push word [bp-10]
  4638 00002094 E83719                   call cmpneg
  4639 00002097 83C402                   add  sp, 2
  4640                                  
  4641                                  ;-461   return 0;
  4642                                  
  4643                                  .expr248:
  4644 0000209A B80000                   mov ax, 0
  4645 0000209D E90000                   jmp .retnexpr
  4646                                  
  4647                                  ;-462 }
  4648                                  
  4649                                  
  4650                                  ;-463 
  4651                                  
  4652                                  
  4653                                  ;-464 int compoundass(char *op, int mode, int id1) {
  4654                                  
  4655 000020A0 C9                       .retnexpr: LEAVE
  4656 000020A1 C3                       ret
  4657 000020A2 5C6E206D6F76206178-     expr_0 db "\n mov ax, ",0
  4658 000020AB 2C2000             
  4659 000020AE 4172726179696E6465-     expr_1 db "Arrayindex muss Zahl oder int sein",0
  4660 000020B7 78206D757373205A61-
  4661 000020C0 686C206F6465722069-
  4662 000020C9 6E74207365696E00   
  4663 000020D1 4E7572207661722065-     expr_2 db "Nur var erlaubt",0
  4664 000020DA 726C6175627400     
  4665 000020E1 5C6E20696E63202000      expr_3 db "\n inc  ",0
  4666 000020EA 776F726400              expr_4 db "word",0
  4667 000020EF 6279746500              expr_5 db "byte",0
  4668 000020F4 4E7572207661722065-     expr_6 db "Nur var erlaubt",0
  4669 000020FD 726C6175627400     
  4670 00002104 5C6E20646563202000      expr_7 db "\n dec  ",0
  4671 0000210D 776F726400              expr_8 db "word",0
  4672 00002112 6279746500              expr_9 db "byte",0
  4673 00002117 61646400                expr_10 db "add",0
  4674 0000211B 73756200                expr_11 db "sub",0
  4675 0000211F 616E6400                expr_12 db "and",0
  4676 00002123 6F7200                  expr_13 db "or",0
  4677 00002126 6E6F7420696D706C65-     expr_14 db "not implemented",0
  4678 0000212F 6D656E74656400     
  4679 00002136 6E6F7420696D706C65-     expr_15 db "not implemented",0
  4680 0000213F 6D656E74656400     
  4681 00002146 6D6F7600                expr_16 db "mov",0
  4682 0000214A 61646400                expr_17 db "add",0
  4683 0000214E 73756200                expr_18 db "sub",0
  4684 00002152 616E6400                expr_19 db "and",0
  4685 00002156 6F7200                  expr_20 db "or",0
  4686 00002159 73686C00                expr_21 db "shl",0
  4687 0000215D 73687200                expr_22 db "shr",0
  4688 00002161 636D7000                expr_23 db "cmp",0
  4689                                  ; ENDP
  4690                                  
  4691                                  compoundass:  ; *** PROC ***
  4692                                  
  4693                                  ;-465   if(mode) error1("only scalar Var allowed");
  4694                                  
  4695                                  ;Function : compoundass, Number of local variables: 3
  4696                                  ;   # type sign width addr used name   list of local variables
  4697                                  ;  200 ptr sign byte   464 NULL op = bp+4
  4698                                  ;  201 var sign word   464 NULL mode = bp+6
  4699                                  ;  202 var sign word   464 NULL id1 = bp+8;
  4700 00002165 C8000000                 ENTER  0,0
  4701 00002169 8B4606                   mov ax, [bp+6]
  4702 0000216C 08C0                     or  al, al
  4703 0000216E 0F840900                 je .compoundass249
  4704 00002172 68[DF21]                 push compoundass_0
  4705 00002175 E8BF26                   call error1
  4706 00002178 83C402                   add  sp, 2
  4707                                  
  4708                                  ;-466   prnl(); prs(op); prs("  "); 
  4709                                  
  4710                                  .compoundass249:
  4711 0000217B E8C023                   call prnl
  4712 0000217E FF7604                   push word [bp+4]
  4713 00002181 E8C823                   call prs
  4714 00002184 83C402                   add  sp, 2
  4715 00002187 68[F721]                 push compoundass_1
  4716 0000218A E8BF23                   call prs
  4717 0000218D 83C402                   add  sp, 2
  4718                                  
  4719                                  ;-467   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  4720                                  
  4721 00002190 FF7608                   push word [bp+8]
  4722 00002193 E8EAE6                   call gettypes
  4723 00002196 83C402                   add  sp, 2
  4724 00002199 A1[3900]                 mov ax, [wi]
  4725 0000219C 83F802                   cmp ax, 2
  4726 0000219F 0F850C00                 jne .compoundass250
  4727 000021A3 68[FA21]                 push compoundass_2
  4728 000021A6 E8A323                   call prs
  4729 000021A9 83C402                   add  sp, 2
  4730 000021AC E90900                   jmp .compoundass251
  4731                                  .compoundass250:
  4732 000021AF 68[FF21]                 push compoundass_3
  4733 000021B2 E89723                   call prs
  4734 000021B5 83C402                   add  sp, 2
  4735                                  
  4736                                  ;-468   v(id1); prs(", ");
  4737                                  
  4738                                  .compoundass251:
  4739 000021B8 FF7608                   push word [bp+8]
  4740 000021BB E814E2                   call v
  4741 000021BE 83C402                   add  sp, 2
  4742 000021C1 68[0422]                 push compoundass_4
  4743 000021C4 E88523                   call prs
  4744 000021C7 83C402                   add  sp, 2
  4745                                  
  4746                                  ;-469   expect(T_CONST); prunsign1(lexval);
  4747                                  
  4748 000021CA 680101                   push 257
  4749 000021CD E86922                   call expect
  4750 000021D0 83C402                   add  sp, 2
  4751 000021D3 FF36[2E00]               push word [lexval]
  4752 000021D7 E8CC24                   call prunsign1
  4753 000021DA 83C402                   add  sp, 2
  4754                                  
  4755                                  ;-470 }
  4756                                  
  4757                                  
  4758                                  ;-471 int dovar1(int mode, int op, int ixarr, int id1) { 
  4759 000021DD C9                       LEAVE
  4760 000021DE C3                       ret
  4761 000021DF 6F6E6C79207363616C-     compoundass_0 db "only scalar Var allowed",0
  4762 000021E8 61722056617220616C-
  4763 000021F1 6C6F77656400       
  4764 000021F7 202000                  compoundass_1 db "  ",0
  4765 000021FA 776F726400              compoundass_2 db "word",0
  4766 000021FF 6279746500              compoundass_3 db "byte",0
  4767 00002204 2C2000                  compoundass_4 db ", ",0
  4768                                  ; ENDP
  4769                                  
  4770                                  dovar1:  ; *** PROC ***
  4771                                  
  4772                                  ;-472   gettypes(id1);
  4773                                  
  4774                                  ;Function : dovar1, Number of local variables: 4
  4775                                  ;   # type sign width addr used name   list of local variables
  4776                                  ;  200 var sign word   471 NULL mode = bp+4
  4777                                  ;  201 var sign word   471 NULL op = bp+6
  4778                                  ;  202 var sign word   471 NULL ixarr = bp+8
  4779                                  ;  203 var sign word   471 NULL id1 = bp+10;
  4780 00002207 C8000000                 ENTER  0,0
  4781 0000220B FF760A                   push word [bp+10]
  4782 0000220E E86FE6                   call gettypes
  4783 00002211 83C402                   add  sp, 2
  4784                                  
  4785                                  ;-473   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);
  4786                                  
  4787 00002214 8B4604                   mov ax, [bp+4]
  4788 00002217 83F801                   cmp ax, 1
  4789 0000221A 0F854700                 jne .dovar1252
  4790 0000221E 68[5C23]                 push dovar1_0
  4791 00002221 E82823                   call prs
  4792 00002224 83C402                   add  sp, 2
  4793 00002227 FF760A                   push word [bp+10]
  4794 0000222A E8A5E1                   call v
  4795 0000222D 83C402                   add  sp, 2
  4796 00002230 E80B23                   call prnl
  4797 00002233 FF7606                   push word [bp+6]
  4798 00002236 E81323                   call prs
  4799 00002239 83C402                   add  sp, 2
  4800                                  
  4801                                  ;-474     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");
  4802                                  
  4803 0000223C A1[3600]                 mov ax, [widthi]
  4804 0000223F 83F801                   cmp ax, 1
  4805 00002242 0F850900                 jne .dovar1253
  4806 00002246 68[6823]                 push dovar1_1
  4807 00002249 E80023                   call prs
  4808 0000224C 83C402                   add  sp, 2
  4809                                  
  4810                                  ;-475     if(widthi == 2) prs(" ax, [bx]");
  4811                                  
  4812                                  .dovar1253:
  4813 0000224F A1[3600]                 mov ax, [widthi]
  4814 00002252 83F802                   cmp ax, 2
  4815 00002255 0F850900                 jne .dovar1254
  4816 00002259 68[7E23]                 push dovar1_2
  4817 0000225C E8ED22                   call prs
  4818 0000225F 83C402                   add  sp, 2
  4819                                  
  4820                                  ;-476     return; }
  4821                                  
  4822                                  .dovar1254:
  4823 00002262 E9F500                   jmp .retndovar1
  4824                                  
  4825                                  ;-477   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }
  4826                                  
  4827                                  .dovar1252:
  4828 00002265 8B4604                   mov ax, [bp+4]
  4829 00002268 83F802                   cmp ax, 2
  4830 0000226B 0F852100                 jne .dovar1255
  4831 0000226F E8CC22                   call prnl
  4832 00002272 FF7606                   push word [bp+6]
  4833 00002275 E8D422                   call prs
  4834 00002278 83C402                   add  sp, 2
  4835 0000227B 68[8823]                 push dovar1_3
  4836 0000227E E8CB22                   call prs
  4837 00002281 83C402                   add  sp, 2
  4838 00002284 FF760A                   push word [bp+10]
  4839 00002287 E839E1                   call a
  4840 0000228A 83C402                   add  sp, 2
  4841 0000228D E9CA00                   jmp .retndovar1
  4842                                  
  4843                                  ;-478   if (ixarr) {
  4844                                  
  4845                                  .dovar1255:
  4846 00002290 8B4608                   mov ax, [bp+8]
  4847 00002293 08C0                     or  al, al
  4848 00002295 0F847300                 je .dovar1256
  4849                                  
  4850                                  ;-479     prs("\n mov bx, "); v(ixarr);
  4851                                  
  4852 00002299 68[8E23]                 push dovar1_4
  4853 0000229C E8AD22                   call prs
  4854 0000229F 83C402                   add  sp, 2
  4855 000022A2 FF7608                   push word [bp+8]
  4856 000022A5 E82AE1                   call v
  4857 000022A8 83C402                   add  sp, 2
  4858                                  
  4859                                  ;-480     if (wi==2) prs("\n shl bx, 1");
  4860                                  
  4861 000022AB A1[3900]                 mov ax, [wi]
  4862 000022AE 83F802                   cmp ax, 2
  4863 000022B1 0F850900                 jne .dovar1257
  4864 000022B5 68[9A23]                 push dovar1_5
  4865 000022B8 E89122                   call prs
  4866 000022BB 83C402                   add  sp, 2
  4867                                  
  4868                                  ;-481     prs("\n "); prs(op);
  4869                                  
  4870                                  .dovar1257:
  4871 000022BE 68[A723]                 push dovar1_6
  4872 000022C1 E88822                   call prs
  4873 000022C4 83C402                   add  sp, 2
  4874 000022C7 FF7606                   push word [bp+6]
  4875 000022CA E87F22                   call prs
  4876 000022CD 83C402                   add  sp, 2
  4877                                  
  4878                                  ;-482     if (wi==2) prs(" ax, "); else prs(" al, ");
  4879                                  
  4880 000022D0 A1[3900]                 mov ax, [wi]
  4881 000022D3 83F802                   cmp ax, 2
  4882 000022D6 0F850C00                 jne .dovar1258
  4883 000022DA 68[AB23]                 push dovar1_7
  4884 000022DD E86C22                   call prs
  4885 000022E0 83C402                   add  sp, 2
  4886 000022E3 E90900                   jmp .dovar1259
  4887                                  .dovar1258:
  4888 000022E6 68[B123]                 push dovar1_8
  4889 000022E9 E86022                   call prs
  4890 000022EC 83C402                   add  sp, 2
  4891                                  
  4892                                  ;-483 // v(id1); prs(" [bx]");
  4893                                  
  4894                                  
  4895                                  ;-484     prc('['); printName(id1); prs(" + bx]"); 
  4896                                  
  4897                                  .dovar1259:
  4898 000022EF 6A5B                     push 91
  4899 000022F1 E8F121                   call prc
  4900 000022F4 83C402                   add  sp, 2
  4901 000022F7 FF760A                   push word [bp+10]
  4902 000022FA E85DE6                   call printName
  4903 000022FD 83C402                   add  sp, 2
  4904 00002300 68[B723]                 push dovar1_9
  4905 00002303 E84622                   call prs
  4906 00002306 83C402                   add  sp, 2
  4907                                  
  4908                                  ;-485     return; }
  4909                                  
  4910 00002309 E94E00                   jmp .retndovar1
  4911                                  
  4912                                  ;-486   prnl();prs(op);
  4913                                  
  4914                                  .dovar1256:
  4915 0000230C E82F22                   call prnl
  4916 0000230F FF7606                   push word [bp+6]
  4917 00002312 E83722                   call prs
  4918 00002315 83C402                   add  sp, 2
  4919                                  
  4920                                  ;-487   if(wi==1) prs(" al, ");
  4921                                  
  4922 00002318 A1[3900]                 mov ax, [wi]
  4923 0000231B 83F801                   cmp ax, 1
  4924 0000231E 0F850900                 jne .dovar1260
  4925 00002322 68[BE23]                 push dovar1_10
  4926 00002325 E82422                   call prs
  4927 00002328 83C402                   add  sp, 2
  4928                                  
  4929                                  ;-488   if(wi==2) prs(" ax, ");
  4930                                  
  4931                                  .dovar1260:
  4932 0000232B A1[3900]                 mov ax, [wi]
  4933 0000232E 83F802                   cmp ax, 2
  4934 00002331 0F850900                 jne .dovar1261
  4935 00002335 68[C423]                 push dovar1_11
  4936 00002338 E81122                   call prs
  4937 0000233B 83C402                   add  sp, 2
  4938                                  
  4939                                  ;-489   if(wi==4) prs(" eax, ");
  4940                                  
  4941                                  .dovar1261:
  4942 0000233E A1[3900]                 mov ax, [wi]
  4943 00002341 83F804                   cmp ax, 4
  4944 00002344 0F850900                 jne .dovar1262
  4945 00002348 68[CA23]                 push dovar1_12
  4946 0000234B E8FE21                   call prs
  4947 0000234E 83C402                   add  sp, 2
  4948                                  
  4949                                  ;-490   v(id1);
  4950                                  
  4951                                  .dovar1262:
  4952 00002351 FF760A                   push word [bp+10]
  4953 00002354 E87BE0                   call v
  4954 00002357 83C402                   add  sp, 2
  4955                                  
  4956                                  ;-491 }
  4957                                  
  4958                                  
  4959                                  ;-492 int rterm(char *op) {int mode; int opint; int ixarr; int id1;
  4960                                  
  4961 0000235A C9                       .retndovar1: LEAVE
  4962 0000235B C3                       ret
  4963 0000235C 5C6E206D6F76206278-     dovar1_0 db "\n mov bx, ",0
  4964 00002365 2C2000             
  4965 00002368 20616C2C205B62785D-     dovar1_1 db " al, [bx]\n mov ah, 0",0
  4966 00002371 5C6E206D6F76206168-
  4967 0000237A 2C203000           
  4968 0000237E 2061782C205B62785D-     dovar1_2 db " ax, [bx]",0
  4969 00002387 00                 
  4970 00002388 2061782C2000            dovar1_3 db " ax, ",0
  4971 0000238E 5C6E206D6F76206278-     dovar1_4 db "\n mov bx, ",0
  4972 00002397 2C2000             
  4973 0000239A 5C6E2073686C206278-     dovar1_5 db "\n shl bx, 1",0
  4974 000023A3 2C203100           
  4975 000023A7 5C6E2000                dovar1_6 db "\n ",0
  4976 000023AB 2061782C2000            dovar1_7 db " ax, ",0
  4977 000023B1 20616C2C2000            dovar1_8 db " al, ",0
  4978 000023B7 202B2062785D00          dovar1_9 db " + bx]",0
  4979 000023BE 20616C2C2000            dovar1_10 db " al, ",0
  4980 000023C4 2061782C2000            dovar1_11 db " ax, ",0
  4981 000023CA 206561782C2000          dovar1_12 db " eax, ",0
  4982                                  ; ENDP
  4983                                  
  4984                                  rterm:  ; *** PROC ***
  4985                                  
  4986                                  ;-493   if (istoken(T_CONST)) { prnl(); prs(op); 
  4987                                  
  4988                                  ;Function : rterm, Number of local variables: 5
  4989                                  ;   # type sign width addr used name   list of local variables
  4990                                  ;  200 ptr sign byte   492 NULL op = bp+4
  4991                                  ;  201 var sign word   492 NULL mode = bp-2
  4992                                  ;  202 var sign word   492 NULL opint = bp-4
  4993                                  ;  203 var sign word   492 NULL ixarr = bp-6
  4994                                  ;  204 var sign word   492 NULL id1 = bp-8;
  4995 000023D1 C8080000                 ENTER  8,0
  4996 000023D5 680101                   push 257
  4997 000023D8 E83C20                   call istoken
  4998 000023DB 83C402                   add  sp, 2
  4999 000023DE 08C0                     or  al, al
  5000 000023E0 0F845200                 je .rterm263
  5001 000023E4 E85721                   call prnl
  5002 000023E7 FF7604                   push word [bp+4]
  5003 000023EA E85F21                   call prs
  5004 000023ED 83C402                   add  sp, 2
  5005                                  
  5006                                  ;-494     if (wi==1) prs(" al, ");
  5007                                  
  5008 000023F0 A1[3900]                 mov ax, [wi]
  5009 000023F3 83F801                   cmp ax, 1
  5010 000023F6 0F850900                 jne .rterm264
  5011 000023FA 68[BA24]                 push rterm_0
  5012 000023FD E84C21                   call prs
  5013 00002400 83C402                   add  sp, 2
  5014                                  
  5015                                  ;-495     if (wi==2) prs(" ax, ");
  5016                                  
  5017                                  .rterm264:
  5018 00002403 A1[3900]                 mov ax, [wi]
  5019 00002406 83F802                   cmp ax, 2
  5020 00002409 0F850900                 jne .rterm265
  5021 0000240D 68[C024]                 push rterm_1
  5022 00002410 E83921                   call prs
  5023 00002413 83C402                   add  sp, 2
  5024                                  
  5025                                  ;-496     if (wi==4) prs(" eax, ");
  5026                                  
  5027                                  .rterm265:
  5028 00002416 A1[3900]                 mov ax, [wi]
  5029 00002419 83F804                   cmp ax, 4
  5030 0000241C 0F850900                 jne .rterm266
  5031 00002420 68[C624]                 push rterm_2
  5032 00002423 E82621                   call prs
  5033 00002426 83C402                   add  sp, 2
  5034                                  
  5035                                  ;-497     prunsign1(lexval); return;}
  5036                                  
  5037                                  .rterm266:
  5038 00002429 FF36[2E00]               push word [lexval]
  5039 0000242D E87622                   call prunsign1
  5040 00002430 83C402                   add  sp, 2
  5041 00002433 E98200                   jmp .retnrterm
  5042                                  
  5043                                  ;-498   mode=typeName(); id1=searchname(); ixarr=0;
  5044                                  
  5045                                  .rterm263:
  5046 00002436 E854E6                   call typeName
  5047 00002439 8946FE                   mov [bp-2], ax
  5048 0000243C E87FE5                   call searchname
  5049 0000243F 8946F8                   mov [bp-8], ax
  5050 00002442 B80000                   mov ax, 0
  5051 00002445 8946FA                   mov [bp-6], ax
  5052                                  
  5053                                  ;-499   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');  
  5054                                  
  5055 00002448 6A5B                     push 91
  5056 0000244A E8CA1F                   call istoken
  5057 0000244D 83C402                   add  sp, 2
  5058 00002450 08C0                     or  al, al
  5059 00002452 0F843300                 je .rterm267
  5060 00002456 E865E5                   call searchname
  5061 00002459 8946FA                   mov [bp-6], ax
  5062 0000245C 680001                   push 256
  5063 0000245F E8D71F                   call expect
  5064 00002462 83C402                   add  sp, 2
  5065 00002465 6A5D                     push 93
  5066 00002467 E8CF1F                   call expect
  5067 0000246A 83C402                   add  sp, 2
  5068                                  
  5069                                  ;-500     gettypes(ixarr);
  5070                                  
  5071 0000246D FF76FA                   push word [bp-6]
  5072 00002470 E80DE4                   call gettypes
  5073 00002473 83C402                   add  sp, 2
  5074                                  
  5075                                  ;-501     if (widthi != 2) error1("Arrayindex muss int sein"); }
  5076                                  
  5077 00002476 A1[3600]                 mov ax, [widthi]
  5078 00002479 83F802                   cmp ax, 2
  5079 0000247C 0F840900                 je  .rterm268
  5080 00002480 68[CD24]                 push rterm_3
  5081 00002483 E8B123                   call error1
  5082 00002486 83C402                   add  sp, 2
  5083                                  .rterm268:
  5084                                  
  5085                                  ;-502   if (eqstr(symbol,"_AX")) return;
  5086                                  
  5087                                  .rterm267:
  5088 00002489 68[E624]                 push rterm_4
  5089 0000248C 8D062B81                 lea  ax, [symbol]
  5090 00002490 50                       push ax
  5091 00002491 E802DD                   call eqstr
  5092 00002494 83C404                   add  sp, 4
  5093 00002497 08C0                     or  al, al
  5094 00002499 0F840300                 je .rterm269
  5095 0000249D E91800                   jmp .retnrterm
  5096                                  
  5097                                  ;-503   opint=op; dovar1(mode, opint, ixarr, id1);
  5098                                  
  5099                                  .rterm269:
  5100 000024A0 8B4604                   mov ax, [bp+4]
  5101 000024A3 8946FC                   mov [bp-4], ax
  5102 000024A6 FF76F8                   push word [bp-8]
  5103 000024A9 FF76FA                   push word [bp-6]
  5104 000024AC FF76FC                   push word [bp-4]
  5105 000024AF FF76FE                   push word [bp-2]
  5106 000024B2 E852FD                   call dovar1
  5107 000024B5 83C408                   add  sp, 8
  5108                                  
  5109                                  ;-504 }
  5110                                  
  5111                                  
  5112                                  ;-505 int isreg() {
  5113                                  
  5114 000024B8 C9                       .retnrterm: LEAVE
  5115 000024B9 C3                       ret
  5116 000024BA 20616C2C2000            rterm_0 db " al, ",0
  5117 000024C0 2061782C2000            rterm_1 db " ax, ",0
  5118 000024C6 206561782C2000          rterm_2 db " eax, ",0
  5119 000024CD 4172726179696E6465-     rterm_3 db "Arrayindex muss int sein",0
  5120 000024D6 78206D75737320696E-
  5121 000024DF 74207365696E00     
  5122 000024E6 5F415800                rterm_4 db "_AX",0
  5123                                  ; ENDP
  5124                                  
  5125                                  isreg:  ; *** PROC ***
  5126                                  
  5127                                  ;-506   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}
  5128                                  
  5129 000024EA 68[D726]                 push isreg_0
  5130 000024ED 8D062B81                 lea  ax, [symbol]
  5131 000024F1 50                       push ax
  5132 000024F2 E8A1DC                   call eqstr
  5133 000024F5 83C404                   add  sp, 4
  5134 000024F8 08C0                     or  al, al
  5135 000024FA 0F840C00                 je .isreg270
  5136 000024FE 68[DB26]                 push isreg_1
  5137 00002501 E84202                   call doreg
  5138 00002504 83C402                   add  sp, 2
  5139 00002507 E9C601                   jmp .r1
  5140                                  
  5141                                  ;-507   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}  
  5142                                  
  5143                                  .isreg270:
  5144 0000250A 68[DE26]                 push isreg_2
  5145 0000250D 8D062B81                 lea  ax, [symbol]
  5146 00002511 50                       push ax
  5147 00002512 E881DC                   call eqstr
  5148 00002515 83C404                   add  sp, 4
  5149 00002518 08C0                     or  al, al
  5150 0000251A 0F840C00                 je .isreg271
  5151 0000251E 68[E226]                 push isreg_3
  5152 00002521 E82202                   call doreg
  5153 00002524 83C402                   add  sp, 2
  5154 00002527 E9A601                   jmp .r1
  5155                                  
  5156                                  ;-508   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}
  5157                                  
  5158                                  .isreg271:
  5159 0000252A 68[E526]                 push isreg_4
  5160 0000252D 8D062B81                 lea  ax, [symbol]
  5161 00002531 50                       push ax
  5162 00002532 E861DC                   call eqstr
  5163 00002535 83C404                   add  sp, 4
  5164 00002538 08C0                     or  al, al
  5165 0000253A 0F840C00                 je .isreg272
  5166 0000253E 68[E926]                 push isreg_5
  5167 00002541 E80202                   call doreg
  5168 00002544 83C402                   add  sp, 2
  5169 00002547 E98601                   jmp .r1
  5170                                  
  5171                                  ;-509   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}
  5172                                  
  5173                                  .isreg272:
  5174 0000254A 68[EC26]                 push isreg_6
  5175 0000254D 8D062B81                 lea  ax, [symbol]
  5176 00002551 50                       push ax
  5177 00002552 E841DC                   call eqstr
  5178 00002555 83C404                   add  sp, 4
  5179 00002558 08C0                     or  al, al
  5180 0000255A 0F840C00                 je .isreg273
  5181 0000255E 68[F026]                 push isreg_7
  5182 00002561 E8E201                   call doreg
  5183 00002564 83C402                   add  sp, 2
  5184 00002567 E96601                   jmp .r1
  5185                                  
  5186                                  ;-510   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}
  5187                                  
  5188                                  .isreg273:
  5189 0000256A 68[F326]                 push isreg_8
  5190 0000256D 8D062B81                 lea  ax, [symbol]
  5191 00002571 50                       push ax
  5192 00002572 E821DC                   call eqstr
  5193 00002575 83C404                   add  sp, 4
  5194 00002578 08C0                     or  al, al
  5195 0000257A 0F840C00                 je .isreg274
  5196 0000257E 68[F726]                 push isreg_9
  5197 00002581 E8C201                   call doreg
  5198 00002584 83C402                   add  sp, 2
  5199 00002587 E94601                   jmp .r1
  5200                                  
  5201                                  ;-511   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}    
  5202                                  
  5203                                  .isreg274:
  5204 0000258A 68[FA26]                 push isreg_10
  5205 0000258D 8D062B81                 lea  ax, [symbol]
  5206 00002591 50                       push ax
  5207 00002592 E801DC                   call eqstr
  5208 00002595 83C404                   add  sp, 4
  5209 00002598 08C0                     or  al, al
  5210 0000259A 0F840C00                 je .isreg275
  5211 0000259E 68[FE26]                 push isreg_11
  5212 000025A1 E8A201                   call doreg
  5213 000025A4 83C402                   add  sp, 2
  5214 000025A7 E92601                   jmp .r1
  5215                                  
  5216                                  ;-512   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}
  5217                                  
  5218                                  .isreg275:
  5219 000025AA 68[0127]                 push isreg_12
  5220 000025AD 8D062B81                 lea  ax, [symbol]
  5221 000025B1 50                       push ax
  5222 000025B2 E8E1DB                   call eqstr
  5223 000025B5 83C404                   add  sp, 4
  5224 000025B8 08C0                     or  al, al
  5225 000025BA 0F840C00                 je .isreg276
  5226 000025BE 68[0527]                 push isreg_13
  5227 000025C1 E88201                   call doreg
  5228 000025C4 83C402                   add  sp, 2
  5229 000025C7 E90601                   jmp .r1
  5230                                  
  5231                                  ;-513   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}
  5232                                  
  5233                                  .isreg276:
  5234 000025CA 68[0827]                 push isreg_14
  5235 000025CD 8D062B81                 lea  ax, [symbol]
  5236 000025D1 50                       push ax
  5237 000025D2 E8C1DB                   call eqstr
  5238 000025D5 83C404                   add  sp, 4
  5239 000025D8 08C0                     or  al, al
  5240 000025DA 0F840C00                 je .isreg277
  5241 000025DE 68[0C27]                 push isreg_15
  5242 000025E1 E86201                   call doreg
  5243 000025E4 83C402                   add  sp, 2
  5244 000025E7 E9E600                   jmp .r1
  5245                                  
  5246                                  ;-514   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}    
  5247                                  
  5248                                  .isreg277:
  5249 000025EA 68[0F27]                 push isreg_16
  5250 000025ED 8D062B81                 lea  ax, [symbol]
  5251 000025F1 50                       push ax
  5252 000025F2 E8A1DB                   call eqstr
  5253 000025F5 83C404                   add  sp, 4
  5254 000025F8 08C0                     or  al, al
  5255 000025FA 0F840C00                 je .isreg278
  5256 000025FE 68[1327]                 push isreg_17
  5257 00002601 E84201                   call doreg
  5258 00002604 83C402                   add  sp, 2
  5259 00002607 E9C600                   jmp .r1
  5260                                  
  5261                                  ;-515   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}
  5262                                  
  5263                                  .isreg278:
  5264 0000260A 68[1627]                 push isreg_18
  5265 0000260D 8D062B81                 lea  ax, [symbol]
  5266 00002611 50                       push ax
  5267 00002612 E881DB                   call eqstr
  5268 00002615 83C404                   add  sp, 4
  5269 00002618 08C0                     or  al, al
  5270 0000261A 0F840C00                 je .isreg279
  5271 0000261E 68[1A27]                 push isreg_19
  5272 00002621 E82201                   call doreg
  5273 00002624 83C402                   add  sp, 2
  5274 00002627 E9A600                   jmp .r1
  5275                                  
  5276                                  ;-516   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}
  5277                                  
  5278                                  .isreg279:
  5279 0000262A 68[1D27]                 push isreg_20
  5280 0000262D 8D062B81                 lea  ax, [symbol]
  5281 00002631 50                       push ax
  5282 00002632 E861DB                   call eqstr
  5283 00002635 83C404                   add  sp, 4
  5284 00002638 08C0                     or  al, al
  5285 0000263A 0F840C00                 je .isreg280
  5286 0000263E 68[2127]                 push isreg_21
  5287 00002641 E80201                   call doreg
  5288 00002644 83C402                   add  sp, 2
  5289 00002647 E98600                   jmp .r1
  5290                                  
  5291                                  ;-517   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}  
  5292                                  
  5293                                  .isreg280:
  5294 0000264A 68[2427]                 push isreg_22
  5295 0000264D 8D062B81                 lea  ax, [symbol]
  5296 00002651 50                       push ax
  5297 00002652 E841DB                   call eqstr
  5298 00002655 83C404                   add  sp, 4
  5299 00002658 08C0                     or  al, al
  5300 0000265A 0F840C00                 je .isreg281
  5301 0000265E 68[2827]                 push isreg_23
  5302 00002661 E8E200                   call doreg
  5303 00002664 83C402                   add  sp, 2
  5304 00002667 E96600                   jmp .r1
  5305                                  
  5306                                  ;-518   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}
  5307                                  
  5308                                  .isreg281:
  5309 0000266A 68[2B27]                 push isreg_24
  5310 0000266D 8D062B81                 lea  ax, [symbol]
  5311 00002671 50                       push ax
  5312 00002672 E821DB                   call eqstr
  5313 00002675 83C404                   add  sp, 4
  5314 00002678 08C0                     or  al, al
  5315 0000267A 0F840C00                 je .isreg282
  5316 0000267E 68[2F27]                 push isreg_25
  5317 00002681 E8C200                   call doreg
  5318 00002684 83C402                   add  sp, 2
  5319 00002687 E94600                   jmp .r1
  5320                                  
  5321                                  ;-519   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}
  5322                                  
  5323                                  .isreg282:
  5324 0000268A 68[3227]                 push isreg_26
  5325 0000268D 8D062B81                 lea  ax, [symbol]
  5326 00002691 50                       push ax
  5327 00002692 E801DB                   call eqstr
  5328 00002695 83C404                   add  sp, 4
  5329 00002698 08C0                     or  al, al
  5330 0000269A 0F840C00                 je .isreg283
  5331 0000269E 68[3627]                 push isreg_27
  5332 000026A1 E8A200                   call doreg
  5333 000026A4 83C402                   add  sp, 2
  5334 000026A7 E92600                   jmp .r1
  5335                                  
  5336                                  ;-520   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}  
  5337                                  
  5338                                  .isreg283:
  5339 000026AA 68[3927]                 push isreg_28
  5340 000026AD 8D062B81                 lea  ax, [symbol]
  5341 000026B1 50                       push ax
  5342 000026B2 E8E1DA                   call eqstr
  5343 000026B5 83C404                   add  sp, 4
  5344 000026B8 08C0                     or  al, al
  5345 000026BA 0F840C00                 je .isreg284
  5346 000026BE 68[4027]                 push isreg_29
  5347 000026C1 E88200                   call doreg
  5348 000026C4 83C402                   add  sp, 2
  5349 000026C7 E90600                   jmp .r1
  5350                                  
  5351                                  ;-521   return 0;   r1: return 1; 
  5352                                  
  5353                                  .isreg284:
  5354 000026CA B80000                   mov ax, 0
  5355 000026CD E90600                   jmp .retnisreg
  5356                                  .r1:
  5357 000026D0 B80100                   mov ax, 1
  5358 000026D3 E90000                   jmp .retnisreg
  5359                                  
  5360                                  ;-522 }
  5361                                  
  5362                                  
  5363                                  ;-523 int doreg(char *dr) { int i; expect('=');
  5364                                  
  5365                                   .retnisreg:
  5366 000026D6 C3                       ret
  5367 000026D7 5F414800                isreg_0 db "_AH",0
  5368 000026DB 616800                  isreg_1 db "ah",0
  5369 000026DE 5F414C00                isreg_2 db "_AL",0
  5370 000026E2 616C00                  isreg_3 db "al",0
  5371 000026E5 5F415800                isreg_4 db "_AX",0
  5372 000026E9 617800                  isreg_5 db "ax",0
  5373 000026EC 5F424800                isreg_6 db "_BH",0
  5374 000026F0 626800                  isreg_7 db "bh",0
  5375 000026F3 5F424C00                isreg_8 db "_BL",0
  5376 000026F7 626C00                  isreg_9 db "bl",0
  5377 000026FA 5F425800                isreg_10 db "_BX",0
  5378 000026FE 627800                  isreg_11 db "bx",0
  5379 00002701 5F434800                isreg_12 db "_CH",0
  5380 00002705 636800                  isreg_13 db "ch",0
  5381 00002708 5F434C00                isreg_14 db "_CL",0
  5382 0000270C 636C00                  isreg_15 db "cl",0
  5383 0000270F 5F435800                isreg_16 db "_CX",0
  5384 00002713 637800                  isreg_17 db "cx",0
  5385 00002716 5F444800                isreg_18 db "_DH",0
  5386 0000271A 646800                  isreg_19 db "dh",0
  5387 0000271D 5F444C00                isreg_20 db "_DL",0
  5388 00002721 646C00                  isreg_21 db "dl",0
  5389 00002724 5F445800                isreg_22 db "_DX",0
  5390 00002728 647800                  isreg_23 db "dx",0
  5391 0000272B 5F534900                isreg_24 db "_SI",0
  5392 0000272F 736900                  isreg_25 db "si",0
  5393 00002732 5F444900                isreg_26 db "_DI",0
  5394 00002736 646900                  isreg_27 db "di",0
  5395 00002739 5F464C41475300          isreg_28 db "_FLAGS",0
  5396 00002740 666C61677300            isreg_29 db "flags",0
  5397                                  ; ENDP
  5398                                  
  5399                                  doreg:  ; *** PROC ***
  5400                                  ;Function : doreg, Number of local variables: 2
  5401                                  ;   # type sign width addr used name   list of local variables
  5402                                  ;  200 ptr sign byte   523 NULL dr = bp+4
  5403                                  ;  201 var sign word   523 NULL i = bp-2;
  5404 00002746 C8020000                 ENTER  2,0
  5405 0000274A 6A3D                     push 61
  5406 0000274C E8EA1C                   call expect
  5407 0000274F 83C402                   add  sp, 2
  5408                                  
  5409                                  ;-524   prs("\n mov  "); prs(dr); prs(", ");
  5410                                  
  5411 00002752 68[B527]                 push doreg_0
  5412 00002755 E8F41D                   call prs
  5413 00002758 83C402                   add  sp, 2
  5414 0000275B FF7604                   push word [bp+4]
  5415 0000275E E8EB1D                   call prs
  5416 00002761 83C402                   add  sp, 2
  5417 00002764 68[BE27]                 push doreg_1
  5418 00002767 E8E21D                   call prs
  5419 0000276A 83C402                   add  sp, 2
  5420                                  
  5421                                  ;-525        if (istoken(T_CONST)) prunsign1(lexval);
  5422                                  
  5423 0000276D 680101                   push 257
  5424 00002770 E8A41C                   call istoken
  5425 00002773 83C402                   add  sp, 2
  5426 00002776 08C0                     or  al, al
  5427 00002778 0F840D00                 je .doreg285
  5428 0000277C FF36[2E00]               push word [lexval]
  5429 00002780 E8231F                   call prunsign1
  5430 00002783 83C402                   add  sp, 2
  5431                                  
  5432                                  ;-526   else if (istoken(T_NAME )) { i=searchname(); v(i); }
  5433                                  
  5434 00002786 E92A00                   jmp .doreg286
  5435                                  .doreg285:
  5436 00002789 680001                   push 256
  5437 0000278C E8881C                   call istoken
  5438 0000278F 83C402                   add  sp, 2
  5439 00002792 08C0                     or  al, al
  5440 00002794 0F841200                 je .doreg287
  5441 00002798 E823E2                   call searchname
  5442 0000279B 8946FE                   mov [bp-2], ax
  5443 0000279E FF76FE                   push word [bp-2]
  5444 000027A1 E82EDC                   call v
  5445 000027A4 83C402                   add  sp, 2
  5446                                  
  5447                                  ;-527   else error1("only number or var allowed"); }
  5448                                  
  5449 000027A7 E90900                   jmp .doreg288
  5450                                  .doreg287:
  5451 000027AA 68[C127]                 push doreg_2
  5452 000027AD E88720                   call error1
  5453 000027B0 83C402                   add  sp, 2
  5454                                  .doreg288:
  5455                                  .doreg286:
  5456                                  
  5457                                  ;-528 
  5458                                  
  5459                                  
  5460                                  ;-529 int doassign(int mode, int i, int ixarr, int ixconst) {
  5461 000027B3 C9                       LEAVE
  5462 000027B4 C3                       ret
  5463 000027B5 5C6E206D6F76202000      doreg_0 db "\n mov  ",0
  5464 000027BE 2C2000                  doreg_1 db ", ",0
  5465 000027C1 6F6E6C79206E756D62-     doreg_2 db "only number or var allowed",0
  5466 000027CA 6572206F7220766172-
  5467 000027D3 20616C6C6F77656400 
  5468                                  ; ENDP
  5469                                  
  5470                                  doassign:  ; *** PROC ***
  5471                                  
  5472                                  ;-530   gettypes(i);
  5473                                  
  5474                                  ;Function : doassign, Number of local variables: 4
  5475                                  ;   # type sign width addr used name   list of local variables
  5476                                  ;  200 var sign word   529 NULL mode = bp+4
  5477                                  ;  201 var sign word   529 NULL i = bp+6
  5478                                  ;  202 var sign word   529 NULL ixarr = bp+8
  5479                                  ;  203 var sign word   529 NULL ixconst = bp+10;
  5480 000027DC C8000000                 ENTER  0,0
  5481 000027E0 FF7606                   push word [bp+6]
  5482 000027E3 E89AE0                   call gettypes
  5483 000027E6 83C402                   add  sp, 2
  5484                                  
  5485                                  ;-531   if (mode==1) {prs("\n mov  bx, ");v(i);                  
  5486                                  
  5487 000027E9 8B4604                   mov ax, [bp+4]
  5488 000027EC 83F801                   cmp ax, 1
  5489 000027EF 0F853400                 jne .doassign289
  5490 000027F3 68[7929]                 push doassign_0
  5491 000027F6 E8531D                   call prs
  5492 000027F9 83C402                   add  sp, 2
  5493 000027FC FF7606                   push word [bp+6]
  5494 000027FF E8D0DB                   call v
  5495 00002802 83C402                   add  sp, 2
  5496                                  
  5497                                  ;-532     if (widthi == 2) prs("\n mov  [bx], ax");
  5498                                  
  5499 00002805 A1[3600]                 mov ax, [widthi]
  5500 00002808 83F802                   cmp ax, 2
  5501 0000280B 0F850C00                 jne .doassign290
  5502 0000280F 68[8629]                 push doassign_1
  5503 00002812 E8371D                   call prs
  5504 00002815 83C402                   add  sp, 2
  5505                                  
  5506                                  ;-533     else  prs("\n mov  [bx], al"); return;}
  5507                                  
  5508 00002818 E90900                   jmp .doassign291
  5509                                  .doassign290:
  5510 0000281B 68[9729]                 push doassign_2
  5511 0000281E E82B1D                   call prs
  5512 00002821 83C402                   add  sp, 2
  5513                                  .doassign291:
  5514 00002824 E95001                   jmp .retndoassign
  5515                                  
  5516                                  ;-534   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}
  5517                                  
  5518                                  .doassign289:
  5519 00002827 8B4604                   mov ax, [bp+4]
  5520 0000282A 83F802                   cmp ax, 2
  5521 0000282D 0F851E00                 jne .doassign292
  5522 00002831 68[A829]                 push doassign_3
  5523 00002834 E8151D                   call prs
  5524 00002837 83C402                   add  sp, 2
  5525 0000283A FF7606                   push word [bp+6]
  5526 0000283D E883DB                   call a
  5527 00002840 83C402                   add  sp, 2
  5528 00002843 68[B129]                 push doassign_4
  5529 00002846 E8031D                   call prs
  5530 00002849 83C402                   add  sp, 2
  5531 0000284C E92801                   jmp .retndoassign
  5532                                  
  5533                                  ;-535   if (ixarr) {  prs("\n mov bx, ");
  5534                                  
  5535                                  .doassign292:
  5536 0000284F 8B4608                   mov ax, [bp+8]
  5537 00002852 08C0                     or  al, al
  5538 00002854 0F846E00                 je .doassign293
  5539 00002858 68[B629]                 push doassign_5
  5540 0000285B E8EE1C                   call prs
  5541 0000285E 83C402                   add  sp, 2
  5542                                  
  5543                                  ;-536     if(ixconst) prunsign1(ixarr); else v(ixarr);
  5544                                  
  5545 00002861 8B460A                   mov ax, [bp+10]
  5546 00002864 08C0                     or  al, al
  5547 00002866 0F840C00                 je .doassign294
  5548 0000286A FF7608                   push word [bp+8]
  5549 0000286D E8361E                   call prunsign1
  5550 00002870 83C402                   add  sp, 2
  5551 00002873 E90900                   jmp .doassign295
  5552                                  .doassign294:
  5553 00002876 FF7608                   push word [bp+8]
  5554 00002879 E856DB                   call v
  5555 0000287C 83C402                   add  sp, 2
  5556                                  
  5557                                  ;-537     if (wi==2) prs("\n shl bx, 1");
  5558                                  
  5559                                  .doassign295:
  5560 0000287F A1[3900]                 mov ax, [wi]
  5561 00002882 83F802                   cmp ax, 2
  5562 00002885 0F850900                 jne .doassign296
  5563 00002889 68[C229]                 push doassign_6
  5564 0000288C E8BD1C                   call prs
  5565 0000288F 83C402                   add  sp, 2
  5566                                  
  5567                                  ;-538     prs("\n mov ["); printName(i);
  5568                                  
  5569                                  .doassign296:
  5570 00002892 68[CF29]                 push doassign_7
  5571 00002895 E8B41C                   call prs
  5572 00002898 83C402                   add  sp, 2
  5573 0000289B FF7606                   push word [bp+6]
  5574 0000289E E8B9E0                   call printName
  5575 000028A1 83C402                   add  sp, 2
  5576                                  
  5577                                  ;-539     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }
  5578                                  
  5579 000028A4 A1[3900]                 mov ax, [wi]
  5580 000028A7 83F802                   cmp ax, 2
  5581 000028AA 0F850C00                 jne .doassign297
  5582 000028AE 68[D829]                 push doassign_8
  5583 000028B1 E8981C                   call prs
  5584 000028B4 83C402                   add  sp, 2
  5585 000028B7 E90900                   jmp .doassign298
  5586                                  .doassign297:
  5587 000028BA 68[E129]                 push doassign_9
  5588 000028BD E88C1C                   call prs
  5589 000028C0 83C402                   add  sp, 2
  5590                                  .doassign298:
  5591 000028C3 E9B100                   jmp .retndoassign
  5592                                  
  5593                                  ;-540   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");
  5594                                  
  5595                                  .doassign293:
  5596 000028C6 A1[3900]                 mov ax, [wi]
  5597 000028C9 83F801                   cmp ax, 1
  5598 000028CC 0F853100                 jne .doassign299
  5599 000028D0 68[EA29]                 push doassign_10
  5600 000028D3 E8761C                   call prs
  5601 000028D6 83C402                   add  sp, 2
  5602 000028D9 8B4606                   mov ax, [bp+6]
  5603 000028DC 3DC800                   cmp ax, 200
  5604 000028DF 0F8D0900                 jge .doassign300
  5605 000028E3 68[F229]                 push doassign_11
  5606 000028E6 E8631C                   call prs
  5607 000028E9 83C402                   add  sp, 2
  5608                                  
  5609                                  ;-541     } v(i); prs(", al"); return; }
  5610                                  
  5611                                  .doassign300:
  5612 000028EC FF7606                   push word [bp+6]
  5613 000028EF E8E0DA                   call v
  5614 000028F2 83C402                   add  sp, 2
  5615 000028F5 68[F829]                 push doassign_12
  5616 000028F8 E8511C                   call prs
  5617 000028FB 83C402                   add  sp, 2
  5618 000028FE E97600                   jmp .retndoassign
  5619                                  
  5620                                  ;-542   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");
  5621                                  
  5622                                  .doassign299:
  5623 00002901 A1[3900]                 mov ax, [wi]
  5624 00002904 83F802                   cmp ax, 2
  5625 00002907 0F853100                 jne .doassign301
  5626 0000290B 68[FD29]                 push doassign_13
  5627 0000290E E83B1C                   call prs
  5628 00002911 83C402                   add  sp, 2
  5629 00002914 8B4606                   mov ax, [bp+6]
  5630 00002917 3DC800                   cmp ax, 200
  5631 0000291A 0F8D0900                 jge .doassign302
  5632 0000291E 68[052A]                 push doassign_14
  5633 00002921 E8281C                   call prs
  5634 00002924 83C402                   add  sp, 2
  5635                                  
  5636                                  ;-543     } v(i); prs(", ax"); return; }
  5637                                  
  5638                                  .doassign302:
  5639 00002927 FF7606                   push word [bp+6]
  5640 0000292A E8A5DA                   call v
  5641 0000292D 83C402                   add  sp, 2
  5642 00002930 68[0B2A]                 push doassign_15
  5643 00002933 E8161C                   call prs
  5644 00002936 83C402                   add  sp, 2
  5645 00002939 E93B00                   jmp .retndoassign
  5646                                  
  5647                                  ;-544   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");
  5648                                  
  5649                                  .doassign301:
  5650 0000293C A1[3900]                 mov ax, [wi]
  5651 0000293F 83F804                   cmp ax, 4
  5652 00002942 0F853100                 jne .doassign303
  5653 00002946 68[102A]                 push doassign_16
  5654 00002949 E8001C                   call prs
  5655 0000294C 83C402                   add  sp, 2
  5656 0000294F 8B4606                   mov ax, [bp+6]
  5657 00002952 3DC800                   cmp ax, 200
  5658 00002955 0F8D0900                 jge .doassign304
  5659 00002959 68[182A]                 push doassign_17
  5660 0000295C E8ED1B                   call prs
  5661 0000295F 83C402                   add  sp, 2
  5662                                  
  5663                                  ;-545     } v(i); prs(", eax"); return; }
  5664                                  
  5665                                  .doassign304:
  5666 00002962 FF7606                   push word [bp+6]
  5667 00002965 E86ADA                   call v
  5668 00002968 83C402                   add  sp, 2
  5669 0000296B 68[1F2A]                 push doassign_18
  5670 0000296E E8DB1B                   call prs
  5671 00002971 83C402                   add  sp, 2
  5672 00002974 E90000                   jmp .retndoassign
  5673                                  
  5674                                  ;-546 }
  5675                                  
  5676                                  .doassign303:
  5677                                  
  5678                                  ;-547 int domul(int ids) {
  5679                                  
  5680 00002977 C9                       .retndoassign: LEAVE
  5681 00002978 C3                       ret
  5682 00002979 5C6E206D6F76202062-     doassign_0 db "\n mov  bx, ",0
  5683 00002982 782C2000           
  5684 00002986 5C6E206D6F7620205B-     doassign_1 db "\n mov  [bx], ax",0
  5685 0000298F 62785D2C20617800   
  5686 00002997 5C6E206D6F7620205B-     doassign_2 db "\n mov  [bx], al",0
  5687 000029A0 62785D2C20616C00   
  5688 000029A8 5C6E206D6F76202000      doassign_3 db "\n mov  ",0
  5689 000029B1 2C20617800              doassign_4 db ", ax",0
  5690 000029B6 5C6E206D6F76206278-     doassign_5 db "\n mov bx, ",0
  5691 000029BF 2C2000             
  5692 000029C2 5C6E2073686C206278-     doassign_6 db "\n shl bx, 1",0
  5693 000029CB 2C203100           
  5694 000029CF 5C6E206D6F76205B00      doassign_7 db "\n mov [",0
  5695 000029D8 2B62785D2C20617800      doassign_8 db "+bx], ax",0
  5696 000029E1 2B62785D2C20616C00      doassign_9 db "+bx], al",0
  5697 000029EA 5C6E206D6F762000        doassign_10 db "\n mov ",0
  5698 000029F2 627974652000            doassign_11 db "byte ",0
  5699 000029F8 2C20616C00              doassign_12 db ", al",0
  5700 000029FD 5C6E206D6F762000        doassign_13 db "\n mov ",0
  5701 00002A05 776F72642000            doassign_14 db "word ",0
  5702 00002A0B 2C20617800              doassign_15 db ", ax",0
  5703 00002A10 5C6E206D6F762000        doassign_16 db "\n mov ",0
  5704 00002A18 64776F72642000          doassign_17 db "dword ",0
  5705 00002A1F 2C2065617800            doassign_18 db ", eax",0
  5706                                  ; ENDP
  5707                                  
  5708                                  domul:  ; *** PROC ***
  5709                                  
  5710                                  ;-548   if (ids) rterm("imul"); else {
  5711                                  
  5712                                  ;Function : domul, Number of local variables: 1
  5713                                  ;   # type sign width addr used name   list of local variables
  5714                                  ;  200 var sign word   547 NULL ids = bp+4;
  5715 00002A25 C8000000                 ENTER  0,0
  5716 00002A29 8B4604                   mov ax, [bp+4]
  5717 00002A2C 08C0                     or  al, al
  5718 00002A2E 0F840C00                 je .domul305
  5719 00002A32 68[772A]                 push domul_0
  5720 00002A35 E899F9                   call rterm
  5721 00002A38 83C402                   add  sp, 2
  5722 00002A3B E93700                   jmp .domul306
  5723                                  .domul305:
  5724                                  
  5725                                  ;-549   if (istoken(T_CONST)) {prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx"); }
  5726                                  
  5727 00002A3E 680101                   push 257
  5728 00002A41 E8D319                   call istoken
  5729 00002A44 83C402                   add  sp, 2
  5730 00002A47 08C0                     or  al, al
  5731 00002A49 0F841F00                 je .domul307
  5732 00002A4D 68[7C2A]                 push domul_1
  5733 00002A50 E8F91A                   call prs
  5734 00002A53 83C402                   add  sp, 2
  5735 00002A56 FF36[2E00]               push word [lexval]
  5736 00002A5A E8491C                   call prunsign1
  5737 00002A5D 83C402                   add  sp, 2
  5738 00002A60 68[882A]                 push domul_2
  5739 00002A63 E8E61A                   call prs
  5740 00002A66 83C402                   add  sp, 2
  5741                                  
  5742                                  ;-550   else error1("with MUL only const number as multiplicator allowed"); } }
  5743                                  
  5744 00002A69 E90900                   jmp .domul308
  5745                                  .domul307:
  5746 00002A6C 68[922A]                 push domul_3
  5747 00002A6F E8C51D                   call error1
  5748 00002A72 83C402                   add  sp, 2
  5749                                  .domul308:
  5750                                  .domul306:
  5751                                  
  5752                                  ;-551 int doidiv(int ids) { int mode; int id1;
  5753 00002A75 C9                       LEAVE
  5754 00002A76 C3                       ret
  5755 00002A77 696D756C00              domul_0 db "imul",0
  5756 00002A7C 5C6E206D6F76206278-     domul_1 db "\n mov bx, ",0
  5757 00002A85 2C2000             
  5758 00002A88 5C6E206D756C206278-     domul_2 db "\n mul bx",0
  5759 00002A91 00                 
  5760 00002A92 77697468204D554C20-     domul_3 db "with MUL only const number as multiplicator allowed",0
  5761 00002A9B 6F6E6C7920636F6E73-
  5762 00002AA4 74206E756D62657220-
  5763 00002AAD 6173206D756C746970-
  5764 00002AB6 6C696361746F722061-
  5765 00002ABF 6C6C6F77656400     
  5766                                  ; ENDP
  5767                                  
  5768                                  doidiv:  ; *** PROC ***
  5769                                  
  5770                                  ;-552   if (istoken(T_CONST)) {
  5771                                  
  5772                                  ;Function : doidiv, Number of local variables: 3
  5773                                  ;   # type sign width addr used name   list of local variables
  5774                                  ;  200 var sign word   551 NULL ids = bp+4
  5775                                  ;  201 var sign word   551 NULL mode = bp-2
  5776                                  ;  202 var sign word   551 NULL id1 = bp-4;
  5777 00002AC6 C8040000                 ENTER  4,0
  5778 00002ACA 680101                   push 257
  5779 00002ACD E84719                   call istoken
  5780 00002AD0 83C402                   add  sp, 2
  5781 00002AD3 08C0                     or  al, al
  5782 00002AD5 0F843400                 je .doidiv309
  5783                                  
  5784                                  ;-553     prs("\n mov bx, "); prunsign1(lexval);
  5785                                  
  5786 00002AD9 68[8B2B]                 push doidiv_0
  5787 00002ADC E86D1A                   call prs
  5788 00002ADF 83C402                   add  sp, 2
  5789 00002AE2 FF36[2E00]               push word [lexval]
  5790 00002AE6 E8BD1B                   call prunsign1
  5791 00002AE9 83C402                   add  sp, 2
  5792                                  
  5793                                  ;-554     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5794                                  
  5795 00002AEC 8B4604                   mov ax, [bp+4]
  5796 00002AEF 08C0                     or  al, al
  5797 00002AF1 0F840C00                 je .doidiv310
  5798 00002AF5 68[972B]                 push doidiv_1
  5799 00002AF8 E8511A                   call prs
  5800 00002AFB 83C402                   add  sp, 2
  5801 00002AFE E90900                   jmp .doidiv311
  5802                                  .doidiv310:
  5803 00002B01 68[A82B]                 push doidiv_2
  5804 00002B04 E8451A                   call prs
  5805 00002B07 83C402                   add  sp, 2
  5806                                  .doidiv311:
  5807                                  
  5808                                  ;-555   else {
  5809                                  
  5810 00002B0A E97C00                   jmp .doidiv312
  5811                                  .doidiv309:
  5812                                  
  5813                                  ;-556     mode=typeName(); id1=searchname();
  5814                                  
  5815 00002B0D E87DDF                   call typeName
  5816 00002B10 8946FE                   mov [bp-2], ax
  5817 00002B13 E8A8DE                   call searchname
  5818 00002B16 8946FC                   mov [bp-4], ax
  5819                                  
  5820                                  ;-557     if (mode) error1("only const number or int as divisor allowed");
  5821                                  
  5822 00002B19 8B46FE                   mov ax, [bp-2]
  5823 00002B1C 08C0                     or  al, al
  5824 00002B1E 0F840900                 je .doidiv313
  5825 00002B22 68[BE2B]                 push doidiv_3
  5826 00002B25 E80F1D                   call error1
  5827 00002B28 83C402                   add  sp, 2
  5828                                  
  5829                                  ;-558     gettypes(id1);
  5830                                  
  5831                                  .doidiv313:
  5832 00002B2B FF76FC                   push word [bp-4]
  5833 00002B2E E84FDD                   call gettypes
  5834 00002B31 83C402                   add  sp, 2
  5835                                  
  5836                                  ;-559     if (typei) error1("only int as simple var divisor allowed");
  5837                                  
  5838 00002B34 A1[3000]                 mov ax, [typei]
  5839 00002B37 08C0                     or  al, al
  5840 00002B39 0F840900                 je .doidiv314
  5841 00002B3D 68[EA2B]                 push doidiv_4
  5842 00002B40 E8F41C                   call error1
  5843 00002B43 83C402                   add  sp, 2
  5844                                  
  5845                                  ;-560     if (wi!=2) error1("only int, no byte as divisor allowed");
  5846                                  
  5847                                  .doidiv314:
  5848 00002B46 A1[3900]                 mov ax, [wi]
  5849 00002B49 83F802                   cmp ax, 2
  5850 00002B4C 0F840900                 je  .doidiv315
  5851 00002B50 68[112C]                 push doidiv_5
  5852 00002B53 E8E11C                   call error1
  5853 00002B56 83C402                   add  sp, 2
  5854                                  
  5855                                  ;-561     prs("\n mov bx, "); v(id1);
  5856                                  
  5857                                  .doidiv315:
  5858 00002B59 68[362C]                 push doidiv_6
  5859 00002B5C E8ED19                   call prs
  5860 00002B5F 83C402                   add  sp, 2
  5861 00002B62 FF76FC                   push word [bp-4]
  5862 00002B65 E86AD8                   call v
  5863 00002B68 83C402                   add  sp, 2
  5864                                  
  5865                                  ;-562     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5866                                  
  5867 00002B6B 8B4604                   mov ax, [bp+4]
  5868 00002B6E 08C0                     or  al, al
  5869 00002B70 0F840C00                 je .doidiv316
  5870 00002B74 68[422C]                 push doidiv_7
  5871 00002B77 E8D219                   call prs
  5872 00002B7A 83C402                   add  sp, 2
  5873 00002B7D E90900                   jmp .doidiv317
  5874                                  .doidiv316:
  5875 00002B80 68[532C]                 push doidiv_8
  5876 00002B83 E8C619                   call prs
  5877 00002B86 83C402                   add  sp, 2
  5878                                  .doidiv317:
  5879                                  
  5880                                  ;-563 }
  5881                                  
  5882                                  .doidiv312:
  5883                                  
  5884                                  ;-564 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
  5885 00002B89 C9                       LEAVE
  5886 00002B8A C3                       ret
  5887 00002B8B 5C6E206D6F76206278-     doidiv_0 db "\n mov bx, ",0
  5888 00002B94 2C2000             
  5889 00002B97 5C6E206377645C6E20-     doidiv_1 db "\n cwd\n idiv bx",0
  5890 00002BA0 6964697620627800   
  5891 00002BA8 5C6E206D6F76206478-     doidiv_2 db "\n mov dx, 0\n div bx",0
  5892 00002BB1 2C20305C6E20646976-
  5893 00002BBA 20627800           
  5894 00002BBE 6F6E6C7920636F6E73-     doidiv_3 db "only const number or int as divisor allowed",0
  5895 00002BC7 74206E756D62657220-
  5896 00002BD0 6F7220696E74206173-
  5897 00002BD9 2064697669736F7220-
  5898 00002BE2 616C6C6F77656400   
  5899 00002BEA 6F6E6C7920696E7420-     doidiv_4 db "only int as simple var divisor allowed",0
  5900 00002BF3 61732073696D706C65-
  5901 00002BFC 207661722064697669-
  5902 00002C05 736F7220616C6C6F77-
  5903 00002C0E 656400             
  5904 00002C11 6F6E6C7920696E742C-     doidiv_5 db "only int, no byte as divisor allowed",0
  5905 00002C1A 206E6F206279746520-
  5906 00002C23 61732064697669736F-
  5907 00002C2C 7220616C6C6F776564-
  5908 00002C35 00                 
  5909 00002C36 5C6E206D6F76206278-     doidiv_6 db "\n mov bx, ",0
  5910 00002C3F 2C2000             
  5911 00002C42 5C6E206377645C6E20-     doidiv_7 db "\n cwd\n idiv bx",0
  5912 00002C4B 6964697620627800   
  5913 00002C53 5C6E206D6F76206478-     doidiv_8 db "\n mov dx, 0\n div bx",0
  5914 00002C5C 2C20305C6E20646976-
  5915 00002C65 20627800           
  5916                                  ; ENDP
  5917                                  
  5918                                  domod:  ; *** PROC ***
  5919                                  ;Function : domod, Number of local variables: 1
  5920                                  ;   # type sign width addr used name   list of local variables
  5921                                  ;  200 var sign word   564 NULL ids = bp+4;
  5922 00002C69 C8000000                 ENTER  0,0
  5923 00002C6D FF7604                   push word [bp+4]
  5924 00002C70 E853FE                   call doidiv
  5925 00002C73 83C402                   add  sp, 2
  5926 00002C76 68[812C]                 push domod_0
  5927 00002C79 E8D018                   call prs
  5928 00002C7C 83C402                   add  sp, 2
  5929                                  
  5930                                  ;-565 
  5931                                  
  5932                                  
  5933                                  ;-566 int docalltype[10]; int docallvalue[10];
  5934 00002C7F C9                       LEAVE
  5935 00002C80 C3                       ret
  5936 00002C81 5C6E206D6F76206178-     domod_0 db "\n mov ax, dx",0
  5937 00002C8A 2C20647800         
  5938                                  ; ENDP
  5939                                  section .bss
  5940                                  absolute 53411
  5941 0000D0A3 <res 00000014>          docalltype resw 10
  5942                                  section .text
  5943                                  section .bss
  5944                                  absolute 53431
  5945 0000D0B7 <res 00000014>          docallvalue resw 10
  5946                                  section .text
  5947                                  
  5948                                  ;-567 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register
  5949                                  
  5950                                  section .bss
  5951                                  absolute 53451
  5952 0000D0CB <res 00000011>          procname resb 17
  5953                                  section .text
  5954                                  
  5955                                  ;-568 int docall1() {int i; int narg; int t0; int n0;  int sz32;
  5956                                  
  5957                                  
  5958                                  docall1:  ; *** PROC ***
  5959                                  
  5960                                  ;-569   narg=0;  sz32=0;
  5961                                  
  5962                                  ;Function : docall1, Number of local variables: 5
  5963                                  ;   # type sign width addr used name   list of local variables
  5964                                  ;  200 var sign word   568 NULL i = bp-2
  5965                                  ;  201 var sign word   568 NULL narg = bp-4
  5966                                  ;  202 var sign word   568 NULL t0 = bp-6
  5967                                  ;  203 var sign word   568 NULL n0 = bp-8
  5968                                  ;  204 var sign word   568 NULL sz32 = bp-10;
  5969 00002C8F C80A0000                 ENTER  10,0
  5970 00002C93 B80000                   mov ax, 0
  5971 00002C96 8946FC                   mov [bp-4], ax
  5972 00002C99 B80000                   mov ax, 0
  5973 00002C9C 8946F6                   mov [bp-10], ax
  5974                                  
  5975                                  ;-570   checknamelen();
  5976                                  
  5977 00002C9F E863D7                   call checknamelen
  5978                                  
  5979                                  ;-571   strcpy(&procname, symbol);
  5980                                  
  5981 00002CA2 8D062B81                 lea  ax, [symbol]
  5982 00002CA6 50                       push ax
  5983 00002CA7 8D06CBD0                 lea  ax, [procname]
  5984 00002CAB 50                       push ax
  5985 00002CAC E8B7D4                   call strcpy
  5986 00002CAF 83C404                   add  sp, 4
  5987                                  
  5988                                  ;-572   storecall();
  5989                                  
  5990 00002CB2 E8D9DE                   call storecall
  5991                                  
  5992                                  ;-573   expect('(');
  5993                                  
  5994 00002CB5 6A28                     push 40
  5995 00002CB7 E87F17                   call expect
  5996 00002CBA 83C402                   add  sp, 2
  5997                                  
  5998                                  ;-574 	if (istoken(')') ==0 ) {
  5999                                  
  6000 00002CBD 6A29                     push 41
  6001 00002CBF E85517                   call istoken
  6002 00002CC2 83C402                   add  sp, 2
  6003 00002CC5 83F800                   cmp ax, 0
  6004 00002CC8 0F857802                 jne .docall1318
  6005                                  
  6006                                  ;-575 	  do { narg++;
  6007                                  
  6008                                  .docall1319:
  6009 00002CCC FF46FC                   inc  word[bp-4]
  6010                                  
  6011                                  ;-576 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;
  6012                                  
  6013 00002CCF 8B46FC                   mov ax, [bp-4]
  6014 00002CD2 83F809                   cmp ax, 9
  6015 00002CD5 0F8E0900                 jle .docall1320
  6016 00002CD9 68[882F]                 push docall1_0
  6017 00002CDC E8581B                   call error1
  6018 00002CDF 83C402                   add  sp, 2
  6019                                  .docall1320:
  6020 00002CE2 B80000                   mov ax, 0
  6021 00002CE5 8946FA                   mov [bp-6], ax
  6022                                  
  6023                                  ;-577       if(istoken(T_CONST)) {t0=1; n0=lexval; }
  6024                                  
  6025 00002CE8 680101                   push 257
  6026 00002CEB E82917                   call istoken
  6027 00002CEE 83C402                   add  sp, 2
  6028 00002CF1 08C0                     or  al, al
  6029 00002CF3 0F840C00                 je .docall1321
  6030 00002CF7 B80100                   mov ax, 1
  6031 00002CFA 8946FA                   mov [bp-6], ax
  6032 00002CFD A1[2E00]                 mov ax, [lexval]
  6033 00002D00 8946F8                   mov [bp-8], ax
  6034                                  
  6035                                  ;-578       if(istoken(T_STRING)){t0=2; n0=nconst;
  6036                                  
  6037                                  .docall1321:
  6038 00002D03 680201                   push 258
  6039 00002D06 E80E17                   call istoken
  6040 00002D09 83C402                   add  sp, 2
  6041 00002D0C 08C0                     or  al, al
  6042 00002D0E 0F846300                 je .docall1322
  6043 00002D12 B80200                   mov ax, 2
  6044 00002D15 8946FA                   mov [bp-6], ax
  6045 00002D18 A1[2400]                 mov ax, [nconst]
  6046 00002D1B 8946F8                   mov [bp-8], ax
  6047                                  
  6048                                  ;-579         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");
  6049                                  
  6050 00002D1E 68[9A2F]                 push docall1_1
  6051 00002D21 E89317                   call eprs
  6052 00002D24 83C402                   add  sp, 2
  6053 00002D27 8D06AB81                 lea  ax, [fname]
  6054 00002D2B 50                       push ax
  6055 00002D2C E88817                   call eprs
  6056 00002D2F 83C402                   add  sp, 2
  6057 00002D32 6A5F                     push 95
  6058 00002D34 E86D17                   call eprc
  6059 00002D37 83C402                   add  sp, 2
  6060 00002D3A FF36[2400]               push word [nconst]
  6061 00002D3E E89F18                   call eprnum
  6062 00002D41 83C402                   add  sp, 2
  6063 00002D44 68[9D2F]                 push docall1_2
  6064 00002D47 E86D17                   call eprs
  6065 00002D4A 83C402                   add  sp, 2
  6066                                  
  6067                                  ;-580         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }
  6068                                  
  6069 00002D4D 6A22                     push 34
  6070 00002D4F E85217                   call eprc
  6071 00002D52 83C402                   add  sp, 2
  6072 00002D55 8D062B81                 lea  ax, [symbol]
  6073 00002D59 50                       push ax
  6074 00002D5A E85A17                   call eprs
  6075 00002D5D 83C402                   add  sp, 2
  6076 00002D60 6A22                     push 34
  6077 00002D62 E83F17                   call eprc
  6078 00002D65 83C402                   add  sp, 2
  6079 00002D68 68[A22F]                 push docall1_3
  6080 00002D6B E84917                   call eprs
  6081 00002D6E 83C402                   add  sp, 2
  6082 00002D71 FF06[2400]               inc  word[nconst]
  6083                                  
  6084                                  ;-581       if(istoken('&'))     {t0=3; name1(); n0=searchname();}
  6085                                  
  6086                                  .docall1322:
  6087 00002D75 6A26                     push 38
  6088 00002D77 E89D16                   call istoken
  6089 00002D7A 83C402                   add  sp, 2
  6090 00002D7D 08C0                     or  al, al
  6091 00002D7F 0F840F00                 je .docall1323
  6092 00002D83 B80300                   mov ax, 3
  6093 00002D86 8946FA                   mov [bp-6], ax
  6094 00002D89 E8DADD                   call name1
  6095 00002D8C E82FDC                   call searchname
  6096 00002D8F 8946F8                   mov [bp-8], ax
  6097                                  
  6098                                  ;-582       if(istoken(T_NAME))  { n0=checkreg();
  6099                                  
  6100                                  .docall1323:
  6101 00002D92 680001                   push 256
  6102 00002D95 E87F16                   call istoken
  6103 00002D98 83C402                   add  sp, 2
  6104 00002D9B 08C0                     or  al, al
  6105 00002D9D 0F844800                 je .docall1324
  6106 00002DA1 E8DFEA                   call checkreg
  6107 00002DA4 8946F8                   mov [bp-8], ax
  6108                                  
  6109                                  ;-583         if (n0) t0=5;
  6110                                  
  6111 00002DA7 8B46F8                   mov ax, [bp-8]
  6112 00002DAA 08C0                     or  al, al
  6113 00002DAC 0F840900                 je .docall1325
  6114 00002DB0 B80500                   mov ax, 5
  6115 00002DB3 8946FA                   mov [bp-6], ax
  6116                                  
  6117                                  ;-584         else {t0=4; n0=searchname();
  6118                                  
  6119 00002DB6 E93000                   jmp .docall1326
  6120                                  .docall1325:
  6121 00002DB9 B80400                   mov ax, 4
  6122 00002DBC 8946FA                   mov [bp-6], ax
  6123 00002DBF E8FCDB                   call searchname
  6124 00002DC2 8946F8                   mov [bp-8], ax
  6125                                  
  6126                                  ;-585           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }
  6127                                  
  6128 00002DC5 B8B782                   mov ax, GType
  6129 00002DC8 A3[6C00]                 mov word [p1], ax
  6130 00002DCB A1[6C00]                 mov ax, [p1]
  6131 00002DCE 0346F8                   add ax, [bp-8]
  6132 00002DD1 A3[6C00]                 mov word [p1], ax
  6133 00002DD4 8B1E[6C00]               mov bx, [p1]
  6134 00002DD8 8A07                     mov al, [bx]
  6135 00002DDA B400                     mov ah, 0
  6136 00002DDC 83F826                   cmp ax, 38
  6137 00002DDF 0F850600                 jne .docall1327
  6138 00002DE3 B80300                   mov ax, 3
  6139 00002DE6 8946FA                   mov [bp-6], ax
  6140                                  .docall1327:
  6141                                  .docall1326:
  6142                                  
  6143                                  ;-586       if (t0==0) error1("parameter not recognized (no * allowed)");
  6144                                  
  6145                                  .docall1324:
  6146 00002DE9 8B46FA                   mov ax, [bp-6]
  6147 00002DEC 83F800                   cmp ax, 0
  6148 00002DEF 0F850900                 jne .docall1328
  6149 00002DF3 68[A52F]                 push docall1_4
  6150 00002DF6 E83E1A                   call error1
  6151 00002DF9 83C402                   add  sp, 2
  6152                                  
  6153                                  ;-587       docalltype [narg] = t0;
  6154                                  
  6155                                  .docall1328:
  6156 00002DFC 8B46FA                   mov ax, [bp-6]
  6157 00002DFF 8B5EFC                   mov bx, [bp-4]
  6158 00002E02 D1E3                     shl bx, 1
  6159 00002E04 8987A3D0                 mov [docalltype+bx], ax
  6160                                  
  6161                                  ;-588       docallvalue[narg] = n0;
  6162                                  
  6163 00002E08 8B46F8                   mov ax, [bp-8]
  6164 00002E0B 8B5EFC                   mov bx, [bp-4]
  6165 00002E0E D1E3                     shl bx, 1
  6166 00002E10 8987B7D0                 mov [docallvalue+bx], ax
  6167                                  
  6168                                  ;-589     } while (istoken(','));
  6169                                  
  6170 00002E14 6A2C                     push 44
  6171 00002E16 E8FE15                   call istoken
  6172 00002E19 83C402                   add  sp, 2
  6173 00002E1C 08C0                     or  al, al
  6174 00002E1E 0F840300                 je .docall1329
  6175 00002E22 E9A7FE                   jmp .docall1319
  6176                                  .docall1329:
  6177                                  
  6178                                  ;-590     
  6179                                  
  6180                                  
  6181                                  ;-591   	expect(')');  i=narg;
  6182                                  
  6183 00002E25 6A29                     push 41
  6184 00002E27 E80F16                   call expect
  6185 00002E2A 83C402                   add  sp, 2
  6186 00002E2D 8B46FC                   mov ax, [bp-4]
  6187 00002E30 8946FE                   mov [bp-2], ax
  6188                                  
  6189                                  ;-592     do {
  6190                                  
  6191                                  .docall1330:
  6192                                  
  6193                                  ;-593       t0 = docalltype [i];
  6194                                  
  6195 00002E33 8B5EFE                   mov bx, [bp-2]
  6196 00002E36 D1E3                     shl bx, 1
  6197 00002E38 8B87A3D0                 mov ax, [docalltype + bx]
  6198 00002E3C 8946FA                   mov [bp-6], ax
  6199                                  
  6200                                  ;-594       n0 = docallvalue[i];     
  6201                                  
  6202 00002E3F 8B5EFE                   mov bx, [bp-2]
  6203 00002E42 D1E3                     shl bx, 1
  6204 00002E44 8B87B7D0                 mov ax, [docallvalue + bx]
  6205 00002E48 8946F8                   mov [bp-8], ax
  6206                                  
  6207                                  ;-595       if(t0==1){ prs("\n push "); pint1(n0);}
  6208                                  
  6209 00002E4B 8B46FA                   mov ax, [bp-6]
  6210 00002E4E 83F801                   cmp ax, 1
  6211 00002E51 0F851200                 jne .docall1331
  6212 00002E55 68[CD2F]                 push docall1_5
  6213 00002E58 E8F116                   call prs
  6214 00002E5B 83C402                   add  sp, 2
  6215 00002E5E FF76F8                   push word [bp-8]
  6216 00002E61 E8DF17                   call pint1
  6217 00002E64 83C402                   add  sp, 2
  6218                                  
  6219                                  ;-596       if(t0==2){ prs("\n push "); 
  6220                                  
  6221                                  .docall1331:
  6222 00002E67 8B46FA                   mov ax, [bp-6]
  6223 00002E6A 83F802                   cmp ax, 2
  6224 00002E6D 0F852500                 jne .docall1332
  6225 00002E71 68[D62F]                 push docall1_6
  6226 00002E74 E8D516                   call prs
  6227 00002E77 83C402                   add  sp, 2
  6228                                  
  6229                                  ;-597         prs(fname);prc(95);pint1(n0);}
  6230                                  
  6231 00002E7A 8D06AB81                 lea  ax, [fname]
  6232 00002E7E 50                       push ax
  6233 00002E7F E8CA16                   call prs
  6234 00002E82 83C402                   add  sp, 2
  6235 00002E85 6A5F                     push 95
  6236 00002E87 E85B16                   call prc
  6237 00002E8A 83C402                   add  sp, 2
  6238 00002E8D FF76F8                   push word [bp-8]
  6239 00002E90 E8B017                   call pint1
  6240 00002E93 83C402                   add  sp, 2
  6241                                  
  6242                                  ;-598       if(t0==3){ prs("\n lea  ax, ");   v(n0);
  6243                                  
  6244                                  .docall1332:
  6245 00002E96 8B46FA                   mov ax, [bp-6]
  6246 00002E99 83F803                   cmp ax, 3
  6247 00002E9C 0F851B00                 jne .docall1333
  6248 00002EA0 68[DF2F]                 push docall1_7
  6249 00002EA3 E8A616                   call prs
  6250 00002EA6 83C402                   add  sp, 2
  6251 00002EA9 FF76F8                   push word [bp-8]
  6252 00002EAC E823D5                   call v
  6253 00002EAF 83C402                   add  sp, 2
  6254                                  
  6255                                  ;-599         prs("\n push ax");}
  6256                                  
  6257 00002EB2 68[EC2F]                 push docall1_8
  6258 00002EB5 E89416                   call prs
  6259 00002EB8 83C402                   add  sp, 2
  6260                                  
  6261                                  ;-600       if(t0==4){ gettypes(n0); 
  6262                                  
  6263                                  .docall1333:
  6264 00002EBB 8B46FA                   mov ax, [bp-6]
  6265 00002EBE 83F804                   cmp ax, 4
  6266 00002EC1 0F854300                 jne .docall1334
  6267 00002EC5 FF76F8                   push word [bp-8]
  6268 00002EC8 E8B5D9                   call gettypes
  6269 00002ECB 83C402                   add  sp, 2
  6270                                  
  6271                                  ;-601         if(wi==2) { prs("\n push word "); v(n0);}
  6272                                  
  6273 00002ECE A1[3900]                 mov ax, [wi]
  6274 00002ED1 83F802                   cmp ax, 2
  6275 00002ED4 0F851500                 jne .docall1335
  6276 00002ED8 68[F72F]                 push docall1_9
  6277 00002EDB E86E16                   call prs
  6278 00002EDE 83C402                   add  sp, 2
  6279 00002EE1 FF76F8                   push word [bp-8]
  6280 00002EE4 E8EBD4                   call v
  6281 00002EE7 83C402                   add  sp, 2
  6282                                  
  6283                                  ;-602         else { prs("\n mov al, byte ");   v(n0);
  6284                                  
  6285 00002EEA E91B00                   jmp .docall1336
  6286                                  .docall1335:
  6287 00002EED 68[0530]                 push docall1_10
  6288 00002EF0 E85916                   call prs
  6289 00002EF3 83C402                   add  sp, 2
  6290 00002EF6 FF76F8                   push word [bp-8]
  6291 00002EF9 E8D6D4                   call v
  6292 00002EFC 83C402                   add  sp, 2
  6293                                  
  6294                                  ;-603         prs("\n mov ah, 0\n push ax"); } }
  6295                                  
  6296 00002EFF 68[1630]                 push docall1_11
  6297 00002F02 E84716                   call prs
  6298 00002F05 83C402                   add  sp, 2
  6299                                  .docall1336:
  6300                                  
  6301                                  ;-604       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }
  6302                                  
  6303                                  .docall1334:
  6304 00002F08 8B46FA                   mov ax, [bp-6]
  6305 00002F0B 83F805                   cmp ax, 5
  6306 00002F0E 0F852200                 jne .docall1337
  6307 00002F12 68[2D30]                 push docall1_12
  6308 00002F15 E83416                   call prs
  6309 00002F18 83C402                   add  sp, 2
  6310 00002F1B FF76F8                   push word [bp-8]
  6311 00002F1E E870ED                   call printreg
  6312 00002F21 83C402                   add  sp, 2
  6313 00002F24 8B46F8                   mov ax, [bp-8]
  6314 00002F27 83F82F                   cmp ax, 47 ;unsigned : 1
  6315 00002F2A 0F8C0600                 jl  .docall1338
  6316 00002F2E 8B46F6                   mov ax, [bp-10]
  6317 00002F31 83C002                   add ax, 2
  6318                                  .docall1338:
  6319                                  
  6320                                  ;-605    i--; } while (i > 0);  }
  6321                                  
  6322                                  .docall1337:
  6323 00002F34 FF4EFE                   dec  word[bp-2]
  6324 00002F37 8B46FE                   mov ax, [bp-2]
  6325 00002F3A 83F800                   cmp ax, 0
  6326 00002F3D 0F8E0300                 jle .docall1339
  6327 00002F41 E9EFFE                   jmp .docall1330
  6328                                  .docall1339:
  6329                                  
  6330                                  ;-606 	 prs("\n call "); prs(&procname);
  6331                                  
  6332                                  .docall1318:
  6333 00002F44 68[3630]                 push docall1_13
  6334 00002F47 E80216                   call prs
  6335 00002F4A 83C402                   add  sp, 2
  6336 00002F4D 8D06CBD0                 lea  ax, [procname]
  6337 00002F51 50                       push ax
  6338 00002F52 E8F715                   call prs
  6339 00002F55 83C402                   add  sp, 2
  6340                                  
  6341                                  ;-607 	 if (narg>0) {prs("\n add  sp, ");
  6342                                  
  6343 00002F58 8B46FC                   mov ax, [bp-4]
  6344 00002F5B 83F800                   cmp ax, 0
  6345 00002F5E 0F8E2400                 jle .docall1340
  6346 00002F62 68[3F30]                 push docall1_14
  6347 00002F65 E8E415                   call prs
  6348 00002F68 83C402                   add  sp, 2
  6349                                  
  6350                                  ;-608      narg=narg+narg; narg=narg+sz32; pint1(narg); } }
  6351                                  
  6352 00002F6B 8B46FC                   mov ax, [bp-4]
  6353 00002F6E 0346FC                   add ax, [bp-4]
  6354 00002F71 8946FC                   mov [bp-4], ax
  6355 00002F74 8B46FC                   mov ax, [bp-4]
  6356 00002F77 0346F6                   add ax, [bp-10]
  6357 00002F7A 8946FC                   mov [bp-4], ax
  6358 00002F7D FF76FC                   push word [bp-4]
  6359 00002F80 E8C016                   call pint1
  6360 00002F83 83C402                   add  sp, 2
  6361                                  .docall1340:
  6362                                  
  6363                                  ;-609 /****************************************************************************/
  6364                                  
  6365                                  
  6366                                  ;-610 int main() {
  6367 00002F86 C9                       LEAVE
  6368 00002F87 C3                       ret
  6369 00002F88 4D61782E2039207061-     docall1_0 db "Max. 9 parameters",0
  6370 00002F91 72616D657465727300 
  6371 00002F9A 5C6E00                  docall1_1 db "\n",0
  6372 00002F9D 2064622000              docall1_2 db " db ",0
  6373 00002FA2 2C3000                  docall1_3 db ",0",0
  6374 00002FA5 706172616D65746572-     docall1_4 db "parameter not recognized (no * allowed)",0
  6375 00002FAE 206E6F74207265636F-
  6376 00002FB7 676E697A656420286E-
  6377 00002FC0 6F202A20616C6C6F77-
  6378 00002FC9 65642900           
  6379 00002FCD 5C6E20707573682000      docall1_5 db "\n push ",0
  6380 00002FD6 5C6E20707573682000      docall1_6 db "\n push ",0
  6381 00002FDF 5C6E206C6561202061-     docall1_7 db "\n lea  ax, ",0
  6382 00002FE8 782C2000           
  6383 00002FEC 5C6E20707573682061-     docall1_8 db "\n push ax",0
  6384 00002FF5 7800               
  6385 00002FF7 5C6E20707573682077-     docall1_9 db "\n push word ",0
  6386 00003000 6F72642000         
  6387 00003005 5C6E206D6F7620616C-     docall1_10 db "\n mov al, byte ",0
  6388 0000300E 2C20627974652000   
  6389 00003016 5C6E206D6F76206168-     docall1_11 db "\n mov ah, 0\n push ax",0
  6390 0000301F 2C20305C6E20707573-
  6391 00003028 6820617800         
  6392 0000302D 5C6E20707573682000      docall1_12 db "\n push ",0
  6393 00003036 5C6E2063616C6C2000      docall1_13 db "\n call ",0
  6394 0000303F 5C6E20616464202073-     docall1_14 db "\n add  sp, ",0
  6395 00003048 702C2000           
  6396                                  ; ENDP
  6397                                  
  6398                                  main:  ; *** PROC ***
  6399                                  
  6400                                  ;-611   getarg();
  6401                                  
  6402 0000304C E88700                   call getarg
  6403                                  
  6404                                  ;-612   setblock(4096);
  6405                                  
  6406 0000304F 680010                   push 4096
  6407 00003052 E8D722                   call setblock
  6408 00003055 83C402                   add  sp, 2
  6409                                  
  6410                                  ;-613   if (DOS_ERR) error1("SetBlock , AX=");
  6411                                  
  6412 00003058 A1[6E00]                 mov ax, [DOS_ERR]
  6413 0000305B 08C0                     or  al, al
  6414 0000305D 0F840900                 je .main341
  6415 00003061 68[9B30]                 push main_0
  6416 00003064 E8D017                   call error1
  6417 00003067 83C402                   add  sp, 2
  6418                                  
  6419                                  ;-614   segE=allocmem(4096);
  6420                                  
  6421                                  .main341:
  6422 0000306A 680010                   push 4096
  6423 0000306D E8D522                   call allocmem
  6424 00003070 83C402                   add  sp, 2
  6425 00003073 A3[6400]                 mov word [segE], ax
  6426                                  
  6427                                  ;-615   if (DOS_ERR)  error1("alloc memory, AX=");
  6428                                  
  6429 00003076 A1[6E00]                 mov ax, [DOS_ERR]
  6430 00003079 08C0                     or  al, al
  6431 0000307B 0F840900                 je .main342
  6432 0000307F 68[AA30]                 push main_1
  6433 00003082 E8B217                   call error1
  6434 00003085 83C402                   add  sp, 2
  6435                                  
  6436                                  ;-616   CNameTop=0;
  6437                                  
  6438                                  .main342:
  6439 00003088 B80000                   mov ax, 0
  6440 0000308B A3[6000]                 mov word [CNameTop], ax
  6441                                  
  6442                                  ;-617   getfirstchar();
  6443                                  
  6444 0000308E E82B00                   call getfirstchar
  6445                                  
  6446                                  ;-618   parse();
  6447                                  
  6448 00003091 E84B02                   call parse
  6449                                  
  6450                                  ;-619   checkcalls(); epilog();
  6451                                  
  6452 00003094 E8DF02                   call checkcalls
  6453 00003097 E8781E                   call epilog
  6454                                  
  6455                                  ;-620 }
  6456                                  
  6457                                  
  6458                                  ;-621 int getfirstchar() { fgetsp=&fgetsdest; *fgetsp=0; thechar=fgets1(); }
  6459                                  
  6460 0000309A C3                       ret
  6461 0000309B 536574426C6F636B20-     main_0 db "SetBlock , AX=",0
  6462 000030A4 2C2041583D00       
  6463 000030AA 616C6C6F63206D656D-     main_1 db "alloc memory, AX=",0
  6464 000030B3 6F72792C2041583D00 
  6465                                  ; ENDP
  6466                                  
  6467                                  getfirstchar:  ; *** PROC ***
  6468 000030BC B80FD0                   mov ax, fgetsdest
  6469 000030BF A3[6200]                 mov word [fgetsp], ax
  6470 000030C2 B80000                   mov ax, 0
  6471 000030C5 8B1E[6200]               mov  bx, [fgetsp]
  6472 000030C9 8807                     mov  [bx], al
  6473 000030CB E87116                   call fgets1
  6474 000030CE A2[2100]                 mov byte [thechar], al
  6475                                  
  6476                                  ;-622 char *arglen=0x80; char *argv=0x82;
  6477                                  
  6478 000030D1 C3                       ret
  6479                                  ; ENDP
  6480 000030D2 8000                    arglen dw 128
  6481 000030D4 8200                    argv dw 130
  6482                                  
  6483                                  ;-623 int getarg() { int arglen1; int i; char *c;
  6484                                  
  6485                                  
  6486                                  getarg:  ; *** PROC ***
  6487                                  
  6488                                  ;-624   arglen1=*arglen;
  6489                                  
  6490                                  ;Function : getarg, Number of local variables: 3
  6491                                  ;   # type sign width addr used name   list of local variables
  6492                                  ;  200 var sign word   623 NULL arglen1 = bp-2
  6493                                  ;  201 var sign word   623 NULL i = bp-4
  6494                                  ;  202 ptr sign byte   623 NULL c = bp-6;
  6495 000030D6 C8060000                 ENTER  6,0
  6496 000030DA 8B1E[D230]               mov bx, [arglen]
  6497 000030DE 8A07                     mov al, [bx]
  6498 000030E0 B400                     mov ah, 0
  6499 000030E2 8946FE                   mov [bp-2], ax
  6500                                  
  6501                                  ;-625   if (arglen1) { i=arglen1+129; *i=0; }
  6502                                  
  6503 000030E5 8B46FE                   mov ax, [bp-2]
  6504 000030E8 08C0                     or  al, al
  6505 000030EA 0F841400                 je .getarg343
  6506 000030EE 8B46FE                   mov ax, [bp-2]
  6507 000030F1 058100                   add ax, 129
  6508 000030F4 8946FC                   mov [bp-4], ax
  6509 000030F7 B80000                   mov ax, 0
  6510 000030FA 8B5EFC                   mov  bx, [bp-4]
  6511 000030FD 8907                     mov  [bx], ax
  6512                                  
  6513                                  ;-626   else { cputs(Version1); cputs(" Usage: A.COM in_file[.C]: ");
  6514                                  
  6515 000030FF E93900                   jmp .getarg344
  6516                                  .getarg343:
  6517 00003102 8D06[0300]               lea  ax, [Version1]
  6518 00003106 50                       push ax
  6519 00003107 E88ACF                   call cputs
  6520 0000310A 83C402                   add  sp, 2
  6521 0000310D 68[5632]                 push getarg_0
  6522 00003110 E881CF                   call cputs
  6523 00003113 83C402                   add  sp, 2
  6524                                  
  6525                                  ;-627     DOS_NoBytes=readRL(argv, 0, CMDLENMAX); c=DOS_NoBytes+128; *c=0; prnl(); }
  6526                                  
  6527 00003116 6A43                     push 67
  6528 00003118 6A00                     push 0
  6529 0000311A FF36[D430]               push word [argv]
  6530 0000311E E8F3CF                   call readRL
  6531 00003121 83C406                   add  sp, 6
  6532 00003124 A3[7000]                 mov word [DOS_NoBytes], ax
  6533 00003127 A1[7000]                 mov ax, [DOS_NoBytes]
  6534 0000312A 058000                   add ax, 128
  6535 0000312D 8946FA                   mov [bp-6], ax
  6536 00003130 B80000                   mov ax, 0
  6537 00003133 8B5EFA                   mov  bx, [bp-6]
  6538 00003136 8807                     mov  [bx], al
  6539 00003138 E80314                   call prnl
  6540                                  
  6541                                  ;-628   strcpy(namein, argv);
  6542                                  
  6543                                  .getarg344:
  6544 0000313B FF36[D430]               push word [argv]
  6545 0000313F 8D06EE81                 lea  ax, [namein]
  6546 00003143 50                       push ax
  6547 00003144 E81FD0                   call strcpy
  6548 00003147 83C404                   add  sp, 4
  6549                                  
  6550                                  ;-629   if (instr1(namein, '.') == 0) strcat1(namein, ".C");
  6551                                  
  6552 0000314A 6A2E                     push 46
  6553 0000314C 8D06EE81                 lea  ax, [namein]
  6554 00003150 50                       push ax
  6555 00003151 E88ED0                   call instr1
  6556 00003154 83C404                   add  sp, 4
  6557 00003157 83F800                   cmp ax, 0
  6558 0000315A 0F850E00                 jne .getarg345
  6559 0000315E 68[7232]                 push getarg_1
  6560 00003161 8D06EE81                 lea  ax, [namein]
  6561 00003165 50                       push ax
  6562 00003166 E8ABD0                   call strcat1
  6563 00003169 83C404                   add  sp, 4
  6564                                  
  6565                                  ;-630   toupper(namein);
  6566                                  
  6567                                  .getarg345:
  6568 0000316C 8D06EE81                 lea  ax, [namein]
  6569 00003170 50                       push ax
  6570 00003171 E8C5D0                   call toupper
  6571 00003174 83C402                   add  sp, 2
  6572                                  
  6573                                  ;-631   strcpy(namelst, namein); i=strlen(namelst); i--; c=&namelst+i; *c='S';
  6574                                  
  6575 00003177 8D06EE81                 lea  ax, [namein]
  6576 0000317B 50                       push ax
  6577 0000317C 8D063182                 lea  ax, [namelst]
  6578 00003180 50                       push ax
  6579 00003181 E8E2CF                   call strcpy
  6580 00003184 83C404                   add  sp, 4
  6581 00003187 8D063182                 lea  ax, [namelst]
  6582 0000318B 50                       push ax
  6583 0000318C E8AFCF                   call strlen
  6584 0000318F 83C402                   add  sp, 2
  6585 00003192 8946FC                   mov [bp-4], ax
  6586 00003195 FF4EFC                   dec  word[bp-4]
  6587 00003198 B83182                   mov ax, namelst
  6588 0000319B 0346FC                   add ax, [bp-4]
  6589 0000319E 8946FA                   mov [bp-6], ax
  6590 000031A1 B85300                   mov ax, 83
  6591 000031A4 8B5EFA                   mov  bx, [bp-6]
  6592 000031A7 8807                     mov  [bx], al
  6593                                  
  6594                                  ;-632  
  6595                                  
  6596                                  
  6597                                  ;-633   fdin=openR (namein);
  6598                                  
  6599 000031A9 8D06EE81                 lea  ax, [namein]
  6600 000031AD 50                       push ax
  6601 000031AE E825CF                   call openR
  6602 000031B1 83C402                   add  sp, 2
  6603 000031B4 A3[1800]                 mov word [fdin], ax
  6604                                  
  6605                                  ;-634   if(DOS_ERR){cputs("Source file missing (.C): "); cputs(namein); exitR(1); }
  6606                                  
  6607 000031B7 A1[6E00]                 mov ax, [DOS_ERR]
  6608 000031BA 08C0                     or  al, al
  6609 000031BC 0F841C00                 je .getarg346
  6610 000031C0 68[7532]                 push getarg_2
  6611 000031C3 E8CECE                   call cputs
  6612 000031C6 83C402                   add  sp, 2
  6613 000031C9 8D06EE81                 lea  ax, [namein]
  6614 000031CD 50                       push ax
  6615 000031CE E8C3CE                   call cputs
  6616 000031D1 83C402                   add  sp, 2
  6617 000031D4 6A01                     push 1
  6618 000031D6 E82DCF                   call exitR
  6619 000031D9 83C402                   add  sp, 2
  6620                                  
  6621                                  ;-635   fdout=creatR(namelst);
  6622                                  
  6623                                  .getarg346:
  6624 000031DC 8D063182                 lea  ax, [namelst]
  6625 000031E0 50                       push ax
  6626 000031E1 E801CF                   call creatR
  6627 000031E4 83C402                   add  sp, 2
  6628 000031E7 A3[1A00]                 mov word [fdout], ax
  6629                                  
  6630                                  ;-636   if(DOS_ERR){cputs("list file not creatable: ");cputs(namelst);exitR(2);}
  6631                                  
  6632 000031EA A1[6E00]                 mov ax, [DOS_ERR]
  6633 000031ED 08C0                     or  al, al
  6634 000031EF 0F841C00                 je .getarg347
  6635 000031F3 68[9032]                 push getarg_3
  6636 000031F6 E89BCE                   call cputs
  6637 000031F9 83C402                   add  sp, 2
  6638 000031FC 8D063182                 lea  ax, [namelst]
  6639 00003200 50                       push ax
  6640 00003201 E890CE                   call cputs
  6641 00003204 83C402                   add  sp, 2
  6642 00003207 6A02                     push 2
  6643 00003209 E8FACE                   call exitR
  6644 0000320C 83C402                   add  sp, 2
  6645                                  
  6646                                  ;-637   prs("\n; ");prs(Version1);
  6647                                  
  6648                                  .getarg347:
  6649 0000320F 68[AA32]                 push getarg_4
  6650 00003212 E83713                   call prs
  6651 00003215 83C402                   add  sp, 2
  6652 00003218 8D06[0300]               lea  ax, [Version1]
  6653 0000321C 50                       push ax
  6654 0000321D E82C13                   call prs
  6655 00003220 83C402                   add  sp, 2
  6656                                  
  6657                                  ;-638   prs(", Source: "); prs(namein);  prs(", Output asm: "); prs(namelst);
  6658                                  
  6659 00003223 68[AF32]                 push getarg_5
  6660 00003226 E82313                   call prs
  6661 00003229 83C402                   add  sp, 2
  6662 0000322C 8D06EE81                 lea  ax, [namein]
  6663 00003230 50                       push ax
  6664 00003231 E81813                   call prs
  6665 00003234 83C402                   add  sp, 2
  6666 00003237 68[BA32]                 push getarg_6
  6667 0000323A E80F13                   call prs
  6668 0000323D 83C402                   add  sp, 2
  6669 00003240 8D063182                 lea  ax, [namelst]
  6670 00003244 50                       push ax
  6671 00003245 E80413                   call prs
  6672 00003248 83C402                   add  sp, 2
  6673                                  
  6674                                  ;-639   prs("\norg  256 \njmp main"); 
  6675                                  
  6676 0000324B 68[C932]                 push getarg_7
  6677 0000324E E8FB12                   call prs
  6678 00003251 83C402                   add  sp, 2
  6679                                  
  6680                                  ;-640 }
  6681                                  
  6682                                  
  6683                                  ;-641 int parse() { token=getlex(); do {
  6684 00003254 C9                       LEAVE
  6685 00003255 C3                       ret
  6686 00003256 2055736167653A2041-     getarg_0 db " Usage: A.COM in_file[.C]: ",0
  6687 0000325F 2E434F4D20696E5F66-
  6688 00003268 696C655B2E435D3A20-
  6689 00003271 00                 
  6690 00003272 2E4300                  getarg_1 db ".C",0
  6691 00003275 536F75726365206669-     getarg_2 db "Source file missing (.C): ",0
  6692 0000327E 6C65206D697373696E-
  6693 00003287 6720282E43293A2000 
  6694 00003290 6C6973742066696C65-     getarg_3 db "list file not creatable: ",0
  6695 00003299 206E6F742063726561-
  6696 000032A2 7461626C653A2000   
  6697 000032AA 5C6E3B2000              getarg_4 db "\n; ",0
  6698 000032AF 2C20536F757263653A-     getarg_5 db ", Source: ",0
  6699 000032B8 2000               
  6700 000032BA 2C204F757470757420-     getarg_6 db ", Output asm: ",0
  6701 000032C3 61736D3A2000       
  6702 000032C9 5C6E6F726720203235-     getarg_7 db "\norg  256 \njmp main",0
  6703 000032D2 36205C6E6A6D70206D-
  6704 000032DB 61696E00           
  6705                                  ; ENDP
  6706                                  
  6707                                  parse:  ; *** PROC ***
  6708 000032DF E8110A                   call getlex
  6709 000032E2 A3[1C00]                 mov word [token], ax
  6710                                  .parse348:
  6711                                  
  6712                                  ;-642     if (token <= 0) return 1;
  6713                                  
  6714 000032E5 A1[1C00]                 mov ax, [token]
  6715 000032E8 83F800                   cmp ax, 0
  6716 000032EB 0F8F0600                 jg  .parse349
  6717 000032EF B80100                   mov ax, 1
  6718 000032F2 E96500                   jmp .retnparse
  6719                                  
  6720                                  ;-643     if (istoken('#')) {
  6721                                  
  6722                                  .parse349:
  6723 000032F5 6A23                     push 35
  6724 000032F7 E81D11                   call istoken
  6725 000032FA 83C402                   add  sp, 2
  6726 000032FD 08C0                     or  al, al
  6727 000032FF 0F843600                 je .parse350
  6728                                  
  6729                                  ;-644       if (istoken(T_DEFINE)) dodefine();
  6730                                  
  6731 00003303 68FF01                   push 511
  6732 00003306 E80E11                   call istoken
  6733 00003309 83C402                   add  sp, 2
  6734 0000330C 08C0                     or  al, al
  6735 0000330E 0F840600                 je .parse351
  6736 00003312 E8A702                   call dodefine
  6737                                  
  6738                                  ;-645       else if (istoken(T_INCLUDE)) doinclude();
  6739                                  
  6740 00003315 E91E00                   jmp .parse352
  6741                                  .parse351:
  6742 00003318 68FE01                   push 510
  6743 0000331B E8F910                   call istoken
  6744 0000331E 83C402                   add  sp, 2
  6745 00003321 08C0                     or  al, al
  6746 00003323 0F840600                 je .parse353
  6747 00003327 E8AC01                   call doinclude
  6748                                  
  6749                                  ;-646       else error1("define or include expected");  }
  6750                                  
  6751 0000332A E90900                   jmp .parse354
  6752                                  .parse353:
  6753 0000332D 68[5B33]                 push parse_0
  6754 00003330 E80415                   call error1
  6755 00003333 83C402                   add  sp, 2
  6756                                  .parse354:
  6757                                  .parse352:
  6758                                  
  6759                                  ;-647     else{ typeName();  if (token=='(') dofunc();  else doglob(); }
  6760                                  
  6761 00003336 E91600                   jmp .parse355
  6762                                  .parse350:
  6763 00003339 E851D7                   call typeName
  6764 0000333C A1[1C00]                 mov ax, [token]
  6765 0000333F 83F828                   cmp ax, 40
  6766 00003342 0F850600                 jne .parse356
  6767 00003346 E858DA                   call dofunc
  6768 00003349 E90300                   jmp .parse357
  6769                                  .parse356:
  6770 0000334C E802D1                   call doglob
  6771                                  .parse357:
  6772                                  
  6773                                  ;-648   } while(1);
  6774                                  
  6775                                  .parse355:
  6776 0000334F B80100                   mov ax, 1
  6777 00003352 08C0                     or  al, al
  6778 00003354 0F840200                 je .parse358
  6779 00003358 EB8B                     jmp .parse348
  6780                                  .parse358:
  6781                                  
  6782                                  ;-649 }
  6783                                  
  6784                                  
  6785                                  ;-650 int checkcalls() { int i; int j; int k;
  6786                                  
  6787                                   .retnparse:
  6788 0000335A C3                       ret
  6789 0000335B 646566696E65206F72-     parse_0 db "define or include expected",0
  6790 00003364 20696E636C75646520-
  6791 0000336D 657870656374656400 
  6792                                  ; ENDP
  6793                                  
  6794                                  checkcalls:  ; *** PROC ***
  6795                                  
  6796                                  ;-651   prs("\n \n; missing functions: ");
  6797                                  
  6798                                  ;Function : checkcalls, Number of local variables: 3
  6799                                  ;   # type sign width addr used name   list of local variables
  6800                                  ;  200 var sign word   650 NULL i = bp-2
  6801                                  ;  201 var sign word   650 NULL j = bp-4
  6802                                  ;  202 var sign word   650 NULL k = bp-6;
  6803 00003376 C8060000                 ENTER  6,0
  6804 0000337A 68[5C34]                 push checkcalls_0
  6805 0000337D E8CC11                   call prs
  6806 00003380 83C402                   add  sp, 2
  6807                                  
  6808                                  ;-652   i=0;  k=0;
  6809                                  
  6810 00003383 B80000                   mov ax, 0
  6811 00003386 8946FE                   mov [bp-2], ax
  6812 00003389 B80000                   mov ax, 0
  6813 0000338C 8946FA                   mov [bp-6], ax
  6814                                  
  6815                                  ;-653   while (i < CTop) {
  6816                                  
  6817                                  .checkcalls359:
  6818 0000338F 8B46FE                   mov ax, [bp-2]
  6819 00003392 3B06[3D00]               cmp ax, [CTop]
  6820 00003396 0F8D8F00                 jge .checkcalls360
  6821                                  
  6822                                  ;-654     pt=CAdr[i];
  6823                                  
  6824 0000339A 8B5EFE                   mov bx, [bp-2]
  6825 0000339D D1E3                     shl bx, 1
  6826 0000339F 8B8757AB                 mov ax, [CAdr + bx]
  6827 000033A3 A3[6A00]                 mov word [pt], ax
  6828                                  
  6829                                  ;-655     from_far(NameA, pt);
  6830                                  
  6831 000033A6 FF36[6A00]               push word [pt]
  6832 000033AA 8D06[3F00]               lea  ax, [NameA]
  6833 000033AE 50                       push ax
  6834 000033AF E8FA1F                   call from_far
  6835 000033B2 83C404                   add  sp, 4
  6836                                  
  6837                                  ;-656     j=0;
  6838                                  
  6839 000033B5 B80000                   mov ax, 0
  6840 000033B8 8946FC                   mov [bp-4], ax
  6841                                  
  6842                                  ;-657     do { p1=adrF(FNameField, j);
  6843                                  
  6844                                  .checkcalls361:
  6845 000033BB FF76FC                   push word [bp-4]
  6846 000033BE 8D064FBD                 lea  ax, [FNameField]
  6847 000033C2 50                       push ax
  6848 000033C3 E885D5                   call adrF
  6849 000033C6 83C404                   add  sp, 4
  6850 000033C9 A3[6C00]                 mov word [p1], ax
  6851                                  
  6852                                  ;-658       if (eqstr(NameA, p1)){ CType[i]=1; j=FTop; }
  6853                                  
  6854 000033CC FF36[6C00]               push word [p1]
  6855 000033D0 8D06[3F00]               lea  ax, [NameA]
  6856 000033D4 50                       push ax
  6857 000033D5 E8BECD                   call eqstr
  6858 000033D8 83C404                   add  sp, 4
  6859 000033DB 08C0                     or  al, al
  6860 000033DD 0F841000                 je .checkcalls362
  6861 000033E1 B80100                   mov ax, 1
  6862 000033E4 8B5EFE                   mov bx, [bp-2]
  6863 000033E7 88872FA1                 mov [CType+bx], al
  6864 000033EB A1[3B00]                 mov ax, [FTop]
  6865 000033EE 8946FC                   mov [bp-4], ax
  6866                                  
  6867                                  ;-659       j++; } while (j < FTop);
  6868                                  
  6869                                  .checkcalls362:
  6870 000033F1 FF46FC                   inc  word[bp-4]
  6871 000033F4 8B46FC                   mov ax, [bp-4]
  6872 000033F7 3B06[3B00]               cmp ax, [FTop]
  6873 000033FB 0F8D0200                 jge .checkcalls363
  6874 000033FF EBBA                     jmp .checkcalls361
  6875                                  .checkcalls363:
  6876                                  
  6877                                  ;-660     if (j == FTop) { k++; prs("\n; "); prs(NameA); }
  6878                                  
  6879 00003401 8B46FC                   mov ax, [bp-4]
  6880 00003404 3B06[3B00]               cmp ax, [FTop]
  6881 00003408 0F851700                 jne .checkcalls364
  6882 0000340C FF46FA                   inc  word[bp-6]
  6883 0000340F 68[7734]                 push checkcalls_1
  6884 00003412 E83711                   call prs
  6885 00003415 83C402                   add  sp, 2
  6886 00003418 8D06[3F00]               lea  ax, [NameA]
  6887 0000341C 50                       push ax
  6888 0000341D E82C11                   call prs
  6889 00003420 83C402                   add  sp, 2
  6890                                  
  6891                                  ;-661     i++; }
  6892                                  
  6893                                  .checkcalls364:
  6894 00003423 FF46FE                   inc  word[bp-2]
  6895                                  
  6896                                  ;-662   prs("\n; Number of unresolved CALLs :"); printint51(k);
  6897                                  
  6898 00003426 E966FF                   jmp .checkcalls359
  6899                                  .checkcalls360:
  6900 00003429 68[7C34]                 push checkcalls_2
  6901 0000342C E81D11                   call prs
  6902 0000342F 83C402                   add  sp, 2
  6903 00003432 FF76FA                   push word [bp-6]
  6904 00003435 E8B012                   call printint51
  6905 00003438 83C402                   add  sp, 2
  6906                                  
  6907                                  ;-663   if (k!=0) error1("At least 1 function is missing! "); 
  6908                                  
  6909 0000343B 8B46FA                   mov ax, [bp-6]
  6910 0000343E 83F800                   cmp ax, 0
  6911 00003441 0F840C00                 je  .checkcalls365
  6912 00003445 68[9D34]                 push checkcalls_3
  6913 00003448 E8EC13                   call error1
  6914 0000344B 83C402                   add  sp, 2
  6915                                  
  6916                                  ;-664     else prs(" All FUNCTIONs in place");
  6917                                  
  6918 0000344E E90900                   jmp .checkcalls366
  6919                                  .checkcalls365:
  6920 00003451 68[BE34]                 push checkcalls_4
  6921 00003454 E8F510                   call prs
  6922 00003457 83C402                   add  sp, 2
  6923                                  
  6924                                  ;-665 }
  6925                                  
  6926                                  .checkcalls366:
  6927                                  
  6928                                  ;-666 
  6929                                  
  6930                                  
  6931                                  ;-667 int doinclude() { int fdtemp;
  6932 0000345A C9                       LEAVE
  6933 0000345B C3                       ret
  6934 0000345C 5C6E205C6E3B206D69-     checkcalls_0 db "\n \n; missing functions: ",0
  6935 00003465 7373696E672066756E-
  6936 0000346E 6374696F6E733A2000 
  6937 00003477 5C6E3B2000              checkcalls_1 db "\n; ",0
  6938 0000347C 5C6E3B204E756D6265-     checkcalls_2 db "\n; Number of unresolved CALLs :",0
  6939 00003485 72206F6620756E7265-
  6940 0000348E 736F6C766564204341-
  6941 00003497 4C4C73203A00       
  6942 0000349D 4174206C6561737420-     checkcalls_3 db "At least 1 function is missing! ",0
  6943 000034A6 312066756E6374696F-
  6944 000034AF 6E206973206D697373-
  6945 000034B8 696E67212000       
  6946 000034BE 20416C6C2046554E43-     checkcalls_4 db " All FUNCTIONs in place",0
  6947 000034C7 54494F4E7320696E20-
  6948 000034D0 706C61636500       
  6949                                  ; ENDP
  6950                                  
  6951                                  doinclude:  ; *** PROC ***
  6952                                  
  6953                                  ;-668   if (token==T_STRING) {  fdtemp=fdin;
  6954                                  
  6955                                  ;Function : doinclude, Number of local variables: 1
  6956                                  ;   # type sign width addr used name   list of local variables
  6957                                  ;  200 var sign word   667 NULL fdtemp = bp-2;
  6958 000034D6 C8020000                 ENTER  2,0
  6959 000034DA A1[1C00]                 mov ax, [token]
  6960 000034DD 3D0201                   cmp ax, 258
  6961 000034E0 0F858700                 jne .doinclude367
  6962 000034E4 A1[1800]                 mov ax, [fdin]
  6963 000034E7 8946FE                   mov [bp-2], ax
  6964                                  
  6965                                  ;-669   prs("\n;Use include file: "); prs(symbol);
  6966                                  
  6967 000034EA 68[6D35]                 push doinclude_0
  6968 000034ED E85C10                   call prs
  6969 000034F0 83C402                   add  sp, 2
  6970 000034F3 8D062B81                 lea  ax, [symbol]
  6971 000034F7 50                       push ax
  6972 000034F8 E85110                   call prs
  6973 000034FB 83C402                   add  sp, 2
  6974                                  
  6975                                  ;-670   fdin=openR(symbol);
  6976                                  
  6977 000034FE 8D062B81                 lea  ax, [symbol]
  6978 00003502 50                       push ax
  6979 00003503 E8D0CB                   call openR
  6980 00003506 83C402                   add  sp, 2
  6981 00003509 A3[1800]                 mov word [fdin], ax
  6982                                  
  6983                                  ;-671   if (DOS_ERR !=0) {prs("Include file missing: "); prs(symbol);
  6984                                  
  6985 0000350C A1[6E00]                 mov ax, [DOS_ERR]
  6986 0000350F 83F800                   cmp ax, 0
  6987 00003512 0F841D00                 je  .doinclude368
  6988 00003516 68[8335]                 push doinclude_1
  6989 00003519 E83010                   call prs
  6990 0000351C 83C402                   add  sp, 2
  6991 0000351F 8D062B81                 lea  ax, [symbol]
  6992 00003523 50                       push ax
  6993 00003524 E82510                   call prs
  6994 00003527 83C402                   add  sp, 2
  6995                                  
  6996                                  ;-672     error1(" Stop!!"); }
  6997                                  
  6998 0000352A 68[9A35]                 push doinclude_2
  6999 0000352D E80713                   call error1
  7000 00003530 83C402                   add  sp, 2
  7001                                  
  7002                                  ;-673   linenoinclude=lineno; lineno=1;
  7003                                  
  7004                                  .doinclude368:
  7005 00003533 A1[6600]                 mov ax, [lineno]
  7006 00003536 A3[6800]                 mov word [linenoinclude], ax
  7007 00003539 B80100                   mov ax, 1
  7008 0000353C A3[6600]                 mov word [lineno], ax
  7009                                  
  7010                                  ;-674   parse(); lineno=linenoinclude;
  7011                                  
  7012 0000353F E89DFD                   call parse
  7013 00003542 A1[6800]                 mov ax, [linenoinclude]
  7014 00003545 A3[6600]                 mov word [lineno], ax
  7015                                  
  7016                                  ;-675   fdin=fdtemp; prs("\n;Back to main program: "); prs(namein);
  7017                                  
  7018 00003548 8B46FE                   mov ax, [bp-2]
  7019 0000354B A3[1800]                 mov word [fdin], ax
  7020 0000354E 68[A235]                 push doinclude_3
  7021 00003551 E8F80F                   call prs
  7022 00003554 83C402                   add  sp, 2
  7023 00003557 8D06EE81                 lea  ax, [namein]
  7024 0000355B 50                       push ax
  7025 0000355C E8ED0F                   call prs
  7026 0000355F 83C402                   add  sp, 2
  7027                                  
  7028                                  ;-676   getfirstchar(); token=getlex(); }
  7029                                  
  7030 00003562 E857FB                   call getfirstchar
  7031 00003565 E88B07                   call getlex
  7032 00003568 A3[1C00]                 mov word [token], ax
  7033                                  
  7034                                  ;-677 }
  7035                                  
  7036                                  .doinclude367:
  7037                                  
  7038                                  ;-678 int dodefine() { int i; int j; int fdtemp;
  7039 0000356B C9                       LEAVE
  7040 0000356C C3                       ret
  7041 0000356D 5C6E3B55736520696E-     doinclude_0 db "\n;Use include file: ",0
  7042 00003576 636C7564652066696C-
  7043 0000357F 653A2000           
  7044 00003583 496E636C7564652066-     doinclude_1 db "Include file missing: ",0
  7045 0000358C 696C65206D69737369-
  7046 00003595 6E673A2000         
  7047 0000359A 2053746F70212100        doinclude_2 db " Stop!!",0
  7048 000035A2 5C6E3B4261636B2074-     doinclude_3 db "\n;Back to main program: ",0
  7049 000035AB 6F206D61696E207072-
  7050 000035B4 6F6772616D3A2000   
  7051                                  ; ENDP
  7052                                  
  7053                                  dodefine:  ; *** PROC ***
  7054                                  
  7055                                  ;-679   if (eqstr(symbol, "ORGDATA")) {token=getlex();
  7056                                  
  7057                                  ;Function : dodefine, Number of local variables: 3
  7058                                  ;   # type sign width addr used name   list of local variables
  7059                                  ;  200 var sign word   678 NULL i = bp-2
  7060                                  ;  201 var sign word   678 NULL j = bp-4
  7061                                  ;  202 var sign word   678 NULL fdtemp = bp-6;
  7062 000035BC C8060000                 ENTER  6,0
  7063 000035C0 68[0337]                 push dodefine_0
  7064 000035C3 8D062B81                 lea  ax, [symbol]
  7065 000035C7 50                       push ax
  7066 000035C8 E8CBCB                   call eqstr
  7067 000035CB 83C404                   add  sp, 4
  7068 000035CE 08C0                     or  al, al
  7069 000035D0 0F841500                 je .dodefine369
  7070 000035D4 E81C07                   call getlex
  7071 000035D7 A3[1C00]                 mov word [token], ax
  7072                                  
  7073                                  ;-680     ORGDATAORIG=lexval; orgData=lexval; return; }
  7074                                  
  7075 000035DA A1[2E00]                 mov ax, [lexval]
  7076 000035DD A3[0E00]                 mov word [ORGDATAORIG], ax
  7077 000035E0 A1[2E00]                 mov ax, [lexval]
  7078 000035E3 A3[1000]                 mov word [orgData], ax
  7079 000035E6 E91801                   jmp .retndodefine
  7080                                  
  7081                                  ;-681   if (eqstr(symbol, "ARCHIVE")){token=getlex();  if (token==T_STRING) {
  7082                                  
  7083                                  .dodefine369:
  7084 000035E9 68[0B37]                 push dodefine_1
  7085 000035EC 8D062B81                 lea  ax, [symbol]
  7086 000035F0 50                       push ax
  7087 000035F1 E8A2CB                   call eqstr
  7088 000035F4 83C404                   add  sp, 4
  7089 000035F7 08C0                     or  al, al
  7090 000035F9 0F844900                 je .dodefine370
  7091 000035FD E8F306                   call getlex
  7092 00003600 A3[1C00]                 mov word [token], ax
  7093 00003603 A1[1C00]                 mov ax, [token]
  7094 00003606 3D0201                   cmp ax, 258
  7095 00003609 0F852700                 jne .dodefine371
  7096                                  
  7097                                  ;-682     prs("\n;Use archive file: ");
  7098                                  
  7099 0000360D 68[1337]                 push dodefine_2
  7100 00003610 E8390F                   call prs
  7101 00003613 83C402                   add  sp, 2
  7102                                  
  7103                                  ;-683     strcpy(archivename, symbol); prs(archivename);
  7104                                  
  7105 00003616 8D062B81                 lea  ax, [symbol]
  7106 0000361A 50                       push ax
  7107 0000361B 8D067482                 lea  ax, [archivename]
  7108 0000361F 50                       push ax
  7109 00003620 E843CB                   call strcpy
  7110 00003623 83C404                   add  sp, 4
  7111 00003626 8D067482                 lea  ax, [archivename]
  7112 0000362A 50                       push ax
  7113 0000362B E81E0F                   call prs
  7114 0000362E 83C402                   add  sp, 2
  7115                                  
  7116                                  ;-684     } else error1("Name of archive file missing"); token=getlex(); return;}
  7117                                  
  7118 00003631 E90900                   jmp .dodefine372
  7119                                  .dodefine371:
  7120 00003634 68[2937]                 push dodefine_3
  7121 00003637 E8FD11                   call error1
  7122 0000363A 83C402                   add  sp, 2
  7123                                  .dodefine372:
  7124 0000363D E8B306                   call getlex
  7125 00003640 A3[1C00]                 mov word [token], ax
  7126 00003643 E9BB00                   jmp .retndodefine
  7127                                  
  7128                                  ;-685    expect(T_NAME);
  7129                                  
  7130                                  .dodefine370:
  7131 00003646 680001                   push 256
  7132 00003649 E8ED0D                   call expect
  7133 0000364C 83C402                   add  sp, 2
  7134                                  
  7135                                  ;-686   if (token==T_CONST) { 
  7136                                  
  7137 0000364F A1[1C00]                 mov ax, [token]
  7138 00003652 3D0101                   cmp ax, 257
  7139 00003655 0F85A800                 jne .dodefine373
  7140                                  
  7141                                  ;-687     if (GTop >= LSTART) error1("global table (define) full");
  7142                                  
  7143 00003659 A1[2A00]                 mov ax, [GTop]
  7144 0000365C 3DC800                   cmp ax, 200 ;unsigned : 1
  7145 0000365F 0F8C0900                 jl  .dodefine374
  7146 00003663 68[4637]                 push dodefine_4
  7147 00003666 E8CE11                   call error1
  7148 00003669 83C402                   add  sp, 2
  7149                                  
  7150                                  ;-688     i=strlen(symbol); if (i>15) error1("Define name longer 15 char");
  7151                                  
  7152                                  .dodefine374:
  7153 0000366C 8D062B81                 lea  ax, [symbol]
  7154 00003670 50                       push ax
  7155 00003671 E8CACA                   call strlen
  7156 00003674 83C402                   add  sp, 2
  7157 00003677 8946FE                   mov [bp-2], ax
  7158 0000367A 8B46FE                   mov ax, [bp-2]
  7159 0000367D 83F80F                   cmp ax, 15
  7160 00003680 0F8E0900                 jle .dodefine375
  7161 00003684 68[6137]                 push dodefine_5
  7162 00003687 E8AD11                   call error1
  7163 0000368A 83C402                   add  sp, 2
  7164                                  
  7165                                  ;-689     GSign [GTop]='U'; GWidth[GTop]=1; GType [GTop]='#';
  7166                                  
  7167                                  .dodefine375:
  7168 0000368D B85500                   mov ax, 85
  7169 00003690 8B1E[2A00]               mov bx, [GTop]
  7170 00003694 8887E383                 mov [GSign+bx], al
  7171 00003698 B80100                   mov ax, 1
  7172 0000369B 8B1E[2A00]               mov bx, [GTop]
  7173 0000369F 88870F85                 mov [GWidth+bx], al
  7174 000036A3 B82300                   mov ax, 35
  7175 000036A6 8B1E[2A00]               mov bx, [GTop]
  7176 000036AA 8887B782                 mov [GType+bx], al
  7177                                  
  7178                                  ;-690     GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  7179                                  
  7180 000036AE A1[6600]                 mov ax, [lineno]
  7181 000036B1 83E801                   sub ax, 1
  7182 000036B4 8B1E[2A00]               mov bx, [GTop]
  7183 000036B8 D1E3                     shl bx, 1
  7184 000036BA 89873B86                 mov [GAdr+bx], ax
  7185 000036BE B80000                   mov ax, 0
  7186 000036C1 8B1E[2A00]               mov bx, [GTop]
  7187 000036C5 D1E3                     shl bx, 1
  7188 000036C7 89879388                 mov [GUsed+bx], ax
  7189                                  
  7190                                  ;-691     pt=adrofname(GTop); strcpy(pt, symbol); GData[GTop]=lexval;
  7191                                  
  7192 000036CB FF36[2A00]               push word [GTop]
  7193 000036CF E865D2                   call adrofname
  7194 000036D2 83C402                   add  sp, 2
  7195 000036D5 A3[6A00]                 mov word [pt], ax
  7196 000036D8 8D062B81                 lea  ax, [symbol]
  7197 000036DC 50                       push ax
  7198 000036DD FF36[6A00]               push word [pt]
  7199 000036E1 E882CA                   call strcpy
  7200 000036E4 83C404                   add  sp, 4
  7201 000036E7 A1[2E00]                 mov ax, [lexval]
  7202 000036EA 8B1E[2A00]               mov bx, [GTop]
  7203 000036EE D1E3                     shl bx, 1
  7204 000036F0 8987EB8A                 mov [GData+bx], ax
  7205                                  
  7206                                  ;-692     expect(T_CONST); GTop++;  } 
  7207                                  
  7208 000036F4 680101                   push 257
  7209 000036F7 E83F0D                   call expect
  7210 000036FA 83C402                   add  sp, 2
  7211 000036FD FF06[2A00]               inc  word[GTop]
  7212                                  
  7213                                  ;-693 }
  7214                                  
  7215                                  .dodefine373:
  7216                                  
  7217                                  ;-694 int stmt() { int c; char cha;
  7218                                  
  7219 00003701 C9                       .retndodefine: LEAVE
  7220 00003702 C3                       ret
  7221 00003703 4F52474441544100        dodefine_0 db "ORGDATA",0
  7222 0000370B 4152434849564500        dodefine_1 db "ARCHIVE",0
  7223 00003713 5C6E3B557365206172-     dodefine_2 db "\n;Use archive file: ",0
  7224 0000371C 63686976652066696C-
  7225 00003725 653A2000           
  7226 00003729 4E616D65206F662061-     dodefine_3 db "Name of archive file missing",0
  7227 00003732 726368697665206669-
  7228 0000373B 6C65206D697373696E-
  7229 00003744 6700               
  7230 00003746 676C6F62616C207461-     dodefine_4 db "global table (define) full",0
  7231 0000374F 626C65202864656669-
  7232 00003758 6E65292066756C6C00 
  7233 00003761 446566696E65206E61-     dodefine_5 db "Define name longer 15 char",0
  7234 0000376A 6D65206C6F6E676572-
  7235 00003773 203135206368617200 
  7236                                  ; ENDP
  7237                                  
  7238                                  stmt:  ; *** PROC ***
  7239                                  
  7240                                  ;-695        if(istoken('{'))     {while(istoken('}')==0) stmt();}
  7241                                  
  7242                                  ;Function : stmt, Number of local variables: 2
  7243                                  ;   # type sign width addr used name   list of local variables
  7244                                  ;  200 var sign word   694 NULL c = bp-2
  7245                                  ;  201 var sign byte   694 NULL cha = bp-4;
  7246 0000377C C8040000                 ENTER  4,0
  7247 00003780 6A7B                     push 123
  7248 00003782 E8920C                   call istoken
  7249 00003785 83C402                   add  sp, 2
  7250 00003788 08C0                     or  al, al
  7251 0000378A 0F841700                 je .stmt376
  7252                                  .stmt377:
  7253 0000378E 6A7D                     push 125
  7254 00003790 E8840C                   call istoken
  7255 00003793 83C402                   add  sp, 2
  7256 00003796 83F800                   cmp ax, 0
  7257 00003799 0F850500                 jne .stmt378
  7258 0000379D E8DCFF                   call stmt
  7259 000037A0 EBEC                     jmp .stmt377
  7260                                  .stmt378:
  7261                                  
  7262                                  ;-696   else if(istoken(T_IF))    doif();
  7263                                  
  7264 000037A2 E9B001                   jmp .stmt379
  7265                                  .stmt376:
  7266 000037A5 680102                   push 513
  7267 000037A8 E86C0C                   call istoken
  7268 000037AB 83C402                   add  sp, 2
  7269 000037AE 08C0                     or  al, al
  7270 000037B0 0F840600                 je .stmt380
  7271 000037B4 E8E203                   call doif
  7272                                  
  7273                                  ;-697   else if(istoken(T_DO))    dodo();
  7274                                  
  7275 000037B7 E99B01                   jmp .stmt381
  7276                                  .stmt380:
  7277 000037BA 680402                   push 516
  7278 000037BD E8570C                   call istoken
  7279 000037C0 83C402                   add  sp, 2
  7280 000037C3 08C0                     or  al, al
  7281 000037C5 0F840600                 je .stmt382
  7282 000037C9 E82F04                   call dodo
  7283                                  
  7284                                  ;-698   else if(istoken(T_WHILE)) dowhile();
  7285                                  
  7286 000037CC E98601                   jmp .stmt383
  7287                                  .stmt382:
  7288 000037CF 680302                   push 515
  7289 000037D2 E8420C                   call istoken
  7290 000037D5 83C402                   add  sp, 2
  7291 000037D8 08C0                     or  al, al
  7292 000037DA 0F840600                 je .stmt384
  7293 000037DE E86704                   call dowhile
  7294                                  
  7295                                  ;-699   else if(istoken(T_GOTO))  {prs("\n jmp .");name1();prs(symbol);expect(';');}
  7296                                  
  7297 000037E1 E97101                   jmp .stmt385
  7298                                  .stmt384:
  7299 000037E4 680902                   push 521
  7300 000037E7 E82D0C                   call istoken
  7301 000037EA 83C402                   add  sp, 2
  7302 000037ED 08C0                     or  al, al
  7303 000037EF 0F842200                 je .stmt386
  7304 000037F3 68[5739]                 push stmt_0
  7305 000037F6 E8530D                   call prs
  7306 000037F9 83C402                   add  sp, 2
  7307 000037FC E867D3                   call name1
  7308 000037FF 8D062B81                 lea  ax, [symbol]
  7309 00003803 50                       push ax
  7310 00003804 E8450D                   call prs
  7311 00003807 83C402                   add  sp, 2
  7312 0000380A 6A3B                     push 59
  7313 0000380C E82A0C                   call expect
  7314 0000380F 83C402                   add  sp, 2
  7315                                  
  7316                                  ;-700   else if(token==T_ASM)     {prs("\n"); c=next();
  7317                                  
  7318 00003812 E94001                   jmp .stmt387
  7319                                  .stmt386:
  7320 00003815 A1[1C00]                 mov ax, [token]
  7321 00003818 3D0602                   cmp ax, 518
  7322 0000381B 0F853300                 jne .stmt388
  7323 0000381F 68[6039]                 push stmt_1
  7324 00003822 E8270D                   call prs
  7325 00003825 83C402                   add  sp, 2
  7326 00003828 E8CE0B                   call next
  7327 0000382B 8946FE                   mov [bp-2], ax
  7328                                  
  7329                                  ;-701         while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }
  7330                                  
  7331                                  .stmt389:
  7332 0000382E 8B46FE                   mov ax, [bp-2]
  7333 00003831 83F80A                   cmp ax, 10
  7334 00003834 0F841100                 je  .stmt390
  7335 00003838 FF76FE                   push word [bp-2]
  7336 0000383B E8A70C                   call prc
  7337 0000383E 83C402                   add  sp, 2
  7338 00003841 E8B50B                   call next
  7339 00003844 8946FE                   mov [bp-2], ax
  7340 00003847 EBE5                     jmp .stmt389
  7341                                  .stmt390:
  7342 00003849 E8A704                   call getlex
  7343 0000384C A3[1C00]                 mov word [token], ax
  7344                                  
  7345                                  ;-702   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();  
  7346                                  
  7347 0000384F E90301                   jmp .stmt391
  7348                                  .stmt388:
  7349 00003852 680702                   push 519
  7350 00003855 E8BF0B                   call istoken
  7351 00003858 83C402                   add  sp, 2
  7352 0000385B 08C0                     or  al, al
  7353 0000385D 0F844B00                 je .stmt392
  7354 00003861 A1[1C00]                 mov ax, [token]
  7355 00003864 83F87B                   cmp ax, 123
  7356 00003867 0F853500                 jne .stmt393
  7357 0000386B 68[6339]                 push stmt_2
  7358 0000386E E8DB0C                   call prs
  7359 00003871 83C402                   add  sp, 2
  7360 00003874 E8820B                   call next
  7361 00003877 8846FC                   mov [bp-4], al
  7362                                  
  7363                                  ;-703         while(cha!= '}') { prc(cha); cha=next(); }
  7364                                  
  7365                                  .stmt394:
  7366 0000387A 8A46FC                   mov al, [bp-4]
  7367 0000387D 3C7D                     cmp al, 125
  7368 0000387F 0F841400                 je  .stmt395
  7369 00003883 8A46FC                   mov al, byte [bp-4]
  7370 00003886 B400                     mov ah, 0
  7371 00003888 50                       push ax
  7372 00003889 E8590C                   call prc
  7373 0000388C 83C402                   add  sp, 2
  7374 0000388F E8670B                   call next
  7375 00003892 8846FC                   mov [bp-4], al
  7376                                  
  7377                                  ;-704         token=getlex(); }
  7378                                  
  7379 00003895 EBE3                     jmp .stmt394
  7380                                  .stmt395:
  7381 00003897 E85904                   call getlex
  7382 0000389A A3[1C00]                 mov word [token], ax
  7383                                  
  7384                                  ;-705         else error1("Curly open expected"); 
  7385                                  
  7386 0000389D E90900                   jmp .stmt396
  7387                                  .stmt393:
  7388 000038A0 68[6639]                 push stmt_3
  7389 000038A3 E8910F                   call error1
  7390 000038A6 83C402                   add  sp, 2
  7391                                  
  7392                                  ;-706         }
  7393                                  
  7394                                  .stmt396:
  7395                                  
  7396                                  ;-707   else if(istoken(T_EMIT))   doemit();
  7397                                  
  7398 000038A9 E9A900                   jmp .stmt397
  7399                                  .stmt392:
  7400 000038AC 680802                   push 520
  7401 000038AF E8650B                   call istoken
  7402 000038B2 83C402                   add  sp, 2
  7403 000038B5 08C0                     or  al, al
  7404 000038B7 0F840600                 je .stmt398
  7405 000038BB E8CD00                   call doemit
  7406                                  
  7407                                  ;-708   else if(istoken(';'))      { }
  7408                                  
  7409 000038BE E99400                   jmp .stmt399
  7410                                  .stmt398:
  7411 000038C1 6A3B                     push 59
  7412 000038C3 E8510B                   call istoken
  7413 000038C6 83C402                   add  sp, 2
  7414 000038C9 08C0                     or  al, al
  7415 000038CB 0F840300                 je .stmt400
  7416                                  
  7417                                  ;-709   else if(istoken(T_RETURN)) {
  7418                                  
  7419 000038CF E98300                   jmp .stmt401
  7420                                  .stmt400:
  7421 000038D2 680002                   push 512
  7422 000038D5 E83F0B                   call istoken
  7423 000038D8 83C402                   add  sp, 2
  7424 000038DB 08C0                     or  al, al
  7425 000038DD 0F843000                 je .stmt402
  7426                                  
  7427                                  ;-710         if (token!=';') exprstart();
  7428                                  
  7429 000038E1 A1[1C00]                 mov ax, [token]
  7430 000038E4 83F83B                   cmp ax, 59
  7431 000038E7 0F840300                 je  .stmt403
  7432 000038EB E852D9                   call exprstart
  7433                                  
  7434                                  ;-711         prs("\n jmp .retn"); 
  7435                                  
  7436                                  .stmt403:
  7437 000038EE 68[7A39]                 push stmt_4
  7438 000038F1 E8580C                   call prs
  7439 000038F4 83C402                   add  sp, 2
  7440                                  
  7441                                  ;-712         prs(fname);
  7442                                  
  7443 000038F7 8D06AB81                 lea  ax, [fname]
  7444 000038FB 50                       push ax
  7445 000038FC E84D0C                   call prs
  7446 000038FF 83C402                   add  sp, 2
  7447                                  
  7448                                  ;-713         nreturn++; 
  7449                                  
  7450 00003902 FF06[2600]               inc  word[nreturn]
  7451                                  
  7452                                  ;-714         expect(';');
  7453                                  
  7454 00003906 6A3B                     push 59
  7455 00003908 E82E0B                   call expect
  7456 0000390B 83C402                   add  sp, 2
  7457                                  
  7458                                  ;-715         }
  7459                                  
  7460                                  
  7461                                  ;-716   else if(thechar==':')      {
  7462                                  
  7463 0000390E E94400                   jmp .stmt404
  7464                                  .stmt402:
  7465 00003911 A0[2100]                 mov al, [thechar]
  7466 00003914 3C3A                     cmp al, 58
  7467 00003916 0F853000                 jne .stmt405
  7468                                  
  7469                                  ;-717         prs("\n."); // Label
  7470                                  
  7471 0000391A 68[8739]                 push stmt_5
  7472 0000391D E82C0C                   call prs
  7473 00003920 83C402                   add  sp, 2
  7474                                  
  7475                                  ;-718         prs(symbol); prc(':');  
  7476                                  
  7477 00003923 8D062B81                 lea  ax, [symbol]
  7478 00003927 50                       push ax
  7479 00003928 E8210C                   call prs
  7480 0000392B 83C402                   add  sp, 2
  7481 0000392E 6A3A                     push 58
  7482 00003930 E8B20B                   call prc
  7483 00003933 83C402                   add  sp, 2
  7484                                  
  7485                                  ;-719         expect(T_NAME); 
  7486                                  
  7487 00003936 680001                   push 256
  7488 00003939 E8FD0A                   call expect
  7489 0000393C 83C402                   add  sp, 2
  7490                                  
  7491                                  ;-720         expect(':'); 
  7492                                  
  7493 0000393F 6A3A                     push 58
  7494 00003941 E8F50A                   call expect
  7495 00003944 83C402                   add  sp, 2
  7496                                  
  7497                                  ;-721         }
  7498                                  
  7499                                  
  7500                                  ;-722   else  {exprstart(); expect(';'); } 
  7501                                  
  7502 00003947 E90B00                   jmp .stmt406
  7503                                  .stmt405:
  7504 0000394A E8F3D8                   call exprstart
  7505 0000394D 6A3B                     push 59
  7506 0000394F E8E70A                   call expect
  7507 00003952 83C402                   add  sp, 2
  7508                                  
  7509                                  ;-723 }
  7510                                  
  7511                                  .stmt406:
  7512                                  .stmt404:
  7513                                  .stmt401:
  7514                                  .stmt399:
  7515                                  .stmt397:
  7516                                  .stmt391:
  7517                                  .stmt387:
  7518                                  .stmt385:
  7519                                  .stmt383:
  7520                                  .stmt381:
  7521                                  .stmt379:
  7522                                  
  7523                                  ;-724 
  7524                                  
  7525                                  
  7526                                  ;-725 int doemit() {prs("\n db ");
  7527 00003955 C9                       LEAVE
  7528 00003956 C3                       ret
  7529 00003957 5C6E206A6D70202E00      stmt_0 db "\n jmp .",0
  7530 00003960 5C6E00                  stmt_1 db "\n",0
  7531 00003963 5C6E00                  stmt_2 db "\n",0
  7532 00003966 4375726C79206F7065-     stmt_3 db "Curly open expected",0
  7533 0000396F 6E2065787065637465-
  7534 00003978 6400               
  7535 0000397A 5C6E206A6D70202E72-     stmt_4 db "\n jmp .retn",0
  7536 00003983 65746E00           
  7537 00003987 5C6E2E00                stmt_5 db "\n.",0
  7538                                  ; ENDP
  7539                                  
  7540                                  doemit:  ; *** PROC ***
  7541 0000398B 68[C739]                 push doemit_0
  7542 0000398E E8BB0B                   call prs
  7543 00003991 83C402                   add  sp, 2
  7544                                  
  7545                                  ;-726   L1: token=getlex(); prunsign1(lexval); token=getlex();
  7546                                  
  7547                                  .L1:
  7548 00003994 E85C03                   call getlex
  7549 00003997 A3[1C00]                 mov word [token], ax
  7550 0000399A FF36[2E00]               push word [lexval]
  7551 0000399E E8050D                   call prunsign1
  7552 000039A1 83C402                   add  sp, 2
  7553 000039A4 E84C03                   call getlex
  7554 000039A7 A3[1C00]                 mov word [token], ax
  7555                                  
  7556                                  ;-727     if (token== ',') {prc(','); goto L1;} expect(')'); }
  7557                                  
  7558 000039AA A1[1C00]                 mov ax, [token]
  7559 000039AD 83F82C                   cmp ax, 44
  7560 000039B0 0F850A00                 jne .doemit407
  7561 000039B4 6A2C                     push 44
  7562 000039B6 E82C0B                   call prc
  7563 000039B9 83C402                   add  sp, 2
  7564 000039BC EBD6                     jmp .L1
  7565                                  .doemit407:
  7566 000039BE 6A29                     push 41
  7567 000039C0 E8760A                   call expect
  7568 000039C3 83C402                   add  sp, 2
  7569                                  
  7570                                  ;-728 
  7571                                  
  7572                                  
  7573                                  ;-729 int cmpneg(int ids) {
  7574                                  
  7575 000039C6 C3                       ret
  7576 000039C7 5C6E2064622000          doemit_0 db "\n db ",0
  7577                                  ; ENDP
  7578                                  
  7579                                  cmpneg:  ; *** PROC ***
  7580                                  
  7581                                  ;-730        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
  7582                                  
  7583                                  ;Function : cmpneg, Number of local variables: 1
  7584                                  ;   # type sign width addr used name   list of local variables
  7585                                  ;  200 var sign word   729 NULL ids = bp+4;
  7586 000039CE C8000000                 ENTER  0,0
  7587 000039D2 A1[2200]                 mov ax, [iscmp]
  7588 000039D5 3D2603                   cmp ax, 806
  7589 000039D8 0F850C00                 jne .cmpneg408
  7590 000039DC 68[AF3A]                 push cmpneg_0
  7591 000039DF E86A0B                   call prs
  7592 000039E2 83C402                   add  sp, 2
  7593                                  
  7594                                  ;-731   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1
  7595                                  
  7596 000039E5 E9C500                   jmp .cmpneg409
  7597                                  .cmpneg408:
  7598 000039E8 A1[2200]                 mov ax, [iscmp]
  7599 000039EB 3D2703                   cmp ax, 807
  7600 000039EE 0F850C00                 jne .cmpneg410
  7601 000039F2 68[B83A]                 push cmpneg_1
  7602 000039F5 E8540B                   call prs
  7603 000039F8 83C402                   add  sp, 2
  7604                                  
  7605                                  ;-732   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF
  7606                                  
  7607 000039FB E9AF00                   jmp .cmpneg411
  7608                                  .cmpneg410:
  7609 000039FE A1[2200]                 mov ax, [iscmp]
  7610 00003A01 3D3803                   cmp ax, 824
  7611 00003A04 0F852100                 jne .cmpneg412
  7612 00003A08 8B4604                   mov ax, [bp+4]
  7613 00003A0B 08C0                     or  al, al
  7614 00003A0D 0F840C00                 je .cmpneg413
  7615 00003A11 68[C13A]                 push cmpneg_2
  7616 00003A14 E8350B                   call prs
  7617 00003A17 83C402                   add  sp, 2
  7618                                  
  7619                                  ;-733                            else prs("\n ja  .");//ZF=0 CF=0
  7620                                  
  7621 00003A1A E90900                   jmp .cmpneg414
  7622                                  .cmpneg413:
  7623 00003A1D 68[CA3A]                 push cmpneg_3
  7624 00003A20 E8290B                   call prs
  7625 00003A23 83C402                   add  sp, 2
  7626                                  
  7627                                  ;-734   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);
  7628                                  
  7629                                  .cmpneg414:
  7630 00003A26 E98400                   jmp .cmpneg415
  7631                                  .cmpneg412:
  7632 00003A29 A1[2200]                 mov ax, [iscmp]
  7633 00003A2C 3D2B03                   cmp ax, 811
  7634 00003A2F 0F854500                 jne .cmpneg416
  7635 00003A33 8B4604                   mov ax, [bp+4]
  7636 00003A36 08C0                     or  al, al
  7637 00003A38 0F841E00                 je .cmpneg417
  7638 00003A3C 68[D33A]                 push cmpneg_4
  7639 00003A3F E80A0B                   call prs
  7640 00003A42 83C402                   add  sp, 2
  7641 00003A45 FF7604                   push word [bp+4]
  7642 00003A48 E85B0C                   call prunsign1
  7643 00003A4B 83C402                   add  sp, 2
  7644                                  
  7645                                  ;-735                                prs("\n jl  .");}//          SF!=OF
  7646                                  
  7647 00003A4E 68[E13A]                 push cmpneg_5
  7648 00003A51 E8F80A                   call prs
  7649 00003A54 83C402                   add  sp, 2
  7650                                  
  7651                                  ;-736                            else{prs(" ;unsigned : "); prunsign1(ids);
  7652                                  
  7653 00003A57 E91B00                   jmp .cmpneg418
  7654                                  .cmpneg417:
  7655 00003A5A 68[EA3A]                 push cmpneg_6
  7656 00003A5D E8EC0A                   call prs
  7657 00003A60 83C402                   add  sp, 2
  7658 00003A63 FF7604                   push word [bp+4]
  7659 00003A66 E83D0C                   call prunsign1
  7660 00003A69 83C402                   add  sp, 2
  7661                                  
  7662                                  ;-737                                prs("\n jb  .");}//jb=jc=CF=1
  7663                                  
  7664 00003A6C 68[F83A]                 push cmpneg_7
  7665 00003A6F E8DA0A                   call prs
  7666 00003A72 83C402                   add  sp, 2
  7667                                  
  7668                                  ;-738   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF
  7669                                  
  7670                                  .cmpneg418:
  7671 00003A75 E93500                   jmp .cmpneg419
  7672                                  .cmpneg416:
  7673 00003A78 A1[2200]                 mov ax, [iscmp]
  7674 00003A7B 83F83C                   cmp ax, 60
  7675 00003A7E 0F850C00                 jne .cmpneg420
  7676 00003A82 68[013B]                 push cmpneg_8
  7677 00003A85 E8C40A                   call prs
  7678 00003A88 83C402                   add  sp, 2
  7679                                  
  7680                                  ;-739   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF
  7681                                  
  7682 00003A8B E91F00                   jmp .cmpneg421
  7683                                  .cmpneg420:
  7684 00003A8E A1[2200]                 mov ax, [iscmp]
  7685 00003A91 83F83E                   cmp ax, 62
  7686 00003A94 0F850C00                 jne .cmpneg422
  7687 00003A98 68[0A3B]                 push cmpneg_9
  7688 00003A9B E8AE0A                   call prs
  7689 00003A9E 83C402                   add  sp, 2
  7690                                  
  7691                                  ;-740   else error1("internal error compare unknown in CMPNEG()");  }
  7692                                  
  7693 00003AA1 E90900                   jmp .cmpneg423
  7694                                  .cmpneg422:
  7695 00003AA4 68[133B]                 push cmpneg_10
  7696 00003AA7 E88D0D                   call error1
  7697 00003AAA 83C402                   add  sp, 2
  7698                                  .cmpneg423:
  7699                                  .cmpneg421:
  7700                                  .cmpneg419:
  7701                                  .cmpneg415:
  7702                                  .cmpneg411:
  7703                                  .cmpneg409:
  7704                                  
  7705                                  ;-741 
  7706                                  
  7707                                  
  7708                                  ;-742 int prlabel(int n) {prs("\n."); prs(fname); pint1(n); prc(':'); }
  7709 00003AAD C9                       LEAVE
  7710 00003AAE C3                       ret
  7711 00003AAF 5C6E206A6E65202E00      cmpneg_0 db "\n jne .",0
  7712 00003AB8 5C6E206A6520202E00      cmpneg_1 db "\n je  .",0
  7713 00003AC1 5C6E206A6720202E00      cmpneg_2 db "\n jg  .",0
  7714 00003ACA 5C6E206A6120202E00      cmpneg_3 db "\n ja  .",0
  7715 00003AD3 203B756E7369676E65-     cmpneg_4 db " ;unsigned : ",0
  7716 00003ADC 64203A2000         
  7717 00003AE1 5C6E206A6C20202E00      cmpneg_5 db "\n jl  .",0
  7718 00003AEA 203B756E7369676E65-     cmpneg_6 db " ;unsigned : ",0
  7719 00003AF3 64203A2000         
  7720 00003AF8 5C6E206A6220202E00      cmpneg_7 db "\n jb  .",0
  7721 00003B01 5C6E206A6765202E00      cmpneg_8 db "\n jge .",0
  7722 00003B0A 5C6E206A6C65202E00      cmpneg_9 db "\n jle .",0
  7723 00003B13 696E7465726E616C20-     cmpneg_10 db "internal error compare unknown in CMPNEG()",0
  7724 00003B1C 6572726F7220636F6D-
  7725 00003B25 7061726520756E6B6E-
  7726 00003B2E 6F776E20696E20434D-
  7727 00003B37 504E4547282900     
  7728                                  ; ENDP
  7729                                  
  7730                                  prlabel:  ; *** PROC ***
  7731                                  ;Function : prlabel, Number of local variables: 1
  7732                                  ;   # type sign width addr used name   list of local variables
  7733                                  ;  200 var sign word   742 NULL n = bp+4;
  7734 00003B3E C8000000                 ENTER  0,0
  7735 00003B42 68[693B]                 push prlabel_0
  7736 00003B45 E8040A                   call prs
  7737 00003B48 83C402                   add  sp, 2
  7738 00003B4B 8D06AB81                 lea  ax, [fname]
  7739 00003B4F 50                       push ax
  7740 00003B50 E8F909                   call prs
  7741 00003B53 83C402                   add  sp, 2
  7742 00003B56 FF7604                   push word [bp+4]
  7743 00003B59 E8E70A                   call pint1
  7744 00003B5C 83C402                   add  sp, 2
  7745 00003B5F 6A3A                     push 58
  7746 00003B61 E88109                   call prc
  7747 00003B64 83C402                   add  sp, 2
  7748                                  
  7749                                  ;-743 int prjump (int n) {prs("\n jmp ."); prs(fname); pint1(n); }
  7750 00003B67 C9                       LEAVE
  7751 00003B68 C3                       ret
  7752 00003B69 5C6E2E00                prlabel_0 db "\n.",0
  7753                                  ; ENDP
  7754                                  
  7755                                  prjump:  ; *** PROC ***
  7756                                  ;Function : prjump, Number of local variables: 1
  7757                                  ;   # type sign width addr used name   list of local variables
  7758                                  ;  200 var sign word   743 NULL n = bp+4;
  7759 00003B6D C8000000                 ENTER  0,0
  7760 00003B71 68[903B]                 push prjump_0
  7761 00003B74 E8D509                   call prs
  7762 00003B77 83C402                   add  sp, 2
  7763 00003B7A 8D06AB81                 lea  ax, [fname]
  7764 00003B7E 50                       push ax
  7765 00003B7F E8CA09                   call prs
  7766 00003B82 83C402                   add  sp, 2
  7767 00003B85 FF7604                   push word [bp+4]
  7768 00003B88 E8B80A                   call pint1
  7769 00003B8B 83C402                   add  sp, 2
  7770                                  
  7771                                  ;-744 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
  7772 00003B8E C9                       LEAVE
  7773 00003B8F C3                       ret
  7774 00003B90 5C6E206A6D70202E00      prjump_0 db "\n jmp .",0
  7775                                  ; ENDP
  7776                                  
  7777                                  doif:  ; *** PROC ***
  7778                                  ;Function : doif, Number of local variables: 2
  7779                                  ;   # type sign width addr used name   list of local variables
  7780                                  ;  200 var sign word   744 NULL jdest = bp-2
  7781                                  ;  201 var sign word   744 NULL tst = bp-4;
  7782 00003B99 C8040000                 ENTER  4,0
  7783 00003B9D E814D5                   call pexpr
  7784 00003BA0 FF06[2800]               inc  word[nlabel]
  7785 00003BA4 A1[2800]                 mov ax, [nlabel]
  7786 00003BA7 8946FE                   mov [bp-2], ax
  7787                                  
  7788                                  ;-745   pint1(jdest); stmt();
  7789                                  
  7790 00003BAA FF76FE                   push word [bp-2]
  7791 00003BAD E8930A                   call pint1
  7792 00003BB0 83C402                   add  sp, 2
  7793 00003BB3 E8C6FB                   call stmt
  7794                                  
  7795                                  ;-746   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;
  7796                                  
  7797 00003BB6 680202                   push 514
  7798 00003BB9 E85B08                   call istoken
  7799 00003BBC 83C402                   add  sp, 2
  7800 00003BBF 08C0                     or  al, al
  7801 00003BC1 0F842B00                 je .doif424
  7802 00003BC5 FF06[2800]               inc  word[nlabel]
  7803 00003BC9 A1[2800]                 mov ax, [nlabel]
  7804 00003BCC 8946FC                   mov [bp-4], ax
  7805                                  
  7806                                  ;-747     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }
  7807                                  
  7808 00003BCF FF76FC                   push word [bp-4]
  7809 00003BD2 E898FF                   call prjump
  7810 00003BD5 83C402                   add  sp, 2
  7811 00003BD8 FF76FE                   push word [bp-2]
  7812 00003BDB E860FF                   call prlabel
  7813 00003BDE 83C402                   add  sp, 2
  7814 00003BE1 E898FB                   call stmt
  7815 00003BE4 FF76FC                   push word [bp-4]
  7816 00003BE7 E854FF                   call prlabel
  7817 00003BEA 83C402                   add  sp, 2
  7818                                  
  7819                                  ;-748   else prlabel(jdest); }
  7820                                  
  7821 00003BED E90900                   jmp .doif425
  7822                                  .doif424:
  7823 00003BF0 FF76FE                   push word [bp-2]
  7824 00003BF3 E848FF                   call prlabel
  7825 00003BF6 83C402                   add  sp, 2
  7826                                  .doif425:
  7827                                  
  7828                                  ;-749 
  7829                                  
  7830                                  
  7831                                  ;-750 int dodo() {int jdest; int jtemp;
  7832 00003BF9 C9                       LEAVE
  7833 00003BFA C3                       ret
  7834                                  ; ENDP
  7835                                  
  7836                                  dodo:  ; *** PROC ***
  7837                                  
  7838                                  ;-751   nlabel++; jdest=nlabel; prlabel(jdest); stmt();
  7839                                  
  7840                                  ;Function : dodo, Number of local variables: 2
  7841                                  ;   # type sign width addr used name   list of local variables
  7842                                  ;  200 var sign word   750 NULL jdest = bp-2
  7843                                  ;  201 var sign word   750 NULL jtemp = bp-4;
  7844 00003BFB C8040000                 ENTER  4,0
  7845 00003BFF FF06[2800]               inc  word[nlabel]
  7846 00003C03 A1[2800]                 mov ax, [nlabel]
  7847 00003C06 8946FE                   mov [bp-2], ax
  7848 00003C09 FF76FE                   push word [bp-2]
  7849 00003C0C E82FFF                   call prlabel
  7850 00003C0F 83C402                   add  sp, 2
  7851 00003C12 E867FB                   call stmt
  7852                                  
  7853                                  ;-752   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);
  7854                                  
  7855 00003C15 680302                   push 515
  7856 00003C18 E81E08                   call expect
  7857 00003C1B 83C402                   add  sp, 2
  7858 00003C1E E893D4                   call pexpr
  7859 00003C21 FF06[2800]               inc  word[nlabel]
  7860 00003C25 A1[2800]                 mov ax, [nlabel]
  7861 00003C28 8946FC                   mov [bp-4], ax
  7862 00003C2B FF76FC                   push word [bp-4]
  7863 00003C2E E8120A                   call pint1
  7864 00003C31 83C402                   add  sp, 2
  7865                                  
  7866                                  ;-753   prjump(jdest); prlabel(jtemp); }
  7867                                  
  7868 00003C34 FF76FE                   push word [bp-2]
  7869 00003C37 E833FF                   call prjump
  7870 00003C3A 83C402                   add  sp, 2
  7871 00003C3D FF76FC                   push word [bp-4]
  7872 00003C40 E8FBFE                   call prlabel
  7873 00003C43 83C402                   add  sp, 2
  7874                                  
  7875                                  ;-754 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
  7876 00003C46 C9                       LEAVE
  7877 00003C47 C3                       ret
  7878                                  ; ENDP
  7879                                  
  7880                                  dowhile:  ; *** PROC ***
  7881                                  ;Function : dowhile, Number of local variables: 2
  7882                                  ;   # type sign width addr used name   list of local variables
  7883                                  ;  200 var sign word   754 NULL jdest = bp-2
  7884                                  ;  201 var sign word   754 NULL tst = bp-4;
  7885 00003C48 C8040000                 ENTER  4,0
  7886 00003C4C FF06[2800]               inc  word[nlabel]
  7887 00003C50 A1[2800]                 mov ax, [nlabel]
  7888 00003C53 8946FE                   mov [bp-2], ax
  7889                                  
  7890                                  ;-755   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);
  7891                                  
  7892 00003C56 FF76FE                   push word [bp-2]
  7893 00003C59 E8E2FE                   call prlabel
  7894 00003C5C 83C402                   add  sp, 2
  7895 00003C5F E852D4                   call pexpr
  7896 00003C62 FF06[2800]               inc  word[nlabel]
  7897 00003C66 A1[2800]                 mov ax, [nlabel]
  7898 00003C69 8946FC                   mov [bp-4], ax
  7899 00003C6C FF76FC                   push word [bp-4]
  7900 00003C6F E8D109                   call pint1
  7901 00003C72 83C402                   add  sp, 2
  7902                                  
  7903                                  ;-756   stmt(); prjump(jdest); prlabel(tst); }
  7904                                  
  7905 00003C75 E804FB                   call stmt
  7906 00003C78 FF76FE                   push word [bp-2]
  7907 00003C7B E8EFFE                   call prjump
  7908 00003C7E 83C402                   add  sp, 2
  7909 00003C81 FF76FC                   push word [bp-4]
  7910 00003C84 E8B7FE                   call prlabel
  7911 00003C87 83C402                   add  sp, 2
  7912                                  
  7913                                  ;-757 int isrelational() {
  7914 00003C8A C9                       LEAVE
  7915 00003C8B C3                       ret
  7916                                  ; ENDP
  7917                                  
  7918                                  isrelational:  ; *** PROC ***
  7919                                  
  7920                                  ;-758   if (token==T_EQ) goto w; if (token==T_NE) goto w;
  7921                                  
  7922 00003C8C A1[1C00]                 mov ax, [token]
  7923 00003C8F 3D2603                   cmp ax, 806
  7924 00003C92 0F850300                 jne .isrelational426
  7925 00003C96 E94700                   jmp .w
  7926                                  .isrelational426:
  7927 00003C99 A1[1C00]                 mov ax, [token]
  7928 00003C9C 3D2703                   cmp ax, 807
  7929 00003C9F 0F850300                 jne .isrelational427
  7930 00003CA3 E93A00                   jmp .w
  7931                                  
  7932                                  ;-759   if (token==T_LE) goto w; if (token==T_GE) goto w;
  7933                                  
  7934                                  .isrelational427:
  7935 00003CA6 A1[1C00]                 mov ax, [token]
  7936 00003CA9 3D3803                   cmp ax, 824
  7937 00003CAC 0F850300                 jne .isrelational428
  7938 00003CB0 E92D00                   jmp .w
  7939                                  .isrelational428:
  7940 00003CB3 A1[1C00]                 mov ax, [token]
  7941 00003CB6 3D2B03                   cmp ax, 811
  7942 00003CB9 0F850300                 jne .isrelational429
  7943 00003CBD E92000                   jmp .w
  7944                                  
  7945                                  ;-760   if (token=='<' ) goto w; if (token=='>' ) goto w;
  7946                                  
  7947                                  .isrelational429:
  7948 00003CC0 A1[1C00]                 mov ax, [token]
  7949 00003CC3 83F83C                   cmp ax, 60
  7950 00003CC6 0F850300                 jne .isrelational430
  7951 00003CCA E91300                   jmp .w
  7952                                  .isrelational430:
  7953 00003CCD A1[1C00]                 mov ax, [token]
  7954 00003CD0 83F83E                   cmp ax, 62
  7955 00003CD3 0F850300                 jne .isrelational431
  7956 00003CD7 E90600                   jmp .w
  7957                                  
  7958                                  ;-761   return 0;  w: iscmp=token; token=getlex(); return 1;}
  7959                                  
  7960                                  .isrelational431:
  7961 00003CDA B80000                   mov ax, 0
  7962 00003CDD E91200                   jmp .retnisrelational
  7963                                  .w:
  7964 00003CE0 A1[1C00]                 mov ax, [token]
  7965 00003CE3 A3[2200]                 mov word [iscmp], ax
  7966 00003CE6 E80A00                   call getlex
  7967 00003CE9 A3[1C00]                 mov word [token], ax
  7968 00003CEC B80100                   mov ax, 1
  7969 00003CEF E90000                   jmp .retnisrelational
  7970                                  
  7971                                  ;-762  
  7972                                  
  7973                                  
  7974                                  ;-763 char symboltemp[80];    
  7975                                  
  7976                                   .retnisrelational:
  7977 00003CF2 C3                       ret
  7978                                  ; ENDP
  7979                                  section .bss
  7980                                  absolute 53468
  7981 0000D0DC <res 00000050>          symboltemp resb 80
  7982                                  section .text
  7983                                  
  7984                                  ;-764 int getlex() { char c; char *p; 
  7985                                  
  7986                                  
  7987                                  getlex:  ; *** PROC ***
  7988                                  
  7989                                  ;-765 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;
  7990                                  
  7991                                  ;Function : getlex, Number of local variables: 2
  7992                                  ;   # type sign width addr used name   list of local variables
  7993                                  ;  200 var sign byte   764 NULL c = bp-2
  7994                                  ;  201 ptr sign byte   764 NULL p = bp-4;
  7995 00003CF3 C8040000                 ENTER  4,0
  7996                                  .g1:
  7997 00003CF7 E8FF06                   call next
  7998 00003CFA 8846FE                   mov [bp-2], al
  7999 00003CFD 8A46FE                   mov al, [bp-2]
  8000 00003D00 3C00                     cmp al, 0
  8001 00003D02 0F850600                 jne .getlex432
  8002 00003D06 B80000                   mov ax, 0
  8003 00003D09 E9EB04                   jmp .retngetlex
  8004                                  .getlex432:
  8005 00003D0C 8A46FE                   mov al, [bp-2]
  8006 00003D0F 3C20                     cmp al, 32
  8007 00003D11 0F8F0200                 jg  .getlex433
  8008 00003D15 EBE0                     jmp .g1
  8009                                  
  8010                                  ;-766   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}
  8011                                  
  8012                                  .getlex433:
  8013 00003D17 8A46FE                   mov al, [bp-2]
  8014 00003D1A 3C3D                     cmp al, 61
  8015 00003D1C 0F851200                 jne .getlex434
  8016 00003D20 A0[2100]                 mov al, [thechar]
  8017 00003D23 3C3D                     cmp al, 61
  8018 00003D25 0F850900                 jne .getlex435
  8019 00003D29 E8CD06                   call next
  8020 00003D2C B82603                   mov ax, 806
  8021 00003D2F E9C504                   jmp .retngetlex
  8022                                  .getlex435:
  8023                                  
  8024                                  ;-767   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}
  8025                                  
  8026                                  .getlex434:
  8027 00003D32 8A46FE                   mov al, [bp-2]
  8028 00003D35 3C21                     cmp al, 33
  8029 00003D37 0F851200                 jne .getlex436
  8030 00003D3B A0[2100]                 mov al, [thechar]
  8031 00003D3E 3C3D                     cmp al, 61
  8032 00003D40 0F850900                 jne .getlex437
  8033 00003D44 E8B206                   call next
  8034 00003D47 B82703                   mov ax, 807
  8035 00003D4A E9AA04                   jmp .retngetlex
  8036                                  .getlex437:
  8037                                  
  8038                                  ;-768   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}
  8039                                  
  8040                                  .getlex436:
  8041 00003D4D 8A46FE                   mov al, [bp-2]
  8042 00003D50 3C3C                     cmp al, 60
  8043 00003D52 0F851200                 jne .getlex438
  8044 00003D56 A0[2100]                 mov al, [thechar]
  8045 00003D59 3C3D                     cmp al, 61
  8046 00003D5B 0F850900                 jne .getlex439
  8047 00003D5F E89706                   call next
  8048 00003D62 B83803                   mov ax, 824
  8049 00003D65 E98F04                   jmp .retngetlex
  8050                                  .getlex439:
  8051                                  
  8052                                  ;-769   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}
  8053                                  
  8054                                  .getlex438:
  8055 00003D68 8A46FE                   mov al, [bp-2]
  8056 00003D6B 3C3E                     cmp al, 62
  8057 00003D6D 0F851200                 jne .getlex440
  8058 00003D71 A0[2100]                 mov al, [thechar]
  8059 00003D74 3C3D                     cmp al, 61
  8060 00003D76 0F850900                 jne .getlex441
  8061 00003D7A E87C06                   call next
  8062 00003D7D B82B03                   mov ax, 811
  8063 00003D80 E97404                   jmp .retngetlex
  8064                                  .getlex441:
  8065                                  
  8066                                  ;-770   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}
  8067                                  
  8068                                  .getlex440:
  8069 00003D83 8A46FE                   mov al, [bp-2]
  8070 00003D86 3C3C                     cmp al, 60
  8071 00003D88 0F851200                 jne .getlex442
  8072 00003D8C A0[2100]                 mov al, [thechar]
  8073 00003D8F 3C3C                     cmp al, 60
  8074 00003D91 0F850900                 jne .getlex443
  8075 00003D95 E86106                   call next
  8076 00003D98 B8D804                   mov ax, 1240
  8077 00003D9B E95904                   jmp .retngetlex
  8078                                  .getlex443:
  8079                                  
  8080                                  ;-771   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}
  8081                                  
  8082                                  .getlex442:
  8083 00003D9E 8A46FE                   mov al, [bp-2]
  8084 00003DA1 3C3E                     cmp al, 62
  8085 00003DA3 0F851200                 jne .getlex444
  8086 00003DA7 A0[2100]                 mov al, [thechar]
  8087 00003DAA 3C3E                     cmp al, 62
  8088 00003DAC 0F850900                 jne .getlex445
  8089 00003DB0 E84606                   call next
  8090 00003DB3 B8D904                   mov ax, 1241
  8091 00003DB6 E93E04                   jmp .retngetlex
  8092                                  .getlex445:
  8093                                  
  8094                                  ;-772   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}
  8095                                  
  8096                                  .getlex444:
  8097 00003DB9 8A46FE                   mov al, [bp-2]
  8098 00003DBC 3C2B                     cmp al, 43
  8099 00003DBE 0F851200                 jne .getlex446
  8100 00003DC2 A0[2100]                 mov al, [thechar]
  8101 00003DC5 3C2B                     cmp al, 43
  8102 00003DC7 0F850900                 jne .getlex447
  8103 00003DCB E82B06                   call next
  8104 00003DCE B8C304                   mov ax, 1219
  8105 00003DD1 E92304                   jmp .retngetlex
  8106                                  .getlex447:
  8107                                  
  8108                                  ;-773   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}
  8109                                  
  8110                                  .getlex446:
  8111 00003DD4 8A46FE                   mov al, [bp-2]
  8112 00003DD7 3C2D                     cmp al, 45
  8113 00003DD9 0F851200                 jne .getlex448
  8114 00003DDD A0[2100]                 mov al, [thechar]
  8115 00003DE0 3C2D                     cmp al, 45
  8116 00003DE2 0F850900                 jne .getlex449
  8117 00003DE6 E81006                   call next
  8118 00003DE9 B8C904                   mov ax, 1225
  8119 00003DEC E90804                   jmp .retngetlex
  8120                                  .getlex449:
  8121                                  
  8122                                  ;-774   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}
  8123                                  
  8124                                  .getlex448:
  8125 00003DEF 8A46FE                   mov al, [bp-2]
  8126 00003DF2 3C2B                     cmp al, 43
  8127 00003DF4 0F851200                 jne .getlex450
  8128 00003DF8 A0[2100]                 mov al, [thechar]
  8129 00003DFB 3C3D                     cmp al, 61
  8130 00003DFD 0F850900                 jne .getlex451
  8131 00003E01 E8F505                   call next
  8132 00003E04 B8CE04                   mov ax, 1230
  8133 00003E07 E9ED03                   jmp .retngetlex
  8134                                  .getlex451:
  8135                                  
  8136                                  ;-775   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}
  8137                                  
  8138                                  .getlex450:
  8139 00003E0A 8A46FE                   mov al, [bp-2]
  8140 00003E0D 3C2D                     cmp al, 45
  8141 00003E0F 0F851200                 jne .getlex452
  8142 00003E13 A0[2100]                 mov al, [thechar]
  8143 00003E16 3C3D                     cmp al, 61
  8144 00003E18 0F850900                 jne .getlex453
  8145 00003E1C E8DA05                   call next
  8146 00003E1F B8CF04                   mov ax, 1231
  8147 00003E22 E9D203                   jmp .retngetlex
  8148                                  .getlex453:
  8149                                  
  8150                                  ;-776   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}
  8151                                  
  8152                                  .getlex452:
  8153 00003E25 8A46FE                   mov al, [bp-2]
  8154 00003E28 3C26                     cmp al, 38
  8155 00003E2A 0F851200                 jne .getlex454
  8156 00003E2E A0[2100]                 mov al, [thechar]
  8157 00003E31 3C3D                     cmp al, 61
  8158 00003E33 0F850900                 jne .getlex455
  8159 00003E37 E8BF05                   call next
  8160 00003E3A B8D204                   mov ax, 1234
  8161 00003E3D E9B703                   jmp .retngetlex
  8162                                  .getlex455:
  8163                                  
  8164                                  ;-777   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}    
  8165                                  
  8166                                  .getlex454:
  8167 00003E40 8A46FE                   mov al, [bp-2]
  8168 00003E43 3C7C                     cmp al, 124
  8169 00003E45 0F851200                 jne .getlex456
  8170 00003E49 A0[2100]                 mov al, [thechar]
  8171 00003E4C 3C3D                     cmp al, 61
  8172 00003E4E 0F850900                 jne .getlex457
  8173 00003E52 E8A405                   call next
  8174 00003E55 B8D304                   mov ax, 1235
  8175 00003E58 E99C03                   jmp .retngetlex
  8176                                  .getlex457:
  8177                                  
  8178                                  ;-778   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}
  8179                                  
  8180                                  .getlex456:
  8181 00003E5B 8A46FE                   mov al, [bp-2]
  8182 00003E5E 3C2A                     cmp al, 42
  8183 00003E60 0F851200                 jne .getlex458
  8184 00003E64 A0[2100]                 mov al, [thechar]
  8185 00003E67 3C3D                     cmp al, 61
  8186 00003E69 0F850900                 jne .getlex459
  8187 00003E6D E88905                   call next
  8188 00003E70 B8D004                   mov ax, 1232
  8189 00003E73 E98103                   jmp .retngetlex
  8190                                  .getlex459:
  8191                                  
  8192                                  ;-779   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}        
  8193                                  
  8194                                  .getlex458:
  8195 00003E76 8A46FE                   mov al, [bp-2]
  8196 00003E79 3C2F                     cmp al, 47
  8197 00003E7B 0F851200                 jne .getlex460
  8198 00003E7F A0[2100]                 mov al, [thechar]
  8199 00003E82 3C3D                     cmp al, 61
  8200 00003E84 0F850900                 jne .getlex461
  8201 00003E88 E86E05                   call next
  8202 00003E8B B8D104                   mov ax, 1233
  8203 00003E8E E96603                   jmp .retngetlex
  8204                                  .getlex461:
  8205                                  
  8206                                  ;-780   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;
  8207                                  
  8208                                  .getlex460:
  8209 00003E91 8A46FE                   mov al, byte [bp-2]
  8210 00003E94 B400                     mov ah, 0
  8211 00003E96 50                       push ax
  8212 00003E97 68[F941]                 push getlex_0
  8213 00003E9A E845C3                   call instr1
  8214 00003E9D 83C404                   add  sp, 4
  8215 00003EA0 08C0                     or  al, al
  8216 00003EA2 0F840600                 je .getlex462
  8217 00003EA6 8A46FE                   mov al, [bp-2]
  8218 00003EA9 E94B03                   jmp .retngetlex
  8219                                  
  8220                                  ;-781   if (c == '/') { if (thechar == '/') {
  8221                                  
  8222                                  .getlex462:
  8223 00003EAC 8A46FE                   mov al, [bp-2]
  8224 00003EAF 3C2F                     cmp al, 47
  8225 00003EB1 0F852000                 jne .getlex463
  8226 00003EB5 A0[2100]                 mov al, [thechar]
  8227 00003EB8 3C2F                     cmp al, 47
  8228 00003EBA 0F851700                 jne .getlex464
  8229                                  
  8230                                  ;-782       do c=next(); while(c != 13); /* c=next(); */ return getlex(); } }
  8231                                  
  8232                                  .getlex465:
  8233 00003EBE E83805                   call next
  8234 00003EC1 8846FE                   mov [bp-2], al
  8235 00003EC4 8A46FE                   mov al, [bp-2]
  8236 00003EC7 3C0D                     cmp al, 13
  8237 00003EC9 0F840200                 je  .getlex466
  8238 00003ECD EBEF                     jmp .getlex465
  8239                                  .getlex466:
  8240 00003ECF E821FE                   call getlex
  8241 00003ED2 E92203                   jmp .retngetlex
  8242                                  .getlex464:
  8243                                  
  8244                                  ;-783   if (c == '/') { if (thechar == '*') {
  8245                                  
  8246                                  .getlex463:
  8247 00003ED5 8A46FE                   mov al, [bp-2]
  8248 00003ED8 3C2F                     cmp al, 47
  8249 00003EDA 0F853A00                 jne .getlex467
  8250 00003EDE A0[2100]                 mov al, [thechar]
  8251 00003EE1 3C2A                     cmp al, 42
  8252 00003EE3 0F852B00                 jne .getlex468
  8253                                  
  8254                                  ;-784       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;
  8255                                  
  8256                                  .g2:
  8257 00003EE7 E80F05                   call next
  8258 00003EEA 8846FE                   mov [bp-2], al
  8259 00003EED 8A46FE                   mov al, [bp-2]
  8260 00003EF0 3C2A                     cmp al, 42
  8261 00003EF2 0F840200                 je  .getlex469
  8262 00003EF6 EBEF                     jmp .g2
  8263                                  .getlex469:
  8264 00003EF8 A0[2100]                 mov al, [thechar]
  8265 00003EFB 3C2F                     cmp al, 47
  8266 00003EFD 0F840200                 je  .getlex470
  8267 00003F01 EBE4                     jmp .g2
  8268                                  
  8269                                  ;-785       c=next(); return getlex(); } else  return '/'; }
  8270                                  
  8271                                  .getlex470:
  8272 00003F03 E8F304                   call next
  8273 00003F06 8846FE                   mov [bp-2], al
  8274 00003F09 E8E7FD                   call getlex
  8275 00003F0C E9E802                   jmp .retngetlex
  8276 00003F0F E90600                   jmp .getlex471
  8277                                  .getlex468:
  8278 00003F12 B82F00                   mov ax, 47
  8279 00003F15 E9DF02                   jmp .retngetlex
  8280                                  .getlex471:
  8281                                  
  8282                                  ;-786   if (c == '"') {getstring(c); return T_STRING;}
  8283                                  
  8284                                  .getlex467:
  8285 00003F18 8A46FE                   mov al, [bp-2]
  8286 00003F1B 3C22                     cmp al, 34
  8287 00003F1D 0F851200                 jne .getlex472
  8288 00003F21 8A46FE                   mov al, byte [bp-2]
  8289 00003F24 B400                     mov ah, 0
  8290 00003F26 50                       push ax
  8291 00003F27 E89804                   call getstring
  8292 00003F2A 83C402                   add  sp, 2
  8293 00003F2D B80201                   mov ax, 258
  8294 00003F30 E9C402                   jmp .retngetlex
  8295                                  
  8296                                  ;-787   if (digit(c)) { getdigit(c); return T_CONST; }
  8297                                  
  8298                                  .getlex472:
  8299 00003F33 8A46FE                   mov al, byte [bp-2]
  8300 00003F36 B400                     mov ah, 0
  8301 00003F38 50                       push ax
  8302 00003F39 E8A3C3                   call digit
  8303 00003F3C 83C402                   add  sp, 2
  8304 00003F3F 08C0                     or  al, al
  8305 00003F41 0F841200                 je .getlex473
  8306 00003F45 8A46FE                   mov al, byte [bp-2]
  8307 00003F48 B400                     mov ah, 0
  8308 00003F4A 50                       push ax
  8309 00003F4B E89E03                   call getdigit
  8310 00003F4E 83C402                   add  sp, 2
  8311 00003F51 B80101                   mov ax, 257
  8312 00003F54 E9A002                   jmp .retngetlex
  8313                                  
  8314                                  ;-788   if (c==39) { lexval=next();
  8315                                  
  8316                                  .getlex473:
  8317 00003F57 8A46FE                   mov al, [bp-2]
  8318 00003F5A 3C27                     cmp al, 39
  8319 00003F5C 0F854F00                 jne .getlex474
  8320 00003F60 E89604                   call next
  8321 00003F63 A3[2E00]                 mov word [lexval], ax
  8322                                  
  8323                                  ;-789     if (lexval==92) {lexval=next();
  8324                                  
  8325 00003F66 A1[2E00]                 mov ax, [lexval]
  8326 00003F69 83F85C                   cmp ax, 92
  8327 00003F6C 0F853600                 jne .getlex475
  8328 00003F70 E88604                   call next
  8329 00003F73 A3[2E00]                 mov word [lexval], ax
  8330                                  
  8331                                  ;-790       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;
  8332                                  
  8333 00003F76 A1[2E00]                 mov ax, [lexval]
  8334 00003F79 83F86E                   cmp ax, 110
  8335 00003F7C 0F850600                 jne .getlex476
  8336 00003F80 B80A00                   mov ax, 10
  8337 00003F83 A3[2E00]                 mov word [lexval], ax
  8338                                  .getlex476:
  8339 00003F86 A1[2E00]                 mov ax, [lexval]
  8340 00003F89 83F874                   cmp ax, 116
  8341 00003F8C 0F850600                 jne .getlex477
  8342 00003F90 B80900                   mov ax, 9
  8343 00003F93 A3[2E00]                 mov word [lexval], ax
  8344                                  
  8345                                  ;-791       if (lexval=='0') lexval= 0; } next(); return T_CONST; }
  8346                                  
  8347                                  .getlex477:
  8348 00003F96 A1[2E00]                 mov ax, [lexval]
  8349 00003F99 83F830                   cmp ax, 48
  8350 00003F9C 0F850600                 jne .getlex478
  8351 00003FA0 B80000                   mov ax, 0
  8352 00003FA3 A3[2E00]                 mov word [lexval], ax
  8353                                  .getlex478:
  8354                                  .getlex475:
  8355 00003FA6 E85004                   call next
  8356 00003FA9 B80101                   mov ax, 257
  8357 00003FAC E94802                   jmp .retngetlex
  8358                                  
  8359                                  ;-792   if (alnum(c)) { 
  8360                                  
  8361                                  .getlex474:
  8362 00003FAF 8A46FE                   mov al, byte [bp-2]
  8363 00003FB2 B400                     mov ah, 0
  8364 00003FB4 50                       push ax
  8365 00003FB5 E8CFC3                   call alnum
  8366 00003FB8 83C402                   add  sp, 2
  8367 00003FBB 08C0                     or  al, al
  8368 00003FBD 0F842D02                 je .getlex479
  8369                                  
  8370                                  ;-793     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;
  8371                                  
  8372 00003FC1 8D062B81                 lea  ax, [symbol]
  8373 00003FC5 50                       push ax
  8374 00003FC6 8D06DCD0                 lea  ax, [symboltemp]
  8375 00003FCA 50                       push ax
  8376 00003FCB E898C1                   call strcpy
  8377 00003FCE 83C404                   add  sp, 4
  8378 00003FD1 B82B81                   mov ax, symbol
  8379 00003FD4 8946FC                   mov [bp-4], ax
  8380 00003FD7 8A46FE                   mov al, [bp-2]
  8381 00003FDA 8B5EFC                   mov  bx, [bp-4]
  8382 00003FDD 8807                     mov  [bx], al
  8383 00003FDF FF46FC                   inc  word[bp-4]
  8384                                  
  8385                                  ;-794     while(alnum(thechar)) {c=next(); *p=c;  p++; } 
  8386                                  
  8387                                  .getlex480:
  8388 00003FE2 A0[2100]                 mov al, byte [thechar]
  8389 00003FE5 B400                     mov ah, 0
  8390 00003FE7 50                       push ax
  8391 00003FE8 E89CC3                   call alnum
  8392 00003FEB 83C402                   add  sp, 2
  8393 00003FEE 08C0                     or  al, al
  8394 00003FF0 0F841300                 je .getlex481
  8395 00003FF4 E80204                   call next
  8396 00003FF7 8846FE                   mov [bp-2], al
  8397 00003FFA 8A46FE                   mov al, [bp-2]
  8398 00003FFD 8B5EFC                   mov  bx, [bp-4]
  8399 00004000 8807                     mov  [bx], al
  8400 00004002 FF46FC                   inc  word[bp-4]
  8401                                  
  8402                                  ;-795       *p=0;
  8403                                  
  8404 00004005 EBDB                     jmp .getlex480
  8405                                  .getlex481:
  8406 00004007 B80000                   mov ax, 0
  8407 0000400A 8B5EFC                   mov  bx, [bp-4]
  8408 0000400D 8807                     mov  [bx], al
  8409                                  
  8410                                  ;-796     if (eqstr(symbol,"signed"  )) return T_SIGNED;
  8411                                  
  8412 0000400F 68[0F42]                 push getlex_1
  8413 00004012 8D062B81                 lea  ax, [symbol]
  8414 00004016 50                       push ax
  8415 00004017 E87CC1                   call eqstr
  8416 0000401A 83C404                   add  sp, 4
  8417 0000401D 08C0                     or  al, al
  8418 0000401F 0F840600                 je .getlex482
  8419 00004023 B81302                   mov ax, 531
  8420 00004026 E9CE01                   jmp .retngetlex
  8421                                  
  8422                                  ;-797     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;
  8423                                  
  8424                                  .getlex482:
  8425 00004029 68[1642]                 push getlex_2
  8426 0000402C 8D062B81                 lea  ax, [symbol]
  8427 00004030 50                       push ax
  8428 00004031 E862C1                   call eqstr
  8429 00004034 83C404                   add  sp, 4
  8430 00004037 08C0                     or  al, al
  8431 00004039 0F840600                 je .getlex483
  8432 0000403D B81402                   mov ax, 532
  8433 00004040 E9B401                   jmp .retngetlex
  8434                                  
  8435                                  ;-798     if (eqstr(symbol,"void"    )) return T_VOID;
  8436                                  
  8437                                  .getlex483:
  8438 00004043 68[1F42]                 push getlex_3
  8439 00004046 8D062B81                 lea  ax, [symbol]
  8440 0000404A 50                       push ax
  8441 0000404B E848C1                   call eqstr
  8442 0000404E 83C404                   add  sp, 4
  8443 00004051 08C0                     or  al, al
  8444 00004053 0F840600                 je .getlex484
  8445 00004057 B81102                   mov ax, 529
  8446 0000405A E99A01                   jmp .retngetlex
  8447                                  
  8448                                  ;-799     if (eqstr(symbol,"int"     )) return T_INT;
  8449                                  
  8450                                  .getlex484:
  8451 0000405D 68[2442]                 push getlex_4
  8452 00004060 8D062B81                 lea  ax, [symbol]
  8453 00004064 50                       push ax
  8454 00004065 E82EC1                   call eqstr
  8455 00004068 83C404                   add  sp, 4
  8456 0000406B 08C0                     or  al, al
  8457 0000406D 0F840600                 je .getlex485
  8458 00004071 B80502                   mov ax, 517
  8459 00004074 E98001                   jmp .retngetlex
  8460                                  
  8461                                  ;-800     if (eqstr(symbol,"long"    )) return T_LONG;
  8462                                  
  8463                                  .getlex485:
  8464 00004077 68[2842]                 push getlex_5
  8465 0000407A 8D062B81                 lea  ax, [symbol]
  8466 0000407E 50                       push ax
  8467 0000407F E814C1                   call eqstr
  8468 00004082 83C404                   add  sp, 4
  8469 00004085 08C0                     or  al, al
  8470 00004087 0F840600                 je .getlex486
  8471 0000408B B81502                   mov ax, 533
  8472 0000408E E96601                   jmp .retngetlex
  8473                                  
  8474                                  ;-801     if (eqstr(symbol,"char"    )) return T_CHAR;
  8475                                  
  8476                                  .getlex486:
  8477 00004091 68[2D42]                 push getlex_6
  8478 00004094 8D062B81                 lea  ax, [symbol]
  8479 00004098 50                       push ax
  8480 00004099 E8FAC0                   call eqstr
  8481 0000409C 83C404                   add  sp, 4
  8482 0000409F 08C0                     or  al, al
  8483 000040A1 0F840600                 je .getlex487
  8484 000040A5 B81202                   mov ax, 530
  8485 000040A8 E94C01                   jmp .retngetlex
  8486                                  
  8487                                  ;-802     if (eqstr(symbol,"asm"     )) return T_ASM;
  8488                                  
  8489                                  .getlex487:
  8490 000040AB 68[3242]                 push getlex_7
  8491 000040AE 8D062B81                 lea  ax, [symbol]
  8492 000040B2 50                       push ax
  8493 000040B3 E8E0C0                   call eqstr
  8494 000040B6 83C404                   add  sp, 4
  8495 000040B9 08C0                     or  al, al
  8496 000040BB 0F840600                 je .getlex488
  8497 000040BF B80602                   mov ax, 518
  8498 000040C2 E93201                   jmp .retngetlex
  8499                                  
  8500                                  ;-803     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;
  8501                                  
  8502                                  .getlex488:
  8503 000040C5 68[3642]                 push getlex_8
  8504 000040C8 8D062B81                 lea  ax, [symbol]
  8505 000040CC 50                       push ax
  8506 000040CD E8C6C0                   call eqstr
  8507 000040D0 83C404                   add  sp, 4
  8508 000040D3 08C0                     or  al, al
  8509 000040D5 0F840600                 je .getlex489
  8510 000040D9 B80702                   mov ax, 519
  8511 000040DC E91801                   jmp .retngetlex
  8512                                  
  8513                                  ;-804     if (eqstr(symbol,"__emit__")) return T_EMIT;
  8514                                  
  8515                                  .getlex489:
  8516 000040DF 68[3C42]                 push getlex_9
  8517 000040E2 8D062B81                 lea  ax, [symbol]
  8518 000040E6 50                       push ax
  8519 000040E7 E8ACC0                   call eqstr
  8520 000040EA 83C404                   add  sp, 4
  8521 000040ED 08C0                     or  al, al
  8522 000040EF 0F840600                 je .getlex490
  8523 000040F3 B80802                   mov ax, 520
  8524 000040F6 E9FE00                   jmp .retngetlex
  8525                                  
  8526                                  ;-805     if (eqstr(symbol,"return"  )) return T_RETURN;
  8527                                  
  8528                                  .getlex490:
  8529 000040F9 68[4542]                 push getlex_10
  8530 000040FC 8D062B81                 lea  ax, [symbol]
  8531 00004100 50                       push ax
  8532 00004101 E892C0                   call eqstr
  8533 00004104 83C404                   add  sp, 4
  8534 00004107 08C0                     or  al, al
  8535 00004109 0F840600                 je .getlex491
  8536 0000410D B80002                   mov ax, 512
  8537 00004110 E9E400                   jmp .retngetlex
  8538                                  
  8539                                  ;-806     if (eqstr(symbol,"if"      )) return T_IF;
  8540                                  
  8541                                  .getlex491:
  8542 00004113 68[4C42]                 push getlex_11
  8543 00004116 8D062B81                 lea  ax, [symbol]
  8544 0000411A 50                       push ax
  8545 0000411B E878C0                   call eqstr
  8546 0000411E 83C404                   add  sp, 4
  8547 00004121 08C0                     or  al, al
  8548 00004123 0F840600                 je .getlex492
  8549 00004127 B80102                   mov ax, 513
  8550 0000412A E9CA00                   jmp .retngetlex
  8551                                  
  8552                                  ;-807     if (eqstr(symbol,"else"    )) return T_ELSE;
  8553                                  
  8554                                  .getlex492:
  8555 0000412D 68[4F42]                 push getlex_12
  8556 00004130 8D062B81                 lea  ax, [symbol]
  8557 00004134 50                       push ax
  8558 00004135 E85EC0                   call eqstr
  8559 00004138 83C404                   add  sp, 4
  8560 0000413B 08C0                     or  al, al
  8561 0000413D 0F840600                 je .getlex493
  8562 00004141 B80202                   mov ax, 514
  8563 00004144 E9B000                   jmp .retngetlex
  8564                                  
  8565                                  ;-808     if (eqstr(symbol,"while"   )) return T_WHILE;
  8566                                  
  8567                                  .getlex493:
  8568 00004147 68[5442]                 push getlex_13
  8569 0000414A 8D062B81                 lea  ax, [symbol]
  8570 0000414E 50                       push ax
  8571 0000414F E844C0                   call eqstr
  8572 00004152 83C404                   add  sp, 4
  8573 00004155 08C0                     or  al, al
  8574 00004157 0F840600                 je .getlex494
  8575 0000415B B80302                   mov ax, 515
  8576 0000415E E99600                   jmp .retngetlex
  8577                                  
  8578                                  ;-809     if (eqstr(symbol,"do"      )) return T_DO;
  8579                                  
  8580                                  .getlex494:
  8581 00004161 68[5A42]                 push getlex_14
  8582 00004164 8D062B81                 lea  ax, [symbol]
  8583 00004168 50                       push ax
  8584 00004169 E82AC0                   call eqstr
  8585 0000416C 83C404                   add  sp, 4
  8586 0000416F 08C0                     or  al, al
  8587 00004171 0F840600                 je .getlex495
  8588 00004175 B80402                   mov ax, 516
  8589 00004178 E97C00                   jmp .retngetlex
  8590                                  
  8591                                  ;-810     if (eqstr(symbol,"goto"    )) return T_GOTO;
  8592                                  
  8593                                  .getlex495:
  8594 0000417B 68[5D42]                 push getlex_15
  8595 0000417E 8D062B81                 lea  ax, [symbol]
  8596 00004182 50                       push ax
  8597 00004183 E810C0                   call eqstr
  8598 00004186 83C404                   add  sp, 4
  8599 00004189 08C0                     or  al, al
  8600 0000418B 0F840600                 je .getlex496
  8601 0000418F B80902                   mov ax, 521
  8602 00004192 E96200                   jmp .retngetlex
  8603                                  
  8604                                  ;-811     if (eqstr(symbol,"define"  )) return T_DEFINE;   
  8605                                  
  8606                                  .getlex496:
  8607 00004195 68[6242]                 push getlex_16
  8608 00004198 8D062B81                 lea  ax, [symbol]
  8609 0000419C 50                       push ax
  8610 0000419D E8F6BF                   call eqstr
  8611 000041A0 83C404                   add  sp, 4
  8612 000041A3 08C0                     or  al, al
  8613 000041A5 0F840600                 je .getlex497
  8614 000041A9 B8FF01                   mov ax, 511
  8615 000041AC E94800                   jmp .retngetlex
  8616                                  
  8617                                  ;-812     if (eqstr(symbol,"include" )) return T_INCLUDE;   
  8618                                  
  8619                                  .getlex497:
  8620 000041AF 68[6942]                 push getlex_17
  8621 000041B2 8D062B81                 lea  ax, [symbol]
  8622 000041B6 50                       push ax
  8623 000041B7 E8DCBF                   call eqstr
  8624 000041BA 83C404                   add  sp, 4
  8625 000041BD 08C0                     or  al, al
  8626 000041BF 0F840600                 je .getlex498
  8627 000041C3 B8FE01                   mov ax, 510
  8628 000041C6 E92E00                   jmp .retngetlex
  8629                                  
  8630                                  ;-813     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}
  8631                                  
  8632                                  .getlex498:
  8633 000041C9 E8BF00                   call convertdefine
  8634 000041CC 08C0                     or  al, al
  8635 000041CE 0F841600                 je .getlex499
  8636 000041D2 8D06DCD0                 lea  ax, [symboltemp]
  8637 000041D6 50                       push ax
  8638 000041D7 8D062B81                 lea  ax, [symbol]
  8639 000041DB 50                       push ax
  8640 000041DC E887BF                   call strcpy
  8641 000041DF 83C404                   add  sp, 4
  8642 000041E2 B80101                   mov ax, 257
  8643 000041E5 E90F00                   jmp .retngetlex
  8644                                  
  8645                                  ;-814     return T_NAME; } error1("Input item not recognized"); }
  8646                                  
  8647                                  .getlex499:
  8648 000041E8 B80001                   mov ax, 256
  8649 000041EB E90900                   jmp .retngetlex
  8650                                  .getlex479:
  8651 000041EE 68[7142]                 push getlex_18
  8652 000041F1 E84306                   call error1
  8653 000041F4 83C402                   add  sp, 2
  8654                                  
  8655                                  ;-815 
  8656                                  
  8657                                  
  8658                                  ;-816 int convertdefine() { int i; int j;   i=0;
  8659                                  
  8660 000041F7 C9                       .retngetlex: LEAVE
  8661 000041F8 C3                       ret
  8662 000041F9 28295B5D7B7D2C3B2A-     getlex_0 db "()[]{},;*:%-><=+!&|#?",0
  8663 00004202 3A252D3E3C3D2B2126-
  8664 0000420B 7C233F00           
  8665 0000420F 7369676E656400          getlex_1 db "signed",0
  8666 00004216 756E7369676E656400      getlex_2 db "unsigned",0
  8667 0000421F 766F696400              getlex_3 db "void",0
  8668 00004224 696E7400                getlex_4 db "int",0
  8669 00004228 6C6F6E6700              getlex_5 db "long",0
  8670 0000422D 6368617200              getlex_6 db "char",0
  8671 00004232 61736D00                getlex_7 db "asm",0
  8672 00004236 5F5F61736D00            getlex_8 db "__asm",0
  8673 0000423C 5F5F656D69745F5F00      getlex_9 db "__emit__",0
  8674 00004245 72657475726E00          getlex_10 db "return",0
  8675 0000424C 696600                  getlex_11 db "if",0
  8676 0000424F 656C736500              getlex_12 db "else",0
  8677 00004254 7768696C6500            getlex_13 db "while",0
  8678 0000425A 646F00                  getlex_14 db "do",0
  8679 0000425D 676F746F00              getlex_15 db "goto",0
  8680 00004262 646566696E6500          getlex_16 db "define",0
  8681 00004269 696E636C75646500        getlex_17 db "include",0
  8682 00004271 496E70757420697465-     getlex_18 db "Input item not recognized",0
  8683 0000427A 6D206E6F7420726563-
  8684 00004283 6F676E697A656400   
  8685                                  ; ENDP
  8686                                  
  8687                                  convertdefine:  ; *** PROC ***
  8688                                  ;Function : convertdefine, Number of local variables: 2
  8689                                  ;   # type sign width addr used name   list of local variables
  8690                                  ;  200 var sign word   816 NULL i = bp-2
  8691                                  ;  201 var sign word   816 NULL j = bp-4;
  8692 0000428B C8040000                 ENTER  4,0
  8693 0000428F B80000                   mov ax, 0
  8694 00004292 8946FE                   mov [bp-2], ax
  8695                                  
  8696                                  ;-817   while (i < GTop) {
  8697                                  
  8698                                  .convertdefine500:
  8699 00004295 8B46FE                   mov ax, [bp-2]
  8700 00004298 3B06[2A00]               cmp ax, [GTop]
  8701 0000429C 0F8D4400                 jge .convertdefine501
  8702                                  
  8703                                  ;-818    j=adrofname(i); 
  8704                                  
  8705 000042A0 FF76FE                   push word [bp-2]
  8706 000042A3 E891C6                   call adrofname
  8707 000042A6 83C402                   add  sp, 2
  8708 000042A9 8946FC                   mov [bp-4], ax
  8709                                  
  8710                                  ;-819    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];
  8711                                  
  8712 000042AC FF76FC                   push word [bp-4]
  8713 000042AF 8D062B81                 lea  ax, [symbol]
  8714 000042B3 50                       push ax
  8715 000042B4 E8DFBE                   call eqstr
  8716 000042B7 83C404                   add  sp, 4
  8717 000042BA 08C0                     or  al, al
  8718 000042BC 0F841F00                 je .convertdefine502
  8719 000042C0 8B5EFE                   mov bx, [bp-2]
  8720 000042C3 8A87B782                 mov al, [GType + bx]
  8721 000042C7 3C23                     cmp al, 35
  8722 000042C9 0F851200                 jne .convertdefine503
  8723 000042CD 8B5EFE                   mov bx, [bp-2]
  8724 000042D0 D1E3                     shl bx, 1
  8725 000042D2 8B87EB8A                 mov ax, [GData + bx]
  8726 000042D6 A3[2E00]                 mov word [lexval], ax
  8727                                  
  8728                                  ;-820    return T_CONST; } }
  8729                                  
  8730 000042D9 B80101                   mov ax, 257
  8731 000042DC E90B00                   jmp .retnconvertdefine
  8732                                  .convertdefine503:
  8733                                  
  8734                                  ;-821    i++; } 
  8735                                  
  8736                                  .convertdefine502:
  8737 000042DF FF46FE                   inc  word[bp-2]
  8738                                  
  8739                                  ;-822    return 0; }
  8740                                  
  8741 000042E2 EBB1                     jmp .convertdefine500
  8742                                  .convertdefine501:
  8743 000042E4 B80000                   mov ax, 0
  8744 000042E7 E90000                   jmp .retnconvertdefine
  8745                                  
  8746                                  ;-823 int getdigit(char c) { int i;
  8747                                  
  8748 000042EA C9                       .retnconvertdefine: LEAVE
  8749 000042EB C3                       ret
  8750                                  ; ENDP
  8751                                  
  8752                                  getdigit:  ; *** PROC ***
  8753                                  
  8754                                  ;-824     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char
  8755                                  
  8756                                  ;Function : getdigit, Number of local variables: 2
  8757                                  ;   # type sign width addr used name   list of local variables
  8758                                  ;  200 var sign byte   823 NULL c = bp+4
  8759                                  ;  201 var sign word   823 NULL i = bp-2;
  8760 000042EC C8020000                 ENTER  2,0
  8761 000042F0 B80000                   mov ax, 0
  8762 000042F3 A3[2E00]                 mov word [lexval], ax
  8763 000042F6 8A4604                   mov al, [bp+4]
  8764 000042F9 2C30                     sub al, 48
  8765 000042FB A3[2E00]                 mov word [lexval], ax
  8766                                  
  8767                                  ;-825     if (thechar=='x') thechar='X'; if (thechar=='X') { next();
  8768                                  
  8769 000042FE A0[2100]                 mov al, [thechar]
  8770 00004301 3C78                     cmp al, 120
  8771 00004303 0F850600                 jne .getdigit504
  8772 00004307 B85800                   mov ax, 88
  8773 0000430A A2[2100]                 mov byte [thechar], al
  8774                                  .getdigit504:
  8775 0000430D A0[2100]                 mov al, [thechar]
  8776 00004310 3C58                     cmp al, 88
  8777 00004312 0F856800                 jne .getdigit505
  8778 00004316 E8E000                   call next
  8779                                  
  8780                                  ;-826       while(alnum(thechar)) { c=next(); if(c>96) c=c-39;
  8781                                  
  8782                                  .getdigit506:
  8783 00004319 A0[2100]                 mov al, byte [thechar]
  8784 0000431C B400                     mov ah, 0
  8785 0000431E 50                       push ax
  8786 0000431F E865C0                   call alnum
  8787 00004322 83C402                   add  sp, 2
  8788 00004325 08C0                     or  al, al
  8789 00004327 0F845000                 je .getdigit507
  8790 0000432B E8CB00                   call next
  8791 0000432E 884604                   mov [bp+4], al
  8792 00004331 8A4604                   mov al, [bp+4]
  8793 00004334 3C60                     cmp al, 96
  8794 00004336 0F8E0800                 jle .getdigit508
  8795 0000433A 8A4604                   mov al, [bp+4]
  8796 0000433D 2C27                     sub al, 39
  8797 0000433F 884604                   mov [bp+4], al
  8798                                  
  8799                                  ;-827 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16
  8800                                  
  8801                                  .getdigit508:
  8802 00004342 8A4604                   mov al, [bp+4]
  8803 00004345 3C40                     cmp al, 64
  8804 00004347 0F8E0800                 jle .getdigit509
  8805 0000434B 8A4604                   mov al, [bp+4]
  8806 0000434E 2C07                     sub al, 7
  8807 00004350 884604                   mov [bp+4], al
  8808                                  .getdigit509:
  8809 00004353 8A4604                   mov al, [bp+4]
  8810 00004356 2C30                     sub al, 48
  8811 00004358 884604                   mov [bp+4], al
  8812 0000435B A1[2E00]                 mov ax, [lexval]
  8813 0000435E C1E004                   shl ax, 4
  8814 00004361 A3[2E00]                 mov word [lexval], ax
  8815                                  
  8816                                  ;-828      i=0; i=c; lexval=lexval+i;}
  8817                                  
  8818 00004364 B80000                   mov ax, 0
  8819 00004367 8946FE                   mov [bp-2], ax
  8820 0000436A 8A4604                   mov al, [bp+4]
  8821 0000436D 8946FE                   mov [bp-2], ax
  8822 00004370 A1[2E00]                 mov ax, [lexval]
  8823 00004373 0346FE                   add ax, [bp-2]
  8824 00004376 A3[2E00]                 mov word [lexval], ax
  8825                                  
  8826                                  ;-829     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10; 
  8827                                  
  8828 00004379 EB9E                     jmp .getdigit506
  8829                                  .getdigit507:
  8830 0000437B E94200                   jmp .getdigit510
  8831                                  .getdigit505:
  8832                                  .getdigit511:
  8833 0000437E A0[2100]                 mov al, byte [thechar]
  8834 00004381 B400                     mov ah, 0
  8835 00004383 50                       push ax
  8836 00004384 E858BF                   call digit
  8837 00004387 83C402                   add  sp, 2
  8838 0000438A 08C0                     or  al, al
  8839 0000438C 0F843000                 je .getdigit512
  8840 00004390 E86600                   call next
  8841 00004393 884604                   mov [bp+4], al
  8842 00004396 8A4604                   mov al, [bp+4]
  8843 00004399 2C30                     sub al, 48
  8844 0000439B 884604                   mov [bp+4], al
  8845 0000439E A1[2E00]                 mov ax, [lexval]
  8846 000043A1 BB0A00                   mov bx, 10
  8847 000043A4 F7E3                     mul bx
  8848 000043A6 A3[2E00]                 mov word [lexval], ax
  8849                                  
  8850                                  ;-830      i=0; i=c; lexval=lexval+i; } } 
  8851                                  
  8852 000043A9 B80000                   mov ax, 0
  8853 000043AC 8946FE                   mov [bp-2], ax
  8854 000043AF 8A4604                   mov al, [bp+4]
  8855 000043B2 8946FE                   mov [bp-2], ax
  8856 000043B5 A1[2E00]                 mov ax, [lexval]
  8857 000043B8 0346FE                   add ax, [bp-2]
  8858 000043BB A3[2E00]                 mov word [lexval], ax
  8859 000043BE EBBE                     jmp .getdigit511
  8860                                  .getdigit512:
  8861                                  
  8862                                  ;-831 }
  8863                                  
  8864                                  .getdigit510:
  8865                                  
  8866                                  ;-832 int getstring(int delim) {int c; char *p;  p=&symbol; c=next();
  8867 000043C0 C9                       LEAVE
  8868 000043C1 C3                       ret
  8869                                  ; ENDP
  8870                                  
  8871                                  getstring:  ; *** PROC ***
  8872                                  ;Function : getstring, Number of local variables: 3
  8873                                  ;   # type sign width addr used name   list of local variables
  8874                                  ;  200 var sign word   832 NULL delim = bp+4
  8875                                  ;  201 var sign word   832 NULL c = bp-2
  8876                                  ;  202 ptr sign byte   832 NULL p = bp-4;
  8877 000043C2 C8040000                 ENTER  4,0
  8878 000043C6 B82B81                   mov ax, symbol
  8879 000043C9 8946FC                   mov [bp-4], ax
  8880 000043CC E82A00                   call next
  8881 000043CF 8946FE                   mov [bp-2], ax
  8882                                  
  8883                                  ;-833   while (c != delim) {*p=c; p++; c=next(); } *p=0; }
  8884                                  
  8885                                  .getstring513:
  8886 000043D2 8B46FE                   mov ax, [bp-2]
  8887 000043D5 3B4604                   cmp ax, [bp+4]
  8888 000043D8 0F841300                 je  .getstring514
  8889 000043DC 8B46FE                   mov ax, [bp-2]
  8890 000043DF 8B5EFC                   mov  bx, [bp-4]
  8891 000043E2 8807                     mov  [bx], al
  8892 000043E4 FF46FC                   inc  word[bp-4]
  8893 000043E7 E80F00                   call next
  8894 000043EA 8946FE                   mov [bp-2], ax
  8895 000043ED EBE3                     jmp .getstring513
  8896                                  .getstring514:
  8897 000043EF B80000                   mov ax, 0
  8898 000043F2 8B5EFC                   mov  bx, [bp-4]
  8899 000043F5 8807                     mov  [bx], al
  8900                                  
  8901                                  ;-834 
  8902                                  
  8903                                  
  8904                                  ;-835 int next() {char r; r = thechar; globC=r; thechar = fgets1(); return r; }
  8905 000043F7 C9                       LEAVE
  8906 000043F8 C3                       ret
  8907                                  ; ENDP
  8908                                  
  8909                                  next:  ; *** PROC ***
  8910                                  ;Function : next, Number of local variables: 1
  8911                                  ;   # type sign width addr used name   list of local variables
  8912                                  ;  200 var sign byte   835 NULL r = bp-2;
  8913 000043F9 C8020000                 ENTER  2,0
  8914 000043FD A0[2100]                 mov al, [thechar]
  8915 00004400 8846FE                   mov [bp-2], al
  8916 00004403 8A46FE                   mov al, [bp-2]
  8917 00004406 A2[1E00]                 mov byte [globC], al
  8918 00004409 E83303                   call fgets1
  8919 0000440C A2[2100]                 mov byte [thechar], al
  8920 0000440F 8A46FE                   mov al, [bp-2]
  8921 00004412 E90000                   jmp .retnnext
  8922                                  
  8923                                  ;-836 int istoken(int t) {if (token == t) { token=getlex(); return 1; } return 0;}
  8924                                  
  8925 00004415 C9                       .retnnext: LEAVE
  8926 00004416 C3                       ret
  8927                                  ; ENDP
  8928                                  
  8929                                  istoken:  ; *** PROC ***
  8930                                  ;Function : istoken, Number of local variables: 1
  8931                                  ;   # type sign width addr used name   list of local variables
  8932                                  ;  200 var sign word   836 NULL t = bp+4;
  8933 00004417 C8000000                 ENTER  0,0
  8934 0000441B A1[1C00]                 mov ax, [token]
  8935 0000441E 3B4604                   cmp ax, [bp+4]
  8936 00004421 0F850C00                 jne .istoken515
  8937 00004425 E8CBF8                   call getlex
  8938 00004428 A3[1C00]                 mov word [token], ax
  8939 0000442B B80100                   mov ax, 1
  8940 0000442E E90600                   jmp .retnistoken
  8941                                  .istoken515:
  8942 00004431 B80000                   mov ax, 0
  8943 00004434 E90000                   jmp .retnistoken
  8944                                  
  8945                                  ;-837 int expect(int t) {if (istoken(t)==0) { *cloc=0; prs(co); listproc();
  8946                                  
  8947 00004437 C9                       .retnistoken: LEAVE
  8948 00004438 C3                       ret
  8949                                  ; ENDP
  8950                                  
  8951                                  expect:  ; *** PROC ***
  8952                                  ;Function : expect, Number of local variables: 1
  8953                                  ;   # type sign width addr used name   list of local variables
  8954                                  ;  200 var sign word   837 NULL t = bp+4;
  8955 00004439 C8000000                 ENTER  0,0
  8956 0000443D FF7604                   push word [bp+4]
  8957 00004440 E8D4FF                   call istoken
  8958 00004443 83C402                   add  sp, 2
  8959 00004446 83F800                   cmp ax, 0
  8960 00004449 0F853200                 jne .expect516
  8961 0000444D B80000                   mov ax, 0
  8962 00004450 8B1E[1600]               mov  bx, [cloc]
  8963 00004454 8807                     mov  [bx], al
  8964 00004456 8D063075                 lea  ax, [co]
  8965 0000445A 50                       push ax
  8966 0000445B E8EE00                   call prs
  8967 0000445E 83C402                   add  sp, 2
  8968 00004461 E8D504                   call listproc
  8969                                  
  8970                                  ;-838   prs("\nExpected ASCII(dez): "); pint1(t); error1(" not found"); } }
  8971                                  
  8972 00004464 68[8144]                 push expect_0
  8973 00004467 E8E200                   call prs
  8974 0000446A 83C402                   add  sp, 2
  8975 0000446D FF7604                   push word [bp+4]
  8976 00004470 E8D001                   call pint1
  8977 00004473 83C402                   add  sp, 2
  8978 00004476 68[9944]                 push expect_1
  8979 00004479 E8BB03                   call error1
  8980 0000447C 83C402                   add  sp, 2
  8981                                  .expect516:
  8982                                  
  8983                                  ;-839 
  8984                                  
  8985                                  
  8986                                  ;-840 int eprc(char c)  {*cloc=c; cloc++; }
  8987 0000447F C9                       LEAVE
  8988 00004480 C3                       ret
  8989 00004481 5C6E45787065637465-     expect_0 db "\nExpected ASCII(dez): ",0
  8990 0000448A 642041534349492864-
  8991 00004493 657A293A2000       
  8992 00004499 206E6F7420666F756E-     expect_1 db " not found",0
  8993 000044A2 6400               
  8994                                  ; ENDP
  8995                                  
  8996                                  eprc:  ; *** PROC ***
  8997                                  ;Function : eprc, Number of local variables: 1
  8998                                  ;   # type sign width addr used name   list of local variables
  8999                                  ;  200 var sign byte   840 NULL c = bp+4;
  9000 000044A4 C8000000                 ENTER  0,0
  9001 000044A8 8A4604                   mov al, [bp+4]
  9002 000044AB 8B1E[1600]               mov  bx, [cloc]
  9003 000044AF 8807                     mov  [bx], al
  9004 000044B1 FF06[1600]               inc  word[cloc]
  9005                                  
  9006                                  ;-841 int eprs(char *s) {char c;  while(*s) { c=*s; eprc(c); s++; } }
  9007 000044B5 C9                       LEAVE
  9008 000044B6 C3                       ret
  9009                                  ; ENDP
  9010                                  
  9011                                  eprs:  ; *** PROC ***
  9012                                  ;Function : eprs, Number of local variables: 2
  9013                                  ;   # type sign width addr used name   list of local variables
  9014                                  ;  200 ptr sign byte   841 NULL s = bp+4
  9015                                  ;  201 var sign byte   841 NULL c = bp-2;
  9016 000044B7 C8020000                 ENTER  2,0
  9017                                  .eprs517:
  9018 000044BB 8B5E04                   mov bx, [bp+4]
  9019 000044BE 8A07                     mov al, [bx]
  9020 000044C0 B400                     mov ah, 0
  9021 000044C2 08C0                     or  al, al
  9022 000044C4 0F841B00                 je .eprs518
  9023 000044C8 8B5E04                   mov bx, [bp+4]
  9024 000044CB 8A07                     mov al, [bx]
  9025 000044CD B400                     mov ah, 0
  9026 000044CF 8846FE                   mov [bp-2], al
  9027 000044D2 8A46FE                   mov al, byte [bp-2]
  9028 000044D5 B400                     mov ah, 0
  9029 000044D7 50                       push ax
  9030 000044D8 E8C9FF                   call eprc
  9031 000044DB 83C402                   add  sp, 2
  9032 000044DE FF4604                   inc  word[bp+4]
  9033 000044E1 EBD8                     jmp .eprs517
  9034                                  .eprs518:
  9035                                  
  9036                                  ;-842 int prc(unsigned char c) { 
  9037 000044E3 C9                       LEAVE
  9038 000044E4 C3                       ret
  9039                                  ; ENDP
  9040                                  
  9041                                  prc:  ; *** PROC ***
  9042                                  
  9043                                  ;-843   if (c==10) {_AX=13; writetty(); }
  9044                                  
  9045                                  ;Function : prc, Number of local variables: 1
  9046                                  ;   # type sign width addr used name   list of local variables
  9047                                  ;  200 var unsg byte   842 NULL c = bp+4;
  9048 000044E5 C8000000                 ENTER  0,0
  9049 000044E9 8A4604                   mov al, [bp+4]
  9050 000044EC 3C0A                     cmp al, 10
  9051 000044EE 0F850600                 jne .prc519
  9052 000044F2 B80D00                   mov  ax, 13
  9053 000044F5 E87BBB                   call writetty
  9054                                  
  9055                                  ;-844   _AL=c; writetty(); 
  9056                                  
  9057                                  .prc519:
  9058 000044F8 8A4604                   mov  al, [bp+4]
  9059 000044FB E875BB                   call writetty
  9060                                  
  9061                                  ;-845   fputcR(c, fdout); 
  9062                                  
  9063 000044FE FF36[1A00]               push word [fdout]
  9064 00004502 8A4604                   mov al, byte [bp+4]
  9065 00004505 B400                     mov ah, 0
  9066 00004507 50                       push ax
  9067 00004508 E81EBC                   call fputcR
  9068 0000450B 83C404                   add  sp, 4
  9069                                  
  9070                                  ;-846   }
  9071                                  
  9072                                  
  9073                                  ;-847 int prscomment(unsigned char *s) {unsigned char c;
  9074 0000450E C9                       LEAVE
  9075 0000450F C3                       ret
  9076                                  ; ENDP
  9077                                  
  9078                                  prscomment:  ; *** PROC ***
  9079                                  
  9080                                  ;-848   while(*s){c=*s;prc(c);s++;} }
  9081                                  
  9082                                  ;Function : prscomment, Number of local variables: 2
  9083                                  ;   # type sign width addr used name   list of local variables
  9084                                  ;  200 ptr unsg byte   847 NULL s = bp+4
  9085                                  ;  201 var unsg byte   847 NULL c = bp-2;
  9086 00004510 C8020000                 ENTER  2,0
  9087                                  .prscomment520:
  9088 00004514 8B5E04                   mov bx, [bp+4]
  9089 00004517 8A07                     mov al, [bx]
  9090 00004519 B400                     mov ah, 0
  9091 0000451B 08C0                     or  al, al
  9092 0000451D 0F841B00                 je .prscomment521
  9093 00004521 8B5E04                   mov bx, [bp+4]
  9094 00004524 8A07                     mov al, [bx]
  9095 00004526 B400                     mov ah, 0
  9096 00004528 8846FE                   mov [bp-2], al
  9097 0000452B 8A46FE                   mov al, byte [bp-2]
  9098 0000452E B400                     mov ah, 0
  9099 00004530 50                       push ax
  9100 00004531 E8B1FF                   call prc
  9101 00004534 83C402                   add  sp, 2
  9102 00004537 FF4604                   inc  word[bp+4]
  9103 0000453A EBD8                     jmp .prscomment520
  9104                                  .prscomment521:
  9105                                  
  9106                                  ;-849 int prnl() { prs("\n ");}
  9107 0000453C C9                       LEAVE
  9108 0000453D C3                       ret
  9109                                  ; ENDP
  9110                                  
  9111                                  prnl:  ; *** PROC ***
  9112 0000453E 68[4845]                 push prnl_0
  9113 00004541 E80800                   call prs
  9114 00004544 83C402                   add  sp, 2
  9115                                  
  9116                                  ;-850 
  9117                                  
  9118                                  
  9119                                  ;-851 int prs(unsigned char *s) {unsigned char c; int com; com=0;
  9120                                  
  9121 00004547 C3                       ret
  9122 00004548 5C6E2000                prnl_0 db "\n ",0
  9123                                  ; ENDP
  9124                                  
  9125                                  prs:  ; *** PROC ***
  9126                                  ;Function : prs, Number of local variables: 3
  9127                                  ;   # type sign width addr used name   list of local variables
  9128                                  ;  200 ptr unsg byte   851 NULL s = bp+4
  9129                                  ;  201 var unsg byte   851 NULL c = bp-2
  9130                                  ;  202 var sign word   851 NULL com = bp-4;
  9131 0000454C C8040000                 ENTER  4,0
  9132 00004550 B80000                   mov ax, 0
  9133 00004553 8946FC                   mov [bp-4], ax
  9134                                  
  9135                                  ;-852   while(*s) { c=*s; if (c==34) if (com) com=0; else com=1;
  9136                                  
  9137                                  .prs522:
  9138 00004556 8B5E04                   mov bx, [bp+4]
  9139 00004559 8A07                     mov al, [bx]
  9140 0000455B B400                     mov ah, 0
  9141 0000455D 08C0                     or  al, al
  9142 0000455F 0F847B00                 je .prs523
  9143 00004563 8B5E04                   mov bx, [bp+4]
  9144 00004566 8A07                     mov al, [bx]
  9145 00004568 B400                     mov ah, 0
  9146 0000456A 8846FE                   mov [bp-2], al
  9147 0000456D 8A46FE                   mov al, [bp-2]
  9148 00004570 3C22                     cmp al, 34
  9149 00004572 0F851800                 jne .prs524
  9150 00004576 8B46FC                   mov ax, [bp-4]
  9151 00004579 08C0                     or  al, al
  9152 0000457B 0F840900                 je .prs525
  9153 0000457F B80000                   mov ax, 0
  9154 00004582 8946FC                   mov [bp-4], ax
  9155 00004585 E90600                   jmp .prs526
  9156                                  .prs525:
  9157 00004588 B80100                   mov ax, 1
  9158 0000458B 8946FC                   mov [bp-4], ax
  9159                                  
  9160                                  ;-853     if (c==92) { if (com==0) { s++; c=*s;
  9161                                  
  9162                                  .prs526:
  9163                                  .prs524:
  9164 0000458E 8A46FE                   mov al, [bp-2]
  9165 00004591 3C5C                     cmp al, 92
  9166 00004593 0F853500                 jne .prs527
  9167 00004597 8B46FC                   mov ax, [bp-4]
  9168 0000459A 83F800                   cmp ax, 0
  9169 0000459D 0F852B00                 jne .prs528
  9170 000045A1 FF4604                   inc  word[bp+4]
  9171 000045A4 8B5E04                   mov bx, [bp+4]
  9172 000045A7 8A07                     mov al, [bx]
  9173 000045A9 B400                     mov ah, 0
  9174 000045AB 8846FE                   mov [bp-2], al
  9175                                  
  9176                                  ;-854           if (c=='n') c=10; if (c=='t') c= 9;
  9177                                  
  9178 000045AE 8A46FE                   mov al, [bp-2]
  9179 000045B1 3C6E                     cmp al, 110
  9180 000045B3 0F850600                 jne .prs529
  9181 000045B7 B80A00                   mov ax, 10
  9182 000045BA 8846FE                   mov [bp-2], al
  9183                                  .prs529:
  9184 000045BD 8A46FE                   mov al, [bp-2]
  9185 000045C0 3C74                     cmp al, 116
  9186 000045C2 0F850600                 jne .prs530
  9187 000045C6 B80900                   mov ax, 9
  9188 000045C9 8846FE                   mov [bp-2], al
  9189                                  
  9190                                  ;-855     } } prc(c); s++;  } }
  9191                                  
  9192                                  .prs530:
  9193                                  .prs528:
  9194                                  .prs527:
  9195 000045CC 8A46FE                   mov al, byte [bp-2]
  9196 000045CF B400                     mov ah, 0
  9197 000045D1 50                       push ax
  9198 000045D2 E810FF                   call prc
  9199 000045D5 83C402                   add  sp, 2
  9200 000045D8 FF4604                   inc  word[bp+4]
  9201 000045DB E978FF                   jmp .prs522
  9202                                  .prs523:
  9203                                  
  9204                                  ;-856 int eprnum(int n){int e; if(n<0) { eprc('-'); n=mkneg(n); }
  9205 000045DE C9                       LEAVE
  9206 000045DF C3                       ret
  9207                                  ; ENDP
  9208                                  
  9209                                  eprnum:  ; *** PROC ***
  9210                                  ;Function : eprnum, Number of local variables: 2
  9211                                  ;   # type sign width addr used name   list of local variables
  9212                                  ;  200 var sign word   856 NULL n = bp+4
  9213                                  ;  201 var sign word   856 NULL e = bp-2;
  9214 000045E0 C8020000                 ENTER  2,0
  9215 000045E4 8B4604                   mov ax, [bp+4]
  9216 000045E7 83F800                   cmp ax, 0
  9217 000045EA 0F8D1400                 jge .eprnum531
  9218 000045EE 6A2D                     push 45
  9219 000045F0 E8B1FE                   call eprc
  9220 000045F3 83C402                   add  sp, 2
  9221 000045F6 FF7604                   push word [bp+4]
  9222 000045F9 E8C6BA                   call mkneg
  9223 000045FC 83C402                   add  sp, 2
  9224 000045FF 894604                   mov [bp+4], ax
  9225                                  
  9226                                  ;-857   if (n >= 10) {e=n/10; eprnum(e);}  n=n%10; n=n+'0'; eprc(n); }
  9227                                  
  9228                                  .eprnum531:
  9229 00004602 8B4604                   mov ax, [bp+4]
  9230 00004605 83F80A                   cmp ax, 10 ;unsigned : 1
  9231 00004608 0F8C1500                 jl  .eprnum532
  9232 0000460C 8B4604                   mov ax, [bp+4]
  9233 0000460F BB0A00                   mov bx, 10
  9234 00004612 99                       cwd
  9235 00004613 F7FB                     idiv bx
  9236 00004615 8946FE                   mov [bp-2], ax
  9237 00004618 FF76FE                   push word [bp-2]
  9238 0000461B E8C2FF                   call eprnum
  9239 0000461E 83C402                   add  sp, 2
  9240                                  .eprnum532:
  9241 00004621 8B4604                   mov ax, [bp+4]
  9242 00004624 BB0A00                   mov bx, 10
  9243 00004627 99                       cwd
  9244 00004628 F7FB                     idiv bx
  9245 0000462A 89D0                     mov ax, dx
  9246 0000462C 894604                   mov [bp+4], ax
  9247 0000462F 8B4604                   mov ax, [bp+4]
  9248 00004632 83C030                   add ax, 48
  9249 00004635 894604                   mov [bp+4], ax
  9250 00004638 FF7604                   push word [bp+4]
  9251 0000463B E866FE                   call eprc
  9252 0000463E 83C402                   add  sp, 2
  9253                                  
  9254                                  ;-858 int pint1 (int n){int e; if(n<0) {  prc('-');  n=mkneg(n); }
  9255 00004641 C9                       LEAVE
  9256 00004642 C3                       ret
  9257                                  ; ENDP
  9258                                  
  9259                                  pint1:  ; *** PROC ***
  9260                                  ;Function : pint1, Number of local variables: 2
  9261                                  ;   # type sign width addr used name   list of local variables
  9262                                  ;  200 var sign word   858 NULL n = bp+4
  9263                                  ;  201 var sign word   858 NULL e = bp-2;
  9264 00004643 C8020000                 ENTER  2,0
  9265 00004647 8B4604                   mov ax, [bp+4]
  9266 0000464A 83F800                   cmp ax, 0
  9267 0000464D 0F8D1400                 jge .pint1533
  9268 00004651 6A2D                     push 45
  9269 00004653 E88FFE                   call prc
  9270 00004656 83C402                   add  sp, 2
  9271 00004659 FF7604                   push word [bp+4]
  9272 0000465C E863BA                   call mkneg
  9273 0000465F 83C402                   add  sp, 2
  9274 00004662 894604                   mov [bp+4], ax
  9275                                  
  9276                                  ;-859   if (n >= 10) {e=n/10;  pint1(e);}  n=n%10; n=n+'0'; prc(n); }
  9277                                  
  9278                                  .pint1533:
  9279 00004665 8B4604                   mov ax, [bp+4]
  9280 00004668 83F80A                   cmp ax, 10 ;unsigned : 1
  9281 0000466B 0F8C1500                 jl  .pint1534
  9282 0000466F 8B4604                   mov ax, [bp+4]
  9283 00004672 BB0A00                   mov bx, 10
  9284 00004675 99                       cwd
  9285 00004676 F7FB                     idiv bx
  9286 00004678 8946FE                   mov [bp-2], ax
  9287 0000467B FF76FE                   push word [bp-2]
  9288 0000467E E8C2FF                   call pint1
  9289 00004681 83C402                   add  sp, 2
  9290                                  .pint1534:
  9291 00004684 8B4604                   mov ax, [bp+4]
  9292 00004687 BB0A00                   mov bx, 10
  9293 0000468A 99                       cwd
  9294 0000468B F7FB                     idiv bx
  9295 0000468D 89D0                     mov ax, dx
  9296 0000468F 894604                   mov [bp+4], ax
  9297 00004692 8B4604                   mov ax, [bp+4]
  9298 00004695 83C030                   add ax, 48
  9299 00004698 894604                   mov [bp+4], ax
  9300 0000469B FF7604                   push word [bp+4]
  9301 0000469E E844FE                   call prc
  9302 000046A1 83C402                   add  sp, 2
  9303                                  
  9304                                  ;-860 int prunsign1(unsigned int n) { unsigned int e;
  9305 000046A4 C9                       LEAVE
  9306 000046A5 C3                       ret
  9307                                  ; ENDP
  9308                                  
  9309                                  prunsign1:  ; *** PROC ***
  9310                                  
  9311                                  ;-861   if ( _ n >= 10) {  e=n/10; /*DIV*/ prunsign1(e); }
  9312                                  
  9313                                  ;Function : prunsign1, Number of local variables: 2
  9314                                  ;   # type sign width addr used name   list of local variables
  9315                                  ;  200 var unsg word   860 NULL n = bp+4
  9316                                  ;  201 var unsg word   860 NULL e = bp-2;
  9317 000046A6 C8020000                 ENTER  2,0 ; constant expression
  9318 000046AA 837E040A                cmp word[bp+4], 10 ;unsigned : 0
  9319 000046AE 0F821700                 jb  .prunsign1535
  9320 000046B2 8B4604                   mov ax, [bp+4]
  9321 000046B5 BB0A00                   mov bx, 10
  9322 000046B8 BA0000                   mov dx, 0
  9323 000046BB F7F3                     div bx
  9324 000046BD 8946FE                   mov [bp-2], ax
  9325 000046C0 FF76FE                   push word [bp-2]
  9326 000046C3 E8E0FF                   call prunsign1
  9327 000046C6 83C402                   add  sp, 2
  9328                                  
  9329                                  ;-862     n = n % 10; /*unsigned mod*/   n += '0'; prc(n); }
  9330                                  
  9331                                  .prunsign1535:
  9332 000046C9 8B4604                   mov ax, [bp+4]
  9333 000046CC BB0A00                   mov bx, 10
  9334 000046CF BA0000                   mov dx, 0
  9335 000046D2 F7F3                     div bx
  9336 000046D4 89D0                     mov ax, dx
  9337 000046D6 894604                   mov [bp+4], ax
  9338 000046D9 83460430                 add  word[bp+4], 48
  9339 000046DD FF7604                   push word [bp+4]
  9340 000046E0 E802FE                   call prc
  9341 000046E3 83C402                   add  sp, 2
  9342                                  
  9343                                  ;-863 int printint51(unsigned int j)  {
  9344 000046E6 C9                       LEAVE
  9345 000046E7 C3                       ret
  9346                                  ; ENDP
  9347                                  
  9348                                  printint51:  ; *** PROC ***
  9349                                  
  9350                                  ;-864   if (j<10000) prc(32); if (j<1000) prc(32);  if (j<100) prc(32);
  9351                                  
  9352                                  ;Function : printint51, Number of local variables: 1
  9353                                  ;   # type sign width addr used name   list of local variables
  9354                                  ;  200 var unsg word   863 NULL j = bp+4;
  9355 000046E8 C8000000                 ENTER  0,0
  9356 000046EC 8B4604                   mov ax, [bp+4]
  9357 000046EF 3D1027                   cmp ax, 10000
  9358 000046F2 0F8D0800                 jge .printint51536
  9359 000046F6 6A20                     push 32
  9360 000046F8 E8EAFD                   call prc
  9361 000046FB 83C402                   add  sp, 2
  9362                                  .printint51536:
  9363 000046FE 8B4604                   mov ax, [bp+4]
  9364 00004701 3DE803                   cmp ax, 1000
  9365 00004704 0F8D0800                 jge .printint51537
  9366 00004708 6A20                     push 32
  9367 0000470A E8D8FD                   call prc
  9368 0000470D 83C402                   add  sp, 2
  9369                                  .printint51537:
  9370 00004710 8B4604                   mov ax, [bp+4]
  9371 00004713 83F864                   cmp ax, 100
  9372 00004716 0F8D0800                 jge .printint51538
  9373 0000471A 6A20                     push 32
  9374 0000471C E8C6FD                   call prc
  9375 0000471F 83C402                   add  sp, 2
  9376                                  
  9377                                  ;-865    if (j<10) prc(32);  prunsign1(j); }
  9378                                  
  9379                                  .printint51538:
  9380 00004722 8B4604                   mov ax, [bp+4]
  9381 00004725 83F80A                   cmp ax, 10
  9382 00004728 0F8D0800                 jge .printint51539
  9383 0000472C 6A20                     push 32
  9384 0000472E E8B4FD                   call prc
  9385 00004731 83C402                   add  sp, 2
  9386                                  .printint51539:
  9387 00004734 FF7604                   push word [bp+4]
  9388 00004737 E86CFF                   call prunsign1
  9389 0000473A 83C402                   add  sp, 2
  9390                                  
  9391                                  ;-866 
  9392                                  
  9393                                  
  9394                                  ;-867 int fgets1() { char c; c=*fgetsp;
  9395 0000473D C9                       LEAVE
  9396 0000473E C3                       ret
  9397                                  ; ENDP
  9398                                  
  9399                                  fgets1:  ; *** PROC ***
  9400                                  ;Function : fgets1, Number of local variables: 1
  9401                                  ;   # type sign width addr used name   list of local variables
  9402                                  ;  200 var sign byte   867 NULL c = bp-2;
  9403 0000473F C8020000                 ENTER  2,0
  9404 00004743 8B1E[6200]               mov bx, [fgetsp]
  9405 00004747 8A07                     mov al, [bx]
  9406 00004749 B400                     mov ah, 0
  9407 0000474B 8846FE                   mov [bp-2], al
  9408                                  
  9409                                  ;-868   if (c==0) { printinputline(); if (DOS_NoBytes == 0) return 0;
  9410                                  
  9411 0000474E 8A46FE                   mov al, [bp-2]
  9412 00004751 3C00                     cmp al, 0
  9413 00004753 0F852A00                 jne .fgets1540
  9414 00004757 E83700                   call printinputline
  9415 0000475A A1[7000]                 mov ax, [DOS_NoBytes]
  9416 0000475D 83F800                   cmp ax, 0
  9417 00004760 0F850600                 jne .fgets1541
  9418 00004764 B80000                   mov ax, 0
  9419 00004767 E92500                   jmp .retnfgets1
  9420                                  
  9421                                  ;-869     fgetsp=&fgetsdest; c=*fgetsp; spalte=0; }
  9422                                  
  9423                                  .fgets1541:
  9424 0000476A B80FD0                   mov ax, fgetsdest
  9425 0000476D A3[6200]                 mov word [fgetsp], ax
  9426 00004770 8B1E[6200]               mov bx, [fgetsp]
  9427 00004774 8A07                     mov al, [bx]
  9428 00004776 B400                     mov ah, 0
  9429 00004778 8846FE                   mov [bp-2], al
  9430 0000477B B80000                   mov ax, 0
  9431 0000477E A3[1F00]                 mov word [spalte], ax
  9432                                  
  9433                                  ;-870   fgetsp++; spalte++;  return c; }
  9434                                  
  9435                                  .fgets1540:
  9436 00004781 FF06[6200]               inc  word[fgetsp]
  9437 00004785 FF06[1F00]               inc  word[spalte]
  9438 00004789 8A46FE                   mov al, [bp-2]
  9439 0000478C E90000                   jmp .retnfgets1
  9440                                  
  9441                                  ;-871 int printinputline() { fgetsp=&fgetsdest;
  9442                                  
  9443 0000478F C9                       .retnfgets1: LEAVE
  9444 00004790 C3                       ret
  9445                                  ; ENDP
  9446                                  
  9447                                  printinputline:  ; *** PROC ***
  9448 00004791 B80FD0                   mov ax, fgetsdest
  9449 00004794 A3[6200]                 mov word [fgetsp], ax
  9450                                  
  9451                                  ;-872   do {DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);
  9452                                  
  9453                                  .printinputline542:
  9454 00004797 6A01                     push 1
  9455 00004799 FF36[1800]               push word [fdin]
  9456 0000479D 8D06[7200]               lea  ax, [DOS_ByteRead]
  9457 000047A1 50                       push ax
  9458 000047A2 E86FB9                   call readRL
  9459 000047A5 83C406                   add  sp, 6
  9460 000047A8 A3[7000]                 mov word [DOS_NoBytes], ax
  9461                                  
  9462                                  ;-873   if (DOS_NoBytes == 0) return; 
  9463                                  
  9464 000047AB A1[7000]                 mov ax, [DOS_NoBytes]
  9465 000047AE 83F800                   cmp ax, 0
  9466 000047B1 0F850300                 jne .printinputline543
  9467 000047B5 E95400                   jmp .retnprintinputline
  9468                                  
  9469                                  ;-874     *fgetsp=DOS_ByteRead; fgetsp++;} 
  9470                                  
  9471                                  .printinputline543:
  9472 000047B8 A0[7200]                 mov al, [DOS_ByteRead]
  9473 000047BB 8B1E[6200]               mov  bx, [fgetsp]
  9474 000047BF 8807                     mov  [bx], al
  9475 000047C1 FF06[6200]               inc  word[fgetsp]
  9476                                  
  9477                                  ;-875   while (DOS_ByteRead != 10); *fgetsp=0;
  9478                                  
  9479 000047C5 A0[7200]                 mov al, [DOS_ByteRead]
  9480 000047C8 3C0A                     cmp al, 10
  9481 000047CA 0F840200                 je  .printinputline544
  9482 000047CE EBC7                     jmp .printinputline542
  9483                                  .printinputline544:
  9484 000047D0 B80000                   mov ax, 0
  9485 000047D3 8B1E[6200]               mov  bx, [fgetsp]
  9486 000047D7 8807                     mov  [bx], al
  9487                                  
  9488                                  ;-876     if (fdout) { prs("\n\n;-"); prunsign1(lineno); prc(' '); lineno++;
  9489                                  
  9490 000047D9 A1[1A00]                 mov ax, [fdout]
  9491 000047DC 08C0                     or  al, al
  9492 000047DE 0F842A00                 je .printinputline545
  9493 000047E2 68[0D48]                 push printinputline_0
  9494 000047E5 E864FD                   call prs
  9495 000047E8 83C402                   add  sp, 2
  9496 000047EB FF36[6600]               push word [lineno]
  9497 000047EF E8B4FE                   call prunsign1
  9498 000047F2 83C402                   add  sp, 2
  9499 000047F5 6A20                     push 32
  9500 000047F7 E8EBFC                   call prc
  9501 000047FA 83C402                   add  sp, 2
  9502 000047FD FF06[6600]               inc  word[lineno]
  9503                                  
  9504                                  ;-877       prscomment(&fgetsdest);}
  9505                                  
  9506 00004801 8D060FD0                 lea  ax, [fgetsdest]
  9507 00004805 50                       push ax
  9508 00004806 E807FD                   call prscomment
  9509 00004809 83C402                   add  sp, 2
  9510                                  
  9511                                  ;-878 }
  9512                                  
  9513                                  .printinputline545:
  9514                                  
  9515                                  ;-879 int end1(int n) {fcloseR(fdin); fcloseR(fdout); exitR(n); }
  9516                                  
  9517                                   .retnprintinputline:
  9518 0000480C C3                       ret
  9519 0000480D 5C6E5C6E3B2D00          printinputline_0 db "\n\n;-",0
  9520                                  ; ENDP
  9521                                  
  9522                                  end1:  ; *** PROC ***
  9523                                  ;Function : end1, Number of local variables: 1
  9524                                  ;   # type sign width addr used name   list of local variables
  9525                                  ;  200 var sign word   879 NULL n = bp+4;
  9526 00004814 C8000000                 ENTER  0,0
  9527 00004818 FF36[1800]               push word [fdin]
  9528 0000481C E8D8B8                   call fcloseR
  9529 0000481F 83C402                   add  sp, 2
  9530 00004822 FF36[1A00]               push word [fdout]
  9531 00004826 E8CEB8                   call fcloseR
  9532 00004829 83C402                   add  sp, 2
  9533 0000482C FF7604                   push word [bp+4]
  9534 0000482F E8D4B8                   call exitR
  9535 00004832 83C402                   add  sp, 2
  9536                                  
  9537                                  ;-880 int error1(char *s) { 
  9538 00004835 C9                       LEAVE
  9539 00004836 C3                       ret
  9540                                  ; ENDP
  9541                                  
  9542                                  error1:  ; *** PROC ***
  9543                                  
  9544                                  ;-881   lineno--;
  9545                                  
  9546                                  ;Function : error1, Number of local variables: 1
  9547                                  ;   # type sign width addr used name   list of local variables
  9548                                  ;  200 ptr sign byte   880 NULL s = bp+4;
  9549 00004837 C8000000                 ENTER  0,0
  9550 0000483B FF0E[6600]               dec  word[lineno]
  9551                                  
  9552                                  ;-882   prnl(); prscomment(&fgetsdest);
  9553                                  
  9554 0000483F E8FCFC                   call prnl
  9555 00004842 8D060FD0                 lea  ax, [fgetsdest]
  9556 00004846 50                       push ax
  9557 00004847 E8C6FC                   call prscomment
  9558 0000484A 83C402                   add  sp, 2
  9559                                  
  9560                                  ;-883   prs(";Line: "); prunsign1(lineno);
  9561                                  
  9562 0000484D 68[E048]                 push error1_0
  9563 00004850 E8F9FC                   call prs
  9564 00004853 83C402                   add  sp, 2
  9565 00004856 FF36[6600]               push word [lineno]
  9566 0000485A E849FE                   call prunsign1
  9567 0000485D 83C402                   add  sp, 2
  9568                                  
  9569                                  ;-884   prs(" ************** ERROR: "); prs(s);
  9570                                  
  9571 00004860 68[E848]                 push error1_1
  9572 00004863 E8E6FC                   call prs
  9573 00004866 83C402                   add  sp, 2
  9574 00004869 FF7604                   push word [bp+4]
  9575 0000486C E8DDFC                   call prs
  9576 0000486F 83C402                   add  sp, 2
  9577                                  
  9578                                  ;-885   prs("  in column: "); pint1(spalte);
  9579                                  
  9580 00004872 68[0049]                 push error1_2
  9581 00004875 E8D4FC                   call prs
  9582 00004878 83C402                   add  sp, 2
  9583 0000487B FF36[1F00]               push word [spalte]
  9584 0000487F E8C1FD                   call pint1
  9585 00004882 83C402                   add  sp, 2
  9586                                  
  9587                                  ;-886   prs("\nToken: "); prunsign1(token); prs(", globC: "); prc(globC);
  9588                                  
  9589 00004885 68[0E49]                 push error1_3
  9590 00004888 E8C1FC                   call prs
  9591 0000488B 83C402                   add  sp, 2
  9592 0000488E FF36[1C00]               push word [token]
  9593 00004892 E811FE                   call prunsign1
  9594 00004895 83C402                   add  sp, 2
  9595 00004898 68[1849]                 push error1_4
  9596 0000489B E8AEFC                   call prs
  9597 0000489E 83C402                   add  sp, 2
  9598 000048A1 A0[1E00]                 mov al, byte [globC]
  9599 000048A4 B400                     mov ah, 0
  9600 000048A6 50                       push ax
  9601 000048A7 E83BFC                   call prc
  9602 000048AA 83C402                   add  sp, 2
  9603                                  
  9604                                  ;-887   prs(", thechar: "); pint1(thechar); prs(", symbol: "); prs(symbol);
  9605                                  
  9606 000048AD 68[2249]                 push error1_5
  9607 000048B0 E899FC                   call prs
  9608 000048B3 83C402                   add  sp, 2
  9609 000048B6 A0[2100]                 mov al, byte [thechar]
  9610 000048B9 B400                     mov ah, 0
  9611 000048BB 50                       push ax
  9612 000048BC E884FD                   call pint1
  9613 000048BF 83C402                   add  sp, 2
  9614 000048C2 68[2E49]                 push error1_6
  9615 000048C5 E884FC                   call prs
  9616 000048C8 83C402                   add  sp, 2
  9617 000048CB 8D062B81                 lea  ax, [symbol]
  9618 000048CF 50                       push ax
  9619 000048D0 E879FC                   call prs
  9620 000048D3 83C402                   add  sp, 2
  9621                                  
  9622                                  ;-888   end1(1); }
  9623                                  
  9624 000048D6 6A01                     push 1
  9625 000048D8 E839FF                   call end1
  9626 000048DB 83C402                   add  sp, 2
  9627                                  
  9628                                  ;-889 int listproc() {int i; 
  9629 000048DE C9                       LEAVE
  9630 000048DF C3                       ret
  9631 000048E0 3B4C696E653A2000        error1_0 db ";Line: ",0
  9632 000048E8 202A2A2A2A2A2A2A2A-     error1_1 db " ************** ERROR: ",0
  9633 000048F1 2A2A2A2A2A2A204552-
  9634 000048FA 524F523A2000       
  9635 00004900 2020696E20636F6C75-     error1_2 db "  in column: ",0
  9636 00004909 6D6E3A2000         
  9637 0000490E 5C6E546F6B656E3A20-     error1_3 db "\nToken: ",0
  9638 00004917 00                 
  9639 00004918 2C20676C6F62433A20-     error1_4 db ", globC: ",0
  9640 00004921 00                 
  9641 00004922 2C2074686563686172-     error1_5 db ", thechar: ",0
  9642 0000492B 3A2000             
  9643 0000492E 2C2073796D626F6C3A-     error1_6 db ", symbol: ",0
  9644 00004937 2000               
  9645                                  ; ENDP
  9646                                  
  9647                                  listproc:  ; *** PROC ***
  9648                                  
  9649                                  ;-890   if (LTop > LSTART) {
  9650                                  
  9651                                  ;Function : listproc, Number of local variables: 1
  9652                                  ;   # type sign width addr used name   list of local variables
  9653                                  ;  200 var sign word   889 NULL i = bp-2;
  9654 00004939 C8020000                 ENTER  2,0
  9655 0000493D A1[2C00]                 mov ax, [LTop]
  9656 00004940 3DC800                   cmp ax, 200
  9657 00004943 0F8E5700                 jle .listproc546
  9658                                  
  9659                                  ;-891   prs("\n;Function : "); prs(fname);
  9660                                  
  9661 00004947 68[A049]                 push listproc_0
  9662 0000494A E8FFFB                   call prs
  9663 0000494D 83C402                   add  sp, 2
  9664 00004950 8D06AB81                 lea  ax, [fname]
  9665 00004954 50                       push ax
  9666 00004955 E8F4FB                   call prs
  9667 00004958 83C402                   add  sp, 2
  9668                                  
  9669                                  ;-892   prs(", Number of local variables: "); i=LTop - LSTART; prunsign1(i);
  9670                                  
  9671 0000495B 68[AF49]                 push listproc_1
  9672 0000495E E8EBFB                   call prs
  9673 00004961 83C402                   add  sp, 2
  9674 00004964 A1[2C00]                 mov ax, [LTop]
  9675 00004967 2DC800                   sub ax, 200
  9676 0000496A 8946FE                   mov [bp-2], ax
  9677 0000496D FF76FE                   push word [bp-2]
  9678 00004970 E833FD                   call prunsign1
  9679 00004973 83C402                   add  sp, 2
  9680                                  
  9681                                  ;-893   prs("\n;   # type sign width addr used name   list of local variables");
  9682                                  
  9683 00004976 68[CD49]                 push listproc_2
  9684 00004979 E8D0FB                   call prs
  9685 0000497C 83C402                   add  sp, 2
  9686                                  
  9687                                  ;-894     i=LSTART; 
  9688                                  
  9689 0000497F B8C800                   mov ax, 200
  9690 00004982 8946FE                   mov [bp-2], ax
  9691                                  
  9692                                  ;-895     while (i < LTop) { listvar(i); i++; } } 
  9693                                  
  9694                                  .listproc547:
  9695 00004985 8B46FE                   mov ax, [bp-2]
  9696 00004988 3B06[2C00]               cmp ax, [LTop]
  9697 0000498C 0F8D0E00                 jge .listproc548
  9698 00004990 FF76FE                   push word [bp-2]
  9699 00004993 E87800                   call listvar
  9700 00004996 83C402                   add  sp, 2
  9701 00004999 FF46FE                   inc  word[bp-2]
  9702 0000499C EBE7                     jmp .listproc547
  9703                                  .listproc548:
  9704                                  
  9705                                  ;-896 }
  9706                                  
  9707                                  .listproc546:
  9708                                  
  9709                                  ;-897 int listvar(unsigned int i) {unsigned int j; char c;
  9710 0000499E C9                       LEAVE
  9711 0000499F C3                       ret
  9712 000049A0 5C6E3B46756E637469-     listproc_0 db "\n;Function : ",0
  9713 000049A9 6F6E203A2000       
  9714 000049AF 2C204E756D62657220-     listproc_1 db ", Number of local variables: ",0
  9715 000049B8 6F66206C6F63616C20-
  9716 000049C1 7661726961626C6573-
  9717 000049CA 3A2000             
  9718 000049CD 5C6E3B202020232074-     listproc_2 db "\n;   # type sign width addr used name   list of local variables",0
  9719 000049D6 797065207369676E20-
  9720 000049DF 776964746820616464-
  9721 000049E8 722075736564206E61-
  9722 000049F1 6D652020206C697374-
  9723 000049FA 206F66206C6F63616C-
  9724 00004A03 207661726961626C65-
  9725 00004A0C 7300               
  9726                                  ; ENDP
  9727                                  
  9728                                  listvar:  ; *** PROC ***
  9729                                  
  9730                                  ;-898   prs("\n;"); printint51(i); prc(32);
  9731                                  
  9732                                  ;Function : listvar, Number of local variables: 3
  9733                                  ;   # type sign width addr used name   list of local variables
  9734                                  ;  200 var unsg word   897 NULL i = bp+4
  9735                                  ;  201 var unsg word   897 NULL j = bp-2
  9736                                  ;  202 var sign byte   897 NULL c = bp-4;
  9737 00004A0E C8040000                 ENTER  4,0
  9738 00004A12 68[FA4B]                 push listvar_0
  9739 00004A15 E834FB                   call prs
  9740 00004A18 83C402                   add  sp, 2
  9741 00004A1B FF7604                   push word [bp+4]
  9742 00004A1E E8C7FC                   call printint51
  9743 00004A21 83C402                   add  sp, 2
  9744 00004A24 6A20                     push 32
  9745 00004A26 E8BCFA                   call prc
  9746 00004A29 83C402                   add  sp, 2
  9747                                  
  9748                                  ;-899   c=GType [i]; if(c=='V')prs("var ");   if(c=='*')prs("ptr ");
  9749                                  
  9750 00004A2C 8B5E04                   mov bx, [bp+4]
  9751 00004A2F 8A87B782                 mov al, [GType + bx]
  9752 00004A33 8846FC                   mov [bp-4], al
  9753 00004A36 8A46FC                   mov al, [bp-4]
  9754 00004A39 3C56                     cmp al, 86
  9755 00004A3B 0F850900                 jne .listvar549
  9756 00004A3F 68[FE4B]                 push listvar_1
  9757 00004A42 E807FB                   call prs
  9758 00004A45 83C402                   add  sp, 2
  9759                                  .listvar549:
  9760 00004A48 8A46FC                   mov al, [bp-4]
  9761 00004A4B 3C2A                     cmp al, 42
  9762 00004A4D 0F850900                 jne .listvar550
  9763 00004A51 68[034C]                 push listvar_2
  9764 00004A54 E8F5FA                   call prs
  9765 00004A57 83C402                   add  sp, 2
  9766                                  
  9767                                  ;-900                if(c=='&')prs("arr ");   if(c=='#')prs("def ");
  9768                                  
  9769                                  .listvar550:
  9770 00004A5A 8A46FC                   mov al, [bp-4]
  9771 00004A5D 3C26                     cmp al, 38
  9772 00004A5F 0F850900                 jne .listvar551
  9773 00004A63 68[084C]                 push listvar_3
  9774 00004A66 E8E3FA                   call prs
  9775 00004A69 83C402                   add  sp, 2
  9776                                  .listvar551:
  9777 00004A6C 8A46FC                   mov al, [bp-4]
  9778 00004A6F 3C23                     cmp al, 35
  9779 00004A71 0F850900                 jne .listvar552
  9780 00004A75 68[0D4C]                 push listvar_4
  9781 00004A78 E8D1FA                   call prs
  9782 00004A7B 83C402                   add  sp, 2
  9783                                  
  9784                                  ;-901   c=GSign [i]; if(c=='S')prs("sign ");  if(c=='U')prs("unsg ");
  9785                                  
  9786                                  .listvar552:
  9787 00004A7E 8B5E04                   mov bx, [bp+4]
  9788 00004A81 8A87E383                 mov al, [GSign + bx]
  9789 00004A85 8846FC                   mov [bp-4], al
  9790 00004A88 8A46FC                   mov al, [bp-4]
  9791 00004A8B 3C53                     cmp al, 83
  9792 00004A8D 0F850900                 jne .listvar553
  9793 00004A91 68[124C]                 push listvar_5
  9794 00004A94 E8B5FA                   call prs
  9795 00004A97 83C402                   add  sp, 2
  9796                                  .listvar553:
  9797 00004A9A 8A46FC                   mov al, [bp-4]
  9798 00004A9D 3C55                     cmp al, 85
  9799 00004A9F 0F850900                 jne .listvar554
  9800 00004AA3 68[184C]                 push listvar_6
  9801 00004AA6 E8A3FA                   call prs
  9802 00004AA9 83C402                   add  sp, 2
  9803                                  
  9804                                  ;-902   c=GWidth[i]; if(c==  1)prs("byte " ); if(c==  2)prs("word " );
  9805                                  
  9806                                  .listvar554:
  9807 00004AAC 8B5E04                   mov bx, [bp+4]
  9808 00004AAF 8A870F85                 mov al, [GWidth + bx]
  9809 00004AB3 8846FC                   mov [bp-4], al
  9810 00004AB6 8A46FC                   mov al, [bp-4]
  9811 00004AB9 3C01                     cmp al, 1
  9812 00004ABB 0F850900                 jne .listvar555
  9813 00004ABF 68[1E4C]                 push listvar_7
  9814 00004AC2 E887FA                   call prs
  9815 00004AC5 83C402                   add  sp, 2
  9816                                  .listvar555:
  9817 00004AC8 8A46FC                   mov al, [bp-4]
  9818 00004ACB 3C02                     cmp al, 2
  9819 00004ACD 0F850900                 jne .listvar556
  9820 00004AD1 68[244C]                 push listvar_8
  9821 00004AD4 E875FA                   call prs
  9822 00004AD7 83C402                   add  sp, 2
  9823                                  
  9824                                  ;-903                if(c==  4)prs("dwrd " );
  9825                                  
  9826                                  .listvar556:
  9827 00004ADA 8A46FC                   mov al, [bp-4]
  9828 00004ADD 3C04                     cmp al, 4
  9829 00004ADF 0F850900                 jne .listvar557
  9830 00004AE3 68[2A4C]                 push listvar_9
  9831 00004AE6 E863FA                   call prs
  9832 00004AE9 83C402                   add  sp, 2
  9833                                  
  9834                                  ;-904   j=GAdr[i]; printint51(j);
  9835                                  
  9836                                  .listvar557:
  9837 00004AEC 8B5E04                   mov bx, [bp+4]
  9838 00004AEF D1E3                     shl bx, 1
  9839 00004AF1 8B873B86                 mov ax, [GAdr + bx]
  9840 00004AF5 8946FE                   mov [bp-2], ax
  9841 00004AF8 FF76FE                   push word [bp-2]
  9842 00004AFB E8EAFB                   call printint51
  9843 00004AFE 83C402                   add  sp, 2
  9844                                  
  9845                                  ;-905   j=GUsed[i]; if (j) printint51(j);
  9846                                  
  9847 00004B01 8B5E04                   mov bx, [bp+4]
  9848 00004B04 D1E3                     shl bx, 1
  9849 00004B06 8B879388                 mov ax, [GUsed + bx]
  9850 00004B0A 8946FE                   mov [bp-2], ax
  9851 00004B0D 8B46FE                   mov ax, [bp-2]
  9852 00004B10 08C0                     or  al, al
  9853 00004B12 0F840C00                 je .listvar558
  9854 00004B16 FF76FE                   push word [bp-2]
  9855 00004B19 E8CCFB                   call printint51
  9856 00004B1C 83C402                   add  sp, 2
  9857                                  
  9858                                  ;-906   else {if(GType[i]=='#') prs("    -"); else prs(" NULL");}
  9859                                  
  9860 00004B1F E92200                   jmp .listvar559
  9861                                  .listvar558:
  9862 00004B22 8B5E04                   mov bx, [bp+4]
  9863 00004B25 8A87B782                 mov al, [GType + bx]
  9864 00004B29 3C23                     cmp al, 35
  9865 00004B2B 0F850C00                 jne .listvar560
  9866 00004B2F 68[304C]                 push listvar_10
  9867 00004B32 E817FA                   call prs
  9868 00004B35 83C402                   add  sp, 2
  9869 00004B38 E90900                   jmp .listvar561
  9870                                  .listvar560:
  9871 00004B3B 68[364C]                 push listvar_11
  9872 00004B3E E80BFA                   call prs
  9873 00004B41 83C402                   add  sp, 2
  9874                                  .listvar561:
  9875                                  
  9876                                  ;-907   prc(32);  pt=adrofname(i); prs(pt);
  9877                                  
  9878                                  .listvar559:
  9879 00004B44 6A20                     push 32
  9880 00004B46 E89CF9                   call prc
  9881 00004B49 83C402                   add  sp, 2
  9882 00004B4C FF7604                   push word [bp+4]
  9883 00004B4F E8E5BD                   call adrofname
  9884 00004B52 83C402                   add  sp, 2
  9885 00004B55 A3[6A00]                 mov word [pt], ax
  9886 00004B58 FF36[6A00]               push word [pt]
  9887 00004B5C E8EDF9                   call prs
  9888 00004B5F 83C402                   add  sp, 2
  9889                                  
  9890                                  ;-908   if(GType[i]=='#') { prc('='); j=GData[i]; prunsign1(j); }
  9891                                  
  9892 00004B62 8B5E04                   mov bx, [bp+4]
  9893 00004B65 8A87B782                 mov al, [GType + bx]
  9894 00004B69 3C23                     cmp al, 35
  9895 00004B6B 0F851D00                 jne .listvar562
  9896 00004B6F 6A3D                     push 61
  9897 00004B71 E871F9                   call prc
  9898 00004B74 83C402                   add  sp, 2
  9899 00004B77 8B5E04                   mov bx, [bp+4]
  9900 00004B7A D1E3                     shl bx, 1
  9901 00004B7C 8B87EB8A                 mov ax, [GData + bx]
  9902 00004B80 8946FE                   mov [bp-2], ax
  9903 00004B83 FF76FE                   push word [bp-2]
  9904 00004B86 E81DFB                   call prunsign1
  9905 00004B89 83C402                   add  sp, 2
  9906                                  
  9907                                  ;-909   if(GType[i]=='&') { prc('['); j=GData[i]; prunsign1(j); prc(']');}
  9908                                  
  9909                                  .listvar562:
  9910 00004B8C 8B5E04                   mov bx, [bp+4]
  9911 00004B8F 8A87B782                 mov al, [GType + bx]
  9912 00004B93 3C26                     cmp al, 38
  9913 00004B95 0F852500                 jne .listvar563
  9914 00004B99 6A5B                     push 91
  9915 00004B9B E847F9                   call prc
  9916 00004B9E 83C402                   add  sp, 2
  9917 00004BA1 8B5E04                   mov bx, [bp+4]
  9918 00004BA4 D1E3                     shl bx, 1
  9919 00004BA6 8B87EB8A                 mov ax, [GData + bx]
  9920 00004BAA 8946FE                   mov [bp-2], ax
  9921 00004BAD FF76FE                   push word [bp-2]
  9922 00004BB0 E8F3FA                   call prunsign1
  9923 00004BB3 83C402                   add  sp, 2
  9924 00004BB6 6A5D                     push 93
  9925 00004BB8 E82AF9                   call prc
  9926 00004BBB 83C402                   add  sp, 2
  9927                                  
  9928                                  ;-910   if (i >= LSTART) { prs(" = bp"); j=GData[i];
  9929                                  
  9930                                  .listvar563:
  9931 00004BBE 8B4604                   mov ax, [bp+4]
  9932 00004BC1 3DC800                   cmp ax, 200 ;unsigned : 0
  9933 00004BC4 0F823000                 jb  .listvar564
  9934 00004BC8 68[3C4C]                 push listvar_12
  9935 00004BCB E87EF9                   call prs
  9936 00004BCE 83C402                   add  sp, 2
  9937 00004BD1 8B5E04                   mov bx, [bp+4]
  9938 00004BD4 D1E3                     shl bx, 1
  9939 00004BD6 8B87EB8A                 mov ax, [GData + bx]
  9940 00004BDA 8946FE                   mov [bp-2], ax
  9941                                  
  9942                                  ;-911     if (j > 0) prc('+'); pint1(j);  }
  9943                                  
  9944 00004BDD 8B46FE                   mov ax, [bp-2]
  9945 00004BE0 83F800                   cmp ax, 0
  9946 00004BE3 0F8E0800                 jle .listvar565
  9947 00004BE7 6A2B                     push 43
  9948 00004BE9 E8F9F8                   call prc
  9949 00004BEC 83C402                   add  sp, 2
  9950                                  .listvar565:
  9951 00004BEF FF76FE                   push word [bp-2]
  9952 00004BF2 E84EFA                   call pint1
  9953 00004BF5 83C402                   add  sp, 2
  9954                                  
  9955                                  ;-912 }
  9956                                  
  9957                                  .listvar564:
  9958                                  
  9959                                  ;-913 int listcall() { int i;
  9960 00004BF8 C9                       LEAVE
  9961 00004BF9 C3                       ret
  9962 00004BFA 5C6E3B00                listvar_0 db "\n;",0
  9963 00004BFE 7661722000              listvar_1 db "var ",0
  9964 00004C03 7074722000              listvar_2 db "ptr ",0
  9965 00004C08 6172722000              listvar_3 db "arr ",0
  9966 00004C0D 6465662000              listvar_4 db "def ",0
  9967 00004C12 7369676E2000            listvar_5 db "sign ",0
  9968 00004C18 756E73672000            listvar_6 db "unsg ",0
  9969 00004C1E 627974652000            listvar_7 db "byte ",0
  9970 00004C24 776F72642000            listvar_8 db "word ",0
  9971 00004C2A 647772642000            listvar_9 db "dwrd ",0
  9972 00004C30 202020202D00            listvar_10 db "    -",0
  9973 00004C36 204E554C4C00            listvar_11 db " NULL",0
  9974 00004C3C 203D20627000            listvar_12 db " = bp",0
  9975                                  ; ENDP
  9976                                  
  9977                                  listcall:  ; *** PROC ***
  9978                                  
  9979                                  ;-914   prs("\n\n;    #  addr name   list of CALLs\n");
  9980                                  
  9981                                  ;Function : listcall, Number of local variables: 1
  9982                                  ;   # type sign width addr used name   list of local variables
  9983                                  ;  200 var sign word   913 NULL i = bp-2;
  9984 00004C42 C8020000                 ENTER  2,0
  9985 00004C46 68[704C]                 push listcall_0
  9986 00004C49 E800F9                   call prs
  9987 00004C4C 83C402                   add  sp, 2
  9988                                  
  9989                                  ;-915   i=0;  while (i< CTop) { calllisting(i); i++; } }
  9990                                  
  9991 00004C4F B80000                   mov ax, 0
  9992 00004C52 8946FE                   mov [bp-2], ax
  9993                                  .listcall566:
  9994 00004C55 8B46FE                   mov ax, [bp-2]
  9995 00004C58 3B06[3D00]               cmp ax, [CTop]
  9996 00004C5C 0F8D0E00                 jge .listcall567
  9997 00004C60 FF76FE                   push word [bp-2]
  9998 00004C63 E83200                   call calllisting
  9999 00004C66 83C402                   add  sp, 2
 10000 00004C69 FF46FE                   inc  word[bp-2]
 10001 00004C6C EBE7                     jmp .listcall566
 10002                                  .listcall567:
 10003                                  
 10004                                  ;-916 int calllisting(int i) {char c; int j;
 10005 00004C6E C9                       LEAVE
 10006 00004C6F C3                       ret
 10007 00004C70 5C6E5C6E3B20202020-     listcall_0 db "\n\n;    #  addr name   list of CALLs\n",0
 10008 00004C79 23202061646472206E-
 10009 00004C82 616D652020206C6973-
 10010 00004C8B 74206F662043414C4C-
 10011 00004C94 735C6E00           
 10012                                  ; ENDP
 10013                                  
 10014                                  calllisting:  ; *** PROC ***
 10015                                  
 10016                                  ;-917   prs("\n;"); printint51(i); prc(32);
 10017                                  
 10018                                  ;Function : calllisting, Number of local variables: 3
 10019                                  ;   # type sign width addr used name   list of local variables
 10020                                  ;  200 var sign word   916 NULL i = bp+4
 10021                                  ;  201 var sign byte   916 NULL c = bp-2
 10022                                  ;  202 var sign word   916 NULL j = bp-4;
 10023 00004C98 C8040000                 ENTER  4,0
 10024 00004C9C 68[0A4D]                 push calllisting_0
 10025 00004C9F E8AAF8                   call prs
 10026 00004CA2 83C402                   add  sp, 2
 10027 00004CA5 FF7604                   push word [bp+4]
 10028 00004CA8 E83DFA                   call printint51
 10029 00004CAB 83C402                   add  sp, 2
 10030 00004CAE 6A20                     push 32
 10031 00004CB0 E832F8                   call prc
 10032 00004CB3 83C402                   add  sp, 2
 10033                                  
 10034                                  ;-918   c=CType [i]; if(c==0)prs("unresolved ");
 10035                                  
 10036 00004CB6 8B5E04                   mov bx, [bp+4]
 10037 00004CB9 8A872FA1                 mov al, [CType + bx]
 10038 00004CBD 8846FE                   mov [bp-2], al
 10039 00004CC0 8A46FE                   mov al, [bp-2]
 10040 00004CC3 3C00                     cmp al, 0
 10041 00004CC5 0F850900                 jne .calllisting568
 10042 00004CC9 68[0E4D]                 push calllisting_1
 10043 00004CCC E87DF8                   call prs
 10044 00004CCF 83C402                   add  sp, 2
 10045                                  
 10046                                  ;-919   j=CAdr[i];            printint51(j); prc(32);
 10047                                  
 10048                                  .calllisting568:
 10049 00004CD2 8B5E04                   mov bx, [bp+4]
 10050 00004CD5 D1E3                     shl bx, 1
 10051 00004CD7 8B8757AB                 mov ax, [CAdr + bx]
 10052 00004CDB 8946FC                   mov [bp-4], ax
 10053 00004CDE FF76FC                   push word [bp-4]
 10054 00004CE1 E804FA                   call printint51
 10055 00004CE4 83C402                   add  sp, 2
 10056 00004CE7 6A20                     push 32
 10057 00004CE9 E8F9F7                   call prc
 10058 00004CEC 83C402                   add  sp, 2
 10059                                  
 10060                                  ;-920   from_far(NameA, j);   prs(NameA);
 10061                                  
 10062 00004CEF FF76FC                   push word [bp-4]
 10063 00004CF2 8D06[3F00]               lea  ax, [NameA]
 10064 00004CF6 50                       push ax
 10065 00004CF7 E8B206                   call from_far
 10066 00004CFA 83C404                   add  sp, 4
 10067 00004CFD 8D06[3F00]               lea  ax, [NameA]
 10068 00004D01 50                       push ax
 10069 00004D02 E847F8                   call prs
 10070 00004D05 83C402                   add  sp, 2
 10071                                  
 10072                                  ;-921 }
 10073                                  
 10074                                  
 10075                                  ;-922 int countcalls(int f) { unsigned int i;
 10076 00004D08 C9                       LEAVE
 10077 00004D09 C3                       ret
 10078 00004D0A 5C6E3B00                calllisting_0 db "\n;",0
 10079 00004D0E 756E7265736F6C7665-     calllisting_1 db "unresolved ",0
 10080 00004D17 642000             
 10081                                  ; ENDP
 10082                                  
 10083                                  countcalls:  ; *** PROC ***
 10084                                  
 10085                                  ;-923   pt=adrF(FNameField, f);
 10086                                  
 10087                                  ;Function : countcalls, Number of local variables: 2
 10088                                  ;   # type sign width addr used name   list of local variables
 10089                                  ;  200 var sign word   922 NULL f = bp+4
 10090                                  ;  201 var unsg word   922 NULL i = bp-2;
 10091 00004D1A C8020000                 ENTER  2,0
 10092 00004D1E FF7604                   push word [bp+4]
 10093 00004D21 8D064FBD                 lea  ax, [FNameField]
 10094 00004D25 50                       push ax
 10095 00004D26 E822BC                   call adrF
 10096 00004D29 83C404                   add  sp, 4
 10097 00004D2C A3[6A00]                 mov word [pt], ax
 10098                                  
 10099                                  ;-924   i=0;  while (i < CTop) {
 10100                                  
 10101 00004D2F B80000                   mov ax, 0
 10102 00004D32 8946FE                   mov [bp-2], ax
 10103                                  .countcalls569:
 10104 00004D35 8B46FE                   mov ax, [bp-2]
 10105 00004D38 3B06[3D00]               cmp ax, [CTop]
 10106 00004D3C 0F8D4A00                 jge .countcalls570
 10107                                  
 10108                                  ;-925     p1=CAdr[i];
 10109                                  
 10110 00004D40 8B5EFE                   mov bx, [bp-2]
 10111 00004D43 D1E3                     shl bx, 1
 10112 00004D45 8B8757AB                 mov ax, [CAdr + bx]
 10113 00004D49 A3[6C00]                 mov word [p1], ax
 10114                                  
 10115                                  ;-926     from_far(NameA, p1);
 10116                                  
 10117 00004D4C FF36[6C00]               push word [p1]
 10118 00004D50 8D06[3F00]               lea  ax, [NameA]
 10119 00004D54 50                       push ax
 10120 00004D55 E85406                   call from_far
 10121 00004D58 83C404                   add  sp, 4
 10122                                  
 10123                                  ;-927     if (eqstr(pt,NameA))  FCalls[f] = FCalls[f] + 1;
 10124                                  
 10125 00004D5B 8D06[3F00]               lea  ax, [NameA]
 10126 00004D5F 50                       push ax
 10127 00004D60 FF36[6A00]               push word [pt]
 10128 00004D64 E82FB4                   call eqstr
 10129 00004D67 83C404                   add  sp, 4
 10130 00004D6A 08C0                     or  al, al
 10131 00004D6C 0F841500                 je .countcalls571
 10132 00004D70 8B5E04                   mov bx, [bp+4]
 10133 00004D73 D1E3                     shl bx, 1
 10134 00004D75 8B87F7BA                 mov ax, [FCalls + bx]
 10135 00004D79 83C001                   add ax, 1
 10136 00004D7C 8B5E04                   mov bx, [bp+4]
 10137 00004D7F D1E3                     shl bx, 1
 10138 00004D81 8987F7BA                 mov [FCalls+bx], ax
 10139                                  
 10140                                  ;-928     i++; }
 10141                                  
 10142                                  .countcalls571:
 10143 00004D85 FF46FE                   inc  word[bp-2]
 10144                                  
 10145                                  ;-929 }
 10146                                  
 10147 00004D88 EBAB                     jmp .countcalls569
 10148                                  .countcalls570:
 10149                                  
 10150                                  ;-930 int listfunc() { int i;
 10151 00004D8A C9                       LEAVE
 10152 00004D8B C3                       ret
 10153                                  ; ENDP
 10154                                  
 10155                                  listfunc:  ; *** PROC ***
 10156                                  
 10157                                  ;-931   prs("\n\n\n;   # Calls Line Width  Name   list of functions\n");
 10158                                  
 10159                                  ;Function : listfunc, Number of local variables: 1
 10160                                  ;   # type sign width addr used name   list of local variables
 10161                                  ;  200 var sign word   930 NULL i = bp-2;
 10162 00004D8C C8020000                 ENTER  2,0
 10163 00004D90 68[D94D]                 push listfunc_0
 10164 00004D93 E8B6F7                   call prs
 10165 00004D96 83C402                   add  sp, 2
 10166                                  
 10167                                  ;-932   i=0;  while (i < FTop) { countcalls (i); i++; } 
 10168                                  
 10169 00004D99 B80000                   mov ax, 0
 10170 00004D9C 8946FE                   mov [bp-2], ax
 10171                                  .listfunc572:
 10172 00004D9F 8B46FE                   mov ax, [bp-2]
 10173 00004DA2 3B06[3B00]               cmp ax, [FTop]
 10174 00004DA6 0F8D0E00                 jge .listfunc573
 10175 00004DAA FF76FE                   push word [bp-2]
 10176 00004DAD E86AFF                   call countcalls
 10177 00004DB0 83C402                   add  sp, 2
 10178 00004DB3 FF46FE                   inc  word[bp-2]
 10179                                  
 10180                                  ;-933   i=0;  while (i < FTop) { funclisting(i); i++; } }
 10181                                  
 10182 00004DB6 EBE7                     jmp .listfunc572
 10183                                  .listfunc573:
 10184 00004DB8 B80000                   mov ax, 0
 10185 00004DBB 8946FE                   mov [bp-2], ax
 10186                                  .listfunc574:
 10187 00004DBE 8B46FE                   mov ax, [bp-2]
 10188 00004DC1 3B06[3B00]               cmp ax, [FTop]
 10189 00004DC5 0F8D0E00                 jge .listfunc575
 10190 00004DC9 FF76FE                   push word [bp-2]
 10191 00004DCC E84300                   call funclisting
 10192 00004DCF 83C402                   add  sp, 2
 10193 00004DD2 FF46FE                   inc  word[bp-2]
 10194 00004DD5 EBE7                     jmp .listfunc574
 10195                                  .listfunc575:
 10196                                  
 10197                                  ;-934 int funclisting(int i) {int j;  char c;
 10198 00004DD7 C9                       LEAVE
 10199 00004DD8 C3                       ret
 10200 00004DD9 5C6E5C6E5C6E3B2020-     listfunc_0 db "\n\n\n;   # Calls Line Width  Name   list of functions\n",0
 10201 00004DE2 20232043616C6C7320-
 10202 00004DEB 4C696E652057696474-
 10203 00004DF4 6820204E616D652020-
 10204 00004DFD 206C697374206F6620-
 10205 00004E06 66756E6374696F6E73-
 10206 00004E0F 5C6E00             
 10207                                  ; ENDP
 10208                                  
 10209                                  funclisting:  ; *** PROC ***
 10210                                  
 10211                                  ;-935   prs("\n;");    printint51(i);
 10212                                  
 10213                                  ;Function : funclisting, Number of local variables: 3
 10214                                  ;   # type sign width addr used name   list of local variables
 10215                                  ;  200 var sign word   934 NULL i = bp+4
 10216                                  ;  201 var sign word   934 NULL j = bp-2
 10217                                  ;  202 var sign byte   934 NULL c = bp-4;
 10218 00004E12 C8040000                 ENTER  4,0
 10219 00004E16 68[EE4E]                 push funclisting_0
 10220 00004E19 E830F7                   call prs
 10221 00004E1C 83C402                   add  sp, 2
 10222 00004E1F FF7604                   push word [bp+4]
 10223 00004E22 E8C3F8                   call printint51
 10224 00004E25 83C402                   add  sp, 2
 10225                                  
 10226                                  ;-936   j = FCalls[i]; if (j) printint51(j); else prs(" NULL");
 10227                                  
 10228 00004E28 8B5E04                   mov bx, [bp+4]
 10229 00004E2B D1E3                     shl bx, 1
 10230 00004E2D 8B87F7BA                 mov ax, [FCalls + bx]
 10231 00004E31 8946FE                   mov [bp-2], ax
 10232 00004E34 8B46FE                   mov ax, [bp-2]
 10233 00004E37 08C0                     or  al, al
 10234 00004E39 0F840C00                 je .funclisting576
 10235 00004E3D FF76FE                   push word [bp-2]
 10236 00004E40 E8A5F8                   call printint51
 10237 00004E43 83C402                   add  sp, 2
 10238 00004E46 E90900                   jmp .funclisting577
 10239                                  .funclisting576:
 10240 00004E49 68[F24E]                 push funclisting_1
 10241 00004E4C E8FDF6                   call prs
 10242 00004E4F 83C402                   add  sp, 2
 10243                                  
 10244                                  ;-937   j = FAdr[i];   printint51(j); prc(32);
 10245                                  
 10246                                  .funclisting577:
 10247 00004E52 8B5E04                   mov bx, [bp+4]
 10248 00004E55 D1E3                     shl bx, 1
 10249 00004E57 8B87FFA8                 mov ax, [FAdr + bx]
 10250 00004E5B 8946FE                   mov [bp-2], ax
 10251 00004E5E FF76FE                   push word [bp-2]
 10252 00004E61 E884F8                   call printint51
 10253 00004E64 83C402                   add  sp, 2
 10254 00004E67 6A20                     push 32
 10255 00004E69 E879F6                   call prc
 10256 00004E6C 83C402                   add  sp, 2
 10257                                  
 10258                                  ;-938   c=FType[i];
 10259                                  
 10260 00004E6F 8B5E04                   mov bx, [bp+4]
 10261 00004E72 8A8703A0                 mov al, [FType + bx]
 10262 00004E76 8846FC                   mov [bp-4], al
 10263                                  
 10264                                  ;-939   if(c=='V')prs("void " );    if(c=='B')prs("byte " );
 10265                                  
 10266 00004E79 8A46FC                   mov al, [bp-4]
 10267 00004E7C 3C56                     cmp al, 86
 10268 00004E7E 0F850900                 jne .funclisting578
 10269 00004E82 68[F84E]                 push funclisting_2
 10270 00004E85 E8C4F6                   call prs
 10271 00004E88 83C402                   add  sp, 2
 10272                                  .funclisting578:
 10273 00004E8B 8A46FC                   mov al, [bp-4]
 10274 00004E8E 3C42                     cmp al, 66
 10275 00004E90 0F850900                 jne .funclisting579
 10276 00004E94 68[FE4E]                 push funclisting_3
 10277 00004E97 E8B2F6                   call prs
 10278 00004E9A 83C402                   add  sp, 2
 10279                                  
 10280                                  ;-940   if(c=='W')prs("word " );    if(c=='D')prs("dwrd " );
 10281                                  
 10282                                  .funclisting579:
 10283 00004E9D 8A46FC                   mov al, [bp-4]
 10284 00004EA0 3C57                     cmp al, 87
 10285 00004EA2 0F850900                 jne .funclisting580
 10286 00004EA6 68[044F]                 push funclisting_4
 10287 00004EA9 E8A0F6                   call prs
 10288 00004EAC 83C402                   add  sp, 2
 10289                                  .funclisting580:
 10290 00004EAF 8A46FC                   mov al, [bp-4]
 10291 00004EB2 3C44                     cmp al, 68
 10292 00004EB4 0F850900                 jne .funclisting581
 10293 00004EB8 68[0A4F]                 push funclisting_5
 10294 00004EBB E88EF6                   call prs
 10295 00004EBE 83C402                   add  sp, 2
 10296                                  
 10297                                  ;-941   prc(32); prc(32);
 10298                                  
 10299                                  .funclisting581:
 10300 00004EC1 6A20                     push 32
 10301 00004EC3 E81FF6                   call prc
 10302 00004EC6 83C402                   add  sp, 2
 10303 00004EC9 6A20                     push 32
 10304 00004ECB E817F6                   call prc
 10305 00004ECE 83C402                   add  sp, 2
 10306                                  
 10307                                  ;-942   pt=adrF(FNameField, i); prs(pt);
 10308                                  
 10309 00004ED1 FF7604                   push word [bp+4]
 10310 00004ED4 8D064FBD                 lea  ax, [FNameField]
 10311 00004ED8 50                       push ax
 10312 00004ED9 E86FBA                   call adrF
 10313 00004EDC 83C404                   add  sp, 4
 10314 00004EDF A3[6A00]                 mov word [pt], ax
 10315 00004EE2 FF36[6A00]               push word [pt]
 10316 00004EE6 E863F6                   call prs
 10317 00004EE9 83C402                   add  sp, 2
 10318                                  
 10319                                  ;-943 }
 10320                                  
 10321                                  
 10322                                  ;-944 unsigned int MAXUI=65535;
 10323 00004EEC C9                       LEAVE
 10324 00004EED C3                       ret
 10325 00004EEE 5C6E3B00                funclisting_0 db "\n;",0
 10326 00004EF2 204E554C4C00            funclisting_1 db " NULL",0
 10327 00004EF8 766F69642000            funclisting_2 db "void ",0
 10328 00004EFE 627974652000            funclisting_3 db "byte ",0
 10329 00004F04 776F72642000            funclisting_4 db "word ",0
 10330 00004F0A 647772642000            funclisting_5 db "dwrd ",0
 10331                                  ; ENDP
 10332 00004F10 FFFF                    MAXUI dw 65535
 10333                                  
 10334                                  ;-945 int epilog() {unsigned int i; 
 10335                                  
 10336                                  
 10337                                  epilog:  ; *** PROC ***
 10338                                  
 10339                                  ;-946   strcpy(symbol, "LastFunctionByt");  storefunc();
 10340                                  
 10341                                  ;Function : epilog, Number of local variables: 1
 10342                                  ;   # type sign width addr used name   list of local variables
 10343                                  ;  200 var unsg word   945 NULL i = bp-2;
 10344 00004F12 C8020000                 ENTER  2,0
 10345 00004F16 68[4351]                 push epilog_0
 10346 00004F19 8D062B81                 lea  ax, [symbol]
 10347 00004F1D 50                       push ax
 10348 00004F1E E845B2                   call strcpy
 10349 00004F21 83C404                   add  sp, 4
 10350 00004F24 E8FFBC                   call storefunc
 10351                                  
 10352                                  ;-947   prs("\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret");
 10353                                  
 10354 00004F27 68[5351]                 push epilog_1
 10355 00004F2A E81FF6                   call prs
 10356 00004F2D 83C402                   add  sp, 2
 10357                                  
 10358                                  ;-948   prs("\n \n;   # type sign width  adr used name   list of global variables\n");
 10359                                  
 10360 00004F30 68[8051]                 push epilog_2
 10361 00004F33 E816F6                   call prs
 10362 00004F36 83C402                   add  sp, 2
 10363                                  
 10364                                  ;-949   i=1;
 10365                                  
 10366 00004F39 B80100                   mov ax, 1
 10367 00004F3C 8946FE                   mov [bp-2], ax
 10368                                  
 10369                                  ;-950   while (i< GTop) { listvar(i); i++; }
 10370                                  
 10371                                  .epilog582:
 10372 00004F3F 8B46FE                   mov ax, [bp-2]
 10373 00004F42 3B06[2A00]               cmp ax, [GTop]
 10374 00004F46 0F8D0E00                 jge .epilog583
 10375 00004F4A FF76FE                   push word [bp-2]
 10376 00004F4D E8BEFA                   call listvar
 10377 00004F50 83C402                   add  sp, 2
 10378 00004F53 FF46FE                   inc  word[bp-2]
 10379                                  
 10380                                  ;-951   listfunc();   listcall();
 10381                                  
 10382 00004F56 EBE7                     jmp .epilog582
 10383                                  .epilog583:
 10384 00004F58 E831FE                   call listfunc
 10385 00004F5B E8E4FC                   call listcall
 10386                                  
 10387                                  ;-952 
 10388                                  
 10389                                  
 10390                                  ;-953   prs("\n;Input: "); prs(&namein);
 10391                                  
 10392 00004F5E 68[C751]                 push epilog_3
 10393 00004F61 E8E8F5                   call prs
 10394 00004F64 83C402                   add  sp, 2
 10395 00004F67 8D06EE81                 lea  ax, [namein]
 10396 00004F6B 50                       push ax
 10397 00004F6C E8DDF5                   call prs
 10398 00004F6F 83C402                   add  sp, 2
 10399                                  
 10400                                  ;-954   prs(", List: ");   prs(&namelst);
 10401                                  
 10402 00004F72 68[D251]                 push epilog_4
 10403 00004F75 E8D4F5                   call prs
 10404 00004F78 83C402                   add  sp, 2
 10405 00004F7B 8D063182                 lea  ax, [namelst]
 10406 00004F7F 50                       push ax
 10407 00004F80 E8C9F5                   call prs
 10408 00004F83 83C402                   add  sp, 2
 10409                                  
 10410                                  ;-955   prs(",  Lines:"); printint51(lineno);
 10411                                  
 10412 00004F86 68[DB51]                 push epilog_5
 10413 00004F89 E8C0F5                   call prs
 10414 00004F8C 83C402                   add  sp, 2
 10415 00004F8F FF36[6600]               push word [lineno]
 10416 00004F93 E852F7                   call printint51
 10417 00004F96 83C402                   add  sp, 2
 10418                                  
 10419                                  ;-956   prs("\n;Glob. variables:"); GTop--; printint51(GTop);
 10420                                  
 10421 00004F99 68[E551]                 push epilog_6
 10422 00004F9C E8ADF5                   call prs
 10423 00004F9F 83C402                   add  sp, 2
 10424 00004FA2 FF0E[2A00]               dec  word[GTop]
 10425 00004FA6 FF36[2A00]               push word [GTop]
 10426 00004FAA E83BF7                   call printint51
 10427 00004FAD 83C402                   add  sp, 2
 10428                                  
 10429                                  ;-957   prs(" max.:"); printint51(LSTART);
 10430                                  
 10431 00004FB0 68[F951]                 push epilog_7
 10432 00004FB3 E896F5                   call prs
 10433 00004FB6 83C402                   add  sp, 2
 10434 00004FB9 68C800                   push 200
 10435 00004FBC E829F7                   call printint51
 10436 00004FBF 83C402                   add  sp, 2
 10437                                  
 10438                                  ;-958   prs("\n;Functions      :"); printint51(FTop);
 10439                                  
 10440 00004FC2 68[0052]                 push epilog_8
 10441 00004FC5 E884F5                   call prs
 10442 00004FC8 83C402                   add  sp, 2
 10443 00004FCB FF36[3B00]               push word [FTop]
 10444 00004FCF E816F7                   call printint51
 10445 00004FD2 83C402                   add  sp, 2
 10446                                  
 10447                                  ;-959   prs(" max.:"); printint51(FUNCMAX);
 10448                                  
 10449 00004FD5 68[1452]                 push epilog_9
 10450 00004FD8 E871F5                   call prs
 10451 00004FDB 83C402                   add  sp, 2
 10452 00004FDE 682C01                   push 300
 10453 00004FE1 E804F7                   call printint51
 10454 00004FE4 83C402                   add  sp, 2
 10455                                  
 10456                                  ;-960   prs("\n;Calls          :"); printint51(CTop);
 10457                                  
 10458 00004FE7 68[1B52]                 push epilog_10
 10459 00004FEA E85FF5                   call prs
 10460 00004FED 83C402                   add  sp, 2
 10461 00004FF0 FF36[3D00]               push word [CTop]
 10462 00004FF4 E8F1F6                   call printint51
 10463 00004FF7 83C402                   add  sp, 2
 10464                                  
 10465                                  ;-961   prs(" max.:"); printint51(CALLMAX);
 10466                                  
 10467 00004FFA 68[2F52]                 push epilog_11
 10468 00004FFD E84CF5                   call prs
 10469 00005000 83C402                   add  sp, 2
 10470 00005003 68D007                   push 2000
 10471 00005006 E8DFF6                   call printint51
 10472 00005009 83C402                   add  sp, 2
 10473                                  
 10474                                  ;-962   prs(", NameField:"); printint51(CNameTop);
 10475                                  
 10476 0000500C 68[3652]                 push epilog_12
 10477 0000500F E83AF5                   call prs
 10478 00005012 83C402                   add  sp, 2
 10479 00005015 FF36[6000]               push word [CNameTop]
 10480 00005019 E8CCF6                   call printint51
 10481 0000501C 83C402                   add  sp, 2
 10482                                  
 10483                                  ;-963   prs(" max.:"); printint51(65535);
 10484                                  
 10485 0000501F 68[4352]                 push epilog_13
 10486 00005022 E827F5                   call prs
 10487 00005025 83C402                   add  sp, 2
 10488 00005028 6AFF                     push -1
 10489 0000502A E8BBF6                   call printint51
 10490 0000502D 83C402                   add  sp, 2
 10491                                  
 10492                                  ;-964 //  prs(", segE:"); printint51(segE);
 10493                                  
 10494                                  
 10495                                  ;-965   __asm{call LastFunctionByt}  _ i=ax;
 10496                                  
 10497 00005030 E89903                  call LastFunctionByt
 10498 00005033 8946FE                  mov [bp-2], ax
 10499                                  
 10500                                  ;-966   prs("\n;Code until     :"); printint51(i);
 10501                                  
 10502 00005036 68[4A52]                 push epilog_14
 10503 00005039 E810F5                   call prs
 10504 0000503C 83C402                   add  sp, 2
 10505 0000503F FF76FE                   push word [bp-2]
 10506 00005042 E8A3F6                   call printint51
 10507 00005045 83C402                   add  sp, 2
 10508                                  
 10509                                  ;-967   prs(" max.: "); printint51(ORGDATAORIG); i=ORGDATAORIG-i; prs(", free:");
 10510                                  
 10511 00005048 68[5E52]                 push epilog_15
 10512 0000504B E8FEF4                   call prs
 10513 0000504E 83C402                   add  sp, 2
 10514 00005051 FF36[0E00]               push word [ORGDATAORIG]
 10515 00005055 E890F6                   call printint51
 10516 00005058 83C402                   add  sp, 2
 10517 0000505B A1[0E00]                 mov ax, [ORGDATAORIG]
 10518 0000505E 2B46FE                   sub ax, [bp-2]
 10519 00005061 8946FE                   mov [bp-2], ax
 10520 00005064 68[6652]                 push epilog_16
 10521 00005067 E8E2F4                   call prs
 10522 0000506A 83C402                   add  sp, 2
 10523                                  
 10524                                  ;-968   printint51(i); if (i <= 1000)prs(" *** Warning *** Code area too small");
 10525                                  
 10526 0000506D FF76FE                   push word [bp-2]
 10527 00005070 E875F6                   call printint51
 10528 00005073 83C402                   add  sp, 2
 10529 00005076 8B46FE                   mov ax, [bp-2]
 10530 00005079 3DE803                   cmp ax, 1000
 10531 0000507C 0F870900                 ja  .epilog584
 10532 00005080 68[6E52]                 push epilog_17
 10533 00005083 E8C6F4                   call prs
 10534 00005086 83C402                   add  sp, 2
 10535                                  
 10536                                  ;-969   prs("\n;Data (HeapEnd) :"); prunsign1(orgData); i=MAXUI-orgData;
 10537                                  
 10538                                  .epilog584:
 10539 00005089 68[9352]                 push epilog_18
 10540 0000508C E8BDF4                   call prs
 10541 0000508F 83C402                   add  sp, 2
 10542 00005092 FF36[1000]               push word [orgData]
 10543 00005096 E80DF6                   call prunsign1
 10544 00005099 83C402                   add  sp, 2
 10545 0000509C A1[104F]                 mov ax, [MAXUI]
 10546 0000509F 2B06[1000]               sub ax, [orgData]
 10547 000050A3 8946FE                   mov [bp-2], ax
 10548                                  
 10549                                  ;-970   prs(", resting stacksize: ");printint51(i);
 10550                                  
 10551 000050A6 68[A752]                 push epilog_19
 10552 000050A9 E8A0F4                   call prs
 10553 000050AC 83C402                   add  sp, 2
 10554 000050AF FF76FE                   push word [bp-2]
 10555 000050B2 E833F6                   call printint51
 10556 000050B5 83C402                   add  sp, 2
 10557                                  
 10558                                  ;-971   if (i <= 5000) prs(" *** Warning *** Stack too small");
 10559                                  
 10560 000050B8 8B46FE                   mov ax, [bp-2]
 10561 000050BB 3D8813                   cmp ax, 5000
 10562 000050BE 0F870900                 ja  .epilog585
 10563 000050C2 68[BD52]                 push epilog_20
 10564 000050C5 E884F4                   call prs
 10565 000050C8 83C402                   add  sp, 2
 10566                                  
 10567                                  ;-972   prs("\n;Max. Const in '"); prs(coname); prs("' :"); printint51(maxco);
 10568                                  
 10569                                  .epilog585:
 10570 000050CB 68[DE52]                 push epilog_21
 10571 000050CE E87BF4                   call prs
 10572 000050D1 83C402                   add  sp, 2
 10573 000050D4 8D06E880                 lea  ax, [coname]
 10574 000050D8 50                       push ax
 10575 000050D9 E870F4                   call prs
 10576 000050DC 83C402                   add  sp, 2
 10577 000050DF 68[F152]                 push epilog_22
 10578 000050E2 E867F4                   call prs
 10579 000050E5 83C402                   add  sp, 2
 10580 000050E8 FF36[1200]               push word [maxco]
 10581 000050EC E8F9F5                   call printint51
 10582 000050EF 83C402                   add  sp, 2
 10583                                  
 10584                                  ;-973   prs(" max."); printint51(COMAX); i=COMAX; i=i-maxco; prs(", free:");
 10585                                  
 10586 000050F2 68[F552]                 push epilog_23
 10587 000050F5 E854F4                   call prs
 10588 000050F8 83C402                   add  sp, 2
 10589 000050FB 68B80B                   push 3000
 10590 000050FE E8E7F5                   call printint51
 10591 00005101 83C402                   add  sp, 2
 10592 00005104 B8B80B                   mov ax, 3000
 10593 00005107 8946FE                   mov [bp-2], ax
 10594 0000510A 8B46FE                   mov ax, [bp-2]
 10595 0000510D 2B06[1200]               sub ax, [maxco]
 10596 00005111 8946FE                   mov [bp-2], ax
 10597 00005114 68[FB52]                 push epilog_24
 10598 00005117 E832F4                   call prs
 10599 0000511A 83C402                   add  sp, 2
 10600                                  
 10601                                  ;-974   printint51(i);if (i <= 1000)prs(" *** Warning *** constant area too small");
 10602                                  
 10603 0000511D FF76FE                   push word [bp-2]
 10604 00005120 E8C5F5                   call printint51
 10605 00005123 83C402                   add  sp, 2
 10606 00005126 8B46FE                   mov ax, [bp-2]
 10607 00005129 3DE803                   cmp ax, 1000
 10608 0000512C 0F870900                 ja  .epilog586
 10609 00005130 68[0353]                 push epilog_25
 10610 00005133 E816F4                   call prs
 10611 00005136 83C402                   add  sp, 2
 10612                                  
 10613                                  ;-975   end1(0);}
 10614                                  
 10615                                  .epilog586:
 10616 00005139 6A00                     push 0
 10617 0000513B E8D6F6                   call end1
 10618 0000513E 83C402                   add  sp, 2
 10619                                  
 10620                                  ;-976 // while(expr) stmt; do stmt while(expr); FOR: i=0; while(i<10){stmt; i++;}
 10621                                  
 10622                                  
 10623                                  ;-977 int setblock(unsigned int i) {
 10624 00005141 C9                       LEAVE
 10625 00005142 C3                       ret
 10626 00005143 4C61737446756E6374-     epilog_0 db "LastFunctionByt",0
 10627 0000514C 696F6E42797400     
 10628 00005153 5C6E4C61737446756E-     epilog_1 db "\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret",0
 10629 0000515C 6374696F6E4279743A-
 10630 00005165 646220304538682C20-
 10631 0000516E 302C20305C6E706F70-
 10632 00005177 2061785C6E72657400 
 10633 00005180 5C6E205C6E3B202020-     epilog_2 db "\n \n;   # type sign width  adr used name   list of global variables\n",0
 10634 00005189 232074797065207369-
 10635 00005192 676E20776964746820-
 10636 0000519B 206164722075736564-
 10637 000051A4 206E616D652020206C-
 10638 000051AD 697374206F6620676C-
 10639 000051B6 6F62616C2076617269-
 10640 000051BF 61626C65735C6E00   
 10641 000051C7 5C6E3B496E7075743A-     epilog_3 db "\n;Input: ",0
 10642 000051D0 2000               
 10643 000051D2 2C204C6973743A2000      epilog_4 db ", List: ",0
 10644 000051DB 2C20204C696E65733A-     epilog_5 db ",  Lines:",0
 10645 000051E4 00                 
 10646 000051E5 5C6E3B476C6F622E20-     epilog_6 db "\n;Glob. variables:",0
 10647 000051EE 7661726961626C6573-
 10648 000051F7 3A00               
 10649 000051F9 206D61782E3A00          epilog_7 db " max.:",0
 10650 00005200 5C6E3B46756E637469-     epilog_8 db "\n;Functions      :",0
 10651 00005209 6F6E73202020202020-
 10652 00005212 3A00               
 10653 00005214 206D61782E3A00          epilog_9 db " max.:",0
 10654 0000521B 5C6E3B43616C6C7320-     epilog_10 db "\n;Calls          :",0
 10655 00005224 202020202020202020-
 10656 0000522D 3A00               
 10657 0000522F 206D61782E3A00          epilog_11 db " max.:",0
 10658 00005236 2C204E616D65466965-     epilog_12 db ", NameField:",0
 10659 0000523F 6C643A00           
 10660 00005243 206D61782E3A00          epilog_13 db " max.:",0
 10661 0000524A 5C6E3B436F64652075-     epilog_14 db "\n;Code until     :",0
 10662 00005253 6E74696C2020202020-
 10663 0000525C 3A00               
 10664 0000525E 206D61782E3A2000        epilog_15 db " max.: ",0
 10665 00005266 2C20667265653A00        epilog_16 db ", free:",0
 10666 0000526E 202A2A2A205761726E-     epilog_17 db " *** Warning *** Code area too small",0
 10667 00005277 696E67202A2A2A2043-
 10668 00005280 6F6465206172656120-
 10669 00005289 746F6F20736D616C6C-
 10670 00005292 00                 
 10671 00005293 5C6E3B446174612028-     epilog_18 db "\n;Data (HeapEnd) :",0
 10672 0000529C 48656170456E642920-
 10673 000052A5 3A00               
 10674 000052A7 2C2072657374696E67-     epilog_19 db ", resting stacksize: ",0
 10675 000052B0 20737461636B73697A-
 10676 000052B9 653A2000           
 10677 000052BD 202A2A2A205761726E-     epilog_20 db " *** Warning *** Stack too small",0
 10678 000052C6 696E67202A2A2A2053-
 10679 000052CF 7461636B20746F6F20-
 10680 000052D8 736D616C6C00       
 10681 000052DE 5C6E3B4D61782E2043-     epilog_21 db "\n;Max. Const in '",0
 10682 000052E7 6F6E737420696E2027-
 10683 000052F0 00                 
 10684 000052F1 27203A00                epilog_22 db "' :",0
 10685 000052F5 206D61782E00            epilog_23 db " max.",0
 10686 000052FB 2C20667265653A00        epilog_24 db ", free:",0
 10687 00005303 202A2A2A205761726E-     epilog_25 db " *** Warning *** constant area too small",0
 10688 0000530C 696E67202A2A2A2063-
 10689 00005315 6F6E7374616E742061-
 10690 0000531E 72656120746F6F2073-
 10691 00005327 6D616C6C00         
 10692                                  ; ENDP
 10693                                  
 10694                                  setblock:  ; *** PROC ***
 10695                                  
 10696                                  ;-978   DOS_ERR=0; _BX=i; _ ax=cs; _ es=ax; _AX=0x4A00; DosInt(); }
 10697                                  
 10698                                  ;Function : setblock, Number of local variables: 1
 10699                                  ;   # type sign width addr used name   list of local variables
 10700                                  ;  200 var unsg word   977 NULL i = bp+4;
 10701 0000532C C8000000                 ENTER  0,0
 10702 00005330 B80000                   mov ax, 0
 10703 00005333 A3[6E00]                 mov word [DOS_ERR], ax
 10704 00005336 8B5E04                   mov  bx, [bp+4]
 10705 00005339 8CC8                     mov  ax, cs
 10706 0000533B 8EC0                     mov  es, ax
 10707 0000533D B8004A                   mov  ax, 18944
 10708 00005340 E88AAD                   call DosInt
 10709                                  
 10710                                  ;-979 int allocmem(unsigned int i) { unsigned int vAX; unsigned int vBX;
 10711 00005343 C9                       LEAVE
 10712 00005344 C3                       ret
 10713                                  ; ENDP
 10714                                  
 10715                                  allocmem:  ; *** PROC ***
 10716                                  
 10717                                  ;-980   DOS_ERR=0; _BX=i;  _AX=0x4800; DosInt(); _ vAX=ax; _ vBX=bx;
 10718                                  
 10719                                  ;Function : allocmem, Number of local variables: 3
 10720                                  ;   # type sign width addr used name   list of local variables
 10721                                  ;  200 var unsg word   979 NULL i = bp+4
 10722                                  ;  201 var unsg word   979 NULL vAX = bp-2
 10723                                  ;  202 var unsg word   979 NULL vBX = bp-4;
 10724 00005345 C8040000                 ENTER  4,0
 10725 00005349 B80000                   mov ax, 0
 10726 0000534C A3[6E00]                 mov word [DOS_ERR], ax
 10727 0000534F 8B5E04                   mov  bx, [bp+4]
 10728 00005352 B80048                   mov  ax, 18432
 10729 00005355 E875AD                   call DosInt
 10730 00005358 8946FE                  mov [bp-2], ax
 10731 0000535B 895EFC                  mov [bp-4], bx
 10732                                  
 10733                                  ;-981   if(DOS_ERR) return vBX;   return vAX;
 10734                                  
 10735 0000535E A1[6E00]                 mov ax, [DOS_ERR]
 10736 00005361 08C0                     or  al, al
 10737 00005363 0F840600                 je .allocmem587
 10738 00005367 8B46FC                   mov ax, [bp-4]
 10739 0000536A E90600                   jmp .retnallocmem
 10740                                  .allocmem587:
 10741 0000536D 8B46FE                   mov ax, [bp-2]
 10742 00005370 E90000                   jmp .retnallocmem
 10743                                  
 10744                                  ;-982 }
 10745                                  
 10746                                  
 10747                                  ;-983 int copyF(char *dest, char *src, unsigned int sz) {
 10748                                  
 10749 00005373 C9                       .retnallocmem: LEAVE
 10750 00005374 C3                       ret
 10751                                  ; ENDP
 10752                                  
 10753                                  copyF:  ; *** PROC ***
 10754                                  
 10755                                  ;-984   segE;  _ es=ax;  _ si=src;  _ di=dest; _ cx=sz;  // ds:si   es:di
 10756                                  
 10757                                  ;Function : copyF, Number of local variables: 3
 10758                                  ;   # type sign width addr used name   list of local variables
 10759                                  ;  200 ptr sign byte   983 NULL dest = bp+4
 10760                                  ;  201 ptr sign byte   983 NULL src = bp+6
 10761                                  ;  202 var unsg word   983 NULL sz = bp+8;
 10762 00005375 C8000000                 ENTER  0,0
 10763 00005379 A1[6400]                 mov ax, [segE]
 10764 0000537C 8EC0                     mov  es, ax
 10765 0000537E 8B7606                   mov  si, [bp+6]
 10766 00005381 8B7E04                   mov  di, [bp+4]
 10767 00005384 8B4E08                   mov  cx, [bp+8]
 10768                                  
 10769                                  ;-985   asm cld
 10770                                  
 10771 00005387 FC                       cld
 10772                                  
 10773                                  ;-986   asm rep movsb
 10774                                  
 10775 00005388 F3A4                     rep movsb
 10776                                  
 10777                                  ;-987   asm mov byte [es:di], 0
 10778                                  
 10779 0000538A 26C60500                 mov byte [es:di], 0
 10780                                  
 10781                                  ;-988 }
 10782                                  
 10783                                  
 10784                                  ;-989 int to_far(char *dest, char *src) {
 10785 0000538E C9                       LEAVE
 10786 0000538F C3                       ret
 10787                                  ; ENDP
 10788                                  
 10789                                  to_far:  ; *** PROC ***
 10790                                  
 10791                                  ;-990   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
 10792                                  
 10793                                  ;Function : to_far, Number of local variables: 2
 10794                                  ;   # type sign width addr used name   list of local variables
 10795                                  ;  200 ptr sign byte   989 NULL dest = bp+4
 10796                                  ;  201 ptr sign byte   989 NULL src = bp+6;
 10797 00005390 C8000000                 ENTER  0,0
 10798 00005394 A1[6400]                 mov ax, [segE]
 10799 00005397 8EC0                     mov  es, ax
 10800 00005399 8B7606                   mov  si, [bp+6]
 10801 0000539C 8B7E04                   mov  di, [bp+4]
 10802                                  
 10803                                  ;-991   asm cld
 10804                                  
 10805 0000539F FC                       cld
 10806                                  
 10807                                  ;-992   do{
 10808                                  
 10809                                  .to_far588:
 10810                                  
 10811                                  ;-993   asm lodsb  ; inc si
 10812                                  
 10813 000053A0 AC                       lodsb  ; inc si
 10814                                  
 10815                                  ;-994   asm stosb  ; inc di
 10816                                  
 10817 000053A1 AA                       stosb  ; inc di
 10818                                  
 10819                                  ;-995   } while (al != 0);
 10820                                  
 10821 000053A2 3C00                     cmp  al, 0
 10822 000053A4 0F840200                 je  .to_far589
 10823 000053A8 EBF6                     jmp .to_far588
 10824                                  .to_far589:
 10825                                  
 10826                                  ;-996 }
 10827                                  
 10828                                  
 10829                                  ;-997 int from_far(char *dest, char *src) {
 10830 000053AA C9                       LEAVE
 10831 000053AB C3                       ret
 10832                                  ; ENDP
 10833                                  
 10834                                  from_far:  ; *** PROC ***
 10835                                  
 10836                                  ;-998   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
 10837                                  
 10838                                  ;Function : from_far, Number of local variables: 2
 10839                                  ;   # type sign width addr used name   list of local variables
 10840                                  ;  200 ptr sign byte   997 NULL dest = bp+4
 10841                                  ;  201 ptr sign byte   997 NULL src = bp+6;
 10842 000053AC C8000000                 ENTER  0,0
 10843 000053B0 A1[6400]                 mov ax, [segE]
 10844 000053B3 8EC0                     mov  es, ax
 10845 000053B5 8B7606                   mov  si, [bp+6]
 10846 000053B8 8B7E04                   mov  di, [bp+4]
 10847                                  
 10848                                  ;-999   do{
 10849                                  
 10850                                  .from_far590:
 10851                                  
 10852                                  ;-1000   asm mov al, [es:si]
 10853                                  
 10854 000053BB 268A04                   mov al, [es:si]
 10855                                  
 10856                                  ;-1001   asm inc si
 10857                                  
 10858 000053BE 46                       inc si
 10859                                  
 10860                                  ;-1002   asm mov [di], al
 10861                                  
 10862 000053BF 8805                     mov [di], al
 10863                                  
 10864                                  ;-1003   asm inc di
 10865                                  
 10866 000053C1 47                       inc di
 10867                                  
 10868                                  ;-1004   } while (al != 0);
 10869                                  
 10870 000053C2 3C00                     cmp  al, 0
 10871 000053C4 0F840200                 je  .from_far591
 10872 000053C8 EBF1                     jmp .from_far590
 10873                                  .from_far591:
 10874                                  
 10875                                  ;-1005 }
 10876 000053CA C9                       LEAVE
 10877 000053CB C3                       ret
 10878                                  ; ENDP
 10879                                   
 10880                                  ; missing functions: 
 10881                                  ; Number of unresolved CALLs :    0 All FUNCTIONs in place
 10882 000053CC E80000                  LastFunctionByt:db 0E8h, 0, 0
 10883 000053CF 58                      pop ax
 10884 000053D0 C3                      ret
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
 10942                                  ;   55 arr sign byte    51   12 fname[67]
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
 10991                                  ;  104 arr sign byte   132    2 doglobName[15]
 10992                                  ;  105 var sign word   298    5 mod1
 10993                                  ;  106 var sign word   298   12 ireg1
 10994                                  ;  107 var sign word   298    6 idx1
 10995                                  ;  108 var sign word   298    1 ids1
 10996                                  ;  109 var sign word   298    4 idw1
 10997                                  ;  110 var sign word   298    2 idt1
 10998                                  ;  111 var sign word   298 NULL val1
 10999                                  ;  112 var sign word   299    2 mod2
 11000                                  ;  113 var sign word   299    6 ireg2
 11001                                  ;  114 var sign word   299    6 idx2
 11002                                  ;  115 var sign word   299    1 ids2
 11003                                  ;  116 var sign word   299    4 idw2
 11004                                  ;  117 var sign word   299    2 idt2
 11005                                  ;  118 var sign word   299    2 val2
 11006                                  ;  119 arr sign byte   364    9 ops[5]
 11007                                  ;  120 arr sign byte   406    3 printregstr[74]
 11008                                  ;  121 var sign word   414    1 evalue
 11009                                  ;  122 var sign word   414    1 exprtype
 11010                                  ;  123 arr sign word   566    2 docalltype[10]
 11011                                  ;  124 arr sign word   566    2 docallvalue[10]
 11012                                  ;  125 arr sign byte   567    2 procname[17]
 11013                                  ;  126 ptr sign byte   622    1 arglen
 11014                                  ;  127 ptr sign byte   622    2 argv
 11015                                  ;  128 arr sign byte   763    2 symboltemp[80]
 11016                                  ;  129 var unsg word   944    1 MAXUI
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
 11035                                  ;   14    2   98   instr1
 11036                                  ;   15    1   99   strcat1
 11037                                  ;   16    1  100   toupper
 11038                                  ;   17    1  101   pint
 11039                                  ;   18    3  103   digit
 11040                                  ;   19    1  108   letter
 11041                                  ;   20    3  118   alnum
 11042                                  ;   21    4  123   a
 11043                                  ;   22   21  124   v
 11044                                  ;   23    4  129   checknamelen
 11045                                  ;   24    1  133   doglob
 11046                                  ;   25   12  182   gettypes
 11047                                  ;   26    9  191   adrofname
 11048                                  ;   27    7  192   adrF
 11049                                  ;   28    4  194   printName
 11050                                  ;   29   12  198   searchname
 11051                                  ;   30    3  202   checkName
 11052                                  ;   31   10  207   typeName
 11053                                  ;   32    3  223   name1
 11054                                  ;   33    1  228   storecall
 11055                                  ;   34    2  234   storefunc
 11056                                  ;   35    2  238   addlocal
 11057                                  ;   36    1  244   checkFunction
 11058                                  ;   37    1  247   dofunc
 11059                                  ;   38    1  288   isvariable
 11060                                  ;   39    3  301   pexpr
 11061                                  ;   40    1  308   constantexpr
 11062                                  ;   41    3  318   exprstart
 11063                                  ;   42    1  320   expr2
 11064                                  ;   43    3  365   doreg1
 11065                                  ;   44    6  384   checkreg
 11066                                  ;   45    6  409   printreg
 11067                                  ;   46    2  415   expr
 11068                                  ;   47    4  464   compoundass
 11069                                  ;   48    2  471   dovar1
 11070                                  ;   49    8  492   rterm
 11071                                  ;   50    1  505   isreg
 11072                                  ;   51   15  523   doreg
 11073                                  ;   52    1  529   doassign
 11074                                  ;   53    1  547   domul
 11075                                  ;   54    2  551   doidiv
 11076                                  ;   55    1  564   domod
 11077                                  ;   56    1  568   docall1
 11078                                  ;   57 NULL  610   main
 11079                                  ;   58    2  621   getfirstchar
 11080                                  ;   59    1  623   getarg
 11081                                  ;   60    2  641   parse
 11082                                  ;   61    1  650   checkcalls
 11083                                  ;   62    1  667   doinclude
 11084                                  ;   63    1  678   dodefine
 11085                                  ;   64    6  694   stmt
 11086                                  ;   65    1  725   doemit
 11087                                  ;   66    3  729   cmpneg
 11088                                  ;   67    7  742   prlabel
 11089                                  ;   68    3  743   prjump
 11090                                  ;   69    1  744   doif
 11091                                  ;   70    1  750   dodo
 11092                                  ;   71    1  754   dowhile
 11093                                  ;   72    4  757   isrelational
 11094                                  ;   73   17  764   getlex
 11095                                  ;   74    1  816   convertdefine
 11096                                  ;   75    1  823   getdigit
 11097                                  ;   76    1  832   getstring
 11098                                  ;   77   31  835   next
 11099                                  ;   78   78  836   istoken
 11100                                  ;   79   36  837   expect
 11101                                  ;   80    6  840   eprc
 11102                                  ;   81    5  841   eprs
 11103                                  ;   82   42  842   prc
 11104                                  ;   83    3  847   prscomment
 11105                                  ;   84    8  849   prnl
 11106                                  ;   85  249  851   prs
 11107                                  ;   86    2  856   eprnum
 11108                                  ;   87   15  858   pint1
 11109                                  ;   88   27  860   prunsign1
 11110                                  ;   89   25  863   printint51
 11111                                  ;   90    2  867   fgets1
 11112                                  ;   91    1  871   printinputline
 11113                                  ;   92    2  879   end1
 11114                                  ;   93   50  880   error1
 11115                                  ;   94    2  889   listproc
 11116                                  ;   95    2  897   listvar
 11117                                  ;   96    1  913   listcall
 11118                                  ;   97    1  916   calllisting
 11119                                  ;   98    1  922   countcalls
 11120                                  ;   99    1  930   listfunc
 11121                                  ;  100    1  934   funclisting
 11122                                  ;  101    1  945   epilog
 11123                                  ;  102    1  977   setblock
 11124                                  ;  103    1  979   allocmem
 11125                                  ;  104 NULL  983   copyF
 11126                                  ;  105    1  989   to_far
 11127                                  ;  106    3  997   from_far
 11128                                  ;  107 NULL 1005   LastFunctionByt
 11129                                  
 11130                                  ;    #  addr name   list of CALLs
 11131                                  
 11132                                  ;    0     0 writetty
 11133                                  ;    1     9 writetty
 11134                                  ;    2    18 putch
 11135                                  ;    3    24 DosInt
 11136                                  ;    4    31 DosInt
 11137                                  ;    5    38 DosInt
 11138                                  ;    6    45 DosInt
 11139                                  ;    7    52 DosInt
 11140                                  ;    8    59 DosInt
 11141                                  ;    9    66 strcpy
 11142                                  ;   10    73 prc
 11143                                  ;   11    77 mkneg
 11144                                  ;   12    83 pint
 11145                                  ;   13    88 putch
 11146                                  ;   14    94 digit
 11147                                  ;   15   100 letter
 11148                                  ;   16   107 printName
 11149                                  ;   17   117 prc
 11150                                  ;   18   121 printName
 11151                                  ;   19   131 prc
 11152                                  ;   20   135 strlen
 11153                                  ;   21   142 error1
 11154                                  ;   22   149 error1
 11155                                  ;   23   156 error1
 11156                                  ;   24   163 checknamelen
 11157                                  ;   25   176 checkName
 11158                                  ;   26   186 error1
 11159                                  ;   27   193 istoken
 11160                                  ;   28   201 istoken
 11161                                  ;   29   209 prs
 11162                                  ;   30   213 prunsign1
 11163                                  ;   31   223 prs
 11164                                  ;   32   227 prs
 11165                                  ;   33   231 prs
 11166                                  ;   34   235 prs
 11167                                  ;   35   239 prs
 11168                                  ;   36   243 prunsign1
 11169                                  ;   37   253 prs
 11170                                  ;   38   257 expect
 11171                                  ;   39   264 expect
 11172                                  ;   40   271 error1
 11173                                  ;   41   278 prs
 11174                                  ;   42   282 prs
 11175                                  ;   43   286 prs
 11176                                  ;   44   290 strcpy
 11177                                  ;   45   297 expect
 11178                                  ;   46   304 istoken
 11179                                  ;   47   312 prc
 11180                                  ;   48   316 prscomment
 11181                                  ;   49   327 prc
 11182                                  ;   50   331 prs
 11183                                  ;   51   335 strlen
 11184                                  ;   52   342 istoken
 11185                                  ;   53   350 prc
 11186                                  ;   54   354 expect
 11187                                  ;   55   361 prunsign1
 11188                                  ;   56   371 istoken
 11189                                  ;   57   379 expect
 11190                                  ;   58   386 error1
 11191                                  ;   59   393 prs
 11192                                  ;   60   397 prs
 11193                                  ;   61   401 prs
 11194                                  ;   62   405 prs
 11195                                  ;   63   409 prs
 11196                                  ;   64   413 prs
 11197                                  ;   65   417 istoken
 11198                                  ;   66   425 prc
 11199                                  ;   67   429 istoken
 11200                                  ;   68   437 expect
 11201                                  ;   69   444 prunsign1
 11202                                  ;   70   454 prunsign1
 11203                                  ;   71   464 adrofname
 11204                                  ;   72   474 strcpy
 11205                                  ;   73   481 strcpy
 11206                                  ;   74   488 expect
 11207                                  ;   75   495 adrF
 11208                                  ;   76   500 adrofname
 11209                                  ;   77   510 prs
 11210                                  ;   78   514 prs
 11211                                  ;   79   518 prc
 11212                                  ;   80   522 pint1
 11213                                  ;   81   528 prc
 11214                                  ;   82   532 checkName
 11215                                  ;   83   542 error1
 11216                                  ;   84   549 adrofname
 11217                                  ;   85   559 eqstr
 11218                                  ;   86   565 adrofname
 11219                                  ;   87   575 eqstr
 11220                                  ;   88   581 istoken
 11221                                  ;   89   589 istoken
 11222                                  ;   90   597 istoken
 11223                                  ;   91   605 istoken
 11224                                  ;   92   613 istoken
 11225                                  ;   93   621 istoken
 11226                                  ;   94   629 istoken
 11227                                  ;   95   637 istoken
 11228                                  ;   96   645 name1
 11229                                  ;   97   651 error1
 11230                                  ;   98   658 getlex
 11231                                  ;   99   665 error1
 11232                                  ;  100   672 error1
 11233                                  ;  101   679 strlen
 11234                                  ;  102   686 to_far
 11235                                  ;  103   693 error1
 11236                                  ;  104   700 adrF
 11237                                  ;  105   705 strcpy
 11238                                  ;  106   712 error1
 11239                                  ;  107   719 checkName
 11240                                  ;  108   729 error1
 11241                                  ;  109   736 adrF
 11242                                  ;  110   741 strcpy
 11243                                  ;  111   748 adrF
 11244                                  ;  112   753 eqstr
 11245                                  ;  113   759 checknamelen
 11246                                  ;  114   772 strcpy
 11247                                  ;  115   779 checkFunction
 11248                                  ;  116   793 error1
 11249                                  ;  117   800 storefunc
 11250                                  ;  118   810 prs
 11251                                  ;  119   814 prs
 11252                                  ;  120   818 prs
 11253                                  ;  121   822 expect
 11254                                  ;  122   829 istoken
 11255                                  ;  123   837 typeName
 11256                                  ;  124   846 addlocal
 11257                                  ;  125   855 istoken
 11258                                  ;  126   863 expect
 11259                                  ;  127   870 expect
 11260                                  ;  128   877 isvariable
 11261                                  ;  129   888 typeName
 11262                                  ;  130   897 checknamelen
 11263                                  ;  131   910 addlocal
 11264                                  ;  132   919 istoken
 11265                                  ;  133   927 expect
 11266                                  ;  134   934 expect
 11267                                  ;  135   941 istoken
 11268                                  ;  136   949 expect
 11269                                  ;  137   956 listproc
 11270                                  ;  138   965 prs
 11271                                  ;  139   969 mkneg
 11272                                  ;  140   975 pint1
 11273                                  ;  141   981 prs
 11274                                  ;  142   985 istoken
 11275                                  ;  143   993 stmt
 11276                                  ;  144   998 prs
 11277                                  ;  145  1002 prs
 11278                                  ;  146  1006 prc
 11279                                  ;  147  1010 prs
 11280                                  ;  148  1014 prs
 11281                                  ;  149  1018 prs
 11282                                  ;  150  1022 strlen
 11283                                  ;  151  1029 strcpy
 11284                                  ;  152  1036 prs
 11285                                  ;  153  1040 expect
 11286                                  ;  154  1047 eqstr
 11287                                  ;  155  1053 constantexpr
 11288                                  ;  156  1066 checkreg
 11289                                  ;  157  1075 doreg1
 11290                                  ;  158  1082 exprstart
 11291                                  ;  159  1092 prs
 11292                                  ;  160  1096 prs
 11293                                  ;  161  1100 expect
 11294                                  ;  162  1107 getlex
 11295                                  ;  163  1114 typeName
 11296                                  ;  164  1123 searchname
 11297                                  ;  165  1134 gettypes
 11298                                  ;  166  1143 isrelational
 11299                                  ;  167  1156 error1
 11300                                  ;  168  1163 expect
 11301                                  ;  169  1170 prs
 11302                                  ;  170  1174 prs
 11303                                  ;  171  1178 gettypes
 11304                                  ;  172  1187 prs
 11305                                  ;  173  1191 prs
 11306                                  ;  174  1195 v
 11307                                  ;  175  1197 prs
 11308                                  ;  176  1201 prunsign1
 11309                                  ;  177  1211 cmpneg
 11310                                  ;  178  1218 prs
 11311                                  ;  179  1222 expect
 11312                                  ;  180  1229 eqstr
 11313                                  ;  181  1235 expr2
 11314                                  ;  182  1241 expr
 11315                                  ;  183  1246 getlex
 11316                                  ;  184  1253 typeName
 11317                                  ;  185  1262 error1
 11318                                  ;  186  1269 checkreg
 11319                                  ;  187  1278 doreg1
 11320                                  ;  188  1285 searchname
 11321                                  ;  189  1296 gettypes
 11322                                  ;  190  1305 error1
 11323                                  ;  191  1312 isrelational
 11324                                  ;  192  1325 error1
 11325                                  ;  193  1332 istoken
 11326                                  ;  194  1340 error1
 11327                                  ;  195  1347 istoken
 11328                                  ;  196  1355 prs
 11329                                  ;  197  1359 prs
 11330                                  ;  198  1363 prs
 11331                                  ;  199  1367 prs
 11332                                  ;  200  1371 prs
 11333                                  ;  201  1375 v
 11334                                  ;  202  1377 prs
 11335                                  ;  203  1381 prunsign1
 11336                                  ;  204  1391 adrofname
 11337                                  ;  205  1401 prs
 11338                                  ;  206  1405 prs
 11339                                  ;  207  1409 typeName
 11340                                  ;  208  1418 checkreg
 11341                                  ;  209  1427 prs
 11342                                  ;  210  1431 printreg
 11343                                  ;  211  1440 v
 11344                                  ;  212  1442 prs
 11345                                  ;  213  1446 printreg
 11346                                  ;  214  1455 error1
 11347                                  ;  215  1462 searchname
 11348                                  ;  216  1473 gettypes
 11349                                  ;  217  1482 error1
 11350                                  ;  218  1489 prs
 11351                                  ;  219  1493 printreg
 11352                                  ;  220  1502 error1
 11353                                  ;  221  1509 prs
 11354                                  ;  222  1513 a
 11355                                  ;  223  1515 prs
 11356                                  ;  224  1519 prs
 11357                                  ;  225  1523 prs
 11358                                  ;  226  1527 v
 11359                                  ;  227  1529 adrofname
 11360                                  ;  228  1539 prs
 11361                                  ;  229  1543 prs
 11362                                  ;  230  1547 error1
 11363                                  ;  231  1554 istoken
 11364                                  ;  232  1562 strcpy
 11365                                  ;  233  1569 istoken
 11366                                  ;  234  1577 strcpy
 11367                                  ;  235  1584 istoken
 11368                                  ;  236  1592 strcpy
 11369                                  ;  237  1599 istoken
 11370                                  ;  238  1607 strcpy
 11371                                  ;  239  1614 istoken
 11372                                  ;  240  1622 strcpy
 11373                                  ;  241  1629 istoken
 11374                                  ;  242  1637 strcpy
 11375                                  ;  243  1644 istoken
 11376                                  ;  244  1652 strcpy
 11377                                  ;  245  1659 getlex
 11378                                  ;  246  1666 isrelational
 11379                                  ;  247  1679 error1
 11380                                  ;  248  1686 strcpy
 11381                                  ;  249  1693 prnl
 11382                                  ;  250  1698 prs
 11383                                  ;  251  1702 prs
 11384                                  ;  252  1706 printreg
 11385                                  ;  253  1715 prs
 11386                                  ;  254  1719 istoken
 11387                                  ;  255  1727 prunsign1
 11388                                  ;  256  1737 typeName
 11389                                  ;  257  1746 checkreg
 11390                                  ;  258  1755 printreg
 11391                                  ;  259  1764 searchname
 11392                                  ;  260  1775 a
 11393                                  ;  261  1777 v
 11394                                  ;  262  1779 cmpneg
 11395                                  ;  263  1786 prs
 11396                                  ;  264  1790 expect
 11397                                  ;  265  1797 strlen
 11398                                  ;  266  1804 eqstr
 11399                                  ;  267  1810 eqstr
 11400                                  ;  268  1816 eqstr
 11401                                  ;  269  1822 eqstr
 11402                                  ;  270  1828 eqstr
 11403                                  ;  271  1834 eqstr
 11404                                  ;  272  1840 eqstr
 11405                                  ;  273  1846 eqstr
 11406                                  ;  274  1852 eqstr
 11407                                  ;  275  1858 eqstr
 11408                                  ;  276  1864 eqstr
 11409                                  ;  277  1870 eqstr
 11410                                  ;  278  1876 eqstr
 11411                                  ;  279  1882 eqstr
 11412                                  ;  280  1888 eqstr
 11413                                  ;  281  1894 eqstr
 11414                                  ;  282  1900 eqstr
 11415                                  ;  283  1906 eqstr
 11416                                  ;  284  1912 eqstr
 11417                                  ;  285  1918 eqstr
 11418                                  ;  286  1924 eqstr
 11419                                  ;  287  1930 eqstr
 11420                                  ;  288  1936 strlen
 11421                                  ;  289  1943 eqstr
 11422                                  ;  290  1949 eqstr
 11423                                  ;  291  1955 eqstr
 11424                                  ;  292  1961 eqstr
 11425                                  ;  293  1967 eqstr
 11426                                  ;  294  1973 eqstr
 11427                                  ;  295  1979 eqstr
 11428                                  ;  296  1985 eqstr
 11429                                  ;  297  1991 eqstr
 11430                                  ;  298  1997 prc
 11431                                  ;  299  2001 prc
 11432                                  ;  300  2005 prc
 11433                                  ;  301  2009 istoken
 11434                                  ;  302  2017 prs
 11435                                  ;  303  2021 prunsign1
 11436                                  ;  304  2031 typeName
 11437                                  ;  305  2040 checkreg
 11438                                  ;  306  2049 doreg1
 11439                                  ;  307  2056 docall1
 11440                                  ;  308  2064 isreg
 11441                                  ;  309  2070 searchname
 11442                                  ;  310  2081 gettypes
 11443                                  ;  311  2090 istoken
 11444                                  ;  312  2098 istoken
 11445                                  ;  313  2106 expect
 11446                                  ;  314  2113 searchname
 11447                                  ;  315  2124 expect
 11448                                  ;  316  2131 expect
 11449                                  ;  317  2138 gettypes
 11450                                  ;  318  2147 error1
 11451                                  ;  319  2154 istoken
 11452                                  ;  320  2162 error1
 11453                                  ;  321  2169 prs
 11454                                  ;  322  2173 prs
 11455                                  ;  323  2177 prs
 11456                                  ;  324  2181 v
 11457                                  ;  325  2183 istoken
 11458                                  ;  326  2191 error1
 11459                                  ;  327  2198 prs
 11460                                  ;  328  2202 prs
 11461                                  ;  329  2206 prs
 11462                                  ;  330  2210 v
 11463                                  ;  331  2212 istoken
 11464                                  ;  332  2220 compoundass
 11465                                  ;  333  2232 istoken
 11466                                  ;  334  2240 compoundass
 11467                                  ;  335  2252 istoken
 11468                                  ;  336  2260 compoundass
 11469                                  ;  337  2272 istoken
 11470                                  ;  338  2280 compoundass
 11471                                  ;  339  2292 istoken
 11472                                  ;  340  2300 error1
 11473                                  ;  341  2307 istoken
 11474                                  ;  342  2315 error1
 11475                                  ;  343  2322 istoken
 11476                                  ;  344  2330 expr
 11477                                  ;  345  2335 doassign
 11478                                  ;  346  2344 dovar1
 11479                                  ;  347  2351 istoken
 11480                                  ;  348  2359 rterm
 11481                                  ;  349  2365 istoken
 11482                                  ;  350  2373 rterm
 11483                                  ;  351  2379 istoken
 11484                                  ;  352  2387 rterm
 11485                                  ;  353  2393 istoken
 11486                                  ;  354  2401 rterm
 11487                                  ;  355  2407 istoken
 11488                                  ;  356  2415 rterm
 11489                                  ;  357  2421 istoken
 11490                                  ;  358  2429 rterm
 11491                                  ;  359  2435 istoken
 11492                                  ;  360  2443 domul
 11493                                  ;  361  2449 istoken
 11494                                  ;  362  2457 doidiv
 11495                                  ;  363  2464 istoken
 11496                                  ;  364  2472 domod
 11497                                  ;  365  2478 isrelational
 11498                                  ;  366  2491 rterm
 11499                                  ;  367  2497 cmpneg
 11500                                  ;  368  2504 error1
 11501                                  ;  369  2511 prnl
 11502                                  ;  370  2516 prs
 11503                                  ;  371  2520 prs
 11504                                  ;  372  2524 gettypes
 11505                                  ;  373  2533 prs
 11506                                  ;  374  2537 prs
 11507                                  ;  375  2541 v
 11508                                  ;  376  2543 prs
 11509                                  ;  377  2547 expect
 11510                                  ;  378  2554 prunsign1
 11511                                  ;  379  2564 gettypes
 11512                                  ;  380  2573 prs
 11513                                  ;  381  2577 v
 11514                                  ;  382  2579 prnl
 11515                                  ;  383  2584 prs
 11516                                  ;  384  2588 prs
 11517                                  ;  385  2592 prs
 11518                                  ;  386  2596 prnl
 11519                                  ;  387  2601 prs
 11520                                  ;  388  2605 prs
 11521                                  ;  389  2609 a
 11522                                  ;  390  2611 prs
 11523                                  ;  391  2615 v
 11524                                  ;  392  2617 prs
 11525                                  ;  393  2621 prs
 11526                                  ;  394  2625 prs
 11527                                  ;  395  2629 prs
 11528                                  ;  396  2633 prs
 11529                                  ;  397  2637 prc
 11530                                  ;  398  2641 printName
 11531                                  ;  399  2651 prs
 11532                                  ;  400  2655 prnl
 11533                                  ;  401  2660 prs
 11534                                  ;  402  2664 prs
 11535                                  ;  403  2668 prs
 11536                                  ;  404  2672 prs
 11537                                  ;  405  2676 v
 11538                                  ;  406  2678 istoken
 11539                                  ;  407  2686 prnl
 11540                                  ;  408  2691 prs
 11541                                  ;  409  2695 prs
 11542                                  ;  410  2699 prs
 11543                                  ;  411  2703 prs
 11544                                  ;  412  2707 prunsign1
 11545                                  ;  413  2717 typeName
 11546                                  ;  414  2726 searchname
 11547                                  ;  415  2737 istoken
 11548                                  ;  416  2745 searchname
 11549                                  ;  417  2756 expect
 11550                                  ;  418  2763 expect
 11551                                  ;  419  2770 gettypes
 11552                                  ;  420  2779 error1
 11553                                  ;  421  2786 eqstr
 11554                                  ;  422  2792 dovar1
 11555                                  ;  423  2799 eqstr
 11556                                  ;  424  2805 doreg
 11557                                  ;  425  2811 eqstr
 11558                                  ;  426  2817 doreg
 11559                                  ;  427  2823 eqstr
 11560                                  ;  428  2829 doreg
 11561                                  ;  429  2835 eqstr
 11562                                  ;  430  2841 doreg
 11563                                  ;  431  2847 eqstr
 11564                                  ;  432  2853 doreg
 11565                                  ;  433  2859 eqstr
 11566                                  ;  434  2865 doreg
 11567                                  ;  435  2871 eqstr
 11568                                  ;  436  2877 doreg
 11569                                  ;  437  2883 eqstr
 11570                                  ;  438  2889 doreg
 11571                                  ;  439  2895 eqstr
 11572                                  ;  440  2901 doreg
 11573                                  ;  441  2907 eqstr
 11574                                  ;  442  2913 doreg
 11575                                  ;  443  2919 eqstr
 11576                                  ;  444  2925 doreg
 11577                                  ;  445  2931 eqstr
 11578                                  ;  446  2937 doreg
 11579                                  ;  447  2943 eqstr
 11580                                  ;  448  2949 doreg
 11581                                  ;  449  2955 eqstr
 11582                                  ;  450  2961 doreg
 11583                                  ;  451  2967 eqstr
 11584                                  ;  452  2973 doreg
 11585                                  ;  453  2979 expect
 11586                                  ;  454  2986 prs
 11587                                  ;  455  2990 prs
 11588                                  ;  456  2994 prs
 11589                                  ;  457  2998 istoken
 11590                                  ;  458  3006 prunsign1
 11591                                  ;  459  3016 istoken
 11592                                  ;  460  3024 searchname
 11593                                  ;  461  3035 v
 11594                                  ;  462  3037 error1
 11595                                  ;  463  3044 gettypes
 11596                                  ;  464  3053 prs
 11597                                  ;  465  3057 v
 11598                                  ;  466  3059 prs
 11599                                  ;  467  3063 prs
 11600                                  ;  468  3067 prs
 11601                                  ;  469  3071 a
 11602                                  ;  470  3073 prs
 11603                                  ;  471  3077 prs
 11604                                  ;  472  3081 prunsign1
 11605                                  ;  473  3091 v
 11606                                  ;  474  3093 prs
 11607                                  ;  475  3097 prs
 11608                                  ;  476  3101 printName
 11609                                  ;  477  3111 prs
 11610                                  ;  478  3115 prs
 11611                                  ;  479  3119 prs
 11612                                  ;  480  3123 prs
 11613                                  ;  481  3127 v
 11614                                  ;  482  3129 prs
 11615                                  ;  483  3133 prs
 11616                                  ;  484  3137 prs
 11617                                  ;  485  3141 v
 11618                                  ;  486  3143 prs
 11619                                  ;  487  3147 prs
 11620                                  ;  488  3151 prs
 11621                                  ;  489  3155 v
 11622                                  ;  490  3157 prs
 11623                                  ;  491  3161 rterm
 11624                                  ;  492  3167 istoken
 11625                                  ;  493  3175 prs
 11626                                  ;  494  3179 prunsign1
 11627                                  ;  495  3189 prs
 11628                                  ;  496  3193 error1
 11629                                  ;  497  3200 istoken
 11630                                  ;  498  3208 prs
 11631                                  ;  499  3212 prunsign1
 11632                                  ;  500  3222 prs
 11633                                  ;  501  3226 prs
 11634                                  ;  502  3230 typeName
 11635                                  ;  503  3239 searchname
 11636                                  ;  504  3250 error1
 11637                                  ;  505  3257 gettypes
 11638                                  ;  506  3266 error1
 11639                                  ;  507  3273 error1
 11640                                  ;  508  3280 prs
 11641                                  ;  509  3284 v
 11642                                  ;  510  3286 prs
 11643                                  ;  511  3290 prs
 11644                                  ;  512  3294 doidiv
 11645                                  ;  513  3301 prs
 11646                                  ;  514  3305 checknamelen
 11647                                  ;  515  3318 strcpy
 11648                                  ;  516  3325 storecall
 11649                                  ;  517  3335 expect
 11650                                  ;  518  3342 istoken
 11651                                  ;  519  3350 error1
 11652                                  ;  520  3357 istoken
 11653                                  ;  521  3365 istoken
 11654                                  ;  522  3373 eprs
 11655                                  ;  523  3378 eprs
 11656                                  ;  524  3383 eprc
 11657                                  ;  525  3388 eprnum
 11658                                  ;  526  3395 eprs
 11659                                  ;  527  3400 eprc
 11660                                  ;  528  3405 eprs
 11661                                  ;  529  3410 eprc
 11662                                  ;  530  3415 eprs
 11663                                  ;  531  3420 istoken
 11664                                  ;  532  3428 name1
 11665                                  ;  533  3434 searchname
 11666                                  ;  534  3445 istoken
 11667                                  ;  535  3453 checkreg
 11668                                  ;  536  3462 searchname
 11669                                  ;  537  3473 error1
 11670                                  ;  538  3480 istoken
 11671                                  ;  539  3488 expect
 11672                                  ;  540  3495 prs
 11673                                  ;  541  3499 pint1
 11674                                  ;  542  3505 prs
 11675                                  ;  543  3509 prs
 11676                                  ;  544  3513 prc
 11677                                  ;  545  3517 pint1
 11678                                  ;  546  3523 prs
 11679                                  ;  547  3527 v
 11680                                  ;  548  3529 prs
 11681                                  ;  549  3533 gettypes
 11682                                  ;  550  3542 prs
 11683                                  ;  551  3546 v
 11684                                  ;  552  3548 prs
 11685                                  ;  553  3552 v
 11686                                  ;  554  3554 prs
 11687                                  ;  555  3558 prs
 11688                                  ;  556  3562 printreg
 11689                                  ;  557  3571 prs
 11690                                  ;  558  3575 prs
 11691                                  ;  559  3579 prs
 11692                                  ;  560  3583 pint1
 11693                                  ;  561  3589 getarg
 11694                                  ;  562  3596 setblock
 11695                                  ;  563  3605 error1
 11696                                  ;  564  3612 allocmem
 11697                                  ;  565  3621 error1
 11698                                  ;  566  3628 getfirstchar
 11699                                  ;  567  3641 parse
 11700                                  ;  568  3647 checkcalls
 11701                                  ;  569  3658 epilog
 11702                                  ;  570  3665 fgets1
 11703                                  ;  571  3672 cputs
 11704                                  ;  572  3678 cputs
 11705                                  ;  573  3684 readRL
 11706                                  ;  574  3691 prnl
 11707                                  ;  575  3696 strcpy
 11708                                  ;  576  3703 instr1
 11709                                  ;  577  3710 strcat1
 11710                                  ;  578  3718 toupper
 11711                                  ;  579  3726 strcpy
 11712                                  ;  580  3733 strlen
 11713                                  ;  581  3740 openR
 11714                                  ;  582  3746 cputs
 11715                                  ;  583  3752 cputs
 11716                                  ;  584  3758 exitR
 11717                                  ;  585  3764 creatR
 11718                                  ;  586  3771 cputs
 11719                                  ;  587  3777 cputs
 11720                                  ;  588  3783 exitR
 11721                                  ;  589  3789 prs
 11722                                  ;  590  3793 prs
 11723                                  ;  591  3797 prs
 11724                                  ;  592  3801 prs
 11725                                  ;  593  3805 prs
 11726                                  ;  594  3809 prs
 11727                                  ;  595  3813 prs
 11728                                  ;  596  3817 getlex
 11729                                  ;  597  3824 istoken
 11730                                  ;  598  3832 istoken
 11731                                  ;  599  3840 dodefine
 11732                                  ;  600  3849 istoken
 11733                                  ;  601  3857 doinclude
 11734                                  ;  602  3867 error1
 11735                                  ;  603  3874 typeName
 11736                                  ;  604  3883 dofunc
 11737                                  ;  605  3890 doglob
 11738                                  ;  606  3897 prs
 11739                                  ;  607  3901 from_far
 11740                                  ;  608  3910 adrF
 11741                                  ;  609  3915 eqstr
 11742                                  ;  610  3921 prs
 11743                                  ;  611  3925 prs
 11744                                  ;  612  3929 prs
 11745                                  ;  613  3933 printint51
 11746                                  ;  614  3944 error1
 11747                                  ;  615  3951 prs
 11748                                  ;  616  3955 prs
 11749                                  ;  617  3959 prs
 11750                                  ;  618  3963 openR
 11751                                  ;  619  3969 prs
 11752                                  ;  620  3973 prs
 11753                                  ;  621  3977 error1
 11754                                  ;  622  3984 parse
 11755                                  ;  623  3990 prs
 11756                                  ;  624  3994 prs
 11757                                  ;  625  3998 getfirstchar
 11758                                  ;  626  4011 getlex
 11759                                  ;  627  4018 eqstr
 11760                                  ;  628  4024 getlex
 11761                                  ;  629  4031 eqstr
 11762                                  ;  630  4037 getlex
 11763                                  ;  631  4044 prs
 11764                                  ;  632  4048 strcpy
 11765                                  ;  633  4055 prs
 11766                                  ;  634  4059 error1
 11767                                  ;  635  4066 getlex
 11768                                  ;  636  4073 expect
 11769                                  ;  637  4080 error1
 11770                                  ;  638  4087 strlen
 11771                                  ;  639  4094 error1
 11772                                  ;  640  4101 adrofname
 11773                                  ;  641  4111 strcpy
 11774                                  ;  642  4118 expect
 11775                                  ;  643  4125 istoken
 11776                                  ;  644  4133 istoken
 11777                                  ;  645  4141 stmt
 11778                                  ;  646  4146 istoken
 11779                                  ;  647  4154 doif
 11780                                  ;  648  4159 istoken
 11781                                  ;  649  4167 dodo
 11782                                  ;  650  4172 istoken
 11783                                  ;  651  4180 dowhile
 11784                                  ;  652  4188 istoken
 11785                                  ;  653  4196 prs
 11786                                  ;  654  4200 name1
 11787                                  ;  655  4206 prs
 11788                                  ;  656  4210 expect
 11789                                  ;  657  4217 prs
 11790                                  ;  658  4221 next
 11791                                  ;  659  4226 prc
 11792                                  ;  660  4230 next
 11793                                  ;  661  4235 getlex
 11794                                  ;  662  4242 istoken
 11795                                  ;  663  4250 prs
 11796                                  ;  664  4254 next
 11797                                  ;  665  4259 prc
 11798                                  ;  666  4263 next
 11799                                  ;  667  4268 getlex
 11800                                  ;  668  4275 error1
 11801                                  ;  669  4282 istoken
 11802                                  ;  670  4290 doemit
 11803                                  ;  671  4297 istoken
 11804                                  ;  672  4305 istoken
 11805                                  ;  673  4313 exprstart
 11806                                  ;  674  4323 prs
 11807                                  ;  675  4327 prs
 11808                                  ;  676  4331 expect
 11809                                  ;  677  4338 prs
 11810                                  ;  678  4342 prs
 11811                                  ;  679  4346 prc
 11812                                  ;  680  4350 expect
 11813                                  ;  681  4357 expect
 11814                                  ;  682  4364 exprstart
 11815                                  ;  683  4374 expect
 11816                                  ;  684  4381 prs
 11817                                  ;  685  4385 getlex
 11818                                  ;  686  4392 prunsign1
 11819                                  ;  687  4402 getlex
 11820                                  ;  688  4409 prc
 11821                                  ;  689  4413 expect
 11822                                  ;  690  4420 prs
 11823                                  ;  691  4424 prs
 11824                                  ;  692  4428 prs
 11825                                  ;  693  4432 prs
 11826                                  ;  694  4436 prs
 11827                                  ;  695  4440 prunsign1
 11828                                  ;  696  4450 prs
 11829                                  ;  697  4454 prs
 11830                                  ;  698  4458 prunsign1
 11831                                  ;  699  4468 prs
 11832                                  ;  700  4472 prs
 11833                                  ;  701  4476 prs
 11834                                  ;  702  4480 error1
 11835                                  ;  703  4487 prs
 11836                                  ;  704  4491 prs
 11837                                  ;  705  4495 pint1
 11838                                  ;  706  4501 prc
 11839                                  ;  707  4505 prs
 11840                                  ;  708  4509 prs
 11841                                  ;  709  4513 pint1
 11842                                  ;  710  4519 pexpr
 11843                                  ;  711  4525 pint1
 11844                                  ;  712  4531 stmt
 11845                                  ;  713  4536 istoken
 11846                                  ;  714  4544 prjump
 11847                                  ;  715  4551 prlabel
 11848                                  ;  716  4559 stmt
 11849                                  ;  717  4564 prlabel
 11850                                  ;  718  4572 prlabel
 11851                                  ;  719  4580 prlabel
 11852                                  ;  720  4588 stmt
 11853                                  ;  721  4593 expect
 11854                                  ;  722  4600 pexpr
 11855                                  ;  723  4606 pint1
 11856                                  ;  724  4612 prjump
 11857                                  ;  725  4619 prlabel
 11858                                  ;  726  4627 prlabel
 11859                                  ;  727  4635 pexpr
 11860                                  ;  728  4641 pint1
 11861                                  ;  729  4647 stmt
 11862                                  ;  730  4652 prjump
 11863                                  ;  731  4659 prlabel
 11864                                  ;  732  4667 getlex
 11865                                  ;  733  4674 next
 11866                                  ;  734  4679 next
 11867                                  ;  735  4684 next
 11868                                  ;  736  4689 next
 11869                                  ;  737  4694 next
 11870                                  ;  738  4699 next
 11871                                  ;  739  4704 next
 11872                                  ;  740  4709 next
 11873                                  ;  741  4714 next
 11874                                  ;  742  4719 next
 11875                                  ;  743  4724 next
 11876                                  ;  744  4729 next
 11877                                  ;  745  4734 next
 11878                                  ;  746  4739 next
 11879                                  ;  747  4744 next
 11880                                  ;  748  4749 instr1
 11881                                  ;  749  4756 next
 11882                                  ;  750  4761 getlex
 11883                                  ;  751  4768 next
 11884                                  ;  752  4773 next
 11885                                  ;  753  4778 getlex
 11886                                  ;  754  4785 getstring
 11887                                  ;  755  4795 digit
 11888                                  ;  756  4801 getdigit
 11889                                  ;  757  4810 next
 11890                                  ;  758  4815 next
 11891                                  ;  759  4820 next
 11892                                  ;  760  4825 alnum
 11893                                  ;  761  4831 strcpy
 11894                                  ;  762  4838 alnum
 11895                                  ;  763  4844 next
 11896                                  ;  764  4849 eqstr
 11897                                  ;  765  4855 eqstr
 11898                                  ;  766  4861 eqstr
 11899                                  ;  767  4867 eqstr
 11900                                  ;  768  4873 eqstr
 11901                                  ;  769  4879 eqstr
 11902                                  ;  770  4885 eqstr
 11903                                  ;  771  4891 eqstr
 11904                                  ;  772  4897 eqstr
 11905                                  ;  773  4903 eqstr
 11906                                  ;  774  4909 eqstr
 11907                                  ;  775  4915 eqstr
 11908                                  ;  776  4921 eqstr
 11909                                  ;  777  4927 eqstr
 11910                                  ;  778  4933 eqstr
 11911                                  ;  779  4939 eqstr
 11912                                  ;  780  4945 eqstr
 11913                                  ;  781  4951 convertdefine
 11914                                  ;  782  4965 strcpy
 11915                                  ;  783  4972 error1
 11916                                  ;  784  4979 adrofname
 11917                                  ;  785  4989 eqstr
 11918                                  ;  786  4995 next
 11919                                  ;  787  5000 alnum
 11920                                  ;  788  5006 next
 11921                                  ;  789  5011 digit
 11922                                  ;  790  5017 next
 11923                                  ;  791  5022 next
 11924                                  ;  792  5027 next
 11925                                  ;  793  5032 fgets1
 11926                                  ;  794  5039 getlex
 11927                                  ;  795  5046 istoken
 11928                                  ;  796  5054 prs
 11929                                  ;  797  5058 listproc
 11930                                  ;  798  5067 prs
 11931                                  ;  799  5071 pint1
 11932                                  ;  800  5077 error1
 11933                                  ;  801  5084 eprc
 11934                                  ;  802  5089 writetty
 11935                                  ;  803  5098 writetty
 11936                                  ;  804  5107 fputcR
 11937                                  ;  805  5114 prc
 11938                                  ;  806  5118 prs
 11939                                  ;  807  5122 prc
 11940                                  ;  808  5126 eprc
 11941                                  ;  809  5131 mkneg
 11942                                  ;  810  5137 eprnum
 11943                                  ;  811  5144 eprc
 11944                                  ;  812  5149 prc
 11945                                  ;  813  5153 mkneg
 11946                                  ;  814  5159 pint1
 11947                                  ;  815  5165 prc
 11948                                  ;  816  5169 prunsign1
 11949                                  ;  817  5179 prc
 11950                                  ;  818  5183 prc
 11951                                  ;  819  5187 prc
 11952                                  ;  820  5191 prc
 11953                                  ;  821  5195 prc
 11954                                  ;  822  5199 prunsign1
 11955                                  ;  823  5209 printinputline
 11956                                  ;  824  5224 readRL
 11957                                  ;  825  5231 prs
 11958                                  ;  826  5235 prunsign1
 11959                                  ;  827  5245 prc
 11960                                  ;  828  5249 prscomment
 11961                                  ;  829  5260 fcloseR
 11962                                  ;  830  5268 fcloseR
 11963                                  ;  831  5276 exitR
 11964                                  ;  832  5282 prnl
 11965                                  ;  833  5287 prscomment
 11966                                  ;  834  5298 prs
 11967                                  ;  835  5302 prunsign1
 11968                                  ;  836  5312 prs
 11969                                  ;  837  5316 prs
 11970                                  ;  838  5320 prs
 11971                                  ;  839  5324 pint1
 11972                                  ;  840  5330 prs
 11973                                  ;  841  5334 prunsign1
 11974                                  ;  842  5344 prs
 11975                                  ;  843  5348 prc
 11976                                  ;  844  5352 prs
 11977                                  ;  845  5356 pint1
 11978                                  ;  846  5362 prs
 11979                                  ;  847  5366 prs
 11980                                  ;  848  5370 end1
 11981                                  ;  849  5375 prs
 11982                                  ;  850  5379 prs
 11983                                  ;  851  5383 prs
 11984                                  ;  852  5387 prunsign1
 11985                                  ;  853  5397 prs
 11986                                  ;  854  5401 listvar
 11987                                  ;  855  5409 prs
 11988                                  ;  856  5413 printint51
 11989                                  ;  857  5424 prc
 11990                                  ;  858  5428 prs
 11991                                  ;  859  5432 prs
 11992                                  ;  860  5436 prs
 11993                                  ;  861  5440 prs
 11994                                  ;  862  5444 prs
 11995                                  ;  863  5448 prs
 11996                                  ;  864  5452 prs
 11997                                  ;  865  5456 prs
 11998                                  ;  866  5460 prs
 11999                                  ;  867  5464 printint51
 12000                                  ;  868  5475 printint51
 12001                                  ;  869  5486 prs
 12002                                  ;  870  5490 prs
 12003                                  ;  871  5494 prc
 12004                                  ;  872  5498 adrofname
 12005                                  ;  873  5508 prs
 12006                                  ;  874  5512 prc
 12007                                  ;  875  5516 prunsign1
 12008                                  ;  876  5526 prc
 12009                                  ;  877  5530 prunsign1
 12010                                  ;  878  5540 prc
 12011                                  ;  879  5544 prs
 12012                                  ;  880  5548 prc
 12013                                  ;  881  5552 pint1
 12014                                  ;  882  5558 prs
 12015                                  ;  883  5562 calllisting
 12016                                  ;  884  5574 prs
 12017                                  ;  885  5578 printint51
 12018                                  ;  886  5589 prc
 12019                                  ;  887  5593 prs
 12020                                  ;  888  5597 printint51
 12021                                  ;  889  5608 prc
 12022                                  ;  890  5612 from_far
 12023                                  ;  891  5621 prs
 12024                                  ;  892  5625 adrF
 12025                                  ;  893  5630 from_far
 12026                                  ;  894  5639 eqstr
 12027                                  ;  895  5645 prs
 12028                                  ;  896  5649 countcalls
 12029                                  ;  897  5660 funclisting
 12030                                  ;  898  5672 prs
 12031                                  ;  899  5676 printint51
 12032                                  ;  900  5687 printint51
 12033                                  ;  901  5698 prs
 12034                                  ;  902  5702 printint51
 12035                                  ;  903  5713 prc
 12036                                  ;  904  5717 prs
 12037                                  ;  905  5721 prs
 12038                                  ;  906  5725 prs
 12039                                  ;  907  5729 prs
 12040                                  ;  908  5733 prc
 12041                                  ;  909  5737 prc
 12042                                  ;  910  5741 adrF
 12043                                  ;  911  5746 prs
 12044                                  ;  912  5750 strcpy
 12045                                  ;  913  5757 storefunc
 12046                                  ;  914  5767 prs
 12047                                  ;  915  5771 prs
 12048                                  ;  916  5775 listvar
 12049                                  ;  917  5783 listfunc
 12050                                  ;  918  5792 listcall
 12051                                  ;  919  5801 prs
 12052                                  ;  920  5805 prs
 12053                                  ;  921  5809 prs
 12054                                  ;  922  5813 prs
 12055                                  ;  923  5817 prs
 12056                                  ;  924  5821 printint51
 12057                                  ;  925  5832 prs
 12058                                  ;  926  5836 printint51
 12059                                  ;  927  5847 prs
 12060                                  ;  928  5851 printint51
 12061                                  ;  929  5862 prs
 12062                                  ;  930  5866 printint51
 12063                                  ;  931  5877 prs
 12064                                  ;  932  5881 printint51
 12065                                  ;  933  5892 prs
 12066                                  ;  934  5896 printint51
 12067                                  ;  935  5907 prs
 12068                                  ;  936  5911 printint51
 12069                                  ;  937  5922 prs
 12070                                  ;  938  5926 printint51
 12071                                  ;  939  5937 prs
 12072                                  ;  940  5941 printint51
 12073                                  ;  941  5952 prs
 12074                                  ;  942  5956 printint51
 12075                                  ;  943  5967 prs
 12076                                  ;  944  5971 printint51
 12077                                  ;  945  5982 prs
 12078                                  ;  946  5986 printint51
 12079                                  ;  947  5997 prs
 12080                                  ;  948  6001 prs
 12081                                  ;  949  6005 prunsign1
 12082                                  ;  950  6015 prs
 12083                                  ;  951  6019 printint51
 12084                                  ;  952  6030 prs
 12085                                  ;  953  6034 prs
 12086                                  ;  954  6038 prs
 12087                                  ;  955  6042 prs
 12088                                  ;  956  6046 printint51
 12089                                  ;  957  6057 prs
 12090                                  ;  958  6061 printint51
 12091                                  ;  959  6072 prs
 12092                                  ;  960  6076 printint51
 12093                                  ;  961  6087 prs
 12094                                  ;  962  6091 end1
 12095                                  ;  963  6096 DosInt
 12096                                  ;  964  6103 DosInt
 12097                                  ;Input: A.C, List: A.S,  Lines: 1006
 12098                                  ;Glob. variables:  129 max.:  200
 12099                                  ;Functions      :  108 max.:  300
 12100                                  ;Calls          :  965 max.: 2000, NameField: 6110 max.:    65535
 12101                                  ;Code until     :21711 max.: 30000, free: 8289
 12102                                  ;Data (HeapEnd) :53548, resting stacksize: 11987
 12103                                  ;Max. Const in 'epilog' :  947 max. 3000, free: 2053
