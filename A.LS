     1                                  
     2                                  ; A.COM CComp V0.9, Arglen: 4, Argv: A.C, Source: A.C, Output asm: A.S
     3                                  org  256 
     4 00000000 E99F30                  jmp main
     5                                  
     6                                  ;-1 //  @@ret redefined 2011.04.25 23.644 bytes, Full  Working 2017.09.13
     7                                  
     8                                  
     9                                  ;-2 char Version1[]="A.COM CComp V0.9";
    10                                  
    11 00000003 412E434F4D2043436F-     Version1 db "A.COM CComp V0.9",0
    12 0000000C 6D702056302E3900   
    13                                  
    14                                  ;-3 #define ARCHIVE "AR.C"
    15                                  
    16                                  ;Use archive file: AR.C
    17                                  
    18                                  ;-4 #define LSTART        200
    19                                  
    20                                  
    21                                  ;-5 #define VARMAX        300
    22                                  
    23                                  
    24                                  ;-6 #define GNAMEMAX     4800 // 16*VARMAX
    25                                  
    26                                  
    27                                  ;-7 #define FUNCMAX       300
    28                                  
    29                                  
    30                                  ;-8 #define FNAMEMAX     4800 // 16*FUNCMAX
    31                                  
    32                                  
    33                                  ;-9 #define CALLMAX      2000
    34                                  
    35                                  
    36                                  ;-10 #define IDLENMAX       15
    37                                  
    38                                  
    39                                  ;-11 #define _                 // Konstantvergleich
    40                                  
    41                                  
    42                                  ;-12 #define T_NAME        256
    43                                  
    44                                  
    45                                  ;-13 #define T_CONST       257 
    46                                  
    47                                  
    48                                  ;-14 #define T_STRING      258     
    49                                  
    50                                  
    51                                  ;-15 #define T_INCLUDE     510     
    52                                  
    53                                  
    54                                  ;-16 #define T_DEFINE      511  
    55                                  
    56                                  
    57                                  ;-17 #define T_RETURN      512
    58                                  
    59                                  
    60                                  ;-18 #define T_IF          513      
    61                                  
    62                                  
    63                                  ;-19 #define T_ELSE        514  
    64                                  
    65                                  
    66                                  ;-20 #define T_WHILE       515      
    67                                  
    68                                  
    69                                  ;-21 #define T_DO          516
    70                                  
    71                                  
    72                                  ;-22 #define T_INT         517     
    73                                  
    74                                  
    75                                  ;-23 #define T_ASM         518   
    76                                  
    77                                  
    78                                  ;-24 #define T_ASMBLOCK    519   
    79                                  
    80                                  
    81                                  ;-25 #define T_EMIT        520
    82                                  
    83                                  
    84                                  ;-26 #define T_GOTO        521    
    85                                  
    86                                  
    87                                  ;-27 #define T_VOID        529  
    88                                  
    89                                  
    90                                  ;-28 #define T_CHAR        530       
    91                                  
    92                                  
    93                                  ;-29 #define T_SIGNED      531
    94                                  
    95                                  
    96                                  ;-30 #define T_UNSIGNED    532
    97                                  
    98                                  
    99                                  ;-31 #define T_LONG        533
   100                                  
   101                                  
   102                                  ;-32 #define T_EQ          806
   103                                  
   104                                  
   105                                  ;-33 #define T_NE          807
   106                                  
   107                                  
   108                                  ;-34 #define T_GE          811
   109                                  
   110                                  
   111                                  ;-35 #define T_LE          824
   112                                  
   113                                  
   114                                  ;-36 #define T_PLUSPLUS   1219
   115                                  
   116                                  
   117                                  ;-37 #define T_MINUSMINUS 1225
   118                                  
   119                                  
   120                                  ;-38 #define T_PLUSASS    1230
   121                                  
   122                                  
   123                                  ;-39 #define T_MINUSASS   1231
   124                                  
   125                                  
   126                                  ;-40 #define T_MULASS     1232
   127                                  
   128                                  
   129                                  ;-41 #define T_DIVASS     1233
   130                                  
   131                                  
   132                                  ;-42 #define T_ANDASS     1234
   133                                  
   134                                  
   135                                  ;-43 #define T_ORASS      1235
   136                                  
   137                                  
   138                                  ;-44 #define T_LESSLESS   1240
   139                                  
   140                                  
   141                                  ;-45 #define T_GREATGREAT 1241
   142                                  
   143                                  
   144                                  ;-46 #define COMAX        3000
   145                                  
   146                                  
   147                                  ;-47 #define CMDLENMAX      67
   148                                  
   149                                  
   150                                  ;-48 unsigned int ORGDATAORIG=30000;      unsigned int orgData=30000;
   151                                  
   152 00000014 3075                    ORGDATAORIG dw 30000
   153 00000016 3075                    orgData dw 30000
   154                                  
   155                                  ;-49 char co[COMAX];    int maxco=0;      int maxco1=0;
   156                                  
   157                                  section .bss
   158                                  absolute 30000
   159 00007530 <res 00000BB8>          co resb 3000
   160                                  section .text
   161 00000018 0000                    maxco dw 0
   162 0000001A 0000                    maxco1 dw 0
   163                                  
   164                                  ;-50 char coname[CMDLENMAX];              char *cloc=0;
   165                                  
   166                                  section .bss
   167                                  absolute 33000
   168 000080E8 <res 00000043>          coname resb 67
   169                                  section .text
   170 0000001C 0000                    cloc dw 0
   171                                  
   172                                  ;-51 int fdin=0;        int fdout=0;      char symbol[128];
   173                                  
   174 0000001E 0000                    fdin dw 0
   175 00000020 0000                    fdout dw 0
   176                                  section .bss
   177                                  absolute 33067
   178 0000812B <res 00000080>          symbol resb 128
   179                                  section .text
   180                                  
   181                                  ;-52 char fname[CMDLENMAX];               char namein[CMDLENMAX];
   182                                  
   183                                  section .bss
   184                                  absolute 33195
   185 000081AB <res 00000043>          fname resb 67
   186                                  section .text
   187                                  section .bss
   188                                  absolute 33262
   189 000081EE <res 00000043>          namein resb 67
   190                                  section .text
   191                                  
   192                                  ;-53 char namelst[CMDLENMAX];             char archivename[CMDLENMAX];
   193                                  
   194                                  section .bss
   195                                  absolute 33329
   196 00008231 <res 00000043>          namelst resb 67
   197                                  section .text
   198                                  section .bss
   199                                  absolute 33396
   200 00008274 <res 00000043>          archivename resb 67
   201                                  section .text
   202                                  
   203                                  ;-54 int token=0;       char globC=0;     int spalte=0;
   204                                  
   205 00000022 0000                    token dw 0
   206 00000024 00                      globC db 0
   207 00000025 0000                    spalte dw 0
   208                                  
   209                                  ;-55 char thechar=0;    int iscmp=0;      int nconst=0;
   210                                  
   211 00000027 00                      thechar db 0
   212 00000028 0000                    iscmp dw 0
   213 0000002A 0000                    nconst dw 0
   214                                  
   215                                  ;-56 int nreturn=0;     int nlabel=0;     int callrecursive=0;
   216                                  
   217 0000002C 0000                    nreturn dw 0
   218 0000002E 0000                    nlabel dw 0
   219 00000030 0000                    callrecursive dw 0
   220                                  
   221                                  ;-57 int GTop=1;        int LTop=150;
   222                                  
   223 00000032 0100                    GTop dw 1
   224 00000034 9600                    LTop dw 150
   225                                  
   226                                  ;-58 unsigned int lexval=0;
   227                                  
   228 00000036 0000                    lexval dw 0
   229                                  
   230                                  ;-59 int typei;       char istype;  char GType [VARMAX]; // 0=V, 1=*, 2=&,#
   231                                  
   232 00000038 0000                    typei dw 0
   233 0000003A 00                      istype db 0
   234                                  section .bss
   235                                  absolute 33463
   236 000082B7 <res 0000012C>          GType resb 300
   237                                  section .text
   238                                  
   239                                  ;-60 int signi;       char issign;  char GSign [VARMAX]; // 0=U, 1=S
   240                                  
   241 0000003B 0000                    signi dw 0
   242 0000003D 00                      issign db 0
   243                                  section .bss
   244                                  absolute 33763
   245 000083E3 <res 0000012C>          GSign resb 300
   246                                  section .text
   247                                  
   248                                  ;-61 int widthi;      char iswidth; char GWidth[VARMAX]; // 0, 1, 2, 4
   249                                  
   250 0000003E 0000                    widthi dw 0
   251 00000040 00                      iswidth db 0
   252                                  section .bss
   253                                  absolute 34063
   254 0000850F <res 0000012C>          GWidth resb 300
   255                                  section .text
   256                                  
   257                                  ;-62              int GAdr[VARMAX]; int  GUsed [VARMAX];
   258                                  
   259                                  section .bss
   260                                  absolute 34363
   261 0000863B <res 00000258>          GAdr resw 300
   262                                  section .text
   263                                  section .bss
   264                                  absolute 34963
   265 00008893 <res 00000258>          GUsed resw 300
   266                                  section .text
   267                                  
   268                                  ;-63 int wi=0;   int GData[VARMAX];  char GNameField[GNAMEMAX];
   269                                  
   270 00000041 0000                    wi dw 0
   271                                  section .bss
   272                                  absolute 35563
   273 00008AEB <res 00000258>          GData resw 300
   274                                  section .text
   275                                  section .bss
   276                                  absolute 36163
   277 00008D43 <res 000012C0>          GNameField resb 4800
   278                                  section .text
   279                                  
   280                                  ;-64 int  FTop=0;                 int  CTop=0;
   281                                  
   282 00000043 0000                    FTop dw 0
   283 00000045 0000                    CTop dw 0
   284                                  
   285                                  ;-65 char FType [FUNCMAX];        char CType[CALLMAX];
   286                                  
   287                                  section .bss
   288                                  absolute 40963
   289 0000A003 <res 0000012C>          FType resb 300
   290                                  section .text
   291                                  section .bss
   292                                  absolute 41263
   293 0000A12F <res 000007D0>          CType resb 2000
   294                                  section .text
   295                                  
   296                                  ;-66 int  FAdr  [FUNCMAX];        int  CAdr [CALLMAX];
   297                                  
   298                                  section .bss
   299                                  absolute 43263
   300 0000A8FF <res 00000258>          FAdr resw 300
   301                                  section .text
   302                                  section .bss
   303                                  absolute 43863
   304 0000AB57 <res 00000FA0>          CAdr resw 2000
   305                                  section .text
   306                                  
   307                                  ;-67 int  FCalls[FUNCMAX];
   308                                  
   309                                  section .bss
   310                                  absolute 47863
   311 0000BAF7 <res 00000258>          FCalls resw 300
   312                                  section .text
   313                                  
   314                                  ;-68 char FNameField[FNAMEMAX];   //char CNameField[CNAMEMAX];
   315                                  
   316                                  section .bss
   317                                  absolute 48463
   318 0000BD4F <res 000012C0>          FNameField resb 4800
   319                                  section .text
   320                                  
   321                                  ;-69 char NameA[]="12345678901234567890123456789012"; //must be in low memory
   322                                  
   323 00000047 313233343536373839-     NameA db "12345678901234567890123456789012",0
   324 00000050 303132333435363738-
   325 00000059 393031323334353637-
   326 00000062 383930313200       
   327                                  
   328                                  ;-70 char fgetsdest[128];         unsigned char *CNameTop=0;
   329                                  
   330                                  section .bss
   331                                  absolute 53263
   332 0000D00F <res 00000080>          fgetsdest resb 128
   333                                  section .text
   334 00000068 0000                    CNameTop dw 0
   335                                  
   336                                  ;-71 unsigned char *fgetsp=0;     unsigned int segE;
   337                                  
   338 0000006A 0000                    fgetsp dw 0
   339 0000006C 0000                    segE dw 0
   340                                  
   341                                  ;-72 unsigned int lineno=1;       unsigned int linenoinclude=1;
   342                                  
   343 0000006E 0100                    lineno dw 1
   344 00000070 0100                    linenoinclude dw 1
   345                                  
   346                                  ;-73 unsigned char *pt=0;         unsigned char *p1=0;
   347                                  
   348 00000072 0000                    pt dw 0
   349 00000074 0000                    p1 dw 0
   350                                  
   351                                  ;-74 int DOS_ERR=0; int DOS_NoBytes=0; char DOS_ByteRead=0;
   352                                  
   353 00000076 0000                    DOS_ERR dw 0
   354 00000078 0000                    DOS_NoBytes dw 0
   355 0000007A 00                      DOS_ByteRead db 0
   356                                  
   357                                  ;-75 
   358                                  
   359                                  
   360                                  ;-76 int writetty()     { ah=0x0E; bx=0; __emit__(0xCD,0x10); } 
   361                                  
   362                                  
   363                                  writetty:  ; *** PROC ***
   364 0000007B B40E                     mov  ah, 14
   365 0000007D BB0000                   mov  bx, 0
   366 00000080 CD10                     db 205,16
   367                                  
   368                                  ;-77 int putch(char c)  {if (_ c==10) {al=13; writetty();} al=c; writetty(); }
   369                                  
   370 00000082 C3                       ret
   371                                  ; ENDP
   372                                  
   373                                  putch:  ; *** PROC ***
   374                                  ;Function : putch, Number of local variables: 1
   375                                  ;   # type sign width addr used name   list of local variables
   376                                  ;  200 var sign byte    77 NULL c = bp+4;
   377 00000083 C8000000                 ENTER  0,0 ; constant expression
   378 00000087 807E040A                cmp byte[bp+4], 10
   379 0000008B 0F850500                 jne @@putch1
   380 0000008F B00D                     mov  al, 13
   381 00000091 E8E7FF                   call writetty
   382                                  @@putch1:
   383 00000094 8A4604                   mov  al, [bp+4]
   384 00000097 E8E1FF                   call writetty
   385                                  
   386                                  ;-78 int cputs(char *s) {char c;  while(*s) { c=*s; putch(c); s++; } }
   387 0000009A C9                       LEAVE
   388 0000009B C3                       ret
   389                                  ; ENDP
   390                                  
   391                                  cputs:  ; *** PROC ***
   392                                  ;Function : cputs, Number of local variables: 2
   393                                  ;   # type sign width addr used name   list of local variables
   394                                  ;  200 ptr sign byte    78 NULL s = bp+4
   395                                  ;  201 var sign byte    78 NULL c = bp-2;
   396 0000009C C8020000                 ENTER  2,0
   397                                  @@cputs2:
   398 000000A0 8B5E04                   mov bx, [bp+4]
   399 000000A3 8A07                     mov al, [bx]
   400 000000A5 B400                     mov ah, 0
   401 000000A7 08C0                     or  al, al
   402 000000A9 0F841B00                 je @@cputs3
   403 000000AD 8B5E04                   mov bx, [bp+4]
   404 000000B0 8A07                     mov al, [bx]
   405 000000B2 B400                     mov ah, 0
   406 000000B4 8846FE                   mov [bp-2], al
   407 000000B7 8A46FE                   mov al, byte [bp-2]
   408 000000BA B400                     mov ah, 0
   409 000000BC 50                       push ax
   410 000000BD E8C3FF                   call putch
   411 000000C0 83C402                   add  sp, 2
   412 000000C3 FF4604                   inc  word[bp+4]
   413 000000C6 EBD8                     jmp @@cputs2
   414                                  @@cputs3:
   415                                  
   416                                  ;-79 int mkneg(int n)   { n; __asm {neg ax} }
   417 000000C8 C9                       LEAVE
   418 000000C9 C3                       ret
   419                                  ; ENDP
   420                                  
   421                                  mkneg:  ; *** PROC ***
   422                                  ;Function : mkneg, Number of local variables: 1
   423                                  ;   # type sign width addr used name   list of local variables
   424                                  ;  200 var sign word    79 NULL n = bp+4;
   425 000000CA C8000000                 ENTER  0,0
   426 000000CE 8B4604                   mov ax, [bp+4]
   427 000000D1 F7D8                    neg ax
   428                                  
   429                                  ;-80 
   430                                  
   431                                  
   432                                  ;-81 int DosInt() { 
   433 000000D3 C9                       LEAVE
   434 000000D4 C3                       ret
   435                                  ; ENDP
   436                                  
   437                                  DosInt:  ; *** PROC ***
   438                                  
   439                                  ;-82     __emit__(0xCD,0x21);//inth 0x21; 
   440                                  
   441 000000D5 CD21                     db 205,33
   442                                  
   443                                  ;-83     __emit__(0x73, 04); //ifcarry DOS_ERR++;
   444                                  
   445 000000D7 7304                     db 115,4
   446                                  
   447                                  ;-84     DOS_ERR++;
   448                                  
   449 000000D9 FF06[7600]               inc  word[DOS_ERR]
   450                                  
   451                                  ;-85 }
   452                                  
   453                                  
   454                                  ;-86 int openR (char *s) { dx=s;       ax=0x3D02; DosInt(); }
   455                                  
   456 000000DD C3                       ret
   457                                  ; ENDP
   458                                  
   459                                  openR:  ; *** PROC ***
   460                                  ;Function : openR, Number of local variables: 1
   461                                  ;   # type sign width addr used name   list of local variables
   462                                  ;  200 ptr sign byte    86 NULL s = bp+4;
   463 000000DE C8000000                 ENTER  0,0
   464 000000E2 8B5604                   mov  dx, [bp+4]
   465 000000E5 B8023D                   mov  ax, 15618
   466 000000E8 E8EAFF                   call DosInt
   467                                  
   468                                  ;-87 int creatR(char *s) { dx=s; cx=0; ax=0x3C00; DosInt(); }
   469 000000EB C9                       LEAVE
   470 000000EC C3                       ret
   471                                  ; ENDP
   472                                  
   473                                  creatR:  ; *** PROC ***
   474                                  ;Function : creatR, Number of local variables: 1
   475                                  ;   # type sign width addr used name   list of local variables
   476                                  ;  200 ptr sign byte    87 NULL s = bp+4;
   477 000000ED C8000000                 ENTER  0,0
   478 000000F1 8B5604                   mov  dx, [bp+4]
   479 000000F4 B90000                   mov  cx, 0
   480 000000F7 B8003C                   mov  ax, 15360
   481 000000FA E8D8FF                   call DosInt
   482                                  
   483                                  ;-88 int fcloseR(int fd) {bx=fd;       ax=0x3E00; DosInt(); }
   484 000000FD C9                       LEAVE
   485 000000FE C3                       ret
   486                                  ; ENDP
   487                                  
   488                                  fcloseR:  ; *** PROC ***
   489                                  ;Function : fcloseR, Number of local variables: 1
   490                                  ;   # type sign width addr used name   list of local variables
   491                                  ;  200 var sign word    88 NULL fd = bp+4;
   492 000000FF C8000000                 ENTER  0,0
   493 00000103 8B5E04                   mov  bx, [bp+4]
   494 00000106 B8003E                   mov  ax, 15872
   495 00000109 E8C9FF                   call DosInt
   496                                  
   497                                  ;-89 int exitR  (char c) {ah=0x4C; al=c;          DosInt(); }
   498 0000010C C9                       LEAVE
   499 0000010D C3                       ret
   500                                  ; ENDP
   501                                  
   502                                  exitR:  ; *** PROC ***
   503                                  ;Function : exitR, Number of local variables: 1
   504                                  ;   # type sign width addr used name   list of local variables
   505                                  ;  200 var sign byte    89 NULL c = bp+4;
   506 0000010E C8000000                 ENTER  0,0
   507 00000112 B44C                     mov  ah, 76
   508 00000114 8A4604                   mov  al, [bp+4]
   509 00000117 E8BBFF                   call DosInt
   510                                  
   511                                  ;-90 int readR (char *s, int fd) {dx=s; cx=1; bx=fd; ax=0x3F00; DosInt(); }
   512 0000011A C9                       LEAVE
   513 0000011B C3                       ret
   514                                  ; ENDP
   515                                  
   516                                  readR:  ; *** PROC ***
   517                                  ;Function : readR, Number of local variables: 2
   518                                  ;   # type sign width addr used name   list of local variables
   519                                  ;  200 ptr sign byte    90 NULL s = bp+4
   520                                  ;  201 var sign word    90 NULL fd = bp+6;
   521 0000011C C8000000                 ENTER  0,0
   522 00000120 8B5604                   mov  dx, [bp+4]
   523 00000123 B90100                   mov  cx, 1
   524 00000126 8B5E06                   mov  bx, [bp+6]
   525 00000129 B8003F                   mov  ax, 16128
   526 0000012C E8A6FF                   call DosInt
   527                                  
   528                                  ;-91 int readRL(char *s, int fd, int len){dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}
   529 0000012F C9                       LEAVE
   530 00000130 C3                       ret
   531                                  ; ENDP
   532                                  
   533                                  readRL:  ; *** PROC ***
   534                                  ;Function : readRL, Number of local variables: 3
   535                                  ;   # type sign width addr used name   list of local variables
   536                                  ;  200 ptr sign byte    91 NULL s = bp+4
   537                                  ;  201 var sign word    91 NULL fd = bp+6
   538                                  ;  202 var sign word    91 NULL len = bp+8;
   539 00000131 C8000000                 ENTER  0,0
   540 00000135 8B5604                   mov  dx, [bp+4]
   541 00000138 8B4E08                   mov  cx, [bp+8]
   542 0000013B 8B5E06                   mov  bx, [bp+6]
   543 0000013E B8003F                   mov  ax, 16128
   544 00000141 E891FF                   call DosInt
   545                                  
   546                                  ;-92 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
   547 00000144 C9                       LEAVE
   548 00000145 C3                       ret
   549                                  ; ENDP
   550                                  
   551                                  fputcR:  ; *** PROC ***
   552                                  ;Function : fputcR, Number of local variables: 2
   553                                  ;   # type sign width addr used name   list of local variables
   554                                  ;  200 ptr sign byte    92 NULL n = bp+4
   555                                  ;  201 var sign word    92 NULL fd = bp+6;
   556 00000146 C8000000                 ENTER  0,0
   557 0000014A 8D5604                  lea dx, [bp+4]
   558                                  
   559                                  ;-93   cx=1; bx=fd; ax=0x4000; DosInt(); }
   560                                  
   561 0000014D B90100                   mov  cx, 1
   562 00000150 8B5E06                   mov  bx, [bp+6]
   563 00000153 B80040                   mov  ax, 16384
   564 00000156 E87CFF                   call DosInt
   565                                  
   566                                  ;-94 
   567                                  
   568                                  
   569                                  ;-95 int strlen(char *s) { int c; c=0; while (*s!=0) {s++; c++;} return c; }
   570 00000159 C9                       LEAVE
   571 0000015A C3                       ret
   572                                  ; ENDP
   573                                  
   574                                  strlen:  ; *** PROC ***
   575                                  ;Function : strlen, Number of local variables: 2
   576                                  ;   # type sign width addr used name   list of local variables
   577                                  ;  200 ptr sign byte    95 NULL s = bp+4
   578                                  ;  201 var sign word    95 NULL c = bp-2;
   579 0000015B C8020000                 ENTER  2,0
   580 0000015F B80000                   mov ax, 0
   581 00000162 8946FE                   mov [bp-2], ax
   582                                  @@strlen4:
   583 00000165 8B5E04                   mov bx, [bp+4]
   584 00000168 8A07                     mov al, [bx]
   585 0000016A B400                     mov ah, 0
   586 0000016C 83F800                   cmp ax, 0
   587 0000016F 0F840800                 je  @@strlen5
   588 00000173 FF4604                   inc  word[bp+4]
   589 00000176 FF46FE                   inc  word[bp-2]
   590 00000179 EBEA                     jmp @@strlen4
   591                                  @@strlen5:
   592 0000017B 8B46FE                   mov ax, [bp-2]
   593 0000017E E90000                   jmp @@retn
   594                                  
   595                                  ;-96 int strcpy(char *s, char *t) {do { *s=*t; s++; t++; } while (*t!=0); *s=0; }
   596                                  
   597 00000181 C9                      @@retn: LEAVE
   598 00000182 C3                       ret
   599                                  ; ENDP
   600                                  
   601                                  strcpy:  ; *** PROC ***
   602                                  ;Function : strcpy, Number of local variables: 2
   603                                  ;   # type sign width addr used name   list of local variables
   604                                  ;  200 ptr sign byte    96 NULL s = bp+4
   605                                  ;  201 ptr sign byte    96 NULL t = bp+6;
   606 00000183 C8000000                 ENTER  0,0
   607                                  @@strcpy6:
   608 00000187 8B5E06                   mov bx, [bp+6]
   609 0000018A 8A07                     mov al, [bx]
   610 0000018C B400                     mov ah, 0
   611 0000018E 8B5E04                   mov  bx, [bp+4]
   612 00000191 8807                     mov  [bx], al
   613 00000193 FF4604                   inc  word[bp+4]
   614 00000196 FF4606                   inc  word[bp+6]
   615 00000199 8B5E06                   mov bx, [bp+6]
   616 0000019C 8A07                     mov al, [bx]
   617 0000019E B400                     mov ah, 0
   618 000001A0 83F800                   cmp ax, 0
   619 000001A3 0F840200                 je  @@strcpy7
   620 000001A7 EBDE                     jmp @@strcpy6
   621                                  @@strcpy7:
   622 000001A9 B80000                   mov ax, 0
   623 000001AC 8B5E04                   mov  bx, [bp+4]
   624 000001AF 8807                     mov  [bx], al
   625                                  
   626                                  ;-97 int eqstr(char *p, char *q) { while(*p) {
   627 000001B1 C9                       LEAVE
   628 000001B2 C3                       ret
   629                                  ; ENDP
   630                                  
   631                                  eqstr:  ; *** PROC ***
   632                                  ;Function : eqstr, Number of local variables: 2
   633                                  ;   # type sign width addr used name   list of local variables
   634                                  ;  200 ptr sign byte    97 NULL p = bp+4
   635                                  ;  201 ptr sign byte    97 NULL q = bp+6;
   636 000001B3 C8000000                 ENTER  0,0
   637                                  @@eqstr8:
   638 000001B7 8B5E04                   mov bx, [bp+4]
   639 000001BA 8A07                     mov al, [bx]
   640 000001BC B400                     mov ah, 0
   641 000001BE 08C0                     or  al, al
   642 000001C0 0F842000                 je @@eqstr9
   643                                  
   644                                  ;-98     if (*p != *q) return 0; p++; q++; }
   645                                  
   646 000001C4 8B5E04                   mov bx, [bp+4]
   647 000001C7 8A07                     mov al, [bx]
   648 000001C9 B400                     mov ah, 0
   649 000001CB 8B5E06                   mov bx, [bp+6]
   650 000001CE 3A07                     cmp al, [bx]
   651 000001D0 B400                     mov ah, 0
   652 000001D2 0F840600                 je  @@eqstr10
   653 000001D6 B80000                   mov ax, 0
   654 000001D9 E92100                   jmp @@retn
   655                                  @@eqstr10:
   656 000001DC FF4604                   inc  word[bp+4]
   657 000001DF FF4606                   inc  word[bp+6]
   658                                  
   659                                  ;-99     if(*q) return 0; return 1; }
   660                                  
   661 000001E2 EBD3                     jmp @@eqstr8
   662                                  @@eqstr9:
   663 000001E4 8B5E06                   mov bx, [bp+6]
   664 000001E7 8A07                     mov al, [bx]
   665 000001E9 B400                     mov ah, 0
   666 000001EB 08C0                     or  al, al
   667 000001ED 0F840600                 je @@eqstr11
   668 000001F1 B80000                   mov ax, 0
   669 000001F4 E90600                   jmp @@retn
   670                                  @@eqstr11:
   671 000001F7 B80100                   mov ax, 1
   672 000001FA E90000                   jmp @@retn
   673                                  
   674                                  ;-100 int instr1(char *s, char c) { while(*s) {if (*s==c) return 1; s++;}return 0;}
   675                                  
   676 000001FD C9                      @@retn: LEAVE
   677 000001FE C3                       ret
   678                                  ; ENDP
   679                                  
   680                                  instr1:  ; *** PROC ***
   681                                  ;Function : instr1, Number of local variables: 2
   682                                  ;   # type sign width addr used name   list of local variables
   683                                  ;  200 ptr sign byte   100 NULL s = bp+4
   684                                  ;  201 var sign byte   100 NULL c = bp+6;
   685 000001FF C8000000                 ENTER  0,0
   686                                  @@instr112:
   687 00000203 8B5E04                   mov bx, [bp+4]
   688 00000206 8A07                     mov al, [bx]
   689 00000208 B400                     mov ah, 0
   690 0000020A 08C0                     or  al, al
   691 0000020C 0F841900                 je @@instr113
   692 00000210 8B5E04                   mov bx, [bp+4]
   693 00000213 8A07                     mov al, [bx]
   694 00000215 B400                     mov ah, 0
   695 00000217 3A4606                   cmp al, [bp+6]
   696 0000021A 0F850600                 jne @@instr114
   697 0000021E B80100                   mov ax, 1
   698 00000221 E90B00                   jmp @@retn
   699                                  @@instr114:
   700 00000224 FF4604                   inc  word[bp+4]
   701 00000227 EBDA                     jmp @@instr112
   702                                  @@instr113:
   703 00000229 B80000                   mov ax, 0
   704 0000022C E90000                   jmp @@retn
   705                                  
   706                                  ;-101 int instr2(char *s, char c) { while(*s) {if (*s==c)return &s; s++;}return 0;}
   707                                  
   708 0000022F C9                      @@retn: LEAVE
   709 00000230 C3                       ret
   710                                  ; ENDP
   711                                  
   712                                  instr2:  ; *** PROC ***
   713                                  ;Function : instr2, Number of local variables: 2
   714                                  ;   # type sign width addr used name   list of local variables
   715                                  ;  200 ptr sign byte   101 NULL s = bp+4
   716                                  ;  201 var sign byte   101 NULL c = bp+6;
   717 00000231 C8000000                 ENTER  0,0
   718                                  @@instr215:
   719 00000235 8B5E04                   mov bx, [bp+4]
   720 00000238 8A07                     mov al, [bx]
   721 0000023A B400                     mov ah, 0
   722 0000023C 08C0                     or  al, al
   723 0000023E 0F841900                 je @@instr216
   724 00000242 8B5E04                   mov bx, [bp+4]
   725 00000245 8A07                     mov al, [bx]
   726 00000247 B400                     mov ah, 0
   727 00000249 3A4606                   cmp al, [bp+6]
   728 0000024C 0F850600                 jne @@instr217
   729 00000250 8B4604                   mov ax, [bp+4]
   730 00000253 E90B00                   jmp @@retn
   731                                  @@instr217:
   732 00000256 FF4604                   inc  word[bp+4]
   733 00000259 EBDA                     jmp @@instr215
   734                                  @@instr216:
   735 0000025B B80000                   mov ax, 0
   736 0000025E E90000                   jmp @@retn
   737                                  
   738                                  ;-102 int strcat1(char *s, char *t) { while (*s != 0) s++; strcpy(s, t);  }
   739                                  
   740 00000261 C9                      @@retn: LEAVE
   741 00000262 C3                       ret
   742                                  ; ENDP
   743                                  
   744                                  strcat1:  ; *** PROC ***
   745                                  ;Function : strcat1, Number of local variables: 2
   746                                  ;   # type sign width addr used name   list of local variables
   747                                  ;  200 ptr sign byte   102 NULL s = bp+4
   748                                  ;  201 ptr sign byte   102 NULL t = bp+6;
   749 00000263 C8000000                 ENTER  0,0
   750                                  @@strcat118:
   751 00000267 8B5E04                   mov bx, [bp+4]
   752 0000026A 8A07                     mov al, [bx]
   753 0000026C B400                     mov ah, 0
   754 0000026E 83F800                   cmp ax, 0
   755 00000271 0F840500                 je  @@strcat119
   756 00000275 FF4604                   inc  word[bp+4]
   757 00000278 EBED                     jmp @@strcat118
   758                                  @@strcat119:
   759 0000027A FF7606                   push word [bp+6]
   760 0000027D FF7604                   push word [bp+4]
   761 00000280 E800FF                   call strcpy
   762 00000283 83C404                   add  sp, 4
   763                                  
   764                                  ;-103 int toupper(char *s) {while(*s) {if (*s >= 'a') if (*s <= 'z') *s=*s-32; s++;}}
   765 00000286 C9                       LEAVE
   766 00000287 C3                       ret
   767                                  ; ENDP
   768                                  
   769                                  toupper:  ; *** PROC ***
   770                                  ;Function : toupper, Number of local variables: 1
   771                                  ;   # type sign width addr used name   list of local variables
   772                                  ;  200 ptr sign byte   103 NULL s = bp+4;
   773 00000288 C8000000                 ENTER  0,0
   774                                  @@toupper20:
   775 0000028C 8B5E04                   mov bx, [bp+4]
   776 0000028F 8A07                     mov al, [bx]
   777 00000291 B400                     mov ah, 0
   778 00000293 08C0                     or  al, al
   779 00000295 0F843000                 je @@toupper21
   780 00000299 8B5E04                   mov bx, [bp+4]
   781 0000029C 8A07                     mov al, [bx]
   782 0000029E B400                     mov ah, 0
   783 000002A0 83F861                   cmp ax, 97 ;unsigned : 1
   784 000002A3 0F8C1D00                 jl  @@toupper22
   785 000002A7 8B5E04                   mov bx, [bp+4]
   786 000002AA 8A07                     mov al, [bx]
   787 000002AC B400                     mov ah, 0
   788 000002AE 83F87A                   cmp ax, 122
   789 000002B1 0F8F0F00                 jg  @@toupper23
   790 000002B5 8B5E04                   mov bx, [bp+4]
   791 000002B8 8A07                     mov al, [bx]
   792 000002BA B400                     mov ah, 0
   793 000002BC 83E820                   sub ax, 32
   794 000002BF 8B5E04                   mov  bx, [bp+4]
   795 000002C2 8807                     mov  [bx], al
   796                                  @@toupper23:
   797                                  @@toupper22:
   798 000002C4 FF4604                   inc  word[bp+4]
   799 000002C7 EBC3                     jmp @@toupper20
   800                                  @@toupper21:
   801                                  
   802                                  ;-104 int pint (int n){int e; if(n<0) {  prc('-');  n=mkneg(n); }
   803 000002C9 C9                       LEAVE
   804 000002CA C3                       ret
   805                                  ; ENDP
   806                                  
   807                                  pint:  ; *** PROC ***
   808                                  ;Function : pint, Number of local variables: 2
   809                                  ;   # type sign width addr used name   list of local variables
   810                                  ;  200 var sign word   104 NULL n = bp+4
   811                                  ;  201 var sign word   104 NULL e = bp-2;
   812 000002CB C8020000                 ENTER  2,0
   813 000002CF 8B4604                   mov ax, [bp+4]
   814 000002D2 83F800                   cmp ax, 0
   815 000002D5 0F8D1400                 jge @@pint24
   816 000002D9 6A2D                     push 45
   817 000002DB E83245                   call prc
   818 000002DE 83C402                   add  sp, 2
   819 000002E1 FF7604                   push word [bp+4]
   820 000002E4 E8E3FD                   call mkneg
   821 000002E7 83C402                   add  sp, 2
   822 000002EA 894604                   mov [bp+4], ax
   823                                  
   824                                  ;-105   if (n >= 10) {e=n/10;  pint(e);}  n=n%10; n=n+'0'; putch(n); }
   825                                  
   826                                  @@pint24:
   827 000002ED 8B4604                   mov ax, [bp+4]
   828 000002F0 83F80A                   cmp ax, 10 ;unsigned : 1
   829 000002F3 0F8C1500                 jl  @@pint25
   830 000002F7 8B4604                   mov ax, [bp+4]
   831 000002FA BB0A00                   mov bx, 10
   832 000002FD 99                       cwd
   833 000002FE F7FB                     idiv bx
   834 00000300 8946FE                   mov [bp-2], ax
   835 00000303 FF76FE                   push word [bp-2]
   836 00000306 E8C2FF                   call pint
   837 00000309 83C402                   add  sp, 2
   838                                  @@pint25:
   839 0000030C 8B4604                   mov ax, [bp+4]
   840 0000030F BB0A00                   mov bx, 10
   841 00000312 99                       cwd
   842 00000313 F7FB                     idiv bx
   843 00000315 89D0                     mov ax, dx
   844 00000317 894604                   mov [bp+4], ax
   845 0000031A 8B4604                   mov ax, [bp+4]
   846 0000031D 83C030                   add ax, 48
   847 00000320 894604                   mov [bp+4], ax
   848 00000323 FF7604                   push word [bp+4]
   849 00000326 E85AFD                   call putch
   850 00000329 83C402                   add  sp, 2
   851                                  
   852                                  ;-106 int digit(char c){ 
   853 0000032C C9                       LEAVE
   854 0000032D C3                       ret
   855                                  ; ENDP
   856                                  
   857                                  digit:  ; *** PROC ***
   858                                  
   859                                  ;-107     if(c<'0') return 0; 
   860                                  
   861                                  ;Function : digit, Number of local variables: 1
   862                                  ;   # type sign width addr used name   list of local variables
   863                                  ;  200 var sign byte   106 NULL c = bp+4;
   864 0000032E C8000000                 ENTER  0,0
   865 00000332 8A4604                   mov al, [bp+4]
   866 00000335 3C30                     cmp al, 48
   867 00000337 0F8D0600                 jge @@digit26
   868 0000033B B80000                   mov ax, 0
   869 0000033E E91500                   jmp @@retn
   870                                  
   871                                  ;-108     if(c>'9') return 0; 
   872                                  
   873                                  @@digit26:
   874 00000341 8A4604                   mov al, [bp+4]
   875 00000344 3C39                     cmp al, 57
   876 00000346 0F8E0600                 jle @@digit27
   877 0000034A B80000                   mov ax, 0
   878 0000034D E90600                   jmp @@retn
   879                                  
   880                                  ;-109     return 1; 
   881                                  
   882                                  @@digit27:
   883 00000350 B80100                   mov ax, 1
   884 00000353 E90000                   jmp @@retn
   885                                  
   886                                  ;-110 }
   887                                  
   888                                  
   889                                  ;-111 int letter(char c) { 
   890                                  
   891 00000356 C9                      @@retn: LEAVE
   892 00000357 C3                       ret
   893                                  ; ENDP
   894                                  
   895                                  letter:  ; *** PROC ***
   896                                  
   897                                  ;-112     if (digit(c)) return 1;   ////////
   898                                  
   899                                  ;Function : letter, Number of local variables: 1
   900                                  ;   # type sign width addr used name   list of local variables
   901                                  ;  200 var sign byte   111 NULL c = bp+4;
   902 00000358 C8000000                 ENTER  0,0
   903 0000035C 8A4604                   mov al, byte [bp+4]
   904 0000035F B400                     mov ah, 0
   905 00000361 50                       push ax
   906 00000362 E8C9FF                   call digit
   907 00000365 83C402                   add  sp, 2
   908 00000368 08C0                     or  al, al
   909 0000036A 0F840600                 je @@letter28
   910 0000036E B80100                   mov ax, 1
   911 00000371 E97800                   jmp @@retn
   912                                  
   913                                  ;-113     if (c=='_') return 1;
   914                                  
   915                                  @@letter28:
   916 00000374 8A4604                   mov al, [bp+4]
   917 00000377 3C5F                     cmp al, 95
   918 00000379 0F850600                 jne @@letter29
   919 0000037D B80100                   mov ax, 1
   920 00000380 E96900                   jmp @@retn
   921                                  
   922                                  ;-114     if (c=='.') return 1;
   923                                  
   924                                  @@letter29:
   925 00000383 8A4604                   mov al, [bp+4]
   926 00000386 3C2E                     cmp al, 46
   927 00000388 0F850600                 jne @@letter30
   928 0000038C B80100                   mov ax, 1
   929 0000038F E95A00                   jmp @@retn
   930                                  
   931                                  ;-115     if (c=='?') return 1;
   932                                  
   933                                  @@letter30:
   934 00000392 8A4604                   mov al, [bp+4]
   935 00000395 3C3F                     cmp al, 63
   936 00000397 0F850600                 jne @@letter31
   937 0000039B B80100                   mov ax, 1
   938 0000039E E94B00                   jmp @@retn
   939                                  
   940                                  ;-116     if (c=='$') return 1;
   941                                  
   942                                  @@letter31:
   943 000003A1 8A4604                   mov al, [bp+4]
   944 000003A4 3C24                     cmp al, 36
   945 000003A6 0F850600                 jne @@letter32
   946 000003AA B80100                   mov ax, 1
   947 000003AD E93C00                   jmp @@retn
   948                                  
   949                                  ;-117     if (c> 'z') return 0; 
   950                                  
   951                                  @@letter32:
   952 000003B0 8A4604                   mov al, [bp+4]
   953 000003B3 3C7A                     cmp al, 122
   954 000003B5 0F8E0600                 jle @@letter33
   955 000003B9 B80000                   mov ax, 0
   956 000003BC E92D00                   jmp @@retn
   957                                  
   958                                  ;-118     if (c< '@') return 0;// at included
   959                                  
   960                                  @@letter33:
   961 000003BF 8A4604                   mov al, [bp+4]
   962 000003C2 3C40                     cmp al, 64
   963 000003C4 0F8D0600                 jge @@letter34
   964 000003C8 B80000                   mov ax, 0
   965 000003CB E91E00                   jmp @@retn
   966                                  
   967                                  ;-119     if (c> 'Z') { if (c< 'a') return 0; }  
   968                                  
   969                                  @@letter34:
   970 000003CE 8A4604                   mov al, [bp+4]
   971 000003D1 3C5A                     cmp al, 90
   972 000003D3 0F8E0F00                 jle @@letter35
   973 000003D7 8A4604                   mov al, [bp+4]
   974 000003DA 3C61                     cmp al, 97
   975 000003DC 0F8D0600                 jge @@letter36
   976 000003E0 B80000                   mov ax, 0
   977 000003E3 E90600                   jmp @@retn
   978                                  @@letter36:
   979                                  
   980                                  ;-120     return 1; 
   981                                  
   982                                  @@letter35:
   983 000003E6 B80100                   mov ax, 1
   984 000003E9 E90000                   jmp @@retn
   985                                  
   986                                  ;-121 }    
   987                                  
   988                                  
   989                                  ;-122 int alnum(char c) {
   990                                  
   991 000003EC C9                      @@retn: LEAVE
   992 000003ED C3                       ret
   993                                  ; ENDP
   994                                  
   995                                  alnum:  ; *** PROC ***
   996                                  
   997                                  ;-123   if (digit (c)) return 1;
   998                                  
   999                                  ;Function : alnum, Number of local variables: 1
  1000                                  ;   # type sign width addr used name   list of local variables
  1001                                  ;  200 var sign byte   122 NULL c = bp+4;
  1002 000003EE C8000000                 ENTER  0,0
  1003 000003F2 8A4604                   mov al, byte [bp+4]
  1004 000003F5 B400                     mov ah, 0
  1005 000003F7 50                       push ax
  1006 000003F8 E833FF                   call digit
  1007 000003FB 83C402                   add  sp, 2
  1008 000003FE 08C0                     or  al, al
  1009 00000400 0F840600                 je @@alnum37
  1010 00000404 B80100                   mov ax, 1
  1011 00000407 E91E00                   jmp @@retn
  1012                                  
  1013                                  ;-124   if (letter(c)) return 1;
  1014                                  
  1015                                  @@alnum37:
  1016 0000040A 8A4604                   mov al, byte [bp+4]
  1017 0000040D B400                     mov ah, 0
  1018 0000040F 50                       push ax
  1019 00000410 E845FF                   call letter
  1020 00000413 83C402                   add  sp, 2
  1021 00000416 08C0                     or  al, al
  1022 00000418 0F840600                 je @@alnum38
  1023 0000041C B80100                   mov ax, 1
  1024 0000041F E90600                   jmp @@retn
  1025                                  
  1026                                  ;-125   return 0;
  1027                                  
  1028                                  @@alnum38:
  1029 00000422 B80000                   mov ax, 0
  1030 00000425 E90000                   jmp @@retn
  1031                                  
  1032                                  ;-126 }       
  1033                                  
  1034                                  
  1035                                  ;-127 int a(unsigned int i) {  printName(i);}//address
  1036                                  
  1037 00000428 C9                      @@retn: LEAVE
  1038 00000429 C3                       ret
  1039                                  ; ENDP
  1040                                  
  1041                                  a:  ; *** PROC ***
  1042                                  ;Function : a, Number of local variables: 1
  1043                                  ;   # type sign width addr used name   list of local variables
  1044                                  ;  200 var unsg word   127 NULL i = bp+4;
  1045 0000042A C8000000                 ENTER  0,0
  1046 0000042E FF7604                   push word [bp+4]
  1047 00000431 E88D05                   call printName
  1048 00000434 83C402                   add  sp, 2
  1049                                  
  1050                                  ;-128 int v(unsigned int i) {//value 
  1051 00000437 C9                       LEAVE
  1052 00000438 C3                       ret
  1053                                  ; ENDP
  1054                                  
  1055                                  v:  ; *** PROC ***
  1056                                  
  1057                                  ;-129     if (i < LSTART) prc('['); 
  1058                                  
  1059                                  ;Function : v, Number of local variables: 1
  1060                                  ;   # type sign width addr used name   list of local variables
  1061                                  ;  200 var unsg word   128 NULL i = bp+4;
  1062 00000439 C8000000                 ENTER  0,0
  1063 0000043D 8B4604                   mov ax, [bp+4]
  1064 00000440 3DC800                   cmp ax, 200
  1065 00000443 0F8D0800                 jge @@v39
  1066 00000447 6A5B                     push 91
  1067 00000449 E8C443                   call prc
  1068 0000044C 83C402                   add  sp, 2
  1069                                  
  1070                                  ;-130     printName(i);
  1071                                  
  1072                                  @@v39:
  1073 0000044F FF7604                   push word [bp+4]
  1074 00000452 E86C05                   call printName
  1075 00000455 83C402                   add  sp, 2
  1076                                  
  1077                                  ;-131     if (i < LSTART) prc(']');   
  1078                                  
  1079 00000458 8B4604                   mov ax, [bp+4]
  1080 0000045B 3DC800                   cmp ax, 200
  1081 0000045E 0F8D0800                 jge @@v40
  1082 00000462 6A5D                     push 93
  1083 00000464 E8A943                   call prc
  1084 00000467 83C402                   add  sp, 2
  1085                                  
  1086                                  ;-132 }
  1087                                  
  1088                                  @@v40:
  1089                                  
  1090                                  ;-133 int checknamelen() { int i;    i=strlen(symbol);
  1091 0000046A C9                       LEAVE
  1092 0000046B C3                       ret
  1093                                  ; ENDP
  1094                                  
  1095                                  checknamelen:  ; *** PROC ***
  1096                                  ;Function : checknamelen, Number of local variables: 1
  1097                                  ;   # type sign width addr used name   list of local variables
  1098                                  ;  200 var sign word   133 NULL i = bp-2;
  1099 0000046C C8020000                 ENTER  2,0
  1100 00000470 8D062B81                 lea  ax, [symbol]
  1101 00000474 50                       push ax
  1102 00000475 E8E3FC                   call strlen
  1103 00000478 83C402                   add  sp, 2
  1104 0000047B 8946FE                   mov [bp-2], ax
  1105                                  
  1106                                  ;-134   if (i > IDLENMAX) error1("Item name is too long in characters)");
  1107                                  
  1108 0000047E 8B46FE                   mov ax, [bp-2]
  1109 00000481 83F80F                   cmp ax, 15
  1110 00000484 0F8E0900                 jle @@checknamelen41
  1111 00000488 68[9304]                 push checknamelen_0
  1112 0000048B E8D246                   call error1
  1113 0000048E 83C402                   add  sp, 2
  1114                                  
  1115                                  ;-135 }
  1116                                  
  1117                                  @@checknamelen41:
  1118                                  
  1119                                  ;-136 char doglobName[IDLENMAX];
  1120 00000491 C9                       LEAVE
  1121 00000492 C3                       ret
  1122                                  ; ENDP
  1123 00000493 4974656D206E616D65-     checknamelen_0 db "Item name is too long in characters)",0
  1124 0000049C 20697320746F6F206C-
  1125 000004A5 6F6E6720696E206368-
  1126 000004AE 617261637465727329-
  1127 000004B7 00                 
  1128                                  section .bss
  1129                                  absolute 53391
  1130 0000D08F <res 0000000F>          doglobName resb 15
  1131                                  section .text
  1132                                  
  1133                                  ;-137 int doglob() { int i; int j; int isstrarr; isstrarr=0;
  1134                                  
  1135                                  
  1136                                  doglob:  ; *** PROC ***
  1137                                  ;Function : doglob, Number of local variables: 3
  1138                                  ;   # type sign width addr used name   list of local variables
  1139                                  ;  200 var sign word   137 NULL i = bp-2
  1140                                  ;  201 var sign word   137 NULL j = bp-4
  1141                                  ;  202 var sign word   137 NULL isstrarr = bp-6;
  1142 000004B8 C8060000                 ENTER  6,0
  1143 000004BC B80000                   mov ax, 0
  1144 000004BF 8946FA                   mov [bp-6], ax
  1145                                  
  1146                                  ;-138   if (GTop >= LSTART) error1("Global table full");
  1147                                  
  1148 000004C2 A1[3200]                 mov ax, [GTop]
  1149 000004C5 3DC800                   cmp ax, 200 ;unsigned : 1
  1150 000004C8 0F8C0900                 jl  @@doglob42
  1151 000004CC 68[0D08]                 push doglob_0
  1152 000004CF E88E46                   call error1
  1153 000004D2 83C402                   add  sp, 2
  1154                                  
  1155                                  ;-139   if (iswidth == 0) error1("no VOID as var type");
  1156                                  
  1157                                  @@doglob42:
  1158 000004D5 A0[4000]                 mov al, [iswidth]
  1159 000004D8 3C00                     cmp al, 0
  1160 000004DA 0F850900                 jne @@doglob43
  1161 000004DE 68[1F08]                 push doglob_1
  1162 000004E1 E87C46                   call error1
  1163 000004E4 83C402                   add  sp, 2
  1164                                  
  1165                                  ;-140   checknamelen();
  1166                                  
  1167                                  @@doglob43:
  1168 000004E7 E882FF                   call checknamelen
  1169                                  
  1170                                  ;-141   if (checkName() != 0) error1("Variable already defined");
  1171                                  
  1172 000004EA E88305                   call checkName
  1173 000004ED 3C00                     cmp al, 0
  1174 000004EF 0F840900                 je  @@doglob44
  1175 000004F3 68[3308]                 push doglob_2
  1176 000004F6 E86746                   call error1
  1177 000004F9 83C402                   add  sp, 2
  1178                                  
  1179                                  ;-142   if (istoken('[')) { istype='&';
  1180                                  
  1181                                  @@doglob44:
  1182 000004FC 6A5B                     push 91
  1183 000004FE E84142                   call istoken
  1184 00000501 83C402                   add  sp, 2
  1185 00000504 08C0                     or  al, al
  1186 00000506 0F84E201                 je @@doglob45
  1187 0000050A B82600                   mov ax, 38
  1188 0000050D A2[3A00]                 mov byte [istype], al
  1189                                  
  1190                                  ;-143     if (istoken(T_CONST)) {
  1191                                  
  1192 00000510 680101                   push 257
  1193 00000513 E82C42                   call istoken
  1194 00000516 83C402                   add  sp, 2
  1195 00000519 08C0                     or  al, al
  1196 0000051B 0F84C200                 je @@doglob46
  1197                                  
  1198                                  ;-144       prs("\nsection .bss\nabsolute ");
  1199                                  
  1200 0000051F 68[4C08]                 push doglob_3
  1201 00000522 E85243                   call prs
  1202 00000525 83C402                   add  sp, 2
  1203                                  
  1204                                  ;-145       prunsign1(orgData);
  1205                                  
  1206 00000528 FF36[1600]               push word [orgData]
  1207 0000052C E8A244                   call prunsign1
  1208 0000052F 83C402                   add  sp, 2
  1209                                  
  1210                                  ;-146       prs("\n"); prs(symbol); 
  1211                                  
  1212 00000532 68[6608]                 push doglob_4
  1213 00000535 E83F43                   call prs
  1214 00000538 83C402                   add  sp, 2
  1215 0000053B 8D062B81                 lea  ax, [symbol]
  1216 0000053F 50                       push ax
  1217 00000540 E83443                   call prs
  1218 00000543 83C402                   add  sp, 2
  1219                                  
  1220                                  ;-147       if (iswidth==1) prs(" resb "); 
  1221                                  
  1222 00000546 A0[4000]                 mov al, [iswidth]
  1223 00000549 3C01                     cmp al, 1
  1224 0000054B 0F850900                 jne @@doglob47
  1225 0000054F 68[6908]                 push doglob_5
  1226 00000552 E82243                   call prs
  1227 00000555 83C402                   add  sp, 2
  1228                                  
  1229                                  ;-148       if (iswidth==2) prs(" resw ");
  1230                                  
  1231                                  @@doglob47:
  1232 00000558 A0[4000]                 mov al, [iswidth]
  1233 0000055B 3C02                     cmp al, 2
  1234 0000055D 0F850900                 jne @@doglob48
  1235 00000561 68[7008]                 push doglob_6
  1236 00000564 E81043                   call prs
  1237 00000567 83C402                   add  sp, 2
  1238                                  
  1239                                  ;-149       if (iswidth==4) prs(" resd ");
  1240                                  
  1241                                  @@doglob48:
  1242 0000056A A0[4000]                 mov al, [iswidth]
  1243 0000056D 3C04                     cmp al, 4
  1244 0000056F 0F850900                 jne @@doglob49
  1245 00000573 68[7708]                 push doglob_7
  1246 00000576 E8FE42                   call prs
  1247 00000579 83C402                   add  sp, 2
  1248                                  
  1249                                  ;-150       prunsign1(lexval); 
  1250                                  
  1251                                  @@doglob49:
  1252 0000057C FF36[3600]               push word [lexval]
  1253 00000580 E84E44                   call prunsign1
  1254 00000583 83C402                   add  sp, 2
  1255                                  
  1256                                  ;-151       prs("\nsection .text");
  1257                                  
  1258 00000586 68[7E08]                 push doglob_8
  1259 00000589 E8EB42                   call prs
  1260 0000058C 83C402                   add  sp, 2
  1261                                  
  1262                                  ;-152       orgData=orgData+lexval;
  1263                                  
  1264 0000058F A1[1600]                 mov ax, [orgData]
  1265 00000592 0306[3600]               add ax, [lexval]
  1266 00000596 A3[1600]                 mov word [orgData], ax
  1267                                  
  1268                                  ;-153       if (iswidth==2) orgData=orgData+lexval;
  1269                                  
  1270 00000599 A0[4000]                 mov al, [iswidth]
  1271 0000059C 3C02                     cmp al, 2
  1272 0000059E 0F850A00                 jne @@doglob50
  1273 000005A2 A1[1600]                 mov ax, [orgData]
  1274 000005A5 0306[3600]               add ax, [lexval]
  1275 000005A9 A3[1600]                 mov word [orgData], ax
  1276                                  
  1277                                  ;-154       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}
  1278                                  
  1279                                  @@doglob50:
  1280 000005AC A0[4000]                 mov al, [iswidth]
  1281 000005AF 3C04                     cmp al, 4
  1282 000005B1 0F851400                 jne @@doglob51
  1283 000005B5 A1[3600]                 mov ax, [lexval]
  1284 000005B8 BB0300                   mov bx, 3
  1285 000005BB F7E3                     mul bx
  1286 000005BD 8946FE                   mov [bp-2], ax
  1287 000005C0 A1[1600]                 mov ax, [orgData]
  1288 000005C3 0346FE                   add ax, [bp-2]
  1289 000005C6 A3[1600]                 mov word [orgData], ax
  1290                                  
  1291                                  ;-155       GData[GTop]=lexval; expect(']');
  1292                                  
  1293                                  @@doglob51:
  1294 000005C9 A1[3600]                 mov ax, [lexval]
  1295 000005CC 8B1E[3200]               mov bx, [GTop]
  1296 000005D0 D1E3                     shl bx, 1
  1297 000005D2 8987EB8A                 mov [GData+bx], ax
  1298 000005D6 6A5D                     push 93
  1299 000005D8 E88941                   call expect
  1300 000005DB 83C402                   add  sp, 2
  1301                                  
  1302                                  ;-156     }else { expect(']');
  1303                                  
  1304 000005DE E90801                   jmp @@doglob52
  1305                                  @@doglob46:
  1306 000005E1 6A5D                     push 93
  1307 000005E3 E87E41                   call expect
  1308 000005E6 83C402                   add  sp, 2
  1309                                  
  1310                                  ;-157       if (iswidth != 1) error1("Only ByteArray allowed");
  1311                                  
  1312 000005E9 A0[4000]                 mov al, [iswidth]
  1313 000005EC 3C01                     cmp al, 1
  1314 000005EE 0F840900                 je  @@doglob53
  1315 000005F2 68[8E08]                 push doglob_9
  1316 000005F5 E86845                   call error1
  1317 000005F8 83C402                   add  sp, 2
  1318                                  
  1319                                  ;-158       prs("\n"); prs(symbol); prs(" db "); 
  1320                                  
  1321                                  @@doglob53:
  1322 000005FB 68[A508]                 push doglob_10
  1323 000005FE E87642                   call prs
  1324 00000601 83C402                   add  sp, 2
  1325 00000604 8D062B81                 lea  ax, [symbol]
  1326 00000608 50                       push ax
  1327 00000609 E86B42                   call prs
  1328 0000060C 83C402                   add  sp, 2
  1329 0000060F 68[A808]                 push doglob_11
  1330 00000612 E86242                   call prs
  1331 00000615 83C402                   add  sp, 2
  1332                                  
  1333                                  ;-159       isstrarr=1; strcpy(doglobName, symbol);
  1334                                  
  1335 00000618 B80100                   mov ax, 1
  1336 0000061B 8946FA                   mov [bp-6], ax
  1337 0000061E 8D062B81                 lea  ax, [symbol]
  1338 00000622 50                       push ax
  1339 00000623 8D068FD0                 lea  ax, [doglobName]
  1340 00000627 50                       push ax
  1341 00000628 E858FB                   call strcpy
  1342 0000062B 83C404                   add  sp, 4
  1343                                  
  1344                                  ;-160       expect('='); 
  1345                                  
  1346 0000062E 6A3D                     push 61
  1347 00000630 E83141                   call expect
  1348 00000633 83C402                   add  sp, 2
  1349                                  
  1350                                  ;-161       if (istoken(T_STRING)) { 
  1351                                  
  1352 00000636 680201                   push 258
  1353 00000639 E80641                   call istoken
  1354 0000063C 83C402                   add  sp, 2
  1355 0000063F 08C0                     or  al, al
  1356 00000641 0F844200                 je @@doglob54
  1357                                  
  1358                                  ;-162         prc(34); prscomment(symbol); prc(34); prs(",0"); 
  1359                                  
  1360 00000645 6A22                     push 34
  1361 00000647 E8C641                   call prc
  1362 0000064A 83C402                   add  sp, 2
  1363 0000064D 8D062B81                 lea  ax, [symbol]
  1364 00000651 50                       push ax
  1365 00000652 E8E641                   call prscomment
  1366 00000655 83C402                   add  sp, 2
  1367 00000658 6A22                     push 34
  1368 0000065A E8B341                   call prc
  1369 0000065D 83C402                   add  sp, 2
  1370 00000660 68[AD08]                 push doglob_12
  1371 00000663 E81142                   call prs
  1372 00000666 83C402                   add  sp, 2
  1373                                  
  1374                                  ;-163         i=strlen(symbol); GData[GTop]=i; }
  1375                                  
  1376 00000669 8D062B81                 lea  ax, [symbol]
  1377 0000066D 50                       push ax
  1378 0000066E E8EAFA                   call strlen
  1379 00000671 83C402                   add  sp, 2
  1380 00000674 8946FE                   mov [bp-2], ax
  1381 00000677 8B46FE                   mov ax, [bp-2]
  1382 0000067A 8B1E[3200]               mov bx, [GTop]
  1383 0000067E D1E3                     shl bx, 1
  1384 00000680 8987EB8A                 mov [GData+bx], ax
  1385                                  
  1386                                  ;-164       else if (istoken('{' )) { i=0;
  1387                                  
  1388 00000684 E96200                   jmp @@doglob55
  1389                                  @@doglob54:
  1390 00000687 6A7B                     push 123
  1391 00000689 E8B640                   call istoken
  1392 0000068C 83C402                   add  sp, 2
  1393 0000068F 08C0                     or  al, al
  1394 00000691 0F844B00                 je @@doglob56
  1395 00000695 B80000                   mov ax, 0
  1396 00000698 8946FE                   mov [bp-2], ax
  1397                                  
  1398                                  ;-165         do { if(i) prc(','); 
  1399                                  
  1400                                  @@doglob57:
  1401 0000069B 8B46FE                   mov ax, [bp-2]
  1402 0000069E 08C0                     or  al, al
  1403 000006A0 0F840800                 je @@doglob58
  1404 000006A4 6A2C                     push 44
  1405 000006A6 E86741                   call prc
  1406 000006A9 83C402                   add  sp, 2
  1407                                  
  1408                                  ;-166           expect(T_CONST); prunsign1(lexval); i=1; }
  1409                                  
  1410                                  @@doglob58:
  1411 000006AC 680101                   push 257
  1412 000006AF E8B240                   call expect
  1413 000006B2 83C402                   add  sp, 2
  1414 000006B5 FF36[3600]               push word [lexval]
  1415 000006B9 E81543                   call prunsign1
  1416 000006BC 83C402                   add  sp, 2
  1417 000006BF B80100                   mov ax, 1
  1418 000006C2 8946FE                   mov [bp-2], ax
  1419                                  
  1420                                  ;-167         while (istoken(',')); expect('}'); }  
  1421                                  
  1422 000006C5 6A2C                     push 44
  1423 000006C7 E87840                   call istoken
  1424 000006CA 83C402                   add  sp, 2
  1425 000006CD 08C0                     or  al, al
  1426 000006CF 0F840200                 je @@doglob59
  1427 000006D3 EBC6                     jmp @@doglob57
  1428                                  @@doglob59:
  1429 000006D5 6A7D                     push 125
  1430 000006D7 E88A40                   call expect
  1431 000006DA 83C402                   add  sp, 2
  1432                                  
  1433                                  ;-168       else error1("String or number array expected");
  1434                                  
  1435 000006DD E90900                   jmp @@doglob60
  1436                                  @@doglob56:
  1437 000006E0 68[B008]                 push doglob_13
  1438 000006E3 E87A44                   call error1
  1439 000006E6 83C402                   add  sp, 2
  1440                                  
  1441                                  ;-169       }; 
  1442                                  
  1443                                  @@doglob60:
  1444                                  @@doglob55:
  1445                                  @@doglob52:
  1446                                  
  1447                                  ;-170   }else { //expect('=');
  1448                                  
  1449 000006E9 E99E00                   jmp @@doglob61
  1450                                  @@doglob45:
  1451                                  
  1452                                  ;-171     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");
  1453                                  
  1454 000006EC 68[D008]                 push doglob_14
  1455 000006EF E88541                   call prs
  1456 000006F2 83C402                   add  sp, 2
  1457 000006F5 8D062B81                 lea  ax, [symbol]
  1458 000006F9 50                       push ax
  1459 000006FA E87A41                   call prs
  1460 000006FD 83C402                   add  sp, 2
  1461 00000700 A0[3A00]                 mov al, [istype]
  1462 00000703 3C2A                     cmp al, 42
  1463 00000705 0F850C00                 jne @@doglob62
  1464 00000709 68[D308]                 push doglob_15
  1465 0000070C E86841                   call prs
  1466 0000070F 83C402                   add  sp, 2
  1467                                  
  1468                                  ;-172     else {
  1469                                  
  1470 00000712 E93300                   jmp @@doglob63
  1471                                  @@doglob62:
  1472                                  
  1473                                  ;-173       if      (iswidth==1) prs(" db ");
  1474                                  
  1475 00000715 A0[4000]                 mov al, [iswidth]
  1476 00000718 3C01                     cmp al, 1
  1477 0000071A 0F850C00                 jne @@doglob64
  1478 0000071E 68[D808]                 push doglob_16
  1479 00000721 E85341                   call prs
  1480 00000724 83C402                   add  sp, 2
  1481                                  
  1482                                  ;-174       else if (iswidth==2) prs(" dw ");
  1483                                  
  1484 00000727 E91E00                   jmp @@doglob65
  1485                                  @@doglob64:
  1486 0000072A A0[4000]                 mov al, [iswidth]
  1487 0000072D 3C02                     cmp al, 2
  1488 0000072F 0F850C00                 jne @@doglob66
  1489 00000733 68[DD08]                 push doglob_17
  1490 00000736 E83E41                   call prs
  1491 00000739 83C402                   add  sp, 2
  1492                                  
  1493                                  ;-175       else                 prs(" dd ");
  1494                                  
  1495 0000073C E90900                   jmp @@doglob67
  1496                                  @@doglob66:
  1497 0000073F 68[E208]                 push doglob_18
  1498 00000742 E83241                   call prs
  1499 00000745 83C402                   add  sp, 2
  1500                                  
  1501                                  ;-176     }
  1502                                  
  1503                                  @@doglob67:
  1504                                  @@doglob65:
  1505                                  
  1506                                  ;-177     if(istoken('-')) prc('-');
  1507                                  
  1508                                  @@doglob63:
  1509 00000748 6A2D                     push 45
  1510 0000074A E8F53F                   call istoken
  1511 0000074D 83C402                   add  sp, 2
  1512 00000750 08C0                     or  al, al
  1513 00000752 0F840800                 je @@doglob68
  1514 00000756 6A2D                     push 45
  1515 00000758 E8B540                   call prc
  1516 0000075B 83C402                   add  sp, 2
  1517                                  
  1518                                  ;-178     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }
  1519                                  
  1520                                  @@doglob68:
  1521 0000075E 6A3D                     push 61
  1522 00000760 E8DF3F                   call istoken
  1523 00000763 83C402                   add  sp, 2
  1524 00000766 08C0                     or  al, al
  1525 00000768 0F841600                 je @@doglob69
  1526 0000076C 680101                   push 257
  1527 0000076F E8F23F                   call expect
  1528 00000772 83C402                   add  sp, 2
  1529 00000775 FF36[3600]               push word [lexval]
  1530 00000779 E85542                   call prunsign1
  1531 0000077C 83C402                   add  sp, 2
  1532                                  
  1533                                  ;-179     else prunsign1(0); }
  1534                                  
  1535 0000077F E90800                   jmp @@doglob70
  1536                                  @@doglob69:
  1537 00000782 6A00                     push 0
  1538 00000784 E84A42                   call prunsign1
  1539 00000787 83C402                   add  sp, 2
  1540                                  @@doglob70:
  1541                                  
  1542                                  ;-180   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;
  1543                                  
  1544                                  @@doglob61:
  1545 0000078A A0[3D00]                 mov al, [issign]
  1546 0000078D 8B1E[3200]               mov bx, [GTop]
  1547 00000791 8887E383                 mov [GSign+bx], al
  1548 00000795 A0[4000]                 mov al, [iswidth]
  1549 00000798 8B1E[3200]               mov bx, [GTop]
  1550 0000079C 88870F85                 mov [GWidth+bx], al
  1551 000007A0 A0[3A00]                 mov al, [istype]
  1552 000007A3 8B1E[3200]               mov bx, [GTop]
  1553 000007A7 8887B782                 mov [GType+bx], al
  1554                                  
  1555                                  ;-181   GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  1556                                  
  1557 000007AB A1[6E00]                 mov ax, [lineno]
  1558 000007AE 83E801                   sub ax, 1
  1559 000007B1 8B1E[3200]               mov bx, [GTop]
  1560 000007B5 D1E3                     shl bx, 1
  1561 000007B7 89873B86                 mov [GAdr+bx], ax
  1562 000007BB B80000                   mov ax, 0
  1563 000007BE 8B1E[3200]               mov bx, [GTop]
  1564 000007C2 D1E3                     shl bx, 1
  1565 000007C4 89879388                 mov [GUsed+bx], ax
  1566                                  
  1567                                  ;-182   pt=adrofname(GTop);
  1568                                  
  1569 000007C8 FF36[3200]               push word [GTop]
  1570 000007CC E8CF01                   call adrofname
  1571 000007CF 83C402                   add  sp, 2
  1572 000007D2 A3[7200]                 mov word [pt], ax
  1573                                  
  1574                                  ;-183   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);
  1575                                  
  1576 000007D5 8B46FA                   mov ax, [bp-6]
  1577 000007D8 08C0                     or  al, al
  1578 000007DA 0F841200                 je @@doglob71
  1579 000007DE 8D068FD0                 lea  ax, [doglobName]
  1580 000007E2 50                       push ax
  1581 000007E3 FF36[7200]               push word [pt]
  1582 000007E7 E899F9                   call strcpy
  1583 000007EA 83C404                   add  sp, 4
  1584 000007ED E90F00                   jmp @@doglob72
  1585                                  @@doglob71:
  1586 000007F0 8D062B81                 lea  ax, [symbol]
  1587 000007F4 50                       push ax
  1588 000007F5 FF36[7200]               push word [pt]
  1589 000007F9 E887F9                   call strcpy
  1590 000007FC 83C404                   add  sp, 4
  1591                                  
  1592                                  ;-184   GTop++; expect(';'); }
  1593                                  
  1594                                  @@doglob72:
  1595 000007FF FF06[3200]               inc  word[GTop]
  1596 00000803 6A3B                     push 59
  1597 00000805 E85C3F                   call expect
  1598 00000808 83C402                   add  sp, 2
  1599                                  
  1600                                  ;-185 
  1601                                  
  1602                                  
  1603                                  ;-186 int gettypes(int i) {int j; char c;
  1604 0000080B C9                       LEAVE
  1605 0000080C C3                       ret
  1606                                  ; ENDP
  1607 0000080D 476C6F62616C207461-     doglob_0 db "Global table full",0
  1608 00000816 626C652066756C6C00 
  1609 0000081F 6E6F20564F49442061-     doglob_1 db "no VOID as var type",0
  1610 00000828 732076617220747970-
  1611 00000831 6500               
  1612 00000833 5661726961626C6520-     doglob_2 db "Variable already defined",0
  1613 0000083C 616C72656164792064-
  1614 00000845 6566696E656400     
  1615 0000084C 5C6E73656374696F6E-     doglob_3 db "\nsection .bss\nabsolute ",0
  1616 00000855 202E6273735C6E6162-
  1617 0000085E 736F6C7574652000   
  1618 00000866 5C6E00                  doglob_4 db "\n",0
  1619 00000869 20726573622000          doglob_5 db " resb ",0
  1620 00000870 20726573772000          doglob_6 db " resw ",0
  1621 00000877 20726573642000          doglob_7 db " resd ",0
  1622 0000087E 5C6E73656374696F6E-     doglob_8 db "\nsection .text",0
  1623 00000887 202E7465787400     
  1624 0000088E 4F6E6C792042797465-     doglob_9 db "Only ByteArray allowed",0
  1625 00000897 417272617920616C6C-
  1626 000008A0 6F77656400         
  1627 000008A5 5C6E00                  doglob_10 db "\n",0
  1628 000008A8 2064622000              doglob_11 db " db ",0
  1629 000008AD 2C3000                  doglob_12 db ",0",0
  1630 000008B0 537472696E67206F72-     doglob_13 db "String or number array expected",0
  1631 000008B9 206E756D6265722061-
  1632 000008C2 727261792065787065-
  1633 000008CB 6374656400         
  1634 000008D0 5C6E00                  doglob_14 db "\n",0
  1635 000008D3 2064772000              doglob_15 db " dw ",0
  1636 000008D8 2064622000              doglob_16 db " db ",0
  1637 000008DD 2064772000              doglob_17 db " dw ",0
  1638 000008E2 2064642000              doglob_18 db " dd ",0
  1639                                  
  1640                                  gettypes:  ; *** PROC ***
  1641                                  
  1642                                  ;-187   c=GSign [i]; if (c=='S') signi =1;    else signi =0;
  1643                                  
  1644                                  ;Function : gettypes, Number of local variables: 3
  1645                                  ;   # type sign width addr used name   list of local variables
  1646                                  ;  200 var sign word   186 NULL i = bp+4
  1647                                  ;  201 var sign word   186 NULL j = bp-2
  1648                                  ;  202 var sign byte   186 NULL c = bp-4;
  1649 000008E7 C8040000                 ENTER  4,0
  1650 000008EB 8B5E04                   mov bx, [bp+4]
  1651 000008EE 8A87E383                 mov al, [GSign + bx]
  1652 000008F2 8846FC                   mov [bp-4], al
  1653 000008F5 8A46FC                   mov al, [bp-4]
  1654 000008F8 3C53                     cmp al, 83
  1655 000008FA 0F850900                 jne @@gettypes73
  1656 000008FE B80100                   mov ax, 1
  1657 00000901 A3[3B00]                 mov word [signi], ax
  1658 00000904 E90600                   jmp @@gettypes74
  1659                                  @@gettypes73:
  1660 00000907 B80000                   mov ax, 0
  1661 0000090A A3[3B00]                 mov word [signi], ax
  1662                                  
  1663                                  ;-188   c=GWidth[i]; widthi=0;wi=0;
  1664                                  
  1665                                  @@gettypes74:
  1666 0000090D 8B5E04                   mov bx, [bp+4]
  1667 00000910 8A870F85                 mov al, [GWidth + bx]
  1668 00000914 8846FC                   mov [bp-4], al
  1669 00000917 B80000                   mov ax, 0
  1670 0000091A A3[3E00]                 mov word [widthi], ax
  1671 0000091D B80000                   mov ax, 0
  1672 00000920 A3[4100]                 mov word [wi], ax
  1673                                  
  1674                                  ;-189   if (c==1) {widthi=1;wi=1;}
  1675                                  
  1676 00000923 8A46FC                   mov al, [bp-4]
  1677 00000926 3C01                     cmp al, 1
  1678 00000928 0F850C00                 jne @@gettypes75
  1679 0000092C B80100                   mov ax, 1
  1680 0000092F A3[3E00]                 mov word [widthi], ax
  1681 00000932 B80100                   mov ax, 1
  1682 00000935 A3[4100]                 mov word [wi], ax
  1683                                  
  1684                                  ;-190   if (c==2) {widthi=2;wi=2;}
  1685                                  
  1686                                  @@gettypes75:
  1687 00000938 8A46FC                   mov al, [bp-4]
  1688 0000093B 3C02                     cmp al, 2
  1689 0000093D 0F850C00                 jne @@gettypes76
  1690 00000941 B80200                   mov ax, 2
  1691 00000944 A3[3E00]                 mov word [widthi], ax
  1692 00000947 B80200                   mov ax, 2
  1693 0000094A A3[4100]                 mov word [wi], ax
  1694                                  
  1695                                  ;-191   if (c==4) {widthi=4;wi=4;}
  1696                                  
  1697                                  @@gettypes76:
  1698 0000094D 8A46FC                   mov al, [bp-4]
  1699 00000950 3C04                     cmp al, 4
  1700 00000952 0F850C00                 jne @@gettypes77
  1701 00000956 B80400                   mov ax, 4
  1702 00000959 A3[3E00]                 mov word [widthi], ax
  1703 0000095C B80400                   mov ax, 4
  1704 0000095F A3[4100]                 mov word [wi], ax
  1705                                  
  1706                                  ;-192   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}
  1707                                  
  1708                                  @@gettypes77:
  1709 00000962 8B5E04                   mov bx, [bp+4]
  1710 00000965 8A87B782                 mov al, [GType + bx]
  1711 00000969 8846FC                   mov [bp-4], al
  1712 0000096C B80000                   mov ax, 0
  1713 0000096F A3[3800]                 mov word [typei], ax
  1714 00000972 8A46FC                   mov al, [bp-4]
  1715 00000975 3C2A                     cmp al, 42
  1716 00000977 0F850C00                 jne @@gettypes78
  1717 0000097B B80100                   mov ax, 1
  1718 0000097E A3[3800]                 mov word [typei], ax
  1719 00000981 B80200                   mov ax, 2
  1720 00000984 A3[4100]                 mov word [wi], ax
  1721                                  
  1722                                  ;-193   if (c=='&')  typei=2;  
  1723                                  
  1724                                  @@gettypes78:
  1725 00000987 8A46FC                   mov al, [bp-4]
  1726 0000098A 3C26                     cmp al, 38
  1727 0000098C 0F850600                 jne @@gettypes79
  1728 00000990 B80200                   mov ax, 2
  1729 00000993 A3[3800]                 mov word [typei], ax
  1730                                  
  1731                                  ;-194   return i; }  
  1732                                  
  1733                                  @@gettypes79:
  1734 00000996 8B4604                   mov ax, [bp+4]
  1735 00000999 E90000                   jmp @@retn
  1736                                  
  1737                                  ;-195 int adrofname(unsigned int i) { adrF(GNameField, i); }
  1738                                  
  1739 0000099C C9                      @@retn: LEAVE
  1740 0000099D C3                       ret
  1741                                  ; ENDP
  1742                                  
  1743                                  adrofname:  ; *** PROC ***
  1744                                  ;Function : adrofname, Number of local variables: 1
  1745                                  ;   # type sign width addr used name   list of local variables
  1746                                  ;  200 var unsg word   195 NULL i = bp+4;
  1747 0000099E C8000000                 ENTER  0,0
  1748 000009A2 FF7604                   push word [bp+4]
  1749 000009A5 8D06438D                 lea  ax, [GNameField]
  1750 000009A9 50                       push ax
  1751 000009AA E80500                   call adrF
  1752 000009AD 83C404                   add  sp, 4
  1753                                  
  1754                                  ;-196 int adrF(char *s, unsigned int i) { i << 4;//*16; IDLENMAX=15!
  1755 000009B0 C9                       LEAVE
  1756 000009B1 C3                       ret
  1757                                  ; ENDP
  1758                                  
  1759                                  adrF:  ; *** PROC ***
  1760                                  ;Function : adrF, Number of local variables: 2
  1761                                  ;   # type sign width addr used name   list of local variables
  1762                                  ;  200 ptr sign byte   196 NULL s = bp+4
  1763                                  ;  201 var unsg word   196 NULL i = bp+6;
  1764 000009B2 C8000000                 ENTER  0,0
  1765 000009B6 8B4606                   mov ax, [bp+6]
  1766 000009B9 C1E004                   shl ax, 4
  1767                                  
  1768                                  ;-197   __asm{ add ax, [bp+4]  ; offset s } }
  1769                                  
  1770 000009BC 034604                   add ax, [bp+4]  ; offset s 
  1771                                  
  1772                                  ;-198 int printName(unsigned int i) {int j;
  1773 000009BF C9                       LEAVE
  1774 000009C0 C3                       ret
  1775                                  ; ENDP
  1776                                  
  1777                                  printName:  ; *** PROC ***
  1778                                  
  1779                                  ;-199   if (i < LSTART) { i=adrofname(i); prs(i); }
  1780                                  
  1781                                  ;Function : printName, Number of local variables: 2
  1782                                  ;   # type sign width addr used name   list of local variables
  1783                                  ;  200 var unsg word   198 NULL i = bp+4
  1784                                  ;  201 var sign word   198 NULL j = bp-2;
  1785 000009C1 C8020000                 ENTER  2,0
  1786 000009C5 8B4604                   mov ax, [bp+4]
  1787 000009C8 3DC800                   cmp ax, 200
  1788 000009CB 0F8D1800                 jge @@printName80
  1789 000009CF FF7604                   push word [bp+4]
  1790 000009D2 E8C9FF                   call adrofname
  1791 000009D5 83C402                   add  sp, 2
  1792 000009D8 894604                   mov [bp+4], ax
  1793 000009DB FF7604                   push word [bp+4]
  1794 000009DE E8963E                   call prs
  1795 000009E1 83C402                   add  sp, 2
  1796                                  
  1797                                  ;-200   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }
  1798                                  
  1799 000009E4 E93800                   jmp @@printName81
  1800                                  @@printName80:
  1801 000009E7 68[210A]                 push printName_0
  1802 000009EA E88A3E                   call prs
  1803 000009ED 83C402                   add  sp, 2
  1804 000009F0 8B5E04                   mov bx, [bp+4]
  1805 000009F3 D1E3                     shl bx, 1
  1806 000009F5 8B87EB8A                 mov ax, [GData + bx]
  1807 000009F9 8946FE                   mov [bp-2], ax
  1808 000009FC 8B46FE                   mov ax, [bp-2]
  1809 000009FF 83F800                   cmp ax, 0
  1810 00000A02 0F8E0800                 jle @@printName82
  1811 00000A06 6A2B                     push 43
  1812 00000A08 E8053E                   call prc
  1813 00000A0B 83C402                   add  sp, 2
  1814                                  @@printName82:
  1815 00000A0E FF76FE                   push word [bp-2]
  1816 00000A11 E85A3F                   call pint1
  1817 00000A14 83C402                   add  sp, 2
  1818 00000A17 6A5D                     push 93
  1819 00000A19 E8F43D                   call prc
  1820 00000A1C 83C402                   add  sp, 2
  1821                                  
  1822                                  ;-201 }
  1823                                  
  1824                                  @@printName81:
  1825                                  
  1826                                  ;-202 int searchname() { unsigned int i;
  1827 00000A1F C9                       LEAVE
  1828 00000A20 C3                       ret
  1829                                  ; ENDP
  1830 00000A21 5B627000                printName_0 db "[bp",0
  1831                                  
  1832                                  searchname:  ; *** PROC ***
  1833                                  
  1834                                  ;-203   i=checkName(); if (i == 0) error1("Variable unknown");
  1835                                  
  1836                                  ;Function : searchname, Number of local variables: 1
  1837                                  ;   # type sign width addr used name   list of local variables
  1838                                  ;  200 var unsg word   202 NULL i = bp-2;
  1839 00000A25 C8020000                 ENTER  2,0
  1840 00000A29 E84400                   call checkName
  1841 00000A2C 8946FE                   mov [bp-2], ax
  1842 00000A2F 8B46FE                   mov ax, [bp-2]
  1843 00000A32 83F800                   cmp ax, 0
  1844 00000A35 0F850900                 jne @@searchname83
  1845 00000A39 68[5F0A]                 push searchname_0
  1846 00000A3C E82141                   call error1
  1847 00000A3F 83C402                   add  sp, 2
  1848                                  
  1849                                  ;-204   GUsed[i]=GUsed[i] + 1; return i;
  1850                                  
  1851                                  @@searchname83:
  1852 00000A42 8B5EFE                   mov bx, [bp-2]
  1853 00000A45 D1E3                     shl bx, 1
  1854 00000A47 8B879388                 mov ax, [GUsed + bx]
  1855 00000A4B 83C001                   add ax, 1
  1856 00000A4E 8B5EFE                   mov bx, [bp-2]
  1857 00000A51 D1E3                     shl bx, 1
  1858 00000A53 89879388                 mov [GUsed+bx], ax
  1859 00000A57 8B46FE                   mov ax, [bp-2]
  1860 00000A5A E90000                   jmp @@retn
  1861                                  
  1862                                  ;-205 }
  1863                                  
  1864                                  
  1865                                  ;-206 int checkName() { unsigned int i; unsigned int j;
  1866                                  
  1867 00000A5D C9                      @@retn: LEAVE
  1868 00000A5E C3                       ret
  1869                                  ; ENDP
  1870 00000A5F 5661726961626C6520-     searchname_0 db "Variable unknown",0
  1871 00000A68 756E6B6E6F776E00   
  1872                                  
  1873                                  checkName:  ; *** PROC ***
  1874                                  
  1875                                  ;-207   i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  1876                                  
  1877                                  ;Function : checkName, Number of local variables: 2
  1878                                  ;   # type sign width addr used name   list of local variables
  1879                                  ;  200 var unsg word   206 NULL i = bp-2
  1880                                  ;  201 var unsg word   206 NULL j = bp-4;
  1881 00000A70 C8040000                 ENTER  4,0
  1882 00000A74 B8C800                   mov ax, 200
  1883 00000A77 8946FE                   mov [bp-2], ax
  1884                                  @@checkName84:
  1885 00000A7A 8B46FE                   mov ax, [bp-2]
  1886 00000A7D 3B06[3400]               cmp ax, [LTop]
  1887 00000A81 0F8D2B00                 jge @@checkName85
  1888 00000A85 FF76FE                   push word [bp-2]
  1889 00000A88 E813FF                   call adrofname
  1890 00000A8B 83C402                   add  sp, 2
  1891 00000A8E 8946FC                   mov [bp-4], ax
  1892 00000A91 FF76FC                   push word [bp-4]
  1893 00000A94 8D062B81                 lea  ax, [symbol]
  1894 00000A98 50                       push ax
  1895 00000A99 E817F7                   call eqstr
  1896 00000A9C 83C404                   add  sp, 4
  1897 00000A9F 08C0                     or  al, al
  1898 00000AA1 0F840600                 je @@checkName86
  1899 00000AA5 8B46FE                   mov ax, [bp-2]
  1900 00000AA8 E94700                   jmp @@retn
  1901                                  @@checkName86:
  1902 00000AAB FF46FE                   inc  word[bp-2]
  1903                                  
  1904                                  ;-208   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  1905                                  
  1906 00000AAE EBCA                     jmp @@checkName84
  1907                                  @@checkName85:
  1908 00000AB0 B80100                   mov ax, 1
  1909 00000AB3 8946FE                   mov [bp-2], ax
  1910                                  @@checkName87:
  1911 00000AB6 8B46FE                   mov ax, [bp-2]
  1912 00000AB9 3B06[3200]               cmp ax, [GTop]
  1913 00000ABD 0F8D2B00                 jge @@checkName88
  1914 00000AC1 FF76FE                   push word [bp-2]
  1915 00000AC4 E8D7FE                   call adrofname
  1916 00000AC7 83C402                   add  sp, 2
  1917 00000ACA 8946FC                   mov [bp-4], ax
  1918 00000ACD FF76FC                   push word [bp-4]
  1919 00000AD0 8D062B81                 lea  ax, [symbol]
  1920 00000AD4 50                       push ax
  1921 00000AD5 E8DBF6                   call eqstr
  1922 00000AD8 83C404                   add  sp, 4
  1923 00000ADB 08C0                     or  al, al
  1924 00000ADD 0F840600                 je @@checkName89
  1925 00000AE1 8B46FE                   mov ax, [bp-2]
  1926 00000AE4 E90B00                   jmp @@retn
  1927                                  @@checkName89:
  1928 00000AE7 FF46FE                   inc  word[bp-2]
  1929                                  
  1930                                  ;-209   return 0;
  1931                                  
  1932 00000AEA EBCA                     jmp @@checkName87
  1933                                  @@checkName88:
  1934 00000AEC B80000                   mov ax, 0
  1935 00000AEF E90000                   jmp @@retn
  1936                                  
  1937                                  ;-210 }    
  1938                                  
  1939                                  
  1940                                  ;-211 int typeName() { int m; //0=V,1=*,2=&
  1941                                  
  1942 00000AF2 C9                      @@retn: LEAVE
  1943 00000AF3 C3                       ret
  1944                                  ; ENDP
  1945                                  
  1946                                  typeName:  ; *** PROC ***
  1947                                  
  1948                                  ;-212     issign='S';
  1949                                  
  1950                                  ;Function : typeName, Number of local variables: 1
  1951                                  ;   # type sign width addr used name   list of local variables
  1952                                  ;  200 var sign word   211 NULL m = bp-2;
  1953 00000AF4 C8020000                 ENTER  2,0
  1954 00000AF8 B85300                   mov ax, 83
  1955 00000AFB A2[3D00]                 mov byte [issign], al
  1956                                  
  1957                                  ;-213     if(istoken(T_SIGNED))   issign='S';  
  1958                                  
  1959 00000AFE 681302                   push 531
  1960 00000B01 E83E3C                   call istoken
  1961 00000B04 83C402                   add  sp, 2
  1962 00000B07 08C0                     or  al, al
  1963 00000B09 0F840600                 je @@typeName90
  1964 00000B0D B85300                   mov ax, 83
  1965 00000B10 A2[3D00]                 mov byte [issign], al
  1966                                  
  1967                                  ;-214     if(istoken(T_UNSIGNED)) issign='U';
  1968                                  
  1969                                  @@typeName90:
  1970 00000B13 681402                   push 532
  1971 00000B16 E8293C                   call istoken
  1972 00000B19 83C402                   add  sp, 2
  1973 00000B1C 08C0                     or  al, al
  1974 00000B1E 0F840600                 je @@typeName91
  1975 00000B22 B85500                   mov ax, 85
  1976 00000B25 A2[3D00]                 mov byte [issign], al
  1977                                  
  1978                                  ;-215     iswidth=2;                           
  1979                                  
  1980                                  @@typeName91:
  1981 00000B28 B80200                   mov ax, 2
  1982 00000B2B A2[4000]                 mov byte [iswidth], al
  1983                                  
  1984                                  ;-216     if(istoken(T_VOID))     iswidth=0;
  1985                                  
  1986 00000B2E 681102                   push 529
  1987 00000B31 E80E3C                   call istoken
  1988 00000B34 83C402                   add  sp, 2
  1989 00000B37 08C0                     or  al, al
  1990 00000B39 0F840600                 je @@typeName92
  1991 00000B3D B80000                   mov ax, 0
  1992 00000B40 A2[4000]                 mov byte [iswidth], al
  1993                                  
  1994                                  ;-217     if(istoken(T_CHAR))     iswidth=1;   
  1995                                  
  1996                                  @@typeName92:
  1997 00000B43 681202                   push 530
  1998 00000B46 E8F93B                   call istoken
  1999 00000B49 83C402                   add  sp, 2
  2000 00000B4C 08C0                     or  al, al
  2001 00000B4E 0F840600                 je @@typeName93
  2002 00000B52 B80100                   mov ax, 1
  2003 00000B55 A2[4000]                 mov byte [iswidth], al
  2004                                  
  2005                                  ;-218     if(istoken(T_INT))      iswidth=2;
  2006                                  
  2007                                  @@typeName93:
  2008 00000B58 680502                   push 517
  2009 00000B5B E8E43B                   call istoken
  2010 00000B5E 83C402                   add  sp, 2
  2011 00000B61 08C0                     or  al, al
  2012 00000B63 0F840600                 je @@typeName94
  2013 00000B67 B80200                   mov ax, 2
  2014 00000B6A A2[4000]                 mov byte [iswidth], al
  2015                                  
  2016                                  ;-219     if(istoken(T_LONG))     iswidth=4;
  2017                                  
  2018                                  @@typeName94:
  2019 00000B6D 681502                   push 533
  2020 00000B70 E8CF3B                   call istoken
  2021 00000B73 83C402                   add  sp, 2
  2022 00000B76 08C0                     or  al, al
  2023 00000B78 0F840600                 je @@typeName95
  2024 00000B7C B80400                   mov ax, 4
  2025 00000B7F A2[4000]                 mov byte [iswidth], al
  2026                                  
  2027                                  ;-220     istype='V'; 
  2028                                  
  2029                                  @@typeName95:
  2030 00000B82 B85600                   mov ax, 86
  2031 00000B85 A2[3A00]                 mov byte [istype], al
  2032                                  
  2033                                  ;-221     m=0;
  2034                                  
  2035 00000B88 B80000                   mov ax, 0
  2036 00000B8B 8946FE                   mov [bp-2], ax
  2037                                  
  2038                                  ;-222     if(istoken('*'))  {istype='*'; m=1;} 
  2039                                  
  2040 00000B8E 6A2A                     push 42
  2041 00000B90 E8AF3B                   call istoken
  2042 00000B93 83C402                   add  sp, 2
  2043 00000B96 08C0                     or  al, al
  2044 00000B98 0F840C00                 je @@typeName96
  2045 00000B9C B82A00                   mov ax, 42
  2046 00000B9F A2[3A00]                 mov byte [istype], al
  2047 00000BA2 B80100                   mov ax, 1
  2048 00000BA5 8946FE                   mov [bp-2], ax
  2049                                  
  2050                                  ;-223     if(istoken('&'))  {istype='&'; m=2;}
  2051                                  
  2052                                  @@typeName96:
  2053 00000BA8 6A26                     push 38
  2054 00000BAA E8953B                   call istoken
  2055 00000BAD 83C402                   add  sp, 2
  2056 00000BB0 08C0                     or  al, al
  2057 00000BB2 0F840C00                 je @@typeName97
  2058 00000BB6 B82600                   mov ax, 38
  2059 00000BB9 A2[3A00]                 mov byte [istype], al
  2060 00000BBC B80200                   mov ax, 2
  2061 00000BBF 8946FE                   mov [bp-2], ax
  2062                                  
  2063                                  ;-224     name1(); 
  2064                                  
  2065                                  @@typeName97:
  2066 00000BC2 E80800                   call name1
  2067                                  
  2068                                  ;-225     return m; 
  2069                                  
  2070 00000BC5 8B46FE                   mov ax, [bp-2]
  2071 00000BC8 E90000                   jmp @@retn
  2072                                  
  2073                                  ;-226 }
  2074                                  
  2075                                  
  2076                                  ;-227 int name1() {
  2077                                  
  2078 00000BCB C9                      @@retn: LEAVE
  2079 00000BCC C3                       ret
  2080                                  ; ENDP
  2081                                  
  2082                                  name1:  ; *** PROC ***
  2083                                  
  2084                                  ;-228     if (token!=T_NAME) error1("Name expected"); 
  2085                                  
  2086 00000BCD A1[2200]                 mov ax, [token]
  2087 00000BD0 3D0001                   cmp ax, 256
  2088 00000BD3 0F840900                 je  @@name198
  2089 00000BD7 68[E70B]                 push name1_0
  2090 00000BDA E8833F                   call error1
  2091 00000BDD 83C402                   add  sp, 2
  2092                                  
  2093                                  ;-229     token=getlex(); 
  2094                                  
  2095                                  @@name198:
  2096 00000BE0 E83B34                   call getlex
  2097 00000BE3 A3[2200]                 mov word [token], ax
  2098                                  
  2099                                  ;-230 }
  2100                                  
  2101                                  
  2102                                  ;-231 
  2103                                  
  2104                                  
  2105                                  ;-232 int storecall() { int i; if (CTop >= CALLMAX) error1("Call table full");
  2106                                  
  2107 00000BE6 C3                       ret
  2108                                  ; ENDP
  2109 00000BE7 4E616D652065787065-     name1_0 db "Name expected",0
  2110 00000BF0 6374656400         
  2111                                  
  2112                                  storecall:  ; *** PROC ***
  2113                                  ;Function : storecall, Number of local variables: 1
  2114                                  ;   # type sign width addr used name   list of local variables
  2115                                  ;  200 var sign word   232 NULL i = bp-2;
  2116 00000BF5 C8020000                 ENTER  2,0
  2117 00000BF9 A1[4500]                 mov ax, [CTop]
  2118 00000BFC 3DD007                   cmp ax, 2000 ;unsigned : 1
  2119 00000BFF 0F8C0900                 jl  @@storecall99
  2120 00000C03 68[670C]                 push storecall_0
  2121 00000C06 E8573F                   call error1
  2122 00000C09 83C402                   add  sp, 2
  2123                                  
  2124                                  ;-233   if (CNameTop >= 65468) error1("Call name table fuill");
  2125                                  
  2126                                  @@storecall99:
  2127 00000C0C A1[6800]                 mov ax, [CNameTop]
  2128 00000C0F 3DBCFF                   cmp ax, 65468 ;unsigned : 0
  2129 00000C12 0F820900                 jb  @@storecall100
  2130 00000C16 68[770C]                 push storecall_1
  2131 00000C19 E8443F                   call error1
  2132 00000C1C 83C402                   add  sp, 2
  2133                                  
  2134                                  ;-234     CType[CTop]=0;  CAdr [CTop]=CNameTop; i=strlen(symbol);
  2135                                  
  2136                                  @@storecall100:
  2137 00000C1F B80000                   mov ax, 0
  2138 00000C22 8B1E[4500]               mov bx, [CTop]
  2139 00000C26 88872FA1                 mov [CType+bx], al
  2140 00000C2A A1[6800]                 mov ax, [CNameTop]
  2141 00000C2D 8B1E[4500]               mov bx, [CTop]
  2142 00000C31 D1E3                     shl bx, 1
  2143 00000C33 898757AB                 mov [CAdr+bx], ax
  2144 00000C37 8D062B81                 lea  ax, [symbol]
  2145 00000C3B 50                       push ax
  2146 00000C3C E81CF5                   call strlen
  2147 00000C3F 83C402                   add  sp, 2
  2148 00000C42 8946FE                   mov [bp-2], ax
  2149                                  
  2150                                  ;-235     to_far(CNameTop, symbol);
  2151                                  
  2152 00000C45 8D062B81                 lea  ax, [symbol]
  2153 00000C49 50                       push ax
  2154 00000C4A FF36[6800]               push word [CNameTop]
  2155 00000C4E E8684A                   call to_far
  2156 00000C51 83C404                   add  sp, 4
  2157                                  
  2158                                  ;-236     CNameTop=CNameTop+i; CNameTop++; CTop++;
  2159                                  
  2160 00000C54 A1[6800]                 mov ax, [CNameTop]
  2161 00000C57 0346FE                   add ax, [bp-2]
  2162 00000C5A A3[6800]                 mov word [CNameTop], ax
  2163 00000C5D FF06[6800]               inc  word[CNameTop]
  2164 00000C61 FF06[4500]               inc  word[CTop]
  2165                                  
  2166                                  ;-237 }
  2167                                  
  2168                                  
  2169                                  ;-238 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
  2170 00000C65 C9                       LEAVE
  2171 00000C66 C3                       ret
  2172                                  ; ENDP
  2173 00000C67 43616C6C207461626C-     storecall_0 db "Call table full",0
  2174 00000C70 652066756C6C00     
  2175 00000C77 43616C6C206E616D65-     storecall_1 db "Call name table fuill",0
  2176 00000C80 207461626C65206675-
  2177 00000C89 696C6C00           
  2178                                  
  2179                                  storefunc:  ; *** PROC ***
  2180 00000C8D A1[4300]                 mov ax, [FTop]
  2181 00000C90 3D2C01                   cmp ax, 300 ;unsigned : 1
  2182 00000C93 0F8C0900                 jl  @@storefunc101
  2183 00000C97 68[EE0C]                 push storefunc_0
  2184 00000C9A E8C33E                   call error1
  2185 00000C9D 83C402                   add  sp, 2
  2186                                  
  2187                                  ;-239     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;
  2188                                  
  2189                                  @@storefunc101:
  2190 00000CA0 A1[6E00]                 mov ax, [lineno]
  2191 00000CA3 83E801                   sub ax, 1
  2192 00000CA6 8B1E[4300]               mov bx, [FTop]
  2193 00000CAA D1E3                     shl bx, 1
  2194 00000CAC 8987FFA8                 mov [FAdr+bx], ax
  2195 00000CB0 B80000                   mov ax, 0
  2196 00000CB3 8B1E[4300]               mov bx, [FTop]
  2197 00000CB7 D1E3                     shl bx, 1
  2198 00000CB9 8987F7BA                 mov [FCalls+bx], ax
  2199 00000CBD A0[4000]                 mov al, [iswidth]
  2200 00000CC0 8B1E[4300]               mov bx, [FTop]
  2201 00000CC4 888703A0                 mov [FType+bx], al
  2202                                  
  2203                                  ;-240     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;
  2204                                  
  2205 00000CC8 FF36[4300]               push word [FTop]
  2206 00000CCC 8D064FBD                 lea  ax, [FNameField]
  2207 00000CD0 50                       push ax
  2208 00000CD1 E8DEFC                   call adrF
  2209 00000CD4 83C404                   add  sp, 4
  2210 00000CD7 A3[7200]                 mov word [pt], ax
  2211 00000CDA 8D062B81                 lea  ax, [symbol]
  2212 00000CDE 50                       push ax
  2213 00000CDF FF36[7200]               push word [pt]
  2214 00000CE3 E89DF4                   call strcpy
  2215 00000CE6 83C404                   add  sp, 4
  2216 00000CE9 FF06[4300]               inc  word[FTop]
  2217                                  
  2218                                  ;-241 }
  2219                                  
  2220                                  
  2221                                  ;-242 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");
  2222                                  
  2223 00000CED C3                       ret
  2224                                  ; ENDP
  2225 00000CEE 46756E6374696F6E20-     storefunc_0 db "Function table full",0
  2226 00000CF7 7461626C652066756C-
  2227 00000D00 6C00               
  2228                                  
  2229                                  addlocal:  ; *** PROC ***
  2230 00000D02 A1[3400]                 mov ax, [LTop]
  2231 00000D05 3D2C01                   cmp ax, 300 ;unsigned : 1
  2232 00000D08 0F8C0900                 jl  @@addlocal102
  2233 00000D0C 68[880D]                 push addlocal_0
  2234 00000D0F E84E3E                   call error1
  2235 00000D12 83C402                   add  sp, 2
  2236                                  
  2237                                  ;-243   if (checkName() != 0) error1("Variable already defined");
  2238                                  
  2239                                  @@addlocal102:
  2240 00000D15 E858FD                   call checkName
  2241 00000D18 83F800                   cmp ax, 0
  2242 00000D1B 0F840900                 je  @@addlocal103
  2243 00000D1F 68[A20D]                 push addlocal_1
  2244 00000D22 E83B3E                   call error1
  2245 00000D25 83C402                   add  sp, 2
  2246                                  
  2247                                  ;-244   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;
  2248                                  
  2249                                  @@addlocal103:
  2250 00000D28 A0[3D00]                 mov al, [issign]
  2251 00000D2B 8B1E[3400]               mov bx, [LTop]
  2252 00000D2F 8887E383                 mov [GSign+bx], al
  2253 00000D33 A0[4000]                 mov al, [iswidth]
  2254 00000D36 8B1E[3400]               mov bx, [LTop]
  2255 00000D3A 88870F85                 mov [GWidth+bx], al
  2256 00000D3E A0[3A00]                 mov al, [istype]
  2257 00000D41 8B1E[3400]               mov bx, [LTop]
  2258 00000D45 8887B782                 mov [GType+bx], al
  2259                                  
  2260                                  ;-245   GAdr [LTop]=lineno-1; GUsed[LTop]=0;
  2261                                  
  2262 00000D49 A1[6E00]                 mov ax, [lineno]
  2263 00000D4C 83E801                   sub ax, 1
  2264 00000D4F 8B1E[3400]               mov bx, [LTop]
  2265 00000D53 D1E3                     shl bx, 1
  2266 00000D55 89873B86                 mov [GAdr+bx], ax
  2267 00000D59 B80000                   mov ax, 0
  2268 00000D5C 8B1E[3400]               mov bx, [LTop]
  2269 00000D60 D1E3                     shl bx, 1
  2270 00000D62 89879388                 mov [GUsed+bx], ax
  2271                                  
  2272                                  ;-246   pt=adrF(GNameField, LTop); strcpy(pt, symbol);
  2273                                  
  2274 00000D66 FF36[3400]               push word [LTop]
  2275 00000D6A 8D06438D                 lea  ax, [GNameField]
  2276 00000D6E 50                       push ax
  2277 00000D6F E840FC                   call adrF
  2278 00000D72 83C404                   add  sp, 4
  2279 00000D75 A3[7200]                 mov word [pt], ax
  2280 00000D78 8D062B81                 lea  ax, [symbol]
  2281 00000D7C 50                       push ax
  2282 00000D7D FF36[7200]               push word [pt]
  2283 00000D81 E8FFF3                   call strcpy
  2284 00000D84 83C404                   add  sp, 4
  2285                                  
  2286                                  ;-247 }
  2287                                  
  2288                                  
  2289                                  ;-248 int checkFunction() { unsigned int i; unsigned int j; i=0;
  2290                                  
  2291 00000D87 C3                       ret
  2292                                  ; ENDP
  2293 00000D88 4C6F63616C20766172-     addlocal_0 db "Local variable table full",0
  2294 00000D91 6961626C6520746162-
  2295 00000D9A 6C652066756C6C00   
  2296 00000DA2 5661726961626C6520-     addlocal_1 db "Variable already defined",0
  2297 00000DAB 616C72656164792064-
  2298 00000DB4 6566696E656400     
  2299                                  
  2300                                  checkFunction:  ; *** PROC ***
  2301                                  ;Function : checkFunction, Number of local variables: 2
  2302                                  ;   # type sign width addr used name   list of local variables
  2303                                  ;  200 var unsg word   248 NULL i = bp-2
  2304                                  ;  201 var unsg word   248 NULL j = bp-4;
  2305 00000DBB C8040000                 ENTER  4,0
  2306 00000DBF B80000                   mov ax, 0
  2307 00000DC2 8946FE                   mov [bp-2], ax
  2308                                  
  2309                                  ;-249   while (i < FTop) { j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}
  2310                                  
  2311                                  @@checkFunction104:
  2312 00000DC5 8B46FE                   mov ax, [bp-2]
  2313 00000DC8 3B06[4300]               cmp ax, [FTop]
  2314 00000DCC 0F8D3000                 jge @@checkFunction105
  2315 00000DD0 FF76FE                   push word [bp-2]
  2316 00000DD3 8D064FBD                 lea  ax, [FNameField]
  2317 00000DD7 50                       push ax
  2318 00000DD8 E8D7FB                   call adrF
  2319 00000DDB 83C404                   add  sp, 4
  2320 00000DDE 8946FC                   mov [bp-4], ax
  2321 00000DE1 FF76FC                   push word [bp-4]
  2322 00000DE4 8D062B81                 lea  ax, [symbol]
  2323 00000DE8 50                       push ax
  2324 00000DE9 E8C7F3                   call eqstr
  2325 00000DEC 83C404                   add  sp, 4
  2326 00000DEF 08C0                     or  al, al
  2327 00000DF1 0F840600                 je @@checkFunction106
  2328 00000DF5 8B46FE                   mov ax, [bp-2]
  2329 00000DF8 E90B00                   jmp @@retn
  2330                                  @@checkFunction106:
  2331 00000DFB FF46FE                   inc  word[bp-2]
  2332                                  
  2333                                  ;-250   return 0; }
  2334                                  
  2335 00000DFE EBC5                     jmp @@checkFunction104
  2336                                  @@checkFunction105:
  2337 00000E00 B80000                   mov ax, 0
  2338 00000E03 E90000                   jmp @@retn
  2339                                  
  2340                                  ;-251 int dofunc() { int nloc; int i; int narg;  
  2341                                  
  2342 00000E06 C9                      @@retn: LEAVE
  2343 00000E07 C3                       ret
  2344                                  ; ENDP
  2345                                  
  2346                                  dofunc:  ; *** PROC ***
  2347                                  
  2348                                  ;-252   cloc=&co; 
  2349                                  
  2350                                  ;Function : dofunc, Number of local variables: 3
  2351                                  ;   # type sign width addr used name   list of local variables
  2352                                  ;  200 var sign word   251 NULL nloc = bp-2
  2353                                  ;  201 var sign word   251 NULL i = bp-4
  2354                                  ;  202 var sign word   251 NULL narg = bp-6;
  2355 00000E08 C8060000                 ENTER  6,0
  2356 00000E0C B83075                   mov ax, co
  2357 00000E0F A3[1C00]                 mov word [cloc], ax
  2358                                  
  2359                                  ;-253   checknamelen();
  2360                                  
  2361 00000E12 E857F6                   call checknamelen
  2362                                  
  2363                                  ;-254   strcpy(fname, symbol);
  2364                                  
  2365 00000E15 8D062B81                 lea  ax, [symbol]
  2366 00000E19 50                       push ax
  2367 00000E1A 8D06AB81                 lea  ax, [fname]
  2368 00000E1E 50                       push ax
  2369 00000E1F E861F3                   call strcpy
  2370 00000E22 83C404                   add  sp, 4
  2371                                  
  2372                                  ;-255   if (checkFunction() ) error1("Function already defined");
  2373                                  
  2374 00000E25 E893FF                   call checkFunction
  2375 00000E28 08C0                     or  al, al
  2376 00000E2A 0F840900                 je @@dofunc107
  2377 00000E2E 68[3F10]                 push dofunc_0
  2378 00000E31 E82C3D                   call error1
  2379 00000E34 83C402                   add  sp, 2
  2380                                  
  2381                                  ;-256   storefunc();
  2382                                  
  2383                                  @@dofunc107:
  2384 00000E37 E853FE                   call storefunc
  2385                                  
  2386                                  ;-257   prs("\n\n"); prs(symbol); prs(":  ; *** PROC ***");
  2387                                  
  2388 00000E3A 68[5810]                 push dofunc_1
  2389 00000E3D E8373A                   call prs
  2390 00000E40 83C402                   add  sp, 2
  2391 00000E43 8D062B81                 lea  ax, [symbol]
  2392 00000E47 50                       push ax
  2393 00000E48 E82C3A                   call prs
  2394 00000E4B 83C402                   add  sp, 2
  2395 00000E4E 68[5D10]                 push dofunc_2
  2396 00000E51 E8233A                   call prs
  2397 00000E54 83C402                   add  sp, 2
  2398                                  
  2399                                  ;-258   expect('('); LTop=LSTART;  i=0;
  2400                                  
  2401 00000E57 6A28                     push 40
  2402 00000E59 E80839                   call expect
  2403 00000E5C 83C402                   add  sp, 2
  2404 00000E5F B8C800                   mov ax, 200
  2405 00000E62 A3[3400]                 mov word [LTop], ax
  2406 00000E65 B80000                   mov ax, 0
  2407 00000E68 8946FC                   mov [bp-4], ax
  2408                                  
  2409                                  ;-259   if (istoken(')')==0) { narg=2; 
  2410                                  
  2411 00000E6B 6A29                     push 41
  2412 00000E6D E8D238                   call istoken
  2413 00000E70 83C402                   add  sp, 2
  2414 00000E73 83F800                   cmp ax, 0
  2415 00000E76 0F854600                 jne @@dofunc108
  2416 00000E7A B80200                   mov ax, 2
  2417 00000E7D 8946FA                   mov [bp-6], ax
  2418                                  
  2419                                  ;-260     do { typeName();  addlocal(); narg+=2;
  2420                                  
  2421                                  @@dofunc109:
  2422 00000E80 E871FC                   call typeName
  2423 00000E83 E87CFE                   call addlocal
  2424 00000E86 8346FA02                 add  word[bp-6], 2
  2425                                  
  2426                                  ;-261          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }
  2427                                  
  2428 00000E8A 8B46FA                   mov ax, [bp-6]
  2429 00000E8D 8B1E[3400]               mov bx, [LTop]
  2430 00000E91 D1E3                     shl bx, 1
  2431 00000E93 8987EB8A                 mov [GData+bx], ax
  2432 00000E97 A0[4000]                 mov al, [iswidth]
  2433 00000E9A 3C04                     cmp al, 4
  2434 00000E9C 0F850400                 jne @@dofunc110
  2435 00000EA0 8346FA02                 add  word[bp-6], 2
  2436                                  @@dofunc110:
  2437 00000EA4 FF06[3400]               inc  word[LTop]
  2438                                  
  2439                                  ;-262     while (istoken(','));  expect(')'); }
  2440                                  
  2441 00000EA8 6A2C                     push 44
  2442 00000EAA E89538                   call istoken
  2443 00000EAD 83C402                   add  sp, 2
  2444 00000EB0 08C0                     or  al, al
  2445 00000EB2 0F840200                 je @@dofunc111
  2446 00000EB6 EBC8                     jmp @@dofunc109
  2447                                  @@dofunc111:
  2448 00000EB8 6A29                     push 41
  2449 00000EBA E8A738                   call expect
  2450 00000EBD 83C402                   add  sp, 2
  2451                                  
  2452                                  ;-263     
  2453                                  
  2454                                  
  2455                                  ;-264   expect('{'); /*body*/
  2456                                  
  2457                                  @@dofunc108:
  2458 00000EC0 6A7B                     push 123
  2459 00000EC2 E89F38                   call expect
  2460 00000EC5 83C402                   add  sp, 2
  2461                                  
  2462                                  ;-265   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */
  2463                                  
  2464 00000EC8 B80000                   mov ax, 0
  2465 00000ECB 8946FE                   mov [bp-2], ax
  2466 00000ECE B80000                   mov ax, 0
  2467 00000ED1 A3[2C00]                 mov word [nreturn], ax
  2468 00000ED4 B80000                   mov ax, 0
  2469 00000ED7 A3[2A00]                 mov word [nconst], ax
  2470 00000EDA B80000                   mov ax, 0
  2471 00000EDD 8946FC                   mov [bp-4], ax
  2472                                  
  2473                                  ;-266   while(isvariable()) {
  2474                                  
  2475                                  @@dofunc112:
  2476 00000EE0 E8BC01                   call isvariable
  2477 00000EE3 08C0                     or  al, al
  2478 00000EE5 0F849200                 je @@dofunc113
  2479                                  
  2480                                  ;-267     do {typeName();
  2481                                  
  2482                                  @@dofunc114:
  2483 00000EE9 E808FC                   call typeName
  2484                                  
  2485                                  ;-268         checknamelen();
  2486                                  
  2487 00000EEC E87DF5                   call checknamelen
  2488                                  
  2489                                  ;-269         addlocal(); nloc-=2;
  2490                                  
  2491 00000EEF E810FE                   call addlocal
  2492 00000EF2 836EFE02                 sub  word[bp-2], 2
  2493                                  
  2494                                  ;-270         if (iswidth == 4) nloc-=2;
  2495                                  
  2496 00000EF6 A0[4000]                 mov al, [iswidth]
  2497 00000EF9 3C04                     cmp al, 4
  2498 00000EFB 0F850400                 jne @@dofunc115
  2499 00000EFF 836EFE02                 sub  word[bp-2], 2
  2500                                  
  2501                                  ;-271         GData[LTop]=nloc;
  2502                                  
  2503                                  @@dofunc115:
  2504 00000F03 8B46FE                   mov ax, [bp-2]
  2505 00000F06 8B1E[3400]               mov bx, [LTop]
  2506 00000F0A D1E3                     shl bx, 1
  2507 00000F0C 8987EB8A                 mov [GData+bx], ax
  2508                                  
  2509                                  ;-272         if (istoken('[')){istype='&';GType[LTop]='&';expect(T_CONST);expect(']');
  2510                                  
  2511 00000F10 6A5B                     push 91
  2512 00000F12 E82D38                   call istoken
  2513 00000F15 83C402                   add  sp, 2
  2514 00000F18 08C0                     or  al, al
  2515 00000F1A 0F843D00                 je @@dofunc116
  2516 00000F1E B82600                   mov ax, 38
  2517 00000F21 A2[3A00]                 mov byte [istype], al
  2518 00000F24 B82600                   mov ax, 38
  2519 00000F27 8B1E[3400]               mov bx, [LTop]
  2520 00000F2B 8887B782                 mov [GType+bx], al
  2521 00000F2F 680101                   push 257
  2522 00000F32 E82F38                   call expect
  2523 00000F35 83C402                   add  sp, 2
  2524 00000F38 6A5D                     push 93
  2525 00000F3A E82738                   call expect
  2526 00000F3D 83C402                   add  sp, 2
  2527                                  
  2528                                  ;-273             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc; }
  2529                                  
  2530 00000F40 8B46FE                   mov ax, [bp-2]
  2531 00000F43 2B06[3600]               sub ax, [lexval]
  2532 00000F47 8946FE                   mov [bp-2], ax
  2533 00000F4A 8346FE02                 add  word[bp-2], 2
  2534 00000F4E 8B46FE                   mov ax, [bp-2]
  2535 00000F51 8B1E[3400]               mov bx, [LTop]
  2536 00000F55 D1E3                     shl bx, 1
  2537 00000F57 8987EB8A                 mov [GData+bx], ax
  2538                                  
  2539                                  ;-274         LTop++;
  2540                                  
  2541                                  @@dofunc116:
  2542 00000F5B FF06[3400]               inc  word[LTop]
  2543                                  
  2544                                  ;-275       } while (istoken(',')); expect(';'); }
  2545                                  
  2546 00000F5F 6A2C                     push 44
  2547 00000F61 E8DE37                   call istoken
  2548 00000F64 83C402                   add  sp, 2
  2549 00000F67 08C0                     or  al, al
  2550 00000F69 0F840300                 je @@dofunc117
  2551 00000F6D E979FF                   jmp @@dofunc114
  2552                                  @@dofunc117:
  2553 00000F70 6A3B                     push 59
  2554 00000F72 E8EF37                   call expect
  2555 00000F75 83C402                   add  sp, 2
  2556                                  
  2557                                  ;-276   listproc(); 
  2558                                  
  2559 00000F78 E965FF                   jmp @@dofunc112
  2560                                  @@dofunc113:
  2561 00000F7B E8E43C                   call listproc
  2562                                  
  2563                                  ;-277   if (LTop>LSTART){prs(";\n ENTER  "); 
  2564                                  
  2565 00000F7E A1[3400]                 mov ax, [LTop]
  2566 00000F81 3DC800                   cmp ax, 200
  2567 00000F84 0F8E2700                 jle @@dofunc118
  2568 00000F88 68[6F10]                 push dofunc_3
  2569 00000F8B E8E938                   call prs
  2570 00000F8E 83C402                   add  sp, 2
  2571                                  
  2572                                  ;-278     nloc=mkneg(nloc); pint1 (nloc); prs(",0"); }
  2573                                  
  2574 00000F91 FF76FE                   push word [bp-2]
  2575 00000F94 E833F1                   call mkneg
  2576 00000F97 83C402                   add  sp, 2
  2577 00000F9A 8946FE                   mov [bp-2], ax
  2578 00000F9D FF76FE                   push word [bp-2]
  2579 00000FA0 E8CB39                   call pint1
  2580 00000FA3 83C402                   add  sp, 2
  2581 00000FA6 68[7B10]                 push dofunc_4
  2582 00000FA9 E8CB38                   call prs
  2583 00000FAC 83C402                   add  sp, 2
  2584                                  
  2585                                  ;-279   while(istoken('}')==0)   stmt();
  2586                                  
  2587                                  @@dofunc118:
  2588                                  @@dofunc119:
  2589 00000FAF 6A7D                     push 125
  2590 00000FB1 E88E37                   call istoken
  2591 00000FB4 83C402                   add  sp, 2
  2592 00000FB7 83F800                   cmp ax, 0
  2593 00000FBA 0F850500                 jne @@dofunc120
  2594 00000FBE E8EF2A                   call stmt
  2595                                  
  2596                                  ;-280   if (nreturn) { prs("\n@@retn:");}
  2597                                  
  2598 00000FC1 EBEC                     jmp @@dofunc119
  2599                                  @@dofunc120:
  2600 00000FC3 A1[2C00]                 mov ax, [nreturn]
  2601 00000FC6 08C0                     or  al, al
  2602 00000FC8 0F840900                 je @@dofunc121
  2603 00000FCC 68[7E10]                 push dofunc_5
  2604 00000FCF E8A538                   call prs
  2605 00000FD2 83C402                   add  sp, 2
  2606                                  
  2607                                  ;-281   if (LTop > LSTART) prs(" LEAVE");
  2608                                  
  2609                                  @@dofunc121:
  2610 00000FD5 A1[3400]                 mov ax, [LTop]
  2611 00000FD8 3DC800                   cmp ax, 200
  2612 00000FDB 0F8E0900                 jle @@dofunc122
  2613 00000FDF 68[8810]                 push dofunc_6
  2614 00000FE2 E89238                   call prs
  2615 00000FE5 83C402                   add  sp, 2
  2616                                  
  2617                                  ;-282   prs("\n ret"); prs("\n; ENDP"); 
  2618                                  
  2619                                  @@dofunc122:
  2620 00000FE8 68[8F10]                 push dofunc_7
  2621 00000FEB E88938                   call prs
  2622 00000FEE 83C402                   add  sp, 2
  2623 00000FF1 68[9610]                 push dofunc_8
  2624 00000FF4 E88038                   call prs
  2625 00000FF7 83C402                   add  sp, 2
  2626                                  
  2627                                  ;-283   *cloc=0; prs(co); maxco1=strlen(co);
  2628                                  
  2629 00000FFA B80000                   mov ax, 0
  2630 00000FFD 8B1E[1C00]               mov  bx, [cloc]
  2631 00001001 8807                     mov  [bx], al
  2632 00001003 8D063075                 lea  ax, [co]
  2633 00001007 50                       push ax
  2634 00001008 E86C38                   call prs
  2635 0000100B 83C402                   add  sp, 2
  2636 0000100E 8D063075                 lea  ax, [co]
  2637 00001012 50                       push ax
  2638 00001013 E845F1                   call strlen
  2639 00001016 83C402                   add  sp, 2
  2640 00001019 A3[1A00]                 mov word [maxco1], ax
  2641                                  
  2642                                  ;-284   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }
  2643                                  
  2644 0000101C A1[1A00]                 mov ax, [maxco1]
  2645 0000101F 3B06[1800]               cmp ax, [maxco]
  2646 00001023 0F8E1600                 jle @@dofunc123
  2647 00001027 A1[1A00]                 mov ax, [maxco1]
  2648 0000102A A3[1800]                 mov word [maxco], ax
  2649 0000102D 8D06AB81                 lea  ax, [fname]
  2650 00001031 50                       push ax
  2651 00001032 8D06E880                 lea  ax, [coname]
  2652 00001036 50                       push ax
  2653 00001037 E849F1                   call strcpy
  2654 0000103A 83C404                   add  sp, 4
  2655                                  
  2656                                  ;-285 }
  2657                                  
  2658                                  @@dofunc123:
  2659                                  
  2660                                  ;-286 int isvariable() {
  2661 0000103D C9                       LEAVE
  2662 0000103E C3                       ret
  2663                                  ; ENDP
  2664 0000103F 46756E6374696F6E20-     dofunc_0 db "Function already defined",0
  2665 00001048 616C72656164792064-
  2666 00001051 6566696E656400     
  2667 00001058 5C6E5C6E00              dofunc_1 db "\n\n",0
  2668 0000105D 3A20203B202A2A2A20-     dofunc_2 db ":  ; *** PROC ***",0
  2669 00001066 50524F43202A2A2A00 
  2670 0000106F 3B5C6E20454E544552-     dofunc_3 db ";\n ENTER  ",0
  2671 00001078 202000             
  2672 0000107B 2C3000                  dofunc_4 db ",0",0
  2673 0000107E 5C6E40407265746E3A-     dofunc_5 db "\n@@retn:",0
  2674 00001087 00                 
  2675 00001088 204C4541564500          dofunc_6 db " LEAVE",0
  2676 0000108F 5C6E2072657400          dofunc_7 db "\n ret",0
  2677 00001096 5C6E3B20454E445000      dofunc_8 db "\n; ENDP",0
  2678                                  
  2679                                  isvariable:  ; *** PROC ***
  2680                                  
  2681                                  ;-287     if(token==T_SIGNED)   goto v1;   
  2682                                  
  2683 0000109F A1[2200]                 mov ax, [token]
  2684 000010A2 3D1302                   cmp ax, 531
  2685 000010A5 0F850300                 jne @@isvariable124
  2686 000010A9 E93A00                   jmp @@v1
  2687                                  
  2688                                  ;-288     if(token==T_UNSIGNED) goto v1;
  2689                                  
  2690                                  @@isvariable124:
  2691 000010AC A1[2200]                 mov ax, [token]
  2692 000010AF 3D1402                   cmp ax, 532
  2693 000010B2 0F850300                 jne @@isvariable125
  2694 000010B6 E92D00                   jmp @@v1
  2695                                  
  2696                                  ;-289     if(token==T_CHAR)     goto v1;   
  2697                                  
  2698                                  @@isvariable125:
  2699 000010B9 A1[2200]                 mov ax, [token]
  2700 000010BC 3D1202                   cmp ax, 530
  2701 000010BF 0F850300                 jne @@isvariable126
  2702 000010C3 E92000                   jmp @@v1
  2703                                  
  2704                                  ;-290     if(token==T_INT)      goto v1;
  2705                                  
  2706                                  @@isvariable126:
  2707 000010C6 A1[2200]                 mov ax, [token]
  2708 000010C9 3D0502                   cmp ax, 517
  2709 000010CC 0F850300                 jne @@isvariable127
  2710 000010D0 E91300                   jmp @@v1
  2711                                  
  2712                                  ;-291     if(token==T_LONG)     goto v1;
  2713                                  
  2714                                  @@isvariable127:
  2715 000010D3 A1[2200]                 mov ax, [token]
  2716 000010D6 3D1502                   cmp ax, 533
  2717 000010D9 0F850300                 jne @@isvariable128
  2718 000010DD E90600                   jmp @@v1
  2719                                  
  2720                                  ;-292     return 0;  
  2721                                  
  2722                                  @@isvariable128:
  2723 000010E0 B80000                   mov ax, 0
  2724 000010E3 E90600                   jmp @@retn
  2725                                  
  2726                                  ;-293 v1: return 1;
  2727                                  
  2728                                  @@v1:
  2729 000010E6 B80100                   mov ax, 1
  2730 000010E9 E90000                   jmp @@retn
  2731                                  
  2732                                  ;-294 }
  2733                                  
  2734                                  
  2735                                  ;-295                   
  2736                                  
  2737                                  
  2738                                  ;-296 int mod1; int ireg1; int idx1; int ids1; int idw1; int idt1; int val1;
  2739                                  
  2740                                  @@retn:
  2741 000010EC C3                       ret
  2742                                  ; ENDP
  2743 000010ED 0000                    mod1 dw 0
  2744 000010EF 0000                    ireg1 dw 0
  2745 000010F1 0000                    idx1 dw 0
  2746 000010F3 0000                    ids1 dw 0
  2747 000010F5 0000                    idw1 dw 0
  2748 000010F7 0000                    idt1 dw 0
  2749 000010F9 0000                    val1 dw 0
  2750                                  
  2751                                  ;-297 int mod2; int ireg2; int idx2; int ids2; int idw2; int idt2; int val2;
  2752                                  
  2753 000010FB 0000                    mod2 dw 0
  2754 000010FD 0000                    ireg2 dw 0
  2755 000010FF 0000                    idx2 dw 0
  2756 00001101 0000                    ids2 dw 0
  2757 00001103 0000                    idw2 dw 0
  2758 00001105 0000                    idt2 dw 0
  2759 00001107 0000                    val2 dw 0
  2760                                  
  2761                                  ;-298 
  2762                                  
  2763                                  
  2764                                  ;-299 int pexpr() {expect('('); iscmp=0; 
  2765                                  
  2766                                  
  2767                                  pexpr:  ; *** PROC ***
  2768 00001109 6A28                     push 40
  2769 0000110B E85636                   call expect
  2770 0000110E 83C402                   add  sp, 2
  2771 00001111 B80000                   mov ax, 0
  2772 00001114 A3[2800]                 mov word [iscmp], ax
  2773                                  
  2774                                  ;-300   if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}
  2775                                  
  2776 00001117 A1[2200]                 mov ax, [token]
  2777 0000111A 3D0001                   cmp ax, 256
  2778 0000111D 0F853400                 jne @@pexpr129
  2779 00001121 68[7F11]                 push pexpr_0
  2780 00001124 8D062B81                 lea  ax, [symbol]
  2781 00001128 50                       push ax
  2782 00001129 E887F0                   call eqstr
  2783 0000112C 83C404                   add  sp, 4
  2784 0000112F 08C0                     or  al, al
  2785 00001131 0F840600                 je @@pexpr130
  2786 00001135 E85F00                   call constantexpr
  2787 00001138 E94300                   jmp @@retn
  2788                                  
  2789                                  ;-301     ireg1=checkreg();
  2790                                  
  2791                                  @@pexpr130:
  2792 0000113B E89B07                   call checkreg
  2793 0000113E A3[EF10]                 mov word [ireg1], ax
  2794                                  
  2795                                  ;-302     if (ireg1) { doreg1(1); return; }  }
  2796                                  
  2797 00001141 A1[EF10]                 mov ax, [ireg1]
  2798 00001144 08C0                     or  al, al
  2799 00001146 0F840B00                 je @@pexpr131
  2800 0000114A 6A01                     push 1
  2801 0000114C E89E05                   call doreg1
  2802 0000114F 83C402                   add  sp, 2
  2803 00001152 E92900                   jmp @@retn
  2804                                  @@pexpr131:
  2805                                  
  2806                                  ;-303   exprstart(); if (iscmp==0) prs("\n or  al, al\n je @@");  prs(fname);
  2807                                  
  2808                                  @@pexpr129:
  2809 00001155 E83E01                   call exprstart
  2810 00001158 A1[2800]                 mov ax, [iscmp]
  2811 0000115B 83F800                   cmp ax, 0
  2812 0000115E 0F850900                 jne @@pexpr132
  2813 00001162 68[8111]                 push pexpr_1
  2814 00001165 E80F37                   call prs
  2815 00001168 83C402                   add  sp, 2
  2816                                  @@pexpr132:
  2817 0000116B 8D06AB81                 lea  ax, [fname]
  2818 0000116F 50                       push ax
  2819 00001170 E80437                   call prs
  2820 00001173 83C402                   add  sp, 2
  2821                                  
  2822                                  ;-304   expect(')'); }           /*error1("Vergleich fehlt");*/
  2823                                  
  2824 00001176 6A29                     push 41
  2825 00001178 E8E935                   call expect
  2826 0000117B 83C402                   add  sp, 2
  2827                                  
  2828                                  ;-305 
  2829                                  
  2830                                  
  2831                                  ;-306 int constantexpr() { int mode; int id1;int ids;
  2832                                  
  2833                                  @@retn:
  2834 0000117E C3                       ret
  2835                                  ; ENDP
  2836 0000117F 5F00                    pexpr_0 db "_",0
  2837 00001181 5C6E206F722020616C-     pexpr_1 db "\n or  al, al\n je @@",0
  2838 0000118A 2C20616C5C6E206A65-
  2839 00001193 20404000           
  2840                                  
  2841                                  constantexpr:  ; *** PROC ***
  2842                                  
  2843                                  ;-307   token=getlex();   mode=typeName();  
  2844                                  
  2845                                  ;Function : constantexpr, Number of local variables: 3
  2846                                  ;   # type sign width addr used name   list of local variables
  2847                                  ;  200 var sign word   306 NULL mode = bp-2
  2848                                  ;  201 var sign word   306 NULL id1 = bp-4
  2849                                  ;  202 var sign word   306 NULL ids = bp-6;
  2850 00001197 C8060000                 ENTER  6,0
  2851 0000119B E8802E                   call getlex
  2852 0000119E A3[2200]                 mov word [token], ax
  2853 000011A1 E850F9                   call typeName
  2854 000011A4 8946FE                   mov [bp-2], ax
  2855                                  
  2856                                  ;-308   id1=searchname(); gettypes(id1); ids=signi;
  2857                                  
  2858 000011A7 E87BF8                   call searchname
  2859 000011AA 8946FC                   mov [bp-4], ax
  2860 000011AD FF76FC                   push word [bp-4]
  2861 000011B0 E834F7                   call gettypes
  2862 000011B3 83C402                   add  sp, 2
  2863 000011B6 A1[3B00]                 mov ax, [signi]
  2864 000011B9 8946FA                   mov [bp-6], ax
  2865                                  
  2866                                  ;-309   if (isrelational() ==0) error1("Relational expression expected");
  2867                                  
  2868 000011BC E8F82D                   call isrelational
  2869 000011BF 83F800                   cmp ax, 0
  2870 000011C2 0F850900                 jne @@constantexpr133
  2871 000011C6 68[4C12]                 push constantexpr_0
  2872 000011C9 E89439                   call error1
  2873 000011CC 83C402                   add  sp, 2
  2874                                  
  2875                                  ;-310   expect(T_CONST);  prs(" ; constant expression");
  2876                                  
  2877                                  @@constantexpr133:
  2878 000011CF 680101                   push 257
  2879 000011D2 E88F35                   call expect
  2880 000011D5 83C402                   add  sp, 2
  2881 000011D8 68[6B12]                 push constantexpr_1
  2882 000011DB E89936                   call prs
  2883 000011DE 83C402                   add  sp, 2
  2884                                  
  2885                                  ;-311   prs("\ncmp "); 
  2886                                  
  2887 000011E1 68[8212]                 push constantexpr_2
  2888 000011E4 E89036                   call prs
  2889 000011E7 83C402                   add  sp, 2
  2890                                  
  2891                                  ;-312   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  2892                                  
  2893 000011EA FF76FC                   push word [bp-4]
  2894 000011ED E8F7F6                   call gettypes
  2895 000011F0 83C402                   add  sp, 2
  2896 000011F3 A1[4100]                 mov ax, [wi]
  2897 000011F6 83F802                   cmp ax, 2
  2898 000011F9 0F850C00                 jne @@constantexpr134
  2899 000011FD 68[8912]                 push constantexpr_3
  2900 00001200 E87436                   call prs
  2901 00001203 83C402                   add  sp, 2
  2902 00001206 E90900                   jmp @@constantexpr135
  2903                                  @@constantexpr134:
  2904 00001209 68[8E12]                 push constantexpr_4
  2905 0000120C E86836                   call prs
  2906 0000120F 83C402                   add  sp, 2
  2907                                  
  2908                                  ;-313   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);
  2909                                  
  2910                                  @@constantexpr135:
  2911 00001212 FF76FC                   push word [bp-4]
  2912 00001215 E821F2                   call v
  2913 00001218 83C402                   add  sp, 2
  2914 0000121B 68[9312]                 push constantexpr_5
  2915 0000121E E85636                   call prs
  2916 00001221 83C402                   add  sp, 2
  2917 00001224 FF36[3600]               push word [lexval]
  2918 00001228 E8A637                   call prunsign1
  2919 0000122B 83C402                   add  sp, 2
  2920 0000122E FF76FA                   push word [bp-6]
  2921 00001231 E8C62A                   call cmpneg
  2922 00001234 83C402                   add  sp, 2
  2923 00001237 8D06AB81                 lea  ax, [fname]
  2924 0000123B 50                       push ax
  2925 0000123C E83836                   call prs
  2926 0000123F 83C402                   add  sp, 2
  2927                                  
  2928                                  ;-314   expect(')');
  2929                                  
  2930 00001242 6A29                     push 41
  2931 00001244 E81D35                   call expect
  2932 00001247 83C402                   add  sp, 2
  2933                                  
  2934                                  ;-315 }  
  2935                                  
  2936                                  
  2937                                  ;-316 int exprstart() { if (eqstr(symbol, "_")) expr2(0); else expr(0); }
  2938 0000124A C9                       LEAVE
  2939 0000124B C3                       ret
  2940                                  ; ENDP
  2941 0000124C 52656C6174696F6E61-     constantexpr_0 db "Relational expression expected",0
  2942 00001255 6C2065787072657373-
  2943 0000125E 696F6E206578706563-
  2944 00001267 74656400           
  2945 0000126B 203B20636F6E737461-     constantexpr_1 db " ; constant expression",0
  2946 00001274 6E7420657870726573-
  2947 0000127D 73696F6E00         
  2948 00001282 5C6E636D702000          constantexpr_2 db "\ncmp ",0
  2949 00001289 776F726400              constantexpr_3 db "word",0
  2950 0000128E 6279746500              constantexpr_4 db "byte",0
  2951 00001293 2C2000                  constantexpr_5 db ", ",0
  2952                                  
  2953                                  exprstart:  ; *** PROC ***
  2954 00001296 68[BE12]                 push exprstart_0
  2955 00001299 8D062B81                 lea  ax, [symbol]
  2956 0000129D 50                       push ax
  2957 0000129E E812EF                   call eqstr
  2958 000012A1 83C404                   add  sp, 4
  2959 000012A4 08C0                     or  al, al
  2960 000012A6 0F840B00                 je @@exprstart136
  2961 000012AA 6A00                     push 0
  2962 000012AC E81100                   call expr2
  2963 000012AF 83C402                   add  sp, 2
  2964 000012B2 E90800                   jmp @@exprstart137
  2965                                  @@exprstart136:
  2966 000012B5 6A00                     push 0
  2967 000012B7 E89E0A                   call expr
  2968 000012BA 83C402                   add  sp, 2
  2969                                  @@exprstart137:
  2970                                  
  2971                                  ;-317 
  2972                                  
  2973                                  
  2974                                  ;-318 int expr2(int kind) {  int i;
  2975                                  
  2976 000012BD C3                       ret
  2977                                  ; ENDP
  2978 000012BE 5F00                    exprstart_0 db "_",0
  2979                                  
  2980                                  expr2:  ; *** PROC ***
  2981                                  
  2982                                  ;-319   if(kind != 1) token=getlex();
  2983                                  
  2984                                  ;Function : expr2, Number of local variables: 2
  2985                                  ;   # type sign width addr used name   list of local variables
  2986                                  ;  200 var sign word   318 NULL kind = bp+4
  2987                                  ;  201 var sign word   318 NULL i = bp-2;
  2988 000012C0 C8020000                 ENTER  2,0
  2989 000012C4 8B4604                   mov ax, [bp+4]
  2990 000012C7 83F801                   cmp ax, 1
  2991 000012CA 0F840600                 je  @@expr2138
  2992 000012CE E84D2D                   call getlex
  2993 000012D1 A3[2200]                 mov word [token], ax
  2994                                  
  2995                                  ;-320   mod1=typeName();
  2996                                  
  2997                                  @@expr2138:
  2998 000012D4 E81DF8                   call typeName
  2999 000012D7 A3[ED10]                 mov word [mod1], ax
  3000                                  
  3001                                  ;-321   if (mod1) error1("Noch kein & und * im Text (Linke Hand) erlaubt");
  3002                                  
  3003 000012DA A1[ED10]                 mov ax, [mod1]
  3004 000012DD 08C0                     or  al, al
  3005 000012DF 0F840900                 je @@expr2139
  3006 000012E3 68[7815]                 push expr2_0
  3007 000012E6 E87738                   call error1
  3008 000012E9 83C402                   add  sp, 2
  3009                                  
  3010                                  ;-322   ireg1=checkreg();
  3011                                  
  3012                                  @@expr2139:
  3013 000012EC E8EA05                   call checkreg
  3014 000012EF A3[EF10]                 mov word [ireg1], ax
  3015                                  
  3016                                  ;-323   if (ireg1) { doreg1(0); return; }
  3017                                  
  3018 000012F2 A1[EF10]                 mov ax, [ireg1]
  3019 000012F5 08C0                     or  al, al
  3020 000012F7 0F840B00                 je @@expr2140
  3021 000012FB 6A00                     push 0
  3022 000012FD E8ED03                   call doreg1
  3023 00001300 83C402                   add  sp, 2
  3024 00001303 E97002                   jmp @@retn
  3025                                  
  3026                                  ;-324   if (ireg1 == 0) { idx1=searchname();
  3027                                  
  3028                                  @@expr2140:
  3029 00001306 A1[EF10]                 mov ax, [ireg1]
  3030 00001309 83F800                   cmp ax, 0
  3031 0000130C 0F853400                 jne @@expr2141
  3032 00001310 E812F7                   call searchname
  3033 00001313 A3[F110]                 mov word [idx1], ax
  3034                                  
  3035                                  ;-325     gettypes(idx1); ids1=signi; idw1=wi; idt1=typei;
  3036                                  
  3037 00001316 FF36[F110]               push word [idx1]
  3038 0000131A E8CAF5                   call gettypes
  3039 0000131D 83C402                   add  sp, 2
  3040 00001320 A1[3B00]                 mov ax, [signi]
  3041 00001323 A3[F310]                 mov word [ids1], ax
  3042 00001326 A1[4100]                 mov ax, [wi]
  3043 00001329 A3[F510]                 mov word [idw1], ax
  3044 0000132C A1[3800]                 mov ax, [typei]
  3045 0000132F A3[F710]                 mov word [idt1], ax
  3046                                  
  3047                                  ;-326     if (idt1)  error1("Noch kein Array oder Pointer links erlaubt");  }
  3048                                  
  3049 00001332 A1[F710]                 mov ax, [idt1]
  3050 00001335 08C0                     or  al, al
  3051 00001337 0F840900                 je @@expr2142
  3052 0000133B 68[A715]                 push expr2_1
  3053 0000133E E81F38                   call error1
  3054 00001341 83C402                   add  sp, 2
  3055                                  @@expr2142:
  3056                                  
  3057                                  ;-327   
  3058                                  
  3059                                  
  3060                                  ;-328   if (isrelational()) { error1("Vergleich noch nicht implementiert");
  3061                                  
  3062                                  @@expr2141:
  3063 00001344 E8702C                   call isrelational
  3064 00001347 08C0                     or  al, al
  3065 00001349 0F840900                 je @@expr2143
  3066 0000134D 68[D215]                 push expr2_2
  3067 00001350 E80D38                   call error1
  3068 00001353 83C402                   add  sp, 2
  3069                                  
  3070                                  ;-329   }
  3071                                  
  3072                                  
  3073                                  ;-330   if (istoken('=') == 0) error1("Assign expected");
  3074                                  
  3075                                  @@expr2143:
  3076 00001356 6A3D                     push 61
  3077 00001358 E8E733                   call istoken
  3078 0000135B 83C402                   add  sp, 2
  3079 0000135E 83F800                   cmp ax, 0
  3080 00001361 0F850900                 jne @@expr2144
  3081 00001365 68[F515]                 push expr2_3
  3082 00001368 E8F537                   call error1
  3083 0000136B 83C402                   add  sp, 2
  3084                                  
  3085                                  ;-331   if (istoken(T_CONST) ) { val2=lexval; prs(" ; constant expression");
  3086                                  
  3087                                  @@expr2144:
  3088 0000136E 680101                   push 257
  3089 00001371 E8CE33                   call istoken
  3090 00001374 83C402                   add  sp, 2
  3091 00001377 08C0                     or  al, al
  3092 00001379 0F849A00                 je @@expr2145
  3093 0000137D A1[3600]                 mov ax, [lexval]
  3094 00001380 A3[0711]                 mov word [val2], ax
  3095 00001383 68[0516]                 push expr2_4
  3096 00001386 E8EE34                   call prs
  3097 00001389 83C402                   add  sp, 2
  3098                                  
  3099                                  ;-332     prs("\nmov ");
  3100                                  
  3101 0000138C 68[1C16]                 push expr2_5
  3102 0000138F E8E534                   call prs
  3103 00001392 83C402                   add  sp, 2
  3104                                  
  3105                                  ;-333     if (idw1 == 1) prs("byte ");
  3106                                  
  3107 00001395 A1[F510]                 mov ax, [idw1]
  3108 00001398 83F801                   cmp ax, 1
  3109 0000139B 0F850900                 jne @@expr2146
  3110 0000139F 68[2316]                 push expr2_6
  3111 000013A2 E8D234                   call prs
  3112 000013A5 83C402                   add  sp, 2
  3113                                  
  3114                                  ;-334     if (idw1 == 2) prs("word ");
  3115                                  
  3116                                  @@expr2146:
  3117 000013A8 A1[F510]                 mov ax, [idw1]
  3118 000013AB 83F802                   cmp ax, 2
  3119 000013AE 0F850900                 jne @@expr2147
  3120 000013B2 68[2916]                 push expr2_7
  3121 000013B5 E8BF34                   call prs
  3122 000013B8 83C402                   add  sp, 2
  3123                                  
  3124                                  ;-335     if (idw1 == 4) prs("dword ");
  3125                                  
  3126                                  @@expr2147:
  3127 000013BB A1[F510]                 mov ax, [idw1]
  3128 000013BE 83F804                   cmp ax, 4
  3129 000013C1 0F850900                 jne @@expr2148
  3130 000013C5 68[2F16]                 push expr2_8
  3131 000013C8 E8AC34                   call prs
  3132 000013CB 83C402                   add  sp, 2
  3133                                  
  3134                                  ;-336     v(idx1);
  3135                                  
  3136                                  @@expr2148:
  3137 000013CE FF36[F110]               push word [idx1]
  3138 000013D2 E864F0                   call v
  3139 000013D5 83C402                   add  sp, 2
  3140                                  
  3141                                  ;-337     prs(", "); prunsign1(val2);
  3142                                  
  3143 000013D8 68[3616]                 push expr2_9
  3144 000013DB E89934                   call prs
  3145 000013DE 83C402                   add  sp, 2
  3146 000013E1 FF36[0711]               push word [val2]
  3147 000013E5 E8E935                   call prunsign1
  3148 000013E8 83C402                   add  sp, 2
  3149                                  
  3150                                  ;-338     if (idx1 >= LSTART) { i=adrofname(idx1);  prs("; "); prs(i); } return; }
  3151                                  
  3152 000013EB A1[F110]                 mov ax, [idx1]
  3153 000013EE 3DC800                   cmp ax, 200 ;unsigned : 1
  3154 000013F1 0F8C1F00                 jl  @@expr2149
  3155 000013F5 FF36[F110]               push word [idx1]
  3156 000013F9 E8A2F5                   call adrofname
  3157 000013FC 83C402                   add  sp, 2
  3158 000013FF 8946FE                   mov [bp-2], ax
  3159 00001402 68[3916]                 push expr2_10
  3160 00001405 E86F34                   call prs
  3161 00001408 83C402                   add  sp, 2
  3162 0000140B FF76FE                   push word [bp-2]
  3163 0000140E E86634                   call prs
  3164 00001411 83C402                   add  sp, 2
  3165                                  @@expr2149:
  3166 00001414 E95F01                   jmp @@retn
  3167                                  
  3168                                  ;-339   
  3169                                  
  3170                                  
  3171                                  ;-340   mod1=typeName(); ireg2=checkreg();
  3172                                  
  3173                                  @@expr2145:
  3174 00001417 E8DAF6                   call typeName
  3175 0000141A A3[ED10]                 mov word [mod1], ax
  3176 0000141D E8B904                   call checkreg
  3177 00001420 A3[FD10]                 mov word [ireg2], ax
  3178                                  
  3179                                  ;-341   if (ireg2) { prs("\nmov ");
  3180                                  
  3181 00001423 A1[FD10]                 mov ax, [ireg2]
  3182 00001426 08C0                     or  al, al
  3183 00001428 0F844200                 je @@expr2150
  3184 0000142C 68[3C16]                 push expr2_11
  3185 0000142F E84534                   call prs
  3186 00001432 83C402                   add  sp, 2
  3187                                  
  3188                                  ;-342     if (ireg1) printreg(ireg1); else v(idx1); prs(", "); printreg(ireg2);return;}
  3189                                  
  3190 00001435 A1[EF10]                 mov ax, [ireg1]
  3191 00001438 08C0                     or  al, al
  3192 0000143A 0F840D00                 je @@expr2151
  3193 0000143E FF36[EF10]               push word [ireg1]
  3194 00001442 E8A208                   call printreg
  3195 00001445 83C402                   add  sp, 2
  3196 00001448 E90A00                   jmp @@expr2152
  3197                                  @@expr2151:
  3198 0000144B FF36[F110]               push word [idx1]
  3199 0000144F E8E7EF                   call v
  3200 00001452 83C402                   add  sp, 2
  3201                                  @@expr2152:
  3202 00001455 68[4316]                 push expr2_12
  3203 00001458 E81C34                   call prs
  3204 0000145B 83C402                   add  sp, 2
  3205 0000145E FF36[FD10]               push word [ireg2]
  3206 00001462 E88208                   call printreg
  3207 00001465 83C402                   add  sp, 2
  3208 00001468 E90B01                   jmp @@retn
  3209                                  
  3210                                  ;-343   else {
  3211                                  
  3212 0000146B E9FF00                   jmp @@expr2153
  3213                                  @@expr2150:
  3214                                  
  3215                                  ;-344     if (mod1 == 1) error1("Noch kein * im Text erlaubt");
  3216                                  
  3217 0000146E A1[ED10]                 mov ax, [mod1]
  3218 00001471 83F801                   cmp ax, 1
  3219 00001474 0F850900                 jne @@expr2154
  3220 00001478 68[4616]                 push expr2_13
  3221 0000147B E8E236                   call error1
  3222 0000147E 83C402                   add  sp, 2
  3223                                  
  3224                                  ;-345     
  3225                                  
  3226                                  
  3227                                  ;-346     idx2=searchname();
  3228                                  
  3229                                  @@expr2154:
  3230 00001481 E8A1F5                   call searchname
  3231 00001484 A3[FF10]                 mov word [idx2], ax
  3232                                  
  3233                                  ;-347     gettypes(idx2); ids2=signi; idw2=wi; idt2=typei;
  3234                                  
  3235 00001487 FF36[FF10]               push word [idx2]
  3236 0000148B E859F4                   call gettypes
  3237 0000148E 83C402                   add  sp, 2
  3238 00001491 A1[3B00]                 mov ax, [signi]
  3239 00001494 A3[0111]                 mov word [ids2], ax
  3240 00001497 A1[4100]                 mov ax, [wi]
  3241 0000149A A3[0311]                 mov word [idw2], ax
  3242 0000149D A1[3800]                 mov ax, [typei]
  3243 000014A0 A3[0511]                 mov word [idt2], ax
  3244                                  
  3245                                  ;-348     if (idt2 == 1)  error1("Noch kein Array rechts erlaubt");
  3246                                  
  3247 000014A3 A1[0511]                 mov ax, [idt2]
  3248 000014A6 83F801                   cmp ax, 1
  3249 000014A9 0F850900                 jne @@expr2155
  3250 000014AD 68[6216]                 push expr2_14
  3251 000014B0 E8AD36                   call error1
  3252 000014B3 83C402                   add  sp, 2
  3253                                  
  3254                                  ;-349     prs("\nmov ");
  3255                                  
  3256                                  @@expr2155:
  3257 000014B6 68[8116]                 push expr2_15
  3258 000014B9 E8BB33                   call prs
  3259 000014BC 83C402                   add  sp, 2
  3260                                  
  3261                                  ;-350     if (ireg1) printreg(ireg1); else error1("Mem to Mem not allowed by x86-CPU");
  3262                                  
  3263 000014BF A1[EF10]                 mov ax, [ireg1]
  3264 000014C2 08C0                     or  al, al
  3265 000014C4 0F840D00                 je @@expr2156
  3266 000014C8 FF36[EF10]               push word [ireg1]
  3267 000014CC E81808                   call printreg
  3268 000014CF 83C402                   add  sp, 2
  3269 000014D2 E90900                   jmp @@expr2157
  3270                                  @@expr2156:
  3271 000014D5 68[8816]                 push expr2_16
  3272 000014D8 E88536                   call error1
  3273 000014DB 83C402                   add  sp, 2
  3274                                  
  3275                                  ;-351     prs(", ");
  3276                                  
  3277                                  @@expr2157:
  3278 000014DE 68[AA16]                 push expr2_17
  3279 000014E1 E89333                   call prs
  3280 000014E4 83C402                   add  sp, 2
  3281                                  
  3282                                  ;-352     if (mod1 == 2) a(idx2);
  3283                                  
  3284 000014E7 A1[ED10]                 mov ax, [mod1]
  3285 000014EA 83F802                   cmp ax, 2
  3286 000014ED 0F850D00                 jne @@expr2158
  3287 000014F1 FF36[FF10]               push word [idx2]
  3288 000014F5 E832EF                   call a
  3289 000014F8 83C402                   add  sp, 2
  3290                                  
  3291                                  ;-353     else {
  3292                                  
  3293 000014FB E96C00                   jmp @@expr2159
  3294                                  @@expr2158:
  3295                                  
  3296                                  ;-354       if (idw2 == 1) prs("byte ");
  3297                                  
  3298 000014FE A1[0311]                 mov ax, [idw2]
  3299 00001501 83F801                   cmp ax, 1
  3300 00001504 0F850900                 jne @@expr2160
  3301 00001508 68[AD16]                 push expr2_18
  3302 0000150B E86933                   call prs
  3303 0000150E 83C402                   add  sp, 2
  3304                                  
  3305                                  ;-355       if (idw2 == 2) prs("word ");
  3306                                  
  3307                                  @@expr2160:
  3308 00001511 A1[0311]                 mov ax, [idw2]
  3309 00001514 83F802                   cmp ax, 2
  3310 00001517 0F850900                 jne @@expr2161
  3311 0000151B 68[B316]                 push expr2_19
  3312 0000151E E85633                   call prs
  3313 00001521 83C402                   add  sp, 2
  3314                                  
  3315                                  ;-356       if (idw2 == 4) prs("dword ");
  3316                                  
  3317                                  @@expr2161:
  3318 00001524 A1[0311]                 mov ax, [idw2]
  3319 00001527 83F804                   cmp ax, 4
  3320 0000152A 0F850900                 jne @@expr2162
  3321 0000152E 68[B916]                 push expr2_20
  3322 00001531 E84333                   call prs
  3323 00001534 83C402                   add  sp, 2
  3324                                  
  3325                                  ;-357       v(idx2);
  3326                                  
  3327                                  @@expr2162:
  3328 00001537 FF36[FF10]               push word [idx2]
  3329 0000153B E8FBEE                   call v
  3330 0000153E 83C402                   add  sp, 2
  3331                                  
  3332                                  ;-358       if (idx2 >= LSTART) { i=adrofname(idx2);  prs("; "); prs(i); }  }
  3333                                  
  3334 00001541 A1[FF10]                 mov ax, [idx2]
  3335 00001544 3DC800                   cmp ax, 200 ;unsigned : 1
  3336 00001547 0F8C1F00                 jl  @@expr2163
  3337 0000154B FF36[FF10]               push word [idx2]
  3338 0000154F E84CF4                   call adrofname
  3339 00001552 83C402                   add  sp, 2
  3340 00001555 8946FE                   mov [bp-2], ax
  3341 00001558 68[C016]                 push expr2_21
  3342 0000155B E81933                   call prs
  3343 0000155E 83C402                   add  sp, 2
  3344 00001561 FF76FE                   push word [bp-2]
  3345 00001564 E81033                   call prs
  3346 00001567 83C402                   add  sp, 2
  3347                                  @@expr2163:
  3348                                  
  3349                                  ;-359     return;
  3350                                  
  3351                                  @@expr2159:
  3352 0000156A E90900                   jmp @@retn
  3353                                  
  3354                                  ;-360   } error1("Internal error: only const or reg allowed");
  3355                                  
  3356                                  @@expr2153:
  3357 0000156D 68[C316]                 push expr2_22
  3358 00001570 E8ED35                   call error1
  3359 00001573 83C402                   add  sp, 2
  3360                                  
  3361                                  ;-361 }
  3362                                  
  3363                                  
  3364                                  ;-362 char ops[5];
  3365                                  
  3366 00001576 C9                      @@retn: LEAVE
  3367 00001577 C3                       ret
  3368                                  ; ENDP
  3369 00001578 4E6F6368206B65696E-     expr2_0 db "Noch kein & und * im Text (Linke Hand) erlaubt",0
  3370 00001581 202620756E64202A20-
  3371 0000158A 696D20546578742028-
  3372 00001593 4C696E6B652048616E-
  3373 0000159C 64292065726C617562-
  3374 000015A5 7400               
  3375 000015A7 4E6F6368206B65696E-     expr2_1 db "Noch kein Array oder Pointer links erlaubt",0
  3376 000015B0 204172726179206F64-
  3377 000015B9 657220506F696E7465-
  3378 000015C2 72206C696E6B732065-
  3379 000015CB 726C6175627400     
  3380 000015D2 566572676C65696368-     expr2_2 db "Vergleich noch nicht implementiert",0
  3381 000015DB 206E6F6368206E6963-
  3382 000015E4 687420696D706C656D-
  3383 000015ED 656E746965727400   
  3384 000015F5 41737369676E206578-     expr2_3 db "Assign expected",0
  3385 000015FE 70656374656400     
  3386 00001605 203B20636F6E737461-     expr2_4 db " ; constant expression",0
  3387 0000160E 6E7420657870726573-
  3388 00001617 73696F6E00         
  3389 0000161C 5C6E6D6F762000          expr2_5 db "\nmov ",0
  3390 00001623 627974652000            expr2_6 db "byte ",0
  3391 00001629 776F72642000            expr2_7 db "word ",0
  3392 0000162F 64776F72642000          expr2_8 db "dword ",0
  3393 00001636 2C2000                  expr2_9 db ", ",0
  3394 00001639 3B2000                  expr2_10 db "; ",0
  3395 0000163C 5C6E6D6F762000          expr2_11 db "\nmov ",0
  3396 00001643 2C2000                  expr2_12 db ", ",0
  3397 00001646 4E6F6368206B65696E-     expr2_13 db "Noch kein * im Text erlaubt",0
  3398 0000164F 202A20696D20546578-
  3399 00001658 742065726C61756274-
  3400 00001661 00                 
  3401 00001662 4E6F6368206B65696E-     expr2_14 db "Noch kein Array rechts erlaubt",0
  3402 0000166B 204172726179207265-
  3403 00001674 636874732065726C61-
  3404 0000167D 75627400           
  3405 00001681 5C6E6D6F762000          expr2_15 db "\nmov ",0
  3406 00001688 4D656D20746F204D65-     expr2_16 db "Mem to Mem not allowed by x86-CPU",0
  3407 00001691 6D206E6F7420616C6C-
  3408 0000169A 6F7765642062792078-
  3409 000016A3 38362D43505500     
  3410 000016AA 2C2000                  expr2_17 db ", ",0
  3411 000016AD 627974652000            expr2_18 db "byte ",0
  3412 000016B3 776F72642000            expr2_19 db "word ",0
  3413 000016B9 64776F72642000          expr2_20 db "dword ",0
  3414 000016C0 3B2000                  expr2_21 db "; ",0
  3415 000016C3 496E7465726E616C20-     expr2_22 db "Internal error: only const or reg allowed",0
  3416 000016CC 6572726F723A206F6E-
  3417 000016D5 6C7920636F6E737420-
  3418 000016DE 6F722072656720616C-
  3419 000016E7 6C6F77656400       
  3420                                  section .bss
  3421                                  absolute 53406
  3422 0000D09E <res 00000005>          ops resb 5
  3423                                  section .text
  3424                                  
  3425                                  ;-363 int doreg1(int iscmp1) { int i;
  3426                                  
  3427                                  
  3428                                  doreg1:  ; *** PROC ***
  3429                                  
  3430                                  ;-364   if (istoken('='))          strcpy(ops, "mov");
  3431                                  
  3432                                  ;Function : doreg1, Number of local variables: 2
  3433                                  ;   # type sign width addr used name   list of local variables
  3434                                  ;  200 var sign word   363 NULL iscmp1 = bp+4
  3435                                  ;  201 var sign word   363 NULL i = bp-2;
  3436 000016ED C8020000                 ENTER  2,0
  3437 000016F1 6A3D                     push 61
  3438 000016F3 E84C30                   call istoken
  3439 000016F6 83C402                   add  sp, 2
  3440 000016F9 08C0                     or  al, al
  3441 000016FB 0F840E00                 je @@doreg1164
  3442 000016FF 68[A018]                 push doreg1_0
  3443 00001702 8D069ED0                 lea  ax, [ops]
  3444 00001706 50                       push ax
  3445 00001707 E879EA                   call strcpy
  3446 0000170A 83C404                   add  sp, 4
  3447                                  
  3448                                  ;-365   if (istoken(T_PLUSASS))    strcpy(ops, "add");
  3449                                  
  3450                                  @@doreg1164:
  3451 0000170D 68CE04                   push 1230
  3452 00001710 E82F30                   call istoken
  3453 00001713 83C402                   add  sp, 2
  3454 00001716 08C0                     or  al, al
  3455 00001718 0F840E00                 je @@doreg1165
  3456 0000171C 68[A418]                 push doreg1_1
  3457 0000171F 8D069ED0                 lea  ax, [ops]
  3458 00001723 50                       push ax
  3459 00001724 E85CEA                   call strcpy
  3460 00001727 83C404                   add  sp, 4
  3461                                  
  3462                                  ;-366   if (istoken(T_MINUSASS))   strcpy(ops, "sub");
  3463                                  
  3464                                  @@doreg1165:
  3465 0000172A 68CF04                   push 1231
  3466 0000172D E81230                   call istoken
  3467 00001730 83C402                   add  sp, 2
  3468 00001733 08C0                     or  al, al
  3469 00001735 0F840E00                 je @@doreg1166
  3470 00001739 68[A818]                 push doreg1_2
  3471 0000173C 8D069ED0                 lea  ax, [ops]
  3472 00001740 50                       push ax
  3473 00001741 E83FEA                   call strcpy
  3474 00001744 83C404                   add  sp, 4
  3475                                  
  3476                                  ;-367   if (istoken(T_ANDASS))     strcpy(ops, "and");
  3477                                  
  3478                                  @@doreg1166:
  3479 00001747 68D204                   push 1234
  3480 0000174A E8F52F                   call istoken
  3481 0000174D 83C402                   add  sp, 2
  3482 00001750 08C0                     or  al, al
  3483 00001752 0F840E00                 je @@doreg1167
  3484 00001756 68[AC18]                 push doreg1_3
  3485 00001759 8D069ED0                 lea  ax, [ops]
  3486 0000175D 50                       push ax
  3487 0000175E E822EA                   call strcpy
  3488 00001761 83C404                   add  sp, 4
  3489                                  
  3490                                  ;-368   if (istoken(T_ORASS))      strcpy(ops, "or" );
  3491                                  
  3492                                  @@doreg1167:
  3493 00001764 68D304                   push 1235
  3494 00001767 E8D82F                   call istoken
  3495 0000176A 83C402                   add  sp, 2
  3496 0000176D 08C0                     or  al, al
  3497 0000176F 0F840E00                 je @@doreg1168
  3498 00001773 68[B018]                 push doreg1_4
  3499 00001776 8D069ED0                 lea  ax, [ops]
  3500 0000177A 50                       push ax
  3501 0000177B E805EA                   call strcpy
  3502 0000177E 83C404                   add  sp, 4
  3503                                  
  3504                                  ;-369   if (istoken(T_LESSLESS))   strcpy(ops, "shl");
  3505                                  
  3506                                  @@doreg1168:
  3507 00001781 68D804                   push 1240
  3508 00001784 E8BB2F                   call istoken
  3509 00001787 83C402                   add  sp, 2
  3510 0000178A 08C0                     or  al, al
  3511 0000178C 0F840E00                 je @@doreg1169
  3512 00001790 68[B318]                 push doreg1_5
  3513 00001793 8D069ED0                 lea  ax, [ops]
  3514 00001797 50                       push ax
  3515 00001798 E8E8E9                   call strcpy
  3516 0000179B 83C404                   add  sp, 4
  3517                                  
  3518                                  ;-370   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");
  3519                                  
  3520                                  @@doreg1169:
  3521 0000179E 68D904                   push 1241
  3522 000017A1 E89E2F                   call istoken
  3523 000017A4 83C402                   add  sp, 2
  3524 000017A7 08C0                     or  al, al
  3525 000017A9 0F840E00                 je @@doreg1170
  3526 000017AD 68[B718]                 push doreg1_6
  3527 000017B0 8D069ED0                 lea  ax, [ops]
  3528 000017B4 50                       push ax
  3529 000017B5 E8CBE9                   call strcpy
  3530 000017B8 83C404                   add  sp, 4
  3531                                  
  3532                                  ;-371   if (iscmp1 == 1) { token=getlex();
  3533                                  
  3534                                  @@doreg1170:
  3535 000017BB 8B4604                   mov ax, [bp+4]
  3536 000017BE 83F801                   cmp ax, 1
  3537 000017C1 0F852700                 jne @@doreg1171
  3538 000017C5 E85628                   call getlex
  3539 000017C8 A3[2200]                 mov word [token], ax
  3540                                  
  3541                                  ;-372       if (isrelational() ==0) error1("Relational expected");
  3542                                  
  3543 000017CB E8E927                   call isrelational
  3544 000017CE 83F800                   cmp ax, 0
  3545 000017D1 0F850900                 jne @@doreg1172
  3546 000017D5 68[BB18]                 push doreg1_7
  3547 000017D8 E88533                   call error1
  3548 000017DB 83C402                   add  sp, 2
  3549                                  
  3550                                  ;-373       strcpy(ops, "cmp"); }
  3551                                  
  3552                                  @@doreg1172:
  3553 000017DE 68[CF18]                 push doreg1_8
  3554 000017E1 8D069ED0                 lea  ax, [ops]
  3555 000017E5 50                       push ax
  3556 000017E6 E89AE9                   call strcpy
  3557 000017E9 83C404                   add  sp, 4
  3558                                  
  3559                                  ;-374   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");
  3560                                  
  3561                                  @@doreg1171:
  3562 000017EC E87A30                   call prnl
  3563 000017EF 8D069ED0                 lea  ax, [ops]
  3564 000017F3 50                       push ax
  3565 000017F4 E88030                   call prs
  3566 000017F7 83C402                   add  sp, 2
  3567 000017FA 68[D318]                 push doreg1_9
  3568 000017FD E87730                   call prs
  3569 00001800 83C402                   add  sp, 2
  3570 00001803 FF36[EF10]               push word [ireg1]
  3571 00001807 E8DD04                   call printreg
  3572 0000180A 83C402                   add  sp, 2
  3573 0000180D 68[D618]                 push doreg1_10
  3574 00001810 E86430                   call prs
  3575 00001813 83C402                   add  sp, 2
  3576                                  
  3577                                  ;-375 
  3578                                  
  3579                                  
  3580                                  ;-376   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}
  3581                                  
  3582 00001816 680101                   push 257
  3583 00001819 E8262F                   call istoken
  3584 0000181C 83C402                   add  sp, 2
  3585 0000181F 08C0                     or  al, al
  3586 00001821 0F840D00                 je @@doreg1173
  3587 00001825 FF36[3600]               push word [lexval]
  3588 00001829 E8A531                   call prunsign1
  3589 0000182C 83C402                   add  sp, 2
  3590 0000182F E94700                   jmp @@reg1
  3591                                  
  3592                                  ;-377   mod2=typeName(); ireg2=checkreg();
  3593                                  
  3594                                  @@doreg1173:
  3595 00001832 E8BFF2                   call typeName
  3596 00001835 A3[FB10]                 mov word [mod2], ax
  3597 00001838 E89E00                   call checkreg
  3598 0000183B A3[FD10]                 mov word [ireg2], ax
  3599                                  
  3600                                  ;-378   if (ireg2) {printreg(ireg2); goto reg1;}
  3601                                  
  3602 0000183E A1[FD10]                 mov ax, [ireg2]
  3603 00001841 08C0                     or  al, al
  3604 00001843 0F840D00                 je @@doreg1174
  3605 00001847 FF36[FD10]               push word [ireg2]
  3606 0000184B E89904                   call printreg
  3607 0000184E 83C402                   add  sp, 2
  3608 00001851 E92500                   jmp @@reg1
  3609                                  
  3610                                  ;-379   i=searchname();  if (mod2 == 2) a(i); else v(i);
  3611                                  
  3612                                  @@doreg1174:
  3613 00001854 E8CEF1                   call searchname
  3614 00001857 8946FE                   mov [bp-2], ax
  3615 0000185A A1[FB10]                 mov ax, [mod2]
  3616 0000185D 83F802                   cmp ax, 2
  3617 00001860 0F850C00                 jne @@doreg1175
  3618 00001864 FF76FE                   push word [bp-2]
  3619 00001867 E8C0EB                   call a
  3620 0000186A 83C402                   add  sp, 2
  3621 0000186D E90900                   jmp @@doreg1176
  3622                                  @@doreg1175:
  3623 00001870 FF76FE                   push word [bp-2]
  3624 00001873 E8C3EB                   call v
  3625 00001876 83C402                   add  sp, 2
  3626                                  
  3627                                  ;-380   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }
  3628                                  
  3629                                  @@doreg1176:
  3630                                  @@reg1:
  3631 00001879 8B4604                   mov ax, [bp+4]
  3632 0000187C 83F801                   cmp ax, 1
  3633 0000187F 0F851B00                 jne @@doreg1177
  3634 00001883 6A00                     push 0
  3635 00001885 E87224                   call cmpneg
  3636 00001888 83C402                   add  sp, 2
  3637 0000188B 8D06AB81                 lea  ax, [fname]
  3638 0000188F 50                       push ax
  3639 00001890 E8E42F                   call prs
  3640 00001893 83C402                   add  sp, 2
  3641 00001896 6A29                     push 41
  3642 00001898 E8C92E                   call expect
  3643 0000189B 83C402                   add  sp, 2
  3644                                  
  3645                                  ;-381 }
  3646                                  
  3647                                  @@doreg1177:
  3648                                  
  3649                                  ;-382 int checkreg() { // >=17 = 16bit, >=47 = 32bit
  3650 0000189E C9                       LEAVE
  3651 0000189F C3                       ret
  3652                                  ; ENDP
  3653 000018A0 6D6F7600                doreg1_0 db "mov",0
  3654 000018A4 61646400                doreg1_1 db "add",0
  3655 000018A8 73756200                doreg1_2 db "sub",0
  3656 000018AC 616E6400                doreg1_3 db "and",0
  3657 000018B0 6F7200                  doreg1_4 db "or",0
  3658 000018B3 73686C00                doreg1_5 db "shl",0
  3659 000018B7 73687200                doreg1_6 db "shr",0
  3660 000018BB 52656C6174696F6E61-     doreg1_7 db "Relational expected",0
  3661 000018C4 6C2065787065637465-
  3662 000018CD 6400               
  3663 000018CF 636D7000                doreg1_8 db "cmp",0
  3664 000018D3 202000                  doreg1_9 db "  ",0
  3665 000018D6 2C2000                  doreg1_10 db ", ",0
  3666                                  
  3667                                  checkreg:  ; *** PROC ***
  3668                                  
  3669                                  ;-383   if (strlen(symbol) <  2) return 0;
  3670                                  
  3671 000018D9 8D062B81                 lea  ax, [symbol]
  3672 000018DD 50                       push ax
  3673 000018DE E87AE8                   call strlen
  3674 000018E1 83C402                   add  sp, 2
  3675 000018E4 83F802                   cmp ax, 2
  3676 000018E7 0F8D0600                 jge @@checkreg178
  3677 000018EB B80000                   mov ax, 0
  3678 000018EE E94403                   jmp @@retn
  3679                                  
  3680                                  ;-384   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;
  3681                                  
  3682                                  @@checkreg178:
  3683 000018F1 68[361C]                 push checkreg_0
  3684 000018F4 8D062B81                 lea  ax, [symbol]
  3685 000018F8 50                       push ax
  3686 000018F9 E8B7E8                   call eqstr
  3687 000018FC 83C404                   add  sp, 4
  3688 000018FF 08C0                     or  al, al
  3689 00001901 0F840600                 je @@checkreg179
  3690 00001905 B80100                   mov ax, 1
  3691 00001908 E92A03                   jmp @@retn
  3692                                  @@checkreg179:
  3693 0000190B 68[391C]                 push checkreg_1
  3694 0000190E 8D062B81                 lea  ax, [symbol]
  3695 00001912 50                       push ax
  3696 00001913 E89DE8                   call eqstr
  3697 00001916 83C404                   add  sp, 4
  3698 00001919 08C0                     or  al, al
  3699 0000191B 0F840600                 je @@checkreg180
  3700 0000191F B80300                   mov ax, 3
  3701 00001922 E91003                   jmp @@retn
  3702                                  
  3703                                  ;-385   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;
  3704                                  
  3705                                  @@checkreg180:
  3706 00001925 68[3C1C]                 push checkreg_2
  3707 00001928 8D062B81                 lea  ax, [symbol]
  3708 0000192C 50                       push ax
  3709 0000192D E883E8                   call eqstr
  3710 00001930 83C404                   add  sp, 4
  3711 00001933 08C0                     or  al, al
  3712 00001935 0F840600                 je @@checkreg181
  3713 00001939 B80500                   mov ax, 5
  3714 0000193C E9F602                   jmp @@retn
  3715                                  @@checkreg181:
  3716 0000193F 68[3F1C]                 push checkreg_3
  3717 00001942 8D062B81                 lea  ax, [symbol]
  3718 00001946 50                       push ax
  3719 00001947 E869E8                   call eqstr
  3720 0000194A 83C404                   add  sp, 4
  3721 0000194D 08C0                     or  al, al
  3722 0000194F 0F840600                 je @@checkreg182
  3723 00001953 B80700                   mov ax, 7
  3724 00001956 E9DC02                   jmp @@retn
  3725                                  
  3726                                  ;-386   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;
  3727                                  
  3728                                  @@checkreg182:
  3729 00001959 68[421C]                 push checkreg_4
  3730 0000195C 8D062B81                 lea  ax, [symbol]
  3731 00001960 50                       push ax
  3732 00001961 E84FE8                   call eqstr
  3733 00001964 83C404                   add  sp, 4
  3734 00001967 08C0                     or  al, al
  3735 00001969 0F840600                 je @@checkreg183
  3736 0000196D B80900                   mov ax, 9
  3737 00001970 E9C202                   jmp @@retn
  3738                                  @@checkreg183:
  3739 00001973 68[451C]                 push checkreg_5
  3740 00001976 8D062B81                 lea  ax, [symbol]
  3741 0000197A 50                       push ax
  3742 0000197B E835E8                   call eqstr
  3743 0000197E 83C404                   add  sp, 4
  3744 00001981 08C0                     or  al, al
  3745 00001983 0F840600                 je @@checkreg184
  3746 00001987 B80B00                   mov ax, 11
  3747 0000198A E9A802                   jmp @@retn
  3748                                  
  3749                                  ;-387   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;
  3750                                  
  3751                                  @@checkreg184:
  3752 0000198D 68[481C]                 push checkreg_6
  3753 00001990 8D062B81                 lea  ax, [symbol]
  3754 00001994 50                       push ax
  3755 00001995 E81BE8                   call eqstr
  3756 00001998 83C404                   add  sp, 4
  3757 0000199B 08C0                     or  al, al
  3758 0000199D 0F840600                 je @@checkreg185
  3759 000019A1 B80D00                   mov ax, 13
  3760 000019A4 E98E02                   jmp @@retn
  3761                                  @@checkreg185:
  3762 000019A7 68[4B1C]                 push checkreg_7
  3763 000019AA 8D062B81                 lea  ax, [symbol]
  3764 000019AE 50                       push ax
  3765 000019AF E801E8                   call eqstr
  3766 000019B2 83C404                   add  sp, 4
  3767 000019B5 08C0                     or  al, al
  3768 000019B7 0F840600                 je @@checkreg186
  3769 000019BB B80F00                   mov ax, 15
  3770 000019BE E97402                   jmp @@retn
  3771                                  
  3772                                  ;-388   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;
  3773                                  
  3774                                  @@checkreg186:
  3775 000019C1 68[4E1C]                 push checkreg_8
  3776 000019C4 8D062B81                 lea  ax, [symbol]
  3777 000019C8 50                       push ax
  3778 000019C9 E8E7E7                   call eqstr
  3779 000019CC 83C404                   add  sp, 4
  3780 000019CF 08C0                     or  al, al
  3781 000019D1 0F840600                 je @@checkreg187
  3782 000019D5 B81100                   mov ax, 17
  3783 000019D8 E95A02                   jmp @@retn
  3784                                  @@checkreg187:
  3785 000019DB 68[511C]                 push checkreg_9
  3786 000019DE 8D062B81                 lea  ax, [symbol]
  3787 000019E2 50                       push ax
  3788 000019E3 E8CDE7                   call eqstr
  3789 000019E6 83C404                   add  sp, 4
  3790 000019E9 08C0                     or  al, al
  3791 000019EB 0F840600                 je @@checkreg188
  3792 000019EF B81300                   mov ax, 19
  3793 000019F2 E94002                   jmp @@retn
  3794                                  
  3795                                  ;-389   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;
  3796                                  
  3797                                  @@checkreg188:
  3798 000019F5 68[541C]                 push checkreg_10
  3799 000019F8 8D062B81                 lea  ax, [symbol]
  3800 000019FC 50                       push ax
  3801 000019FD E8B3E7                   call eqstr
  3802 00001A00 83C404                   add  sp, 4
  3803 00001A03 08C0                     or  al, al
  3804 00001A05 0F840600                 je @@checkreg189
  3805 00001A09 B81500                   mov ax, 21
  3806 00001A0C E92602                   jmp @@retn
  3807                                  @@checkreg189:
  3808 00001A0F 68[571C]                 push checkreg_11
  3809 00001A12 8D062B81                 lea  ax, [symbol]
  3810 00001A16 50                       push ax
  3811 00001A17 E899E7                   call eqstr
  3812 00001A1A 83C404                   add  sp, 4
  3813 00001A1D 08C0                     or  al, al
  3814 00001A1F 0F840600                 je @@checkreg190
  3815 00001A23 B81700                   mov ax, 23
  3816 00001A26 E90C02                   jmp @@retn
  3817                                  
  3818                                  ;-390   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;
  3819                                  
  3820                                  @@checkreg190:
  3821 00001A29 68[5A1C]                 push checkreg_12
  3822 00001A2C 8D062B81                 lea  ax, [symbol]
  3823 00001A30 50                       push ax
  3824 00001A31 E87FE7                   call eqstr
  3825 00001A34 83C404                   add  sp, 4
  3826 00001A37 08C0                     or  al, al
  3827 00001A39 0F840600                 je @@checkreg191
  3828 00001A3D B81900                   mov ax, 25
  3829 00001A40 E9F201                   jmp @@retn
  3830                                  @@checkreg191:
  3831 00001A43 68[5D1C]                 push checkreg_13
  3832 00001A46 8D062B81                 lea  ax, [symbol]
  3833 00001A4A 50                       push ax
  3834 00001A4B E865E7                   call eqstr
  3835 00001A4E 83C404                   add  sp, 4
  3836 00001A51 08C0                     or  al, al
  3837 00001A53 0F840600                 je @@checkreg192
  3838 00001A57 B81B00                   mov ax, 27
  3839 00001A5A E9D801                   jmp @@retn
  3840                                  
  3841                                  ;-391   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;
  3842                                  
  3843                                  @@checkreg192:
  3844 00001A5D 68[601C]                 push checkreg_14
  3845 00001A60 8D062B81                 lea  ax, [symbol]
  3846 00001A64 50                       push ax
  3847 00001A65 E84BE7                   call eqstr
  3848 00001A68 83C404                   add  sp, 4
  3849 00001A6B 08C0                     or  al, al
  3850 00001A6D 0F840600                 je @@checkreg193
  3851 00001A71 B81D00                   mov ax, 29
  3852 00001A74 E9BE01                   jmp @@retn
  3853                                  @@checkreg193:
  3854 00001A77 68[631C]                 push checkreg_15
  3855 00001A7A 8D062B81                 lea  ax, [symbol]
  3856 00001A7E 50                       push ax
  3857 00001A7F E831E7                   call eqstr
  3858 00001A82 83C404                   add  sp, 4
  3859 00001A85 08C0                     or  al, al
  3860 00001A87 0F840600                 je @@checkreg194
  3861 00001A8B B81F00                   mov ax, 31
  3862 00001A8E E9A401                   jmp @@retn
  3863                                  
  3864                                  ;-392   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;
  3865                                  
  3866                                  @@checkreg194:
  3867 00001A91 68[661C]                 push checkreg_16
  3868 00001A94 8D062B81                 lea  ax, [symbol]
  3869 00001A98 50                       push ax
  3870 00001A99 E817E7                   call eqstr
  3871 00001A9C 83C404                   add  sp, 4
  3872 00001A9F 08C0                     or  al, al
  3873 00001AA1 0F840600                 je @@checkreg195
  3874 00001AA5 B82100                   mov ax, 33
  3875 00001AA8 E98A01                   jmp @@retn
  3876                                  @@checkreg195:
  3877 00001AAB 68[691C]                 push checkreg_17
  3878 00001AAE 8D062B81                 lea  ax, [symbol]
  3879 00001AB2 50                       push ax
  3880 00001AB3 E8FDE6                   call eqstr
  3881 00001AB6 83C404                   add  sp, 4
  3882 00001AB9 08C0                     or  al, al
  3883 00001ABB 0F840600                 je @@checkreg196
  3884 00001ABF B82300                   mov ax, 35
  3885 00001AC2 E97001                   jmp @@retn
  3886                                  
  3887                                  ;-393   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;
  3888                                  
  3889                                  @@checkreg196:
  3890 00001AC5 68[6C1C]                 push checkreg_18
  3891 00001AC8 8D062B81                 lea  ax, [symbol]
  3892 00001ACC 50                       push ax
  3893 00001ACD E8E3E6                   call eqstr
  3894 00001AD0 83C404                   add  sp, 4
  3895 00001AD3 08C0                     or  al, al
  3896 00001AD5 0F840600                 je @@checkreg197
  3897 00001AD9 B82500                   mov ax, 37
  3898 00001ADC E95601                   jmp @@retn
  3899                                  @@checkreg197:
  3900 00001ADF 68[6F1C]                 push checkreg_19
  3901 00001AE2 8D062B81                 lea  ax, [symbol]
  3902 00001AE6 50                       push ax
  3903 00001AE7 E8C9E6                   call eqstr
  3904 00001AEA 83C404                   add  sp, 4
  3905 00001AED 08C0                     or  al, al
  3906 00001AEF 0F840600                 je @@checkreg198
  3907 00001AF3 B82700                   mov ax, 39
  3908 00001AF6 E93C01                   jmp @@retn
  3909                                  
  3910                                  ;-394   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;
  3911                                  
  3912                                  @@checkreg198:
  3913 00001AF9 68[721C]                 push checkreg_20
  3914 00001AFC 8D062B81                 lea  ax, [symbol]
  3915 00001B00 50                       push ax
  3916 00001B01 E8AFE6                   call eqstr
  3917 00001B04 83C404                   add  sp, 4
  3918 00001B07 08C0                     or  al, al
  3919 00001B09 0F840600                 je @@checkreg199
  3920 00001B0D B82900                   mov ax, 41
  3921 00001B10 E92201                   jmp @@retn
  3922                                  @@checkreg199:
  3923 00001B13 68[751C]                 push checkreg_21
  3924 00001B16 8D062B81                 lea  ax, [symbol]
  3925 00001B1A 50                       push ax
  3926 00001B1B E895E6                   call eqstr
  3927 00001B1E 83C404                   add  sp, 4
  3928 00001B21 08C0                     or  al, al
  3929 00001B23 0F840600                 je @@checkreg200
  3930 00001B27 B82B00                   mov ax, 43
  3931 00001B2A E90801                   jmp @@retn
  3932                                  
  3933                                  ;-395   // (eqstr(symbol,"ip")) return 45;
  3934                                  
  3935                                  
  3936                                  ;-396   if (strlen(symbol) >   3) return 0;
  3937                                  
  3938                                  @@checkreg200:
  3939 00001B2D 8D062B81                 lea  ax, [symbol]
  3940 00001B31 50                       push ax
  3941 00001B32 E826E6                   call strlen
  3942 00001B35 83C402                   add  sp, 2
  3943 00001B38 83F803                   cmp ax, 3
  3944 00001B3B 0F8E0600                 jle @@checkreg201
  3945 00001B3F B80000                   mov ax, 0
  3946 00001B42 E9F000                   jmp @@retn
  3947                                  
  3948                                  ;-397   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;
  3949                                  
  3950                                  @@checkreg201:
  3951 00001B45 68[781C]                 push checkreg_22
  3952 00001B48 8D062B81                 lea  ax, [symbol]
  3953 00001B4C 50                       push ax
  3954 00001B4D E863E6                   call eqstr
  3955 00001B50 83C404                   add  sp, 4
  3956 00001B53 08C0                     or  al, al
  3957 00001B55 0F840600                 je @@checkreg202
  3958 00001B59 B82F00                   mov ax, 47
  3959 00001B5C E9D600                   jmp @@retn
  3960                                  @@checkreg202:
  3961 00001B5F 68[7C1C]                 push checkreg_23
  3962 00001B62 8D062B81                 lea  ax, [symbol]
  3963 00001B66 50                       push ax
  3964 00001B67 E849E6                   call eqstr
  3965 00001B6A 83C404                   add  sp, 4
  3966 00001B6D 08C0                     or  al, al
  3967 00001B6F 0F840600                 je @@checkreg203
  3968 00001B73 B83200                   mov ax, 50
  3969 00001B76 E9BC00                   jmp @@retn
  3970                                  
  3971                                  ;-398   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;
  3972                                  
  3973                                  @@checkreg203:
  3974 00001B79 68[801C]                 push checkreg_24
  3975 00001B7C 8D062B81                 lea  ax, [symbol]
  3976 00001B80 50                       push ax
  3977 00001B81 E82FE6                   call eqstr
  3978 00001B84 83C404                   add  sp, 4
  3979 00001B87 08C0                     or  al, al
  3980 00001B89 0F840600                 je @@checkreg204
  3981 00001B8D B83500                   mov ax, 53
  3982 00001B90 E9A200                   jmp @@retn
  3983                                  @@checkreg204:
  3984 00001B93 68[841C]                 push checkreg_25
  3985 00001B96 8D062B81                 lea  ax, [symbol]
  3986 00001B9A 50                       push ax
  3987 00001B9B E815E6                   call eqstr
  3988 00001B9E 83C404                   add  sp, 4
  3989 00001BA1 08C0                     or  al, al
  3990 00001BA3 0F840600                 je @@checkreg205
  3991 00001BA7 B83800                   mov ax, 56
  3992 00001BAA E98800                   jmp @@retn
  3993                                  
  3994                                  ;-399   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;
  3995                                  
  3996                                  @@checkreg205:
  3997 00001BAD 68[881C]                 push checkreg_26
  3998 00001BB0 8D062B81                 lea  ax, [symbol]
  3999 00001BB4 50                       push ax
  4000 00001BB5 E8FBE5                   call eqstr
  4001 00001BB8 83C404                   add  sp, 4
  4002 00001BBB 08C0                     or  al, al
  4003 00001BBD 0F840600                 je @@checkreg206
  4004 00001BC1 B83B00                   mov ax, 59
  4005 00001BC4 E96E00                   jmp @@retn
  4006                                  @@checkreg206:
  4007 00001BC7 68[8C1C]                 push checkreg_27
  4008 00001BCA 8D062B81                 lea  ax, [symbol]
  4009 00001BCE 50                       push ax
  4010 00001BCF E8E1E5                   call eqstr
  4011 00001BD2 83C404                   add  sp, 4
  4012 00001BD5 08C0                     or  al, al
  4013 00001BD7 0F840600                 je @@checkreg207
  4014 00001BDB B83E00                   mov ax, 62
  4015 00001BDE E95400                   jmp @@retn
  4016                                  
  4017                                  ;-400   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;
  4018                                  
  4019                                  @@checkreg207:
  4020 00001BE1 68[901C]                 push checkreg_28
  4021 00001BE4 8D062B81                 lea  ax, [symbol]
  4022 00001BE8 50                       push ax
  4023 00001BE9 E8C7E5                   call eqstr
  4024 00001BEC 83C404                   add  sp, 4
  4025 00001BEF 08C0                     or  al, al
  4026 00001BF1 0F840600                 je @@checkreg208
  4027 00001BF5 B84100                   mov ax, 65
  4028 00001BF8 E93A00                   jmp @@retn
  4029                                  @@checkreg208:
  4030 00001BFB 68[941C]                 push checkreg_29
  4031 00001BFE 8D062B81                 lea  ax, [symbol]
  4032 00001C02 50                       push ax
  4033 00001C03 E8ADE5                   call eqstr
  4034 00001C06 83C404                   add  sp, 4
  4035 00001C09 08C0                     or  al, al
  4036 00001C0B 0F840600                 je @@checkreg209
  4037 00001C0F B84400                   mov ax, 68
  4038 00001C12 E92000                   jmp @@retn
  4039                                  
  4040                                  ;-401   if (eqstr(symbol,"cr0")) return 71;
  4041                                  
  4042                                  @@checkreg209:
  4043 00001C15 68[981C]                 push checkreg_30
  4044 00001C18 8D062B81                 lea  ax, [symbol]
  4045 00001C1C 50                       push ax
  4046 00001C1D E893E5                   call eqstr
  4047 00001C20 83C404                   add  sp, 4
  4048 00001C23 08C0                     or  al, al
  4049 00001C25 0F840600                 je @@checkreg210
  4050 00001C29 B84700                   mov ax, 71
  4051 00001C2C E90600                   jmp @@retn
  4052                                  
  4053                                  ;-402   return 0;   }
  4054                                  
  4055                                  @@checkreg210:
  4056 00001C2F B80000                   mov ax, 0
  4057 00001C32 E90000                   jmp @@retn
  4058                                  
  4059                                  ;-403 char printregstr[]
  4060                                  
  4061                                  @@retn:
  4062 00001C35 C3                       ret
  4063                                  ; ENDP
  4064 00001C36 616C00                  checkreg_0 db "al",0
  4065 00001C39 636C00                  checkreg_1 db "cl",0
  4066 00001C3C 646C00                  checkreg_2 db "dl",0
  4067 00001C3F 626C00                  checkreg_3 db "bl",0
  4068 00001C42 616800                  checkreg_4 db "ah",0
  4069 00001C45 636800                  checkreg_5 db "ch",0
  4070 00001C48 646800                  checkreg_6 db "dh",0
  4071 00001C4B 626800                  checkreg_7 db "bh",0
  4072 00001C4E 617800                  checkreg_8 db "ax",0
  4073 00001C51 637800                  checkreg_9 db "cx",0
  4074 00001C54 647800                  checkreg_10 db "dx",0
  4075 00001C57 627800                  checkreg_11 db "bx",0
  4076 00001C5A 737000                  checkreg_12 db "sp",0
  4077 00001C5D 627000                  checkreg_13 db "bp",0
  4078 00001C60 736900                  checkreg_14 db "si",0
  4079 00001C63 646900                  checkreg_15 db "di",0
  4080 00001C66 657300                  checkreg_16 db "es",0
  4081 00001C69 637300                  checkreg_17 db "cs",0
  4082 00001C6C 737300                  checkreg_18 db "ss",0
  4083 00001C6F 647300                  checkreg_19 db "ds",0
  4084 00001C72 667300                  checkreg_20 db "fs",0
  4085 00001C75 677300                  checkreg_21 db "gs",0
  4086 00001C78 65617800                checkreg_22 db "eax",0
  4087 00001C7C 65637800                checkreg_23 db "ecx",0
  4088 00001C80 65647800                checkreg_24 db "edx",0
  4089 00001C84 65627800                checkreg_25 db "ebx",0
  4090 00001C88 65737000                checkreg_26 db "esp",0
  4091 00001C8C 65627000                checkreg_27 db "ebp",0
  4092 00001C90 65736900                checkreg_28 db "esi",0
  4093 00001C94 65646900                checkreg_29 db "edi",0
  4094 00001C98 63723000                checkreg_30 db "cr0",0
  4095                                  
  4096                                  ;-404 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";
  4097                                  
  4098 00001C9C 2A616C636C646C626C-     printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0
  4099 00001CA5 616863686468626861-
  4100 00001CAE 786378647862787370-
  4101 00001CB7 627073696469657363-
  4102 00001CC0 737373647366736773-
  4103 00001CC9 697065617865637865-
  4104 00001CD2 647865627865737065-
  4105 00001CDB 627065736965646963-
  4106 00001CE4 723000             
  4107                                  
  4108                                  ;-405 //          1         2         3         4         5         6         7
  4109                                  
  4110                                  
  4111                                  ;-406 // 1 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3
  4112                                  
  4113                                  
  4114                                  ;-407 int printreg(int i) {  unsigned int k; unsigned char c;
  4115                                  
  4116                                  
  4117                                  printreg:  ; *** PROC ***
  4118                                  
  4119                                  ;-408   k = &printregstr + i; c=*k; prc(c); i++;
  4120                                  
  4121                                  ;Function : printreg, Number of local variables: 3
  4122                                  ;   # type sign width addr used name   list of local variables
  4123                                  ;  200 var sign word   407 NULL i = bp+4
  4124                                  ;  201 var unsg word   407 NULL k = bp-2
  4125                                  ;  202 var unsg byte   407 NULL c = bp-4;
  4126 00001CE7 C8040000                 ENTER  4,0
  4127 00001CEB B8[9C1C]                 mov ax, printregstr
  4128 00001CEE 034604                   add ax, [bp+4]
  4129 00001CF1 8946FE                   mov [bp-2], ax
  4130 00001CF4 8B5EFE                   mov bx, [bp-2]
  4131 00001CF7 8B07                     mov ax, [bx]
  4132 00001CF9 8846FC                   mov [bp-4], al
  4133 00001CFC 8A46FC                   mov al, byte [bp-4]
  4134 00001CFF B400                     mov ah, 0
  4135 00001D01 50                       push ax
  4136 00001D02 E80B2B                   call prc
  4137 00001D05 83C402                   add  sp, 2
  4138 00001D08 FF4604                   inc  word[bp+4]
  4139                                  
  4140                                  ;-409   k = &printregstr + i; c=*k; prc(c);
  4141                                  
  4142 00001D0B B8[9C1C]                 mov ax, printregstr
  4143 00001D0E 034604                   add ax, [bp+4]
  4144 00001D11 8946FE                   mov [bp-2], ax
  4145 00001D14 8B5EFE                   mov bx, [bp-2]
  4146 00001D17 8B07                     mov ax, [bx]
  4147 00001D19 8846FC                   mov [bp-4], al
  4148 00001D1C 8A46FC                   mov al, byte [bp-4]
  4149 00001D1F B400                     mov ah, 0
  4150 00001D21 50                       push ax
  4151 00001D22 E8EB2A                   call prc
  4152 00001D25 83C402                   add  sp, 2
  4153                                  
  4154                                  ;-410   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }
  4155                                  
  4156 00001D28 8B4604                   mov ax, [bp+4]
  4157 00001D2B 83F82F                   cmp ax, 47
  4158 00001D2E 0F8E2000                 jle @@printreg211
  4159 00001D32 FF4604                   inc  word[bp+4]
  4160 00001D35 B8[9C1C]                 mov ax, printregstr
  4161 00001D38 034604                   add ax, [bp+4]
  4162 00001D3B 8946FE                   mov [bp-2], ax
  4163 00001D3E 8B5EFE                   mov bx, [bp-2]
  4164 00001D41 8B07                     mov ax, [bx]
  4165 00001D43 8846FC                   mov [bp-4], al
  4166 00001D46 8A46FC                   mov al, byte [bp-4]
  4167 00001D49 B400                     mov ah, 0
  4168 00001D4B 50                       push ax
  4169 00001D4C E8C12A                   call prc
  4170 00001D4F 83C402                   add  sp, 2
  4171                                  
  4172                                  ;-411 }
  4173                                  
  4174                                  @@printreg211:
  4175                                  
  4176                                  ;-412 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
  4177 00001D52 C9                       LEAVE
  4178 00001D53 C3                       ret
  4179                                  ; ENDP
  4180 00001D54 0000                    evalue dw 0
  4181 00001D56 0A00                    exprtype dw 10
  4182                                  
  4183                                  ;-413 int expr(int isRight)
  4184                                  
  4185                                  
  4186                                  expr:  ; *** PROC ***
  4187                                  
  4188                                  ;-414 { int mode; int id1;     int ixarr; int ixconst;
  4189                                  
  4190                                  
  4191                                  ;-415   int ids;  int isCONST; int i;     unsigned char *p;
  4192                                  
  4193                                  
  4194                                  ;-416   if (istoken(T_CONST)) { evalue=lexval;
  4195                                  
  4196                                  ;Function : expr, Number of local variables: 9
  4197                                  ;   # type sign width addr used name   list of local variables
  4198                                  ;  200 var sign word   413 NULL isRight = bp+4
  4199                                  ;  201 var sign word   414 NULL mode = bp-2
  4200                                  ;  202 var sign word   414 NULL id1 = bp-4
  4201                                  ;  203 var sign word   414 NULL ixarr = bp-6
  4202                                  ;  204 var sign word   414 NULL ixconst = bp-8
  4203                                  ;  205 var sign word   415 NULL ids = bp-10
  4204                                  ;  206 var sign word   415 NULL isCONST = bp-12
  4205                                  ;  207 var sign word   415 NULL i = bp-14
  4206                                  ;  208 ptr unsg byte   415 NULL p = bp-16;
  4207 00001D58 C8100000                 ENTER  16,0
  4208 00001D5C 680101                   push 257
  4209 00001D5F E8E029                   call istoken
  4210 00001D62 83C402                   add  sp, 2
  4211 00001D65 08C0                     or  al, al
  4212 00001D67 0F841F00                 je @@expr212
  4213 00001D6B A1[3600]                 mov ax, [lexval]
  4214 00001D6E A3[541D]                 mov word [evalue], ax
  4215                                  
  4216                                  ;-417     prs("\n mov ax, "); prunsign1(lexval); return 4; }
  4217                                  
  4218 00001D71 68[F820]                 push expr_0
  4219 00001D74 E8002B                   call prs
  4220 00001D77 83C402                   add  sp, 2
  4221 00001D7A FF36[3600]               push word [lexval]
  4222 00001D7E E8502C                   call prunsign1
  4223 00001D81 83C402                   add  sp, 2
  4224 00001D84 B80400                   mov ax, 4
  4225 00001D87 E96C03                   jmp @@retn
  4226                                  
  4227                                  ;-418   mode=typeName(); /*0=V,1=*,2=&*/
  4228                                  
  4229                                  @@expr212:
  4230 00001D8A E867ED                   call typeName
  4231 00001D8D 8946FE                   mov [bp-2], ax
  4232                                  
  4233                                  ;-419   ireg1=checkreg();
  4234                                  
  4235 00001D90 E846FB                   call checkreg
  4236 00001D93 A3[EF10]                 mov word [ireg1], ax
  4237                                  
  4238                                  ;-420   if (ireg1) { doreg1(0); return; }
  4239                                  
  4240 00001D96 A1[EF10]                 mov ax, [ireg1]
  4241 00001D99 08C0                     or  al, al
  4242 00001D9B 0F840B00                 je @@expr213
  4243 00001D9F 6A00                     push 0
  4244 00001DA1 E849F9                   call doreg1
  4245 00001DA4 83C402                   add  sp, 2
  4246 00001DA7 E94C03                   jmp @@retn
  4247                                  
  4248                                  ;-421   if (token=='(')  {docall1(); goto e1; }
  4249                                  
  4250                                  @@expr213:
  4251 00001DAA A1[2200]                 mov ax, [token]
  4252 00001DAD 83F828                   cmp ax, 40
  4253 00001DB0 0F850600                 jne @@expr214
  4254 00001DB4 E82E0F                   call docall1
  4255 00001DB7 E93202                   jmp @@e1
  4256                                  
  4257                                  ;-422   if (isreg()) goto e1;
  4258                                  
  4259                                  @@expr214:
  4260 00001DBA E88307                   call isreg
  4261 00001DBD 08C0                     or  al, al
  4262 00001DBF 0F840300                 je @@expr215
  4263 00001DC3 E92602                   jmp @@e1
  4264                                  
  4265                                  ;-423 
  4266                                  
  4267                                  
  4268                                  ;-424   id1=searchname(); gettypes(id1); ids=signi;
  4269                                  
  4270                                  @@expr215:
  4271 00001DC6 E85CEC                   call searchname
  4272 00001DC9 8946FC                   mov [bp-4], ax
  4273 00001DCC FF76FC                   push word [bp-4]
  4274 00001DCF E815EB                   call gettypes
  4275 00001DD2 83C402                   add  sp, 2
  4276 00001DD5 A1[3B00]                 mov ax, [signi]
  4277 00001DD8 8946F6                   mov [bp-10], ax
  4278                                  
  4279                                  ;-425   ixarr=0;  ixconst=0;
  4280                                  
  4281 00001DDB B80000                   mov ax, 0
  4282 00001DDE 8946FA                   mov [bp-6], ax
  4283 00001DE1 B80000                   mov ax, 0
  4284 00001DE4 8946F8                   mov [bp-8], ax
  4285                                  
  4286                                  ;-426     if (istoken('[')) { if (istoken(T_CONST)) {
  4287                                  
  4288 00001DE7 6A5B                     push 91
  4289 00001DE9 E85629                   call istoken
  4290 00001DEC 83C402                   add  sp, 2
  4291 00001DEF 08C0                     or  al, al
  4292 00001DF1 0F845900                 je @@expr216
  4293 00001DF5 680101                   push 257
  4294 00001DF8 E84729                   call istoken
  4295 00001DFB 83C402                   add  sp, 2
  4296 00001DFE 08C0                     or  al, al
  4297 00001E00 0F841700                 je @@expr217
  4298                                  
  4299                                  ;-427       ixconst=1; ixarr=lexval; expect(']');  }
  4300                                  
  4301 00001E04 B80100                   mov ax, 1
  4302 00001E07 8946F8                   mov [bp-8], ax
  4303 00001E0A A1[3600]                 mov ax, [lexval]
  4304 00001E0D 8946FA                   mov [bp-6], ax
  4305 00001E10 6A5D                     push 93
  4306 00001E12 E84F29                   call expect
  4307 00001E15 83C402                   add  sp, 2
  4308                                  
  4309                                  ;-428     else {ixarr=searchname(); expect(T_NAME); expect(']');
  4310                                  
  4311 00001E18 E93300                   jmp @@expr218
  4312                                  @@expr217:
  4313 00001E1B E807EC                   call searchname
  4314 00001E1E 8946FA                   mov [bp-6], ax
  4315 00001E21 680001                   push 256
  4316 00001E24 E83D29                   call expect
  4317 00001E27 83C402                   add  sp, 2
  4318 00001E2A 6A5D                     push 93
  4319 00001E2C E83529                   call expect
  4320 00001E2F 83C402                   add  sp, 2
  4321                                  
  4322                                  ;-429     gettypes(ixarr);
  4323                                  
  4324 00001E32 FF76FA                   push word [bp-6]
  4325 00001E35 E8AFEA                   call gettypes
  4326 00001E38 83C402                   add  sp, 2
  4327                                  
  4328                                  ;-430     if (widthi != 2) error1("Arrayindex muss Zahl oder int sein"); } }
  4329                                  
  4330 00001E3B A1[3E00]                 mov ax, [widthi]
  4331 00001E3E 83F802                   cmp ax, 2
  4332 00001E41 0F840900                 je  @@expr219
  4333 00001E45 68[0421]                 push expr_1
  4334 00001E48 E8152D                   call error1
  4335 00001E4B 83C402                   add  sp, 2
  4336                                  @@expr219:
  4337                                  @@expr218:
  4338                                  
  4339                                  ;-431   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Nur var erlaubt");
  4340                                  
  4341                                  @@expr216:
  4342 00001E4E 68C304                   push 1219
  4343 00001E51 E8EE28                   call istoken
  4344 00001E54 83C402                   add  sp, 2
  4345 00001E57 08C0                     or  al, al
  4346 00001E59 0F844600                 je @@expr220
  4347 00001E5D 8B46FE                   mov ax, [bp-2]
  4348 00001E60 08C0                     or  al, al
  4349 00001E62 0F840900                 je @@expr221
  4350 00001E66 68[2721]                 push expr_2
  4351 00001E69 E8F42C                   call error1
  4352 00001E6C 83C402                   add  sp, 2
  4353                                  
  4354                                  ;-432      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");
  4355                                  
  4356                                  @@expr221:
  4357 00001E6F 68[3721]                 push expr_3
  4358 00001E72 E8022A                   call prs
  4359 00001E75 83C402                   add  sp, 2
  4360 00001E78 A1[4100]                 mov ax, [wi]
  4361 00001E7B 83F802                   cmp ax, 2
  4362 00001E7E 0F850C00                 jne @@expr222
  4363 00001E82 68[4021]                 push expr_4
  4364 00001E85 E8EF29                   call prs
  4365 00001E88 83C402                   add  sp, 2
  4366 00001E8B E90900                   jmp @@expr223
  4367                                  @@expr222:
  4368 00001E8E 68[4521]                 push expr_5
  4369 00001E91 E8E329                   call prs
  4370 00001E94 83C402                   add  sp, 2
  4371                                  
  4372                                  ;-433      v(id1); goto e1;}
  4373                                  
  4374                                  @@expr223:
  4375 00001E97 FF76FC                   push word [bp-4]
  4376 00001E9A E89CE5                   call v
  4377 00001E9D 83C402                   add  sp, 2
  4378 00001EA0 E94901                   jmp @@e1
  4379                                  
  4380                                  ;-434   if (istoken(T_MINUSMINUS)) {if(mode)error1("Nur var erlaubt");
  4381                                  
  4382                                  @@expr220:
  4383 00001EA3 68C904                   push 1225
  4384 00001EA6 E89928                   call istoken
  4385 00001EA9 83C402                   add  sp, 2
  4386 00001EAC 08C0                     or  al, al
  4387 00001EAE 0F844600                 je @@expr224
  4388 00001EB2 8B46FE                   mov ax, [bp-2]
  4389 00001EB5 08C0                     or  al, al
  4390 00001EB7 0F840900                 je @@expr225
  4391 00001EBB 68[4A21]                 push expr_6
  4392 00001EBE E89F2C                   call error1
  4393 00001EC1 83C402                   add  sp, 2
  4394                                  
  4395                                  ;-435      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");
  4396                                  
  4397                                  @@expr225:
  4398 00001EC4 68[5A21]                 push expr_7
  4399 00001EC7 E8AD29                   call prs
  4400 00001ECA 83C402                   add  sp, 2
  4401 00001ECD A1[4100]                 mov ax, [wi]
  4402 00001ED0 83F802                   cmp ax, 2
  4403 00001ED3 0F850C00                 jne @@expr226
  4404 00001ED7 68[6321]                 push expr_8
  4405 00001EDA E89A29                   call prs
  4406 00001EDD 83C402                   add  sp, 2
  4407 00001EE0 E90900                   jmp @@expr227
  4408                                  @@expr226:
  4409 00001EE3 68[6821]                 push expr_9
  4410 00001EE6 E88E29                   call prs
  4411 00001EE9 83C402                   add  sp, 2
  4412                                  
  4413                                  ;-436      v(id1); goto e1;}
  4414                                  
  4415                                  @@expr227:
  4416 00001EEC FF76FC                   push word [bp-4]
  4417 00001EEF E847E5                   call v
  4418 00001EF2 83C402                   add  sp, 2
  4419 00001EF5 E9F400                   jmp @@e1
  4420                                  
  4421                                  ;-437        
  4422                                  
  4423                                  
  4424                                  ;-438   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}
  4425                                  
  4426                                  @@expr224:
  4427 00001EF8 68CE04                   push 1230
  4428 00001EFB E84428                   call istoken
  4429 00001EFE 83C402                   add  sp, 2
  4430 00001F01 08C0                     or  al, al
  4431 00001F03 0F841200                 je @@expr228
  4432 00001F07 FF76FC                   push word [bp-4]
  4433 00001F0A FF76FE                   push word [bp-2]
  4434 00001F0D 68[6D21]                 push expr_10
  4435 00001F10 E8A802                   call compoundass
  4436 00001F13 83C406                   add  sp, 6
  4437 00001F16 E9D300                   jmp @@e1
  4438                                  
  4439                                  ;-439   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}
  4440                                  
  4441                                  @@expr228:
  4442 00001F19 68CF04                   push 1231
  4443 00001F1C E82328                   call istoken
  4444 00001F1F 83C402                   add  sp, 2
  4445 00001F22 08C0                     or  al, al
  4446 00001F24 0F841200                 je @@expr229
  4447 00001F28 FF76FC                   push word [bp-4]
  4448 00001F2B FF76FE                   push word [bp-2]
  4449 00001F2E 68[7121]                 push expr_11
  4450 00001F31 E88702                   call compoundass
  4451 00001F34 83C406                   add  sp, 6
  4452 00001F37 E9B200                   jmp @@e1
  4453                                  
  4454                                  ;-440   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}
  4455                                  
  4456                                  @@expr229:
  4457 00001F3A 68D204                   push 1234
  4458 00001F3D E80228                   call istoken
  4459 00001F40 83C402                   add  sp, 2
  4460 00001F43 08C0                     or  al, al
  4461 00001F45 0F841200                 je @@expr230
  4462 00001F49 FF76FC                   push word [bp-4]
  4463 00001F4C FF76FE                   push word [bp-2]
  4464 00001F4F 68[7521]                 push expr_12
  4465 00001F52 E86602                   call compoundass
  4466 00001F55 83C406                   add  sp, 6
  4467 00001F58 E99100                   jmp @@e1
  4468                                  
  4469                                  ;-441   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}    
  4470                                  
  4471                                  @@expr230:
  4472 00001F5B 68D304                   push 1235
  4473 00001F5E E8E127                   call istoken
  4474 00001F61 83C402                   add  sp, 2
  4475 00001F64 08C0                     or  al, al
  4476 00001F66 0F841200                 je @@expr231
  4477 00001F6A FF76FC                   push word [bp-4]
  4478 00001F6D FF76FE                   push word [bp-2]
  4479 00001F70 68[7921]                 push expr_13
  4480 00001F73 E84502                   call compoundass
  4481 00001F76 83C406                   add  sp, 6
  4482 00001F79 E97000                   jmp @@e1
  4483                                  
  4484                                  ;-442   if (istoken(T_MULASS    )) {error1("not implemented");}
  4485                                  
  4486                                  @@expr231:
  4487 00001F7C 68D004                   push 1232
  4488 00001F7F E8C027                   call istoken
  4489 00001F82 83C402                   add  sp, 2
  4490 00001F85 08C0                     or  al, al
  4491 00001F87 0F840900                 je @@expr232
  4492 00001F8B 68[7C21]                 push expr_14
  4493 00001F8E E8CF2B                   call error1
  4494 00001F91 83C402                   add  sp, 2
  4495                                  
  4496                                  ;-443   if (istoken(T_DIVASS    )) {error1("not implemented");}
  4497                                  
  4498                                  @@expr232:
  4499 00001F94 68D104                   push 1233
  4500 00001F97 E8A827                   call istoken
  4501 00001F9A 83C402                   add  sp, 2
  4502 00001F9D 08C0                     or  al, al
  4503 00001F9F 0F840900                 je @@expr233
  4504 00001FA3 68[8C21]                 push expr_15
  4505 00001FA6 E8B72B                   call error1
  4506 00001FA9 83C402                   add  sp, 2
  4507                                  
  4508                                  ;-444 
  4509                                  
  4510                                  
  4511                                  ;-445   if (istoken('=')) { exprtype= expr(1); 
  4512                                  
  4513                                  @@expr233:
  4514 00001FAC 6A3D                     push 61
  4515 00001FAE E89127                   call istoken
  4516 00001FB1 83C402                   add  sp, 2
  4517 00001FB4 08C0                     or  al, al
  4518 00001FB6 0F842000                 je @@expr234
  4519 00001FBA 6A01                     push 1
  4520 00001FBC E899FD                   call expr
  4521 00001FBF 83C402                   add  sp, 2
  4522 00001FC2 A3[561D]                 mov word [exprtype], ax
  4523                                  
  4524                                  ;-446   doassign(mode, id1, ixarr, ixconst); goto e1;  }
  4525                                  
  4526 00001FC5 FF76F8                   push word [bp-8]
  4527 00001FC8 FF76FA                   push word [bp-6]
  4528 00001FCB FF76FC                   push word [bp-4]
  4529 00001FCE FF76FE                   push word [bp-2]
  4530 00001FD1 E85E08                   call doassign
  4531 00001FD4 83C408                   add  sp, 8
  4532 00001FD7 E91200                   jmp @@e1
  4533                                  
  4534                                  ;-447   dovar1(mode, "mov", ixarr, id1);
  4535                                  
  4536                                  @@expr234:
  4537 00001FDA FF76FC                   push word [bp-4]
  4538 00001FDD FF76FA                   push word [bp-6]
  4539 00001FE0 68[9C21]                 push expr_16
  4540 00001FE3 FF76FE                   push word [bp-2]
  4541 00001FE6 E87402                   call dovar1
  4542 00001FE9 83C408                   add  sp, 8
  4543                                  
  4544                                  ;-448   
  4545                                  
  4546                                  
  4547                                  ;-449 e1:    if (istoken('+')) rterm("add");
  4548                                  
  4549                                  @@e1:
  4550 00001FEC 6A2B                     push 43
  4551 00001FEE E85127                   call istoken
  4552 00001FF1 83C402                   add  sp, 2
  4553 00001FF4 08C0                     or  al, al
  4554 00001FF6 0F840C00                 je @@expr235
  4555 00001FFA 68[A021]                 push expr_17
  4556 00001FFD E82704                   call rterm
  4557 00002000 83C402                   add  sp, 2
  4558                                  
  4559                                  ;-450   else if (istoken('-')) rterm("sub" );
  4560                                  
  4561 00002003 E9CF00                   jmp @@expr236
  4562                                  @@expr235:
  4563 00002006 6A2D                     push 45
  4564 00002008 E83727                   call istoken
  4565 0000200B 83C402                   add  sp, 2
  4566 0000200E 08C0                     or  al, al
  4567 00002010 0F840C00                 je @@expr237
  4568 00002014 68[A421]                 push expr_18
  4569 00002017 E80D04                   call rterm
  4570 0000201A 83C402                   add  sp, 2
  4571                                  
  4572                                  ;-451   else if (istoken('&')) rterm("and" );
  4573                                  
  4574 0000201D E9B500                   jmp @@expr238
  4575                                  @@expr237:
  4576 00002020 6A26                     push 38
  4577 00002022 E81D27                   call istoken
  4578 00002025 83C402                   add  sp, 2
  4579 00002028 08C0                     or  al, al
  4580 0000202A 0F840C00                 je @@expr239
  4581 0000202E 68[A821]                 push expr_19
  4582 00002031 E8F303                   call rterm
  4583 00002034 83C402                   add  sp, 2
  4584                                  
  4585                                  ;-452   else if (istoken('|')) rterm("or" );  
  4586                                  
  4587 00002037 E99B00                   jmp @@expr240
  4588                                  @@expr239:
  4589 0000203A 6A7C                     push 124
  4590 0000203C E80327                   call istoken
  4591 0000203F 83C402                   add  sp, 2
  4592 00002042 08C0                     or  al, al
  4593 00002044 0F840C00                 je @@expr241
  4594 00002048 68[AC21]                 push expr_20
  4595 0000204B E8D903                   call rterm
  4596 0000204E 83C402                   add  sp, 2
  4597                                  
  4598                                  ;-453   else if (istoken(T_LESSLESS)) rterm("shl");
  4599                                  
  4600 00002051 E98100                   jmp @@expr242
  4601                                  @@expr241:
  4602 00002054 68D804                   push 1240
  4603 00002057 E8E826                   call istoken
  4604 0000205A 83C402                   add  sp, 2
  4605 0000205D 08C0                     or  al, al
  4606 0000205F 0F840C00                 je @@expr243
  4607 00002063 68[AF21]                 push expr_21
  4608 00002066 E8BE03                   call rterm
  4609 00002069 83C402                   add  sp, 2
  4610                                  
  4611                                  ;-454   else if (istoken(T_GREATGREAT)) rterm("shr");  
  4612                                  
  4613 0000206C E96600                   jmp @@expr244
  4614                                  @@expr243:
  4615 0000206F 68D904                   push 1241
  4616 00002072 E8CD26                   call istoken
  4617 00002075 83C402                   add  sp, 2
  4618 00002078 08C0                     or  al, al
  4619 0000207A 0F840C00                 je @@expr245
  4620 0000207E 68[B321]                 push expr_22
  4621 00002081 E8A303                   call rterm
  4622 00002084 83C402                   add  sp, 2
  4623                                  
  4624                                  ;-455   else if (istoken('*')) domul (ids);
  4625                                  
  4626 00002087 E94B00                   jmp @@expr246
  4627                                  @@expr245:
  4628 0000208A 6A2A                     push 42
  4629 0000208C E8B326                   call istoken
  4630 0000208F 83C402                   add  sp, 2
  4631 00002092 08C0                     or  al, al
  4632 00002094 0F840C00                 je @@expr247
  4633 00002098 FF76F6                   push word [bp-10]
  4634 0000209B E8DD09                   call domul
  4635 0000209E 83C402                   add  sp, 2
  4636                                  
  4637                                  ;-456   else if (istoken('/')) doidiv(ids);
  4638                                  
  4639 000020A1 E93100                   jmp @@expr248
  4640                                  @@expr247:
  4641 000020A4 6A2F                     push 47
  4642 000020A6 E89926                   call istoken
  4643 000020A9 83C402                   add  sp, 2
  4644 000020AC 08C0                     or  al, al
  4645 000020AE 0F840C00                 je @@expr249
  4646 000020B2 FF76F6                   push word [bp-10]
  4647 000020B5 E8640A                   call doidiv
  4648 000020B8 83C402                   add  sp, 2
  4649                                  
  4650                                  ;-457   else if (istoken('%')) domod (ids);
  4651                                  
  4652 000020BB E91700                   jmp @@expr250
  4653                                  @@expr249:
  4654 000020BE 6A25                     push 37
  4655 000020C0 E87F26                   call istoken
  4656 000020C3 83C402                   add  sp, 2
  4657 000020C6 08C0                     or  al, al
  4658 000020C8 0F840900                 je @@expr251
  4659 000020CC FF76F6                   push word [bp-10]
  4660 000020CF E8ED0B                   call domod
  4661 000020D2 83C402                   add  sp, 2
  4662                                  
  4663                                  ;-458   if (isrelational()) { rterm("cmp"); cmpneg(ids);}
  4664                                  
  4665                                  @@expr251:
  4666                                  @@expr250:
  4667                                  @@expr248:
  4668                                  @@expr246:
  4669                                  @@expr244:
  4670                                  @@expr242:
  4671                                  @@expr240:
  4672                                  @@expr238:
  4673                                  @@expr236:
  4674 000020D5 E8DF1E                   call isrelational
  4675 000020D8 08C0                     or  al, al
  4676 000020DA 0F841200                 je @@expr252
  4677 000020DE 68[B721]                 push expr_23
  4678 000020E1 E84303                   call rterm
  4679 000020E4 83C402                   add  sp, 2
  4680 000020E7 FF76F6                   push word [bp-10]
  4681 000020EA E80D1C                   call cmpneg
  4682 000020ED 83C402                   add  sp, 2
  4683                                  
  4684                                  ;-459   return 0;
  4685                                  
  4686                                  @@expr252:
  4687 000020F0 B80000                   mov ax, 0
  4688 000020F3 E90000                   jmp @@retn
  4689                                  
  4690                                  ;-460 }
  4691                                  
  4692                                  
  4693                                  ;-461 
  4694                                  
  4695                                  
  4696                                  ;-462 int compoundass(char *op, int mode, int id1) {
  4697                                  
  4698 000020F6 C9                      @@retn: LEAVE
  4699 000020F7 C3                       ret
  4700                                  ; ENDP
  4701 000020F8 5C6E206D6F76206178-     expr_0 db "\n mov ax, ",0
  4702 00002101 2C2000             
  4703 00002104 4172726179696E6465-     expr_1 db "Arrayindex muss Zahl oder int sein",0
  4704 0000210D 78206D757373205A61-
  4705 00002116 686C206F6465722069-
  4706 0000211F 6E74207365696E00   
  4707 00002127 4E7572207661722065-     expr_2 db "Nur var erlaubt",0
  4708 00002130 726C6175627400     
  4709 00002137 5C6E20696E63202000      expr_3 db "\n inc  ",0
  4710 00002140 776F726400              expr_4 db "word",0
  4711 00002145 6279746500              expr_5 db "byte",0
  4712 0000214A 4E7572207661722065-     expr_6 db "Nur var erlaubt",0
  4713 00002153 726C6175627400     
  4714 0000215A 5C6E20646563202000      expr_7 db "\n dec  ",0
  4715 00002163 776F726400              expr_8 db "word",0
  4716 00002168 6279746500              expr_9 db "byte",0
  4717 0000216D 61646400                expr_10 db "add",0
  4718 00002171 73756200                expr_11 db "sub",0
  4719 00002175 616E6400                expr_12 db "and",0
  4720 00002179 6F7200                  expr_13 db "or",0
  4721 0000217C 6E6F7420696D706C65-     expr_14 db "not implemented",0
  4722 00002185 6D656E74656400     
  4723 0000218C 6E6F7420696D706C65-     expr_15 db "not implemented",0
  4724 00002195 6D656E74656400     
  4725 0000219C 6D6F7600                expr_16 db "mov",0
  4726 000021A0 61646400                expr_17 db "add",0
  4727 000021A4 73756200                expr_18 db "sub",0
  4728 000021A8 616E6400                expr_19 db "and",0
  4729 000021AC 6F7200                  expr_20 db "or",0
  4730 000021AF 73686C00                expr_21 db "shl",0
  4731 000021B3 73687200                expr_22 db "shr",0
  4732 000021B7 636D7000                expr_23 db "cmp",0
  4733                                  
  4734                                  compoundass:  ; *** PROC ***
  4735                                  
  4736                                  ;-463   if(mode) error1("only scalar Var allowed");
  4737                                  
  4738                                  ;Function : compoundass, Number of local variables: 3
  4739                                  ;   # type sign width addr used name   list of local variables
  4740                                  ;  200 ptr sign byte   462 NULL op = bp+4
  4741                                  ;  201 var sign word   462 NULL mode = bp+6
  4742                                  ;  202 var sign word   462 NULL id1 = bp+8;
  4743 000021BB C8000000                 ENTER  0,0
  4744 000021BF 8B4606                   mov ax, [bp+6]
  4745 000021C2 08C0                     or  al, al
  4746 000021C4 0F840900                 je @@compoundass253
  4747 000021C8 68[3522]                 push compoundass_0
  4748 000021CB E89229                   call error1
  4749 000021CE 83C402                   add  sp, 2
  4750                                  
  4751                                  ;-464   prnl(); prs(op); prs("  "); 
  4752                                  
  4753                                  @@compoundass253:
  4754 000021D1 E89526                   call prnl
  4755 000021D4 FF7604                   push word [bp+4]
  4756 000021D7 E89D26                   call prs
  4757 000021DA 83C402                   add  sp, 2
  4758 000021DD 68[4D22]                 push compoundass_1
  4759 000021E0 E89426                   call prs
  4760 000021E3 83C402                   add  sp, 2
  4761                                  
  4762                                  ;-465   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  4763                                  
  4764 000021E6 FF7608                   push word [bp+8]
  4765 000021E9 E8FBE6                   call gettypes
  4766 000021EC 83C402                   add  sp, 2
  4767 000021EF A1[4100]                 mov ax, [wi]
  4768 000021F2 83F802                   cmp ax, 2
  4769 000021F5 0F850C00                 jne @@compoundass254
  4770 000021F9 68[5022]                 push compoundass_2
  4771 000021FC E87826                   call prs
  4772 000021FF 83C402                   add  sp, 2
  4773 00002202 E90900                   jmp @@compoundass255
  4774                                  @@compoundass254:
  4775 00002205 68[5522]                 push compoundass_3
  4776 00002208 E86C26                   call prs
  4777 0000220B 83C402                   add  sp, 2
  4778                                  
  4779                                  ;-466   v(id1); prs(", ");
  4780                                  
  4781                                  @@compoundass255:
  4782 0000220E FF7608                   push word [bp+8]
  4783 00002211 E825E2                   call v
  4784 00002214 83C402                   add  sp, 2
  4785 00002217 68[5A22]                 push compoundass_4
  4786 0000221A E85A26                   call prs
  4787 0000221D 83C402                   add  sp, 2
  4788                                  
  4789                                  ;-467   expect(T_CONST); prunsign1(lexval);
  4790                                  
  4791 00002220 680101                   push 257
  4792 00002223 E83E25                   call expect
  4793 00002226 83C402                   add  sp, 2
  4794 00002229 FF36[3600]               push word [lexval]
  4795 0000222D E8A127                   call prunsign1
  4796 00002230 83C402                   add  sp, 2
  4797                                  
  4798                                  ;-468 }
  4799                                  
  4800                                  
  4801                                  ;-469 int dovar1(int mode, int op, int ixarr, int id1) { 
  4802 00002233 C9                       LEAVE
  4803 00002234 C3                       ret
  4804                                  ; ENDP
  4805 00002235 6F6E6C79207363616C-     compoundass_0 db "only scalar Var allowed",0
  4806 0000223E 61722056617220616C-
  4807 00002247 6C6F77656400       
  4808 0000224D 202000                  compoundass_1 db "  ",0
  4809 00002250 776F726400              compoundass_2 db "word",0
  4810 00002255 6279746500              compoundass_3 db "byte",0
  4811 0000225A 2C2000                  compoundass_4 db ", ",0
  4812                                  
  4813                                  dovar1:  ; *** PROC ***
  4814                                  
  4815                                  ;-470   gettypes(id1);
  4816                                  
  4817                                  ;Function : dovar1, Number of local variables: 4
  4818                                  ;   # type sign width addr used name   list of local variables
  4819                                  ;  200 var sign word   469 NULL mode = bp+4
  4820                                  ;  201 var sign word   469 NULL op = bp+6
  4821                                  ;  202 var sign word   469 NULL ixarr = bp+8
  4822                                  ;  203 var sign word   469 NULL id1 = bp+10;
  4823 0000225D C8000000                 ENTER  0,0
  4824 00002261 FF760A                   push word [bp+10]
  4825 00002264 E880E6                   call gettypes
  4826 00002267 83C402                   add  sp, 2
  4827                                  
  4828                                  ;-471   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);
  4829                                  
  4830 0000226A 8B4604                   mov ax, [bp+4]
  4831 0000226D 83F801                   cmp ax, 1
  4832 00002270 0F854700                 jne @@dovar1256
  4833 00002274 68[B223]                 push dovar1_0
  4834 00002277 E8FD25                   call prs
  4835 0000227A 83C402                   add  sp, 2
  4836 0000227D FF760A                   push word [bp+10]
  4837 00002280 E8B6E1                   call v
  4838 00002283 83C402                   add  sp, 2
  4839 00002286 E8E025                   call prnl
  4840 00002289 FF7606                   push word [bp+6]
  4841 0000228C E8E825                   call prs
  4842 0000228F 83C402                   add  sp, 2
  4843                                  
  4844                                  ;-472     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");
  4845                                  
  4846 00002292 A1[3E00]                 mov ax, [widthi]
  4847 00002295 83F801                   cmp ax, 1
  4848 00002298 0F850900                 jne @@dovar1257
  4849 0000229C 68[BE23]                 push dovar1_1
  4850 0000229F E8D525                   call prs
  4851 000022A2 83C402                   add  sp, 2
  4852                                  
  4853                                  ;-473     if(widthi == 2) prs(" ax, [bx]");
  4854                                  
  4855                                  @@dovar1257:
  4856 000022A5 A1[3E00]                 mov ax, [widthi]
  4857 000022A8 83F802                   cmp ax, 2
  4858 000022AB 0F850900                 jne @@dovar1258
  4859 000022AF 68[D423]                 push dovar1_2
  4860 000022B2 E8C225                   call prs
  4861 000022B5 83C402                   add  sp, 2
  4862                                  
  4863                                  ;-474     return; }
  4864                                  
  4865                                  @@dovar1258:
  4866 000022B8 E9F500                   jmp @@retn
  4867                                  
  4868                                  ;-475   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }
  4869                                  
  4870                                  @@dovar1256:
  4871 000022BB 8B4604                   mov ax, [bp+4]
  4872 000022BE 83F802                   cmp ax, 2
  4873 000022C1 0F852100                 jne @@dovar1259
  4874 000022C5 E8A125                   call prnl
  4875 000022C8 FF7606                   push word [bp+6]
  4876 000022CB E8A925                   call prs
  4877 000022CE 83C402                   add  sp, 2
  4878 000022D1 68[DE23]                 push dovar1_3
  4879 000022D4 E8A025                   call prs
  4880 000022D7 83C402                   add  sp, 2
  4881 000022DA FF760A                   push word [bp+10]
  4882 000022DD E84AE1                   call a
  4883 000022E0 83C402                   add  sp, 2
  4884 000022E3 E9CA00                   jmp @@retn
  4885                                  
  4886                                  ;-476   if (ixarr) {
  4887                                  
  4888                                  @@dovar1259:
  4889 000022E6 8B4608                   mov ax, [bp+8]
  4890 000022E9 08C0                     or  al, al
  4891 000022EB 0F847300                 je @@dovar1260
  4892                                  
  4893                                  ;-477     prs("\n mov bx, "); v(ixarr);
  4894                                  
  4895 000022EF 68[E423]                 push dovar1_4
  4896 000022F2 E88225                   call prs
  4897 000022F5 83C402                   add  sp, 2
  4898 000022F8 FF7608                   push word [bp+8]
  4899 000022FB E83BE1                   call v
  4900 000022FE 83C402                   add  sp, 2
  4901                                  
  4902                                  ;-478     if (wi==2) prs("\n shl bx, 1");
  4903                                  
  4904 00002301 A1[4100]                 mov ax, [wi]
  4905 00002304 83F802                   cmp ax, 2
  4906 00002307 0F850900                 jne @@dovar1261
  4907 0000230B 68[F023]                 push dovar1_5
  4908 0000230E E86625                   call prs
  4909 00002311 83C402                   add  sp, 2
  4910                                  
  4911                                  ;-479     prs("\n "); prs(op);
  4912                                  
  4913                                  @@dovar1261:
  4914 00002314 68[FD23]                 push dovar1_6
  4915 00002317 E85D25                   call prs
  4916 0000231A 83C402                   add  sp, 2
  4917 0000231D FF7606                   push word [bp+6]
  4918 00002320 E85425                   call prs
  4919 00002323 83C402                   add  sp, 2
  4920                                  
  4921                                  ;-480     if (wi==2) prs(" ax, "); else prs(" al, ");
  4922                                  
  4923 00002326 A1[4100]                 mov ax, [wi]
  4924 00002329 83F802                   cmp ax, 2
  4925 0000232C 0F850C00                 jne @@dovar1262
  4926 00002330 68[0124]                 push dovar1_7
  4927 00002333 E84125                   call prs
  4928 00002336 83C402                   add  sp, 2
  4929 00002339 E90900                   jmp @@dovar1263
  4930                                  @@dovar1262:
  4931 0000233C 68[0724]                 push dovar1_8
  4932 0000233F E83525                   call prs
  4933 00002342 83C402                   add  sp, 2
  4934                                  
  4935                                  ;-481 // v(id1); prs(" [bx]");
  4936                                  
  4937                                  
  4938                                  ;-482     prc('['); printName(id1); prs(" + bx]"); 
  4939                                  
  4940                                  @@dovar1263:
  4941 00002345 6A5B                     push 91
  4942 00002347 E8C624                   call prc
  4943 0000234A 83C402                   add  sp, 2
  4944 0000234D FF760A                   push word [bp+10]
  4945 00002350 E86EE6                   call printName
  4946 00002353 83C402                   add  sp, 2
  4947 00002356 68[0D24]                 push dovar1_9
  4948 00002359 E81B25                   call prs
  4949 0000235C 83C402                   add  sp, 2
  4950                                  
  4951                                  ;-483     return; }
  4952                                  
  4953 0000235F E94E00                   jmp @@retn
  4954                                  
  4955                                  ;-484   prnl();prs(op);
  4956                                  
  4957                                  @@dovar1260:
  4958 00002362 E80425                   call prnl
  4959 00002365 FF7606                   push word [bp+6]
  4960 00002368 E80C25                   call prs
  4961 0000236B 83C402                   add  sp, 2
  4962                                  
  4963                                  ;-485   if(wi==1) prs(" al, ");
  4964                                  
  4965 0000236E A1[4100]                 mov ax, [wi]
  4966 00002371 83F801                   cmp ax, 1
  4967 00002374 0F850900                 jne @@dovar1264
  4968 00002378 68[1424]                 push dovar1_10
  4969 0000237B E8F924                   call prs
  4970 0000237E 83C402                   add  sp, 2
  4971                                  
  4972                                  ;-486   if(wi==2) prs(" ax, ");
  4973                                  
  4974                                  @@dovar1264:
  4975 00002381 A1[4100]                 mov ax, [wi]
  4976 00002384 83F802                   cmp ax, 2
  4977 00002387 0F850900                 jne @@dovar1265
  4978 0000238B 68[1A24]                 push dovar1_11
  4979 0000238E E8E624                   call prs
  4980 00002391 83C402                   add  sp, 2
  4981                                  
  4982                                  ;-487   if(wi==4) prs(" eax, ");
  4983                                  
  4984                                  @@dovar1265:
  4985 00002394 A1[4100]                 mov ax, [wi]
  4986 00002397 83F804                   cmp ax, 4
  4987 0000239A 0F850900                 jne @@dovar1266
  4988 0000239E 68[2024]                 push dovar1_12
  4989 000023A1 E8D324                   call prs
  4990 000023A4 83C402                   add  sp, 2
  4991                                  
  4992                                  ;-488   v(id1);
  4993                                  
  4994                                  @@dovar1266:
  4995 000023A7 FF760A                   push word [bp+10]
  4996 000023AA E88CE0                   call v
  4997 000023AD 83C402                   add  sp, 2
  4998                                  
  4999                                  ;-489 }
  5000                                  
  5001                                  
  5002                                  ;-490 int rterm(char *op) {int mode; int opint; int ixarr; int id1;
  5003                                  
  5004 000023B0 C9                      @@retn: LEAVE
  5005 000023B1 C3                       ret
  5006                                  ; ENDP
  5007 000023B2 5C6E206D6F76206278-     dovar1_0 db "\n mov bx, ",0
  5008 000023BB 2C2000             
  5009 000023BE 20616C2C205B62785D-     dovar1_1 db " al, [bx]\n mov ah, 0",0
  5010 000023C7 5C6E206D6F76206168-
  5011 000023D0 2C203000           
  5012 000023D4 2061782C205B62785D-     dovar1_2 db " ax, [bx]",0
  5013 000023DD 00                 
  5014 000023DE 2061782C2000            dovar1_3 db " ax, ",0
  5015 000023E4 5C6E206D6F76206278-     dovar1_4 db "\n mov bx, ",0
  5016 000023ED 2C2000             
  5017 000023F0 5C6E2073686C206278-     dovar1_5 db "\n shl bx, 1",0
  5018 000023F9 2C203100           
  5019 000023FD 5C6E2000                dovar1_6 db "\n ",0
  5020 00002401 2061782C2000            dovar1_7 db " ax, ",0
  5021 00002407 20616C2C2000            dovar1_8 db " al, ",0
  5022 0000240D 202B2062785D00          dovar1_9 db " + bx]",0
  5023 00002414 20616C2C2000            dovar1_10 db " al, ",0
  5024 0000241A 2061782C2000            dovar1_11 db " ax, ",0
  5025 00002420 206561782C2000          dovar1_12 db " eax, ",0
  5026                                  
  5027                                  rterm:  ; *** PROC ***
  5028                                  
  5029                                  ;-491   if (istoken(T_CONST)) { prnl(); prs(op); 
  5030                                  
  5031                                  ;Function : rterm, Number of local variables: 5
  5032                                  ;   # type sign width addr used name   list of local variables
  5033                                  ;  200 ptr sign byte   490 NULL op = bp+4
  5034                                  ;  201 var sign word   490 NULL mode = bp-2
  5035                                  ;  202 var sign word   490 NULL opint = bp-4
  5036                                  ;  203 var sign word   490 NULL ixarr = bp-6
  5037                                  ;  204 var sign word   490 NULL id1 = bp-8;
  5038 00002427 C8080000                 ENTER  8,0
  5039 0000242B 680101                   push 257
  5040 0000242E E81123                   call istoken
  5041 00002431 83C402                   add  sp, 2
  5042 00002434 08C0                     or  al, al
  5043 00002436 0F845200                 je @@rterm267
  5044 0000243A E82C24                   call prnl
  5045 0000243D FF7604                   push word [bp+4]
  5046 00002440 E83424                   call prs
  5047 00002443 83C402                   add  sp, 2
  5048                                  
  5049                                  ;-492     if (wi==1) prs(" al, ");
  5050                                  
  5051 00002446 A1[4100]                 mov ax, [wi]
  5052 00002449 83F801                   cmp ax, 1
  5053 0000244C 0F850900                 jne @@rterm268
  5054 00002450 68[1025]                 push rterm_0
  5055 00002453 E82124                   call prs
  5056 00002456 83C402                   add  sp, 2
  5057                                  
  5058                                  ;-493     if (wi==2) prs(" ax, ");
  5059                                  
  5060                                  @@rterm268:
  5061 00002459 A1[4100]                 mov ax, [wi]
  5062 0000245C 83F802                   cmp ax, 2
  5063 0000245F 0F850900                 jne @@rterm269
  5064 00002463 68[1625]                 push rterm_1
  5065 00002466 E80E24                   call prs
  5066 00002469 83C402                   add  sp, 2
  5067                                  
  5068                                  ;-494     if (wi==4) prs(" eax, ");
  5069                                  
  5070                                  @@rterm269:
  5071 0000246C A1[4100]                 mov ax, [wi]
  5072 0000246F 83F804                   cmp ax, 4
  5073 00002472 0F850900                 jne @@rterm270
  5074 00002476 68[1C25]                 push rterm_2
  5075 00002479 E8FB23                   call prs
  5076 0000247C 83C402                   add  sp, 2
  5077                                  
  5078                                  ;-495     prunsign1(lexval); return;}
  5079                                  
  5080                                  @@rterm270:
  5081 0000247F FF36[3600]               push word [lexval]
  5082 00002483 E84B25                   call prunsign1
  5083 00002486 83C402                   add  sp, 2
  5084 00002489 E98200                   jmp @@retn
  5085                                  
  5086                                  ;-496   mode=typeName(); id1=searchname(); ixarr=0;
  5087                                  
  5088                                  @@rterm267:
  5089 0000248C E865E6                   call typeName
  5090 0000248F 8946FE                   mov [bp-2], ax
  5091 00002492 E890E5                   call searchname
  5092 00002495 8946F8                   mov [bp-8], ax
  5093 00002498 B80000                   mov ax, 0
  5094 0000249B 8946FA                   mov [bp-6], ax
  5095                                  
  5096                                  ;-497   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');  
  5097                                  
  5098 0000249E 6A5B                     push 91
  5099 000024A0 E89F22                   call istoken
  5100 000024A3 83C402                   add  sp, 2
  5101 000024A6 08C0                     or  al, al
  5102 000024A8 0F843300                 je @@rterm271
  5103 000024AC E876E5                   call searchname
  5104 000024AF 8946FA                   mov [bp-6], ax
  5105 000024B2 680001                   push 256
  5106 000024B5 E8AC22                   call expect
  5107 000024B8 83C402                   add  sp, 2
  5108 000024BB 6A5D                     push 93
  5109 000024BD E8A422                   call expect
  5110 000024C0 83C402                   add  sp, 2
  5111                                  
  5112                                  ;-498     gettypes(ixarr);
  5113                                  
  5114 000024C3 FF76FA                   push word [bp-6]
  5115 000024C6 E81EE4                   call gettypes
  5116 000024C9 83C402                   add  sp, 2
  5117                                  
  5118                                  ;-499     if (widthi != 2) error1("Arrayindex muss int sein"); }
  5119                                  
  5120 000024CC A1[3E00]                 mov ax, [widthi]
  5121 000024CF 83F802                   cmp ax, 2
  5122 000024D2 0F840900                 je  @@rterm272
  5123 000024D6 68[2325]                 push rterm_3
  5124 000024D9 E88426                   call error1
  5125 000024DC 83C402                   add  sp, 2
  5126                                  @@rterm272:
  5127                                  
  5128                                  ;-500   if (eqstr(symbol,"_AX")) return;
  5129                                  
  5130                                  @@rterm271:
  5131 000024DF 68[3C25]                 push rterm_4
  5132 000024E2 8D062B81                 lea  ax, [symbol]
  5133 000024E6 50                       push ax
  5134 000024E7 E8C9DC                   call eqstr
  5135 000024EA 83C404                   add  sp, 4
  5136 000024ED 08C0                     or  al, al
  5137 000024EF 0F840300                 je @@rterm273
  5138 000024F3 E91800                   jmp @@retn
  5139                                  
  5140                                  ;-501   opint=op; dovar1(mode, opint, ixarr, id1);
  5141                                  
  5142                                  @@rterm273:
  5143 000024F6 8B4604                   mov ax, [bp+4]
  5144 000024F9 8946FC                   mov [bp-4], ax
  5145 000024FC FF76F8                   push word [bp-8]
  5146 000024FF FF76FA                   push word [bp-6]
  5147 00002502 FF76FC                   push word [bp-4]
  5148 00002505 FF76FE                   push word [bp-2]
  5149 00002508 E852FD                   call dovar1
  5150 0000250B 83C408                   add  sp, 8
  5151                                  
  5152                                  ;-502 }
  5153                                  
  5154                                  
  5155                                  ;-503 int isreg() {
  5156                                  
  5157 0000250E C9                      @@retn: LEAVE
  5158 0000250F C3                       ret
  5159                                  ; ENDP
  5160 00002510 20616C2C2000            rterm_0 db " al, ",0
  5161 00002516 2061782C2000            rterm_1 db " ax, ",0
  5162 0000251C 206561782C2000          rterm_2 db " eax, ",0
  5163 00002523 4172726179696E6465-     rterm_3 db "Arrayindex muss int sein",0
  5164 0000252C 78206D75737320696E-
  5165 00002535 74207365696E00     
  5166 0000253C 5F415800                rterm_4 db "_AX",0
  5167                                  
  5168                                  isreg:  ; *** PROC ***
  5169                                  
  5170                                  ;-504   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}
  5171                                  
  5172 00002540 68[2D27]                 push isreg_0
  5173 00002543 8D062B81                 lea  ax, [symbol]
  5174 00002547 50                       push ax
  5175 00002548 E868DC                   call eqstr
  5176 0000254B 83C404                   add  sp, 4
  5177 0000254E 08C0                     or  al, al
  5178 00002550 0F840C00                 je @@isreg274
  5179 00002554 68[3127]                 push isreg_1
  5180 00002557 E84202                   call doreg
  5181 0000255A 83C402                   add  sp, 2
  5182 0000255D E9C601                   jmp @@r1
  5183                                  
  5184                                  ;-505   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}  
  5185                                  
  5186                                  @@isreg274:
  5187 00002560 68[3427]                 push isreg_2
  5188 00002563 8D062B81                 lea  ax, [symbol]
  5189 00002567 50                       push ax
  5190 00002568 E848DC                   call eqstr
  5191 0000256B 83C404                   add  sp, 4
  5192 0000256E 08C0                     or  al, al
  5193 00002570 0F840C00                 je @@isreg275
  5194 00002574 68[3827]                 push isreg_3
  5195 00002577 E82202                   call doreg
  5196 0000257A 83C402                   add  sp, 2
  5197 0000257D E9A601                   jmp @@r1
  5198                                  
  5199                                  ;-506   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}
  5200                                  
  5201                                  @@isreg275:
  5202 00002580 68[3B27]                 push isreg_4
  5203 00002583 8D062B81                 lea  ax, [symbol]
  5204 00002587 50                       push ax
  5205 00002588 E828DC                   call eqstr
  5206 0000258B 83C404                   add  sp, 4
  5207 0000258E 08C0                     or  al, al
  5208 00002590 0F840C00                 je @@isreg276
  5209 00002594 68[3F27]                 push isreg_5
  5210 00002597 E80202                   call doreg
  5211 0000259A 83C402                   add  sp, 2
  5212 0000259D E98601                   jmp @@r1
  5213                                  
  5214                                  ;-507   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}
  5215                                  
  5216                                  @@isreg276:
  5217 000025A0 68[4227]                 push isreg_6
  5218 000025A3 8D062B81                 lea  ax, [symbol]
  5219 000025A7 50                       push ax
  5220 000025A8 E808DC                   call eqstr
  5221 000025AB 83C404                   add  sp, 4
  5222 000025AE 08C0                     or  al, al
  5223 000025B0 0F840C00                 je @@isreg277
  5224 000025B4 68[4627]                 push isreg_7
  5225 000025B7 E8E201                   call doreg
  5226 000025BA 83C402                   add  sp, 2
  5227 000025BD E96601                   jmp @@r1
  5228                                  
  5229                                  ;-508   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}
  5230                                  
  5231                                  @@isreg277:
  5232 000025C0 68[4927]                 push isreg_8
  5233 000025C3 8D062B81                 lea  ax, [symbol]
  5234 000025C7 50                       push ax
  5235 000025C8 E8E8DB                   call eqstr
  5236 000025CB 83C404                   add  sp, 4
  5237 000025CE 08C0                     or  al, al
  5238 000025D0 0F840C00                 je @@isreg278
  5239 000025D4 68[4D27]                 push isreg_9
  5240 000025D7 E8C201                   call doreg
  5241 000025DA 83C402                   add  sp, 2
  5242 000025DD E94601                   jmp @@r1
  5243                                  
  5244                                  ;-509   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}    
  5245                                  
  5246                                  @@isreg278:
  5247 000025E0 68[5027]                 push isreg_10
  5248 000025E3 8D062B81                 lea  ax, [symbol]
  5249 000025E7 50                       push ax
  5250 000025E8 E8C8DB                   call eqstr
  5251 000025EB 83C404                   add  sp, 4
  5252 000025EE 08C0                     or  al, al
  5253 000025F0 0F840C00                 je @@isreg279
  5254 000025F4 68[5427]                 push isreg_11
  5255 000025F7 E8A201                   call doreg
  5256 000025FA 83C402                   add  sp, 2
  5257 000025FD E92601                   jmp @@r1
  5258                                  
  5259                                  ;-510   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}
  5260                                  
  5261                                  @@isreg279:
  5262 00002600 68[5727]                 push isreg_12
  5263 00002603 8D062B81                 lea  ax, [symbol]
  5264 00002607 50                       push ax
  5265 00002608 E8A8DB                   call eqstr
  5266 0000260B 83C404                   add  sp, 4
  5267 0000260E 08C0                     or  al, al
  5268 00002610 0F840C00                 je @@isreg280
  5269 00002614 68[5B27]                 push isreg_13
  5270 00002617 E88201                   call doreg
  5271 0000261A 83C402                   add  sp, 2
  5272 0000261D E90601                   jmp @@r1
  5273                                  
  5274                                  ;-511   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}
  5275                                  
  5276                                  @@isreg280:
  5277 00002620 68[5E27]                 push isreg_14
  5278 00002623 8D062B81                 lea  ax, [symbol]
  5279 00002627 50                       push ax
  5280 00002628 E888DB                   call eqstr
  5281 0000262B 83C404                   add  sp, 4
  5282 0000262E 08C0                     or  al, al
  5283 00002630 0F840C00                 je @@isreg281
  5284 00002634 68[6227]                 push isreg_15
  5285 00002637 E86201                   call doreg
  5286 0000263A 83C402                   add  sp, 2
  5287 0000263D E9E600                   jmp @@r1
  5288                                  
  5289                                  ;-512   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}    
  5290                                  
  5291                                  @@isreg281:
  5292 00002640 68[6527]                 push isreg_16
  5293 00002643 8D062B81                 lea  ax, [symbol]
  5294 00002647 50                       push ax
  5295 00002648 E868DB                   call eqstr
  5296 0000264B 83C404                   add  sp, 4
  5297 0000264E 08C0                     or  al, al
  5298 00002650 0F840C00                 je @@isreg282
  5299 00002654 68[6927]                 push isreg_17
  5300 00002657 E84201                   call doreg
  5301 0000265A 83C402                   add  sp, 2
  5302 0000265D E9C600                   jmp @@r1
  5303                                  
  5304                                  ;-513   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}
  5305                                  
  5306                                  @@isreg282:
  5307 00002660 68[6C27]                 push isreg_18
  5308 00002663 8D062B81                 lea  ax, [symbol]
  5309 00002667 50                       push ax
  5310 00002668 E848DB                   call eqstr
  5311 0000266B 83C404                   add  sp, 4
  5312 0000266E 08C0                     or  al, al
  5313 00002670 0F840C00                 je @@isreg283
  5314 00002674 68[7027]                 push isreg_19
  5315 00002677 E82201                   call doreg
  5316 0000267A 83C402                   add  sp, 2
  5317 0000267D E9A600                   jmp @@r1
  5318                                  
  5319                                  ;-514   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}
  5320                                  
  5321                                  @@isreg283:
  5322 00002680 68[7327]                 push isreg_20
  5323 00002683 8D062B81                 lea  ax, [symbol]
  5324 00002687 50                       push ax
  5325 00002688 E828DB                   call eqstr
  5326 0000268B 83C404                   add  sp, 4
  5327 0000268E 08C0                     or  al, al
  5328 00002690 0F840C00                 je @@isreg284
  5329 00002694 68[7727]                 push isreg_21
  5330 00002697 E80201                   call doreg
  5331 0000269A 83C402                   add  sp, 2
  5332 0000269D E98600                   jmp @@r1
  5333                                  
  5334                                  ;-515   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}  
  5335                                  
  5336                                  @@isreg284:
  5337 000026A0 68[7A27]                 push isreg_22
  5338 000026A3 8D062B81                 lea  ax, [symbol]
  5339 000026A7 50                       push ax
  5340 000026A8 E808DB                   call eqstr
  5341 000026AB 83C404                   add  sp, 4
  5342 000026AE 08C0                     or  al, al
  5343 000026B0 0F840C00                 je @@isreg285
  5344 000026B4 68[7E27]                 push isreg_23
  5345 000026B7 E8E200                   call doreg
  5346 000026BA 83C402                   add  sp, 2
  5347 000026BD E96600                   jmp @@r1
  5348                                  
  5349                                  ;-516   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}
  5350                                  
  5351                                  @@isreg285:
  5352 000026C0 68[8127]                 push isreg_24
  5353 000026C3 8D062B81                 lea  ax, [symbol]
  5354 000026C7 50                       push ax
  5355 000026C8 E8E8DA                   call eqstr
  5356 000026CB 83C404                   add  sp, 4
  5357 000026CE 08C0                     or  al, al
  5358 000026D0 0F840C00                 je @@isreg286
  5359 000026D4 68[8527]                 push isreg_25
  5360 000026D7 E8C200                   call doreg
  5361 000026DA 83C402                   add  sp, 2
  5362 000026DD E94600                   jmp @@r1
  5363                                  
  5364                                  ;-517   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}
  5365                                  
  5366                                  @@isreg286:
  5367 000026E0 68[8827]                 push isreg_26
  5368 000026E3 8D062B81                 lea  ax, [symbol]
  5369 000026E7 50                       push ax
  5370 000026E8 E8C8DA                   call eqstr
  5371 000026EB 83C404                   add  sp, 4
  5372 000026EE 08C0                     or  al, al
  5373 000026F0 0F840C00                 je @@isreg287
  5374 000026F4 68[8C27]                 push isreg_27
  5375 000026F7 E8A200                   call doreg
  5376 000026FA 83C402                   add  sp, 2
  5377 000026FD E92600                   jmp @@r1
  5378                                  
  5379                                  ;-518   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}  
  5380                                  
  5381                                  @@isreg287:
  5382 00002700 68[8F27]                 push isreg_28
  5383 00002703 8D062B81                 lea  ax, [symbol]
  5384 00002707 50                       push ax
  5385 00002708 E8A8DA                   call eqstr
  5386 0000270B 83C404                   add  sp, 4
  5387 0000270E 08C0                     or  al, al
  5388 00002710 0F840C00                 je @@isreg288
  5389 00002714 68[9627]                 push isreg_29
  5390 00002717 E88200                   call doreg
  5391 0000271A 83C402                   add  sp, 2
  5392 0000271D E90600                   jmp @@r1
  5393                                  
  5394                                  ;-519   return 0;   r1: return 1; 
  5395                                  
  5396                                  @@isreg288:
  5397 00002720 B80000                   mov ax, 0
  5398 00002723 E90600                   jmp @@retn
  5399                                  @@r1:
  5400 00002726 B80100                   mov ax, 1
  5401 00002729 E90000                   jmp @@retn
  5402                                  
  5403                                  ;-520 }
  5404                                  
  5405                                  
  5406                                  ;-521 int doreg(char *dr) { int i; expect('=');
  5407                                  
  5408                                  @@retn:
  5409 0000272C C3                       ret
  5410                                  ; ENDP
  5411 0000272D 5F414800                isreg_0 db "_AH",0
  5412 00002731 616800                  isreg_1 db "ah",0
  5413 00002734 5F414C00                isreg_2 db "_AL",0
  5414 00002738 616C00                  isreg_3 db "al",0
  5415 0000273B 5F415800                isreg_4 db "_AX",0
  5416 0000273F 617800                  isreg_5 db "ax",0
  5417 00002742 5F424800                isreg_6 db "_BH",0
  5418 00002746 626800                  isreg_7 db "bh",0
  5419 00002749 5F424C00                isreg_8 db "_BL",0
  5420 0000274D 626C00                  isreg_9 db "bl",0
  5421 00002750 5F425800                isreg_10 db "_BX",0
  5422 00002754 627800                  isreg_11 db "bx",0
  5423 00002757 5F434800                isreg_12 db "_CH",0
  5424 0000275B 636800                  isreg_13 db "ch",0
  5425 0000275E 5F434C00                isreg_14 db "_CL",0
  5426 00002762 636C00                  isreg_15 db "cl",0
  5427 00002765 5F435800                isreg_16 db "_CX",0
  5428 00002769 637800                  isreg_17 db "cx",0
  5429 0000276C 5F444800                isreg_18 db "_DH",0
  5430 00002770 646800                  isreg_19 db "dh",0
  5431 00002773 5F444C00                isreg_20 db "_DL",0
  5432 00002777 646C00                  isreg_21 db "dl",0
  5433 0000277A 5F445800                isreg_22 db "_DX",0
  5434 0000277E 647800                  isreg_23 db "dx",0
  5435 00002781 5F534900                isreg_24 db "_SI",0
  5436 00002785 736900                  isreg_25 db "si",0
  5437 00002788 5F444900                isreg_26 db "_DI",0
  5438 0000278C 646900                  isreg_27 db "di",0
  5439 0000278F 5F464C41475300          isreg_28 db "_FLAGS",0
  5440 00002796 666C61677300            isreg_29 db "flags",0
  5441                                  
  5442                                  doreg:  ; *** PROC ***
  5443                                  ;Function : doreg, Number of local variables: 2
  5444                                  ;   # type sign width addr used name   list of local variables
  5445                                  ;  200 ptr sign byte   521 NULL dr = bp+4
  5446                                  ;  201 var sign word   521 NULL i = bp-2;
  5447 0000279C C8020000                 ENTER  2,0
  5448 000027A0 6A3D                     push 61
  5449 000027A2 E8BF1F                   call expect
  5450 000027A5 83C402                   add  sp, 2
  5451                                  
  5452                                  ;-522   prs("\n mov  "); prs(dr); prs(", ");
  5453                                  
  5454 000027A8 68[0B28]                 push doreg_0
  5455 000027AB E8C920                   call prs
  5456 000027AE 83C402                   add  sp, 2
  5457 000027B1 FF7604                   push word [bp+4]
  5458 000027B4 E8C020                   call prs
  5459 000027B7 83C402                   add  sp, 2
  5460 000027BA 68[1428]                 push doreg_1
  5461 000027BD E8B720                   call prs
  5462 000027C0 83C402                   add  sp, 2
  5463                                  
  5464                                  ;-523        if (istoken(T_CONST)) prunsign1(lexval);
  5465                                  
  5466 000027C3 680101                   push 257
  5467 000027C6 E8791F                   call istoken
  5468 000027C9 83C402                   add  sp, 2
  5469 000027CC 08C0                     or  al, al
  5470 000027CE 0F840D00                 je @@doreg289
  5471 000027D2 FF36[3600]               push word [lexval]
  5472 000027D6 E8F821                   call prunsign1
  5473 000027D9 83C402                   add  sp, 2
  5474                                  
  5475                                  ;-524   else if (istoken(T_NAME )) { i=searchname(); v(i); }
  5476                                  
  5477 000027DC E92A00                   jmp @@doreg290
  5478                                  @@doreg289:
  5479 000027DF 680001                   push 256
  5480 000027E2 E85D1F                   call istoken
  5481 000027E5 83C402                   add  sp, 2
  5482 000027E8 08C0                     or  al, al
  5483 000027EA 0F841200                 je @@doreg291
  5484 000027EE E834E2                   call searchname
  5485 000027F1 8946FE                   mov [bp-2], ax
  5486 000027F4 FF76FE                   push word [bp-2]
  5487 000027F7 E83FDC                   call v
  5488 000027FA 83C402                   add  sp, 2
  5489                                  
  5490                                  ;-525   else error1("only number or var allowed"); }
  5491                                  
  5492 000027FD E90900                   jmp @@doreg292
  5493                                  @@doreg291:
  5494 00002800 68[1728]                 push doreg_2
  5495 00002803 E85A23                   call error1
  5496 00002806 83C402                   add  sp, 2
  5497                                  @@doreg292:
  5498                                  @@doreg290:
  5499                                  
  5500                                  ;-526 
  5501                                  
  5502                                  
  5503                                  ;-527 int doassign(int mode, int i, int ixarr, int ixconst) {
  5504 00002809 C9                       LEAVE
  5505 0000280A C3                       ret
  5506                                  ; ENDP
  5507 0000280B 5C6E206D6F76202000      doreg_0 db "\n mov  ",0
  5508 00002814 2C2000                  doreg_1 db ", ",0
  5509 00002817 6F6E6C79206E756D62-     doreg_2 db "only number or var allowed",0
  5510 00002820 6572206F7220766172-
  5511 00002829 20616C6C6F77656400 
  5512                                  
  5513                                  doassign:  ; *** PROC ***
  5514                                  
  5515                                  ;-528   gettypes(i);
  5516                                  
  5517                                  ;Function : doassign, Number of local variables: 4
  5518                                  ;   # type sign width addr used name   list of local variables
  5519                                  ;  200 var sign word   527 NULL mode = bp+4
  5520                                  ;  201 var sign word   527 NULL i = bp+6
  5521                                  ;  202 var sign word   527 NULL ixarr = bp+8
  5522                                  ;  203 var sign word   527 NULL ixconst = bp+10;
  5523 00002832 C8000000                 ENTER  0,0
  5524 00002836 FF7606                   push word [bp+6]
  5525 00002839 E8ABE0                   call gettypes
  5526 0000283C 83C402                   add  sp, 2
  5527                                  
  5528                                  ;-529   if (mode==1) {prs("\n mov  bx, ");v(i);                  
  5529                                  
  5530 0000283F 8B4604                   mov ax, [bp+4]
  5531 00002842 83F801                   cmp ax, 1
  5532 00002845 0F853400                 jne @@doassign293
  5533 00002849 68[CF29]                 push doassign_0
  5534 0000284C E82820                   call prs
  5535 0000284F 83C402                   add  sp, 2
  5536 00002852 FF7606                   push word [bp+6]
  5537 00002855 E8E1DB                   call v
  5538 00002858 83C402                   add  sp, 2
  5539                                  
  5540                                  ;-530     if (widthi == 2) prs("\n mov  [bx], ax");
  5541                                  
  5542 0000285B A1[3E00]                 mov ax, [widthi]
  5543 0000285E 83F802                   cmp ax, 2
  5544 00002861 0F850C00                 jne @@doassign294
  5545 00002865 68[DC29]                 push doassign_1
  5546 00002868 E80C20                   call prs
  5547 0000286B 83C402                   add  sp, 2
  5548                                  
  5549                                  ;-531     else  prs("\n mov  [bx], al"); return;}
  5550                                  
  5551 0000286E E90900                   jmp @@doassign295
  5552                                  @@doassign294:
  5553 00002871 68[ED29]                 push doassign_2
  5554 00002874 E80020                   call prs
  5555 00002877 83C402                   add  sp, 2
  5556                                  @@doassign295:
  5557 0000287A E95001                   jmp @@retn
  5558                                  
  5559                                  ;-532   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}
  5560                                  
  5561                                  @@doassign293:
  5562 0000287D 8B4604                   mov ax, [bp+4]
  5563 00002880 83F802                   cmp ax, 2
  5564 00002883 0F851E00                 jne @@doassign296
  5565 00002887 68[FE29]                 push doassign_3
  5566 0000288A E8EA1F                   call prs
  5567 0000288D 83C402                   add  sp, 2
  5568 00002890 FF7606                   push word [bp+6]
  5569 00002893 E894DB                   call a
  5570 00002896 83C402                   add  sp, 2
  5571 00002899 68[072A]                 push doassign_4
  5572 0000289C E8D81F                   call prs
  5573 0000289F 83C402                   add  sp, 2
  5574 000028A2 E92801                   jmp @@retn
  5575                                  
  5576                                  ;-533   if (ixarr) {  prs("\n mov bx, ");
  5577                                  
  5578                                  @@doassign296:
  5579 000028A5 8B4608                   mov ax, [bp+8]
  5580 000028A8 08C0                     or  al, al
  5581 000028AA 0F846E00                 je @@doassign297
  5582 000028AE 68[0C2A]                 push doassign_5
  5583 000028B1 E8C31F                   call prs
  5584 000028B4 83C402                   add  sp, 2
  5585                                  
  5586                                  ;-534     if(ixconst) prunsign1(ixarr); else v(ixarr);
  5587                                  
  5588 000028B7 8B460A                   mov ax, [bp+10]
  5589 000028BA 08C0                     or  al, al
  5590 000028BC 0F840C00                 je @@doassign298
  5591 000028C0 FF7608                   push word [bp+8]
  5592 000028C3 E80B21                   call prunsign1
  5593 000028C6 83C402                   add  sp, 2
  5594 000028C9 E90900                   jmp @@doassign299
  5595                                  @@doassign298:
  5596 000028CC FF7608                   push word [bp+8]
  5597 000028CF E867DB                   call v
  5598 000028D2 83C402                   add  sp, 2
  5599                                  
  5600                                  ;-535     if (wi==2) prs("\n shl bx, 1");
  5601                                  
  5602                                  @@doassign299:
  5603 000028D5 A1[4100]                 mov ax, [wi]
  5604 000028D8 83F802                   cmp ax, 2
  5605 000028DB 0F850900                 jne @@doassign300
  5606 000028DF 68[182A]                 push doassign_6
  5607 000028E2 E8921F                   call prs
  5608 000028E5 83C402                   add  sp, 2
  5609                                  
  5610                                  ;-536     prs("\n mov ["); printName(i);
  5611                                  
  5612                                  @@doassign300:
  5613 000028E8 68[252A]                 push doassign_7
  5614 000028EB E8891F                   call prs
  5615 000028EE 83C402                   add  sp, 2
  5616 000028F1 FF7606                   push word [bp+6]
  5617 000028F4 E8CAE0                   call printName
  5618 000028F7 83C402                   add  sp, 2
  5619                                  
  5620                                  ;-537     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }
  5621                                  
  5622 000028FA A1[4100]                 mov ax, [wi]
  5623 000028FD 83F802                   cmp ax, 2
  5624 00002900 0F850C00                 jne @@doassign301
  5625 00002904 68[2E2A]                 push doassign_8
  5626 00002907 E86D1F                   call prs
  5627 0000290A 83C402                   add  sp, 2
  5628 0000290D E90900                   jmp @@doassign302
  5629                                  @@doassign301:
  5630 00002910 68[372A]                 push doassign_9
  5631 00002913 E8611F                   call prs
  5632 00002916 83C402                   add  sp, 2
  5633                                  @@doassign302:
  5634 00002919 E9B100                   jmp @@retn
  5635                                  
  5636                                  ;-538   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");
  5637                                  
  5638                                  @@doassign297:
  5639 0000291C A1[4100]                 mov ax, [wi]
  5640 0000291F 83F801                   cmp ax, 1
  5641 00002922 0F853100                 jne @@doassign303
  5642 00002926 68[402A]                 push doassign_10
  5643 00002929 E84B1F                   call prs
  5644 0000292C 83C402                   add  sp, 2
  5645 0000292F 8B4606                   mov ax, [bp+6]
  5646 00002932 3DC800                   cmp ax, 200
  5647 00002935 0F8D0900                 jge @@doassign304
  5648 00002939 68[482A]                 push doassign_11
  5649 0000293C E8381F                   call prs
  5650 0000293F 83C402                   add  sp, 2
  5651                                  
  5652                                  ;-539     } v(i); prs(", al"); return; }
  5653                                  
  5654                                  @@doassign304:
  5655 00002942 FF7606                   push word [bp+6]
  5656 00002945 E8F1DA                   call v
  5657 00002948 83C402                   add  sp, 2
  5658 0000294B 68[4E2A]                 push doassign_12
  5659 0000294E E8261F                   call prs
  5660 00002951 83C402                   add  sp, 2
  5661 00002954 E97600                   jmp @@retn
  5662                                  
  5663                                  ;-540   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");
  5664                                  
  5665                                  @@doassign303:
  5666 00002957 A1[4100]                 mov ax, [wi]
  5667 0000295A 83F802                   cmp ax, 2
  5668 0000295D 0F853100                 jne @@doassign305
  5669 00002961 68[532A]                 push doassign_13
  5670 00002964 E8101F                   call prs
  5671 00002967 83C402                   add  sp, 2
  5672 0000296A 8B4606                   mov ax, [bp+6]
  5673 0000296D 3DC800                   cmp ax, 200
  5674 00002970 0F8D0900                 jge @@doassign306
  5675 00002974 68[5B2A]                 push doassign_14
  5676 00002977 E8FD1E                   call prs
  5677 0000297A 83C402                   add  sp, 2
  5678                                  
  5679                                  ;-541     } v(i); prs(", ax"); return; }
  5680                                  
  5681                                  @@doassign306:
  5682 0000297D FF7606                   push word [bp+6]
  5683 00002980 E8B6DA                   call v
  5684 00002983 83C402                   add  sp, 2
  5685 00002986 68[612A]                 push doassign_15
  5686 00002989 E8EB1E                   call prs
  5687 0000298C 83C402                   add  sp, 2
  5688 0000298F E93B00                   jmp @@retn
  5689                                  
  5690                                  ;-542   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");
  5691                                  
  5692                                  @@doassign305:
  5693 00002992 A1[4100]                 mov ax, [wi]
  5694 00002995 83F804                   cmp ax, 4
  5695 00002998 0F853100                 jne @@doassign307
  5696 0000299C 68[662A]                 push doassign_16
  5697 0000299F E8D51E                   call prs
  5698 000029A2 83C402                   add  sp, 2
  5699 000029A5 8B4606                   mov ax, [bp+6]
  5700 000029A8 3DC800                   cmp ax, 200
  5701 000029AB 0F8D0900                 jge @@doassign308
  5702 000029AF 68[6E2A]                 push doassign_17
  5703 000029B2 E8C21E                   call prs
  5704 000029B5 83C402                   add  sp, 2
  5705                                  
  5706                                  ;-543     } v(i); prs(", eax"); return; }
  5707                                  
  5708                                  @@doassign308:
  5709 000029B8 FF7606                   push word [bp+6]
  5710 000029BB E87BDA                   call v
  5711 000029BE 83C402                   add  sp, 2
  5712 000029C1 68[752A]                 push doassign_18
  5713 000029C4 E8B01E                   call prs
  5714 000029C7 83C402                   add  sp, 2
  5715 000029CA E90000                   jmp @@retn
  5716                                  
  5717                                  ;-544 }
  5718                                  
  5719                                  @@doassign307:
  5720                                  
  5721                                  ;-545 int domul(int ids) {
  5722                                  
  5723 000029CD C9                      @@retn: LEAVE
  5724 000029CE C3                       ret
  5725                                  ; ENDP
  5726 000029CF 5C6E206D6F76202062-     doassign_0 db "\n mov  bx, ",0
  5727 000029D8 782C2000           
  5728 000029DC 5C6E206D6F7620205B-     doassign_1 db "\n mov  [bx], ax",0
  5729 000029E5 62785D2C20617800   
  5730 000029ED 5C6E206D6F7620205B-     doassign_2 db "\n mov  [bx], al",0
  5731 000029F6 62785D2C20616C00   
  5732 000029FE 5C6E206D6F76202000      doassign_3 db "\n mov  ",0
  5733 00002A07 2C20617800              doassign_4 db ", ax",0
  5734 00002A0C 5C6E206D6F76206278-     doassign_5 db "\n mov bx, ",0
  5735 00002A15 2C2000             
  5736 00002A18 5C6E2073686C206278-     doassign_6 db "\n shl bx, 1",0
  5737 00002A21 2C203100           
  5738 00002A25 5C6E206D6F76205B00      doassign_7 db "\n mov [",0
  5739 00002A2E 2B62785D2C20617800      doassign_8 db "+bx], ax",0
  5740 00002A37 2B62785D2C20616C00      doassign_9 db "+bx], al",0
  5741 00002A40 5C6E206D6F762000        doassign_10 db "\n mov ",0
  5742 00002A48 627974652000            doassign_11 db "byte ",0
  5743 00002A4E 2C20616C00              doassign_12 db ", al",0
  5744 00002A53 5C6E206D6F762000        doassign_13 db "\n mov ",0
  5745 00002A5B 776F72642000            doassign_14 db "word ",0
  5746 00002A61 2C20617800              doassign_15 db ", ax",0
  5747 00002A66 5C6E206D6F762000        doassign_16 db "\n mov ",0
  5748 00002A6E 64776F72642000          doassign_17 db "dword ",0
  5749 00002A75 2C2065617800            doassign_18 db ", eax",0
  5750                                  
  5751                                  domul:  ; *** PROC ***
  5752                                  
  5753                                  ;-546   if (ids) rterm("imul"); else {
  5754                                  
  5755                                  ;Function : domul, Number of local variables: 1
  5756                                  ;   # type sign width addr used name   list of local variables
  5757                                  ;  200 var sign word   545 NULL ids = bp+4;
  5758 00002A7B C8000000                 ENTER  0,0
  5759 00002A7F 8B4604                   mov ax, [bp+4]
  5760 00002A82 08C0                     or  al, al
  5761 00002A84 0F840C00                 je @@domul309
  5762 00002A88 68[CD2A]                 push domul_0
  5763 00002A8B E899F9                   call rterm
  5764 00002A8E 83C402                   add  sp, 2
  5765 00002A91 E93700                   jmp @@domul310
  5766                                  @@domul309:
  5767                                  
  5768                                  ;-547   if (istoken(T_CONST)) {prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx"); }
  5769                                  
  5770 00002A94 680101                   push 257
  5771 00002A97 E8A81C                   call istoken
  5772 00002A9A 83C402                   add  sp, 2
  5773 00002A9D 08C0                     or  al, al
  5774 00002A9F 0F841F00                 je @@domul311
  5775 00002AA3 68[D22A]                 push domul_1
  5776 00002AA6 E8CE1D                   call prs
  5777 00002AA9 83C402                   add  sp, 2
  5778 00002AAC FF36[3600]               push word [lexval]
  5779 00002AB0 E81E1F                   call prunsign1
  5780 00002AB3 83C402                   add  sp, 2
  5781 00002AB6 68[DE2A]                 push domul_2
  5782 00002AB9 E8BB1D                   call prs
  5783 00002ABC 83C402                   add  sp, 2
  5784                                  
  5785                                  ;-548   else error1("with MUL only const number as multiplicator allowed"); } }
  5786                                  
  5787 00002ABF E90900                   jmp @@domul312
  5788                                  @@domul311:
  5789 00002AC2 68[E82A]                 push domul_3
  5790 00002AC5 E89820                   call error1
  5791 00002AC8 83C402                   add  sp, 2
  5792                                  @@domul312:
  5793                                  @@domul310:
  5794                                  
  5795                                  ;-549 int doidiv(int ids) { int mode; int id1;
  5796 00002ACB C9                       LEAVE
  5797 00002ACC C3                       ret
  5798                                  ; ENDP
  5799 00002ACD 696D756C00              domul_0 db "imul",0
  5800 00002AD2 5C6E206D6F76206278-     domul_1 db "\n mov bx, ",0
  5801 00002ADB 2C2000             
  5802 00002ADE 5C6E206D756C206278-     domul_2 db "\n mul bx",0
  5803 00002AE7 00                 
  5804 00002AE8 77697468204D554C20-     domul_3 db "with MUL only const number as multiplicator allowed",0
  5805 00002AF1 6F6E6C7920636F6E73-
  5806 00002AFA 74206E756D62657220-
  5807 00002B03 6173206D756C746970-
  5808 00002B0C 6C696361746F722061-
  5809 00002B15 6C6C6F77656400     
  5810                                  
  5811                                  doidiv:  ; *** PROC ***
  5812                                  
  5813                                  ;-550   if (istoken(T_CONST)) {
  5814                                  
  5815                                  ;Function : doidiv, Number of local variables: 3
  5816                                  ;   # type sign width addr used name   list of local variables
  5817                                  ;  200 var sign word   549 NULL ids = bp+4
  5818                                  ;  201 var sign word   549 NULL mode = bp-2
  5819                                  ;  202 var sign word   549 NULL id1 = bp-4;
  5820 00002B1C C8040000                 ENTER  4,0
  5821 00002B20 680101                   push 257
  5822 00002B23 E81C1C                   call istoken
  5823 00002B26 83C402                   add  sp, 2
  5824 00002B29 08C0                     or  al, al
  5825 00002B2B 0F843400                 je @@doidiv313
  5826                                  
  5827                                  ;-551     prs("\n mov bx, "); prunsign1(lexval);
  5828                                  
  5829 00002B2F 68[E12B]                 push doidiv_0
  5830 00002B32 E8421D                   call prs
  5831 00002B35 83C402                   add  sp, 2
  5832 00002B38 FF36[3600]               push word [lexval]
  5833 00002B3C E8921E                   call prunsign1
  5834 00002B3F 83C402                   add  sp, 2
  5835                                  
  5836                                  ;-552     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5837                                  
  5838 00002B42 8B4604                   mov ax, [bp+4]
  5839 00002B45 08C0                     or  al, al
  5840 00002B47 0F840C00                 je @@doidiv314
  5841 00002B4B 68[ED2B]                 push doidiv_1
  5842 00002B4E E8261D                   call prs
  5843 00002B51 83C402                   add  sp, 2
  5844 00002B54 E90900                   jmp @@doidiv315
  5845                                  @@doidiv314:
  5846 00002B57 68[FE2B]                 push doidiv_2
  5847 00002B5A E81A1D                   call prs
  5848 00002B5D 83C402                   add  sp, 2
  5849                                  @@doidiv315:
  5850                                  
  5851                                  ;-553   else {
  5852                                  
  5853 00002B60 E97C00                   jmp @@doidiv316
  5854                                  @@doidiv313:
  5855                                  
  5856                                  ;-554     mode=typeName(); id1=searchname();
  5857                                  
  5858 00002B63 E88EDF                   call typeName
  5859 00002B66 8946FE                   mov [bp-2], ax
  5860 00002B69 E8B9DE                   call searchname
  5861 00002B6C 8946FC                   mov [bp-4], ax
  5862                                  
  5863                                  ;-555     if (mode) error1("only const number or int as divisor allowed");
  5864                                  
  5865 00002B6F 8B46FE                   mov ax, [bp-2]
  5866 00002B72 08C0                     or  al, al
  5867 00002B74 0F840900                 je @@doidiv317
  5868 00002B78 68[142C]                 push doidiv_3
  5869 00002B7B E8E21F                   call error1
  5870 00002B7E 83C402                   add  sp, 2
  5871                                  
  5872                                  ;-556     gettypes(id1);
  5873                                  
  5874                                  @@doidiv317:
  5875 00002B81 FF76FC                   push word [bp-4]
  5876 00002B84 E860DD                   call gettypes
  5877 00002B87 83C402                   add  sp, 2
  5878                                  
  5879                                  ;-557     if (typei) error1("only int as simple var divisor allowed");
  5880                                  
  5881 00002B8A A1[3800]                 mov ax, [typei]
  5882 00002B8D 08C0                     or  al, al
  5883 00002B8F 0F840900                 je @@doidiv318
  5884 00002B93 68[402C]                 push doidiv_4
  5885 00002B96 E8C71F                   call error1
  5886 00002B99 83C402                   add  sp, 2
  5887                                  
  5888                                  ;-558     if (wi!=2) error1("only int, no byte as divisor allowed");
  5889                                  
  5890                                  @@doidiv318:
  5891 00002B9C A1[4100]                 mov ax, [wi]
  5892 00002B9F 83F802                   cmp ax, 2
  5893 00002BA2 0F840900                 je  @@doidiv319
  5894 00002BA6 68[672C]                 push doidiv_5
  5895 00002BA9 E8B41F                   call error1
  5896 00002BAC 83C402                   add  sp, 2
  5897                                  
  5898                                  ;-559     prs("\n mov bx, "); v(id1);
  5899                                  
  5900                                  @@doidiv319:
  5901 00002BAF 68[8C2C]                 push doidiv_6
  5902 00002BB2 E8C21C                   call prs
  5903 00002BB5 83C402                   add  sp, 2
  5904 00002BB8 FF76FC                   push word [bp-4]
  5905 00002BBB E87BD8                   call v
  5906 00002BBE 83C402                   add  sp, 2
  5907                                  
  5908                                  ;-560     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5909                                  
  5910 00002BC1 8B4604                   mov ax, [bp+4]
  5911 00002BC4 08C0                     or  al, al
  5912 00002BC6 0F840C00                 je @@doidiv320
  5913 00002BCA 68[982C]                 push doidiv_7
  5914 00002BCD E8A71C                   call prs
  5915 00002BD0 83C402                   add  sp, 2
  5916 00002BD3 E90900                   jmp @@doidiv321
  5917                                  @@doidiv320:
  5918 00002BD6 68[A92C]                 push doidiv_8
  5919 00002BD9 E89B1C                   call prs
  5920 00002BDC 83C402                   add  sp, 2
  5921                                  @@doidiv321:
  5922                                  
  5923                                  ;-561 }
  5924                                  
  5925                                  @@doidiv316:
  5926                                  
  5927                                  ;-562 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
  5928 00002BDF C9                       LEAVE
  5929 00002BE0 C3                       ret
  5930                                  ; ENDP
  5931 00002BE1 5C6E206D6F76206278-     doidiv_0 db "\n mov bx, ",0
  5932 00002BEA 2C2000             
  5933 00002BED 5C6E206377645C6E20-     doidiv_1 db "\n cwd\n idiv bx",0
  5934 00002BF6 6964697620627800   
  5935 00002BFE 5C6E206D6F76206478-     doidiv_2 db "\n mov dx, 0\n div bx",0
  5936 00002C07 2C20305C6E20646976-
  5937 00002C10 20627800           
  5938 00002C14 6F6E6C7920636F6E73-     doidiv_3 db "only const number or int as divisor allowed",0
  5939 00002C1D 74206E756D62657220-
  5940 00002C26 6F7220696E74206173-
  5941 00002C2F 2064697669736F7220-
  5942 00002C38 616C6C6F77656400   
  5943 00002C40 6F6E6C7920696E7420-     doidiv_4 db "only int as simple var divisor allowed",0
  5944 00002C49 61732073696D706C65-
  5945 00002C52 207661722064697669-
  5946 00002C5B 736F7220616C6C6F77-
  5947 00002C64 656400             
  5948 00002C67 6F6E6C7920696E742C-     doidiv_5 db "only int, no byte as divisor allowed",0
  5949 00002C70 206E6F206279746520-
  5950 00002C79 61732064697669736F-
  5951 00002C82 7220616C6C6F776564-
  5952 00002C8B 00                 
  5953 00002C8C 5C6E206D6F76206278-     doidiv_6 db "\n mov bx, ",0
  5954 00002C95 2C2000             
  5955 00002C98 5C6E206377645C6E20-     doidiv_7 db "\n cwd\n idiv bx",0
  5956 00002CA1 6964697620627800   
  5957 00002CA9 5C6E206D6F76206478-     doidiv_8 db "\n mov dx, 0\n div bx",0
  5958 00002CB2 2C20305C6E20646976-
  5959 00002CBB 20627800           
  5960                                  
  5961                                  domod:  ; *** PROC ***
  5962                                  ;Function : domod, Number of local variables: 1
  5963                                  ;   # type sign width addr used name   list of local variables
  5964                                  ;  200 var sign word   562 NULL ids = bp+4;
  5965 00002CBF C8000000                 ENTER  0,0
  5966 00002CC3 FF7604                   push word [bp+4]
  5967 00002CC6 E853FE                   call doidiv
  5968 00002CC9 83C402                   add  sp, 2
  5969 00002CCC 68[D72C]                 push domod_0
  5970 00002CCF E8A51B                   call prs
  5971 00002CD2 83C402                   add  sp, 2
  5972                                  
  5973                                  ;-563 
  5974                                  
  5975                                  
  5976                                  ;-564 int docalltype[10]; int docallvalue[10];
  5977 00002CD5 C9                       LEAVE
  5978 00002CD6 C3                       ret
  5979                                  ; ENDP
  5980 00002CD7 5C6E206D6F76206178-     domod_0 db "\n mov ax, dx",0
  5981 00002CE0 2C20647800         
  5982                                  section .bss
  5983                                  absolute 53411
  5984 0000D0A3 <res 00000014>          docalltype resw 10
  5985                                  section .text
  5986                                  section .bss
  5987                                  absolute 53431
  5988 0000D0B7 <res 00000014>          docallvalue resw 10
  5989                                  section .text
  5990                                  
  5991                                  ;-565 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register
  5992                                  
  5993                                  section .bss
  5994                                  absolute 53451
  5995 0000D0CB <res 00000011>          procname resb 17
  5996                                  section .text
  5997                                  
  5998                                  ;-566 int docall1() {int i; int narg; int t0; int n0;  int sz32;
  5999                                  
  6000                                  
  6001                                  docall1:  ; *** PROC ***
  6002                                  
  6003                                  ;-567   narg=0;  sz32=0;
  6004                                  
  6005                                  ;Function : docall1, Number of local variables: 5
  6006                                  ;   # type sign width addr used name   list of local variables
  6007                                  ;  200 var sign word   566 NULL i = bp-2
  6008                                  ;  201 var sign word   566 NULL narg = bp-4
  6009                                  ;  202 var sign word   566 NULL t0 = bp-6
  6010                                  ;  203 var sign word   566 NULL n0 = bp-8
  6011                                  ;  204 var sign word   566 NULL sz32 = bp-10;
  6012 00002CE5 C80A0000                 ENTER  10,0
  6013 00002CE9 B80000                   mov ax, 0
  6014 00002CEC 8946FC                   mov [bp-4], ax
  6015 00002CEF B80000                   mov ax, 0
  6016 00002CF2 8946F6                   mov [bp-10], ax
  6017                                  
  6018                                  ;-568   checknamelen();
  6019                                  
  6020 00002CF5 E874D7                   call checknamelen
  6021                                  
  6022                                  ;-569   strcpy(&procname, symbol);
  6023                                  
  6024 00002CF8 8D062B81                 lea  ax, [symbol]
  6025 00002CFC 50                       push ax
  6026 00002CFD 8D06CBD0                 lea  ax, [procname]
  6027 00002D01 50                       push ax
  6028 00002D02 E87ED4                   call strcpy
  6029 00002D05 83C404                   add  sp, 4
  6030                                  
  6031                                  ;-570   storecall();
  6032                                  
  6033 00002D08 E8EADE                   call storecall
  6034                                  
  6035                                  ;-571   expect('(');
  6036                                  
  6037 00002D0B 6A28                     push 40
  6038 00002D0D E8541A                   call expect
  6039 00002D10 83C402                   add  sp, 2
  6040                                  
  6041                                  ;-572 	if (istoken(')') ==0 ) {
  6042                                  
  6043 00002D13 6A29                     push 41
  6044 00002D15 E82A1A                   call istoken
  6045 00002D18 83C402                   add  sp, 2
  6046 00002D1B 83F800                   cmp ax, 0
  6047 00002D1E 0F857802                 jne @@docall1322
  6048                                  
  6049                                  ;-573 	  do { narg++;
  6050                                  
  6051                                  @@docall1323:
  6052 00002D22 FF46FC                   inc  word[bp-4]
  6053                                  
  6054                                  ;-574 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;
  6055                                  
  6056 00002D25 8B46FC                   mov ax, [bp-4]
  6057 00002D28 83F809                   cmp ax, 9
  6058 00002D2B 0F8E0900                 jle @@docall1324
  6059 00002D2F 68[DE2F]                 push docall1_0
  6060 00002D32 E82B1E                   call error1
  6061 00002D35 83C402                   add  sp, 2
  6062                                  @@docall1324:
  6063 00002D38 B80000                   mov ax, 0
  6064 00002D3B 8946FA                   mov [bp-6], ax
  6065                                  
  6066                                  ;-575       if(istoken(T_CONST)) {t0=1; n0=lexval; }
  6067                                  
  6068 00002D3E 680101                   push 257
  6069 00002D41 E8FE19                   call istoken
  6070 00002D44 83C402                   add  sp, 2
  6071 00002D47 08C0                     or  al, al
  6072 00002D49 0F840C00                 je @@docall1325
  6073 00002D4D B80100                   mov ax, 1
  6074 00002D50 8946FA                   mov [bp-6], ax
  6075 00002D53 A1[3600]                 mov ax, [lexval]
  6076 00002D56 8946F8                   mov [bp-8], ax
  6077                                  
  6078                                  ;-576       if(istoken(T_STRING)){t0=2; n0=nconst;
  6079                                  
  6080                                  @@docall1325:
  6081 00002D59 680201                   push 258
  6082 00002D5C E8E319                   call istoken
  6083 00002D5F 83C402                   add  sp, 2
  6084 00002D62 08C0                     or  al, al
  6085 00002D64 0F846300                 je @@docall1326
  6086 00002D68 B80200                   mov ax, 2
  6087 00002D6B 8946FA                   mov [bp-6], ax
  6088 00002D6E A1[2A00]                 mov ax, [nconst]
  6089 00002D71 8946F8                   mov [bp-8], ax
  6090                                  
  6091                                  ;-577         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");
  6092                                  
  6093 00002D74 68[F02F]                 push docall1_1
  6094 00002D77 E8681A                   call eprs
  6095 00002D7A 83C402                   add  sp, 2
  6096 00002D7D 8D06AB81                 lea  ax, [fname]
  6097 00002D81 50                       push ax
  6098 00002D82 E85D1A                   call eprs
  6099 00002D85 83C402                   add  sp, 2
  6100 00002D88 6A5F                     push 95
  6101 00002D8A E8421A                   call eprc
  6102 00002D8D 83C402                   add  sp, 2
  6103 00002D90 FF36[2A00]               push word [nconst]
  6104 00002D94 E8741B                   call eprnum
  6105 00002D97 83C402                   add  sp, 2
  6106 00002D9A 68[F32F]                 push docall1_2
  6107 00002D9D E8421A                   call eprs
  6108 00002DA0 83C402                   add  sp, 2
  6109                                  
  6110                                  ;-578         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }
  6111                                  
  6112 00002DA3 6A22                     push 34
  6113 00002DA5 E8271A                   call eprc
  6114 00002DA8 83C402                   add  sp, 2
  6115 00002DAB 8D062B81                 lea  ax, [symbol]
  6116 00002DAF 50                       push ax
  6117 00002DB0 E82F1A                   call eprs
  6118 00002DB3 83C402                   add  sp, 2
  6119 00002DB6 6A22                     push 34
  6120 00002DB8 E8141A                   call eprc
  6121 00002DBB 83C402                   add  sp, 2
  6122 00002DBE 68[F82F]                 push docall1_3
  6123 00002DC1 E81E1A                   call eprs
  6124 00002DC4 83C402                   add  sp, 2
  6125 00002DC7 FF06[2A00]               inc  word[nconst]
  6126                                  
  6127                                  ;-579       if(istoken('&'))     {t0=3; name1(); n0=searchname();}
  6128                                  
  6129                                  @@docall1326:
  6130 00002DCB 6A26                     push 38
  6131 00002DCD E87219                   call istoken
  6132 00002DD0 83C402                   add  sp, 2
  6133 00002DD3 08C0                     or  al, al
  6134 00002DD5 0F840F00                 je @@docall1327
  6135 00002DD9 B80300                   mov ax, 3
  6136 00002DDC 8946FA                   mov [bp-6], ax
  6137 00002DDF E8EBDD                   call name1
  6138 00002DE2 E840DC                   call searchname
  6139 00002DE5 8946F8                   mov [bp-8], ax
  6140                                  
  6141                                  ;-580       if(istoken(T_NAME))  { n0=checkreg();
  6142                                  
  6143                                  @@docall1327:
  6144 00002DE8 680001                   push 256
  6145 00002DEB E85419                   call istoken
  6146 00002DEE 83C402                   add  sp, 2
  6147 00002DF1 08C0                     or  al, al
  6148 00002DF3 0F844800                 je @@docall1328
  6149 00002DF7 E8DFEA                   call checkreg
  6150 00002DFA 8946F8                   mov [bp-8], ax
  6151                                  
  6152                                  ;-581         if (n0) t0=5;
  6153                                  
  6154 00002DFD 8B46F8                   mov ax, [bp-8]
  6155 00002E00 08C0                     or  al, al
  6156 00002E02 0F840900                 je @@docall1329
  6157 00002E06 B80500                   mov ax, 5
  6158 00002E09 8946FA                   mov [bp-6], ax
  6159                                  
  6160                                  ;-582         else {t0=4; n0=searchname();
  6161                                  
  6162 00002E0C E93000                   jmp @@docall1330
  6163                                  @@docall1329:
  6164 00002E0F B80400                   mov ax, 4
  6165 00002E12 8946FA                   mov [bp-6], ax
  6166 00002E15 E80DDC                   call searchname
  6167 00002E18 8946F8                   mov [bp-8], ax
  6168                                  
  6169                                  ;-583           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }
  6170                                  
  6171 00002E1B B8B782                   mov ax, GType
  6172 00002E1E A3[7400]                 mov word [p1], ax
  6173 00002E21 A1[7400]                 mov ax, [p1]
  6174 00002E24 0346F8                   add ax, [bp-8]
  6175 00002E27 A3[7400]                 mov word [p1], ax
  6176 00002E2A 8B1E[7400]               mov bx, [p1]
  6177 00002E2E 8A07                     mov al, [bx]
  6178 00002E30 B400                     mov ah, 0
  6179 00002E32 83F826                   cmp ax, 38
  6180 00002E35 0F850600                 jne @@docall1331
  6181 00002E39 B80300                   mov ax, 3
  6182 00002E3C 8946FA                   mov [bp-6], ax
  6183                                  @@docall1331:
  6184                                  @@docall1330:
  6185                                  
  6186                                  ;-584       if (t0==0) error1("parameter not recognized (no * allowed)");
  6187                                  
  6188                                  @@docall1328:
  6189 00002E3F 8B46FA                   mov ax, [bp-6]
  6190 00002E42 83F800                   cmp ax, 0
  6191 00002E45 0F850900                 jne @@docall1332
  6192 00002E49 68[FB2F]                 push docall1_4
  6193 00002E4C E8111D                   call error1
  6194 00002E4F 83C402                   add  sp, 2
  6195                                  
  6196                                  ;-585       docalltype [narg] = t0;
  6197                                  
  6198                                  @@docall1332:
  6199 00002E52 8B46FA                   mov ax, [bp-6]
  6200 00002E55 8B5EFC                   mov bx, [bp-4]
  6201 00002E58 D1E3                     shl bx, 1
  6202 00002E5A 8987A3D0                 mov [docalltype+bx], ax
  6203                                  
  6204                                  ;-586       docallvalue[narg] = n0;
  6205                                  
  6206 00002E5E 8B46F8                   mov ax, [bp-8]
  6207 00002E61 8B5EFC                   mov bx, [bp-4]
  6208 00002E64 D1E3                     shl bx, 1
  6209 00002E66 8987B7D0                 mov [docallvalue+bx], ax
  6210                                  
  6211                                  ;-587     } while (istoken(','));
  6212                                  
  6213 00002E6A 6A2C                     push 44
  6214 00002E6C E8D318                   call istoken
  6215 00002E6F 83C402                   add  sp, 2
  6216 00002E72 08C0                     or  al, al
  6217 00002E74 0F840300                 je @@docall1333
  6218 00002E78 E9A7FE                   jmp @@docall1323
  6219                                  @@docall1333:
  6220                                  
  6221                                  ;-588     
  6222                                  
  6223                                  
  6224                                  ;-589   	expect(')');  i=narg;
  6225                                  
  6226 00002E7B 6A29                     push 41
  6227 00002E7D E8E418                   call expect
  6228 00002E80 83C402                   add  sp, 2
  6229 00002E83 8B46FC                   mov ax, [bp-4]
  6230 00002E86 8946FE                   mov [bp-2], ax
  6231                                  
  6232                                  ;-590     do {
  6233                                  
  6234                                  @@docall1334:
  6235                                  
  6236                                  ;-591       t0 = docalltype [i];
  6237                                  
  6238 00002E89 8B5EFE                   mov bx, [bp-2]
  6239 00002E8C D1E3                     shl bx, 1
  6240 00002E8E 8B87A3D0                 mov ax, [docalltype + bx]
  6241 00002E92 8946FA                   mov [bp-6], ax
  6242                                  
  6243                                  ;-592       n0 = docallvalue[i];     
  6244                                  
  6245 00002E95 8B5EFE                   mov bx, [bp-2]
  6246 00002E98 D1E3                     shl bx, 1
  6247 00002E9A 8B87B7D0                 mov ax, [docallvalue + bx]
  6248 00002E9E 8946F8                   mov [bp-8], ax
  6249                                  
  6250                                  ;-593       if(t0==1){ prs("\n push "); pint1(n0);}
  6251                                  
  6252 00002EA1 8B46FA                   mov ax, [bp-6]
  6253 00002EA4 83F801                   cmp ax, 1
  6254 00002EA7 0F851200                 jne @@docall1335
  6255 00002EAB 68[2330]                 push docall1_5
  6256 00002EAE E8C619                   call prs
  6257 00002EB1 83C402                   add  sp, 2
  6258 00002EB4 FF76F8                   push word [bp-8]
  6259 00002EB7 E8B41A                   call pint1
  6260 00002EBA 83C402                   add  sp, 2
  6261                                  
  6262                                  ;-594       if(t0==2){ prs("\n push "); 
  6263                                  
  6264                                  @@docall1335:
  6265 00002EBD 8B46FA                   mov ax, [bp-6]
  6266 00002EC0 83F802                   cmp ax, 2
  6267 00002EC3 0F852500                 jne @@docall1336
  6268 00002EC7 68[2C30]                 push docall1_6
  6269 00002ECA E8AA19                   call prs
  6270 00002ECD 83C402                   add  sp, 2
  6271                                  
  6272                                  ;-595         prs(fname);prc(95);pint1(n0);}
  6273                                  
  6274 00002ED0 8D06AB81                 lea  ax, [fname]
  6275 00002ED4 50                       push ax
  6276 00002ED5 E89F19                   call prs
  6277 00002ED8 83C402                   add  sp, 2
  6278 00002EDB 6A5F                     push 95
  6279 00002EDD E83019                   call prc
  6280 00002EE0 83C402                   add  sp, 2
  6281 00002EE3 FF76F8                   push word [bp-8]
  6282 00002EE6 E8851A                   call pint1
  6283 00002EE9 83C402                   add  sp, 2
  6284                                  
  6285                                  ;-596       if(t0==3){ prs("\n lea  ax, ");   v(n0);
  6286                                  
  6287                                  @@docall1336:
  6288 00002EEC 8B46FA                   mov ax, [bp-6]
  6289 00002EEF 83F803                   cmp ax, 3
  6290 00002EF2 0F851B00                 jne @@docall1337
  6291 00002EF6 68[3530]                 push docall1_7
  6292 00002EF9 E87B19                   call prs
  6293 00002EFC 83C402                   add  sp, 2
  6294 00002EFF FF76F8                   push word [bp-8]
  6295 00002F02 E834D5                   call v
  6296 00002F05 83C402                   add  sp, 2
  6297                                  
  6298                                  ;-597         prs("\n push ax");}
  6299                                  
  6300 00002F08 68[4230]                 push docall1_8
  6301 00002F0B E86919                   call prs
  6302 00002F0E 83C402                   add  sp, 2
  6303                                  
  6304                                  ;-598       if(t0==4){ gettypes(n0); 
  6305                                  
  6306                                  @@docall1337:
  6307 00002F11 8B46FA                   mov ax, [bp-6]
  6308 00002F14 83F804                   cmp ax, 4
  6309 00002F17 0F854300                 jne @@docall1338
  6310 00002F1B FF76F8                   push word [bp-8]
  6311 00002F1E E8C6D9                   call gettypes
  6312 00002F21 83C402                   add  sp, 2
  6313                                  
  6314                                  ;-599         if(wi==2) { prs("\n push word "); v(n0);}
  6315                                  
  6316 00002F24 A1[4100]                 mov ax, [wi]
  6317 00002F27 83F802                   cmp ax, 2
  6318 00002F2A 0F851500                 jne @@docall1339
  6319 00002F2E 68[4D30]                 push docall1_9
  6320 00002F31 E84319                   call prs
  6321 00002F34 83C402                   add  sp, 2
  6322 00002F37 FF76F8                   push word [bp-8]
  6323 00002F3A E8FCD4                   call v
  6324 00002F3D 83C402                   add  sp, 2
  6325                                  
  6326                                  ;-600         else { prs("\n mov al, byte ");   v(n0);
  6327                                  
  6328 00002F40 E91B00                   jmp @@docall1340
  6329                                  @@docall1339:
  6330 00002F43 68[5B30]                 push docall1_10
  6331 00002F46 E82E19                   call prs
  6332 00002F49 83C402                   add  sp, 2
  6333 00002F4C FF76F8                   push word [bp-8]
  6334 00002F4F E8E7D4                   call v
  6335 00002F52 83C402                   add  sp, 2
  6336                                  
  6337                                  ;-601         prs("\n mov ah, 0\n push ax"); } }
  6338                                  
  6339 00002F55 68[6C30]                 push docall1_11
  6340 00002F58 E81C19                   call prs
  6341 00002F5B 83C402                   add  sp, 2
  6342                                  @@docall1340:
  6343                                  
  6344                                  ;-602       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }
  6345                                  
  6346                                  @@docall1338:
  6347 00002F5E 8B46FA                   mov ax, [bp-6]
  6348 00002F61 83F805                   cmp ax, 5
  6349 00002F64 0F852200                 jne @@docall1341
  6350 00002F68 68[8330]                 push docall1_12
  6351 00002F6B E80919                   call prs
  6352 00002F6E 83C402                   add  sp, 2
  6353 00002F71 FF76F8                   push word [bp-8]
  6354 00002F74 E870ED                   call printreg
  6355 00002F77 83C402                   add  sp, 2
  6356 00002F7A 8B46F8                   mov ax, [bp-8]
  6357 00002F7D 83F82F                   cmp ax, 47 ;unsigned : 1
  6358 00002F80 0F8C0600                 jl  @@docall1342
  6359 00002F84 8B46F6                   mov ax, [bp-10]
  6360 00002F87 83C002                   add ax, 2
  6361                                  @@docall1342:
  6362                                  
  6363                                  ;-603    i--; } while (i > 0);  }
  6364                                  
  6365                                  @@docall1341:
  6366 00002F8A FF4EFE                   dec  word[bp-2]
  6367 00002F8D 8B46FE                   mov ax, [bp-2]
  6368 00002F90 83F800                   cmp ax, 0
  6369 00002F93 0F8E0300                 jle @@docall1343
  6370 00002F97 E9EFFE                   jmp @@docall1334
  6371                                  @@docall1343:
  6372                                  
  6373                                  ;-604 	 prs("\n call "); prs(&procname);
  6374                                  
  6375                                  @@docall1322:
  6376 00002F9A 68[8C30]                 push docall1_13
  6377 00002F9D E8D718                   call prs
  6378 00002FA0 83C402                   add  sp, 2
  6379 00002FA3 8D06CBD0                 lea  ax, [procname]
  6380 00002FA7 50                       push ax
  6381 00002FA8 E8CC18                   call prs
  6382 00002FAB 83C402                   add  sp, 2
  6383                                  
  6384                                  ;-605 	 if (narg>0) {prs("\n add  sp, ");
  6385                                  
  6386 00002FAE 8B46FC                   mov ax, [bp-4]
  6387 00002FB1 83F800                   cmp ax, 0
  6388 00002FB4 0F8E2400                 jle @@docall1344
  6389 00002FB8 68[9530]                 push docall1_14
  6390 00002FBB E8B918                   call prs
  6391 00002FBE 83C402                   add  sp, 2
  6392                                  
  6393                                  ;-606      narg=narg+narg; narg=narg+sz32; pint1(narg); } }
  6394                                  
  6395 00002FC1 8B46FC                   mov ax, [bp-4]
  6396 00002FC4 0346FC                   add ax, [bp-4]
  6397 00002FC7 8946FC                   mov [bp-4], ax
  6398 00002FCA 8B46FC                   mov ax, [bp-4]
  6399 00002FCD 0346F6                   add ax, [bp-10]
  6400 00002FD0 8946FC                   mov [bp-4], ax
  6401 00002FD3 FF76FC                   push word [bp-4]
  6402 00002FD6 E89519                   call pint1
  6403 00002FD9 83C402                   add  sp, 2
  6404                                  @@docall1344:
  6405                                  
  6406                                  ;-607 /****************************************************************************/
  6407                                  
  6408                                  
  6409                                  ;-608 int main() {
  6410 00002FDC C9                       LEAVE
  6411 00002FDD C3                       ret
  6412                                  ; ENDP
  6413 00002FDE 4D61782E2039207061-     docall1_0 db "Max. 9 parameters",0
  6414 00002FE7 72616D657465727300 
  6415 00002FF0 5C6E00                  docall1_1 db "\n",0
  6416 00002FF3 2064622000              docall1_2 db " db ",0
  6417 00002FF8 2C3000                  docall1_3 db ",0",0
  6418 00002FFB 706172616D65746572-     docall1_4 db "parameter not recognized (no * allowed)",0
  6419 00003004 206E6F74207265636F-
  6420 0000300D 676E697A656420286E-
  6421 00003016 6F202A20616C6C6F77-
  6422 0000301F 65642900           
  6423 00003023 5C6E20707573682000      docall1_5 db "\n push ",0
  6424 0000302C 5C6E20707573682000      docall1_6 db "\n push ",0
  6425 00003035 5C6E206C6561202061-     docall1_7 db "\n lea  ax, ",0
  6426 0000303E 782C2000           
  6427 00003042 5C6E20707573682061-     docall1_8 db "\n push ax",0
  6428 0000304B 7800               
  6429 0000304D 5C6E20707573682077-     docall1_9 db "\n push word ",0
  6430 00003056 6F72642000         
  6431 0000305B 5C6E206D6F7620616C-     docall1_10 db "\n mov al, byte ",0
  6432 00003064 2C20627974652000   
  6433 0000306C 5C6E206D6F76206168-     docall1_11 db "\n mov ah, 0\n push ax",0
  6434 00003075 2C20305C6E20707573-
  6435 0000307E 6820617800         
  6436 00003083 5C6E20707573682000      docall1_12 db "\n push ",0
  6437 0000308C 5C6E2063616C6C2000      docall1_13 db "\n call ",0
  6438 00003095 5C6E20616464202073-     docall1_14 db "\n add  sp, ",0
  6439 0000309E 702C2000           
  6440                                  
  6441                                  main:  ; *** PROC ***
  6442                                  
  6443                                  ;-609   getarg();
  6444                                  
  6445 000030A2 E88D00                   call getarg
  6446                                  
  6447                                  ;-610   setblock(4096);
  6448                                  
  6449 000030A5 680010                   push 4096
  6450 000030A8 E8AA25                   call setblock
  6451 000030AB 83C402                   add  sp, 2
  6452                                  
  6453                                  ;-611   if (DOS_ERR) error1("SetBlock , AX=");
  6454                                  
  6455 000030AE A1[7600]                 mov ax, [DOS_ERR]
  6456 000030B1 08C0                     or  al, al
  6457 000030B3 0F840900                 je @@main345
  6458 000030B7 68[F730]                 push main_0
  6459 000030BA E8A31A                   call error1
  6460 000030BD 83C402                   add  sp, 2
  6461                                  
  6462                                  ;-612   segE=allocmem(4096);
  6463                                  
  6464                                  @@main345:
  6465 000030C0 680010                   push 4096
  6466 000030C3 E8A825                   call allocmem
  6467 000030C6 83C402                   add  sp, 2
  6468 000030C9 A3[6C00]                 mov word [segE], ax
  6469                                  
  6470                                  ;-613   if (DOS_ERR)  error1("alloc memory, AX=");
  6471                                  
  6472 000030CC A1[7600]                 mov ax, [DOS_ERR]
  6473 000030CF 08C0                     or  al, al
  6474 000030D1 0F840900                 je @@main346
  6475 000030D5 68[0631]                 push main_1
  6476 000030D8 E8851A                   call error1
  6477 000030DB 83C402                   add  sp, 2
  6478                                  
  6479                                  ;-614   CNameTop=0;
  6480                                  
  6481                                  @@main346:
  6482 000030DE B80000                   mov ax, 0
  6483 000030E1 A3[6800]                 mov word [CNameTop], ax
  6484                                  
  6485                                  ;-615   getfirstchar();
  6486                                  
  6487 000030E4 E83100                   call getfirstchar
  6488                                  
  6489                                  ;-616   parse();
  6490                                  
  6491 000030E7 E89302                   call parse
  6492                                  
  6493                                  ;-617   callrecursive=0; checkcalls(); epilog();
  6494                                  
  6495 000030EA B80000                   mov ax, 0
  6496 000030ED A3[3000]                 mov word [callrecursive], ax
  6497 000030F0 E82103                   call checkcalls
  6498 000030F3 E84521                   call epilog
  6499                                  
  6500                                  ;-618 }
  6501                                  
  6502                                  
  6503                                  ;-619 int getfirstchar() { fgetsp=&fgetsdest; *fgetsp=0; thechar=fgets1(); }
  6504                                  
  6505 000030F6 C3                       ret
  6506                                  ; ENDP
  6507 000030F7 536574426C6F636B20-     main_0 db "SetBlock , AX=",0
  6508 00003100 2C2041583D00       
  6509 00003106 616C6C6F63206D656D-     main_1 db "alloc memory, AX=",0
  6510 0000310F 6F72792C2041583D00 
  6511                                  
  6512                                  getfirstchar:  ; *** PROC ***
  6513 00003118 B80FD0                   mov ax, fgetsdest
  6514 0000311B A3[6A00]                 mov word [fgetsp], ax
  6515 0000311E B80000                   mov ax, 0
  6516 00003121 8B1E[6A00]               mov  bx, [fgetsp]
  6517 00003125 8807                     mov  [bx], al
  6518 00003127 E84019                   call fgets1
  6519 0000312A A2[2700]                 mov byte [thechar], al
  6520                                  
  6521                                  ;-620 char *arglen=0x80; char *argv=0x82;
  6522                                  
  6523 0000312D C3                       ret
  6524                                  ; ENDP
  6525 0000312E 8000                    arglen dw 128
  6526 00003130 8200                    argv dw 130
  6527                                  
  6528                                  ;-621 int getarg() { int arglen1; int i; char *c;
  6529                                  
  6530                                  
  6531                                  getarg:  ; *** PROC ***
  6532                                  
  6533                                  ;-622   arglen1=*arglen;
  6534                                  
  6535                                  ;Function : getarg, Number of local variables: 3
  6536                                  ;   # type sign width addr used name   list of local variables
  6537                                  ;  200 var sign word   621 NULL arglen1 = bp-2
  6538                                  ;  201 var sign word   621 NULL i = bp-4
  6539                                  ;  202 ptr sign byte   621 NULL c = bp-6;
  6540 00003132 C8060000                 ENTER  6,0
  6541 00003136 8B1E[2E31]               mov bx, [arglen]
  6542 0000313A 8A07                     mov al, [bx]
  6543 0000313C B400                     mov ah, 0
  6544 0000313E 8946FE                   mov [bp-2], ax
  6545                                  
  6546                                  ;-623   if (arglen1) { i=arglen1+129; *i=0; }
  6547                                  
  6548 00003141 8B46FE                   mov ax, [bp-2]
  6549 00003144 08C0                     or  al, al
  6550 00003146 0F841400                 je @@getarg347
  6551 0000314A 8B46FE                   mov ax, [bp-2]
  6552 0000314D 058100                   add ax, 129
  6553 00003150 8946FC                   mov [bp-4], ax
  6554 00003153 B80000                   mov ax, 0
  6555 00003156 8B5EFC                   mov  bx, [bp-4]
  6556 00003159 8907                     mov  [bx], ax
  6557                                  
  6558                                  ;-624   else { cputs(Version1); cputs(" Usage: A.COM in_file[.C]: ");
  6559                                  
  6560 0000315B E93900                   jmp @@getarg348
  6561                                  @@getarg347:
  6562 0000315E 8D06[0300]               lea  ax, [Version1]
  6563 00003162 50                       push ax
  6564 00003163 E836CF                   call cputs
  6565 00003166 83C402                   add  sp, 2
  6566 00003169 68[E032]                 push getarg_0
  6567 0000316C E82DCF                   call cputs
  6568 0000316F 83C402                   add  sp, 2
  6569                                  
  6570                                  ;-625     DOS_NoBytes=readRL(argv, 0, CMDLENMAX); c=DOS_NoBytes+128; *c=0; prnl(); }
  6571                                  
  6572 00003172 6A43                     push 67
  6573 00003174 6A00                     push 0
  6574 00003176 FF36[3031]               push word [argv]
  6575 0000317A E8B4CF                   call readRL
  6576 0000317D 83C406                   add  sp, 6
  6577 00003180 A3[7800]                 mov word [DOS_NoBytes], ax
  6578 00003183 A1[7800]                 mov ax, [DOS_NoBytes]
  6579 00003186 058000                   add ax, 128
  6580 00003189 8946FA                   mov [bp-6], ax
  6581 0000318C B80000                   mov ax, 0
  6582 0000318F 8B5EFA                   mov  bx, [bp-6]
  6583 00003192 8807                     mov  [bx], al
  6584 00003194 E8D216                   call prnl
  6585                                  
  6586                                  ;-626   strcpy(namein, argv);
  6587                                  
  6588                                  @@getarg348:
  6589 00003197 FF36[3031]               push word [argv]
  6590 0000319B 8D06EE81                 lea  ax, [namein]
  6591 0000319F 50                       push ax
  6592 000031A0 E8E0CF                   call strcpy
  6593 000031A3 83C404                   add  sp, 4
  6594                                  
  6595                                  ;-627   if (instr2(namein, '.') == 0) strcat1(namein, ".C");
  6596                                  
  6597 000031A6 6A2E                     push 46
  6598 000031A8 8D06EE81                 lea  ax, [namein]
  6599 000031AC 50                       push ax
  6600 000031AD E881D0                   call instr2
  6601 000031B0 83C404                   add  sp, 4
  6602 000031B3 83F800                   cmp ax, 0
  6603 000031B6 0F850E00                 jne @@getarg349
  6604 000031BA 68[FC32]                 push getarg_1
  6605 000031BD 8D06EE81                 lea  ax, [namein]
  6606 000031C1 50                       push ax
  6607 000031C2 E89ED0                   call strcat1
  6608 000031C5 83C404                   add  sp, 4
  6609                                  
  6610                                  ;-628   toupper(namein);
  6611                                  
  6612                                  @@getarg349:
  6613 000031C8 8D06EE81                 lea  ax, [namein]
  6614 000031CC 50                       push ax
  6615 000031CD E8B8D0                   call toupper
  6616 000031D0 83C402                   add  sp, 2
  6617                                  
  6618                                  ;-629   strcpy(namelst, namein); i=strlen(namelst); i--; c=&namelst+i; *c='S';
  6619                                  
  6620 000031D3 8D06EE81                 lea  ax, [namein]
  6621 000031D7 50                       push ax
  6622 000031D8 8D063182                 lea  ax, [namelst]
  6623 000031DC 50                       push ax
  6624 000031DD E8A3CF                   call strcpy
  6625 000031E0 83C404                   add  sp, 4
  6626 000031E3 8D063182                 lea  ax, [namelst]
  6627 000031E7 50                       push ax
  6628 000031E8 E870CF                   call strlen
  6629 000031EB 83C402                   add  sp, 2
  6630 000031EE 8946FC                   mov [bp-4], ax
  6631 000031F1 FF4EFC                   dec  word[bp-4]
  6632 000031F4 B83182                   mov ax, namelst
  6633 000031F7 0346FC                   add ax, [bp-4]
  6634 000031FA 8946FA                   mov [bp-6], ax
  6635 000031FD B85300                   mov ax, 83
  6636 00003200 8B5EFA                   mov  bx, [bp-6]
  6637 00003203 8807                     mov  [bx], al
  6638                                  
  6639                                  ;-630  
  6640                                  
  6641                                  
  6642                                  ;-631   fdin=openR (namein);
  6643                                  
  6644 00003205 8D06EE81                 lea  ax, [namein]
  6645 00003209 50                       push ax
  6646 0000320A E8D1CE                   call openR
  6647 0000320D 83C402                   add  sp, 2
  6648 00003210 A3[1E00]                 mov word [fdin], ax
  6649                                  
  6650                                  ;-632   if(DOS_ERR){cputs("Source file missing (.C): "); cputs(namein); exitR(1); }
  6651                                  
  6652 00003213 A1[7600]                 mov ax, [DOS_ERR]
  6653 00003216 08C0                     or  al, al
  6654 00003218 0F841C00                 je @@getarg350
  6655 0000321C 68[FF32]                 push getarg_2
  6656 0000321F E87ACE                   call cputs
  6657 00003222 83C402                   add  sp, 2
  6658 00003225 8D06EE81                 lea  ax, [namein]
  6659 00003229 50                       push ax
  6660 0000322A E86FCE                   call cputs
  6661 0000322D 83C402                   add  sp, 2
  6662 00003230 6A01                     push 1
  6663 00003232 E8D9CE                   call exitR
  6664 00003235 83C402                   add  sp, 2
  6665                                  
  6666                                  ;-633   fdout=creatR(namelst);
  6667                                  
  6668                                  @@getarg350:
  6669 00003238 8D063182                 lea  ax, [namelst]
  6670 0000323C 50                       push ax
  6671 0000323D E8ADCE                   call creatR
  6672 00003240 83C402                   add  sp, 2
  6673 00003243 A3[2000]                 mov word [fdout], ax
  6674                                  
  6675                                  ;-634   if(DOS_ERR){cputs("list file not creatable: ");cputs(namelst);exitR(2);}
  6676                                  
  6677 00003246 A1[7600]                 mov ax, [DOS_ERR]
  6678 00003249 08C0                     or  al, al
  6679 0000324B 0F841C00                 je @@getarg351
  6680 0000324F 68[1A33]                 push getarg_3
  6681 00003252 E847CE                   call cputs
  6682 00003255 83C402                   add  sp, 2
  6683 00003258 8D063182                 lea  ax, [namelst]
  6684 0000325C 50                       push ax
  6685 0000325D E83CCE                   call cputs
  6686 00003260 83C402                   add  sp, 2
  6687 00003263 6A02                     push 2
  6688 00003265 E8A6CE                   call exitR
  6689 00003268 83C402                   add  sp, 2
  6690                                  
  6691                                  ;-635   prs("\n; ");prs(Version1);
  6692                                  
  6693                                  @@getarg351:
  6694 0000326B 68[3433]                 push getarg_4
  6695 0000326E E80616                   call prs
  6696 00003271 83C402                   add  sp, 2
  6697 00003274 8D06[0300]               lea  ax, [Version1]
  6698 00003278 50                       push ax
  6699 00003279 E8FB15                   call prs
  6700 0000327C 83C402                   add  sp, 2
  6701                                  
  6702                                  ;-636   prs(", Arglen: "); pint1(arglen1); if(arglen1){prs(", Argv: "); prs(argv);}
  6703                                  
  6704 0000327F 68[3933]                 push getarg_5
  6705 00003282 E8F215                   call prs
  6706 00003285 83C402                   add  sp, 2
  6707 00003288 FF76FE                   push word [bp-2]
  6708 0000328B E8E016                   call pint1
  6709 0000328E 83C402                   add  sp, 2
  6710 00003291 8B46FE                   mov ax, [bp-2]
  6711 00003294 08C0                     or  al, al
  6712 00003296 0F841300                 je @@getarg352
  6713 0000329A 68[4433]                 push getarg_6
  6714 0000329D E8D715                   call prs
  6715 000032A0 83C402                   add  sp, 2
  6716 000032A3 FF36[3031]               push word [argv]
  6717 000032A7 E8CD15                   call prs
  6718 000032AA 83C402                   add  sp, 2
  6719                                  
  6720                                  ;-637   prs(", Source: "); prs(namein);  prs(", Output asm: "); prs(namelst);
  6721                                  
  6722                                  @@getarg352:
  6723 000032AD 68[4D33]                 push getarg_7
  6724 000032B0 E8C415                   call prs
  6725 000032B3 83C402                   add  sp, 2
  6726 000032B6 8D06EE81                 lea  ax, [namein]
  6727 000032BA 50                       push ax
  6728 000032BB E8B915                   call prs
  6729 000032BE 83C402                   add  sp, 2
  6730 000032C1 68[5833]                 push getarg_8
  6731 000032C4 E8B015                   call prs
  6732 000032C7 83C402                   add  sp, 2
  6733 000032CA 8D063182                 lea  ax, [namelst]
  6734 000032CE 50                       push ax
  6735 000032CF E8A515                   call prs
  6736 000032D2 83C402                   add  sp, 2
  6737                                  
  6738                                  ;-638   prs("\norg  256 \njmp main"); 
  6739                                  
  6740 000032D5 68[6733]                 push getarg_9
  6741 000032D8 E89C15                   call prs
  6742 000032DB 83C402                   add  sp, 2
  6743                                  
  6744                                  ;-639 }
  6745                                  
  6746                                  
  6747                                  ;-640 int parse() { token=getlex(); do {
  6748 000032DE C9                       LEAVE
  6749 000032DF C3                       ret
  6750                                  ; ENDP
  6751 000032E0 2055736167653A2041-     getarg_0 db " Usage: A.COM in_file[.C]: ",0
  6752 000032E9 2E434F4D20696E5F66-
  6753 000032F2 696C655B2E435D3A20-
  6754 000032FB 00                 
  6755 000032FC 2E4300                  getarg_1 db ".C",0
  6756 000032FF 536F75726365206669-     getarg_2 db "Source file missing (.C): ",0
  6757 00003308 6C65206D697373696E-
  6758 00003311 6720282E43293A2000 
  6759 0000331A 6C6973742066696C65-     getarg_3 db "list file not creatable: ",0
  6760 00003323 206E6F742063726561-
  6761 0000332C 7461626C653A2000   
  6762 00003334 5C6E3B2000              getarg_4 db "\n; ",0
  6763 00003339 2C204172676C656E3A-     getarg_5 db ", Arglen: ",0
  6764 00003342 2000               
  6765 00003344 2C20417267763A2000      getarg_6 db ", Argv: ",0
  6766 0000334D 2C20536F757263653A-     getarg_7 db ", Source: ",0
  6767 00003356 2000               
  6768 00003358 2C204F757470757420-     getarg_8 db ", Output asm: ",0
  6769 00003361 61736D3A2000       
  6770 00003367 5C6E6F726720203235-     getarg_9 db "\norg  256 \njmp main",0
  6771 00003370 36205C6E6A6D70206D-
  6772 00003379 61696E00           
  6773                                  
  6774                                  parse:  ; *** PROC ***
  6775 0000337D E89E0C                   call getlex
  6776 00003380 A3[2200]                 mov word [token], ax
  6777                                  @@parse353:
  6778                                  
  6779                                  ;-641     if (token <= 0) return 1;
  6780                                  
  6781 00003383 A1[2200]                 mov ax, [token]
  6782 00003386 83F800                   cmp ax, 0
  6783 00003389 0F8F0600                 jg  @@parse354
  6784 0000338D B80100                   mov ax, 1
  6785 00003390 E96500                   jmp @@retn
  6786                                  
  6787                                  ;-642     if (istoken('#')) {
  6788                                  
  6789                                  @@parse354:
  6790 00003393 6A23                     push 35
  6791 00003395 E8AA13                   call istoken
  6792 00003398 83C402                   add  sp, 2
  6793 0000339B 08C0                     or  al, al
  6794 0000339D 0F843600                 je @@parse355
  6795                                  
  6796                                  ;-643       if (istoken(T_DEFINE)) dodefine();
  6797                                  
  6798 000033A1 68FF01                   push 511
  6799 000033A4 E89B13                   call istoken
  6800 000033A7 83C402                   add  sp, 2
  6801 000033AA 08C0                     or  al, al
  6802 000033AC 0F840600                 je @@parse356
  6803 000033B0 E83D05                   call dodefine
  6804                                  
  6805                                  ;-644       else if (istoken(T_INCLUDE)) doinclude();
  6806                                  
  6807 000033B3 E91E00                   jmp @@parse357
  6808                                  @@parse356:
  6809 000033B6 68FE01                   push 510
  6810 000033B9 E88613                   call istoken
  6811 000033BC 83C402                   add  sp, 2
  6812 000033BF 08C0                     or  al, al
  6813 000033C1 0F840600                 je @@parse358
  6814 000033C5 E84204                   call doinclude
  6815                                  
  6816                                  ;-645       else error1("define or include expected");  }
  6817                                  
  6818 000033C8 E90900                   jmp @@parse359
  6819                                  @@parse358:
  6820 000033CB 68[F933]                 push parse_0
  6821 000033CE E88F17                   call error1
  6822 000033D1 83C402                   add  sp, 2
  6823                                  @@parse359:
  6824                                  @@parse357:
  6825                                  
  6826                                  ;-646     else{ typeName();  if (token=='(') dofunc();  else doglob(); }
  6827                                  
  6828 000033D4 E91600                   jmp @@parse360
  6829                                  @@parse355:
  6830 000033D7 E81AD7                   call typeName
  6831 000033DA A1[2200]                 mov ax, [token]
  6832 000033DD 83F828                   cmp ax, 40
  6833 000033E0 0F850600                 jne @@parse361
  6834 000033E4 E821DA                   call dofunc
  6835 000033E7 E90300                   jmp @@parse362
  6836                                  @@parse361:
  6837 000033EA E8CBD0                   call doglob
  6838                                  @@parse362:
  6839                                  
  6840                                  ;-647   } while(1);
  6841                                  
  6842                                  @@parse360:
  6843 000033ED B80100                   mov ax, 1
  6844 000033F0 08C0                     or  al, al
  6845 000033F2 0F840200                 je @@parse363
  6846 000033F6 EB8B                     jmp @@parse353
  6847                                  @@parse363:
  6848                                  
  6849                                  ;-648 }
  6850                                  
  6851                                  
  6852                                  ;-649 int checkcalls() { int i; int j; int k;
  6853                                  
  6854                                  @@retn:
  6855 000033F8 C3                       ret
  6856                                  ; ENDP
  6857 000033F9 646566696E65206F72-     parse_0 db "define or include expected",0
  6858 00003402 20696E636C75646520-
  6859 0000340B 657870656374656400 
  6860                                  
  6861                                  checkcalls:  ; *** PROC ***
  6862                                  
  6863                                  ;-650   prs("\n \n; missing functions: ");
  6864                                  
  6865                                  ;Function : checkcalls, Number of local variables: 3
  6866                                  ;   # type sign width addr used name   list of local variables
  6867                                  ;  200 var sign word   649 NULL i = bp-2
  6868                                  ;  201 var sign word   649 NULL j = bp-4
  6869                                  ;  202 var sign word   649 NULL k = bp-6;
  6870 00003414 C8060000                 ENTER  6,0
  6871 00003418 68[F134]                 push checkcalls_0
  6872 0000341B E85914                   call prs
  6873 0000341E 83C402                   add  sp, 2
  6874                                  
  6875                                  ;-651   i=0;  k=0;
  6876                                  
  6877 00003421 B80000                   mov ax, 0
  6878 00003424 8946FE                   mov [bp-2], ax
  6879 00003427 B80000                   mov ax, 0
  6880 0000342A 8946FA                   mov [bp-6], ax
  6881                                  
  6882                                  ;-652   while (i < CTop) {
  6883                                  
  6884                                  @@checkcalls364:
  6885 0000342D 8B46FE                   mov ax, [bp-2]
  6886 00003430 3B06[4500]               cmp ax, [CTop]
  6887 00003434 0F8D8F00                 jge @@checkcalls365
  6888                                  
  6889                                  ;-653     pt=CAdr[i];
  6890                                  
  6891 00003438 8B5EFE                   mov bx, [bp-2]
  6892 0000343B D1E3                     shl bx, 1
  6893 0000343D 8B8757AB                 mov ax, [CAdr + bx]
  6894 00003441 A3[7200]                 mov word [pt], ax
  6895                                  
  6896                                  ;-654     from_far(NameA, pt);
  6897                                  
  6898 00003444 FF36[7200]               push word [pt]
  6899 00003448 8D06[4700]               lea  ax, [NameA]
  6900 0000344C 50                       push ax
  6901 0000344D E88522                   call from_far
  6902 00003450 83C404                   add  sp, 4
  6903                                  
  6904                                  ;-655     j=0;
  6905                                  
  6906 00003453 B80000                   mov ax, 0
  6907 00003456 8946FC                   mov [bp-4], ax
  6908                                  
  6909                                  ;-656     do { p1=adrF(FNameField, j);
  6910                                  
  6911                                  @@checkcalls366:
  6912 00003459 FF76FC                   push word [bp-4]
  6913 0000345C 8D064FBD                 lea  ax, [FNameField]
  6914 00003460 50                       push ax
  6915 00003461 E84ED5                   call adrF
  6916 00003464 83C404                   add  sp, 4
  6917 00003467 A3[7400]                 mov word [p1], ax
  6918                                  
  6919                                  ;-657       if (eqstr(NameA, p1)){ CType[i]=1; j=FTop; }
  6920                                  
  6921 0000346A FF36[7400]               push word [p1]
  6922 0000346E 8D06[4700]               lea  ax, [NameA]
  6923 00003472 50                       push ax
  6924 00003473 E83DCD                   call eqstr
  6925 00003476 83C404                   add  sp, 4
  6926 00003479 08C0                     or  al, al
  6927 0000347B 0F841000                 je @@checkcalls367
  6928 0000347F B80100                   mov ax, 1
  6929 00003482 8B5EFE                   mov bx, [bp-2]
  6930 00003485 88872FA1                 mov [CType+bx], al
  6931 00003489 A1[4300]                 mov ax, [FTop]
  6932 0000348C 8946FC                   mov [bp-4], ax
  6933                                  
  6934                                  ;-658       j++; } while (j < FTop);
  6935                                  
  6936                                  @@checkcalls367:
  6937 0000348F FF46FC                   inc  word[bp-4]
  6938 00003492 8B46FC                   mov ax, [bp-4]
  6939 00003495 3B06[4300]               cmp ax, [FTop]
  6940 00003499 0F8D0200                 jge @@checkcalls368
  6941 0000349D EBBA                     jmp @@checkcalls366
  6942                                  @@checkcalls368:
  6943                                  
  6944                                  ;-659     if (j == FTop) { k++; prs("\n; "); prs(NameA); }
  6945                                  
  6946 0000349F 8B46FC                   mov ax, [bp-4]
  6947 000034A2 3B06[4300]               cmp ax, [FTop]
  6948 000034A6 0F851700                 jne @@checkcalls369
  6949 000034AA FF46FA                   inc  word[bp-6]
  6950 000034AD 68[0C35]                 push checkcalls_1
  6951 000034B0 E8C413                   call prs
  6952 000034B3 83C402                   add  sp, 2
  6953 000034B6 8D06[4700]               lea  ax, [NameA]
  6954 000034BA 50                       push ax
  6955 000034BB E8B913                   call prs
  6956 000034BE 83C402                   add  sp, 2
  6957                                  
  6958                                  ;-660     i++; }
  6959                                  
  6960                                  @@checkcalls369:
  6961 000034C1 FF46FE                   inc  word[bp-2]
  6962                                  
  6963                                  ;-661   if (k!=0) doar(k); else {prs(" All FUNCTIONs in place");
  6964                                  
  6965 000034C4 E966FF                   jmp @@checkcalls364
  6966                                  @@checkcalls365:
  6967 000034C7 8B46FA                   mov ax, [bp-6]
  6968 000034CA 83F800                   cmp ax, 0
  6969 000034CD 0F840C00                 je  @@checkcalls370
  6970 000034D1 FF76FA                   push word [bp-6]
  6971 000034D4 E86400                   call doar
  6972 000034D7 83C402                   add  sp, 2
  6973 000034DA E91200                   jmp @@checkcalls371
  6974                                  @@checkcalls370:
  6975 000034DD 68[1135]                 push checkcalls_2
  6976 000034E0 E89413                   call prs
  6977 000034E3 83C402                   add  sp, 2
  6978                                  
  6979                                  ;-662     cputs("  All CALLs OK! "); }
  6980                                  
  6981 000034E6 68[2935]                 push checkcalls_3
  6982 000034E9 E8B0CB                   call cputs
  6983 000034EC 83C402                   add  sp, 2
  6984                                  
  6985                                  ;-663 }
  6986                                  
  6987                                  @@checkcalls371:
  6988                                  
  6989                                  ;-664 char wasfunction;
  6990 000034EF C9                       LEAVE
  6991 000034F0 C3                       ret
  6992                                  ; ENDP
  6993 000034F1 5C6E205C6E3B206D69-     checkcalls_0 db "\n \n; missing functions: ",0
  6994 000034FA 7373696E672066756E-
  6995 00003503 6374696F6E733A2000 
  6996 0000350C 5C6E3B2000              checkcalls_1 db "\n; ",0
  6997 00003511 20416C6C2046554E43-     checkcalls_2 db " All FUNCTIONs in place",0
  6998 0000351A 54494F4E7320696E20-
  6999 00003523 706C61636500       
  7000 00003529 2020416C6C2043414C-     checkcalls_3 db "  All CALLs OK! ",0
  7001 00003532 4C73204F4B212000   
  7002 0000353A 00                      wasfunction db 0
  7003                                  
  7004                                  ;-665 int doar(int k) { int i; int fdtemp; int fdout1; int used; int found;
  7005                                  
  7006                                  
  7007                                  doar:  ; *** PROC ***
  7008                                  
  7009                                  ;-666   cputs("  Open CALLs :"); pint(k);
  7010                                  
  7011                                  ;Function : doar, Number of local variables: 6
  7012                                  ;   # type sign width addr used name   list of local variables
  7013                                  ;  200 var sign word   665 NULL k = bp+4
  7014                                  ;  201 var sign word   665 NULL i = bp-2
  7015                                  ;  202 var sign word   665 NULL fdtemp = bp-4
  7016                                  ;  203 var sign word   665 NULL fdout1 = bp-6
  7017                                  ;  204 var sign word   665 NULL used = bp-8
  7018                                  ;  205 var sign word   665 NULL found = bp-10;
  7019 0000353B C80A0000                 ENTER  10,0
  7020 0000353F 68[C536]                 push doar_0
  7021 00003542 E857CB                   call cputs
  7022 00003545 83C402                   add  sp, 2
  7023 00003548 FF7604                   push word [bp+4]
  7024 0000354B E87DCD                   call pint
  7025 0000354E 83C402                   add  sp, 2
  7026                                  
  7027                                  ;-667   prs("\n; Number of unresolved CALLs :"); printint51(k);
  7028                                  
  7029 00003551 68[D436]                 push doar_1
  7030 00003554 E82013                   call prs
  7031 00003557 83C402                   add  sp, 2
  7032 0000355A FF7604                   push word [bp+4]
  7033 0000355D E8B314                   call printint51
  7034 00003560 83C402                   add  sp, 2
  7035                                  
  7036                                  ;-668   fdin=openR (archivename);
  7037                                  
  7038 00003563 8D067482                 lea  ax, [archivename]
  7039 00003567 50                       push ax
  7040 00003568 E873CB                   call openR
  7041 0000356B 83C402                   add  sp, 2
  7042 0000356E A3[1E00]                 mov word [fdin], ax
  7043                                  
  7044                                  ;-669   if(DOS_ERR){cputs("Archive file missing: "); cputs(archivename); exitR(3); }
  7045                                  
  7046 00003571 A1[7600]                 mov ax, [DOS_ERR]
  7047 00003574 08C0                     or  al, al
  7048 00003576 0F841C00                 je @@doar372
  7049 0000357A 68[F536]                 push doar_2
  7050 0000357D E81CCB                   call cputs
  7051 00003580 83C402                   add  sp, 2
  7052 00003583 8D067482                 lea  ax, [archivename]
  7053 00003587 50                       push ax
  7054 00003588 E811CB                   call cputs
  7055 0000358B 83C402                   add  sp, 2
  7056 0000358E 6A03                     push 3
  7057 00003590 E87BCB                   call exitR
  7058 00003593 83C402                   add  sp, 2
  7059                                  
  7060                                  ;-670   prs("\n;use archive file: "); prs(archivename);
  7061                                  
  7062                                  @@doar372:
  7063 00003596 68[0C37]                 push doar_3
  7064 00003599 E8DB12                   call prs
  7065 0000359C 83C402                   add  sp, 2
  7066 0000359F 8D067482                 lea  ax, [archivename]
  7067 000035A3 50                       push ax
  7068 000035A4 E8D012                   call prs
  7069 000035A7 83C402                   add  sp, 2
  7070                                  
  7071                                  ;-671   fdtemp=fdout;
  7072                                  
  7073 000035AA A1[2000]                 mov ax, [fdout]
  7074 000035AD 8946FC                   mov [bp-4], ax
  7075                                  
  7076                                  ;-672   wasfunction=0;
  7077                                  
  7078 000035B0 B80000                   mov ax, 0
  7079 000035B3 A2[3A35]                 mov byte [wasfunction], al
  7080                                  
  7081                                  ;-673   getfirstchar();
  7082                                  
  7083 000035B6 E85FFB                   call getfirstchar
  7084                                  
  7085                                  ;-674   do { fdout=0;do {found=getfunctionhead();}while (found==0); fdout=fdtemp;
  7086                                  
  7087                                  @@doar373:
  7088 000035B9 B80000                   mov ax, 0
  7089 000035BC A3[2000]                 mov word [fdout], ax
  7090                                  @@doar374:
  7091 000035BF E8E401                   call getfunctionhead
  7092 000035C2 8946F6                   mov [bp-10], ax
  7093 000035C5 8B46F6                   mov ax, [bp-10]
  7094 000035C8 83F800                   cmp ax, 0
  7095 000035CB 0F850200                 jne @@doar375
  7096 000035CF EBEE                     jmp @@doar374
  7097                                  @@doar375:
  7098 000035D1 8B46FC                   mov ax, [bp-4]
  7099 000035D4 A3[2000]                 mov word [fdout], ax
  7100                                  
  7101                                  ;-675        if (found > 0) {
  7102                                  
  7103 000035D7 8B46F6                   mov ax, [bp-10]
  7104 000035DA 83F800                   cmp ax, 0
  7105 000035DD 0F8E9F00                 jle @@doar376
  7106                                  
  7107                                  ;-676          used=0; i=0;
  7108                                  
  7109 000035E1 B80000                   mov ax, 0
  7110 000035E4 8946F8                   mov [bp-8], ax
  7111 000035E7 B80000                   mov ax, 0
  7112 000035EA 8946FE                   mov [bp-2], ax
  7113                                  
  7114                                  ;-677          while (i < CTop) {
  7115                                  
  7116                                  @@doar377:
  7117 000035ED 8B46FE                   mov ax, [bp-2]
  7118 000035F0 3B06[4500]               cmp ax, [CTop]
  7119 000035F4 0F8D5000                 jge @@doar378
  7120                                  
  7121                                  ;-678            pt=CAdr[i];
  7122                                  
  7123 000035F8 8B5EFE                   mov bx, [bp-2]
  7124 000035FB D1E3                     shl bx, 1
  7125 000035FD 8B8757AB                 mov ax, [CAdr + bx]
  7126 00003601 A3[7200]                 mov word [pt], ax
  7127                                  
  7128                                  ;-679            from_far(NameA, pt);
  7129                                  
  7130 00003604 FF36[7200]               push word [pt]
  7131 00003608 8D06[4700]               lea  ax, [NameA]
  7132 0000360C 50                       push ax
  7133 0000360D E8C520                   call from_far
  7134 00003610 83C404                   add  sp, 4
  7135                                  
  7136                                  ;-680            if (eqstr(symbol, NameA)) {
  7137                                  
  7138 00003613 8D06[4700]               lea  ax, [NameA]
  7139 00003617 50                       push ax
  7140 00003618 8D062B81                 lea  ax, [symbol]
  7141 0000361C 50                       push ax
  7142 0000361D E893CB                   call eqstr
  7143 00003620 83C404                   add  sp, 4
  7144 00003623 08C0                     or  al, al
  7145 00003625 0F841A00                 je @@doar379
  7146                                  
  7147                                  ;-681              if (CType[i] == 0) {CType[i]=1; used++; } }  i++; }
  7148                                  
  7149 00003629 8B5EFE                   mov bx, [bp-2]
  7150 0000362C 8A872FA1                 mov al, [CType + bx]
  7151 00003630 3C00                     cmp al, 0
  7152 00003632 0F850D00                 jne @@doar380
  7153 00003636 B80100                   mov ax, 1
  7154 00003639 8B5EFE                   mov bx, [bp-2]
  7155 0000363C 88872FA1                 mov [CType+bx], al
  7156 00003640 FF46F8                   inc  word[bp-8]
  7157                                  @@doar380:
  7158                                  @@doar379:
  7159 00003643 FF46FE                   inc  word[bp-2]
  7160                                  
  7161                                  ;-682            if (used) {
  7162                                  
  7163 00003646 EBA5                     jmp @@doar377
  7164                                  @@doar378:
  7165 00003648 8B46F8                   mov ax, [bp-8]
  7166 0000364B 08C0                     or  al, al
  7167 0000364D 0F842F00                 je @@doar381
  7168                                  
  7169                                  ;-683               prs("\n;Number of CALLs:"); printint51(used);
  7170                                  
  7171 00003651 68[2237]                 push doar_4
  7172 00003654 E82012                   call prs
  7173 00003657 83C402                   add  sp, 2
  7174 0000365A FF76F8                   push word [bp-8]
  7175 0000365D E8B313                   call printint51
  7176 00003660 83C402                   add  sp, 2
  7177                                  
  7178                                  ;-684               prs(" : "); prs(symbol); dofunc(); wasfunction=1; }
  7179                                  
  7180 00003663 68[3637]                 push doar_5
  7181 00003666 E80E12                   call prs
  7182 00003669 83C402                   add  sp, 2
  7183 0000366C 8D062B81                 lea  ax, [symbol]
  7184 00003670 50                       push ax
  7185 00003671 E80312                   call prs
  7186 00003674 83C402                   add  sp, 2
  7187 00003677 E88ED7                   call dofunc
  7188 0000367A B80100                   mov ax, 1
  7189 0000367D A2[3A35]                 mov byte [wasfunction], al
  7190                                  
  7191                                  ;-685         }
  7192                                  
  7193                                  @@doar381:
  7194                                  
  7195                                  ;-686      } while (token);
  7196                                  
  7197                                  @@doar376:
  7198 00003680 A1[2200]                 mov ax, [token]
  7199 00003683 08C0                     or  al, al
  7200 00003685 0F840300                 je @@doar382
  7201 00003689 E92DFF                   jmp @@doar373
  7202                                  @@doar382:
  7203                                  
  7204                                  ;-687   prs("\n;End of archive file. ");
  7205                                  
  7206 0000368C 68[3A37]                 push doar_6
  7207 0000368F E8E511                   call prs
  7208 00003692 83C402                   add  sp, 2
  7209                                  
  7210                                  ;-688   callrecursive++; if (callrecursive < 5) checkcalls();
  7211                                  
  7212 00003695 FF06[3000]               inc  word[callrecursive]
  7213 00003699 A1[3000]                 mov ax, [callrecursive]
  7214 0000369C 83F805                   cmp ax, 5
  7215 0000369F 0F8D0600                 jge @@doar383
  7216 000036A3 E86EFD                   call checkcalls
  7217                                  
  7218                                  ;-689     else {putch(10); cputs("***ERROR*** function(s) missing! ");
  7219                                  
  7220 000036A6 E91A00                   jmp @@doar384
  7221                                  @@doar383:
  7222 000036A9 6A0A                     push 10
  7223 000036AB E8D5C9                   call putch
  7224 000036AE 83C402                   add  sp, 2
  7225 000036B1 68[5337]                 push doar_7
  7226 000036B4 E8E5C9                   call cputs
  7227 000036B7 83C402                   add  sp, 2
  7228                                  
  7229                                  ;-690     error1("At least 1 function is missing in archive file! "); }
  7230                                  
  7231 000036BA 68[7537]                 push doar_8
  7232 000036BD E8A014                   call error1
  7233 000036C0 83C402                   add  sp, 2
  7234                                  
  7235                                  ;-691 }
  7236                                  
  7237                                  @@doar384:
  7238                                  
  7239                                  ;-692 int getfunctionhead() {
  7240 000036C3 C9                       LEAVE
  7241 000036C4 C3                       ret
  7242                                  ; ENDP
  7243 000036C5 20204F70656E204341-     doar_0 db "  Open CALLs :",0
  7244 000036CE 4C4C73203A00       
  7245 000036D4 5C6E3B204E756D6265-     doar_1 db "\n; Number of unresolved CALLs :",0
  7246 000036DD 72206F6620756E7265-
  7247 000036E6 736F6C766564204341-
  7248 000036EF 4C4C73203A00       
  7249 000036F5 417263686976652066-     doar_2 db "Archive file missing: ",0
  7250 000036FE 696C65206D69737369-
  7251 00003707 6E673A2000         
  7252 0000370C 5C6E3B757365206172-     doar_3 db "\n;use archive file: ",0
  7253 00003715 63686976652066696C-
  7254 0000371E 653A2000           
  7255 00003722 5C6E3B4E756D626572-     doar_4 db "\n;Number of CALLs:",0
  7256 0000372B 206F662043414C4C73-
  7257 00003734 3A00               
  7258 00003736 203A2000                doar_5 db " : ",0
  7259 0000373A 5C6E3B456E64206F66-     doar_6 db "\n;End of archive file. ",0
  7260 00003743 206172636869766520-
  7261 0000374C 66696C652E2000     
  7262 00003753 2A2A2A4552524F522A-     doar_7 db "***ERROR*** function(s) missing! ",0
  7263 0000375C 2A2A2066756E637469-
  7264 00003765 6F6E287329206D6973-
  7265 0000376E 73696E67212000     
  7266 00003775 4174206C6561737420-     doar_8 db "At least 1 function is missing in archive file! ",0
  7267 0000377E 312066756E6374696F-
  7268 00003787 6E206973206D697373-
  7269 00003790 696E6720696E206172-
  7270 00003799 63686976652066696C-
  7271 000037A2 65212000           
  7272                                  
  7273                                  getfunctionhead:  ; *** PROC ***
  7274                                  
  7275                                  ;-693   if (wasfunction) wasfunction=0; else token=getlex();
  7276                                  
  7277 000037A6 A0[3A35]                 mov al, [wasfunction]
  7278 000037A9 08C0                     or  al, al
  7279 000037AB 0F840900                 je @@getfunctionhead385
  7280 000037AF B80000                   mov ax, 0
  7281 000037B2 A2[3A35]                 mov byte [wasfunction], al
  7282 000037B5 E90600                   jmp @@getfunctionhead386
  7283                                  @@getfunctionhead385:
  7284 000037B8 E86308                   call getlex
  7285 000037BB A3[2200]                 mov word [token], ax
  7286                                  
  7287                                  ;-694   if (token == 0) return 0xFFFF;
  7288                                  
  7289                                  @@getfunctionhead386:
  7290 000037BE A1[2200]                 mov ax, [token]
  7291 000037C1 83F800                   cmp ax, 0
  7292 000037C4 0F850600                 jne @@getfunctionhead387
  7293 000037C8 B8FFFF                   mov ax, 65535
  7294 000037CB E93B00                   jmp @@retn
  7295                                  
  7296                                  ;-695   if(istoken(T_INT))  { if (token != T_NAME) return 0;
  7297                                  
  7298                                  @@getfunctionhead387:
  7299 000037CE 680502                   push 517
  7300 000037D1 E86E0F                   call istoken
  7301 000037D4 83C402                   add  sp, 2
  7302 000037D7 08C0                     or  al, al
  7303 000037D9 0F842600                 je @@getfunctionhead388
  7304 000037DD A1[2200]                 mov ax, [token]
  7305 000037E0 3D0001                   cmp ax, 256
  7306 000037E3 0F840600                 je  @@getfunctionhead389
  7307 000037E7 B80000                   mov ax, 0
  7308 000037EA E91C00                   jmp @@retn
  7309                                  
  7310                                  ;-696   token=getlex(); if (token == '(') return 1; }
  7311                                  
  7312                                  @@getfunctionhead389:
  7313 000037ED E82E08                   call getlex
  7314 000037F0 A3[2200]                 mov word [token], ax
  7315 000037F3 A1[2200]                 mov ax, [token]
  7316 000037F6 83F828                   cmp ax, 40
  7317 000037F9 0F850600                 jne @@getfunctionhead390
  7318 000037FD B80100                   mov ax, 1
  7319 00003800 E90600                   jmp @@retn
  7320                                  @@getfunctionhead390:
  7321                                  
  7322                                  ;-697   return 0;
  7323                                  
  7324                                  @@getfunctionhead388:
  7325 00003803 B80000                   mov ax, 0
  7326 00003806 E90000                   jmp @@retn
  7327                                  
  7328                                  ;-698 }
  7329                                  
  7330                                  
  7331                                  ;-699 int doinclude() { int fdtemp;
  7332                                  
  7333                                  @@retn:
  7334 00003809 C3                       ret
  7335                                  ; ENDP
  7336                                  
  7337                                  doinclude:  ; *** PROC ***
  7338                                  
  7339                                  ;-700   if (token==T_STRING) {  fdtemp=fdin;
  7340                                  
  7341                                  ;Function : doinclude, Number of local variables: 1
  7342                                  ;   # type sign width addr used name   list of local variables
  7343                                  ;  200 var sign word   699 NULL fdtemp = bp-2;
  7344 0000380A C8020000                 ENTER  2,0
  7345 0000380E A1[2200]                 mov ax, [token]
  7346 00003811 3D0201                   cmp ax, 258
  7347 00003814 0F858700                 jne @@doinclude391
  7348 00003818 A1[1E00]                 mov ax, [fdin]
  7349 0000381B 8946FE                   mov [bp-2], ax
  7350                                  
  7351                                  ;-701   prs("\n;Use include file: "); prs(symbol);
  7352                                  
  7353 0000381E 68[A138]                 push doinclude_0
  7354 00003821 E85310                   call prs
  7355 00003824 83C402                   add  sp, 2
  7356 00003827 8D062B81                 lea  ax, [symbol]
  7357 0000382B 50                       push ax
  7358 0000382C E84810                   call prs
  7359 0000382F 83C402                   add  sp, 2
  7360                                  
  7361                                  ;-702   fdin=openR(symbol);
  7362                                  
  7363 00003832 8D062B81                 lea  ax, [symbol]
  7364 00003836 50                       push ax
  7365 00003837 E8A4C8                   call openR
  7366 0000383A 83C402                   add  sp, 2
  7367 0000383D A3[1E00]                 mov word [fdin], ax
  7368                                  
  7369                                  ;-703   if (DOS_ERR !=0) {prs("Include file missing: "); prs(symbol);
  7370                                  
  7371 00003840 A1[7600]                 mov ax, [DOS_ERR]
  7372 00003843 83F800                   cmp ax, 0
  7373 00003846 0F841D00                 je  @@doinclude392
  7374 0000384A 68[B738]                 push doinclude_1
  7375 0000384D E82710                   call prs
  7376 00003850 83C402                   add  sp, 2
  7377 00003853 8D062B81                 lea  ax, [symbol]
  7378 00003857 50                       push ax
  7379 00003858 E81C10                   call prs
  7380 0000385B 83C402                   add  sp, 2
  7381                                  
  7382                                  ;-704     error1(" Stop!!"); }
  7383                                  
  7384 0000385E 68[CE38]                 push doinclude_2
  7385 00003861 E8FC12                   call error1
  7386 00003864 83C402                   add  sp, 2
  7387                                  
  7388                                  ;-705   linenoinclude=lineno; lineno=1;
  7389                                  
  7390                                  @@doinclude392:
  7391 00003867 A1[6E00]                 mov ax, [lineno]
  7392 0000386A A3[7000]                 mov word [linenoinclude], ax
  7393 0000386D B80100                   mov ax, 1
  7394 00003870 A3[6E00]                 mov word [lineno], ax
  7395                                  
  7396                                  ;-706   parse(); lineno=linenoinclude;
  7397                                  
  7398 00003873 E807FB                   call parse
  7399 00003876 A1[7000]                 mov ax, [linenoinclude]
  7400 00003879 A3[6E00]                 mov word [lineno], ax
  7401                                  
  7402                                  ;-707   fdin=fdtemp; prs("\n;Back to main program: "); prs(namein);
  7403                                  
  7404 0000387C 8B46FE                   mov ax, [bp-2]
  7405 0000387F A3[1E00]                 mov word [fdin], ax
  7406 00003882 68[D638]                 push doinclude_3
  7407 00003885 E8EF0F                   call prs
  7408 00003888 83C402                   add  sp, 2
  7409 0000388B 8D06EE81                 lea  ax, [namein]
  7410 0000388F 50                       push ax
  7411 00003890 E8E40F                   call prs
  7412 00003893 83C402                   add  sp, 2
  7413                                  
  7414                                  ;-708   getfirstchar(); token=getlex(); }
  7415                                  
  7416 00003896 E87FF8                   call getfirstchar
  7417 00003899 E88207                   call getlex
  7418 0000389C A3[2200]                 mov word [token], ax
  7419                                  
  7420                                  ;-709 }
  7421                                  
  7422                                  @@doinclude391:
  7423                                  
  7424                                  ;-710 int dodefine() { int i; int j; int fdtemp;
  7425 0000389F C9                       LEAVE
  7426 000038A0 C3                       ret
  7427                                  ; ENDP
  7428 000038A1 5C6E3B55736520696E-     doinclude_0 db "\n;Use include file: ",0
  7429 000038AA 636C7564652066696C-
  7430 000038B3 653A2000           
  7431 000038B7 496E636C7564652066-     doinclude_1 db "Include file missing: ",0
  7432 000038C0 696C65206D69737369-
  7433 000038C9 6E673A2000         
  7434 000038CE 2053746F70212100        doinclude_2 db " Stop!!",0
  7435 000038D6 5C6E3B4261636B2074-     doinclude_3 db "\n;Back to main program: ",0
  7436 000038DF 6F206D61696E207072-
  7437 000038E8 6F6772616D3A2000   
  7438                                  
  7439                                  dodefine:  ; *** PROC ***
  7440                                  
  7441                                  ;-711   if (eqstr(symbol, "ORGDATA")) {token=getlex();
  7442                                  
  7443                                  ;Function : dodefine, Number of local variables: 3
  7444                                  ;   # type sign width addr used name   list of local variables
  7445                                  ;  200 var sign word   710 NULL i = bp-2
  7446                                  ;  201 var sign word   710 NULL j = bp-4
  7447                                  ;  202 var sign word   710 NULL fdtemp = bp-6;
  7448 000038F0 C8060000                 ENTER  6,0
  7449 000038F4 68[373A]                 push dodefine_0
  7450 000038F7 8D062B81                 lea  ax, [symbol]
  7451 000038FB 50                       push ax
  7452 000038FC E8B4C8                   call eqstr
  7453 000038FF 83C404                   add  sp, 4
  7454 00003902 08C0                     or  al, al
  7455 00003904 0F841500                 je @@dodefine393
  7456 00003908 E81307                   call getlex
  7457 0000390B A3[2200]                 mov word [token], ax
  7458                                  
  7459                                  ;-712     ORGDATAORIG=lexval; orgData=lexval; return; }
  7460                                  
  7461 0000390E A1[3600]                 mov ax, [lexval]
  7462 00003911 A3[1400]                 mov word [ORGDATAORIG], ax
  7463 00003914 A1[3600]                 mov ax, [lexval]
  7464 00003917 A3[1600]                 mov word [orgData], ax
  7465 0000391A E91801                   jmp @@retn
  7466                                  
  7467                                  ;-713   if (eqstr(symbol, "ARCHIVE")){token=getlex();  if (token==T_STRING) {
  7468                                  
  7469                                  @@dodefine393:
  7470 0000391D 68[3F3A]                 push dodefine_1
  7471 00003920 8D062B81                 lea  ax, [symbol]
  7472 00003924 50                       push ax
  7473 00003925 E88BC8                   call eqstr
  7474 00003928 83C404                   add  sp, 4
  7475 0000392B 08C0                     or  al, al
  7476 0000392D 0F844900                 je @@dodefine394
  7477 00003931 E8EA06                   call getlex
  7478 00003934 A3[2200]                 mov word [token], ax
  7479 00003937 A1[2200]                 mov ax, [token]
  7480 0000393A 3D0201                   cmp ax, 258
  7481 0000393D 0F852700                 jne @@dodefine395
  7482                                  
  7483                                  ;-714     prs("\n;Use archive file: ");
  7484                                  
  7485 00003941 68[473A]                 push dodefine_2
  7486 00003944 E8300F                   call prs
  7487 00003947 83C402                   add  sp, 2
  7488                                  
  7489                                  ;-715     strcpy(archivename, symbol); prs(archivename);
  7490                                  
  7491 0000394A 8D062B81                 lea  ax, [symbol]
  7492 0000394E 50                       push ax
  7493 0000394F 8D067482                 lea  ax, [archivename]
  7494 00003953 50                       push ax
  7495 00003954 E82CC8                   call strcpy
  7496 00003957 83C404                   add  sp, 4
  7497 0000395A 8D067482                 lea  ax, [archivename]
  7498 0000395E 50                       push ax
  7499 0000395F E8150F                   call prs
  7500 00003962 83C402                   add  sp, 2
  7501                                  
  7502                                  ;-716     } else error1("Name of archive file missing"); token=getlex(); return;}
  7503                                  
  7504 00003965 E90900                   jmp @@dodefine396
  7505                                  @@dodefine395:
  7506 00003968 68[5D3A]                 push dodefine_3
  7507 0000396B E8F211                   call error1
  7508 0000396E 83C402                   add  sp, 2
  7509                                  @@dodefine396:
  7510 00003971 E8AA06                   call getlex
  7511 00003974 A3[2200]                 mov word [token], ax
  7512 00003977 E9BB00                   jmp @@retn
  7513                                  
  7514                                  ;-717    expect(T_NAME);
  7515                                  
  7516                                  @@dodefine394:
  7517 0000397A 680001                   push 256
  7518 0000397D E8E40D                   call expect
  7519 00003980 83C402                   add  sp, 2
  7520                                  
  7521                                  ;-718   if (token==T_CONST) { 
  7522                                  
  7523 00003983 A1[2200]                 mov ax, [token]
  7524 00003986 3D0101                   cmp ax, 257
  7525 00003989 0F85A800                 jne @@dodefine397
  7526                                  
  7527                                  ;-719     if (GTop >= LSTART) error1("global table (define) full");
  7528                                  
  7529 0000398D A1[3200]                 mov ax, [GTop]
  7530 00003990 3DC800                   cmp ax, 200 ;unsigned : 1
  7531 00003993 0F8C0900                 jl  @@dodefine398
  7532 00003997 68[7A3A]                 push dodefine_4
  7533 0000399A E8C311                   call error1
  7534 0000399D 83C402                   add  sp, 2
  7535                                  
  7536                                  ;-720     i=strlen(symbol); if (i>15) error1("Define name longer 15 char");
  7537                                  
  7538                                  @@dodefine398:
  7539 000039A0 8D062B81                 lea  ax, [symbol]
  7540 000039A4 50                       push ax
  7541 000039A5 E8B3C7                   call strlen
  7542 000039A8 83C402                   add  sp, 2
  7543 000039AB 8946FE                   mov [bp-2], ax
  7544 000039AE 8B46FE                   mov ax, [bp-2]
  7545 000039B1 83F80F                   cmp ax, 15
  7546 000039B4 0F8E0900                 jle @@dodefine399
  7547 000039B8 68[953A]                 push dodefine_5
  7548 000039BB E8A211                   call error1
  7549 000039BE 83C402                   add  sp, 2
  7550                                  
  7551                                  ;-721     GSign [GTop]='U'; GWidth[GTop]=1; GType [GTop]='#';
  7552                                  
  7553                                  @@dodefine399:
  7554 000039C1 B85500                   mov ax, 85
  7555 000039C4 8B1E[3200]               mov bx, [GTop]
  7556 000039C8 8887E383                 mov [GSign+bx], al
  7557 000039CC B80100                   mov ax, 1
  7558 000039CF 8B1E[3200]               mov bx, [GTop]
  7559 000039D3 88870F85                 mov [GWidth+bx], al
  7560 000039D7 B82300                   mov ax, 35
  7561 000039DA 8B1E[3200]               mov bx, [GTop]
  7562 000039DE 8887B782                 mov [GType+bx], al
  7563                                  
  7564                                  ;-722     GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  7565                                  
  7566 000039E2 A1[6E00]                 mov ax, [lineno]
  7567 000039E5 83E801                   sub ax, 1
  7568 000039E8 8B1E[3200]               mov bx, [GTop]
  7569 000039EC D1E3                     shl bx, 1
  7570 000039EE 89873B86                 mov [GAdr+bx], ax
  7571 000039F2 B80000                   mov ax, 0
  7572 000039F5 8B1E[3200]               mov bx, [GTop]
  7573 000039F9 D1E3                     shl bx, 1
  7574 000039FB 89879388                 mov [GUsed+bx], ax
  7575                                  
  7576                                  ;-723     pt=adrofname(GTop); strcpy(pt, symbol); GData[GTop]=lexval;
  7577                                  
  7578 000039FF FF36[3200]               push word [GTop]
  7579 00003A03 E898CF                   call adrofname
  7580 00003A06 83C402                   add  sp, 2
  7581 00003A09 A3[7200]                 mov word [pt], ax
  7582 00003A0C 8D062B81                 lea  ax, [symbol]
  7583 00003A10 50                       push ax
  7584 00003A11 FF36[7200]               push word [pt]
  7585 00003A15 E86BC7                   call strcpy
  7586 00003A18 83C404                   add  sp, 4
  7587 00003A1B A1[3600]                 mov ax, [lexval]
  7588 00003A1E 8B1E[3200]               mov bx, [GTop]
  7589 00003A22 D1E3                     shl bx, 1
  7590 00003A24 8987EB8A                 mov [GData+bx], ax
  7591                                  
  7592                                  ;-724     expect(T_CONST); GTop++;  } 
  7593                                  
  7594 00003A28 680101                   push 257
  7595 00003A2B E8360D                   call expect
  7596 00003A2E 83C402                   add  sp, 2
  7597 00003A31 FF06[3200]               inc  word[GTop]
  7598                                  
  7599                                  ;-725 }
  7600                                  
  7601                                  @@dodefine397:
  7602                                  
  7603                                  ;-726 int stmt() { int c; char cha;
  7604                                  
  7605 00003A35 C9                      @@retn: LEAVE
  7606 00003A36 C3                       ret
  7607                                  ; ENDP
  7608 00003A37 4F52474441544100        dodefine_0 db "ORGDATA",0
  7609 00003A3F 4152434849564500        dodefine_1 db "ARCHIVE",0
  7610 00003A47 5C6E3B557365206172-     dodefine_2 db "\n;Use archive file: ",0
  7611 00003A50 63686976652066696C-
  7612 00003A59 653A2000           
  7613 00003A5D 4E616D65206F662061-     dodefine_3 db "Name of archive file missing",0
  7614 00003A66 726368697665206669-
  7615 00003A6F 6C65206D697373696E-
  7616 00003A78 6700               
  7617 00003A7A 676C6F62616C207461-     dodefine_4 db "global table (define) full",0
  7618 00003A83 626C65202864656669-
  7619 00003A8C 6E65292066756C6C00 
  7620 00003A95 446566696E65206E61-     dodefine_5 db "Define name longer 15 char",0
  7621 00003A9E 6D65206C6F6E676572-
  7622 00003AA7 203135206368617200 
  7623                                  
  7624                                  stmt:  ; *** PROC ***
  7625                                  
  7626                                  ;-727        if(istoken('{'))     {while(istoken('}')==0) stmt();}
  7627                                  
  7628                                  ;Function : stmt, Number of local variables: 2
  7629                                  ;   # type sign width addr used name   list of local variables
  7630                                  ;  200 var sign word   726 NULL c = bp-2
  7631                                  ;  201 var sign byte   726 NULL cha = bp-4;
  7632 00003AB0 C8040000                 ENTER  4,0
  7633 00003AB4 6A7B                     push 123
  7634 00003AB6 E8890C                   call istoken
  7635 00003AB9 83C402                   add  sp, 2
  7636 00003ABC 08C0                     or  al, al
  7637 00003ABE 0F841700                 je @@stmt400
  7638                                  @@stmt401:
  7639 00003AC2 6A7D                     push 125
  7640 00003AC4 E87B0C                   call istoken
  7641 00003AC7 83C402                   add  sp, 2
  7642 00003ACA 83F800                   cmp ax, 0
  7643 00003ACD 0F850500                 jne @@stmt402
  7644 00003AD1 E8DCFF                   call stmt
  7645 00003AD4 EBEC                     jmp @@stmt401
  7646                                  @@stmt402:
  7647                                  
  7648                                  ;-728   else if(istoken(T_IF))    doif();
  7649                                  
  7650 00003AD6 E9A501                   jmp @@stmt403
  7651                                  @@stmt400:
  7652 00003AD9 680102                   push 513
  7653 00003ADC E8630C                   call istoken
  7654 00003ADF 83C402                   add  sp, 2
  7655 00003AE2 08C0                     or  al, al
  7656 00003AE4 0F840600                 je @@stmt404
  7657 00003AE8 E8D903                   call doif
  7658                                  
  7659                                  ;-729   else if(istoken(T_DO))    dodo();
  7660                                  
  7661 00003AEB E99001                   jmp @@stmt405
  7662                                  @@stmt404:
  7663 00003AEE 680402                   push 516
  7664 00003AF1 E84E0C                   call istoken
  7665 00003AF4 83C402                   add  sp, 2
  7666 00003AF7 08C0                     or  al, al
  7667 00003AF9 0F840600                 je @@stmt406
  7668 00003AFD E82604                   call dodo
  7669                                  
  7670                                  ;-730   else if(istoken(T_WHILE)) dowhile();
  7671                                  
  7672 00003B00 E97B01                   jmp @@stmt407
  7673                                  @@stmt406:
  7674 00003B03 680302                   push 515
  7675 00003B06 E8390C                   call istoken
  7676 00003B09 83C402                   add  sp, 2
  7677 00003B0C 08C0                     or  al, al
  7678 00003B0E 0F840600                 je @@stmt408
  7679 00003B12 E85E04                   call dowhile
  7680                                  
  7681                                  ;-731   else if(istoken(T_GOTO))  {prs("\n jmp @@");name1();prs(symbol);expect(';');}
  7682                                  
  7683 00003B15 E96601                   jmp @@stmt409
  7684                                  @@stmt408:
  7685 00003B18 680902                   push 521
  7686 00003B1B E8240C                   call istoken
  7687 00003B1E 83C402                   add  sp, 2
  7688 00003B21 08C0                     or  al, al
  7689 00003B23 0F842200                 je @@stmt410
  7690 00003B27 68[803C]                 push stmt_0
  7691 00003B2A E84A0D                   call prs
  7692 00003B2D 83C402                   add  sp, 2
  7693 00003B30 E89AD0                   call name1
  7694 00003B33 8D062B81                 lea  ax, [symbol]
  7695 00003B37 50                       push ax
  7696 00003B38 E83C0D                   call prs
  7697 00003B3B 83C402                   add  sp, 2
  7698 00003B3E 6A3B                     push 59
  7699 00003B40 E8210C                   call expect
  7700 00003B43 83C402                   add  sp, 2
  7701                                  
  7702                                  ;-732   else if(token==T_ASM)     {prs("\n"); c=next();
  7703                                  
  7704 00003B46 E93501                   jmp @@stmt411
  7705                                  @@stmt410:
  7706 00003B49 A1[2200]                 mov ax, [token]
  7707 00003B4C 3D0602                   cmp ax, 518
  7708 00003B4F 0F853300                 jne @@stmt412
  7709 00003B53 68[8A3C]                 push stmt_1
  7710 00003B56 E81E0D                   call prs
  7711 00003B59 83C402                   add  sp, 2
  7712 00003B5C E8C50B                   call next
  7713 00003B5F 8946FE                   mov [bp-2], ax
  7714                                  
  7715                                  ;-733         while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }
  7716                                  
  7717                                  @@stmt413:
  7718 00003B62 8B46FE                   mov ax, [bp-2]
  7719 00003B65 83F80A                   cmp ax, 10
  7720 00003B68 0F841100                 je  @@stmt414
  7721 00003B6C FF76FE                   push word [bp-2]
  7722 00003B6F E89E0C                   call prc
  7723 00003B72 83C402                   add  sp, 2
  7724 00003B75 E8AC0B                   call next
  7725 00003B78 8946FE                   mov [bp-2], ax
  7726 00003B7B EBE5                     jmp @@stmt413
  7727                                  @@stmt414:
  7728 00003B7D E89E04                   call getlex
  7729 00003B80 A3[2200]                 mov word [token], ax
  7730                                  
  7731                                  ;-734   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();  
  7732                                  
  7733 00003B83 E9F800                   jmp @@stmt415
  7734                                  @@stmt412:
  7735 00003B86 680702                   push 519
  7736 00003B89 E8B60B                   call istoken
  7737 00003B8C 83C402                   add  sp, 2
  7738 00003B8F 08C0                     or  al, al
  7739 00003B91 0F844B00                 je @@stmt416
  7740 00003B95 A1[2200]                 mov ax, [token]
  7741 00003B98 83F87B                   cmp ax, 123
  7742 00003B9B 0F853500                 jne @@stmt417
  7743 00003B9F 68[8D3C]                 push stmt_2
  7744 00003BA2 E8D20C                   call prs
  7745 00003BA5 83C402                   add  sp, 2
  7746 00003BA8 E8790B                   call next
  7747 00003BAB 8846FC                   mov [bp-4], al
  7748                                  
  7749                                  ;-735         while(cha!= '}') { prc(cha); cha=next(); }
  7750                                  
  7751                                  @@stmt418:
  7752 00003BAE 8A46FC                   mov al, [bp-4]
  7753 00003BB1 3C7D                     cmp al, 125
  7754 00003BB3 0F841400                 je  @@stmt419
  7755 00003BB7 8A46FC                   mov al, byte [bp-4]
  7756 00003BBA B400                     mov ah, 0
  7757 00003BBC 50                       push ax
  7758 00003BBD E8500C                   call prc
  7759 00003BC0 83C402                   add  sp, 2
  7760 00003BC3 E85E0B                   call next
  7761 00003BC6 8846FC                   mov [bp-4], al
  7762                                  
  7763                                  ;-736         token=getlex(); }
  7764                                  
  7765 00003BC9 EBE3                     jmp @@stmt418
  7766                                  @@stmt419:
  7767 00003BCB E85004                   call getlex
  7768 00003BCE A3[2200]                 mov word [token], ax
  7769                                  
  7770                                  ;-737         else error1("Curly open expected"); 
  7771                                  
  7772 00003BD1 E90900                   jmp @@stmt420
  7773                                  @@stmt417:
  7774 00003BD4 68[903C]                 push stmt_3
  7775 00003BD7 E8860F                   call error1
  7776 00003BDA 83C402                   add  sp, 2
  7777                                  
  7778                                  ;-738         }
  7779                                  
  7780                                  @@stmt420:
  7781                                  
  7782                                  ;-739   else if(istoken(T_EMIT))   doemit();
  7783                                  
  7784 00003BDD E99E00                   jmp @@stmt421
  7785                                  @@stmt416:
  7786 00003BE0 680802                   push 520
  7787 00003BE3 E85C0B                   call istoken
  7788 00003BE6 83C402                   add  sp, 2
  7789 00003BE9 08C0                     or  al, al
  7790 00003BEB 0F840600                 je @@stmt422
  7791 00003BEF E8C500                   call doemit
  7792                                  
  7793                                  ;-740   else if(istoken(';'))      { }
  7794                                  
  7795 00003BF2 E98900                   jmp @@stmt423
  7796                                  @@stmt422:
  7797 00003BF5 6A3B                     push 59
  7798 00003BF7 E8480B                   call istoken
  7799 00003BFA 83C402                   add  sp, 2
  7800 00003BFD 08C0                     or  al, al
  7801 00003BFF 0F840300                 je @@stmt424
  7802                                  
  7803                                  ;-741   else if(istoken(T_RETURN)) {
  7804                                  
  7805 00003C03 E97800                   jmp @@stmt425
  7806                                  @@stmt424:
  7807 00003C06 680002                   push 512
  7808 00003C09 E8360B                   call istoken
  7809 00003C0C 83C402                   add  sp, 2
  7810 00003C0F 08C0                     or  al, al
  7811 00003C11 0F842500                 je @@stmt426
  7812                                  
  7813                                  ;-742         if (token!=';') exprstart();
  7814                                  
  7815 00003C15 A1[2200]                 mov ax, [token]
  7816 00003C18 83F83B                   cmp ax, 59
  7817 00003C1B 0F840300                 je  @@stmt427
  7818 00003C1F E874D6                   call exprstart
  7819                                  
  7820                                  ;-743         prs("\n jmp @@retn"); 
  7821                                  
  7822                                  @@stmt427:
  7823 00003C22 68[A43C]                 push stmt_4
  7824 00003C25 E84F0C                   call prs
  7825 00003C28 83C402                   add  sp, 2
  7826                                  
  7827                                  ;-744         nreturn++; 
  7828                                  
  7829 00003C2B FF06[2C00]               inc  word[nreturn]
  7830                                  
  7831                                  ;-745         expect(';');
  7832                                  
  7833 00003C2F 6A3B                     push 59
  7834 00003C31 E8300B                   call expect
  7835 00003C34 83C402                   add  sp, 2
  7836                                  
  7837                                  ;-746         }
  7838                                  
  7839                                  
  7840                                  ;-747   else if(thechar==':')      {
  7841                                  
  7842 00003C37 E94400                   jmp @@stmt428
  7843                                  @@stmt426:
  7844 00003C3A A0[2700]                 mov al, [thechar]
  7845 00003C3D 3C3A                     cmp al, 58
  7846 00003C3F 0F853000                 jne @@stmt429
  7847                                  
  7848                                  ;-748         prs("\n@@"); // Label
  7849                                  
  7850 00003C43 68[B23C]                 push stmt_5
  7851 00003C46 E82E0C                   call prs
  7852 00003C49 83C402                   add  sp, 2
  7853                                  
  7854                                  ;-749         prs(symbol); prc(':');  
  7855                                  
  7856 00003C4C 8D062B81                 lea  ax, [symbol]
  7857 00003C50 50                       push ax
  7858 00003C51 E8230C                   call prs
  7859 00003C54 83C402                   add  sp, 2
  7860 00003C57 6A3A                     push 58
  7861 00003C59 E8B40B                   call prc
  7862 00003C5C 83C402                   add  sp, 2
  7863                                  
  7864                                  ;-750         expect(T_NAME); 
  7865                                  
  7866 00003C5F 680001                   push 256
  7867 00003C62 E8FF0A                   call expect
  7868 00003C65 83C402                   add  sp, 2
  7869                                  
  7870                                  ;-751         expect(':'); 
  7871                                  
  7872 00003C68 6A3A                     push 58
  7873 00003C6A E8F70A                   call expect
  7874 00003C6D 83C402                   add  sp, 2
  7875                                  
  7876                                  ;-752         }
  7877                                  
  7878                                  
  7879                                  ;-753   else  {exprstart(); expect(';'); } 
  7880                                  
  7881 00003C70 E90B00                   jmp @@stmt430
  7882                                  @@stmt429:
  7883 00003C73 E820D6                   call exprstart
  7884 00003C76 6A3B                     push 59
  7885 00003C78 E8E90A                   call expect
  7886 00003C7B 83C402                   add  sp, 2
  7887                                  
  7888                                  ;-754 }
  7889                                  
  7890                                  @@stmt430:
  7891                                  @@stmt428:
  7892                                  @@stmt425:
  7893                                  @@stmt423:
  7894                                  @@stmt421:
  7895                                  @@stmt415:
  7896                                  @@stmt411:
  7897                                  @@stmt409:
  7898                                  @@stmt407:
  7899                                  @@stmt405:
  7900                                  @@stmt403:
  7901                                  
  7902                                  ;-755 
  7903                                  
  7904                                  
  7905                                  ;-756 int doemit() {prs("\n db ");
  7906 00003C7E C9                       LEAVE
  7907 00003C7F C3                       ret
  7908                                  ; ENDP
  7909 00003C80 5C6E206A6D70204040-     stmt_0 db "\n jmp @@",0
  7910 00003C89 00                 
  7911 00003C8A 5C6E00                  stmt_1 db "\n",0
  7912 00003C8D 5C6E00                  stmt_2 db "\n",0
  7913 00003C90 4375726C79206F7065-     stmt_3 db "Curly open expected",0
  7914 00003C99 6E2065787065637465-
  7915 00003CA2 6400               
  7916 00003CA4 5C6E206A6D70204040-     stmt_4 db "\n jmp @@retn",0
  7917 00003CAD 7265746E00         
  7918 00003CB2 5C6E404000              stmt_5 db "\n@@",0
  7919                                  
  7920                                  doemit:  ; *** PROC ***
  7921 00003CB7 68[F33C]                 push doemit_0
  7922 00003CBA E8BA0B                   call prs
  7923 00003CBD 83C402                   add  sp, 2
  7924                                  
  7925                                  ;-757   L1: token=getlex(); prunsign1(lexval); token=getlex();
  7926                                  
  7927                                  @@L1:
  7928 00003CC0 E85B03                   call getlex
  7929 00003CC3 A3[2200]                 mov word [token], ax
  7930 00003CC6 FF36[3600]               push word [lexval]
  7931 00003CCA E8040D                   call prunsign1
  7932 00003CCD 83C402                   add  sp, 2
  7933 00003CD0 E84B03                   call getlex
  7934 00003CD3 A3[2200]                 mov word [token], ax
  7935                                  
  7936                                  ;-758     if (token== ',') {prc(','); goto L1;} expect(')'); }
  7937                                  
  7938 00003CD6 A1[2200]                 mov ax, [token]
  7939 00003CD9 83F82C                   cmp ax, 44
  7940 00003CDC 0F850A00                 jne @@doemit431
  7941 00003CE0 6A2C                     push 44
  7942 00003CE2 E82B0B                   call prc
  7943 00003CE5 83C402                   add  sp, 2
  7944 00003CE8 EBD6                     jmp @@L1
  7945                                  @@doemit431:
  7946 00003CEA 6A29                     push 41
  7947 00003CEC E8750A                   call expect
  7948 00003CEF 83C402                   add  sp, 2
  7949                                  
  7950                                  ;-759 
  7951                                  
  7952                                  
  7953                                  ;-760 int cmpneg(int ids) {
  7954                                  
  7955 00003CF2 C3                       ret
  7956                                  ; ENDP
  7957 00003CF3 5C6E2064622000          doemit_0 db "\n db ",0
  7958                                  
  7959                                  cmpneg:  ; *** PROC ***
  7960                                  
  7961                                  ;-761        if(iscmp==T_EQ) prs("\n jne @@");         //ZF=0
  7962                                  
  7963                                  ;Function : cmpneg, Number of local variables: 1
  7964                                  ;   # type sign width addr used name   list of local variables
  7965                                  ;  200 var sign word   760 NULL ids = bp+4;
  7966 00003CFA C8000000                 ENTER  0,0
  7967 00003CFE A1[2800]                 mov ax, [iscmp]
  7968 00003D01 3D2603                   cmp ax, 806
  7969 00003D04 0F850C00                 jne @@cmpneg432
  7970 00003D08 68[DB3D]                 push cmpneg_0
  7971 00003D0B E8690B                   call prs
  7972 00003D0E 83C402                   add  sp, 2
  7973                                  
  7974                                  ;-762   else if(iscmp==T_NE) prs("\n je  @@");         //ZF=1
  7975                                  
  7976 00003D11 E9C500                   jmp @@cmpneg433
  7977                                  @@cmpneg432:
  7978 00003D14 A1[2800]                 mov ax, [iscmp]
  7979 00003D17 3D2703                   cmp ax, 807
  7980 00003D1A 0F850C00                 jne @@cmpneg434
  7981 00003D1E 68[E53D]                 push cmpneg_1
  7982 00003D21 E8530B                   call prs
  7983 00003D24 83C402                   add  sp, 2
  7984                                  
  7985                                  ;-763   else if(iscmp==T_LE) if (ids) prs("\n jg  @@");//ZF=0      SF =OF
  7986                                  
  7987 00003D27 E9AF00                   jmp @@cmpneg435
  7988                                  @@cmpneg434:
  7989 00003D2A A1[2800]                 mov ax, [iscmp]
  7990 00003D2D 3D3803                   cmp ax, 824
  7991 00003D30 0F852100                 jne @@cmpneg436
  7992 00003D34 8B4604                   mov ax, [bp+4]
  7993 00003D37 08C0                     or  al, al
  7994 00003D39 0F840C00                 je @@cmpneg437
  7995 00003D3D 68[EF3D]                 push cmpneg_2
  7996 00003D40 E8340B                   call prs
  7997 00003D43 83C402                   add  sp, 2
  7998                                  
  7999                                  ;-764                            else prs("\n ja  @@");//ZF=0 CF=0
  8000                                  
  8001 00003D46 E90900                   jmp @@cmpneg438
  8002                                  @@cmpneg437:
  8003 00003D49 68[F93D]                 push cmpneg_3
  8004 00003D4C E8280B                   call prs
  8005 00003D4F 83C402                   add  sp, 2
  8006                                  
  8007                                  ;-765   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);
  8008                                  
  8009                                  @@cmpneg438:
  8010 00003D52 E98400                   jmp @@cmpneg439
  8011                                  @@cmpneg436:
  8012 00003D55 A1[2800]                 mov ax, [iscmp]
  8013 00003D58 3D2B03                   cmp ax, 811
  8014 00003D5B 0F854500                 jne @@cmpneg440
  8015 00003D5F 8B4604                   mov ax, [bp+4]
  8016 00003D62 08C0                     or  al, al
  8017 00003D64 0F841E00                 je @@cmpneg441
  8018 00003D68 68[033E]                 push cmpneg_4
  8019 00003D6B E8090B                   call prs
  8020 00003D6E 83C402                   add  sp, 2
  8021 00003D71 FF7604                   push word [bp+4]
  8022 00003D74 E85A0C                   call prunsign1
  8023 00003D77 83C402                   add  sp, 2
  8024                                  
  8025                                  ;-766                                prs("\n jl  @@");}//          SF!=OF
  8026                                  
  8027 00003D7A 68[113E]                 push cmpneg_5
  8028 00003D7D E8F70A                   call prs
  8029 00003D80 83C402                   add  sp, 2
  8030                                  
  8031                                  ;-767                            else{prs(" ;unsigned : "); prunsign1(ids);
  8032                                  
  8033 00003D83 E91B00                   jmp @@cmpneg442
  8034                                  @@cmpneg441:
  8035 00003D86 68[1B3E]                 push cmpneg_6
  8036 00003D89 E8EB0A                   call prs
  8037 00003D8C 83C402                   add  sp, 2
  8038 00003D8F FF7604                   push word [bp+4]
  8039 00003D92 E83C0C                   call prunsign1
  8040 00003D95 83C402                   add  sp, 2
  8041                                  
  8042                                  ;-768                                prs("\n jb  @@");}//jb=jc=CF=1
  8043                                  
  8044 00003D98 68[293E]                 push cmpneg_7
  8045 00003D9B E8D90A                   call prs
  8046 00003D9E 83C402                   add  sp, 2
  8047                                  
  8048                                  ;-769   else if(iscmp=='<' ) prs("\n jge @@");         //          SF =OF
  8049                                  
  8050                                  @@cmpneg442:
  8051 00003DA1 E93500                   jmp @@cmpneg443
  8052                                  @@cmpneg440:
  8053 00003DA4 A1[2800]                 mov ax, [iscmp]
  8054 00003DA7 83F83C                   cmp ax, 60
  8055 00003DAA 0F850C00                 jne @@cmpneg444
  8056 00003DAE 68[333E]                 push cmpneg_8
  8057 00003DB1 E8C30A                   call prs
  8058 00003DB4 83C402                   add  sp, 2
  8059                                  
  8060                                  ;-770   else if(iscmp=='>' ) prs("\n jle @@");         //ZF=1 oder SF!=OF
  8061                                  
  8062 00003DB7 E91F00                   jmp @@cmpneg445
  8063                                  @@cmpneg444:
  8064 00003DBA A1[2800]                 mov ax, [iscmp]
  8065 00003DBD 83F83E                   cmp ax, 62
  8066 00003DC0 0F850C00                 jne @@cmpneg446
  8067 00003DC4 68[3D3E]                 push cmpneg_9
  8068 00003DC7 E8AD0A                   call prs
  8069 00003DCA 83C402                   add  sp, 2
  8070                                  
  8071                                  ;-771   else error1("Vergleich unbekannt in CMPNEG()");  }
  8072                                  
  8073 00003DCD E90900                   jmp @@cmpneg447
  8074                                  @@cmpneg446:
  8075 00003DD0 68[473E]                 push cmpneg_10
  8076 00003DD3 E88A0D                   call error1
  8077 00003DD6 83C402                   add  sp, 2
  8078                                  @@cmpneg447:
  8079                                  @@cmpneg445:
  8080                                  @@cmpneg443:
  8081                                  @@cmpneg439:
  8082                                  @@cmpneg435:
  8083                                  @@cmpneg433:
  8084                                  
  8085                                  ;-772 
  8086                                  
  8087                                  
  8088                                  ;-773 int prlabel(int n) {prs("\n@@"); prs(fname); pint1(n); prc(':'); }
  8089 00003DD9 C9                       LEAVE
  8090 00003DDA C3                       ret
  8091                                  ; ENDP
  8092 00003DDB 5C6E206A6E65204040-     cmpneg_0 db "\n jne @@",0
  8093 00003DE4 00                 
  8094 00003DE5 5C6E206A6520204040-     cmpneg_1 db "\n je  @@",0
  8095 00003DEE 00                 
  8096 00003DEF 5C6E206A6720204040-     cmpneg_2 db "\n jg  @@",0
  8097 00003DF8 00                 
  8098 00003DF9 5C6E206A6120204040-     cmpneg_3 db "\n ja  @@",0
  8099 00003E02 00                 
  8100 00003E03 203B756E7369676E65-     cmpneg_4 db " ;unsigned : ",0
  8101 00003E0C 64203A2000         
  8102 00003E11 5C6E206A6C20204040-     cmpneg_5 db "\n jl  @@",0
  8103 00003E1A 00                 
  8104 00003E1B 203B756E7369676E65-     cmpneg_6 db " ;unsigned : ",0
  8105 00003E24 64203A2000         
  8106 00003E29 5C6E206A6220204040-     cmpneg_7 db "\n jb  @@",0
  8107 00003E32 00                 
  8108 00003E33 5C6E206A6765204040-     cmpneg_8 db "\n jge @@",0
  8109 00003E3C 00                 
  8110 00003E3D 5C6E206A6C65204040-     cmpneg_9 db "\n jle @@",0
  8111 00003E46 00                 
  8112 00003E47 566572676C65696368-     cmpneg_10 db "Vergleich unbekannt in CMPNEG()",0
  8113 00003E50 20756E62656B616E6E-
  8114 00003E59 7420696E20434D504E-
  8115 00003E62 4547282900         
  8116                                  
  8117                                  prlabel:  ; *** PROC ***
  8118                                  ;Function : prlabel, Number of local variables: 1
  8119                                  ;   # type sign width addr used name   list of local variables
  8120                                  ;  200 var sign word   773 NULL n = bp+4;
  8121 00003E67 C8000000                 ENTER  0,0
  8122 00003E6B 68[923E]                 push prlabel_0
  8123 00003E6E E8060A                   call prs
  8124 00003E71 83C402                   add  sp, 2
  8125 00003E74 8D06AB81                 lea  ax, [fname]
  8126 00003E78 50                       push ax
  8127 00003E79 E8FB09                   call prs
  8128 00003E7C 83C402                   add  sp, 2
  8129 00003E7F FF7604                   push word [bp+4]
  8130 00003E82 E8E90A                   call pint1
  8131 00003E85 83C402                   add  sp, 2
  8132 00003E88 6A3A                     push 58
  8133 00003E8A E88309                   call prc
  8134 00003E8D 83C402                   add  sp, 2
  8135                                  
  8136                                  ;-774 int prjump (int n) {prs("\n jmp @@"); prs(fname); pint1(n); }
  8137 00003E90 C9                       LEAVE
  8138 00003E91 C3                       ret
  8139                                  ; ENDP
  8140 00003E92 5C6E404000              prlabel_0 db "\n@@",0
  8141                                  
  8142                                  prjump:  ; *** PROC ***
  8143                                  ;Function : prjump, Number of local variables: 1
  8144                                  ;   # type sign width addr used name   list of local variables
  8145                                  ;  200 var sign word   774 NULL n = bp+4;
  8146 00003E97 C8000000                 ENTER  0,0
  8147 00003E9B 68[BA3E]                 push prjump_0
  8148 00003E9E E8D609                   call prs
  8149 00003EA1 83C402                   add  sp, 2
  8150 00003EA4 8D06AB81                 lea  ax, [fname]
  8151 00003EA8 50                       push ax
  8152 00003EA9 E8CB09                   call prs
  8153 00003EAC 83C402                   add  sp, 2
  8154 00003EAF FF7604                   push word [bp+4]
  8155 00003EB2 E8B90A                   call pint1
  8156 00003EB5 83C402                   add  sp, 2
  8157                                  
  8158                                  ;-775 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
  8159 00003EB8 C9                       LEAVE
  8160 00003EB9 C3                       ret
  8161                                  ; ENDP
  8162 00003EBA 5C6E206A6D70204040-     prjump_0 db "\n jmp @@",0
  8163 00003EC3 00                 
  8164                                  
  8165                                  doif:  ; *** PROC ***
  8166                                  ;Function : doif, Number of local variables: 2
  8167                                  ;   # type sign width addr used name   list of local variables
  8168                                  ;  200 var sign word   775 NULL jdest = bp-2
  8169                                  ;  201 var sign word   775 NULL tst = bp-4;
  8170 00003EC4 C8040000                 ENTER  4,0
  8171 00003EC8 E83ED2                   call pexpr
  8172 00003ECB FF06[2E00]               inc  word[nlabel]
  8173 00003ECF A1[2E00]                 mov ax, [nlabel]
  8174 00003ED2 8946FE                   mov [bp-2], ax
  8175                                  
  8176                                  ;-776   pint1(jdest); stmt();
  8177                                  
  8178 00003ED5 FF76FE                   push word [bp-2]
  8179 00003ED8 E8930A                   call pint1
  8180 00003EDB 83C402                   add  sp, 2
  8181 00003EDE E8CFFB                   call stmt
  8182                                  
  8183                                  ;-777   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;
  8184                                  
  8185 00003EE1 680202                   push 514
  8186 00003EE4 E85B08                   call istoken
  8187 00003EE7 83C402                   add  sp, 2
  8188 00003EEA 08C0                     or  al, al
  8189 00003EEC 0F842B00                 je @@doif448
  8190 00003EF0 FF06[2E00]               inc  word[nlabel]
  8191 00003EF4 A1[2E00]                 mov ax, [nlabel]
  8192 00003EF7 8946FC                   mov [bp-4], ax
  8193                                  
  8194                                  ;-778     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }
  8195                                  
  8196 00003EFA FF76FC                   push word [bp-4]
  8197 00003EFD E897FF                   call prjump
  8198 00003F00 83C402                   add  sp, 2
  8199 00003F03 FF76FE                   push word [bp-2]
  8200 00003F06 E85EFF                   call prlabel
  8201 00003F09 83C402                   add  sp, 2
  8202 00003F0C E8A1FB                   call stmt
  8203 00003F0F FF76FC                   push word [bp-4]
  8204 00003F12 E852FF                   call prlabel
  8205 00003F15 83C402                   add  sp, 2
  8206                                  
  8207                                  ;-779   else prlabel(jdest); }
  8208                                  
  8209 00003F18 E90900                   jmp @@doif449
  8210                                  @@doif448:
  8211 00003F1B FF76FE                   push word [bp-2]
  8212 00003F1E E846FF                   call prlabel
  8213 00003F21 83C402                   add  sp, 2
  8214                                  @@doif449:
  8215                                  
  8216                                  ;-780 
  8217                                  
  8218                                  
  8219                                  ;-781 int dodo() {int jdest; int jtemp;
  8220 00003F24 C9                       LEAVE
  8221 00003F25 C3                       ret
  8222                                  ; ENDP
  8223                                  
  8224                                  dodo:  ; *** PROC ***
  8225                                  
  8226                                  ;-782   nlabel++; jdest=nlabel; prlabel(jdest); stmt();
  8227                                  
  8228                                  ;Function : dodo, Number of local variables: 2
  8229                                  ;   # type sign width addr used name   list of local variables
  8230                                  ;  200 var sign word   781 NULL jdest = bp-2
  8231                                  ;  201 var sign word   781 NULL jtemp = bp-4;
  8232 00003F26 C8040000                 ENTER  4,0
  8233 00003F2A FF06[2E00]               inc  word[nlabel]
  8234 00003F2E A1[2E00]                 mov ax, [nlabel]
  8235 00003F31 8946FE                   mov [bp-2], ax
  8236 00003F34 FF76FE                   push word [bp-2]
  8237 00003F37 E82DFF                   call prlabel
  8238 00003F3A 83C402                   add  sp, 2
  8239 00003F3D E870FB                   call stmt
  8240                                  
  8241                                  ;-783   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);
  8242                                  
  8243 00003F40 680302                   push 515
  8244 00003F43 E81E08                   call expect
  8245 00003F46 83C402                   add  sp, 2
  8246 00003F49 E8BDD1                   call pexpr
  8247 00003F4C FF06[2E00]               inc  word[nlabel]
  8248 00003F50 A1[2E00]                 mov ax, [nlabel]
  8249 00003F53 8946FC                   mov [bp-4], ax
  8250 00003F56 FF76FC                   push word [bp-4]
  8251 00003F59 E8120A                   call pint1
  8252 00003F5C 83C402                   add  sp, 2
  8253                                  
  8254                                  ;-784   prjump(jdest); prlabel(jtemp); }
  8255                                  
  8256 00003F5F FF76FE                   push word [bp-2]
  8257 00003F62 E832FF                   call prjump
  8258 00003F65 83C402                   add  sp, 2
  8259 00003F68 FF76FC                   push word [bp-4]
  8260 00003F6B E8F9FE                   call prlabel
  8261 00003F6E 83C402                   add  sp, 2
  8262                                  
  8263                                  ;-785 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
  8264 00003F71 C9                       LEAVE
  8265 00003F72 C3                       ret
  8266                                  ; ENDP
  8267                                  
  8268                                  dowhile:  ; *** PROC ***
  8269                                  ;Function : dowhile, Number of local variables: 2
  8270                                  ;   # type sign width addr used name   list of local variables
  8271                                  ;  200 var sign word   785 NULL jdest = bp-2
  8272                                  ;  201 var sign word   785 NULL tst = bp-4;
  8273 00003F73 C8040000                 ENTER  4,0
  8274 00003F77 FF06[2E00]               inc  word[nlabel]
  8275 00003F7B A1[2E00]                 mov ax, [nlabel]
  8276 00003F7E 8946FE                   mov [bp-2], ax
  8277                                  
  8278                                  ;-786   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);
  8279                                  
  8280 00003F81 FF76FE                   push word [bp-2]
  8281 00003F84 E8E0FE                   call prlabel
  8282 00003F87 83C402                   add  sp, 2
  8283 00003F8A E87CD1                   call pexpr
  8284 00003F8D FF06[2E00]               inc  word[nlabel]
  8285 00003F91 A1[2E00]                 mov ax, [nlabel]
  8286 00003F94 8946FC                   mov [bp-4], ax
  8287 00003F97 FF76FC                   push word [bp-4]
  8288 00003F9A E8D109                   call pint1
  8289 00003F9D 83C402                   add  sp, 2
  8290                                  
  8291                                  ;-787   stmt(); prjump(jdest); prlabel(tst); }
  8292                                  
  8293 00003FA0 E80DFB                   call stmt
  8294 00003FA3 FF76FE                   push word [bp-2]
  8295 00003FA6 E8EEFE                   call prjump
  8296 00003FA9 83C402                   add  sp, 2
  8297 00003FAC FF76FC                   push word [bp-4]
  8298 00003FAF E8B5FE                   call prlabel
  8299 00003FB2 83C402                   add  sp, 2
  8300                                  
  8301                                  ;-788 int isrelational() {
  8302 00003FB5 C9                       LEAVE
  8303 00003FB6 C3                       ret
  8304                                  ; ENDP
  8305                                  
  8306                                  isrelational:  ; *** PROC ***
  8307                                  
  8308                                  ;-789   if (token==T_EQ) goto w; if (token==T_NE) goto w;
  8309                                  
  8310 00003FB7 A1[2200]                 mov ax, [token]
  8311 00003FBA 3D2603                   cmp ax, 806
  8312 00003FBD 0F850300                 jne @@isrelational450
  8313 00003FC1 E94700                   jmp @@w
  8314                                  @@isrelational450:
  8315 00003FC4 A1[2200]                 mov ax, [token]
  8316 00003FC7 3D2703                   cmp ax, 807
  8317 00003FCA 0F850300                 jne @@isrelational451
  8318 00003FCE E93A00                   jmp @@w
  8319                                  
  8320                                  ;-790   if (token==T_LE) goto w; if (token==T_GE) goto w;
  8321                                  
  8322                                  @@isrelational451:
  8323 00003FD1 A1[2200]                 mov ax, [token]
  8324 00003FD4 3D3803                   cmp ax, 824
  8325 00003FD7 0F850300                 jne @@isrelational452
  8326 00003FDB E92D00                   jmp @@w
  8327                                  @@isrelational452:
  8328 00003FDE A1[2200]                 mov ax, [token]
  8329 00003FE1 3D2B03                   cmp ax, 811
  8330 00003FE4 0F850300                 jne @@isrelational453
  8331 00003FE8 E92000                   jmp @@w
  8332                                  
  8333                                  ;-791   if (token=='<' ) goto w; if (token=='>' ) goto w;
  8334                                  
  8335                                  @@isrelational453:
  8336 00003FEB A1[2200]                 mov ax, [token]
  8337 00003FEE 83F83C                   cmp ax, 60
  8338 00003FF1 0F850300                 jne @@isrelational454
  8339 00003FF5 E91300                   jmp @@w
  8340                                  @@isrelational454:
  8341 00003FF8 A1[2200]                 mov ax, [token]
  8342 00003FFB 83F83E                   cmp ax, 62
  8343 00003FFE 0F850300                 jne @@isrelational455
  8344 00004002 E90600                   jmp @@w
  8345                                  
  8346                                  ;-792   return 0;  w: iscmp=token; token=getlex(); return 1;}
  8347                                  
  8348                                  @@isrelational455:
  8349 00004005 B80000                   mov ax, 0
  8350 00004008 E91200                   jmp @@retn
  8351                                  @@w:
  8352 0000400B A1[2200]                 mov ax, [token]
  8353 0000400E A3[2800]                 mov word [iscmp], ax
  8354 00004011 E80A00                   call getlex
  8355 00004014 A3[2200]                 mov word [token], ax
  8356 00004017 B80100                   mov ax, 1
  8357 0000401A E90000                   jmp @@retn
  8358                                  
  8359                                  ;-793  
  8360                                  
  8361                                  
  8362                                  ;-794 char symboltemp[80];    
  8363                                  
  8364                                  @@retn:
  8365 0000401D C3                       ret
  8366                                  ; ENDP
  8367                                  section .bss
  8368                                  absolute 53468
  8369 0000D0DC <res 00000050>          symboltemp resb 80
  8370                                  section .text
  8371                                  
  8372                                  ;-795 int getlex() { char c; char *p; 
  8373                                  
  8374                                  
  8375                                  getlex:  ; *** PROC ***
  8376                                  
  8377                                  ;-796 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;
  8378                                  
  8379                                  ;Function : getlex, Number of local variables: 2
  8380                                  ;   # type sign width addr used name   list of local variables
  8381                                  ;  200 var sign byte   795 NULL c = bp-2
  8382                                  ;  201 ptr sign byte   795 NULL p = bp-4;
  8383 0000401E C8040000                 ENTER  4,0
  8384                                  @@g1:
  8385 00004022 E8FF06                   call next
  8386 00004025 8846FE                   mov [bp-2], al
  8387 00004028 8A46FE                   mov al, [bp-2]
  8388 0000402B 3C00                     cmp al, 0
  8389 0000402D 0F850600                 jne @@getlex456
  8390 00004031 B80000                   mov ax, 0
  8391 00004034 E9EB04                   jmp @@retn
  8392                                  @@getlex456:
  8393 00004037 8A46FE                   mov al, [bp-2]
  8394 0000403A 3C20                     cmp al, 32
  8395 0000403C 0F8F0200                 jg  @@getlex457
  8396 00004040 EBE0                     jmp @@g1
  8397                                  
  8398                                  ;-797   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}
  8399                                  
  8400                                  @@getlex457:
  8401 00004042 8A46FE                   mov al, [bp-2]
  8402 00004045 3C3D                     cmp al, 61
  8403 00004047 0F851200                 jne @@getlex458
  8404 0000404B A0[2700]                 mov al, [thechar]
  8405 0000404E 3C3D                     cmp al, 61
  8406 00004050 0F850900                 jne @@getlex459
  8407 00004054 E8CD06                   call next
  8408 00004057 B82603                   mov ax, 806
  8409 0000405A E9C504                   jmp @@retn
  8410                                  @@getlex459:
  8411                                  
  8412                                  ;-798   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}
  8413                                  
  8414                                  @@getlex458:
  8415 0000405D 8A46FE                   mov al, [bp-2]
  8416 00004060 3C21                     cmp al, 33
  8417 00004062 0F851200                 jne @@getlex460
  8418 00004066 A0[2700]                 mov al, [thechar]
  8419 00004069 3C3D                     cmp al, 61
  8420 0000406B 0F850900                 jne @@getlex461
  8421 0000406F E8B206                   call next
  8422 00004072 B82703                   mov ax, 807
  8423 00004075 E9AA04                   jmp @@retn
  8424                                  @@getlex461:
  8425                                  
  8426                                  ;-799   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}
  8427                                  
  8428                                  @@getlex460:
  8429 00004078 8A46FE                   mov al, [bp-2]
  8430 0000407B 3C3C                     cmp al, 60
  8431 0000407D 0F851200                 jne @@getlex462
  8432 00004081 A0[2700]                 mov al, [thechar]
  8433 00004084 3C3D                     cmp al, 61
  8434 00004086 0F850900                 jne @@getlex463
  8435 0000408A E89706                   call next
  8436 0000408D B83803                   mov ax, 824
  8437 00004090 E98F04                   jmp @@retn
  8438                                  @@getlex463:
  8439                                  
  8440                                  ;-800   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}
  8441                                  
  8442                                  @@getlex462:
  8443 00004093 8A46FE                   mov al, [bp-2]
  8444 00004096 3C3E                     cmp al, 62
  8445 00004098 0F851200                 jne @@getlex464
  8446 0000409C A0[2700]                 mov al, [thechar]
  8447 0000409F 3C3D                     cmp al, 61
  8448 000040A1 0F850900                 jne @@getlex465
  8449 000040A5 E87C06                   call next
  8450 000040A8 B82B03                   mov ax, 811
  8451 000040AB E97404                   jmp @@retn
  8452                                  @@getlex465:
  8453                                  
  8454                                  ;-801   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}
  8455                                  
  8456                                  @@getlex464:
  8457 000040AE 8A46FE                   mov al, [bp-2]
  8458 000040B1 3C3C                     cmp al, 60
  8459 000040B3 0F851200                 jne @@getlex466
  8460 000040B7 A0[2700]                 mov al, [thechar]
  8461 000040BA 3C3C                     cmp al, 60
  8462 000040BC 0F850900                 jne @@getlex467
  8463 000040C0 E86106                   call next
  8464 000040C3 B8D804                   mov ax, 1240
  8465 000040C6 E95904                   jmp @@retn
  8466                                  @@getlex467:
  8467                                  
  8468                                  ;-802   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}
  8469                                  
  8470                                  @@getlex466:
  8471 000040C9 8A46FE                   mov al, [bp-2]
  8472 000040CC 3C3E                     cmp al, 62
  8473 000040CE 0F851200                 jne @@getlex468
  8474 000040D2 A0[2700]                 mov al, [thechar]
  8475 000040D5 3C3E                     cmp al, 62
  8476 000040D7 0F850900                 jne @@getlex469
  8477 000040DB E84606                   call next
  8478 000040DE B8D904                   mov ax, 1241
  8479 000040E1 E93E04                   jmp @@retn
  8480                                  @@getlex469:
  8481                                  
  8482                                  ;-803   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}
  8483                                  
  8484                                  @@getlex468:
  8485 000040E4 8A46FE                   mov al, [bp-2]
  8486 000040E7 3C2B                     cmp al, 43
  8487 000040E9 0F851200                 jne @@getlex470
  8488 000040ED A0[2700]                 mov al, [thechar]
  8489 000040F0 3C2B                     cmp al, 43
  8490 000040F2 0F850900                 jne @@getlex471
  8491 000040F6 E82B06                   call next
  8492 000040F9 B8C304                   mov ax, 1219
  8493 000040FC E92304                   jmp @@retn
  8494                                  @@getlex471:
  8495                                  
  8496                                  ;-804   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}
  8497                                  
  8498                                  @@getlex470:
  8499 000040FF 8A46FE                   mov al, [bp-2]
  8500 00004102 3C2D                     cmp al, 45
  8501 00004104 0F851200                 jne @@getlex472
  8502 00004108 A0[2700]                 mov al, [thechar]
  8503 0000410B 3C2D                     cmp al, 45
  8504 0000410D 0F850900                 jne @@getlex473
  8505 00004111 E81006                   call next
  8506 00004114 B8C904                   mov ax, 1225
  8507 00004117 E90804                   jmp @@retn
  8508                                  @@getlex473:
  8509                                  
  8510                                  ;-805   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}
  8511                                  
  8512                                  @@getlex472:
  8513 0000411A 8A46FE                   mov al, [bp-2]
  8514 0000411D 3C2B                     cmp al, 43
  8515 0000411F 0F851200                 jne @@getlex474
  8516 00004123 A0[2700]                 mov al, [thechar]
  8517 00004126 3C3D                     cmp al, 61
  8518 00004128 0F850900                 jne @@getlex475
  8519 0000412C E8F505                   call next
  8520 0000412F B8CE04                   mov ax, 1230
  8521 00004132 E9ED03                   jmp @@retn
  8522                                  @@getlex475:
  8523                                  
  8524                                  ;-806   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}
  8525                                  
  8526                                  @@getlex474:
  8527 00004135 8A46FE                   mov al, [bp-2]
  8528 00004138 3C2D                     cmp al, 45
  8529 0000413A 0F851200                 jne @@getlex476
  8530 0000413E A0[2700]                 mov al, [thechar]
  8531 00004141 3C3D                     cmp al, 61
  8532 00004143 0F850900                 jne @@getlex477
  8533 00004147 E8DA05                   call next
  8534 0000414A B8CF04                   mov ax, 1231
  8535 0000414D E9D203                   jmp @@retn
  8536                                  @@getlex477:
  8537                                  
  8538                                  ;-807   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}
  8539                                  
  8540                                  @@getlex476:
  8541 00004150 8A46FE                   mov al, [bp-2]
  8542 00004153 3C26                     cmp al, 38
  8543 00004155 0F851200                 jne @@getlex478
  8544 00004159 A0[2700]                 mov al, [thechar]
  8545 0000415C 3C3D                     cmp al, 61
  8546 0000415E 0F850900                 jne @@getlex479
  8547 00004162 E8BF05                   call next
  8548 00004165 B8D204                   mov ax, 1234
  8549 00004168 E9B703                   jmp @@retn
  8550                                  @@getlex479:
  8551                                  
  8552                                  ;-808   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}    
  8553                                  
  8554                                  @@getlex478:
  8555 0000416B 8A46FE                   mov al, [bp-2]
  8556 0000416E 3C7C                     cmp al, 124
  8557 00004170 0F851200                 jne @@getlex480
  8558 00004174 A0[2700]                 mov al, [thechar]
  8559 00004177 3C3D                     cmp al, 61
  8560 00004179 0F850900                 jne @@getlex481
  8561 0000417D E8A405                   call next
  8562 00004180 B8D304                   mov ax, 1235
  8563 00004183 E99C03                   jmp @@retn
  8564                                  @@getlex481:
  8565                                  
  8566                                  ;-809   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}
  8567                                  
  8568                                  @@getlex480:
  8569 00004186 8A46FE                   mov al, [bp-2]
  8570 00004189 3C2A                     cmp al, 42
  8571 0000418B 0F851200                 jne @@getlex482
  8572 0000418F A0[2700]                 mov al, [thechar]
  8573 00004192 3C3D                     cmp al, 61
  8574 00004194 0F850900                 jne @@getlex483
  8575 00004198 E88905                   call next
  8576 0000419B B8D004                   mov ax, 1232
  8577 0000419E E98103                   jmp @@retn
  8578                                  @@getlex483:
  8579                                  
  8580                                  ;-810   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}        
  8581                                  
  8582                                  @@getlex482:
  8583 000041A1 8A46FE                   mov al, [bp-2]
  8584 000041A4 3C2F                     cmp al, 47
  8585 000041A6 0F851200                 jne @@getlex484
  8586 000041AA A0[2700]                 mov al, [thechar]
  8587 000041AD 3C3D                     cmp al, 61
  8588 000041AF 0F850900                 jne @@getlex485
  8589 000041B3 E86E05                   call next
  8590 000041B6 B8D104                   mov ax, 1233
  8591 000041B9 E96603                   jmp @@retn
  8592                                  @@getlex485:
  8593                                  
  8594                                  ;-811   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;
  8595                                  
  8596                                  @@getlex484:
  8597 000041BC 8A46FE                   mov al, byte [bp-2]
  8598 000041BF B400                     mov ah, 0
  8599 000041C1 50                       push ax
  8600 000041C2 68[2445]                 push getlex_0
  8601 000041C5 E837C0                   call instr1
  8602 000041C8 83C404                   add  sp, 4
  8603 000041CB 08C0                     or  al, al
  8604 000041CD 0F840600                 je @@getlex486
  8605 000041D1 8A46FE                   mov al, [bp-2]
  8606 000041D4 E94B03                   jmp @@retn
  8607                                  
  8608                                  ;-812   if (c == '/') { if (thechar == '/') {
  8609                                  
  8610                                  @@getlex486:
  8611 000041D7 8A46FE                   mov al, [bp-2]
  8612 000041DA 3C2F                     cmp al, 47
  8613 000041DC 0F852000                 jne @@getlex487
  8614 000041E0 A0[2700]                 mov al, [thechar]
  8615 000041E3 3C2F                     cmp al, 47
  8616 000041E5 0F851700                 jne @@getlex488
  8617                                  
  8618                                  ;-813       do c=next(); while(c != 13); /* c=next(); */ return getlex(); } }
  8619                                  
  8620                                  @@getlex489:
  8621 000041E9 E83805                   call next
  8622 000041EC 8846FE                   mov [bp-2], al
  8623 000041EF 8A46FE                   mov al, [bp-2]
  8624 000041F2 3C0D                     cmp al, 13
  8625 000041F4 0F840200                 je  @@getlex490
  8626 000041F8 EBEF                     jmp @@getlex489
  8627                                  @@getlex490:
  8628 000041FA E821FE                   call getlex
  8629 000041FD E92203                   jmp @@retn
  8630                                  @@getlex488:
  8631                                  
  8632                                  ;-814   if (c == '/') { if (thechar == '*') {
  8633                                  
  8634                                  @@getlex487:
  8635 00004200 8A46FE                   mov al, [bp-2]
  8636 00004203 3C2F                     cmp al, 47
  8637 00004205 0F853A00                 jne @@getlex491
  8638 00004209 A0[2700]                 mov al, [thechar]
  8639 0000420C 3C2A                     cmp al, 42
  8640 0000420E 0F852B00                 jne @@getlex492
  8641                                  
  8642                                  ;-815       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;
  8643                                  
  8644                                  @@g2:
  8645 00004212 E80F05                   call next
  8646 00004215 8846FE                   mov [bp-2], al
  8647 00004218 8A46FE                   mov al, [bp-2]
  8648 0000421B 3C2A                     cmp al, 42
  8649 0000421D 0F840200                 je  @@getlex493
  8650 00004221 EBEF                     jmp @@g2
  8651                                  @@getlex493:
  8652 00004223 A0[2700]                 mov al, [thechar]
  8653 00004226 3C2F                     cmp al, 47
  8654 00004228 0F840200                 je  @@getlex494
  8655 0000422C EBE4                     jmp @@g2
  8656                                  
  8657                                  ;-816       c=next(); return getlex(); } else  return '/'; }
  8658                                  
  8659                                  @@getlex494:
  8660 0000422E E8F304                   call next
  8661 00004231 8846FE                   mov [bp-2], al
  8662 00004234 E8E7FD                   call getlex
  8663 00004237 E9E802                   jmp @@retn
  8664 0000423A E90600                   jmp @@getlex495
  8665                                  @@getlex492:
  8666 0000423D B82F00                   mov ax, 47
  8667 00004240 E9DF02                   jmp @@retn
  8668                                  @@getlex495:
  8669                                  
  8670                                  ;-817   if (c == '"') {getstring(c); return T_STRING;}
  8671                                  
  8672                                  @@getlex491:
  8673 00004243 8A46FE                   mov al, [bp-2]
  8674 00004246 3C22                     cmp al, 34
  8675 00004248 0F851200                 jne @@getlex496
  8676 0000424C 8A46FE                   mov al, byte [bp-2]
  8677 0000424F B400                     mov ah, 0
  8678 00004251 50                       push ax
  8679 00004252 E89804                   call getstring
  8680 00004255 83C402                   add  sp, 2
  8681 00004258 B80201                   mov ax, 258
  8682 0000425B E9C402                   jmp @@retn
  8683                                  
  8684                                  ;-818   if (digit(c)) { getdigit(c); return T_CONST; }
  8685                                  
  8686                                  @@getlex496:
  8687 0000425E 8A46FE                   mov al, byte [bp-2]
  8688 00004261 B400                     mov ah, 0
  8689 00004263 50                       push ax
  8690 00004264 E8C7C0                   call digit
  8691 00004267 83C402                   add  sp, 2
  8692 0000426A 08C0                     or  al, al
  8693 0000426C 0F841200                 je @@getlex497
  8694 00004270 8A46FE                   mov al, byte [bp-2]
  8695 00004273 B400                     mov ah, 0
  8696 00004275 50                       push ax
  8697 00004276 E89E03                   call getdigit
  8698 00004279 83C402                   add  sp, 2
  8699 0000427C B80101                   mov ax, 257
  8700 0000427F E9A002                   jmp @@retn
  8701                                  
  8702                                  ;-819   if (c==39) { lexval=next();
  8703                                  
  8704                                  @@getlex497:
  8705 00004282 8A46FE                   mov al, [bp-2]
  8706 00004285 3C27                     cmp al, 39
  8707 00004287 0F854F00                 jne @@getlex498
  8708 0000428B E89604                   call next
  8709 0000428E A3[3600]                 mov word [lexval], ax
  8710                                  
  8711                                  ;-820     if (lexval==92) {lexval=next();
  8712                                  
  8713 00004291 A1[3600]                 mov ax, [lexval]
  8714 00004294 83F85C                   cmp ax, 92
  8715 00004297 0F853600                 jne @@getlex499
  8716 0000429B E88604                   call next
  8717 0000429E A3[3600]                 mov word [lexval], ax
  8718                                  
  8719                                  ;-821       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;
  8720                                  
  8721 000042A1 A1[3600]                 mov ax, [lexval]
  8722 000042A4 83F86E                   cmp ax, 110
  8723 000042A7 0F850600                 jne @@getlex500
  8724 000042AB B80A00                   mov ax, 10
  8725 000042AE A3[3600]                 mov word [lexval], ax
  8726                                  @@getlex500:
  8727 000042B1 A1[3600]                 mov ax, [lexval]
  8728 000042B4 83F874                   cmp ax, 116
  8729 000042B7 0F850600                 jne @@getlex501
  8730 000042BB B80900                   mov ax, 9
  8731 000042BE A3[3600]                 mov word [lexval], ax
  8732                                  
  8733                                  ;-822       if (lexval=='0') lexval= 0; } next(); return T_CONST; }
  8734                                  
  8735                                  @@getlex501:
  8736 000042C1 A1[3600]                 mov ax, [lexval]
  8737 000042C4 83F830                   cmp ax, 48
  8738 000042C7 0F850600                 jne @@getlex502
  8739 000042CB B80000                   mov ax, 0
  8740 000042CE A3[3600]                 mov word [lexval], ax
  8741                                  @@getlex502:
  8742                                  @@getlex499:
  8743 000042D1 E85004                   call next
  8744 000042D4 B80101                   mov ax, 257
  8745 000042D7 E94802                   jmp @@retn
  8746                                  
  8747                                  ;-823   if (letter(c)) { 
  8748                                  
  8749                                  @@getlex498:
  8750 000042DA 8A46FE                   mov al, byte [bp-2]
  8751 000042DD B400                     mov ah, 0
  8752 000042DF 50                       push ax
  8753 000042E0 E875C0                   call letter
  8754 000042E3 83C402                   add  sp, 2
  8755 000042E6 08C0                     or  al, al
  8756 000042E8 0F842D02                 je @@getlex503
  8757                                  
  8758                                  ;-824     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;
  8759                                  
  8760 000042EC 8D062B81                 lea  ax, [symbol]
  8761 000042F0 50                       push ax
  8762 000042F1 8D06DCD0                 lea  ax, [symboltemp]
  8763 000042F5 50                       push ax
  8764 000042F6 E88ABE                   call strcpy
  8765 000042F9 83C404                   add  sp, 4
  8766 000042FC B82B81                   mov ax, symbol
  8767 000042FF 8946FC                   mov [bp-4], ax
  8768 00004302 8A46FE                   mov al, [bp-2]
  8769 00004305 8B5EFC                   mov  bx, [bp-4]
  8770 00004308 8807                     mov  [bx], al
  8771 0000430A FF46FC                   inc  word[bp-4]
  8772                                  
  8773                                  ;-825     while(letter(thechar)) {c=next(); *p=c;  p++; } 
  8774                                  
  8775                                  @@getlex504:
  8776 0000430D A0[2700]                 mov al, byte [thechar]
  8777 00004310 B400                     mov ah, 0
  8778 00004312 50                       push ax
  8779 00004313 E842C0                   call letter
  8780 00004316 83C402                   add  sp, 2
  8781 00004319 08C0                     or  al, al
  8782 0000431B 0F841300                 je @@getlex505
  8783 0000431F E80204                   call next
  8784 00004322 8846FE                   mov [bp-2], al
  8785 00004325 8A46FE                   mov al, [bp-2]
  8786 00004328 8B5EFC                   mov  bx, [bp-4]
  8787 0000432B 8807                     mov  [bx], al
  8788 0000432D FF46FC                   inc  word[bp-4]
  8789                                  
  8790                                  ;-826       *p=0;
  8791                                  
  8792 00004330 EBDB                     jmp @@getlex504
  8793                                  @@getlex505:
  8794 00004332 B80000                   mov ax, 0
  8795 00004335 8B5EFC                   mov  bx, [bp-4]
  8796 00004338 8807                     mov  [bx], al
  8797                                  
  8798                                  ;-827     if (eqstr(symbol,"signed"  )) return T_SIGNED;
  8799                                  
  8800 0000433A 68[3A45]                 push getlex_1
  8801 0000433D 8D062B81                 lea  ax, [symbol]
  8802 00004341 50                       push ax
  8803 00004342 E86EBE                   call eqstr
  8804 00004345 83C404                   add  sp, 4
  8805 00004348 08C0                     or  al, al
  8806 0000434A 0F840600                 je @@getlex506
  8807 0000434E B81302                   mov ax, 531
  8808 00004351 E9CE01                   jmp @@retn
  8809                                  
  8810                                  ;-828     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;
  8811                                  
  8812                                  @@getlex506:
  8813 00004354 68[4145]                 push getlex_2
  8814 00004357 8D062B81                 lea  ax, [symbol]
  8815 0000435B 50                       push ax
  8816 0000435C E854BE                   call eqstr
  8817 0000435F 83C404                   add  sp, 4
  8818 00004362 08C0                     or  al, al
  8819 00004364 0F840600                 je @@getlex507
  8820 00004368 B81402                   mov ax, 532
  8821 0000436B E9B401                   jmp @@retn
  8822                                  
  8823                                  ;-829     if (eqstr(symbol,"void"    )) return T_VOID;
  8824                                  
  8825                                  @@getlex507:
  8826 0000436E 68[4A45]                 push getlex_3
  8827 00004371 8D062B81                 lea  ax, [symbol]
  8828 00004375 50                       push ax
  8829 00004376 E83ABE                   call eqstr
  8830 00004379 83C404                   add  sp, 4
  8831 0000437C 08C0                     or  al, al
  8832 0000437E 0F840600                 je @@getlex508
  8833 00004382 B81102                   mov ax, 529
  8834 00004385 E99A01                   jmp @@retn
  8835                                  
  8836                                  ;-830     if (eqstr(symbol,"int"     )) return T_INT;
  8837                                  
  8838                                  @@getlex508:
  8839 00004388 68[4F45]                 push getlex_4
  8840 0000438B 8D062B81                 lea  ax, [symbol]
  8841 0000438F 50                       push ax
  8842 00004390 E820BE                   call eqstr
  8843 00004393 83C404                   add  sp, 4
  8844 00004396 08C0                     or  al, al
  8845 00004398 0F840600                 je @@getlex509
  8846 0000439C B80502                   mov ax, 517
  8847 0000439F E98001                   jmp @@retn
  8848                                  
  8849                                  ;-831     if (eqstr(symbol,"long"    )) return T_LONG;
  8850                                  
  8851                                  @@getlex509:
  8852 000043A2 68[5345]                 push getlex_5
  8853 000043A5 8D062B81                 lea  ax, [symbol]
  8854 000043A9 50                       push ax
  8855 000043AA E806BE                   call eqstr
  8856 000043AD 83C404                   add  sp, 4
  8857 000043B0 08C0                     or  al, al
  8858 000043B2 0F840600                 je @@getlex510
  8859 000043B6 B81502                   mov ax, 533
  8860 000043B9 E96601                   jmp @@retn
  8861                                  
  8862                                  ;-832     if (eqstr(symbol,"char"    )) return T_CHAR;
  8863                                  
  8864                                  @@getlex510:
  8865 000043BC 68[5845]                 push getlex_6
  8866 000043BF 8D062B81                 lea  ax, [symbol]
  8867 000043C3 50                       push ax
  8868 000043C4 E8ECBD                   call eqstr
  8869 000043C7 83C404                   add  sp, 4
  8870 000043CA 08C0                     or  al, al
  8871 000043CC 0F840600                 je @@getlex511
  8872 000043D0 B81202                   mov ax, 530
  8873 000043D3 E94C01                   jmp @@retn
  8874                                  
  8875                                  ;-833     if (eqstr(symbol,"asm"     )) return T_ASM;
  8876                                  
  8877                                  @@getlex511:
  8878 000043D6 68[5D45]                 push getlex_7
  8879 000043D9 8D062B81                 lea  ax, [symbol]
  8880 000043DD 50                       push ax
  8881 000043DE E8D2BD                   call eqstr
  8882 000043E1 83C404                   add  sp, 4
  8883 000043E4 08C0                     or  al, al
  8884 000043E6 0F840600                 je @@getlex512
  8885 000043EA B80602                   mov ax, 518
  8886 000043ED E93201                   jmp @@retn
  8887                                  
  8888                                  ;-834     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;
  8889                                  
  8890                                  @@getlex512:
  8891 000043F0 68[6145]                 push getlex_8
  8892 000043F3 8D062B81                 lea  ax, [symbol]
  8893 000043F7 50                       push ax
  8894 000043F8 E8B8BD                   call eqstr
  8895 000043FB 83C404                   add  sp, 4
  8896 000043FE 08C0                     or  al, al
  8897 00004400 0F840600                 je @@getlex513
  8898 00004404 B80702                   mov ax, 519
  8899 00004407 E91801                   jmp @@retn
  8900                                  
  8901                                  ;-835     if (eqstr(symbol,"__emit__")) return T_EMIT;
  8902                                  
  8903                                  @@getlex513:
  8904 0000440A 68[6745]                 push getlex_9
  8905 0000440D 8D062B81                 lea  ax, [symbol]
  8906 00004411 50                       push ax
  8907 00004412 E89EBD                   call eqstr
  8908 00004415 83C404                   add  sp, 4
  8909 00004418 08C0                     or  al, al
  8910 0000441A 0F840600                 je @@getlex514
  8911 0000441E B80802                   mov ax, 520
  8912 00004421 E9FE00                   jmp @@retn
  8913                                  
  8914                                  ;-836     if (eqstr(symbol,"return"  )) return T_RETURN;
  8915                                  
  8916                                  @@getlex514:
  8917 00004424 68[7045]                 push getlex_10
  8918 00004427 8D062B81                 lea  ax, [symbol]
  8919 0000442B 50                       push ax
  8920 0000442C E884BD                   call eqstr
  8921 0000442F 83C404                   add  sp, 4
  8922 00004432 08C0                     or  al, al
  8923 00004434 0F840600                 je @@getlex515
  8924 00004438 B80002                   mov ax, 512
  8925 0000443B E9E400                   jmp @@retn
  8926                                  
  8927                                  ;-837     if (eqstr(symbol,"if"      )) return T_IF;
  8928                                  
  8929                                  @@getlex515:
  8930 0000443E 68[7745]                 push getlex_11
  8931 00004441 8D062B81                 lea  ax, [symbol]
  8932 00004445 50                       push ax
  8933 00004446 E86ABD                   call eqstr
  8934 00004449 83C404                   add  sp, 4
  8935 0000444C 08C0                     or  al, al
  8936 0000444E 0F840600                 je @@getlex516
  8937 00004452 B80102                   mov ax, 513
  8938 00004455 E9CA00                   jmp @@retn
  8939                                  
  8940                                  ;-838     if (eqstr(symbol,"else"    )) return T_ELSE;
  8941                                  
  8942                                  @@getlex516:
  8943 00004458 68[7A45]                 push getlex_12
  8944 0000445B 8D062B81                 lea  ax, [symbol]
  8945 0000445F 50                       push ax
  8946 00004460 E850BD                   call eqstr
  8947 00004463 83C404                   add  sp, 4
  8948 00004466 08C0                     or  al, al
  8949 00004468 0F840600                 je @@getlex517
  8950 0000446C B80202                   mov ax, 514
  8951 0000446F E9B000                   jmp @@retn
  8952                                  
  8953                                  ;-839     if (eqstr(symbol,"while"   )) return T_WHILE;
  8954                                  
  8955                                  @@getlex517:
  8956 00004472 68[7F45]                 push getlex_13
  8957 00004475 8D062B81                 lea  ax, [symbol]
  8958 00004479 50                       push ax
  8959 0000447A E836BD                   call eqstr
  8960 0000447D 83C404                   add  sp, 4
  8961 00004480 08C0                     or  al, al
  8962 00004482 0F840600                 je @@getlex518
  8963 00004486 B80302                   mov ax, 515
  8964 00004489 E99600                   jmp @@retn
  8965                                  
  8966                                  ;-840     if (eqstr(symbol,"do"      )) return T_DO;
  8967                                  
  8968                                  @@getlex518:
  8969 0000448C 68[8545]                 push getlex_14
  8970 0000448F 8D062B81                 lea  ax, [symbol]
  8971 00004493 50                       push ax
  8972 00004494 E81CBD                   call eqstr
  8973 00004497 83C404                   add  sp, 4
  8974 0000449A 08C0                     or  al, al
  8975 0000449C 0F840600                 je @@getlex519
  8976 000044A0 B80402                   mov ax, 516
  8977 000044A3 E97C00                   jmp @@retn
  8978                                  
  8979                                  ;-841     if (eqstr(symbol,"goto"    )) return T_GOTO;
  8980                                  
  8981                                  @@getlex519:
  8982 000044A6 68[8845]                 push getlex_15
  8983 000044A9 8D062B81                 lea  ax, [symbol]
  8984 000044AD 50                       push ax
  8985 000044AE E802BD                   call eqstr
  8986 000044B1 83C404                   add  sp, 4
  8987 000044B4 08C0                     or  al, al
  8988 000044B6 0F840600                 je @@getlex520
  8989 000044BA B80902                   mov ax, 521
  8990 000044BD E96200                   jmp @@retn
  8991                                  
  8992                                  ;-842     if (eqstr(symbol,"define"  )) return T_DEFINE;   
  8993                                  
  8994                                  @@getlex520:
  8995 000044C0 68[8D45]                 push getlex_16
  8996 000044C3 8D062B81                 lea  ax, [symbol]
  8997 000044C7 50                       push ax
  8998 000044C8 E8E8BC                   call eqstr
  8999 000044CB 83C404                   add  sp, 4
  9000 000044CE 08C0                     or  al, al
  9001 000044D0 0F840600                 je @@getlex521
  9002 000044D4 B8FF01                   mov ax, 511
  9003 000044D7 E94800                   jmp @@retn
  9004                                  
  9005                                  ;-843     if (eqstr(symbol,"include" )) return T_INCLUDE;   
  9006                                  
  9007                                  @@getlex521:
  9008 000044DA 68[9445]                 push getlex_17
  9009 000044DD 8D062B81                 lea  ax, [symbol]
  9010 000044E1 50                       push ax
  9011 000044E2 E8CEBC                   call eqstr
  9012 000044E5 83C404                   add  sp, 4
  9013 000044E8 08C0                     or  al, al
  9014 000044EA 0F840600                 je @@getlex522
  9015 000044EE B8FE01                   mov ax, 510
  9016 000044F1 E92E00                   jmp @@retn
  9017                                  
  9018                                  ;-844     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}
  9019                                  
  9020                                  @@getlex522:
  9021 000044F4 E8BF00                   call convertdefine
  9022 000044F7 08C0                     or  al, al
  9023 000044F9 0F841600                 je @@getlex523
  9024 000044FD 8D06DCD0                 lea  ax, [symboltemp]
  9025 00004501 50                       push ax
  9026 00004502 8D062B81                 lea  ax, [symbol]
  9027 00004506 50                       push ax
  9028 00004507 E879BC                   call strcpy
  9029 0000450A 83C404                   add  sp, 4
  9030 0000450D B80101                   mov ax, 257
  9031 00004510 E90F00                   jmp @@retn
  9032                                  
  9033                                  ;-845     return T_NAME; } error1("Input item not recognized"); }
  9034                                  
  9035                                  @@getlex523:
  9036 00004513 B80001                   mov ax, 256
  9037 00004516 E90900                   jmp @@retn
  9038                                  @@getlex503:
  9039 00004519 68[9C45]                 push getlex_18
  9040 0000451C E84106                   call error1
  9041 0000451F 83C402                   add  sp, 2
  9042                                  
  9043                                  ;-846 
  9044                                  
  9045                                  
  9046                                  ;-847 int convertdefine() { int i; int j;   i=0;
  9047                                  
  9048 00004522 C9                      @@retn: LEAVE
  9049 00004523 C3                       ret
  9050                                  ; ENDP
  9051 00004524 28295B5D7B7D2C3B2A-     getlex_0 db "()[]{},;*:%-><=+!&|#?",0
  9052 0000452D 3A252D3E3C3D2B2126-
  9053 00004536 7C233F00           
  9054 0000453A 7369676E656400          getlex_1 db "signed",0
  9055 00004541 756E7369676E656400      getlex_2 db "unsigned",0
  9056 0000454A 766F696400              getlex_3 db "void",0
  9057 0000454F 696E7400                getlex_4 db "int",0
  9058 00004553 6C6F6E6700              getlex_5 db "long",0
  9059 00004558 6368617200              getlex_6 db "char",0
  9060 0000455D 61736D00                getlex_7 db "asm",0
  9061 00004561 5F5F61736D00            getlex_8 db "__asm",0
  9062 00004567 5F5F656D69745F5F00      getlex_9 db "__emit__",0
  9063 00004570 72657475726E00          getlex_10 db "return",0
  9064 00004577 696600                  getlex_11 db "if",0
  9065 0000457A 656C736500              getlex_12 db "else",0
  9066 0000457F 7768696C6500            getlex_13 db "while",0
  9067 00004585 646F00                  getlex_14 db "do",0
  9068 00004588 676F746F00              getlex_15 db "goto",0
  9069 0000458D 646566696E6500          getlex_16 db "define",0
  9070 00004594 696E636C75646500        getlex_17 db "include",0
  9071 0000459C 496E70757420697465-     getlex_18 db "Input item not recognized",0
  9072 000045A5 6D206E6F7420726563-
  9073 000045AE 6F676E697A656400   
  9074                                  
  9075                                  convertdefine:  ; *** PROC ***
  9076                                  ;Function : convertdefine, Number of local variables: 2
  9077                                  ;   # type sign width addr used name   list of local variables
  9078                                  ;  200 var sign word   847 NULL i = bp-2
  9079                                  ;  201 var sign word   847 NULL j = bp-4;
  9080 000045B6 C8040000                 ENTER  4,0
  9081 000045BA B80000                   mov ax, 0
  9082 000045BD 8946FE                   mov [bp-2], ax
  9083                                  
  9084                                  ;-848   while (i < GTop) {
  9085                                  
  9086                                  @@convertdefine524:
  9087 000045C0 8B46FE                   mov ax, [bp-2]
  9088 000045C3 3B06[3200]               cmp ax, [GTop]
  9089 000045C7 0F8D4400                 jge @@convertdefine525
  9090                                  
  9091                                  ;-849    j=adrofname(i); 
  9092                                  
  9093 000045CB FF76FE                   push word [bp-2]
  9094 000045CE E8CDC3                   call adrofname
  9095 000045D1 83C402                   add  sp, 2
  9096 000045D4 8946FC                   mov [bp-4], ax
  9097                                  
  9098                                  ;-850    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];
  9099                                  
  9100 000045D7 FF76FC                   push word [bp-4]
  9101 000045DA 8D062B81                 lea  ax, [symbol]
  9102 000045DE 50                       push ax
  9103 000045DF E8D1BB                   call eqstr
  9104 000045E2 83C404                   add  sp, 4
  9105 000045E5 08C0                     or  al, al
  9106 000045E7 0F841F00                 je @@convertdefine526
  9107 000045EB 8B5EFE                   mov bx, [bp-2]
  9108 000045EE 8A87B782                 mov al, [GType + bx]
  9109 000045F2 3C23                     cmp al, 35
  9110 000045F4 0F851200                 jne @@convertdefine527
  9111 000045F8 8B5EFE                   mov bx, [bp-2]
  9112 000045FB D1E3                     shl bx, 1
  9113 000045FD 8B87EB8A                 mov ax, [GData + bx]
  9114 00004601 A3[3600]                 mov word [lexval], ax
  9115                                  
  9116                                  ;-851    return T_CONST; } }
  9117                                  
  9118 00004604 B80101                   mov ax, 257
  9119 00004607 E90B00                   jmp @@retn
  9120                                  @@convertdefine527:
  9121                                  
  9122                                  ;-852    i++; } 
  9123                                  
  9124                                  @@convertdefine526:
  9125 0000460A FF46FE                   inc  word[bp-2]
  9126                                  
  9127                                  ;-853    return 0; }
  9128                                  
  9129 0000460D EBB1                     jmp @@convertdefine524
  9130                                  @@convertdefine525:
  9131 0000460F B80000                   mov ax, 0
  9132 00004612 E90000                   jmp @@retn
  9133                                  
  9134                                  ;-854 int getdigit(char c) { int i;
  9135                                  
  9136 00004615 C9                      @@retn: LEAVE
  9137 00004616 C3                       ret
  9138                                  ; ENDP
  9139                                  
  9140                                  getdigit:  ; *** PROC ***
  9141                                  
  9142                                  ;-855     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char
  9143                                  
  9144                                  ;Function : getdigit, Number of local variables: 2
  9145                                  ;   # type sign width addr used name   list of local variables
  9146                                  ;  200 var sign byte   854 NULL c = bp+4
  9147                                  ;  201 var sign word   854 NULL i = bp-2;
  9148 00004617 C8020000                 ENTER  2,0
  9149 0000461B B80000                   mov ax, 0
  9150 0000461E A3[3600]                 mov word [lexval], ax
  9151 00004621 8A4604                   mov al, [bp+4]
  9152 00004624 2C30                     sub al, 48
  9153 00004626 A3[3600]                 mov word [lexval], ax
  9154                                  
  9155                                  ;-856     if (thechar=='x') thechar='X'; if (thechar=='X') { next();
  9156                                  
  9157 00004629 A0[2700]                 mov al, [thechar]
  9158 0000462C 3C78                     cmp al, 120
  9159 0000462E 0F850600                 jne @@getdigit528
  9160 00004632 B85800                   mov ax, 88
  9161 00004635 A2[2700]                 mov byte [thechar], al
  9162                                  @@getdigit528:
  9163 00004638 A0[2700]                 mov al, [thechar]
  9164 0000463B 3C58                     cmp al, 88
  9165 0000463D 0F856800                 jne @@getdigit529
  9166 00004641 E8E000                   call next
  9167                                  
  9168                                  ;-857       while(letter(thechar)) { c=next(); if(c>96) c=c-39;
  9169                                  
  9170                                  @@getdigit530:
  9171 00004644 A0[2700]                 mov al, byte [thechar]
  9172 00004647 B400                     mov ah, 0
  9173 00004649 50                       push ax
  9174 0000464A E80BBD                   call letter
  9175 0000464D 83C402                   add  sp, 2
  9176 00004650 08C0                     or  al, al
  9177 00004652 0F845000                 je @@getdigit531
  9178 00004656 E8CB00                   call next
  9179 00004659 884604                   mov [bp+4], al
  9180 0000465C 8A4604                   mov al, [bp+4]
  9181 0000465F 3C60                     cmp al, 96
  9182 00004661 0F8E0800                 jle @@getdigit532
  9183 00004665 8A4604                   mov al, [bp+4]
  9184 00004668 2C27                     sub al, 39
  9185 0000466A 884604                   mov [bp+4], al
  9186                                  
  9187                                  ;-858 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16
  9188                                  
  9189                                  @@getdigit532:
  9190 0000466D 8A4604                   mov al, [bp+4]
  9191 00004670 3C40                     cmp al, 64
  9192 00004672 0F8E0800                 jle @@getdigit533
  9193 00004676 8A4604                   mov al, [bp+4]
  9194 00004679 2C07                     sub al, 7
  9195 0000467B 884604                   mov [bp+4], al
  9196                                  @@getdigit533:
  9197 0000467E 8A4604                   mov al, [bp+4]
  9198 00004681 2C30                     sub al, 48
  9199 00004683 884604                   mov [bp+4], al
  9200 00004686 A1[3600]                 mov ax, [lexval]
  9201 00004689 C1E004                   shl ax, 4
  9202 0000468C A3[3600]                 mov word [lexval], ax
  9203                                  
  9204                                  ;-859      i=0; i=c; lexval=lexval+i;}
  9205                                  
  9206 0000468F B80000                   mov ax, 0
  9207 00004692 8946FE                   mov [bp-2], ax
  9208 00004695 8A4604                   mov al, [bp+4]
  9209 00004698 8946FE                   mov [bp-2], ax
  9210 0000469B A1[3600]                 mov ax, [lexval]
  9211 0000469E 0346FE                   add ax, [bp-2]
  9212 000046A1 A3[3600]                 mov word [lexval], ax
  9213                                  
  9214                                  ;-860     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10; 
  9215                                  
  9216 000046A4 EB9E                     jmp @@getdigit530
  9217                                  @@getdigit531:
  9218 000046A6 E94200                   jmp @@getdigit534
  9219                                  @@getdigit529:
  9220                                  @@getdigit535:
  9221 000046A9 A0[2700]                 mov al, byte [thechar]
  9222 000046AC B400                     mov ah, 0
  9223 000046AE 50                       push ax
  9224 000046AF E87CBC                   call digit
  9225 000046B2 83C402                   add  sp, 2
  9226 000046B5 08C0                     or  al, al
  9227 000046B7 0F843000                 je @@getdigit536
  9228 000046BB E86600                   call next
  9229 000046BE 884604                   mov [bp+4], al
  9230 000046C1 8A4604                   mov al, [bp+4]
  9231 000046C4 2C30                     sub al, 48
  9232 000046C6 884604                   mov [bp+4], al
  9233 000046C9 A1[3600]                 mov ax, [lexval]
  9234 000046CC BB0A00                   mov bx, 10
  9235 000046CF F7E3                     mul bx
  9236 000046D1 A3[3600]                 mov word [lexval], ax
  9237                                  
  9238                                  ;-861      i=0; i=c; lexval=lexval+i; } } 
  9239                                  
  9240 000046D4 B80000                   mov ax, 0
  9241 000046D7 8946FE                   mov [bp-2], ax
  9242 000046DA 8A4604                   mov al, [bp+4]
  9243 000046DD 8946FE                   mov [bp-2], ax
  9244 000046E0 A1[3600]                 mov ax, [lexval]
  9245 000046E3 0346FE                   add ax, [bp-2]
  9246 000046E6 A3[3600]                 mov word [lexval], ax
  9247 000046E9 EBBE                     jmp @@getdigit535
  9248                                  @@getdigit536:
  9249                                  
  9250                                  ;-862 }
  9251                                  
  9252                                  @@getdigit534:
  9253                                  
  9254                                  ;-863 int getstring(int delim) {int c; char *p;  p=&symbol; c=next();
  9255 000046EB C9                       LEAVE
  9256 000046EC C3                       ret
  9257                                  ; ENDP
  9258                                  
  9259                                  getstring:  ; *** PROC ***
  9260                                  ;Function : getstring, Number of local variables: 3
  9261                                  ;   # type sign width addr used name   list of local variables
  9262                                  ;  200 var sign word   863 NULL delim = bp+4
  9263                                  ;  201 var sign word   863 NULL c = bp-2
  9264                                  ;  202 ptr sign byte   863 NULL p = bp-4;
  9265 000046ED C8040000                 ENTER  4,0
  9266 000046F1 B82B81                   mov ax, symbol
  9267 000046F4 8946FC                   mov [bp-4], ax
  9268 000046F7 E82A00                   call next
  9269 000046FA 8946FE                   mov [bp-2], ax
  9270                                  
  9271                                  ;-864   while (c != delim) {*p=c; p++; c=next(); } *p=0; }
  9272                                  
  9273                                  @@getstring537:
  9274 000046FD 8B46FE                   mov ax, [bp-2]
  9275 00004700 3B4604                   cmp ax, [bp+4]
  9276 00004703 0F841300                 je  @@getstring538
  9277 00004707 8B46FE                   mov ax, [bp-2]
  9278 0000470A 8B5EFC                   mov  bx, [bp-4]
  9279 0000470D 8807                     mov  [bx], al
  9280 0000470F FF46FC                   inc  word[bp-4]
  9281 00004712 E80F00                   call next
  9282 00004715 8946FE                   mov [bp-2], ax
  9283 00004718 EBE3                     jmp @@getstring537
  9284                                  @@getstring538:
  9285 0000471A B80000                   mov ax, 0
  9286 0000471D 8B5EFC                   mov  bx, [bp-4]
  9287 00004720 8807                     mov  [bx], al
  9288                                  
  9289                                  ;-865 
  9290                                  
  9291                                  
  9292                                  ;-866 int next() {char r; r = thechar; globC=r; thechar = fgets1(); return r; }
  9293 00004722 C9                       LEAVE
  9294 00004723 C3                       ret
  9295                                  ; ENDP
  9296                                  
  9297                                  next:  ; *** PROC ***
  9298                                  ;Function : next, Number of local variables: 1
  9299                                  ;   # type sign width addr used name   list of local variables
  9300                                  ;  200 var sign byte   866 NULL r = bp-2;
  9301 00004724 C8020000                 ENTER  2,0
  9302 00004728 A0[2700]                 mov al, [thechar]
  9303 0000472B 8846FE                   mov [bp-2], al
  9304 0000472E 8A46FE                   mov al, [bp-2]
  9305 00004731 A2[2400]                 mov byte [globC], al
  9306 00004734 E83303                   call fgets1
  9307 00004737 A2[2700]                 mov byte [thechar], al
  9308 0000473A 8A46FE                   mov al, [bp-2]
  9309 0000473D E90000                   jmp @@retn
  9310                                  
  9311                                  ;-867 int istoken(int t) {if (token == t) { token=getlex(); return 1; } return 0;}
  9312                                  
  9313 00004740 C9                      @@retn: LEAVE
  9314 00004741 C3                       ret
  9315                                  ; ENDP
  9316                                  
  9317                                  istoken:  ; *** PROC ***
  9318                                  ;Function : istoken, Number of local variables: 1
  9319                                  ;   # type sign width addr used name   list of local variables
  9320                                  ;  200 var sign word   867 NULL t = bp+4;
  9321 00004742 C8000000                 ENTER  0,0
  9322 00004746 A1[2200]                 mov ax, [token]
  9323 00004749 3B4604                   cmp ax, [bp+4]
  9324 0000474C 0F850C00                 jne @@istoken539
  9325 00004750 E8CBF8                   call getlex
  9326 00004753 A3[2200]                 mov word [token], ax
  9327 00004756 B80100                   mov ax, 1
  9328 00004759 E90600                   jmp @@retn
  9329                                  @@istoken539:
  9330 0000475C B80000                   mov ax, 0
  9331 0000475F E90000                   jmp @@retn
  9332                                  
  9333                                  ;-868 int expect(int t) {if (istoken(t)==0) { *cloc=0; prs(co); listproc();
  9334                                  
  9335 00004762 C9                      @@retn: LEAVE
  9336 00004763 C3                       ret
  9337                                  ; ENDP
  9338                                  
  9339                                  expect:  ; *** PROC ***
  9340                                  ;Function : expect, Number of local variables: 1
  9341                                  ;   # type sign width addr used name   list of local variables
  9342                                  ;  200 var sign word   868 NULL t = bp+4;
  9343 00004764 C8000000                 ENTER  0,0
  9344 00004768 FF7604                   push word [bp+4]
  9345 0000476B E8D4FF                   call istoken
  9346 0000476E 83C402                   add  sp, 2
  9347 00004771 83F800                   cmp ax, 0
  9348 00004774 0F853200                 jne @@expect540
  9349 00004778 B80000                   mov ax, 0
  9350 0000477B 8B1E[1C00]               mov  bx, [cloc]
  9351 0000477F 8807                     mov  [bx], al
  9352 00004781 8D063075                 lea  ax, [co]
  9353 00004785 50                       push ax
  9354 00004786 E8EE00                   call prs
  9355 00004789 83C402                   add  sp, 2
  9356 0000478C E8D304                   call listproc
  9357                                  
  9358                                  ;-869   prs("\nExpected ASCII(dez): "); pint1(t); error1(" not found"); } }
  9359                                  
  9360 0000478F 68[AC47]                 push expect_0
  9361 00004792 E8E200                   call prs
  9362 00004795 83C402                   add  sp, 2
  9363 00004798 FF7604                   push word [bp+4]
  9364 0000479B E8D001                   call pint1
  9365 0000479E 83C402                   add  sp, 2
  9366 000047A1 68[C447]                 push expect_1
  9367 000047A4 E8B903                   call error1
  9368 000047A7 83C402                   add  sp, 2
  9369                                  @@expect540:
  9370                                  
  9371                                  ;-870 
  9372                                  
  9373                                  
  9374                                  ;-871 int eprc(char c)  {*cloc=c; cloc++; }
  9375 000047AA C9                       LEAVE
  9376 000047AB C3                       ret
  9377                                  ; ENDP
  9378 000047AC 5C6E45787065637465-     expect_0 db "\nExpected ASCII(dez): ",0
  9379 000047B5 642041534349492864-
  9380 000047BE 657A293A2000       
  9381 000047C4 206E6F7420666F756E-     expect_1 db " not found",0
  9382 000047CD 6400               
  9383                                  
  9384                                  eprc:  ; *** PROC ***
  9385                                  ;Function : eprc, Number of local variables: 1
  9386                                  ;   # type sign width addr used name   list of local variables
  9387                                  ;  200 var sign byte   871 NULL c = bp+4;
  9388 000047CF C8000000                 ENTER  0,0
  9389 000047D3 8A4604                   mov al, [bp+4]
  9390 000047D6 8B1E[1C00]               mov  bx, [cloc]
  9391 000047DA 8807                     mov  [bx], al
  9392 000047DC FF06[1C00]               inc  word[cloc]
  9393                                  
  9394                                  ;-872 int eprs(char *s) {char c;  while(*s) { c=*s; eprc(c); s++; } }
  9395 000047E0 C9                       LEAVE
  9396 000047E1 C3                       ret
  9397                                  ; ENDP
  9398                                  
  9399                                  eprs:  ; *** PROC ***
  9400                                  ;Function : eprs, Number of local variables: 2
  9401                                  ;   # type sign width addr used name   list of local variables
  9402                                  ;  200 ptr sign byte   872 NULL s = bp+4
  9403                                  ;  201 var sign byte   872 NULL c = bp-2;
  9404 000047E2 C8020000                 ENTER  2,0
  9405                                  @@eprs541:
  9406 000047E6 8B5E04                   mov bx, [bp+4]
  9407 000047E9 8A07                     mov al, [bx]
  9408 000047EB B400                     mov ah, 0
  9409 000047ED 08C0                     or  al, al
  9410 000047EF 0F841B00                 je @@eprs542
  9411 000047F3 8B5E04                   mov bx, [bp+4]
  9412 000047F6 8A07                     mov al, [bx]
  9413 000047F8 B400                     mov ah, 0
  9414 000047FA 8846FE                   mov [bp-2], al
  9415 000047FD 8A46FE                   mov al, byte [bp-2]
  9416 00004800 B400                     mov ah, 0
  9417 00004802 50                       push ax
  9418 00004803 E8C9FF                   call eprc
  9419 00004806 83C402                   add  sp, 2
  9420 00004809 FF4604                   inc  word[bp+4]
  9421 0000480C EBD8                     jmp @@eprs541
  9422                                  @@eprs542:
  9423                                  
  9424                                  ;-873 int prc(unsigned char c) { 
  9425 0000480E C9                       LEAVE
  9426 0000480F C3                       ret
  9427                                  ; ENDP
  9428                                  
  9429                                  prc:  ; *** PROC ***
  9430                                  
  9431                                  ;-874   if (c==10) {_AX=13; writetty(); }
  9432                                  
  9433                                  ;Function : prc, Number of local variables: 1
  9434                                  ;   # type sign width addr used name   list of local variables
  9435                                  ;  200 var unsg byte   873 NULL c = bp+4;
  9436 00004810 C8000000                 ENTER  0,0
  9437 00004814 8A4604                   mov al, [bp+4]
  9438 00004817 3C0A                     cmp al, 10
  9439 00004819 0F850600                 jne @@prc543
  9440 0000481D B80D00                   mov  ax, 13
  9441 00004820 E858B8                   call writetty
  9442                                  
  9443                                  ;-875   _AL=c; writetty(); 
  9444                                  
  9445                                  @@prc543:
  9446 00004823 8A4604                   mov  al, [bp+4]
  9447 00004826 E852B8                   call writetty
  9448                                  
  9449                                  ;-876   fputcR(c, fdout); 
  9450                                  
  9451 00004829 FF36[2000]               push word [fdout]
  9452 0000482D 8A4604                   mov al, byte [bp+4]
  9453 00004830 B400                     mov ah, 0
  9454 00004832 50                       push ax
  9455 00004833 E810B9                   call fputcR
  9456 00004836 83C404                   add  sp, 4
  9457                                  
  9458                                  ;-877   }
  9459                                  
  9460                                  
  9461                                  ;-878 int prscomment(unsigned char *s) {unsigned char c;
  9462 00004839 C9                       LEAVE
  9463 0000483A C3                       ret
  9464                                  ; ENDP
  9465                                  
  9466                                  prscomment:  ; *** PROC ***
  9467                                  
  9468                                  ;-879   while(*s){c=*s;prc(c);s++;} }
  9469                                  
  9470                                  ;Function : prscomment, Number of local variables: 2
  9471                                  ;   # type sign width addr used name   list of local variables
  9472                                  ;  200 ptr unsg byte   878 NULL s = bp+4
  9473                                  ;  201 var unsg byte   878 NULL c = bp-2;
  9474 0000483B C8020000                 ENTER  2,0
  9475                                  @@prscomment544:
  9476 0000483F 8B5E04                   mov bx, [bp+4]
  9477 00004842 8A07                     mov al, [bx]
  9478 00004844 B400                     mov ah, 0
  9479 00004846 08C0                     or  al, al
  9480 00004848 0F841B00                 je @@prscomment545
  9481 0000484C 8B5E04                   mov bx, [bp+4]
  9482 0000484F 8A07                     mov al, [bx]
  9483 00004851 B400                     mov ah, 0
  9484 00004853 8846FE                   mov [bp-2], al
  9485 00004856 8A46FE                   mov al, byte [bp-2]
  9486 00004859 B400                     mov ah, 0
  9487 0000485B 50                       push ax
  9488 0000485C E8B1FF                   call prc
  9489 0000485F 83C402                   add  sp, 2
  9490 00004862 FF4604                   inc  word[bp+4]
  9491 00004865 EBD8                     jmp @@prscomment544
  9492                                  @@prscomment545:
  9493                                  
  9494                                  ;-880 int prnl() { prs("\n ");}
  9495 00004867 C9                       LEAVE
  9496 00004868 C3                       ret
  9497                                  ; ENDP
  9498                                  
  9499                                  prnl:  ; *** PROC ***
  9500 00004869 68[7348]                 push prnl_0
  9501 0000486C E80800                   call prs
  9502 0000486F 83C402                   add  sp, 2
  9503                                  
  9504                                  ;-881 
  9505                                  
  9506                                  
  9507                                  ;-882 int prs(unsigned char *s) {unsigned char c; int com; com=0;
  9508                                  
  9509 00004872 C3                       ret
  9510                                  ; ENDP
  9511 00004873 5C6E2000                prnl_0 db "\n ",0
  9512                                  
  9513                                  prs:  ; *** PROC ***
  9514                                  ;Function : prs, Number of local variables: 3
  9515                                  ;   # type sign width addr used name   list of local variables
  9516                                  ;  200 ptr unsg byte   882 NULL s = bp+4
  9517                                  ;  201 var unsg byte   882 NULL c = bp-2
  9518                                  ;  202 var sign word   882 NULL com = bp-4;
  9519 00004877 C8040000                 ENTER  4,0
  9520 0000487B B80000                   mov ax, 0
  9521 0000487E 8946FC                   mov [bp-4], ax
  9522                                  
  9523                                  ;-883   while(*s) { c=*s; if (c==34) if (com) com=0; else com=1;
  9524                                  
  9525                                  @@prs546:
  9526 00004881 8B5E04                   mov bx, [bp+4]
  9527 00004884 8A07                     mov al, [bx]
  9528 00004886 B400                     mov ah, 0
  9529 00004888 08C0                     or  al, al
  9530 0000488A 0F847B00                 je @@prs547
  9531 0000488E 8B5E04                   mov bx, [bp+4]
  9532 00004891 8A07                     mov al, [bx]
  9533 00004893 B400                     mov ah, 0
  9534 00004895 8846FE                   mov [bp-2], al
  9535 00004898 8A46FE                   mov al, [bp-2]
  9536 0000489B 3C22                     cmp al, 34
  9537 0000489D 0F851800                 jne @@prs548
  9538 000048A1 8B46FC                   mov ax, [bp-4]
  9539 000048A4 08C0                     or  al, al
  9540 000048A6 0F840900                 je @@prs549
  9541 000048AA B80000                   mov ax, 0
  9542 000048AD 8946FC                   mov [bp-4], ax
  9543 000048B0 E90600                   jmp @@prs550
  9544                                  @@prs549:
  9545 000048B3 B80100                   mov ax, 1
  9546 000048B6 8946FC                   mov [bp-4], ax
  9547                                  
  9548                                  ;-884     if (c==92) { if (com==0) { s++; c=*s;
  9549                                  
  9550                                  @@prs550:
  9551                                  @@prs548:
  9552 000048B9 8A46FE                   mov al, [bp-2]
  9553 000048BC 3C5C                     cmp al, 92
  9554 000048BE 0F853500                 jne @@prs551
  9555 000048C2 8B46FC                   mov ax, [bp-4]
  9556 000048C5 83F800                   cmp ax, 0
  9557 000048C8 0F852B00                 jne @@prs552
  9558 000048CC FF4604                   inc  word[bp+4]
  9559 000048CF 8B5E04                   mov bx, [bp+4]
  9560 000048D2 8A07                     mov al, [bx]
  9561 000048D4 B400                     mov ah, 0
  9562 000048D6 8846FE                   mov [bp-2], al
  9563                                  
  9564                                  ;-885           if (c=='n') c=10; if (c=='t') c= 9;
  9565                                  
  9566 000048D9 8A46FE                   mov al, [bp-2]
  9567 000048DC 3C6E                     cmp al, 110
  9568 000048DE 0F850600                 jne @@prs553
  9569 000048E2 B80A00                   mov ax, 10
  9570 000048E5 8846FE                   mov [bp-2], al
  9571                                  @@prs553:
  9572 000048E8 8A46FE                   mov al, [bp-2]
  9573 000048EB 3C74                     cmp al, 116
  9574 000048ED 0F850600                 jne @@prs554
  9575 000048F1 B80900                   mov ax, 9
  9576 000048F4 8846FE                   mov [bp-2], al
  9577                                  
  9578                                  ;-886     } } prc(c); s++;  } }
  9579                                  
  9580                                  @@prs554:
  9581                                  @@prs552:
  9582                                  @@prs551:
  9583 000048F7 8A46FE                   mov al, byte [bp-2]
  9584 000048FA B400                     mov ah, 0
  9585 000048FC 50                       push ax
  9586 000048FD E810FF                   call prc
  9587 00004900 83C402                   add  sp, 2
  9588 00004903 FF4604                   inc  word[bp+4]
  9589 00004906 E978FF                   jmp @@prs546
  9590                                  @@prs547:
  9591                                  
  9592                                  ;-887 int eprnum(int n){int e; if(n<0) { eprc('-'); n=mkneg(n); }
  9593 00004909 C9                       LEAVE
  9594 0000490A C3                       ret
  9595                                  ; ENDP
  9596                                  
  9597                                  eprnum:  ; *** PROC ***
  9598                                  ;Function : eprnum, Number of local variables: 2
  9599                                  ;   # type sign width addr used name   list of local variables
  9600                                  ;  200 var sign word   887 NULL n = bp+4
  9601                                  ;  201 var sign word   887 NULL e = bp-2;
  9602 0000490B C8020000                 ENTER  2,0
  9603 0000490F 8B4604                   mov ax, [bp+4]
  9604 00004912 83F800                   cmp ax, 0
  9605 00004915 0F8D1400                 jge @@eprnum555
  9606 00004919 6A2D                     push 45
  9607 0000491B E8B1FE                   call eprc
  9608 0000491E 83C402                   add  sp, 2
  9609 00004921 FF7604                   push word [bp+4]
  9610 00004924 E8A3B7                   call mkneg
  9611 00004927 83C402                   add  sp, 2
  9612 0000492A 894604                   mov [bp+4], ax
  9613                                  
  9614                                  ;-888   if (n >= 10) {e=n/10; eprnum(e);}  n=n%10; n=n+'0'; eprc(n); }
  9615                                  
  9616                                  @@eprnum555:
  9617 0000492D 8B4604                   mov ax, [bp+4]
  9618 00004930 83F80A                   cmp ax, 10 ;unsigned : 1
  9619 00004933 0F8C1500                 jl  @@eprnum556
  9620 00004937 8B4604                   mov ax, [bp+4]
  9621 0000493A BB0A00                   mov bx, 10
  9622 0000493D 99                       cwd
  9623 0000493E F7FB                     idiv bx
  9624 00004940 8946FE                   mov [bp-2], ax
  9625 00004943 FF76FE                   push word [bp-2]
  9626 00004946 E8C2FF                   call eprnum
  9627 00004949 83C402                   add  sp, 2
  9628                                  @@eprnum556:
  9629 0000494C 8B4604                   mov ax, [bp+4]
  9630 0000494F BB0A00                   mov bx, 10
  9631 00004952 99                       cwd
  9632 00004953 F7FB                     idiv bx
  9633 00004955 89D0                     mov ax, dx
  9634 00004957 894604                   mov [bp+4], ax
  9635 0000495A 8B4604                   mov ax, [bp+4]
  9636 0000495D 83C030                   add ax, 48
  9637 00004960 894604                   mov [bp+4], ax
  9638 00004963 FF7604                   push word [bp+4]
  9639 00004966 E866FE                   call eprc
  9640 00004969 83C402                   add  sp, 2
  9641                                  
  9642                                  ;-889 int pint1 (int n){int e; if(n<0) {  prc('-');  n=mkneg(n); }
  9643 0000496C C9                       LEAVE
  9644 0000496D C3                       ret
  9645                                  ; ENDP
  9646                                  
  9647                                  pint1:  ; *** PROC ***
  9648                                  ;Function : pint1, Number of local variables: 2
  9649                                  ;   # type sign width addr used name   list of local variables
  9650                                  ;  200 var sign word   889 NULL n = bp+4
  9651                                  ;  201 var sign word   889 NULL e = bp-2;
  9652 0000496E C8020000                 ENTER  2,0
  9653 00004972 8B4604                   mov ax, [bp+4]
  9654 00004975 83F800                   cmp ax, 0
  9655 00004978 0F8D1400                 jge @@pint1557
  9656 0000497C 6A2D                     push 45
  9657 0000497E E88FFE                   call prc
  9658 00004981 83C402                   add  sp, 2
  9659 00004984 FF7604                   push word [bp+4]
  9660 00004987 E840B7                   call mkneg
  9661 0000498A 83C402                   add  sp, 2
  9662 0000498D 894604                   mov [bp+4], ax
  9663                                  
  9664                                  ;-890   if (n >= 10) {e=n/10;  pint1(e);}  n=n%10; n=n+'0'; prc(n); }
  9665                                  
  9666                                  @@pint1557:
  9667 00004990 8B4604                   mov ax, [bp+4]
  9668 00004993 83F80A                   cmp ax, 10 ;unsigned : 1
  9669 00004996 0F8C1500                 jl  @@pint1558
  9670 0000499A 8B4604                   mov ax, [bp+4]
  9671 0000499D BB0A00                   mov bx, 10
  9672 000049A0 99                       cwd
  9673 000049A1 F7FB                     idiv bx
  9674 000049A3 8946FE                   mov [bp-2], ax
  9675 000049A6 FF76FE                   push word [bp-2]
  9676 000049A9 E8C2FF                   call pint1
  9677 000049AC 83C402                   add  sp, 2
  9678                                  @@pint1558:
  9679 000049AF 8B4604                   mov ax, [bp+4]
  9680 000049B2 BB0A00                   mov bx, 10
  9681 000049B5 99                       cwd
  9682 000049B6 F7FB                     idiv bx
  9683 000049B8 89D0                     mov ax, dx
  9684 000049BA 894604                   mov [bp+4], ax
  9685 000049BD 8B4604                   mov ax, [bp+4]
  9686 000049C0 83C030                   add ax, 48
  9687 000049C3 894604                   mov [bp+4], ax
  9688 000049C6 FF7604                   push word [bp+4]
  9689 000049C9 E844FE                   call prc
  9690 000049CC 83C402                   add  sp, 2
  9691                                  
  9692                                  ;-891 int prunsign1(unsigned int n) { unsigned int e;
  9693 000049CF C9                       LEAVE
  9694 000049D0 C3                       ret
  9695                                  ; ENDP
  9696                                  
  9697                                  prunsign1:  ; *** PROC ***
  9698                                  
  9699                                  ;-892   if ( _ n >= 10) {  e=n/10; /*DIV*/ prunsign1(e); }
  9700                                  
  9701                                  ;Function : prunsign1, Number of local variables: 2
  9702                                  ;   # type sign width addr used name   list of local variables
  9703                                  ;  200 var unsg word   891 NULL n = bp+4
  9704                                  ;  201 var unsg word   891 NULL e = bp-2;
  9705 000049D1 C8020000                 ENTER  2,0 ; constant expression
  9706 000049D5 837E040A                cmp word[bp+4], 10 ;unsigned : 0
  9707 000049D9 0F821700                 jb  @@prunsign1559
  9708 000049DD 8B4604                   mov ax, [bp+4]
  9709 000049E0 BB0A00                   mov bx, 10
  9710 000049E3 BA0000                   mov dx, 0
  9711 000049E6 F7F3                     div bx
  9712 000049E8 8946FE                   mov [bp-2], ax
  9713 000049EB FF76FE                   push word [bp-2]
  9714 000049EE E8E0FF                   call prunsign1
  9715 000049F1 83C402                   add  sp, 2
  9716                                  
  9717                                  ;-893     n = n % 10; /*unsigned mod*/   n += '0'; prc(n); }
  9718                                  
  9719                                  @@prunsign1559:
  9720 000049F4 8B4604                   mov ax, [bp+4]
  9721 000049F7 BB0A00                   mov bx, 10
  9722 000049FA BA0000                   mov dx, 0
  9723 000049FD F7F3                     div bx
  9724 000049FF 89D0                     mov ax, dx
  9725 00004A01 894604                   mov [bp+4], ax
  9726 00004A04 83460430                 add  word[bp+4], 48
  9727 00004A08 FF7604                   push word [bp+4]
  9728 00004A0B E802FE                   call prc
  9729 00004A0E 83C402                   add  sp, 2
  9730                                  
  9731                                  ;-894 int printint51(unsigned int j)  {
  9732 00004A11 C9                       LEAVE
  9733 00004A12 C3                       ret
  9734                                  ; ENDP
  9735                                  
  9736                                  printint51:  ; *** PROC ***
  9737                                  
  9738                                  ;-895   if (j<10000) prc(32); if (j<1000) prc(32);  if (j<100) prc(32);
  9739                                  
  9740                                  ;Function : printint51, Number of local variables: 1
  9741                                  ;   # type sign width addr used name   list of local variables
  9742                                  ;  200 var unsg word   894 NULL j = bp+4;
  9743 00004A13 C8000000                 ENTER  0,0
  9744 00004A17 8B4604                   mov ax, [bp+4]
  9745 00004A1A 3D1027                   cmp ax, 10000
  9746 00004A1D 0F8D0800                 jge @@printint51560
  9747 00004A21 6A20                     push 32
  9748 00004A23 E8EAFD                   call prc
  9749 00004A26 83C402                   add  sp, 2
  9750                                  @@printint51560:
  9751 00004A29 8B4604                   mov ax, [bp+4]
  9752 00004A2C 3DE803                   cmp ax, 1000
  9753 00004A2F 0F8D0800                 jge @@printint51561
  9754 00004A33 6A20                     push 32
  9755 00004A35 E8D8FD                   call prc
  9756 00004A38 83C402                   add  sp, 2
  9757                                  @@printint51561:
  9758 00004A3B 8B4604                   mov ax, [bp+4]
  9759 00004A3E 83F864                   cmp ax, 100
  9760 00004A41 0F8D0800                 jge @@printint51562
  9761 00004A45 6A20                     push 32
  9762 00004A47 E8C6FD                   call prc
  9763 00004A4A 83C402                   add  sp, 2
  9764                                  
  9765                                  ;-896    if (j<10) prc(32);  prunsign1(j); }
  9766                                  
  9767                                  @@printint51562:
  9768 00004A4D 8B4604                   mov ax, [bp+4]
  9769 00004A50 83F80A                   cmp ax, 10
  9770 00004A53 0F8D0800                 jge @@printint51563
  9771 00004A57 6A20                     push 32
  9772 00004A59 E8B4FD                   call prc
  9773 00004A5C 83C402                   add  sp, 2
  9774                                  @@printint51563:
  9775 00004A5F FF7604                   push word [bp+4]
  9776 00004A62 E86CFF                   call prunsign1
  9777 00004A65 83C402                   add  sp, 2
  9778                                  
  9779                                  ;-897 
  9780                                  
  9781                                  
  9782                                  ;-898 int fgets1() { char c; c=*fgetsp;
  9783 00004A68 C9                       LEAVE
  9784 00004A69 C3                       ret
  9785                                  ; ENDP
  9786                                  
  9787                                  fgets1:  ; *** PROC ***
  9788                                  ;Function : fgets1, Number of local variables: 1
  9789                                  ;   # type sign width addr used name   list of local variables
  9790                                  ;  200 var sign byte   898 NULL c = bp-2;
  9791 00004A6A C8020000                 ENTER  2,0
  9792 00004A6E 8B1E[6A00]               mov bx, [fgetsp]
  9793 00004A72 8A07                     mov al, [bx]
  9794 00004A74 B400                     mov ah, 0
  9795 00004A76 8846FE                   mov [bp-2], al
  9796                                  
  9797                                  ;-899   if (c==0) { printinputline(); if (DOS_NoBytes == 0) return 0;
  9798                                  
  9799 00004A79 8A46FE                   mov al, [bp-2]
  9800 00004A7C 3C00                     cmp al, 0
  9801 00004A7E 0F852A00                 jne @@fgets1564
  9802 00004A82 E83700                   call printinputline
  9803 00004A85 A1[7800]                 mov ax, [DOS_NoBytes]
  9804 00004A88 83F800                   cmp ax, 0
  9805 00004A8B 0F850600                 jne @@fgets1565
  9806 00004A8F B80000                   mov ax, 0
  9807 00004A92 E92500                   jmp @@retn
  9808                                  
  9809                                  ;-900     fgetsp=&fgetsdest; c=*fgetsp; spalte=0; }
  9810                                  
  9811                                  @@fgets1565:
  9812 00004A95 B80FD0                   mov ax, fgetsdest
  9813 00004A98 A3[6A00]                 mov word [fgetsp], ax
  9814 00004A9B 8B1E[6A00]               mov bx, [fgetsp]
  9815 00004A9F 8A07                     mov al, [bx]
  9816 00004AA1 B400                     mov ah, 0
  9817 00004AA3 8846FE                   mov [bp-2], al
  9818 00004AA6 B80000                   mov ax, 0
  9819 00004AA9 A3[2500]                 mov word [spalte], ax
  9820                                  
  9821                                  ;-901   fgetsp++; spalte++;  return c; }
  9822                                  
  9823                                  @@fgets1564:
  9824 00004AAC FF06[6A00]               inc  word[fgetsp]
  9825 00004AB0 FF06[2500]               inc  word[spalte]
  9826 00004AB4 8A46FE                   mov al, [bp-2]
  9827 00004AB7 E90000                   jmp @@retn
  9828                                  
  9829                                  ;-902 int printinputline() { fgetsp=&fgetsdest;
  9830                                  
  9831 00004ABA C9                      @@retn: LEAVE
  9832 00004ABB C3                       ret
  9833                                  ; ENDP
  9834                                  
  9835                                  printinputline:  ; *** PROC ***
  9836 00004ABC B80FD0                   mov ax, fgetsdest
  9837 00004ABF A3[6A00]                 mov word [fgetsp], ax
  9838                                  
  9839                                  ;-903   do {DOS_NoBytes=readR(&DOS_ByteRead, fdin);
  9840                                  
  9841                                  @@printinputline566:
  9842 00004AC2 FF36[1E00]               push word [fdin]
  9843 00004AC6 8D06[7A00]               lea  ax, [DOS_ByteRead]
  9844 00004ACA 50                       push ax
  9845 00004ACB E84EB6                   call readR
  9846 00004ACE 83C404                   add  sp, 4
  9847 00004AD1 A3[7800]                 mov word [DOS_NoBytes], ax
  9848                                  
  9849                                  ;-904   if (DOS_NoBytes == 0) return; 
  9850                                  
  9851 00004AD4 A1[7800]                 mov ax, [DOS_NoBytes]
  9852 00004AD7 83F800                   cmp ax, 0
  9853 00004ADA 0F850300                 jne @@printinputline567
  9854 00004ADE E95400                   jmp @@retn
  9855                                  
  9856                                  ;-905     *fgetsp=DOS_ByteRead; fgetsp++;} 
  9857                                  
  9858                                  @@printinputline567:
  9859 00004AE1 A0[7A00]                 mov al, [DOS_ByteRead]
  9860 00004AE4 8B1E[6A00]               mov  bx, [fgetsp]
  9861 00004AE8 8807                     mov  [bx], al
  9862 00004AEA FF06[6A00]               inc  word[fgetsp]
  9863                                  
  9864                                  ;-906   while (DOS_ByteRead != 10); *fgetsp=0;
  9865                                  
  9866 00004AEE A0[7A00]                 mov al, [DOS_ByteRead]
  9867 00004AF1 3C0A                     cmp al, 10
  9868 00004AF3 0F840200                 je  @@printinputline568
  9869 00004AF7 EBC9                     jmp @@printinputline566
  9870                                  @@printinputline568:
  9871 00004AF9 B80000                   mov ax, 0
  9872 00004AFC 8B1E[6A00]               mov  bx, [fgetsp]
  9873 00004B00 8807                     mov  [bx], al
  9874                                  
  9875                                  ;-907     if (fdout) { prs("\n\n;-"); prunsign1(lineno); prc(' '); lineno++;
  9876                                  
  9877 00004B02 A1[2000]                 mov ax, [fdout]
  9878 00004B05 08C0                     or  al, al
  9879 00004B07 0F842A00                 je @@printinputline569
  9880 00004B0B 68[364B]                 push printinputline_0
  9881 00004B0E E866FD                   call prs
  9882 00004B11 83C402                   add  sp, 2
  9883 00004B14 FF36[6E00]               push word [lineno]
  9884 00004B18 E8B6FE                   call prunsign1
  9885 00004B1B 83C402                   add  sp, 2
  9886 00004B1E 6A20                     push 32
  9887 00004B20 E8EDFC                   call prc
  9888 00004B23 83C402                   add  sp, 2
  9889 00004B26 FF06[6E00]               inc  word[lineno]
  9890                                  
  9891                                  ;-908       prscomment(&fgetsdest);}
  9892                                  
  9893 00004B2A 8D060FD0                 lea  ax, [fgetsdest]
  9894 00004B2E 50                       push ax
  9895 00004B2F E809FD                   call prscomment
  9896 00004B32 83C402                   add  sp, 2
  9897                                  
  9898                                  ;-909 }
  9899                                  
  9900                                  @@printinputline569:
  9901                                  
  9902                                  ;-910 int end1(int n) {fcloseR(fdin); fcloseR(fdout); exitR(n); }
  9903                                  
  9904                                  @@retn:
  9905 00004B35 C3                       ret
  9906                                  ; ENDP
  9907 00004B36 5C6E5C6E3B2D00          printinputline_0 db "\n\n;-",0
  9908                                  
  9909                                  end1:  ; *** PROC ***
  9910                                  ;Function : end1, Number of local variables: 1
  9911                                  ;   # type sign width addr used name   list of local variables
  9912                                  ;  200 var sign word   910 NULL n = bp+4;
  9913 00004B3D C8000000                 ENTER  0,0
  9914 00004B41 FF36[1E00]               push word [fdin]
  9915 00004B45 E8B7B5                   call fcloseR
  9916 00004B48 83C402                   add  sp, 2
  9917 00004B4B FF36[2000]               push word [fdout]
  9918 00004B4F E8ADB5                   call fcloseR
  9919 00004B52 83C402                   add  sp, 2
  9920 00004B55 FF7604                   push word [bp+4]
  9921 00004B58 E8B3B5                   call exitR
  9922 00004B5B 83C402                   add  sp, 2
  9923                                  
  9924                                  ;-911 int error1(char *s) { 
  9925 00004B5E C9                       LEAVE
  9926 00004B5F C3                       ret
  9927                                  ; ENDP
  9928                                  
  9929                                  error1:  ; *** PROC ***
  9930                                  
  9931                                  ;-912   lineno--;
  9932                                  
  9933                                  ;Function : error1, Number of local variables: 1
  9934                                  ;   # type sign width addr used name   list of local variables
  9935                                  ;  200 ptr sign byte   911 NULL s = bp+4;
  9936 00004B60 C8000000                 ENTER  0,0
  9937 00004B64 FF0E[6E00]               dec  word[lineno]
  9938                                  
  9939                                  ;-913   prnl(); prscomment(&fgetsdest);
  9940                                  
  9941 00004B68 E8FEFC                   call prnl
  9942 00004B6B 8D060FD0                 lea  ax, [fgetsdest]
  9943 00004B6F 50                       push ax
  9944 00004B70 E8C8FC                   call prscomment
  9945 00004B73 83C402                   add  sp, 2
  9946                                  
  9947                                  ;-914   prs(";Line: "); prunsign1(lineno);
  9948                                  
  9949 00004B76 68[094C]                 push error1_0
  9950 00004B79 E8FBFC                   call prs
  9951 00004B7C 83C402                   add  sp, 2
  9952 00004B7F FF36[6E00]               push word [lineno]
  9953 00004B83 E84BFE                   call prunsign1
  9954 00004B86 83C402                   add  sp, 2
  9955                                  
  9956                                  ;-915   prs(" ************** ERROR: "); prs(s);
  9957                                  
  9958 00004B89 68[114C]                 push error1_1
  9959 00004B8C E8E8FC                   call prs
  9960 00004B8F 83C402                   add  sp, 2
  9961 00004B92 FF7604                   push word [bp+4]
  9962 00004B95 E8DFFC                   call prs
  9963 00004B98 83C402                   add  sp, 2
  9964                                  
  9965                                  ;-916   prs("  in column: "); pint1(spalte);
  9966                                  
  9967 00004B9B 68[294C]                 push error1_2
  9968 00004B9E E8D6FC                   call prs
  9969 00004BA1 83C402                   add  sp, 2
  9970 00004BA4 FF36[2500]               push word [spalte]
  9971 00004BA8 E8C3FD                   call pint1
  9972 00004BAB 83C402                   add  sp, 2
  9973                                  
  9974                                  ;-917   prs("\nToken: "); prunsign1(token); prs(", globC: "); prc(globC);
  9975                                  
  9976 00004BAE 68[374C]                 push error1_3
  9977 00004BB1 E8C3FC                   call prs
  9978 00004BB4 83C402                   add  sp, 2
  9979 00004BB7 FF36[2200]               push word [token]
  9980 00004BBB E813FE                   call prunsign1
  9981 00004BBE 83C402                   add  sp, 2
  9982 00004BC1 68[414C]                 push error1_4
  9983 00004BC4 E8B0FC                   call prs
  9984 00004BC7 83C402                   add  sp, 2
  9985 00004BCA A0[2400]                 mov al, byte [globC]
  9986 00004BCD B400                     mov ah, 0
  9987 00004BCF 50                       push ax
  9988 00004BD0 E83DFC                   call prc
  9989 00004BD3 83C402                   add  sp, 2
  9990                                  
  9991                                  ;-918   prs(", thechar: "); pint1(thechar); prs(", symbol: "); prs(symbol);
  9992                                  
  9993 00004BD6 68[4B4C]                 push error1_5
  9994 00004BD9 E89BFC                   call prs
  9995 00004BDC 83C402                   add  sp, 2
  9996 00004BDF A0[2700]                 mov al, byte [thechar]
  9997 00004BE2 B400                     mov ah, 0
  9998 00004BE4 50                       push ax
  9999 00004BE5 E886FD                   call pint1
 10000 00004BE8 83C402                   add  sp, 2
 10001 00004BEB 68[574C]                 push error1_6
 10002 00004BEE E886FC                   call prs
 10003 00004BF1 83C402                   add  sp, 2
 10004 00004BF4 8D062B81                 lea  ax, [symbol]
 10005 00004BF8 50                       push ax
 10006 00004BF9 E87BFC                   call prs
 10007 00004BFC 83C402                   add  sp, 2
 10008                                  
 10009                                  ;-919   end1(1); }
 10010                                  
 10011 00004BFF 6A01                     push 1
 10012 00004C01 E839FF                   call end1
 10013 00004C04 83C402                   add  sp, 2
 10014                                  
 10015                                  ;-920 int listproc() {int i; 
 10016 00004C07 C9                       LEAVE
 10017 00004C08 C3                       ret
 10018                                  ; ENDP
 10019 00004C09 3B4C696E653A2000        error1_0 db ";Line: ",0
 10020 00004C11 202A2A2A2A2A2A2A2A-     error1_1 db " ************** ERROR: ",0
 10021 00004C1A 2A2A2A2A2A2A204552-
 10022 00004C23 524F523A2000       
 10023 00004C29 2020696E20636F6C75-     error1_2 db "  in column: ",0
 10024 00004C32 6D6E3A2000         
 10025 00004C37 5C6E546F6B656E3A20-     error1_3 db "\nToken: ",0
 10026 00004C40 00                 
 10027 00004C41 2C20676C6F62433A20-     error1_4 db ", globC: ",0
 10028 00004C4A 00                 
 10029 00004C4B 2C2074686563686172-     error1_5 db ", thechar: ",0
 10030 00004C54 3A2000             
 10031 00004C57 2C2073796D626F6C3A-     error1_6 db ", symbol: ",0
 10032 00004C60 2000               
 10033                                  
 10034                                  listproc:  ; *** PROC ***
 10035                                  
 10036                                  ;-921   if (LTop > LSTART) {
 10037                                  
 10038                                  ;Function : listproc, Number of local variables: 1
 10039                                  ;   # type sign width addr used name   list of local variables
 10040                                  ;  200 var sign word   920 NULL i = bp-2;
 10041 00004C62 C8020000                 ENTER  2,0
 10042 00004C66 A1[3400]                 mov ax, [LTop]
 10043 00004C69 3DC800                   cmp ax, 200
 10044 00004C6C 0F8E5700                 jle @@listproc570
 10045                                  
 10046                                  ;-922   prs("\n;Function : "); prs(fname);
 10047                                  
 10048 00004C70 68[C94C]                 push listproc_0
 10049 00004C73 E801FC                   call prs
 10050 00004C76 83C402                   add  sp, 2
 10051 00004C79 8D06AB81                 lea  ax, [fname]
 10052 00004C7D 50                       push ax
 10053 00004C7E E8F6FB                   call prs
 10054 00004C81 83C402                   add  sp, 2
 10055                                  
 10056                                  ;-923   prs(", Number of local variables: "); i=LTop - LSTART; prunsign1(i);
 10057                                  
 10058 00004C84 68[D84C]                 push listproc_1
 10059 00004C87 E8EDFB                   call prs
 10060 00004C8A 83C402                   add  sp, 2
 10061 00004C8D A1[3400]                 mov ax, [LTop]
 10062 00004C90 2DC800                   sub ax, 200
 10063 00004C93 8946FE                   mov [bp-2], ax
 10064 00004C96 FF76FE                   push word [bp-2]
 10065 00004C99 E835FD                   call prunsign1
 10066 00004C9C 83C402                   add  sp, 2
 10067                                  
 10068                                  ;-924   prs("\n;   # type sign width addr used name   list of local variables");
 10069                                  
 10070 00004C9F 68[F64C]                 push listproc_2
 10071 00004CA2 E8D2FB                   call prs
 10072 00004CA5 83C402                   add  sp, 2
 10073                                  
 10074                                  ;-925     i=LSTART; 
 10075                                  
 10076 00004CA8 B8C800                   mov ax, 200
 10077 00004CAB 8946FE                   mov [bp-2], ax
 10078                                  
 10079                                  ;-926     while (i < LTop) { listvar(i); i++; } } 
 10080                                  
 10081                                  @@listproc571:
 10082 00004CAE 8B46FE                   mov ax, [bp-2]
 10083 00004CB1 3B06[3400]               cmp ax, [LTop]
 10084 00004CB5 0F8D0E00                 jge @@listproc572
 10085 00004CB9 FF76FE                   push word [bp-2]
 10086 00004CBC E87800                   call listvar
 10087 00004CBF 83C402                   add  sp, 2
 10088 00004CC2 FF46FE                   inc  word[bp-2]
 10089 00004CC5 EBE7                     jmp @@listproc571
 10090                                  @@listproc572:
 10091                                  
 10092                                  ;-927 }
 10093                                  
 10094                                  @@listproc570:
 10095                                  
 10096                                  ;-928 int listvar(unsigned int i) {unsigned int j; char c;
 10097 00004CC7 C9                       LEAVE
 10098 00004CC8 C3                       ret
 10099                                  ; ENDP
 10100 00004CC9 5C6E3B46756E637469-     listproc_0 db "\n;Function : ",0
 10101 00004CD2 6F6E203A2000       
 10102 00004CD8 2C204E756D62657220-     listproc_1 db ", Number of local variables: ",0
 10103 00004CE1 6F66206C6F63616C20-
 10104 00004CEA 7661726961626C6573-
 10105 00004CF3 3A2000             
 10106 00004CF6 5C6E3B202020232074-     listproc_2 db "\n;   # type sign width addr used name   list of local variables",0
 10107 00004CFF 797065207369676E20-
 10108 00004D08 776964746820616464-
 10109 00004D11 722075736564206E61-
 10110 00004D1A 6D652020206C697374-
 10111 00004D23 206F66206C6F63616C-
 10112 00004D2C 207661726961626C65-
 10113 00004D35 7300               
 10114                                  
 10115                                  listvar:  ; *** PROC ***
 10116                                  
 10117                                  ;-929   prs("\n;"); printint51(i); prc(32);
 10118                                  
 10119                                  ;Function : listvar, Number of local variables: 3
 10120                                  ;   # type sign width addr used name   list of local variables
 10121                                  ;  200 var unsg word   928 NULL i = bp+4
 10122                                  ;  201 var unsg word   928 NULL j = bp-2
 10123                                  ;  202 var sign byte   928 NULL c = bp-4;
 10124 00004D37 C8040000                 ENTER  4,0
 10125 00004D3B 68[234F]                 push listvar_0
 10126 00004D3E E836FB                   call prs
 10127 00004D41 83C402                   add  sp, 2
 10128 00004D44 FF7604                   push word [bp+4]
 10129 00004D47 E8C9FC                   call printint51
 10130 00004D4A 83C402                   add  sp, 2
 10131 00004D4D 6A20                     push 32
 10132 00004D4F E8BEFA                   call prc
 10133 00004D52 83C402                   add  sp, 2
 10134                                  
 10135                                  ;-930   c=GType [i]; if(c=='V')prs("var ");   if(c=='*')prs("ptr ");
 10136                                  
 10137 00004D55 8B5E04                   mov bx, [bp+4]
 10138 00004D58 8A87B782                 mov al, [GType + bx]
 10139 00004D5C 8846FC                   mov [bp-4], al
 10140 00004D5F 8A46FC                   mov al, [bp-4]
 10141 00004D62 3C56                     cmp al, 86
 10142 00004D64 0F850900                 jne @@listvar573
 10143 00004D68 68[274F]                 push listvar_1
 10144 00004D6B E809FB                   call prs
 10145 00004D6E 83C402                   add  sp, 2
 10146                                  @@listvar573:
 10147 00004D71 8A46FC                   mov al, [bp-4]
 10148 00004D74 3C2A                     cmp al, 42
 10149 00004D76 0F850900                 jne @@listvar574
 10150 00004D7A 68[2C4F]                 push listvar_2
 10151 00004D7D E8F7FA                   call prs
 10152 00004D80 83C402                   add  sp, 2
 10153                                  
 10154                                  ;-931                if(c=='&')prs("arr ");   if(c=='#')prs("def ");
 10155                                  
 10156                                  @@listvar574:
 10157 00004D83 8A46FC                   mov al, [bp-4]
 10158 00004D86 3C26                     cmp al, 38
 10159 00004D88 0F850900                 jne @@listvar575
 10160 00004D8C 68[314F]                 push listvar_3
 10161 00004D8F E8E5FA                   call prs
 10162 00004D92 83C402                   add  sp, 2
 10163                                  @@listvar575:
 10164 00004D95 8A46FC                   mov al, [bp-4]
 10165 00004D98 3C23                     cmp al, 35
 10166 00004D9A 0F850900                 jne @@listvar576
 10167 00004D9E 68[364F]                 push listvar_4
 10168 00004DA1 E8D3FA                   call prs
 10169 00004DA4 83C402                   add  sp, 2
 10170                                  
 10171                                  ;-932   c=GSign [i]; if(c=='S')prs("sign ");  if(c=='U')prs("unsg ");
 10172                                  
 10173                                  @@listvar576:
 10174 00004DA7 8B5E04                   mov bx, [bp+4]
 10175 00004DAA 8A87E383                 mov al, [GSign + bx]
 10176 00004DAE 8846FC                   mov [bp-4], al
 10177 00004DB1 8A46FC                   mov al, [bp-4]
 10178 00004DB4 3C53                     cmp al, 83
 10179 00004DB6 0F850900                 jne @@listvar577
 10180 00004DBA 68[3B4F]                 push listvar_5
 10181 00004DBD E8B7FA                   call prs
 10182 00004DC0 83C402                   add  sp, 2
 10183                                  @@listvar577:
 10184 00004DC3 8A46FC                   mov al, [bp-4]
 10185 00004DC6 3C55                     cmp al, 85
 10186 00004DC8 0F850900                 jne @@listvar578
 10187 00004DCC 68[414F]                 push listvar_6
 10188 00004DCF E8A5FA                   call prs
 10189 00004DD2 83C402                   add  sp, 2
 10190                                  
 10191                                  ;-933   c=GWidth[i]; if(c==  1)prs("byte " ); if(c==  2)prs("word " );
 10192                                  
 10193                                  @@listvar578:
 10194 00004DD5 8B5E04                   mov bx, [bp+4]
 10195 00004DD8 8A870F85                 mov al, [GWidth + bx]
 10196 00004DDC 8846FC                   mov [bp-4], al
 10197 00004DDF 8A46FC                   mov al, [bp-4]
 10198 00004DE2 3C01                     cmp al, 1
 10199 00004DE4 0F850900                 jne @@listvar579
 10200 00004DE8 68[474F]                 push listvar_7
 10201 00004DEB E889FA                   call prs
 10202 00004DEE 83C402                   add  sp, 2
 10203                                  @@listvar579:
 10204 00004DF1 8A46FC                   mov al, [bp-4]
 10205 00004DF4 3C02                     cmp al, 2
 10206 00004DF6 0F850900                 jne @@listvar580
 10207 00004DFA 68[4D4F]                 push listvar_8
 10208 00004DFD E877FA                   call prs
 10209 00004E00 83C402                   add  sp, 2
 10210                                  
 10211                                  ;-934                if(c==  4)prs("dwrd " );
 10212                                  
 10213                                  @@listvar580:
 10214 00004E03 8A46FC                   mov al, [bp-4]
 10215 00004E06 3C04                     cmp al, 4
 10216 00004E08 0F850900                 jne @@listvar581
 10217 00004E0C 68[534F]                 push listvar_9
 10218 00004E0F E865FA                   call prs
 10219 00004E12 83C402                   add  sp, 2
 10220                                  
 10221                                  ;-935   j=GAdr[i]; printint51(j);
 10222                                  
 10223                                  @@listvar581:
 10224 00004E15 8B5E04                   mov bx, [bp+4]
 10225 00004E18 D1E3                     shl bx, 1
 10226 00004E1A 8B873B86                 mov ax, [GAdr + bx]
 10227 00004E1E 8946FE                   mov [bp-2], ax
 10228 00004E21 FF76FE                   push word [bp-2]
 10229 00004E24 E8ECFB                   call printint51
 10230 00004E27 83C402                   add  sp, 2
 10231                                  
 10232                                  ;-936   j=GUsed[i]; if (j) printint51(j);
 10233                                  
 10234 00004E2A 8B5E04                   mov bx, [bp+4]
 10235 00004E2D D1E3                     shl bx, 1
 10236 00004E2F 8B879388                 mov ax, [GUsed + bx]
 10237 00004E33 8946FE                   mov [bp-2], ax
 10238 00004E36 8B46FE                   mov ax, [bp-2]
 10239 00004E39 08C0                     or  al, al
 10240 00004E3B 0F840C00                 je @@listvar582
 10241 00004E3F FF76FE                   push word [bp-2]
 10242 00004E42 E8CEFB                   call printint51
 10243 00004E45 83C402                   add  sp, 2
 10244                                  
 10245                                  ;-937   else {if(GType[i]=='#') prs("    -"); else prs(" NULL");}
 10246                                  
 10247 00004E48 E92200                   jmp @@listvar583
 10248                                  @@listvar582:
 10249 00004E4B 8B5E04                   mov bx, [bp+4]
 10250 00004E4E 8A87B782                 mov al, [GType + bx]
 10251 00004E52 3C23                     cmp al, 35
 10252 00004E54 0F850C00                 jne @@listvar584
 10253 00004E58 68[594F]                 push listvar_10
 10254 00004E5B E819FA                   call prs
 10255 00004E5E 83C402                   add  sp, 2
 10256 00004E61 E90900                   jmp @@listvar585
 10257                                  @@listvar584:
 10258 00004E64 68[5F4F]                 push listvar_11
 10259 00004E67 E80DFA                   call prs
 10260 00004E6A 83C402                   add  sp, 2
 10261                                  @@listvar585:
 10262                                  
 10263                                  ;-938   prc(32);  pt=adrofname(i); prs(pt);
 10264                                  
 10265                                  @@listvar583:
 10266 00004E6D 6A20                     push 32
 10267 00004E6F E89EF9                   call prc
 10268 00004E72 83C402                   add  sp, 2
 10269 00004E75 FF7604                   push word [bp+4]
 10270 00004E78 E823BB                   call adrofname
 10271 00004E7B 83C402                   add  sp, 2
 10272 00004E7E A3[7200]                 mov word [pt], ax
 10273 00004E81 FF36[7200]               push word [pt]
 10274 00004E85 E8EFF9                   call prs
 10275 00004E88 83C402                   add  sp, 2
 10276                                  
 10277                                  ;-939   if(GType[i]=='#') { prc('='); j=GData[i]; prunsign1(j); }
 10278                                  
 10279 00004E8B 8B5E04                   mov bx, [bp+4]
 10280 00004E8E 8A87B782                 mov al, [GType + bx]
 10281 00004E92 3C23                     cmp al, 35
 10282 00004E94 0F851D00                 jne @@listvar586
 10283 00004E98 6A3D                     push 61
 10284 00004E9A E873F9                   call prc
 10285 00004E9D 83C402                   add  sp, 2
 10286 00004EA0 8B5E04                   mov bx, [bp+4]
 10287 00004EA3 D1E3                     shl bx, 1
 10288 00004EA5 8B87EB8A                 mov ax, [GData + bx]
 10289 00004EA9 8946FE                   mov [bp-2], ax
 10290 00004EAC FF76FE                   push word [bp-2]
 10291 00004EAF E81FFB                   call prunsign1
 10292 00004EB2 83C402                   add  sp, 2
 10293                                  
 10294                                  ;-940   if(GType[i]=='&') { prc('['); j=GData[i]; prunsign1(j); prc(']');}
 10295                                  
 10296                                  @@listvar586:
 10297 00004EB5 8B5E04                   mov bx, [bp+4]
 10298 00004EB8 8A87B782                 mov al, [GType + bx]
 10299 00004EBC 3C26                     cmp al, 38
 10300 00004EBE 0F852500                 jne @@listvar587
 10301 00004EC2 6A5B                     push 91
 10302 00004EC4 E849F9                   call prc
 10303 00004EC7 83C402                   add  sp, 2
 10304 00004ECA 8B5E04                   mov bx, [bp+4]
 10305 00004ECD D1E3                     shl bx, 1
 10306 00004ECF 8B87EB8A                 mov ax, [GData + bx]
 10307 00004ED3 8946FE                   mov [bp-2], ax
 10308 00004ED6 FF76FE                   push word [bp-2]
 10309 00004ED9 E8F5FA                   call prunsign1
 10310 00004EDC 83C402                   add  sp, 2
 10311 00004EDF 6A5D                     push 93
 10312 00004EE1 E82CF9                   call prc
 10313 00004EE4 83C402                   add  sp, 2
 10314                                  
 10315                                  ;-941   if (i >= LSTART) { prs(" = bp"); j=GData[i];
 10316                                  
 10317                                  @@listvar587:
 10318 00004EE7 8B4604                   mov ax, [bp+4]
 10319 00004EEA 3DC800                   cmp ax, 200 ;unsigned : 0
 10320 00004EED 0F823000                 jb  @@listvar588
 10321 00004EF1 68[654F]                 push listvar_12
 10322 00004EF4 E880F9                   call prs
 10323 00004EF7 83C402                   add  sp, 2
 10324 00004EFA 8B5E04                   mov bx, [bp+4]
 10325 00004EFD D1E3                     shl bx, 1
 10326 00004EFF 8B87EB8A                 mov ax, [GData + bx]
 10327 00004F03 8946FE                   mov [bp-2], ax
 10328                                  
 10329                                  ;-942     if (j > 0) prc('+'); pint1(j);  }
 10330                                  
 10331 00004F06 8B46FE                   mov ax, [bp-2]
 10332 00004F09 83F800                   cmp ax, 0
 10333 00004F0C 0F8E0800                 jle @@listvar589
 10334 00004F10 6A2B                     push 43
 10335 00004F12 E8FBF8                   call prc
 10336 00004F15 83C402                   add  sp, 2
 10337                                  @@listvar589:
 10338 00004F18 FF76FE                   push word [bp-2]
 10339 00004F1B E850FA                   call pint1
 10340 00004F1E 83C402                   add  sp, 2
 10341                                  
 10342                                  ;-943 }
 10343                                  
 10344                                  @@listvar588:
 10345                                  
 10346                                  ;-944 int listcall() { int i;
 10347 00004F21 C9                       LEAVE
 10348 00004F22 C3                       ret
 10349                                  ; ENDP
 10350 00004F23 5C6E3B00                listvar_0 db "\n;",0
 10351 00004F27 7661722000              listvar_1 db "var ",0
 10352 00004F2C 7074722000              listvar_2 db "ptr ",0
 10353 00004F31 6172722000              listvar_3 db "arr ",0
 10354 00004F36 6465662000              listvar_4 db "def ",0
 10355 00004F3B 7369676E2000            listvar_5 db "sign ",0
 10356 00004F41 756E73672000            listvar_6 db "unsg ",0
 10357 00004F47 627974652000            listvar_7 db "byte ",0
 10358 00004F4D 776F72642000            listvar_8 db "word ",0
 10359 00004F53 647772642000            listvar_9 db "dwrd ",0
 10360 00004F59 202020202D00            listvar_10 db "    -",0
 10361 00004F5F 204E554C4C00            listvar_11 db " NULL",0
 10362 00004F65 203D20627000            listvar_12 db " = bp",0
 10363                                  
 10364                                  listcall:  ; *** PROC ***
 10365                                  
 10366                                  ;-945   prs("\n\n;    #  addr name   list of CALLs\n");
 10367                                  
 10368                                  ;Function : listcall, Number of local variables: 1
 10369                                  ;   # type sign width addr used name   list of local variables
 10370                                  ;  200 var sign word   944 NULL i = bp-2;
 10371 00004F6B C8020000                 ENTER  2,0
 10372 00004F6F 68[994F]                 push listcall_0
 10373 00004F72 E802F9                   call prs
 10374 00004F75 83C402                   add  sp, 2
 10375                                  
 10376                                  ;-946   i=0;  while (i< CTop) { calllisting(i); i++; } }
 10377                                  
 10378 00004F78 B80000                   mov ax, 0
 10379 00004F7B 8946FE                   mov [bp-2], ax
 10380                                  @@listcall590:
 10381 00004F7E 8B46FE                   mov ax, [bp-2]
 10382 00004F81 3B06[4500]               cmp ax, [CTop]
 10383 00004F85 0F8D0E00                 jge @@listcall591
 10384 00004F89 FF76FE                   push word [bp-2]
 10385 00004F8C E83200                   call calllisting
 10386 00004F8F 83C402                   add  sp, 2
 10387 00004F92 FF46FE                   inc  word[bp-2]
 10388 00004F95 EBE7                     jmp @@listcall590
 10389                                  @@listcall591:
 10390                                  
 10391                                  ;-947 int calllisting(int i) {char c; int j;
 10392 00004F97 C9                       LEAVE
 10393 00004F98 C3                       ret
 10394                                  ; ENDP
 10395 00004F99 5C6E5C6E3B20202020-     listcall_0 db "\n\n;    #  addr name   list of CALLs\n",0
 10396 00004FA2 23202061646472206E-
 10397 00004FAB 616D652020206C6973-
 10398 00004FB4 74206F662043414C4C-
 10399 00004FBD 735C6E00           
 10400                                  
 10401                                  calllisting:  ; *** PROC ***
 10402                                  
 10403                                  ;-948   prs("\n;"); printint51(i); prc(32);
 10404                                  
 10405                                  ;Function : calllisting, Number of local variables: 3
 10406                                  ;   # type sign width addr used name   list of local variables
 10407                                  ;  200 var sign word   947 NULL i = bp+4
 10408                                  ;  201 var sign byte   947 NULL c = bp-2
 10409                                  ;  202 var sign word   947 NULL j = bp-4;
 10410 00004FC1 C8040000                 ENTER  4,0
 10411 00004FC5 68[3350]                 push calllisting_0
 10412 00004FC8 E8ACF8                   call prs
 10413 00004FCB 83C402                   add  sp, 2
 10414 00004FCE FF7604                   push word [bp+4]
 10415 00004FD1 E83FFA                   call printint51
 10416 00004FD4 83C402                   add  sp, 2
 10417 00004FD7 6A20                     push 32
 10418 00004FD9 E834F8                   call prc
 10419 00004FDC 83C402                   add  sp, 2
 10420                                  
 10421                                  ;-949   c=CType [i]; if(c==0)prs("unresolved ");
 10422                                  
 10423 00004FDF 8B5E04                   mov bx, [bp+4]
 10424 00004FE2 8A872FA1                 mov al, [CType + bx]
 10425 00004FE6 8846FE                   mov [bp-2], al
 10426 00004FE9 8A46FE                   mov al, [bp-2]
 10427 00004FEC 3C00                     cmp al, 0
 10428 00004FEE 0F850900                 jne @@calllisting592
 10429 00004FF2 68[3750]                 push calllisting_1
 10430 00004FF5 E87FF8                   call prs
 10431 00004FF8 83C402                   add  sp, 2
 10432                                  
 10433                                  ;-950   j=CAdr[i];            printint51(j); prc(32);
 10434                                  
 10435                                  @@calllisting592:
 10436 00004FFB 8B5E04                   mov bx, [bp+4]
 10437 00004FFE D1E3                     shl bx, 1
 10438 00005000 8B8757AB                 mov ax, [CAdr + bx]
 10439 00005004 8946FC                   mov [bp-4], ax
 10440 00005007 FF76FC                   push word [bp-4]
 10441 0000500A E806FA                   call printint51
 10442 0000500D 83C402                   add  sp, 2
 10443 00005010 6A20                     push 32
 10444 00005012 E8FBF7                   call prc
 10445 00005015 83C402                   add  sp, 2
 10446                                  
 10447                                  ;-951   from_far(NameA, j);   prs(NameA);
 10448                                  
 10449 00005018 FF76FC                   push word [bp-4]
 10450 0000501B 8D06[4700]               lea  ax, [NameA]
 10451 0000501F 50                       push ax
 10452 00005020 E8B206                   call from_far
 10453 00005023 83C404                   add  sp, 4
 10454 00005026 8D06[4700]               lea  ax, [NameA]
 10455 0000502A 50                       push ax
 10456 0000502B E849F8                   call prs
 10457 0000502E 83C402                   add  sp, 2
 10458                                  
 10459                                  ;-952 }
 10460                                  
 10461                                  
 10462                                  ;-953 int countcalls(int f) { unsigned int i;
 10463 00005031 C9                       LEAVE
 10464 00005032 C3                       ret
 10465                                  ; ENDP
 10466 00005033 5C6E3B00                calllisting_0 db "\n;",0
 10467 00005037 756E7265736F6C7665-     calllisting_1 db "unresolved ",0
 10468 00005040 642000             
 10469                                  
 10470                                  countcalls:  ; *** PROC ***
 10471                                  
 10472                                  ;-954   pt=adrF(FNameField, f);
 10473                                  
 10474                                  ;Function : countcalls, Number of local variables: 2
 10475                                  ;   # type sign width addr used name   list of local variables
 10476                                  ;  200 var sign word   953 NULL f = bp+4
 10477                                  ;  201 var unsg word   953 NULL i = bp-2;
 10478 00005043 C8020000                 ENTER  2,0
 10479 00005047 FF7604                   push word [bp+4]
 10480 0000504A 8D064FBD                 lea  ax, [FNameField]
 10481 0000504E 50                       push ax
 10482 0000504F E860B9                   call adrF
 10483 00005052 83C404                   add  sp, 4
 10484 00005055 A3[7200]                 mov word [pt], ax
 10485                                  
 10486                                  ;-955   i=0;  while (i < CTop) {
 10487                                  
 10488 00005058 B80000                   mov ax, 0
 10489 0000505B 8946FE                   mov [bp-2], ax
 10490                                  @@countcalls593:
 10491 0000505E 8B46FE                   mov ax, [bp-2]
 10492 00005061 3B06[4500]               cmp ax, [CTop]
 10493 00005065 0F8D4A00                 jge @@countcalls594
 10494                                  
 10495                                  ;-956     p1=CAdr[i];
 10496                                  
 10497 00005069 8B5EFE                   mov bx, [bp-2]
 10498 0000506C D1E3                     shl bx, 1
 10499 0000506E 8B8757AB                 mov ax, [CAdr + bx]
 10500 00005072 A3[7400]                 mov word [p1], ax
 10501                                  
 10502                                  ;-957     from_far(NameA, p1);
 10503                                  
 10504 00005075 FF36[7400]               push word [p1]
 10505 00005079 8D06[4700]               lea  ax, [NameA]
 10506 0000507D 50                       push ax
 10507 0000507E E85406                   call from_far
 10508 00005081 83C404                   add  sp, 4
 10509                                  
 10510                                  ;-958     if (eqstr(pt,NameA))  FCalls[f] = FCalls[f] + 1;
 10511                                  
 10512 00005084 8D06[4700]               lea  ax, [NameA]
 10513 00005088 50                       push ax
 10514 00005089 FF36[7200]               push word [pt]
 10515 0000508D E823B1                   call eqstr
 10516 00005090 83C404                   add  sp, 4
 10517 00005093 08C0                     or  al, al
 10518 00005095 0F841500                 je @@countcalls595
 10519 00005099 8B5E04                   mov bx, [bp+4]
 10520 0000509C D1E3                     shl bx, 1
 10521 0000509E 8B87F7BA                 mov ax, [FCalls + bx]
 10522 000050A2 83C001                   add ax, 1
 10523 000050A5 8B5E04                   mov bx, [bp+4]
 10524 000050A8 D1E3                     shl bx, 1
 10525 000050AA 8987F7BA                 mov [FCalls+bx], ax
 10526                                  
 10527                                  ;-959     i++; }
 10528                                  
 10529                                  @@countcalls595:
 10530 000050AE FF46FE                   inc  word[bp-2]
 10531                                  
 10532                                  ;-960 }
 10533                                  
 10534 000050B1 EBAB                     jmp @@countcalls593
 10535                                  @@countcalls594:
 10536                                  
 10537                                  ;-961 int listfunc() { int i;
 10538 000050B3 C9                       LEAVE
 10539 000050B4 C3                       ret
 10540                                  ; ENDP
 10541                                  
 10542                                  listfunc:  ; *** PROC ***
 10543                                  
 10544                                  ;-962   prs("\n\n\n;   # Calls Line Width  Name   list of functions\n");
 10545                                  
 10546                                  ;Function : listfunc, Number of local variables: 1
 10547                                  ;   # type sign width addr used name   list of local variables
 10548                                  ;  200 var sign word   961 NULL i = bp-2;
 10549 000050B5 C8020000                 ENTER  2,0
 10550 000050B9 68[0251]                 push listfunc_0
 10551 000050BC E8B8F7                   call prs
 10552 000050BF 83C402                   add  sp, 2
 10553                                  
 10554                                  ;-963   i=0;  while (i < FTop) { countcalls (i); i++; } 
 10555                                  
 10556 000050C2 B80000                   mov ax, 0
 10557 000050C5 8946FE                   mov [bp-2], ax
 10558                                  @@listfunc596:
 10559 000050C8 8B46FE                   mov ax, [bp-2]
 10560 000050CB 3B06[4300]               cmp ax, [FTop]
 10561 000050CF 0F8D0E00                 jge @@listfunc597
 10562 000050D3 FF76FE                   push word [bp-2]
 10563 000050D6 E86AFF                   call countcalls
 10564 000050D9 83C402                   add  sp, 2
 10565 000050DC FF46FE                   inc  word[bp-2]
 10566                                  
 10567                                  ;-964   i=0;  while (i < FTop) { funclisting(i); i++; } }
 10568                                  
 10569 000050DF EBE7                     jmp @@listfunc596
 10570                                  @@listfunc597:
 10571 000050E1 B80000                   mov ax, 0
 10572 000050E4 8946FE                   mov [bp-2], ax
 10573                                  @@listfunc598:
 10574 000050E7 8B46FE                   mov ax, [bp-2]
 10575 000050EA 3B06[4300]               cmp ax, [FTop]
 10576 000050EE 0F8D0E00                 jge @@listfunc599
 10577 000050F2 FF76FE                   push word [bp-2]
 10578 000050F5 E84300                   call funclisting
 10579 000050F8 83C402                   add  sp, 2
 10580 000050FB FF46FE                   inc  word[bp-2]
 10581 000050FE EBE7                     jmp @@listfunc598
 10582                                  @@listfunc599:
 10583                                  
 10584                                  ;-965 int funclisting(int i) {int j;  char c;
 10585 00005100 C9                       LEAVE
 10586 00005101 C3                       ret
 10587                                  ; ENDP
 10588 00005102 5C6E5C6E5C6E3B2020-     listfunc_0 db "\n\n\n;   # Calls Line Width  Name   list of functions\n",0
 10589 0000510B 20232043616C6C7320-
 10590 00005114 4C696E652057696474-
 10591 0000511D 6820204E616D652020-
 10592 00005126 206C697374206F6620-
 10593 0000512F 66756E6374696F6E73-
 10594 00005138 5C6E00             
 10595                                  
 10596                                  funclisting:  ; *** PROC ***
 10597                                  
 10598                                  ;-966   prs("\n;");    printint51(i);
 10599                                  
 10600                                  ;Function : funclisting, Number of local variables: 3
 10601                                  ;   # type sign width addr used name   list of local variables
 10602                                  ;  200 var sign word   965 NULL i = bp+4
 10603                                  ;  201 var sign word   965 NULL j = bp-2
 10604                                  ;  202 var sign byte   965 NULL c = bp-4;
 10605 0000513B C8040000                 ENTER  4,0
 10606 0000513F 68[1752]                 push funclisting_0
 10607 00005142 E832F7                   call prs
 10608 00005145 83C402                   add  sp, 2
 10609 00005148 FF7604                   push word [bp+4]
 10610 0000514B E8C5F8                   call printint51
 10611 0000514E 83C402                   add  sp, 2
 10612                                  
 10613                                  ;-967   j = FCalls[i]; if (j) printint51(j); else prs(" NULL");
 10614                                  
 10615 00005151 8B5E04                   mov bx, [bp+4]
 10616 00005154 D1E3                     shl bx, 1
 10617 00005156 8B87F7BA                 mov ax, [FCalls + bx]
 10618 0000515A 8946FE                   mov [bp-2], ax
 10619 0000515D 8B46FE                   mov ax, [bp-2]
 10620 00005160 08C0                     or  al, al
 10621 00005162 0F840C00                 je @@funclisting600
 10622 00005166 FF76FE                   push word [bp-2]
 10623 00005169 E8A7F8                   call printint51
 10624 0000516C 83C402                   add  sp, 2
 10625 0000516F E90900                   jmp @@funclisting601
 10626                                  @@funclisting600:
 10627 00005172 68[1B52]                 push funclisting_1
 10628 00005175 E8FFF6                   call prs
 10629 00005178 83C402                   add  sp, 2
 10630                                  
 10631                                  ;-968   j = FAdr[i];   printint51(j); prc(32);
 10632                                  
 10633                                  @@funclisting601:
 10634 0000517B 8B5E04                   mov bx, [bp+4]
 10635 0000517E D1E3                     shl bx, 1
 10636 00005180 8B87FFA8                 mov ax, [FAdr + bx]
 10637 00005184 8946FE                   mov [bp-2], ax
 10638 00005187 FF76FE                   push word [bp-2]
 10639 0000518A E886F8                   call printint51
 10640 0000518D 83C402                   add  sp, 2
 10641 00005190 6A20                     push 32
 10642 00005192 E87BF6                   call prc
 10643 00005195 83C402                   add  sp, 2
 10644                                  
 10645                                  ;-969   c=FType[i];
 10646                                  
 10647 00005198 8B5E04                   mov bx, [bp+4]
 10648 0000519B 8A8703A0                 mov al, [FType + bx]
 10649 0000519F 8846FC                   mov [bp-4], al
 10650                                  
 10651                                  ;-970   if(c=='V')prs("void " );    if(c=='B')prs("byte " );
 10652                                  
 10653 000051A2 8A46FC                   mov al, [bp-4]
 10654 000051A5 3C56                     cmp al, 86
 10655 000051A7 0F850900                 jne @@funclisting602
 10656 000051AB 68[2152]                 push funclisting_2
 10657 000051AE E8C6F6                   call prs
 10658 000051B1 83C402                   add  sp, 2
 10659                                  @@funclisting602:
 10660 000051B4 8A46FC                   mov al, [bp-4]
 10661 000051B7 3C42                     cmp al, 66
 10662 000051B9 0F850900                 jne @@funclisting603
 10663 000051BD 68[2752]                 push funclisting_3
 10664 000051C0 E8B4F6                   call prs
 10665 000051C3 83C402                   add  sp, 2
 10666                                  
 10667                                  ;-971   if(c=='W')prs("word " );    if(c=='D')prs("dwrd " );
 10668                                  
 10669                                  @@funclisting603:
 10670 000051C6 8A46FC                   mov al, [bp-4]
 10671 000051C9 3C57                     cmp al, 87
 10672 000051CB 0F850900                 jne @@funclisting604
 10673 000051CF 68[2D52]                 push funclisting_4
 10674 000051D2 E8A2F6                   call prs
 10675 000051D5 83C402                   add  sp, 2
 10676                                  @@funclisting604:
 10677 000051D8 8A46FC                   mov al, [bp-4]
 10678 000051DB 3C44                     cmp al, 68
 10679 000051DD 0F850900                 jne @@funclisting605
 10680 000051E1 68[3352]                 push funclisting_5
 10681 000051E4 E890F6                   call prs
 10682 000051E7 83C402                   add  sp, 2
 10683                                  
 10684                                  ;-972   prc(32); prc(32);
 10685                                  
 10686                                  @@funclisting605:
 10687 000051EA 6A20                     push 32
 10688 000051EC E821F6                   call prc
 10689 000051EF 83C402                   add  sp, 2
 10690 000051F2 6A20                     push 32
 10691 000051F4 E819F6                   call prc
 10692 000051F7 83C402                   add  sp, 2
 10693                                  
 10694                                  ;-973   pt=adrF(FNameField, i); prs(pt);
 10695                                  
 10696 000051FA FF7604                   push word [bp+4]
 10697 000051FD 8D064FBD                 lea  ax, [FNameField]
 10698 00005201 50                       push ax
 10699 00005202 E8ADB7                   call adrF
 10700 00005205 83C404                   add  sp, 4
 10701 00005208 A3[7200]                 mov word [pt], ax
 10702 0000520B FF36[7200]               push word [pt]
 10703 0000520F E865F6                   call prs
 10704 00005212 83C402                   add  sp, 2
 10705                                  
 10706                                  ;-974 }
 10707                                  
 10708                                  
 10709                                  ;-975 unsigned int MAXUI=65535;
 10710 00005215 C9                       LEAVE
 10711 00005216 C3                       ret
 10712                                  ; ENDP
 10713 00005217 5C6E3B00                funclisting_0 db "\n;",0
 10714 0000521B 204E554C4C00            funclisting_1 db " NULL",0
 10715 00005221 766F69642000            funclisting_2 db "void ",0
 10716 00005227 627974652000            funclisting_3 db "byte ",0
 10717 0000522D 776F72642000            funclisting_4 db "word ",0
 10718 00005233 647772642000            funclisting_5 db "dwrd ",0
 10719 00005239 FFFF                    MAXUI dw 65535
 10720                                  
 10721                                  ;-976 int epilog() {unsigned int i; 
 10722                                  
 10723                                  
 10724                                  epilog:  ; *** PROC ***
 10725                                  
 10726                                  ;-977   strcpy(symbol, "LastFunctionByt");  storefunc();
 10727                                  
 10728                                  ;Function : epilog, Number of local variables: 1
 10729                                  ;   # type sign width addr used name   list of local variables
 10730                                  ;  200 var unsg word   976 NULL i = bp-2;
 10731 0000523B C8020000                 ENTER  2,0
 10732 0000523F 68[6C54]                 push epilog_0
 10733 00005242 8D062B81                 lea  ax, [symbol]
 10734 00005246 50                       push ax
 10735 00005247 E839AF                   call strcpy
 10736 0000524A 83C404                   add  sp, 4
 10737 0000524D E83DBA                   call storefunc
 10738                                  
 10739                                  ;-978   prs("\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret");
 10740                                  
 10741 00005250 68[7C54]                 push epilog_1
 10742 00005253 E821F6                   call prs
 10743 00005256 83C402                   add  sp, 2
 10744                                  
 10745                                  ;-979   prs("\n \n;   # type sign width  adr used name   list of global variables\n");
 10746                                  
 10747 00005259 68[A954]                 push epilog_2
 10748 0000525C E818F6                   call prs
 10749 0000525F 83C402                   add  sp, 2
 10750                                  
 10751                                  ;-980   i=1;
 10752                                  
 10753 00005262 B80100                   mov ax, 1
 10754 00005265 8946FE                   mov [bp-2], ax
 10755                                  
 10756                                  ;-981   while (i< GTop) { listvar(i); i++; }
 10757                                  
 10758                                  @@epilog606:
 10759 00005268 8B46FE                   mov ax, [bp-2]
 10760 0000526B 3B06[3200]               cmp ax, [GTop]
 10761 0000526F 0F8D0E00                 jge @@epilog607
 10762 00005273 FF76FE                   push word [bp-2]
 10763 00005276 E8BEFA                   call listvar
 10764 00005279 83C402                   add  sp, 2
 10765 0000527C FF46FE                   inc  word[bp-2]
 10766                                  
 10767                                  ;-982   listfunc();   listcall();
 10768                                  
 10769 0000527F EBE7                     jmp @@epilog606
 10770                                  @@epilog607:
 10771 00005281 E831FE                   call listfunc
 10772 00005284 E8E4FC                   call listcall
 10773                                  
 10774                                  ;-983 
 10775                                  
 10776                                  
 10777                                  ;-984   prs("\n;Input: "); prs(&namein);
 10778                                  
 10779 00005287 68[F054]                 push epilog_3
 10780 0000528A E8EAF5                   call prs
 10781 0000528D 83C402                   add  sp, 2
 10782 00005290 8D06EE81                 lea  ax, [namein]
 10783 00005294 50                       push ax
 10784 00005295 E8DFF5                   call prs
 10785 00005298 83C402                   add  sp, 2
 10786                                  
 10787                                  ;-985   prs(", List: ");   prs(&namelst);
 10788                                  
 10789 0000529B 68[FB54]                 push epilog_4
 10790 0000529E E8D6F5                   call prs
 10791 000052A1 83C402                   add  sp, 2
 10792 000052A4 8D063182                 lea  ax, [namelst]
 10793 000052A8 50                       push ax
 10794 000052A9 E8CBF5                   call prs
 10795 000052AC 83C402                   add  sp, 2
 10796                                  
 10797                                  ;-986   prs(",  Lines:"); printint51(lineno);
 10798                                  
 10799 000052AF 68[0455]                 push epilog_5
 10800 000052B2 E8C2F5                   call prs
 10801 000052B5 83C402                   add  sp, 2
 10802 000052B8 FF36[6E00]               push word [lineno]
 10803 000052BC E854F7                   call printint51
 10804 000052BF 83C402                   add  sp, 2
 10805                                  
 10806                                  ;-987   prs("\n;Glob. variables:"); GTop--; printint51(GTop);
 10807                                  
 10808 000052C2 68[0E55]                 push epilog_6
 10809 000052C5 E8AFF5                   call prs
 10810 000052C8 83C402                   add  sp, 2
 10811 000052CB FF0E[3200]               dec  word[GTop]
 10812 000052CF FF36[3200]               push word [GTop]
 10813 000052D3 E83DF7                   call printint51
 10814 000052D6 83C402                   add  sp, 2
 10815                                  
 10816                                  ;-988   prs(" max.:"); printint51(LSTART);
 10817                                  
 10818 000052D9 68[2255]                 push epilog_7
 10819 000052DC E898F5                   call prs
 10820 000052DF 83C402                   add  sp, 2
 10821 000052E2 68C800                   push 200
 10822 000052E5 E82BF7                   call printint51
 10823 000052E8 83C402                   add  sp, 2
 10824                                  
 10825                                  ;-989   prs("\n;Functions      :"); printint51(FTop);
 10826                                  
 10827 000052EB 68[2955]                 push epilog_8
 10828 000052EE E886F5                   call prs
 10829 000052F1 83C402                   add  sp, 2
 10830 000052F4 FF36[4300]               push word [FTop]
 10831 000052F8 E818F7                   call printint51
 10832 000052FB 83C402                   add  sp, 2
 10833                                  
 10834                                  ;-990   prs(" max.:"); printint51(FUNCMAX);
 10835                                  
 10836 000052FE 68[3D55]                 push epilog_9
 10837 00005301 E873F5                   call prs
 10838 00005304 83C402                   add  sp, 2
 10839 00005307 682C01                   push 300
 10840 0000530A E806F7                   call printint51
 10841 0000530D 83C402                   add  sp, 2
 10842                                  
 10843                                  ;-991   prs("\n;Calls          :"); printint51(CTop);
 10844                                  
 10845 00005310 68[4455]                 push epilog_10
 10846 00005313 E861F5                   call prs
 10847 00005316 83C402                   add  sp, 2
 10848 00005319 FF36[4500]               push word [CTop]
 10849 0000531D E8F3F6                   call printint51
 10850 00005320 83C402                   add  sp, 2
 10851                                  
 10852                                  ;-992   prs(" max.:"); printint51(CALLMAX);
 10853                                  
 10854 00005323 68[5855]                 push epilog_11
 10855 00005326 E84EF5                   call prs
 10856 00005329 83C402                   add  sp, 2
 10857 0000532C 68D007                   push 2000
 10858 0000532F E8E1F6                   call printint51
 10859 00005332 83C402                   add  sp, 2
 10860                                  
 10861                                  ;-993   prs(", NameField:"); printint51(CNameTop);
 10862                                  
 10863 00005335 68[5F55]                 push epilog_12
 10864 00005338 E83CF5                   call prs
 10865 0000533B 83C402                   add  sp, 2
 10866 0000533E FF36[6800]               push word [CNameTop]
 10867 00005342 E8CEF6                   call printint51
 10868 00005345 83C402                   add  sp, 2
 10869                                  
 10870                                  ;-994   prs(" max.:"); printint51(65535);
 10871                                  
 10872 00005348 68[6C55]                 push epilog_13
 10873 0000534B E829F5                   call prs
 10874 0000534E 83C402                   add  sp, 2
 10875 00005351 6AFF                     push -1
 10876 00005353 E8BDF6                   call printint51
 10877 00005356 83C402                   add  sp, 2
 10878                                  
 10879                                  ;-995 //  prs(", segE:"); printint51(segE);
 10880                                  
 10881                                  
 10882                                  ;-996   __asm{call LastFunctionByt}  _ i=ax;
 10883                                  
 10884 00005359 E89903                  call LastFunctionByt
 10885 0000535C 8946FE                  mov [bp-2], ax
 10886                                  
 10887                                  ;-997   prs("\n;Code until     :"); printint51(i);
 10888                                  
 10889 0000535F 68[7355]                 push epilog_14
 10890 00005362 E812F5                   call prs
 10891 00005365 83C402                   add  sp, 2
 10892 00005368 FF76FE                   push word [bp-2]
 10893 0000536B E8A5F6                   call printint51
 10894 0000536E 83C402                   add  sp, 2
 10895                                  
 10896                                  ;-998   prs(" max.: "); printint51(ORGDATAORIG); i=ORGDATAORIG-i; prs(", free:");
 10897                                  
 10898 00005371 68[8755]                 push epilog_15
 10899 00005374 E800F5                   call prs
 10900 00005377 83C402                   add  sp, 2
 10901 0000537A FF36[1400]               push word [ORGDATAORIG]
 10902 0000537E E892F6                   call printint51
 10903 00005381 83C402                   add  sp, 2
 10904 00005384 A1[1400]                 mov ax, [ORGDATAORIG]
 10905 00005387 2B46FE                   sub ax, [bp-2]
 10906 0000538A 8946FE                   mov [bp-2], ax
 10907 0000538D 68[8F55]                 push epilog_16
 10908 00005390 E8E4F4                   call prs
 10909 00005393 83C402                   add  sp, 2
 10910                                  
 10911                                  ;-999   printint51(i); if (i <= 1000)prs(" *** Warning *** Code area too small");
 10912                                  
 10913 00005396 FF76FE                   push word [bp-2]
 10914 00005399 E877F6                   call printint51
 10915 0000539C 83C402                   add  sp, 2
 10916 0000539F 8B46FE                   mov ax, [bp-2]
 10917 000053A2 3DE803                   cmp ax, 1000
 10918 000053A5 0F870900                 ja  @@epilog608
 10919 000053A9 68[9755]                 push epilog_17
 10920 000053AC E8C8F4                   call prs
 10921 000053AF 83C402                   add  sp, 2
 10922                                  
 10923                                  ;-1000   prs("\n;Data (HeapEnd) :"); prunsign1(orgData); i=MAXUI-orgData;
 10924                                  
 10925                                  @@epilog608:
 10926 000053B2 68[BC55]                 push epilog_18
 10927 000053B5 E8BFF4                   call prs
 10928 000053B8 83C402                   add  sp, 2
 10929 000053BB FF36[1600]               push word [orgData]
 10930 000053BF E80FF6                   call prunsign1
 10931 000053C2 83C402                   add  sp, 2
 10932 000053C5 A1[3952]                 mov ax, [MAXUI]
 10933 000053C8 2B06[1600]               sub ax, [orgData]
 10934 000053CC 8946FE                   mov [bp-2], ax
 10935                                  
 10936                                  ;-1001   prs(", resting stacksize: ");printint51(i);
 10937                                  
 10938 000053CF 68[D055]                 push epilog_19
 10939 000053D2 E8A2F4                   call prs
 10940 000053D5 83C402                   add  sp, 2
 10941 000053D8 FF76FE                   push word [bp-2]
 10942 000053DB E835F6                   call printint51
 10943 000053DE 83C402                   add  sp, 2
 10944                                  
 10945                                  ;-1002   if (i <= 5000) prs(" *** Warning *** Stack too small");
 10946                                  
 10947 000053E1 8B46FE                   mov ax, [bp-2]
 10948 000053E4 3D8813                   cmp ax, 5000
 10949 000053E7 0F870900                 ja  @@epilog609
 10950 000053EB 68[E655]                 push epilog_20
 10951 000053EE E886F4                   call prs
 10952 000053F1 83C402                   add  sp, 2
 10953                                  
 10954                                  ;-1003   prs("\n;Max. Const in '"); prs(coname); prs("' :"); printint51(maxco);
 10955                                  
 10956                                  @@epilog609:
 10957 000053F4 68[0756]                 push epilog_21
 10958 000053F7 E87DF4                   call prs
 10959 000053FA 83C402                   add  sp, 2
 10960 000053FD 8D06E880                 lea  ax, [coname]
 10961 00005401 50                       push ax
 10962 00005402 E872F4                   call prs
 10963 00005405 83C402                   add  sp, 2
 10964 00005408 68[1A56]                 push epilog_22
 10965 0000540B E869F4                   call prs
 10966 0000540E 83C402                   add  sp, 2
 10967 00005411 FF36[1800]               push word [maxco]
 10968 00005415 E8FBF5                   call printint51
 10969 00005418 83C402                   add  sp, 2
 10970                                  
 10971                                  ;-1004   prs(" max."); printint51(COMAX); i=COMAX; i=i-maxco; prs(", free:");
 10972                                  
 10973 0000541B 68[1E56]                 push epilog_23
 10974 0000541E E856F4                   call prs
 10975 00005421 83C402                   add  sp, 2
 10976 00005424 68B80B                   push 3000
 10977 00005427 E8E9F5                   call printint51
 10978 0000542A 83C402                   add  sp, 2
 10979 0000542D B8B80B                   mov ax, 3000
 10980 00005430 8946FE                   mov [bp-2], ax
 10981 00005433 8B46FE                   mov ax, [bp-2]
 10982 00005436 2B06[1800]               sub ax, [maxco]
 10983 0000543A 8946FE                   mov [bp-2], ax
 10984 0000543D 68[2456]                 push epilog_24
 10985 00005440 E834F4                   call prs
 10986 00005443 83C402                   add  sp, 2
 10987                                  
 10988                                  ;-1005   printint51(i);if (i <= 1000)prs(" *** Warning *** constant area too small");
 10989                                  
 10990 00005446 FF76FE                   push word [bp-2]
 10991 00005449 E8C7F5                   call printint51
 10992 0000544C 83C402                   add  sp, 2
 10993 0000544F 8B46FE                   mov ax, [bp-2]
 10994 00005452 3DE803                   cmp ax, 1000
 10995 00005455 0F870900                 ja  @@epilog610
 10996 00005459 68[2C56]                 push epilog_25
 10997 0000545C E818F4                   call prs
 10998 0000545F 83C402                   add  sp, 2
 10999                                  
 11000                                  ;-1006   end1(0);}
 11001                                  
 11002                                  @@epilog610:
 11003 00005462 6A00                     push 0
 11004 00005464 E8D6F6                   call end1
 11005 00005467 83C402                   add  sp, 2
 11006                                  
 11007                                  ;-1007 // while(expr) stmt; do stmt while(expr); FOR: i=0; while(i<10){stmt; i++;}
 11008                                  
 11009                                  
 11010                                  ;-1008 int setblock(unsigned int i) {
 11011 0000546A C9                       LEAVE
 11012 0000546B C3                       ret
 11013                                  ; ENDP
 11014 0000546C 4C61737446756E6374-     epilog_0 db "LastFunctionByt",0
 11015 00005475 696F6E42797400     
 11016 0000547C 5C6E4C61737446756E-     epilog_1 db "\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret",0
 11017 00005485 6374696F6E4279743A-
 11018 0000548E 646220304538682C20-
 11019 00005497 302C20305C6E706F70-
 11020 000054A0 2061785C6E72657400 
 11021 000054A9 5C6E205C6E3B202020-     epilog_2 db "\n \n;   # type sign width  adr used name   list of global variables\n",0
 11022 000054B2 232074797065207369-
 11023 000054BB 676E20776964746820-
 11024 000054C4 206164722075736564-
 11025 000054CD 206E616D652020206C-
 11026 000054D6 697374206F6620676C-
 11027 000054DF 6F62616C2076617269-
 11028 000054E8 61626C65735C6E00   
 11029 000054F0 5C6E3B496E7075743A-     epilog_3 db "\n;Input: ",0
 11030 000054F9 2000               
 11031 000054FB 2C204C6973743A2000      epilog_4 db ", List: ",0
 11032 00005504 2C20204C696E65733A-     epilog_5 db ",  Lines:",0
 11033 0000550D 00                 
 11034 0000550E 5C6E3B476C6F622E20-     epilog_6 db "\n;Glob. variables:",0
 11035 00005517 7661726961626C6573-
 11036 00005520 3A00               
 11037 00005522 206D61782E3A00          epilog_7 db " max.:",0
 11038 00005529 5C6E3B46756E637469-     epilog_8 db "\n;Functions      :",0
 11039 00005532 6F6E73202020202020-
 11040 0000553B 3A00               
 11041 0000553D 206D61782E3A00          epilog_9 db " max.:",0
 11042 00005544 5C6E3B43616C6C7320-     epilog_10 db "\n;Calls          :",0
 11043 0000554D 202020202020202020-
 11044 00005556 3A00               
 11045 00005558 206D61782E3A00          epilog_11 db " max.:",0
 11046 0000555F 2C204E616D65466965-     epilog_12 db ", NameField:",0
 11047 00005568 6C643A00           
 11048 0000556C 206D61782E3A00          epilog_13 db " max.:",0
 11049 00005573 5C6E3B436F64652075-     epilog_14 db "\n;Code until     :",0
 11050 0000557C 6E74696C2020202020-
 11051 00005585 3A00               
 11052 00005587 206D61782E3A2000        epilog_15 db " max.: ",0
 11053 0000558F 2C20667265653A00        epilog_16 db ", free:",0
 11054 00005597 202A2A2A205761726E-     epilog_17 db " *** Warning *** Code area too small",0
 11055 000055A0 696E67202A2A2A2043-
 11056 000055A9 6F6465206172656120-
 11057 000055B2 746F6F20736D616C6C-
 11058 000055BB 00                 
 11059 000055BC 5C6E3B446174612028-     epilog_18 db "\n;Data (HeapEnd) :",0
 11060 000055C5 48656170456E642920-
 11061 000055CE 3A00               
 11062 000055D0 2C2072657374696E67-     epilog_19 db ", resting stacksize: ",0
 11063 000055D9 20737461636B73697A-
 11064 000055E2 653A2000           
 11065 000055E6 202A2A2A205761726E-     epilog_20 db " *** Warning *** Stack too small",0
 11066 000055EF 696E67202A2A2A2053-
 11067 000055F8 7461636B20746F6F20-
 11068 00005601 736D616C6C00       
 11069 00005607 5C6E3B4D61782E2043-     epilog_21 db "\n;Max. Const in '",0
 11070 00005610 6F6E737420696E2027-
 11071 00005619 00                 
 11072 0000561A 27203A00                epilog_22 db "' :",0
 11073 0000561E 206D61782E00            epilog_23 db " max.",0
 11074 00005624 2C20667265653A00        epilog_24 db ", free:",0
 11075 0000562C 202A2A2A205761726E-     epilog_25 db " *** Warning *** constant area too small",0
 11076 00005635 696E67202A2A2A2063-
 11077 0000563E 6F6E7374616E742061-
 11078 00005647 72656120746F6F2073-
 11079 00005650 6D616C6C00         
 11080                                  
 11081                                  setblock:  ; *** PROC ***
 11082                                  
 11083                                  ;-1009   DOS_ERR=0; _BX=i; _ ax=cs; _ es=ax; _AX=0x4A00; DosInt(); }
 11084                                  
 11085                                  ;Function : setblock, Number of local variables: 1
 11086                                  ;   # type sign width addr used name   list of local variables
 11087                                  ;  200 var unsg word  1008 NULL i = bp+4;
 11088 00005655 C8000000                 ENTER  0,0
 11089 00005659 B80000                   mov ax, 0
 11090 0000565C A3[7600]                 mov word [DOS_ERR], ax
 11091 0000565F 8B5E04                   mov  bx, [bp+4]
 11092 00005662 8CC8                     mov  ax, cs
 11093 00005664 8EC0                     mov  es, ax
 11094 00005666 B8004A                   mov  ax, 18944
 11095 00005669 E869AA                   call DosInt
 11096                                  
 11097                                  ;-1010 int allocmem(unsigned int i) { unsigned int vAX; unsigned int vBX;
 11098 0000566C C9                       LEAVE
 11099 0000566D C3                       ret
 11100                                  ; ENDP
 11101                                  
 11102                                  allocmem:  ; *** PROC ***
 11103                                  
 11104                                  ;-1011   DOS_ERR=0; _BX=i;  _AX=0x4800; DosInt(); _ vAX=ax; _ vBX=bx;
 11105                                  
 11106                                  ;Function : allocmem, Number of local variables: 3
 11107                                  ;   # type sign width addr used name   list of local variables
 11108                                  ;  200 var unsg word  1010 NULL i = bp+4
 11109                                  ;  201 var unsg word  1010 NULL vAX = bp-2
 11110                                  ;  202 var unsg word  1010 NULL vBX = bp-4;
 11111 0000566E C8040000                 ENTER  4,0
 11112 00005672 B80000                   mov ax, 0
 11113 00005675 A3[7600]                 mov word [DOS_ERR], ax
 11114 00005678 8B5E04                   mov  bx, [bp+4]
 11115 0000567B B80048                   mov  ax, 18432
 11116 0000567E E854AA                   call DosInt
 11117 00005681 8946FE                  mov [bp-2], ax
 11118 00005684 895EFC                  mov [bp-4], bx
 11119                                  
 11120                                  ;-1012   if(DOS_ERR) return vBX;   return vAX;
 11121                                  
 11122 00005687 A1[7600]                 mov ax, [DOS_ERR]
 11123 0000568A 08C0                     or  al, al
 11124 0000568C 0F840600                 je @@allocmem611
 11125 00005690 8B46FC                   mov ax, [bp-4]
 11126 00005693 E90600                   jmp @@retn
 11127                                  @@allocmem611:
 11128 00005696 8B46FE                   mov ax, [bp-2]
 11129 00005699 E90000                   jmp @@retn
 11130                                  
 11131                                  ;-1013 }
 11132                                  
 11133                                  
 11134                                  ;-1014 int copyF(char *dest, char *src, unsigned int sz) {
 11135                                  
 11136 0000569C C9                      @@retn: LEAVE
 11137 0000569D C3                       ret
 11138                                  ; ENDP
 11139                                  
 11140                                  copyF:  ; *** PROC ***
 11141                                  
 11142                                  ;-1015   segE;  _ es=ax;  _ si=src;  _ di=dest; _ cx=sz;  // ds:si   es:di
 11143                                  
 11144                                  ;Function : copyF, Number of local variables: 3
 11145                                  ;   # type sign width addr used name   list of local variables
 11146                                  ;  200 ptr sign byte  1014 NULL dest = bp+4
 11147                                  ;  201 ptr sign byte  1014 NULL src = bp+6
 11148                                  ;  202 var unsg word  1014 NULL sz = bp+8;
 11149 0000569E C8000000                 ENTER  0,0
 11150 000056A2 A1[6C00]                 mov ax, [segE]
 11151 000056A5 8EC0                     mov  es, ax
 11152 000056A7 8B7606                   mov  si, [bp+6]
 11153 000056AA 8B7E04                   mov  di, [bp+4]
 11154 000056AD 8B4E08                   mov  cx, [bp+8]
 11155                                  
 11156                                  ;-1016   asm cld
 11157                                  
 11158 000056B0 FC                       cld
 11159                                  
 11160                                  ;-1017   asm rep movsb
 11161                                  
 11162 000056B1 F3A4                     rep movsb
 11163                                  
 11164                                  ;-1018   asm mov byte [es:di], 0
 11165                                  
 11166 000056B3 26C60500                 mov byte [es:di], 0
 11167                                  
 11168                                  ;-1019 }
 11169                                  
 11170                                  
 11171                                  ;-1020 int to_far(char *dest, char *src) {
 11172 000056B7 C9                       LEAVE
 11173 000056B8 C3                       ret
 11174                                  ; ENDP
 11175                                  
 11176                                  to_far:  ; *** PROC ***
 11177                                  
 11178                                  ;-1021   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
 11179                                  
 11180                                  ;Function : to_far, Number of local variables: 2
 11181                                  ;   # type sign width addr used name   list of local variables
 11182                                  ;  200 ptr sign byte  1020 NULL dest = bp+4
 11183                                  ;  201 ptr sign byte  1020 NULL src = bp+6;
 11184 000056B9 C8000000                 ENTER  0,0
 11185 000056BD A1[6C00]                 mov ax, [segE]
 11186 000056C0 8EC0                     mov  es, ax
 11187 000056C2 8B7606                   mov  si, [bp+6]
 11188 000056C5 8B7E04                   mov  di, [bp+4]
 11189                                  
 11190                                  ;-1022   asm cld
 11191                                  
 11192 000056C8 FC                       cld
 11193                                  
 11194                                  ;-1023   do{
 11195                                  
 11196                                  @@to_far612:
 11197                                  
 11198                                  ;-1024   asm lodsb  ; inc si
 11199                                  
 11200 000056C9 AC                       lodsb  ; inc si
 11201                                  
 11202                                  ;-1025   asm stosb  ; inc di
 11203                                  
 11204 000056CA AA                       stosb  ; inc di
 11205                                  
 11206                                  ;-1026   } while (al != 0);
 11207                                  
 11208 000056CB 3C00                     cmp  al, 0
 11209 000056CD 0F840200                 je  @@to_far613
 11210 000056D1 EBF6                     jmp @@to_far612
 11211                                  @@to_far613:
 11212                                  
 11213                                  ;-1027 }
 11214                                  
 11215                                  
 11216                                  ;-1028 int from_far(char *dest, char *src) {
 11217 000056D3 C9                       LEAVE
 11218 000056D4 C3                       ret
 11219                                  ; ENDP
 11220                                  
 11221                                  from_far:  ; *** PROC ***
 11222                                  
 11223                                  ;-1029   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
 11224                                  
 11225                                  ;Function : from_far, Number of local variables: 2
 11226                                  ;   # type sign width addr used name   list of local variables
 11227                                  ;  200 ptr sign byte  1028 NULL dest = bp+4
 11228                                  ;  201 ptr sign byte  1028 NULL src = bp+6;
 11229 000056D5 C8000000                 ENTER  0,0
 11230 000056D9 A1[6C00]                 mov ax, [segE]
 11231 000056DC 8EC0                     mov  es, ax
 11232 000056DE 8B7606                   mov  si, [bp+6]
 11233 000056E1 8B7E04                   mov  di, [bp+4]
 11234                                  
 11235                                  ;-1030   do{
 11236                                  
 11237                                  @@from_far614:
 11238                                  
 11239                                  ;-1031   asm mov al, [es:si]
 11240                                  
 11241 000056E4 268A04                   mov al, [es:si]
 11242                                  
 11243                                  ;-1032   asm inc si
 11244                                  
 11245 000056E7 46                       inc si
 11246                                  
 11247                                  ;-1033   asm mov [di], al
 11248                                  
 11249 000056E8 8805                     mov [di], al
 11250                                  
 11251                                  ;-1034   asm inc di
 11252                                  
 11253 000056EA 47                       inc di
 11254                                  
 11255                                  ;-1035   } while (al != 0);
 11256                                  
 11257 000056EB 3C00                     cmp  al, 0
 11258 000056ED 0F840200                 je  @@from_far615
 11259 000056F1 EBF1                     jmp @@from_far614
 11260                                  @@from_far615:
 11261                                  
 11262                                  ;-1036 }
 11263 000056F3 C9                       LEAVE
 11264 000056F4 C3                       ret
 11265                                  ; ENDP
 11266                                   
 11267                                  ; missing functions:  All FUNCTIONs in place
 11268 000056F5 E80000                  LastFunctionByt:db 0E8h, 0, 0
 11269 000056F8 58                      pop ax
 11270 000056F9 C3                      ret
 11271                                   
 11272                                  ;   # type sign width  adr used name   list of global variables
 11273                                  
 11274                                  ;    1 arr sign byte     2    2 Version1[16]
 11275                                  ;    2 def unsg byte     4    - LSTART=200
 11276                                  ;    3 def unsg byte     5    - VARMAX=300
 11277                                  ;    4 def unsg byte     6    - GNAMEMAX=4800
 11278                                  ;    5 def unsg byte     7    - FUNCMAX=300
 11279                                  ;    6 def unsg byte     8    - FNAMEMAX=4800
 11280                                  ;    7 def unsg byte     9    - CALLMAX=2000
 11281                                  ;    8 def unsg byte    10    - IDLENMAX=15
 11282                                  ;    9 def unsg byte    12    - T_NAME=256
 11283                                  ;   10 def unsg byte    13    - T_CONST=257
 11284                                  ;   11 def unsg byte    14    - T_STRING=258
 11285                                  ;   12 def unsg byte    15    - T_INCLUDE=510
 11286                                  ;   13 def unsg byte    16    - T_DEFINE=511
 11287                                  ;   14 def unsg byte    17    - T_RETURN=512
 11288                                  ;   15 def unsg byte    18    - T_IF=513
 11289                                  ;   16 def unsg byte    19    - T_ELSE=514
 11290                                  ;   17 def unsg byte    20    - T_WHILE=515
 11291                                  ;   18 def unsg byte    21    - T_DO=516
 11292                                  ;   19 def unsg byte    22    - T_INT=517
 11293                                  ;   20 def unsg byte    23    - T_ASM=518
 11294                                  ;   21 def unsg byte    24    - T_ASMBLOCK=519
 11295                                  ;   22 def unsg byte    25    - T_EMIT=520
 11296                                  ;   23 def unsg byte    26    - T_GOTO=521
 11297                                  ;   24 def unsg byte    27    - T_VOID=529
 11298                                  ;   25 def unsg byte    28    - T_CHAR=530
 11299                                  ;   26 def unsg byte    29    - T_SIGNED=531
 11300                                  ;   27 def unsg byte    30    - T_UNSIGNED=532
 11301                                  ;   28 def unsg byte    31    - T_LONG=533
 11302                                  ;   29 def unsg byte    32    - T_EQ=806
 11303                                  ;   30 def unsg byte    33    - T_NE=807
 11304                                  ;   31 def unsg byte    34    - T_GE=811
 11305                                  ;   32 def unsg byte    35    - T_LE=824
 11306                                  ;   33 def unsg byte    36    - T_PLUSPLUS=1219
 11307                                  ;   34 def unsg byte    37    - T_MINUSMINUS=1225
 11308                                  ;   35 def unsg byte    38    - T_PLUSASS=1230
 11309                                  ;   36 def unsg byte    39    - T_MINUSASS=1231
 11310                                  ;   37 def unsg byte    40    - T_MULASS=1232
 11311                                  ;   38 def unsg byte    41    - T_DIVASS=1233
 11312                                  ;   39 def unsg byte    42    - T_ANDASS=1234
 11313                                  ;   40 def unsg byte    43    - T_ORASS=1235
 11314                                  ;   41 def unsg byte    44    - T_LESSLESS=1240
 11315                                  ;   42 def unsg byte    45    - T_GREATGREAT=1241
 11316                                  ;   43 def unsg byte    46    - COMAX=3000
 11317                                  ;   44 def unsg byte    47    - CMDLENMAX=67
 11318                                  ;   45 var unsg word    48    3 ORGDATAORIG
 11319                                  ;   46 var unsg word    48   10 orgData
 11320                                  ;   47 arr sign byte    49    4 co[3000]
 11321                                  ;   48 var sign word    49    4 maxco
 11322                                  ;   49 var sign word    49    3 maxco1
 11323                                  ;   50 arr sign byte    50    2 coname[67]
 11324                                  ;   51 ptr sign byte    50    5 cloc
 11325                                  ;   52 var sign word    51    7 fdin
 11326                                  ;   53 var sign word    51    7 fdout
 11327                                  ;   54 arr sign byte    51  106 symbol[128]
 11328                                  ;   55 arr sign byte    52   10 fname[67]
 11329                                  ;   56 arr sign byte    52   10 namein[67]
 11330                                  ;   57 arr sign byte    53    7 namelst[67]
 11331                                  ;   58 arr sign byte    53    5 archivename[67]
 11332                                  ;   59 var sign word    54   47 token
 11333                                  ;   60 var sign byte    54    2 globC
 11334                                  ;   61 var sign word    54    3 spalte
 11335                                  ;   62 var sign byte    55   28 thechar
 11336                                  ;   63 var sign word    55    9 iscmp
 11337                                  ;   64 var sign word    55    4 nconst
 11338                                  ;   65 var sign word    56    3 nreturn
 11339                                  ;   66 var sign word    56   12 nlabel
 11340                                  ;   67 var sign word    56    3 callrecursive
 11341                                  ;   68 var sign word    57   24 GTop
 11342                                  ;   69 var sign word    57   20 LTop
 11343                                  ;   70 var unsg word    58   44 lexval
 11344                                  ;   71 var sign word    59    6 typei
 11345                                  ;   72 var sign byte    59    8 istype
 11346                                  ;   73 arr sign byte    59   11 GType[300]
 11347                                  ;   74 var sign word    60    6 signi
 11348                                  ;   75 var sign byte    60    5 issign
 11349                                  ;   76 arr sign byte    60    5 GSign[300]
 11350                                  ;   77 var sign word    61    9 widthi
 11351                                  ;   78 var sign byte    61   19 iswidth
 11352                                  ;   79 arr sign byte    61    5 GWidth[300]
 11353                                  ;   80 arr sign word    62    4 GAdr[300]
 11354                                  ;   81 arr sign word    62    6 GUsed[300]
 11355                                  ;   82 var sign word    63   26 wi
 11356                                  ;   83 arr sign word    63   11 GData[300]
 11357                                  ;   84 arr sign byte    63    2 GNameField[4800]
 11358                                  ;   85 var sign word    64   13 FTop
 11359                                  ;   86 var sign word    64    9 CTop
 11360                                  ;   87 arr sign byte    65    2 FType[300]
 11361                                  ;   88 arr sign byte    65    5 CType[2000]
 11362                                  ;   89 arr sign word    66    2 FAdr[300]
 11363                                  ;   90 arr sign word    66    5 CAdr[2000]
 11364                                  ;   91 arr sign word    67    4 FCalls[300]
 11365                                  ;   92 arr sign byte    68    5 FNameField[4800]
 11366                                  ;   93 arr sign byte    69    9 NameA[32]
 11367                                  ;   94 arr sign byte    70    5 fgetsdest[128]
 11368                                  ;   95 ptr unsg byte    70    8 CNameTop
 11369                                  ;   96 ptr unsg byte    71   10 fgetsp
 11370                                  ;   97 var unsg word    71    4 segE
 11371                                  ;   98 var unsg word    72   12 lineno
 11372                                  ;   99 var unsg word    72    2 linenoinclude
 11373                                  ;  100 ptr unsg byte    73   19 pt
 11374                                  ;  101 ptr unsg byte    73    8 p1
 11375                                  ;  102 var sign word    74   10 DOS_ERR
 11376                                  ;  103 var sign word    74    5 DOS_NoBytes
 11377                                  ;  104 var sign byte    74    3 DOS_ByteRead
 11378                                  ;  105 arr sign byte   136    2 doglobName[15]
 11379                                  ;  106 var sign word   296    5 mod1
 11380                                  ;  107 var sign word   296   12 ireg1
 11381                                  ;  108 var sign word   296    6 idx1
 11382                                  ;  109 var sign word   296    1 ids1
 11383                                  ;  110 var sign word   296    4 idw1
 11384                                  ;  111 var sign word   296    2 idt1
 11385                                  ;  112 var sign word   296 NULL val1
 11386                                  ;  113 var sign word   297    2 mod2
 11387                                  ;  114 var sign word   297    6 ireg2
 11388                                  ;  115 var sign word   297    6 idx2
 11389                                  ;  116 var sign word   297    1 ids2
 11390                                  ;  117 var sign word   297    4 idw2
 11391                                  ;  118 var sign word   297    2 idt2
 11392                                  ;  119 var sign word   297    2 val2
 11393                                  ;  120 arr sign byte   362    9 ops[5]
 11394                                  ;  121 arr sign byte   404    3 printregstr[74]
 11395                                  ;  122 var sign word   412    1 evalue
 11396                                  ;  123 var sign word   412    1 exprtype
 11397                                  ;  124 arr sign word   564    2 docalltype[10]
 11398                                  ;  125 arr sign word   564    2 docallvalue[10]
 11399                                  ;  126 arr sign byte   565    2 procname[17]
 11400                                  ;  127 ptr sign byte   620    1 arglen
 11401                                  ;  128 ptr sign byte   620    3 argv
 11402                                  ;  129 var sign byte   664    4 wasfunction
 11403                                  ;  130 arr sign byte   794    2 symboltemp[80]
 11404                                  ;  131 var unsg word   975    1 MAXUI
 11405                                  
 11406                                  
 11407                                  ;   # Calls Line Width  Name   list of functions
 11408                                  
 11409                                  ;    0    4   76   writetty
 11410                                  ;    1    3   77   putch
 11411                                  ;    2   11   78   cputs
 11412                                  ;    3    4   79   mkneg
 11413                                  ;    4    9   81   DosInt
 11414                                  ;    5    3   86   openR
 11415                                  ;    6    1   87   creatR
 11416                                  ;    7    2   88   fcloseR
 11417                                  ;    8    4   89   exitR
 11418                                  ;    9    1   90   readR
 11419                                  ;   10    1   91   readRL
 11420                                  ;   11    1   92   fputcR
 11421                                  ;   12    8   95   strlen
 11422                                  ;   13   24   96   strcpy
 11423                                  ;   14   75   97   eqstr
 11424                                  ;   15    1  100   instr1
 11425                                  ;   16    1  101   instr2
 11426                                  ;   17    1  102   strcat1
 11427                                  ;   18    1  103   toupper
 11428                                  ;   19    2  104   pint
 11429                                  ;   20    4  106   digit
 11430                                  ;   21    4  111   letter
 11431                                  ;   22 NULL  122   alnum
 11432                                  ;   23    4  127   a
 11433                                  ;   24   21  128   v
 11434                                  ;   25    4  133   checknamelen
 11435                                  ;   26    1  137   doglob
 11436                                  ;   27   12  186   gettypes
 11437                                  ;   28    9  195   adrofname
 11438                                  ;   29    7  196   adrF
 11439                                  ;   30    4  198   printName
 11440                                  ;   31   12  202   searchname
 11441                                  ;   32    3  206   checkName
 11442                                  ;   33   10  211   typeName
 11443                                  ;   34    3  227   name1
 11444                                  ;   35    1  232   storecall
 11445                                  ;   36    2  238   storefunc
 11446                                  ;   37    2  242   addlocal
 11447                                  ;   38    1  248   checkFunction
 11448                                  ;   39    2  251   dofunc
 11449                                  ;   40    1  286   isvariable
 11450                                  ;   41    3  299   pexpr
 11451                                  ;   42    1  306   constantexpr
 11452                                  ;   43    3  316   exprstart
 11453                                  ;   44    1  318   expr2
 11454                                  ;   45    3  363   doreg1
 11455                                  ;   46    6  382   checkreg
 11456                                  ;   47    6  407   printreg
 11457                                  ;   48    2  413   expr
 11458                                  ;   49    4  462   compoundass
 11459                                  ;   50    2  469   dovar1
 11460                                  ;   51    8  490   rterm
 11461                                  ;   52    1  503   isreg
 11462                                  ;   53   15  521   doreg
 11463                                  ;   54    1  527   doassign
 11464                                  ;   55    1  545   domul
 11465                                  ;   56    2  549   doidiv
 11466                                  ;   57    1  562   domod
 11467                                  ;   58    1  566   docall1
 11468                                  ;   59 NULL  608   main
 11469                                  ;   60    3  619   getfirstchar
 11470                                  ;   61    1  621   getarg
 11471                                  ;   62    2  640   parse
 11472                                  ;   63    2  649   checkcalls
 11473                                  ;   64    1  665   doar
 11474                                  ;   65    1  692   getfunctionhead
 11475                                  ;   66    1  699   doinclude
 11476                                  ;   67    1  710   dodefine
 11477                                  ;   68    6  726   stmt
 11478                                  ;   69    1  756   doemit
 11479                                  ;   70    3  760   cmpneg
 11480                                  ;   71    7  773   prlabel
 11481                                  ;   72    3  774   prjump
 11482                                  ;   73    1  775   doif
 11483                                  ;   74    1  781   dodo
 11484                                  ;   75    1  785   dowhile
 11485                                  ;   76    4  788   isrelational
 11486                                  ;   77   19  795   getlex
 11487                                  ;   78    1  847   convertdefine
 11488                                  ;   79    1  854   getdigit
 11489                                  ;   80    1  863   getstring
 11490                                  ;   81   31  866   next
 11491                                  ;   82   79  867   istoken
 11492                                  ;   83   36  868   expect
 11493                                  ;   84    6  871   eprc
 11494                                  ;   85    5  872   eprs
 11495                                  ;   86   41  873   prc
 11496                                  ;   87    3  878   prscomment
 11497                                  ;   88    8  880   prnl
 11498                                  ;   89 NULL  882   prs
 11499                                  ;   90    2  887   eprnum
 11500                                  ;   91   16  889   pint1
 11501                                  ;   92   27  891   prunsign1
 11502                                  ;   93   26  894   printint51
 11503                                  ;   94    2  898   fgets1
 11504                                  ;   95    1  902   printinputline
 11505                                  ;   96    2  910   end1
 11506                                  ;   97   50  911   error1
 11507                                  ;   98    2  920   listproc
 11508                                  ;   99    2  928   listvar
 11509                                  ;  100    1  944   listcall
 11510                                  ;  101    1  947   calllisting
 11511                                  ;  102    1  953   countcalls
 11512                                  ;  103    1  961   listfunc
 11513                                  ;  104    1  965   funclisting
 11514                                  ;  105    1  976   epilog
 11515                                  ;  106    1 1008   setblock
 11516                                  ;  107    1 1010   allocmem
 11517                                  ;  108 NULL 1014   copyF
 11518                                  ;  109    1 1020   to_far
 11519                                  ;  110    4 1028   from_far
 11520                                  ;  111 NULL 1036   LastFunctionByt
 11521                                  
 11522                                  ;    #  addr name   list of CALLs
 11523                                  
 11524                                  ;    0     0 writetty
 11525                                  ;    1     9 writetty
 11526                                  ;    2    18 putch
 11527                                  ;    3    24 DosInt
 11528                                  ;    4    31 DosInt
 11529                                  ;    5    38 DosInt
 11530                                  ;    6    45 DosInt
 11531                                  ;    7    52 DosInt
 11532                                  ;    8    59 DosInt
 11533                                  ;    9    66 DosInt
 11534                                  ;   10    73 strcpy
 11535                                  ;   11    80 prc
 11536                                  ;   12    84 mkneg
 11537                                  ;   13    90 pint
 11538                                  ;   14    95 putch
 11539                                  ;   15   101 digit
 11540                                  ;   16   107 digit
 11541                                  ;   17   113 letter
 11542                                  ;   18   120 printName
 11543                                  ;   19   130 prc
 11544                                  ;   20   134 printName
 11545                                  ;   21   144 prc
 11546                                  ;   22   148 strlen
 11547                                  ;   23   155 error1
 11548                                  ;   24   162 error1
 11549                                  ;   25   169 error1
 11550                                  ;   26   176 checknamelen
 11551                                  ;   27   189 checkName
 11552                                  ;   28   199 error1
 11553                                  ;   29   206 istoken
 11554                                  ;   30   214 istoken
 11555                                  ;   31   222 prs
 11556                                  ;   32   226 prunsign1
 11557                                  ;   33   236 prs
 11558                                  ;   34   240 prs
 11559                                  ;   35   244 prs
 11560                                  ;   36   248 prs
 11561                                  ;   37   252 prs
 11562                                  ;   38   256 prunsign1
 11563                                  ;   39   266 prs
 11564                                  ;   40   270 expect
 11565                                  ;   41   277 expect
 11566                                  ;   42   284 error1
 11567                                  ;   43   291 prs
 11568                                  ;   44   295 prs
 11569                                  ;   45   299 prs
 11570                                  ;   46   303 strcpy
 11571                                  ;   47   310 expect
 11572                                  ;   48   317 istoken
 11573                                  ;   49   325 prc
 11574                                  ;   50   329 prscomment
 11575                                  ;   51   340 prc
 11576                                  ;   52   344 prs
 11577                                  ;   53   348 strlen
 11578                                  ;   54   355 istoken
 11579                                  ;   55   363 prc
 11580                                  ;   56   367 expect
 11581                                  ;   57   374 prunsign1
 11582                                  ;   58   384 istoken
 11583                                  ;   59   392 expect
 11584                                  ;   60   399 error1
 11585                                  ;   61   406 prs
 11586                                  ;   62   410 prs
 11587                                  ;   63   414 prs
 11588                                  ;   64   418 prs
 11589                                  ;   65   422 prs
 11590                                  ;   66   426 prs
 11591                                  ;   67   430 istoken
 11592                                  ;   68   438 prc
 11593                                  ;   69   442 istoken
 11594                                  ;   70   450 expect
 11595                                  ;   71   457 prunsign1
 11596                                  ;   72   467 prunsign1
 11597                                  ;   73   477 adrofname
 11598                                  ;   74   487 strcpy
 11599                                  ;   75   494 strcpy
 11600                                  ;   76   501 expect
 11601                                  ;   77   508 adrF
 11602                                  ;   78   513 adrofname
 11603                                  ;   79   523 prs
 11604                                  ;   80   527 prs
 11605                                  ;   81   531 prc
 11606                                  ;   82   535 pint1
 11607                                  ;   83   541 prc
 11608                                  ;   84   545 checkName
 11609                                  ;   85   555 error1
 11610                                  ;   86   562 adrofname
 11611                                  ;   87   572 eqstr
 11612                                  ;   88   578 adrofname
 11613                                  ;   89   588 eqstr
 11614                                  ;   90   594 istoken
 11615                                  ;   91   602 istoken
 11616                                  ;   92   610 istoken
 11617                                  ;   93   618 istoken
 11618                                  ;   94   626 istoken
 11619                                  ;   95   634 istoken
 11620                                  ;   96   642 istoken
 11621                                  ;   97   650 istoken
 11622                                  ;   98   658 name1
 11623                                  ;   99   664 error1
 11624                                  ;  100   671 getlex
 11625                                  ;  101   678 error1
 11626                                  ;  102   685 error1
 11627                                  ;  103   692 strlen
 11628                                  ;  104   699 to_far
 11629                                  ;  105   706 error1
 11630                                  ;  106   713 adrF
 11631                                  ;  107   718 strcpy
 11632                                  ;  108   725 error1
 11633                                  ;  109   732 checkName
 11634                                  ;  110   742 error1
 11635                                  ;  111   749 adrF
 11636                                  ;  112   754 strcpy
 11637                                  ;  113   761 adrF
 11638                                  ;  114   766 eqstr
 11639                                  ;  115   772 checknamelen
 11640                                  ;  116   785 strcpy
 11641                                  ;  117   792 checkFunction
 11642                                  ;  118   806 error1
 11643                                  ;  119   813 storefunc
 11644                                  ;  120   823 prs
 11645                                  ;  121   827 prs
 11646                                  ;  122   831 prs
 11647                                  ;  123   835 expect
 11648                                  ;  124   842 istoken
 11649                                  ;  125   850 typeName
 11650                                  ;  126   859 addlocal
 11651                                  ;  127   868 istoken
 11652                                  ;  128   876 expect
 11653                                  ;  129   883 expect
 11654                                  ;  130   890 isvariable
 11655                                  ;  131   901 typeName
 11656                                  ;  132   910 checknamelen
 11657                                  ;  133   923 addlocal
 11658                                  ;  134   932 istoken
 11659                                  ;  135   940 expect
 11660                                  ;  136   947 expect
 11661                                  ;  137   954 istoken
 11662                                  ;  138   962 expect
 11663                                  ;  139   969 listproc
 11664                                  ;  140   978 prs
 11665                                  ;  141   982 mkneg
 11666                                  ;  142   988 pint1
 11667                                  ;  143   994 prs
 11668                                  ;  144   998 istoken
 11669                                  ;  145  1006 stmt
 11670                                  ;  146  1011 prs
 11671                                  ;  147  1015 prs
 11672                                  ;  148  1019 prs
 11673                                  ;  149  1023 prs
 11674                                  ;  150  1027 prs
 11675                                  ;  151  1031 strlen
 11676                                  ;  152  1038 strcpy
 11677                                  ;  153  1045 expect
 11678                                  ;  154  1052 eqstr
 11679                                  ;  155  1058 constantexpr
 11680                                  ;  156  1071 checkreg
 11681                                  ;  157  1080 doreg1
 11682                                  ;  158  1087 exprstart
 11683                                  ;  159  1097 prs
 11684                                  ;  160  1101 prs
 11685                                  ;  161  1105 expect
 11686                                  ;  162  1112 getlex
 11687                                  ;  163  1119 typeName
 11688                                  ;  164  1128 searchname
 11689                                  ;  165  1139 gettypes
 11690                                  ;  166  1148 isrelational
 11691                                  ;  167  1161 error1
 11692                                  ;  168  1168 expect
 11693                                  ;  169  1175 prs
 11694                                  ;  170  1179 prs
 11695                                  ;  171  1183 gettypes
 11696                                  ;  172  1192 prs
 11697                                  ;  173  1196 prs
 11698                                  ;  174  1200 v
 11699                                  ;  175  1202 prs
 11700                                  ;  176  1206 prunsign1
 11701                                  ;  177  1216 cmpneg
 11702                                  ;  178  1223 prs
 11703                                  ;  179  1227 expect
 11704                                  ;  180  1234 eqstr
 11705                                  ;  181  1240 expr2
 11706                                  ;  182  1246 expr
 11707                                  ;  183  1251 getlex
 11708                                  ;  184  1258 typeName
 11709                                  ;  185  1267 error1
 11710                                  ;  186  1274 checkreg
 11711                                  ;  187  1283 doreg1
 11712                                  ;  188  1290 searchname
 11713                                  ;  189  1301 gettypes
 11714                                  ;  190  1310 error1
 11715                                  ;  191  1317 isrelational
 11716                                  ;  192  1330 error1
 11717                                  ;  193  1337 istoken
 11718                                  ;  194  1345 error1
 11719                                  ;  195  1352 istoken
 11720                                  ;  196  1360 prs
 11721                                  ;  197  1364 prs
 11722                                  ;  198  1368 prs
 11723                                  ;  199  1372 prs
 11724                                  ;  200  1376 prs
 11725                                  ;  201  1380 v
 11726                                  ;  202  1382 prs
 11727                                  ;  203  1386 prunsign1
 11728                                  ;  204  1396 adrofname
 11729                                  ;  205  1406 prs
 11730                                  ;  206  1410 prs
 11731                                  ;  207  1414 typeName
 11732                                  ;  208  1423 checkreg
 11733                                  ;  209  1432 prs
 11734                                  ;  210  1436 printreg
 11735                                  ;  211  1445 v
 11736                                  ;  212  1447 prs
 11737                                  ;  213  1451 printreg
 11738                                  ;  214  1460 error1
 11739                                  ;  215  1467 searchname
 11740                                  ;  216  1478 gettypes
 11741                                  ;  217  1487 error1
 11742                                  ;  218  1494 prs
 11743                                  ;  219  1498 printreg
 11744                                  ;  220  1507 error1
 11745                                  ;  221  1514 prs
 11746                                  ;  222  1518 a
 11747                                  ;  223  1520 prs
 11748                                  ;  224  1524 prs
 11749                                  ;  225  1528 prs
 11750                                  ;  226  1532 v
 11751                                  ;  227  1534 adrofname
 11752                                  ;  228  1544 prs
 11753                                  ;  229  1548 prs
 11754                                  ;  230  1552 error1
 11755                                  ;  231  1559 istoken
 11756                                  ;  232  1567 strcpy
 11757                                  ;  233  1574 istoken
 11758                                  ;  234  1582 strcpy
 11759                                  ;  235  1589 istoken
 11760                                  ;  236  1597 strcpy
 11761                                  ;  237  1604 istoken
 11762                                  ;  238  1612 strcpy
 11763                                  ;  239  1619 istoken
 11764                                  ;  240  1627 strcpy
 11765                                  ;  241  1634 istoken
 11766                                  ;  242  1642 strcpy
 11767                                  ;  243  1649 istoken
 11768                                  ;  244  1657 strcpy
 11769                                  ;  245  1664 getlex
 11770                                  ;  246  1671 isrelational
 11771                                  ;  247  1684 error1
 11772                                  ;  248  1691 strcpy
 11773                                  ;  249  1698 prnl
 11774                                  ;  250  1703 prs
 11775                                  ;  251  1707 prs
 11776                                  ;  252  1711 printreg
 11777                                  ;  253  1720 prs
 11778                                  ;  254  1724 istoken
 11779                                  ;  255  1732 prunsign1
 11780                                  ;  256  1742 typeName
 11781                                  ;  257  1751 checkreg
 11782                                  ;  258  1760 printreg
 11783                                  ;  259  1769 searchname
 11784                                  ;  260  1780 a
 11785                                  ;  261  1782 v
 11786                                  ;  262  1784 cmpneg
 11787                                  ;  263  1791 prs
 11788                                  ;  264  1795 expect
 11789                                  ;  265  1802 strlen
 11790                                  ;  266  1809 eqstr
 11791                                  ;  267  1815 eqstr
 11792                                  ;  268  1821 eqstr
 11793                                  ;  269  1827 eqstr
 11794                                  ;  270  1833 eqstr
 11795                                  ;  271  1839 eqstr
 11796                                  ;  272  1845 eqstr
 11797                                  ;  273  1851 eqstr
 11798                                  ;  274  1857 eqstr
 11799                                  ;  275  1863 eqstr
 11800                                  ;  276  1869 eqstr
 11801                                  ;  277  1875 eqstr
 11802                                  ;  278  1881 eqstr
 11803                                  ;  279  1887 eqstr
 11804                                  ;  280  1893 eqstr
 11805                                  ;  281  1899 eqstr
 11806                                  ;  282  1905 eqstr
 11807                                  ;  283  1911 eqstr
 11808                                  ;  284  1917 eqstr
 11809                                  ;  285  1923 eqstr
 11810                                  ;  286  1929 eqstr
 11811                                  ;  287  1935 eqstr
 11812                                  ;  288  1941 strlen
 11813                                  ;  289  1948 eqstr
 11814                                  ;  290  1954 eqstr
 11815                                  ;  291  1960 eqstr
 11816                                  ;  292  1966 eqstr
 11817                                  ;  293  1972 eqstr
 11818                                  ;  294  1978 eqstr
 11819                                  ;  295  1984 eqstr
 11820                                  ;  296  1990 eqstr
 11821                                  ;  297  1996 eqstr
 11822                                  ;  298  2002 prc
 11823                                  ;  299  2006 prc
 11824                                  ;  300  2010 prc
 11825                                  ;  301  2014 istoken
 11826                                  ;  302  2022 prs
 11827                                  ;  303  2026 prunsign1
 11828                                  ;  304  2036 typeName
 11829                                  ;  305  2045 checkreg
 11830                                  ;  306  2054 doreg1
 11831                                  ;  307  2061 docall1
 11832                                  ;  308  2069 isreg
 11833                                  ;  309  2075 searchname
 11834                                  ;  310  2086 gettypes
 11835                                  ;  311  2095 istoken
 11836                                  ;  312  2103 istoken
 11837                                  ;  313  2111 expect
 11838                                  ;  314  2118 searchname
 11839                                  ;  315  2129 expect
 11840                                  ;  316  2136 expect
 11841                                  ;  317  2143 gettypes
 11842                                  ;  318  2152 error1
 11843                                  ;  319  2159 istoken
 11844                                  ;  320  2167 error1
 11845                                  ;  321  2174 prs
 11846                                  ;  322  2178 prs
 11847                                  ;  323  2182 prs
 11848                                  ;  324  2186 v
 11849                                  ;  325  2188 istoken
 11850                                  ;  326  2196 error1
 11851                                  ;  327  2203 prs
 11852                                  ;  328  2207 prs
 11853                                  ;  329  2211 prs
 11854                                  ;  330  2215 v
 11855                                  ;  331  2217 istoken
 11856                                  ;  332  2225 compoundass
 11857                                  ;  333  2237 istoken
 11858                                  ;  334  2245 compoundass
 11859                                  ;  335  2257 istoken
 11860                                  ;  336  2265 compoundass
 11861                                  ;  337  2277 istoken
 11862                                  ;  338  2285 compoundass
 11863                                  ;  339  2297 istoken
 11864                                  ;  340  2305 error1
 11865                                  ;  341  2312 istoken
 11866                                  ;  342  2320 error1
 11867                                  ;  343  2327 istoken
 11868                                  ;  344  2335 expr
 11869                                  ;  345  2340 doassign
 11870                                  ;  346  2349 dovar1
 11871                                  ;  347  2356 istoken
 11872                                  ;  348  2364 rterm
 11873                                  ;  349  2370 istoken
 11874                                  ;  350  2378 rterm
 11875                                  ;  351  2384 istoken
 11876                                  ;  352  2392 rterm
 11877                                  ;  353  2398 istoken
 11878                                  ;  354  2406 rterm
 11879                                  ;  355  2412 istoken
 11880                                  ;  356  2420 rterm
 11881                                  ;  357  2426 istoken
 11882                                  ;  358  2434 rterm
 11883                                  ;  359  2440 istoken
 11884                                  ;  360  2448 domul
 11885                                  ;  361  2454 istoken
 11886                                  ;  362  2462 doidiv
 11887                                  ;  363  2469 istoken
 11888                                  ;  364  2477 domod
 11889                                  ;  365  2483 isrelational
 11890                                  ;  366  2496 rterm
 11891                                  ;  367  2502 cmpneg
 11892                                  ;  368  2509 error1
 11893                                  ;  369  2516 prnl
 11894                                  ;  370  2521 prs
 11895                                  ;  371  2525 prs
 11896                                  ;  372  2529 gettypes
 11897                                  ;  373  2538 prs
 11898                                  ;  374  2542 prs
 11899                                  ;  375  2546 v
 11900                                  ;  376  2548 prs
 11901                                  ;  377  2552 expect
 11902                                  ;  378  2559 prunsign1
 11903                                  ;  379  2569 gettypes
 11904                                  ;  380  2578 prs
 11905                                  ;  381  2582 v
 11906                                  ;  382  2584 prnl
 11907                                  ;  383  2589 prs
 11908                                  ;  384  2593 prs
 11909                                  ;  385  2597 prs
 11910                                  ;  386  2601 prnl
 11911                                  ;  387  2606 prs
 11912                                  ;  388  2610 prs
 11913                                  ;  389  2614 a
 11914                                  ;  390  2616 prs
 11915                                  ;  391  2620 v
 11916                                  ;  392  2622 prs
 11917                                  ;  393  2626 prs
 11918                                  ;  394  2630 prs
 11919                                  ;  395  2634 prs
 11920                                  ;  396  2638 prs
 11921                                  ;  397  2642 prc
 11922                                  ;  398  2646 printName
 11923                                  ;  399  2656 prs
 11924                                  ;  400  2660 prnl
 11925                                  ;  401  2665 prs
 11926                                  ;  402  2669 prs
 11927                                  ;  403  2673 prs
 11928                                  ;  404  2677 prs
 11929                                  ;  405  2681 v
 11930                                  ;  406  2683 istoken
 11931                                  ;  407  2691 prnl
 11932                                  ;  408  2696 prs
 11933                                  ;  409  2700 prs
 11934                                  ;  410  2704 prs
 11935                                  ;  411  2708 prs
 11936                                  ;  412  2712 prunsign1
 11937                                  ;  413  2722 typeName
 11938                                  ;  414  2731 searchname
 11939                                  ;  415  2742 istoken
 11940                                  ;  416  2750 searchname
 11941                                  ;  417  2761 expect
 11942                                  ;  418  2768 expect
 11943                                  ;  419  2775 gettypes
 11944                                  ;  420  2784 error1
 11945                                  ;  421  2791 eqstr
 11946                                  ;  422  2797 dovar1
 11947                                  ;  423  2804 eqstr
 11948                                  ;  424  2810 doreg
 11949                                  ;  425  2816 eqstr
 11950                                  ;  426  2822 doreg
 11951                                  ;  427  2828 eqstr
 11952                                  ;  428  2834 doreg
 11953                                  ;  429  2840 eqstr
 11954                                  ;  430  2846 doreg
 11955                                  ;  431  2852 eqstr
 11956                                  ;  432  2858 doreg
 11957                                  ;  433  2864 eqstr
 11958                                  ;  434  2870 doreg
 11959                                  ;  435  2876 eqstr
 11960                                  ;  436  2882 doreg
 11961                                  ;  437  2888 eqstr
 11962                                  ;  438  2894 doreg
 11963                                  ;  439  2900 eqstr
 11964                                  ;  440  2906 doreg
 11965                                  ;  441  2912 eqstr
 11966                                  ;  442  2918 doreg
 11967                                  ;  443  2924 eqstr
 11968                                  ;  444  2930 doreg
 11969                                  ;  445  2936 eqstr
 11970                                  ;  446  2942 doreg
 11971                                  ;  447  2948 eqstr
 11972                                  ;  448  2954 doreg
 11973                                  ;  449  2960 eqstr
 11974                                  ;  450  2966 doreg
 11975                                  ;  451  2972 eqstr
 11976                                  ;  452  2978 doreg
 11977                                  ;  453  2984 expect
 11978                                  ;  454  2991 prs
 11979                                  ;  455  2995 prs
 11980                                  ;  456  2999 prs
 11981                                  ;  457  3003 istoken
 11982                                  ;  458  3011 prunsign1
 11983                                  ;  459  3021 istoken
 11984                                  ;  460  3029 searchname
 11985                                  ;  461  3040 v
 11986                                  ;  462  3042 error1
 11987                                  ;  463  3049 gettypes
 11988                                  ;  464  3058 prs
 11989                                  ;  465  3062 v
 11990                                  ;  466  3064 prs
 11991                                  ;  467  3068 prs
 11992                                  ;  468  3072 prs
 11993                                  ;  469  3076 a
 11994                                  ;  470  3078 prs
 11995                                  ;  471  3082 prs
 11996                                  ;  472  3086 prunsign1
 11997                                  ;  473  3096 v
 11998                                  ;  474  3098 prs
 11999                                  ;  475  3102 prs
 12000                                  ;  476  3106 printName
 12001                                  ;  477  3116 prs
 12002                                  ;  478  3120 prs
 12003                                  ;  479  3124 prs
 12004                                  ;  480  3128 prs
 12005                                  ;  481  3132 v
 12006                                  ;  482  3134 prs
 12007                                  ;  483  3138 prs
 12008                                  ;  484  3142 prs
 12009                                  ;  485  3146 v
 12010                                  ;  486  3148 prs
 12011                                  ;  487  3152 prs
 12012                                  ;  488  3156 prs
 12013                                  ;  489  3160 v
 12014                                  ;  490  3162 prs
 12015                                  ;  491  3166 rterm
 12016                                  ;  492  3172 istoken
 12017                                  ;  493  3180 prs
 12018                                  ;  494  3184 prunsign1
 12019                                  ;  495  3194 prs
 12020                                  ;  496  3198 error1
 12021                                  ;  497  3205 istoken
 12022                                  ;  498  3213 prs
 12023                                  ;  499  3217 prunsign1
 12024                                  ;  500  3227 prs
 12025                                  ;  501  3231 prs
 12026                                  ;  502  3235 typeName
 12027                                  ;  503  3244 searchname
 12028                                  ;  504  3255 error1
 12029                                  ;  505  3262 gettypes
 12030                                  ;  506  3271 error1
 12031                                  ;  507  3278 error1
 12032                                  ;  508  3285 prs
 12033                                  ;  509  3289 v
 12034                                  ;  510  3291 prs
 12035                                  ;  511  3295 prs
 12036                                  ;  512  3299 doidiv
 12037                                  ;  513  3306 prs
 12038                                  ;  514  3310 checknamelen
 12039                                  ;  515  3323 strcpy
 12040                                  ;  516  3330 storecall
 12041                                  ;  517  3340 expect
 12042                                  ;  518  3347 istoken
 12043                                  ;  519  3355 error1
 12044                                  ;  520  3362 istoken
 12045                                  ;  521  3370 istoken
 12046                                  ;  522  3378 eprs
 12047                                  ;  523  3383 eprs
 12048                                  ;  524  3388 eprc
 12049                                  ;  525  3393 eprnum
 12050                                  ;  526  3400 eprs
 12051                                  ;  527  3405 eprc
 12052                                  ;  528  3410 eprs
 12053                                  ;  529  3415 eprc
 12054                                  ;  530  3420 eprs
 12055                                  ;  531  3425 istoken
 12056                                  ;  532  3433 name1
 12057                                  ;  533  3439 searchname
 12058                                  ;  534  3450 istoken
 12059                                  ;  535  3458 checkreg
 12060                                  ;  536  3467 searchname
 12061                                  ;  537  3478 error1
 12062                                  ;  538  3485 istoken
 12063                                  ;  539  3493 expect
 12064                                  ;  540  3500 prs
 12065                                  ;  541  3504 pint1
 12066                                  ;  542  3510 prs
 12067                                  ;  543  3514 prs
 12068                                  ;  544  3518 prc
 12069                                  ;  545  3522 pint1
 12070                                  ;  546  3528 prs
 12071                                  ;  547  3532 v
 12072                                  ;  548  3534 prs
 12073                                  ;  549  3538 gettypes
 12074                                  ;  550  3547 prs
 12075                                  ;  551  3551 v
 12076                                  ;  552  3553 prs
 12077                                  ;  553  3557 v
 12078                                  ;  554  3559 prs
 12079                                  ;  555  3563 prs
 12080                                  ;  556  3567 printreg
 12081                                  ;  557  3576 prs
 12082                                  ;  558  3580 prs
 12083                                  ;  559  3584 prs
 12084                                  ;  560  3588 pint1
 12085                                  ;  561  3594 getarg
 12086                                  ;  562  3601 setblock
 12087                                  ;  563  3610 error1
 12088                                  ;  564  3617 allocmem
 12089                                  ;  565  3626 error1
 12090                                  ;  566  3633 getfirstchar
 12091                                  ;  567  3646 parse
 12092                                  ;  568  3652 checkcalls
 12093                                  ;  569  3663 epilog
 12094                                  ;  570  3670 fgets1
 12095                                  ;  571  3677 cputs
 12096                                  ;  572  3683 cputs
 12097                                  ;  573  3689 readRL
 12098                                  ;  574  3696 prnl
 12099                                  ;  575  3701 strcpy
 12100                                  ;  576  3708 instr2
 12101                                  ;  577  3715 strcat1
 12102                                  ;  578  3723 toupper
 12103                                  ;  579  3731 strcpy
 12104                                  ;  580  3738 strlen
 12105                                  ;  581  3745 openR
 12106                                  ;  582  3751 cputs
 12107                                  ;  583  3757 cputs
 12108                                  ;  584  3763 exitR
 12109                                  ;  585  3769 creatR
 12110                                  ;  586  3776 cputs
 12111                                  ;  587  3782 cputs
 12112                                  ;  588  3788 exitR
 12113                                  ;  589  3794 prs
 12114                                  ;  590  3798 prs
 12115                                  ;  591  3802 prs
 12116                                  ;  592  3806 pint1
 12117                                  ;  593  3812 prs
 12118                                  ;  594  3816 prs
 12119                                  ;  595  3820 prs
 12120                                  ;  596  3824 prs
 12121                                  ;  597  3828 prs
 12122                                  ;  598  3832 prs
 12123                                  ;  599  3836 prs
 12124                                  ;  600  3840 getlex
 12125                                  ;  601  3847 istoken
 12126                                  ;  602  3855 istoken
 12127                                  ;  603  3863 dodefine
 12128                                  ;  604  3872 istoken
 12129                                  ;  605  3880 doinclude
 12130                                  ;  606  3890 error1
 12131                                  ;  607  3897 typeName
 12132                                  ;  608  3906 dofunc
 12133                                  ;  609  3913 doglob
 12134                                  ;  610  3920 prs
 12135                                  ;  611  3924 from_far
 12136                                  ;  612  3933 adrF
 12137                                  ;  613  3938 eqstr
 12138                                  ;  614  3944 prs
 12139                                  ;  615  3948 prs
 12140                                  ;  616  3952 doar
 12141                                  ;  617  3957 prs
 12142                                  ;  618  3961 cputs
 12143                                  ;  619  3967 cputs
 12144                                  ;  620  3973 pint
 12145                                  ;  621  3978 prs
 12146                                  ;  622  3982 printint51
 12147                                  ;  623  3993 openR
 12148                                  ;  624  3999 cputs
 12149                                  ;  625  4005 cputs
 12150                                  ;  626  4011 exitR
 12151                                  ;  627  4017 prs
 12152                                  ;  628  4021 prs
 12153                                  ;  629  4025 getfirstchar
 12154                                  ;  630  4038 getfunctionhead
 12155                                  ;  631  4054 from_far
 12156                                  ;  632  4063 eqstr
 12157                                  ;  633  4069 prs
 12158                                  ;  634  4073 printint51
 12159                                  ;  635  4084 prs
 12160                                  ;  636  4088 prs
 12161                                  ;  637  4092 dofunc
 12162                                  ;  638  4099 prs
 12163                                  ;  639  4103 checkcalls
 12164                                  ;  640  4114 putch
 12165                                  ;  641  4120 cputs
 12166                                  ;  642  4126 error1
 12167                                  ;  643  4133 getlex
 12168                                  ;  644  4140 istoken
 12169                                  ;  645  4148 getlex
 12170                                  ;  646  4155 prs
 12171                                  ;  647  4159 prs
 12172                                  ;  648  4163 openR
 12173                                  ;  649  4169 prs
 12174                                  ;  650  4173 prs
 12175                                  ;  651  4177 error1
 12176                                  ;  652  4184 parse
 12177                                  ;  653  4190 prs
 12178                                  ;  654  4194 prs
 12179                                  ;  655  4198 getfirstchar
 12180                                  ;  656  4211 getlex
 12181                                  ;  657  4218 eqstr
 12182                                  ;  658  4224 getlex
 12183                                  ;  659  4231 eqstr
 12184                                  ;  660  4237 getlex
 12185                                  ;  661  4244 prs
 12186                                  ;  662  4248 strcpy
 12187                                  ;  663  4255 prs
 12188                                  ;  664  4259 error1
 12189                                  ;  665  4266 getlex
 12190                                  ;  666  4273 expect
 12191                                  ;  667  4280 error1
 12192                                  ;  668  4287 strlen
 12193                                  ;  669  4294 error1
 12194                                  ;  670  4301 adrofname
 12195                                  ;  671  4311 strcpy
 12196                                  ;  672  4318 expect
 12197                                  ;  673  4325 istoken
 12198                                  ;  674  4333 istoken
 12199                                  ;  675  4341 stmt
 12200                                  ;  676  4346 istoken
 12201                                  ;  677  4354 doif
 12202                                  ;  678  4359 istoken
 12203                                  ;  679  4367 dodo
 12204                                  ;  680  4372 istoken
 12205                                  ;  681  4380 dowhile
 12206                                  ;  682  4388 istoken
 12207                                  ;  683  4396 prs
 12208                                  ;  684  4400 name1
 12209                                  ;  685  4406 prs
 12210                                  ;  686  4410 expect
 12211                                  ;  687  4417 prs
 12212                                  ;  688  4421 next
 12213                                  ;  689  4426 prc
 12214                                  ;  690  4430 next
 12215                                  ;  691  4435 getlex
 12216                                  ;  692  4442 istoken
 12217                                  ;  693  4450 prs
 12218                                  ;  694  4454 next
 12219                                  ;  695  4459 prc
 12220                                  ;  696  4463 next
 12221                                  ;  697  4468 getlex
 12222                                  ;  698  4475 error1
 12223                                  ;  699  4482 istoken
 12224                                  ;  700  4490 doemit
 12225                                  ;  701  4497 istoken
 12226                                  ;  702  4505 istoken
 12227                                  ;  703  4513 exprstart
 12228                                  ;  704  4523 prs
 12229                                  ;  705  4527 expect
 12230                                  ;  706  4534 prs
 12231                                  ;  707  4538 prs
 12232                                  ;  708  4542 prc
 12233                                  ;  709  4546 expect
 12234                                  ;  710  4553 expect
 12235                                  ;  711  4560 exprstart
 12236                                  ;  712  4570 expect
 12237                                  ;  713  4577 prs
 12238                                  ;  714  4581 getlex
 12239                                  ;  715  4588 prunsign1
 12240                                  ;  716  4598 getlex
 12241                                  ;  717  4605 prc
 12242                                  ;  718  4609 expect
 12243                                  ;  719  4616 prs
 12244                                  ;  720  4620 prs
 12245                                  ;  721  4624 prs
 12246                                  ;  722  4628 prs
 12247                                  ;  723  4632 prs
 12248                                  ;  724  4636 prunsign1
 12249                                  ;  725  4646 prs
 12250                                  ;  726  4650 prs
 12251                                  ;  727  4654 prunsign1
 12252                                  ;  728  4664 prs
 12253                                  ;  729  4668 prs
 12254                                  ;  730  4672 prs
 12255                                  ;  731  4676 error1
 12256                                  ;  732  4683 prs
 12257                                  ;  733  4687 prs
 12258                                  ;  734  4691 pint1
 12259                                  ;  735  4697 prc
 12260                                  ;  736  4701 prs
 12261                                  ;  737  4705 prs
 12262                                  ;  738  4709 pint1
 12263                                  ;  739  4715 pexpr
 12264                                  ;  740  4721 pint1
 12265                                  ;  741  4727 stmt
 12266                                  ;  742  4732 istoken
 12267                                  ;  743  4740 prjump
 12268                                  ;  744  4747 prlabel
 12269                                  ;  745  4755 stmt
 12270                                  ;  746  4760 prlabel
 12271                                  ;  747  4768 prlabel
 12272                                  ;  748  4776 prlabel
 12273                                  ;  749  4784 stmt
 12274                                  ;  750  4789 expect
 12275                                  ;  751  4796 pexpr
 12276                                  ;  752  4802 pint1
 12277                                  ;  753  4808 prjump
 12278                                  ;  754  4815 prlabel
 12279                                  ;  755  4823 prlabel
 12280                                  ;  756  4831 pexpr
 12281                                  ;  757  4837 pint1
 12282                                  ;  758  4843 stmt
 12283                                  ;  759  4848 prjump
 12284                                  ;  760  4855 prlabel
 12285                                  ;  761  4863 getlex
 12286                                  ;  762  4870 next
 12287                                  ;  763  4875 next
 12288                                  ;  764  4880 next
 12289                                  ;  765  4885 next
 12290                                  ;  766  4890 next
 12291                                  ;  767  4895 next
 12292                                  ;  768  4900 next
 12293                                  ;  769  4905 next
 12294                                  ;  770  4910 next
 12295                                  ;  771  4915 next
 12296                                  ;  772  4920 next
 12297                                  ;  773  4925 next
 12298                                  ;  774  4930 next
 12299                                  ;  775  4935 next
 12300                                  ;  776  4940 next
 12301                                  ;  777  4945 instr1
 12302                                  ;  778  4952 next
 12303                                  ;  779  4957 getlex
 12304                                  ;  780  4964 next
 12305                                  ;  781  4969 next
 12306                                  ;  782  4974 getlex
 12307                                  ;  783  4981 getstring
 12308                                  ;  784  4991 digit
 12309                                  ;  785  4997 getdigit
 12310                                  ;  786  5006 next
 12311                                  ;  787  5011 next
 12312                                  ;  788  5016 next
 12313                                  ;  789  5021 letter
 12314                                  ;  790  5028 strcpy
 12315                                  ;  791  5035 letter
 12316                                  ;  792  5042 next
 12317                                  ;  793  5047 eqstr
 12318                                  ;  794  5053 eqstr
 12319                                  ;  795  5059 eqstr
 12320                                  ;  796  5065 eqstr
 12321                                  ;  797  5071 eqstr
 12322                                  ;  798  5077 eqstr
 12323                                  ;  799  5083 eqstr
 12324                                  ;  800  5089 eqstr
 12325                                  ;  801  5095 eqstr
 12326                                  ;  802  5101 eqstr
 12327                                  ;  803  5107 eqstr
 12328                                  ;  804  5113 eqstr
 12329                                  ;  805  5119 eqstr
 12330                                  ;  806  5125 eqstr
 12331                                  ;  807  5131 eqstr
 12332                                  ;  808  5137 eqstr
 12333                                  ;  809  5143 eqstr
 12334                                  ;  810  5149 convertdefine
 12335                                  ;  811  5163 strcpy
 12336                                  ;  812  5170 error1
 12337                                  ;  813  5177 adrofname
 12338                                  ;  814  5187 eqstr
 12339                                  ;  815  5193 next
 12340                                  ;  816  5198 letter
 12341                                  ;  817  5205 next
 12342                                  ;  818  5210 digit
 12343                                  ;  819  5216 next
 12344                                  ;  820  5221 next
 12345                                  ;  821  5226 next
 12346                                  ;  822  5231 fgets1
 12347                                  ;  823  5238 getlex
 12348                                  ;  824  5245 istoken
 12349                                  ;  825  5253 prs
 12350                                  ;  826  5257 listproc
 12351                                  ;  827  5266 prs
 12352                                  ;  828  5270 pint1
 12353                                  ;  829  5276 error1
 12354                                  ;  830  5283 eprc
 12355                                  ;  831  5288 writetty
 12356                                  ;  832  5297 writetty
 12357                                  ;  833  5306 fputcR
 12358                                  ;  834  5313 prc
 12359                                  ;  835  5317 prs
 12360                                  ;  836  5321 prc
 12361                                  ;  837  5325 eprc
 12362                                  ;  838  5330 mkneg
 12363                                  ;  839  5336 eprnum
 12364                                  ;  840  5343 eprc
 12365                                  ;  841  5348 prc
 12366                                  ;  842  5352 mkneg
 12367                                  ;  843  5358 pint1
 12368                                  ;  844  5364 prc
 12369                                  ;  845  5368 prunsign1
 12370                                  ;  846  5378 prc
 12371                                  ;  847  5382 prc
 12372                                  ;  848  5386 prc
 12373                                  ;  849  5390 prc
 12374                                  ;  850  5394 prc
 12375                                  ;  851  5398 prunsign1
 12376                                  ;  852  5408 printinputline
 12377                                  ;  853  5423 readR
 12378                                  ;  854  5429 prs
 12379                                  ;  855  5433 prunsign1
 12380                                  ;  856  5443 prc
 12381                                  ;  857  5447 prscomment
 12382                                  ;  858  5458 fcloseR
 12383                                  ;  859  5466 fcloseR
 12384                                  ;  860  5474 exitR
 12385                                  ;  861  5480 prnl
 12386                                  ;  862  5485 prscomment
 12387                                  ;  863  5496 prs
 12388                                  ;  864  5500 prunsign1
 12389                                  ;  865  5510 prs
 12390                                  ;  866  5514 prs
 12391                                  ;  867  5518 prs
 12392                                  ;  868  5522 pint1
 12393                                  ;  869  5528 prs
 12394                                  ;  870  5532 prunsign1
 12395                                  ;  871  5542 prs
 12396                                  ;  872  5546 prc
 12397                                  ;  873  5550 prs
 12398                                  ;  874  5554 pint1
 12399                                  ;  875  5560 prs
 12400                                  ;  876  5564 prs
 12401                                  ;  877  5568 end1
 12402                                  ;  878  5573 prs
 12403                                  ;  879  5577 prs
 12404                                  ;  880  5581 prs
 12405                                  ;  881  5585 prunsign1
 12406                                  ;  882  5595 prs
 12407                                  ;  883  5599 listvar
 12408                                  ;  884  5607 prs
 12409                                  ;  885  5611 printint51
 12410                                  ;  886  5622 prc
 12411                                  ;  887  5626 prs
 12412                                  ;  888  5630 prs
 12413                                  ;  889  5634 prs
 12414                                  ;  890  5638 prs
 12415                                  ;  891  5642 prs
 12416                                  ;  892  5646 prs
 12417                                  ;  893  5650 prs
 12418                                  ;  894  5654 prs
 12419                                  ;  895  5658 prs
 12420                                  ;  896  5662 printint51
 12421                                  ;  897  5673 printint51
 12422                                  ;  898  5684 prs
 12423                                  ;  899  5688 prs
 12424                                  ;  900  5692 prc
 12425                                  ;  901  5696 adrofname
 12426                                  ;  902  5706 prs
 12427                                  ;  903  5710 prc
 12428                                  ;  904  5714 prunsign1
 12429                                  ;  905  5724 prc
 12430                                  ;  906  5728 prunsign1
 12431                                  ;  907  5738 prc
 12432                                  ;  908  5742 prs
 12433                                  ;  909  5746 prc
 12434                                  ;  910  5750 pint1
 12435                                  ;  911  5756 prs
 12436                                  ;  912  5760 calllisting
 12437                                  ;  913  5772 prs
 12438                                  ;  914  5776 printint51
 12439                                  ;  915  5787 prc
 12440                                  ;  916  5791 prs
 12441                                  ;  917  5795 printint51
 12442                                  ;  918  5806 prc
 12443                                  ;  919  5810 from_far
 12444                                  ;  920  5819 prs
 12445                                  ;  921  5823 adrF
 12446                                  ;  922  5828 from_far
 12447                                  ;  923  5837 eqstr
 12448                                  ;  924  5843 prs
 12449                                  ;  925  5847 countcalls
 12450                                  ;  926  5858 funclisting
 12451                                  ;  927  5870 prs
 12452                                  ;  928  5874 printint51
 12453                                  ;  929  5885 printint51
 12454                                  ;  930  5896 prs
 12455                                  ;  931  5900 printint51
 12456                                  ;  932  5911 prc
 12457                                  ;  933  5915 prs
 12458                                  ;  934  5919 prs
 12459                                  ;  935  5923 prs
 12460                                  ;  936  5927 prs
 12461                                  ;  937  5931 prc
 12462                                  ;  938  5935 prc
 12463                                  ;  939  5939 adrF
 12464                                  ;  940  5944 prs
 12465                                  ;  941  5948 strcpy
 12466                                  ;  942  5955 storefunc
 12467                                  ;  943  5965 prs
 12468                                  ;  944  5969 prs
 12469                                  ;  945  5973 listvar
 12470                                  ;  946  5981 listfunc
 12471                                  ;  947  5990 listcall
 12472                                  ;  948  5999 prs
 12473                                  ;  949  6003 prs
 12474                                  ;  950  6007 prs
 12475                                  ;  951  6011 prs
 12476                                  ;  952  6015 prs
 12477                                  ;  953  6019 printint51
 12478                                  ;  954  6030 prs
 12479                                  ;  955  6034 printint51
 12480                                  ;  956  6045 prs
 12481                                  ;  957  6049 printint51
 12482                                  ;  958  6060 prs
 12483                                  ;  959  6064 printint51
 12484                                  ;  960  6075 prs
 12485                                  ;  961  6079 printint51
 12486                                  ;  962  6090 prs
 12487                                  ;  963  6094 printint51
 12488                                  ;  964  6105 prs
 12489                                  ;  965  6109 printint51
 12490                                  ;  966  6120 prs
 12491                                  ;  967  6124 printint51
 12492                                  ;  968  6135 prs
 12493                                  ;  969  6139 printint51
 12494                                  ;  970  6150 prs
 12495                                  ;  971  6154 printint51
 12496                                  ;  972  6165 prs
 12497                                  ;  973  6169 printint51
 12498                                  ;  974  6180 prs
 12499                                  ;  975  6184 printint51
 12500                                  ;  976  6195 prs
 12501                                  ;  977  6199 prs
 12502                                  ;  978  6203 prunsign1
 12503                                  ;  979  6213 prs
 12504                                  ;  980  6217 printint51
 12505                                  ;  981  6228 prs
 12506                                  ;  982  6232 prs
 12507                                  ;  983  6236 prs
 12508                                  ;  984  6240 prs
 12509                                  ;  985  6244 printint51
 12510                                  ;  986  6255 prs
 12511                                  ;  987  6259 printint51
 12512                                  ;  988  6270 prs
 12513                                  ;  989  6274 printint51
 12514                                  ;  990  6285 prs
 12515                                  ;  991  6289 end1
 12516                                  ;  992  6294 DosInt
 12517                                  ;  993  6301 DosInt
 12518                                  ;Input: A.C, List: A.S,  Lines: 1037
 12519                                  ;Glob. variables:  131 max.:  200
 12520                                  ;Functions      :  112 max.:  300
 12521                                  ;Calls          :  994 max.: 2000, NameField: 6308 max.:    65535
 12522                                  ;Code until     :22520 max.: 30000, free: 7480
 12523                                  ;Data (HeapEnd) :53548, resting stacksize: 11987
 12524                                  ;Max. Const in 'epilog' :  947 max. 3000, free: 2053
