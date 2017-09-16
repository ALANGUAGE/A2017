     1                                  
     2                                  ; A.COM V0.9, Arglen: 4, Argv: A.C, Source: A.C, Output asm: A.S
     3                                  org  256 
     4 00000000 E99730                  jmp main
     5                                  
     6                                  ;-1 //  @@ret redefined 2011.04.25 23.644 bytes, Full  Working 2017.09.13
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
   374 00000083 0F850500                 jne @@putch1
   375 00000087 B00D                     mov  al, 13
   376 00000089 E8E7FF                   call writetty
   377                                  @@putch1:
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
   392                                  @@cputs2:
   393 00000098 8B5E04                   mov bx, [bp+4]
   394 0000009B 8A07                     mov al, [bx]
   395 0000009D B400                     mov ah, 0
   396 0000009F 08C0                     or  al, al
   397 000000A1 0F841B00                 je @@cputs3
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
   408 000000BE EBD8                     jmp @@cputs2
   409                                  @@cputs3:
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
   577                                  @@strlen4:
   578 0000015D 8B5E04                   mov bx, [bp+4]
   579 00000160 8A07                     mov al, [bx]
   580 00000162 B400                     mov ah, 0
   581 00000164 83F800                   cmp ax, 0
   582 00000167 0F840800                 je  @@strlen5
   583 0000016B FF4604                   inc  word[bp+4]
   584 0000016E FF46FE                   inc  word[bp-2]
   585 00000171 EBEA                     jmp @@strlen4
   586                                  @@strlen5:
   587 00000173 8B46FE                   mov ax, [bp-2]
   588 00000176 E90000                   jmp @@retn
   589                                  
   590                                  ;-95 int strcpy(char *s, char *t) {do { *s=*t; s++; t++; } while (*t!=0); *s=0; }
   591                                  
   592 00000179 C9                      @@retn: LEAVE
   593 0000017A C3                       ret
   594                                  ; ENDP
   595                                  
   596                                  strcpy:  ; *** PROC ***
   597                                  ;Function : strcpy, Number of local variables: 2
   598                                  ;   # type sign width addr used name   list of local variables
   599                                  ;  200 ptr sign byte    95 NULL s = bp+4
   600                                  ;  201 ptr sign byte    95 NULL t = bp+6;
   601 0000017B C8000000                 ENTER  0,0
   602                                  @@strcpy6:
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
   614 0000019B 0F840200                 je  @@strcpy7
   615 0000019F EBDE                     jmp @@strcpy6
   616                                  @@strcpy7:
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
   632                                  @@eqstr8:
   633 000001AF 8B5E04                   mov bx, [bp+4]
   634 000001B2 8A07                     mov al, [bx]
   635 000001B4 B400                     mov ah, 0
   636 000001B6 08C0                     or  al, al
   637 000001B8 0F842000                 je @@eqstr9
   638                                  
   639                                  ;-97     if (*p != *q) return 0; p++; q++; }
   640                                  
   641 000001BC 8B5E04                   mov bx, [bp+4]
   642 000001BF 8A07                     mov al, [bx]
   643 000001C1 B400                     mov ah, 0
   644 000001C3 8B5E06                   mov bx, [bp+6]
   645 000001C6 3A07                     cmp al, [bx]
   646 000001C8 B400                     mov ah, 0
   647 000001CA 0F840600                 je  @@eqstr10
   648 000001CE B80000                   mov ax, 0
   649 000001D1 E92100                   jmp @@retn
   650                                  @@eqstr10:
   651 000001D4 FF4604                   inc  word[bp+4]
   652 000001D7 FF4606                   inc  word[bp+6]
   653                                  
   654                                  ;-98     if(*q) return 0; return 1; }
   655                                  
   656 000001DA EBD3                     jmp @@eqstr8
   657                                  @@eqstr9:
   658 000001DC 8B5E06                   mov bx, [bp+6]
   659 000001DF 8A07                     mov al, [bx]
   660 000001E1 B400                     mov ah, 0
   661 000001E3 08C0                     or  al, al
   662 000001E5 0F840600                 je @@eqstr11
   663 000001E9 B80000                   mov ax, 0
   664 000001EC E90600                   jmp @@retn
   665                                  @@eqstr11:
   666 000001EF B80100                   mov ax, 1
   667 000001F2 E90000                   jmp @@retn
   668                                  
   669                                  ;-99 int instr1(char *s, char c) { while(*s) {if (*s==c) return 1; s++;}return 0;}
   670                                  
   671 000001F5 C9                      @@retn: LEAVE
   672 000001F6 C3                       ret
   673                                  ; ENDP
   674                                  
   675                                  instr1:  ; *** PROC ***
   676                                  ;Function : instr1, Number of local variables: 2
   677                                  ;   # type sign width addr used name   list of local variables
   678                                  ;  200 ptr sign byte    99 NULL s = bp+4
   679                                  ;  201 var sign byte    99 NULL c = bp+6;
   680 000001F7 C8000000                 ENTER  0,0
   681                                  @@instr112:
   682 000001FB 8B5E04                   mov bx, [bp+4]
   683 000001FE 8A07                     mov al, [bx]
   684 00000200 B400                     mov ah, 0
   685 00000202 08C0                     or  al, al
   686 00000204 0F841900                 je @@instr113
   687 00000208 8B5E04                   mov bx, [bp+4]
   688 0000020B 8A07                     mov al, [bx]
   689 0000020D B400                     mov ah, 0
   690 0000020F 3A4606                   cmp al, [bp+6]
   691 00000212 0F850600                 jne @@instr114
   692 00000216 B80100                   mov ax, 1
   693 00000219 E90B00                   jmp @@retn
   694                                  @@instr114:
   695 0000021C FF4604                   inc  word[bp+4]
   696 0000021F EBDA                     jmp @@instr112
   697                                  @@instr113:
   698 00000221 B80000                   mov ax, 0
   699 00000224 E90000                   jmp @@retn
   700                                  
   701                                  ;-100 int instr2(char *s, char c) { while(*s) {if (*s==c)return &s; s++;}return 0;}
   702                                  
   703 00000227 C9                      @@retn: LEAVE
   704 00000228 C3                       ret
   705                                  ; ENDP
   706                                  
   707                                  instr2:  ; *** PROC ***
   708                                  ;Function : instr2, Number of local variables: 2
   709                                  ;   # type sign width addr used name   list of local variables
   710                                  ;  200 ptr sign byte   100 NULL s = bp+4
   711                                  ;  201 var sign byte   100 NULL c = bp+6;
   712 00000229 C8000000                 ENTER  0,0
   713                                  @@instr215:
   714 0000022D 8B5E04                   mov bx, [bp+4]
   715 00000230 8A07                     mov al, [bx]
   716 00000232 B400                     mov ah, 0
   717 00000234 08C0                     or  al, al
   718 00000236 0F841900                 je @@instr216
   719 0000023A 8B5E04                   mov bx, [bp+4]
   720 0000023D 8A07                     mov al, [bx]
   721 0000023F B400                     mov ah, 0
   722 00000241 3A4606                   cmp al, [bp+6]
   723 00000244 0F850600                 jne @@instr217
   724 00000248 8B4604                   mov ax, [bp+4]
   725 0000024B E90B00                   jmp @@retn
   726                                  @@instr217:
   727 0000024E FF4604                   inc  word[bp+4]
   728 00000251 EBDA                     jmp @@instr215
   729                                  @@instr216:
   730 00000253 B80000                   mov ax, 0
   731 00000256 E90000                   jmp @@retn
   732                                  
   733                                  ;-101 int strcat1(char *s, char *t) { while (*s != 0) s++; strcpy(s, t);  }
   734                                  
   735 00000259 C9                      @@retn: LEAVE
   736 0000025A C3                       ret
   737                                  ; ENDP
   738                                  
   739                                  strcat1:  ; *** PROC ***
   740                                  ;Function : strcat1, Number of local variables: 2
   741                                  ;   # type sign width addr used name   list of local variables
   742                                  ;  200 ptr sign byte   101 NULL s = bp+4
   743                                  ;  201 ptr sign byte   101 NULL t = bp+6;
   744 0000025B C8000000                 ENTER  0,0
   745                                  @@strcat118:
   746 0000025F 8B5E04                   mov bx, [bp+4]
   747 00000262 8A07                     mov al, [bx]
   748 00000264 B400                     mov ah, 0
   749 00000266 83F800                   cmp ax, 0
   750 00000269 0F840500                 je  @@strcat119
   751 0000026D FF4604                   inc  word[bp+4]
   752 00000270 EBED                     jmp @@strcat118
   753                                  @@strcat119:
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
   769                                  @@toupper20:
   770 00000284 8B5E04                   mov bx, [bp+4]
   771 00000287 8A07                     mov al, [bx]
   772 00000289 B400                     mov ah, 0
   773 0000028B 08C0                     or  al, al
   774 0000028D 0F843000                 je @@toupper21
   775 00000291 8B5E04                   mov bx, [bp+4]
   776 00000294 8A07                     mov al, [bx]
   777 00000296 B400                     mov ah, 0
   778 00000298 83F861                   cmp ax, 97 ;unsigned : 1
   779 0000029B 0F8C1D00                 jl  @@toupper22
   780 0000029F 8B5E04                   mov bx, [bp+4]
   781 000002A2 8A07                     mov al, [bx]
   782 000002A4 B400                     mov ah, 0
   783 000002A6 83F87A                   cmp ax, 122
   784 000002A9 0F8F0F00                 jg  @@toupper23
   785 000002AD 8B5E04                   mov bx, [bp+4]
   786 000002B0 8A07                     mov al, [bx]
   787 000002B2 B400                     mov ah, 0
   788 000002B4 83E820                   sub ax, 32
   789 000002B7 8B5E04                   mov  bx, [bp+4]
   790 000002BA 8807                     mov  [bx], al
   791                                  @@toupper23:
   792                                  @@toupper22:
   793 000002BC FF4604                   inc  word[bp+4]
   794 000002BF EBC3                     jmp @@toupper20
   795                                  @@toupper21:
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
   810 000002CD 0F8D1400                 jge @@pint24
   811 000002D1 6A2D                     push 45
   812 000002D3 E89642                   call prc
   813 000002D6 83C402                   add  sp, 2
   814 000002D9 FF7604                   push word [bp+4]
   815 000002DC E8E3FD                   call mkneg
   816 000002DF 83C402                   add  sp, 2
   817 000002E2 894604                   mov [bp+4], ax
   818                                  
   819                                  ;-104   if (n >= 10) {e=n/10;  pint(e);}  n=n%10; n=n+'0'; putch(n); }
   820                                  
   821                                  @@pint24:
   822 000002E5 8B4604                   mov ax, [bp+4]
   823 000002E8 83F80A                   cmp ax, 10 ;unsigned : 1
   824 000002EB 0F8C1500                 jl  @@pint25
   825 000002EF 8B4604                   mov ax, [bp+4]
   826 000002F2 BB0A00                   mov bx, 10
   827 000002F5 99                       cwd
   828 000002F6 F7FB                     idiv bx
   829 000002F8 8946FE                   mov [bp-2], ax
   830 000002FB FF76FE                   push word [bp-2]
   831 000002FE E8C2FF                   call pint
   832 00000301 83C402                   add  sp, 2
   833                                  @@pint25:
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
   862 0000032F 0F8D0600                 jge @@digit26
   863 00000333 B80000                   mov ax, 0
   864 00000336 E91500                   jmp @@retn
   865                                  
   866                                  ;-107     if(c>'9') return 0; 
   867                                  
   868                                  @@digit26:
   869 00000339 8A4604                   mov al, [bp+4]
   870 0000033C 3C39                     cmp al, 57
   871 0000033E 0F8E0600                 jle @@digit27
   872 00000342 B80000                   mov ax, 0
   873 00000345 E90600                   jmp @@retn
   874                                  
   875                                  ;-108     return 1; 
   876                                  
   877                                  @@digit27:
   878 00000348 B80100                   mov ax, 1
   879 0000034B E90000                   jmp @@retn
   880                                  
   881                                  ;-109 }
   882                                  
   883                                  
   884                                  ;-110 int letter(char c) { 
   885                                  
   886 0000034E C9                      @@retn: LEAVE
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
   904 00000362 0F840600                 je @@letter28
   905 00000366 B80100                   mov ax, 1
   906 00000369 E97800                   jmp @@retn
   907                                  
   908                                  ;-112     if (c=='_') return 1;
   909                                  
   910                                  @@letter28:
   911 0000036C 8A4604                   mov al, [bp+4]
   912 0000036F 3C5F                     cmp al, 95
   913 00000371 0F850600                 jne @@letter29
   914 00000375 B80100                   mov ax, 1
   915 00000378 E96900                   jmp @@retn
   916                                  
   917                                  ;-113     if (c=='.') return 1;
   918                                  
   919                                  @@letter29:
   920 0000037B 8A4604                   mov al, [bp+4]
   921 0000037E 3C2E                     cmp al, 46
   922 00000380 0F850600                 jne @@letter30
   923 00000384 B80100                   mov ax, 1
   924 00000387 E95A00                   jmp @@retn
   925                                  
   926                                  ;-114     if (c=='?') return 1;
   927                                  
   928                                  @@letter30:
   929 0000038A 8A4604                   mov al, [bp+4]
   930 0000038D 3C3F                     cmp al, 63
   931 0000038F 0F850600                 jne @@letter31
   932 00000393 B80100                   mov ax, 1
   933 00000396 E94B00                   jmp @@retn
   934                                  
   935                                  ;-115     if (c=='$') return 1;
   936                                  
   937                                  @@letter31:
   938 00000399 8A4604                   mov al, [bp+4]
   939 0000039C 3C24                     cmp al, 36
   940 0000039E 0F850600                 jne @@letter32
   941 000003A2 B80100                   mov ax, 1
   942 000003A5 E93C00                   jmp @@retn
   943                                  
   944                                  ;-116     if (c> 'z') return 0; 
   945                                  
   946                                  @@letter32:
   947 000003A8 8A4604                   mov al, [bp+4]
   948 000003AB 3C7A                     cmp al, 122
   949 000003AD 0F8E0600                 jle @@letter33
   950 000003B1 B80000                   mov ax, 0
   951 000003B4 E92D00                   jmp @@retn
   952                                  
   953                                  ;-117     if (c< '@') return 0;// at included
   954                                  
   955                                  @@letter33:
   956 000003B7 8A4604                   mov al, [bp+4]
   957 000003BA 3C40                     cmp al, 64
   958 000003BC 0F8D0600                 jge @@letter34
   959 000003C0 B80000                   mov ax, 0
   960 000003C3 E91E00                   jmp @@retn
   961                                  
   962                                  ;-118     if (c> 'Z') { if (c< 'a') return 0; }  
   963                                  
   964                                  @@letter34:
   965 000003C6 8A4604                   mov al, [bp+4]
   966 000003C9 3C5A                     cmp al, 90
   967 000003CB 0F8E0F00                 jle @@letter35
   968 000003CF 8A4604                   mov al, [bp+4]
   969 000003D2 3C61                     cmp al, 97
   970 000003D4 0F8D0600                 jge @@letter36
   971 000003D8 B80000                   mov ax, 0
   972 000003DB E90600                   jmp @@retn
   973                                  @@letter36:
   974                                  
   975                                  ;-119     return 1; 
   976                                  
   977                                  @@letter35:
   978 000003DE B80100                   mov ax, 1
   979 000003E1 E90000                   jmp @@retn
   980                                  
   981                                  ;-120 }    
   982                                  
   983                                  
   984                                  ;-121 int alnum(char c) {
   985                                  
   986 000003E4 C9                      @@retn: LEAVE
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
  1004 000003F8 0F840600                 je @@alnum37
  1005 000003FC B80100                   mov ax, 1
  1006 000003FF E91E00                   jmp @@retn
  1007                                  
  1008                                  ;-123   if (letter(c)) return 1;
  1009                                  
  1010                                  @@alnum37:
  1011 00000402 8A4604                   mov al, byte [bp+4]
  1012 00000405 B400                     mov ah, 0
  1013 00000407 50                       push ax
  1014 00000408 E845FF                   call letter
  1015 0000040B 83C402                   add  sp, 2
  1016 0000040E 08C0                     or  al, al
  1017 00000410 0F840600                 je @@alnum38
  1018 00000414 B80100                   mov ax, 1
  1019 00000417 E90600                   jmp @@retn
  1020                                  
  1021                                  ;-124   return 0;
  1022                                  
  1023                                  @@alnum38:
  1024 0000041A B80000                   mov ax, 0
  1025 0000041D E90000                   jmp @@retn
  1026                                  
  1027                                  ;-125 }       
  1028                                  
  1029                                  
  1030                                  ;-126 int a(unsigned int i) {  printName(i);}//address
  1031                                  
  1032 00000420 C9                      @@retn: LEAVE
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
  1060 0000043B 0F8D0800                 jge @@v39
  1061 0000043F 6A5B                     push 91
  1062 00000441 E82841                   call prc
  1063 00000444 83C402                   add  sp, 2
  1064                                  
  1065                                  ;-129     printName(i);
  1066                                  
  1067                                  @@v39:
  1068 00000447 FF7604                   push word [bp+4]
  1069 0000044A E86C05                   call printName
  1070 0000044D 83C402                   add  sp, 2
  1071                                  
  1072                                  ;-130     if (i < LSTART) prc(']');   
  1073                                  
  1074 00000450 8B4604                   mov ax, [bp+4]
  1075 00000453 3DC800                   cmp ax, 200
  1076 00000456 0F8D0800                 jge @@v40
  1077 0000045A 6A5D                     push 93
  1078 0000045C E80D41                   call prc
  1079 0000045F 83C402                   add  sp, 2
  1080                                  
  1081                                  ;-131 }
  1082                                  
  1083                                  @@v40:
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
  1105 0000047C 0F8E0900                 jle @@checknamelen41
  1106 00000480 68[8B04]                 push checknamelen_0
  1107 00000483 E83644                   call error1
  1108 00000486 83C402                   add  sp, 2
  1109                                  
  1110                                  ;-134 }
  1111                                  
  1112                                  @@checknamelen41:
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
  1145 000004C0 0F8C0900                 jl  @@doglob42
  1146 000004C4 68[0508]                 push doglob_0
  1147 000004C7 E8F243                   call error1
  1148 000004CA 83C402                   add  sp, 2
  1149                                  
  1150                                  ;-138   if (iswidth == 0) error1("no VOID as var type");
  1151                                  
  1152                                  @@doglob42:
  1153 000004CD A0[3800]                 mov al, [iswidth]
  1154 000004D0 3C00                     cmp al, 0
  1155 000004D2 0F850900                 jne @@doglob43
  1156 000004D6 68[1708]                 push doglob_1
  1157 000004D9 E8E043                   call error1
  1158 000004DC 83C402                   add  sp, 2
  1159                                  
  1160                                  ;-139   checknamelen();
  1161                                  
  1162                                  @@doglob43:
  1163 000004DF E882FF                   call checknamelen
  1164                                  
  1165                                  ;-140   if (checkName() != 0) error1("Variable already defined");
  1166                                  
  1167 000004E2 E88305                   call checkName
  1168 000004E5 3C00                     cmp al, 0
  1169 000004E7 0F840900                 je  @@doglob44
  1170 000004EB 68[2B08]                 push doglob_2
  1171 000004EE E8CB43                   call error1
  1172 000004F1 83C402                   add  sp, 2
  1173                                  
  1174                                  ;-141   if (istoken('[')) { istype='&';
  1175                                  
  1176                                  @@doglob44:
  1177 000004F4 6A5B                     push 91
  1178 000004F6 E8A53F                   call istoken
  1179 000004F9 83C402                   add  sp, 2
  1180 000004FC 08C0                     or  al, al
  1181 000004FE 0F84E201                 je @@doglob45
  1182 00000502 B82600                   mov ax, 38
  1183 00000505 A2[3200]                 mov byte [istype], al
  1184                                  
  1185                                  ;-142     if (istoken(T_CONST)) {
  1186                                  
  1187 00000508 680101                   push 257
  1188 0000050B E8903F                   call istoken
  1189 0000050E 83C402                   add  sp, 2
  1190 00000511 08C0                     or  al, al
  1191 00000513 0F84C200                 je @@doglob46
  1192                                  
  1193                                  ;-143       prs("\nsection .bss\nabsolute ");
  1194                                  
  1195 00000517 68[4408]                 push doglob_3
  1196 0000051A E8B640                   call prs
  1197 0000051D 83C402                   add  sp, 2
  1198                                  
  1199                                  ;-144       prunsign1(orgData);
  1200                                  
  1201 00000520 FF36[1000]               push word [orgData]
  1202 00000524 E80642                   call prunsign1
  1203 00000527 83C402                   add  sp, 2
  1204                                  
  1205                                  ;-145       prs("\n"); prs(symbol); 
  1206                                  
  1207 0000052A 68[5E08]                 push doglob_4
  1208 0000052D E8A340                   call prs
  1209 00000530 83C402                   add  sp, 2
  1210 00000533 8D062B81                 lea  ax, [symbol]
  1211 00000537 50                       push ax
  1212 00000538 E89840                   call prs
  1213 0000053B 83C402                   add  sp, 2
  1214                                  
  1215                                  ;-146       if (iswidth==1) prs(" resb "); 
  1216                                  
  1217 0000053E A0[3800]                 mov al, [iswidth]
  1218 00000541 3C01                     cmp al, 1
  1219 00000543 0F850900                 jne @@doglob47
  1220 00000547 68[6108]                 push doglob_5
  1221 0000054A E88640                   call prs
  1222 0000054D 83C402                   add  sp, 2
  1223                                  
  1224                                  ;-147       if (iswidth==2) prs(" resw ");
  1225                                  
  1226                                  @@doglob47:
  1227 00000550 A0[3800]                 mov al, [iswidth]
  1228 00000553 3C02                     cmp al, 2
  1229 00000555 0F850900                 jne @@doglob48
  1230 00000559 68[6808]                 push doglob_6
  1231 0000055C E87440                   call prs
  1232 0000055F 83C402                   add  sp, 2
  1233                                  
  1234                                  ;-148       if (iswidth==4) prs(" resd ");
  1235                                  
  1236                                  @@doglob48:
  1237 00000562 A0[3800]                 mov al, [iswidth]
  1238 00000565 3C04                     cmp al, 4
  1239 00000567 0F850900                 jne @@doglob49
  1240 0000056B 68[6F08]                 push doglob_7
  1241 0000056E E86240                   call prs
  1242 00000571 83C402                   add  sp, 2
  1243                                  
  1244                                  ;-149       prunsign1(lexval); 
  1245                                  
  1246                                  @@doglob49:
  1247 00000574 FF36[2E00]               push word [lexval]
  1248 00000578 E8B241                   call prunsign1
  1249 0000057B 83C402                   add  sp, 2
  1250                                  
  1251                                  ;-150       prs("\nsection .text");
  1252                                  
  1253 0000057E 68[7608]                 push doglob_8
  1254 00000581 E84F40                   call prs
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
  1267 00000596 0F850A00                 jne @@doglob50
  1268 0000059A A1[1000]                 mov ax, [orgData]
  1269 0000059D 0306[2E00]               add ax, [lexval]
  1270 000005A1 A3[1000]                 mov word [orgData], ax
  1271                                  
  1272                                  ;-153       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}
  1273                                  
  1274                                  @@doglob50:
  1275 000005A4 A0[3800]                 mov al, [iswidth]
  1276 000005A7 3C04                     cmp al, 4
  1277 000005A9 0F851400                 jne @@doglob51
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
  1288                                  @@doglob51:
  1289 000005C1 A1[2E00]                 mov ax, [lexval]
  1290 000005C4 8B1E[2A00]               mov bx, [GTop]
  1291 000005C8 D1E3                     shl bx, 1
  1292 000005CA 8987EB8A                 mov [GData+bx], ax
  1293 000005CE 6A5D                     push 93
  1294 000005D0 E8ED3E                   call expect
  1295 000005D3 83C402                   add  sp, 2
  1296                                  
  1297                                  ;-155     }else { expect(']');
  1298                                  
  1299 000005D6 E90801                   jmp @@doglob52
  1300                                  @@doglob46:
  1301 000005D9 6A5D                     push 93
  1302 000005DB E8E23E                   call expect
  1303 000005DE 83C402                   add  sp, 2
  1304                                  
  1305                                  ;-156       if (iswidth != 1) error1("Only ByteArray allowed");
  1306                                  
  1307 000005E1 A0[3800]                 mov al, [iswidth]
  1308 000005E4 3C01                     cmp al, 1
  1309 000005E6 0F840900                 je  @@doglob53
  1310 000005EA 68[8608]                 push doglob_9
  1311 000005ED E8CC42                   call error1
  1312 000005F0 83C402                   add  sp, 2
  1313                                  
  1314                                  ;-157       prs("\n"); prs(symbol); prs(" db "); 
  1315                                  
  1316                                  @@doglob53:
  1317 000005F3 68[9D08]                 push doglob_10
  1318 000005F6 E8DA3F                   call prs
  1319 000005F9 83C402                   add  sp, 2
  1320 000005FC 8D062B81                 lea  ax, [symbol]
  1321 00000600 50                       push ax
  1322 00000601 E8CF3F                   call prs
  1323 00000604 83C402                   add  sp, 2
  1324 00000607 68[A008]                 push doglob_11
  1325 0000060A E8C63F                   call prs
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
  1342 00000628 E8953E                   call expect
  1343 0000062B 83C402                   add  sp, 2
  1344                                  
  1345                                  ;-160       if (istoken(T_STRING)) { 
  1346                                  
  1347 0000062E 680201                   push 258
  1348 00000631 E86A3E                   call istoken
  1349 00000634 83C402                   add  sp, 2
  1350 00000637 08C0                     or  al, al
  1351 00000639 0F844200                 je @@doglob54
  1352                                  
  1353                                  ;-161         prc(34); prscomment(symbol); prc(34); prs(",0"); 
  1354                                  
  1355 0000063D 6A22                     push 34
  1356 0000063F E82A3F                   call prc
  1357 00000642 83C402                   add  sp, 2
  1358 00000645 8D062B81                 lea  ax, [symbol]
  1359 00000649 50                       push ax
  1360 0000064A E84A3F                   call prscomment
  1361 0000064D 83C402                   add  sp, 2
  1362 00000650 6A22                     push 34
  1363 00000652 E8173F                   call prc
  1364 00000655 83C402                   add  sp, 2
  1365 00000658 68[A508]                 push doglob_12
  1366 0000065B E8753F                   call prs
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
  1383 0000067C E96200                   jmp @@doglob55
  1384                                  @@doglob54:
  1385 0000067F 6A7B                     push 123
  1386 00000681 E81A3E                   call istoken
  1387 00000684 83C402                   add  sp, 2
  1388 00000687 08C0                     or  al, al
  1389 00000689 0F844B00                 je @@doglob56
  1390 0000068D B80000                   mov ax, 0
  1391 00000690 8946FE                   mov [bp-2], ax
  1392                                  
  1393                                  ;-164         do { if(i) prc(','); 
  1394                                  
  1395                                  @@doglob57:
  1396 00000693 8B46FE                   mov ax, [bp-2]
  1397 00000696 08C0                     or  al, al
  1398 00000698 0F840800                 je @@doglob58
  1399 0000069C 6A2C                     push 44
  1400 0000069E E8CB3E                   call prc
  1401 000006A1 83C402                   add  sp, 2
  1402                                  
  1403                                  ;-165           expect(T_CONST); prunsign1(lexval); i=1; }
  1404                                  
  1405                                  @@doglob58:
  1406 000006A4 680101                   push 257
  1407 000006A7 E8163E                   call expect
  1408 000006AA 83C402                   add  sp, 2
  1409 000006AD FF36[2E00]               push word [lexval]
  1410 000006B1 E87940                   call prunsign1
  1411 000006B4 83C402                   add  sp, 2
  1412 000006B7 B80100                   mov ax, 1
  1413 000006BA 8946FE                   mov [bp-2], ax
  1414                                  
  1415                                  ;-166         while (istoken(',')); expect('}'); }  
  1416                                  
  1417 000006BD 6A2C                     push 44
  1418 000006BF E8DC3D                   call istoken
  1419 000006C2 83C402                   add  sp, 2
  1420 000006C5 08C0                     or  al, al
  1421 000006C7 0F840200                 je @@doglob59
  1422 000006CB EBC6                     jmp @@doglob57
  1423                                  @@doglob59:
  1424 000006CD 6A7D                     push 125
  1425 000006CF E8EE3D                   call expect
  1426 000006D2 83C402                   add  sp, 2
  1427                                  
  1428                                  ;-167       else error1("String or number array expected");
  1429                                  
  1430 000006D5 E90900                   jmp @@doglob60
  1431                                  @@doglob56:
  1432 000006D8 68[A808]                 push doglob_13
  1433 000006DB E8DE41                   call error1
  1434 000006DE 83C402                   add  sp, 2
  1435                                  
  1436                                  ;-168       }; 
  1437                                  
  1438                                  @@doglob60:
  1439                                  @@doglob55:
  1440                                  @@doglob52:
  1441                                  
  1442                                  ;-169   }else { //expect('=');
  1443                                  
  1444 000006E1 E99E00                   jmp @@doglob61
  1445                                  @@doglob45:
  1446                                  
  1447                                  ;-170     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");
  1448                                  
  1449 000006E4 68[C808]                 push doglob_14
  1450 000006E7 E8E93E                   call prs
  1451 000006EA 83C402                   add  sp, 2
  1452 000006ED 8D062B81                 lea  ax, [symbol]
  1453 000006F1 50                       push ax
  1454 000006F2 E8DE3E                   call prs
  1455 000006F5 83C402                   add  sp, 2
  1456 000006F8 A0[3200]                 mov al, [istype]
  1457 000006FB 3C2A                     cmp al, 42
  1458 000006FD 0F850C00                 jne @@doglob62
  1459 00000701 68[CB08]                 push doglob_15
  1460 00000704 E8CC3E                   call prs
  1461 00000707 83C402                   add  sp, 2
  1462                                  
  1463                                  ;-171     else {
  1464                                  
  1465 0000070A E93300                   jmp @@doglob63
  1466                                  @@doglob62:
  1467                                  
  1468                                  ;-172       if      (iswidth==1) prs(" db ");
  1469                                  
  1470 0000070D A0[3800]                 mov al, [iswidth]
  1471 00000710 3C01                     cmp al, 1
  1472 00000712 0F850C00                 jne @@doglob64
  1473 00000716 68[D008]                 push doglob_16
  1474 00000719 E8B73E                   call prs
  1475 0000071C 83C402                   add  sp, 2
  1476                                  
  1477                                  ;-173       else if (iswidth==2) prs(" dw ");
  1478                                  
  1479 0000071F E91E00                   jmp @@doglob65
  1480                                  @@doglob64:
  1481 00000722 A0[3800]                 mov al, [iswidth]
  1482 00000725 3C02                     cmp al, 2
  1483 00000727 0F850C00                 jne @@doglob66
  1484 0000072B 68[D508]                 push doglob_17
  1485 0000072E E8A23E                   call prs
  1486 00000731 83C402                   add  sp, 2
  1487                                  
  1488                                  ;-174       else                 prs(" dd ");
  1489                                  
  1490 00000734 E90900                   jmp @@doglob67
  1491                                  @@doglob66:
  1492 00000737 68[DA08]                 push doglob_18
  1493 0000073A E8963E                   call prs
  1494 0000073D 83C402                   add  sp, 2
  1495                                  
  1496                                  ;-175     }
  1497                                  
  1498                                  @@doglob67:
  1499                                  @@doglob65:
  1500                                  
  1501                                  ;-176     if(istoken('-')) prc('-');
  1502                                  
  1503                                  @@doglob63:
  1504 00000740 6A2D                     push 45
  1505 00000742 E8593D                   call istoken
  1506 00000745 83C402                   add  sp, 2
  1507 00000748 08C0                     or  al, al
  1508 0000074A 0F840800                 je @@doglob68
  1509 0000074E 6A2D                     push 45
  1510 00000750 E8193E                   call prc
  1511 00000753 83C402                   add  sp, 2
  1512                                  
  1513                                  ;-177     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }
  1514                                  
  1515                                  @@doglob68:
  1516 00000756 6A3D                     push 61
  1517 00000758 E8433D                   call istoken
  1518 0000075B 83C402                   add  sp, 2
  1519 0000075E 08C0                     or  al, al
  1520 00000760 0F841600                 je @@doglob69
  1521 00000764 680101                   push 257
  1522 00000767 E8563D                   call expect
  1523 0000076A 83C402                   add  sp, 2
  1524 0000076D FF36[2E00]               push word [lexval]
  1525 00000771 E8B93F                   call prunsign1
  1526 00000774 83C402                   add  sp, 2
  1527                                  
  1528                                  ;-178     else prunsign1(0); }
  1529                                  
  1530 00000777 E90800                   jmp @@doglob70
  1531                                  @@doglob69:
  1532 0000077A 6A00                     push 0
  1533 0000077C E8AE3F                   call prunsign1
  1534 0000077F 83C402                   add  sp, 2
  1535                                  @@doglob70:
  1536                                  
  1537                                  ;-179   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;
  1538                                  
  1539                                  @@doglob61:
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
  1573 000007D2 0F841200                 je @@doglob71
  1574 000007D6 8D068FD0                 lea  ax, [doglobName]
  1575 000007DA 50                       push ax
  1576 000007DB FF36[6A00]               push word [pt]
  1577 000007DF E899F9                   call strcpy
  1578 000007E2 83C404                   add  sp, 4
  1579 000007E5 E90F00                   jmp @@doglob72
  1580                                  @@doglob71:
  1581 000007E8 8D062B81                 lea  ax, [symbol]
  1582 000007EC 50                       push ax
  1583 000007ED FF36[6A00]               push word [pt]
  1584 000007F1 E887F9                   call strcpy
  1585 000007F4 83C404                   add  sp, 4
  1586                                  
  1587                                  ;-183   GTop++; expect(';'); }
  1588                                  
  1589                                  @@doglob72:
  1590 000007F7 FF06[2A00]               inc  word[GTop]
  1591 000007FB 6A3B                     push 59
  1592 000007FD E8C03C                   call expect
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
  1650 000008F2 0F850900                 jne @@gettypes73
  1651 000008F6 B80100                   mov ax, 1
  1652 000008F9 A3[3300]                 mov word [signi], ax
  1653 000008FC E90600                   jmp @@gettypes74
  1654                                  @@gettypes73:
  1655 000008FF B80000                   mov ax, 0
  1656 00000902 A3[3300]                 mov word [signi], ax
  1657                                  
  1658                                  ;-187   c=GWidth[i]; widthi=0;wi=0;
  1659                                  
  1660                                  @@gettypes74:
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
  1673 00000920 0F850C00                 jne @@gettypes75
  1674 00000924 B80100                   mov ax, 1
  1675 00000927 A3[3600]                 mov word [widthi], ax
  1676 0000092A B80100                   mov ax, 1
  1677 0000092D A3[3900]                 mov word [wi], ax
  1678                                  
  1679                                  ;-189   if (c==2) {widthi=2;wi=2;}
  1680                                  
  1681                                  @@gettypes75:
  1682 00000930 8A46FC                   mov al, [bp-4]
  1683 00000933 3C02                     cmp al, 2
  1684 00000935 0F850C00                 jne @@gettypes76
  1685 00000939 B80200                   mov ax, 2
  1686 0000093C A3[3600]                 mov word [widthi], ax
  1687 0000093F B80200                   mov ax, 2
  1688 00000942 A3[3900]                 mov word [wi], ax
  1689                                  
  1690                                  ;-190   if (c==4) {widthi=4;wi=4;}
  1691                                  
  1692                                  @@gettypes76:
  1693 00000945 8A46FC                   mov al, [bp-4]
  1694 00000948 3C04                     cmp al, 4
  1695 0000094A 0F850C00                 jne @@gettypes77
  1696 0000094E B80400                   mov ax, 4
  1697 00000951 A3[3600]                 mov word [widthi], ax
  1698 00000954 B80400                   mov ax, 4
  1699 00000957 A3[3900]                 mov word [wi], ax
  1700                                  
  1701                                  ;-191   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}
  1702                                  
  1703                                  @@gettypes77:
  1704 0000095A 8B5E04                   mov bx, [bp+4]
  1705 0000095D 8A87B782                 mov al, [GType + bx]
  1706 00000961 8846FC                   mov [bp-4], al
  1707 00000964 B80000                   mov ax, 0
  1708 00000967 A3[3000]                 mov word [typei], ax
  1709 0000096A 8A46FC                   mov al, [bp-4]
  1710 0000096D 3C2A                     cmp al, 42
  1711 0000096F 0F850C00                 jne @@gettypes78
  1712 00000973 B80100                   mov ax, 1
  1713 00000976 A3[3000]                 mov word [typei], ax
  1714 00000979 B80200                   mov ax, 2
  1715 0000097C A3[3900]                 mov word [wi], ax
  1716                                  
  1717                                  ;-192   if (c=='&')  typei=2;  
  1718                                  
  1719                                  @@gettypes78:
  1720 0000097F 8A46FC                   mov al, [bp-4]
  1721 00000982 3C26                     cmp al, 38
  1722 00000984 0F850600                 jne @@gettypes79
  1723 00000988 B80200                   mov ax, 2
  1724 0000098B A3[3000]                 mov word [typei], ax
  1725                                  
  1726                                  ;-193   return i; }  
  1727                                  
  1728                                  @@gettypes79:
  1729 0000098E 8B4604                   mov ax, [bp+4]
  1730 00000991 E90000                   jmp @@retn
  1731                                  
  1732                                  ;-194 int adrofname(unsigned int i) { adrF(GNameField, i); }
  1733                                  
  1734 00000994 C9                      @@retn: LEAVE
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
  1783 000009C3 0F8D1800                 jge @@printName80
  1784 000009C7 FF7604                   push word [bp+4]
  1785 000009CA E8C9FF                   call adrofname
  1786 000009CD 83C402                   add  sp, 2
  1787 000009D0 894604                   mov [bp+4], ax
  1788 000009D3 FF7604                   push word [bp+4]
  1789 000009D6 E8FA3B                   call prs
  1790 000009D9 83C402                   add  sp, 2
  1791                                  
  1792                                  ;-199   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }
  1793                                  
  1794 000009DC E93800                   jmp @@printName81
  1795                                  @@printName80:
  1796 000009DF 68[190A]                 push printName_0
  1797 000009E2 E8EE3B                   call prs
  1798 000009E5 83C402                   add  sp, 2
  1799 000009E8 8B5E04                   mov bx, [bp+4]
  1800 000009EB D1E3                     shl bx, 1
  1801 000009ED 8B87EB8A                 mov ax, [GData + bx]
  1802 000009F1 8946FE                   mov [bp-2], ax
  1803 000009F4 8B46FE                   mov ax, [bp-2]
  1804 000009F7 83F800                   cmp ax, 0
  1805 000009FA 0F8E0800                 jle @@printName82
  1806 000009FE 6A2B                     push 43
  1807 00000A00 E8693B                   call prc
  1808 00000A03 83C402                   add  sp, 2
  1809                                  @@printName82:
  1810 00000A06 FF76FE                   push word [bp-2]
  1811 00000A09 E8BE3C                   call pint1
  1812 00000A0C 83C402                   add  sp, 2
  1813 00000A0F 6A5D                     push 93
  1814 00000A11 E8583B                   call prc
  1815 00000A14 83C402                   add  sp, 2
  1816                                  
  1817                                  ;-200 }
  1818                                  
  1819                                  @@printName81:
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
  1839 00000A2D 0F850900                 jne @@searchname83
  1840 00000A31 68[570A]                 push searchname_0
  1841 00000A34 E8853E                   call error1
  1842 00000A37 83C402                   add  sp, 2
  1843                                  
  1844                                  ;-203   GUsed[i]=GUsed[i] + 1; return i;
  1845                                  
  1846                                  @@searchname83:
  1847 00000A3A 8B5EFE                   mov bx, [bp-2]
  1848 00000A3D D1E3                     shl bx, 1
  1849 00000A3F 8B879388                 mov ax, [GUsed + bx]
  1850 00000A43 83C001                   add ax, 1
  1851 00000A46 8B5EFE                   mov bx, [bp-2]
  1852 00000A49 D1E3                     shl bx, 1
  1853 00000A4B 89879388                 mov [GUsed+bx], ax
  1854 00000A4F 8B46FE                   mov ax, [bp-2]
  1855 00000A52 E90000                   jmp @@retn
  1856                                  
  1857                                  ;-204 }
  1858                                  
  1859                                  
  1860                                  ;-205 int checkName() { unsigned int i; unsigned int j;
  1861                                  
  1862 00000A55 C9                      @@retn: LEAVE
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
  1879                                  @@checkName84:
  1880 00000A72 8B46FE                   mov ax, [bp-2]
  1881 00000A75 3B06[2C00]               cmp ax, [LTop]
  1882 00000A79 0F8D2B00                 jge @@checkName85
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
  1893 00000A99 0F840600                 je @@checkName86
  1894 00000A9D 8B46FE                   mov ax, [bp-2]
  1895 00000AA0 E94700                   jmp @@retn
  1896                                  @@checkName86:
  1897 00000AA3 FF46FE                   inc  word[bp-2]
  1898                                  
  1899                                  ;-207   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  1900                                  
  1901 00000AA6 EBCA                     jmp @@checkName84
  1902                                  @@checkName85:
  1903 00000AA8 B80100                   mov ax, 1
  1904 00000AAB 8946FE                   mov [bp-2], ax
  1905                                  @@checkName87:
  1906 00000AAE 8B46FE                   mov ax, [bp-2]
  1907 00000AB1 3B06[2A00]               cmp ax, [GTop]
  1908 00000AB5 0F8D2B00                 jge @@checkName88
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
  1919 00000AD5 0F840600                 je @@checkName89
  1920 00000AD9 8B46FE                   mov ax, [bp-2]
  1921 00000ADC E90B00                   jmp @@retn
  1922                                  @@checkName89:
  1923 00000ADF FF46FE                   inc  word[bp-2]
  1924                                  
  1925                                  ;-208   return 0;
  1926                                  
  1927 00000AE2 EBCA                     jmp @@checkName87
  1928                                  @@checkName88:
  1929 00000AE4 B80000                   mov ax, 0
  1930 00000AE7 E90000                   jmp @@retn
  1931                                  
  1932                                  ;-209 }    
  1933                                  
  1934                                  
  1935                                  ;-210 int typeName() { int m; //0=V,1=*,2=&
  1936                                  
  1937 00000AEA C9                      @@retn: LEAVE
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
  1955 00000AF9 E8A239                   call istoken
  1956 00000AFC 83C402                   add  sp, 2
  1957 00000AFF 08C0                     or  al, al
  1958 00000B01 0F840600                 je @@typeName90
  1959 00000B05 B85300                   mov ax, 83
  1960 00000B08 A2[3500]                 mov byte [issign], al
  1961                                  
  1962                                  ;-213     if(istoken(T_UNSIGNED)) issign='U';
  1963                                  
  1964                                  @@typeName90:
  1965 00000B0B 681402                   push 532
  1966 00000B0E E88D39                   call istoken
  1967 00000B11 83C402                   add  sp, 2
  1968 00000B14 08C0                     or  al, al
  1969 00000B16 0F840600                 je @@typeName91
  1970 00000B1A B85500                   mov ax, 85
  1971 00000B1D A2[3500]                 mov byte [issign], al
  1972                                  
  1973                                  ;-214     iswidth=2;                           
  1974                                  
  1975                                  @@typeName91:
  1976 00000B20 B80200                   mov ax, 2
  1977 00000B23 A2[3800]                 mov byte [iswidth], al
  1978                                  
  1979                                  ;-215     if(istoken(T_VOID))     iswidth=0;
  1980                                  
  1981 00000B26 681102                   push 529
  1982 00000B29 E87239                   call istoken
  1983 00000B2C 83C402                   add  sp, 2
  1984 00000B2F 08C0                     or  al, al
  1985 00000B31 0F840600                 je @@typeName92
  1986 00000B35 B80000                   mov ax, 0
  1987 00000B38 A2[3800]                 mov byte [iswidth], al
  1988                                  
  1989                                  ;-216     if(istoken(T_CHAR))     iswidth=1;   
  1990                                  
  1991                                  @@typeName92:
  1992 00000B3B 681202                   push 530
  1993 00000B3E E85D39                   call istoken
  1994 00000B41 83C402                   add  sp, 2
  1995 00000B44 08C0                     or  al, al
  1996 00000B46 0F840600                 je @@typeName93
  1997 00000B4A B80100                   mov ax, 1
  1998 00000B4D A2[3800]                 mov byte [iswidth], al
  1999                                  
  2000                                  ;-217     if(istoken(T_INT))      iswidth=2;
  2001                                  
  2002                                  @@typeName93:
  2003 00000B50 680502                   push 517
  2004 00000B53 E84839                   call istoken
  2005 00000B56 83C402                   add  sp, 2
  2006 00000B59 08C0                     or  al, al
  2007 00000B5B 0F840600                 je @@typeName94
  2008 00000B5F B80200                   mov ax, 2
  2009 00000B62 A2[3800]                 mov byte [iswidth], al
  2010                                  
  2011                                  ;-218     if(istoken(T_LONG))     iswidth=4;
  2012                                  
  2013                                  @@typeName94:
  2014 00000B65 681502                   push 533
  2015 00000B68 E83339                   call istoken
  2016 00000B6B 83C402                   add  sp, 2
  2017 00000B6E 08C0                     or  al, al
  2018 00000B70 0F840600                 je @@typeName95
  2019 00000B74 B80400                   mov ax, 4
  2020 00000B77 A2[3800]                 mov byte [iswidth], al
  2021                                  
  2022                                  ;-219     istype='V'; 
  2023                                  
  2024                                  @@typeName95:
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
  2036 00000B88 E81339                   call istoken
  2037 00000B8B 83C402                   add  sp, 2
  2038 00000B8E 08C0                     or  al, al
  2039 00000B90 0F840C00                 je @@typeName96
  2040 00000B94 B82A00                   mov ax, 42
  2041 00000B97 A2[3200]                 mov byte [istype], al
  2042 00000B9A B80100                   mov ax, 1
  2043 00000B9D 8946FE                   mov [bp-2], ax
  2044                                  
  2045                                  ;-222     if(istoken('&'))  {istype='&'; m=2;}
  2046                                  
  2047                                  @@typeName96:
  2048 00000BA0 6A26                     push 38
  2049 00000BA2 E8F938                   call istoken
  2050 00000BA5 83C402                   add  sp, 2
  2051 00000BA8 08C0                     or  al, al
  2052 00000BAA 0F840C00                 je @@typeName97
  2053 00000BAE B82600                   mov ax, 38
  2054 00000BB1 A2[3200]                 mov byte [istype], al
  2055 00000BB4 B80200                   mov ax, 2
  2056 00000BB7 8946FE                   mov [bp-2], ax
  2057                                  
  2058                                  ;-223     name1(); 
  2059                                  
  2060                                  @@typeName97:
  2061 00000BBA E80800                   call name1
  2062                                  
  2063                                  ;-224     return m; 
  2064                                  
  2065 00000BBD 8B46FE                   mov ax, [bp-2]
  2066 00000BC0 E90000                   jmp @@retn
  2067                                  
  2068                                  ;-225 }
  2069                                  
  2070                                  
  2071                                  ;-226 int name1() {
  2072                                  
  2073 00000BC3 C9                      @@retn: LEAVE
  2074 00000BC4 C3                       ret
  2075                                  ; ENDP
  2076                                  
  2077                                  name1:  ; *** PROC ***
  2078                                  
  2079                                  ;-227     if (token!=T_NAME) error1("Name expected"); 
  2080                                  
  2081 00000BC5 A1[1C00]                 mov ax, [token]
  2082 00000BC8 3D0001                   cmp ax, 256
  2083 00000BCB 0F840900                 je  @@name198
  2084 00000BCF 68[DF0B]                 push name1_0
  2085 00000BD2 E8E73C                   call error1
  2086 00000BD5 83C402                   add  sp, 2
  2087                                  
  2088                                  ;-228     token=getlex(); 
  2089                                  
  2090                                  @@name198:
  2091 00000BD8 E89F31                   call getlex
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
  2114 00000BF7 0F8C0900                 jl  @@storecall99
  2115 00000BFB 68[5F0C]                 push storecall_0
  2116 00000BFE E8BB3C                   call error1
  2117 00000C01 83C402                   add  sp, 2
  2118                                  
  2119                                  ;-232   if (CNameTop >= 65468) error1("Call name table fuill");
  2120                                  
  2121                                  @@storecall99:
  2122 00000C04 A1[6000]                 mov ax, [CNameTop]
  2123 00000C07 3DBCFF                   cmp ax, 65468 ;unsigned : 0
  2124 00000C0A 0F820900                 jb  @@storecall100
  2125 00000C0E 68[6F0C]                 push storecall_1
  2126 00000C11 E8A83C                   call error1
  2127 00000C14 83C402                   add  sp, 2
  2128                                  
  2129                                  ;-233     CType[CTop]=0;  CAdr [CTop]=CNameTop; i=strlen(symbol);
  2130                                  
  2131                                  @@storecall100:
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
  2150 00000C46 E8CC47                   call to_far
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
  2177 00000C8B 0F8C0900                 jl  @@storefunc101
  2178 00000C8F 68[E60C]                 push storefunc_0
  2179 00000C92 E8273C                   call error1
  2180 00000C95 83C402                   add  sp, 2
  2181                                  
  2182                                  ;-238     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;
  2183                                  
  2184                                  @@storefunc101:
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
  2227 00000D00 0F8C0900                 jl  @@addlocal102
  2228 00000D04 68[800D]                 push addlocal_0
  2229 00000D07 E8B23B                   call error1
  2230 00000D0A 83C402                   add  sp, 2
  2231                                  
  2232                                  ;-242   if (checkName() != 0) error1("Variable already defined");
  2233                                  
  2234                                  @@addlocal102:
  2235 00000D0D E858FD                   call checkName
  2236 00000D10 83F800                   cmp ax, 0
  2237 00000D13 0F840900                 je  @@addlocal103
  2238 00000D17 68[9A0D]                 push addlocal_1
  2239 00000D1A E89F3B                   call error1
  2240 00000D1D 83C402                   add  sp, 2
  2241                                  
  2242                                  ;-243   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;
  2243                                  
  2244                                  @@addlocal103:
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
  2306                                  @@checkFunction104:
  2307 00000DBD 8B46FE                   mov ax, [bp-2]
  2308 00000DC0 3B06[3B00]               cmp ax, [FTop]
  2309 00000DC4 0F8D3000                 jge @@checkFunction105
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
  2322 00000DE9 0F840600                 je @@checkFunction106
  2323 00000DED 8B46FE                   mov ax, [bp-2]
  2324 00000DF0 E90B00                   jmp @@retn
  2325                                  @@checkFunction106:
  2326 00000DF3 FF46FE                   inc  word[bp-2]
  2327                                  
  2328                                  ;-249   return 0; }
  2329                                  
  2330 00000DF6 EBC5                     jmp @@checkFunction104
  2331                                  @@checkFunction105:
  2332 00000DF8 B80000                   mov ax, 0
  2333 00000DFB E90000                   jmp @@retn
  2334                                  
  2335                                  ;-250 int dofunc() { int nloc; int i; int narg;  
  2336                                  
  2337 00000DFE C9                      @@retn: LEAVE
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
  2371 00000E22 0F840900                 je @@dofunc107
  2372 00000E26 68[3710]                 push dofunc_0
  2373 00000E29 E8903A                   call error1
  2374 00000E2C 83C402                   add  sp, 2
  2375                                  
  2376                                  ;-255   storefunc();
  2377                                  
  2378                                  @@dofunc107:
  2379 00000E2F E853FE                   call storefunc
  2380                                  
  2381                                  ;-256   prs("\n\n"); prs(symbol); prs(":  ; *** PROC ***");
  2382                                  
  2383 00000E32 68[5010]                 push dofunc_1
  2384 00000E35 E89B37                   call prs
  2385 00000E38 83C402                   add  sp, 2
  2386 00000E3B 8D062B81                 lea  ax, [symbol]
  2387 00000E3F 50                       push ax
  2388 00000E40 E89037                   call prs
  2389 00000E43 83C402                   add  sp, 2
  2390 00000E46 68[5510]                 push dofunc_2
  2391 00000E49 E88737                   call prs
  2392 00000E4C 83C402                   add  sp, 2
  2393                                  
  2394                                  ;-257   expect('('); LTop=LSTART;  i=0;
  2395                                  
  2396 00000E4F 6A28                     push 40
  2397 00000E51 E86C36                   call expect
  2398 00000E54 83C402                   add  sp, 2
  2399 00000E57 B8C800                   mov ax, 200
  2400 00000E5A A3[2C00]                 mov word [LTop], ax
  2401 00000E5D B80000                   mov ax, 0
  2402 00000E60 8946FC                   mov [bp-4], ax
  2403                                  
  2404                                  ;-258   if (istoken(')')==0) { narg=2; 
  2405                                  
  2406 00000E63 6A29                     push 41
  2407 00000E65 E83636                   call istoken
  2408 00000E68 83C402                   add  sp, 2
  2409 00000E6B 83F800                   cmp ax, 0
  2410 00000E6E 0F854600                 jne @@dofunc108
  2411 00000E72 B80200                   mov ax, 2
  2412 00000E75 8946FA                   mov [bp-6], ax
  2413                                  
  2414                                  ;-259     do { typeName();  addlocal(); narg+=2;
  2415                                  
  2416                                  @@dofunc109:
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
  2429 00000E94 0F850400                 jne @@dofunc110
  2430 00000E98 8346FA02                 add  word[bp-6], 2
  2431                                  @@dofunc110:
  2432 00000E9C FF06[2C00]               inc  word[LTop]
  2433                                  
  2434                                  ;-261     while (istoken(','));  expect(')'); }
  2435                                  
  2436 00000EA0 6A2C                     push 44
  2437 00000EA2 E8F935                   call istoken
  2438 00000EA5 83C402                   add  sp, 2
  2439 00000EA8 08C0                     or  al, al
  2440 00000EAA 0F840200                 je @@dofunc111
  2441 00000EAE EBC8                     jmp @@dofunc109
  2442                                  @@dofunc111:
  2443 00000EB0 6A29                     push 41
  2444 00000EB2 E80B36                   call expect
  2445 00000EB5 83C402                   add  sp, 2
  2446                                  
  2447                                  ;-262     
  2448                                  
  2449                                  
  2450                                  ;-263   expect('{'); /*body*/
  2451                                  
  2452                                  @@dofunc108:
  2453 00000EB8 6A7B                     push 123
  2454 00000EBA E80336                   call expect
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
  2470                                  @@dofunc112:
  2471 00000ED8 E8BC01                   call isvariable
  2472 00000EDB 08C0                     or  al, al
  2473 00000EDD 0F849200                 je @@dofunc113
  2474                                  
  2475                                  ;-266     do {typeName();
  2476                                  
  2477                                  @@dofunc114:
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
  2493 00000EF3 0F850400                 jne @@dofunc115
  2494 00000EF7 836EFE02                 sub  word[bp-2], 2
  2495                                  
  2496                                  ;-270         GData[LTop]=nloc;
  2497                                  
  2498                                  @@dofunc115:
  2499 00000EFB 8B46FE                   mov ax, [bp-2]
  2500 00000EFE 8B1E[2C00]               mov bx, [LTop]
  2501 00000F02 D1E3                     shl bx, 1
  2502 00000F04 8987EB8A                 mov [GData+bx], ax
  2503                                  
  2504                                  ;-271         if (istoken('[')){istype='&';GType[LTop]='&';expect(T_CONST);expect(']');
  2505                                  
  2506 00000F08 6A5B                     push 91
  2507 00000F0A E89135                   call istoken
  2508 00000F0D 83C402                   add  sp, 2
  2509 00000F10 08C0                     or  al, al
  2510 00000F12 0F843D00                 je @@dofunc116
  2511 00000F16 B82600                   mov ax, 38
  2512 00000F19 A2[3200]                 mov byte [istype], al
  2513 00000F1C B82600                   mov ax, 38
  2514 00000F1F 8B1E[2C00]               mov bx, [LTop]
  2515 00000F23 8887B782                 mov [GType+bx], al
  2516 00000F27 680101                   push 257
  2517 00000F2A E89335                   call expect
  2518 00000F2D 83C402                   add  sp, 2
  2519 00000F30 6A5D                     push 93
  2520 00000F32 E88B35                   call expect
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
  2536                                  @@dofunc116:
  2537 00000F53 FF06[2C00]               inc  word[LTop]
  2538                                  
  2539                                  ;-274       } while (istoken(',')); expect(';'); }
  2540                                  
  2541 00000F57 6A2C                     push 44
  2542 00000F59 E84235                   call istoken
  2543 00000F5C 83C402                   add  sp, 2
  2544 00000F5F 08C0                     or  al, al
  2545 00000F61 0F840300                 je @@dofunc117
  2546 00000F65 E979FF                   jmp @@dofunc114
  2547                                  @@dofunc117:
  2548 00000F68 6A3B                     push 59
  2549 00000F6A E85335                   call expect
  2550 00000F6D 83C402                   add  sp, 2
  2551                                  
  2552                                  ;-275   listproc(); 
  2553                                  
  2554 00000F70 E965FF                   jmp @@dofunc112
  2555                                  @@dofunc113:
  2556 00000F73 E8483A                   call listproc
  2557                                  
  2558                                  ;-276   if (LTop>LSTART){prs(";\n ENTER  "); 
  2559                                  
  2560 00000F76 A1[2C00]                 mov ax, [LTop]
  2561 00000F79 3DC800                   cmp ax, 200
  2562 00000F7C 0F8E2700                 jle @@dofunc118
  2563 00000F80 68[6710]                 push dofunc_3
  2564 00000F83 E84D36                   call prs
  2565 00000F86 83C402                   add  sp, 2
  2566                                  
  2567                                  ;-277     nloc=mkneg(nloc); pint1 (nloc); prs(",0"); }
  2568                                  
  2569 00000F89 FF76FE                   push word [bp-2]
  2570 00000F8C E833F1                   call mkneg
  2571 00000F8F 83C402                   add  sp, 2
  2572 00000F92 8946FE                   mov [bp-2], ax
  2573 00000F95 FF76FE                   push word [bp-2]
  2574 00000F98 E82F37                   call pint1
  2575 00000F9B 83C402                   add  sp, 2
  2576 00000F9E 68[7310]                 push dofunc_4
  2577 00000FA1 E82F36                   call prs
  2578 00000FA4 83C402                   add  sp, 2
  2579                                  
  2580                                  ;-278   while(istoken('}')==0)   stmt();
  2581                                  
  2582                                  @@dofunc118:
  2583                                  @@dofunc119:
  2584 00000FA7 6A7D                     push 125
  2585 00000FA9 E8F234                   call istoken
  2586 00000FAC 83C402                   add  sp, 2
  2587 00000FAF 83F800                   cmp ax, 0
  2588 00000FB2 0F850500                 jne @@dofunc120
  2589 00000FB6 E85328                   call stmt
  2590                                  
  2591                                  ;-279   if (nreturn) { prs("\n@@retn:");}
  2592                                  
  2593 00000FB9 EBEC                     jmp @@dofunc119
  2594                                  @@dofunc120:
  2595 00000FBB A1[2600]                 mov ax, [nreturn]
  2596 00000FBE 08C0                     or  al, al
  2597 00000FC0 0F840900                 je @@dofunc121
  2598 00000FC4 68[7610]                 push dofunc_5
  2599 00000FC7 E80936                   call prs
  2600 00000FCA 83C402                   add  sp, 2
  2601                                  
  2602                                  ;-280   if (LTop > LSTART) prs(" LEAVE");
  2603                                  
  2604                                  @@dofunc121:
  2605 00000FCD A1[2C00]                 mov ax, [LTop]
  2606 00000FD0 3DC800                   cmp ax, 200
  2607 00000FD3 0F8E0900                 jle @@dofunc122
  2608 00000FD7 68[8010]                 push dofunc_6
  2609 00000FDA E8F635                   call prs
  2610 00000FDD 83C402                   add  sp, 2
  2611                                  
  2612                                  ;-281   prs("\n ret"); prs("\n; ENDP"); 
  2613                                  
  2614                                  @@dofunc122:
  2615 00000FE0 68[8710]                 push dofunc_7
  2616 00000FE3 E8ED35                   call prs
  2617 00000FE6 83C402                   add  sp, 2
  2618 00000FE9 68[8E10]                 push dofunc_8
  2619 00000FEC E8E435                   call prs
  2620 00000FEF 83C402                   add  sp, 2
  2621                                  
  2622                                  ;-282   *cloc=0; prs(co); maxco1=strlen(co);
  2623                                  
  2624 00000FF2 B80000                   mov ax, 0
  2625 00000FF5 8B1E[1600]               mov  bx, [cloc]
  2626 00000FF9 8807                     mov  [bx], al
  2627 00000FFB 8D063075                 lea  ax, [co]
  2628 00000FFF 50                       push ax
  2629 00001000 E8D035                   call prs
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
  2641 0000101B 0F8E1600                 jle @@dofunc123
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
  2653                                  @@dofunc123:
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
  2668 00001076 5C6E40407265746E3A-     dofunc_5 db "\n@@retn:",0
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
  2680 0000109D 0F850300                 jne @@isvariable124
  2681 000010A1 E93A00                   jmp @@v1
  2682                                  
  2683                                  ;-287     if(token==T_UNSIGNED) goto v1;
  2684                                  
  2685                                  @@isvariable124:
  2686 000010A4 A1[1C00]                 mov ax, [token]
  2687 000010A7 3D1402                   cmp ax, 532
  2688 000010AA 0F850300                 jne @@isvariable125
  2689 000010AE E92D00                   jmp @@v1
  2690                                  
  2691                                  ;-288     if(token==T_CHAR)     goto v1;   
  2692                                  
  2693                                  @@isvariable125:
  2694 000010B1 A1[1C00]                 mov ax, [token]
  2695 000010B4 3D1202                   cmp ax, 530
  2696 000010B7 0F850300                 jne @@isvariable126
  2697 000010BB E92000                   jmp @@v1
  2698                                  
  2699                                  ;-289     if(token==T_INT)      goto v1;
  2700                                  
  2701                                  @@isvariable126:
  2702 000010BE A1[1C00]                 mov ax, [token]
  2703 000010C1 3D0502                   cmp ax, 517
  2704 000010C4 0F850300                 jne @@isvariable127
  2705 000010C8 E91300                   jmp @@v1
  2706                                  
  2707                                  ;-290     if(token==T_LONG)     goto v1;
  2708                                  
  2709                                  @@isvariable127:
  2710 000010CB A1[1C00]                 mov ax, [token]
  2711 000010CE 3D1502                   cmp ax, 533
  2712 000010D1 0F850300                 jne @@isvariable128
  2713 000010D5 E90600                   jmp @@v1
  2714                                  
  2715                                  ;-291     return 0;  
  2716                                  
  2717                                  @@isvariable128:
  2718 000010D8 B80000                   mov ax, 0
  2719 000010DB E90600                   jmp @@retn
  2720                                  
  2721                                  ;-292 v1: return 1;
  2722                                  
  2723                                  @@v1:
  2724 000010DE B80100                   mov ax, 1
  2725 000010E1 E90000                   jmp @@retn
  2726                                  
  2727                                  ;-293 }
  2728                                  
  2729                                  
  2730                                  ;-294                   
  2731                                  
  2732                                  
  2733                                  ;-295 int mod1; int ireg1; int idx1; int ids1; int idw1; int idt1; int val1;
  2734                                  
  2735                                  @@retn:
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
  2764 00001103 E8BA33                   call expect
  2765 00001106 83C402                   add  sp, 2
  2766 00001109 B80000                   mov ax, 0
  2767 0000110C A3[2200]                 mov word [iscmp], ax
  2768                                  
  2769                                  ;-299   if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}
  2770                                  
  2771 0000110F A1[1C00]                 mov ax, [token]
  2772 00001112 3D0001                   cmp ax, 256
  2773 00001115 0F853400                 jne @@pexpr129
  2774 00001119 68[7711]                 push pexpr_0
  2775 0000111C 8D062B81                 lea  ax, [symbol]
  2776 00001120 50                       push ax
  2777 00001121 E887F0                   call eqstr
  2778 00001124 83C404                   add  sp, 4
  2779 00001127 08C0                     or  al, al
  2780 00001129 0F840600                 je @@pexpr130
  2781 0000112D E85F00                   call constantexpr
  2782 00001130 E94300                   jmp @@retn
  2783                                  
  2784                                  ;-300     ireg1=checkreg();
  2785                                  
  2786                                  @@pexpr130:
  2787 00001133 E89B07                   call checkreg
  2788 00001136 A3[E710]                 mov word [ireg1], ax
  2789                                  
  2790                                  ;-301     if (ireg1) { doreg1(1); return; }  }
  2791                                  
  2792 00001139 A1[E710]                 mov ax, [ireg1]
  2793 0000113C 08C0                     or  al, al
  2794 0000113E 0F840B00                 je @@pexpr131
  2795 00001142 6A01                     push 1
  2796 00001144 E89E05                   call doreg1
  2797 00001147 83C402                   add  sp, 2
  2798 0000114A E92900                   jmp @@retn
  2799                                  @@pexpr131:
  2800                                  
  2801                                  ;-302   exprstart(); if (iscmp==0) prs("\n or  al, al\n je @@");  prs(fname);
  2802                                  
  2803                                  @@pexpr129:
  2804 0000114D E83E01                   call exprstart
  2805 00001150 A1[2200]                 mov ax, [iscmp]
  2806 00001153 83F800                   cmp ax, 0
  2807 00001156 0F850900                 jne @@pexpr132
  2808 0000115A 68[7911]                 push pexpr_1
  2809 0000115D E87334                   call prs
  2810 00001160 83C402                   add  sp, 2
  2811                                  @@pexpr132:
  2812 00001163 8D06AB81                 lea  ax, [fname]
  2813 00001167 50                       push ax
  2814 00001168 E86834                   call prs
  2815 0000116B 83C402                   add  sp, 2
  2816                                  
  2817                                  ;-303   expect(')'); }           /*error1("Vergleich fehlt");*/
  2818                                  
  2819 0000116E 6A29                     push 41
  2820 00001170 E84D33                   call expect
  2821 00001173 83C402                   add  sp, 2
  2822                                  
  2823                                  ;-304 
  2824                                  
  2825                                  
  2826                                  ;-305 int constantexpr() { int mode; int id1;int ids;
  2827                                  
  2828                                  @@retn:
  2829 00001176 C3                       ret
  2830                                  ; ENDP
  2831 00001177 5F00                    pexpr_0 db "_",0
  2832 00001179 5C6E206F722020616C-     pexpr_1 db "\n or  al, al\n je @@",0
  2833 00001182 2C20616C5C6E206A65-
  2834 0000118B 20404000           
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
  2845 0000118F C8060000                 ENTER  6,0
  2846 00001193 E8E42B                   call getlex
  2847 00001196 A3[1C00]                 mov word [token], ax
  2848 00001199 E850F9                   call typeName
  2849 0000119C 8946FE                   mov [bp-2], ax
  2850                                  
  2851                                  ;-307   id1=searchname(); gettypes(id1); ids=signi;
  2852                                  
  2853 0000119F E87BF8                   call searchname
  2854 000011A2 8946FC                   mov [bp-4], ax
  2855 000011A5 FF76FC                   push word [bp-4]
  2856 000011A8 E834F7                   call gettypes
  2857 000011AB 83C402                   add  sp, 2
  2858 000011AE A1[3300]                 mov ax, [signi]
  2859 000011B1 8946FA                   mov [bp-6], ax
  2860                                  
  2861                                  ;-308   if (isrelational() ==0) error1("Relational expression expected");
  2862                                  
  2863 000011B4 E85C2B                   call isrelational
  2864 000011B7 83F800                   cmp ax, 0
  2865 000011BA 0F850900                 jne @@constantexpr133
  2866 000011BE 68[4412]                 push constantexpr_0
  2867 000011C1 E8F836                   call error1
  2868 000011C4 83C402                   add  sp, 2
  2869                                  
  2870                                  ;-309   expect(T_CONST);  prs(" ; constant expression");
  2871                                  
  2872                                  @@constantexpr133:
  2873 000011C7 680101                   push 257
  2874 000011CA E8F332                   call expect
  2875 000011CD 83C402                   add  sp, 2
  2876 000011D0 68[6312]                 push constantexpr_1
  2877 000011D3 E8FD33                   call prs
  2878 000011D6 83C402                   add  sp, 2
  2879                                  
  2880                                  ;-310   prs("\ncmp "); 
  2881                                  
  2882 000011D9 68[7A12]                 push constantexpr_2
  2883 000011DC E8F433                   call prs
  2884 000011DF 83C402                   add  sp, 2
  2885                                  
  2886                                  ;-311   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  2887                                  
  2888 000011E2 FF76FC                   push word [bp-4]
  2889 000011E5 E8F7F6                   call gettypes
  2890 000011E8 83C402                   add  sp, 2
  2891 000011EB A1[3900]                 mov ax, [wi]
  2892 000011EE 83F802                   cmp ax, 2
  2893 000011F1 0F850C00                 jne @@constantexpr134
  2894 000011F5 68[8112]                 push constantexpr_3
  2895 000011F8 E8D833                   call prs
  2896 000011FB 83C402                   add  sp, 2
  2897 000011FE E90900                   jmp @@constantexpr135
  2898                                  @@constantexpr134:
  2899 00001201 68[8612]                 push constantexpr_4
  2900 00001204 E8CC33                   call prs
  2901 00001207 83C402                   add  sp, 2
  2902                                  
  2903                                  ;-312   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);
  2904                                  
  2905                                  @@constantexpr135:
  2906 0000120A FF76FC                   push word [bp-4]
  2907 0000120D E821F2                   call v
  2908 00001210 83C402                   add  sp, 2
  2909 00001213 68[8B12]                 push constantexpr_5
  2910 00001216 E8BA33                   call prs
  2911 00001219 83C402                   add  sp, 2
  2912 0000121C FF36[2E00]               push word [lexval]
  2913 00001220 E80A35                   call prunsign1
  2914 00001223 83C402                   add  sp, 2
  2915 00001226 FF76FA                   push word [bp-6]
  2916 00001229 E82A28                   call cmpneg
  2917 0000122C 83C402                   add  sp, 2
  2918 0000122F 8D06AB81                 lea  ax, [fname]
  2919 00001233 50                       push ax
  2920 00001234 E89C33                   call prs
  2921 00001237 83C402                   add  sp, 2
  2922                                  
  2923                                  ;-313   expect(')');
  2924                                  
  2925 0000123A 6A29                     push 41
  2926 0000123C E88132                   call expect
  2927 0000123F 83C402                   add  sp, 2
  2928                                  
  2929                                  ;-314 }  
  2930                                  
  2931                                  
  2932                                  ;-315 int exprstart() { if (eqstr(symbol, "_")) expr2(0); else expr(0); }
  2933 00001242 C9                       LEAVE
  2934 00001243 C3                       ret
  2935                                  ; ENDP
  2936 00001244 52656C6174696F6E61-     constantexpr_0 db "Relational expression expected",0
  2937 0000124D 6C2065787072657373-
  2938 00001256 696F6E206578706563-
  2939 0000125F 74656400           
  2940 00001263 203B20636F6E737461-     constantexpr_1 db " ; constant expression",0
  2941 0000126C 6E7420657870726573-
  2942 00001275 73696F6E00         
  2943 0000127A 5C6E636D702000          constantexpr_2 db "\ncmp ",0
  2944 00001281 776F726400              constantexpr_3 db "word",0
  2945 00001286 6279746500              constantexpr_4 db "byte",0
  2946 0000128B 2C2000                  constantexpr_5 db ", ",0
  2947                                  
  2948                                  exprstart:  ; *** PROC ***
  2949 0000128E 68[B612]                 push exprstart_0
  2950 00001291 8D062B81                 lea  ax, [symbol]
  2951 00001295 50                       push ax
  2952 00001296 E812EF                   call eqstr
  2953 00001299 83C404                   add  sp, 4
  2954 0000129C 08C0                     or  al, al
  2955 0000129E 0F840B00                 je @@exprstart136
  2956 000012A2 6A00                     push 0
  2957 000012A4 E81100                   call expr2
  2958 000012A7 83C402                   add  sp, 2
  2959 000012AA E90800                   jmp @@exprstart137
  2960                                  @@exprstart136:
  2961 000012AD 6A00                     push 0
  2962 000012AF E89E0A                   call expr
  2963 000012B2 83C402                   add  sp, 2
  2964                                  @@exprstart137:
  2965                                  
  2966                                  ;-316 
  2967                                  
  2968                                  
  2969                                  ;-317 int expr2(int kind) {  int i;
  2970                                  
  2971 000012B5 C3                       ret
  2972                                  ; ENDP
  2973 000012B6 5F00                    exprstart_0 db "_",0
  2974                                  
  2975                                  expr2:  ; *** PROC ***
  2976                                  
  2977                                  ;-318   if(kind != 1) token=getlex();
  2978                                  
  2979                                  ;Function : expr2, Number of local variables: 2
  2980                                  ;   # type sign width addr used name   list of local variables
  2981                                  ;  200 var sign word   317 NULL kind = bp+4
  2982                                  ;  201 var sign word   317 NULL i = bp-2;
  2983 000012B8 C8020000                 ENTER  2,0
  2984 000012BC 8B4604                   mov ax, [bp+4]
  2985 000012BF 83F801                   cmp ax, 1
  2986 000012C2 0F840600                 je  @@expr2138
  2987 000012C6 E8B12A                   call getlex
  2988 000012C9 A3[1C00]                 mov word [token], ax
  2989                                  
  2990                                  ;-319   mod1=typeName();
  2991                                  
  2992                                  @@expr2138:
  2993 000012CC E81DF8                   call typeName
  2994 000012CF A3[E510]                 mov word [mod1], ax
  2995                                  
  2996                                  ;-320   if (mod1) error1("Noch kein & und * im Text (Linke Hand) erlaubt");
  2997                                  
  2998 000012D2 A1[E510]                 mov ax, [mod1]
  2999 000012D5 08C0                     or  al, al
  3000 000012D7 0F840900                 je @@expr2139
  3001 000012DB 68[7015]                 push expr2_0
  3002 000012DE E8DB35                   call error1
  3003 000012E1 83C402                   add  sp, 2
  3004                                  
  3005                                  ;-321   ireg1=checkreg();
  3006                                  
  3007                                  @@expr2139:
  3008 000012E4 E8EA05                   call checkreg
  3009 000012E7 A3[E710]                 mov word [ireg1], ax
  3010                                  
  3011                                  ;-322   if (ireg1) { doreg1(0); return; }
  3012                                  
  3013 000012EA A1[E710]                 mov ax, [ireg1]
  3014 000012ED 08C0                     or  al, al
  3015 000012EF 0F840B00                 je @@expr2140
  3016 000012F3 6A00                     push 0
  3017 000012F5 E8ED03                   call doreg1
  3018 000012F8 83C402                   add  sp, 2
  3019 000012FB E97002                   jmp @@retn
  3020                                  
  3021                                  ;-323   if (ireg1 == 0) { idx1=searchname();
  3022                                  
  3023                                  @@expr2140:
  3024 000012FE A1[E710]                 mov ax, [ireg1]
  3025 00001301 83F800                   cmp ax, 0
  3026 00001304 0F853400                 jne @@expr2141
  3027 00001308 E812F7                   call searchname
  3028 0000130B A3[E910]                 mov word [idx1], ax
  3029                                  
  3030                                  ;-324     gettypes(idx1); ids1=signi; idw1=wi; idt1=typei;
  3031                                  
  3032 0000130E FF36[E910]               push word [idx1]
  3033 00001312 E8CAF5                   call gettypes
  3034 00001315 83C402                   add  sp, 2
  3035 00001318 A1[3300]                 mov ax, [signi]
  3036 0000131B A3[EB10]                 mov word [ids1], ax
  3037 0000131E A1[3900]                 mov ax, [wi]
  3038 00001321 A3[ED10]                 mov word [idw1], ax
  3039 00001324 A1[3000]                 mov ax, [typei]
  3040 00001327 A3[EF10]                 mov word [idt1], ax
  3041                                  
  3042                                  ;-325     if (idt1)  error1("Noch kein Array oder Pointer links erlaubt");  }
  3043                                  
  3044 0000132A A1[EF10]                 mov ax, [idt1]
  3045 0000132D 08C0                     or  al, al
  3046 0000132F 0F840900                 je @@expr2142
  3047 00001333 68[9F15]                 push expr2_1
  3048 00001336 E88335                   call error1
  3049 00001339 83C402                   add  sp, 2
  3050                                  @@expr2142:
  3051                                  
  3052                                  ;-326   
  3053                                  
  3054                                  
  3055                                  ;-327   if (isrelational()) { error1("Vergleich noch nicht implementiert");
  3056                                  
  3057                                  @@expr2141:
  3058 0000133C E8D429                   call isrelational
  3059 0000133F 08C0                     or  al, al
  3060 00001341 0F840900                 je @@expr2143
  3061 00001345 68[CA15]                 push expr2_2
  3062 00001348 E87135                   call error1
  3063 0000134B 83C402                   add  sp, 2
  3064                                  
  3065                                  ;-328   }
  3066                                  
  3067                                  
  3068                                  ;-329   if (istoken('=') == 0) error1("Assign expected");
  3069                                  
  3070                                  @@expr2143:
  3071 0000134E 6A3D                     push 61
  3072 00001350 E84B31                   call istoken
  3073 00001353 83C402                   add  sp, 2
  3074 00001356 83F800                   cmp ax, 0
  3075 00001359 0F850900                 jne @@expr2144
  3076 0000135D 68[ED15]                 push expr2_3
  3077 00001360 E85935                   call error1
  3078 00001363 83C402                   add  sp, 2
  3079                                  
  3080                                  ;-330   if (istoken(T_CONST) ) { val2=lexval; prs(" ; constant expression");
  3081                                  
  3082                                  @@expr2144:
  3083 00001366 680101                   push 257
  3084 00001369 E83231                   call istoken
  3085 0000136C 83C402                   add  sp, 2
  3086 0000136F 08C0                     or  al, al
  3087 00001371 0F849A00                 je @@expr2145
  3088 00001375 A1[2E00]                 mov ax, [lexval]
  3089 00001378 A3[FF10]                 mov word [val2], ax
  3090 0000137B 68[FD15]                 push expr2_4
  3091 0000137E E85232                   call prs
  3092 00001381 83C402                   add  sp, 2
  3093                                  
  3094                                  ;-331     prs("\nmov ");
  3095                                  
  3096 00001384 68[1416]                 push expr2_5
  3097 00001387 E84932                   call prs
  3098 0000138A 83C402                   add  sp, 2
  3099                                  
  3100                                  ;-332     if (idw1 == 1) prs("byte ");
  3101                                  
  3102 0000138D A1[ED10]                 mov ax, [idw1]
  3103 00001390 83F801                   cmp ax, 1
  3104 00001393 0F850900                 jne @@expr2146
  3105 00001397 68[1B16]                 push expr2_6
  3106 0000139A E83632                   call prs
  3107 0000139D 83C402                   add  sp, 2
  3108                                  
  3109                                  ;-333     if (idw1 == 2) prs("word ");
  3110                                  
  3111                                  @@expr2146:
  3112 000013A0 A1[ED10]                 mov ax, [idw1]
  3113 000013A3 83F802                   cmp ax, 2
  3114 000013A6 0F850900                 jne @@expr2147
  3115 000013AA 68[2116]                 push expr2_7
  3116 000013AD E82332                   call prs
  3117 000013B0 83C402                   add  sp, 2
  3118                                  
  3119                                  ;-334     if (idw1 == 4) prs("dword ");
  3120                                  
  3121                                  @@expr2147:
  3122 000013B3 A1[ED10]                 mov ax, [idw1]
  3123 000013B6 83F804                   cmp ax, 4
  3124 000013B9 0F850900                 jne @@expr2148
  3125 000013BD 68[2716]                 push expr2_8
  3126 000013C0 E81032                   call prs
  3127 000013C3 83C402                   add  sp, 2
  3128                                  
  3129                                  ;-335     v(idx1);
  3130                                  
  3131                                  @@expr2148:
  3132 000013C6 FF36[E910]               push word [idx1]
  3133 000013CA E864F0                   call v
  3134 000013CD 83C402                   add  sp, 2
  3135                                  
  3136                                  ;-336     prs(", "); prunsign1(val2);
  3137                                  
  3138 000013D0 68[2E16]                 push expr2_9
  3139 000013D3 E8FD31                   call prs
  3140 000013D6 83C402                   add  sp, 2
  3141 000013D9 FF36[FF10]               push word [val2]
  3142 000013DD E84D33                   call prunsign1
  3143 000013E0 83C402                   add  sp, 2
  3144                                  
  3145                                  ;-337     if (idx1 >= LSTART) { i=adrofname(idx1);  prs("; "); prs(i); } return; }
  3146                                  
  3147 000013E3 A1[E910]                 mov ax, [idx1]
  3148 000013E6 3DC800                   cmp ax, 200 ;unsigned : 1
  3149 000013E9 0F8C1F00                 jl  @@expr2149
  3150 000013ED FF36[E910]               push word [idx1]
  3151 000013F1 E8A2F5                   call adrofname
  3152 000013F4 83C402                   add  sp, 2
  3153 000013F7 8946FE                   mov [bp-2], ax
  3154 000013FA 68[3116]                 push expr2_10
  3155 000013FD E8D331                   call prs
  3156 00001400 83C402                   add  sp, 2
  3157 00001403 FF76FE                   push word [bp-2]
  3158 00001406 E8CA31                   call prs
  3159 00001409 83C402                   add  sp, 2
  3160                                  @@expr2149:
  3161 0000140C E95F01                   jmp @@retn
  3162                                  
  3163                                  ;-338   
  3164                                  
  3165                                  
  3166                                  ;-339   mod1=typeName(); ireg2=checkreg();
  3167                                  
  3168                                  @@expr2145:
  3169 0000140F E8DAF6                   call typeName
  3170 00001412 A3[E510]                 mov word [mod1], ax
  3171 00001415 E8B904                   call checkreg
  3172 00001418 A3[F510]                 mov word [ireg2], ax
  3173                                  
  3174                                  ;-340   if (ireg2) { prs("\nmov ");
  3175                                  
  3176 0000141B A1[F510]                 mov ax, [ireg2]
  3177 0000141E 08C0                     or  al, al
  3178 00001420 0F844200                 je @@expr2150
  3179 00001424 68[3416]                 push expr2_11
  3180 00001427 E8A931                   call prs
  3181 0000142A 83C402                   add  sp, 2
  3182                                  
  3183                                  ;-341     if (ireg1) printreg(ireg1); else v(idx1); prs(", "); printreg(ireg2);return;}
  3184                                  
  3185 0000142D A1[E710]                 mov ax, [ireg1]
  3186 00001430 08C0                     or  al, al
  3187 00001432 0F840D00                 je @@expr2151
  3188 00001436 FF36[E710]               push word [ireg1]
  3189 0000143A E8A208                   call printreg
  3190 0000143D 83C402                   add  sp, 2
  3191 00001440 E90A00                   jmp @@expr2152
  3192                                  @@expr2151:
  3193 00001443 FF36[E910]               push word [idx1]
  3194 00001447 E8E7EF                   call v
  3195 0000144A 83C402                   add  sp, 2
  3196                                  @@expr2152:
  3197 0000144D 68[3B16]                 push expr2_12
  3198 00001450 E88031                   call prs
  3199 00001453 83C402                   add  sp, 2
  3200 00001456 FF36[F510]               push word [ireg2]
  3201 0000145A E88208                   call printreg
  3202 0000145D 83C402                   add  sp, 2
  3203 00001460 E90B01                   jmp @@retn
  3204                                  
  3205                                  ;-342   else {
  3206                                  
  3207 00001463 E9FF00                   jmp @@expr2153
  3208                                  @@expr2150:
  3209                                  
  3210                                  ;-343     if (mod1 == 1) error1("Noch kein * im Text erlaubt");
  3211                                  
  3212 00001466 A1[E510]                 mov ax, [mod1]
  3213 00001469 83F801                   cmp ax, 1
  3214 0000146C 0F850900                 jne @@expr2154
  3215 00001470 68[3E16]                 push expr2_13
  3216 00001473 E84634                   call error1
  3217 00001476 83C402                   add  sp, 2
  3218                                  
  3219                                  ;-344     
  3220                                  
  3221                                  
  3222                                  ;-345     idx2=searchname();
  3223                                  
  3224                                  @@expr2154:
  3225 00001479 E8A1F5                   call searchname
  3226 0000147C A3[F710]                 mov word [idx2], ax
  3227                                  
  3228                                  ;-346     gettypes(idx2); ids2=signi; idw2=wi; idt2=typei;
  3229                                  
  3230 0000147F FF36[F710]               push word [idx2]
  3231 00001483 E859F4                   call gettypes
  3232 00001486 83C402                   add  sp, 2
  3233 00001489 A1[3300]                 mov ax, [signi]
  3234 0000148C A3[F910]                 mov word [ids2], ax
  3235 0000148F A1[3900]                 mov ax, [wi]
  3236 00001492 A3[FB10]                 mov word [idw2], ax
  3237 00001495 A1[3000]                 mov ax, [typei]
  3238 00001498 A3[FD10]                 mov word [idt2], ax
  3239                                  
  3240                                  ;-347     if (idt2 == 1)  error1("Noch kein Array rechts erlaubt");
  3241                                  
  3242 0000149B A1[FD10]                 mov ax, [idt2]
  3243 0000149E 83F801                   cmp ax, 1
  3244 000014A1 0F850900                 jne @@expr2155
  3245 000014A5 68[5A16]                 push expr2_14
  3246 000014A8 E81134                   call error1
  3247 000014AB 83C402                   add  sp, 2
  3248                                  
  3249                                  ;-348     prs("\nmov ");
  3250                                  
  3251                                  @@expr2155:
  3252 000014AE 68[7916]                 push expr2_15
  3253 000014B1 E81F31                   call prs
  3254 000014B4 83C402                   add  sp, 2
  3255                                  
  3256                                  ;-349     if (ireg1) printreg(ireg1); else error1("Mem to Mem not allowed by x86-CPU");
  3257                                  
  3258 000014B7 A1[E710]                 mov ax, [ireg1]
  3259 000014BA 08C0                     or  al, al
  3260 000014BC 0F840D00                 je @@expr2156
  3261 000014C0 FF36[E710]               push word [ireg1]
  3262 000014C4 E81808                   call printreg
  3263 000014C7 83C402                   add  sp, 2
  3264 000014CA E90900                   jmp @@expr2157
  3265                                  @@expr2156:
  3266 000014CD 68[8016]                 push expr2_16
  3267 000014D0 E8E933                   call error1
  3268 000014D3 83C402                   add  sp, 2
  3269                                  
  3270                                  ;-350     prs(", ");
  3271                                  
  3272                                  @@expr2157:
  3273 000014D6 68[A216]                 push expr2_17
  3274 000014D9 E8F730                   call prs
  3275 000014DC 83C402                   add  sp, 2
  3276                                  
  3277                                  ;-351     if (mod1 == 2) a(idx2);
  3278                                  
  3279 000014DF A1[E510]                 mov ax, [mod1]
  3280 000014E2 83F802                   cmp ax, 2
  3281 000014E5 0F850D00                 jne @@expr2158
  3282 000014E9 FF36[F710]               push word [idx2]
  3283 000014ED E832EF                   call a
  3284 000014F0 83C402                   add  sp, 2
  3285                                  
  3286                                  ;-352     else {
  3287                                  
  3288 000014F3 E96C00                   jmp @@expr2159
  3289                                  @@expr2158:
  3290                                  
  3291                                  ;-353       if (idw2 == 1) prs("byte ");
  3292                                  
  3293 000014F6 A1[FB10]                 mov ax, [idw2]
  3294 000014F9 83F801                   cmp ax, 1
  3295 000014FC 0F850900                 jne @@expr2160
  3296 00001500 68[A516]                 push expr2_18
  3297 00001503 E8CD30                   call prs
  3298 00001506 83C402                   add  sp, 2
  3299                                  
  3300                                  ;-354       if (idw2 == 2) prs("word ");
  3301                                  
  3302                                  @@expr2160:
  3303 00001509 A1[FB10]                 mov ax, [idw2]
  3304 0000150C 83F802                   cmp ax, 2
  3305 0000150F 0F850900                 jne @@expr2161
  3306 00001513 68[AB16]                 push expr2_19
  3307 00001516 E8BA30                   call prs
  3308 00001519 83C402                   add  sp, 2
  3309                                  
  3310                                  ;-355       if (idw2 == 4) prs("dword ");
  3311                                  
  3312                                  @@expr2161:
  3313 0000151C A1[FB10]                 mov ax, [idw2]
  3314 0000151F 83F804                   cmp ax, 4
  3315 00001522 0F850900                 jne @@expr2162
  3316 00001526 68[B116]                 push expr2_20
  3317 00001529 E8A730                   call prs
  3318 0000152C 83C402                   add  sp, 2
  3319                                  
  3320                                  ;-356       v(idx2);
  3321                                  
  3322                                  @@expr2162:
  3323 0000152F FF36[F710]               push word [idx2]
  3324 00001533 E8FBEE                   call v
  3325 00001536 83C402                   add  sp, 2
  3326                                  
  3327                                  ;-357       if (idx2 >= LSTART) { i=adrofname(idx2);  prs("; "); prs(i); }  }
  3328                                  
  3329 00001539 A1[F710]                 mov ax, [idx2]
  3330 0000153C 3DC800                   cmp ax, 200 ;unsigned : 1
  3331 0000153F 0F8C1F00                 jl  @@expr2163
  3332 00001543 FF36[F710]               push word [idx2]
  3333 00001547 E84CF4                   call adrofname
  3334 0000154A 83C402                   add  sp, 2
  3335 0000154D 8946FE                   mov [bp-2], ax
  3336 00001550 68[B816]                 push expr2_21
  3337 00001553 E87D30                   call prs
  3338 00001556 83C402                   add  sp, 2
  3339 00001559 FF76FE                   push word [bp-2]
  3340 0000155C E87430                   call prs
  3341 0000155F 83C402                   add  sp, 2
  3342                                  @@expr2163:
  3343                                  
  3344                                  ;-358     return;
  3345                                  
  3346                                  @@expr2159:
  3347 00001562 E90900                   jmp @@retn
  3348                                  
  3349                                  ;-359   } error1("Internal error: only const or reg allowed");
  3350                                  
  3351                                  @@expr2153:
  3352 00001565 68[BB16]                 push expr2_22
  3353 00001568 E85133                   call error1
  3354 0000156B 83C402                   add  sp, 2
  3355                                  
  3356                                  ;-360 }
  3357                                  
  3358                                  
  3359                                  ;-361 char ops[5];
  3360                                  
  3361 0000156E C9                      @@retn: LEAVE
  3362 0000156F C3                       ret
  3363                                  ; ENDP
  3364 00001570 4E6F6368206B65696E-     expr2_0 db "Noch kein & und * im Text (Linke Hand) erlaubt",0
  3365 00001579 202620756E64202A20-
  3366 00001582 696D20546578742028-
  3367 0000158B 4C696E6B652048616E-
  3368 00001594 64292065726C617562-
  3369 0000159D 7400               
  3370 0000159F 4E6F6368206B65696E-     expr2_1 db "Noch kein Array oder Pointer links erlaubt",0
  3371 000015A8 204172726179206F64-
  3372 000015B1 657220506F696E7465-
  3373 000015BA 72206C696E6B732065-
  3374 000015C3 726C6175627400     
  3375 000015CA 566572676C65696368-     expr2_2 db "Vergleich noch nicht implementiert",0
  3376 000015D3 206E6F6368206E6963-
  3377 000015DC 687420696D706C656D-
  3378 000015E5 656E746965727400   
  3379 000015ED 41737369676E206578-     expr2_3 db "Assign expected",0
  3380 000015F6 70656374656400     
  3381 000015FD 203B20636F6E737461-     expr2_4 db " ; constant expression",0
  3382 00001606 6E7420657870726573-
  3383 0000160F 73696F6E00         
  3384 00001614 5C6E6D6F762000          expr2_5 db "\nmov ",0
  3385 0000161B 627974652000            expr2_6 db "byte ",0
  3386 00001621 776F72642000            expr2_7 db "word ",0
  3387 00001627 64776F72642000          expr2_8 db "dword ",0
  3388 0000162E 2C2000                  expr2_9 db ", ",0
  3389 00001631 3B2000                  expr2_10 db "; ",0
  3390 00001634 5C6E6D6F762000          expr2_11 db "\nmov ",0
  3391 0000163B 2C2000                  expr2_12 db ", ",0
  3392 0000163E 4E6F6368206B65696E-     expr2_13 db "Noch kein * im Text erlaubt",0
  3393 00001647 202A20696D20546578-
  3394 00001650 742065726C61756274-
  3395 00001659 00                 
  3396 0000165A 4E6F6368206B65696E-     expr2_14 db "Noch kein Array rechts erlaubt",0
  3397 00001663 204172726179207265-
  3398 0000166C 636874732065726C61-
  3399 00001675 75627400           
  3400 00001679 5C6E6D6F762000          expr2_15 db "\nmov ",0
  3401 00001680 4D656D20746F204D65-     expr2_16 db "Mem to Mem not allowed by x86-CPU",0
  3402 00001689 6D206E6F7420616C6C-
  3403 00001692 6F7765642062792078-
  3404 0000169B 38362D43505500     
  3405 000016A2 2C2000                  expr2_17 db ", ",0
  3406 000016A5 627974652000            expr2_18 db "byte ",0
  3407 000016AB 776F72642000            expr2_19 db "word ",0
  3408 000016B1 64776F72642000          expr2_20 db "dword ",0
  3409 000016B8 3B2000                  expr2_21 db "; ",0
  3410 000016BB 496E7465726E616C20-     expr2_22 db "Internal error: only const or reg allowed",0
  3411 000016C4 6572726F723A206F6E-
  3412 000016CD 6C7920636F6E737420-
  3413 000016D6 6F722072656720616C-
  3414 000016DF 6C6F77656400       
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
  3431 000016E5 C8020000                 ENTER  2,0
  3432 000016E9 6A3D                     push 61
  3433 000016EB E8B02D                   call istoken
  3434 000016EE 83C402                   add  sp, 2
  3435 000016F1 08C0                     or  al, al
  3436 000016F3 0F840E00                 je @@doreg1164
  3437 000016F7 68[9818]                 push doreg1_0
  3438 000016FA 8D069ED0                 lea  ax, [ops]
  3439 000016FE 50                       push ax
  3440 000016FF E879EA                   call strcpy
  3441 00001702 83C404                   add  sp, 4
  3442                                  
  3443                                  ;-364   if (istoken(T_PLUSASS))    strcpy(ops, "add");
  3444                                  
  3445                                  @@doreg1164:
  3446 00001705 68CE04                   push 1230
  3447 00001708 E8932D                   call istoken
  3448 0000170B 83C402                   add  sp, 2
  3449 0000170E 08C0                     or  al, al
  3450 00001710 0F840E00                 je @@doreg1165
  3451 00001714 68[9C18]                 push doreg1_1
  3452 00001717 8D069ED0                 lea  ax, [ops]
  3453 0000171B 50                       push ax
  3454 0000171C E85CEA                   call strcpy
  3455 0000171F 83C404                   add  sp, 4
  3456                                  
  3457                                  ;-365   if (istoken(T_MINUSASS))   strcpy(ops, "sub");
  3458                                  
  3459                                  @@doreg1165:
  3460 00001722 68CF04                   push 1231
  3461 00001725 E8762D                   call istoken
  3462 00001728 83C402                   add  sp, 2
  3463 0000172B 08C0                     or  al, al
  3464 0000172D 0F840E00                 je @@doreg1166
  3465 00001731 68[A018]                 push doreg1_2
  3466 00001734 8D069ED0                 lea  ax, [ops]
  3467 00001738 50                       push ax
  3468 00001739 E83FEA                   call strcpy
  3469 0000173C 83C404                   add  sp, 4
  3470                                  
  3471                                  ;-366   if (istoken(T_ANDASS))     strcpy(ops, "and");
  3472                                  
  3473                                  @@doreg1166:
  3474 0000173F 68D204                   push 1234
  3475 00001742 E8592D                   call istoken
  3476 00001745 83C402                   add  sp, 2
  3477 00001748 08C0                     or  al, al
  3478 0000174A 0F840E00                 je @@doreg1167
  3479 0000174E 68[A418]                 push doreg1_3
  3480 00001751 8D069ED0                 lea  ax, [ops]
  3481 00001755 50                       push ax
  3482 00001756 E822EA                   call strcpy
  3483 00001759 83C404                   add  sp, 4
  3484                                  
  3485                                  ;-367   if (istoken(T_ORASS))      strcpy(ops, "or" );
  3486                                  
  3487                                  @@doreg1167:
  3488 0000175C 68D304                   push 1235
  3489 0000175F E83C2D                   call istoken
  3490 00001762 83C402                   add  sp, 2
  3491 00001765 08C0                     or  al, al
  3492 00001767 0F840E00                 je @@doreg1168
  3493 0000176B 68[A818]                 push doreg1_4
  3494 0000176E 8D069ED0                 lea  ax, [ops]
  3495 00001772 50                       push ax
  3496 00001773 E805EA                   call strcpy
  3497 00001776 83C404                   add  sp, 4
  3498                                  
  3499                                  ;-368   if (istoken(T_LESSLESS))   strcpy(ops, "shl");
  3500                                  
  3501                                  @@doreg1168:
  3502 00001779 68D804                   push 1240
  3503 0000177C E81F2D                   call istoken
  3504 0000177F 83C402                   add  sp, 2
  3505 00001782 08C0                     or  al, al
  3506 00001784 0F840E00                 je @@doreg1169
  3507 00001788 68[AB18]                 push doreg1_5
  3508 0000178B 8D069ED0                 lea  ax, [ops]
  3509 0000178F 50                       push ax
  3510 00001790 E8E8E9                   call strcpy
  3511 00001793 83C404                   add  sp, 4
  3512                                  
  3513                                  ;-369   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");
  3514                                  
  3515                                  @@doreg1169:
  3516 00001796 68D904                   push 1241
  3517 00001799 E8022D                   call istoken
  3518 0000179C 83C402                   add  sp, 2
  3519 0000179F 08C0                     or  al, al
  3520 000017A1 0F840E00                 je @@doreg1170
  3521 000017A5 68[AF18]                 push doreg1_6
  3522 000017A8 8D069ED0                 lea  ax, [ops]
  3523 000017AC 50                       push ax
  3524 000017AD E8CBE9                   call strcpy
  3525 000017B0 83C404                   add  sp, 4
  3526                                  
  3527                                  ;-370   if (iscmp1 == 1) { token=getlex();
  3528                                  
  3529                                  @@doreg1170:
  3530 000017B3 8B4604                   mov ax, [bp+4]
  3531 000017B6 83F801                   cmp ax, 1
  3532 000017B9 0F852700                 jne @@doreg1171
  3533 000017BD E8BA25                   call getlex
  3534 000017C0 A3[1C00]                 mov word [token], ax
  3535                                  
  3536                                  ;-371       if (isrelational() ==0) error1("Relational expected");
  3537                                  
  3538 000017C3 E84D25                   call isrelational
  3539 000017C6 83F800                   cmp ax, 0
  3540 000017C9 0F850900                 jne @@doreg1172
  3541 000017CD 68[B318]                 push doreg1_7
  3542 000017D0 E8E930                   call error1
  3543 000017D3 83C402                   add  sp, 2
  3544                                  
  3545                                  ;-372       strcpy(ops, "cmp"); }
  3546                                  
  3547                                  @@doreg1172:
  3548 000017D6 68[C718]                 push doreg1_8
  3549 000017D9 8D069ED0                 lea  ax, [ops]
  3550 000017DD 50                       push ax
  3551 000017DE E89AE9                   call strcpy
  3552 000017E1 83C404                   add  sp, 4
  3553                                  
  3554                                  ;-373   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");
  3555                                  
  3556                                  @@doreg1171:
  3557 000017E4 E8DE2D                   call prnl
  3558 000017E7 8D069ED0                 lea  ax, [ops]
  3559 000017EB 50                       push ax
  3560 000017EC E8E42D                   call prs
  3561 000017EF 83C402                   add  sp, 2
  3562 000017F2 68[CB18]                 push doreg1_9
  3563 000017F5 E8DB2D                   call prs
  3564 000017F8 83C402                   add  sp, 2
  3565 000017FB FF36[E710]               push word [ireg1]
  3566 000017FF E8DD04                   call printreg
  3567 00001802 83C402                   add  sp, 2
  3568 00001805 68[CE18]                 push doreg1_10
  3569 00001808 E8C82D                   call prs
  3570 0000180B 83C402                   add  sp, 2
  3571                                  
  3572                                  ;-374 
  3573                                  
  3574                                  
  3575                                  ;-375   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}
  3576                                  
  3577 0000180E 680101                   push 257
  3578 00001811 E88A2C                   call istoken
  3579 00001814 83C402                   add  sp, 2
  3580 00001817 08C0                     or  al, al
  3581 00001819 0F840D00                 je @@doreg1173
  3582 0000181D FF36[2E00]               push word [lexval]
  3583 00001821 E8092F                   call prunsign1
  3584 00001824 83C402                   add  sp, 2
  3585 00001827 E94700                   jmp @@reg1
  3586                                  
  3587                                  ;-376   mod2=typeName(); ireg2=checkreg();
  3588                                  
  3589                                  @@doreg1173:
  3590 0000182A E8BFF2                   call typeName
  3591 0000182D A3[F310]                 mov word [mod2], ax
  3592 00001830 E89E00                   call checkreg
  3593 00001833 A3[F510]                 mov word [ireg2], ax
  3594                                  
  3595                                  ;-377   if (ireg2) {printreg(ireg2); goto reg1;}
  3596                                  
  3597 00001836 A1[F510]                 mov ax, [ireg2]
  3598 00001839 08C0                     or  al, al
  3599 0000183B 0F840D00                 je @@doreg1174
  3600 0000183F FF36[F510]               push word [ireg2]
  3601 00001843 E89904                   call printreg
  3602 00001846 83C402                   add  sp, 2
  3603 00001849 E92500                   jmp @@reg1
  3604                                  
  3605                                  ;-378   i=searchname();  if (mod2 == 2) a(i); else v(i);
  3606                                  
  3607                                  @@doreg1174:
  3608 0000184C E8CEF1                   call searchname
  3609 0000184F 8946FE                   mov [bp-2], ax
  3610 00001852 A1[F310]                 mov ax, [mod2]
  3611 00001855 83F802                   cmp ax, 2
  3612 00001858 0F850C00                 jne @@doreg1175
  3613 0000185C FF76FE                   push word [bp-2]
  3614 0000185F E8C0EB                   call a
  3615 00001862 83C402                   add  sp, 2
  3616 00001865 E90900                   jmp @@doreg1176
  3617                                  @@doreg1175:
  3618 00001868 FF76FE                   push word [bp-2]
  3619 0000186B E8C3EB                   call v
  3620 0000186E 83C402                   add  sp, 2
  3621                                  
  3622                                  ;-379   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }
  3623                                  
  3624                                  @@doreg1176:
  3625                                  @@reg1:
  3626 00001871 8B4604                   mov ax, [bp+4]
  3627 00001874 83F801                   cmp ax, 1
  3628 00001877 0F851B00                 jne @@doreg1177
  3629 0000187B 6A00                     push 0
  3630 0000187D E8D621                   call cmpneg
  3631 00001880 83C402                   add  sp, 2
  3632 00001883 8D06AB81                 lea  ax, [fname]
  3633 00001887 50                       push ax
  3634 00001888 E8482D                   call prs
  3635 0000188B 83C402                   add  sp, 2
  3636 0000188E 6A29                     push 41
  3637 00001890 E82D2C                   call expect
  3638 00001893 83C402                   add  sp, 2
  3639                                  
  3640                                  ;-380 }
  3641                                  
  3642                                  @@doreg1177:
  3643                                  
  3644                                  ;-381 int checkreg() { // >=17 = 16bit, >=47 = 32bit
  3645 00001896 C9                       LEAVE
  3646 00001897 C3                       ret
  3647                                  ; ENDP
  3648 00001898 6D6F7600                doreg1_0 db "mov",0
  3649 0000189C 61646400                doreg1_1 db "add",0
  3650 000018A0 73756200                doreg1_2 db "sub",0
  3651 000018A4 616E6400                doreg1_3 db "and",0
  3652 000018A8 6F7200                  doreg1_4 db "or",0
  3653 000018AB 73686C00                doreg1_5 db "shl",0
  3654 000018AF 73687200                doreg1_6 db "shr",0
  3655 000018B3 52656C6174696F6E61-     doreg1_7 db "Relational expected",0
  3656 000018BC 6C2065787065637465-
  3657 000018C5 6400               
  3658 000018C7 636D7000                doreg1_8 db "cmp",0
  3659 000018CB 202000                  doreg1_9 db "  ",0
  3660 000018CE 2C2000                  doreg1_10 db ", ",0
  3661                                  
  3662                                  checkreg:  ; *** PROC ***
  3663                                  
  3664                                  ;-382   if (strlen(symbol) <  2) return 0;
  3665                                  
  3666 000018D1 8D062B81                 lea  ax, [symbol]
  3667 000018D5 50                       push ax
  3668 000018D6 E87AE8                   call strlen
  3669 000018D9 83C402                   add  sp, 2
  3670 000018DC 83F802                   cmp ax, 2
  3671 000018DF 0F8D0600                 jge @@checkreg178
  3672 000018E3 B80000                   mov ax, 0
  3673 000018E6 E94403                   jmp @@retn
  3674                                  
  3675                                  ;-383   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;
  3676                                  
  3677                                  @@checkreg178:
  3678 000018E9 68[2E1C]                 push checkreg_0
  3679 000018EC 8D062B81                 lea  ax, [symbol]
  3680 000018F0 50                       push ax
  3681 000018F1 E8B7E8                   call eqstr
  3682 000018F4 83C404                   add  sp, 4
  3683 000018F7 08C0                     or  al, al
  3684 000018F9 0F840600                 je @@checkreg179
  3685 000018FD B80100                   mov ax, 1
  3686 00001900 E92A03                   jmp @@retn
  3687                                  @@checkreg179:
  3688 00001903 68[311C]                 push checkreg_1
  3689 00001906 8D062B81                 lea  ax, [symbol]
  3690 0000190A 50                       push ax
  3691 0000190B E89DE8                   call eqstr
  3692 0000190E 83C404                   add  sp, 4
  3693 00001911 08C0                     or  al, al
  3694 00001913 0F840600                 je @@checkreg180
  3695 00001917 B80300                   mov ax, 3
  3696 0000191A E91003                   jmp @@retn
  3697                                  
  3698                                  ;-384   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;
  3699                                  
  3700                                  @@checkreg180:
  3701 0000191D 68[341C]                 push checkreg_2
  3702 00001920 8D062B81                 lea  ax, [symbol]
  3703 00001924 50                       push ax
  3704 00001925 E883E8                   call eqstr
  3705 00001928 83C404                   add  sp, 4
  3706 0000192B 08C0                     or  al, al
  3707 0000192D 0F840600                 je @@checkreg181
  3708 00001931 B80500                   mov ax, 5
  3709 00001934 E9F602                   jmp @@retn
  3710                                  @@checkreg181:
  3711 00001937 68[371C]                 push checkreg_3
  3712 0000193A 8D062B81                 lea  ax, [symbol]
  3713 0000193E 50                       push ax
  3714 0000193F E869E8                   call eqstr
  3715 00001942 83C404                   add  sp, 4
  3716 00001945 08C0                     or  al, al
  3717 00001947 0F840600                 je @@checkreg182
  3718 0000194B B80700                   mov ax, 7
  3719 0000194E E9DC02                   jmp @@retn
  3720                                  
  3721                                  ;-385   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;
  3722                                  
  3723                                  @@checkreg182:
  3724 00001951 68[3A1C]                 push checkreg_4
  3725 00001954 8D062B81                 lea  ax, [symbol]
  3726 00001958 50                       push ax
  3727 00001959 E84FE8                   call eqstr
  3728 0000195C 83C404                   add  sp, 4
  3729 0000195F 08C0                     or  al, al
  3730 00001961 0F840600                 je @@checkreg183
  3731 00001965 B80900                   mov ax, 9
  3732 00001968 E9C202                   jmp @@retn
  3733                                  @@checkreg183:
  3734 0000196B 68[3D1C]                 push checkreg_5
  3735 0000196E 8D062B81                 lea  ax, [symbol]
  3736 00001972 50                       push ax
  3737 00001973 E835E8                   call eqstr
  3738 00001976 83C404                   add  sp, 4
  3739 00001979 08C0                     or  al, al
  3740 0000197B 0F840600                 je @@checkreg184
  3741 0000197F B80B00                   mov ax, 11
  3742 00001982 E9A802                   jmp @@retn
  3743                                  
  3744                                  ;-386   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;
  3745                                  
  3746                                  @@checkreg184:
  3747 00001985 68[401C]                 push checkreg_6
  3748 00001988 8D062B81                 lea  ax, [symbol]
  3749 0000198C 50                       push ax
  3750 0000198D E81BE8                   call eqstr
  3751 00001990 83C404                   add  sp, 4
  3752 00001993 08C0                     or  al, al
  3753 00001995 0F840600                 je @@checkreg185
  3754 00001999 B80D00                   mov ax, 13
  3755 0000199C E98E02                   jmp @@retn
  3756                                  @@checkreg185:
  3757 0000199F 68[431C]                 push checkreg_7
  3758 000019A2 8D062B81                 lea  ax, [symbol]
  3759 000019A6 50                       push ax
  3760 000019A7 E801E8                   call eqstr
  3761 000019AA 83C404                   add  sp, 4
  3762 000019AD 08C0                     or  al, al
  3763 000019AF 0F840600                 je @@checkreg186
  3764 000019B3 B80F00                   mov ax, 15
  3765 000019B6 E97402                   jmp @@retn
  3766                                  
  3767                                  ;-387   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;
  3768                                  
  3769                                  @@checkreg186:
  3770 000019B9 68[461C]                 push checkreg_8
  3771 000019BC 8D062B81                 lea  ax, [symbol]
  3772 000019C0 50                       push ax
  3773 000019C1 E8E7E7                   call eqstr
  3774 000019C4 83C404                   add  sp, 4
  3775 000019C7 08C0                     or  al, al
  3776 000019C9 0F840600                 je @@checkreg187
  3777 000019CD B81100                   mov ax, 17
  3778 000019D0 E95A02                   jmp @@retn
  3779                                  @@checkreg187:
  3780 000019D3 68[491C]                 push checkreg_9
  3781 000019D6 8D062B81                 lea  ax, [symbol]
  3782 000019DA 50                       push ax
  3783 000019DB E8CDE7                   call eqstr
  3784 000019DE 83C404                   add  sp, 4
  3785 000019E1 08C0                     or  al, al
  3786 000019E3 0F840600                 je @@checkreg188
  3787 000019E7 B81300                   mov ax, 19
  3788 000019EA E94002                   jmp @@retn
  3789                                  
  3790                                  ;-388   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;
  3791                                  
  3792                                  @@checkreg188:
  3793 000019ED 68[4C1C]                 push checkreg_10
  3794 000019F0 8D062B81                 lea  ax, [symbol]
  3795 000019F4 50                       push ax
  3796 000019F5 E8B3E7                   call eqstr
  3797 000019F8 83C404                   add  sp, 4
  3798 000019FB 08C0                     or  al, al
  3799 000019FD 0F840600                 je @@checkreg189
  3800 00001A01 B81500                   mov ax, 21
  3801 00001A04 E92602                   jmp @@retn
  3802                                  @@checkreg189:
  3803 00001A07 68[4F1C]                 push checkreg_11
  3804 00001A0A 8D062B81                 lea  ax, [symbol]
  3805 00001A0E 50                       push ax
  3806 00001A0F E899E7                   call eqstr
  3807 00001A12 83C404                   add  sp, 4
  3808 00001A15 08C0                     or  al, al
  3809 00001A17 0F840600                 je @@checkreg190
  3810 00001A1B B81700                   mov ax, 23
  3811 00001A1E E90C02                   jmp @@retn
  3812                                  
  3813                                  ;-389   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;
  3814                                  
  3815                                  @@checkreg190:
  3816 00001A21 68[521C]                 push checkreg_12
  3817 00001A24 8D062B81                 lea  ax, [symbol]
  3818 00001A28 50                       push ax
  3819 00001A29 E87FE7                   call eqstr
  3820 00001A2C 83C404                   add  sp, 4
  3821 00001A2F 08C0                     or  al, al
  3822 00001A31 0F840600                 je @@checkreg191
  3823 00001A35 B81900                   mov ax, 25
  3824 00001A38 E9F201                   jmp @@retn
  3825                                  @@checkreg191:
  3826 00001A3B 68[551C]                 push checkreg_13
  3827 00001A3E 8D062B81                 lea  ax, [symbol]
  3828 00001A42 50                       push ax
  3829 00001A43 E865E7                   call eqstr
  3830 00001A46 83C404                   add  sp, 4
  3831 00001A49 08C0                     or  al, al
  3832 00001A4B 0F840600                 je @@checkreg192
  3833 00001A4F B81B00                   mov ax, 27
  3834 00001A52 E9D801                   jmp @@retn
  3835                                  
  3836                                  ;-390   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;
  3837                                  
  3838                                  @@checkreg192:
  3839 00001A55 68[581C]                 push checkreg_14
  3840 00001A58 8D062B81                 lea  ax, [symbol]
  3841 00001A5C 50                       push ax
  3842 00001A5D E84BE7                   call eqstr
  3843 00001A60 83C404                   add  sp, 4
  3844 00001A63 08C0                     or  al, al
  3845 00001A65 0F840600                 je @@checkreg193
  3846 00001A69 B81D00                   mov ax, 29
  3847 00001A6C E9BE01                   jmp @@retn
  3848                                  @@checkreg193:
  3849 00001A6F 68[5B1C]                 push checkreg_15
  3850 00001A72 8D062B81                 lea  ax, [symbol]
  3851 00001A76 50                       push ax
  3852 00001A77 E831E7                   call eqstr
  3853 00001A7A 83C404                   add  sp, 4
  3854 00001A7D 08C0                     or  al, al
  3855 00001A7F 0F840600                 je @@checkreg194
  3856 00001A83 B81F00                   mov ax, 31
  3857 00001A86 E9A401                   jmp @@retn
  3858                                  
  3859                                  ;-391   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;
  3860                                  
  3861                                  @@checkreg194:
  3862 00001A89 68[5E1C]                 push checkreg_16
  3863 00001A8C 8D062B81                 lea  ax, [symbol]
  3864 00001A90 50                       push ax
  3865 00001A91 E817E7                   call eqstr
  3866 00001A94 83C404                   add  sp, 4
  3867 00001A97 08C0                     or  al, al
  3868 00001A99 0F840600                 je @@checkreg195
  3869 00001A9D B82100                   mov ax, 33
  3870 00001AA0 E98A01                   jmp @@retn
  3871                                  @@checkreg195:
  3872 00001AA3 68[611C]                 push checkreg_17
  3873 00001AA6 8D062B81                 lea  ax, [symbol]
  3874 00001AAA 50                       push ax
  3875 00001AAB E8FDE6                   call eqstr
  3876 00001AAE 83C404                   add  sp, 4
  3877 00001AB1 08C0                     or  al, al
  3878 00001AB3 0F840600                 je @@checkreg196
  3879 00001AB7 B82300                   mov ax, 35
  3880 00001ABA E97001                   jmp @@retn
  3881                                  
  3882                                  ;-392   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;
  3883                                  
  3884                                  @@checkreg196:
  3885 00001ABD 68[641C]                 push checkreg_18
  3886 00001AC0 8D062B81                 lea  ax, [symbol]
  3887 00001AC4 50                       push ax
  3888 00001AC5 E8E3E6                   call eqstr
  3889 00001AC8 83C404                   add  sp, 4
  3890 00001ACB 08C0                     or  al, al
  3891 00001ACD 0F840600                 je @@checkreg197
  3892 00001AD1 B82500                   mov ax, 37
  3893 00001AD4 E95601                   jmp @@retn
  3894                                  @@checkreg197:
  3895 00001AD7 68[671C]                 push checkreg_19
  3896 00001ADA 8D062B81                 lea  ax, [symbol]
  3897 00001ADE 50                       push ax
  3898 00001ADF E8C9E6                   call eqstr
  3899 00001AE2 83C404                   add  sp, 4
  3900 00001AE5 08C0                     or  al, al
  3901 00001AE7 0F840600                 je @@checkreg198
  3902 00001AEB B82700                   mov ax, 39
  3903 00001AEE E93C01                   jmp @@retn
  3904                                  
  3905                                  ;-393   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;
  3906                                  
  3907                                  @@checkreg198:
  3908 00001AF1 68[6A1C]                 push checkreg_20
  3909 00001AF4 8D062B81                 lea  ax, [symbol]
  3910 00001AF8 50                       push ax
  3911 00001AF9 E8AFE6                   call eqstr
  3912 00001AFC 83C404                   add  sp, 4
  3913 00001AFF 08C0                     or  al, al
  3914 00001B01 0F840600                 je @@checkreg199
  3915 00001B05 B82900                   mov ax, 41
  3916 00001B08 E92201                   jmp @@retn
  3917                                  @@checkreg199:
  3918 00001B0B 68[6D1C]                 push checkreg_21
  3919 00001B0E 8D062B81                 lea  ax, [symbol]
  3920 00001B12 50                       push ax
  3921 00001B13 E895E6                   call eqstr
  3922 00001B16 83C404                   add  sp, 4
  3923 00001B19 08C0                     or  al, al
  3924 00001B1B 0F840600                 je @@checkreg200
  3925 00001B1F B82B00                   mov ax, 43
  3926 00001B22 E90801                   jmp @@retn
  3927                                  
  3928                                  ;-394   // (eqstr(symbol,"ip")) return 45;
  3929                                  
  3930                                  
  3931                                  ;-395   if (strlen(symbol) >   3) return 0;
  3932                                  
  3933                                  @@checkreg200:
  3934 00001B25 8D062B81                 lea  ax, [symbol]
  3935 00001B29 50                       push ax
  3936 00001B2A E826E6                   call strlen
  3937 00001B2D 83C402                   add  sp, 2
  3938 00001B30 83F803                   cmp ax, 3
  3939 00001B33 0F8E0600                 jle @@checkreg201
  3940 00001B37 B80000                   mov ax, 0
  3941 00001B3A E9F000                   jmp @@retn
  3942                                  
  3943                                  ;-396   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;
  3944                                  
  3945                                  @@checkreg201:
  3946 00001B3D 68[701C]                 push checkreg_22
  3947 00001B40 8D062B81                 lea  ax, [symbol]
  3948 00001B44 50                       push ax
  3949 00001B45 E863E6                   call eqstr
  3950 00001B48 83C404                   add  sp, 4
  3951 00001B4B 08C0                     or  al, al
  3952 00001B4D 0F840600                 je @@checkreg202
  3953 00001B51 B82F00                   mov ax, 47
  3954 00001B54 E9D600                   jmp @@retn
  3955                                  @@checkreg202:
  3956 00001B57 68[741C]                 push checkreg_23
  3957 00001B5A 8D062B81                 lea  ax, [symbol]
  3958 00001B5E 50                       push ax
  3959 00001B5F E849E6                   call eqstr
  3960 00001B62 83C404                   add  sp, 4
  3961 00001B65 08C0                     or  al, al
  3962 00001B67 0F840600                 je @@checkreg203
  3963 00001B6B B83200                   mov ax, 50
  3964 00001B6E E9BC00                   jmp @@retn
  3965                                  
  3966                                  ;-397   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;
  3967                                  
  3968                                  @@checkreg203:
  3969 00001B71 68[781C]                 push checkreg_24
  3970 00001B74 8D062B81                 lea  ax, [symbol]
  3971 00001B78 50                       push ax
  3972 00001B79 E82FE6                   call eqstr
  3973 00001B7C 83C404                   add  sp, 4
  3974 00001B7F 08C0                     or  al, al
  3975 00001B81 0F840600                 je @@checkreg204
  3976 00001B85 B83500                   mov ax, 53
  3977 00001B88 E9A200                   jmp @@retn
  3978                                  @@checkreg204:
  3979 00001B8B 68[7C1C]                 push checkreg_25
  3980 00001B8E 8D062B81                 lea  ax, [symbol]
  3981 00001B92 50                       push ax
  3982 00001B93 E815E6                   call eqstr
  3983 00001B96 83C404                   add  sp, 4
  3984 00001B99 08C0                     or  al, al
  3985 00001B9B 0F840600                 je @@checkreg205
  3986 00001B9F B83800                   mov ax, 56
  3987 00001BA2 E98800                   jmp @@retn
  3988                                  
  3989                                  ;-398   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;
  3990                                  
  3991                                  @@checkreg205:
  3992 00001BA5 68[801C]                 push checkreg_26
  3993 00001BA8 8D062B81                 lea  ax, [symbol]
  3994 00001BAC 50                       push ax
  3995 00001BAD E8FBE5                   call eqstr
  3996 00001BB0 83C404                   add  sp, 4
  3997 00001BB3 08C0                     or  al, al
  3998 00001BB5 0F840600                 je @@checkreg206
  3999 00001BB9 B83B00                   mov ax, 59
  4000 00001BBC E96E00                   jmp @@retn
  4001                                  @@checkreg206:
  4002 00001BBF 68[841C]                 push checkreg_27
  4003 00001BC2 8D062B81                 lea  ax, [symbol]
  4004 00001BC6 50                       push ax
  4005 00001BC7 E8E1E5                   call eqstr
  4006 00001BCA 83C404                   add  sp, 4
  4007 00001BCD 08C0                     or  al, al
  4008 00001BCF 0F840600                 je @@checkreg207
  4009 00001BD3 B83E00                   mov ax, 62
  4010 00001BD6 E95400                   jmp @@retn
  4011                                  
  4012                                  ;-399   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;
  4013                                  
  4014                                  @@checkreg207:
  4015 00001BD9 68[881C]                 push checkreg_28
  4016 00001BDC 8D062B81                 lea  ax, [symbol]
  4017 00001BE0 50                       push ax
  4018 00001BE1 E8C7E5                   call eqstr
  4019 00001BE4 83C404                   add  sp, 4
  4020 00001BE7 08C0                     or  al, al
  4021 00001BE9 0F840600                 je @@checkreg208
  4022 00001BED B84100                   mov ax, 65
  4023 00001BF0 E93A00                   jmp @@retn
  4024                                  @@checkreg208:
  4025 00001BF3 68[8C1C]                 push checkreg_29
  4026 00001BF6 8D062B81                 lea  ax, [symbol]
  4027 00001BFA 50                       push ax
  4028 00001BFB E8ADE5                   call eqstr
  4029 00001BFE 83C404                   add  sp, 4
  4030 00001C01 08C0                     or  al, al
  4031 00001C03 0F840600                 je @@checkreg209
  4032 00001C07 B84400                   mov ax, 68
  4033 00001C0A E92000                   jmp @@retn
  4034                                  
  4035                                  ;-400   if (eqstr(symbol,"cr0")) return 71;
  4036                                  
  4037                                  @@checkreg209:
  4038 00001C0D 68[901C]                 push checkreg_30
  4039 00001C10 8D062B81                 lea  ax, [symbol]
  4040 00001C14 50                       push ax
  4041 00001C15 E893E5                   call eqstr
  4042 00001C18 83C404                   add  sp, 4
  4043 00001C1B 08C0                     or  al, al
  4044 00001C1D 0F840600                 je @@checkreg210
  4045 00001C21 B84700                   mov ax, 71
  4046 00001C24 E90600                   jmp @@retn
  4047                                  
  4048                                  ;-401   return 0;   }
  4049                                  
  4050                                  @@checkreg210:
  4051 00001C27 B80000                   mov ax, 0
  4052 00001C2A E90000                   jmp @@retn
  4053                                  
  4054                                  ;-402 char printregstr[]
  4055                                  
  4056                                  @@retn:
  4057 00001C2D C3                       ret
  4058                                  ; ENDP
  4059 00001C2E 616C00                  checkreg_0 db "al",0
  4060 00001C31 636C00                  checkreg_1 db "cl",0
  4061 00001C34 646C00                  checkreg_2 db "dl",0
  4062 00001C37 626C00                  checkreg_3 db "bl",0
  4063 00001C3A 616800                  checkreg_4 db "ah",0
  4064 00001C3D 636800                  checkreg_5 db "ch",0
  4065 00001C40 646800                  checkreg_6 db "dh",0
  4066 00001C43 626800                  checkreg_7 db "bh",0
  4067 00001C46 617800                  checkreg_8 db "ax",0
  4068 00001C49 637800                  checkreg_9 db "cx",0
  4069 00001C4C 647800                  checkreg_10 db "dx",0
  4070 00001C4F 627800                  checkreg_11 db "bx",0
  4071 00001C52 737000                  checkreg_12 db "sp",0
  4072 00001C55 627000                  checkreg_13 db "bp",0
  4073 00001C58 736900                  checkreg_14 db "si",0
  4074 00001C5B 646900                  checkreg_15 db "di",0
  4075 00001C5E 657300                  checkreg_16 db "es",0
  4076 00001C61 637300                  checkreg_17 db "cs",0
  4077 00001C64 737300                  checkreg_18 db "ss",0
  4078 00001C67 647300                  checkreg_19 db "ds",0
  4079 00001C6A 667300                  checkreg_20 db "fs",0
  4080 00001C6D 677300                  checkreg_21 db "gs",0
  4081 00001C70 65617800                checkreg_22 db "eax",0
  4082 00001C74 65637800                checkreg_23 db "ecx",0
  4083 00001C78 65647800                checkreg_24 db "edx",0
  4084 00001C7C 65627800                checkreg_25 db "ebx",0
  4085 00001C80 65737000                checkreg_26 db "esp",0
  4086 00001C84 65627000                checkreg_27 db "ebp",0
  4087 00001C88 65736900                checkreg_28 db "esi",0
  4088 00001C8C 65646900                checkreg_29 db "edi",0
  4089 00001C90 63723000                checkreg_30 db "cr0",0
  4090                                  
  4091                                  ;-403 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";
  4092                                  
  4093 00001C94 2A616C636C646C626C-     printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0
  4094 00001C9D 616863686468626861-
  4095 00001CA6 786378647862787370-
  4096 00001CAF 627073696469657363-
  4097 00001CB8 737373647366736773-
  4098 00001CC1 697065617865637865-
  4099 00001CCA 647865627865737065-
  4100 00001CD3 627065736965646963-
  4101 00001CDC 723000             
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
  4121 00001CDF C8040000                 ENTER  4,0
  4122 00001CE3 B8[941C]                 mov ax, printregstr
  4123 00001CE6 034604                   add ax, [bp+4]
  4124 00001CE9 8946FE                   mov [bp-2], ax
  4125 00001CEC 8B5EFE                   mov bx, [bp-2]
  4126 00001CEF 8B07                     mov ax, [bx]
  4127 00001CF1 8846FC                   mov [bp-4], al
  4128 00001CF4 8A46FC                   mov al, byte [bp-4]
  4129 00001CF7 B400                     mov ah, 0
  4130 00001CF9 50                       push ax
  4131 00001CFA E86F28                   call prc
  4132 00001CFD 83C402                   add  sp, 2
  4133 00001D00 FF4604                   inc  word[bp+4]
  4134                                  
  4135                                  ;-408   k = &printregstr + i; c=*k; prc(c);
  4136                                  
  4137 00001D03 B8[941C]                 mov ax, printregstr
  4138 00001D06 034604                   add ax, [bp+4]
  4139 00001D09 8946FE                   mov [bp-2], ax
  4140 00001D0C 8B5EFE                   mov bx, [bp-2]
  4141 00001D0F 8B07                     mov ax, [bx]
  4142 00001D11 8846FC                   mov [bp-4], al
  4143 00001D14 8A46FC                   mov al, byte [bp-4]
  4144 00001D17 B400                     mov ah, 0
  4145 00001D19 50                       push ax
  4146 00001D1A E84F28                   call prc
  4147 00001D1D 83C402                   add  sp, 2
  4148                                  
  4149                                  ;-409   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }
  4150                                  
  4151 00001D20 8B4604                   mov ax, [bp+4]
  4152 00001D23 83F82F                   cmp ax, 47
  4153 00001D26 0F8E2000                 jle @@printreg211
  4154 00001D2A FF4604                   inc  word[bp+4]
  4155 00001D2D B8[941C]                 mov ax, printregstr
  4156 00001D30 034604                   add ax, [bp+4]
  4157 00001D33 8946FE                   mov [bp-2], ax
  4158 00001D36 8B5EFE                   mov bx, [bp-2]
  4159 00001D39 8B07                     mov ax, [bx]
  4160 00001D3B 8846FC                   mov [bp-4], al
  4161 00001D3E 8A46FC                   mov al, byte [bp-4]
  4162 00001D41 B400                     mov ah, 0
  4163 00001D43 50                       push ax
  4164 00001D44 E82528                   call prc
  4165 00001D47 83C402                   add  sp, 2
  4166                                  
  4167                                  ;-410 }
  4168                                  
  4169                                  @@printreg211:
  4170                                  
  4171                                  ;-411 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
  4172 00001D4A C9                       LEAVE
  4173 00001D4B C3                       ret
  4174                                  ; ENDP
  4175 00001D4C 0000                    evalue dw 0
  4176 00001D4E 0A00                    exprtype dw 10
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
  4202 00001D50 C8100000                 ENTER  16,0
  4203 00001D54 680101                   push 257
  4204 00001D57 E84427                   call istoken
  4205 00001D5A 83C402                   add  sp, 2
  4206 00001D5D 08C0                     or  al, al
  4207 00001D5F 0F841F00                 je @@expr212
  4208 00001D63 A1[2E00]                 mov ax, [lexval]
  4209 00001D66 A3[4C1D]                 mov word [evalue], ax
  4210                                  
  4211                                  ;-416     prs("\n mov ax, "); prunsign1(lexval); return 4; }
  4212                                  
  4213 00001D69 68[F020]                 push expr_0
  4214 00001D6C E86428                   call prs
  4215 00001D6F 83C402                   add  sp, 2
  4216 00001D72 FF36[2E00]               push word [lexval]
  4217 00001D76 E8B429                   call prunsign1
  4218 00001D79 83C402                   add  sp, 2
  4219 00001D7C B80400                   mov ax, 4
  4220 00001D7F E96C03                   jmp @@retn
  4221                                  
  4222                                  ;-417   mode=typeName(); /*0=V,1=*,2=&*/
  4223                                  
  4224                                  @@expr212:
  4225 00001D82 E867ED                   call typeName
  4226 00001D85 8946FE                   mov [bp-2], ax
  4227                                  
  4228                                  ;-418   ireg1=checkreg();
  4229                                  
  4230 00001D88 E846FB                   call checkreg
  4231 00001D8B A3[E710]                 mov word [ireg1], ax
  4232                                  
  4233                                  ;-419   if (ireg1) { doreg1(0); return; }
  4234                                  
  4235 00001D8E A1[E710]                 mov ax, [ireg1]
  4236 00001D91 08C0                     or  al, al
  4237 00001D93 0F840B00                 je @@expr213
  4238 00001D97 6A00                     push 0
  4239 00001D99 E849F9                   call doreg1
  4240 00001D9C 83C402                   add  sp, 2
  4241 00001D9F E94C03                   jmp @@retn
  4242                                  
  4243                                  ;-420   if (token=='(')  {docall1(); goto e1; }
  4244                                  
  4245                                  @@expr213:
  4246 00001DA2 A1[1C00]                 mov ax, [token]
  4247 00001DA5 83F828                   cmp ax, 40
  4248 00001DA8 0F850600                 jne @@expr214
  4249 00001DAC E82E0F                   call docall1
  4250 00001DAF E93202                   jmp @@e1
  4251                                  
  4252                                  ;-421   if (isreg()) goto e1;
  4253                                  
  4254                                  @@expr214:
  4255 00001DB2 E88307                   call isreg
  4256 00001DB5 08C0                     or  al, al
  4257 00001DB7 0F840300                 je @@expr215
  4258 00001DBB E92602                   jmp @@e1
  4259                                  
  4260                                  ;-422 
  4261                                  
  4262                                  
  4263                                  ;-423   id1=searchname(); gettypes(id1); ids=signi;
  4264                                  
  4265                                  @@expr215:
  4266 00001DBE E85CEC                   call searchname
  4267 00001DC1 8946FC                   mov [bp-4], ax
  4268 00001DC4 FF76FC                   push word [bp-4]
  4269 00001DC7 E815EB                   call gettypes
  4270 00001DCA 83C402                   add  sp, 2
  4271 00001DCD A1[3300]                 mov ax, [signi]
  4272 00001DD0 8946F6                   mov [bp-10], ax
  4273                                  
  4274                                  ;-424   ixarr=0;  ixconst=0;
  4275                                  
  4276 00001DD3 B80000                   mov ax, 0
  4277 00001DD6 8946FA                   mov [bp-6], ax
  4278 00001DD9 B80000                   mov ax, 0
  4279 00001DDC 8946F8                   mov [bp-8], ax
  4280                                  
  4281                                  ;-425     if (istoken('[')) { if (istoken(T_CONST)) {
  4282                                  
  4283 00001DDF 6A5B                     push 91
  4284 00001DE1 E8BA26                   call istoken
  4285 00001DE4 83C402                   add  sp, 2
  4286 00001DE7 08C0                     or  al, al
  4287 00001DE9 0F845900                 je @@expr216
  4288 00001DED 680101                   push 257
  4289 00001DF0 E8AB26                   call istoken
  4290 00001DF3 83C402                   add  sp, 2
  4291 00001DF6 08C0                     or  al, al
  4292 00001DF8 0F841700                 je @@expr217
  4293                                  
  4294                                  ;-426       ixconst=1; ixarr=lexval; expect(']');  }
  4295                                  
  4296 00001DFC B80100                   mov ax, 1
  4297 00001DFF 8946F8                   mov [bp-8], ax
  4298 00001E02 A1[2E00]                 mov ax, [lexval]
  4299 00001E05 8946FA                   mov [bp-6], ax
  4300 00001E08 6A5D                     push 93
  4301 00001E0A E8B326                   call expect
  4302 00001E0D 83C402                   add  sp, 2
  4303                                  
  4304                                  ;-427     else {ixarr=searchname(); expect(T_NAME); expect(']');
  4305                                  
  4306 00001E10 E93300                   jmp @@expr218
  4307                                  @@expr217:
  4308 00001E13 E807EC                   call searchname
  4309 00001E16 8946FA                   mov [bp-6], ax
  4310 00001E19 680001                   push 256
  4311 00001E1C E8A126                   call expect
  4312 00001E1F 83C402                   add  sp, 2
  4313 00001E22 6A5D                     push 93
  4314 00001E24 E89926                   call expect
  4315 00001E27 83C402                   add  sp, 2
  4316                                  
  4317                                  ;-428     gettypes(ixarr);
  4318                                  
  4319 00001E2A FF76FA                   push word [bp-6]
  4320 00001E2D E8AFEA                   call gettypes
  4321 00001E30 83C402                   add  sp, 2
  4322                                  
  4323                                  ;-429     if (widthi != 2) error1("Arrayindex muss Zahl oder int sein"); } }
  4324                                  
  4325 00001E33 A1[3600]                 mov ax, [widthi]
  4326 00001E36 83F802                   cmp ax, 2
  4327 00001E39 0F840900                 je  @@expr219
  4328 00001E3D 68[FC20]                 push expr_1
  4329 00001E40 E8792A                   call error1
  4330 00001E43 83C402                   add  sp, 2
  4331                                  @@expr219:
  4332                                  @@expr218:
  4333                                  
  4334                                  ;-430   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Nur var erlaubt");
  4335                                  
  4336                                  @@expr216:
  4337 00001E46 68C304                   push 1219
  4338 00001E49 E85226                   call istoken
  4339 00001E4C 83C402                   add  sp, 2
  4340 00001E4F 08C0                     or  al, al
  4341 00001E51 0F844600                 je @@expr220
  4342 00001E55 8B46FE                   mov ax, [bp-2]
  4343 00001E58 08C0                     or  al, al
  4344 00001E5A 0F840900                 je @@expr221
  4345 00001E5E 68[1F21]                 push expr_2
  4346 00001E61 E8582A                   call error1
  4347 00001E64 83C402                   add  sp, 2
  4348                                  
  4349                                  ;-431      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");
  4350                                  
  4351                                  @@expr221:
  4352 00001E67 68[2F21]                 push expr_3
  4353 00001E6A E86627                   call prs
  4354 00001E6D 83C402                   add  sp, 2
  4355 00001E70 A1[3900]                 mov ax, [wi]
  4356 00001E73 83F802                   cmp ax, 2
  4357 00001E76 0F850C00                 jne @@expr222
  4358 00001E7A 68[3821]                 push expr_4
  4359 00001E7D E85327                   call prs
  4360 00001E80 83C402                   add  sp, 2
  4361 00001E83 E90900                   jmp @@expr223
  4362                                  @@expr222:
  4363 00001E86 68[3D21]                 push expr_5
  4364 00001E89 E84727                   call prs
  4365 00001E8C 83C402                   add  sp, 2
  4366                                  
  4367                                  ;-432      v(id1); goto e1;}
  4368                                  
  4369                                  @@expr223:
  4370 00001E8F FF76FC                   push word [bp-4]
  4371 00001E92 E89CE5                   call v
  4372 00001E95 83C402                   add  sp, 2
  4373 00001E98 E94901                   jmp @@e1
  4374                                  
  4375                                  ;-433   if (istoken(T_MINUSMINUS)) {if(mode)error1("Nur var erlaubt");
  4376                                  
  4377                                  @@expr220:
  4378 00001E9B 68C904                   push 1225
  4379 00001E9E E8FD25                   call istoken
  4380 00001EA1 83C402                   add  sp, 2
  4381 00001EA4 08C0                     or  al, al
  4382 00001EA6 0F844600                 je @@expr224
  4383 00001EAA 8B46FE                   mov ax, [bp-2]
  4384 00001EAD 08C0                     or  al, al
  4385 00001EAF 0F840900                 je @@expr225
  4386 00001EB3 68[4221]                 push expr_6
  4387 00001EB6 E8032A                   call error1
  4388 00001EB9 83C402                   add  sp, 2
  4389                                  
  4390                                  ;-434      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");
  4391                                  
  4392                                  @@expr225:
  4393 00001EBC 68[5221]                 push expr_7
  4394 00001EBF E81127                   call prs
  4395 00001EC2 83C402                   add  sp, 2
  4396 00001EC5 A1[3900]                 mov ax, [wi]
  4397 00001EC8 83F802                   cmp ax, 2
  4398 00001ECB 0F850C00                 jne @@expr226
  4399 00001ECF 68[5B21]                 push expr_8
  4400 00001ED2 E8FE26                   call prs
  4401 00001ED5 83C402                   add  sp, 2
  4402 00001ED8 E90900                   jmp @@expr227
  4403                                  @@expr226:
  4404 00001EDB 68[6021]                 push expr_9
  4405 00001EDE E8F226                   call prs
  4406 00001EE1 83C402                   add  sp, 2
  4407                                  
  4408                                  ;-435      v(id1); goto e1;}
  4409                                  
  4410                                  @@expr227:
  4411 00001EE4 FF76FC                   push word [bp-4]
  4412 00001EE7 E847E5                   call v
  4413 00001EEA 83C402                   add  sp, 2
  4414 00001EED E9F400                   jmp @@e1
  4415                                  
  4416                                  ;-436        
  4417                                  
  4418                                  
  4419                                  ;-437   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}
  4420                                  
  4421                                  @@expr224:
  4422 00001EF0 68CE04                   push 1230
  4423 00001EF3 E8A825                   call istoken
  4424 00001EF6 83C402                   add  sp, 2
  4425 00001EF9 08C0                     or  al, al
  4426 00001EFB 0F841200                 je @@expr228
  4427 00001EFF FF76FC                   push word [bp-4]
  4428 00001F02 FF76FE                   push word [bp-2]
  4429 00001F05 68[6521]                 push expr_10
  4430 00001F08 E8A802                   call compoundass
  4431 00001F0B 83C406                   add  sp, 6
  4432 00001F0E E9D300                   jmp @@e1
  4433                                  
  4434                                  ;-438   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}
  4435                                  
  4436                                  @@expr228:
  4437 00001F11 68CF04                   push 1231
  4438 00001F14 E88725                   call istoken
  4439 00001F17 83C402                   add  sp, 2
  4440 00001F1A 08C0                     or  al, al
  4441 00001F1C 0F841200                 je @@expr229
  4442 00001F20 FF76FC                   push word [bp-4]
  4443 00001F23 FF76FE                   push word [bp-2]
  4444 00001F26 68[6921]                 push expr_11
  4445 00001F29 E88702                   call compoundass
  4446 00001F2C 83C406                   add  sp, 6
  4447 00001F2F E9B200                   jmp @@e1
  4448                                  
  4449                                  ;-439   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}
  4450                                  
  4451                                  @@expr229:
  4452 00001F32 68D204                   push 1234
  4453 00001F35 E86625                   call istoken
  4454 00001F38 83C402                   add  sp, 2
  4455 00001F3B 08C0                     or  al, al
  4456 00001F3D 0F841200                 je @@expr230
  4457 00001F41 FF76FC                   push word [bp-4]
  4458 00001F44 FF76FE                   push word [bp-2]
  4459 00001F47 68[6D21]                 push expr_12
  4460 00001F4A E86602                   call compoundass
  4461 00001F4D 83C406                   add  sp, 6
  4462 00001F50 E99100                   jmp @@e1
  4463                                  
  4464                                  ;-440   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}    
  4465                                  
  4466                                  @@expr230:
  4467 00001F53 68D304                   push 1235
  4468 00001F56 E84525                   call istoken
  4469 00001F59 83C402                   add  sp, 2
  4470 00001F5C 08C0                     or  al, al
  4471 00001F5E 0F841200                 je @@expr231
  4472 00001F62 FF76FC                   push word [bp-4]
  4473 00001F65 FF76FE                   push word [bp-2]
  4474 00001F68 68[7121]                 push expr_13
  4475 00001F6B E84502                   call compoundass
  4476 00001F6E 83C406                   add  sp, 6
  4477 00001F71 E97000                   jmp @@e1
  4478                                  
  4479                                  ;-441   if (istoken(T_MULASS    )) {error1("not implemented");}
  4480                                  
  4481                                  @@expr231:
  4482 00001F74 68D004                   push 1232
  4483 00001F77 E82425                   call istoken
  4484 00001F7A 83C402                   add  sp, 2
  4485 00001F7D 08C0                     or  al, al
  4486 00001F7F 0F840900                 je @@expr232
  4487 00001F83 68[7421]                 push expr_14
  4488 00001F86 E83329                   call error1
  4489 00001F89 83C402                   add  sp, 2
  4490                                  
  4491                                  ;-442   if (istoken(T_DIVASS    )) {error1("not implemented");}
  4492                                  
  4493                                  @@expr232:
  4494 00001F8C 68D104                   push 1233
  4495 00001F8F E80C25                   call istoken
  4496 00001F92 83C402                   add  sp, 2
  4497 00001F95 08C0                     or  al, al
  4498 00001F97 0F840900                 je @@expr233
  4499 00001F9B 68[8421]                 push expr_15
  4500 00001F9E E81B29                   call error1
  4501 00001FA1 83C402                   add  sp, 2
  4502                                  
  4503                                  ;-443 
  4504                                  
  4505                                  
  4506                                  ;-444   if (istoken('=')) { exprtype= expr(1); 
  4507                                  
  4508                                  @@expr233:
  4509 00001FA4 6A3D                     push 61
  4510 00001FA6 E8F524                   call istoken
  4511 00001FA9 83C402                   add  sp, 2
  4512 00001FAC 08C0                     or  al, al
  4513 00001FAE 0F842000                 je @@expr234
  4514 00001FB2 6A01                     push 1
  4515 00001FB4 E899FD                   call expr
  4516 00001FB7 83C402                   add  sp, 2
  4517 00001FBA A3[4E1D]                 mov word [exprtype], ax
  4518                                  
  4519                                  ;-445   doassign(mode, id1, ixarr, ixconst); goto e1;  }
  4520                                  
  4521 00001FBD FF76F8                   push word [bp-8]
  4522 00001FC0 FF76FA                   push word [bp-6]
  4523 00001FC3 FF76FC                   push word [bp-4]
  4524 00001FC6 FF76FE                   push word [bp-2]
  4525 00001FC9 E85E08                   call doassign
  4526 00001FCC 83C408                   add  sp, 8
  4527 00001FCF E91200                   jmp @@e1
  4528                                  
  4529                                  ;-446   dovar1(mode, "mov", ixarr, id1);
  4530                                  
  4531                                  @@expr234:
  4532 00001FD2 FF76FC                   push word [bp-4]
  4533 00001FD5 FF76FA                   push word [bp-6]
  4534 00001FD8 68[9421]                 push expr_16
  4535 00001FDB FF76FE                   push word [bp-2]
  4536 00001FDE E87402                   call dovar1
  4537 00001FE1 83C408                   add  sp, 8
  4538                                  
  4539                                  ;-447   
  4540                                  
  4541                                  
  4542                                  ;-448 e1:    if (istoken('+')) rterm("add");
  4543                                  
  4544                                  @@e1:
  4545 00001FE4 6A2B                     push 43
  4546 00001FE6 E8B524                   call istoken
  4547 00001FE9 83C402                   add  sp, 2
  4548 00001FEC 08C0                     or  al, al
  4549 00001FEE 0F840C00                 je @@expr235
  4550 00001FF2 68[9821]                 push expr_17
  4551 00001FF5 E82704                   call rterm
  4552 00001FF8 83C402                   add  sp, 2
  4553                                  
  4554                                  ;-449   else if (istoken('-')) rterm("sub" );
  4555                                  
  4556 00001FFB E9CF00                   jmp @@expr236
  4557                                  @@expr235:
  4558 00001FFE 6A2D                     push 45
  4559 00002000 E89B24                   call istoken
  4560 00002003 83C402                   add  sp, 2
  4561 00002006 08C0                     or  al, al
  4562 00002008 0F840C00                 je @@expr237
  4563 0000200C 68[9C21]                 push expr_18
  4564 0000200F E80D04                   call rterm
  4565 00002012 83C402                   add  sp, 2
  4566                                  
  4567                                  ;-450   else if (istoken('&')) rterm("and" );
  4568                                  
  4569 00002015 E9B500                   jmp @@expr238
  4570                                  @@expr237:
  4571 00002018 6A26                     push 38
  4572 0000201A E88124                   call istoken
  4573 0000201D 83C402                   add  sp, 2
  4574 00002020 08C0                     or  al, al
  4575 00002022 0F840C00                 je @@expr239
  4576 00002026 68[A021]                 push expr_19
  4577 00002029 E8F303                   call rterm
  4578 0000202C 83C402                   add  sp, 2
  4579                                  
  4580                                  ;-451   else if (istoken('|')) rterm("or" );  
  4581                                  
  4582 0000202F E99B00                   jmp @@expr240
  4583                                  @@expr239:
  4584 00002032 6A7C                     push 124
  4585 00002034 E86724                   call istoken
  4586 00002037 83C402                   add  sp, 2
  4587 0000203A 08C0                     or  al, al
  4588 0000203C 0F840C00                 je @@expr241
  4589 00002040 68[A421]                 push expr_20
  4590 00002043 E8D903                   call rterm
  4591 00002046 83C402                   add  sp, 2
  4592                                  
  4593                                  ;-452   else if (istoken(T_LESSLESS)) rterm("shl");
  4594                                  
  4595 00002049 E98100                   jmp @@expr242
  4596                                  @@expr241:
  4597 0000204C 68D804                   push 1240
  4598 0000204F E84C24                   call istoken
  4599 00002052 83C402                   add  sp, 2
  4600 00002055 08C0                     or  al, al
  4601 00002057 0F840C00                 je @@expr243
  4602 0000205B 68[A721]                 push expr_21
  4603 0000205E E8BE03                   call rterm
  4604 00002061 83C402                   add  sp, 2
  4605                                  
  4606                                  ;-453   else if (istoken(T_GREATGREAT)) rterm("shr");  
  4607                                  
  4608 00002064 E96600                   jmp @@expr244
  4609                                  @@expr243:
  4610 00002067 68D904                   push 1241
  4611 0000206A E83124                   call istoken
  4612 0000206D 83C402                   add  sp, 2
  4613 00002070 08C0                     or  al, al
  4614 00002072 0F840C00                 je @@expr245
  4615 00002076 68[AB21]                 push expr_22
  4616 00002079 E8A303                   call rterm
  4617 0000207C 83C402                   add  sp, 2
  4618                                  
  4619                                  ;-454   else if (istoken('*')) domul (ids);
  4620                                  
  4621 0000207F E94B00                   jmp @@expr246
  4622                                  @@expr245:
  4623 00002082 6A2A                     push 42
  4624 00002084 E81724                   call istoken
  4625 00002087 83C402                   add  sp, 2
  4626 0000208A 08C0                     or  al, al
  4627 0000208C 0F840C00                 je @@expr247
  4628 00002090 FF76F6                   push word [bp-10]
  4629 00002093 E8DD09                   call domul
  4630 00002096 83C402                   add  sp, 2
  4631                                  
  4632                                  ;-455   else if (istoken('/')) doidiv(ids);
  4633                                  
  4634 00002099 E93100                   jmp @@expr248
  4635                                  @@expr247:
  4636 0000209C 6A2F                     push 47
  4637 0000209E E8FD23                   call istoken
  4638 000020A1 83C402                   add  sp, 2
  4639 000020A4 08C0                     or  al, al
  4640 000020A6 0F840C00                 je @@expr249
  4641 000020AA FF76F6                   push word [bp-10]
  4642 000020AD E8640A                   call doidiv
  4643 000020B0 83C402                   add  sp, 2
  4644                                  
  4645                                  ;-456   else if (istoken('%')) domod (ids);
  4646                                  
  4647 000020B3 E91700                   jmp @@expr250
  4648                                  @@expr249:
  4649 000020B6 6A25                     push 37
  4650 000020B8 E8E323                   call istoken
  4651 000020BB 83C402                   add  sp, 2
  4652 000020BE 08C0                     or  al, al
  4653 000020C0 0F840900                 je @@expr251
  4654 000020C4 FF76F6                   push word [bp-10]
  4655 000020C7 E8ED0B                   call domod
  4656 000020CA 83C402                   add  sp, 2
  4657                                  
  4658                                  ;-457   if (isrelational()) { rterm("cmp"); cmpneg(ids);}
  4659                                  
  4660                                  @@expr251:
  4661                                  @@expr250:
  4662                                  @@expr248:
  4663                                  @@expr246:
  4664                                  @@expr244:
  4665                                  @@expr242:
  4666                                  @@expr240:
  4667                                  @@expr238:
  4668                                  @@expr236:
  4669 000020CD E8431C                   call isrelational
  4670 000020D0 08C0                     or  al, al
  4671 000020D2 0F841200                 je @@expr252
  4672 000020D6 68[AF21]                 push expr_23
  4673 000020D9 E84303                   call rterm
  4674 000020DC 83C402                   add  sp, 2
  4675 000020DF FF76F6                   push word [bp-10]
  4676 000020E2 E87119                   call cmpneg
  4677 000020E5 83C402                   add  sp, 2
  4678                                  
  4679                                  ;-458   return 0;
  4680                                  
  4681                                  @@expr252:
  4682 000020E8 B80000                   mov ax, 0
  4683 000020EB E90000                   jmp @@retn
  4684                                  
  4685                                  ;-459 }
  4686                                  
  4687                                  
  4688                                  ;-460 
  4689                                  
  4690                                  
  4691                                  ;-461 int compoundass(char *op, int mode, int id1) {
  4692                                  
  4693 000020EE C9                      @@retn: LEAVE
  4694 000020EF C3                       ret
  4695                                  ; ENDP
  4696 000020F0 5C6E206D6F76206178-     expr_0 db "\n mov ax, ",0
  4697 000020F9 2C2000             
  4698 000020FC 4172726179696E6465-     expr_1 db "Arrayindex muss Zahl oder int sein",0
  4699 00002105 78206D757373205A61-
  4700 0000210E 686C206F6465722069-
  4701 00002117 6E74207365696E00   
  4702 0000211F 4E7572207661722065-     expr_2 db "Nur var erlaubt",0
  4703 00002128 726C6175627400     
  4704 0000212F 5C6E20696E63202000      expr_3 db "\n inc  ",0
  4705 00002138 776F726400              expr_4 db "word",0
  4706 0000213D 6279746500              expr_5 db "byte",0
  4707 00002142 4E7572207661722065-     expr_6 db "Nur var erlaubt",0
  4708 0000214B 726C6175627400     
  4709 00002152 5C6E20646563202000      expr_7 db "\n dec  ",0
  4710 0000215B 776F726400              expr_8 db "word",0
  4711 00002160 6279746500              expr_9 db "byte",0
  4712 00002165 61646400                expr_10 db "add",0
  4713 00002169 73756200                expr_11 db "sub",0
  4714 0000216D 616E6400                expr_12 db "and",0
  4715 00002171 6F7200                  expr_13 db "or",0
  4716 00002174 6E6F7420696D706C65-     expr_14 db "not implemented",0
  4717 0000217D 6D656E74656400     
  4718 00002184 6E6F7420696D706C65-     expr_15 db "not implemented",0
  4719 0000218D 6D656E74656400     
  4720 00002194 6D6F7600                expr_16 db "mov",0
  4721 00002198 61646400                expr_17 db "add",0
  4722 0000219C 73756200                expr_18 db "sub",0
  4723 000021A0 616E6400                expr_19 db "and",0
  4724 000021A4 6F7200                  expr_20 db "or",0
  4725 000021A7 73686C00                expr_21 db "shl",0
  4726 000021AB 73687200                expr_22 db "shr",0
  4727 000021AF 636D7000                expr_23 db "cmp",0
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
  4738 000021B3 C8000000                 ENTER  0,0
  4739 000021B7 8B4606                   mov ax, [bp+6]
  4740 000021BA 08C0                     or  al, al
  4741 000021BC 0F840900                 je @@compoundass253
  4742 000021C0 68[2D22]                 push compoundass_0
  4743 000021C3 E8F626                   call error1
  4744 000021C6 83C402                   add  sp, 2
  4745                                  
  4746                                  ;-463   prnl(); prs(op); prs("  "); 
  4747                                  
  4748                                  @@compoundass253:
  4749 000021C9 E8F923                   call prnl
  4750 000021CC FF7604                   push word [bp+4]
  4751 000021CF E80124                   call prs
  4752 000021D2 83C402                   add  sp, 2
  4753 000021D5 68[4522]                 push compoundass_1
  4754 000021D8 E8F823                   call prs
  4755 000021DB 83C402                   add  sp, 2
  4756                                  
  4757                                  ;-464   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  4758                                  
  4759 000021DE FF7608                   push word [bp+8]
  4760 000021E1 E8FBE6                   call gettypes
  4761 000021E4 83C402                   add  sp, 2
  4762 000021E7 A1[3900]                 mov ax, [wi]
  4763 000021EA 83F802                   cmp ax, 2
  4764 000021ED 0F850C00                 jne @@compoundass254
  4765 000021F1 68[4822]                 push compoundass_2
  4766 000021F4 E8DC23                   call prs
  4767 000021F7 83C402                   add  sp, 2
  4768 000021FA E90900                   jmp @@compoundass255
  4769                                  @@compoundass254:
  4770 000021FD 68[4D22]                 push compoundass_3
  4771 00002200 E8D023                   call prs
  4772 00002203 83C402                   add  sp, 2
  4773                                  
  4774                                  ;-465   v(id1); prs(", ");
  4775                                  
  4776                                  @@compoundass255:
  4777 00002206 FF7608                   push word [bp+8]
  4778 00002209 E825E2                   call v
  4779 0000220C 83C402                   add  sp, 2
  4780 0000220F 68[5222]                 push compoundass_4
  4781 00002212 E8BE23                   call prs
  4782 00002215 83C402                   add  sp, 2
  4783                                  
  4784                                  ;-466   expect(T_CONST); prunsign1(lexval);
  4785                                  
  4786 00002218 680101                   push 257
  4787 0000221B E8A222                   call expect
  4788 0000221E 83C402                   add  sp, 2
  4789 00002221 FF36[2E00]               push word [lexval]
  4790 00002225 E80525                   call prunsign1
  4791 00002228 83C402                   add  sp, 2
  4792                                  
  4793                                  ;-467 }
  4794                                  
  4795                                  
  4796                                  ;-468 int dovar1(int mode, int op, int ixarr, int id1) { 
  4797 0000222B C9                       LEAVE
  4798 0000222C C3                       ret
  4799                                  ; ENDP
  4800 0000222D 6F6E6C79207363616C-     compoundass_0 db "only scalar Var allowed",0
  4801 00002236 61722056617220616C-
  4802 0000223F 6C6F77656400       
  4803 00002245 202000                  compoundass_1 db "  ",0
  4804 00002248 776F726400              compoundass_2 db "word",0
  4805 0000224D 6279746500              compoundass_3 db "byte",0
  4806 00002252 2C2000                  compoundass_4 db ", ",0
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
  4818 00002255 C8000000                 ENTER  0,0
  4819 00002259 FF760A                   push word [bp+10]
  4820 0000225C E880E6                   call gettypes
  4821 0000225F 83C402                   add  sp, 2
  4822                                  
  4823                                  ;-470   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);
  4824                                  
  4825 00002262 8B4604                   mov ax, [bp+4]
  4826 00002265 83F801                   cmp ax, 1
  4827 00002268 0F854700                 jne @@dovar1256
  4828 0000226C 68[AA23]                 push dovar1_0
  4829 0000226F E86123                   call prs
  4830 00002272 83C402                   add  sp, 2
  4831 00002275 FF760A                   push word [bp+10]
  4832 00002278 E8B6E1                   call v
  4833 0000227B 83C402                   add  sp, 2
  4834 0000227E E84423                   call prnl
  4835 00002281 FF7606                   push word [bp+6]
  4836 00002284 E84C23                   call prs
  4837 00002287 83C402                   add  sp, 2
  4838                                  
  4839                                  ;-471     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");
  4840                                  
  4841 0000228A A1[3600]                 mov ax, [widthi]
  4842 0000228D 83F801                   cmp ax, 1
  4843 00002290 0F850900                 jne @@dovar1257
  4844 00002294 68[B623]                 push dovar1_1
  4845 00002297 E83923                   call prs
  4846 0000229A 83C402                   add  sp, 2
  4847                                  
  4848                                  ;-472     if(widthi == 2) prs(" ax, [bx]");
  4849                                  
  4850                                  @@dovar1257:
  4851 0000229D A1[3600]                 mov ax, [widthi]
  4852 000022A0 83F802                   cmp ax, 2
  4853 000022A3 0F850900                 jne @@dovar1258
  4854 000022A7 68[CC23]                 push dovar1_2
  4855 000022AA E82623                   call prs
  4856 000022AD 83C402                   add  sp, 2
  4857                                  
  4858                                  ;-473     return; }
  4859                                  
  4860                                  @@dovar1258:
  4861 000022B0 E9F500                   jmp @@retn
  4862                                  
  4863                                  ;-474   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }
  4864                                  
  4865                                  @@dovar1256:
  4866 000022B3 8B4604                   mov ax, [bp+4]
  4867 000022B6 83F802                   cmp ax, 2
  4868 000022B9 0F852100                 jne @@dovar1259
  4869 000022BD E80523                   call prnl
  4870 000022C0 FF7606                   push word [bp+6]
  4871 000022C3 E80D23                   call prs
  4872 000022C6 83C402                   add  sp, 2
  4873 000022C9 68[D623]                 push dovar1_3
  4874 000022CC E80423                   call prs
  4875 000022CF 83C402                   add  sp, 2
  4876 000022D2 FF760A                   push word [bp+10]
  4877 000022D5 E84AE1                   call a
  4878 000022D8 83C402                   add  sp, 2
  4879 000022DB E9CA00                   jmp @@retn
  4880                                  
  4881                                  ;-475   if (ixarr) {
  4882                                  
  4883                                  @@dovar1259:
  4884 000022DE 8B4608                   mov ax, [bp+8]
  4885 000022E1 08C0                     or  al, al
  4886 000022E3 0F847300                 je @@dovar1260
  4887                                  
  4888                                  ;-476     prs("\n mov bx, "); v(ixarr);
  4889                                  
  4890 000022E7 68[DC23]                 push dovar1_4
  4891 000022EA E8E622                   call prs
  4892 000022ED 83C402                   add  sp, 2
  4893 000022F0 FF7608                   push word [bp+8]
  4894 000022F3 E83BE1                   call v
  4895 000022F6 83C402                   add  sp, 2
  4896                                  
  4897                                  ;-477     if (wi==2) prs("\n shl bx, 1");
  4898                                  
  4899 000022F9 A1[3900]                 mov ax, [wi]
  4900 000022FC 83F802                   cmp ax, 2
  4901 000022FF 0F850900                 jne @@dovar1261
  4902 00002303 68[E823]                 push dovar1_5
  4903 00002306 E8CA22                   call prs
  4904 00002309 83C402                   add  sp, 2
  4905                                  
  4906                                  ;-478     prs("\n "); prs(op);
  4907                                  
  4908                                  @@dovar1261:
  4909 0000230C 68[F523]                 push dovar1_6
  4910 0000230F E8C122                   call prs
  4911 00002312 83C402                   add  sp, 2
  4912 00002315 FF7606                   push word [bp+6]
  4913 00002318 E8B822                   call prs
  4914 0000231B 83C402                   add  sp, 2
  4915                                  
  4916                                  ;-479     if (wi==2) prs(" ax, "); else prs(" al, ");
  4917                                  
  4918 0000231E A1[3900]                 mov ax, [wi]
  4919 00002321 83F802                   cmp ax, 2
  4920 00002324 0F850C00                 jne @@dovar1262
  4921 00002328 68[F923]                 push dovar1_7
  4922 0000232B E8A522                   call prs
  4923 0000232E 83C402                   add  sp, 2
  4924 00002331 E90900                   jmp @@dovar1263
  4925                                  @@dovar1262:
  4926 00002334 68[FF23]                 push dovar1_8
  4927 00002337 E89922                   call prs
  4928 0000233A 83C402                   add  sp, 2
  4929                                  
  4930                                  ;-480 // v(id1); prs(" [bx]");
  4931                                  
  4932                                  
  4933                                  ;-481     prc('['); printName(id1); prs(" + bx]"); 
  4934                                  
  4935                                  @@dovar1263:
  4936 0000233D 6A5B                     push 91
  4937 0000233F E82A22                   call prc
  4938 00002342 83C402                   add  sp, 2
  4939 00002345 FF760A                   push word [bp+10]
  4940 00002348 E86EE6                   call printName
  4941 0000234B 83C402                   add  sp, 2
  4942 0000234E 68[0524]                 push dovar1_9
  4943 00002351 E87F22                   call prs
  4944 00002354 83C402                   add  sp, 2
  4945                                  
  4946                                  ;-482     return; }
  4947                                  
  4948 00002357 E94E00                   jmp @@retn
  4949                                  
  4950                                  ;-483   prnl();prs(op);
  4951                                  
  4952                                  @@dovar1260:
  4953 0000235A E86822                   call prnl
  4954 0000235D FF7606                   push word [bp+6]
  4955 00002360 E87022                   call prs
  4956 00002363 83C402                   add  sp, 2
  4957                                  
  4958                                  ;-484   if(wi==1) prs(" al, ");
  4959                                  
  4960 00002366 A1[3900]                 mov ax, [wi]
  4961 00002369 83F801                   cmp ax, 1
  4962 0000236C 0F850900                 jne @@dovar1264
  4963 00002370 68[0C24]                 push dovar1_10
  4964 00002373 E85D22                   call prs
  4965 00002376 83C402                   add  sp, 2
  4966                                  
  4967                                  ;-485   if(wi==2) prs(" ax, ");
  4968                                  
  4969                                  @@dovar1264:
  4970 00002379 A1[3900]                 mov ax, [wi]
  4971 0000237C 83F802                   cmp ax, 2
  4972 0000237F 0F850900                 jne @@dovar1265
  4973 00002383 68[1224]                 push dovar1_11
  4974 00002386 E84A22                   call prs
  4975 00002389 83C402                   add  sp, 2
  4976                                  
  4977                                  ;-486   if(wi==4) prs(" eax, ");
  4978                                  
  4979                                  @@dovar1265:
  4980 0000238C A1[3900]                 mov ax, [wi]
  4981 0000238F 83F804                   cmp ax, 4
  4982 00002392 0F850900                 jne @@dovar1266
  4983 00002396 68[1824]                 push dovar1_12
  4984 00002399 E83722                   call prs
  4985 0000239C 83C402                   add  sp, 2
  4986                                  
  4987                                  ;-487   v(id1);
  4988                                  
  4989                                  @@dovar1266:
  4990 0000239F FF760A                   push word [bp+10]
  4991 000023A2 E88CE0                   call v
  4992 000023A5 83C402                   add  sp, 2
  4993                                  
  4994                                  ;-488 }
  4995                                  
  4996                                  
  4997                                  ;-489 int rterm(char *op) {int mode; int opint; int ixarr; int id1;
  4998                                  
  4999 000023A8 C9                      @@retn: LEAVE
  5000 000023A9 C3                       ret
  5001                                  ; ENDP
  5002 000023AA 5C6E206D6F76206278-     dovar1_0 db "\n mov bx, ",0
  5003 000023B3 2C2000             
  5004 000023B6 20616C2C205B62785D-     dovar1_1 db " al, [bx]\n mov ah, 0",0
  5005 000023BF 5C6E206D6F76206168-
  5006 000023C8 2C203000           
  5007 000023CC 2061782C205B62785D-     dovar1_2 db " ax, [bx]",0
  5008 000023D5 00                 
  5009 000023D6 2061782C2000            dovar1_3 db " ax, ",0
  5010 000023DC 5C6E206D6F76206278-     dovar1_4 db "\n mov bx, ",0
  5011 000023E5 2C2000             
  5012 000023E8 5C6E2073686C206278-     dovar1_5 db "\n shl bx, 1",0
  5013 000023F1 2C203100           
  5014 000023F5 5C6E2000                dovar1_6 db "\n ",0
  5015 000023F9 2061782C2000            dovar1_7 db " ax, ",0
  5016 000023FF 20616C2C2000            dovar1_8 db " al, ",0
  5017 00002405 202B2062785D00          dovar1_9 db " + bx]",0
  5018 0000240C 20616C2C2000            dovar1_10 db " al, ",0
  5019 00002412 2061782C2000            dovar1_11 db " ax, ",0
  5020 00002418 206561782C2000          dovar1_12 db " eax, ",0
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
  5033 0000241F C8080000                 ENTER  8,0
  5034 00002423 680101                   push 257
  5035 00002426 E87520                   call istoken
  5036 00002429 83C402                   add  sp, 2
  5037 0000242C 08C0                     or  al, al
  5038 0000242E 0F845200                 je @@rterm267
  5039 00002432 E89021                   call prnl
  5040 00002435 FF7604                   push word [bp+4]
  5041 00002438 E89821                   call prs
  5042 0000243B 83C402                   add  sp, 2
  5043                                  
  5044                                  ;-491     if (wi==1) prs(" al, ");
  5045                                  
  5046 0000243E A1[3900]                 mov ax, [wi]
  5047 00002441 83F801                   cmp ax, 1
  5048 00002444 0F850900                 jne @@rterm268
  5049 00002448 68[0825]                 push rterm_0
  5050 0000244B E88521                   call prs
  5051 0000244E 83C402                   add  sp, 2
  5052                                  
  5053                                  ;-492     if (wi==2) prs(" ax, ");
  5054                                  
  5055                                  @@rterm268:
  5056 00002451 A1[3900]                 mov ax, [wi]
  5057 00002454 83F802                   cmp ax, 2
  5058 00002457 0F850900                 jne @@rterm269
  5059 0000245B 68[0E25]                 push rterm_1
  5060 0000245E E87221                   call prs
  5061 00002461 83C402                   add  sp, 2
  5062                                  
  5063                                  ;-493     if (wi==4) prs(" eax, ");
  5064                                  
  5065                                  @@rterm269:
  5066 00002464 A1[3900]                 mov ax, [wi]
  5067 00002467 83F804                   cmp ax, 4
  5068 0000246A 0F850900                 jne @@rterm270
  5069 0000246E 68[1425]                 push rterm_2
  5070 00002471 E85F21                   call prs
  5071 00002474 83C402                   add  sp, 2
  5072                                  
  5073                                  ;-494     prunsign1(lexval); return;}
  5074                                  
  5075                                  @@rterm270:
  5076 00002477 FF36[2E00]               push word [lexval]
  5077 0000247B E8AF22                   call prunsign1
  5078 0000247E 83C402                   add  sp, 2
  5079 00002481 E98200                   jmp @@retn
  5080                                  
  5081                                  ;-495   mode=typeName(); id1=searchname(); ixarr=0;
  5082                                  
  5083                                  @@rterm267:
  5084 00002484 E865E6                   call typeName
  5085 00002487 8946FE                   mov [bp-2], ax
  5086 0000248A E890E5                   call searchname
  5087 0000248D 8946F8                   mov [bp-8], ax
  5088 00002490 B80000                   mov ax, 0
  5089 00002493 8946FA                   mov [bp-6], ax
  5090                                  
  5091                                  ;-496   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');  
  5092                                  
  5093 00002496 6A5B                     push 91
  5094 00002498 E80320                   call istoken
  5095 0000249B 83C402                   add  sp, 2
  5096 0000249E 08C0                     or  al, al
  5097 000024A0 0F843300                 je @@rterm271
  5098 000024A4 E876E5                   call searchname
  5099 000024A7 8946FA                   mov [bp-6], ax
  5100 000024AA 680001                   push 256
  5101 000024AD E81020                   call expect
  5102 000024B0 83C402                   add  sp, 2
  5103 000024B3 6A5D                     push 93
  5104 000024B5 E80820                   call expect
  5105 000024B8 83C402                   add  sp, 2
  5106                                  
  5107                                  ;-497     gettypes(ixarr);
  5108                                  
  5109 000024BB FF76FA                   push word [bp-6]
  5110 000024BE E81EE4                   call gettypes
  5111 000024C1 83C402                   add  sp, 2
  5112                                  
  5113                                  ;-498     if (widthi != 2) error1("Arrayindex muss int sein"); }
  5114                                  
  5115 000024C4 A1[3600]                 mov ax, [widthi]
  5116 000024C7 83F802                   cmp ax, 2
  5117 000024CA 0F840900                 je  @@rterm272
  5118 000024CE 68[1B25]                 push rterm_3
  5119 000024D1 E8E823                   call error1
  5120 000024D4 83C402                   add  sp, 2
  5121                                  @@rterm272:
  5122                                  
  5123                                  ;-499   if (eqstr(symbol,"_AX")) return;
  5124                                  
  5125                                  @@rterm271:
  5126 000024D7 68[3425]                 push rterm_4
  5127 000024DA 8D062B81                 lea  ax, [symbol]
  5128 000024DE 50                       push ax
  5129 000024DF E8C9DC                   call eqstr
  5130 000024E2 83C404                   add  sp, 4
  5131 000024E5 08C0                     or  al, al
  5132 000024E7 0F840300                 je @@rterm273
  5133 000024EB E91800                   jmp @@retn
  5134                                  
  5135                                  ;-500   opint=op; dovar1(mode, opint, ixarr, id1);
  5136                                  
  5137                                  @@rterm273:
  5138 000024EE 8B4604                   mov ax, [bp+4]
  5139 000024F1 8946FC                   mov [bp-4], ax
  5140 000024F4 FF76F8                   push word [bp-8]
  5141 000024F7 FF76FA                   push word [bp-6]
  5142 000024FA FF76FC                   push word [bp-4]
  5143 000024FD FF76FE                   push word [bp-2]
  5144 00002500 E852FD                   call dovar1
  5145 00002503 83C408                   add  sp, 8
  5146                                  
  5147                                  ;-501 }
  5148                                  
  5149                                  
  5150                                  ;-502 int isreg() {
  5151                                  
  5152 00002506 C9                      @@retn: LEAVE
  5153 00002507 C3                       ret
  5154                                  ; ENDP
  5155 00002508 20616C2C2000            rterm_0 db " al, ",0
  5156 0000250E 2061782C2000            rterm_1 db " ax, ",0
  5157 00002514 206561782C2000          rterm_2 db " eax, ",0
  5158 0000251B 4172726179696E6465-     rterm_3 db "Arrayindex muss int sein",0
  5159 00002524 78206D75737320696E-
  5160 0000252D 74207365696E00     
  5161 00002534 5F415800                rterm_4 db "_AX",0
  5162                                  
  5163                                  isreg:  ; *** PROC ***
  5164                                  
  5165                                  ;-503   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}
  5166                                  
  5167 00002538 68[2527]                 push isreg_0
  5168 0000253B 8D062B81                 lea  ax, [symbol]
  5169 0000253F 50                       push ax
  5170 00002540 E868DC                   call eqstr
  5171 00002543 83C404                   add  sp, 4
  5172 00002546 08C0                     or  al, al
  5173 00002548 0F840C00                 je @@isreg274
  5174 0000254C 68[2927]                 push isreg_1
  5175 0000254F E84202                   call doreg
  5176 00002552 83C402                   add  sp, 2
  5177 00002555 E9C601                   jmp @@r1
  5178                                  
  5179                                  ;-504   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}  
  5180                                  
  5181                                  @@isreg274:
  5182 00002558 68[2C27]                 push isreg_2
  5183 0000255B 8D062B81                 lea  ax, [symbol]
  5184 0000255F 50                       push ax
  5185 00002560 E848DC                   call eqstr
  5186 00002563 83C404                   add  sp, 4
  5187 00002566 08C0                     or  al, al
  5188 00002568 0F840C00                 je @@isreg275
  5189 0000256C 68[3027]                 push isreg_3
  5190 0000256F E82202                   call doreg
  5191 00002572 83C402                   add  sp, 2
  5192 00002575 E9A601                   jmp @@r1
  5193                                  
  5194                                  ;-505   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}
  5195                                  
  5196                                  @@isreg275:
  5197 00002578 68[3327]                 push isreg_4
  5198 0000257B 8D062B81                 lea  ax, [symbol]
  5199 0000257F 50                       push ax
  5200 00002580 E828DC                   call eqstr
  5201 00002583 83C404                   add  sp, 4
  5202 00002586 08C0                     or  al, al
  5203 00002588 0F840C00                 je @@isreg276
  5204 0000258C 68[3727]                 push isreg_5
  5205 0000258F E80202                   call doreg
  5206 00002592 83C402                   add  sp, 2
  5207 00002595 E98601                   jmp @@r1
  5208                                  
  5209                                  ;-506   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}
  5210                                  
  5211                                  @@isreg276:
  5212 00002598 68[3A27]                 push isreg_6
  5213 0000259B 8D062B81                 lea  ax, [symbol]
  5214 0000259F 50                       push ax
  5215 000025A0 E808DC                   call eqstr
  5216 000025A3 83C404                   add  sp, 4
  5217 000025A6 08C0                     or  al, al
  5218 000025A8 0F840C00                 je @@isreg277
  5219 000025AC 68[3E27]                 push isreg_7
  5220 000025AF E8E201                   call doreg
  5221 000025B2 83C402                   add  sp, 2
  5222 000025B5 E96601                   jmp @@r1
  5223                                  
  5224                                  ;-507   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}
  5225                                  
  5226                                  @@isreg277:
  5227 000025B8 68[4127]                 push isreg_8
  5228 000025BB 8D062B81                 lea  ax, [symbol]
  5229 000025BF 50                       push ax
  5230 000025C0 E8E8DB                   call eqstr
  5231 000025C3 83C404                   add  sp, 4
  5232 000025C6 08C0                     or  al, al
  5233 000025C8 0F840C00                 je @@isreg278
  5234 000025CC 68[4527]                 push isreg_9
  5235 000025CF E8C201                   call doreg
  5236 000025D2 83C402                   add  sp, 2
  5237 000025D5 E94601                   jmp @@r1
  5238                                  
  5239                                  ;-508   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}    
  5240                                  
  5241                                  @@isreg278:
  5242 000025D8 68[4827]                 push isreg_10
  5243 000025DB 8D062B81                 lea  ax, [symbol]
  5244 000025DF 50                       push ax
  5245 000025E0 E8C8DB                   call eqstr
  5246 000025E3 83C404                   add  sp, 4
  5247 000025E6 08C0                     or  al, al
  5248 000025E8 0F840C00                 je @@isreg279
  5249 000025EC 68[4C27]                 push isreg_11
  5250 000025EF E8A201                   call doreg
  5251 000025F2 83C402                   add  sp, 2
  5252 000025F5 E92601                   jmp @@r1
  5253                                  
  5254                                  ;-509   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}
  5255                                  
  5256                                  @@isreg279:
  5257 000025F8 68[4F27]                 push isreg_12
  5258 000025FB 8D062B81                 lea  ax, [symbol]
  5259 000025FF 50                       push ax
  5260 00002600 E8A8DB                   call eqstr
  5261 00002603 83C404                   add  sp, 4
  5262 00002606 08C0                     or  al, al
  5263 00002608 0F840C00                 je @@isreg280
  5264 0000260C 68[5327]                 push isreg_13
  5265 0000260F E88201                   call doreg
  5266 00002612 83C402                   add  sp, 2
  5267 00002615 E90601                   jmp @@r1
  5268                                  
  5269                                  ;-510   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}
  5270                                  
  5271                                  @@isreg280:
  5272 00002618 68[5627]                 push isreg_14
  5273 0000261B 8D062B81                 lea  ax, [symbol]
  5274 0000261F 50                       push ax
  5275 00002620 E888DB                   call eqstr
  5276 00002623 83C404                   add  sp, 4
  5277 00002626 08C0                     or  al, al
  5278 00002628 0F840C00                 je @@isreg281
  5279 0000262C 68[5A27]                 push isreg_15
  5280 0000262F E86201                   call doreg
  5281 00002632 83C402                   add  sp, 2
  5282 00002635 E9E600                   jmp @@r1
  5283                                  
  5284                                  ;-511   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}    
  5285                                  
  5286                                  @@isreg281:
  5287 00002638 68[5D27]                 push isreg_16
  5288 0000263B 8D062B81                 lea  ax, [symbol]
  5289 0000263F 50                       push ax
  5290 00002640 E868DB                   call eqstr
  5291 00002643 83C404                   add  sp, 4
  5292 00002646 08C0                     or  al, al
  5293 00002648 0F840C00                 je @@isreg282
  5294 0000264C 68[6127]                 push isreg_17
  5295 0000264F E84201                   call doreg
  5296 00002652 83C402                   add  sp, 2
  5297 00002655 E9C600                   jmp @@r1
  5298                                  
  5299                                  ;-512   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}
  5300                                  
  5301                                  @@isreg282:
  5302 00002658 68[6427]                 push isreg_18
  5303 0000265B 8D062B81                 lea  ax, [symbol]
  5304 0000265F 50                       push ax
  5305 00002660 E848DB                   call eqstr
  5306 00002663 83C404                   add  sp, 4
  5307 00002666 08C0                     or  al, al
  5308 00002668 0F840C00                 je @@isreg283
  5309 0000266C 68[6827]                 push isreg_19
  5310 0000266F E82201                   call doreg
  5311 00002672 83C402                   add  sp, 2
  5312 00002675 E9A600                   jmp @@r1
  5313                                  
  5314                                  ;-513   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}
  5315                                  
  5316                                  @@isreg283:
  5317 00002678 68[6B27]                 push isreg_20
  5318 0000267B 8D062B81                 lea  ax, [symbol]
  5319 0000267F 50                       push ax
  5320 00002680 E828DB                   call eqstr
  5321 00002683 83C404                   add  sp, 4
  5322 00002686 08C0                     or  al, al
  5323 00002688 0F840C00                 je @@isreg284
  5324 0000268C 68[6F27]                 push isreg_21
  5325 0000268F E80201                   call doreg
  5326 00002692 83C402                   add  sp, 2
  5327 00002695 E98600                   jmp @@r1
  5328                                  
  5329                                  ;-514   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}  
  5330                                  
  5331                                  @@isreg284:
  5332 00002698 68[7227]                 push isreg_22
  5333 0000269B 8D062B81                 lea  ax, [symbol]
  5334 0000269F 50                       push ax
  5335 000026A0 E808DB                   call eqstr
  5336 000026A3 83C404                   add  sp, 4
  5337 000026A6 08C0                     or  al, al
  5338 000026A8 0F840C00                 je @@isreg285
  5339 000026AC 68[7627]                 push isreg_23
  5340 000026AF E8E200                   call doreg
  5341 000026B2 83C402                   add  sp, 2
  5342 000026B5 E96600                   jmp @@r1
  5343                                  
  5344                                  ;-515   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}
  5345                                  
  5346                                  @@isreg285:
  5347 000026B8 68[7927]                 push isreg_24
  5348 000026BB 8D062B81                 lea  ax, [symbol]
  5349 000026BF 50                       push ax
  5350 000026C0 E8E8DA                   call eqstr
  5351 000026C3 83C404                   add  sp, 4
  5352 000026C6 08C0                     or  al, al
  5353 000026C8 0F840C00                 je @@isreg286
  5354 000026CC 68[7D27]                 push isreg_25
  5355 000026CF E8C200                   call doreg
  5356 000026D2 83C402                   add  sp, 2
  5357 000026D5 E94600                   jmp @@r1
  5358                                  
  5359                                  ;-516   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}
  5360                                  
  5361                                  @@isreg286:
  5362 000026D8 68[8027]                 push isreg_26
  5363 000026DB 8D062B81                 lea  ax, [symbol]
  5364 000026DF 50                       push ax
  5365 000026E0 E8C8DA                   call eqstr
  5366 000026E3 83C404                   add  sp, 4
  5367 000026E6 08C0                     or  al, al
  5368 000026E8 0F840C00                 je @@isreg287
  5369 000026EC 68[8427]                 push isreg_27
  5370 000026EF E8A200                   call doreg
  5371 000026F2 83C402                   add  sp, 2
  5372 000026F5 E92600                   jmp @@r1
  5373                                  
  5374                                  ;-517   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}  
  5375                                  
  5376                                  @@isreg287:
  5377 000026F8 68[8727]                 push isreg_28
  5378 000026FB 8D062B81                 lea  ax, [symbol]
  5379 000026FF 50                       push ax
  5380 00002700 E8A8DA                   call eqstr
  5381 00002703 83C404                   add  sp, 4
  5382 00002706 08C0                     or  al, al
  5383 00002708 0F840C00                 je @@isreg288
  5384 0000270C 68[8E27]                 push isreg_29
  5385 0000270F E88200                   call doreg
  5386 00002712 83C402                   add  sp, 2
  5387 00002715 E90600                   jmp @@r1
  5388                                  
  5389                                  ;-518   return 0;   r1: return 1; 
  5390                                  
  5391                                  @@isreg288:
  5392 00002718 B80000                   mov ax, 0
  5393 0000271B E90600                   jmp @@retn
  5394                                  @@r1:
  5395 0000271E B80100                   mov ax, 1
  5396 00002721 E90000                   jmp @@retn
  5397                                  
  5398                                  ;-519 }
  5399                                  
  5400                                  
  5401                                  ;-520 int doreg(char *dr) { int i; expect('=');
  5402                                  
  5403                                  @@retn:
  5404 00002724 C3                       ret
  5405                                  ; ENDP
  5406 00002725 5F414800                isreg_0 db "_AH",0
  5407 00002729 616800                  isreg_1 db "ah",0
  5408 0000272C 5F414C00                isreg_2 db "_AL",0
  5409 00002730 616C00                  isreg_3 db "al",0
  5410 00002733 5F415800                isreg_4 db "_AX",0
  5411 00002737 617800                  isreg_5 db "ax",0
  5412 0000273A 5F424800                isreg_6 db "_BH",0
  5413 0000273E 626800                  isreg_7 db "bh",0
  5414 00002741 5F424C00                isreg_8 db "_BL",0
  5415 00002745 626C00                  isreg_9 db "bl",0
  5416 00002748 5F425800                isreg_10 db "_BX",0
  5417 0000274C 627800                  isreg_11 db "bx",0
  5418 0000274F 5F434800                isreg_12 db "_CH",0
  5419 00002753 636800                  isreg_13 db "ch",0
  5420 00002756 5F434C00                isreg_14 db "_CL",0
  5421 0000275A 636C00                  isreg_15 db "cl",0
  5422 0000275D 5F435800                isreg_16 db "_CX",0
  5423 00002761 637800                  isreg_17 db "cx",0
  5424 00002764 5F444800                isreg_18 db "_DH",0
  5425 00002768 646800                  isreg_19 db "dh",0
  5426 0000276B 5F444C00                isreg_20 db "_DL",0
  5427 0000276F 646C00                  isreg_21 db "dl",0
  5428 00002772 5F445800                isreg_22 db "_DX",0
  5429 00002776 647800                  isreg_23 db "dx",0
  5430 00002779 5F534900                isreg_24 db "_SI",0
  5431 0000277D 736900                  isreg_25 db "si",0
  5432 00002780 5F444900                isreg_26 db "_DI",0
  5433 00002784 646900                  isreg_27 db "di",0
  5434 00002787 5F464C41475300          isreg_28 db "_FLAGS",0
  5435 0000278E 666C61677300            isreg_29 db "flags",0
  5436                                  
  5437                                  doreg:  ; *** PROC ***
  5438                                  ;Function : doreg, Number of local variables: 2
  5439                                  ;   # type sign width addr used name   list of local variables
  5440                                  ;  200 ptr sign byte   520 NULL dr = bp+4
  5441                                  ;  201 var sign word   520 NULL i = bp-2;
  5442 00002794 C8020000                 ENTER  2,0
  5443 00002798 6A3D                     push 61
  5444 0000279A E8231D                   call expect
  5445 0000279D 83C402                   add  sp, 2
  5446                                  
  5447                                  ;-521   prs("\n mov  "); prs(dr); prs(", ");
  5448                                  
  5449 000027A0 68[0328]                 push doreg_0
  5450 000027A3 E82D1E                   call prs
  5451 000027A6 83C402                   add  sp, 2
  5452 000027A9 FF7604                   push word [bp+4]
  5453 000027AC E8241E                   call prs
  5454 000027AF 83C402                   add  sp, 2
  5455 000027B2 68[0C28]                 push doreg_1
  5456 000027B5 E81B1E                   call prs
  5457 000027B8 83C402                   add  sp, 2
  5458                                  
  5459                                  ;-522        if (istoken(T_CONST)) prunsign1(lexval);
  5460                                  
  5461 000027BB 680101                   push 257
  5462 000027BE E8DD1C                   call istoken
  5463 000027C1 83C402                   add  sp, 2
  5464 000027C4 08C0                     or  al, al
  5465 000027C6 0F840D00                 je @@doreg289
  5466 000027CA FF36[2E00]               push word [lexval]
  5467 000027CE E85C1F                   call prunsign1
  5468 000027D1 83C402                   add  sp, 2
  5469                                  
  5470                                  ;-523   else if (istoken(T_NAME )) { i=searchname(); v(i); }
  5471                                  
  5472 000027D4 E92A00                   jmp @@doreg290
  5473                                  @@doreg289:
  5474 000027D7 680001                   push 256
  5475 000027DA E8C11C                   call istoken
  5476 000027DD 83C402                   add  sp, 2
  5477 000027E0 08C0                     or  al, al
  5478 000027E2 0F841200                 je @@doreg291
  5479 000027E6 E834E2                   call searchname
  5480 000027E9 8946FE                   mov [bp-2], ax
  5481 000027EC FF76FE                   push word [bp-2]
  5482 000027EF E83FDC                   call v
  5483 000027F2 83C402                   add  sp, 2
  5484                                  
  5485                                  ;-524   else error1("only number or var allowed"); }
  5486                                  
  5487 000027F5 E90900                   jmp @@doreg292
  5488                                  @@doreg291:
  5489 000027F8 68[0F28]                 push doreg_2
  5490 000027FB E8BE20                   call error1
  5491 000027FE 83C402                   add  sp, 2
  5492                                  @@doreg292:
  5493                                  @@doreg290:
  5494                                  
  5495                                  ;-525 
  5496                                  
  5497                                  
  5498                                  ;-526 int doassign(int mode, int i, int ixarr, int ixconst) {
  5499 00002801 C9                       LEAVE
  5500 00002802 C3                       ret
  5501                                  ; ENDP
  5502 00002803 5C6E206D6F76202000      doreg_0 db "\n mov  ",0
  5503 0000280C 2C2000                  doreg_1 db ", ",0
  5504 0000280F 6F6E6C79206E756D62-     doreg_2 db "only number or var allowed",0
  5505 00002818 6572206F7220766172-
  5506 00002821 20616C6C6F77656400 
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
  5518 0000282A C8000000                 ENTER  0,0
  5519 0000282E FF7606                   push word [bp+6]
  5520 00002831 E8ABE0                   call gettypes
  5521 00002834 83C402                   add  sp, 2
  5522                                  
  5523                                  ;-528   if (mode==1) {prs("\n mov  bx, ");v(i);                  
  5524                                  
  5525 00002837 8B4604                   mov ax, [bp+4]
  5526 0000283A 83F801                   cmp ax, 1
  5527 0000283D 0F853400                 jne @@doassign293
  5528 00002841 68[C729]                 push doassign_0
  5529 00002844 E88C1D                   call prs
  5530 00002847 83C402                   add  sp, 2
  5531 0000284A FF7606                   push word [bp+6]
  5532 0000284D E8E1DB                   call v
  5533 00002850 83C402                   add  sp, 2
  5534                                  
  5535                                  ;-529     if (widthi == 2) prs("\n mov  [bx], ax");
  5536                                  
  5537 00002853 A1[3600]                 mov ax, [widthi]
  5538 00002856 83F802                   cmp ax, 2
  5539 00002859 0F850C00                 jne @@doassign294
  5540 0000285D 68[D429]                 push doassign_1
  5541 00002860 E8701D                   call prs
  5542 00002863 83C402                   add  sp, 2
  5543                                  
  5544                                  ;-530     else  prs("\n mov  [bx], al"); return;}
  5545                                  
  5546 00002866 E90900                   jmp @@doassign295
  5547                                  @@doassign294:
  5548 00002869 68[E529]                 push doassign_2
  5549 0000286C E8641D                   call prs
  5550 0000286F 83C402                   add  sp, 2
  5551                                  @@doassign295:
  5552 00002872 E95001                   jmp @@retn
  5553                                  
  5554                                  ;-531   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}
  5555                                  
  5556                                  @@doassign293:
  5557 00002875 8B4604                   mov ax, [bp+4]
  5558 00002878 83F802                   cmp ax, 2
  5559 0000287B 0F851E00                 jne @@doassign296
  5560 0000287F 68[F629]                 push doassign_3
  5561 00002882 E84E1D                   call prs
  5562 00002885 83C402                   add  sp, 2
  5563 00002888 FF7606                   push word [bp+6]
  5564 0000288B E894DB                   call a
  5565 0000288E 83C402                   add  sp, 2
  5566 00002891 68[FF29]                 push doassign_4
  5567 00002894 E83C1D                   call prs
  5568 00002897 83C402                   add  sp, 2
  5569 0000289A E92801                   jmp @@retn
  5570                                  
  5571                                  ;-532   if (ixarr) {  prs("\n mov bx, ");
  5572                                  
  5573                                  @@doassign296:
  5574 0000289D 8B4608                   mov ax, [bp+8]
  5575 000028A0 08C0                     or  al, al
  5576 000028A2 0F846E00                 je @@doassign297
  5577 000028A6 68[042A]                 push doassign_5
  5578 000028A9 E8271D                   call prs
  5579 000028AC 83C402                   add  sp, 2
  5580                                  
  5581                                  ;-533     if(ixconst) prunsign1(ixarr); else v(ixarr);
  5582                                  
  5583 000028AF 8B460A                   mov ax, [bp+10]
  5584 000028B2 08C0                     or  al, al
  5585 000028B4 0F840C00                 je @@doassign298
  5586 000028B8 FF7608                   push word [bp+8]
  5587 000028BB E86F1E                   call prunsign1
  5588 000028BE 83C402                   add  sp, 2
  5589 000028C1 E90900                   jmp @@doassign299
  5590                                  @@doassign298:
  5591 000028C4 FF7608                   push word [bp+8]
  5592 000028C7 E867DB                   call v
  5593 000028CA 83C402                   add  sp, 2
  5594                                  
  5595                                  ;-534     if (wi==2) prs("\n shl bx, 1");
  5596                                  
  5597                                  @@doassign299:
  5598 000028CD A1[3900]                 mov ax, [wi]
  5599 000028D0 83F802                   cmp ax, 2
  5600 000028D3 0F850900                 jne @@doassign300
  5601 000028D7 68[102A]                 push doassign_6
  5602 000028DA E8F61C                   call prs
  5603 000028DD 83C402                   add  sp, 2
  5604                                  
  5605                                  ;-535     prs("\n mov ["); printName(i);
  5606                                  
  5607                                  @@doassign300:
  5608 000028E0 68[1D2A]                 push doassign_7
  5609 000028E3 E8ED1C                   call prs
  5610 000028E6 83C402                   add  sp, 2
  5611 000028E9 FF7606                   push word [bp+6]
  5612 000028EC E8CAE0                   call printName
  5613 000028EF 83C402                   add  sp, 2
  5614                                  
  5615                                  ;-536     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }
  5616                                  
  5617 000028F2 A1[3900]                 mov ax, [wi]
  5618 000028F5 83F802                   cmp ax, 2
  5619 000028F8 0F850C00                 jne @@doassign301
  5620 000028FC 68[262A]                 push doassign_8
  5621 000028FF E8D11C                   call prs
  5622 00002902 83C402                   add  sp, 2
  5623 00002905 E90900                   jmp @@doassign302
  5624                                  @@doassign301:
  5625 00002908 68[2F2A]                 push doassign_9
  5626 0000290B E8C51C                   call prs
  5627 0000290E 83C402                   add  sp, 2
  5628                                  @@doassign302:
  5629 00002911 E9B100                   jmp @@retn
  5630                                  
  5631                                  ;-537   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");
  5632                                  
  5633                                  @@doassign297:
  5634 00002914 A1[3900]                 mov ax, [wi]
  5635 00002917 83F801                   cmp ax, 1
  5636 0000291A 0F853100                 jne @@doassign303
  5637 0000291E 68[382A]                 push doassign_10
  5638 00002921 E8AF1C                   call prs
  5639 00002924 83C402                   add  sp, 2
  5640 00002927 8B4606                   mov ax, [bp+6]
  5641 0000292A 3DC800                   cmp ax, 200
  5642 0000292D 0F8D0900                 jge @@doassign304
  5643 00002931 68[402A]                 push doassign_11
  5644 00002934 E89C1C                   call prs
  5645 00002937 83C402                   add  sp, 2
  5646                                  
  5647                                  ;-538     } v(i); prs(", al"); return; }
  5648                                  
  5649                                  @@doassign304:
  5650 0000293A FF7606                   push word [bp+6]
  5651 0000293D E8F1DA                   call v
  5652 00002940 83C402                   add  sp, 2
  5653 00002943 68[462A]                 push doassign_12
  5654 00002946 E88A1C                   call prs
  5655 00002949 83C402                   add  sp, 2
  5656 0000294C E97600                   jmp @@retn
  5657                                  
  5658                                  ;-539   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");
  5659                                  
  5660                                  @@doassign303:
  5661 0000294F A1[3900]                 mov ax, [wi]
  5662 00002952 83F802                   cmp ax, 2
  5663 00002955 0F853100                 jne @@doassign305
  5664 00002959 68[4B2A]                 push doassign_13
  5665 0000295C E8741C                   call prs
  5666 0000295F 83C402                   add  sp, 2
  5667 00002962 8B4606                   mov ax, [bp+6]
  5668 00002965 3DC800                   cmp ax, 200
  5669 00002968 0F8D0900                 jge @@doassign306
  5670 0000296C 68[532A]                 push doassign_14
  5671 0000296F E8611C                   call prs
  5672 00002972 83C402                   add  sp, 2
  5673                                  
  5674                                  ;-540     } v(i); prs(", ax"); return; }
  5675                                  
  5676                                  @@doassign306:
  5677 00002975 FF7606                   push word [bp+6]
  5678 00002978 E8B6DA                   call v
  5679 0000297B 83C402                   add  sp, 2
  5680 0000297E 68[592A]                 push doassign_15
  5681 00002981 E84F1C                   call prs
  5682 00002984 83C402                   add  sp, 2
  5683 00002987 E93B00                   jmp @@retn
  5684                                  
  5685                                  ;-541   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");
  5686                                  
  5687                                  @@doassign305:
  5688 0000298A A1[3900]                 mov ax, [wi]
  5689 0000298D 83F804                   cmp ax, 4
  5690 00002990 0F853100                 jne @@doassign307
  5691 00002994 68[5E2A]                 push doassign_16
  5692 00002997 E8391C                   call prs
  5693 0000299A 83C402                   add  sp, 2
  5694 0000299D 8B4606                   mov ax, [bp+6]
  5695 000029A0 3DC800                   cmp ax, 200
  5696 000029A3 0F8D0900                 jge @@doassign308
  5697 000029A7 68[662A]                 push doassign_17
  5698 000029AA E8261C                   call prs
  5699 000029AD 83C402                   add  sp, 2
  5700                                  
  5701                                  ;-542     } v(i); prs(", eax"); return; }
  5702                                  
  5703                                  @@doassign308:
  5704 000029B0 FF7606                   push word [bp+6]
  5705 000029B3 E87BDA                   call v
  5706 000029B6 83C402                   add  sp, 2
  5707 000029B9 68[6D2A]                 push doassign_18
  5708 000029BC E8141C                   call prs
  5709 000029BF 83C402                   add  sp, 2
  5710 000029C2 E90000                   jmp @@retn
  5711                                  
  5712                                  ;-543 }
  5713                                  
  5714                                  @@doassign307:
  5715                                  
  5716                                  ;-544 int domul(int ids) {
  5717                                  
  5718 000029C5 C9                      @@retn: LEAVE
  5719 000029C6 C3                       ret
  5720                                  ; ENDP
  5721 000029C7 5C6E206D6F76202062-     doassign_0 db "\n mov  bx, ",0
  5722 000029D0 782C2000           
  5723 000029D4 5C6E206D6F7620205B-     doassign_1 db "\n mov  [bx], ax",0
  5724 000029DD 62785D2C20617800   
  5725 000029E5 5C6E206D6F7620205B-     doassign_2 db "\n mov  [bx], al",0
  5726 000029EE 62785D2C20616C00   
  5727 000029F6 5C6E206D6F76202000      doassign_3 db "\n mov  ",0
  5728 000029FF 2C20617800              doassign_4 db ", ax",0
  5729 00002A04 5C6E206D6F76206278-     doassign_5 db "\n mov bx, ",0
  5730 00002A0D 2C2000             
  5731 00002A10 5C6E2073686C206278-     doassign_6 db "\n shl bx, 1",0
  5732 00002A19 2C203100           
  5733 00002A1D 5C6E206D6F76205B00      doassign_7 db "\n mov [",0
  5734 00002A26 2B62785D2C20617800      doassign_8 db "+bx], ax",0
  5735 00002A2F 2B62785D2C20616C00      doassign_9 db "+bx], al",0
  5736 00002A38 5C6E206D6F762000        doassign_10 db "\n mov ",0
  5737 00002A40 627974652000            doassign_11 db "byte ",0
  5738 00002A46 2C20616C00              doassign_12 db ", al",0
  5739 00002A4B 5C6E206D6F762000        doassign_13 db "\n mov ",0
  5740 00002A53 776F72642000            doassign_14 db "word ",0
  5741 00002A59 2C20617800              doassign_15 db ", ax",0
  5742 00002A5E 5C6E206D6F762000        doassign_16 db "\n mov ",0
  5743 00002A66 64776F72642000          doassign_17 db "dword ",0
  5744 00002A6D 2C2065617800            doassign_18 db ", eax",0
  5745                                  
  5746                                  domul:  ; *** PROC ***
  5747                                  
  5748                                  ;-545   if (ids) rterm("imul"); else {
  5749                                  
  5750                                  ;Function : domul, Number of local variables: 1
  5751                                  ;   # type sign width addr used name   list of local variables
  5752                                  ;  200 var sign word   544 NULL ids = bp+4;
  5753 00002A73 C8000000                 ENTER  0,0
  5754 00002A77 8B4604                   mov ax, [bp+4]
  5755 00002A7A 08C0                     or  al, al
  5756 00002A7C 0F840C00                 je @@domul309
  5757 00002A80 68[C52A]                 push domul_0
  5758 00002A83 E899F9                   call rterm
  5759 00002A86 83C402                   add  sp, 2
  5760 00002A89 E93700                   jmp @@domul310
  5761                                  @@domul309:
  5762                                  
  5763                                  ;-546   if (istoken(T_CONST)) {prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx"); }
  5764                                  
  5765 00002A8C 680101                   push 257
  5766 00002A8F E80C1A                   call istoken
  5767 00002A92 83C402                   add  sp, 2
  5768 00002A95 08C0                     or  al, al
  5769 00002A97 0F841F00                 je @@domul311
  5770 00002A9B 68[CA2A]                 push domul_1
  5771 00002A9E E8321B                   call prs
  5772 00002AA1 83C402                   add  sp, 2
  5773 00002AA4 FF36[2E00]               push word [lexval]
  5774 00002AA8 E8821C                   call prunsign1
  5775 00002AAB 83C402                   add  sp, 2
  5776 00002AAE 68[D62A]                 push domul_2
  5777 00002AB1 E81F1B                   call prs
  5778 00002AB4 83C402                   add  sp, 2
  5779                                  
  5780                                  ;-547   else error1("with MUL only const number as multiplicator allowed"); } }
  5781                                  
  5782 00002AB7 E90900                   jmp @@domul312
  5783                                  @@domul311:
  5784 00002ABA 68[E02A]                 push domul_3
  5785 00002ABD E8FC1D                   call error1
  5786 00002AC0 83C402                   add  sp, 2
  5787                                  @@domul312:
  5788                                  @@domul310:
  5789                                  
  5790                                  ;-548 int doidiv(int ids) { int mode; int id1;
  5791 00002AC3 C9                       LEAVE
  5792 00002AC4 C3                       ret
  5793                                  ; ENDP
  5794 00002AC5 696D756C00              domul_0 db "imul",0
  5795 00002ACA 5C6E206D6F76206278-     domul_1 db "\n mov bx, ",0
  5796 00002AD3 2C2000             
  5797 00002AD6 5C6E206D756C206278-     domul_2 db "\n mul bx",0
  5798 00002ADF 00                 
  5799 00002AE0 77697468204D554C20-     domul_3 db "with MUL only const number as multiplicator allowed",0
  5800 00002AE9 6F6E6C7920636F6E73-
  5801 00002AF2 74206E756D62657220-
  5802 00002AFB 6173206D756C746970-
  5803 00002B04 6C696361746F722061-
  5804 00002B0D 6C6C6F77656400     
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
  5815 00002B14 C8040000                 ENTER  4,0
  5816 00002B18 680101                   push 257
  5817 00002B1B E88019                   call istoken
  5818 00002B1E 83C402                   add  sp, 2
  5819 00002B21 08C0                     or  al, al
  5820 00002B23 0F843400                 je @@doidiv313
  5821                                  
  5822                                  ;-550     prs("\n mov bx, "); prunsign1(lexval);
  5823                                  
  5824 00002B27 68[D92B]                 push doidiv_0
  5825 00002B2A E8A61A                   call prs
  5826 00002B2D 83C402                   add  sp, 2
  5827 00002B30 FF36[2E00]               push word [lexval]
  5828 00002B34 E8F61B                   call prunsign1
  5829 00002B37 83C402                   add  sp, 2
  5830                                  
  5831                                  ;-551     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5832                                  
  5833 00002B3A 8B4604                   mov ax, [bp+4]
  5834 00002B3D 08C0                     or  al, al
  5835 00002B3F 0F840C00                 je @@doidiv314
  5836 00002B43 68[E52B]                 push doidiv_1
  5837 00002B46 E88A1A                   call prs
  5838 00002B49 83C402                   add  sp, 2
  5839 00002B4C E90900                   jmp @@doidiv315
  5840                                  @@doidiv314:
  5841 00002B4F 68[F62B]                 push doidiv_2
  5842 00002B52 E87E1A                   call prs
  5843 00002B55 83C402                   add  sp, 2
  5844                                  @@doidiv315:
  5845                                  
  5846                                  ;-552   else {
  5847                                  
  5848 00002B58 E97C00                   jmp @@doidiv316
  5849                                  @@doidiv313:
  5850                                  
  5851                                  ;-553     mode=typeName(); id1=searchname();
  5852                                  
  5853 00002B5B E88EDF                   call typeName
  5854 00002B5E 8946FE                   mov [bp-2], ax
  5855 00002B61 E8B9DE                   call searchname
  5856 00002B64 8946FC                   mov [bp-4], ax
  5857                                  
  5858                                  ;-554     if (mode) error1("only const number or int as divisor allowed");
  5859                                  
  5860 00002B67 8B46FE                   mov ax, [bp-2]
  5861 00002B6A 08C0                     or  al, al
  5862 00002B6C 0F840900                 je @@doidiv317
  5863 00002B70 68[0C2C]                 push doidiv_3
  5864 00002B73 E8461D                   call error1
  5865 00002B76 83C402                   add  sp, 2
  5866                                  
  5867                                  ;-555     gettypes(id1);
  5868                                  
  5869                                  @@doidiv317:
  5870 00002B79 FF76FC                   push word [bp-4]
  5871 00002B7C E860DD                   call gettypes
  5872 00002B7F 83C402                   add  sp, 2
  5873                                  
  5874                                  ;-556     if (typei) error1("only int as simple var divisor allowed");
  5875                                  
  5876 00002B82 A1[3000]                 mov ax, [typei]
  5877 00002B85 08C0                     or  al, al
  5878 00002B87 0F840900                 je @@doidiv318
  5879 00002B8B 68[382C]                 push doidiv_4
  5880 00002B8E E82B1D                   call error1
  5881 00002B91 83C402                   add  sp, 2
  5882                                  
  5883                                  ;-557     if (wi!=2) error1("only int, no byte as divisor allowed");
  5884                                  
  5885                                  @@doidiv318:
  5886 00002B94 A1[3900]                 mov ax, [wi]
  5887 00002B97 83F802                   cmp ax, 2
  5888 00002B9A 0F840900                 je  @@doidiv319
  5889 00002B9E 68[5F2C]                 push doidiv_5
  5890 00002BA1 E8181D                   call error1
  5891 00002BA4 83C402                   add  sp, 2
  5892                                  
  5893                                  ;-558     prs("\n mov bx, "); v(id1);
  5894                                  
  5895                                  @@doidiv319:
  5896 00002BA7 68[842C]                 push doidiv_6
  5897 00002BAA E8261A                   call prs
  5898 00002BAD 83C402                   add  sp, 2
  5899 00002BB0 FF76FC                   push word [bp-4]
  5900 00002BB3 E87BD8                   call v
  5901 00002BB6 83C402                   add  sp, 2
  5902                                  
  5903                                  ;-559     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5904                                  
  5905 00002BB9 8B4604                   mov ax, [bp+4]
  5906 00002BBC 08C0                     or  al, al
  5907 00002BBE 0F840C00                 je @@doidiv320
  5908 00002BC2 68[902C]                 push doidiv_7
  5909 00002BC5 E80B1A                   call prs
  5910 00002BC8 83C402                   add  sp, 2
  5911 00002BCB E90900                   jmp @@doidiv321
  5912                                  @@doidiv320:
  5913 00002BCE 68[A12C]                 push doidiv_8
  5914 00002BD1 E8FF19                   call prs
  5915 00002BD4 83C402                   add  sp, 2
  5916                                  @@doidiv321:
  5917                                  
  5918                                  ;-560 }
  5919                                  
  5920                                  @@doidiv316:
  5921                                  
  5922                                  ;-561 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
  5923 00002BD7 C9                       LEAVE
  5924 00002BD8 C3                       ret
  5925                                  ; ENDP
  5926 00002BD9 5C6E206D6F76206278-     doidiv_0 db "\n mov bx, ",0
  5927 00002BE2 2C2000             
  5928 00002BE5 5C6E206377645C6E20-     doidiv_1 db "\n cwd\n idiv bx",0
  5929 00002BEE 6964697620627800   
  5930 00002BF6 5C6E206D6F76206478-     doidiv_2 db "\n mov dx, 0\n div bx",0
  5931 00002BFF 2C20305C6E20646976-
  5932 00002C08 20627800           
  5933 00002C0C 6F6E6C7920636F6E73-     doidiv_3 db "only const number or int as divisor allowed",0
  5934 00002C15 74206E756D62657220-
  5935 00002C1E 6F7220696E74206173-
  5936 00002C27 2064697669736F7220-
  5937 00002C30 616C6C6F77656400   
  5938 00002C38 6F6E6C7920696E7420-     doidiv_4 db "only int as simple var divisor allowed",0
  5939 00002C41 61732073696D706C65-
  5940 00002C4A 207661722064697669-
  5941 00002C53 736F7220616C6C6F77-
  5942 00002C5C 656400             
  5943 00002C5F 6F6E6C7920696E742C-     doidiv_5 db "only int, no byte as divisor allowed",0
  5944 00002C68 206E6F206279746520-
  5945 00002C71 61732064697669736F-
  5946 00002C7A 7220616C6C6F776564-
  5947 00002C83 00                 
  5948 00002C84 5C6E206D6F76206278-     doidiv_6 db "\n mov bx, ",0
  5949 00002C8D 2C2000             
  5950 00002C90 5C6E206377645C6E20-     doidiv_7 db "\n cwd\n idiv bx",0
  5951 00002C99 6964697620627800   
  5952 00002CA1 5C6E206D6F76206478-     doidiv_8 db "\n mov dx, 0\n div bx",0
  5953 00002CAA 2C20305C6E20646976-
  5954 00002CB3 20627800           
  5955                                  
  5956                                  domod:  ; *** PROC ***
  5957                                  ;Function : domod, Number of local variables: 1
  5958                                  ;   # type sign width addr used name   list of local variables
  5959                                  ;  200 var sign word   561 NULL ids = bp+4;
  5960 00002CB7 C8000000                 ENTER  0,0
  5961 00002CBB FF7604                   push word [bp+4]
  5962 00002CBE E853FE                   call doidiv
  5963 00002CC1 83C402                   add  sp, 2
  5964 00002CC4 68[CF2C]                 push domod_0
  5965 00002CC7 E80919                   call prs
  5966 00002CCA 83C402                   add  sp, 2
  5967                                  
  5968                                  ;-562 
  5969                                  
  5970                                  
  5971                                  ;-563 int docalltype[10]; int docallvalue[10];
  5972 00002CCD C9                       LEAVE
  5973 00002CCE C3                       ret
  5974                                  ; ENDP
  5975 00002CCF 5C6E206D6F76206178-     domod_0 db "\n mov ax, dx",0
  5976 00002CD8 2C20647800         
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
  6007 00002CDD C80A0000                 ENTER  10,0
  6008 00002CE1 B80000                   mov ax, 0
  6009 00002CE4 8946FC                   mov [bp-4], ax
  6010 00002CE7 B80000                   mov ax, 0
  6011 00002CEA 8946F6                   mov [bp-10], ax
  6012                                  
  6013                                  ;-567   checknamelen();
  6014                                  
  6015 00002CED E874D7                   call checknamelen
  6016                                  
  6017                                  ;-568   strcpy(&procname, symbol);
  6018                                  
  6019 00002CF0 8D062B81                 lea  ax, [symbol]
  6020 00002CF4 50                       push ax
  6021 00002CF5 8D06CBD0                 lea  ax, [procname]
  6022 00002CF9 50                       push ax
  6023 00002CFA E87ED4                   call strcpy
  6024 00002CFD 83C404                   add  sp, 4
  6025                                  
  6026                                  ;-569   storecall();
  6027                                  
  6028 00002D00 E8EADE                   call storecall
  6029                                  
  6030                                  ;-570   expect('(');
  6031                                  
  6032 00002D03 6A28                     push 40
  6033 00002D05 E8B817                   call expect
  6034 00002D08 83C402                   add  sp, 2
  6035                                  
  6036                                  ;-571 	if (istoken(')') ==0 ) {
  6037                                  
  6038 00002D0B 6A29                     push 41
  6039 00002D0D E88E17                   call istoken
  6040 00002D10 83C402                   add  sp, 2
  6041 00002D13 83F800                   cmp ax, 0
  6042 00002D16 0F857802                 jne @@docall1322
  6043                                  
  6044                                  ;-572 	  do { narg++;
  6045                                  
  6046                                  @@docall1323:
  6047 00002D1A FF46FC                   inc  word[bp-4]
  6048                                  
  6049                                  ;-573 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;
  6050                                  
  6051 00002D1D 8B46FC                   mov ax, [bp-4]
  6052 00002D20 83F809                   cmp ax, 9
  6053 00002D23 0F8E0900                 jle @@docall1324
  6054 00002D27 68[D62F]                 push docall1_0
  6055 00002D2A E88F1B                   call error1
  6056 00002D2D 83C402                   add  sp, 2
  6057                                  @@docall1324:
  6058 00002D30 B80000                   mov ax, 0
  6059 00002D33 8946FA                   mov [bp-6], ax
  6060                                  
  6061                                  ;-574       if(istoken(T_CONST)) {t0=1; n0=lexval; }
  6062                                  
  6063 00002D36 680101                   push 257
  6064 00002D39 E86217                   call istoken
  6065 00002D3C 83C402                   add  sp, 2
  6066 00002D3F 08C0                     or  al, al
  6067 00002D41 0F840C00                 je @@docall1325
  6068 00002D45 B80100                   mov ax, 1
  6069 00002D48 8946FA                   mov [bp-6], ax
  6070 00002D4B A1[2E00]                 mov ax, [lexval]
  6071 00002D4E 8946F8                   mov [bp-8], ax
  6072                                  
  6073                                  ;-575       if(istoken(T_STRING)){t0=2; n0=nconst;
  6074                                  
  6075                                  @@docall1325:
  6076 00002D51 680201                   push 258
  6077 00002D54 E84717                   call istoken
  6078 00002D57 83C402                   add  sp, 2
  6079 00002D5A 08C0                     or  al, al
  6080 00002D5C 0F846300                 je @@docall1326
  6081 00002D60 B80200                   mov ax, 2
  6082 00002D63 8946FA                   mov [bp-6], ax
  6083 00002D66 A1[2400]                 mov ax, [nconst]
  6084 00002D69 8946F8                   mov [bp-8], ax
  6085                                  
  6086                                  ;-576         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");
  6087                                  
  6088 00002D6C 68[E82F]                 push docall1_1
  6089 00002D6F E8CC17                   call eprs
  6090 00002D72 83C402                   add  sp, 2
  6091 00002D75 8D06AB81                 lea  ax, [fname]
  6092 00002D79 50                       push ax
  6093 00002D7A E8C117                   call eprs
  6094 00002D7D 83C402                   add  sp, 2
  6095 00002D80 6A5F                     push 95
  6096 00002D82 E8A617                   call eprc
  6097 00002D85 83C402                   add  sp, 2
  6098 00002D88 FF36[2400]               push word [nconst]
  6099 00002D8C E8D818                   call eprnum
  6100 00002D8F 83C402                   add  sp, 2
  6101 00002D92 68[EB2F]                 push docall1_2
  6102 00002D95 E8A617                   call eprs
  6103 00002D98 83C402                   add  sp, 2
  6104                                  
  6105                                  ;-577         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }
  6106                                  
  6107 00002D9B 6A22                     push 34
  6108 00002D9D E88B17                   call eprc
  6109 00002DA0 83C402                   add  sp, 2
  6110 00002DA3 8D062B81                 lea  ax, [symbol]
  6111 00002DA7 50                       push ax
  6112 00002DA8 E89317                   call eprs
  6113 00002DAB 83C402                   add  sp, 2
  6114 00002DAE 6A22                     push 34
  6115 00002DB0 E87817                   call eprc
  6116 00002DB3 83C402                   add  sp, 2
  6117 00002DB6 68[F02F]                 push docall1_3
  6118 00002DB9 E88217                   call eprs
  6119 00002DBC 83C402                   add  sp, 2
  6120 00002DBF FF06[2400]               inc  word[nconst]
  6121                                  
  6122                                  ;-578       if(istoken('&'))     {t0=3; name1(); n0=searchname();}
  6123                                  
  6124                                  @@docall1326:
  6125 00002DC3 6A26                     push 38
  6126 00002DC5 E8D616                   call istoken
  6127 00002DC8 83C402                   add  sp, 2
  6128 00002DCB 08C0                     or  al, al
  6129 00002DCD 0F840F00                 je @@docall1327
  6130 00002DD1 B80300                   mov ax, 3
  6131 00002DD4 8946FA                   mov [bp-6], ax
  6132 00002DD7 E8EBDD                   call name1
  6133 00002DDA E840DC                   call searchname
  6134 00002DDD 8946F8                   mov [bp-8], ax
  6135                                  
  6136                                  ;-579       if(istoken(T_NAME))  { n0=checkreg();
  6137                                  
  6138                                  @@docall1327:
  6139 00002DE0 680001                   push 256
  6140 00002DE3 E8B816                   call istoken
  6141 00002DE6 83C402                   add  sp, 2
  6142 00002DE9 08C0                     or  al, al
  6143 00002DEB 0F844800                 je @@docall1328
  6144 00002DEF E8DFEA                   call checkreg
  6145 00002DF2 8946F8                   mov [bp-8], ax
  6146                                  
  6147                                  ;-580         if (n0) t0=5;
  6148                                  
  6149 00002DF5 8B46F8                   mov ax, [bp-8]
  6150 00002DF8 08C0                     or  al, al
  6151 00002DFA 0F840900                 je @@docall1329
  6152 00002DFE B80500                   mov ax, 5
  6153 00002E01 8946FA                   mov [bp-6], ax
  6154                                  
  6155                                  ;-581         else {t0=4; n0=searchname();
  6156                                  
  6157 00002E04 E93000                   jmp @@docall1330
  6158                                  @@docall1329:
  6159 00002E07 B80400                   mov ax, 4
  6160 00002E0A 8946FA                   mov [bp-6], ax
  6161 00002E0D E80DDC                   call searchname
  6162 00002E10 8946F8                   mov [bp-8], ax
  6163                                  
  6164                                  ;-582           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }
  6165                                  
  6166 00002E13 B8B782                   mov ax, GType
  6167 00002E16 A3[6C00]                 mov word [p1], ax
  6168 00002E19 A1[6C00]                 mov ax, [p1]
  6169 00002E1C 0346F8                   add ax, [bp-8]
  6170 00002E1F A3[6C00]                 mov word [p1], ax
  6171 00002E22 8B1E[6C00]               mov bx, [p1]
  6172 00002E26 8A07                     mov al, [bx]
  6173 00002E28 B400                     mov ah, 0
  6174 00002E2A 83F826                   cmp ax, 38
  6175 00002E2D 0F850600                 jne @@docall1331
  6176 00002E31 B80300                   mov ax, 3
  6177 00002E34 8946FA                   mov [bp-6], ax
  6178                                  @@docall1331:
  6179                                  @@docall1330:
  6180                                  
  6181                                  ;-583       if (t0==0) error1("parameter not recognized (no * allowed)");
  6182                                  
  6183                                  @@docall1328:
  6184 00002E37 8B46FA                   mov ax, [bp-6]
  6185 00002E3A 83F800                   cmp ax, 0
  6186 00002E3D 0F850900                 jne @@docall1332
  6187 00002E41 68[F32F]                 push docall1_4
  6188 00002E44 E8751A                   call error1
  6189 00002E47 83C402                   add  sp, 2
  6190                                  
  6191                                  ;-584       docalltype [narg] = t0;
  6192                                  
  6193                                  @@docall1332:
  6194 00002E4A 8B46FA                   mov ax, [bp-6]
  6195 00002E4D 8B5EFC                   mov bx, [bp-4]
  6196 00002E50 D1E3                     shl bx, 1
  6197 00002E52 8987A3D0                 mov [docalltype+bx], ax
  6198                                  
  6199                                  ;-585       docallvalue[narg] = n0;
  6200                                  
  6201 00002E56 8B46F8                   mov ax, [bp-8]
  6202 00002E59 8B5EFC                   mov bx, [bp-4]
  6203 00002E5C D1E3                     shl bx, 1
  6204 00002E5E 8987B7D0                 mov [docallvalue+bx], ax
  6205                                  
  6206                                  ;-586     } while (istoken(','));
  6207                                  
  6208 00002E62 6A2C                     push 44
  6209 00002E64 E83716                   call istoken
  6210 00002E67 83C402                   add  sp, 2
  6211 00002E6A 08C0                     or  al, al
  6212 00002E6C 0F840300                 je @@docall1333
  6213 00002E70 E9A7FE                   jmp @@docall1323
  6214                                  @@docall1333:
  6215                                  
  6216                                  ;-587     
  6217                                  
  6218                                  
  6219                                  ;-588   	expect(')');  i=narg;
  6220                                  
  6221 00002E73 6A29                     push 41
  6222 00002E75 E84816                   call expect
  6223 00002E78 83C402                   add  sp, 2
  6224 00002E7B 8B46FC                   mov ax, [bp-4]
  6225 00002E7E 8946FE                   mov [bp-2], ax
  6226                                  
  6227                                  ;-589     do {
  6228                                  
  6229                                  @@docall1334:
  6230                                  
  6231                                  ;-590       t0 = docalltype [i];
  6232                                  
  6233 00002E81 8B5EFE                   mov bx, [bp-2]
  6234 00002E84 D1E3                     shl bx, 1
  6235 00002E86 8B87A3D0                 mov ax, [docalltype + bx]
  6236 00002E8A 8946FA                   mov [bp-6], ax
  6237                                  
  6238                                  ;-591       n0 = docallvalue[i];     
  6239                                  
  6240 00002E8D 8B5EFE                   mov bx, [bp-2]
  6241 00002E90 D1E3                     shl bx, 1
  6242 00002E92 8B87B7D0                 mov ax, [docallvalue + bx]
  6243 00002E96 8946F8                   mov [bp-8], ax
  6244                                  
  6245                                  ;-592       if(t0==1){ prs("\n push "); pint1(n0);}
  6246                                  
  6247 00002E99 8B46FA                   mov ax, [bp-6]
  6248 00002E9C 83F801                   cmp ax, 1
  6249 00002E9F 0F851200                 jne @@docall1335
  6250 00002EA3 68[1B30]                 push docall1_5
  6251 00002EA6 E82A17                   call prs
  6252 00002EA9 83C402                   add  sp, 2
  6253 00002EAC FF76F8                   push word [bp-8]
  6254 00002EAF E81818                   call pint1
  6255 00002EB2 83C402                   add  sp, 2
  6256                                  
  6257                                  ;-593       if(t0==2){ prs("\n push "); 
  6258                                  
  6259                                  @@docall1335:
  6260 00002EB5 8B46FA                   mov ax, [bp-6]
  6261 00002EB8 83F802                   cmp ax, 2
  6262 00002EBB 0F852500                 jne @@docall1336
  6263 00002EBF 68[2430]                 push docall1_6
  6264 00002EC2 E80E17                   call prs
  6265 00002EC5 83C402                   add  sp, 2
  6266                                  
  6267                                  ;-594         prs(fname);prc(95);pint1(n0);}
  6268                                  
  6269 00002EC8 8D06AB81                 lea  ax, [fname]
  6270 00002ECC 50                       push ax
  6271 00002ECD E80317                   call prs
  6272 00002ED0 83C402                   add  sp, 2
  6273 00002ED3 6A5F                     push 95
  6274 00002ED5 E89416                   call prc
  6275 00002ED8 83C402                   add  sp, 2
  6276 00002EDB FF76F8                   push word [bp-8]
  6277 00002EDE E8E917                   call pint1
  6278 00002EE1 83C402                   add  sp, 2
  6279                                  
  6280                                  ;-595       if(t0==3){ prs("\n lea  ax, ");   v(n0);
  6281                                  
  6282                                  @@docall1336:
  6283 00002EE4 8B46FA                   mov ax, [bp-6]
  6284 00002EE7 83F803                   cmp ax, 3
  6285 00002EEA 0F851B00                 jne @@docall1337
  6286 00002EEE 68[2D30]                 push docall1_7
  6287 00002EF1 E8DF16                   call prs
  6288 00002EF4 83C402                   add  sp, 2
  6289 00002EF7 FF76F8                   push word [bp-8]
  6290 00002EFA E834D5                   call v
  6291 00002EFD 83C402                   add  sp, 2
  6292                                  
  6293                                  ;-596         prs("\n push ax");}
  6294                                  
  6295 00002F00 68[3A30]                 push docall1_8
  6296 00002F03 E8CD16                   call prs
  6297 00002F06 83C402                   add  sp, 2
  6298                                  
  6299                                  ;-597       if(t0==4){ gettypes(n0); 
  6300                                  
  6301                                  @@docall1337:
  6302 00002F09 8B46FA                   mov ax, [bp-6]
  6303 00002F0C 83F804                   cmp ax, 4
  6304 00002F0F 0F854300                 jne @@docall1338
  6305 00002F13 FF76F8                   push word [bp-8]
  6306 00002F16 E8C6D9                   call gettypes
  6307 00002F19 83C402                   add  sp, 2
  6308                                  
  6309                                  ;-598         if(wi==2) { prs("\n push word "); v(n0);}
  6310                                  
  6311 00002F1C A1[3900]                 mov ax, [wi]
  6312 00002F1F 83F802                   cmp ax, 2
  6313 00002F22 0F851500                 jne @@docall1339
  6314 00002F26 68[4530]                 push docall1_9
  6315 00002F29 E8A716                   call prs
  6316 00002F2C 83C402                   add  sp, 2
  6317 00002F2F FF76F8                   push word [bp-8]
  6318 00002F32 E8FCD4                   call v
  6319 00002F35 83C402                   add  sp, 2
  6320                                  
  6321                                  ;-599         else { prs("\n mov al, byte ");   v(n0);
  6322                                  
  6323 00002F38 E91B00                   jmp @@docall1340
  6324                                  @@docall1339:
  6325 00002F3B 68[5330]                 push docall1_10
  6326 00002F3E E89216                   call prs
  6327 00002F41 83C402                   add  sp, 2
  6328 00002F44 FF76F8                   push word [bp-8]
  6329 00002F47 E8E7D4                   call v
  6330 00002F4A 83C402                   add  sp, 2
  6331                                  
  6332                                  ;-600         prs("\n mov ah, 0\n push ax"); } }
  6333                                  
  6334 00002F4D 68[6430]                 push docall1_11
  6335 00002F50 E88016                   call prs
  6336 00002F53 83C402                   add  sp, 2
  6337                                  @@docall1340:
  6338                                  
  6339                                  ;-601       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }
  6340                                  
  6341                                  @@docall1338:
  6342 00002F56 8B46FA                   mov ax, [bp-6]
  6343 00002F59 83F805                   cmp ax, 5
  6344 00002F5C 0F852200                 jne @@docall1341
  6345 00002F60 68[7B30]                 push docall1_12
  6346 00002F63 E86D16                   call prs
  6347 00002F66 83C402                   add  sp, 2
  6348 00002F69 FF76F8                   push word [bp-8]
  6349 00002F6C E870ED                   call printreg
  6350 00002F6F 83C402                   add  sp, 2
  6351 00002F72 8B46F8                   mov ax, [bp-8]
  6352 00002F75 83F82F                   cmp ax, 47 ;unsigned : 1
  6353 00002F78 0F8C0600                 jl  @@docall1342
  6354 00002F7C 8B46F6                   mov ax, [bp-10]
  6355 00002F7F 83C002                   add ax, 2
  6356                                  @@docall1342:
  6357                                  
  6358                                  ;-602    i--; } while (i > 0);  }
  6359                                  
  6360                                  @@docall1341:
  6361 00002F82 FF4EFE                   dec  word[bp-2]
  6362 00002F85 8B46FE                   mov ax, [bp-2]
  6363 00002F88 83F800                   cmp ax, 0
  6364 00002F8B 0F8E0300                 jle @@docall1343
  6365 00002F8F E9EFFE                   jmp @@docall1334
  6366                                  @@docall1343:
  6367                                  
  6368                                  ;-603 	 prs("\n call "); prs(&procname);
  6369                                  
  6370                                  @@docall1322:
  6371 00002F92 68[8430]                 push docall1_13
  6372 00002F95 E83B16                   call prs
  6373 00002F98 83C402                   add  sp, 2
  6374 00002F9B 8D06CBD0                 lea  ax, [procname]
  6375 00002F9F 50                       push ax
  6376 00002FA0 E83016                   call prs
  6377 00002FA3 83C402                   add  sp, 2
  6378                                  
  6379                                  ;-604 	 if (narg>0) {prs("\n add  sp, ");
  6380                                  
  6381 00002FA6 8B46FC                   mov ax, [bp-4]
  6382 00002FA9 83F800                   cmp ax, 0
  6383 00002FAC 0F8E2400                 jle @@docall1344
  6384 00002FB0 68[8D30]                 push docall1_14
  6385 00002FB3 E81D16                   call prs
  6386 00002FB6 83C402                   add  sp, 2
  6387                                  
  6388                                  ;-605      narg=narg+narg; narg=narg+sz32; pint1(narg); } }
  6389                                  
  6390 00002FB9 8B46FC                   mov ax, [bp-4]
  6391 00002FBC 0346FC                   add ax, [bp-4]
  6392 00002FBF 8946FC                   mov [bp-4], ax
  6393 00002FC2 8B46FC                   mov ax, [bp-4]
  6394 00002FC5 0346F6                   add ax, [bp-10]
  6395 00002FC8 8946FC                   mov [bp-4], ax
  6396 00002FCB FF76FC                   push word [bp-4]
  6397 00002FCE E8F916                   call pint1
  6398 00002FD1 83C402                   add  sp, 2
  6399                                  @@docall1344:
  6400                                  
  6401                                  ;-606 /****************************************************************************/
  6402                                  
  6403                                  
  6404                                  ;-607 int main() {
  6405 00002FD4 C9                       LEAVE
  6406 00002FD5 C3                       ret
  6407                                  ; ENDP
  6408 00002FD6 4D61782E2039207061-     docall1_0 db "Max. 9 parameters",0
  6409 00002FDF 72616D657465727300 
  6410 00002FE8 5C6E00                  docall1_1 db "\n",0
  6411 00002FEB 2064622000              docall1_2 db " db ",0
  6412 00002FF0 2C3000                  docall1_3 db ",0",0
  6413 00002FF3 706172616D65746572-     docall1_4 db "parameter not recognized (no * allowed)",0
  6414 00002FFC 206E6F74207265636F-
  6415 00003005 676E697A656420286E-
  6416 0000300E 6F202A20616C6C6F77-
  6417 00003017 65642900           
  6418 0000301B 5C6E20707573682000      docall1_5 db "\n push ",0
  6419 00003024 5C6E20707573682000      docall1_6 db "\n push ",0
  6420 0000302D 5C6E206C6561202061-     docall1_7 db "\n lea  ax, ",0
  6421 00003036 782C2000           
  6422 0000303A 5C6E20707573682061-     docall1_8 db "\n push ax",0
  6423 00003043 7800               
  6424 00003045 5C6E20707573682077-     docall1_9 db "\n push word ",0
  6425 0000304E 6F72642000         
  6426 00003053 5C6E206D6F7620616C-     docall1_10 db "\n mov al, byte ",0
  6427 0000305C 2C20627974652000   
  6428 00003064 5C6E206D6F76206168-     docall1_11 db "\n mov ah, 0\n push ax",0
  6429 0000306D 2C20305C6E20707573-
  6430 00003076 6820617800         
  6431 0000307B 5C6E20707573682000      docall1_12 db "\n push ",0
  6432 00003084 5C6E2063616C6C2000      docall1_13 db "\n call ",0
  6433 0000308D 5C6E20616464202073-     docall1_14 db "\n add  sp, ",0
  6434 00003096 702C2000           
  6435                                  
  6436                                  main:  ; *** PROC ***
  6437                                  
  6438                                  ;-608   getarg();
  6439                                  
  6440 0000309A E88700                   call getarg
  6441                                  
  6442                                  ;-609   setblock(4096);
  6443                                  
  6444 0000309D 680010                   push 4096
  6445 000030A0 E80E23                   call setblock
  6446 000030A3 83C402                   add  sp, 2
  6447                                  
  6448                                  ;-610   if (DOS_ERR) error1("SetBlock , AX=");
  6449                                  
  6450 000030A6 A1[6E00]                 mov ax, [DOS_ERR]
  6451 000030A9 08C0                     or  al, al
  6452 000030AB 0F840900                 je @@main345
  6453 000030AF 68[E930]                 push main_0
  6454 000030B2 E80718                   call error1
  6455 000030B5 83C402                   add  sp, 2
  6456                                  
  6457                                  ;-611   segE=allocmem(4096);
  6458                                  
  6459                                  @@main345:
  6460 000030B8 680010                   push 4096
  6461 000030BB E80C23                   call allocmem
  6462 000030BE 83C402                   add  sp, 2
  6463 000030C1 A3[6400]                 mov word [segE], ax
  6464                                  
  6465                                  ;-612   if (DOS_ERR)  error1("alloc memory, AX=");
  6466                                  
  6467 000030C4 A1[6E00]                 mov ax, [DOS_ERR]
  6468 000030C7 08C0                     or  al, al
  6469 000030C9 0F840900                 je @@main346
  6470 000030CD 68[F830]                 push main_1
  6471 000030D0 E8E917                   call error1
  6472 000030D3 83C402                   add  sp, 2
  6473                                  
  6474                                  ;-613   CNameTop=0;
  6475                                  
  6476                                  @@main346:
  6477 000030D6 B80000                   mov ax, 0
  6478 000030D9 A3[6000]                 mov word [CNameTop], ax
  6479                                  
  6480                                  ;-614   getfirstchar();
  6481                                  
  6482 000030DC E82B00                   call getfirstchar
  6483                                  
  6484                                  ;-615   parse();
  6485                                  
  6486 000030DF E88D02                   call parse
  6487                                  
  6488                                  ;-616   checkcalls(); epilog();
  6489                                  
  6490 000030E2 E82103                   call checkcalls
  6491 000030E5 E8AF1E                   call epilog
  6492                                  
  6493                                  ;-617 }
  6494                                  
  6495                                  
  6496                                  ;-618 int getfirstchar() { fgetsp=&fgetsdest; *fgetsp=0; thechar=fgets1(); }
  6497                                  
  6498 000030E8 C3                       ret
  6499                                  ; ENDP
  6500 000030E9 536574426C6F636B20-     main_0 db "SetBlock , AX=",0
  6501 000030F2 2C2041583D00       
  6502 000030F8 616C6C6F63206D656D-     main_1 db "alloc memory, AX=",0
  6503 00003101 6F72792C2041583D00 
  6504                                  
  6505                                  getfirstchar:  ; *** PROC ***
  6506 0000310A B80FD0                   mov ax, fgetsdest
  6507 0000310D A3[6200]                 mov word [fgetsp], ax
  6508 00003110 B80000                   mov ax, 0
  6509 00003113 8B1E[6200]               mov  bx, [fgetsp]
  6510 00003117 8807                     mov  [bx], al
  6511 00003119 E8AA16                   call fgets1
  6512 0000311C A2[2100]                 mov byte [thechar], al
  6513                                  
  6514                                  ;-619 char *arglen=0x80; char *argv=0x82;
  6515                                  
  6516 0000311F C3                       ret
  6517                                  ; ENDP
  6518 00003120 8000                    arglen dw 128
  6519 00003122 8200                    argv dw 130
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
  6533 00003124 C8060000                 ENTER  6,0
  6534 00003128 8B1E[2031]               mov bx, [arglen]
  6535 0000312C 8A07                     mov al, [bx]
  6536 0000312E B400                     mov ah, 0
  6537 00003130 8946FE                   mov [bp-2], ax
  6538                                  
  6539                                  ;-622   if (arglen1) { i=arglen1+129; *i=0; }
  6540                                  
  6541 00003133 8B46FE                   mov ax, [bp-2]
  6542 00003136 08C0                     or  al, al
  6543 00003138 0F841400                 je @@getarg347
  6544 0000313C 8B46FE                   mov ax, [bp-2]
  6545 0000313F 058100                   add ax, 129
  6546 00003142 8946FC                   mov [bp-4], ax
  6547 00003145 B80000                   mov ax, 0
  6548 00003148 8B5EFC                   mov  bx, [bp-4]
  6549 0000314B 8907                     mov  [bx], ax
  6550                                  
  6551                                  ;-623   else { cputs(Version1); cputs(" Usage: A.COM in_file[.C]: ");
  6552                                  
  6553 0000314D E93900                   jmp @@getarg348
  6554                                  @@getarg347:
  6555 00003150 8D06[0300]               lea  ax, [Version1]
  6556 00003154 50                       push ax
  6557 00003155 E83CCF                   call cputs
  6558 00003158 83C402                   add  sp, 2
  6559 0000315B 68[D232]                 push getarg_0
  6560 0000315E E833CF                   call cputs
  6561 00003161 83C402                   add  sp, 2
  6562                                  
  6563                                  ;-624     DOS_NoBytes=readRL(argv, 0, CMDLENMAX); c=DOS_NoBytes+128; *c=0; prnl(); }
  6564                                  
  6565 00003164 6A43                     push 67
  6566 00003166 6A00                     push 0
  6567 00003168 FF36[2231]               push word [argv]
  6568 0000316C E8BACF                   call readRL
  6569 0000316F 83C406                   add  sp, 6
  6570 00003172 A3[7000]                 mov word [DOS_NoBytes], ax
  6571 00003175 A1[7000]                 mov ax, [DOS_NoBytes]
  6572 00003178 058000                   add ax, 128
  6573 0000317B 8946FA                   mov [bp-6], ax
  6574 0000317E B80000                   mov ax, 0
  6575 00003181 8B5EFA                   mov  bx, [bp-6]
  6576 00003184 8807                     mov  [bx], al
  6577 00003186 E83C14                   call prnl
  6578                                  
  6579                                  ;-625   strcpy(namein, argv);
  6580                                  
  6581                                  @@getarg348:
  6582 00003189 FF36[2231]               push word [argv]
  6583 0000318D 8D06EE81                 lea  ax, [namein]
  6584 00003191 50                       push ax
  6585 00003192 E8E6CF                   call strcpy
  6586 00003195 83C404                   add  sp, 4
  6587                                  
  6588                                  ;-626   if (instr2(namein, '.') == 0) strcat1(namein, ".C");
  6589                                  
  6590 00003198 6A2E                     push 46
  6591 0000319A 8D06EE81                 lea  ax, [namein]
  6592 0000319E 50                       push ax
  6593 0000319F E887D0                   call instr2
  6594 000031A2 83C404                   add  sp, 4
  6595 000031A5 83F800                   cmp ax, 0
  6596 000031A8 0F850E00                 jne @@getarg349
  6597 000031AC 68[EE32]                 push getarg_1
  6598 000031AF 8D06EE81                 lea  ax, [namein]
  6599 000031B3 50                       push ax
  6600 000031B4 E8A4D0                   call strcat1
  6601 000031B7 83C404                   add  sp, 4
  6602                                  
  6603                                  ;-627   toupper(namein);
  6604                                  
  6605                                  @@getarg349:
  6606 000031BA 8D06EE81                 lea  ax, [namein]
  6607 000031BE 50                       push ax
  6608 000031BF E8BED0                   call toupper
  6609 000031C2 83C402                   add  sp, 2
  6610                                  
  6611                                  ;-628   strcpy(namelst, namein); i=strlen(namelst); i--; c=&namelst+i; *c='S';
  6612                                  
  6613 000031C5 8D06EE81                 lea  ax, [namein]
  6614 000031C9 50                       push ax
  6615 000031CA 8D063182                 lea  ax, [namelst]
  6616 000031CE 50                       push ax
  6617 000031CF E8A9CF                   call strcpy
  6618 000031D2 83C404                   add  sp, 4
  6619 000031D5 8D063182                 lea  ax, [namelst]
  6620 000031D9 50                       push ax
  6621 000031DA E876CF                   call strlen
  6622 000031DD 83C402                   add  sp, 2
  6623 000031E0 8946FC                   mov [bp-4], ax
  6624 000031E3 FF4EFC                   dec  word[bp-4]
  6625 000031E6 B83182                   mov ax, namelst
  6626 000031E9 0346FC                   add ax, [bp-4]
  6627 000031EC 8946FA                   mov [bp-6], ax
  6628 000031EF B85300                   mov ax, 83
  6629 000031F2 8B5EFA                   mov  bx, [bp-6]
  6630 000031F5 8807                     mov  [bx], al
  6631                                  
  6632                                  ;-629  
  6633                                  
  6634                                  
  6635                                  ;-630   fdin=openR (namein);
  6636                                  
  6637 000031F7 8D06EE81                 lea  ax, [namein]
  6638 000031FB 50                       push ax
  6639 000031FC E8D7CE                   call openR
  6640 000031FF 83C402                   add  sp, 2
  6641 00003202 A3[1800]                 mov word [fdin], ax
  6642                                  
  6643                                  ;-631   if(DOS_ERR){cputs("Source file missing (.C): "); cputs(namein); exitR(1); }
  6644                                  
  6645 00003205 A1[6E00]                 mov ax, [DOS_ERR]
  6646 00003208 08C0                     or  al, al
  6647 0000320A 0F841C00                 je @@getarg350
  6648 0000320E 68[F132]                 push getarg_2
  6649 00003211 E880CE                   call cputs
  6650 00003214 83C402                   add  sp, 2
  6651 00003217 8D06EE81                 lea  ax, [namein]
  6652 0000321B 50                       push ax
  6653 0000321C E875CE                   call cputs
  6654 0000321F 83C402                   add  sp, 2
  6655 00003222 6A01                     push 1
  6656 00003224 E8DFCE                   call exitR
  6657 00003227 83C402                   add  sp, 2
  6658                                  
  6659                                  ;-632   fdout=creatR(namelst);
  6660                                  
  6661                                  @@getarg350:
  6662 0000322A 8D063182                 lea  ax, [namelst]
  6663 0000322E 50                       push ax
  6664 0000322F E8B3CE                   call creatR
  6665 00003232 83C402                   add  sp, 2
  6666 00003235 A3[1A00]                 mov word [fdout], ax
  6667                                  
  6668                                  ;-633   if(DOS_ERR){cputs("list file not creatable: ");cputs(namelst);exitR(2);}
  6669                                  
  6670 00003238 A1[6E00]                 mov ax, [DOS_ERR]
  6671 0000323B 08C0                     or  al, al
  6672 0000323D 0F841C00                 je @@getarg351
  6673 00003241 68[0C33]                 push getarg_3
  6674 00003244 E84DCE                   call cputs
  6675 00003247 83C402                   add  sp, 2
  6676 0000324A 8D063182                 lea  ax, [namelst]
  6677 0000324E 50                       push ax
  6678 0000324F E842CE                   call cputs
  6679 00003252 83C402                   add  sp, 2
  6680 00003255 6A02                     push 2
  6681 00003257 E8ACCE                   call exitR
  6682 0000325A 83C402                   add  sp, 2
  6683                                  
  6684                                  ;-634   prs("\n; ");prs(Version1);
  6685                                  
  6686                                  @@getarg351:
  6687 0000325D 68[2633]                 push getarg_4
  6688 00003260 E87013                   call prs
  6689 00003263 83C402                   add  sp, 2
  6690 00003266 8D06[0300]               lea  ax, [Version1]
  6691 0000326A 50                       push ax
  6692 0000326B E86513                   call prs
  6693 0000326E 83C402                   add  sp, 2
  6694                                  
  6695                                  ;-635   prs(", Arglen: "); pint1(arglen1); if(arglen1){prs(", Argv: "); prs(argv);}
  6696                                  
  6697 00003271 68[2B33]                 push getarg_5
  6698 00003274 E85C13                   call prs
  6699 00003277 83C402                   add  sp, 2
  6700 0000327A FF76FE                   push word [bp-2]
  6701 0000327D E84A14                   call pint1
  6702 00003280 83C402                   add  sp, 2
  6703 00003283 8B46FE                   mov ax, [bp-2]
  6704 00003286 08C0                     or  al, al
  6705 00003288 0F841300                 je @@getarg352
  6706 0000328C 68[3633]                 push getarg_6
  6707 0000328F E84113                   call prs
  6708 00003292 83C402                   add  sp, 2
  6709 00003295 FF36[2231]               push word [argv]
  6710 00003299 E83713                   call prs
  6711 0000329C 83C402                   add  sp, 2
  6712                                  
  6713                                  ;-636   prs(", Source: "); prs(namein);  prs(", Output asm: "); prs(namelst);
  6714                                  
  6715                                  @@getarg352:
  6716 0000329F 68[3F33]                 push getarg_7
  6717 000032A2 E82E13                   call prs
  6718 000032A5 83C402                   add  sp, 2
  6719 000032A8 8D06EE81                 lea  ax, [namein]
  6720 000032AC 50                       push ax
  6721 000032AD E82313                   call prs
  6722 000032B0 83C402                   add  sp, 2
  6723 000032B3 68[4A33]                 push getarg_8
  6724 000032B6 E81A13                   call prs
  6725 000032B9 83C402                   add  sp, 2
  6726 000032BC 8D063182                 lea  ax, [namelst]
  6727 000032C0 50                       push ax
  6728 000032C1 E80F13                   call prs
  6729 000032C4 83C402                   add  sp, 2
  6730                                  
  6731                                  ;-637   prs("\norg  256 \njmp main"); 
  6732                                  
  6733 000032C7 68[5933]                 push getarg_9
  6734 000032CA E80613                   call prs
  6735 000032CD 83C402                   add  sp, 2
  6736                                  
  6737                                  ;-638 }
  6738                                  
  6739                                  
  6740                                  ;-639 int parse() { token=getlex(); do {
  6741 000032D0 C9                       LEAVE
  6742 000032D1 C3                       ret
  6743                                  ; ENDP
  6744 000032D2 2055736167653A2041-     getarg_0 db " Usage: A.COM in_file[.C]: ",0
  6745 000032DB 2E434F4D20696E5F66-
  6746 000032E4 696C655B2E435D3A20-
  6747 000032ED 00                 
  6748 000032EE 2E4300                  getarg_1 db ".C",0
  6749 000032F1 536F75726365206669-     getarg_2 db "Source file missing (.C): ",0
  6750 000032FA 6C65206D697373696E-
  6751 00003303 6720282E43293A2000 
  6752 0000330C 6C6973742066696C65-     getarg_3 db "list file not creatable: ",0
  6753 00003315 206E6F742063726561-
  6754 0000331E 7461626C653A2000   
  6755 00003326 5C6E3B2000              getarg_4 db "\n; ",0
  6756 0000332B 2C204172676C656E3A-     getarg_5 db ", Arglen: ",0
  6757 00003334 2000               
  6758 00003336 2C20417267763A2000      getarg_6 db ", Argv: ",0
  6759 0000333F 2C20536F757263653A-     getarg_7 db ", Source: ",0
  6760 00003348 2000               
  6761 0000334A 2C204F757470757420-     getarg_8 db ", Output asm: ",0
  6762 00003353 61736D3A2000       
  6763 00003359 5C6E6F726720203235-     getarg_9 db "\norg  256 \njmp main",0
  6764 00003362 36205C6E6A6D70206D-
  6765 0000336B 61696E00           
  6766                                  
  6767                                  parse:  ; *** PROC ***
  6768 0000336F E8080A                   call getlex
  6769 00003372 A3[1C00]                 mov word [token], ax
  6770                                  @@parse353:
  6771                                  
  6772                                  ;-640     if (token <= 0) return 1;
  6773                                  
  6774 00003375 A1[1C00]                 mov ax, [token]
  6775 00003378 83F800                   cmp ax, 0
  6776 0000337B 0F8F0600                 jg  @@parse354
  6777 0000337F B80100                   mov ax, 1
  6778 00003382 E96500                   jmp @@retn
  6779                                  
  6780                                  ;-641     if (istoken('#')) {
  6781                                  
  6782                                  @@parse354:
  6783 00003385 6A23                     push 35
  6784 00003387 E81411                   call istoken
  6785 0000338A 83C402                   add  sp, 2
  6786 0000338D 08C0                     or  al, al
  6787 0000338F 0F843600                 je @@parse355
  6788                                  
  6789                                  ;-642       if (istoken(T_DEFINE)) dodefine();
  6790                                  
  6791 00003393 68FF01                   push 511
  6792 00003396 E80511                   call istoken
  6793 00003399 83C402                   add  sp, 2
  6794 0000339C 08C0                     or  al, al
  6795 0000339E 0F840600                 je @@parse356
  6796 000033A2 E8A702                   call dodefine
  6797                                  
  6798                                  ;-643       else if (istoken(T_INCLUDE)) doinclude();
  6799                                  
  6800 000033A5 E91E00                   jmp @@parse357
  6801                                  @@parse356:
  6802 000033A8 68FE01                   push 510
  6803 000033AB E8F010                   call istoken
  6804 000033AE 83C402                   add  sp, 2
  6805 000033B1 08C0                     or  al, al
  6806 000033B3 0F840600                 je @@parse358
  6807 000033B7 E8AC01                   call doinclude
  6808                                  
  6809                                  ;-644       else error1("define or include expected");  }
  6810                                  
  6811 000033BA E90900                   jmp @@parse359
  6812                                  @@parse358:
  6813 000033BD 68[EB33]                 push parse_0
  6814 000033C0 E8F914                   call error1
  6815 000033C3 83C402                   add  sp, 2
  6816                                  @@parse359:
  6817                                  @@parse357:
  6818                                  
  6819                                  ;-645     else{ typeName();  if (token=='(') dofunc();  else doglob(); }
  6820                                  
  6821 000033C6 E91600                   jmp @@parse360
  6822                                  @@parse355:
  6823 000033C9 E820D7                   call typeName
  6824 000033CC A1[1C00]                 mov ax, [token]
  6825 000033CF 83F828                   cmp ax, 40
  6826 000033D2 0F850600                 jne @@parse361
  6827 000033D6 E827DA                   call dofunc
  6828 000033D9 E90300                   jmp @@parse362
  6829                                  @@parse361:
  6830 000033DC E8D1D0                   call doglob
  6831                                  @@parse362:
  6832                                  
  6833                                  ;-646   } while(1);
  6834                                  
  6835                                  @@parse360:
  6836 000033DF B80100                   mov ax, 1
  6837 000033E2 08C0                     or  al, al
  6838 000033E4 0F840200                 je @@parse363
  6839 000033E8 EB8B                     jmp @@parse353
  6840                                  @@parse363:
  6841                                  
  6842                                  ;-647 }
  6843                                  
  6844                                  
  6845                                  ;-648 int checkcalls() { int i; int j; int k;
  6846                                  
  6847                                  @@retn:
  6848 000033EA C3                       ret
  6849                                  ; ENDP
  6850 000033EB 646566696E65206F72-     parse_0 db "define or include expected",0
  6851 000033F4 20696E636C75646520-
  6852 000033FD 657870656374656400 
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
  6863 00003406 C8060000                 ENTER  6,0
  6864 0000340A 68[EC34]                 push checkcalls_0
  6865 0000340D E8C311                   call prs
  6866 00003410 83C402                   add  sp, 2
  6867                                  
  6868                                  ;-650   i=0;  k=0;
  6869                                  
  6870 00003413 B80000                   mov ax, 0
  6871 00003416 8946FE                   mov [bp-2], ax
  6872 00003419 B80000                   mov ax, 0
  6873 0000341C 8946FA                   mov [bp-6], ax
  6874                                  
  6875                                  ;-651   while (i < CTop) {
  6876                                  
  6877                                  @@checkcalls364:
  6878 0000341F 8B46FE                   mov ax, [bp-2]
  6879 00003422 3B06[3D00]               cmp ax, [CTop]
  6880 00003426 0F8D8F00                 jge @@checkcalls365
  6881                                  
  6882                                  ;-652     pt=CAdr[i];
  6883                                  
  6884 0000342A 8B5EFE                   mov bx, [bp-2]
  6885 0000342D D1E3                     shl bx, 1
  6886 0000342F 8B8757AB                 mov ax, [CAdr + bx]
  6887 00003433 A3[6A00]                 mov word [pt], ax
  6888                                  
  6889                                  ;-653     from_far(NameA, pt);
  6890                                  
  6891 00003436 FF36[6A00]               push word [pt]
  6892 0000343A 8D06[3F00]               lea  ax, [NameA]
  6893 0000343E 50                       push ax
  6894 0000343F E8EF1F                   call from_far
  6895 00003442 83C404                   add  sp, 4
  6896                                  
  6897                                  ;-654     j=0;
  6898                                  
  6899 00003445 B80000                   mov ax, 0
  6900 00003448 8946FC                   mov [bp-4], ax
  6901                                  
  6902                                  ;-655     do { p1=adrF(FNameField, j);
  6903                                  
  6904                                  @@checkcalls366:
  6905 0000344B FF76FC                   push word [bp-4]
  6906 0000344E 8D064FBD                 lea  ax, [FNameField]
  6907 00003452 50                       push ax
  6908 00003453 E854D5                   call adrF
  6909 00003456 83C404                   add  sp, 4
  6910 00003459 A3[6C00]                 mov word [p1], ax
  6911                                  
  6912                                  ;-656       if (eqstr(NameA, p1)){ CType[i]=1; j=FTop; }
  6913                                  
  6914 0000345C FF36[6C00]               push word [p1]
  6915 00003460 8D06[3F00]               lea  ax, [NameA]
  6916 00003464 50                       push ax
  6917 00003465 E843CD                   call eqstr
  6918 00003468 83C404                   add  sp, 4
  6919 0000346B 08C0                     or  al, al
  6920 0000346D 0F841000                 je @@checkcalls367
  6921 00003471 B80100                   mov ax, 1
  6922 00003474 8B5EFE                   mov bx, [bp-2]
  6923 00003477 88872FA1                 mov [CType+bx], al
  6924 0000347B A1[3B00]                 mov ax, [FTop]
  6925 0000347E 8946FC                   mov [bp-4], ax
  6926                                  
  6927                                  ;-657       j++; } while (j < FTop);
  6928                                  
  6929                                  @@checkcalls367:
  6930 00003481 FF46FC                   inc  word[bp-4]
  6931 00003484 8B46FC                   mov ax, [bp-4]
  6932 00003487 3B06[3B00]               cmp ax, [FTop]
  6933 0000348B 0F8D0200                 jge @@checkcalls368
  6934 0000348F EBBA                     jmp @@checkcalls366
  6935                                  @@checkcalls368:
  6936                                  
  6937                                  ;-658     if (j == FTop) { k++; prs("\n; "); prs(NameA); }
  6938                                  
  6939 00003491 8B46FC                   mov ax, [bp-4]
  6940 00003494 3B06[3B00]               cmp ax, [FTop]
  6941 00003498 0F851700                 jne @@checkcalls369
  6942 0000349C FF46FA                   inc  word[bp-6]
  6943 0000349F 68[0735]                 push checkcalls_1
  6944 000034A2 E82E11                   call prs
  6945 000034A5 83C402                   add  sp, 2
  6946 000034A8 8D06[3F00]               lea  ax, [NameA]
  6947 000034AC 50                       push ax
  6948 000034AD E82311                   call prs
  6949 000034B0 83C402                   add  sp, 2
  6950                                  
  6951                                  ;-659     i++; }
  6952                                  
  6953                                  @@checkcalls369:
  6954 000034B3 FF46FE                   inc  word[bp-2]
  6955                                  
  6956                                  ;-660   prs("\n; Number of unresolved CALLs :"); printint51(k);
  6957                                  
  6958 000034B6 E966FF                   jmp @@checkcalls364
  6959                                  @@checkcalls365:
  6960 000034B9 68[0C35]                 push checkcalls_2
  6961 000034BC E81411                   call prs
  6962 000034BF 83C402                   add  sp, 2
  6963 000034C2 FF76FA                   push word [bp-6]
  6964 000034C5 E8A712                   call printint51
  6965 000034C8 83C402                   add  sp, 2
  6966                                  
  6967                                  ;-661   if (k!=0) error1("At least 1 function is missing! "); 
  6968                                  
  6969 000034CB 8B46FA                   mov ax, [bp-6]
  6970 000034CE 83F800                   cmp ax, 0
  6971 000034D1 0F840C00                 je  @@checkcalls370
  6972 000034D5 68[2D35]                 push checkcalls_3
  6973 000034D8 E8E113                   call error1
  6974 000034DB 83C402                   add  sp, 2
  6975                                  
  6976                                  ;-662     else prs(" All FUNCTIONs in place");
  6977                                  
  6978 000034DE E90900                   jmp @@checkcalls371
  6979                                  @@checkcalls370:
  6980 000034E1 68[4E35]                 push checkcalls_4
  6981 000034E4 E8EC10                   call prs
  6982 000034E7 83C402                   add  sp, 2
  6983                                  
  6984                                  ;-663 }
  6985                                  
  6986                                  @@checkcalls371:
  6987                                  
  6988                                  ;-664 
  6989                                  
  6990                                  
  6991                                  ;-665 int doinclude() { int fdtemp;
  6992 000034EA C9                       LEAVE
  6993 000034EB C3                       ret
  6994                                  ; ENDP
  6995 000034EC 5C6E205C6E3B206D69-     checkcalls_0 db "\n \n; missing functions: ",0
  6996 000034F5 7373696E672066756E-
  6997 000034FE 6374696F6E733A2000 
  6998 00003507 5C6E3B2000              checkcalls_1 db "\n; ",0
  6999 0000350C 5C6E3B204E756D6265-     checkcalls_2 db "\n; Number of unresolved CALLs :",0
  7000 00003515 72206F6620756E7265-
  7001 0000351E 736F6C766564204341-
  7002 00003527 4C4C73203A00       
  7003 0000352D 4174206C6561737420-     checkcalls_3 db "At least 1 function is missing! ",0
  7004 00003536 312066756E6374696F-
  7005 0000353F 6E206973206D697373-
  7006 00003548 696E67212000       
  7007 0000354E 20416C6C2046554E43-     checkcalls_4 db " All FUNCTIONs in place",0
  7008 00003557 54494F4E7320696E20-
  7009 00003560 706C61636500       
  7010                                  
  7011                                  doinclude:  ; *** PROC ***
  7012                                  
  7013                                  ;-666   if (token==T_STRING) {  fdtemp=fdin;
  7014                                  
  7015                                  ;Function : doinclude, Number of local variables: 1
  7016                                  ;   # type sign width addr used name   list of local variables
  7017                                  ;  200 var sign word   665 NULL fdtemp = bp-2;
  7018 00003566 C8020000                 ENTER  2,0
  7019 0000356A A1[1C00]                 mov ax, [token]
  7020 0000356D 3D0201                   cmp ax, 258
  7021 00003570 0F858700                 jne @@doinclude372
  7022 00003574 A1[1800]                 mov ax, [fdin]
  7023 00003577 8946FE                   mov [bp-2], ax
  7024                                  
  7025                                  ;-667   prs("\n;Use include file: "); prs(symbol);
  7026                                  
  7027 0000357A 68[FD35]                 push doinclude_0
  7028 0000357D E85310                   call prs
  7029 00003580 83C402                   add  sp, 2
  7030 00003583 8D062B81                 lea  ax, [symbol]
  7031 00003587 50                       push ax
  7032 00003588 E84810                   call prs
  7033 0000358B 83C402                   add  sp, 2
  7034                                  
  7035                                  ;-668   fdin=openR(symbol);
  7036                                  
  7037 0000358E 8D062B81                 lea  ax, [symbol]
  7038 00003592 50                       push ax
  7039 00003593 E840CB                   call openR
  7040 00003596 83C402                   add  sp, 2
  7041 00003599 A3[1800]                 mov word [fdin], ax
  7042                                  
  7043                                  ;-669   if (DOS_ERR !=0) {prs("Include file missing: "); prs(symbol);
  7044                                  
  7045 0000359C A1[6E00]                 mov ax, [DOS_ERR]
  7046 0000359F 83F800                   cmp ax, 0
  7047 000035A2 0F841D00                 je  @@doinclude373
  7048 000035A6 68[1336]                 push doinclude_1
  7049 000035A9 E82710                   call prs
  7050 000035AC 83C402                   add  sp, 2
  7051 000035AF 8D062B81                 lea  ax, [symbol]
  7052 000035B3 50                       push ax
  7053 000035B4 E81C10                   call prs
  7054 000035B7 83C402                   add  sp, 2
  7055                                  
  7056                                  ;-670     error1(" Stop!!"); }
  7057                                  
  7058 000035BA 68[2A36]                 push doinclude_2
  7059 000035BD E8FC12                   call error1
  7060 000035C0 83C402                   add  sp, 2
  7061                                  
  7062                                  ;-671   linenoinclude=lineno; lineno=1;
  7063                                  
  7064                                  @@doinclude373:
  7065 000035C3 A1[6600]                 mov ax, [lineno]
  7066 000035C6 A3[6800]                 mov word [linenoinclude], ax
  7067 000035C9 B80100                   mov ax, 1
  7068 000035CC A3[6600]                 mov word [lineno], ax
  7069                                  
  7070                                  ;-672   parse(); lineno=linenoinclude;
  7071                                  
  7072 000035CF E89DFD                   call parse
  7073 000035D2 A1[6800]                 mov ax, [linenoinclude]
  7074 000035D5 A3[6600]                 mov word [lineno], ax
  7075                                  
  7076                                  ;-673   fdin=fdtemp; prs("\n;Back to main program: "); prs(namein);
  7077                                  
  7078 000035D8 8B46FE                   mov ax, [bp-2]
  7079 000035DB A3[1800]                 mov word [fdin], ax
  7080 000035DE 68[3236]                 push doinclude_3
  7081 000035E1 E8EF0F                   call prs
  7082 000035E4 83C402                   add  sp, 2
  7083 000035E7 8D06EE81                 lea  ax, [namein]
  7084 000035EB 50                       push ax
  7085 000035EC E8E40F                   call prs
  7086 000035EF 83C402                   add  sp, 2
  7087                                  
  7088                                  ;-674   getfirstchar(); token=getlex(); }
  7089                                  
  7090 000035F2 E815FB                   call getfirstchar
  7091 000035F5 E88207                   call getlex
  7092 000035F8 A3[1C00]                 mov word [token], ax
  7093                                  
  7094                                  ;-675 }
  7095                                  
  7096                                  @@doinclude372:
  7097                                  
  7098                                  ;-676 int dodefine() { int i; int j; int fdtemp;
  7099 000035FB C9                       LEAVE
  7100 000035FC C3                       ret
  7101                                  ; ENDP
  7102 000035FD 5C6E3B55736520696E-     doinclude_0 db "\n;Use include file: ",0
  7103 00003606 636C7564652066696C-
  7104 0000360F 653A2000           
  7105 00003613 496E636C7564652066-     doinclude_1 db "Include file missing: ",0
  7106 0000361C 696C65206D69737369-
  7107 00003625 6E673A2000         
  7108 0000362A 2053746F70212100        doinclude_2 db " Stop!!",0
  7109 00003632 5C6E3B4261636B2074-     doinclude_3 db "\n;Back to main program: ",0
  7110 0000363B 6F206D61696E207072-
  7111 00003644 6F6772616D3A2000   
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
  7122 0000364C C8060000                 ENTER  6,0
  7123 00003650 68[9337]                 push dodefine_0
  7124 00003653 8D062B81                 lea  ax, [symbol]
  7125 00003657 50                       push ax
  7126 00003658 E850CB                   call eqstr
  7127 0000365B 83C404                   add  sp, 4
  7128 0000365E 08C0                     or  al, al
  7129 00003660 0F841500                 je @@dodefine374
  7130 00003664 E81307                   call getlex
  7131 00003667 A3[1C00]                 mov word [token], ax
  7132                                  
  7133                                  ;-678     ORGDATAORIG=lexval; orgData=lexval; return; }
  7134                                  
  7135 0000366A A1[2E00]                 mov ax, [lexval]
  7136 0000366D A3[0E00]                 mov word [ORGDATAORIG], ax
  7137 00003670 A1[2E00]                 mov ax, [lexval]
  7138 00003673 A3[1000]                 mov word [orgData], ax
  7139 00003676 E91801                   jmp @@retn
  7140                                  
  7141                                  ;-679   if (eqstr(symbol, "ARCHIVE")){token=getlex();  if (token==T_STRING) {
  7142                                  
  7143                                  @@dodefine374:
  7144 00003679 68[9B37]                 push dodefine_1
  7145 0000367C 8D062B81                 lea  ax, [symbol]
  7146 00003680 50                       push ax
  7147 00003681 E827CB                   call eqstr
  7148 00003684 83C404                   add  sp, 4
  7149 00003687 08C0                     or  al, al
  7150 00003689 0F844900                 je @@dodefine375
  7151 0000368D E8EA06                   call getlex
  7152 00003690 A3[1C00]                 mov word [token], ax
  7153 00003693 A1[1C00]                 mov ax, [token]
  7154 00003696 3D0201                   cmp ax, 258
  7155 00003699 0F852700                 jne @@dodefine376
  7156                                  
  7157                                  ;-680     prs("\n;Use archive file: ");
  7158                                  
  7159 0000369D 68[A337]                 push dodefine_2
  7160 000036A0 E8300F                   call prs
  7161 000036A3 83C402                   add  sp, 2
  7162                                  
  7163                                  ;-681     strcpy(archivename, symbol); prs(archivename);
  7164                                  
  7165 000036A6 8D062B81                 lea  ax, [symbol]
  7166 000036AA 50                       push ax
  7167 000036AB 8D067482                 lea  ax, [archivename]
  7168 000036AF 50                       push ax
  7169 000036B0 E8C8CA                   call strcpy
  7170 000036B3 83C404                   add  sp, 4
  7171 000036B6 8D067482                 lea  ax, [archivename]
  7172 000036BA 50                       push ax
  7173 000036BB E8150F                   call prs
  7174 000036BE 83C402                   add  sp, 2
  7175                                  
  7176                                  ;-682     } else error1("Name of archive file missing"); token=getlex(); return;}
  7177                                  
  7178 000036C1 E90900                   jmp @@dodefine377
  7179                                  @@dodefine376:
  7180 000036C4 68[B937]                 push dodefine_3
  7181 000036C7 E8F211                   call error1
  7182 000036CA 83C402                   add  sp, 2
  7183                                  @@dodefine377:
  7184 000036CD E8AA06                   call getlex
  7185 000036D0 A3[1C00]                 mov word [token], ax
  7186 000036D3 E9BB00                   jmp @@retn
  7187                                  
  7188                                  ;-683    expect(T_NAME);
  7189                                  
  7190                                  @@dodefine375:
  7191 000036D6 680001                   push 256
  7192 000036D9 E8E40D                   call expect
  7193 000036DC 83C402                   add  sp, 2
  7194                                  
  7195                                  ;-684   if (token==T_CONST) { 
  7196                                  
  7197 000036DF A1[1C00]                 mov ax, [token]
  7198 000036E2 3D0101                   cmp ax, 257
  7199 000036E5 0F85A800                 jne @@dodefine378
  7200                                  
  7201                                  ;-685     if (GTop >= LSTART) error1("global table (define) full");
  7202                                  
  7203 000036E9 A1[2A00]                 mov ax, [GTop]
  7204 000036EC 3DC800                   cmp ax, 200 ;unsigned : 1
  7205 000036EF 0F8C0900                 jl  @@dodefine379
  7206 000036F3 68[D637]                 push dodefine_4
  7207 000036F6 E8C311                   call error1
  7208 000036F9 83C402                   add  sp, 2
  7209                                  
  7210                                  ;-686     i=strlen(symbol); if (i>15) error1("Define name longer 15 char");
  7211                                  
  7212                                  @@dodefine379:
  7213 000036FC 8D062B81                 lea  ax, [symbol]
  7214 00003700 50                       push ax
  7215 00003701 E84FCA                   call strlen
  7216 00003704 83C402                   add  sp, 2
  7217 00003707 8946FE                   mov [bp-2], ax
  7218 0000370A 8B46FE                   mov ax, [bp-2]
  7219 0000370D 83F80F                   cmp ax, 15
  7220 00003710 0F8E0900                 jle @@dodefine380
  7221 00003714 68[F137]                 push dodefine_5
  7222 00003717 E8A211                   call error1
  7223 0000371A 83C402                   add  sp, 2
  7224                                  
  7225                                  ;-687     GSign [GTop]='U'; GWidth[GTop]=1; GType [GTop]='#';
  7226                                  
  7227                                  @@dodefine380:
  7228 0000371D B85500                   mov ax, 85
  7229 00003720 8B1E[2A00]               mov bx, [GTop]
  7230 00003724 8887E383                 mov [GSign+bx], al
  7231 00003728 B80100                   mov ax, 1
  7232 0000372B 8B1E[2A00]               mov bx, [GTop]
  7233 0000372F 88870F85                 mov [GWidth+bx], al
  7234 00003733 B82300                   mov ax, 35
  7235 00003736 8B1E[2A00]               mov bx, [GTop]
  7236 0000373A 8887B782                 mov [GType+bx], al
  7237                                  
  7238                                  ;-688     GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  7239                                  
  7240 0000373E A1[6600]                 mov ax, [lineno]
  7241 00003741 83E801                   sub ax, 1
  7242 00003744 8B1E[2A00]               mov bx, [GTop]
  7243 00003748 D1E3                     shl bx, 1
  7244 0000374A 89873B86                 mov [GAdr+bx], ax
  7245 0000374E B80000                   mov ax, 0
  7246 00003751 8B1E[2A00]               mov bx, [GTop]
  7247 00003755 D1E3                     shl bx, 1
  7248 00003757 89879388                 mov [GUsed+bx], ax
  7249                                  
  7250                                  ;-689     pt=adrofname(GTop); strcpy(pt, symbol); GData[GTop]=lexval;
  7251                                  
  7252 0000375B FF36[2A00]               push word [GTop]
  7253 0000375F E834D2                   call adrofname
  7254 00003762 83C402                   add  sp, 2
  7255 00003765 A3[6A00]                 mov word [pt], ax
  7256 00003768 8D062B81                 lea  ax, [symbol]
  7257 0000376C 50                       push ax
  7258 0000376D FF36[6A00]               push word [pt]
  7259 00003771 E807CA                   call strcpy
  7260 00003774 83C404                   add  sp, 4
  7261 00003777 A1[2E00]                 mov ax, [lexval]
  7262 0000377A 8B1E[2A00]               mov bx, [GTop]
  7263 0000377E D1E3                     shl bx, 1
  7264 00003780 8987EB8A                 mov [GData+bx], ax
  7265                                  
  7266                                  ;-690     expect(T_CONST); GTop++;  } 
  7267                                  
  7268 00003784 680101                   push 257
  7269 00003787 E8360D                   call expect
  7270 0000378A 83C402                   add  sp, 2
  7271 0000378D FF06[2A00]               inc  word[GTop]
  7272                                  
  7273                                  ;-691 }
  7274                                  
  7275                                  @@dodefine378:
  7276                                  
  7277                                  ;-692 int stmt() { int c; char cha;
  7278                                  
  7279 00003791 C9                      @@retn: LEAVE
  7280 00003792 C3                       ret
  7281                                  ; ENDP
  7282 00003793 4F52474441544100        dodefine_0 db "ORGDATA",0
  7283 0000379B 4152434849564500        dodefine_1 db "ARCHIVE",0
  7284 000037A3 5C6E3B557365206172-     dodefine_2 db "\n;Use archive file: ",0
  7285 000037AC 63686976652066696C-
  7286 000037B5 653A2000           
  7287 000037B9 4E616D65206F662061-     dodefine_3 db "Name of archive file missing",0
  7288 000037C2 726368697665206669-
  7289 000037CB 6C65206D697373696E-
  7290 000037D4 6700               
  7291 000037D6 676C6F62616C207461-     dodefine_4 db "global table (define) full",0
  7292 000037DF 626C65202864656669-
  7293 000037E8 6E65292066756C6C00 
  7294 000037F1 446566696E65206E61-     dodefine_5 db "Define name longer 15 char",0
  7295 000037FA 6D65206C6F6E676572-
  7296 00003803 203135206368617200 
  7297                                  
  7298                                  stmt:  ; *** PROC ***
  7299                                  
  7300                                  ;-693        if(istoken('{'))     {while(istoken('}')==0) stmt();}
  7301                                  
  7302                                  ;Function : stmt, Number of local variables: 2
  7303                                  ;   # type sign width addr used name   list of local variables
  7304                                  ;  200 var sign word   692 NULL c = bp-2
  7305                                  ;  201 var sign byte   692 NULL cha = bp-4;
  7306 0000380C C8040000                 ENTER  4,0
  7307 00003810 6A7B                     push 123
  7308 00003812 E8890C                   call istoken
  7309 00003815 83C402                   add  sp, 2
  7310 00003818 08C0                     or  al, al
  7311 0000381A 0F841700                 je @@stmt381
  7312                                  @@stmt382:
  7313 0000381E 6A7D                     push 125
  7314 00003820 E87B0C                   call istoken
  7315 00003823 83C402                   add  sp, 2
  7316 00003826 83F800                   cmp ax, 0
  7317 00003829 0F850500                 jne @@stmt383
  7318 0000382D E8DCFF                   call stmt
  7319 00003830 EBEC                     jmp @@stmt382
  7320                                  @@stmt383:
  7321                                  
  7322                                  ;-694   else if(istoken(T_IF))    doif();
  7323                                  
  7324 00003832 E9A501                   jmp @@stmt384
  7325                                  @@stmt381:
  7326 00003835 680102                   push 513
  7327 00003838 E8630C                   call istoken
  7328 0000383B 83C402                   add  sp, 2
  7329 0000383E 08C0                     or  al, al
  7330 00003840 0F840600                 je @@stmt385
  7331 00003844 E8D903                   call doif
  7332                                  
  7333                                  ;-695   else if(istoken(T_DO))    dodo();
  7334                                  
  7335 00003847 E99001                   jmp @@stmt386
  7336                                  @@stmt385:
  7337 0000384A 680402                   push 516
  7338 0000384D E84E0C                   call istoken
  7339 00003850 83C402                   add  sp, 2
  7340 00003853 08C0                     or  al, al
  7341 00003855 0F840600                 je @@stmt387
  7342 00003859 E82604                   call dodo
  7343                                  
  7344                                  ;-696   else if(istoken(T_WHILE)) dowhile();
  7345                                  
  7346 0000385C E97B01                   jmp @@stmt388
  7347                                  @@stmt387:
  7348 0000385F 680302                   push 515
  7349 00003862 E8390C                   call istoken
  7350 00003865 83C402                   add  sp, 2
  7351 00003868 08C0                     or  al, al
  7352 0000386A 0F840600                 je @@stmt389
  7353 0000386E E85E04                   call dowhile
  7354                                  
  7355                                  ;-697   else if(istoken(T_GOTO))  {prs("\n jmp @@");name1();prs(symbol);expect(';');}
  7356                                  
  7357 00003871 E96601                   jmp @@stmt390
  7358                                  @@stmt389:
  7359 00003874 680902                   push 521
  7360 00003877 E8240C                   call istoken
  7361 0000387A 83C402                   add  sp, 2
  7362 0000387D 08C0                     or  al, al
  7363 0000387F 0F842200                 je @@stmt391
  7364 00003883 68[DC39]                 push stmt_0
  7365 00003886 E84A0D                   call prs
  7366 00003889 83C402                   add  sp, 2
  7367 0000388C E836D3                   call name1
  7368 0000388F 8D062B81                 lea  ax, [symbol]
  7369 00003893 50                       push ax
  7370 00003894 E83C0D                   call prs
  7371 00003897 83C402                   add  sp, 2
  7372 0000389A 6A3B                     push 59
  7373 0000389C E8210C                   call expect
  7374 0000389F 83C402                   add  sp, 2
  7375                                  
  7376                                  ;-698   else if(token==T_ASM)     {prs("\n"); c=next();
  7377                                  
  7378 000038A2 E93501                   jmp @@stmt392
  7379                                  @@stmt391:
  7380 000038A5 A1[1C00]                 mov ax, [token]
  7381 000038A8 3D0602                   cmp ax, 518
  7382 000038AB 0F853300                 jne @@stmt393
  7383 000038AF 68[E639]                 push stmt_1
  7384 000038B2 E81E0D                   call prs
  7385 000038B5 83C402                   add  sp, 2
  7386 000038B8 E8C50B                   call next
  7387 000038BB 8946FE                   mov [bp-2], ax
  7388                                  
  7389                                  ;-699         while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }
  7390                                  
  7391                                  @@stmt394:
  7392 000038BE 8B46FE                   mov ax, [bp-2]
  7393 000038C1 83F80A                   cmp ax, 10
  7394 000038C4 0F841100                 je  @@stmt395
  7395 000038C8 FF76FE                   push word [bp-2]
  7396 000038CB E89E0C                   call prc
  7397 000038CE 83C402                   add  sp, 2
  7398 000038D1 E8AC0B                   call next
  7399 000038D4 8946FE                   mov [bp-2], ax
  7400 000038D7 EBE5                     jmp @@stmt394
  7401                                  @@stmt395:
  7402 000038D9 E89E04                   call getlex
  7403 000038DC A3[1C00]                 mov word [token], ax
  7404                                  
  7405                                  ;-700   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();  
  7406                                  
  7407 000038DF E9F800                   jmp @@stmt396
  7408                                  @@stmt393:
  7409 000038E2 680702                   push 519
  7410 000038E5 E8B60B                   call istoken
  7411 000038E8 83C402                   add  sp, 2
  7412 000038EB 08C0                     or  al, al
  7413 000038ED 0F844B00                 je @@stmt397
  7414 000038F1 A1[1C00]                 mov ax, [token]
  7415 000038F4 83F87B                   cmp ax, 123
  7416 000038F7 0F853500                 jne @@stmt398
  7417 000038FB 68[E939]                 push stmt_2
  7418 000038FE E8D20C                   call prs
  7419 00003901 83C402                   add  sp, 2
  7420 00003904 E8790B                   call next
  7421 00003907 8846FC                   mov [bp-4], al
  7422                                  
  7423                                  ;-701         while(cha!= '}') { prc(cha); cha=next(); }
  7424                                  
  7425                                  @@stmt399:
  7426 0000390A 8A46FC                   mov al, [bp-4]
  7427 0000390D 3C7D                     cmp al, 125
  7428 0000390F 0F841400                 je  @@stmt400
  7429 00003913 8A46FC                   mov al, byte [bp-4]
  7430 00003916 B400                     mov ah, 0
  7431 00003918 50                       push ax
  7432 00003919 E8500C                   call prc
  7433 0000391C 83C402                   add  sp, 2
  7434 0000391F E85E0B                   call next
  7435 00003922 8846FC                   mov [bp-4], al
  7436                                  
  7437                                  ;-702         token=getlex(); }
  7438                                  
  7439 00003925 EBE3                     jmp @@stmt399
  7440                                  @@stmt400:
  7441 00003927 E85004                   call getlex
  7442 0000392A A3[1C00]                 mov word [token], ax
  7443                                  
  7444                                  ;-703         else error1("Curly open expected"); 
  7445                                  
  7446 0000392D E90900                   jmp @@stmt401
  7447                                  @@stmt398:
  7448 00003930 68[EC39]                 push stmt_3
  7449 00003933 E8860F                   call error1
  7450 00003936 83C402                   add  sp, 2
  7451                                  
  7452                                  ;-704         }
  7453                                  
  7454                                  @@stmt401:
  7455                                  
  7456                                  ;-705   else if(istoken(T_EMIT))   doemit();
  7457                                  
  7458 00003939 E99E00                   jmp @@stmt402
  7459                                  @@stmt397:
  7460 0000393C 680802                   push 520
  7461 0000393F E85C0B                   call istoken
  7462 00003942 83C402                   add  sp, 2
  7463 00003945 08C0                     or  al, al
  7464 00003947 0F840600                 je @@stmt403
  7465 0000394B E8C500                   call doemit
  7466                                  
  7467                                  ;-706   else if(istoken(';'))      { }
  7468                                  
  7469 0000394E E98900                   jmp @@stmt404
  7470                                  @@stmt403:
  7471 00003951 6A3B                     push 59
  7472 00003953 E8480B                   call istoken
  7473 00003956 83C402                   add  sp, 2
  7474 00003959 08C0                     or  al, al
  7475 0000395B 0F840300                 je @@stmt405
  7476                                  
  7477                                  ;-707   else if(istoken(T_RETURN)) {
  7478                                  
  7479 0000395F E97800                   jmp @@stmt406
  7480                                  @@stmt405:
  7481 00003962 680002                   push 512
  7482 00003965 E8360B                   call istoken
  7483 00003968 83C402                   add  sp, 2
  7484 0000396B 08C0                     or  al, al
  7485 0000396D 0F842500                 je @@stmt407
  7486                                  
  7487                                  ;-708         if (token!=';') exprstart();
  7488                                  
  7489 00003971 A1[1C00]                 mov ax, [token]
  7490 00003974 83F83B                   cmp ax, 59
  7491 00003977 0F840300                 je  @@stmt408
  7492 0000397B E810D9                   call exprstart
  7493                                  
  7494                                  ;-709         prs("\n jmp @@retn"); 
  7495                                  
  7496                                  @@stmt408:
  7497 0000397E 68[003A]                 push stmt_4
  7498 00003981 E84F0C                   call prs
  7499 00003984 83C402                   add  sp, 2
  7500                                  
  7501                                  ;-710         nreturn++; 
  7502                                  
  7503 00003987 FF06[2600]               inc  word[nreturn]
  7504                                  
  7505                                  ;-711         expect(';');
  7506                                  
  7507 0000398B 6A3B                     push 59
  7508 0000398D E8300B                   call expect
  7509 00003990 83C402                   add  sp, 2
  7510                                  
  7511                                  ;-712         }
  7512                                  
  7513                                  
  7514                                  ;-713   else if(thechar==':')      {
  7515                                  
  7516 00003993 E94400                   jmp @@stmt409
  7517                                  @@stmt407:
  7518 00003996 A0[2100]                 mov al, [thechar]
  7519 00003999 3C3A                     cmp al, 58
  7520 0000399B 0F853000                 jne @@stmt410
  7521                                  
  7522                                  ;-714         prs("\n@@"); // Label
  7523                                  
  7524 0000399F 68[0E3A]                 push stmt_5
  7525 000039A2 E82E0C                   call prs
  7526 000039A5 83C402                   add  sp, 2
  7527                                  
  7528                                  ;-715         prs(symbol); prc(':');  
  7529                                  
  7530 000039A8 8D062B81                 lea  ax, [symbol]
  7531 000039AC 50                       push ax
  7532 000039AD E8230C                   call prs
  7533 000039B0 83C402                   add  sp, 2
  7534 000039B3 6A3A                     push 58
  7535 000039B5 E8B40B                   call prc
  7536 000039B8 83C402                   add  sp, 2
  7537                                  
  7538                                  ;-716         expect(T_NAME); 
  7539                                  
  7540 000039BB 680001                   push 256
  7541 000039BE E8FF0A                   call expect
  7542 000039C1 83C402                   add  sp, 2
  7543                                  
  7544                                  ;-717         expect(':'); 
  7545                                  
  7546 000039C4 6A3A                     push 58
  7547 000039C6 E8F70A                   call expect
  7548 000039C9 83C402                   add  sp, 2
  7549                                  
  7550                                  ;-718         }
  7551                                  
  7552                                  
  7553                                  ;-719   else  {exprstart(); expect(';'); } 
  7554                                  
  7555 000039CC E90B00                   jmp @@stmt411
  7556                                  @@stmt410:
  7557 000039CF E8BCD8                   call exprstart
  7558 000039D2 6A3B                     push 59
  7559 000039D4 E8E90A                   call expect
  7560 000039D7 83C402                   add  sp, 2
  7561                                  
  7562                                  ;-720 }
  7563                                  
  7564                                  @@stmt411:
  7565                                  @@stmt409:
  7566                                  @@stmt406:
  7567                                  @@stmt404:
  7568                                  @@stmt402:
  7569                                  @@stmt396:
  7570                                  @@stmt392:
  7571                                  @@stmt390:
  7572                                  @@stmt388:
  7573                                  @@stmt386:
  7574                                  @@stmt384:
  7575                                  
  7576                                  ;-721 
  7577                                  
  7578                                  
  7579                                  ;-722 int doemit() {prs("\n db ");
  7580 000039DA C9                       LEAVE
  7581 000039DB C3                       ret
  7582                                  ; ENDP
  7583 000039DC 5C6E206A6D70204040-     stmt_0 db "\n jmp @@",0
  7584 000039E5 00                 
  7585 000039E6 5C6E00                  stmt_1 db "\n",0
  7586 000039E9 5C6E00                  stmt_2 db "\n",0
  7587 000039EC 4375726C79206F7065-     stmt_3 db "Curly open expected",0
  7588 000039F5 6E2065787065637465-
  7589 000039FE 6400               
  7590 00003A00 5C6E206A6D70204040-     stmt_4 db "\n jmp @@retn",0
  7591 00003A09 7265746E00         
  7592 00003A0E 5C6E404000              stmt_5 db "\n@@",0
  7593                                  
  7594                                  doemit:  ; *** PROC ***
  7595 00003A13 68[4F3A]                 push doemit_0
  7596 00003A16 E8BA0B                   call prs
  7597 00003A19 83C402                   add  sp, 2
  7598                                  
  7599                                  ;-723   L1: token=getlex(); prunsign1(lexval); token=getlex();
  7600                                  
  7601                                  @@L1:
  7602 00003A1C E85B03                   call getlex
  7603 00003A1F A3[1C00]                 mov word [token], ax
  7604 00003A22 FF36[2E00]               push word [lexval]
  7605 00003A26 E8040D                   call prunsign1
  7606 00003A29 83C402                   add  sp, 2
  7607 00003A2C E84B03                   call getlex
  7608 00003A2F A3[1C00]                 mov word [token], ax
  7609                                  
  7610                                  ;-724     if (token== ',') {prc(','); goto L1;} expect(')'); }
  7611                                  
  7612 00003A32 A1[1C00]                 mov ax, [token]
  7613 00003A35 83F82C                   cmp ax, 44
  7614 00003A38 0F850A00                 jne @@doemit412
  7615 00003A3C 6A2C                     push 44
  7616 00003A3E E82B0B                   call prc
  7617 00003A41 83C402                   add  sp, 2
  7618 00003A44 EBD6                     jmp @@L1
  7619                                  @@doemit412:
  7620 00003A46 6A29                     push 41
  7621 00003A48 E8750A                   call expect
  7622 00003A4B 83C402                   add  sp, 2
  7623                                  
  7624                                  ;-725 
  7625                                  
  7626                                  
  7627                                  ;-726 int cmpneg(int ids) {
  7628                                  
  7629 00003A4E C3                       ret
  7630                                  ; ENDP
  7631 00003A4F 5C6E2064622000          doemit_0 db "\n db ",0
  7632                                  
  7633                                  cmpneg:  ; *** PROC ***
  7634                                  
  7635                                  ;-727        if(iscmp==T_EQ) prs("\n jne @@");         //ZF=0
  7636                                  
  7637                                  ;Function : cmpneg, Number of local variables: 1
  7638                                  ;   # type sign width addr used name   list of local variables
  7639                                  ;  200 var sign word   726 NULL ids = bp+4;
  7640 00003A56 C8000000                 ENTER  0,0
  7641 00003A5A A1[2200]                 mov ax, [iscmp]
  7642 00003A5D 3D2603                   cmp ax, 806
  7643 00003A60 0F850C00                 jne @@cmpneg413
  7644 00003A64 68[373B]                 push cmpneg_0
  7645 00003A67 E8690B                   call prs
  7646 00003A6A 83C402                   add  sp, 2
  7647                                  
  7648                                  ;-728   else if(iscmp==T_NE) prs("\n je  @@");         //ZF=1
  7649                                  
  7650 00003A6D E9C500                   jmp @@cmpneg414
  7651                                  @@cmpneg413:
  7652 00003A70 A1[2200]                 mov ax, [iscmp]
  7653 00003A73 3D2703                   cmp ax, 807
  7654 00003A76 0F850C00                 jne @@cmpneg415
  7655 00003A7A 68[413B]                 push cmpneg_1
  7656 00003A7D E8530B                   call prs
  7657 00003A80 83C402                   add  sp, 2
  7658                                  
  7659                                  ;-729   else if(iscmp==T_LE) if (ids) prs("\n jg  @@");//ZF=0      SF =OF
  7660                                  
  7661 00003A83 E9AF00                   jmp @@cmpneg416
  7662                                  @@cmpneg415:
  7663 00003A86 A1[2200]                 mov ax, [iscmp]
  7664 00003A89 3D3803                   cmp ax, 824
  7665 00003A8C 0F852100                 jne @@cmpneg417
  7666 00003A90 8B4604                   mov ax, [bp+4]
  7667 00003A93 08C0                     or  al, al
  7668 00003A95 0F840C00                 je @@cmpneg418
  7669 00003A99 68[4B3B]                 push cmpneg_2
  7670 00003A9C E8340B                   call prs
  7671 00003A9F 83C402                   add  sp, 2
  7672                                  
  7673                                  ;-730                            else prs("\n ja  @@");//ZF=0 CF=0
  7674                                  
  7675 00003AA2 E90900                   jmp @@cmpneg419
  7676                                  @@cmpneg418:
  7677 00003AA5 68[553B]                 push cmpneg_3
  7678 00003AA8 E8280B                   call prs
  7679 00003AAB 83C402                   add  sp, 2
  7680                                  
  7681                                  ;-731   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);
  7682                                  
  7683                                  @@cmpneg419:
  7684 00003AAE E98400                   jmp @@cmpneg420
  7685                                  @@cmpneg417:
  7686 00003AB1 A1[2200]                 mov ax, [iscmp]
  7687 00003AB4 3D2B03                   cmp ax, 811
  7688 00003AB7 0F854500                 jne @@cmpneg421
  7689 00003ABB 8B4604                   mov ax, [bp+4]
  7690 00003ABE 08C0                     or  al, al
  7691 00003AC0 0F841E00                 je @@cmpneg422
  7692 00003AC4 68[5F3B]                 push cmpneg_4
  7693 00003AC7 E8090B                   call prs
  7694 00003ACA 83C402                   add  sp, 2
  7695 00003ACD FF7604                   push word [bp+4]
  7696 00003AD0 E85A0C                   call prunsign1
  7697 00003AD3 83C402                   add  sp, 2
  7698                                  
  7699                                  ;-732                                prs("\n jl  @@");}//          SF!=OF
  7700                                  
  7701 00003AD6 68[6D3B]                 push cmpneg_5
  7702 00003AD9 E8F70A                   call prs
  7703 00003ADC 83C402                   add  sp, 2
  7704                                  
  7705                                  ;-733                            else{prs(" ;unsigned : "); prunsign1(ids);
  7706                                  
  7707 00003ADF E91B00                   jmp @@cmpneg423
  7708                                  @@cmpneg422:
  7709 00003AE2 68[773B]                 push cmpneg_6
  7710 00003AE5 E8EB0A                   call prs
  7711 00003AE8 83C402                   add  sp, 2
  7712 00003AEB FF7604                   push word [bp+4]
  7713 00003AEE E83C0C                   call prunsign1
  7714 00003AF1 83C402                   add  sp, 2
  7715                                  
  7716                                  ;-734                                prs("\n jb  @@");}//jb=jc=CF=1
  7717                                  
  7718 00003AF4 68[853B]                 push cmpneg_7
  7719 00003AF7 E8D90A                   call prs
  7720 00003AFA 83C402                   add  sp, 2
  7721                                  
  7722                                  ;-735   else if(iscmp=='<' ) prs("\n jge @@");         //          SF =OF
  7723                                  
  7724                                  @@cmpneg423:
  7725 00003AFD E93500                   jmp @@cmpneg424
  7726                                  @@cmpneg421:
  7727 00003B00 A1[2200]                 mov ax, [iscmp]
  7728 00003B03 83F83C                   cmp ax, 60
  7729 00003B06 0F850C00                 jne @@cmpneg425
  7730 00003B0A 68[8F3B]                 push cmpneg_8
  7731 00003B0D E8C30A                   call prs
  7732 00003B10 83C402                   add  sp, 2
  7733                                  
  7734                                  ;-736   else if(iscmp=='>' ) prs("\n jle @@");         //ZF=1 oder SF!=OF
  7735                                  
  7736 00003B13 E91F00                   jmp @@cmpneg426
  7737                                  @@cmpneg425:
  7738 00003B16 A1[2200]                 mov ax, [iscmp]
  7739 00003B19 83F83E                   cmp ax, 62
  7740 00003B1C 0F850C00                 jne @@cmpneg427
  7741 00003B20 68[993B]                 push cmpneg_9
  7742 00003B23 E8AD0A                   call prs
  7743 00003B26 83C402                   add  sp, 2
  7744                                  
  7745                                  ;-737   else error1("Vergleich unbekannt in CMPNEG()");  }
  7746                                  
  7747 00003B29 E90900                   jmp @@cmpneg428
  7748                                  @@cmpneg427:
  7749 00003B2C 68[A33B]                 push cmpneg_10
  7750 00003B2F E88A0D                   call error1
  7751 00003B32 83C402                   add  sp, 2
  7752                                  @@cmpneg428:
  7753                                  @@cmpneg426:
  7754                                  @@cmpneg424:
  7755                                  @@cmpneg420:
  7756                                  @@cmpneg416:
  7757                                  @@cmpneg414:
  7758                                  
  7759                                  ;-738 
  7760                                  
  7761                                  
  7762                                  ;-739 int prlabel(int n) {prs("\n@@"); prs(fname); pint1(n); prc(':'); }
  7763 00003B35 C9                       LEAVE
  7764 00003B36 C3                       ret
  7765                                  ; ENDP
  7766 00003B37 5C6E206A6E65204040-     cmpneg_0 db "\n jne @@",0
  7767 00003B40 00                 
  7768 00003B41 5C6E206A6520204040-     cmpneg_1 db "\n je  @@",0
  7769 00003B4A 00                 
  7770 00003B4B 5C6E206A6720204040-     cmpneg_2 db "\n jg  @@",0
  7771 00003B54 00                 
  7772 00003B55 5C6E206A6120204040-     cmpneg_3 db "\n ja  @@",0
  7773 00003B5E 00                 
  7774 00003B5F 203B756E7369676E65-     cmpneg_4 db " ;unsigned : ",0
  7775 00003B68 64203A2000         
  7776 00003B6D 5C6E206A6C20204040-     cmpneg_5 db "\n jl  @@",0
  7777 00003B76 00                 
  7778 00003B77 203B756E7369676E65-     cmpneg_6 db " ;unsigned : ",0
  7779 00003B80 64203A2000         
  7780 00003B85 5C6E206A6220204040-     cmpneg_7 db "\n jb  @@",0
  7781 00003B8E 00                 
  7782 00003B8F 5C6E206A6765204040-     cmpneg_8 db "\n jge @@",0
  7783 00003B98 00                 
  7784 00003B99 5C6E206A6C65204040-     cmpneg_9 db "\n jle @@",0
  7785 00003BA2 00                 
  7786 00003BA3 566572676C65696368-     cmpneg_10 db "Vergleich unbekannt in CMPNEG()",0
  7787 00003BAC 20756E62656B616E6E-
  7788 00003BB5 7420696E20434D504E-
  7789 00003BBE 4547282900         
  7790                                  
  7791                                  prlabel:  ; *** PROC ***
  7792                                  ;Function : prlabel, Number of local variables: 1
  7793                                  ;   # type sign width addr used name   list of local variables
  7794                                  ;  200 var sign word   739 NULL n = bp+4;
  7795 00003BC3 C8000000                 ENTER  0,0
  7796 00003BC7 68[EE3B]                 push prlabel_0
  7797 00003BCA E8060A                   call prs
  7798 00003BCD 83C402                   add  sp, 2
  7799 00003BD0 8D06AB81                 lea  ax, [fname]
  7800 00003BD4 50                       push ax
  7801 00003BD5 E8FB09                   call prs
  7802 00003BD8 83C402                   add  sp, 2
  7803 00003BDB FF7604                   push word [bp+4]
  7804 00003BDE E8E90A                   call pint1
  7805 00003BE1 83C402                   add  sp, 2
  7806 00003BE4 6A3A                     push 58
  7807 00003BE6 E88309                   call prc
  7808 00003BE9 83C402                   add  sp, 2
  7809                                  
  7810                                  ;-740 int prjump (int n) {prs("\n jmp @@"); prs(fname); pint1(n); }
  7811 00003BEC C9                       LEAVE
  7812 00003BED C3                       ret
  7813                                  ; ENDP
  7814 00003BEE 5C6E404000              prlabel_0 db "\n@@",0
  7815                                  
  7816                                  prjump:  ; *** PROC ***
  7817                                  ;Function : prjump, Number of local variables: 1
  7818                                  ;   # type sign width addr used name   list of local variables
  7819                                  ;  200 var sign word   740 NULL n = bp+4;
  7820 00003BF3 C8000000                 ENTER  0,0
  7821 00003BF7 68[163C]                 push prjump_0
  7822 00003BFA E8D609                   call prs
  7823 00003BFD 83C402                   add  sp, 2
  7824 00003C00 8D06AB81                 lea  ax, [fname]
  7825 00003C04 50                       push ax
  7826 00003C05 E8CB09                   call prs
  7827 00003C08 83C402                   add  sp, 2
  7828 00003C0B FF7604                   push word [bp+4]
  7829 00003C0E E8B90A                   call pint1
  7830 00003C11 83C402                   add  sp, 2
  7831                                  
  7832                                  ;-741 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
  7833 00003C14 C9                       LEAVE
  7834 00003C15 C3                       ret
  7835                                  ; ENDP
  7836 00003C16 5C6E206A6D70204040-     prjump_0 db "\n jmp @@",0
  7837 00003C1F 00                 
  7838                                  
  7839                                  doif:  ; *** PROC ***
  7840                                  ;Function : doif, Number of local variables: 2
  7841                                  ;   # type sign width addr used name   list of local variables
  7842                                  ;  200 var sign word   741 NULL jdest = bp-2
  7843                                  ;  201 var sign word   741 NULL tst = bp-4;
  7844 00003C20 C8040000                 ENTER  4,0
  7845 00003C24 E8DAD4                   call pexpr
  7846 00003C27 FF06[2800]               inc  word[nlabel]
  7847 00003C2B A1[2800]                 mov ax, [nlabel]
  7848 00003C2E 8946FE                   mov [bp-2], ax
  7849                                  
  7850                                  ;-742   pint1(jdest); stmt();
  7851                                  
  7852 00003C31 FF76FE                   push word [bp-2]
  7853 00003C34 E8930A                   call pint1
  7854 00003C37 83C402                   add  sp, 2
  7855 00003C3A E8CFFB                   call stmt
  7856                                  
  7857                                  ;-743   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;
  7858                                  
  7859 00003C3D 680202                   push 514
  7860 00003C40 E85B08                   call istoken
  7861 00003C43 83C402                   add  sp, 2
  7862 00003C46 08C0                     or  al, al
  7863 00003C48 0F842B00                 je @@doif429
  7864 00003C4C FF06[2800]               inc  word[nlabel]
  7865 00003C50 A1[2800]                 mov ax, [nlabel]
  7866 00003C53 8946FC                   mov [bp-4], ax
  7867                                  
  7868                                  ;-744     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }
  7869                                  
  7870 00003C56 FF76FC                   push word [bp-4]
  7871 00003C59 E897FF                   call prjump
  7872 00003C5C 83C402                   add  sp, 2
  7873 00003C5F FF76FE                   push word [bp-2]
  7874 00003C62 E85EFF                   call prlabel
  7875 00003C65 83C402                   add  sp, 2
  7876 00003C68 E8A1FB                   call stmt
  7877 00003C6B FF76FC                   push word [bp-4]
  7878 00003C6E E852FF                   call prlabel
  7879 00003C71 83C402                   add  sp, 2
  7880                                  
  7881                                  ;-745   else prlabel(jdest); }
  7882                                  
  7883 00003C74 E90900                   jmp @@doif430
  7884                                  @@doif429:
  7885 00003C77 FF76FE                   push word [bp-2]
  7886 00003C7A E846FF                   call prlabel
  7887 00003C7D 83C402                   add  sp, 2
  7888                                  @@doif430:
  7889                                  
  7890                                  ;-746 
  7891                                  
  7892                                  
  7893                                  ;-747 int dodo() {int jdest; int jtemp;
  7894 00003C80 C9                       LEAVE
  7895 00003C81 C3                       ret
  7896                                  ; ENDP
  7897                                  
  7898                                  dodo:  ; *** PROC ***
  7899                                  
  7900                                  ;-748   nlabel++; jdest=nlabel; prlabel(jdest); stmt();
  7901                                  
  7902                                  ;Function : dodo, Number of local variables: 2
  7903                                  ;   # type sign width addr used name   list of local variables
  7904                                  ;  200 var sign word   747 NULL jdest = bp-2
  7905                                  ;  201 var sign word   747 NULL jtemp = bp-4;
  7906 00003C82 C8040000                 ENTER  4,0
  7907 00003C86 FF06[2800]               inc  word[nlabel]
  7908 00003C8A A1[2800]                 mov ax, [nlabel]
  7909 00003C8D 8946FE                   mov [bp-2], ax
  7910 00003C90 FF76FE                   push word [bp-2]
  7911 00003C93 E82DFF                   call prlabel
  7912 00003C96 83C402                   add  sp, 2
  7913 00003C99 E870FB                   call stmt
  7914                                  
  7915                                  ;-749   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);
  7916                                  
  7917 00003C9C 680302                   push 515
  7918 00003C9F E81E08                   call expect
  7919 00003CA2 83C402                   add  sp, 2
  7920 00003CA5 E859D4                   call pexpr
  7921 00003CA8 FF06[2800]               inc  word[nlabel]
  7922 00003CAC A1[2800]                 mov ax, [nlabel]
  7923 00003CAF 8946FC                   mov [bp-4], ax
  7924 00003CB2 FF76FC                   push word [bp-4]
  7925 00003CB5 E8120A                   call pint1
  7926 00003CB8 83C402                   add  sp, 2
  7927                                  
  7928                                  ;-750   prjump(jdest); prlabel(jtemp); }
  7929                                  
  7930 00003CBB FF76FE                   push word [bp-2]
  7931 00003CBE E832FF                   call prjump
  7932 00003CC1 83C402                   add  sp, 2
  7933 00003CC4 FF76FC                   push word [bp-4]
  7934 00003CC7 E8F9FE                   call prlabel
  7935 00003CCA 83C402                   add  sp, 2
  7936                                  
  7937                                  ;-751 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
  7938 00003CCD C9                       LEAVE
  7939 00003CCE C3                       ret
  7940                                  ; ENDP
  7941                                  
  7942                                  dowhile:  ; *** PROC ***
  7943                                  ;Function : dowhile, Number of local variables: 2
  7944                                  ;   # type sign width addr used name   list of local variables
  7945                                  ;  200 var sign word   751 NULL jdest = bp-2
  7946                                  ;  201 var sign word   751 NULL tst = bp-4;
  7947 00003CCF C8040000                 ENTER  4,0
  7948 00003CD3 FF06[2800]               inc  word[nlabel]
  7949 00003CD7 A1[2800]                 mov ax, [nlabel]
  7950 00003CDA 8946FE                   mov [bp-2], ax
  7951                                  
  7952                                  ;-752   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);
  7953                                  
  7954 00003CDD FF76FE                   push word [bp-2]
  7955 00003CE0 E8E0FE                   call prlabel
  7956 00003CE3 83C402                   add  sp, 2
  7957 00003CE6 E818D4                   call pexpr
  7958 00003CE9 FF06[2800]               inc  word[nlabel]
  7959 00003CED A1[2800]                 mov ax, [nlabel]
  7960 00003CF0 8946FC                   mov [bp-4], ax
  7961 00003CF3 FF76FC                   push word [bp-4]
  7962 00003CF6 E8D109                   call pint1
  7963 00003CF9 83C402                   add  sp, 2
  7964                                  
  7965                                  ;-753   stmt(); prjump(jdest); prlabel(tst); }
  7966                                  
  7967 00003CFC E80DFB                   call stmt
  7968 00003CFF FF76FE                   push word [bp-2]
  7969 00003D02 E8EEFE                   call prjump
  7970 00003D05 83C402                   add  sp, 2
  7971 00003D08 FF76FC                   push word [bp-4]
  7972 00003D0B E8B5FE                   call prlabel
  7973 00003D0E 83C402                   add  sp, 2
  7974                                  
  7975                                  ;-754 int isrelational() {
  7976 00003D11 C9                       LEAVE
  7977 00003D12 C3                       ret
  7978                                  ; ENDP
  7979                                  
  7980                                  isrelational:  ; *** PROC ***
  7981                                  
  7982                                  ;-755   if (token==T_EQ) goto w; if (token==T_NE) goto w;
  7983                                  
  7984 00003D13 A1[1C00]                 mov ax, [token]
  7985 00003D16 3D2603                   cmp ax, 806
  7986 00003D19 0F850300                 jne @@isrelational431
  7987 00003D1D E94700                   jmp @@w
  7988                                  @@isrelational431:
  7989 00003D20 A1[1C00]                 mov ax, [token]
  7990 00003D23 3D2703                   cmp ax, 807
  7991 00003D26 0F850300                 jne @@isrelational432
  7992 00003D2A E93A00                   jmp @@w
  7993                                  
  7994                                  ;-756   if (token==T_LE) goto w; if (token==T_GE) goto w;
  7995                                  
  7996                                  @@isrelational432:
  7997 00003D2D A1[1C00]                 mov ax, [token]
  7998 00003D30 3D3803                   cmp ax, 824
  7999 00003D33 0F850300                 jne @@isrelational433
  8000 00003D37 E92D00                   jmp @@w
  8001                                  @@isrelational433:
  8002 00003D3A A1[1C00]                 mov ax, [token]
  8003 00003D3D 3D2B03                   cmp ax, 811
  8004 00003D40 0F850300                 jne @@isrelational434
  8005 00003D44 E92000                   jmp @@w
  8006                                  
  8007                                  ;-757   if (token=='<' ) goto w; if (token=='>' ) goto w;
  8008                                  
  8009                                  @@isrelational434:
  8010 00003D47 A1[1C00]                 mov ax, [token]
  8011 00003D4A 83F83C                   cmp ax, 60
  8012 00003D4D 0F850300                 jne @@isrelational435
  8013 00003D51 E91300                   jmp @@w
  8014                                  @@isrelational435:
  8015 00003D54 A1[1C00]                 mov ax, [token]
  8016 00003D57 83F83E                   cmp ax, 62
  8017 00003D5A 0F850300                 jne @@isrelational436
  8018 00003D5E E90600                   jmp @@w
  8019                                  
  8020                                  ;-758   return 0;  w: iscmp=token; token=getlex(); return 1;}
  8021                                  
  8022                                  @@isrelational436:
  8023 00003D61 B80000                   mov ax, 0
  8024 00003D64 E91200                   jmp @@retn
  8025                                  @@w:
  8026 00003D67 A1[1C00]                 mov ax, [token]
  8027 00003D6A A3[2200]                 mov word [iscmp], ax
  8028 00003D6D E80A00                   call getlex
  8029 00003D70 A3[1C00]                 mov word [token], ax
  8030 00003D73 B80100                   mov ax, 1
  8031 00003D76 E90000                   jmp @@retn
  8032                                  
  8033                                  ;-759  
  8034                                  
  8035                                  
  8036                                  ;-760 char symboltemp[80];    
  8037                                  
  8038                                  @@retn:
  8039 00003D79 C3                       ret
  8040                                  ; ENDP
  8041                                  section .bss
  8042                                  absolute 53468
  8043 0000D0DC <res 00000050>          symboltemp resb 80
  8044                                  section .text
  8045                                  
  8046                                  ;-761 int getlex() { char c; char *p; 
  8047                                  
  8048                                  
  8049                                  getlex:  ; *** PROC ***
  8050                                  
  8051                                  ;-762 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;
  8052                                  
  8053                                  ;Function : getlex, Number of local variables: 2
  8054                                  ;   # type sign width addr used name   list of local variables
  8055                                  ;  200 var sign byte   761 NULL c = bp-2
  8056                                  ;  201 ptr sign byte   761 NULL p = bp-4;
  8057 00003D7A C8040000                 ENTER  4,0
  8058                                  @@g1:
  8059 00003D7E E8FF06                   call next
  8060 00003D81 8846FE                   mov [bp-2], al
  8061 00003D84 8A46FE                   mov al, [bp-2]
  8062 00003D87 3C00                     cmp al, 0
  8063 00003D89 0F850600                 jne @@getlex437
  8064 00003D8D B80000                   mov ax, 0
  8065 00003D90 E9EB04                   jmp @@retn
  8066                                  @@getlex437:
  8067 00003D93 8A46FE                   mov al, [bp-2]
  8068 00003D96 3C20                     cmp al, 32
  8069 00003D98 0F8F0200                 jg  @@getlex438
  8070 00003D9C EBE0                     jmp @@g1
  8071                                  
  8072                                  ;-763   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}
  8073                                  
  8074                                  @@getlex438:
  8075 00003D9E 8A46FE                   mov al, [bp-2]
  8076 00003DA1 3C3D                     cmp al, 61
  8077 00003DA3 0F851200                 jne @@getlex439
  8078 00003DA7 A0[2100]                 mov al, [thechar]
  8079 00003DAA 3C3D                     cmp al, 61
  8080 00003DAC 0F850900                 jne @@getlex440
  8081 00003DB0 E8CD06                   call next
  8082 00003DB3 B82603                   mov ax, 806
  8083 00003DB6 E9C504                   jmp @@retn
  8084                                  @@getlex440:
  8085                                  
  8086                                  ;-764   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}
  8087                                  
  8088                                  @@getlex439:
  8089 00003DB9 8A46FE                   mov al, [bp-2]
  8090 00003DBC 3C21                     cmp al, 33
  8091 00003DBE 0F851200                 jne @@getlex441
  8092 00003DC2 A0[2100]                 mov al, [thechar]
  8093 00003DC5 3C3D                     cmp al, 61
  8094 00003DC7 0F850900                 jne @@getlex442
  8095 00003DCB E8B206                   call next
  8096 00003DCE B82703                   mov ax, 807
  8097 00003DD1 E9AA04                   jmp @@retn
  8098                                  @@getlex442:
  8099                                  
  8100                                  ;-765   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}
  8101                                  
  8102                                  @@getlex441:
  8103 00003DD4 8A46FE                   mov al, [bp-2]
  8104 00003DD7 3C3C                     cmp al, 60
  8105 00003DD9 0F851200                 jne @@getlex443
  8106 00003DDD A0[2100]                 mov al, [thechar]
  8107 00003DE0 3C3D                     cmp al, 61
  8108 00003DE2 0F850900                 jne @@getlex444
  8109 00003DE6 E89706                   call next
  8110 00003DE9 B83803                   mov ax, 824
  8111 00003DEC E98F04                   jmp @@retn
  8112                                  @@getlex444:
  8113                                  
  8114                                  ;-766   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}
  8115                                  
  8116                                  @@getlex443:
  8117 00003DEF 8A46FE                   mov al, [bp-2]
  8118 00003DF2 3C3E                     cmp al, 62
  8119 00003DF4 0F851200                 jne @@getlex445
  8120 00003DF8 A0[2100]                 mov al, [thechar]
  8121 00003DFB 3C3D                     cmp al, 61
  8122 00003DFD 0F850900                 jne @@getlex446
  8123 00003E01 E87C06                   call next
  8124 00003E04 B82B03                   mov ax, 811
  8125 00003E07 E97404                   jmp @@retn
  8126                                  @@getlex446:
  8127                                  
  8128                                  ;-767   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}
  8129                                  
  8130                                  @@getlex445:
  8131 00003E0A 8A46FE                   mov al, [bp-2]
  8132 00003E0D 3C3C                     cmp al, 60
  8133 00003E0F 0F851200                 jne @@getlex447
  8134 00003E13 A0[2100]                 mov al, [thechar]
  8135 00003E16 3C3C                     cmp al, 60
  8136 00003E18 0F850900                 jne @@getlex448
  8137 00003E1C E86106                   call next
  8138 00003E1F B8D804                   mov ax, 1240
  8139 00003E22 E95904                   jmp @@retn
  8140                                  @@getlex448:
  8141                                  
  8142                                  ;-768   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}
  8143                                  
  8144                                  @@getlex447:
  8145 00003E25 8A46FE                   mov al, [bp-2]
  8146 00003E28 3C3E                     cmp al, 62
  8147 00003E2A 0F851200                 jne @@getlex449
  8148 00003E2E A0[2100]                 mov al, [thechar]
  8149 00003E31 3C3E                     cmp al, 62
  8150 00003E33 0F850900                 jne @@getlex450
  8151 00003E37 E84606                   call next
  8152 00003E3A B8D904                   mov ax, 1241
  8153 00003E3D E93E04                   jmp @@retn
  8154                                  @@getlex450:
  8155                                  
  8156                                  ;-769   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}
  8157                                  
  8158                                  @@getlex449:
  8159 00003E40 8A46FE                   mov al, [bp-2]
  8160 00003E43 3C2B                     cmp al, 43
  8161 00003E45 0F851200                 jne @@getlex451
  8162 00003E49 A0[2100]                 mov al, [thechar]
  8163 00003E4C 3C2B                     cmp al, 43
  8164 00003E4E 0F850900                 jne @@getlex452
  8165 00003E52 E82B06                   call next
  8166 00003E55 B8C304                   mov ax, 1219
  8167 00003E58 E92304                   jmp @@retn
  8168                                  @@getlex452:
  8169                                  
  8170                                  ;-770   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}
  8171                                  
  8172                                  @@getlex451:
  8173 00003E5B 8A46FE                   mov al, [bp-2]
  8174 00003E5E 3C2D                     cmp al, 45
  8175 00003E60 0F851200                 jne @@getlex453
  8176 00003E64 A0[2100]                 mov al, [thechar]
  8177 00003E67 3C2D                     cmp al, 45
  8178 00003E69 0F850900                 jne @@getlex454
  8179 00003E6D E81006                   call next
  8180 00003E70 B8C904                   mov ax, 1225
  8181 00003E73 E90804                   jmp @@retn
  8182                                  @@getlex454:
  8183                                  
  8184                                  ;-771   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}
  8185                                  
  8186                                  @@getlex453:
  8187 00003E76 8A46FE                   mov al, [bp-2]
  8188 00003E79 3C2B                     cmp al, 43
  8189 00003E7B 0F851200                 jne @@getlex455
  8190 00003E7F A0[2100]                 mov al, [thechar]
  8191 00003E82 3C3D                     cmp al, 61
  8192 00003E84 0F850900                 jne @@getlex456
  8193 00003E88 E8F505                   call next
  8194 00003E8B B8CE04                   mov ax, 1230
  8195 00003E8E E9ED03                   jmp @@retn
  8196                                  @@getlex456:
  8197                                  
  8198                                  ;-772   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}
  8199                                  
  8200                                  @@getlex455:
  8201 00003E91 8A46FE                   mov al, [bp-2]
  8202 00003E94 3C2D                     cmp al, 45
  8203 00003E96 0F851200                 jne @@getlex457
  8204 00003E9A A0[2100]                 mov al, [thechar]
  8205 00003E9D 3C3D                     cmp al, 61
  8206 00003E9F 0F850900                 jne @@getlex458
  8207 00003EA3 E8DA05                   call next
  8208 00003EA6 B8CF04                   mov ax, 1231
  8209 00003EA9 E9D203                   jmp @@retn
  8210                                  @@getlex458:
  8211                                  
  8212                                  ;-773   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}
  8213                                  
  8214                                  @@getlex457:
  8215 00003EAC 8A46FE                   mov al, [bp-2]
  8216 00003EAF 3C26                     cmp al, 38
  8217 00003EB1 0F851200                 jne @@getlex459
  8218 00003EB5 A0[2100]                 mov al, [thechar]
  8219 00003EB8 3C3D                     cmp al, 61
  8220 00003EBA 0F850900                 jne @@getlex460
  8221 00003EBE E8BF05                   call next
  8222 00003EC1 B8D204                   mov ax, 1234
  8223 00003EC4 E9B703                   jmp @@retn
  8224                                  @@getlex460:
  8225                                  
  8226                                  ;-774   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}    
  8227                                  
  8228                                  @@getlex459:
  8229 00003EC7 8A46FE                   mov al, [bp-2]
  8230 00003ECA 3C7C                     cmp al, 124
  8231 00003ECC 0F851200                 jne @@getlex461
  8232 00003ED0 A0[2100]                 mov al, [thechar]
  8233 00003ED3 3C3D                     cmp al, 61
  8234 00003ED5 0F850900                 jne @@getlex462
  8235 00003ED9 E8A405                   call next
  8236 00003EDC B8D304                   mov ax, 1235
  8237 00003EDF E99C03                   jmp @@retn
  8238                                  @@getlex462:
  8239                                  
  8240                                  ;-775   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}
  8241                                  
  8242                                  @@getlex461:
  8243 00003EE2 8A46FE                   mov al, [bp-2]
  8244 00003EE5 3C2A                     cmp al, 42
  8245 00003EE7 0F851200                 jne @@getlex463
  8246 00003EEB A0[2100]                 mov al, [thechar]
  8247 00003EEE 3C3D                     cmp al, 61
  8248 00003EF0 0F850900                 jne @@getlex464
  8249 00003EF4 E88905                   call next
  8250 00003EF7 B8D004                   mov ax, 1232
  8251 00003EFA E98103                   jmp @@retn
  8252                                  @@getlex464:
  8253                                  
  8254                                  ;-776   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}        
  8255                                  
  8256                                  @@getlex463:
  8257 00003EFD 8A46FE                   mov al, [bp-2]
  8258 00003F00 3C2F                     cmp al, 47
  8259 00003F02 0F851200                 jne @@getlex465
  8260 00003F06 A0[2100]                 mov al, [thechar]
  8261 00003F09 3C3D                     cmp al, 61
  8262 00003F0B 0F850900                 jne @@getlex466
  8263 00003F0F E86E05                   call next
  8264 00003F12 B8D104                   mov ax, 1233
  8265 00003F15 E96603                   jmp @@retn
  8266                                  @@getlex466:
  8267                                  
  8268                                  ;-777   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;
  8269                                  
  8270                                  @@getlex465:
  8271 00003F18 8A46FE                   mov al, byte [bp-2]
  8272 00003F1B B400                     mov ah, 0
  8273 00003F1D 50                       push ax
  8274 00003F1E 68[8042]                 push getlex_0
  8275 00003F21 E8D3C2                   call instr1
  8276 00003F24 83C404                   add  sp, 4
  8277 00003F27 08C0                     or  al, al
  8278 00003F29 0F840600                 je @@getlex467
  8279 00003F2D 8A46FE                   mov al, [bp-2]
  8280 00003F30 E94B03                   jmp @@retn
  8281                                  
  8282                                  ;-778   if (c == '/') { if (thechar == '/') {
  8283                                  
  8284                                  @@getlex467:
  8285 00003F33 8A46FE                   mov al, [bp-2]
  8286 00003F36 3C2F                     cmp al, 47
  8287 00003F38 0F852000                 jne @@getlex468
  8288 00003F3C A0[2100]                 mov al, [thechar]
  8289 00003F3F 3C2F                     cmp al, 47
  8290 00003F41 0F851700                 jne @@getlex469
  8291                                  
  8292                                  ;-779       do c=next(); while(c != 13); /* c=next(); */ return getlex(); } }
  8293                                  
  8294                                  @@getlex470:
  8295 00003F45 E83805                   call next
  8296 00003F48 8846FE                   mov [bp-2], al
  8297 00003F4B 8A46FE                   mov al, [bp-2]
  8298 00003F4E 3C0D                     cmp al, 13
  8299 00003F50 0F840200                 je  @@getlex471
  8300 00003F54 EBEF                     jmp @@getlex470
  8301                                  @@getlex471:
  8302 00003F56 E821FE                   call getlex
  8303 00003F59 E92203                   jmp @@retn
  8304                                  @@getlex469:
  8305                                  
  8306                                  ;-780   if (c == '/') { if (thechar == '*') {
  8307                                  
  8308                                  @@getlex468:
  8309 00003F5C 8A46FE                   mov al, [bp-2]
  8310 00003F5F 3C2F                     cmp al, 47
  8311 00003F61 0F853A00                 jne @@getlex472
  8312 00003F65 A0[2100]                 mov al, [thechar]
  8313 00003F68 3C2A                     cmp al, 42
  8314 00003F6A 0F852B00                 jne @@getlex473
  8315                                  
  8316                                  ;-781       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;
  8317                                  
  8318                                  @@g2:
  8319 00003F6E E80F05                   call next
  8320 00003F71 8846FE                   mov [bp-2], al
  8321 00003F74 8A46FE                   mov al, [bp-2]
  8322 00003F77 3C2A                     cmp al, 42
  8323 00003F79 0F840200                 je  @@getlex474
  8324 00003F7D EBEF                     jmp @@g2
  8325                                  @@getlex474:
  8326 00003F7F A0[2100]                 mov al, [thechar]
  8327 00003F82 3C2F                     cmp al, 47
  8328 00003F84 0F840200                 je  @@getlex475
  8329 00003F88 EBE4                     jmp @@g2
  8330                                  
  8331                                  ;-782       c=next(); return getlex(); } else  return '/'; }
  8332                                  
  8333                                  @@getlex475:
  8334 00003F8A E8F304                   call next
  8335 00003F8D 8846FE                   mov [bp-2], al
  8336 00003F90 E8E7FD                   call getlex
  8337 00003F93 E9E802                   jmp @@retn
  8338 00003F96 E90600                   jmp @@getlex476
  8339                                  @@getlex473:
  8340 00003F99 B82F00                   mov ax, 47
  8341 00003F9C E9DF02                   jmp @@retn
  8342                                  @@getlex476:
  8343                                  
  8344                                  ;-783   if (c == '"') {getstring(c); return T_STRING;}
  8345                                  
  8346                                  @@getlex472:
  8347 00003F9F 8A46FE                   mov al, [bp-2]
  8348 00003FA2 3C22                     cmp al, 34
  8349 00003FA4 0F851200                 jne @@getlex477
  8350 00003FA8 8A46FE                   mov al, byte [bp-2]
  8351 00003FAB B400                     mov ah, 0
  8352 00003FAD 50                       push ax
  8353 00003FAE E89804                   call getstring
  8354 00003FB1 83C402                   add  sp, 2
  8355 00003FB4 B80201                   mov ax, 258
  8356 00003FB7 E9C402                   jmp @@retn
  8357                                  
  8358                                  ;-784   if (digit(c)) { getdigit(c); return T_CONST; }
  8359                                  
  8360                                  @@getlex477:
  8361 00003FBA 8A46FE                   mov al, byte [bp-2]
  8362 00003FBD B400                     mov ah, 0
  8363 00003FBF 50                       push ax
  8364 00003FC0 E863C3                   call digit
  8365 00003FC3 83C402                   add  sp, 2
  8366 00003FC6 08C0                     or  al, al
  8367 00003FC8 0F841200                 je @@getlex478
  8368 00003FCC 8A46FE                   mov al, byte [bp-2]
  8369 00003FCF B400                     mov ah, 0
  8370 00003FD1 50                       push ax
  8371 00003FD2 E89E03                   call getdigit
  8372 00003FD5 83C402                   add  sp, 2
  8373 00003FD8 B80101                   mov ax, 257
  8374 00003FDB E9A002                   jmp @@retn
  8375                                  
  8376                                  ;-785   if (c==39) { lexval=next();
  8377                                  
  8378                                  @@getlex478:
  8379 00003FDE 8A46FE                   mov al, [bp-2]
  8380 00003FE1 3C27                     cmp al, 39
  8381 00003FE3 0F854F00                 jne @@getlex479
  8382 00003FE7 E89604                   call next
  8383 00003FEA A3[2E00]                 mov word [lexval], ax
  8384                                  
  8385                                  ;-786     if (lexval==92) {lexval=next();
  8386                                  
  8387 00003FED A1[2E00]                 mov ax, [lexval]
  8388 00003FF0 83F85C                   cmp ax, 92
  8389 00003FF3 0F853600                 jne @@getlex480
  8390 00003FF7 E88604                   call next
  8391 00003FFA A3[2E00]                 mov word [lexval], ax
  8392                                  
  8393                                  ;-787       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;
  8394                                  
  8395 00003FFD A1[2E00]                 mov ax, [lexval]
  8396 00004000 83F86E                   cmp ax, 110
  8397 00004003 0F850600                 jne @@getlex481
  8398 00004007 B80A00                   mov ax, 10
  8399 0000400A A3[2E00]                 mov word [lexval], ax
  8400                                  @@getlex481:
  8401 0000400D A1[2E00]                 mov ax, [lexval]
  8402 00004010 83F874                   cmp ax, 116
  8403 00004013 0F850600                 jne @@getlex482
  8404 00004017 B80900                   mov ax, 9
  8405 0000401A A3[2E00]                 mov word [lexval], ax
  8406                                  
  8407                                  ;-788       if (lexval=='0') lexval= 0; } next(); return T_CONST; }
  8408                                  
  8409                                  @@getlex482:
  8410 0000401D A1[2E00]                 mov ax, [lexval]
  8411 00004020 83F830                   cmp ax, 48
  8412 00004023 0F850600                 jne @@getlex483
  8413 00004027 B80000                   mov ax, 0
  8414 0000402A A3[2E00]                 mov word [lexval], ax
  8415                                  @@getlex483:
  8416                                  @@getlex480:
  8417 0000402D E85004                   call next
  8418 00004030 B80101                   mov ax, 257
  8419 00004033 E94802                   jmp @@retn
  8420                                  
  8421                                  ;-789   if (letter(c)) { 
  8422                                  
  8423                                  @@getlex479:
  8424 00004036 8A46FE                   mov al, byte [bp-2]
  8425 00004039 B400                     mov ah, 0
  8426 0000403B 50                       push ax
  8427 0000403C E811C3                   call letter
  8428 0000403F 83C402                   add  sp, 2
  8429 00004042 08C0                     or  al, al
  8430 00004044 0F842D02                 je @@getlex484
  8431                                  
  8432                                  ;-790     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;
  8433                                  
  8434 00004048 8D062B81                 lea  ax, [symbol]
  8435 0000404C 50                       push ax
  8436 0000404D 8D06DCD0                 lea  ax, [symboltemp]
  8437 00004051 50                       push ax
  8438 00004052 E826C1                   call strcpy
  8439 00004055 83C404                   add  sp, 4
  8440 00004058 B82B81                   mov ax, symbol
  8441 0000405B 8946FC                   mov [bp-4], ax
  8442 0000405E 8A46FE                   mov al, [bp-2]
  8443 00004061 8B5EFC                   mov  bx, [bp-4]
  8444 00004064 8807                     mov  [bx], al
  8445 00004066 FF46FC                   inc  word[bp-4]
  8446                                  
  8447                                  ;-791     while(letter(thechar)) {c=next(); *p=c;  p++; } 
  8448                                  
  8449                                  @@getlex485:
  8450 00004069 A0[2100]                 mov al, byte [thechar]
  8451 0000406C B400                     mov ah, 0
  8452 0000406E 50                       push ax
  8453 0000406F E8DEC2                   call letter
  8454 00004072 83C402                   add  sp, 2
  8455 00004075 08C0                     or  al, al
  8456 00004077 0F841300                 je @@getlex486
  8457 0000407B E80204                   call next
  8458 0000407E 8846FE                   mov [bp-2], al
  8459 00004081 8A46FE                   mov al, [bp-2]
  8460 00004084 8B5EFC                   mov  bx, [bp-4]
  8461 00004087 8807                     mov  [bx], al
  8462 00004089 FF46FC                   inc  word[bp-4]
  8463                                  
  8464                                  ;-792       *p=0;
  8465                                  
  8466 0000408C EBDB                     jmp @@getlex485
  8467                                  @@getlex486:
  8468 0000408E B80000                   mov ax, 0
  8469 00004091 8B5EFC                   mov  bx, [bp-4]
  8470 00004094 8807                     mov  [bx], al
  8471                                  
  8472                                  ;-793     if (eqstr(symbol,"signed"  )) return T_SIGNED;
  8473                                  
  8474 00004096 68[9642]                 push getlex_1
  8475 00004099 8D062B81                 lea  ax, [symbol]
  8476 0000409D 50                       push ax
  8477 0000409E E80AC1                   call eqstr
  8478 000040A1 83C404                   add  sp, 4
  8479 000040A4 08C0                     or  al, al
  8480 000040A6 0F840600                 je @@getlex487
  8481 000040AA B81302                   mov ax, 531
  8482 000040AD E9CE01                   jmp @@retn
  8483                                  
  8484                                  ;-794     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;
  8485                                  
  8486                                  @@getlex487:
  8487 000040B0 68[9D42]                 push getlex_2
  8488 000040B3 8D062B81                 lea  ax, [symbol]
  8489 000040B7 50                       push ax
  8490 000040B8 E8F0C0                   call eqstr
  8491 000040BB 83C404                   add  sp, 4
  8492 000040BE 08C0                     or  al, al
  8493 000040C0 0F840600                 je @@getlex488
  8494 000040C4 B81402                   mov ax, 532
  8495 000040C7 E9B401                   jmp @@retn
  8496                                  
  8497                                  ;-795     if (eqstr(symbol,"void"    )) return T_VOID;
  8498                                  
  8499                                  @@getlex488:
  8500 000040CA 68[A642]                 push getlex_3
  8501 000040CD 8D062B81                 lea  ax, [symbol]
  8502 000040D1 50                       push ax
  8503 000040D2 E8D6C0                   call eqstr
  8504 000040D5 83C404                   add  sp, 4
  8505 000040D8 08C0                     or  al, al
  8506 000040DA 0F840600                 je @@getlex489
  8507 000040DE B81102                   mov ax, 529
  8508 000040E1 E99A01                   jmp @@retn
  8509                                  
  8510                                  ;-796     if (eqstr(symbol,"int"     )) return T_INT;
  8511                                  
  8512                                  @@getlex489:
  8513 000040E4 68[AB42]                 push getlex_4
  8514 000040E7 8D062B81                 lea  ax, [symbol]
  8515 000040EB 50                       push ax
  8516 000040EC E8BCC0                   call eqstr
  8517 000040EF 83C404                   add  sp, 4
  8518 000040F2 08C0                     or  al, al
  8519 000040F4 0F840600                 je @@getlex490
  8520 000040F8 B80502                   mov ax, 517
  8521 000040FB E98001                   jmp @@retn
  8522                                  
  8523                                  ;-797     if (eqstr(symbol,"long"    )) return T_LONG;
  8524                                  
  8525                                  @@getlex490:
  8526 000040FE 68[AF42]                 push getlex_5
  8527 00004101 8D062B81                 lea  ax, [symbol]
  8528 00004105 50                       push ax
  8529 00004106 E8A2C0                   call eqstr
  8530 00004109 83C404                   add  sp, 4
  8531 0000410C 08C0                     or  al, al
  8532 0000410E 0F840600                 je @@getlex491
  8533 00004112 B81502                   mov ax, 533
  8534 00004115 E96601                   jmp @@retn
  8535                                  
  8536                                  ;-798     if (eqstr(symbol,"char"    )) return T_CHAR;
  8537                                  
  8538                                  @@getlex491:
  8539 00004118 68[B442]                 push getlex_6
  8540 0000411B 8D062B81                 lea  ax, [symbol]
  8541 0000411F 50                       push ax
  8542 00004120 E888C0                   call eqstr
  8543 00004123 83C404                   add  sp, 4
  8544 00004126 08C0                     or  al, al
  8545 00004128 0F840600                 je @@getlex492
  8546 0000412C B81202                   mov ax, 530
  8547 0000412F E94C01                   jmp @@retn
  8548                                  
  8549                                  ;-799     if (eqstr(symbol,"asm"     )) return T_ASM;
  8550                                  
  8551                                  @@getlex492:
  8552 00004132 68[B942]                 push getlex_7
  8553 00004135 8D062B81                 lea  ax, [symbol]
  8554 00004139 50                       push ax
  8555 0000413A E86EC0                   call eqstr
  8556 0000413D 83C404                   add  sp, 4
  8557 00004140 08C0                     or  al, al
  8558 00004142 0F840600                 je @@getlex493
  8559 00004146 B80602                   mov ax, 518
  8560 00004149 E93201                   jmp @@retn
  8561                                  
  8562                                  ;-800     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;
  8563                                  
  8564                                  @@getlex493:
  8565 0000414C 68[BD42]                 push getlex_8
  8566 0000414F 8D062B81                 lea  ax, [symbol]
  8567 00004153 50                       push ax
  8568 00004154 E854C0                   call eqstr
  8569 00004157 83C404                   add  sp, 4
  8570 0000415A 08C0                     or  al, al
  8571 0000415C 0F840600                 je @@getlex494
  8572 00004160 B80702                   mov ax, 519
  8573 00004163 E91801                   jmp @@retn
  8574                                  
  8575                                  ;-801     if (eqstr(symbol,"__emit__")) return T_EMIT;
  8576                                  
  8577                                  @@getlex494:
  8578 00004166 68[C342]                 push getlex_9
  8579 00004169 8D062B81                 lea  ax, [symbol]
  8580 0000416D 50                       push ax
  8581 0000416E E83AC0                   call eqstr
  8582 00004171 83C404                   add  sp, 4
  8583 00004174 08C0                     or  al, al
  8584 00004176 0F840600                 je @@getlex495
  8585 0000417A B80802                   mov ax, 520
  8586 0000417D E9FE00                   jmp @@retn
  8587                                  
  8588                                  ;-802     if (eqstr(symbol,"return"  )) return T_RETURN;
  8589                                  
  8590                                  @@getlex495:
  8591 00004180 68[CC42]                 push getlex_10
  8592 00004183 8D062B81                 lea  ax, [symbol]
  8593 00004187 50                       push ax
  8594 00004188 E820C0                   call eqstr
  8595 0000418B 83C404                   add  sp, 4
  8596 0000418E 08C0                     or  al, al
  8597 00004190 0F840600                 je @@getlex496
  8598 00004194 B80002                   mov ax, 512
  8599 00004197 E9E400                   jmp @@retn
  8600                                  
  8601                                  ;-803     if (eqstr(symbol,"if"      )) return T_IF;
  8602                                  
  8603                                  @@getlex496:
  8604 0000419A 68[D342]                 push getlex_11
  8605 0000419D 8D062B81                 lea  ax, [symbol]
  8606 000041A1 50                       push ax
  8607 000041A2 E806C0                   call eqstr
  8608 000041A5 83C404                   add  sp, 4
  8609 000041A8 08C0                     or  al, al
  8610 000041AA 0F840600                 je @@getlex497
  8611 000041AE B80102                   mov ax, 513
  8612 000041B1 E9CA00                   jmp @@retn
  8613                                  
  8614                                  ;-804     if (eqstr(symbol,"else"    )) return T_ELSE;
  8615                                  
  8616                                  @@getlex497:
  8617 000041B4 68[D642]                 push getlex_12
  8618 000041B7 8D062B81                 lea  ax, [symbol]
  8619 000041BB 50                       push ax
  8620 000041BC E8ECBF                   call eqstr
  8621 000041BF 83C404                   add  sp, 4
  8622 000041C2 08C0                     or  al, al
  8623 000041C4 0F840600                 je @@getlex498
  8624 000041C8 B80202                   mov ax, 514
  8625 000041CB E9B000                   jmp @@retn
  8626                                  
  8627                                  ;-805     if (eqstr(symbol,"while"   )) return T_WHILE;
  8628                                  
  8629                                  @@getlex498:
  8630 000041CE 68[DB42]                 push getlex_13
  8631 000041D1 8D062B81                 lea  ax, [symbol]
  8632 000041D5 50                       push ax
  8633 000041D6 E8D2BF                   call eqstr
  8634 000041D9 83C404                   add  sp, 4
  8635 000041DC 08C0                     or  al, al
  8636 000041DE 0F840600                 je @@getlex499
  8637 000041E2 B80302                   mov ax, 515
  8638 000041E5 E99600                   jmp @@retn
  8639                                  
  8640                                  ;-806     if (eqstr(symbol,"do"      )) return T_DO;
  8641                                  
  8642                                  @@getlex499:
  8643 000041E8 68[E142]                 push getlex_14
  8644 000041EB 8D062B81                 lea  ax, [symbol]
  8645 000041EF 50                       push ax
  8646 000041F0 E8B8BF                   call eqstr
  8647 000041F3 83C404                   add  sp, 4
  8648 000041F6 08C0                     or  al, al
  8649 000041F8 0F840600                 je @@getlex500
  8650 000041FC B80402                   mov ax, 516
  8651 000041FF E97C00                   jmp @@retn
  8652                                  
  8653                                  ;-807     if (eqstr(symbol,"goto"    )) return T_GOTO;
  8654                                  
  8655                                  @@getlex500:
  8656 00004202 68[E442]                 push getlex_15
  8657 00004205 8D062B81                 lea  ax, [symbol]
  8658 00004209 50                       push ax
  8659 0000420A E89EBF                   call eqstr
  8660 0000420D 83C404                   add  sp, 4
  8661 00004210 08C0                     or  al, al
  8662 00004212 0F840600                 je @@getlex501
  8663 00004216 B80902                   mov ax, 521
  8664 00004219 E96200                   jmp @@retn
  8665                                  
  8666                                  ;-808     if (eqstr(symbol,"define"  )) return T_DEFINE;   
  8667                                  
  8668                                  @@getlex501:
  8669 0000421C 68[E942]                 push getlex_16
  8670 0000421F 8D062B81                 lea  ax, [symbol]
  8671 00004223 50                       push ax
  8672 00004224 E884BF                   call eqstr
  8673 00004227 83C404                   add  sp, 4
  8674 0000422A 08C0                     or  al, al
  8675 0000422C 0F840600                 je @@getlex502
  8676 00004230 B8FF01                   mov ax, 511
  8677 00004233 E94800                   jmp @@retn
  8678                                  
  8679                                  ;-809     if (eqstr(symbol,"include" )) return T_INCLUDE;   
  8680                                  
  8681                                  @@getlex502:
  8682 00004236 68[F042]                 push getlex_17
  8683 00004239 8D062B81                 lea  ax, [symbol]
  8684 0000423D 50                       push ax
  8685 0000423E E86ABF                   call eqstr
  8686 00004241 83C404                   add  sp, 4
  8687 00004244 08C0                     or  al, al
  8688 00004246 0F840600                 je @@getlex503
  8689 0000424A B8FE01                   mov ax, 510
  8690 0000424D E92E00                   jmp @@retn
  8691                                  
  8692                                  ;-810     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}
  8693                                  
  8694                                  @@getlex503:
  8695 00004250 E8BF00                   call convertdefine
  8696 00004253 08C0                     or  al, al
  8697 00004255 0F841600                 je @@getlex504
  8698 00004259 8D06DCD0                 lea  ax, [symboltemp]
  8699 0000425D 50                       push ax
  8700 0000425E 8D062B81                 lea  ax, [symbol]
  8701 00004262 50                       push ax
  8702 00004263 E815BF                   call strcpy
  8703 00004266 83C404                   add  sp, 4
  8704 00004269 B80101                   mov ax, 257
  8705 0000426C E90F00                   jmp @@retn
  8706                                  
  8707                                  ;-811     return T_NAME; } error1("Input item not recognized"); }
  8708                                  
  8709                                  @@getlex504:
  8710 0000426F B80001                   mov ax, 256
  8711 00004272 E90900                   jmp @@retn
  8712                                  @@getlex484:
  8713 00004275 68[F842]                 push getlex_18
  8714 00004278 E84106                   call error1
  8715 0000427B 83C402                   add  sp, 2
  8716                                  
  8717                                  ;-812 
  8718                                  
  8719                                  
  8720                                  ;-813 int convertdefine() { int i; int j;   i=0;
  8721                                  
  8722 0000427E C9                      @@retn: LEAVE
  8723 0000427F C3                       ret
  8724                                  ; ENDP
  8725 00004280 28295B5D7B7D2C3B2A-     getlex_0 db "()[]{},;*:%-><=+!&|#?",0
  8726 00004289 3A252D3E3C3D2B2126-
  8727 00004292 7C233F00           
  8728 00004296 7369676E656400          getlex_1 db "signed",0
  8729 0000429D 756E7369676E656400      getlex_2 db "unsigned",0
  8730 000042A6 766F696400              getlex_3 db "void",0
  8731 000042AB 696E7400                getlex_4 db "int",0
  8732 000042AF 6C6F6E6700              getlex_5 db "long",0
  8733 000042B4 6368617200              getlex_6 db "char",0
  8734 000042B9 61736D00                getlex_7 db "asm",0
  8735 000042BD 5F5F61736D00            getlex_8 db "__asm",0
  8736 000042C3 5F5F656D69745F5F00      getlex_9 db "__emit__",0
  8737 000042CC 72657475726E00          getlex_10 db "return",0
  8738 000042D3 696600                  getlex_11 db "if",0
  8739 000042D6 656C736500              getlex_12 db "else",0
  8740 000042DB 7768696C6500            getlex_13 db "while",0
  8741 000042E1 646F00                  getlex_14 db "do",0
  8742 000042E4 676F746F00              getlex_15 db "goto",0
  8743 000042E9 646566696E6500          getlex_16 db "define",0
  8744 000042F0 696E636C75646500        getlex_17 db "include",0
  8745 000042F8 496E70757420697465-     getlex_18 db "Input item not recognized",0
  8746 00004301 6D206E6F7420726563-
  8747 0000430A 6F676E697A656400   
  8748                                  
  8749                                  convertdefine:  ; *** PROC ***
  8750                                  ;Function : convertdefine, Number of local variables: 2
  8751                                  ;   # type sign width addr used name   list of local variables
  8752                                  ;  200 var sign word   813 NULL i = bp-2
  8753                                  ;  201 var sign word   813 NULL j = bp-4;
  8754 00004312 C8040000                 ENTER  4,0
  8755 00004316 B80000                   mov ax, 0
  8756 00004319 8946FE                   mov [bp-2], ax
  8757                                  
  8758                                  ;-814   while (i < GTop) {
  8759                                  
  8760                                  @@convertdefine505:
  8761 0000431C 8B46FE                   mov ax, [bp-2]
  8762 0000431F 3B06[2A00]               cmp ax, [GTop]
  8763 00004323 0F8D4400                 jge @@convertdefine506
  8764                                  
  8765                                  ;-815    j=adrofname(i); 
  8766                                  
  8767 00004327 FF76FE                   push word [bp-2]
  8768 0000432A E869C6                   call adrofname
  8769 0000432D 83C402                   add  sp, 2
  8770 00004330 8946FC                   mov [bp-4], ax
  8771                                  
  8772                                  ;-816    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];
  8773                                  
  8774 00004333 FF76FC                   push word [bp-4]
  8775 00004336 8D062B81                 lea  ax, [symbol]
  8776 0000433A 50                       push ax
  8777 0000433B E86DBE                   call eqstr
  8778 0000433E 83C404                   add  sp, 4
  8779 00004341 08C0                     or  al, al
  8780 00004343 0F841F00                 je @@convertdefine507
  8781 00004347 8B5EFE                   mov bx, [bp-2]
  8782 0000434A 8A87B782                 mov al, [GType + bx]
  8783 0000434E 3C23                     cmp al, 35
  8784 00004350 0F851200                 jne @@convertdefine508
  8785 00004354 8B5EFE                   mov bx, [bp-2]
  8786 00004357 D1E3                     shl bx, 1
  8787 00004359 8B87EB8A                 mov ax, [GData + bx]
  8788 0000435D A3[2E00]                 mov word [lexval], ax
  8789                                  
  8790                                  ;-817    return T_CONST; } }
  8791                                  
  8792 00004360 B80101                   mov ax, 257
  8793 00004363 E90B00                   jmp @@retn
  8794                                  @@convertdefine508:
  8795                                  
  8796                                  ;-818    i++; } 
  8797                                  
  8798                                  @@convertdefine507:
  8799 00004366 FF46FE                   inc  word[bp-2]
  8800                                  
  8801                                  ;-819    return 0; }
  8802                                  
  8803 00004369 EBB1                     jmp @@convertdefine505
  8804                                  @@convertdefine506:
  8805 0000436B B80000                   mov ax, 0
  8806 0000436E E90000                   jmp @@retn
  8807                                  
  8808                                  ;-820 int getdigit(char c) { int i;
  8809                                  
  8810 00004371 C9                      @@retn: LEAVE
  8811 00004372 C3                       ret
  8812                                  ; ENDP
  8813                                  
  8814                                  getdigit:  ; *** PROC ***
  8815                                  
  8816                                  ;-821     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char
  8817                                  
  8818                                  ;Function : getdigit, Number of local variables: 2
  8819                                  ;   # type sign width addr used name   list of local variables
  8820                                  ;  200 var sign byte   820 NULL c = bp+4
  8821                                  ;  201 var sign word   820 NULL i = bp-2;
  8822 00004373 C8020000                 ENTER  2,0
  8823 00004377 B80000                   mov ax, 0
  8824 0000437A A3[2E00]                 mov word [lexval], ax
  8825 0000437D 8A4604                   mov al, [bp+4]
  8826 00004380 2C30                     sub al, 48
  8827 00004382 A3[2E00]                 mov word [lexval], ax
  8828                                  
  8829                                  ;-822     if (thechar=='x') thechar='X'; if (thechar=='X') { next();
  8830                                  
  8831 00004385 A0[2100]                 mov al, [thechar]
  8832 00004388 3C78                     cmp al, 120
  8833 0000438A 0F850600                 jne @@getdigit509
  8834 0000438E B85800                   mov ax, 88
  8835 00004391 A2[2100]                 mov byte [thechar], al
  8836                                  @@getdigit509:
  8837 00004394 A0[2100]                 mov al, [thechar]
  8838 00004397 3C58                     cmp al, 88
  8839 00004399 0F856800                 jne @@getdigit510
  8840 0000439D E8E000                   call next
  8841                                  
  8842                                  ;-823       while(letter(thechar)) { c=next(); if(c>96) c=c-39;
  8843                                  
  8844                                  @@getdigit511:
  8845 000043A0 A0[2100]                 mov al, byte [thechar]
  8846 000043A3 B400                     mov ah, 0
  8847 000043A5 50                       push ax
  8848 000043A6 E8A7BF                   call letter
  8849 000043A9 83C402                   add  sp, 2
  8850 000043AC 08C0                     or  al, al
  8851 000043AE 0F845000                 je @@getdigit512
  8852 000043B2 E8CB00                   call next
  8853 000043B5 884604                   mov [bp+4], al
  8854 000043B8 8A4604                   mov al, [bp+4]
  8855 000043BB 3C60                     cmp al, 96
  8856 000043BD 0F8E0800                 jle @@getdigit513
  8857 000043C1 8A4604                   mov al, [bp+4]
  8858 000043C4 2C27                     sub al, 39
  8859 000043C6 884604                   mov [bp+4], al
  8860                                  
  8861                                  ;-824 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16
  8862                                  
  8863                                  @@getdigit513:
  8864 000043C9 8A4604                   mov al, [bp+4]
  8865 000043CC 3C40                     cmp al, 64
  8866 000043CE 0F8E0800                 jle @@getdigit514
  8867 000043D2 8A4604                   mov al, [bp+4]
  8868 000043D5 2C07                     sub al, 7
  8869 000043D7 884604                   mov [bp+4], al
  8870                                  @@getdigit514:
  8871 000043DA 8A4604                   mov al, [bp+4]
  8872 000043DD 2C30                     sub al, 48
  8873 000043DF 884604                   mov [bp+4], al
  8874 000043E2 A1[2E00]                 mov ax, [lexval]
  8875 000043E5 C1E004                   shl ax, 4
  8876 000043E8 A3[2E00]                 mov word [lexval], ax
  8877                                  
  8878                                  ;-825      i=0; i=c; lexval=lexval+i;}
  8879                                  
  8880 000043EB B80000                   mov ax, 0
  8881 000043EE 8946FE                   mov [bp-2], ax
  8882 000043F1 8A4604                   mov al, [bp+4]
  8883 000043F4 8946FE                   mov [bp-2], ax
  8884 000043F7 A1[2E00]                 mov ax, [lexval]
  8885 000043FA 0346FE                   add ax, [bp-2]
  8886 000043FD A3[2E00]                 mov word [lexval], ax
  8887                                  
  8888                                  ;-826     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10; 
  8889                                  
  8890 00004400 EB9E                     jmp @@getdigit511
  8891                                  @@getdigit512:
  8892 00004402 E94200                   jmp @@getdigit515
  8893                                  @@getdigit510:
  8894                                  @@getdigit516:
  8895 00004405 A0[2100]                 mov al, byte [thechar]
  8896 00004408 B400                     mov ah, 0
  8897 0000440A 50                       push ax
  8898 0000440B E818BF                   call digit
  8899 0000440E 83C402                   add  sp, 2
  8900 00004411 08C0                     or  al, al
  8901 00004413 0F843000                 je @@getdigit517
  8902 00004417 E86600                   call next
  8903 0000441A 884604                   mov [bp+4], al
  8904 0000441D 8A4604                   mov al, [bp+4]
  8905 00004420 2C30                     sub al, 48
  8906 00004422 884604                   mov [bp+4], al
  8907 00004425 A1[2E00]                 mov ax, [lexval]
  8908 00004428 BB0A00                   mov bx, 10
  8909 0000442B F7E3                     mul bx
  8910 0000442D A3[2E00]                 mov word [lexval], ax
  8911                                  
  8912                                  ;-827      i=0; i=c; lexval=lexval+i; } } 
  8913                                  
  8914 00004430 B80000                   mov ax, 0
  8915 00004433 8946FE                   mov [bp-2], ax
  8916 00004436 8A4604                   mov al, [bp+4]
  8917 00004439 8946FE                   mov [bp-2], ax
  8918 0000443C A1[2E00]                 mov ax, [lexval]
  8919 0000443F 0346FE                   add ax, [bp-2]
  8920 00004442 A3[2E00]                 mov word [lexval], ax
  8921 00004445 EBBE                     jmp @@getdigit516
  8922                                  @@getdigit517:
  8923                                  
  8924                                  ;-828 }
  8925                                  
  8926                                  @@getdigit515:
  8927                                  
  8928                                  ;-829 int getstring(int delim) {int c; char *p;  p=&symbol; c=next();
  8929 00004447 C9                       LEAVE
  8930 00004448 C3                       ret
  8931                                  ; ENDP
  8932                                  
  8933                                  getstring:  ; *** PROC ***
  8934                                  ;Function : getstring, Number of local variables: 3
  8935                                  ;   # type sign width addr used name   list of local variables
  8936                                  ;  200 var sign word   829 NULL delim = bp+4
  8937                                  ;  201 var sign word   829 NULL c = bp-2
  8938                                  ;  202 ptr sign byte   829 NULL p = bp-4;
  8939 00004449 C8040000                 ENTER  4,0
  8940 0000444D B82B81                   mov ax, symbol
  8941 00004450 8946FC                   mov [bp-4], ax
  8942 00004453 E82A00                   call next
  8943 00004456 8946FE                   mov [bp-2], ax
  8944                                  
  8945                                  ;-830   while (c != delim) {*p=c; p++; c=next(); } *p=0; }
  8946                                  
  8947                                  @@getstring518:
  8948 00004459 8B46FE                   mov ax, [bp-2]
  8949 0000445C 3B4604                   cmp ax, [bp+4]
  8950 0000445F 0F841300                 je  @@getstring519
  8951 00004463 8B46FE                   mov ax, [bp-2]
  8952 00004466 8B5EFC                   mov  bx, [bp-4]
  8953 00004469 8807                     mov  [bx], al
  8954 0000446B FF46FC                   inc  word[bp-4]
  8955 0000446E E80F00                   call next
  8956 00004471 8946FE                   mov [bp-2], ax
  8957 00004474 EBE3                     jmp @@getstring518
  8958                                  @@getstring519:
  8959 00004476 B80000                   mov ax, 0
  8960 00004479 8B5EFC                   mov  bx, [bp-4]
  8961 0000447C 8807                     mov  [bx], al
  8962                                  
  8963                                  ;-831 
  8964                                  
  8965                                  
  8966                                  ;-832 int next() {char r; r = thechar; globC=r; thechar = fgets1(); return r; }
  8967 0000447E C9                       LEAVE
  8968 0000447F C3                       ret
  8969                                  ; ENDP
  8970                                  
  8971                                  next:  ; *** PROC ***
  8972                                  ;Function : next, Number of local variables: 1
  8973                                  ;   # type sign width addr used name   list of local variables
  8974                                  ;  200 var sign byte   832 NULL r = bp-2;
  8975 00004480 C8020000                 ENTER  2,0
  8976 00004484 A0[2100]                 mov al, [thechar]
  8977 00004487 8846FE                   mov [bp-2], al
  8978 0000448A 8A46FE                   mov al, [bp-2]
  8979 0000448D A2[1E00]                 mov byte [globC], al
  8980 00004490 E83303                   call fgets1
  8981 00004493 A2[2100]                 mov byte [thechar], al
  8982 00004496 8A46FE                   mov al, [bp-2]
  8983 00004499 E90000                   jmp @@retn
  8984                                  
  8985                                  ;-833 int istoken(int t) {if (token == t) { token=getlex(); return 1; } return 0;}
  8986                                  
  8987 0000449C C9                      @@retn: LEAVE
  8988 0000449D C3                       ret
  8989                                  ; ENDP
  8990                                  
  8991                                  istoken:  ; *** PROC ***
  8992                                  ;Function : istoken, Number of local variables: 1
  8993                                  ;   # type sign width addr used name   list of local variables
  8994                                  ;  200 var sign word   833 NULL t = bp+4;
  8995 0000449E C8000000                 ENTER  0,0
  8996 000044A2 A1[1C00]                 mov ax, [token]
  8997 000044A5 3B4604                   cmp ax, [bp+4]
  8998 000044A8 0F850C00                 jne @@istoken520
  8999 000044AC E8CBF8                   call getlex
  9000 000044AF A3[1C00]                 mov word [token], ax
  9001 000044B2 B80100                   mov ax, 1
  9002 000044B5 E90600                   jmp @@retn
  9003                                  @@istoken520:
  9004 000044B8 B80000                   mov ax, 0
  9005 000044BB E90000                   jmp @@retn
  9006                                  
  9007                                  ;-834 int expect(int t) {if (istoken(t)==0) { *cloc=0; prs(co); listproc();
  9008                                  
  9009 000044BE C9                      @@retn: LEAVE
  9010 000044BF C3                       ret
  9011                                  ; ENDP
  9012                                  
  9013                                  expect:  ; *** PROC ***
  9014                                  ;Function : expect, Number of local variables: 1
  9015                                  ;   # type sign width addr used name   list of local variables
  9016                                  ;  200 var sign word   834 NULL t = bp+4;
  9017 000044C0 C8000000                 ENTER  0,0
  9018 000044C4 FF7604                   push word [bp+4]
  9019 000044C7 E8D4FF                   call istoken
  9020 000044CA 83C402                   add  sp, 2
  9021 000044CD 83F800                   cmp ax, 0
  9022 000044D0 0F853200                 jne @@expect521
  9023 000044D4 B80000                   mov ax, 0
  9024 000044D7 8B1E[1600]               mov  bx, [cloc]
  9025 000044DB 8807                     mov  [bx], al
  9026 000044DD 8D063075                 lea  ax, [co]
  9027 000044E1 50                       push ax
  9028 000044E2 E8EE00                   call prs
  9029 000044E5 83C402                   add  sp, 2
  9030 000044E8 E8D304                   call listproc
  9031                                  
  9032                                  ;-835   prs("\nExpected ASCII(dez): "); pint1(t); error1(" not found"); } }
  9033                                  
  9034 000044EB 68[0845]                 push expect_0
  9035 000044EE E8E200                   call prs
  9036 000044F1 83C402                   add  sp, 2
  9037 000044F4 FF7604                   push word [bp+4]
  9038 000044F7 E8D001                   call pint1
  9039 000044FA 83C402                   add  sp, 2
  9040 000044FD 68[2045]                 push expect_1
  9041 00004500 E8B903                   call error1
  9042 00004503 83C402                   add  sp, 2
  9043                                  @@expect521:
  9044                                  
  9045                                  ;-836 
  9046                                  
  9047                                  
  9048                                  ;-837 int eprc(char c)  {*cloc=c; cloc++; }
  9049 00004506 C9                       LEAVE
  9050 00004507 C3                       ret
  9051                                  ; ENDP
  9052 00004508 5C6E45787065637465-     expect_0 db "\nExpected ASCII(dez): ",0
  9053 00004511 642041534349492864-
  9054 0000451A 657A293A2000       
  9055 00004520 206E6F7420666F756E-     expect_1 db " not found",0
  9056 00004529 6400               
  9057                                  
  9058                                  eprc:  ; *** PROC ***
  9059                                  ;Function : eprc, Number of local variables: 1
  9060                                  ;   # type sign width addr used name   list of local variables
  9061                                  ;  200 var sign byte   837 NULL c = bp+4;
  9062 0000452B C8000000                 ENTER  0,0
  9063 0000452F 8A4604                   mov al, [bp+4]
  9064 00004532 8B1E[1600]               mov  bx, [cloc]
  9065 00004536 8807                     mov  [bx], al
  9066 00004538 FF06[1600]               inc  word[cloc]
  9067                                  
  9068                                  ;-838 int eprs(char *s) {char c;  while(*s) { c=*s; eprc(c); s++; } }
  9069 0000453C C9                       LEAVE
  9070 0000453D C3                       ret
  9071                                  ; ENDP
  9072                                  
  9073                                  eprs:  ; *** PROC ***
  9074                                  ;Function : eprs, Number of local variables: 2
  9075                                  ;   # type sign width addr used name   list of local variables
  9076                                  ;  200 ptr sign byte   838 NULL s = bp+4
  9077                                  ;  201 var sign byte   838 NULL c = bp-2;
  9078 0000453E C8020000                 ENTER  2,0
  9079                                  @@eprs522:
  9080 00004542 8B5E04                   mov bx, [bp+4]
  9081 00004545 8A07                     mov al, [bx]
  9082 00004547 B400                     mov ah, 0
  9083 00004549 08C0                     or  al, al
  9084 0000454B 0F841B00                 je @@eprs523
  9085 0000454F 8B5E04                   mov bx, [bp+4]
  9086 00004552 8A07                     mov al, [bx]
  9087 00004554 B400                     mov ah, 0
  9088 00004556 8846FE                   mov [bp-2], al
  9089 00004559 8A46FE                   mov al, byte [bp-2]
  9090 0000455C B400                     mov ah, 0
  9091 0000455E 50                       push ax
  9092 0000455F E8C9FF                   call eprc
  9093 00004562 83C402                   add  sp, 2
  9094 00004565 FF4604                   inc  word[bp+4]
  9095 00004568 EBD8                     jmp @@eprs522
  9096                                  @@eprs523:
  9097                                  
  9098                                  ;-839 int prc(unsigned char c) { 
  9099 0000456A C9                       LEAVE
  9100 0000456B C3                       ret
  9101                                  ; ENDP
  9102                                  
  9103                                  prc:  ; *** PROC ***
  9104                                  
  9105                                  ;-840   if (c==10) {_AX=13; writetty(); }
  9106                                  
  9107                                  ;Function : prc, Number of local variables: 1
  9108                                  ;   # type sign width addr used name   list of local variables
  9109                                  ;  200 var unsg byte   839 NULL c = bp+4;
  9110 0000456C C8000000                 ENTER  0,0
  9111 00004570 8A4604                   mov al, [bp+4]
  9112 00004573 3C0A                     cmp al, 10
  9113 00004575 0F850600                 jne @@prc524
  9114 00004579 B80D00                   mov  ax, 13
  9115 0000457C E8F4BA                   call writetty
  9116                                  
  9117                                  ;-841   _AL=c; writetty(); 
  9118                                  
  9119                                  @@prc524:
  9120 0000457F 8A4604                   mov  al, [bp+4]
  9121 00004582 E8EEBA                   call writetty
  9122                                  
  9123                                  ;-842   fputcR(c, fdout); 
  9124                                  
  9125 00004585 FF36[1A00]               push word [fdout]
  9126 00004589 8A4604                   mov al, byte [bp+4]
  9127 0000458C B400                     mov ah, 0
  9128 0000458E 50                       push ax
  9129 0000458F E8ACBB                   call fputcR
  9130 00004592 83C404                   add  sp, 4
  9131                                  
  9132                                  ;-843   }
  9133                                  
  9134                                  
  9135                                  ;-844 int prscomment(unsigned char *s) {unsigned char c;
  9136 00004595 C9                       LEAVE
  9137 00004596 C3                       ret
  9138                                  ; ENDP
  9139                                  
  9140                                  prscomment:  ; *** PROC ***
  9141                                  
  9142                                  ;-845   while(*s){c=*s;prc(c);s++;} }
  9143                                  
  9144                                  ;Function : prscomment, Number of local variables: 2
  9145                                  ;   # type sign width addr used name   list of local variables
  9146                                  ;  200 ptr unsg byte   844 NULL s = bp+4
  9147                                  ;  201 var unsg byte   844 NULL c = bp-2;
  9148 00004597 C8020000                 ENTER  2,0
  9149                                  @@prscomment525:
  9150 0000459B 8B5E04                   mov bx, [bp+4]
  9151 0000459E 8A07                     mov al, [bx]
  9152 000045A0 B400                     mov ah, 0
  9153 000045A2 08C0                     or  al, al
  9154 000045A4 0F841B00                 je @@prscomment526
  9155 000045A8 8B5E04                   mov bx, [bp+4]
  9156 000045AB 8A07                     mov al, [bx]
  9157 000045AD B400                     mov ah, 0
  9158 000045AF 8846FE                   mov [bp-2], al
  9159 000045B2 8A46FE                   mov al, byte [bp-2]
  9160 000045B5 B400                     mov ah, 0
  9161 000045B7 50                       push ax
  9162 000045B8 E8B1FF                   call prc
  9163 000045BB 83C402                   add  sp, 2
  9164 000045BE FF4604                   inc  word[bp+4]
  9165 000045C1 EBD8                     jmp @@prscomment525
  9166                                  @@prscomment526:
  9167                                  
  9168                                  ;-846 int prnl() { prs("\n ");}
  9169 000045C3 C9                       LEAVE
  9170 000045C4 C3                       ret
  9171                                  ; ENDP
  9172                                  
  9173                                  prnl:  ; *** PROC ***
  9174 000045C5 68[CF45]                 push prnl_0
  9175 000045C8 E80800                   call prs
  9176 000045CB 83C402                   add  sp, 2
  9177                                  
  9178                                  ;-847 
  9179                                  
  9180                                  
  9181                                  ;-848 int prs(unsigned char *s) {unsigned char c; int com; com=0;
  9182                                  
  9183 000045CE C3                       ret
  9184                                  ; ENDP
  9185 000045CF 5C6E2000                prnl_0 db "\n ",0
  9186                                  
  9187                                  prs:  ; *** PROC ***
  9188                                  ;Function : prs, Number of local variables: 3
  9189                                  ;   # type sign width addr used name   list of local variables
  9190                                  ;  200 ptr unsg byte   848 NULL s = bp+4
  9191                                  ;  201 var unsg byte   848 NULL c = bp-2
  9192                                  ;  202 var sign word   848 NULL com = bp-4;
  9193 000045D3 C8040000                 ENTER  4,0
  9194 000045D7 B80000                   mov ax, 0
  9195 000045DA 8946FC                   mov [bp-4], ax
  9196                                  
  9197                                  ;-849   while(*s) { c=*s; if (c==34) if (com) com=0; else com=1;
  9198                                  
  9199                                  @@prs527:
  9200 000045DD 8B5E04                   mov bx, [bp+4]
  9201 000045E0 8A07                     mov al, [bx]
  9202 000045E2 B400                     mov ah, 0
  9203 000045E4 08C0                     or  al, al
  9204 000045E6 0F847B00                 je @@prs528
  9205 000045EA 8B5E04                   mov bx, [bp+4]
  9206 000045ED 8A07                     mov al, [bx]
  9207 000045EF B400                     mov ah, 0
  9208 000045F1 8846FE                   mov [bp-2], al
  9209 000045F4 8A46FE                   mov al, [bp-2]
  9210 000045F7 3C22                     cmp al, 34
  9211 000045F9 0F851800                 jne @@prs529
  9212 000045FD 8B46FC                   mov ax, [bp-4]
  9213 00004600 08C0                     or  al, al
  9214 00004602 0F840900                 je @@prs530
  9215 00004606 B80000                   mov ax, 0
  9216 00004609 8946FC                   mov [bp-4], ax
  9217 0000460C E90600                   jmp @@prs531
  9218                                  @@prs530:
  9219 0000460F B80100                   mov ax, 1
  9220 00004612 8946FC                   mov [bp-4], ax
  9221                                  
  9222                                  ;-850     if (c==92) { if (com==0) { s++; c=*s;
  9223                                  
  9224                                  @@prs531:
  9225                                  @@prs529:
  9226 00004615 8A46FE                   mov al, [bp-2]
  9227 00004618 3C5C                     cmp al, 92
  9228 0000461A 0F853500                 jne @@prs532
  9229 0000461E 8B46FC                   mov ax, [bp-4]
  9230 00004621 83F800                   cmp ax, 0
  9231 00004624 0F852B00                 jne @@prs533
  9232 00004628 FF4604                   inc  word[bp+4]
  9233 0000462B 8B5E04                   mov bx, [bp+4]
  9234 0000462E 8A07                     mov al, [bx]
  9235 00004630 B400                     mov ah, 0
  9236 00004632 8846FE                   mov [bp-2], al
  9237                                  
  9238                                  ;-851           if (c=='n') c=10; if (c=='t') c= 9;
  9239                                  
  9240 00004635 8A46FE                   mov al, [bp-2]
  9241 00004638 3C6E                     cmp al, 110
  9242 0000463A 0F850600                 jne @@prs534
  9243 0000463E B80A00                   mov ax, 10
  9244 00004641 8846FE                   mov [bp-2], al
  9245                                  @@prs534:
  9246 00004644 8A46FE                   mov al, [bp-2]
  9247 00004647 3C74                     cmp al, 116
  9248 00004649 0F850600                 jne @@prs535
  9249 0000464D B80900                   mov ax, 9
  9250 00004650 8846FE                   mov [bp-2], al
  9251                                  
  9252                                  ;-852     } } prc(c); s++;  } }
  9253                                  
  9254                                  @@prs535:
  9255                                  @@prs533:
  9256                                  @@prs532:
  9257 00004653 8A46FE                   mov al, byte [bp-2]
  9258 00004656 B400                     mov ah, 0
  9259 00004658 50                       push ax
  9260 00004659 E810FF                   call prc
  9261 0000465C 83C402                   add  sp, 2
  9262 0000465F FF4604                   inc  word[bp+4]
  9263 00004662 E978FF                   jmp @@prs527
  9264                                  @@prs528:
  9265                                  
  9266                                  ;-853 int eprnum(int n){int e; if(n<0) { eprc('-'); n=mkneg(n); }
  9267 00004665 C9                       LEAVE
  9268 00004666 C3                       ret
  9269                                  ; ENDP
  9270                                  
  9271                                  eprnum:  ; *** PROC ***
  9272                                  ;Function : eprnum, Number of local variables: 2
  9273                                  ;   # type sign width addr used name   list of local variables
  9274                                  ;  200 var sign word   853 NULL n = bp+4
  9275                                  ;  201 var sign word   853 NULL e = bp-2;
  9276 00004667 C8020000                 ENTER  2,0
  9277 0000466B 8B4604                   mov ax, [bp+4]
  9278 0000466E 83F800                   cmp ax, 0
  9279 00004671 0F8D1400                 jge @@eprnum536
  9280 00004675 6A2D                     push 45
  9281 00004677 E8B1FE                   call eprc
  9282 0000467A 83C402                   add  sp, 2
  9283 0000467D FF7604                   push word [bp+4]
  9284 00004680 E83FBA                   call mkneg
  9285 00004683 83C402                   add  sp, 2
  9286 00004686 894604                   mov [bp+4], ax
  9287                                  
  9288                                  ;-854   if (n >= 10) {e=n/10; eprnum(e);}  n=n%10; n=n+'0'; eprc(n); }
  9289                                  
  9290                                  @@eprnum536:
  9291 00004689 8B4604                   mov ax, [bp+4]
  9292 0000468C 83F80A                   cmp ax, 10 ;unsigned : 1
  9293 0000468F 0F8C1500                 jl  @@eprnum537
  9294 00004693 8B4604                   mov ax, [bp+4]
  9295 00004696 BB0A00                   mov bx, 10
  9296 00004699 99                       cwd
  9297 0000469A F7FB                     idiv bx
  9298 0000469C 8946FE                   mov [bp-2], ax
  9299 0000469F FF76FE                   push word [bp-2]
  9300 000046A2 E8C2FF                   call eprnum
  9301 000046A5 83C402                   add  sp, 2
  9302                                  @@eprnum537:
  9303 000046A8 8B4604                   mov ax, [bp+4]
  9304 000046AB BB0A00                   mov bx, 10
  9305 000046AE 99                       cwd
  9306 000046AF F7FB                     idiv bx
  9307 000046B1 89D0                     mov ax, dx
  9308 000046B3 894604                   mov [bp+4], ax
  9309 000046B6 8B4604                   mov ax, [bp+4]
  9310 000046B9 83C030                   add ax, 48
  9311 000046BC 894604                   mov [bp+4], ax
  9312 000046BF FF7604                   push word [bp+4]
  9313 000046C2 E866FE                   call eprc
  9314 000046C5 83C402                   add  sp, 2
  9315                                  
  9316                                  ;-855 int pint1 (int n){int e; if(n<0) {  prc('-');  n=mkneg(n); }
  9317 000046C8 C9                       LEAVE
  9318 000046C9 C3                       ret
  9319                                  ; ENDP
  9320                                  
  9321                                  pint1:  ; *** PROC ***
  9322                                  ;Function : pint1, Number of local variables: 2
  9323                                  ;   # type sign width addr used name   list of local variables
  9324                                  ;  200 var sign word   855 NULL n = bp+4
  9325                                  ;  201 var sign word   855 NULL e = bp-2;
  9326 000046CA C8020000                 ENTER  2,0
  9327 000046CE 8B4604                   mov ax, [bp+4]
  9328 000046D1 83F800                   cmp ax, 0
  9329 000046D4 0F8D1400                 jge @@pint1538
  9330 000046D8 6A2D                     push 45
  9331 000046DA E88FFE                   call prc
  9332 000046DD 83C402                   add  sp, 2
  9333 000046E0 FF7604                   push word [bp+4]
  9334 000046E3 E8DCB9                   call mkneg
  9335 000046E6 83C402                   add  sp, 2
  9336 000046E9 894604                   mov [bp+4], ax
  9337                                  
  9338                                  ;-856   if (n >= 10) {e=n/10;  pint1(e);}  n=n%10; n=n+'0'; prc(n); }
  9339                                  
  9340                                  @@pint1538:
  9341 000046EC 8B4604                   mov ax, [bp+4]
  9342 000046EF 83F80A                   cmp ax, 10 ;unsigned : 1
  9343 000046F2 0F8C1500                 jl  @@pint1539
  9344 000046F6 8B4604                   mov ax, [bp+4]
  9345 000046F9 BB0A00                   mov bx, 10
  9346 000046FC 99                       cwd
  9347 000046FD F7FB                     idiv bx
  9348 000046FF 8946FE                   mov [bp-2], ax
  9349 00004702 FF76FE                   push word [bp-2]
  9350 00004705 E8C2FF                   call pint1
  9351 00004708 83C402                   add  sp, 2
  9352                                  @@pint1539:
  9353 0000470B 8B4604                   mov ax, [bp+4]
  9354 0000470E BB0A00                   mov bx, 10
  9355 00004711 99                       cwd
  9356 00004712 F7FB                     idiv bx
  9357 00004714 89D0                     mov ax, dx
  9358 00004716 894604                   mov [bp+4], ax
  9359 00004719 8B4604                   mov ax, [bp+4]
  9360 0000471C 83C030                   add ax, 48
  9361 0000471F 894604                   mov [bp+4], ax
  9362 00004722 FF7604                   push word [bp+4]
  9363 00004725 E844FE                   call prc
  9364 00004728 83C402                   add  sp, 2
  9365                                  
  9366                                  ;-857 int prunsign1(unsigned int n) { unsigned int e;
  9367 0000472B C9                       LEAVE
  9368 0000472C C3                       ret
  9369                                  ; ENDP
  9370                                  
  9371                                  prunsign1:  ; *** PROC ***
  9372                                  
  9373                                  ;-858   if ( _ n >= 10) {  e=n/10; /*DIV*/ prunsign1(e); }
  9374                                  
  9375                                  ;Function : prunsign1, Number of local variables: 2
  9376                                  ;   # type sign width addr used name   list of local variables
  9377                                  ;  200 var unsg word   857 NULL n = bp+4
  9378                                  ;  201 var unsg word   857 NULL e = bp-2;
  9379 0000472D C8020000                 ENTER  2,0 ; constant expression
  9380 00004731 837E040A                cmp word[bp+4], 10 ;unsigned : 0
  9381 00004735 0F821700                 jb  @@prunsign1540
  9382 00004739 8B4604                   mov ax, [bp+4]
  9383 0000473C BB0A00                   mov bx, 10
  9384 0000473F BA0000                   mov dx, 0
  9385 00004742 F7F3                     div bx
  9386 00004744 8946FE                   mov [bp-2], ax
  9387 00004747 FF76FE                   push word [bp-2]
  9388 0000474A E8E0FF                   call prunsign1
  9389 0000474D 83C402                   add  sp, 2
  9390                                  
  9391                                  ;-859     n = n % 10; /*unsigned mod*/   n += '0'; prc(n); }
  9392                                  
  9393                                  @@prunsign1540:
  9394 00004750 8B4604                   mov ax, [bp+4]
  9395 00004753 BB0A00                   mov bx, 10
  9396 00004756 BA0000                   mov dx, 0
  9397 00004759 F7F3                     div bx
  9398 0000475B 89D0                     mov ax, dx
  9399 0000475D 894604                   mov [bp+4], ax
  9400 00004760 83460430                 add  word[bp+4], 48
  9401 00004764 FF7604                   push word [bp+4]
  9402 00004767 E802FE                   call prc
  9403 0000476A 83C402                   add  sp, 2
  9404                                  
  9405                                  ;-860 int printint51(unsigned int j)  {
  9406 0000476D C9                       LEAVE
  9407 0000476E C3                       ret
  9408                                  ; ENDP
  9409                                  
  9410                                  printint51:  ; *** PROC ***
  9411                                  
  9412                                  ;-861   if (j<10000) prc(32); if (j<1000) prc(32);  if (j<100) prc(32);
  9413                                  
  9414                                  ;Function : printint51, Number of local variables: 1
  9415                                  ;   # type sign width addr used name   list of local variables
  9416                                  ;  200 var unsg word   860 NULL j = bp+4;
  9417 0000476F C8000000                 ENTER  0,0
  9418 00004773 8B4604                   mov ax, [bp+4]
  9419 00004776 3D1027                   cmp ax, 10000
  9420 00004779 0F8D0800                 jge @@printint51541
  9421 0000477D 6A20                     push 32
  9422 0000477F E8EAFD                   call prc
  9423 00004782 83C402                   add  sp, 2
  9424                                  @@printint51541:
  9425 00004785 8B4604                   mov ax, [bp+4]
  9426 00004788 3DE803                   cmp ax, 1000
  9427 0000478B 0F8D0800                 jge @@printint51542
  9428 0000478F 6A20                     push 32
  9429 00004791 E8D8FD                   call prc
  9430 00004794 83C402                   add  sp, 2
  9431                                  @@printint51542:
  9432 00004797 8B4604                   mov ax, [bp+4]
  9433 0000479A 83F864                   cmp ax, 100
  9434 0000479D 0F8D0800                 jge @@printint51543
  9435 000047A1 6A20                     push 32
  9436 000047A3 E8C6FD                   call prc
  9437 000047A6 83C402                   add  sp, 2
  9438                                  
  9439                                  ;-862    if (j<10) prc(32);  prunsign1(j); }
  9440                                  
  9441                                  @@printint51543:
  9442 000047A9 8B4604                   mov ax, [bp+4]
  9443 000047AC 83F80A                   cmp ax, 10
  9444 000047AF 0F8D0800                 jge @@printint51544
  9445 000047B3 6A20                     push 32
  9446 000047B5 E8B4FD                   call prc
  9447 000047B8 83C402                   add  sp, 2
  9448                                  @@printint51544:
  9449 000047BB FF7604                   push word [bp+4]
  9450 000047BE E86CFF                   call prunsign1
  9451 000047C1 83C402                   add  sp, 2
  9452                                  
  9453                                  ;-863 
  9454                                  
  9455                                  
  9456                                  ;-864 int fgets1() { char c; c=*fgetsp;
  9457 000047C4 C9                       LEAVE
  9458 000047C5 C3                       ret
  9459                                  ; ENDP
  9460                                  
  9461                                  fgets1:  ; *** PROC ***
  9462                                  ;Function : fgets1, Number of local variables: 1
  9463                                  ;   # type sign width addr used name   list of local variables
  9464                                  ;  200 var sign byte   864 NULL c = bp-2;
  9465 000047C6 C8020000                 ENTER  2,0
  9466 000047CA 8B1E[6200]               mov bx, [fgetsp]
  9467 000047CE 8A07                     mov al, [bx]
  9468 000047D0 B400                     mov ah, 0
  9469 000047D2 8846FE                   mov [bp-2], al
  9470                                  
  9471                                  ;-865   if (c==0) { printinputline(); if (DOS_NoBytes == 0) return 0;
  9472                                  
  9473 000047D5 8A46FE                   mov al, [bp-2]
  9474 000047D8 3C00                     cmp al, 0
  9475 000047DA 0F852A00                 jne @@fgets1545
  9476 000047DE E83700                   call printinputline
  9477 000047E1 A1[7000]                 mov ax, [DOS_NoBytes]
  9478 000047E4 83F800                   cmp ax, 0
  9479 000047E7 0F850600                 jne @@fgets1546
  9480 000047EB B80000                   mov ax, 0
  9481 000047EE E92500                   jmp @@retn
  9482                                  
  9483                                  ;-866     fgetsp=&fgetsdest; c=*fgetsp; spalte=0; }
  9484                                  
  9485                                  @@fgets1546:
  9486 000047F1 B80FD0                   mov ax, fgetsdest
  9487 000047F4 A3[6200]                 mov word [fgetsp], ax
  9488 000047F7 8B1E[6200]               mov bx, [fgetsp]
  9489 000047FB 8A07                     mov al, [bx]
  9490 000047FD B400                     mov ah, 0
  9491 000047FF 8846FE                   mov [bp-2], al
  9492 00004802 B80000                   mov ax, 0
  9493 00004805 A3[1F00]                 mov word [spalte], ax
  9494                                  
  9495                                  ;-867   fgetsp++; spalte++;  return c; }
  9496                                  
  9497                                  @@fgets1545:
  9498 00004808 FF06[6200]               inc  word[fgetsp]
  9499 0000480C FF06[1F00]               inc  word[spalte]
  9500 00004810 8A46FE                   mov al, [bp-2]
  9501 00004813 E90000                   jmp @@retn
  9502                                  
  9503                                  ;-868 int printinputline() { fgetsp=&fgetsdest;
  9504                                  
  9505 00004816 C9                      @@retn: LEAVE
  9506 00004817 C3                       ret
  9507                                  ; ENDP
  9508                                  
  9509                                  printinputline:  ; *** PROC ***
  9510 00004818 B80FD0                   mov ax, fgetsdest
  9511 0000481B A3[6200]                 mov word [fgetsp], ax
  9512                                  
  9513                                  ;-869   do {DOS_NoBytes=readR(&DOS_ByteRead, fdin);
  9514                                  
  9515                                  @@printinputline547:
  9516 0000481E FF36[1800]               push word [fdin]
  9517 00004822 8D06[7200]               lea  ax, [DOS_ByteRead]
  9518 00004826 50                       push ax
  9519 00004827 E8EAB8                   call readR
  9520 0000482A 83C404                   add  sp, 4
  9521 0000482D A3[7000]                 mov word [DOS_NoBytes], ax
  9522                                  
  9523                                  ;-870   if (DOS_NoBytes == 0) return; 
  9524                                  
  9525 00004830 A1[7000]                 mov ax, [DOS_NoBytes]
  9526 00004833 83F800                   cmp ax, 0
  9527 00004836 0F850300                 jne @@printinputline548
  9528 0000483A E95400                   jmp @@retn
  9529                                  
  9530                                  ;-871     *fgetsp=DOS_ByteRead; fgetsp++;} 
  9531                                  
  9532                                  @@printinputline548:
  9533 0000483D A0[7200]                 mov al, [DOS_ByteRead]
  9534 00004840 8B1E[6200]               mov  bx, [fgetsp]
  9535 00004844 8807                     mov  [bx], al
  9536 00004846 FF06[6200]               inc  word[fgetsp]
  9537                                  
  9538                                  ;-872   while (DOS_ByteRead != 10); *fgetsp=0;
  9539                                  
  9540 0000484A A0[7200]                 mov al, [DOS_ByteRead]
  9541 0000484D 3C0A                     cmp al, 10
  9542 0000484F 0F840200                 je  @@printinputline549
  9543 00004853 EBC9                     jmp @@printinputline547
  9544                                  @@printinputline549:
  9545 00004855 B80000                   mov ax, 0
  9546 00004858 8B1E[6200]               mov  bx, [fgetsp]
  9547 0000485C 8807                     mov  [bx], al
  9548                                  
  9549                                  ;-873     if (fdout) { prs("\n\n;-"); prunsign1(lineno); prc(' '); lineno++;
  9550                                  
  9551 0000485E A1[1A00]                 mov ax, [fdout]
  9552 00004861 08C0                     or  al, al
  9553 00004863 0F842A00                 je @@printinputline550
  9554 00004867 68[9248]                 push printinputline_0
  9555 0000486A E866FD                   call prs
  9556 0000486D 83C402                   add  sp, 2
  9557 00004870 FF36[6600]               push word [lineno]
  9558 00004874 E8B6FE                   call prunsign1
  9559 00004877 83C402                   add  sp, 2
  9560 0000487A 6A20                     push 32
  9561 0000487C E8EDFC                   call prc
  9562 0000487F 83C402                   add  sp, 2
  9563 00004882 FF06[6600]               inc  word[lineno]
  9564                                  
  9565                                  ;-874       prscomment(&fgetsdest);}
  9566                                  
  9567 00004886 8D060FD0                 lea  ax, [fgetsdest]
  9568 0000488A 50                       push ax
  9569 0000488B E809FD                   call prscomment
  9570 0000488E 83C402                   add  sp, 2
  9571                                  
  9572                                  ;-875 }
  9573                                  
  9574                                  @@printinputline550:
  9575                                  
  9576                                  ;-876 int end1(int n) {fcloseR(fdin); fcloseR(fdout); exitR(n); }
  9577                                  
  9578                                  @@retn:
  9579 00004891 C3                       ret
  9580                                  ; ENDP
  9581 00004892 5C6E5C6E3B2D00          printinputline_0 db "\n\n;-",0
  9582                                  
  9583                                  end1:  ; *** PROC ***
  9584                                  ;Function : end1, Number of local variables: 1
  9585                                  ;   # type sign width addr used name   list of local variables
  9586                                  ;  200 var sign word   876 NULL n = bp+4;
  9587 00004899 C8000000                 ENTER  0,0
  9588 0000489D FF36[1800]               push word [fdin]
  9589 000048A1 E853B8                   call fcloseR
  9590 000048A4 83C402                   add  sp, 2
  9591 000048A7 FF36[1A00]               push word [fdout]
  9592 000048AB E849B8                   call fcloseR
  9593 000048AE 83C402                   add  sp, 2
  9594 000048B1 FF7604                   push word [bp+4]
  9595 000048B4 E84FB8                   call exitR
  9596 000048B7 83C402                   add  sp, 2
  9597                                  
  9598                                  ;-877 int error1(char *s) { 
  9599 000048BA C9                       LEAVE
  9600 000048BB C3                       ret
  9601                                  ; ENDP
  9602                                  
  9603                                  error1:  ; *** PROC ***
  9604                                  
  9605                                  ;-878   lineno--;
  9606                                  
  9607                                  ;Function : error1, Number of local variables: 1
  9608                                  ;   # type sign width addr used name   list of local variables
  9609                                  ;  200 ptr sign byte   877 NULL s = bp+4;
  9610 000048BC C8000000                 ENTER  0,0
  9611 000048C0 FF0E[6600]               dec  word[lineno]
  9612                                  
  9613                                  ;-879   prnl(); prscomment(&fgetsdest);
  9614                                  
  9615 000048C4 E8FEFC                   call prnl
  9616 000048C7 8D060FD0                 lea  ax, [fgetsdest]
  9617 000048CB 50                       push ax
  9618 000048CC E8C8FC                   call prscomment
  9619 000048CF 83C402                   add  sp, 2
  9620                                  
  9621                                  ;-880   prs(";Line: "); prunsign1(lineno);
  9622                                  
  9623 000048D2 68[6549]                 push error1_0
  9624 000048D5 E8FBFC                   call prs
  9625 000048D8 83C402                   add  sp, 2
  9626 000048DB FF36[6600]               push word [lineno]
  9627 000048DF E84BFE                   call prunsign1
  9628 000048E2 83C402                   add  sp, 2
  9629                                  
  9630                                  ;-881   prs(" ************** ERROR: "); prs(s);
  9631                                  
  9632 000048E5 68[6D49]                 push error1_1
  9633 000048E8 E8E8FC                   call prs
  9634 000048EB 83C402                   add  sp, 2
  9635 000048EE FF7604                   push word [bp+4]
  9636 000048F1 E8DFFC                   call prs
  9637 000048F4 83C402                   add  sp, 2
  9638                                  
  9639                                  ;-882   prs("  in column: "); pint1(spalte);
  9640                                  
  9641 000048F7 68[8549]                 push error1_2
  9642 000048FA E8D6FC                   call prs
  9643 000048FD 83C402                   add  sp, 2
  9644 00004900 FF36[1F00]               push word [spalte]
  9645 00004904 E8C3FD                   call pint1
  9646 00004907 83C402                   add  sp, 2
  9647                                  
  9648                                  ;-883   prs("\nToken: "); prunsign1(token); prs(", globC: "); prc(globC);
  9649                                  
  9650 0000490A 68[9349]                 push error1_3
  9651 0000490D E8C3FC                   call prs
  9652 00004910 83C402                   add  sp, 2
  9653 00004913 FF36[1C00]               push word [token]
  9654 00004917 E813FE                   call prunsign1
  9655 0000491A 83C402                   add  sp, 2
  9656 0000491D 68[9D49]                 push error1_4
  9657 00004920 E8B0FC                   call prs
  9658 00004923 83C402                   add  sp, 2
  9659 00004926 A0[1E00]                 mov al, byte [globC]
  9660 00004929 B400                     mov ah, 0
  9661 0000492B 50                       push ax
  9662 0000492C E83DFC                   call prc
  9663 0000492F 83C402                   add  sp, 2
  9664                                  
  9665                                  ;-884   prs(", thechar: "); pint1(thechar); prs(", symbol: "); prs(symbol);
  9666                                  
  9667 00004932 68[A749]                 push error1_5
  9668 00004935 E89BFC                   call prs
  9669 00004938 83C402                   add  sp, 2
  9670 0000493B A0[2100]                 mov al, byte [thechar]
  9671 0000493E B400                     mov ah, 0
  9672 00004940 50                       push ax
  9673 00004941 E886FD                   call pint1
  9674 00004944 83C402                   add  sp, 2
  9675 00004947 68[B349]                 push error1_6
  9676 0000494A E886FC                   call prs
  9677 0000494D 83C402                   add  sp, 2
  9678 00004950 8D062B81                 lea  ax, [symbol]
  9679 00004954 50                       push ax
  9680 00004955 E87BFC                   call prs
  9681 00004958 83C402                   add  sp, 2
  9682                                  
  9683                                  ;-885   end1(1); }
  9684                                  
  9685 0000495B 6A01                     push 1
  9686 0000495D E839FF                   call end1
  9687 00004960 83C402                   add  sp, 2
  9688                                  
  9689                                  ;-886 int listproc() {int i; 
  9690 00004963 C9                       LEAVE
  9691 00004964 C3                       ret
  9692                                  ; ENDP
  9693 00004965 3B4C696E653A2000        error1_0 db ";Line: ",0
  9694 0000496D 202A2A2A2A2A2A2A2A-     error1_1 db " ************** ERROR: ",0
  9695 00004976 2A2A2A2A2A2A204552-
  9696 0000497F 524F523A2000       
  9697 00004985 2020696E20636F6C75-     error1_2 db "  in column: ",0
  9698 0000498E 6D6E3A2000         
  9699 00004993 5C6E546F6B656E3A20-     error1_3 db "\nToken: ",0
  9700 0000499C 00                 
  9701 0000499D 2C20676C6F62433A20-     error1_4 db ", globC: ",0
  9702 000049A6 00                 
  9703 000049A7 2C2074686563686172-     error1_5 db ", thechar: ",0
  9704 000049B0 3A2000             
  9705 000049B3 2C2073796D626F6C3A-     error1_6 db ", symbol: ",0
  9706 000049BC 2000               
  9707                                  
  9708                                  listproc:  ; *** PROC ***
  9709                                  
  9710                                  ;-887   if (LTop > LSTART) {
  9711                                  
  9712                                  ;Function : listproc, Number of local variables: 1
  9713                                  ;   # type sign width addr used name   list of local variables
  9714                                  ;  200 var sign word   886 NULL i = bp-2;
  9715 000049BE C8020000                 ENTER  2,0
  9716 000049C2 A1[2C00]                 mov ax, [LTop]
  9717 000049C5 3DC800                   cmp ax, 200
  9718 000049C8 0F8E5700                 jle @@listproc551
  9719                                  
  9720                                  ;-888   prs("\n;Function : "); prs(fname);
  9721                                  
  9722 000049CC 68[254A]                 push listproc_0
  9723 000049CF E801FC                   call prs
  9724 000049D2 83C402                   add  sp, 2
  9725 000049D5 8D06AB81                 lea  ax, [fname]
  9726 000049D9 50                       push ax
  9727 000049DA E8F6FB                   call prs
  9728 000049DD 83C402                   add  sp, 2
  9729                                  
  9730                                  ;-889   prs(", Number of local variables: "); i=LTop - LSTART; prunsign1(i);
  9731                                  
  9732 000049E0 68[344A]                 push listproc_1
  9733 000049E3 E8EDFB                   call prs
  9734 000049E6 83C402                   add  sp, 2
  9735 000049E9 A1[2C00]                 mov ax, [LTop]
  9736 000049EC 2DC800                   sub ax, 200
  9737 000049EF 8946FE                   mov [bp-2], ax
  9738 000049F2 FF76FE                   push word [bp-2]
  9739 000049F5 E835FD                   call prunsign1
  9740 000049F8 83C402                   add  sp, 2
  9741                                  
  9742                                  ;-890   prs("\n;   # type sign width addr used name   list of local variables");
  9743                                  
  9744 000049FB 68[524A]                 push listproc_2
  9745 000049FE E8D2FB                   call prs
  9746 00004A01 83C402                   add  sp, 2
  9747                                  
  9748                                  ;-891     i=LSTART; 
  9749                                  
  9750 00004A04 B8C800                   mov ax, 200
  9751 00004A07 8946FE                   mov [bp-2], ax
  9752                                  
  9753                                  ;-892     while (i < LTop) { listvar(i); i++; } } 
  9754                                  
  9755                                  @@listproc552:
  9756 00004A0A 8B46FE                   mov ax, [bp-2]
  9757 00004A0D 3B06[2C00]               cmp ax, [LTop]
  9758 00004A11 0F8D0E00                 jge @@listproc553
  9759 00004A15 FF76FE                   push word [bp-2]
  9760 00004A18 E87800                   call listvar
  9761 00004A1B 83C402                   add  sp, 2
  9762 00004A1E FF46FE                   inc  word[bp-2]
  9763 00004A21 EBE7                     jmp @@listproc552
  9764                                  @@listproc553:
  9765                                  
  9766                                  ;-893 }
  9767                                  
  9768                                  @@listproc551:
  9769                                  
  9770                                  ;-894 int listvar(unsigned int i) {unsigned int j; char c;
  9771 00004A23 C9                       LEAVE
  9772 00004A24 C3                       ret
  9773                                  ; ENDP
  9774 00004A25 5C6E3B46756E637469-     listproc_0 db "\n;Function : ",0
  9775 00004A2E 6F6E203A2000       
  9776 00004A34 2C204E756D62657220-     listproc_1 db ", Number of local variables: ",0
  9777 00004A3D 6F66206C6F63616C20-
  9778 00004A46 7661726961626C6573-
  9779 00004A4F 3A2000             
  9780 00004A52 5C6E3B202020232074-     listproc_2 db "\n;   # type sign width addr used name   list of local variables",0
  9781 00004A5B 797065207369676E20-
  9782 00004A64 776964746820616464-
  9783 00004A6D 722075736564206E61-
  9784 00004A76 6D652020206C697374-
  9785 00004A7F 206F66206C6F63616C-
  9786 00004A88 207661726961626C65-
  9787 00004A91 7300               
  9788                                  
  9789                                  listvar:  ; *** PROC ***
  9790                                  
  9791                                  ;-895   prs("\n;"); printint51(i); prc(32);
  9792                                  
  9793                                  ;Function : listvar, Number of local variables: 3
  9794                                  ;   # type sign width addr used name   list of local variables
  9795                                  ;  200 var unsg word   894 NULL i = bp+4
  9796                                  ;  201 var unsg word   894 NULL j = bp-2
  9797                                  ;  202 var sign byte   894 NULL c = bp-4;
  9798 00004A93 C8040000                 ENTER  4,0
  9799 00004A97 68[7F4C]                 push listvar_0
  9800 00004A9A E836FB                   call prs
  9801 00004A9D 83C402                   add  sp, 2
  9802 00004AA0 FF7604                   push word [bp+4]
  9803 00004AA3 E8C9FC                   call printint51
  9804 00004AA6 83C402                   add  sp, 2
  9805 00004AA9 6A20                     push 32
  9806 00004AAB E8BEFA                   call prc
  9807 00004AAE 83C402                   add  sp, 2
  9808                                  
  9809                                  ;-896   c=GType [i]; if(c=='V')prs("var ");   if(c=='*')prs("ptr ");
  9810                                  
  9811 00004AB1 8B5E04                   mov bx, [bp+4]
  9812 00004AB4 8A87B782                 mov al, [GType + bx]
  9813 00004AB8 8846FC                   mov [bp-4], al
  9814 00004ABB 8A46FC                   mov al, [bp-4]
  9815 00004ABE 3C56                     cmp al, 86
  9816 00004AC0 0F850900                 jne @@listvar554
  9817 00004AC4 68[834C]                 push listvar_1
  9818 00004AC7 E809FB                   call prs
  9819 00004ACA 83C402                   add  sp, 2
  9820                                  @@listvar554:
  9821 00004ACD 8A46FC                   mov al, [bp-4]
  9822 00004AD0 3C2A                     cmp al, 42
  9823 00004AD2 0F850900                 jne @@listvar555
  9824 00004AD6 68[884C]                 push listvar_2
  9825 00004AD9 E8F7FA                   call prs
  9826 00004ADC 83C402                   add  sp, 2
  9827                                  
  9828                                  ;-897                if(c=='&')prs("arr ");   if(c=='#')prs("def ");
  9829                                  
  9830                                  @@listvar555:
  9831 00004ADF 8A46FC                   mov al, [bp-4]
  9832 00004AE2 3C26                     cmp al, 38
  9833 00004AE4 0F850900                 jne @@listvar556
  9834 00004AE8 68[8D4C]                 push listvar_3
  9835 00004AEB E8E5FA                   call prs
  9836 00004AEE 83C402                   add  sp, 2
  9837                                  @@listvar556:
  9838 00004AF1 8A46FC                   mov al, [bp-4]
  9839 00004AF4 3C23                     cmp al, 35
  9840 00004AF6 0F850900                 jne @@listvar557
  9841 00004AFA 68[924C]                 push listvar_4
  9842 00004AFD E8D3FA                   call prs
  9843 00004B00 83C402                   add  sp, 2
  9844                                  
  9845                                  ;-898   c=GSign [i]; if(c=='S')prs("sign ");  if(c=='U')prs("unsg ");
  9846                                  
  9847                                  @@listvar557:
  9848 00004B03 8B5E04                   mov bx, [bp+4]
  9849 00004B06 8A87E383                 mov al, [GSign + bx]
  9850 00004B0A 8846FC                   mov [bp-4], al
  9851 00004B0D 8A46FC                   mov al, [bp-4]
  9852 00004B10 3C53                     cmp al, 83
  9853 00004B12 0F850900                 jne @@listvar558
  9854 00004B16 68[974C]                 push listvar_5
  9855 00004B19 E8B7FA                   call prs
  9856 00004B1C 83C402                   add  sp, 2
  9857                                  @@listvar558:
  9858 00004B1F 8A46FC                   mov al, [bp-4]
  9859 00004B22 3C55                     cmp al, 85
  9860 00004B24 0F850900                 jne @@listvar559
  9861 00004B28 68[9D4C]                 push listvar_6
  9862 00004B2B E8A5FA                   call prs
  9863 00004B2E 83C402                   add  sp, 2
  9864                                  
  9865                                  ;-899   c=GWidth[i]; if(c==  1)prs("byte " ); if(c==  2)prs("word " );
  9866                                  
  9867                                  @@listvar559:
  9868 00004B31 8B5E04                   mov bx, [bp+4]
  9869 00004B34 8A870F85                 mov al, [GWidth + bx]
  9870 00004B38 8846FC                   mov [bp-4], al
  9871 00004B3B 8A46FC                   mov al, [bp-4]
  9872 00004B3E 3C01                     cmp al, 1
  9873 00004B40 0F850900                 jne @@listvar560
  9874 00004B44 68[A34C]                 push listvar_7
  9875 00004B47 E889FA                   call prs
  9876 00004B4A 83C402                   add  sp, 2
  9877                                  @@listvar560:
  9878 00004B4D 8A46FC                   mov al, [bp-4]
  9879 00004B50 3C02                     cmp al, 2
  9880 00004B52 0F850900                 jne @@listvar561
  9881 00004B56 68[A94C]                 push listvar_8
  9882 00004B59 E877FA                   call prs
  9883 00004B5C 83C402                   add  sp, 2
  9884                                  
  9885                                  ;-900                if(c==  4)prs("dwrd " );
  9886                                  
  9887                                  @@listvar561:
  9888 00004B5F 8A46FC                   mov al, [bp-4]
  9889 00004B62 3C04                     cmp al, 4
  9890 00004B64 0F850900                 jne @@listvar562
  9891 00004B68 68[AF4C]                 push listvar_9
  9892 00004B6B E865FA                   call prs
  9893 00004B6E 83C402                   add  sp, 2
  9894                                  
  9895                                  ;-901   j=GAdr[i]; printint51(j);
  9896                                  
  9897                                  @@listvar562:
  9898 00004B71 8B5E04                   mov bx, [bp+4]
  9899 00004B74 D1E3                     shl bx, 1
  9900 00004B76 8B873B86                 mov ax, [GAdr + bx]
  9901 00004B7A 8946FE                   mov [bp-2], ax
  9902 00004B7D FF76FE                   push word [bp-2]
  9903 00004B80 E8ECFB                   call printint51
  9904 00004B83 83C402                   add  sp, 2
  9905                                  
  9906                                  ;-902   j=GUsed[i]; if (j) printint51(j);
  9907                                  
  9908 00004B86 8B5E04                   mov bx, [bp+4]
  9909 00004B89 D1E3                     shl bx, 1
  9910 00004B8B 8B879388                 mov ax, [GUsed + bx]
  9911 00004B8F 8946FE                   mov [bp-2], ax
  9912 00004B92 8B46FE                   mov ax, [bp-2]
  9913 00004B95 08C0                     or  al, al
  9914 00004B97 0F840C00                 je @@listvar563
  9915 00004B9B FF76FE                   push word [bp-2]
  9916 00004B9E E8CEFB                   call printint51
  9917 00004BA1 83C402                   add  sp, 2
  9918                                  
  9919                                  ;-903   else {if(GType[i]=='#') prs("    -"); else prs(" NULL");}
  9920                                  
  9921 00004BA4 E92200                   jmp @@listvar564
  9922                                  @@listvar563:
  9923 00004BA7 8B5E04                   mov bx, [bp+4]
  9924 00004BAA 8A87B782                 mov al, [GType + bx]
  9925 00004BAE 3C23                     cmp al, 35
  9926 00004BB0 0F850C00                 jne @@listvar565
  9927 00004BB4 68[B54C]                 push listvar_10
  9928 00004BB7 E819FA                   call prs
  9929 00004BBA 83C402                   add  sp, 2
  9930 00004BBD E90900                   jmp @@listvar566
  9931                                  @@listvar565:
  9932 00004BC0 68[BB4C]                 push listvar_11
  9933 00004BC3 E80DFA                   call prs
  9934 00004BC6 83C402                   add  sp, 2
  9935                                  @@listvar566:
  9936                                  
  9937                                  ;-904   prc(32);  pt=adrofname(i); prs(pt);
  9938                                  
  9939                                  @@listvar564:
  9940 00004BC9 6A20                     push 32
  9941 00004BCB E89EF9                   call prc
  9942 00004BCE 83C402                   add  sp, 2
  9943 00004BD1 FF7604                   push word [bp+4]
  9944 00004BD4 E8BFBD                   call adrofname
  9945 00004BD7 83C402                   add  sp, 2
  9946 00004BDA A3[6A00]                 mov word [pt], ax
  9947 00004BDD FF36[6A00]               push word [pt]
  9948 00004BE1 E8EFF9                   call prs
  9949 00004BE4 83C402                   add  sp, 2
  9950                                  
  9951                                  ;-905   if(GType[i]=='#') { prc('='); j=GData[i]; prunsign1(j); }
  9952                                  
  9953 00004BE7 8B5E04                   mov bx, [bp+4]
  9954 00004BEA 8A87B782                 mov al, [GType + bx]
  9955 00004BEE 3C23                     cmp al, 35
  9956 00004BF0 0F851D00                 jne @@listvar567
  9957 00004BF4 6A3D                     push 61
  9958 00004BF6 E873F9                   call prc
  9959 00004BF9 83C402                   add  sp, 2
  9960 00004BFC 8B5E04                   mov bx, [bp+4]
  9961 00004BFF D1E3                     shl bx, 1
  9962 00004C01 8B87EB8A                 mov ax, [GData + bx]
  9963 00004C05 8946FE                   mov [bp-2], ax
  9964 00004C08 FF76FE                   push word [bp-2]
  9965 00004C0B E81FFB                   call prunsign1
  9966 00004C0E 83C402                   add  sp, 2
  9967                                  
  9968                                  ;-906   if(GType[i]=='&') { prc('['); j=GData[i]; prunsign1(j); prc(']');}
  9969                                  
  9970                                  @@listvar567:
  9971 00004C11 8B5E04                   mov bx, [bp+4]
  9972 00004C14 8A87B782                 mov al, [GType + bx]
  9973 00004C18 3C26                     cmp al, 38
  9974 00004C1A 0F852500                 jne @@listvar568
  9975 00004C1E 6A5B                     push 91
  9976 00004C20 E849F9                   call prc
  9977 00004C23 83C402                   add  sp, 2
  9978 00004C26 8B5E04                   mov bx, [bp+4]
  9979 00004C29 D1E3                     shl bx, 1
  9980 00004C2B 8B87EB8A                 mov ax, [GData + bx]
  9981 00004C2F 8946FE                   mov [bp-2], ax
  9982 00004C32 FF76FE                   push word [bp-2]
  9983 00004C35 E8F5FA                   call prunsign1
  9984 00004C38 83C402                   add  sp, 2
  9985 00004C3B 6A5D                     push 93
  9986 00004C3D E82CF9                   call prc
  9987 00004C40 83C402                   add  sp, 2
  9988                                  
  9989                                  ;-907   if (i >= LSTART) { prs(" = bp"); j=GData[i];
  9990                                  
  9991                                  @@listvar568:
  9992 00004C43 8B4604                   mov ax, [bp+4]
  9993 00004C46 3DC800                   cmp ax, 200 ;unsigned : 0
  9994 00004C49 0F823000                 jb  @@listvar569
  9995 00004C4D 68[C14C]                 push listvar_12
  9996 00004C50 E880F9                   call prs
  9997 00004C53 83C402                   add  sp, 2
  9998 00004C56 8B5E04                   mov bx, [bp+4]
  9999 00004C59 D1E3                     shl bx, 1
 10000 00004C5B 8B87EB8A                 mov ax, [GData + bx]
 10001 00004C5F 8946FE                   mov [bp-2], ax
 10002                                  
 10003                                  ;-908     if (j > 0) prc('+'); pint1(j);  }
 10004                                  
 10005 00004C62 8B46FE                   mov ax, [bp-2]
 10006 00004C65 83F800                   cmp ax, 0
 10007 00004C68 0F8E0800                 jle @@listvar570
 10008 00004C6C 6A2B                     push 43
 10009 00004C6E E8FBF8                   call prc
 10010 00004C71 83C402                   add  sp, 2
 10011                                  @@listvar570:
 10012 00004C74 FF76FE                   push word [bp-2]
 10013 00004C77 E850FA                   call pint1
 10014 00004C7A 83C402                   add  sp, 2
 10015                                  
 10016                                  ;-909 }
 10017                                  
 10018                                  @@listvar569:
 10019                                  
 10020                                  ;-910 int listcall() { int i;
 10021 00004C7D C9                       LEAVE
 10022 00004C7E C3                       ret
 10023                                  ; ENDP
 10024 00004C7F 5C6E3B00                listvar_0 db "\n;",0
 10025 00004C83 7661722000              listvar_1 db "var ",0
 10026 00004C88 7074722000              listvar_2 db "ptr ",0
 10027 00004C8D 6172722000              listvar_3 db "arr ",0
 10028 00004C92 6465662000              listvar_4 db "def ",0
 10029 00004C97 7369676E2000            listvar_5 db "sign ",0
 10030 00004C9D 756E73672000            listvar_6 db "unsg ",0
 10031 00004CA3 627974652000            listvar_7 db "byte ",0
 10032 00004CA9 776F72642000            listvar_8 db "word ",0
 10033 00004CAF 647772642000            listvar_9 db "dwrd ",0
 10034 00004CB5 202020202D00            listvar_10 db "    -",0
 10035 00004CBB 204E554C4C00            listvar_11 db " NULL",0
 10036 00004CC1 203D20627000            listvar_12 db " = bp",0
 10037                                  
 10038                                  listcall:  ; *** PROC ***
 10039                                  
 10040                                  ;-911   prs("\n\n;    #  addr name   list of CALLs\n");
 10041                                  
 10042                                  ;Function : listcall, Number of local variables: 1
 10043                                  ;   # type sign width addr used name   list of local variables
 10044                                  ;  200 var sign word   910 NULL i = bp-2;
 10045 00004CC7 C8020000                 ENTER  2,0
 10046 00004CCB 68[F54C]                 push listcall_0
 10047 00004CCE E802F9                   call prs
 10048 00004CD1 83C402                   add  sp, 2
 10049                                  
 10050                                  ;-912   i=0;  while (i< CTop) { calllisting(i); i++; } }
 10051                                  
 10052 00004CD4 B80000                   mov ax, 0
 10053 00004CD7 8946FE                   mov [bp-2], ax
 10054                                  @@listcall571:
 10055 00004CDA 8B46FE                   mov ax, [bp-2]
 10056 00004CDD 3B06[3D00]               cmp ax, [CTop]
 10057 00004CE1 0F8D0E00                 jge @@listcall572
 10058 00004CE5 FF76FE                   push word [bp-2]
 10059 00004CE8 E83200                   call calllisting
 10060 00004CEB 83C402                   add  sp, 2
 10061 00004CEE FF46FE                   inc  word[bp-2]
 10062 00004CF1 EBE7                     jmp @@listcall571
 10063                                  @@listcall572:
 10064                                  
 10065                                  ;-913 int calllisting(int i) {char c; int j;
 10066 00004CF3 C9                       LEAVE
 10067 00004CF4 C3                       ret
 10068                                  ; ENDP
 10069 00004CF5 5C6E5C6E3B20202020-     listcall_0 db "\n\n;    #  addr name   list of CALLs\n",0
 10070 00004CFE 23202061646472206E-
 10071 00004D07 616D652020206C6973-
 10072 00004D10 74206F662043414C4C-
 10073 00004D19 735C6E00           
 10074                                  
 10075                                  calllisting:  ; *** PROC ***
 10076                                  
 10077                                  ;-914   prs("\n;"); printint51(i); prc(32);
 10078                                  
 10079                                  ;Function : calllisting, Number of local variables: 3
 10080                                  ;   # type sign width addr used name   list of local variables
 10081                                  ;  200 var sign word   913 NULL i = bp+4
 10082                                  ;  201 var sign byte   913 NULL c = bp-2
 10083                                  ;  202 var sign word   913 NULL j = bp-4;
 10084 00004D1D C8040000                 ENTER  4,0
 10085 00004D21 68[8F4D]                 push calllisting_0
 10086 00004D24 E8ACF8                   call prs
 10087 00004D27 83C402                   add  sp, 2
 10088 00004D2A FF7604                   push word [bp+4]
 10089 00004D2D E83FFA                   call printint51
 10090 00004D30 83C402                   add  sp, 2
 10091 00004D33 6A20                     push 32
 10092 00004D35 E834F8                   call prc
 10093 00004D38 83C402                   add  sp, 2
 10094                                  
 10095                                  ;-915   c=CType [i]; if(c==0)prs("unresolved ");
 10096                                  
 10097 00004D3B 8B5E04                   mov bx, [bp+4]
 10098 00004D3E 8A872FA1                 mov al, [CType + bx]
 10099 00004D42 8846FE                   mov [bp-2], al
 10100 00004D45 8A46FE                   mov al, [bp-2]
 10101 00004D48 3C00                     cmp al, 0
 10102 00004D4A 0F850900                 jne @@calllisting573
 10103 00004D4E 68[934D]                 push calllisting_1
 10104 00004D51 E87FF8                   call prs
 10105 00004D54 83C402                   add  sp, 2
 10106                                  
 10107                                  ;-916   j=CAdr[i];            printint51(j); prc(32);
 10108                                  
 10109                                  @@calllisting573:
 10110 00004D57 8B5E04                   mov bx, [bp+4]
 10111 00004D5A D1E3                     shl bx, 1
 10112 00004D5C 8B8757AB                 mov ax, [CAdr + bx]
 10113 00004D60 8946FC                   mov [bp-4], ax
 10114 00004D63 FF76FC                   push word [bp-4]
 10115 00004D66 E806FA                   call printint51
 10116 00004D69 83C402                   add  sp, 2
 10117 00004D6C 6A20                     push 32
 10118 00004D6E E8FBF7                   call prc
 10119 00004D71 83C402                   add  sp, 2
 10120                                  
 10121                                  ;-917   from_far(NameA, j);   prs(NameA);
 10122                                  
 10123 00004D74 FF76FC                   push word [bp-4]
 10124 00004D77 8D06[3F00]               lea  ax, [NameA]
 10125 00004D7B 50                       push ax
 10126 00004D7C E8B206                   call from_far
 10127 00004D7F 83C404                   add  sp, 4
 10128 00004D82 8D06[3F00]               lea  ax, [NameA]
 10129 00004D86 50                       push ax
 10130 00004D87 E849F8                   call prs
 10131 00004D8A 83C402                   add  sp, 2
 10132                                  
 10133                                  ;-918 }
 10134                                  
 10135                                  
 10136                                  ;-919 int countcalls(int f) { unsigned int i;
 10137 00004D8D C9                       LEAVE
 10138 00004D8E C3                       ret
 10139                                  ; ENDP
 10140 00004D8F 5C6E3B00                calllisting_0 db "\n;",0
 10141 00004D93 756E7265736F6C7665-     calllisting_1 db "unresolved ",0
 10142 00004D9C 642000             
 10143                                  
 10144                                  countcalls:  ; *** PROC ***
 10145                                  
 10146                                  ;-920   pt=adrF(FNameField, f);
 10147                                  
 10148                                  ;Function : countcalls, Number of local variables: 2
 10149                                  ;   # type sign width addr used name   list of local variables
 10150                                  ;  200 var sign word   919 NULL f = bp+4
 10151                                  ;  201 var unsg word   919 NULL i = bp-2;
 10152 00004D9F C8020000                 ENTER  2,0
 10153 00004DA3 FF7604                   push word [bp+4]
 10154 00004DA6 8D064FBD                 lea  ax, [FNameField]
 10155 00004DAA 50                       push ax
 10156 00004DAB E8FCBB                   call adrF
 10157 00004DAE 83C404                   add  sp, 4
 10158 00004DB1 A3[6A00]                 mov word [pt], ax
 10159                                  
 10160                                  ;-921   i=0;  while (i < CTop) {
 10161                                  
 10162 00004DB4 B80000                   mov ax, 0
 10163 00004DB7 8946FE                   mov [bp-2], ax
 10164                                  @@countcalls574:
 10165 00004DBA 8B46FE                   mov ax, [bp-2]
 10166 00004DBD 3B06[3D00]               cmp ax, [CTop]
 10167 00004DC1 0F8D4A00                 jge @@countcalls575
 10168                                  
 10169                                  ;-922     p1=CAdr[i];
 10170                                  
 10171 00004DC5 8B5EFE                   mov bx, [bp-2]
 10172 00004DC8 D1E3                     shl bx, 1
 10173 00004DCA 8B8757AB                 mov ax, [CAdr + bx]
 10174 00004DCE A3[6C00]                 mov word [p1], ax
 10175                                  
 10176                                  ;-923     from_far(NameA, p1);
 10177                                  
 10178 00004DD1 FF36[6C00]               push word [p1]
 10179 00004DD5 8D06[3F00]               lea  ax, [NameA]
 10180 00004DD9 50                       push ax
 10181 00004DDA E85406                   call from_far
 10182 00004DDD 83C404                   add  sp, 4
 10183                                  
 10184                                  ;-924     if (eqstr(pt,NameA))  FCalls[f] = FCalls[f] + 1;
 10185                                  
 10186 00004DE0 8D06[3F00]               lea  ax, [NameA]
 10187 00004DE4 50                       push ax
 10188 00004DE5 FF36[6A00]               push word [pt]
 10189 00004DE9 E8BFB3                   call eqstr
 10190 00004DEC 83C404                   add  sp, 4
 10191 00004DEF 08C0                     or  al, al
 10192 00004DF1 0F841500                 je @@countcalls576
 10193 00004DF5 8B5E04                   mov bx, [bp+4]
 10194 00004DF8 D1E3                     shl bx, 1
 10195 00004DFA 8B87F7BA                 mov ax, [FCalls + bx]
 10196 00004DFE 83C001                   add ax, 1
 10197 00004E01 8B5E04                   mov bx, [bp+4]
 10198 00004E04 D1E3                     shl bx, 1
 10199 00004E06 8987F7BA                 mov [FCalls+bx], ax
 10200                                  
 10201                                  ;-925     i++; }
 10202                                  
 10203                                  @@countcalls576:
 10204 00004E0A FF46FE                   inc  word[bp-2]
 10205                                  
 10206                                  ;-926 }
 10207                                  
 10208 00004E0D EBAB                     jmp @@countcalls574
 10209                                  @@countcalls575:
 10210                                  
 10211                                  ;-927 int listfunc() { int i;
 10212 00004E0F C9                       LEAVE
 10213 00004E10 C3                       ret
 10214                                  ; ENDP
 10215                                  
 10216                                  listfunc:  ; *** PROC ***
 10217                                  
 10218                                  ;-928   prs("\n\n\n;   # Calls Line Width  Name   list of functions\n");
 10219                                  
 10220                                  ;Function : listfunc, Number of local variables: 1
 10221                                  ;   # type sign width addr used name   list of local variables
 10222                                  ;  200 var sign word   927 NULL i = bp-2;
 10223 00004E11 C8020000                 ENTER  2,0
 10224 00004E15 68[5E4E]                 push listfunc_0
 10225 00004E18 E8B8F7                   call prs
 10226 00004E1B 83C402                   add  sp, 2
 10227                                  
 10228                                  ;-929   i=0;  while (i < FTop) { countcalls (i); i++; } 
 10229                                  
 10230 00004E1E B80000                   mov ax, 0
 10231 00004E21 8946FE                   mov [bp-2], ax
 10232                                  @@listfunc577:
 10233 00004E24 8B46FE                   mov ax, [bp-2]
 10234 00004E27 3B06[3B00]               cmp ax, [FTop]
 10235 00004E2B 0F8D0E00                 jge @@listfunc578
 10236 00004E2F FF76FE                   push word [bp-2]
 10237 00004E32 E86AFF                   call countcalls
 10238 00004E35 83C402                   add  sp, 2
 10239 00004E38 FF46FE                   inc  word[bp-2]
 10240                                  
 10241                                  ;-930   i=0;  while (i < FTop) { funclisting(i); i++; } }
 10242                                  
 10243 00004E3B EBE7                     jmp @@listfunc577
 10244                                  @@listfunc578:
 10245 00004E3D B80000                   mov ax, 0
 10246 00004E40 8946FE                   mov [bp-2], ax
 10247                                  @@listfunc579:
 10248 00004E43 8B46FE                   mov ax, [bp-2]
 10249 00004E46 3B06[3B00]               cmp ax, [FTop]
 10250 00004E4A 0F8D0E00                 jge @@listfunc580
 10251 00004E4E FF76FE                   push word [bp-2]
 10252 00004E51 E84300                   call funclisting
 10253 00004E54 83C402                   add  sp, 2
 10254 00004E57 FF46FE                   inc  word[bp-2]
 10255 00004E5A EBE7                     jmp @@listfunc579
 10256                                  @@listfunc580:
 10257                                  
 10258                                  ;-931 int funclisting(int i) {int j;  char c;
 10259 00004E5C C9                       LEAVE
 10260 00004E5D C3                       ret
 10261                                  ; ENDP
 10262 00004E5E 5C6E5C6E5C6E3B2020-     listfunc_0 db "\n\n\n;   # Calls Line Width  Name   list of functions\n",0
 10263 00004E67 20232043616C6C7320-
 10264 00004E70 4C696E652057696474-
 10265 00004E79 6820204E616D652020-
 10266 00004E82 206C697374206F6620-
 10267 00004E8B 66756E6374696F6E73-
 10268 00004E94 5C6E00             
 10269                                  
 10270                                  funclisting:  ; *** PROC ***
 10271                                  
 10272                                  ;-932   prs("\n;");    printint51(i);
 10273                                  
 10274                                  ;Function : funclisting, Number of local variables: 3
 10275                                  ;   # type sign width addr used name   list of local variables
 10276                                  ;  200 var sign word   931 NULL i = bp+4
 10277                                  ;  201 var sign word   931 NULL j = bp-2
 10278                                  ;  202 var sign byte   931 NULL c = bp-4;
 10279 00004E97 C8040000                 ENTER  4,0
 10280 00004E9B 68[734F]                 push funclisting_0
 10281 00004E9E E832F7                   call prs
 10282 00004EA1 83C402                   add  sp, 2
 10283 00004EA4 FF7604                   push word [bp+4]
 10284 00004EA7 E8C5F8                   call printint51
 10285 00004EAA 83C402                   add  sp, 2
 10286                                  
 10287                                  ;-933   j = FCalls[i]; if (j) printint51(j); else prs(" NULL");
 10288                                  
 10289 00004EAD 8B5E04                   mov bx, [bp+4]
 10290 00004EB0 D1E3                     shl bx, 1
 10291 00004EB2 8B87F7BA                 mov ax, [FCalls + bx]
 10292 00004EB6 8946FE                   mov [bp-2], ax
 10293 00004EB9 8B46FE                   mov ax, [bp-2]
 10294 00004EBC 08C0                     or  al, al
 10295 00004EBE 0F840C00                 je @@funclisting581
 10296 00004EC2 FF76FE                   push word [bp-2]
 10297 00004EC5 E8A7F8                   call printint51
 10298 00004EC8 83C402                   add  sp, 2
 10299 00004ECB E90900                   jmp @@funclisting582
 10300                                  @@funclisting581:
 10301 00004ECE 68[774F]                 push funclisting_1
 10302 00004ED1 E8FFF6                   call prs
 10303 00004ED4 83C402                   add  sp, 2
 10304                                  
 10305                                  ;-934   j = FAdr[i];   printint51(j); prc(32);
 10306                                  
 10307                                  @@funclisting582:
 10308 00004ED7 8B5E04                   mov bx, [bp+4]
 10309 00004EDA D1E3                     shl bx, 1
 10310 00004EDC 8B87FFA8                 mov ax, [FAdr + bx]
 10311 00004EE0 8946FE                   mov [bp-2], ax
 10312 00004EE3 FF76FE                   push word [bp-2]
 10313 00004EE6 E886F8                   call printint51
 10314 00004EE9 83C402                   add  sp, 2
 10315 00004EEC 6A20                     push 32
 10316 00004EEE E87BF6                   call prc
 10317 00004EF1 83C402                   add  sp, 2
 10318                                  
 10319                                  ;-935   c=FType[i];
 10320                                  
 10321 00004EF4 8B5E04                   mov bx, [bp+4]
 10322 00004EF7 8A8703A0                 mov al, [FType + bx]
 10323 00004EFB 8846FC                   mov [bp-4], al
 10324                                  
 10325                                  ;-936   if(c=='V')prs("void " );    if(c=='B')prs("byte " );
 10326                                  
 10327 00004EFE 8A46FC                   mov al, [bp-4]
 10328 00004F01 3C56                     cmp al, 86
 10329 00004F03 0F850900                 jne @@funclisting583
 10330 00004F07 68[7D4F]                 push funclisting_2
 10331 00004F0A E8C6F6                   call prs
 10332 00004F0D 83C402                   add  sp, 2
 10333                                  @@funclisting583:
 10334 00004F10 8A46FC                   mov al, [bp-4]
 10335 00004F13 3C42                     cmp al, 66
 10336 00004F15 0F850900                 jne @@funclisting584
 10337 00004F19 68[834F]                 push funclisting_3
 10338 00004F1C E8B4F6                   call prs
 10339 00004F1F 83C402                   add  sp, 2
 10340                                  
 10341                                  ;-937   if(c=='W')prs("word " );    if(c=='D')prs("dwrd " );
 10342                                  
 10343                                  @@funclisting584:
 10344 00004F22 8A46FC                   mov al, [bp-4]
 10345 00004F25 3C57                     cmp al, 87
 10346 00004F27 0F850900                 jne @@funclisting585
 10347 00004F2B 68[894F]                 push funclisting_4
 10348 00004F2E E8A2F6                   call prs
 10349 00004F31 83C402                   add  sp, 2
 10350                                  @@funclisting585:
 10351 00004F34 8A46FC                   mov al, [bp-4]
 10352 00004F37 3C44                     cmp al, 68
 10353 00004F39 0F850900                 jne @@funclisting586
 10354 00004F3D 68[8F4F]                 push funclisting_5
 10355 00004F40 E890F6                   call prs
 10356 00004F43 83C402                   add  sp, 2
 10357                                  
 10358                                  ;-938   prc(32); prc(32);
 10359                                  
 10360                                  @@funclisting586:
 10361 00004F46 6A20                     push 32
 10362 00004F48 E821F6                   call prc
 10363 00004F4B 83C402                   add  sp, 2
 10364 00004F4E 6A20                     push 32
 10365 00004F50 E819F6                   call prc
 10366 00004F53 83C402                   add  sp, 2
 10367                                  
 10368                                  ;-939   pt=adrF(FNameField, i); prs(pt);
 10369                                  
 10370 00004F56 FF7604                   push word [bp+4]
 10371 00004F59 8D064FBD                 lea  ax, [FNameField]
 10372 00004F5D 50                       push ax
 10373 00004F5E E849BA                   call adrF
 10374 00004F61 83C404                   add  sp, 4
 10375 00004F64 A3[6A00]                 mov word [pt], ax
 10376 00004F67 FF36[6A00]               push word [pt]
 10377 00004F6B E865F6                   call prs
 10378 00004F6E 83C402                   add  sp, 2
 10379                                  
 10380                                  ;-940 }
 10381                                  
 10382                                  
 10383                                  ;-941 unsigned int MAXUI=65535;
 10384 00004F71 C9                       LEAVE
 10385 00004F72 C3                       ret
 10386                                  ; ENDP
 10387 00004F73 5C6E3B00                funclisting_0 db "\n;",0
 10388 00004F77 204E554C4C00            funclisting_1 db " NULL",0
 10389 00004F7D 766F69642000            funclisting_2 db "void ",0
 10390 00004F83 627974652000            funclisting_3 db "byte ",0
 10391 00004F89 776F72642000            funclisting_4 db "word ",0
 10392 00004F8F 647772642000            funclisting_5 db "dwrd ",0
 10393 00004F95 FFFF                    MAXUI dw 65535
 10394                                  
 10395                                  ;-942 int epilog() {unsigned int i; 
 10396                                  
 10397                                  
 10398                                  epilog:  ; *** PROC ***
 10399                                  
 10400                                  ;-943   strcpy(symbol, "LastFunctionByt");  storefunc();
 10401                                  
 10402                                  ;Function : epilog, Number of local variables: 1
 10403                                  ;   # type sign width addr used name   list of local variables
 10404                                  ;  200 var unsg word   942 NULL i = bp-2;
 10405 00004F97 C8020000                 ENTER  2,0
 10406 00004F9B 68[C851]                 push epilog_0
 10407 00004F9E 8D062B81                 lea  ax, [symbol]
 10408 00004FA2 50                       push ax
 10409 00004FA3 E8D5B1                   call strcpy
 10410 00004FA6 83C404                   add  sp, 4
 10411 00004FA9 E8D9BC                   call storefunc
 10412                                  
 10413                                  ;-944   prs("\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret");
 10414                                  
 10415 00004FAC 68[D851]                 push epilog_1
 10416 00004FAF E821F6                   call prs
 10417 00004FB2 83C402                   add  sp, 2
 10418                                  
 10419                                  ;-945   prs("\n \n;   # type sign width  adr used name   list of global variables\n");
 10420                                  
 10421 00004FB5 68[0552]                 push epilog_2
 10422 00004FB8 E818F6                   call prs
 10423 00004FBB 83C402                   add  sp, 2
 10424                                  
 10425                                  ;-946   i=1;
 10426                                  
 10427 00004FBE B80100                   mov ax, 1
 10428 00004FC1 8946FE                   mov [bp-2], ax
 10429                                  
 10430                                  ;-947   while (i< GTop) { listvar(i); i++; }
 10431                                  
 10432                                  @@epilog587:
 10433 00004FC4 8B46FE                   mov ax, [bp-2]
 10434 00004FC7 3B06[2A00]               cmp ax, [GTop]
 10435 00004FCB 0F8D0E00                 jge @@epilog588
 10436 00004FCF FF76FE                   push word [bp-2]
 10437 00004FD2 E8BEFA                   call listvar
 10438 00004FD5 83C402                   add  sp, 2
 10439 00004FD8 FF46FE                   inc  word[bp-2]
 10440                                  
 10441                                  ;-948   listfunc();   listcall();
 10442                                  
 10443 00004FDB EBE7                     jmp @@epilog587
 10444                                  @@epilog588:
 10445 00004FDD E831FE                   call listfunc
 10446 00004FE0 E8E4FC                   call listcall
 10447                                  
 10448                                  ;-949 
 10449                                  
 10450                                  
 10451                                  ;-950   prs("\n;Input: "); prs(&namein);
 10452                                  
 10453 00004FE3 68[4C52]                 push epilog_3
 10454 00004FE6 E8EAF5                   call prs
 10455 00004FE9 83C402                   add  sp, 2
 10456 00004FEC 8D06EE81                 lea  ax, [namein]
 10457 00004FF0 50                       push ax
 10458 00004FF1 E8DFF5                   call prs
 10459 00004FF4 83C402                   add  sp, 2
 10460                                  
 10461                                  ;-951   prs(", List: ");   prs(&namelst);
 10462                                  
 10463 00004FF7 68[5752]                 push epilog_4
 10464 00004FFA E8D6F5                   call prs
 10465 00004FFD 83C402                   add  sp, 2
 10466 00005000 8D063182                 lea  ax, [namelst]
 10467 00005004 50                       push ax
 10468 00005005 E8CBF5                   call prs
 10469 00005008 83C402                   add  sp, 2
 10470                                  
 10471                                  ;-952   prs(",  Lines:"); printint51(lineno);
 10472                                  
 10473 0000500B 68[6052]                 push epilog_5
 10474 0000500E E8C2F5                   call prs
 10475 00005011 83C402                   add  sp, 2
 10476 00005014 FF36[6600]               push word [lineno]
 10477 00005018 E854F7                   call printint51
 10478 0000501B 83C402                   add  sp, 2
 10479                                  
 10480                                  ;-953   prs("\n;Glob. variables:"); GTop--; printint51(GTop);
 10481                                  
 10482 0000501E 68[6A52]                 push epilog_6
 10483 00005021 E8AFF5                   call prs
 10484 00005024 83C402                   add  sp, 2
 10485 00005027 FF0E[2A00]               dec  word[GTop]
 10486 0000502B FF36[2A00]               push word [GTop]
 10487 0000502F E83DF7                   call printint51
 10488 00005032 83C402                   add  sp, 2
 10489                                  
 10490                                  ;-954   prs(" max.:"); printint51(LSTART);
 10491                                  
 10492 00005035 68[7E52]                 push epilog_7
 10493 00005038 E898F5                   call prs
 10494 0000503B 83C402                   add  sp, 2
 10495 0000503E 68C800                   push 200
 10496 00005041 E82BF7                   call printint51
 10497 00005044 83C402                   add  sp, 2
 10498                                  
 10499                                  ;-955   prs("\n;Functions      :"); printint51(FTop);
 10500                                  
 10501 00005047 68[8552]                 push epilog_8
 10502 0000504A E886F5                   call prs
 10503 0000504D 83C402                   add  sp, 2
 10504 00005050 FF36[3B00]               push word [FTop]
 10505 00005054 E818F7                   call printint51
 10506 00005057 83C402                   add  sp, 2
 10507                                  
 10508                                  ;-956   prs(" max.:"); printint51(FUNCMAX);
 10509                                  
 10510 0000505A 68[9952]                 push epilog_9
 10511 0000505D E873F5                   call prs
 10512 00005060 83C402                   add  sp, 2
 10513 00005063 682C01                   push 300
 10514 00005066 E806F7                   call printint51
 10515 00005069 83C402                   add  sp, 2
 10516                                  
 10517                                  ;-957   prs("\n;Calls          :"); printint51(CTop);
 10518                                  
 10519 0000506C 68[A052]                 push epilog_10
 10520 0000506F E861F5                   call prs
 10521 00005072 83C402                   add  sp, 2
 10522 00005075 FF36[3D00]               push word [CTop]
 10523 00005079 E8F3F6                   call printint51
 10524 0000507C 83C402                   add  sp, 2
 10525                                  
 10526                                  ;-958   prs(" max.:"); printint51(CALLMAX);
 10527                                  
 10528 0000507F 68[B452]                 push epilog_11
 10529 00005082 E84EF5                   call prs
 10530 00005085 83C402                   add  sp, 2
 10531 00005088 68D007                   push 2000
 10532 0000508B E8E1F6                   call printint51
 10533 0000508E 83C402                   add  sp, 2
 10534                                  
 10535                                  ;-959   prs(", NameField:"); printint51(CNameTop);
 10536                                  
 10537 00005091 68[BB52]                 push epilog_12
 10538 00005094 E83CF5                   call prs
 10539 00005097 83C402                   add  sp, 2
 10540 0000509A FF36[6000]               push word [CNameTop]
 10541 0000509E E8CEF6                   call printint51
 10542 000050A1 83C402                   add  sp, 2
 10543                                  
 10544                                  ;-960   prs(" max.:"); printint51(65535);
 10545                                  
 10546 000050A4 68[C852]                 push epilog_13
 10547 000050A7 E829F5                   call prs
 10548 000050AA 83C402                   add  sp, 2
 10549 000050AD 6AFF                     push -1
 10550 000050AF E8BDF6                   call printint51
 10551 000050B2 83C402                   add  sp, 2
 10552                                  
 10553                                  ;-961 //  prs(", segE:"); printint51(segE);
 10554                                  
 10555                                  
 10556                                  ;-962   __asm{call LastFunctionByt}  _ i=ax;
 10557                                  
 10558 000050B5 E89903                  call LastFunctionByt
 10559 000050B8 8946FE                  mov [bp-2], ax
 10560                                  
 10561                                  ;-963   prs("\n;Code until     :"); printint51(i);
 10562                                  
 10563 000050BB 68[CF52]                 push epilog_14
 10564 000050BE E812F5                   call prs
 10565 000050C1 83C402                   add  sp, 2
 10566 000050C4 FF76FE                   push word [bp-2]
 10567 000050C7 E8A5F6                   call printint51
 10568 000050CA 83C402                   add  sp, 2
 10569                                  
 10570                                  ;-964   prs(" max.: "); printint51(ORGDATAORIG); i=ORGDATAORIG-i; prs(", free:");
 10571                                  
 10572 000050CD 68[E352]                 push epilog_15
 10573 000050D0 E800F5                   call prs
 10574 000050D3 83C402                   add  sp, 2
 10575 000050D6 FF36[0E00]               push word [ORGDATAORIG]
 10576 000050DA E892F6                   call printint51
 10577 000050DD 83C402                   add  sp, 2
 10578 000050E0 A1[0E00]                 mov ax, [ORGDATAORIG]
 10579 000050E3 2B46FE                   sub ax, [bp-2]
 10580 000050E6 8946FE                   mov [bp-2], ax
 10581 000050E9 68[EB52]                 push epilog_16
 10582 000050EC E8E4F4                   call prs
 10583 000050EF 83C402                   add  sp, 2
 10584                                  
 10585                                  ;-965   printint51(i); if (i <= 1000)prs(" *** Warning *** Code area too small");
 10586                                  
 10587 000050F2 FF76FE                   push word [bp-2]
 10588 000050F5 E877F6                   call printint51
 10589 000050F8 83C402                   add  sp, 2
 10590 000050FB 8B46FE                   mov ax, [bp-2]
 10591 000050FE 3DE803                   cmp ax, 1000
 10592 00005101 0F870900                 ja  @@epilog589
 10593 00005105 68[F352]                 push epilog_17
 10594 00005108 E8C8F4                   call prs
 10595 0000510B 83C402                   add  sp, 2
 10596                                  
 10597                                  ;-966   prs("\n;Data (HeapEnd) :"); prunsign1(orgData); i=MAXUI-orgData;
 10598                                  
 10599                                  @@epilog589:
 10600 0000510E 68[1853]                 push epilog_18
 10601 00005111 E8BFF4                   call prs
 10602 00005114 83C402                   add  sp, 2
 10603 00005117 FF36[1000]               push word [orgData]
 10604 0000511B E80FF6                   call prunsign1
 10605 0000511E 83C402                   add  sp, 2
 10606 00005121 A1[954F]                 mov ax, [MAXUI]
 10607 00005124 2B06[1000]               sub ax, [orgData]
 10608 00005128 8946FE                   mov [bp-2], ax
 10609                                  
 10610                                  ;-967   prs(", resting stacksize: ");printint51(i);
 10611                                  
 10612 0000512B 68[2C53]                 push epilog_19
 10613 0000512E E8A2F4                   call prs
 10614 00005131 83C402                   add  sp, 2
 10615 00005134 FF76FE                   push word [bp-2]
 10616 00005137 E835F6                   call printint51
 10617 0000513A 83C402                   add  sp, 2
 10618                                  
 10619                                  ;-968   if (i <= 5000) prs(" *** Warning *** Stack too small");
 10620                                  
 10621 0000513D 8B46FE                   mov ax, [bp-2]
 10622 00005140 3D8813                   cmp ax, 5000
 10623 00005143 0F870900                 ja  @@epilog590
 10624 00005147 68[4253]                 push epilog_20
 10625 0000514A E886F4                   call prs
 10626 0000514D 83C402                   add  sp, 2
 10627                                  
 10628                                  ;-969   prs("\n;Max. Const in '"); prs(coname); prs("' :"); printint51(maxco);
 10629                                  
 10630                                  @@epilog590:
 10631 00005150 68[6353]                 push epilog_21
 10632 00005153 E87DF4                   call prs
 10633 00005156 83C402                   add  sp, 2
 10634 00005159 8D06E880                 lea  ax, [coname]
 10635 0000515D 50                       push ax
 10636 0000515E E872F4                   call prs
 10637 00005161 83C402                   add  sp, 2
 10638 00005164 68[7653]                 push epilog_22
 10639 00005167 E869F4                   call prs
 10640 0000516A 83C402                   add  sp, 2
 10641 0000516D FF36[1200]               push word [maxco]
 10642 00005171 E8FBF5                   call printint51
 10643 00005174 83C402                   add  sp, 2
 10644                                  
 10645                                  ;-970   prs(" max."); printint51(COMAX); i=COMAX; i=i-maxco; prs(", free:");
 10646                                  
 10647 00005177 68[7A53]                 push epilog_23
 10648 0000517A E856F4                   call prs
 10649 0000517D 83C402                   add  sp, 2
 10650 00005180 68B80B                   push 3000
 10651 00005183 E8E9F5                   call printint51
 10652 00005186 83C402                   add  sp, 2
 10653 00005189 B8B80B                   mov ax, 3000
 10654 0000518C 8946FE                   mov [bp-2], ax
 10655 0000518F 8B46FE                   mov ax, [bp-2]
 10656 00005192 2B06[1200]               sub ax, [maxco]
 10657 00005196 8946FE                   mov [bp-2], ax
 10658 00005199 68[8053]                 push epilog_24
 10659 0000519C E834F4                   call prs
 10660 0000519F 83C402                   add  sp, 2
 10661                                  
 10662                                  ;-971   printint51(i);if (i <= 1000)prs(" *** Warning *** constant area too small");
 10663                                  
 10664 000051A2 FF76FE                   push word [bp-2]
 10665 000051A5 E8C7F5                   call printint51
 10666 000051A8 83C402                   add  sp, 2
 10667 000051AB 8B46FE                   mov ax, [bp-2]
 10668 000051AE 3DE803                   cmp ax, 1000
 10669 000051B1 0F870900                 ja  @@epilog591
 10670 000051B5 68[8853]                 push epilog_25
 10671 000051B8 E818F4                   call prs
 10672 000051BB 83C402                   add  sp, 2
 10673                                  
 10674                                  ;-972   end1(0);}
 10675                                  
 10676                                  @@epilog591:
 10677 000051BE 6A00                     push 0
 10678 000051C0 E8D6F6                   call end1
 10679 000051C3 83C402                   add  sp, 2
 10680                                  
 10681                                  ;-973 // while(expr) stmt; do stmt while(expr); FOR: i=0; while(i<10){stmt; i++;}
 10682                                  
 10683                                  
 10684                                  ;-974 int setblock(unsigned int i) {
 10685 000051C6 C9                       LEAVE
 10686 000051C7 C3                       ret
 10687                                  ; ENDP
 10688 000051C8 4C61737446756E6374-     epilog_0 db "LastFunctionByt",0
 10689 000051D1 696F6E42797400     
 10690 000051D8 5C6E4C61737446756E-     epilog_1 db "\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret",0
 10691 000051E1 6374696F6E4279743A-
 10692 000051EA 646220304538682C20-
 10693 000051F3 302C20305C6E706F70-
 10694 000051FC 2061785C6E72657400 
 10695 00005205 5C6E205C6E3B202020-     epilog_2 db "\n \n;   # type sign width  adr used name   list of global variables\n",0
 10696 0000520E 232074797065207369-
 10697 00005217 676E20776964746820-
 10698 00005220 206164722075736564-
 10699 00005229 206E616D652020206C-
 10700 00005232 697374206F6620676C-
 10701 0000523B 6F62616C2076617269-
 10702 00005244 61626C65735C6E00   
 10703 0000524C 5C6E3B496E7075743A-     epilog_3 db "\n;Input: ",0
 10704 00005255 2000               
 10705 00005257 2C204C6973743A2000      epilog_4 db ", List: ",0
 10706 00005260 2C20204C696E65733A-     epilog_5 db ",  Lines:",0
 10707 00005269 00                 
 10708 0000526A 5C6E3B476C6F622E20-     epilog_6 db "\n;Glob. variables:",0
 10709 00005273 7661726961626C6573-
 10710 0000527C 3A00               
 10711 0000527E 206D61782E3A00          epilog_7 db " max.:",0
 10712 00005285 5C6E3B46756E637469-     epilog_8 db "\n;Functions      :",0
 10713 0000528E 6F6E73202020202020-
 10714 00005297 3A00               
 10715 00005299 206D61782E3A00          epilog_9 db " max.:",0
 10716 000052A0 5C6E3B43616C6C7320-     epilog_10 db "\n;Calls          :",0
 10717 000052A9 202020202020202020-
 10718 000052B2 3A00               
 10719 000052B4 206D61782E3A00          epilog_11 db " max.:",0
 10720 000052BB 2C204E616D65466965-     epilog_12 db ", NameField:",0
 10721 000052C4 6C643A00           
 10722 000052C8 206D61782E3A00          epilog_13 db " max.:",0
 10723 000052CF 5C6E3B436F64652075-     epilog_14 db "\n;Code until     :",0
 10724 000052D8 6E74696C2020202020-
 10725 000052E1 3A00               
 10726 000052E3 206D61782E3A2000        epilog_15 db " max.: ",0
 10727 000052EB 2C20667265653A00        epilog_16 db ", free:",0
 10728 000052F3 202A2A2A205761726E-     epilog_17 db " *** Warning *** Code area too small",0
 10729 000052FC 696E67202A2A2A2043-
 10730 00005305 6F6465206172656120-
 10731 0000530E 746F6F20736D616C6C-
 10732 00005317 00                 
 10733 00005318 5C6E3B446174612028-     epilog_18 db "\n;Data (HeapEnd) :",0
 10734 00005321 48656170456E642920-
 10735 0000532A 3A00               
 10736 0000532C 2C2072657374696E67-     epilog_19 db ", resting stacksize: ",0
 10737 00005335 20737461636B73697A-
 10738 0000533E 653A2000           
 10739 00005342 202A2A2A205761726E-     epilog_20 db " *** Warning *** Stack too small",0
 10740 0000534B 696E67202A2A2A2053-
 10741 00005354 7461636B20746F6F20-
 10742 0000535D 736D616C6C00       
 10743 00005363 5C6E3B4D61782E2043-     epilog_21 db "\n;Max. Const in '",0
 10744 0000536C 6F6E737420696E2027-
 10745 00005375 00                 
 10746 00005376 27203A00                epilog_22 db "' :",0
 10747 0000537A 206D61782E00            epilog_23 db " max.",0
 10748 00005380 2C20667265653A00        epilog_24 db ", free:",0
 10749 00005388 202A2A2A205761726E-     epilog_25 db " *** Warning *** constant area too small",0
 10750 00005391 696E67202A2A2A2063-
 10751 0000539A 6F6E7374616E742061-
 10752 000053A3 72656120746F6F2073-
 10753 000053AC 6D616C6C00         
 10754                                  
 10755                                  setblock:  ; *** PROC ***
 10756                                  
 10757                                  ;-975   DOS_ERR=0; _BX=i; _ ax=cs; _ es=ax; _AX=0x4A00; DosInt(); }
 10758                                  
 10759                                  ;Function : setblock, Number of local variables: 1
 10760                                  ;   # type sign width addr used name   list of local variables
 10761                                  ;  200 var unsg word   974 NULL i = bp+4;
 10762 000053B1 C8000000                 ENTER  0,0
 10763 000053B5 B80000                   mov ax, 0
 10764 000053B8 A3[6E00]                 mov word [DOS_ERR], ax
 10765 000053BB 8B5E04                   mov  bx, [bp+4]
 10766 000053BE 8CC8                     mov  ax, cs
 10767 000053C0 8EC0                     mov  es, ax
 10768 000053C2 B8004A                   mov  ax, 18944
 10769 000053C5 E805AD                   call DosInt
 10770                                  
 10771                                  ;-976 int allocmem(unsigned int i) { unsigned int vAX; unsigned int vBX;
 10772 000053C8 C9                       LEAVE
 10773 000053C9 C3                       ret
 10774                                  ; ENDP
 10775                                  
 10776                                  allocmem:  ; *** PROC ***
 10777                                  
 10778                                  ;-977   DOS_ERR=0; _BX=i;  _AX=0x4800; DosInt(); _ vAX=ax; _ vBX=bx;
 10779                                  
 10780                                  ;Function : allocmem, Number of local variables: 3
 10781                                  ;   # type sign width addr used name   list of local variables
 10782                                  ;  200 var unsg word   976 NULL i = bp+4
 10783                                  ;  201 var unsg word   976 NULL vAX = bp-2
 10784                                  ;  202 var unsg word   976 NULL vBX = bp-4;
 10785 000053CA C8040000                 ENTER  4,0
 10786 000053CE B80000                   mov ax, 0
 10787 000053D1 A3[6E00]                 mov word [DOS_ERR], ax
 10788 000053D4 8B5E04                   mov  bx, [bp+4]
 10789 000053D7 B80048                   mov  ax, 18432
 10790 000053DA E8F0AC                   call DosInt
 10791 000053DD 8946FE                  mov [bp-2], ax
 10792 000053E0 895EFC                  mov [bp-4], bx
 10793                                  
 10794                                  ;-978   if(DOS_ERR) return vBX;   return vAX;
 10795                                  
 10796 000053E3 A1[6E00]                 mov ax, [DOS_ERR]
 10797 000053E6 08C0                     or  al, al
 10798 000053E8 0F840600                 je @@allocmem592
 10799 000053EC 8B46FC                   mov ax, [bp-4]
 10800 000053EF E90600                   jmp @@retn
 10801                                  @@allocmem592:
 10802 000053F2 8B46FE                   mov ax, [bp-2]
 10803 000053F5 E90000                   jmp @@retn
 10804                                  
 10805                                  ;-979 }
 10806                                  
 10807                                  
 10808                                  ;-980 int copyF(char *dest, char *src, unsigned int sz) {
 10809                                  
 10810 000053F8 C9                      @@retn: LEAVE
 10811 000053F9 C3                       ret
 10812                                  ; ENDP
 10813                                  
 10814                                  copyF:  ; *** PROC ***
 10815                                  
 10816                                  ;-981   segE;  _ es=ax;  _ si=src;  _ di=dest; _ cx=sz;  // ds:si   es:di
 10817                                  
 10818                                  ;Function : copyF, Number of local variables: 3
 10819                                  ;   # type sign width addr used name   list of local variables
 10820                                  ;  200 ptr sign byte   980 NULL dest = bp+4
 10821                                  ;  201 ptr sign byte   980 NULL src = bp+6
 10822                                  ;  202 var unsg word   980 NULL sz = bp+8;
 10823 000053FA C8000000                 ENTER  0,0
 10824 000053FE A1[6400]                 mov ax, [segE]
 10825 00005401 8EC0                     mov  es, ax
 10826 00005403 8B7606                   mov  si, [bp+6]
 10827 00005406 8B7E04                   mov  di, [bp+4]
 10828 00005409 8B4E08                   mov  cx, [bp+8]
 10829                                  
 10830                                  ;-982   asm cld
 10831                                  
 10832 0000540C FC                       cld
 10833                                  
 10834                                  ;-983   asm rep movsb
 10835                                  
 10836 0000540D F3A4                     rep movsb
 10837                                  
 10838                                  ;-984   asm mov byte [es:di], 0
 10839                                  
 10840 0000540F 26C60500                 mov byte [es:di], 0
 10841                                  
 10842                                  ;-985 }
 10843                                  
 10844                                  
 10845                                  ;-986 int to_far(char *dest, char *src) {
 10846 00005413 C9                       LEAVE
 10847 00005414 C3                       ret
 10848                                  ; ENDP
 10849                                  
 10850                                  to_far:  ; *** PROC ***
 10851                                  
 10852                                  ;-987   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
 10853                                  
 10854                                  ;Function : to_far, Number of local variables: 2
 10855                                  ;   # type sign width addr used name   list of local variables
 10856                                  ;  200 ptr sign byte   986 NULL dest = bp+4
 10857                                  ;  201 ptr sign byte   986 NULL src = bp+6;
 10858 00005415 C8000000                 ENTER  0,0
 10859 00005419 A1[6400]                 mov ax, [segE]
 10860 0000541C 8EC0                     mov  es, ax
 10861 0000541E 8B7606                   mov  si, [bp+6]
 10862 00005421 8B7E04                   mov  di, [bp+4]
 10863                                  
 10864                                  ;-988   asm cld
 10865                                  
 10866 00005424 FC                       cld
 10867                                  
 10868                                  ;-989   do{
 10869                                  
 10870                                  @@to_far593:
 10871                                  
 10872                                  ;-990   asm lodsb  ; inc si
 10873                                  
 10874 00005425 AC                       lodsb  ; inc si
 10875                                  
 10876                                  ;-991   asm stosb  ; inc di
 10877                                  
 10878 00005426 AA                       stosb  ; inc di
 10879                                  
 10880                                  ;-992   } while (al != 0);
 10881                                  
 10882 00005427 3C00                     cmp  al, 0
 10883 00005429 0F840200                 je  @@to_far594
 10884 0000542D EBF6                     jmp @@to_far593
 10885                                  @@to_far594:
 10886                                  
 10887                                  ;-993 }
 10888                                  
 10889                                  
 10890                                  ;-994 int from_far(char *dest, char *src) {
 10891 0000542F C9                       LEAVE
 10892 00005430 C3                       ret
 10893                                  ; ENDP
 10894                                  
 10895                                  from_far:  ; *** PROC ***
 10896                                  
 10897                                  ;-995   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
 10898                                  
 10899                                  ;Function : from_far, Number of local variables: 2
 10900                                  ;   # type sign width addr used name   list of local variables
 10901                                  ;  200 ptr sign byte   994 NULL dest = bp+4
 10902                                  ;  201 ptr sign byte   994 NULL src = bp+6;
 10903 00005431 C8000000                 ENTER  0,0
 10904 00005435 A1[6400]                 mov ax, [segE]
 10905 00005438 8EC0                     mov  es, ax
 10906 0000543A 8B7606                   mov  si, [bp+6]
 10907 0000543D 8B7E04                   mov  di, [bp+4]
 10908                                  
 10909                                  ;-996   do{
 10910                                  
 10911                                  @@from_far595:
 10912                                  
 10913                                  ;-997   asm mov al, [es:si]
 10914                                  
 10915 00005440 268A04                   mov al, [es:si]
 10916                                  
 10917                                  ;-998   asm inc si
 10918                                  
 10919 00005443 46                       inc si
 10920                                  
 10921                                  ;-999   asm mov [di], al
 10922                                  
 10923 00005444 8805                     mov [di], al
 10924                                  
 10925                                  ;-1000   asm inc di
 10926                                  
 10927 00005446 47                       inc di
 10928                                  
 10929                                  ;-1001   } while (al != 0);
 10930                                  
 10931 00005447 3C00                     cmp  al, 0
 10932 00005449 0F840200                 je  @@from_far596
 10933 0000544D EBF1                     jmp @@from_far595
 10934                                  @@from_far596:
 10935                                  
 10936                                  ;-1002 }
 10937 0000544F C9                       LEAVE
 10938 00005450 C3                       ret
 10939                                  ; ENDP
 10940                                   
 10941                                  ; missing functions: 
 10942                                  ; Number of unresolved CALLs :    0 All FUNCTIONs in place
 10943 00005451 E80000                  LastFunctionByt:db 0E8h, 0, 0
 10944 00005454 58                      pop ax
 10945 00005455 C3                      ret
 10946                                   
 10947                                  ;   # type sign width  adr used name   list of global variables
 10948                                  
 10949                                  ;    1 arr sign byte     2    2 Version1[10]
 10950                                  ;    2 def unsg byte     3    - LSTART=200
 10951                                  ;    3 def unsg byte     4    - VARMAX=300
 10952                                  ;    4 def unsg byte     5    - GNAMEMAX=4800
 10953                                  ;    5 def unsg byte     6    - FUNCMAX=300
 10954                                  ;    6 def unsg byte     7    - FNAMEMAX=4800
 10955                                  ;    7 def unsg byte     8    - CALLMAX=2000
 10956                                  ;    8 def unsg byte     9    - IDLENMAX=15
 10957                                  ;    9 def unsg byte    11    - T_NAME=256
 10958                                  ;   10 def unsg byte    12    - T_CONST=257
 10959                                  ;   11 def unsg byte    13    - T_STRING=258
 10960                                  ;   12 def unsg byte    14    - T_INCLUDE=510
 10961                                  ;   13 def unsg byte    15    - T_DEFINE=511
 10962                                  ;   14 def unsg byte    16    - T_RETURN=512
 10963                                  ;   15 def unsg byte    17    - T_IF=513
 10964                                  ;   16 def unsg byte    18    - T_ELSE=514
 10965                                  ;   17 def unsg byte    19    - T_WHILE=515
 10966                                  ;   18 def unsg byte    20    - T_DO=516
 10967                                  ;   19 def unsg byte    21    - T_INT=517
 10968                                  ;   20 def unsg byte    22    - T_ASM=518
 10969                                  ;   21 def unsg byte    23    - T_ASMBLOCK=519
 10970                                  ;   22 def unsg byte    24    - T_EMIT=520
 10971                                  ;   23 def unsg byte    25    - T_GOTO=521
 10972                                  ;   24 def unsg byte    26    - T_VOID=529
 10973                                  ;   25 def unsg byte    27    - T_CHAR=530
 10974                                  ;   26 def unsg byte    28    - T_SIGNED=531
 10975                                  ;   27 def unsg byte    29    - T_UNSIGNED=532
 10976                                  ;   28 def unsg byte    30    - T_LONG=533
 10977                                  ;   29 def unsg byte    31    - T_EQ=806
 10978                                  ;   30 def unsg byte    32    - T_NE=807
 10979                                  ;   31 def unsg byte    33    - T_GE=811
 10980                                  ;   32 def unsg byte    34    - T_LE=824
 10981                                  ;   33 def unsg byte    35    - T_PLUSPLUS=1219
 10982                                  ;   34 def unsg byte    36    - T_MINUSMINUS=1225
 10983                                  ;   35 def unsg byte    37    - T_PLUSASS=1230
 10984                                  ;   36 def unsg byte    38    - T_MINUSASS=1231
 10985                                  ;   37 def unsg byte    39    - T_MULASS=1232
 10986                                  ;   38 def unsg byte    40    - T_DIVASS=1233
 10987                                  ;   39 def unsg byte    41    - T_ANDASS=1234
 10988                                  ;   40 def unsg byte    42    - T_ORASS=1235
 10989                                  ;   41 def unsg byte    43    - T_LESSLESS=1240
 10990                                  ;   42 def unsg byte    44    - T_GREATGREAT=1241
 10991                                  ;   43 def unsg byte    45    - COMAX=3000
 10992                                  ;   44 def unsg byte    46    - CMDLENMAX=67
 10993                                  ;   45 var unsg word    47    3 ORGDATAORIG
 10994                                  ;   46 var unsg word    47   10 orgData
 10995                                  ;   47 arr sign byte    48    4 co[3000]
 10996                                  ;   48 var sign word    48    4 maxco
 10997                                  ;   49 var sign word    48    3 maxco1
 10998                                  ;   50 arr sign byte    49    2 coname[67]
 10999                                  ;   51 ptr sign byte    49    5 cloc
 11000                                  ;   52 var sign word    50    6 fdin
 11001                                  ;   53 var sign word    50    4 fdout
 11002                                  ;   54 arr sign byte    50  104 symbol[128]
 11003                                  ;   55 arr sign byte    51   10 fname[67]
 11004                                  ;   56 arr sign byte    51   10 namein[67]
 11005                                  ;   57 arr sign byte    52    7 namelst[67]
 11006                                  ;   58 arr sign byte    52    2 archivename[67]
 11007                                  ;   59 var sign word    53   41 token
 11008                                  ;   60 var sign byte    53    2 globC
 11009                                  ;   61 var sign word    53    3 spalte
 11010                                  ;   62 var sign byte    54   28 thechar
 11011                                  ;   63 var sign word    54    9 iscmp
 11012                                  ;   64 var sign word    54    4 nconst
 11013                                  ;   65 var sign word    55    3 nreturn
 11014                                  ;   66 var sign word    55   12 nlabel
 11015                                  ;   67 var sign word    56   24 GTop
 11016                                  ;   68 var sign word    56   20 LTop
 11017                                  ;   69 var unsg word    57   44 lexval
 11018                                  ;   70 var sign word    58    6 typei
 11019                                  ;   71 var sign byte    58    8 istype
 11020                                  ;   72 arr sign byte    58   11 GType[300]
 11021                                  ;   73 var sign word    59    6 signi
 11022                                  ;   74 var sign byte    59    5 issign
 11023                                  ;   75 arr sign byte    59    5 GSign[300]
 11024                                  ;   76 var sign word    60    9 widthi
 11025                                  ;   77 var sign byte    60   19 iswidth
 11026                                  ;   78 arr sign byte    60    5 GWidth[300]
 11027                                  ;   79 arr sign word    61    4 GAdr[300]
 11028                                  ;   80 arr sign word    61    6 GUsed[300]
 11029                                  ;   81 var sign word    62   26 wi
 11030                                  ;   82 arr sign word    62   11 GData[300]
 11031                                  ;   83 arr sign byte    62    2 GNameField[4800]
 11032                                  ;   84 var sign word    63   13 FTop
 11033                                  ;   85 var sign word    63    8 CTop
 11034                                  ;   86 arr sign byte    64    2 FType[300]
 11035                                  ;   87 arr sign byte    64    3 CType[2000]
 11036                                  ;   88 arr sign word    65    2 FAdr[300]
 11037                                  ;   89 arr sign word    65    4 CAdr[2000]
 11038                                  ;   90 arr sign word    66    4 FCalls[300]
 11039                                  ;   91 arr sign byte    67    5 FNameField[4800]
 11040                                  ;   92 arr sign byte    68    7 NameA[32]
 11041                                  ;   93 arr sign byte    69    5 fgetsdest[128]
 11042                                  ;   94 ptr unsg byte    69    8 CNameTop
 11043                                  ;   95 ptr unsg byte    70   10 fgetsp
 11044                                  ;   96 var unsg word    70    4 segE
 11045                                  ;   97 var unsg word    71   12 lineno
 11046                                  ;   98 var unsg word    71    2 linenoinclude
 11047                                  ;   99 ptr unsg byte    72   17 pt
 11048                                  ;  100 ptr unsg byte    72    8 p1
 11049                                  ;  101 var sign word    73    9 DOS_ERR
 11050                                  ;  102 var sign word    73    5 DOS_NoBytes
 11051                                  ;  103 var sign byte    73    3 DOS_ByteRead
 11052                                  ;  104 arr sign byte   135    2 doglobName[15]
 11053                                  ;  105 var sign word   295    5 mod1
 11054                                  ;  106 var sign word   295   12 ireg1
 11055                                  ;  107 var sign word   295    6 idx1
 11056                                  ;  108 var sign word   295    1 ids1
 11057                                  ;  109 var sign word   295    4 idw1
 11058                                  ;  110 var sign word   295    2 idt1
 11059                                  ;  111 var sign word   295 NULL val1
 11060                                  ;  112 var sign word   296    2 mod2
 11061                                  ;  113 var sign word   296    6 ireg2
 11062                                  ;  114 var sign word   296    6 idx2
 11063                                  ;  115 var sign word   296    1 ids2
 11064                                  ;  116 var sign word   296    4 idw2
 11065                                  ;  117 var sign word   296    2 idt2
 11066                                  ;  118 var sign word   296    2 val2
 11067                                  ;  119 arr sign byte   361    9 ops[5]
 11068                                  ;  120 arr sign byte   403    3 printregstr[74]
 11069                                  ;  121 var sign word   411    1 evalue
 11070                                  ;  122 var sign word   411    1 exprtype
 11071                                  ;  123 arr sign word   563    2 docalltype[10]
 11072                                  ;  124 arr sign word   563    2 docallvalue[10]
 11073                                  ;  125 arr sign byte   564    2 procname[17]
 11074                                  ;  126 ptr sign byte   619    1 arglen
 11075                                  ;  127 ptr sign byte   619    3 argv
 11076                                  ;  128 arr sign byte   760    2 symboltemp[80]
 11077                                  ;  129 var unsg word   941    1 MAXUI
 11078                                  
 11079                                  
 11080                                  ;   # Calls Line Width  Name   list of functions
 11081                                  
 11082                                  ;    0    4   75   writetty
 11083                                  ;    1    2   76   putch
 11084                                  ;    2    6   77   cputs
 11085                                  ;    3    4   78   mkneg
 11086                                  ;    4    9   80   DosInt
 11087                                  ;    5    2   85   openR
 11088                                  ;    6    1   86   creatR
 11089                                  ;    7    2   87   fcloseR
 11090                                  ;    8    3   88   exitR
 11091                                  ;    9    1   89   readR
 11092                                  ;   10    1   90   readRL
 11093                                  ;   11    1   91   fputcR
 11094                                  ;   12    8   94   strlen
 11095                                  ;   13   24   95   strcpy
 11096                                  ;   14   74   96   eqstr
 11097                                  ;   15    1   99   instr1
 11098                                  ;   16    1  100   instr2
 11099                                  ;   17    1  101   strcat1
 11100                                  ;   18    1  102   toupper
 11101                                  ;   19    1  103   pint
 11102                                  ;   20    4  105   digit
 11103                                  ;   21    4  110   letter
 11104                                  ;   22 NULL  121   alnum
 11105                                  ;   23    4  126   a
 11106                                  ;   24   21  127   v
 11107                                  ;   25    4  132   checknamelen
 11108                                  ;   26    1  136   doglob
 11109                                  ;   27   12  185   gettypes
 11110                                  ;   28    9  194   adrofname
 11111                                  ;   29    7  195   adrF
 11112                                  ;   30    4  197   printName
 11113                                  ;   31   12  201   searchname
 11114                                  ;   32    3  205   checkName
 11115                                  ;   33   10  210   typeName
 11116                                  ;   34    3  226   name1
 11117                                  ;   35    1  231   storecall
 11118                                  ;   36    2  237   storefunc
 11119                                  ;   37    2  241   addlocal
 11120                                  ;   38    1  247   checkFunction
 11121                                  ;   39    1  250   dofunc
 11122                                  ;   40    1  285   isvariable
 11123                                  ;   41    3  298   pexpr
 11124                                  ;   42    1  305   constantexpr
 11125                                  ;   43    3  315   exprstart
 11126                                  ;   44    1  317   expr2
 11127                                  ;   45    3  362   doreg1
 11128                                  ;   46    6  381   checkreg
 11129                                  ;   47    6  406   printreg
 11130                                  ;   48    2  412   expr
 11131                                  ;   49    4  461   compoundass
 11132                                  ;   50    2  468   dovar1
 11133                                  ;   51    8  489   rterm
 11134                                  ;   52    1  502   isreg
 11135                                  ;   53   15  520   doreg
 11136                                  ;   54    1  526   doassign
 11137                                  ;   55    1  544   domul
 11138                                  ;   56    2  548   doidiv
 11139                                  ;   57    1  561   domod
 11140                                  ;   58    1  565   docall1
 11141                                  ;   59 NULL  607   main
 11142                                  ;   60    2  618   getfirstchar
 11143                                  ;   61    1  620   getarg
 11144                                  ;   62    2  639   parse
 11145                                  ;   63    1  648   checkcalls
 11146                                  ;   64    1  665   doinclude
 11147                                  ;   65    1  676   dodefine
 11148                                  ;   66    6  692   stmt
 11149                                  ;   67    1  722   doemit
 11150                                  ;   68    3  726   cmpneg
 11151                                  ;   69    7  739   prlabel
 11152                                  ;   70    3  740   prjump
 11153                                  ;   71    1  741   doif
 11154                                  ;   72    1  747   dodo
 11155                                  ;   73    1  751   dowhile
 11156                                  ;   74    4  754   isrelational
 11157                                  ;   75   17  761   getlex
 11158                                  ;   76    1  813   convertdefine
 11159                                  ;   77    1  820   getdigit
 11160                                  ;   78    1  829   getstring
 11161                                  ;   79   31  832   next
 11162                                  ;   80   78  833   istoken
 11163                                  ;   81   36  834   expect
 11164                                  ;   82    6  837   eprc
 11165                                  ;   83    5  838   eprs
 11166                                  ;   84   41  839   prc
 11167                                  ;   85    3  844   prscomment
 11168                                  ;   86    8  846   prnl
 11169                                  ;   87  250  848   prs
 11170                                  ;   88    2  853   eprnum
 11171                                  ;   89   16  855   pint1
 11172                                  ;   90   27  857   prunsign1
 11173                                  ;   91   25  860   printint51
 11174                                  ;   92    2  864   fgets1
 11175                                  ;   93    1  868   printinputline
 11176                                  ;   94    2  876   end1
 11177                                  ;   95   50  877   error1
 11178                                  ;   96    2  886   listproc
 11179                                  ;   97    2  894   listvar
 11180                                  ;   98    1  910   listcall
 11181                                  ;   99    1  913   calllisting
 11182                                  ;  100    1  919   countcalls
 11183                                  ;  101    1  927   listfunc
 11184                                  ;  102    1  931   funclisting
 11185                                  ;  103    1  942   epilog
 11186                                  ;  104    1  974   setblock
 11187                                  ;  105    1  976   allocmem
 11188                                  ;  106 NULL  980   copyF
 11189                                  ;  107    1  986   to_far
 11190                                  ;  108    3  994   from_far
 11191                                  ;  109 NULL 1002   LastFunctionByt
 11192                                  
 11193                                  ;    #  addr name   list of CALLs
 11194                                  
 11195                                  ;    0     0 writetty
 11196                                  ;    1     9 writetty
 11197                                  ;    2    18 putch
 11198                                  ;    3    24 DosInt
 11199                                  ;    4    31 DosInt
 11200                                  ;    5    38 DosInt
 11201                                  ;    6    45 DosInt
 11202                                  ;    7    52 DosInt
 11203                                  ;    8    59 DosInt
 11204                                  ;    9    66 DosInt
 11205                                  ;   10    73 strcpy
 11206                                  ;   11    80 prc
 11207                                  ;   12    84 mkneg
 11208                                  ;   13    90 pint
 11209                                  ;   14    95 putch
 11210                                  ;   15   101 digit
 11211                                  ;   16   107 digit
 11212                                  ;   17   113 letter
 11213                                  ;   18   120 printName
 11214                                  ;   19   130 prc
 11215                                  ;   20   134 printName
 11216                                  ;   21   144 prc
 11217                                  ;   22   148 strlen
 11218                                  ;   23   155 error1
 11219                                  ;   24   162 error1
 11220                                  ;   25   169 error1
 11221                                  ;   26   176 checknamelen
 11222                                  ;   27   189 checkName
 11223                                  ;   28   199 error1
 11224                                  ;   29   206 istoken
 11225                                  ;   30   214 istoken
 11226                                  ;   31   222 prs
 11227                                  ;   32   226 prunsign1
 11228                                  ;   33   236 prs
 11229                                  ;   34   240 prs
 11230                                  ;   35   244 prs
 11231                                  ;   36   248 prs
 11232                                  ;   37   252 prs
 11233                                  ;   38   256 prunsign1
 11234                                  ;   39   266 prs
 11235                                  ;   40   270 expect
 11236                                  ;   41   277 expect
 11237                                  ;   42   284 error1
 11238                                  ;   43   291 prs
 11239                                  ;   44   295 prs
 11240                                  ;   45   299 prs
 11241                                  ;   46   303 strcpy
 11242                                  ;   47   310 expect
 11243                                  ;   48   317 istoken
 11244                                  ;   49   325 prc
 11245                                  ;   50   329 prscomment
 11246                                  ;   51   340 prc
 11247                                  ;   52   344 prs
 11248                                  ;   53   348 strlen
 11249                                  ;   54   355 istoken
 11250                                  ;   55   363 prc
 11251                                  ;   56   367 expect
 11252                                  ;   57   374 prunsign1
 11253                                  ;   58   384 istoken
 11254                                  ;   59   392 expect
 11255                                  ;   60   399 error1
 11256                                  ;   61   406 prs
 11257                                  ;   62   410 prs
 11258                                  ;   63   414 prs
 11259                                  ;   64   418 prs
 11260                                  ;   65   422 prs
 11261                                  ;   66   426 prs
 11262                                  ;   67   430 istoken
 11263                                  ;   68   438 prc
 11264                                  ;   69   442 istoken
 11265                                  ;   70   450 expect
 11266                                  ;   71   457 prunsign1
 11267                                  ;   72   467 prunsign1
 11268                                  ;   73   477 adrofname
 11269                                  ;   74   487 strcpy
 11270                                  ;   75   494 strcpy
 11271                                  ;   76   501 expect
 11272                                  ;   77   508 adrF
 11273                                  ;   78   513 adrofname
 11274                                  ;   79   523 prs
 11275                                  ;   80   527 prs
 11276                                  ;   81   531 prc
 11277                                  ;   82   535 pint1
 11278                                  ;   83   541 prc
 11279                                  ;   84   545 checkName
 11280                                  ;   85   555 error1
 11281                                  ;   86   562 adrofname
 11282                                  ;   87   572 eqstr
 11283                                  ;   88   578 adrofname
 11284                                  ;   89   588 eqstr
 11285                                  ;   90   594 istoken
 11286                                  ;   91   602 istoken
 11287                                  ;   92   610 istoken
 11288                                  ;   93   618 istoken
 11289                                  ;   94   626 istoken
 11290                                  ;   95   634 istoken
 11291                                  ;   96   642 istoken
 11292                                  ;   97   650 istoken
 11293                                  ;   98   658 name1
 11294                                  ;   99   664 error1
 11295                                  ;  100   671 getlex
 11296                                  ;  101   678 error1
 11297                                  ;  102   685 error1
 11298                                  ;  103   692 strlen
 11299                                  ;  104   699 to_far
 11300                                  ;  105   706 error1
 11301                                  ;  106   713 adrF
 11302                                  ;  107   718 strcpy
 11303                                  ;  108   725 error1
 11304                                  ;  109   732 checkName
 11305                                  ;  110   742 error1
 11306                                  ;  111   749 adrF
 11307                                  ;  112   754 strcpy
 11308                                  ;  113   761 adrF
 11309                                  ;  114   766 eqstr
 11310                                  ;  115   772 checknamelen
 11311                                  ;  116   785 strcpy
 11312                                  ;  117   792 checkFunction
 11313                                  ;  118   806 error1
 11314                                  ;  119   813 storefunc
 11315                                  ;  120   823 prs
 11316                                  ;  121   827 prs
 11317                                  ;  122   831 prs
 11318                                  ;  123   835 expect
 11319                                  ;  124   842 istoken
 11320                                  ;  125   850 typeName
 11321                                  ;  126   859 addlocal
 11322                                  ;  127   868 istoken
 11323                                  ;  128   876 expect
 11324                                  ;  129   883 expect
 11325                                  ;  130   890 isvariable
 11326                                  ;  131   901 typeName
 11327                                  ;  132   910 checknamelen
 11328                                  ;  133   923 addlocal
 11329                                  ;  134   932 istoken
 11330                                  ;  135   940 expect
 11331                                  ;  136   947 expect
 11332                                  ;  137   954 istoken
 11333                                  ;  138   962 expect
 11334                                  ;  139   969 listproc
 11335                                  ;  140   978 prs
 11336                                  ;  141   982 mkneg
 11337                                  ;  142   988 pint1
 11338                                  ;  143   994 prs
 11339                                  ;  144   998 istoken
 11340                                  ;  145  1006 stmt
 11341                                  ;  146  1011 prs
 11342                                  ;  147  1015 prs
 11343                                  ;  148  1019 prs
 11344                                  ;  149  1023 prs
 11345                                  ;  150  1027 prs
 11346                                  ;  151  1031 strlen
 11347                                  ;  152  1038 strcpy
 11348                                  ;  153  1045 expect
 11349                                  ;  154  1052 eqstr
 11350                                  ;  155  1058 constantexpr
 11351                                  ;  156  1071 checkreg
 11352                                  ;  157  1080 doreg1
 11353                                  ;  158  1087 exprstart
 11354                                  ;  159  1097 prs
 11355                                  ;  160  1101 prs
 11356                                  ;  161  1105 expect
 11357                                  ;  162  1112 getlex
 11358                                  ;  163  1119 typeName
 11359                                  ;  164  1128 searchname
 11360                                  ;  165  1139 gettypes
 11361                                  ;  166  1148 isrelational
 11362                                  ;  167  1161 error1
 11363                                  ;  168  1168 expect
 11364                                  ;  169  1175 prs
 11365                                  ;  170  1179 prs
 11366                                  ;  171  1183 gettypes
 11367                                  ;  172  1192 prs
 11368                                  ;  173  1196 prs
 11369                                  ;  174  1200 v
 11370                                  ;  175  1202 prs
 11371                                  ;  176  1206 prunsign1
 11372                                  ;  177  1216 cmpneg
 11373                                  ;  178  1223 prs
 11374                                  ;  179  1227 expect
 11375                                  ;  180  1234 eqstr
 11376                                  ;  181  1240 expr2
 11377                                  ;  182  1246 expr
 11378                                  ;  183  1251 getlex
 11379                                  ;  184  1258 typeName
 11380                                  ;  185  1267 error1
 11381                                  ;  186  1274 checkreg
 11382                                  ;  187  1283 doreg1
 11383                                  ;  188  1290 searchname
 11384                                  ;  189  1301 gettypes
 11385                                  ;  190  1310 error1
 11386                                  ;  191  1317 isrelational
 11387                                  ;  192  1330 error1
 11388                                  ;  193  1337 istoken
 11389                                  ;  194  1345 error1
 11390                                  ;  195  1352 istoken
 11391                                  ;  196  1360 prs
 11392                                  ;  197  1364 prs
 11393                                  ;  198  1368 prs
 11394                                  ;  199  1372 prs
 11395                                  ;  200  1376 prs
 11396                                  ;  201  1380 v
 11397                                  ;  202  1382 prs
 11398                                  ;  203  1386 prunsign1
 11399                                  ;  204  1396 adrofname
 11400                                  ;  205  1406 prs
 11401                                  ;  206  1410 prs
 11402                                  ;  207  1414 typeName
 11403                                  ;  208  1423 checkreg
 11404                                  ;  209  1432 prs
 11405                                  ;  210  1436 printreg
 11406                                  ;  211  1445 v
 11407                                  ;  212  1447 prs
 11408                                  ;  213  1451 printreg
 11409                                  ;  214  1460 error1
 11410                                  ;  215  1467 searchname
 11411                                  ;  216  1478 gettypes
 11412                                  ;  217  1487 error1
 11413                                  ;  218  1494 prs
 11414                                  ;  219  1498 printreg
 11415                                  ;  220  1507 error1
 11416                                  ;  221  1514 prs
 11417                                  ;  222  1518 a
 11418                                  ;  223  1520 prs
 11419                                  ;  224  1524 prs
 11420                                  ;  225  1528 prs
 11421                                  ;  226  1532 v
 11422                                  ;  227  1534 adrofname
 11423                                  ;  228  1544 prs
 11424                                  ;  229  1548 prs
 11425                                  ;  230  1552 error1
 11426                                  ;  231  1559 istoken
 11427                                  ;  232  1567 strcpy
 11428                                  ;  233  1574 istoken
 11429                                  ;  234  1582 strcpy
 11430                                  ;  235  1589 istoken
 11431                                  ;  236  1597 strcpy
 11432                                  ;  237  1604 istoken
 11433                                  ;  238  1612 strcpy
 11434                                  ;  239  1619 istoken
 11435                                  ;  240  1627 strcpy
 11436                                  ;  241  1634 istoken
 11437                                  ;  242  1642 strcpy
 11438                                  ;  243  1649 istoken
 11439                                  ;  244  1657 strcpy
 11440                                  ;  245  1664 getlex
 11441                                  ;  246  1671 isrelational
 11442                                  ;  247  1684 error1
 11443                                  ;  248  1691 strcpy
 11444                                  ;  249  1698 prnl
 11445                                  ;  250  1703 prs
 11446                                  ;  251  1707 prs
 11447                                  ;  252  1711 printreg
 11448                                  ;  253  1720 prs
 11449                                  ;  254  1724 istoken
 11450                                  ;  255  1732 prunsign1
 11451                                  ;  256  1742 typeName
 11452                                  ;  257  1751 checkreg
 11453                                  ;  258  1760 printreg
 11454                                  ;  259  1769 searchname
 11455                                  ;  260  1780 a
 11456                                  ;  261  1782 v
 11457                                  ;  262  1784 cmpneg
 11458                                  ;  263  1791 prs
 11459                                  ;  264  1795 expect
 11460                                  ;  265  1802 strlen
 11461                                  ;  266  1809 eqstr
 11462                                  ;  267  1815 eqstr
 11463                                  ;  268  1821 eqstr
 11464                                  ;  269  1827 eqstr
 11465                                  ;  270  1833 eqstr
 11466                                  ;  271  1839 eqstr
 11467                                  ;  272  1845 eqstr
 11468                                  ;  273  1851 eqstr
 11469                                  ;  274  1857 eqstr
 11470                                  ;  275  1863 eqstr
 11471                                  ;  276  1869 eqstr
 11472                                  ;  277  1875 eqstr
 11473                                  ;  278  1881 eqstr
 11474                                  ;  279  1887 eqstr
 11475                                  ;  280  1893 eqstr
 11476                                  ;  281  1899 eqstr
 11477                                  ;  282  1905 eqstr
 11478                                  ;  283  1911 eqstr
 11479                                  ;  284  1917 eqstr
 11480                                  ;  285  1923 eqstr
 11481                                  ;  286  1929 eqstr
 11482                                  ;  287  1935 eqstr
 11483                                  ;  288  1941 strlen
 11484                                  ;  289  1948 eqstr
 11485                                  ;  290  1954 eqstr
 11486                                  ;  291  1960 eqstr
 11487                                  ;  292  1966 eqstr
 11488                                  ;  293  1972 eqstr
 11489                                  ;  294  1978 eqstr
 11490                                  ;  295  1984 eqstr
 11491                                  ;  296  1990 eqstr
 11492                                  ;  297  1996 eqstr
 11493                                  ;  298  2002 prc
 11494                                  ;  299  2006 prc
 11495                                  ;  300  2010 prc
 11496                                  ;  301  2014 istoken
 11497                                  ;  302  2022 prs
 11498                                  ;  303  2026 prunsign1
 11499                                  ;  304  2036 typeName
 11500                                  ;  305  2045 checkreg
 11501                                  ;  306  2054 doreg1
 11502                                  ;  307  2061 docall1
 11503                                  ;  308  2069 isreg
 11504                                  ;  309  2075 searchname
 11505                                  ;  310  2086 gettypes
 11506                                  ;  311  2095 istoken
 11507                                  ;  312  2103 istoken
 11508                                  ;  313  2111 expect
 11509                                  ;  314  2118 searchname
 11510                                  ;  315  2129 expect
 11511                                  ;  316  2136 expect
 11512                                  ;  317  2143 gettypes
 11513                                  ;  318  2152 error1
 11514                                  ;  319  2159 istoken
 11515                                  ;  320  2167 error1
 11516                                  ;  321  2174 prs
 11517                                  ;  322  2178 prs
 11518                                  ;  323  2182 prs
 11519                                  ;  324  2186 v
 11520                                  ;  325  2188 istoken
 11521                                  ;  326  2196 error1
 11522                                  ;  327  2203 prs
 11523                                  ;  328  2207 prs
 11524                                  ;  329  2211 prs
 11525                                  ;  330  2215 v
 11526                                  ;  331  2217 istoken
 11527                                  ;  332  2225 compoundass
 11528                                  ;  333  2237 istoken
 11529                                  ;  334  2245 compoundass
 11530                                  ;  335  2257 istoken
 11531                                  ;  336  2265 compoundass
 11532                                  ;  337  2277 istoken
 11533                                  ;  338  2285 compoundass
 11534                                  ;  339  2297 istoken
 11535                                  ;  340  2305 error1
 11536                                  ;  341  2312 istoken
 11537                                  ;  342  2320 error1
 11538                                  ;  343  2327 istoken
 11539                                  ;  344  2335 expr
 11540                                  ;  345  2340 doassign
 11541                                  ;  346  2349 dovar1
 11542                                  ;  347  2356 istoken
 11543                                  ;  348  2364 rterm
 11544                                  ;  349  2370 istoken
 11545                                  ;  350  2378 rterm
 11546                                  ;  351  2384 istoken
 11547                                  ;  352  2392 rterm
 11548                                  ;  353  2398 istoken
 11549                                  ;  354  2406 rterm
 11550                                  ;  355  2412 istoken
 11551                                  ;  356  2420 rterm
 11552                                  ;  357  2426 istoken
 11553                                  ;  358  2434 rterm
 11554                                  ;  359  2440 istoken
 11555                                  ;  360  2448 domul
 11556                                  ;  361  2454 istoken
 11557                                  ;  362  2462 doidiv
 11558                                  ;  363  2469 istoken
 11559                                  ;  364  2477 domod
 11560                                  ;  365  2483 isrelational
 11561                                  ;  366  2496 rterm
 11562                                  ;  367  2502 cmpneg
 11563                                  ;  368  2509 error1
 11564                                  ;  369  2516 prnl
 11565                                  ;  370  2521 prs
 11566                                  ;  371  2525 prs
 11567                                  ;  372  2529 gettypes
 11568                                  ;  373  2538 prs
 11569                                  ;  374  2542 prs
 11570                                  ;  375  2546 v
 11571                                  ;  376  2548 prs
 11572                                  ;  377  2552 expect
 11573                                  ;  378  2559 prunsign1
 11574                                  ;  379  2569 gettypes
 11575                                  ;  380  2578 prs
 11576                                  ;  381  2582 v
 11577                                  ;  382  2584 prnl
 11578                                  ;  383  2589 prs
 11579                                  ;  384  2593 prs
 11580                                  ;  385  2597 prs
 11581                                  ;  386  2601 prnl
 11582                                  ;  387  2606 prs
 11583                                  ;  388  2610 prs
 11584                                  ;  389  2614 a
 11585                                  ;  390  2616 prs
 11586                                  ;  391  2620 v
 11587                                  ;  392  2622 prs
 11588                                  ;  393  2626 prs
 11589                                  ;  394  2630 prs
 11590                                  ;  395  2634 prs
 11591                                  ;  396  2638 prs
 11592                                  ;  397  2642 prc
 11593                                  ;  398  2646 printName
 11594                                  ;  399  2656 prs
 11595                                  ;  400  2660 prnl
 11596                                  ;  401  2665 prs
 11597                                  ;  402  2669 prs
 11598                                  ;  403  2673 prs
 11599                                  ;  404  2677 prs
 11600                                  ;  405  2681 v
 11601                                  ;  406  2683 istoken
 11602                                  ;  407  2691 prnl
 11603                                  ;  408  2696 prs
 11604                                  ;  409  2700 prs
 11605                                  ;  410  2704 prs
 11606                                  ;  411  2708 prs
 11607                                  ;  412  2712 prunsign1
 11608                                  ;  413  2722 typeName
 11609                                  ;  414  2731 searchname
 11610                                  ;  415  2742 istoken
 11611                                  ;  416  2750 searchname
 11612                                  ;  417  2761 expect
 11613                                  ;  418  2768 expect
 11614                                  ;  419  2775 gettypes
 11615                                  ;  420  2784 error1
 11616                                  ;  421  2791 eqstr
 11617                                  ;  422  2797 dovar1
 11618                                  ;  423  2804 eqstr
 11619                                  ;  424  2810 doreg
 11620                                  ;  425  2816 eqstr
 11621                                  ;  426  2822 doreg
 11622                                  ;  427  2828 eqstr
 11623                                  ;  428  2834 doreg
 11624                                  ;  429  2840 eqstr
 11625                                  ;  430  2846 doreg
 11626                                  ;  431  2852 eqstr
 11627                                  ;  432  2858 doreg
 11628                                  ;  433  2864 eqstr
 11629                                  ;  434  2870 doreg
 11630                                  ;  435  2876 eqstr
 11631                                  ;  436  2882 doreg
 11632                                  ;  437  2888 eqstr
 11633                                  ;  438  2894 doreg
 11634                                  ;  439  2900 eqstr
 11635                                  ;  440  2906 doreg
 11636                                  ;  441  2912 eqstr
 11637                                  ;  442  2918 doreg
 11638                                  ;  443  2924 eqstr
 11639                                  ;  444  2930 doreg
 11640                                  ;  445  2936 eqstr
 11641                                  ;  446  2942 doreg
 11642                                  ;  447  2948 eqstr
 11643                                  ;  448  2954 doreg
 11644                                  ;  449  2960 eqstr
 11645                                  ;  450  2966 doreg
 11646                                  ;  451  2972 eqstr
 11647                                  ;  452  2978 doreg
 11648                                  ;  453  2984 expect
 11649                                  ;  454  2991 prs
 11650                                  ;  455  2995 prs
 11651                                  ;  456  2999 prs
 11652                                  ;  457  3003 istoken
 11653                                  ;  458  3011 prunsign1
 11654                                  ;  459  3021 istoken
 11655                                  ;  460  3029 searchname
 11656                                  ;  461  3040 v
 11657                                  ;  462  3042 error1
 11658                                  ;  463  3049 gettypes
 11659                                  ;  464  3058 prs
 11660                                  ;  465  3062 v
 11661                                  ;  466  3064 prs
 11662                                  ;  467  3068 prs
 11663                                  ;  468  3072 prs
 11664                                  ;  469  3076 a
 11665                                  ;  470  3078 prs
 11666                                  ;  471  3082 prs
 11667                                  ;  472  3086 prunsign1
 11668                                  ;  473  3096 v
 11669                                  ;  474  3098 prs
 11670                                  ;  475  3102 prs
 11671                                  ;  476  3106 printName
 11672                                  ;  477  3116 prs
 11673                                  ;  478  3120 prs
 11674                                  ;  479  3124 prs
 11675                                  ;  480  3128 prs
 11676                                  ;  481  3132 v
 11677                                  ;  482  3134 prs
 11678                                  ;  483  3138 prs
 11679                                  ;  484  3142 prs
 11680                                  ;  485  3146 v
 11681                                  ;  486  3148 prs
 11682                                  ;  487  3152 prs
 11683                                  ;  488  3156 prs
 11684                                  ;  489  3160 v
 11685                                  ;  490  3162 prs
 11686                                  ;  491  3166 rterm
 11687                                  ;  492  3172 istoken
 11688                                  ;  493  3180 prs
 11689                                  ;  494  3184 prunsign1
 11690                                  ;  495  3194 prs
 11691                                  ;  496  3198 error1
 11692                                  ;  497  3205 istoken
 11693                                  ;  498  3213 prs
 11694                                  ;  499  3217 prunsign1
 11695                                  ;  500  3227 prs
 11696                                  ;  501  3231 prs
 11697                                  ;  502  3235 typeName
 11698                                  ;  503  3244 searchname
 11699                                  ;  504  3255 error1
 11700                                  ;  505  3262 gettypes
 11701                                  ;  506  3271 error1
 11702                                  ;  507  3278 error1
 11703                                  ;  508  3285 prs
 11704                                  ;  509  3289 v
 11705                                  ;  510  3291 prs
 11706                                  ;  511  3295 prs
 11707                                  ;  512  3299 doidiv
 11708                                  ;  513  3306 prs
 11709                                  ;  514  3310 checknamelen
 11710                                  ;  515  3323 strcpy
 11711                                  ;  516  3330 storecall
 11712                                  ;  517  3340 expect
 11713                                  ;  518  3347 istoken
 11714                                  ;  519  3355 error1
 11715                                  ;  520  3362 istoken
 11716                                  ;  521  3370 istoken
 11717                                  ;  522  3378 eprs
 11718                                  ;  523  3383 eprs
 11719                                  ;  524  3388 eprc
 11720                                  ;  525  3393 eprnum
 11721                                  ;  526  3400 eprs
 11722                                  ;  527  3405 eprc
 11723                                  ;  528  3410 eprs
 11724                                  ;  529  3415 eprc
 11725                                  ;  530  3420 eprs
 11726                                  ;  531  3425 istoken
 11727                                  ;  532  3433 name1
 11728                                  ;  533  3439 searchname
 11729                                  ;  534  3450 istoken
 11730                                  ;  535  3458 checkreg
 11731                                  ;  536  3467 searchname
 11732                                  ;  537  3478 error1
 11733                                  ;  538  3485 istoken
 11734                                  ;  539  3493 expect
 11735                                  ;  540  3500 prs
 11736                                  ;  541  3504 pint1
 11737                                  ;  542  3510 prs
 11738                                  ;  543  3514 prs
 11739                                  ;  544  3518 prc
 11740                                  ;  545  3522 pint1
 11741                                  ;  546  3528 prs
 11742                                  ;  547  3532 v
 11743                                  ;  548  3534 prs
 11744                                  ;  549  3538 gettypes
 11745                                  ;  550  3547 prs
 11746                                  ;  551  3551 v
 11747                                  ;  552  3553 prs
 11748                                  ;  553  3557 v
 11749                                  ;  554  3559 prs
 11750                                  ;  555  3563 prs
 11751                                  ;  556  3567 printreg
 11752                                  ;  557  3576 prs
 11753                                  ;  558  3580 prs
 11754                                  ;  559  3584 prs
 11755                                  ;  560  3588 pint1
 11756                                  ;  561  3594 getarg
 11757                                  ;  562  3601 setblock
 11758                                  ;  563  3610 error1
 11759                                  ;  564  3617 allocmem
 11760                                  ;  565  3626 error1
 11761                                  ;  566  3633 getfirstchar
 11762                                  ;  567  3646 parse
 11763                                  ;  568  3652 checkcalls
 11764                                  ;  569  3663 epilog
 11765                                  ;  570  3670 fgets1
 11766                                  ;  571  3677 cputs
 11767                                  ;  572  3683 cputs
 11768                                  ;  573  3689 readRL
 11769                                  ;  574  3696 prnl
 11770                                  ;  575  3701 strcpy
 11771                                  ;  576  3708 instr2
 11772                                  ;  577  3715 strcat1
 11773                                  ;  578  3723 toupper
 11774                                  ;  579  3731 strcpy
 11775                                  ;  580  3738 strlen
 11776                                  ;  581  3745 openR
 11777                                  ;  582  3751 cputs
 11778                                  ;  583  3757 cputs
 11779                                  ;  584  3763 exitR
 11780                                  ;  585  3769 creatR
 11781                                  ;  586  3776 cputs
 11782                                  ;  587  3782 cputs
 11783                                  ;  588  3788 exitR
 11784                                  ;  589  3794 prs
 11785                                  ;  590  3798 prs
 11786                                  ;  591  3802 prs
 11787                                  ;  592  3806 pint1
 11788                                  ;  593  3812 prs
 11789                                  ;  594  3816 prs
 11790                                  ;  595  3820 prs
 11791                                  ;  596  3824 prs
 11792                                  ;  597  3828 prs
 11793                                  ;  598  3832 prs
 11794                                  ;  599  3836 prs
 11795                                  ;  600  3840 getlex
 11796                                  ;  601  3847 istoken
 11797                                  ;  602  3855 istoken
 11798                                  ;  603  3863 dodefine
 11799                                  ;  604  3872 istoken
 11800                                  ;  605  3880 doinclude
 11801                                  ;  606  3890 error1
 11802                                  ;  607  3897 typeName
 11803                                  ;  608  3906 dofunc
 11804                                  ;  609  3913 doglob
 11805                                  ;  610  3920 prs
 11806                                  ;  611  3924 from_far
 11807                                  ;  612  3933 adrF
 11808                                  ;  613  3938 eqstr
 11809                                  ;  614  3944 prs
 11810                                  ;  615  3948 prs
 11811                                  ;  616  3952 prs
 11812                                  ;  617  3956 printint51
 11813                                  ;  618  3967 error1
 11814                                  ;  619  3974 prs
 11815                                  ;  620  3978 prs
 11816                                  ;  621  3982 prs
 11817                                  ;  622  3986 openR
 11818                                  ;  623  3992 prs
 11819                                  ;  624  3996 prs
 11820                                  ;  625  4000 error1
 11821                                  ;  626  4007 parse
 11822                                  ;  627  4013 prs
 11823                                  ;  628  4017 prs
 11824                                  ;  629  4021 getfirstchar
 11825                                  ;  630  4034 getlex
 11826                                  ;  631  4041 eqstr
 11827                                  ;  632  4047 getlex
 11828                                  ;  633  4054 eqstr
 11829                                  ;  634  4060 getlex
 11830                                  ;  635  4067 prs
 11831                                  ;  636  4071 strcpy
 11832                                  ;  637  4078 prs
 11833                                  ;  638  4082 error1
 11834                                  ;  639  4089 getlex
 11835                                  ;  640  4096 expect
 11836                                  ;  641  4103 error1
 11837                                  ;  642  4110 strlen
 11838                                  ;  643  4117 error1
 11839                                  ;  644  4124 adrofname
 11840                                  ;  645  4134 strcpy
 11841                                  ;  646  4141 expect
 11842                                  ;  647  4148 istoken
 11843                                  ;  648  4156 istoken
 11844                                  ;  649  4164 stmt
 11845                                  ;  650  4169 istoken
 11846                                  ;  651  4177 doif
 11847                                  ;  652  4182 istoken
 11848                                  ;  653  4190 dodo
 11849                                  ;  654  4195 istoken
 11850                                  ;  655  4203 dowhile
 11851                                  ;  656  4211 istoken
 11852                                  ;  657  4219 prs
 11853                                  ;  658  4223 name1
 11854                                  ;  659  4229 prs
 11855                                  ;  660  4233 expect
 11856                                  ;  661  4240 prs
 11857                                  ;  662  4244 next
 11858                                  ;  663  4249 prc
 11859                                  ;  664  4253 next
 11860                                  ;  665  4258 getlex
 11861                                  ;  666  4265 istoken
 11862                                  ;  667  4273 prs
 11863                                  ;  668  4277 next
 11864                                  ;  669  4282 prc
 11865                                  ;  670  4286 next
 11866                                  ;  671  4291 getlex
 11867                                  ;  672  4298 error1
 11868                                  ;  673  4305 istoken
 11869                                  ;  674  4313 doemit
 11870                                  ;  675  4320 istoken
 11871                                  ;  676  4328 istoken
 11872                                  ;  677  4336 exprstart
 11873                                  ;  678  4346 prs
 11874                                  ;  679  4350 expect
 11875                                  ;  680  4357 prs
 11876                                  ;  681  4361 prs
 11877                                  ;  682  4365 prc
 11878                                  ;  683  4369 expect
 11879                                  ;  684  4376 expect
 11880                                  ;  685  4383 exprstart
 11881                                  ;  686  4393 expect
 11882                                  ;  687  4400 prs
 11883                                  ;  688  4404 getlex
 11884                                  ;  689  4411 prunsign1
 11885                                  ;  690  4421 getlex
 11886                                  ;  691  4428 prc
 11887                                  ;  692  4432 expect
 11888                                  ;  693  4439 prs
 11889                                  ;  694  4443 prs
 11890                                  ;  695  4447 prs
 11891                                  ;  696  4451 prs
 11892                                  ;  697  4455 prs
 11893                                  ;  698  4459 prunsign1
 11894                                  ;  699  4469 prs
 11895                                  ;  700  4473 prs
 11896                                  ;  701  4477 prunsign1
 11897                                  ;  702  4487 prs
 11898                                  ;  703  4491 prs
 11899                                  ;  704  4495 prs
 11900                                  ;  705  4499 error1
 11901                                  ;  706  4506 prs
 11902                                  ;  707  4510 prs
 11903                                  ;  708  4514 pint1
 11904                                  ;  709  4520 prc
 11905                                  ;  710  4524 prs
 11906                                  ;  711  4528 prs
 11907                                  ;  712  4532 pint1
 11908                                  ;  713  4538 pexpr
 11909                                  ;  714  4544 pint1
 11910                                  ;  715  4550 stmt
 11911                                  ;  716  4555 istoken
 11912                                  ;  717  4563 prjump
 11913                                  ;  718  4570 prlabel
 11914                                  ;  719  4578 stmt
 11915                                  ;  720  4583 prlabel
 11916                                  ;  721  4591 prlabel
 11917                                  ;  722  4599 prlabel
 11918                                  ;  723  4607 stmt
 11919                                  ;  724  4612 expect
 11920                                  ;  725  4619 pexpr
 11921                                  ;  726  4625 pint1
 11922                                  ;  727  4631 prjump
 11923                                  ;  728  4638 prlabel
 11924                                  ;  729  4646 prlabel
 11925                                  ;  730  4654 pexpr
 11926                                  ;  731  4660 pint1
 11927                                  ;  732  4666 stmt
 11928                                  ;  733  4671 prjump
 11929                                  ;  734  4678 prlabel
 11930                                  ;  735  4686 getlex
 11931                                  ;  736  4693 next
 11932                                  ;  737  4698 next
 11933                                  ;  738  4703 next
 11934                                  ;  739  4708 next
 11935                                  ;  740  4713 next
 11936                                  ;  741  4718 next
 11937                                  ;  742  4723 next
 11938                                  ;  743  4728 next
 11939                                  ;  744  4733 next
 11940                                  ;  745  4738 next
 11941                                  ;  746  4743 next
 11942                                  ;  747  4748 next
 11943                                  ;  748  4753 next
 11944                                  ;  749  4758 next
 11945                                  ;  750  4763 next
 11946                                  ;  751  4768 instr1
 11947                                  ;  752  4775 next
 11948                                  ;  753  4780 getlex
 11949                                  ;  754  4787 next
 11950                                  ;  755  4792 next
 11951                                  ;  756  4797 getlex
 11952                                  ;  757  4804 getstring
 11953                                  ;  758  4814 digit
 11954                                  ;  759  4820 getdigit
 11955                                  ;  760  4829 next
 11956                                  ;  761  4834 next
 11957                                  ;  762  4839 next
 11958                                  ;  763  4844 letter
 11959                                  ;  764  4851 strcpy
 11960                                  ;  765  4858 letter
 11961                                  ;  766  4865 next
 11962                                  ;  767  4870 eqstr
 11963                                  ;  768  4876 eqstr
 11964                                  ;  769  4882 eqstr
 11965                                  ;  770  4888 eqstr
 11966                                  ;  771  4894 eqstr
 11967                                  ;  772  4900 eqstr
 11968                                  ;  773  4906 eqstr
 11969                                  ;  774  4912 eqstr
 11970                                  ;  775  4918 eqstr
 11971                                  ;  776  4924 eqstr
 11972                                  ;  777  4930 eqstr
 11973                                  ;  778  4936 eqstr
 11974                                  ;  779  4942 eqstr
 11975                                  ;  780  4948 eqstr
 11976                                  ;  781  4954 eqstr
 11977                                  ;  782  4960 eqstr
 11978                                  ;  783  4966 eqstr
 11979                                  ;  784  4972 convertdefine
 11980                                  ;  785  4986 strcpy
 11981                                  ;  786  4993 error1
 11982                                  ;  787  5000 adrofname
 11983                                  ;  788  5010 eqstr
 11984                                  ;  789  5016 next
 11985                                  ;  790  5021 letter
 11986                                  ;  791  5028 next
 11987                                  ;  792  5033 digit
 11988                                  ;  793  5039 next
 11989                                  ;  794  5044 next
 11990                                  ;  795  5049 next
 11991                                  ;  796  5054 fgets1
 11992                                  ;  797  5061 getlex
 11993                                  ;  798  5068 istoken
 11994                                  ;  799  5076 prs
 11995                                  ;  800  5080 listproc
 11996                                  ;  801  5089 prs
 11997                                  ;  802  5093 pint1
 11998                                  ;  803  5099 error1
 11999                                  ;  804  5106 eprc
 12000                                  ;  805  5111 writetty
 12001                                  ;  806  5120 writetty
 12002                                  ;  807  5129 fputcR
 12003                                  ;  808  5136 prc
 12004                                  ;  809  5140 prs
 12005                                  ;  810  5144 prc
 12006                                  ;  811  5148 eprc
 12007                                  ;  812  5153 mkneg
 12008                                  ;  813  5159 eprnum
 12009                                  ;  814  5166 eprc
 12010                                  ;  815  5171 prc
 12011                                  ;  816  5175 mkneg
 12012                                  ;  817  5181 pint1
 12013                                  ;  818  5187 prc
 12014                                  ;  819  5191 prunsign1
 12015                                  ;  820  5201 prc
 12016                                  ;  821  5205 prc
 12017                                  ;  822  5209 prc
 12018                                  ;  823  5213 prc
 12019                                  ;  824  5217 prc
 12020                                  ;  825  5221 prunsign1
 12021                                  ;  826  5231 printinputline
 12022                                  ;  827  5246 readR
 12023                                  ;  828  5252 prs
 12024                                  ;  829  5256 prunsign1
 12025                                  ;  830  5266 prc
 12026                                  ;  831  5270 prscomment
 12027                                  ;  832  5281 fcloseR
 12028                                  ;  833  5289 fcloseR
 12029                                  ;  834  5297 exitR
 12030                                  ;  835  5303 prnl
 12031                                  ;  836  5308 prscomment
 12032                                  ;  837  5319 prs
 12033                                  ;  838  5323 prunsign1
 12034                                  ;  839  5333 prs
 12035                                  ;  840  5337 prs
 12036                                  ;  841  5341 prs
 12037                                  ;  842  5345 pint1
 12038                                  ;  843  5351 prs
 12039                                  ;  844  5355 prunsign1
 12040                                  ;  845  5365 prs
 12041                                  ;  846  5369 prc
 12042                                  ;  847  5373 prs
 12043                                  ;  848  5377 pint1
 12044                                  ;  849  5383 prs
 12045                                  ;  850  5387 prs
 12046                                  ;  851  5391 end1
 12047                                  ;  852  5396 prs
 12048                                  ;  853  5400 prs
 12049                                  ;  854  5404 prs
 12050                                  ;  855  5408 prunsign1
 12051                                  ;  856  5418 prs
 12052                                  ;  857  5422 listvar
 12053                                  ;  858  5430 prs
 12054                                  ;  859  5434 printint51
 12055                                  ;  860  5445 prc
 12056                                  ;  861  5449 prs
 12057                                  ;  862  5453 prs
 12058                                  ;  863  5457 prs
 12059                                  ;  864  5461 prs
 12060                                  ;  865  5465 prs
 12061                                  ;  866  5469 prs
 12062                                  ;  867  5473 prs
 12063                                  ;  868  5477 prs
 12064                                  ;  869  5481 prs
 12065                                  ;  870  5485 printint51
 12066                                  ;  871  5496 printint51
 12067                                  ;  872  5507 prs
 12068                                  ;  873  5511 prs
 12069                                  ;  874  5515 prc
 12070                                  ;  875  5519 adrofname
 12071                                  ;  876  5529 prs
 12072                                  ;  877  5533 prc
 12073                                  ;  878  5537 prunsign1
 12074                                  ;  879  5547 prc
 12075                                  ;  880  5551 prunsign1
 12076                                  ;  881  5561 prc
 12077                                  ;  882  5565 prs
 12078                                  ;  883  5569 prc
 12079                                  ;  884  5573 pint1
 12080                                  ;  885  5579 prs
 12081                                  ;  886  5583 calllisting
 12082                                  ;  887  5595 prs
 12083                                  ;  888  5599 printint51
 12084                                  ;  889  5610 prc
 12085                                  ;  890  5614 prs
 12086                                  ;  891  5618 printint51
 12087                                  ;  892  5629 prc
 12088                                  ;  893  5633 from_far
 12089                                  ;  894  5642 prs
 12090                                  ;  895  5646 adrF
 12091                                  ;  896  5651 from_far
 12092                                  ;  897  5660 eqstr
 12093                                  ;  898  5666 prs
 12094                                  ;  899  5670 countcalls
 12095                                  ;  900  5681 funclisting
 12096                                  ;  901  5693 prs
 12097                                  ;  902  5697 printint51
 12098                                  ;  903  5708 printint51
 12099                                  ;  904  5719 prs
 12100                                  ;  905  5723 printint51
 12101                                  ;  906  5734 prc
 12102                                  ;  907  5738 prs
 12103                                  ;  908  5742 prs
 12104                                  ;  909  5746 prs
 12105                                  ;  910  5750 prs
 12106                                  ;  911  5754 prc
 12107                                  ;  912  5758 prc
 12108                                  ;  913  5762 adrF
 12109                                  ;  914  5767 prs
 12110                                  ;  915  5771 strcpy
 12111                                  ;  916  5778 storefunc
 12112                                  ;  917  5788 prs
 12113                                  ;  918  5792 prs
 12114                                  ;  919  5796 listvar
 12115                                  ;  920  5804 listfunc
 12116                                  ;  921  5813 listcall
 12117                                  ;  922  5822 prs
 12118                                  ;  923  5826 prs
 12119                                  ;  924  5830 prs
 12120                                  ;  925  5834 prs
 12121                                  ;  926  5838 prs
 12122                                  ;  927  5842 printint51
 12123                                  ;  928  5853 prs
 12124                                  ;  929  5857 printint51
 12125                                  ;  930  5868 prs
 12126                                  ;  931  5872 printint51
 12127                                  ;  932  5883 prs
 12128                                  ;  933  5887 printint51
 12129                                  ;  934  5898 prs
 12130                                  ;  935  5902 printint51
 12131                                  ;  936  5913 prs
 12132                                  ;  937  5917 printint51
 12133                                  ;  938  5928 prs
 12134                                  ;  939  5932 printint51
 12135                                  ;  940  5943 prs
 12136                                  ;  941  5947 printint51
 12137                                  ;  942  5958 prs
 12138                                  ;  943  5962 printint51
 12139                                  ;  944  5973 prs
 12140                                  ;  945  5977 printint51
 12141                                  ;  946  5988 prs
 12142                                  ;  947  5992 printint51
 12143                                  ;  948  6003 prs
 12144                                  ;  949  6007 printint51
 12145                                  ;  950  6018 prs
 12146                                  ;  951  6022 prs
 12147                                  ;  952  6026 prunsign1
 12148                                  ;  953  6036 prs
 12149                                  ;  954  6040 printint51
 12150                                  ;  955  6051 prs
 12151                                  ;  956  6055 prs
 12152                                  ;  957  6059 prs
 12153                                  ;  958  6063 prs
 12154                                  ;  959  6067 printint51
 12155                                  ;  960  6078 prs
 12156                                  ;  961  6082 printint51
 12157                                  ;  962  6093 prs
 12158                                  ;  963  6097 printint51
 12159                                  ;  964  6108 prs
 12160                                  ;  965  6112 end1
 12161                                  ;  966  6117 DosInt
 12162                                  ;  967  6124 DosInt
 12163                                  ;Input: A.C, List: A.S,  Lines: 1003
 12164                                  ;Glob. variables:  129 max.:  200
 12165                                  ;Functions      :  110 max.:  300
 12166                                  ;Calls          :  968 max.: 2000, NameField: 6131 max.:    65535
 12167                                  ;Code until     :21844 max.: 30000, free: 8156
 12168                                  ;Data (HeapEnd) :53548, resting stacksize: 11987
 12169                                  ;Max. Const in 'epilog' :  947 max. 3000, free: 2053
