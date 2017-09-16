     1                                  
     2                                  ; A.COM V0.9, Arglen: 4, Argv: A.C, Source: A.C, Output asm: A.S
     3                                  org  256 
     4 00000000 E99630                  jmp main
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
   506                                  ;-89 int readR (char *s, int fd) {dx=s; cx=1; bx=fd; ax=0x3F00; DosInt(); }
   507 00000112 C9                       LEAVE
   508 00000113 C3                       ret
   509                                  ; ENDP
   510                                  
   511                                  readR:  ; *** PROC ***
   512                                  ;Function : readR, Number of local variables: 2
   513                                  ;   # type sign width addr used name   list of local variables
   514                                  ;  200 ptr sign byte    89 NULL s = bp+4
   515                                  ;  201 var sign word    89 NULL fd = bp+6;
   516 00000114 C8000000                 ENTER  0,0
   517 00000118 8B5604                   mov  dx, [bp+4]
   518 0000011B B90100                   mov  cx, 1
   519 0000011E 8B5E06                   mov  bx, [bp+6]
   520 00000121 B8003F                   mov  ax, 16128
   521 00000124 E8A6FF                   call DosInt
   522                                  
   523                                  ;-90 int readRL(char *s, int fd, int len){dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}
   524 00000127 C9                       LEAVE
   525 00000128 C3                       ret
   526                                  ; ENDP
   527                                  
   528                                  readRL:  ; *** PROC ***
   529                                  ;Function : readRL, Number of local variables: 3
   530                                  ;   # type sign width addr used name   list of local variables
   531                                  ;  200 ptr sign byte    90 NULL s = bp+4
   532                                  ;  201 var sign word    90 NULL fd = bp+6
   533                                  ;  202 var sign word    90 NULL len = bp+8;
   534 00000129 C8000000                 ENTER  0,0
   535 0000012D 8B5604                   mov  dx, [bp+4]
   536 00000130 8B4E08                   mov  cx, [bp+8]
   537 00000133 8B5E06                   mov  bx, [bp+6]
   538 00000136 B8003F                   mov  ax, 16128
   539 00000139 E891FF                   call DosInt
   540                                  
   541                                  ;-91 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
   542 0000013C C9                       LEAVE
   543 0000013D C3                       ret
   544                                  ; ENDP
   545                                  
   546                                  fputcR:  ; *** PROC ***
   547                                  ;Function : fputcR, Number of local variables: 2
   548                                  ;   # type sign width addr used name   list of local variables
   549                                  ;  200 ptr sign byte    91 NULL n = bp+4
   550                                  ;  201 var sign word    91 NULL fd = bp+6;
   551 0000013E C8000000                 ENTER  0,0
   552 00000142 8D5604                  lea dx, [bp+4]
   553                                  
   554                                  ;-92   cx=1; bx=fd; ax=0x4000; DosInt(); }
   555                                  
   556 00000145 B90100                   mov  cx, 1
   557 00000148 8B5E06                   mov  bx, [bp+6]
   558 0000014B B80040                   mov  ax, 16384
   559 0000014E E87CFF                   call DosInt
   560                                  
   561                                  ;-93 
   562                                  
   563                                  
   564                                  ;-94 int strlen(char *s) { int c; c=0; while (*s!=0) {s++; c++;} return c; }
   565 00000151 C9                       LEAVE
   566 00000152 C3                       ret
   567                                  ; ENDP
   568                                  
   569                                  strlen:  ; *** PROC ***
   570                                  ;Function : strlen, Number of local variables: 2
   571                                  ;   # type sign width addr used name   list of local variables
   572                                  ;  200 ptr sign byte    94 NULL s = bp+4
   573                                  ;  201 var sign word    94 NULL c = bp-2;
   574 00000153 C8020000                 ENTER  2,0
   575 00000157 B80000                   mov ax, 0
   576 0000015A 8946FE                   mov [bp-2], ax
   577                                  .strlen4:
   578 0000015D 8B5E04                   mov bx, [bp+4]
   579 00000160 8A07                     mov al, [bx]
   580 00000162 B400                     mov ah, 0
   581 00000164 83F800                   cmp ax, 0
   582 00000167 0F840800                 je  .strlen5
   583 0000016B FF4604                   inc  word[bp+4]
   584 0000016E FF46FE                   inc  word[bp-2]
   585 00000171 EBEA                     jmp .strlen4
   586                                  .strlen5:
   587 00000173 8B46FE                   mov ax, [bp-2]
   588 00000176 E90000                   jmp .retn
   589                                  
   590                                  ;-95 int strcpy(char *s, char *t) {do { *s=*t; s++; t++; } while (*t!=0); *s=0; }
   591                                  
   592 00000179 C9                       .retn: LEAVE
   593 0000017A C3                       ret
   594                                  ; ENDP
   595                                  
   596                                  strcpy:  ; *** PROC ***
   597                                  ;Function : strcpy, Number of local variables: 2
   598                                  ;   # type sign width addr used name   list of local variables
   599                                  ;  200 ptr sign byte    95 NULL s = bp+4
   600                                  ;  201 ptr sign byte    95 NULL t = bp+6;
   601 0000017B C8000000                 ENTER  0,0
   602                                  .strcpy6:
   603 0000017F 8B5E06                   mov bx, [bp+6]
   604 00000182 8A07                     mov al, [bx]
   605 00000184 B400                     mov ah, 0
   606 00000186 8B5E04                   mov  bx, [bp+4]
   607 00000189 8807                     mov  [bx], al
   608 0000018B FF4604                   inc  word[bp+4]
   609 0000018E FF4606                   inc  word[bp+6]
   610 00000191 8B5E06                   mov bx, [bp+6]
   611 00000194 8A07                     mov al, [bx]
   612 00000196 B400                     mov ah, 0
   613 00000198 83F800                   cmp ax, 0
   614 0000019B 0F840200                 je  .strcpy7
   615 0000019F EBDE                     jmp .strcpy6
   616                                  .strcpy7:
   617 000001A1 B80000                   mov ax, 0
   618 000001A4 8B5E04                   mov  bx, [bp+4]
   619 000001A7 8807                     mov  [bx], al
   620                                  
   621                                  ;-96 int eqstr(char *p, char *q) { while(*p) {
   622 000001A9 C9                       LEAVE
   623 000001AA C3                       ret
   624                                  ; ENDP
   625                                  
   626                                  eqstr:  ; *** PROC ***
   627                                  ;Function : eqstr, Number of local variables: 2
   628                                  ;   # type sign width addr used name   list of local variables
   629                                  ;  200 ptr sign byte    96 NULL p = bp+4
   630                                  ;  201 ptr sign byte    96 NULL q = bp+6;
   631 000001AB C8000000                 ENTER  0,0
   632                                  .eqstr8:
   633 000001AF 8B5E04                   mov bx, [bp+4]
   634 000001B2 8A07                     mov al, [bx]
   635 000001B4 B400                     mov ah, 0
   636 000001B6 08C0                     or  al, al
   637 000001B8 0F842000                 je .eqstr9
   638                                  
   639                                  ;-97     if (*p != *q) return 0; p++; q++; }
   640                                  
   641 000001BC 8B5E04                   mov bx, [bp+4]
   642 000001BF 8A07                     mov al, [bx]
   643 000001C1 B400                     mov ah, 0
   644 000001C3 8B5E06                   mov bx, [bp+6]
   645 000001C6 3A07                     cmp al, [bx]
   646 000001C8 B400                     mov ah, 0
   647 000001CA 0F840600                 je  .eqstr10
   648 000001CE B80000                   mov ax, 0
   649 000001D1 E92100                   jmp .retn
   650                                  .eqstr10:
   651 000001D4 FF4604                   inc  word[bp+4]
   652 000001D7 FF4606                   inc  word[bp+6]
   653                                  
   654                                  ;-98     if(*q) return 0; return 1; }
   655                                  
   656 000001DA EBD3                     jmp .eqstr8
   657                                  .eqstr9:
   658 000001DC 8B5E06                   mov bx, [bp+6]
   659 000001DF 8A07                     mov al, [bx]
   660 000001E1 B400                     mov ah, 0
   661 000001E3 08C0                     or  al, al
   662 000001E5 0F840600                 je .eqstr11
   663 000001E9 B80000                   mov ax, 0
   664 000001EC E90600                   jmp .retn
   665                                  .eqstr11:
   666 000001EF B80100                   mov ax, 1
   667 000001F2 E90000                   jmp .retn
   668                                  
   669                                  ;-99 int instr1(char *s, char c) { while(*s) {if (*s==c) return 1; s++;}return 0;}
   670                                  
   671 000001F5 C9                       .retn: LEAVE
   672 000001F6 C3                       ret
   673                                  ; ENDP
   674                                  
   675                                  instr1:  ; *** PROC ***
   676                                  ;Function : instr1, Number of local variables: 2
   677                                  ;   # type sign width addr used name   list of local variables
   678                                  ;  200 ptr sign byte    99 NULL s = bp+4
   679                                  ;  201 var sign byte    99 NULL c = bp+6;
   680 000001F7 C8000000                 ENTER  0,0
   681                                  .instr112:
   682 000001FB 8B5E04                   mov bx, [bp+4]
   683 000001FE 8A07                     mov al, [bx]
   684 00000200 B400                     mov ah, 0
   685 00000202 08C0                     or  al, al
   686 00000204 0F841900                 je .instr113
   687 00000208 8B5E04                   mov bx, [bp+4]
   688 0000020B 8A07                     mov al, [bx]
   689 0000020D B400                     mov ah, 0
   690 0000020F 3A4606                   cmp al, [bp+6]
   691 00000212 0F850600                 jne .instr114
   692 00000216 B80100                   mov ax, 1
   693 00000219 E90B00                   jmp .retn
   694                                  .instr114:
   695 0000021C FF4604                   inc  word[bp+4]
   696 0000021F EBDA                     jmp .instr112
   697                                  .instr113:
   698 00000221 B80000                   mov ax, 0
   699 00000224 E90000                   jmp .retn
   700                                  
   701                                  ;-100 int instr2(char *s, char c) { while(*s) {if (*s==c)return &s; s++;}return 0;}
   702                                  
   703 00000227 C9                       .retn: LEAVE
   704 00000228 C3                       ret
   705                                  ; ENDP
   706                                  
   707                                  instr2:  ; *** PROC ***
   708                                  ;Function : instr2, Number of local variables: 2
   709                                  ;   # type sign width addr used name   list of local variables
   710                                  ;  200 ptr sign byte   100 NULL s = bp+4
   711                                  ;  201 var sign byte   100 NULL c = bp+6;
   712 00000229 C8000000                 ENTER  0,0
   713                                  .instr215:
   714 0000022D 8B5E04                   mov bx, [bp+4]
   715 00000230 8A07                     mov al, [bx]
   716 00000232 B400                     mov ah, 0
   717 00000234 08C0                     or  al, al
   718 00000236 0F841900                 je .instr216
   719 0000023A 8B5E04                   mov bx, [bp+4]
   720 0000023D 8A07                     mov al, [bx]
   721 0000023F B400                     mov ah, 0
   722 00000241 3A4606                   cmp al, [bp+6]
   723 00000244 0F850600                 jne .instr217
   724 00000248 8B4604                   mov ax, [bp+4]
   725 0000024B E90B00                   jmp .retn
   726                                  .instr217:
   727 0000024E FF4604                   inc  word[bp+4]
   728 00000251 EBDA                     jmp .instr215
   729                                  .instr216:
   730 00000253 B80000                   mov ax, 0
   731 00000256 E90000                   jmp .retn
   732                                  
   733                                  ;-101 int strcat1(char *s, char *t) { while (*s != 0) s++; strcpy(s, t);  }
   734                                  
   735 00000259 C9                       .retn: LEAVE
   736 0000025A C3                       ret
   737                                  ; ENDP
   738                                  
   739                                  strcat1:  ; *** PROC ***
   740                                  ;Function : strcat1, Number of local variables: 2
   741                                  ;   # type sign width addr used name   list of local variables
   742                                  ;  200 ptr sign byte   101 NULL s = bp+4
   743                                  ;  201 ptr sign byte   101 NULL t = bp+6;
   744 0000025B C8000000                 ENTER  0,0
   745                                  .strcat118:
   746 0000025F 8B5E04                   mov bx, [bp+4]
   747 00000262 8A07                     mov al, [bx]
   748 00000264 B400                     mov ah, 0
   749 00000266 83F800                   cmp ax, 0
   750 00000269 0F840500                 je  .strcat119
   751 0000026D FF4604                   inc  word[bp+4]
   752 00000270 EBED                     jmp .strcat118
   753                                  .strcat119:
   754 00000272 FF7606                   push word [bp+6]
   755 00000275 FF7604                   push word [bp+4]
   756 00000278 E800FF                   call strcpy
   757 0000027B 83C404                   add  sp, 4
   758                                  
   759                                  ;-102 int toupper(char *s) {while(*s) {if (*s >= 'a') if (*s <= 'z') *s=*s-32; s++;}}
   760 0000027E C9                       LEAVE
   761 0000027F C3                       ret
   762                                  ; ENDP
   763                                  
   764                                  toupper:  ; *** PROC ***
   765                                  ;Function : toupper, Number of local variables: 1
   766                                  ;   # type sign width addr used name   list of local variables
   767                                  ;  200 ptr sign byte   102 NULL s = bp+4;
   768 00000280 C8000000                 ENTER  0,0
   769                                  .toupper20:
   770 00000284 8B5E04                   mov bx, [bp+4]
   771 00000287 8A07                     mov al, [bx]
   772 00000289 B400                     mov ah, 0
   773 0000028B 08C0                     or  al, al
   774 0000028D 0F843000                 je .toupper21
   775 00000291 8B5E04                   mov bx, [bp+4]
   776 00000294 8A07                     mov al, [bx]
   777 00000296 B400                     mov ah, 0
   778 00000298 83F861                   cmp ax, 97 ;unsigned : 1
   779 0000029B 0F8C1D00                 jl  .toupper22
   780 0000029F 8B5E04                   mov bx, [bp+4]
   781 000002A2 8A07                     mov al, [bx]
   782 000002A4 B400                     mov ah, 0
   783 000002A6 83F87A                   cmp ax, 122
   784 000002A9 0F8F0F00                 jg  .toupper23
   785 000002AD 8B5E04                   mov bx, [bp+4]
   786 000002B0 8A07                     mov al, [bx]
   787 000002B2 B400                     mov ah, 0
   788 000002B4 83E820                   sub ax, 32
   789 000002B7 8B5E04                   mov  bx, [bp+4]
   790 000002BA 8807                     mov  [bx], al
   791                                  .toupper23:
   792                                  .toupper22:
   793 000002BC FF4604                   inc  word[bp+4]
   794 000002BF EBC3                     jmp .toupper20
   795                                  .toupper21:
   796                                  
   797                                  ;-103 int pint (int n){int e; if(n<0) {  prc('-');  n=mkneg(n); }
   798 000002C1 C9                       LEAVE
   799 000002C2 C3                       ret
   800                                  ; ENDP
   801                                  
   802                                  pint:  ; *** PROC ***
   803                                  ;Function : pint, Number of local variables: 2
   804                                  ;   # type sign width addr used name   list of local variables
   805                                  ;  200 var sign word   103 NULL n = bp+4
   806                                  ;  201 var sign word   103 NULL e = bp-2;
   807 000002C3 C8020000                 ENTER  2,0
   808 000002C7 8B4604                   mov ax, [bp+4]
   809 000002CA 83F800                   cmp ax, 0
   810 000002CD 0F8D1400                 jge .pint24
   811 000002D1 6A2D                     push 45
   812 000002D3 E88842                   call prc
   813 000002D6 83C402                   add  sp, 2
   814 000002D9 FF7604                   push word [bp+4]
   815 000002DC E8E3FD                   call mkneg
   816 000002DF 83C402                   add  sp, 2
   817 000002E2 894604                   mov [bp+4], ax
   818                                  
   819                                  ;-104   if (n >= 10) {e=n/10;  pint(e);}  n=n%10; n=n+'0'; putch(n); }
   820                                  
   821                                  .pint24:
   822 000002E5 8B4604                   mov ax, [bp+4]
   823 000002E8 83F80A                   cmp ax, 10 ;unsigned : 1
   824 000002EB 0F8C1500                 jl  .pint25
   825 000002EF 8B4604                   mov ax, [bp+4]
   826 000002F2 BB0A00                   mov bx, 10
   827 000002F5 99                       cwd
   828 000002F6 F7FB                     idiv bx
   829 000002F8 8946FE                   mov [bp-2], ax
   830 000002FB FF76FE                   push word [bp-2]
   831 000002FE E8C2FF                   call pint
   832 00000301 83C402                   add  sp, 2
   833                                  .pint25:
   834 00000304 8B4604                   mov ax, [bp+4]
   835 00000307 BB0A00                   mov bx, 10
   836 0000030A 99                       cwd
   837 0000030B F7FB                     idiv bx
   838 0000030D 89D0                     mov ax, dx
   839 0000030F 894604                   mov [bp+4], ax
   840 00000312 8B4604                   mov ax, [bp+4]
   841 00000315 83C030                   add ax, 48
   842 00000318 894604                   mov [bp+4], ax
   843 0000031B FF7604                   push word [bp+4]
   844 0000031E E85AFD                   call putch
   845 00000321 83C402                   add  sp, 2
   846                                  
   847                                  ;-105 int digit(char c){ 
   848 00000324 C9                       LEAVE
   849 00000325 C3                       ret
   850                                  ; ENDP
   851                                  
   852                                  digit:  ; *** PROC ***
   853                                  
   854                                  ;-106     if(c<'0') return 0; 
   855                                  
   856                                  ;Function : digit, Number of local variables: 1
   857                                  ;   # type sign width addr used name   list of local variables
   858                                  ;  200 var sign byte   105 NULL c = bp+4;
   859 00000326 C8000000                 ENTER  0,0
   860 0000032A 8A4604                   mov al, [bp+4]
   861 0000032D 3C30                     cmp al, 48
   862 0000032F 0F8D0600                 jge .digit26
   863 00000333 B80000                   mov ax, 0
   864 00000336 E91500                   jmp .retn
   865                                  
   866                                  ;-107     if(c>'9') return 0; 
   867                                  
   868                                  .digit26:
   869 00000339 8A4604                   mov al, [bp+4]
   870 0000033C 3C39                     cmp al, 57
   871 0000033E 0F8E0600                 jle .digit27
   872 00000342 B80000                   mov ax, 0
   873 00000345 E90600                   jmp .retn
   874                                  
   875                                  ;-108     return 1; 
   876                                  
   877                                  .digit27:
   878 00000348 B80100                   mov ax, 1
   879 0000034B E90000                   jmp .retn
   880                                  
   881                                  ;-109 }
   882                                  
   883                                  
   884                                  ;-110 int letter(char c) { 
   885                                  
   886 0000034E C9                       .retn: LEAVE
   887 0000034F C3                       ret
   888                                  ; ENDP
   889                                  
   890                                  letter:  ; *** PROC ***
   891                                  
   892                                  ;-111     if (digit(c)) return 1;   ////////
   893                                  
   894                                  ;Function : letter, Number of local variables: 1
   895                                  ;   # type sign width addr used name   list of local variables
   896                                  ;  200 var sign byte   110 NULL c = bp+4;
   897 00000350 C8000000                 ENTER  0,0
   898 00000354 8A4604                   mov al, byte [bp+4]
   899 00000357 B400                     mov ah, 0
   900 00000359 50                       push ax
   901 0000035A E8C9FF                   call digit
   902 0000035D 83C402                   add  sp, 2
   903 00000360 08C0                     or  al, al
   904 00000362 0F840600                 je .letter28
   905 00000366 B80100                   mov ax, 1
   906 00000369 E97800                   jmp .retn
   907                                  
   908                                  ;-112     if (c=='_') return 1;
   909                                  
   910                                  .letter28:
   911 0000036C 8A4604                   mov al, [bp+4]
   912 0000036F 3C5F                     cmp al, 95
   913 00000371 0F850600                 jne .letter29
   914 00000375 B80100                   mov ax, 1
   915 00000378 E96900                   jmp .retn
   916                                  
   917                                  ;-113     if (c=='.') return 1;
   918                                  
   919                                  .letter29:
   920 0000037B 8A4604                   mov al, [bp+4]
   921 0000037E 3C2E                     cmp al, 46
   922 00000380 0F850600                 jne .letter30
   923 00000384 B80100                   mov ax, 1
   924 00000387 E95A00                   jmp .retn
   925                                  
   926                                  ;-114     if (c=='?') return 1;
   927                                  
   928                                  .letter30:
   929 0000038A 8A4604                   mov al, [bp+4]
   930 0000038D 3C3F                     cmp al, 63
   931 0000038F 0F850600                 jne .letter31
   932 00000393 B80100                   mov ax, 1
   933 00000396 E94B00                   jmp .retn
   934                                  
   935                                  ;-115     if (c=='$') return 1;
   936                                  
   937                                  .letter31:
   938 00000399 8A4604                   mov al, [bp+4]
   939 0000039C 3C24                     cmp al, 36
   940 0000039E 0F850600                 jne .letter32
   941 000003A2 B80100                   mov ax, 1
   942 000003A5 E93C00                   jmp .retn
   943                                  
   944                                  ;-116     if (c> 'z') return 0; 
   945                                  
   946                                  .letter32:
   947 000003A8 8A4604                   mov al, [bp+4]
   948 000003AB 3C7A                     cmp al, 122
   949 000003AD 0F8E0600                 jle .letter33
   950 000003B1 B80000                   mov ax, 0
   951 000003B4 E92D00                   jmp .retn
   952                                  
   953                                  ;-117     if (c< '@') return 0;// at included
   954                                  
   955                                  .letter33:
   956 000003B7 8A4604                   mov al, [bp+4]
   957 000003BA 3C40                     cmp al, 64
   958 000003BC 0F8D0600                 jge .letter34
   959 000003C0 B80000                   mov ax, 0
   960 000003C3 E91E00                   jmp .retn
   961                                  
   962                                  ;-118     if (c> 'Z') { if (c< 'a') return 0; }  
   963                                  
   964                                  .letter34:
   965 000003C6 8A4604                   mov al, [bp+4]
   966 000003C9 3C5A                     cmp al, 90
   967 000003CB 0F8E0F00                 jle .letter35
   968 000003CF 8A4604                   mov al, [bp+4]
   969 000003D2 3C61                     cmp al, 97
   970 000003D4 0F8D0600                 jge .letter36
   971 000003D8 B80000                   mov ax, 0
   972 000003DB E90600                   jmp .retn
   973                                  .letter36:
   974                                  
   975                                  ;-119     return 1; 
   976                                  
   977                                  .letter35:
   978 000003DE B80100                   mov ax, 1
   979 000003E1 E90000                   jmp .retn
   980                                  
   981                                  ;-120 }    
   982                                  
   983                                  
   984                                  ;-121 int alnum(char c) {
   985                                  
   986 000003E4 C9                       .retn: LEAVE
   987 000003E5 C3                       ret
   988                                  ; ENDP
   989                                  
   990                                  alnum:  ; *** PROC ***
   991                                  
   992                                  ;-122   if (digit (c)) return 1;
   993                                  
   994                                  ;Function : alnum, Number of local variables: 1
   995                                  ;   # type sign width addr used name   list of local variables
   996                                  ;  200 var sign byte   121 NULL c = bp+4;
   997 000003E6 C8000000                 ENTER  0,0
   998 000003EA 8A4604                   mov al, byte [bp+4]
   999 000003ED B400                     mov ah, 0
  1000 000003EF 50                       push ax
  1001 000003F0 E833FF                   call digit
  1002 000003F3 83C402                   add  sp, 2
  1003 000003F6 08C0                     or  al, al
  1004 000003F8 0F840600                 je .alnum37
  1005 000003FC B80100                   mov ax, 1
  1006 000003FF E91E00                   jmp .retn
  1007                                  
  1008                                  ;-123   if (letter(c)) return 1;
  1009                                  
  1010                                  .alnum37:
  1011 00000402 8A4604                   mov al, byte [bp+4]
  1012 00000405 B400                     mov ah, 0
  1013 00000407 50                       push ax
  1014 00000408 E845FF                   call letter
  1015 0000040B 83C402                   add  sp, 2
  1016 0000040E 08C0                     or  al, al
  1017 00000410 0F840600                 je .alnum38
  1018 00000414 B80100                   mov ax, 1
  1019 00000417 E90600                   jmp .retn
  1020                                  
  1021                                  ;-124   return 0;
  1022                                  
  1023                                  .alnum38:
  1024 0000041A B80000                   mov ax, 0
  1025 0000041D E90000                   jmp .retn
  1026                                  
  1027                                  ;-125 }       
  1028                                  
  1029                                  
  1030                                  ;-126 int a(unsigned int i) {  printName(i);}//address
  1031                                  
  1032 00000420 C9                       .retn: LEAVE
  1033 00000421 C3                       ret
  1034                                  ; ENDP
  1035                                  
  1036                                  a:  ; *** PROC ***
  1037                                  ;Function : a, Number of local variables: 1
  1038                                  ;   # type sign width addr used name   list of local variables
  1039                                  ;  200 var unsg word   126 NULL i = bp+4;
  1040 00000422 C8000000                 ENTER  0,0
  1041 00000426 FF7604                   push word [bp+4]
  1042 00000429 E88D05                   call printName
  1043 0000042C 83C402                   add  sp, 2
  1044                                  
  1045                                  ;-127 int v(unsigned int i) {//value 
  1046 0000042F C9                       LEAVE
  1047 00000430 C3                       ret
  1048                                  ; ENDP
  1049                                  
  1050                                  v:  ; *** PROC ***
  1051                                  
  1052                                  ;-128     if (i < LSTART) prc('['); 
  1053                                  
  1054                                  ;Function : v, Number of local variables: 1
  1055                                  ;   # type sign width addr used name   list of local variables
  1056                                  ;  200 var unsg word   127 NULL i = bp+4;
  1057 00000431 C8000000                 ENTER  0,0
  1058 00000435 8B4604                   mov ax, [bp+4]
  1059 00000438 3DC800                   cmp ax, 200
  1060 0000043B 0F8D0800                 jge .v39
  1061 0000043F 6A5B                     push 91
  1062 00000441 E81A41                   call prc
  1063 00000444 83C402                   add  sp, 2
  1064                                  
  1065                                  ;-129     printName(i);
  1066                                  
  1067                                  .v39:
  1068 00000447 FF7604                   push word [bp+4]
  1069 0000044A E86C05                   call printName
  1070 0000044D 83C402                   add  sp, 2
  1071                                  
  1072                                  ;-130     if (i < LSTART) prc(']');   
  1073                                  
  1074 00000450 8B4604                   mov ax, [bp+4]
  1075 00000453 3DC800                   cmp ax, 200
  1076 00000456 0F8D0800                 jge .v40
  1077 0000045A 6A5D                     push 93
  1078 0000045C E8FF40                   call prc
  1079 0000045F 83C402                   add  sp, 2
  1080                                  
  1081                                  ;-131 }
  1082                                  
  1083                                  .v40:
  1084                                  
  1085                                  ;-132 int checknamelen() { int i;    i=strlen(symbol);
  1086 00000462 C9                       LEAVE
  1087 00000463 C3                       ret
  1088                                  ; ENDP
  1089                                  
  1090                                  checknamelen:  ; *** PROC ***
  1091                                  ;Function : checknamelen, Number of local variables: 1
  1092                                  ;   # type sign width addr used name   list of local variables
  1093                                  ;  200 var sign word   132 NULL i = bp-2;
  1094 00000464 C8020000                 ENTER  2,0
  1095 00000468 8D062B81                 lea  ax, [symbol]
  1096 0000046C 50                       push ax
  1097 0000046D E8E3FC                   call strlen
  1098 00000470 83C402                   add  sp, 2
  1099 00000473 8946FE                   mov [bp-2], ax
  1100                                  
  1101                                  ;-133   if (i > IDLENMAX) error1("Item name is too long in characters)");
  1102                                  
  1103 00000476 8B46FE                   mov ax, [bp-2]
  1104 00000479 83F80F                   cmp ax, 15
  1105 0000047C 0F8E0900                 jle .checknamelen41
  1106 00000480 68[8B04]                 push checknamelen_0
  1107 00000483 E82844                   call error1
  1108 00000486 83C402                   add  sp, 2
  1109                                  
  1110                                  ;-134 }
  1111                                  
  1112                                  .checknamelen41:
  1113                                  
  1114                                  ;-135 char doglobName[IDLENMAX];
  1115 00000489 C9                       LEAVE
  1116 0000048A C3                       ret
  1117                                  ; ENDP
  1118 0000048B 4974656D206E616D65-     checknamelen_0 db "Item name is too long in characters)",0
  1119 00000494 20697320746F6F206C-
  1120 0000049D 6F6E6720696E206368-
  1121 000004A6 617261637465727329-
  1122 000004AF 00                 
  1123                                  section .bss
  1124                                  absolute 53391
  1125 0000D08F <res 0000000F>          doglobName resb 15
  1126                                  section .text
  1127                                  
  1128                                  ;-136 int doglob() { int i; int j; int isstrarr; isstrarr=0;
  1129                                  
  1130                                  
  1131                                  doglob:  ; *** PROC ***
  1132                                  ;Function : doglob, Number of local variables: 3
  1133                                  ;   # type sign width addr used name   list of local variables
  1134                                  ;  200 var sign word   136 NULL i = bp-2
  1135                                  ;  201 var sign word   136 NULL j = bp-4
  1136                                  ;  202 var sign word   136 NULL isstrarr = bp-6;
  1137 000004B0 C8060000                 ENTER  6,0
  1138 000004B4 B80000                   mov ax, 0
  1139 000004B7 8946FA                   mov [bp-6], ax
  1140                                  
  1141                                  ;-137   if (GTop >= LSTART) error1("Global table full");
  1142                                  
  1143 000004BA A1[2A00]                 mov ax, [GTop]
  1144 000004BD 3DC800                   cmp ax, 200 ;unsigned : 1
  1145 000004C0 0F8C0900                 jl  .doglob42
  1146 000004C4 68[0508]                 push doglob_0
  1147 000004C7 E8E443                   call error1
  1148 000004CA 83C402                   add  sp, 2
  1149                                  
  1150                                  ;-138   if (iswidth == 0) error1("no VOID as var type");
  1151                                  
  1152                                  .doglob42:
  1153 000004CD A0[3800]                 mov al, [iswidth]
  1154 000004D0 3C00                     cmp al, 0
  1155 000004D2 0F850900                 jne .doglob43
  1156 000004D6 68[1708]                 push doglob_1
  1157 000004D9 E8D243                   call error1
  1158 000004DC 83C402                   add  sp, 2
  1159                                  
  1160                                  ;-139   checknamelen();
  1161                                  
  1162                                  .doglob43:
  1163 000004DF E882FF                   call checknamelen
  1164                                  
  1165                                  ;-140   if (checkName() != 0) error1("Variable already defined");
  1166                                  
  1167 000004E2 E88305                   call checkName
  1168 000004E5 3C00                     cmp al, 0
  1169 000004E7 0F840900                 je  .doglob44
  1170 000004EB 68[2B08]                 push doglob_2
  1171 000004EE E8BD43                   call error1
  1172 000004F1 83C402                   add  sp, 2
  1173                                  
  1174                                  ;-141   if (istoken('[')) { istype='&';
  1175                                  
  1176                                  .doglob44:
  1177 000004F4 6A5B                     push 91
  1178 000004F6 E8973F                   call istoken
  1179 000004F9 83C402                   add  sp, 2
  1180 000004FC 08C0                     or  al, al
  1181 000004FE 0F84E201                 je .doglob45
  1182 00000502 B82600                   mov ax, 38
  1183 00000505 A2[3200]                 mov byte [istype], al
  1184                                  
  1185                                  ;-142     if (istoken(T_CONST)) {
  1186                                  
  1187 00000508 680101                   push 257
  1188 0000050B E8823F                   call istoken
  1189 0000050E 83C402                   add  sp, 2
  1190 00000511 08C0                     or  al, al
  1191 00000513 0F84C200                 je .doglob46
  1192                                  
  1193                                  ;-143       prs("\nsection .bss\nabsolute ");
  1194                                  
  1195 00000517 68[4408]                 push doglob_3
  1196 0000051A E8A840                   call prs
  1197 0000051D 83C402                   add  sp, 2
  1198                                  
  1199                                  ;-144       prunsign1(orgData);
  1200                                  
  1201 00000520 FF36[1000]               push word [orgData]
  1202 00000524 E8F841                   call prunsign1
  1203 00000527 83C402                   add  sp, 2
  1204                                  
  1205                                  ;-145       prs("\n"); prs(symbol); 
  1206                                  
  1207 0000052A 68[5E08]                 push doglob_4
  1208 0000052D E89540                   call prs
  1209 00000530 83C402                   add  sp, 2
  1210 00000533 8D062B81                 lea  ax, [symbol]
  1211 00000537 50                       push ax
  1212 00000538 E88A40                   call prs
  1213 0000053B 83C402                   add  sp, 2
  1214                                  
  1215                                  ;-146       if (iswidth==1) prs(" resb "); 
  1216                                  
  1217 0000053E A0[3800]                 mov al, [iswidth]
  1218 00000541 3C01                     cmp al, 1
  1219 00000543 0F850900                 jne .doglob47
  1220 00000547 68[6108]                 push doglob_5
  1221 0000054A E87840                   call prs
  1222 0000054D 83C402                   add  sp, 2
  1223                                  
  1224                                  ;-147       if (iswidth==2) prs(" resw ");
  1225                                  
  1226                                  .doglob47:
  1227 00000550 A0[3800]                 mov al, [iswidth]
  1228 00000553 3C02                     cmp al, 2
  1229 00000555 0F850900                 jne .doglob48
  1230 00000559 68[6808]                 push doglob_6
  1231 0000055C E86640                   call prs
  1232 0000055F 83C402                   add  sp, 2
  1233                                  
  1234                                  ;-148       if (iswidth==4) prs(" resd ");
  1235                                  
  1236                                  .doglob48:
  1237 00000562 A0[3800]                 mov al, [iswidth]
  1238 00000565 3C04                     cmp al, 4
  1239 00000567 0F850900                 jne .doglob49
  1240 0000056B 68[6F08]                 push doglob_7
  1241 0000056E E85440                   call prs
  1242 00000571 83C402                   add  sp, 2
  1243                                  
  1244                                  ;-149       prunsign1(lexval); 
  1245                                  
  1246                                  .doglob49:
  1247 00000574 FF36[2E00]               push word [lexval]
  1248 00000578 E8A441                   call prunsign1
  1249 0000057B 83C402                   add  sp, 2
  1250                                  
  1251                                  ;-150       prs("\nsection .text");
  1252                                  
  1253 0000057E 68[7608]                 push doglob_8
  1254 00000581 E84140                   call prs
  1255 00000584 83C402                   add  sp, 2
  1256                                  
  1257                                  ;-151       orgData=orgData+lexval;
  1258                                  
  1259 00000587 A1[1000]                 mov ax, [orgData]
  1260 0000058A 0306[2E00]               add ax, [lexval]
  1261 0000058E A3[1000]                 mov word [orgData], ax
  1262                                  
  1263                                  ;-152       if (iswidth==2) orgData=orgData+lexval;
  1264                                  
  1265 00000591 A0[3800]                 mov al, [iswidth]
  1266 00000594 3C02                     cmp al, 2
  1267 00000596 0F850A00                 jne .doglob50
  1268 0000059A A1[1000]                 mov ax, [orgData]
  1269 0000059D 0306[2E00]               add ax, [lexval]
  1270 000005A1 A3[1000]                 mov word [orgData], ax
  1271                                  
  1272                                  ;-153       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}
  1273                                  
  1274                                  .doglob50:
  1275 000005A4 A0[3800]                 mov al, [iswidth]
  1276 000005A7 3C04                     cmp al, 4
  1277 000005A9 0F851400                 jne .doglob51
  1278 000005AD A1[2E00]                 mov ax, [lexval]
  1279 000005B0 BB0300                   mov bx, 3
  1280 000005B3 F7E3                     mul bx
  1281 000005B5 8946FE                   mov [bp-2], ax
  1282 000005B8 A1[1000]                 mov ax, [orgData]
  1283 000005BB 0346FE                   add ax, [bp-2]
  1284 000005BE A3[1000]                 mov word [orgData], ax
  1285                                  
  1286                                  ;-154       GData[GTop]=lexval; expect(']');
  1287                                  
  1288                                  .doglob51:
  1289 000005C1 A1[2E00]                 mov ax, [lexval]
  1290 000005C4 8B1E[2A00]               mov bx, [GTop]
  1291 000005C8 D1E3                     shl bx, 1
  1292 000005CA 8987EB8A                 mov [GData+bx], ax
  1293 000005CE 6A5D                     push 93
  1294 000005D0 E8DF3E                   call expect
  1295 000005D3 83C402                   add  sp, 2
  1296                                  
  1297                                  ;-155     }else { expect(']');
  1298                                  
  1299 000005D6 E90801                   jmp .doglob52
  1300                                  .doglob46:
  1301 000005D9 6A5D                     push 93
  1302 000005DB E8D43E                   call expect
  1303 000005DE 83C402                   add  sp, 2
  1304                                  
  1305                                  ;-156       if (iswidth != 1) error1("Only ByteArray allowed");
  1306                                  
  1307 000005E1 A0[3800]                 mov al, [iswidth]
  1308 000005E4 3C01                     cmp al, 1
  1309 000005E6 0F840900                 je  .doglob53
  1310 000005EA 68[8608]                 push doglob_9
  1311 000005ED E8BE42                   call error1
  1312 000005F0 83C402                   add  sp, 2
  1313                                  
  1314                                  ;-157       prs("\n"); prs(symbol); prs(" db "); 
  1315                                  
  1316                                  .doglob53:
  1317 000005F3 68[9D08]                 push doglob_10
  1318 000005F6 E8CC3F                   call prs
  1319 000005F9 83C402                   add  sp, 2
  1320 000005FC 8D062B81                 lea  ax, [symbol]
  1321 00000600 50                       push ax
  1322 00000601 E8C13F                   call prs
  1323 00000604 83C402                   add  sp, 2
  1324 00000607 68[A008]                 push doglob_11
  1325 0000060A E8B83F                   call prs
  1326 0000060D 83C402                   add  sp, 2
  1327                                  
  1328                                  ;-158       isstrarr=1; strcpy(doglobName, symbol);
  1329                                  
  1330 00000610 B80100                   mov ax, 1
  1331 00000613 8946FA                   mov [bp-6], ax
  1332 00000616 8D062B81                 lea  ax, [symbol]
  1333 0000061A 50                       push ax
  1334 0000061B 8D068FD0                 lea  ax, [doglobName]
  1335 0000061F 50                       push ax
  1336 00000620 E858FB                   call strcpy
  1337 00000623 83C404                   add  sp, 4
  1338                                  
  1339                                  ;-159       expect('='); 
  1340                                  
  1341 00000626 6A3D                     push 61
  1342 00000628 E8873E                   call expect
  1343 0000062B 83C402                   add  sp, 2
  1344                                  
  1345                                  ;-160       if (istoken(T_STRING)) { 
  1346                                  
  1347 0000062E 680201                   push 258
  1348 00000631 E85C3E                   call istoken
  1349 00000634 83C402                   add  sp, 2
  1350 00000637 08C0                     or  al, al
  1351 00000639 0F844200                 je .doglob54
  1352                                  
  1353                                  ;-161         prc(34); prscomment(symbol); prc(34); prs(",0"); 
  1354                                  
  1355 0000063D 6A22                     push 34
  1356 0000063F E81C3F                   call prc
  1357 00000642 83C402                   add  sp, 2
  1358 00000645 8D062B81                 lea  ax, [symbol]
  1359 00000649 50                       push ax
  1360 0000064A E83C3F                   call prscomment
  1361 0000064D 83C402                   add  sp, 2
  1362 00000650 6A22                     push 34
  1363 00000652 E8093F                   call prc
  1364 00000655 83C402                   add  sp, 2
  1365 00000658 68[A508]                 push doglob_12
  1366 0000065B E8673F                   call prs
  1367 0000065E 83C402                   add  sp, 2
  1368                                  
  1369                                  ;-162         i=strlen(symbol); GData[GTop]=i; }
  1370                                  
  1371 00000661 8D062B81                 lea  ax, [symbol]
  1372 00000665 50                       push ax
  1373 00000666 E8EAFA                   call strlen
  1374 00000669 83C402                   add  sp, 2
  1375 0000066C 8946FE                   mov [bp-2], ax
  1376 0000066F 8B46FE                   mov ax, [bp-2]
  1377 00000672 8B1E[2A00]               mov bx, [GTop]
  1378 00000676 D1E3                     shl bx, 1
  1379 00000678 8987EB8A                 mov [GData+bx], ax
  1380                                  
  1381                                  ;-163       else if (istoken('{' )) { i=0;
  1382                                  
  1383 0000067C E96200                   jmp .doglob55
  1384                                  .doglob54:
  1385 0000067F 6A7B                     push 123
  1386 00000681 E80C3E                   call istoken
  1387 00000684 83C402                   add  sp, 2
  1388 00000687 08C0                     or  al, al
  1389 00000689 0F844B00                 je .doglob56
  1390 0000068D B80000                   mov ax, 0
  1391 00000690 8946FE                   mov [bp-2], ax
  1392                                  
  1393                                  ;-164         do { if(i) prc(','); 
  1394                                  
  1395                                  .doglob57:
  1396 00000693 8B46FE                   mov ax, [bp-2]
  1397 00000696 08C0                     or  al, al
  1398 00000698 0F840800                 je .doglob58
  1399 0000069C 6A2C                     push 44
  1400 0000069E E8BD3E                   call prc
  1401 000006A1 83C402                   add  sp, 2
  1402                                  
  1403                                  ;-165           expect(T_CONST); prunsign1(lexval); i=1; }
  1404                                  
  1405                                  .doglob58:
  1406 000006A4 680101                   push 257
  1407 000006A7 E8083E                   call expect
  1408 000006AA 83C402                   add  sp, 2
  1409 000006AD FF36[2E00]               push word [lexval]
  1410 000006B1 E86B40                   call prunsign1
  1411 000006B4 83C402                   add  sp, 2
  1412 000006B7 B80100                   mov ax, 1
  1413 000006BA 8946FE                   mov [bp-2], ax
  1414                                  
  1415                                  ;-166         while (istoken(',')); expect('}'); }  
  1416                                  
  1417 000006BD 6A2C                     push 44
  1418 000006BF E8CE3D                   call istoken
  1419 000006C2 83C402                   add  sp, 2
  1420 000006C5 08C0                     or  al, al
  1421 000006C7 0F840200                 je .doglob59
  1422 000006CB EBC6                     jmp .doglob57
  1423                                  .doglob59:
  1424 000006CD 6A7D                     push 125
  1425 000006CF E8E03D                   call expect
  1426 000006D2 83C402                   add  sp, 2
  1427                                  
  1428                                  ;-167       else error1("String or number array expected");
  1429                                  
  1430 000006D5 E90900                   jmp .doglob60
  1431                                  .doglob56:
  1432 000006D8 68[A808]                 push doglob_13
  1433 000006DB E8D041                   call error1
  1434 000006DE 83C402                   add  sp, 2
  1435                                  
  1436                                  ;-168       }; 
  1437                                  
  1438                                  .doglob60:
  1439                                  .doglob55:
  1440                                  .doglob52:
  1441                                  
  1442                                  ;-169   }else { //expect('=');
  1443                                  
  1444 000006E1 E99E00                   jmp .doglob61
  1445                                  .doglob45:
  1446                                  
  1447                                  ;-170     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");
  1448                                  
  1449 000006E4 68[C808]                 push doglob_14
  1450 000006E7 E8DB3E                   call prs
  1451 000006EA 83C402                   add  sp, 2
  1452 000006ED 8D062B81                 lea  ax, [symbol]
  1453 000006F1 50                       push ax
  1454 000006F2 E8D03E                   call prs
  1455 000006F5 83C402                   add  sp, 2
  1456 000006F8 A0[3200]                 mov al, [istype]
  1457 000006FB 3C2A                     cmp al, 42
  1458 000006FD 0F850C00                 jne .doglob62
  1459 00000701 68[CB08]                 push doglob_15
  1460 00000704 E8BE3E                   call prs
  1461 00000707 83C402                   add  sp, 2
  1462                                  
  1463                                  ;-171     else {
  1464                                  
  1465 0000070A E93300                   jmp .doglob63
  1466                                  .doglob62:
  1467                                  
  1468                                  ;-172       if      (iswidth==1) prs(" db ");
  1469                                  
  1470 0000070D A0[3800]                 mov al, [iswidth]
  1471 00000710 3C01                     cmp al, 1
  1472 00000712 0F850C00                 jne .doglob64
  1473 00000716 68[D008]                 push doglob_16
  1474 00000719 E8A93E                   call prs
  1475 0000071C 83C402                   add  sp, 2
  1476                                  
  1477                                  ;-173       else if (iswidth==2) prs(" dw ");
  1478                                  
  1479 0000071F E91E00                   jmp .doglob65
  1480                                  .doglob64:
  1481 00000722 A0[3800]                 mov al, [iswidth]
  1482 00000725 3C02                     cmp al, 2
  1483 00000727 0F850C00                 jne .doglob66
  1484 0000072B 68[D508]                 push doglob_17
  1485 0000072E E8943E                   call prs
  1486 00000731 83C402                   add  sp, 2
  1487                                  
  1488                                  ;-174       else                 prs(" dd ");
  1489                                  
  1490 00000734 E90900                   jmp .doglob67
  1491                                  .doglob66:
  1492 00000737 68[DA08]                 push doglob_18
  1493 0000073A E8883E                   call prs
  1494 0000073D 83C402                   add  sp, 2
  1495                                  
  1496                                  ;-175     }
  1497                                  
  1498                                  .doglob67:
  1499                                  .doglob65:
  1500                                  
  1501                                  ;-176     if(istoken('-')) prc('-');
  1502                                  
  1503                                  .doglob63:
  1504 00000740 6A2D                     push 45
  1505 00000742 E84B3D                   call istoken
  1506 00000745 83C402                   add  sp, 2
  1507 00000748 08C0                     or  al, al
  1508 0000074A 0F840800                 je .doglob68
  1509 0000074E 6A2D                     push 45
  1510 00000750 E80B3E                   call prc
  1511 00000753 83C402                   add  sp, 2
  1512                                  
  1513                                  ;-177     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }
  1514                                  
  1515                                  .doglob68:
  1516 00000756 6A3D                     push 61
  1517 00000758 E8353D                   call istoken
  1518 0000075B 83C402                   add  sp, 2
  1519 0000075E 08C0                     or  al, al
  1520 00000760 0F841600                 je .doglob69
  1521 00000764 680101                   push 257
  1522 00000767 E8483D                   call expect
  1523 0000076A 83C402                   add  sp, 2
  1524 0000076D FF36[2E00]               push word [lexval]
  1525 00000771 E8AB3F                   call prunsign1
  1526 00000774 83C402                   add  sp, 2
  1527                                  
  1528                                  ;-178     else prunsign1(0); }
  1529                                  
  1530 00000777 E90800                   jmp .doglob70
  1531                                  .doglob69:
  1532 0000077A 6A00                     push 0
  1533 0000077C E8A03F                   call prunsign1
  1534 0000077F 83C402                   add  sp, 2
  1535                                  .doglob70:
  1536                                  
  1537                                  ;-179   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;
  1538                                  
  1539                                  .doglob61:
  1540 00000782 A0[3500]                 mov al, [issign]
  1541 00000785 8B1E[2A00]               mov bx, [GTop]
  1542 00000789 8887E383                 mov [GSign+bx], al
  1543 0000078D A0[3800]                 mov al, [iswidth]
  1544 00000790 8B1E[2A00]               mov bx, [GTop]
  1545 00000794 88870F85                 mov [GWidth+bx], al
  1546 00000798 A0[3200]                 mov al, [istype]
  1547 0000079B 8B1E[2A00]               mov bx, [GTop]
  1548 0000079F 8887B782                 mov [GType+bx], al
  1549                                  
  1550                                  ;-180   GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  1551                                  
  1552 000007A3 A1[6600]                 mov ax, [lineno]
  1553 000007A6 83E801                   sub ax, 1
  1554 000007A9 8B1E[2A00]               mov bx, [GTop]
  1555 000007AD D1E3                     shl bx, 1
  1556 000007AF 89873B86                 mov [GAdr+bx], ax
  1557 000007B3 B80000                   mov ax, 0
  1558 000007B6 8B1E[2A00]               mov bx, [GTop]
  1559 000007BA D1E3                     shl bx, 1
  1560 000007BC 89879388                 mov [GUsed+bx], ax
  1561                                  
  1562                                  ;-181   pt=adrofname(GTop);
  1563                                  
  1564 000007C0 FF36[2A00]               push word [GTop]
  1565 000007C4 E8CF01                   call adrofname
  1566 000007C7 83C402                   add  sp, 2
  1567 000007CA A3[6A00]                 mov word [pt], ax
  1568                                  
  1569                                  ;-182   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);
  1570                                  
  1571 000007CD 8B46FA                   mov ax, [bp-6]
  1572 000007D0 08C0                     or  al, al
  1573 000007D2 0F841200                 je .doglob71
  1574 000007D6 8D068FD0                 lea  ax, [doglobName]
  1575 000007DA 50                       push ax
  1576 000007DB FF36[6A00]               push word [pt]
  1577 000007DF E899F9                   call strcpy
  1578 000007E2 83C404                   add  sp, 4
  1579 000007E5 E90F00                   jmp .doglob72
  1580                                  .doglob71:
  1581 000007E8 8D062B81                 lea  ax, [symbol]
  1582 000007EC 50                       push ax
  1583 000007ED FF36[6A00]               push word [pt]
  1584 000007F1 E887F9                   call strcpy
  1585 000007F4 83C404                   add  sp, 4
  1586                                  
  1587                                  ;-183   GTop++; expect(';'); }
  1588                                  
  1589                                  .doglob72:
  1590 000007F7 FF06[2A00]               inc  word[GTop]
  1591 000007FB 6A3B                     push 59
  1592 000007FD E8B23C                   call expect
  1593 00000800 83C402                   add  sp, 2
  1594                                  
  1595                                  ;-184 
  1596                                  
  1597                                  
  1598                                  ;-185 int gettypes(int i) {int j; char c;
  1599 00000803 C9                       LEAVE
  1600 00000804 C3                       ret
  1601                                  ; ENDP
  1602 00000805 476C6F62616C207461-     doglob_0 db "Global table full",0
  1603 0000080E 626C652066756C6C00 
  1604 00000817 6E6F20564F49442061-     doglob_1 db "no VOID as var type",0
  1605 00000820 732076617220747970-
  1606 00000829 6500               
  1607 0000082B 5661726961626C6520-     doglob_2 db "Variable already defined",0
  1608 00000834 616C72656164792064-
  1609 0000083D 6566696E656400     
  1610 00000844 5C6E73656374696F6E-     doglob_3 db "\nsection .bss\nabsolute ",0
  1611 0000084D 202E6273735C6E6162-
  1612 00000856 736F6C7574652000   
  1613 0000085E 5C6E00                  doglob_4 db "\n",0
  1614 00000861 20726573622000          doglob_5 db " resb ",0
  1615 00000868 20726573772000          doglob_6 db " resw ",0
  1616 0000086F 20726573642000          doglob_7 db " resd ",0
  1617 00000876 5C6E73656374696F6E-     doglob_8 db "\nsection .text",0
  1618 0000087F 202E7465787400     
  1619 00000886 4F6E6C792042797465-     doglob_9 db "Only ByteArray allowed",0
  1620 0000088F 417272617920616C6C-
  1621 00000898 6F77656400         
  1622 0000089D 5C6E00                  doglob_10 db "\n",0
  1623 000008A0 2064622000              doglob_11 db " db ",0
  1624 000008A5 2C3000                  doglob_12 db ",0",0
  1625 000008A8 537472696E67206F72-     doglob_13 db "String or number array expected",0
  1626 000008B1 206E756D6265722061-
  1627 000008BA 727261792065787065-
  1628 000008C3 6374656400         
  1629 000008C8 5C6E00                  doglob_14 db "\n",0
  1630 000008CB 2064772000              doglob_15 db " dw ",0
  1631 000008D0 2064622000              doglob_16 db " db ",0
  1632 000008D5 2064772000              doglob_17 db " dw ",0
  1633 000008DA 2064642000              doglob_18 db " dd ",0
  1634                                  
  1635                                  gettypes:  ; *** PROC ***
  1636                                  
  1637                                  ;-186   c=GSign [i]; if (c=='S') signi =1;    else signi =0;
  1638                                  
  1639                                  ;Function : gettypes, Number of local variables: 3
  1640                                  ;   # type sign width addr used name   list of local variables
  1641                                  ;  200 var sign word   185 NULL i = bp+4
  1642                                  ;  201 var sign word   185 NULL j = bp-2
  1643                                  ;  202 var sign byte   185 NULL c = bp-4;
  1644 000008DF C8040000                 ENTER  4,0
  1645 000008E3 8B5E04                   mov bx, [bp+4]
  1646 000008E6 8A87E383                 mov al, [GSign + bx]
  1647 000008EA 8846FC                   mov [bp-4], al
  1648 000008ED 8A46FC                   mov al, [bp-4]
  1649 000008F0 3C53                     cmp al, 83
  1650 000008F2 0F850900                 jne .gettypes73
  1651 000008F6 B80100                   mov ax, 1
  1652 000008F9 A3[3300]                 mov word [signi], ax
  1653 000008FC E90600                   jmp .gettypes74
  1654                                  .gettypes73:
  1655 000008FF B80000                   mov ax, 0
  1656 00000902 A3[3300]                 mov word [signi], ax
  1657                                  
  1658                                  ;-187   c=GWidth[i]; widthi=0;wi=0;
  1659                                  
  1660                                  .gettypes74:
  1661 00000905 8B5E04                   mov bx, [bp+4]
  1662 00000908 8A870F85                 mov al, [GWidth + bx]
  1663 0000090C 8846FC                   mov [bp-4], al
  1664 0000090F B80000                   mov ax, 0
  1665 00000912 A3[3600]                 mov word [widthi], ax
  1666 00000915 B80000                   mov ax, 0
  1667 00000918 A3[3900]                 mov word [wi], ax
  1668                                  
  1669                                  ;-188   if (c==1) {widthi=1;wi=1;}
  1670                                  
  1671 0000091B 8A46FC                   mov al, [bp-4]
  1672 0000091E 3C01                     cmp al, 1
  1673 00000920 0F850C00                 jne .gettypes75
  1674 00000924 B80100                   mov ax, 1
  1675 00000927 A3[3600]                 mov word [widthi], ax
  1676 0000092A B80100                   mov ax, 1
  1677 0000092D A3[3900]                 mov word [wi], ax
  1678                                  
  1679                                  ;-189   if (c==2) {widthi=2;wi=2;}
  1680                                  
  1681                                  .gettypes75:
  1682 00000930 8A46FC                   mov al, [bp-4]
  1683 00000933 3C02                     cmp al, 2
  1684 00000935 0F850C00                 jne .gettypes76
  1685 00000939 B80200                   mov ax, 2
  1686 0000093C A3[3600]                 mov word [widthi], ax
  1687 0000093F B80200                   mov ax, 2
  1688 00000942 A3[3900]                 mov word [wi], ax
  1689                                  
  1690                                  ;-190   if (c==4) {widthi=4;wi=4;}
  1691                                  
  1692                                  .gettypes76:
  1693 00000945 8A46FC                   mov al, [bp-4]
  1694 00000948 3C04                     cmp al, 4
  1695 0000094A 0F850C00                 jne .gettypes77
  1696 0000094E B80400                   mov ax, 4
  1697 00000951 A3[3600]                 mov word [widthi], ax
  1698 00000954 B80400                   mov ax, 4
  1699 00000957 A3[3900]                 mov word [wi], ax
  1700                                  
  1701                                  ;-191   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}
  1702                                  
  1703                                  .gettypes77:
  1704 0000095A 8B5E04                   mov bx, [bp+4]
  1705 0000095D 8A87B782                 mov al, [GType + bx]
  1706 00000961 8846FC                   mov [bp-4], al
  1707 00000964 B80000                   mov ax, 0
  1708 00000967 A3[3000]                 mov word [typei], ax
  1709 0000096A 8A46FC                   mov al, [bp-4]
  1710 0000096D 3C2A                     cmp al, 42
  1711 0000096F 0F850C00                 jne .gettypes78
  1712 00000973 B80100                   mov ax, 1
  1713 00000976 A3[3000]                 mov word [typei], ax
  1714 00000979 B80200                   mov ax, 2
  1715 0000097C A3[3900]                 mov word [wi], ax
  1716                                  
  1717                                  ;-192   if (c=='&')  typei=2;  
  1718                                  
  1719                                  .gettypes78:
  1720 0000097F 8A46FC                   mov al, [bp-4]
  1721 00000982 3C26                     cmp al, 38
  1722 00000984 0F850600                 jne .gettypes79
  1723 00000988 B80200                   mov ax, 2
  1724 0000098B A3[3000]                 mov word [typei], ax
  1725                                  
  1726                                  ;-193   return i; }  
  1727                                  
  1728                                  .gettypes79:
  1729 0000098E 8B4604                   mov ax, [bp+4]
  1730 00000991 E90000                   jmp .retn
  1731                                  
  1732                                  ;-194 int adrofname(unsigned int i) { adrF(GNameField, i); }
  1733                                  
  1734 00000994 C9                       .retn: LEAVE
  1735 00000995 C3                       ret
  1736                                  ; ENDP
  1737                                  
  1738                                  adrofname:  ; *** PROC ***
  1739                                  ;Function : adrofname, Number of local variables: 1
  1740                                  ;   # type sign width addr used name   list of local variables
  1741                                  ;  200 var unsg word   194 NULL i = bp+4;
  1742 00000996 C8000000                 ENTER  0,0
  1743 0000099A FF7604                   push word [bp+4]
  1744 0000099D 8D06438D                 lea  ax, [GNameField]
  1745 000009A1 50                       push ax
  1746 000009A2 E80500                   call adrF
  1747 000009A5 83C404                   add  sp, 4
  1748                                  
  1749                                  ;-195 int adrF(char *s, unsigned int i) { i << 4;//*16; IDLENMAX=15!
  1750 000009A8 C9                       LEAVE
  1751 000009A9 C3                       ret
  1752                                  ; ENDP
  1753                                  
  1754                                  adrF:  ; *** PROC ***
  1755                                  ;Function : adrF, Number of local variables: 2
  1756                                  ;   # type sign width addr used name   list of local variables
  1757                                  ;  200 ptr sign byte   195 NULL s = bp+4
  1758                                  ;  201 var unsg word   195 NULL i = bp+6;
  1759 000009AA C8000000                 ENTER  0,0
  1760 000009AE 8B4606                   mov ax, [bp+6]
  1761 000009B1 C1E004                   shl ax, 4
  1762                                  
  1763                                  ;-196   __asm{ add ax, [bp+4]  ; offset s } }
  1764                                  
  1765 000009B4 034604                   add ax, [bp+4]  ; offset s 
  1766                                  
  1767                                  ;-197 int printName(unsigned int i) {int j;
  1768 000009B7 C9                       LEAVE
  1769 000009B8 C3                       ret
  1770                                  ; ENDP
  1771                                  
  1772                                  printName:  ; *** PROC ***
  1773                                  
  1774                                  ;-198   if (i < LSTART) { i=adrofname(i); prs(i); }
  1775                                  
  1776                                  ;Function : printName, Number of local variables: 2
  1777                                  ;   # type sign width addr used name   list of local variables
  1778                                  ;  200 var unsg word   197 NULL i = bp+4
  1779                                  ;  201 var sign word   197 NULL j = bp-2;
  1780 000009B9 C8020000                 ENTER  2,0
  1781 000009BD 8B4604                   mov ax, [bp+4]
  1782 000009C0 3DC800                   cmp ax, 200
  1783 000009C3 0F8D1800                 jge .printName80
  1784 000009C7 FF7604                   push word [bp+4]
  1785 000009CA E8C9FF                   call adrofname
  1786 000009CD 83C402                   add  sp, 2
  1787 000009D0 894604                   mov [bp+4], ax
  1788 000009D3 FF7604                   push word [bp+4]
  1789 000009D6 E8EC3B                   call prs
  1790 000009D9 83C402                   add  sp, 2
  1791                                  
  1792                                  ;-199   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }
  1793                                  
  1794 000009DC E93800                   jmp .printName81
  1795                                  .printName80:
  1796 000009DF 68[190A]                 push printName_0
  1797 000009E2 E8E03B                   call prs
  1798 000009E5 83C402                   add  sp, 2
  1799 000009E8 8B5E04                   mov bx, [bp+4]
  1800 000009EB D1E3                     shl bx, 1
  1801 000009ED 8B87EB8A                 mov ax, [GData + bx]
  1802 000009F1 8946FE                   mov [bp-2], ax
  1803 000009F4 8B46FE                   mov ax, [bp-2]
  1804 000009F7 83F800                   cmp ax, 0
  1805 000009FA 0F8E0800                 jle .printName82
  1806 000009FE 6A2B                     push 43
  1807 00000A00 E85B3B                   call prc
  1808 00000A03 83C402                   add  sp, 2
  1809                                  .printName82:
  1810 00000A06 FF76FE                   push word [bp-2]
  1811 00000A09 E8B03C                   call pint1
  1812 00000A0C 83C402                   add  sp, 2
  1813 00000A0F 6A5D                     push 93
  1814 00000A11 E84A3B                   call prc
  1815 00000A14 83C402                   add  sp, 2
  1816                                  
  1817                                  ;-200 }
  1818                                  
  1819                                  .printName81:
  1820                                  
  1821                                  ;-201 int searchname() { unsigned int i;
  1822 00000A17 C9                       LEAVE
  1823 00000A18 C3                       ret
  1824                                  ; ENDP
  1825 00000A19 5B627000                printName_0 db "[bp",0
  1826                                  
  1827                                  searchname:  ; *** PROC ***
  1828                                  
  1829                                  ;-202   i=checkName(); if (i == 0) error1("Variable unknown");
  1830                                  
  1831                                  ;Function : searchname, Number of local variables: 1
  1832                                  ;   # type sign width addr used name   list of local variables
  1833                                  ;  200 var unsg word   201 NULL i = bp-2;
  1834 00000A1D C8020000                 ENTER  2,0
  1835 00000A21 E84400                   call checkName
  1836 00000A24 8946FE                   mov [bp-2], ax
  1837 00000A27 8B46FE                   mov ax, [bp-2]
  1838 00000A2A 83F800                   cmp ax, 0
  1839 00000A2D 0F850900                 jne .searchname83
  1840 00000A31 68[570A]                 push searchname_0
  1841 00000A34 E8773E                   call error1
  1842 00000A37 83C402                   add  sp, 2
  1843                                  
  1844                                  ;-203   GUsed[i]=GUsed[i] + 1; return i;
  1845                                  
  1846                                  .searchname83:
  1847 00000A3A 8B5EFE                   mov bx, [bp-2]
  1848 00000A3D D1E3                     shl bx, 1
  1849 00000A3F 8B879388                 mov ax, [GUsed + bx]
  1850 00000A43 83C001                   add ax, 1
  1851 00000A46 8B5EFE                   mov bx, [bp-2]
  1852 00000A49 D1E3                     shl bx, 1
  1853 00000A4B 89879388                 mov [GUsed+bx], ax
  1854 00000A4F 8B46FE                   mov ax, [bp-2]
  1855 00000A52 E90000                   jmp .retn
  1856                                  
  1857                                  ;-204 }
  1858                                  
  1859                                  
  1860                                  ;-205 int checkName() { unsigned int i; unsigned int j;
  1861                                  
  1862 00000A55 C9                       .retn: LEAVE
  1863 00000A56 C3                       ret
  1864                                  ; ENDP
  1865 00000A57 5661726961626C6520-     searchname_0 db "Variable unknown",0
  1866 00000A60 756E6B6E6F776E00   
  1867                                  
  1868                                  checkName:  ; *** PROC ***
  1869                                  
  1870                                  ;-206   i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  1871                                  
  1872                                  ;Function : checkName, Number of local variables: 2
  1873                                  ;   # type sign width addr used name   list of local variables
  1874                                  ;  200 var unsg word   205 NULL i = bp-2
  1875                                  ;  201 var unsg word   205 NULL j = bp-4;
  1876 00000A68 C8040000                 ENTER  4,0
  1877 00000A6C B8C800                   mov ax, 200
  1878 00000A6F 8946FE                   mov [bp-2], ax
  1879                                  .checkName84:
  1880 00000A72 8B46FE                   mov ax, [bp-2]
  1881 00000A75 3B06[2C00]               cmp ax, [LTop]
  1882 00000A79 0F8D2B00                 jge .checkName85
  1883 00000A7D FF76FE                   push word [bp-2]
  1884 00000A80 E813FF                   call adrofname
  1885 00000A83 83C402                   add  sp, 2
  1886 00000A86 8946FC                   mov [bp-4], ax
  1887 00000A89 FF76FC                   push word [bp-4]
  1888 00000A8C 8D062B81                 lea  ax, [symbol]
  1889 00000A90 50                       push ax
  1890 00000A91 E817F7                   call eqstr
  1891 00000A94 83C404                   add  sp, 4
  1892 00000A97 08C0                     or  al, al
  1893 00000A99 0F840600                 je .checkName86
  1894 00000A9D 8B46FE                   mov ax, [bp-2]
  1895 00000AA0 E94700                   jmp .retn
  1896                                  .checkName86:
  1897 00000AA3 FF46FE                   inc  word[bp-2]
  1898                                  
  1899                                  ;-207   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  1900                                  
  1901 00000AA6 EBCA                     jmp .checkName84
  1902                                  .checkName85:
  1903 00000AA8 B80100                   mov ax, 1
  1904 00000AAB 8946FE                   mov [bp-2], ax
  1905                                  .checkName87:
  1906 00000AAE 8B46FE                   mov ax, [bp-2]
  1907 00000AB1 3B06[2A00]               cmp ax, [GTop]
  1908 00000AB5 0F8D2B00                 jge .checkName88
  1909 00000AB9 FF76FE                   push word [bp-2]
  1910 00000ABC E8D7FE                   call adrofname
  1911 00000ABF 83C402                   add  sp, 2
  1912 00000AC2 8946FC                   mov [bp-4], ax
  1913 00000AC5 FF76FC                   push word [bp-4]
  1914 00000AC8 8D062B81                 lea  ax, [symbol]
  1915 00000ACC 50                       push ax
  1916 00000ACD E8DBF6                   call eqstr
  1917 00000AD0 83C404                   add  sp, 4
  1918 00000AD3 08C0                     or  al, al
  1919 00000AD5 0F840600                 je .checkName89
  1920 00000AD9 8B46FE                   mov ax, [bp-2]
  1921 00000ADC E90B00                   jmp .retn
  1922                                  .checkName89:
  1923 00000ADF FF46FE                   inc  word[bp-2]
  1924                                  
  1925                                  ;-208   return 0;
  1926                                  
  1927 00000AE2 EBCA                     jmp .checkName87
  1928                                  .checkName88:
  1929 00000AE4 B80000                   mov ax, 0
  1930 00000AE7 E90000                   jmp .retn
  1931                                  
  1932                                  ;-209 }    
  1933                                  
  1934                                  
  1935                                  ;-210 int typeName() { int m; //0=V,1=*,2=&
  1936                                  
  1937 00000AEA C9                       .retn: LEAVE
  1938 00000AEB C3                       ret
  1939                                  ; ENDP
  1940                                  
  1941                                  typeName:  ; *** PROC ***
  1942                                  
  1943                                  ;-211     issign='S';
  1944                                  
  1945                                  ;Function : typeName, Number of local variables: 1
  1946                                  ;   # type sign width addr used name   list of local variables
  1947                                  ;  200 var sign word   210 NULL m = bp-2;
  1948 00000AEC C8020000                 ENTER  2,0
  1949 00000AF0 B85300                   mov ax, 83
  1950 00000AF3 A2[3500]                 mov byte [issign], al
  1951                                  
  1952                                  ;-212     if(istoken(T_SIGNED))   issign='S';  
  1953                                  
  1954 00000AF6 681302                   push 531
  1955 00000AF9 E89439                   call istoken
  1956 00000AFC 83C402                   add  sp, 2
  1957 00000AFF 08C0                     or  al, al
  1958 00000B01 0F840600                 je .typeName90
  1959 00000B05 B85300                   mov ax, 83
  1960 00000B08 A2[3500]                 mov byte [issign], al
  1961                                  
  1962                                  ;-213     if(istoken(T_UNSIGNED)) issign='U';
  1963                                  
  1964                                  .typeName90:
  1965 00000B0B 681402                   push 532
  1966 00000B0E E87F39                   call istoken
  1967 00000B11 83C402                   add  sp, 2
  1968 00000B14 08C0                     or  al, al
  1969 00000B16 0F840600                 je .typeName91
  1970 00000B1A B85500                   mov ax, 85
  1971 00000B1D A2[3500]                 mov byte [issign], al
  1972                                  
  1973                                  ;-214     iswidth=2;                           
  1974                                  
  1975                                  .typeName91:
  1976 00000B20 B80200                   mov ax, 2
  1977 00000B23 A2[3800]                 mov byte [iswidth], al
  1978                                  
  1979                                  ;-215     if(istoken(T_VOID))     iswidth=0;
  1980                                  
  1981 00000B26 681102                   push 529
  1982 00000B29 E86439                   call istoken
  1983 00000B2C 83C402                   add  sp, 2
  1984 00000B2F 08C0                     or  al, al
  1985 00000B31 0F840600                 je .typeName92
  1986 00000B35 B80000                   mov ax, 0
  1987 00000B38 A2[3800]                 mov byte [iswidth], al
  1988                                  
  1989                                  ;-216     if(istoken(T_CHAR))     iswidth=1;   
  1990                                  
  1991                                  .typeName92:
  1992 00000B3B 681202                   push 530
  1993 00000B3E E84F39                   call istoken
  1994 00000B41 83C402                   add  sp, 2
  1995 00000B44 08C0                     or  al, al
  1996 00000B46 0F840600                 je .typeName93
  1997 00000B4A B80100                   mov ax, 1
  1998 00000B4D A2[3800]                 mov byte [iswidth], al
  1999                                  
  2000                                  ;-217     if(istoken(T_INT))      iswidth=2;
  2001                                  
  2002                                  .typeName93:
  2003 00000B50 680502                   push 517
  2004 00000B53 E83A39                   call istoken
  2005 00000B56 83C402                   add  sp, 2
  2006 00000B59 08C0                     or  al, al
  2007 00000B5B 0F840600                 je .typeName94
  2008 00000B5F B80200                   mov ax, 2
  2009 00000B62 A2[3800]                 mov byte [iswidth], al
  2010                                  
  2011                                  ;-218     if(istoken(T_LONG))     iswidth=4;
  2012                                  
  2013                                  .typeName94:
  2014 00000B65 681502                   push 533
  2015 00000B68 E82539                   call istoken
  2016 00000B6B 83C402                   add  sp, 2
  2017 00000B6E 08C0                     or  al, al
  2018 00000B70 0F840600                 je .typeName95
  2019 00000B74 B80400                   mov ax, 4
  2020 00000B77 A2[3800]                 mov byte [iswidth], al
  2021                                  
  2022                                  ;-219     istype='V'; 
  2023                                  
  2024                                  .typeName95:
  2025 00000B7A B85600                   mov ax, 86
  2026 00000B7D A2[3200]                 mov byte [istype], al
  2027                                  
  2028                                  ;-220     m=0;
  2029                                  
  2030 00000B80 B80000                   mov ax, 0
  2031 00000B83 8946FE                   mov [bp-2], ax
  2032                                  
  2033                                  ;-221     if(istoken('*'))  {istype='*'; m=1;} 
  2034                                  
  2035 00000B86 6A2A                     push 42
  2036 00000B88 E80539                   call istoken
  2037 00000B8B 83C402                   add  sp, 2
  2038 00000B8E 08C0                     or  al, al
  2039 00000B90 0F840C00                 je .typeName96
  2040 00000B94 B82A00                   mov ax, 42
  2041 00000B97 A2[3200]                 mov byte [istype], al
  2042 00000B9A B80100                   mov ax, 1
  2043 00000B9D 8946FE                   mov [bp-2], ax
  2044                                  
  2045                                  ;-222     if(istoken('&'))  {istype='&'; m=2;}
  2046                                  
  2047                                  .typeName96:
  2048 00000BA0 6A26                     push 38
  2049 00000BA2 E8EB38                   call istoken
  2050 00000BA5 83C402                   add  sp, 2
  2051 00000BA8 08C0                     or  al, al
  2052 00000BAA 0F840C00                 je .typeName97
  2053 00000BAE B82600                   mov ax, 38
  2054 00000BB1 A2[3200]                 mov byte [istype], al
  2055 00000BB4 B80200                   mov ax, 2
  2056 00000BB7 8946FE                   mov [bp-2], ax
  2057                                  
  2058                                  ;-223     name1(); 
  2059                                  
  2060                                  .typeName97:
  2061 00000BBA E80800                   call name1
  2062                                  
  2063                                  ;-224     return m; 
  2064                                  
  2065 00000BBD 8B46FE                   mov ax, [bp-2]
  2066 00000BC0 E90000                   jmp .retn
  2067                                  
  2068                                  ;-225 }
  2069                                  
  2070                                  
  2071                                  ;-226 int name1() {
  2072                                  
  2073 00000BC3 C9                       .retn: LEAVE
  2074 00000BC4 C3                       ret
  2075                                  ; ENDP
  2076                                  
  2077                                  name1:  ; *** PROC ***
  2078                                  
  2079                                  ;-227     if (token!=T_NAME) error1("Name expected"); 
  2080                                  
  2081 00000BC5 A1[1C00]                 mov ax, [token]
  2082 00000BC8 3D0001                   cmp ax, 256
  2083 00000BCB 0F840900                 je  .name198
  2084 00000BCF 68[DF0B]                 push name1_0
  2085 00000BD2 E8D93C                   call error1
  2086 00000BD5 83C402                   add  sp, 2
  2087                                  
  2088                                  ;-228     token=getlex(); 
  2089                                  
  2090                                  .name198:
  2091 00000BD8 E89131                   call getlex
  2092 00000BDB A3[1C00]                 mov word [token], ax
  2093                                  
  2094                                  ;-229 }
  2095                                  
  2096                                  
  2097                                  ;-230 
  2098                                  
  2099                                  
  2100                                  ;-231 int storecall() { int i; if (CTop >= CALLMAX) error1("Call table full");
  2101                                  
  2102 00000BDE C3                       ret
  2103                                  ; ENDP
  2104 00000BDF 4E616D652065787065-     name1_0 db "Name expected",0
  2105 00000BE8 6374656400         
  2106                                  
  2107                                  storecall:  ; *** PROC ***
  2108                                  ;Function : storecall, Number of local variables: 1
  2109                                  ;   # type sign width addr used name   list of local variables
  2110                                  ;  200 var sign word   231 NULL i = bp-2;
  2111 00000BED C8020000                 ENTER  2,0
  2112 00000BF1 A1[3D00]                 mov ax, [CTop]
  2113 00000BF4 3DD007                   cmp ax, 2000 ;unsigned : 1
  2114 00000BF7 0F8C0900                 jl  .storecall99
  2115 00000BFB 68[5F0C]                 push storecall_0
  2116 00000BFE E8AD3C                   call error1
  2117 00000C01 83C402                   add  sp, 2
  2118                                  
  2119                                  ;-232   if (CNameTop >= 65468) error1("Call name table fuill");
  2120                                  
  2121                                  .storecall99:
  2122 00000C04 A1[6000]                 mov ax, [CNameTop]
  2123 00000C07 3DBCFF                   cmp ax, 65468 ;unsigned : 0
  2124 00000C0A 0F820900                 jb  .storecall100
  2125 00000C0E 68[6F0C]                 push storecall_1
  2126 00000C11 E89A3C                   call error1
  2127 00000C14 83C402                   add  sp, 2
  2128                                  
  2129                                  ;-233     CType[CTop]=0;  CAdr [CTop]=CNameTop; i=strlen(symbol);
  2130                                  
  2131                                  .storecall100:
  2132 00000C17 B80000                   mov ax, 0
  2133 00000C1A 8B1E[3D00]               mov bx, [CTop]
  2134 00000C1E 88872FA1                 mov [CType+bx], al
  2135 00000C22 A1[6000]                 mov ax, [CNameTop]
  2136 00000C25 8B1E[3D00]               mov bx, [CTop]
  2137 00000C29 D1E3                     shl bx, 1
  2138 00000C2B 898757AB                 mov [CAdr+bx], ax
  2139 00000C2F 8D062B81                 lea  ax, [symbol]
  2140 00000C33 50                       push ax
  2141 00000C34 E81CF5                   call strlen
  2142 00000C37 83C402                   add  sp, 2
  2143 00000C3A 8946FE                   mov [bp-2], ax
  2144                                  
  2145                                  ;-234     to_far(CNameTop, symbol);
  2146                                  
  2147 00000C3D 8D062B81                 lea  ax, [symbol]
  2148 00000C41 50                       push ax
  2149 00000C42 FF36[6000]               push word [CNameTop]
  2150 00000C46 E8BE47                   call to_far
  2151 00000C49 83C404                   add  sp, 4
  2152                                  
  2153                                  ;-235     CNameTop=CNameTop+i; CNameTop++; CTop++;
  2154                                  
  2155 00000C4C A1[6000]                 mov ax, [CNameTop]
  2156 00000C4F 0346FE                   add ax, [bp-2]
  2157 00000C52 A3[6000]                 mov word [CNameTop], ax
  2158 00000C55 FF06[6000]               inc  word[CNameTop]
  2159 00000C59 FF06[3D00]               inc  word[CTop]
  2160                                  
  2161                                  ;-236 }
  2162                                  
  2163                                  
  2164                                  ;-237 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
  2165 00000C5D C9                       LEAVE
  2166 00000C5E C3                       ret
  2167                                  ; ENDP
  2168 00000C5F 43616C6C207461626C-     storecall_0 db "Call table full",0
  2169 00000C68 652066756C6C00     
  2170 00000C6F 43616C6C206E616D65-     storecall_1 db "Call name table fuill",0
  2171 00000C78 207461626C65206675-
  2172 00000C81 696C6C00           
  2173                                  
  2174                                  storefunc:  ; *** PROC ***
  2175 00000C85 A1[3B00]                 mov ax, [FTop]
  2176 00000C88 3D2C01                   cmp ax, 300 ;unsigned : 1
  2177 00000C8B 0F8C0900                 jl  .storefunc101
  2178 00000C8F 68[E60C]                 push storefunc_0
  2179 00000C92 E8193C                   call error1
  2180 00000C95 83C402                   add  sp, 2
  2181                                  
  2182                                  ;-238     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;
  2183                                  
  2184                                  .storefunc101:
  2185 00000C98 A1[6600]                 mov ax, [lineno]
  2186 00000C9B 83E801                   sub ax, 1
  2187 00000C9E 8B1E[3B00]               mov bx, [FTop]
  2188 00000CA2 D1E3                     shl bx, 1
  2189 00000CA4 8987FFA8                 mov [FAdr+bx], ax
  2190 00000CA8 B80000                   mov ax, 0
  2191 00000CAB 8B1E[3B00]               mov bx, [FTop]
  2192 00000CAF D1E3                     shl bx, 1
  2193 00000CB1 8987F7BA                 mov [FCalls+bx], ax
  2194 00000CB5 A0[3800]                 mov al, [iswidth]
  2195 00000CB8 8B1E[3B00]               mov bx, [FTop]
  2196 00000CBC 888703A0                 mov [FType+bx], al
  2197                                  
  2198                                  ;-239     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;
  2199                                  
  2200 00000CC0 FF36[3B00]               push word [FTop]
  2201 00000CC4 8D064FBD                 lea  ax, [FNameField]
  2202 00000CC8 50                       push ax
  2203 00000CC9 E8DEFC                   call adrF
  2204 00000CCC 83C404                   add  sp, 4
  2205 00000CCF A3[6A00]                 mov word [pt], ax
  2206 00000CD2 8D062B81                 lea  ax, [symbol]
  2207 00000CD6 50                       push ax
  2208 00000CD7 FF36[6A00]               push word [pt]
  2209 00000CDB E89DF4                   call strcpy
  2210 00000CDE 83C404                   add  sp, 4
  2211 00000CE1 FF06[3B00]               inc  word[FTop]
  2212                                  
  2213                                  ;-240 }
  2214                                  
  2215                                  
  2216                                  ;-241 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");
  2217                                  
  2218 00000CE5 C3                       ret
  2219                                  ; ENDP
  2220 00000CE6 46756E6374696F6E20-     storefunc_0 db "Function table full",0
  2221 00000CEF 7461626C652066756C-
  2222 00000CF8 6C00               
  2223                                  
  2224                                  addlocal:  ; *** PROC ***
  2225 00000CFA A1[2C00]                 mov ax, [LTop]
  2226 00000CFD 3D2C01                   cmp ax, 300 ;unsigned : 1
  2227 00000D00 0F8C0900                 jl  .addlocal102
  2228 00000D04 68[800D]                 push addlocal_0
  2229 00000D07 E8A43B                   call error1
  2230 00000D0A 83C402                   add  sp, 2
  2231                                  
  2232                                  ;-242   if (checkName() != 0) error1("Variable already defined");
  2233                                  
  2234                                  .addlocal102:
  2235 00000D0D E858FD                   call checkName
  2236 00000D10 83F800                   cmp ax, 0
  2237 00000D13 0F840900                 je  .addlocal103
  2238 00000D17 68[9A0D]                 push addlocal_1
  2239 00000D1A E8913B                   call error1
  2240 00000D1D 83C402                   add  sp, 2
  2241                                  
  2242                                  ;-243   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;
  2243                                  
  2244                                  .addlocal103:
  2245 00000D20 A0[3500]                 mov al, [issign]
  2246 00000D23 8B1E[2C00]               mov bx, [LTop]
  2247 00000D27 8887E383                 mov [GSign+bx], al
  2248 00000D2B A0[3800]                 mov al, [iswidth]
  2249 00000D2E 8B1E[2C00]               mov bx, [LTop]
  2250 00000D32 88870F85                 mov [GWidth+bx], al
  2251 00000D36 A0[3200]                 mov al, [istype]
  2252 00000D39 8B1E[2C00]               mov bx, [LTop]
  2253 00000D3D 8887B782                 mov [GType+bx], al
  2254                                  
  2255                                  ;-244   GAdr [LTop]=lineno-1; GUsed[LTop]=0;
  2256                                  
  2257 00000D41 A1[6600]                 mov ax, [lineno]
  2258 00000D44 83E801                   sub ax, 1
  2259 00000D47 8B1E[2C00]               mov bx, [LTop]
  2260 00000D4B D1E3                     shl bx, 1
  2261 00000D4D 89873B86                 mov [GAdr+bx], ax
  2262 00000D51 B80000                   mov ax, 0
  2263 00000D54 8B1E[2C00]               mov bx, [LTop]
  2264 00000D58 D1E3                     shl bx, 1
  2265 00000D5A 89879388                 mov [GUsed+bx], ax
  2266                                  
  2267                                  ;-245   pt=adrF(GNameField, LTop); strcpy(pt, symbol);
  2268                                  
  2269 00000D5E FF36[2C00]               push word [LTop]
  2270 00000D62 8D06438D                 lea  ax, [GNameField]
  2271 00000D66 50                       push ax
  2272 00000D67 E840FC                   call adrF
  2273 00000D6A 83C404                   add  sp, 4
  2274 00000D6D A3[6A00]                 mov word [pt], ax
  2275 00000D70 8D062B81                 lea  ax, [symbol]
  2276 00000D74 50                       push ax
  2277 00000D75 FF36[6A00]               push word [pt]
  2278 00000D79 E8FFF3                   call strcpy
  2279 00000D7C 83C404                   add  sp, 4
  2280                                  
  2281                                  ;-246 }
  2282                                  
  2283                                  
  2284                                  ;-247 int checkFunction() { unsigned int i; unsigned int j; i=0;
  2285                                  
  2286 00000D7F C3                       ret
  2287                                  ; ENDP
  2288 00000D80 4C6F63616C20766172-     addlocal_0 db "Local variable table full",0
  2289 00000D89 6961626C6520746162-
  2290 00000D92 6C652066756C6C00   
  2291 00000D9A 5661726961626C6520-     addlocal_1 db "Variable already defined",0
  2292 00000DA3 616C72656164792064-
  2293 00000DAC 6566696E656400     
  2294                                  
  2295                                  checkFunction:  ; *** PROC ***
  2296                                  ;Function : checkFunction, Number of local variables: 2
  2297                                  ;   # type sign width addr used name   list of local variables
  2298                                  ;  200 var unsg word   247 NULL i = bp-2
  2299                                  ;  201 var unsg word   247 NULL j = bp-4;
  2300 00000DB3 C8040000                 ENTER  4,0
  2301 00000DB7 B80000                   mov ax, 0
  2302 00000DBA 8946FE                   mov [bp-2], ax
  2303                                  
  2304                                  ;-248   while (i < FTop) { j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}
  2305                                  
  2306                                  .checkFunction104:
  2307 00000DBD 8B46FE                   mov ax, [bp-2]
  2308 00000DC0 3B06[3B00]               cmp ax, [FTop]
  2309 00000DC4 0F8D3000                 jge .checkFunction105
  2310 00000DC8 FF76FE                   push word [bp-2]
  2311 00000DCB 8D064FBD                 lea  ax, [FNameField]
  2312 00000DCF 50                       push ax
  2313 00000DD0 E8D7FB                   call adrF
  2314 00000DD3 83C404                   add  sp, 4
  2315 00000DD6 8946FC                   mov [bp-4], ax
  2316 00000DD9 FF76FC                   push word [bp-4]
  2317 00000DDC 8D062B81                 lea  ax, [symbol]
  2318 00000DE0 50                       push ax
  2319 00000DE1 E8C7F3                   call eqstr
  2320 00000DE4 83C404                   add  sp, 4
  2321 00000DE7 08C0                     or  al, al
  2322 00000DE9 0F840600                 je .checkFunction106
  2323 00000DED 8B46FE                   mov ax, [bp-2]
  2324 00000DF0 E90B00                   jmp .retn
  2325                                  .checkFunction106:
  2326 00000DF3 FF46FE                   inc  word[bp-2]
  2327                                  
  2328                                  ;-249   return 0; }
  2329                                  
  2330 00000DF6 EBC5                     jmp .checkFunction104
  2331                                  .checkFunction105:
  2332 00000DF8 B80000                   mov ax, 0
  2333 00000DFB E90000                   jmp .retn
  2334                                  
  2335                                  ;-250 int dofunc() { int nloc; int i; int narg;  
  2336                                  
  2337 00000DFE C9                       .retn: LEAVE
  2338 00000DFF C3                       ret
  2339                                  ; ENDP
  2340                                  
  2341                                  dofunc:  ; *** PROC ***
  2342                                  
  2343                                  ;-251   cloc=&co; 
  2344                                  
  2345                                  ;Function : dofunc, Number of local variables: 3
  2346                                  ;   # type sign width addr used name   list of local variables
  2347                                  ;  200 var sign word   250 NULL nloc = bp-2
  2348                                  ;  201 var sign word   250 NULL i = bp-4
  2349                                  ;  202 var sign word   250 NULL narg = bp-6;
  2350 00000E00 C8060000                 ENTER  6,0
  2351 00000E04 B83075                   mov ax, co
  2352 00000E07 A3[1600]                 mov word [cloc], ax
  2353                                  
  2354                                  ;-252   checknamelen();
  2355                                  
  2356 00000E0A E857F6                   call checknamelen
  2357                                  
  2358                                  ;-253   strcpy(fname, symbol);
  2359                                  
  2360 00000E0D 8D062B81                 lea  ax, [symbol]
  2361 00000E11 50                       push ax
  2362 00000E12 8D06AB81                 lea  ax, [fname]
  2363 00000E16 50                       push ax
  2364 00000E17 E861F3                   call strcpy
  2365 00000E1A 83C404                   add  sp, 4
  2366                                  
  2367                                  ;-254   if (checkFunction() ) error1("Function already defined");
  2368                                  
  2369 00000E1D E893FF                   call checkFunction
  2370 00000E20 08C0                     or  al, al
  2371 00000E22 0F840900                 je .dofunc107
  2372 00000E26 68[3710]                 push dofunc_0
  2373 00000E29 E8823A                   call error1
  2374 00000E2C 83C402                   add  sp, 2
  2375                                  
  2376                                  ;-255   storefunc();
  2377                                  
  2378                                  .dofunc107:
  2379 00000E2F E853FE                   call storefunc
  2380                                  
  2381                                  ;-256   prs("\n\n"); prs(symbol); prs(":  ; *** PROC ***");
  2382                                  
  2383 00000E32 68[5010]                 push dofunc_1
  2384 00000E35 E88D37                   call prs
  2385 00000E38 83C402                   add  sp, 2
  2386 00000E3B 8D062B81                 lea  ax, [symbol]
  2387 00000E3F 50                       push ax
  2388 00000E40 E88237                   call prs
  2389 00000E43 83C402                   add  sp, 2
  2390 00000E46 68[5510]                 push dofunc_2
  2391 00000E49 E87937                   call prs
  2392 00000E4C 83C402                   add  sp, 2
  2393                                  
  2394                                  ;-257   expect('('); LTop=LSTART;  i=0;
  2395                                  
  2396 00000E4F 6A28                     push 40
  2397 00000E51 E85E36                   call expect
  2398 00000E54 83C402                   add  sp, 2
  2399 00000E57 B8C800                   mov ax, 200
  2400 00000E5A A3[2C00]                 mov word [LTop], ax
  2401 00000E5D B80000                   mov ax, 0
  2402 00000E60 8946FC                   mov [bp-4], ax
  2403                                  
  2404                                  ;-258   if (istoken(')')==0) { narg=2; 
  2405                                  
  2406 00000E63 6A29                     push 41
  2407 00000E65 E82836                   call istoken
  2408 00000E68 83C402                   add  sp, 2
  2409 00000E6B 83F800                   cmp ax, 0
  2410 00000E6E 0F854600                 jne .dofunc108
  2411 00000E72 B80200                   mov ax, 2
  2412 00000E75 8946FA                   mov [bp-6], ax
  2413                                  
  2414                                  ;-259     do { typeName();  addlocal(); narg+=2;
  2415                                  
  2416                                  .dofunc109:
  2417 00000E78 E871FC                   call typeName
  2418 00000E7B E87CFE                   call addlocal
  2419 00000E7E 8346FA02                 add  word[bp-6], 2
  2420                                  
  2421                                  ;-260          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }
  2422                                  
  2423 00000E82 8B46FA                   mov ax, [bp-6]
  2424 00000E85 8B1E[2C00]               mov bx, [LTop]
  2425 00000E89 D1E3                     shl bx, 1
  2426 00000E8B 8987EB8A                 mov [GData+bx], ax
  2427 00000E8F A0[3800]                 mov al, [iswidth]
  2428 00000E92 3C04                     cmp al, 4
  2429 00000E94 0F850400                 jne .dofunc110
  2430 00000E98 8346FA02                 add  word[bp-6], 2
  2431                                  .dofunc110:
  2432 00000E9C FF06[2C00]               inc  word[LTop]
  2433                                  
  2434                                  ;-261     while (istoken(','));  expect(')'); }
  2435                                  
  2436 00000EA0 6A2C                     push 44
  2437 00000EA2 E8EB35                   call istoken
  2438 00000EA5 83C402                   add  sp, 2
  2439 00000EA8 08C0                     or  al, al
  2440 00000EAA 0F840200                 je .dofunc111
  2441 00000EAE EBC8                     jmp .dofunc109
  2442                                  .dofunc111:
  2443 00000EB0 6A29                     push 41
  2444 00000EB2 E8FD35                   call expect
  2445 00000EB5 83C402                   add  sp, 2
  2446                                  
  2447                                  ;-262     
  2448                                  
  2449                                  
  2450                                  ;-263   expect('{'); /*body*/
  2451                                  
  2452                                  .dofunc108:
  2453 00000EB8 6A7B                     push 123
  2454 00000EBA E8F535                   call expect
  2455 00000EBD 83C402                   add  sp, 2
  2456                                  
  2457                                  ;-264   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */
  2458                                  
  2459 00000EC0 B80000                   mov ax, 0
  2460 00000EC3 8946FE                   mov [bp-2], ax
  2461 00000EC6 B80000                   mov ax, 0
  2462 00000EC9 A3[2600]                 mov word [nreturn], ax
  2463 00000ECC B80000                   mov ax, 0
  2464 00000ECF A3[2400]                 mov word [nconst], ax
  2465 00000ED2 B80000                   mov ax, 0
  2466 00000ED5 8946FC                   mov [bp-4], ax
  2467                                  
  2468                                  ;-265   while(isvariable()) {
  2469                                  
  2470                                  .dofunc112:
  2471 00000ED8 E8BC01                   call isvariable
  2472 00000EDB 08C0                     or  al, al
  2473 00000EDD 0F849200                 je .dofunc113
  2474                                  
  2475                                  ;-266     do {typeName();
  2476                                  
  2477                                  .dofunc114:
  2478 00000EE1 E808FC                   call typeName
  2479                                  
  2480                                  ;-267         checknamelen();
  2481                                  
  2482 00000EE4 E87DF5                   call checknamelen
  2483                                  
  2484                                  ;-268         addlocal(); nloc-=2;
  2485                                  
  2486 00000EE7 E810FE                   call addlocal
  2487 00000EEA 836EFE02                 sub  word[bp-2], 2
  2488                                  
  2489                                  ;-269         if (iswidth == 4) nloc-=2;
  2490                                  
  2491 00000EEE A0[3800]                 mov al, [iswidth]
  2492 00000EF1 3C04                     cmp al, 4
  2493 00000EF3 0F850400                 jne .dofunc115
  2494 00000EF7 836EFE02                 sub  word[bp-2], 2
  2495                                  
  2496                                  ;-270         GData[LTop]=nloc;
  2497                                  
  2498                                  .dofunc115:
  2499 00000EFB 8B46FE                   mov ax, [bp-2]
  2500 00000EFE 8B1E[2C00]               mov bx, [LTop]
  2501 00000F02 D1E3                     shl bx, 1
  2502 00000F04 8987EB8A                 mov [GData+bx], ax
  2503                                  
  2504                                  ;-271         if (istoken('[')){istype='&';GType[LTop]='&';expect(T_CONST);expect(']');
  2505                                  
  2506 00000F08 6A5B                     push 91
  2507 00000F0A E88335                   call istoken
  2508 00000F0D 83C402                   add  sp, 2
  2509 00000F10 08C0                     or  al, al
  2510 00000F12 0F843D00                 je .dofunc116
  2511 00000F16 B82600                   mov ax, 38
  2512 00000F19 A2[3200]                 mov byte [istype], al
  2513 00000F1C B82600                   mov ax, 38
  2514 00000F1F 8B1E[2C00]               mov bx, [LTop]
  2515 00000F23 8887B782                 mov [GType+bx], al
  2516 00000F27 680101                   push 257
  2517 00000F2A E88535                   call expect
  2518 00000F2D 83C402                   add  sp, 2
  2519 00000F30 6A5D                     push 93
  2520 00000F32 E87D35                   call expect
  2521 00000F35 83C402                   add  sp, 2
  2522                                  
  2523                                  ;-272             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc; }
  2524                                  
  2525 00000F38 8B46FE                   mov ax, [bp-2]
  2526 00000F3B 2B06[2E00]               sub ax, [lexval]
  2527 00000F3F 8946FE                   mov [bp-2], ax
  2528 00000F42 8346FE02                 add  word[bp-2], 2
  2529 00000F46 8B46FE                   mov ax, [bp-2]
  2530 00000F49 8B1E[2C00]               mov bx, [LTop]
  2531 00000F4D D1E3                     shl bx, 1
  2532 00000F4F 8987EB8A                 mov [GData+bx], ax
  2533                                  
  2534                                  ;-273         LTop++;
  2535                                  
  2536                                  .dofunc116:
  2537 00000F53 FF06[2C00]               inc  word[LTop]
  2538                                  
  2539                                  ;-274       } while (istoken(',')); expect(';'); }
  2540                                  
  2541 00000F57 6A2C                     push 44
  2542 00000F59 E83435                   call istoken
  2543 00000F5C 83C402                   add  sp, 2
  2544 00000F5F 08C0                     or  al, al
  2545 00000F61 0F840300                 je .dofunc117
  2546 00000F65 E979FF                   jmp .dofunc114
  2547                                  .dofunc117:
  2548 00000F68 6A3B                     push 59
  2549 00000F6A E84535                   call expect
  2550 00000F6D 83C402                   add  sp, 2
  2551                                  
  2552                                  ;-275   listproc(); 
  2553                                  
  2554 00000F70 E965FF                   jmp .dofunc112
  2555                                  .dofunc113:
  2556 00000F73 E83A3A                   call listproc
  2557                                  
  2558                                  ;-276   if (LTop>LSTART){prs(";\n ENTER  "); 
  2559                                  
  2560 00000F76 A1[2C00]                 mov ax, [LTop]
  2561 00000F79 3DC800                   cmp ax, 200
  2562 00000F7C 0F8E2700                 jle .dofunc118
  2563 00000F80 68[6710]                 push dofunc_3
  2564 00000F83 E83F36                   call prs
  2565 00000F86 83C402                   add  sp, 2
  2566                                  
  2567                                  ;-277     nloc=mkneg(nloc); pint1 (nloc); prs(",0"); }
  2568                                  
  2569 00000F89 FF76FE                   push word [bp-2]
  2570 00000F8C E833F1                   call mkneg
  2571 00000F8F 83C402                   add  sp, 2
  2572 00000F92 8946FE                   mov [bp-2], ax
  2573 00000F95 FF76FE                   push word [bp-2]
  2574 00000F98 E82137                   call pint1
  2575 00000F9B 83C402                   add  sp, 2
  2576 00000F9E 68[7310]                 push dofunc_4
  2577 00000FA1 E82136                   call prs
  2578 00000FA4 83C402                   add  sp, 2
  2579                                  
  2580                                  ;-278   while(istoken('}')==0)   stmt();
  2581                                  
  2582                                  .dofunc118:
  2583                                  .dofunc119:
  2584 00000FA7 6A7D                     push 125
  2585 00000FA9 E8E434                   call istoken
  2586 00000FAC 83C402                   add  sp, 2
  2587 00000FAF 83F800                   cmp ax, 0
  2588 00000FB2 0F850500                 jne .dofunc120
  2589 00000FB6 E85228                   call stmt
  2590                                  
  2591                                  ;-279   if (nreturn) { prs("\n .retn:");}
  2592                                  
  2593 00000FB9 EBEC                     jmp .dofunc119
  2594                                  .dofunc120:
  2595 00000FBB A1[2600]                 mov ax, [nreturn]
  2596 00000FBE 08C0                     or  al, al
  2597 00000FC0 0F840900                 je .dofunc121
  2598 00000FC4 68[7610]                 push dofunc_5
  2599 00000FC7 E8FB35                   call prs
  2600 00000FCA 83C402                   add  sp, 2
  2601                                  
  2602                                  ;-280   if (LTop > LSTART) prs(" LEAVE");
  2603                                  
  2604                                  .dofunc121:
  2605 00000FCD A1[2C00]                 mov ax, [LTop]
  2606 00000FD0 3DC800                   cmp ax, 200
  2607 00000FD3 0F8E0900                 jle .dofunc122
  2608 00000FD7 68[8010]                 push dofunc_6
  2609 00000FDA E8E835                   call prs
  2610 00000FDD 83C402                   add  sp, 2
  2611                                  
  2612                                  ;-281   prs("\n ret"); prs("\n; ENDP"); 
  2613                                  
  2614                                  .dofunc122:
  2615 00000FE0 68[8710]                 push dofunc_7
  2616 00000FE3 E8DF35                   call prs
  2617 00000FE6 83C402                   add  sp, 2
  2618 00000FE9 68[8E10]                 push dofunc_8
  2619 00000FEC E8D635                   call prs
  2620 00000FEF 83C402                   add  sp, 2
  2621                                  
  2622                                  ;-282   *cloc=0; prs(co); maxco1=strlen(co);
  2623                                  
  2624 00000FF2 B80000                   mov ax, 0
  2625 00000FF5 8B1E[1600]               mov  bx, [cloc]
  2626 00000FF9 8807                     mov  [bx], al
  2627 00000FFB 8D063075                 lea  ax, [co]
  2628 00000FFF 50                       push ax
  2629 00001000 E8C235                   call prs
  2630 00001003 83C402                   add  sp, 2
  2631 00001006 8D063075                 lea  ax, [co]
  2632 0000100A 50                       push ax
  2633 0000100B E845F1                   call strlen
  2634 0000100E 83C402                   add  sp, 2
  2635 00001011 A3[1400]                 mov word [maxco1], ax
  2636                                  
  2637                                  ;-283   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }
  2638                                  
  2639 00001014 A1[1400]                 mov ax, [maxco1]
  2640 00001017 3B06[1200]               cmp ax, [maxco]
  2641 0000101B 0F8E1600                 jle .dofunc123
  2642 0000101F A1[1400]                 mov ax, [maxco1]
  2643 00001022 A3[1200]                 mov word [maxco], ax
  2644 00001025 8D06AB81                 lea  ax, [fname]
  2645 00001029 50                       push ax
  2646 0000102A 8D06E880                 lea  ax, [coname]
  2647 0000102E 50                       push ax
  2648 0000102F E849F1                   call strcpy
  2649 00001032 83C404                   add  sp, 4
  2650                                  
  2651                                  ;-284 }
  2652                                  
  2653                                  .dofunc123:
  2654                                  
  2655                                  ;-285 int isvariable() {
  2656 00001035 C9                       LEAVE
  2657 00001036 C3                       ret
  2658                                  ; ENDP
  2659 00001037 46756E6374696F6E20-     dofunc_0 db "Function already defined",0
  2660 00001040 616C72656164792064-
  2661 00001049 6566696E656400     
  2662 00001050 5C6E5C6E00              dofunc_1 db "\n\n",0
  2663 00001055 3A20203B202A2A2A20-     dofunc_2 db ":  ; *** PROC ***",0
  2664 0000105E 50524F43202A2A2A00 
  2665 00001067 3B5C6E20454E544552-     dofunc_3 db ";\n ENTER  ",0
  2666 00001070 202000             
  2667 00001073 2C3000                  dofunc_4 db ",0",0
  2668 00001076 5C6E202E7265746E3A-     dofunc_5 db "\n .retn:",0
  2669 0000107F 00                 
  2670 00001080 204C4541564500          dofunc_6 db " LEAVE",0
  2671 00001087 5C6E2072657400          dofunc_7 db "\n ret",0
  2672 0000108E 5C6E3B20454E445000      dofunc_8 db "\n; ENDP",0
  2673                                  
  2674                                  isvariable:  ; *** PROC ***
  2675                                  
  2676                                  ;-286     if(token==T_SIGNED)   goto v1;   
  2677                                  
  2678 00001097 A1[1C00]                 mov ax, [token]
  2679 0000109A 3D1302                   cmp ax, 531
  2680 0000109D 0F850300                 jne .isvariable124
  2681 000010A1 E93A00                   jmp .v1
  2682                                  
  2683                                  ;-287     if(token==T_UNSIGNED) goto v1;
  2684                                  
  2685                                  .isvariable124:
  2686 000010A4 A1[1C00]                 mov ax, [token]
  2687 000010A7 3D1402                   cmp ax, 532
  2688 000010AA 0F850300                 jne .isvariable125
  2689 000010AE E92D00                   jmp .v1
  2690                                  
  2691                                  ;-288     if(token==T_CHAR)     goto v1;   
  2692                                  
  2693                                  .isvariable125:
  2694 000010B1 A1[1C00]                 mov ax, [token]
  2695 000010B4 3D1202                   cmp ax, 530
  2696 000010B7 0F850300                 jne .isvariable126
  2697 000010BB E92000                   jmp .v1
  2698                                  
  2699                                  ;-289     if(token==T_INT)      goto v1;
  2700                                  
  2701                                  .isvariable126:
  2702 000010BE A1[1C00]                 mov ax, [token]
  2703 000010C1 3D0502                   cmp ax, 517
  2704 000010C4 0F850300                 jne .isvariable127
  2705 000010C8 E91300                   jmp .v1
  2706                                  
  2707                                  ;-290     if(token==T_LONG)     goto v1;
  2708                                  
  2709                                  .isvariable127:
  2710 000010CB A1[1C00]                 mov ax, [token]
  2711 000010CE 3D1502                   cmp ax, 533
  2712 000010D1 0F850300                 jne .isvariable128
  2713 000010D5 E90600                   jmp .v1
  2714                                  
  2715                                  ;-291     return 0;  
  2716                                  
  2717                                  .isvariable128:
  2718 000010D8 B80000                   mov ax, 0
  2719 000010DB E90600                   jmp .retn
  2720                                  
  2721                                  ;-292 v1: return 1;
  2722                                  
  2723                                  .v1:
  2724 000010DE B80100                   mov ax, 1
  2725 000010E1 E90000                   jmp .retn
  2726                                  
  2727                                  ;-293 }
  2728                                  
  2729                                  
  2730                                  ;-294                   
  2731                                  
  2732                                  
  2733                                  ;-295 int mod1; int ireg1; int idx1; int ids1; int idw1; int idt1; int val1;
  2734                                  
  2735                                   .retn:
  2736 000010E4 C3                       ret
  2737                                  ; ENDP
  2738 000010E5 0000                    mod1 dw 0
  2739 000010E7 0000                    ireg1 dw 0
  2740 000010E9 0000                    idx1 dw 0
  2741 000010EB 0000                    ids1 dw 0
  2742 000010ED 0000                    idw1 dw 0
  2743 000010EF 0000                    idt1 dw 0
  2744 000010F1 0000                    val1 dw 0
  2745                                  
  2746                                  ;-296 int mod2; int ireg2; int idx2; int ids2; int idw2; int idt2; int val2;
  2747                                  
  2748 000010F3 0000                    mod2 dw 0
  2749 000010F5 0000                    ireg2 dw 0
  2750 000010F7 0000                    idx2 dw 0
  2751 000010F9 0000                    ids2 dw 0
  2752 000010FB 0000                    idw2 dw 0
  2753 000010FD 0000                    idt2 dw 0
  2754 000010FF 0000                    val2 dw 0
  2755                                  
  2756                                  ;-297 
  2757                                  
  2758                                  
  2759                                  ;-298 int pexpr() {expect('('); iscmp=0; 
  2760                                  
  2761                                  
  2762                                  pexpr:  ; *** PROC ***
  2763 00001101 6A28                     push 40
  2764 00001103 E8AC33                   call expect
  2765 00001106 83C402                   add  sp, 2
  2766 00001109 B80000                   mov ax, 0
  2767 0000110C A3[2200]                 mov word [iscmp], ax
  2768                                  
  2769                                  ;-299   if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}
  2770                                  
  2771 0000110F A1[1C00]                 mov ax, [token]
  2772 00001112 3D0001                   cmp ax, 256
  2773 00001115 0F853400                 jne .pexpr129
  2774 00001119 68[7711]                 push pexpr_0
  2775 0000111C 8D062B81                 lea  ax, [symbol]
  2776 00001120 50                       push ax
  2777 00001121 E887F0                   call eqstr
  2778 00001124 83C404                   add  sp, 4
  2779 00001127 08C0                     or  al, al
  2780 00001129 0F840600                 je .pexpr130
  2781 0000112D E85E00                   call constantexpr
  2782 00001130 E94300                   jmp .retn
  2783                                  
  2784                                  ;-300     ireg1=checkreg();
  2785                                  
  2786                                  .pexpr130:
  2787 00001133 E89A07                   call checkreg
  2788 00001136 A3[E710]                 mov word [ireg1], ax
  2789                                  
  2790                                  ;-301     if (ireg1) { doreg1(1); return; }  }
  2791                                  
  2792 00001139 A1[E710]                 mov ax, [ireg1]
  2793 0000113C 08C0                     or  al, al
  2794 0000113E 0F840B00                 je .pexpr131
  2795 00001142 6A01                     push 1
  2796 00001144 E89D05                   call doreg1
  2797 00001147 83C402                   add  sp, 2
  2798 0000114A E92900                   jmp .retn
  2799                                  .pexpr131:
  2800                                  
  2801                                  ;-302   exprstart(); if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);
  2802                                  
  2803                                  .pexpr129:
  2804 0000114D E83D01                   call exprstart
  2805 00001150 A1[2200]                 mov ax, [iscmp]
  2806 00001153 83F800                   cmp ax, 0
  2807 00001156 0F850900                 jne .pexpr132
  2808 0000115A 68[7911]                 push pexpr_1
  2809 0000115D E86534                   call prs
  2810 00001160 83C402                   add  sp, 2
  2811                                  .pexpr132:
  2812 00001163 8D06AB81                 lea  ax, [fname]
  2813 00001167 50                       push ax
  2814 00001168 E85A34                   call prs
  2815 0000116B 83C402                   add  sp, 2
  2816                                  
  2817                                  ;-303   expect(')'); }           /*error1("Vergleich fehlt");*/
  2818                                  
  2819 0000116E 6A29                     push 41
  2820 00001170 E83F33                   call expect
  2821 00001173 83C402                   add  sp, 2
  2822                                  
  2823                                  ;-304 
  2824                                  
  2825                                  
  2826                                  ;-305 int constantexpr() { int mode; int id1;int ids;
  2827                                  
  2828                                   .retn:
  2829 00001176 C3                       ret
  2830                                  ; ENDP
  2831 00001177 5F00                    pexpr_0 db "_",0
  2832 00001179 5C6E206F722020616C-     pexpr_1 db "\n or  al, al\n je .",0
  2833 00001182 2C20616C5C6E206A65-
  2834 0000118B 202E00             
  2835                                  
  2836                                  constantexpr:  ; *** PROC ***
  2837                                  
  2838                                  ;-306   token=getlex();   mode=typeName();  
  2839                                  
  2840                                  ;Function : constantexpr, Number of local variables: 3
  2841                                  ;   # type sign width addr used name   list of local variables
  2842                                  ;  200 var sign word   305 NULL mode = bp-2
  2843                                  ;  201 var sign word   305 NULL id1 = bp-4
  2844                                  ;  202 var sign word   305 NULL ids = bp-6;
  2845 0000118E C8060000                 ENTER  6,0
  2846 00001192 E8D72B                   call getlex
  2847 00001195 A3[1C00]                 mov word [token], ax
  2848 00001198 E851F9                   call typeName
  2849 0000119B 8946FE                   mov [bp-2], ax
  2850                                  
  2851                                  ;-307   id1=searchname(); gettypes(id1); ids=signi;
  2852                                  
  2853 0000119E E87CF8                   call searchname
  2854 000011A1 8946FC                   mov [bp-4], ax
  2855 000011A4 FF76FC                   push word [bp-4]
  2856 000011A7 E835F7                   call gettypes
  2857 000011AA 83C402                   add  sp, 2
  2858 000011AD A1[3300]                 mov ax, [signi]
  2859 000011B0 8946FA                   mov [bp-6], ax
  2860                                  
  2861                                  ;-308   if (isrelational() ==0) error1("Relational expression expected");
  2862                                  
  2863 000011B3 E84F2B                   call isrelational
  2864 000011B6 83F800                   cmp ax, 0
  2865 000011B9 0F850900                 jne .constantexpr133
  2866 000011BD 68[4312]                 push constantexpr_0
  2867 000011C0 E8EB36                   call error1
  2868 000011C3 83C402                   add  sp, 2
  2869                                  
  2870                                  ;-309   expect(T_CONST);  prs(" ; constant expression");
  2871                                  
  2872                                  .constantexpr133:
  2873 000011C6 680101                   push 257
  2874 000011C9 E8E632                   call expect
  2875 000011CC 83C402                   add  sp, 2
  2876 000011CF 68[6212]                 push constantexpr_1
  2877 000011D2 E8F033                   call prs
  2878 000011D5 83C402                   add  sp, 2
  2879                                  
  2880                                  ;-310   prs("\ncmp "); 
  2881                                  
  2882 000011D8 68[7912]                 push constantexpr_2
  2883 000011DB E8E733                   call prs
  2884 000011DE 83C402                   add  sp, 2
  2885                                  
  2886                                  ;-311   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  2887                                  
  2888 000011E1 FF76FC                   push word [bp-4]
  2889 000011E4 E8F8F6                   call gettypes
  2890 000011E7 83C402                   add  sp, 2
  2891 000011EA A1[3900]                 mov ax, [wi]
  2892 000011ED 83F802                   cmp ax, 2
  2893 000011F0 0F850C00                 jne .constantexpr134
  2894 000011F4 68[8012]                 push constantexpr_3
  2895 000011F7 E8CB33                   call prs
  2896 000011FA 83C402                   add  sp, 2
  2897 000011FD E90900                   jmp .constantexpr135
  2898                                  .constantexpr134:
  2899 00001200 68[8512]                 push constantexpr_4
  2900 00001203 E8BF33                   call prs
  2901 00001206 83C402                   add  sp, 2
  2902                                  
  2903                                  ;-312   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);
  2904                                  
  2905                                  .constantexpr135:
  2906 00001209 FF76FC                   push word [bp-4]
  2907 0000120C E822F2                   call v
  2908 0000120F 83C402                   add  sp, 2
  2909 00001212 68[8A12]                 push constantexpr_5
  2910 00001215 E8AD33                   call prs
  2911 00001218 83C402                   add  sp, 2
  2912 0000121B FF36[2E00]               push word [lexval]
  2913 0000121F E8FD34                   call prunsign1
  2914 00001222 83C402                   add  sp, 2
  2915 00001225 FF76FA                   push word [bp-6]
  2916 00001228 E82728                   call cmpneg
  2917 0000122B 83C402                   add  sp, 2
  2918 0000122E 8D06AB81                 lea  ax, [fname]
  2919 00001232 50                       push ax
  2920 00001233 E88F33                   call prs
  2921 00001236 83C402                   add  sp, 2
  2922                                  
  2923                                  ;-313   expect(')');
  2924                                  
  2925 00001239 6A29                     push 41
  2926 0000123B E87432                   call expect
  2927 0000123E 83C402                   add  sp, 2
  2928                                  
  2929                                  ;-314 }  
  2930                                  
  2931                                  
  2932                                  ;-315 int exprstart() { if (eqstr(symbol, "_")) expr2(0); else expr(0); }
  2933 00001241 C9                       LEAVE
  2934 00001242 C3                       ret
  2935                                  ; ENDP
  2936 00001243 52656C6174696F6E61-     constantexpr_0 db "Relational expression expected",0
  2937 0000124C 6C2065787072657373-
  2938 00001255 696F6E206578706563-
  2939 0000125E 74656400           
  2940 00001262 203B20636F6E737461-     constantexpr_1 db " ; constant expression",0
  2941 0000126B 6E7420657870726573-
  2942 00001274 73696F6E00         
  2943 00001279 5C6E636D702000          constantexpr_2 db "\ncmp ",0
  2944 00001280 776F726400              constantexpr_3 db "word",0
  2945 00001285 6279746500              constantexpr_4 db "byte",0
  2946 0000128A 2C2000                  constantexpr_5 db ", ",0
  2947                                  
  2948                                  exprstart:  ; *** PROC ***
  2949 0000128D 68[B512]                 push exprstart_0
  2950 00001290 8D062B81                 lea  ax, [symbol]
  2951 00001294 50                       push ax
  2952 00001295 E813EF                   call eqstr
  2953 00001298 83C404                   add  sp, 4
  2954 0000129B 08C0                     or  al, al
  2955 0000129D 0F840B00                 je .exprstart136
  2956 000012A1 6A00                     push 0
  2957 000012A3 E81100                   call expr2
  2958 000012A6 83C402                   add  sp, 2
  2959 000012A9 E90800                   jmp .exprstart137
  2960                                  .exprstart136:
  2961 000012AC 6A00                     push 0
  2962 000012AE E89E0A                   call expr
  2963 000012B1 83C402                   add  sp, 2
  2964                                  .exprstart137:
  2965                                  
  2966                                  ;-316 
  2967                                  
  2968                                  
  2969                                  ;-317 int expr2(int kind) {  int i;
  2970                                  
  2971 000012B4 C3                       ret
  2972                                  ; ENDP
  2973 000012B5 5F00                    exprstart_0 db "_",0
  2974                                  
  2975                                  expr2:  ; *** PROC ***
  2976                                  
  2977                                  ;-318   if(kind != 1) token=getlex();
  2978                                  
  2979                                  ;Function : expr2, Number of local variables: 2
  2980                                  ;   # type sign width addr used name   list of local variables
  2981                                  ;  200 var sign word   317 NULL kind = bp+4
  2982                                  ;  201 var sign word   317 NULL i = bp-2;
  2983 000012B7 C8020000                 ENTER  2,0
  2984 000012BB 8B4604                   mov ax, [bp+4]
  2985 000012BE 83F801                   cmp ax, 1
  2986 000012C1 0F840600                 je  .expr2138
  2987 000012C5 E8A42A                   call getlex
  2988 000012C8 A3[1C00]                 mov word [token], ax
  2989                                  
  2990                                  ;-319   mod1=typeName();
  2991                                  
  2992                                  .expr2138:
  2993 000012CB E81EF8                   call typeName
  2994 000012CE A3[E510]                 mov word [mod1], ax
  2995                                  
  2996                                  ;-320   if (mod1) error1("Noch kein & und * im Text (Linke Hand) erlaubt");
  2997                                  
  2998 000012D1 A1[E510]                 mov ax, [mod1]
  2999 000012D4 08C0                     or  al, al
  3000 000012D6 0F840900                 je .expr2139
  3001 000012DA 68[6F15]                 push expr2_0
  3002 000012DD E8CE35                   call error1
  3003 000012E0 83C402                   add  sp, 2
  3004                                  
  3005                                  ;-321   ireg1=checkreg();
  3006                                  
  3007                                  .expr2139:
  3008 000012E3 E8EA05                   call checkreg
  3009 000012E6 A3[E710]                 mov word [ireg1], ax
  3010                                  
  3011                                  ;-322   if (ireg1) { doreg1(0); return; }
  3012                                  
  3013 000012E9 A1[E710]                 mov ax, [ireg1]
  3014 000012EC 08C0                     or  al, al
  3015 000012EE 0F840B00                 je .expr2140
  3016 000012F2 6A00                     push 0
  3017 000012F4 E8ED03                   call doreg1
  3018 000012F7 83C402                   add  sp, 2
  3019 000012FA E97002                   jmp .retn
  3020                                  
  3021                                  ;-323   if (ireg1 == 0) { idx1=searchname();
  3022                                  
  3023                                  .expr2140:
  3024 000012FD A1[E710]                 mov ax, [ireg1]
  3025 00001300 83F800                   cmp ax, 0
  3026 00001303 0F853400                 jne .expr2141
  3027 00001307 E813F7                   call searchname
  3028 0000130A A3[E910]                 mov word [idx1], ax
  3029                                  
  3030                                  ;-324     gettypes(idx1); ids1=signi; idw1=wi; idt1=typei;
  3031                                  
  3032 0000130D FF36[E910]               push word [idx1]
  3033 00001311 E8CBF5                   call gettypes
  3034 00001314 83C402                   add  sp, 2
  3035 00001317 A1[3300]                 mov ax, [signi]
  3036 0000131A A3[EB10]                 mov word [ids1], ax
  3037 0000131D A1[3900]                 mov ax, [wi]
  3038 00001320 A3[ED10]                 mov word [idw1], ax
  3039 00001323 A1[3000]                 mov ax, [typei]
  3040 00001326 A3[EF10]                 mov word [idt1], ax
  3041                                  
  3042                                  ;-325     if (idt1)  error1("Noch kein Array oder Pointer links erlaubt");  }
  3043                                  
  3044 00001329 A1[EF10]                 mov ax, [idt1]
  3045 0000132C 08C0                     or  al, al
  3046 0000132E 0F840900                 je .expr2142
  3047 00001332 68[9E15]                 push expr2_1
  3048 00001335 E87635                   call error1
  3049 00001338 83C402                   add  sp, 2
  3050                                  .expr2142:
  3051                                  
  3052                                  ;-326   
  3053                                  
  3054                                  
  3055                                  ;-327   if (isrelational()) { error1("Vergleich noch nicht implementiert");
  3056                                  
  3057                                  .expr2141:
  3058 0000133B E8C729                   call isrelational
  3059 0000133E 08C0                     or  al, al
  3060 00001340 0F840900                 je .expr2143
  3061 00001344 68[C915]                 push expr2_2
  3062 00001347 E86435                   call error1
  3063 0000134A 83C402                   add  sp, 2
  3064                                  
  3065                                  ;-328   }
  3066                                  
  3067                                  
  3068                                  ;-329   if (istoken('=') == 0) error1("Assign expected");
  3069                                  
  3070                                  .expr2143:
  3071 0000134D 6A3D                     push 61
  3072 0000134F E83E31                   call istoken
  3073 00001352 83C402                   add  sp, 2
  3074 00001355 83F800                   cmp ax, 0
  3075 00001358 0F850900                 jne .expr2144
  3076 0000135C 68[EC15]                 push expr2_3
  3077 0000135F E84C35                   call error1
  3078 00001362 83C402                   add  sp, 2
  3079                                  
  3080                                  ;-330   if (istoken(T_CONST) ) { val2=lexval; prs(" ; constant expression");
  3081                                  
  3082                                  .expr2144:
  3083 00001365 680101                   push 257
  3084 00001368 E82531                   call istoken
  3085 0000136B 83C402                   add  sp, 2
  3086 0000136E 08C0                     or  al, al
  3087 00001370 0F849A00                 je .expr2145
  3088 00001374 A1[2E00]                 mov ax, [lexval]
  3089 00001377 A3[FF10]                 mov word [val2], ax
  3090 0000137A 68[FC15]                 push expr2_4
  3091 0000137D E84532                   call prs
  3092 00001380 83C402                   add  sp, 2
  3093                                  
  3094                                  ;-331     prs("\nmov ");
  3095                                  
  3096 00001383 68[1316]                 push expr2_5
  3097 00001386 E83C32                   call prs
  3098 00001389 83C402                   add  sp, 2
  3099                                  
  3100                                  ;-332     if (idw1 == 1) prs("byte ");
  3101                                  
  3102 0000138C A1[ED10]                 mov ax, [idw1]
  3103 0000138F 83F801                   cmp ax, 1
  3104 00001392 0F850900                 jne .expr2146
  3105 00001396 68[1A16]                 push expr2_6
  3106 00001399 E82932                   call prs
  3107 0000139C 83C402                   add  sp, 2
  3108                                  
  3109                                  ;-333     if (idw1 == 2) prs("word ");
  3110                                  
  3111                                  .expr2146:
  3112 0000139F A1[ED10]                 mov ax, [idw1]
  3113 000013A2 83F802                   cmp ax, 2
  3114 000013A5 0F850900                 jne .expr2147
  3115 000013A9 68[2016]                 push expr2_7
  3116 000013AC E81632                   call prs
  3117 000013AF 83C402                   add  sp, 2
  3118                                  
  3119                                  ;-334     if (idw1 == 4) prs("dword ");
  3120                                  
  3121                                  .expr2147:
  3122 000013B2 A1[ED10]                 mov ax, [idw1]
  3123 000013B5 83F804                   cmp ax, 4
  3124 000013B8 0F850900                 jne .expr2148
  3125 000013BC 68[2616]                 push expr2_8
  3126 000013BF E80332                   call prs
  3127 000013C2 83C402                   add  sp, 2
  3128                                  
  3129                                  ;-335     v(idx1);
  3130                                  
  3131                                  .expr2148:
  3132 000013C5 FF36[E910]               push word [idx1]
  3133 000013C9 E865F0                   call v
  3134 000013CC 83C402                   add  sp, 2
  3135                                  
  3136                                  ;-336     prs(", "); prunsign1(val2);
  3137                                  
  3138 000013CF 68[2D16]                 push expr2_9
  3139 000013D2 E8F031                   call prs
  3140 000013D5 83C402                   add  sp, 2
  3141 000013D8 FF36[FF10]               push word [val2]
  3142 000013DC E84033                   call prunsign1
  3143 000013DF 83C402                   add  sp, 2
  3144                                  
  3145                                  ;-337     if (idx1 >= LSTART) { i=adrofname(idx1);  prs("; "); prs(i); } return; }
  3146                                  
  3147 000013E2 A1[E910]                 mov ax, [idx1]
  3148 000013E5 3DC800                   cmp ax, 200 ;unsigned : 1
  3149 000013E8 0F8C1F00                 jl  .expr2149
  3150 000013EC FF36[E910]               push word [idx1]
  3151 000013F0 E8A3F5                   call adrofname
  3152 000013F3 83C402                   add  sp, 2
  3153 000013F6 8946FE                   mov [bp-2], ax
  3154 000013F9 68[3016]                 push expr2_10
  3155 000013FC E8C631                   call prs
  3156 000013FF 83C402                   add  sp, 2
  3157 00001402 FF76FE                   push word [bp-2]
  3158 00001405 E8BD31                   call prs
  3159 00001408 83C402                   add  sp, 2
  3160                                  .expr2149:
  3161 0000140B E95F01                   jmp .retn
  3162                                  
  3163                                  ;-338   
  3164                                  
  3165                                  
  3166                                  ;-339   mod1=typeName(); ireg2=checkreg();
  3167                                  
  3168                                  .expr2145:
  3169 0000140E E8DBF6                   call typeName
  3170 00001411 A3[E510]                 mov word [mod1], ax
  3171 00001414 E8B904                   call checkreg
  3172 00001417 A3[F510]                 mov word [ireg2], ax
  3173                                  
  3174                                  ;-340   if (ireg2) { prs("\nmov ");
  3175                                  
  3176 0000141A A1[F510]                 mov ax, [ireg2]
  3177 0000141D 08C0                     or  al, al
  3178 0000141F 0F844200                 je .expr2150
  3179 00001423 68[3316]                 push expr2_11
  3180 00001426 E89C31                   call prs
  3181 00001429 83C402                   add  sp, 2
  3182                                  
  3183                                  ;-341     if (ireg1) printreg(ireg1); else v(idx1); prs(", "); printreg(ireg2);return;}
  3184                                  
  3185 0000142C A1[E710]                 mov ax, [ireg1]
  3186 0000142F 08C0                     or  al, al
  3187 00001431 0F840D00                 je .expr2151
  3188 00001435 FF36[E710]               push word [ireg1]
  3189 00001439 E8A208                   call printreg
  3190 0000143C 83C402                   add  sp, 2
  3191 0000143F E90A00                   jmp .expr2152
  3192                                  .expr2151:
  3193 00001442 FF36[E910]               push word [idx1]
  3194 00001446 E8E8EF                   call v
  3195 00001449 83C402                   add  sp, 2
  3196                                  .expr2152:
  3197 0000144C 68[3A16]                 push expr2_12
  3198 0000144F E87331                   call prs
  3199 00001452 83C402                   add  sp, 2
  3200 00001455 FF36[F510]               push word [ireg2]
  3201 00001459 E88208                   call printreg
  3202 0000145C 83C402                   add  sp, 2
  3203 0000145F E90B01                   jmp .retn
  3204                                  
  3205                                  ;-342   else {
  3206                                  
  3207 00001462 E9FF00                   jmp .expr2153
  3208                                  .expr2150:
  3209                                  
  3210                                  ;-343     if (mod1 == 1) error1("Noch kein * im Text erlaubt");
  3211                                  
  3212 00001465 A1[E510]                 mov ax, [mod1]
  3213 00001468 83F801                   cmp ax, 1
  3214 0000146B 0F850900                 jne .expr2154
  3215 0000146F 68[3D16]                 push expr2_13
  3216 00001472 E83934                   call error1
  3217 00001475 83C402                   add  sp, 2
  3218                                  
  3219                                  ;-344     
  3220                                  
  3221                                  
  3222                                  ;-345     idx2=searchname();
  3223                                  
  3224                                  .expr2154:
  3225 00001478 E8A2F5                   call searchname
  3226 0000147B A3[F710]                 mov word [idx2], ax
  3227                                  
  3228                                  ;-346     gettypes(idx2); ids2=signi; idw2=wi; idt2=typei;
  3229                                  
  3230 0000147E FF36[F710]               push word [idx2]
  3231 00001482 E85AF4                   call gettypes
  3232 00001485 83C402                   add  sp, 2
  3233 00001488 A1[3300]                 mov ax, [signi]
  3234 0000148B A3[F910]                 mov word [ids2], ax
  3235 0000148E A1[3900]                 mov ax, [wi]
  3236 00001491 A3[FB10]                 mov word [idw2], ax
  3237 00001494 A1[3000]                 mov ax, [typei]
  3238 00001497 A3[FD10]                 mov word [idt2], ax
  3239                                  
  3240                                  ;-347     if (idt2 == 1)  error1("Noch kein Array rechts erlaubt");
  3241                                  
  3242 0000149A A1[FD10]                 mov ax, [idt2]
  3243 0000149D 83F801                   cmp ax, 1
  3244 000014A0 0F850900                 jne .expr2155
  3245 000014A4 68[5916]                 push expr2_14
  3246 000014A7 E80434                   call error1
  3247 000014AA 83C402                   add  sp, 2
  3248                                  
  3249                                  ;-348     prs("\nmov ");
  3250                                  
  3251                                  .expr2155:
  3252 000014AD 68[7816]                 push expr2_15
  3253 000014B0 E81231                   call prs
  3254 000014B3 83C402                   add  sp, 2
  3255                                  
  3256                                  ;-349     if (ireg1) printreg(ireg1); else error1("Mem to Mem not allowed by x86-CPU");
  3257                                  
  3258 000014B6 A1[E710]                 mov ax, [ireg1]
  3259 000014B9 08C0                     or  al, al
  3260 000014BB 0F840D00                 je .expr2156
  3261 000014BF FF36[E710]               push word [ireg1]
  3262 000014C3 E81808                   call printreg
  3263 000014C6 83C402                   add  sp, 2
  3264 000014C9 E90900                   jmp .expr2157
  3265                                  .expr2156:
  3266 000014CC 68[7F16]                 push expr2_16
  3267 000014CF E8DC33                   call error1
  3268 000014D2 83C402                   add  sp, 2
  3269                                  
  3270                                  ;-350     prs(", ");
  3271                                  
  3272                                  .expr2157:
  3273 000014D5 68[A116]                 push expr2_17
  3274 000014D8 E8EA30                   call prs
  3275 000014DB 83C402                   add  sp, 2
  3276                                  
  3277                                  ;-351     if (mod1 == 2) a(idx2);
  3278                                  
  3279 000014DE A1[E510]                 mov ax, [mod1]
  3280 000014E1 83F802                   cmp ax, 2
  3281 000014E4 0F850D00                 jne .expr2158
  3282 000014E8 FF36[F710]               push word [idx2]
  3283 000014EC E833EF                   call a
  3284 000014EF 83C402                   add  sp, 2
  3285                                  
  3286                                  ;-352     else {
  3287                                  
  3288 000014F2 E96C00                   jmp .expr2159
  3289                                  .expr2158:
  3290                                  
  3291                                  ;-353       if (idw2 == 1) prs("byte ");
  3292                                  
  3293 000014F5 A1[FB10]                 mov ax, [idw2]
  3294 000014F8 83F801                   cmp ax, 1
  3295 000014FB 0F850900                 jne .expr2160
  3296 000014FF 68[A416]                 push expr2_18
  3297 00001502 E8C030                   call prs
  3298 00001505 83C402                   add  sp, 2
  3299                                  
  3300                                  ;-354       if (idw2 == 2) prs("word ");
  3301                                  
  3302                                  .expr2160:
  3303 00001508 A1[FB10]                 mov ax, [idw2]
  3304 0000150B 83F802                   cmp ax, 2
  3305 0000150E 0F850900                 jne .expr2161
  3306 00001512 68[AA16]                 push expr2_19
  3307 00001515 E8AD30                   call prs
  3308 00001518 83C402                   add  sp, 2
  3309                                  
  3310                                  ;-355       if (idw2 == 4) prs("dword ");
  3311                                  
  3312                                  .expr2161:
  3313 0000151B A1[FB10]                 mov ax, [idw2]
  3314 0000151E 83F804                   cmp ax, 4
  3315 00001521 0F850900                 jne .expr2162
  3316 00001525 68[B016]                 push expr2_20
  3317 00001528 E89A30                   call prs
  3318 0000152B 83C402                   add  sp, 2
  3319                                  
  3320                                  ;-356       v(idx2);
  3321                                  
  3322                                  .expr2162:
  3323 0000152E FF36[F710]               push word [idx2]
  3324 00001532 E8FCEE                   call v
  3325 00001535 83C402                   add  sp, 2
  3326                                  
  3327                                  ;-357       if (idx2 >= LSTART) { i=adrofname(idx2);  prs("; "); prs(i); }  }
  3328                                  
  3329 00001538 A1[F710]                 mov ax, [idx2]
  3330 0000153B 3DC800                   cmp ax, 200 ;unsigned : 1
  3331 0000153E 0F8C1F00                 jl  .expr2163
  3332 00001542 FF36[F710]               push word [idx2]
  3333 00001546 E84DF4                   call adrofname
  3334 00001549 83C402                   add  sp, 2
  3335 0000154C 8946FE                   mov [bp-2], ax
  3336 0000154F 68[B716]                 push expr2_21
  3337 00001552 E87030                   call prs
  3338 00001555 83C402                   add  sp, 2
  3339 00001558 FF76FE                   push word [bp-2]
  3340 0000155B E86730                   call prs
  3341 0000155E 83C402                   add  sp, 2
  3342                                  .expr2163:
  3343                                  
  3344                                  ;-358     return;
  3345                                  
  3346                                  .expr2159:
  3347 00001561 E90900                   jmp .retn
  3348                                  
  3349                                  ;-359   } error1("Internal error: only const or reg allowed");
  3350                                  
  3351                                  .expr2153:
  3352 00001564 68[BA16]                 push expr2_22
  3353 00001567 E84433                   call error1
  3354 0000156A 83C402                   add  sp, 2
  3355                                  
  3356                                  ;-360 }
  3357                                  
  3358                                  
  3359                                  ;-361 char ops[5];
  3360                                  
  3361 0000156D C9                       .retn: LEAVE
  3362 0000156E C3                       ret
  3363                                  ; ENDP
  3364 0000156F 4E6F6368206B65696E-     expr2_0 db "Noch kein & und * im Text (Linke Hand) erlaubt",0
  3365 00001578 202620756E64202A20-
  3366 00001581 696D20546578742028-
  3367 0000158A 4C696E6B652048616E-
  3368 00001593 64292065726C617562-
  3369 0000159C 7400               
  3370 0000159E 4E6F6368206B65696E-     expr2_1 db "Noch kein Array oder Pointer links erlaubt",0
  3371 000015A7 204172726179206F64-
  3372 000015B0 657220506F696E7465-
  3373 000015B9 72206C696E6B732065-
  3374 000015C2 726C6175627400     
  3375 000015C9 566572676C65696368-     expr2_2 db "Vergleich noch nicht implementiert",0
  3376 000015D2 206E6F6368206E6963-
  3377 000015DB 687420696D706C656D-
  3378 000015E4 656E746965727400   
  3379 000015EC 41737369676E206578-     expr2_3 db "Assign expected",0
  3380 000015F5 70656374656400     
  3381 000015FC 203B20636F6E737461-     expr2_4 db " ; constant expression",0
  3382 00001605 6E7420657870726573-
  3383 0000160E 73696F6E00         
  3384 00001613 5C6E6D6F762000          expr2_5 db "\nmov ",0
  3385 0000161A 627974652000            expr2_6 db "byte ",0
  3386 00001620 776F72642000            expr2_7 db "word ",0
  3387 00001626 64776F72642000          expr2_8 db "dword ",0
  3388 0000162D 2C2000                  expr2_9 db ", ",0
  3389 00001630 3B2000                  expr2_10 db "; ",0
  3390 00001633 5C6E6D6F762000          expr2_11 db "\nmov ",0
  3391 0000163A 2C2000                  expr2_12 db ", ",0
  3392 0000163D 4E6F6368206B65696E-     expr2_13 db "Noch kein * im Text erlaubt",0
  3393 00001646 202A20696D20546578-
  3394 0000164F 742065726C61756274-
  3395 00001658 00                 
  3396 00001659 4E6F6368206B65696E-     expr2_14 db "Noch kein Array rechts erlaubt",0
  3397 00001662 204172726179207265-
  3398 0000166B 636874732065726C61-
  3399 00001674 75627400           
  3400 00001678 5C6E6D6F762000          expr2_15 db "\nmov ",0
  3401 0000167F 4D656D20746F204D65-     expr2_16 db "Mem to Mem not allowed by x86-CPU",0
  3402 00001688 6D206E6F7420616C6C-
  3403 00001691 6F7765642062792078-
  3404 0000169A 38362D43505500     
  3405 000016A1 2C2000                  expr2_17 db ", ",0
  3406 000016A4 627974652000            expr2_18 db "byte ",0
  3407 000016AA 776F72642000            expr2_19 db "word ",0
  3408 000016B0 64776F72642000          expr2_20 db "dword ",0
  3409 000016B7 3B2000                  expr2_21 db "; ",0
  3410 000016BA 496E7465726E616C20-     expr2_22 db "Internal error: only const or reg allowed",0
  3411 000016C3 6572726F723A206F6E-
  3412 000016CC 6C7920636F6E737420-
  3413 000016D5 6F722072656720616C-
  3414 000016DE 6C6F77656400       
  3415                                  section .bss
  3416                                  absolute 53406
  3417 0000D09E <res 00000005>          ops resb 5
  3418                                  section .text
  3419                                  
  3420                                  ;-362 int doreg1(int iscmp1) { int i;
  3421                                  
  3422                                  
  3423                                  doreg1:  ; *** PROC ***
  3424                                  
  3425                                  ;-363   if (istoken('='))          strcpy(ops, "mov");
  3426                                  
  3427                                  ;Function : doreg1, Number of local variables: 2
  3428                                  ;   # type sign width addr used name   list of local variables
  3429                                  ;  200 var sign word   362 NULL iscmp1 = bp+4
  3430                                  ;  201 var sign word   362 NULL i = bp-2;
  3431 000016E4 C8020000                 ENTER  2,0
  3432 000016E8 6A3D                     push 61
  3433 000016EA E8A32D                   call istoken
  3434 000016ED 83C402                   add  sp, 2
  3435 000016F0 08C0                     or  al, al
  3436 000016F2 0F840E00                 je .doreg1164
  3437 000016F6 68[9718]                 push doreg1_0
  3438 000016F9 8D069ED0                 lea  ax, [ops]
  3439 000016FD 50                       push ax
  3440 000016FE E87AEA                   call strcpy
  3441 00001701 83C404                   add  sp, 4
  3442                                  
  3443                                  ;-364   if (istoken(T_PLUSASS))    strcpy(ops, "add");
  3444                                  
  3445                                  .doreg1164:
  3446 00001704 68CE04                   push 1230
  3447 00001707 E8862D                   call istoken
  3448 0000170A 83C402                   add  sp, 2
  3449 0000170D 08C0                     or  al, al
  3450 0000170F 0F840E00                 je .doreg1165
  3451 00001713 68[9B18]                 push doreg1_1
  3452 00001716 8D069ED0                 lea  ax, [ops]
  3453 0000171A 50                       push ax
  3454 0000171B E85DEA                   call strcpy
  3455 0000171E 83C404                   add  sp, 4
  3456                                  
  3457                                  ;-365   if (istoken(T_MINUSASS))   strcpy(ops, "sub");
  3458                                  
  3459                                  .doreg1165:
  3460 00001721 68CF04                   push 1231
  3461 00001724 E8692D                   call istoken
  3462 00001727 83C402                   add  sp, 2
  3463 0000172A 08C0                     or  al, al
  3464 0000172C 0F840E00                 je .doreg1166
  3465 00001730 68[9F18]                 push doreg1_2
  3466 00001733 8D069ED0                 lea  ax, [ops]
  3467 00001737 50                       push ax
  3468 00001738 E840EA                   call strcpy
  3469 0000173B 83C404                   add  sp, 4
  3470                                  
  3471                                  ;-366   if (istoken(T_ANDASS))     strcpy(ops, "and");
  3472                                  
  3473                                  .doreg1166:
  3474 0000173E 68D204                   push 1234
  3475 00001741 E84C2D                   call istoken
  3476 00001744 83C402                   add  sp, 2
  3477 00001747 08C0                     or  al, al
  3478 00001749 0F840E00                 je .doreg1167
  3479 0000174D 68[A318]                 push doreg1_3
  3480 00001750 8D069ED0                 lea  ax, [ops]
  3481 00001754 50                       push ax
  3482 00001755 E823EA                   call strcpy
  3483 00001758 83C404                   add  sp, 4
  3484                                  
  3485                                  ;-367   if (istoken(T_ORASS))      strcpy(ops, "or" );
  3486                                  
  3487                                  .doreg1167:
  3488 0000175B 68D304                   push 1235
  3489 0000175E E82F2D                   call istoken
  3490 00001761 83C402                   add  sp, 2
  3491 00001764 08C0                     or  al, al
  3492 00001766 0F840E00                 je .doreg1168
  3493 0000176A 68[A718]                 push doreg1_4
  3494 0000176D 8D069ED0                 lea  ax, [ops]
  3495 00001771 50                       push ax
  3496 00001772 E806EA                   call strcpy
  3497 00001775 83C404                   add  sp, 4
  3498                                  
  3499                                  ;-368   if (istoken(T_LESSLESS))   strcpy(ops, "shl");
  3500                                  
  3501                                  .doreg1168:
  3502 00001778 68D804                   push 1240
  3503 0000177B E8122D                   call istoken
  3504 0000177E 83C402                   add  sp, 2
  3505 00001781 08C0                     or  al, al
  3506 00001783 0F840E00                 je .doreg1169
  3507 00001787 68[AA18]                 push doreg1_5
  3508 0000178A 8D069ED0                 lea  ax, [ops]
  3509 0000178E 50                       push ax
  3510 0000178F E8E9E9                   call strcpy
  3511 00001792 83C404                   add  sp, 4
  3512                                  
  3513                                  ;-369   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");
  3514                                  
  3515                                  .doreg1169:
  3516 00001795 68D904                   push 1241
  3517 00001798 E8F52C                   call istoken
  3518 0000179B 83C402                   add  sp, 2
  3519 0000179E 08C0                     or  al, al
  3520 000017A0 0F840E00                 je .doreg1170
  3521 000017A4 68[AE18]                 push doreg1_6
  3522 000017A7 8D069ED0                 lea  ax, [ops]
  3523 000017AB 50                       push ax
  3524 000017AC E8CCE9                   call strcpy
  3525 000017AF 83C404                   add  sp, 4
  3526                                  
  3527                                  ;-370   if (iscmp1 == 1) { token=getlex();
  3528                                  
  3529                                  .doreg1170:
  3530 000017B2 8B4604                   mov ax, [bp+4]
  3531 000017B5 83F801                   cmp ax, 1
  3532 000017B8 0F852700                 jne .doreg1171
  3533 000017BC E8AD25                   call getlex
  3534 000017BF A3[1C00]                 mov word [token], ax
  3535                                  
  3536                                  ;-371       if (isrelational() ==0) error1("Relational expected");
  3537                                  
  3538 000017C2 E84025                   call isrelational
  3539 000017C5 83F800                   cmp ax, 0
  3540 000017C8 0F850900                 jne .doreg1172
  3541 000017CC 68[B218]                 push doreg1_7
  3542 000017CF E8DC30                   call error1
  3543 000017D2 83C402                   add  sp, 2
  3544                                  
  3545                                  ;-372       strcpy(ops, "cmp"); }
  3546                                  
  3547                                  .doreg1172:
  3548 000017D5 68[C618]                 push doreg1_8
  3549 000017D8 8D069ED0                 lea  ax, [ops]
  3550 000017DC 50                       push ax
  3551 000017DD E89BE9                   call strcpy
  3552 000017E0 83C404                   add  sp, 4
  3553                                  
  3554                                  ;-373   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");
  3555                                  
  3556                                  .doreg1171:
  3557 000017E3 E8D12D                   call prnl
  3558 000017E6 8D069ED0                 lea  ax, [ops]
  3559 000017EA 50                       push ax
  3560 000017EB E8D72D                   call prs
  3561 000017EE 83C402                   add  sp, 2
  3562 000017F1 68[CA18]                 push doreg1_9
  3563 000017F4 E8CE2D                   call prs
  3564 000017F7 83C402                   add  sp, 2
  3565 000017FA FF36[E710]               push word [ireg1]
  3566 000017FE E8DD04                   call printreg
  3567 00001801 83C402                   add  sp, 2
  3568 00001804 68[CD18]                 push doreg1_10
  3569 00001807 E8BB2D                   call prs
  3570 0000180A 83C402                   add  sp, 2
  3571                                  
  3572                                  ;-374 
  3573                                  
  3574                                  
  3575                                  ;-375   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}
  3576                                  
  3577 0000180D 680101                   push 257
  3578 00001810 E87D2C                   call istoken
  3579 00001813 83C402                   add  sp, 2
  3580 00001816 08C0                     or  al, al
  3581 00001818 0F840D00                 je .doreg1173
  3582 0000181C FF36[2E00]               push word [lexval]
  3583 00001820 E8FC2E                   call prunsign1
  3584 00001823 83C402                   add  sp, 2
  3585 00001826 E94700                   jmp .reg1
  3586                                  
  3587                                  ;-376   mod2=typeName(); ireg2=checkreg();
  3588                                  
  3589                                  .doreg1173:
  3590 00001829 E8C0F2                   call typeName
  3591 0000182C A3[F310]                 mov word [mod2], ax
  3592 0000182F E89E00                   call checkreg
  3593 00001832 A3[F510]                 mov word [ireg2], ax
  3594                                  
  3595                                  ;-377   if (ireg2) {printreg(ireg2); goto reg1;}
  3596                                  
  3597 00001835 A1[F510]                 mov ax, [ireg2]
  3598 00001838 08C0                     or  al, al
  3599 0000183A 0F840D00                 je .doreg1174
  3600 0000183E FF36[F510]               push word [ireg2]
  3601 00001842 E89904                   call printreg
  3602 00001845 83C402                   add  sp, 2
  3603 00001848 E92500                   jmp .reg1
  3604                                  
  3605                                  ;-378   i=searchname();  if (mod2 == 2) a(i); else v(i);
  3606                                  
  3607                                  .doreg1174:
  3608 0000184B E8CFF1                   call searchname
  3609 0000184E 8946FE                   mov [bp-2], ax
  3610 00001851 A1[F310]                 mov ax, [mod2]
  3611 00001854 83F802                   cmp ax, 2
  3612 00001857 0F850C00                 jne .doreg1175
  3613 0000185B FF76FE                   push word [bp-2]
  3614 0000185E E8C1EB                   call a
  3615 00001861 83C402                   add  sp, 2
  3616 00001864 E90900                   jmp .doreg1176
  3617                                  .doreg1175:
  3618 00001867 FF76FE                   push word [bp-2]
  3619 0000186A E8C4EB                   call v
  3620 0000186D 83C402                   add  sp, 2
  3621                                  
  3622                                  ;-379   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }
  3623                                  
  3624                                  .doreg1176:
  3625                                  .reg1:
  3626 00001870 8B4604                   mov ax, [bp+4]
  3627 00001873 83F801                   cmp ax, 1
  3628 00001876 0F851B00                 jne .doreg1177
  3629 0000187A 6A00                     push 0
  3630 0000187C E8D321                   call cmpneg
  3631 0000187F 83C402                   add  sp, 2
  3632 00001882 8D06AB81                 lea  ax, [fname]
  3633 00001886 50                       push ax
  3634 00001887 E83B2D                   call prs
  3635 0000188A 83C402                   add  sp, 2
  3636 0000188D 6A29                     push 41
  3637 0000188F E8202C                   call expect
  3638 00001892 83C402                   add  sp, 2
  3639                                  
  3640                                  ;-380 }
  3641                                  
  3642                                  .doreg1177:
  3643                                  
  3644                                  ;-381 int checkreg() { // >=17 = 16bit, >=47 = 32bit
  3645 00001895 C9                       LEAVE
  3646 00001896 C3                       ret
  3647                                  ; ENDP
  3648 00001897 6D6F7600                doreg1_0 db "mov",0
  3649 0000189B 61646400                doreg1_1 db "add",0
  3650 0000189F 73756200                doreg1_2 db "sub",0
  3651 000018A3 616E6400                doreg1_3 db "and",0
  3652 000018A7 6F7200                  doreg1_4 db "or",0
  3653 000018AA 73686C00                doreg1_5 db "shl",0
  3654 000018AE 73687200                doreg1_6 db "shr",0
  3655 000018B2 52656C6174696F6E61-     doreg1_7 db "Relational expected",0
  3656 000018BB 6C2065787065637465-
  3657 000018C4 6400               
  3658 000018C6 636D7000                doreg1_8 db "cmp",0
  3659 000018CA 202000                  doreg1_9 db "  ",0
  3660 000018CD 2C2000                  doreg1_10 db ", ",0
  3661                                  
  3662                                  checkreg:  ; *** PROC ***
  3663                                  
  3664                                  ;-382   if (strlen(symbol) <  2) return 0;
  3665                                  
  3666 000018D0 8D062B81                 lea  ax, [symbol]
  3667 000018D4 50                       push ax
  3668 000018D5 E87BE8                   call strlen
  3669 000018D8 83C402                   add  sp, 2
  3670 000018DB 83F802                   cmp ax, 2
  3671 000018DE 0F8D0600                 jge .checkreg178
  3672 000018E2 B80000                   mov ax, 0
  3673 000018E5 E94403                   jmp .retn
  3674                                  
  3675                                  ;-383   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;
  3676                                  
  3677                                  .checkreg178:
  3678 000018E8 68[2D1C]                 push checkreg_0
  3679 000018EB 8D062B81                 lea  ax, [symbol]
  3680 000018EF 50                       push ax
  3681 000018F0 E8B8E8                   call eqstr
  3682 000018F3 83C404                   add  sp, 4
  3683 000018F6 08C0                     or  al, al
  3684 000018F8 0F840600                 je .checkreg179
  3685 000018FC B80100                   mov ax, 1
  3686 000018FF E92A03                   jmp .retn
  3687                                  .checkreg179:
  3688 00001902 68[301C]                 push checkreg_1
  3689 00001905 8D062B81                 lea  ax, [symbol]
  3690 00001909 50                       push ax
  3691 0000190A E89EE8                   call eqstr
  3692 0000190D 83C404                   add  sp, 4
  3693 00001910 08C0                     or  al, al
  3694 00001912 0F840600                 je .checkreg180
  3695 00001916 B80300                   mov ax, 3
  3696 00001919 E91003                   jmp .retn
  3697                                  
  3698                                  ;-384   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;
  3699                                  
  3700                                  .checkreg180:
  3701 0000191C 68[331C]                 push checkreg_2
  3702 0000191F 8D062B81                 lea  ax, [symbol]
  3703 00001923 50                       push ax
  3704 00001924 E884E8                   call eqstr
  3705 00001927 83C404                   add  sp, 4
  3706 0000192A 08C0                     or  al, al
  3707 0000192C 0F840600                 je .checkreg181
  3708 00001930 B80500                   mov ax, 5
  3709 00001933 E9F602                   jmp .retn
  3710                                  .checkreg181:
  3711 00001936 68[361C]                 push checkreg_3
  3712 00001939 8D062B81                 lea  ax, [symbol]
  3713 0000193D 50                       push ax
  3714 0000193E E86AE8                   call eqstr
  3715 00001941 83C404                   add  sp, 4
  3716 00001944 08C0                     or  al, al
  3717 00001946 0F840600                 je .checkreg182
  3718 0000194A B80700                   mov ax, 7
  3719 0000194D E9DC02                   jmp .retn
  3720                                  
  3721                                  ;-385   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;
  3722                                  
  3723                                  .checkreg182:
  3724 00001950 68[391C]                 push checkreg_4
  3725 00001953 8D062B81                 lea  ax, [symbol]
  3726 00001957 50                       push ax
  3727 00001958 E850E8                   call eqstr
  3728 0000195B 83C404                   add  sp, 4
  3729 0000195E 08C0                     or  al, al
  3730 00001960 0F840600                 je .checkreg183
  3731 00001964 B80900                   mov ax, 9
  3732 00001967 E9C202                   jmp .retn
  3733                                  .checkreg183:
  3734 0000196A 68[3C1C]                 push checkreg_5
  3735 0000196D 8D062B81                 lea  ax, [symbol]
  3736 00001971 50                       push ax
  3737 00001972 E836E8                   call eqstr
  3738 00001975 83C404                   add  sp, 4
  3739 00001978 08C0                     or  al, al
  3740 0000197A 0F840600                 je .checkreg184
  3741 0000197E B80B00                   mov ax, 11
  3742 00001981 E9A802                   jmp .retn
  3743                                  
  3744                                  ;-386   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;
  3745                                  
  3746                                  .checkreg184:
  3747 00001984 68[3F1C]                 push checkreg_6
  3748 00001987 8D062B81                 lea  ax, [symbol]
  3749 0000198B 50                       push ax
  3750 0000198C E81CE8                   call eqstr
  3751 0000198F 83C404                   add  sp, 4
  3752 00001992 08C0                     or  al, al
  3753 00001994 0F840600                 je .checkreg185
  3754 00001998 B80D00                   mov ax, 13
  3755 0000199B E98E02                   jmp .retn
  3756                                  .checkreg185:
  3757 0000199E 68[421C]                 push checkreg_7
  3758 000019A1 8D062B81                 lea  ax, [symbol]
  3759 000019A5 50                       push ax
  3760 000019A6 E802E8                   call eqstr
  3761 000019A9 83C404                   add  sp, 4
  3762 000019AC 08C0                     or  al, al
  3763 000019AE 0F840600                 je .checkreg186
  3764 000019B2 B80F00                   mov ax, 15
  3765 000019B5 E97402                   jmp .retn
  3766                                  
  3767                                  ;-387   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;
  3768                                  
  3769                                  .checkreg186:
  3770 000019B8 68[451C]                 push checkreg_8
  3771 000019BB 8D062B81                 lea  ax, [symbol]
  3772 000019BF 50                       push ax
  3773 000019C0 E8E8E7                   call eqstr
  3774 000019C3 83C404                   add  sp, 4
  3775 000019C6 08C0                     or  al, al
  3776 000019C8 0F840600                 je .checkreg187
  3777 000019CC B81100                   mov ax, 17
  3778 000019CF E95A02                   jmp .retn
  3779                                  .checkreg187:
  3780 000019D2 68[481C]                 push checkreg_9
  3781 000019D5 8D062B81                 lea  ax, [symbol]
  3782 000019D9 50                       push ax
  3783 000019DA E8CEE7                   call eqstr
  3784 000019DD 83C404                   add  sp, 4
  3785 000019E0 08C0                     or  al, al
  3786 000019E2 0F840600                 je .checkreg188
  3787 000019E6 B81300                   mov ax, 19
  3788 000019E9 E94002                   jmp .retn
  3789                                  
  3790                                  ;-388   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;
  3791                                  
  3792                                  .checkreg188:
  3793 000019EC 68[4B1C]                 push checkreg_10
  3794 000019EF 8D062B81                 lea  ax, [symbol]
  3795 000019F3 50                       push ax
  3796 000019F4 E8B4E7                   call eqstr
  3797 000019F7 83C404                   add  sp, 4
  3798 000019FA 08C0                     or  al, al
  3799 000019FC 0F840600                 je .checkreg189
  3800 00001A00 B81500                   mov ax, 21
  3801 00001A03 E92602                   jmp .retn
  3802                                  .checkreg189:
  3803 00001A06 68[4E1C]                 push checkreg_11
  3804 00001A09 8D062B81                 lea  ax, [symbol]
  3805 00001A0D 50                       push ax
  3806 00001A0E E89AE7                   call eqstr
  3807 00001A11 83C404                   add  sp, 4
  3808 00001A14 08C0                     or  al, al
  3809 00001A16 0F840600                 je .checkreg190
  3810 00001A1A B81700                   mov ax, 23
  3811 00001A1D E90C02                   jmp .retn
  3812                                  
  3813                                  ;-389   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;
  3814                                  
  3815                                  .checkreg190:
  3816 00001A20 68[511C]                 push checkreg_12
  3817 00001A23 8D062B81                 lea  ax, [symbol]
  3818 00001A27 50                       push ax
  3819 00001A28 E880E7                   call eqstr
  3820 00001A2B 83C404                   add  sp, 4
  3821 00001A2E 08C0                     or  al, al
  3822 00001A30 0F840600                 je .checkreg191
  3823 00001A34 B81900                   mov ax, 25
  3824 00001A37 E9F201                   jmp .retn
  3825                                  .checkreg191:
  3826 00001A3A 68[541C]                 push checkreg_13
  3827 00001A3D 8D062B81                 lea  ax, [symbol]
  3828 00001A41 50                       push ax
  3829 00001A42 E866E7                   call eqstr
  3830 00001A45 83C404                   add  sp, 4
  3831 00001A48 08C0                     or  al, al
  3832 00001A4A 0F840600                 je .checkreg192
  3833 00001A4E B81B00                   mov ax, 27
  3834 00001A51 E9D801                   jmp .retn
  3835                                  
  3836                                  ;-390   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;
  3837                                  
  3838                                  .checkreg192:
  3839 00001A54 68[571C]                 push checkreg_14
  3840 00001A57 8D062B81                 lea  ax, [symbol]
  3841 00001A5B 50                       push ax
  3842 00001A5C E84CE7                   call eqstr
  3843 00001A5F 83C404                   add  sp, 4
  3844 00001A62 08C0                     or  al, al
  3845 00001A64 0F840600                 je .checkreg193
  3846 00001A68 B81D00                   mov ax, 29
  3847 00001A6B E9BE01                   jmp .retn
  3848                                  .checkreg193:
  3849 00001A6E 68[5A1C]                 push checkreg_15
  3850 00001A71 8D062B81                 lea  ax, [symbol]
  3851 00001A75 50                       push ax
  3852 00001A76 E832E7                   call eqstr
  3853 00001A79 83C404                   add  sp, 4
  3854 00001A7C 08C0                     or  al, al
  3855 00001A7E 0F840600                 je .checkreg194
  3856 00001A82 B81F00                   mov ax, 31
  3857 00001A85 E9A401                   jmp .retn
  3858                                  
  3859                                  ;-391   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;
  3860                                  
  3861                                  .checkreg194:
  3862 00001A88 68[5D1C]                 push checkreg_16
  3863 00001A8B 8D062B81                 lea  ax, [symbol]
  3864 00001A8F 50                       push ax
  3865 00001A90 E818E7                   call eqstr
  3866 00001A93 83C404                   add  sp, 4
  3867 00001A96 08C0                     or  al, al
  3868 00001A98 0F840600                 je .checkreg195
  3869 00001A9C B82100                   mov ax, 33
  3870 00001A9F E98A01                   jmp .retn
  3871                                  .checkreg195:
  3872 00001AA2 68[601C]                 push checkreg_17
  3873 00001AA5 8D062B81                 lea  ax, [symbol]
  3874 00001AA9 50                       push ax
  3875 00001AAA E8FEE6                   call eqstr
  3876 00001AAD 83C404                   add  sp, 4
  3877 00001AB0 08C0                     or  al, al
  3878 00001AB2 0F840600                 je .checkreg196
  3879 00001AB6 B82300                   mov ax, 35
  3880 00001AB9 E97001                   jmp .retn
  3881                                  
  3882                                  ;-392   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;
  3883                                  
  3884                                  .checkreg196:
  3885 00001ABC 68[631C]                 push checkreg_18
  3886 00001ABF 8D062B81                 lea  ax, [symbol]
  3887 00001AC3 50                       push ax
  3888 00001AC4 E8E4E6                   call eqstr
  3889 00001AC7 83C404                   add  sp, 4
  3890 00001ACA 08C0                     or  al, al
  3891 00001ACC 0F840600                 je .checkreg197
  3892 00001AD0 B82500                   mov ax, 37
  3893 00001AD3 E95601                   jmp .retn
  3894                                  .checkreg197:
  3895 00001AD6 68[661C]                 push checkreg_19
  3896 00001AD9 8D062B81                 lea  ax, [symbol]
  3897 00001ADD 50                       push ax
  3898 00001ADE E8CAE6                   call eqstr
  3899 00001AE1 83C404                   add  sp, 4
  3900 00001AE4 08C0                     or  al, al
  3901 00001AE6 0F840600                 je .checkreg198
  3902 00001AEA B82700                   mov ax, 39
  3903 00001AED E93C01                   jmp .retn
  3904                                  
  3905                                  ;-393   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;
  3906                                  
  3907                                  .checkreg198:
  3908 00001AF0 68[691C]                 push checkreg_20
  3909 00001AF3 8D062B81                 lea  ax, [symbol]
  3910 00001AF7 50                       push ax
  3911 00001AF8 E8B0E6                   call eqstr
  3912 00001AFB 83C404                   add  sp, 4
  3913 00001AFE 08C0                     or  al, al
  3914 00001B00 0F840600                 je .checkreg199
  3915 00001B04 B82900                   mov ax, 41
  3916 00001B07 E92201                   jmp .retn
  3917                                  .checkreg199:
  3918 00001B0A 68[6C1C]                 push checkreg_21
  3919 00001B0D 8D062B81                 lea  ax, [symbol]
  3920 00001B11 50                       push ax
  3921 00001B12 E896E6                   call eqstr
  3922 00001B15 83C404                   add  sp, 4
  3923 00001B18 08C0                     or  al, al
  3924 00001B1A 0F840600                 je .checkreg200
  3925 00001B1E B82B00                   mov ax, 43
  3926 00001B21 E90801                   jmp .retn
  3927                                  
  3928                                  ;-394   // (eqstr(symbol,"ip")) return 45;
  3929                                  
  3930                                  
  3931                                  ;-395   if (strlen(symbol) >   3) return 0;
  3932                                  
  3933                                  .checkreg200:
  3934 00001B24 8D062B81                 lea  ax, [symbol]
  3935 00001B28 50                       push ax
  3936 00001B29 E827E6                   call strlen
  3937 00001B2C 83C402                   add  sp, 2
  3938 00001B2F 83F803                   cmp ax, 3
  3939 00001B32 0F8E0600                 jle .checkreg201
  3940 00001B36 B80000                   mov ax, 0
  3941 00001B39 E9F000                   jmp .retn
  3942                                  
  3943                                  ;-396   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;
  3944                                  
  3945                                  .checkreg201:
  3946 00001B3C 68[6F1C]                 push checkreg_22
  3947 00001B3F 8D062B81                 lea  ax, [symbol]
  3948 00001B43 50                       push ax
  3949 00001B44 E864E6                   call eqstr
  3950 00001B47 83C404                   add  sp, 4
  3951 00001B4A 08C0                     or  al, al
  3952 00001B4C 0F840600                 je .checkreg202
  3953 00001B50 B82F00                   mov ax, 47
  3954 00001B53 E9D600                   jmp .retn
  3955                                  .checkreg202:
  3956 00001B56 68[731C]                 push checkreg_23
  3957 00001B59 8D062B81                 lea  ax, [symbol]
  3958 00001B5D 50                       push ax
  3959 00001B5E E84AE6                   call eqstr
  3960 00001B61 83C404                   add  sp, 4
  3961 00001B64 08C0                     or  al, al
  3962 00001B66 0F840600                 je .checkreg203
  3963 00001B6A B83200                   mov ax, 50
  3964 00001B6D E9BC00                   jmp .retn
  3965                                  
  3966                                  ;-397   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;
  3967                                  
  3968                                  .checkreg203:
  3969 00001B70 68[771C]                 push checkreg_24
  3970 00001B73 8D062B81                 lea  ax, [symbol]
  3971 00001B77 50                       push ax
  3972 00001B78 E830E6                   call eqstr
  3973 00001B7B 83C404                   add  sp, 4
  3974 00001B7E 08C0                     or  al, al
  3975 00001B80 0F840600                 je .checkreg204
  3976 00001B84 B83500                   mov ax, 53
  3977 00001B87 E9A200                   jmp .retn
  3978                                  .checkreg204:
  3979 00001B8A 68[7B1C]                 push checkreg_25
  3980 00001B8D 8D062B81                 lea  ax, [symbol]
  3981 00001B91 50                       push ax
  3982 00001B92 E816E6                   call eqstr
  3983 00001B95 83C404                   add  sp, 4
  3984 00001B98 08C0                     or  al, al
  3985 00001B9A 0F840600                 je .checkreg205
  3986 00001B9E B83800                   mov ax, 56
  3987 00001BA1 E98800                   jmp .retn
  3988                                  
  3989                                  ;-398   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;
  3990                                  
  3991                                  .checkreg205:
  3992 00001BA4 68[7F1C]                 push checkreg_26
  3993 00001BA7 8D062B81                 lea  ax, [symbol]
  3994 00001BAB 50                       push ax
  3995 00001BAC E8FCE5                   call eqstr
  3996 00001BAF 83C404                   add  sp, 4
  3997 00001BB2 08C0                     or  al, al
  3998 00001BB4 0F840600                 je .checkreg206
  3999 00001BB8 B83B00                   mov ax, 59
  4000 00001BBB E96E00                   jmp .retn
  4001                                  .checkreg206:
  4002 00001BBE 68[831C]                 push checkreg_27
  4003 00001BC1 8D062B81                 lea  ax, [symbol]
  4004 00001BC5 50                       push ax
  4005 00001BC6 E8E2E5                   call eqstr
  4006 00001BC9 83C404                   add  sp, 4
  4007 00001BCC 08C0                     or  al, al
  4008 00001BCE 0F840600                 je .checkreg207
  4009 00001BD2 B83E00                   mov ax, 62
  4010 00001BD5 E95400                   jmp .retn
  4011                                  
  4012                                  ;-399   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;
  4013                                  
  4014                                  .checkreg207:
  4015 00001BD8 68[871C]                 push checkreg_28
  4016 00001BDB 8D062B81                 lea  ax, [symbol]
  4017 00001BDF 50                       push ax
  4018 00001BE0 E8C8E5                   call eqstr
  4019 00001BE3 83C404                   add  sp, 4
  4020 00001BE6 08C0                     or  al, al
  4021 00001BE8 0F840600                 je .checkreg208
  4022 00001BEC B84100                   mov ax, 65
  4023 00001BEF E93A00                   jmp .retn
  4024                                  .checkreg208:
  4025 00001BF2 68[8B1C]                 push checkreg_29
  4026 00001BF5 8D062B81                 lea  ax, [symbol]
  4027 00001BF9 50                       push ax
  4028 00001BFA E8AEE5                   call eqstr
  4029 00001BFD 83C404                   add  sp, 4
  4030 00001C00 08C0                     or  al, al
  4031 00001C02 0F840600                 je .checkreg209
  4032 00001C06 B84400                   mov ax, 68
  4033 00001C09 E92000                   jmp .retn
  4034                                  
  4035                                  ;-400   if (eqstr(symbol,"cr0")) return 71;
  4036                                  
  4037                                  .checkreg209:
  4038 00001C0C 68[8F1C]                 push checkreg_30
  4039 00001C0F 8D062B81                 lea  ax, [symbol]
  4040 00001C13 50                       push ax
  4041 00001C14 E894E5                   call eqstr
  4042 00001C17 83C404                   add  sp, 4
  4043 00001C1A 08C0                     or  al, al
  4044 00001C1C 0F840600                 je .checkreg210
  4045 00001C20 B84700                   mov ax, 71
  4046 00001C23 E90600                   jmp .retn
  4047                                  
  4048                                  ;-401   return 0;   }
  4049                                  
  4050                                  .checkreg210:
  4051 00001C26 B80000                   mov ax, 0
  4052 00001C29 E90000                   jmp .retn
  4053                                  
  4054                                  ;-402 char printregstr[]
  4055                                  
  4056                                   .retn:
  4057 00001C2C C3                       ret
  4058                                  ; ENDP
  4059 00001C2D 616C00                  checkreg_0 db "al",0
  4060 00001C30 636C00                  checkreg_1 db "cl",0
  4061 00001C33 646C00                  checkreg_2 db "dl",0
  4062 00001C36 626C00                  checkreg_3 db "bl",0
  4063 00001C39 616800                  checkreg_4 db "ah",0
  4064 00001C3C 636800                  checkreg_5 db "ch",0
  4065 00001C3F 646800                  checkreg_6 db "dh",0
  4066 00001C42 626800                  checkreg_7 db "bh",0
  4067 00001C45 617800                  checkreg_8 db "ax",0
  4068 00001C48 637800                  checkreg_9 db "cx",0
  4069 00001C4B 647800                  checkreg_10 db "dx",0
  4070 00001C4E 627800                  checkreg_11 db "bx",0
  4071 00001C51 737000                  checkreg_12 db "sp",0
  4072 00001C54 627000                  checkreg_13 db "bp",0
  4073 00001C57 736900                  checkreg_14 db "si",0
  4074 00001C5A 646900                  checkreg_15 db "di",0
  4075 00001C5D 657300                  checkreg_16 db "es",0
  4076 00001C60 637300                  checkreg_17 db "cs",0
  4077 00001C63 737300                  checkreg_18 db "ss",0
  4078 00001C66 647300                  checkreg_19 db "ds",0
  4079 00001C69 667300                  checkreg_20 db "fs",0
  4080 00001C6C 677300                  checkreg_21 db "gs",0
  4081 00001C6F 65617800                checkreg_22 db "eax",0
  4082 00001C73 65637800                checkreg_23 db "ecx",0
  4083 00001C77 65647800                checkreg_24 db "edx",0
  4084 00001C7B 65627800                checkreg_25 db "ebx",0
  4085 00001C7F 65737000                checkreg_26 db "esp",0
  4086 00001C83 65627000                checkreg_27 db "ebp",0
  4087 00001C87 65736900                checkreg_28 db "esi",0
  4088 00001C8B 65646900                checkreg_29 db "edi",0
  4089 00001C8F 63723000                checkreg_30 db "cr0",0
  4090                                  
  4091                                  ;-403 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";
  4092                                  
  4093 00001C93 2A616C636C646C626C-     printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0
  4094 00001C9C 616863686468626861-
  4095 00001CA5 786378647862787370-
  4096 00001CAE 627073696469657363-
  4097 00001CB7 737373647366736773-
  4098 00001CC0 697065617865637865-
  4099 00001CC9 647865627865737065-
  4100 00001CD2 627065736965646963-
  4101 00001CDB 723000             
  4102                                  
  4103                                  ;-404 //          1         2         3         4         5         6         7
  4104                                  
  4105                                  
  4106                                  ;-405 // 1 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3
  4107                                  
  4108                                  
  4109                                  ;-406 int printreg(int i) {  unsigned int k; unsigned char c;
  4110                                  
  4111                                  
  4112                                  printreg:  ; *** PROC ***
  4113                                  
  4114                                  ;-407   k = &printregstr + i; c=*k; prc(c); i++;
  4115                                  
  4116                                  ;Function : printreg, Number of local variables: 3
  4117                                  ;   # type sign width addr used name   list of local variables
  4118                                  ;  200 var sign word   406 NULL i = bp+4
  4119                                  ;  201 var unsg word   406 NULL k = bp-2
  4120                                  ;  202 var unsg byte   406 NULL c = bp-4;
  4121 00001CDE C8040000                 ENTER  4,0
  4122 00001CE2 B8[931C]                 mov ax, printregstr
  4123 00001CE5 034604                   add ax, [bp+4]
  4124 00001CE8 8946FE                   mov [bp-2], ax
  4125 00001CEB 8B5EFE                   mov bx, [bp-2]
  4126 00001CEE 8B07                     mov ax, [bx]
  4127 00001CF0 8846FC                   mov [bp-4], al
  4128 00001CF3 8A46FC                   mov al, byte [bp-4]
  4129 00001CF6 B400                     mov ah, 0
  4130 00001CF8 50                       push ax
  4131 00001CF9 E86228                   call prc
  4132 00001CFC 83C402                   add  sp, 2
  4133 00001CFF FF4604                   inc  word[bp+4]
  4134                                  
  4135                                  ;-408   k = &printregstr + i; c=*k; prc(c);
  4136                                  
  4137 00001D02 B8[931C]                 mov ax, printregstr
  4138 00001D05 034604                   add ax, [bp+4]
  4139 00001D08 8946FE                   mov [bp-2], ax
  4140 00001D0B 8B5EFE                   mov bx, [bp-2]
  4141 00001D0E 8B07                     mov ax, [bx]
  4142 00001D10 8846FC                   mov [bp-4], al
  4143 00001D13 8A46FC                   mov al, byte [bp-4]
  4144 00001D16 B400                     mov ah, 0
  4145 00001D18 50                       push ax
  4146 00001D19 E84228                   call prc
  4147 00001D1C 83C402                   add  sp, 2
  4148                                  
  4149                                  ;-409   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }
  4150                                  
  4151 00001D1F 8B4604                   mov ax, [bp+4]
  4152 00001D22 83F82F                   cmp ax, 47
  4153 00001D25 0F8E2000                 jle .printreg211
  4154 00001D29 FF4604                   inc  word[bp+4]
  4155 00001D2C B8[931C]                 mov ax, printregstr
  4156 00001D2F 034604                   add ax, [bp+4]
  4157 00001D32 8946FE                   mov [bp-2], ax
  4158 00001D35 8B5EFE                   mov bx, [bp-2]
  4159 00001D38 8B07                     mov ax, [bx]
  4160 00001D3A 8846FC                   mov [bp-4], al
  4161 00001D3D 8A46FC                   mov al, byte [bp-4]
  4162 00001D40 B400                     mov ah, 0
  4163 00001D42 50                       push ax
  4164 00001D43 E81828                   call prc
  4165 00001D46 83C402                   add  sp, 2
  4166                                  
  4167                                  ;-410 }
  4168                                  
  4169                                  .printreg211:
  4170                                  
  4171                                  ;-411 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
  4172 00001D49 C9                       LEAVE
  4173 00001D4A C3                       ret
  4174                                  ; ENDP
  4175 00001D4B 0000                    evalue dw 0
  4176 00001D4D 0A00                    exprtype dw 10
  4177                                  
  4178                                  ;-412 int expr(int isRight)
  4179                                  
  4180                                  
  4181                                  expr:  ; *** PROC ***
  4182                                  
  4183                                  ;-413 { int mode; int id1;     int ixarr; int ixconst;
  4184                                  
  4185                                  
  4186                                  ;-414   int ids;  int isCONST; int i;     unsigned char *p;
  4187                                  
  4188                                  
  4189                                  ;-415   if (istoken(T_CONST)) { evalue=lexval;
  4190                                  
  4191                                  ;Function : expr, Number of local variables: 9
  4192                                  ;   # type sign width addr used name   list of local variables
  4193                                  ;  200 var sign word   412 NULL isRight = bp+4
  4194                                  ;  201 var sign word   413 NULL mode = bp-2
  4195                                  ;  202 var sign word   413 NULL id1 = bp-4
  4196                                  ;  203 var sign word   413 NULL ixarr = bp-6
  4197                                  ;  204 var sign word   413 NULL ixconst = bp-8
  4198                                  ;  205 var sign word   414 NULL ids = bp-10
  4199                                  ;  206 var sign word   414 NULL isCONST = bp-12
  4200                                  ;  207 var sign word   414 NULL i = bp-14
  4201                                  ;  208 ptr unsg byte   414 NULL p = bp-16;
  4202 00001D4F C8100000                 ENTER  16,0
  4203 00001D53 680101                   push 257
  4204 00001D56 E83727                   call istoken
  4205 00001D59 83C402                   add  sp, 2
  4206 00001D5C 08C0                     or  al, al
  4207 00001D5E 0F841F00                 je .expr212
  4208 00001D62 A1[2E00]                 mov ax, [lexval]
  4209 00001D65 A3[4B1D]                 mov word [evalue], ax
  4210                                  
  4211                                  ;-416     prs("\n mov ax, "); prunsign1(lexval); return 4; }
  4212                                  
  4213 00001D68 68[EF20]                 push expr_0
  4214 00001D6B E85728                   call prs
  4215 00001D6E 83C402                   add  sp, 2
  4216 00001D71 FF36[2E00]               push word [lexval]
  4217 00001D75 E8A729                   call prunsign1
  4218 00001D78 83C402                   add  sp, 2
  4219 00001D7B B80400                   mov ax, 4
  4220 00001D7E E96C03                   jmp .retn
  4221                                  
  4222                                  ;-417   mode=typeName(); /*0=V,1=*,2=&*/
  4223                                  
  4224                                  .expr212:
  4225 00001D81 E868ED                   call typeName
  4226 00001D84 8946FE                   mov [bp-2], ax
  4227                                  
  4228                                  ;-418   ireg1=checkreg();
  4229                                  
  4230 00001D87 E846FB                   call checkreg
  4231 00001D8A A3[E710]                 mov word [ireg1], ax
  4232                                  
  4233                                  ;-419   if (ireg1) { doreg1(0); return; }
  4234                                  
  4235 00001D8D A1[E710]                 mov ax, [ireg1]
  4236 00001D90 08C0                     or  al, al
  4237 00001D92 0F840B00                 je .expr213
  4238 00001D96 6A00                     push 0
  4239 00001D98 E849F9                   call doreg1
  4240 00001D9B 83C402                   add  sp, 2
  4241 00001D9E E94C03                   jmp .retn
  4242                                  
  4243                                  ;-420   if (token=='(')  {docall1(); goto e1; }
  4244                                  
  4245                                  .expr213:
  4246 00001DA1 A1[1C00]                 mov ax, [token]
  4247 00001DA4 83F828                   cmp ax, 40
  4248 00001DA7 0F850600                 jne .expr214
  4249 00001DAB E82E0F                   call docall1
  4250 00001DAE E93202                   jmp .e1
  4251                                  
  4252                                  ;-421   if (isreg()) goto e1;
  4253                                  
  4254                                  .expr214:
  4255 00001DB1 E88307                   call isreg
  4256 00001DB4 08C0                     or  al, al
  4257 00001DB6 0F840300                 je .expr215
  4258 00001DBA E92602                   jmp .e1
  4259                                  
  4260                                  ;-422 
  4261                                  
  4262                                  
  4263                                  ;-423   id1=searchname(); gettypes(id1); ids=signi;
  4264                                  
  4265                                  .expr215:
  4266 00001DBD E85DEC                   call searchname
  4267 00001DC0 8946FC                   mov [bp-4], ax
  4268 00001DC3 FF76FC                   push word [bp-4]
  4269 00001DC6 E816EB                   call gettypes
  4270 00001DC9 83C402                   add  sp, 2
  4271 00001DCC A1[3300]                 mov ax, [signi]
  4272 00001DCF 8946F6                   mov [bp-10], ax
  4273                                  
  4274                                  ;-424   ixarr=0;  ixconst=0;
  4275                                  
  4276 00001DD2 B80000                   mov ax, 0
  4277 00001DD5 8946FA                   mov [bp-6], ax
  4278 00001DD8 B80000                   mov ax, 0
  4279 00001DDB 8946F8                   mov [bp-8], ax
  4280                                  
  4281                                  ;-425     if (istoken('[')) { if (istoken(T_CONST)) {
  4282                                  
  4283 00001DDE 6A5B                     push 91
  4284 00001DE0 E8AD26                   call istoken
  4285 00001DE3 83C402                   add  sp, 2
  4286 00001DE6 08C0                     or  al, al
  4287 00001DE8 0F845900                 je .expr216
  4288 00001DEC 680101                   push 257
  4289 00001DEF E89E26                   call istoken
  4290 00001DF2 83C402                   add  sp, 2
  4291 00001DF5 08C0                     or  al, al
  4292 00001DF7 0F841700                 je .expr217
  4293                                  
  4294                                  ;-426       ixconst=1; ixarr=lexval; expect(']');  }
  4295                                  
  4296 00001DFB B80100                   mov ax, 1
  4297 00001DFE 8946F8                   mov [bp-8], ax
  4298 00001E01 A1[2E00]                 mov ax, [lexval]
  4299 00001E04 8946FA                   mov [bp-6], ax
  4300 00001E07 6A5D                     push 93
  4301 00001E09 E8A626                   call expect
  4302 00001E0C 83C402                   add  sp, 2
  4303                                  
  4304                                  ;-427     else {ixarr=searchname(); expect(T_NAME); expect(']');
  4305                                  
  4306 00001E0F E93300                   jmp .expr218
  4307                                  .expr217:
  4308 00001E12 E808EC                   call searchname
  4309 00001E15 8946FA                   mov [bp-6], ax
  4310 00001E18 680001                   push 256
  4311 00001E1B E89426                   call expect
  4312 00001E1E 83C402                   add  sp, 2
  4313 00001E21 6A5D                     push 93
  4314 00001E23 E88C26                   call expect
  4315 00001E26 83C402                   add  sp, 2
  4316                                  
  4317                                  ;-428     gettypes(ixarr);
  4318                                  
  4319 00001E29 FF76FA                   push word [bp-6]
  4320 00001E2C E8B0EA                   call gettypes
  4321 00001E2F 83C402                   add  sp, 2
  4322                                  
  4323                                  ;-429     if (widthi != 2) error1("Arrayindex muss Zahl oder int sein"); } }
  4324                                  
  4325 00001E32 A1[3600]                 mov ax, [widthi]
  4326 00001E35 83F802                   cmp ax, 2
  4327 00001E38 0F840900                 je  .expr219
  4328 00001E3C 68[FB20]                 push expr_1
  4329 00001E3F E86C2A                   call error1
  4330 00001E42 83C402                   add  sp, 2
  4331                                  .expr219:
  4332                                  .expr218:
  4333                                  
  4334                                  ;-430   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Nur var erlaubt");
  4335                                  
  4336                                  .expr216:
  4337 00001E45 68C304                   push 1219
  4338 00001E48 E84526                   call istoken
  4339 00001E4B 83C402                   add  sp, 2
  4340 00001E4E 08C0                     or  al, al
  4341 00001E50 0F844600                 je .expr220
  4342 00001E54 8B46FE                   mov ax, [bp-2]
  4343 00001E57 08C0                     or  al, al
  4344 00001E59 0F840900                 je .expr221
  4345 00001E5D 68[1E21]                 push expr_2
  4346 00001E60 E84B2A                   call error1
  4347 00001E63 83C402                   add  sp, 2
  4348                                  
  4349                                  ;-431      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");
  4350                                  
  4351                                  .expr221:
  4352 00001E66 68[2E21]                 push expr_3
  4353 00001E69 E85927                   call prs
  4354 00001E6C 83C402                   add  sp, 2
  4355 00001E6F A1[3900]                 mov ax, [wi]
  4356 00001E72 83F802                   cmp ax, 2
  4357 00001E75 0F850C00                 jne .expr222
  4358 00001E79 68[3721]                 push expr_4
  4359 00001E7C E84627                   call prs
  4360 00001E7F 83C402                   add  sp, 2
  4361 00001E82 E90900                   jmp .expr223
  4362                                  .expr222:
  4363 00001E85 68[3C21]                 push expr_5
  4364 00001E88 E83A27                   call prs
  4365 00001E8B 83C402                   add  sp, 2
  4366                                  
  4367                                  ;-432      v(id1); goto e1;}
  4368                                  
  4369                                  .expr223:
  4370 00001E8E FF76FC                   push word [bp-4]
  4371 00001E91 E89DE5                   call v
  4372 00001E94 83C402                   add  sp, 2
  4373 00001E97 E94901                   jmp .e1
  4374                                  
  4375                                  ;-433   if (istoken(T_MINUSMINUS)) {if(mode)error1("Nur var erlaubt");
  4376                                  
  4377                                  .expr220:
  4378 00001E9A 68C904                   push 1225
  4379 00001E9D E8F025                   call istoken
  4380 00001EA0 83C402                   add  sp, 2
  4381 00001EA3 08C0                     or  al, al
  4382 00001EA5 0F844600                 je .expr224
  4383 00001EA9 8B46FE                   mov ax, [bp-2]
  4384 00001EAC 08C0                     or  al, al
  4385 00001EAE 0F840900                 je .expr225
  4386 00001EB2 68[4121]                 push expr_6
  4387 00001EB5 E8F629                   call error1
  4388 00001EB8 83C402                   add  sp, 2
  4389                                  
  4390                                  ;-434      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");
  4391                                  
  4392                                  .expr225:
  4393 00001EBB 68[5121]                 push expr_7
  4394 00001EBE E80427                   call prs
  4395 00001EC1 83C402                   add  sp, 2
  4396 00001EC4 A1[3900]                 mov ax, [wi]
  4397 00001EC7 83F802                   cmp ax, 2
  4398 00001ECA 0F850C00                 jne .expr226
  4399 00001ECE 68[5A21]                 push expr_8
  4400 00001ED1 E8F126                   call prs
  4401 00001ED4 83C402                   add  sp, 2
  4402 00001ED7 E90900                   jmp .expr227
  4403                                  .expr226:
  4404 00001EDA 68[5F21]                 push expr_9
  4405 00001EDD E8E526                   call prs
  4406 00001EE0 83C402                   add  sp, 2
  4407                                  
  4408                                  ;-435      v(id1); goto e1;}
  4409                                  
  4410                                  .expr227:
  4411 00001EE3 FF76FC                   push word [bp-4]
  4412 00001EE6 E848E5                   call v
  4413 00001EE9 83C402                   add  sp, 2
  4414 00001EEC E9F400                   jmp .e1
  4415                                  
  4416                                  ;-436        
  4417                                  
  4418                                  
  4419                                  ;-437   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}
  4420                                  
  4421                                  .expr224:
  4422 00001EEF 68CE04                   push 1230
  4423 00001EF2 E89B25                   call istoken
  4424 00001EF5 83C402                   add  sp, 2
  4425 00001EF8 08C0                     or  al, al
  4426 00001EFA 0F841200                 je .expr228
  4427 00001EFE FF76FC                   push word [bp-4]
  4428 00001F01 FF76FE                   push word [bp-2]
  4429 00001F04 68[6421]                 push expr_10
  4430 00001F07 E8A802                   call compoundass
  4431 00001F0A 83C406                   add  sp, 6
  4432 00001F0D E9D300                   jmp .e1
  4433                                  
  4434                                  ;-438   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}
  4435                                  
  4436                                  .expr228:
  4437 00001F10 68CF04                   push 1231
  4438 00001F13 E87A25                   call istoken
  4439 00001F16 83C402                   add  sp, 2
  4440 00001F19 08C0                     or  al, al
  4441 00001F1B 0F841200                 je .expr229
  4442 00001F1F FF76FC                   push word [bp-4]
  4443 00001F22 FF76FE                   push word [bp-2]
  4444 00001F25 68[6821]                 push expr_11
  4445 00001F28 E88702                   call compoundass
  4446 00001F2B 83C406                   add  sp, 6
  4447 00001F2E E9B200                   jmp .e1
  4448                                  
  4449                                  ;-439   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}
  4450                                  
  4451                                  .expr229:
  4452 00001F31 68D204                   push 1234
  4453 00001F34 E85925                   call istoken
  4454 00001F37 83C402                   add  sp, 2
  4455 00001F3A 08C0                     or  al, al
  4456 00001F3C 0F841200                 je .expr230
  4457 00001F40 FF76FC                   push word [bp-4]
  4458 00001F43 FF76FE                   push word [bp-2]
  4459 00001F46 68[6C21]                 push expr_12
  4460 00001F49 E86602                   call compoundass
  4461 00001F4C 83C406                   add  sp, 6
  4462 00001F4F E99100                   jmp .e1
  4463                                  
  4464                                  ;-440   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}    
  4465                                  
  4466                                  .expr230:
  4467 00001F52 68D304                   push 1235
  4468 00001F55 E83825                   call istoken
  4469 00001F58 83C402                   add  sp, 2
  4470 00001F5B 08C0                     or  al, al
  4471 00001F5D 0F841200                 je .expr231
  4472 00001F61 FF76FC                   push word [bp-4]
  4473 00001F64 FF76FE                   push word [bp-2]
  4474 00001F67 68[7021]                 push expr_13
  4475 00001F6A E84502                   call compoundass
  4476 00001F6D 83C406                   add  sp, 6
  4477 00001F70 E97000                   jmp .e1
  4478                                  
  4479                                  ;-441   if (istoken(T_MULASS    )) {error1("not implemented");}
  4480                                  
  4481                                  .expr231:
  4482 00001F73 68D004                   push 1232
  4483 00001F76 E81725                   call istoken
  4484 00001F79 83C402                   add  sp, 2
  4485 00001F7C 08C0                     or  al, al
  4486 00001F7E 0F840900                 je .expr232
  4487 00001F82 68[7321]                 push expr_14
  4488 00001F85 E82629                   call error1
  4489 00001F88 83C402                   add  sp, 2
  4490                                  
  4491                                  ;-442   if (istoken(T_DIVASS    )) {error1("not implemented");}
  4492                                  
  4493                                  .expr232:
  4494 00001F8B 68D104                   push 1233
  4495 00001F8E E8FF24                   call istoken
  4496 00001F91 83C402                   add  sp, 2
  4497 00001F94 08C0                     or  al, al
  4498 00001F96 0F840900                 je .expr233
  4499 00001F9A 68[8321]                 push expr_15
  4500 00001F9D E80E29                   call error1
  4501 00001FA0 83C402                   add  sp, 2
  4502                                  
  4503                                  ;-443 
  4504                                  
  4505                                  
  4506                                  ;-444   if (istoken('=')) { exprtype= expr(1); 
  4507                                  
  4508                                  .expr233:
  4509 00001FA3 6A3D                     push 61
  4510 00001FA5 E8E824                   call istoken
  4511 00001FA8 83C402                   add  sp, 2
  4512 00001FAB 08C0                     or  al, al
  4513 00001FAD 0F842000                 je .expr234
  4514 00001FB1 6A01                     push 1
  4515 00001FB3 E899FD                   call expr
  4516 00001FB6 83C402                   add  sp, 2
  4517 00001FB9 A3[4D1D]                 mov word [exprtype], ax
  4518                                  
  4519                                  ;-445   doassign(mode, id1, ixarr, ixconst); goto e1;  }
  4520                                  
  4521 00001FBC FF76F8                   push word [bp-8]
  4522 00001FBF FF76FA                   push word [bp-6]
  4523 00001FC2 FF76FC                   push word [bp-4]
  4524 00001FC5 FF76FE                   push word [bp-2]
  4525 00001FC8 E85E08                   call doassign
  4526 00001FCB 83C408                   add  sp, 8
  4527 00001FCE E91200                   jmp .e1
  4528                                  
  4529                                  ;-446   dovar1(mode, "mov", ixarr, id1);
  4530                                  
  4531                                  .expr234:
  4532 00001FD1 FF76FC                   push word [bp-4]
  4533 00001FD4 FF76FA                   push word [bp-6]
  4534 00001FD7 68[9321]                 push expr_16
  4535 00001FDA FF76FE                   push word [bp-2]
  4536 00001FDD E87402                   call dovar1
  4537 00001FE0 83C408                   add  sp, 8
  4538                                  
  4539                                  ;-447   
  4540                                  
  4541                                  
  4542                                  ;-448 e1:    if (istoken('+')) rterm("add");
  4543                                  
  4544                                  .e1:
  4545 00001FE3 6A2B                     push 43
  4546 00001FE5 E8A824                   call istoken
  4547 00001FE8 83C402                   add  sp, 2
  4548 00001FEB 08C0                     or  al, al
  4549 00001FED 0F840C00                 je .expr235
  4550 00001FF1 68[9721]                 push expr_17
  4551 00001FF4 E82704                   call rterm
  4552 00001FF7 83C402                   add  sp, 2
  4553                                  
  4554                                  ;-449   else if (istoken('-')) rterm("sub" );
  4555                                  
  4556 00001FFA E9CF00                   jmp .expr236
  4557                                  .expr235:
  4558 00001FFD 6A2D                     push 45
  4559 00001FFF E88E24                   call istoken
  4560 00002002 83C402                   add  sp, 2
  4561 00002005 08C0                     or  al, al
  4562 00002007 0F840C00                 je .expr237
  4563 0000200B 68[9B21]                 push expr_18
  4564 0000200E E80D04                   call rterm
  4565 00002011 83C402                   add  sp, 2
  4566                                  
  4567                                  ;-450   else if (istoken('&')) rterm("and" );
  4568                                  
  4569 00002014 E9B500                   jmp .expr238
  4570                                  .expr237:
  4571 00002017 6A26                     push 38
  4572 00002019 E87424                   call istoken
  4573 0000201C 83C402                   add  sp, 2
  4574 0000201F 08C0                     or  al, al
  4575 00002021 0F840C00                 je .expr239
  4576 00002025 68[9F21]                 push expr_19
  4577 00002028 E8F303                   call rterm
  4578 0000202B 83C402                   add  sp, 2
  4579                                  
  4580                                  ;-451   else if (istoken('|')) rterm("or" );  
  4581                                  
  4582 0000202E E99B00                   jmp .expr240
  4583                                  .expr239:
  4584 00002031 6A7C                     push 124
  4585 00002033 E85A24                   call istoken
  4586 00002036 83C402                   add  sp, 2
  4587 00002039 08C0                     or  al, al
  4588 0000203B 0F840C00                 je .expr241
  4589 0000203F 68[A321]                 push expr_20
  4590 00002042 E8D903                   call rterm
  4591 00002045 83C402                   add  sp, 2
  4592                                  
  4593                                  ;-452   else if (istoken(T_LESSLESS)) rterm("shl");
  4594                                  
  4595 00002048 E98100                   jmp .expr242
  4596                                  .expr241:
  4597 0000204B 68D804                   push 1240
  4598 0000204E E83F24                   call istoken
  4599 00002051 83C402                   add  sp, 2
  4600 00002054 08C0                     or  al, al
  4601 00002056 0F840C00                 je .expr243
  4602 0000205A 68[A621]                 push expr_21
  4603 0000205D E8BE03                   call rterm
  4604 00002060 83C402                   add  sp, 2
  4605                                  
  4606                                  ;-453   else if (istoken(T_GREATGREAT)) rterm("shr");  
  4607                                  
  4608 00002063 E96600                   jmp .expr244
  4609                                  .expr243:
  4610 00002066 68D904                   push 1241
  4611 00002069 E82424                   call istoken
  4612 0000206C 83C402                   add  sp, 2
  4613 0000206F 08C0                     or  al, al
  4614 00002071 0F840C00                 je .expr245
  4615 00002075 68[AA21]                 push expr_22
  4616 00002078 E8A303                   call rterm
  4617 0000207B 83C402                   add  sp, 2
  4618                                  
  4619                                  ;-454   else if (istoken('*')) domul (ids);
  4620                                  
  4621 0000207E E94B00                   jmp .expr246
  4622                                  .expr245:
  4623 00002081 6A2A                     push 42
  4624 00002083 E80A24                   call istoken
  4625 00002086 83C402                   add  sp, 2
  4626 00002089 08C0                     or  al, al
  4627 0000208B 0F840C00                 je .expr247
  4628 0000208F FF76F6                   push word [bp-10]
  4629 00002092 E8DD09                   call domul
  4630 00002095 83C402                   add  sp, 2
  4631                                  
  4632                                  ;-455   else if (istoken('/')) doidiv(ids);
  4633                                  
  4634 00002098 E93100                   jmp .expr248
  4635                                  .expr247:
  4636 0000209B 6A2F                     push 47
  4637 0000209D E8F023                   call istoken
  4638 000020A0 83C402                   add  sp, 2
  4639 000020A3 08C0                     or  al, al
  4640 000020A5 0F840C00                 je .expr249
  4641 000020A9 FF76F6                   push word [bp-10]
  4642 000020AC E8640A                   call doidiv
  4643 000020AF 83C402                   add  sp, 2
  4644                                  
  4645                                  ;-456   else if (istoken('%')) domod (ids);
  4646                                  
  4647 000020B2 E91700                   jmp .expr250
  4648                                  .expr249:
  4649 000020B5 6A25                     push 37
  4650 000020B7 E8D623                   call istoken
  4651 000020BA 83C402                   add  sp, 2
  4652 000020BD 08C0                     or  al, al
  4653 000020BF 0F840900                 je .expr251
  4654 000020C3 FF76F6                   push word [bp-10]
  4655 000020C6 E8ED0B                   call domod
  4656 000020C9 83C402                   add  sp, 2
  4657                                  
  4658                                  ;-457   if (isrelational()) { rterm("cmp"); cmpneg(ids);}
  4659                                  
  4660                                  .expr251:
  4661                                  .expr250:
  4662                                  .expr248:
  4663                                  .expr246:
  4664                                  .expr244:
  4665                                  .expr242:
  4666                                  .expr240:
  4667                                  .expr238:
  4668                                  .expr236:
  4669 000020CC E8361C                   call isrelational
  4670 000020CF 08C0                     or  al, al
  4671 000020D1 0F841200                 je .expr252
  4672 000020D5 68[AE21]                 push expr_23
  4673 000020D8 E84303                   call rterm
  4674 000020DB 83C402                   add  sp, 2
  4675 000020DE FF76F6                   push word [bp-10]
  4676 000020E1 E86E19                   call cmpneg
  4677 000020E4 83C402                   add  sp, 2
  4678                                  
  4679                                  ;-458   return 0;
  4680                                  
  4681                                  .expr252:
  4682 000020E7 B80000                   mov ax, 0
  4683 000020EA E90000                   jmp .retn
  4684                                  
  4685                                  ;-459 }
  4686                                  
  4687                                  
  4688                                  ;-460 
  4689                                  
  4690                                  
  4691                                  ;-461 int compoundass(char *op, int mode, int id1) {
  4692                                  
  4693 000020ED C9                       .retn: LEAVE
  4694 000020EE C3                       ret
  4695                                  ; ENDP
  4696 000020EF 5C6E206D6F76206178-     expr_0 db "\n mov ax, ",0
  4697 000020F8 2C2000             
  4698 000020FB 4172726179696E6465-     expr_1 db "Arrayindex muss Zahl oder int sein",0
  4699 00002104 78206D757373205A61-
  4700 0000210D 686C206F6465722069-
  4701 00002116 6E74207365696E00   
  4702 0000211E 4E7572207661722065-     expr_2 db "Nur var erlaubt",0
  4703 00002127 726C6175627400     
  4704 0000212E 5C6E20696E63202000      expr_3 db "\n inc  ",0
  4705 00002137 776F726400              expr_4 db "word",0
  4706 0000213C 6279746500              expr_5 db "byte",0
  4707 00002141 4E7572207661722065-     expr_6 db "Nur var erlaubt",0
  4708 0000214A 726C6175627400     
  4709 00002151 5C6E20646563202000      expr_7 db "\n dec  ",0
  4710 0000215A 776F726400              expr_8 db "word",0
  4711 0000215F 6279746500              expr_9 db "byte",0
  4712 00002164 61646400                expr_10 db "add",0
  4713 00002168 73756200                expr_11 db "sub",0
  4714 0000216C 616E6400                expr_12 db "and",0
  4715 00002170 6F7200                  expr_13 db "or",0
  4716 00002173 6E6F7420696D706C65-     expr_14 db "not implemented",0
  4717 0000217C 6D656E74656400     
  4718 00002183 6E6F7420696D706C65-     expr_15 db "not implemented",0
  4719 0000218C 6D656E74656400     
  4720 00002193 6D6F7600                expr_16 db "mov",0
  4721 00002197 61646400                expr_17 db "add",0
  4722 0000219B 73756200                expr_18 db "sub",0
  4723 0000219F 616E6400                expr_19 db "and",0
  4724 000021A3 6F7200                  expr_20 db "or",0
  4725 000021A6 73686C00                expr_21 db "shl",0
  4726 000021AA 73687200                expr_22 db "shr",0
  4727 000021AE 636D7000                expr_23 db "cmp",0
  4728                                  
  4729                                  compoundass:  ; *** PROC ***
  4730                                  
  4731                                  ;-462   if(mode) error1("only scalar Var allowed");
  4732                                  
  4733                                  ;Function : compoundass, Number of local variables: 3
  4734                                  ;   # type sign width addr used name   list of local variables
  4735                                  ;  200 ptr sign byte   461 NULL op = bp+4
  4736                                  ;  201 var sign word   461 NULL mode = bp+6
  4737                                  ;  202 var sign word   461 NULL id1 = bp+8;
  4738 000021B2 C8000000                 ENTER  0,0
  4739 000021B6 8B4606                   mov ax, [bp+6]
  4740 000021B9 08C0                     or  al, al
  4741 000021BB 0F840900                 je .compoundass253
  4742 000021BF 68[2C22]                 push compoundass_0
  4743 000021C2 E8E926                   call error1
  4744 000021C5 83C402                   add  sp, 2
  4745                                  
  4746                                  ;-463   prnl(); prs(op); prs("  "); 
  4747                                  
  4748                                  .compoundass253:
  4749 000021C8 E8EC23                   call prnl
  4750 000021CB FF7604                   push word [bp+4]
  4751 000021CE E8F423                   call prs
  4752 000021D1 83C402                   add  sp, 2
  4753 000021D4 68[4422]                 push compoundass_1
  4754 000021D7 E8EB23                   call prs
  4755 000021DA 83C402                   add  sp, 2
  4756                                  
  4757                                  ;-464   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  4758                                  
  4759 000021DD FF7608                   push word [bp+8]
  4760 000021E0 E8FCE6                   call gettypes
  4761 000021E3 83C402                   add  sp, 2
  4762 000021E6 A1[3900]                 mov ax, [wi]
  4763 000021E9 83F802                   cmp ax, 2
  4764 000021EC 0F850C00                 jne .compoundass254
  4765 000021F0 68[4722]                 push compoundass_2
  4766 000021F3 E8CF23                   call prs
  4767 000021F6 83C402                   add  sp, 2
  4768 000021F9 E90900                   jmp .compoundass255
  4769                                  .compoundass254:
  4770 000021FC 68[4C22]                 push compoundass_3
  4771 000021FF E8C323                   call prs
  4772 00002202 83C402                   add  sp, 2
  4773                                  
  4774                                  ;-465   v(id1); prs(", ");
  4775                                  
  4776                                  .compoundass255:
  4777 00002205 FF7608                   push word [bp+8]
  4778 00002208 E826E2                   call v
  4779 0000220B 83C402                   add  sp, 2
  4780 0000220E 68[5122]                 push compoundass_4
  4781 00002211 E8B123                   call prs
  4782 00002214 83C402                   add  sp, 2
  4783                                  
  4784                                  ;-466   expect(T_CONST); prunsign1(lexval);
  4785                                  
  4786 00002217 680101                   push 257
  4787 0000221A E89522                   call expect
  4788 0000221D 83C402                   add  sp, 2
  4789 00002220 FF36[2E00]               push word [lexval]
  4790 00002224 E8F824                   call prunsign1
  4791 00002227 83C402                   add  sp, 2
  4792                                  
  4793                                  ;-467 }
  4794                                  
  4795                                  
  4796                                  ;-468 int dovar1(int mode, int op, int ixarr, int id1) { 
  4797 0000222A C9                       LEAVE
  4798 0000222B C3                       ret
  4799                                  ; ENDP
  4800 0000222C 6F6E6C79207363616C-     compoundass_0 db "only scalar Var allowed",0
  4801 00002235 61722056617220616C-
  4802 0000223E 6C6F77656400       
  4803 00002244 202000                  compoundass_1 db "  ",0
  4804 00002247 776F726400              compoundass_2 db "word",0
  4805 0000224C 6279746500              compoundass_3 db "byte",0
  4806 00002251 2C2000                  compoundass_4 db ", ",0
  4807                                  
  4808                                  dovar1:  ; *** PROC ***
  4809                                  
  4810                                  ;-469   gettypes(id1);
  4811                                  
  4812                                  ;Function : dovar1, Number of local variables: 4
  4813                                  ;   # type sign width addr used name   list of local variables
  4814                                  ;  200 var sign word   468 NULL mode = bp+4
  4815                                  ;  201 var sign word   468 NULL op = bp+6
  4816                                  ;  202 var sign word   468 NULL ixarr = bp+8
  4817                                  ;  203 var sign word   468 NULL id1 = bp+10;
  4818 00002254 C8000000                 ENTER  0,0
  4819 00002258 FF760A                   push word [bp+10]
  4820 0000225B E881E6                   call gettypes
  4821 0000225E 83C402                   add  sp, 2
  4822                                  
  4823                                  ;-470   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);
  4824                                  
  4825 00002261 8B4604                   mov ax, [bp+4]
  4826 00002264 83F801                   cmp ax, 1
  4827 00002267 0F854700                 jne .dovar1256
  4828 0000226B 68[A923]                 push dovar1_0
  4829 0000226E E85423                   call prs
  4830 00002271 83C402                   add  sp, 2
  4831 00002274 FF760A                   push word [bp+10]
  4832 00002277 E8B7E1                   call v
  4833 0000227A 83C402                   add  sp, 2
  4834 0000227D E83723                   call prnl
  4835 00002280 FF7606                   push word [bp+6]
  4836 00002283 E83F23                   call prs
  4837 00002286 83C402                   add  sp, 2
  4838                                  
  4839                                  ;-471     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");
  4840                                  
  4841 00002289 A1[3600]                 mov ax, [widthi]
  4842 0000228C 83F801                   cmp ax, 1
  4843 0000228F 0F850900                 jne .dovar1257
  4844 00002293 68[B523]                 push dovar1_1
  4845 00002296 E82C23                   call prs
  4846 00002299 83C402                   add  sp, 2
  4847                                  
  4848                                  ;-472     if(widthi == 2) prs(" ax, [bx]");
  4849                                  
  4850                                  .dovar1257:
  4851 0000229C A1[3600]                 mov ax, [widthi]
  4852 0000229F 83F802                   cmp ax, 2
  4853 000022A2 0F850900                 jne .dovar1258
  4854 000022A6 68[CB23]                 push dovar1_2
  4855 000022A9 E81923                   call prs
  4856 000022AC 83C402                   add  sp, 2
  4857                                  
  4858                                  ;-473     return; }
  4859                                  
  4860                                  .dovar1258:
  4861 000022AF E9F500                   jmp .retn
  4862                                  
  4863                                  ;-474   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }
  4864                                  
  4865                                  .dovar1256:
  4866 000022B2 8B4604                   mov ax, [bp+4]
  4867 000022B5 83F802                   cmp ax, 2
  4868 000022B8 0F852100                 jne .dovar1259
  4869 000022BC E8F822                   call prnl
  4870 000022BF FF7606                   push word [bp+6]
  4871 000022C2 E80023                   call prs
  4872 000022C5 83C402                   add  sp, 2
  4873 000022C8 68[D523]                 push dovar1_3
  4874 000022CB E8F722                   call prs
  4875 000022CE 83C402                   add  sp, 2
  4876 000022D1 FF760A                   push word [bp+10]
  4877 000022D4 E84BE1                   call a
  4878 000022D7 83C402                   add  sp, 2
  4879 000022DA E9CA00                   jmp .retn
  4880                                  
  4881                                  ;-475   if (ixarr) {
  4882                                  
  4883                                  .dovar1259:
  4884 000022DD 8B4608                   mov ax, [bp+8]
  4885 000022E0 08C0                     or  al, al
  4886 000022E2 0F847300                 je .dovar1260
  4887                                  
  4888                                  ;-476     prs("\n mov bx, "); v(ixarr);
  4889                                  
  4890 000022E6 68[DB23]                 push dovar1_4
  4891 000022E9 E8D922                   call prs
  4892 000022EC 83C402                   add  sp, 2
  4893 000022EF FF7608                   push word [bp+8]
  4894 000022F2 E83CE1                   call v
  4895 000022F5 83C402                   add  sp, 2
  4896                                  
  4897                                  ;-477     if (wi==2) prs("\n shl bx, 1");
  4898                                  
  4899 000022F8 A1[3900]                 mov ax, [wi]
  4900 000022FB 83F802                   cmp ax, 2
  4901 000022FE 0F850900                 jne .dovar1261
  4902 00002302 68[E723]                 push dovar1_5
  4903 00002305 E8BD22                   call prs
  4904 00002308 83C402                   add  sp, 2
  4905                                  
  4906                                  ;-478     prs("\n "); prs(op);
  4907                                  
  4908                                  .dovar1261:
  4909 0000230B 68[F423]                 push dovar1_6
  4910 0000230E E8B422                   call prs
  4911 00002311 83C402                   add  sp, 2
  4912 00002314 FF7606                   push word [bp+6]
  4913 00002317 E8AB22                   call prs
  4914 0000231A 83C402                   add  sp, 2
  4915                                  
  4916                                  ;-479     if (wi==2) prs(" ax, "); else prs(" al, ");
  4917                                  
  4918 0000231D A1[3900]                 mov ax, [wi]
  4919 00002320 83F802                   cmp ax, 2
  4920 00002323 0F850C00                 jne .dovar1262
  4921 00002327 68[F823]                 push dovar1_7
  4922 0000232A E89822                   call prs
  4923 0000232D 83C402                   add  sp, 2
  4924 00002330 E90900                   jmp .dovar1263
  4925                                  .dovar1262:
  4926 00002333 68[FE23]                 push dovar1_8
  4927 00002336 E88C22                   call prs
  4928 00002339 83C402                   add  sp, 2
  4929                                  
  4930                                  ;-480 // v(id1); prs(" [bx]");
  4931                                  
  4932                                  
  4933                                  ;-481     prc('['); printName(id1); prs(" + bx]"); 
  4934                                  
  4935                                  .dovar1263:
  4936 0000233C 6A5B                     push 91
  4937 0000233E E81D22                   call prc
  4938 00002341 83C402                   add  sp, 2
  4939 00002344 FF760A                   push word [bp+10]
  4940 00002347 E86FE6                   call printName
  4941 0000234A 83C402                   add  sp, 2
  4942 0000234D 68[0424]                 push dovar1_9
  4943 00002350 E87222                   call prs
  4944 00002353 83C402                   add  sp, 2
  4945                                  
  4946                                  ;-482     return; }
  4947                                  
  4948 00002356 E94E00                   jmp .retn
  4949                                  
  4950                                  ;-483   prnl();prs(op);
  4951                                  
  4952                                  .dovar1260:
  4953 00002359 E85B22                   call prnl
  4954 0000235C FF7606                   push word [bp+6]
  4955 0000235F E86322                   call prs
  4956 00002362 83C402                   add  sp, 2
  4957                                  
  4958                                  ;-484   if(wi==1) prs(" al, ");
  4959                                  
  4960 00002365 A1[3900]                 mov ax, [wi]
  4961 00002368 83F801                   cmp ax, 1
  4962 0000236B 0F850900                 jne .dovar1264
  4963 0000236F 68[0B24]                 push dovar1_10
  4964 00002372 E85022                   call prs
  4965 00002375 83C402                   add  sp, 2
  4966                                  
  4967                                  ;-485   if(wi==2) prs(" ax, ");
  4968                                  
  4969                                  .dovar1264:
  4970 00002378 A1[3900]                 mov ax, [wi]
  4971 0000237B 83F802                   cmp ax, 2
  4972 0000237E 0F850900                 jne .dovar1265
  4973 00002382 68[1124]                 push dovar1_11
  4974 00002385 E83D22                   call prs
  4975 00002388 83C402                   add  sp, 2
  4976                                  
  4977                                  ;-486   if(wi==4) prs(" eax, ");
  4978                                  
  4979                                  .dovar1265:
  4980 0000238B A1[3900]                 mov ax, [wi]
  4981 0000238E 83F804                   cmp ax, 4
  4982 00002391 0F850900                 jne .dovar1266
  4983 00002395 68[1724]                 push dovar1_12
  4984 00002398 E82A22                   call prs
  4985 0000239B 83C402                   add  sp, 2
  4986                                  
  4987                                  ;-487   v(id1);
  4988                                  
  4989                                  .dovar1266:
  4990 0000239E FF760A                   push word [bp+10]
  4991 000023A1 E88DE0                   call v
  4992 000023A4 83C402                   add  sp, 2
  4993                                  
  4994                                  ;-488 }
  4995                                  
  4996                                  
  4997                                  ;-489 int rterm(char *op) {int mode; int opint; int ixarr; int id1;
  4998                                  
  4999 000023A7 C9                       .retn: LEAVE
  5000 000023A8 C3                       ret
  5001                                  ; ENDP
  5002 000023A9 5C6E206D6F76206278-     dovar1_0 db "\n mov bx, ",0
  5003 000023B2 2C2000             
  5004 000023B5 20616C2C205B62785D-     dovar1_1 db " al, [bx]\n mov ah, 0",0
  5005 000023BE 5C6E206D6F76206168-
  5006 000023C7 2C203000           
  5007 000023CB 2061782C205B62785D-     dovar1_2 db " ax, [bx]",0
  5008 000023D4 00                 
  5009 000023D5 2061782C2000            dovar1_3 db " ax, ",0
  5010 000023DB 5C6E206D6F76206278-     dovar1_4 db "\n mov bx, ",0
  5011 000023E4 2C2000             
  5012 000023E7 5C6E2073686C206278-     dovar1_5 db "\n shl bx, 1",0
  5013 000023F0 2C203100           
  5014 000023F4 5C6E2000                dovar1_6 db "\n ",0
  5015 000023F8 2061782C2000            dovar1_7 db " ax, ",0
  5016 000023FE 20616C2C2000            dovar1_8 db " al, ",0
  5017 00002404 202B2062785D00          dovar1_9 db " + bx]",0
  5018 0000240B 20616C2C2000            dovar1_10 db " al, ",0
  5019 00002411 2061782C2000            dovar1_11 db " ax, ",0
  5020 00002417 206561782C2000          dovar1_12 db " eax, ",0
  5021                                  
  5022                                  rterm:  ; *** PROC ***
  5023                                  
  5024                                  ;-490   if (istoken(T_CONST)) { prnl(); prs(op); 
  5025                                  
  5026                                  ;Function : rterm, Number of local variables: 5
  5027                                  ;   # type sign width addr used name   list of local variables
  5028                                  ;  200 ptr sign byte   489 NULL op = bp+4
  5029                                  ;  201 var sign word   489 NULL mode = bp-2
  5030                                  ;  202 var sign word   489 NULL opint = bp-4
  5031                                  ;  203 var sign word   489 NULL ixarr = bp-6
  5032                                  ;  204 var sign word   489 NULL id1 = bp-8;
  5033 0000241E C8080000                 ENTER  8,0
  5034 00002422 680101                   push 257
  5035 00002425 E86820                   call istoken
  5036 00002428 83C402                   add  sp, 2
  5037 0000242B 08C0                     or  al, al
  5038 0000242D 0F845200                 je .rterm267
  5039 00002431 E88321                   call prnl
  5040 00002434 FF7604                   push word [bp+4]
  5041 00002437 E88B21                   call prs
  5042 0000243A 83C402                   add  sp, 2
  5043                                  
  5044                                  ;-491     if (wi==1) prs(" al, ");
  5045                                  
  5046 0000243D A1[3900]                 mov ax, [wi]
  5047 00002440 83F801                   cmp ax, 1
  5048 00002443 0F850900                 jne .rterm268
  5049 00002447 68[0725]                 push rterm_0
  5050 0000244A E87821                   call prs
  5051 0000244D 83C402                   add  sp, 2
  5052                                  
  5053                                  ;-492     if (wi==2) prs(" ax, ");
  5054                                  
  5055                                  .rterm268:
  5056 00002450 A1[3900]                 mov ax, [wi]
  5057 00002453 83F802                   cmp ax, 2
  5058 00002456 0F850900                 jne .rterm269
  5059 0000245A 68[0D25]                 push rterm_1
  5060 0000245D E86521                   call prs
  5061 00002460 83C402                   add  sp, 2
  5062                                  
  5063                                  ;-493     if (wi==4) prs(" eax, ");
  5064                                  
  5065                                  .rterm269:
  5066 00002463 A1[3900]                 mov ax, [wi]
  5067 00002466 83F804                   cmp ax, 4
  5068 00002469 0F850900                 jne .rterm270
  5069 0000246D 68[1325]                 push rterm_2
  5070 00002470 E85221                   call prs
  5071 00002473 83C402                   add  sp, 2
  5072                                  
  5073                                  ;-494     prunsign1(lexval); return;}
  5074                                  
  5075                                  .rterm270:
  5076 00002476 FF36[2E00]               push word [lexval]
  5077 0000247A E8A222                   call prunsign1
  5078 0000247D 83C402                   add  sp, 2
  5079 00002480 E98200                   jmp .retn
  5080                                  
  5081                                  ;-495   mode=typeName(); id1=searchname(); ixarr=0;
  5082                                  
  5083                                  .rterm267:
  5084 00002483 E866E6                   call typeName
  5085 00002486 8946FE                   mov [bp-2], ax
  5086 00002489 E891E5                   call searchname
  5087 0000248C 8946F8                   mov [bp-8], ax
  5088 0000248F B80000                   mov ax, 0
  5089 00002492 8946FA                   mov [bp-6], ax
  5090                                  
  5091                                  ;-496   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');  
  5092                                  
  5093 00002495 6A5B                     push 91
  5094 00002497 E8F61F                   call istoken
  5095 0000249A 83C402                   add  sp, 2
  5096 0000249D 08C0                     or  al, al
  5097 0000249F 0F843300                 je .rterm271
  5098 000024A3 E877E5                   call searchname
  5099 000024A6 8946FA                   mov [bp-6], ax
  5100 000024A9 680001                   push 256
  5101 000024AC E80320                   call expect
  5102 000024AF 83C402                   add  sp, 2
  5103 000024B2 6A5D                     push 93
  5104 000024B4 E8FB1F                   call expect
  5105 000024B7 83C402                   add  sp, 2
  5106                                  
  5107                                  ;-497     gettypes(ixarr);
  5108                                  
  5109 000024BA FF76FA                   push word [bp-6]
  5110 000024BD E81FE4                   call gettypes
  5111 000024C0 83C402                   add  sp, 2
  5112                                  
  5113                                  ;-498     if (widthi != 2) error1("Arrayindex muss int sein"); }
  5114                                  
  5115 000024C3 A1[3600]                 mov ax, [widthi]
  5116 000024C6 83F802                   cmp ax, 2
  5117 000024C9 0F840900                 je  .rterm272
  5118 000024CD 68[1A25]                 push rterm_3
  5119 000024D0 E8DB23                   call error1
  5120 000024D3 83C402                   add  sp, 2
  5121                                  .rterm272:
  5122                                  
  5123                                  ;-499   if (eqstr(symbol,"_AX")) return;
  5124                                  
  5125                                  .rterm271:
  5126 000024D6 68[3325]                 push rterm_4
  5127 000024D9 8D062B81                 lea  ax, [symbol]
  5128 000024DD 50                       push ax
  5129 000024DE E8CADC                   call eqstr
  5130 000024E1 83C404                   add  sp, 4
  5131 000024E4 08C0                     or  al, al
  5132 000024E6 0F840300                 je .rterm273
  5133 000024EA E91800                   jmp .retn
  5134                                  
  5135                                  ;-500   opint=op; dovar1(mode, opint, ixarr, id1);
  5136                                  
  5137                                  .rterm273:
  5138 000024ED 8B4604                   mov ax, [bp+4]
  5139 000024F0 8946FC                   mov [bp-4], ax
  5140 000024F3 FF76F8                   push word [bp-8]
  5141 000024F6 FF76FA                   push word [bp-6]
  5142 000024F9 FF76FC                   push word [bp-4]
  5143 000024FC FF76FE                   push word [bp-2]
  5144 000024FF E852FD                   call dovar1
  5145 00002502 83C408                   add  sp, 8
  5146                                  
  5147                                  ;-501 }
  5148                                  
  5149                                  
  5150                                  ;-502 int isreg() {
  5151                                  
  5152 00002505 C9                       .retn: LEAVE
  5153 00002506 C3                       ret
  5154                                  ; ENDP
  5155 00002507 20616C2C2000            rterm_0 db " al, ",0
  5156 0000250D 2061782C2000            rterm_1 db " ax, ",0
  5157 00002513 206561782C2000          rterm_2 db " eax, ",0
  5158 0000251A 4172726179696E6465-     rterm_3 db "Arrayindex muss int sein",0
  5159 00002523 78206D75737320696E-
  5160 0000252C 74207365696E00     
  5161 00002533 5F415800                rterm_4 db "_AX",0
  5162                                  
  5163                                  isreg:  ; *** PROC ***
  5164                                  
  5165                                  ;-503   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}
  5166                                  
  5167 00002537 68[2427]                 push isreg_0
  5168 0000253A 8D062B81                 lea  ax, [symbol]
  5169 0000253E 50                       push ax
  5170 0000253F E869DC                   call eqstr
  5171 00002542 83C404                   add  sp, 4
  5172 00002545 08C0                     or  al, al
  5173 00002547 0F840C00                 je .isreg274
  5174 0000254B 68[2827]                 push isreg_1
  5175 0000254E E84202                   call doreg
  5176 00002551 83C402                   add  sp, 2
  5177 00002554 E9C601                   jmp .r1
  5178                                  
  5179                                  ;-504   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}  
  5180                                  
  5181                                  .isreg274:
  5182 00002557 68[2B27]                 push isreg_2
  5183 0000255A 8D062B81                 lea  ax, [symbol]
  5184 0000255E 50                       push ax
  5185 0000255F E849DC                   call eqstr
  5186 00002562 83C404                   add  sp, 4
  5187 00002565 08C0                     or  al, al
  5188 00002567 0F840C00                 je .isreg275
  5189 0000256B 68[2F27]                 push isreg_3
  5190 0000256E E82202                   call doreg
  5191 00002571 83C402                   add  sp, 2
  5192 00002574 E9A601                   jmp .r1
  5193                                  
  5194                                  ;-505   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}
  5195                                  
  5196                                  .isreg275:
  5197 00002577 68[3227]                 push isreg_4
  5198 0000257A 8D062B81                 lea  ax, [symbol]
  5199 0000257E 50                       push ax
  5200 0000257F E829DC                   call eqstr
  5201 00002582 83C404                   add  sp, 4
  5202 00002585 08C0                     or  al, al
  5203 00002587 0F840C00                 je .isreg276
  5204 0000258B 68[3627]                 push isreg_5
  5205 0000258E E80202                   call doreg
  5206 00002591 83C402                   add  sp, 2
  5207 00002594 E98601                   jmp .r1
  5208                                  
  5209                                  ;-506   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}
  5210                                  
  5211                                  .isreg276:
  5212 00002597 68[3927]                 push isreg_6
  5213 0000259A 8D062B81                 lea  ax, [symbol]
  5214 0000259E 50                       push ax
  5215 0000259F E809DC                   call eqstr
  5216 000025A2 83C404                   add  sp, 4
  5217 000025A5 08C0                     or  al, al
  5218 000025A7 0F840C00                 je .isreg277
  5219 000025AB 68[3D27]                 push isreg_7
  5220 000025AE E8E201                   call doreg
  5221 000025B1 83C402                   add  sp, 2
  5222 000025B4 E96601                   jmp .r1
  5223                                  
  5224                                  ;-507   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}
  5225                                  
  5226                                  .isreg277:
  5227 000025B7 68[4027]                 push isreg_8
  5228 000025BA 8D062B81                 lea  ax, [symbol]
  5229 000025BE 50                       push ax
  5230 000025BF E8E9DB                   call eqstr
  5231 000025C2 83C404                   add  sp, 4
  5232 000025C5 08C0                     or  al, al
  5233 000025C7 0F840C00                 je .isreg278
  5234 000025CB 68[4427]                 push isreg_9
  5235 000025CE E8C201                   call doreg
  5236 000025D1 83C402                   add  sp, 2
  5237 000025D4 E94601                   jmp .r1
  5238                                  
  5239                                  ;-508   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}    
  5240                                  
  5241                                  .isreg278:
  5242 000025D7 68[4727]                 push isreg_10
  5243 000025DA 8D062B81                 lea  ax, [symbol]
  5244 000025DE 50                       push ax
  5245 000025DF E8C9DB                   call eqstr
  5246 000025E2 83C404                   add  sp, 4
  5247 000025E5 08C0                     or  al, al
  5248 000025E7 0F840C00                 je .isreg279
  5249 000025EB 68[4B27]                 push isreg_11
  5250 000025EE E8A201                   call doreg
  5251 000025F1 83C402                   add  sp, 2
  5252 000025F4 E92601                   jmp .r1
  5253                                  
  5254                                  ;-509   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}
  5255                                  
  5256                                  .isreg279:
  5257 000025F7 68[4E27]                 push isreg_12
  5258 000025FA 8D062B81                 lea  ax, [symbol]
  5259 000025FE 50                       push ax
  5260 000025FF E8A9DB                   call eqstr
  5261 00002602 83C404                   add  sp, 4
  5262 00002605 08C0                     or  al, al
  5263 00002607 0F840C00                 je .isreg280
  5264 0000260B 68[5227]                 push isreg_13
  5265 0000260E E88201                   call doreg
  5266 00002611 83C402                   add  sp, 2
  5267 00002614 E90601                   jmp .r1
  5268                                  
  5269                                  ;-510   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}
  5270                                  
  5271                                  .isreg280:
  5272 00002617 68[5527]                 push isreg_14
  5273 0000261A 8D062B81                 lea  ax, [symbol]
  5274 0000261E 50                       push ax
  5275 0000261F E889DB                   call eqstr
  5276 00002622 83C404                   add  sp, 4
  5277 00002625 08C0                     or  al, al
  5278 00002627 0F840C00                 je .isreg281
  5279 0000262B 68[5927]                 push isreg_15
  5280 0000262E E86201                   call doreg
  5281 00002631 83C402                   add  sp, 2
  5282 00002634 E9E600                   jmp .r1
  5283                                  
  5284                                  ;-511   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}    
  5285                                  
  5286                                  .isreg281:
  5287 00002637 68[5C27]                 push isreg_16
  5288 0000263A 8D062B81                 lea  ax, [symbol]
  5289 0000263E 50                       push ax
  5290 0000263F E869DB                   call eqstr
  5291 00002642 83C404                   add  sp, 4
  5292 00002645 08C0                     or  al, al
  5293 00002647 0F840C00                 je .isreg282
  5294 0000264B 68[6027]                 push isreg_17
  5295 0000264E E84201                   call doreg
  5296 00002651 83C402                   add  sp, 2
  5297 00002654 E9C600                   jmp .r1
  5298                                  
  5299                                  ;-512   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}
  5300                                  
  5301                                  .isreg282:
  5302 00002657 68[6327]                 push isreg_18
  5303 0000265A 8D062B81                 lea  ax, [symbol]
  5304 0000265E 50                       push ax
  5305 0000265F E849DB                   call eqstr
  5306 00002662 83C404                   add  sp, 4
  5307 00002665 08C0                     or  al, al
  5308 00002667 0F840C00                 je .isreg283
  5309 0000266B 68[6727]                 push isreg_19
  5310 0000266E E82201                   call doreg
  5311 00002671 83C402                   add  sp, 2
  5312 00002674 E9A600                   jmp .r1
  5313                                  
  5314                                  ;-513   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}
  5315                                  
  5316                                  .isreg283:
  5317 00002677 68[6A27]                 push isreg_20
  5318 0000267A 8D062B81                 lea  ax, [symbol]
  5319 0000267E 50                       push ax
  5320 0000267F E829DB                   call eqstr
  5321 00002682 83C404                   add  sp, 4
  5322 00002685 08C0                     or  al, al
  5323 00002687 0F840C00                 je .isreg284
  5324 0000268B 68[6E27]                 push isreg_21
  5325 0000268E E80201                   call doreg
  5326 00002691 83C402                   add  sp, 2
  5327 00002694 E98600                   jmp .r1
  5328                                  
  5329                                  ;-514   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}  
  5330                                  
  5331                                  .isreg284:
  5332 00002697 68[7127]                 push isreg_22
  5333 0000269A 8D062B81                 lea  ax, [symbol]
  5334 0000269E 50                       push ax
  5335 0000269F E809DB                   call eqstr
  5336 000026A2 83C404                   add  sp, 4
  5337 000026A5 08C0                     or  al, al
  5338 000026A7 0F840C00                 je .isreg285
  5339 000026AB 68[7527]                 push isreg_23
  5340 000026AE E8E200                   call doreg
  5341 000026B1 83C402                   add  sp, 2
  5342 000026B4 E96600                   jmp .r1
  5343                                  
  5344                                  ;-515   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}
  5345                                  
  5346                                  .isreg285:
  5347 000026B7 68[7827]                 push isreg_24
  5348 000026BA 8D062B81                 lea  ax, [symbol]
  5349 000026BE 50                       push ax
  5350 000026BF E8E9DA                   call eqstr
  5351 000026C2 83C404                   add  sp, 4
  5352 000026C5 08C0                     or  al, al
  5353 000026C7 0F840C00                 je .isreg286
  5354 000026CB 68[7C27]                 push isreg_25
  5355 000026CE E8C200                   call doreg
  5356 000026D1 83C402                   add  sp, 2
  5357 000026D4 E94600                   jmp .r1
  5358                                  
  5359                                  ;-516   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}
  5360                                  
  5361                                  .isreg286:
  5362 000026D7 68[7F27]                 push isreg_26
  5363 000026DA 8D062B81                 lea  ax, [symbol]
  5364 000026DE 50                       push ax
  5365 000026DF E8C9DA                   call eqstr
  5366 000026E2 83C404                   add  sp, 4
  5367 000026E5 08C0                     or  al, al
  5368 000026E7 0F840C00                 je .isreg287
  5369 000026EB 68[8327]                 push isreg_27
  5370 000026EE E8A200                   call doreg
  5371 000026F1 83C402                   add  sp, 2
  5372 000026F4 E92600                   jmp .r1
  5373                                  
  5374                                  ;-517   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}  
  5375                                  
  5376                                  .isreg287:
  5377 000026F7 68[8627]                 push isreg_28
  5378 000026FA 8D062B81                 lea  ax, [symbol]
  5379 000026FE 50                       push ax
  5380 000026FF E8A9DA                   call eqstr
  5381 00002702 83C404                   add  sp, 4
  5382 00002705 08C0                     or  al, al
  5383 00002707 0F840C00                 je .isreg288
  5384 0000270B 68[8D27]                 push isreg_29
  5385 0000270E E88200                   call doreg
  5386 00002711 83C402                   add  sp, 2
  5387 00002714 E90600                   jmp .r1
  5388                                  
  5389                                  ;-518   return 0;   r1: return 1; 
  5390                                  
  5391                                  .isreg288:
  5392 00002717 B80000                   mov ax, 0
  5393 0000271A E90600                   jmp .retn
  5394                                  .r1:
  5395 0000271D B80100                   mov ax, 1
  5396 00002720 E90000                   jmp .retn
  5397                                  
  5398                                  ;-519 }
  5399                                  
  5400                                  
  5401                                  ;-520 int doreg(char *dr) { int i; expect('=');
  5402                                  
  5403                                   .retn:
  5404 00002723 C3                       ret
  5405                                  ; ENDP
  5406 00002724 5F414800                isreg_0 db "_AH",0
  5407 00002728 616800                  isreg_1 db "ah",0
  5408 0000272B 5F414C00                isreg_2 db "_AL",0
  5409 0000272F 616C00                  isreg_3 db "al",0
  5410 00002732 5F415800                isreg_4 db "_AX",0
  5411 00002736 617800                  isreg_5 db "ax",0
  5412 00002739 5F424800                isreg_6 db "_BH",0
  5413 0000273D 626800                  isreg_7 db "bh",0
  5414 00002740 5F424C00                isreg_8 db "_BL",0
  5415 00002744 626C00                  isreg_9 db "bl",0
  5416 00002747 5F425800                isreg_10 db "_BX",0
  5417 0000274B 627800                  isreg_11 db "bx",0
  5418 0000274E 5F434800                isreg_12 db "_CH",0
  5419 00002752 636800                  isreg_13 db "ch",0
  5420 00002755 5F434C00                isreg_14 db "_CL",0
  5421 00002759 636C00                  isreg_15 db "cl",0
  5422 0000275C 5F435800                isreg_16 db "_CX",0
  5423 00002760 637800                  isreg_17 db "cx",0
  5424 00002763 5F444800                isreg_18 db "_DH",0
  5425 00002767 646800                  isreg_19 db "dh",0
  5426 0000276A 5F444C00                isreg_20 db "_DL",0
  5427 0000276E 646C00                  isreg_21 db "dl",0
  5428 00002771 5F445800                isreg_22 db "_DX",0
  5429 00002775 647800                  isreg_23 db "dx",0
  5430 00002778 5F534900                isreg_24 db "_SI",0
  5431 0000277C 736900                  isreg_25 db "si",0
  5432 0000277F 5F444900                isreg_26 db "_DI",0
  5433 00002783 646900                  isreg_27 db "di",0
  5434 00002786 5F464C41475300          isreg_28 db "_FLAGS",0
  5435 0000278D 666C61677300            isreg_29 db "flags",0
  5436                                  
  5437                                  doreg:  ; *** PROC ***
  5438                                  ;Function : doreg, Number of local variables: 2
  5439                                  ;   # type sign width addr used name   list of local variables
  5440                                  ;  200 ptr sign byte   520 NULL dr = bp+4
  5441                                  ;  201 var sign word   520 NULL i = bp-2;
  5442 00002793 C8020000                 ENTER  2,0
  5443 00002797 6A3D                     push 61
  5444 00002799 E8161D                   call expect
  5445 0000279C 83C402                   add  sp, 2
  5446                                  
  5447                                  ;-521   prs("\n mov  "); prs(dr); prs(", ");
  5448                                  
  5449 0000279F 68[0228]                 push doreg_0
  5450 000027A2 E8201E                   call prs
  5451 000027A5 83C402                   add  sp, 2
  5452 000027A8 FF7604                   push word [bp+4]
  5453 000027AB E8171E                   call prs
  5454 000027AE 83C402                   add  sp, 2
  5455 000027B1 68[0B28]                 push doreg_1
  5456 000027B4 E80E1E                   call prs
  5457 000027B7 83C402                   add  sp, 2
  5458                                  
  5459                                  ;-522        if (istoken(T_CONST)) prunsign1(lexval);
  5460                                  
  5461 000027BA 680101                   push 257
  5462 000027BD E8D01C                   call istoken
  5463 000027C0 83C402                   add  sp, 2
  5464 000027C3 08C0                     or  al, al
  5465 000027C5 0F840D00                 je .doreg289
  5466 000027C9 FF36[2E00]               push word [lexval]
  5467 000027CD E84F1F                   call prunsign1
  5468 000027D0 83C402                   add  sp, 2
  5469                                  
  5470                                  ;-523   else if (istoken(T_NAME )) { i=searchname(); v(i); }
  5471                                  
  5472 000027D3 E92A00                   jmp .doreg290
  5473                                  .doreg289:
  5474 000027D6 680001                   push 256
  5475 000027D9 E8B41C                   call istoken
  5476 000027DC 83C402                   add  sp, 2
  5477 000027DF 08C0                     or  al, al
  5478 000027E1 0F841200                 je .doreg291
  5479 000027E5 E835E2                   call searchname
  5480 000027E8 8946FE                   mov [bp-2], ax
  5481 000027EB FF76FE                   push word [bp-2]
  5482 000027EE E840DC                   call v
  5483 000027F1 83C402                   add  sp, 2
  5484                                  
  5485                                  ;-524   else error1("only number or var allowed"); }
  5486                                  
  5487 000027F4 E90900                   jmp .doreg292
  5488                                  .doreg291:
  5489 000027F7 68[0E28]                 push doreg_2
  5490 000027FA E8B120                   call error1
  5491 000027FD 83C402                   add  sp, 2
  5492                                  .doreg292:
  5493                                  .doreg290:
  5494                                  
  5495                                  ;-525 
  5496                                  
  5497                                  
  5498                                  ;-526 int doassign(int mode, int i, int ixarr, int ixconst) {
  5499 00002800 C9                       LEAVE
  5500 00002801 C3                       ret
  5501                                  ; ENDP
  5502 00002802 5C6E206D6F76202000      doreg_0 db "\n mov  ",0
  5503 0000280B 2C2000                  doreg_1 db ", ",0
  5504 0000280E 6F6E6C79206E756D62-     doreg_2 db "only number or var allowed",0
  5505 00002817 6572206F7220766172-
  5506 00002820 20616C6C6F77656400 
  5507                                  
  5508                                  doassign:  ; *** PROC ***
  5509                                  
  5510                                  ;-527   gettypes(i);
  5511                                  
  5512                                  ;Function : doassign, Number of local variables: 4
  5513                                  ;   # type sign width addr used name   list of local variables
  5514                                  ;  200 var sign word   526 NULL mode = bp+4
  5515                                  ;  201 var sign word   526 NULL i = bp+6
  5516                                  ;  202 var sign word   526 NULL ixarr = bp+8
  5517                                  ;  203 var sign word   526 NULL ixconst = bp+10;
  5518 00002829 C8000000                 ENTER  0,0
  5519 0000282D FF7606                   push word [bp+6]
  5520 00002830 E8ACE0                   call gettypes
  5521 00002833 83C402                   add  sp, 2
  5522                                  
  5523                                  ;-528   if (mode==1) {prs("\n mov  bx, ");v(i);                  
  5524                                  
  5525 00002836 8B4604                   mov ax, [bp+4]
  5526 00002839 83F801                   cmp ax, 1
  5527 0000283C 0F853400                 jne .doassign293
  5528 00002840 68[C629]                 push doassign_0
  5529 00002843 E87F1D                   call prs
  5530 00002846 83C402                   add  sp, 2
  5531 00002849 FF7606                   push word [bp+6]
  5532 0000284C E8E2DB                   call v
  5533 0000284F 83C402                   add  sp, 2
  5534                                  
  5535                                  ;-529     if (widthi == 2) prs("\n mov  [bx], ax");
  5536                                  
  5537 00002852 A1[3600]                 mov ax, [widthi]
  5538 00002855 83F802                   cmp ax, 2
  5539 00002858 0F850C00                 jne .doassign294
  5540 0000285C 68[D329]                 push doassign_1
  5541 0000285F E8631D                   call prs
  5542 00002862 83C402                   add  sp, 2
  5543                                  
  5544                                  ;-530     else  prs("\n mov  [bx], al"); return;}
  5545                                  
  5546 00002865 E90900                   jmp .doassign295
  5547                                  .doassign294:
  5548 00002868 68[E429]                 push doassign_2
  5549 0000286B E8571D                   call prs
  5550 0000286E 83C402                   add  sp, 2
  5551                                  .doassign295:
  5552 00002871 E95001                   jmp .retn
  5553                                  
  5554                                  ;-531   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}
  5555                                  
  5556                                  .doassign293:
  5557 00002874 8B4604                   mov ax, [bp+4]
  5558 00002877 83F802                   cmp ax, 2
  5559 0000287A 0F851E00                 jne .doassign296
  5560 0000287E 68[F529]                 push doassign_3
  5561 00002881 E8411D                   call prs
  5562 00002884 83C402                   add  sp, 2
  5563 00002887 FF7606                   push word [bp+6]
  5564 0000288A E895DB                   call a
  5565 0000288D 83C402                   add  sp, 2
  5566 00002890 68[FE29]                 push doassign_4
  5567 00002893 E82F1D                   call prs
  5568 00002896 83C402                   add  sp, 2
  5569 00002899 E92801                   jmp .retn
  5570                                  
  5571                                  ;-532   if (ixarr) {  prs("\n mov bx, ");
  5572                                  
  5573                                  .doassign296:
  5574 0000289C 8B4608                   mov ax, [bp+8]
  5575 0000289F 08C0                     or  al, al
  5576 000028A1 0F846E00                 je .doassign297
  5577 000028A5 68[032A]                 push doassign_5
  5578 000028A8 E81A1D                   call prs
  5579 000028AB 83C402                   add  sp, 2
  5580                                  
  5581                                  ;-533     if(ixconst) prunsign1(ixarr); else v(ixarr);
  5582                                  
  5583 000028AE 8B460A                   mov ax, [bp+10]
  5584 000028B1 08C0                     or  al, al
  5585 000028B3 0F840C00                 je .doassign298
  5586 000028B7 FF7608                   push word [bp+8]
  5587 000028BA E8621E                   call prunsign1
  5588 000028BD 83C402                   add  sp, 2
  5589 000028C0 E90900                   jmp .doassign299
  5590                                  .doassign298:
  5591 000028C3 FF7608                   push word [bp+8]
  5592 000028C6 E868DB                   call v
  5593 000028C9 83C402                   add  sp, 2
  5594                                  
  5595                                  ;-534     if (wi==2) prs("\n shl bx, 1");
  5596                                  
  5597                                  .doassign299:
  5598 000028CC A1[3900]                 mov ax, [wi]
  5599 000028CF 83F802                   cmp ax, 2
  5600 000028D2 0F850900                 jne .doassign300
  5601 000028D6 68[0F2A]                 push doassign_6
  5602 000028D9 E8E91C                   call prs
  5603 000028DC 83C402                   add  sp, 2
  5604                                  
  5605                                  ;-535     prs("\n mov ["); printName(i);
  5606                                  
  5607                                  .doassign300:
  5608 000028DF 68[1C2A]                 push doassign_7
  5609 000028E2 E8E01C                   call prs
  5610 000028E5 83C402                   add  sp, 2
  5611 000028E8 FF7606                   push word [bp+6]
  5612 000028EB E8CBE0                   call printName
  5613 000028EE 83C402                   add  sp, 2
  5614                                  
  5615                                  ;-536     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }
  5616                                  
  5617 000028F1 A1[3900]                 mov ax, [wi]
  5618 000028F4 83F802                   cmp ax, 2
  5619 000028F7 0F850C00                 jne .doassign301
  5620 000028FB 68[252A]                 push doassign_8
  5621 000028FE E8C41C                   call prs
  5622 00002901 83C402                   add  sp, 2
  5623 00002904 E90900                   jmp .doassign302
  5624                                  .doassign301:
  5625 00002907 68[2E2A]                 push doassign_9
  5626 0000290A E8B81C                   call prs
  5627 0000290D 83C402                   add  sp, 2
  5628                                  .doassign302:
  5629 00002910 E9B100                   jmp .retn
  5630                                  
  5631                                  ;-537   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");
  5632                                  
  5633                                  .doassign297:
  5634 00002913 A1[3900]                 mov ax, [wi]
  5635 00002916 83F801                   cmp ax, 1
  5636 00002919 0F853100                 jne .doassign303
  5637 0000291D 68[372A]                 push doassign_10
  5638 00002920 E8A21C                   call prs
  5639 00002923 83C402                   add  sp, 2
  5640 00002926 8B4606                   mov ax, [bp+6]
  5641 00002929 3DC800                   cmp ax, 200
  5642 0000292C 0F8D0900                 jge .doassign304
  5643 00002930 68[3F2A]                 push doassign_11
  5644 00002933 E88F1C                   call prs
  5645 00002936 83C402                   add  sp, 2
  5646                                  
  5647                                  ;-538     } v(i); prs(", al"); return; }
  5648                                  
  5649                                  .doassign304:
  5650 00002939 FF7606                   push word [bp+6]
  5651 0000293C E8F2DA                   call v
  5652 0000293F 83C402                   add  sp, 2
  5653 00002942 68[452A]                 push doassign_12
  5654 00002945 E87D1C                   call prs
  5655 00002948 83C402                   add  sp, 2
  5656 0000294B E97600                   jmp .retn
  5657                                  
  5658                                  ;-539   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");
  5659                                  
  5660                                  .doassign303:
  5661 0000294E A1[3900]                 mov ax, [wi]
  5662 00002951 83F802                   cmp ax, 2
  5663 00002954 0F853100                 jne .doassign305
  5664 00002958 68[4A2A]                 push doassign_13
  5665 0000295B E8671C                   call prs
  5666 0000295E 83C402                   add  sp, 2
  5667 00002961 8B4606                   mov ax, [bp+6]
  5668 00002964 3DC800                   cmp ax, 200
  5669 00002967 0F8D0900                 jge .doassign306
  5670 0000296B 68[522A]                 push doassign_14
  5671 0000296E E8541C                   call prs
  5672 00002971 83C402                   add  sp, 2
  5673                                  
  5674                                  ;-540     } v(i); prs(", ax"); return; }
  5675                                  
  5676                                  .doassign306:
  5677 00002974 FF7606                   push word [bp+6]
  5678 00002977 E8B7DA                   call v
  5679 0000297A 83C402                   add  sp, 2
  5680 0000297D 68[582A]                 push doassign_15
  5681 00002980 E8421C                   call prs
  5682 00002983 83C402                   add  sp, 2
  5683 00002986 E93B00                   jmp .retn
  5684                                  
  5685                                  ;-541   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");
  5686                                  
  5687                                  .doassign305:
  5688 00002989 A1[3900]                 mov ax, [wi]
  5689 0000298C 83F804                   cmp ax, 4
  5690 0000298F 0F853100                 jne .doassign307
  5691 00002993 68[5D2A]                 push doassign_16
  5692 00002996 E82C1C                   call prs
  5693 00002999 83C402                   add  sp, 2
  5694 0000299C 8B4606                   mov ax, [bp+6]
  5695 0000299F 3DC800                   cmp ax, 200
  5696 000029A2 0F8D0900                 jge .doassign308
  5697 000029A6 68[652A]                 push doassign_17
  5698 000029A9 E8191C                   call prs
  5699 000029AC 83C402                   add  sp, 2
  5700                                  
  5701                                  ;-542     } v(i); prs(", eax"); return; }
  5702                                  
  5703                                  .doassign308:
  5704 000029AF FF7606                   push word [bp+6]
  5705 000029B2 E87CDA                   call v
  5706 000029B5 83C402                   add  sp, 2
  5707 000029B8 68[6C2A]                 push doassign_18
  5708 000029BB E8071C                   call prs
  5709 000029BE 83C402                   add  sp, 2
  5710 000029C1 E90000                   jmp .retn
  5711                                  
  5712                                  ;-543 }
  5713                                  
  5714                                  .doassign307:
  5715                                  
  5716                                  ;-544 int domul(int ids) {
  5717                                  
  5718 000029C4 C9                       .retn: LEAVE
  5719 000029C5 C3                       ret
  5720                                  ; ENDP
  5721 000029C6 5C6E206D6F76202062-     doassign_0 db "\n mov  bx, ",0
  5722 000029CF 782C2000           
  5723 000029D3 5C6E206D6F7620205B-     doassign_1 db "\n mov  [bx], ax",0
  5724 000029DC 62785D2C20617800   
  5725 000029E4 5C6E206D6F7620205B-     doassign_2 db "\n mov  [bx], al",0
  5726 000029ED 62785D2C20616C00   
  5727 000029F5 5C6E206D6F76202000      doassign_3 db "\n mov  ",0
  5728 000029FE 2C20617800              doassign_4 db ", ax",0
  5729 00002A03 5C6E206D6F76206278-     doassign_5 db "\n mov bx, ",0
  5730 00002A0C 2C2000             
  5731 00002A0F 5C6E2073686C206278-     doassign_6 db "\n shl bx, 1",0
  5732 00002A18 2C203100           
  5733 00002A1C 5C6E206D6F76205B00      doassign_7 db "\n mov [",0
  5734 00002A25 2B62785D2C20617800      doassign_8 db "+bx], ax",0
  5735 00002A2E 2B62785D2C20616C00      doassign_9 db "+bx], al",0
  5736 00002A37 5C6E206D6F762000        doassign_10 db "\n mov ",0
  5737 00002A3F 627974652000            doassign_11 db "byte ",0
  5738 00002A45 2C20616C00              doassign_12 db ", al",0
  5739 00002A4A 5C6E206D6F762000        doassign_13 db "\n mov ",0
  5740 00002A52 776F72642000            doassign_14 db "word ",0
  5741 00002A58 2C20617800              doassign_15 db ", ax",0
  5742 00002A5D 5C6E206D6F762000        doassign_16 db "\n mov ",0
  5743 00002A65 64776F72642000          doassign_17 db "dword ",0
  5744 00002A6C 2C2065617800            doassign_18 db ", eax",0
  5745                                  
  5746                                  domul:  ; *** PROC ***
  5747                                  
  5748                                  ;-545   if (ids) rterm("imul"); else {
  5749                                  
  5750                                  ;Function : domul, Number of local variables: 1
  5751                                  ;   # type sign width addr used name   list of local variables
  5752                                  ;  200 var sign word   544 NULL ids = bp+4;
  5753 00002A72 C8000000                 ENTER  0,0
  5754 00002A76 8B4604                   mov ax, [bp+4]
  5755 00002A79 08C0                     or  al, al
  5756 00002A7B 0F840C00                 je .domul309
  5757 00002A7F 68[C42A]                 push domul_0
  5758 00002A82 E899F9                   call rterm
  5759 00002A85 83C402                   add  sp, 2
  5760 00002A88 E93700                   jmp .domul310
  5761                                  .domul309:
  5762                                  
  5763                                  ;-546   if (istoken(T_CONST)) {prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx"); }
  5764                                  
  5765 00002A8B 680101                   push 257
  5766 00002A8E E8FF19                   call istoken
  5767 00002A91 83C402                   add  sp, 2
  5768 00002A94 08C0                     or  al, al
  5769 00002A96 0F841F00                 je .domul311
  5770 00002A9A 68[C92A]                 push domul_1
  5771 00002A9D E8251B                   call prs
  5772 00002AA0 83C402                   add  sp, 2
  5773 00002AA3 FF36[2E00]               push word [lexval]
  5774 00002AA7 E8751C                   call prunsign1
  5775 00002AAA 83C402                   add  sp, 2
  5776 00002AAD 68[D52A]                 push domul_2
  5777 00002AB0 E8121B                   call prs
  5778 00002AB3 83C402                   add  sp, 2
  5779                                  
  5780                                  ;-547   else error1("with MUL only const number as multiplicator allowed"); } }
  5781                                  
  5782 00002AB6 E90900                   jmp .domul312
  5783                                  .domul311:
  5784 00002AB9 68[DF2A]                 push domul_3
  5785 00002ABC E8EF1D                   call error1
  5786 00002ABF 83C402                   add  sp, 2
  5787                                  .domul312:
  5788                                  .domul310:
  5789                                  
  5790                                  ;-548 int doidiv(int ids) { int mode; int id1;
  5791 00002AC2 C9                       LEAVE
  5792 00002AC3 C3                       ret
  5793                                  ; ENDP
  5794 00002AC4 696D756C00              domul_0 db "imul",0
  5795 00002AC9 5C6E206D6F76206278-     domul_1 db "\n mov bx, ",0
  5796 00002AD2 2C2000             
  5797 00002AD5 5C6E206D756C206278-     domul_2 db "\n mul bx",0
  5798 00002ADE 00                 
  5799 00002ADF 77697468204D554C20-     domul_3 db "with MUL only const number as multiplicator allowed",0
  5800 00002AE8 6F6E6C7920636F6E73-
  5801 00002AF1 74206E756D62657220-
  5802 00002AFA 6173206D756C746970-
  5803 00002B03 6C696361746F722061-
  5804 00002B0C 6C6C6F77656400     
  5805                                  
  5806                                  doidiv:  ; *** PROC ***
  5807                                  
  5808                                  ;-549   if (istoken(T_CONST)) {
  5809                                  
  5810                                  ;Function : doidiv, Number of local variables: 3
  5811                                  ;   # type sign width addr used name   list of local variables
  5812                                  ;  200 var sign word   548 NULL ids = bp+4
  5813                                  ;  201 var sign word   548 NULL mode = bp-2
  5814                                  ;  202 var sign word   548 NULL id1 = bp-4;
  5815 00002B13 C8040000                 ENTER  4,0
  5816 00002B17 680101                   push 257
  5817 00002B1A E87319                   call istoken
  5818 00002B1D 83C402                   add  sp, 2
  5819 00002B20 08C0                     or  al, al
  5820 00002B22 0F843400                 je .doidiv313
  5821                                  
  5822                                  ;-550     prs("\n mov bx, "); prunsign1(lexval);
  5823                                  
  5824 00002B26 68[D82B]                 push doidiv_0
  5825 00002B29 E8991A                   call prs
  5826 00002B2C 83C402                   add  sp, 2
  5827 00002B2F FF36[2E00]               push word [lexval]
  5828 00002B33 E8E91B                   call prunsign1
  5829 00002B36 83C402                   add  sp, 2
  5830                                  
  5831                                  ;-551     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5832                                  
  5833 00002B39 8B4604                   mov ax, [bp+4]
  5834 00002B3C 08C0                     or  al, al
  5835 00002B3E 0F840C00                 je .doidiv314
  5836 00002B42 68[E42B]                 push doidiv_1
  5837 00002B45 E87D1A                   call prs
  5838 00002B48 83C402                   add  sp, 2
  5839 00002B4B E90900                   jmp .doidiv315
  5840                                  .doidiv314:
  5841 00002B4E 68[F52B]                 push doidiv_2
  5842 00002B51 E8711A                   call prs
  5843 00002B54 83C402                   add  sp, 2
  5844                                  .doidiv315:
  5845                                  
  5846                                  ;-552   else {
  5847                                  
  5848 00002B57 E97C00                   jmp .doidiv316
  5849                                  .doidiv313:
  5850                                  
  5851                                  ;-553     mode=typeName(); id1=searchname();
  5852                                  
  5853 00002B5A E88FDF                   call typeName
  5854 00002B5D 8946FE                   mov [bp-2], ax
  5855 00002B60 E8BADE                   call searchname
  5856 00002B63 8946FC                   mov [bp-4], ax
  5857                                  
  5858                                  ;-554     if (mode) error1("only const number or int as divisor allowed");
  5859                                  
  5860 00002B66 8B46FE                   mov ax, [bp-2]
  5861 00002B69 08C0                     or  al, al
  5862 00002B6B 0F840900                 je .doidiv317
  5863 00002B6F 68[0B2C]                 push doidiv_3
  5864 00002B72 E8391D                   call error1
  5865 00002B75 83C402                   add  sp, 2
  5866                                  
  5867                                  ;-555     gettypes(id1);
  5868                                  
  5869                                  .doidiv317:
  5870 00002B78 FF76FC                   push word [bp-4]
  5871 00002B7B E861DD                   call gettypes
  5872 00002B7E 83C402                   add  sp, 2
  5873                                  
  5874                                  ;-556     if (typei) error1("only int as simple var divisor allowed");
  5875                                  
  5876 00002B81 A1[3000]                 mov ax, [typei]
  5877 00002B84 08C0                     or  al, al
  5878 00002B86 0F840900                 je .doidiv318
  5879 00002B8A 68[372C]                 push doidiv_4
  5880 00002B8D E81E1D                   call error1
  5881 00002B90 83C402                   add  sp, 2
  5882                                  
  5883                                  ;-557     if (wi!=2) error1("only int, no byte as divisor allowed");
  5884                                  
  5885                                  .doidiv318:
  5886 00002B93 A1[3900]                 mov ax, [wi]
  5887 00002B96 83F802                   cmp ax, 2
  5888 00002B99 0F840900                 je  .doidiv319
  5889 00002B9D 68[5E2C]                 push doidiv_5
  5890 00002BA0 E80B1D                   call error1
  5891 00002BA3 83C402                   add  sp, 2
  5892                                  
  5893                                  ;-558     prs("\n mov bx, "); v(id1);
  5894                                  
  5895                                  .doidiv319:
  5896 00002BA6 68[832C]                 push doidiv_6
  5897 00002BA9 E8191A                   call prs
  5898 00002BAC 83C402                   add  sp, 2
  5899 00002BAF FF76FC                   push word [bp-4]
  5900 00002BB2 E87CD8                   call v
  5901 00002BB5 83C402                   add  sp, 2
  5902                                  
  5903                                  ;-559     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5904                                  
  5905 00002BB8 8B4604                   mov ax, [bp+4]
  5906 00002BBB 08C0                     or  al, al
  5907 00002BBD 0F840C00                 je .doidiv320
  5908 00002BC1 68[8F2C]                 push doidiv_7
  5909 00002BC4 E8FE19                   call prs
  5910 00002BC7 83C402                   add  sp, 2
  5911 00002BCA E90900                   jmp .doidiv321
  5912                                  .doidiv320:
  5913 00002BCD 68[A02C]                 push doidiv_8
  5914 00002BD0 E8F219                   call prs
  5915 00002BD3 83C402                   add  sp, 2
  5916                                  .doidiv321:
  5917                                  
  5918                                  ;-560 }
  5919                                  
  5920                                  .doidiv316:
  5921                                  
  5922                                  ;-561 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
  5923 00002BD6 C9                       LEAVE
  5924 00002BD7 C3                       ret
  5925                                  ; ENDP
  5926 00002BD8 5C6E206D6F76206278-     doidiv_0 db "\n mov bx, ",0
  5927 00002BE1 2C2000             
  5928 00002BE4 5C6E206377645C6E20-     doidiv_1 db "\n cwd\n idiv bx",0
  5929 00002BED 6964697620627800   
  5930 00002BF5 5C6E206D6F76206478-     doidiv_2 db "\n mov dx, 0\n div bx",0
  5931 00002BFE 2C20305C6E20646976-
  5932 00002C07 20627800           
  5933 00002C0B 6F6E6C7920636F6E73-     doidiv_3 db "only const number or int as divisor allowed",0
  5934 00002C14 74206E756D62657220-
  5935 00002C1D 6F7220696E74206173-
  5936 00002C26 2064697669736F7220-
  5937 00002C2F 616C6C6F77656400   
  5938 00002C37 6F6E6C7920696E7420-     doidiv_4 db "only int as simple var divisor allowed",0
  5939 00002C40 61732073696D706C65-
  5940 00002C49 207661722064697669-
  5941 00002C52 736F7220616C6C6F77-
  5942 00002C5B 656400             
  5943 00002C5E 6F6E6C7920696E742C-     doidiv_5 db "only int, no byte as divisor allowed",0
  5944 00002C67 206E6F206279746520-
  5945 00002C70 61732064697669736F-
  5946 00002C79 7220616C6C6F776564-
  5947 00002C82 00                 
  5948 00002C83 5C6E206D6F76206278-     doidiv_6 db "\n mov bx, ",0
  5949 00002C8C 2C2000             
  5950 00002C8F 5C6E206377645C6E20-     doidiv_7 db "\n cwd\n idiv bx",0
  5951 00002C98 6964697620627800   
  5952 00002CA0 5C6E206D6F76206478-     doidiv_8 db "\n mov dx, 0\n div bx",0
  5953 00002CA9 2C20305C6E20646976-
  5954 00002CB2 20627800           
  5955                                  
  5956                                  domod:  ; *** PROC ***
  5957                                  ;Function : domod, Number of local variables: 1
  5958                                  ;   # type sign width addr used name   list of local variables
  5959                                  ;  200 var sign word   561 NULL ids = bp+4;
  5960 00002CB6 C8000000                 ENTER  0,0
  5961 00002CBA FF7604                   push word [bp+4]
  5962 00002CBD E853FE                   call doidiv
  5963 00002CC0 83C402                   add  sp, 2
  5964 00002CC3 68[CE2C]                 push domod_0
  5965 00002CC6 E8FC18                   call prs
  5966 00002CC9 83C402                   add  sp, 2
  5967                                  
  5968                                  ;-562 
  5969                                  
  5970                                  
  5971                                  ;-563 int docalltype[10]; int docallvalue[10];
  5972 00002CCC C9                       LEAVE
  5973 00002CCD C3                       ret
  5974                                  ; ENDP
  5975 00002CCE 5C6E206D6F76206178-     domod_0 db "\n mov ax, dx",0
  5976 00002CD7 2C20647800         
  5977                                  section .bss
  5978                                  absolute 53411
  5979 0000D0A3 <res 00000014>          docalltype resw 10
  5980                                  section .text
  5981                                  section .bss
  5982                                  absolute 53431
  5983 0000D0B7 <res 00000014>          docallvalue resw 10
  5984                                  section .text
  5985                                  
  5986                                  ;-564 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register
  5987                                  
  5988                                  section .bss
  5989                                  absolute 53451
  5990 0000D0CB <res 00000011>          procname resb 17
  5991                                  section .text
  5992                                  
  5993                                  ;-565 int docall1() {int i; int narg; int t0; int n0;  int sz32;
  5994                                  
  5995                                  
  5996                                  docall1:  ; *** PROC ***
  5997                                  
  5998                                  ;-566   narg=0;  sz32=0;
  5999                                  
  6000                                  ;Function : docall1, Number of local variables: 5
  6001                                  ;   # type sign width addr used name   list of local variables
  6002                                  ;  200 var sign word   565 NULL i = bp-2
  6003                                  ;  201 var sign word   565 NULL narg = bp-4
  6004                                  ;  202 var sign word   565 NULL t0 = bp-6
  6005                                  ;  203 var sign word   565 NULL n0 = bp-8
  6006                                  ;  204 var sign word   565 NULL sz32 = bp-10;
  6007 00002CDC C80A0000                 ENTER  10,0
  6008 00002CE0 B80000                   mov ax, 0
  6009 00002CE3 8946FC                   mov [bp-4], ax
  6010 00002CE6 B80000                   mov ax, 0
  6011 00002CE9 8946F6                   mov [bp-10], ax
  6012                                  
  6013                                  ;-567   checknamelen();
  6014                                  
  6015 00002CEC E875D7                   call checknamelen
  6016                                  
  6017                                  ;-568   strcpy(&procname, symbol);
  6018                                  
  6019 00002CEF 8D062B81                 lea  ax, [symbol]
  6020 00002CF3 50                       push ax
  6021 00002CF4 8D06CBD0                 lea  ax, [procname]
  6022 00002CF8 50                       push ax
  6023 00002CF9 E87FD4                   call strcpy
  6024 00002CFC 83C404                   add  sp, 4
  6025                                  
  6026                                  ;-569   storecall();
  6027                                  
  6028 00002CFF E8EBDE                   call storecall
  6029                                  
  6030                                  ;-570   expect('(');
  6031                                  
  6032 00002D02 6A28                     push 40
  6033 00002D04 E8AB17                   call expect
  6034 00002D07 83C402                   add  sp, 2
  6035                                  
  6036                                  ;-571 	if (istoken(')') ==0 ) {
  6037                                  
  6038 00002D0A 6A29                     push 41
  6039 00002D0C E88117                   call istoken
  6040 00002D0F 83C402                   add  sp, 2
  6041 00002D12 83F800                   cmp ax, 0
  6042 00002D15 0F857802                 jne .docall1322
  6043                                  
  6044                                  ;-572 	  do { narg++;
  6045                                  
  6046                                  .docall1323:
  6047 00002D19 FF46FC                   inc  word[bp-4]
  6048                                  
  6049                                  ;-573 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;
  6050                                  
  6051 00002D1C 8B46FC                   mov ax, [bp-4]
  6052 00002D1F 83F809                   cmp ax, 9
  6053 00002D22 0F8E0900                 jle .docall1324
  6054 00002D26 68[D52F]                 push docall1_0
  6055 00002D29 E8821B                   call error1
  6056 00002D2C 83C402                   add  sp, 2
  6057                                  .docall1324:
  6058 00002D2F B80000                   mov ax, 0
  6059 00002D32 8946FA                   mov [bp-6], ax
  6060                                  
  6061                                  ;-574       if(istoken(T_CONST)) {t0=1; n0=lexval; }
  6062                                  
  6063 00002D35 680101                   push 257
  6064 00002D38 E85517                   call istoken
  6065 00002D3B 83C402                   add  sp, 2
  6066 00002D3E 08C0                     or  al, al
  6067 00002D40 0F840C00                 je .docall1325
  6068 00002D44 B80100                   mov ax, 1
  6069 00002D47 8946FA                   mov [bp-6], ax
  6070 00002D4A A1[2E00]                 mov ax, [lexval]
  6071 00002D4D 8946F8                   mov [bp-8], ax
  6072                                  
  6073                                  ;-575       if(istoken(T_STRING)){t0=2; n0=nconst;
  6074                                  
  6075                                  .docall1325:
  6076 00002D50 680201                   push 258
  6077 00002D53 E83A17                   call istoken
  6078 00002D56 83C402                   add  sp, 2
  6079 00002D59 08C0                     or  al, al
  6080 00002D5B 0F846300                 je .docall1326
  6081 00002D5F B80200                   mov ax, 2
  6082 00002D62 8946FA                   mov [bp-6], ax
  6083 00002D65 A1[2400]                 mov ax, [nconst]
  6084 00002D68 8946F8                   mov [bp-8], ax
  6085                                  
  6086                                  ;-576         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");
  6087                                  
  6088 00002D6B 68[E72F]                 push docall1_1
  6089 00002D6E E8BF17                   call eprs
  6090 00002D71 83C402                   add  sp, 2
  6091 00002D74 8D06AB81                 lea  ax, [fname]
  6092 00002D78 50                       push ax
  6093 00002D79 E8B417                   call eprs
  6094 00002D7C 83C402                   add  sp, 2
  6095 00002D7F 6A5F                     push 95
  6096 00002D81 E89917                   call eprc
  6097 00002D84 83C402                   add  sp, 2
  6098 00002D87 FF36[2400]               push word [nconst]
  6099 00002D8B E8CB18                   call eprnum
  6100 00002D8E 83C402                   add  sp, 2
  6101 00002D91 68[EA2F]                 push docall1_2
  6102 00002D94 E89917                   call eprs
  6103 00002D97 83C402                   add  sp, 2
  6104                                  
  6105                                  ;-577         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }
  6106                                  
  6107 00002D9A 6A22                     push 34
  6108 00002D9C E87E17                   call eprc
  6109 00002D9F 83C402                   add  sp, 2
  6110 00002DA2 8D062B81                 lea  ax, [symbol]
  6111 00002DA6 50                       push ax
  6112 00002DA7 E88617                   call eprs
  6113 00002DAA 83C402                   add  sp, 2
  6114 00002DAD 6A22                     push 34
  6115 00002DAF E86B17                   call eprc
  6116 00002DB2 83C402                   add  sp, 2
  6117 00002DB5 68[EF2F]                 push docall1_3
  6118 00002DB8 E87517                   call eprs
  6119 00002DBB 83C402                   add  sp, 2
  6120 00002DBE FF06[2400]               inc  word[nconst]
  6121                                  
  6122                                  ;-578       if(istoken('&'))     {t0=3; name1(); n0=searchname();}
  6123                                  
  6124                                  .docall1326:
  6125 00002DC2 6A26                     push 38
  6126 00002DC4 E8C916                   call istoken
  6127 00002DC7 83C402                   add  sp, 2
  6128 00002DCA 08C0                     or  al, al
  6129 00002DCC 0F840F00                 je .docall1327
  6130 00002DD0 B80300                   mov ax, 3
  6131 00002DD3 8946FA                   mov [bp-6], ax
  6132 00002DD6 E8ECDD                   call name1
  6133 00002DD9 E841DC                   call searchname
  6134 00002DDC 8946F8                   mov [bp-8], ax
  6135                                  
  6136                                  ;-579       if(istoken(T_NAME))  { n0=checkreg();
  6137                                  
  6138                                  .docall1327:
  6139 00002DDF 680001                   push 256
  6140 00002DE2 E8AB16                   call istoken
  6141 00002DE5 83C402                   add  sp, 2
  6142 00002DE8 08C0                     or  al, al
  6143 00002DEA 0F844800                 je .docall1328
  6144 00002DEE E8DFEA                   call checkreg
  6145 00002DF1 8946F8                   mov [bp-8], ax
  6146                                  
  6147                                  ;-580         if (n0) t0=5;
  6148                                  
  6149 00002DF4 8B46F8                   mov ax, [bp-8]
  6150 00002DF7 08C0                     or  al, al
  6151 00002DF9 0F840900                 je .docall1329
  6152 00002DFD B80500                   mov ax, 5
  6153 00002E00 8946FA                   mov [bp-6], ax
  6154                                  
  6155                                  ;-581         else {t0=4; n0=searchname();
  6156                                  
  6157 00002E03 E93000                   jmp .docall1330
  6158                                  .docall1329:
  6159 00002E06 B80400                   mov ax, 4
  6160 00002E09 8946FA                   mov [bp-6], ax
  6161 00002E0C E80EDC                   call searchname
  6162 00002E0F 8946F8                   mov [bp-8], ax
  6163                                  
  6164                                  ;-582           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }
  6165                                  
  6166 00002E12 B8B782                   mov ax, GType
  6167 00002E15 A3[6C00]                 mov word [p1], ax
  6168 00002E18 A1[6C00]                 mov ax, [p1]
  6169 00002E1B 0346F8                   add ax, [bp-8]
  6170 00002E1E A3[6C00]                 mov word [p1], ax
  6171 00002E21 8B1E[6C00]               mov bx, [p1]
  6172 00002E25 8A07                     mov al, [bx]
  6173 00002E27 B400                     mov ah, 0
  6174 00002E29 83F826                   cmp ax, 38
  6175 00002E2C 0F850600                 jne .docall1331
  6176 00002E30 B80300                   mov ax, 3
  6177 00002E33 8946FA                   mov [bp-6], ax
  6178                                  .docall1331:
  6179                                  .docall1330:
  6180                                  
  6181                                  ;-583       if (t0==0) error1("parameter not recognized (no * allowed)");
  6182                                  
  6183                                  .docall1328:
  6184 00002E36 8B46FA                   mov ax, [bp-6]
  6185 00002E39 83F800                   cmp ax, 0
  6186 00002E3C 0F850900                 jne .docall1332
  6187 00002E40 68[F22F]                 push docall1_4
  6188 00002E43 E8681A                   call error1
  6189 00002E46 83C402                   add  sp, 2
  6190                                  
  6191                                  ;-584       docalltype [narg] = t0;
  6192                                  
  6193                                  .docall1332:
  6194 00002E49 8B46FA                   mov ax, [bp-6]
  6195 00002E4C 8B5EFC                   mov bx, [bp-4]
  6196 00002E4F D1E3                     shl bx, 1
  6197 00002E51 8987A3D0                 mov [docalltype+bx], ax
  6198                                  
  6199                                  ;-585       docallvalue[narg] = n0;
  6200                                  
  6201 00002E55 8B46F8                   mov ax, [bp-8]
  6202 00002E58 8B5EFC                   mov bx, [bp-4]
  6203 00002E5B D1E3                     shl bx, 1
  6204 00002E5D 8987B7D0                 mov [docallvalue+bx], ax
  6205                                  
  6206                                  ;-586     } while (istoken(','));
  6207                                  
  6208 00002E61 6A2C                     push 44
  6209 00002E63 E82A16                   call istoken
  6210 00002E66 83C402                   add  sp, 2
  6211 00002E69 08C0                     or  al, al
  6212 00002E6B 0F840300                 je .docall1333
  6213 00002E6F E9A7FE                   jmp .docall1323
  6214                                  .docall1333:
  6215                                  
  6216                                  ;-587     
  6217                                  
  6218                                  
  6219                                  ;-588   	expect(')');  i=narg;
  6220                                  
  6221 00002E72 6A29                     push 41
  6222 00002E74 E83B16                   call expect
  6223 00002E77 83C402                   add  sp, 2
  6224 00002E7A 8B46FC                   mov ax, [bp-4]
  6225 00002E7D 8946FE                   mov [bp-2], ax
  6226                                  
  6227                                  ;-589     do {
  6228                                  
  6229                                  .docall1334:
  6230                                  
  6231                                  ;-590       t0 = docalltype [i];
  6232                                  
  6233 00002E80 8B5EFE                   mov bx, [bp-2]
  6234 00002E83 D1E3                     shl bx, 1
  6235 00002E85 8B87A3D0                 mov ax, [docalltype + bx]
  6236 00002E89 8946FA                   mov [bp-6], ax
  6237                                  
  6238                                  ;-591       n0 = docallvalue[i];     
  6239                                  
  6240 00002E8C 8B5EFE                   mov bx, [bp-2]
  6241 00002E8F D1E3                     shl bx, 1
  6242 00002E91 8B87B7D0                 mov ax, [docallvalue + bx]
  6243 00002E95 8946F8                   mov [bp-8], ax
  6244                                  
  6245                                  ;-592       if(t0==1){ prs("\n push "); pint1(n0);}
  6246                                  
  6247 00002E98 8B46FA                   mov ax, [bp-6]
  6248 00002E9B 83F801                   cmp ax, 1
  6249 00002E9E 0F851200                 jne .docall1335
  6250 00002EA2 68[1A30]                 push docall1_5
  6251 00002EA5 E81D17                   call prs
  6252 00002EA8 83C402                   add  sp, 2
  6253 00002EAB FF76F8                   push word [bp-8]
  6254 00002EAE E80B18                   call pint1
  6255 00002EB1 83C402                   add  sp, 2
  6256                                  
  6257                                  ;-593       if(t0==2){ prs("\n push "); 
  6258                                  
  6259                                  .docall1335:
  6260 00002EB4 8B46FA                   mov ax, [bp-6]
  6261 00002EB7 83F802                   cmp ax, 2
  6262 00002EBA 0F852500                 jne .docall1336
  6263 00002EBE 68[2330]                 push docall1_6
  6264 00002EC1 E80117                   call prs
  6265 00002EC4 83C402                   add  sp, 2
  6266                                  
  6267                                  ;-594         prs(fname);prc(95);pint1(n0);}
  6268                                  
  6269 00002EC7 8D06AB81                 lea  ax, [fname]
  6270 00002ECB 50                       push ax
  6271 00002ECC E8F616                   call prs
  6272 00002ECF 83C402                   add  sp, 2
  6273 00002ED2 6A5F                     push 95
  6274 00002ED4 E88716                   call prc
  6275 00002ED7 83C402                   add  sp, 2
  6276 00002EDA FF76F8                   push word [bp-8]
  6277 00002EDD E8DC17                   call pint1
  6278 00002EE0 83C402                   add  sp, 2
  6279                                  
  6280                                  ;-595       if(t0==3){ prs("\n lea  ax, ");   v(n0);
  6281                                  
  6282                                  .docall1336:
  6283 00002EE3 8B46FA                   mov ax, [bp-6]
  6284 00002EE6 83F803                   cmp ax, 3
  6285 00002EE9 0F851B00                 jne .docall1337
  6286 00002EED 68[2C30]                 push docall1_7
  6287 00002EF0 E8D216                   call prs
  6288 00002EF3 83C402                   add  sp, 2
  6289 00002EF6 FF76F8                   push word [bp-8]
  6290 00002EF9 E835D5                   call v
  6291 00002EFC 83C402                   add  sp, 2
  6292                                  
  6293                                  ;-596         prs("\n push ax");}
  6294                                  
  6295 00002EFF 68[3930]                 push docall1_8
  6296 00002F02 E8C016                   call prs
  6297 00002F05 83C402                   add  sp, 2
  6298                                  
  6299                                  ;-597       if(t0==4){ gettypes(n0); 
  6300                                  
  6301                                  .docall1337:
  6302 00002F08 8B46FA                   mov ax, [bp-6]
  6303 00002F0B 83F804                   cmp ax, 4
  6304 00002F0E 0F854300                 jne .docall1338
  6305 00002F12 FF76F8                   push word [bp-8]
  6306 00002F15 E8C7D9                   call gettypes
  6307 00002F18 83C402                   add  sp, 2
  6308                                  
  6309                                  ;-598         if(wi==2) { prs("\n push word "); v(n0);}
  6310                                  
  6311 00002F1B A1[3900]                 mov ax, [wi]
  6312 00002F1E 83F802                   cmp ax, 2
  6313 00002F21 0F851500                 jne .docall1339
  6314 00002F25 68[4430]                 push docall1_9
  6315 00002F28 E89A16                   call prs
  6316 00002F2B 83C402                   add  sp, 2
  6317 00002F2E FF76F8                   push word [bp-8]
  6318 00002F31 E8FDD4                   call v
  6319 00002F34 83C402                   add  sp, 2
  6320                                  
  6321                                  ;-599         else { prs("\n mov al, byte ");   v(n0);
  6322                                  
  6323 00002F37 E91B00                   jmp .docall1340
  6324                                  .docall1339:
  6325 00002F3A 68[5230]                 push docall1_10
  6326 00002F3D E88516                   call prs
  6327 00002F40 83C402                   add  sp, 2
  6328 00002F43 FF76F8                   push word [bp-8]
  6329 00002F46 E8E8D4                   call v
  6330 00002F49 83C402                   add  sp, 2
  6331                                  
  6332                                  ;-600         prs("\n mov ah, 0\n push ax"); } }
  6333                                  
  6334 00002F4C 68[6330]                 push docall1_11
  6335 00002F4F E87316                   call prs
  6336 00002F52 83C402                   add  sp, 2
  6337                                  .docall1340:
  6338                                  
  6339                                  ;-601       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }
  6340                                  
  6341                                  .docall1338:
  6342 00002F55 8B46FA                   mov ax, [bp-6]
  6343 00002F58 83F805                   cmp ax, 5
  6344 00002F5B 0F852200                 jne .docall1341
  6345 00002F5F 68[7A30]                 push docall1_12
  6346 00002F62 E86016                   call prs
  6347 00002F65 83C402                   add  sp, 2
  6348 00002F68 FF76F8                   push word [bp-8]
  6349 00002F6B E870ED                   call printreg
  6350 00002F6E 83C402                   add  sp, 2
  6351 00002F71 8B46F8                   mov ax, [bp-8]
  6352 00002F74 83F82F                   cmp ax, 47 ;unsigned : 1
  6353 00002F77 0F8C0600                 jl  .docall1342
  6354 00002F7B 8B46F6                   mov ax, [bp-10]
  6355 00002F7E 83C002                   add ax, 2
  6356                                  .docall1342:
  6357                                  
  6358                                  ;-602    i--; } while (i > 0);  }
  6359                                  
  6360                                  .docall1341:
  6361 00002F81 FF4EFE                   dec  word[bp-2]
  6362 00002F84 8B46FE                   mov ax, [bp-2]
  6363 00002F87 83F800                   cmp ax, 0
  6364 00002F8A 0F8E0300                 jle .docall1343
  6365 00002F8E E9EFFE                   jmp .docall1334
  6366                                  .docall1343:
  6367                                  
  6368                                  ;-603 	 prs("\n call "); prs(&procname);
  6369                                  
  6370                                  .docall1322:
  6371 00002F91 68[8330]                 push docall1_13
  6372 00002F94 E82E16                   call prs
  6373 00002F97 83C402                   add  sp, 2
  6374 00002F9A 8D06CBD0                 lea  ax, [procname]
  6375 00002F9E 50                       push ax
  6376 00002F9F E82316                   call prs
  6377 00002FA2 83C402                   add  sp, 2
  6378                                  
  6379                                  ;-604 	 if (narg>0) {prs("\n add  sp, ");
  6380                                  
  6381 00002FA5 8B46FC                   mov ax, [bp-4]
  6382 00002FA8 83F800                   cmp ax, 0
  6383 00002FAB 0F8E2400                 jle .docall1344
  6384 00002FAF 68[8C30]                 push docall1_14
  6385 00002FB2 E81016                   call prs
  6386 00002FB5 83C402                   add  sp, 2
  6387                                  
  6388                                  ;-605      narg=narg+narg; narg=narg+sz32; pint1(narg); } }
  6389                                  
  6390 00002FB8 8B46FC                   mov ax, [bp-4]
  6391 00002FBB 0346FC                   add ax, [bp-4]
  6392 00002FBE 8946FC                   mov [bp-4], ax
  6393 00002FC1 8B46FC                   mov ax, [bp-4]
  6394 00002FC4 0346F6                   add ax, [bp-10]
  6395 00002FC7 8946FC                   mov [bp-4], ax
  6396 00002FCA FF76FC                   push word [bp-4]
  6397 00002FCD E8EC16                   call pint1
  6398 00002FD0 83C402                   add  sp, 2
  6399                                  .docall1344:
  6400                                  
  6401                                  ;-606 /****************************************************************************/
  6402                                  
  6403                                  
  6404                                  ;-607 int main() {
  6405 00002FD3 C9                       LEAVE
  6406 00002FD4 C3                       ret
  6407                                  ; ENDP
  6408 00002FD5 4D61782E2039207061-     docall1_0 db "Max. 9 parameters",0
  6409 00002FDE 72616D657465727300 
  6410 00002FE7 5C6E00                  docall1_1 db "\n",0
  6411 00002FEA 2064622000              docall1_2 db " db ",0
  6412 00002FEF 2C3000                  docall1_3 db ",0",0
  6413 00002FF2 706172616D65746572-     docall1_4 db "parameter not recognized (no * allowed)",0
  6414 00002FFB 206E6F74207265636F-
  6415 00003004 676E697A656420286E-
  6416 0000300D 6F202A20616C6C6F77-
  6417 00003016 65642900           
  6418 0000301A 5C6E20707573682000      docall1_5 db "\n push ",0
  6419 00003023 5C6E20707573682000      docall1_6 db "\n push ",0
  6420 0000302C 5C6E206C6561202061-     docall1_7 db "\n lea  ax, ",0
  6421 00003035 782C2000           
  6422 00003039 5C6E20707573682061-     docall1_8 db "\n push ax",0
  6423 00003042 7800               
  6424 00003044 5C6E20707573682077-     docall1_9 db "\n push word ",0
  6425 0000304D 6F72642000         
  6426 00003052 5C6E206D6F7620616C-     docall1_10 db "\n mov al, byte ",0
  6427 0000305B 2C20627974652000   
  6428 00003063 5C6E206D6F76206168-     docall1_11 db "\n mov ah, 0\n push ax",0
  6429 0000306C 2C20305C6E20707573-
  6430 00003075 6820617800         
  6431 0000307A 5C6E20707573682000      docall1_12 db "\n push ",0
  6432 00003083 5C6E2063616C6C2000      docall1_13 db "\n call ",0
  6433 0000308C 5C6E20616464202073-     docall1_14 db "\n add  sp, ",0
  6434 00003095 702C2000           
  6435                                  
  6436                                  main:  ; *** PROC ***
  6437                                  
  6438                                  ;-608   getarg();
  6439                                  
  6440 00003099 E88700                   call getarg
  6441                                  
  6442                                  ;-609   setblock(4096);
  6443                                  
  6444 0000309C 680010                   push 4096
  6445 0000309F E80123                   call setblock
  6446 000030A2 83C402                   add  sp, 2
  6447                                  
  6448                                  ;-610   if (DOS_ERR) error1("SetBlock , AX=");
  6449                                  
  6450 000030A5 A1[6E00]                 mov ax, [DOS_ERR]
  6451 000030A8 08C0                     or  al, al
  6452 000030AA 0F840900                 je .main345
  6453 000030AE 68[E830]                 push main_0
  6454 000030B1 E8FA17                   call error1
  6455 000030B4 83C402                   add  sp, 2
  6456                                  
  6457                                  ;-611   segE=allocmem(4096);
  6458                                  
  6459                                  .main345:
  6460 000030B7 680010                   push 4096
  6461 000030BA E8FF22                   call allocmem
  6462 000030BD 83C402                   add  sp, 2
  6463 000030C0 A3[6400]                 mov word [segE], ax
  6464                                  
  6465                                  ;-612   if (DOS_ERR)  error1("alloc memory, AX=");
  6466                                  
  6467 000030C3 A1[6E00]                 mov ax, [DOS_ERR]
  6468 000030C6 08C0                     or  al, al
  6469 000030C8 0F840900                 je .main346
  6470 000030CC 68[F730]                 push main_1
  6471 000030CF E8DC17                   call error1
  6472 000030D2 83C402                   add  sp, 2
  6473                                  
  6474                                  ;-613   CNameTop=0;
  6475                                  
  6476                                  .main346:
  6477 000030D5 B80000                   mov ax, 0
  6478 000030D8 A3[6000]                 mov word [CNameTop], ax
  6479                                  
  6480                                  ;-614   getfirstchar();
  6481                                  
  6482 000030DB E82B00                   call getfirstchar
  6483                                  
  6484                                  ;-615   parse();
  6485                                  
  6486 000030DE E88D02                   call parse
  6487                                  
  6488                                  ;-616   checkcalls(); epilog();
  6489                                  
  6490 000030E1 E82103                   call checkcalls
  6491 000030E4 E8A21E                   call epilog
  6492                                  
  6493                                  ;-617 }
  6494                                  
  6495                                  
  6496                                  ;-618 int getfirstchar() { fgetsp=&fgetsdest; *fgetsp=0; thechar=fgets1(); }
  6497                                  
  6498 000030E7 C3                       ret
  6499                                  ; ENDP
  6500 000030E8 536574426C6F636B20-     main_0 db "SetBlock , AX=",0
  6501 000030F1 2C2041583D00       
  6502 000030F7 616C6C6F63206D656D-     main_1 db "alloc memory, AX=",0
  6503 00003100 6F72792C2041583D00 
  6504                                  
  6505                                  getfirstchar:  ; *** PROC ***
  6506 00003109 B80FD0                   mov ax, fgetsdest
  6507 0000310C A3[6200]                 mov word [fgetsp], ax
  6508 0000310F B80000                   mov ax, 0
  6509 00003112 8B1E[6200]               mov  bx, [fgetsp]
  6510 00003116 8807                     mov  [bx], al
  6511 00003118 E89D16                   call fgets1
  6512 0000311B A2[2100]                 mov byte [thechar], al
  6513                                  
  6514                                  ;-619 char *arglen=0x80; char *argv=0x82;
  6515                                  
  6516 0000311E C3                       ret
  6517                                  ; ENDP
  6518 0000311F 8000                    arglen dw 128
  6519 00003121 8200                    argv dw 130
  6520                                  
  6521                                  ;-620 int getarg() { int arglen1; int i; char *c;
  6522                                  
  6523                                  
  6524                                  getarg:  ; *** PROC ***
  6525                                  
  6526                                  ;-621   arglen1=*arglen;
  6527                                  
  6528                                  ;Function : getarg, Number of local variables: 3
  6529                                  ;   # type sign width addr used name   list of local variables
  6530                                  ;  200 var sign word   620 NULL arglen1 = bp-2
  6531                                  ;  201 var sign word   620 NULL i = bp-4
  6532                                  ;  202 ptr sign byte   620 NULL c = bp-6;
  6533 00003123 C8060000                 ENTER  6,0
  6534 00003127 8B1E[1F31]               mov bx, [arglen]
  6535 0000312B 8A07                     mov al, [bx]
  6536 0000312D B400                     mov ah, 0
  6537 0000312F 8946FE                   mov [bp-2], ax
  6538                                  
  6539                                  ;-622   if (arglen1) { i=arglen1+129; *i=0; }
  6540                                  
  6541 00003132 8B46FE                   mov ax, [bp-2]
  6542 00003135 08C0                     or  al, al
  6543 00003137 0F841400                 je .getarg347
  6544 0000313B 8B46FE                   mov ax, [bp-2]
  6545 0000313E 058100                   add ax, 129
  6546 00003141 8946FC                   mov [bp-4], ax
  6547 00003144 B80000                   mov ax, 0
  6548 00003147 8B5EFC                   mov  bx, [bp-4]
  6549 0000314A 8907                     mov  [bx], ax
  6550                                  
  6551                                  ;-623   else { cputs(Version1); cputs(" Usage: A.COM in_file[.C]: ");
  6552                                  
  6553 0000314C E93900                   jmp .getarg348
  6554                                  .getarg347:
  6555 0000314F 8D06[0300]               lea  ax, [Version1]
  6556 00003153 50                       push ax
  6557 00003154 E83DCF                   call cputs
  6558 00003157 83C402                   add  sp, 2
  6559 0000315A 68[D132]                 push getarg_0
  6560 0000315D E834CF                   call cputs
  6561 00003160 83C402                   add  sp, 2
  6562                                  
  6563                                  ;-624     DOS_NoBytes=readRL(argv, 0, CMDLENMAX); c=DOS_NoBytes+128; *c=0; prnl(); }
  6564                                  
  6565 00003163 6A43                     push 67
  6566 00003165 6A00                     push 0
  6567 00003167 FF36[2131]               push word [argv]
  6568 0000316B E8BBCF                   call readRL
  6569 0000316E 83C406                   add  sp, 6
  6570 00003171 A3[7000]                 mov word [DOS_NoBytes], ax
  6571 00003174 A1[7000]                 mov ax, [DOS_NoBytes]
  6572 00003177 058000                   add ax, 128
  6573 0000317A 8946FA                   mov [bp-6], ax
  6574 0000317D B80000                   mov ax, 0
  6575 00003180 8B5EFA                   mov  bx, [bp-6]
  6576 00003183 8807                     mov  [bx], al
  6577 00003185 E82F14                   call prnl
  6578                                  
  6579                                  ;-625   strcpy(namein, argv);
  6580                                  
  6581                                  .getarg348:
  6582 00003188 FF36[2131]               push word [argv]
  6583 0000318C 8D06EE81                 lea  ax, [namein]
  6584 00003190 50                       push ax
  6585 00003191 E8E7CF                   call strcpy
  6586 00003194 83C404                   add  sp, 4
  6587                                  
  6588                                  ;-626   if (instr2(namein, '.') == 0) strcat1(namein, ".C");
  6589                                  
  6590 00003197 6A2E                     push 46
  6591 00003199 8D06EE81                 lea  ax, [namein]
  6592 0000319D 50                       push ax
  6593 0000319E E888D0                   call instr2
  6594 000031A1 83C404                   add  sp, 4
  6595 000031A4 83F800                   cmp ax, 0
  6596 000031A7 0F850E00                 jne .getarg349
  6597 000031AB 68[ED32]                 push getarg_1
  6598 000031AE 8D06EE81                 lea  ax, [namein]
  6599 000031B2 50                       push ax
  6600 000031B3 E8A5D0                   call strcat1
  6601 000031B6 83C404                   add  sp, 4
  6602                                  
  6603                                  ;-627   toupper(namein);
  6604                                  
  6605                                  .getarg349:
  6606 000031B9 8D06EE81                 lea  ax, [namein]
  6607 000031BD 50                       push ax
  6608 000031BE E8BFD0                   call toupper
  6609 000031C1 83C402                   add  sp, 2
  6610                                  
  6611                                  ;-628   strcpy(namelst, namein); i=strlen(namelst); i--; c=&namelst+i; *c='S';
  6612                                  
  6613 000031C4 8D06EE81                 lea  ax, [namein]
  6614 000031C8 50                       push ax
  6615 000031C9 8D063182                 lea  ax, [namelst]
  6616 000031CD 50                       push ax
  6617 000031CE E8AACF                   call strcpy
  6618 000031D1 83C404                   add  sp, 4
  6619 000031D4 8D063182                 lea  ax, [namelst]
  6620 000031D8 50                       push ax
  6621 000031D9 E877CF                   call strlen
  6622 000031DC 83C402                   add  sp, 2
  6623 000031DF 8946FC                   mov [bp-4], ax
  6624 000031E2 FF4EFC                   dec  word[bp-4]
  6625 000031E5 B83182                   mov ax, namelst
  6626 000031E8 0346FC                   add ax, [bp-4]
  6627 000031EB 8946FA                   mov [bp-6], ax
  6628 000031EE B85300                   mov ax, 83
  6629 000031F1 8B5EFA                   mov  bx, [bp-6]
  6630 000031F4 8807                     mov  [bx], al
  6631                                  
  6632                                  ;-629  
  6633                                  
  6634                                  
  6635                                  ;-630   fdin=openR (namein);
  6636                                  
  6637 000031F6 8D06EE81                 lea  ax, [namein]
  6638 000031FA 50                       push ax
  6639 000031FB E8D8CE                   call openR
  6640 000031FE 83C402                   add  sp, 2
  6641 00003201 A3[1800]                 mov word [fdin], ax
  6642                                  
  6643                                  ;-631   if(DOS_ERR){cputs("Source file missing (.C): "); cputs(namein); exitR(1); }
  6644                                  
  6645 00003204 A1[6E00]                 mov ax, [DOS_ERR]
  6646 00003207 08C0                     or  al, al
  6647 00003209 0F841C00                 je .getarg350
  6648 0000320D 68[F032]                 push getarg_2
  6649 00003210 E881CE                   call cputs
  6650 00003213 83C402                   add  sp, 2
  6651 00003216 8D06EE81                 lea  ax, [namein]
  6652 0000321A 50                       push ax
  6653 0000321B E876CE                   call cputs
  6654 0000321E 83C402                   add  sp, 2
  6655 00003221 6A01                     push 1
  6656 00003223 E8E0CE                   call exitR
  6657 00003226 83C402                   add  sp, 2
  6658                                  
  6659                                  ;-632   fdout=creatR(namelst);
  6660                                  
  6661                                  .getarg350:
  6662 00003229 8D063182                 lea  ax, [namelst]
  6663 0000322D 50                       push ax
  6664 0000322E E8B4CE                   call creatR
  6665 00003231 83C402                   add  sp, 2
  6666 00003234 A3[1A00]                 mov word [fdout], ax
  6667                                  
  6668                                  ;-633   if(DOS_ERR){cputs("list file not creatable: ");cputs(namelst);exitR(2);}
  6669                                  
  6670 00003237 A1[6E00]                 mov ax, [DOS_ERR]
  6671 0000323A 08C0                     or  al, al
  6672 0000323C 0F841C00                 je .getarg351
  6673 00003240 68[0B33]                 push getarg_3
  6674 00003243 E84ECE                   call cputs
  6675 00003246 83C402                   add  sp, 2
  6676 00003249 8D063182                 lea  ax, [namelst]
  6677 0000324D 50                       push ax
  6678 0000324E E843CE                   call cputs
  6679 00003251 83C402                   add  sp, 2
  6680 00003254 6A02                     push 2
  6681 00003256 E8ADCE                   call exitR
  6682 00003259 83C402                   add  sp, 2
  6683                                  
  6684                                  ;-634   prs("\n; ");prs(Version1);
  6685                                  
  6686                                  .getarg351:
  6687 0000325C 68[2533]                 push getarg_4
  6688 0000325F E86313                   call prs
  6689 00003262 83C402                   add  sp, 2
  6690 00003265 8D06[0300]               lea  ax, [Version1]
  6691 00003269 50                       push ax
  6692 0000326A E85813                   call prs
  6693 0000326D 83C402                   add  sp, 2
  6694                                  
  6695                                  ;-635   prs(", Arglen: "); pint1(arglen1); if(arglen1){prs(", Argv: "); prs(argv);}
  6696                                  
  6697 00003270 68[2A33]                 push getarg_5
  6698 00003273 E84F13                   call prs
  6699 00003276 83C402                   add  sp, 2
  6700 00003279 FF76FE                   push word [bp-2]
  6701 0000327C E83D14                   call pint1
  6702 0000327F 83C402                   add  sp, 2
  6703 00003282 8B46FE                   mov ax, [bp-2]
  6704 00003285 08C0                     or  al, al
  6705 00003287 0F841300                 je .getarg352
  6706 0000328B 68[3533]                 push getarg_6
  6707 0000328E E83413                   call prs
  6708 00003291 83C402                   add  sp, 2
  6709 00003294 FF36[2131]               push word [argv]
  6710 00003298 E82A13                   call prs
  6711 0000329B 83C402                   add  sp, 2
  6712                                  
  6713                                  ;-636   prs(", Source: "); prs(namein);  prs(", Output asm: "); prs(namelst);
  6714                                  
  6715                                  .getarg352:
  6716 0000329E 68[3E33]                 push getarg_7
  6717 000032A1 E82113                   call prs
  6718 000032A4 83C402                   add  sp, 2
  6719 000032A7 8D06EE81                 lea  ax, [namein]
  6720 000032AB 50                       push ax
  6721 000032AC E81613                   call prs
  6722 000032AF 83C402                   add  sp, 2
  6723 000032B2 68[4933]                 push getarg_8
  6724 000032B5 E80D13                   call prs
  6725 000032B8 83C402                   add  sp, 2
  6726 000032BB 8D063182                 lea  ax, [namelst]
  6727 000032BF 50                       push ax
  6728 000032C0 E80213                   call prs
  6729 000032C3 83C402                   add  sp, 2
  6730                                  
  6731                                  ;-637   prs("\norg  256 \njmp main"); 
  6732                                  
  6733 000032C6 68[5833]                 push getarg_9
  6734 000032C9 E8F912                   call prs
  6735 000032CC 83C402                   add  sp, 2
  6736                                  
  6737                                  ;-638 }
  6738                                  
  6739                                  
  6740                                  ;-639 int parse() { token=getlex(); do {
  6741 000032CF C9                       LEAVE
  6742 000032D0 C3                       ret
  6743                                  ; ENDP
  6744 000032D1 2055736167653A2041-     getarg_0 db " Usage: A.COM in_file[.C]: ",0
  6745 000032DA 2E434F4D20696E5F66-
  6746 000032E3 696C655B2E435D3A20-
  6747 000032EC 00                 
  6748 000032ED 2E4300                  getarg_1 db ".C",0
  6749 000032F0 536F75726365206669-     getarg_2 db "Source file missing (.C): ",0
  6750 000032F9 6C65206D697373696E-
  6751 00003302 6720282E43293A2000 
  6752 0000330B 6C6973742066696C65-     getarg_3 db "list file not creatable: ",0
  6753 00003314 206E6F742063726561-
  6754 0000331D 7461626C653A2000   
  6755 00003325 5C6E3B2000              getarg_4 db "\n; ",0
  6756 0000332A 2C204172676C656E3A-     getarg_5 db ", Arglen: ",0
  6757 00003333 2000               
  6758 00003335 2C20417267763A2000      getarg_6 db ", Argv: ",0
  6759 0000333E 2C20536F757263653A-     getarg_7 db ", Source: ",0
  6760 00003347 2000               
  6761 00003349 2C204F757470757420-     getarg_8 db ", Output asm: ",0
  6762 00003352 61736D3A2000       
  6763 00003358 5C6E6F726720203235-     getarg_9 db "\norg  256 \njmp main",0
  6764 00003361 36205C6E6A6D70206D-
  6765 0000336A 61696E00           
  6766                                  
  6767                                  parse:  ; *** PROC ***
  6768 0000336E E8FB09                   call getlex
  6769 00003371 A3[1C00]                 mov word [token], ax
  6770                                  .parse353:
  6771                                  
  6772                                  ;-640     if (token <= 0) return 1;
  6773                                  
  6774 00003374 A1[1C00]                 mov ax, [token]
  6775 00003377 83F800                   cmp ax, 0
  6776 0000337A 0F8F0600                 jg  .parse354
  6777 0000337E B80100                   mov ax, 1
  6778 00003381 E96500                   jmp .retn
  6779                                  
  6780                                  ;-641     if (istoken('#')) {
  6781                                  
  6782                                  .parse354:
  6783 00003384 6A23                     push 35
  6784 00003386 E80711                   call istoken
  6785 00003389 83C402                   add  sp, 2
  6786 0000338C 08C0                     or  al, al
  6787 0000338E 0F843600                 je .parse355
  6788                                  
  6789                                  ;-642       if (istoken(T_DEFINE)) dodefine();
  6790                                  
  6791 00003392 68FF01                   push 511
  6792 00003395 E8F810                   call istoken
  6793 00003398 83C402                   add  sp, 2
  6794 0000339B 08C0                     or  al, al
  6795 0000339D 0F840600                 je .parse356
  6796 000033A1 E8A702                   call dodefine
  6797                                  
  6798                                  ;-643       else if (istoken(T_INCLUDE)) doinclude();
  6799                                  
  6800 000033A4 E91E00                   jmp .parse357
  6801                                  .parse356:
  6802 000033A7 68FE01                   push 510
  6803 000033AA E8E310                   call istoken
  6804 000033AD 83C402                   add  sp, 2
  6805 000033B0 08C0                     or  al, al
  6806 000033B2 0F840600                 je .parse358
  6807 000033B6 E8AC01                   call doinclude
  6808                                  
  6809                                  ;-644       else error1("define or include expected");  }
  6810                                  
  6811 000033B9 E90900                   jmp .parse359
  6812                                  .parse358:
  6813 000033BC 68[EA33]                 push parse_0
  6814 000033BF E8EC14                   call error1
  6815 000033C2 83C402                   add  sp, 2
  6816                                  .parse359:
  6817                                  .parse357:
  6818                                  
  6819                                  ;-645     else{ typeName();  if (token=='(') dofunc();  else doglob(); }
  6820                                  
  6821 000033C5 E91600                   jmp .parse360
  6822                                  .parse355:
  6823 000033C8 E821D7                   call typeName
  6824 000033CB A1[1C00]                 mov ax, [token]
  6825 000033CE 83F828                   cmp ax, 40
  6826 000033D1 0F850600                 jne .parse361
  6827 000033D5 E828DA                   call dofunc
  6828 000033D8 E90300                   jmp .parse362
  6829                                  .parse361:
  6830 000033DB E8D2D0                   call doglob
  6831                                  .parse362:
  6832                                  
  6833                                  ;-646   } while(1);
  6834                                  
  6835                                  .parse360:
  6836 000033DE B80100                   mov ax, 1
  6837 000033E1 08C0                     or  al, al
  6838 000033E3 0F840200                 je .parse363
  6839 000033E7 EB8B                     jmp .parse353
  6840                                  .parse363:
  6841                                  
  6842                                  ;-647 }
  6843                                  
  6844                                  
  6845                                  ;-648 int checkcalls() { int i; int j; int k;
  6846                                  
  6847                                   .retn:
  6848 000033E9 C3                       ret
  6849                                  ; ENDP
  6850 000033EA 646566696E65206F72-     parse_0 db "define or include expected",0
  6851 000033F3 20696E636C75646520-
  6852 000033FC 657870656374656400 
  6853                                  
  6854                                  checkcalls:  ; *** PROC ***
  6855                                  
  6856                                  ;-649   prs("\n \n; missing functions: ");
  6857                                  
  6858                                  ;Function : checkcalls, Number of local variables: 3
  6859                                  ;   # type sign width addr used name   list of local variables
  6860                                  ;  200 var sign word   648 NULL i = bp-2
  6861                                  ;  201 var sign word   648 NULL j = bp-4
  6862                                  ;  202 var sign word   648 NULL k = bp-6;
  6863 00003405 C8060000                 ENTER  6,0
  6864 00003409 68[EB34]                 push checkcalls_0
  6865 0000340C E8B611                   call prs
  6866 0000340F 83C402                   add  sp, 2
  6867                                  
  6868                                  ;-650   i=0;  k=0;
  6869                                  
  6870 00003412 B80000                   mov ax, 0
  6871 00003415 8946FE                   mov [bp-2], ax
  6872 00003418 B80000                   mov ax, 0
  6873 0000341B 8946FA                   mov [bp-6], ax
  6874                                  
  6875                                  ;-651   while (i < CTop) {
  6876                                  
  6877                                  .checkcalls364:
  6878 0000341E 8B46FE                   mov ax, [bp-2]
  6879 00003421 3B06[3D00]               cmp ax, [CTop]
  6880 00003425 0F8D8F00                 jge .checkcalls365
  6881                                  
  6882                                  ;-652     pt=CAdr[i];
  6883                                  
  6884 00003429 8B5EFE                   mov bx, [bp-2]
  6885 0000342C D1E3                     shl bx, 1
  6886 0000342E 8B8757AB                 mov ax, [CAdr + bx]
  6887 00003432 A3[6A00]                 mov word [pt], ax
  6888                                  
  6889                                  ;-653     from_far(NameA, pt);
  6890                                  
  6891 00003435 FF36[6A00]               push word [pt]
  6892 00003439 8D06[3F00]               lea  ax, [NameA]
  6893 0000343D 50                       push ax
  6894 0000343E E8E21F                   call from_far
  6895 00003441 83C404                   add  sp, 4
  6896                                  
  6897                                  ;-654     j=0;
  6898                                  
  6899 00003444 B80000                   mov ax, 0
  6900 00003447 8946FC                   mov [bp-4], ax
  6901                                  
  6902                                  ;-655     do { p1=adrF(FNameField, j);
  6903                                  
  6904                                  .checkcalls366:
  6905 0000344A FF76FC                   push word [bp-4]
  6906 0000344D 8D064FBD                 lea  ax, [FNameField]
  6907 00003451 50                       push ax
  6908 00003452 E855D5                   call adrF
  6909 00003455 83C404                   add  sp, 4
  6910 00003458 A3[6C00]                 mov word [p1], ax
  6911                                  
  6912                                  ;-656       if (eqstr(NameA, p1)){ CType[i]=1; j=FTop; }
  6913                                  
  6914 0000345B FF36[6C00]               push word [p1]
  6915 0000345F 8D06[3F00]               lea  ax, [NameA]
  6916 00003463 50                       push ax
  6917 00003464 E844CD                   call eqstr
  6918 00003467 83C404                   add  sp, 4
  6919 0000346A 08C0                     or  al, al
  6920 0000346C 0F841000                 je .checkcalls367
  6921 00003470 B80100                   mov ax, 1
  6922 00003473 8B5EFE                   mov bx, [bp-2]
  6923 00003476 88872FA1                 mov [CType+bx], al
  6924 0000347A A1[3B00]                 mov ax, [FTop]
  6925 0000347D 8946FC                   mov [bp-4], ax
  6926                                  
  6927                                  ;-657       j++; } while (j < FTop);
  6928                                  
  6929                                  .checkcalls367:
  6930 00003480 FF46FC                   inc  word[bp-4]
  6931 00003483 8B46FC                   mov ax, [bp-4]
  6932 00003486 3B06[3B00]               cmp ax, [FTop]
  6933 0000348A 0F8D0200                 jge .checkcalls368
  6934 0000348E EBBA                     jmp .checkcalls366
  6935                                  .checkcalls368:
  6936                                  
  6937                                  ;-658     if (j == FTop) { k++; prs("\n; "); prs(NameA); }
  6938                                  
  6939 00003490 8B46FC                   mov ax, [bp-4]
  6940 00003493 3B06[3B00]               cmp ax, [FTop]
  6941 00003497 0F851700                 jne .checkcalls369
  6942 0000349B FF46FA                   inc  word[bp-6]
  6943 0000349E 68[0635]                 push checkcalls_1
  6944 000034A1 E82111                   call prs
  6945 000034A4 83C402                   add  sp, 2
  6946 000034A7 8D06[3F00]               lea  ax, [NameA]
  6947 000034AB 50                       push ax
  6948 000034AC E81611                   call prs
  6949 000034AF 83C402                   add  sp, 2
  6950                                  
  6951                                  ;-659     i++; }
  6952                                  
  6953                                  .checkcalls369:
  6954 000034B2 FF46FE                   inc  word[bp-2]
  6955                                  
  6956                                  ;-660   prs("\n; Number of unresolved CALLs :"); printint51(k);
  6957                                  
  6958 000034B5 E966FF                   jmp .checkcalls364
  6959                                  .checkcalls365:
  6960 000034B8 68[0B35]                 push checkcalls_2
  6961 000034BB E80711                   call prs
  6962 000034BE 83C402                   add  sp, 2
  6963 000034C1 FF76FA                   push word [bp-6]
  6964 000034C4 E89A12                   call printint51
  6965 000034C7 83C402                   add  sp, 2
  6966                                  
  6967                                  ;-661   if (k!=0) error1("At least 1 function is missing! "); 
  6968                                  
  6969 000034CA 8B46FA                   mov ax, [bp-6]
  6970 000034CD 83F800                   cmp ax, 0
  6971 000034D0 0F840C00                 je  .checkcalls370
  6972 000034D4 68[2C35]                 push checkcalls_3
  6973 000034D7 E8D413                   call error1
  6974 000034DA 83C402                   add  sp, 2
  6975                                  
  6976                                  ;-662     else prs(" All FUNCTIONs in place");
  6977                                  
  6978 000034DD E90900                   jmp .checkcalls371
  6979                                  .checkcalls370:
  6980 000034E0 68[4D35]                 push checkcalls_4
  6981 000034E3 E8DF10                   call prs
  6982 000034E6 83C402                   add  sp, 2
  6983                                  
  6984                                  ;-663 }
  6985                                  
  6986                                  .checkcalls371:
  6987                                  
  6988                                  ;-664 
  6989                                  
  6990                                  
  6991                                  ;-665 int doinclude() { int fdtemp;
  6992 000034E9 C9                       LEAVE
  6993 000034EA C3                       ret
  6994                                  ; ENDP
  6995 000034EB 5C6E205C6E3B206D69-     checkcalls_0 db "\n \n; missing functions: ",0
  6996 000034F4 7373696E672066756E-
  6997 000034FD 6374696F6E733A2000 
  6998 00003506 5C6E3B2000              checkcalls_1 db "\n; ",0
  6999 0000350B 5C6E3B204E756D6265-     checkcalls_2 db "\n; Number of unresolved CALLs :",0
  7000 00003514 72206F6620756E7265-
  7001 0000351D 736F6C766564204341-
  7002 00003526 4C4C73203A00       
  7003 0000352C 4174206C6561737420-     checkcalls_3 db "At least 1 function is missing! ",0
  7004 00003535 312066756E6374696F-
  7005 0000353E 6E206973206D697373-
  7006 00003547 696E67212000       
  7007 0000354D 20416C6C2046554E43-     checkcalls_4 db " All FUNCTIONs in place",0
  7008 00003556 54494F4E7320696E20-
  7009 0000355F 706C61636500       
  7010                                  
  7011                                  doinclude:  ; *** PROC ***
  7012                                  
  7013                                  ;-666   if (token==T_STRING) {  fdtemp=fdin;
  7014                                  
  7015                                  ;Function : doinclude, Number of local variables: 1
  7016                                  ;   # type sign width addr used name   list of local variables
  7017                                  ;  200 var sign word   665 NULL fdtemp = bp-2;
  7018 00003565 C8020000                 ENTER  2,0
  7019 00003569 A1[1C00]                 mov ax, [token]
  7020 0000356C 3D0201                   cmp ax, 258
  7021 0000356F 0F858700                 jne .doinclude372
  7022 00003573 A1[1800]                 mov ax, [fdin]
  7023 00003576 8946FE                   mov [bp-2], ax
  7024                                  
  7025                                  ;-667   prs("\n;Use include file: "); prs(symbol);
  7026                                  
  7027 00003579 68[FC35]                 push doinclude_0
  7028 0000357C E84610                   call prs
  7029 0000357F 83C402                   add  sp, 2
  7030 00003582 8D062B81                 lea  ax, [symbol]
  7031 00003586 50                       push ax
  7032 00003587 E83B10                   call prs
  7033 0000358A 83C402                   add  sp, 2
  7034                                  
  7035                                  ;-668   fdin=openR(symbol);
  7036                                  
  7037 0000358D 8D062B81                 lea  ax, [symbol]
  7038 00003591 50                       push ax
  7039 00003592 E841CB                   call openR
  7040 00003595 83C402                   add  sp, 2
  7041 00003598 A3[1800]                 mov word [fdin], ax
  7042                                  
  7043                                  ;-669   if (DOS_ERR !=0) {prs("Include file missing: "); prs(symbol);
  7044                                  
  7045 0000359B A1[6E00]                 mov ax, [DOS_ERR]
  7046 0000359E 83F800                   cmp ax, 0
  7047 000035A1 0F841D00                 je  .doinclude373
  7048 000035A5 68[1236]                 push doinclude_1
  7049 000035A8 E81A10                   call prs
  7050 000035AB 83C402                   add  sp, 2
  7051 000035AE 8D062B81                 lea  ax, [symbol]
  7052 000035B2 50                       push ax
  7053 000035B3 E80F10                   call prs
  7054 000035B6 83C402                   add  sp, 2
  7055                                  
  7056                                  ;-670     error1(" Stop!!"); }
  7057                                  
  7058 000035B9 68[2936]                 push doinclude_2
  7059 000035BC E8EF12                   call error1
  7060 000035BF 83C402                   add  sp, 2
  7061                                  
  7062                                  ;-671   linenoinclude=lineno; lineno=1;
  7063                                  
  7064                                  .doinclude373:
  7065 000035C2 A1[6600]                 mov ax, [lineno]
  7066 000035C5 A3[6800]                 mov word [linenoinclude], ax
  7067 000035C8 B80100                   mov ax, 1
  7068 000035CB A3[6600]                 mov word [lineno], ax
  7069                                  
  7070                                  ;-672   parse(); lineno=linenoinclude;
  7071                                  
  7072 000035CE E89DFD                   call parse
  7073 000035D1 A1[6800]                 mov ax, [linenoinclude]
  7074 000035D4 A3[6600]                 mov word [lineno], ax
  7075                                  
  7076                                  ;-673   fdin=fdtemp; prs("\n;Back to main program: "); prs(namein);
  7077                                  
  7078 000035D7 8B46FE                   mov ax, [bp-2]
  7079 000035DA A3[1800]                 mov word [fdin], ax
  7080 000035DD 68[3136]                 push doinclude_3
  7081 000035E0 E8E20F                   call prs
  7082 000035E3 83C402                   add  sp, 2
  7083 000035E6 8D06EE81                 lea  ax, [namein]
  7084 000035EA 50                       push ax
  7085 000035EB E8D70F                   call prs
  7086 000035EE 83C402                   add  sp, 2
  7087                                  
  7088                                  ;-674   getfirstchar(); token=getlex(); }
  7089                                  
  7090 000035F1 E815FB                   call getfirstchar
  7091 000035F4 E87507                   call getlex
  7092 000035F7 A3[1C00]                 mov word [token], ax
  7093                                  
  7094                                  ;-675 }
  7095                                  
  7096                                  .doinclude372:
  7097                                  
  7098                                  ;-676 int dodefine() { int i; int j; int fdtemp;
  7099 000035FA C9                       LEAVE
  7100 000035FB C3                       ret
  7101                                  ; ENDP
  7102 000035FC 5C6E3B55736520696E-     doinclude_0 db "\n;Use include file: ",0
  7103 00003605 636C7564652066696C-
  7104 0000360E 653A2000           
  7105 00003612 496E636C7564652066-     doinclude_1 db "Include file missing: ",0
  7106 0000361B 696C65206D69737369-
  7107 00003624 6E673A2000         
  7108 00003629 2053746F70212100        doinclude_2 db " Stop!!",0
  7109 00003631 5C6E3B4261636B2074-     doinclude_3 db "\n;Back to main program: ",0
  7110 0000363A 6F206D61696E207072-
  7111 00003643 6F6772616D3A2000   
  7112                                  
  7113                                  dodefine:  ; *** PROC ***
  7114                                  
  7115                                  ;-677   if (eqstr(symbol, "ORGDATA")) {token=getlex();
  7116                                  
  7117                                  ;Function : dodefine, Number of local variables: 3
  7118                                  ;   # type sign width addr used name   list of local variables
  7119                                  ;  200 var sign word   676 NULL i = bp-2
  7120                                  ;  201 var sign word   676 NULL j = bp-4
  7121                                  ;  202 var sign word   676 NULL fdtemp = bp-6;
  7122 0000364B C8060000                 ENTER  6,0
  7123 0000364F 68[9237]                 push dodefine_0
  7124 00003652 8D062B81                 lea  ax, [symbol]
  7125 00003656 50                       push ax
  7126 00003657 E851CB                   call eqstr
  7127 0000365A 83C404                   add  sp, 4
  7128 0000365D 08C0                     or  al, al
  7129 0000365F 0F841500                 je .dodefine374
  7130 00003663 E80607                   call getlex
  7131 00003666 A3[1C00]                 mov word [token], ax
  7132                                  
  7133                                  ;-678     ORGDATAORIG=lexval; orgData=lexval; return; }
  7134                                  
  7135 00003669 A1[2E00]                 mov ax, [lexval]
  7136 0000366C A3[0E00]                 mov word [ORGDATAORIG], ax
  7137 0000366F A1[2E00]                 mov ax, [lexval]
  7138 00003672 A3[1000]                 mov word [orgData], ax
  7139 00003675 E91801                   jmp .retn
  7140                                  
  7141                                  ;-679   if (eqstr(symbol, "ARCHIVE")){token=getlex();  if (token==T_STRING) {
  7142                                  
  7143                                  .dodefine374:
  7144 00003678 68[9A37]                 push dodefine_1
  7145 0000367B 8D062B81                 lea  ax, [symbol]
  7146 0000367F 50                       push ax
  7147 00003680 E828CB                   call eqstr
  7148 00003683 83C404                   add  sp, 4
  7149 00003686 08C0                     or  al, al
  7150 00003688 0F844900                 je .dodefine375
  7151 0000368C E8DD06                   call getlex
  7152 0000368F A3[1C00]                 mov word [token], ax
  7153 00003692 A1[1C00]                 mov ax, [token]
  7154 00003695 3D0201                   cmp ax, 258
  7155 00003698 0F852700                 jne .dodefine376
  7156                                  
  7157                                  ;-680     prs("\n;Use archive file: ");
  7158                                  
  7159 0000369C 68[A237]                 push dodefine_2
  7160 0000369F E8230F                   call prs
  7161 000036A2 83C402                   add  sp, 2
  7162                                  
  7163                                  ;-681     strcpy(archivename, symbol); prs(archivename);
  7164                                  
  7165 000036A5 8D062B81                 lea  ax, [symbol]
  7166 000036A9 50                       push ax
  7167 000036AA 8D067482                 lea  ax, [archivename]
  7168 000036AE 50                       push ax
  7169 000036AF E8C9CA                   call strcpy
  7170 000036B2 83C404                   add  sp, 4
  7171 000036B5 8D067482                 lea  ax, [archivename]
  7172 000036B9 50                       push ax
  7173 000036BA E8080F                   call prs
  7174 000036BD 83C402                   add  sp, 2
  7175                                  
  7176                                  ;-682     } else error1("Name of archive file missing"); token=getlex(); return;}
  7177                                  
  7178 000036C0 E90900                   jmp .dodefine377
  7179                                  .dodefine376:
  7180 000036C3 68[B837]                 push dodefine_3
  7181 000036C6 E8E511                   call error1
  7182 000036C9 83C402                   add  sp, 2
  7183                                  .dodefine377:
  7184 000036CC E89D06                   call getlex
  7185 000036CF A3[1C00]                 mov word [token], ax
  7186 000036D2 E9BB00                   jmp .retn
  7187                                  
  7188                                  ;-683    expect(T_NAME);
  7189                                  
  7190                                  .dodefine375:
  7191 000036D5 680001                   push 256
  7192 000036D8 E8D70D                   call expect
  7193 000036DB 83C402                   add  sp, 2
  7194                                  
  7195                                  ;-684   if (token==T_CONST) { 
  7196                                  
  7197 000036DE A1[1C00]                 mov ax, [token]
  7198 000036E1 3D0101                   cmp ax, 257
  7199 000036E4 0F85A800                 jne .dodefine378
  7200                                  
  7201                                  ;-685     if (GTop >= LSTART) error1("global table (define) full");
  7202                                  
  7203 000036E8 A1[2A00]                 mov ax, [GTop]
  7204 000036EB 3DC800                   cmp ax, 200 ;unsigned : 1
  7205 000036EE 0F8C0900                 jl  .dodefine379
  7206 000036F2 68[D537]                 push dodefine_4
  7207 000036F5 E8B611                   call error1
  7208 000036F8 83C402                   add  sp, 2
  7209                                  
  7210                                  ;-686     i=strlen(symbol); if (i>15) error1("Define name longer 15 char");
  7211                                  
  7212                                  .dodefine379:
  7213 000036FB 8D062B81                 lea  ax, [symbol]
  7214 000036FF 50                       push ax
  7215 00003700 E850CA                   call strlen
  7216 00003703 83C402                   add  sp, 2
  7217 00003706 8946FE                   mov [bp-2], ax
  7218 00003709 8B46FE                   mov ax, [bp-2]
  7219 0000370C 83F80F                   cmp ax, 15
  7220 0000370F 0F8E0900                 jle .dodefine380
  7221 00003713 68[F037]                 push dodefine_5
  7222 00003716 E89511                   call error1
  7223 00003719 83C402                   add  sp, 2
  7224                                  
  7225                                  ;-687     GSign [GTop]='U'; GWidth[GTop]=1; GType [GTop]='#';
  7226                                  
  7227                                  .dodefine380:
  7228 0000371C B85500                   mov ax, 85
  7229 0000371F 8B1E[2A00]               mov bx, [GTop]
  7230 00003723 8887E383                 mov [GSign+bx], al
  7231 00003727 B80100                   mov ax, 1
  7232 0000372A 8B1E[2A00]               mov bx, [GTop]
  7233 0000372E 88870F85                 mov [GWidth+bx], al
  7234 00003732 B82300                   mov ax, 35
  7235 00003735 8B1E[2A00]               mov bx, [GTop]
  7236 00003739 8887B782                 mov [GType+bx], al
  7237                                  
  7238                                  ;-688     GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  7239                                  
  7240 0000373D A1[6600]                 mov ax, [lineno]
  7241 00003740 83E801                   sub ax, 1
  7242 00003743 8B1E[2A00]               mov bx, [GTop]
  7243 00003747 D1E3                     shl bx, 1
  7244 00003749 89873B86                 mov [GAdr+bx], ax
  7245 0000374D B80000                   mov ax, 0
  7246 00003750 8B1E[2A00]               mov bx, [GTop]
  7247 00003754 D1E3                     shl bx, 1
  7248 00003756 89879388                 mov [GUsed+bx], ax
  7249                                  
  7250                                  ;-689     pt=adrofname(GTop); strcpy(pt, symbol); GData[GTop]=lexval;
  7251                                  
  7252 0000375A FF36[2A00]               push word [GTop]
  7253 0000375E E835D2                   call adrofname
  7254 00003761 83C402                   add  sp, 2
  7255 00003764 A3[6A00]                 mov word [pt], ax
  7256 00003767 8D062B81                 lea  ax, [symbol]
  7257 0000376B 50                       push ax
  7258 0000376C FF36[6A00]               push word [pt]
  7259 00003770 E808CA                   call strcpy
  7260 00003773 83C404                   add  sp, 4
  7261 00003776 A1[2E00]                 mov ax, [lexval]
  7262 00003779 8B1E[2A00]               mov bx, [GTop]
  7263 0000377D D1E3                     shl bx, 1
  7264 0000377F 8987EB8A                 mov [GData+bx], ax
  7265                                  
  7266                                  ;-690     expect(T_CONST); GTop++;  } 
  7267                                  
  7268 00003783 680101                   push 257
  7269 00003786 E8290D                   call expect
  7270 00003789 83C402                   add  sp, 2
  7271 0000378C FF06[2A00]               inc  word[GTop]
  7272                                  
  7273                                  ;-691 }
  7274                                  
  7275                                  .dodefine378:
  7276                                  
  7277                                  ;-692 int stmt() { int c; char cha;
  7278                                  
  7279 00003790 C9                       .retn: LEAVE
  7280 00003791 C3                       ret
  7281                                  ; ENDP
  7282 00003792 4F52474441544100        dodefine_0 db "ORGDATA",0
  7283 0000379A 4152434849564500        dodefine_1 db "ARCHIVE",0
  7284 000037A2 5C6E3B557365206172-     dodefine_2 db "\n;Use archive file: ",0
  7285 000037AB 63686976652066696C-
  7286 000037B4 653A2000           
  7287 000037B8 4E616D65206F662061-     dodefine_3 db "Name of archive file missing",0
  7288 000037C1 726368697665206669-
  7289 000037CA 6C65206D697373696E-
  7290 000037D3 6700               
  7291 000037D5 676C6F62616C207461-     dodefine_4 db "global table (define) full",0
  7292 000037DE 626C65202864656669-
  7293 000037E7 6E65292066756C6C00 
  7294 000037F0 446566696E65206E61-     dodefine_5 db "Define name longer 15 char",0
  7295 000037F9 6D65206C6F6E676572-
  7296 00003802 203135206368617200 
  7297                                  
  7298                                  stmt:  ; *** PROC ***
  7299                                  
  7300                                  ;-693        if(istoken('{'))     {while(istoken('}')==0) stmt();}
  7301                                  
  7302                                  ;Function : stmt, Number of local variables: 2
  7303                                  ;   # type sign width addr used name   list of local variables
  7304                                  ;  200 var sign word   692 NULL c = bp-2
  7305                                  ;  201 var sign byte   692 NULL cha = bp-4;
  7306 0000380B C8040000                 ENTER  4,0
  7307 0000380F 6A7B                     push 123
  7308 00003811 E87C0C                   call istoken
  7309 00003814 83C402                   add  sp, 2
  7310 00003817 08C0                     or  al, al
  7311 00003819 0F841700                 je .stmt381
  7312                                  .stmt382:
  7313 0000381D 6A7D                     push 125
  7314 0000381F E86E0C                   call istoken
  7315 00003822 83C402                   add  sp, 2
  7316 00003825 83F800                   cmp ax, 0
  7317 00003828 0F850500                 jne .stmt383
  7318 0000382C E8DCFF                   call stmt
  7319 0000382F EBEC                     jmp .stmt382
  7320                                  .stmt383:
  7321                                  
  7322                                  ;-694   else if(istoken(T_IF))    doif();
  7323                                  
  7324 00003831 E9A501                   jmp .stmt384
  7325                                  .stmt381:
  7326 00003834 680102                   push 513
  7327 00003837 E8560C                   call istoken
  7328 0000383A 83C402                   add  sp, 2
  7329 0000383D 08C0                     or  al, al
  7330 0000383F 0F840600                 je .stmt385
  7331 00003843 E8CC03                   call doif
  7332                                  
  7333                                  ;-695   else if(istoken(T_DO))    dodo();
  7334                                  
  7335 00003846 E99001                   jmp .stmt386
  7336                                  .stmt385:
  7337 00003849 680402                   push 516
  7338 0000384C E8410C                   call istoken
  7339 0000384F 83C402                   add  sp, 2
  7340 00003852 08C0                     or  al, al
  7341 00003854 0F840600                 je .stmt387
  7342 00003858 E81904                   call dodo
  7343                                  
  7344                                  ;-696   else if(istoken(T_WHILE)) dowhile();
  7345                                  
  7346 0000385B E97B01                   jmp .stmt388
  7347                                  .stmt387:
  7348 0000385E 680302                   push 515
  7349 00003861 E82C0C                   call istoken
  7350 00003864 83C402                   add  sp, 2
  7351 00003867 08C0                     or  al, al
  7352 00003869 0F840600                 je .stmt389
  7353 0000386D E85104                   call dowhile
  7354                                  
  7355                                  ;-697   else if(istoken(T_GOTO))  {prs("\n jmp .");name1();prs(symbol);expect(';');}
  7356                                  
  7357 00003870 E96601                   jmp .stmt390
  7358                                  .stmt389:
  7359 00003873 680902                   push 521
  7360 00003876 E8170C                   call istoken
  7361 00003879 83C402                   add  sp, 2
  7362 0000387C 08C0                     or  al, al
  7363 0000387E 0F842200                 je .stmt391
  7364 00003882 68[DB39]                 push stmt_0
  7365 00003885 E83D0D                   call prs
  7366 00003888 83C402                   add  sp, 2
  7367 0000388B E837D3                   call name1
  7368 0000388E 8D062B81                 lea  ax, [symbol]
  7369 00003892 50                       push ax
  7370 00003893 E82F0D                   call prs
  7371 00003896 83C402                   add  sp, 2
  7372 00003899 6A3B                     push 59
  7373 0000389B E8140C                   call expect
  7374 0000389E 83C402                   add  sp, 2
  7375                                  
  7376                                  ;-698   else if(token==T_ASM)     {prs("\n"); c=next();
  7377                                  
  7378 000038A1 E93501                   jmp .stmt392
  7379                                  .stmt391:
  7380 000038A4 A1[1C00]                 mov ax, [token]
  7381 000038A7 3D0602                   cmp ax, 518
  7382 000038AA 0F853300                 jne .stmt393
  7383 000038AE 68[E439]                 push stmt_1
  7384 000038B1 E8110D                   call prs
  7385 000038B4 83C402                   add  sp, 2
  7386 000038B7 E8B80B                   call next
  7387 000038BA 8946FE                   mov [bp-2], ax
  7388                                  
  7389                                  ;-699         while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }
  7390                                  
  7391                                  .stmt394:
  7392 000038BD 8B46FE                   mov ax, [bp-2]
  7393 000038C0 83F80A                   cmp ax, 10
  7394 000038C3 0F841100                 je  .stmt395
  7395 000038C7 FF76FE                   push word [bp-2]
  7396 000038CA E8910C                   call prc
  7397 000038CD 83C402                   add  sp, 2
  7398 000038D0 E89F0B                   call next
  7399 000038D3 8946FE                   mov [bp-2], ax
  7400 000038D6 EBE5                     jmp .stmt394
  7401                                  .stmt395:
  7402 000038D8 E89104                   call getlex
  7403 000038DB A3[1C00]                 mov word [token], ax
  7404                                  
  7405                                  ;-700   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();  
  7406                                  
  7407 000038DE E9F800                   jmp .stmt396
  7408                                  .stmt393:
  7409 000038E1 680702                   push 519
  7410 000038E4 E8A90B                   call istoken
  7411 000038E7 83C402                   add  sp, 2
  7412 000038EA 08C0                     or  al, al
  7413 000038EC 0F844B00                 je .stmt397
  7414 000038F0 A1[1C00]                 mov ax, [token]
  7415 000038F3 83F87B                   cmp ax, 123
  7416 000038F6 0F853500                 jne .stmt398
  7417 000038FA 68[E739]                 push stmt_2
  7418 000038FD E8C50C                   call prs
  7419 00003900 83C402                   add  sp, 2
  7420 00003903 E86C0B                   call next
  7421 00003906 8846FC                   mov [bp-4], al
  7422                                  
  7423                                  ;-701         while(cha!= '}') { prc(cha); cha=next(); }
  7424                                  
  7425                                  .stmt399:
  7426 00003909 8A46FC                   mov al, [bp-4]
  7427 0000390C 3C7D                     cmp al, 125
  7428 0000390E 0F841400                 je  .stmt400
  7429 00003912 8A46FC                   mov al, byte [bp-4]
  7430 00003915 B400                     mov ah, 0
  7431 00003917 50                       push ax
  7432 00003918 E8430C                   call prc
  7433 0000391B 83C402                   add  sp, 2
  7434 0000391E E8510B                   call next
  7435 00003921 8846FC                   mov [bp-4], al
  7436                                  
  7437                                  ;-702         token=getlex(); }
  7438                                  
  7439 00003924 EBE3                     jmp .stmt399
  7440                                  .stmt400:
  7441 00003926 E84304                   call getlex
  7442 00003929 A3[1C00]                 mov word [token], ax
  7443                                  
  7444                                  ;-703         else error1("Curly open expected"); 
  7445                                  
  7446 0000392C E90900                   jmp .stmt401
  7447                                  .stmt398:
  7448 0000392F 68[EA39]                 push stmt_3
  7449 00003932 E8790F                   call error1
  7450 00003935 83C402                   add  sp, 2
  7451                                  
  7452                                  ;-704         }
  7453                                  
  7454                                  .stmt401:
  7455                                  
  7456                                  ;-705   else if(istoken(T_EMIT))   doemit();
  7457                                  
  7458 00003938 E99E00                   jmp .stmt402
  7459                                  .stmt397:
  7460 0000393B 680802                   push 520
  7461 0000393E E84F0B                   call istoken
  7462 00003941 83C402                   add  sp, 2
  7463 00003944 08C0                     or  al, al
  7464 00003946 0F840600                 je .stmt403
  7465 0000394A E8C200                   call doemit
  7466                                  
  7467                                  ;-706   else if(istoken(';'))      { }
  7468                                  
  7469 0000394D E98900                   jmp .stmt404
  7470                                  .stmt403:
  7471 00003950 6A3B                     push 59
  7472 00003952 E83B0B                   call istoken
  7473 00003955 83C402                   add  sp, 2
  7474 00003958 08C0                     or  al, al
  7475 0000395A 0F840300                 je .stmt405
  7476                                  
  7477                                  ;-707   else if(istoken(T_RETURN)) {
  7478                                  
  7479 0000395E E97800                   jmp .stmt406
  7480                                  .stmt405:
  7481 00003961 680002                   push 512
  7482 00003964 E8290B                   call istoken
  7483 00003967 83C402                   add  sp, 2
  7484 0000396A 08C0                     or  al, al
  7485 0000396C 0F842500                 je .stmt407
  7486                                  
  7487                                  ;-708         if (token!=';') exprstart();
  7488                                  
  7489 00003970 A1[1C00]                 mov ax, [token]
  7490 00003973 83F83B                   cmp ax, 59
  7491 00003976 0F840300                 je  .stmt408
  7492 0000397A E810D9                   call exprstart
  7493                                  
  7494                                  ;-709         prs("\n jmp .retn"); 
  7495                                  
  7496                                  .stmt408:
  7497 0000397D 68[FE39]                 push stmt_4
  7498 00003980 E8420C                   call prs
  7499 00003983 83C402                   add  sp, 2
  7500                                  
  7501                                  ;-710         nreturn++; 
  7502                                  
  7503 00003986 FF06[2600]               inc  word[nreturn]
  7504                                  
  7505                                  ;-711         expect(';');
  7506                                  
  7507 0000398A 6A3B                     push 59
  7508 0000398C E8230B                   call expect
  7509 0000398F 83C402                   add  sp, 2
  7510                                  
  7511                                  ;-712         }
  7512                                  
  7513                                  
  7514                                  ;-713   else if(thechar==':')      {
  7515                                  
  7516 00003992 E94400                   jmp .stmt409
  7517                                  .stmt407:
  7518 00003995 A0[2100]                 mov al, [thechar]
  7519 00003998 3C3A                     cmp al, 58
  7520 0000399A 0F853000                 jne .stmt410
  7521                                  
  7522                                  ;-714         prs("\n."); // Label
  7523                                  
  7524 0000399E 68[0B3A]                 push stmt_5
  7525 000039A1 E8210C                   call prs
  7526 000039A4 83C402                   add  sp, 2
  7527                                  
  7528                                  ;-715         prs(symbol); prc(':');  
  7529                                  
  7530 000039A7 8D062B81                 lea  ax, [symbol]
  7531 000039AB 50                       push ax
  7532 000039AC E8160C                   call prs
  7533 000039AF 83C402                   add  sp, 2
  7534 000039B2 6A3A                     push 58
  7535 000039B4 E8A70B                   call prc
  7536 000039B7 83C402                   add  sp, 2
  7537                                  
  7538                                  ;-716         expect(T_NAME); 
  7539                                  
  7540 000039BA 680001                   push 256
  7541 000039BD E8F20A                   call expect
  7542 000039C0 83C402                   add  sp, 2
  7543                                  
  7544                                  ;-717         expect(':'); 
  7545                                  
  7546 000039C3 6A3A                     push 58
  7547 000039C5 E8EA0A                   call expect
  7548 000039C8 83C402                   add  sp, 2
  7549                                  
  7550                                  ;-718         }
  7551                                  
  7552                                  
  7553                                  ;-719   else  {exprstart(); expect(';'); } 
  7554                                  
  7555 000039CB E90B00                   jmp .stmt411
  7556                                  .stmt410:
  7557 000039CE E8BCD8                   call exprstart
  7558 000039D1 6A3B                     push 59
  7559 000039D3 E8DC0A                   call expect
  7560 000039D6 83C402                   add  sp, 2
  7561                                  
  7562                                  ;-720 }
  7563                                  
  7564                                  .stmt411:
  7565                                  .stmt409:
  7566                                  .stmt406:
  7567                                  .stmt404:
  7568                                  .stmt402:
  7569                                  .stmt396:
  7570                                  .stmt392:
  7571                                  .stmt390:
  7572                                  .stmt388:
  7573                                  .stmt386:
  7574                                  .stmt384:
  7575                                  
  7576                                  ;-721 
  7577                                  
  7578                                  
  7579                                  ;-722 int doemit() {prs("\n db ");
  7580 000039D9 C9                       LEAVE
  7581 000039DA C3                       ret
  7582                                  ; ENDP
  7583 000039DB 5C6E206A6D70202E00      stmt_0 db "\n jmp .",0
  7584 000039E4 5C6E00                  stmt_1 db "\n",0
  7585 000039E7 5C6E00                  stmt_2 db "\n",0
  7586 000039EA 4375726C79206F7065-     stmt_3 db "Curly open expected",0
  7587 000039F3 6E2065787065637465-
  7588 000039FC 6400               
  7589 000039FE 5C6E206A6D70202E72-     stmt_4 db "\n jmp .retn",0
  7590 00003A07 65746E00           
  7591 00003A0B 5C6E2E00                stmt_5 db "\n.",0
  7592                                  
  7593                                  doemit:  ; *** PROC ***
  7594 00003A0F 68[4B3A]                 push doemit_0
  7595 00003A12 E8B00B                   call prs
  7596 00003A15 83C402                   add  sp, 2
  7597                                  
  7598                                  ;-723   L1: token=getlex(); prunsign1(lexval); token=getlex();
  7599                                  
  7600                                  .L1:
  7601 00003A18 E85103                   call getlex
  7602 00003A1B A3[1C00]                 mov word [token], ax
  7603 00003A1E FF36[2E00]               push word [lexval]
  7604 00003A22 E8FA0C                   call prunsign1
  7605 00003A25 83C402                   add  sp, 2
  7606 00003A28 E84103                   call getlex
  7607 00003A2B A3[1C00]                 mov word [token], ax
  7608                                  
  7609                                  ;-724     if (token== ',') {prc(','); goto L1;} expect(')'); }
  7610                                  
  7611 00003A2E A1[1C00]                 mov ax, [token]
  7612 00003A31 83F82C                   cmp ax, 44
  7613 00003A34 0F850A00                 jne .doemit412
  7614 00003A38 6A2C                     push 44
  7615 00003A3A E8210B                   call prc
  7616 00003A3D 83C402                   add  sp, 2
  7617 00003A40 EBD6                     jmp .L1
  7618                                  .doemit412:
  7619 00003A42 6A29                     push 41
  7620 00003A44 E86B0A                   call expect
  7621 00003A47 83C402                   add  sp, 2
  7622                                  
  7623                                  ;-725 
  7624                                  
  7625                                  
  7626                                  ;-726 int cmpneg(int ids) {
  7627                                  
  7628 00003A4A C3                       ret
  7629                                  ; ENDP
  7630 00003A4B 5C6E2064622000          doemit_0 db "\n db ",0
  7631                                  
  7632                                  cmpneg:  ; *** PROC ***
  7633                                  
  7634                                  ;-727        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
  7635                                  
  7636                                  ;Function : cmpneg, Number of local variables: 1
  7637                                  ;   # type sign width addr used name   list of local variables
  7638                                  ;  200 var sign word   726 NULL ids = bp+4;
  7639 00003A52 C8000000                 ENTER  0,0
  7640 00003A56 A1[2200]                 mov ax, [iscmp]
  7641 00003A59 3D2603                   cmp ax, 806
  7642 00003A5C 0F850C00                 jne .cmpneg413
  7643 00003A60 68[333B]                 push cmpneg_0
  7644 00003A63 E85F0B                   call prs
  7645 00003A66 83C402                   add  sp, 2
  7646                                  
  7647                                  ;-728   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1
  7648                                  
  7649 00003A69 E9C500                   jmp .cmpneg414
  7650                                  .cmpneg413:
  7651 00003A6C A1[2200]                 mov ax, [iscmp]
  7652 00003A6F 3D2703                   cmp ax, 807
  7653 00003A72 0F850C00                 jne .cmpneg415
  7654 00003A76 68[3C3B]                 push cmpneg_1
  7655 00003A79 E8490B                   call prs
  7656 00003A7C 83C402                   add  sp, 2
  7657                                  
  7658                                  ;-729   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF
  7659                                  
  7660 00003A7F E9AF00                   jmp .cmpneg416
  7661                                  .cmpneg415:
  7662 00003A82 A1[2200]                 mov ax, [iscmp]
  7663 00003A85 3D3803                   cmp ax, 824
  7664 00003A88 0F852100                 jne .cmpneg417
  7665 00003A8C 8B4604                   mov ax, [bp+4]
  7666 00003A8F 08C0                     or  al, al
  7667 00003A91 0F840C00                 je .cmpneg418
  7668 00003A95 68[453B]                 push cmpneg_2
  7669 00003A98 E82A0B                   call prs
  7670 00003A9B 83C402                   add  sp, 2
  7671                                  
  7672                                  ;-730                            else prs("\n ja  .");//ZF=0 CF=0
  7673                                  
  7674 00003A9E E90900                   jmp .cmpneg419
  7675                                  .cmpneg418:
  7676 00003AA1 68[4E3B]                 push cmpneg_3
  7677 00003AA4 E81E0B                   call prs
  7678 00003AA7 83C402                   add  sp, 2
  7679                                  
  7680                                  ;-731   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);
  7681                                  
  7682                                  .cmpneg419:
  7683 00003AAA E98400                   jmp .cmpneg420
  7684                                  .cmpneg417:
  7685 00003AAD A1[2200]                 mov ax, [iscmp]
  7686 00003AB0 3D2B03                   cmp ax, 811
  7687 00003AB3 0F854500                 jne .cmpneg421
  7688 00003AB7 8B4604                   mov ax, [bp+4]
  7689 00003ABA 08C0                     or  al, al
  7690 00003ABC 0F841E00                 je .cmpneg422
  7691 00003AC0 68[573B]                 push cmpneg_4
  7692 00003AC3 E8FF0A                   call prs
  7693 00003AC6 83C402                   add  sp, 2
  7694 00003AC9 FF7604                   push word [bp+4]
  7695 00003ACC E8500C                   call prunsign1
  7696 00003ACF 83C402                   add  sp, 2
  7697                                  
  7698                                  ;-732                                prs("\n jl  .");}//          SF!=OF
  7699                                  
  7700 00003AD2 68[653B]                 push cmpneg_5
  7701 00003AD5 E8ED0A                   call prs
  7702 00003AD8 83C402                   add  sp, 2
  7703                                  
  7704                                  ;-733                            else{prs(" ;unsigned : "); prunsign1(ids);
  7705                                  
  7706 00003ADB E91B00                   jmp .cmpneg423
  7707                                  .cmpneg422:
  7708 00003ADE 68[6E3B]                 push cmpneg_6
  7709 00003AE1 E8E10A                   call prs
  7710 00003AE4 83C402                   add  sp, 2
  7711 00003AE7 FF7604                   push word [bp+4]
  7712 00003AEA E8320C                   call prunsign1
  7713 00003AED 83C402                   add  sp, 2
  7714                                  
  7715                                  ;-734                                prs("\n jb  .");}//jb=jc=CF=1
  7716                                  
  7717 00003AF0 68[7C3B]                 push cmpneg_7
  7718 00003AF3 E8CF0A                   call prs
  7719 00003AF6 83C402                   add  sp, 2
  7720                                  
  7721                                  ;-735   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF
  7722                                  
  7723                                  .cmpneg423:
  7724 00003AF9 E93500                   jmp .cmpneg424
  7725                                  .cmpneg421:
  7726 00003AFC A1[2200]                 mov ax, [iscmp]
  7727 00003AFF 83F83C                   cmp ax, 60
  7728 00003B02 0F850C00                 jne .cmpneg425
  7729 00003B06 68[853B]                 push cmpneg_8
  7730 00003B09 E8B90A                   call prs
  7731 00003B0C 83C402                   add  sp, 2
  7732                                  
  7733                                  ;-736   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF
  7734                                  
  7735 00003B0F E91F00                   jmp .cmpneg426
  7736                                  .cmpneg425:
  7737 00003B12 A1[2200]                 mov ax, [iscmp]
  7738 00003B15 83F83E                   cmp ax, 62
  7739 00003B18 0F850C00                 jne .cmpneg427
  7740 00003B1C 68[8E3B]                 push cmpneg_9
  7741 00003B1F E8A30A                   call prs
  7742 00003B22 83C402                   add  sp, 2
  7743                                  
  7744                                  ;-737   else error1("Vergleich unbekannt in CMPNEG()");  }
  7745                                  
  7746 00003B25 E90900                   jmp .cmpneg428
  7747                                  .cmpneg427:
  7748 00003B28 68[973B]                 push cmpneg_10
  7749 00003B2B E8800D                   call error1
  7750 00003B2E 83C402                   add  sp, 2
  7751                                  .cmpneg428:
  7752                                  .cmpneg426:
  7753                                  .cmpneg424:
  7754                                  .cmpneg420:
  7755                                  .cmpneg416:
  7756                                  .cmpneg414:
  7757                                  
  7758                                  ;-738 
  7759                                  
  7760                                  
  7761                                  ;-739 int prlabel(int n) {prs("\n."); prs(fname); pint1(n); prc(':'); }
  7762 00003B31 C9                       LEAVE
  7763 00003B32 C3                       ret
  7764                                  ; ENDP
  7765 00003B33 5C6E206A6E65202E00      cmpneg_0 db "\n jne .",0
  7766 00003B3C 5C6E206A6520202E00      cmpneg_1 db "\n je  .",0
  7767 00003B45 5C6E206A6720202E00      cmpneg_2 db "\n jg  .",0
  7768 00003B4E 5C6E206A6120202E00      cmpneg_3 db "\n ja  .",0
  7769 00003B57 203B756E7369676E65-     cmpneg_4 db " ;unsigned : ",0
  7770 00003B60 64203A2000         
  7771 00003B65 5C6E206A6C20202E00      cmpneg_5 db "\n jl  .",0
  7772 00003B6E 203B756E7369676E65-     cmpneg_6 db " ;unsigned : ",0
  7773 00003B77 64203A2000         
  7774 00003B7C 5C6E206A6220202E00      cmpneg_7 db "\n jb  .",0
  7775 00003B85 5C6E206A6765202E00      cmpneg_8 db "\n jge .",0
  7776 00003B8E 5C6E206A6C65202E00      cmpneg_9 db "\n jle .",0
  7777 00003B97 566572676C65696368-     cmpneg_10 db "Vergleich unbekannt in CMPNEG()",0
  7778 00003BA0 20756E62656B616E6E-
  7779 00003BA9 7420696E20434D504E-
  7780 00003BB2 4547282900         
  7781                                  
  7782                                  prlabel:  ; *** PROC ***
  7783                                  ;Function : prlabel, Number of local variables: 1
  7784                                  ;   # type sign width addr used name   list of local variables
  7785                                  ;  200 var sign word   739 NULL n = bp+4;
  7786 00003BB7 C8000000                 ENTER  0,0
  7787 00003BBB 68[E23B]                 push prlabel_0
  7788 00003BBE E8040A                   call prs
  7789 00003BC1 83C402                   add  sp, 2
  7790 00003BC4 8D06AB81                 lea  ax, [fname]
  7791 00003BC8 50                       push ax
  7792 00003BC9 E8F909                   call prs
  7793 00003BCC 83C402                   add  sp, 2
  7794 00003BCF FF7604                   push word [bp+4]
  7795 00003BD2 E8E70A                   call pint1
  7796 00003BD5 83C402                   add  sp, 2
  7797 00003BD8 6A3A                     push 58
  7798 00003BDA E88109                   call prc
  7799 00003BDD 83C402                   add  sp, 2
  7800                                  
  7801                                  ;-740 int prjump (int n) {prs("\n jmp ."); prs(fname); pint1(n); }
  7802 00003BE0 C9                       LEAVE
  7803 00003BE1 C3                       ret
  7804                                  ; ENDP
  7805 00003BE2 5C6E2E00                prlabel_0 db "\n.",0
  7806                                  
  7807                                  prjump:  ; *** PROC ***
  7808                                  ;Function : prjump, Number of local variables: 1
  7809                                  ;   # type sign width addr used name   list of local variables
  7810                                  ;  200 var sign word   740 NULL n = bp+4;
  7811 00003BE6 C8000000                 ENTER  0,0
  7812 00003BEA 68[093C]                 push prjump_0
  7813 00003BED E8D509                   call prs
  7814 00003BF0 83C402                   add  sp, 2
  7815 00003BF3 8D06AB81                 lea  ax, [fname]
  7816 00003BF7 50                       push ax
  7817 00003BF8 E8CA09                   call prs
  7818 00003BFB 83C402                   add  sp, 2
  7819 00003BFE FF7604                   push word [bp+4]
  7820 00003C01 E8B80A                   call pint1
  7821 00003C04 83C402                   add  sp, 2
  7822                                  
  7823                                  ;-741 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
  7824 00003C07 C9                       LEAVE
  7825 00003C08 C3                       ret
  7826                                  ; ENDP
  7827 00003C09 5C6E206A6D70202E00      prjump_0 db "\n jmp .",0
  7828                                  
  7829                                  doif:  ; *** PROC ***
  7830                                  ;Function : doif, Number of local variables: 2
  7831                                  ;   # type sign width addr used name   list of local variables
  7832                                  ;  200 var sign word   741 NULL jdest = bp-2
  7833                                  ;  201 var sign word   741 NULL tst = bp-4;
  7834 00003C12 C8040000                 ENTER  4,0
  7835 00003C16 E8E8D4                   call pexpr
  7836 00003C19 FF06[2800]               inc  word[nlabel]
  7837 00003C1D A1[2800]                 mov ax, [nlabel]
  7838 00003C20 8946FE                   mov [bp-2], ax
  7839                                  
  7840                                  ;-742   pint1(jdest); stmt();
  7841                                  
  7842 00003C23 FF76FE                   push word [bp-2]
  7843 00003C26 E8930A                   call pint1
  7844 00003C29 83C402                   add  sp, 2
  7845 00003C2C E8DCFB                   call stmt
  7846                                  
  7847                                  ;-743   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;
  7848                                  
  7849 00003C2F 680202                   push 514
  7850 00003C32 E85B08                   call istoken
  7851 00003C35 83C402                   add  sp, 2
  7852 00003C38 08C0                     or  al, al
  7853 00003C3A 0F842B00                 je .doif429
  7854 00003C3E FF06[2800]               inc  word[nlabel]
  7855 00003C42 A1[2800]                 mov ax, [nlabel]
  7856 00003C45 8946FC                   mov [bp-4], ax
  7857                                  
  7858                                  ;-744     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }
  7859                                  
  7860 00003C48 FF76FC                   push word [bp-4]
  7861 00003C4B E898FF                   call prjump
  7862 00003C4E 83C402                   add  sp, 2
  7863 00003C51 FF76FE                   push word [bp-2]
  7864 00003C54 E860FF                   call prlabel
  7865 00003C57 83C402                   add  sp, 2
  7866 00003C5A E8AEFB                   call stmt
  7867 00003C5D FF76FC                   push word [bp-4]
  7868 00003C60 E854FF                   call prlabel
  7869 00003C63 83C402                   add  sp, 2
  7870                                  
  7871                                  ;-745   else prlabel(jdest); }
  7872                                  
  7873 00003C66 E90900                   jmp .doif430
  7874                                  .doif429:
  7875 00003C69 FF76FE                   push word [bp-2]
  7876 00003C6C E848FF                   call prlabel
  7877 00003C6F 83C402                   add  sp, 2
  7878                                  .doif430:
  7879                                  
  7880                                  ;-746 
  7881                                  
  7882                                  
  7883                                  ;-747 int dodo() {int jdest; int jtemp;
  7884 00003C72 C9                       LEAVE
  7885 00003C73 C3                       ret
  7886                                  ; ENDP
  7887                                  
  7888                                  dodo:  ; *** PROC ***
  7889                                  
  7890                                  ;-748   nlabel++; jdest=nlabel; prlabel(jdest); stmt();
  7891                                  
  7892                                  ;Function : dodo, Number of local variables: 2
  7893                                  ;   # type sign width addr used name   list of local variables
  7894                                  ;  200 var sign word   747 NULL jdest = bp-2
  7895                                  ;  201 var sign word   747 NULL jtemp = bp-4;
  7896 00003C74 C8040000                 ENTER  4,0
  7897 00003C78 FF06[2800]               inc  word[nlabel]
  7898 00003C7C A1[2800]                 mov ax, [nlabel]
  7899 00003C7F 8946FE                   mov [bp-2], ax
  7900 00003C82 FF76FE                   push word [bp-2]
  7901 00003C85 E82FFF                   call prlabel
  7902 00003C88 83C402                   add  sp, 2
  7903 00003C8B E87DFB                   call stmt
  7904                                  
  7905                                  ;-749   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);
  7906                                  
  7907 00003C8E 680302                   push 515
  7908 00003C91 E81E08                   call expect
  7909 00003C94 83C402                   add  sp, 2
  7910 00003C97 E867D4                   call pexpr
  7911 00003C9A FF06[2800]               inc  word[nlabel]
  7912 00003C9E A1[2800]                 mov ax, [nlabel]
  7913 00003CA1 8946FC                   mov [bp-4], ax
  7914 00003CA4 FF76FC                   push word [bp-4]
  7915 00003CA7 E8120A                   call pint1
  7916 00003CAA 83C402                   add  sp, 2
  7917                                  
  7918                                  ;-750   prjump(jdest); prlabel(jtemp); }
  7919                                  
  7920 00003CAD FF76FE                   push word [bp-2]
  7921 00003CB0 E833FF                   call prjump
  7922 00003CB3 83C402                   add  sp, 2
  7923 00003CB6 FF76FC                   push word [bp-4]
  7924 00003CB9 E8FBFE                   call prlabel
  7925 00003CBC 83C402                   add  sp, 2
  7926                                  
  7927                                  ;-751 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
  7928 00003CBF C9                       LEAVE
  7929 00003CC0 C3                       ret
  7930                                  ; ENDP
  7931                                  
  7932                                  dowhile:  ; *** PROC ***
  7933                                  ;Function : dowhile, Number of local variables: 2
  7934                                  ;   # type sign width addr used name   list of local variables
  7935                                  ;  200 var sign word   751 NULL jdest = bp-2
  7936                                  ;  201 var sign word   751 NULL tst = bp-4;
  7937 00003CC1 C8040000                 ENTER  4,0
  7938 00003CC5 FF06[2800]               inc  word[nlabel]
  7939 00003CC9 A1[2800]                 mov ax, [nlabel]
  7940 00003CCC 8946FE                   mov [bp-2], ax
  7941                                  
  7942                                  ;-752   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);
  7943                                  
  7944 00003CCF FF76FE                   push word [bp-2]
  7945 00003CD2 E8E2FE                   call prlabel
  7946 00003CD5 83C402                   add  sp, 2
  7947 00003CD8 E826D4                   call pexpr
  7948 00003CDB FF06[2800]               inc  word[nlabel]
  7949 00003CDF A1[2800]                 mov ax, [nlabel]
  7950 00003CE2 8946FC                   mov [bp-4], ax
  7951 00003CE5 FF76FC                   push word [bp-4]
  7952 00003CE8 E8D109                   call pint1
  7953 00003CEB 83C402                   add  sp, 2
  7954                                  
  7955                                  ;-753   stmt(); prjump(jdest); prlabel(tst); }
  7956                                  
  7957 00003CEE E81AFB                   call stmt
  7958 00003CF1 FF76FE                   push word [bp-2]
  7959 00003CF4 E8EFFE                   call prjump
  7960 00003CF7 83C402                   add  sp, 2
  7961 00003CFA FF76FC                   push word [bp-4]
  7962 00003CFD E8B7FE                   call prlabel
  7963 00003D00 83C402                   add  sp, 2
  7964                                  
  7965                                  ;-754 int isrelational() {
  7966 00003D03 C9                       LEAVE
  7967 00003D04 C3                       ret
  7968                                  ; ENDP
  7969                                  
  7970                                  isrelational:  ; *** PROC ***
  7971                                  
  7972                                  ;-755   if (token==T_EQ) goto w; if (token==T_NE) goto w;
  7973                                  
  7974 00003D05 A1[1C00]                 mov ax, [token]
  7975 00003D08 3D2603                   cmp ax, 806
  7976 00003D0B 0F850300                 jne .isrelational431
  7977 00003D0F E94700                   jmp .w
  7978                                  .isrelational431:
  7979 00003D12 A1[1C00]                 mov ax, [token]
  7980 00003D15 3D2703                   cmp ax, 807
  7981 00003D18 0F850300                 jne .isrelational432
  7982 00003D1C E93A00                   jmp .w
  7983                                  
  7984                                  ;-756   if (token==T_LE) goto w; if (token==T_GE) goto w;
  7985                                  
  7986                                  .isrelational432:
  7987 00003D1F A1[1C00]                 mov ax, [token]
  7988 00003D22 3D3803                   cmp ax, 824
  7989 00003D25 0F850300                 jne .isrelational433
  7990 00003D29 E92D00                   jmp .w
  7991                                  .isrelational433:
  7992 00003D2C A1[1C00]                 mov ax, [token]
  7993 00003D2F 3D2B03                   cmp ax, 811
  7994 00003D32 0F850300                 jne .isrelational434
  7995 00003D36 E92000                   jmp .w
  7996                                  
  7997                                  ;-757   if (token=='<' ) goto w; if (token=='>' ) goto w;
  7998                                  
  7999                                  .isrelational434:
  8000 00003D39 A1[1C00]                 mov ax, [token]
  8001 00003D3C 83F83C                   cmp ax, 60
  8002 00003D3F 0F850300                 jne .isrelational435
  8003 00003D43 E91300                   jmp .w
  8004                                  .isrelational435:
  8005 00003D46 A1[1C00]                 mov ax, [token]
  8006 00003D49 83F83E                   cmp ax, 62
  8007 00003D4C 0F850300                 jne .isrelational436
  8008 00003D50 E90600                   jmp .w
  8009                                  
  8010                                  ;-758   return 0;  w: iscmp=token; token=getlex(); return 1;}
  8011                                  
  8012                                  .isrelational436:
  8013 00003D53 B80000                   mov ax, 0
  8014 00003D56 E91200                   jmp .retn
  8015                                  .w:
  8016 00003D59 A1[1C00]                 mov ax, [token]
  8017 00003D5C A3[2200]                 mov word [iscmp], ax
  8018 00003D5F E80A00                   call getlex
  8019 00003D62 A3[1C00]                 mov word [token], ax
  8020 00003D65 B80100                   mov ax, 1
  8021 00003D68 E90000                   jmp .retn
  8022                                  
  8023                                  ;-759  
  8024                                  
  8025                                  
  8026                                  ;-760 char symboltemp[80];    
  8027                                  
  8028                                   .retn:
  8029 00003D6B C3                       ret
  8030                                  ; ENDP
  8031                                  section .bss
  8032                                  absolute 53468
  8033 0000D0DC <res 00000050>          symboltemp resb 80
  8034                                  section .text
  8035                                  
  8036                                  ;-761 int getlex() { char c; char *p; 
  8037                                  
  8038                                  
  8039                                  getlex:  ; *** PROC ***
  8040                                  
  8041                                  ;-762 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;
  8042                                  
  8043                                  ;Function : getlex, Number of local variables: 2
  8044                                  ;   # type sign width addr used name   list of local variables
  8045                                  ;  200 var sign byte   761 NULL c = bp-2
  8046                                  ;  201 ptr sign byte   761 NULL p = bp-4;
  8047 00003D6C C8040000                 ENTER  4,0
  8048                                  .g1:
  8049 00003D70 E8FF06                   call next
  8050 00003D73 8846FE                   mov [bp-2], al
  8051 00003D76 8A46FE                   mov al, [bp-2]
  8052 00003D79 3C00                     cmp al, 0
  8053 00003D7B 0F850600                 jne .getlex437
  8054 00003D7F B80000                   mov ax, 0
  8055 00003D82 E9EB04                   jmp .retn
  8056                                  .getlex437:
  8057 00003D85 8A46FE                   mov al, [bp-2]
  8058 00003D88 3C20                     cmp al, 32
  8059 00003D8A 0F8F0200                 jg  .getlex438
  8060 00003D8E EBE0                     jmp .g1
  8061                                  
  8062                                  ;-763   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}
  8063                                  
  8064                                  .getlex438:
  8065 00003D90 8A46FE                   mov al, [bp-2]
  8066 00003D93 3C3D                     cmp al, 61
  8067 00003D95 0F851200                 jne .getlex439
  8068 00003D99 A0[2100]                 mov al, [thechar]
  8069 00003D9C 3C3D                     cmp al, 61
  8070 00003D9E 0F850900                 jne .getlex440
  8071 00003DA2 E8CD06                   call next
  8072 00003DA5 B82603                   mov ax, 806
  8073 00003DA8 E9C504                   jmp .retn
  8074                                  .getlex440:
  8075                                  
  8076                                  ;-764   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}
  8077                                  
  8078                                  .getlex439:
  8079 00003DAB 8A46FE                   mov al, [bp-2]
  8080 00003DAE 3C21                     cmp al, 33
  8081 00003DB0 0F851200                 jne .getlex441
  8082 00003DB4 A0[2100]                 mov al, [thechar]
  8083 00003DB7 3C3D                     cmp al, 61
  8084 00003DB9 0F850900                 jne .getlex442
  8085 00003DBD E8B206                   call next
  8086 00003DC0 B82703                   mov ax, 807
  8087 00003DC3 E9AA04                   jmp .retn
  8088                                  .getlex442:
  8089                                  
  8090                                  ;-765   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}
  8091                                  
  8092                                  .getlex441:
  8093 00003DC6 8A46FE                   mov al, [bp-2]
  8094 00003DC9 3C3C                     cmp al, 60
  8095 00003DCB 0F851200                 jne .getlex443
  8096 00003DCF A0[2100]                 mov al, [thechar]
  8097 00003DD2 3C3D                     cmp al, 61
  8098 00003DD4 0F850900                 jne .getlex444
  8099 00003DD8 E89706                   call next
  8100 00003DDB B83803                   mov ax, 824
  8101 00003DDE E98F04                   jmp .retn
  8102                                  .getlex444:
  8103                                  
  8104                                  ;-766   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}
  8105                                  
  8106                                  .getlex443:
  8107 00003DE1 8A46FE                   mov al, [bp-2]
  8108 00003DE4 3C3E                     cmp al, 62
  8109 00003DE6 0F851200                 jne .getlex445
  8110 00003DEA A0[2100]                 mov al, [thechar]
  8111 00003DED 3C3D                     cmp al, 61
  8112 00003DEF 0F850900                 jne .getlex446
  8113 00003DF3 E87C06                   call next
  8114 00003DF6 B82B03                   mov ax, 811
  8115 00003DF9 E97404                   jmp .retn
  8116                                  .getlex446:
  8117                                  
  8118                                  ;-767   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}
  8119                                  
  8120                                  .getlex445:
  8121 00003DFC 8A46FE                   mov al, [bp-2]
  8122 00003DFF 3C3C                     cmp al, 60
  8123 00003E01 0F851200                 jne .getlex447
  8124 00003E05 A0[2100]                 mov al, [thechar]
  8125 00003E08 3C3C                     cmp al, 60
  8126 00003E0A 0F850900                 jne .getlex448
  8127 00003E0E E86106                   call next
  8128 00003E11 B8D804                   mov ax, 1240
  8129 00003E14 E95904                   jmp .retn
  8130                                  .getlex448:
  8131                                  
  8132                                  ;-768   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}
  8133                                  
  8134                                  .getlex447:
  8135 00003E17 8A46FE                   mov al, [bp-2]
  8136 00003E1A 3C3E                     cmp al, 62
  8137 00003E1C 0F851200                 jne .getlex449
  8138 00003E20 A0[2100]                 mov al, [thechar]
  8139 00003E23 3C3E                     cmp al, 62
  8140 00003E25 0F850900                 jne .getlex450
  8141 00003E29 E84606                   call next
  8142 00003E2C B8D904                   mov ax, 1241
  8143 00003E2F E93E04                   jmp .retn
  8144                                  .getlex450:
  8145                                  
  8146                                  ;-769   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}
  8147                                  
  8148                                  .getlex449:
  8149 00003E32 8A46FE                   mov al, [bp-2]
  8150 00003E35 3C2B                     cmp al, 43
  8151 00003E37 0F851200                 jne .getlex451
  8152 00003E3B A0[2100]                 mov al, [thechar]
  8153 00003E3E 3C2B                     cmp al, 43
  8154 00003E40 0F850900                 jne .getlex452
  8155 00003E44 E82B06                   call next
  8156 00003E47 B8C304                   mov ax, 1219
  8157 00003E4A E92304                   jmp .retn
  8158                                  .getlex452:
  8159                                  
  8160                                  ;-770   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}
  8161                                  
  8162                                  .getlex451:
  8163 00003E4D 8A46FE                   mov al, [bp-2]
  8164 00003E50 3C2D                     cmp al, 45
  8165 00003E52 0F851200                 jne .getlex453
  8166 00003E56 A0[2100]                 mov al, [thechar]
  8167 00003E59 3C2D                     cmp al, 45
  8168 00003E5B 0F850900                 jne .getlex454
  8169 00003E5F E81006                   call next
  8170 00003E62 B8C904                   mov ax, 1225
  8171 00003E65 E90804                   jmp .retn
  8172                                  .getlex454:
  8173                                  
  8174                                  ;-771   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}
  8175                                  
  8176                                  .getlex453:
  8177 00003E68 8A46FE                   mov al, [bp-2]
  8178 00003E6B 3C2B                     cmp al, 43
  8179 00003E6D 0F851200                 jne .getlex455
  8180 00003E71 A0[2100]                 mov al, [thechar]
  8181 00003E74 3C3D                     cmp al, 61
  8182 00003E76 0F850900                 jne .getlex456
  8183 00003E7A E8F505                   call next
  8184 00003E7D B8CE04                   mov ax, 1230
  8185 00003E80 E9ED03                   jmp .retn
  8186                                  .getlex456:
  8187                                  
  8188                                  ;-772   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}
  8189                                  
  8190                                  .getlex455:
  8191 00003E83 8A46FE                   mov al, [bp-2]
  8192 00003E86 3C2D                     cmp al, 45
  8193 00003E88 0F851200                 jne .getlex457
  8194 00003E8C A0[2100]                 mov al, [thechar]
  8195 00003E8F 3C3D                     cmp al, 61
  8196 00003E91 0F850900                 jne .getlex458
  8197 00003E95 E8DA05                   call next
  8198 00003E98 B8CF04                   mov ax, 1231
  8199 00003E9B E9D203                   jmp .retn
  8200                                  .getlex458:
  8201                                  
  8202                                  ;-773   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}
  8203                                  
  8204                                  .getlex457:
  8205 00003E9E 8A46FE                   mov al, [bp-2]
  8206 00003EA1 3C26                     cmp al, 38
  8207 00003EA3 0F851200                 jne .getlex459
  8208 00003EA7 A0[2100]                 mov al, [thechar]
  8209 00003EAA 3C3D                     cmp al, 61
  8210 00003EAC 0F850900                 jne .getlex460
  8211 00003EB0 E8BF05                   call next
  8212 00003EB3 B8D204                   mov ax, 1234
  8213 00003EB6 E9B703                   jmp .retn
  8214                                  .getlex460:
  8215                                  
  8216                                  ;-774   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}    
  8217                                  
  8218                                  .getlex459:
  8219 00003EB9 8A46FE                   mov al, [bp-2]
  8220 00003EBC 3C7C                     cmp al, 124
  8221 00003EBE 0F851200                 jne .getlex461
  8222 00003EC2 A0[2100]                 mov al, [thechar]
  8223 00003EC5 3C3D                     cmp al, 61
  8224 00003EC7 0F850900                 jne .getlex462
  8225 00003ECB E8A405                   call next
  8226 00003ECE B8D304                   mov ax, 1235
  8227 00003ED1 E99C03                   jmp .retn
  8228                                  .getlex462:
  8229                                  
  8230                                  ;-775   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}
  8231                                  
  8232                                  .getlex461:
  8233 00003ED4 8A46FE                   mov al, [bp-2]
  8234 00003ED7 3C2A                     cmp al, 42
  8235 00003ED9 0F851200                 jne .getlex463
  8236 00003EDD A0[2100]                 mov al, [thechar]
  8237 00003EE0 3C3D                     cmp al, 61
  8238 00003EE2 0F850900                 jne .getlex464
  8239 00003EE6 E88905                   call next
  8240 00003EE9 B8D004                   mov ax, 1232
  8241 00003EEC E98103                   jmp .retn
  8242                                  .getlex464:
  8243                                  
  8244                                  ;-776   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}        
  8245                                  
  8246                                  .getlex463:
  8247 00003EEF 8A46FE                   mov al, [bp-2]
  8248 00003EF2 3C2F                     cmp al, 47
  8249 00003EF4 0F851200                 jne .getlex465
  8250 00003EF8 A0[2100]                 mov al, [thechar]
  8251 00003EFB 3C3D                     cmp al, 61
  8252 00003EFD 0F850900                 jne .getlex466
  8253 00003F01 E86E05                   call next
  8254 00003F04 B8D104                   mov ax, 1233
  8255 00003F07 E96603                   jmp .retn
  8256                                  .getlex466:
  8257                                  
  8258                                  ;-777   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;
  8259                                  
  8260                                  .getlex465:
  8261 00003F0A 8A46FE                   mov al, byte [bp-2]
  8262 00003F0D B400                     mov ah, 0
  8263 00003F0F 50                       push ax
  8264 00003F10 68[7242]                 push getlex_0
  8265 00003F13 E8E1C2                   call instr1
  8266 00003F16 83C404                   add  sp, 4
  8267 00003F19 08C0                     or  al, al
  8268 00003F1B 0F840600                 je .getlex467
  8269 00003F1F 8A46FE                   mov al, [bp-2]
  8270 00003F22 E94B03                   jmp .retn
  8271                                  
  8272                                  ;-778   if (c == '/') { if (thechar == '/') {
  8273                                  
  8274                                  .getlex467:
  8275 00003F25 8A46FE                   mov al, [bp-2]
  8276 00003F28 3C2F                     cmp al, 47
  8277 00003F2A 0F852000                 jne .getlex468
  8278 00003F2E A0[2100]                 mov al, [thechar]
  8279 00003F31 3C2F                     cmp al, 47
  8280 00003F33 0F851700                 jne .getlex469
  8281                                  
  8282                                  ;-779       do c=next(); while(c != 13); /* c=next(); */ return getlex(); } }
  8283                                  
  8284                                  .getlex470:
  8285 00003F37 E83805                   call next
  8286 00003F3A 8846FE                   mov [bp-2], al
  8287 00003F3D 8A46FE                   mov al, [bp-2]
  8288 00003F40 3C0D                     cmp al, 13
  8289 00003F42 0F840200                 je  .getlex471
  8290 00003F46 EBEF                     jmp .getlex470
  8291                                  .getlex471:
  8292 00003F48 E821FE                   call getlex
  8293 00003F4B E92203                   jmp .retn
  8294                                  .getlex469:
  8295                                  
  8296                                  ;-780   if (c == '/') { if (thechar == '*') {
  8297                                  
  8298                                  .getlex468:
  8299 00003F4E 8A46FE                   mov al, [bp-2]
  8300 00003F51 3C2F                     cmp al, 47
  8301 00003F53 0F853A00                 jne .getlex472
  8302 00003F57 A0[2100]                 mov al, [thechar]
  8303 00003F5A 3C2A                     cmp al, 42
  8304 00003F5C 0F852B00                 jne .getlex473
  8305                                  
  8306                                  ;-781       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;
  8307                                  
  8308                                  .g2:
  8309 00003F60 E80F05                   call next
  8310 00003F63 8846FE                   mov [bp-2], al
  8311 00003F66 8A46FE                   mov al, [bp-2]
  8312 00003F69 3C2A                     cmp al, 42
  8313 00003F6B 0F840200                 je  .getlex474
  8314 00003F6F EBEF                     jmp .g2
  8315                                  .getlex474:
  8316 00003F71 A0[2100]                 mov al, [thechar]
  8317 00003F74 3C2F                     cmp al, 47
  8318 00003F76 0F840200                 je  .getlex475
  8319 00003F7A EBE4                     jmp .g2
  8320                                  
  8321                                  ;-782       c=next(); return getlex(); } else  return '/'; }
  8322                                  
  8323                                  .getlex475:
  8324 00003F7C E8F304                   call next
  8325 00003F7F 8846FE                   mov [bp-2], al
  8326 00003F82 E8E7FD                   call getlex
  8327 00003F85 E9E802                   jmp .retn
  8328 00003F88 E90600                   jmp .getlex476
  8329                                  .getlex473:
  8330 00003F8B B82F00                   mov ax, 47
  8331 00003F8E E9DF02                   jmp .retn
  8332                                  .getlex476:
  8333                                  
  8334                                  ;-783   if (c == '"') {getstring(c); return T_STRING;}
  8335                                  
  8336                                  .getlex472:
  8337 00003F91 8A46FE                   mov al, [bp-2]
  8338 00003F94 3C22                     cmp al, 34
  8339 00003F96 0F851200                 jne .getlex477
  8340 00003F9A 8A46FE                   mov al, byte [bp-2]
  8341 00003F9D B400                     mov ah, 0
  8342 00003F9F 50                       push ax
  8343 00003FA0 E89804                   call getstring
  8344 00003FA3 83C402                   add  sp, 2
  8345 00003FA6 B80201                   mov ax, 258
  8346 00003FA9 E9C402                   jmp .retn
  8347                                  
  8348                                  ;-784   if (digit(c)) { getdigit(c); return T_CONST; }
  8349                                  
  8350                                  .getlex477:
  8351 00003FAC 8A46FE                   mov al, byte [bp-2]
  8352 00003FAF B400                     mov ah, 0
  8353 00003FB1 50                       push ax
  8354 00003FB2 E871C3                   call digit
  8355 00003FB5 83C402                   add  sp, 2
  8356 00003FB8 08C0                     or  al, al
  8357 00003FBA 0F841200                 je .getlex478
  8358 00003FBE 8A46FE                   mov al, byte [bp-2]
  8359 00003FC1 B400                     mov ah, 0
  8360 00003FC3 50                       push ax
  8361 00003FC4 E89E03                   call getdigit
  8362 00003FC7 83C402                   add  sp, 2
  8363 00003FCA B80101                   mov ax, 257
  8364 00003FCD E9A002                   jmp .retn
  8365                                  
  8366                                  ;-785   if (c==39) { lexval=next();
  8367                                  
  8368                                  .getlex478:
  8369 00003FD0 8A46FE                   mov al, [bp-2]
  8370 00003FD3 3C27                     cmp al, 39
  8371 00003FD5 0F854F00                 jne .getlex479
  8372 00003FD9 E89604                   call next
  8373 00003FDC A3[2E00]                 mov word [lexval], ax
  8374                                  
  8375                                  ;-786     if (lexval==92) {lexval=next();
  8376                                  
  8377 00003FDF A1[2E00]                 mov ax, [lexval]
  8378 00003FE2 83F85C                   cmp ax, 92
  8379 00003FE5 0F853600                 jne .getlex480
  8380 00003FE9 E88604                   call next
  8381 00003FEC A3[2E00]                 mov word [lexval], ax
  8382                                  
  8383                                  ;-787       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;
  8384                                  
  8385 00003FEF A1[2E00]                 mov ax, [lexval]
  8386 00003FF2 83F86E                   cmp ax, 110
  8387 00003FF5 0F850600                 jne .getlex481
  8388 00003FF9 B80A00                   mov ax, 10
  8389 00003FFC A3[2E00]                 mov word [lexval], ax
  8390                                  .getlex481:
  8391 00003FFF A1[2E00]                 mov ax, [lexval]
  8392 00004002 83F874                   cmp ax, 116
  8393 00004005 0F850600                 jne .getlex482
  8394 00004009 B80900                   mov ax, 9
  8395 0000400C A3[2E00]                 mov word [lexval], ax
  8396                                  
  8397                                  ;-788       if (lexval=='0') lexval= 0; } next(); return T_CONST; }
  8398                                  
  8399                                  .getlex482:
  8400 0000400F A1[2E00]                 mov ax, [lexval]
  8401 00004012 83F830                   cmp ax, 48
  8402 00004015 0F850600                 jne .getlex483
  8403 00004019 B80000                   mov ax, 0
  8404 0000401C A3[2E00]                 mov word [lexval], ax
  8405                                  .getlex483:
  8406                                  .getlex480:
  8407 0000401F E85004                   call next
  8408 00004022 B80101                   mov ax, 257
  8409 00004025 E94802                   jmp .retn
  8410                                  
  8411                                  ;-789   if (letter(c)) { 
  8412                                  
  8413                                  .getlex479:
  8414 00004028 8A46FE                   mov al, byte [bp-2]
  8415 0000402B B400                     mov ah, 0
  8416 0000402D 50                       push ax
  8417 0000402E E81FC3                   call letter
  8418 00004031 83C402                   add  sp, 2
  8419 00004034 08C0                     or  al, al
  8420 00004036 0F842D02                 je .getlex484
  8421                                  
  8422                                  ;-790     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;
  8423                                  
  8424 0000403A 8D062B81                 lea  ax, [symbol]
  8425 0000403E 50                       push ax
  8426 0000403F 8D06DCD0                 lea  ax, [symboltemp]
  8427 00004043 50                       push ax
  8428 00004044 E834C1                   call strcpy
  8429 00004047 83C404                   add  sp, 4
  8430 0000404A B82B81                   mov ax, symbol
  8431 0000404D 8946FC                   mov [bp-4], ax
  8432 00004050 8A46FE                   mov al, [bp-2]
  8433 00004053 8B5EFC                   mov  bx, [bp-4]
  8434 00004056 8807                     mov  [bx], al
  8435 00004058 FF46FC                   inc  word[bp-4]
  8436                                  
  8437                                  ;-791     while(letter(thechar)) {c=next(); *p=c;  p++; } 
  8438                                  
  8439                                  .getlex485:
  8440 0000405B A0[2100]                 mov al, byte [thechar]
  8441 0000405E B400                     mov ah, 0
  8442 00004060 50                       push ax
  8443 00004061 E8ECC2                   call letter
  8444 00004064 83C402                   add  sp, 2
  8445 00004067 08C0                     or  al, al
  8446 00004069 0F841300                 je .getlex486
  8447 0000406D E80204                   call next
  8448 00004070 8846FE                   mov [bp-2], al
  8449 00004073 8A46FE                   mov al, [bp-2]
  8450 00004076 8B5EFC                   mov  bx, [bp-4]
  8451 00004079 8807                     mov  [bx], al
  8452 0000407B FF46FC                   inc  word[bp-4]
  8453                                  
  8454                                  ;-792       *p=0;
  8455                                  
  8456 0000407E EBDB                     jmp .getlex485
  8457                                  .getlex486:
  8458 00004080 B80000                   mov ax, 0
  8459 00004083 8B5EFC                   mov  bx, [bp-4]
  8460 00004086 8807                     mov  [bx], al
  8461                                  
  8462                                  ;-793     if (eqstr(symbol,"signed"  )) return T_SIGNED;
  8463                                  
  8464 00004088 68[8842]                 push getlex_1
  8465 0000408B 8D062B81                 lea  ax, [symbol]
  8466 0000408F 50                       push ax
  8467 00004090 E818C1                   call eqstr
  8468 00004093 83C404                   add  sp, 4
  8469 00004096 08C0                     or  al, al
  8470 00004098 0F840600                 je .getlex487
  8471 0000409C B81302                   mov ax, 531
  8472 0000409F E9CE01                   jmp .retn
  8473                                  
  8474                                  ;-794     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;
  8475                                  
  8476                                  .getlex487:
  8477 000040A2 68[8F42]                 push getlex_2
  8478 000040A5 8D062B81                 lea  ax, [symbol]
  8479 000040A9 50                       push ax
  8480 000040AA E8FEC0                   call eqstr
  8481 000040AD 83C404                   add  sp, 4
  8482 000040B0 08C0                     or  al, al
  8483 000040B2 0F840600                 je .getlex488
  8484 000040B6 B81402                   mov ax, 532
  8485 000040B9 E9B401                   jmp .retn
  8486                                  
  8487                                  ;-795     if (eqstr(symbol,"void"    )) return T_VOID;
  8488                                  
  8489                                  .getlex488:
  8490 000040BC 68[9842]                 push getlex_3
  8491 000040BF 8D062B81                 lea  ax, [symbol]
  8492 000040C3 50                       push ax
  8493 000040C4 E8E4C0                   call eqstr
  8494 000040C7 83C404                   add  sp, 4
  8495 000040CA 08C0                     or  al, al
  8496 000040CC 0F840600                 je .getlex489
  8497 000040D0 B81102                   mov ax, 529
  8498 000040D3 E99A01                   jmp .retn
  8499                                  
  8500                                  ;-796     if (eqstr(symbol,"int"     )) return T_INT;
  8501                                  
  8502                                  .getlex489:
  8503 000040D6 68[9D42]                 push getlex_4
  8504 000040D9 8D062B81                 lea  ax, [symbol]
  8505 000040DD 50                       push ax
  8506 000040DE E8CAC0                   call eqstr
  8507 000040E1 83C404                   add  sp, 4
  8508 000040E4 08C0                     or  al, al
  8509 000040E6 0F840600                 je .getlex490
  8510 000040EA B80502                   mov ax, 517
  8511 000040ED E98001                   jmp .retn
  8512                                  
  8513                                  ;-797     if (eqstr(symbol,"long"    )) return T_LONG;
  8514                                  
  8515                                  .getlex490:
  8516 000040F0 68[A142]                 push getlex_5
  8517 000040F3 8D062B81                 lea  ax, [symbol]
  8518 000040F7 50                       push ax
  8519 000040F8 E8B0C0                   call eqstr
  8520 000040FB 83C404                   add  sp, 4
  8521 000040FE 08C0                     or  al, al
  8522 00004100 0F840600                 je .getlex491
  8523 00004104 B81502                   mov ax, 533
  8524 00004107 E96601                   jmp .retn
  8525                                  
  8526                                  ;-798     if (eqstr(symbol,"char"    )) return T_CHAR;
  8527                                  
  8528                                  .getlex491:
  8529 0000410A 68[A642]                 push getlex_6
  8530 0000410D 8D062B81                 lea  ax, [symbol]
  8531 00004111 50                       push ax
  8532 00004112 E896C0                   call eqstr
  8533 00004115 83C404                   add  sp, 4
  8534 00004118 08C0                     or  al, al
  8535 0000411A 0F840600                 je .getlex492
  8536 0000411E B81202                   mov ax, 530
  8537 00004121 E94C01                   jmp .retn
  8538                                  
  8539                                  ;-799     if (eqstr(symbol,"asm"     )) return T_ASM;
  8540                                  
  8541                                  .getlex492:
  8542 00004124 68[AB42]                 push getlex_7
  8543 00004127 8D062B81                 lea  ax, [symbol]
  8544 0000412B 50                       push ax
  8545 0000412C E87CC0                   call eqstr
  8546 0000412F 83C404                   add  sp, 4
  8547 00004132 08C0                     or  al, al
  8548 00004134 0F840600                 je .getlex493
  8549 00004138 B80602                   mov ax, 518
  8550 0000413B E93201                   jmp .retn
  8551                                  
  8552                                  ;-800     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;
  8553                                  
  8554                                  .getlex493:
  8555 0000413E 68[AF42]                 push getlex_8
  8556 00004141 8D062B81                 lea  ax, [symbol]
  8557 00004145 50                       push ax
  8558 00004146 E862C0                   call eqstr
  8559 00004149 83C404                   add  sp, 4
  8560 0000414C 08C0                     or  al, al
  8561 0000414E 0F840600                 je .getlex494
  8562 00004152 B80702                   mov ax, 519
  8563 00004155 E91801                   jmp .retn
  8564                                  
  8565                                  ;-801     if (eqstr(symbol,"__emit__")) return T_EMIT;
  8566                                  
  8567                                  .getlex494:
  8568 00004158 68[B542]                 push getlex_9
  8569 0000415B 8D062B81                 lea  ax, [symbol]
  8570 0000415F 50                       push ax
  8571 00004160 E848C0                   call eqstr
  8572 00004163 83C404                   add  sp, 4
  8573 00004166 08C0                     or  al, al
  8574 00004168 0F840600                 je .getlex495
  8575 0000416C B80802                   mov ax, 520
  8576 0000416F E9FE00                   jmp .retn
  8577                                  
  8578                                  ;-802     if (eqstr(symbol,"return"  )) return T_RETURN;
  8579                                  
  8580                                  .getlex495:
  8581 00004172 68[BE42]                 push getlex_10
  8582 00004175 8D062B81                 lea  ax, [symbol]
  8583 00004179 50                       push ax
  8584 0000417A E82EC0                   call eqstr
  8585 0000417D 83C404                   add  sp, 4
  8586 00004180 08C0                     or  al, al
  8587 00004182 0F840600                 je .getlex496
  8588 00004186 B80002                   mov ax, 512
  8589 00004189 E9E400                   jmp .retn
  8590                                  
  8591                                  ;-803     if (eqstr(symbol,"if"      )) return T_IF;
  8592                                  
  8593                                  .getlex496:
  8594 0000418C 68[C542]                 push getlex_11
  8595 0000418F 8D062B81                 lea  ax, [symbol]
  8596 00004193 50                       push ax
  8597 00004194 E814C0                   call eqstr
  8598 00004197 83C404                   add  sp, 4
  8599 0000419A 08C0                     or  al, al
  8600 0000419C 0F840600                 je .getlex497
  8601 000041A0 B80102                   mov ax, 513
  8602 000041A3 E9CA00                   jmp .retn
  8603                                  
  8604                                  ;-804     if (eqstr(symbol,"else"    )) return T_ELSE;
  8605                                  
  8606                                  .getlex497:
  8607 000041A6 68[C842]                 push getlex_12
  8608 000041A9 8D062B81                 lea  ax, [symbol]
  8609 000041AD 50                       push ax
  8610 000041AE E8FABF                   call eqstr
  8611 000041B1 83C404                   add  sp, 4
  8612 000041B4 08C0                     or  al, al
  8613 000041B6 0F840600                 je .getlex498
  8614 000041BA B80202                   mov ax, 514
  8615 000041BD E9B000                   jmp .retn
  8616                                  
  8617                                  ;-805     if (eqstr(symbol,"while"   )) return T_WHILE;
  8618                                  
  8619                                  .getlex498:
  8620 000041C0 68[CD42]                 push getlex_13
  8621 000041C3 8D062B81                 lea  ax, [symbol]
  8622 000041C7 50                       push ax
  8623 000041C8 E8E0BF                   call eqstr
  8624 000041CB 83C404                   add  sp, 4
  8625 000041CE 08C0                     or  al, al
  8626 000041D0 0F840600                 je .getlex499
  8627 000041D4 B80302                   mov ax, 515
  8628 000041D7 E99600                   jmp .retn
  8629                                  
  8630                                  ;-806     if (eqstr(symbol,"do"      )) return T_DO;
  8631                                  
  8632                                  .getlex499:
  8633 000041DA 68[D342]                 push getlex_14
  8634 000041DD 8D062B81                 lea  ax, [symbol]
  8635 000041E1 50                       push ax
  8636 000041E2 E8C6BF                   call eqstr
  8637 000041E5 83C404                   add  sp, 4
  8638 000041E8 08C0                     or  al, al
  8639 000041EA 0F840600                 je .getlex500
  8640 000041EE B80402                   mov ax, 516
  8641 000041F1 E97C00                   jmp .retn
  8642                                  
  8643                                  ;-807     if (eqstr(symbol,"goto"    )) return T_GOTO;
  8644                                  
  8645                                  .getlex500:
  8646 000041F4 68[D642]                 push getlex_15
  8647 000041F7 8D062B81                 lea  ax, [symbol]
  8648 000041FB 50                       push ax
  8649 000041FC E8ACBF                   call eqstr
  8650 000041FF 83C404                   add  sp, 4
  8651 00004202 08C0                     or  al, al
  8652 00004204 0F840600                 je .getlex501
  8653 00004208 B80902                   mov ax, 521
  8654 0000420B E96200                   jmp .retn
  8655                                  
  8656                                  ;-808     if (eqstr(symbol,"define"  )) return T_DEFINE;   
  8657                                  
  8658                                  .getlex501:
  8659 0000420E 68[DB42]                 push getlex_16
  8660 00004211 8D062B81                 lea  ax, [symbol]
  8661 00004215 50                       push ax
  8662 00004216 E892BF                   call eqstr
  8663 00004219 83C404                   add  sp, 4
  8664 0000421C 08C0                     or  al, al
  8665 0000421E 0F840600                 je .getlex502
  8666 00004222 B8FF01                   mov ax, 511
  8667 00004225 E94800                   jmp .retn
  8668                                  
  8669                                  ;-809     if (eqstr(symbol,"include" )) return T_INCLUDE;   
  8670                                  
  8671                                  .getlex502:
  8672 00004228 68[E242]                 push getlex_17
  8673 0000422B 8D062B81                 lea  ax, [symbol]
  8674 0000422F 50                       push ax
  8675 00004230 E878BF                   call eqstr
  8676 00004233 83C404                   add  sp, 4
  8677 00004236 08C0                     or  al, al
  8678 00004238 0F840600                 je .getlex503
  8679 0000423C B8FE01                   mov ax, 510
  8680 0000423F E92E00                   jmp .retn
  8681                                  
  8682                                  ;-810     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}
  8683                                  
  8684                                  .getlex503:
  8685 00004242 E8BF00                   call convertdefine
  8686 00004245 08C0                     or  al, al
  8687 00004247 0F841600                 je .getlex504
  8688 0000424B 8D06DCD0                 lea  ax, [symboltemp]
  8689 0000424F 50                       push ax
  8690 00004250 8D062B81                 lea  ax, [symbol]
  8691 00004254 50                       push ax
  8692 00004255 E823BF                   call strcpy
  8693 00004258 83C404                   add  sp, 4
  8694 0000425B B80101                   mov ax, 257
  8695 0000425E E90F00                   jmp .retn
  8696                                  
  8697                                  ;-811     return T_NAME; } error1("Input item not recognized"); }
  8698                                  
  8699                                  .getlex504:
  8700 00004261 B80001                   mov ax, 256
  8701 00004264 E90900                   jmp .retn
  8702                                  .getlex484:
  8703 00004267 68[EA42]                 push getlex_18
  8704 0000426A E84106                   call error1
  8705 0000426D 83C402                   add  sp, 2
  8706                                  
  8707                                  ;-812 
  8708                                  
  8709                                  
  8710                                  ;-813 int convertdefine() { int i; int j;   i=0;
  8711                                  
  8712 00004270 C9                       .retn: LEAVE
  8713 00004271 C3                       ret
  8714                                  ; ENDP
  8715 00004272 28295B5D7B7D2C3B2A-     getlex_0 db "()[]{},;*:%-><=+!&|#?",0
  8716 0000427B 3A252D3E3C3D2B2126-
  8717 00004284 7C233F00           
  8718 00004288 7369676E656400          getlex_1 db "signed",0
  8719 0000428F 756E7369676E656400      getlex_2 db "unsigned",0
  8720 00004298 766F696400              getlex_3 db "void",0
  8721 0000429D 696E7400                getlex_4 db "int",0
  8722 000042A1 6C6F6E6700              getlex_5 db "long",0
  8723 000042A6 6368617200              getlex_6 db "char",0
  8724 000042AB 61736D00                getlex_7 db "asm",0
  8725 000042AF 5F5F61736D00            getlex_8 db "__asm",0
  8726 000042B5 5F5F656D69745F5F00      getlex_9 db "__emit__",0
  8727 000042BE 72657475726E00          getlex_10 db "return",0
  8728 000042C5 696600                  getlex_11 db "if",0
  8729 000042C8 656C736500              getlex_12 db "else",0
  8730 000042CD 7768696C6500            getlex_13 db "while",0
  8731 000042D3 646F00                  getlex_14 db "do",0
  8732 000042D6 676F746F00              getlex_15 db "goto",0
  8733 000042DB 646566696E6500          getlex_16 db "define",0
  8734 000042E2 696E636C75646500        getlex_17 db "include",0
  8735 000042EA 496E70757420697465-     getlex_18 db "Input item not recognized",0
  8736 000042F3 6D206E6F7420726563-
  8737 000042FC 6F676E697A656400   
  8738                                  
  8739                                  convertdefine:  ; *** PROC ***
  8740                                  ;Function : convertdefine, Number of local variables: 2
  8741                                  ;   # type sign width addr used name   list of local variables
  8742                                  ;  200 var sign word   813 NULL i = bp-2
  8743                                  ;  201 var sign word   813 NULL j = bp-4;
  8744 00004304 C8040000                 ENTER  4,0
  8745 00004308 B80000                   mov ax, 0
  8746 0000430B 8946FE                   mov [bp-2], ax
  8747                                  
  8748                                  ;-814   while (i < GTop) {
  8749                                  
  8750                                  .convertdefine505:
  8751 0000430E 8B46FE                   mov ax, [bp-2]
  8752 00004311 3B06[2A00]               cmp ax, [GTop]
  8753 00004315 0F8D4400                 jge .convertdefine506
  8754                                  
  8755                                  ;-815    j=adrofname(i); 
  8756                                  
  8757 00004319 FF76FE                   push word [bp-2]
  8758 0000431C E877C6                   call adrofname
  8759 0000431F 83C402                   add  sp, 2
  8760 00004322 8946FC                   mov [bp-4], ax
  8761                                  
  8762                                  ;-816    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];
  8763                                  
  8764 00004325 FF76FC                   push word [bp-4]
  8765 00004328 8D062B81                 lea  ax, [symbol]
  8766 0000432C 50                       push ax
  8767 0000432D E87BBE                   call eqstr
  8768 00004330 83C404                   add  sp, 4
  8769 00004333 08C0                     or  al, al
  8770 00004335 0F841F00                 je .convertdefine507
  8771 00004339 8B5EFE                   mov bx, [bp-2]
  8772 0000433C 8A87B782                 mov al, [GType + bx]
  8773 00004340 3C23                     cmp al, 35
  8774 00004342 0F851200                 jne .convertdefine508
  8775 00004346 8B5EFE                   mov bx, [bp-2]
  8776 00004349 D1E3                     shl bx, 1
  8777 0000434B 8B87EB8A                 mov ax, [GData + bx]
  8778 0000434F A3[2E00]                 mov word [lexval], ax
  8779                                  
  8780                                  ;-817    return T_CONST; } }
  8781                                  
  8782 00004352 B80101                   mov ax, 257
  8783 00004355 E90B00                   jmp .retn
  8784                                  .convertdefine508:
  8785                                  
  8786                                  ;-818    i++; } 
  8787                                  
  8788                                  .convertdefine507:
  8789 00004358 FF46FE                   inc  word[bp-2]
  8790                                  
  8791                                  ;-819    return 0; }
  8792                                  
  8793 0000435B EBB1                     jmp .convertdefine505
  8794                                  .convertdefine506:
  8795 0000435D B80000                   mov ax, 0
  8796 00004360 E90000                   jmp .retn
  8797                                  
  8798                                  ;-820 int getdigit(char c) { int i;
  8799                                  
  8800 00004363 C9                       .retn: LEAVE
  8801 00004364 C3                       ret
  8802                                  ; ENDP
  8803                                  
  8804                                  getdigit:  ; *** PROC ***
  8805                                  
  8806                                  ;-821     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char
  8807                                  
  8808                                  ;Function : getdigit, Number of local variables: 2
  8809                                  ;   # type sign width addr used name   list of local variables
  8810                                  ;  200 var sign byte   820 NULL c = bp+4
  8811                                  ;  201 var sign word   820 NULL i = bp-2;
  8812 00004365 C8020000                 ENTER  2,0
  8813 00004369 B80000                   mov ax, 0
  8814 0000436C A3[2E00]                 mov word [lexval], ax
  8815 0000436F 8A4604                   mov al, [bp+4]
  8816 00004372 2C30                     sub al, 48
  8817 00004374 A3[2E00]                 mov word [lexval], ax
  8818                                  
  8819                                  ;-822     if (thechar=='x') thechar='X'; if (thechar=='X') { next();
  8820                                  
  8821 00004377 A0[2100]                 mov al, [thechar]
  8822 0000437A 3C78                     cmp al, 120
  8823 0000437C 0F850600                 jne .getdigit509
  8824 00004380 B85800                   mov ax, 88
  8825 00004383 A2[2100]                 mov byte [thechar], al
  8826                                  .getdigit509:
  8827 00004386 A0[2100]                 mov al, [thechar]
  8828 00004389 3C58                     cmp al, 88
  8829 0000438B 0F856800                 jne .getdigit510
  8830 0000438F E8E000                   call next
  8831                                  
  8832                                  ;-823       while(letter(thechar)) { c=next(); if(c>96) c=c-39;
  8833                                  
  8834                                  .getdigit511:
  8835 00004392 A0[2100]                 mov al, byte [thechar]
  8836 00004395 B400                     mov ah, 0
  8837 00004397 50                       push ax
  8838 00004398 E8B5BF                   call letter
  8839 0000439B 83C402                   add  sp, 2
  8840 0000439E 08C0                     or  al, al
  8841 000043A0 0F845000                 je .getdigit512
  8842 000043A4 E8CB00                   call next
  8843 000043A7 884604                   mov [bp+4], al
  8844 000043AA 8A4604                   mov al, [bp+4]
  8845 000043AD 3C60                     cmp al, 96
  8846 000043AF 0F8E0800                 jle .getdigit513
  8847 000043B3 8A4604                   mov al, [bp+4]
  8848 000043B6 2C27                     sub al, 39
  8849 000043B8 884604                   mov [bp+4], al
  8850                                  
  8851                                  ;-824 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16
  8852                                  
  8853                                  .getdigit513:
  8854 000043BB 8A4604                   mov al, [bp+4]
  8855 000043BE 3C40                     cmp al, 64
  8856 000043C0 0F8E0800                 jle .getdigit514
  8857 000043C4 8A4604                   mov al, [bp+4]
  8858 000043C7 2C07                     sub al, 7
  8859 000043C9 884604                   mov [bp+4], al
  8860                                  .getdigit514:
  8861 000043CC 8A4604                   mov al, [bp+4]
  8862 000043CF 2C30                     sub al, 48
  8863 000043D1 884604                   mov [bp+4], al
  8864 000043D4 A1[2E00]                 mov ax, [lexval]
  8865 000043D7 C1E004                   shl ax, 4
  8866 000043DA A3[2E00]                 mov word [lexval], ax
  8867                                  
  8868                                  ;-825      i=0; i=c; lexval=lexval+i;}
  8869                                  
  8870 000043DD B80000                   mov ax, 0
  8871 000043E0 8946FE                   mov [bp-2], ax
  8872 000043E3 8A4604                   mov al, [bp+4]
  8873 000043E6 8946FE                   mov [bp-2], ax
  8874 000043E9 A1[2E00]                 mov ax, [lexval]
  8875 000043EC 0346FE                   add ax, [bp-2]
  8876 000043EF A3[2E00]                 mov word [lexval], ax
  8877                                  
  8878                                  ;-826     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10; 
  8879                                  
  8880 000043F2 EB9E                     jmp .getdigit511
  8881                                  .getdigit512:
  8882 000043F4 E94200                   jmp .getdigit515
  8883                                  .getdigit510:
  8884                                  .getdigit516:
  8885 000043F7 A0[2100]                 mov al, byte [thechar]
  8886 000043FA B400                     mov ah, 0
  8887 000043FC 50                       push ax
  8888 000043FD E826BF                   call digit
  8889 00004400 83C402                   add  sp, 2
  8890 00004403 08C0                     or  al, al
  8891 00004405 0F843000                 je .getdigit517
  8892 00004409 E86600                   call next
  8893 0000440C 884604                   mov [bp+4], al
  8894 0000440F 8A4604                   mov al, [bp+4]
  8895 00004412 2C30                     sub al, 48
  8896 00004414 884604                   mov [bp+4], al
  8897 00004417 A1[2E00]                 mov ax, [lexval]
  8898 0000441A BB0A00                   mov bx, 10
  8899 0000441D F7E3                     mul bx
  8900 0000441F A3[2E00]                 mov word [lexval], ax
  8901                                  
  8902                                  ;-827      i=0; i=c; lexval=lexval+i; } } 
  8903                                  
  8904 00004422 B80000                   mov ax, 0
  8905 00004425 8946FE                   mov [bp-2], ax
  8906 00004428 8A4604                   mov al, [bp+4]
  8907 0000442B 8946FE                   mov [bp-2], ax
  8908 0000442E A1[2E00]                 mov ax, [lexval]
  8909 00004431 0346FE                   add ax, [bp-2]
  8910 00004434 A3[2E00]                 mov word [lexval], ax
  8911 00004437 EBBE                     jmp .getdigit516
  8912                                  .getdigit517:
  8913                                  
  8914                                  ;-828 }
  8915                                  
  8916                                  .getdigit515:
  8917                                  
  8918                                  ;-829 int getstring(int delim) {int c; char *p;  p=&symbol; c=next();
  8919 00004439 C9                       LEAVE
  8920 0000443A C3                       ret
  8921                                  ; ENDP
  8922                                  
  8923                                  getstring:  ; *** PROC ***
  8924                                  ;Function : getstring, Number of local variables: 3
  8925                                  ;   # type sign width addr used name   list of local variables
  8926                                  ;  200 var sign word   829 NULL delim = bp+4
  8927                                  ;  201 var sign word   829 NULL c = bp-2
  8928                                  ;  202 ptr sign byte   829 NULL p = bp-4;
  8929 0000443B C8040000                 ENTER  4,0
  8930 0000443F B82B81                   mov ax, symbol
  8931 00004442 8946FC                   mov [bp-4], ax
  8932 00004445 E82A00                   call next
  8933 00004448 8946FE                   mov [bp-2], ax
  8934                                  
  8935                                  ;-830   while (c != delim) {*p=c; p++; c=next(); } *p=0; }
  8936                                  
  8937                                  .getstring518:
  8938 0000444B 8B46FE                   mov ax, [bp-2]
  8939 0000444E 3B4604                   cmp ax, [bp+4]
  8940 00004451 0F841300                 je  .getstring519
  8941 00004455 8B46FE                   mov ax, [bp-2]
  8942 00004458 8B5EFC                   mov  bx, [bp-4]
  8943 0000445B 8807                     mov  [bx], al
  8944 0000445D FF46FC                   inc  word[bp-4]
  8945 00004460 E80F00                   call next
  8946 00004463 8946FE                   mov [bp-2], ax
  8947 00004466 EBE3                     jmp .getstring518
  8948                                  .getstring519:
  8949 00004468 B80000                   mov ax, 0
  8950 0000446B 8B5EFC                   mov  bx, [bp-4]
  8951 0000446E 8807                     mov  [bx], al
  8952                                  
  8953                                  ;-831 
  8954                                  
  8955                                  
  8956                                  ;-832 int next() {char r; r = thechar; globC=r; thechar = fgets1(); return r; }
  8957 00004470 C9                       LEAVE
  8958 00004471 C3                       ret
  8959                                  ; ENDP
  8960                                  
  8961                                  next:  ; *** PROC ***
  8962                                  ;Function : next, Number of local variables: 1
  8963                                  ;   # type sign width addr used name   list of local variables
  8964                                  ;  200 var sign byte   832 NULL r = bp-2;
  8965 00004472 C8020000                 ENTER  2,0
  8966 00004476 A0[2100]                 mov al, [thechar]
  8967 00004479 8846FE                   mov [bp-2], al
  8968 0000447C 8A46FE                   mov al, [bp-2]
  8969 0000447F A2[1E00]                 mov byte [globC], al
  8970 00004482 E83303                   call fgets1
  8971 00004485 A2[2100]                 mov byte [thechar], al
  8972 00004488 8A46FE                   mov al, [bp-2]
  8973 0000448B E90000                   jmp .retn
  8974                                  
  8975                                  ;-833 int istoken(int t) {if (token == t) { token=getlex(); return 1; } return 0;}
  8976                                  
  8977 0000448E C9                       .retn: LEAVE
  8978 0000448F C3                       ret
  8979                                  ; ENDP
  8980                                  
  8981                                  istoken:  ; *** PROC ***
  8982                                  ;Function : istoken, Number of local variables: 1
  8983                                  ;   # type sign width addr used name   list of local variables
  8984                                  ;  200 var sign word   833 NULL t = bp+4;
  8985 00004490 C8000000                 ENTER  0,0
  8986 00004494 A1[1C00]                 mov ax, [token]
  8987 00004497 3B4604                   cmp ax, [bp+4]
  8988 0000449A 0F850C00                 jne .istoken520
  8989 0000449E E8CBF8                   call getlex
  8990 000044A1 A3[1C00]                 mov word [token], ax
  8991 000044A4 B80100                   mov ax, 1
  8992 000044A7 E90600                   jmp .retn
  8993                                  .istoken520:
  8994 000044AA B80000                   mov ax, 0
  8995 000044AD E90000                   jmp .retn
  8996                                  
  8997                                  ;-834 int expect(int t) {if (istoken(t)==0) { *cloc=0; prs(co); listproc();
  8998                                  
  8999 000044B0 C9                       .retn: LEAVE
  9000 000044B1 C3                       ret
  9001                                  ; ENDP
  9002                                  
  9003                                  expect:  ; *** PROC ***
  9004                                  ;Function : expect, Number of local variables: 1
  9005                                  ;   # type sign width addr used name   list of local variables
  9006                                  ;  200 var sign word   834 NULL t = bp+4;
  9007 000044B2 C8000000                 ENTER  0,0
  9008 000044B6 FF7604                   push word [bp+4]
  9009 000044B9 E8D4FF                   call istoken
  9010 000044BC 83C402                   add  sp, 2
  9011 000044BF 83F800                   cmp ax, 0
  9012 000044C2 0F853200                 jne .expect521
  9013 000044C6 B80000                   mov ax, 0
  9014 000044C9 8B1E[1600]               mov  bx, [cloc]
  9015 000044CD 8807                     mov  [bx], al
  9016 000044CF 8D063075                 lea  ax, [co]
  9017 000044D3 50                       push ax
  9018 000044D4 E8EE00                   call prs
  9019 000044D7 83C402                   add  sp, 2
  9020 000044DA E8D304                   call listproc
  9021                                  
  9022                                  ;-835   prs("\nExpected ASCII(dez): "); pint1(t); error1(" not found"); } }
  9023                                  
  9024 000044DD 68[FA44]                 push expect_0
  9025 000044E0 E8E200                   call prs
  9026 000044E3 83C402                   add  sp, 2
  9027 000044E6 FF7604                   push word [bp+4]
  9028 000044E9 E8D001                   call pint1
  9029 000044EC 83C402                   add  sp, 2
  9030 000044EF 68[1245]                 push expect_1
  9031 000044F2 E8B903                   call error1
  9032 000044F5 83C402                   add  sp, 2
  9033                                  .expect521:
  9034                                  
  9035                                  ;-836 
  9036                                  
  9037                                  
  9038                                  ;-837 int eprc(char c)  {*cloc=c; cloc++; }
  9039 000044F8 C9                       LEAVE
  9040 000044F9 C3                       ret
  9041                                  ; ENDP
  9042 000044FA 5C6E45787065637465-     expect_0 db "\nExpected ASCII(dez): ",0
  9043 00004503 642041534349492864-
  9044 0000450C 657A293A2000       
  9045 00004512 206E6F7420666F756E-     expect_1 db " not found",0
  9046 0000451B 6400               
  9047                                  
  9048                                  eprc:  ; *** PROC ***
  9049                                  ;Function : eprc, Number of local variables: 1
  9050                                  ;   # type sign width addr used name   list of local variables
  9051                                  ;  200 var sign byte   837 NULL c = bp+4;
  9052 0000451D C8000000                 ENTER  0,0
  9053 00004521 8A4604                   mov al, [bp+4]
  9054 00004524 8B1E[1600]               mov  bx, [cloc]
  9055 00004528 8807                     mov  [bx], al
  9056 0000452A FF06[1600]               inc  word[cloc]
  9057                                  
  9058                                  ;-838 int eprs(char *s) {char c;  while(*s) { c=*s; eprc(c); s++; } }
  9059 0000452E C9                       LEAVE
  9060 0000452F C3                       ret
  9061                                  ; ENDP
  9062                                  
  9063                                  eprs:  ; *** PROC ***
  9064                                  ;Function : eprs, Number of local variables: 2
  9065                                  ;   # type sign width addr used name   list of local variables
  9066                                  ;  200 ptr sign byte   838 NULL s = bp+4
  9067                                  ;  201 var sign byte   838 NULL c = bp-2;
  9068 00004530 C8020000                 ENTER  2,0
  9069                                  .eprs522:
  9070 00004534 8B5E04                   mov bx, [bp+4]
  9071 00004537 8A07                     mov al, [bx]
  9072 00004539 B400                     mov ah, 0
  9073 0000453B 08C0                     or  al, al
  9074 0000453D 0F841B00                 je .eprs523
  9075 00004541 8B5E04                   mov bx, [bp+4]
  9076 00004544 8A07                     mov al, [bx]
  9077 00004546 B400                     mov ah, 0
  9078 00004548 8846FE                   mov [bp-2], al
  9079 0000454B 8A46FE                   mov al, byte [bp-2]
  9080 0000454E B400                     mov ah, 0
  9081 00004550 50                       push ax
  9082 00004551 E8C9FF                   call eprc
  9083 00004554 83C402                   add  sp, 2
  9084 00004557 FF4604                   inc  word[bp+4]
  9085 0000455A EBD8                     jmp .eprs522
  9086                                  .eprs523:
  9087                                  
  9088                                  ;-839 int prc(unsigned char c) { 
  9089 0000455C C9                       LEAVE
  9090 0000455D C3                       ret
  9091                                  ; ENDP
  9092                                  
  9093                                  prc:  ; *** PROC ***
  9094                                  
  9095                                  ;-840   if (c==10) {_AX=13; writetty(); }
  9096                                  
  9097                                  ;Function : prc, Number of local variables: 1
  9098                                  ;   # type sign width addr used name   list of local variables
  9099                                  ;  200 var unsg byte   839 NULL c = bp+4;
  9100 0000455E C8000000                 ENTER  0,0
  9101 00004562 8A4604                   mov al, [bp+4]
  9102 00004565 3C0A                     cmp al, 10
  9103 00004567 0F850600                 jne .prc524
  9104 0000456B B80D00                   mov  ax, 13
  9105 0000456E E802BB                   call writetty
  9106                                  
  9107                                  ;-841   _AL=c; writetty(); 
  9108                                  
  9109                                  .prc524:
  9110 00004571 8A4604                   mov  al, [bp+4]
  9111 00004574 E8FCBA                   call writetty
  9112                                  
  9113                                  ;-842   fputcR(c, fdout); 
  9114                                  
  9115 00004577 FF36[1A00]               push word [fdout]
  9116 0000457B 8A4604                   mov al, byte [bp+4]
  9117 0000457E B400                     mov ah, 0
  9118 00004580 50                       push ax
  9119 00004581 E8BABB                   call fputcR
  9120 00004584 83C404                   add  sp, 4
  9121                                  
  9122                                  ;-843   }
  9123                                  
  9124                                  
  9125                                  ;-844 int prscomment(unsigned char *s) {unsigned char c;
  9126 00004587 C9                       LEAVE
  9127 00004588 C3                       ret
  9128                                  ; ENDP
  9129                                  
  9130                                  prscomment:  ; *** PROC ***
  9131                                  
  9132                                  ;-845   while(*s){c=*s;prc(c);s++;} }
  9133                                  
  9134                                  ;Function : prscomment, Number of local variables: 2
  9135                                  ;   # type sign width addr used name   list of local variables
  9136                                  ;  200 ptr unsg byte   844 NULL s = bp+4
  9137                                  ;  201 var unsg byte   844 NULL c = bp-2;
  9138 00004589 C8020000                 ENTER  2,0
  9139                                  .prscomment525:
  9140 0000458D 8B5E04                   mov bx, [bp+4]
  9141 00004590 8A07                     mov al, [bx]
  9142 00004592 B400                     mov ah, 0
  9143 00004594 08C0                     or  al, al
  9144 00004596 0F841B00                 je .prscomment526
  9145 0000459A 8B5E04                   mov bx, [bp+4]
  9146 0000459D 8A07                     mov al, [bx]
  9147 0000459F B400                     mov ah, 0
  9148 000045A1 8846FE                   mov [bp-2], al
  9149 000045A4 8A46FE                   mov al, byte [bp-2]
  9150 000045A7 B400                     mov ah, 0
  9151 000045A9 50                       push ax
  9152 000045AA E8B1FF                   call prc
  9153 000045AD 83C402                   add  sp, 2
  9154 000045B0 FF4604                   inc  word[bp+4]
  9155 000045B3 EBD8                     jmp .prscomment525
  9156                                  .prscomment526:
  9157                                  
  9158                                  ;-846 int prnl() { prs("\n ");}
  9159 000045B5 C9                       LEAVE
  9160 000045B6 C3                       ret
  9161                                  ; ENDP
  9162                                  
  9163                                  prnl:  ; *** PROC ***
  9164 000045B7 68[C145]                 push prnl_0
  9165 000045BA E80800                   call prs
  9166 000045BD 83C402                   add  sp, 2
  9167                                  
  9168                                  ;-847 
  9169                                  
  9170                                  
  9171                                  ;-848 int prs(unsigned char *s) {unsigned char c; int com; com=0;
  9172                                  
  9173 000045C0 C3                       ret
  9174                                  ; ENDP
  9175 000045C1 5C6E2000                prnl_0 db "\n ",0
  9176                                  
  9177                                  prs:  ; *** PROC ***
  9178                                  ;Function : prs, Number of local variables: 3
  9179                                  ;   # type sign width addr used name   list of local variables
  9180                                  ;  200 ptr unsg byte   848 NULL s = bp+4
  9181                                  ;  201 var unsg byte   848 NULL c = bp-2
  9182                                  ;  202 var sign word   848 NULL com = bp-4;
  9183 000045C5 C8040000                 ENTER  4,0
  9184 000045C9 B80000                   mov ax, 0
  9185 000045CC 8946FC                   mov [bp-4], ax
  9186                                  
  9187                                  ;-849   while(*s) { c=*s; if (c==34) if (com) com=0; else com=1;
  9188                                  
  9189                                  .prs527:
  9190 000045CF 8B5E04                   mov bx, [bp+4]
  9191 000045D2 8A07                     mov al, [bx]
  9192 000045D4 B400                     mov ah, 0
  9193 000045D6 08C0                     or  al, al
  9194 000045D8 0F847B00                 je .prs528
  9195 000045DC 8B5E04                   mov bx, [bp+4]
  9196 000045DF 8A07                     mov al, [bx]
  9197 000045E1 B400                     mov ah, 0
  9198 000045E3 8846FE                   mov [bp-2], al
  9199 000045E6 8A46FE                   mov al, [bp-2]
  9200 000045E9 3C22                     cmp al, 34
  9201 000045EB 0F851800                 jne .prs529
  9202 000045EF 8B46FC                   mov ax, [bp-4]
  9203 000045F2 08C0                     or  al, al
  9204 000045F4 0F840900                 je .prs530
  9205 000045F8 B80000                   mov ax, 0
  9206 000045FB 8946FC                   mov [bp-4], ax
  9207 000045FE E90600                   jmp .prs531
  9208                                  .prs530:
  9209 00004601 B80100                   mov ax, 1
  9210 00004604 8946FC                   mov [bp-4], ax
  9211                                  
  9212                                  ;-850     if (c==92) { if (com==0) { s++; c=*s;
  9213                                  
  9214                                  .prs531:
  9215                                  .prs529:
  9216 00004607 8A46FE                   mov al, [bp-2]
  9217 0000460A 3C5C                     cmp al, 92
  9218 0000460C 0F853500                 jne .prs532
  9219 00004610 8B46FC                   mov ax, [bp-4]
  9220 00004613 83F800                   cmp ax, 0
  9221 00004616 0F852B00                 jne .prs533
  9222 0000461A FF4604                   inc  word[bp+4]
  9223 0000461D 8B5E04                   mov bx, [bp+4]
  9224 00004620 8A07                     mov al, [bx]
  9225 00004622 B400                     mov ah, 0
  9226 00004624 8846FE                   mov [bp-2], al
  9227                                  
  9228                                  ;-851           if (c=='n') c=10; if (c=='t') c= 9;
  9229                                  
  9230 00004627 8A46FE                   mov al, [bp-2]
  9231 0000462A 3C6E                     cmp al, 110
  9232 0000462C 0F850600                 jne .prs534
  9233 00004630 B80A00                   mov ax, 10
  9234 00004633 8846FE                   mov [bp-2], al
  9235                                  .prs534:
  9236 00004636 8A46FE                   mov al, [bp-2]
  9237 00004639 3C74                     cmp al, 116
  9238 0000463B 0F850600                 jne .prs535
  9239 0000463F B80900                   mov ax, 9
  9240 00004642 8846FE                   mov [bp-2], al
  9241                                  
  9242                                  ;-852     } } prc(c); s++;  } }
  9243                                  
  9244                                  .prs535:
  9245                                  .prs533:
  9246                                  .prs532:
  9247 00004645 8A46FE                   mov al, byte [bp-2]
  9248 00004648 B400                     mov ah, 0
  9249 0000464A 50                       push ax
  9250 0000464B E810FF                   call prc
  9251 0000464E 83C402                   add  sp, 2
  9252 00004651 FF4604                   inc  word[bp+4]
  9253 00004654 E978FF                   jmp .prs527
  9254                                  .prs528:
  9255                                  
  9256                                  ;-853 int eprnum(int n){int e; if(n<0) { eprc('-'); n=mkneg(n); }
  9257 00004657 C9                       LEAVE
  9258 00004658 C3                       ret
  9259                                  ; ENDP
  9260                                  
  9261                                  eprnum:  ; *** PROC ***
  9262                                  ;Function : eprnum, Number of local variables: 2
  9263                                  ;   # type sign width addr used name   list of local variables
  9264                                  ;  200 var sign word   853 NULL n = bp+4
  9265                                  ;  201 var sign word   853 NULL e = bp-2;
  9266 00004659 C8020000                 ENTER  2,0
  9267 0000465D 8B4604                   mov ax, [bp+4]
  9268 00004660 83F800                   cmp ax, 0
  9269 00004663 0F8D1400                 jge .eprnum536
  9270 00004667 6A2D                     push 45
  9271 00004669 E8B1FE                   call eprc
  9272 0000466C 83C402                   add  sp, 2
  9273 0000466F FF7604                   push word [bp+4]
  9274 00004672 E84DBA                   call mkneg
  9275 00004675 83C402                   add  sp, 2
  9276 00004678 894604                   mov [bp+4], ax
  9277                                  
  9278                                  ;-854   if (n >= 10) {e=n/10; eprnum(e);}  n=n%10; n=n+'0'; eprc(n); }
  9279                                  
  9280                                  .eprnum536:
  9281 0000467B 8B4604                   mov ax, [bp+4]
  9282 0000467E 83F80A                   cmp ax, 10 ;unsigned : 1
  9283 00004681 0F8C1500                 jl  .eprnum537
  9284 00004685 8B4604                   mov ax, [bp+4]
  9285 00004688 BB0A00                   mov bx, 10
  9286 0000468B 99                       cwd
  9287 0000468C F7FB                     idiv bx
  9288 0000468E 8946FE                   mov [bp-2], ax
  9289 00004691 FF76FE                   push word [bp-2]
  9290 00004694 E8C2FF                   call eprnum
  9291 00004697 83C402                   add  sp, 2
  9292                                  .eprnum537:
  9293 0000469A 8B4604                   mov ax, [bp+4]
  9294 0000469D BB0A00                   mov bx, 10
  9295 000046A0 99                       cwd
  9296 000046A1 F7FB                     idiv bx
  9297 000046A3 89D0                     mov ax, dx
  9298 000046A5 894604                   mov [bp+4], ax
  9299 000046A8 8B4604                   mov ax, [bp+4]
  9300 000046AB 83C030                   add ax, 48
  9301 000046AE 894604                   mov [bp+4], ax
  9302 000046B1 FF7604                   push word [bp+4]
  9303 000046B4 E866FE                   call eprc
  9304 000046B7 83C402                   add  sp, 2
  9305                                  
  9306                                  ;-855 int pint1 (int n){int e; if(n<0) {  prc('-');  n=mkneg(n); }
  9307 000046BA C9                       LEAVE
  9308 000046BB C3                       ret
  9309                                  ; ENDP
  9310                                  
  9311                                  pint1:  ; *** PROC ***
  9312                                  ;Function : pint1, Number of local variables: 2
  9313                                  ;   # type sign width addr used name   list of local variables
  9314                                  ;  200 var sign word   855 NULL n = bp+4
  9315                                  ;  201 var sign word   855 NULL e = bp-2;
  9316 000046BC C8020000                 ENTER  2,0
  9317 000046C0 8B4604                   mov ax, [bp+4]
  9318 000046C3 83F800                   cmp ax, 0
  9319 000046C6 0F8D1400                 jge .pint1538
  9320 000046CA 6A2D                     push 45
  9321 000046CC E88FFE                   call prc
  9322 000046CF 83C402                   add  sp, 2
  9323 000046D2 FF7604                   push word [bp+4]
  9324 000046D5 E8EAB9                   call mkneg
  9325 000046D8 83C402                   add  sp, 2
  9326 000046DB 894604                   mov [bp+4], ax
  9327                                  
  9328                                  ;-856   if (n >= 10) {e=n/10;  pint1(e);}  n=n%10; n=n+'0'; prc(n); }
  9329                                  
  9330                                  .pint1538:
  9331 000046DE 8B4604                   mov ax, [bp+4]
  9332 000046E1 83F80A                   cmp ax, 10 ;unsigned : 1
  9333 000046E4 0F8C1500                 jl  .pint1539
  9334 000046E8 8B4604                   mov ax, [bp+4]
  9335 000046EB BB0A00                   mov bx, 10
  9336 000046EE 99                       cwd
  9337 000046EF F7FB                     idiv bx
  9338 000046F1 8946FE                   mov [bp-2], ax
  9339 000046F4 FF76FE                   push word [bp-2]
  9340 000046F7 E8C2FF                   call pint1
  9341 000046FA 83C402                   add  sp, 2
  9342                                  .pint1539:
  9343 000046FD 8B4604                   mov ax, [bp+4]
  9344 00004700 BB0A00                   mov bx, 10
  9345 00004703 99                       cwd
  9346 00004704 F7FB                     idiv bx
  9347 00004706 89D0                     mov ax, dx
  9348 00004708 894604                   mov [bp+4], ax
  9349 0000470B 8B4604                   mov ax, [bp+4]
  9350 0000470E 83C030                   add ax, 48
  9351 00004711 894604                   mov [bp+4], ax
  9352 00004714 FF7604                   push word [bp+4]
  9353 00004717 E844FE                   call prc
  9354 0000471A 83C402                   add  sp, 2
  9355                                  
  9356                                  ;-857 int prunsign1(unsigned int n) { unsigned int e;
  9357 0000471D C9                       LEAVE
  9358 0000471E C3                       ret
  9359                                  ; ENDP
  9360                                  
  9361                                  prunsign1:  ; *** PROC ***
  9362                                  
  9363                                  ;-858   if ( _ n >= 10) {  e=n/10; /*DIV*/ prunsign1(e); }
  9364                                  
  9365                                  ;Function : prunsign1, Number of local variables: 2
  9366                                  ;   # type sign width addr used name   list of local variables
  9367                                  ;  200 var unsg word   857 NULL n = bp+4
  9368                                  ;  201 var unsg word   857 NULL e = bp-2;
  9369 0000471F C8020000                 ENTER  2,0 ; constant expression
  9370 00004723 837E040A                cmp word[bp+4], 10 ;unsigned : 0
  9371 00004727 0F821700                 jb  .prunsign1540
  9372 0000472B 8B4604                   mov ax, [bp+4]
  9373 0000472E BB0A00                   mov bx, 10
  9374 00004731 BA0000                   mov dx, 0
  9375 00004734 F7F3                     div bx
  9376 00004736 8946FE                   mov [bp-2], ax
  9377 00004739 FF76FE                   push word [bp-2]
  9378 0000473C E8E0FF                   call prunsign1
  9379 0000473F 83C402                   add  sp, 2
  9380                                  
  9381                                  ;-859     n = n % 10; /*unsigned mod*/   n += '0'; prc(n); }
  9382                                  
  9383                                  .prunsign1540:
  9384 00004742 8B4604                   mov ax, [bp+4]
  9385 00004745 BB0A00                   mov bx, 10
  9386 00004748 BA0000                   mov dx, 0
  9387 0000474B F7F3                     div bx
  9388 0000474D 89D0                     mov ax, dx
  9389 0000474F 894604                   mov [bp+4], ax
  9390 00004752 83460430                 add  word[bp+4], 48
  9391 00004756 FF7604                   push word [bp+4]
  9392 00004759 E802FE                   call prc
  9393 0000475C 83C402                   add  sp, 2
  9394                                  
  9395                                  ;-860 int printint51(unsigned int j)  {
  9396 0000475F C9                       LEAVE
  9397 00004760 C3                       ret
  9398                                  ; ENDP
  9399                                  
  9400                                  printint51:  ; *** PROC ***
  9401                                  
  9402                                  ;-861   if (j<10000) prc(32); if (j<1000) prc(32);  if (j<100) prc(32);
  9403                                  
  9404                                  ;Function : printint51, Number of local variables: 1
  9405                                  ;   # type sign width addr used name   list of local variables
  9406                                  ;  200 var unsg word   860 NULL j = bp+4;
  9407 00004761 C8000000                 ENTER  0,0
  9408 00004765 8B4604                   mov ax, [bp+4]
  9409 00004768 3D1027                   cmp ax, 10000
  9410 0000476B 0F8D0800                 jge .printint51541
  9411 0000476F 6A20                     push 32
  9412 00004771 E8EAFD                   call prc
  9413 00004774 83C402                   add  sp, 2
  9414                                  .printint51541:
  9415 00004777 8B4604                   mov ax, [bp+4]
  9416 0000477A 3DE803                   cmp ax, 1000
  9417 0000477D 0F8D0800                 jge .printint51542
  9418 00004781 6A20                     push 32
  9419 00004783 E8D8FD                   call prc
  9420 00004786 83C402                   add  sp, 2
  9421                                  .printint51542:
  9422 00004789 8B4604                   mov ax, [bp+4]
  9423 0000478C 83F864                   cmp ax, 100
  9424 0000478F 0F8D0800                 jge .printint51543
  9425 00004793 6A20                     push 32
  9426 00004795 E8C6FD                   call prc
  9427 00004798 83C402                   add  sp, 2
  9428                                  
  9429                                  ;-862    if (j<10) prc(32);  prunsign1(j); }
  9430                                  
  9431                                  .printint51543:
  9432 0000479B 8B4604                   mov ax, [bp+4]
  9433 0000479E 83F80A                   cmp ax, 10
  9434 000047A1 0F8D0800                 jge .printint51544
  9435 000047A5 6A20                     push 32
  9436 000047A7 E8B4FD                   call prc
  9437 000047AA 83C402                   add  sp, 2
  9438                                  .printint51544:
  9439 000047AD FF7604                   push word [bp+4]
  9440 000047B0 E86CFF                   call prunsign1
  9441 000047B3 83C402                   add  sp, 2
  9442                                  
  9443                                  ;-863 
  9444                                  
  9445                                  
  9446                                  ;-864 int fgets1() { char c; c=*fgetsp;
  9447 000047B6 C9                       LEAVE
  9448 000047B7 C3                       ret
  9449                                  ; ENDP
  9450                                  
  9451                                  fgets1:  ; *** PROC ***
  9452                                  ;Function : fgets1, Number of local variables: 1
  9453                                  ;   # type sign width addr used name   list of local variables
  9454                                  ;  200 var sign byte   864 NULL c = bp-2;
  9455 000047B8 C8020000                 ENTER  2,0
  9456 000047BC 8B1E[6200]               mov bx, [fgetsp]
  9457 000047C0 8A07                     mov al, [bx]
  9458 000047C2 B400                     mov ah, 0
  9459 000047C4 8846FE                   mov [bp-2], al
  9460                                  
  9461                                  ;-865   if (c==0) { printinputline(); if (DOS_NoBytes == 0) return 0;
  9462                                  
  9463 000047C7 8A46FE                   mov al, [bp-2]
  9464 000047CA 3C00                     cmp al, 0
  9465 000047CC 0F852A00                 jne .fgets1545
  9466 000047D0 E83700                   call printinputline
  9467 000047D3 A1[7000]                 mov ax, [DOS_NoBytes]
  9468 000047D6 83F800                   cmp ax, 0
  9469 000047D9 0F850600                 jne .fgets1546
  9470 000047DD B80000                   mov ax, 0
  9471 000047E0 E92500                   jmp .retn
  9472                                  
  9473                                  ;-866     fgetsp=&fgetsdest; c=*fgetsp; spalte=0; }
  9474                                  
  9475                                  .fgets1546:
  9476 000047E3 B80FD0                   mov ax, fgetsdest
  9477 000047E6 A3[6200]                 mov word [fgetsp], ax
  9478 000047E9 8B1E[6200]               mov bx, [fgetsp]
  9479 000047ED 8A07                     mov al, [bx]
  9480 000047EF B400                     mov ah, 0
  9481 000047F1 8846FE                   mov [bp-2], al
  9482 000047F4 B80000                   mov ax, 0
  9483 000047F7 A3[1F00]                 mov word [spalte], ax
  9484                                  
  9485                                  ;-867   fgetsp++; spalte++;  return c; }
  9486                                  
  9487                                  .fgets1545:
  9488 000047FA FF06[6200]               inc  word[fgetsp]
  9489 000047FE FF06[1F00]               inc  word[spalte]
  9490 00004802 8A46FE                   mov al, [bp-2]
  9491 00004805 E90000                   jmp .retn
  9492                                  
  9493                                  ;-868 int printinputline() { fgetsp=&fgetsdest;
  9494                                  
  9495 00004808 C9                       .retn: LEAVE
  9496 00004809 C3                       ret
  9497                                  ; ENDP
  9498                                  
  9499                                  printinputline:  ; *** PROC ***
  9500 0000480A B80FD0                   mov ax, fgetsdest
  9501 0000480D A3[6200]                 mov word [fgetsp], ax
  9502                                  
  9503                                  ;-869   do {DOS_NoBytes=readR(&DOS_ByteRead, fdin);
  9504                                  
  9505                                  .printinputline547:
  9506 00004810 FF36[1800]               push word [fdin]
  9507 00004814 8D06[7200]               lea  ax, [DOS_ByteRead]
  9508 00004818 50                       push ax
  9509 00004819 E8F8B8                   call readR
  9510 0000481C 83C404                   add  sp, 4
  9511 0000481F A3[7000]                 mov word [DOS_NoBytes], ax
  9512                                  
  9513                                  ;-870   if (DOS_NoBytes == 0) return; 
  9514                                  
  9515 00004822 A1[7000]                 mov ax, [DOS_NoBytes]
  9516 00004825 83F800                   cmp ax, 0
  9517 00004828 0F850300                 jne .printinputline548
  9518 0000482C E95400                   jmp .retn
  9519                                  
  9520                                  ;-871     *fgetsp=DOS_ByteRead; fgetsp++;} 
  9521                                  
  9522                                  .printinputline548:
  9523 0000482F A0[7200]                 mov al, [DOS_ByteRead]
  9524 00004832 8B1E[6200]               mov  bx, [fgetsp]
  9525 00004836 8807                     mov  [bx], al
  9526 00004838 FF06[6200]               inc  word[fgetsp]
  9527                                  
  9528                                  ;-872   while (DOS_ByteRead != 10); *fgetsp=0;
  9529                                  
  9530 0000483C A0[7200]                 mov al, [DOS_ByteRead]
  9531 0000483F 3C0A                     cmp al, 10
  9532 00004841 0F840200                 je  .printinputline549
  9533 00004845 EBC9                     jmp .printinputline547
  9534                                  .printinputline549:
  9535 00004847 B80000                   mov ax, 0
  9536 0000484A 8B1E[6200]               mov  bx, [fgetsp]
  9537 0000484E 8807                     mov  [bx], al
  9538                                  
  9539                                  ;-873     if (fdout) { prs("\n\n;-"); prunsign1(lineno); prc(' '); lineno++;
  9540                                  
  9541 00004850 A1[1A00]                 mov ax, [fdout]
  9542 00004853 08C0                     or  al, al
  9543 00004855 0F842A00                 je .printinputline550
  9544 00004859 68[8448]                 push printinputline_0
  9545 0000485C E866FD                   call prs
  9546 0000485F 83C402                   add  sp, 2
  9547 00004862 FF36[6600]               push word [lineno]
  9548 00004866 E8B6FE                   call prunsign1
  9549 00004869 83C402                   add  sp, 2
  9550 0000486C 6A20                     push 32
  9551 0000486E E8EDFC                   call prc
  9552 00004871 83C402                   add  sp, 2
  9553 00004874 FF06[6600]               inc  word[lineno]
  9554                                  
  9555                                  ;-874       prscomment(&fgetsdest);}
  9556                                  
  9557 00004878 8D060FD0                 lea  ax, [fgetsdest]
  9558 0000487C 50                       push ax
  9559 0000487D E809FD                   call prscomment
  9560 00004880 83C402                   add  sp, 2
  9561                                  
  9562                                  ;-875 }
  9563                                  
  9564                                  .printinputline550:
  9565                                  
  9566                                  ;-876 int end1(int n) {fcloseR(fdin); fcloseR(fdout); exitR(n); }
  9567                                  
  9568                                   .retn:
  9569 00004883 C3                       ret
  9570                                  ; ENDP
  9571 00004884 5C6E5C6E3B2D00          printinputline_0 db "\n\n;-",0
  9572                                  
  9573                                  end1:  ; *** PROC ***
  9574                                  ;Function : end1, Number of local variables: 1
  9575                                  ;   # type sign width addr used name   list of local variables
  9576                                  ;  200 var sign word   876 NULL n = bp+4;
  9577 0000488B C8000000                 ENTER  0,0
  9578 0000488F FF36[1800]               push word [fdin]
  9579 00004893 E861B8                   call fcloseR
  9580 00004896 83C402                   add  sp, 2
  9581 00004899 FF36[1A00]               push word [fdout]
  9582 0000489D E857B8                   call fcloseR
  9583 000048A0 83C402                   add  sp, 2
  9584 000048A3 FF7604                   push word [bp+4]
  9585 000048A6 E85DB8                   call exitR
  9586 000048A9 83C402                   add  sp, 2
  9587                                  
  9588                                  ;-877 int error1(char *s) { 
  9589 000048AC C9                       LEAVE
  9590 000048AD C3                       ret
  9591                                  ; ENDP
  9592                                  
  9593                                  error1:  ; *** PROC ***
  9594                                  
  9595                                  ;-878   lineno--;
  9596                                  
  9597                                  ;Function : error1, Number of local variables: 1
  9598                                  ;   # type sign width addr used name   list of local variables
  9599                                  ;  200 ptr sign byte   877 NULL s = bp+4;
  9600 000048AE C8000000                 ENTER  0,0
  9601 000048B2 FF0E[6600]               dec  word[lineno]
  9602                                  
  9603                                  ;-879   prnl(); prscomment(&fgetsdest);
  9604                                  
  9605 000048B6 E8FEFC                   call prnl
  9606 000048B9 8D060FD0                 lea  ax, [fgetsdest]
  9607 000048BD 50                       push ax
  9608 000048BE E8C8FC                   call prscomment
  9609 000048C1 83C402                   add  sp, 2
  9610                                  
  9611                                  ;-880   prs(";Line: "); prunsign1(lineno);
  9612                                  
  9613 000048C4 68[5749]                 push error1_0
  9614 000048C7 E8FBFC                   call prs
  9615 000048CA 83C402                   add  sp, 2
  9616 000048CD FF36[6600]               push word [lineno]
  9617 000048D1 E84BFE                   call prunsign1
  9618 000048D4 83C402                   add  sp, 2
  9619                                  
  9620                                  ;-881   prs(" ************** ERROR: "); prs(s);
  9621                                  
  9622 000048D7 68[5F49]                 push error1_1
  9623 000048DA E8E8FC                   call prs
  9624 000048DD 83C402                   add  sp, 2
  9625 000048E0 FF7604                   push word [bp+4]
  9626 000048E3 E8DFFC                   call prs
  9627 000048E6 83C402                   add  sp, 2
  9628                                  
  9629                                  ;-882   prs("  in column: "); pint1(spalte);
  9630                                  
  9631 000048E9 68[7749]                 push error1_2
  9632 000048EC E8D6FC                   call prs
  9633 000048EF 83C402                   add  sp, 2
  9634 000048F2 FF36[1F00]               push word [spalte]
  9635 000048F6 E8C3FD                   call pint1
  9636 000048F9 83C402                   add  sp, 2
  9637                                  
  9638                                  ;-883   prs("\nToken: "); prunsign1(token); prs(", globC: "); prc(globC);
  9639                                  
  9640 000048FC 68[8549]                 push error1_3
  9641 000048FF E8C3FC                   call prs
  9642 00004902 83C402                   add  sp, 2
  9643 00004905 FF36[1C00]               push word [token]
  9644 00004909 E813FE                   call prunsign1
  9645 0000490C 83C402                   add  sp, 2
  9646 0000490F 68[8F49]                 push error1_4
  9647 00004912 E8B0FC                   call prs
  9648 00004915 83C402                   add  sp, 2
  9649 00004918 A0[1E00]                 mov al, byte [globC]
  9650 0000491B B400                     mov ah, 0
  9651 0000491D 50                       push ax
  9652 0000491E E83DFC                   call prc
  9653 00004921 83C402                   add  sp, 2
  9654                                  
  9655                                  ;-884   prs(", thechar: "); pint1(thechar); prs(", symbol: "); prs(symbol);
  9656                                  
  9657 00004924 68[9949]                 push error1_5
  9658 00004927 E89BFC                   call prs
  9659 0000492A 83C402                   add  sp, 2
  9660 0000492D A0[2100]                 mov al, byte [thechar]
  9661 00004930 B400                     mov ah, 0
  9662 00004932 50                       push ax
  9663 00004933 E886FD                   call pint1
  9664 00004936 83C402                   add  sp, 2
  9665 00004939 68[A549]                 push error1_6
  9666 0000493C E886FC                   call prs
  9667 0000493F 83C402                   add  sp, 2
  9668 00004942 8D062B81                 lea  ax, [symbol]
  9669 00004946 50                       push ax
  9670 00004947 E87BFC                   call prs
  9671 0000494A 83C402                   add  sp, 2
  9672                                  
  9673                                  ;-885   end1(1); }
  9674                                  
  9675 0000494D 6A01                     push 1
  9676 0000494F E839FF                   call end1
  9677 00004952 83C402                   add  sp, 2
  9678                                  
  9679                                  ;-886 int listproc() {int i; 
  9680 00004955 C9                       LEAVE
  9681 00004956 C3                       ret
  9682                                  ; ENDP
  9683 00004957 3B4C696E653A2000        error1_0 db ";Line: ",0
  9684 0000495F 202A2A2A2A2A2A2A2A-     error1_1 db " ************** ERROR: ",0
  9685 00004968 2A2A2A2A2A2A204552-
  9686 00004971 524F523A2000       
  9687 00004977 2020696E20636F6C75-     error1_2 db "  in column: ",0
  9688 00004980 6D6E3A2000         
  9689 00004985 5C6E546F6B656E3A20-     error1_3 db "\nToken: ",0
  9690 0000498E 00                 
  9691 0000498F 2C20676C6F62433A20-     error1_4 db ", globC: ",0
  9692 00004998 00                 
  9693 00004999 2C2074686563686172-     error1_5 db ", thechar: ",0
  9694 000049A2 3A2000             
  9695 000049A5 2C2073796D626F6C3A-     error1_6 db ", symbol: ",0
  9696 000049AE 2000               
  9697                                  
  9698                                  listproc:  ; *** PROC ***
  9699                                  
  9700                                  ;-887   if (LTop > LSTART) {
  9701                                  
  9702                                  ;Function : listproc, Number of local variables: 1
  9703                                  ;   # type sign width addr used name   list of local variables
  9704                                  ;  200 var sign word   886 NULL i = bp-2;
  9705 000049B0 C8020000                 ENTER  2,0
  9706 000049B4 A1[2C00]                 mov ax, [LTop]
  9707 000049B7 3DC800                   cmp ax, 200
  9708 000049BA 0F8E5700                 jle .listproc551
  9709                                  
  9710                                  ;-888   prs("\n;Function : "); prs(fname);
  9711                                  
  9712 000049BE 68[174A]                 push listproc_0
  9713 000049C1 E801FC                   call prs
  9714 000049C4 83C402                   add  sp, 2
  9715 000049C7 8D06AB81                 lea  ax, [fname]
  9716 000049CB 50                       push ax
  9717 000049CC E8F6FB                   call prs
  9718 000049CF 83C402                   add  sp, 2
  9719                                  
  9720                                  ;-889   prs(", Number of local variables: "); i=LTop - LSTART; prunsign1(i);
  9721                                  
  9722 000049D2 68[264A]                 push listproc_1
  9723 000049D5 E8EDFB                   call prs
  9724 000049D8 83C402                   add  sp, 2
  9725 000049DB A1[2C00]                 mov ax, [LTop]
  9726 000049DE 2DC800                   sub ax, 200
  9727 000049E1 8946FE                   mov [bp-2], ax
  9728 000049E4 FF76FE                   push word [bp-2]
  9729 000049E7 E835FD                   call prunsign1
  9730 000049EA 83C402                   add  sp, 2
  9731                                  
  9732                                  ;-890   prs("\n;   # type sign width addr used name   list of local variables");
  9733                                  
  9734 000049ED 68[444A]                 push listproc_2
  9735 000049F0 E8D2FB                   call prs
  9736 000049F3 83C402                   add  sp, 2
  9737                                  
  9738                                  ;-891     i=LSTART; 
  9739                                  
  9740 000049F6 B8C800                   mov ax, 200
  9741 000049F9 8946FE                   mov [bp-2], ax
  9742                                  
  9743                                  ;-892     while (i < LTop) { listvar(i); i++; } } 
  9744                                  
  9745                                  .listproc552:
  9746 000049FC 8B46FE                   mov ax, [bp-2]
  9747 000049FF 3B06[2C00]               cmp ax, [LTop]
  9748 00004A03 0F8D0E00                 jge .listproc553
  9749 00004A07 FF76FE                   push word [bp-2]
  9750 00004A0A E87800                   call listvar
  9751 00004A0D 83C402                   add  sp, 2
  9752 00004A10 FF46FE                   inc  word[bp-2]
  9753 00004A13 EBE7                     jmp .listproc552
  9754                                  .listproc553:
  9755                                  
  9756                                  ;-893 }
  9757                                  
  9758                                  .listproc551:
  9759                                  
  9760                                  ;-894 int listvar(unsigned int i) {unsigned int j; char c;
  9761 00004A15 C9                       LEAVE
  9762 00004A16 C3                       ret
  9763                                  ; ENDP
  9764 00004A17 5C6E3B46756E637469-     listproc_0 db "\n;Function : ",0
  9765 00004A20 6F6E203A2000       
  9766 00004A26 2C204E756D62657220-     listproc_1 db ", Number of local variables: ",0
  9767 00004A2F 6F66206C6F63616C20-
  9768 00004A38 7661726961626C6573-
  9769 00004A41 3A2000             
  9770 00004A44 5C6E3B202020232074-     listproc_2 db "\n;   # type sign width addr used name   list of local variables",0
  9771 00004A4D 797065207369676E20-
  9772 00004A56 776964746820616464-
  9773 00004A5F 722075736564206E61-
  9774 00004A68 6D652020206C697374-
  9775 00004A71 206F66206C6F63616C-
  9776 00004A7A 207661726961626C65-
  9777 00004A83 7300               
  9778                                  
  9779                                  listvar:  ; *** PROC ***
  9780                                  
  9781                                  ;-895   prs("\n;"); printint51(i); prc(32);
  9782                                  
  9783                                  ;Function : listvar, Number of local variables: 3
  9784                                  ;   # type sign width addr used name   list of local variables
  9785                                  ;  200 var unsg word   894 NULL i = bp+4
  9786                                  ;  201 var unsg word   894 NULL j = bp-2
  9787                                  ;  202 var sign byte   894 NULL c = bp-4;
  9788 00004A85 C8040000                 ENTER  4,0
  9789 00004A89 68[714C]                 push listvar_0
  9790 00004A8C E836FB                   call prs
  9791 00004A8F 83C402                   add  sp, 2
  9792 00004A92 FF7604                   push word [bp+4]
  9793 00004A95 E8C9FC                   call printint51
  9794 00004A98 83C402                   add  sp, 2
  9795 00004A9B 6A20                     push 32
  9796 00004A9D E8BEFA                   call prc
  9797 00004AA0 83C402                   add  sp, 2
  9798                                  
  9799                                  ;-896   c=GType [i]; if(c=='V')prs("var ");   if(c=='*')prs("ptr ");
  9800                                  
  9801 00004AA3 8B5E04                   mov bx, [bp+4]
  9802 00004AA6 8A87B782                 mov al, [GType + bx]
  9803 00004AAA 8846FC                   mov [bp-4], al
  9804 00004AAD 8A46FC                   mov al, [bp-4]
  9805 00004AB0 3C56                     cmp al, 86
  9806 00004AB2 0F850900                 jne .listvar554
  9807 00004AB6 68[754C]                 push listvar_1
  9808 00004AB9 E809FB                   call prs
  9809 00004ABC 83C402                   add  sp, 2
  9810                                  .listvar554:
  9811 00004ABF 8A46FC                   mov al, [bp-4]
  9812 00004AC2 3C2A                     cmp al, 42
  9813 00004AC4 0F850900                 jne .listvar555
  9814 00004AC8 68[7A4C]                 push listvar_2
  9815 00004ACB E8F7FA                   call prs
  9816 00004ACE 83C402                   add  sp, 2
  9817                                  
  9818                                  ;-897                if(c=='&')prs("arr ");   if(c=='#')prs("def ");
  9819                                  
  9820                                  .listvar555:
  9821 00004AD1 8A46FC                   mov al, [bp-4]
  9822 00004AD4 3C26                     cmp al, 38
  9823 00004AD6 0F850900                 jne .listvar556
  9824 00004ADA 68[7F4C]                 push listvar_3
  9825 00004ADD E8E5FA                   call prs
  9826 00004AE0 83C402                   add  sp, 2
  9827                                  .listvar556:
  9828 00004AE3 8A46FC                   mov al, [bp-4]
  9829 00004AE6 3C23                     cmp al, 35
  9830 00004AE8 0F850900                 jne .listvar557
  9831 00004AEC 68[844C]                 push listvar_4
  9832 00004AEF E8D3FA                   call prs
  9833 00004AF2 83C402                   add  sp, 2
  9834                                  
  9835                                  ;-898   c=GSign [i]; if(c=='S')prs("sign ");  if(c=='U')prs("unsg ");
  9836                                  
  9837                                  .listvar557:
  9838 00004AF5 8B5E04                   mov bx, [bp+4]
  9839 00004AF8 8A87E383                 mov al, [GSign + bx]
  9840 00004AFC 8846FC                   mov [bp-4], al
  9841 00004AFF 8A46FC                   mov al, [bp-4]
  9842 00004B02 3C53                     cmp al, 83
  9843 00004B04 0F850900                 jne .listvar558
  9844 00004B08 68[894C]                 push listvar_5
  9845 00004B0B E8B7FA                   call prs
  9846 00004B0E 83C402                   add  sp, 2
  9847                                  .listvar558:
  9848 00004B11 8A46FC                   mov al, [bp-4]
  9849 00004B14 3C55                     cmp al, 85
  9850 00004B16 0F850900                 jne .listvar559
  9851 00004B1A 68[8F4C]                 push listvar_6
  9852 00004B1D E8A5FA                   call prs
  9853 00004B20 83C402                   add  sp, 2
  9854                                  
  9855                                  ;-899   c=GWidth[i]; if(c==  1)prs("byte " ); if(c==  2)prs("word " );
  9856                                  
  9857                                  .listvar559:
  9858 00004B23 8B5E04                   mov bx, [bp+4]
  9859 00004B26 8A870F85                 mov al, [GWidth + bx]
  9860 00004B2A 8846FC                   mov [bp-4], al
  9861 00004B2D 8A46FC                   mov al, [bp-4]
  9862 00004B30 3C01                     cmp al, 1
  9863 00004B32 0F850900                 jne .listvar560
  9864 00004B36 68[954C]                 push listvar_7
  9865 00004B39 E889FA                   call prs
  9866 00004B3C 83C402                   add  sp, 2
  9867                                  .listvar560:
  9868 00004B3F 8A46FC                   mov al, [bp-4]
  9869 00004B42 3C02                     cmp al, 2
  9870 00004B44 0F850900                 jne .listvar561
  9871 00004B48 68[9B4C]                 push listvar_8
  9872 00004B4B E877FA                   call prs
  9873 00004B4E 83C402                   add  sp, 2
  9874                                  
  9875                                  ;-900                if(c==  4)prs("dwrd " );
  9876                                  
  9877                                  .listvar561:
  9878 00004B51 8A46FC                   mov al, [bp-4]
  9879 00004B54 3C04                     cmp al, 4
  9880 00004B56 0F850900                 jne .listvar562
  9881 00004B5A 68[A14C]                 push listvar_9
  9882 00004B5D E865FA                   call prs
  9883 00004B60 83C402                   add  sp, 2
  9884                                  
  9885                                  ;-901   j=GAdr[i]; printint51(j);
  9886                                  
  9887                                  .listvar562:
  9888 00004B63 8B5E04                   mov bx, [bp+4]
  9889 00004B66 D1E3                     shl bx, 1
  9890 00004B68 8B873B86                 mov ax, [GAdr + bx]
  9891 00004B6C 8946FE                   mov [bp-2], ax
  9892 00004B6F FF76FE                   push word [bp-2]
  9893 00004B72 E8ECFB                   call printint51
  9894 00004B75 83C402                   add  sp, 2
  9895                                  
  9896                                  ;-902   j=GUsed[i]; if (j) printint51(j);
  9897                                  
  9898 00004B78 8B5E04                   mov bx, [bp+4]
  9899 00004B7B D1E3                     shl bx, 1
  9900 00004B7D 8B879388                 mov ax, [GUsed + bx]
  9901 00004B81 8946FE                   mov [bp-2], ax
  9902 00004B84 8B46FE                   mov ax, [bp-2]
  9903 00004B87 08C0                     or  al, al
  9904 00004B89 0F840C00                 je .listvar563
  9905 00004B8D FF76FE                   push word [bp-2]
  9906 00004B90 E8CEFB                   call printint51
  9907 00004B93 83C402                   add  sp, 2
  9908                                  
  9909                                  ;-903   else {if(GType[i]=='#') prs("    -"); else prs(" NULL");}
  9910                                  
  9911 00004B96 E92200                   jmp .listvar564
  9912                                  .listvar563:
  9913 00004B99 8B5E04                   mov bx, [bp+4]
  9914 00004B9C 8A87B782                 mov al, [GType + bx]
  9915 00004BA0 3C23                     cmp al, 35
  9916 00004BA2 0F850C00                 jne .listvar565
  9917 00004BA6 68[A74C]                 push listvar_10
  9918 00004BA9 E819FA                   call prs
  9919 00004BAC 83C402                   add  sp, 2
  9920 00004BAF E90900                   jmp .listvar566
  9921                                  .listvar565:
  9922 00004BB2 68[AD4C]                 push listvar_11
  9923 00004BB5 E80DFA                   call prs
  9924 00004BB8 83C402                   add  sp, 2
  9925                                  .listvar566:
  9926                                  
  9927                                  ;-904   prc(32);  pt=adrofname(i); prs(pt);
  9928                                  
  9929                                  .listvar564:
  9930 00004BBB 6A20                     push 32
  9931 00004BBD E89EF9                   call prc
  9932 00004BC0 83C402                   add  sp, 2
  9933 00004BC3 FF7604                   push word [bp+4]
  9934 00004BC6 E8CDBD                   call adrofname
  9935 00004BC9 83C402                   add  sp, 2
  9936 00004BCC A3[6A00]                 mov word [pt], ax
  9937 00004BCF FF36[6A00]               push word [pt]
  9938 00004BD3 E8EFF9                   call prs
  9939 00004BD6 83C402                   add  sp, 2
  9940                                  
  9941                                  ;-905   if(GType[i]=='#') { prc('='); j=GData[i]; prunsign1(j); }
  9942                                  
  9943 00004BD9 8B5E04                   mov bx, [bp+4]
  9944 00004BDC 8A87B782                 mov al, [GType + bx]
  9945 00004BE0 3C23                     cmp al, 35
  9946 00004BE2 0F851D00                 jne .listvar567
  9947 00004BE6 6A3D                     push 61
  9948 00004BE8 E873F9                   call prc
  9949 00004BEB 83C402                   add  sp, 2
  9950 00004BEE 8B5E04                   mov bx, [bp+4]
  9951 00004BF1 D1E3                     shl bx, 1
  9952 00004BF3 8B87EB8A                 mov ax, [GData + bx]
  9953 00004BF7 8946FE                   mov [bp-2], ax
  9954 00004BFA FF76FE                   push word [bp-2]
  9955 00004BFD E81FFB                   call prunsign1
  9956 00004C00 83C402                   add  sp, 2
  9957                                  
  9958                                  ;-906   if(GType[i]=='&') { prc('['); j=GData[i]; prunsign1(j); prc(']');}
  9959                                  
  9960                                  .listvar567:
  9961 00004C03 8B5E04                   mov bx, [bp+4]
  9962 00004C06 8A87B782                 mov al, [GType + bx]
  9963 00004C0A 3C26                     cmp al, 38
  9964 00004C0C 0F852500                 jne .listvar568
  9965 00004C10 6A5B                     push 91
  9966 00004C12 E849F9                   call prc
  9967 00004C15 83C402                   add  sp, 2
  9968 00004C18 8B5E04                   mov bx, [bp+4]
  9969 00004C1B D1E3                     shl bx, 1
  9970 00004C1D 8B87EB8A                 mov ax, [GData + bx]
  9971 00004C21 8946FE                   mov [bp-2], ax
  9972 00004C24 FF76FE                   push word [bp-2]
  9973 00004C27 E8F5FA                   call prunsign1
  9974 00004C2A 83C402                   add  sp, 2
  9975 00004C2D 6A5D                     push 93
  9976 00004C2F E82CF9                   call prc
  9977 00004C32 83C402                   add  sp, 2
  9978                                  
  9979                                  ;-907   if (i >= LSTART) { prs(" = bp"); j=GData[i];
  9980                                  
  9981                                  .listvar568:
  9982 00004C35 8B4604                   mov ax, [bp+4]
  9983 00004C38 3DC800                   cmp ax, 200 ;unsigned : 0
  9984 00004C3B 0F823000                 jb  .listvar569
  9985 00004C3F 68[B34C]                 push listvar_12
  9986 00004C42 E880F9                   call prs
  9987 00004C45 83C402                   add  sp, 2
  9988 00004C48 8B5E04                   mov bx, [bp+4]
  9989 00004C4B D1E3                     shl bx, 1
  9990 00004C4D 8B87EB8A                 mov ax, [GData + bx]
  9991 00004C51 8946FE                   mov [bp-2], ax
  9992                                  
  9993                                  ;-908     if (j > 0) prc('+'); pint1(j);  }
  9994                                  
  9995 00004C54 8B46FE                   mov ax, [bp-2]
  9996 00004C57 83F800                   cmp ax, 0
  9997 00004C5A 0F8E0800                 jle .listvar570
  9998 00004C5E 6A2B                     push 43
  9999 00004C60 E8FBF8                   call prc
 10000 00004C63 83C402                   add  sp, 2
 10001                                  .listvar570:
 10002 00004C66 FF76FE                   push word [bp-2]
 10003 00004C69 E850FA                   call pint1
 10004 00004C6C 83C402                   add  sp, 2
 10005                                  
 10006                                  ;-909 }
 10007                                  
 10008                                  .listvar569:
 10009                                  
 10010                                  ;-910 int listcall() { int i;
 10011 00004C6F C9                       LEAVE
 10012 00004C70 C3                       ret
 10013                                  ; ENDP
 10014 00004C71 5C6E3B00                listvar_0 db "\n;",0
 10015 00004C75 7661722000              listvar_1 db "var ",0
 10016 00004C7A 7074722000              listvar_2 db "ptr ",0
 10017 00004C7F 6172722000              listvar_3 db "arr ",0
 10018 00004C84 6465662000              listvar_4 db "def ",0
 10019 00004C89 7369676E2000            listvar_5 db "sign ",0
 10020 00004C8F 756E73672000            listvar_6 db "unsg ",0
 10021 00004C95 627974652000            listvar_7 db "byte ",0
 10022 00004C9B 776F72642000            listvar_8 db "word ",0
 10023 00004CA1 647772642000            listvar_9 db "dwrd ",0
 10024 00004CA7 202020202D00            listvar_10 db "    -",0
 10025 00004CAD 204E554C4C00            listvar_11 db " NULL",0
 10026 00004CB3 203D20627000            listvar_12 db " = bp",0
 10027                                  
 10028                                  listcall:  ; *** PROC ***
 10029                                  
 10030                                  ;-911   prs("\n\n;    #  addr name   list of CALLs\n");
 10031                                  
 10032                                  ;Function : listcall, Number of local variables: 1
 10033                                  ;   # type sign width addr used name   list of local variables
 10034                                  ;  200 var sign word   910 NULL i = bp-2;
 10035 00004CB9 C8020000                 ENTER  2,0
 10036 00004CBD 68[E74C]                 push listcall_0
 10037 00004CC0 E802F9                   call prs
 10038 00004CC3 83C402                   add  sp, 2
 10039                                  
 10040                                  ;-912   i=0;  while (i< CTop) { calllisting(i); i++; } }
 10041                                  
 10042 00004CC6 B80000                   mov ax, 0
 10043 00004CC9 8946FE                   mov [bp-2], ax
 10044                                  .listcall571:
 10045 00004CCC 8B46FE                   mov ax, [bp-2]
 10046 00004CCF 3B06[3D00]               cmp ax, [CTop]
 10047 00004CD3 0F8D0E00                 jge .listcall572
 10048 00004CD7 FF76FE                   push word [bp-2]
 10049 00004CDA E83200                   call calllisting
 10050 00004CDD 83C402                   add  sp, 2
 10051 00004CE0 FF46FE                   inc  word[bp-2]
 10052 00004CE3 EBE7                     jmp .listcall571
 10053                                  .listcall572:
 10054                                  
 10055                                  ;-913 int calllisting(int i) {char c; int j;
 10056 00004CE5 C9                       LEAVE
 10057 00004CE6 C3                       ret
 10058                                  ; ENDP
 10059 00004CE7 5C6E5C6E3B20202020-     listcall_0 db "\n\n;    #  addr name   list of CALLs\n",0
 10060 00004CF0 23202061646472206E-
 10061 00004CF9 616D652020206C6973-
 10062 00004D02 74206F662043414C4C-
 10063 00004D0B 735C6E00           
 10064                                  
 10065                                  calllisting:  ; *** PROC ***
 10066                                  
 10067                                  ;-914   prs("\n;"); printint51(i); prc(32);
 10068                                  
 10069                                  ;Function : calllisting, Number of local variables: 3
 10070                                  ;   # type sign width addr used name   list of local variables
 10071                                  ;  200 var sign word   913 NULL i = bp+4
 10072                                  ;  201 var sign byte   913 NULL c = bp-2
 10073                                  ;  202 var sign word   913 NULL j = bp-4;
 10074 00004D0F C8040000                 ENTER  4,0
 10075 00004D13 68[814D]                 push calllisting_0
 10076 00004D16 E8ACF8                   call prs
 10077 00004D19 83C402                   add  sp, 2
 10078 00004D1C FF7604                   push word [bp+4]
 10079 00004D1F E83FFA                   call printint51
 10080 00004D22 83C402                   add  sp, 2
 10081 00004D25 6A20                     push 32
 10082 00004D27 E834F8                   call prc
 10083 00004D2A 83C402                   add  sp, 2
 10084                                  
 10085                                  ;-915   c=CType [i]; if(c==0)prs("unresolved ");
 10086                                  
 10087 00004D2D 8B5E04                   mov bx, [bp+4]
 10088 00004D30 8A872FA1                 mov al, [CType + bx]
 10089 00004D34 8846FE                   mov [bp-2], al
 10090 00004D37 8A46FE                   mov al, [bp-2]
 10091 00004D3A 3C00                     cmp al, 0
 10092 00004D3C 0F850900                 jne .calllisting573
 10093 00004D40 68[854D]                 push calllisting_1
 10094 00004D43 E87FF8                   call prs
 10095 00004D46 83C402                   add  sp, 2
 10096                                  
 10097                                  ;-916   j=CAdr[i];            printint51(j); prc(32);
 10098                                  
 10099                                  .calllisting573:
 10100 00004D49 8B5E04                   mov bx, [bp+4]
 10101 00004D4C D1E3                     shl bx, 1
 10102 00004D4E 8B8757AB                 mov ax, [CAdr + bx]
 10103 00004D52 8946FC                   mov [bp-4], ax
 10104 00004D55 FF76FC                   push word [bp-4]
 10105 00004D58 E806FA                   call printint51
 10106 00004D5B 83C402                   add  sp, 2
 10107 00004D5E 6A20                     push 32
 10108 00004D60 E8FBF7                   call prc
 10109 00004D63 83C402                   add  sp, 2
 10110                                  
 10111                                  ;-917   from_far(NameA, j);   prs(NameA);
 10112                                  
 10113 00004D66 FF76FC                   push word [bp-4]
 10114 00004D69 8D06[3F00]               lea  ax, [NameA]
 10115 00004D6D 50                       push ax
 10116 00004D6E E8B206                   call from_far
 10117 00004D71 83C404                   add  sp, 4
 10118 00004D74 8D06[3F00]               lea  ax, [NameA]
 10119 00004D78 50                       push ax
 10120 00004D79 E849F8                   call prs
 10121 00004D7C 83C402                   add  sp, 2
 10122                                  
 10123                                  ;-918 }
 10124                                  
 10125                                  
 10126                                  ;-919 int countcalls(int f) { unsigned int i;
 10127 00004D7F C9                       LEAVE
 10128 00004D80 C3                       ret
 10129                                  ; ENDP
 10130 00004D81 5C6E3B00                calllisting_0 db "\n;",0
 10131 00004D85 756E7265736F6C7665-     calllisting_1 db "unresolved ",0
 10132 00004D8E 642000             
 10133                                  
 10134                                  countcalls:  ; *** PROC ***
 10135                                  
 10136                                  ;-920   pt=adrF(FNameField, f);
 10137                                  
 10138                                  ;Function : countcalls, Number of local variables: 2
 10139                                  ;   # type sign width addr used name   list of local variables
 10140                                  ;  200 var sign word   919 NULL f = bp+4
 10141                                  ;  201 var unsg word   919 NULL i = bp-2;
 10142 00004D91 C8020000                 ENTER  2,0
 10143 00004D95 FF7604                   push word [bp+4]
 10144 00004D98 8D064FBD                 lea  ax, [FNameField]
 10145 00004D9C 50                       push ax
 10146 00004D9D E80ABC                   call adrF
 10147 00004DA0 83C404                   add  sp, 4
 10148 00004DA3 A3[6A00]                 mov word [pt], ax
 10149                                  
 10150                                  ;-921   i=0;  while (i < CTop) {
 10151                                  
 10152 00004DA6 B80000                   mov ax, 0
 10153 00004DA9 8946FE                   mov [bp-2], ax
 10154                                  .countcalls574:
 10155 00004DAC 8B46FE                   mov ax, [bp-2]
 10156 00004DAF 3B06[3D00]               cmp ax, [CTop]
 10157 00004DB3 0F8D4A00                 jge .countcalls575
 10158                                  
 10159                                  ;-922     p1=CAdr[i];
 10160                                  
 10161 00004DB7 8B5EFE                   mov bx, [bp-2]
 10162 00004DBA D1E3                     shl bx, 1
 10163 00004DBC 8B8757AB                 mov ax, [CAdr + bx]
 10164 00004DC0 A3[6C00]                 mov word [p1], ax
 10165                                  
 10166                                  ;-923     from_far(NameA, p1);
 10167                                  
 10168 00004DC3 FF36[6C00]               push word [p1]
 10169 00004DC7 8D06[3F00]               lea  ax, [NameA]
 10170 00004DCB 50                       push ax
 10171 00004DCC E85406                   call from_far
 10172 00004DCF 83C404                   add  sp, 4
 10173                                  
 10174                                  ;-924     if (eqstr(pt,NameA))  FCalls[f] = FCalls[f] + 1;
 10175                                  
 10176 00004DD2 8D06[3F00]               lea  ax, [NameA]
 10177 00004DD6 50                       push ax
 10178 00004DD7 FF36[6A00]               push word [pt]
 10179 00004DDB E8CDB3                   call eqstr
 10180 00004DDE 83C404                   add  sp, 4
 10181 00004DE1 08C0                     or  al, al
 10182 00004DE3 0F841500                 je .countcalls576
 10183 00004DE7 8B5E04                   mov bx, [bp+4]
 10184 00004DEA D1E3                     shl bx, 1
 10185 00004DEC 8B87F7BA                 mov ax, [FCalls + bx]
 10186 00004DF0 83C001                   add ax, 1
 10187 00004DF3 8B5E04                   mov bx, [bp+4]
 10188 00004DF6 D1E3                     shl bx, 1
 10189 00004DF8 8987F7BA                 mov [FCalls+bx], ax
 10190                                  
 10191                                  ;-925     i++; }
 10192                                  
 10193                                  .countcalls576:
 10194 00004DFC FF46FE                   inc  word[bp-2]
 10195                                  
 10196                                  ;-926 }
 10197                                  
 10198 00004DFF EBAB                     jmp .countcalls574
 10199                                  .countcalls575:
 10200                                  
 10201                                  ;-927 int listfunc() { int i;
 10202 00004E01 C9                       LEAVE
 10203 00004E02 C3                       ret
 10204                                  ; ENDP
 10205                                  
 10206                                  listfunc:  ; *** PROC ***
 10207                                  
 10208                                  ;-928   prs("\n\n\n;   # Calls Line Width  Name   list of functions\n");
 10209                                  
 10210                                  ;Function : listfunc, Number of local variables: 1
 10211                                  ;   # type sign width addr used name   list of local variables
 10212                                  ;  200 var sign word   927 NULL i = bp-2;
 10213 00004E03 C8020000                 ENTER  2,0
 10214 00004E07 68[504E]                 push listfunc_0
 10215 00004E0A E8B8F7                   call prs
 10216 00004E0D 83C402                   add  sp, 2
 10217                                  
 10218                                  ;-929   i=0;  while (i < FTop) { countcalls (i); i++; } 
 10219                                  
 10220 00004E10 B80000                   mov ax, 0
 10221 00004E13 8946FE                   mov [bp-2], ax
 10222                                  .listfunc577:
 10223 00004E16 8B46FE                   mov ax, [bp-2]
 10224 00004E19 3B06[3B00]               cmp ax, [FTop]
 10225 00004E1D 0F8D0E00                 jge .listfunc578
 10226 00004E21 FF76FE                   push word [bp-2]
 10227 00004E24 E86AFF                   call countcalls
 10228 00004E27 83C402                   add  sp, 2
 10229 00004E2A FF46FE                   inc  word[bp-2]
 10230                                  
 10231                                  ;-930   i=0;  while (i < FTop) { funclisting(i); i++; } }
 10232                                  
 10233 00004E2D EBE7                     jmp .listfunc577
 10234                                  .listfunc578:
 10235 00004E2F B80000                   mov ax, 0
 10236 00004E32 8946FE                   mov [bp-2], ax
 10237                                  .listfunc579:
 10238 00004E35 8B46FE                   mov ax, [bp-2]
 10239 00004E38 3B06[3B00]               cmp ax, [FTop]
 10240 00004E3C 0F8D0E00                 jge .listfunc580
 10241 00004E40 FF76FE                   push word [bp-2]
 10242 00004E43 E84300                   call funclisting
 10243 00004E46 83C402                   add  sp, 2
 10244 00004E49 FF46FE                   inc  word[bp-2]
 10245 00004E4C EBE7                     jmp .listfunc579
 10246                                  .listfunc580:
 10247                                  
 10248                                  ;-931 int funclisting(int i) {int j;  char c;
 10249 00004E4E C9                       LEAVE
 10250 00004E4F C3                       ret
 10251                                  ; ENDP
 10252 00004E50 5C6E5C6E5C6E3B2020-     listfunc_0 db "\n\n\n;   # Calls Line Width  Name   list of functions\n",0
 10253 00004E59 20232043616C6C7320-
 10254 00004E62 4C696E652057696474-
 10255 00004E6B 6820204E616D652020-
 10256 00004E74 206C697374206F6620-
 10257 00004E7D 66756E6374696F6E73-
 10258 00004E86 5C6E00             
 10259                                  
 10260                                  funclisting:  ; *** PROC ***
 10261                                  
 10262                                  ;-932   prs("\n;");    printint51(i);
 10263                                  
 10264                                  ;Function : funclisting, Number of local variables: 3
 10265                                  ;   # type sign width addr used name   list of local variables
 10266                                  ;  200 var sign word   931 NULL i = bp+4
 10267                                  ;  201 var sign word   931 NULL j = bp-2
 10268                                  ;  202 var sign byte   931 NULL c = bp-4;
 10269 00004E89 C8040000                 ENTER  4,0
 10270 00004E8D 68[654F]                 push funclisting_0
 10271 00004E90 E832F7                   call prs
 10272 00004E93 83C402                   add  sp, 2
 10273 00004E96 FF7604                   push word [bp+4]
 10274 00004E99 E8C5F8                   call printint51
 10275 00004E9C 83C402                   add  sp, 2
 10276                                  
 10277                                  ;-933   j = FCalls[i]; if (j) printint51(j); else prs(" NULL");
 10278                                  
 10279 00004E9F 8B5E04                   mov bx, [bp+4]
 10280 00004EA2 D1E3                     shl bx, 1
 10281 00004EA4 8B87F7BA                 mov ax, [FCalls + bx]
 10282 00004EA8 8946FE                   mov [bp-2], ax
 10283 00004EAB 8B46FE                   mov ax, [bp-2]
 10284 00004EAE 08C0                     or  al, al
 10285 00004EB0 0F840C00                 je .funclisting581
 10286 00004EB4 FF76FE                   push word [bp-2]
 10287 00004EB7 E8A7F8                   call printint51
 10288 00004EBA 83C402                   add  sp, 2
 10289 00004EBD E90900                   jmp .funclisting582
 10290                                  .funclisting581:
 10291 00004EC0 68[694F]                 push funclisting_1
 10292 00004EC3 E8FFF6                   call prs
 10293 00004EC6 83C402                   add  sp, 2
 10294                                  
 10295                                  ;-934   j = FAdr[i];   printint51(j); prc(32);
 10296                                  
 10297                                  .funclisting582:
 10298 00004EC9 8B5E04                   mov bx, [bp+4]
 10299 00004ECC D1E3                     shl bx, 1
 10300 00004ECE 8B87FFA8                 mov ax, [FAdr + bx]
 10301 00004ED2 8946FE                   mov [bp-2], ax
 10302 00004ED5 FF76FE                   push word [bp-2]
 10303 00004ED8 E886F8                   call printint51
 10304 00004EDB 83C402                   add  sp, 2
 10305 00004EDE 6A20                     push 32
 10306 00004EE0 E87BF6                   call prc
 10307 00004EE3 83C402                   add  sp, 2
 10308                                  
 10309                                  ;-935   c=FType[i];
 10310                                  
 10311 00004EE6 8B5E04                   mov bx, [bp+4]
 10312 00004EE9 8A8703A0                 mov al, [FType + bx]
 10313 00004EED 8846FC                   mov [bp-4], al
 10314                                  
 10315                                  ;-936   if(c=='V')prs("void " );    if(c=='B')prs("byte " );
 10316                                  
 10317 00004EF0 8A46FC                   mov al, [bp-4]
 10318 00004EF3 3C56                     cmp al, 86
 10319 00004EF5 0F850900                 jne .funclisting583
 10320 00004EF9 68[6F4F]                 push funclisting_2
 10321 00004EFC E8C6F6                   call prs
 10322 00004EFF 83C402                   add  sp, 2
 10323                                  .funclisting583:
 10324 00004F02 8A46FC                   mov al, [bp-4]
 10325 00004F05 3C42                     cmp al, 66
 10326 00004F07 0F850900                 jne .funclisting584
 10327 00004F0B 68[754F]                 push funclisting_3
 10328 00004F0E E8B4F6                   call prs
 10329 00004F11 83C402                   add  sp, 2
 10330                                  
 10331                                  ;-937   if(c=='W')prs("word " );    if(c=='D')prs("dwrd " );
 10332                                  
 10333                                  .funclisting584:
 10334 00004F14 8A46FC                   mov al, [bp-4]
 10335 00004F17 3C57                     cmp al, 87
 10336 00004F19 0F850900                 jne .funclisting585
 10337 00004F1D 68[7B4F]                 push funclisting_4
 10338 00004F20 E8A2F6                   call prs
 10339 00004F23 83C402                   add  sp, 2
 10340                                  .funclisting585:
 10341 00004F26 8A46FC                   mov al, [bp-4]
 10342 00004F29 3C44                     cmp al, 68
 10343 00004F2B 0F850900                 jne .funclisting586
 10344 00004F2F 68[814F]                 push funclisting_5
 10345 00004F32 E890F6                   call prs
 10346 00004F35 83C402                   add  sp, 2
 10347                                  
 10348                                  ;-938   prc(32); prc(32);
 10349                                  
 10350                                  .funclisting586:
 10351 00004F38 6A20                     push 32
 10352 00004F3A E821F6                   call prc
 10353 00004F3D 83C402                   add  sp, 2
 10354 00004F40 6A20                     push 32
 10355 00004F42 E819F6                   call prc
 10356 00004F45 83C402                   add  sp, 2
 10357                                  
 10358                                  ;-939   pt=adrF(FNameField, i); prs(pt);
 10359                                  
 10360 00004F48 FF7604                   push word [bp+4]
 10361 00004F4B 8D064FBD                 lea  ax, [FNameField]
 10362 00004F4F 50                       push ax
 10363 00004F50 E857BA                   call adrF
 10364 00004F53 83C404                   add  sp, 4
 10365 00004F56 A3[6A00]                 mov word [pt], ax
 10366 00004F59 FF36[6A00]               push word [pt]
 10367 00004F5D E865F6                   call prs
 10368 00004F60 83C402                   add  sp, 2
 10369                                  
 10370                                  ;-940 }
 10371                                  
 10372                                  
 10373                                  ;-941 unsigned int MAXUI=65535;
 10374 00004F63 C9                       LEAVE
 10375 00004F64 C3                       ret
 10376                                  ; ENDP
 10377 00004F65 5C6E3B00                funclisting_0 db "\n;",0
 10378 00004F69 204E554C4C00            funclisting_1 db " NULL",0
 10379 00004F6F 766F69642000            funclisting_2 db "void ",0
 10380 00004F75 627974652000            funclisting_3 db "byte ",0
 10381 00004F7B 776F72642000            funclisting_4 db "word ",0
 10382 00004F81 647772642000            funclisting_5 db "dwrd ",0
 10383 00004F87 FFFF                    MAXUI dw 65535
 10384                                  
 10385                                  ;-942 int epilog() {unsigned int i; 
 10386                                  
 10387                                  
 10388                                  epilog:  ; *** PROC ***
 10389                                  
 10390                                  ;-943   strcpy(symbol, "LastFunctionByt");  storefunc();
 10391                                  
 10392                                  ;Function : epilog, Number of local variables: 1
 10393                                  ;   # type sign width addr used name   list of local variables
 10394                                  ;  200 var unsg word   942 NULL i = bp-2;
 10395 00004F89 C8020000                 ENTER  2,0
 10396 00004F8D 68[BA51]                 push epilog_0
 10397 00004F90 8D062B81                 lea  ax, [symbol]
 10398 00004F94 50                       push ax
 10399 00004F95 E8E3B1                   call strcpy
 10400 00004F98 83C404                   add  sp, 4
 10401 00004F9B E8E7BC                   call storefunc
 10402                                  
 10403                                  ;-944   prs("\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret");
 10404                                  
 10405 00004F9E 68[CA51]                 push epilog_1
 10406 00004FA1 E821F6                   call prs
 10407 00004FA4 83C402                   add  sp, 2
 10408                                  
 10409                                  ;-945   prs("\n \n;   # type sign width  adr used name   list of global variables\n");
 10410                                  
 10411 00004FA7 68[F751]                 push epilog_2
 10412 00004FAA E818F6                   call prs
 10413 00004FAD 83C402                   add  sp, 2
 10414                                  
 10415                                  ;-946   i=1;
 10416                                  
 10417 00004FB0 B80100                   mov ax, 1
 10418 00004FB3 8946FE                   mov [bp-2], ax
 10419                                  
 10420                                  ;-947   while (i< GTop) { listvar(i); i++; }
 10421                                  
 10422                                  .epilog587:
 10423 00004FB6 8B46FE                   mov ax, [bp-2]
 10424 00004FB9 3B06[2A00]               cmp ax, [GTop]
 10425 00004FBD 0F8D0E00                 jge .epilog588
 10426 00004FC1 FF76FE                   push word [bp-2]
 10427 00004FC4 E8BEFA                   call listvar
 10428 00004FC7 83C402                   add  sp, 2
 10429 00004FCA FF46FE                   inc  word[bp-2]
 10430                                  
 10431                                  ;-948   listfunc();   listcall();
 10432                                  
 10433 00004FCD EBE7                     jmp .epilog587
 10434                                  .epilog588:
 10435 00004FCF E831FE                   call listfunc
 10436 00004FD2 E8E4FC                   call listcall
 10437                                  
 10438                                  ;-949 
 10439                                  
 10440                                  
 10441                                  ;-950   prs("\n;Input: "); prs(&namein);
 10442                                  
 10443 00004FD5 68[3E52]                 push epilog_3
 10444 00004FD8 E8EAF5                   call prs
 10445 00004FDB 83C402                   add  sp, 2
 10446 00004FDE 8D06EE81                 lea  ax, [namein]
 10447 00004FE2 50                       push ax
 10448 00004FE3 E8DFF5                   call prs
 10449 00004FE6 83C402                   add  sp, 2
 10450                                  
 10451                                  ;-951   prs(", List: ");   prs(&namelst);
 10452                                  
 10453 00004FE9 68[4952]                 push epilog_4
 10454 00004FEC E8D6F5                   call prs
 10455 00004FEF 83C402                   add  sp, 2
 10456 00004FF2 8D063182                 lea  ax, [namelst]
 10457 00004FF6 50                       push ax
 10458 00004FF7 E8CBF5                   call prs
 10459 00004FFA 83C402                   add  sp, 2
 10460                                  
 10461                                  ;-952   prs(",  Lines:"); printint51(lineno);
 10462                                  
 10463 00004FFD 68[5252]                 push epilog_5
 10464 00005000 E8C2F5                   call prs
 10465 00005003 83C402                   add  sp, 2
 10466 00005006 FF36[6600]               push word [lineno]
 10467 0000500A E854F7                   call printint51
 10468 0000500D 83C402                   add  sp, 2
 10469                                  
 10470                                  ;-953   prs("\n;Glob. variables:"); GTop--; printint51(GTop);
 10471                                  
 10472 00005010 68[5C52]                 push epilog_6
 10473 00005013 E8AFF5                   call prs
 10474 00005016 83C402                   add  sp, 2
 10475 00005019 FF0E[2A00]               dec  word[GTop]
 10476 0000501D FF36[2A00]               push word [GTop]
 10477 00005021 E83DF7                   call printint51
 10478 00005024 83C402                   add  sp, 2
 10479                                  
 10480                                  ;-954   prs(" max.:"); printint51(LSTART);
 10481                                  
 10482 00005027 68[7052]                 push epilog_7
 10483 0000502A E898F5                   call prs
 10484 0000502D 83C402                   add  sp, 2
 10485 00005030 68C800                   push 200
 10486 00005033 E82BF7                   call printint51
 10487 00005036 83C402                   add  sp, 2
 10488                                  
 10489                                  ;-955   prs("\n;Functions      :"); printint51(FTop);
 10490                                  
 10491 00005039 68[7752]                 push epilog_8
 10492 0000503C E886F5                   call prs
 10493 0000503F 83C402                   add  sp, 2
 10494 00005042 FF36[3B00]               push word [FTop]
 10495 00005046 E818F7                   call printint51
 10496 00005049 83C402                   add  sp, 2
 10497                                  
 10498                                  ;-956   prs(" max.:"); printint51(FUNCMAX);
 10499                                  
 10500 0000504C 68[8B52]                 push epilog_9
 10501 0000504F E873F5                   call prs
 10502 00005052 83C402                   add  sp, 2
 10503 00005055 682C01                   push 300
 10504 00005058 E806F7                   call printint51
 10505 0000505B 83C402                   add  sp, 2
 10506                                  
 10507                                  ;-957   prs("\n;Calls          :"); printint51(CTop);
 10508                                  
 10509 0000505E 68[9252]                 push epilog_10
 10510 00005061 E861F5                   call prs
 10511 00005064 83C402                   add  sp, 2
 10512 00005067 FF36[3D00]               push word [CTop]
 10513 0000506B E8F3F6                   call printint51
 10514 0000506E 83C402                   add  sp, 2
 10515                                  
 10516                                  ;-958   prs(" max.:"); printint51(CALLMAX);
 10517                                  
 10518 00005071 68[A652]                 push epilog_11
 10519 00005074 E84EF5                   call prs
 10520 00005077 83C402                   add  sp, 2
 10521 0000507A 68D007                   push 2000
 10522 0000507D E8E1F6                   call printint51
 10523 00005080 83C402                   add  sp, 2
 10524                                  
 10525                                  ;-959   prs(", NameField:"); printint51(CNameTop);
 10526                                  
 10527 00005083 68[AD52]                 push epilog_12
 10528 00005086 E83CF5                   call prs
 10529 00005089 83C402                   add  sp, 2
 10530 0000508C FF36[6000]               push word [CNameTop]
 10531 00005090 E8CEF6                   call printint51
 10532 00005093 83C402                   add  sp, 2
 10533                                  
 10534                                  ;-960   prs(" max.:"); printint51(65535);
 10535                                  
 10536 00005096 68[BA52]                 push epilog_13
 10537 00005099 E829F5                   call prs
 10538 0000509C 83C402                   add  sp, 2
 10539 0000509F 6AFF                     push -1
 10540 000050A1 E8BDF6                   call printint51
 10541 000050A4 83C402                   add  sp, 2
 10542                                  
 10543                                  ;-961 //  prs(", segE:"); printint51(segE);
 10544                                  
 10545                                  
 10546                                  ;-962   __asm{call LastFunctionByt}  _ i=ax;
 10547                                  
 10548 000050A7 E89903                  call LastFunctionByt
 10549 000050AA 8946FE                  mov [bp-2], ax
 10550                                  
 10551                                  ;-963   prs("\n;Code until     :"); printint51(i);
 10552                                  
 10553 000050AD 68[C152]                 push epilog_14
 10554 000050B0 E812F5                   call prs
 10555 000050B3 83C402                   add  sp, 2
 10556 000050B6 FF76FE                   push word [bp-2]
 10557 000050B9 E8A5F6                   call printint51
 10558 000050BC 83C402                   add  sp, 2
 10559                                  
 10560                                  ;-964   prs(" max.: "); printint51(ORGDATAORIG); i=ORGDATAORIG-i; prs(", free:");
 10561                                  
 10562 000050BF 68[D552]                 push epilog_15
 10563 000050C2 E800F5                   call prs
 10564 000050C5 83C402                   add  sp, 2
 10565 000050C8 FF36[0E00]               push word [ORGDATAORIG]
 10566 000050CC E892F6                   call printint51
 10567 000050CF 83C402                   add  sp, 2
 10568 000050D2 A1[0E00]                 mov ax, [ORGDATAORIG]
 10569 000050D5 2B46FE                   sub ax, [bp-2]
 10570 000050D8 8946FE                   mov [bp-2], ax
 10571 000050DB 68[DD52]                 push epilog_16
 10572 000050DE E8E4F4                   call prs
 10573 000050E1 83C402                   add  sp, 2
 10574                                  
 10575                                  ;-965   printint51(i); if (i <= 1000)prs(" *** Warning *** Code area too small");
 10576                                  
 10577 000050E4 FF76FE                   push word [bp-2]
 10578 000050E7 E877F6                   call printint51
 10579 000050EA 83C402                   add  sp, 2
 10580 000050ED 8B46FE                   mov ax, [bp-2]
 10581 000050F0 3DE803                   cmp ax, 1000
 10582 000050F3 0F870900                 ja  .epilog589
 10583 000050F7 68[E552]                 push epilog_17
 10584 000050FA E8C8F4                   call prs
 10585 000050FD 83C402                   add  sp, 2
 10586                                  
 10587                                  ;-966   prs("\n;Data (HeapEnd) :"); prunsign1(orgData); i=MAXUI-orgData;
 10588                                  
 10589                                  .epilog589:
 10590 00005100 68[0A53]                 push epilog_18
 10591 00005103 E8BFF4                   call prs
 10592 00005106 83C402                   add  sp, 2
 10593 00005109 FF36[1000]               push word [orgData]
 10594 0000510D E80FF6                   call prunsign1
 10595 00005110 83C402                   add  sp, 2
 10596 00005113 A1[874F]                 mov ax, [MAXUI]
 10597 00005116 2B06[1000]               sub ax, [orgData]
 10598 0000511A 8946FE                   mov [bp-2], ax
 10599                                  
 10600                                  ;-967   prs(", resting stacksize: ");printint51(i);
 10601                                  
 10602 0000511D 68[1E53]                 push epilog_19
 10603 00005120 E8A2F4                   call prs
 10604 00005123 83C402                   add  sp, 2
 10605 00005126 FF76FE                   push word [bp-2]
 10606 00005129 E835F6                   call printint51
 10607 0000512C 83C402                   add  sp, 2
 10608                                  
 10609                                  ;-968   if (i <= 5000) prs(" *** Warning *** Stack too small");
 10610                                  
 10611 0000512F 8B46FE                   mov ax, [bp-2]
 10612 00005132 3D8813                   cmp ax, 5000
 10613 00005135 0F870900                 ja  .epilog590
 10614 00005139 68[3453]                 push epilog_20
 10615 0000513C E886F4                   call prs
 10616 0000513F 83C402                   add  sp, 2
 10617                                  
 10618                                  ;-969   prs("\n;Max. Const in '"); prs(coname); prs("' :"); printint51(maxco);
 10619                                  
 10620                                  .epilog590:
 10621 00005142 68[5553]                 push epilog_21
 10622 00005145 E87DF4                   call prs
 10623 00005148 83C402                   add  sp, 2
 10624 0000514B 8D06E880                 lea  ax, [coname]
 10625 0000514F 50                       push ax
 10626 00005150 E872F4                   call prs
 10627 00005153 83C402                   add  sp, 2
 10628 00005156 68[6853]                 push epilog_22
 10629 00005159 E869F4                   call prs
 10630 0000515C 83C402                   add  sp, 2
 10631 0000515F FF36[1200]               push word [maxco]
 10632 00005163 E8FBF5                   call printint51
 10633 00005166 83C402                   add  sp, 2
 10634                                  
 10635                                  ;-970   prs(" max."); printint51(COMAX); i=COMAX; i=i-maxco; prs(", free:");
 10636                                  
 10637 00005169 68[6C53]                 push epilog_23
 10638 0000516C E856F4                   call prs
 10639 0000516F 83C402                   add  sp, 2
 10640 00005172 68B80B                   push 3000
 10641 00005175 E8E9F5                   call printint51
 10642 00005178 83C402                   add  sp, 2
 10643 0000517B B8B80B                   mov ax, 3000
 10644 0000517E 8946FE                   mov [bp-2], ax
 10645 00005181 8B46FE                   mov ax, [bp-2]
 10646 00005184 2B06[1200]               sub ax, [maxco]
 10647 00005188 8946FE                   mov [bp-2], ax
 10648 0000518B 68[7253]                 push epilog_24
 10649 0000518E E834F4                   call prs
 10650 00005191 83C402                   add  sp, 2
 10651                                  
 10652                                  ;-971   printint51(i);if (i <= 1000)prs(" *** Warning *** constant area too small");
 10653                                  
 10654 00005194 FF76FE                   push word [bp-2]
 10655 00005197 E8C7F5                   call printint51
 10656 0000519A 83C402                   add  sp, 2
 10657 0000519D 8B46FE                   mov ax, [bp-2]
 10658 000051A0 3DE803                   cmp ax, 1000
 10659 000051A3 0F870900                 ja  .epilog591
 10660 000051A7 68[7A53]                 push epilog_25
 10661 000051AA E818F4                   call prs
 10662 000051AD 83C402                   add  sp, 2
 10663                                  
 10664                                  ;-972   end1(0);}
 10665                                  
 10666                                  .epilog591:
 10667 000051B0 6A00                     push 0
 10668 000051B2 E8D6F6                   call end1
 10669 000051B5 83C402                   add  sp, 2
 10670                                  
 10671                                  ;-973 // while(expr) stmt; do stmt while(expr); FOR: i=0; while(i<10){stmt; i++;}
 10672                                  
 10673                                  
 10674                                  ;-974 int setblock(unsigned int i) {
 10675 000051B8 C9                       LEAVE
 10676 000051B9 C3                       ret
 10677                                  ; ENDP
 10678 000051BA 4C61737446756E6374-     epilog_0 db "LastFunctionByt",0
 10679 000051C3 696F6E42797400     
 10680 000051CA 5C6E4C61737446756E-     epilog_1 db "\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret",0
 10681 000051D3 6374696F6E4279743A-
 10682 000051DC 646220304538682C20-
 10683 000051E5 302C20305C6E706F70-
 10684 000051EE 2061785C6E72657400 
 10685 000051F7 5C6E205C6E3B202020-     epilog_2 db "\n \n;   # type sign width  adr used name   list of global variables\n",0
 10686 00005200 232074797065207369-
 10687 00005209 676E20776964746820-
 10688 00005212 206164722075736564-
 10689 0000521B 206E616D652020206C-
 10690 00005224 697374206F6620676C-
 10691 0000522D 6F62616C2076617269-
 10692 00005236 61626C65735C6E00   
 10693 0000523E 5C6E3B496E7075743A-     epilog_3 db "\n;Input: ",0
 10694 00005247 2000               
 10695 00005249 2C204C6973743A2000      epilog_4 db ", List: ",0
 10696 00005252 2C20204C696E65733A-     epilog_5 db ",  Lines:",0
 10697 0000525B 00                 
 10698 0000525C 5C6E3B476C6F622E20-     epilog_6 db "\n;Glob. variables:",0
 10699 00005265 7661726961626C6573-
 10700 0000526E 3A00               
 10701 00005270 206D61782E3A00          epilog_7 db " max.:",0
 10702 00005277 5C6E3B46756E637469-     epilog_8 db "\n;Functions      :",0
 10703 00005280 6F6E73202020202020-
 10704 00005289 3A00               
 10705 0000528B 206D61782E3A00          epilog_9 db " max.:",0
 10706 00005292 5C6E3B43616C6C7320-     epilog_10 db "\n;Calls          :",0
 10707 0000529B 202020202020202020-
 10708 000052A4 3A00               
 10709 000052A6 206D61782E3A00          epilog_11 db " max.:",0
 10710 000052AD 2C204E616D65466965-     epilog_12 db ", NameField:",0
 10711 000052B6 6C643A00           
 10712 000052BA 206D61782E3A00          epilog_13 db " max.:",0
 10713 000052C1 5C6E3B436F64652075-     epilog_14 db "\n;Code until     :",0
 10714 000052CA 6E74696C2020202020-
 10715 000052D3 3A00               
 10716 000052D5 206D61782E3A2000        epilog_15 db " max.: ",0
 10717 000052DD 2C20667265653A00        epilog_16 db ", free:",0
 10718 000052E5 202A2A2A205761726E-     epilog_17 db " *** Warning *** Code area too small",0
 10719 000052EE 696E67202A2A2A2043-
 10720 000052F7 6F6465206172656120-
 10721 00005300 746F6F20736D616C6C-
 10722 00005309 00                 
 10723 0000530A 5C6E3B446174612028-     epilog_18 db "\n;Data (HeapEnd) :",0
 10724 00005313 48656170456E642920-
 10725 0000531C 3A00               
 10726 0000531E 2C2072657374696E67-     epilog_19 db ", resting stacksize: ",0
 10727 00005327 20737461636B73697A-
 10728 00005330 653A2000           
 10729 00005334 202A2A2A205761726E-     epilog_20 db " *** Warning *** Stack too small",0
 10730 0000533D 696E67202A2A2A2053-
 10731 00005346 7461636B20746F6F20-
 10732 0000534F 736D616C6C00       
 10733 00005355 5C6E3B4D61782E2043-     epilog_21 db "\n;Max. Const in '",0
 10734 0000535E 6F6E737420696E2027-
 10735 00005367 00                 
 10736 00005368 27203A00                epilog_22 db "' :",0
 10737 0000536C 206D61782E00            epilog_23 db " max.",0
 10738 00005372 2C20667265653A00        epilog_24 db ", free:",0
 10739 0000537A 202A2A2A205761726E-     epilog_25 db " *** Warning *** constant area too small",0
 10740 00005383 696E67202A2A2A2063-
 10741 0000538C 6F6E7374616E742061-
 10742 00005395 72656120746F6F2073-
 10743 0000539E 6D616C6C00         
 10744                                  
 10745                                  setblock:  ; *** PROC ***
 10746                                  
 10747                                  ;-975   DOS_ERR=0; _BX=i; _ ax=cs; _ es=ax; _AX=0x4A00; DosInt(); }
 10748                                  
 10749                                  ;Function : setblock, Number of local variables: 1
 10750                                  ;   # type sign width addr used name   list of local variables
 10751                                  ;  200 var unsg word   974 NULL i = bp+4;
 10752 000053A3 C8000000                 ENTER  0,0
 10753 000053A7 B80000                   mov ax, 0
 10754 000053AA A3[6E00]                 mov word [DOS_ERR], ax
 10755 000053AD 8B5E04                   mov  bx, [bp+4]
 10756 000053B0 8CC8                     mov  ax, cs
 10757 000053B2 8EC0                     mov  es, ax
 10758 000053B4 B8004A                   mov  ax, 18944
 10759 000053B7 E813AD                   call DosInt
 10760                                  
 10761                                  ;-976 int allocmem(unsigned int i) { unsigned int vAX; unsigned int vBX;
 10762 000053BA C9                       LEAVE
 10763 000053BB C3                       ret
 10764                                  ; ENDP
 10765                                  
 10766                                  allocmem:  ; *** PROC ***
 10767                                  
 10768                                  ;-977   DOS_ERR=0; _BX=i;  _AX=0x4800; DosInt(); _ vAX=ax; _ vBX=bx;
 10769                                  
 10770                                  ;Function : allocmem, Number of local variables: 3
 10771                                  ;   # type sign width addr used name   list of local variables
 10772                                  ;  200 var unsg word   976 NULL i = bp+4
 10773                                  ;  201 var unsg word   976 NULL vAX = bp-2
 10774                                  ;  202 var unsg word   976 NULL vBX = bp-4;
 10775 000053BC C8040000                 ENTER  4,0
 10776 000053C0 B80000                   mov ax, 0
 10777 000053C3 A3[6E00]                 mov word [DOS_ERR], ax
 10778 000053C6 8B5E04                   mov  bx, [bp+4]
 10779 000053C9 B80048                   mov  ax, 18432
 10780 000053CC E8FEAC                   call DosInt
 10781 000053CF 8946FE                  mov [bp-2], ax
 10782 000053D2 895EFC                  mov [bp-4], bx
 10783                                  
 10784                                  ;-978   if(DOS_ERR) return vBX;   return vAX;
 10785                                  
 10786 000053D5 A1[6E00]                 mov ax, [DOS_ERR]
 10787 000053D8 08C0                     or  al, al
 10788 000053DA 0F840600                 je .allocmem592
 10789 000053DE 8B46FC                   mov ax, [bp-4]
 10790 000053E1 E90600                   jmp .retn
 10791                                  .allocmem592:
 10792 000053E4 8B46FE                   mov ax, [bp-2]
 10793 000053E7 E90000                   jmp .retn
 10794                                  
 10795                                  ;-979 }
 10796                                  
 10797                                  
 10798                                  ;-980 int copyF(char *dest, char *src, unsigned int sz) {
 10799                                  
 10800 000053EA C9                       .retn: LEAVE
 10801 000053EB C3                       ret
 10802                                  ; ENDP
 10803                                  
 10804                                  copyF:  ; *** PROC ***
 10805                                  
 10806                                  ;-981   segE;  _ es=ax;  _ si=src;  _ di=dest; _ cx=sz;  // ds:si   es:di
 10807                                  
 10808                                  ;Function : copyF, Number of local variables: 3
 10809                                  ;   # type sign width addr used name   list of local variables
 10810                                  ;  200 ptr sign byte   980 NULL dest = bp+4
 10811                                  ;  201 ptr sign byte   980 NULL src = bp+6
 10812                                  ;  202 var unsg word   980 NULL sz = bp+8;
 10813 000053EC C8000000                 ENTER  0,0
 10814 000053F0 A1[6400]                 mov ax, [segE]
 10815 000053F3 8EC0                     mov  es, ax
 10816 000053F5 8B7606                   mov  si, [bp+6]
 10817 000053F8 8B7E04                   mov  di, [bp+4]
 10818 000053FB 8B4E08                   mov  cx, [bp+8]
 10819                                  
 10820                                  ;-982   asm cld
 10821                                  
 10822 000053FE FC                       cld
 10823                                  
 10824                                  ;-983   asm rep movsb
 10825                                  
 10826 000053FF F3A4                     rep movsb
 10827                                  
 10828                                  ;-984   asm mov byte [es:di], 0
 10829                                  
 10830 00005401 26C60500                 mov byte [es:di], 0
 10831                                  
 10832                                  ;-985 }
 10833                                  
 10834                                  
 10835                                  ;-986 int to_far(char *dest, char *src) {
 10836 00005405 C9                       LEAVE
 10837 00005406 C3                       ret
 10838                                  ; ENDP
 10839                                  
 10840                                  to_far:  ; *** PROC ***
 10841                                  
 10842                                  ;-987   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
 10843                                  
 10844                                  ;Function : to_far, Number of local variables: 2
 10845                                  ;   # type sign width addr used name   list of local variables
 10846                                  ;  200 ptr sign byte   986 NULL dest = bp+4
 10847                                  ;  201 ptr sign byte   986 NULL src = bp+6;
 10848 00005407 C8000000                 ENTER  0,0
 10849 0000540B A1[6400]                 mov ax, [segE]
 10850 0000540E 8EC0                     mov  es, ax
 10851 00005410 8B7606                   mov  si, [bp+6]
 10852 00005413 8B7E04                   mov  di, [bp+4]
 10853                                  
 10854                                  ;-988   asm cld
 10855                                  
 10856 00005416 FC                       cld
 10857                                  
 10858                                  ;-989   do{
 10859                                  
 10860                                  .to_far593:
 10861                                  
 10862                                  ;-990   asm lodsb  ; inc si
 10863                                  
 10864 00005417 AC                       lodsb  ; inc si
 10865                                  
 10866                                  ;-991   asm stosb  ; inc di
 10867                                  
 10868 00005418 AA                       stosb  ; inc di
 10869                                  
 10870                                  ;-992   } while (al != 0);
 10871                                  
 10872 00005419 3C00                     cmp  al, 0
 10873 0000541B 0F840200                 je  .to_far594
 10874 0000541F EBF6                     jmp .to_far593
 10875                                  .to_far594:
 10876                                  
 10877                                  ;-993 }
 10878                                  
 10879                                  
 10880                                  ;-994 int from_far(char *dest, char *src) {
 10881 00005421 C9                       LEAVE
 10882 00005422 C3                       ret
 10883                                  ; ENDP
 10884                                  
 10885                                  from_far:  ; *** PROC ***
 10886                                  
 10887                                  ;-995   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
 10888                                  
 10889                                  ;Function : from_far, Number of local variables: 2
 10890                                  ;   # type sign width addr used name   list of local variables
 10891                                  ;  200 ptr sign byte   994 NULL dest = bp+4
 10892                                  ;  201 ptr sign byte   994 NULL src = bp+6;
 10893 00005423 C8000000                 ENTER  0,0
 10894 00005427 A1[6400]                 mov ax, [segE]
 10895 0000542A 8EC0                     mov  es, ax
 10896 0000542C 8B7606                   mov  si, [bp+6]
 10897 0000542F 8B7E04                   mov  di, [bp+4]
 10898                                  
 10899                                  ;-996   do{
 10900                                  
 10901                                  .from_far595:
 10902                                  
 10903                                  ;-997   asm mov al, [es:si]
 10904                                  
 10905 00005432 268A04                   mov al, [es:si]
 10906                                  
 10907                                  ;-998   asm inc si
 10908                                  
 10909 00005435 46                       inc si
 10910                                  
 10911                                  ;-999   asm mov [di], al
 10912                                  
 10913 00005436 8805                     mov [di], al
 10914                                  
 10915                                  ;-1000   asm inc di
 10916                                  
 10917 00005438 47                       inc di
 10918                                  
 10919                                  ;-1001   } while (al != 0);
 10920                                  
 10921 00005439 3C00                     cmp  al, 0
 10922 0000543B 0F840200                 je  .from_far596
 10923 0000543F EBF1                     jmp .from_far595
 10924                                  .from_far596:
 10925                                  
 10926                                  ;-1002 }
 10927 00005441 C9                       LEAVE
 10928 00005442 C3                       ret
 10929                                  ; ENDP
 10930                                   
 10931                                  ; missing functions: 
 10932                                  ; Number of unresolved CALLs :    0 All FUNCTIONs in place
 10933 00005443 E80000                  LastFunctionByt:db 0E8h, 0, 0
 10934 00005446 58                      pop ax
 10935 00005447 C3                      ret
 10936                                   
 10937                                  ;   # type sign width  adr used name   list of global variables
 10938                                  
 10939                                  ;    1 arr sign byte     2    2 Version1[10]
 10940                                  ;    2 def unsg byte     3    - LSTART=200
 10941                                  ;    3 def unsg byte     4    - VARMAX=300
 10942                                  ;    4 def unsg byte     5    - GNAMEMAX=4800
 10943                                  ;    5 def unsg byte     6    - FUNCMAX=300
 10944                                  ;    6 def unsg byte     7    - FNAMEMAX=4800
 10945                                  ;    7 def unsg byte     8    - CALLMAX=2000
 10946                                  ;    8 def unsg byte     9    - IDLENMAX=15
 10947                                  ;    9 def unsg byte    11    - T_NAME=256
 10948                                  ;   10 def unsg byte    12    - T_CONST=257
 10949                                  ;   11 def unsg byte    13    - T_STRING=258
 10950                                  ;   12 def unsg byte    14    - T_INCLUDE=510
 10951                                  ;   13 def unsg byte    15    - T_DEFINE=511
 10952                                  ;   14 def unsg byte    16    - T_RETURN=512
 10953                                  ;   15 def unsg byte    17    - T_IF=513
 10954                                  ;   16 def unsg byte    18    - T_ELSE=514
 10955                                  ;   17 def unsg byte    19    - T_WHILE=515
 10956                                  ;   18 def unsg byte    20    - T_DO=516
 10957                                  ;   19 def unsg byte    21    - T_INT=517
 10958                                  ;   20 def unsg byte    22    - T_ASM=518
 10959                                  ;   21 def unsg byte    23    - T_ASMBLOCK=519
 10960                                  ;   22 def unsg byte    24    - T_EMIT=520
 10961                                  ;   23 def unsg byte    25    - T_GOTO=521
 10962                                  ;   24 def unsg byte    26    - T_VOID=529
 10963                                  ;   25 def unsg byte    27    - T_CHAR=530
 10964                                  ;   26 def unsg byte    28    - T_SIGNED=531
 10965                                  ;   27 def unsg byte    29    - T_UNSIGNED=532
 10966                                  ;   28 def unsg byte    30    - T_LONG=533
 10967                                  ;   29 def unsg byte    31    - T_EQ=806
 10968                                  ;   30 def unsg byte    32    - T_NE=807
 10969                                  ;   31 def unsg byte    33    - T_GE=811
 10970                                  ;   32 def unsg byte    34    - T_LE=824
 10971                                  ;   33 def unsg byte    35    - T_PLUSPLUS=1219
 10972                                  ;   34 def unsg byte    36    - T_MINUSMINUS=1225
 10973                                  ;   35 def unsg byte    37    - T_PLUSASS=1230
 10974                                  ;   36 def unsg byte    38    - T_MINUSASS=1231
 10975                                  ;   37 def unsg byte    39    - T_MULASS=1232
 10976                                  ;   38 def unsg byte    40    - T_DIVASS=1233
 10977                                  ;   39 def unsg byte    41    - T_ANDASS=1234
 10978                                  ;   40 def unsg byte    42    - T_ORASS=1235
 10979                                  ;   41 def unsg byte    43    - T_LESSLESS=1240
 10980                                  ;   42 def unsg byte    44    - T_GREATGREAT=1241
 10981                                  ;   43 def unsg byte    45    - COMAX=3000
 10982                                  ;   44 def unsg byte    46    - CMDLENMAX=67
 10983                                  ;   45 var unsg word    47    3 ORGDATAORIG
 10984                                  ;   46 var unsg word    47   10 orgData
 10985                                  ;   47 arr sign byte    48    4 co[3000]
 10986                                  ;   48 var sign word    48    4 maxco
 10987                                  ;   49 var sign word    48    3 maxco1
 10988                                  ;   50 arr sign byte    49    2 coname[67]
 10989                                  ;   51 ptr sign byte    49    5 cloc
 10990                                  ;   52 var sign word    50    6 fdin
 10991                                  ;   53 var sign word    50    4 fdout
 10992                                  ;   54 arr sign byte    50  104 symbol[128]
 10993                                  ;   55 arr sign byte    51   10 fname[67]
 10994                                  ;   56 arr sign byte    51   10 namein[67]
 10995                                  ;   57 arr sign byte    52    7 namelst[67]
 10996                                  ;   58 arr sign byte    52    2 archivename[67]
 10997                                  ;   59 var sign word    53   41 token
 10998                                  ;   60 var sign byte    53    2 globC
 10999                                  ;   61 var sign word    53    3 spalte
 11000                                  ;   62 var sign byte    54   28 thechar
 11001                                  ;   63 var sign word    54    9 iscmp
 11002                                  ;   64 var sign word    54    4 nconst
 11003                                  ;   65 var sign word    55    3 nreturn
 11004                                  ;   66 var sign word    55   12 nlabel
 11005                                  ;   67 var sign word    56   24 GTop
 11006                                  ;   68 var sign word    56   20 LTop
 11007                                  ;   69 var unsg word    57   44 lexval
 11008                                  ;   70 var sign word    58    6 typei
 11009                                  ;   71 var sign byte    58    8 istype
 11010                                  ;   72 arr sign byte    58   11 GType[300]
 11011                                  ;   73 var sign word    59    6 signi
 11012                                  ;   74 var sign byte    59    5 issign
 11013                                  ;   75 arr sign byte    59    5 GSign[300]
 11014                                  ;   76 var sign word    60    9 widthi
 11015                                  ;   77 var sign byte    60   19 iswidth
 11016                                  ;   78 arr sign byte    60    5 GWidth[300]
 11017                                  ;   79 arr sign word    61    4 GAdr[300]
 11018                                  ;   80 arr sign word    61    6 GUsed[300]
 11019                                  ;   81 var sign word    62   26 wi
 11020                                  ;   82 arr sign word    62   11 GData[300]
 11021                                  ;   83 arr sign byte    62    2 GNameField[4800]
 11022                                  ;   84 var sign word    63   13 FTop
 11023                                  ;   85 var sign word    63    8 CTop
 11024                                  ;   86 arr sign byte    64    2 FType[300]
 11025                                  ;   87 arr sign byte    64    3 CType[2000]
 11026                                  ;   88 arr sign word    65    2 FAdr[300]
 11027                                  ;   89 arr sign word    65    4 CAdr[2000]
 11028                                  ;   90 arr sign word    66    4 FCalls[300]
 11029                                  ;   91 arr sign byte    67    5 FNameField[4800]
 11030                                  ;   92 arr sign byte    68    7 NameA[32]
 11031                                  ;   93 arr sign byte    69    5 fgetsdest[128]
 11032                                  ;   94 ptr unsg byte    69    8 CNameTop
 11033                                  ;   95 ptr unsg byte    70   10 fgetsp
 11034                                  ;   96 var unsg word    70    4 segE
 11035                                  ;   97 var unsg word    71   12 lineno
 11036                                  ;   98 var unsg word    71    2 linenoinclude
 11037                                  ;   99 ptr unsg byte    72   17 pt
 11038                                  ;  100 ptr unsg byte    72    8 p1
 11039                                  ;  101 var sign word    73    9 DOS_ERR
 11040                                  ;  102 var sign word    73    5 DOS_NoBytes
 11041                                  ;  103 var sign byte    73    3 DOS_ByteRead
 11042                                  ;  104 arr sign byte   135    2 doglobName[15]
 11043                                  ;  105 var sign word   295    5 mod1
 11044                                  ;  106 var sign word   295   12 ireg1
 11045                                  ;  107 var sign word   295    6 idx1
 11046                                  ;  108 var sign word   295    1 ids1
 11047                                  ;  109 var sign word   295    4 idw1
 11048                                  ;  110 var sign word   295    2 idt1
 11049                                  ;  111 var sign word   295 NULL val1
 11050                                  ;  112 var sign word   296    2 mod2
 11051                                  ;  113 var sign word   296    6 ireg2
 11052                                  ;  114 var sign word   296    6 idx2
 11053                                  ;  115 var sign word   296    1 ids2
 11054                                  ;  116 var sign word   296    4 idw2
 11055                                  ;  117 var sign word   296    2 idt2
 11056                                  ;  118 var sign word   296    2 val2
 11057                                  ;  119 arr sign byte   361    9 ops[5]
 11058                                  ;  120 arr sign byte   403    3 printregstr[74]
 11059                                  ;  121 var sign word   411    1 evalue
 11060                                  ;  122 var sign word   411    1 exprtype
 11061                                  ;  123 arr sign word   563    2 docalltype[10]
 11062                                  ;  124 arr sign word   563    2 docallvalue[10]
 11063                                  ;  125 arr sign byte   564    2 procname[17]
 11064                                  ;  126 ptr sign byte   619    1 arglen
 11065                                  ;  127 ptr sign byte   619    3 argv
 11066                                  ;  128 arr sign byte   760    2 symboltemp[80]
 11067                                  ;  129 var unsg word   941    1 MAXUI
 11068                                  
 11069                                  
 11070                                  ;   # Calls Line Width  Name   list of functions
 11071                                  
 11072                                  ;    0    4   75   writetty
 11073                                  ;    1    2   76   putch
 11074                                  ;    2    6   77   cputs
 11075                                  ;    3    4   78   mkneg
 11076                                  ;    4    9   80   DosInt
 11077                                  ;    5    2   85   openR
 11078                                  ;    6    1   86   creatR
 11079                                  ;    7    2   87   fcloseR
 11080                                  ;    8    3   88   exitR
 11081                                  ;    9    1   89   readR
 11082                                  ;   10    1   90   readRL
 11083                                  ;   11    1   91   fputcR
 11084                                  ;   12    8   94   strlen
 11085                                  ;   13   24   95   strcpy
 11086                                  ;   14   74   96   eqstr
 11087                                  ;   15    1   99   instr1
 11088                                  ;   16    1  100   instr2
 11089                                  ;   17    1  101   strcat1
 11090                                  ;   18    1  102   toupper
 11091                                  ;   19    1  103   pint
 11092                                  ;   20    4  105   digit
 11093                                  ;   21    4  110   letter
 11094                                  ;   22 NULL  121   alnum
 11095                                  ;   23    4  126   a
 11096                                  ;   24   21  127   v
 11097                                  ;   25    4  132   checknamelen
 11098                                  ;   26    1  136   doglob
 11099                                  ;   27   12  185   gettypes
 11100                                  ;   28    9  194   adrofname
 11101                                  ;   29    7  195   adrF
 11102                                  ;   30    4  197   printName
 11103                                  ;   31   12  201   searchname
 11104                                  ;   32    3  205   checkName
 11105                                  ;   33   10  210   typeName
 11106                                  ;   34    3  226   name1
 11107                                  ;   35    1  231   storecall
 11108                                  ;   36    2  237   storefunc
 11109                                  ;   37    2  241   addlocal
 11110                                  ;   38    1  247   checkFunction
 11111                                  ;   39    1  250   dofunc
 11112                                  ;   40    1  285   isvariable
 11113                                  ;   41    3  298   pexpr
 11114                                  ;   42    1  305   constantexpr
 11115                                  ;   43    3  315   exprstart
 11116                                  ;   44    1  317   expr2
 11117                                  ;   45    3  362   doreg1
 11118                                  ;   46    6  381   checkreg
 11119                                  ;   47    6  406   printreg
 11120                                  ;   48    2  412   expr
 11121                                  ;   49    4  461   compoundass
 11122                                  ;   50    2  468   dovar1
 11123                                  ;   51    8  489   rterm
 11124                                  ;   52    1  502   isreg
 11125                                  ;   53   15  520   doreg
 11126                                  ;   54    1  526   doassign
 11127                                  ;   55    1  544   domul
 11128                                  ;   56    2  548   doidiv
 11129                                  ;   57    1  561   domod
 11130                                  ;   58    1  565   docall1
 11131                                  ;   59 NULL  607   main
 11132                                  ;   60    2  618   getfirstchar
 11133                                  ;   61    1  620   getarg
 11134                                  ;   62    2  639   parse
 11135                                  ;   63    1  648   checkcalls
 11136                                  ;   64    1  665   doinclude
 11137                                  ;   65    1  676   dodefine
 11138                                  ;   66    6  692   stmt
 11139                                  ;   67    1  722   doemit
 11140                                  ;   68    3  726   cmpneg
 11141                                  ;   69    7  739   prlabel
 11142                                  ;   70    3  740   prjump
 11143                                  ;   71    1  741   doif
 11144                                  ;   72    1  747   dodo
 11145                                  ;   73    1  751   dowhile
 11146                                  ;   74    4  754   isrelational
 11147                                  ;   75   17  761   getlex
 11148                                  ;   76    1  813   convertdefine
 11149                                  ;   77    1  820   getdigit
 11150                                  ;   78    1  829   getstring
 11151                                  ;   79   31  832   next
 11152                                  ;   80   78  833   istoken
 11153                                  ;   81   36  834   expect
 11154                                  ;   82    6  837   eprc
 11155                                  ;   83    5  838   eprs
 11156                                  ;   84   41  839   prc
 11157                                  ;   85    3  844   prscomment
 11158                                  ;   86    8  846   prnl
 11159                                  ;   87  250  848   prs
 11160                                  ;   88    2  853   eprnum
 11161                                  ;   89   16  855   pint1
 11162                                  ;   90   27  857   prunsign1
 11163                                  ;   91   25  860   printint51
 11164                                  ;   92    2  864   fgets1
 11165                                  ;   93    1  868   printinputline
 11166                                  ;   94    2  876   end1
 11167                                  ;   95   50  877   error1
 11168                                  ;   96    2  886   listproc
 11169                                  ;   97    2  894   listvar
 11170                                  ;   98    1  910   listcall
 11171                                  ;   99    1  913   calllisting
 11172                                  ;  100    1  919   countcalls
 11173                                  ;  101    1  927   listfunc
 11174                                  ;  102    1  931   funclisting
 11175                                  ;  103    1  942   epilog
 11176                                  ;  104    1  974   setblock
 11177                                  ;  105    1  976   allocmem
 11178                                  ;  106 NULL  980   copyF
 11179                                  ;  107    1  986   to_far
 11180                                  ;  108    3  994   from_far
 11181                                  ;  109 NULL 1002   LastFunctionByt
 11182                                  
 11183                                  ;    #  addr name   list of CALLs
 11184                                  
 11185                                  ;    0     0 writetty
 11186                                  ;    1     9 writetty
 11187                                  ;    2    18 putch
 11188                                  ;    3    24 DosInt
 11189                                  ;    4    31 DosInt
 11190                                  ;    5    38 DosInt
 11191                                  ;    6    45 DosInt
 11192                                  ;    7    52 DosInt
 11193                                  ;    8    59 DosInt
 11194                                  ;    9    66 DosInt
 11195                                  ;   10    73 strcpy
 11196                                  ;   11    80 prc
 11197                                  ;   12    84 mkneg
 11198                                  ;   13    90 pint
 11199                                  ;   14    95 putch
 11200                                  ;   15   101 digit
 11201                                  ;   16   107 digit
 11202                                  ;   17   113 letter
 11203                                  ;   18   120 printName
 11204                                  ;   19   130 prc
 11205                                  ;   20   134 printName
 11206                                  ;   21   144 prc
 11207                                  ;   22   148 strlen
 11208                                  ;   23   155 error1
 11209                                  ;   24   162 error1
 11210                                  ;   25   169 error1
 11211                                  ;   26   176 checknamelen
 11212                                  ;   27   189 checkName
 11213                                  ;   28   199 error1
 11214                                  ;   29   206 istoken
 11215                                  ;   30   214 istoken
 11216                                  ;   31   222 prs
 11217                                  ;   32   226 prunsign1
 11218                                  ;   33   236 prs
 11219                                  ;   34   240 prs
 11220                                  ;   35   244 prs
 11221                                  ;   36   248 prs
 11222                                  ;   37   252 prs
 11223                                  ;   38   256 prunsign1
 11224                                  ;   39   266 prs
 11225                                  ;   40   270 expect
 11226                                  ;   41   277 expect
 11227                                  ;   42   284 error1
 11228                                  ;   43   291 prs
 11229                                  ;   44   295 prs
 11230                                  ;   45   299 prs
 11231                                  ;   46   303 strcpy
 11232                                  ;   47   310 expect
 11233                                  ;   48   317 istoken
 11234                                  ;   49   325 prc
 11235                                  ;   50   329 prscomment
 11236                                  ;   51   340 prc
 11237                                  ;   52   344 prs
 11238                                  ;   53   348 strlen
 11239                                  ;   54   355 istoken
 11240                                  ;   55   363 prc
 11241                                  ;   56   367 expect
 11242                                  ;   57   374 prunsign1
 11243                                  ;   58   384 istoken
 11244                                  ;   59   392 expect
 11245                                  ;   60   399 error1
 11246                                  ;   61   406 prs
 11247                                  ;   62   410 prs
 11248                                  ;   63   414 prs
 11249                                  ;   64   418 prs
 11250                                  ;   65   422 prs
 11251                                  ;   66   426 prs
 11252                                  ;   67   430 istoken
 11253                                  ;   68   438 prc
 11254                                  ;   69   442 istoken
 11255                                  ;   70   450 expect
 11256                                  ;   71   457 prunsign1
 11257                                  ;   72   467 prunsign1
 11258                                  ;   73   477 adrofname
 11259                                  ;   74   487 strcpy
 11260                                  ;   75   494 strcpy
 11261                                  ;   76   501 expect
 11262                                  ;   77   508 adrF
 11263                                  ;   78   513 adrofname
 11264                                  ;   79   523 prs
 11265                                  ;   80   527 prs
 11266                                  ;   81   531 prc
 11267                                  ;   82   535 pint1
 11268                                  ;   83   541 prc
 11269                                  ;   84   545 checkName
 11270                                  ;   85   555 error1
 11271                                  ;   86   562 adrofname
 11272                                  ;   87   572 eqstr
 11273                                  ;   88   578 adrofname
 11274                                  ;   89   588 eqstr
 11275                                  ;   90   594 istoken
 11276                                  ;   91   602 istoken
 11277                                  ;   92   610 istoken
 11278                                  ;   93   618 istoken
 11279                                  ;   94   626 istoken
 11280                                  ;   95   634 istoken
 11281                                  ;   96   642 istoken
 11282                                  ;   97   650 istoken
 11283                                  ;   98   658 name1
 11284                                  ;   99   664 error1
 11285                                  ;  100   671 getlex
 11286                                  ;  101   678 error1
 11287                                  ;  102   685 error1
 11288                                  ;  103   692 strlen
 11289                                  ;  104   699 to_far
 11290                                  ;  105   706 error1
 11291                                  ;  106   713 adrF
 11292                                  ;  107   718 strcpy
 11293                                  ;  108   725 error1
 11294                                  ;  109   732 checkName
 11295                                  ;  110   742 error1
 11296                                  ;  111   749 adrF
 11297                                  ;  112   754 strcpy
 11298                                  ;  113   761 adrF
 11299                                  ;  114   766 eqstr
 11300                                  ;  115   772 checknamelen
 11301                                  ;  116   785 strcpy
 11302                                  ;  117   792 checkFunction
 11303                                  ;  118   806 error1
 11304                                  ;  119   813 storefunc
 11305                                  ;  120   823 prs
 11306                                  ;  121   827 prs
 11307                                  ;  122   831 prs
 11308                                  ;  123   835 expect
 11309                                  ;  124   842 istoken
 11310                                  ;  125   850 typeName
 11311                                  ;  126   859 addlocal
 11312                                  ;  127   868 istoken
 11313                                  ;  128   876 expect
 11314                                  ;  129   883 expect
 11315                                  ;  130   890 isvariable
 11316                                  ;  131   901 typeName
 11317                                  ;  132   910 checknamelen
 11318                                  ;  133   923 addlocal
 11319                                  ;  134   932 istoken
 11320                                  ;  135   940 expect
 11321                                  ;  136   947 expect
 11322                                  ;  137   954 istoken
 11323                                  ;  138   962 expect
 11324                                  ;  139   969 listproc
 11325                                  ;  140   978 prs
 11326                                  ;  141   982 mkneg
 11327                                  ;  142   988 pint1
 11328                                  ;  143   994 prs
 11329                                  ;  144   998 istoken
 11330                                  ;  145  1006 stmt
 11331                                  ;  146  1011 prs
 11332                                  ;  147  1015 prs
 11333                                  ;  148  1019 prs
 11334                                  ;  149  1023 prs
 11335                                  ;  150  1027 prs
 11336                                  ;  151  1031 strlen
 11337                                  ;  152  1038 strcpy
 11338                                  ;  153  1045 expect
 11339                                  ;  154  1052 eqstr
 11340                                  ;  155  1058 constantexpr
 11341                                  ;  156  1071 checkreg
 11342                                  ;  157  1080 doreg1
 11343                                  ;  158  1087 exprstart
 11344                                  ;  159  1097 prs
 11345                                  ;  160  1101 prs
 11346                                  ;  161  1105 expect
 11347                                  ;  162  1112 getlex
 11348                                  ;  163  1119 typeName
 11349                                  ;  164  1128 searchname
 11350                                  ;  165  1139 gettypes
 11351                                  ;  166  1148 isrelational
 11352                                  ;  167  1161 error1
 11353                                  ;  168  1168 expect
 11354                                  ;  169  1175 prs
 11355                                  ;  170  1179 prs
 11356                                  ;  171  1183 gettypes
 11357                                  ;  172  1192 prs
 11358                                  ;  173  1196 prs
 11359                                  ;  174  1200 v
 11360                                  ;  175  1202 prs
 11361                                  ;  176  1206 prunsign1
 11362                                  ;  177  1216 cmpneg
 11363                                  ;  178  1223 prs
 11364                                  ;  179  1227 expect
 11365                                  ;  180  1234 eqstr
 11366                                  ;  181  1240 expr2
 11367                                  ;  182  1246 expr
 11368                                  ;  183  1251 getlex
 11369                                  ;  184  1258 typeName
 11370                                  ;  185  1267 error1
 11371                                  ;  186  1274 checkreg
 11372                                  ;  187  1283 doreg1
 11373                                  ;  188  1290 searchname
 11374                                  ;  189  1301 gettypes
 11375                                  ;  190  1310 error1
 11376                                  ;  191  1317 isrelational
 11377                                  ;  192  1330 error1
 11378                                  ;  193  1337 istoken
 11379                                  ;  194  1345 error1
 11380                                  ;  195  1352 istoken
 11381                                  ;  196  1360 prs
 11382                                  ;  197  1364 prs
 11383                                  ;  198  1368 prs
 11384                                  ;  199  1372 prs
 11385                                  ;  200  1376 prs
 11386                                  ;  201  1380 v
 11387                                  ;  202  1382 prs
 11388                                  ;  203  1386 prunsign1
 11389                                  ;  204  1396 adrofname
 11390                                  ;  205  1406 prs
 11391                                  ;  206  1410 prs
 11392                                  ;  207  1414 typeName
 11393                                  ;  208  1423 checkreg
 11394                                  ;  209  1432 prs
 11395                                  ;  210  1436 printreg
 11396                                  ;  211  1445 v
 11397                                  ;  212  1447 prs
 11398                                  ;  213  1451 printreg
 11399                                  ;  214  1460 error1
 11400                                  ;  215  1467 searchname
 11401                                  ;  216  1478 gettypes
 11402                                  ;  217  1487 error1
 11403                                  ;  218  1494 prs
 11404                                  ;  219  1498 printreg
 11405                                  ;  220  1507 error1
 11406                                  ;  221  1514 prs
 11407                                  ;  222  1518 a
 11408                                  ;  223  1520 prs
 11409                                  ;  224  1524 prs
 11410                                  ;  225  1528 prs
 11411                                  ;  226  1532 v
 11412                                  ;  227  1534 adrofname
 11413                                  ;  228  1544 prs
 11414                                  ;  229  1548 prs
 11415                                  ;  230  1552 error1
 11416                                  ;  231  1559 istoken
 11417                                  ;  232  1567 strcpy
 11418                                  ;  233  1574 istoken
 11419                                  ;  234  1582 strcpy
 11420                                  ;  235  1589 istoken
 11421                                  ;  236  1597 strcpy
 11422                                  ;  237  1604 istoken
 11423                                  ;  238  1612 strcpy
 11424                                  ;  239  1619 istoken
 11425                                  ;  240  1627 strcpy
 11426                                  ;  241  1634 istoken
 11427                                  ;  242  1642 strcpy
 11428                                  ;  243  1649 istoken
 11429                                  ;  244  1657 strcpy
 11430                                  ;  245  1664 getlex
 11431                                  ;  246  1671 isrelational
 11432                                  ;  247  1684 error1
 11433                                  ;  248  1691 strcpy
 11434                                  ;  249  1698 prnl
 11435                                  ;  250  1703 prs
 11436                                  ;  251  1707 prs
 11437                                  ;  252  1711 printreg
 11438                                  ;  253  1720 prs
 11439                                  ;  254  1724 istoken
 11440                                  ;  255  1732 prunsign1
 11441                                  ;  256  1742 typeName
 11442                                  ;  257  1751 checkreg
 11443                                  ;  258  1760 printreg
 11444                                  ;  259  1769 searchname
 11445                                  ;  260  1780 a
 11446                                  ;  261  1782 v
 11447                                  ;  262  1784 cmpneg
 11448                                  ;  263  1791 prs
 11449                                  ;  264  1795 expect
 11450                                  ;  265  1802 strlen
 11451                                  ;  266  1809 eqstr
 11452                                  ;  267  1815 eqstr
 11453                                  ;  268  1821 eqstr
 11454                                  ;  269  1827 eqstr
 11455                                  ;  270  1833 eqstr
 11456                                  ;  271  1839 eqstr
 11457                                  ;  272  1845 eqstr
 11458                                  ;  273  1851 eqstr
 11459                                  ;  274  1857 eqstr
 11460                                  ;  275  1863 eqstr
 11461                                  ;  276  1869 eqstr
 11462                                  ;  277  1875 eqstr
 11463                                  ;  278  1881 eqstr
 11464                                  ;  279  1887 eqstr
 11465                                  ;  280  1893 eqstr
 11466                                  ;  281  1899 eqstr
 11467                                  ;  282  1905 eqstr
 11468                                  ;  283  1911 eqstr
 11469                                  ;  284  1917 eqstr
 11470                                  ;  285  1923 eqstr
 11471                                  ;  286  1929 eqstr
 11472                                  ;  287  1935 eqstr
 11473                                  ;  288  1941 strlen
 11474                                  ;  289  1948 eqstr
 11475                                  ;  290  1954 eqstr
 11476                                  ;  291  1960 eqstr
 11477                                  ;  292  1966 eqstr
 11478                                  ;  293  1972 eqstr
 11479                                  ;  294  1978 eqstr
 11480                                  ;  295  1984 eqstr
 11481                                  ;  296  1990 eqstr
 11482                                  ;  297  1996 eqstr
 11483                                  ;  298  2002 prc
 11484                                  ;  299  2006 prc
 11485                                  ;  300  2010 prc
 11486                                  ;  301  2014 istoken
 11487                                  ;  302  2022 prs
 11488                                  ;  303  2026 prunsign1
 11489                                  ;  304  2036 typeName
 11490                                  ;  305  2045 checkreg
 11491                                  ;  306  2054 doreg1
 11492                                  ;  307  2061 docall1
 11493                                  ;  308  2069 isreg
 11494                                  ;  309  2075 searchname
 11495                                  ;  310  2086 gettypes
 11496                                  ;  311  2095 istoken
 11497                                  ;  312  2103 istoken
 11498                                  ;  313  2111 expect
 11499                                  ;  314  2118 searchname
 11500                                  ;  315  2129 expect
 11501                                  ;  316  2136 expect
 11502                                  ;  317  2143 gettypes
 11503                                  ;  318  2152 error1
 11504                                  ;  319  2159 istoken
 11505                                  ;  320  2167 error1
 11506                                  ;  321  2174 prs
 11507                                  ;  322  2178 prs
 11508                                  ;  323  2182 prs
 11509                                  ;  324  2186 v
 11510                                  ;  325  2188 istoken
 11511                                  ;  326  2196 error1
 11512                                  ;  327  2203 prs
 11513                                  ;  328  2207 prs
 11514                                  ;  329  2211 prs
 11515                                  ;  330  2215 v
 11516                                  ;  331  2217 istoken
 11517                                  ;  332  2225 compoundass
 11518                                  ;  333  2237 istoken
 11519                                  ;  334  2245 compoundass
 11520                                  ;  335  2257 istoken
 11521                                  ;  336  2265 compoundass
 11522                                  ;  337  2277 istoken
 11523                                  ;  338  2285 compoundass
 11524                                  ;  339  2297 istoken
 11525                                  ;  340  2305 error1
 11526                                  ;  341  2312 istoken
 11527                                  ;  342  2320 error1
 11528                                  ;  343  2327 istoken
 11529                                  ;  344  2335 expr
 11530                                  ;  345  2340 doassign
 11531                                  ;  346  2349 dovar1
 11532                                  ;  347  2356 istoken
 11533                                  ;  348  2364 rterm
 11534                                  ;  349  2370 istoken
 11535                                  ;  350  2378 rterm
 11536                                  ;  351  2384 istoken
 11537                                  ;  352  2392 rterm
 11538                                  ;  353  2398 istoken
 11539                                  ;  354  2406 rterm
 11540                                  ;  355  2412 istoken
 11541                                  ;  356  2420 rterm
 11542                                  ;  357  2426 istoken
 11543                                  ;  358  2434 rterm
 11544                                  ;  359  2440 istoken
 11545                                  ;  360  2448 domul
 11546                                  ;  361  2454 istoken
 11547                                  ;  362  2462 doidiv
 11548                                  ;  363  2469 istoken
 11549                                  ;  364  2477 domod
 11550                                  ;  365  2483 isrelational
 11551                                  ;  366  2496 rterm
 11552                                  ;  367  2502 cmpneg
 11553                                  ;  368  2509 error1
 11554                                  ;  369  2516 prnl
 11555                                  ;  370  2521 prs
 11556                                  ;  371  2525 prs
 11557                                  ;  372  2529 gettypes
 11558                                  ;  373  2538 prs
 11559                                  ;  374  2542 prs
 11560                                  ;  375  2546 v
 11561                                  ;  376  2548 prs
 11562                                  ;  377  2552 expect
 11563                                  ;  378  2559 prunsign1
 11564                                  ;  379  2569 gettypes
 11565                                  ;  380  2578 prs
 11566                                  ;  381  2582 v
 11567                                  ;  382  2584 prnl
 11568                                  ;  383  2589 prs
 11569                                  ;  384  2593 prs
 11570                                  ;  385  2597 prs
 11571                                  ;  386  2601 prnl
 11572                                  ;  387  2606 prs
 11573                                  ;  388  2610 prs
 11574                                  ;  389  2614 a
 11575                                  ;  390  2616 prs
 11576                                  ;  391  2620 v
 11577                                  ;  392  2622 prs
 11578                                  ;  393  2626 prs
 11579                                  ;  394  2630 prs
 11580                                  ;  395  2634 prs
 11581                                  ;  396  2638 prs
 11582                                  ;  397  2642 prc
 11583                                  ;  398  2646 printName
 11584                                  ;  399  2656 prs
 11585                                  ;  400  2660 prnl
 11586                                  ;  401  2665 prs
 11587                                  ;  402  2669 prs
 11588                                  ;  403  2673 prs
 11589                                  ;  404  2677 prs
 11590                                  ;  405  2681 v
 11591                                  ;  406  2683 istoken
 11592                                  ;  407  2691 prnl
 11593                                  ;  408  2696 prs
 11594                                  ;  409  2700 prs
 11595                                  ;  410  2704 prs
 11596                                  ;  411  2708 prs
 11597                                  ;  412  2712 prunsign1
 11598                                  ;  413  2722 typeName
 11599                                  ;  414  2731 searchname
 11600                                  ;  415  2742 istoken
 11601                                  ;  416  2750 searchname
 11602                                  ;  417  2761 expect
 11603                                  ;  418  2768 expect
 11604                                  ;  419  2775 gettypes
 11605                                  ;  420  2784 error1
 11606                                  ;  421  2791 eqstr
 11607                                  ;  422  2797 dovar1
 11608                                  ;  423  2804 eqstr
 11609                                  ;  424  2810 doreg
 11610                                  ;  425  2816 eqstr
 11611                                  ;  426  2822 doreg
 11612                                  ;  427  2828 eqstr
 11613                                  ;  428  2834 doreg
 11614                                  ;  429  2840 eqstr
 11615                                  ;  430  2846 doreg
 11616                                  ;  431  2852 eqstr
 11617                                  ;  432  2858 doreg
 11618                                  ;  433  2864 eqstr
 11619                                  ;  434  2870 doreg
 11620                                  ;  435  2876 eqstr
 11621                                  ;  436  2882 doreg
 11622                                  ;  437  2888 eqstr
 11623                                  ;  438  2894 doreg
 11624                                  ;  439  2900 eqstr
 11625                                  ;  440  2906 doreg
 11626                                  ;  441  2912 eqstr
 11627                                  ;  442  2918 doreg
 11628                                  ;  443  2924 eqstr
 11629                                  ;  444  2930 doreg
 11630                                  ;  445  2936 eqstr
 11631                                  ;  446  2942 doreg
 11632                                  ;  447  2948 eqstr
 11633                                  ;  448  2954 doreg
 11634                                  ;  449  2960 eqstr
 11635                                  ;  450  2966 doreg
 11636                                  ;  451  2972 eqstr
 11637                                  ;  452  2978 doreg
 11638                                  ;  453  2984 expect
 11639                                  ;  454  2991 prs
 11640                                  ;  455  2995 prs
 11641                                  ;  456  2999 prs
 11642                                  ;  457  3003 istoken
 11643                                  ;  458  3011 prunsign1
 11644                                  ;  459  3021 istoken
 11645                                  ;  460  3029 searchname
 11646                                  ;  461  3040 v
 11647                                  ;  462  3042 error1
 11648                                  ;  463  3049 gettypes
 11649                                  ;  464  3058 prs
 11650                                  ;  465  3062 v
 11651                                  ;  466  3064 prs
 11652                                  ;  467  3068 prs
 11653                                  ;  468  3072 prs
 11654                                  ;  469  3076 a
 11655                                  ;  470  3078 prs
 11656                                  ;  471  3082 prs
 11657                                  ;  472  3086 prunsign1
 11658                                  ;  473  3096 v
 11659                                  ;  474  3098 prs
 11660                                  ;  475  3102 prs
 11661                                  ;  476  3106 printName
 11662                                  ;  477  3116 prs
 11663                                  ;  478  3120 prs
 11664                                  ;  479  3124 prs
 11665                                  ;  480  3128 prs
 11666                                  ;  481  3132 v
 11667                                  ;  482  3134 prs
 11668                                  ;  483  3138 prs
 11669                                  ;  484  3142 prs
 11670                                  ;  485  3146 v
 11671                                  ;  486  3148 prs
 11672                                  ;  487  3152 prs
 11673                                  ;  488  3156 prs
 11674                                  ;  489  3160 v
 11675                                  ;  490  3162 prs
 11676                                  ;  491  3166 rterm
 11677                                  ;  492  3172 istoken
 11678                                  ;  493  3180 prs
 11679                                  ;  494  3184 prunsign1
 11680                                  ;  495  3194 prs
 11681                                  ;  496  3198 error1
 11682                                  ;  497  3205 istoken
 11683                                  ;  498  3213 prs
 11684                                  ;  499  3217 prunsign1
 11685                                  ;  500  3227 prs
 11686                                  ;  501  3231 prs
 11687                                  ;  502  3235 typeName
 11688                                  ;  503  3244 searchname
 11689                                  ;  504  3255 error1
 11690                                  ;  505  3262 gettypes
 11691                                  ;  506  3271 error1
 11692                                  ;  507  3278 error1
 11693                                  ;  508  3285 prs
 11694                                  ;  509  3289 v
 11695                                  ;  510  3291 prs
 11696                                  ;  511  3295 prs
 11697                                  ;  512  3299 doidiv
 11698                                  ;  513  3306 prs
 11699                                  ;  514  3310 checknamelen
 11700                                  ;  515  3323 strcpy
 11701                                  ;  516  3330 storecall
 11702                                  ;  517  3340 expect
 11703                                  ;  518  3347 istoken
 11704                                  ;  519  3355 error1
 11705                                  ;  520  3362 istoken
 11706                                  ;  521  3370 istoken
 11707                                  ;  522  3378 eprs
 11708                                  ;  523  3383 eprs
 11709                                  ;  524  3388 eprc
 11710                                  ;  525  3393 eprnum
 11711                                  ;  526  3400 eprs
 11712                                  ;  527  3405 eprc
 11713                                  ;  528  3410 eprs
 11714                                  ;  529  3415 eprc
 11715                                  ;  530  3420 eprs
 11716                                  ;  531  3425 istoken
 11717                                  ;  532  3433 name1
 11718                                  ;  533  3439 searchname
 11719                                  ;  534  3450 istoken
 11720                                  ;  535  3458 checkreg
 11721                                  ;  536  3467 searchname
 11722                                  ;  537  3478 error1
 11723                                  ;  538  3485 istoken
 11724                                  ;  539  3493 expect
 11725                                  ;  540  3500 prs
 11726                                  ;  541  3504 pint1
 11727                                  ;  542  3510 prs
 11728                                  ;  543  3514 prs
 11729                                  ;  544  3518 prc
 11730                                  ;  545  3522 pint1
 11731                                  ;  546  3528 prs
 11732                                  ;  547  3532 v
 11733                                  ;  548  3534 prs
 11734                                  ;  549  3538 gettypes
 11735                                  ;  550  3547 prs
 11736                                  ;  551  3551 v
 11737                                  ;  552  3553 prs
 11738                                  ;  553  3557 v
 11739                                  ;  554  3559 prs
 11740                                  ;  555  3563 prs
 11741                                  ;  556  3567 printreg
 11742                                  ;  557  3576 prs
 11743                                  ;  558  3580 prs
 11744                                  ;  559  3584 prs
 11745                                  ;  560  3588 pint1
 11746                                  ;  561  3594 getarg
 11747                                  ;  562  3601 setblock
 11748                                  ;  563  3610 error1
 11749                                  ;  564  3617 allocmem
 11750                                  ;  565  3626 error1
 11751                                  ;  566  3633 getfirstchar
 11752                                  ;  567  3646 parse
 11753                                  ;  568  3652 checkcalls
 11754                                  ;  569  3663 epilog
 11755                                  ;  570  3670 fgets1
 11756                                  ;  571  3677 cputs
 11757                                  ;  572  3683 cputs
 11758                                  ;  573  3689 readRL
 11759                                  ;  574  3696 prnl
 11760                                  ;  575  3701 strcpy
 11761                                  ;  576  3708 instr2
 11762                                  ;  577  3715 strcat1
 11763                                  ;  578  3723 toupper
 11764                                  ;  579  3731 strcpy
 11765                                  ;  580  3738 strlen
 11766                                  ;  581  3745 openR
 11767                                  ;  582  3751 cputs
 11768                                  ;  583  3757 cputs
 11769                                  ;  584  3763 exitR
 11770                                  ;  585  3769 creatR
 11771                                  ;  586  3776 cputs
 11772                                  ;  587  3782 cputs
 11773                                  ;  588  3788 exitR
 11774                                  ;  589  3794 prs
 11775                                  ;  590  3798 prs
 11776                                  ;  591  3802 prs
 11777                                  ;  592  3806 pint1
 11778                                  ;  593  3812 prs
 11779                                  ;  594  3816 prs
 11780                                  ;  595  3820 prs
 11781                                  ;  596  3824 prs
 11782                                  ;  597  3828 prs
 11783                                  ;  598  3832 prs
 11784                                  ;  599  3836 prs
 11785                                  ;  600  3840 getlex
 11786                                  ;  601  3847 istoken
 11787                                  ;  602  3855 istoken
 11788                                  ;  603  3863 dodefine
 11789                                  ;  604  3872 istoken
 11790                                  ;  605  3880 doinclude
 11791                                  ;  606  3890 error1
 11792                                  ;  607  3897 typeName
 11793                                  ;  608  3906 dofunc
 11794                                  ;  609  3913 doglob
 11795                                  ;  610  3920 prs
 11796                                  ;  611  3924 from_far
 11797                                  ;  612  3933 adrF
 11798                                  ;  613  3938 eqstr
 11799                                  ;  614  3944 prs
 11800                                  ;  615  3948 prs
 11801                                  ;  616  3952 prs
 11802                                  ;  617  3956 printint51
 11803                                  ;  618  3967 error1
 11804                                  ;  619  3974 prs
 11805                                  ;  620  3978 prs
 11806                                  ;  621  3982 prs
 11807                                  ;  622  3986 openR
 11808                                  ;  623  3992 prs
 11809                                  ;  624  3996 prs
 11810                                  ;  625  4000 error1
 11811                                  ;  626  4007 parse
 11812                                  ;  627  4013 prs
 11813                                  ;  628  4017 prs
 11814                                  ;  629  4021 getfirstchar
 11815                                  ;  630  4034 getlex
 11816                                  ;  631  4041 eqstr
 11817                                  ;  632  4047 getlex
 11818                                  ;  633  4054 eqstr
 11819                                  ;  634  4060 getlex
 11820                                  ;  635  4067 prs
 11821                                  ;  636  4071 strcpy
 11822                                  ;  637  4078 prs
 11823                                  ;  638  4082 error1
 11824                                  ;  639  4089 getlex
 11825                                  ;  640  4096 expect
 11826                                  ;  641  4103 error1
 11827                                  ;  642  4110 strlen
 11828                                  ;  643  4117 error1
 11829                                  ;  644  4124 adrofname
 11830                                  ;  645  4134 strcpy
 11831                                  ;  646  4141 expect
 11832                                  ;  647  4148 istoken
 11833                                  ;  648  4156 istoken
 11834                                  ;  649  4164 stmt
 11835                                  ;  650  4169 istoken
 11836                                  ;  651  4177 doif
 11837                                  ;  652  4182 istoken
 11838                                  ;  653  4190 dodo
 11839                                  ;  654  4195 istoken
 11840                                  ;  655  4203 dowhile
 11841                                  ;  656  4211 istoken
 11842                                  ;  657  4219 prs
 11843                                  ;  658  4223 name1
 11844                                  ;  659  4229 prs
 11845                                  ;  660  4233 expect
 11846                                  ;  661  4240 prs
 11847                                  ;  662  4244 next
 11848                                  ;  663  4249 prc
 11849                                  ;  664  4253 next
 11850                                  ;  665  4258 getlex
 11851                                  ;  666  4265 istoken
 11852                                  ;  667  4273 prs
 11853                                  ;  668  4277 next
 11854                                  ;  669  4282 prc
 11855                                  ;  670  4286 next
 11856                                  ;  671  4291 getlex
 11857                                  ;  672  4298 error1
 11858                                  ;  673  4305 istoken
 11859                                  ;  674  4313 doemit
 11860                                  ;  675  4320 istoken
 11861                                  ;  676  4328 istoken
 11862                                  ;  677  4336 exprstart
 11863                                  ;  678  4346 prs
 11864                                  ;  679  4350 expect
 11865                                  ;  680  4357 prs
 11866                                  ;  681  4361 prs
 11867                                  ;  682  4365 prc
 11868                                  ;  683  4369 expect
 11869                                  ;  684  4376 expect
 11870                                  ;  685  4383 exprstart
 11871                                  ;  686  4393 expect
 11872                                  ;  687  4400 prs
 11873                                  ;  688  4404 getlex
 11874                                  ;  689  4411 prunsign1
 11875                                  ;  690  4421 getlex
 11876                                  ;  691  4428 prc
 11877                                  ;  692  4432 expect
 11878                                  ;  693  4439 prs
 11879                                  ;  694  4443 prs
 11880                                  ;  695  4447 prs
 11881                                  ;  696  4451 prs
 11882                                  ;  697  4455 prs
 11883                                  ;  698  4459 prunsign1
 11884                                  ;  699  4469 prs
 11885                                  ;  700  4473 prs
 11886                                  ;  701  4477 prunsign1
 11887                                  ;  702  4487 prs
 11888                                  ;  703  4491 prs
 11889                                  ;  704  4495 prs
 11890                                  ;  705  4499 error1
 11891                                  ;  706  4506 prs
 11892                                  ;  707  4510 prs
 11893                                  ;  708  4514 pint1
 11894                                  ;  709  4520 prc
 11895                                  ;  710  4524 prs
 11896                                  ;  711  4528 prs
 11897                                  ;  712  4532 pint1
 11898                                  ;  713  4538 pexpr
 11899                                  ;  714  4544 pint1
 11900                                  ;  715  4550 stmt
 11901                                  ;  716  4555 istoken
 11902                                  ;  717  4563 prjump
 11903                                  ;  718  4570 prlabel
 11904                                  ;  719  4578 stmt
 11905                                  ;  720  4583 prlabel
 11906                                  ;  721  4591 prlabel
 11907                                  ;  722  4599 prlabel
 11908                                  ;  723  4607 stmt
 11909                                  ;  724  4612 expect
 11910                                  ;  725  4619 pexpr
 11911                                  ;  726  4625 pint1
 11912                                  ;  727  4631 prjump
 11913                                  ;  728  4638 prlabel
 11914                                  ;  729  4646 prlabel
 11915                                  ;  730  4654 pexpr
 11916                                  ;  731  4660 pint1
 11917                                  ;  732  4666 stmt
 11918                                  ;  733  4671 prjump
 11919                                  ;  734  4678 prlabel
 11920                                  ;  735  4686 getlex
 11921                                  ;  736  4693 next
 11922                                  ;  737  4698 next
 11923                                  ;  738  4703 next
 11924                                  ;  739  4708 next
 11925                                  ;  740  4713 next
 11926                                  ;  741  4718 next
 11927                                  ;  742  4723 next
 11928                                  ;  743  4728 next
 11929                                  ;  744  4733 next
 11930                                  ;  745  4738 next
 11931                                  ;  746  4743 next
 11932                                  ;  747  4748 next
 11933                                  ;  748  4753 next
 11934                                  ;  749  4758 next
 11935                                  ;  750  4763 next
 11936                                  ;  751  4768 instr1
 11937                                  ;  752  4775 next
 11938                                  ;  753  4780 getlex
 11939                                  ;  754  4787 next
 11940                                  ;  755  4792 next
 11941                                  ;  756  4797 getlex
 11942                                  ;  757  4804 getstring
 11943                                  ;  758  4814 digit
 11944                                  ;  759  4820 getdigit
 11945                                  ;  760  4829 next
 11946                                  ;  761  4834 next
 11947                                  ;  762  4839 next
 11948                                  ;  763  4844 letter
 11949                                  ;  764  4851 strcpy
 11950                                  ;  765  4858 letter
 11951                                  ;  766  4865 next
 11952                                  ;  767  4870 eqstr
 11953                                  ;  768  4876 eqstr
 11954                                  ;  769  4882 eqstr
 11955                                  ;  770  4888 eqstr
 11956                                  ;  771  4894 eqstr
 11957                                  ;  772  4900 eqstr
 11958                                  ;  773  4906 eqstr
 11959                                  ;  774  4912 eqstr
 11960                                  ;  775  4918 eqstr
 11961                                  ;  776  4924 eqstr
 11962                                  ;  777  4930 eqstr
 11963                                  ;  778  4936 eqstr
 11964                                  ;  779  4942 eqstr
 11965                                  ;  780  4948 eqstr
 11966                                  ;  781  4954 eqstr
 11967                                  ;  782  4960 eqstr
 11968                                  ;  783  4966 eqstr
 11969                                  ;  784  4972 convertdefine
 11970                                  ;  785  4986 strcpy
 11971                                  ;  786  4993 error1
 11972                                  ;  787  5000 adrofname
 11973                                  ;  788  5010 eqstr
 11974                                  ;  789  5016 next
 11975                                  ;  790  5021 letter
 11976                                  ;  791  5028 next
 11977                                  ;  792  5033 digit
 11978                                  ;  793  5039 next
 11979                                  ;  794  5044 next
 11980                                  ;  795  5049 next
 11981                                  ;  796  5054 fgets1
 11982                                  ;  797  5061 getlex
 11983                                  ;  798  5068 istoken
 11984                                  ;  799  5076 prs
 11985                                  ;  800  5080 listproc
 11986                                  ;  801  5089 prs
 11987                                  ;  802  5093 pint1
 11988                                  ;  803  5099 error1
 11989                                  ;  804  5106 eprc
 11990                                  ;  805  5111 writetty
 11991                                  ;  806  5120 writetty
 11992                                  ;  807  5129 fputcR
 11993                                  ;  808  5136 prc
 11994                                  ;  809  5140 prs
 11995                                  ;  810  5144 prc
 11996                                  ;  811  5148 eprc
 11997                                  ;  812  5153 mkneg
 11998                                  ;  813  5159 eprnum
 11999                                  ;  814  5166 eprc
 12000                                  ;  815  5171 prc
 12001                                  ;  816  5175 mkneg
 12002                                  ;  817  5181 pint1
 12003                                  ;  818  5187 prc
 12004                                  ;  819  5191 prunsign1
 12005                                  ;  820  5201 prc
 12006                                  ;  821  5205 prc
 12007                                  ;  822  5209 prc
 12008                                  ;  823  5213 prc
 12009                                  ;  824  5217 prc
 12010                                  ;  825  5221 prunsign1
 12011                                  ;  826  5231 printinputline
 12012                                  ;  827  5246 readR
 12013                                  ;  828  5252 prs
 12014                                  ;  829  5256 prunsign1
 12015                                  ;  830  5266 prc
 12016                                  ;  831  5270 prscomment
 12017                                  ;  832  5281 fcloseR
 12018                                  ;  833  5289 fcloseR
 12019                                  ;  834  5297 exitR
 12020                                  ;  835  5303 prnl
 12021                                  ;  836  5308 prscomment
 12022                                  ;  837  5319 prs
 12023                                  ;  838  5323 prunsign1
 12024                                  ;  839  5333 prs
 12025                                  ;  840  5337 prs
 12026                                  ;  841  5341 prs
 12027                                  ;  842  5345 pint1
 12028                                  ;  843  5351 prs
 12029                                  ;  844  5355 prunsign1
 12030                                  ;  845  5365 prs
 12031                                  ;  846  5369 prc
 12032                                  ;  847  5373 prs
 12033                                  ;  848  5377 pint1
 12034                                  ;  849  5383 prs
 12035                                  ;  850  5387 prs
 12036                                  ;  851  5391 end1
 12037                                  ;  852  5396 prs
 12038                                  ;  853  5400 prs
 12039                                  ;  854  5404 prs
 12040                                  ;  855  5408 prunsign1
 12041                                  ;  856  5418 prs
 12042                                  ;  857  5422 listvar
 12043                                  ;  858  5430 prs
 12044                                  ;  859  5434 printint51
 12045                                  ;  860  5445 prc
 12046                                  ;  861  5449 prs
 12047                                  ;  862  5453 prs
 12048                                  ;  863  5457 prs
 12049                                  ;  864  5461 prs
 12050                                  ;  865  5465 prs
 12051                                  ;  866  5469 prs
 12052                                  ;  867  5473 prs
 12053                                  ;  868  5477 prs
 12054                                  ;  869  5481 prs
 12055                                  ;  870  5485 printint51
 12056                                  ;  871  5496 printint51
 12057                                  ;  872  5507 prs
 12058                                  ;  873  5511 prs
 12059                                  ;  874  5515 prc
 12060                                  ;  875  5519 adrofname
 12061                                  ;  876  5529 prs
 12062                                  ;  877  5533 prc
 12063                                  ;  878  5537 prunsign1
 12064                                  ;  879  5547 prc
 12065                                  ;  880  5551 prunsign1
 12066                                  ;  881  5561 prc
 12067                                  ;  882  5565 prs
 12068                                  ;  883  5569 prc
 12069                                  ;  884  5573 pint1
 12070                                  ;  885  5579 prs
 12071                                  ;  886  5583 calllisting
 12072                                  ;  887  5595 prs
 12073                                  ;  888  5599 printint51
 12074                                  ;  889  5610 prc
 12075                                  ;  890  5614 prs
 12076                                  ;  891  5618 printint51
 12077                                  ;  892  5629 prc
 12078                                  ;  893  5633 from_far
 12079                                  ;  894  5642 prs
 12080                                  ;  895  5646 adrF
 12081                                  ;  896  5651 from_far
 12082                                  ;  897  5660 eqstr
 12083                                  ;  898  5666 prs
 12084                                  ;  899  5670 countcalls
 12085                                  ;  900  5681 funclisting
 12086                                  ;  901  5693 prs
 12087                                  ;  902  5697 printint51
 12088                                  ;  903  5708 printint51
 12089                                  ;  904  5719 prs
 12090                                  ;  905  5723 printint51
 12091                                  ;  906  5734 prc
 12092                                  ;  907  5738 prs
 12093                                  ;  908  5742 prs
 12094                                  ;  909  5746 prs
 12095                                  ;  910  5750 prs
 12096                                  ;  911  5754 prc
 12097                                  ;  912  5758 prc
 12098                                  ;  913  5762 adrF
 12099                                  ;  914  5767 prs
 12100                                  ;  915  5771 strcpy
 12101                                  ;  916  5778 storefunc
 12102                                  ;  917  5788 prs
 12103                                  ;  918  5792 prs
 12104                                  ;  919  5796 listvar
 12105                                  ;  920  5804 listfunc
 12106                                  ;  921  5813 listcall
 12107                                  ;  922  5822 prs
 12108                                  ;  923  5826 prs
 12109                                  ;  924  5830 prs
 12110                                  ;  925  5834 prs
 12111                                  ;  926  5838 prs
 12112                                  ;  927  5842 printint51
 12113                                  ;  928  5853 prs
 12114                                  ;  929  5857 printint51
 12115                                  ;  930  5868 prs
 12116                                  ;  931  5872 printint51
 12117                                  ;  932  5883 prs
 12118                                  ;  933  5887 printint51
 12119                                  ;  934  5898 prs
 12120                                  ;  935  5902 printint51
 12121                                  ;  936  5913 prs
 12122                                  ;  937  5917 printint51
 12123                                  ;  938  5928 prs
 12124                                  ;  939  5932 printint51
 12125                                  ;  940  5943 prs
 12126                                  ;  941  5947 printint51
 12127                                  ;  942  5958 prs
 12128                                  ;  943  5962 printint51
 12129                                  ;  944  5973 prs
 12130                                  ;  945  5977 printint51
 12131                                  ;  946  5988 prs
 12132                                  ;  947  5992 printint51
 12133                                  ;  948  6003 prs
 12134                                  ;  949  6007 printint51
 12135                                  ;  950  6018 prs
 12136                                  ;  951  6022 prs
 12137                                  ;  952  6026 prunsign1
 12138                                  ;  953  6036 prs
 12139                                  ;  954  6040 printint51
 12140                                  ;  955  6051 prs
 12141                                  ;  956  6055 prs
 12142                                  ;  957  6059 prs
 12143                                  ;  958  6063 prs
 12144                                  ;  959  6067 printint51
 12145                                  ;  960  6078 prs
 12146                                  ;  961  6082 printint51
 12147                                  ;  962  6093 prs
 12148                                  ;  963  6097 printint51
 12149                                  ;  964  6108 prs
 12150                                  ;  965  6112 end1
 12151                                  ;  966  6117 DosInt
 12152                                  ;  967  6124 DosInt
 12153                                  ;Input: A.C, List: A.S,  Lines: 1003
 12154                                  ;Glob. variables:  129 max.:  200
 12155                                  ;Functions      :  110 max.:  300
 12156                                  ;Calls          :  968 max.: 2000, NameField: 6131 max.:    65535
 12157                                  ;Code until     :21830 max.: 30000, free: 8170
 12158                                  ;Data (HeapEnd) :53548, resting stacksize: 11987
 12159                                  ;Max. Const in 'epilog' :  947 max. 3000, free: 2053
